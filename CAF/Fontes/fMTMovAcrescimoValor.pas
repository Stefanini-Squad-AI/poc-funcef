unit fMTMovAcrescimoValor;
// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
{ -------------------------------------------------------------------------------------
Rotina......: bbtnConfirmarClick
Nº SOL......: 142550
Nº KINTANA..: 911790
Data........: 24/09/2010
Responsável.: Helen V. Bianchi
Descrição...: Funcionalidade "Acréscimo de Valor" alterado para "Acréscimo/Decréscimo
            de valor. Nome do Campo "Tipo de despesa", alterado para "Tipo Específico
            de Movimentação". Alterar o nome do campo "Valor do Acréscimo", para
            "Valor da Movimentação". Add o campo IdTipoMovimentacao
---------------------------------------------------------------------------------------}
//-------------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, DBCtrls, Mask, wwdbedit, Db, TEdNum, TREdit,
  MontaSelect, DBClient, uCMClientDataSet, CMDateTimePicker,  DBTables,
  Wwdatsrc, wwdbdatetimepicker, uCmSqlParams, wwdblook,
  uCMTypes, uCtrlPadroes, uCtrlBem, uCtrlMovAcrescimoValor, uCtrlParamCAF,
  IvEMulti,uCtrlTipoDespesaAV,uCtrlTipoMovimentacao;

type
  TfrmMTMovAcrescimoValor = class(TfrmOkCancelar)
    dsSelBem: TwwDataSource;
    pnlMestre: TPanel;
    PnlDetalhe: TPanel;
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
    Label17: TLabel;
    Label8: TLabel;
    edDescGrupo: TwwDBEdit;
    cdsTipoDespesa: TCMClientDataSet;
    sqlTipoDespesa: TCMSqlParams;
    Label46: TLabel;
    cmbTipoDespesa: TwwDBLookupCombo;
    Label15: TLabel;
    edValAcres: TRealEdit;
    Label25: TLabel;
    dsTipoDespesa: TwwDataSource;
    edObsAcres: TMemo;
    cdsMovimento: TCMClientDataSet;
    lblTipoMov: TLabel;
    dblcTipoMovimento: TwwDBLookupCombo;
    procedure FormCreate(Sender: TObject);
    procedure edDataExit(Sender: TObject);
    procedure edPlacaExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSelBemClick(Sender: TObject);
    procedure dblcTipoMovimentoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
    ParamCAF       : TCtrlParamCAF;
    Bem            : TCtrlBem;
    AcrescimoValor : TCtrlMovAcrescimoValor;
    //Helen - SOL Nº142550 KINTANA Nº 911790 Add fIdTipoDespesa
    TipoDespesaAV      : TCtrlTipoDespesaAV;
    TipoMovimentacao   : TCtrlTipoMovimentacao;
    //------------------------------------------------------------------------------------
    procedure LimpaTela;
  public
    { Public declarations }
  end;

var
  frmMTMovAcrescimoValor: TfrmMTMovAcrescimoValor;

implementation

{$R *.DFM}

uses uSistema, uMensErro;

procedure TfrmMTMovAcrescimoValor.FormCreate(Sender: TObject);
begin
   //Helen - SOL Nº142550 KINTANA Nº 911790
   TipoMovimentacao := tCtrlTipoMovimentacao.Create;
   TipoMovimentacao.InitializeAs(Padroes);
   cdsMovimento.Data := TipoMovimentacao.ListaAcrescDecresc( ' IDTIPOMOVIMENTACAO = 9 or IDTIPOMOVIMENTACAO = 95 ' );

   TipoDespesaAV    := TCtrlTipoDespesaAV.Create;
   TipoDespesaAV.InitializeAs(Padroes);
   cdsTipoDespesa.Data := TipoDespesaAV.ListaTipoDespesaAV(' IDTIPODESPESA > 0');
   //-------------------------------------------------------------------------------------
   AcrescimoValor := TCtrlMovAcrescimoValor.Create;
   AcrescimoValor.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   Bem := TCtrlBem.Create;
   Bem.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   ParamCAF := TCtrlParamCAF.Create;
   ParamCAF.InitializeAs(Padroes);
   if not ParamCAF.CarregaProp(Sistema.IdEmpresa) then
      Raise Exception.Create('Parâmetros do sistema inválidos!');
   //-------------------------------------------------------------------------------------
   MSBem.Filtro.Add('BEM.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSBem.Filtro.Add('PLANOGRUPO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSBem.Filtro.Add('BEM.FLGSAIDATEMP = 0');
   MSBem.Filtro.Add('BEM.BAIXATOTAL <> ''S''');
   //-------------------------------------------------------------------------------------
   sqlTipoDespesa.Open;
   edData.Text := '';
end;
//========================================================================================
procedure TfrmMTMovAcrescimoValor.edDataExit(Sender: TObject);
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
procedure TfrmMTMovAcrescimoValor.bbtnSelBemClick(Sender: TObject);
begin
   inherited;
   MSBem.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSBem.RetornouValor then
   begin
      cdsSelBem.Data := Bem.ListaBem(strtofloat(MSBem.ValoresChave[0]),strtofloat(MSBem.ValoresChave[1]));
      edPlaca.Text := MSBem.ValoresChave[2];
      //----------------------------------------------------------------------------------
      //Helen - SOL Nº142550 KINTANA Nº 911790
      //cmbTipoDespesa.SetFocus;
      dblcTipoMovimento.SetFocus;
   end else
      LimpaTela;
end;
//========================================================================================
procedure TfrmMTMovAcrescimoValor.edPlacaExit(Sender: TObject);
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
         cdsSelBem.Data := Bem.ListaBem(Sistema.IdEmpresa,fIdBem);
         edPlaca.Text := cdsSelBem.FieldByName('PLACA').AsString;
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
         //Helen - SOL Nº142550 KINTANA Nº 911790
         //cmbTipoDespesa.SetFocus;
         dblcTipoMovimento.SetFocus;
      end;
   end;
end;
//========================================================================================
procedure TfrmMTMovAcrescimoValor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   Bem.Free;
   AcrescimoValor.Free;
   ParamCAF.Free;
   TipoMovimentacao.Free;
   TipoDespesaAV.Free;
end;
//========================================================================================
procedure TfrmMTMovAcrescimoValor.bbtnConfirmarClick(Sender: TObject);
var
   //Helen - SOL Nº142550 KINTANA Nº 911790
   descrecimo : Boolean; idTipoDespesa : Integer;
begin
   inherited;
   if edData.Text = '' then
   begin
      MsgDlg('Data de Movimentação não pode estar vazia! ','Erro', mtError, [mbOk], 0);
      edData.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if edPlaca.Text = '' then
   begin
      MsgDlg('Selecione um Bem!', 'Erro', mtError, [mbOk], 0);
      edPlaca.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   //Helen - SOL Nº142550 KINTANA Nº 911790
   if (cmbTipoDespesa.Enabled) then
   begin
         if (cmbTipoDespesa.Text = '')  then
         begin
             MsgDlg('Selecione o Tipo de Despesa que gerou o Acréscimo de Valor! ','Erro',mtError,[mbOk],0);
             cmbTipoDespesa.SetFocus;
             exit;
         end;
   end;
   //-------------------------------------------------------------------------------------
   if edValAcres.Value <= 0 then
   begin
      MsgDlg('Informe o Valor do Acréscimo de Valor! ','Erro',mtError,[mbOk],0);
      edValAcres.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if edObsAcres.Text = '' then
   begin
      MsgDlg('Informe os detalhes relevantes do Acréscimo de Valor! ','Erro',mtError,[mbOk],0);
      edObsAcres.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
   Screen.Cursor := crSQLWait;
   //Helen - SOL Nº142550 KINTANA Nº 911790
   if cdsMovimento.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 9 then
      descrecimo := false
   else
      descrecimo := true;
   if cmbTipoDespesa.Enabled = false then
     idTipoDespesa := 0
   else
     idTipoDespesa := cdsTipoDespesa.FieldByName('IDTIPODESPESA').AsInteger ;

   if AcrescimoValor.ExecutaAcrescimoValor(cdsSelBem.FieldByName('IDMODULO').asFloat,
                                           cdsSelBem.FieldByName('IDPESSOA').asFloat,
                                           Sistema.IdUsuario,
                                           cdsSelBem.FieldByName('IDBEM').asFloat,
                                           edData.Date,
{Helen - SOL Nº142550 KINTANA Nº 911790}   idTipoDespesa,
                                           edValAcres.Value, copy(edObsAcres.Text,1,60),
{Helen - SOL Nº142550 KINTANA Nº 911790}   descrecimo) then
   begin
      MsgDlg('Movimentação Realizada!','Informação',mtInformation,[mbOk],0);
   end else
   begin
      MsgDlg('Movimentação não Realizada!' + #13 + #13 +
             'Causa : ' + AcrescimoValor.MessageInfo + #13 + #13 +
             'no Acréscimo de Valor do Bem ' + cdsSelBem.FieldByName('PLACA').AsString,
             'Erro', mtError, [mbOk], 0);
   end;
   Screen.Cursor := crDefault;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
   //-------------------------------------------------------------------------------------
   LimpaTela;
end;
//========================================================================================
procedure TfrmMTMovAcrescimoValor.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   LimpaTela;
end;
//========================================================================================
procedure TfrmMTMovAcrescimoValor.LimpaTela;
begin
   //Helen - SOL Nº142550 KINTANA Nº 911790
   dblcTipoMovimento.Text    := '';
   cmbTipoDespesa.Text    := '';
   cmbTipoDespesa.Enabled := False;

   edPlaca.Text := '';
   cdsSelBem.Data := Bem.ListaBem(0, 0);
   //-------------------------------------------------------------------------------------
   cdsTipoDespesa.Close;
   sqlTipoDespesa.Open;
   edValAcres.Text := '';
   edObsAcres.Text := '';
   //-------------------------------------------------------------------------------------
   edData.SetFocus;

end;

procedure TfrmMTMovAcrescimoValor.dblcTipoMovimentoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  //Helen - SOL Nº142550 KINTANA Nº 911790
   cmbTipoDespesa.Enabled := false;
   if (cdsMovimento.FieldByName('IDTIPOMOVIMENTACAO').AsString <> '') then
   begin
     cdsTipoDespesa.close;
     cdsTipoDespesa.Data := TipoDespesaAV.ListaTipoDespesaAVParam(' CT.IDTIPOMOVIMENTACAO = ' + cdsMovimento.FieldByName('IDTIPOMOVIMENTACAO').AsString + #13 +
               ' AND CT.IDGRUPO = ' + cdsSelBem.FieldByName('IDGRUPO').AsString ) ;
     if not cdsTipoDespesa.Eof then
        cmbTipoDespesa.Enabled := True
     else
     begin
        cdsTipoDespesa.close;
        cdsTipoDespesa.Data := TipoDespesaAV.ListaTipoDespesaAV(' IDTIPOMOVIMENTACAO = ' + cdsMovimento.FieldByName('IDTIPOMOVIMENTACAO').AsString) ;
     end;
   end;
end;

end.
