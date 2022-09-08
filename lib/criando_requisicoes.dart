import 'package:flutter/material.dart';
import 'package:http/http.dart' as hppt1;
import 'dart:convert';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _nameState();
}

class _nameState extends State<Home> {

  TextEditingController _editingCep = TextEditingController();
  String _resultado = " ";


  void CriacaoCep() async {
     
    final urlCep = Uri.https(
    'viacep.com.br', 
    '/ws/${_editingCep.text}/json/');

    final response = await hppt1.get(urlCep);
    
    //print('Resposta: '+ response.statusCode.toString());
    //print('Resposta: '+ response.body);

    Map<String, dynamic> retorno = json.decode(response.body);
    String logradouro = retorno["logradouro"];
    String complemento = retorno["complemento"];
    String bairro = retorno["bairro"];
    String localidade = retorno["localidade"];
    //print("Resposta: \nLogradouro: ${logradouro} \nComplemento: ${complemento} \nBairro: ${bairro} \nLocalidade: ${localidade}");
    
    setState(() {
       _resultado = "Logradouro:  ${logradouro} \n\nComplemento:  ${complemento} \n\nBairro: ${bairro} \n\nLocalidade: ${localidade}";
    });
    
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Criando Requisições"),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(40),
          child: Column(
          children: [
            Padding(padding: EdgeInsets.only(bottom: 20), child: Text(_resultado)),
            Padding(padding: EdgeInsets.only(top:50), 
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration( label:Text("Digite o seu CEP") ),
              controller: _editingCep,

            ),),
            Padding(padding:EdgeInsets.only(top: 20), 
            child: TextButton(
              onPressed: () => CriacaoCep(), 
              child: Text("Clic aqui", 
              style: TextStyle( color: Colors.black),),
              style: TextButton.styleFrom(backgroundColor: Colors.blue),
              )),
          ],
        ),

        )
        
        

      ),
    );
  }
}