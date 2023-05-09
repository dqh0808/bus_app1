import 'dart:math';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';

class SwitchCustom extends StatefulWidget {
  SwitchCustom({Key? key}) : super(key: key);

  @override
  _SwitchCustomState createState() => _SwitchCustomState();
}

class _SwitchCustomState extends State<SwitchCustom> {
  bool positive = true;


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnimatedToggleSwitch<bool>.dual(
      current: positive,
      first: false,
      second: true,
      dif: size.width * 0.05,
      borderColor: Colors.transparent,
      borderWidth: 3.0,

      height: size.height * 0.06,
      boxShadow: const [
        BoxShadow(
          color: Colors.black26,
          spreadRadius: 1,
          blurRadius: 2,
          offset: Offset(0, 1.5),
        ),
      ],
      onChanged: (b) {
        setState(() => positive = b);
        return Future.delayed(Duration(seconds: 1));
      },
      colorBuilder: (b) => b ? Colors.green : Colors.red,
      iconBuilder: (value) => value
          ? Icon(Icons.check)
          : Icon(Icons.close_rounded),
      textBuilder: (value) => value
          ? Center(child: Text('Đến'))
          : Center(child: Text('Không')),
    );
  }
}
