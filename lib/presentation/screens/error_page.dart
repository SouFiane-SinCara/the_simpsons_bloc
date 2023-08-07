import 'package:breaking_bad_app_bloc/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ErrorPage extends StatelessWidget {
  String error;
  ErrorPage({required this.error});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: MyColors().darkblue,
          title: Text(
            "caracters",
            style: TextStyle(color: MyColors().lightwhite),
          )),
      body: Center(
        child: Text("$error"),
      ),
    );
  }
}
