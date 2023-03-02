// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'widgets.dart';

// **************************************************************************
// ConfGenerator
// **************************************************************************

class RadioListTile$Conf<T> {
  RadioListTile$Conf({
    this.key,
    required this.value,
    this.groupValue,
    this.onChanged,
    required this.toggleable,
    this.activeColor,
    this.title,
    this.subtitle,
    required this.isThreeLine,
    this.dense,
    this.secondary,
    required this.selected,
    required this.controlAffinity,
    required this.autofocus,
    this.contentPadding,
    this.shape,
    this.tileColor,
    this.selectedTileColor,
    this.visualDensity,
    this.focusNode,
    this.onFocusChange,
    this.enableFeedback,
  });
  final Key? key;
  final T value;
  final T? groupValue;
  final void Function(T?)? onChanged;
  final bool toggleable;
  final Color? activeColor;
  final Widget? title;
  final Widget? subtitle;
  final bool isThreeLine;
  final bool? dense;
  final Widget? secondary;
  final bool selected;
  final ListTileControlAffinity controlAffinity;
  final bool autofocus;
  final EdgeInsetsGeometry? contentPadding;
  final ShapeBorder? shape;
  final Color? tileColor;
  final Color? selectedTileColor;
  final VisualDensity? visualDensity;
  final FocusNode? focusNode;
  final void Function(bool)? onFocusChange;
  final bool? enableFeedback;
}

extension RadioListTile$Conf$Ext<T> on RadioListTile$Conf<T> {
  RadioListTile<T> create() => RadioListTile(
        key: key,
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        toggleable: toggleable,
        activeColor: activeColor,
        title: title,
        subtitle: subtitle,
        isThreeLine: isThreeLine,
        dense: dense,
        secondary: secondary,
        selected: selected,
        controlAffinity: controlAffinity,
        autofocus: autofocus,
        contentPadding: contentPadding,
        shape: shape,
        tileColor: tileColor,
        selectedTileColor: selectedTileColor,
        visualDensity: visualDensity,
        focusNode: focusNode,
        onFocusChange: onFocusChange,
        enableFeedback: enableFeedback,
      );
  RadioListTile$Conf<T> copyWith({
    Key? key,
    T? value,
    T? groupValue,
    void Function(T?)? onChanged,
    bool? toggleable,
    Color? activeColor,
    Widget? title,
    Widget? subtitle,
    bool? isThreeLine,
    bool? dense,
    Widget? secondary,
    bool? selected,
    ListTileControlAffinity? controlAffinity,
    bool? autofocus,
    EdgeInsetsGeometry? contentPadding,
    ShapeBorder? shape,
    Color? tileColor,
    Color? selectedTileColor,
    VisualDensity? visualDensity,
    FocusNode? focusNode,
    void Function(bool)? onFocusChange,
    bool? enableFeedback,
  }) =>
      RadioListTile$Conf(
        key: key ?? this.key,
        value: value ?? this.value,
        groupValue: groupValue ?? this.groupValue,
        onChanged: onChanged ?? this.onChanged,
        toggleable: toggleable ?? this.toggleable,
        activeColor: activeColor ?? this.activeColor,
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
        isThreeLine: isThreeLine ?? this.isThreeLine,
        dense: dense ?? this.dense,
        secondary: secondary ?? this.secondary,
        selected: selected ?? this.selected,
        controlAffinity: controlAffinity ?? this.controlAffinity,
        autofocus: autofocus ?? this.autofocus,
        contentPadding: contentPadding ?? this.contentPadding,
        shape: shape ?? this.shape,
        tileColor: tileColor ?? this.tileColor,
        selectedTileColor: selectedTileColor ?? this.selectedTileColor,
        visualDensity: visualDensity ?? this.visualDensity,
        focusNode: focusNode ?? this.focusNode,
        onFocusChange: onFocusChange ?? this.onFocusChange,
        enableFeedback: enableFeedback ?? this.enableFeedback,
      );
  RadioListTile$Conf<T> copyWithOpt({
    Opt<Key>? key,
    T? value,
    Opt<T>? groupValue,
    Opt<void Function(T?)>? onChanged,
    bool? toggleable,
    Opt<Color>? activeColor,
    Opt<Widget>? title,
    Opt<Widget>? subtitle,
    bool? isThreeLine,
    Opt<bool>? dense,
    Opt<Widget>? secondary,
    bool? selected,
    ListTileControlAffinity? controlAffinity,
    bool? autofocus,
    Opt<EdgeInsetsGeometry>? contentPadding,
    Opt<ShapeBorder>? shape,
    Opt<Color>? tileColor,
    Opt<Color>? selectedTileColor,
    Opt<VisualDensity>? visualDensity,
    Opt<FocusNode>? focusNode,
    Opt<void Function(bool)>? onFocusChange,
    Opt<bool>? enableFeedback,
  }) =>
      RadioListTile$Conf(
        key: key == null ? this.key : key.orNullLenient,
        value: value ?? this.value,
        groupValue:
            groupValue == null ? this.groupValue : groupValue.orNullLenient,
        onChanged: onChanged == null ? this.onChanged : onChanged.orNullLenient,
        toggleable: toggleable ?? this.toggleable,
        activeColor:
            activeColor == null ? this.activeColor : activeColor.orNullLenient,
        title: title == null ? this.title : title.orNullLenient,
        subtitle: subtitle == null ? this.subtitle : subtitle.orNullLenient,
        isThreeLine: isThreeLine ?? this.isThreeLine,
        dense: dense == null ? this.dense : dense.orNullLenient,
        secondary: secondary == null ? this.secondary : secondary.orNullLenient,
        selected: selected ?? this.selected,
        controlAffinity: controlAffinity ?? this.controlAffinity,
        autofocus: autofocus ?? this.autofocus,
        contentPadding: contentPadding == null
            ? this.contentPadding
            : contentPadding.orNullLenient,
        shape: shape == null ? this.shape : shape.orNullLenient,
        tileColor: tileColor == null ? this.tileColor : tileColor.orNullLenient,
        selectedTileColor: selectedTileColor == null
            ? this.selectedTileColor
            : selectedTileColor.orNullLenient,
        visualDensity: visualDensity == null
            ? this.visualDensity
            : visualDensity.orNullLenient,
        focusNode: focusNode == null ? this.focusNode : focusNode.orNullLenient,
        onFocusChange: onFocusChange == null
            ? this.onFocusChange
            : onFocusChange.orNullLenient,
        enableFeedback: enableFeedback == null
            ? this.enableFeedback
            : enableFeedback.orNullLenient,
      );
}

class Text$Conf {
  Text$Conf({
    required this.data,
    this.key,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  });
  final String data;
  final Key? key;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final Color? selectionColor;
}

extension Text$Conf$Ext on Text$Conf {
  Text create() => Text(
        data,
        key: key,
        style: style,
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        locale: locale,
        softWrap: softWrap,
        overflow: overflow,
        textScaleFactor: textScaleFactor,
        maxLines: maxLines,
        semanticsLabel: semanticsLabel,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
        selectionColor: selectionColor,
      );
  Text$Conf copyWith({
    String? data,
    Key? key,
    TextStyle? style,
    StrutStyle? strutStyle,
    TextAlign? textAlign,
    TextDirection? textDirection,
    Locale? locale,
    bool? softWrap,
    TextOverflow? overflow,
    double? textScaleFactor,
    int? maxLines,
    String? semanticsLabel,
    TextWidthBasis? textWidthBasis,
    TextHeightBehavior? textHeightBehavior,
    Color? selectionColor,
  }) =>
      Text$Conf(
        data: data ?? this.data,
        key: key ?? this.key,
        style: style ?? this.style,
        strutStyle: strutStyle ?? this.strutStyle,
        textAlign: textAlign ?? this.textAlign,
        textDirection: textDirection ?? this.textDirection,
        locale: locale ?? this.locale,
        softWrap: softWrap ?? this.softWrap,
        overflow: overflow ?? this.overflow,
        textScaleFactor: textScaleFactor ?? this.textScaleFactor,
        maxLines: maxLines ?? this.maxLines,
        semanticsLabel: semanticsLabel ?? this.semanticsLabel,
        textWidthBasis: textWidthBasis ?? this.textWidthBasis,
        textHeightBehavior: textHeightBehavior ?? this.textHeightBehavior,
        selectionColor: selectionColor ?? this.selectionColor,
      );
  Text$Conf copyWithOpt({
    String? data,
    Opt<Key>? key,
    Opt<TextStyle>? style,
    Opt<StrutStyle>? strutStyle,
    Opt<TextAlign>? textAlign,
    Opt<TextDirection>? textDirection,
    Opt<Locale>? locale,
    Opt<bool>? softWrap,
    Opt<TextOverflow>? overflow,
    Opt<double>? textScaleFactor,
    Opt<int>? maxLines,
    Opt<String>? semanticsLabel,
    Opt<TextWidthBasis>? textWidthBasis,
    Opt<TextHeightBehavior>? textHeightBehavior,
    Opt<Color>? selectionColor,
  }) =>
      Text$Conf(
        data: data ?? this.data,
        key: key == null ? this.key : key.orNullLenient,
        style: style == null ? this.style : style.orNullLenient,
        strutStyle:
            strutStyle == null ? this.strutStyle : strutStyle.orNullLenient,
        textAlign: textAlign == null ? this.textAlign : textAlign.orNullLenient,
        textDirection: textDirection == null
            ? this.textDirection
            : textDirection.orNullLenient,
        locale: locale == null ? this.locale : locale.orNullLenient,
        softWrap: softWrap == null ? this.softWrap : softWrap.orNullLenient,
        overflow: overflow == null ? this.overflow : overflow.orNullLenient,
        textScaleFactor: textScaleFactor == null
            ? this.textScaleFactor
            : textScaleFactor.orNullLenient,
        maxLines: maxLines == null ? this.maxLines : maxLines.orNullLenient,
        semanticsLabel: semanticsLabel == null
            ? this.semanticsLabel
            : semanticsLabel.orNullLenient,
        textWidthBasis: textWidthBasis == null
            ? this.textWidthBasis
            : textWidthBasis.orNullLenient,
        textHeightBehavior: textHeightBehavior == null
            ? this.textHeightBehavior
            : textHeightBehavior.orNullLenient,
        selectionColor: selectionColor == null
            ? this.selectionColor
            : selectionColor.orNullLenient,
      );
}

class Text$Conf$rich {
  Text$Conf$rich({
    required this.textSpan,
    this.key,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  });
  final InlineSpan textSpan;
  final Key? key;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final Color? selectionColor;
}

extension Text$Conf$rich$Ext on Text$Conf$rich {
  Text create() => Text.rich(
        textSpan,
        key: key,
        style: style,
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        locale: locale,
        softWrap: softWrap,
        overflow: overflow,
        textScaleFactor: textScaleFactor,
        maxLines: maxLines,
        semanticsLabel: semanticsLabel,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
        selectionColor: selectionColor,
      );
  Text$Conf$rich copyWith({
    InlineSpan? textSpan,
    Key? key,
    TextStyle? style,
    StrutStyle? strutStyle,
    TextAlign? textAlign,
    TextDirection? textDirection,
    Locale? locale,
    bool? softWrap,
    TextOverflow? overflow,
    double? textScaleFactor,
    int? maxLines,
    String? semanticsLabel,
    TextWidthBasis? textWidthBasis,
    TextHeightBehavior? textHeightBehavior,
    Color? selectionColor,
  }) =>
      Text$Conf$rich(
        textSpan: textSpan ?? this.textSpan,
        key: key ?? this.key,
        style: style ?? this.style,
        strutStyle: strutStyle ?? this.strutStyle,
        textAlign: textAlign ?? this.textAlign,
        textDirection: textDirection ?? this.textDirection,
        locale: locale ?? this.locale,
        softWrap: softWrap ?? this.softWrap,
        overflow: overflow ?? this.overflow,
        textScaleFactor: textScaleFactor ?? this.textScaleFactor,
        maxLines: maxLines ?? this.maxLines,
        semanticsLabel: semanticsLabel ?? this.semanticsLabel,
        textWidthBasis: textWidthBasis ?? this.textWidthBasis,
        textHeightBehavior: textHeightBehavior ?? this.textHeightBehavior,
        selectionColor: selectionColor ?? this.selectionColor,
      );
  Text$Conf$rich copyWithOpt({
    InlineSpan? textSpan,
    Opt<Key>? key,
    Opt<TextStyle>? style,
    Opt<StrutStyle>? strutStyle,
    Opt<TextAlign>? textAlign,
    Opt<TextDirection>? textDirection,
    Opt<Locale>? locale,
    Opt<bool>? softWrap,
    Opt<TextOverflow>? overflow,
    Opt<double>? textScaleFactor,
    Opt<int>? maxLines,
    Opt<String>? semanticsLabel,
    Opt<TextWidthBasis>? textWidthBasis,
    Opt<TextHeightBehavior>? textHeightBehavior,
    Opt<Color>? selectionColor,
  }) =>
      Text$Conf$rich(
        textSpan: textSpan ?? this.textSpan,
        key: key == null ? this.key : key.orNullLenient,
        style: style == null ? this.style : style.orNullLenient,
        strutStyle:
            strutStyle == null ? this.strutStyle : strutStyle.orNullLenient,
        textAlign: textAlign == null ? this.textAlign : textAlign.orNullLenient,
        textDirection: textDirection == null
            ? this.textDirection
            : textDirection.orNullLenient,
        locale: locale == null ? this.locale : locale.orNullLenient,
        softWrap: softWrap == null ? this.softWrap : softWrap.orNullLenient,
        overflow: overflow == null ? this.overflow : overflow.orNullLenient,
        textScaleFactor: textScaleFactor == null
            ? this.textScaleFactor
            : textScaleFactor.orNullLenient,
        maxLines: maxLines == null ? this.maxLines : maxLines.orNullLenient,
        semanticsLabel: semanticsLabel == null
            ? this.semanticsLabel
            : semanticsLabel.orNullLenient,
        textWidthBasis: textWidthBasis == null
            ? this.textWidthBasis
            : textWidthBasis.orNullLenient,
        textHeightBehavior: textHeightBehavior == null
            ? this.textHeightBehavior
            : textHeightBehavior.orNullLenient,
        selectionColor: selectionColor == null
            ? this.selectionColor
            : selectionColor.orNullLenient,
      );
}
