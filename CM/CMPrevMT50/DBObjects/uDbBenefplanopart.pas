{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 18/05/2007                             }
{                                                       }
{*******************************************************}

unit uDbBenefplanopart;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbBenefplanopart = class(TCmDbObject)

  private
    FPlacontad: TCmDbField;
    FCodsubconta: TCmDbField;
    FRecpagdevol: TCmDbField;
    FRecpag: TCmDbField;
    FCodtipdoc: TCmDbField;
    FCodcentrocustoca: TCmDbField;
    FPlacontacabn: TCmDbField;
    FPlacontacprovis: TCmDbField;
    FValorbase3: TCmDbField;
    FUnidnegocabn: TCmDbField;
    FCodalteradorcorr: TCmDbField;
    FPlacontadevolpat: TCmDbField;
    FIdempresapropabn: TCmDbField;
    FPlanoabn: TCmDbField;
    FTipcodigo: TCmDbField;
    FCodtiprecdesabn: TCmDbField;
    FPlacontadevola: TCmDbField;
    FCodccustodevola: TCmDbField;
    FPlacontadevol: TCmDbField;
    FPlacontac: TCmDbField;
    FCodcentrorespon: TCmDbField;
    FPlano: TCmDbField;
    FUnidnegoc: TCmDbField;
    FCodalterajurosabn: TCmDbField;
    FCodcentrocustoc: TCmDbField;
    FCodccustocprovis: TCmDbField;
    FCodrecebcapabn: TCmDbField;
    FCodcentrorespona: TCmDbField;
    FTrguserinclusao: TCmDbField;
    FCodtiprecebdevol: TCmDbField;
    FValorbase2: TCmDbField;
    FTipcodigoabn: TCmDbField;
    FCodtiprecdes: TCmDbField;
    FIdempresaabn: TCmDbField;
    FIdpessoa: TCmDbField;
    FPlacontadprovis: TCmDbField;
    FIdbeneficio: TCmDbField;
    FIdempresaprop: TCmDbField;
    FIdplanprevcontab: TCmDbField;
    FIdpessjur: TCmDbField;
    FSeqproposta: TCmDbField;
    FRecpagabn: TCmDbField;
    FCodportformaabn: TCmDbField;
    FIdplanoprev: TCmDbField;
    FIdempresa: TCmDbField;
    FCodsubcontaabn: TCmDbField;
    FCodalteracorrabn: TCmDbField;
    FCodccustodevol: TCmDbField;
    FCodportforma: TCmDbField;
    FPlacontadevpata: TCmDbField;
    FCodccustodprovis: TCmDbField;
    FTrgdtinclusao: TCmDbField;
    FCodtipdocabn: TCmDbField;
    FCodcentrocustod: TCmDbField;
    FCodccustodevpata: TCmDbField;
    FPlacontadabn: TCmDbField;
    FCodccustodevolpat: TCmDbField;
    FValorbase1: TCmDbField;
    FCodcentrocustoda: TCmDbField;
    FCodtiprecebcap: TCmDbField;
    procedure SetCodalteracorrabn(const Value: TCmDbField);
    procedure SetCodalteradorcorr(const Value: TCmDbField);
    procedure SetCodalterajurosabn(const Value: TCmDbField);
    procedure SetCodccustocprovis(const Value: TCmDbField);
    procedure SetCodccustodevol(const Value: TCmDbField);
    procedure SetCodccustodevola(const Value: TCmDbField);
    procedure SetCodccustodevolpat(const Value: TCmDbField);
    procedure SetCodccustodevpata(const Value: TCmDbField);
    procedure SetCodccustodprovis(const Value: TCmDbField);
    procedure SetCodcentrocustoc(const Value: TCmDbField);
    procedure SetCodcentrocustoca(const Value: TCmDbField);
    procedure SetCodcentrocustod(const Value: TCmDbField);
    procedure SetCodcentrocustoda(const Value: TCmDbField);
    procedure SetCodcentrorespon(const Value: TCmDbField);
    procedure SetCodcentrorespona(const Value: TCmDbField);
    procedure SetCodportforma(const Value: TCmDbField);
    procedure SetCodportformaabn(const Value: TCmDbField);
    procedure SetCodrecebcapabn(const Value: TCmDbField);
    procedure SetCodsubconta(const Value: TCmDbField);
    procedure SetCodsubcontaabn(const Value: TCmDbField);
    procedure SetCodtipdoc(const Value: TCmDbField);
    procedure SetCodtipdocabn(const Value: TCmDbField);
    procedure SetCodtiprecdes(const Value: TCmDbField);
    procedure SetCodtiprecdesabn(const Value: TCmDbField);
    procedure SetCodtiprecebcap(const Value: TCmDbField);
    procedure SetCodtiprecebdevol(const Value: TCmDbField);
    procedure SetIdbeneficio(const Value: TCmDbField);
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetIdempresaabn(const Value: TCmDbField);
    procedure SetIdempresaprop(const Value: TCmDbField);
    procedure SetIdempresapropabn(const Value: TCmDbField);
    procedure SetIdpessjur(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);
    procedure SetIdplanprevcontab(const Value: TCmDbField);
    procedure SetPlacontac(const Value: TCmDbField);
    procedure SetPlacontacabn(const Value: TCmDbField);
    procedure SetPlacontacprovis(const Value: TCmDbField);
    procedure SetPlacontad(const Value: TCmDbField);
    procedure SetPlacontadabn(const Value: TCmDbField);
    procedure SetPlacontadevol(const Value: TCmDbField);
    procedure SetPlacontadevola(const Value: TCmDbField);
    procedure SetPlacontadevolpat(const Value: TCmDbField);
    procedure SetPlacontadevpata(const Value: TCmDbField);
    procedure SetPlacontadprovis(const Value: TCmDbField);
    procedure SetPlano(const Value: TCmDbField);
    procedure SetPlanoabn(const Value: TCmDbField);
    procedure SetRecpag(const Value: TCmDbField);
    procedure SetRecpagabn(const Value: TCmDbField);
    procedure SetRecpagdevol(const Value: TCmDbField);
    procedure SetSeqproposta(const Value: TCmDbField);
    procedure SetTipcodigo(const Value: TCmDbField);
    procedure SetTipcodigoabn(const Value: TCmDbField);
    procedure SetTrgdtinclusao(const Value: TCmDbField);
    procedure SetTrguserinclusao(const Value: TCmDbField);
    procedure SetUnidnegoc(const Value: TCmDbField);
    procedure SetUnidnegocabn(const Value: TCmDbField);
    procedure SetValorbase1(const Value: TCmDbField);
    procedure SetValorbase2(const Value: TCmDbField);
    procedure SetValorbase3(const Value: TCmDbField);

  public

     Property Valorbase3: TCmDbField read FValorbase3 write SetValorbase3;
     Property Valorbase2: TCmDbField read FValorbase2 write SetValorbase2;
     Property Valorbase1: TCmDbField read FValorbase1 write SetValorbase1;
     Property Unidnegocabn: TCmDbField read FUnidnegocabn write SetUnidnegocabn;
     Property Unidnegoc: TCmDbField read FUnidnegoc write SetUnidnegoc;
     Property Trguserinclusao: TCmDbField read FTrguserinclusao write SetTrguserinclusao;
     Property Trgdtinclusao: TCmDbField read FTrgdtinclusao write SetTrgdtinclusao;
     Property Tipcodigoabn: TCmDbField read FTipcodigoabn write SetTipcodigoabn;
     Property Tipcodigo: TCmDbField read FTipcodigo write SetTipcodigo;
     Property Seqproposta: TCmDbField read FSeqproposta write SetSeqproposta;
     Property Recpagdevol: TCmDbField read FRecpagdevol write SetRecpagdevol;
     Property Recpagabn: TCmDbField read FRecpagabn write SetRecpagabn;
     Property Recpag: TCmDbField read FRecpag write SetRecpag;
     Property Planoabn: TCmDbField read FPlanoabn write SetPlanoabn;
     Property Plano: TCmDbField read FPlano write SetPlano;
     Property Placontadprovis: TCmDbField read FPlacontadprovis write SetPlacontadprovis;
     Property Placontadevpata: TCmDbField read FPlacontadevpata write SetPlacontadevpata;
     Property Placontadevolpat: TCmDbField read FPlacontadevolpat write SetPlacontadevolpat;
     Property Placontadevola: TCmDbField read FPlacontadevola write SetPlacontadevola;
     Property Placontadevol: TCmDbField read FPlacontadevol write SetPlacontadevol;
     Property Placontadabn: TCmDbField read FPlacontadabn write SetPlacontadabn;
     Property Placontad: TCmDbField read FPlacontad write SetPlacontad;
     Property Placontacprovis: TCmDbField read FPlacontacprovis write SetPlacontacprovis;
     Property Placontacabn: TCmDbField read FPlacontacabn write SetPlacontacabn;
     Property Placontac: TCmDbField read FPlacontac write SetPlacontac;
     Property Idplanprevcontab: TCmDbField read FIdplanprevcontab write SetIdplanprevcontab;
     Property Idplanoprev: TCmDbField read FIdplanoprev write SetIdplanoprev;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idpessjur: TCmDbField read FIdpessjur write SetIdpessjur;
     Property Idempresapropabn: TCmDbField read FIdempresapropabn write SetIdempresapropabn;
     Property Idempresaprop: TCmDbField read FIdempresaprop write SetIdempresaprop;
     Property Idempresaabn: TCmDbField read FIdempresaabn write SetIdempresaabn;
     Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;
     Property Idbeneficio: TCmDbField read FIdbeneficio write SetIdbeneficio;
     Property Codtiprecebdevol: TCmDbField read FCodtiprecebdevol write SetCodtiprecebdevol;
     Property Codtiprecebcap: TCmDbField read FCodtiprecebcap write SetCodtiprecebcap;
     Property Codtiprecdesabn: TCmDbField read FCodtiprecdesabn write SetCodtiprecdesabn;
     Property Codtiprecdes: TCmDbField read FCodtiprecdes write SetCodtiprecdes;
     Property Codtipdocabn: TCmDbField read FCodtipdocabn write SetCodtipdocabn;
     Property Codtipdoc: TCmDbField read FCodtipdoc write SetCodtipdoc;
     Property Codsubcontaabn: TCmDbField read FCodsubcontaabn write SetCodsubcontaabn;
     Property Codsubconta: TCmDbField read FCodsubconta write SetCodsubconta;
     Property Codrecebcapabn: TCmDbField read FCodrecebcapabn write SetCodrecebcapabn;
     Property Codportformaabn: TCmDbField read FCodportformaabn write SetCodportformaabn;
     Property Codportforma: TCmDbField read FCodportforma write SetCodportforma;
     Property Codcentrorespona: TCmDbField read FCodcentrorespona write SetCodcentrorespona;
     Property Codcentrorespon: TCmDbField read FCodcentrorespon write SetCodcentrorespon;
     Property Codcentrocustoda: TCmDbField read FCodcentrocustoda write SetCodcentrocustoda;
     Property Codcentrocustod: TCmDbField read FCodcentrocustod write SetCodcentrocustod;
     Property Codcentrocustoca: TCmDbField read FCodcentrocustoca write SetCodcentrocustoca;
     Property Codcentrocustoc: TCmDbField read FCodcentrocustoc write SetCodcentrocustoc;
     Property Codccustodprovis: TCmDbField read FCodccustodprovis write SetCodccustodprovis;
     Property Codccustodevpata: TCmDbField read FCodccustodevpata write SetCodccustodevpata;
     Property Codccustodevolpat: TCmDbField read FCodccustodevolpat write SetCodccustodevolpat;
     Property Codccustodevola: TCmDbField read FCodccustodevola write SetCodccustodevola;
     Property Codccustodevol: TCmDbField read FCodccustodevol write SetCodccustodevol;
     Property Codccustocprovis: TCmDbField read FCodccustocprovis write SetCodccustocprovis;
     Property Codalterajurosabn: TCmDbField read FCodalterajurosabn write SetCodalterajurosabn;
     Property Codalteradorcorr: TCmDbField read FCodalteradorcorr write SetCodalteradorcorr;
     Property Codalteracorrabn: TCmDbField read FCodalteracorrabn write SetCodalteracorrabn;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbBenefplanopart }

constructor TDbBenefplanopart.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'BENEFPLANOPART';

   fValorbase3 := CreateCmDbField('VALORBASE3',ftfloat,False,False,False,True,'');
   fValorbase2 := CreateCmDbField('VALORBASE2',ftfloat,False,False,False,True,'');
   fValorbase1 := CreateCmDbField('VALORBASE1',ftfloat,False,False,False,True,'');
   fUnidnegocabn := CreateCmDbField('UNIDNEGOCABN',ftfloat,False,False,False,True,'');
   fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,False,False,False,True,'');
   fTrguserinclusao := CreateCmDbField('TRGUSERINCLUSAO',ftString,False,False,False,True,'');
   fTrgdtinclusao := CreateCmDbField('TRGDTINCLUSAO',ftDateTime,False,False,False,True,'');
   fTipcodigoabn := CreateCmDbField('TIPCODIGOABN',ftString,False,False,False,True,'');
   fTipcodigo := CreateCmDbField('TIPCODIGO',ftString,False,False,False,True,'');
   fSeqproposta := CreateCmDbField('SEQPROPOSTA',ftfloat,True,True,False,True,'');
   fRecpagdevol := CreateCmDbField('RECPAGDEVOL',ftString,False,False,False,True,'');
   fRecpagabn := CreateCmDbField('RECPAGABN',ftString,False,False,False,True,'');
   fRecpag := CreateCmDbField('RECPAG',ftString,False,False,False,True,'');
   fPlanoabn := CreateCmDbField('PLANOABN',ftfloat,False,False,False,True,'');
   fPlano := CreateCmDbField('PLANO',ftfloat,False,False,False,True,'');
   fPlacontadprovis := CreateCmDbField('PLACONTADPROVIS',ftString,False,False,False,True,'');
   fPlacontadevpata := CreateCmDbField('PLACONTADEVPATA',ftString,False,False,False,True,'');
   fPlacontadevolpat := CreateCmDbField('PLACONTADEVOLPAT',ftString,False,False,False,True,'');
   fPlacontadevola := CreateCmDbField('PLACONTADEVOLA',ftString,False,False,False,True,'');
   fPlacontadevol := CreateCmDbField('PLACONTADEVOL',ftString,False,False,False,True,'');
   fPlacontadabn := CreateCmDbField('PLACONTADABN',ftString,False,False,False,True,'');
   fPlacontad := CreateCmDbField('PLACONTAD',ftString,False,False,False,True,'');
   fPlacontacprovis := CreateCmDbField('PLACONTACPROVIS',ftString,False,False,False,True,'');
   fPlacontacabn := CreateCmDbField('PLACONTACABN',ftString,False,False,False,True,'');
   fPlacontac := CreateCmDbField('PLACONTAC',ftString,False,False,False,True,'');
   fIdplanprevcontab := CreateCmDbField('IDPLANPREVCONTAB',ftfloat,False,False,False,True,'');
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,True,True,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fIdpessjur := CreateCmDbField('IDPESSJUR',ftfloat,True,True,False,True,'');
   fIdempresapropabn := CreateCmDbField('IDEMPRESAPROPABN',ftfloat,False,False,False,True,'');
   fIdempresaprop := CreateCmDbField('IDEMPRESAPROP',ftfloat,False,False,False,True,'');
   fIdempresaabn := CreateCmDbField('IDEMPRESAABN',ftfloat,False,False,False,True,'');
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,False,False,False,True,'');
   fIdbeneficio := CreateCmDbField('IDBENEFICIO',ftfloat,True,True,False,True,'');
   fCodtiprecebdevol := CreateCmDbField('CODTIPRECEBDEVOL',ftString,False,False,False,True,'');
   fCodtiprecebcap := CreateCmDbField('CODTIPRECEBCAP',ftString,False,False,False,True,'');
   fCodtiprecdesabn := CreateCmDbField('CODTIPRECDESABN',ftString,False,False,False,True,'');
   fCodtiprecdes := CreateCmDbField('CODTIPRECDES',ftString,False,False,False,True,'');
   fCodtipdocabn := CreateCmDbField('CODTIPDOCABN',ftfloat,False,False,False,True,'');
   fCodtipdoc := CreateCmDbField('CODTIPDOC',ftfloat,False,False,False,True,'');
   fCodsubcontaabn := CreateCmDbField('CODSUBCONTAABN',ftfloat,False,False,False,True,'');
   fCodsubconta := CreateCmDbField('CODSUBCONTA',ftfloat,False,False,False,True,'');
   fCodrecebcapabn := CreateCmDbField('CODRECEBCAPABN',ftString,False,False,False,True,'');
   fCodportformaabn := CreateCmDbField('CODPORTFORMAABN',ftfloat,False,False,False,True,'');
   fCodportforma := CreateCmDbField('CODPORTFORMA',ftfloat,False,False,False,True,'');
   fCodcentrorespona := CreateCmDbField('CODCENTRORESPONA',ftString,False,False,False,True,'');
   fCodcentrorespon := CreateCmDbField('CODCENTRORESPON',ftString,False,False,False,True,'');
   fCodcentrocustoda := CreateCmDbField('CODCENTROCUSTODA',ftString,False,False,False,True,'');
   fCodcentrocustod := CreateCmDbField('CODCENTROCUSTOD',ftString,False,False,False,True,'');
   fCodcentrocustoca := CreateCmDbField('CODCENTROCUSTOCA',ftString,False,False,False,True,'');
   fCodcentrocustoc := CreateCmDbField('CODCENTROCUSTOC',ftString,False,False,False,True,'');
   fCodccustodprovis := CreateCmDbField('CODCCUSTODPROVIS',ftString,False,False,False,True,'');
   fCodccustodevpata := CreateCmDbField('CODCCUSTODEVPATA',ftString,False,False,False,True,'');
   fCodccustodevolpat := CreateCmDbField('CODCCUSTODEVOLPAT',ftString,False,False,False,True,'');
   fCodccustodevola := CreateCmDbField('CODCCUSTODEVOLA',ftString,False,False,False,True,'');
   fCodccustodevol := CreateCmDbField('CODCCUSTODEVOL',ftString,False,False,False,True,'');
   fCodccustocprovis := CreateCmDbField('CODCCUSTOCPROVIS',ftString,False,False,False,True,'');
   fCodalterajurosabn := CreateCmDbField('CODALTERAJUROSABN',ftfloat,False,False,False,True,'');
   fCodalteradorcorr := CreateCmDbField('CODALTERADORCORR',ftfloat,False,False,False,True,'');
   fCodalteracorrabn := CreateCmDbField('CODALTERACORRABN',ftfloat,False,False,False,True,'');
end;

function TDbBenefplanopart.Insert: Boolean;
begin

   fSeqproposta.AsFloat := GetSequence('BENEFPLANOPART');
   fIdplanoprev.AsFloat := GetSequence('BENEFPLANOPART');
   fIdpessoa.AsFloat := GetSequence('BENEFPLANOPART');
   fIdpessjur.AsFloat := GetSequence('BENEFPLANOPART');
   fIdbeneficio.AsFloat := GetSequence('BENEFPLANOPART');
   Result := Inherited Insert;

end;


procedure TDbBenefplanopart.SetCodalteracorrabn(const Value: TCmDbField);
begin
  FCodalteracorrabn := Value;
end;

procedure TDbBenefplanopart.SetCodalteradorcorr(const Value: TCmDbField);
begin
  FCodalteradorcorr := Value;
end;

procedure TDbBenefplanopart.SetCodalterajurosabn(const Value: TCmDbField);
begin
  FCodalterajurosabn := Value;
end;

procedure TDbBenefplanopart.SetCodccustocprovis(const Value: TCmDbField);
begin
  FCodccustocprovis := Value;
end;

procedure TDbBenefplanopart.SetCodccustodevol(const Value: TCmDbField);
begin
  FCodccustodevol := Value;
end;

procedure TDbBenefplanopart.SetCodccustodevola(const Value: TCmDbField);
begin
  FCodccustodevola := Value;
end;

procedure TDbBenefplanopart.SetCodccustodevolpat(const Value: TCmDbField);
begin
  FCodccustodevolpat := Value;
end;

procedure TDbBenefplanopart.SetCodccustodevpata(const Value: TCmDbField);
begin
  FCodccustodevpata := Value;
end;

procedure TDbBenefplanopart.SetCodccustodprovis(const Value: TCmDbField);
begin
  FCodccustodprovis := Value;
end;

procedure TDbBenefplanopart.SetCodcentrocustoc(const Value: TCmDbField);
begin
  FCodcentrocustoc := Value;
end;

procedure TDbBenefplanopart.SetCodcentrocustoca(const Value: TCmDbField);
begin
  FCodcentrocustoca := Value;
end;

procedure TDbBenefplanopart.SetCodcentrocustod(const Value: TCmDbField);
begin
  FCodcentrocustod := Value;
end;

procedure TDbBenefplanopart.SetCodcentrocustoda(const Value: TCmDbField);
begin
  FCodcentrocustoda := Value;
end;

procedure TDbBenefplanopart.SetCodcentrorespon(const Value: TCmDbField);
begin
  FCodcentrorespon := Value;
end;

procedure TDbBenefplanopart.SetCodcentrorespona(const Value: TCmDbField);
begin
  FCodcentrorespona := Value;
end;

procedure TDbBenefplanopart.SetCodportforma(const Value: TCmDbField);
begin
  FCodportforma := Value;
end;

procedure TDbBenefplanopart.SetCodportformaabn(const Value: TCmDbField);
begin
  FCodportformaabn := Value;
end;

procedure TDbBenefplanopart.SetCodrecebcapabn(const Value: TCmDbField);
begin
  FCodrecebcapabn := Value;
end;

procedure TDbBenefplanopart.SetCodsubconta(const Value: TCmDbField);
begin
  FCodsubconta := Value;
end;

procedure TDbBenefplanopart.SetCodsubcontaabn(const Value: TCmDbField);
begin
  FCodsubcontaabn := Value;
end;

procedure TDbBenefplanopart.SetCodtipdoc(const Value: TCmDbField);
begin
  FCodtipdoc := Value;
end;

procedure TDbBenefplanopart.SetCodtipdocabn(const Value: TCmDbField);
begin
  FCodtipdocabn := Value;
end;

procedure TDbBenefplanopart.SetCodtiprecdes(const Value: TCmDbField);
begin
  FCodtiprecdes := Value;
end;

procedure TDbBenefplanopart.SetCodtiprecdesabn(const Value: TCmDbField);
begin
  FCodtiprecdesabn := Value;
end;

procedure TDbBenefplanopart.SetCodtiprecebcap(const Value: TCmDbField);
begin
  FCodtiprecebcap := Value;
end;

procedure TDbBenefplanopart.SetCodtiprecebdevol(const Value: TCmDbField);
begin
  FCodtiprecebdevol := Value;
end;

procedure TDbBenefplanopart.SetIdbeneficio(const Value: TCmDbField);
begin
  FIdbeneficio := Value;
end;

procedure TDbBenefplanopart.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;

procedure TDbBenefplanopart.SetIdempresaabn(const Value: TCmDbField);
begin
  FIdempresaabn := Value;
end;

procedure TDbBenefplanopart.SetIdempresaprop(const Value: TCmDbField);
begin
  FIdempresaprop := Value;
end;

procedure TDbBenefplanopart.SetIdempresapropabn(const Value: TCmDbField);
begin
  FIdempresapropabn := Value;
end;

procedure TDbBenefplanopart.SetIdpessjur(const Value: TCmDbField);
begin
  FIdpessjur := Value;
end;

procedure TDbBenefplanopart.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbBenefplanopart.SetIdplanoprev(const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

procedure TDbBenefplanopart.SetIdplanprevcontab(const Value: TCmDbField);
begin
  FIdplanprevcontab := Value;
end;

procedure TDbBenefplanopart.SetPlacontac(const Value: TCmDbField);
begin
  FPlacontac := Value;
end;

procedure TDbBenefplanopart.SetPlacontacabn(const Value: TCmDbField);
begin
  FPlacontacabn := Value;
end;

procedure TDbBenefplanopart.SetPlacontacprovis(const Value: TCmDbField);
begin
  FPlacontacprovis := Value;
end;

procedure TDbBenefplanopart.SetPlacontad(const Value: TCmDbField);
begin
  FPlacontad := Value;
end;

procedure TDbBenefplanopart.SetPlacontadabn(const Value: TCmDbField);
begin
  FPlacontadabn := Value;
end;

procedure TDbBenefplanopart.SetPlacontadevol(const Value: TCmDbField);
begin
  FPlacontadevol := Value;
end;

procedure TDbBenefplanopart.SetPlacontadevola(const Value: TCmDbField);
begin
  FPlacontadevola := Value;
end;

procedure TDbBenefplanopart.SetPlacontadevolpat(const Value: TCmDbField);
begin
  FPlacontadevolpat := Value;
end;

procedure TDbBenefplanopart.SetPlacontadevpata(const Value: TCmDbField);
begin
  FPlacontadevpata := Value;
end;

procedure TDbBenefplanopart.SetPlacontadprovis(const Value: TCmDbField);
begin
  FPlacontadprovis := Value;
end;

procedure TDbBenefplanopart.SetPlano(const Value: TCmDbField);
begin
  FPlano := Value;
end;

procedure TDbBenefplanopart.SetPlanoabn(const Value: TCmDbField);
begin
  FPlanoabn := Value;
end;

procedure TDbBenefplanopart.SetRecpag(const Value: TCmDbField);
begin
  FRecpag := Value;
end;

procedure TDbBenefplanopart.SetRecpagabn(const Value: TCmDbField);
begin
  FRecpagabn := Value;
end;

procedure TDbBenefplanopart.SetRecpagdevol(const Value: TCmDbField);
begin
  FRecpagdevol := Value;
end;

procedure TDbBenefplanopart.SetSeqproposta(const Value: TCmDbField);
begin
  FSeqproposta := Value;
end;

procedure TDbBenefplanopart.SetTipcodigo(const Value: TCmDbField);
begin
  FTipcodigo := Value;
end;

procedure TDbBenefplanopart.SetTipcodigoabn(const Value: TCmDbField);
begin
  FTipcodigoabn := Value;
end;

procedure TDbBenefplanopart.SetTrgdtinclusao(const Value: TCmDbField);
begin
  FTrgdtinclusao := Value;
end;

procedure TDbBenefplanopart.SetTrguserinclusao(const Value: TCmDbField);
begin
  FTrguserinclusao := Value;
end;

procedure TDbBenefplanopart.SetUnidnegoc(const Value: TCmDbField);
begin
  FUnidnegoc := Value;
end;

procedure TDbBenefplanopart.SetUnidnegocabn(const Value: TCmDbField);
begin
  FUnidnegocabn := Value;
end;

procedure TDbBenefplanopart.SetValorbase1(const Value: TCmDbField);
begin
  FValorbase1 := Value;
end;

procedure TDbBenefplanopart.SetValorbase2(const Value: TCmDbField);
begin
  FValorbase2 := Value;
end;

procedure TDbBenefplanopart.SetValorbase3(const Value: TCmDbField);
begin
  FValorbase3 := Value;
end;

end.



