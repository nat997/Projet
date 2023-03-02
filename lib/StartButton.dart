import 'package:flutter/material.dart';

class ButtonSection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ButtonState();
  }

  const ButtonSection({Key? key});
}

class ButtonState extends State<ButtonSection> {
  String txt = '';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextButton(
            // splashColor: Colors.red,
            // textColor: Colors.white,
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(255, 180, 60, 235))),
            onPressed: () {
              setState(() {
                txt = 'You clicked , now wait for us to do 2nd page';
              });
            },
            // splashColor: Colors.red,
            // textColor: Colors.white,
            child: const Text('Start application',
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    backgroundColor: Color.fromARGB(255, 180, 60, 235))),
          ),
          Text(txt,
              textScaleFactor: 2, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
