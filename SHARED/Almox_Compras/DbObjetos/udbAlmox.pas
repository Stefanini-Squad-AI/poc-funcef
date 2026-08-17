unit udbAlmox;

interface

Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TdbAlmox = class(TCmDbObject)

  private
    FCONTABIL: TCmDbField;
    FCODCUSTEIO: TCmDbField;
    FCODALMOXARIFADO: TCmDbField;
    FCODCENTROCUSTO: TCmDbField;
    FDESCALMOX: TCmDbField;
    FIDPESSOA: TCmDbField;
    FIDEMPRESA: TCmDbField;
    FPRINCIPSECUND: TCmDbField;
    procedure SetCODALMOXARIFADO(const Value: TCmDbField);
    procedure SetCODCENTROCUSTO(const Value: TCmDbField);
    procedure SetCODCUSTEIO(const Value: TCmDbField);
    procedure SetCONTABIL(const Value: TCmDbField);
    procedure SetDESCALMOX(const Value: TCmDbField);
    procedure SetIDEMPRESA(const Value: TCmDbField);
    procedure SetIDPESSOA(const Value: TCmDbField);
    procedure SetPRINCIPSECUND(const Value: TCmDbField);

  public
     //Define os CMDbFields da classe de persistência de acordo com os campos da tabela
     Property CODALMOXARIFADO : TCmDbField read FCODALMOXARIFADO write SetCODALMOXARIFADO;
     Property CODCUSTEIO      : TCmDbField read FCODCUSTEIO write SetCODCUSTEIO;
     Property IDPESSOA        : TCmDbField read FIDPESSOA write SetIDPESSOA;
     Property CODCENTROCUSTO  : TCmDbField read FCODCENTROCUSTO write SetCODCENTROCUSTO;
     Property IDEMPRESA       : TCmDbField read FIDEMPRESA write SetIDEMPRESA;
     Property DESCALMOX       : TCmDbField read FDESCALMOX write SetDESCALMOX;
     Property PRINCIPSECUND   : TCmDbField read FPRINCIPSECUND write SetPRINCIPSECUND;
     Property CONTABIL        : TCmDbField read FCONTABIL write SetCONTABIL;
     //
     Constructor Create(aOwner : TCmCustomCdbObject ); Override;
     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;

  End;

implementation

{ TdbAlmox }

constructor TdbAlmox.Create(aOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName             := 'ALMOX';

  FCODALMOXARIFADO      := CreateCmDbField('CODALMOXARIFADO' ,ftFloat,True,True);
  FCONTABIL             := CreateCmDbField('CONTABIL'        ,ftString);
  FCODCUSTEIO           := CreateCmDbField('CODCUSTEIO'      ,ftInteger);
  FCODCENTROCUSTO       := CreateCmDbField('CODCENTROCUSTO'  ,ftString);
  FDESCALMOX            := CreateCmDbField('DESCALMOX'       ,ftString);
  FIDPESSOA             := CreateCmDbField('IDPESSOA'        ,ftInteger);
  FIDEMPRESA            := CreateCmDbField('IDEMPRESA'       ,ftInteger);
  FPRINCIPSECUND        := CreateCmDbField('PRINCIPSECUND'   ,ftString);
end;

function TdbAlmox.Insert: Boolean;
begin
  FCODALMOXARIFADO.AsFloat := GetSequence(TableName);

  Result := inherited Insert;
end;

function TdbAlmox.LoadFromDb: Boolean;
begin
  Result := True;
end;

procedure TdbAlmox.SetCODALMOXARIFADO(const Value: TCmDbField);
begin
  FCODALMOXARIFADO := Value;
end;

procedure TdbAlmox.SetCODCENTROCUSTO(const Value: TCmDbField);
begin
  FCODCENTROCUSTO := Value;
end;

procedure TdbAlmox.SetCODCUSTEIO(const Value: TCmDbField);
begin
  FCODCUSTEIO := Value;
end;

procedure TdbAlmox.SetCONTABIL(const Value: TCmDbField);
begin
  FCONTABIL := Value;
end;

procedure TdbAlmox.SetDESCALMOX(const Value: TCmDbField);
begin
  FDESCALMOX := Value;
end;

procedure TdbAlmox.SetIDEMPRESA(const Value: TCmDbField);
begin
  FIDEMPRESA := Value;
end;

procedure TdbAlmox.SetIDPESSOA(const Value: TCmDbField);
begin
  FIDPESSOA := Value;
end;

procedure TdbAlmox.SetPRINCIPSECUND(const Value: TCmDbField);
begin
  FPRINCIPSECUND := Value;
end;

end.
