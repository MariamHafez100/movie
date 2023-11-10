import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:moviesapp/ApiManager.dart';
import 'package:moviesapp/GetFromApi/GetNewRelease.dart';
import 'package:moviesapp/GetFromApi/GetPopular.dart';
import 'package:moviesapp/NewReleases.dart';
import 'package:moviesapp/recomended.dart';
import 'package:moviesapp/screenMariom/Categorylist.dart';
import 'package:moviesapp/search/search_screen.dart';
import 'package:moviesapp/widgetScreen.dart';

import 'anas.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  int selected =0;
  @override
  Widget build(BuildContext context) {

    return
      // FutureBuilder<GetNewRelease>(
      //
      //   future:ApiManager.getNewRealesa(),
      //   builder:(context, snapshot) {
      //     if(snapshot.connectionState==ConnectionState.waiting){
      //       return Center(
      //         child: CircularProgressIndicator(
      //         ),
      //       );
      //
      //     }else if(snapshot.hasError){
      //       return Column(
      //         children: [
      //           Text('Something went wrong'),
      //           ElevatedButton(onPressed: (){}, child: Text('Try Again'))
      //         ],
      //       );
      //     }else{
             Scaffold(

                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: selected,
                  onTap: (index){

                      selected = index;
                      setState(() {});

                  },
                  type: BottomNavigationBarType.fixed, // Add this line
                  //backgroundColor: Colors.transparent,
                  backgroundColor: Color(0xff1A1A1A),
                  selectedItemColor: Color(0xffefdc1d),
                  unselectedItemColor: Colors.white,
                  items: [
                    BottomNavigationBarItem(icon: Icon(Icons.home,), label: 'HOME'),
                    BottomNavigationBarItem(icon: Icon(Icons.search,), label: 'SEARCH'),
                    BottomNavigationBarItem(icon: Icon(Icons.movie,), label: 'CATEGORY'),
                    BottomNavigationBarItem(icon: Icon(Icons.movie,), label: 'WATCHLIST'),
                    // BottomNavigationBarItem(
                    //   icon: Icon(Icons.save),
                    //   label: 'HOME'
                    // ),
                  ],
                ),
                backgroundColor: Color(0xff121312),
                body:
                screens[selected]
            );
          }

List<Widget> screens = [
  anasScreen(),
  SearchScreen(),
  CategoryList(),
  screen()
];




  }

