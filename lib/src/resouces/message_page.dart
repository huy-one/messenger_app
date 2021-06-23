import 'package:flutter/material.dart';
import 'package:messenger_app/src/components/chat_page/chat_input.dart';
import 'package:messenger_app/src/components/chat_page/messenger.dart';
import 'package:messenger_app/src/components/list_chat/chat_list.dart';
import 'package:messenger_app/src/components/list_chat/chat_messegae_list.dart';
import 'package:messenger_app/src/components/theme/constants.dart';

class MessagesPage extends StatelessWidget {
  final Chat chat;

  const MessagesPage({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            BackButton(),
            CircleAvatar(
              backgroundImage: AssetImage(chat.image),
            ),
            SizedBox(
              width: kDefaultPadding*0.75,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(chat.name,style: TextStyle(fontSize: 16),),
                Text(   "Active "+chat.time ,
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
        ]
      ),
        actions: [
          IconButton(
            icon: Icon(Icons.local_phone),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () {},
          ),
          SizedBox(width: kDefaultPadding / 2),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: ListView.builder(itemCount: demoChatMessages.length,itemBuilder: (context,index)=>Message(chat: chat,message: demoChatMessages[index]))),
          ChatInput(),
        ],
      ),

    );
  }
}
