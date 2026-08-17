unit udbNota;

interface

Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbNota = class(TCmDbObject)
  Private
    FDATAEMISNF: TcmDbField;
    FIDNFREFERENCIA: TcmDbField;
    FFLGIMPRESSO: TcmDbField;
    FFLGTIPONOTA: TcmDbField;
    FIDNFLIVRO: TcmDbField;
    FCODDOCUMENTO: TcmDbField;
    FNUMNF: TcmDbField;
    FPLNCODIGO: TcmDbField;
    FIDPESSOA: TcmDbField;
    FDATAENTDEVOL: TcmDbField;
    FFLGGEROULIVRO: TcmDbField;
    FCODFISCAL: TcmDbField;
    FCOMPLNF: TcmDbField;
    FIDFORCLI: TcmDbField;
    FIDNFRECEBDEVOL: TcmDbField;
    FVLRNOTAFISCAL: TcmDbField;
    procedure SetCODDOCUMENTO(const Value: TcmDbField);
    procedure SetCODFISCAL(const Value: TcmDbField);
    procedure SetCOMPLNF(const Value: TcmDbField);
    procedure SetDATAEMISNF(const Value: TcmDbField);
    procedure SetDATAENTDEVOL(const Value: TcmDbField);
    procedure SetFLGGEROULIVRO(const Value: TcmDbField);
    procedure SetFLGIMPRESSO(const Value: TcmDbField);
    procedure SetFLGTIPONOTA(const Value: TcmDbField);
    procedure SetIDFORCLI(const Value: TcmDbField);
    procedure SetIDNFLIVRO(const Value: TcmDbField);
    procedure SetIDNFRECEBDEVOL(const Value: TcmDbField);
    procedure SetIDNFREFERENCIA(const Value: TcmDbField);
    procedure SetIDPESSOA(const Value: TcmDbField);
    procedure SetNUMNF(const Value: TcmDbField);
    procedure SetPLNCODIGO(const Value: TcmDbField);
    procedure SetVLRNOTAFISCAL(const Value: TcmDbField);

  Public
     Property IDNFRECEBDEVOL  : TcmDbField read FIDNFRECEBDEVOL write SetIDNFRECEBDEVOL;
     Property CODFISCAL       : TcmDbField read FCODFISCAL write SetCODFISCAL;
     Property IDNFLIVRO       : TcmDbField read FIDNFLIVRO write SetIDNFLIVRO;
     Property IDFORCLI        : TcmDbField read FIDFORCLI write SetIDFORCLI;
     Property IDPESSOA        : TcmDbField read FIDPESSOA write SetIDPESSOA;
     Property CODDOCUMENTO    : TcmDbField read FCODDOCUMENTO write SetCODDOCUMENTO;
     Property PLNCODIGO       : TcmDbField read FPLNCODIGO write SetPLNCODIGO;
     Property NUMNF           : TcmDbField read FNUMNF write SetNUMNF;
     Property COMPLNF         : TcmDbField read FCOMPLNF write SetCOMPLNF;
     Property DATAEMISNF      : TcmDbField read FDATAEMISNF write SetDATAEMISNF;
     Property DATAENTDEVOL    : TcmDbField read FDATAENTDEVOL write SetDATAENTDEVOL;
     Property FLGTIPONOTA     : TcmDbField read FFLGTIPONOTA write SetFLGTIPONOTA;
     Property VLRNOTAFISCAL   : TcmDbField read FVLRNOTAFISCAL write SetVLRNOTAFISCAL;
     Property IDNFREFERENCIA  : TcmDbField read FIDNFREFERENCIA write SetIDNFREFERENCIA;
     Property FLGGEROULIVRO   : TcmDbField read FFLGGEROULIVRO write SetFLGGEROULIVRO;
     Property FLGIMPRESSO     : TcmDbField read FFLGIMPRESSO write SetFLGIMPRESSO;
     // Métodos
     Constructor Create; Override;
     Function Insert :Boolean; Override;
End;
implementation

{ TDbNota }

constructor TDbNota.Create;
begin
   inherited;
   ErrorIfNoRowsAffected := False;
   TableName             := 'NFRECEBDEVOL';
   FIDNFRECEBDEVOL       := CreateCmDbField('IDNFRECEBDEVOL' ,ftFloat,True,True);
   FCODFISCAL            := CreateCmDbField('CODFISCAL'      ,ftString);
   FIDNFLIVRO            := CreateCmDbField('IDNFLIVRO'      ,ftFloat);
   FIDFORCLI             := CreateCmDbField('IDFORCLI'       ,ftFloat);
   FIDPESSOA             := CreateCmDbField('IDPESSOA'       ,ftFloat);
   FCODDOCUMENTO         := CreateCmDbField('CODDOCUMENTO'   ,ftFloat);
   FPLNCODIGO            := CreateCmDbField('PLNCODIGO'      ,ftFloat);
   FNUMNF                := CreateCmDbField('NUMNF'          ,ftFloat);
   FCOMPLNF              := CreateCmDbField('COMPLNF'        ,ftString);
   FDATAEMISNF           := CreateCmDbField('DATAEMISNF'     ,ftDateTime);
   FDATAENTDEVOL         := CreateCmDbField('DATAENTDEVOL'   ,ftDateTime);
   FFLGTIPONOTA          := CreateCmDbField('FLGTIPONOTA'    ,ftString);
   FVLRNOTAFISCAL        := CreateCmDbField('VLRNOTAFISCAL'  ,ftFloat);
   FIDNFREFERENCIA       := CreateCmDbField('IDNFREFERENCIA' ,ftFloat);
   FFLGGEROULIVRO        := CreateCmDbField('FLGGEROULIVRO'  ,ftString);
   FFLGIMPRESSO          := CreateCmDbField('FLGIMPRESSO'    ,ftString);
End;

function TDbNota.Insert: Boolean;
begin
  FIDNFRECEBDEVOL.AsFloat := GetSequence(TableName);
  Result := inherited Insert;
end;

procedure TDbNota.SetCODDOCUMENTO(const Value: TcmDbField);
begin
  FCODDOCUMENTO := Value;
end;

procedure TDbNota.SetCODFISCAL(const Value: TcmDbField);
begin
  FCODFISCAL := Value;
end;

procedure TDbNota.SetCOMPLNF(const Value: TcmDbField);
begin
  FCOMPLNF := Value;
end;

procedure TDbNota.SetDATAEMISNF(const Value: TcmDbField);
begin
  FDATAEMISNF := Value;
end;

procedure TDbNota.SetDATAENTDEVOL(const Value: TcmDbField);
begin
  FDATAENTDEVOL := Value;
end;

procedure TDbNota.SetFLGGEROULIVRO(const Value: TcmDbField);
begin
  FFLGGEROULIVRO := Value;
end;

procedure TDbNota.SetFLGIMPRESSO(const Value: TcmDbField);
begin
  FFLGIMPRESSO := Value;
end;

procedure TDbNota.SetFLGTIPONOTA(const Value: TcmDbField);
begin
  FFLGTIPONOTA := Value;
end;

procedure TDbNota.SetIDFORCLI(const Value: TcmDbField);
begin
  FIDFORCLI := Value;
end;

procedure TDbNota.SetIDNFLIVRO(const Value: TcmDbField);
begin
  FIDNFLIVRO := Value;
end;

procedure TDbNota.SetIDNFRECEBDEVOL(const Value: TcmDbField);
begin
  FIDNFRECEBDEVOL := Value;
end;

procedure TDbNota.SetIDNFREFERENCIA(const Value: TcmDbField);
begin
  FIDNFREFERENCIA := Value;
end;

procedure TDbNota.SetIDPESSOA(const Value: TcmDbField);
begin
  FIDPESSOA := Value;
end;

procedure TDbNota.SetNUMNF(const Value: TcmDbField);
begin
  FNUMNF := Value;
end;

procedure TDbNota.SetPLNCODIGO(const Value: TcmDbField);
begin
  FPLNCODIGO := Value;
end;

procedure TDbNota.SetVLRNOTAFISCAL(const Value: TcmDbField);
begin
  FVLRNOTAFISCAL := Value;
end;

end.


