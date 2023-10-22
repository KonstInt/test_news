part of 'news_list_bloc.dart';

@immutable
sealed class NewsListState {}

final class NewsInitial extends NewsListState {}

class NewsListLoadingState extends NewsListState {}

class NewsListLoadedState extends NewsListState {
  final List<NewsPostModel> newsList;
  NewsListLoadedState(this.newsList);
}

class NewsListErrorState extends NewsListState {}

class NewsListEmptyState extends NewsListState {
  final List<NewsPostModel> newsList;
  NewsListEmptyState(this.newsList);
}
