import 'package:task/src/network/index.dart';
import 'package:task/src/utils/index.dart';

class PostsAPI {
  final networkClient = NetworkCalls();

  Future getPosts() async {
    final id = await getDataFromStorage('id');
    Uri uri =
        // Uri.parse('https://jsonplaceholder.typicode.com/posts?userId=$id');
        Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final result = await networkClient.get(url: uri);
    return result;
  }
}
