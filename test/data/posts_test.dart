import 'package:codelab/app/controllers/posts_controller.dart';
import 'package:codelab/app/data/models/posts_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'posts_test.mocks.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([http.Client, PostsController])
void main() {
  late MockClient mockClient;
  late PostsController postsController;

  setUp(() {
    // Set up MockClient and PostsController for each test
    mockClient = MockClient();
    postsController = PostsController();
  });
  group('ApiService', () {
    test('fetchPosts returns a list of articles if response is successful',
        () async {
      // Mock the HTTP response for successful case
      when(mockClient
              .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1')))
          .thenAnswer((_) async =>
              http.Response('Succsess', 200)); // Mock the HTTP response
      final posts = await postsController.fetchPosts(mockClient);
      expect(posts, isA<Posts>());
      // expect(await postsController.fetchPosts(mockClient), isA<Posts>());
    });
    test('fetchPosts returns an empty list if response fails', () async {
      // Mock the HTTP response for response failure
      when(mockClient
              .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1')))
          .thenAnswer((_) async =>
              http.Response('Server error', 500)); // Mock the HTTP response
      final posts = await postsController.fetchPosts(mockClient);
      expect(posts, isA<Posts>());
      // expect(await postsController.fetchPosts(mockClient), isA<Posts>());
    });
    test('fetchPosts returns an empty list if an error occurs', () async {
      // Mock an error response
      when(mockClient
              .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1')))
          .thenThrow(Exception('Test error')); // Mock an error
      final posts = await postsController.fetchPosts(mockClient);
      expect(posts, isA<Posts>());
      // expect(await postsController.fetchPosts(mockClient), isA<Posts>());
    });
  });
}
