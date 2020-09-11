
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class TextComposer extends StatefulWidget {
  TextComposer(this.sendMessage);
  final Function({String text, File imgFile}) sendMessage;
  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {
  final TextEditingController _controller = TextEditingController();
  bool _isComposing = false;
  void _reset(){
    _controller.clear();
    setState(() {
      _isComposing = false;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green[50],
        border: Border.all(
          color: Colors.green[900],
          width: 3,

        ),
        borderRadius: BorderRadius.circular(10),
      ),


      margin: const EdgeInsets.symmetric(horizontal: 1.0),
      child: Row(
        children: <Widget>[
          IconButton(icon:  Icon(Icons.photo_camera),
              onPressed: ()async {
               final File imgFile = await ImagePicker.pickImage(source: ImageSource.camera);
                if (imgFile == null)return;
                widget.sendMessage(imgFile: imgFile);
              },
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration.collapsed(hintText: 'Enviar Mensagem',),

              onChanged: (text){
                setState(() {
                  _isComposing = text.isNotEmpty;
                });
              },
              onSubmitted: (text){
                widget.sendMessage(text: text);
                _reset();
              },
            ),
          ),
          IconButton(
              icon: Icon(Icons.send),
              onPressed: _isComposing ? (){
                widget.sendMessage(text: _controller.text);
                _reset();
              } : null,
          ),
        ],
      ),
    );
  }
}
