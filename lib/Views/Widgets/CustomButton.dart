
import 'package:flutter/material.dart';
import 'package:useditem/Styles/Colors.dart';

class CustomButton extends StatelessWidget {
  String label;
  final double width;
  MainAxisAlignment? type;
  Color? color;
  IconData? icon;
  Function()?  onPressed;
  MaterialStateProperty<Color?>? backgroundColor;
  CustomButton({required this.label,required this.onPressed,this.backgroundColor,
    this.icon,this.color,this.type,required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: backgroundColor,
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ))),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: type??MainAxisAlignment.center,
          children: [
            Icon(icon,color: color) ,
            SizedBox(width: width,),
            Text(label.toUpperCase(),
            style: TextStyle(
              color: color
            ),
            ),

          ],
        ),

      ),
    );
  }
}
