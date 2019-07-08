# equinox 
[<img src="https://i.imgur.com/oMcxwZ0.png" alt="Eva Design System" height="20px" />](https://eva.design)
![Pub](https://img.shields.io/pub/vpre/equinox.svg)


A [**Eva Design**](https://eva.design) implementation in Flutter.

## Warning

This project is still in development stages. There will be a proper documentation soon.

### Done
`EqTheme`, `EqAppBar`, `EqCard`, `EqTabs`, `EqTextField`, `EqButton`, `EqIconButton`, `EqCheckbox`, `EqToggle`, `EqRadio`, `EqSelect`, `EqSpinner`, `EqToastService`, `EqDialogService`, `EqProgressBar`, `EqText`

### Work in progress
`Stepper`, `Accordion`, `Sidebar`, `Avatar`, `Badge`

## Screenshots

<p float="left">
  <img src="https://i.imgur.com/nF02pxn.jpg" width="49%" />
  <img src="https://i.imgur.com/OSEEYIj.jpg" width="49%" />
  <img src="https://i.imgur.com/alMhkL8.jpg" width="49%" />
  <img src="https://i.imgur.com/z7UEPAM.jpg" width="49%" />
  <img src="https://i.imgur.com/DJiMafv.jpg" width="24%" />
  <img src="https://i.imgur.com/U7HY0Z3.jpg" width="24%" />
</p>

## Tutorials and documentation

You can check out the documentation in [**here**](https://github.com/kekland/equinox/wiki).

## Getting started

### Depend on it

Add this to your package's pubspec.yaml file:

```yaml
dependencies:
  equinox: ^0.0.12
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
      subtitle: 'v0.0.3',
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

The [Eva Icons Flutter](https://github.com/piyushmaurya23/eva_icons_flutter) package is already integrated into Equinox, so you can use it right away by using `EvaIcons`.

## Credits

- Eva Design Team: [Repository](https://github.com/eva-design/eva)

## Contact me

**E-Mail**: `kk.erzhan@gmail.com`
