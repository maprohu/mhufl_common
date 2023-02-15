import 'package:flutter/cupertino.dart';

const paddingSize = 4.0;
const padding = EdgeInsets.all(paddingSize);

extension LayoutWidgetX on Widget {
  Widget withPadding() => Padding(
        padding: padding,
        child: this,
      );

  Widget withPaddingOf(double size) => Padding(
        padding: EdgeInsets.all(size),
        child: this,
      );

  Widget centered() => Center(
        child: this,
      );

  Widget alignBottom() => Align(
        child: this,
        alignment: Alignment.bottomCenter,
      );


}
