import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:test_news/domain/models/news_post_model.dart';
import 'package:test_news/domain/repository/abstract_news_repository.dart';

part 'news_list_event.dart';
part 'news_list_state.dart';

@injectable
class NewsListBloc extends Bloc<NewsListEvent, NewsListState> {
  final AbstractNewsRepository repository;
  List<NewsPostModel> newsList = [];

  NewsListBloc({required this.repository}) : super(NewsInitial()) {
    on<NewsListLoadEvent>(_onNewsListLoadEvent);

    on<NewsListRefreshEvent>(_onNewsListRefreshEvent);
  }

  FutureOr<void> _onNewsListLoadEvent(
      NewsListLoadEvent event, Emitter<NewsListState> emit) async {
    emit(NewsListLoadingState());
    try {
      final tmpList =
          await repository.getNewsPosts(event.lastId, event.pageSize);
      newsList.addAll(tmpList);

      tmpList.isEmpty
          ? emit(NewsListEmptyState(newsList))
          : emit(NewsListLoadedState(newsList));
    } catch (e) {
      emit(NewsListErrorState());
    }
  }

  FutureOr<void> _onNewsListRefreshEvent(
      NewsListRefreshEvent event, Emitter<NewsListState> emit) {
    newsList = [];
    _onNewsListLoadEvent(NewsListLoadEvent(pageSize: event.pageSize), emit);
  }
}
