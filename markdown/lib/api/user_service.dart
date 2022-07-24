import 'package:dio/dio.dart';
import 'package:markdown_app/models/user.dart';

class UserService {
  final String productsURL = 'http://localhost:6000/user';
  final Dio dio = Dio();
  final String userId;

  UserService(this.userId);

  Future<User> getUser() async {
    late User user;
    try {
      final res = await dio.get(productsURL);

      user = res.data['user']
        .map<User>(
          (item) => User.fromJson(item),
        )
        .toList();
    }
    on DioError catch(e) {
      //user = {};
    }

    return user;
  }
}
