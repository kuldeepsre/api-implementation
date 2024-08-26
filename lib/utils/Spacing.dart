import 'package:flutter/material.dart';

class Spacing {
  // Common margin and padding values
  static const EdgeInsets margin2 = EdgeInsets.all(2.0);
  static const EdgeInsets margin4 = EdgeInsets.all(4.0);
  static const EdgeInsets margin6 = EdgeInsets.all(6.0);
  static const EdgeInsets margin8 = EdgeInsets.all(8.0);
  static const EdgeInsets margin10 = EdgeInsets.all(10.0);
  static const EdgeInsets margin12 = EdgeInsets.all(12.0);
  static const EdgeInsets margin14 = EdgeInsets.all(14.0);
  static const EdgeInsets margin16 = EdgeInsets.all(16.0);
  static const EdgeInsets margin18 = EdgeInsets.all(18.0);
  static const EdgeInsets margin20 = EdgeInsets.all(20.0);
  static const EdgeInsets margin22 = EdgeInsets.all(22.0);
  static const EdgeInsets margin24 = EdgeInsets.all(24.0);
  static const EdgeInsets margin26 = EdgeInsets.all(26.0);
  static const EdgeInsets margin28 = EdgeInsets.all(28.0);
  static const EdgeInsets margin30 = EdgeInsets.all(30.0);
  static const EdgeInsets margin32 = EdgeInsets.all(32.0);
  static const double defaultPadding = 16.0;
  // Margin with only vertical or horizontal spacing
  static const EdgeInsets vertical2 = EdgeInsets.symmetric(vertical: 2.0);
  static const EdgeInsets vertical4 = EdgeInsets.symmetric(vertical: 4.0);
  static const EdgeInsets vertical6 = EdgeInsets.symmetric(vertical: 6.0);
  static const EdgeInsets vertical8 = EdgeInsets.symmetric(vertical: 8.0);
  static const EdgeInsets vertical10 = EdgeInsets.symmetric(vertical: 10.0);
  static const EdgeInsets vertical12 = EdgeInsets.symmetric(vertical: 12.0);
  static const EdgeInsets vertical14 = EdgeInsets.symmetric(vertical: 14.0);
  static const EdgeInsets vertical16 = EdgeInsets.symmetric(vertical: 16.0);
  static const EdgeInsets vertical18 = EdgeInsets.symmetric(vertical: 18.0);
  static const EdgeInsets vertical20 = EdgeInsets.symmetric(vertical: 20.0);
  static const EdgeInsets vertical22 = EdgeInsets.symmetric(vertical: 22.0);
  static const EdgeInsets vertical24 = EdgeInsets.symmetric(vertical: 24.0);
  static const EdgeInsets vertical26 = EdgeInsets.symmetric(vertical: 26.0);
  static const EdgeInsets vertical28 = EdgeInsets.symmetric(vertical: 28.0);
  static const EdgeInsets vertical30 = EdgeInsets.symmetric(vertical: 30.0);
  static const EdgeInsets vertical32 = EdgeInsets.symmetric(vertical: 32.0);

  static const EdgeInsets horizontal2 = EdgeInsets.symmetric(horizontal: 2.0);
  static const EdgeInsets horizontal4 = EdgeInsets.symmetric(horizontal: 4.0);
  static const EdgeInsets horizontal6 = EdgeInsets.symmetric(horizontal: 6.0);
  static const EdgeInsets horizontal8 = EdgeInsets.symmetric(horizontal: 8.0);
  static const EdgeInsets horizontal10 = EdgeInsets.symmetric(horizontal: 10.0);
  static const EdgeInsets horizontal12 = EdgeInsets.symmetric(horizontal: 12.0);
  static const EdgeInsets horizontal14 = EdgeInsets.symmetric(horizontal: 14.0);
  static const EdgeInsets horizontal16 = EdgeInsets.symmetric(horizontal: 16.0);
  static const EdgeInsets horizontal18 = EdgeInsets.symmetric(horizontal: 18.0);
  static const EdgeInsets horizontal20 = EdgeInsets.symmetric(horizontal: 20.0);
  static const EdgeInsets horizontal22 = EdgeInsets.symmetric(horizontal: 22.0);
  static const EdgeInsets horizontal24 = EdgeInsets.symmetric(horizontal: 24.0);
  static const EdgeInsets horizontal26 = EdgeInsets.symmetric(horizontal: 26.0);
  static const EdgeInsets horizontal28 = EdgeInsets.symmetric(horizontal: 28.0);
  static const EdgeInsets horizontal30 = EdgeInsets.symmetric(horizontal: 30.0);
  static const EdgeInsets horizontal32 = EdgeInsets.symmetric(horizontal: 32.0);

  // Margin with individual side spacing
  static EdgeInsets allSides({double all = 8.0}) {
    return EdgeInsets.all(all);
  }

  static EdgeInsets onlyLeft({double left = 8.0}) {
    return EdgeInsets.only(left: left);
  }

  static EdgeInsets onlyRight({double right = 8.0}) {
    return EdgeInsets.only(right: right);
  }

  static EdgeInsets onlyTop({double top = 8.0}) {
    return EdgeInsets.only(top: top);
  }

  static EdgeInsets onlyBottom({double bottom = 8.0}) {
    return EdgeInsets.only(bottom: bottom);
  }
}
