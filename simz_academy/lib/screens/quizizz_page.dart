// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// //import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class QuizizzPage extends StatefulWidget {
//   final int index;
//   const QuizizzPage({super.key, required this.index});

//   @override
//   State<QuizizzPage> createState() => _QuizizzPageState();
// }

// class _QuizizzPageState extends State<QuizizzPage> {
//   late WebViewController controller;

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   controller = WebViewController()
//   //     ..setJavaScriptMode(JavaScriptMode.disabled)
//   //     ..loadRequest(Uri.parse(getUri(widget.index)));
//   // }

//   @override
//   Widget build(BuildContext context) {
//     getUri(widget.index);
//     return SafeArea(
//       child: Scaffold(
        
//       ),
//     );
//   }
  
//   static getUri(index) async {
//     final response = await Supabase.instance.client.from('quiz').select('quiz_url').eq('id',index+1).single();
//     String data = response['quiz_url'].toString();
//     print(data);

//   // Return a default URL if the query fails or the URL is not found
//   return 'value';
//   }
// }