import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key,
    required this.title, this.actionButtons,
    this.isMain=true
  });

  final bool isMain ;
  final String title;
  final List<Widget>? actionButtons;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
        leading:
        isMain? IconButton(
        onPressed: () => _navigateToPop(context),
        icon: const Icon(Icons.arrow_back_ios),) : null,
      actions: actionButtons,
    );
  }
  void _navigateToPop(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  @override
  Size get preferredSize =>  const Size(double.infinity, 50);

}
