import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class VoiceScreen extends StatefulWidget {
  @override
  _VoiceScreenState createState() => _VoiceScreenState();
}

class _VoiceScreenState extends State<VoiceScreen> {
  final Map<String, HighlightedWord> _highlights = {
    'flutter': HighlightedWord(
      onTap: () => print('flutter'),
      textStyle: const TextStyle(
          color: Colors.blueAccent, fontWeight: FontWeight.bold
      ),
    ),
    'voice': HighlightedWord(
      onTap: () => print('Voice'),
      textStyle: const TextStyle(
          color: Colors.green, fontWeight: FontWeight.bold
      ),
    ),
    'subscribe': HighlightedWord(
      onTap: () => print('Subscribe'),
      textStyle: const TextStyle(
          color: Colors.green, fontWeight: FontWeight.bold
      ),
    ),
  };

  stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = 'Presiona el botón para empezar';
  double _confidence = 1.0;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Voice Screen'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: _isListening,
        glowColor: Colors.redAccent,
        endRadius: 55.0,
        duration: const Duration(milliseconds: 800),
        repeatPauseDuration: const Duration(milliseconds: 100),
        repeat: true,
        child: FloatingActionButton(
          onPressed: _listen,
          child: Icon(_isListening ? Icons.mic : Icons.mic_none),
          elevation: 5,
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: TextHighlight(
            text: _text,
            words: _highlights,
          ),
        ),
      ),
    );
  }

  void _listen() async {
    if(!_isListening){
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus $val'),
        onError: (val) => print('onStatus $val'),
      );
      if(available){
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
            if(val.hasConfidenceRating && val.confidence > 0){
              _confidence = val.confidence;
            }
          }),
        );
      }
    }else{
      setState(() => _isListening = false);
      _speech.stop();
    }
  }
}
