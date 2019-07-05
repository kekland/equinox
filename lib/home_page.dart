import 'package:eva_design_flutter/components/icon_button/icon_button.dart';
import 'package:eva_design_flutter/eva_design_flutter.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool checked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Themes.darkTheme.basic.shade1100,
      child: EqLayout(
        appBar: EqAppBar(
          centerTitle: true,
          title: 'Auth test',
          subtitle: 'v0.0.1',
          bottom: EqTabs(
            defaultSelected: 0,
            onSelect: (v) {},
            tabs: [
              EqTabData(
                icon: EvaIcons.activityOutline,
                title: 'Tab 1',
              ),
              EqTabData(
                icon: EvaIcons.alertCircleOutline,
                title: 'Tab 2',
              ),
              EqTabData(
                icon: EvaIcons.imageOutline,
                title: 'Tab 3',
              ),
              EqTabData(
                icon: EvaIcons.inboxOutline,
                title: 'Tab 4',
              ),
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: EqCard(
              shape: WidgetShape.semiRound,
              header: Text('Login'),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  EqTextField(
                    label: 'Username',
                    shape: WidgetShape.semiRound,
                    hint: 'Username',
                    icon: EvaIcons.emailOutline,
                    iconPosition: Positioning.right,
                    enabled: false,
                  ),
                  SizedBox(height: 16.0),
                  EqTextField(
                    label: 'Password',
                    shape: WidgetShape.semiRound,
                    hint: 'Password',
                    icon: EvaIcons.lockOutline,
                    iconPosition: Positioning.right,
                    obscureText: true,
                  ),
                  SizedBox(height: 16.0),
                  EqSelect(
                    label: 'Gender',
                    hint: 'Gender',
                    shape: WidgetShape.semiRound,
                    items: [],
                    description: 'aaaaaaaaa',
                    onSelect: (v) {},
                  ),
                  SizedBox(height: 16.0),
                  EqCheckbox(
                    value: checked,
                    onChanged: (v) => setState(() => checked = v),
                    description: 'Remember me',
                    shape: WidgetShape.rectangle,
                  ),
                  SizedBox(height: 16.0),
                  SizedBox(
                    width: double.infinity,
                    child: EqRadio(
                      onSelected: () => setState(() => checked = !checked),
                      value: checked,
                      description: 'Radio 1',
                    ),
                  ),
                  SizedBox(height: 16.0),
                  EqToggle(
                    value: checked,
                    onChanged: (v) => setState(() => checked = v),
                    shape: WidgetShape.rectangle,
                  ),
                ],
              ),
              footerPadding: EdgeInsets.zero,
              footer: EqButton(
                appearance: WidgetAppearance.ghost,
                onTap: () {},
                label: 'Log in',
                size: WidgetSize.large,
                status: WidgetStatus.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
