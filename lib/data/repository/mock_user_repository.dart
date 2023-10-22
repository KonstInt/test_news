import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:test_news/data/api/api_user_util.dart';
import 'package:test_news/domain/models/user_model.dart';
import 'package:test_news/domain/repository/abstract_user_repository.dart';

@Singleton(as: AbstractUserRepository)
class MockUserRepository extends AbstractUserRepository {
  @override
  Future<UserModel> getUser() {
    return GetIt.I<ApiUserUtil>().getUser();
  }

  @override
  Future<UserModel> updateUser({required List<String> readNews}) {
    return GetIt.I<ApiUserUtil>().updateUser(readNews);
  }
}
