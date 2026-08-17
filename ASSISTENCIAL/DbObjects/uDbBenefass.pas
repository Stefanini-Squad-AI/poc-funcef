{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sidnei de Brito Marins          }
{ Atualizado Em: 28/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbBenefass;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbBenefass = class(TCmDbObject)

  private
     FTipo: TCmDbField;
     FSeqProposta: TCmDbField;
     FResponsavelPag: TCmDbField;
     FPercPagmto: TCmDbField;
     FObsCancel: TCmDbField;
     FIdTitular: TCmDbField;
     FIdPlanoprev: TCmDbField;
     FIdPlanass: TCmDbField;
     FIdPessjur: TCmDbField;
     FIdDependente: TCmDbField;
     FFlgAtivo: TCmDbField;
     FDtCancelamento: TCmDbField;
     FDataEntrada: TCmDbField;
     procedure SetTipo(const Value: TCmDbField);
     procedure SetSeqProposta(const Value: TCmDbField);
     procedure SetResponsavelPag(const Value: TCmDbField);
     procedure SetPercPagmto(const Value: TCmDbField);
     procedure SetObsCancel(const Value: TCmDbField);
     procedure SetIdTitular(const Value: TCmDbField);
     procedure SetIdPlanoPrev(const Value: TCmDbField);
     procedure SetIdPlanass(const Value: TCmDbField);
     procedure SetIdPessJur(const Value: TCmDbField);
     procedure SetIdDependente(const Value: TCmDbField);
     procedure SetFlgAtivo(const Value: TCmDbField);
     procedure SetDtCancelamento(const Value: TCmDbField);
     procedure SetDataEntrada(const Value: TCmDbField);

  public
     Property Tipo: TCmDbField read FTipo write SetTipo;
     Property SeqProposta: TCmDbField read FSeqProposta write SetSeqProposta;
     Property ResponsavelPag: TCmDbField read FResponsavelPag write SetResponsavelPag;
     Property PercPagmto: TCmDbField read FPercPagmto write SetPercPagmto;
     Property ObsCancel: TCmDbField read FObsCancel write SetObsCancel;
     Property IdTitular: TCmDbField read FIdTitular write SetIdTitular;
     Property IdPlanoprev: TCmDbField read FIdPlanoPrev write SetIdPlanoPrev;
     Property IdPlanass: TCmDbField read FIdPlanass write SetIdPlanass;
     Property IdPessjur: TCmDbField read FIdPessJur write SetIdPessJur;
     Property IdDependente: TCmDbField read FIdDependente write SetIdDependente;
     Property FlgAtivo: TCmDbField read FFlgAtivo write SetFlgAtivo;
     Property DtCancelamento: TCmDbField read FDtCancelamento write SetDtCancelamento;
     Property DataEntrada: TCmDbField read FDataEntrada write SetDataEntrada;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbBenefass }

constructor TDbBenefass.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'BENEFASS';

  fTipo := CreateCmDbField('TIPO',ftString,True,False);
  fSeqProposta := CreateCmDbField('SEQPROPOSTA',ftfloat,False,True);
  fResponsavelPag := CreateCmDbField('RESPONSAVELPAG',ftfloat,False,False);
  fPercPagmto := CreateCmDbField('PERCPAGMTO',ftfloat,True,False);
  fObsCancel := CreateCmDbField('OBSCANCEL',ftString,True,False);
  fIdTitular := CreateCmDbField('IDTITULAR',ftfloat,False,True);
  fIdPlanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,False,True);
  fIdPlanass := CreateCmDbField('IDPLANASS',ftfloat,False,True);
  fIdPessJur := CreateCmDbField('IDPESSJUR',ftfloat,False,True);
  fIdDependente := CreateCmDbField('IDDEPENDENTE',ftfloat,False,True);
  fFlgAtivo := CreateCmDbField('FLGATIVO',ftfloat,True,False);
  fDtCancelamento := CreateCmDbField('DTCANCELAMENTO',ftDateTime,True,False);
  fDataEntrada := CreateCmDbField('DATAENTRADA',ftDateTime,False,False);

  IDTITULAR.Required:=True;
  IDPESSJUR.Required:=True;
  IDPESSJUR.Required:=True;
  IDPLANOPREV.Required:=True;
  IDPLANASS.Required:=True;
  IDDEPENDENTE.Required:=True;
  TIPO.Required:=False;
  SEQPROPOSTA.Required:=True;
  RESPONSAVELPAG.Required:=True;
  DATAENTRADA.Required:=True;

  TIPO.Required:=False;
  PERCPAGMTO.Required:=False;
  FLGATIVO.Required:=False;
  DTCANCELAMENTO.Required:=False;
  OBSCANCEL.Required:=False;

  PERCPAGMTO.NullIfZero:=True;
  FLGATIVO.NullIfZero:=True;
end;

function TDbBenefass.Insert: Boolean;
begin
  Result := Inherited Insert;
end;

function TDbBenefass.LoadFromDB: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

procedure TDbBenefass.SetTipo(const Value: TCmDbField);
begin
  FTipo:=Value;
end;

procedure TDbBenefass.SetSeqProposta(const Value: TCmDbField);
begin
  FSeqProposta:=Value;
end;

procedure TDbBenefass.SetResponsavelPag(const Value: TCmDbField);
begin
  FResponsavelPag:=Value;
end;

procedure TDbBenefass.SetPercPagmto(const Value: TCmDbField);
begin
  FPercPagmto:=Value;
end;

procedure TDbBenefass.SetObsCancel(const Value: TCmDbField);
begin
  FObsCancel:=Value;
end;

procedure TDbBenefass.SetIdTitular(const Value: TCmDbField);
begin
  FIdTitular:=Value;
end;

procedure TDbBenefass.SetIdPlanoPrev(const Value: TCmDbField);
begin
  FIdPlanoPrev:=Value;
end;

procedure TDbBenefass.SetIdPlanass(const Value: TCmDbField);
begin
  FIdPlanass :=Value;
end;

procedure TDbBenefass.SetIdPessJur(const Value: TCmDbField);
begin
  FIdPessJur:=Value;
end;

procedure TDbBenefass.SetIdDependente(const Value: TCmDbField);
begin
  FIdDependente:=Value;
end;

procedure TDbBenefass.SetFlgAtivo(const Value: TCmDbField);
begin
  FFlgAtivo:=Value;
end;

procedure TDbBenefass.SetDtCancelamento(const Value: TCmDbField);
begin
  FDtCancelamento:=Value;
end;

procedure TDbBenefass.SetDataEntrada(const Value: TCmDbField);
begin
  FDataEntrada:=Value;
end;

end.

