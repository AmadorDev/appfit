class DateModel {
  DateModel({
    required this.diaSemana,
    required this.diaSemanaTexto,
    required this.fechaTextoTitulo,
    required this.fechaTextoParametro,
    required this.flagCantidadReserva,
  });

  int diaSemana;
  String diaSemanaTexto;
  String fechaTextoTitulo;
  String fechaTextoParametro;
  int flagCantidadReserva;

  factory DateModel.fromMap(Map<String, dynamic> json) => DateModel(
        diaSemana: json["DiaSemana"],
        diaSemanaTexto: json["DiaSemanaTexto"],
        fechaTextoTitulo: json["FechaTextoTitulo"],
        fechaTextoParametro: json["FechaTextoParametro"],
        flagCantidadReserva: json["FlagCantidadReserva"],
      );

  Map<String, dynamic> toMap() => {
        "DiaSemana": diaSemana,
        "DiaSemanaTexto": diaSemanaTexto,
        "FechaTextoTitulo": fechaTextoTitulo,
        "FechaTextoParametro": fechaTextoParametro,
        "FlagCantidadReserva": flagCantidadReserva,
      };
}
