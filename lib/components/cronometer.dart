import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomorodo/components/buttons_cronometer.dart';
import 'package:provider/provider.dart';

import 'store/pomodoro.store.dart';

class Cronometer extends StatelessWidget {
  const Cronometer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return Observer(builder: (_) {
      return Container(
          color: store.estaTrabalhando() ? Colors.red : Colors.green,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                store.estaTrabalhando()
                    ? 'Hora de Trabalhar'
                    : 'Hora de Descansar',
                style: const TextStyle(fontSize: 40, color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '${store.minutos.toString().padLeft(2, '0')}:${store.segundos.toString().padLeft(2, '0')}',
                style: const TextStyle(fontSize: 120, color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                if (!store.iniciado)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ButtonsCronometer(
                        icon: Icons.play_arrow, click: store.iniciar),
                  ),
                if (store.iniciado)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        ButtonsCronometer(icon: Icons.stop, click: store.parar),
                  ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ButtonsCronometer(
                      icon: Icons.refresh, click: store.reiniciar),
                ),
              ]),
            ],
          ));
    });
  }
}