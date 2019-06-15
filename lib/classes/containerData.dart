import 'package:flutter/material.dart';

class ContainerMain extends StatelessWidget {
  ContainerMain({this.data, this.value});

  final String data;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(30, 20, 30, 10),
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Color(0xff1d1e33),
          boxShadow: [
            BoxShadow(
              blurRadius:
                  15.0, // has the effect of softening the shadow
            )
          ]),
      child: Center(
        child: Text(
          data,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}