import 'package:equinox/equinox.dart';
import 'package:equinox_visualqa/management/showcase_state.dart';
import 'package:equinox_visualqa/utils.dart';
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

  List<EqText Function(TextState)> get texts => [
        (state) =>
            EqText.caption1('${enumToString(state)} Caption 1', state: state),
        (state) =>
            EqText.caption2('${enumToString(state)} Caption 2', state: state),
        (state) => EqText.label('${enumToString(state)} Label', state: state),
        (state) => EqText.paragraph1('${enumToString(state)} Paragraph 1',
            state: state),
        (state) => EqText.paragraph2('${enumToString(state)} Paragraph 2',
            state: state),
        (state) =>
            EqText.subtitle1('${enumToString(state)} Subtitle 1', state: state),
        (state) =>
            EqText.subtitle2('${enumToString(state)} Subtitle 2', state: state),
        (state) =>
            EqText.heading1('${enumToString(state)} Heading 1', state: state),
        (state) =>
            EqText.heading2('${enumToString(state)} Heading 2', state: state),
        (state) =>
            EqText.heading3('${enumToString(state)} Heading 3', state: state),
        (state) =>
            EqText.heading4('${enumToString(state)} Heading 4', state: state),
        (state) =>
            EqText.heading5('${enumToString(state)} Heading 5', state: state),
        (state) =>
            EqText.heading6('${enumToString(state)} Heading 6', state: state),
      ];

  @override
  List<ShowcaseWidgetData> get showcases => texts
      .map(
        (text) => ShowcaseWidgetData(
              override: true,
              builder: () => EqCard(
                    status: EqWidgetStatus.primary,
                    statusAppearance: CardStatusAppearance.body,
                    child: SeparatedColumn(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                          TextState.values.map((value) => text(value)).toList(),
                      separatorBuilder: (_, i) => SizedBox(height: 16.0),
                    ),
                  ),
            ),
      )
      .toList();
}
