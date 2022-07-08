import 'dart:convert';

class General {
    General({
       
        this.nombreComercialEmpresa,
        this.logoTipo,
        this.defaultKeyEmpresa,
        this.defaultKeyUser,
        this.activo,
    });

    
    String? nombreComercialEmpresa;
    String? logoTipo;
    String? defaultKeyEmpresa;
    String? defaultKeyUser;
    int? activo;

    factory General.fromJson(String str) => General.fromMap(json.decode(str));

    factory General.fromMap(Map<String, dynamic> json) => General(
        nombreComercialEmpresa: json["NombreComercialEmpresa"],
        logoTipo: json["LogoTipo"],
        defaultKeyEmpresa: json["DefaultKeyEmpresa"],
        defaultKeyUser: json["DefaultKeyUser"],
        activo: json["activo"],
    );

    
}
