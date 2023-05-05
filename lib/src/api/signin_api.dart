import 'package:task/src/network/index.dart';

class SigninAPI {
  final networkClient = NetworkCalls();

  Future signIn() async {
    Uri uri = Uri.parse('https://jsonplaceholder.typicode.com/users');
    final result = await networkClient.get(url: uri);
    return result;
  }
}
