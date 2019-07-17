import 'package:equinox/equinox.dart';
import 'package:equinox_visualqa/management/showcase_state.dart';
import 'package:equinox_visualqa/utils.dart';
import 'package:flutter/material.dart';
import 'package:separated_column/separated_column.dart';

class ToastShowcase extends StatefulWidget {
  @override
  _ToastShowcaseState createState() => _ToastShowcaseState();
}

class _ToastShowcaseState extends ShowcaseState<ToastShowcase> {
  @override
  Widget playgroundBuilder() => InteractivePlayground(
        data: {
          'subtitle': BoolTyped(true),
          'icon': BoolTyped(true),
          'status': EnumTyped(EqWidgetStatus.success, EqWidgetStatus.values),
          'shape': EnumTyped(EqWidgetShape.semiRound, EqWidgetShape.values),
        },
        builder: (_, data) {
          return SizedBox(
            width: double.infinity,
            child: EqButton(
              status: data['status'],
              shape: data['shape'],
              label: 'Show toast',
              onTap: () => showToast(
                    EqToast(
                      message: 'A message',
                      subtitle: data['subtitle'] ? 'And a subtitle' : null,
                      icon: data['icon'] ? EvaIcons.star : null,
                      status: data['status'],
                      shape: data['shape'],
                      duration: Duration(seconds: 5),
                    ),
                  ),
            ),
          );
        },
      );

  @override
  String get showcaseName => 'Toasts';

  showToast(EqToast data) {
    EqToastService.of(context).pushToast(toast: data);
  }

  @override
  List<ShowcaseWidgetData> get showcases {
    return [
      ShowcaseWidgetData(
        title: 'Toasts',
        builder: () => EqButton(
              label: 'Show toast',
              onTap: () => showToast(
                    EqToast(
                      message: 'Hi! I am a toast.',
                      subtitle: 'Click me to dismiss!',
                      icon: EvaIcons.star,
                    ),
                  ),
            ),
      ),
      ShowcaseWidgetData(
        title: 'Toast colors',
        builder: () => SeparatedColumn(
              separatorBuilder: (_, i) => SizedBox(height: 8.0),
              children: EqWidgetStatus.values
                  .map((value) => SizedBox(
                      width: double.infinity,
                      child: EqButton(
                        status: value,
                        label: 'Show ${enumToString(value)} toast',
                        onTap: () => showToast(
                              EqToast(
                                message:
                                    'Hi! I am a ${enumToString(value)} toast.',
                                subtitle: 'Click me to dismiss!',
                                status: value,
                                icon: EvaIcons.star,
                              ),
                            ),
                      )))
                  .toList(),
            ),
      ),
      ShowcaseWidgetData(
        title: 'Toast shapes',
        builder: () => SeparatedColumn(
              separatorBuilder: (_, i) => SizedBox(height: 8.0),
              children: EqWidgetShape.values
                  .map((value) => SizedBox(
                      width: double.infinity,
                      child: EqButton(
                        label: 'Show ${enumToString(value)} toast',
                        onTap: () => showToast(
                              EqToast(
                                message:
                                    'Hi! I am a ${enumToString(value)} toast.',
                                subtitle: 'Click me to dismiss!',
                                shape: value,
                                icon: EvaIcons.star,
                              ),
                            ),
                      )))
                  .toList(),
            ),
      ),
    ];
  }
}
