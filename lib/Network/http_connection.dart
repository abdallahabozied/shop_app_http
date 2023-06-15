import 'dart:convert';
import 'package:http/http.dart' as varHttp;
import 'package:http/http.dart';
import 'package:shop_app_http/Model/post_model.dart';

class HttpConnections {
  static String baseURL = "https://jsonplaceholder.typicode.com/";
  static String postEndPoint = "posts";
  final client = varHttp.Client();

  Future<Post> fetchPost(int id) async {
    Response response =
        await client.get(Uri.parse(baseURL + postEndPoint + "/$id"));
    if (response.statusCode == 200) {
      //1- return string to JSON
      String body = response.body;
      //2- JSON to map
      Map<String, dynamic> _map = jsonDecode(body);
      //3- map to dart data
      Post _post = Post.fromJson(_map);
      return _post;
    } else {
      throw Exception('failed to get post $id');
    }
  }

  Future<Post> createPost(String title, String body) async {
    Map mybody = {'title': title, 'body': body};

    Response response = await client.post(Uri.parse(baseURL + postEndPoint),
        body: jsonEncode(mybody));
    if (response.statusCode == 201) {
      Map<String, dynamic> _map = jsonDecode(response.body);
      Post _post = Post.fromJson(_map);
      return _post;
    } else {
      throw Exception('failed to creat post');
    }
  }

  Future<Post> updatePost(int postid, String title, String body) async {
    Map mybody = {'title': title, 'body': body};
    Response response = await client.put(
        Uri.parse(baseURL + postEndPoint + "/$postid"),
        body: jsonEncode(mybody),
        headers: {'Content-Type': 'application/json; charsets=UTf-8'});
    if (response.statusCode == 200) {
      Post _post = Post.fromJson(jsonDecode(response.body));
      return _post;
    } else {
      throw Exception("failed to update");
    }
  }

  Future<Post> deletePost(int postid) async {
    Response response =
        await client.delete(Uri.parse(baseURL + postEndPoint + "/$postid"));

    if (response.statusCode == 200) {
      Post _post = Post.fromJson({});
      return _post;
    }
    else{
      throw Exception("failed to delete post ");
    }
  }
}
