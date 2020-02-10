
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'controller.dart';

class BodyWidget extends StatelessWidget {

 _textField({String label, onChanged, String Function() errorText}) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label,
          errorText: errorText == null ? null : errorText()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = GetIt.I.get<Controller>();

    return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Observer(
                    builder: (_) {
                      return _textField(
                          label: "Nome",
                          onChanged: controller.client.mudarNome,
                          errorText: controller.validarNome);
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Observer(
                    builder: (_) {
                      return _textField(
                          label: "Email",
                          onChanged: controller.client.mudarEmail,
                          errorText: controller.validarEmail);
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Observer(
                    builder: (_) {
                      return _textField(
                          label: "Cpf",
                          onChanged: controller.client.mudarCpf,
                          errorText: controller.validarCpf);
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Observer(builder: (_) {
                    return RaisedButton(
                      onPressed: controller.isValid ? () {} : null,
                      child: Text("Salvar"),
                    );
                  })
                ],
              )
            ],
          ),
        );
  }
}