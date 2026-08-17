{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Igor Maia                       }
{ Atualizado Em: 29/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbPrazoentrega;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbPrazoentrega = class(TCmDbObject)

  private
    FCodProcesso: TCmDbField;
    FIdProcxArt: TCmDbField;
    FPrazoEnt: TCmDbField;
    FIdForCli: TCmDbField;
    FDataEnt: TCmDbField;
    FCodMedida: TCmDbField;
    FIdPrazoEnt: TCmDbField;
    FProposta: TCmDbField;
    FQtdeEnt: TCmDbField;
    FPeriodoPrazo: TCmDbField;
    procedure SetCodMedida(const Value: TCmDbField);
    procedure SetCodProcesso(const Value: TCmDbField);
    procedure SetDataEnt(const Value: TCmDbField);
    procedure SetIdForCli(const Value: TCmDbField);
    procedure SetIdPrazoEnt(const Value: TCmDbField);
    procedure SetIdProcxArt(const Value: TCmDbField);
    procedure SetPeriodoPrazo(const Value: TCmDbField);
    procedure SetPrazoEnt(const Value: TCmDbField);
    procedure SetProposta(const Value: TCmDbField);
    procedure SetQtdeEnt(const Value: TCmDbField);

  public

     Property QtdeEnt      : TCmDbField read FQtdeEnt write SetQtdeEnt;
     Property Proposta     : TCmDbField read FProposta write SetProposta;
     Property PrazoEnt     : TCmDbField read FPrazoEnt write SetPrazoEnt;
     Property PeriodoPrazo : TCmDbField read FPeriodoPrazo write SetPeriodoPrazo;
     Property IdProcxArt   : TCmDbField read FIdProcxArt write SetIdProcxArt;
     Property IdPrazoEnt   : TCmDbField read FIdPrazoEnt write SetIdPrazoEnt;
     Property IdForCli     : TCmDbField read FIdForCli write SetIdForCli;
     Property DataEnt      : TCmDbField read FDataEnt write SetDataEnt;
     Property CodProcesso  : TCmDbField read FCodProcesso write SetCodProcesso;
     Property CodMedida    : TCmDbField read FCodMedida write SetCodMedida;

     Constructor Create(aOwner : TCmCustomCdbObject ); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbPrazoentrega }

constructor TDbPrazoentrega.Create(aOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PRAZOENTREGA';

   fQtdeent      := CreateCmDbField('QTDEENT',ftfloat,False,False,False,True,'');
   fProposta     := CreateCmDbField('PROPOSTA',ftfloat,True,True,False,True,'');
   fPrazoent     := CreateCmDbField('PRAZOENT',ftfloat,False,False,False,True,'');
   fPeriodoprazo := CreateCmDbField('PERIODOPRAZO',ftString,False,False,False,True,'');
   fIdprocxart   := CreateCmDbField('IDPROCXART',ftfloat,True,True,False,True,'');
   fIdprazoent   := CreateCmDbField('IDPRAZOENT',ftfloat,True,True,False,True,'');
   fIdforcli     := CreateCmDbField('IDFORCLI',ftfloat,True,True,False,True,'');
   fDataent      := CreateCmDbField('DATAENT',ftDateTime,False,False,False,True,'');
   fCodprocesso  := CreateCmDbField('CODPROCESSO',ftfloat,True,True,False,True,'');
   fCodmedida    := CreateCmDbField('CODMEDIDA',ftString,False,False,False,True,'');
end;

function TDbPrazoentrega.Insert: Boolean;
begin
   fIdprazoent.AsFloat := GetSequence('PRAZOENTREGA');
   Result := Inherited Insert;

end;

function TDbPrazoentrega.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbPrazoentrega.SetCodMedida(const Value: TCmDbField);
begin
  FCodMedida := Value;
end;

procedure TDbPrazoentrega.SetCodProcesso(const Value: TCmDbField);
begin
  FCodProcesso := Value;
end;

procedure TDbPrazoentrega.SetDataEnt(const Value: TCmDbField);
begin
  FDataEnt := Value;
end;

procedure TDbPrazoentrega.SetIdForCli(const Value: TCmDbField);
begin
  FIdForCli := Value;
end;

procedure TDbPrazoentrega.SetIdPrazoEnt(const Value: TCmDbField);
begin
  FIdPrazoEnt := Value;
end;

procedure TDbPrazoentrega.SetIdProcxArt(const Value: TCmDbField);
begin
  FIdProcxArt := Value;
end;

procedure TDbPrazoentrega.SetPeriodoPrazo(const Value: TCmDbField);
begin
  FPeriodoPrazo := Value;
end;

procedure TDbPrazoentrega.SetPrazoEnt(const Value: TCmDbField);
begin
  FPrazoEnt := Value;
end;

procedure TDbPrazoentrega.SetProposta(const Value: TCmDbField);
begin
  FProposta := Value;
end;

procedure TDbPrazoentrega.SetQtdeEnt(const Value: TCmDbField);
begin
  FQtdeEnt := Value;
end;

end.



