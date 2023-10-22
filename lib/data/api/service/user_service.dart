import 'package:injectable/injectable.dart';
import 'package:test_news/data/api/models/api_user_model.dart';

@singleton
class UserService {
  Future<ApiUserModel> loadUser() async {
    await Future.delayed(const Duration(seconds: 2));
    return _user;
  }

  Future<ApiUserModel> updateUser(List<String> readNews) async {
     _user.readNews.addAll(readNews);
    return loadUser();
  }
  final ApiUserModel _user = ApiUserModel(readNews: {'1'});
}
