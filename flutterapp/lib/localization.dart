

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

class AppLocalizations {
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  String get title => Intl.message('Cooking Club', name: 'title');
  String get signIn => Intl.message('Sign In', name: 'signIn');
  String get username => Intl.message('Username', name: 'username');
  String get password => Intl.message('Password', name: 'password');
  String get recipes => Intl.message('Recipes', name: 'recipes');
  String get favourites => Intl.message('Favourites', name: 'favourites');
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'es'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final name = locale.languageCode;
    final localeName = Intl.canonicalizedLocale(name);
    // await initializeMessages(localeName);
    Intl.defaultLocale = localeName;
    return AppLocalizations();
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
