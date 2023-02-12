import 'package:flutter/cupertino.dart';

const padding = EdgeInsets.all(4);

extension LayoutWidgetX on Widget {
  Widget withPadding() => Padding(
        padding: padding,
        child: this,
      );
}
