part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

class UserLoadEvent extends UserEvent{}
class UserUpdateReadNewsEvent extends UserEvent{
  final List<NewsPostModel> readNews;
   UserUpdateReadNewsEvent({required this.readNews});
}