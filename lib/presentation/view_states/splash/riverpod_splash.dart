import 'package:flutter_riverpod/flutter_riverpod.dart';

final opacityProvider = StateProvider(
  (ref) {
    return 0.0;
  },
);
increaseOpacity(double opacity, WidgetRef ref) {
  ref.read(opacityProvider.notifier).state = opacity;
}
