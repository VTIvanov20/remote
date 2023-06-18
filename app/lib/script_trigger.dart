import 'package:flutter/material.dart';
import 'dart:io';

// unstable, refactor file later

class PyScript extends StatelessWidget {
  const PyScript({super.key});

  void runPythonScript() async {
    Process process = (await Process.run(
            'python', ['././arm/uArm-Python-SDK/sandbox/instructions.py']))
        as Process;
    if (process.exitCode == 0) {
      print('Python script executed successfully');
    } else {
      print('Failed to execute Python script. Error: ${process.stderr}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: runPythonScript,
        child: const Text('Run Python Script'),
      ),
    );
  }
}
