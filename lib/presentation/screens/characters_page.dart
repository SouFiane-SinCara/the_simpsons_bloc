import 'package:breaking_bad_app_bloc/constants/colors.dart';
import 'package:breaking_bad_app_bloc/constants/routes_names.dart';
import 'package:breaking_bad_app_bloc/data/api/get_characters.dart';
import 'package:breaking_bad_app_bloc/data/models/Character.dart';
import 'package:breaking_bad_app_bloc/logic/bloc/app_bloc.dart';
import 'package:breaking_bad_app_bloc/presentation/screens/error_page.dart';
import 'package:breaking_bad_app_bloc/presentation/screens/loading_page.dart';
import 'package:breaking_bad_app_bloc/presentation/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersHome extends StatefulWidget {
  @override
  State<CharactersHome> createState() => _CharactersHomeState();
}

class _CharactersHomeState extends State<CharactersHome> {
  bool onsearch = false;
  MyColors colors = MyColors();
  List<CharacterModel> searchlist = [];
  TextEditingController searchcontroller = TextEditingController();
  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        if (state is LoadedDataState) {
          return Scaffold(
              appBar: AppBar(
                leading: onsearch
                    ? IconButton(
                        onPressed: () {
                          onsearch = false;
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: colors.darkwhite,
                        ),
                      )
                    : SizedBox(),
                actions: [
                  onsearch
                      ? IconButton(
                          onPressed: () {
                            searchcontroller.clear();
                            setState(() {});
                            // i want to clear all text from my text field
                          },
                          icon: Icon(
                            Icons.close,
                            color: colors.darkwhite,
                          ))
                      : IconButton(
                          onPressed: () {
                            onsearch = true;
                            setState(() {});
                          },
                          icon: Icon(
                            Icons.search,
                            color: colors.darkwhite,
                          ))
                ],
                centerTitle: true,
                backgroundColor: colors.darkblue,
                title: onsearch
                    ? Container(
                        width: double.infinity,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 10),
                        height: 40,
                        decoration: BoxDecoration(
                            color: colors.lightwhite,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: TextField(
                          controller: searchcontroller,
                          onChanged: (value) {
                            searchlist = state.allcharacters
                                .where((element) => element.name
                                    .toLowerCase()
                                    .contains('$value'))
                                .toList();
                            setState(() {});
                          },
                          style: TextStyle(
                              color: colors.darkblue,
                              fontWeight: FontWeight.w900),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "character name",
                              hintStyle: TextStyle(
                                  color: colors.lightblue,
                                  fontWeight: FontWeight.w500)),
                        ),
                      )
                    : Text(
                        "Characters",
                        style: TextStyle(
                          color: colors.lightwhite,
                        ),
                      ),
              ),
              backgroundColor: colors.lightwhite,
              body: searchcontroller.text == ""
                  ? Container(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemCount: state.allcharacters.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, DetailCharacter,
                                    arguments: state.allcharacters[index]);
                              },
                              child: Mycard(
                                characterModel: state.allcharacters[index],
                              ));
                        },
                      ),
                    )
                  : Container(
                      child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemCount: searchlist.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, DetailCharacter,
                                arguments: searchlist[index]);
                          },
                          child: Mycard(characterModel: searchlist[index]),
                        );
                      },
                    )));
        } else if (state is LoadingDataState) {
          return LoadingPage();
        } else if (state is ErrorDataState) {
          return ErrorPage(error: state.Error);
        } else {
          return ErrorPage(error: "404");
        }
      },
    );
  }
}
