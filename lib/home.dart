
import 'package:flutter/material.dart';
import 'package:imc/imc.dart';
import 'package:imc/resultado.dart';

class HomeIMC extends StatefulWidget {
  @override
  _HomeIMC createState() => _HomeIMC();
}

class _HomeIMC extends State<HomeIMC> {

  TextEditingController _alturaController = TextEditingController();
  TextEditingController _pesoController = TextEditingController();

  void _limparCampos(){
    _alturaController.text = "";
    _pesoController.text = "";
  }

  void _calularIMC(){
    //Obtem os valores de altura e peso a partir dos controllers
    //dos campos de texto:
    double alt = double.parse(_alturaController.text);
    double pes = double.parse(_pesoController.text);

    var myImc = ICM(altura: alt, peso: pes);

    //Realiza a nevegação para a próxima tela (resultado)
    //instanciando o widget IMCResultado e passando os parâmetros
    //necessários:
    setState(() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => IMCResultado(
                    imc: myImc,
                  )));
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Calculadora de IMC'),
        actions: [
          IconButton(icon: Icon(Icons.refresh), onPressed: _limparCampos,)
        ],
      ),

      // seja rolado e impede que os demais componentes sejam cortados.
     body: SingleChildScrollView(
        child: Center(
          child:Column(
            children: [
              //Logotipo
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Icon(
                    Icons.calculate_outlined,
                    color: Colors.black,
                    size: 80.0,
                )),
                //Campo Altura
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: _alturaController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Altura',
                    hintText: 'Digite no formato XX.XX'),
                  ),
                ),
                //Campo para Peso
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: _pesoController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText:'Peso',
                    hintText:'Digite no formato XX.XX' ),
                  ),
                ),
                
                ElevatedButton(
                  onPressed: _calularIMC,
                  child: Text('Calcular IMC'),
                )
              ],
            ) ,
          ),
      ));
  }
}