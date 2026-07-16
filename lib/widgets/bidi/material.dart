import 'package:flutter/material.dart' as material;
import 'package:intl/intl.dart' as intl;

export 'package:flutter/material.dart' hide Text;

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

// TODO: also define new classes for: RichText, TextField, TextFormField, Linkify, SelectableLinkify
