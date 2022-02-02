
import 'enum_values.dart';

enum Screens{
  List,
  Grid,
  Settings
}

final screensValues = EnumValues({
"List": 0,
"Grid": 1,
"Settings": 2
});

int screenValue(Screens screen){
  if(screen == Screens.List){
    return 0;
  }
  else if(screen == Screens.Grid){
    return 1;
  }
  else if(screen == Screens.Settings){
    return 2;
  }
  else {
    return 0;
  }
}
