import 'package:flutter/material.dart';
import 'package:movie_app/widgets/track_pad_wrapper.dart';
// import 'package:movie_app/widgets/options.dart';
// import 'package:movie_app/widgets/input.dart';
import 'package:movie_app/widgets/button_layout.dart';
import 'package:movie_app/widgets/colors.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class PortraitView extends StatefulWidget {
  const PortraitView({Key? key});

  @override
  _PortraitViewState createState() => _PortraitViewState();
}

class _PortraitViewState extends State<PortraitView> {
  final TextEditingController _controller = TextEditingController();
  final _channel = WebSocketChannel.connect(
    Uri.parse('wss://echo.websocket.events'),
  );
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            // InputField(),
            // const OptionBar(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                  child: TextFormField(
                    controller: _controller,
                    decoration: const InputDecoration(labelText: 'command input'),
                    style: TextStyle(color: Colors.amber[900]),
                  ),
                ),
                const SizedBox(height: 24),
                StreamBuilder(
                  stream: _channel.stream,
                  builder: (context, snapshot) {
                    return Text(snapshot.hasData ? '${snapshot.data}' : '', style: TextStyle(color: Colors.green),);
                  },
                ),
                FloatingActionButton(
                  onPressed: _sendMessage,
                  tooltip: 'Send message',
                  child: const Icon(Icons.send),
                ),
              ],
            ),
            const Text(
                "Welcome",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 17.5,
                  fontWeight: FontWeight.bold,
                  color: AppColors.text,
                ),
                textAlign: TextAlign.center,
              ),
            TrackPadWrapper(),
            const ButtonLayout(),
          ],
        ),
    );
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      _channel.sink.add(_controller.text);
    }
  }

  @override
  void dispose() {
    _channel.sink.close();
    _controller.dispose();
    super.dispose();
  }
}