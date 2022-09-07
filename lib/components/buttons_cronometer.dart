import 'package:flutter/material.dart';

class ButtonsCronometer extends StatelessWidget {
  final IconData icon;
  final void Function()? click;
  const ButtonsCronometer({
    Key? key,
    required this.icon,
    this.click,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        textStyle: const TextStyle(fontSize: 25),
      ),
      child: Row(
        children: [
          Center(child: Icon(icon, size: 35)),
        ],
      ),
      onPressed: click,
    );
  }
}
