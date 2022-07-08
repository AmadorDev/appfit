import 'dart:convert';

class Favorite {
    Favorite({
        this.codigoUnidadNegocio,
        this.codigoSede,
        this.nombreDuenio,
        this.apellidosDuenio,
        this.correoDuenio,
        this.codigoPais,
        this.celularDuenio,
        this.tipoDocumentoEmpresa,
        this.nroDocumentoEmpresa,
        this.razonSocialEmpresa,
        this.direccionEmpresa,
        this.nombreComercialEmpresa,
        this.telefonoEmpresa,
        this.fechaAniversarioEmpresa,
        this.correoEmpresa,
        this.subDominio,
        this.logoTipo,
        this.ubigeo,
        this.idUser,
        this.estado,
        this.usuarioCreacion,
        this.accion,
        this.colorEmpresa,
        this.idEmpresa,
        this.defaultKeyEmpresa,
        this.defaultKeyUser,
    });

    String? codigoUnidadNegocio;
    String? codigoSede;
    String? nombreDuenio;
    String? apellidosDuenio;
    String? correoDuenio;
    String? codigoPais;
    String? celularDuenio;
    int? tipoDocumentoEmpresa;
    String? nroDocumentoEmpresa;
    String? razonSocialEmpresa;
    String? direccionEmpresa;
    String? nombreComercialEmpresa;
    String? telefonoEmpresa;
    String? fechaAniversarioEmpresa;
    String? correoEmpresa;
    String? subDominio;
    String? logoTipo;
    String? ubigeo;
    String? idUser;
    int? estado;
    String? usuarioCreacion;
    String? accion;
    String? colorEmpresa;
    String? idEmpresa;
    String? defaultKeyEmpresa;
    String? defaultKeyUser;

    factory Favorite.fromJson(String str) => Favorite.fromMap(json.decode(str));

    factory Favorite.fromMap(Map<String, dynamic> json) => Favorite(
        codigoUnidadNegocio: json["CodigoUnidadNegocio"],
        codigoSede: json["CodigoSede"],
        nombreDuenio: json["NombreDuenio"],
        apellidosDuenio: json["ApellidosDuenio"],
        correoDuenio: json["CorreoDuenio"],
        codigoPais: json["CodigoPais"],
        celularDuenio: json["CelularDuenio"],
        tipoDocumentoEmpresa: json["TipoDocumentoEmpresa"],
        nroDocumentoEmpresa: json["NroDocumentoEmpresa"],
        razonSocialEmpresa: json["RazonSocialEmpresa"],
        direccionEmpresa: json["DireccionEmpresa"],
        nombreComercialEmpresa: json["NombreComercialEmpresa"],
        telefonoEmpresa: json["TelefonoEmpresa"],
        fechaAniversarioEmpresa: json["FechaAniversarioEmpresa"],
        correoEmpresa: json["CorreoEmpresa"],
        subDominio: json["SubDominio"],
        logoTipo: json["LogoTipo"],
        ubigeo: json["Ubigeo"],
        idUser: json["IdUser"],
        estado: json["Estado"],
        usuarioCreacion: json["UsuarioCreacion"],
        accion: json["Accion"],
        colorEmpresa: json["ColorEmpresa"],
        idEmpresa: json["IdEmpresa"],
        defaultKeyEmpresa: json["DefaultKeyEmpresa"],
        defaultKeyUser: json["DefaultKeyUser"],
    );

    Map<String, dynamic> toMap() => {
        "CodigoUnidadNegocio": codigoUnidadNegocio,
        "CodigoSede": codigoSede,
        "NombreDuenio": nombreDuenio,
        "ApellidosDuenio": apellidosDuenio,
        "CorreoDuenio": correoDuenio,
        "CodigoPais": codigoPais,
        "CelularDuenio": celularDuenio,
        "TipoDocumentoEmpresa": tipoDocumentoEmpresa,
        "NroDocumentoEmpresa": nroDocumentoEmpresa,
        "RazonSocialEmpresa": razonSocialEmpresa,
        "DireccionEmpresa": direccionEmpresa,
        "NombreComercialEmpresa": nombreComercialEmpresa,
        "TelefonoEmpresa": telefonoEmpresa,
        "FechaAniversarioEmpresa": fechaAniversarioEmpresa,
        "CorreoEmpresa": correoEmpresa,
        "SubDominio": subDominio,
        "LogoTipo": logoTipo,
        "Ubigeo": ubigeo,
        "IdUser": idUser,
        "Estado": estado,
        "UsuarioCreacion": usuarioCreacion,
        "Accion": accion,
        "ColorEmpresa": colorEmpresa,
        "IdEmpresa": idEmpresa,
        "DefaultKeyEmpresa": defaultKeyEmpresa,
        "DefaultKeyUser": defaultKeyUser,
    };
}
