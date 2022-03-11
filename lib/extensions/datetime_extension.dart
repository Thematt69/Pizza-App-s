import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  /// Format : 'dd/MM/yyyy à HH:mm'
  ///
  /// Exemple : '12/01/2022 à 20:23'
  String get dateTimeFormat => DateFormat('dd/MM/yyyy à HH:mm').format(this);
}
