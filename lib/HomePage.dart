import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

List languageCode = ["en", "ta"];
List countryCode = ["US", "IN"];

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildText(),
            SizedBox(
              height: 15,
            ),
            buildButton(),
          ],
        ),
      ),
    );
  }

  Widget buildText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        text("${('title'.tr().toString())}: ", Colors.blue),
        text('message'.tr().toString(), Colors.red),
      ],
    );
  }

  Widget buildButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        button("English", 0),
        SizedBox(
          width: 50,
        ),
        button("தமிழ்", 1),
      ],
    );
  }

  Widget text(String text, Color color) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: 25),
    );
  }

  Widget button(String text, int i) {
    return RaisedButton(
      child: Text(text),
      onPressed: () {
        setState(() {
          EasyLocalization.of(context).locale =
              Locale(languageCode[i], countryCode[i]);
        });
      },
    );
  }
}
