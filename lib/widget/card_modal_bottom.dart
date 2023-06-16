import 'package:flutter/material.dart';

class ModalBottom extends StatelessWidget {
  ModalBottom({
    required this.addTask,
    super.key,
  });

  final Function addTask;
  final TextEditingController textEditingController = TextEditingController();

  void _handleOnClick(BuildContext context) {
    final name = textEditingController.text;
    if (name.isEmpty) {
      return;
    }
    addTask(name);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            TextField(
              controller: textEditingController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Your Task'),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.amber)),
                  onPressed: () => _handleOnClick(context),
                  child: const Text('Add Task')),
            )
          ],
        ),
      ),
    );
  }
}
