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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: EqToastWidget(
                data: EqToast(
                  icon: EvaIcons.checkmark,
                  message: 'Purchase completed',
                  subtitle: 'Click to check your inventory',
                  onTap: () {},
                  status: WidgetStatus.success,
                  shape: WidgetShape.semiRound,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
