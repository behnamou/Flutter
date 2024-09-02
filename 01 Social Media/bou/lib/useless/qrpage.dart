import 'dart:developer';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

@RoutePage()
class QRViewExample extends StatefulWidget {
  const QRViewExample({super.key});

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    var myTextStyle = const TextStyle(
        fontFamily: 'sfpro',
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Color(0xff536471));
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const SizedBox(height: 10),
                  if (result != null)
                    Column(
                      children: [
                        Text(
                          'Barcode Type: ${describeEnum(result!.format)}',
                          style: myTextStyle,
                        ),
                        Text(
                          'Data: ${result!.code}',
                          style: myTextStyle,
                        ),
                        ElevatedButton(
                          style: const ButtonStyle(
                              overlayColor: WidgetStatePropertyAll(
                                  Color.fromARGB(255, 178, 178, 178)),
                              padding:
                                  WidgetStatePropertyAll(EdgeInsets.all(10)),
                              alignment: Alignment.centerLeft,
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)))),
                              backgroundColor:
                                  WidgetStatePropertyAll(Color(0xffEEF2F3))),
                          onPressed: () async {
                            if (result?.code != null) {
                              await Clipboard.setData(
                                ClipboardData(text: result!.code ?? ''),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Copied to Clipboard',
                                    style: myTextStyle,
                                  ),
                                ),
                              );
                            }
                          },
                          child: Text(
                            'Copy to Clipboard',
                            style: myTextStyle,
                          ),
                        ),
                      ],
                    )
                  else
                    Text(
                      'Scan a code',
                      style: myTextStyle,
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                            style: const ButtonStyle(
                                overlayColor: WidgetStatePropertyAll(
                                    Color.fromARGB(255, 178, 178, 178)),
                                padding:
                                    WidgetStatePropertyAll(EdgeInsets.all(10)),
                                alignment: Alignment.centerLeft,
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)))),
                                backgroundColor:
                                    WidgetStatePropertyAll(Color(0xffEEF2F3))),
                            onPressed: () async {
                              await controller?.toggleFlash();
                              setState(() {});
                            },
                            child: FutureBuilder(
                              future: controller?.getFlashStatus(),
                              builder: (context, snapshot) {
                                return Text(
                                  'Flash: ${snapshot.data}',
                                  style: myTextStyle,
                                );
                              },
                            )),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                            style: const ButtonStyle(
                                overlayColor: WidgetStatePropertyAll(
                                    Color.fromARGB(255, 178, 178, 178)),
                                padding:
                                    WidgetStatePropertyAll(EdgeInsets.all(10)),
                                alignment: Alignment.centerLeft,
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)))),
                                backgroundColor:
                                    WidgetStatePropertyAll(Color(0xffEEF2F3))),
                            onPressed: () async {
                              await controller?.flipCamera();
                              setState(() {});
                            },
                            child: FutureBuilder(
                              future: controller?.getCameraInfo(),
                              builder: (context, snapshot) {
                                if (snapshot.data != null) {
                                  return Text(
                                    'Camera facing ${describeEnum(snapshot.data!)}',
                                    style: myTextStyle,
                                  );
                                } else {
                                  return Text(
                                    'loading',
                                    style: myTextStyle,
                                  );
                                }
                              },
                            )),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          style: const ButtonStyle(
                              overlayColor: WidgetStatePropertyAll(
                                  Color.fromARGB(255, 178, 178, 178)),
                              padding:
                                  WidgetStatePropertyAll(EdgeInsets.all(10)),
                              alignment: Alignment.centerLeft,
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)))),
                              backgroundColor:
                                  WidgetStatePropertyAll(Color(0xffEEF2F3))),
                          onPressed: () async {
                            await controller?.pauseCamera();
                          },
                          child: Text('pause', style: myTextStyle),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          style: const ButtonStyle(
                              overlayColor: WidgetStatePropertyAll(
                                  Color.fromARGB(255, 178, 178, 178)),
                              padding:
                                  WidgetStatePropertyAll(EdgeInsets.all(10)),
                              alignment: Alignment.centerLeft,
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)))),
                              backgroundColor:
                                  WidgetStatePropertyAll(Color(0xffEEF2F3))),
                          onPressed: () async {
                            await controller?.resumeCamera();
                          },
                          child: Text('resume', style: myTextStyle),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
          'no Permission',
          style: TextStyle(fontFamily: 'sfpro', color: Colors.black),
        )),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
