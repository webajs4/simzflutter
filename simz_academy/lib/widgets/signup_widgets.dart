import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:simz_academy/UIHelper/home_ui_helper.dart';
//import 'package:simz_academy/constants/supabase_functions.dart';
//import 'package:simz_academy/screens/forgot_password.dart';
import 'package:simz_academy/screens/otp_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpSmallScreen extends StatefulWidget {
  const SignUpSmallScreen({super.key});

  @override
  State<SignUpSmallScreen> createState() => _SignUpSmallScreenState();
}

class _SignUpSmallScreenState extends State<SignUpSmallScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool isPasswordVisible = false;
  final supabase = Supabase.instance.client;
  bool submitted = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 80),

                // Sign-up image
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 216,
                    width: 215,
                    child: Image.asset('lib/assets/images/sign_up.png'),
                  ),
                ),

                // Sign-up text
                Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF380F43),
                  ),
                ),

                const SizedBox(height: 10),

                // Email section
                Text(
                  'Email Address',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF380F43),
                  ),
                ),
                const SizedBox(height: 5),
                TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFECD7F7),
                      hintText: 'Enter your email address',
                      hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 209, 190, 219),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: const Color(0xFF380F43),
                        ),
                      ),
                    )
                ),

                const SizedBox(height: 10),

                //Username section
                Text(
                  'Full Name',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF380F43),
                  ),
                ),

                //user name textfield
                const SizedBox(height: 5),
                TextField(
                  controller: _userNameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFECD7F7),
                    hintText: 'Enter your full name',
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 209, 190, 219),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: const Color(0xFF380F43),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Phone Number section
                Text(
                  'Phone Number',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF380F43),
                  ),
                ),
                const SizedBox(height: 5),
                TextField(
                  controller: _phoneNumberController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFECD7F7),
                    hintText: 'Enter your Phone Number',
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 209, 190, 219),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: const Color(0xFF380F43),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // Password section
                Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF380F43),
                  ),
                ),
                const SizedBox(height: 5),
                TextField(
                  controller: _passwordController,
                  obscureText: !isPasswordVisible,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      icon: isPasswordVisible
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
                      borderSide: BorderSide(
                        color: const Color(0xFF380F43),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                //confirm password section
                Text(
                  'Confirm Password',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF380F43),
                  ),
                ),

                const SizedBox(height: 5),
                TextField(
                  controller: _confirmPasswordController,
                  obscureText: !isPasswordVisible,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      icon: isPasswordVisible
                          ? const Icon(Iconsax.eye)
                          : const Icon(Iconsax.eye_slash),
                    ),
                    filled: true,
                    fillColor: const Color(0xFFECD7F7),
                    hintText: 'Confirm your Password',
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 209, 190, 219),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: const Color(0xFF380F43),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // Sign-up button
                ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      submitted = true;
                    });
                    final sm = ScaffoldMessenger.of(context);

                    bool isEmailValid(String email) {
                      return RegExp(r"^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$")
                          .hasMatch(email);
                    }

                    try {
                      if (emailController.text.isEmpty &&
                          _phoneNumberController.text.isEmpty) {
                        sm.showSnackBar(const SnackBar(
                          content: Text(
                              'Please provide either an email or phone number'),
                        ));
                      } else if (emailController.text.isNotEmpty &&
                          !isEmailValid(emailController.text)) {
                        sm.showSnackBar(const SnackBar(
                          content: Text('Please enter a valid email address'),
                        ));
                      } else if (_passwordController.text.length < 8) {
                        sm.showSnackBar(const SnackBar(
                          content: Text(
                              'Password must be at least 8 characters long'),
                        ));
                      } else if (!RegExp(r"[!@#%&*()_+=\-?/<>.,;:\[\]{}|`~]")
                          .hasMatch(_passwordController.text)) {
                        sm.showSnackBar(const SnackBar(
                          content: Text(
                              'Password must contain at least one special character'),
                        ));
                      } else if (_passwordController.text !=
                          _confirmPasswordController.text) {
                        sm.showSnackBar(const SnackBar(content: Text('Password does not match'),));
                      } else {
                        final authResponse = await supabase.auth.signUp(
                          email: emailController.text,
                          password: _passwordController.text,
                          data: {
                            "username": _userNameController.text,
                            "phone": _phoneNumberController.text
                          },
                        );
                        sm.showSnackBar(SnackBar(
                          content: Text(
                              'Verify your account using OTP that has sent to :  ${authResponse.user!.email!}'),
                        ));
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return  OtpScreen(email: emailController.text);
                        }));
                      }
                    } catch (error) {
                      sm.showSnackBar(
                          SnackBar(content: Text('Error signing up: $error')));
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
                      ? const CircularProgressIndicator(
                    valueColor:
                    AlwaysStoppedAnimation<Color>(Color(0xFFECD7F7)),
                  )
                      : HomeUiHelper().customText(
                    'Sign Up',
                    24,
                    FontWeight.w700,
                    Color(0xFFECD7F7),
                  ),
                ),

                const SizedBox(height: 25),

                // Navigate to Sign In
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Have an account?  ',
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF380F43),
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
                          color: const Color(0xFFC61515),
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


class SignUpLargeScreen extends StatefulWidget {
  const SignUpLargeScreen({super.key});

  @override
  State<SignUpLargeScreen> createState() => _SignUpLargeScreenState();
}

class _SignUpLargeScreenState extends State<SignUpLargeScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool isPasswordVisible = false;
  final supabase = Supabase.instance.client;
  bool submitted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GridView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(), // Disable internal scrolling
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 1 column with two rows
              childAspectRatio: 0.8, // Adjust this to fit image and form proportionally
            ),
            children: [
              // First container for the sign-up image
              SizedBox(
                height: 216,
                width: 215,
                child: Image.asset('lib/assets/images/sign_up.png'),
              ),

              // Second container for the sign-up form
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Sign-up text
                  Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF380F43),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Email section
                  _buildTextField('Email Address', emailController, 'Enter your email address'),

                  const SizedBox(height: 10),

                  // Full Name section
                  _buildTextField('Full Name', _userNameController, 'Enter your full name'),

                  const SizedBox(height: 10),

                  // Phone Number section
                  _buildTextField('Phone Number', _phoneNumberController, 'Enter your Phone Number'),

                  const SizedBox(height: 10),

                  // Password section
                  _buildPasswordField('Password', _passwordController, 'Enter your Password'),

                  const SizedBox(height: 10),

                  // Confirm Password section
                  _buildPasswordField('Confirm Password', _confirmPasswordController, 'Confirm your Password'),

                  const SizedBox(height: 40),

                  // Sign-up button
                  ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        submitted = true;
                      });
                      final sm = ScaffoldMessenger.of(context);

                      bool isEmailValid(String email) {
                        return RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
                      }

                      try {
                        if (emailController.text.isEmpty && _phoneNumberController.text.isEmpty) {
                          sm.showSnackBar(const SnackBar(
                            content: Text('Please provide either an email or phone number'),
                          ));
                        } else if (emailController.text.isNotEmpty && !isEmailValid(emailController.text)) {
                          sm.showSnackBar(const SnackBar(
                            content: Text('Please enter a valid email address'),
                          ));
                        } else if (_passwordController.text.length < 8) {
                          sm.showSnackBar(const SnackBar(
                            content: Text('Password must be at least 8 characters long'),
                          ));
                        } else if (!RegExp(r'[!@#%&*()_+=\-?/<>.,;:\[\]{}|`~]').hasMatch(_passwordController.text)) {
                          sm.showSnackBar(const SnackBar(
                            content: Text('Password must contain at least one special character'),
                          ));
                        } else if (_passwordController.text != _confirmPasswordController.text) {
                          sm.showSnackBar(const SnackBar(content: Text('Password does not match')));
                        } else {
                          final authResponse = await supabase.auth.signUp(
                            email: emailController.text,
                            password: _passwordController.text,
                            data: {
                              "username": _userNameController.text,
                              "phone": _phoneNumberController.text
                            },
                          );
                          sm.showSnackBar(SnackBar(
                            content: Text('Verify your account using OTP sent to :  ${authResponse.user!.email!}'),
                          ));
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                            return OtpScreen(email: emailController.text);
                          }));
                        }
                      } catch (error) {
                        sm.showSnackBar(SnackBar(content: Text('Error signing up: $error')));
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
                        ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFECD7F7)),
                    )
                        : HomeUiHelper().customText(
                      'Sign Up',
                      24,
                      FontWeight.w700,
                      const Color(0xFFECD7F7),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // Navigate to Sign In
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Have an account?  ',
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF380F43),
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
                            color: const Color(0xFFC61515),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build TextFields
  Widget _buildTextField(String label, TextEditingController controller, String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF380F43),
          ),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFECD7F7),
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Color.fromARGB(255, 209, 190, 219),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: const Color(0xFF380F43),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Helper method to build password fields with visibility toggle
  Widget _buildPasswordField(String label, TextEditingController controller, String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF380F43),
          ),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          obscureText: !isPasswordVisible,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isPasswordVisible = !isPasswordVisible;
                });
              },
              icon: isPasswordVisible
                  ? const Icon(Iconsax.eye)
                  : const Icon(Iconsax.eye_slash),
            ),
            filled: true,
            fillColor: const Color(0xFFECD7F7),
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Color.fromARGB(255, 209, 190, 219),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: const Color(0xFF380F43),
              ),
            ),
          ),
        ),
      ],
    );
  }
}


