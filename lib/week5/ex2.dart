import 'package:flutter/material.dart';

enum ButtonType { primary, secondary, disabled }
enum IconPosition { left, right }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Custom Buttons')),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: const [
              CustomButton(
                label: 'Submit',
                icon: Icons.check,
                type: ButtonType.primary,
                iconPosition: IconPosition.left,
              ),
              CustomButton(
                label: 'Time',
                icon: Icons.access_time,
                type: ButtonType.secondary,
                iconPosition: IconPosition.right,
              ),
              CustomButton(
                label: 'Account',
                icon: Icons.account_tree,
                type: ButtonType.disabled,
                iconPosition: IconPosition.right,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final ButtonType type;
  final IconPosition iconPosition;

  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.type = ButtonType.primary,
    this.iconPosition = IconPosition.left,
  });

  Color _getBackgroundColor() {
    switch (type) {
      case ButtonType.primary:
        return Colors.blue;
      case ButtonType.secondary:
        return Colors.green;
      case ButtonType.disabled:
        return Colors.grey;
    }
  }

  Color _getTextColor() {
    switch (type) {
      case ButtonType.primary:
      case ButtonType.secondary:
        return Colors.white;
      case ButtonType.disabled:
        return Colors.white70;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = _getBackgroundColor();
    final textColor = _getTextColor();

    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (iconPosition == IconPosition.left) ...[
            Icon(icon, color: textColor),
            const SizedBox(width: 8),
          ],
          Text(
            label,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (iconPosition == IconPosition.right) ...[
            const SizedBox(width: 8),
            Icon(icon, color: textColor),
          ],
        ],
      ),
    );
  }
}
