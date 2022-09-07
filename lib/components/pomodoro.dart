import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomorodo/components/cronometer.dart';
import 'package:pomorodo/components/time_entry.dart';
import 'package:provider/provider.dart';

import 'store/pomodoro.store.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(child: Cronometer()),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Observer(
                builder: (_) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TimeEntry(
                        value: store.tempoTrabalho,
                        titulo: 'Trabalho',
                        inc: store.iniciado && store.estaTrabalhando()
                            ? null
                            : store.incrementarTempoTrabalho,
                        dec: store.iniciado && store.estaTrabalhando()
                            ? null
                            : store.decrementarTempoTrabalho),
                    TimeEntry(
                        value: store.tempoDescanso,
                        titulo: 'Descanso',
                        inc: store.iniciado && store.estaDescansando()
                            ? null
                            : store.incrementarTempoDescanso,
                        dec: store.iniciado && store.estaDescansando()
                            ? null
                            : store.decrementarTempoDescanso)
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
