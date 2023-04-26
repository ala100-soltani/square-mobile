import 'package:http/http.dart' as http;
import 'package:square/features/authentication/domain/entities/login.dart';

import '../models/login_model.dart';

abstract class AuthenticationRemoteDataSource {
  Future<Login> loginUser(String email, String password);
}

class AuthenticationRemoteSourceImpl extends AuthenticationRemoteDataSource {
  final http.Client client;

  AuthenticationRemoteSourceImpl({required this.client});

  @override
  Future<Login> loginUser(String email, String password) async {
    /* final url = Uri.parse('https://test.com/login');

    final response = await client.post(
      url,
      body: {'email': email, 'password': password},
    );

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      return User.fromJson(responseBody);
    } else if (response.statusCode == 401) {
      throw AuthenticationException('Invalid email or password.');
    } else {
      throw AuthenticationException('Failed to authenticate user.');
    } */

    //simulate a successful login after 2 seconds
    await Future.delayed(const Duration(seconds: 2));
    return const LoginModel(token: "ldfhdluhgluhgjr");
  }
}
