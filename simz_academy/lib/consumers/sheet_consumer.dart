import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simz_academy/UIHelper/home_ui_helper.dart';
import 'package:simz_academy/providers/sheet_provider.dart';

/// A consumer widget that displays a list of sheets.
/// A widget that consumes a sheet.
///
/// This widget is used to consume a sheet and display its content.
/// It extends the [ConsumerWidget] class and provides a [key] parameter
/// to uniquely identify the widget.
class SheetConsumer extends ConsumerWidget {
  const SheetConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sheetAsyncValue = ref.watch(sheetProvider);
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
        child: sheetAsyncValue.when(
          data: (sheet) {
            if (sheet.isEmpty) {
              return Text('No data available');
            }
            return ListView.builder(
              itemCount: sheet.length,
              itemBuilder: (context, index) {
                final s = sheet[index];
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 10, bottom: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color(0xFFFEE2E4),
                    ),
                    child: ListTile(
                      trailing: TextButton(
                          style: ButtonStyle(
                              shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              backgroundColor: WidgetStateProperty.all(
                                Color(0xFFFBA6AC),
                              )),
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
                          child: HomeUiHelper().customText('Download', 16,
                              FontWeight.w600, Color.fromRGBO(69, 10, 14, 1))),
                      leading: Image.asset('lib/assets/images/sheets.png'),
                      title: HomeUiHelper().customText('${s['sheet_name']}', 20,
                          FontWeight.w700, Color.fromRGBO(69, 10, 14, 1)),
                    ),
                  ),
                );
              },
            );
          },
          error: (error, stack) => Text('Error: $error'),
          loading: () => CircularProgressIndicator(),
        ),
      ),
    );
  }
}
