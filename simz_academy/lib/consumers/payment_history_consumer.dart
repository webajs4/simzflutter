import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:simz_academy/UIHelper/home_ui_helper.dart';
import 'package:simz_academy/providers/payment_history.dart';

class PaymentHistoryConsumer extends ConsumerWidget {
  const PaymentHistoryConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paymentAsyncValue = ref.watch(paymentProvider);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
          title: HomeUiHelper().customText('Payment History', 20,
              FontWeight.w600, Color.fromRGBO(56, 15, 67, 1))),
      body: Center(
          child: paymentAsyncValue.when(
        data: (fees) {
          if (fees.isEmpty) {
            return Text('No History Found');
          }
          return ListView.builder(
            itemCount: fees.length,
            itemBuilder: (context, index) {
              final fee = fees[index];
              return Padding(
                padding: const EdgeInsets.only(top: 4.0,bottom: 4.0,left: 12,right: 12),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(196, 220, 243, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: Icon(
                      IconsaxPlusBold.wallet_1,
                      color: Color.fromRGBO(201, 144, 20, 1),
                      size: 40,
                    ),
                    title: HomeUiHelper().customText('${fee['course_name']}', 20,
                        FontWeight.w600, Color.fromRGBO(27, 71, 113, 1)),
                    subtitle: HomeUiHelper().customText('${fee['created_at']}', 15,
                        FontWeight.w300, Color.fromRGBO(27, 71, 113, 1)),
                    trailing: HomeUiHelper().customText('₹ ${fee['amount']}', 32,
                        FontWeight.w700, Color.fromRGBO(27, 71, 113, 1)),
                  ),
                ),
              );
            },
          );
        },
        error: (error, stack) => Text('Error: $error'),
        loading: () => CircularProgressIndicator(),
      )),
    );
  }
}
