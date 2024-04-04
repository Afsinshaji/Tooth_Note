import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final bookingSearchProvider = StateProvider(
  (ref) {
    return '';
  },
);
bookingSearch(String searching, WidgetRef ref) {
  log('search booking riverpod');
  ref.read(bookingSearchProvider.notifier).state = searching;
}
StateProvider<DateTime?> bookingSortDateProvider = StateProvider(
 (ref) {
     DateTime? now =DateTime.now();
    return now;
  },
);
addBookingSortingDate(DateTime? time, WidgetRef ref) {
  ref.read(bookingSortDateProvider.notifier).state = time;
}