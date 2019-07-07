import 'dart:math';

import 'package:equinox/equinox.dart';
import 'package:equinox_visualqa/state.dart';
import 'package:flutter/material.dart';

class ToastShowcase extends StatefulWidget {
  @override
  _ToastShowcaseState createState() => _ToastShowcaseState();
}

class _ToastShowcaseState extends State<ToastShowcase> {
  @override
  Widget build(BuildContext context) {
    return EqLayout(
      appBar: EqAppBar(
        title: 'Showcase',
        subtitle: 'Toast',
        centerTitle: true,
        actions: [
          EqIconButton(
            icon: EvaIcons.sunOutline,
            onTap: AppState.toggleTheme,
            status: WidgetStatus.basic,
            appearance: WidgetAppearance.ghost,
            size: WidgetSize.large,
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: EqButton(
            label: 'hi',
            onTap: () {
              EqToastService.of(context).pushToast(
                toast: EqToast(
                  message: 'ummmm' + Random.secure().nextInt(10000).toString(),
                  duration: Duration(seconds: 3),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
