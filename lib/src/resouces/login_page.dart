import 'package:flutter/material.dart';
import 'package:messenger_app/src/app.dart';
import 'package:messenger_app/src/components/dialog/error_dialog.dart';
import 'package:messenger_app/src/components/dialog/loading_dialog.dart';
import 'package:messenger_app/src/components/login_textfield.dart';
import 'package:messenger_app/src/components/theme/constants.dart';
import 'package:messenger_app/src/resouces/chat_page.dart';
import 'package:messenger_app/src/resouces/regsiter_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  bool passhide = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: boxLoginTheme(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.data_usage_rounded,
                    size: 50,
                  ),
                  Text(
                    'Messenger Login',
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(fontWeight: FontWeight.bold,),
                  ),
                ],
              ),
            ),
            Text('Let\'s sign in with my country'),
            Spacer(flex: 1,),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0,20,20,30),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.stream),
                hintText: 'enter a here',
                labelText: 'Email',
                labelStyle: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                border: OutlineInputBorder(),
              ),),
          ),
            Stack(alignment: Alignment.centerRight, children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0,30,20,20),
                child: TextField(
                  controller: _passController,
                  obscureText: passhide,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline),
                    hintText: 'enter a here',
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 40),
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        passhide = !passhide;
                      });
                    },
                    child: Icon(
                      passhide
                          ? Icons.remove_red_eye_outlined
                          : Icons.visibility_off_outlined,
                      color: Colors.grey,
                    )),
              ),
            ]),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ButtonTheme(
                minWidth: double.infinity,
                height: 50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                child: FlatButton(
                  onPressed: () {
                    _onClickSignIn();
                  },
                  child: Text('SIGN IN'),
                  color: Colors.black.withOpacity(0.25),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Sign up ? '),
                  GestureDetector(
                    onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RegisterPage())),
                    child:Text('SignUp',style: TextStyle(
                      color: Colors.blueAccent
                    ),),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  void _onClickSignIn(){
    String email=_emailController.text;
    String pass =_passController.text;
    var bloc = MessengerInher.of(context)!.bloc;
    LoadingDialog.showLoadingDialog(context, 'Loading');
    bloc.signIn(email, pass, (){
      LoadingDialog.hideLoadingDialog(context);
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChatPage()));
    }, (msg) {
      LoadingDialog.hideLoadingDialog(context);
      ErrorDialog.showErrorDialog(context, 'SignIn fail', msg);
    });
  }
  BoxDecoration boxLoginTheme() {
    return BoxDecoration(
        gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0.2, 0.5, 1],
      colors: [Colors.pinkAccent, Colors.white, Colors.pinkAccent],
    ));
  }
}
