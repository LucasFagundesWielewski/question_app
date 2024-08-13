import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';

void main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  final _perguntas = const [
    {
      'pergunta': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto':'Preto', 'nota': 10},
        {'texto':'Azul', 'nota': 5},
        {'texto':'Amarelo', 'nota': 3},
        {'texto':'Vermelho', 'nota': 1},
      ],
    },
    {
      'pergunta': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto':'Coelho','nota': 10},
        {'texto':'Cobra','nota': 5},
        {'texto':'Elefante','nota': 3},
        {'texto':'Leão','nota': 1},
      ],
    },
    {
      'pergunta': 'Qual é o seu instrutor favorito?',
      'respostas': [
        {'texto':'Bruno','nota': 10}, 
        {'texto':'Mauro','nota': 5}, 
        {'texto':'Rafa','nota': 3}, 
        {'texto':'Juliano','nota': 1}, 
      ],
    },
  ];

  // Definindo o getter temPerguntaSelecionada
  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder,
              )
            : Resultado(),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
