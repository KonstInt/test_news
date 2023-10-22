import 'package:injectable/injectable.dart';
import 'package:test_news/data/api/models/api_user_model.dart';
import 'package:test_news/domain/models/user_model.dart';
@singleton
class UserMapper {
  UserModel getUser(ApiUserModel apiUser) {
    return UserModel(readNews: apiUser.readNews);
  }
}
