{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 15/01/2007                             }
{                                                       }
{*******************************************************}

unit uDbMemoCalcSegrega;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbMemoCalcSegrega = class(TCmDbObject)

  private
    FTrguserinclusao: TCmDbField;
    FLactipconvger: TCmDbField;
    FLacnumlan: TCmDbField;
    FLacdebcre: TCmDbField;
    FLachist3: TCmDbField;
    FPlano: TCmDbField;
    FLactipo: TCmDbField;
    FLacvalgeren2: TCmDbField;
    FLacvaloficial: TCmDbField;
    FTipcodigo: TCmDbField;
    FDatasegregacriter: TCmDbField;
    FHitcodhist: TCmDbField;
    FIdplanoprev: TCmDbField;
    FIdelemdemonstrat: TCmDbField;
    FIdpessoa: TCmDbField;
    FLacorigemaplic: TCmDbField;
    FLactipconvgeren1: TCmDbField;
    FLacnumdoc: TCmDbField;
    FUnidnegoc: TCmDbField;
    FIdpatro: TCmDbField;
    FLotetransmissao: TCmDbField;
    FLachist2: TCmDbField;
    FLacvalhist: TCmDbField;
    FLachist5: TCmDbField;
    FLachist4: TCmDbField;
    FTrgdtinclusao: TCmDbField;
    FLachist1: TCmDbField;
    FPlncodigo: TCmDbField;
    FLacatoutmoeda: TCmDbField;
    FLactipconvgeren2: TCmDbField;
    FIdsegregacriter: TCmDbField;
    FIdusuarioinclusao: TCmDbField;
    FIdsegregacao: TCmDbField;
    FCodcentrocusto: TCmDbField;
    FIdsegregacontr: TCmDbField;
    FIdmodulo: TCmDbField;
    FLacvalgeren1: TCmDbField;
    FLacvalor: TCmDbField;
    FLactipconvoficial: TCmDbField;
    FLacvalgerencial: TCmDbField;
    FPlaconta: TCmDbField;
    FIdempresa: TCmDbField;
    FCodsubconta: TCmDbField;
    procedure SetCodcentrocusto(const Value: TCmDbField);
    procedure SetCodsubconta(const Value: TCmDbField);
    procedure SetDatasegregacriter(const Value: TCmDbField);
    procedure SetHitcodhist(const Value: TCmDbField);
    procedure SetIdelemdemonstrat(const Value: TCmDbField);
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetIdmodulo(const Value: TCmDbField);
    procedure SetIdpatro(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);
    procedure SetIdsegregacao(const Value: TCmDbField);
    procedure SetIdsegregacontr(const Value: TCmDbField);
    procedure SetIdsegregacriter(const Value: TCmDbField);
    procedure SetIdusuarioinclusao(const Value: TCmDbField);
    procedure SetLacatoutmoeda(const Value: TCmDbField);
    procedure SetLacdebcre(const Value: TCmDbField);
    procedure SetLachist1(const Value: TCmDbField);
    procedure SetLachist2(const Value: TCmDbField);
    procedure SetLachist3(const Value: TCmDbField);
    procedure SetLachist4(const Value: TCmDbField);
    procedure SetLachist5(const Value: TCmDbField);
    procedure SetLacnumdoc(const Value: TCmDbField);
    procedure SetLacnumlan(const Value: TCmDbField);
    procedure SetLacorigemaplic(const Value: TCmDbField);
    procedure SetLactipconvger(const Value: TCmDbField);
    procedure SetLactipconvgeren1(const Value: TCmDbField);
    procedure SetLactipconvgeren2(const Value: TCmDbField);
    procedure SetLactipconvoficial(const Value: TCmDbField);
    procedure SetLactipo(const Value: TCmDbField);
    procedure SetLacvalgeren1(const Value: TCmDbField);
    procedure SetLacvalgeren2(const Value: TCmDbField);
    procedure SetLacvalgerencial(const Value: TCmDbField);
    procedure SetLacvalhist(const Value: TCmDbField);
    procedure SetLacvaloficial(const Value: TCmDbField);
    procedure SetLacvalor(const Value: TCmDbField);
    procedure SetLotetransmissao(const Value: TCmDbField);
    procedure SetPlaconta(const Value: TCmDbField);
    procedure SetPlano(const Value: TCmDbField);
    procedure SetPlncodigo(const Value: TCmDbField);
    procedure SetTipcodigo(const Value: TCmDbField);
    procedure SetTrgdtinclusao(const Value: TCmDbField);
    procedure SetTrguserinclusao(const Value: TCmDbField);
    procedure SetUnidnegoc(const Value: TCmDbField);

  public

     Property Unidnegoc: TCmDbField read FUnidnegoc write SetUnidnegoc;
     Property Trguserinclusao: TCmDbField read FTrguserinclusao write SetTrguserinclusao;
     Property Trgdtinclusao: TCmDbField read FTrgdtinclusao write SetTrgdtinclusao;
     Property Tipcodigo: TCmDbField read FTipcodigo write SetTipcodigo;
     Property Plncodigo: TCmDbField read FPlncodigo write SetPlncodigo;
     Property Plano: TCmDbField read FPlano write SetPlano;
     Property Placonta: TCmDbField read FPlaconta write SetPlaconta;
     Property Lotetransmissao: TCmDbField read FLotetransmissao write SetLotetransmissao;
     Property Lacvalor: TCmDbField read FLacvalor write SetLacvalor;
     Property Lacvaloficial: TCmDbField read FLacvaloficial write SetLacvaloficial;
     Property Lacvalhist: TCmDbField read FLacvalhist write SetLacvalhist;
     Property Lacvalgeren2: TCmDbField read FLacvalgeren2 write SetLacvalgeren2;
     Property Lacvalgeren1: TCmDbField read FLacvalgeren1 write SetLacvalgeren1;
     Property Lacvalgerencial: TCmDbField read FLacvalgerencial write SetLacvalgerencial;
     Property Lactipo: TCmDbField read FLactipo write SetLactipo;
     Property Lactipconvoficial: TCmDbField read FLactipconvoficial write SetLactipconvoficial;
     Property Lactipconvgeren2: TCmDbField read FLactipconvgeren2 write SetLactipconvgeren2;
     Property Lactipconvgeren1: TCmDbField read FLactipconvgeren1 write SetLactipconvgeren1;
     Property Lactipconvger: TCmDbField read FLactipconvger write SetLactipconvger;
     Property Lacorigemaplic: TCmDbField read FLacorigemaplic write SetLacorigemaplic;
     Property Lacnumlan: TCmDbField read FLacnumlan write SetLacnumlan;
     Property Lacnumdoc: TCmDbField read FLacnumdoc write SetLacnumdoc;
     Property Lachist5: TCmDbField read FLachist5 write SetLachist5;
     Property Lachist4: TCmDbField read FLachist4 write SetLachist4;
     Property Lachist3: TCmDbField read FLachist3 write SetLachist3;
     Property Lachist2: TCmDbField read FLachist2 write SetLachist2;
     Property Lachist1: TCmDbField read FLachist1 write SetLachist1;
     Property Lacdebcre: TCmDbField read FLacdebcre write SetLacdebcre;
     Property Lacatoutmoeda: TCmDbField read FLacatoutmoeda write SetLacatoutmoeda;
     Property Idusuarioinclusao: TCmDbField read FIdusuarioinclusao write SetIdusuarioinclusao;
     Property Idsegregacriter: TCmDbField read FIdsegregacriter write SetIdsegregacriter;
     Property Idsegregacontr: TCmDbField read FIdsegregacontr write SetIdsegregacontr;
     Property Idsegregacao: TCmDbField read FIdsegregacao write SetIdsegregacao;
     Property Idplanoprev: TCmDbField read FIdplanoprev write SetIdplanoprev;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idpatro: TCmDbField read FIdpatro write SetIdpatro;
     Property Idmodulo: TCmDbField read FIdmodulo write SetIdmodulo;
     Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;
     Property Idelemdemonstrat: TCmDbField read FIdelemdemonstrat write SetIdelemdemonstrat;
     Property Hitcodhist: TCmDbField read FHitcodhist write SetHitcodhist;
     Property Datasegregacriter: TCmDbField read FDatasegregacriter write SetDatasegregacriter;
     Property Codsubconta: TCmDbField read FCodsubconta write SetCodsubconta;
     Property Codcentrocusto: TCmDbField read FCodcentrocusto write SetCodcentrocusto;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbMemoCalcSegrega }

constructor TDbMemoCalcSegrega.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'MEMOCALCSEGREGA';

   fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,False,False,False,True,'');
   fTrguserinclusao := CreateCmDbField('TRGUSERINCLUSAO',ftString,False,False,False,True,'');
   fTrgdtinclusao := CreateCmDbField('TRGDTINCLUSAO',ftDateTime,False,False,False,True,'');
   fTipcodigo := CreateCmDbField('TIPCODIGO',ftString,False,False,False,True,'');
   fPlncodigo := CreateCmDbField('PLNCODIGO',ftfloat,True,False,False,True,'');
   fPlano := CreateCmDbField('PLANO',ftfloat,True,False,False,True,'');
   fPlaconta := CreateCmDbField('PLACONTA',ftString,True,False,False,True,'');
   fLotetransmissao := CreateCmDbField('LOTETRANSMISSAO',ftfloat,False,False,False,True,'');
   fLacvalor := CreateCmDbField('LACVALOR',ftfloat,False,False,False,True,'');
   fLacvaloficial := CreateCmDbField('LACVALOFICIAL',ftfloat,False,False,False,True,'');
   fLacvalhist := CreateCmDbField('LACVALHIST',ftfloat,False,False,False,True,'');
   fLacvalgeren2 := CreateCmDbField('LACVALGEREN2',ftfloat,False,False,False,True,'');
   fLacvalgeren1 := CreateCmDbField('LACVALGEREN1',ftfloat,False,False,False,True,'');
   fLacvalgerencial := CreateCmDbField('LACVALGERENCIAL',ftfloat,False,False,False,True,'');
   fLactipo := CreateCmDbField('LACTIPO',ftString,True,False,False,True,'');
   fLactipconvoficial := CreateCmDbField('LACTIPCONVOFICIAL',ftString,False,False,False,True,'');
   fLactipconvgeren2 := CreateCmDbField('LACTIPCONVGEREN2',ftString,False,False,False,True,'');
   fLactipconvgeren1 := CreateCmDbField('LACTIPCONVGEREN1',ftString,False,False,False,True,'');
   fLactipconvger := CreateCmDbField('LACTIPCONVGER',ftString,False,False,False,True,'');
   fLacorigemaplic := CreateCmDbField('LACORIGEMAPLIC',ftString,False,False,False,True,'');
   fLacnumlan := CreateCmDbField('LACNUMLAN',ftfloat,True,False,False,True,'');
   fLacnumdoc := CreateCmDbField('LACNUMDOC',ftString,False,False,False,True,'');
   fLachist5 := CreateCmDbField('LACHIST5',ftString,False,False,False,True,'');
   fLachist4 := CreateCmDbField('LACHIST4',ftString,False,False,False,True,'');
   fLachist3 := CreateCmDbField('LACHIST3',ftString,False,False,False,True,'');
   fLachist2 := CreateCmDbField('LACHIST2',ftString,False,False,False,True,'');
   fLachist1 := CreateCmDbField('LACHIST1',ftString,True,False,False,True,'');
   fLacdebcre := CreateCmDbField('LACDEBCRE',ftString,True,False,False,True,'');
   fLacatoutmoeda := CreateCmDbField('LACATOUTMOEDA',ftString,False,False,False,True,'');
   fIdusuarioinclusao := CreateCmDbField('IDUSUARIOINCLUSAO',ftfloat,False,False,False,True,'');
   fIdsegregacriter := CreateCmDbField('IDSEGREGACRITER',ftfloat,False,False,False,True,'');
   fIdsegregacontr := CreateCmDbField('IDSEGREGACONTR',ftfloat,False,False,False,True,'');
   fIdsegregacao := CreateCmDbField('IDSEGREGACAO',ftfloat,False,False,False,True,'');
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fIdpatro := CreateCmDbField('IDPATRO',ftfloat,False,False,False,True,'');
   fIdmodulo := CreateCmDbField('IDMODULO',ftfloat,False,False,False,True,'');
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,False,False,False,True,'');
   fIdelemdemonstrat := CreateCmDbField('IDELEMDEMONSTRAT',ftfloat,False,False,False,True,'');
   fHitcodhist := CreateCmDbField('HITCODHIST',ftString,False,False,False,True,'');
   fDatasegregacriter := CreateCmDbField('DATASEGREGACRITER',ftDateTime,False,False,False,True,'');
   fCodsubconta := CreateCmDbField('CODSUBCONTA',ftfloat,False,False,False,True,'');
   fCodcentrocusto := CreateCmDbField('CODCENTROCUSTO',ftString,False,False,False,True,'');
end;

function TDbMemoCalcSegrega.Insert: Boolean;
begin

   Result := Inherited Insert;

end;


procedure TDbMemoCalcSegrega.SetCodcentrocusto(const Value: TCmDbField);
begin
  FCodcentrocusto := Value;
end;

procedure TDbMemoCalcSegrega.SetCodsubconta(const Value: TCmDbField);
begin
  FCodsubconta := Value;
end;

procedure TDbMemoCalcSegrega.SetDatasegregacriter(const Value: TCmDbField);
begin
  FDatasegregacriter := Value;
end;

procedure TDbMemoCalcSegrega.SetHitcodhist(const Value: TCmDbField);
begin
  FHitcodhist := Value;
end;

procedure TDbMemoCalcSegrega.SetIdelemdemonstrat(const Value: TCmDbField);
begin
  FIdelemdemonstrat := Value;
end;

procedure TDbMemoCalcSegrega.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;

procedure TDbMemoCalcSegrega.SetIdmodulo(const Value: TCmDbField);
begin
  FIdmodulo := Value;
end;

procedure TDbMemoCalcSegrega.SetIdpatro(const Value: TCmDbField);
begin
  FIdpatro := Value;
end;

procedure TDbMemoCalcSegrega.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbMemoCalcSegrega.SetIdplanoprev(const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

procedure TDbMemoCalcSegrega.SetIdsegregacao(const Value: TCmDbField);
begin
  FIdsegregacao := Value;
end;

procedure TDbMemoCalcSegrega.SetIdsegregacontr(const Value: TCmDbField);
begin
  FIdsegregacontr := Value;
end;

procedure TDbMemoCalcSegrega.SetIdsegregacriter(const Value: TCmDbField);
begin
  FIdsegregacriter := Value;
end;

procedure TDbMemoCalcSegrega.SetIdusuarioinclusao(const Value: TCmDbField);
begin
  FIdusuarioinclusao := Value;
end;

procedure TDbMemoCalcSegrega.SetLacatoutmoeda(const Value: TCmDbField);
begin
  FLacatoutmoeda := Value;
end;

procedure TDbMemoCalcSegrega.SetLacdebcre(const Value: TCmDbField);
begin
  FLacdebcre := Value;
end;

procedure TDbMemoCalcSegrega.SetLachist1(const Value: TCmDbField);
begin
  FLachist1 := Value;
end;

procedure TDbMemoCalcSegrega.SetLachist2(const Value: TCmDbField);
begin
  FLachist2 := Value;
end;

procedure TDbMemoCalcSegrega.SetLachist3(const Value: TCmDbField);
begin
  FLachist3 := Value;
end;

procedure TDbMemoCalcSegrega.SetLachist4(const Value: TCmDbField);
begin
  FLachist4 := Value;
end;

procedure TDbMemoCalcSegrega.SetLachist5(const Value: TCmDbField);
begin
  FLachist5 := Value;
end;

procedure TDbMemoCalcSegrega.SetLacnumdoc(const Value: TCmDbField);
begin
  FLacnumdoc := Value;
end;

procedure TDbMemoCalcSegrega.SetLacnumlan(const Value: TCmDbField);
begin
  FLacnumlan := Value;
end;

procedure TDbMemoCalcSegrega.SetLacorigemaplic(const Value: TCmDbField);
begin
  FLacorigemaplic := Value;
end;

procedure TDbMemoCalcSegrega.SetLactipconvger(const Value: TCmDbField);
begin
  FLactipconvger := Value;
end;

procedure TDbMemoCalcSegrega.SetLactipconvgeren1(const Value: TCmDbField);
begin
  FLactipconvgeren1 := Value;
end;

procedure TDbMemoCalcSegrega.SetLactipconvgeren2(const Value: TCmDbField);
begin
  FLactipconvgeren2 := Value;
end;

procedure TDbMemoCalcSegrega.SetLactipconvoficial(const Value: TCmDbField);
begin
  FLactipconvoficial := Value;
end;

procedure TDbMemoCalcSegrega.SetLactipo(const Value: TCmDbField);
begin
  FLactipo := Value;
end;

procedure TDbMemoCalcSegrega.SetLacvalgeren1(const Value: TCmDbField);
begin
  FLacvalgeren1 := Value;
end;

procedure TDbMemoCalcSegrega.SetLacvalgeren2(const Value: TCmDbField);
begin
  FLacvalgeren2 := Value;
end;

procedure TDbMemoCalcSegrega.SetLacvalgerencial(const Value: TCmDbField);
begin
  FLacvalgerencial := Value;
end;

procedure TDbMemoCalcSegrega.SetLacvalhist(const Value: TCmDbField);
begin
  FLacvalhist := Value;
end;

procedure TDbMemoCalcSegrega.SetLacvaloficial(const Value: TCmDbField);
begin
  FLacvaloficial := Value;
end;

procedure TDbMemoCalcSegrega.SetLacvalor(const Value: TCmDbField);
begin
  FLacvalor := Value;
end;

procedure TDbMemoCalcSegrega.SetLotetransmissao(const Value: TCmDbField);
begin
  FLotetransmissao := Value;
end;

procedure TDbMemoCalcSegrega.SetPlaconta(const Value: TCmDbField);
begin
  FPlaconta := Value;
end;

procedure TDbMemoCalcSegrega.SetPlano(const Value: TCmDbField);
begin
  FPlano := Value;
end;

procedure TDbMemoCalcSegrega.SetPlncodigo(const Value: TCmDbField);
begin
  FPlncodigo := Value;
end;

procedure TDbMemoCalcSegrega.SetTipcodigo(const Value: TCmDbField);
begin
  FTipcodigo := Value;
end;

procedure TDbMemoCalcSegrega.SetTrgdtinclusao(const Value: TCmDbField);
begin
  FTrgdtinclusao := Value;
end;

procedure TDbMemoCalcSegrega.SetTrguserinclusao(const Value: TCmDbField);
begin
  FTrguserinclusao := Value;
end;

procedure TDbMemoCalcSegrega.SetUnidnegoc(const Value: TCmDbField);
begin
  FUnidnegoc := Value;
end;

end.



