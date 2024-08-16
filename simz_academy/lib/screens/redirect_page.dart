import 'package:flutter/material.dart';
import 'package:simz_academy/screens/bottom_nav.dart';
//import 'package:simz_academy/screens/home_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RedirectPage extends StatefulWidget {
  const RedirectPage({super.key});

  @override
  State<RedirectPage> createState() => _RedirectPageState();
}

class _RedirectPageState extends State<RedirectPage> {
  bool _isConfirmed = false; // Flag to track confirmation status

  @override
  void initState() {
    super.initState();
    _checkUserConfirmed();
  }

  Future<void> _checkUserConfirmed() async {
    final supabase = Supabase.instance.client;
    final user = supabase.auth.currentUser;

    if (user != null) {
      // ignore: unused_local_variable
      final isConfirmed = user.emailConfirmedAt != null;
      setState(() {
        _isConfirmed = true;
      });
    } else {
      setState(() {
        _isConfirmed = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _isConfirmed
                ? const Icon(Icons.check_circle_outline, size: 50, color: Colors.green)
                : const CircularProgressIndicator(),
            const SizedBox(height: 20),
            _isConfirmed
                ? const Text('You are logged in')
                : const Text('Redirecting...'),
            if (_isConfirmed)
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const BottomNav()),
                  );
                },
                child: const Text('Go to BottomNav'),
              ),
          ],
        ),
      ),
    );
  }
}
