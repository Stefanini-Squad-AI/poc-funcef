unit FGrafRentabilidadeCotas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, StdCtrls, TeEngine, Series, TeeProcs, Chart, mxgraph, uBibliotecaInvest,
  mxstore, mxDB, Db, DBTables, mxtables, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, Wwquery, TeeFunci, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker, FPreview;

type
  TfrmGrafRentabilidadeCotas = class(TfrmSairAjuda)
    bt_Imprime: TBitBtn;
    DecisionQueryRent: TDecisionQuery;
    DecisionCubeRent: TDecisionCube;
    DecisionSourceRent: TDecisionSource;
    Panel1: TPanel;
    Panel2: TPanel;
    DecisionGraphRent: TDecisionGraph;
    Series3: TBarSeries;
    GroupBox1: TGroupBox;
    dDataInicio: TCMDateTimePicker;
    dDataFim: TCMDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    DblTipoFundo: TwwDBLookupCombo;
    Label7: TLabel;
    dblGestorCarteira: TwwDBLookupCombo;
    Label33: TLabel;
    bbtnConfirmar: TBitBtn;
    QryTipoFundo: TwwQuery;
    qryGestorCart: TwwQuery;
    qryGestorCartNOME: TStringField;
    qryGestorCartIDGESTORCARTEIRA: TFloatField;
    qryGestorCartIDPESSOA: TFloatField;
    QryFundoInvestOperacao: TwwQuery;
    QryFundoInvestOperacaoIDFUNDOINVEST: TFloatField;
    QryFundoInvestOperacaoDESCFUNDOINVEST: TStringField;
    QryFundoInvestOperacaoIDGESTORCARTEIRA: TFloatField;
    QryFundoInvestOperacaoTRGDTINCLUSAO: TDateTimeField;
    QryFundoInvestOperacaoTRGUSERINCLUSAO: TStringField;
    QryFundoInvestOperacaoMOECODIGO: TFloatField;
    QryFundoInvestOperacaoIDCARTEIRAINVEST: TFloatField;
    QryFundoInvestOperacaoIDTIPOFUNDOINVEST: TFloatField;
    QryFundoInvestOperacaoCNPJFUNDO: TStringField;
    QryFundoInvestOperacaoSTAEXCLUSIVO: TStringField;
    QryFundoInvestOperacaoPZOCARENCIA: TFloatField;
    QryFundoInvestOperacaoPZOANIVERSARIO: TFloatField;
    QryFundoInvestOperacaoPZOLIQAPLIC: TFloatField;
    QryFundoInvestOperacaoPZOLIQRESG: TFloatField;
    QryFundoInvestOperacaoQTDDECQTD: TFloatField;
    QryFundoInvestOperacaoQTDDECVALOR: TFloatField;
    QryFundoInvestOperacaoSTAFUNDO: TStringField;
    QryFundoInvestOperacaoPZOAMORTIZACAO: TFloatField;
    QryFundoInvestOperacaoPERCTXPERFORM: TFloatField;
    QryFundoInvestOperacaoPERCTXADM: TFloatField;
    QryFundoInvestOperacaoCODFUNCETIP: TStringField;
    QryFundoInvestOperacaoSTAPROVISIONAIR: TStringField;
    QryFundoInvestOperacaoSTAPROVISIONAIOF: TStringField;
    QryFundoInvestOperacaoCONTRCETIP: TStringField;
    Series2: TBarSeries;
    procedure FormShow(Sender: TObject);
    procedure bt_ImprimeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dDataInicioExit(Sender: TObject);
    procedure dDataFimExit(Sender: TObject);
  private
    { Private declarations }
    function DataUtil(dData : TDateTime) : TDateTime;
    function ValidaDados    : Boolean;        
  public
    { Public declarations }
  end;

var
  frmGrafRentabilidadeCotas: TfrmGrafRentabilidadeCotas;

implementation

uses FCadLancamentoFundo, UDiasUteisInv, UmensErro, FDmRelGrafRentabCotas;

{$R *.DFM}

procedure TfrmGrafRentabilidadeCotas.FormShow(Sender: TObject);
Var
   dDataIni : TDateTime;
   wDia, wMes, wAno : Word;
begin
  inherited;
  pnlFundo.Enabled :=True;

  QryTipoFundo.Open;

  QryGestorCart.Open;

  dDataIni := frmCadLancamentoFundo.DtEdDataReferenciaGeral.DateTime;

  DecodeDate(dDataIni, wAno, wMes, wDia);

  dDataIni := StrToDate('01/'+IntToStr(wMes)+'/'+IntToStr(wAno));

  While not DiasUteisInv.DiaUtil(dDataIni,-1,1,'',True,False,False) Do
      dDataIni := dDataIni + 1;   // Achar o 1o. dia do mês

  dDataInicio.Date  := dDataIni;

  dDataFim.Date     := frmCadLancamentoFundo.DtEdDataReferenciaGeral.DateTime;

  If frmCadLancamentoFundo.DblTipoFundo.Text <> ''  Then
  Begin
     DblTipoFundo.Text := frmCadLancamentoFundo.DblTipoFundo.Text;
     QryTipoFundo.Locate('IDTIPOFUNDOINVEST',
        frmCadLancamentoFundo.QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger,[]);
  End;

  If frmCadLancamentoFundo.dblGestorCarteira.Text <> ''  Then
  Begin
     dblGestorCarteira.Text := frmCadLancamentoFundo.dblGestorCarteira.Text;
     QryGestorCart.Locate('IDGESTORCARTEIRA',
        frmCadLancamentoFundo.qryGestorCart.FieldByName('IDGESTORCARTEIRA').AsInteger,[]);
  End;

  bbtnConfirmar.Click;

end;

procedure TfrmGrafRentabilidadeCotas.bt_ImprimeClick(Sender: TObject);
begin
  inherited;

   with DmRelatoriosInv1 do
   begin
      TFrmPreview.CreateModalPreview(Application,
                                     ppReport1,
                                     ppReport1.PrinterSetup.DocumentName);
   end;

end;

procedure TfrmGrafRentabilidadeCotas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DecisionQueryRent.Close;
end;

procedure TfrmGrafRentabilidadeCotas.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

  dDataInicio.Date := DataUtil(dDataInicio.Date);

  dDataFim.Date    := DataUtil(dDataFim.Date);

  If Not ValidaDados Then
     Exit;

  Try

    DecisionQueryRent.Close;

    DecisionQueryRent.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;

    DecisionQueryRent.ParamByName('DATAINI').AsString := dDataInicio.Text;

    DecisionQueryRent.ParamByName('DATAFIM').AsString := dDataFim.Text;

    DecisionQueryRent.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;

    DecisionQueryRent.ParamByName('IDTIPOFUNDOINVEST').AsInteger :=
                      QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
    If DblTipoFundo.Text = ''  Then
          DecisionQueryRent.ParamByName('IDTIPOFUNDOINVEST').Clear;

    DecisionQueryRent.ParamByName('IDGESTORCARTEIRA').AsInteger :=
                      QryGestorCart.FieldByName('IDGESTORCARTEIRA').AsInteger;
    If dblGestorCarteira.Text = ''  Then
       DecisionQueryRent.ParamByName('IDGESTORCARTEIRA').Clear;

    DecisionQueryRent.Open;
  Except
      MsgDlg('Verifique o período, não há cotas.','Mensagem do Sistema',mtInformation,[mbOk],0);
  End;

end;

procedure TfrmGrafRentabilidadeCotas.dDataInicioExit(Sender: TObject);
begin
  inherited;
   dDataInicio.Date := DataUtil(dDataInicio.Date);
end;

procedure TfrmGrafRentabilidadeCotas.dDataFimExit(Sender: TObject);
begin
  inherited;
   dDataFim.Date := DataUtil(dDataFim.Date);
end;

function TfrmGrafRentabilidadeCotas.DataUtil(dData : TDateTime) : TDateTime;
Begin
  While not DiasUteisInv.DiaUtil(dData,-1,1,'',True,False,False) Do
      dData := dData + 1;   // Achar o dia útil

  Result := dData;
End;

function TfrmGrafRentabilidadeCotas.ValidaDados : Boolean;
Begin
// busca fundo que não tiveram aplicacao neste dia.
   With QryFundoInvestOperacao Do Begin
     Close;
     ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
     ParamByName('DATAMOVFUNDO').AsString       := DateToStr(dDataFim.Date);
     ParamByName('IDTIPOFUNDOINVEST').AsInteger :=
         QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
     If DblTipoFundo.Text = ''  Then ParamByName('IDTIPOFUNDOINVEST').Clear;

     ParamByName('IDGESTORCARTEIRA').AsInteger :=
         qryGestorCart.FieldByName('IDGESTORCARTEIRA').AsInteger;
     If dblGestorCarteira.Text = ''  Then ParamByName('IDGESTORCARTEIRA').Clear;

     Open;
   End;

   Result := True;
   If (QryFundoInvestOperacao.RecordCount = 1) Then
   Begin
      Result := False;
      MsgDlg('Não será formado o gráfico, só há um Fundo para essa consulta.','Mensagem do Sistema',mtInformation,[mbOk],0)
   End
   Else If (QryFundoInvestOperacao.RecordCount < 1) Then
   Begin
      Result := False;
      MsgDlg('Não há Fundos nessa consulta para formar o gráfico.','Mensagem do Sistema',mtInformation,[mbOk],0);
   End;

End;

end.

