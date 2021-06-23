import 'dart:async';
import 'package:messenger_app/src/firebase/auth_firebase.dart';

class AuthBloc {
  var fireAuth =FireBAuth();

  StreamController _nameController = new StreamController();
  StreamController _emailController = new StreamController();
  StreamController _phoneController = new StreamController();
  StreamController _passController = new StreamController();

  Stream get nameStream => _nameController.stream;
  Stream get emailStream => _emailController.stream;
  Stream get phoneStream => _phoneController.stream;
  Stream get passStream => _passController.stream;

  bool  isValid(String name,String email,String phone,String pass){
    if(name.length == 0|| name.isEmpty){
      _nameController.sink.addError('enter name again');
      return false;
    }
    _nameController.sink.add('');

    if(email.length == 0|| email.isEmpty){
      _emailController.sink.addError('enter email again');
      return false;
    }
    _emailController.sink.add('');

    if(phone.length == 0|| phone.isEmpty){
      _phoneController.sink.addError('enter phone again');
      return false;
    }
    _phoneController.sink.add('');

    if(pass.length == 0|| pass.isEmpty){
      _passController.sink.addError('enter pass again');
      return false;
    }
    _passController.sink.add('');
    return true;
  }

  void signUp(String name, String email,String phone,String password,Function onSuccess,Function(String) onUpError){
    fireAuth.SignUp(name, email, phone, password, onSuccess, onUpError);
  }

  void signIn(String email,String password,Function onSuccess,Function(String) onInError){
    fireAuth.SignIn(email, password, onSuccess, onInError);
  }

  void dispose(){
    _nameController.close();
    _emailController.close();
    _passController.close();
    _phoneController.close();
  }
}