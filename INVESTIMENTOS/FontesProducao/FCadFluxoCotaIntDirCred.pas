//******************************************************************************
//Data	    : 29/06/2004
//Query     : qryDetalhe
//Motivo(S) : Passado o Active da qry para 'False'
//******************************************************************************
// Data	    : 20/05/2004
// Origem   : CM
// Motivo(S): Acertos em diversos controles
//******************************************************************************
//Data	    : 08/04/2004
//Função    : Fluxo de Cotas para Fundos de Direito Creditórios
//******************************************************************************

unit FCadFluxoCotaIntDirCred;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroRMDetCSInv, CmEventosCadastro, ImgList, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr,
  fcLabel, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, TabControlDetalhe, ExtCtrls, TREdit, wwdbdatetimepicker,
  CMDateTimePicker, wwdblook;

type
  TfrmCadFluxoCotaIntDirCred = class(TfrmCadastroRMDetInv)
    Investimento: TLabel;
    Label1: TLabel;
    dblInvest: TwwDBLookupCombo;
    Label2: TLabel;
    Label3: TLabel;
    dbdDta: TCMDateTimePicker;
    dbreQtdCotas: TDBRealEdit;
    QryTipoCota: TwwQuery;
    dblTipoCota: TwwDBLookupCombo;
    Label4: TLabel;
    QryFundoInvest: TwwQuery;
    QryFundoInvestDESCFUNDOINVEST: TStringField;
    QryFundoInvestIDFUNDOINVEST: TFloatField;
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
    QryTipoCotaIDTIPOCOTA: TFloatField;
    QryTipoCotaDESCTIPOCOTA: TStringField;
    qryDetalheIDCOTAINTEGRALIZA: TFloatField;
    qryDetalheIDFUNDOINVEST: TFloatField;
    qryDetalheDATAINTEGRALIZAR: TDateTimeField;
    qryDetalheQTDINTEGRALIZAR: TFloatField;
    qryDetalheIDTIPOCOTA: TFloatField;
    qryVerificaDados: TwwQuery;
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
    procedure dblTipoCotaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblTipoCotaExit(Sender: TObject);
  private
    { Private declarations }
    procedure Sel(idFundo, idTipoCota : Largeint; strData: String);
    procedure HabBtDet;
    function VerificaCampos: Boolean;
  public
    { Public declarations }
  end;

var
  frmCadFluxoCotaIntDirCred: TfrmCadFluxoCotaIntDirCred;

implementation

uses UDataBase, uMensErro,UDiasUteisInv, UFundoComum, UBibliotecaInvest,
     UOperComum;

{$R *.DFM}

procedure TfrmCadFluxoCotaIntDirCred.Sel(idFundo, idTipoCota : Largeint; strData: String);
begin
   OperComum.LimpaParametros(qryDetalhe);
   qryDetalhe.ParamByName('IDFUNDOINVEST').AsInteger := idFundo;
   qryDetalhe.ParamByName('IDTIPOCOTA').AsInteger    := idTipoCota;
   if Trim(strData) <> '' then
      qryDetalhe.ParamByName('DATAINTEGRALIZAR').AsString    := strData;
   qryDetalhe.Open;
   HabBtDet;
end;

procedure TfrmCadFluxoCotaIntDirCred.FormShow(Sender: TObject);
begin
   inherited;
   QryFundoInvest.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
   QryFundoInvest.Open;
   QryTipoCota.Open;
   Sel(-1,-1,'');
end;

procedure TfrmCadFluxoCotaIntDirCred.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   inherited;
   QryFundoInvest.Close;
   qryDetalhe.Close;
   pnlMestre.Enabled := True;
end;

procedure TfrmCadFluxoCotaIntDirCred.sbtnProcurarClick(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
   begin
      Sel(StrToInt(MontaSelect.ValoresChave[0]), StrToInt(MontaSelect.ValoresChave[1]),
          MontaSelect.ValoresChave[2]);
      dblInvest.LookupValue := MontaSelect.ValoresChave[0];
      dblTipoCota.LookupValue := MontaSelect.ValoresChave[1];
   end;
   pnlFundo.Enabled := True;
   pnlMestre.Enabled := True;
   tbcDetalhe.Enabled := True;
   pgctrlDetalhe.Enabled := True;

   HabBtDet;
   if dblInvest.CanFocus then
      dblInvest.SetFocus;
end;

procedure TfrmCadFluxoCotaIntDirCred.sbtnExcluiDetClick(Sender: TObject);
begin
   if (MsgDlg('Deseja realmente excluir esta Cota?', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) then
   begin
      if (not qryDetalhe.IsEmpty) then
      begin
         inherited;
         AplicaAlteracoes([qryDetalhe]);
      end;
   end;
   HabBtDet;
end;

procedure TfrmCadFluxoCotaIntDirCred.HabBtDet;
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


procedure TfrmCadFluxoCotaIntDirCred.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  HabBtDet;
end;

procedure TfrmCadFluxoCotaIntDirCred.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  HabBtDet;
end;

procedure TfrmCadFluxoCotaIntDirCred.dblInvestCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   if (Trim(dblInvest.Text) <> '') and (Trim(dblTipoCota.Text) <> '') then
      Sel(StrToInt(dblInvest.lookupvalue),StrToInt(dblTipoCota.lookupvalue),'');
end;

procedure TfrmCadFluxoCotaIntDirCred.dblInvestExit(Sender: TObject);
begin
   inherited;
   if (Trim(dblInvest.Text) <> '') and (Trim(dblTipoCota.Text) <> '') then
      if (qryDetalheIDFUNDOINVEST.AsInteger <> QryFundoInvestIDFUNDOINVEST.AsInteger) and
         (qryDetalhe.State = dsBrowse) then
          Sel(StrToInt(dblInvest.lookupvalue),StrToInt(dblTipoCota.lookupvalue),'');
end;

procedure TfrmCadFluxoCotaIntDirCred.FormPaint(Sender: TObject);
begin
   inherited;
   pnlMestre.Enabled := True;
end;

procedure TfrmCadFluxoCotaIntDirCred.bbtnOkDetClick(Sender: TObject);
begin
   if not VerificaCampos then
      exit;

   if dsDet.DataSet.State in [dsInsert] then
   begin
      qryDetalhe.FieldByName('IDCOTAINTEGRALIZA').AsInteger := LeUltRegistro(nil,'COTAINTEGRALIZA');
      qryDetalheIDFUNDOINVEST.AsString      := dblInvest.LookupValue;
      qryDetalheIDTIPOCOTA.AsString         := dblTipoCota.LookupValue;
      qryDetalheDATAINTEGRALIZAR.AsString   := DateToStr(dbdDta.DateTime);
      qryDetalheQTDINTEGRALIZAR.AsFloat     := dbreQtdCotas.Value;
   end;

   CmeDetalhe.RepetirInsert := False;
   inherited;
   AplicaAlteracoes([qryDetalhe]);
   Sel(StrToInt(dblInvest.LookupValue), StrToInt(dblTipoCota.LookupValue), '');
   HabBtDet;
end;

function TfrmCadFluxoCotaIntDirCred.VerificaCampos: Boolean;
begin
   Result := False;
   if dsDet.DataSet.State in [dsInsert] then
   begin
      OperComum.LimpaParametros(qryVerificaDados);
      with qryVerificaDados do
      begin
         ParamByName('IDTIPOCOTA').AsInteger      := StrToInt(dblTipoCota.LookupValue);
         ParamByName('DATAINTEGRALIZAR').AsString := DateToStr(dbdDta.DateTime);
         ParamByName('IDFUNDOINVEST').AsInteger   := StrToInt(dblInvest.LookupValue);
         Open;
         if not IsEmpty then
         begin
            MsgDlg('Já existe Informações para esta data.','Mensagem do Sistema',mtWarning,[MbOk],0);
            if dbdDta.CanFocus then
               dbdDta.SetFocus;
            Close;
            Exit;
         end;
      end;
   end;
   if Trim(dblInvest.Text) = '' then
   begin
      MsgDlg('Fundo não Selecionado','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dblInvest.CanFocus then
         dblInvest.SetFocus;
      Exit;
   end;

   if Trim(dblTipoCota.Text) = '' then
   begin
      MsgDlg('Tipo de Cota não Selecionado','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dblTipoCota.CanFocus then
         dblTipoCota.SetFocus;
      Exit;
   end;

   if Trim(dbdDta.Text) = '' then
   begin
      MsgDlg('Data não Selecionada','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dbdDta.CanFocus then
         dbdDta.SetFocus;
      Exit;
   end;

   if dbreQtdCotas.Value = 0 then
   begin
      MsgDlg('Quantidade de Cotas não Informado','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dbreQtdCotas.CanFocus then
         dbreQtdCotas.SetFocus;
      Exit;
   end;
   Result := True;
end;

procedure TfrmCadFluxoCotaIntDirCred.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
   if dbdDta.CanFocus then
      dbdDta.SetFocus;
end;

procedure TfrmCadFluxoCotaIntDirCred.sbtnAltDetClick(Sender: TObject);
begin
   inherited;
   if dbreQtdCotas.CanFocus then
      dbreQtdCotas.SetFocus;
end;

procedure TfrmCadFluxoCotaIntDirCred.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if dsDet.State = dsEdit then
     dbdDta.Enabled := False
  else
     dbdDta.Enabled := True;
end;

procedure TfrmCadFluxoCotaIntDirCred.dblTipoCotaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   if (Trim(dblInvest.Text) <> '') and (Trim(dblTipoCota.Text) <> '') then
      Sel(StrToInt(dblInvest.lookupvalue),StrToInt(dblTipoCota.lookupvalue),'');
end;

procedure TfrmCadFluxoCotaIntDirCred.dblTipoCotaExit(Sender: TObject);
begin
  inherited;
   if (Trim(dblInvest.Text) <> '') and (Trim(dblTipoCota.Text) <> '') then
      if (qryDetalheIDTIPOCOTA.AsInteger <> QryTipoCotaIDTIPOCOTA.AsInteger) and
         (qryDetalhe.State = dsBrowse) then
          Sel(StrToInt(dblInvest.lookupvalue),StrToInt(dblTipoCota.lookupvalue),'');
end;

end.
