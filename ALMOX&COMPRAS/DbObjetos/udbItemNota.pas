unit udbItemNota;

interface

Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbItemNota = class(TCmDbObject)
  Private
    FIDPRODVARI: TcmDbField;
    FCODALMOXARIFADO: TcmDbField;
    FIDITEMOC: TcmDbField;
    FIDITENSRECDEV: TcmDbField;
    FCODCENTROCUSTO: TcmDbField;
    FRECPAG: TcmDbField;
    FCODARTIGO: TcmDbField;
    FDATAVALIDADE: TcmDbField;
    FCODTIPRECDES: TcmDbField;
    FUNIDNEGOC: TcmDbField;
    FIDPESSOA: TcmDbField;
    FCODFISCAL: TcmDbField;
    FFLGDESTINO: TcmDbField;
    FIDMOV: TcmDbField;
    FIDRESERVAORCAMEN: TcmDbField;
    FQTDERECEBDEVOL: TcmDbField;
    FCODMEDIDA: TcmDbField;
    FNUMOC: TcmDbField;
    FIDNFRECEBDEVOL: TcmDbField;
    FIDEMPRESA: TcmDbField;
    FCODCENTRORESPON: TcmDbField;
    FVLRUNITARIO: TcmDbField;
    FVLRESTOQUE: TcmDbField;
    FIDPATRO: TCmDbField;
    FIDPLANOPREV: TCmDbField;
    FIDPROGRAMA: TCmDbField;
    procedure SetCODALMOXARIFADO(const Value: TcmDbField);
    procedure SetCODARTIGO(const Value: TcmDbField);
    procedure SetCODCENTROCUSTO(const Value: TcmDbField);
    procedure SetCODCENTRORESPON(const Value: TcmDbField);
    procedure SetCODFISCAL(const Value: TcmDbField);
    procedure SetCODMEDIDA(const Value: TcmDbField);
    procedure SetCODTIPRECDES(const Value: TcmDbField);
    procedure SetDATAVALIDADE(const Value: TcmDbField);
    procedure SetFLGDESTINO(const Value: TcmDbField);
    procedure SetIDEMPRESA(const Value: TcmDbField);
    procedure SetIDITEMOC(const Value: TcmDbField);
    procedure SetIDITENSRECDEV(const Value: TcmDbField);
    procedure SetIDMOV(const Value: TcmDbField);
    procedure SetIDNFRECEBDEVOL(const Value: TcmDbField);
    procedure SetIDPESSOA(const Value: TcmDbField);
    procedure SetIDPRODVARI(const Value: TcmDbField);
    procedure SetIDRESERVAORCAMEN(const Value: TcmDbField);
    procedure SetNUMOC(const Value: TcmDbField);
    procedure SetQTDERECEBDEVOL(const Value: TcmDbField);
    procedure SetRECPAG(const Value: TcmDbField);
    procedure SetUNIDNEGOC(const Value: TcmDbField);
    procedure SetVLRESTOQUE(const Value: TcmDbField);
    procedure SetVLRUNITARIO(const Value: TcmDbField);
    procedure SetIDPATRO(const Value: TCmDbField);
    procedure SetIDPLANOPREV(const Value: TCmDbField);
    procedure SetIDPROGRAMA(const Value: TCmDbField);
  Public
     Property IDITENSRECDEV    : TcmDbField read FIDITENSRECDEV write SetIDITENSRECDEV;
     Property CODMEDIDA        : TcmDbField read FCODMEDIDA write SetCODMEDIDA;
     Property IDITEMOC         : TcmDbField read FIDITEMOC write SetIDITEMOC;
     Property IDPRODVARI       : TcmDbField read FIDPRODVARI write SetIDPRODVARI;
     Property IDRESERVAORCAMEN : TcmDbField read FIDRESERVAORCAMEN write SetIDRESERVAORCAMEN;
     Property IDPESSOA         : TcmDbField read FIDPESSOA write SetIDPESSOA;
     Property CODCENTRORESPON  : TcmDbField read FCODCENTRORESPON write SetCODCENTRORESPON;
     Property RECPAG           : TcmDbField read FRECPAG write SetRECPAG;
     Property CODTIPRECDES     : TcmDbField read FCODTIPRECDES write SetCODTIPRECDES;
     Property CODFISCAL        : TcmDbField read FCODFISCAL write SetCODFISCAL;
     Property IDMOV            : TcmDbField read FIDMOV write SetIDMOV;
     Property UNIDNEGOC        : TcmDbField read FUNIDNEGOC write SetUNIDNEGOC;
     Property IDEMPRESA        : TcmDbField read FIDEMPRESA write SetIDEMPRESA;
     Property CODCENTROCUSTO   : TcmDbField read FCODCENTROCUSTO write SetCODCENTROCUSTO;
     Property CODARTIGO        : TcmDbField read FCODARTIGO write SetCODARTIGO;
     Property CODALMOXARIFADO  : TcmDbField read FCODALMOXARIFADO write SetCODALMOXARIFADO;
     Property NUMOC            : TcmDbField read FNUMOC write SetNUMOC;
     Property IDNFRECEBDEVOL   : TcmDbField read FIDNFRECEBDEVOL write SetIDNFRECEBDEVOL;
     Property QTDERECEBDEVOL   : TcmDbField read FQTDERECEBDEVOL write SetQTDERECEBDEVOL;
     Property VLRUNITARIO      : TcmDbField read FVLRUNITARIO write SetVLRUNITARIO;
     Property VLRESTOQUE       : TcmDbField read FVLRESTOQUE write SetVLRESTOQUE;
     Property FLGDESTINO       : TcmDbField read FFLGDESTINO write SetFLGDESTINO;
     Property DATAVALIDADE     : TcmDbField read FDATAVALIDADE write SetDATAVALIDADE;
     Property IDPLANOPREV      : TCmDbField read FIDPLANOPREV write SetIDPLANOPREV;
     Property IDPATRO          : TCmDbField read FIDPATRO write SetIDPATRO;
     Property IDPROGRAMA       : TCmDbField read FIDPROGRAMA write SetIDPROGRAMA;
     //Métodos
     Constructor Create(aOwner : TCmCustomCdbObject ); Override;
     Function  Insert : Boolean; Override;
  End;
implementation

{ TDbItemNota }

constructor TDbItemNota.Create(aOwner : TCmCustomCdbObject );
begin

   inherited;
   ErrorIfNoRowsAffected := False;
   TableName             := 'ITENSRECEBDEVOL';
   FIDITENSRECDEV        := CreateCmDbField('IDITENSRECDEV'     ,ftFloat,True,True);
   FCODMEDIDA            := CreateCmDbField('CODMEDIDA'         ,ftString);
   FIDITEMOC             := CreateCmDbField('IDITEMOC'          ,ftFloat);
   FIDPRODVARI           := CreateCmDbField('IDPRODVARI'        ,ftFloat);
   FIDRESERVAORCAMEN     := CreateCmDbField('IDRESERVAORCAMEN'  ,ftFloat);
   FIDPESSOA             := CreateCmDbField('IDPESSOA'          ,ftFloat);
   FCODCENTRORESPON      := CreateCmDbField('CODCENTRORESPON'   ,ftString);
   FRECPAG               := CreateCmDbField('RECPAG'            ,ftString);
   FCODTIPRECDES         := CreateCmDbField('CODTIPRECDES'      ,ftString);
   FCODFISCAL            := CreateCmDbField('CODFISCAL'         ,ftString);
   FIDMOV                := CreateCmDbField('IDMOV'             ,ftFloat);
   FUNIDNEGOC            := CreateCmDbField('UNIDNEGOC'         ,ftFloat);
   FIDEMPRESA            := CreateCmDbField('IDEMPRESA'         ,ftFloat);
   FCODCENTROCUSTO       := CreateCmDbField('CODCENTROCUSTO'    ,ftString);
   FCODARTIGO            := CreateCmDbField('CODARTIGO'         ,ftString);
   FCODALMOXARIFADO      := CreateCmDbField('CODALMOXARIFADO'   ,ftFloat);
   FNUMOC                := CreateCmDbField('NUMOC'             ,ftFloat);
   FIDNFRECEBDEVOL       := CreateCmDbField('IDNFRECEBDEVOL'    ,ftFloat);
   FQTDERECEBDEVOL       := CreateCmDbField('QTDERECEBDEVOL'    ,ftFloat);
   FVLRUNITARIO          := CreateCmDbField('VLRUNITARIO'       ,ftFloat);
   FVLRESTOQUE           := CreateCmDbField('VLRESTOQUE'        ,ftFloat);
   FFLGDESTINO           := CreateCmDbField('FLGDESTINO'        ,ftString);
   FDATAVALIDADE         := CreateCmDbField('DATAVALIDADE'      ,ftDateTime);
   FIDPLANOPREV          := CreateCmDbField('IDPLANOPREV'       ,ftFloat);
   FIDPATRO              := CreateCmDbField('IDPATRO'           ,ftFloat);
   FIDPROGRAMA           := CreateCmDbField('IDPROGRAMA'        ,ftFloat);
end;

function TDbItemNota.Insert: Boolean;
begin
 FIDITENSRECDEV.AsFloat := GetSequence(TableName);
 Result := inherited Insert;
end;

procedure TDbItemNota.SetCODALMOXARIFADO(const Value: TcmDbField);
begin
  FCODALMOXARIFADO := Value;
end;

procedure TDbItemNota.SetCODARTIGO(const Value: TcmDbField);
begin
  FCODARTIGO := Value;
end;

procedure TDbItemNota.SetCODCENTROCUSTO(const Value: TcmDbField);
begin
  FCODCENTROCUSTO := Value;
end;

procedure TDbItemNota.SetCODCENTRORESPON(const Value: TcmDbField);
begin
  FCODCENTRORESPON := Value;
end;

procedure TDbItemNota.SetCODFISCAL(const Value: TcmDbField);
begin
  FCODFISCAL := Value;
end;

procedure TDbItemNota.SetCODMEDIDA(const Value: TcmDbField);
begin
  FCODMEDIDA := Value;
end;

procedure TDbItemNota.SetCODTIPRECDES(const Value: TcmDbField);
begin
  FCODTIPRECDES := Value;
end;

procedure TDbItemNota.SetDATAVALIDADE(const Value: TcmDbField);
begin
  FDATAVALIDADE := Value;
end;



procedure TDbItemNota.SetFLGDESTINO(const Value: TcmDbField);
begin
  FFLGDESTINO := Value;
end;

procedure TDbItemNota.SetIDEMPRESA(const Value: TcmDbField);
begin
  FIDEMPRESA := Value;
end;

procedure TDbItemNota.SetIDITEMOC(const Value: TcmDbField);
begin
  FIDITEMOC := Value;
end;

procedure TDbItemNota.SetIDITENSRECDEV(const Value: TcmDbField);
begin
  FIDITENSRECDEV := Value;
end;

procedure TDbItemNota.SetIDMOV(const Value: TcmDbField);
begin
  FIDMOV := Value;
end;

procedure TDbItemNota.SetIDNFRECEBDEVOL(const Value: TcmDbField);
begin
  FIDNFRECEBDEVOL := Value;
end;

procedure TDbItemNota.SetIDPATRO(const Value: TCmDbField);
begin
  FIDPATRO := Value;
end;

procedure TDbItemNota.SetIDPESSOA(const Value: TcmDbField);
begin
  FIDPESSOA := Value;
end;

procedure TDbItemNota.SetIDPLANOPREV(const Value: TCmDbField);
begin
  FIDPLANOPREV := Value;
end;

procedure TDbItemNota.SetIDPRODVARI(const Value: TcmDbField);
begin
  FIDPRODVARI := Value;
end;

procedure TDbItemNota.SetIDPROGRAMA(const Value: TCmDbField);
begin
  FIDPROGRAMA := Value;
end;

procedure TDbItemNota.SetIDRESERVAORCAMEN(const Value: TcmDbField);
begin
  FIDRESERVAORCAMEN := Value;
end;

procedure TDbItemNota.SetNUMOC(const Value: TcmDbField);
begin
  FNUMOC := Value;
end;

procedure TDbItemNota.SetQTDERECEBDEVOL(const Value: TcmDbField);
begin
  FQTDERECEBDEVOL := Value;
end;

procedure TDbItemNota.SetRECPAG(const Value: TcmDbField);
begin
  FRECPAG := Value;
end;

procedure TDbItemNota.SetUNIDNEGOC(const Value: TcmDbField);
begin
  FUNIDNEGOC := Value;
end;

procedure TDbItemNota.SetVLRESTOQUE(const Value: TcmDbField);
begin
  FVLRESTOQUE := Value;
end;

procedure TDbItemNota.SetVLRUNITARIO(const Value: TcmDbField);
begin
  FVLRUNITARIO := Value;
end;

end.

