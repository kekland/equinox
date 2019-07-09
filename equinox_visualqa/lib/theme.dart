import 'package:equinox/equinox.dart';

class Theme {
  static Map json = {
    "color-primary-100": "#DDFDF1",
    "color-primary-200": "#BCFCEA",
    "color-primary-300": "#98F6E4",
    "color-primary-400": "#7CEDE2",
    "color-primary-500": "#53E2E0",
    "color-primary-600": "#3CB8C2",
    "color-primary-700": "#298FA2",
    "color-primary-800": "#1A6983",
    "color-primary-900": "#0F4D6C",
    "color-success-100": "#E1FCD9",
    "color-success-200": "#BFF9B5",
    "color-success-300": "#91ED8C",
    "color-success-400": "#6BDC70",
    "color-success-500": "#3FC651",
    "color-success-600": "#2EAA4A",
    "color-success-700": "#1F8E43",
    "color-success-800": "#14723B",
    "color-success-900": "#0C5F35",
    "color-info-100": "#D4EBFF",
    "color-info-200": "#AAD4FF",
    "color-info-300": "#7FBAFF",
    "color-info-400": "#60A2FF",
    "color-info-500": "#2B7CFF",
    "color-info-600": "#1F5FDB",
    "color-info-700": "#1546B7",
    "color-info-800": "#0D3193",
    "color-info-900": "#08227A",
    "color-warning-100": "#FEFCCE",
    "color-warning-200": "#FDFA9E",
    "color-warning-300": "#FBF56E",
    "color-warning-400": "#F7EE4A",
    "color-warning-500": "#F2E610",
    "color-warning-600": "#D0C40B",
    "color-warning-700": "#AEA308",
    "color-warning-800": "#8C8205",
    "color-warning-900": "#746B03",
    "color-danger-100": "#FFE5D8",
    "color-danger-200": "#FFC5B1",
    "color-danger-300": "#FF9E8A",
    "color-danger-400": "#FF7A6D",
    "color-danger-500": "#FF3D3D",
    "color-danger-600": "#DB2C3B",
    "color-danger-700": "#B71E39",
    "color-danger-800": "#931334",
    "color-danger-900": "#7A0B32"
  };

  static EqThemeData get lightTheme {
    // return EqThemeData.loadFromJson(data: json, light: true);
    return EqThemes.defaultLightTheme;
  }

  static EqThemeData get darkTheme {
    // return EqThemeData.loadFromJson(data: json, light: false);
    return EqThemes.defaultDarkTheme;
  }
}
