
import 'package:flutter/material.dart';

class TicketBook_item extends StatelessWidget {
  final String title;
  final String status;
  final Color color;

  const TicketBook_item(this.title,  this.status,  this.color);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Text(title),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color.withOpacity(0.7),
            color
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
        ),
            borderRadius: BorderRadius.circular(15)
      ),

    );
  }
}
