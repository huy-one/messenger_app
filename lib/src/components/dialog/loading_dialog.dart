import 'package:flutter/material.dart';

class LoadingDialog{
  static void showLoadingDialog(BuildContext context,String msg){
    showDialog(context: context, builder: (context)=>new Dialog(
      child: Container(
        height: 200,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            Padding(
              padding: const EdgeInsets.only(top:10),
              child: Text(msg,style: TextStyle(
                  fontSize: 20,
              ),),
            ),
          ],
        ),
      ),
    ));
  }
  static void hideLoadingDialog(BuildContext context){
    Navigator.of(context).pop(LoadingDialog());
  }
}