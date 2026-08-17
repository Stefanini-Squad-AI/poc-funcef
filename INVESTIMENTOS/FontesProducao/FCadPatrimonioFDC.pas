//******************************************************************************
// Data	    : 20/05/2004
// Origem   : CM
// Motivo(S): Acerto na Herança e acertos em diversos controles
//******************************************************************************
// Data	    : 12/04/2004
// Origem   : CM
// Motivo(S): Ajuste no lay-out da tela
//*******************************************************************************
//Data	    : 08/04/2004
//Função    : Quantidade de Cotas Emissão para Fundos de Direito Creditórios
//*******************************************************************************

unit FCadPatrimonioFDC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroRMDetCSInv, CmEventosCadastro, ImgList, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr,
  fcLabel, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, TabControlDetalhe, ExtCtrls, wwdblook, TREdit,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmCadPatrimonioFDC = class(TfrmCadastroRMDetInv)
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
    QryTipoCota: TwwQuery;
    QryTipoCotaIDTIPOCOTA: TFloatField;
    QryTipoCotaDESCTIPOCOTA: TStringField;
    Label1: TLabel;
    dblInvest: TwwDBLookupCombo;
    Label4: TLabel;
    dblTipoCota: TwwDBLookupCombo;
    Label2: TLabel;
    dbdDta: TCMDateTimePicker;
    Label5: TLabel;
    dbreQtdCotas: TDBRealEdit;
    Label3: TLabel;
    dbreValorPatrimonio: TDBRealEdit;
    qryDetalheIDPATRIMONIOFDO: TFloatField;
    qryDetalheIDFUNDOINVEST: TFloatField;
    qryDetalheDATAREFERENCIA: TDateTimeField;
    qryDetalheQTDCOTAS: TFloatField;
    qryDetalheVLRPATRIMONIO: TFloatField;
    qryDetalheIDTIPOCOTA: TFloatField;
    qryVerificaDados: TwwQuery;
    qryVerificaDadosDATAREFERENCIA: TDateTimeField;
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
    procedure dsDetStateChange(Sender: TObject);
    procedure dblTipoCotaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblTipoCotaExit(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
  private
    { Private declarations }
    procedure Sel(idFundo, idTipoCota : Largeint; strData: String);
    procedure HabBtDet;
    function  VerificaCampos: Boolean;
    
  public
    { Public declarations }
  end;

var
  frmCadPatrimonioFDC: TfrmCadPatrimonioFDC;

implementation

uses UDataBase, uMensErro,UDiasUteisInv, UFundoComum, UBibliotecaInvest,
     UOperComum;

{$R *.DFM}

procedure TfrmCadPatrimonioFDC.FormShow(Sender: TObject);
begin
  inherited;
   QryFundoInvest.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
   QryFundoInvest.Open;
   QryTipoCota.Open;
   Sel(-1,-1,'');
end;

procedure TfrmCadPatrimonioFDC.Sel(idFundo, idTipoCota : Largeint; strData: String);
begin
   OperComum.LimpaParametros(qryDetalhe);
   qryDetalhe.ParamByName('IDFUNDOINVEST').AsInteger := idFundo;
   qryDetalhe.ParamByName('IDTIPOCOTA').AsInteger    := idTipoCota;
   if Trim(strData) <> '' then
      qryDetalhe.ParamByName('DATAREFERENCIA').AsString    := strData;
   qryDetalhe.Open;
   HabBtDet;
end;

procedure TfrmCadPatrimonioFDC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   QryFundoInvest.Close;
   qryDetalhe.Close;
   pnlMestre.Enabled := True;
end;

procedure TfrmCadPatrimonioFDC.HabBtDet;
begin
  if Trim(dblInvest.Text) = '' then
  begin
     sbtnInsDet.Enabled := False;
     sbtnAltDet.Enabled := False;
     sbtnExcluiDet.Enabled := False;
  end
  else
  begin
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


procedure TfrmCadPatrimonioFDC.sbtnProcurarClick(Sender: TObject);
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

procedure TfrmCadPatrimonioFDC.sbtnExcluiDetClick(Sender: TObject);
begin
   if (MsgDlg('Deseja realmente excluir o registro ?', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) then
   begin
      if (not qryDetalhe.IsEmpty) then
      begin
         inherited;
         AplicaAlteracoes([qryDetalhe]);
      end;
   end;
   HabBtDet;
end;

procedure TfrmCadPatrimonioFDC.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  HabBtDet;
end;

procedure TfrmCadPatrimonioFDC.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  HabBtDet;
end;

procedure TfrmCadPatrimonioFDC.dblInvestCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   if (Trim(dblInvest.Text) <> '') and (Trim(dblTipoCota.Text) <> '') then
      Sel(StrToInt(dblInvest.lookupvalue),StrToInt(dblTipoCota.lookupvalue),'');
end;

procedure TfrmCadPatrimonioFDC.dblInvestExit(Sender: TObject);
begin
  inherited;
   if (Trim(dblInvest.Text) <> '') and (Trim(dblTipoCota.Text) <> '') then
      if (qryDetalheIDFUNDOINVEST.AsInteger <> QryFundoInvestIDFUNDOINVEST.AsInteger) and
         (qryDetalhe.State = dsBrowse) then
          Sel(StrToInt(dblInvest.lookupvalue),StrToInt(dblTipoCota.lookupvalue),'');
end;

procedure TfrmCadPatrimonioFDC.FormPaint(Sender: TObject);
begin
  inherited;
   pnlMestre.Enabled := True;
end;

procedure TfrmCadPatrimonioFDC.bbtnOkDetClick(Sender: TObject);
begin
   if not VerificaCampos then
      exit;

   if dsDet.DataSet.State in [dsInsert] then
   begin
      qryDetalhe.FieldByName('IDPATRIMONIOFDO').AsInteger := LeUltRegistro(nil,'PATRIMONIOFUNDO');
      qryDetalheIDFUNDOINVEST.AsString  := dblInvest.LookupValue;
      qryDetalheIDTIPOCOTA.AsString     := dblTipoCota.LookupValue;
      qryDetalheDATAREFERENCIA.AsString := DateToStr(dbdDta.DateTime);
      qryDetalheVLRPATRIMONIO.AsFloat   := dbreValorPatrimonio.Value;
      qryDetalheQTDCOTAS.AsFloat        := dbreQtdCotas.Value;
   end;

   CmeDetalhe.RepetirInsert := False;
   inherited;
   AplicaAlteracoes([qryDetalhe]);
   Sel(StrToInt(dblInvest.LookupValue), StrToInt(dblTipoCota.LookupValue), '');
   HabBtDet;
end;

function TfrmCadPatrimonioFDC.VerificaCampos: Boolean;
begin
   Result := False;

   if dsDet.DataSet.State in [dsInsert] then
   begin
      OperComum.LimpaParametros(qryVerificaDados);
      with qryVerificaDados do
      begin
         ParamByName('IDTIPOCOTA').AsInteger    := StrToInt(dblTipoCota.LookupValue);
         ParamByName('DATAREFERENCIA').AsString := DateToStr(dbdDta.DateTime);
         ParamByName('IDFUNDOINVEST').AsInteger := StrToInt(dblInvest.LookupValue);
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
      MsgDlg('Fundo não Selecionado.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dblInvest.CanFocus then
         dblInvest.SetFocus;
      Exit;
   end;

   if Trim(dblTipoCota.Text) = '' then
   begin
      MsgDlg('Tipo de Cota não Selecionada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dblTipoCota.CanFocus then
         dblTipoCota.SetFocus;
      Exit;
   end;

   if Trim(dbdDta.Text) = '' then
   begin
      MsgDlg('Data não Selecionada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dbdDta.CanFocus then
         dbdDta.SetFocus;
      Exit;
   end;

   if dbreValorPatrimonio.Value = 0 then
   begin
      MsgDlg('O Valor do Patrimônio não foi Informado.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dbreValorPatrimonio.CanFocus then
         dbreValorPatrimonio.SetFocus;
      Exit;
   end;

   if dbreQtdCotas.Value = 0 then
   begin
      MsgDlg('Quantidade de Cotas não foi Informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dbreQtdCotas.CanFocus then
         dbreQtdCotas.SetFocus;
      Exit;
   end;
   Result := True;
end;

procedure TfrmCadPatrimonioFDC.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if dsDet.State = dsEdit then
     dbdDta.Enabled := False
  else
     dbdDta.Enabled := True;
end;

procedure TfrmCadPatrimonioFDC.dblTipoCotaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   if (Trim(dblInvest.Text) <> '') and (Trim(dblTipoCota.Text) <> '') then
      Sel(StrToInt(dblInvest.lookupvalue),StrToInt(dblTipoCota.lookupvalue),'');
end;

procedure TfrmCadPatrimonioFDC.dblTipoCotaExit(Sender: TObject);
begin
  inherited;
   if (Trim(dblInvest.Text) <> '') and (Trim(dblTipoCota.Text) <> '') then
      if (qryDetalheIDTIPOCOTA.AsInteger <> QryTipoCotaIDTIPOCOTA.AsInteger) and
         (qryDetalhe.State = dsBrowse) then
          Sel(StrToInt(dblInvest.lookupvalue),StrToInt(dblTipoCota.lookupvalue),'');
end;

procedure TfrmCadPatrimonioFDC.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
   if dbdDta.CanFocus then
      dbdDta.SetFocus;
end;

procedure TfrmCadPatrimonioFDC.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
   if dbreValorPatrimonio.CanFocus then
      dbreValorPatrimonio.SetFocus;
end;

end.
