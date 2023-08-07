import 'package:breaking_bad_app_bloc/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: MyColors().darkblue,
          centerTitle: true,
          title: Text(
            "caracters",
            style: TextStyle(color: MyColors().lightwhite),
          )),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
