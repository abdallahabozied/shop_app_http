import 'package:flutter/material.dart';
import 'package:shop_app_http/Model/post_model.dart';
import 'package:shop_app_http/Network/http_connection.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String titleMethod = "Choose method";
  String titlePost = "";
  String bodyPost = "";
  HttpConnections httpConnections = HttpConnections();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HTTP Methods"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(titleMethod, style: const TextStyle(fontSize: 20)),
            const SizedBox(
              height: 20,
            ),
            const Text("Title :", style: TextStyle(fontSize: 25)),
            const SizedBox(
              height: 10,
            ),
            Text(titlePost, style: const TextStyle(fontSize: 20)),
            const SizedBox(
              height: 20,
            ),
            const Text("Body :", style: TextStyle(fontSize: 25)),
            const SizedBox(
              height: 20,
            ),
            Text(bodyPost, style: const TextStyle(fontSize: 20)),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      Post post = await httpConnections.fetchPost(1);
                      setState(() {
                        titlePost = post.title;
                        bodyPost = post.body;
                        titleMethod = "get";
                      });
                    },
                    child: const Text("Get")),
                ElevatedButton(
                    onPressed: () async {
                      Post post = await httpConnections.createPost(
                          "myTitle", "my Post Body");

                      setState(() {
                        titlePost = post.title;
                        bodyPost = post.body;
                        titleMethod = "Post";
                      });
                    },
                    child: const Text("Post")),
                ElevatedButton(
                    onPressed: () async {
                      Post post = await httpConnections.updatePost(
                          1, "Hi from Amit", "Accessed by Abdallah Abozaied");
                      setState(() {
                        titleMethod = "Put";
                        titlePost = post.title;
                        bodyPost = post.body;
                      });
                    },
                    child: const Text("Put")),
                ElevatedButton(
                    onPressed: () async {
                      Post post = await httpConnections.deletePost(1);
                      setState(() {
                        titlePost=post.title;
                        bodyPost=post.body;
                        titleMethod = "Delete";
                      });
                    },
                    child: const Text("Delete"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
