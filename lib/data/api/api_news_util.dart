import 'package:injectable/injectable.dart';
import 'package:test_news/data/api/models/api_news_post_model.dart';
import 'package:test_news/data/api/service/news_service.dart';
import 'package:test_news/data/mapper/news_post_mapper.dart';
import 'package:test_news/domain/models/news_post_model.dart';

@singleton
class ApiNewsUtil {
  NewsService newsListService;
  NewsPostMapper newsPostMapper;
  ApiNewsUtil({required this.newsListService, required this.newsPostMapper});
  Future<List<NewsPostModel>> getNewsPosts(int? lastId, int pageSize) async {
    List<ApiNewsPostModel> apiNewsModel =
        await newsListService.getNewsPosts(lastId, pageSize);
    List<NewsPostModel> newsList = [];
    for (int i = 0; i < apiNewsModel.length; i++) {
      newsList.add(newsPostMapper.getNewsPosts(apiNewsModel[i]));
    }
    return newsList;
  }

  Future<List<NewsPostModel>> getTopNewsPosts() async {
    List<ApiNewsPostModel> apiNewsModel =
        await newsListService.getTopNewsPosts();
    List<NewsPostModel> newsList = [];
    for (int i = 0; i < apiNewsModel.length; i++) {
      newsList.add(newsPostMapper.getNewsPosts(apiNewsModel[i]));
    }
    return newsList;
  }
}
