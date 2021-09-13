import 'package:shared_preferences/shared_preferences.dart';
import 'package:sperm_donation/models/user.dart';

class UserPrefences {
  Future<void> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('email', user.email!);
    prefs.setString('userRole', user.role!);
  }

  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? email = prefs.getString('email');
    String? userRole = prefs.getString('user_role');

    return User(email: email, role: userRole);
  }

  Future<void> removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("email");
    prefs.remove('userRole');
  }
}
