import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';

class InputField extends StatefulWidget {
  InputField({Key? key}) : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  final channel = IOWebSocketChannel.connect('ws://10.130.3.228:55444');

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
        // TextFormField(
        //   controller: _controller,
        //   style: const TextStyle(color: Colors.white),
        //   decoration: const InputDecoration(
        //     hintText: 'Enter your email',
        //     fillColor: Colors.white,
        //   ),
        //   validator: (String? value) {
        //     if (value == null || value.isEmpty) {
        //       return 'Please enter some text';
        //     }
        //     return null;
        //   },
        // ),
        // const SizedBox(height: 24),
        // StreamBuilder(
        //   stream: channel.stream,
        //   builder: (context, snapshot) {
        //     return Text(snapshot.hasData ? '${snapshot.data}' : '', style: const TextStyle(color: Colors.white));
        //   },
        // ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 16.0),
        //   child: ElevatedButton(
        //     onPressed: _sendMessage,
        //     child: const Text('Submit', style: TextStyle(color: Colors.white)),
        //   ),
        // ),
      ],
    );
  }
}
