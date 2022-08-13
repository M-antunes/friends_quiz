import 'package:flutter/material.dart';

class FinishQuizButton extends StatelessWidget {
  final VoidCallback onTap;
  const FinishQuizButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.deepPurpleAccent,
              borderRadius: BorderRadius.circular(10)),
          child: const Center(
            child: Text(
              'Finalizar pontuação',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
