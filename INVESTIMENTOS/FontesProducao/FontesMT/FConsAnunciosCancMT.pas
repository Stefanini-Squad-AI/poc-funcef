//******************************************************************************//
// Data      : 13/08/2007
// Código    : AL_3
// Pendência : 24957
// SOL       : 56201
// Motivo    : Implementação do Relatório Consolidado por Investimento
//             Troca de Prpi para CtrlPinv
//             O Total da Operação só será impresso se houver + que 1 operação
//******************************************************************************
// Data     : 01/11/2006
// Código   : AL_2
// Pendencia: 23670
// SOL      :
// Desc     : Segregação de Planos
//******************************************************************************
// Data     : 22/05/2006
// Código   : AL_1
// Pendencia: 22375
// SOL      : 43236
// Desc     : Desmenbramento do Relatório de Cancelamento de Anúncios
//******************************************************************************

unit FConsAnunciosCancMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarRelInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, FPreview, uCtrlDireitos, RAnunciosCanc,
  Grids, Wwdbigrd, Wwdbgrid, wwdblook, wwdbdatetimepicker, CMDateTimePicker,
  Db, DBClient, uCMClientDataSet, uCtrlRendaVariavel, uCtrlInvestimento,
  uCmSqlParams, uCtrlPadroes, uInvestimento, uMensErro;

type
  TfrmConsAnunciosCancMT = class(TfrmOkCancelarRelInv)
    pnlFiltros: TPanel;
    Label1: TLabel;
    dblInvestimento: TwwDBLookupCombo;
    pnlGrid: TPanel;
    grdConsulta: TwwDBGrid;
    cdsInvestimento: TCMClientDataSet;
    dsAnunciosCanc: TDataSource;
    cdsAnunciosCanc: TCMClientDataSet;
    sprAnunciosCanc: TCMSqlParams;
    cdsAnunciosCancBOLETA: TStringField;
    cdsAnunciosCancDESCTIPOOPERACAO: TStringField;
    cdsAnunciosCancDESCINVESTIMENTO: TStringField;
    cdsAnunciosCancDESCCARTINVEST: TStringField;
    cdsAnunciosCancSIGLAMOTBLOQ: TStringField;
    cdsAnunciosCancDESCMOTBLOQ: TStringField;
    cdsAnunciosCancDATAEX: TDateTimeField;
    cdsAnunciosCancDATAPREVISTA: TDateTimeField;
    cdsAnunciosCancCONTA: TStringField;
    cdsAnunciosCancQTDPREVISTA: TFloatField;
    cdsAnunciosCancVALORPREVISTO: TFloatField;
    cdsAnunciosCancQTDRECEBIDA: TFloatField;
    cdsAnunciosCancQTDCANCELADA: TFloatField;
    cdsAnunciosCancPRECOUNITOPERACAO: TFloatField;
    cdsAnunciosCancVLROPERACAO: TFloatField;
    cdsAnunciosCancDATAOPERACAO: TDateTimeField;
    cdsAnunciosCancDATABASE: TDateTimeField;
    lblTipoOper: TLabel;
    dblTipoOper: TwwDBLookupCombo;
    CdsTipoOperacao: TCMClientDataSet;
    cdsAnunciosCancGRUPO: TStringField;
    cdsTotais: TCMClientDataSet;
    cdsTotaisBOLETA: TStringField;
    cdsTotaisDESCTIPOOPERACAO: TStringField;
    cdsTotaisDESCINVESTIMENTO: TStringField;
    cdsTotaisDESCCARTINVEST: TStringField;
    cdsTotaisSIGLAMOTBLOQ: TStringField;
    cdsTotaisDESCMOTBLOQ: TStringField;
    cdsTotaisDATAOPERACAO: TDateTimeField;
    cdsTotaisDATAEX: TDateTimeField;
    cdsTotaisDATAPREVISTA: TDateTimeField;
    cdsTotaisDATABASE: TDateTimeField;
    cdsTotaisCONTA: TStringField;
    cdsTotaisQTDPREVISTA: TFloatField;
    cdsTotaisVALORPREVISTO: TFloatField;
    cdsTotaisQTDRECEBIDA: TFloatField;
    cdsTotaisQTDCANCELADA: TFloatField;
    cdsTotaisPRECOUNITOPERACAO: TFloatField;
    cdsTotaisVLROPERACAO: TFloatField;
    cdsTotaisGRUPO: TStringField;
    cdsAnunciosCancCOR: TStringField;
    cdsAnunciosCancPLANPRVCONTABPATRO: TStringField;
    lblDtIni: TLabel;
    edDataIni: TCMDateTimePicker;
    lblDtFim: TLabel;
    edDataFim: TCMDateTimePicker;
    Label6: TLabel;
    cdsPlanoPatro: TCMClientDataSet;
    dblPlanPatro: TwwDBLookupCombo;
    ChBxConsolidadoInvest: TCheckBox;
    dblSegmentacao: TwwDBLookupCombo;
    Label7: TLabel;
    cdsSegmentacao: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure bt_ImprimeClick(Sender: TObject);
    procedure grdConsultaCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure grdConsultaTopRowChanged(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure grdConsultaUpdateFooter(Sender: TObject);
    procedure cdsAnunciosCancAfterScroll(DataSet: TDataSet);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure cdsAnunciosCancAfterOpen(DataSet: TDataSet);
    procedure ChBxConsolidadoInvestClick(Sender: TObject);
  private
    { Private declarations }
    CtrlDireitos : TCtrlDireitos;
    relAnunciosCanc : TRelAnunciosCanc;
    CtrlInvestimento  : TCtrlInvestimento;
    CtrlRendaVariavel : TCtrlRendaVariavel;
    procedure CalculaRodape;
  public
    { Public declarations }
  end;

var
  frmConsAnunciosCancMT: TfrmConsAnunciosCancMT;

implementation
                        // AL_3
uses  UBibliotecaInvest,UCtrlParamInvest;

{$R *.DFM}

procedure TfrmConsAnunciosCancMT.FormCreate(Sender: TObject);
var sTipoOper : String;
begin
  inherited;
   relAnunciosCanc   := TRelAnunciosCanc.Create(Self);
   CtrlDireitos      := TCtrlDireitos.Create;;
   CtrlInvestimento  := TCtrlInvestimento.Create;
   CtrlRendaVariavel := TCtrlRendaVariavel.Create;

   CtrlInvestimento.InitializeAs(Padroes);
   CtrlRendaVariavel.InitializeAs(Padroes);
   CtrlDireitos.InitializeAs(Padroes);

   cdsInvestimento.Data := CtrlInvestimento.ListInvestimento(-1, 2);
   sTipoOper := '';
   //AL_3
   if CtrlPinv.IDTIPOOPERDIRDIV <> 0 then
      sTipoOper := sTipoOper + IntToStr(CtrlPinv.IDTIPOOPERDIRDIV) + ',' + IntToStr(CtrlPinv.IDTIPOOPERDIRDIV + 10000);
   if CtrlPinv.IDTIPOOPERDIRJUR <> 0 then
   begin
      if sTipoOper <> '' then
         sTipoOper := sTipoOper + ',' + IntToStr(CtrlPinv.IDTIPOOPERDIRJUR) + ',' + IntToStr(CtrlPinv.IDTIPOOPERDIRJUR + 10000)
      else
         sTipoOper := sTipoOper + IntToStr(CtrlPinv.IDTIPOOPERDIRJUR) + ',' + IntToStr(CtrlPinv.IDTIPOOPERDIRJUR + 10000);
   end;
   if CtrlPinv.IDTIPOOPERDIRMUL <> 0 then
   begin
      if sTipoOper <> '' then
         sTipoOper := sTipoOper + ',' + IntToStr(CtrlPinv.IDTIPOOPERDIRMUL) + ',' + IntToStr(CtrlPinv.IDTIPOOPERDIRMUL + 10000)
      else
         sTipoOper := sTipoOper + IntToStr(CtrlPinv.IDTIPOOPERDIRMUL) + ',' + IntToStr(CtrlPinv.IDTIPOOPERDIRMUL + 10000);
   end; // Fim AL_3
   CdsTipoOperacao.Data := CtrlRendaVariavel.ListTipoOperRenVar(sTipoOper);
   //AL_2
   cdsPlanoPatro.Data  := CtrlInvestimento.ListPlanoPatro;

   cdsSegmentacao.Data := CtrlInvestimento.ListSegmentacao(2); //Renan Cristiano Sol 131501/1101 Kintana 760170
end;

procedure TfrmConsAnunciosCancMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   FreeAndNil(relAnunciosCanc);
   FreeAndNil(CtrlInvestimento);
   FreeAndNil(CtrlRendaVariavel);
   FreeAndNil(CtrlDireitos);
end;

procedure TfrmConsAnunciosCancMT.FormShow(Sender: TObject);
begin
  inherited;
  cdsAnunciosCanc.Data := relAnunciosCanc.CtrlDireitos.ListaRelAnunciosCanc(0,0,-1,-1,-1);

end;

procedure TfrmConsAnunciosCancMT.bt_ImprimeClick(Sender: TObject);
begin
  inherited;
   // AL_3
   If Not(ChBxConsolidadoInvest.Checked) then
   begin // Fim AL_3
   relAnunciosCanc.cdsAnunciosCanc.Data := cdsAnunciosCanc.Data;

   //AL_3
   relAnunciosCanc.LblEmpresa.Caption := CtrlPinv.NomeEmpresa;
   relAnunciosCanc.LblSistema.Caption := CtrlPinv.NomeModulo; // Fim AL_3
   relAnunciosCanc.lblPeriodo.Caption :='Período :' + edDataIni.Text + ' a ' + edDataFim.Text;

   if not cdsAnunciosCanc.IsEmpty then
   begin
      TFrmPreview.CreateModalPreview(Application,
                                     relAnunciosCanc.rptAnunciosCanc,
                                     relAnunciosCanc.rptAnunciosCanc.PrinterSetup.DocumentName);


   end;
   relAnunciosCanc.cdsAnunciosCanc.EmptyDataSet;
   //AL_3
   end
   else
   begin
      relAnunciosCanc.ppLabel5.Caption := CtrlPinv.NomeEmpresa;
      relAnunciosCanc.ppLabel26.Caption := CtrlPinv.NomeModulo;
      relAnunciosCanc.ppLabel12.Caption :='Período :' + edDataIni.Text + ' a ' + edDataFim.Text;

      if not relAnunciosCanc.cdsAnunciosCancCon.IsEmpty then
             TFrmPreview.CreateModalPreview(Application,
                                            relAnunciosCanc.rptAnunciosCancCon,
                                            relAnunciosCanc.rptAnunciosCancCon.PrinterSetup.DocumentName);
   end; // Fim AL_3
end;

procedure TfrmConsAnunciosCancMT.grdConsultaCalcCellColors(Sender: TObject;Field: TField; State: TGridDrawState;
                                                           Highlight: Boolean; AFont: TFont; ABrush: TBrush);
const clYellowBaby = $00C0FFFF;//Amarelo Bebê
begin
  inherited;
 if not (gdFixed in State) then
  begin
     if TwwDBGrid(Sender).CalcCellRow = TwwDBGrid(Sender).GetActiveRow then
     begin
        if not ((gdSelected in State) or (gdFocused in State)) then
        begin
           if Field.DataSet.FieldByName('COR').AsString = 'S' then
              AFont.Color := clYellowBaby
           else
              AFont.Color := clHighLightText;
        end
        else
           AFont.Color := clSilver;
        ABrush.Color := clHighLight;
     end
     else
     if not ((gdSelected in State) or (gdFocused in State)) then
     begin
        if Field.DataSet.FieldByName('COR').AsString = 'S' then
           ABrush.Color := clYellowBaby
        else
           ABrush.Color := clWhite;
     end
     else
     begin
        ABrush.Color := clHighLight;
        AFont.Color  := clHighLightText;
     end;
  end;
end;

procedure TfrmConsAnunciosCancMT.grdConsultaTopRowChanged(Sender: TObject);
begin
  inherited;
  TwwDBGrid(Sender).Invalidate;
end;

procedure TfrmConsAnunciosCancMT.bbtnConfirmarClick(Sender: TObject);
var iInvestimento, iTipoOper, iPlanoPrev, iSegmentacao : Integer;
    sGrupo, sCor: String;
begin
  inherited;
  if Trim(edDataIni.Text) = '' then
  begin
     MsgDlg('Data Inicial não informada.','Mensagem do Sistema', MtWarning, [MbOk],0);
     if edDataIni.CanFocus then
        edDataIni.SetFocus;
     Exit;
  end;

  if Trim(edDataFim.Text) = '' then
  begin
     MsgDlg('Data Final não informada.','Mensagem do Sistema', MtWarning, [MbOk],0);
     if edDataFim.CanFocus then
        edDataFim.SetFocus;
     Exit;
  end;

  //AL_2
  if Trim(dblPlanPatro.Text) = '' then
     iPlanoPrev := -1
  else
     iPlanoPrev := cdsPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsInteger;

  if Trim(dblInvestimento.Text) = '' then
     iInvestimento := -1
  else
     iInvestimento := cdsInvestimento.FieldByName('IDINVESTIMENTO').AsInteger;

  if Trim(dblTipoOper.Text) = '' then
     iTipoOper := -1
  else
     iTipoOper := CdsTipoOperacao.FieldByName('IDTIPOOPERACAO').AsInteger;

  //Renan Cristiano Sol 131501/1101 Kintana 760170 Inicio
  if Trim(dblSegmentacao.Text) = '' then
     iSegmentacao := -1
  else
     iSegmentacao := cdsSegmentacao.FieldByName('IDSEGMENTACAO').AsInteger;
  //Renan Cristiano Sol 131501/1101 Kintana 760170 Fim

  cdsAnunciosCanc.Data := relAnunciosCanc.CtrlDireitos.ListaRelAnunciosCanc(edDataIni.Date, edDataFim.Date,
                                                                            iPlanoPrev, iInvestimento, iTipoOper, iSegmentacao);
                                                                            //Renan Cristiano Sol 131501/1101 Kintana 760170
  // AL_3
  If ChBxConsolidadoInvest.Checked then
  begin
     relAnunciosCanc.cdsAnunciosCancCon.Data := relAnunciosCanc.CtrlDireitos.ListaRelAnunciosCancCon(edDataIni.Date, edDataFim.Date,
                                                                            -1, iInvestimento, iTipoOper, iSegmentacao);
  end;// Fim AL_3                                                           //Renan Cristiano Sol 131501/1101 Kintana 760170

  // Grava o controle de cores para o relatório
  try
     cdsAnunciosCanc.DisableControls;
     sGrupo := '';
     sCor := 'N';
     while not cdsAnunciosCanc.Eof do
     begin
        if sGrupo <> cdsAnunciosCanc.FieldByName('GRUPO').AsString then
        begin
           if sCor = 'S' then
              sCor := 'N'
           else
              sCor := 'S';
           sGrupo := cdsAnunciosCanc.FieldByName('GRUPO').AsString;
        end;
        cdsAnunciosCanc.Edit;
        cdsAnunciosCanc.FieldByName('COR').AsString := sCor;
        cdsAnunciosCanc.Post;
        cdsAnunciosCanc.Next;
     end;
  finally
     cdsAnunciosCanc.First;
     cdsAnunciosCanc.EnableControls;
  end;

  if cdsAnunciosCanc.IsEmpty then
     bt_Imprime.Enabled := False
  else
     bt_Imprime.Enabled := True;
end;

procedure TfrmConsAnunciosCancMT.CalculaRodape;
var fTotPrevisto, fTotRecebido, fTotCancelado: Double;
begin
   if (dgShowFooter in grdConsulta.Options) and (not cdsAnunciosCanc.IsEmpty) then
   begin
      try
         cdsTotais.Data := cdsAnunciosCanc.Data;
         cdsTotais.Filtered := True;
         cdsTotais.Filter := '';
         cdsTotais.Filter := 'GRUPO = ' + QuotedStr(cdsAnunciosCanc.FieldByName('GRUPO').AsString);
         while not cdsTotais.Eof do
         begin
            fTotPrevisto  := fTotPrevisto + cdsTotais.FieldByName('VALORPREVISTO').AsFloat;
            fTotRecebido  := fTotRecebido + cdsTotais.FieldByName('QTDRECEBIDA').AsFloat;
            fTotCancelado := fTotCancelado + cdsTotais.FieldByName('QTDCANCELADA').AsFloat;
            cdsTotais.Next;
         end;
         grdConsulta.ColumnByName('PLANPRVCONTABPATRO').FooterValue   := cdsAnunciosCancPLANPRVCONTABPATRO.AsString;
         grdConsulta.ColumnByName('DESCCARTINVEST').FooterValue   := cdsAnunciosCancDESCCARTINVEST.AsString;
         grdConsulta.ColumnByName('DESCTIPOOPERACAO').FooterValue := cdsAnunciosCancDESCTIPOOPERACAO.AsString;
         grdConsulta.ColumnByName('BOLETA').FooterValue           := cdsAnunciosCancBOLETA.AsString;
         grdConsulta.ColumnByName('VALORPREVISTO').FooterValue    := FloatToStrF( fTotPrevisto, ffNumber, 22, 2);
         grdConsulta.ColumnByName('QTDRECEBIDA').FooterValue      := FloatToStrF( fTotRecebido, ffNumber, 22, 2);
         grdConsulta.ColumnByName('QTDCANCELADA').FooterValue     := FloatToStrF( fTotCancelado, ffNumber, 22, 2);

      finally
         cdsTotais.Close;
      end;
   end;

end;

procedure TfrmConsAnunciosCancMT.grdConsultaUpdateFooter(Sender: TObject);
begin
   inherited;
   CalculaRodape;
end;

procedure TfrmConsAnunciosCancMT.cdsAnunciosCancAfterScroll(DataSet: TDataSet);
begin
   inherited;
   CalculaRodape;
end;

procedure TfrmConsAnunciosCancMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  cdsAnunciosCanc.Data := relAnunciosCanc.CtrlDireitos.ListaRelAnunciosCanc(0,0,-1,-1,-1);

end;

procedure TfrmConsAnunciosCancMT.cdsAnunciosCancAfterOpen(DataSet: TDataSet);
begin
   inherited;
   CalculaRodape;
end;

procedure TfrmConsAnunciosCancMT.ChBxConsolidadoInvestClick(
  Sender: TObject);
begin
  inherited;
  dblPlanPatro.Clear;
  If ((ChBxConsolidadoInvest.checked) and Not(cdsAnunciosCanc.IsEmpty)) or
     Not(ChBxConsolidadoInvest.checked) then
      bbtnConfirmarClick(Self);
end;

end.

