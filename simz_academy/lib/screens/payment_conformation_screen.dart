import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:simz_academy/UIHelper/home_ui_helper.dart';

import '../widgets/payment_details_widget.dart';
class PaymentConformationScreen extends StatelessWidget {
  final String courseName;
  final String coursePrice;
  const PaymentConformationScreen({super.key, required this.courseName, required this.coursePrice});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(


      //app bar
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Iconsax.arrow_square_left, color: Color.fromRGBO(129, 50, 153, 1),),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: const [SizedBox(width: 40,)],
        title: Center(child: HomeUiHelper().customText('Confirm Payment', 24, FontWeight.w400, Color.fromRGBO(129, 50, 153, 1),))
      ),


      //body

      body: paymentDetailsWidget(
        courseName.toString(),coursePrice.toString()
      ),
    );
  }
}
