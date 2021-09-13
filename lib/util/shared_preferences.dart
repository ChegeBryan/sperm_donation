import 'package:shared_preferences/shared_preferences.dart';
import 'package:sperm_donation/models/user.dart';

class UserPrefences {
  Future<void> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('email', user.email!);
  }

  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? email = prefs.getString('email');

    return User(email: email);
  }

  Future<void> removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("email");
  }
}
