class UserValidator {
  static String? validarNome(String nome) {
    if (nome.isEmpty) return 'Nome é obrigatório';
    if (nome.length < 4) return 'Nome inválido';

    return null;
  }

  static String? validarEmail(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regex = RegExp(pattern.toString());

    if (email.isEmpty) return 'E-mail é obrigatório';
    if (!regex.hasMatch(email)) return 'E-mail inválido';

    return null;
  }

  static String? validarTelefone(String telefone) {
    if (telefone.isEmpty) return 'Telefone obrigatório';
    if (!(telefone.length == 15)) return 'Telefone inválido';

    return null;
  }

  static String? validarSenha(String senha) {
    if (senha.isEmpty) return 'Senha é obrigatória';
    if (senha.length < 7) return 'Senha precisa ter mais de 6 caracteres';

    return null;
  }

}
