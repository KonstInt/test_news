import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:test_news/data/api/api_news_util.dart';
import 'package:test_news/domain/models/news_post_model.dart';
import 'package:test_news/domain/repository/abstract_news_repository.dart';

@Singleton(as: AbstractNewsRepository)
class MockNewsRepository extends AbstractNewsRepository{

  @override
  Future<List<NewsPostModel>> getNewsPosts(int? lastId, int pageSize) {
    return GetIt.I<ApiNewsUtil>().getNewsPosts(lastId, pageSize);
  }

  @override
  Future<List<NewsPostModel>> getTopNewsPosts() {
    return GetIt.I<ApiNewsUtil>().getTopNewsPosts();
  }

}