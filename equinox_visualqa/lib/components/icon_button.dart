import 'package:equinox/equinox.dart';
import 'package:flutter/material.dart';
import 'package:equinox_visualqa/management/showcase_state.dart';

class IconButtonShowcase extends StatefulWidget {
  @override
  _IconButtonShowcaseState createState() => _IconButtonShowcaseState();
}

class _IconButtonShowcaseState extends ShowcaseState<IconButtonShowcase> {
  @override
  InteractivePlayground playgroundBuilder() {
    return InteractivePlayground(
      data: {
        'enabled': BoolTyped(true),
        'appearance':
            EnumTyped(WidgetAppearance.filled, WidgetAppearance.values),
        'shape': EnumTyped(WidgetShape.rectangle, WidgetShape.values),
        'status': EnumTyped(WidgetStatus.primary, WidgetStatus.values),
        'size': EnumTyped(WidgetSize.large, WidgetSize.values),
      },
      builder: (_, data) => Center(
            child: EqIconButton(
              icon: EvaIcons.star,
              onTap: data['enabled'] ? () {} : null,
              appearance: data['appearance'],
              shape: data['shape'],
              status: data['status'],
              size: data['size'],
            ),
          ),
    );
  }

  @override
  String get showcaseName => 'Buttons';

  @override
  List<ShowcaseWidgetData> get showcases => [
        ShowcaseWidgetData(
          title: 'IconButton',
          builder: () => Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                alignment: WrapAlignment.start,
                children: [
                  EqIconButton(
                    onTap: () {},
                    icon: EvaIcons.star,
                  ),
                  EqIconButton(
                    onTap: null,
                    icon: EvaIcons.star,
                  ),
                ],
              ),
        ),
        ShowcaseWidgetData(
          title: 'IconButton colors',
          builder: () => Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                alignment: WrapAlignment.start,
                children: WidgetStatus.values
                    .map((status) => EqIconButton(
                          onTap: () {},
                          icon: EvaIcons.star,
                          status: status,
                        ))
                    .toList(),
              ),
        ),
        ShowcaseWidgetData(
          title: 'IconButton sizes',
          builder: () => Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                alignment: WrapAlignment.start,
                children: WidgetSize.values.reversed
                    .map((size) => EqIconButton(
                          onTap: () {},
                          icon: EvaIcons.star,
                          size: size,
                        ))
                    .toList(),
              ),
        ),
        ShowcaseWidgetData(
          title: 'IconButton outline',
          builder: () => Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                alignment: WrapAlignment.start,
                children: WidgetStatus.values
                    .map((status) => EqIconButton(
                          onTap: () {},
                          icon: EvaIcons.star,
                          status: status,
                          appearance: WidgetAppearance.outline,
                        ))
                    .toList(),
              ),
        ),
        ShowcaseWidgetData(
          title: 'IconButton ghost',
          builder: () => Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                alignment: WrapAlignment.start,
                children: WidgetStatus.values
                    .map((status) => EqIconButton(
                          onTap: () {},
                          icon: EvaIcons.star,
                          status: status,
                          appearance: WidgetAppearance.ghost,
                        ))
                    .toList(),
              ),
        ),
        ShowcaseWidgetData(
          title: 'IconButton shapes',
          builder: () => Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                alignment: WrapAlignment.start,
                children: WidgetShape.values
                    .map((shape) => EqIconButton(
                          onTap: () {},
                          icon: EvaIcons.star,
                          shape: shape,
                        ))
                    .toList(),
              ),
        ),
      ];
}
