import 'package:flutter/material.dart';
import 'package:test_news/app/l10n/gen/app_localizations.dart';
import 'package:test_news/domain/models/news_post_model.dart';
import 'package:test_news/presentation/home_screen/widgets/horizontal_slider.dart';

class HorizontalSliderWidget extends StatelessWidget {
  final List<NewsPostModel> listModel;
  final Set<String> readIds;
  const HorizontalSliderWidget(
      {required this.listModel, super.key, required this.readIds});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (listModel.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    AppLocalizations.of(context)!.allNews,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
            ],
          ),
        ),
        HorizontalSlider(
          cards: listModel,
          readIds: readIds,
        ),
      ],
    );
  }
}
