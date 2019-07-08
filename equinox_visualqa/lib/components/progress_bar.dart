import 'package:equinox/equinox.dart';
import 'package:flutter/material.dart';

class ProgressBarShowcase extends StatefulWidget {
  @override
  _ProgressBarShowcaseState createState() => _ProgressBarShowcaseState();
}

class _ProgressBarShowcaseState extends State<ProgressBarShowcase> {
  @override
  Widget build(BuildContext context) {
    return EqLayout(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: EqCard(
            child: EqProgressBar(
              value: 0.25,
              text: '25%',
            ),
          ),
        ),
      ),
    );
  }
}
