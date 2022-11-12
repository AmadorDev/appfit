import 'dart:convert';

class Room {
  Room({
    this.tipoSala,
    this.codigoSala,
    this.descripcion,
    this.nroSala,
    this.color,
    this.estado,
    this.operation,
    this.accion,
    this.codigoUnidadNegocio,
    this.codigoSede,
    this.usuarioCreacion,
    this.fechaCreacion,
    this.usuarioEdicion,
    this.fechaEdicion,
    this.usuarioEliminacion,
    this.fechaEliminacion,
    this.codigoInicioSesion,
    this.descFechaCreacion,
    this.descFechaEdicion,
    this.defaultKeyUser,
    this.defaultKeyEmpresa,
  });

  int? tipoSala;
  int? codigoSala;
  String? descripcion;
  int? nroSala;
  String? color;
  bool? estado;
  int? operation;
  String? accion;
  int? codigoUnidadNegocio;
  int? codigoSede;
  String? usuarioCreacion;
  DateTime? fechaCreacion;
  String? usuarioEdicion;
  DateTime? fechaEdicion;
  String? usuarioEliminacion;
  DateTime? fechaEliminacion;
  int? codigoInicioSesion;
  String? descFechaCreacion;
  String? descFechaEdicion;
  String? defaultKeyUser;
  String? defaultKeyEmpresa;

  factory Room.fromJson(String str) => Room.fromMap(json.decode(str));

  factory Room.fromMap(Map<String, dynamic> json) => Room(
        tipoSala: json["TipoSala"] != null ? json["TipoSala"] : '',
        codigoSala: json["CodigoSala"] != null ? json["CodigoSala"] : '',
        descripcion: json["Descripcion"] != null ? json["Descripcion"] : '',
        nroSala: json["NroSala"] != null ? json["NroSala"] : '',
        color: json["Color"] == null ? null : json["Color"],
        estado: json["Estado"] != null ? json["Estado"] : '',
        operation: json["Operation"] != null ? json["Operation"] : '',
        accion: json["Accion"] != null ? json["Accion"] : '',
        codigoUnidadNegocio: json["CodigoUnidadNegocio"] != ''
            ? json["CodigoUnidadNegocio"]
            : '',
        codigoSede: json["CodigoSede"] != null ? json["CodigoSede"] : '',
        usuarioCreacion:
            json["UsuarioCreacion"] != null ? json["UsuarioCreacion"] : '',
        fechaCreacion: DateTime.parse(json["FechaCreacion"]),
        usuarioEdicion:
            json["UsuarioEdicion"] != null ? json["UsuarioEdicion"] : '',
        fechaEdicion: DateTime.parse(json["FechaEdicion"]),
        usuarioEliminacion:
            json["UsuarioEliminacion"] != '' ? json["UsuarioEliminacion"] : '',
        fechaEliminacion: DateTime.parse(json["FechaEliminacion"]),
        codigoInicioSesion:
            json["CodigoInicioSesion"] != '' ? json["CodigoInicioSesion"] : '',
        descFechaCreacion:
            json["DescFechaCreacion"] != '' ? json["DescFechaCreacion"] : '',
        descFechaEdicion:
            json["DescFechaEdicion"] != null ? json["DescFechaEdicion"] : '',
        defaultKeyUser:
            json["DefaultKeyUser"] != null ? json["DefaultKeyUser"] : '',
        defaultKeyEmpresa:
            json["DefaultKeyEmpresa"] != '' ? json["DefaultKeyEmpresa"] : '',
      );
}
