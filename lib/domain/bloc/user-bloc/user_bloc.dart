import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:test_news/domain/models/news_post_model.dart';
import 'package:test_news/domain/models/user_model.dart';
import 'package:test_news/domain/repository/abstract_user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

@injectable
class UserBloc extends Bloc<UserEvent, UserState> {
  AbstractUserRepository repository;
  late UserModel user;
  UserBloc({required this.repository}) : super(UserInitial()) {
    on<UserLoadEvent>(_onUserLoadEvent);
    on<UserUpdateReadNewsEvent>(_onUserUpdateReadNewsEvent);
  }

  FutureOr<void> _onUserLoadEvent(
      UserLoadEvent event, Emitter<UserState> emit) async {
    emit(UserLoadingState());
    try {
      user = await repository.getUser();
      emit(UserLoadedState(user));
    } catch (e) {
      emit(UserErrorState());
    }
  }

  FutureOr<void> _onUserUpdateReadNewsEvent(
      UserUpdateReadNewsEvent event, Emitter<UserState> emit) async {
    emit(UserLoadingState());
    try {
      List<String> newsIds = [];
      for (NewsPostModel news in event.readNews) {
        newsIds.add(news.id);
      }
      repository.updateUser(readNews: newsIds);
      user.readNews.addAll(newsIds);
      emit(UserLoadedState(user));
    } catch (e) {
      emit(UserErrorState());
    }
  }
}
