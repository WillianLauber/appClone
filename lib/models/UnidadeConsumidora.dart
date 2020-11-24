
class UnidadeConsumidora {
  final int numero;
  final int documento;
  final String dataNascCliente;
  final String apelido;

  @override
  String toString() {
    return 'UnidadeConsumidora{numero: $numero, documento: $documento, dataNascCliente: $dataNascCliente, apelido: $apelido}';
  }

  UnidadeConsumidora(this.numero, this.documento, this.dataNascCliente, this.apelido);

}