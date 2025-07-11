import 'package:flutter/material.dart';
import 'veiculo_widget.dart';

// MotoWidget agora herda de VeiculoWidget
class MotoWidget extends VeiculoWidget{
  // 🔵 ATRIBUTOS ESPECÍFICOS DE MOTO
  final int cilindrada;
  final String tipoMoto;
  final bool temPartidaEletrica;

  const MotoWidget({
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
    required this.cilindrada,
    required this.tipoMoto,
    required this.temPartidaEletrica,
  }) : super(key: key);

  @override
  String getTipoProduto() => 'Moto';

  @override
  Widget build(BuildContext context) {
    return super.build(context);
  }
}