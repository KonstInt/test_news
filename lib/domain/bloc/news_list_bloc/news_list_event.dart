part of 'news_list_bloc.dart';

@immutable
sealed class NewsListEvent {}

class NewsListLoadEvent extends NewsListEvent {
  final int? lastId;
  final int pageSize;
  NewsListLoadEvent({this.lastId, required this.pageSize});
}

class NewsListRefreshEvent extends NewsListEvent {
  final int pageSize;
  NewsListRefreshEvent({required this.pageSize});
}
