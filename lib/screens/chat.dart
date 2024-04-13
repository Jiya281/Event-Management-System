// ignore_for_file: prefer_final_fields, prefer_const_constructors, unused_field
import 'dart:async';
import 'package:event_city/screens/events_page.dart';
import 'package:event_city/screens/pdf_genrate.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController _textEditingController = TextEditingController();
  List<ChatMessage> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(240, 99, 90, 0.999),
        title: Text(
          'Chat with Us!',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 28.0,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                reverse: true,
                itemBuilder: (context, index) {
                  return _messages[index];
                },
              ),
            ),
            Divider(height: 1.0),
            Container(
              decoration: BoxDecoration(color: Theme.of(context).cardColor),
              child: _buildTextComposer(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).colorScheme.secondary),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.camera_alt),
              onPressed: () => _sendImage(ImageSource.camera),
            ),
            IconButton(
              icon: Icon(Icons.image),
              onPressed: () => _sendImage(ImageSource.gallery),
            ),
            Expanded(
              child: TextField(
                controller: _textEditingController,
                onChanged: (text) {
                  setState(() {}); // Enable/disable send button
                },
                onSubmitted: _handleSubmitted,
                decoration:
                    InputDecoration.collapsed(hintText: 'Send a message'),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: _textEditingController.text.isEmpty
                  ? null
                  : () => _handleSubmitted(_textEditingController.text),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _sendImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      // You can send the picked image file here
      // For simplicity, I'm just adding a message with the image path
      List<int> imageBytes = await pickedFile.readAsBytes();
      ChatMessage message = ChatMessage(
        imageBytes: Uint8List.fromList(imageBytes),
        isMe: true,
        text: '',
      );
      setState(() {
        _messages.insert(0, message);
      });
      Timer(Duration(seconds: 5), () {
        _showSuccessMessage();
      });
    }
  }
  // Simulate response after 5 seconds

  void _handleSubmitted(String text) {
    _textEditingController.clear();
    ChatMessage message = ChatMessage(
      text: text,
      isMe: true,
      imageBytes: Uint8List(0),
    );
    setState(() {
      _messages.insert(0, message);
    });
    Timer(Duration(seconds: 5), () {
      _showSuccessMessage();
    });
  }

  void _showSuccessMessage() {
    ChatMessage message = ChatMessage(
      text:
          'You have successfully completed an event. Download your e-certificate.',
      isMe: false,
      imageBytes: Uint8List(0),
    );
    setState(() {
      _messages.insert(0, message);
    });
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isMe;
  final Uint8List imageBytes;

  ChatMessage(
      {required this.text, required this.isMe, required this.imageBytes});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment:
                  isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  decoration: BoxDecoration(
                    color: isMe
                        ? Color.fromRGBO(240, 99, 90, 0.999)
                        : Colors.grey[300],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    text,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                if (imageBytes.isNotEmpty)
                  Image.memory(
                    Uint8List.fromList(imageBytes!),
                    width: 200,
                    height: 200,
                  ),
                if (!isMe) // Show download button only if not sent by user
                  ElevatedButton(
                    onPressed: () {
                      // Handle the download action here
                      // For simplicity, I'm just printing a message
                      print('Downloading certificate...');
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: ((context) => CertificateScreen(
                                onCertificateGenerated: () {},
                              ))));
                    },
                    child: Text('Download'),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
