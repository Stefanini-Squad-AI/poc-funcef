{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Veronica Almeida                }
{ Atualizado Em: 25/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbCompoelemdem;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbCompoelemdem = class(TCmDbObject)

  private
    FEletipocond: TCmDbField;
    FEledemcond: TCmDbField;
    FIdpatro: TCmDbField;
    FFlgoperacao: TCmDbField;
    FElementodem: TCmDbField;
    FCodcentrocusto: TCmDbField;
    FIdcompoelemdem: TCmDbField;
    FUnidnegoc: TCmDbField;
    FPlaconta: TCmDbField;
    FIdelemdemonstrat: TCmDbField;
    FPlano: TCmDbField;
    FElevalorcond: TCmDbField;
    FIdpessoa: TCmDbField;
    FElecondicao: TCmDbField;
    FCodsubconta: TCmDbField;
    FIdempresa: TCmDbField;
    FIdplanoprev: TCmDbField;
    procedure SetCodcentrocusto(const Value: TCmDbField);
    procedure SetCodsubconta(const Value: TCmDbField);
    procedure SetElecondicao(const Value: TCmDbField);
    procedure SetEledemcond(const Value: TCmDbField);
    procedure SetElementodem(const Value: TCmDbField);
    procedure SetEletipocond(const Value: TCmDbField);
    procedure SetElevalorcond(const Value: TCmDbField);
    procedure SetFlgoperacao(const Value: TCmDbField);
    procedure SetIdcompoelemdem(const Value: TCmDbField);
    procedure SetIdelemdemonstrat(const Value: TCmDbField);
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetIdpatro(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);
    procedure SetPlaconta(const Value: TCmDbField);
    procedure SetPlano(const Value: TCmDbField);
    procedure SetUnidnegoc(const Value: TCmDbField);

  public

     Property Unidnegoc: TCmDbField read FUnidnegoc write SetUnidnegoc;
     Property Plano: TCmDbField read FPlano write SetPlano;
     Property Placonta: TCmDbField read FPlaconta write SetPlaconta;
     Property Idplanoprev: TCmDbField read FIdplanoprev write SetIdplanoprev;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idpatro: TCmDbField read FIdpatro write SetIdpatro;
     Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;
     Property Idelemdemonstrat: TCmDbField read FIdelemdemonstrat write SetIdelemdemonstrat;
     Property Idcompoelemdem: TCmDbField read FIdcompoelemdem write SetIdcompoelemdem;
     Property Flgoperacao: TCmDbField read FFlgoperacao write SetFlgoperacao;
     Property Elevalorcond: TCmDbField read FElevalorcond write SetElevalorcond;
     Property Eletipocond: TCmDbField read FEletipocond write SetEletipocond;
     Property Elementodem: TCmDbField read FElementodem write SetElementodem;
     Property Eledemcond: TCmDbField read FEledemcond write SetEledemcond;
     Property Elecondicao: TCmDbField read FElecondicao write SetElecondicao;
     Property Codsubconta: TCmDbField read FCodsubconta write SetCodsubconta;
     Property Codcentrocusto: TCmDbField read FCodcentrocusto write SetCodcentrocusto;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbCompoelemdem }

constructor TDbCompoelemdem.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'COMPOELEMDEM';

   fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,False,False,False,True,'');
   fPlano := CreateCmDbField('PLANO',ftfloat,False,False,False,True,'');
   fPlaconta := CreateCmDbField('PLACONTA',ftString,False,False,False,True,'');
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fIdpatro := CreateCmDbField('IDPATRO',ftfloat,False,False,False,True,'');
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,False,False,False,True,'');
   fIdelemdemonstrat := CreateCmDbField('IDELEMDEMONSTRAT',ftfloat,False,False,False,True,'');
   fIdcompoelemdem := CreateCmDbField('IDCOMPOELEMDEM',ftfloat,True,True,False,True,'');
   fFlgoperacao := CreateCmDbField('FLGOPERACAO',ftString,False,False,False,True,'');
   fElevalorcond := CreateCmDbField('ELEVALORCOND',ftfloat,False,False,False,True,'');
   fEletipocond := CreateCmDbField('ELETIPOCOND',ftString,False,False,False,True,'');
   fElementodem := CreateCmDbField('ELEMENTODEM',ftfloat,False,False,False,True,'');
   fEledemcond := CreateCmDbField('ELEDEMCOND',ftfloat,False,False,False,True,'');
   fElecondicao := CreateCmDbField('ELECONDICAO',ftString,False,False,False,True,'');
   fCodsubconta := CreateCmDbField('CODSUBCONTA',ftfloat,False,False,False,True,'');
   fCodcentrocusto := CreateCmDbField('CODCENTROCUSTO',ftString,False,False,False,True,'');
end;

function TDbCompoelemdem.Insert: Boolean;
begin

   fIdcompoelemdem.AsFloat := GetSequence('COMPOELEMDEM');
   Result := Inherited Insert;

end;

function TDbCompoelemdem.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbCompoelemdem.SetCodcentrocusto(const Value: TCmDbField);
begin
  FCodcentrocusto := Value;
end;

procedure TDbCompoelemdem.SetCodsubconta(const Value: TCmDbField);
begin
  FCodsubconta := Value;
end;

procedure TDbCompoelemdem.SetElecondicao(const Value: TCmDbField);
begin
  FElecondicao := Value;
end;

procedure TDbCompoelemdem.SetEledemcond(const Value: TCmDbField);
begin
  FEledemcond := Value;
end;

procedure TDbCompoelemdem.SetElementodem(const Value: TCmDbField);
begin
  FElementodem := Value;
end;

procedure TDbCompoelemdem.SetEletipocond(const Value: TCmDbField);
begin
  FEletipocond := Value;
end;

procedure TDbCompoelemdem.SetElevalorcond(const Value: TCmDbField);
begin
  FElevalorcond := Value;
end;

procedure TDbCompoelemdem.SetFlgoperacao(const Value: TCmDbField);
begin
  FFlgoperacao := Value;
end;

procedure TDbCompoelemdem.SetIdcompoelemdem(const Value: TCmDbField);
begin
  FIdcompoelemdem := Value;
end;

procedure TDbCompoelemdem.SetIdelemdemonstrat(const Value: TCmDbField);
begin
  FIdelemdemonstrat := Value;
end;

procedure TDbCompoelemdem.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;

procedure TDbCompoelemdem.SetIdpatro(const Value: TCmDbField);
begin
  FIdpatro := Value;
end;

procedure TDbCompoelemdem.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbCompoelemdem.SetIdplanoprev(const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

procedure TDbCompoelemdem.SetPlaconta(const Value: TCmDbField);
begin
  FPlaconta := Value;
end;

procedure TDbCompoelemdem.SetPlano(const Value: TCmDbField);
begin
  FPlano := Value;
end;

procedure TDbCompoelemdem.SetUnidnegoc(const Value: TCmDbField);
begin
  FUnidnegoc := Value;
end;

end.



