import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:simz_academy/UIHelper/home_ui_helper.dart';
import 'package:simz_academy/providers/practice_provider.dart';

class PractiseConsumers extends ConsumerWidget {
  const PractiseConsumers({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final practiseAsyncValue = ref.watch(practiseProvider);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: HomeUiHelper().customText(
          'Keyboard Lessons',
          20,
          FontWeight.w600,
          Color.fromRGBO(56, 15, 67, 1),
        ),
      ),
      body: Center(
        child: practiseAsyncValue.when(
            data: (practise) {
              if (practise.isEmpty) {
                return Text('No data available');
              }
              return ListView.builder(
                itemCount: practise.length,
                itemBuilder: (context, index) {
                  final p = practise[index];
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Color(0xFFC4DCF3),
                      ),
                      child: ListTile(
                        trailing: IconButton(
                          icon: Icon(
                            Iconsax.audio_square,
                            color: Color.fromRGBO(27, 71, 113, 1),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                    "This feature is in development",
                                    maxLines: 3,
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'Close',
                                        style: TextStyle(
                                          color: Color.fromRGBO(56, 15, 67,
                                              1), // Set the text color
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                        leading: Image.asset('lib/assets/images/sheets.png'),
                        title: HomeUiHelper().customText(
                            '${p['practise_name']}',
                            20,
                            FontWeight.w700,
                            Color.fromRGBO(27, 60, 95, 1)),
                      ),
                    ),
                  );
                },
              );
            },
            error: (error, stack) => Text('Error: $error'),
            loading: () => CircularProgressIndicator()),
      ),
    );
  }
}
