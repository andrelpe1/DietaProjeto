import 'package:flutter/material.dart';
import 'package:mydiet/app/model/alimento.dart';
import 'package:mydiet/app/repositories/alimento_repository.dart';
import 'package:mydiet/app/widgets/form_field_wiget.dart';

class AdicionarRefeicao extends StatefulWidget {
  const AdicionarRefeicao({super.key});

  @override
  State<AdicionarRefeicao> createState() => _AdicionarRefeicaoState();
}

class _AdicionarRefeicaoState extends State<AdicionarRefeicao> {
  final tabela = AlimentoRepository.tabela;
  String? valorSelecionado;
  final _formRef = GlobalKey<FormState>();
  List<Alimento> selecionados = [];
  final _nomeRefeicao = TextEditingController();

  void criarRefeicao(){
  if (_formRef.currentState!.validate() && selecionados.isNotEmpty) {
      // Salvar o alimento
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Refeicao criada com sucesso!')),
      );
    }else{
      if (selecionados.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Selecione pelo menos um alimento",style: TextStyle(color: Colors.red),), )
        ,
      );
      }
    }
}
  @override
  void dispose() {
    _nomeRefeicao.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar Refeicao'),
      ),
      body: Column(
        children: [
          Form(
            key: _formRef,
            child: Padding(
              padding: const EdgeInsets.all(21),
              child: Column(
                children: [
                  CampoTexto(
                      controller: _nomeRefeicao, 
                      label: "Digite o nome da refeição",
                      apenasNumeros: false,
                      erroVazio: "Digite um nome para a refeição!",
                    ),
                    SizedBox(height: 15,),
                  DropdownButtonFormField(
                  initialValue: valorSelecionado,
                  hint: Text("Selecione o período da refeição"),
                  items: [
                    DropdownMenuItem(value: "1", child: Text("Café da Manhã"),),
                    DropdownMenuItem(value: "2", child: Text("Almoço"),),
                    DropdownMenuItem(value: "3", child: Text("Lanche da Tarde"),),
                    DropdownMenuItem(value: "4", child: Text("Janta"),),
                  ],
                   onChanged: (value) {
                      setState(() {
                                  valorSelecionado = value;
                                  });
                    },
                    validator: (value) {
                          if (value == null) {
                            return "Selecione um período";
                          }
                          return null;
                        },
                  ),
                  
                ],
              ),
            ),
            ),

          Expanded(
            child: ListView.separated(
              itemBuilder: (BuildContext content, int alimento){
                return ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                  leading: selecionados.contains(tabela[alimento])
                  ? CircleAvatar(
                    child: Icon((Icons.check)),
                    ):
                    Icon(Icons.square_outlined),
                  title: Text(tabela[alimento].nome, style: TextStyle(fontSize: 25),),
                  subtitle: Text(
                      "Gordura: ${tabela[alimento].gordura}g\n"
                      "Caloria: ${tabela[alimento].caloria}g\n"
                      "Carboidratos: ${tabela[alimento].carboidratos}g\n"
                      "Proteína: ${tabela[alimento].proteina}g",
                  ),
                  selected: selecionados.contains(tabela[alimento]),
                  selectedTileColor: Colors.greenAccent,
                  onLongPress: (){
                    setState(() {
                      (selecionados.contains(tabela[alimento]))
                          ? selecionados.remove(tabela[alimento])
                          : selecionados.add(tabela[alimento]);
                    });
                  },
                );
              },
              padding: EdgeInsets.all(16),
              separatorBuilder: (_, _) => Divider(), 
              itemCount: tabela.length),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        
        onPressed: criarRefeicao,
        child: Icon(Icons.add),
        ),
         floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}