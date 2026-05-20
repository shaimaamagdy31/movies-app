import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movies_app/core/utils/ColorsManager.dart';

class DialogUtils {

  static toastMassagingDialog(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.black.withValues(alpha: 0.5),
        textColor: ColorsManager.yellow,
        fontSize: 16.0
    );
  }

    static showMassagingDialog(BuildContext context,String massage){

      showDialog(context: context, builder: (context){
        return AlertDialog(
          content:Text(massage,style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: ColorsManager.yellow
          ),),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            },child: Text("ok",style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: ColorsManager.yellow
               ),
              ),
            )
          ],
        );
      });
    }

  static showLoadingDialog(BuildContext context){

    showDialog(context: context, builder: (context){
      return AlertDialog(
        content: Row(
          children: [
            CircularProgressIndicator(),
            SizedBox(width: 24,),
            Text(" Loading ",style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: ColorsManager.yellow
            ),)
          ],
        ),
      );
    });
  }

}