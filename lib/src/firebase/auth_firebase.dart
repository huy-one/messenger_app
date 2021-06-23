import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FireBAuth {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void SignUp(String name, String email, String phone, String password,
      Function onSuccess, Function(String) onError) {
    _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((user) => _createUser(_firebaseAuth.currentUser!.uid, name, phone,
            onSuccess, onError))
        .catchError((error) {
          _signInError(error.code,onError);
    });
  }

  void SignIn(String email, String password, Function onSuccess,
      Function(String) onError) {
    _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((user) => onSuccess())
        .catchError((error) {
      onError('Sign In fail');
    });
  }

  void _createUser(String userId, String name, String phone, Function onSuccess,
      Function(String) onError) {
    var user = {'name': name, 'phone': phone};
    var ref = FirebaseDatabase.instance.reference().child('user');
    ref.child(userId).set(user).then((user) {
      onSuccess();
    }).catchError((err) {
      onError('Sign up fail, please try again');
    });
  }

  void _signInError(String code, Function(String) onError) {
    switch (code) {
      case "ERROR_INVALD_EMAIL":
      case "ERROR_INVALID_CREDENTIAL":
        onError("Invalid email");
        break;
      case "ERROR_EMAIL_ALREADY_IN_USE":
        onError("Email has existed");
        break;
      case "ERROR_WEAK_PASSWORD":
        onError("the password is not strong enough");
        break;
      default:
        onError("SignUp fail, please try again");
        break;
    }
  }

  Future<void> signOut() async {
    print('Sign Out');
    return _firebaseAuth.signOut();
  }
}
