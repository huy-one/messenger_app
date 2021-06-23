import 'package:flutter/material.dart';
import 'package:messenger_app/src/components/dialog/error_dialog.dart';
import 'package:messenger_app/src/components/dialog/loading_dialog.dart';
import 'package:messenger_app/src/components/login_textfield.dart';
import 'package:messenger_app/src/resouces/chat_page.dart';
import 'package:messenger_app/src/resouces/login_page.dart';
import 'package:messenger_app/src/blocs/auth_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  AuthBloc bloc = new AuthBloc();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            decoration: boxLoginTheme(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.data_usage_rounded,
                        size: 50,
                      ),
                      Text(
                        'Sign Up',
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Text('moon light'),
                LoginTextField(
                  controller: _nameController,
                  labelT: "Name",
                  icon: Icon(Icons.stream),
                  bloc: bloc.nameStream,
                ),
                LoginTextField(
                  controller: _emailController,
                  labelT: "Email",
                  icon: Icon(Icons.email_outlined),
                  bloc: bloc.emailStream,
                ),
                LoginTextField(
                  controller: _phoneController,
                  labelT: "Phone",
                  icon: Icon(Icons.phone_android_outlined),
                  bloc: bloc.phoneStream,
                ),
                LoginTextField(
                  controller: _passController,
                  labelT: "Password",
                  icon: Icon(Icons.lock_outline),
                  bloc: bloc.passStream,
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: ButtonTheme(
                    minWidth: double.infinity,
                    height: 50,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: FlatButton(
                      onPressed: () {
                        _onClickSignUp();
                      },
                      child: Text('SIGN IN'),
                      color: Colors.black.withOpacity(0.25),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 200),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Sign in ? '),
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => LoginPage())),
                        child: Text(
                          'SignIn',
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onClickSignUp() {
    String name = _nameController.text;
    String email = _emailController.text;
    String phone = _phoneController.text;
    String pass = _passController.text;
    if (bloc.isValid(name, email, phone, pass)) {
      LoadingDialog.showLoadingDialog(context, 'Loading...');
      bloc.signUp(name, email, phone, pass, () {
        LoadingDialog.hideLoadingDialog(context);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ChatPage()));
      }, (msg) {
        LoadingDialog.hideLoadingDialog(context);
        ErrorDialog.showErrorDialog(context, 'Sign UP fail', msg);
      });
    }
  }

  BoxDecoration boxLoginTheme() {
    return BoxDecoration(
        gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0.1, 0.5, 1],
      colors: [Colors.pinkAccent, Colors.white, Colors.pinkAccent],
    ));
  }
}
