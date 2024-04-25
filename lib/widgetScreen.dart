import 'package:flutter/material.dart';
import 'package:moviesapp/ApiManager.dart';
import 'GetFromApi/GetNewRelease.dart';

class WatchListScreen extends StatelessWidget {
  static const String routeName = 'WatchListScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder<GetNewRelease>(
        future: ApiManager.getNewRealesa(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Display a loading indicator while waiting for the data
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            // Handle any errors that occurred during the Future execution
            return Text('Error: ${snapshot.error}');
          } else {
            // Access the data when it's available
            var results = snapshot.data?.results;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Text(
                    'WatchList',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: Stack(
                            children: [
                              Container(
                                child: Center(
                                  child: Stack(
                                    children: [
                                      Image.network(
                                        results?[1].posterPath != null
                                            ? "https://image.tmdb.org/t/p/w500${results![1].posterPath}"
                                            : "",
                                        height: 150,
                                        width: 200,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                        Column(
                          children: [
                            Text(
                              results?[1].title ?? "",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              results?[1].releaseDate ?? "",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              results?[1].voteCount?.toString() ?? "",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(thickness: 0.5, color: Colors.white)
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: Stack(
                            children: [
                              Container(
                                child: Center(
                                  child: Stack(
                                    children: [
                                      Image.network(
                                        results?[3].posterPath != null
                                            ? "https://image.tmdb.org/t/p/w500${results![3].posterPath}"
                                            : "",
                                        height: 150,
                                        width: 200,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                        Column(
                          children: [
                            Text(
                              results?[3].title ?? "",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              results?[3].releaseDate ?? "",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              results?[3].voteCount?.toString() ?? "",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(thickness: 0.5, color: Colors.white)
                  ],
                ),
              ],
            );
          }
        },
      ),
    );
  }
}