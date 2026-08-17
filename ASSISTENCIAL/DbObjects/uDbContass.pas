{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sidnei de Brito Marins          }
{ Atualizado Em: 28/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbContass;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbContass = class(TCmDbObject)

  private
    FUnidNegoc: TCmDbField;
    FTipCodigo: TCmDbField;
    FSeqProposta: TCmDbField;
    FRecPagDevol: TCmDbField;
    FRecPag: TCmDbField;
    FPlano: TCmDbField;
    FPlaContaD: TCmDbField;
    FPlaContaCDevPat: TCmDbField;
    FPlaContaCDevBanco: TCmDbField;
    FPlaContaC: TCmDbField;
    FIdTitular: TCmDbField;
    FIdPlanoPrev: TCmDbField;
    FIdPlanass: TCmDbField;
    FIdPessoa: TCmDbField;
    FIdPessJur: TCmDbField;
    FIdPagador: TCmDbField;
    FIdEmpresaProp: TCmDbField;
    FIdEmpresa: TCmDbField;
    FIdDependente: TCmDbField;
    FIdContass: TCmDbField;
    FFlgFolha: TCmDbField;
    FFlgCobCarne: TCmDbField;
    FFlgAtivo: TCmDbField;
    FCodTipRecDes: TCmDbField;
    FCodTipDoc: TCmDbField;
    FCodTipDesembDevol: TCmDbField;
    FCodTipDesembCar: TCmDbField;
    FCodSubConta: TCmDbField;
    FCodPortForma: TCmDbField;
    FCodCentroRespon: TCmDbField;
    FCodCentroCustoD: TCmDbField;
    FCodCentroCustoC: TCmDbField;
    FCodCCustoCDevPat: TCmDbField;
    FCodCCustoCDevBan: TCmDbField;
    FCodAlteradorJuros: TCmDbField;
    FCodAlteradorCorr: TCmDbField;
    procedure SetUnidNegoc(const Value: TCmDbField);
    procedure SetTipCodigo(const Value: TCmDbField);
    procedure SetSeqProposta(const Value: TCmDbField);
    procedure SetRecPagDevol(const Value: TCmDbField);
    procedure SetRecPag(const Value: TCmDbField);
    procedure SetPlano(const Value: TCmDbField);
    procedure SetPlaContaD(const Value: TCmDbField);
    procedure SetPlaContaCDevPat(const Value: TCmDbField);
    procedure SetPlaContaCDevBanco(const Value: TCmDbField);
    procedure SetPlaContaC(const Value: TCmDbField);
    procedure SetIdTitular(const Value: TCmDbField);
    procedure SetIdPlanoPrev(const Value: TCmDbField);
    procedure SetIdPlanass(const Value: TCmDbField);
    procedure SetIdPessoa(const Value: TCmDbField);
    procedure SetIdPessJur(const Value: TCmDbField);
    procedure SetIdPagador(const Value: TCmDbField);
    procedure SetIdEmpresaProp(const Value: TCmDbField);
    procedure SetIdEmpresa (const Value: TCmDbField);
    procedure SetIdDependente(const Value: TCmDbField);
    procedure SetIdContass(const Value: TCmDbField);
    procedure SetFlgFolha(const Value: TCmDbField);
    procedure SetFlgCobCarne(const Value: TCmDbField);
    procedure SetFlgAtivo(const Value: TCmDbField);
    procedure SetCodTipRecDes(const Value: TCmDbField);
    procedure SetCodTipDoc(const Value: TCmDbField);
    procedure SetCodTipDesembDevol(const Value: TCmDbField);
    procedure SetCodTipDesembCar (const Value: TCmDbField);
    procedure SetCodSubConta(const Value: TCmDbField);
    procedure SetCodPortForma(const Value: TCmDbField);
    procedure SetCodCentroRespon(const Value: TCmDbField);
    procedure SetCodCentroCustoD(const Value: TCmDbField);
    procedure SetCodCentroCustoC(const Value: TCmDbField);
    procedure SetCodCCustoCDevPat(const Value: TCmDbField);
    procedure SetCodCCustoCDevBan(const Value: TCmDbField);
    procedure SetCodalteradorjuros(const Value: TCmDbField);
    procedure SetCodalteradorcorr(const Value: TCmDbField);

  public

     Property UnidNegoc: TCmDbField read FUnidNegoc write SetUnidNegoc;
     Property TipCodigo: TCmDbField read FTipCodigo  Write SetTipCodigo;
     Property SeqProposta: TCmDbField read FSeqProposta Write SetSeqProposta;
     Property RecPagDevol: TCmDbField read FRecPagDevol Write SetRecPagDevol;
     Property RecPag: TCmDbField read FRecPag Write SetRecPag;
     Property Plano: TCmDbField read FPlano Write SetPlano;
     Property PlaContaD: TCmDbField read FPlaContaD Write SetPlaContaD;
     Property PlaContaCDevPat: TCmDbField read FPlaContaCDevPat Write SetPlaContaCDevPat;
     Property PlaContaCDevBanco: TCmDbField read FPlaContaCDevBanco Write SetPlaContaCDevBanco;
     Property PlaContaC: TCmDbField read FPlaContaC  Write SetPlaContaC;
     Property IdTitular: TCmDbField read FIdTitular  Write SetIdTitular;
     Property IdPlanoPrev: TCmDbField read FIdPlanoPrev  Write SetIdPlanoPrev;
     Property IdPlanass: TCmDbField read FIdPlanass  Write SetIdPlanass;
     Property IdPessoa: TCmDbField read FIdPessoa Write SetIdPessoa;
     Property IdPessJur: TCmDbField read FIdPessJur  Write SetIdPessJur;
     Property IdPagador: TCmDbField read FIdPagador  Write SetIdPagador;
     Property IdEmpresaProp: TCmDbField read FIdEmpresaProp Write SetIdEmpresaProp;
     Property IdEmpresa: TCmDbField read FIdEmpresa Write SetIdEmpresa;
     Property IdDependente: TCmDbField read FIdDependente Write SetIdDependente;
     Property IdContass: TCmDbField read FIdContass Write SetIdContass;
     Property FlgFolha: TCmDbField read FFlgFolha  Write SetFlgFolha;
     Property FlgCobCarne: TCmDbField read FFlgCobCarne Write SetFlgCobCarne;
     Property FlgAtivo: TCmDbField read FFlgAtivo  Write SetFlgAtivo;
     Property CodTipRecDes: TCmDbField read FCodTipRecDes  Write SetCodTipRecDes;
     Property CodTipDoc: TCmDbField read FCodTipDoc  Write SetCodTipDoc;
     Property CodTipDesembDevol: TCmDbField read FCodTipDesembDevol  Write SetCodTipDesembDevol;
     Property CodTipDesembcar: TCmDbField read FCodTipDesembcar  Write SetCodTipDesembcar;
     Property CodSubConta: TCmDbField read FCodSubConta  Write SetCodSubConta;
     Property CodPortForma: TCmDbField read FCodPortForma  Write SetCodPortForma;
     Property CodCentroRespon: TCmDbField read FCodCentroRespon  Write SetCodCentroRespon;
     Property CodCentroCustoD: TCmDbField read FCodCentroCustoD  Write SetCodCentroCustoD;
     Property CodCentroCustoC: TCmDbField read FCodCentroCustoC  Write SetCodCentroCustoC;
     Property CodCCustoCDevPat: TCmDbField read FCodCCustoCDevPat  Write SetCodCCustoCDevPat;
     Property CodCCustoCDevBan: TCmDbField read FCodCCustoCDevBan  Write SetCodCCustoCDevBan;
     Property CodAlteradorJuros: TCmDbField read FCodAlteradorJuros  Write SetCodAlteradorJuros;
     Property CodAlteradorCorr: TCmDbField read FCodAlteradorCorr  Write SetCodAlteradorCorr;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbContass }

constructor TDbContass.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CONTASS';

  FUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,True,False);
  FTipcodigo := CreateCmDbField('TIPCODIGO',ftString,True,False);
  FSeqproposta := CreateCmDbField('SEQPROPOSTA',ftfloat,False,True);
  FRecpagdevol := CreateCmDbField('RECPAGDEVOL',ftString,True,False);
  FRecpag := CreateCmDbField('RECPAG',ftString,True,False);
  FPlano := CreateCmDbField('PLANO',ftfloat,True,False);
  FPlacontad := CreateCmDbField('PLACONTAD',ftString,True,False);
  FPlacontacdevpat := CreateCmDbField('PLACONTACDEVPAT',ftString,True,False);
  FPlacontacdevbanco := CreateCmDbField('PLACONTACDEVBANCO',ftString,True,False);
  FPlacontac := CreateCmDbField('PLACONTAC',ftString,True,False);
  FIdtitular := CreateCmDbField('IDTITULAR',ftfloat,False,True);
  FIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,False,True);
  FIdplanass := CreateCmDbField('IDPLANASS',ftfloat,False,True);
  FIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,False);
  FIdpessjur := CreateCmDbField('IDPESSJUR',ftfloat,False,True);
  FIdpagador := CreateCmDbField('IDPAGADOR',ftfloat,True,False);
  FIdempresaprop := CreateCmDbField('IDEMPRESAPROP',ftfloat,True,False);
  FIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,True,False);
  FIddependente := CreateCmDbField('IDDEPENDENTE',ftfloat,False,True);
  FIdcontass := CreateCmDbField('IDCONTASS',ftfloat,False,True);
  FFlgfolha := CreateCmDbField('FLGFOLHA',ftfloat,True,False);
  FFlgcobcarne := CreateCmDbField('FLGCOBCARNE',ftfloat,True,False);
  FFlgativo := CreateCmDbField('FLGATIVO',ftfloat,True,False);
  FCodtiprecdes := CreateCmDbField('CODTIPRECDES',ftString,True,False);
  FCodtipdoc := CreateCmDbField('CODTIPDOC',ftfloat,True,False);
  FCodtipdesembdevol := CreateCmDbField('CODTIPDESEMBDEVOL',ftString,True,False);
  FCodtipdesembcar := CreateCmDbField('CODTIPDESEMBCAR',ftString,True,False);
  FCodsubconta := CreateCmDbField('CODSUBCONTA',ftfloat,True,False);
  FCodportforma := CreateCmDbField('CODPORTFORMA',ftfloat,True,False);
  FCodcentrorespon := CreateCmDbField('CODCENTRORESPON',ftString,True,False);
  FCodcentrocustod := CreateCmDbField('CODCENTROCUSTOD',ftString,True,False);
  FCodcentrocustoc := CreateCmDbField('CODCENTROCUSTOC',ftString,True,False);
  FCodccustocdevpat := CreateCmDbField('CODCCUSTOCDEVPAT',ftString,True,False);
  FCodccustocdevban := CreateCmDbField('CODCCUSTOCDEVBAN',ftString,True,False);
  FCodalteradorjuros := CreateCmDbField('CODALTERADORJUROS',ftfloat,True,False);
  FCodalteradorcorr := CreateCmDbField('CODALTERADORCORR',ftfloat,True,False);

  IDPLANASS.Required:=True;
  IDPLANOPREV.Required:=True;
  IDPESSJUR.Required:=True;
  IDTITULAR.Required:=True;
  IDCONTASS.Required:=True;
  IDDEPENDENTE.Required:=True;
  SEQPROPOSTA.Required:=True;

  CODTIPDOC.NullIfZero:=True;
  IDEMPRESAPROP.NullIfZero:=True;
  CODALTERADORJUROS.NullIfZero:=True;
  IDPESSOA.NullIfZero:=True;
  IDEMPRESA.NullIfZero:=True;
  CODSUBCONTA.NullIfZero:=True;
  CODPORTFORMA.NullIfZero:=True;
  PLANO.NullIfZero:=True;
  UNIDNEGOC.NullIfZero:=True;
  FLGATIVO.NullIfZero:=True;
  FLGFOLHA.NullIfZero:=True;
  CODALTERADORCORR.NullIfZero:=True;
  FLGCOBCARNE.NullIfZero:=True;
  IDPAGADOR.NullIfZero:=True;

  CODTIPDOC.Required:=False;
  IDEMPRESAPROP.Required:=False;

  CODALTERADORJUROS.Required:=False;
  RECPAGDEVOL.Required:=False;
  CODCENTRORESPON.Required:=False;
  RECPAG.Required:=False;
  IDPESSOA.Required:=False;
  CODTIPDESEMBDEVOL.Required:=False;
  IDEMPRESA.Required:=False;
  CODTIPDESEMBCAR.Required:=False;
  CODSUBCONTA.Required:=False;
  TIPCODIGO.Required:=False;
  CODCENTROCUSTOD.Required:=False;
  CODTIPRECDES.Required:=False;
  CODPORTFORMA.Required:=False;
  PLACONTAD.Required:=False;
  PLANO.Required:=False;
  PLACONTAC.Required:=False;
  UNIDNEGOC.Required:=False;
  FLGATIVO.Required:=False;
  CODCENTROCUSTOC.Required:=False;
  FLGFOLHA.Required:=False;
  CODALTERADORCORR.Required:=False;
  FLGCOBCARNE.Required:=False;
  IDPAGADOR.Required:=False;
  CODCCUSTOCDEVBAN.Required:=False;
  CODCCUSTOCDEVPAT.Required:=False;
  PLACONTACDEVPAT.Required:=False;
  PLACONTACDEVBANCO.Required:=False;
end;

function TDbContass.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

function TDbContass.LoadFromDB: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

Procedure TDbContass.SetUnidNegoc(const Value: TCmDbField);
begin
  FUnidNegoc:=Value;
end;
Procedure TDbContass.SetTipCodigo(const Value: TCmDbField);
begin
  FTipCodigo:=Value;
end;
Procedure TDbContass.SetSeqProposta(const Value: TCmDbField);
begin
  FSeqProposta:=Value;
end;
Procedure TDbContass.SetRecPagDevol(const Value: TCmDbField);
begin
  FRecPagDevol:=Value;
end;
Procedure TDbContass.SetRecPag(const Value: TCmDbField);
begin
  FRecPag:=Value;
end;
Procedure TDbContass.SetPlano(const Value: TCmDbField);
begin
  FPlano:=Value;
end;
Procedure TDbContass.SetPlaContaD(const Value: TCmDbField);
begin
  FPlaContaD:=Value;
end;
Procedure TDbContass.SetPlaContaCDevPat(const Value: TCmDbField);
begin
  FPlaContaCDevPat :=Value;
end;
Procedure TDbContass.SetPlaContaCDevBanco(const Value: TCmDbField);
begin
  FPlaContaCDevBanco:=Value;
end;
Procedure TDbContass.SetPlaContaC(const Value: TCmDbField);
begin
  FPlaContaC:=Value;
end;
Procedure TDbContass.SetIdTitular(const Value: TCmDbField);
begin
  FIdTitular:=Value;
end;
Procedure TDbContass.SetIdPlanoPrev(const Value: TCmDbField);
begin
  FIdPlanoPrev:=Value;
end;
Procedure TDbContass.SetIdPlanass(const Value: TCmDbField);
begin
  FIdPlanass:=Value;
end;
Procedure TDbContass.SetIdPessoa(const Value: TCmDbField);
begin
  FIdPessoa:=Value;
end;
Procedure TDbContass.SetIdPessJur(const Value: TCmDbField);
begin
  FIdPessJur :=Value;
end;
Procedure TDbContass.SetIdPagador(const Value: TCmDbField);
begin
  FIdPagador:=Value;
end;
Procedure TDbContass.SetIdEmpresaProp(const Value: TCmDbField);
begin
  FIdEmpresaProp:=Value;
end;
Procedure TDbContass.SetIdEmpresa (const Value: TCmDbField);
begin
  FIdEmpresa:=Value;
end;
Procedure TDbContass.SetIdDependente(const Value: TCmDbField);
begin
  FIdDependente:=Value;
end;
Procedure TDbContass.SetIdContass(const Value: TCmDbField);
begin
  FIdContass:=Value;
end;
Procedure TDbContass.SetFlgFolha(const Value: TCmDbField);
begin
  FFlgFolha:=Value;
end;
Procedure TDbContass.SetFlgCobCarne(const Value: TCmDbField);
begin
  FFlgCobCarne:=Value;
end;
Procedure TDbContass.SetFlgAtivo(const Value: TCmDbField);
begin
  FFlgAtivo:=Value;
end;
Procedure TDbContass.SetCodTipRecDes(const Value: TCmDbField);
begin
  FCodTipRecDes:=Value;
end;
Procedure TDbContass.SetCodTipDoc(const Value: TCmDbField);
begin
  FCodTipDoc:=Value;
end;
Procedure TDbContass.SetCodTipDesembDevol(const Value: TCmDbField);
begin
  FCodTipDesembDevol:=Value;
end;
Procedure TDbContass.SetCodTipDesembCar (const Value: TCmDbField);
begin
  FCodTipDesembCar:=Value;
end;
Procedure TDbContass.SetCodSubConta(const Value: TCmDbField);
begin
  FCodSubConta:=Value;
end;
Procedure TDbContass.SetCodPortForma(const Value: TCmDbField);
begin
  FCodPortForma:=Value;
end;
Procedure TDbContass.SetCodCentroRespon(const Value: TCmDbField);
begin
  FCodCentroRespon:=Value;
end;
Procedure TDbContass.SetCodCentroCustoD(const Value: TCmDbField);
begin
  FCodCentroCustoD:=Value;
end;
Procedure TDbContass.SetCodCentroCustoC(const Value: TCmDbField);
begin
  FCodCentroCustoC:=Value;
end;
Procedure TDbContass.SetCodCCustoCDevPat(const Value: TCmDbField);
begin
  FCodCCustoCDevPat:=Value;
end;
Procedure TDbContass.SetCodCCustoCDevBan(const Value: TCmDbField);
begin
  FCodCCustoCDevBan:=Value;
end;
Procedure TDbContass.SetCodalteradorjuros(const Value: TCmDbField);
begin
  FCodalteradorjuros:=Value;
end;
Procedure TDbContass.SetCodalteradorCorr(const Value: TCmDbField);
begin
  FCodalteradorCorr:=Value;
end;

end.

