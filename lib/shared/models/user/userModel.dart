// To parse this JSON data, do
//
//     final userAcount = userAcountFromMap(jsonString);

import 'dart:convert';


class UserData {
    UserData({
        required this.userType,
        required this.id,
        required this.fullName,
        this.nombres,
        this.apellidos,
        this.photo,
        required this.userName,
        this.passwordHash,
        required this.defaultKey,
        this.identificacion,
        required this.email,
        required this.emailConfirmed,
        this.phoneNumber,
        required this.phoneNumberConfirmed,
        this.securityStamp,
        required this.estate,
        required this.codigoCargo,
        this.desCargo,
        required this.loginValidation,
        required this.idValidation,
        this.mensajeValidation,
        required this.operation,
        this.passwordHashActual,
        this.passwordHashNueva,
        required this.codigoUnidadNegocio,
        required this.codigoSede,
        this.usuarioCreacion,
        required this.fechaCreacion,
        this.usuarioEdicion,
        required this.fechaEdicion,
        this.usuarioEliminacion,
        required this.fechaEliminacion,
        required this.codigoInicioSesion,
        this.descFechaCreacion,
        this.descFechaEdicion,
    });

    int userType;
    String id;
    String fullName;
    String? nombres;
    String? apellidos;
    String? photo;
    String userName;
    String? passwordHash;
    String defaultKey;
    String? identificacion;
    String email;
    bool emailConfirmed;
    int? phoneNumber;
    bool phoneNumberConfirmed;
    String? securityStamp;
    int estate;
    int codigoCargo;
    String? desCargo;
    int loginValidation;
    int idValidation;
    String? mensajeValidation;
    int operation;
    String? passwordHashActual;
    String? passwordHashNueva;
    int codigoUnidadNegocio;
    int codigoSede;
    String? usuarioCreacion;
    DateTime fechaCreacion;
    String? usuarioEdicion;
    DateTime fechaEdicion;
    String? usuarioEliminacion;
    DateTime fechaEliminacion;
    int codigoInicioSesion;
    String? descFechaCreacion;
    String? descFechaEdicion;

    factory UserData.fromJson(String str) => UserData.fromMap(json.decode(str));

    //String toJson() => json.encode(toMap());

    factory UserData.fromMap(Map<String, dynamic> json) => UserData(
        userType: json["UserType"],
        id: json["Id"],
        fullName: json["FullName"],
        nombres: json["Nombres"],
        apellidos: json["Apellidos"],
        photo: json["Photo"],
        userName: json["UserName"],
        passwordHash: json["PasswordHash"],
        defaultKey: json["DefaultKey"],
        identificacion: json["Identificacion"],
        email: json["Email"],
        emailConfirmed: json["EmailConfirmed"],
        phoneNumber: json["PhoneNumber"],
        phoneNumberConfirmed: json["PhoneNumberConfirmed"],
        securityStamp: json["SecurityStamp"],
        estate: json["Estate"],
        codigoCargo: json["CodigoCargo"],
        desCargo: json["DesCargo"],
        loginValidation: json["LoginValidation"],
        idValidation: json["IdValidation"],
        mensajeValidation: json["MensajeValidation"],
        operation: json["Operation"],
        passwordHashActual: json["PasswordHashActual"],
        passwordHashNueva: json["PasswordHashNueva"],
        codigoUnidadNegocio: json["CodigoUnidadNegocio"],
        codigoSede: json["CodigoSede"],
        usuarioCreacion: json["UsuarioCreacion"],
        fechaCreacion: DateTime.parse(json["FechaCreacion"]),
        usuarioEdicion: json["UsuarioEdicion"],
        fechaEdicion: DateTime.parse(json["FechaEdicion"]),
        usuarioEliminacion: json["UsuarioEliminacion"],
        fechaEliminacion: DateTime.parse(json["FechaEliminacion"]),
        codigoInicioSesion: json["CodigoInicioSesion"],
        descFechaCreacion: json["DescFechaCreacion"],
        descFechaEdicion: json["DescFechaEdicion"],
    );

    Map<String, dynamic> toMap() => {
        "UserType": userType,
        "Id": id,
        "FullName": fullName,
        "Nombres": nombres,
        "Apellidos": apellidos,
        "Photo": photo,
        "UserName": userName,
        "PasswordHash": passwordHash,
        "DefaultKey": defaultKey,
        "Identificacion": identificacion,
        "Email": email,
        "EmailConfirmed": emailConfirmed,
        "PhoneNumber": phoneNumber,
        "PhoneNumberConfirmed": phoneNumberConfirmed,
        "SecurityStamp": securityStamp,
        "Estate": estate,
        "CodigoCargo": codigoCargo,
        "DesCargo": desCargo,
        "LoginValidation": loginValidation,
        "IdValidation": idValidation,
        "MensajeValidation": mensajeValidation,
        "Operation": operation,
        "PasswordHashActual": passwordHashActual,
        "PasswordHashNueva": passwordHashNueva,
        "CodigoUnidadNegocio": codigoUnidadNegocio,
        "CodigoSede": codigoSede,
        "UsuarioCreacion": usuarioCreacion,
        "FechaCreacion": fechaCreacion.toIso8601String(),
        "UsuarioEdicion": usuarioEdicion,
        "FechaEdicion": fechaEdicion.toIso8601String(),
        "UsuarioEliminacion": usuarioEliminacion,
        "FechaEliminacion": fechaEliminacion.toIso8601String(),
        "CodigoInicioSesion": codigoInicioSesion,
        "DescFechaCreacion": descFechaCreacion,
        "DescFechaEdicion": descFechaEdicion,
    };
}
