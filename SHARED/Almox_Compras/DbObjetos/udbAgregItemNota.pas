unit udbAgregItemNota;

interface

Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TdbAgregItemNota = class(TCmDbObject)

  private
    FIVLRRECUPERADO: TCmDbField;
    FIDITENSRECDEV: TCmDbField;
    FIALIQUOTA: TCmDbField;
    FIVLRAGREGADO: TCmDbField;
    FICODTIPOCUSTAGREG: TCmDbField;
    FIBASECALCULO: TCmDbField;
    FIDAGRITENSRECDEV: TCmDbField;
    procedure SetIALIQUOTA(const Value: TCmDbField);
    procedure SetIBASECALCULO(const Value: TCmDbField);
    procedure SetICODTIPOCUSTAGREG(const Value: TCmDbField);
    procedure SetIDAGRITENSRECDEV(const Value: TCmDbField);
    procedure SetIDITENSRECDEV(const Value: TCmDbField);
    procedure SetIVLRAGREGADO(const Value: TCmDbField);
    procedure SetIVLRRECUPERADO(const Value: TCmDbField);
  Public
      Property IDAGRITENSRECDEV   : TCmDbField read FIDAGRITENSRECDEV write SetIDAGRITENSRECDEV;
      Property ICODTIPOCUSTAGREG  : TCmDbField read FICODTIPOCUSTAGREG write SetICODTIPOCUSTAGREG;
      Property IDITENSRECDEV      : TCmDbField read FIDITENSRECDEV write SetIDITENSRECDEV;
      Property IALIQUOTA          : TCmDbField read FIALIQUOTA write SetIALIQUOTA;
      Property IBASECALCULO       : TCmDbField read FIBASECALCULO write SetIBASECALCULO;
      Property IVLRAGREGADO       : TCmDbField read FIVLRAGREGADO write SetIVLRAGREGADO;
      Property IVLRRECUPERADO     : TCmDbField read FIVLRRECUPERADO write SetIVLRRECUPERADO;
      //
      Constructor Create(aOwner : TCmCustomCdbObject ); Override;
      Function Insert :Boolean; Override;
  End;

implementation

{ TdbAgregItemNota }

constructor TdbAgregItemNota.Create(aOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName          := 'AGRITENSRECDEV';
  FIDAGRITENSRECDEV  := CreateCmDbField('IDAGRITENSRECDEV' ,ftFloat,True,True);
  FICODTIPOCUSTAGREG := CreateCmDbField('CODTIPOCUSTAGREG' ,ftFloat);
  FIDITENSRECDEV     := CreateCmDbField('IDITENSRECDEV'    ,ftFloat);
  FIALIQUOTA         := CreateCmDbField('ALIQUOTA'         ,ftFloat);
  FIBASECALCULO      := CreateCmDbField('BASECALCULO'      ,ftFloat);
  FIVLRAGREGADO      := CreateCmDbField('VLRAGREGADO '     ,ftFloat);
  FIVLRRECUPERADO    := CreateCmDbField('VLRRECUPERADO'    ,ftFloat);
end;

function TdbAgregItemNota.Insert: Boolean;
begin
  FIDAGRITENSRECDEV.AsFloat := GetSequence(TableName);
  Result := inherited Insert;
end;

procedure TdbAgregItemNota.SetIALIQUOTA(const Value: TCmDbField);
begin
  FIALIQUOTA := Value;
end;

procedure TdbAgregItemNota.SetIBASECALCULO(const Value: TCmDbField);
begin
  FIBASECALCULO := Value;
end;

procedure TdbAgregItemNota.SetICODTIPOCUSTAGREG(const Value: TCmDbField);
begin
  FICODTIPOCUSTAGREG := Value;
end;

procedure TdbAgregItemNota.SetIDAGRITENSRECDEV(const Value: TCmDbField);
begin
  FIDAGRITENSRECDEV := Value;
end;

procedure TdbAgregItemNota.SetIDITENSRECDEV(const Value: TCmDbField);
begin
  FIDITENSRECDEV := Value;
end;

procedure TdbAgregItemNota.SetIVLRAGREGADO(const Value: TCmDbField);
begin
  FIVLRAGREGADO := Value;
end;

procedure TdbAgregItemNota.SetIVLRRECUPERADO(const Value: TCmDbField);
begin
  FIVLRRECUPERADO := Value;
end;

end.
