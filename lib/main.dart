import 'package:cartoons_flutter/model/email.dart';
import 'package:cartoons_flutter/widgets/email_widget.dart';
import 'package:flutter/material.dart';
import 'package:cartoons_flutter/model/backend.dart';
import 'package:flutter/services.dart';

//import 'package:cartoons_flutter/model';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Mail App'),
        ),
        body: ListView.builder(
            itemCount: Backend().getEmails().length,
            itemBuilder: (context, index) {
              Email mail = Backend().getEmails()[index];
              return Dismissible(
                key: ObjectKey(mail),
                child: ListTile(
                  subtitle: Text(mail.subject),
                  title: Text(mail.from),
                  leading: Icon(Icons.brightness_1, color: Colors.lightBlue),
                  key: Key(Backend().getEmails()[index].id.toString()),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => emailWidget(mail)));
                  },
                  
                ),
                onDismissed: (direction) {
                  Backend().getEmails().remove(index);
                },
              );
            }));
  }
}

