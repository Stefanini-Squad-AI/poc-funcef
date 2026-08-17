//******************************************************************************
// Data      : 23/01/2007
// Código    : AL_1
// Pendencia : 23705
// SOL       : 40671
// Desc      : Implementação de Controls para gravação a Integração de Bloqueio
//             de Penhora com o Jurídico
//******************************************************************************

unit uDbPedidofundo;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbPedidofundo = class(TCmDbObject)

  private
    FVlrcota: TCmDbField;
    FDatapedido: TCmDbField;
    FVlrpedido: TCmDbField;
    FCoddocumento: TCmDbField;
    FTrguserinclusao: TCmDbField;
    FIdplanprevctbpatr: TCmDbField;
    FDataliquidacao: TCmDbField;
    FIdtiporesgate: TCmDbField;
    FIdtipoinvest: TCmDbField;
    FIdtipooperacao: TCmDbField;
    FVlrcorretagem: TCmDbField;
    FDatacotizacao: TCmDbField;
    FIdtipocota: TCmDbField;
    FVlrtaxas: TCmDbField;
    FIdfundoinvest: TCmDbField;
    FStaespecificado: TCmDbField;
    FVlrtaxaperf: TCmDbField;
    FVlrcolocacao: TCmDbField;
    FIdcomposicaofundo: TCmDbField;
    FPlncodigo: TCmDbField;
    FNumlancto: TCmDbField;
    FQtdblqpedido: TCmDbField;
    FDataaplicacao: TCmDbField;
    FIdmotivobloqueio: TCmDbField;
    FObservacao: TCmDbField;
    FPlano: TCmDbField;
    FIdpedidofundo: TCmDbField;
    procedure SetCoddocumento(const Value: TCmDbField);
    procedure SetDataaplicacao(const Value: TCmDbField);
    procedure SetDatacotizacao(const Value: TCmDbField);
    procedure SetDataliquidacao(const Value: TCmDbField);
    procedure SetDatapedido(const Value: TCmDbField);
    procedure SetIdcomposicaofundo(const Value: TCmDbField);
    procedure SetIdfundoinvest(const Value: TCmDbField);
    procedure SetIdmotivobloqueio(const Value: TCmDbField);
    procedure SetIdpedidofundo(const Value: TCmDbField);
    procedure SetIdplanprevctbpatr(const Value: TCmDbField);
    procedure SetIdtipocota(const Value: TCmDbField);
    procedure SetIdtipoinvest(const Value: TCmDbField);
    procedure SetIdtipooperacao(const Value: TCmDbField);
    procedure SetIdtiporesgate(const Value: TCmDbField);
    procedure SetNumlancto(const Value: TCmDbField);
    procedure SetObservacao(const Value: TCmDbField);
    procedure SetPlano(const Value: TCmDbField);
    procedure SetPlncodigo(const Value: TCmDbField);
    procedure SetQtdblqpedido(const Value: TCmDbField);
    procedure SetStaespecificado(const Value: TCmDbField);
    procedure SetTrguserinclusao(const Value: TCmDbField);
    procedure SetVlrcolocacao(const Value: TCmDbField);
    procedure SetVlrcorretagem(const Value: TCmDbField);
    procedure SetVlrcota(const Value: TCmDbField);
    procedure SetVlrpedido(const Value: TCmDbField);
    procedure SetVlrtaxaperf(const Value: TCmDbField);
    procedure SetVlrtaxas(const Value: TCmDbField);

  public

     Property Vlrtaxas: TCmDbField read FVlrtaxas write SetVlrtaxas;
     Property Vlrtaxaperf: TCmDbField read FVlrtaxaperf write SetVlrtaxaperf;
     Property Vlrpedido: TCmDbField read FVlrpedido write SetVlrpedido;
     Property Vlrcota: TCmDbField read FVlrcota write SetVlrcota;
     Property Vlrcorretagem: TCmDbField read FVlrcorretagem write SetVlrcorretagem;
     Property Vlrcolocacao: TCmDbField read FVlrcolocacao write SetVlrcolocacao;
     Property Trguserinclusao: TCmDbField read FTrguserinclusao write SetTrguserinclusao;
     Property Staespecificado: TCmDbField read FStaespecificado write SetStaespecificado;
     Property Qtdblqpedido: TCmDbField read FQtdblqpedido write SetQtdblqpedido;
     Property Plncodigo: TCmDbField read FPlncodigo write SetPlncodigo;
     Property Plano: TCmDbField read FPlano write SetPlano;
     Property Observacao: TCmDbField read FObservacao write SetObservacao;
     Property Numlancto: TCmDbField read FNumlancto write SetNumlancto;
     Property Idtiporesgate: TCmDbField read FIdtiporesgate write SetIdtiporesgate;
     Property Idtipooperacao: TCmDbField read FIdtipooperacao write SetIdtipooperacao;
     Property Idtipoinvest: TCmDbField read FIdtipoinvest write SetIdtipoinvest;
     Property Idtipocota: TCmDbField read FIdtipocota write SetIdtipocota;
     Property Idplanprevctbpatr: TCmDbField read FIdplanprevctbpatr write SetIdplanprevctbpatr;
     Property Idpedidofundo: TCmDbField read FIdpedidofundo write SetIdpedidofundo;
     Property Idmotivobloqueio: TCmDbField read FIdmotivobloqueio write SetIdmotivobloqueio;
     Property Idfundoinvest: TCmDbField read FIdfundoinvest write SetIdfundoinvest;
     Property Idcomposicaofundo: TCmDbField read FIdcomposicaofundo write SetIdcomposicaofundo;
     Property Datapedido: TCmDbField read FDatapedido write SetDatapedido;
     Property Dataliquidacao: TCmDbField read FDataliquidacao write SetDataliquidacao;
     Property Datacotizacao: TCmDbField read FDatacotizacao write SetDatacotizacao;
     Property Dataaplicacao: TCmDbField read FDataaplicacao write SetDataaplicacao;
     Property Coddocumento: TCmDbField read FCoddocumento write SetCoddocumento;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbPedidofundo }

constructor TDbPedidofundo.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PEDIDOFUNDO';

   fVlrtaxas := CreateCmDbField('VLRTAXAS',ftfloat,False,False,False,True,'');
   fVlrtaxaperf := CreateCmDbField('VLRTAXAPERF',ftfloat,False,False,False,True,'');
   fVlrpedido := CreateCmDbField('VLRPEDIDO',ftfloat,False,False,False,True,'');
   fVlrcota := CreateCmDbField('VLRCOTA',ftfloat,False,False,False,True,'');
   fVlrcorretagem := CreateCmDbField('VLRCORRETAGEM',ftfloat,False,False,False,True,'');
   fVlrcolocacao := CreateCmDbField('VLRCOLOCACAO',ftfloat,False,False,False,True,'');
   fTrguserinclusao := CreateCmDbField('TRGUSERINCLUSAO',ftString,False,False,False,True,'');
   fStaespecificado := CreateCmDbField('STAESPECIFICADO',ftString,False,False,False,True,'');
   fQtdblqpedido := CreateCmDbField('QTDBLQPEDIDO',ftfloat,False,False,False,True,'');
   fPlncodigo := CreateCmDbField('PLNCODIGO',ftfloat,False,False,False,True,'');
   fPlano := CreateCmDbField('PLANO',ftfloat,False,False,False,True,'');
   fObservacao := CreateCmDbField('OBSERVACAO',ftString,False,False,False,True,'');
   fNumlancto := CreateCmDbField('NUMLANCTO',ftfloat,False,False,False,True,'');
   fIdtiporesgate := CreateCmDbField('IDTIPORESGATE',ftfloat,False,False,False,True,'');
   fIdtipooperacao := CreateCmDbField('IDTIPOOPERACAO',ftfloat,False,False,False,True,'');
   fIdtipoinvest := CreateCmDbField('IDTIPOINVEST',ftfloat,False,False,False,True,'');
   fIdtipocota := CreateCmDbField('IDTIPOCOTA',ftfloat,False,False,False,True,'');
   fIdplanprevctbpatr := CreateCmDbField('IDPLANPREVCTBPATR',ftfloat,False,False,False,True,'');
   fIdpedidofundo := CreateCmDbField('IDPEDIDOFUNDO',ftfloat,True,True,False,True,'');
   fIdmotivobloqueio := CreateCmDbField('IDMOTIVOBLOQUEIO',ftfloat,False,False,False,True,'');
   fIdfundoinvest := CreateCmDbField('IDFUNDOINVEST',ftfloat,False,False,False,True,'');
   fIdcomposicaofundo := CreateCmDbField('IDCOMPOSICAOFUNDO',ftfloat,False,False,False,True,'');
   fDatapedido := CreateCmDbField('DATAPEDIDO',ftDateTime,False,False,False,True,'');
   fDataliquidacao := CreateCmDbField('DATALIQUIDACAO',ftDateTime,False,False,False,True,'');
   fDatacotizacao := CreateCmDbField('DATACOTIZACAO',ftDateTime,False,False,False,True,'');
   fDataaplicacao := CreateCmDbField('DATAAPLICACAO',ftDateTime,False,False,False,True,'');
   fCoddocumento := CreateCmDbField('CODDOCUMENTO',ftfloat,False,False,False,True,'');
end;

function TDbPedidofundo.Insert: Boolean;
begin

   fIdpedidofundo.AsFloat := GetSequence('PEDIDOFUNDO');
   Result := Inherited Insert;

end;


procedure TDbPedidofundo.SetCoddocumento(const Value: TCmDbField);
begin
  FCoddocumento := Value;
end;

procedure TDbPedidofundo.SetDataaplicacao(const Value: TCmDbField);
begin
  FDataaplicacao := Value;
end;

procedure TDbPedidofundo.SetDatacotizacao(const Value: TCmDbField);
begin
  FDatacotizacao := Value;
end;

procedure TDbPedidofundo.SetDataliquidacao(const Value: TCmDbField);
begin
  FDataliquidacao := Value;
end;

procedure TDbPedidofundo.SetDatapedido(const Value: TCmDbField);
begin
  FDatapedido := Value;
end;

procedure TDbPedidofundo.SetIdcomposicaofundo(const Value: TCmDbField);
begin
  FIdcomposicaofundo := Value;
end;

procedure TDbPedidofundo.SetIdfundoinvest(const Value: TCmDbField);
begin
  FIdfundoinvest := Value;
end;

procedure TDbPedidofundo.SetIdmotivobloqueio(const Value: TCmDbField);
begin
  FIdmotivobloqueio := Value;
end;

procedure TDbPedidofundo.SetIdpedidofundo(const Value: TCmDbField);
begin
  FIdpedidofundo := Value;
end;

procedure TDbPedidofundo.SetIdplanprevctbpatr(const Value: TCmDbField);
begin
  FIdplanprevctbpatr := Value;
end;

procedure TDbPedidofundo.SetIdtipocota(const Value: TCmDbField);
begin
  FIdtipocota := Value;
end;

procedure TDbPedidofundo.SetIdtipoinvest(const Value: TCmDbField);
begin
  FIdtipoinvest := Value;
end;

procedure TDbPedidofundo.SetIdtipooperacao(const Value: TCmDbField);
begin
  FIdtipooperacao := Value;
end;

procedure TDbPedidofundo.SetIdtiporesgate(const Value: TCmDbField);
begin
  FIdtiporesgate := Value;
end;

procedure TDbPedidofundo.SetNumlancto(const Value: TCmDbField);
begin
  FNumlancto := Value;
end;

procedure TDbPedidofundo.SetObservacao(const Value: TCmDbField);
begin
  FObservacao := Value;
end;

procedure TDbPedidofundo.SetPlano(const Value: TCmDbField);
begin
  FPlano := Value;
end;

procedure TDbPedidofundo.SetPlncodigo(const Value: TCmDbField);
begin
  FPlncodigo := Value;
end;

procedure TDbPedidofundo.SetQtdblqpedido(const Value: TCmDbField);
begin
  FQtdblqpedido := Value;
end;

procedure TDbPedidofundo.SetStaespecificado(const Value: TCmDbField);
begin
  FStaespecificado := Value;
end;

procedure TDbPedidofundo.SetTrguserinclusao(const Value: TCmDbField);
begin
  FTrguserinclusao := Value;
end;

procedure TDbPedidofundo.SetVlrcolocacao(const Value: TCmDbField);
begin
  FVlrcolocacao := Value;
end;

procedure TDbPedidofundo.SetVlrcorretagem(const Value: TCmDbField);
begin
  FVlrcorretagem := Value;
end;

procedure TDbPedidofundo.SetVlrcota(const Value: TCmDbField);
begin
  FVlrcota := Value;
end;

procedure TDbPedidofundo.SetVlrpedido(const Value: TCmDbField);
begin
  FVlrpedido := Value;
end;

procedure TDbPedidofundo.SetVlrtaxaperf(const Value: TCmDbField);
begin
  FVlrtaxaperf := Value;
end;

procedure TDbPedidofundo.SetVlrtaxas(const Value: TCmDbField);
begin
  FVlrtaxas := Value;
end;

end.



