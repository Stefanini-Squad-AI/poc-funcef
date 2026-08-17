unit fMovReavaliacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, Db, DBTables, Wwquery,
  TREdit, TEdNum, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmMovReavaliacao = class(TfrmOkCancelar)
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
    edPlaca: TEdit;
    edLocAtual: TEdit;
    edRespAtual: TEdit;
    PnlDetalhe: TPanel;
    edConjunto: TEdit;
    Label30: TLabel;
    edVidaUtil: TEditNum;
    Label9: TLabel;
    Label28: TLabel;
    edValLaudo: TRealEdit;
    Label48: TLabel;
    edObsReav: TMemo;
    qrySelBemIDPESSOA: TFloatField;
    qrySelBemIDBEM: TFloatField;
    qrySelBemIDCONJUNTO: TFloatField;
    qrySelBemPLACA: TFloatField;
    qrySelBemDESCCONJUNTO: TStringField;
    qrySelBemDESBEM: TStringField;
    qrySelBemDESCLOCALIZACAO: TStringField;
    qrySelBemNOMERESPONSAVEL: TStringField;
    qrySelBemDATAINICIODEP: TDateTimeField;
    qrySelBemDATAULTDEP: TDateTimeField;
    qrySelBemTAXADEP: TFloatField;
    rdgDepProRata: TRadioGroup;
    qryUltReav: TwwQuery;
    qryUltReavTAXADEP: TFloatField;
    qryUltReavDATAULTDEP: TDateTimeField;
    qryUltReavDATAREAVALIACAO: TDateTimeField;
    procedure FormCreate(Sender: TObject);
    procedure edDataExit(Sender: TObject);
    procedure spdPesquisaClick(Sender: TObject);
    procedure edPlacaEnter(Sender: TObject);
    procedure edPlacaExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LimpaCampos;
    function  VidaUtilRestante : String;
  end;

var
  frmMovReavaliacao: TfrmMovReavaliacao;

implementation

uses uAutorizacao, uSistema,  uAtivoFixo, uMensErro, dAtivoFixo;

{$R *.DFM}

procedure TfrmMovReavaliacao.FormCreate(Sender: TObject);
begin
   Screen.Cursor := crHourGlass;
   inherited;
   Screen.Cursor := crHourGlass;
   //-------------------------------------------------------------------------------------
   qrySelBem.Prepare;
   qryPlaca.Prepare;
   //-------------------------------------------------------------------------------------
   edData.Date := date();
   Screen.Cursor := crDefault;
end;

procedure TfrmMovReavaliacao.LimpaCampos;
begin
   edPlaca.Text        := '';
   edMemDescBem.Text   := '';
   edConjunto.Text     := '';
   edLocAtual.Text     := '';
   edRespAtual.Text    := '';
   //-------------------------------------------------------------------------------------
   edVidaUtil.Text     := '';
   edValLaudo.Value    := 0;
   edObsReav.Text      := '';
   //-------------------------------------------------------------------------------------
   pnlDetalhe.Enabled  := False;
end;

procedure TfrmMovReavaliacao.edDataExit(Sender: TObject);
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

procedure TfrmMovReavaliacao.spdPesquisaClick(Sender: TObject);
begin
   inherited;
   LimpaCampos;
   dtmAtivoFixo.MSBem.Executar;
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
         edPlaca.Text       := qrySelBemPLACA.AsString;
         edMemDescBem.Text  := qrySelBemDESBEM.AsString;
         edConjunto.Text    := qrySelBemDESCCONJUNTO.AsString;
         edLocAtual.Text    := qrySelBemDESCLOCALIZACAO.AsString;
         edRespAtual.Text   := qrySelBemNOMERESPONSAVEL.AsString;
         //-------------------------------------------------------------------------------
         edVidaUtil.Text := VidaUtilRestante;
         //-------------------------------------------------------------------------------
         pnlDetalhe.Enabled  := True;
         edVidaUtil.SetFocus;
      end;   
   end else
   begin
      LimpaCampos;
      edData.SetFocus;
   end;
end;

procedure TfrmMovReavaliacao.edPlacaEnter(Sender: TObject);
begin
   inherited;
   LimpaCampos;
end;

procedure TfrmMovReavaliacao.edPlacaExit(Sender: TObject);
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
            edVidaUtil.Text := VidaUtilRestante;
            //----------------------------------------------------------------------------
            pnlDetalhe.Enabled  := True;
            edVidaUtil.SetFocus;
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

procedure TfrmMovReavaliacao.bbtnConfirmarClick(Sender: TObject);
var
   fDifReaval, fDifReavalImob : Double;
   iResult                    : Integer;

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
   if edVidaUtil.Text = '' then
   begin
      MsgDlg('Informe a Vida Util do Bem! ','Erro',mtError,[mbOk],0);
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
      edVidaUtil.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if (edValLaudo.Value <= 0) then
   begin
      MsgDlg('Informe o Valor do Laudo de Reavaliação! ','Erro',mtError,[mbOk],0);
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
      edVidaUtil.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if (edObsReav.Text = '') then
   begin
      MsgDlg('Informe os dados relevantes do laudo de reavaliação (Empresa, Avaliador, etc)!',
             'Erro',mtError,[mbOk],0);
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
      edVidaUtil.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   iResult := AtivoFixo.ExecutaReavaliacao(Sistema.IdModulo, Sistema.IdEmpresa,
                                           qrySelBemIDBEM.asInteger,
                                           edData.Date, edValLaudo.Value,
                                           strtoint(edVidaUtil.Text), edObsReav.Text,
                                           fDifReaval, fDifReavalImob,
                                           rdgDepProRata.ItemIndex,True);
   //-------------------------------------------------------------------------------------
   if iResult > 0 then
   begin
      MsgDlg('Movimentação Realizada!','Atenção',mtInformation,[mbOk],0);
   end else
   begin
      MsgDlg('Movimentação não Realizada!' + #13 + #13 +
             'Causa : ' + AtivoFixo.MensagemErro, 'Erro', mtError, [mbOk], 0);
   end;
   //-------------------------------------------------------------------------------------
   LimpaCampos;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
   edData.SetFocus;
end;

procedure TfrmMovReavaliacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qrySelBem.Close;
   qryPlaca.Close;
   //-------------------------------------------------------------------------------------
   qrySelBem.UnPrepare;
   qryPlaca.UnPrepare;
end;

procedure TfrmMovReavaliacao.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   LimpaCampos;
   edData.SetFocus;
end;

Function TfrmMovReavaliacao.VidaUtilRestante : String;
Var
   fVidaUtil,fDiasJaDeprec : Double;

begin
   try
      qryUltReav.Close;
      qryUltReav.ParamByName('PIDPESSOA').AsInteger := qrySelBemIDPESSOA.AsInteger;
      qryUltReav.ParamByName('PIDBEM').AsInteger    := qrySelBemIDBEM.AsInteger;
      qryUltReav.Open;
      if qryUltReav.IsEmpty then
      begin
         fVidaUtil     := (100 / qrySelBemTAXADEP.asFloat) * 360;
         fVidaUtil     := fVidaUtil + ((fVidaUtil / 360) * 5);     // FATOR DE CORRECAO
         fDiasJaDeprec := (qrySelBemDATAULTDEP.asDateTime - qrySelBemDATAINICIODEP.asDateTime);
      end else
      begin
         fVidaUtil     := (100 / qryUltReavTAXADEP.asFloat) * 360;
         fVidaUtil     := fVidaUtil + ((fVidaUtil / 360) * 5);     // FATOR DE CORRECAO
         fDiasJaDeprec := (qryUltReavDATAULTDEP.asDateTime - qryUltReavDATAREAVALIACAO.asDateTime);
      end;
      //----------------------------------------------------------------------------------
      fVidaUtil := ((fVidaUtil - fDiasJaDeprec) / 30) - 1;
      if fVidaUtil <= 0 then
         fVidaUtil := 0;
   except
      fVidaUtil := 0;
   end;
   //-------------------------------------------------------------------------------------
   result := formatfloat('###0',fVidaUtil);
end;

end.
