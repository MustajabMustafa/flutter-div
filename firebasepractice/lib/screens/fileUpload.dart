import 'package:flutter/material.dart';

class FileUploadView extends StatelessWidget {
  const FileUploadView({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: style,
                onPressed: () {},
                child: const Text('Select File'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
