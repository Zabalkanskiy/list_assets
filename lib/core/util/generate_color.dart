import 'dart:math';
import 'dart:ui';

class GenerateColor {
 static final Random _random = Random();

 static Color generateRandomColor() {

   return Color.fromRGBO(
     _random.nextInt(256),
     _random.nextInt(256),
     _random.nextInt(256),
     .1,
   );
 }

}

