import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:mydiet/app/model/refeicao.dart';

class RefeicaoRepository extends ChangeNotifier {
  final List<Refeicao> _listaRefeicoes = [];

   UnmodifiableListView<Refeicao> get listaRefeicoes =>
      UnmodifiableListView(_listaRefeicoes);


    void saveAlimento(Refeicao refeicao){
    _listaRefeicoes.add(refeicao);
    notifyListeners();
  }

  void remove(Refeicao refeicao){
    _listaRefeicoes.remove(refeicao);
    notifyListeners();
  }

  void saveAll(List<Refeicao> refeicoes) {
    for (var refeicao in refeicoes) {
      if (!_listaRefeicoes.contains(refeicao)) _listaRefeicoes.add(refeicao);
    }
    notifyListeners();
  }
} 