import 'package:flutter/material.dart';
import 'package:movie_app/widgets/track_pad_wrapper.dart';
// import 'package:movie_app/widgets/options.dart';
// import 'package:movie_app/widgets/input.dart';
import 'package:movie_app/widgets/button_layout.dart';
import 'package:movie_app/widgets/colors.dart';
import 'package:web_socket_channel/io.dart';

class PortraitView extends StatefulWidget {
  const PortraitView({Key? key});

  @override
  _PortraitViewState createState() => _PortraitViewState();
}

class _PortraitViewState extends State<PortraitView> {
  final channel = IOWebSocketChannel.connect('ws://10.130.3.228:55444');
  // final channel = IOWebSocketChannel.connect('ws://10.130.3.228:55444');

  TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  void _sendMessage(String message) {
    if (message.isNotEmpty) {
      channel.sink.add(message);
      _controller.clear();
    }
  }
  
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                StreamBuilder(
                    stream: channel.stream,
                    builder: (context, snapshot) {
                      return Text(snapshot.hasData ? '${snapshot.data}' : '');
                    },
                  ),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    controller: _controller,
                    decoration: const InputDecoration(labelText: 'Send a message'),
                    onSubmitted: _sendMessage,
                  ),
              ],
            ),
            // InputField(),
            // const OptionBar(),
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
}