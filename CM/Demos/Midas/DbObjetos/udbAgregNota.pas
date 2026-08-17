unit udbAgregNota;

interface

Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TdbAgregNota = class(TCmDbObject)
  Private
    FIDNFCOMPLEMENTAR: TCmDbField;
    FIDNFRECEBDEVOL: TCmDbField;
    FBASECALCULO: TCmDbField;
    FVLRRECUPERADO: TCmDbField;
    FALIQUOTA: TCmDbField;
    FCODTIPOCUSTAGREG: TCmDbField;
    FVLRAGREGADO: TCmDbField;
    FIDAGRNFRECDEV: TCmDbField;
    procedure SetALIQUOTA(const Value: TCmDbField);
    procedure SetBASECALCULO(const Value: TCmDbField);
    procedure SetCODTIPOCUSTAGREG(const Value: TCmDbField);
    procedure SetIDAGRNFRECDEV(const Value: TCmDbField);
    procedure SetIDNFCOMPLEMENTAR(const Value: TCmDbField);
    procedure SetIDNFRECEBDEVOL(const Value: TCmDbField);
    procedure SetVLRAGREGADO(const Value: TCmDbField);
    procedure SetVLRRECUPERADO(const Value: TCmDbField);

  Public
     Property IDAGRNFRECDEV     : TCmDbField read FIDAGRNFRECDEV write SetIDAGRNFRECDEV;
     Property CODTIPOCUSTAGREG  : TCmDbField read FCODTIPOCUSTAGREG write SetCODTIPOCUSTAGREG;
     Property IDNFRECEBDEVOL    : TCmDbField read FIDNFRECEBDEVOL write SetIDNFRECEBDEVOL;
     Property IDNFCOMPLEMENTAR  : TCmDbField read FIDNFCOMPLEMENTAR write SetIDNFCOMPLEMENTAR;
     Property ALIQUOTA          : TCmDbField read FALIQUOTA write SetALIQUOTA;
     Property BASECALCULO       : TCmDbField read FBASECALCULO write SetBASECALCULO;
     Property VLRAGREGADO       : TCmDbField read FVLRAGREGADO write SetVLRAGREGADO;
     Property VLRRECUPERADO     : TCmDbField read FVLRRECUPERADO write SetVLRRECUPERADO;
     //Métodos
     Constructor Create; Override;
     Function Insert :Boolean; Override;

  End;

implementation

{ TdbAgregNota }

constructor TdbAgregNota.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName          := 'AGRNFRECDEV';
  FIDAGRNFRECDEV     := CreateCmDbField('IDAGRNFRECDEV'    ,ftFloat,True,True);
  FCODTIPOCUSTAGREG  := CreateCmDbField('CODTIPOCUSTAGREG' ,ftFloat);
  FIDNFRECEBDEVOL    := CreateCmDbField('IDNFRECEBDEVOL'   ,ftFloat);
  FIDNFCOMPLEMENTAR  := CreateCmDbField('IDNFCOMPLEMENTAR' ,ftFloat);
  FALIQUOTA          := CreateCmDbField('ALIQUOTA'         ,ftFloat);
  FBASECALCULO       := CreateCmDbField('BASECALCULO'      ,ftFloat);
  FVLRAGREGADO       := CreateCmDbField('VLRAGREGADO'      ,ftFloat);
  FVLRRECUPERADO     := CreateCmDbField('VLRRECUPERADO'    ,ftFloat);
end;

function TdbAgregNota.Insert: Boolean;
begin                                              
  FIDAGRNFRECDEV.AsFloat := GetSequence(TableName);
  Result := Inherited Insert;
end;

procedure TdbAgregNota.SetALIQUOTA(const Value: TCmDbField);
begin
  FALIQUOTA := Value;
end;

procedure TdbAgregNota.SetBASECALCULO(const Value: TCmDbField);
begin
  FBASECALCULO := Value;
end;

procedure TdbAgregNota.SetCODTIPOCUSTAGREG(const Value: TCmDbField);
begin
  FCODTIPOCUSTAGREG := Value;
end;

procedure TdbAgregNota.SetIDAGRNFRECDEV(const Value: TCmDbField);
begin
  FIDAGRNFRECDEV := Value;
end;

procedure TdbAgregNota.SetIDNFCOMPLEMENTAR(const Value: TCmDbField);
begin
  FIDNFCOMPLEMENTAR := Value;
end;

procedure TdbAgregNota.SetIDNFRECEBDEVOL(const Value: TCmDbField);
begin
  FIDNFRECEBDEVOL := Value;
end;

procedure TdbAgregNota.SetVLRAGREGADO(const Value: TCmDbField);
begin
  FVLRAGREGADO := Value;
end;

procedure TdbAgregNota.SetVLRRECUPERADO(const Value: TCmDbField);
begin
  FVLRRECUPERADO := Value;
end;

end.
