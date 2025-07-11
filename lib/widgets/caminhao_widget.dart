import 'package:flutter/material.dart';
import 'veiculo_widget.dart';

// CaminhaoWidget agora herda de VeiculoWidget
class CaminhaoWidget extends VeiculoWidget {
  // 🔵 ATRIBUTOS ESPECÍFICOS DE CAMINHÃO
  final String tipoCarroceria;
  final double capacidadeCarga;
  final int quantidadeEixos;

  const CaminhaoWidget({
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
    required this.tipoCarroceria,
    required this.capacidadeCarga,
    required this.quantidadeEixos,
  }) : super(key: key);
  @override
  String getTipoProduto() => 'Caminhão';

  @override
  Widget build(BuildContext context) {
    return super.build(context);
  }
}
