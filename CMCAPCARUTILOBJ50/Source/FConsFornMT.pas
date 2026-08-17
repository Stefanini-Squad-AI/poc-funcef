{*******************************************************************************
   Desenvolvedor: Marcus Oliveira
   Pendência:     22704
   Data inicio:   21/09/06
   Descrição:     Retirar as inconsistências nos cálculos de saldo dos campos
                  lançamento x baixas

*******************************************************************************}
(*******************************************************************************
 25/03/1999 - 02.06.02
  Implementação do Form de Consulta a Fornecedores listando:
  Documentos em atraso, Documentos a Vencer, Gráfico de Lançamentos X Pagamentos,
  Lançamentos ou Pagamentos nos últimos 12 meses, Total de Lançamentos e Pagamentos no
  período.
 08/06/1999 - 02.08.14
  Implementação da Consulta a Clientes;
 13/10/19999 - 02.14.00
  Alteração do texto do botão seleciona documentos
*******************************************************************************)

Unit FConsFornMT;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, TREdit, Grids,
  Wwdbigrd, Wwdbgrid, TeEngine, Series, TeeProcs, Chart, DBChart, FProcuraCliForDlg,
  MontaSelect, Wwdatsrc, uMensErro, IvDictio, IvMulti, IvEMulti, CMProcuraSubTipo,
  wwdbdatetimepicker, CMDateTimePicker, uCmSqlParams, DBClient, uCMClientDataSet, uCtrlParamIntegra,
  Db, DBTables;

Type
  TFrmConsFornMT = Class(TFrmProcuraCliForDlg)
    Panel2: TPanel;
    SbtDocaVenc: TSpeedButton;
    sBtnDocVenc: TSpeedButton;
    SbtnVolume: TSpeedButton;
    NtbConsultaForn: TNotebook;
    GrdDocsaVencer: TwwDBGrid;
    GroupBox1: TGroupBox;
    DtFin: TCMDateTimePicker;
    DtIni: TCMDateTimePicker;
    GrdDocAtraso: TwwDBGrid;
    Grafico: TDBChart;
    DsAvenc: TwwDataSource;
    DsVenc: TwwDataSource;
    DsVolumePg: TwwDataSource;
    DsVolumeLanc: TwwDataSource;
    Series1: TBarSeries;
    Series2: TBarSeries;
    RgGrafico: TRadioGroup;
    BtnCalcular: TSpeedButton;
    Label1: TLabel;
    Label4: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    DsCalcMov: TwwDataSource;
    DbrLanc: TDBRealEdit;
    DbrPag: TDBRealEdit;
    PnlTotaVenc: TPanel;
    PnlTotAtraso: TPanel;
    SpbBaixados: TSpeedButton;
    GrdDocsBaixados: TwwDBGrid;
    PnlDocsBaixados: TPanel;
    DsBaixa: TwwDataSource;
    SpeedButton1: TSpeedButton;
    CdsBaixa: TCMClientDataSet;
    SqlBaixa: TCMSqlParams;
    SqlVenc: TCMSqlParams;
    CdsVenc: TCMClientDataSet;
    CdsCalcMov: TCMClientDataSet;
    SqlCalcMov: TCMSqlParams;
    CdsVolumePg: TCMClientDataSet;
    SqlVolumePg: TCMSqlParams;
    CdsAvenc: TCMClientDataSet;
    SqlAvenc: TCMSqlParams;
    CdsVolumeLanc: TCMClientDataSet;
    SqlVolumeLanc: TCMSqlParams;
    Procedure FormCreate(Sender: TObject);
    Procedure SbtnVolumeClick(Sender: TObject);
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    Procedure RgGraficoClick(Sender: TObject);
    Procedure BtnCalcularClick(Sender: TObject);
    Procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  End;

Var
  FrmConsFornMT: TFrmConsFornMT;

Implementation

uses uModulo;

{$R *.DFM}

Procedure TFrmConsFornMT.FormCreate(Sender: TObject);
Begin
  Inherited;

  SqlVolumePg.Prepare;
  SqlVolumeLanc.Prepare;
  SqlAvenc.Prepare;
  SqlVenc.Prepare;
  SqlCalcMov.Prepare;
  Caption := 'Consulta ' + CPForCli.Caption;
  HelpContext := 30083;
  bbtnAjuda.HelpContext := 30083;
  If ParamIntegra.RecPag = 'R' Then
  Begin
    RgGrafico.Items.Clear;
    RgGrafico.Items.Add('Recebimentos');
    RgGrafico.Items.Add('Lançamentos');
    RgGrafico.Items.Add('Lançamentos X Recebimentos');
    HelpContext := 40089;
    bbtnAjuda.HelpContext := 40089;
  End;

End;

Procedure TFrmConsFornMT.SbtnVolumeClick(Sender: TObject);
Var
  rAux: Real;
  nop : String;

Begin
  Inherited;

  If Trim(CPForCli.Text) = '' Then
    Exit;
  NtbConsultaForn.PageIndex := (Sender As TSpeedButton).Tag;
  If (Sender As TSpeedButton).Tag = 3 Then
  Begin
    If (DtIni.Text = '') Or (DtFin.Text = '') Then
    Begin
      MsgDlg('Favor Informar o Período', 'Aviso', mtError, [mbOk], 0);
      NtbConsultaForn.PageIndex := 0;
      SbtnVolume.Down := True;
      If DtIni.CanFocus Then
        DtIni.SetFocus;
      CdsBaixa.Close;
    End
    Else
    Begin
      SqlBaixa.Prepare;
      SqlBaixa.ParamByName('PIDPESSOA').AsFloat := CPForCli.ForCliReg.Id;
      SqlBaixa.ParamByName('PDATAINI').AsDateTime := StrToDate(DtIni.Text);
      SqlBaixa.ParamByName('PDATAFIN').AsDateTime := StrToDate(DtFin.Text);
      SqlBaixa.ParamByName('PRECPAG').AsString := ParamIntegra.RecPag;
      SqlBaixa.Open;

      TFloatField(CdsBaixa.FieldByName('VALOR')).DisplayFormat := '#,##0.00';
      TFloatField(CdsBaixa.FieldByName('VALOROUTRAMOEDA')).DisplayFormat := '#,##0.00';
      TFloatField(CdsBaixa.FieldByName('VALORORIG')).DisplayFormat := '#,##0.00';

      rAux := 0;
      CdsBaixa.First;
      While Not CdsBaixa.Eof Do
      Begin
        rAux := rAux + CdsBaixa.FieldByName('VALOR').AsFloat;
        nop := Modulo.PegaNumeroOP(CdsBaixa.FieldByName('CODDOCUMENTO').AsInteger);
        if Trim(nop) <> '' then
        begin
           CdsBaixa.Edit;
           CdsBaixa.FieldByName('NUMOP').AsString := nop;
           CdsBaixa.Post;
        end;
        CdsBaixa.Next;
      End;
      PnlDocsBaixados.Caption := 'Total: ' + FloatToStrF(rAux, ffNumber, 17, 2) + ' ';
      CdsBaixa.First;
    End;
  End;
End;

Procedure TFrmConsFornMT.FormClose(Sender: TObject;
  Var Action: TCloseAction);
Begin
  CdsVolumePg.Close;
  CdsVolumeLanc.Close;
  CdsAvenc.Close;
  Cdsvenc.Close;
  CdsCalcMov.Close;
  Inherited;
End;

Procedure TFrmConsFornMT.RgGraficoClick(Sender: TObject);
Begin
  Inherited;
  Case RgGrafico.ItemIndex Of
    0:
      Begin
        Grafico.Series[0].ColorEachPoint := False;
        Grafico.Series[0].Active := False;
        Grafico.Series[1].ColorEachPoint := True;
        Grafico.Series[1].Active := True;
      End;
    1:
      Begin
        Grafico.Series[0].ColorEachPoint := True;
        Grafico.Series[0].Active := True;
        Grafico.Series[1].ColorEachPoint := False;
        Grafico.Series[1].Active := False;
      End;
    2:
      Begin
        Grafico.Series[0].ColorEachPoint := False;
        Grafico.Series[0].Active := True;
        Grafico.Series[1].ColorEachPoint := False;
        Grafico.Series[1].Active := True;
      End;
  End;
End;

Procedure TFrmConsFornMT.BtnCalcularClick(Sender: TObject);
Begin
  Inherited;
  If (CPForCli.Text <> '') And (DtIni.Text <> '') And (DtFin.Text <> '') Then
  Begin
    CdsCalcMov.Close;
    SqlCalcMov.Prepare;
    SqlCalcMov.ParamByName('PIDPESSOA').AsFloat := CPForCli.ForCliReg.Id;
    SqlCalcMov.ParamByName('PDATAINI').AsDateTime := StrToDate(DtIni.Text);
    SqlCalcMov.ParamByName('PDATAFIN').AsDateTime := StrToDate(DtFin.Text);
    SqlCalcMov.ParamByName('PRECPAG').AsString := ParamIntegra.RecPag;
    SqlCalcMov.Open;
    TFloatField(CdsCalcMov.FieldByName('VALORPAGO')).DisplayFormat := '#,##0.00';
    TFloatField(CdsCalcMov.FieldByName('VALORLANC')).DisplayFormat := '#,##0.00';
  End;
End;

Procedure TFrmConsFornMT.SpeedButton1Click(Sender: TObject);
Var
  rAux: Real;
Begin
  Inherited;
  If bNomeValidoCliForDlg Then
  Begin
    CdsVolumePg.Close;
    CdsVolumeLanc.Close;
    CdsAvenc.Close;
    CdsVenc.Close;
    CdsBaixa.Close;
    SqlVolumePg.Prepare;
    SqlVolumePg.Params[0].AsFloat := CPForCli.ForCliReg.Id;
    SqlVolumePg.Params[1].AsDateTime := Date - 365;
    SqlVolumePg.Params[2].AsString := ParamIntegra.RecPag;

    SqlVolumeLanc.Prepare;
    SqlVolumeLanc.Params[0].AsFloat := CPForCli.ForCliReg.Id;
    SqlVolumeLanc.Params[1].AsDateTime := Date - 365;
    SqlVolumeLanc.Params[2].AsString := ParamIntegra.RecPag;

    SqlAvenc.Prepare;
    SqlAvenc.Params[0].AsFloat := CPForCli.ForCliReg.Id;
    SqlAvenc.Params[1].AsString := ParamIntegra.RecPag;

    SqlVenc.Prepare;
    SqlVenc.Params[0].AsFloat := CPForCli.ForCliReg.Id;
    SqlVenc.Params[1].AsString := ParamIntegra.RecPag;

    SqlVolumeLanc.Open;
    TFloatField(CdsVolumeLanc.FieldByName('VALORLANCADO')).DisplayFormat := '#,##0.00';
    SqlVolumePg.Open;
    TFloatField(CdsVolumePg.FieldByName('VALORPAGO')).DisplayFormat := '#,##0.00';
    SqlAvenc.Open;
    TFloatField(CdsAvenc.FieldByName('SALDO')).DisplayFormat := '#,##0.00';
    TFloatField(CdsAvenc.FieldByName('SALDOOM')).DisplayFormat := '#,##0.00';
    SqlVenc.Open;
    TFloatField(CdsVenc.FieldByName('SALDO')).DisplayFormat := '#,##0.00';
    TFloatField(CdsVenc.FieldByName('SALDOOM')).DisplayFormat := '#,##0.00';

    rAux := 0;
    CdsAvenc.First;
    While Not CdsAvenc.Eof Do
    Begin
      rAux := rAux + CdsAvenc.FieldByName('SALDO').AsFloat;
      CdsAvenc.Next;
    End;
    PnlTotaVenc.Caption := 'Total: ' + FloatToStrF(rAux, ffNumber, 17, 2) + ' ';
    CdsAvenc.First;

    rAux := 0;
    CdsVenc.First;
    While Not CdsVenc.Eof Do
    Begin
      rAux := rAux + CdsVenc.FieldByName('SALDO').AsFloat;
      CdsVenc.Next;
    End;
    PnlTotAtraso.Caption := 'Total: ' + FloatToStrF(rAux, ffNumber, 17, 2) + ' ';
    CdsVenc.First;
  End
  Else
  Begin
    PnlTotaVenc.Caption := 'Total: ';
    PnlTotAtraso.Caption := 'Total: ';
    CdsVolumeLanc.Close;
    CdsVolumePg.Close;
    CdsAvenc.Close;
    Cdsvenc.Close;
    CdsCalcMov.Close;
    DbrLanc.lines.Clear;
    DbrPag.lines.Clear;
  End;
End;

{
  DF 11/07 Gustavo
  Alteração nos títulos das opçoes do graáfico: Mostrava 'Pagamentos' no contas a receber
  Fim DF 11/07 Gustavo
}

End.

