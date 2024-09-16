import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:simz_academy/UIHelper/home_ui_helper.dart';
import 'package:simz_academy/constants/screen_details.dart';
import 'package:simz_academy/constants/supabase_functions.dart';
import 'package:simz_academy/screens/bottom_nav.dart';
import 'package:simz_academy/screens/forgot_password.dart';
import 'package:simz_academy/screens/sign_up_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginSmallScreen extends StatefulWidget {
  const LoginSmallScreen({super.key});

  @override
  State<LoginSmallScreen> createState() => _LoginSmallScreenState();
}

class _LoginSmallScreenState extends State<LoginSmallScreen> {
  bool submitted = false;
  TextEditingController emailController =
      TextEditingController(); // emailController variable
  final TextEditingController _passwordController =
      TextEditingController(); // passwordController variable
  bool isPasswordVisible = false;
  final supabase = Supabase.instance.client;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
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
                    setState(() {
                      submitted = true;
                    });
                    final sm = ScaffoldMessenger.of(context);
                    List condition = LoginValidator(
                      context,
                      emailController,
                      _passwordController,
                    );

                    if (condition.isEmpty) {
                      try {
                        final authResponse =
                            await supabase.auth.signInWithPassword(
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
                      } catch (error) {
                        sm.showSnackBar(
                            SnackBar(content: Text('Error: $error')));
                        debugPrint(error.toString());
                      }
                    } else {
                      sm.showSnackBar(SnackBar(
                        content: Text(
                            'Please Correct the following mistakes: \n${condition.toString().replaceAll('[', '').replaceAll(']', '').replaceAll(', ', '\n')}'),
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
                  child: (submitted)
                      ? CircularProgressIndicator()
                      : HomeUiHelper().customText(
                          'Login', 20, FontWeight.w600, Color(0xFFFFFFFF)),
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


class LoginLargeScreen extends StatefulWidget {
  const LoginLargeScreen({super.key});

  @override
  State<LoginLargeScreen> createState() => _LoginLargeScreenState();
}

class _LoginLargeScreenState extends State<LoginLargeScreen> {
  bool submitted = false;
  TextEditingController emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isPasswordVisible = false;
  final supabase = Supabase.instance.client;

  @override
  Widget build(BuildContext context) {
    double width = ScreenDetails().getScreenWidth(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Since we want the image and form in one column
              childAspectRatio: 1, // Adjust this to balance image and form sizes
            ),
            children: [
              // First Container for the image
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 216,
                  width: 215,
                  child: Image.asset('lib/assets/images/login.png'),
                ),
              ),
              // Second Container for the form fields and buttons
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  HomeUiHelper().customText(
                    'LOGIN',
                    36,
                    FontWeight.w600,
                    const Color(0xFF380F43),
                  ),

                  const SizedBox(height: 10),

                  // Email field
                  HomeUiHelper().customText(
                      'Email Address', 16, FontWeight.w600, const Color(0xFF380F43)),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: width/2.5,
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFECD7F7),
                        hintText: 'Enter your email address',
                        hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 209, 190, 219),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xFFECD7F7),
                          ),
                        ),
                      ),
                      controller: emailController,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Password field
                  HomeUiHelper().customText(
                      'Password', 16, FontWeight.w600, const Color(0xFF380F43)),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: width/2.5,
                    child: TextField(
                      obscureText: !isPasswordVisible,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                          icon: (isPasswordVisible)
                              ? const Icon(Iconsax.eye)
                              : const Icon(Iconsax.eye_slash),
                        ),
                        filled: true,
                        fillColor: const Color(0xFFECD7F7),
                        hintText: 'Enter your Password',
                        hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 209, 190, 219),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xFFECD7F7),
                          ),
                        ),
                      ),
                      controller: _passwordController,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Forgot password link
                  Padding(
                    padding:  EdgeInsets.only(right: width/11.5),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) {
                                return const ForgotPasswordScreen();
                              }),
                            );
                          },
                          child: HomeUiHelper().customText(
                              'Forgot Password?', 16, FontWeight.w500, const Color(0xFF380F43))),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Login button
                  SizedBox(
                    width: width/2.5,
                    child: ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          submitted = true;
                        });
                        final sm = ScaffoldMessenger.of(context);
                        List condition = LoginValidator(
                          context,
                          emailController,
                          _passwordController,
                        );

                        if (condition.isEmpty) {
                          try {
                            final authResponse = await supabase.auth.signInWithPassword(
                              email: emailController.text,
                              password: _passwordController.text,
                            );
                            sm.showSnackBar(SnackBar(
                              content: Text('Logged In: ${authResponse.user!.email!}'),
                            ));
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) {
                                return const BottomNav();
                              }),
                            );
                          } catch (error) {
                            sm.showSnackBar(SnackBar(content: Text('Error: $error')));
                            debugPrint(error.toString());
                          }
                        } else {
                          sm.showSnackBar(SnackBar(
                            content: Text(
                                'Please Correct the following mistakes: \n${condition.toString().replaceAll('[', '').replaceAll(']', '').replaceAll(', ', '\n')}'),
                          ));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 4,
                        shadowColor: const Color.fromRGBO(137, 60, 162, 1),
                        backgroundColor: const Color.fromRGBO(137, 60, 162, 1),
                        minimumSize: const Size(double.infinity, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: (submitted)
                          ? const CircularProgressIndicator()
                          : HomeUiHelper().customText(
                          'Login', 20, FontWeight.w600, const Color(0xFFFFFFFF)),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // Navigate to Sign Up link
                  Padding(
                    padding: EdgeInsets.only(right: width/11.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account?  ',
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF380F43),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) {
                                return const SignUpScreen();
                              }),
                            );
                          },
                          child: Text(
                            'Sign Up',
                            style: GoogleFonts.inter(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFFC61515),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
