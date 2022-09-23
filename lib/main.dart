import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_api_flutter/models/food_news.dart';
import 'package:http/http.dart' as http;
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: DataFromAPI(),
//     );
//   }
// }
//
// class DataFromAPI extends StatefulWidget {
//   @override
//   _DataFromAPIState createState() => _DataFromAPIState();
// }
//
// class _DataFromAPIState extends State<DataFromAPI> {
//
//   // Future<List<User>> getData() async {
//   //   var response =
//   //   await http.get(Uri.https('jsonplaceholder.typicode.com', 'users'));
//   //   var jsonData = jsonDecode(response.body);
//   //   List<User> users = [];
//   //   for (var u in jsonData) {
//   //     User user = User(u["name"], u["phone"], u["email"]);
//   //     users.add(user);
//   //   }
//   //   print(users.length);
//   //   return users;
//   // }
//
//   Future<List<User>> getData() async {
//     var response =
//         await http.get(Uri.https("jsonplaceholder.typicode.com", "users"));
//     var jsonData = jsonDecode(response.body);
//     List<User> users = [];
//
//     for (var u in jsonData) {
//       User user = User(
//           // u["title"],
//           // u["thumbnail"],
//           // u["decscription"],
//           // u["thumbnailone"],
//           // u["decscriptionone"],
//           // u["thumbnailtwo"],
//           // u["decscriptiontwo"],
//           // u["thumbnailthree"],
//           // u["decscriptionthree"],
//           // u["created_at"],
//           // u["updated_at"],
//           // u["error"],
//           // u["status"],
//         u["name"],
//         u["phone"],
//         u["email"]
//
//       );
//       users.add(user);
//     }
//     print(users.length);
//     return users;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("User Data"),
//       ),
//       body: Container(
//         child: Card(
//           child: FutureBuilder<List<User>>(
//             future: getData(),
//             builder: (context, snapshot) {
//               if (snapshot.data == null) {
//                 return Container(
//                   child: Center(
//                     child: Text("Loading..."),
//                   ),
//                 );
//               } else {
//                 return ListView.builder(
//                   itemCount: snapshot.data!.length,
//                   itemBuilder: (context, i) {
//                     return ListTile(
//                       title: Column(
//                         children: [
//                           Text(snapshot.data![i].name),
//                           Text(snapshot.data![i].username),
//                           Text(snapshot.data![i].email),
//
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class User {
//   // final String title,
//   //     thumbnail,
//   //     decscription,
//   //     thumbnailone,
//   //     decscriptionone,
//   //     thumbnailtwo,
//   //     decscriptiontwo,
//   //     thumbnailthree,
//   //     decscriptionthree,
//   //     created_at,
//   //     updated_at;
//
//   final String name, username, email;
//
//   // final int error, status;
//
//   User(
//       // this.title,
//       // this.thumbnail,
//       // this.decscription,
//       // this.thumbnailone,
//       // this.decscriptionone,
//       // this.thumbnailtwo,
//       // this.decscriptiontwo,
//       // this.thumbnailthree,
//       // this.decscriptionthree,
//       // this.created_at,
//       // this.updated_at,
//       // this.error,
//       // this.status);
//
//       this.name,
//       this.username,
//       this.email);
// }



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food news',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FoodNewsScreen(),
    );
  }
}


class FoodNewsScreen extends StatefulWidget {
  const FoodNewsScreen({Key? key}) : super(key: key);

  @override
  _FoodNewsScreenState createState() => _FoodNewsScreenState();
}

class _FoodNewsScreenState extends State<FoodNewsScreen> {
  final String apiUrl = "http://103.95.197.177:3010/api/v1/news/all";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: const Text('Food news')),
        ),
        body: Container(
          color: Colors.grey,
          padding: const EdgeInsets.all(8),
          child: FutureBuilder<List<Data>>(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Data> users = snapshot.data as List<Data>;
                return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(8),
                        color: Colors.white,
                        child: Column(
                          children: [
                            Text(users[index].id.toString(), style: TextStyle(color: Colors.blue, fontSize: 20),),
                            Text(users[index].title.toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                            Text(users[index].thumbnail.toString()),
                            Text(users[index].decscription.toString()),
                            Text(users[index].thumbnailone.toString()),
                            // Text(users[index].decscriptionone.toString()),

                          ],
                        ),
                      );
                    });
              }
              if (snapshot.hasError) {
                print(snapshot.error.toString());
                return Text('error');
              }
              return CircularProgressIndicator();
            },
          ),
        ));
  }

  Future<List<Data>> fetchData() async {
    var response = await http.get(Uri.parse(apiUrl));
    return (json.decode(response.body)['data'] as List)
        .map((e) => Data.fromJson(e))
        .toList();
  }
}