{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 01/04/2003                             }
{                                                       }
{*******************************************************}

unit uDbBem;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB;

Type
  TDbBem = class(TCmDbObject)

  private
    FIdmodulo: TCmDbField;
    FDeplanc: TCmDbField;
    FIdgrupo: TCmDbField;
    FCodsubconta: TCmDbField;
    FIdopcional: TCmDbField;
    FDesbem: TCmDbField;
    FDtacontab: TCmDbField;
    FValorg: TCmDbField;
    FIdfornserv: TCmDbField;
    FPubano: TCmDbField;
    FValfis: TCmDbField;
    FValdepini: TCmDbField;
    FDatainiciodep: TCmDbField;
    FDepger: TCmDbField;
    FIdsituacao: TCmDbField;
    FIdterceiro: TCmDbField;
    FDatainstalacao: TCmDbField;
    FValhistorico: TCmDbField;
    FIdconjunto: TCmDbField;
    FIdbem: TCmDbField;
    FCmbem: TCmDbField;
    FDtainclusao: TCmDbField;
    FIdclassebem: TCmDbField;
    FPropbaixa: TCmDbField;
    FValger: TCmDbField;
    //FBaixatotal: TCmDbField;
    FProcessoaquis: TCmDbField;
    FEmpenhoaquis: TCmDbField;
    FDataterminogar: TCmDbField;
    FComplnota: TCmDbField;
    FPubautor: TCmDbField;
    FPubeditora: TCmDbField;
    FFlgdeprec: TCmDbField;
    FIdnota: TCmDbField;
    FDatarecalcdep: TCmDbField;
    FFlgbemintcontab: TCmDbField;
    FNumserie: TCmDbField;
    FDataultdep: TCmDbField;
    FIdpessoa: TCmDbField;
    FTaxadep: TCmDbField;
    FIditensrecdev: TCmDbField;
    FPlaca: TCmDbField;
    FControle: TCmDbField;
    FDepfis: TCmDbField;
    FUnidnegoc: TCmDbField;
    FDtabaixa: TCmDbField;
    FCmdep: TCmDbField;
    FIdimagem: TCmDbField;
    FRegistro: TCmDbField;
    //FFlgsaidatemp: TCmDbField;
    FPrioridade: TCmDbField;
    FDtanota: TCmDbField;
    //procedure SetBaixatotal(const Value: TCmDbField);
    procedure SetCmbem(const Value: TCmDbField);
    procedure SetCmdep(const Value: TCmDbField);
    procedure SetCodsubconta(const Value: TCmDbField);
    procedure SetComplnota(const Value: TCmDbField);
    procedure SetControle(const Value: TCmDbField);
    procedure SetDatainiciodep(const Value: TCmDbField);
    procedure SetDatainstalacao(const Value: TCmDbField);
    procedure SetDatarecalcdep(const Value: TCmDbField);
    procedure SetDataterminogar(const Value: TCmDbField);
    procedure SetDataultdep(const Value: TCmDbField);
    procedure SetDepfis(const Value: TCmDbField);
    procedure SetDepger(const Value: TCmDbField);
    procedure SetDeplanc(const Value: TCmDbField);
    procedure SetDesbem(const Value: TCmDbField);
    procedure SetDtabaixa(const Value: TCmDbField);
    procedure SetDtacontab(const Value: TCmDbField);
    procedure SetDtainclusao(const Value: TCmDbField);
    procedure SetDtanota(const Value: TCmDbField);
    procedure SetEmpenhoaquis(const Value: TCmDbField);
    procedure SetFlgbemintcontab(const Value: TCmDbField);
    procedure SetFlgdeprec(const Value: TCmDbField);
    //procedure SetFlgsaidatemp(const Value: TCmDbField);
    procedure SetIdbem(const Value: TCmDbField);
    procedure SetIdclassebem(const Value: TCmDbField);
    procedure SetIdconjunto(const Value: TCmDbField);
    procedure SetIdfornserv(const Value: TCmDbField);
    procedure SetIdgrupo(const Value: TCmDbField);
    procedure SetIdimagem(const Value: TCmDbField);
    procedure SetIditensrecdev(const Value: TCmDbField);
    procedure SetIdmodulo(const Value: TCmDbField);
    procedure SetIdnota(const Value: TCmDbField);
    procedure SetIdopcional(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdsituacao(const Value: TCmDbField);
    procedure SetIdterceiro(const Value: TCmDbField);
    procedure SetNumserie(const Value: TCmDbField);
    procedure SetPlaca(const Value: TCmDbField);
    procedure SetPrioridade(const Value: TCmDbField);
    procedure SetProcessoaquis(const Value: TCmDbField);
    procedure SetPropbaixa(const Value: TCmDbField);
    procedure SetPubano(const Value: TCmDbField);
    procedure SetPubautor(const Value: TCmDbField);
    procedure SetPubeditora(const Value: TCmDbField);
    procedure SetRegistro(const Value: TCmDbField);
    procedure SetTaxadep(const Value: TCmDbField);
    procedure SetUnidnegoc(const Value: TCmDbField);
    procedure SetValdepini(const Value: TCmDbField);
    procedure SetValfis(const Value: TCmDbField);
    procedure SetValger(const Value: TCmDbField);
    procedure SetValhistorico(const Value: TCmDbField);
    procedure SetValorg(const Value: TCmDbField);

  public

     Property Valorg: TCmDbField read FValorg write SetValorg;
     Property Valhistorico: TCmDbField read FValhistorico write SetValhistorico;
     Property Valger: TCmDbField read FValger write SetValger;
     Property Valfis: TCmDbField read FValfis write SetValfis;
     Property Valdepini: TCmDbField read FValdepini write SetValdepini;
     Property Unidnegoc: TCmDbField read FUnidnegoc write SetUnidnegoc;
     Property Taxadep: TCmDbField read FTaxadep write SetTaxadep;
     Property Registro: TCmDbField read FRegistro write SetRegistro;
     Property Pubeditora: TCmDbField read FPubeditora write SetPubeditora;
     Property Pubautor: TCmDbField read FPubautor write SetPubautor;
     Property Pubano: TCmDbField read FPubano write SetPubano;
     Property Propbaixa: TCmDbField read FPropbaixa write SetPropbaixa;
     Property Processoaquis: TCmDbField read FProcessoaquis write SetProcessoaquis;
     Property Prioridade: TCmDbField read FPrioridade write SetPrioridade;
     Property Placa: TCmDbField read FPlaca write SetPlaca;
     Property Numserie: TCmDbField read FNumserie write SetNumserie;
     Property Idterceiro: TCmDbField read FIdterceiro write SetIdterceiro;
     Property Idsituacao: TCmDbField read FIdsituacao write SetIdsituacao;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idopcional: TCmDbField read FIdopcional write SetIdopcional;
     Property Idnota: TCmDbField read FIdnota write SetIdnota;
     Property Idmodulo: TCmDbField read FIdmodulo write SetIdmodulo;
     Property Iditensrecdev: TCmDbField read FIditensrecdev write SetIditensrecdev;
     Property Idimagem: TCmDbField read FIdimagem write SetIdimagem;
     Property Idgrupo: TCmDbField read FIdgrupo write SetIdgrupo;
     Property Idfornserv: TCmDbField read FIdfornserv write SetIdfornserv;
     Property Idconjunto: TCmDbField read FIdconjunto write SetIdconjunto;
     Property Idclassebem: TCmDbField read FIdclassebem write SetIdclassebem;
     Property Idbem: TCmDbField read FIdbem write SetIdbem;
     //Property Flgsaidatemp: TCmDbField read FFlgsaidatemp write SetFlgsaidatemp;
     Property Flgdeprec: TCmDbField read FFlgdeprec write SetFlgdeprec;
     Property Flgbemintcontab: TCmDbField read FFlgbemintcontab write SetFlgbemintcontab;
     Property Empenhoaquis: TCmDbField read FEmpenhoaquis write SetEmpenhoaquis;
     Property Dtanota: TCmDbField read FDtanota write SetDtanota;
     Property Dtainclusao: TCmDbField read FDtainclusao write SetDtainclusao;
     Property Dtacontab: TCmDbField read FDtacontab write SetDtacontab;
     Property Dtabaixa: TCmDbField read FDtabaixa write SetDtabaixa;
     Property Desbem: TCmDbField read FDesbem write SetDesbem;
     Property Deplanc: TCmDbField read FDeplanc write SetDeplanc;
     Property Depger: TCmDbField read FDepger write SetDepger;
     Property Depfis: TCmDbField read FDepfis write SetDepfis;
     Property Dataultdep: TCmDbField read FDataultdep write SetDataultdep;
     Property Dataterminogar: TCmDbField read FDataterminogar write SetDataterminogar;
     Property Datarecalcdep: TCmDbField read FDatarecalcdep write SetDatarecalcdep;
     Property Datainstalacao: TCmDbField read FDatainstalacao write SetDatainstalacao;
     Property Datainiciodep: TCmDbField read FDatainiciodep write SetDatainiciodep;
     Property Controle: TCmDbField read FControle write SetControle;
     Property Complnota: TCmDbField read FComplnota write SetComplnota;
     Property Codsubconta: TCmDbField read FCodsubconta write SetCodsubconta;
     Property Cmdep: TCmDbField read FCmdep write SetCmdep;
     Property Cmbem: TCmDbField read FCmbem write SetCmbem;
     //Property Baixatotal: TCmDbField read FBaixatotal write SetBaixatotal;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbBem }

constructor TDbBem.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'BEM';

   fValorg := CreateCmDbField('VALORG',ftfloat,False,False,False,True,'');
   fValhistorico := CreateCmDbField('VALHISTORICO',ftfloat,False,False,False,True,'');
   fValger := CreateCmDbField('VALGER',ftfloat,False,False,False,True,'');
   fValfis := CreateCmDbField('VALFIS',ftfloat,False,False,False,True,'');
   fValdepini := CreateCmDbField('VALDEPINI',ftfloat,False,False,False,True,'');
   fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,False,False,False,True,'');
   fTaxadep := CreateCmDbField('TAXADEP',ftfloat,False,False,False,True,'');
   fRegistro := CreateCmDbField('REGISTRO',ftString,True,False,False,True,'');
   fPubeditora := CreateCmDbField('PUBEDITORA',ftString,False,False,False,True,'');
   fPubautor := CreateCmDbField('PUBAUTOR',ftString,False,False,False,True,'');
   fPubano := CreateCmDbField('PUBANO',ftfloat,False,False,False,True,'');
   fPropbaixa := CreateCmDbField('PROPBAIXA',ftfloat,False,False,False,True,'');
   fProcessoaquis := CreateCmDbField('PROCESSOAQUIS',ftString,False,False,False,True,'');
   fPrioridade := CreateCmDbField('PRIORIDADE',ftfloat,False,False,False,True,'');
   fPlaca := CreateCmDbField('PLACA',ftfloat,False,False,False,True,'');
   fNumserie := CreateCmDbField('NUMSERIE',ftString,False,False,False,True,'');
   fIdterceiro := CreateCmDbField('IDTERCEIRO',ftfloat,False,False,False,True,'');
   fIdsituacao := CreateCmDbField('IDSITUACAO',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fIdopcional := CreateCmDbField('IDOPCIONAL',ftString,False,False,False,True,'');
   fIdnota := CreateCmDbField('IDNOTA',ftString,False,False,False,True,'');
   fIdmodulo := CreateCmDbField('IDMODULO',ftfloat,False,False,False,True,'');
   fIditensrecdev := CreateCmDbField('IDITENSRECDEV',ftfloat,False,False,False,True,'');
   fIdimagem := CreateCmDbField('IDIMAGEM',ftfloat,False,False,False,True,'');
   fIdgrupo := CreateCmDbField('IDGRUPO',ftfloat,True,False,False,True,'');
   fIdfornserv := CreateCmDbField('IDFORNSERV',ftfloat,False,False,False,True,'');
   fIdconjunto := CreateCmDbField('IDCONJUNTO',ftfloat,False,False,False,True,'');
   fIdclassebem := CreateCmDbField('IDCLASSEBEM',ftfloat,False,False,False,True,'');
   fIdbem := CreateCmDbField('IDBEM',ftfloat,True,True,False,True,'');
   //fFlgsaidatemp := CreateCmDbField('FLGSAIDATEMP',ftfloat,False,False,False,True,'');
   fFlgdeprec := CreateCmDbField('FLGDEPREC',ftfloat,False,False,False,True,'');
   fFlgbemintcontab := CreateCmDbField('FLGBEMINTCONTAB',ftfloat,False,False,False,True,'');
   fEmpenhoaquis := CreateCmDbField('EMPENHOAQUIS',ftString,False,False,False,True,'');
   fDtanota := CreateCmDbField('DTANOTA',ftDateTime,False,False,False,True,'');
   fDtainclusao := CreateCmDbField('DTAINCLUSAO',ftDateTime,False,False,False,True,'');
   fDtacontab := CreateCmDbField('DTACONTAB',ftDateTime,False,False,False,True,'');
   fDtabaixa := CreateCmDbField('DTABAIXA',ftDateTime,False,False,False,True,'');
   fDesbem := CreateCmDbField('DESBEM',ftString,False,False,False,True,'');
   fDeplanc := CreateCmDbField('DEPLANC',ftfloat,False,False,False,True,'');
   fDepger := CreateCmDbField('DEPGER',ftfloat,False,False,False,True,'');
   fDepfis := CreateCmDbField('DEPFIS',ftfloat,False,False,False,True,'');
   fDataultdep := CreateCmDbField('DATAULTDEP',ftDateTime,False,False,False,True,'');
   fDataterminogar := CreateCmDbField('DATATERMINOGAR',ftDateTime,False,False,False,True,'');
   fDatarecalcdep := CreateCmDbField('DATARECALCDEP',ftDateTime,False,False,False,True,'');
   fDatainstalacao := CreateCmDbField('DATAINSTALACAO',ftDateTime,False,False,False,True,'');
   fDatainiciodep := CreateCmDbField('DATAINICIODEP',ftDateTime,False,False,False,True,'');
   fControle := CreateCmDbField('CONTROLE',ftString,False,False,False,True,'');
   fComplnota := CreateCmDbField('COMPLNOTA',ftString,False,False,False,True,'');
   fCodsubconta := CreateCmDbField('CODSUBCONTA',ftfloat,False,False,False,True,'');
   fCmdep := CreateCmDbField('CMDEP',ftfloat,False,False,False,True,'');
   fCmbem := CreateCmDbField('CMBEM',ftfloat,False,False,False,True,'');
   //fBaixatotal := CreateCmDbField('BAIXATOTAL',ftString,False,False,False,True,'');
end;

function TDbBem.Insert: Boolean;
begin
   fIdbem.AsFloat := GetSequence('BEM');
   Result := Inherited Insert;
end;


{procedure TDbBem.SetBaixatotal(const Value: TCmDbField);
begin
  FBaixatotal := Value;
end;}

procedure TDbBem.SetCmbem(const Value: TCmDbField);
begin
  FCmbem := Value;
end;

procedure TDbBem.SetCmdep(const Value: TCmDbField);
begin
  FCmdep := Value;
end;

procedure TDbBem.SetCodsubconta(const Value: TCmDbField);
begin
  FCodsubconta := Value;
end;

procedure TDbBem.SetComplnota(const Value: TCmDbField);
begin
  FComplnota := Value;
end;

procedure TDbBem.SetControle(const Value: TCmDbField);
begin
  FControle := Value;
end;

procedure TDbBem.SetDatainiciodep(const Value: TCmDbField);
begin
  FDatainiciodep := Value;
end;

procedure TDbBem.SetDatainstalacao(const Value: TCmDbField);
begin
  FDatainstalacao := Value;
end;

procedure TDbBem.SetDatarecalcdep(const Value: TCmDbField);
begin
  FDatarecalcdep := Value;
end;

procedure TDbBem.SetDataterminogar(const Value: TCmDbField);
begin
  FDataterminogar := Value;
end;

procedure TDbBem.SetDataultdep(const Value: TCmDbField);
begin
  FDataultdep := Value;
end;

procedure TDbBem.SetDepfis(const Value: TCmDbField);
begin
  FDepfis := Value;
end;

procedure TDbBem.SetDepger(const Value: TCmDbField);
begin
  FDepger := Value;
end;

procedure TDbBem.SetDeplanc(const Value: TCmDbField);
begin
  FDeplanc := Value;
end;

procedure TDbBem.SetDesbem(const Value: TCmDbField);
begin
  FDesbem := Value;
end;

procedure TDbBem.SetDtabaixa(const Value: TCmDbField);
begin
  FDtabaixa := Value;
end;

procedure TDbBem.SetDtacontab(const Value: TCmDbField);
begin
  FDtacontab := Value;
end;

procedure TDbBem.SetDtainclusao(const Value: TCmDbField);
begin
  FDtainclusao := Value;
end;

procedure TDbBem.SetDtanota(const Value: TCmDbField);
begin
  FDtanota := Value;
end;

procedure TDbBem.SetEmpenhoaquis(const Value: TCmDbField);
begin
  FEmpenhoaquis := Value;
end;

procedure TDbBem.SetFlgbemintcontab(const Value: TCmDbField);
begin
  FFlgbemintcontab := Value;
end;

procedure TDbBem.SetFlgdeprec(const Value: TCmDbField);
begin
  FFlgdeprec := Value;
end;

{procedure TDbBem.SetFlgsaidatemp(const Value: TCmDbField);
begin
  FFlgsaidatemp := Value;
end;}

procedure TDbBem.SetIdbem(const Value: TCmDbField);
begin
  FIdbem := Value;
end;

procedure TDbBem.SetIdclassebem(const Value: TCmDbField);
begin
  FIdclassebem := Value;
end;

procedure TDbBem.SetIdconjunto(const Value: TCmDbField);
begin
  FIdconjunto := Value;
end;

procedure TDbBem.SetIdfornserv(const Value: TCmDbField);
begin
  FIdfornserv := Value;
end;

procedure TDbBem.SetIdgrupo(const Value: TCmDbField);
begin
  FIdgrupo := Value;
end;

procedure TDbBem.SetIdimagem(const Value: TCmDbField);
begin
  FIdimagem := Value;
end;

procedure TDbBem.SetIditensrecdev(const Value: TCmDbField);
begin
  FIditensrecdev := Value;
end;

procedure TDbBem.SetIdmodulo(const Value: TCmDbField);
begin
  FIdmodulo := Value;
end;

procedure TDbBem.SetIdnota(const Value: TCmDbField);
begin
  FIdnota := Value;
end;

procedure TDbBem.SetIdopcional(const Value: TCmDbField);
begin
  FIdopcional := Value;
end;

procedure TDbBem.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbBem.SetIdsituacao(const Value: TCmDbField);
begin
  FIdsituacao := Value;
end;

procedure TDbBem.SetIdterceiro(const Value: TCmDbField);
begin
  FIdterceiro := Value;
end;

procedure TDbBem.SetNumserie(const Value: TCmDbField);
begin
  FNumserie := Value;
end;

procedure TDbBem.SetPlaca(const Value: TCmDbField);
begin
  FPlaca := Value;
end;

procedure TDbBem.SetPrioridade(const Value: TCmDbField);
begin
  FPrioridade := Value;
end;

procedure TDbBem.SetProcessoaquis(const Value: TCmDbField);
begin
  FProcessoaquis := Value;
end;

procedure TDbBem.SetPropbaixa(const Value: TCmDbField);
begin
  FPropbaixa := Value;
end;

procedure TDbBem.SetPubano(const Value: TCmDbField);
begin
  FPubano := Value;
end;

procedure TDbBem.SetPubautor(const Value: TCmDbField);
begin
  FPubautor := Value;
end;

procedure TDbBem.SetPubeditora(const Value: TCmDbField);
begin
  FPubeditora := Value;
end;

procedure TDbBem.SetRegistro(const Value: TCmDbField);
begin
  FRegistro := Value;
end;

procedure TDbBem.SetTaxadep(const Value: TCmDbField);
begin
  FTaxadep := Value;
end;

procedure TDbBem.SetUnidnegoc(const Value: TCmDbField);
begin
  FUnidnegoc := Value;
end;

procedure TDbBem.SetValdepini(const Value: TCmDbField);
begin
  FValdepini := Value;
end;

procedure TDbBem.SetValfis(const Value: TCmDbField);
begin
  FValfis := Value;
end;

procedure TDbBem.SetValger(const Value: TCmDbField);
begin
  FValger := Value;
end;

procedure TDbBem.SetValhistorico(const Value: TCmDbField);
begin
  FValhistorico := Value;
end;

procedure TDbBem.SetValorg(const Value: TCmDbField);
begin
  FValorg := Value;
end;

end.



