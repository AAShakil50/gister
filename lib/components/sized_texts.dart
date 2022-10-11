import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final String text;
  const BigText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class SemiBigText extends StatelessWidget {
  final String text;
  const SemiBigText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class MidiumText extends StatelessWidget {
  final String text;
  const MidiumText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20,
        color: Colors.grey[600],
      ),
    );
  }
}

class MidiumBoldText extends StatelessWidget {
  final String text;
  const MidiumBoldText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class SmallText extends StatelessWidget {
  final String text;
  const SmallText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.grey[600],
      ),
    );
  }
}

class SmallBoldText extends StatelessWidget {
  final String text;
  const SmallBoldText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
