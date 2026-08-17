{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sidnei de Brito Marins          }
{ Atualizado Em: 28/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbHstcontribass;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbHstcontribass = class(TCmDbObject)

  private
      FValorrecebido: TCmDbField;
      FValoresperado: TCmDbField;
      FSitrecebimento: TCmDbField;
      FSeqproposta: TCmDbField;
      FSalsegvida: TCmDbField;
      FRubrica: TCmDbField;
      FPlncodprev: TCmDbField;
      FPlncodefet: TCmDbField;
      FNumrecebimento: TCmDbField;
      FMescobranca: TCmDbField;
      FMes: TCmDbField;
      FIdtitular: TCmDbField;
      FIdtipo: TCmDbField;
      FIdregra: TCmDbField;
      FIdplanoprev: TCmDbField;
      FIdplanass: TCmDbField;
      FIdpessjur: TCmDbField;
      FIdpagador: TCmDbField;
      FIdmotivo: TCmDbField;
      FIdlote: TCmDbField;
      FIddependente: TCmDbField;
      FIdcontass: TCmDbField;
      FFlgcobcarne: TCmDbField;
      FDataprevisao: TCmDbField;
      FData: TCmDbField;
      FCodreferencia: TCmDbField;
      FCodportforma: TCmDbField;
      FCoddocprev: TCmDbField;
      FCoddocefet: TCmDbField;
      Procedure SetValorRecebido(const Value: TCmDbField);
      Procedure SetValorEsperado(const Value: TCmDbField);
      Procedure SetSitRecebimento(const Value: TCmDbField);
      Procedure SetSeqProposta(const Value: TCmDbField);
      Procedure SetSalSegVida(const Value: TCmDbField);
      Procedure SetRubrica(const Value: TCmDbField);
      Procedure SetPlnCodPrev(const Value: TCmDbField);
      Procedure SetPlnCodEfet(const Value: TCmDbField);
      Procedure SetNumRecebimento(const Value: TCmDbField);
      Procedure SetMesCobranca(const Value: TCmDbField);
      Procedure SetMes(const Value: TCmDbField);
      Procedure SetIdTitular(const Value: TCmDbField);
      Procedure SetIdTipo(const Value: TCmDbField);
      Procedure SetIdRegra(const Value: TCmDbField);
      Procedure SetIdPlanoPrev(const Value: TCmDbField);
      Procedure SetIdPlanass(const Value: TCmDbField);
      Procedure SetIdPessJur(const Value: TCmDbField);
      Procedure SetIdPagador(const Value: TCmDbField);
      Procedure SetIdMotivo(const Value: TCmDbField);
      Procedure SetIdLote(const Value: TCmDbField);
      Procedure SetIdDependente(const Value: TCmDbField);
      Procedure SetIdContass(const Value: TCmDbField);
      Procedure SetFlgCobCarne(const Value: TCmDbField);
      Procedure SetDataPrevisao(const Value: TCmDbField);
      Procedure SetData(const Value: TCmDbField);
      Procedure SetCodReferencia(const Value: TCmDbField);
      Procedure SetCodPortForma(const Value: TCmDbField);
      Procedure SetCodDocPrev(const Value: TCmDbField);
      Procedure SetCodDocEfet(const Value: TCmDbField);

  public

     Property Valorrecebido: TCmDbField read FValorRecebido write SetValorRecebido;
     Property Valoresperado: TCmDbField read FValoresperado  write SetValoresperado;
     Property Sitrecebimento: TCmDbField read FSitrecebimento  write SetSitrecebimento;
     Property Seqproposta: TCmDbField read FSeqproposta  write SetSeqproposta;
     Property Salsegvida: TCmDbField read FSalsegvida  write SetSalsegvida;
     Property Rubrica: TCmDbField read FRubrica  write SetRubrica;
     Property Plncodprev: TCmDbField read FPlncodprev  write SetPlncodprev;
     Property Plncodefet: TCmDbField read FPlncodefet  write SetPlncodefet;
     Property Numrecebimento: TCmDbField read FNumrecebimento  write SetNumrecebimento;
     Property Mescobranca: TCmDbField read FMescobranca  write SetMescobranca;
     Property Mes: TCmDbField read FMes  write SetMes;
     Property Idtitular: TCmDbField read FIdtitular  write SetIdtitular;
     Property Idtipo: TCmDbField read FIdtipo  write SetIdtipo;
     Property Idregra: TCmDbField read FIdregra  write SetIdregra;
     Property Idplanoprev: TCmDbField read FIdplanoprev  write SetIdplanoprev;
     Property Idplanass: TCmDbField read FIdplanass  write SetIdplanass;
     Property Idpessjur: TCmDbField read FIdpessjur  write SetIdpessjur;
     Property Idpagador: TCmDbField read FIdpagador  write SetIdpagador;
     Property Idmotivo: TCmDbField read FIdmotivo  write SetIdmotivo;
     Property Idlote: TCmDbField read FIdlote  write SetIdlote;
     Property Iddependente: TCmDbField read FIddependente  write SetIddependente;
     Property Idcontass: TCmDbField read FIdcontass  write SetIdcontass;
     Property Flgcobcarne: TCmDbField read FFlgcobcarne  write SetFlgcobcarne;
     Property Dataprevisao: TCmDbField read FDataprevisao  write SetDataprevisao;
     Property Data: TCmDbField read FData  write SetData;
     Property Codreferencia: TCmDbField read FCodreferencia  write SetCodreferencia;
     Property Codportforma: TCmDbField read FCodportforma  write SetCodportforma;
     Property Coddocprev: TCmDbField read FCoddocprev  write SetCoddocprev;
     Property Coddocefet: TCmDbField read FCoddocefet  write SetCoddocefet;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbHstcontribass }

constructor TDbHstcontribass.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'HSTCONTRIBASS';

  fValorrecebido := CreateCmDbField('VALORRECEBIDO',ftfloat,True,False);
  fValoresperado := CreateCmDbField('VALORESPERADO',ftfloat,True,False);
  fSitrecebimento := CreateCmDbField('SITRECEBIMENTO',ftString,True,False);
  fSeqproposta := CreateCmDbField('SEQPROPOSTA',ftfloat,False,True);
  fSalsegvida := CreateCmDbField('SALSEGVIDA',ftfloat,True,False);
  fRubrica := CreateCmDbField('RUBRICA',ftString,True,False);
  fPlncodprev := CreateCmDbField('PLNCODPREV',ftfloat,True,False);
  fPlncodefet := CreateCmDbField('PLNCODEFET',ftfloat,True,False);
  fNumrecebimento := CreateCmDbField('NUMRECEBIMENTO',ftfloat,True,False);
  fMescobranca := CreateCmDbField('MESCOBRANCA',ftString,False,True);
  fMes := CreateCmDbField('MES',ftString,False,True);
  fIdtitular := CreateCmDbField('IDTITULAR',ftfloat,False,True);
  fIdtipo := CreateCmDbField('IDTIPO',ftString,True,False);
  fIdregra := CreateCmDbField('IDREGRA',ftfloat,True,False);
  fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,False,True);
  fIdplanass := CreateCmDbField('IDPLANASS',ftfloat,False,True);
  fIdpessjur := CreateCmDbField('IDPESSJUR',ftfloat,False,True);
  fIdpagador := CreateCmDbField('IDPAGADOR',ftfloat,True,False);
  fIdmotivo := CreateCmDbField('IDMOTIVO',ftfloat,False,True);
  fIdlote := CreateCmDbField('IDLOTE',ftfloat,True,False);
  fIddependente := CreateCmDbField('IDDEPENDENTE',ftfloat,False,True);
  fIdcontass := CreateCmDbField('IDCONTASS',ftfloat,False,True);
  fFlgcobcarne := CreateCmDbField('FLGCOBCARNE',ftfloat,True,False);
  fDataprevisao := CreateCmDbField('DATAPREVISAO',ftDateTime,True,False);
  fData := CreateCmDbField('DATA',ftDateTime,True,False);
  fCodreferencia := CreateCmDbField('CODREFERENCIA',ftString,True,False);
  fCodportforma := CreateCmDbField('CODPORTFORMA',ftfloat,True,False);
  fCoddocprev := CreateCmDbField('CODDOCPREV',ftfloat,True,False);
  fCoddocefet := CreateCmDbField('CODDOCEFET',ftfloat,True,False);
end;

function TDbHstcontribass.Insert: Boolean;
begin
  Result := Inherited Insert;
end;

function TDbHstContribass.LoadFromDB: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

procedure SetValorRecebido(const Value: TCmDbField);
begin
  FValorRecebido:=Value;
end;

procedure SetValorEsperado(const Value: TCmDbField);
begin
  FValorEsperado:=Value;
end;

procedure SetSitRecebimento(const Value: TCmDbField);
begin
  FSitRecebimento:=Value;
end;

procedure SetSeqProposta(const Value: TCmDbField);
begin
  FSeqProposta:=Value;
end;

procedure SetSalSegVida(const Value: TCmDbField);
begin
  FSalSegVida:=Value;
end;

procedure SetRubrica(const Value: TCmDbField);
begin
  FRubrica:=Value;
end;

procedure SetPlnCodPrev(const Value: TCmDbField);
begin
  FPlnCodPrev:=Value;
end;

procedure SetPlnCodEfet(const Value: TCmDbField);
begin
  FPlnCodEfet:=Value;
end;

procedure SetNumRecebimento(const Value: TCmDbField);
begin
  FNumRecebimento:=Value;
end;

procedure SetMesCobranca(const Value: TCmDbField);
begin
  FMesCobranca:=Value;
end;

procedure SetMes(const Value: TCmDbField);
begin
  FMes:=Value;
end;

procedure SetIdTitular(const Value: TCmDbField);
begin
  FIdTitular:=Value;
end;

procedure SetIdTipo(const Value: TCmDbField);
begin
  FIdTipo:=Value;
end;

procedure SetIdRegra(const Value: TCmDbField);
begin
  FIdRegra:=Value;
end;

procedure SetIdPlanoPrev(const Value: TCmDbField);
begin
  FIdPlanoPrev:=Value;
end;

procedure SetIdPlanass(const Value: TCmDbField);
begin
  FIdPlanass:=Value;
end;

procedure SetIdPessJur(const Value: TCmDbField);
begin
  FIdPessJur:=Value;
end;

procedure SetIdPagador(const Value: TCmDbField);
begin
  FIdPagador:=Value;
end;

procedure SetIdMotivo(const Value: TCmDbField);
begin
  FIdMotivo:=Value;
end;

procedure SetIdLote(const Value: TCmDbField);
begin
  FIdLote:=Value;
end;

procedure SetIdDependente(const Value: TCmDbField);
begin
  FIdDependente:=Value;
end;

procedure SetIdContass(const Value: TCmDbField);
begin
  FIdContass:=Value;
end;

procedure SetFlgCobCarne(const Value: TCmDbField);
begin
  FFlgCobCarne:=Value;
end;

procedure SetDataPrevisao(const Value: TCmDbField);
begin
  FDataPrevisao:=Value;
end;

procedure SetData(const Value: TCmDbField);
begin
  FData:=Value;
end;

procedure SetCodReferencia(const Value: TCmDbField);
begin
  FCodReferencia:=Value;
end;

procedure SetCodPortForma(const Value: TCmDbField);
begin
  FCodPortForma:=Value;
end;

procedure SetCodDocPrev(const Value: TCmDbField);
begin
  FCodDocPrev:=Value;
end;

procedure SetCodDocEfet(const Value: TCmDbField);
begin
  FCodDocEfet:=Value;
end;

end.



