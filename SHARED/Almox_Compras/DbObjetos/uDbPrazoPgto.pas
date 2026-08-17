{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Igor Maia                       }
{ Atualizado Em: 29/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbPrazoPgto;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbPrazoPgto = class(TCmDbObject)

  private
    FPrazoPgto: TCmDbField;
    FPercent: TCmDbField;
    FPeriodoPrazo: TCmDbField;
    FIdForCli: TCmDbField;
    FProposta: TCmDbField;
    FDataPgto: TCmDbField;
    FCodProcesso: TCmDbField;
    FIdPrazoPgto: TCmDbField;
    FIdProcxArt: TCmDbField;
    procedure SetCodProcesso(const Value: TCmDbField);
    procedure SetDataPgto(const Value: TCmDbField);
    procedure SetIdForCli(const Value: TCmDbField);
    procedure SetIdPrazoPgto(const Value: TCmDbField);
    procedure SetIdProcxArt(const Value: TCmDbField);
    procedure SetPercent(const Value: TCmDbField);
    procedure SetPeriodoPrazo(const Value: TCmDbField);
    procedure SetPrazoPgto(const Value: TCmDbField);
    procedure SetProposta(const Value: TCmDbField);

  public
     Property Proposta     : TCmDbField read FProposta write SetProposta;
     Property PrazoPgto    : TCmDbField read FPrazoPgto write SetPrazoPgto;
     Property PeriodoPrazo : TCmDbField read FPeriodoPrazo write SetPeriodoPrazo;
     Property Percent      : TCmDbField read FPercent write SetPercent;
     Property IdProcxArt   : TCmDbField read FIdProcxArt write SetIdProcxArt;
     Property IdPrazoPgto  : TCmDbField read FIdPrazoPgto write SetIdPrazoPgto;
     Property IdForCli     : TCmDbField read FIdForCli write SetIdForCli;
     Property DataPgto     : TCmDbField read FDataPgto write SetDataPgto;
     Property CodProcesso  : TCmDbField read FCodProcesso write SetCodProcesso;

     Constructor Create(aOwner : TCmCustomCdbObject ); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbPrazoPgto }

constructor TDbPrazoPgto.Create(aOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PRAZOPGTO';

  fProposta     := CreateCmDbField('PROPOSTA',ftfloat,True,True,False,True,'');
  fPrazopgto    := CreateCmDbField('PRAZOPGTO',ftfloat,False,False,False,True,'');
  fPeriodoprazo := CreateCmDbField('PERIODOPRAZO',ftString,False,False,False,True,'');
  fPercent      := CreateCmDbField('PERCENT',ftfloat,False,False,False,True,'');
  fIdprocxart   := CreateCmDbField('IDPROCXART',ftfloat,True,True,False,True,'');
  fIdprazopgto  := CreateCmDbField('IDPRAZOPGTO',ftfloat,True,True,False,True,'');
  fIdforcli     := CreateCmDbField('IDFORCLI',ftfloat,True,True,False,True,'');
  fDatapgto     := CreateCmDbField('DATAPGTO',ftDateTime,False,False,False,True,'');
  fCodprocesso  := CreateCmDbField('CODPROCESSO',ftfloat,True,True,False,True,'');
end;

function TDbPrazoPgto.Insert: Boolean;
begin
   fIdprazopgto.AsFloat := GetSequence('PRAZOPGTO');
   Result := Inherited Insert;

end;

function TDbPrazoPgto.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbPrazoPgto.SetCodProcesso(const Value: TCmDbField);
begin
  FCodProcesso := Value;
end;

procedure TDbPrazoPgto.SetDataPgto(const Value: TCmDbField);
begin
  FDataPgto := Value;
end;

procedure TDbPrazoPgto.SetIdForCli(const Value: TCmDbField);
begin
  FIdForCli := Value;
end;

procedure TDbPrazoPgto.SetIdPrazoPgto(const Value: TCmDbField);
begin
  FIdPrazoPgto := Value;
end;

procedure TDbPrazoPgto.SetIdProcxArt(const Value: TCmDbField);
begin
  FIdProcxArt := Value;
end;

procedure TDbPrazoPgto.SetPercent(const Value: TCmDbField);
begin
  FPercent := Value;
end;

procedure TDbPrazoPgto.SetPeriodoPrazo(const Value: TCmDbField);
begin
  FPeriodoPrazo := Value;
end;

procedure TDbPrazoPgto.SetPrazoPgto(const Value: TCmDbField);
begin
  FPrazoPgto := Value;
end;

procedure TDbPrazoPgto.SetProposta(const Value: TCmDbField);
begin
  FProposta := Value;
end;

end.



