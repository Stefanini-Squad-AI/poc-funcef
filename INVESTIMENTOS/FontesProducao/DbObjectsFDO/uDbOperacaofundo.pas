{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Atualizado Em: 12/02/2007                             }
{                                                       }
{*******************************************************}

unit uDbOperacaofundo;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbOperacaofundo = class(TCmDbObject)

  private
    FIdcarteirainvest: TCmDbField;
    FVlriof: TCmDbField;
    FIdoperacaodireito: TCmDbField;
    FIdplanprevctbpatr: TCmDbField;
    FIdcotaintegraliza: TCmDbField;
    FVlrcota: TCmDbField;
    FVlrdesconto: TCmDbField;
    FStaespecificado: TCmDbField;
    FQtdoperacao: TCmDbField;
    FObservacao: TCmDbField;
    FVlrcorretagem: TCmDbField;
    FDatacotizacao: TCmDbField;
    FCoddocumento: TCmDbField;
    FVlrrendimento: TCmDbField;
    FPlano: TCmDbField;
    FIdfundoinvest: TCmDbField;
    FVlroperacao: TCmDbField;
    FVlrir: TCmDbField;
    FVlrcolocacao: TCmDbField;
    FIdpedidofundo: TCmDbField;
    FVlrtaxas: TCmDbField;
    FPlncodigo: TCmDbField;
    FDataliquidacao: TCmDbField;
    FIdcomposicaofundo: TCmDbField;
    FIdtipooperacao: TCmDbField;
    FIdtipoinvest: TCmDbField;
    FIdoperacaoorigem: TCmDbField;
    FIdoperacaofundo: TCmDbField;
    FIdtipocota: TCmDbField;
    FPercentual: TCmDbField;
    FStaconfirma: TCmDbField;
    FQtdusufruto: TCmDbField;
    FDataoperacao: TCmDbField;
    FIdlote: TCmDbField;
    procedure SetCoddocumento(const Value: TCmDbField);
    procedure SetDatacotizacao(const Value: TCmDbField);
    procedure SetDataliquidacao(const Value: TCmDbField);
    procedure SetDataoperacao(const Value: TCmDbField);
    procedure SetIdcarteirainvest(const Value: TCmDbField);
    procedure SetIdcomposicaofundo(const Value: TCmDbField);
    procedure SetIdcotaintegraliza(const Value: TCmDbField);
    procedure SetIdfundoinvest(const Value: TCmDbField);
    procedure SetIdlote(const Value: TCmDbField);
    procedure SetIdoperacaodireito(const Value: TCmDbField);
    procedure SetIdoperacaofundo(const Value: TCmDbField);
    procedure SetIdoperacaoorigem(const Value: TCmDbField);
    procedure SetIdpedidofundo(const Value: TCmDbField);
    procedure SetIdplanprevctbpatr(const Value: TCmDbField);
    procedure SetIdtipocota(const Value: TCmDbField);
    procedure SetIdtipoinvest(const Value: TCmDbField);
    procedure SetIdtipooperacao(const Value: TCmDbField);
    procedure SetObservacao(const Value: TCmDbField);
    procedure SetPercentual(const Value: TCmDbField);
    procedure SetPlano(const Value: TCmDbField);
    procedure SetPlncodigo(const Value: TCmDbField);
    procedure SetQtdoperacao(const Value: TCmDbField);
    procedure SetQtdusufruto(const Value: TCmDbField);
    procedure SetStaconfirma(const Value: TCmDbField);
    procedure SetStaespecificado(const Value: TCmDbField);
    procedure SetVlrcolocacao(const Value: TCmDbField);
    procedure SetVlrcorretagem(const Value: TCmDbField);
    procedure SetVlrcota(const Value: TCmDbField);
    procedure SetVlrdesconto(const Value: TCmDbField);
    procedure SetVlriof(const Value: TCmDbField);
    procedure SetVlrir(const Value: TCmDbField);
    procedure SetVlroperacao(const Value: TCmDbField);
    procedure SetVlrrendimento(const Value: TCmDbField);
    procedure SetVlrtaxas(const Value: TCmDbField);

  public

     Property Vlrtaxas: TCmDbField read FVlrtaxas write SetVlrtaxas;
     Property Vlrrendimento: TCmDbField read FVlrrendimento write SetVlrrendimento;
     Property Vlroperacao: TCmDbField read FVlroperacao write SetVlroperacao;
     Property Vlrir: TCmDbField read FVlrir write SetVlrir;
     Property Vlriof: TCmDbField read FVlriof write SetVlriof;
     Property Vlrdesconto: TCmDbField read FVlrdesconto write SetVlrdesconto;
     Property Vlrcota: TCmDbField read FVlrcota write SetVlrcota;
     Property Vlrcorretagem: TCmDbField read FVlrcorretagem write SetVlrcorretagem;
     Property Vlrcolocacao: TCmDbField read FVlrcolocacao write SetVlrcolocacao;
     Property Staespecificado: TCmDbField read FStaespecificado write SetStaespecificado;
     Property Staconfirma: TCmDbField read FStaconfirma write SetStaconfirma;
     Property Qtdusufruto: TCmDbField read FQtdusufruto write SetQtdusufruto;
     Property Qtdoperacao: TCmDbField read FQtdoperacao write SetQtdoperacao;
     Property Plncodigo: TCmDbField read FPlncodigo write SetPlncodigo;
     Property Plano: TCmDbField read FPlano write SetPlano;
     Property Percentual: TCmDbField read FPercentual write SetPercentual;
     Property Observacao: TCmDbField read FObservacao write SetObservacao;
     Property Idtipooperacao: TCmDbField read FIdtipooperacao write SetIdtipooperacao;
     Property Idtipoinvest: TCmDbField read FIdtipoinvest write SetIdtipoinvest;
     Property Idtipocota: TCmDbField read FIdtipocota write SetIdtipocota;
     Property Idplanprevctbpatr: TCmDbField read FIdplanprevctbpatr write SetIdplanprevctbpatr;
     Property Idpedidofundo: TCmDbField read FIdpedidofundo write SetIdpedidofundo;
     Property Idoperacaoorigem: TCmDbField read FIdoperacaoorigem write SetIdoperacaoorigem;
     Property Idoperacaofundo: TCmDbField read FIdoperacaofundo write SetIdoperacaofundo;
     Property Idoperacaodireito: TCmDbField read FIdoperacaodireito write SetIdoperacaodireito;
     Property Idlote: TCmDbField read FIdlote write SetIdlote;
     Property Idfundoinvest: TCmDbField read FIdfundoinvest write SetIdfundoinvest;
     Property Idcotaintegraliza: TCmDbField read FIdcotaintegraliza write SetIdcotaintegraliza;
     Property Idcomposicaofundo: TCmDbField read FIdcomposicaofundo write SetIdcomposicaofundo;
     Property Idcarteirainvest: TCmDbField read FIdcarteirainvest write SetIdcarteirainvest;
     Property Dataoperacao: TCmDbField read FDataoperacao write SetDataoperacao;
     Property Dataliquidacao: TCmDbField read FDataliquidacao write SetDataliquidacao;
     Property Datacotizacao: TCmDbField read FDatacotizacao write SetDatacotizacao;
     Property Coddocumento: TCmDbField read FCoddocumento write SetCoddocumento;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbOperacaofundo }

constructor TDbOperacaofundo.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'OPERACAOFUNDO';

   fVlrtaxas := CreateCmDbField('VLRTAXAS',ftfloat,False,False,False,True,'Valor Taxas');
   fVlrrendimento := CreateCmDbField('VLRRENDIMENTO',ftfloat,False,False,False,True,'Valor Rendimento');
   fVlroperacao := CreateCmDbField('VLROPERACAO',ftfloat,False,False,False,True,'Valor Operação');
   fVlrir := CreateCmDbField('VLRIR',ftfloat,False,False,False,True,'Valor IR');
   fVlriof := CreateCmDbField('VLRIOF',ftfloat,False,False,False,True,'Valor IOF');
   fVlrdesconto := CreateCmDbField('VLRDESCONTO',ftfloat,False,False,False,True,'Valor do Desconto');
   fVlrcota := CreateCmDbField('VLRCOTA',ftfloat,False,False,False,True,'Valor da Cota');
   fVlrcorretagem := CreateCmDbField('VLRCORRETAGEM',ftfloat,False,False,False,True,'Valor Corretagem');
   fVlrcolocacao := CreateCmDbField('VLRCOLOCACAO',ftfloat,False,False,False,True,'Valor Colocação');
   fStaespecificado := CreateCmDbField('STAESPECIFICADO',ftString,False,False,False,True,'Status de Especificado');
   fStaconfirma := CreateCmDbField('STACONFIRMA',ftString,False,False,False,True,'Status de Confirmação');
   fQtdusufruto := CreateCmDbField('QTDUSUFRUTO',ftfloat,False,False,False,True,'Quantidade de Usufruto');
   fQtdoperacao := CreateCmDbField('QTDOPERACAO',ftfloat,False,False,False,True,'Quantidade da Operação');
   fPlncodigo := CreateCmDbField('PLNCODIGO',ftfloat,False,False,False,True,'Código Interno da Planilha');
   fPlano := CreateCmDbField('PLANO',ftfloat,False,False,False,True,'Plano');
   fPercentual := CreateCmDbField('PERCENTUAL',ftfloat,False,False,False,True,'Percentual');
   fObservacao := CreateCmDbField('OBSERVACAO',ftString,False,False,False,True,'Observação');
   fIdtipooperacao := CreateCmDbField('IDTIPOOPERACAO',ftfloat,False,False,False,True,'Tipo de Operação');
   fIdtipoinvest := CreateCmDbField('IDTIPOINVEST',ftfloat,False,False,False,True,'Tipo de Investimento');
   fIdtipocota := CreateCmDbField('IDTIPOCOTA',ftfloat,False,False,False,True,'Tipo Cota');
   fIdplanprevctbpatr := CreateCmDbField('IDPLANPREVCTBPATR',ftfloat,False,False,False,True,'Plano Patrocinadora');
   fIdpedidofundo := CreateCmDbField('IDPEDIDOFUNDO',ftfloat,False,False,False,True,'Pedido de Fundo');
   fIdoperacaoorigem := CreateCmDbField('IDOPERACAOORIGEM',ftfloat,False,False,False,True,'Operação Origem');
   fIdoperacaofundo := CreateCmDbField('IDOPERACAOFUNDO',ftfloat,True,True,False,True,'Operação Fundo');
   fIdoperacaodireito := CreateCmDbField('IDOPERACAODIREITO',ftfloat,False,False,False,True,'Operação Direito');
   fIdlote := CreateCmDbField('IDLOTE',ftString,False,False,False,True,'Lote');
   fIdfundoinvest := CreateCmDbField('IDFUNDOINVEST',ftfloat,False,False,False,True,'Fundo de Investimento');
   fIdcotaintegraliza := CreateCmDbField('IDCOTAINTEGRALIZA',ftfloat,False,False,False,True,'Integraliza Cota');
   fIdcomposicaofundo := CreateCmDbField('IDCOMPOSICAOFUNDO',ftfloat,False,False,False,True,'Composição de Fundo');
   fIdcarteirainvest := CreateCmDbField('IDCARTEIRAINVEST',ftfloat,False,False,False,True,'Carteira de Investimento');
   fDataoperacao := CreateCmDbField('DATAOPERACAO',ftDateTime,False,False,False,True,'Data da Operação');
   fDataliquidacao := CreateCmDbField('DATALIQUIDACAO',ftDateTime,False,False,False,True,'Data da Liquidação');
   fDatacotizacao := CreateCmDbField('DATACOTIZACAO',ftDateTime,False,False,False,True,'Data da Cotização');
   fCoddocumento := CreateCmDbField('CODDOCUMENTO',ftfloat,False,False,False,True,'Código Interno do Documento');
end;

function TDbOperacaofundo.Insert: Boolean;
begin

   fIdoperacaofundo.AsFloat := GetSequence('OPERACAOFUNDO');
   Result := Inherited Insert;

end;


procedure TDbOperacaofundo.SetCoddocumento(const Value: TCmDbField);
begin
  FCoddocumento := Value;
end;

procedure TDbOperacaofundo.SetDatacotizacao(const Value: TCmDbField);
begin
  FDatacotizacao := Value;
end;

procedure TDbOperacaofundo.SetDataliquidacao(const Value: TCmDbField);
begin
  FDataliquidacao := Value;
end;

procedure TDbOperacaofundo.SetDataoperacao(const Value: TCmDbField);
begin
  FDataoperacao := Value;
end;

procedure TDbOperacaofundo.SetIdcarteirainvest(const Value: TCmDbField);
begin
  FIdcarteirainvest := Value;
end;

procedure TDbOperacaofundo.SetIdcomposicaofundo(const Value: TCmDbField);
begin
  FIdcomposicaofundo := Value;
end;

procedure TDbOperacaofundo.SetIdcotaintegraliza(const Value: TCmDbField);
begin
  FIdcotaintegraliza := Value;
end;

procedure TDbOperacaofundo.SetIdfundoinvest(const Value: TCmDbField);
begin
  FIdfundoinvest := Value;
end;

procedure TDbOperacaofundo.SetIdlote(const Value: TCmDbField);
begin
  FIdlote := Value;
end;

procedure TDbOperacaofundo.SetIdoperacaodireito(const Value: TCmDbField);
begin
  FIdoperacaodireito := Value;
end;

procedure TDbOperacaofundo.SetIdoperacaofundo(const Value: TCmDbField);
begin
  FIdoperacaofundo := Value;
end;

procedure TDbOperacaofundo.SetIdoperacaoorigem(const Value: TCmDbField);
begin
  FIdoperacaoorigem := Value;
end;

procedure TDbOperacaofundo.SetIdpedidofundo(const Value: TCmDbField);
begin
  FIdpedidofundo := Value;
end;

procedure TDbOperacaofundo.SetIdplanprevctbpatr(const Value: TCmDbField);
begin
  FIdplanprevctbpatr := Value;
end;

procedure TDbOperacaofundo.SetIdtipocota(const Value: TCmDbField);
begin
  FIdtipocota := Value;
end;

procedure TDbOperacaofundo.SetIdtipoinvest(const Value: TCmDbField);
begin
  FIdtipoinvest := Value;
end;

procedure TDbOperacaofundo.SetIdtipooperacao(const Value: TCmDbField);
begin
  FIdtipooperacao := Value;
end;

procedure TDbOperacaofundo.SetObservacao(const Value: TCmDbField);
begin
  FObservacao := Value;
end;

procedure TDbOperacaofundo.SetPercentual(const Value: TCmDbField);
begin
  FPercentual := Value;
end;

procedure TDbOperacaofundo.SetPlano(const Value: TCmDbField);
begin
  FPlano := Value;
end;

procedure TDbOperacaofundo.SetPlncodigo(const Value: TCmDbField);
begin
  FPlncodigo := Value;
end;

procedure TDbOperacaofundo.SetQtdoperacao(const Value: TCmDbField);
begin
  FQtdoperacao := Value;
end;

procedure TDbOperacaofundo.SetQtdusufruto(const Value: TCmDbField);
begin
  FQtdusufruto := Value;
end;

procedure TDbOperacaofundo.SetStaconfirma(const Value: TCmDbField);
begin
  FStaconfirma := Value;
end;

procedure TDbOperacaofundo.SetStaespecificado(const Value: TCmDbField);
begin
  FStaespecificado := Value;
end;

procedure TDbOperacaofundo.SetVlrcolocacao(const Value: TCmDbField);
begin
  FVlrcolocacao := Value;
end;

procedure TDbOperacaofundo.SetVlrcorretagem(const Value: TCmDbField);
begin
  FVlrcorretagem := Value;
end;

procedure TDbOperacaofundo.SetVlrcota(const Value: TCmDbField);
begin
  FVlrcota := Value;
end;

procedure TDbOperacaofundo.SetVlrdesconto(const Value: TCmDbField);
begin
  FVlrdesconto := Value;
end;

procedure TDbOperacaofundo.SetVlriof(const Value: TCmDbField);
begin
  FVlriof := Value;
end;

procedure TDbOperacaofundo.SetVlrir(const Value: TCmDbField);
begin
  FVlrir := Value;
end;

procedure TDbOperacaofundo.SetVlroperacao(const Value: TCmDbField);
begin
  FVlroperacao := Value;
end;

procedure TDbOperacaofundo.SetVlrrendimento(const Value: TCmDbField);
begin
  FVlrrendimento := Value;
end;

procedure TDbOperacaofundo.SetVlrtaxas(const Value: TCmDbField);
begin
  FVlrtaxas := Value;
end;

end.



