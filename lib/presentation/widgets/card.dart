import 'dart:ui';

import 'package:breaking_bad_app_bloc/constants/colors.dart';
import 'package:breaking_bad_app_bloc/data/models/Character.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Mycard extends StatelessWidget {
  MyColors colors = MyColors();
  CharacterModel characterModel;
  Mycard({required this.characterModel});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      decoration: BoxDecoration(
          color: colors.lightwhite,
          boxShadow: [
            BoxShadow(blurRadius: 5, color: colors.black, offset: Offset(3, 3))
          ],
          borderRadius: BorderRadius.all(Radius.circular(30))),
      height: 100,
      margin: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            child: Image.network(
              "${characterModel.image}",
              fit: BoxFit.cover,
              height: double.infinity,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: 50,
              padding: EdgeInsets.only(left: 10, right: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: colors.darkblue,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              child: Text(
                characterModel.name,
                style: TextStyle(
                    color: colors.lightwhite,
                    fontSize: 20,
                    fontWeight: FontWeight.w900),
              ),
            ),
          )
        ],
      ),
    );
  }
}
