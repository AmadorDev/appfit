
import 'dart:convert';

class Fits {
    Fits({
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
    int? estado;
    String? usuarioCreacion;
    String? accion;
    String? colorEmpresa;
    String? idEmpresa;
    String? defaultKeyEmpresa;
    String? defaultKeyUser;

    factory Fits.fromJson(String str) => Fits.fromMap(json.decode(str));

    factory Fits.fromMap(Map<String, dynamic> json) => Fits(
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
        fechaAniversarioEmpresa: (json["FechaAniversarioEmpresa"]),
        correoEmpresa: json["CorreoEmpresa"],
        subDominio: json["SubDominio"],
        logoTipo: json["LogoTipo"],
        estado: json["Estado"],
        usuarioCreacion: json["UsuarioCreacion"],
        accion: json["Accion"],
        colorEmpresa: json["ColorEmpresa"],
        idEmpresa: json["IdEmpresa"],
        defaultKeyEmpresa: json["DefaultKeyEmpresa"],
        defaultKeyUser: json["DefaultKeyUser"],
    );

    
}
