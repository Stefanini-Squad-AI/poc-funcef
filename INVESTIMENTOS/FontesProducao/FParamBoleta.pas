//*****************************************************************************
//Data	    : 14/09/2005
//Código    : Al_1
//Motivo(S) : Acerto no MontaSelect e QryConsulta para nâo trazer Carteiras Gerenciais 
//*****************************************************************************

unit FParamBoleta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, MontaSelect;

type
  TFrmParamBoleta = class(TfrmOkCancelar)
    Label3: TLabel;
    edBoleta: TEdit;
    BtMostraCot: TSpeedButton;
    MontaSelect: TMontaSelect;
    QryConsulta: TwwQuery;
    QryConsultaSGLBOLSAVALORES: TStringField;
    QryConsultaDATAOPERACAO: TDateTimeField;
    QryConsultaDATAVENCOPER: TDateTimeField;
    QryConsultaQTDEOPERACAO: TFloatField;
    QryConsultaPRECOUNITOPERACAO: TFloatField;
    QryConsultaVLROPERACAO: TFloatField;
    QryConsultaTOTALDESPESAS: TFloatField;
    QryConsultaDESCMERCADO: TStringField;
    QryConsultaNOME: TStringField;
    QryConsultaDESCINVESTIMENTO: TStringField;
    QryConsultaDESCTIPOOPERACAO: TStringField;
    QryConsultaNUMDOCUMENTO: TStringField;
    QryConsultaNATUREZAOPERACAO: TStringField;
    QryConsultaIDOPERACAOINVEST: TFloatField;
    QryConsultaIDTIPOOPERACAO: TFloatField;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure BtMostraCotClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Procedure FazQry;
  public
    { Public declarations }
  end;

var
  FrmParamBoleta: TFrmParamBoleta;

implementation

{$R *.DFM}

Uses uSistema, uMensErro, FDmRelatorios, UOperComum;

Procedure TFrmParamBoleta.FazQry;
Var
  wSqlConsulta,wDataOper: String;
  iTipoOperEmpAc : Integer;
  wDecSep:Char;
  wTotalDespesa, wTotalLiquido, wTotalVenda, wTotalCompra,
  wTotalQtdCompra,wTotalQtdVenda,wPUMedioCompra,wPUMedioVenda: Double;
begin
  inherited;
// Abre a Query para Calcular os Querys Valores liquidos e a Despesa
  QryConsulta.Close;
  QryConsulta.ParamByName('NUMDOC').AsString:=EdBoleta.Text;
  QryConsulta.Open;

// Varre a Query para Calcular os  Valores liquidos e a Despesa
// Calcula Valores Totais
  wTotalDespesa   := 0;
  wTotalLiquido   := 0;
  wTotalCompra    := 0;
  wTotalVenda     := 0;
  wTotalQtdCompra := 0;
  wTotalQtdVenda  := 0;
  While Not QryConsulta.EOF Do Begin
// Total de Despesas
    wTotalDespesa := wTotalDespesa+QryConsulta.FieldByName('TOTALDESPESAS').AsFloat;
// Soma de Acordo com Tipo de Natureza(Venda/Compra)
    If (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'A') Or
       (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'V') Or
       (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'U') Or
       (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'M') Then
    Begin
       wTotalLiquido   := wTotalLiquido + QryConsulta.FieldByName('VLROPERACAO').AsFloat;
       wTotalCompra    := wTotalCompra + QryConsulta.FieldByName('VLROPERACAO').AsFloat;
       wTotalQtdCompra := wTotalQtdCompra + QryConsulta.FieldByName('QTDEOPERACAO').AsFloat;
    End
    Else If (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'D') Or
                (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'S') Or
                (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'O') Or
                (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'R') Or
                (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'I') Then
    Begin
       wTotalLiquido  := wTotalLiquido - QryConsulta.FieldByName('VLROPERACAO').AsFloat ;
       wTotalVenda    := wTotalVenda + QryConsulta.FieldByName('VLROPERACAO').AsFloat;
       wTotalQtdVenda := wTotalQtdVenda + QryConsulta.FieldByName('QTDEOPERACAO').AsFloat;
    End;
    wDataOper := QryConsulta.FieldByName('DATAOPERACAO').AsString;


// Pula Registro
    QryConsulta.Next;
  End;
// Calcula Resultado Liquido
  wTotalLiquido  := wTotalLiquido + wTotalDespesa;  
  // Empréstimo de Ações (Tomador) -> Abater o custo para zerar a Boleta
  if QryConsulta.FieldByName('IDTIPOOPERACAO').AsInteger = -95 then
  begin
     wTotalDespesa := wTotalDespesa - QryConsulta.FieldByName('TOTALDESPESAS').AsFloat;
     iTipoOperEmpAc := QryConsulta.FieldByName('IDTIPOOPERACAO').AsInteger;
  end
  // Reversão de Empréstimo de Ações (Tomador)
  else if QryConsulta.FieldByName('IDTIPOOPERACAO').AsInteger = -96 then
      wTotalLiquido := QryConsulta.FieldByName('TOTALDESPESAS').AsFloat;

  QryConsulta.Close;

  If wTotalLiquido < 0 then
     DmRelatorios.LblTotLiquido.Caption :='Total Liquido a Receber '
  Else DmRelatorios.LblTotLiquido.Caption :='Total Liquido a Pagar';
  wTotalLiquido  := ABS(wTotalLiquido);
  wPUMedioCompra := OperComum.DivValorZero(wTotalCompra,wTotalQtdCompra);
  wPUMedioVenda  := OperComum.DivValorZero(wTotalVenda,wTotalQtdVenda);

//--------------------------------------------------------------------------
// Monta Query do Relatorio
  wDecSep         := DecimalSeparator;
  DecimalSeparator:='.';
  // Empréstimo de Ações (Tomador) -> Abater o custo para zerar a Boleta
  if iTipoOperEmpAc = -95 then
  begin
     wSqlConsulta:=
       'SELECT DISTINCT BV.SGLBOLSAVALORES, OI.DATAOPERACAO, OI.DATAVENCOPER, OI.QTDEOPERACAO,         '+
       '       OI.PRECOUNITOPERACAO, OI.VLROPERACAO, 0 AS TOTALDESPESAS, BV.IDBOLSAVALORES,     '+
       '       SUBSTR(ME.DESCMERCADO,1,10) AS DESCMERCADO, PS.NOME,                           '+
       '       SUBSTR(IV.DESCINVESTIMENTO,1,15) AS DESCINVESTIMENTO, TI.DESCTIPOOPERACAO,     '+
       '       OI.NUMDOCUMENTO, TI.NATUREZAOPERACAO, IV.IDINVESTIMENTO,                       '+
       '       (BO.OBSERVACAO || OD.OBSERVACAO) AS OBSERVACAO, CT.QTDELOTE,                   '+
       FloatToStr(wTotalDespesa)+' AS TOTALDESPESABOLETA, '''+Sistema.NomeEmpresa+''' AS EMPRESA, '+
       FloatToStr(wTotalLiquido)+' AS TOTALLIQUIDOBOLETA,  '+
       '(' + FloatToStr(wPUMedioCompra) + '* CT.QTDELOTE) AS PUMEDIOCOMPRA,  '+
       '(' + FloatToStr(wPUMedioVenda) + '* CT.QTDELOTE) AS PUMEDIOVENDA  '+
       'FROM  OPERACAOINVEST OI, OPRACAO OA,  PESSOA PS, BOLSAVALORES BV, '+
       '      INVESTIMENTO IV, TIPOOPERACAO TI, MERCADO ME, BOLETA BO, '+
       '      COTACAOACAO CT, OPERACAODIREITO OD,                               '+
       '   (SELECT DOI.IDOPERACAOINVEST, SUM(DOI.VLRDESPOPER) AS TOTALDESPESAS     '+
       '    FROM DESPOPERINVEST DOI, TIPODESPINVEST TDI                         '+
       '    WHERE  DOI.IDTIPODESPINVEST = TDI.IDTIPODESPINVEST AND                 '+
       '           TDI.NATUREZAOPERACAO NOT IN (''N'')                             '+
       '    GROUP BY DOI.IDOPERACAOINVEST) DS                                      '+

       'WHERE   (OI.NUMDOCUMENTO       = ''' + EdBoleta.Text+ ''') AND '+
       '        (OI.IDOPERACAOINVEST   = OA.IDOPERACAOINVEST)    AND '+
       '        (OI.IDOPERACAOINVEST   = DS.IDOPERACAOINVEST(+)) AND '+
       '        (OI.IDCORRETVALORES    = PS.IDPESSOA(+)) AND '+
       '        (OA.IDBOLSAVALORES     = BV.IDBOLSAVALORES) AND '+
       '        (OA.IDACAO             = IV.IDINVESTIMENTO) AND '+
       '        (TI.IDMERCADO          = ME.IDMERCADO) AND '+
       '        (OI.NUMDOCUMENTO       = BO.IDBOLETA(+)) AND '+
       '        (OI.IDTIPOOPERACAO     = TI.IDTIPOOPERACAO) AND '+
       '        (CT.DATACOTAACAO       >= TO_DATE('''+wDataOper+''',''DD/MM/YYYY'')) AND '+
       '        (IV.IDINVESTIMENTO     = CT.IDACAO(+)) AND '+
       '        (OI.IDOPERACAODIREITO  = OD.IDOPERACAODIREITO(+)) ';
  end
  else
  begin
     wSqlConsulta:=
       'SELECT DISTINCT BV.SGLBOLSAVALORES, OI.DATAOPERACAO, OI.DATAVENCOPER, OI.QTDEOPERACAO,         '+
       '       OI.PRECOUNITOPERACAO, OI.VLROPERACAO, DS.TOTALDESPESAS, BV.IDBOLSAVALORES,     '+
       '       SUBSTR(ME.DESCMERCADO,1,10) AS DESCMERCADO, PS.NOME,                           '+
       '       SUBSTR(IV.DESCINVESTIMENTO,1,15) AS DESCINVESTIMENTO, TI.DESCTIPOOPERACAO,     '+
       '       OI.NUMDOCUMENTO, TI.NATUREZAOPERACAO, IV.IDINVESTIMENTO,                       '+
       '       (BO.OBSERVACAO || OD.OBSERVACAO) AS OBSERVACAO, CT.QTDELOTE,                   '+
       FloatToStr(wTotalDespesa)+' AS TOTALDESPESABOLETA, '''+Sistema.NomeEmpresa+''' AS EMPRESA, '+
       FloatToStr(wTotalLiquido)+' AS TOTALLIQUIDOBOLETA,  '+
       '(' + FloatToStr(wPUMedioCompra) + '* CT.QTDELOTE) AS PUMEDIOCOMPRA,  '+
       '(' + FloatToStr(wPUMedioVenda) + '* CT.QTDELOTE) AS PUMEDIOVENDA  '+
       'FROM  OPERACAOINVEST OI,  OPRACAO OA,  PESSOA PS, BOLSAVALORES BV, '+
       '      INVESTIMENTO IV, TIPOOPERACAO TI, MERCADO ME, BOLETA BO, '+
       '      COTACAOACAO CT, OPERACAODIREITO OD,                               '+
       '   (SELECT DOI.IDOPERACAOINVEST, SUM(DOI.VLRDESPOPER) AS TOTALDESPESAS     '+
       '    FROM DESPOPERINVEST DOI, TIPODESPINVEST TDI                         '+
       '    WHERE  DOI.IDTIPODESPINVEST = TDI.IDTIPODESPINVEST AND                 '+
       '           TDI.NATUREZAOPERACAO NOT IN (''N'')                             '+
       '    GROUP BY DOI.IDOPERACAOINVEST) DS                                      '+

       'WHERE   (OI.NUMDOCUMENTO       = ''' + EdBoleta.Text+ ''') AND '+
       '        (OI.IDOPERACAOINVEST   = OA.IDOPERACAOINVEST)    AND '+
       '        (OI.IDOPERACAOINVEST   = DS.IDOPERACAOINVEST(+)) AND '+
       '        (OI.IDCORRETVALORES    = PS.IDPESSOA(+)) AND '+
       '        (OA.IDBOLSAVALORES     = BV.IDBOLSAVALORES) AND '+
       '        (OA.IDACAO             = IV.IDINVESTIMENTO) AND '+
       '        (TI.IDMERCADO          = ME.IDMERCADO) AND '+
       '        (OI.NUMDOCUMENTO       = BO.IDBOLETA(+)) AND '+
       '        (OI.IDTIPOOPERACAO     = TI.IDTIPOOPERACAO) AND '+
       '        (CT.DATACOTAACAO       >= TO_DATE('''+wDataOper+''',''DD/MM/YYYY'')) AND '+
       '        (IV.IDINVESTIMENTO     = CT.IDACAO(+)) AND '+
       '        (OI.IDOPERACAODIREITO  = OD.IDOPERACAODIREITO(+)) ';
  end;

  DecimalSeparator:=wDecSep;

  DmRelatorios.qryListInv.Sql.Clear;
  DmRelatorios.qryListInv.Sql.Add(wSqlConsulta);

  DmRelatorios.qryListInv.Open;

End;

procedure TFrmParamBoleta.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  FazQry;

end;

procedure TFrmParamBoleta.BtMostraCotClick(Sender: TObject);
begin
  inherited;
//  inherited;
  MontaSelect.Executar;
  If MontaSelect.RetornouValor Then Begin
    edBoleta.Text   := MontaSelect.ValoresChave[1];
  End;
end;

procedure TFrmParamBoleta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DmRelatorios.qryListInv.Close;
end;

end.
