import 'package:new_chat/shared/widgets/MessageBuble/message_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  final user;
  const Messages({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy('createdAt', descending: true)
          .snapshots(),
      builder: (ctx, AsyncSnapshot<QuerySnapshot> chatSnapshot) {
        if (chatSnapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (chatSnapshot.hasError) {
          return Center(child: Text('Tivemos um problema'));
        }

        final chatDocs = chatSnapshot.data!.docs;
        return ListView.builder(
          reverse: true,
          itemCount: chatDocs.length,
          itemBuilder: (ctx, i) => MessageBubble(
            message: chatDocs[i].get('message'),
            userName: chatDocs[i].get('userName'),
            userImage: chatDocs[i].get('userPerfilImageUrl'),
            imageUrl: chatDocs[i].get('imageUrl'),
            belongsToMe: chatDocs[i].get('userId') == user.uid!,
            keyBubble: ValueKey(chatDocs[i].id),
          ),
        );
      },
    );
  }
}
