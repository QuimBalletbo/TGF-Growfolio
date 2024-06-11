import 'package:flutter/material.dart';

class SquaresWithWords extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildSquaresWithWords();
  }

  Widget _buildSquaresWithWords() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildSquareWithWord('Stocks', Color(0xFF3D2FE7)),
        _buildSquareWithWord('ETFs', Color(0xFF2BD9FE)),
        _buildSquareWithWord('Bonds', Color(0xFF2BFE7F)),
      ],
    );
  }

  Widget _buildSquareWithWord(String word, Color color) {
    return Row(
      children: [
        Container(
          width: 10.0,
          height: 10.0,
          margin: EdgeInsets.only(right: 4.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2.0),
          ),
        ),
        Text(word),
      ],
    );
  }
}
