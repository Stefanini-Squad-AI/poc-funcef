//******************************************************************************
// Data      : 13/03/2007
// Código    : AL_12
// Pendencia :
// SOL       :
// Motivo    : Ajuste na mensagem de reprocessamento
//******************************************************************************
// Data      : 24/08/2006
// Código    : AL_11
// Pendencia : 22946 / 23183
// SOL       : 45112
// Motivo    : Implementação do Fundo de Inv. em Participação
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_10
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data      : 20/02/2005
// Código    : AL_9
// Pendencia :
// SOL       :
// Motivo    : Implementação da verificação de processo de atualização em andamento
//******************************************************************************
// Data     : 14/10/2005
// Código   : AL_8
// Motivo   : Passagem de Parametro Data para String
//            Acerto na qry
//******************************************************************************
// Data     : 11/08/2005
// Código   : AL_7
// Motivo   : Implementação do duplo click na grid
//******************************************************************************
// Data     : 11/08/2005
// Código   : AL_6
// Motivo   : Implementação do reprocessamento
//******************************************************************************
// Data     : 11/08/2005
// Código   : AL_5
// Motivo   : Implementação de campos para guardar dados q serão deletados e usados no reprocessamento
//******************************************************************************
// Data     : 11/08/2005
// Código   : AL_4
// Motivo   : Implementação de campos na query QryFundoInvest .
//******************************************************************************
// Data     : 30/05/2005
// Código   : AL_3
// Motivo   : Implementação do teste de período contabil em 3 camadas
//******************************************************************************
// Data     : 06/06/2005
// Código   : AL_4
// Motivo   : Invertido o ORDER BY para DESC na qryDetalhe
//            Alterado o DFM
//******************************************************************************
// Data     : 29/03/2005
// Código   : AL_2
//******************************************************************************
// Data     : 18/10/2004
// Código   : AL_1
// Motivo   : Troca o Caption do Form 
//******************************************************************************

unit FCadCotIntegrFundo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroRMDetCSInv, CmEventosCadastro, ImgList, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr,
  fcLabel, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, TabControlDetalhe, ExtCtrls, TREdit, wwdbdatetimepicker,
  CMDateTimePicker, wwdblook, FPreview, uCtrlInvContab;

type
  TfrmCadCotIntegrFundo = class(TfrmCadastroRMDetInv)
    Investimento: TLabel;
    Label1: TLabel;
    dblInvest: TwwDBLookupCombo;
    QryFundoInvest: TwwQuery;
    Label2: TLabel;
    Label3: TLabel;
    QryFundoInvestIDFUNDOINVEST: TFloatField;
    QryFundoInvestDESCFUNDOINVEST: TStringField;
    QryFundoInvestIDGESTORCARTEIRA: TFloatField;
    QryFundoInvestTRGDTINCLUSAO: TDateTimeField;
    QryFundoInvestTRGUSERINCLUSAO: TStringField;
    QryFundoInvestMOECODIGO: TFloatField;
    QryFundoInvestIDCARTEIRAINVEST: TFloatField;
    QryFundoInvestIDTIPOFUNDOINVEST: TFloatField;
    QryFundoInvestCNPJFUNDO: TStringField;
    QryFundoInvestSTAEXCLUSIVO: TStringField;
    QryFundoInvestPZOCARENCIA: TFloatField;
    QryFundoInvestPZOANIVERSARIO: TFloatField;
    QryFundoInvestPZOLIQAPLIC: TFloatField;
    QryFundoInvestPZOLIQRESG: TFloatField;
    QryFundoInvestQTDDECQTD: TFloatField;
    QryFundoInvestQTDDECVALOR: TFloatField;
    QryFundoInvestSTAFUNDO: TStringField;
    QryFundoInvestPZOAMORTIZACAO: TFloatField;
    QryFundoInvestPERCTXPERFORM: TFloatField;
    QryFundoInvestPERCTXADM: TFloatField;
    QryFundoInvestCODFUNCETIP: TStringField;
    QryFundoInvestSTAPROVISIONAIR: TStringField;
    QryFundoInvestSTAPROVISIONAIOF: TStringField;
    QryFundoInvestCONTRCETIP: TStringField;
    QryFundoInvestDATAREFERENCIA: TStringField;
    qryDetalheIDFUNDOINVEST: TFloatField;
    qryDetalheDATACOTA: TDateTimeField;
    qryDetalheVLRCOTA: TFloatField;
    dbdDta: TCMDateTimePicker;
    DbEdValorCota: TDBRealEdit;
    sbtnImprimir: TToolbarButton97;
    //Al_4
    QryFundoInvestDATAULTFECH: TDateTimeField;
    QryFundoInvestDTAINIPROC: TDateTimeField;
    qryDetalheIDCOTAINTEGRFUNDO: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure dblInvestCloseUp(Sender: TObject; LookupTable,
          FillTable: TDataSet; modified: Boolean);
    procedure dblInvestExit(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure dsDetStateChange(Sender: TObject);
    procedure sbtnImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    //Al_7
    procedure dbgrdDetDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure Sel(idFundo : Largeint; sData : String);
    procedure HabBtDet;
    function  VerificaCampos: Boolean;
  public
    { Public declarations }
  end;

var
  frmCadCotIntegrFundo: TfrmCadCotIntegrFundo;

implementation

uses UDataBase, uMensErro,UDiasUteisInv, UFundoComum, UBibliotecaInvest,
     UOperComum, USistema, FDmRelConsCotaIntegrFundo;

{$R *.DFM}

procedure TfrmCadCotIntegrFundo.Sel(idFundo : Largeint; sData : String);
begin
   OperComum.LimpaParametros(qryDetalhe);
   qryDetalhe.ParamByName('IDFUNDOINVEST').AsInteger := idFundo;
   if Trim(sData) <> '' then
      qryDetalhe.ParamByName('DATACOTA').AsString    := sData;
   qryDetalhe.Open;
   HabBtDet;
end;


procedure TfrmCadCotIntegrFundo.FormShow(Sender: TObject);
begin
   inherited;
   QryFundoInvest.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
   QryFundoInvest.Open;

   Sel(-1,'');
   //AL_1
   if Sistema.NumDocEmpresa = '42271429000163' then // VALIA
      lbNomItem.Caption := 'Cotas Correção Monetária';
end;

procedure TfrmCadCotIntegrFundo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   inherited;
   QryFundoInvest.Close;
   qryDetalhe.Close;
   pnlMestre.Enabled := True;
end;

procedure TfrmCadCotIntegrFundo.sbtnProcurarClick(Sender: TObject);
begin
   inherited;

   if MontaSelect.RetornouValor then
   begin
      Sel(StrToInt(MontaSelect.ValoresChave[0]), MontaSelect.ValoresChave[1]);
      dblInvest.LookupValue := MontaSelect.ValoresChave[0];
   end;
   pnlFundo.Enabled := True;
   pnlMestre.Enabled := True;
   tbcDetalhe.Enabled := True;
   pgctrlDetalhe.Enabled := True;

   bbtnOkDet.Enabled := False;
   bbtnCancelarDet.Enabled := False;
   bbtnVoltarDet.Enabled := False;

   HabBtDet;

   dblInvest.SetFocus;
end;

procedure TfrmCadCotIntegrFundo.sbtnExcluiDetClick(Sender: TObject);
//Al_5
var
   dDataOper, dDataUltFech, dDataIniProc : TDateTime;
   iFundo, iTipoFundoInvest              : Integer;
begin
   // AL_3
   if (not qryDetalhe.IsEmpty) then
   begin
      //AL_10
      if not CtrlInvContab.TestaPeriodo(qryDetalheDATACOTA.AsString, iTipoInvestUsu) then
         MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0)
      else
      begin
         //AL_9
         if VerEmAbertura(QryFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
            Exit;

         if (MsgDlg('Deseja realmente excluir esta Cota?', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) then
         begin
            //Al_5
            dDataOper    := dbdDta.DateTime;
            dDataUltFech := QryFundoInvest.FieldByName('DATAULTFECH').AsDateTime;
            dDataIniProc := QryFundoInvest.FieldByName('DTAINIPROC').AsDateTime;
            iFundo       := QryFundoInvest.FieldByName('IDFUNDOINVEST').AsInteger;
            iTipoFundoInvest := QryFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger;

            inherited;

            AplicaAlteracoes([qryDetalhe]);
            //AL_12            
            //Al_6
            If dDataOper <= dDataUltFech Then
            begin
               If Not Reprocessamento(iTipoInvestUsu, iTipoFundoInvest, iFundo,
                                      -1,
                                      dDataOper, dDataUltFech, dDataIniProc,
                                      True, -1) Then
                  MsgDlg('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!',
                         'Mensagem do Sistema', MtInformation,[MbOk],0);
            end;
         end;
      end;
   end;
   HabBtDet;
end;

procedure TfrmCadCotIntegrFundo.HabBtDet;
begin
  if Trim(dblInvest.Text) = '' then
  begin
     sbtnInsDet.Enabled := False;
     sbtnAltDet.Enabled := False;
     sbtnExcluiDet.Enabled := False;
  end else begin
     sbtnInsDet.Enabled := True;
     if qryDetalhe.IsEmpty then
     begin
        sbtnAltDet.Enabled := False;
        sbtnExcluiDet.Enabled := False
     end else begin
        sbtnExcluiDet.Enabled := True;
        sbtnAltDet.Enabled := True;
     end;
  end;
end;

procedure TfrmCadCotIntegrFundo.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  HabBtDet;
end;

procedure TfrmCadCotIntegrFundo.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  HabBtDet;
end;

procedure TfrmCadCotIntegrFundo.dblInvestCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if (Trim(dblInvest.Text) <> '') then
      Sel(QryFundoInvestIDFUNDOINVEST.AsInteger, '');
end;

procedure TfrmCadCotIntegrFundo.dblInvestExit(Sender: TObject);
begin
   inherited;
   if Trim(dblInvest.Text) <> '' then
      if (qryDetalheIDFUNDOINVEST.AsInteger <> QryFundoInvestIDFUNDOINVEST.AsInteger) and
         (qryDetalhe.State = dsBrowse) then
         Sel(QryFundoInvestIDFUNDOINVEST.AsInteger,'');

   //AL_15
   if Trim(dblInvest.Text) = '' then
   begin
      OperComum.LimpaParametros(qryDetalhe);
      qryDetalhe.Open;
   end;
end;

procedure TfrmCadCotIntegrFundo.FormPaint(Sender: TObject);
begin
   inherited;
   pnlMestre.Enabled := True;
end;

procedure TfrmCadCotIntegrFundo.bbtnOkDetClick(Sender: TObject);
//Al_5
var
   dDataOper : TDateTime;
begin
   if not VerificaCampos then
      exit;

   //AL_3
   //AL_10
   if not CtrlInvContab.TestaPeriodo(qryDetalheDATACOTA.AsString, iTipoInvestUsu) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      Exit;
   end;

   //AL_9
   if VerEmAbertura(QryFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
      Exit;

   Try
      //AL_11
      qryDetalheIDCOTAINTEGRFUNDO.AsInteger := LeUltRegistro(Nil,'COTAINTEGRFUNDO');

      qryDetalheIDFUNDOINVEST.AsString := dblInvest.LookupValue;
      qryDetalheDATACOTA.AsDateTime    := dbdDta.DateTime;
      qryDetalheVLRCOTA.AsFloat        := DbEdValorCota.Value;
      //Al_5
      dDataOper                        := dbdDta.DateTime;
      CmeDetalhe.RepetirInsert         := False;
      inherited;
      AplicaAlteracoes([qryDetalhe]);
      Sel(StrToInt(dblInvest.LookupValue), '');
      HabBtDet;
      //AL_12      
      //Al_6
      If dDataOper < QryFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
      begin
         If Not Reprocessamento(iTipoInvestUsu,
                                QryFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                QryFundoInvest.FieldByName('IDFUNDOINVEST').AsInteger,
                                -1,
                                dDataOper,
                                QryFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                                QryFundoInvest.FieldByName('DTAINIPROC').AsDateTime,
                                True, -1) Then
            MsgDlg('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!',
                   'Mensagem do Sistema', MtInformation,[MbOk],0);
      end;
   except
      Sel(StrToInt(dblInvest.LookupValue), '');
   end;
end;

function TfrmCadCotIntegrFundo.VerificaCampos: Boolean;
begin
   Result := False;
   if Trim(dblInvest.Text) = '' then
   begin
      MsgDlg('Fundo não Selecionado','Mensagem do Sistema',mtWarning,[MbOk],0);
      dblInvest.SetFocus;
      Exit;
   end;

   if Trim(dbdDta.Text) = '' then
   begin
      MsgDlg('Data não Selecionada','Mensagem do Sistema',mtWarning,[MbOk],0);
      dbdDta.SetFocus;
      Exit;
   end;

   if DbEdValorCota.Value = 0 then
   begin
      MsgDlg('Valor da Cota não Informado','Mensagem do Sistema',mtWarning,[MbOk],0);
      DbEdValorCota.SetFocus;
      Exit;
   end;

   Result := True;
end;

procedure TfrmCadCotIntegrFundo.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
   if dbdDta.CanFocus then
      dbdDta.SetFocus;
end;

procedure TfrmCadCotIntegrFundo.sbtnAltDetClick(Sender: TObject);
begin
   inherited;
   if DbEdValorCota.CanFocus then
      DbEdValorCota.SetFocus;
end;

procedure TfrmCadCotIntegrFundo.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if dsDet.State = dsEdit then
     dbdDta.Enabled := False
  else dbdDta.Enabled := True;
end;

procedure TfrmCadCotIntegrFundo.sbtnImprimirClick(Sender: TObject);
var
  dDataIni, dDataFim : TDateTime;
begin
   inherited;
   //AL_8
   qryDetalhe.DisableControls;
   qryDetalhe.First;
   dDataIni := qryDetalhe.FieldByName('DATACOTA').AsDateTime;
   dDataFim := qryDetalhe.FieldByName('DATACOTA').AsDateTime;
   while not qryDetalhe.EOF do
   begin
      if qryDetalhe.FieldByName('DATACOTA').AsDateTime < dDataIni then
         dDataIni := qryDetalhe.FieldByName('DATACOTA').AsDateTime;

      qryDetalhe.Next;
   end;
   qryDetalhe.EnableControls;

   with DmRelConsCotaIntegrFundo do
   begin
      OperComum.LimpaParametros(QryCotaIntegrFundo);
      If dblInvest.Text <> '' Then
         QryCotaIntegrFundo.ParamByName('IDFUNDOINVEST').AsInteger := StrToInt(dblInvest.lookupvalue);
      QryCotaIntegrFundo.ParamByName('DATAINI').AsString := DateToStr(dDataini);
      QryCotaIntegrFundo.ParamByName('DATAFIM').AsString := DateToStr(dDataFim);
      QryCotaIntegrFundo.Open;

      if not QryCotaIntegrFundo.IsEmpty then
      begin
         if Sistema.NumDocEmpresa = '42271429000163' then // VALIA
         begin
            lblTitle.Caption := 'Consulta de Cotas Gerenciais dos Fundos de Investimentos';
            DmRelConsCotaIntegrFundo.rptCotaIntegrFundo.PrinterSetup.DocumentName := 'Consulta de Cotas Gerenciais dos Fundos de Investimentos';
         end;

         DmRelConsCotaIntegrFundo.lblDtIni.Caption   := DateToStr(dDataIni);
         DmRelConsCotaIntegrFundo.lblDtFinal.Caption := DateToStr(dDataFim);

         TfrmPreview.CreateModalPreview(Application,
                                        rptCotaIntegrFundo,
                                        rptCotaIntegrFundo.PrinterSetup.DocumentName);
      end;

      QryCotaIntegrFundo.Close;
   end;

   pnlFundo.Enabled := True;
   sbtnImprimir.Down  := False;
end;

procedure TfrmCadCotIntegrFundo.FormCreate(Sender: TObject);
begin
  inherited;
   MontaSelect.Filtro.Add('TIPOFUNDOINVEST.IDTIPOINVEST = ' + IntToStr(iTipoInvestUsu));
end;

//Al_7
procedure TfrmCadCotIntegrFundo.dbgrdDetDblClick(Sender: TObject);
begin
  inherited;
   sbtnAltDetClick(Sender);
end;

end.
