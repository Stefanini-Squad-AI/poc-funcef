unit fMTMovTransfPlaca;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, DBCtrls, Mask, wwdbedit, Db,
  DBTables, Wwquery, Wwdatsrc, MontaSelect, wwdbdatetimepicker,
  CMDateTimePicker, DBClient, uCMClientDataSet,
  uCMTypes, uCtrlPadroes, uCtrlBem, IvEMulti;

type
  TfrmMTMovTransfPlaca = class(TfrmOkCancelar)
    dsSelBem: TwwDataSource;
    pnlMestre: TPanel;
    PnlDetalhe: TPanel;
    Label2: TLabel;
    edPlacaNova: TEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    MSBem: TMontaSelect;
    cdsSelBem: TCMClientDataSet;
    Data: TLabel;
    edData: TCMDateTimePicker;
    Label26: TLabel;
    edPlaca: TEdit;
    bbtnSelBem: TBitBtn;
    dbeDesBem: TDBMemo;
    Label22: TLabel;
    dbeNomeResp: TwwDBEdit;
    dbeDescLocalizacao: TwwDBEdit;
    dbeConjunto: TwwDBEdit;
    Label1: TLabel;
    Label7: TLabel;
    Label3: TLabel;
    dbeDescGrupo: TwwDBEdit;
    Label17: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure edDataExit(Sender: TObject);
    procedure edPlacaExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSelBemClick(Sender: TObject);
  private
    { Private declarations }
    Bem : TCtrlBem;
    Procedure LimpaTela;
  public
    { Public declarations }
  end;

var
  frmMTMovTransfPlaca: TfrmMTMovTransfPlaca;

implementation

{$R *.DFM}

uses uSistema, uMensErro;

procedure TfrmMTMovTransfPlaca.FormCreate(Sender: TObject);
begin
   Bem := TCtrlBem.Create;
   Bem.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   MSBem.Filtro.Add('BEM.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSBem.Filtro.Add('PLANOGRUPO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSBem.Filtro.Add('BEM.FLGSAIDATEMP = 0');
   MSBem.Filtro.Add('BEM.BAIXATOTAL <> ''S''');
   //-------------------------------------------------------------------------------------
   edData.Text := '';
end;
//========================================================================================
procedure TfrmMTMovTransfPlaca.edDataExit(Sender: TObject);
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
procedure TfrmMTMovTransfPlaca.bbtnSelBemClick(Sender: TObject);
begin
   inherited;
   MSBem.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if not MSBem.RetornouValor then
   begin
      LimpaTela;
   end else
   begin
      cdsSelBem.Data := Bem.ListaBem(strtofloat(MSBem.ValoresChave[0]),strtofloat(MSBem.ValoresChave[1]));
      edPlaca.Text := MSBem.ValoresChave[2];
      edPlacaNova.SetFocus;
   end;
end;
//========================================================================================
procedure TfrmMTMovTransfPlaca.edPlacaExit(Sender: TObject);
var
   fIdBem : Extended;

begin
   inherited;
   if bbtnSair.Focused then Exit;
   //-------------------------------------------------------------------------------------
   if edPlaca.Text <> '' then
   begin
      fIdBem := Bem.PlacaIdBem(Sistema.IdEmpresa, edPlaca.Text);
      if fIdBem <= 0 then
      begin
         MsgDlg('Placa Inexistente','Erro', mtError, [mbOk], 0);
         LimpaTela;
      end else
      begin
         cdsSelBem.Data  := Bem.ListaBem(Sistema.IdEmpresa,fIdBem);
         edPlaca.Text    := cdsSelBem.FieldByName('PLACA').AsString;
         //-------------------------------------------------------------------------------
         if cdsSelBem.FieldByName('FLGSAIDATEMP').AsInteger = 1 then
         begin
            MsgDlg('Bem em Saída Temporária!','Erro', mtError, [mbOk], 0);
            cdsSelBem.Data  := Bem.ListaBem(0, 0);
            edPlaca.Text := '';
            edData.SetFocus;
            exit;
         end else
         if cdsSelBem.FieldByName('BAIXATOTAL').AsString = 'S' then
         begin
            MsgDlg('Bem Baixado!','Erro', mtError, [mbOk], 0);
            cdsSelBem.Data  := Bem.ListaBem(0, 0);
            edPlaca.Text := '';
            edData.SetFocus;
            exit;
         end;
         //-------------------------------------------------------------------------------
         edPlacaNova.SetFocus;
      end;
   end;
end;
//========================================================================================
procedure TfrmMTMovTransfPlaca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   Bem.Free;
end;
//========================================================================================
procedure TfrmMTMovTransfPlaca.bbtnConfirmarClick(Sender: TObject);
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
   if edPlaca.Text = '' then
   begin
      MsgDlg('Selecione um Bem!', 'Erro', mtError, [mbOk], 0);
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
      edPlaca.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if edPlacaNova.Text = '' then
   begin
      MsgDlg('Número da Placa de Tombamento Nova deve ser informado! ',
             'Erro',mtError,[mbOk],0);
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
      edPlacaNova.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if Bem.ExecutaTransfPlaca(Sistema.IdModulo, Sistema.IdEmpresa, 
                             cdsSelBem.FieldByName('IDBEM').asFloat,
                             strtofloat(edPlacaNova.Text),
                             edData.Date) then
   begin
      MsgDlg('Movimentação Realizada!','Informação',mtInformation,[mbOk],0);
   end else
   begin
      MsgDlg('Movimentação não Realizada!' + #13 + #13 +
             'Causa : ' + Bem.MessageInfo + #13 + #13 +
             ' na Troca da Placa de Tombamento do Bem ' + cdsSelBem.FieldByName('PLACA').AsString,
             'Erro', mtError, [mbOk], 0);
   end;
   //-------------------------------------------------------------------------------------
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
   LimpaTela;
end;
//========================================================================================
procedure TfrmMTMovTransfPlaca.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   LimpaTela;
end;
//========================================================================================
procedure TfrmMTMovTransfPlaca.LimpaTela;
begin
   edPlaca.Text := '';
   edPlacaNova.Text := '';
   cdsSelBem.Data  := Bem.ListaBem(0, 0);
   edData.SetFocus;
end;

end.
