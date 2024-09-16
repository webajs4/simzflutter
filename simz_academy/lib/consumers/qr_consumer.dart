import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:simz_academy/UIHelper/home_ui_helper.dart';
import 'package:barcode_widget/barcode_widget.dart'; // Add this import for BarcodeWidget

import '../providers/qr_provider.dart';

class QrConsumer extends ConsumerWidget {
  const QrConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final qrAsyncValue = ref.watch(qrProvider);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Iconsax.arrow_square_left,
            size: 20,
            color: const Color.fromRGBO(56, 15, 67, 1),
          ),
        ),
        title: Center(
          child: HomeUiHelper().customText(
            'Simz Academy',
            20,
            FontWeight.w600,
            const Color.fromRGBO(56, 15, 67, 1),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('lib/assets/images/simz_logo.png'),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            HomeUiHelper().customText(
              'Scan this QR code to call',
              32,
              FontWeight.bold,
              const Color.fromRGBO(56, 15, 67, 1),
            ),
            qrAsyncValue.when(
              data: (qr) {
                if (qr.isEmpty) {
                  return const Text("No Data");
                }
                final singleQr = qr[0]; // Get the first value from the list
                String phNum = singleQr['contact_number'];
                final String phoneUri = 'tel:$phNum';
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: BarcodeWidget(
                          barcode: Barcode.qrCode(
                            errorCorrectLevel: BarcodeQRCorrectionLevel.high,
                          ), // Choose the barcode type
                          data: phoneUri, // Use the single data here
                          width: 200,
                          height: 200,
                        ),
                      ),
                      HomeUiHelper().customText(
                        'Contact Name: ${singleQr['contact_name']}',
                        24,
                        FontWeight.bold,
                        const Color.fromRGBO(56, 15, 67, 1),
                      ),
                    ],
                  ),
                );
              },
              error: (Object error, StackTrace stackTrace) {
                return Text("Error: $error");
              },
              loading: () {
                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
