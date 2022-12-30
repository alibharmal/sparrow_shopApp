
import 'package:flutter/material.dart';

class DialogHelper{

  static  showAlert(BuildContext context,String message){
    showDialog(
    builder: (BuildContext context) {
      return  AlertDialog(
        actionsPadding: EdgeInsets.zero,
        actionsAlignment: MainAxisAlignment.center,
        content: Container(
          width: 300,
          child: Text(message,textAlign: TextAlign.center,),
        ),
          actions:[

            TextButton(
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 48),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(12),
                    )),
                onPressed: () async {
                 Navigator.pop(context);
                },
                child: Text(
                  "Ok",
                  style: Theme.of(context)
                      .textTheme
                      .button
                      ?.copyWith(color: Colors.black),
                )),
          ]
      );
    }, context: context);

  }
}