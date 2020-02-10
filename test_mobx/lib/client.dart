import 'package:mobx/mobx.dart';
part 'client.g.dart';

class Client = _ClientBase with _$Client;

abstract class _ClientBase with Store {
  
  @observable
  String nome;

  @action
  mudarNome(String novoNome) => nome = novoNome;

  @observable
  String email;

  @action
  mudarEmail(String novoEmail) => email = novoEmail;

  @observable
  String cpf;

  @action
  mudarCpf(String novoCpf) => cpf = novoCpf;

}