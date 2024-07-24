import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simz_academy/UIHelper/home_ui_helper.dart';
import 'package:simz_academy/providers/syllabus_provider.dart';

class SyllabusConsumer extends ConsumerWidget {
  const SyllabusConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final syllabusAsyncValue = ref.watch(syllabusProvider);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: HomeUiHelper().customText('Keyboard Syllabus', 20, FontWeight.w600, Color.fromRGBO(56, 15, 67, 1)),
      ),
      body: Center(
        child: syllabusAsyncValue.when(
            data: (syllabus) {
              if (syllabus.isEmpty) {
                return Text("No Data");
              }
              return ListView.builder(
                itemCount: syllabus.length,
                itemBuilder: (context, index) {
                  final s = syllabus[index];
                  return Padding(
                    padding: const EdgeInsets.only(top: 4.0,bottom: 4.0,left: 12,right: 12),
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(196, 220, 243, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        leading:
                            Image.asset('lib/assets/images/keys_illustration.png'),
                        title: HomeUiHelper().customText('${s['name']}', 24,
                            FontWeight.w700, Color.fromRGBO(27, 71, 113, 1)),
                        trailing: InkWell(
                          onTap: (){
                            showDialog(context: context, builder: (context){
                              return AlertDialog(
                                title: Text("Sorry Man"),
                                icon: TextButton(onPressed: (){
                                  Navigator.pop(context);
                                },child: Text('Close'),),
                              );
                            });
                          },
                            child: HomeUiHelper().customText('Get', 20,
                                FontWeight.w600, Color.fromRGBO(27, 71, 113, 1))),
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
