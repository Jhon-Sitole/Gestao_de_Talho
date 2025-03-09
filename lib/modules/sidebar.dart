import 'package:flutter/material.dart';
import 'package:gestao_de_talho/core/theme/colors.dart';
import 'package:gestao_de_talho/modules/produtos.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  String selectedMenu = 'Dashboard'; // Item do menu atualmente selecionado
  String hoveredMenu = ''; // Item do menu atualmente com o mouse hover

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width, // Define largura total
      height: MediaQuery.of(context).size.height, // Define altura total
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Menu lateral
          Container(
            width: 250,
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              border: Border.all(color: AppColors.borderColor),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10.0, top: 2.0, bottom: 5.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      height: 100,
                      width: 150,
                      child: Image(
                        image: AssetImage('assets/images/logo_icon.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                ..._buildMenuItems([
                  {'title': 'Dashboard', 'icon': Icons.dashboard},
                  {'title': 'Gestão de Produtos', 'icon': Icons.shopping_cart},
                  {'title': 'Gestão de Finanças', 'icon': Icons.attach_money},
                  {'title': 'Recursos Humanos', 'icon': Icons.people},
                  {'title': 'Ciclo de Vendas', 'icon': Icons.bar_chart},
                  {
                    'title': 'Administração',
                    'icon': Icons.admin_panel_settings
                  },
                ]),
                const Spacer(),
                ..._buildMenuItems([
                  {'title': 'Meu Perfil', 'icon': Icons.person},
                  {'title': 'Configurações', 'icon': Icons.settings},
                  {'title': 'Sair', 'icon': Icons.exit_to_app},
                ]),
                const SizedBox(height: 16),
              ],
            ),
          ),
          // Espaço entre o menu e o conteúdo principal
          const SizedBox(width: 5),
          // Conteúdo principal - Alterna com base no menu selecionado
          Expanded(
            child: Container(
              color: Colors.white,
              child: _getSelectedPage(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getSelectedPage() {
    switch (selectedMenu) {
      case 'Gestão de Produtos':
        return const ProdutosPage();
      default:
        return const Center(
          child: Text(
            'Conteúdo Principal',
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
        );
    }
  }

  // Função responsável por criar os itens do menu
  List<Widget> _buildMenuItems(List<Map<String, dynamic>> items) {
    return items.map((item) {
      bool isSelected = selectedMenu == item['title'];
      bool isHovered = hoveredMenu == item['title'];
      return MouseRegion(
        onEnter: (_) => setState(() => hoveredMenu = item['title']),
        onExit: (_) => setState(() => hoveredMenu = ''),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            setState(() {
              selectedMenu = item['title'];
            });
          },
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              children: [
                Icon(
                  item['icon'],
                  color: isSelected || isHovered
                      ? AppColors.primaryColor
                      : AppColors.textColor,
                ),
                const SizedBox(width: 10),
                Text(
                  item['title'],
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                    color: isSelected || isHovered
                        ? AppColors.primaryColor
                        : AppColors.textColor,
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
