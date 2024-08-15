import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';

void main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'pergunta': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto':'Preto', 'pontuacao': 10},
        {'texto':'Azul', 'pontuacao': 5},
        {'texto':'Amarelo', 'pontuacao': 3},
        {'texto':'Vermelho', 'pontuacao': 1},
      ],
    },
    {
      'pergunta': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto':'Coelho','pontuacao': 10},
        {'texto':'Cobra','pontuacao': 5},
        {'texto':'Elefante','pontuacao': 3},
        {'texto':'Leão','pontuacao': 1},
      ],
    },
    {
      'pergunta': 'Qual é o seu instrutor favorito?',
      'respostas': [
        {'texto':'Bruno','pontuacao': 10}, 
        {'texto':'Mauro','pontuacao': 5}, 
        {'texto':'Rafa','pontuacao': 3}, 
        {'texto':'Juliano','pontuacao': 1}, 
      ],
    },
  ];

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
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
            : Resultado(_pontuacaoTotal, reiniciarQuestionario: _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
