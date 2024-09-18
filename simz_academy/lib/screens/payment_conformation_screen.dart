import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:simz_academy/UIHelper/home_ui_helper.dart';
import 'package:simz_academy/screens/print_receipt.dart';

import '../widgets/payment_details_widget.dart';

class PaymentConformationScreen extends StatefulWidget {
  final String courseName;
  final String coursePrice;
  const PaymentConformationScreen(
      {super.key, required this.courseName, required this.coursePrice});

  @override
  State<PaymentConformationScreen> createState() =>
      _PaymentConformationScreenState();
}

class _PaymentConformationScreenState extends State<PaymentConformationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app bar
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Iconsax.arrow_square_left,
              color: Color.fromRGBO(129, 50, 153, 1),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: const [
            SizedBox(
              width: 40,
            )
          ],
          title: Center(
              child: HomeUiHelper().customText(
            'Confirm Payment',
            24,
            FontWeight.w400,
            Color.fromRGBO(129, 50, 153, 1),
          ))),

      //body

      body: paymentDetailsWidget(
          widget.courseName.toString(), widget.coursePrice.toString()),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          onPressed: () {
            try {
              Razorpay razorpay = Razorpay();
              var options = {
                'key': 'rzp_test_h1yMv0Q94W2oYE',
                'amount': double.parse(widget.coursePrice) * 100,
                'name': widget.courseName,
                'description': 'Simz Academy',
                'retry': {'enabled': true, 'max_count': 1},
                'send_sms_hash': true,
                'prefill': {
                  'contact': '8086350450',
                  'email': 'test@razorpay.com'
                },
                'external': {
                  'wallets': ['googlepay', 'phonepe', 'amazonpay'],
                },
              };
              razorpay.open(options);
              razorpay.on(
                  Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
              razorpay.on(
                  Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
              razorpay.on(
                  Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWalletSelected);
            } catch (e) {
              debugPrint(e.toString());
            }
          },
          child: Container(
            height: 50,
            color: Color.fromRGBO(129, 50, 153, 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HomeUiHelper()
                    .customText('Pay Now', 20, FontWeight.w400, Colors.white)
              ],
            ),
          ),
        ),
      ),
    );
  }

  handlePaymentErrorResponse(PaymentFailureResponse response) {
    showAlertDialog(context, "Payment Failed",
        "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    showAlertDialog(
        context, "Payment Successful", "Payment ID: ${response.paymentId}");
  }

  handleExternalWalletSelected(ExternalWalletResponse response) {
    showAlertDialog(
        context, "External Wallet Selected", "${response.walletName}");
  }

  void showAlertDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              child: Text("Print details"),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                  return PrintReceipt(title: 'Hello World',);
                }));
              },
            )
          ],
        );
      },
    );
  }
}
