import 'package:flutter/material.dart';
import 'package:http/http.dart' as http2;
class Home1 extends StatefulWidget {
  Home1({Key? key}) : super(key: key);

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {

 void _criarApi() async {

  final urlApi = Uri.https(
    'economia.awesomeapi.com.br', 
    '/last/USD-BRL,EUR-BRL,BTC-BRL');

    final Response = await http2.get(urlApi);

    print("Resposta: "+Response.statusCode.toString());
    print("Resposta: "+Response.body);

 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crianção de Requisições"),
        backgroundColor: Colors.blueGrey,
      ),
      body:Container(
        padding: EdgeInsets.all(30),
        child: Column(
        children: [
        TextButton(
          onPressed:() => _criarApi(), 
          child: Text("Click aqui", style: TextStyle(
                 color: Color.fromARGB(255, 250, 249, 249)
          ),),
          style: TextButton.styleFrom(backgroundColor: Color.fromARGB(255, 27, 23, 56)),
          )
      ]),
      )
    );
  }
}
//ttps://economia.awesomeapi.com.br/last/USD-BRL,EUR-BRL,BTC-BRL
//curl https://economia.awesomeapi.com.br/json/last/USD-BRL,EUR-BRL