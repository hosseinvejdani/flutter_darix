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
                await Future.delayed(const Duration(milliseconds: 500));
                print('---- Helloooo!');
              },
              buttonText: 'push me!',
              width: 140,
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DariXFilledButton(
                  onPressed: () async {
                    await Future.delayed(const Duration(milliseconds: 500));
                    print('---- Helloooo!');
                  },
                  buttonText: 'push me!',
                  width: 140,
                  height: 45,
                ),
                const SizedBox(width: 30),
                DariXFilledButton(
                  onPressed: () async {
                    await Future.delayed(const Duration(milliseconds: 500));
                    print('---- Helloooo!');
                  },
                  buttonText: 'push me!',
                  width: 140,
                  height: 45,
                  icon: const Icon(Icons.save, size: 22),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DariXFilledButton(
                  onPressed: () async {
                    await Future.delayed(const Duration(milliseconds: 500));
                    print('---- Helloooo!');
                  },
                  buttonText: 'push me!',
                  width: 140,
                  height: 45,
                  isTonal: true,
                ),
                const SizedBox(width: 30),
                DariXFilledButton(
                  onPressed: () async {
                    await Future.delayed(const Duration(milliseconds: 500));
                    print('---- Helloooo!');
                  },
                  buttonText: 'push me!',
                  width: 140,
                  height: 45,
                  icon: const Icon(Icons.save, size: 22),
                  isTonal: true,
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DariXElevatedButton(
                  onPressed: () async {
                    await Future.delayed(const Duration(milliseconds: 500));
                    print('---- Helloooo!');
                  },
                  buttonText: 'push me!',
                  width: 140,
                  height: 45,
                ),
                const SizedBox(width: 30),
                DariXElevatedButton(
                  onPressed: () async {
                    await Future.delayed(const Duration(milliseconds: 500));
                    print('---- Helloooo!');
                  },
                  buttonText: 'push me!',
                  width: 140,
                  height: 45,
                  icon: const Icon(Icons.save, size: 22),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DariXOutlinedButton(
                  onPressed: () async {
                    await Future.delayed(const Duration(milliseconds: 500));
                    print('---- Helloooo!');
                  },
                  buttonText: 'push me!',
                  width: 140,
                  height: 45,
                  sideColor: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 30),
                DariXOutlinedButton(
                  onPressed: () async {
                    await Future.delayed(const Duration(milliseconds: 500));
                    print('---- Helloooo!');
                  },
                  buttonText: 'push me!',
                  width: 140,
                  height: 45,
                  icon: const Icon(Icons.save, size: 22),
                  sideColor: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
