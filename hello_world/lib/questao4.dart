import 'package:flutter/material.dart';

class Fruteira extends StatefulWidget {  
  @override
  FrutaState createState() => FrutaState();
  
}

class FrutaState extends State<Fruteira> {
  double preco = 0;
  double descont = 0;

  // final morango = TextEditingController();
  // final maca = TextEditingController();
    int kgmoran = 0;
    int kgmaca = 0;

  calculaPreco(){
    double precomaca = 0;
    double precomorango = 0;

    if (kgmoran <= 5 )  {
      precomorango = 2.50 * kgmoran ;
      
    } else {
      precomorango = 2.20 * kgmoran;
    }
    
    if (kgmaca <= 5) {
      precomaca = 1.80 * kgmaca;
    } else {
      precomaca = 1.50 * kgmaca;
    }

    double precodescont = 0;
    if ((precomaca + precomorango) > 25 || (kgmaca + kgmoran) > 8 ) {
      precodescont = (precomaca + precomorango) * 0.9;
      
    } else {
      precodescont = (precomaca + precomorango);
    }

    setState(() {
      preco = precomaca + precomorango;
      descont = precodescont;
    });
  }


  @override
 Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(title: const Text("Frutas")),
      body: Column(children: [
         TextField(
          decoration: InputDecoration(labelText: "Kg - Morango "), onChanged: (value){setState(() {
            kgmoran = int.parse(value);
          });},
        ),
         TextField(
          decoration: InputDecoration(labelText: "Kg - Maçã"), onChanged: (value){setState(() {
            kgmoran = int.parse(value);
          });},
        ),
         ElevatedButton(onPressed: calculaPreco, child: Text("Preço")),
        Text("Preço: $preco reais"),
        Text("Preço com desconto : $descont reais"),

      ])
      );

      
 }
}

 