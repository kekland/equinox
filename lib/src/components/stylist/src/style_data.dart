import 'package:flutter/material.dart';

class StyleData {
  final Map<String, dynamic> _data;

  StyleData(Map<String, dynamic> data)
      : this._data = _StyleHandler.handleNewData(data: data);

  factory StyleData.empty() {
    return StyleData({});
  }

  StyleData fork() {
    return StyleData(Map.from(_data));
  }

  inject(StyleData other) {
    this._data.addAll(other._data);
  }

  set(String key, dynamic value) {
    _data[key] = value;
  }

  dynamic get(String key) {
    return _StyleHandler.handleValue(style: this, value: _data[key]);
  }
}

class _StyleHandler {
  static Map<String, dynamic> handleNewData({Map data}) {
    return data.map((key, value) {
      var newValue = value;
      newValue = _ValueUtils.convertToColorFromString(value) ?? newValue;
      return MapEntry(key, newValue);
    });
  }

  static handleValue({StyleData style, dynamic value}) {
    if (value is String) {
      return style.get(value) ?? value;
    } else if (value is dynamic Function(StyleData)) {
      return value(style);
    } else {
      return value;
    }
  }
}

class _ValueUtils {
  static Color convertToColorFromString(dynamic value) {
    if (value is String && value.length == 7 && value[0] == '#') {
      final intValue = int.parse(value.substring(1), radix: 16);
      return Color(intValue).withOpacity(1.0);
    }
    return null;
  }
}
