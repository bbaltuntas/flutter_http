import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'models/post.dart';

class RemoteApi extends StatefulWidget {
  @override
  _RemoteApiState createState() => _RemoteApiState();
}

class _RemoteApiState extends State<RemoteApi> {
  List<Post> postList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Remote Api"),
      ),
      body: Container(
        child: FutureBuilder(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
               // debugPrint(snapshot.error);
                return Center(
                  child: Icon(Icons.error),
                );
              } else if (snapshot.hasData) {
                postList = snapshot.data;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      itemCount: postList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(8.0)),
                          child: ListTile(
                            title: Text("ID: " + postList[index].id.toString()),
                            subtitle: Text(
                              "Subtitle: " + postList[index].title,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        );
                      }),
                );
              } else {
                return Center(
                    child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("assets/pacman.gif"),
                  )),
                ));
              }
            }),
      ),
    );
  }

  Future<List<Post>> fetchData() async {
    List<Post> postList;
    String url = "https://jsonplaceholder.typicode.com/posts";

    var response = await http.get(Uri.encodeFull(url));

    if (response.statusCode == 200) {
      postList = (json.decode(response.body) as List).map((e) {
        return Post.fromJson(e);
      }).toList();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return postList;
  }
}
