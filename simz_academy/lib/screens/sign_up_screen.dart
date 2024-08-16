import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:simz_academy/UIHelper/home_ui_helper.dart';
import 'package:simz_academy/constants/supabase_functions.dart';
import 'package:simz_academy/screens/bottom_nav.dart';
import 'package:simz_academy/screens/forgot_password.dart';
import 'package:simz_academy/screens/redirect_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController =
      TextEditingController(); // emailController variable
  final TextEditingController _passwordController =
      TextEditingController(); // passwordController variable
  final TextEditingController _phoneNumberController =
      TextEditingController(); // phoneNumberController variable
  final TextEditingController _userNameController =
      TextEditingController(); // user name  variable
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
                  height: 80,
                ),

                //Login image
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 216,
                    width: 215,
                    child: Image.asset(
                      'lib/assets/images/sign_up.png',
                    ),
                  ),
                ),

                //Login text
                HomeUiHelper().customText(
                  'Register',
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
                //Phone Number section
                HomeUiHelper().customText(
                    'Phone Number', 16, FontWeight.w600, Color(0xFF380F43)),

                SizedBox(height: 5),

                TextField(
                  controller: _phoneNumberController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFECD7F7),
                    hintText: 'Enter your Phone Number',
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

                //sign up button
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    final sm = ScaffoldMessenger.of(context);
                    bool isEmailValid(String email) {
                      return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(email);
                    }

                    if (emailController.text.isEmpty &&
                        _phoneNumberController.text.isEmpty) {
                      sm.showSnackBar(SnackBar(
                        content: Text(
                            'Please provide either an email or phone number'),
                      ));
                    } else if (emailController.text.isNotEmpty &&
                        !isEmailValid(emailController.text)) {
                      sm.showSnackBar(SnackBar(
                        content: Text('Please enter a valid email address'),
                      ));
                    } else if (_passwordController.text.length < 8) {
                      sm.showSnackBar(SnackBar(
                        content: Text('Password must be at least 8 characters'),
                      ));
                    } else if (!RegExp(r'[!@#%&*()_+=\-?/<>\.,;:\[\]{}|`~]')
                        .hasMatch(_passwordController.text)) {
                      sm.showSnackBar(SnackBar(
                        content: Text(
                            'Password must contain at least one special character'),
                      ));
                    } else {
                      print(emailController.text);
                      print(_passwordController.text);
                      print(_phoneNumberController.text);
                      print(_userNameController.text);
                      final authResponse = await supabase.auth.signUp(
                        email: emailController.text,
                        password: _passwordController.text,
                        data: {
                          "username": _userNameController.text,
                          "phone": _phoneNumberController.text
                        },
                        //phone: _phoneNumberController.text,
                      );
                      sm.showSnackBar(SnackBar(
                        content:
                            Text('Logged In: ${authResponse.user!.email!}'),
                      ));
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
                    'Sign Up',
                    24,
                    FontWeight.w700,
                    Color(0xFFECD7F7),
                  ),
                ),

                //Navigate to Sign In
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Have an account?  ',
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF380F43),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Login',
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
