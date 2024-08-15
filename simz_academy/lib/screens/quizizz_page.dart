import 'package:flutter/material.dart';
//import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

class QuizizzPage extends StatefulWidget {
  final int index;
  const QuizizzPage({super.key, required this.index});

  @override
  State<QuizizzPage> createState() => _QuizizzPageState();
}

class _QuizizzPageState extends State<QuizizzPage> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.disabled)
      ..loadRequest(Uri.parse(getUri(widget.index)));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WebViewWidget(controller: controller),
      ),
    );
  }
  
  static String getUri(index) {
    //final response = Supabase.instance.client.from('quiz').select('quiz_url').eq('id', index).single();
    
    // if(response != null){
    //   Map<String, dynamic> data = response;
    // }

  // Return a default URL if the query fails or the URL is not found
  return 'https://quizizz.com/admin/quiz/5e8460f8569212001ca7ddc0/music?fromSearch=true&source=';
  }
}