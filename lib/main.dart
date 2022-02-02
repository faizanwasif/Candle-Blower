import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MaterialApp(home: CandleBlower()));
}

class CandleBlower extends StatefulWidget {
  @override
  State<CandleBlower> createState() => _CandleBlowerState();
}

class _CandleBlowerState extends State<CandleBlower> {
  bool _fanon = false;

  AudioCache cache = AudioCache();
  AudioPlayer player = AudioPlayer();
  AudioPlayer player1 = AudioPlayer();

  _playr() async {
    player1 = await cache.loop('gen2.mp3');
    player.setVolume(1.0);
    Future.delayed(const Duration(seconds: 2), () async {
      player = await cache.loop('note1.wav');
      player.setVolume(0.08);
    });
  }

  _stopr() {
    player.stop();
    player1.stop();
  }

  @override
  Widget build(BuildContext context) {
    _fanon ? _playr() : _stopr();

    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text("Candle Blower"),
        elevation: 0.0,
      ),
      body: Center(
        child: ElevatedButton(
          child: Text(
            _fanon ? "ON" : "OFF",
            style: const TextStyle(fontSize: 24),
          ),
          onPressed: () {
            // _stop();
            // _play();
            setState(() {
              _fanon = !_fanon;
            });
          },
          style: ElevatedButton.styleFrom(
            primary: _fanon
                ? const Color.fromARGB(255, 253, 2, 2)
                : const Color.fromARGB(255, 99, 0, 0),
            fixedSize: const Size(200, 200),
            shape: const CircleBorder(),
          ),
        ),
      ),
    );
  }
}
