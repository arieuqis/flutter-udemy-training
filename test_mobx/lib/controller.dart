import 'package:mobx/mobx.dart';
import 'package:test_mobx/client.dart';
part 'controller.g.dart';

class Controller = _ControllerBase with _$Controller;

abstract class _ControllerBase with Store {
  
  var client = Client();

  @computed
  bool get isValid {
    return validarNome() == null && validarEmail() == null && validarCpf() == null;
  }

  String validarNome(){
    if(client.nome == null || client.nome.isEmpty){
      return "Informe o nome";
    }else if (client.nome.length < 3){
      return "Nome precisa ter mais que 3 caracteres";
    }

    return null;
  }

   String validarEmail(){
    if(client.email == null || client.email.isEmpty){
      return "Informe o email";
    }else if (! client.email.contains("@")){
      return "Precisa ser email valido";
    }

    return null;
  }

  String validarCpf(){
    if(client.cpf == null || client.cpf.isEmpty){
      return "Informe o cpf";
    }

    return null;
  }
}