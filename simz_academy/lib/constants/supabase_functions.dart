// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:simz_academy/screens/bottom_nav.dart';
import 'package:simz_academy/screens/redirect_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const supaBaseUrl = 'https://nsnsqbbmcjzjadfrsieo.supabase.co';

const supaAnonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5zbnNxYmJtY2p6amFkZnJzaWVvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjEyMTcxOTEsImV4cCI6MjAzNjc5MzE5MX0.58_-T2tUxe9lKS-k3ysPDGLEYvn7NTl7hYKUBFFk8R8';

// final userId=getCurrentUserId();

final userName=getCurrentUserName();


final userEmail = getCurrentUserEmail();

String getCurrentUserName() {
  final supabase = Supabase.instance.client;
  final user = supabase.auth.currentUser;

  if (user != null) {
    return user.userMetadata!['username'];
  } else {
    // Handle case where user is not logged in
    return 'No username found';
  }
}

String getCurrentUserId(BuildContext context) {
  final supabase = Supabase.instance.client;
  final user = supabase.auth.currentUser;
  if (user != null) {
    return user.id;
  } else {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => RedirectPage()),
    );
    return 'No user found';
  }
}

String getCurrentUserEmail() {
  final supabase = Supabase.instance.client;
  final user = supabase.auth.currentUser;
  
    return user!.email!;
}


Future<void> SignUp(BuildContext context,
    String email,
    String password,
    String mobile,
    String username) async {
  final supabase = Supabase.instance.client;
  //final user = supabase.auth.currentUser;
  //print('$email, $password, $mobile, $username');
  final sm = ScaffoldMessenger.of(context);
  try {
    await supabase.auth.signUp(
      email: email,
      password: password,
      // phone: mobile,
      data: {"username": username,"phone": mobile},
    );
    } catch (error) {
    sm.showSnackBar(SnackBar(content: Text('Error: $error')));
    //print(error);
  }
}

List SignUpValidator(
    BuildContext context,
    TextEditingController emailController,
    TextEditingController _passwordController,
    TextEditingController _phoneNumberController,
    TextEditingController _userNameController,
    ){
    List errors = [];
    bool isEmailValid(String email) {
      return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
          .hasMatch(email);
    }
    if (_userNameController.text.isEmpty) {
      errors.add('Please enter username');
    }
    if (emailController.text.isEmpty &&
        _phoneNumberController.text.isEmpty) {
          errors.add('Please enter email or phone number');} 

    if (emailController.text.isNotEmpty &&
        !isEmailValid(emailController.text)) {
          errors.add('Please enter a valid email');}

    if (_passwordController.text.length < 8) {
          errors.add('Password must be at least 8 characters');}

    if (!RegExp(r'[!@#%&*()_+=\-?/<>\.,;:\[\]{}|`~]')
        .hasMatch(_passwordController.text)) {
     errors.add('Password must contain at least one special character');
    } 
    else {
      errors = [];
    }
    return errors;
  }

List LoginValidator(
    BuildContext context,
    TextEditingController emailController,
    TextEditingController _passwordController,
    ){
    List errors = [];
    bool isEmailValid(String email) {
      return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
          .hasMatch(email);
    }
    if (emailController.text.isEmpty) {
          errors.add('Please enter email or phone number');} 

    if (emailController.text.isNotEmpty &&
        !isEmailValid(emailController.text)) {
          errors.add('Please enter a valid email');}

    if (_passwordController.text.length < 8) {
          errors.add('Password must be at least 8 characters');}

    if (!RegExp(r'[!@#%&*()_+=\-?/<>\.,;:\[\]{}|`~]')
        .hasMatch(_passwordController.text)) {
     errors.add('Password must contain at least one special character');
    } 
    else {
      errors = [];
    }
    return errors;
  }