import 'package:flutter/material.dart';
import 'questao.dart';
import 'resposta.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> perguntas = [
      {
        'pergunta': 'Qual é a sua cor favorita?',
        'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco'],
      },
      {
        'pergunta': 'Qual é o seu animal favorito?',
        'respostas': ['Coelho', 'Cobra', 'Elefante', 'Leão'],
      },
      {
        'pergunta': 'Qual é o seu instrutor favorito?',
        'respostas': ['Bruno', 'Mauro', 'Rafa', 'Juliano'],
      },
    ];

    List<String> respostas = (perguntas[_perguntaSelecionada]['respostas'] as List<String>);

    //if (respostas != null) {
    //  for (String textoResp in respostas as List<String>) {
    //    widgets.add(Resposta(textoResp, _responder));
    //  }
    //}

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: Column(
          children: <Widget>[
            Questao(perguntas[_perguntaSelecionada]['pergunta'].toString()),
            ...respostas.map((t) => Resposta(t, _responder)).toList(),
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget{
  
    _PerguntaAppState createState(){
      return _PerguntaAppState();
    }
}