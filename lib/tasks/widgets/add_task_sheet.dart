import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO let's make it beautiful :)
    final TextEditingController title = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: title,
          ),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(title.text.isEmpty ? null : title.text);
            },
            child: const Text('Save'),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
