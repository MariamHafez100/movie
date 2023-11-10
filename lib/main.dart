import 'package:flutter/material.dart';
import 'package:moviesapp/Home_screen.dart';
import 'package:moviesapp/screenMariom/Categorylist.dart';
import 'package:moviesapp/screenMariom/ListFilmCategoryDetails.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeScreen.routeName,
      routes: {
        CategoryList.routeName : (context) => CategoryList(),
        FilmListCategoryItem.routeName : (context)=> FilmListCategoryItem(),
        HomeScreen.routeName:(context) => HomeScreen()
      },
      debugShowCheckedModeBanner: false,

    );
  }
}
