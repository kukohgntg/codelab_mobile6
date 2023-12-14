import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import 'app/controllers/posts_controller.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
// class MyApp extends StatelessWidget {
//   final PostsController postsController = Get.put(PostsController());

//   MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Fetch Data Example',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Fetch Data Example'),
//         ),
//         body: Center(
//           child: Obx(
//             () {
//               if (postsController.futurePosts.value != null) {
//                 return Text(postsController.futurePosts.value!.body);
//               } else {
//                 return const CircularProgressIndicator();
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// void main() => runApp(MyApp());

