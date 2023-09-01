import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskDone;
  final Function(bool?)? onChanged;

  const TodoTile({
    super.key,
    required this.taskName,
    required this.taskDone,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 22.0, right: 22.0, top: 23.0),
      child: Container(
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: Colors.pink,
          borderRadius: BorderRadius.circular(12),
        ), //padding for child
        child: Row(
          children: [
            //checkboc
            Checkbox(
              value: taskDone,
              onChanged: onChanged,
              activeColor: const Color.fromARGB(255, 142, 35, 71),
            ),
            //TaskName
            Text(
              taskName,
              style: TextStyle(
                decoration:
                    taskDone 
                    ? TextDecoration.lineThrough 
                    : TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
