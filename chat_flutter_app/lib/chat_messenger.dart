import 'dart:ui';

import 'package:flutter/material.dart';
class ChatMessage extends StatelessWidget {
  ChatMessage(this.data, this.mine);
  final bool mine;
  final Map<String, dynamic>data;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        children: <Widget>[
          !mine ?
          Padding(
            padding: const EdgeInsets.only(right: 17),
            child: CircleAvatar(
              backgroundImage: NetworkImage(data['senderPhotoUrl'],),
            ),
          ) : Container(),
          Expanded(
            child: Column(
              crossAxisAlignment: mine
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: <Widget>[
                data['imgUrl'] != null ?
                Image.network(data['imgUrl'], width: 250,)
                    :
                Text(data['text'],
                  textAlign: mine ? TextAlign.end : TextAlign.start,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.green[900],
                  ),
                ),
                Text(
                  data['senderName'],
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.green[600],

                  ),
                )
              ],
            ),
          ),
          mine ?
          Padding(
            padding: const EdgeInsets.only(left: 17),
            child: CircleAvatar(
              backgroundImage: NetworkImage(data['senderPhotoUrl'],),
            ),
          ) : Container(),
        ],
      ),


    );
  }
}
