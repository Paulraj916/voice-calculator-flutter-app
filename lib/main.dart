import 'package:flutter/material.dart';
import 'scientificCalculator.dart';
import 'voice_calculator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scientific Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blueAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator App'),
        centerTitle: true,
      ),
      drawer: _buildDrawer(context),
      body: ScientificCalculator(),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blueAccent,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.0,
                  child: Icon(Icons.calculate, size: 40.0, color: Colors.blueAccent),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Calculator App',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.calculate),
            title: Text('Scientific Calculator'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ScientificCalculator()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.mic),
            title: Text('Voice Calculator'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SpeechCalculator()),
              );
            },
          ),
        ],
      ),
    );
  }
}





// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:avatar_glow/avatar_glow.dart';
// import 'package:highlight_text/highlight_text.dart';
// import 'package:speech_to_text/speech_to_text.dart' as stt;
// import 'package:google_generative_ai/google_generative_ai.dart';
// import 'package:math_expressions/math_expressions.dart';
// import 'dart:math';
// import 'package:calc/calc.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Scientific Calculator',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.red,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: SpeechScreen(),
//     );
//   }
// }

// class SpeechScreen extends StatefulWidget {
//   @override
//   _SpeechScreenState createState() => _SpeechScreenState();
// }

// class _SpeechScreenState extends State<SpeechScreen> {
//   final Map<String, HighlightedWord> _highlights = {
//     'flutter': HighlightedWord(
//       onTap: () => print('flutter'),
//       textStyle: const TextStyle(
//         color: Colors.blue,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//     'voice': HighlightedWord(
//       onTap: () => print('voice'),
//       textStyle: const TextStyle(
//         color: Colors.green,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//     'subscribe': HighlightedWord(
//       onTap: () => print('subscribe'),
//       textStyle: const TextStyle(
//         color: Colors.red,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//     'like': HighlightedWord(
//       onTap: () => print('like'),
//       textStyle: const TextStyle(
//         color: Colors.blueAccent,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//     'comment': HighlightedWord(
//       onTap: () => print('comment'),
//       textStyle: const TextStyle(
//         color: Colors.green,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//   };

//   late stt.SpeechToText _speech;
//   bool _isListening = false;
//   String _text = '';
//   double _confidence = 1.0;
//   String _mainText = 'Press the button and start speaking';
//   String _result = '';
//   int count = 0;
//   String _demo = '';

//   @override
//   void initState() {
//     super.initState();
//     _speech = stt.SpeechToText();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Confidence: ${(_confidence * 100.0).toStringAsFixed(1)}%'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.more_vert),
//             onPressed: _resetTexts,
//           ),
//         ],
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           AvatarGlow(
//             animate: _isListening,
//             glowColor: Theme.of(context).primaryColor,
//             glowRadiusFactor: 75.0,
//             duration: const Duration(milliseconds: 2000),
//             repeat: true,
//             child: FloatingActionButton(
//               onPressed: _listen,
//               child: Icon(_isListening ? Icons.mic : Icons.mic_none),
//             ),
//           ),
//           SizedBox(width: 20),
//           FloatingActionButton(
//             onPressed: _sendToGemini,
//             child: Icon(Icons.send),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         reverse: true,
//         child: Container(
//           padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 150.0),
//           child: Column(
//             children: [
//               TextHighlight(
//                 text: _mainText,
//                 words: _highlights,
//                 textStyle: const TextStyle(
//                   fontSize: 32.0,
//                   color: Colors.black,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//               SizedBox(height: 20),
//               TextHighlight(
//                 text: _text,
//                 words: _highlights,
//                 textStyle: const TextStyle(
//                   fontSize: 32.0,
//                   color: Colors.black,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//               SizedBox(height: 20),
//               Text(
//                 _result,
//                 style: TextStyle(
//                   fontSize: 24,
//                   color: Colors.blue,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void _resetTexts() {
//     setState(() {
//       _mainText = '';
//       _text = ' ';
//     });
//   }

//   void _listen() async {
//     if (!_isListening) {
//       bool available = await _speech.initialize(
//         onStatus: (val) => _onStatus(val),
//         onError: (val) => print('onError : $val'),
//       );

//       if (available && count == 0) {
//         _resetTexts();
//       }

//       if (available) {
//         _demo = "";
//         setState(() => _isListening = true);
//         _speech.listen(
//           onResult: (val) => setState(() {
//             _demo = val.recognizedWords;
//             _text = _demo;

//             if (val.hasConfidenceRating && val.confidence > 0) {
//               _confidence = val.confidence;
//             }
//           }),
//         );
//         if (count == 0) {
//           _resetTexts();
//         }
//         _mainText += ' ' + _demo;
//         _text = ' ';
//         count = 1;
//       }
//     } else {
//       setState(() {
//         _isListening = false;
//       });
//       _speech.stop();
//     }
//   }

//   void _onStatus(String val) {
//     if (val == 'done' && _isListening) {
//       _demo = "";
//       _speech.listen(
//         onResult: (val) => setState(() {
//           _demo = val.recognizedWords;
//           _text = _demo;
//           if (val.hasConfidenceRating && val.confidence > 0) {
//             _confidence = val.confidence;
//           }
//         }),
//       );
//       _mainText += ' ' + _text;
//       _text = ' ';
//     }
//   }

//   void _sendToGemini() async {
//     count = 0;
//     final apiKey = 'AIzaSyD-I2J5VAo9pEHVXdra1_6bm80pVQ9FoOo';
//     final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: apiKey);

//     final content = [
//       Content.text(
//         'Convert the following spoken sentence into a parsable mathematical expression like in programming: $_mainText. '
//         'Ensure the expression adheres to correct precedence, associativity, and data types. The expression should be in '
//         'a format that can be evaluated correctly by a mathematical parser in Dart. Only provide the final expression. '
//         'Here are some examples to guide you:'
//       ),
//       Content.text('log (base 10 logarithm): log(100, 10)'),
//       Content.text('ln (natural logarithm): ln(20)'),
//       Content.text('asin (inverse sine): asin(1)'),
//       Content.text('acos (inverse cosine): acos(1)'),
//       Content.text('atan (inverse tangent): atan(1)'),
//       Content.text('sin (sine): sin(pi / 2)'),
//       Content.text('cos (cosine): cos(pi)'),
//       Content.text('tan (tangent): tan(pi / 4)'),
//       Content.text('ln2 (natural logarithm of 2): ln(2)'),
//       Content.text('square root: sqrt(25)'),
//       Content.text('pi (constant): pi'),
//       Content.text('3 power 2 : 3^2 (must use this ^ only)'),
//       Content.text('e (constant): e'),
//       Content.text('addition: 5 + 7'),
//       Content.text('factorial of 5: 5!'),
//       Content.text('subtraction: 10 - 3'),
//       Content.text('multiplication: 4 * 2'),
//       Content.text('division: 9 / 3'),
//       Content.text('modulus: 10 % 3'),
//       Content.text('sin 30 divided by cos 30 : sin(30)/cos(30)'),
//     ];

//     try {
//       final response = await model.generateContent(content);
//       final expression = response.text ?? '';

//       setState(() {
//         _result = 'Expression: $expression';
//       });

//       if (expression.isNotEmpty) {
//         _evaluateExpression(expression);
//       } else {
//         setState(() {
//           _result += '\nError: Unable to parse expression';
//         });
//       }
//     } catch (e) {
//       setState(() {
//         _result += '\nError: ${e.toString()}';
//       });
//     }
//   }

//   void _evaluateExpression(String expression) {
//     try {
//       final parser = Parser();
//       final exp = parser.parse(expression);
//       final contextModel = ContextModel();
//       final result = exp.evaluate(EvaluationType.REAL, contextModel);
//       setState(() {
//         _result += '\nResult: $result';
//       });
//     } catch (e) {
//       setState(() {
//         _result += '\nError: ${e.toString()}';
//       });
//     }
//   }
// }
