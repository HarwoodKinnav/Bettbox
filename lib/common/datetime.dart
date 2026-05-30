import 'package:bett_box/common/context.dart';
import 'package:flutter/material.dart';

extension DateTimeExtension on DateTime {
  bool get isBeforeNow => isBefore(DateTime.now());

  String getLastUpdateTimeDesc(BuildContext context) {
    final appLocalizations = context.appLocalizations;
    final difference = DateTime.now().difference(this);
    final days = difference.inDays;

    if (days >= 365) {
      return appLocalizations.yearsAgo((days / 365).floor());
    }
    if (days >= 30) {
      return appLocalizations.monthsAgo((days / 30).floor());
    }
    if (days >= 1) {
      return appLocalizations.daysAgo(days);
    }
    final hours = difference.inHours;
    if (hours >= 1) {
      return appLocalizations.hoursAgo(hours);
    }
    final minutes = difference.inMinutes;
    if (minutes >= 1) {
      return appLocalizations.minutesAgo(minutes);
    }
    return appLocalizations.justNow;
  }

  String get show => toLocal().toString().substring(0, 10);

  String get showFull => toLocal().toString().substring(0, 19);

  String get showTime => toLocal().toString().substring(11, 19);
}
