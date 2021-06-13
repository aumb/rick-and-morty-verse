import 'package:flutter/foundation.dart';

void safePrint(String value) {
  if (kReleaseMode) return;
  // ignore: avoid_print
  print(value);
}
