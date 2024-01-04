import 'package:dio/dio.dart';
import 'package:tes_transisi_app/model/user.dart';
import 'package:tes_transisi_app/network/logging.dart';

import '../style/style.dart';

class DioClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://reqres.in/api',
      connectTimeout: Duration(milliseconds: 5000),
      receiveTimeout: Duration(milliseconds: 3000),
    ),
  )..interceptors.add(Logging());

  Future<List<User>> fetchDataList() async {
    try {
      Response response = await _dio.get('/users/');

      Map<String, dynamic> data = response.data as Map<String, dynamic>;

      List<User> users = (data['data'] as List).map((userData) => User.fromJson(userData as Map<String, dynamic>)).toList();

      return users;
    } catch (e) {
      print('Error: $e');
      AppAlert(message: '$e', alertType: AlertType.error);
      return [];
    }
  }

  Future<User?> fetchDataSpesific({required String idUser}) async {
    User? users;
    try {
      Response response = await _dio.get('/users/$idUser');

      Map<String, dynamic> data = response.data as Map<String, dynamic>;
      users = User.fromJson(data['data']);
      return users;
    } catch (e) {
      print('Error: $e');
      AppAlert(message: '$e', alertType: AlertType.error);
      return users;
    }
  }

  Future<Map?> createUser({String? name, String? job, String? avatar, String? email, String? phoneNumber, String? website}) async {
    var dataPayload = {};
    Map<String, dynamic>? dataResponse;
    try {
      dataPayload = {
        'name': name ?? '',
        'job': job ?? '',
        'avatarsdasd': avatar ?? '',
        'email': email ?? '',
        'tel': phoneNumber ?? '',
        'web': website ?? '',
      };
      Response response = await _dio.post(
        '/users',
        data: dataPayload,
      );
      dataResponse = response.data as Map<String, dynamic>;
      print('User created: $dataResponse');
      return dataResponse;
    } catch (e) {
      print('Error creating user: $e');
      AppAlert(message: '$e', alertType: AlertType.error);
    }
    return dataResponse;
  }
}
