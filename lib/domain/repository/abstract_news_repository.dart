import 'package:test_news/domain/models/news_post_model.dart';

abstract class AbstractNewsRepository {
  Future<List<NewsPostModel>> getNewsPosts(int? lastId, int pageSize);
  Future<List<NewsPostModel>> getTopNewsPosts();
}
