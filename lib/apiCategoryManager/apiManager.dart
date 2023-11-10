
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'CategoryResponce.dart';
import 'ItemsListResponce.dart';

class apiManager {
  static Future<CategoryResponce> getCategory() async {
    //https://api.themoviedb.org/3/genre/movie/list
    try {
      Uri url = Uri.https("api.themoviedb.org", "/3/genre/movie/list");
      var responce = await http.get(url, headers: {
        "Authorization":
            "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzOGNmYjM5MzY0YjU3N2EzNDcxZWRiN2Q3ZGFkNWIzNSIsInN1YiI6IjY1MzI3MTRjNmQ5ZmU4MDBmZWE5NmMyYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.7hem38dmVy86_o8uanCp6_M1-mrZDrwy-iMLk8i4THM"
      });
      var body = responce.body;
      var json = jsonDecode(body.toString());
      return CategoryResponce.fromJson(json);
    } catch (e) {
      print("ERROR IN API MANAGER");
      throw e;
      //print("ERROR IN API MANAGER");
    }
  }
  static Future<ItemsListResponce> getListFilm(String id) async {
    //https://api.themoviedb.org/3/genre/movie/list
    try {
      Uri url = Uri.https("api.themoviedb.org", "/3/discover/movie",{
        "with_genres" : id
      });
      var responce = await http.get(url, headers: {
        "Authorization":
        "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzOGNmYjM5MzY0YjU3N2EzNDcxZWRiN2Q3ZGFkNWIzNSIsInN1YiI6IjY1MzI3MTRjNmQ5ZmU4MDBmZWE5NmMyYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.7hem38dmVy86_o8uanCp6_M1-mrZDrwy-iMLk8i4THM",

      });
      var body = responce.body;
      var json = jsonDecode(body.toString());
      return ItemsListResponce.fromJson(json);
    } catch (e) {
      print("ERROR IN API MANAGER");
      throw e;
      //print("ERROR IN API MANAGER");
    }
  }
}
