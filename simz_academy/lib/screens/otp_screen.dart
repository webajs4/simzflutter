// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:simz_academy/UIHelper/home_ui_helper.dart';
import 'package:simz_academy/constants/screen_details.dart';
//import 'package:simz_academy/constants/supabase_functions.dart';
import 'package:simz_academy/screens/bottom_nav.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OtpScreen extends StatefulWidget {
  final email;
  const OtpScreen({super.key, required this.email});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  // creating a variable to store the OTP
  String otp = '';
  bool submitted = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding:
          const EdgeInsets.only(top: 15.0, left: 10, right: 10, bottom: 10),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: HomeUiHelper().customText(
                  'Verification',
                  36,
                  FontWeight.w600,
                  Color(0xFF380F43),
                ),
              ),
              Image.asset(
                'lib/assets/images/otp_verification.png',
              ),
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: ScreenDetails().getScreenWidth(context) > 800 ? Alignment.center : Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: HomeUiHelper().customText('Enter the Code ', 24,
                      FontWeight.w600, Color(0xFF380F43)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //otp text field
              OtpTextField(
                numberOfFields: 6,
                borderColor: Color(0xFF380F43),
                focusedBorderColor: Color(0xFF380F43),
                disabledBorderColor: Color(0xFF380F43),
                showFieldAsBox: true,
                onSubmit: (value) {
                  setState(() {
                    otp = value;
                  });
                  //print(otp);
                },
              ),
              const SizedBox(
                height: 40,
              ),
              //Resend OTP button
              InkWell(
                onTap: ()async{
                  setState(() {
                    submitted=false;
                  });
                  final response = await Supabase.instance.client.auth.resend(type: OtpType.signup, email: widget.email.toString());
                  //if OTP is not sent, show error message
                  if(response.messageId==null){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Error in sending OTP. Try again later'),
                    ));
                  }
                  //else show success message
                  else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('OTP sent successfully'),
                    ));
                  }
                },
                child: HomeUiHelper().customText(
                    'Resend OTP', 15, FontWeight.w400, Color(0xFF380F43)),
              ),
              const SizedBox(
                height: 20,
              ),
              //verify button
              SizedBox(
                width: 367,
                height: 63,
                child: ElevatedButton(
                  style: ButtonStyle(
                    elevation: WidgetStateProperty.all(4),
                    backgroundColor: WidgetStateProperty.all(Color(0xFF893CA2)),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: () async{
                    setState(() {
                      submitted = true;
                    });
                    try{
                      final response = await Supabase.instance.client.auth.verifyOTP(type: OtpType.email , token: otp, email: widget.email.toString());
                    // on verification success, navigate to the home screen
                    if(response.session!=null){
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const BottomNav()),
                      );
                    }
                    //else show error message
                    else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Error: Check the OTP and try again'),
                      ));
                    }}
                    catch(e){
                      debugPrint(e.toString());
                    }
                  },
                  child: (submitted)?CircularProgressIndicator():HomeUiHelper().customText(
                      'Verify', 24, FontWeight.w600, Color(0xFFECD7F7)),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
