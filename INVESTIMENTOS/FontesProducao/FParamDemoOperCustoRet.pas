//******************************************************************************
// Data     : 07/07/2006
// Código   : AL_5
// Desc     : Retirada do Saldo CCI de Custódia da BuscaTodosSaldosInvestLote
//******************************************************************************
// Data     : 08/06/2006
// Código   : AL_4
// Pendencia: 20777
// SOL      : 35179
// Desc     : Implementação de Provisão de Perda por fluxo de percentual
//******************************************************************************
// Data     : 03/04/2006
// Código   : AL_3
// Pendencia: 21403
// SOL      : 39846
// Desc     : Implementação de Saldo CC/CCI na Histcustodia
//********************************************************************************************************
// Data     : 06/10/2004
// Código   : AL_2
// Motivo   : Alteração Legislação CPMF
//******************************************************************************
// Data     : 22/06/2004
// Código   : AL_1
// Motivo   : Inclusão de variável na função BuscaTodosSaldosInvestLote
//******************************************************************************

unit FParamDemoOperCustoRet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, wwdblook,
  Db, DBTables, Wwquery, UOperacaoInvest, FAguarde;

type
  TfrmParamDemoOperCustoRet = class(TfrmOkCancelar)
    qryCarteira: TwwQuery;
    qryCarteiraDESCCARTINVEST: TStringField;
    qryCarteiraIDCARTEIRAINVEST: TFloatField;
    qryInvestimento: TwwQuery;
    qryInvestimentoIDINVESTIMENTO: TFloatField;
    qryInvestimentoDESCINVESTIMENTO: TStringField;
    dblCarteira: TwwDBLookupCombo;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dbdInicio: TCMDateTimePicker;
    dbdFim: TCMDateTimePicker;
    DblInvestimento: TwwDBLookupCombo;
    Label4: TLabel;
    qryMovimento: TwwQuery;
    qryBuscaCustoRET: TwwQuery;
    qryMovimentoDATAMOVCARTINV: TDateTimeField;
    qryMovimentoQTDEMOVINVCART: TFloatField;
    qryMovimentoVLRMOVCARTINV: TFloatField;
    qryMovimentoNATURMOVCARTINV: TStringField;
    qryMovimentoSALDOQTDEINVCART: TFloatField;
    qryBuscaCustoRETIDACAO: TFloatField;
    qryBuscaCustoRETCUSTO_RET: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamDemoOperCustoRet: TfrmParamDemoOperCustoRet;
  fVrlRendimento : Double;

implementation

uses UImpostos, uOperComum, UMensErro, fPreview, UBibliotecaInvest, FDmRelDemOpCustoRet;

{$R *.DFM}

procedure TfrmParamDemoOperCustoRet.FormShow(Sender: TObject);
begin
  inherited;
   QryCarteira.Open;
   QryInvestimento.Open;
   dbdInicio.Date := pRPI.DATAULTFECH;
   dbdFim.Date    := pRPI.DATAULTFECH;
end;

procedure TfrmParamDemoOperCustoRet.bbtnConfirmarClick(Sender: TObject);
var vlrCusto, sldCusto, fSaldoAnt, fQtdAnt, fSldQtd, wSaldoInutil, fResultado, wAliquota: Double;
    sFlgTrataIR: String;
    iInvestimento: Integer;
    dDataAtu: TDateTime;
begin
   inherited;

   if Trim(dblCarteira.Text) = '' then
   begin
      MsgDlg('Selecione uma Carteira.', 'Mensagem do Sistema', mtInformation, [MbOk], 0);
      if dblCarteira.CanFocus then
         dblCarteira.SetFocus;
      Exit;
   end;

   with DmRelDemOpCustoRet do
   begin
      //Fecha a query e limpa os parametros
      OperComum.LimpaParametros(DmRelDemOpCustoRet.qryDemoOpCustoRet);

      if Trim(DblInvestimento.Text) <> '' then
         qryDemoOpCustoRet.ParamByName('IDINVESTIMENTO').AsInteger :=
                            qryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger;
      QryDemoOpCustoRet.ParamByName('IDCARTEIRAINVEST').AsInteger  :=
                            QryCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger;

      // Capta sempre do inicio do Custo RET - Verificar possibilidade de substituir
      //                                         a data inicial por um parametro
      QryDemoOpCustoRet.ParamByName('DATAINI').AsString := '31/08/2001';
      QryDemoOpCustoRet.ParamByName('DATAFIM').AsString := dbdFim.Text;
      QryDemoOpCustoRet.Open;
      QryDemoOpCustoRet.First;

      if QryDemoOpCustoRet.RecordCount > 0 then
      begin
         frmAguarde.Pos := 0;
         frmAguarde.Max := QryDemoOpCustoRet.RecordCount;
         frmAguarde.Mostra('Aguarde - Processando !');
      end;

      // Processa todos os registros
      while not QryDemoOpCustoRet.Eof do
      begin
         // Capta Investimento a ser processado
         iInvestimento := qryDemoOpCustoRetIDINVESTIMENTO.AsInteger;

         // Capta o Custo Inicial do Investimento
         if qryDemoOpCustoRetCUSTO_RET.IsNull then
            vlrcusto := QryDemoOpCustoRetVALCUSTO.AsFloat
         else
            vlrCusto := qryDemoOpCustoRetCUSTO_RET.AsFloat;

         sldCusto := vlrCusto;

         // Enquando for o mesmo Investimento
         while (not QryDemoOpCustoRet.Eof) and
               (iInvestimento = qryDemoOpCustoRetIDINVESTIMENTO.AsInteger) do
         begin
            dDataAtu := qryDemoOpCustoRetDATAMOVCARTINV.AsDateTime;

            // Busca o Saldo do Investimento anterior a Operação processada
            //AL_1
            //AL_2
            //AL_3
            //AL_4
            //AL_5
            OperComum.BuscaTodosSaldosInvestLote(
                  qryDemoOpCustoRetIDCARTEIRAINVEST.AsInteger,
                  0 {Carteira Gerencial},
                  qryDemoOpCustoRetIDINVESTIMENTO.AsInteger,
                  qryDemoOpCustoRetIDHISTCARTINV.AsInteger , -1 {Custodiante},
                  qryDemoOpCustoRetIDLOTE.AsString,
                  DateToStr(dDataAtu), -1,
                  fQtdAnt, fSaldoAnt, wSaldoInutil, wSaldoInutil, wSaldoInutil,
                  wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
                  wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
                  wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil);

            if qryDemoOpCustoRetSALDOQTDEINVCART.AsFloat = 0 then
               fSldQtd := 1
            else
               fSldQtd := qryDemoOpCustoRetSALDOQTDEINVCART.AsFloat;

            if qryDemoOpCustoRetNATUREZAOPERACAO.AsString = 'A' then
            begin
               // Compra
               vlrCusto := qryDemoOpCustoRetVLRMOVCARTINV.AsFloat + qryDemoOpCustoRetTOTALDESPESAS.AsFloat;
               sldCusto := sldCusto + vlrCusto;
               fResultado := 0;
               wAliquota := 0;
            end
            else
            begin
               // Venda
               vlrCusto := (qryDemoOpCustoRetQTDEMOVINVCART.AsFloat * (OperComum.DivValorZero(sldCusto,fQtdAnt))) * -1;
               sldCusto := sldCusto + vlrCusto;
               fResultado := qryDemoOpCustoRetVLRMOVCARTINV.AsFloat -
                             ((( sldCusto * qryDemoOpCustoRetQTDEMOVINVCART.AsFloat)/ fSldQtd) + qryDemoOpCustoRetTOTALDESPESAS.AsFloat);
               wAliquota := Impostos.BuscaAliquotaIR(2,
                                           QryDemoOpCustoRet.FieldByName('IDTIPOOPERACAO').AsInteger,
                                           QryDemoOpCustoRet.FieldByName('IDMERCADO').AsInteger,
                                           QryDemoOpCustoRet.FieldByName('DATAMOVCARTINV').AsDateTime);
            end;


            if QryDemoOpCustoRet.FieldByName('FLGTRATAIR').AsString = 'N' then
               sFlgTrataIR := QryDemoOpCustoRet.FieldByName('FLGTRATAIR').AsString
            else
               sFlgTrataIR := 'V';


            QryDemoOpCustoRet.Edit;
            qryDemoOpCustoRet.FieldByName('VALCUSTO').AsFloat := vlrCusto;
            qryDemoOpCustoRet.FieldByName('SLDCUSTO').AsFloat := sldCusto;
            qryDemoOpCustoRet.FieldByName('RESULTADO').AsFloat := fResultado;
            qryDemoOpCustoRet.FieldByName('ALIQUOTA').AsFloat := wAliquota;
            fVrlRendimento := 0;
            QryDemoOpCustoRet.FieldByName('VLRIR').AsFloat :=
                              Impostos.CalculaIR(2,
                                        qryDemoOpCustoRet.FieldByName('IDINVESTIMENTO').AsInteger,
                                        0{CARTEIRAGERENC},
                                        QryDemoOpCustoRet.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                        QryDemoOpCustoRet.FieldByName('IDTIPOOPERACAO').AsInteger,
                                        QryDemoOpCustoRet.FieldByName('IDMERCADO').AsInteger,
                                        '',
                                        QryDemoOpCustoRet.FieldByName('DATAMOVCARTINV').AsDateTime,
                                        QryDemoOpCustoRet.FieldByName('DATAMOVCARTINV').AsDateTime,
                                        QryDemoOpCustoRet.FieldByName('VALCUSTO').AsFloat,
                                        fResultado,
                                        0,
                                        'S',
                                        sFlgTrataIR,fVrlRendimento);
            QryDemoOpCustoRet.Post;
            QryDemoOpCustoRet.Next;
            frmAguarde.Pos := frmAguarde.Pos + 1;
         end;
      end;

      if QryDemoOpCustoRet.RecordCount > 0 then
         frmAguarde.Apaga;

      // Só mostrar no relatório o período pedido na tela de parametros
      QryDemoOpCustoRet.Filtered := True;
      QryDemoOpCustoRet.Filter := 'DATAVENCOPER >= ''' + dbdInicio.Text + '''';


      ppDataIni.Caption := dbdInicio.Text;
      ppDataFim.Caption := dbdFim.Text;
      ppCarteira.Caption:= dblCarteira.Text;

      TFrmPreview.CreateModalPreview(Application,
                                     DmRelDemOpCustoRet.rptDemoOpCustoRet,
                                     DmRelDemOpCustoRet.rptDemoOpCustoRet.PrinterSetup.DocumentName);

   End;
end;

end.
