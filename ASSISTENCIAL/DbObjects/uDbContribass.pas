{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sidnei de Brito Marins          }
{ Atualizado Em: 28/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbContribass;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbContribass = class(TCmDbObject)

  private
     FVlraceitadiverg: TCmDbField;
     FUnidnegoc: TCmDbField;
     FTempocobr: TCmDbField;
     FRecpagdevol: TCmDbField;
     FRecpag: TCmDbField;
     FPrioridade: TCmDbField;
     FPlano: TCmDbField;
     FPlacontad: TCmDbField;
     FPlacontacdevpat: TCmDbField;
     FPlacontacdevbanco: TCmDbField;
     FPlacontac: TCmDbField;
     FPagador: TCmDbField;
     FIdtpperiodicidade: TCmDbField;
     FIdrubrica: TCmDbField;
     FIdregra: TCmDbField;
     FIdproventodevol: TCmDbField;
     FIdproventoatraso: TCmDbField;
     FIdprovento: TCmDbField;
     FIdplanass: TCmDbField;
     FIdpessoa: TCmDbField;
     FIdempresaprop: TCmDbField;
     FIdempresa: TCmDbField;
     FIdcontass: TCmDbField;
     FFlgtotal: TCmDbField;
     FFlgjurosdevol: TCmDbField;
     FFlgjurosatraso: TCmDbField;
     FFlgcorrecaodevol: TCmDbField;
     FFlgcorrecaoatraso: TCmDbField;
     FFlgcobevento: TCmDbField;
     FFlgcobcarne: TCmDbField;
     FCodtiprecdes: TCmDbField;
     FCodtipdesembdevol: TCmDbField;
     FCodtipdesembcar: TCmDbField;
     FCodsubconta: TCmDbField;
     FCodportforma: TCmDbField;
     FCodcentrorespon: TCmDbField;
     FCodcentrocustod: TCmDbField;
     FCodcentrocustoc: TCmDbField;
     FCodccustocdevpat: TCmDbField;
     FCodccustocdevban: TCmDbField;
     Procedure SetVlraceitadiverg(const Value: TCmDbField);
     Procedure SetUnidnegoc(const Value: TCmDbField);
     Procedure SetTempocobr(const Value: TCmDbField);
     Procedure SetRecpagdevol(const Value: TCmDbField);
     Procedure SetRecpag(const Value: TCmDbField);
     Procedure SetPrioridade(const Value: TCmDbField);
     Procedure SetPlano(const Value: TCmDbField);
     Procedure SetPlacontad(const Value: TCmDbField);
     Procedure SetPlacontacdevpat(const Value: TCmDbField);
     Procedure SetPlacontacdevbanco(const Value: TCmDbField);
     Procedure SetPlacontac(const Value: TCmDbField);
     Procedure SetPagador(const Value: TCmDbField);
     Procedure SetIdtpperiodicidade(const Value: TCmDbField);
     Procedure SetIdrubrica(const Value: TCmDbField);
     Procedure SetIdregra(const Value: TCmDbField);
     Procedure SetIdproventodevol(const Value: TCmDbField);
     Procedure SetIdproventoatraso(const Value: TCmDbField);
     Procedure SetIdprovento(const Value: TCmDbField);
     Procedure SetIdplanass(const Value: TCmDbField);
     Procedure SetIdpessoa(const Value: TCmDbField);
     Procedure SetIdempresaprop(const Value: TCmDbField);
     Procedure SetIdempresa(const Value: TCmDbField);
     Procedure SetIdcontass(const Value: TCmDbField);
     Procedure SetFlgtotal(const Value: TCmDbField);
     Procedure SetFlgjurosdevol(const Value: TCmDbField);
     Procedure SetFlgjurosatraso(const Value: TCmDbField);
     Procedure SetFlgcorrecaodevol(const Value: TCmDbField);
     Procedure SetFlgcorrecaoatraso(const Value: TCmDbField);
     Procedure SetFlgcobevento(const Value: TCmDbField);
     Procedure SetFlgcobcarne(const Value: TCmDbField);
     Procedure SetCodtiprecdes(const Value: TCmDbField);
     Procedure SetCodtipdesembdevol(const Value: TCmDbField);
     Procedure SetCodtipdesembcar(const Value: TCmDbField);
     Procedure SetCodsubconta(const Value: TCmDbField);
     Procedure SetCodportforma(const Value: TCmDbField);
     Procedure SetCodcentrorespon(const Value: TCmDbField);
     Procedure SetCodcentrocustod(const Value: TCmDbField);
     Procedure SetCodcentrocustoc(const Value: TCmDbField);
     Procedure SetCodccustocdevpat(const Value: TCmDbField);
     Procedure SetCodccustocdevban(const Value: TCmDbField);

  public

     Property Vlraceitadiverg: TCmDbField read FVlraceitadiverg  write SetVlraceitadiverg;
     Property Unidnegoc: TCmDbField read FUnidnegoc  write SetUnidnegoc;
     Property Tempocobr: TCmDbField read FTempocobr  write SetTempocobr;
     Property Recpagdevol: TCmDbField read FRecpagdevol  write SetRecpagdevol;
     Property Recpag: TCmDbField read FRecpag  write SetRecpag;
     Property Prioridade: TCmDbField read FPrioridade  write SetPrioridade;
     Property Plano: TCmDbField read FPlano  write SetPlano;
     Property Placontad: TCmDbField read FPlacontad  write SetPlacontad;
     Property Placontacdevpat: TCmDbField read FPlacontacdevpat  write SetPlacontacdevpat;
     Property Placontacdevbanco: TCmDbField read FPlacontacdevbanco  write SetPlacontacdevbanco;
     Property Placontac: TCmDbField read FPlacontac  write SetPlacontac;
     Property Pagador: TCmDbField read FPagador  write SetPagador;
     Property Idtpperiodicidade: TCmDbField read FIdtpperiodicidade  write SetIdtpperiodicidade;
     Property Idrubrica: TCmDbField read FIdrubrica  write SetIdrubrica;
     Property Idregra: TCmDbField read FIdregra  write SetIdregra;
     Property Idproventodevol: TCmDbField read FIdproventodevol  write SetIdproventodevol;
     Property Idproventoatraso: TCmDbField read FIdproventoatraso  write SetIdproventoatraso;
     Property Idprovento: TCmDbField read FIdprovento  write SetIdprovento;
     Property Idplanass: TCmDbField read FIdplanass  write SetIdplanass;
     Property Idpessoa: TCmDbField read FIdpessoa  write SetIdpessoa;
     Property Idempresaprop: TCmDbField read FIdempresaprop  write SetIdempresaprop;
     Property Idempresa: TCmDbField read FIdempresa  write SetIdempresa;
     Property Idcontass: TCmDbField read FIdcontass  write SetIdcontass;
     Property Flgtotal: TCmDbField read FFlgtotal  write SetFlgtotal;
     Property Flgjurosdevol: TCmDbField read FFlgjurosdevol  write SetFlgjurosdevol;
     Property Flgjurosatraso: TCmDbField read FFlgjurosatraso  write SetFlgjurosatraso;
     Property Flgcorrecaodevol: TCmDbField read FFlgcorrecaodevol  write SetFlgcorrecaodevol;
     Property Flgcorrecaoatraso: TCmDbField read FFlgcorrecaoatraso  write SetFlgcorrecaoatraso;
     Property Flgcobevento: TCmDbField read FFlgcobevento  write SetFlgcobevento;
     Property Flgcobcarne: TCmDbField read FFlgcobcarne  write SetFlgcobcarne;
     Property Codtiprecdes: TCmDbField read FCodtiprecdes  write SetCodtiprecdes;
     Property Codtipdesembdevol: TCmDbField read FCodtipdesembdevol  write SetCodtipdesembdevol;
     Property Codtipdesembcar: TCmDbField read FCodtipdesembcar  write SetCodtipdesembcar;
     Property Codsubconta: TCmDbField read FCodsubconta  write SetCodsubconta;
     Property Codportforma: TCmDbField read FCodportforma  write SetCodportforma;
     Property Codcentrorespon: TCmDbField read FCodcentrorespon  write SetCodcentrorespon;
     Property Codcentrocustod: TCmDbField read FCodcentrocustod  write SetCodcentrocustod;
     Property Codcentrocustoc: TCmDbField read FCodcentrocustoc  write SetCodcentrocustoc;
     Property Codccustocdevpat: TCmDbField read FCodccustocdevpat  write SetCodccustocdevpat;
     Property Codccustocdevban: TCmDbField read FCodccustocdevban  write SetCodccustocdevban;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbContribass }

constructor TDbContribass.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CONTRIBASS';

   fVlraceitadiverg := CreateCmDbField('VLRACEITADIVERG',ftfloat,True,False);
   fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,True,False);
   fTempocobr := CreateCmDbField('TEMPOCOBR',ftfloat,True,False);
   fRecpagdevol := CreateCmDbField('RECPAGDEVOL',ftString,True,False);
   fRecpag := CreateCmDbField('RECPAG',ftString,True,False);
   fPrioridade := CreateCmDbField('PRIORIDADE',ftfloat,True,False);
   fPlano := CreateCmDbField('PLANO',ftfloat,True,False);
   fPlacontad := CreateCmDbField('PLACONTAD',ftString,True,False);
   fPlacontacdevpat := CreateCmDbField('PLACONTACDEVPAT',ftString,True,False);
   fPlacontacdevbanco := CreateCmDbField('PLACONTACDEVBANCO',ftString,True,False);
   fPlacontac := CreateCmDbField('PLACONTAC',ftString,True,False);
   fPagador := CreateCmDbField('PAGADOR',ftString,True,False);
   fIdtpperiodicidade := CreateCmDbField('IDTPPERIODICIDADE',ftfloat,True,False);
   fIdrubrica := CreateCmDbField('IDRUBRICA',ftfloat,True,False);
   fIdregra := CreateCmDbField('IDREGRA',ftfloat,False,False);
   fIdproventodevol := CreateCmDbField('IDPROVENTODEVOL',ftfloat,True,False);
   fIdproventoatraso := CreateCmDbField('IDPROVENTOATRASO',ftfloat,True,False);
   fIdprovento := CreateCmDbField('IDPROVENTO',ftfloat,True,False);
   fIdplanass := CreateCmDbField('IDPLANASS',ftfloat,False,True);
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,False);
   fIdempresaprop := CreateCmDbField('IDEMPRESAPROP',ftfloat,True,False);
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,True,False);
   fIdcontass := CreateCmDbField('IDCONTASS',ftfloat,False,True);
   fFlgtotal := CreateCmDbField('FLGTOTAL',ftfloat,True,False);
   fFlgjurosdevol := CreateCmDbField('FLGJUROSDEVOL',ftfloat,True,False);
   fFlgjurosatraso := CreateCmDbField('FLGJUROSATRASO',ftfloat,True,False);
   fFlgcorrecaodevol := CreateCmDbField('FLGCORRECAODEVOL',ftfloat,True,False);
   fFlgcorrecaoatraso := CreateCmDbField('FLGCORRECAOATRASO',ftfloat,True,False);
   fFlgcobevento := CreateCmDbField('FLGCOBEVENTO',ftfloat,True,False);
   fFlgcobcarne := CreateCmDbField('FLGCOBCARNE',ftfloat,True,False);
   fCodtiprecdes := CreateCmDbField('CODTIPRECDES',ftString,True,False);
   fCodtipdesembdevol := CreateCmDbField('CODTIPDESEMBDEVOL',ftString,True,False);
   fCodtipdesembcar := CreateCmDbField('CODTIPDESEMBCAR',ftString,True,False);
   fCodsubconta := CreateCmDbField('CODSUBCONTA',ftfloat,True,False);
   fCodportforma := CreateCmDbField('CODPORTFORMA',ftfloat,True,False);
   fCodcentrorespon := CreateCmDbField('CODCENTRORESPON',ftString,True,False);
   fCodcentrocustod := CreateCmDbField('CODCENTROCUSTOD',ftString,True,False);
   fCodcentrocustoc := CreateCmDbField('CODCENTROCUSTOC',ftString,True,False);
   fCodccustocdevpat := CreateCmDbField('CODCCUSTOCDEVPAT',ftString,True,False);
   fCodccustocdevban := CreateCmDbField('CODCCUSTOCDEVBAN',ftString,True,False);
end;

function TDbContribass.Insert: Boolean;
begin
  Result := Inherited Insert;
end;

function TDbContribass.LoadFromDB: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

procedure SetVlReceitaDiverg(const Value: TCmDbField);
begin
  FVlReceitaDiverg:=Value;
end;

procedure SetUnidNegoc(const Value: TCmDbField);
begin
  FUnidNegoc:=Value;
end;

procedure SetTempoCobr(const Value: TCmDbField);
begin
  FTempoCobr:=Value;
end;

procedure SetRecPagDevol(const Value: TCmDbField);
begin
  FRecPagDevol:=Value;
end;

procedure SetRecPag(const Value: TCmDbField);
begin
  FRecPag:=Value;
end;

procedure SetPrioridade(const Value: TCmDbField);
begin
  FPrioridade:=Value;
end;

procedure SetPlano(const Value: TCmDbField);
begin
  FPlano:=Value;
end;

procedure SetPlaContaD(const Value: TCmDbField);
begin
  FPlaContaD:=Value;
end;

procedure SetPlaContaCDevPat(const Value: TCmDbField);
begin
  FPlaContaCDevPat:=Value;
end;

procedure SetPlaContaCDevBanco(const Value: TCmDbField);
begin
  FPlaContaCDevBanco:=Value;
end;

procedure SetPlaContaC(const Value: TCmDbField);
begin
  FPlaContaC:=Value;
end;

procedure SetPagador(const Value: TCmDbField);
begin
  FPagador:=Value;
end;

procedure SetIdTpPeriodicidade(const Value: TCmDbField);
begin
  FIdTpPeriodicidade:=Value;
end;

procedure SetIdRubrica(const Value: TCmDbField);
begin
  FIdRubrica:=Value;
end;

procedure SetIdRegra(const Value: TCmDbField);
begin
  FIdRegra:=Value;
end;

procedure SetIdProventoDevol(const Value: TCmDbField);
begin
  FIdProventoDevol:=Value;
end;

procedure SetIdProventoAtraso(const Value: TCmDbField);
begin
  FIdProventoAtraso:=Value;
end;

procedure SetIdProvento(const Value: TCmDbField);
begin
  FIdProvento:=Value;
end;

procedure SetIdPlanass(const Value: TCmDbField);
begin
  FIdPlanass:=Value;
end;

procedure SetIdPessoa(const Value: TCmDbField);
begin
  FIdPessoa:=Value;
end;

procedure SetIdEmpresaProp(const Value: TCmDbField);
begin
  FIdEmpresaProp:=Value;
end;

procedure SetIdEmpresa(const Value: TCmDbField);
begin
  FIdEmpresa:=Value;
end;

procedure SetIdContass(const Value: TCmDbField);
begin
  FIdContass:=Value;
end;

procedure SetFlgTotal(const Value: TCmDbField);
begin
  FFlgTotal:=Value;
end;

procedure SetFlgJurosDevol(const Value: TCmDbField);
begin
  FFlgJurosDevol:=Value;
end;

procedure SetFlgJurosAtraso(const Value: TCmDbField);
begin
  FFlgJurosAtraso:=Value;
end;

procedure SetFlgCorrecaoDevol(const Value: TCmDbField);
begin
  FFlgCorrecaoDevol:=Value;
end;

procedure SetFlgCorrecaoAtraso(const Value: TCmDbField);
begin
  FFlgCorrecaoAtraso:=Value;
end;

procedure SetFlgCobEvento(const Value: TCmDbField);
begin
  FFlgCobEvento:=Value;
end;

procedure SetFlgCobCarne(const Value: TCmDbField);
begin
  FFlgCobCarne:=Value;
end;

procedure SetCodTipRecDes(const Value: TCmDbField);
begin
  FCodTipRecDes:=Value;
end;

procedure SetCodTipDesembDevol(const Value: TCmDbField);
begin
  FCodTipDesembDevol:=Value;
end;

procedure SetCodTipDesembCar(const Value: TCmDbField);
begin
  FCodTipDesembCar:=Value;
end;

procedure SetCodSubConta(const Value: TCmDbField);
begin
  FCodSubConta:=Value;
end;

procedure SetCodPortForma(const Value: TCmDbField);
begin
  FCodPortForma:=Value;
end;

procedure SetCodCentroRespon(const Value: TCmDbField);
begin
  FCodCentroRespon:=Value;
end;

procedure SetCodCentroCustoD(const Value: TCmDbField);
begin
  FCodCentroCustoD:=Value;
end;

procedure SetCodCentroCustoC(const Value: TCmDbField);
begin
  FCodCentroCustoC:=Value;
end;

procedure SetCodCCustoCDevPat(const Value: TCmDbField);
begin
  FCodCCustoCDevPat:=Value;
end;

procedure SetCodCCustoCDevBan(const Value: TCmDbField);
begin
  FCodCCustoCDevBan:=Value;
end;

end.



