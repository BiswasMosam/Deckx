import 'package:flutter/material.dart';
import '../models/button_model.dart';
import '../services/profile_service.dart';

class ButtonEditorScreen extends StatefulWidget {
  final int profileIndex;
  final ButtonModel? button;
  final int? buttonIndex;

  ButtonEditorScreen(
      {required this.profileIndex, this.button, this.buttonIndex});

  @override
  _ButtonEditorScreenState createState() => _ButtonEditorScreenState();
}

class _ButtonEditorScreenState extends State<ButtonEditorScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _actionController = TextEditingController();
  Color _color = Colors.teal;

  @override
  void initState() {
    super.initState();
    if (widget.button != null) {
      _nameController.text = widget.button!.name;
      _actionController.text = widget.button!.action;
      _color = widget.button!.color;
    }
  }

  void _saveButton() {
    final button = ButtonModel(
        name: _nameController.text,
        action: _actionController.text,
        color: _color);
    var profile = ProfileService.getProfile(widget.profileIndex);
    if (widget.buttonIndex != null) {
      profile.buttons[widget.buttonIndex!] = button;
    } else {
      profile.buttons.add(button);
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Button')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _nameController, decoration: InputDecoration(labelText: 'Button Name')),
            SizedBox(height: 10),
            TextField(controller: _actionController, decoration: InputDecoration(labelText: 'Action')),
            SizedBox(height: 10),
            Row(
              children: [
                Text('Color:'),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () async {
                    Color? picked = await showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        content: SingleChildScrollView(
                          child: BlockPicker(
                            pickerColor: _color,
                            onColorChanged: (color) => _color = color,
                          ),
                        ),
                      ),
                    );
                    if (picked != null) setState(() => _color = picked);
                  },
                  child: Container(width: 24, height: 24, color: _color),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _saveButton, child: Text('Save'))
          ],
        ),
      ),
    );
  }
}
