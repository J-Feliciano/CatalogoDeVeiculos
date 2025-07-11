import 'package:flutter/material.dart';
import 'veiculo_widget.dart';

// CarroWidget agora herda de VeiculoWidget
class CarroWidget extends VeiculoWidget{
  // 🔵 ATRIBUTOS EXCLUSIVOS DE CARRO
  final String tipoCambio;
  final int numeroPortas;
  final bool temArCondicionado;

  // Construtor, repassando os campos genéricos pro super
  const CarroWidget({
    Key? key,
    required super.nome,
    required super.preco,
    required super.descricao,
    required super.imagemUrl,
    required super.onTap,
    required super.marca,
    required super.modelo,
    required super.ano,
    required super.tipoCombustivel,
    required super.quilometragem,
    required this.tipoCambio,
    required this.numeroPortas,
    required this.temArCondicionado,
  }) : super(key: key);

  // Implementa o método abstrato do tipo
  @override
  String getTipoProduto() => 'Carro';

  // Override do build (mantém estilo anterior, pode customizar se quiser)
  @override
  Widget build(BuildContext context) {
    return super.build(context); // Usa o visual padrão da classe mãe
  }
}