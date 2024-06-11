import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PokeButton extends StatelessWidget {

  final String text;
  final IconData icon;
  final VoidCallback? onPressed;

  const PokeButton({
    super.key, 
    this.onPressed, 
    required this.text, 
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 150,
      child: FilledButton(
        onPressed: onPressed,
        style:  pokeButtonStyle(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(this.icon, size: 20,),
            Text(this.text, 
            textAlign: TextAlign.center, 
            style: const TextStyle(fontSize: 14),
            overflow: TextOverflow.visible,
            maxLines: 3,
            ),
          ],
        )
      ),
    );
  }
}

ButtonStyle pokeButtonStyle() {
    return ButtonStyle(
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder( borderRadius: BorderRadius.circular(10) )
        ),
        backgroundColor: const WidgetStatePropertyAll(Colors.red),
        minimumSize: WidgetStateProperty.all(const Size(50, 80))
    );
  }