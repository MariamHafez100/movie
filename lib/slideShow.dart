import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import 'ApiManager.dart';
import 'GetFromApi/GetPopular.dart';

// class SlideShow extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return  Container(
//       child: FutureBuilder<GetPopular>(
//         future: ApiManager.getSources(),
//         builder: (context, snapshot) {
//           return  Stack(
//             children: [
//               ImageSlideshow(children: [
//                 Image.asset(
//                   'assets/images/R.jpeg',
//                   // result[index]?.posterPath??'',
//                   height: MediaQuery.of(context).size.height * 0.3,
//                   width: MediaQuery.of(context).size.width * 1,
//                   fit: BoxFit.fill,
//                 ),
//               ]),
//               Row(
//                 children: [
//                   ///photo over background
//                   Container(
//                       margin: EdgeInsets.only(left: 16, top: 140),
//                       child: Image.asset(
//                         'assets/images/R.jpeg',
//                         height: MediaQuery.of(context).size.height * 0.2,
//                         width: MediaQuery.of(context).size.width * 0.3,
//                         fit: BoxFit.fill,
//                       )),
//
//                   ///text Container
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(left: 12, top: 240),
//                         child: Text(
//                           'THE EXPENDABLES',
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 8.0, left: 13),
//                         child: Text(
//                           '2019  PG-13  2h 7m',
//                           style: TextStyle(
//                             color: Colors.grey,
//                             fontSize: 12,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               )
//             ],
//           );
//         },
//
//       ),
//     );
//   }
//
// }
class SlideShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<GetPopular>(
        future: ApiManager.getSources(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var popular = snapshot.data;
            var posterPath = popular?.results![0].posterPath;
            var title = popular?.results![0].title;
            var releaseDate = popular?.results![0].releaseDate;

            return Stack(
              children: [
                ImageSlideshow(
                    indicatorColor: Colors.yellowAccent,
                    isLoop: true,

                    children: [
                  Image.network(
                    'https://image.tmdb.org/t/p/original$posterPath',
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 1,
                    fit: BoxFit.fill,
                  ),
                ]),
                Row(
                  children: [
                    ///photo over background
                    Container(
                      margin: EdgeInsets.only(left: 16, top: 140),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/original$posterPath',
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.3,
                        fit: BoxFit.fill,
                      ),
                    ),

                    ///text Container
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 12, top: 240),
                            child: Text(
                              title!,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 13),
                            child: Text(
                              releaseDate!,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            );
          } else if (snapshot.hasError) {
            return Text('Error loading data: ${snapshot.error}');
          }
          // By default, show a loading spinner
          return CircularProgressIndicator();
        },
      ),
    );
  }
}