//******************************************************************************
// Data      : 21/08/2006
// Código    : AL_12
// Pendencia : 23118
// SOL       : 45112
// Motivo    : Implementação para utilização do Fundo de Inv. em Participação
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_11
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data     : 120/06/2006
// Linha(s) : Al_10
// Motivo   : Ajuste na busca da cota, para fundos de FIDC devera ser informado o tipo de cota
//******************************************************************************
// Data      : 20/02/2005
// Código    : AL_9
// Pendencia :
// SOL       :
// Motivo    : Implementação da verificação de processo de atualização em andamento
//******************************************************************************
// Data     : 12/12/2005
// Linha(s) : Al_8
// Motivo   : Alteração no layout
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
// Data     : 29/03/2005
// AL_2
// Motivo   : Acerta a alteração feita pelo Fábio abaixo
//******************************************************************************
// Data     : 18/10/2004
// AL_1
// Motivo   : Troca o Caption do Form para quando form Valia
//******************************************************************************

unit FCadCotIntegrFundoFDC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroRMDetCSInv, CmEventosCadastro, ImgList, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr,
  fcLabel, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, TabControlDetalhe, ExtCtrls, TREdit, wwdbdatetimepicker,
  CMDateTimePicker, wwdblook, FPreview, uCtrlInvContab;

type
  TfrmCadCotIntegrFundoFDC = class(TfrmCadastroRMDetInv)
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
    Label4: TLabel;
    QryTipoCota: TwwQuery;
    //AL_12
    qryDetalheIDTIPOCOTA: TFloatField;
    dblTipoCota: TwwDBLookupCombo;
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
    procedure dblTipoCotaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblTipoCotaExit(Sender: TObject);
    //Al_7
    procedure dbgrdDetDblClick(Sender: TObject);
    //AL_12
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure Sel(idFundo, iTipoCota : Largeint; sData : String);
    procedure HabBtDet;
    function  VerificaCampos: Boolean;
  public
    { Public declarations }
  end;

var
  frmCadCotIntegrFundoFDC: TfrmCadCotIntegrFundoFDC;

implementation

uses UDataBase, uMensErro,UDiasUteisInv, UFundoComum, UBibliotecaInvest,
     UOperComum, USistema, FDmRelConsCotaIntegrFundo;

{$R *.DFM}

procedure TfrmCadCotIntegrFundoFDC.Sel(idFundo, iTipoCota : Largeint; sData : String);
begin
   OperComum.LimpaParametros(qryDetalhe);
   qryDetalhe.ParamByName('IDFUNDOINVEST').AsInteger := idFundo;
   //Al_10
   qryDetalhe.ParamByName('IDTIPOCOTA').AsInteger    := iTipoCota;
   if Trim(sData) <> '' then
      qryDetalhe.ParamByName('DATACOTA').AsString    := sData;
   qryDetalhe.Open;
   HabBtDet;
end;

procedure TfrmCadCotIntegrFundoFDC.FormShow(Sender: TObject);
begin
   inherited;
   QryFundoInvest.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
   QryFundoInvest.Open;
   QryTipoCota.Open;
   Sel(-1,-1,'');
   //AL_12
   //AL_1
   if Sistema.NumDocEmpresa = '42271429000163' then // VALIA
      lbNomItem.Caption := 'Cotas Correção Monetária';
end;

procedure TfrmCadCotIntegrFundoFDC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   inherited;
   qry.Close;
   QryTipoCota.Close;
   QryFundoInvest.Close;
   qryDetalhe.Close;
   pnlMestre.Enabled := True;
end;

procedure TfrmCadCotIntegrFundoFDC.sbtnProcurarClick(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
   begin
      //AL_12
      Sel(StrToInt(MontaSelect.ValoresChave[0]), StrToInt(MontaSelect.ValoresChave[2]), MontaSelect.ValoresChave[1]);
      dblInvest.LookupValue   := MontaSelect.ValoresChave[0];
      dblTipoCota.LookupValue := MontaSelect.ValoresChave[2];
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

procedure TfrmCadCotIntegrFundoFDC.sbtnExcluiDetClick(Sender: TObject);
//Al_5
var
   dDataOper, dDataUltFech, dDataIniProc : TDateTime;
   iFundo, iTipoFundoInvest              : Integer;
begin
   if (MsgDlg('Deseja realmente excluir esta Cota?', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) then
   begin
      if (not qryDetalhe.IsEmpty) then
      begin
         //AL_9
         //AL_11
         if not CtrlInvContab.TestaPeriodo(dbdDta.Text, iTipoInvestUsu) then
         begin
            MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
            Exit;
         end;

         if VerEmAbertura(QryFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
            Exit;

         //Al_5
         dDataOper    := dbdDta.DateTime;
         dDataUltFech := QryFundoInvest.FieldByName('DATAULTFECH').AsDateTime;
         dDataIniProc := QryFundoInvest.FieldByName('DTAINIPROC').AsDateTime;
         iFundo       := QryFundoInvest.FieldByName('IDFUNDOINVEST').AsInteger;
         iTipoFundoInvest := QryFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger;

         inherited;

         AplicaAlteracoes([qryDetalhe]);

         //Al_6
         If dDataOper <= dDataUltFech Then
         begin
            If Not Reprocessamento(iTipoInvestUsu,
                                   iTipoFundoInvest,
                                   iFundo,
                                   -1,
                                   dDataOper,
                                   dDataUltFech,
                                   dDataIniProc,
                                   True,
                                   QryTipoCota.FieldByName('IDTIPOCOTA').AsInteger) Then
               MsgDlg('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!',
                      'Mensagem do Sistema', MtInformation,[MbOk],0);
         end;

      end;
   end;
   HabBtDet;
end;

procedure TfrmCadCotIntegrFundoFDC.HabBtDet;
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

procedure TfrmCadCotIntegrFundoFDC.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  HabBtDet;
end;

procedure TfrmCadCotIntegrFundoFDC.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  HabBtDet;
end;

procedure TfrmCadCotIntegrFundoFDC.dblInvestCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  //Al_10
  if (Trim(dblInvest.Text) <> '') then
      Sel(QryFundoInvestIDFUNDOINVEST.AsInteger, -1, '')
  else
  begin
     OperComum.LimpaParametros(qryDetalhe);
     qryDetalhe.Open;
  end;
end;

procedure TfrmCadCotIntegrFundoFDC.dblInvestExit(Sender: TObject);
begin
   inherited;
   //Al_10
   if Trim(dblInvest.Text) <> '' then
   begin
      if (qryDetalheIDFUNDOINVEST.AsInteger <> QryFundoInvestIDFUNDOINVEST.AsInteger) and
         (qryDetalhe.State = dsBrowse) then
         Sel(QryFundoInvestIDFUNDOINVEST.AsInteger,-1,'');
   end
   else
   begin
      OperComum.LimpaParametros(qryDetalhe);
      qryDetalhe.Open;
   end;
end;

procedure TfrmCadCotIntegrFundoFDC.FormPaint(Sender: TObject);
begin
   inherited;
   pnlMestre.Enabled := True;
end;

procedure TfrmCadCotIntegrFundoFDC.bbtnOkDetClick(Sender: TObject);
//Al_5
var
   dDataOper : TDateTime;
begin
   if not VerificaCampos then
      exit;

   //AL_9
   //AL_11
   if not CtrlInvContab.TestaPeriodo(dbdDta.Text, iTipoInvestUsu) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      Exit;
   end;

   if VerEmAbertura(QryFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
      Exit;

   //AL_12
   if qryDetalhe.State = DsInsert then
      qryDetalheIDCOTAINTEGRFUNDO.AsInteger := LeUltRegistro(Nil,'COTAINTEGRFUNDO');

   qryDetalheIDFUNDOINVEST.AsString := dblInvest.LookupValue;
   //AL_12
   qryDetalheIDTIPOCOTA.AsString    := dblTipoCota.LookupValue;
   qryDetalheDATACOTA.AsDateTime    := dbdDta.DateTime;
   qryDetalheVLRCOTA.AsFloat        := DbEdValorCota.Value;
   //Al_5
   dDataOper                        := dbdDta.DateTime;
   CmeDetalhe.RepetirInsert         := False;

   inherited;

   AplicaAlteracoes([qryDetalhe]);
   Sel(StrToInt(dblInvest.LookupValue), StrToInt(dblTipoCota.LookupValue), '');
   HabBtDet;

   //Al_6
   If dDataOper <= QryFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
   begin
      If Not Reprocessamento(iTipoInvestUsu,
                             QryFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                             QryFundoInvest.FieldByName('IDFUNDOINVEST').AsInteger,
                             -1,
                             dDataOper,
                             QryFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                             QryFundoInvest.FieldByName('DTAINIPROC').AsDateTime,
                             True,
                             QryTipoCota.FieldByName('IDTIPOCOTA').AsInteger) Then
         MsgDlg('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!',
                'Mensagem do Sistema', MtInformation,[MbOk],0);
   end;
end;

function TfrmCadCotIntegrFundoFDC.VerificaCampos: Boolean;
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

   if ((dblTipoCota.Enabled) And (dblTipoCota.Text = '')) then
   begin
      MsgDlg('O Tipo de Cota deve ser preenchido','Mensagem do Sistema',mtWarning,[MbOk],0);
      dblTipoCota.SetFocus;
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

procedure TfrmCadCotIntegrFundoFDC.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
   if dbdDta.CanFocus then
      dbdDta.SetFocus;
end;

procedure TfrmCadCotIntegrFundoFDC.sbtnAltDetClick(Sender: TObject);
begin
   inherited;
   if DbEdValorCota.CanFocus then
      DbEdValorCota.SetFocus;
end;

procedure TfrmCadCotIntegrFundoFDC.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if dsDet.State = dsEdit then
     dbdDta.Enabled := False
  else dbdDta.Enabled := True;
end;

procedure TfrmCadCotIntegrFundoFDC.sbtnImprimirClick(Sender: TObject);
var
  dDataIni, dDataFim : TDateTime;
begin
  inherited;
   with DmRelConsCotaIntegrFundo do
   begin
      OperComum.LimpaParametros(QryCotaIntegrFundo);
      If dblInvest.Text <> '' Then
         QryCotaIntegrFundo.ParamByName('IDFUNDOINVEST').AsInteger := StrToInt(dblInvest.lookupvalue);

      //AL_12
      If dblTipoCota.Text <> '' Then
         QryCotaIntegrFundo.ParamByName('IDTIPOCOTA').AsInteger := StrToInt(dblTipoCota.lookupvalue);
      QryCotaIntegrFundo.Open;

      if not QryCotaIntegrFundo.IsEmpty then
      begin
         if Sistema.NumDocEmpresa = '42271429000163' then // VALIA
            lblTitle.Caption := 'Consulta de Cotas Gerenciais dos Fundos de Investimentos';

         QryCotaIntegrFundo.First;
         //AL_12
         dDataFim := QryCotaIntegrFundo.FieldByName('DATACOTA').AsDateTime;
         QryCotaIntegrFundo.Last;
         dDataIni := QryCotaIntegrFundo.FieldByName('DATACOTA').AsDateTime;

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

procedure TfrmCadCotIntegrFundoFDC.dblTipoCotaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  //Al_10
  if ((Trim(dblInvest.Text) <> '') and (Trim(dblTipoCota.Text) <> '')) then
     Sel(QryFundoInvest.FieldByName('IDFUNDOINVEST').AsInteger,
         QryTipoCota.FieldByName('IDTIPOCOTA').AsInteger, '')
  else
  begin
     OperComum.LimpaParametros(qryDetalhe);
     qryDetalhe.Open;
  end;
end;

procedure TfrmCadCotIntegrFundoFDC.dblTipoCotaExit(Sender: TObject);
begin
  inherited;
  //Al_10
  if ((Trim(dblInvest.Text) <> '') and (Trim(dblTipoCota.Text) <> '')) then
  begin
      if ((qryDetalhe.FieldByName('IDTIPOCOTA').AsInteger <>
           QryTipoCota.FieldByName('IDTIPOCOTA').AsInteger) and (qryDetalhe.State = dsBrowse)) then
          Sel(QryFundoInvest.FieldByName('IDFUNDOINVEST').AsInteger,
              QryTipoCota.FieldByName('IDTIPOCOTA').AsInteger, '');
  end
  else
  begin
     OperComum.LimpaParametros(qryDetalhe);
     qryDetalhe.Open;
  end;
end;

//Al_7
procedure TfrmCadCotIntegrFundoFDC.dbgrdDetDblClick(Sender: TObject);
begin
  inherited;
   sbtnAltDetClick(Sender);
end;

//AL_12
procedure TfrmCadCotIntegrFundoFDC.FormCreate(Sender: TObject);
begin
  inherited;
   MontaSelect.Filtro.Add('TIPOFUNDOINVEST.IDTIPOINVEST = ' + IntToStr(iTipoInvestUsu));
end;

end.
