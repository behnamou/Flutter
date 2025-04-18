import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:flutter/services.dart';

@RoutePage()
class QRScanPage extends StatefulWidget {
  const QRScanPage({super.key});

  @override
  _QRScanPageState createState() => _QRScanPageState();
}

var _myButtonStyle = ButtonStyle(
  elevation: WidgetStatePropertyAll(5),
  overlayColor: WidgetStatePropertyAll(Color(0xffEEF2F3)),
  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
      side: BorderSide(color: Color(0xff536471)),
      borderRadius: BorderRadius.all(Radius.circular(10)))),
  foregroundColor: WidgetStatePropertyAll(Color(0xff536471)),
  backgroundColor: WidgetStatePropertyAll(
    Colors.white,
  ),
);

var _myTextStyle = TextStyle(
  fontFamily: 'sfpro',
  fontSize: 16,
  fontWeight: FontWeight.w400,
  color: Color(0xff536471),
);

class _QRScanPageState extends State<QRScanPage> {
  MobileScannerController cameraController = MobileScannerController();

  String result = 'Scan a QR Code';

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text)).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Copied to clipboard!')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'QR Code Scanner',
          style: _myTextStyle,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: MobileScanner(
              controller: cameraController,
              onDetect: (capture) {
                final List<Barcode> barcodes = capture.barcodes;

                if (barcodes.isNotEmpty) {
                  setState(() {
                    result = barcodes.first.rawValue ?? 'No data found';
                  });

                  _copyToClipboard(result);
                }
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    result,
                    style: _myTextStyle,
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    style: _myButtonStyle,
                    onPressed: () {
                      _copyToClipboard(result);
                    },
                    child: Text(
                      'Copy to Clipboard',
                      style: _myTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
