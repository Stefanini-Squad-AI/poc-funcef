{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 17/07/2002                             }
{                                                       }
{*******************************************************}

unit uDbPatro;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase, uCMSqlParams;

Type
  TDbPatro = class(TCmDbObject)

  private
    FCodsubconta: TCmDbField;
    FMesfechaemptmo: TCmDbField;
    FFlgobrigaop1: TCmDbField;
    FMascmatricula: TCmDbField;
    FCodigo: TCmDbField;
    FFlgobrigaop3: TCmDbField;
    FMesfechafolhaep: TCmDbField;
    FNomevalorbase3: TCmDbField;
    FIdempresaprop: TCmDbField;
    FAnofechaemptmo: TCmDbField;
    FNomevalorbase2: TCmDbField;
    FFlgpagamento: TCmDbField;
    FIdrubsalparticip: TCmDbField;
    FIdrubsalbaseinss: TCmDbField;
    FIdregracalcsalpa: TCmDbField;
    FFlganteriorfolha: TCmDbField;
    FFlgmesfolha: TCmDbField;
    FMescobranca13: TCmDbField;
    FFlgano13: TCmDbField;
    FFormabaixa: TCmDbField;
    FFlgaceitanaoid: TCmDbField;
    FCodcentrorespon: TCmDbField;
    FIdfundacao: TCmDbField;
    FFlginfextrato: TCmDbField;
    FFlgobrigaop2: TCmDbField;
    FAnofechapatroep: TCmDbField;
    FClassetippatro: TCmDbField;
    FCodmoeda: TCmDbField;
    FFormaenvio: TCmDbField;
    FDiafolha: TCmDbField;
    FIdregravalidaop2: TCmDbField;
    FIdrubdecterc: TCmDbField;
    FIdregracalcop1: TCmDbField;
    FFlgalteradados: TCmDbField;
    FIdregramatricula: TCmDbField;
    FFlgeditaop1: TCmDbField;
    FUnidnegoc: TCmDbField;
    FMesfechapatroep: TCmDbField;
    FIdregrasalbenefi: TCmDbField;
    FIdregravalidaop3: TCmDbField;
    FIdregracalcbasei: TCmDbField;
    FIdregravalidaop1: TCmDbField;
    FIdregraremtotal: TCmDbField;
    FNumopcoes: TCmDbField;
    FIdrgsalario13: TCmDbField;
    FIdrubsalbeneficio: TCmDbField;
    FTippatro: TCmDbField;
    FFlgplanosindiv: TCmDbField;
    FNomevalorbase1: TCmDbField;
    FTrguserinclusao: TCmDbField;
    FNumupdinterf: TCmDbField;
    FFlgeditaop3: TCmDbField;
    FIdregracalcop3: TCmDbField;
    FNuminsinterf: TCmDbField;
    FIdregracalcop2: TCmDbField;
    FFlgeditaop2: TCmDbField;
    FIdpessoa: TCmDbField;
    FFlgutilfolha: TCmDbField;
    FIdrubremtotal: TCmDbField;
    FIdrubsalmanut: TCmDbField;
    FTipcodigo: TCmDbField;
    FTrgdtinclusao: TCmDbField;
    FCodexterno: TCmDbField;
    FIdrubsalmanutparc: TCmDbField;
    FAnofechafolhaep: TCmDbField;
    FIdrubsalauxdoenca: TCmDbField;
    FPercmaxdesc: TCmDbField;
    FCodportforma: TCmDbField;
    procedure SetAnofechaemptmo(const Value: TCmDbField);
    procedure SetAnofechafolhaep(const Value: TCmDbField);
    procedure SetAnofechapatroep(const Value: TCmDbField);
    procedure SetClassetippatro(const Value: TCmDbField);
    procedure SetCodcentrorespon(const Value: TCmDbField);
    procedure SetCodexterno(const Value: TCmDbField);
    procedure SetCodigo(const Value: TCmDbField);
    procedure SetCodmoeda(const Value: TCmDbField);
    procedure SetCodportforma(const Value: TCmDbField);
    procedure SetCodsubconta(const Value: TCmDbField);
    procedure SetDiafolha(const Value: TCmDbField);
    procedure SetFlgaceitanaoid(const Value: TCmDbField);
    procedure SetFlgalteradados(const Value: TCmDbField);
    procedure SetFlgano13(const Value: TCmDbField);
    procedure SetFlganteriorfolha(const Value: TCmDbField);
    procedure SetFlgeditaop1(const Value: TCmDbField);
    procedure SetFlgeditaop2(const Value: TCmDbField);
    procedure SetFlgeditaop3(const Value: TCmDbField);
    procedure SetFlginfextrato(const Value: TCmDbField);
    procedure SetFlgmesfolha(const Value: TCmDbField);
    procedure SetFlgobrigaop1(const Value: TCmDbField);
    procedure SetFlgobrigaop2(const Value: TCmDbField);
    procedure SetFlgobrigaop3(const Value: TCmDbField);
    procedure SetFlgpagamento(const Value: TCmDbField);
    procedure SetFlgplanosindiv(const Value: TCmDbField);
    procedure SetFlgutilfolha(const Value: TCmDbField);
    procedure SetFormabaixa(const Value: TCmDbField);
    procedure SetFormaenvio(const Value: TCmDbField);
    procedure SetIdempresaprop(const Value: TCmDbField);
    procedure SetIdfundacao(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdregracalcbasei(const Value: TCmDbField);
    procedure SetIdregracalcop1(const Value: TCmDbField);
    procedure SetIdregracalcop2(const Value: TCmDbField);
    procedure SetIdregracalcop3(const Value: TCmDbField);
    procedure SetIdregracalcsalpa(const Value: TCmDbField);
    procedure SetIdregramatricula(const Value: TCmDbField);
    procedure SetIdregraremtotal(const Value: TCmDbField);
    procedure SetIdregrasalbenefi(const Value: TCmDbField);
    procedure SetIdregravalidaop1(const Value: TCmDbField);
    procedure SetIdregravalidaop2(const Value: TCmDbField);
    procedure SetIdregravalidaop3(const Value: TCmDbField);
    procedure SetIdrgsalario13(const Value: TCmDbField);
    procedure SetIdrubdecterc(const Value: TCmDbField);
    procedure SetIdrubremtotal(const Value: TCmDbField);
    procedure SetIdrubsalauxdoenca(const Value: TCmDbField);
    procedure SetIdrubsalbaseinss(const Value: TCmDbField);
    procedure SetIdrubsalbeneficio(const Value: TCmDbField);
    procedure SetIdrubsalmanut(const Value: TCmDbField);
    procedure SetIdrubsalmanutparc(const Value: TCmDbField);
    procedure SetIdrubsalparticip(const Value: TCmDbField);
    procedure SetMascmatricula(const Value: TCmDbField);
    procedure SetMescobranca13(const Value: TCmDbField);
    procedure SetMesfechaemptmo(const Value: TCmDbField);
    procedure SetMesfechafolhaep(const Value: TCmDbField);
    procedure SetMesfechapatroep(const Value: TCmDbField);
    procedure SetNomevalorbase1(const Value: TCmDbField);
    procedure SetNomevalorbase2(const Value: TCmDbField);
    procedure SetNomevalorbase3(const Value: TCmDbField);
    procedure SetNuminsinterf(const Value: TCmDbField);
    procedure SetNumopcoes(const Value: TCmDbField);
    procedure SetNumupdinterf(const Value: TCmDbField);
    procedure SetPercmaxdesc(const Value: TCmDbField);
    procedure SetTipcodigo(const Value: TCmDbField);
    procedure SetTippatro(const Value: TCmDbField);
    procedure SetTrgdtinclusao(const Value: TCmDbField);
    procedure SetTrguserinclusao(const Value: TCmDbField);
    procedure SetUnidnegoc(const Value: TCmDbField);

  public

     Property Unidnegoc: TCmDbField read FUnidnegoc write SetUnidnegoc;
     Property Trguserinclusao: TCmDbField read FTrguserinclusao write SetTrguserinclusao;
     Property Trgdtinclusao: TCmDbField read FTrgdtinclusao write SetTrgdtinclusao;
     Property Tippatro: TCmDbField read FTippatro write SetTippatro;
     Property Tipcodigo: TCmDbField read FTipcodigo write SetTipcodigo;
     Property Percmaxdesc: TCmDbField read FPercmaxdesc write SetPercmaxdesc;
     Property Numupdinterf: TCmDbField read FNumupdinterf write SetNumupdinterf;
     Property Numopcoes: TCmDbField read FNumopcoes write SetNumopcoes;
     Property Numinsinterf: TCmDbField read FNuminsinterf write SetNuminsinterf;
     Property Nomevalorbase3: TCmDbField read FNomevalorbase3 write SetNomevalorbase3;
     Property Nomevalorbase2: TCmDbField read FNomevalorbase2 write SetNomevalorbase2;
     Property Nomevalorbase1: TCmDbField read FNomevalorbase1 write SetNomevalorbase1;
     Property Mesfechapatroep: TCmDbField read FMesfechapatroep write SetMesfechapatroep;
     Property Mesfechafolhaep: TCmDbField read FMesfechafolhaep write SetMesfechafolhaep;
     Property Mesfechaemptmo: TCmDbField read FMesfechaemptmo write SetMesfechaemptmo;
     Property Mescobranca13: TCmDbField read FMescobranca13 write SetMescobranca13;
     Property Mascmatricula: TCmDbField read FMascmatricula write SetMascmatricula;
     Property Idrubsalparticip: TCmDbField read FIdrubsalparticip write SetIdrubsalparticip;
     Property Idrubsalmanutparc: TCmDbField read FIdrubsalmanutparc write SetIdrubsalmanutparc;
     Property Idrubsalmanut: TCmDbField read FIdrubsalmanut write SetIdrubsalmanut;
     Property Idrubsalbeneficio: TCmDbField read FIdrubsalbeneficio write SetIdrubsalbeneficio;
     Property Idrubsalbaseinss: TCmDbField read FIdrubsalbaseinss write SetIdrubsalbaseinss;
     Property Idrubsalauxdoenca: TCmDbField read FIdrubsalauxdoenca write SetIdrubsalauxdoenca;
     Property Idrubremtotal: TCmDbField read FIdrubremtotal write SetIdrubremtotal;
     Property Idrubdecterc: TCmDbField read FIdrubdecterc write SetIdrubdecterc;
     Property Idrgsalario13: TCmDbField read FIdrgsalario13 write SetIdrgsalario13;
     Property Idregravalidaop3: TCmDbField read FIdregravalidaop3 write SetIdregravalidaop3;
     Property Idregravalidaop2: TCmDbField read FIdregravalidaop2 write SetIdregravalidaop2;
     Property Idregravalidaop1: TCmDbField read FIdregravalidaop1 write SetIdregravalidaop1;
     Property Idregrasalbenefi: TCmDbField read FIdregrasalbenefi write SetIdregrasalbenefi;
     Property Idregraremtotal: TCmDbField read FIdregraremtotal write SetIdregraremtotal;
     Property Idregramatricula: TCmDbField read FIdregramatricula write SetIdregramatricula;
     Property Idregracalcsalpa: TCmDbField read FIdregracalcsalpa write SetIdregracalcsalpa;
     Property Idregracalcop3: TCmDbField read FIdregracalcop3 write SetIdregracalcop3;
     Property Idregracalcop2: TCmDbField read FIdregracalcop2 write SetIdregracalcop2;
     Property Idregracalcop1: TCmDbField read FIdregracalcop1 write SetIdregracalcop1;
     Property Idregracalcbasei: TCmDbField read FIdregracalcbasei write SetIdregracalcbasei;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idfundacao: TCmDbField read FIdfundacao write SetIdfundacao;
     Property Idempresaprop: TCmDbField read FIdempresaprop write SetIdempresaprop;
     Property Formaenvio: TCmDbField read FFormaenvio write SetFormaenvio;
     Property Formabaixa: TCmDbField read FFormabaixa write SetFormabaixa;
     Property Flgutilfolha: TCmDbField read FFlgutilfolha write SetFlgutilfolha;
     Property Flgplanosindiv: TCmDbField read FFlgplanosindiv write SetFlgplanosindiv;
     Property Flgpagamento: TCmDbField read FFlgpagamento write SetFlgpagamento;
     Property Flgobrigaop3: TCmDbField read FFlgobrigaop3 write SetFlgobrigaop3;
     Property Flgobrigaop2: TCmDbField read FFlgobrigaop2 write SetFlgobrigaop2;
     Property Flgobrigaop1: TCmDbField read FFlgobrigaop1 write SetFlgobrigaop1;
     Property Flgmesfolha: TCmDbField read FFlgmesfolha write SetFlgmesfolha;
     Property Flginfextrato: TCmDbField read FFlginfextrato write SetFlginfextrato;
     Property Flgeditaop3: TCmDbField read FFlgeditaop3 write SetFlgeditaop3;
     Property Flgeditaop2: TCmDbField read FFlgeditaop2 write SetFlgeditaop2;
     Property Flgeditaop1: TCmDbField read FFlgeditaop1 write SetFlgeditaop1;
     Property Flganteriorfolha: TCmDbField read FFlganteriorfolha write SetFlganteriorfolha;
     Property Flgano13: TCmDbField read FFlgano13 write SetFlgano13;
     Property Flgalteradados: TCmDbField read FFlgalteradados write SetFlgalteradados;
     Property Flgaceitanaoid: TCmDbField read FFlgaceitanaoid write SetFlgaceitanaoid;
     Property Diafolha: TCmDbField read FDiafolha write SetDiafolha;
     Property Codsubconta: TCmDbField read FCodsubconta write SetCodsubconta;
     Property Codportforma: TCmDbField read FCodportforma write SetCodportforma;
     Property Codmoeda: TCmDbField read FCodmoeda write SetCodmoeda;
     Property Codigo: TCmDbField read FCodigo write SetCodigo;
     Property Codexterno: TCmDbField read FCodexterno write SetCodexterno;
     Property Codcentrorespon: TCmDbField read FCodcentrorespon write SetCodcentrorespon;
     Property Classetippatro: TCmDbField read FClassetippatro write SetClassetippatro;
     Property Anofechapatroep: TCmDbField read FAnofechapatroep write SetAnofechapatroep;
     Property Anofechafolhaep: TCmDbField read FAnofechafolhaep write SetAnofechafolhaep;
     Property Anofechaemptmo: TCmDbField read FAnofechaemptmo write SetAnofechaemptmo;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbPatro }

constructor TDbPatro.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PATRO';

   fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,False,False,False,True,'');
   fTrguserinclusao := CreateCmDbField('TRGUSERINCLUSAO',ftString,False,False,False,True,'');
   fTrgdtinclusao := CreateCmDbField('TRGDTINCLUSAO',ftDateTime,False,False,False,True,'');
   fTippatro := CreateCmDbField('TIPPATRO',ftString,False,False,False,True,'');
   fTipcodigo := CreateCmDbField('TIPCODIGO',ftString,False,False,False,True,'');
   fPercmaxdesc := CreateCmDbField('PERCMAXDESC',ftfloat,False,False,False,True,'');
   fNumupdinterf := CreateCmDbField('NUMUPDINTERF',ftfloat,False,False,False,True,'');
   fNumopcoes := CreateCmDbField('NUMOPCOES',ftfloat,False,False,False,True,'');
   fNuminsinterf := CreateCmDbField('NUMINSINTERF',ftfloat,False,False,False,True,'');
   fNomevalorbase3 := CreateCmDbField('NOMEVALORBASE3',ftString,False,False,False,True,'');
   fNomevalorbase2 := CreateCmDbField('NOMEVALORBASE2',ftString,False,False,False,True,'');
   fNomevalorbase1 := CreateCmDbField('NOMEVALORBASE1',ftString,False,False,False,True,'');
   fMesfechapatroep := CreateCmDbField('MESFECHAPATROEP',ftfloat,False,False,False,True,'');
   fMesfechafolhaep := CreateCmDbField('MESFECHAFOLHAEP',ftfloat,False,False,False,True,'');
   fMesfechaemptmo := CreateCmDbField('MESFECHAEMPTMO',ftfloat,False,False,False,True,'');
   fMescobranca13 := CreateCmDbField('MESCOBRANCA13',ftfloat,False,False,False,True,'');
   fMascmatricula := CreateCmDbField('MASCMATRICULA',ftString,False,False,False,True,'');
   fIdrubsalparticip := CreateCmDbField('IDRUBSALPARTICIP',ftfloat,False,False,False,True,'');
   fIdrubsalmanutparc := CreateCmDbField('IDRUBSALMANUTPARC',ftfloat,False,False,False,True,'');
   fIdrubsalmanut := CreateCmDbField('IDRUBSALMANUT',ftfloat,False,False,False,True,'');
   fIdrubsalbeneficio := CreateCmDbField('IDRUBSALBENEFICIO',ftfloat,False,False,False,True,'');
   fIdrubsalbaseinss := CreateCmDbField('IDRUBSALBASEINSS',ftfloat,False,False,False,True,'');
   fIdrubsalauxdoenca := CreateCmDbField('IDRUBSALAUXDOENCA',ftfloat,False,False,False,True,'');
   fIdrubremtotal := CreateCmDbField('IDRUBREMTOTAL',ftfloat,False,False,False,True,'');
   fIdrubdecterc := CreateCmDbField('IDRUBDECTERC',ftfloat,False,False,False,True,'');
   fIdrgsalario13 := CreateCmDbField('IDRGSALARIO13',ftfloat,False,False,False,True,'');
   fIdregravalidaop3 := CreateCmDbField('IDREGRAVALIDAOP3',ftfloat,False,False,False,True,'');
   fIdregravalidaop2 := CreateCmDbField('IDREGRAVALIDAOP2',ftfloat,False,False,False,True,'');
   fIdregravalidaop1 := CreateCmDbField('IDREGRAVALIDAOP1',ftfloat,False,False,False,True,'');
   fIdregrasalbenefi := CreateCmDbField('IDREGRASALBENEFI',ftfloat,False,False,False,True,'');
   fIdregraremtotal := CreateCmDbField('IDREGRAREMTOTAL',ftfloat,False,False,False,True,'');
   fIdregramatricula := CreateCmDbField('IDREGRAMATRICULA',ftfloat,False,False,False,True,'');
   fIdregracalcsalpa := CreateCmDbField('IDREGRACALCSALPA',ftfloat,False,False,False,True,'');
   fIdregracalcop3 := CreateCmDbField('IDREGRACALCOP3',ftfloat,False,False,False,True,'');
   fIdregracalcop2 := CreateCmDbField('IDREGRACALCOP2',ftfloat,False,False,False,True,'');
   fIdregracalcop1 := CreateCmDbField('IDREGRACALCOP1',ftfloat,False,False,False,True,'');
   fIdregracalcbasei := CreateCmDbField('IDREGRACALCBASEI',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fIdfundacao := CreateCmDbField('IDFUNDACAO',ftfloat,False,False,False,True,'');
   fIdempresaprop := CreateCmDbField('IDEMPRESAPROP',ftfloat,False,False,False,True,'');
   fFormaenvio := CreateCmDbField('FORMAENVIO',ftString,False,False,False,True,'');
   fFormabaixa := CreateCmDbField('FORMABAIXA',ftString,False,False,False,True,'');
   fFlgutilfolha := CreateCmDbField('FLGUTILFOLHA',ftString,False,False,False,True,'');
   fFlgplanosindiv := CreateCmDbField('FLGPLANOSINDIV',ftfloat,False,False,False,True,'');
   fFlgpagamento := CreateCmDbField('FLGPAGAMENTO',ftString,False,False,False,True,'');
   fFlgobrigaop3 := CreateCmDbField('FLGOBRIGAOP3',ftfloat,False,False,False,True,'');
   fFlgobrigaop2 := CreateCmDbField('FLGOBRIGAOP2',ftfloat,False,False,False,True,'');
   fFlgobrigaop1 := CreateCmDbField('FLGOBRIGAOP1',ftfloat,False,False,False,True,'');
   fFlgmesfolha := CreateCmDbField('FLGMESFOLHA',ftString,False,False,False,True,'');
   fFlginfextrato := CreateCmDbField('FLGINFEXTRATO',ftfloat,False,False,False,True,'');
   fFlgeditaop3 := CreateCmDbField('FLGEDITAOP3',ftfloat,False,False,False,True,'');
   fFlgeditaop2 := CreateCmDbField('FLGEDITAOP2',ftfloat,False,False,False,True,'');
   fFlgeditaop1 := CreateCmDbField('FLGEDITAOP1',ftfloat,False,False,False,True,'');
   fFlganteriorfolha := CreateCmDbField('FLGANTERIORFOLHA',ftString,False,False,False,True,'');
   fFlgano13 := CreateCmDbField('FLGANO13',ftString,False,False,False,True,'');
   fFlgalteradados := CreateCmDbField('FLGALTERADADOS',ftfloat,False,False,False,True,'');
   fFlgaceitanaoid := CreateCmDbField('FLGACEITANAOID',ftfloat,False,False,False,True,'');
   fDiafolha := CreateCmDbField('DIAFOLHA',ftfloat,False,False,False,True,'');
   fCodsubconta := CreateCmDbField('CODSUBCONTA',ftfloat,False,False,False,True,'');
   fCodportforma := CreateCmDbField('CODPORTFORMA',ftfloat,False,False,False,True,'');
   fCodmoeda := CreateCmDbField('CODMOEDA',ftfloat,False,False,False,True,'');
   fCodigo := CreateCmDbField('CODIGO',ftfloat,False,False,False,True,'');
   fCodexterno := CreateCmDbField('CODEXTERNO',ftfloat,False,False,False,True,'');
   fCodcentrorespon := CreateCmDbField('CODCENTRORESPON',ftString,False,False,False,True,'');
   fClassetippatro := CreateCmDbField('CLASSETIPPATRO',ftString,False,False,False,True,'');
   fAnofechapatroep := CreateCmDbField('ANOFECHAPATROEP',ftfloat,False,False,False,True,'');
   fAnofechafolhaep := CreateCmDbField('ANOFECHAFOLHAEP',ftfloat,False,False,False,True,'');
   fAnofechaemptmo := CreateCmDbField('ANOFECHAEMPTMO',ftfloat,False,False,False,True,'');
end;

function TDbPatro.Insert: Boolean;
begin

   Result := Inherited Insert;

end;


procedure TDbPatro.SetAnofechaemptmo(const Value: TCmDbField);
begin
  FAnofechaemptmo := Value;
end;

procedure TDbPatro.SetAnofechafolhaep(const Value: TCmDbField);
begin
  FAnofechafolhaep := Value;
end;

procedure TDbPatro.SetAnofechapatroep(const Value: TCmDbField);
begin
  FAnofechapatroep := Value;
end;

procedure TDbPatro.SetClassetippatro(const Value: TCmDbField);
begin
  FClassetippatro := Value;
end;

procedure TDbPatro.SetCodcentrorespon(const Value: TCmDbField);
begin
  FCodcentrorespon := Value;
end;

procedure TDbPatro.SetCodexterno(const Value: TCmDbField);
begin
  FCodexterno := Value;
end;

procedure TDbPatro.SetCodigo(const Value: TCmDbField);
begin
  FCodigo := Value;
end;

procedure TDbPatro.SetCodmoeda(const Value: TCmDbField);
begin
  FCodmoeda := Value;
end;

procedure TDbPatro.SetCodportforma(const Value: TCmDbField);
begin
  FCodportforma := Value;
end;

procedure TDbPatro.SetCodsubconta(const Value: TCmDbField);
begin
  FCodsubconta := Value;
end;

procedure TDbPatro.SetDiafolha(const Value: TCmDbField);
begin
  FDiafolha := Value;
end;

procedure TDbPatro.SetFlgaceitanaoid(const Value: TCmDbField);
begin
  FFlgaceitanaoid := Value;
end;

procedure TDbPatro.SetFlgalteradados(const Value: TCmDbField);
begin
  FFlgalteradados := Value;
end;

procedure TDbPatro.SetFlgano13(const Value: TCmDbField);
begin
  FFlgano13 := Value;
end;

procedure TDbPatro.SetFlganteriorfolha(const Value: TCmDbField);
begin
  FFlganteriorfolha := Value;
end;

procedure TDbPatro.SetFlgeditaop1(const Value: TCmDbField);
begin
  FFlgeditaop1 := Value;
end;

procedure TDbPatro.SetFlgeditaop2(const Value: TCmDbField);
begin
  FFlgeditaop2 := Value;
end;

procedure TDbPatro.SetFlgeditaop3(const Value: TCmDbField);
begin
  FFlgeditaop3 := Value;
end;

procedure TDbPatro.SetFlginfextrato(const Value: TCmDbField);
begin
  FFlginfextrato := Value;
end;

procedure TDbPatro.SetFlgmesfolha(const Value: TCmDbField);
begin
  FFlgmesfolha := Value;
end;

procedure TDbPatro.SetFlgobrigaop1(const Value: TCmDbField);
begin
  FFlgobrigaop1 := Value;
end;

procedure TDbPatro.SetFlgobrigaop2(const Value: TCmDbField);
begin
  FFlgobrigaop2 := Value;
end;

procedure TDbPatro.SetFlgobrigaop3(const Value: TCmDbField);
begin
  FFlgobrigaop3 := Value;
end;

procedure TDbPatro.SetFlgpagamento(const Value: TCmDbField);
begin
  FFlgpagamento := Value;
end;

procedure TDbPatro.SetFlgplanosindiv(const Value: TCmDbField);
begin
  FFlgplanosindiv := Value;
end;

procedure TDbPatro.SetFlgutilfolha(const Value: TCmDbField);
begin
  FFlgutilfolha := Value;
end;

procedure TDbPatro.SetFormabaixa(const Value: TCmDbField);
begin
  FFormabaixa := Value;
end;

procedure TDbPatro.SetFormaenvio(const Value: TCmDbField);
begin
  FFormaenvio := Value;
end;

procedure TDbPatro.SetIdempresaprop(const Value: TCmDbField);
begin
  FIdempresaprop := Value;
end;

procedure TDbPatro.SetIdfundacao(const Value: TCmDbField);
begin
  FIdfundacao := Value;
end;

procedure TDbPatro.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbPatro.SetIdregracalcbasei(const Value: TCmDbField);
begin
  FIdregracalcbasei := Value;
end;

procedure TDbPatro.SetIdregracalcop1(const Value: TCmDbField);
begin
  FIdregracalcop1 := Value;
end;

procedure TDbPatro.SetIdregracalcop2(const Value: TCmDbField);
begin
  FIdregracalcop2 := Value;
end;

procedure TDbPatro.SetIdregracalcop3(const Value: TCmDbField);
begin
  FIdregracalcop3 := Value;
end;

procedure TDbPatro.SetIdregracalcsalpa(const Value: TCmDbField);
begin
  FIdregracalcsalpa := Value;
end;

procedure TDbPatro.SetIdregramatricula(const Value: TCmDbField);
begin
  FIdregramatricula := Value;
end;

procedure TDbPatro.SetIdregraremtotal(const Value: TCmDbField);
begin
  FIdregraremtotal := Value;
end;

procedure TDbPatro.SetIdregrasalbenefi(const Value: TCmDbField);
begin
  FIdregrasalbenefi := Value;
end;

procedure TDbPatro.SetIdregravalidaop1(const Value: TCmDbField);
begin
  FIdregravalidaop1 := Value;
end;

procedure TDbPatro.SetIdregravalidaop2(const Value: TCmDbField);
begin
  FIdregravalidaop2 := Value;
end;

procedure TDbPatro.SetIdregravalidaop3(const Value: TCmDbField);
begin
  FIdregravalidaop3 := Value;
end;

procedure TDbPatro.SetIdrgsalario13(const Value: TCmDbField);
begin
  FIdrgsalario13 := Value;
end;

procedure TDbPatro.SetIdrubdecterc(const Value: TCmDbField);
begin
  FIdrubdecterc := Value;
end;

procedure TDbPatro.SetIdrubremtotal(const Value: TCmDbField);
begin
  FIdrubremtotal := Value;
end;

procedure TDbPatro.SetIdrubsalauxdoenca(const Value: TCmDbField);
begin
  FIdrubsalauxdoenca := Value;
end;

procedure TDbPatro.SetIdrubsalbaseinss(const Value: TCmDbField);
begin
  FIdrubsalbaseinss := Value;
end;

procedure TDbPatro.SetIdrubsalbeneficio(const Value: TCmDbField);
begin
  FIdrubsalbeneficio := Value;
end;

procedure TDbPatro.SetIdrubsalmanut(const Value: TCmDbField);
begin
  FIdrubsalmanut := Value;
end;

procedure TDbPatro.SetIdrubsalmanutparc(const Value: TCmDbField);
begin
  FIdrubsalmanutparc := Value;
end;

procedure TDbPatro.SetIdrubsalparticip(const Value: TCmDbField);
begin
  FIdrubsalparticip := Value;
end;

procedure TDbPatro.SetMascmatricula(const Value: TCmDbField);
begin
  FMascmatricula := Value;
end;

procedure TDbPatro.SetMescobranca13(const Value: TCmDbField);
begin
  FMescobranca13 := Value;
end;

procedure TDbPatro.SetMesfechaemptmo(const Value: TCmDbField);
begin
  FMesfechaemptmo := Value;
end;

procedure TDbPatro.SetMesfechafolhaep(const Value: TCmDbField);
begin
  FMesfechafolhaep := Value;
end;

procedure TDbPatro.SetMesfechapatroep(const Value: TCmDbField);
begin
  FMesfechapatroep := Value;
end;

procedure TDbPatro.SetNomevalorbase1(const Value: TCmDbField);
begin
  FNomevalorbase1 := Value;
end;

procedure TDbPatro.SetNomevalorbase2(const Value: TCmDbField);
begin
  FNomevalorbase2 := Value;
end;

procedure TDbPatro.SetNomevalorbase3(const Value: TCmDbField);
begin
  FNomevalorbase3 := Value;
end;

procedure TDbPatro.SetNuminsinterf(const Value: TCmDbField);
begin
  FNuminsinterf := Value;
end;

procedure TDbPatro.SetNumopcoes(const Value: TCmDbField);
begin
  FNumopcoes := Value;
end;

procedure TDbPatro.SetNumupdinterf(const Value: TCmDbField);
begin
  FNumupdinterf := Value;
end;

procedure TDbPatro.SetPercmaxdesc(const Value: TCmDbField);
begin
  FPercmaxdesc := Value;
end;

procedure TDbPatro.SetTipcodigo(const Value: TCmDbField);
begin
  FTipcodigo := Value;
end;

procedure TDbPatro.SetTippatro(const Value: TCmDbField);
begin
  FTippatro := Value;
end;

procedure TDbPatro.SetTrgdtinclusao(const Value: TCmDbField);
begin
  FTrgdtinclusao := Value;
end;

procedure TDbPatro.SetTrguserinclusao(const Value: TCmDbField);
begin
  FTrguserinclusao := Value;
end;

procedure TDbPatro.SetUnidnegoc(const Value: TCmDbField);
begin
  FUnidnegoc := Value;
end;





end.



