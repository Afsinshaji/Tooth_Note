import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeSearchProvider = StateProvider(
  (ref) {
    return '';
  },
);
homeSearch(String searching, WidgetRef ref) {
  log('search home riverpod');
  ref.read(homeSearchProvider.notifier).state = searching;
}
StateProvider<DateTime?> homeSortDateProvider = StateProvider(
 (ref) {
     DateTime? now =DateTime.now();
    return now;
  },
);
addSortingDate(DateTime? time, WidgetRef ref) {
  ref.read(homeSortDateProvider.notifier).state = time;
}