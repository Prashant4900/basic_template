import 'package:basic_template/gen/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension LocalizationStrings on BuildContext {
  AppLocalizations get lang {
    return AppLocalizations.of(this)!;
  }
}
