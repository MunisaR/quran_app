import 'package:flutter/material.dart';
import 'package:quran_app/DRY/colors.dart';

class CircleCard extends StatelessWidget {
  final dynamic customIcon;
  final dynamic text;

  const CircleCard({super.key, required this.customIcon, this.text});

  @override
  Widget build(BuildContext context) {
    // print(MediaQuery.of(context).size.width);
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
          ),
        );
      },
      child: Column(

        children: [
          Card(
              elevation: 20,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(150),
              ),
              child: Container(
                // color: Colors.red,
                  width: MediaQuery.of(context).size.width <= 375 ? 120 : 81,
                  height:  MediaQuery.of(context).size.width <= 375 ? 120 : 81,
                  decoration: BoxDecoration(
                      // The child of a round Card should be in round shape
                      shape: BoxShape.circle,
                      color: custom_grey),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      customIcon,
                      width: 30,
                    ),
                  ))),
          Text(
            text,
            textAlign: TextAlign.center,
            overflow: TextOverflow.fade,
            style: const TextStyle(
              fontSize: 12.0,
              fontFamily: 'Roboto',
              color: Color(0xFF212121),
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
