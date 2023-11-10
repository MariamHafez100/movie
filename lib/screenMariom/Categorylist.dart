import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviesapp/apiCategoryManager/apiManager.dart';



import 'ListFilmCategoryDetails.dart';
import '../apiCategoryManager/CategoryResponce.dart';

class CategoryList extends StatelessWidget{
  static const String routeName ="categoryList";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black,
      body: Container(
        color: Colors.black,
        child: FutureBuilder<CategoryResponce>(
          future: apiManager.getCategory(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(
                    color: Colors.yellowAccent,
                    backgroundColor: Colors.grey,
                    strokeWidth: 9),
              );
            }
            return  Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 70,left: 50,bottom: 0),
                  child: Text("BROWSER MOVIES",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 23,
                      fontStyle: FontStyle.italic )),
                ),
                Expanded(

                  child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:2 ,
                    mainAxisSpacing:8 ,
                    crossAxisSpacing: 1,
                  ),
                    itemBuilder: (context , index){
                      return InkWell(
                          onTap: (){
                            Navigator.pushNamed(context,FilmListCategoryItem.routeName,
                                arguments:snapshot.data?.genres?[index].id.toString()??"");
                            print("pressed");},
                          // onTap:() => onCategoryTap(categories[index]),
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 13,),
                            decoration: BoxDecoration(
                              border: Border.all(width: 6,
                                color: Colors.transparent,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                colors: [Colors.yellow, Colors.red], // Replace with your desired gradient colors
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),

                            child: Stack(
                              children: [
                                Container(

                                  child: Image.asset(ListOfImages[index],fit: BoxFit.fill,),
                                  height: 156,
                                  width: 200,
                                ),
                                //ListOfImages[index]
                                Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(snapshot.data!.genres?[index].name??"",
                                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 20),))
                              ],
                            ),)
                      );},
                    itemCount: 10,
                  ),
                )

              ],
            );
          },

        ),
      ),
      // Container(
      //   // height: double.infinity,
      //   // width: double.infinity,
      //   // decoration:  BoxDecoration(
      //   //     gradient: LinearGradient(
      //   //         colors: [Colors.purpleAccent, Colors.blue,Colors.blueAccent]),
      //   //     //borderRadius: BorderRadius.circular(50),
      //   //     //color: Colors.green
      //   // ),
      //   child: Padding(
      //     padding: const EdgeInsets.all(40.0),
      //     child: Text("BROWSER MOVIES",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 23),),
      //   )
      //   ,

    );
  }

}

List<String> ListOfImages =[
  "assets/images/ction.jpg",
  "assets/images/advn.jpg",
  "assets/images/arnob.jpg",
  "assets/images/comicw.png",
  "assets/images/cry.jpg",
  "assets/images/doc.jpg",
  "assets/images/drama.jpg",
  "assets/images/family.jpg",
  "assets/images/fan.jpg",
  "assets/images/histo.jpg",

  // "assets/images/action.jpg",
  // "assets/images/comedy.jpg",
  // "assets/images/full.jpg",
  // "assets/images/horror.png",
  // "assets/images/sciFic.jpg",
  // "assets/images/action.jpg",
  // "assets/images/action.jpg",
  // "assets/images/action.jpg",
  // "assets/images/action.jpg",

];