import 'package:flutter/material.dart' as material;
import 'package:intl/intl.dart' as intl;

export 'package:flutter/material.dart' hide Text, TextField;

extension BidiFormatter on String {
  String get bidiFormatted {
    return intl.BidiFormatter.UNKNOWN().wrapWithUnicode(this);
  }

  material.TextDirection? get textDirection {
    switch (intl.BidiFormatter.UNKNOWN().estimateDirection(this)) {
      case intl.TextDirection.LTR:
        return material.TextDirection.ltr;
      case intl.TextDirection.RTL:
        return material.TextDirection.rtl;
      case intl.TextDirection.UNKNOWN:
      default:
        return null;
    }
  }

  material.TextDirection? get textDirectionHtml {
    switch (intl.BidiFormatter.UNKNOWN().estimateDirection(
      this,
      isHtml: true,
    )) {
      case intl.TextDirection.LTR:
        return material.TextDirection.ltr;
      case intl.TextDirection.RTL:
        return material.TextDirection.rtl;
      case intl.TextDirection.UNKNOWN:
      default:
        return null;
    }
  }
}

class Text extends material.Text {
  const Text(
    super.data, {
    super.key,
    super.style,
    super.strutStyle,
    super.textAlign,
    super.locale,
    super.softWrap,
    super.overflow,
    super.textScaler,
    super.maxLines,
    super.semanticsLabel,
    super.textWidthBasis,
    super.textHeightBehavior,
    super.selectionColor,
  });

  const Text.rich(
    super.textSpan, {
    super.key,
    super.style,
    super.strutStyle,
    super.textAlign,
    super.locale,
    super.softWrap,
    super.overflow,
    super.textScaler,
    super.maxLines,
    super.semanticsLabel,
    super.textWidthBasis,
    super.textHeightBehavior,
    super.selectionColor,
  }) : super.rich();

  @override
  material.TextDirection? get textDirection {
    // For Text.rich, use HTML-aware direction estimation
    if (super.textSpan != null) {
      return super.textSpan!.toPlainText().textDirectionHtml;
    }
    // For regular Text, use standard direction estimation
    return data?.textDirection;
  }
}

class TextField extends material.TextField {
  const TextField({
    super.key,
    super.groupId,
    super.controller,
    super.focusNode,
    super.undoController,
    super.decoration,
    super.keyboardType,
    super.textInputAction,
    super.textCapitalization,
    super.style,
    super.strutStyle,
    super.textAlign,
    super.textAlignVertical,
    super.textDirection,
    super.readOnly,
    super.showCursor,
    super.autofocus,
    super.statesController,
    super.obscuringCharacter,
    super.obscureText,
    super.autocorrect,
    super.smartDashesType,
    super.smartQuotesType,
    super.enableSuggestions,
    super.maxLines,
    super.minLines,
    super.expands,
    super.maxLength,
    super.maxLengthEnforcement,
    super.onChanged,
    super.onEditingComplete,
    super.onSubmitted,
    super.onAppPrivateCommand,
    super.inputFormatters,
    super.enabled,
    super.ignorePointers,
    super.cursorWidth,
    super.cursorHeight,
    super.cursorRadius,
    super.cursorOpacityAnimates,
    super.cursorColor,
    super.cursorErrorColor,
    super.selectionHeightStyle,
    super.selectionWidthStyle,
    super.keyboardAppearance,
    super.scrollPadding,
    super.dragStartBehavior,
    super.enableInteractiveSelection,
    super.selectAllOnFocus,
    super.selectionControls,
    super.onTap,
    super.onTapAlwaysCalled,
    super.onTapOutside,
    super.onTapUpOutside,
    super.mouseCursor,
    super.buildCounter,
    super.scrollController,
    super.scrollPhysics,
    super.autofillHints,
    super.contentInsertionConfiguration,
    super.clipBehavior,
    super.restorationId,
    super.stylusHandwritingEnabled,
    super.enableIMEPersonalizedLearning,
    super.enableInlinePrediction,
    super.contextMenuBuilder,
    super.canRequestFocus,
    super.spellCheckConfiguration,
    super.magnifierConfiguration,
    super.hintLocales,
  });

  @override
  material.TextDirection? get textDirection {
    return controller?.text.textDirection;
  }
}


// TODO: also define new classes for: RichText, TextFormField, Linkify, SelectableLinkify
