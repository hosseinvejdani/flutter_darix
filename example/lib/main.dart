import 'package:flutter/material.dart';
import 'package:flutter_darix/flutter_darix.dart';

void main() {
  runApp(const DariXApp());
}

class DariXApp extends StatelessWidget {
  const DariXApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            DariXTextButton(
                onPressed: () async {
                  await Future.delayed(Duration(milliseconds: 300));
                },
                buttonText: 'push me',
                width: 130),
            const SizedBox(height: 20),
            DariXElevatedButton(
                onPressed: () async {
                  await Future.delayed(Duration(milliseconds: 300));
                },
                buttonText: 'push me',
                width: 130,
                height: 45),
            const SizedBox(height: 20),
            DariXFilledButton(
                onPressed: () async {
                  await Future.delayed(Duration(milliseconds: 300));
                },
                buttonText: 'push me',
                width: 130,
                height: 45),
            const SizedBox(height: 20),
            DariXTextButton(
                onPressed: () async {
                  await Future.delayed(Duration(milliseconds: 300));
                },
                buttonText: 'push me',
                width: 130),
            const SizedBox(height: 20),
            DariXOutlinedButton(
                onPressed: () async {
                  await Future.delayed(Duration(milliseconds: 300));
                },
                buttonText: 'push me',
                width: 130,
                height: 45)
          ],
        ),
      ),
    );
  }
}
