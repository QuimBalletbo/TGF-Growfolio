import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';

class FAQSDialog extends StatelessWidget {
  final String title;
  final String text;

  const FAQSDialog({
    Key? key,
    required this.title,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 15),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(right: 1.h),
                padding: EdgeInsets.symmetric(horizontal: 21.h, vertical: 25.v),
                decoration: AppDecoration.fillWhiteA
                    .copyWith(borderRadius: BorderRadiusStyle.roundedBorder30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (title.isNotEmpty) ...[
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          decorationColor: Color(0X00000000),
                        ),
                      ),
                      SizedBox(height: 10.v),
                    ],
                    Text(
                      text,
                      style: const TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10.v),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
        ],
      ),
    );
  }
}
