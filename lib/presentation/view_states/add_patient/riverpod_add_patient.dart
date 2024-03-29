import 'package:flutter_riverpod/flutter_riverpod.dart';

final dateProvider = StateProvider(
  (ref) {
    return DateTime.now();
  },
);
addTime(DateTime time, WidgetRef ref) {
  ref.read(dateProvider.notifier).state = time;
}

initializeDate(WidgetRef ref){
  ref.read(dateProvider.notifier).state = DateTime.now();
}

final dateOfBirthProvider = StateProvider(
  (ref) {
    return DateTime.now();
  },
);
addDOB(DateTime time, WidgetRef ref) {
  ref.read(dateOfBirthProvider.notifier).state = time;
}