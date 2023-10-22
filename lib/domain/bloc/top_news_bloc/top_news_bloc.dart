import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:test_news/domain/models/news_post_model.dart';
import 'package:test_news/domain/repository/abstract_news_repository.dart';

part 'top_news_event.dart';
part 'top_news_state.dart';

@injectable
class TopNewsBloc extends Bloc<TopNewsEvent, TopNewsState> {
  final AbstractNewsRepository repository;
  List<NewsPostModel> topNews = [];
  TopNewsBloc(this.repository) : super(TopNewsInitial()) {
    on<TopNewsLoadEvent>(_onTopNewsLoadEvent);
    on<TopNewsRefreshEvent>(_onTopNewsRefreshEvent);
  }

  FutureOr<void> _onTopNewsLoadEvent(
      TopNewsLoadEvent event, Emitter<TopNewsState> emit) async {
    emit(TopNewsLoadingState());
    try {
      topNews = await repository.getTopNewsPosts();
      emit(TopNewsLoadedState(topNews));
    } catch (e) {
      emit(TopNewsErrorState());
    }
  }

  FutureOr<void> _onTopNewsRefreshEvent(
      TopNewsRefreshEvent event, Emitter<TopNewsState> emit) {
    topNews = [];
    _onTopNewsLoadEvent(TopNewsLoadEvent(), emit);
  }
}
