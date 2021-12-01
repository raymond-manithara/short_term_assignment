import 'package:flutter/material.dart';

class Error extends StatelessWidget {
  const Error({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Text('Some error occured. Sorry for the inconveniance caused!',
            style: TextStyle(color: Colors.red, fontSize: 15)),
      ),
    );
  }
}
