import 'package:equinox/equinox.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool checked = false;

  Widget _buildBody() {
    /*return EqCard(
      shape: EqWidgetShape.semiRound,
      header: Text('Login'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          EqTextField(
            label: 'Username',
            shape: EqWidgetShape.semiRound,
            hint: 'Username',
            icon: EvaIcons.emailOutline,
            iconPosition: EqPositioning.right,
            enabled: false,
          ),
          SizedBox(height: 16.0),
          EqTextField(
            label: 'Password',
            shape: EqWidgetShape.semiRound,
            hint: 'Password',
            icon: EvaIcons.lockOutline,
            iconPosition: EqPositioning.right,
            obscureText: true,
          ),
          SizedBox(height: 16.0),
          EqSelect(
            label: 'Select',
            hint: 'Select',
            shape: EqWidgetShape.semiRound,
            items: [
              EqSelectItem(
                  title: 'Option 1',
                  value: '1',
                  icon: EvaIcons.star,
                  subtitle: 'Option 1'),
              EqSelectItem(
                  title: 'Option 2',
                  value: '2',
                  icon: EvaIcons.archive,
                  subtitle: 'Option 2'),
            ],
            onSelect: (v) {
              print(v);
            },
          ),
          SizedBox(height: 16.0),
          EqCheckbox(
            value: checked,
            onChanged: (v) => setState(() => checked = v),
            description: 'Remember me',
            shape: EqWidgetShape.rectangle,
          ),
        ],
      ),
      footerPadding: EdgeInsets.zero,
      footer: EqButton(
        appearance: EqWidgetAppearance.ghost,
        onTap: () {},
        label: 'Log in',
        size: EqWidgetSize.large,
        status: EqWidgetStatus.primary,
      ),
    );*/
  }

  @override
  Widget build(BuildContext context) {
    /*return EqLayout(
      appBar: EqAppBar(
        centerTitle: true,
        title: 'Auth test',
        subtitle: 'v0.0.3',
        bottom: EqTabs(
          defaultSelected: 0,
          onSelect: (v) {},
          tabs: [
            EqTabData(
              icon: EvaIcons.star,
              title: 'Tab 1',
            ),
            EqTabData(
              icon: EvaIcons.star,
              title: 'Tab 2',
            ),
            EqTabData(
              icon: EvaIcons.star,
              title: 'Tab 3',
            ),
            EqTabData(
              icon: EvaIcons.star,
              title: 'Tab 4',
            ),
          ],
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _buildBody(),
        ),
      ),
    );*/
  }
}
