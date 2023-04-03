import 'package:flutter/material.dart';

class Contcaracter extends StatefulWidget {
  @override
  CaracterState createState() => CaracterState();
}

class CaracterState extends State<Contcaracter> {
   
int resultado = 0;

  final text = TextEditingController();
  final caracter = TextEditingController();

  contar(){
    List var1 = text.text.split("");
    String var2 = caracter.text;
    int c = 0;

    for (var i in var1) {
      if (i == var2) {
        c++;
      }
      
    }
    setState(() {
      resultado = c;
    });
  }



  
@override
 Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(title: const Text("Contar caractere")),
      body: Column(children: [
         TextField(
          decoration: InputDecoration(labelText: "Digite a frase "), controller: text
        ),
         TextField(
          decoration: InputDecoration(labelText: "Escolha o caractere a ser contado"), controller: caracter, maxLength: 1,
        ),
          ElevatedButton(onPressed: contar, child: Text("Contar")),
          Text("Esse caracter apareceu $resultado vzs")
      ])
   );

}
}
