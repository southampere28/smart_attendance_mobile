import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRPage extends StatefulWidget {
  const QRPage({super.key});

  @override
  State<QRPage> createState() => _QRPageState();
}

class _QRPageState extends State<QRPage> {
  bool isScanCompleted = false;

  void closeScreen() {
    isScanCompleted = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('QR Code Scanner'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Container(
              width: double.infinity,
              color: Colors.white,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Place the QR Code in this area'),
                  Text('Scanning will be started automatically'),
                  SizedBox(
                    height: 12,
                  ),
                ],
              ),
            )),
            Expanded(
                flex: 4,
                child: Center(
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        height: MediaQuery.of(context).size.width - 50,
                        width: MediaQuery.of(context).size.width - 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: MobileScanner(
                              allowDuplicates: true,
                              onDetect: (barcode, args) {
                                if (!isScanCompleted) {
                                  String code = barcode.rawValue ?? '---';
                                  Fluttertoast.showToast(msg: code);
                                  // setState(() {
                                  //   isScanCompleted = false;
                                  // });
                                }
                              }),
                        ),
                      ),
                      // Garis sudut kiri atas (horizontal)
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                          width: 40,
                          height: 4,
                          color: Colors.blue,
                        ),
                      ),
                      // Garis sudut kiri atas (vertical)
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                          width: 4,
                          height: 40,
                          color: Colors.blue,
                        ),
                      ),
                      // Garis sudut kanan atas (horizontal)
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          width: 40,
                          height: 4,
                          color: Colors.blue,
                        ),
                      ),
                      // Garis sudut kanan atas (vertical)
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          width: 4,
                          height: 40,
                          color: Colors.blue,
                        ),
                      ),
                      // Garis sudut kiri bawah (horizontal)
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Container(
                          width: 40,
                          height: 4,
                          color: Colors.blue,
                        ),
                      ),
                      // Garis sudut kiri bawah (vertical)
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Container(
                          width: 4,
                          height: 40,
                          color: Colors.blue,
                        ),
                      ),
                      // Garis sudut kanan bawah (horizontal)
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 40,
                          height: 4,
                          color: Colors.blue,
                        ),
                      ),
                      // Garis sudut kanan bawah (vertical)
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 4,
                          height: 40,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                )
                // Container(
                //   child: Text('data'),
                // )
                ),
            Expanded(
              child: Container(
                color: Colors.amber,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
