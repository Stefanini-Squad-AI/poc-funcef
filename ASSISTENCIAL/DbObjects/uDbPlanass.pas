{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sidnei de Brito Marins          }
{ Atualizado Em: 28/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbPlanass;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbPlanass = class(TCmDbObject)

  private
     FTipofornserv2: TCmDbField;
     FRecpaghistrec: TCmDbField;
     FRecpaghistpag: TCmDbField;
     FOpcaobdif: TCmDbField;
     FOpcaoaident: TCmDbField;
     FNumcontrato: TCmDbField;
     FNome: TCmDbField;
     FIdregrapagamento: TCmDbField;
     FIdregrageral: TCmDbField;
     FIdregradevoljuros: TCmDbField;
     FIdregradevolcorr: TCmDbField;
     FIdregradesistenc: TCmDbField;
     FIdregracomissao: TCmDbField;
     FIdregracobranca: TCmDbField;
     FIdregracancelame: TCmDbField;
     FIdregrabeneficia: TCmDbField;
     FIdregraatrasojur: TCmDbField;
     FIdregraatrasocor: TCmDbField;
     FIdregraadmissao: TCmDbField;
     FIdregraadministr: TCmDbField;
     FIdprodass: TCmDbField;
     FIdplanass: TCmDbField;
     FIdpessoa: TCmDbField;
     FIdfornserv2: TCmDbField;
     FIdfornserv: TCmDbField;
     FFlgopcaob: TCmDbField;
     FFlgopcaoa: TCmDbField;
     FFlgfechado: TCmDbField;
     FFlgativo: TCmDbField;
     FDatainiciovigenc: TCmDbField;
     FDatainiciocom: TCmDbField;
     FComissfund: TCmDbField;
     FComissforn: TCmDbField;
     FCodtiprechistpag: TCmDbField;
     FCodtiporechistrec: TCmDbField;
     FCodtipodochistrec: TCmDbField;
     FCodtipodochistpag: TCmDbField;
     FCodportforma: TCmDbField;
     Procedure SetTipofornserv2(const Value: TCmDbField);
     Procedure SetRecpaghistrec(const Value: TCmDbField);
     Procedure SetRecpaghistpag(const Value: TCmDbField);
     Procedure SetOpcaobdif(const Value: TCmDbField);
     Procedure SetOpcaoaident(const Value: TCmDbField);
     Procedure SetNumcontrato(const Value: TCmDbField);
     Procedure SetNome(const Value: TCmDbField);
     Procedure SetIdregrapagamento(const Value: TCmDbField);
     Procedure SetIdregrageral(const Value: TCmDbField);
     Procedure SetIdregradevoljuros(const Value: TCmDbField);
     Procedure SetIdregradevolcorr(const Value: TCmDbField);
     Procedure SetIdregradesistenc(const Value: TCmDbField);
     Procedure SetIdregracomissao(const Value: TCmDbField);
     Procedure SetIdregracobranca(const Value: TCmDbField);
     Procedure SetIdregracancelame(const Value: TCmDbField);
     Procedure SetIdregrabeneficia(const Value: TCmDbField);
     Procedure SetIdregraatrasojur(const Value: TCmDbField);
     Procedure SetIdregraatrasocor(const Value: TCmDbField);
     Procedure SetIdregraadmissao(const Value: TCmDbField);
     Procedure SetIdregraadministr(const Value: TCmDbField);
     Procedure SetIdprodass(const Value: TCmDbField);
     Procedure SetIdplanass(const Value: TCmDbField);
     Procedure SetIdpessoa(const Value: TCmDbField);
     Procedure SetIdfornserv2(const Value: TCmDbField);
     Procedure SetIdfornserv(const Value: TCmDbField);
     Procedure SetFlgopcaob(const Value: TCmDbField);
     Procedure SetFlgopcaoa(const Value: TCmDbField);
     Procedure SetFlgfechado(const Value: TCmDbField);
     Procedure SetFlgativo(const Value: TCmDbField);
     Procedure SetDatainiciovigenc(const Value: TCmDbField);
     Procedure SetDatainiciocom: TCmDbProcedure Setield;
     Procedure SetComissfund(const Value: TCmDbField);
     Procedure SetComissforn(const Value: TCmDbField);
     Procedure SetCodtiprechistpag(const Value: TCmDbField);
     Procedure SetCodtiporechistrec(const Value: TCmDbField);
     Procedure SetCodtipodochistrec(const Value: TCmDbField);
     Procedure SetCodtipodochistpag(const Value: TCmDbField);
     Procedure SetCodportforma(const Value: TCmDbField);

  public

     Property Tipofornserv2: TCmDbField read FTipofornserv2  write SetTipofornserv2;
     Property Recpaghistrec: TCmDbField read FRecpaghistrec  write SetRecpaghistrec;
     Property Recpaghistpag: TCmDbField read FRecpaghistpag  write SetRecpaghistpag;
     Property Opcaobdif: TCmDbField read FOpcaobdif  write SetOpcaobdif;
     Property Opcaoaident: TCmDbField read FOpcaoaident  write SetOpcaoaident;
     Property Numcontrato: TCmDbField read FNumcontrato  write SetNumcontrato;
     Property Nome: TCmDbField read FNome  write SetNome;
     Property Idregrapagamento: TCmDbField read FIdregrapagamento  write SetIdregrapagamento;
     Property Idregrageral: TCmDbField read FIdregrageral  write SetIdregrageral;
     Property Idregradevoljuros: TCmDbField read FIdregradevoljuros  write SetIdregradevoljuros;
     Property Idregradevolcorr: TCmDbField read FIdregradevolcorr  write SetIdregradevolcorr;
     Property Idregradesistenc: TCmDbField read FIdregradesistenc  write SetIdregradesistenc;
     Property Idregracomissao: TCmDbField read FIdregracomissao  write SetIdregracomissao;
     Property Idregracobranca: TCmDbField read FIdregracobranca  write SetIdregracobranca;
     Property Idregracancelame: TCmDbField read FIdregracancelame  write SetIdregracancelame;
     Property Idregrabeneficia: TCmDbField read FIdregrabeneficia  write SetIdregrabeneficia;
     Property Idregraatrasojur: TCmDbField read FIdregraatrasojur  write SetIdregraatrasojur;
     Property Idregraatrasocor: TCmDbField read FIdregraatrasocor  write SetIdregraatrasocor;
     Property Idregraadmissao: TCmDbField read FIdregraadmissao  write SetIdregraadmissao;
     Property Idregraadministr: TCmDbField read FIdregraadministr  write SetIdregraadministr;
     Property Idprodass: TCmDbField read FIdprodass  write SetIdprodass;
     Property Idplanass: TCmDbField read FIdplanass  write SetIdplanass;
     Property Idpessoa: TCmDbField read FIdpessoa  write SetIdpessoa;
     Property Idfornserv2: TCmDbField read FIdfornserv2  write SetIdfornserv2;
     Property Idfornserv: TCmDbField read FIdfornserv  write SetIdfornserv;
     Property Flgopcaob: TCmDbField read FFlgopcaob  write SetFlgopcaob;
     Property Flgopcaoa: TCmDbField read FFlgopcaoa  write SetFlgopcaoa;
     Property Flgfechado: TCmDbField read FFlgfechado  write SetFlgfechado;
     Property Flgativo: TCmDbField read FFlgativo  write SetFlgativo;
     Property Datainiciovigenc: TCmDbField read FDatainiciovigenc  write SetDatainiciovigenc;
     Property Datainiciocom: TCmDbField read FDatainiciocom  write SetDatainiciocom;
     Property Comissfund: TCmDbField read FComissfund  write SetComissfund;
     Property Comissforn: TCmDbField read FComissforn  write SetComissforn;
     Property Codtiprechistpag: TCmDbField read FCodtiprechistpag  write SetCodtiprechistpag;
     Property Codtiporechistrec: TCmDbField read FCodtiporechistrec  write SetCodtiporechistrec;
     Property Codtipodochistrec: TCmDbField read FCodtipodochistrec  write SetCodtipodochistrec;
     Property Codtipodochistpag: TCmDbField read FCodtipodochistpag  write SetCodtipodochistpag;
     Property Codportforma: TCmDbField read FCodportforma  write SetCodportforma;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbPlanass }

constructor TDbPlanass.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PLANASS';

  fTipofornserv2 := CreateCmDbField('TIPOFORNSERV2',ftString,True,False);
  fRecpaghistrec := CreateCmDbField('RECPAGHISTREC',ftString,True,False);
  fRecpaghistpag := CreateCmDbField('RECPAGHISTPAG',ftString,True,False);
  fOpcaobdif := CreateCmDbField('OPCAOBDIF',ftString,True,False);
  fOpcaoaident := CreateCmDbField('OPCAOAIDENT',ftString,True,False);
  fNumcontrato := CreateCmDbField('NUMCONTRATO',ftfloat,True,False);
  fNome := CreateCmDbField('NOME',ftString,True,False);
  fIdregrapagamento := CreateCmDbField('IDREGRAPAGAMENTO',ftfloat,True,False);
  fIdregrageral := CreateCmDbField('IDREGRAGERAL',ftfloat,True,False);
  fIdregradevoljuros := CreateCmDbField('IDREGRADEVOLJUROS',ftfloat,True,False);
  fIdregradevolcorr := CreateCmDbField('IDREGRADEVOLCORR',ftfloat,True,False);
  fIdregradesistenc := CreateCmDbField('IDREGRADESISTENC',ftfloat,True,False);
  fIdregracomissao := CreateCmDbField('IDREGRACOMISSAO',ftfloat,True,False);
  fIdregracobranca := CreateCmDbField('IDREGRACOBRANCA',ftfloat,True,False);
  fIdregracancelame := CreateCmDbField('IDREGRACANCELAME',ftfloat,True,False);
  fIdregrabeneficia := CreateCmDbField('IDREGRABENEFICIA',ftfloat,True,False);
  fIdregraatrasojur := CreateCmDbField('IDREGRAATRASOJUR',ftfloat,True,False);
  fIdregraatrasocor := CreateCmDbField('IDREGRAATRASOCOR',ftfloat,True,False);
  fIdregraadmissao := CreateCmDbField('IDREGRAADMISSAO',ftfloat,True,False);
  fIdregraadministr := CreateCmDbField('IDREGRAADMINISTR',ftfloat,True,False);
  fIdprodass := CreateCmDbField('IDPRODASS',ftfloat,True,False);
  fIdplanass := CreateCmDbField('IDPLANASS',ftfloat,False,True);
  fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,False);
  fIdfornserv2 := CreateCmDbField('IDFORNSERV2',ftfloat,True,False);
  fIdfornserv := CreateCmDbField('IDFORNSERV',ftfloat,True,False);
  fFlgopcaob := CreateCmDbField('FLGOPCAOB',ftfloat,True,False);
  fFlgopcaoa := CreateCmDbField('FLGOPCAOA',ftfloat,True,False);
  fFlgfechado := CreateCmDbField('FLGFECHADO',ftfloat,True,False);
  fFlgativo := CreateCmDbField('FLGATIVO',ftfloat,True,False);
  fDatainiciovigenc := CreateCmDbField('DATAINICIOVIGENC',ftDateTime,True,False);
  fDatainiciocom := CreateCmDbField('DATAINICIOCOM',ftDateTime,True,False);
  fComissfund := CreateCmDbField('COMISSFUND',ftfloat,True,False);
  fComissforn := CreateCmDbField('COMISSFORN',ftfloat,True,False);
  fCodtiprechistpag := CreateCmDbField('CODTIPRECHISTPAG',ftString,True,False);
  fCodtiporechistrec := CreateCmDbField('CODTIPORECHISTREC',ftString,True,False);
  fCodtipodochistrec := CreateCmDbField('CODTIPODOCHISTREC',ftfloat,True,False);
  fCodtipodochistpag := CreateCmDbField('CODTIPODOCHISTPAG',ftfloat,True,False);
  fCodportforma := CreateCmDbField('CODPORTFORMA',ftfloat,True,False);
end;

function TDbPlanass.Insert: Boolean;
begin
  fIdplanass.AsFloat := GetSequence('PLANASS');
  Result := Inherited Insert;
end;

function TDbPlanass.LoadFromDB: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

procedure SetTipoFornServ2(const Value: TCmDbField);
begin
  FTipoFornServ2:=Value;
end;

procedure SetRecPagHistRec(const Value: TCmDbField);
begin
  FRecPagHistRec:=Value;
end;

procedure SetRecPagHistPag(const Value: TCmDbField);
begin
  FRecPagHistPag:=Value;
end;

procedure SetOpcaoBDif(const Value: TCmDbField);
begin
  FOpcaoBDif:=Value;
end;

procedure SetOpcaoAident(const Value: TCmDbField);
begin
  FOpcaoAident:=Value;
end;

procedure SetNumContrato(const Value: TCmDbField);
begin
  FNumContrato:=Value;
end;

procedure SetNome(const Value: TCmDbField);
begin
  FNome:=Value;
end;

procedure SetIdRegraPagamento(const Value: TCmDbField);
begin
  FIdRegraPagamento:=Value;
end;

procedure SetIdRegraGeral(const Value: TCmDbField);
begin
  FIdRegraGeral:=Value;
end;

procedure SetIdRegraDevolJuros(const Value: TCmDbField);
begin
  FIdRegraDevolJuros:=Value;
end;

procedure SetIdRegraDevolCorr(const Value: TCmDbField);
begin
  FIdRegraDevolCorr:=Value;
end;

procedure SetIdRegraDesistenc(const Value: TCmDbField);
begin
  FIdRegraDesistenc:=Value;
end;

procedure SetIdRegraComissao(const Value: TCmDbField);
begin
  FIdRegraComissao:=Value;
end;

procedure SetIdRegraCobranca(const Value: TCmDbField);
begin
  FIdRegraCobranca:=Value;
end;

procedure SetIdRegraCancelame(const Value: TCmDbField);
begin
  FIdRegraCancelame:=Value;
end;

procedure SetIdRegraBeneficia(const Value: TCmDbField);
begin
  FIdRegraBeneficia:=Value;
end;

procedure SetIdRegraAtrasoJur(const Value: TCmDbField);
begin
  FIdRegraAtrasoJur:=Value;
end;

procedure SetIdRegraAtrasoCor(const Value: TCmDbField);
begin
  FIdRegraAtrasoCor:=Value;
end;

procedure SetIdRegraAdmissao(const Value: TCmDbField);
begin
  FIdRegraAdmissao:=Value;
end;

procedure SetIdRegraAdministr(const Value: TCmDbField);
begin
  FIdRegraAdministr:=Value;
end;

procedure SetIdProdass(const Value: TCmDbField);
begin
  FIdProdass:=Value;
end;

procedure SetIdPlanass(const Value: TCmDbField);
begin
  FIdPlanass:=Value;
end;

procedure SetIdPessoa(const Value: TCmDbField);
begin
  FIdPessoa:=Value;
end;

procedure SetIdFornServ2(const Value: TCmDbField);
begin
  FIdFornServ2:=Value;
end;

procedure SetIdFornServ(const Value: TCmDbField);
begin
  FIdFornServ:=Value;
end;

procedure SetFlgOpcaoB(const Value: TCmDbField);
begin
  FFlgOpcaoB:=Value;
end;

procedure SetFlgOpcaoA(const Value: TCmDbField);
begin
  FFlgOpcaoA:=Value;
end;

procedure SetFlgFechado(const Value: TCmDbField);
begin
  FFlgFechado:=Value;
end;

procedure SetFlgAtivo(const Value: TCmDbField);
begin
  FFlgAtivo:=Value;
end;

procedure SetDataInicioVigenc(const Value: TCmDbField);
begin
  FDataInicioVigenc:=Value;
end;

procedure SetDataInicioCom(const Value: TCmDbField);
begin
  FDataInicioCom:=Value;
end;

procedure SetComissFund(const Value: TCmDbField);
begin
  FComissFund:=Value;
end;

procedure SetComissForn(const Value: TCmDbField);
begin
  FComissForn:=Value;
end;

procedure SetCodTipRecHistPag(const Value: TCmDbField);
begin
  FCodTipRecHistPag:=Value;
end;

procedure SetCodTipoRecHistRec(const Value: TCmDbField);
begin
  FCodTipoRecHistRec:=Value;
end;

procedure SetCodTipoDocHistRec(const Value: TCmDbField);
begin
  FCodTipoDocHistRec:=Value;
end;

procedure SetCodTipoDocHistPag(const Value: TCmDbField);
begin
  FCodTipoDocHistPag:=Value;
end;

procedure SetCodPortForma(const Value: TCmDbField);
begin
  FCodPortForma:=Value;
end;

end.



