import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

class InputField extends StatefulWidget {
  const InputField({Key? key}) : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  // final channel = IOWebSocketChannel.connect('ws://10.130.3.228:55444');
  final channel = IOWebSocketChannel.connect('wss://socketsbay.com/wss/v2/1/demo/');

  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  void _sendMessage(String message) {
    if (message.isNotEmpty) {
      channel.sink.add(message);
      _controller.clear();
      print("sent: " + message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        StreamBuilder(
            stream: channel.stream,
            builder: (context, snapshot) {
              return Text(snapshot.hasData ? '${snapshot.data}' : '', style: const TextStyle(color: Colors.green));
            },
          ),
          TextField(
            controller: _controller,
            decoration: const InputDecoration(labelText: 'Send a message'),
            onSubmitted: _sendMessage,
          ),
      ],
    );
  }
}
