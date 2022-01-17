import 'package:flutter/material.dart';
import 'package:cartoons_flutter/model/email.dart';

class emailWidget extends StatelessWidget {
  final Email email;

  emailWidget(this.email);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(email.subject),
      ),
body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children:  [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Text(
                'From',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 17.0,fontStyle:  FontStyle.normal)
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Text(
                email.from,
                textAlign:  TextAlign.left,
                style: TextStyle(fontSize: 17.0,fontStyle:  FontStyle.normal, color: Colors.black38)
              ),
            ),
             SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Text(
                email.subject,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 17.0,fontStyle:  FontStyle.normal)
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Text(
                email.dateTime.year.toString()+ "-"+
                email.dateTime.month.toString()+ "-"+
                email.dateTime.day.toString(),
                textAlign:  TextAlign.left,
                style: TextStyle(fontSize: 17.0,fontStyle:  FontStyle.normal, color: Colors.black38)
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                email.body,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 18.0),
              ),
            ), 
          ],
        ),
      ),
    );
  }
}
