import 'package:injectable/injectable.dart';
import 'package:test_news/data/api/models/api_user_model.dart';
import 'package:test_news/data/api/service/user_service.dart';
import 'package:test_news/data/mapper/user_mapper.dart';
import 'package:test_news/domain/models/user_model.dart';

@singleton
class ApiUserUtil {
  UserService userService;
  UserMapper userMapper;
  ApiUserUtil({required this.userMapper, required this.userService});
  Future<UserModel> getUser() async {
    ApiUserModel apiUser = await userService.loadUser();
    return userMapper.getUser(apiUser);
  }

  Future<UserModel> updateUser(List<String> readNews) async {
    ApiUserModel apiUser = await userService.updateUser(readNews);
    return userMapper.getUser(apiUser);
  }
}
