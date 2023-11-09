import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ApiManager.dart';
import 'GetFromApi/GetNewRelease.dart';

class NewReleaseScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(left: 16),
      decoration: BoxDecoration(color: Color(0xff282A28)),
      child: FutureBuilder<GetNewRelease>(
        future:ApiManager.getNewRealesa(),
        builder: (context, snapshot) {
          return  Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // New release text
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'New Releases',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),

              // Movies scroll
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return
                      Padding(
                        padding: EdgeInsets.only(right: 8, bottom: 12,top: 4),
                        child: Container(
                          padding: EdgeInsets.only(top: 8),
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Image.network(
                            "https://image.tmdb.org/t/p/w500"+ snapshot.data!.results![index].posterPath!,
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: MediaQuery.of(context).size.width * 0.25,
                          ),

                        ),
                      );
                  },
                  itemCount: snapshot.data?.results?.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

}