unit fMovTransfPlaca;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, DBCtrls, Mask, wwdbedit, Db,
  DBTables, Wwquery, Wwdatsrc, MontaSelect, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TfrmMovTransfPlaca = class(TfrmOkCancelar)
    dsSelBem: TwwDataSource;
    qrySelBem: TwwQuery;
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
    qryPlaca: TwwQuery;
    qryPlacaIDBEM: TFloatField;
    pnlMestre: TPanel;
    Data: TLabel;
    Label22: TLabel;
    Label26: TLabel;
    Label1: TLabel;
    Label7: TLabel;
    Label17: TLabel;
    edData: TCMDateTimePicker;
    bbtnPesquisa: TBitBtn;
    edPlaca: TEdit;
    dbeLocal: TwwDBEdit;
    dbeResp: TwwDBEdit;
    PnlDetalhe: TPanel;
    dbeDescConjunto: TwwDBEdit;
    dbeDesBem: TDBMemo;
    Label2: TLabel;
    edPlacaNova: TEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure edDataExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure bbtnPesquisaClick(Sender: TObject);
    procedure edPlacaEnter(Sender: TObject);
    procedure edPlacaExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    Procedure LimpaCampos;
  public
    { Public declarations }
  end;

var
  frmMovTransfPlaca: TfrmMovTransfPlaca;

implementation

{$R *.DFM}

uses uAutorizacao, uSistema,  uAtivoFixo, uMensErro, dAtivoFixo;

procedure TfrmMovTransfPlaca.FormCreate(Sender: TObject);
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
//========================================================================================
Procedure TfrmMovTransfPlaca.LimpaCampos;
begin
   pnlDetalhe.Enabled  := False;
   edPlaca.Text        := '';
   edPlacaNova.Text    := '';
   //-------------------------------------------------------------------------------------
   qrySelBem.Close;
end;
//========================================================================================
procedure TfrmMovTransfPlaca.edDataExit(Sender: TObject);
begin
   inherited;
   if (bbtnCancelar.Focused) or (bbtnSair.Focused) then
      exit;
   //-------------------------------------------------------------------------------------
   if edData.Text = '' then
   begin
      MsgDlg('Preencha o campo Data da Movimentação','Erro',mtError,[mbOk],0);
      edData.SetFocus;
   end;
end;
//========================================================================================
procedure TfrmMovTransfPlaca.FormKeyPress(Sender: TObject; var Key: Char);
begin
   inherited;
   if key = #13 then
   begin
      key := #0;
      Perform(Wm_NextDlgCtl, 0, 0);
   end;
end;
//========================================================================================
procedure TfrmMovTransfPlaca.bbtnPesquisaClick(Sender: TObject);
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
      //----------------------------------------------------------------------------------
      if qrySelBem.IsEmpty then
      begin
         MsgDlg('Bem já baixado ou com controle físico.','Erro',mtError,[mbOk],0);
         LimpaCampos;
         edData.SetFocus;
      end else
      begin
         edPlaca.Text := qrySelBemPLACA.AsString;
         pnlDetalhe.Enabled  := True;
         edPlacaNova.SetFocus;
      end;
   end else
   begin
      LimpaCampos;
      edData.SetFocus;
   end;
end;
//========================================================================================
procedure TfrmMovTransfPlaca.edPlacaEnter(Sender: TObject);
begin
   inherited;
   LimpaCampos;
end;
//========================================================================================
procedure TfrmMovTransfPlaca.edPlacaExit(Sender: TObject);
begin
   inherited;
   if (edPlaca.Text <> '') then
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
            edPlaca.Text := qrySelBemPLACA.AsString;
            pnlDetalhe.Enabled  := True;
            edPlacaNova.SetFocus;
         end else
         begin
            MsgDlg('Placa de Bem inexistente ou Bem Baixado','Erro',mtError,[mbOk],0);
            LimpaCampos;
            edData.SetFocus;
         end;
      end else
      begin
         MsgDlg('Placa de Bem inexistente','Erro',mtError,[mbOk],0);
         LimpaCampos;
         edData.SetFocus;
      end;
   end;
end;
//========================================================================================
procedure TfrmMovTransfPlaca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qrySelBem.Close;
   qryPlaca.Close;
   //-------------------------------------------------------------------------------------
   qrySelBem.UnPrepare;
   qryPlaca.UnPrepare;
end;
//========================================================================================
procedure TfrmMovTransfPlaca.bbtnConfirmarClick(Sender: TObject);
var
   bResult : Boolean;

begin
   inherited;
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
   //-------------------------------------------------------------------------------------
   if (edData.Text = '') then
   begin
      MsgDlg('Data de Movimentação não pode estar vazia! ','Erro',mtError,[mbOk],0);
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
      edData.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if (edPlacaNova.Text = '') then
   begin
      MsgDlg('Número da Placa de Tombamento Nova deve ser informado! ',
             'Erro',mtError,[mbOk],0);
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
      edPlacaNova.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   bResult := AtivoFixo.ExecutaTransfPlaca(7, Sistema.IdEmpresa,
                                           qrySelBemIDBEM.asInteger,
                                           strtofloat(edPlacaNova.Text),
                                           edData.Date, 
                                           True);
   //-------------------------------------------------------------------------------------
   if bResult then
   begin
      MsgDlg('Movimentação Realizada!','Informação',mtInformation,[mbOk],0);
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
//========================================================================================
procedure TfrmMovTransfPlaca.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   LimpaCampos;
   edData.SetFocus;
end;

end.
