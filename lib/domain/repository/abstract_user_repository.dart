import 'package:test_news/domain/models/user_model.dart';

abstract class AbstractUserRepository {
  Future<UserModel> getUser();
  Future<UserModel> updateUser({required List<String> readNews});
}
