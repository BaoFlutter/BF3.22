
import 'package:chat_bf322/resources/widgets%20/conversation/video_item.dart';
import 'package:flutter/material.dart';
import '../../../models/message.dart';
import 'image_item.dart';
import 'mess_item.dart';


class MessageItem extends StatelessWidget {
  const MessageItem({
    Key? key,
    required this.message,
    required this.isMe,
    required this.isMidle,
    required this.isLast,
  }) : super(key: key);

  final Message message;
  final bool isMe;
  final bool isMidle;
  final bool isLast;
  @override
  Widget build(BuildContext context) {
    switch (message.type) {
      case "message":
        return MessItem(
            isMe: isMe,
            isMidle: isMidle,
            isLast: isLast,
            message: message.message ?? "");
      case "image":
        return ImageItem(isMe: isMe, medias: message.medias ?? []);
      case "video":
        return VideoItem(
          message: message,
          isMe: isMe,
        );
      default:
        return Container();
    }
  }
}
