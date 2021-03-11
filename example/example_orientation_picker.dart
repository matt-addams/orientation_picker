import 'package:flutter/material.dart';
import 'package:orientation_picker/orientation_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Text('Always visible above'),
              OrientationPicker(
                landscape: Text('Now in landscape!'),
                portrait: Text('Now in portrait!'),
              ),
              Text('Always visible below'),
            ],
          ),
        ),
      ),
    );
  }
}
