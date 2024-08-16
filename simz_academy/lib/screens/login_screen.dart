import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:simz_academy/UIHelper/home_ui_helper.dart';
import 'package:simz_academy/constants/supabase_functions.dart';
import 'package:simz_academy/screens/bottom_nav.dart';
import 'package:simz_academy/screens/forgot_password.dart';
import 'package:simz_academy/screens/sign_up_screen.dart';
//import 'package:simz_academy/screens/splash_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController =
      TextEditingController(); // emailController variable
  final TextEditingController _passwordController =
      TextEditingController(); // passwordController variable
  bool isPasswordVisible = false;
  final supabase = Supabase.instance.client;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 100,
                ),

                //Login image
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 216,
                    width: 215,
                    child: Image.asset(
                      'lib/assets/images/login.png',
                    ),
                  ),
                ),

                //Login text
                HomeUiHelper().customText(
                  'LOGIN',
                  36,
                  FontWeight.w600,
                  Color(0xFF380F43),
                ),

                //Login form
                const SizedBox(
                  height: 10,
                ),

                //email section
                HomeUiHelper().customText(
                    'Email Address', 16, FontWeight.w600, Color(0xFF380F43)),
                SizedBox(height: 5),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFECD7F7),
                    hintText: 'Enter your email address',
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 209, 190, 219),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Color(0xFFECD7F7),
                      ),
                    ),
                  ),
                  controller: emailController,
                ),

                const SizedBox(
                  height: 10,
                ),
                //password section
                HomeUiHelper().customText(
                    'Password', 16, FontWeight.w600, Color(0xFF380F43)),
                SizedBox(height: 5),
                TextField(
                  obscureText: !isPasswordVisible,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      icon: (isPasswordVisible)
                          ? Icon(Iconsax.eye)
                          : Icon(Iconsax.eye_slash),
                    ),
                    filled: true,
                    fillColor: Color(0xFFECD7F7),
                    hintText: 'Enter your Password',
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 209, 190, 219),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Color(0xFFECD7F7),
                      ),
                    ),
                  ),
                  controller: _passwordController,
                ),

                const SizedBox(
                  height: 10,
                ),
                //forgot password
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return ForgotPasswordScreen();
                        }));
                      },
                      child: HomeUiHelper().customText('Forgot Password?', 16,
                          FontWeight.w500, Color(0xFF380F43))),
                ),

                //login button
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    final sm = ScaffoldMessenger.of(context);
                    List condition = LoginValidator(
                        context,
                        emailController,
                        _passwordController,);
                    //print(emailController.text);
                    //print(_passwordController.text);
                    //print(condition.length);
                    //print(condition);
                    if (condition.isEmpty) {
                      //print("Entered IF condition");
                      try {
                        final authResponse = await supabase.auth.signInWithPassword(
                          email: emailController.text,
                          password: _passwordController.text,
                        );
                      sm.showSnackBar(SnackBar(
                        content:
                            Text('Logged In: ${authResponse.user!.email!}'),
                      ));
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) {
                        return BottomNav();

                      }));
                      }
                      catch (error) {
                        sm.showSnackBar(SnackBar(content: Text('Error: $error')));
                        print(error);
                      }
                    } else {
                      sm.showSnackBar(SnackBar(
                        content: Text('Please Correct the following mistakes: \n${condition.toString().replaceAll('[', '').replaceAll(']', '').replaceAll(', ', '\n')}'),
                      ));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 4,
                    shadowColor: Color.fromRGBO(137, 60, 162, 1),
                    backgroundColor: Color.fromRGBO(137, 60, 162, 1),
                    minimumSize: Size(double.infinity, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: HomeUiHelper().customText(
                      'Login', 24, FontWeight.w700, Color(0xFFECD7F7)),
                ),

                //Navigate to Sign up
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?  ',
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF380F43),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return SignUpScreen();
                        }));
                      },
                      child: Text(
                        'Sign Up',
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFC61515),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
