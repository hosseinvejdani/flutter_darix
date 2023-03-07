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
      title: 'Flutter DariX',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Flutter DariX'),
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
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            _textButtonExample(),
            const SizedBox(height: 20),
            _elevatedButtonExamples(),
            const SizedBox(height: 20),
            _filledButtonExamples(),
            const SizedBox(height: 20),
            _tonalFilledButtonExamples(),
            const SizedBox(height: 20),
            _outlinedButtonExamples(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _outlinedButtonExamples() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        DariXOutlinedButton(
          onPressed: _action,
          onLongPressed: _action,
          buttonText: 'push me',
          width: 130,
          height: 45,
        ),
        const SizedBox(width: 20),
        DariXOutlinedButton(
          onPressed: _action,
          onLongPressed: _action,
          buttonText: 'push me',
          width: 130,
          height: 45,
          icon: const Icon(Icons.save, size: 22),
        ),
      ],
    );
  }

  Widget _tonalFilledButtonExamples() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        DariXFilledButton(
          onPressed: _action,
          onLongPressed: _action,
          buttonText: 'push me',
          width: 130,
          height: 45,
          isTonal: true,
        ),
        const SizedBox(width: 20),
        DariXFilledButton(
          onPressed: _action,
          onLongPressed: _action,
          buttonText: 'push me',
          width: 130,
          height: 45,
          isTonal: true,
          icon: const Icon(Icons.save, size: 22),
        ),
      ],
    );
  }

  Widget _filledButtonExamples() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        DariXFilledButton(
          onPressed: _action,
          onLongPressed: _action,
          buttonText: 'push me',
          width: 130,
          height: 45,
        ),
        const SizedBox(width: 20),
        DariXFilledButton(
          onPressed: _action,
          onLongPressed: _action,
          buttonText: 'push me',
          width: 130,
          height: 45,
          icon: const Icon(Icons.save, size: 22),
        ),
      ],
    );
  }

  Widget _elevatedButtonExamples() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        DariXElevatedButton(
          onPressed: _action,
          onLongPressed: _action,
          buttonText: 'push me',
          width: 130,
          height: 45,
        ),
        const SizedBox(width: 20),
        DariXElevatedButton(
          onPressed: _action,
          onLongPressed: _action,
          buttonText: 'push me',
          width: 130,
          height: 45,
          icon: const Icon(Icons.save, size: 22),
        ),
      ],
    );
  }

  Widget _textButtonExample() {
    return DariXTextButton(
      onPressed: _action,
      onLongPressed: _action,
      buttonText: 'push me',
      width: 130,
    );
  }

  _action() async {
    await Future.delayed(Duration(milliseconds: 500));
  }
}
