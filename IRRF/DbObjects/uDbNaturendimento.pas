{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Marcos Inacio da Luz            }
{ Atualizado Em: 25/03/2002                             }
{                                                       }
{*******************************************************}

unit uDbNaturendimento;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbNaturendimento = class(TCmDbObject)

  private
    FPeriodicidade: TCmDbField;
    FCodforma: TCmDbField;
    FCodnatureza: TCmDbField;
    FRecpag: TCmDbField;
    FGrupotributo: TCmDbField;
    FIdpessoa: TCmDbField;
    FCodtiprecdes: TCmDbField;
    FDescricao: TCmDbField;
    FIdforcli: TCmDbField;
    FFlgUsadonaDCTF: TCmDbField;
    FFLGRESIDEXTERIOR: TcmDbField;
    FFLGDEPOSITOJUDIC: TcmDbField;
    FFLGUSADONADIRF: TcmDbField;
    FVARIACAO: TcmDbField;

    procedure SetCodforma(const Value: TCmDbField);
    procedure SetCodnatureza(const Value: TCmDbField);
    procedure SetCodtiprecdes(const Value: TCmDbField);
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetGrupotributo(const Value: TCmDbField);
    procedure SetIdforcli(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetPeriodicidade(const Value: TCmDbField);
    procedure SetRecpag(const Value: TCmDbField);
    procedure SetFlgUsadonaDCTF(const Value: TCmDbField);
    procedure SetFLGRESIDEXTERIOR(const Value: TcmDbField);
    procedure SetFLGDEPOSITOJUDIC(const Value: TcmDbField);
    procedure SetFLGUSADONADIRF(const Value: TcmDbField);
    procedure SetVARIACAO(const Value: TcmDbField);

  public

     Property Recpag           : TCmDbField read FRecpag           write SetRecpag;
     Property Periodicidade    : TCmDbField read FPeriodicidade    write SetPeriodicidade;
     Property Idpessoa         : TCmDbField read FIdpessoa         write SetIdpessoa;
     Property Idforcli         : TCmDbField read FIdforcli         write SetIdforcli;
     Property Grupotributo     : TCmDbField read FGrupotributo     write SetGrupotributo;
     Property Descricao        : TCmDbField read FDescricao        write SetDescricao;
     Property Codtiprecdes     : TCmDbField read FCodtiprecdes     write SetCodtiprecdes;
     Property Codnatureza      : TCmDbField read FCodnatureza      write SetCodnatureza;
     Property Codforma         : TCmDbField read FCodforma         write SetCodforma;
     Property FlgUsadonaDCTF   : TCmDbField read FFlgUsadonaDCTF   write SetFlgUsadonaDCTF;
     Property FLGRESIDEXTERIOR : TcmDbField read FFLGRESIDEXTERIOR write SetFLGRESIDEXTERIOR;
     Property FLGDEPOSITOJUDIC : TcmDbField read FFLGDEPOSITOJUDIC write SetFLGDEPOSITOJUDIC;
     Property FLGUSADONADIRF   : TcmDbField read FFLGUSADONADIRF   write SetFLGUSADONADIRF;
     Property VARIACAO         : TcmDbField read FVARIACAO         write SetVARIACAO;


     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
     Function Delete :Boolean; Override;
     Function Update :Boolean; Override;

  End;

implementation

{ TDbNaturendimento }

constructor TDbNaturendimento.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'NATURENDIMENTO';

  fRecpag           := CreateCmDbField('RECPAG',ftString,False,False,False,True,'');
  fPeriodicidade    := CreateCmDbField('PERIODICIDADE',ftString,False,False,False,True,'');
  fIdpessoa         := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
  fIdforcli         := CreateCmDbField('IDFORCLI',ftfloat,False,False,False,True,'');
  fGrupotributo     := CreateCmDbField('GRUPOTRIBUTO',ftString,False,False,False,True,'');
  fDescricao        := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'');
  fCodtiprecdes     := CreateCmDbField('CODTIPRECDES',ftString,False,False,False,True,'');
  fCodnatureza      := CreateCmDbField('CODNATUREZA',ftString,True,True,False,True,'');
  fCodforma         := CreateCmDbField('CODFORMA',ftfloat,False,False,False,True,'');
  FFlgUsadonaDCTF   := CreateCmDbField('FlgUsadonaDCTF',ftString,False,False,False,True,'');
  FFLGRESIDEXTERIOR := CreateCmDbField('FLGRESIDEXTERIOR',ftString,False,False,False,True,'');
  FFLGDEPOSITOJUDIC := CreateCmDbField('FLGDEPOSITOJUDIC',ftString,False,False,False,True,'');
  FFLGUSADONADIRF   := CreateCmDbField('FLGUSADONADIRF',ftString,False,False,False,True,'');
  FVARIACAO         := CreateCmDbField('VARIACAO',ftString,False,False,False,True,'');
end;

function TDbNaturendimento.Delete: Boolean;
begin
  FCodnatureza.AsString := Copy(FCodnatureza.AsString +'        ',1,4);
  Result := Inherited Delete;
end;

function TDbNaturendimento.Insert: Boolean;
begin

   Result := Inherited Insert;

end;

function TDbNaturendimento.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbNaturendimento.SetCodforma(const Value: TCmDbField);
begin
  FCodforma := Value;
end;

procedure TDbNaturendimento.SetCodnatureza(const Value: TCmDbField);
begin
  FCodnatureza := Value;
end;

procedure TDbNaturendimento.SetCodtiprecdes(const Value: TCmDbField);
begin
  FCodtiprecdes := Value;
end;

procedure TDbNaturendimento.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbNaturendimento.SetFlgUsadonaDCTF(const Value: TCmDbField);
begin
  FFlgUsadonaDCTF := Value;
end;

procedure TDbNaturendimento.SetFLGRESIDEXTERIOR(const Value: TcmDbField);
begin
  FFLGRESIDEXTERIOR := Value;
end;

procedure TDbNaturendimento.SetGrupotributo(const Value: TCmDbField);
begin
  FGrupotributo := Value;
end;

procedure TDbNaturendimento.SetIdforcli(const Value: TCmDbField);
begin
  FIdforcli := Value;
end;

procedure TDbNaturendimento.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbNaturendimento.SetPeriodicidade(const Value: TCmDbField);
begin
  FPeriodicidade := Value;
end;

procedure TDbNaturendimento.SetRecpag(const Value: TCmDbField);
begin
  FRecpag := Value;
end;

function TDbNaturendimento.Update: Boolean;
begin
  FCodnatureza.AsString := Copy(FCodnatureza.AsString +'        ',1,4);
  Result := Inherited Update;
end;

procedure TDbNaturendimento.SetFLGDEPOSITOJUDIC(const Value: TcmDbField);
begin
  FFLGDEPOSITOJUDIC := Value;
end;

procedure TDbNaturendimento.SetFLGUSADONADIRF(const Value: TcmDbField);
begin
  FFLGUSADONADIRF := Value;
end;

procedure TDbNaturendimento.SetVARIACAO(const Value: TcmDbField);
begin
  FVARIACAO := Value;
end;

end.



