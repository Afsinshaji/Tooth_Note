import 'package:flutter_riverpod/flutter_riverpod.dart';

final timeSlotProvider = StateProvider(
  (ref) {
    return '';
  },
);
addTimeSlot(String searching, WidgetRef ref) {
  ref.read(timeSlotProvider.notifier).state = searching;
}
