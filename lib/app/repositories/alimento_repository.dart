import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:mydiet/app/model/alimento.dart';

class AlimentoRepository extends ChangeNotifier {
  final List<Alimento> _listaAlimentos = [];

  UnmodifiableListView<Alimento> get listaAlimentos =>
      UnmodifiableListView(_listaAlimentos);

  void saveAll(List<Alimento> alimentos) {
    for (var alimento in alimentos) {
      if (!_listaAlimentos.contains(alimento)) _listaAlimentos.add(alimento);
    }
    notifyListeners();
  }

  AlimentoRepository(){
    _listaAlimentos.addAll(
      [
      Alimento(nome: "Arroz", caloria: "7", unidadeMedida: "Colher de sopa", valorCota: "23"),
      Alimento(nome: "Feijão", caloria: "4", unidadeMedida: "gramas", valorCota: "1"),
      Alimento(nome: "Bife", caloria: "10", unidadeMedida: "gramas", valorCota: "9"),
      Alimento(nome: "Pão", caloria: "78", unidadeMedida: "fatia", valorCota: "11"),
      Alimento(nome: "Sopa", caloria: "13", unidadeMedida: "gramas", valorCota: "93"),
      Alimento(nome: "Biscoito", caloria: "32", unidadeMedida: "gramas", valorCota: "79"),
      ]
    );
    notifyListeners();
  }

  void saveAlimento(Alimento alimento) {
    _listaAlimentos.add(alimento);
    notifyListeners();
  }

  void remove(Alimento alimento) {
    _listaAlimentos.remove(alimento);
    notifyListeners();
  }
}
