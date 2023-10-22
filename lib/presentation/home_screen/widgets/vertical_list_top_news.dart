import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_news/app/l10n/gen/app_localizations.dart';
import 'package:test_news/domain/bloc/user-bloc/user_bloc.dart';
import 'package:test_news/domain/models/news_post_model.dart';
import 'package:test_news/presentation/home_screen/widgets/news_post.dart';
import 'package:test_news/presentation/news_screen/news_screen.dart';

class VerticalListTopNews extends StatelessWidget {
  final List<NewsPostModel> topNews;
  final Set<String> readIds;
  const VerticalListTopNews(
      {super.key, required this.topNews, required this.readIds});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Text(
            AppLocalizations.of(context)!.topNews,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(), //<--here
            shrinkWrap: true,
            itemCount: topNews.length,
            itemBuilder: (context, index) {
              return InkWell(
                splashColor: Colors.transparent,
                highlightColor: Theme.of(context).colorScheme.background,
                onTap: () {
                  context.read<UserBloc>().add(
                        UserUpdateReadNewsEvent(
                          readNews: [topNews[index]],
                        ),
                      );
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => NewsScreen(news: topNews[index]),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: NewsPost(
                      news: topNews[index],
                      isRead: readIds.contains(topNews[index].id),
                    ),
                  ),
                ),
              );
            }),
      ],
    );
  }
}
