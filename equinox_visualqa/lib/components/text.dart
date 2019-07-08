import 'package:equinox/equinox.dart';
import 'package:equinox_visualqa/management/showcase_state.dart';
import 'package:flutter/material.dart';
import 'package:separated_column/separated_column.dart';

class TextShowcase extends StatefulWidget {
  @override
  _TextShowcaseState createState() => _TextShowcaseState();
}

class _TextShowcaseState extends ShowcaseState<TextShowcase> {
  @override
  Widget playgroundBuilder() => SizedBox();

  @override
  String get showcaseName => 'Text';

  List<EqText> get texts => [
        EqText.caption1('Caption 1', context: context),
        EqText.caption2('Caption 2', context: context),
        EqText.heading1('Heading 1', context: context),
        EqText.heading2('Heading 2', context: context),
        EqText.heading3('Heading 3', context: context),
        EqText.heading4('Heading 4', context: context),
        EqText.heading5('Heading 5', context: context),
        EqText.heading6('Heading 6', context: context),
        EqText.label('Label', context: context),
        EqText.paragraph1('Paragraph 1', context: context),
        EqText.paragraph2('Paragraph 2', context: context),
        EqText.subtitle1('Subtitle 1', context: context),
        EqText.subtitle2('Subtitle 2', context: context),
      ];

  @override
  List<ShowcaseWidgetData> get showcases => texts
      .map((text) => ShowcaseWidgetData(
          override: true, builder: () => EqCard(child: text)))
      .toList();
}
