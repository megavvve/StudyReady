import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class AddMaterialScreen extends StatefulWidget {
  @override
  _AddMaterialScreenState createState() => _AddMaterialScreenState();
}

class _AddMaterialScreenState extends State<AddMaterialScreen> {
  String? _filePath;
  String? _content;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _filePath = result.files.single.path;
      });

      // Read file content
      if (_filePath != null) {
        _readFile(_filePath!);
      }
    } else {
      // User canceled the picker
      // Handle accordingly
    }
  }

  Future<void> _readFile(String path) async {
    try {
      File file = File(path);
      Uint8List bytes = await file.readAsBytes();
      String content = utf8.decode(bytes);
      setState(() {
        _content = content;
      });
    } catch (e) {
      print('Error reading file: $e');
      // Handle error reading file
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Material'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ElevatedButton(
              onPressed: _pickFile,
              child: Text('Pick File'),
            ),
            if (_filePath != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text('File Path: $_filePath'),
              ),
            if (_content != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text('File Content: $_content'),
              ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Title',
                hintText: 'Enter title',
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Subject Name',
                hintText: 'Enter subject name',
              ),
            ),
            // Other form fields for additional data
            ElevatedButton(
              onPressed: () {
                // Submit form and save data
                // You can access entered data using TextEditingController
                // and use it to create the StudyMaterial object
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
