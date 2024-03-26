import 'package:flutter/material.dart';

class AddTextDialog extends StatefulWidget {
  const AddTextDialog({Key? key}) : super(key: key);

  @override
  _AddTextDialogState createState() => _AddTextDialogState();
}

class _AddTextDialogState extends State<AddTextDialog> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Text'),
      content: TextField(
        controller: _textController,
        autofocus: true,
        decoration: const InputDecoration(labelText: 'Enter text'),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            String enteredText = "";
            Navigator.of(context).pop(enteredText);
          },
          child: const Text(
            'Отмена',
            style: TextStyle(color: Colors.red),
          ),
        ),
        TextButton(
          onPressed: () {
            String enteredText = _textController.text;
            Navigator.of(context).pop(enteredText);
          },
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.green),
          ),
        ),
      ],
    );
  }
}
