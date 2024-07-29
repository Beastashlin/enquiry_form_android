import 'package:jwt_decoder/jwt_decoder.dart';

class User {
  final String jwt;
  Map<String, dynamic> decodeJwt() {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(jwt);
    return decodedToken;
  }

  User({required this.jwt});
}
