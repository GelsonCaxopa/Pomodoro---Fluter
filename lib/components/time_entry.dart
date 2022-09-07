import 'package:flutter/material.dart';
import 'package:pomorodo/components/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class TimeEntry extends StatelessWidget {
  final String titulo;
  final int value;

  final void Function()? inc;
  final void Function()? dec;

  const TimeEntry({
    Key? key,
    required this.value,
    required this.titulo,
    this.inc,
    this.dec,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(titulo, style: const TextStyle(fontSize: 20)),
        const SizedBox(height: 10),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
            onPressed: dec,
            child: const Icon(Icons.arrow_downward, color: Colors.white),
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(15),
              primary: store.estaTrabalhando() ? Colors.red : Colors.green,
            ),
          ),
          Text('$value min', style: const TextStyle(fontSize: 18)),
          ElevatedButton(
            onPressed: inc,
            child: const Icon(Icons.arrow_upward, color: Colors.white),
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(15),
              primary: store.estaTrabalhando() ? Colors.red : Colors.green,
            ),
          ),
        ]),
      ],
    );
  }
}
