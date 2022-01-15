
import 'package:flutter/material.dart';
import 'package:useditem/Views/Widgets/chatWidget.dart';

class ChatsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chats"),
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
            itemBuilder: (context,index){
             return  Chatwidget();
            },
            separatorBuilder:(context,index){
              return   Divider();
            },
            itemCount: 10),
      )
    );
  }
}
