import 'package:flutter/material.dart';
import 'package:gestao_de_talho/core/theme/colors.dart'; // Importação das cores definidas no tema

class ProdutosPage extends StatelessWidget {
  const ProdutosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Cabeçalho da seção "Gestão de Produtos"
        Container(
          width: MediaQuery.of(context).size.width, // Ocupa toda a largura da tela
          height: 100, // Altura igual à da imagem
          color: AppColors.sectionBackground, // Cor de fundo definida no tema
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 16.0),
          child: const Text(
            'Gestão de Produtos',
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Poppins', // Usando a mesma fonte do menu
              color: Colors.black,
            ),
          ),
        ),
        // Área de conteúdo principal
        Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width, // Garante que ocupa toda a largura disponível
            color: Colors.white,
            child: const Center(
              child: Text(
                'Conteúdo de Gestão de Produtos',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
