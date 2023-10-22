import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_news/domain/bloc/user-bloc/user_bloc.dart';
import 'package:test_news/domain/models/news_post_model.dart';
import 'package:test_news/presentation/home_screen/widgets/news_post.dart';
import 'package:test_news/presentation/news_screen/news_screen.dart';

class HorizontalSlider extends StatelessWidget {
  final List<NewsPostModel> cards;
  final Set<String> readIds;
  const HorizontalSlider({
    required this.cards,
    required this.readIds,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: CarouselSlider(
        items: cards
            .map(
              (e) => InkWell(
                splashColor: Colors.transparent,
                highlightColor: Theme.of(context).colorScheme.background,
                onTap: () {
                  context
                      .read<UserBloc>()
                      .add(UserUpdateReadNewsEvent(readNews: [e]));
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => NewsScreen(news: e)));
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    left: e == cards[0] ? 0 : 8,
                    right: e == cards[cards.length - 1] ? 0 : 8,
                    top: 10,
                    bottom: 10,
                  ),
                  child: NewsPost(
                    news: e,
                    isRead: readIds.contains(e.id),
                  ),
                ),
              ),
            )
            .toList()
            .cast<Widget>(),
        options: CarouselOptions(
          viewportFraction: 0.9,
          initialPage: 0,
          aspectRatio: .92,
          enableInfiniteScroll: false,
        ),
      ),
    );
  }
}
