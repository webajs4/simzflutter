import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const supaBaseUrl = 'https://nsnsqbbmcjzjadfrsieo.supabase.co';

const supaAnonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5zbnNxYmJtY2p6amFkZnJzaWVvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjEyMTcxOTEsImV4cCI6MjAzNjc5MzE5MX0.58_-T2tUxe9lKS-k3ysPDGLEYvn7NTl7hYKUBFFk8R8';

final userId=getCurrentUserId();

final userName=getCurrentUserName();


final userEmail = getCurrentUserEmail();

final supabase = Supabase.instance.client;



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

String getCurrentUserId() {
  final supabase = Supabase.instance.client;
  final user = supabase.auth.currentUser;
  return user!.id;
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
  print('$email, $password, $mobile, $username');
  final sm = ScaffoldMessenger.of(context);
  try {
    final AuthResponse res = await supabase.auth.signUp(
      email: email,
      password: password,
      // phone: mobile,
      data: {"username": username,"phone": mobile},
    );
    } catch (error) {
    sm.showSnackBar(SnackBar(content: Text('Error: $error')));
    print(error);
  }
}