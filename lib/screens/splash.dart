import 'package:flutter/material.dart';
class SplashPage extends StatefulWidget {

  final VoidCallback onInitComplete;
  const  SplashPage({this.onInitComplete});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

 @override
  void initState() {
   Future.delayed(Duration(seconds: 2));
   widget.onInitComplete();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Center(
        child: Container(
          height: 400,
          width: 300,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('images/unsplash.jpg')
            )
          ),
        ),
      ),
    );
  }
}
