{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 18/11/2001                             }
{                                                       }
{*******************************************************}
{-------------------------------------------------------------------------------
Rotina    : Divs
Data      : 29/09/2004
Autor     : Alex Pereira
pendência : 17193
Descrição : Segregação de recursos - na Origem
            Criar estrutura para gerar uma capa de lote para lançamentos de segregação
            Novo campo LANCAMENTO.IDSEGREGACONTR
-------------------------------------------------------------------------------}
(*==============================================================================
Analista : Alex Pereira
Data     : 05/01/04
Pendência: 14451
Solução  : Criar a estrutura IDSEGREGACRITER e DATASEGREGACRITER
           no lançamento contábil
==============================================================================*)

unit uDbImobLancamento;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbImobLancamento = class(TCmDbObject)

  private
    FLacvalhist: TCmDbField;
    FIdpatro: TCmDbField;
    FUnidnegoc: TCmDbField;
    FLactipconvger: TCmDbField;
    FLacnumdoc: TCmDbField;
    FCodsubconta: TCmDbField;
    FLacvaloficial: TCmDbField;
    FLachist1: TCmDbField;
    FLacorigemaplic: TCmDbField;
    FLacvalor: TCmDbField;
    FLachist2: TCmDbField;
    FLachist3: TCmDbField;
    FLacvalgeren2: TCmDbField;
    FCodcentrocusto: TCmDbField;
    FLacvalgerencial: TCmDbField;
    FLactipo: TCmDbField;
    FPlano: TCmDbField;
    FLachist5: TCmDbField;
    FLacnumlan: TCmDbField;
    FIdelemdemonstrat: TCmDbField;
    FLactipconvgeren2: TCmDbField;
    FHitcodhist: TCmDbField;
    FLotetransmissao: TCmDbField;
    FLachist4: TCmDbField;
    FLacatoutmoeda: TCmDbField;
    FIdplanoprev: TCmDbField;
    FLactipconvgeren1: TCmDbField;
    FIdmodulo: TCmDbField;
    FPlncodigo: TCmDbField;
    FIdpessoa: TCmDbField;
    FIdusuarioinclusao: TCmDbField;
    FTipcodigo: TCmDbField;
    FLacvalgeren1: TCmDbField;
    FIdempresa: TCmDbField;
    FPlaconta: TCmDbField;
    FLactipconvoficial: TCmDbField;
    FLacdebcre: TCmDbField;
    FIdsegregacriter: TCmDbField;
    FDatasegregacriter: TCmDbField;
    FIdsegregacontr: TCmDbField;
    FCodDocumento: TCmDbField;
    procedure SetCodcentrocusto(const Value: TCmDbField);
    procedure SetCodsubconta(const Value: TCmDbField);
    procedure SetHitcodhist(const Value: TCmDbField);
    procedure SetIdelemdemonstrat(const Value: TCmDbField);
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetIdmodulo(const Value: TCmDbField);
    procedure SetIdpatro(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);
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
    procedure SetUnidnegoc(const Value: TCmDbField);
    procedure SetDatasegregacriter(const Value: TCmDbField);
    procedure SetIdsegregacriter(const Value: TCmDbField);
    procedure SetIdsegregacontr(const Value: TCmDbField);
    procedure SetCodDocumento(const Value: TCmDbField);

  public

     // 30/01/07 23897 Alex - Nova estrutura CODDOCUMENTO - A ser utilizado no bjunta para baixa de documentos
     property CodDocumento: TCmDbField read FCodDocumento write SetCodDocumento;

     // 05/01/04 - 14451 - Nova estrutura SEGREGACRITER
     Property Idsegregacriter: TCmDbField read FIdsegregacriter write SetIdsegregacriter;
     Property Datasegregacriter: TCmDbField read FDatasegregacriter write SetDatasegregacriter;
     // fim 05/01/04 - 14451 - Nova estrutura SEGREGACRITER

     // 29/09/04 17193 Alex - Nova estrutura IDSEGREGACONTR
     property Idsegregacontr: TCmDbField read FIdsegregacontr write SetIdsegregacontr;

     Property Unidnegoc: TCmDbField read FUnidnegoc write SetUnidnegoc;
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
     Property Idplanoprev: TCmDbField read FIdplanoprev write SetIdplanoprev;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idpatro: TCmDbField read FIdpatro write SetIdpatro;
     Property Idmodulo: TCmDbField read FIdmodulo write SetIdmodulo;
     Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;
     Property Idelemdemonstrat: TCmDbField read FIdelemdemonstrat write SetIdelemdemonstrat;
     Property Hitcodhist: TCmDbField read FHitcodhist write SetHitcodhist;
     Property Codsubconta: TCmDbField read FCodsubconta write SetCodsubconta;
     Property Codcentrocusto: TCmDbField read FCodcentrocusto write SetCodcentrocusto;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbLancamento }

constructor TDbImobLancamento.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'LANCAMENTO';

  FCodDocumento := CreateCmDbField('CODDOCUMENTO',ftFloat,False,False,False,True);
  FIdsegregacriter := CreateCmDbField('IDSEGREGACRITER',ftFloat,False,False,False,True);
  FDatasegregacriter := CreateCmDbField('DATASEGREGACRITER',ftDateTime,False,False,False,True);
  FIdsegregacontr := CreateCmDbField('IDSEGREGACONTR',ftFloat,False,False,False,True);
  fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,False,False,False,True);
  fTipcodigo := CreateCmDbField('TIPCODIGO',ftString,False,False,False,True);
  fPlncodigo := CreateCmDbField('PLNCODIGO',ftfloat,True,True,False,True);
  fPlano := CreateCmDbField('PLANO',ftfloat,True,False,False,True);
  fPlaconta := CreateCmDbField('PLACONTA',ftString,True,False,False,True);
  fLotetransmissao := CreateCmDbField('LOTETRANSMISSAO',ftfloat,False,False,False,True);
  fLacvalor := CreateCmDbField('LACVALOR',ftfloat,False,False,False,False,'',2);
  fLacvaloficial := CreateCmDbField('LACVALOFICIAL',ftfloat,False,False,False,False,'',2);
  fLacvalhist := CreateCmDbField('LACVALHIST',ftfloat,False,False,False,False,'',2);
  fLacvalgeren2 := CreateCmDbField('LACVALGEREN2',ftfloat,False,False,False,False,'',2);
  fLacvalgeren1 := CreateCmDbField('LACVALGEREN1',ftfloat,False,False,False,False,'',2);
  fLacvalgerencial := CreateCmDbField('LACVALGERENCIAL',ftfloat,False,False,False,False,'',2);
  fLactipo := CreateCmDbField('LACTIPO',ftString,True,False,False,True);
  fLactipconvoficial := CreateCmDbField('LACTIPCONVOFICIAL',ftString,False,False,False,True);
  fLactipconvgeren2 := CreateCmDbField('LACTIPCONVGEREN2',ftString,False,False,False,True);
  fLactipconvgeren1 := CreateCmDbField('LACTIPCONVGEREN1',ftString,False,False,False,True);
  fLactipconvger := CreateCmDbField('LACTIPCONVGER',ftString,False,False,False,True);
  fLacorigemaplic := CreateCmDbField('LACORIGEMAPLIC',ftString,False,False,False,True);
  fLacnumlan := CreateCmDbField('LACNUMLAN',ftfloat,True,True,False,True);
  fLacnumdoc := CreateCmDbField('LACNUMDOC',ftString,False,False,False,True);
  fLachist5 := CreateCmDbField('LACHIST5',ftString,False,False,False,True);
  fLachist4 := CreateCmDbField('LACHIST4',ftString,False,False,False,True);
  fLachist3 := CreateCmDbField('LACHIST3',ftString,False,False,False,True);
  fLachist2 := CreateCmDbField('LACHIST2',ftString,False,False,False,True);
  fLachist1 := CreateCmDbField('LACHIST1',ftString,True,False,False,True);
  fLacdebcre := CreateCmDbField('LACDEBCRE',ftString,True,True,False,True);
  fLacatoutmoeda := CreateCmDbField('LACATOUTMOEDA',ftString,False,False,False,True);
  fIdusuarioinclusao := CreateCmDbField('IDUSUARIOINCLUSAO',ftfloat,False,False,False,True);
  fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,False,False,False,True);
  fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,False,False,True);
  fIdpatro := CreateCmDbField('IDPATRO',ftfloat,False,False,False,True);
  fIdmodulo := CreateCmDbField('IDMODULO',ftfloat,True,False,False,True);
  fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,False,False,False,True);
  fIdelemdemonstrat := CreateCmDbField('IDELEMDEMONSTRAT',ftfloat,False,False,False,True);
  fHitcodhist := CreateCmDbField('HITCODHIST',ftString,False,False,False,True);
  fCodsubconta := CreateCmDbField('CODSUBCONTA',ftfloat,False,False,False,True);
  fCodcentrocusto := CreateCmDbField('CODCENTROCUSTO',ftString,False,False,False,True);
end;

function TDbImobLancamento.Insert: Boolean;
begin

   Result := Inherited Insert;

end;

function TDbImobLancamento.LoadFromDb: Boolean;
begin
   Result := Inherited LoadFromDb;
end;

procedure TDbImobLancamento.SetCodcentrocusto(const Value: TCmDbField);
begin
  FCodcentrocusto := Value;
end;

procedure TDbImobLancamento.SetCodDocumento(const Value: TCmDbField);
begin
  FCodDocumento := Value;
end;

procedure TDbImobLancamento.SetCodsubconta(const Value: TCmDbField);
begin
  FCodsubconta := Value;
end;

procedure TDbImobLancamento.SetDatasegregacriter(const Value: TCmDbField);
begin
  FDatasegregacriter := Value;
end;

procedure TDbImobLancamento.SetHitcodhist(const Value: TCmDbField);
begin
  FHitcodhist := Value;
end;

procedure TDbImobLancamento.SetIdelemdemonstrat(const Value: TCmDbField);
begin
  FIdelemdemonstrat := Value;
end;

procedure TDbImobLancamento.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;

procedure TDbImobLancamento.SetIdmodulo(const Value: TCmDbField);
begin
  FIdmodulo := Value;
end;

procedure TDbImobLancamento.SetIdpatro(const Value: TCmDbField);
begin
  FIdpatro := Value;
end;

procedure TDbImobLancamento.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbImobLancamento.SetIdplanoprev(const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

procedure TDbImobLancamento.SetIdsegregacontr(const Value: TCmDbField);
begin
  FIdsegregacontr := Value;
end;

procedure TDbImobLancamento.SetIdsegregacriter(const Value: TCmDbField);
begin
  FIdsegregacriter := Value;
end;

procedure TDbImobLancamento.SetIdusuarioinclusao(const Value: TCmDbField);
begin
  FIdusuarioinclusao := Value;
end;

procedure TDbImobLancamento.SetLacatoutmoeda(const Value: TCmDbField);
begin
  FLacatoutmoeda := Value;
end;

procedure TDbImobLancamento.SetLacdebcre(const Value: TCmDbField);
begin
  FLacdebcre := Value;
end;

procedure TDbImobLancamento.SetLachist1(const Value: TCmDbField);
begin
  FLachist1 := Value;
end;

procedure TDbImobLancamento.SetLachist2(const Value: TCmDbField);
begin
  FLachist2 := Value;
end;

procedure TDbImobLancamento.SetLachist3(const Value: TCmDbField);
begin
  FLachist3 := Value;
end;

procedure TDbImobLancamento.SetLachist4(const Value: TCmDbField);
begin
  FLachist4 := Value;
end;

procedure TDbImobLancamento.SetLachist5(const Value: TCmDbField);
begin
  FLachist5 := Value;
end;

procedure TDbImobLancamento.SetLacnumdoc(const Value: TCmDbField);
begin
  FLacnumdoc := Value;
end;

procedure TDbImobLancamento.SetLacnumlan(const Value: TCmDbField);
begin
  FLacnumlan := Value;
end;

procedure TDbImobLancamento.SetLacorigemaplic(const Value: TCmDbField);
begin
  FLacorigemaplic := Value;
end;

procedure TDbImobLancamento.SetLactipconvger(const Value: TCmDbField);
begin
  FLactipconvger := Value;
end;

procedure TDbImobLancamento.SetLactipconvgeren1(const Value: TCmDbField);
begin
  FLactipconvgeren1 := Value;
end;

procedure TDbImobLancamento.SetLactipconvgeren2(const Value: TCmDbField);
begin
  FLactipconvgeren2 := Value;
end;

procedure TDbImobLancamento.SetLactipconvoficial(const Value: TCmDbField);
begin
  FLactipconvoficial := Value;
end;

procedure TDbImobLancamento.SetLactipo(const Value: TCmDbField);
begin
  FLactipo := Value;
end;

procedure TDbImobLancamento.SetLacvalgeren1(const Value: TCmDbField);
begin
  FLacvalgeren1 := Value;
end;

procedure TDbImobLancamento.SetLacvalgeren2(const Value: TCmDbField);
begin
  FLacvalgeren2 := Value;
end;

procedure TDbImobLancamento.SetLacvalgerencial(const Value: TCmDbField);
begin
  FLacvalgerencial := Value;
end;

procedure TDbImobLancamento.SetLacvalhist(const Value: TCmDbField);
begin
  FLacvalhist := Value;
end;

procedure TDbImobLancamento.SetLacvaloficial(const Value: TCmDbField);
begin
  FLacvaloficial := Value;
end;

procedure TDbImobLancamento.SetLacvalor(const Value: TCmDbField);
begin
  FLacvalor := Value;
end;

procedure TDbImobLancamento.SetLotetransmissao(const Value: TCmDbField);
begin
  FLotetransmissao := Value;
end;

procedure TDbImobLancamento.SetPlaconta(const Value: TCmDbField);
begin
  FPlaconta := Value;
end;

procedure TDbImobLancamento.SetPlano(const Value: TCmDbField);
begin
  FPlano := Value;
end;

procedure TDbImobLancamento.SetPlncodigo(const Value: TCmDbField);
begin
  FPlncodigo := Value;
end;

procedure TDbImobLancamento.SetTipcodigo(const Value: TCmDbField);
begin
  FTipcodigo := Value;
end;

procedure TDbImobLancamento.SetUnidnegoc(const Value: TCmDbField);
begin
  FUnidnegoc := Value;
end;

end.



