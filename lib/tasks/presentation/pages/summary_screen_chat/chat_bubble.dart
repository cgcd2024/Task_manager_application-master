import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';

class ChatBubbles extends StatelessWidget {
  const ChatBubbles(this.message, this.isMe, this.userName, {Key? key})
      : super(key: key);

  final String message;
  final String userName;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (isMe)
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
              child: ChatBubble(
                clipper: ChatBubbleClipper6(type: BubbleType.sendBubble),
                alignment: Alignment.topRight,
                margin: const EdgeInsets.only(top: 20),
                backGroundColor: Colors.blue,
                child: Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.7,
                    ),
                    child: Column(
                      crossAxisAlignment: isMe
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "학생",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          message,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    )),
              )),
        if (!isMe)
          Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
              child: ChatBubble(
                clipper: ChatBubbleClipper6(type: BubbleType.receiverBubble),
                backGroundColor: const Color(0xffE7E7ED),
                margin: const EdgeInsets.only(top: 20),
                child: Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.7,
                    ),
                    child: Column(
                      crossAxisAlignment: isMe
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "클래스도우미",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        message == "Blorfendip"
                            ? const Padding(
                                padding:  EdgeInsets.fromLTRB(
                                    15.0, 10.0, 10.0, 10.0),
                                child: CircularProgressIndicator())
                            : Text(
                                message,
                                style: const TextStyle(color: Colors.black),
                              ),
                      ],
                    )),
              )),
      ],
    );
  }
}
