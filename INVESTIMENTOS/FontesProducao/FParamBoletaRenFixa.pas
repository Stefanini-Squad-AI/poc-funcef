//********************************************************************************************************
// Data     : 06/05/2004
// Origem   : Refer
// Função   : Fazqry
// Motivo   : 109 - Acerto na impressao da data de vencimento quando o campo está vazio.
//********************************************************************************************************

unit FParamBoletaRenFixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, UOperacaoInvest,
  UOperComum, dOperComum, MontaSelect, wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmParamBoletaRenFixa = class(TfrmOkCancelar)
    Label2: TLabel;
    edDataRef: TCMDateTimePicker;
    Label3: TLabel;
    edBoleta: TEdit;
    MontaSelect: TMontaSelect;
    BtMostraCot: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure BtMostraCotClick(Sender: TObject);
  private
    { Private declarations }
    Procedure FazQry;
  public
    { Public declarations }
  end;

var FrmParamBoletaRenFixa: TFrmParamBoletaRenFixa;

implementation

{$R *.DFM}

Uses uSistema, uMensErro, FDmRelatorios;

Procedure TfrmParamBoletaRenFixa.FazQry;
var
  wTaxaOver, wValorJuros, fValInicial : double;
  dDataInicial : TDateTime;
Begin

 With DmRelatorios.qryBoletaRenFixa Do Begin
   Close;
   Sql.Clear;

   Sql.add(' SELECT  OI.IDOPERACAOINVEST, OI.DATAOPERACAO, OI.DATAVENCOPER, OI.QTDEOPERACAO,     ');
   Sql.add('  OI.PRECOUNITOPERACAO, OI.VLROPERACAO, OI.NUMDOCUMENTO, MO.MOEDESC,                 ');
   Sql.add('  PS.NOME, CS.SGLCUSTODIANTE,                                                        ');
   Sql.add('  IV.DESCINVESTIMENTO, IV.OBSINVESTIMENTO, TI.DESCTIPOOPERACAO,                      ');
   Sql.add('  TI.NATUREZAOPERACAO, CA.DESCCARTINVEST, TT.VLRRESGATE,                             ');
   Sql.add('  DECODE(TP.IDCLASSETIT, 2, TT.CARENCIA, CO.PRZVENC) AS PRZVENC,                     ');
   Sql.add('  CO.VLRCOMPRATITLOTE,                                                               ');
   Sql.add('  DECODE(TP.IDCLASSETIT, 2, CO.DATACARENCIA,CO.DATAVENCIM) AS DATAVENCIM,            ');
   Sql.add('  TT.INDEXRENFIX, TT.PERCINDEX, TT.CODTIPTXJUROS, TT.DATAINIJURRENFIX,               ');
   Sql.add('  TT.JUROSRENFIX, TT.PREMIORENFIX, TT.JUROSDIA,  OI.OBSERVACAO,                      ');
   Sql.add('  TT.CODTIPTXPREMIO, TJ.DESCTIPJUROS, TJ.TAMPERJUROS,TJ.EFETNOMI,OI.IDCARTEIRAINVEST,');
   Sql.add('  (0) AS TAXAOVER, (0) AS VALORJUROS, OI.IDLOTE, OI.IDINVESTIMENTO                   ');
   Sql.add('                                                                                     ');
   Sql.add(' FROM                                                                                ');
   Sql.add('                                                                              ');
   Sql.add('  OPERACAOINVEST OI, PESSOA PS,           TITRENFIXA TT,             ');
   Sql.add('  CUSTODIANTE CS,    CONTRATOINVESTIM CO, TIPOTITRENFIXA TP,         ');
   Sql.add('  INVESTIMENTO IV,   TIPOOPERACAO TI,     CARTEIRAINVEST CA,         ');
   Sql.add('  MOEDA MO, TIPOJUROS TJ ');
   Sql.add('  ');
   Sql.add(' WHERE                                      ');

   If (Trim(edDataRef.Text) <> '' )  Then Begin
     DmRelatorios.RptBoletaRenFixaDataRef.Caption    := edDataRef.Text;
     Sql.Add(' (OI.DATAOPERACAO = TO_DATE('''+DateToStr(edDataRef.Date)+''',''DD/MM/YYYY''))  AND');
   End;

   If (Trim(edBoleta.Text) <> '')  Then
     Sql.add(' (OI.NUMDOCUMENTO = '''+EdBoleta.Text+''')   AND ');


   Sql.add('      (OI.IDCARTEIRAINVEST = CA.IDCARTEIRAINVEST) AND                          ');
   Sql.add('      (OI.IDINVESTIMENTO   = IV.IDINVESTIMENTO)   AND                          ');
   Sql.add('      (IV.IDINVESTIMENTO   = TT.IDTITRENFIXA)     AND                          ');
   Sql.add('      (TT.CODTIPRENFIXA    = TP.CODTIPRENFIXA)    AND                          ');
   Sql.add('      (OI.IDTIPOOPERACAO   = TI.IDTIPOOPERACAO)   AND                          ');
   Sql.add('      (PS.IDPESSOA         = IV.IDEMISSOR)        AND                          ');
   Sql.add('      (CS.IDCUSTODIANTE(+) = TT.IDCUSTODIANTE)    AND                          ');
   Sql.add('      (OI.IDINVESTIMENTO   = CO.IDINVESTIMENTO)   AND                          ');
   Sql.add('      ((OI.IDLOTE IS NULL AND CO.IDLOTE IS NULL) OR (OI.IDLOTE = CO.IDLOTE))  AND');
   Sql.add('      (TT.INDEXRENFIX      = MO.MOECODIGO(+))     AND                          ');
   Sql.add('      (TT.CODTIPTXJUROS    = TJ.CODTIPTXJUROS(+))                              ');

   Sql.add('  ORDER BY                                  ');
   Sql.add('        OI.DATAOPERACAO,                    ');
   Sql.add('        OI.NUMDOCUMENTO,                    ');
   Sql.add('        OI.IDOPERACAOINVEST                 ');
   Open;
   First;

   While Not EOF Do
   Begin
     Edit;
     if  DmRelatorios.qryBoletaRenFixa.FieldByName('DATAVENCIM').AsDateTime = 0 then
         DmRelatorios.qryBoletaRenFixa.FieldByName('DATAVENCIM').Clear;
     if  FieldByName('INDEXRENFIX').IsNull then
     begin
       OperacaoInvest.BuscaInicioAplicacao(
                         FieldByName('IDINVESTIMENTO').AsInteger,
                         FieldByName('IDCARTEIRAINVEST').AsInteger,
                         FieldByName('IDLOTE').AsString,
                         dDataInicial,
                         fValInicial);

       if not FieldByName('CODTIPTXJUROS').IsNull then
       begin
          wTaxaOver := OperacaoInvest.CalculaTaxaOver(FieldByName('IDINVESTIMENTO').AsInteger,
                                                      FieldByName('DATAINIJURRENFIX').AsDateTime,
                                                      FieldByName('DATAVENCIM').AsDateTime);
          FieldByName('TAXAOVER').AsFloat    := wTaxaOver;
       end;
       wValorJuros :=  FieldByName('VLRRESGATE').asFloat - FieldByName('VLROPERACAO').asFloat;


      // Se o TipoOperacao =  'D' (venda), a dtliberacao é igual a DtPagto
      // E os campos Prazo, Taxa e observação não aparecem
       If FieldByName('NATUREZAOPERACAO').AsString = 'D' Then Begin
          FieldByName('DATAVENCIM').AsDateTime := FieldByName('DATAVENCOPER').AsDateTime;
          FieldByName('VLRRESGATE').AsString := '';
          FieldByName('VALORJUROS').AsString := '';
       End;
     // Se não tiver vlr de resgate, não calcular o valor dos juros
       If ((FieldByName('VLRRESGATE').AsFloat <> 0) and not (FieldByName('VLRRESGATE').IsNull)) Then
          FieldByName('VALORJUROS').AsFloat  := wValorJuros
       else
          FieldByName('VALORJUROS').AsString  := '';
     end;
     Post;
     Next;
   End;
   First;
 End;
End;

procedure TFrmParamBoletaRenFixa.FormCreate(Sender: TObject);
begin
  inherited;
  edDataRef.Date := Date;
end;

procedure TFrmParamBoletaRenFixa.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  If (trim(edDataRef.Text) = '') and (trim(edBoleta.Text) = '')  Then Begin
     MsgDlg('Preencher Data de Referência e/ou Boleta.','Erro',mtError,[mbOK],0);
     edDataRef.SetFocus;
   End;

  FazQry;
  
end;

procedure TFrmParamBoletaRenFixa.BtMostraCotClick(Sender: TObject);
begin
  inherited;
//  inherited;
  MontaSelect.Executar;
  If MontaSelect.RetornouValor Then Begin
     edDataRef.Date := StrToDate(MontaSelect.ValoresChave[0]);
     edBoleta.Text  := MontaSelect.ValoresChave[1];
  End;
end;

end.
