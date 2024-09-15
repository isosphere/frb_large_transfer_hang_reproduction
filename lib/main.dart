import 'package:flutter/material.dart';
import 'package:frb_large_transfer_hang_reproduction/src/rust/frb_generated.dart';
import 'package:frb_large_transfer_hang_reproduction/src/rust/api/simple.dart';
import 'dart:typed_data';

Future<void> main() async {
  await RustLib.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<String?> _rustCallResult;

  @override
  void initState() {
    super.initState();
    _rustCallResult = Future.value(null);
  }

  Future<String?> _processBlob() async {
    print("Making blob.");
    Uint8List blob = Uint8List(1024 * 1024 * 10); // 10MB
    print("Blob made, sending to Rust.");
    return doNothingWithBlob(blob: blob);
  }

  void buttonPress() {
    setState(() {
      _rustCallResult = _processBlob();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('flutter_rust_bridge quickstart')),
        body: Center(
          child: Column(
            children: <Widget>[
              FutureBuilder<String?>(
                future: _rustCallResult,
                builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
                  if (snapshot.hasData) {
                    return Text('Rust response: `${snapshot.data}`');
                  } else {
                    return const Text("Press the button to send a blob to Rust.");
                  }
                }
              ),
              ElevatedButton(
                onPressed: buttonPress,
                child: const Text("Start"),
              )
            ]
          ),
        ),
      ),
    );
  }
}
