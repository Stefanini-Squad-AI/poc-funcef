unit fMovAcrescimo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, TREdit, MontaSelect, Db,
  DBTables, Wwquery, wwdblook, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmMovAcrescimo = class(TfrmOkCancelar)
    qryPlaca: TwwQuery;
    qryPlacaIDBEM: TFloatField;
    qrySelBem: TwwQuery;
    pnlMestre: TPanel;
    Data: TLabel;
    Label22: TLabel;
    Label26: TLabel;
    Label1: TLabel;
    Label7: TLabel;
    Label17: TLabel;
    edData: TCMDateTimePicker;
    spdPesquisa: TBitBtn;
    edMemDescBem: TMemo;
    edConjunto: TEdit;
    edPlaca: TEdit;
    edLocAtual: TEdit;
    edRespAtual: TEdit;
    PnlDetalhe: TPanel;
    qryTipoDespesa: TwwQuery;
    qryTipoDespesaDESTIPODESPESA: TStringField;
    qryTipoDespesaIDTIPODESPESA: TFloatField;
    Label46: TLabel;
    cmbTipoDespesa: TwwDBLookupCombo;
    Label15: TLabel;
    edValAcres: TRealEdit;
    Label25: TLabel;
    edObsAcres: TEdit;
    qrySelBemIDPESSOA: TFloatField;
    qrySelBemIDBEM: TFloatField;
    qrySelBemIDCONJUNTO: TFloatField;
    qrySelBemPLACA: TFloatField;
    qrySelBemDESCCONJUNTO: TStringField;
    qrySelBemDESBEM: TStringField;
    qrySelBemDESCLOCALIZACAO: TStringField;
    qrySelBemNOMERESPONSAVEL: TStringField;
    qrySelBemTAXADEP: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure edDataExit(Sender: TObject);
    procedure spdPesquisaClick(Sender: TObject);
    procedure edPlacaEnter(Sender: TObject);
    procedure edPlacaExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LimpaCampos;
  end;

var
  frmMovAcrescimo: TfrmMovAcrescimo;

implementation

uses uAutorizacao, uSistema,  uAtivoFixo, uMensErro, dAtivoFixo;

{$R *.DFM}

procedure TfrmMovAcrescimo.FormCreate(Sender: TObject);
begin
   Screen.Cursor := crHourGlass;
   inherited;
   Screen.Cursor := crHourGlass;
   //-------------------------------------------------------------------------------------
   qrySelBem.Prepare;
   qryPlaca.Prepare;
   qryTipoDespesa.Prepare;
   qryTipoDespesa.Open;
   //-------------------------------------------------------------------------------------
   edData.Date := date();
   Screen.Cursor := crDefault;
end;

procedure TfrmMovAcrescimo.LimpaCampos;
begin
   edPlaca.Text        := '';
   edMemDescBem.Text   := '';
   edConjunto.Text     := '';
   edLocAtual.Text     := '';
   edRespAtual.Text    := '';
   //-------------------------------------------------------------------------------------
   cmbTipoDespesa.Text := '';
   edValAcres.Value    := 0;
   edObsAcres.Text     := '';
   //-------------------------------------------------------------------------------------
   pnlDetalhe.Enabled  := False;
end;

procedure TfrmMovAcrescimo.edDataExit(Sender: TObject);
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

procedure TfrmMovAcrescimo.spdPesquisaClick(Sender: TObject);
begin
   inherited;
   LimpaCampos;
   dtmAtivoFixo.MSBem.Executar;
   //-------------------------------------------------------------------------------------
   frmMovAcrescimo.Invalidate;
   frmMovAcrescimo.Repaint;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if dtmAtivoFixo.MSBem.RetornouValor then
   begin
      qrySelBem.Close;
      qrySelBem.ParamByName('PIDPESSOA').AsInteger := StrToInt(dtmAtivoFixo.MSBem.ValoresChave[0]);
      qrySelBem.ParamByName('PIDBEM').AsInteger    := StrToInt(dtmAtivoFixo.MSBem.ValoresChave[1]);
      qrySelBem.Open;
      //----------------------------------------------------------------------------------
      if qrySelBem.IsEmpty then
      begin
         MsgDlg('Bem sobre controle físico ou baixado.','Erro',mtError,[mbOk],0);
         LimpaCampos;
         edData.SetFocus;
      end else
      begin
         edPlaca.Text       := qrySelBemPLACA.AsString;
         edMemDescBem.Text  := qrySelBemDESBEM.AsString;
         edConjunto.Text    := qrySelBemDESCCONJUNTO.AsString;
         edLocAtual.Text    := qrySelBemDESCLOCALIZACAO.AsString;
         edRespAtual.Text   := qrySelBemNOMERESPONSAVEL.AsString;
         //----------------------------------------------------------------------------------
         pnlDetalhe.Enabled  := True;
         cmbTipoDespesa.SetFocus;
      end;   
   end else
   begin
      LimpaCampos;
      edData.SetFocus;
   end;
end;

procedure TfrmMovAcrescimo.edPlacaEnter(Sender: TObject);
begin
   inherited;
   LimpaCampos;
end;

procedure TfrmMovAcrescimo.edPlacaExit(Sender: TObject);
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
            edLocAtual.Text    := qrySelBemDESCLOCALIZACAO.AsString;
            edRespAtual.Text   := qrySelBemNOMERESPONSAVEL.AsString;
            //----------------------------------------------------------------------------
            pnlDetalhe.Enabled  := True;
            cmbTipoDespesa.SetFocus;
         end else
         begin
            MsgDlg('Bem já totalmente Baixado ou com Controle Físico','Erro',mtError,[mbOk],0);
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

procedure TfrmMovAcrescimo.bbtnConfirmarClick(Sender: TObject);
var
   iResult  : Integer;
   fTaxaDep : Double;

begin
   inherited;
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
   //-------------------------------------------------------------------------------------
   // Criticas aos campos detalhe
   //-------------------------------------------------------------------------------------
   if edData.Text = '' then
   begin
      MsgDlg('Data da Movimentação não pode estar vazia! ','Erro',mtError,[mbOk],0);
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
      edData.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if edPlaca.Text = '' then
   begin
      MsgDlg('Selecione um bem! ','Erro',mtError,[mbOk],0);
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
      edData.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if cmbTipoDespesa.Text = '' then
   begin
      MsgDlg('Selecione o Tipo de Despesa que gerou o Acréscimo de Valor! ','Erro',mtError,[mbOk],0);
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
      cmbTipoDespesa.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if edValAcres.Value <= 0 then
   begin
      MsgDlg('Informe o Valor do Acréscimo de Valor! ','Erro',mtError,[mbOk],0);
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
      cmbTipoDespesa.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if edObsAcres.Text = '' then
   begin
      MsgDlg('Informe os detalhes relevantes do Acréscimo de Valor! ','Erro',mtError,[mbOk],0);
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
      cmbTipoDespesa.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   fTaxaDep := qrySelBem.FieldbyName('TAXADEP').AsFloat;
   iResult  := AtivoFixo.ExecutaAcrescimo(Sistema.IdModulo, Sistema.IdEmpresa,
                                          qrySelBem.FieldbyName('IDBEM').asInteger,
                                          edData.Date, edValAcres.Value,edObsAcres.Text,
                                          qryTipoDespesa.FieldbyName('IDTIPODESPESA').AsInteger,
                                          fTaxaDep,True);
   //-------------------------------------------------------------------------------------
   if iResult > 0 then
   begin
      MsgDlg('Movimentação Realizada!','Informação',mtInformation,[mbOk],0);
   end else
   begin
      MsgDlg('Movimentação não Realizada!' + #13 + #13 +
             'Causa : ' + AtivoFixo.MensagemErro ,
             'Erro',mtError,[mbOk],0);
   end;
   //-------------------------------------------------------------------------------------
   LimpaCampos;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
   edData.SetFocus;
end;

procedure TfrmMovAcrescimo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qrySelBem.Close;
   qryPlaca.Close;
   qryTipoDespesa.Close;
   //-------------------------------------------------------------------------------------
   qrySelBem.UnPrepare;
   qryPlaca.UnPrepare;
   qryTipoDespesa.Close;
end;

procedure TfrmMovAcrescimo.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   LimpaCampos;
   edData.SetFocus;
end;

procedure TfrmMovAcrescimo.FormShow(Sender: TObject);
begin
   inherited;
   tb97OkCancelar.DockPos := Dock971.Width - 168 - 170 - 50;
   tb97Fundo.DockPos      := Dock971.Width - 170 - 40;
end;

end.
