import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';

class CustomSearchBar extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) onEditionCompleate;

  CustomSearchBar({
    Key? key,
    required this.controller,
    required this.onEditionCompleate,
  }) : super(key: key);

  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 1.0),
            child: Text(
              "Search Stocks",
              style: CustomTextStyles.bodyLargeLight,
            ),
          ),
          const SizedBox(height: 9.0),
          const SizedBox(height: 4.0),
          Material(
            elevation: 2, // Set elevation for shadow effect
            borderRadius: BorderRadius.circular(6.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                color: Colors
                    .transparent, // Set the container background color to transparent
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 1.0),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey), // Lens icon
                    const SizedBox(
                        width: 8.0), // Add spacing between icon and text field
                    Expanded(
                      child: TextFormField(
                        controller: widget.controller,
                        decoration: const InputDecoration(
                          hintText: "Enter Stock Name or Symbol",
                          hintStyle: TextStyle(
                            fontSize: 14.0,
                            color:
                                Colors.grey, // Adjust hint text color as needed
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 8.0),
                          border: InputBorder.none, // Remove border
                          errorBorder: InputBorder.none, // Remove error border
                          enabledBorder:
                              InputBorder.none, // Remove enabled border
                          focusedBorder:
                              InputBorder.none, // Remove focused border
                        ),
                        onEditingComplete: () {
                          widget.onEditionCompleate(widget
                              .controller.text); // Call the callback function
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
