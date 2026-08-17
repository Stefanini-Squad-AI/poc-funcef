{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Igor                            }
{ Atualizado Em: 20/11/2001                             }
{                                                       }
{*******************************************************}

unit uDbRADProcesso;

interface
Uses uCmDbObject, uSistema, DB, uDataBase,uCmCustomCdbObject;

Type
  TDbRADProcesso = class(TCmDbObject)

  private
    FIdtipoprocesso: TCmDbField;
    FDatafimprev: TCmDbField;
    FIdusuario: TCmDbField;
    FCodcentrocusto: TCmDbField;
    FIdempresa: TCmDbField;
    FObs: TCmDbField;
    FCodcentrorespon: TCmDbField;
    FCodgrupoprod: TCmDbField;
    FUnidnegoc: TCmDbField;
    FIdpessresp: TCmDbField;
    FIdpessoa: TCmDbField;
    FIdprocesso: TCmDbField;
    FDatafimprocesso: TCmDbField;
    FVlrproc: TCmDbField;
    FFlgok: TCmDbField;
    FDatainiprocesso: TCmDbField;
    procedure SetCodcentrocusto(const Value: TCmDbField);
    procedure SetCodcentrorespon(const Value: TCmDbField);
    procedure SetCodgrupoprod(const Value: TCmDbField);
    procedure SetDatafimprev(const Value: TCmDbField);
    procedure SetDatafimprocesso(const Value: TCmDbField);
    procedure SetDatainiprocesso(const Value: TCmDbField);
    procedure SetFlgok(const Value: TCmDbField);
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdpessresp(const Value: TCmDbField);
    procedure SetIdprocesso(const Value: TCmDbField);
    procedure SetIdtipoprocesso(const Value: TCmDbField);
    procedure SetIdusuario(const Value: TCmDbField);
    procedure SetObs(const Value: TCmDbField);
    procedure SetUnidnegoc(const Value: TCmDbField);
    procedure SetVlrproc(const Value: TCmDbField);

  public

     Property Vlrproc: TCmDbField read FVlrproc write SetVlrproc;
     Property Unidnegoc: TCmDbField read FUnidnegoc write SetUnidnegoc;
     Property Obs: TCmDbField read FObs write SetObs;
     Property Idusuario: TCmDbField read FIdusuario write SetIdusuario;
     Property Idtipoprocesso: TCmDbField read FIdtipoprocesso write SetIdtipoprocesso;
     Property Idprocesso: TCmDbField read FIdprocesso write SetIdprocesso;
     Property Idpessresp: TCmDbField read FIdpessresp write SetIdpessresp;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;
     Property Flgok: TCmDbField read FFlgok write SetFlgok;
     Property Datainiprocesso: TCmDbField read FDatainiprocesso write SetDatainiprocesso;
     Property Datafimprocesso: TCmDbField read FDatafimprocesso write SetDatafimprocesso;
     Property Datafimprev: TCmDbField read FDatafimprev write SetDatafimprev;
     Property Codgrupoprod: TCmDbField read FCodgrupoprod write SetCodgrupoprod;
     Property Codcentrorespon: TCmDbField read FCodcentrorespon write SetCodcentrorespon;
     Property Codcentrocusto: TCmDbField read FCodcentrocusto write SetCodcentrocusto;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbRADProcesso }

constructor TDbRADProcesso.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'RADINSTPROCESSO';

   fIdprocesso      := CreateCmDbField('IDPROCESSO',ftfloat,False,True);
   fVlrproc         := CreateCmDbField('VLRPROC',ftfloat,False,False,False,False);
   fUnidnegoc       := CreateCmDbField('UNIDNEGOC',ftfloat,False,False);
   fObs             := CreateCmDbField('OBS',ftString,True,False);
   fIdusuario       := CreateCmDbField('IDUSUARIO',ftfloat,True,False);
   fIdtipoprocesso  := CreateCmDbField('IDTIPOPROCESSO',ftfloat,True,False);
   fIdpessresp      := CreateCmDbField('IDPESSRESP',ftfloat,False,False);
   fIdpessoa        := CreateCmDbField('IDPESSOA',ftfloat,True,False);
   fIdempresa       := CreateCmDbField('IDEMPRESA',ftfloat,False,False);
   fFlgok           := CreateCmDbField('FLGOK',ftString,False,False);
   fDatainiprocesso := CreateCmDbField('DATAINIPROCESSO',ftDateTime,False,False);
   fDatafimprocesso := CreateCmDbField('DATAFIMPROCESSO',ftDateTime,False,False);
   fDatafimprev     := CreateCmDbField('DATAFIMPREV',ftDateTime,False,False);
   fCodgrupoprod    := CreateCmDbField('CODGRUPOPROD',ftString,False,False);
   fCodcentrorespon := CreateCmDbField('CODCENTRORESPON',ftString,False,False);
   fCodcentrocusto  := CreateCmDbField('CODCENTROCUSTO',ftString,False,False);
end;

function TDbRADProcesso.Insert: Boolean;
begin
   fIdprocesso.AsFloat := GetSequence('RADINSTPROCESSO');
   Result := Inherited Insert;

end;

function TDbRADProcesso.LoadFromDb: Boolean;
begin
   Result := Inherited LoadFromDb;
end;

procedure TDbRADProcesso.SetCodcentrocusto(const Value: TCmDbField);
begin
  FCodcentrocusto := Value;
end;

procedure TDbRADProcesso.SetCodcentrorespon(const Value: TCmDbField);
begin
  FCodcentrorespon := Value;
end;

procedure TDbRADProcesso.SetCodgrupoprod(const Value: TCmDbField);
begin
  FCodgrupoprod := Value;
end;

procedure TDbRADProcesso.SetDatafimprev(const Value: TCmDbField);
begin
  FDatafimprev := Value;
end;

procedure TDbRADProcesso.SetDatafimprocesso(const Value: TCmDbField);
begin
  FDatafimprocesso := Value;
end;

procedure TDbRADProcesso.SetDatainiprocesso(const Value: TCmDbField);
begin
  FDatainiprocesso := Value;
end;

procedure TDbRADProcesso.SetFlgok(const Value: TCmDbField);
begin
  FFlgok := Value;
end;

procedure TDbRADProcesso.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;

procedure TDbRADProcesso.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbRADProcesso.SetIdpessresp(const Value: TCmDbField);
begin
  FIdpessresp := Value;
end;

procedure TDbRADProcesso.SetIdprocesso(const Value: TCmDbField);
begin
  FIdprocesso := Value;
end;

procedure TDbRADProcesso.SetIdtipoprocesso(const Value: TCmDbField);
begin
  FIdtipoprocesso := Value;
end;

procedure TDbRADProcesso.SetIdusuario(const Value: TCmDbField);
begin
  FIdusuario := Value;
end;

procedure TDbRADProcesso.SetObs(const Value: TCmDbField);
begin
  FObs := Value;
end;

procedure TDbRADProcesso.SetUnidnegoc(const Value: TCmDbField);
begin
  FUnidnegoc := Value;
end;

procedure TDbRADProcesso.SetVlrproc(const Value: TCmDbField);
begin
  FVlrproc := Value;
end;

end.



