import 'dart:convert';

class Visita {
  late int idVisita;
  late int idMunicipio;
  late String dtCadastro;
  late String agente;

  late String idArea = '0';
  late String idCensitario = '0';
  late String idQuarteirao = '0';

  late String ordem;
  late String endereco;
  late String numero;

  late int fachada;
  late int casa;
  late int quintal;
  late int sombraQuintal;
  late int pavQuintal;
  late int telhado;
  late int recipiente;
  late String latitude;
  late String longitude;

  Map toJson() => {
        'id_municipio': idMunicipio,
        'id_area': idArea,
        'id_censitario': idCensitario,
        'id_quarteirao': idQuarteirao,
        'dt_cadastro': dtCadastro,
        'agente': agente,
        'ordem': ordem,
        'endereco': endereco,
        'numero': numero,
        'fachada': fachada,
        'casa': casa,
        'quintal': quintal,
        'sombra_quintal': sombraQuintal,
        'pav_quintal': pavQuintal,
        'telhado': telhado,
        'recipientes': recipiente,
        'latitude': latitude,
        'longitude': longitude,
      };

}

class LstVisita {
  int id;
  String dtSolicita;
  int status;
  String operacaoCcb;
  String valor;

  LstVisita(
    this.id,
    this.dtSolicita,
    this.status,
    this.operacaoCcb,
    this.valor,
  );

  factory LstVisita.fromJson(dynamic json) {
    var prop = jsonDecode(json['dados_proposta']);
    return LstVisita(
      int.parse(json['id_emprestimo_proposta'].toString()),
      json['dt_solicita'],
      int.parse(json['status'].toString()),
      json['operacao_ccb'],
      'R\$ ${prop['valor_requerido'].toStringAsFixed(2)}',
    );
  }
}


/*class VisitaEnvio {
  int idVisita;
  int idMunicipio;
  String dtCadastro;
  String agente;

  String idArea;
  String idCensitario;
  String idQuarteirao;

  String ordem;
  String endereco;
  String numero;

  int fachada;
  int casa;
  int quintal;
  int sombraQuintal;
  int pavQuintal;
  int telhado;
  int recipiente;
  String latitude;
  String longitude;

  VisitaEnvio(
    {
    required this.idVisita,
    required this.idMunicipio,
    required this.dtCadastro,
    required this.agente,
    required this.idArea,
    required this.idCensitario,
    required this.idQuarteirao,
    required this.ordem,
    required this.endereco,
    required this.numero,
    required this.fachada,
    required this.casa,
    required this.quintal,
    required this.sombraQuintal,
    required this.pavQuintal,
    required this.telhado,
    required this.recipiente,
    required this.latitude,
    required this.longitude,
  });

  factory VisitaEnvio.fromJson(Map<String, dynamic> json){
    return VisitaEnvio(
        idVisita: int.parse(json["id_visita"]),
        idMunicipio: int.parse(json["id_municipio"]),
        idArea: json["id_area"].toString(),
        idCensitario: json["id_censitario"].toString(),
        idQuarteirao: json["id_quarteirao"].toString(),
        dtCadastro: json["dt_cadastro"].toString(),
        agente: json["agente"].toString(),
        ordem: json["ordem"].toString(),
        endereco: json["endereco"],
        numero: json["numero"].toString(),
        fachada: int.parse(json["fachada"].toString()),
        casa: int.parse(json["casa"].toString()),
        quintal: int.parse(json["quintal"].toString()),
        sombraQuintal: int.parse(json["sombra_quintal"].toString()),
        pavQuintal: int.parse(json["pavQuintal"].toString()),
        telhado: int.parse(json["cartao_corporativo"].toString()),
        recipiente: int.parse(json["cpf"].toString()),
        latitude: json["nome"].toString(),
        longitude: json["perfil"].toString(),
    );
  }
}*/