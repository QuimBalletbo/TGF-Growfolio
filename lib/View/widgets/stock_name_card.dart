import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';

class CustomSymbolContainer extends StatefulWidget {
  final String symbol;
  final VoidCallback updateUI;

  const CustomSymbolContainer({
    Key? key,
    required this.symbol,
    required this.updateUI,
  }) : super(key: key);

  @override
  _CustomSymbolContainerState createState() => _CustomSymbolContainerState();
}

class _CustomSymbolContainerState extends State<CustomSymbolContainer> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    if (!_isVisible) {
      return Container(); // Return an empty container when not visible
    }

    return Dismissible(
      key: ValueKey(widget.symbol),
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (direction) {
        setState(() {
          _isVisible = false;
        });
        widget.updateUI();
      },
      child: Container(
        width: 367.h,
        margin: EdgeInsets.symmetric(horizontal: 2.h),
        padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 14.v),
        decoration: AppDecoration.outlinePrimary3
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  widget.symbol,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.headlineSmallInterWhiteA700,
                ),
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.cancel),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  _isVisible = false;
                  widget.updateUI();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
