unit fMTUtilRetificaReaval;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvEMulti,
  FOkCancelar, IvDictio, IvMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, DBCtrls, Mask, wwdbedit, Db, TEdNum, TREdit,
  MontaSelect, DBClient, uCMClientDataSet, CMDateTimePicker,  DBTables,
  ComCtrls, Grids, Wwdbigrd, Wwdbgrid, Wwdatsrc, wwdbdatetimepicker, uCmSqlParams,
  uCMTypes, uCtrlPadroes, uCtrlBem, uCtrlMovReavaliacao, uCtrlParamCAF;

type
  TfrmMTUtilRetificaReaval = class(TfrmOkCancelar)
    dsSelBem: TwwDataSource;
    MSBem: TMontaSelect;
    cdsSelBem: TCMClientDataSet;
    cdsUltReav: TCMClientDataSet;
    sqlUltReav: TCMSqlParams;
    cdsSaldoContabil: TCMClientDataSet;
    sqlSaldoContabil: TCMSqlParams;
    pnlMestre: TPanel;
    Label26: TLabel;
    Label22: TLabel;
    Label1: TLabel;
    Label7: TLabel;
    Label17: TLabel;
    Label8: TLabel;
    lblValSaldoContab: TLabel;
    lblem: TLabel;
    edPlaca: TEdit;
    bbtnSelBem: TBitBtn;
    dbeDesBem: TDBMemo;
    dbeNomeResp: TwwDBEdit;
    dbeDescLocalizacao: TwwDBEdit;
    dbeConjunto: TwwDBEdit;
    edDescGrupo: TwwDBEdit;
    edValSaldoContabil: TRealEdit;
    edDtaSaldoContabil: TCMDateTimePicker;
    PnlDetalhe: TPanel;
    Label30: TLabel;
    Label9: TLabel;
    Label28: TLabel;
    Label48: TLabel;
    edVidaUtil: TEditNum;
    edValLaudo: TRealEdit;
    rdgDepProRata: TRadioGroup;
    edObsReav: TMemo;
    Data: TLabel;
    edData: TCMDateTimePicker;
    Label2: TLabel;
    edDataUltReaval: TCMDateTimePicker;
    bbtnEstornar: TBitBtn;
    cdsRetificaReaval: TCMClientDataSet;
    sqlRetificaReaval: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure edPlacaExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSelBemClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnEstornarClick(Sender: TObject);
  private
    { Private declarations }
    ParamCAF    : TCtrlParamCAF;
    Bem         : TCtrlBem;
    Reavaliacao : TCtrlMovReavaliacao;
    nIdUltReavaliacao : Extended;
    //------------------------------------------------------------------------------------
    procedure LimpaTela;
    function ListaUltReaval : Integer;
    procedure CalculaSaldoContabil;
  public
    { Public declarations }
  end;

var
  frmMTUtilRetificaReaval: TfrmMTUtilRetificaReaval;

implementation

{$R *.DFM}

uses uSistema, uMensErro, FAguarde;

procedure TfrmMTUtilRetificaReaval.FormCreate(Sender: TObject);
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
procedure TfrmMTUtilRetificaReaval.FormShow(Sender: TObject);
begin
   inherited;
   LimpaTela;
end;
//========================================================================================
function TfrmMTUtilRetificaReaval.ListaUltReaval : Integer;
var
   fVidaUtil, fDiasJaDeprec : Extended;

begin
   sqlUltReav.Prepare;
   sqlUltReav.ParamByName('IDPESSOA').AsInteger  := cdsSelBem.FieldByName('IDPESSOA').AsInteger;
   sqlUltReav.ParamByName('IDBEM').AsInteger     := cdsSelBem.FieldByName('IDBEM').AsInteger;
   sqlUltReav.ParamByName('MOECODIGO').AsInteger := ParamCAF.MOEDAOFICIAL;
   sqlUltReav.ParamByName('IDTAXADEP').AsInteger := 1;
   sqlUltReav.Open;
   //-------------------------------------------------------------------------------------
   if cdsUltReav.IsEmpty then
   begin
      Result := 0; // Bem sem Reavaliação
      Exit;
   end else
   begin
      edDataUltReaval.Date := cdsUltReav.FieldByName('DATAREAVALIACAO').AsDateTime;
      //----------------------------------------------------------------------------------
      sqlRetificaReaval.Prepare;
      sqlRetificaReaval.ParamByName('IDBEM').AsFloat := cdsSelBem.FieldByName('IDBEM').AsFloat;
      sqlRetificaReaval.ParamByName('IDPESSOA').AsFloat := cdsSelBem.FieldByName('IDPESSOA').AsFloat;
      sqlRetificaReaval.ParamByName('IDREAVALACRESC').AsFloat := cdsUltReav.FieldByName('IDREAVALIACAO').AsFloat;
      sqlRetificaReaval.ParamByName('MOECODIGO').AsInteger := ParamCAF.MOEDAOFICIAL;
      sqlRetificaReaval.ParamByName('IDTAXADEP').AsInteger := 1;
      sqlRetificaReaval.Open;
      //----------------------------------------------------------------------------------
      if cdsRetificaReaval.IsEmpty then
      begin
         Result := 1; // Reavaliação sem Retificação
         //-------------------------------------------------------------------------------
         // Vida Útil da Última Reavaliação
         //-------------------------------------------------------------------------------
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
         //-------------------------------------------------------------------------------
         if fVidaUtil > 0 then
            edVidaUtil.Text := FormatFloat('###0',fVidaUtil)
         else
            edVidaUtil.Text := '';
         //-------------------------------------------------------------------------------
         // Inicializa as informações para a Retificação
         //-------------------------------------------------------------------------------
         edData.Text := '';
         edValLaudo.Value := 0;
         rdgDepProRata.ItemIndex := 0;
         edObsReav.Text := '';
         //-------------------------------------------------------------------------------
         bbtnConfirmar.Enabled := True;
         bbtnEstornar.Enabled := False;
      end else
      begin
         Result := 2; // Reavaliação com Retificação
         //-------------------------------------------------------------------------------
         // Vida Útil da Última Reavaliação
         //-------------------------------------------------------------------------------
         if cdsUltReav.FieldByName('TAXADEP').AsFloat <> 0 then
         begin
            fVidaUtil := (100 / cdsUltReav.FieldByName('TAXADEP').asFloat) * 12;
         end else
         begin
            fVidaUtil := 0;
         end;
         //-------------------------------------------------------------------------------
         if fVidaUtil > 0 then
            edVidaUtil.Text := FormatFloat('###0',fVidaUtil)
         else
            edVidaUtil.Text := '';
         //-------------------------------------------------------------------------------
         // Inicializa as informações para a Retificação
         //-------------------------------------------------------------------------------
         edData.Date := cdsRetificaReaval.FieldByName('DATAMOVIMENTACAO').AsDateTime;
         edValLaudo.Value := cdsRetificaReaval.FieldByName('VALORLAUDO').AsFloat;
         rdgDepProRata.ItemIndex := cdsRetificaReaval.FieldByName('TIPDEPPRORATA').AsInteger;
         edObsReav.Text := cdsRetificaReaval.FieldByName('OBSREAVAL').AsString;
         //-------------------------------------------------------------------------------
         if Result = 2 then
         begin
            bbtnConfirmar.Enabled := False;
            bbtnEstornar.Enabled := True;
         end else
         begin
            bbtnConfirmar.Enabled := False;
            bbtnEstornar.Enabled := False;
         end;
      end;
   end;
end;
//========================================================================================
procedure TfrmMTUtilRetificaReaval.CalculaSaldoContabil;
begin
   sqlSaldoContabil.Prepare;
   sqlSaldoContabil.ParamByName('IDPESSOA').AsInteger  := cdsSelBem.FieldByName('IDPESSOA').AsInteger;
   sqlSaldoContabil.ParamByName('IDBEM').AsInteger     := cdsSelBem.FieldByName('IDBEM').AsInteger;
   sqlSaldoContabil.ParamByName('DATASLD').AsDateTime  := edDataUltReaval.Date;
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
procedure TfrmMTUtilRetificaReaval.bbtnSelBemClick(Sender: TObject);
var
   iTipoUltReaval : Integer;

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
            iTipoUltReaval := ListaUltReaval;
            CalculaSaldoContabil;
            //----------------------------------------------------------------------------
            if iTipoUltReaval = 0 then
            begin
               MsgDlg('Este Bem não possui Reavaliação!','Erro',mtError,[mbOk],0);
               LimpaTela;
               bbtnSelBem.SetFocus;
            end else
            if iTipoUltReaval = 3 then
            begin
               MsgDlg('Este Bem já possui movimentação após a Retificação da Reavaliação!','Erro',mtError,[mbOk],0);
               LimpaTela;
               bbtnSelBem.SetFocus;
            end;
         end;
      end;
   end else
      LimpaTela;
end;
//========================================================================================
procedure TfrmMTUtilRetificaReaval.edPlacaExit(Sender: TObject);
var
   fIdBem : Extended;
   iTipoUltReaval : Integer;

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
               iTipoUltReaval := ListaUltReaval;
               CalculaSaldoContabil;
               //-------------------------------------------------------------------------
               if iTipoUltReaval = 0 then
               begin
                  MsgDlg('Este Bem não possui Reavaliação!','Erro',mtError,[mbOk],0);
                  LimpaTela;
                  bbtnSelBem.SetFocus;
               end else
               if iTipoUltReaval = 3 then
               begin
                  MsgDlg('Este Bem já possui movimentação após a Retificação da Reavaliação!','Erro',mtError,[mbOk],0);
                  LimpaTela;
                  bbtnSelBem.SetFocus;
               end;
            end;
         end;
      end;
   end;
end;
//========================================================================================
procedure TfrmMTUtilRetificaReaval.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   bbtnConfirmar.Enabled := False;
   bbtnEstornar.Enabled := False;
   bbtnCancelar.Enabled  := False;
   Screen.Cursor := crSQLWait;
   Application.ProcessMessages;
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
   if Reavaliacao.ExecutaRetificaReaval(cdsSelBem.FieldByName('IDMODULO').asFloat,
                                        cdsSelBem.FieldByName('IDPESSOA').asFloat,
                                        Sistema.IdUsuario,
                                        cdsSelBem.FieldByName('IDBEM').asFloat,
                                        edDataUltReaval.Date, edData.Date,
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
   bbtnCancelar.Enabled := True;
   LimpaTela;
end;
//========================================================================================
procedure TfrmMTUtilRetificaReaval.bbtnEstornarClick(Sender: TObject);
begin
   inherited;
   bbtnConfirmar.Enabled := False;
   bbtnEstornar.Enabled := False;
   bbtnCancelar.Enabled  := False;
   Screen.Cursor := crSQLWait;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if Reavaliacao.EstornaRetificaReaval(cdsSelBem.FieldByName('IDMODULO').asFloat,
                                        cdsSelBem.FieldByName('IDPESSOA').asFloat,
                                        Sistema.IdUsuario,
                                        cdsSelBem.FieldByName('IDBEM').asFloat,
                                        edData.Date, edData.Date, edDataUltReaval.Date) then
   begin
      Screen.Cursor := crDefault;
      MsgDlg('Movimentação Estornada!','Informação',mtInformation,[mbOk],0);
   end else
   begin
      Screen.Cursor := crDefault;
      MsgDlg('Movimentação não Estornada!' + #13 + #13 +
             'Causa : ' + Reavaliacao.MessageInfo + #13 + #13 +
             'na Reavaliação Patrimonial do Bem ' + cdsSelBem.FieldByName('PLACA').AsString,
             'Erro', mtError, [mbOk], 0);
   end;
   //-------------------------------------------------------------------------------------
   bbtnCancelar.Enabled := True;
   LimpaTela;
end;
//========================================================================================
procedure TfrmMTUtilRetificaReaval.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   LimpaTela;
end;
//========================================================================================
procedure TfrmMTUtilRetificaReaval.LimpaTela;
begin
   edPlaca.Text := '';
   cdsSelBem.Data := Bem.ListaBem(0, 0);
   //-------------------------------------------------------------------------------------
   edData.Text := '';
   edVidaUtil.Text := '';
   edValLaudo.Value := 0;
   edObsReav.Text := '';
   //-------------------------------------------------------------------------------------
   edValSaldoContabil.Value := 0;
   edDtaSaldoContabil.Text := '';
   nIdUltReavaliacao := -9;
   edDataUltReaval.Text := '';
   //-------------------------------------------------------------------------------------
   bbtnConfirmar.Enabled := False;
   bbtnEstornar.Enabled := False;
end;
//========================================================================================
procedure TfrmMTUtilRetificaReaval.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   cdsUltReav.Close;
   cdsSaldoContabil.Close;
   Bem.Free;
   Reavaliacao.Free;
   ParamCAF.Free;
end;


end.
