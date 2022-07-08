import 'dart:convert';


class Details {
    Details({
        this.tkId,
        this.tkLatitude,
        this.tkLongitude,
        this.nroSolicitud,
        this.motivo,
        this.nombreEstado,
        this.nroDias,
        this.tipo,
        this.codigoMensaje,
        this.tamanioPagina,
        this.codigoDetalle,
        this.codigoMenbresia,
        this.nroIngresoDia,
        this.cantidadAsistencia,
        this.codigoHistorialMenbresia,
        this.observacion,
        this.nombreMembresia,
        this.fechasDelEstado,
        this.asesorComercial,
        this.tipoDescuento,
        this.montoDescuento,
        this.codigoSocio,
        this.nombreSocio,
        this.telefono,
        this.tipoIngreso,
        this.desTipoIngreso,
        this.desTipoPaquete,
        this.desSocio,
        this.codigoResponsable,
        this.descripcion,
        this.nombreResponsable,
        this.cantidad,
        this.modelo,
        this.tipoProducto,
        this.dateDesTipoPaquete,
        this.codigoPaquete,
        this.nombrePaquete,
        this.fechaInicio,
        this.desFechaInicio,
        this.counter,
        this.fechaFin,
        this.hoy,
        this.desFechaFin,
        this.costo,
        this.pago,
        this.montoTotal,
        this.montoCuota,
        this.strFechaCuota,
        this.debe,
        this.nroIngreso,
        this.nroIngresoActual,
        this.nroContrato,
        this.matriculadoPor,
        this.frezenDisponibles,
        this.desMatriculadoPor,
        this.colorEstado,
        this.fechaDesCongelacion,
        this.descFechaDesCongelacion,
        this.fechaCongelacionProgramada,
        this.descFechaCongelacionProgramada,
        this.motivoCongelamiento,
        this.estado,
        this.desEstado,
        this.cantidadFreezing,
        this.cantidadFreezingTomados,
        this.codigoSocioReceptor,
        this.desProfesor,
        this.puntaje,
        this.observacionCalificacion,
        this.observacionAdicional,
        this.semana,
        this.estadoCogelado,
        this.estadoInfoCogelado,
        this.estadoColor,
        this.estadoPaquete,
        this.estadoDescripcion,
        this.colorInputCongelado,
        this.observacionTraspaso,
        this.socioTraspasoReceptor,
        this.codigoValorPaquete,
        this.tipoContrato,
        this.origenSociosTraspaso,
        this.origenMembresiaTraspaso,
        this.codigoSocioTraspasado,
        this.membresiaTraspasada,
        this.estadoTraspaso,
        this.usuarioEmisor,
        this.codigoProfesor,
        this.codTiempoMenbresia,
        this.usuarioReceptor,
        this.flagIngresar,
        this.imageUrl,
        this.operation,
        this.xml,
        this.flagTermino,
        this.mensaje,
        this.tipoMembresia,
        this.indTraspaso,
        this.codigoSocioTraslado,
        this.nombresTraslado,
        this.sedeTraslado,
        this.codigoMembresiaTraslado,
        this.paqueteTraslado,
        this.fechaInicioTraslado,
        this.fechaFinTraslado,
        this.costoTraslado,
        this.estadoTraslado,
        this.nroIngresosTraslado,
        this.codigoSocioOrigen,
        this.codigoMebresiaOrigen,
        this.nombresOrigen,
        this.sedeOrigen,
        this.paqueteOrigen,
        this.fechaInicioOrigen,
        this.fechaFinOrigen,
        this.costoOrigen,
        this.estadoOrigen,
        this.nroIngresosOrigen,
        this.fechaTraspaso,
        this.codigoPaqueteTraspaso,
        this.usuarioResponsable,
        this.obtenerTiempoVencimiento,
        this.obtenerEstadoCitaNutrional,
        this.obtenerDisponibilidadHorarioPaquete,
        this.dni,
        this.distrito,
        this.direccion,
        this.cantidadRegistros,
        this.totalDeuda,
        this.flagPaqueteSedePermiso,
        this.nombres,
        this.apellidos,
        this.desPlanMembresia,
        this.desOrigenMembresia,
        this.desTipoMembresia,
        this.desTiempoPaquete,
        this.estadoCelular,
        this.imagenUrl,
        this.celular,
        this.correo,
        this.codigoMembresia,
        this.vendedor,
        this.desCalificacion,
        this.nombreComercial,
        this.estadoPermisoReservar,
        this.listPagosContrato,
        this.listContratoMensaje,
        this.listContratoCuota,
        this.listReservas,
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

    int? tkId;
    String? tkLatitude;
    String? tkLongitude;
    String? nroSolicitud;
    String? motivo;
    String? nombreEstado;
    int? nroDias;
    int? tipo;
    int? codigoMensaje;
    int? tamanioPagina;
    int? codigoDetalle;
    int? codigoMenbresia;
    int? nroIngresoDia;
    int? cantidadAsistencia;
    int? codigoHistorialMenbresia;
    String? observacion;
    String? nombreMembresia;
    String? fechasDelEstado;
    String? asesorComercial;
    int? tipoDescuento;
    double? montoDescuento;
    int? codigoSocio;
    String? nombreSocio;
    String? telefono;
    int? tipoIngreso;
    String? desTipoIngreso;
    String? desTipoPaquete;
    String? desSocio;
    int? codigoResponsable;
    String? descripcion;
    String? nombreResponsable;
    int? cantidad;
    String? modelo;
    int? tipoProducto;
    String? dateDesTipoPaquete;
    int? codigoPaquete;
    String? nombrePaquete;
    String? fechaInicio;
    String? desFechaInicio;
    String? counter;
    String? fechaFin;
    String? hoy;
    String? desFechaFin;
    double? costo;
    double? pago;
    double? montoTotal;
    double? montoCuota;
    String? strFechaCuota;
    double? debe;
    int? nroIngreso;
    int? nroIngresoActual;
    String? nroContrato;
    int? matriculadoPor;
    int? frezenDisponibles;
    String? desMatriculadoPor;
    String? colorEstado;
    String? fechaDesCongelacion;
    String? descFechaDesCongelacion;
    String? fechaCongelacionProgramada;
    String? descFechaCongelacionProgramada;
    String? motivoCongelamiento;
    int? estado;
    String? desEstado;
    int? cantidadFreezing;
    int? cantidadFreezingTomados;
    int? codigoSocioReceptor;
    String? desProfesor;
    String? puntaje;
    String? observacionCalificacion;
    String? observacionAdicional;
    String? semana;
    String? estadoCogelado;
    int? estadoInfoCogelado;
    String? estadoColor;
    bool? estadoPaquete;
    String? estadoDescripcion;
    String? colorInputCongelado;
    String? observacionTraspaso;
    String? socioTraspasoReceptor;
    String? codigoValorPaquete;
    int? tipoContrato;
    int? origenSociosTraspaso;
    int? origenMembresiaTraspaso;
    int? codigoSocioTraspasado;
    String? membresiaTraspasada;
    int? estadoTraspaso;
    String? usuarioEmisor;
    int? codigoProfesor;
    int? codTiempoMenbresia;
    String? usuarioReceptor;
    String? flagIngresar;
    String? imageUrl;
    int? operation;
    String? xml;
    String? flagTermino;
    String? mensaje;
    int? tipoMembresia;
    String? indTraspaso;
    int? codigoSocioTraslado;
    String? nombresTraslado;
    int? sedeTraslado;
    int? codigoMembresiaTraslado;
    String? paqueteTraslado;
    String? fechaInicioTraslado;
    String? fechaFinTraslado;
    double? costoTraslado;
    int? estadoTraslado;
    int? nroIngresosTraslado;
    int? codigoSocioOrigen;
    int? codigoMebresiaOrigen;
    String? nombresOrigen;
    int? sedeOrigen;
    String? paqueteOrigen;
    String? fechaInicioOrigen;
    String? fechaFinOrigen;
    double? costoOrigen;
    int? estadoOrigen;
    int? nroIngresosOrigen;
    String? fechaTraspaso;
    int? codigoPaqueteTraspaso;
    String? usuarioResponsable;
    String? obtenerTiempoVencimiento;
    String? obtenerEstadoCitaNutrional;
    int? obtenerDisponibilidadHorarioPaquete;
    String? dni;
    String? distrito;
    String? direccion;
    int? cantidadRegistros;
    double? totalDeuda;
    int? flagPaqueteSedePermiso;
    String? nombres;
    String? apellidos;
    String? desPlanMembresia;
    String? desOrigenMembresia;
    String? desTipoMembresia;
    String? desTiempoPaquete;
    String? estadoCelular;
    String? imagenUrl;
    String? celular;
    String? correo;
    int? codigoMembresia;
    String? vendedor;
    String? desCalificacion;
    String? nombreComercial;
    int? estadoPermisoReservar;
    String? listPagosContrato;
    String? listContratoMensaje;
    String? listContratoCuota;
    String? listReservas;
    int? codigoUnidadNegocio;
    int? codigoSede;
    String? usuarioCreacion;
    String? fechaCreacion;
    String? usuarioEdicion;
    String? fechaEdicion;
    String? usuarioEliminacion;
    String? fechaEliminacion;
    int? codigoInicioSesion;
    String? descFechaCreacion;
    String? descFechaEdicion;
    String? defaultKeyUser;
    String? defaultKeyEmpresa;

    factory Details.fromJson(String str) => Details.fromMap(json.decode(str));

    factory Details.fromMap(Map<String, dynamic> json) => Details(
        tkId: json["TK_ID"] ?? '',
        tkLatitude: json["TK_Latitude"] ?? '',
        tkLongitude: json["TK_Longitude"] ?? '',
        nroSolicitud: json["NroSolicitud"] ?? '',
        motivo: json["Motivo"] ?? '',
        nombreEstado: json["NombreEstado"] ?? '',
        nroDias: json["NroDias"] ?? '',
        tipo: json["Tipo"] ?? '',
        codigoMensaje: json["CodigoMensaje"] ?? '',
        tamanioPagina: json["TamanioPagina"] ?? '',
        codigoDetalle: json["CodigoDetalle"] ?? '',
        codigoMenbresia: json["CodigoMenbresia"] ?? '',
        nroIngresoDia: json["NroIngresoDia"] ?? '',
        cantidadAsistencia: json["CantidadAsistencia"] ?? '',
        codigoHistorialMenbresia: json["CodigoHistorialMenbresia"] ?? '',
        observacion: json["Observacion"] ?? '',
        nombreMembresia: json["NombreMembresia"] ?? '',
        fechasDelEstado: json["FechasDelEstado"] ?? '',
        asesorComercial: json["AsesorComercial"] ?? '',
        tipoDescuento: json["TipoDescuento"] ?? '',
        montoDescuento: json["MontoDescuento"] ?? '',
        codigoSocio: json["CodigoSocio"] ?? '',
        nombreSocio: json["NombreSocio"] ?? '',
        telefono: json["Telefono"] ?? '',
        tipoIngreso: json["TipoIngreso"] ?? '',
        desTipoIngreso: json["DesTipoIngreso"] ?? '',
        desTipoPaquete: json["DesTipoPaquete"] ?? '',
        desSocio: json["desSocio"] ?? '',
        codigoResponsable: json["CodigoResponsable"] ?? '',
        descripcion: json["Descripcion"] ?? '',
        nombreResponsable: json["NombreResponsable"] ?? '',
        cantidad: json["Cantidad"] ?? '',
        modelo: json["Modelo"] ?? '',
        tipoProducto: json["tipoProducto"] ?? '',
        dateDesTipoPaquete: json["desTipoPaquete"] ?? '',
        codigoPaquete: json["CodigoPaquete"] ?? '',
        nombrePaquete: json["NombrePaquete"] ?? '',
        fechaInicio: json["FechaInicio"] ?? '',
        desFechaInicio: json["DesFechaInicio"] ?? '',
        counter: json["Counter"] ?? '',
        fechaFin: json["FechaFin"] ?? '',
        hoy: json["Hoy"] ?? '',
        desFechaFin: json["DesFechaFin"] ?? '',
        costo: json["Costo"] ?? '',
        pago: json["Pago"] ?? '',
        montoTotal: json["MontoTotal"] ?? '',
        montoCuota: json["MontoCuota"] ?? '',
        strFechaCuota: json["strFechaCuota"] ?? '',
        debe: json["Debe"] ?? '',
        nroIngreso: json["NroIngreso"] ?? '',
        nroIngresoActual: json["NroIngresoActual"] ?? '',
        nroContrato: json["NroContrato"] ?? '',
        matriculadoPor: json["MatriculadoPor"] ?? '',
        frezenDisponibles: json["FrezenDisponibles"] ?? '',
        desMatriculadoPor: json["DesMatriculadoPor"] ?? '',
        colorEstado: json["colorEstado"] ?? '',
        fechaDesCongelacion: json["FechaDesCongelacion"] ?? '',
        descFechaDesCongelacion: json["DescFechaDesCongelacion"] ?? '',
        fechaCongelacionProgramada: json["FechaCongelacionProgramada"] ?? '',
        descFechaCongelacionProgramada: json["DescFechaCongelacionProgramada"] ?? '',
        motivoCongelamiento: json["MotivoCongelamiento"] ?? '',
        estado: json["Estado"] ?? '',
        desEstado: json["desEstado"] ?? '',
        cantidadFreezing: json["CantidadFreezing"] ?? '',
        cantidadFreezingTomados: json["CantidadFreezingTomados"] ?? '',
        codigoSocioReceptor: json["CodigoSocioReceptor"] ?? '',
        desProfesor: json["desProfesor"] ?? '',
        puntaje: json["Puntaje"] ?? '',
        observacionCalificacion: json["ObservacionCalificacion"] ?? '',
        observacionAdicional: json["ObservacionAdicional"] ?? '',
        semana: json["Semana"] ?? '',
        estadoCogelado: json["EstadoCogelado"] ?? '',
        estadoInfoCogelado: json["EstadoInfoCogelado"] ?? '',
        estadoColor: json["EstadoColor"] ?? '',
        estadoPaquete: json["EstadoPaquete"] ?? '',
        estadoDescripcion: json["EstadoDescripcion"] ?? '',
        colorInputCongelado: json["colorInputCongelado"] ?? '',
        observacionTraspaso: json["ObservacionTraspaso"] ?? '',
        socioTraspasoReceptor: json["SocioTraspasoReceptor"] ?? '',
        codigoValorPaquete: json["codigoValorPaquete"] ?? '',
        tipoContrato: json["TipoContrato"] ?? '',
        origenSociosTraspaso: json["OrigenSociosTraspaso"] ?? '',
        origenMembresiaTraspaso: json["OrigenMembresiaTraspaso"] ?? '',
        codigoSocioTraspasado: json["CodigoSocioTraspasado"] ?? '',
        membresiaTraspasada: json["MembresiaTraspasada"] ?? '',
        estadoTraspaso: json["EstadoTraspaso"] ?? '',
        usuarioEmisor: json["UsuarioEmisor"] ?? '',
        codigoProfesor: json["CodigoProfesor"] ?? '',
        codTiempoMenbresia: json["CodTiempoMenbresia"] ?? '',
        usuarioReceptor: json["UsuarioReceptor"] ?? '',
        flagIngresar: json["flagIngresar"] ?? '',
        imageUrl: json["imageURL"] ?? '',
        operation: json["Operation"] ?? '',
        xml: json["Xml"] ?? '',
        flagTermino: json["flagTermino"] ?? '',
        mensaje: json["Mensaje"] ?? '',
        tipoMembresia: json["TipoMembresia"] ?? '',
        indTraspaso: json["IndTraspaso"] ?? '',
        codigoSocioTraslado: json["CodigoSocioTraslado"] ?? '',
        nombresTraslado: json["NombresTraslado"] ?? '',
        sedeTraslado: json["SedeTraslado"] ?? '',
        codigoMembresiaTraslado: json["CodigoMembresiaTraslado"] ?? '',
        paqueteTraslado: json["PaqueteTraslado"] ?? '',
        fechaInicioTraslado: json["FechaInicioTraslado"] ?? '',
        fechaFinTraslado: json["FechaFinTraslado"] ?? '',
        costoTraslado: json["CostoTraslado"] ?? '',
        estadoTraslado: json["EstadoTraslado"] ?? '',
        nroIngresosTraslado: json["NroIngresosTraslado"] ?? '',
        codigoSocioOrigen: json["CodigoSocioOrigen"] ?? '',
        codigoMebresiaOrigen: json["CodigoMebresiaOrigen"] ?? '',
        nombresOrigen: json["NombresOrigen"] ?? '',
        sedeOrigen: json["SedeOrigen"] ?? '',
        paqueteOrigen: json["PaqueteOrigen"] ?? '',
        fechaInicioOrigen: json["FechaInicioOrigen"] ?? '',
        fechaFinOrigen: json["FechaFinOrigen"] ?? '',
        costoOrigen: json["CostoOrigen"] ?? '',
        estadoOrigen: json["EstadoOrigen"] ?? '',
        nroIngresosOrigen: json["NroIngresosOrigen"] ?? '',
        fechaTraspaso: json["FechaTraspaso"] ?? '',
        codigoPaqueteTraspaso: json["CodigoPaqueteTraspaso"] ?? '',
        usuarioResponsable: json["UsuarioResponsable"] ?? '',
        obtenerTiempoVencimiento: json["ObtenerTiempoVencimiento"] ?? '',
        obtenerEstadoCitaNutrional: json["ObtenerEstadoCitaNutrional"] ?? '', 
        obtenerDisponibilidadHorarioPaquete: json["ObtenerDisponibilidadHorarioPaquete"] ?? '',
        dni: json["DNI"] ?? '',
        distrito: json["Distrito"] ?? '',
        direccion: json["Direccion"] ?? '',
        cantidadRegistros: json["CantidadRegistros"] ?? '',
        totalDeuda: json["TotalDeuda"] ?? '',
        flagPaqueteSedePermiso: json["flagPaqueteSedePermiso"] ?? '',
        nombres: json["Nombres"] ?? '',
        apellidos: json["Apellidos"] ?? '',
        desPlanMembresia: json["desPlanMembresia"] ?? '',
        desOrigenMembresia: json["desOrigenMembresia"] ?? '',
        desTipoMembresia: json["desTipoMembresia"] ?? '',
        desTiempoPaquete: json["desTiempoPaquete"] ?? '',
        estadoCelular: json["EstadoCelular"] ?? '',
        imagenUrl: json["ImagenUrl"] ?? '',
        celular: json["Celular"] ?? '',
        correo: json["Correo"] ?? '',
        codigoMembresia: json["CodigoMembresia"] ?? '',
        vendedor: json["Vendedor"] ?? '',
        desCalificacion: json["DesCalificacion"] ?? '',
        nombreComercial: json["NombreComercial"] ?? '',
        estadoPermisoReservar: json["EstadoPermisoReservar"] ?? '',
        listPagosContrato: json["ListPagosContrato"] ?? '',
        listContratoMensaje: json["ListContratoMensaje"] ?? '',
        listContratoCuota: json["ListContratoCuota"] ?? '',
        listReservas: json["ListReservas"] ?? '',
        codigoUnidadNegocio: json["CodigoUnidadNegocio"] ?? '',
        codigoSede: json["CodigoSede"] ?? '',
        usuarioCreacion: json["UsuarioCreacion"] ?? '',
        fechaCreacion: json["FechaCreacion"] ?? '',
        usuarioEdicion: json["UsuarioEdicion"] ?? '',
        fechaEdicion: json["FechaEdicion"] ?? '',
        usuarioEliminacion: json["UsuarioEliminacion"] ?? '',
        fechaEliminacion: json["FechaEliminacion"] ?? '',
        codigoInicioSesion: json["CodigoInicioSesion"] ?? '',
        descFechaCreacion: json["DescFechaCreacion"] ?? '',
        descFechaEdicion: json["DescFechaEdicion"] ?? '',
        defaultKeyUser: json["DefaultKeyUser"] ?? '',
        defaultKeyEmpresa: json["DefaultKeyEmpresa"] ?? '',
    );
   
   int get colorsState{
   
    List newColor = [];
    int exag = 0xFFEEEEEEE;
     if (estadoColor!=null){
     newColor = estadoColor!.split("#");
     exag = int.parse('0xFF${newColor[1]}');
    
     }
     return exag;
   }

  
    
    
}
