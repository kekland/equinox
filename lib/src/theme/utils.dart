import 'package:equinox/equinox.dart';

String generateSelector(List<dynamic> items) {
  List<dynamic> nonNull = items.where((i) => i != null).toList();
  String string = "";

  for (final item in nonNull) {
    string += enumValueToString(item);
    string += "-";
  }

  return string.substring(0, string.length - 1);
}
