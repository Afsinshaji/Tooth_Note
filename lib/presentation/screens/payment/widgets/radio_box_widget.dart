import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tooth_note/presentation/view_states/payment/transaction_list.dart';
import 'package:tooth_note/utilities/colors.dart';


class RadioBoxWidget extends ConsumerStatefulWidget {
  const RadioBoxWidget({
    super.key,
    required this.transactionName,
this.transactionValue,
    this.fontSize,
  
  });
  final String transactionName;
  final double? fontSize;
final TransactionTypes? transactionValue;


  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RadioBoxWidgetState();
}

class _RadioBoxWidgetState extends ConsumerState<RadioBoxWidget> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.33,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.transactionName,
            style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: widget.fontSize ?? size.width * 0.05,
                color: ToothNoteColors.kBlackColor),
          ),
          Radio(
              activeColor: ToothNoteColors.kPinkColor,
              groupValue:  ref.watch(transactionTypeProvider),
              value: widget.transactionValue,
              onChanged: (value) {
                // if (
                //     value is TransactionTypes?) {
                  ref.read(transactionTypeProvider.notifier).state = value!;
               // }
              })
        ],
      ),
    );
  }
}
