
//Enumeração para representar as diferentes faixas de IMC.
enum FaixaICM{
  Magreza,
  Normal,
  Sobrepeso,
  Obesidade,
  Obesidade_grave,
}

// Extensão aplicada à enumeração FaixaIMC, para 
// adicionar propriedade de descrição.

extension FaixaICMtxt on FaixaICM{

  String get descricao{
    switch (this){
      case FaixaICM.Magreza:
        return 'Abaixo do Peso, grau 0';
      case FaixaICM.Normal:
        return 'Peso Ideal, grau 0';
      case FaixaICM.Sobrepeso:
        return 'Acima do peso, grau I';
      case FaixaICM.Obesidade:
        return 'Obesidade grau II';
      case FaixaICM.Obesidade_grave:
        return 'Obesidade grau III';
      default:
        return "";
    }
  }
}

class ICM{
  double peso;
  double altura;
  
  ICM({required this.peso, required this.altura});

  double get icm{
    return peso / (altura * altura);
  }

  FaixaICM? get faixa {
    
      double valueIMC = this.icm;

      if(valueIMC < 18.5)
        return FaixaICM.Magreza;
      if(valueIMC >=18.5 && valueIMC < 24.9)
        return FaixaICM.Normal;
      if(valueIMC >=25.0 && valueIMC < 29.9)
        return FaixaICM.Sobrepeso;
      if(valueIMC >=30.0 && valueIMC < 39.9)
        return FaixaICM.Obesidade;
      if(valueIMC > 40.0)
        return FaixaICM.Obesidade_grave;

      return null;
  }
}