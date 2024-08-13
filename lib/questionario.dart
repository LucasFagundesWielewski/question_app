import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function() responder;


  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder,
  });

  @override
  Widget build(BuildContext context) {
    List<String>? respostas = temPerguntaSelecionada 
    ? perguntas[perguntaSelecionada]['respostas'] as List<String>
    : null;
    return Column(
      children: <Widget>[
            Questao(perguntas[perguntaSelecionada]['pergunta'].toString()),
            ...respostas!.map((t) => Resposta(t, responder)),
          ],
    );
  }
}