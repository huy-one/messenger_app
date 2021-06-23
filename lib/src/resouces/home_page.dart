import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messenger_app/src/components/dialog/loading_dialog.dart';
import 'package:messenger_app/src/components/theme/constants.dart';
import 'package:messenger_app/src/resouces/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(
            flex: 2,
          ),
          Image(
            image: ExactAssetImage('assets/images/welcome_image.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Welcome to onehe\n Messenger App',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .color!
                      .withOpacity(0.9),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.data_usage_rounded,
                    size: 30,
                    color:
                        Theme.of(context).iconTheme.color!.withOpacity(0.60)),
                Text(
                  'With great power comes great responsibility.',
                  maxLines: 2,
                  style: TextStyle(
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .color!
                          .withOpacity(0.64)),
                ),
              ],
            ),
          ),
          Spacer(
            flex: 2,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: FittedBox(
              child: TextButton(
                onPressed: () {
                  LoadingDialog.showLoadingDialog(context, 'Start');
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));

                },
                child: Row(
                  children: [
                    Text('Skip',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Colors.grey)),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 16,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
