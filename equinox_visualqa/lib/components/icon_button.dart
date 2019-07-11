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
            EnumTyped(EqWidgetAppearance.filled, EqWidgetAppearance.values),
        'shape': EnumTyped(EqWidgetShape.rectangle, EqWidgetShape.values),
        'status': EnumTyped(EqWidgetStatus.primary, EqWidgetStatus.values),
        'size': EnumTyped(EqWidgetSize.large, EqWidgetSize.values),
      },
      builder: (_, data) => Center(
            child: EqIconButton(
              icon: EvaIcons.star,
              onTap: data['enabled'] ? onClick : null,
              appearance: data['appearance'],
              shape: data['shape'],
              status: data['status'],
              size: data['size'],
            ),
          ),
    );
  }

  onClick() {
    EqToastService.of(context).pushToast(
      toast: EqToast(
        message: 'I have been clicked!',
        status: EqWidgetStatus.success,
        icon: EvaIcons.star,
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
                    onTap: onClick,
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
                children: EqWidgetStatus.values
                    .map((status) => EqIconButton(
                          onTap: onClick,
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
                children: EqWidgetSize.values.reversed
                    .map((size) => EqIconButton(
                          onTap: onClick,
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
                children: EqWidgetStatus.values
                    .map((status) => EqIconButton(
                          onTap: onClick,
                          icon: EvaIcons.star,
                          status: status,
                          appearance: EqWidgetAppearance.outline,
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
                children: EqWidgetStatus.values
                    .map((status) => EqIconButton(
                          onTap: onClick,
                          icon: EvaIcons.star,
                          status: status,
                          appearance: EqWidgetAppearance.ghost,
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
                children: EqWidgetShape.values
                    .map((shape) => EqIconButton(
                          onTap: onClick,
                          icon: EvaIcons.star,
                          shape: shape,
                        ))
                    .toList(),
              ),
        ),
      ];
}
