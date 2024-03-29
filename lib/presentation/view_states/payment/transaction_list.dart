import 'package:flutter_riverpod/flutter_riverpod.dart';

enum TransactionTypes {
  cash,

  bank,

  wallet
}

TransactionTypes transactionList(int value) {
  if (value == 0) {
    return TransactionTypes.cash;
  } else if (value == 1) {
    return TransactionTypes.bank;
  } else {
    return TransactionTypes.wallet;
  }
}

final transactionTypeProvider = StateProvider(
  (ref) {
    return TransactionTypes.cash;
  },
);

addTransactionType(TransactionTypes type, WidgetRef ref) {
  ref.read(transactionTypeProvider.notifier).state = type;
}