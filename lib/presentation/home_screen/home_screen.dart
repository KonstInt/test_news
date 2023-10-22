import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_news/app/di/locator.dart';
import 'package:test_news/app/l10n/gen/app_localizations.dart';
import 'package:test_news/domain/bloc/news_list_bloc/news_list_bloc.dart';
import 'package:test_news/domain/bloc/top_news_bloc/top_news_bloc.dart';
import 'package:test_news/domain/bloc/user-bloc/user_bloc.dart';
import 'package:test_news/domain/models/news_post_model.dart';
import 'package:test_news/presentation/home_screen/widgets/horizontal_slider_widget.dart';
import 'package:test_news/presentation/home_screen/widgets/vertical_list_top_news.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<UserBloc>()..add(UserLoadEvent()),
          ),
          BlocProvider(
            create: (context) => getIt<NewsListBloc>()
              ..add(
                NewsListLoadEvent(pageSize: 8),
              ),
          ),
          BlocProvider(
            create: (context) => getIt<TopNewsBloc>()
              ..add(
                TopNewsLoadEvent(),
              ),
          )
        ],
        child: Builder(builder: (context) {
          return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.onBackground,
            appBar: AppBar(
              backgroundColor: Theme.of(context).cardColor,
              surfaceTintColor: Theme.of(context).cardColor,
              shadowColor: Theme.of(context).colorScheme.shadow,
              title: Text(
                AppLocalizations.of(context)!.news,
              ),
              actions: [
                BlocBuilder<NewsListBloc, NewsListState>(
                  builder: (context, state) {
                    List<NewsPostModel> posts = [];
                    if (state is NewsListLoadedState) {
                      posts.addAll(state.newsList);
                    }
                    return BlocBuilder<TopNewsBloc, TopNewsState>(
                      builder: (context, state) {
                        if (state is TopNewsLoadedState) {
                          posts.addAll(state.newsList);
                        }
                        return TextButton(
                            onPressed: context.read<NewsListBloc>().state
                                        is NewsListLoadedState &&
                                    context.read<TopNewsBloc>().state
                                        is TopNewsLoadedState
                                ? () => context.read<UserBloc>().add(
                                    UserUpdateReadNewsEvent(readNews: posts))
                                : null,
                            child: Text(
                               AppLocalizations.of(context)!.markAllRead,
                            ));
                      },
                    );
                  },
                )
              ],
            ),
            body: BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UserLoadedState) {
                  Set<String> readIds = state.user.readNews;
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        BlocBuilder<NewsListBloc, NewsListState>(
                          builder: (context, state) {
                            if (state is NewsListLoadedState) {
                              return HorizontalSliderWidget(
                                listModel: state.newsList,
                                readIds: readIds,
                              );
                            }
                            if (state is NewsListEmptyState) {
                              return HorizontalSliderWidget(
                                listModel: state.newsList,
                                readIds: readIds,
                              );
                            }
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        ),
                        BlocBuilder<TopNewsBloc, TopNewsState>(
                          builder: (context, state) {
                            if (state is TopNewsLoadedState) {
                              return VerticalListTopNews(
                                topNews: state.newsList,
                                readIds: readIds,
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        )
                      ],
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          );
        }),
      ),
    );
  }
}
