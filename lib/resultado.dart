import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imc/imc.dart';

class IMCResultado extends StatefulWidget {
  final ICM imc;
  IMCResultado({required this.imc});

  @override
  _IMCResultadoState createState() => _IMCResultadoState(icm: this.imc);
}

class _IMCResultadoState extends State<IMCResultado> {
  final ICM _imc;
  late Color _corFaixa;

  _IMCResultadoState({required ICM icm}) : _imc = icm {
    switch (_imc.faixa) {
      case FaixaICM.Magreza:
        _corFaixa = Colors.yellow;
        break;
      case FaixaICM.Normal:
        _corFaixa = Colors.green;
        break;
      case FaixaICM.Sobrepeso:
        _corFaixa = Colors.blue;
        break;
      case FaixaICM.Obesidade:
        _corFaixa = Colors.purple;
        break;
      case FaixaICM.Obesidade_grave:
        _corFaixa = Colors.red;
        break;
      default:
        _corFaixa = Colors.black; // Cor padrão caso a faixa seja nula
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado do IMC'),
        backgroundColor: _corFaixa,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.8,
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: _corFaixa, width: 9),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(0),
                  child: Text(
                    _imc.icm.toStringAsPrecision(3),
                    style: GoogleFonts.caladea(fontSize: 90),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Classificação:',
                    style: TextStyle(fontSize: 16, color: _corFaixa),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(0),
                  child: Text(
                    '${_imc.faixa?.descricao ?? ""}',
                    style: TextStyle(fontSize: 20, color: _corFaixa),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Text(
                    'O seu IMC indica se você possui o peso ideal, se '
                    'está acima ou abaixo do peso. Lembre-se que uma boa alimentação '
                    'e exercícios físicos regulares são fundamentais para '
                    'manter uma boa saúde. ',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
