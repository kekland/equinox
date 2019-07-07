String enumToString(dynamic value) {
  return normalize(value.toString().split('.').last);
}

String normalize(String value) {
  String newString = "";

  for(int i = 0; i < value.length; i++) {
    var char = value[i];
    if(char.toUpperCase() == char) {
      newString += ' $char';
    }
    else if(i == 0) {
      newString += char.toUpperCase();
    }
    else {
      newString += char;
    }
  }
  
  return newString;
}