import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

class SoundsPage extends StatefulWidget {
  @override
  _SoundsPageState createState() => _SoundsPageState();
}

class _SoundsPageState extends State<SoundsPage> {
  _buildButton(int soundNumber, Color color) {
    return Flexible(
      fit: FlexFit.tight,
      flex: 1,
      child: FlatButton(
        color: color,
        onPressed: () async {
          final player = AudioCache(prefix: 'audio/');
          player.play('note$soundNumber.wav');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildButton(1, Colors.red),
            _buildButton(2, Colors.orange),
            _buildButton(3, Colors.yellow),
            _buildButton(4, Colors.lightGreen),
            _buildButton(5, Colors.green),
            _buildButton(6, Colors.lightBlueAccent),
            _buildButton(7, Colors.purple),
          ],
        ),
      ),
    );
  }
}
