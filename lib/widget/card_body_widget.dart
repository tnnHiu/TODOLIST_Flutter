import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:todolist/model/item.dart';

class CardBody extends StatelessWidget {
  const CardBody(
      {super.key,
      required this.index,
      required this.item,
      required this.handleDelete});

  final int index;
  final Item item;
  final Function handleDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: double.infinity,
      height: 74,
      decoration: BoxDecoration(
        color: (index % 2 == 0) ? Colors.grey : Colors.cyan,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xff4b4b4b),
              ),
            ),
            InkWell(
              onTap: () async {
                if (await confirm(context)) {
                  handleDelete(item.id);
                }
                return;
              },
              child: const Icon(
                Icons.delete_outlined,
                color: Color(0xff4b4b4b),
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
