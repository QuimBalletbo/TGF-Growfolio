import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/noDataBaseData/TicketSearch.dart';

class CustomTicketSearchList extends StatelessWidget {
  final TicketSearch ticketSearch;
  final void Function(TicketSearch) onPressed;

  CustomTicketSearchList({required this.ticketSearch, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed(ticketSearch);
      },
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              ticketSearch.symbol,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 8), // Add spacing between symbol and name
            Flexible(
              // Use Flexible to limit maximum width and allow wrapping
              child: Text(
                ticketSearch.name,
                style: const TextStyle(fontSize: 16),
                overflow:
                    TextOverflow.ellipsis, // Ellipsize if exceeds maximum lines
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      ),
    );
  }
}