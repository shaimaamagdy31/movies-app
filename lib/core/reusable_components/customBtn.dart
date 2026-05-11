import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color colorText;
  final Color colorContainer;
  final Color borderContainer;
   CustomBtn({required this.text,required this.onPressed,required this.borderContainer,required this.colorContainer,required this.colorText});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onPressed ,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          border: Border.all(color:borderContainer ),
            borderRadius: BorderRadius.circular(15),
            color: colorContainer,

        ),
        child: Center(child: Text(text,
            style:TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: colorText
            ) )),

      ),
    );
  }
}
