part of 'top_news_bloc.dart';

@immutable
sealed class TopNewsEvent {}

class TopNewsRefreshEvent extends TopNewsEvent {
  TopNewsRefreshEvent();
}
class TopNewsLoadEvent extends TopNewsEvent {
  TopNewsLoadEvent();
}
