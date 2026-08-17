//******************************************************************************
// Data      : 03/01/2007
// Código    : AL_1
// Pendencia : 23705
// SOL       : 40671
// Desc      : Implementação de Controls para gravação da OperRenfix, HistRenfix
//             OperRenfixCurvas e HistRenfixXitens para a Integração de Bloqueio
//             de Penhora com o Jurídico
//******************************************************************************

unit uDbOperrenfix;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbOperrenfix = class(TCmDbObject)

  private
    FMoecodigo: TCmDbField;
    FIdinvestimento: TCmDbField;
    FDataleilao: TCmDbField;
    FVencoperacao: TCmDbField;
    FPlncodigo: TCmDbField;
    FIdoperrenfix: TCmDbField;
    FPuemissao: TCmDbField;
    FFlgnegociacao: TCmDbField;
    FDataliquidacao: TCmDbField;
    FIdclassriscorenfix: TCmDbField;
    FFlgcarthipo: TCmDbField;
    FQtdeoperacao: TCmDbField;
    FFlgoperimplant: TCmDbField;
    FBoleta: TCmDbField;
    FIdtipoinvest: TCmDbField;
    FDataemissao: TCmDbField;
    FIdforcli: TCmDbField;
    FIdplanprevctbpatr: TCmDbField;
    FObservacao: TCmDbField;
    FIdcustodiante: TCmDbField;
    FPumercado: TCmDbField;
    FIdtipooperacao: TCmDbField;
    FDataoperacao: TCmDbField;
    FTxoperacional: TCmDbField;
    FPerctransf: TCmDbField;
    FQtdcarthipo: TCmDbField;
    FIdoperrenfixorig: TCmDbField;
    FIdoperrenfixaplic: TCmDbField;
    FFlgdtrentab: TCmDbField;
    FIdcarteirainvest: TCmDbField;
    FIdusuario: TCmDbField;
    FFlgrecalc: TCmDbField;
    FPuoperacao: TCmDbField;
    FVlroperacao: TCmDbField;
    FCoddocumento: TCmDbField;
    FTxbolsa: TCmDbField;
    procedure SetBoleta(const Value: TCmDbField);
    procedure SetCoddocumento(const Value: TCmDbField);
    procedure SetDataemissao(const Value: TCmDbField);
    procedure SetDataleilao(const Value: TCmDbField);
    procedure SetDataliquidacao(const Value: TCmDbField);
    procedure SetDataoperacao(const Value: TCmDbField);
    procedure SetFlgcarthipo(const Value: TCmDbField);
    procedure SetFlgdtrentab(const Value: TCmDbField);
    procedure SetFlgnegociacao(const Value: TCmDbField);
    procedure SetFlgoperimplant(const Value: TCmDbField);
    procedure SetFlgrecalc(const Value: TCmDbField);
    procedure SetIdcarteirainvest(const Value: TCmDbField);
    procedure SetIdclassriscorenfix(const Value: TCmDbField);
    procedure SetIdcustodiante(const Value: TCmDbField);
    procedure SetIdforcli(const Value: TCmDbField);
    procedure SetIdinvestimento(const Value: TCmDbField);
    procedure SetIdoperrenfix(const Value: TCmDbField);
    procedure SetIdoperrenfixaplic(const Value: TCmDbField);
    procedure SetIdoperrenfixorig(const Value: TCmDbField);
    procedure SetIdplanprevctbpatr(const Value: TCmDbField);
    procedure SetIdtipoinvest(const Value: TCmDbField);
    procedure SetIdtipooperacao(const Value: TCmDbField);
    procedure SetIdusuario(const Value: TCmDbField);
    procedure SetMoecodigo(const Value: TCmDbField);
    procedure SetObservacao(const Value: TCmDbField);
    procedure SetPerctransf(const Value: TCmDbField);
    procedure SetPlncodigo(const Value: TCmDbField);
    procedure SetPuemissao(const Value: TCmDbField);
    procedure SetPumercado(const Value: TCmDbField);
    procedure SetPuoperacao(const Value: TCmDbField);
    procedure SetQtdcarthipo(const Value: TCmDbField);
    procedure SetQtdeoperacao(const Value: TCmDbField);
    procedure SetTxbolsa(const Value: TCmDbField);
    procedure SetTxoperacional(const Value: TCmDbField);
    procedure SetVencoperacao(const Value: TCmDbField);
    procedure SetVlroperacao(const Value: TCmDbField);

  public

     Property Vlroperacao: TCmDbField read FVlroperacao write SetVlroperacao;
     Property Vencoperacao: TCmDbField read FVencoperacao write SetVencoperacao;
     Property Txoperacional: TCmDbField read FTxoperacional write SetTxoperacional;
     Property Txbolsa: TCmDbField read FTxbolsa write SetTxbolsa;
     Property Qtdeoperacao: TCmDbField read FQtdeoperacao write SetQtdeoperacao;
     Property Qtdcarthipo: TCmDbField read FQtdcarthipo write SetQtdcarthipo;
     Property Puoperacao: TCmDbField read FPuoperacao write SetPuoperacao;
     Property Pumercado: TCmDbField read FPumercado write SetPumercado;
     Property Puemissao: TCmDbField read FPuemissao write SetPuemissao;
     Property Plncodigo: TCmDbField read FPlncodigo write SetPlncodigo;
     Property Perctransf: TCmDbField read FPerctransf write SetPerctransf;
     Property Observacao: TCmDbField read FObservacao write SetObservacao;
     Property Moecodigo: TCmDbField read FMoecodigo write SetMoecodigo;
     Property Idusuario: TCmDbField read FIdusuario write SetIdusuario;
     Property Idtipooperacao: TCmDbField read FIdtipooperacao write SetIdtipooperacao;
     Property Idtipoinvest: TCmDbField read FIdtipoinvest write SetIdtipoinvest;
     Property Idplanprevctbpatr: TCmDbField read FIdplanprevctbpatr write SetIdplanprevctbpatr;
     Property Idoperrenfixorig: TCmDbField read FIdoperrenfixorig write SetIdoperrenfixorig;
     Property Idoperrenfixaplic: TCmDbField read FIdoperrenfixaplic write SetIdoperrenfixaplic;
     Property Idoperrenfix: TCmDbField read FIdoperrenfix write SetIdoperrenfix;
     Property Idinvestimento: TCmDbField read FIdinvestimento write SetIdinvestimento;
     Property Idforcli: TCmDbField read FIdforcli write SetIdforcli;
     Property Idcustodiante: TCmDbField read FIdcustodiante write SetIdcustodiante;
     Property Idclassriscorenfix: TCmDbField read FIdclassriscorenfix write SetIdclassriscorenfix;
     Property Idcarteirainvest: TCmDbField read FIdcarteirainvest write SetIdcarteirainvest;
     Property Flgrecalc: TCmDbField read FFlgrecalc write SetFlgrecalc;
     Property Flgoperimplant: TCmDbField read FFlgoperimplant write SetFlgoperimplant;
     Property Flgnegociacao: TCmDbField read FFlgnegociacao write SetFlgnegociacao;
     Property Flgdtrentab: TCmDbField read FFlgdtrentab write SetFlgdtrentab;
     Property Flgcarthipo: TCmDbField read FFlgcarthipo write SetFlgcarthipo;
     Property Dataoperacao: TCmDbField read FDataoperacao write SetDataoperacao;
     Property Dataliquidacao: TCmDbField read FDataliquidacao write SetDataliquidacao;
     Property Dataleilao: TCmDbField read FDataleilao write SetDataleilao;
     Property Dataemissao: TCmDbField read FDataemissao write SetDataemissao;
     Property Coddocumento: TCmDbField read FCoddocumento write SetCoddocumento;
     Property Boleta: TCmDbField read FBoleta write SetBoleta;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbOperrenfix }

constructor TDbOperrenfix.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'OPERRENFIX';

   fVlroperacao := CreateCmDbField('VLROPERACAO',ftfloat,False,False,False,True,'');
   fVencoperacao := CreateCmDbField('VENCOPERACAO',ftDateTime,False,False,False,True,'');
   fTxoperacional := CreateCmDbField('TXOPERACIONAL',ftfloat,False,False,False,True,'');
   fTxbolsa := CreateCmDbField('TXBOLSA',ftfloat,False,False,False,True,'');
   fQtdeoperacao := CreateCmDbField('QTDEOPERACAO',ftfloat,False,False,False,True,'');
   fQtdcarthipo := CreateCmDbField('QTDCARTHIPO',ftfloat,False,False,False,True,'');
   fPuoperacao := CreateCmDbField('PUOPERACAO',ftfloat,False,False,False,True,'');
   fPumercado := CreateCmDbField('PUMERCADO',ftfloat,False,False,False,True,'');
   fPuemissao := CreateCmDbField('PUEMISSAO',ftfloat,False,False,False,True,'');
   fPlncodigo := CreateCmDbField('PLNCODIGO',ftfloat,False,False,False,True,'');
   fPerctransf := CreateCmDbField('PERCTRANSF',ftfloat,False,False,False,True,'');
   fObservacao := CreateCmDbField('OBSERVACAO',ftString,False,False,False,True,'');
   fMoecodigo := CreateCmDbField('MOECODIGO',ftfloat,False,False,False,True,'');
   fIdusuario := CreateCmDbField('IDUSUARIO',ftfloat,False,False,False,True,'');
   fIdtipooperacao := CreateCmDbField('IDTIPOOPERACAO',ftfloat,False,False,False,True,'');
   fIdtipoinvest := CreateCmDbField('IDTIPOINVEST',ftfloat,False,False,False,True,'');
   fIdplanprevctbpatr := CreateCmDbField('IDPLANPREVCTBPATR',ftfloat,False,False,False,True,'');
   fIdoperrenfixorig := CreateCmDbField('IDOPERRENFIXORIG',ftfloat,False,False,False,True,'');
   fIdoperrenfixaplic := CreateCmDbField('IDOPERRENFIXAPLIC',ftfloat,False,False,False,True,'');
   fIdoperrenfix := CreateCmDbField('IDOPERRENFIX',ftfloat,True,True,False,True,'');
   fIdinvestimento := CreateCmDbField('IDINVESTIMENTO',ftfloat,False,False,False,True,'');
   fIdforcli := CreateCmDbField('IDFORCLI',ftfloat,False,False,False,True,'');
   fIdcustodiante := CreateCmDbField('IDCUSTODIANTE',ftfloat,False,False,False,True,'');
   fIdclassriscorenfix := CreateCmDbField('IDCLASSRISCORENFIX',ftfloat,False,False,False,True,'');
   fIdcarteirainvest := CreateCmDbField('IDCARTEIRAINVEST',ftfloat,False,False,False,True,'');
   fFlgrecalc := CreateCmDbField('FLGRECALC',ftString,False,False,False,True,'');
   fFlgoperimplant := CreateCmDbField('FLGOPERIMPLANT',ftString,False,False,False,True,'');
   fFlgnegociacao := CreateCmDbField('FLGNEGOCIACAO',ftString,False,False,False,True,'');
   fFlgdtrentab := CreateCmDbField('FLGDTRENTAB',ftString,False,False,False,True,'');
   fFlgcarthipo := CreateCmDbField('FLGCARTHIPO',ftString,False,False,False,True,'');
   fDataoperacao := CreateCmDbField('DATAOPERACAO',ftDateTime,False,False,False,True,'');
   fDataliquidacao := CreateCmDbField('DATALIQUIDACAO',ftDateTime,False,False,False,True,'');
   fDataleilao := CreateCmDbField('DATALEILAO',ftDateTime,False,False,False,True,'');
   fDataemissao := CreateCmDbField('DATAEMISSAO',ftDateTime,False,False,False,True,'');
   fCoddocumento := CreateCmDbField('CODDOCUMENTO',ftfloat,False,False,False,True,'');
   fBoleta := CreateCmDbField('BOLETA',ftString,False,False,False,True,'');
end;

function TDbOperrenfix.Insert: Boolean;
begin

   fIdoperrenfix.AsFloat := GetSequence('OPERRENFIX');
   Result := Inherited Insert;

end;


procedure TDbOperrenfix.SetBoleta(const Value: TCmDbField);
begin
  FBoleta := Value;
end;

procedure TDbOperrenfix.SetCoddocumento(const Value: TCmDbField);
begin
  FCoddocumento := Value;
end;

procedure TDbOperrenfix.SetDataemissao(const Value: TCmDbField);
begin
  FDataemissao := Value;
end;

procedure TDbOperrenfix.SetDataleilao(const Value: TCmDbField);
begin
  FDataleilao := Value;
end;

procedure TDbOperrenfix.SetDataliquidacao(const Value: TCmDbField);
begin
  FDataliquidacao := Value;
end;

procedure TDbOperrenfix.SetDataoperacao(const Value: TCmDbField);
begin
  FDataoperacao := Value;
end;

procedure TDbOperrenfix.SetFlgcarthipo(const Value: TCmDbField);
begin
  FFlgcarthipo := Value;
end;

procedure TDbOperrenfix.SetFlgdtrentab(const Value: TCmDbField);
begin
  FFlgdtrentab := Value;
end;

procedure TDbOperrenfix.SetFlgnegociacao(const Value: TCmDbField);
begin
  FFlgnegociacao := Value;
end;

procedure TDbOperrenfix.SetFlgoperimplant(const Value: TCmDbField);
begin
  FFlgoperimplant := Value;
end;

procedure TDbOperrenfix.SetFlgrecalc(const Value: TCmDbField);
begin
  FFlgrecalc := Value;
end;

procedure TDbOperrenfix.SetIdcarteirainvest(const Value: TCmDbField);
begin
  FIdcarteirainvest := Value;
end;

procedure TDbOperrenfix.SetIdclassriscorenfix(const Value: TCmDbField);
begin
  FIdclassriscorenfix := Value;
end;

procedure TDbOperrenfix.SetIdcustodiante(const Value: TCmDbField);
begin
  FIdcustodiante := Value;
end;

procedure TDbOperrenfix.SetIdforcli(const Value: TCmDbField);
begin
  FIdforcli := Value;
end;

procedure TDbOperrenfix.SetIdinvestimento(const Value: TCmDbField);
begin
  FIdinvestimento := Value;
end;

procedure TDbOperrenfix.SetIdoperrenfix(const Value: TCmDbField);
begin
  FIdoperrenfix := Value;
end;

procedure TDbOperrenfix.SetIdoperrenfixaplic(const Value: TCmDbField);
begin
  FIdoperrenfixaplic := Value;
end;

procedure TDbOperrenfix.SetIdoperrenfixorig(const Value: TCmDbField);
begin
  FIdoperrenfixorig := Value;
end;

procedure TDbOperrenfix.SetIdplanprevctbpatr(const Value: TCmDbField);
begin
  FIdplanprevctbpatr := Value;
end;

procedure TDbOperrenfix.SetIdtipoinvest(const Value: TCmDbField);
begin
  FIdtipoinvest := Value;
end;

procedure TDbOperrenfix.SetIdtipooperacao(const Value: TCmDbField);
begin
  FIdtipooperacao := Value;
end;

procedure TDbOperrenfix.SetIdusuario(const Value: TCmDbField);
begin
  FIdusuario := Value;
end;

procedure TDbOperrenfix.SetMoecodigo(const Value: TCmDbField);
begin
  FMoecodigo := Value;
end;

procedure TDbOperrenfix.SetObservacao(const Value: TCmDbField);
begin
  FObservacao := Value;
end;

procedure TDbOperrenfix.SetPerctransf(const Value: TCmDbField);
begin
  FPerctransf := Value;
end;

procedure TDbOperrenfix.SetPlncodigo(const Value: TCmDbField);
begin
  FPlncodigo := Value;
end;

procedure TDbOperrenfix.SetPuemissao(const Value: TCmDbField);
begin
  FPuemissao := Value;
end;

procedure TDbOperrenfix.SetPumercado(const Value: TCmDbField);
begin
  FPumercado := Value;
end;

procedure TDbOperrenfix.SetPuoperacao(const Value: TCmDbField);
begin
  FPuoperacao := Value;
end;

procedure TDbOperrenfix.SetQtdcarthipo(const Value: TCmDbField);
begin
  FQtdcarthipo := Value;
end;

procedure TDbOperrenfix.SetQtdeoperacao(const Value: TCmDbField);
begin
  FQtdeoperacao := Value;
end;

procedure TDbOperrenfix.SetTxbolsa(const Value: TCmDbField);
begin
  FTxbolsa := Value;
end;

procedure TDbOperrenfix.SetTxoperacional(const Value: TCmDbField);
begin
  FTxoperacional := Value;
end;

procedure TDbOperrenfix.SetVencoperacao(const Value: TCmDbField);
begin
  FVencoperacao := Value;
end;

procedure TDbOperrenfix.SetVlroperacao(const Value: TCmDbField);
begin
  FVlroperacao := Value;
end;

end.



