import 'package:flutter/material.dart';
import 'package:gestao_de_talho/core/theme/colors.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  String selectedMenu = 'Dashboard'; // Item do menu atualmente selecionado
  String hoveredMenu = ''; 

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: AppColors.backgroundColor, // Define o fundo do menu lateral
        border: Border.all(color: AppColors.borderColor), // Define a borda do menu lateral
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Logo do sistema
          const Padding(
            padding: EdgeInsets.only(left: 10.0, top: 2.0, bottom: 5.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                height: 100,
                width: 150,
                child: Image(
                  image: AssetImage('assets/images/logo_icon.png'), // Carrega a logo do sistema
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          // Lista de menus principais
          ..._buildMenuItems([
            {'title': 'Dashboard', 'icon': Icons.dashboard},
            {'title': 'Gestão de Produtos', 'icon': Icons.shopping_cart},
            {'title': 'Gestão de Finanças', 'icon': Icons.attach_money},
            {'title': 'Recursos Humanos', 'icon': Icons.people},
            {'title': 'Ciclo de Vendas', 'icon': Icons.bar_chart},
            {'title': 'Administração', 'icon': Icons.admin_panel_settings},
          ]),
          const Spacer(), // Espaco para separar os menus principais dos menus inferiores
          // Lista de menus secundarios (Perfil, Configuracoes e Sair)
          ..._buildMenuItems([
            {'title': 'Meu Perfil', 'icon': Icons.person},
            {'title': 'Configurações', 'icon': Icons.settings},
            {'title': 'Sair', 'icon': Icons.exit_to_app},
          ]),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  // Funco responsável por criar os itens do menu
  List<Widget> _buildMenuItems(List<Map<String, dynamic>> items) {
    return items.map((item) {
      bool isSelected = selectedMenu == item['title']; // Verifica se o item esta selecionado
      bool isHovered = hoveredMenu == item['title']; // Verifica se o mouse esta sobre o item
      return MouseRegion(
        onEnter: (_) => setState(() => hoveredMenu = item['title']), // Detecta quando o mouse entra no item
        onExit: (_) => setState(() => hoveredMenu = ''), // Detecta quando o mouse sai do item
        cursor: SystemMouseCursors.click, // Altera o cursor para indicar que e clicavel
        child: GestureDetector(
          onTap: () {
            setState(() {
              selectedMenu = item['title']; // Atualiza o item selecionado ao clicar
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              children: [
                Icon(
                  item['icon'],
                  color: isSelected || isHovered ? AppColors.primaryColor : AppColors.textColor, // Muda a cor do icone se estiver selecionado ou em hover
                ),
                const SizedBox(width: 10),
                Text(
                  item['title'],
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    color: isSelected || isHovered ? AppColors.primaryColor : AppColors.textColor, // Muda a cor do texto se estiver selecionado ou em hover
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }).toList();
  }
}
