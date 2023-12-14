import 'dart:convert';

import 'package:get/get.dart';

import '../data/models/posts_model.dart';
import 'package:http/http.dart' as http;

class PostsController extends GetxController {
  // late final Rx<Posts?> futurePosts;

  @override
  Future<void> onInit() async {
    super.onInit();
    // futurePosts = Rx<Posts?>(null);
    // await fetchPosts();
  }

  Future<Posts> fetchPosts(http.Client client) async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));

      if (response.statusCode == 200) {
        // futurePosts.value =
        return Posts.fromJson(
            jsonDecode(response.body) as Map<String, dynamic>);
      } else {
        throw Exception('Failed to load post');
      }
    } catch (error) {
      throw Exception('Failed to load post: $error');
    }
  }
}
// import 'dart:convert';

// import 'package:get/get.dart';

// import '../data/models/posts_model.dart';
// import 'package:http/http.dart' as http;

// class PostsController extends GetxController {
//   late final Rx<Posts?> futurePosts;

//   @override
//   void onInit() {
//     super.onInit();
//     futurePosts = Rx<Posts?>(null);
//     fetchPosts(http.Client());
//   }

//   Future<Posts> fetchPosts(http.Client client) async {
//     try {
//       final response = await http
//           .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));

//       if (response.statusCode == 200) {
//         return futurePosts.value =
//             Posts.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
//       } else {
//         throw Exception('Failed to load post');
//       }
//     } catch (error) {
//       throw Exception('Failed to load post: $error');
//     }
//   }
// }

