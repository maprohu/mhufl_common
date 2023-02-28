// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'widgets.dart';

// **************************************************************************
// ConfGenerator
// **************************************************************************

class RadioListTile$Conf$<T>
    implements
        Factory<RadioListTile<T>>,
        Override<RadioListTile$Conf$<T>, RadioListTile$Override$<T>> {
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
  RadioListTile$Conf$({
    this.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.toggleable = false,
    this.activeColor,
    this.title,
    this.subtitle,
    this.isThreeLine = false,
    this.dense,
    this.secondary,
    this.selected = false,
    this.controlAffinity = ListTileControlAffinity.platform,
    this.autofocus = false,
    this.contentPadding,
    this.shape,
    this.tileColor,
    this.selectedTileColor,
    this.visualDensity,
    this.focusNode,
    this.onFocusChange,
    this.enableFeedback,
  });
  RadioListTile<T> create() => RadioListTile<T>(
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
  RadioListTile$Conf$<T> copyWith({
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
      RadioListTile$Conf$(
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
  RadioListTile$Conf$<T> overrideWith(
    RadioListTile$Override$<T> override,
  ) =>
      RadioListTile$Conf$(
        key: override.key.orDefault(key),
        value: override.value.orDefault(value),
        groupValue: override.groupValue.orDefault(groupValue),
        onChanged: override.onChanged.orDefault(onChanged),
        toggleable: override.toggleable.orDefault(toggleable),
        activeColor: override.activeColor.orDefault(activeColor),
        title: override.title.orDefault(title),
        subtitle: override.subtitle.orDefault(subtitle),
        isThreeLine: override.isThreeLine.orDefault(isThreeLine),
        dense: override.dense.orDefault(dense),
        secondary: override.secondary.orDefault(secondary),
        selected: override.selected.orDefault(selected),
        controlAffinity: override.controlAffinity.orDefault(controlAffinity),
        autofocus: override.autofocus.orDefault(autofocus),
        contentPadding: override.contentPadding.orDefault(contentPadding),
        shape: override.shape.orDefault(shape),
        tileColor: override.tileColor.orDefault(tileColor),
        selectedTileColor:
            override.selectedTileColor.orDefault(selectedTileColor),
        visualDensity: override.visualDensity.orDefault(visualDensity),
        focusNode: override.focusNode.orDefault(focusNode),
        onFocusChange: override.onFocusChange.orDefault(onFocusChange),
        enableFeedback: override.enableFeedback.orDefault(enableFeedback),
      );
}

class RadioListTile$Override$<T>
    implements
        Override<RadioListTile$Override$<T>, RadioListTile$Override$<T>> {
  final Opt<Key?> key;
  final Opt<T> value;
  final Opt<T?> groupValue;
  final Opt<void Function(T?)?> onChanged;
  final Opt<bool> toggleable;
  final Opt<Color?> activeColor;
  final Opt<Widget?> title;
  final Opt<Widget?> subtitle;
  final Opt<bool> isThreeLine;
  final Opt<bool?> dense;
  final Opt<Widget?> secondary;
  final Opt<bool> selected;
  final Opt<ListTileControlAffinity> controlAffinity;
  final Opt<bool> autofocus;
  final Opt<EdgeInsetsGeometry?> contentPadding;
  final Opt<ShapeBorder?> shape;
  final Opt<Color?> tileColor;
  final Opt<Color?> selectedTileColor;
  final Opt<VisualDensity?> visualDensity;
  final Opt<FocusNode?> focusNode;
  final Opt<void Function(bool)?> onFocusChange;
  final Opt<bool?> enableFeedback;
  RadioListTile$Override$.opt({
    required this.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.toggleable,
    required this.activeColor,
    required this.title,
    required this.subtitle,
    required this.isThreeLine,
    required this.dense,
    required this.secondary,
    required this.selected,
    required this.controlAffinity,
    required this.autofocus,
    required this.contentPadding,
    required this.shape,
    required this.tileColor,
    required this.selectedTileColor,
    required this.visualDensity,
    required this.focusNode,
    required this.onFocusChange,
    required this.enableFeedback,
  });
  RadioListTile$Override$({
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
  }) : this.opt(
          key: key == null ? const Opt.gone() : Opt.here(key),
          value: value == null ? const Opt.gone() : Opt.here(value),
          groupValue:
              groupValue == null ? const Opt.gone() : Opt.here(groupValue),
          onChanged: onChanged == null ? const Opt.gone() : Opt.here(onChanged),
          toggleable:
              toggleable == null ? const Opt.gone() : Opt.here(toggleable),
          activeColor:
              activeColor == null ? const Opt.gone() : Opt.here(activeColor),
          title: title == null ? const Opt.gone() : Opt.here(title),
          subtitle: subtitle == null ? const Opt.gone() : Opt.here(subtitle),
          isThreeLine:
              isThreeLine == null ? const Opt.gone() : Opt.here(isThreeLine),
          dense: dense == null ? const Opt.gone() : Opt.here(dense),
          secondary: secondary == null ? const Opt.gone() : Opt.here(secondary),
          selected: selected == null ? const Opt.gone() : Opt.here(selected),
          controlAffinity: controlAffinity == null
              ? const Opt.gone()
              : Opt.here(controlAffinity),
          autofocus: autofocus == null ? const Opt.gone() : Opt.here(autofocus),
          contentPadding: contentPadding == null
              ? const Opt.gone()
              : Opt.here(contentPadding),
          shape: shape == null ? const Opt.gone() : Opt.here(shape),
          tileColor: tileColor == null ? const Opt.gone() : Opt.here(tileColor),
          selectedTileColor: selectedTileColor == null
              ? const Opt.gone()
              : Opt.here(selectedTileColor),
          visualDensity: visualDensity == null
              ? const Opt.gone()
              : Opt.here(visualDensity),
          focusNode: focusNode == null ? const Opt.gone() : Opt.here(focusNode),
          onFocusChange: onFocusChange == null
              ? const Opt.gone()
              : Opt.here(onFocusChange),
          enableFeedback: enableFeedback == null
              ? const Opt.gone()
              : Opt.here(enableFeedback),
        );
  RadioListTile$Override$<T> copyWithOpt({
    Opt<Key?>? key,
    Opt<T>? value,
    Opt<T?>? groupValue,
    Opt<void Function(T?)?>? onChanged,
    Opt<bool>? toggleable,
    Opt<Color?>? activeColor,
    Opt<Widget?>? title,
    Opt<Widget?>? subtitle,
    Opt<bool>? isThreeLine,
    Opt<bool?>? dense,
    Opt<Widget?>? secondary,
    Opt<bool>? selected,
    Opt<ListTileControlAffinity>? controlAffinity,
    Opt<bool>? autofocus,
    Opt<EdgeInsetsGeometry?>? contentPadding,
    Opt<ShapeBorder?>? shape,
    Opt<Color?>? tileColor,
    Opt<Color?>? selectedTileColor,
    Opt<VisualDensity?>? visualDensity,
    Opt<FocusNode?>? focusNode,
    Opt<void Function(bool)?>? onFocusChange,
    Opt<bool?>? enableFeedback,
  }) =>
      RadioListTile$Override$.opt(
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
  RadioListTile$Override$<T> overrideWith(
    RadioListTile$Override$<T> override,
  ) =>
      RadioListTile$Override$.opt(
        key: override.key.orOpt(key),
        value: override.value.orOpt(value),
        groupValue: override.groupValue.orOpt(groupValue),
        onChanged: override.onChanged.orOpt(onChanged),
        toggleable: override.toggleable.orOpt(toggleable),
        activeColor: override.activeColor.orOpt(activeColor),
        title: override.title.orOpt(title),
        subtitle: override.subtitle.orOpt(subtitle),
        isThreeLine: override.isThreeLine.orOpt(isThreeLine),
        dense: override.dense.orOpt(dense),
        secondary: override.secondary.orOpt(secondary),
        selected: override.selected.orOpt(selected),
        controlAffinity: override.controlAffinity.orOpt(controlAffinity),
        autofocus: override.autofocus.orOpt(autofocus),
        contentPadding: override.contentPadding.orOpt(contentPadding),
        shape: override.shape.orOpt(shape),
        tileColor: override.tileColor.orOpt(tileColor),
        selectedTileColor: override.selectedTileColor.orOpt(selectedTileColor),
        visualDensity: override.visualDensity.orOpt(visualDensity),
        focusNode: override.focusNode.orOpt(focusNode),
        onFocusChange: override.onFocusChange.orOpt(onFocusChange),
        enableFeedback: override.enableFeedback.orOpt(enableFeedback),
      );
  RadioListTile$Override$<T> copyWith({
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
      overrideWith(RadioListTile$Override$(
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
      ));
}

class Text$Conf$
    implements Factory<Text>, Override<Text$Conf$, Text$Override$> {
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
  Text$Conf$({
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
  Text$Conf$ copyWith({
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
      Text$Conf$(
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
  Text$Conf$ overrideWith(
    Text$Override$ override,
  ) =>
      Text$Conf$(
        data: override.data.orDefault(data),
        key: override.key.orDefault(key),
        style: override.style.orDefault(style),
        strutStyle: override.strutStyle.orDefault(strutStyle),
        textAlign: override.textAlign.orDefault(textAlign),
        textDirection: override.textDirection.orDefault(textDirection),
        locale: override.locale.orDefault(locale),
        softWrap: override.softWrap.orDefault(softWrap),
        overflow: override.overflow.orDefault(overflow),
        textScaleFactor: override.textScaleFactor.orDefault(textScaleFactor),
        maxLines: override.maxLines.orDefault(maxLines),
        semanticsLabel: override.semanticsLabel.orDefault(semanticsLabel),
        textWidthBasis: override.textWidthBasis.orDefault(textWidthBasis),
        textHeightBehavior:
            override.textHeightBehavior.orDefault(textHeightBehavior),
        selectionColor: override.selectionColor.orDefault(selectionColor),
      );
}

class Text$Override$ implements Override<Text$Override$, Text$Override$> {
  final Opt<String> data;
  final Opt<Key?> key;
  final Opt<TextStyle?> style;
  final Opt<StrutStyle?> strutStyle;
  final Opt<TextAlign?> textAlign;
  final Opt<TextDirection?> textDirection;
  final Opt<Locale?> locale;
  final Opt<bool?> softWrap;
  final Opt<TextOverflow?> overflow;
  final Opt<double?> textScaleFactor;
  final Opt<int?> maxLines;
  final Opt<String?> semanticsLabel;
  final Opt<TextWidthBasis?> textWidthBasis;
  final Opt<TextHeightBehavior?> textHeightBehavior;
  final Opt<Color?> selectionColor;
  Text$Override$.opt({
    required this.data,
    required this.key,
    required this.style,
    required this.strutStyle,
    required this.textAlign,
    required this.textDirection,
    required this.locale,
    required this.softWrap,
    required this.overflow,
    required this.textScaleFactor,
    required this.maxLines,
    required this.semanticsLabel,
    required this.textWidthBasis,
    required this.textHeightBehavior,
    required this.selectionColor,
  });
  Text$Override$({
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
  }) : this.opt(
          data: data == null ? const Opt.gone() : Opt.here(data),
          key: key == null ? const Opt.gone() : Opt.here(key),
          style: style == null ? const Opt.gone() : Opt.here(style),
          strutStyle:
              strutStyle == null ? const Opt.gone() : Opt.here(strutStyle),
          textAlign: textAlign == null ? const Opt.gone() : Opt.here(textAlign),
          textDirection: textDirection == null
              ? const Opt.gone()
              : Opt.here(textDirection),
          locale: locale == null ? const Opt.gone() : Opt.here(locale),
          softWrap: softWrap == null ? const Opt.gone() : Opt.here(softWrap),
          overflow: overflow == null ? const Opt.gone() : Opt.here(overflow),
          textScaleFactor: textScaleFactor == null
              ? const Opt.gone()
              : Opt.here(textScaleFactor),
          maxLines: maxLines == null ? const Opt.gone() : Opt.here(maxLines),
          semanticsLabel: semanticsLabel == null
              ? const Opt.gone()
              : Opt.here(semanticsLabel),
          textWidthBasis: textWidthBasis == null
              ? const Opt.gone()
              : Opt.here(textWidthBasis),
          textHeightBehavior: textHeightBehavior == null
              ? const Opt.gone()
              : Opt.here(textHeightBehavior),
          selectionColor: selectionColor == null
              ? const Opt.gone()
              : Opt.here(selectionColor),
        );
  Text$Override$ copyWithOpt({
    Opt<String>? data,
    Opt<Key?>? key,
    Opt<TextStyle?>? style,
    Opt<StrutStyle?>? strutStyle,
    Opt<TextAlign?>? textAlign,
    Opt<TextDirection?>? textDirection,
    Opt<Locale?>? locale,
    Opt<bool?>? softWrap,
    Opt<TextOverflow?>? overflow,
    Opt<double?>? textScaleFactor,
    Opt<int?>? maxLines,
    Opt<String?>? semanticsLabel,
    Opt<TextWidthBasis?>? textWidthBasis,
    Opt<TextHeightBehavior?>? textHeightBehavior,
    Opt<Color?>? selectionColor,
  }) =>
      Text$Override$.opt(
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
  Text$Override$ overrideWith(
    Text$Override$ override,
  ) =>
      Text$Override$.opt(
        data: override.data.orOpt(data),
        key: override.key.orOpt(key),
        style: override.style.orOpt(style),
        strutStyle: override.strutStyle.orOpt(strutStyle),
        textAlign: override.textAlign.orOpt(textAlign),
        textDirection: override.textDirection.orOpt(textDirection),
        locale: override.locale.orOpt(locale),
        softWrap: override.softWrap.orOpt(softWrap),
        overflow: override.overflow.orOpt(overflow),
        textScaleFactor: override.textScaleFactor.orOpt(textScaleFactor),
        maxLines: override.maxLines.orOpt(maxLines),
        semanticsLabel: override.semanticsLabel.orOpt(semanticsLabel),
        textWidthBasis: override.textWidthBasis.orOpt(textWidthBasis),
        textHeightBehavior:
            override.textHeightBehavior.orOpt(textHeightBehavior),
        selectionColor: override.selectionColor.orOpt(selectionColor),
      );
  Text$Override$ copyWith({
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
      overrideWith(Text$Override$(
        data: data,
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
      ));
}

class Text$Conf$rich
    implements Factory<Text>, Override<Text$Conf$rich, Text$Override$rich> {
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
  Text$Conf$rich overrideWith(
    Text$Override$rich override,
  ) =>
      Text$Conf$rich(
        textSpan: override.textSpan.orDefault(textSpan),
        key: override.key.orDefault(key),
        style: override.style.orDefault(style),
        strutStyle: override.strutStyle.orDefault(strutStyle),
        textAlign: override.textAlign.orDefault(textAlign),
        textDirection: override.textDirection.orDefault(textDirection),
        locale: override.locale.orDefault(locale),
        softWrap: override.softWrap.orDefault(softWrap),
        overflow: override.overflow.orDefault(overflow),
        textScaleFactor: override.textScaleFactor.orDefault(textScaleFactor),
        maxLines: override.maxLines.orDefault(maxLines),
        semanticsLabel: override.semanticsLabel.orDefault(semanticsLabel),
        textWidthBasis: override.textWidthBasis.orDefault(textWidthBasis),
        textHeightBehavior:
            override.textHeightBehavior.orDefault(textHeightBehavior),
        selectionColor: override.selectionColor.orDefault(selectionColor),
      );
}

class Text$Override$rich
    implements Override<Text$Override$rich, Text$Override$rich> {
  final Opt<InlineSpan> textSpan;
  final Opt<Key?> key;
  final Opt<TextStyle?> style;
  final Opt<StrutStyle?> strutStyle;
  final Opt<TextAlign?> textAlign;
  final Opt<TextDirection?> textDirection;
  final Opt<Locale?> locale;
  final Opt<bool?> softWrap;
  final Opt<TextOverflow?> overflow;
  final Opt<double?> textScaleFactor;
  final Opt<int?> maxLines;
  final Opt<String?> semanticsLabel;
  final Opt<TextWidthBasis?> textWidthBasis;
  final Opt<TextHeightBehavior?> textHeightBehavior;
  final Opt<Color?> selectionColor;
  Text$Override$rich.opt({
    required this.textSpan,
    required this.key,
    required this.style,
    required this.strutStyle,
    required this.textAlign,
    required this.textDirection,
    required this.locale,
    required this.softWrap,
    required this.overflow,
    required this.textScaleFactor,
    required this.maxLines,
    required this.semanticsLabel,
    required this.textWidthBasis,
    required this.textHeightBehavior,
    required this.selectionColor,
  });
  Text$Override$rich({
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
  }) : this.opt(
          textSpan: textSpan == null ? const Opt.gone() : Opt.here(textSpan),
          key: key == null ? const Opt.gone() : Opt.here(key),
          style: style == null ? const Opt.gone() : Opt.here(style),
          strutStyle:
              strutStyle == null ? const Opt.gone() : Opt.here(strutStyle),
          textAlign: textAlign == null ? const Opt.gone() : Opt.here(textAlign),
          textDirection: textDirection == null
              ? const Opt.gone()
              : Opt.here(textDirection),
          locale: locale == null ? const Opt.gone() : Opt.here(locale),
          softWrap: softWrap == null ? const Opt.gone() : Opt.here(softWrap),
          overflow: overflow == null ? const Opt.gone() : Opt.here(overflow),
          textScaleFactor: textScaleFactor == null
              ? const Opt.gone()
              : Opt.here(textScaleFactor),
          maxLines: maxLines == null ? const Opt.gone() : Opt.here(maxLines),
          semanticsLabel: semanticsLabel == null
              ? const Opt.gone()
              : Opt.here(semanticsLabel),
          textWidthBasis: textWidthBasis == null
              ? const Opt.gone()
              : Opt.here(textWidthBasis),
          textHeightBehavior: textHeightBehavior == null
              ? const Opt.gone()
              : Opt.here(textHeightBehavior),
          selectionColor: selectionColor == null
              ? const Opt.gone()
              : Opt.here(selectionColor),
        );
  Text$Override$rich copyWithOpt({
    Opt<InlineSpan>? textSpan,
    Opt<Key?>? key,
    Opt<TextStyle?>? style,
    Opt<StrutStyle?>? strutStyle,
    Opt<TextAlign?>? textAlign,
    Opt<TextDirection?>? textDirection,
    Opt<Locale?>? locale,
    Opt<bool?>? softWrap,
    Opt<TextOverflow?>? overflow,
    Opt<double?>? textScaleFactor,
    Opt<int?>? maxLines,
    Opt<String?>? semanticsLabel,
    Opt<TextWidthBasis?>? textWidthBasis,
    Opt<TextHeightBehavior?>? textHeightBehavior,
    Opt<Color?>? selectionColor,
  }) =>
      Text$Override$rich.opt(
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
  Text$Override$rich overrideWith(
    Text$Override$rich override,
  ) =>
      Text$Override$rich.opt(
        textSpan: override.textSpan.orOpt(textSpan),
        key: override.key.orOpt(key),
        style: override.style.orOpt(style),
        strutStyle: override.strutStyle.orOpt(strutStyle),
        textAlign: override.textAlign.orOpt(textAlign),
        textDirection: override.textDirection.orOpt(textDirection),
        locale: override.locale.orOpt(locale),
        softWrap: override.softWrap.orOpt(softWrap),
        overflow: override.overflow.orOpt(overflow),
        textScaleFactor: override.textScaleFactor.orOpt(textScaleFactor),
        maxLines: override.maxLines.orOpt(maxLines),
        semanticsLabel: override.semanticsLabel.orOpt(semanticsLabel),
        textWidthBasis: override.textWidthBasis.orOpt(textWidthBasis),
        textHeightBehavior:
            override.textHeightBehavior.orOpt(textHeightBehavior),
        selectionColor: override.selectionColor.orOpt(selectionColor),
      );
  Text$Override$rich copyWith({
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
      overrideWith(Text$Override$rich(
        textSpan: textSpan,
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
      ));
}
