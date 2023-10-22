part of 'top_news_bloc.dart';

@immutable
sealed class TopNewsState {}

final class TopNewsInitial extends TopNewsState {}

class TopNewsLoadingState extends TopNewsState {}

class TopNewsLoadedState extends TopNewsState {
  final List<NewsPostModel> newsList;
  TopNewsLoadedState(this.newsList);
}

class TopNewsErrorState extends TopNewsState {}
class TopNewsEmptyState extends TopNewsState {
  final List<NewsPostModel> newsList;
  TopNewsEmptyState(this.newsList);
}
