import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:test_news/data/api/models/api_news_post_model.dart';
import 'package:test_news/domain/models/news_post_model.dart';
@singleton
class NewsPostMapper {
  NewsPostMapper();
  NewsPostModel getNewsPosts(ApiNewsPostModel apiNews) {
    return NewsPostModel(
      id: apiNews.id,
      imageLink: apiNews.imageLink,
      title: apiNews.title,
      subtitle: apiNews.subtitle,
      text: apiNews.text,
      dateCreated: DateFormat("dd.MM.yyyy").parse(apiNews.dateCreated),
    );
  }
}
