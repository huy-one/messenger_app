import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messenger_app/src/components/chat_page/chat_card.dart';
import 'package:messenger_app/src/components/filled_outline_button.dart';
import 'package:messenger_app/src/components/list_chat/chat_list.dart';
import 'package:messenger_app/src/components/theme/constants.dart';
import 'package:messenger_app/src/firebase/auth_firebase.dart';
import 'package:messenger_app/src/resouces/message_page.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 50,
        title: Text('Messenger',
        style: Theme.of(context).textTheme.headline5!.copyWith(fontWeight: FontWeight.bold),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search)),
        ],
      ),
      body: getBody(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).iconTheme.color,
        child: Icon(Icons.person_add_alt_1_rounded),
        onPressed: (){},
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.chat_outlined),label: 'chats'),
          BottomNavigationBarItem(icon: Icon(Icons.people_alt),label: 'friends'),
          BottomNavigationBarItem(icon: Icon(Icons.call),label: 'call'),
        ],
      ),
    );
  }

  Column getBody() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
          color:  xPrimaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FillOutLineButton(press: (){}, text: 'Recent Message'),
              FillOutLineButton(press: (){}, text: 'Active',isFilled: false),
              FillOutLineButton(press: (){}, text: 'Waiting',isFilled: false)
            ],
          ),
        ),
        Expanded(child: ListView.builder(itemCount: chatsData.length,
        itemBuilder: (context,index)=>ChatCard(chat: chatsData[index], press: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MessagesPage(chat: chatsData[index],)));
        })))
      ],
    );
  }
}
