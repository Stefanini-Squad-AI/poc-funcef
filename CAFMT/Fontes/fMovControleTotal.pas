unit fMovControleTotal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, TREdit, Db, DBTables,
  Wwquery, MontaSelect, Mask, wwdbedit, Wwdatsrc, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TfrmMovControleTotal = class(TfrmOkCancelar)
    pnlMestre: TPanel;
    Data: TLabel;
    edData: TCMDateTimePicker;
    spdPesquisa: TBitBtn;
    PnlDetalhe: TPanel;
    edMemDescBem: TMemo;
    Label22: TLabel;
    edPlaca: TEdit;
    Label26: TLabel;
    Label1: TLabel;
    edConjunto: TEdit;
    Label10: TLabel;
    edDataIniDep: TCMDateTimePicker;
    SubConta: TLabel;
    cmbSubConta: TwwDBLookupCombo;
    Label8: TLabel;
    edValorAquis: TRealEdit;
    cmbAtivProjeto: TwwDBLookupCombo;
    Label2: TLabel;
    qrySubConta: TwwQuery;
    qrySubContaCODSUBCONTA: TFloatField;
    qrySubContaNOMESUBCONTA: TStringField;
    qrySelBem: TwwQuery;
    qryAtivProjeto: TwwQuery;
    qryAtivProjetoNOME: TStringField;
    qryAtivProjetoUNECODIGO: TStringField;
    qryAtivProjetoUNIDNEGOC: TFloatField;
    qryAtivProjetoIDPESSOA: TFloatField;
    qryPlaca: TwwQuery;
    qryPlacaIDBEM: TFloatField;
    qrySelBemIDPESSOA: TFloatField;
    qrySelBemIDBEM: TFloatField;
    qrySelBemIDCONJUNTO: TFloatField;
    qrySelBemPLACA: TFloatField;
    qrySelBemNOME: TStringField;
    qrySelBemDESCCONJUNTO: TStringField;
    qrySelBemDESBEM: TStringField;
    qrySelBemDESCLOCALIZACAO: TStringField;
    qrySelBemNOMERESPONSAVEL: TStringField;
    qrySelBemDESCCLASSE: TStringField;
    qrySelBemDTAINCLUSAO: TDateTimeField;
    qrySelBemVALORG: TFloatField;
    qrySelBemDATAINICIODEP: TDateTimeField;
    qrySelBemUNIDNEGOC: TFloatField;
    qrySelBemCODSUBCONTA: TFloatField;
    dsSelBem: TwwDataSource;
    dbeLocal: TwwDBEdit;
    dbeResp: TwwDBEdit;
    Label7: TLabel;
    Label17: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure edDataExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure spdPesquisaClick(Sender: TObject);
    procedure edPlacaEnter(Sender: TObject);
    procedure edPlacaExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure LimpaCampos;
    { Public declarations }
  end;

var
  frmMovControleTotal: TfrmMovControleTotal;

implementation

uses uAutorizacao, uSistema, uMensErro, uAtivoFixo, dAtivoFixo;

{$R *.DFM}

procedure TfrmMovControleTotal.FormCreate(Sender: TObject);
begin
   Screen.Cursor := crHourGlass;
   inherited;
   Screen.Cursor := crHourGlass;
   //-------------------------------------------------------------------------------------
   qrySelBem.Prepare;
   qryAtivProjeto.Prepare;
   qrySubConta.Prepare;
   qryPlaca.Prepare;
   //-------------------------------------------------------------------------------------
   qryAtivProjeto.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
   qryAtivProjeto.Open;
   qrySubConta.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
   qrySubConta.Open;
   //-------------------------------------------------------------------------------------
   edData.Date := date();
   Screen.Cursor := crDefault;
end;

Procedure TfrmMovControleTotal.LimpaCampos;
begin
   pnlDetalhe.Enabled  := False;
   edPlaca.Text        := '';
   edMemDescBem.Text   := '';
   edConjunto.Text     := '';
   edDataIniDep.Text   := '';
   edValorAquis.Text   := '';
   cmbAtivProjeto.Text := '';
   cmbSubConta.Text    := '';
end;

procedure TfrmMovControleTotal.edDataExit(Sender: TObject);
begin
   inherited;
   if (bbtnCancelar.Focused) or (bbtnSair.Focused) then
      exit;
   //-------------------------------------------------------------------------------------
   if edData.Text = '' then
   begin
      MsgDlg('Preencha o campo Data','Erro',mtError,[mbOk],0);
      edData.SetFocus;
   end;
end;

procedure TfrmMovControleTotal.FormKeyPress(Sender: TObject; var Key: Char);
begin
   inherited;
   if key = #13 then
   begin
      key := #0;
      Perform(Wm_NextDlgCtl, 0, 0);
   end;
end;

procedure TfrmMovControleTotal.spdPesquisaClick(Sender: TObject);
begin
   inherited;
   LimpaCampos;
   dtmAtivoFixo.MSBem.Executar;
   //-------------------------------------------------------------------------------------
   frmMovControleTotal.Invalidate;
   frmMovControleTotal.Repaint;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if dtmAtivoFixo.MSBem.RetornouValor then
   begin
      qrySelBem.Close;
      qrySelBem.ParamByName('PIDPESSOA').AsInteger := StrToInt(dtmAtivoFixo.MSBem.ValoresChave[0]);
      qrySelBem.ParamByName('PIDBEM').AsInteger    := StrToInt(dtmAtivoFixo.MSBem.ValoresChave[1]);
      qrySelBem.Open;
      if qrySelBem.IsEmpty then
      begin
         MsgDlg('Bem já baixado ou com controle total.','Erro',mtError,[mbOk],0);
         LimpaCampos;
         edData.SetFocus;
      end else
      begin
         edPlaca.Text               := qrySelBemPLACA.AsString;
         edMemDescBem.Text          := qrySelBemDESBEM.AsString;
         edConjunto.Text            := qrySelBemDESCCONJUNTO.AsString;
         edDataIniDep.Text          := edData.Text;
         edValorAquis.Value         := qrySelBemVALORG.AsCurrency;
         cmbSubConta.LookupValue    := floattoStr(qrySelBemCODSUBCONTA.AsFloat);
         cmbAtivProjeto.LookupValue := floattoStr(qrySelBemUNIDNEGOC.AsFloat);
         pnlDetalhe.Enabled  := True;
         edDataIniDep.SetFocus;
      end;
   end else
   begin
      LimpaCampos;
      edData.SetFocus;
   end;
end;

procedure TfrmMovControleTotal.edPlacaEnter(Sender: TObject);
begin
   inherited;
   LimpaCampos;
end;

procedure TfrmMovControleTotal.edPlacaExit(Sender: TObject);
begin
   inherited;
   if edPlaca.Text <> '' then
   begin
      qryPlaca.Close;
      qryPlaca.ParamByName('PPLACA').AsFloat := StrToFloat(edPlaca.Text);
      qryPlaca.Open;
      if not qryPlaca.isEmpty then
      begin
         qrySelBem.Close;
         qrySelBem.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
         qrySelBem.ParamByName('PIDBEM').AsInteger    := qryPlacaIDBEM.AsInteger;
         qrySelBem.Open;
         //-------------------------------------------------------------------------------
         if not qrySelBem.IsEmpty then
         begin
            edPlaca.Text       := qrySelBemPLACA.AsString;
            edMemDescBem.Text  := qrySelBemDESBEM.AsString;
            edConjunto.Text    := qrySelBemDESCCONJUNTO.AsString;
            //----------------------------------------------------------------------------
            edDataIniDep.Text  := edData.Text;
            edValorAquis.Value := qrySelBemVALORG.AsCurrency;
            cmbSubConta.LookupValue    := floattoStr(qrySelBemCODSUBCONTA.AsFloat);
            cmbAtivProjeto.LookupValue := floattoStr(qrySelBemUNIDNEGOC.AsFloat);
            //----------------------------------------------------------------------------
            pnlDetalhe.Enabled  := True;
            edDataIniDep.SetFocus;
         end else
         begin
            MsgDlg('Bem já está como Controle Total ou Baixado','Erro',mtError,[mbOk],0);
            LimpaCampos;
            edData.SetFocus;
         end;
      end else
      begin
         LimpaCampos;
         edData.SetFocus;
      end;
   end;
end;

procedure TfrmMovControleTotal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qrySelBem.Close;
   qryAtivProjeto.Close;
   qrySubConta.Close;
   qryPlaca.Close;
   //-------------------------------------------------------------------------------------
   qrySelBem.UnPrepare;
   qryAtivProjeto.UnPrepare;
   qrySubConta.UnPrepare;
   qryPlaca.UnPrepare;
end;

procedure TfrmMovControleTotal.bbtnConfirmarClick(Sender: TObject);
var
   iResult,iSubConta,iAtivProjeto : Integer;

begin
   inherited;
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
   //-------------------------------------------------------------------------------------
   if edData.Text = '' then
   begin
      MsgDlg('Data de Movimentação não pode estar vazia! ','Erro',mtError,[mbOk],0);
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
      edData.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if edDataIniDep.Text = '' then
   begin
      MsgDlg('Data de Inicio da Depreciação não pode estar vazia! ','Erro',mtError,[mbOk],0);
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
      edDataIniDep.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if edValorAquis.Value = 0 then
   begin
      MsgDlg('Forneça o valor de aquisição do bem! ','Erro',mtError,[mbOk],0);
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
      edDataIniDep.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if cmbSubConta.Text = '' then
      iSubConta := 0
   else
      iSubConta := qrySubContaCODSUBCONTA.asInteger;
   //-------------------------------------------------------------------------------------
   if cmbAtivProjeto.Text = '' then
      iAtivProjeto := 0
   else
      iAtivProjeto := qryAtivProjetoUNIDNEGOC.asInteger;
   //-------------------------------------------------------------------------------------
   iResult := AtivoFixo.ExecutaEntradaTotal(7, Sistema.IdEmpresa,
                                            qrySelBemIDBEM.asInteger,
                                            edDataIniDep.Date, edValorAquis.Value,
                                            iSubConta,
                                            iAtivProjeto,
                                            True);
   //-------------------------------------------------------------------------------------
   if iResult >= 0 then
   begin
      MsgDlg('Movimentação Realizada!','Atenção',mtInformation,[mbOk],0);
   end else
   begin
      MsgDlg('Movimentação não Realizada!','Erro',mtError,[mbOk],0);
   end;
   //-------------------------------------------------------------------------------------
   LimpaCampos;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
   edData.SetFocus;
end;

procedure TfrmMovControleTotal.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   LimpaCampos;
   edData.SetFocus;
end;

end.
