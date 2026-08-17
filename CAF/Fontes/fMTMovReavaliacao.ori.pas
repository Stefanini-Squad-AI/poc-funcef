unit fMTMovReavaliacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, DBCtrls, Mask, wwdbedit, Db, TEdNum, TREdit,
  MontaSelect, DBClient, uCMClientDataSet, CMDateTimePicker,  DBTables,
  Wwdatsrc, wwdbdatetimepicker, uCmSqlParams,
  uCMTypes, uCtrlPadroes, uCtrlBem, uCtrlMovReavaliacao, uCtrlParamCAF,
  IvEMulti;

type
  TfrmMTMovReavaliacao = class(TfrmOkCancelar)
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
    Label30: TLabel;
    edVidaUtil: TEditNum;
    Label9: TLabel;
    Label28: TLabel;
    edValLaudo: TRealEdit;
    rdgDepProRata: TRadioGroup;
    Label48: TLabel;
    edObsReav: TMemo;
    cdsUltReav: TCMClientDataSet;
    cdsSaldoContabil: TCMClientDataSet;
    cdsBemxDep: TCMClientDataSet;
    edValSaldoContabil: TRealEdit;
    edDtaSaldoContabil: TCMDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    sqlUltReav: TCMSqlParams;
    sqlBemxDep: TCMSqlParams;
    sqlSaldoContabil: TCMSqlParams;
    cdsSelTermo: TCMClientDataSet;
    dsSelTermo: TwwDataSource;
    dsDet: TwwDataSource;
    cdsDet: TCMClientDataSet;
    sqlDet: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure edDataExit(Sender: TObject);
    procedure edPlacaExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSelBemClick(Sender: TObject);
  private
    { Private declarations }
    ParamCAF    : TCtrlParamCAF;
    Bem         : TCtrlBem;
    Reavaliacao : TCtrlMovReavaliacao; 
    //------------------------------------------------------------------------------------
    procedure LimpaTela;
    function VidaUtilRestante : String;
    procedure CalculaSaldoContabil;
  public
    { Public declarations }
  end;

var
  frmMTMovReavaliacao: TfrmMTMovReavaliacao;

implementation

{$R *.DFM}

uses uSistema, uMensErro;

procedure TfrmMTMovReavaliacao.FormCreate(Sender: TObject);
begin
   Reavaliacao := TCtrlMovReavaliacao.Create;
   Reavaliacao.InitializeAs(Padroes);
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
   edData.Text := '';
end;
//========================================================================================
procedure TfrmMTMovReavaliacao.edDataExit(Sender: TObject);
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
procedure TfrmMTMovReavaliacao.CalculaSaldoContabil;
begin
   sqlSaldoContabil.Prepare;
   sqlSaldoContabil.ParamByName('IDPESSOA').AsInteger  := cdsSelBem.FieldByName('IDPESSOA').AsInteger;
   sqlSaldoContabil.ParamByName('IDBEM').AsInteger     := cdsSelBem.FieldByName('IDBEM').AsInteger;
   sqlSaldoContabil.ParamByName('DATASLD').AsDateTime  := edData.Date;
   sqlSaldoContabil.ParamByName('MOECODIGO').AsInteger := ParamCAF.MOEDAOFICIAL;
   sqlSaldoContabil.ParamByName('IDTAXADEP').AsInteger := 1;
   sqlSaldoContabil.Open;
   if not cdsSaldoContabil.IsEmpty then
   begin
      edValSaldoContabil.Value := cdsSaldoContabil.FieldByName('VALORG').AsCurrency +
                                  cdsSaldoContabil.FieldByName('CMBEM').AsCurrency -
                                  cdsSaldoContabil.FieldByName('DEPLANC').AsCurrency -
                                  cdsSaldoContabil.FieldByName('CMDEP').AsCurrency +
                                  cdsSaldoContabil.FieldByName('REAVVALORG').AsCurrency +
                                  cdsSaldoContabil.FieldByName('REAVCMBEM').AsCurrency -
                                  cdsSaldoContabil.FieldByName('REAVDEPLANC').AsCurrency -
                                  cdsSaldoContabil.FieldByName('REAVCMDEP').AsCurrency +
                                  cdsSaldoContabil.FieldByName('ULTREAVVALORG').AsCurrency +
                                  cdsSaldoContabil.FieldByName('ULTREAVCMBEM').AsCurrency -
                                  cdsSaldoContabil.FieldByName('ULTREAVDEPLANC').AsCurrency -
                                  cdsSaldoContabil.FieldByName('ULTREAVCMDEP').AsCurrency;
      edDtaSaldoContabil.Date := cdsSaldoContabil.FieldByName('DATASLDBEM').AsDateTime;
   end else
   begin
      edValSaldoContabil.Value := 0;
      edDtaSaldoContabil.Text := ''
   end;
end;
//========================================================================================
function TfrmMTMovReavaliacao.VidaUtilRestante : String;
Var
   fVidaUtil, fDiasJaDeprec : Extended;

begin
   try
      sqlUltReav.Prepare;
      sqlUltReav.ParamByName('IDPESSOA').AsInteger  := cdsSelBem.FieldByName('IDPESSOA').AsInteger;
      sqlUltReav.ParamByName('IDBEM').AsInteger     := cdsSelBem.FieldByName('IDBEM').AsInteger;
      sqlUltReav.ParamByName('MOECODIGO').AsInteger := ParamCAF.MOEDAOFICIAL;
      sqlUltReav.ParamByName('IDTAXADEP').AsInteger := 1;                        // Brasil
      sqlUltReav.Open;
      if not cdsUltReav.IsEmpty then
      begin
         if cdsUltReav.FieldByName('TAXADEP').AsFloat <> 0 then
         begin
            fVidaUtil := (100 / cdsUltReav.FieldByName('TAXADEP').asFloat) * 365.25;
            fVidaUtil := fVidaUtil + (fVidaUtil / 365.25);
            fDiasJaDeprec := (cdsUltReav.FieldByName('DATAULTDEP').asDateTime - cdsUltReav.FieldByName('DATAREAVALIACAO').AsDateTime);
            //----------------------------------------------------------------------------
            fVidaUtil := int((fVidaUtil - fDiasJaDeprec) / 30.4375) - 1;
            if fVidaUtil <= 0 then
               fVidaUtil := 0;
         end else
         begin
            fVidaUtil := 0;
         end;
      end else
      begin
         sqlBemxDep.Prepare;
         sqlBemxDep.ParamByName('IDBEM').AsInteger     := cdsSelBem.FieldByName('IDBEM').AsInteger;
         sqlBemxDep.ParamByName('IDPESSOA').AsInteger  := cdsSelBem.FieldByName('IDPESSOA').AsInteger;
         sqlBemxDep.ParamByName('MOECODIGO').AsInteger := ParamCAF.MOEDAOFICIAL;
         sqlBemxDep.ParamByName('IDTAXADEP').AsInteger := 1;                     // Brasil
         sqlBemxDep.Open;
         if cdsBemxDep.FieldByName('TAXADEP').AsFloat <> 0 then
         begin
            fVidaUtil := (100 / cdsBemxDep.FieldByName('TAXADEP').asFloat) * 365.25; // TaxaAnual -> TaxaDiaria
            fVidaUtil := fVidaUtil + (fVidaUtil / 365.25); // Dias a Depreciar
            fDiasJaDeprec := (cdsBemxDep.FieldByName('DATAULTDEP').asDateTime - cdsBemxDep.FieldByName('DATAINICIODEP').AsDateTime);
            //----------------------------------------------------------------------------
            fVidaUtil := ((fVidaUtil - fDiasJaDeprec) / 30.4375) - 1;
            if fVidaUtil <= 0 then
               fVidaUtil := 0;
         end else
         begin
            fVidaUtil := 0;
         end;
      end;
   except
      fVidaUtil := 0;
   end;
   //-------------------------------------------------------------------------------------
   if fVidaUtil <> 0 then
      Result := FormatFloat('###0',fVidaUtil)
   else
      Result := '';
end;
//========================================================================================
procedure TfrmMTMovReavaliacao.bbtnSelBemClick(Sender: TObject);
begin
   inherited;
   MSBem.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSBem.RetornouValor then
   begin
      cdsSelBem.Data := Bem.ListaBem(strtofloat(MSBem.ValoresChave[0]),strtofloat(MSBem.ValoresChave[1]));
      if cdsSelBem.IsEmpty then
      begin
         MsgDlg('Bem já baixado ou com controle físico.','Erro',mtError,[mbOk],0);
         LimpaTela;
         edData.SetFocus;
      end else
      begin
         if cdsSelBem.FieldByName('BAIXATOTAL').AsString = 'S' then
         begin
            MsgDlg('Bem já baixado ou com controle físico.','Erro',mtError,[mbOk],0);
            LimpaTela;
            edData.SetFocus;
         end else
         if cdsSelBem.FieldByName('FLGSAIDATEMP').AsInteger = 1 then
         begin
            MsgDlg('Bem em Saída Temporária.','Erro',mtError,[mbOk],0);
            LimpaTela;
            edData.SetFocus;
         end else
         begin
            edPlaca.Text := MSBem.ValoresChave[2];
            CalculaSaldoContabil;
            edVidaUtil.Text := VidaUtilRestante;
            pnlDetalhe.SetFocus;
         end;
      end;
   end else
      LimpaTela;
end;
//========================================================================================
procedure TfrmMTMovReavaliacao.edPlacaExit(Sender: TObject);
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
         if cdsSelBem.IsEmpty then
         begin
            MsgDlg('Bem já baixado ou com controle físico.','Erro',mtError,[mbOk],0);
            LimpaTela;
            edData.SetFocus;
         end else
         begin
            if cdsSelBem.FieldByName('BAIXATOTAL').AsString = 'S' then
            begin
               MsgDlg('Bem já baixado ou com controle físico.','Erro',mtError,[mbOk],0);
               LimpaTela;
               edData.SetFocus;
            end else
            if cdsSelBem.FieldByName('FLGSAIDATEMP').AsInteger = 1 then
            begin
               MsgDlg('Bem em Saída Temporária.','Erro',mtError,[mbOk],0);
               LimpaTela;
               edData.SetFocus;
            end else
            begin
               CalculaSaldoContabil;
               edVidaUtil.Text := VidaUtilRestante;
               pnlDetalhe.SetFocus;
            end;
         end;
      end;
   end;
end;
//========================================================================================
procedure TfrmMTMovReavaliacao.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
   Screen.Cursor := crSQLWait;
   //-------------------------------------------------------------------------------------
   if edData.Text = '' then
   begin
      MsgDlg('Data de Movimentação não pode estar vazia! ','Erro', mtError, [mbOk], 0);
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
   if edVidaUtil.Text = '' then
   begin
      MsgDlg('Informe a Vida Util do Bem! ','Erro',mtError,[mbOk],0);
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
      edVidaUtil.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if edValLaudo.Value <= 0 then
   begin
      MsgDlg('Informe o Valor do Laudo de Reavaliação! ','Erro',mtError,[mbOk],0);
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
      edVidaUtil.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if edObsReav.Text = '' then
   begin
      MsgDlg('Informe os dados relevantes do laudo de reavaliação (Empresa, Avaliador, etc)!',
             'Erro',mtError,[mbOk],0);
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
      edVidaUtil.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if not ParamCAF.CarregaProp(Sistema.IdEmpresa) then
      Raise Exception.Create('Parâmetros do sistema inválidos!');
   //-------------------------------------------------------------------------------------
   if Reavaliacao.ExecutaReavaliacaoII(cdsSelBem.FieldByName('IDMODULO').asFloat,
                                       cdsSelBem.FieldByName('IDPESSOA').asFloat,
                                       Sistema.IdUsuario,
                                       cdsSelBem.FieldByName('IDBEM').asFloat,
                                       edData.Date,
                                       edValLaudo.Value, strtoint(edVidaUtil.Text), edObsReav.Text,
                                       rdgDepProRata.ItemIndex) then
   begin
      Screen.Cursor := crDefault;
      MsgDlg('Movimentação Realizada!','Informação',mtInformation,[mbOk],0);
   end else
   begin
      Screen.Cursor := crDefault;
      MsgDlg('Movimentação não Realizada!' + #13 + #13 +
             'Causa : ' + Reavaliacao.MessageInfo + #13 + #13 +
             'na Reavaliação Patrimonial do Bem ' + cdsSelBem.FieldByName('PLACA').AsString,
             'Erro', mtError, [mbOk], 0);
   end;
   //-------------------------------------------------------------------------------------
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
   LimpaTela;
end;
//========================================================================================
procedure TfrmMTMovReavaliacao.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   LimpaTela;
end;
//========================================================================================
procedure TfrmMTMovReavaliacao.LimpaTela;
begin
   edPlaca.Text := '';
   cdsSelBem.Data := Bem.ListaBem(0, 0);
   //-------------------------------------------------------------------------------------
   edVidaUtil.Text  := '';
   edValLaudo.Value := 0;
   edObsReav.Text   := '';
   //-------------------------------------------------------------------------------------
   edValSaldoContabil.Value := 0;
   edDtaSaldoContabil.Text := '';
   //-------------------------------------------------------------------------------------
   edData.SetFocus;
end;
//========================================================================================
procedure TfrmMTMovReavaliacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   cdsUltReav.Close;
   cdsBemxDep.Close;
   cdsSaldoContabil.Close;
   Bem.Free;
   Reavaliacao.Free;
   ParamCAF.Free;
end;

end.






