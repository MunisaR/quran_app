import 'package:flutter/material.dart';
import 'package:quran_app/DRY/colors.dart';

class CircleCard extends StatelessWidget {
  final dynamic customIcon;
  final dynamic text;

  const CircleCard({super.key, required this.customIcon, this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
              elevation: 20,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(150),
              ),
              child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      // The child of a round Card should be in round shape
                      shape: BoxShape.circle,
                      color: custom_grey),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.asset(
                      customIcon,
                    ),
                  ))),
        ),
        Text(
          text,
          overflow: TextOverflow.fade,
          style: new TextStyle(
            fontSize: 10.0,
            fontFamily: 'Roboto',
            color: new Color(0xFF212121),
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
