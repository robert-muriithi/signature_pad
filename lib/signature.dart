
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class SignaturePage extends StatefulWidget {
  const SignaturePage({Key? key}) : super(key: key);

  @override
  State<SignaturePage> createState() => _SignaturePageState();
}

class _SignaturePageState extends State<SignaturePage> {
  final GlobalKey<SfSignaturePadState> _signatureGlobalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              height: 300,
              width: 300,
              color: Colors.grey,
            ),
            TextButton(
                onPressed: (){
                  showDialog(
                      context: context,
                      builder: (context){
                        return  AlertDialog(
                          title: const Text('Draw to sign'),
                          content:  SfSignaturePad(
                            key: _signatureGlobalKey,
                            minimumStrokeWidth: 2,
                            maximumStrokeWidth: 2,
                            strokeColor: Colors.black,
                            backgroundColor: Colors.white,
                          ),
                          actions: [
                            TextButton(
                              onPressed: (){
                                _signatureGlobalKey.currentState!.clear();
                              },
                              child: const Text('Clear'),
                            ),
                            TextButton(
                              onPressed: () async {

                              },
                              child: const Text('Save as image'),
                            ),
                          ],
                        );
                      }
                  );
                },
                child: const Text('Open Signature Pad')
            )
          ],
        )
      )
    );
  }
}
