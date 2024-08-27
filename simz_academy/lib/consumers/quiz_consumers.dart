import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simz_academy/UIHelper/home_ui_helper.dart';
import 'package:simz_academy/functions/show_alert.dart';
import 'package:simz_academy/providers/quiz_provider.dart';
//import 'package:simz_academy/screens/quizizz_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// A ConsumerWidget that displays a list of quizzes.
///
/// The widget uses the `quizProvider` to fetch the quiz data and displays a
/// loading indicator until the data is available. If an error occurs, it
/// displays an error message.
///
/// Example:
///
/// ```dart
/// QuizConsumers();
/// ```
class QuizConsumers extends ConsumerWidget {
  /// Creates a new instance of [QuizConsumers].
  const QuizConsumers({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Watches the `quizProvider` and returns the current async value.
    final quizAsyncValue = ref.watch(quizProvider);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: HomeUiHelper().customText('Check your Brains', 20,
            FontWeight.w600, Color.fromRGBO(56, 15, 67, 1)),
      ),
      body: Center(
        child: quizAsyncValue.when(
          /// Returns a [ListView] of quizzes if the data is available.
          data: (quiz) {
            if (quiz.isEmpty) {
              return Text("No Data");
            }
            return ListView.builder(
              itemCount: quiz.length,
              itemBuilder: (context, index) {
                final s = quiz[index];
                return Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 15, right: 15),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(246, 235, 252, 1),
                        borderRadius: BorderRadius.circular(16)),
                    child: ListTile(
                      leading: Image.asset(
                          'lib/assets/images/keys_illustration.png'),
                      title: HomeUiHelper().customText('${s['quiz_name']}', 24,
                          FontWeight.w700, Color.fromRGBO(27, 71, 113, 1)),
                      trailing: TextButton(
                          style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                                  Color.fromRGBO(223, 183, 240, 1)),
                              shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10)))),
                          onPressed: () async {
                            final response = await Supabase.instance.client
                                .from('quiz')
                                .select('quiz_url')
                                .eq('id', index + 1)
                                .single();
                            String data = response['quiz_url'].toString();
                            showAlertBox(context, data);
                          },
                          child: HomeUiHelper().customText('Join', 16,
                              FontWeight.w600, Color.fromRGBO(56, 15, 67, 1))),
                    ),
                  ),
                );
              },
            );
          },

          /// Returns an error message if an error occurs.
          error: (error, stack) => Text('Error: $error'),

          /// Returns a loading indicator while the data is being fetched.
          loading: () => CircularProgressIndicator(),
        ),
      ),
    );
  }
}
