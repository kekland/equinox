import 'package:equinox/equinox.dart';
import 'package:equinox_visualqa/management/showcase_state.dart';
import 'package:equinox_visualqa/utils.dart';
import 'package:flutter/material.dart';
import 'package:separated_column/separated_column.dart';

String equinoxDescription =
    "An equinox is commonly regarded as the instant of time when the plane (extended indefinitely in all directions) of Earth's equator passes through the center of the Sun.";

class DialogShowcase extends StatefulWidget {
  @override
  _DialogShowcaseState createState() => _DialogShowcaseState();
}

class _DialogShowcaseState extends ShowcaseState<DialogShowcase> {
  @override
  Widget playgroundBuilder() => SizedBox();

  @override
  String get showcaseName => 'Dialogs';

  @override
  List<ShowcaseWidgetData> get showcases => [
        ShowcaseWidgetData(
          title: 'Dialogs',
          builder: () {
            return SeparatedColumn(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: EqButton(
                    label: 'Open information dialog',
                    status: EqWidgetStatus.info,
                    onTap: () {
                      EqDialogService.of(context).pushInformationDialog(
                        context: context,
                        title: 'A title',
                        body: Text(equinoxDescription),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: EqButton(
                    label: 'Open dialog with actions',
                    status: EqWidgetStatus.primary,
                    onTap: () {
                      EqDialogService.of(context).pushDialog(
                        context: context,
                        title: 'A title',
                        body: Text(equinoxDescription),
                        status: EqWidgetStatus.success,
                        actions: [
                          EqButton(
                            appearance: EqWidgetAppearance.ghost,
                            label: 'No',
                            status: EqWidgetStatus.danger,
                            onTap: () => Navigator.pop(context),
                          ),
                          EqButton(
                            appearance: EqWidgetAppearance.ghost,
                            label: 'Yes',
                            status: EqWidgetStatus.primary,
                            onTap: () => Navigator.pop(context),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: EqButton(
                    label: 'Open loading dialog',
                    status: EqWidgetStatus.success,
                    onTap: () {
                      EqDialogService.of(context).pushLoadingDialog(
                        context: context,
                        status: EqWidgetStatus.success,
                      );
                    },
                  ),
                ),
              ],
              separatorBuilder: (_, i) => SizedBox(height: 16.0),
            );
          },
        ),
        ShowcaseWidgetData(
          title: 'Dialog colors',
          builder: () {
            return SeparatedColumn(
              children: EqWidgetStatus.values
                  .map(
                    (value) => SizedBox(
                          width: double.infinity,
                          child: EqButton(
                            label: 'Open ${enumToString(value)} dialog',
                            status: value,
                            onTap: () {
                              EqDialogService.of(context).pushInformationDialog(
                                status: value,
                                context: context,
                                title: enumToString(value),
                                body: Text(equinoxDescription),
                              );
                            },
                          ),
                        ),
                  )
                  .toList(),
              separatorBuilder: (_, i) => SizedBox(height: 16.0),
            );
          },
        ),
        ShowcaseWidgetData(
          title: 'Loading dialog colors',
          builder: () {
            return SeparatedColumn(
              children: EqWidgetStatus.values
                  .map(
                    (value) => SizedBox(
                          width: double.infinity,
                          child: EqButton(
                            label: 'Open ${enumToString(value)} loading dialog',
                            status: value,
                            onTap: () {
                              EqDialogService.of(context).pushLoadingDialog(
                                status: value,
                                context: context,
                              );
                            },
                          ),
                        ),
                  )
                  .toList(),
              separatorBuilder: (_, i) => SizedBox(height: 16.0),
            );
          },
        ),
      ];
}
