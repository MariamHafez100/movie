import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviesapp/apiCategoryManager/apiManager.dart';

import '../apiCategoryManager/CategoryResponce.dart';
import '../apiCategoryManager/ItemsListResponce.dart';

class FilmListCategoryItem extends StatelessWidget{
  static const String routeName = "filmsList";
  @override
  Widget build(BuildContext context) {
    var argus = ModalRoute.of(context)?.settings.arguments as String;
   return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.transparent,
       elevation: 0.0,
       title: Center(child: Text("FILMS 🎥")),
     ),
     backgroundColor: Colors.black,
     body: FutureBuilder<ItemsListResponce>(
       future: apiManager.getListFilm(argus),
       builder: (context, snapshot) {
         if (snapshot.connectionState == ConnectionState.waiting) {
           return Center(
             child: CircularProgressIndicator(
                 color: Colors.yellowAccent,
                 backgroundColor: Colors.grey,
                 strokeWidth: 9),
           );
         }
         return Column(
             crossAxisAlignment: CrossAxisAlignment.stretch,
             children: [

               Expanded(

                 child: GridView.builder(
                   itemCount: snapshot.data!.results!.length,
                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                       crossAxisCount: 1,
                       mainAxisSpacing: 8,
                       crossAxisSpacing: 1,
                     ),
                     itemBuilder: (context, index) {
                       return
                         Container(
                           margin: EdgeInsets.all(5),
                           padding: EdgeInsets.all(15),
                           //color: Colors.grey,
                           decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color:Colors.white12 ),
                           child: Column(
                           children: [
                             Expanded(child:
                             Image.network("https://image.tmdb.org/t/p/w500"+ snapshot.data!.results![index].posterPath!)),
                             SizedBox(height: 6),
                             Text(snapshot.data?.results?[index].title??"",style: TextStyle(color: Colors.white,fontSize: 16),),
                             Text(snapshot.data?.results?[index].releaseDate??"",style: TextStyle(color: Colors.white,fontSize: 16)),
                             Text("RATING : ${snapshot.data?.results?[index].voteCount.toString()??""} ⭐",style: TextStyle(color: Colors.white,fontSize: 16)),
                             Text(snapshot.data?.results?[index].originalLanguage??"",style: TextStyle(color: Colors.white,fontSize: 16)),
                             //Text("TITLE"),

                           ],
                       ),
                         );
                     }

                 ),
               ),
             ]
         );
       })
   );
}
}

// class argument{
//   int id;
//
//   argument({required this.id});
// }