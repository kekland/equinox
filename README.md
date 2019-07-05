# equinox 
[<img src="https://i.imgur.com/oMcxwZ0.png" alt="Eva Design System" height="20px" />](https://eva.design)

A [**Eva Design**](https://eva.design) implementation in Flutter.

## Warning

This project is still in development stages. There will be a proper documentation soon.

### Done
`EqTheme`, `EqAppBar`, `EqCard`, `EqTabs`, `EqTextField`, `EqButton`, `EqIconButton`, `EqCheckbox`, `EqToggle`, `EqRadio`, `EqSelect`

### Work in progress
`Stepper`, `Accordion`, `Sidebar`, `Menu`, `Dialog`, `Toast`, `Avatar`, `Spinner`, `Progress Bar`, `Badge`

## Screenshots

<p float="left">
  <img src="https://i.imgur.com/BxyrfHc.jpg" width="49%" />
  <img src="https://i.imgur.com/qquWxVs.jpg" width="49%" />
</p>

## Getting started

### Depend on it

Add this to your package's pubspec.yaml file:

```yaml
dependencies:
  equinox: ^0.0.1
```

### Install it

You can install packages from the command line:

```bash
$ flutter pub get
```

### Import it

Now in your Dart code, you can use:

```dart
import 'package:equinox/equinox.dart';
```

### Setup

You have to replace `MaterialApp` or `CupertinoApp` with `EquinoxApp`.

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EquinoxApp(
      theme: Themes.defaultTheme,
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}
```

Then, instead of a `Scaffold` you have to use `EqLayout`.

```dart
@override
Widget build(BuildContext context) {
  return EqLayout(
    appBar: EqAppBar(
      centerTitle: true,
      title: 'Auth test',
      subtitle: 'v0.0.1',
    ),
    child: MyBody(),
  );
}
```

### Use it

Every widget in **Equinox** is prefixed with `Eq`. For example, `EqButton`, `EqTabs`, etc.

```dart
EqButton(
  appearance: WidgetAppearance.ghost,
  onTap: () {},
  label: 'Log in',
  size: WidgetSize.large,
  status: WidgetStatus.primary,
),
```

## Other Eva Design implementations

- [**Angular**](https://github.com/akveo/nebular)
- [**React Native**](https://github.com/akveo/react-native-ui-kitten)

## Icons

Get the icon pack from [here](https://github.com/piyushmaurya23/eva_icons_flutter).

## Credits

- Eva Design Team: [Repository](https://github.com/eva-design/eva)

## Contact me

**E-Mail**: `kk.erzhan@gmail.com`