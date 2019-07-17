# equinox 
[<img src="https://i.imgur.com/oMcxwZ0.png" alt="Eva Design System" height="20px" />](https://eva.design)
[![Pub](https://img.shields.io/pub/vpre/equinox.svg)](https://pub.dev/packages/equinox)


A [**Eva Design**](https://eva.design) implementation in Flutter.

## Screenshots

<p float="left">
  <img src="https://i.imgur.com/nF02pxn.jpg" width="49%" />
  <img src="https://i.imgur.com/OSEEYIj.jpg" width="49%" />
  <img src="https://i.imgur.com/alMhkL8.jpg" width="49%" />
  <img src="https://i.imgur.com/z7UEPAM.jpg" width="49%" />
</p>

## Tutorials and documentation

You can check out the documentation in [**here**](https://pub.dev/documentation/equinox/latest/), and wiki in [**here**](https://github.com/kekland/equinox/wiki).

## Getting started

### Depend on it

Add this to your package's pubspec.yaml file:

```yaml
dependencies:
  equinox: ^0.2.2
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
      theme: EqThemes.defaultLightTheme,
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

## Customization

Customization is done using [stylist](https://github.com/kekland/stylist). I will write a guide on styling your app soon.

## Other Eva Design implementations

- [**Angular**](https://github.com/akveo/nebular)
- [**React Native**](https://github.com/akveo/react-native-ui-kitten)

## Icons

The [Eva Icons Flutter](https://github.com/piyushmaurya23/eva_icons_flutter) package is already integrated into Equinox, so you can use it right away by using `EvaIcons`.

## Credits

- Eva Design Team: [Repository](https://github.com/eva-design/eva)

## Contact me

**E-Mail**: `kk.erzhan@gmail.com`
