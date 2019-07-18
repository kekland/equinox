import 'package:equinox/equinox.dart';
import 'package:flutter/material.dart';
import 'package:equinox_visualqa/management/showcase_state.dart';
import 'package:equinox_visualqa/utils.dart';

class ButtonShowcase extends StatefulWidget {
  @override
  _ButtonShowcaseState createState() => _ButtonShowcaseState();
}

class _ButtonShowcaseState extends ShowcaseState<ButtonShowcase> {
  @override
  InteractivePlayground playgroundBuilder() {
    return InteractivePlayground(
      data: {
        'enabled': BoolTyped(true),
        'leadingIconEnabled': BoolTyped(false),
        'trailingIconEnabled': BoolTyped(false),
        'fluid': BoolTyped(false),
        'iconPosition': EnumTyped(EqPositioning.left, EqPositioning.values),
        'appearance':
            EnumTyped(EqWidgetAppearance.filled, EqWidgetAppearance.values),
        'shape': EnumTyped(EqWidgetShape.rectangle, EqWidgetShape.values),
        'status': EnumTyped(EqWidgetStatus.primary, EqWidgetStatus.values),
        'size': EnumTyped(EqWidgetSize.large, EqWidgetSize.values),
      },
      builder: (_, data) => EqButton(
        onTap: data['enabled'] ? onClick : null,
        appearance: data['appearance'],
        leading: data['leadingIconEnabled'] ? EqIcon(EvaIcons.star) : null,
        trailing: data['trailingIconEnabled'] ? EqIcon(EvaIcons.star) : null,
        label: Text('Button'),
        shape: data['shape'],
        status: data['status'],
        size: data['size'],
        fluid: data['fluid'],
      ),
    );
  }

  @override
  String get showcaseName => 'Buttons';

  onClick() {
    /*EqToastService.of(context).pushToast(
      toast: EqToast(
        message: 'I have been clicked!',
        status: WidgetStatus.success,
        icon: EvaIcons.star,
      ),
    );*/
  }

  @override
  List<ShowcaseWidgetData> get showcases => [
        ShowcaseWidgetData(
          title: 'Buttons',
          builder: () => Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            alignment: WrapAlignment.start,
            children: [
              EqButton(onTap: onClick, label: Text('Active')),
              EqButton(onTap: null, label: Text('Disabled')),
            ],
          ),
        ),
        ShowcaseWidgetData(
          title: 'Button colors',
          builder: () => Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            alignment: WrapAlignment.start,
            children: [
              ...(EqWidgetStatus.values
                  .map((status) => EqButton.filled(
                        onTap: onClick,
                        label: Text(enumToString(status)),
                        status: status,
                      ))
                  .toList()),
              ...(EqWidgetStatus.values
                  .map((status) => EqButton.filled(
                        onTap: null,
                        label: Text('${enumToString(status)} disabled'),
                        status: status,
                      ))
                  .toList()),
            ],
          ),
        ),
        ShowcaseWidgetData(
          title: 'Button sizes',
          builder: () => Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            alignment: WrapAlignment.start,
            children: EqWidgetSize.values.reversed
                .map((size) => EqButton(
                      onTap: onClick,
                      label: Text(enumToString(size)),
                      size: size,
                    ))
                .toList(),
          ),
        ),
        ShowcaseWidgetData(
          title: 'Outline button',
          builder: () => Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            alignment: WrapAlignment.start,
            children: [
              ...(EqWidgetStatus.values
                  .map((status) => EqButton.outline(
                        onTap: onClick,
                        label: Text(enumToString(status)),
                        status: status,
                      ))
                  .toList()),
              ...(EqWidgetStatus.values
                  .map((status) => EqButton.outline(
                        onTap: null,
                        label: Text('${enumToString(status)} disabled'),
                        status: status,
                      ))
                  .toList()),
            ],
          ),
        ),
        ShowcaseWidgetData(
          title: 'Ghost button',
          builder: () => Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            alignment: WrapAlignment.start,
            children: [
              ...(EqWidgetStatus.values
                  .map((status) => EqButton.ghost(
                        onTap: onClick,
                        label: Text(enumToString(status)),
                        status: status,
                      ))
                  .toList()),
              ...(EqWidgetStatus.values
                  .map((status) => EqButton.ghost(
                        onTap: null,
                        label: Text('${enumToString(status)} disabled'),
                        status: status,
                      ))
                  .toList()),
            ],
          ),
        ),
        ShowcaseWidgetData(
          title: 'Button shapes',
          builder: () => Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            alignment: WrapAlignment.start,
            children: EqWidgetShape.values
                .map((shape) => EqButton(
                      onTap: onClick,
                      label: Text(enumToString(shape)),
                      shape: shape,
                    ))
                .toList(),
          ),
        ),
        ShowcaseWidgetData(
          title: 'Button with icon',
          builder: () => Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            alignment: WrapAlignment.start,
            children: [
              EqButton(
                onTap: onClick,
                label: Text('Only leading'),
                leading: EqIcon(EvaIcons.star),
              ),
              EqButton(
                onTap: onClick,
                label: Text('Only trailing'),
                trailing: EqIcon(EvaIcons.star),
              ),
              EqButton(
                onTap: onClick,
                label: Text('Both'),
                leading: EqIcon(EvaIcons.star),
                trailing: EqIcon(EvaIcons.star),
              ),
            ],
          ),
        ),
        ShowcaseWidgetData(
          title: 'Fluid button',
          builder: () => Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            alignment: WrapAlignment.start,
            children: [
              EqButton(
                onTap: onClick,
                label: Text('Only leading'),
                leading: EqIcon(EvaIcons.star),
                fluid: true,
              ),
              EqButton(
                onTap: onClick,
                label: Text('Only trailing'),
                trailing: EqIcon(EvaIcons.star),
                fluid: true,
              ),
              EqButton(
                onTap: onClick,
                label: Text('Both'),
                leading: EqIcon(EvaIcons.star),
                trailing: EqIcon(EvaIcons.star),
                fluid: true,
              ),
            ],
          ),
        ),
        ShowcaseWidgetData(
          title: 'Fluid button with itemAlignment set',
          builder: () => Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            alignment: WrapAlignment.start,
            children: MainAxisAlignment.values
                .map(
                  (value) => EqButton(
                    onTap: onClick,
                    label: Text(enumToString(value)),
                    leading: EqIcon(EvaIcons.star),
                    trailing: EqIcon(EvaIcons.star),
                    fluid: true,
                    itemAlignment: value,
                  ),
                )
                .toList(),
          ),
        ),
      ];
}
