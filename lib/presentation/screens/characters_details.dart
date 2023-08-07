import 'package:auto_size_text/auto_size_text.dart';
import 'package:breaking_bad_app_bloc/constants/colors.dart';
import 'package:breaking_bad_app_bloc/data/models/Character.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DetailsCharacters extends StatelessWidget {
  MyColors colors = MyColors();
  CharacterModel characterModel;
  DetailsCharacters({
    required this.characterModel,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.lightwhite,
      appBar: AppBar(
        backgroundColor: colors.darkblue,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: colors.darkwhite,
          ),
        ),
        title: AutoSizeText(
          characterModel.name,
          style: TextStyle(color: colors.darkwhite),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 20, color: colors.black, offset: Offset(3, 3))
                ],
                border: Border.all(
                  width: 10,
                  color: colors.darkblue,
                )),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Image.network(
                characterModel.image,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 10),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    AutoSizeText(
                      "ID : ",
                      style: TextStyle(
                          color: colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w900),
                    ),
                    AutoSizeText(
                      "${characterModel.id}",
                      style: TextStyle(
                          color: colors.darkblue,
                          fontSize: 30,
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    AutoSizeText(
                      "gendere : ",
                      style: TextStyle(
                          color: colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w900),
                    ),
                    AutoSizeText(
                      "${characterModel.gender}",
                      style: TextStyle(
                          color: colors.darkblue,
                          fontSize: 30,
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    AutoSizeText(
                      "status : ",
                      style: TextStyle(
                          color: colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w900),
                    ),
                    AutoSizeText(
                      "${characterModel.status}",
                      style: TextStyle(
                          color: colors.darkblue,
                          fontSize: 30,
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      "Episodes: ",
                      style: TextStyle(
                          fontSize: 30,
                          color: colors.black,
                          fontWeight: FontWeight.w900),
                      maxLines: 1,
                    ),
                    Expanded(
                      // Wrap the AutoSizeText with Expanded to make it take available space
                      child: AutoSizeText(
                        "  ${characterModel.episode.join(' ').toString().replaceAll("https://rickandmortyapi.com/api/episode/", "")}",
                        style: TextStyle(
                            color: colors.darkblue,
                            fontWeight: FontWeight.w800),
                        maxLines: 4,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    AutoSizeText(
                      "species : ",
                      style: TextStyle(
                          color: colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w900),
                    ),
                    AutoSizeText(
                      "${characterModel.species}",
                      style: TextStyle(
                          color: colors.darkblue,
                          fontSize: 30,
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
