unit fMTEstornaMovimentacoes;
{--------------------------------------------------------------------------------
Rotina...........:
Nº SOL...........: 142551
Nº KINTANA.......: 911676
Data da Alteração: 06/12/2010
Responsável......: Helen V. Bianchi
Descrição........: 
--------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, IvEMulti,
  Dialogs, FOkCancelar, IvDictio, IvMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Mask, wwdbedit,
  DBCtrls, ComCtrls, wwdbdatetimepicker, CMDateTimePicker, fcLabel,
  TB97Tlwn, MontaSelect, uCmSqlParams, DB, DBClient, uCMClientDataSet, Wwdatsrc,
  uCMTypes, uCtrlPadroes, uCtrlParamCAF, uCtrlBem, uCtrlMovTransfBem, uCtrlMovBaixa,
  uCtrlMovDesmembramento, uCtrlMovRemembramento, uCtrlMovReavaliacao, uCtrlMovAcrescimoValor;

type
  TfrmMTEstornaMovimentacoes = class(TfrmOkCancelar)
    Dock973: TDock97;
    ToolWindow972: TToolWindow97;
    fcLabel3: TfcLabel;
    fcLabel1: TfcLabel;
    edDataMov: TCMDateTimePicker;
    cmbControle: TComboBox;
    pgctlEstorno: TPageControl;
    TabBem: TTabSheet;
    pnlBem: TPanel;
    Label22: TLabel;
    Label26: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Label17: TLabel;
    Label4: TLabel;
    dbeDesBem: TDBMemo;
    bbtnSelBem: TBitBtn;
    edPlaca: TEdit;
    dbeDescLocalizacao: TwwDBEdit;
    dbeNomeResp: TwwDBEdit;
    dbeDescGrupo: TwwDBEdit;
    pnlAcrescimos: TPanel;
    Label5: TLabel;
    dbgAcrescimos: TwwDBGrid;
    dbeDescConjunto: TwwDBEdit;
    TabSelBem: TTabSheet;
    pnlSelBem: TPanel;
    Label9: TLabel;
    Label8: TLabel;
    Processo: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    dbeTermo: TwwDBEdit;
    bbtnTermo: TBitBtn;
    dbeSbxProcesso: TwwDBEdit;
    dbeRespConj: TwwDBEdit;
    dbgTermo: TwwDBGrid;
    dbeDataSel: TCMDateTimePicker;
    TabReavCBS: TTabSheet;
    wwDBGrid1: TwwDBGrid;
    dsAcrescimos: TwwDataSource;
    cdsPlaca: TCMClientDataSet;
    sqlPlaca: TCMSqlParams;
    cdsSelTermo: TCMClientDataSet;
    dsSelTermo: TwwDataSource;
    MSTermo: TMontaSelect;
    dsSelBem: TwwDataSource;
    cdsSelBem: TCMClientDataSet;
    MSBem: TMontaSelect;
    cdsAcrescimos: TCMClientDataSet;
    sqlAcrescimos: TCMSqlParams;
    sqlSelTermo: TCMSqlParams;
    cdsVerificaMov: TCMClientDataSet;
    sqlVerificaMov: TCMSqlParams;
    dsSelTermoBens: TwwDataSource;
    cdsSelTermoBens: TCMClientDataSet;
    sqlSelTermoBaixa: TCMSqlParams;
    cdsVerificaTipoReaval: TCMClientDataSet;
    sqlVerificaTipoReaval: TCMSqlParams;
    sqlSelTermoTransf: TCMSqlParams;
    sqlSelTermoReaval: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmbControleEnter(Sender: TObject);
    procedure cmbControleExit(Sender: TObject);
    procedure edDataMovExit(Sender: TObject);
    procedure bbtnSelBemClick(Sender: TObject);
    procedure edPlacaExit(Sender: TObject);
    procedure bbtnTermoClick(Sender: TObject);
    procedure dbgAcrescimosDblClick(Sender: TObject);
    procedure pgctlEstornoChanging(Sender: TObject; var AllowChange: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    ParamCAF : TCtrlParamCAF;
    Bem : TCtrlBem;
    //------------------------------------------------------------------------------------
    nIdAcrescimo : Extended;
    //------------------------------------------------------------------------------------
    MessageInfo : String;
    function EstornaEntrada : Boolean;
    function EstornaTransferencia : Boolean;
    function EstornaBaixa : Boolean;
    function EstornaReavaliacao : Boolean;
    function EstornaAcrescimoValor : Boolean;
    function EstornaDesmembramento : Boolean;
    function EstornaRemembramento : Boolean;

  public
    { Public declarations }
  end;

var
  frmMTEstornaMovimentacoes: TfrmMTEstornaMovimentacoes;

implementation

{$R *.dfm}

uses uSistema, uMensErro;

procedure TfrmMTEstornaMovimentacoes.FormCreate(Sender: TObject);
begin
   inherited;
   Bem := TCtrlBem.Create;
   Bem.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   ParamCAF := TCtrlParamCAF.Create;
   ParamCAF.InitializeAs(Padroes);
   if not ParamCAF.CarregaProp(Sistema.IdEmpresa) then
      Raise Exception.Create('Parâmetros do sistema inválidos!');
   //-------------------------------------------------------------------------------------
   cmbControle.Items.Clear;
   cmbControle.Items.Add('Entrada');
   cmbControle.Items.Add('Transferência de Bens');
   cmbControle.Items.Add('Acréscimo de Valor');
   cmbControle.Items.Add('Reavaliação');
   cmbControle.Items.Add('Desmembramento');
   cmbControle.Items.Add('Remembramento');
   cmbControle.Items.Add('Baixa');
   //-------------------------------------------------------------------------------------
   MSBem.Filtro.Add('BEM.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSBem.Filtro.Add('PLANOGRUPO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSBem.Filtro.Add('BEM.FLGSAIDATEMP = 0');
   MSTermo.Filtro.Add('SELBAIXA.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   //-------------------------------------------------------------------------------------
   edDataMov.Text := '';
   Screen.Cursor  := crDefault;
   pgctlEstorno.ActivePage := TabBem;
end;
//========================================================================================
procedure TfrmMTEstornaMovimentacoes.FormShow(Sender: TObject);
begin
   inherited;
   cmbControle.SetFocus;
end;
//========================================================================================
procedure TfrmMTEstornaMovimentacoes.cmbControleEnter(Sender: TObject);
begin
   inherited;
   edPlaca.Text := '';
   cdsSelBem.Close;
   cdsSelTermo.Close;
   cdsSelTermoBens.Close;
   cdsAcrescimos.Close;
   //-------------------------------------------------------------------------------------
   pnlAcrescimos.Visible := False;
   pgctlEstorno.ActivePage := TabBem;
end;
//========================================================================================
procedure TfrmMTEstornaMovimentacoes.cmbControleExit(Sender: TObject);
begin
   inherited;
   if bbtnCancelar.Focused or bbtnSair.Focused then
      exit;
   //-------------------------------------------------------------------------------------
   if cmbControle.Text = '' then
   begin
      MsgDlg('Selecione a movimentação que será estornada!','Erro',mtError,[mbOk],0);
      cmbControle.SetFocus;
   end;
   //-------------------------------------------------------------------------------------
   if cmbControle.Text = 'Transferência de Bens' then
   begin
      MSTermo.Filtro.Strings[0] := 'SELBAIXA.SBTIPOMOV = 1';
      TabSelBem.Enabled := True;
   end else
   if cmbControle.Text = 'Baixa' then
   begin
      MSTermo.Filtro.Strings[0] := 'SELBAIXA.SBTIPOMOV = 0';
      TabSelBem.Enabled := True;
   end else
   if cmbControle.Text = 'Reavaliação' then
   begin
      MSTermo.Filtro.Strings[0] := 'SELBAIXA.SBTIPOMOV = 2';
      TabSelBem.Enabled := True;
   end else
   begin
      pgctlEstorno.ActivePage := TabBem;
      TabSelBem.Enabled := False;
   end;
end;
//========================================================================================
procedure TfrmMTEstornaMovimentacoes.edDataMovExit(Sender: TObject);
begin
   inherited;
   if bbtnCancelar.Focused or bbtnSair.Focused then
      exit;
   //-------------------------------------------------------------------------------------
   if edDataMov.Text = '' then
      MsgDlg('Selecione a data da movimentação!','Erro',mtError,[mbOk],0);
end;
//========================================================================================
procedure TfrmMTEstornaMovimentacoes.bbtnSelBemClick(Sender: TObject);
begin
   inherited;
   MSBem.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSBem.RetornouValor then
   begin
      cdsSelBem.Data  := Bem.ListaBem(strtofloat(MSBem.ValoresChave[0]),strtofloat(MSBem.ValoresChave[1]));
      edPlaca.Text := cdsSelBem.FieldByName('PLACA').AsString;
      //----------------------------------------------------------------------------------
      if (cmbControle.Text <> 'Baixa') and (cmbControle.Text <> 'Desmembramento') then
      begin
         if cdsSelBem.FieldByName('BAIXATOTAL').AsString = 'S' then
         begin
            MsgDlg('Bem já Baixado ou Desmembrado!', 'Erro', mtError, [mbOk], 0);
            edPlaca.SetFocus;
            exit;
         end;
      end;
      //----------------------------------------------------------------------------------
      if cmbControle.Text = 'Acréscimo de Valor' then
      begin
         sqlAcrescimos.Prepare;
         sqlAcrescimos.ParambyName('IDPESSOA').AsFloat  := cdsSelBem.FieldByName('IDPESSOA').AsFloat;
         sqlAcrescimos.ParambyName('IDBEM').AsFloat     := cdsSelBem.FieldByName('IDBEM').AsFloat;
         sqlAcrescimos.ParambyName('MOECODIGO').AsFloat := ParamCAF.MOEDAOFICIAL;
         sqlAcrescimos.Open;
         pnlAcrescimos.Visible := True;
      end;
   end else
   begin
      bbtnSelBem.SetFocus;
   end;
end;
//========================================================================================
procedure TfrmMTEstornaMovimentacoes.edPlacaExit(Sender: TObject);
begin
   inherited;
   if bbtnCancelar.Focused or bbtnSair.Focused then
      exit;
   //-------------------------------------------------------------------------------------
   if edPlaca.Text <> '' then
   begin
      sqlPlaca.Prepare;
      sqlPlaca.ParamByName('PLACA').AsFloat    := StrToFloat(edPlaca.Text);
      sqlPlaca.ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
      sqlPlaca.Open;
      if not cdsPlaca.IsEmpty then
      begin
         cdsSelBem.Data  := Bem.ListaBem(cdsPlaca.FieldByName('IDPESSOA').AsFloat,cdsPlaca.FieldByName('IDBEM').AsFloat);
         //-------------------------------------------------------------------------------
         if cdsSelBem.IsEmpty then
         begin
            MsgDlg('Placa Inexistente!','Erro',mtError,[mbOk],0);
            edPlaca.SetFocus;
         end else
         //-------------------------------------------------------------------------------
         begin
            if (cmbControle.Text <> 'Baixa') and (cmbControle.Text <> 'Desmembramento') then
            begin
               if cdsSelBem.FieldByName('BAIXATOTAL').AsString = 'S' then
               begin
                  MsgDlg('Bem já Baixado ou Desmembrado!', 'Erro', mtError, [mbOk], 0);
                  edPlaca.SetFocus;
                  exit;
               end;
            end;
            //----------------------------------------------------------------------------
            if cmbControle.Text = 'Acréscimo de Valor' then
            begin
               sqlAcrescimos.Prepare;
               sqlAcrescimos.ParambyName('IDPESSOA').AsFloat  := cdsSelBem.FieldByName('IDPESSOA').AsFloat;
               sqlAcrescimos.ParambyName('IDBEM').AsFloat     := cdsSelBem.FieldByName('IDBEM').AsFloat;
               sqlAcrescimos.ParambyName('MOECODIGO').AsFloat := ParamCAF.MOEDAOFICIAL;
               sqlAcrescimos.Open;
               TFloatField(cdsAcrescimos.FieldByName('VALORG')).DisplayFormat := '#,##0.00;(#,##0.00); ';
               pnlAcrescimos.Visible := True;
            end;
         end;
      end else
      begin
         edPlaca.SetFocus;
      end;
   end;
end;
//========================================================================================
procedure TfrmMTEstornaMovimentacoes.bbtnTermoClick(Sender: TObject);
begin
   inherited;
   MSTermo.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSTermo.RetornouValor then
   begin
      sqlSelTermo.Prepare;
      sqlSelTermo.ParamByName('IDPESSOA').AsInteger   := Sistema.IdEmpresa;
      sqlSelTermo.ParamByName('IDSELBAIXA').AsInteger := StrToInt(MSTermo.ValoresChave[0]);
      sqlSelTermo.Open;
      //----------------------------------------------------------------------------------
      cdsSelTermoBens.Close;
      if cmbControle.Text = 'Transferência de Bens' then
      begin
         sqlSelTermoTransf.Prepare;
         sqlSelTermoTransf.ParamByName('IDPESSOA').AsInteger   := Sistema.IdEmpresa;
         sqlSelTermoTransf.ParamByName('IDSELBAIXA').AsInteger := StrToInt(MSTermo.ValoresChave[0]);
         sqlSelTermoTransf.Open;
      end else
      if cmbControle.Text = 'Baixa' then
      begin
         sqlSelTermoBaixa.Prepare;
         sqlSelTermoBaixa.ParamByName('IDPESSOA').AsInteger   := Sistema.IdEmpresa;
         sqlSelTermoBaixa.ParamByName('IDSELBAIXA').AsInteger := StrToInt(MSTermo.ValoresChave[0]);
         sqlSelTermoBaixa.Open;
      end else
      if cmbControle.Text = 'Reavaliação' then
      begin
         sqlSelTermoReaval.Prepare;
         sqlSelTermoReaval.ParamByName('IDPESSOA').AsInteger   := Sistema.IdEmpresa;
         sqlSelTermoReaval.ParamByName('IDSELBAIXA').AsInteger := StrToInt(MSTermo.ValoresChave[0]);
         sqlSelTermoReaval.Open;
      end;
      //----------------------------------------------------------------------------------
      if cdsSelTermo.FieldByName('SBXFLGEXECUTADO').AsInteger = 0 then
      begin
         MsgDlg('Termo de Seleção não executado!','Erro', mtError, [mbOk], 0);
         bbtnTermo.SetFocus;
      end;
      if not cdsSelTermo.FieldByName('SBXDTAEXECUTADO').IsNull then
         if edDataMov.Date <> cdsSelTermo.FieldByName('SBXDTAEXECUTADO').AsDateTime then
            edDataMov.Date := cdsSelTermo.FieldByName('SBXDTAEXECUTADO').AsDateTime;
   end else
   begin
      bbtnTermo.SetFocus;
   end;
end;
//========================================================================================
procedure TfrmMTEstornaMovimentacoes.dbgAcrescimosDblClick(Sender: TObject);
begin
   inherited;
   nIdAcrescimo := cdsAcrescimos.FieldByName('IDACRESCIMO').AsFloat;
   cdsAcrescimos.First;
   while not cdsAcrescimos.EOF do
   begin
      cdsAcrescimos.Edit;
      if cdsAcrescimos.FieldByname('IDACRESCIMO').AsFloat = nIdAcrescimo then
         cdsAcrescimos.FieldByname('MARCADO').AsInteger := 1
      else
         cdsAcrescimos.FieldByname('MARCADO').AsInteger := 0;
      cdsAcrescimos.Post;
      //----------------------------------------------------------------------------------
      cdsAcrescimos.Next;
   end;
   if not cdsAcrescimos.Locate('IDACRESCIMO',nIdAcrescimo,[]) then
      MsgDlg('Erro durante a seleção do acréscimo de valor!','Erro',mtError,[mbOk],0);
end;
//========================================================================================
procedure TfrmMTEstornaMovimentacoes.pgctlEstornoChanging(Sender: TObject; var AllowChange: Boolean);
begin
   inherited;
   AllowChange := (cmbControle.Text = 'Transferência de Bens') or
                  (cmbControle.Text = 'Baixa') or
                  (cmbControle.Text = 'Reavaliação') or
                  (cmbControle.Text = '');
end;
//========================================================================================
procedure TfrmMTEstornaMovimentacoes.bbtnConfirmarClick(Sender: TObject);
var
   sTipoMov : String;
begin
   inherited;
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
   Screen.Cursor := crSQLWait;
   //-------------------------------------------------------------------------------------
   try
      if cmbControle.Text = '' then
         Raise Exception.Create('Selecione a Movimentação que será estornada!');
      //----------------------------------------------------------------------------------
      if edDataMov.Text = '' then
         Raise Exception.Create('Selecione a Data da Movimentação que será estornada! ');
      //----------------------------------------------------------------------------------
      // Validação dos campos para estorno da movimentacao de um bem
      //----------------------------------------------------------------------------------
      if pgctlEstorno.ActivePage = TabBem then
      begin
         if cdsSelBem.IsEmpty then
            Raise Exception.Create('Selecione o Bem cuja Movimentação será Estornada!');
         //-------------------------------------------------------------------------------
         // Confere se existe a movimentação selecionada na data especificada para o bem
         // selecionado
         //-------------------------------------------------------------------------------
         if cmbControle.Text = 'Entrada' then
            sTipoMov := '01,03'
         else
         if cmbControle.Text = 'Transferência de Bens' then
            sTipoMov := '05,11,12'
         else
         if cmbControle.Text = 'Baixa' then
            sTipoMov := '06,25,24,26,20,28,27,29,37,38,39,40'
         else
         if cmbControle.Text = 'Reavaliação' then
            sTipoMov := '08,53,54'
         else
         if cmbControle.Text = 'Acréscimo de Valor' then
            //sTipoMov := '09' // Helen - SOL: 142551 KTN: 911676
            sTipoMov := '09,95'
         else
         if cmbControle.Text = 'Remembramento' then
            sTipoMov := '10'
         else
         if cmbControle.Text = 'Desmembramento' then
            sTipoMov := '13,25,24,26,20,28,27,29,37,38,39,40';
         //-------------------------------------------------------------------------------
         sqlVerificaMov.SQL.Add(' AND (IDTIPOMOVIMENTACAO IN ('+ sTipoMov + '))');
         sqlVerificaMov.Prepare;
         sqlVerificaMov.ParambyName('IDPESSOA').AsFloat := cdsSelBem.FieldByName('IDPESSOA').AsFloat;
         sqlVerificaMov.ParambyName('IDBEM').AsFloat    := cdsSelBem.FieldByName('IDBEM').AsFloat;
         sqlVerificaMov.ParambyName('DATAMOV').AsDateTime := edDataMov.Date;
         sqlVerificaMov.Open;
         if cdsVerificaMov.IsEmpty then
         begin
            if cmbControle.Text = 'Remembramento' then
            begin
               Raise Exception.Create('Não existe Entrada por ' + cmbControle.Text + ' do bem ' + edPlaca.Text + ' na data fornecida!');
            end else
            begin
               Raise Exception.Create('Não existe ' + cmbControle.Text + ' do bem ' + edPlaca.Text + ' na data fornecida!');
            end;
         end;
         cdsVerificaMov.Close;
      end else
      //----------------------------------------------------------------------------------
      // Validação dos campos para estorno de termo de seleção
      //----------------------------------------------------------------------------------
      if pgctlEstorno.ActivePage = TabSelBem then
      begin
         if dbeTermo.Text = '' then
            Raise Exception.Create('Selecione um Termo de Seleção!');
         //-------------------------------------------------------------------------------
         if not cdsSelTermo.FieldByName('SBXDTAEXECUTADO').IsNull then
            if edDataMov.Date <> cdsSelTermo.FieldByName('SBXDTAEXECUTADO').AsDateTime then
               edDataMov.Date := cdsSelTermo.FieldByName('SBXDTAEXECUTADO').AsDateTime;
      end;
      //----------------------------------------------------------------------------------
      // Executa o estorno selecionado
      //----------------------------------------------------------------------------------
      if cmbControle.Text = 'Entrada' then
      begin
         if not EstornaEntrada then
            Raise Exception.Create(MessageInfo);
      end else
      //----------------------------------------------------------------------------------
      if cmbControle.Text = 'Transferência de Bens' then
      begin
         if not EstornaTransferencia then
            Raise Exception.Create(MessageInfo);
      end else
      //----------------------------------------------------------------------------------
      if cmbControle.Text = 'Baixa' then
      begin
         if not EstornaBaixa then
            Raise Exception.Create(MessageInfo);
      end else
      //----------------------------------------------------------------------------------
      if cmbControle.Text = 'Reavaliação' then
      begin
         if not EstornaReavaliacao then
            Raise Exception.Create(MessageInfo);
      end else
      //----------------------------------------------------------------------------------
      if cmbControle.Text = 'Acréscimo de Valor' then
      begin
         if not EstornaAcrescimoValor then
            Raise Exception.Create(MessageInfo);
      end else
      //----------------------------------------------------------------------------------
      if cmbControle.Text = 'Desmembramento' then
      begin
         if not EstornaDesmembramento then
            Raise Exception.Create(MessageInfo);
      end else
      //----------------------------------------------------------------------------------
      if cmbControle.Text = 'Remembramento' then
      begin
         if not EstornaRemembramento then
            Raise Exception.Create(MessageInfo);
      end;
      //----------------------------------------------------------------------------------
      MsgDlg('Movimentação Estornada!','Informação',mtInformation,[mbOk],0)
   except
      On E : Exception do
      begin
         Screen.Cursor := crDefault;
         MsgDlg('Movimentação Não Estornada!' + #13 + #13 + 'Causa : ' + E.Message,
                'Erro',mtError,[mbOk],0);
      end;
   end;
   //-------------------------------------------------------------------------------------
   Screen.Cursor := crDefault;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
   cmbControle.SetFocus;
end;
//========================================================================================
function TfrmMTEstornaMovimentacoes.EstornaEntrada: Boolean;
begin
   try
      if not Bem.EstornaEntrada(Sistema.IdModulo,
                                cdsSelBem.FieldByName('IDPESSOA').AsInteger,
                                Sistema.IdUsuario,
                                cdsSelBem.FieldByName('IDBEM').AsInteger,
                                edDataMov.Date,edDataMov.Date,0) then
         Raise Exception.Create(Bem.MessageInfo);
      Result := True;
   except
      On E : Exception Do
      begin
         Result := False;
         MessageInfo := E.Message;
      end;
   end;
end;
//========================================================================================
function TfrmMTEstornaMovimentacoes.EstornaAcrescimoValor: Boolean;
var
   MovAcrescimoValor : TCtrlMovAcrescimoValor;
begin
   MovAcrescimoValor := TCtrlMovAcrescimoValor.Create;
   MovAcrescimoValor.InitializeAs(Padroes);
   try
      Result := True;
      try
         if not MovAcrescimoValor.EstornaAcrescimoValor(Sistema.IdModulo,
                                                        cdsSelBem.FieldByName('IDPESSOA').AsFloat,
                                                        Sistema.IdUsuario,
                                                        cdsSelBem.FieldByName('IDBEM').AsFloat,
                                                        nIdAcrescimo,
                                                        edDataMov.Date, edDataMov.Date) then
            Raise Exception.Create(MovAcrescimoValor.MessageInfo);
      except
         On E : Exception Do
         begin
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
   finally
      MovAcrescimoValor.Free;
   end;
end;
//========================================================================================
function TfrmMTEstornaMovimentacoes.EstornaBaixa: Boolean;
var
   MovBaixa : TCtrlMovBaixa;
begin
   MovBaixa := TCtrlMovBaixa.Create;
   MovBaixa.InitializeAs(Padroes);
   try
      Result := True;
      try
         if cdsSelTermo.IsEmpty then
         begin
            if not MovBaixa.EstornaBaixa(Sistema.IdModulo,
                                         cdsSelBem.FieldByName('IDPESSOA').AsInteger,
                                         Sistema.IdUsuario,
                                         cdsSelBem.FieldByName('IDBEM').AsInteger,
                                         edDataMov.Date, edDataMov.Date) then
               Raise Exception.Create(MovBaixa.MessageInfo);
         end else
         //-------------------------------------------------------------------------------
         begin
            if not MovBaixa.EstornaTermoBaixa(Sistema.IdModulo,
                                              cdsSelTermo.FieldByName('IDPESSOA').AsInteger,
                                              Sistema.IdUsuario,
                                              cdsSelTermo.FieldByName('IDSELBAIXA').AsInteger,
                                              edDataMov.Date, edDataMov.Date) then
               Raise Exception.Create(MovBaixa.MessageInfo);
         end;
      except
         On E : Exception Do
         begin
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
   finally
      MovBaixa.Free;
   end;
end;
//========================================================================================
function TfrmMTEstornaMovimentacoes.EstornaReavaliacao: Boolean;
var
   MovReavaliacao : TCtrlMovReavaliacao;
begin
   MovReavaliacao := TCtrlMovReavaliacao.Create;
   MovReavaliacao.InitializeAs(Padroes);
   try
      Result := True;
      try
         if cdsSelTermo.IsEmpty then
         begin
            sqlVerificaTipoReaval.Prepare;
            sqlVerificaTipoReaval.ParambyName('IDPESSOA').AsFloat := cdsSelBem.FieldByName('IDPESSOA').AsFloat;
            sqlVerificaTipoReaval.ParambyName('IDBEM').AsFloat := cdsSelBem.FieldByName('IDBEM').AsFloat;
            sqlVerificaTipoReaval.ParambyName('DATAMOV').AsDateTime := edDataMov.Date;
            sqlVerificaTipoReaval.Open;
            if cdsVerificaTipoReaval.IsEmpty then                           // Método TaxaDep
            begin
               if not MovReavaliacao.EstornaReavaliacao(Sistema.IdModulo,
                                                        cdsSelBem.FieldByName('IDPESSOA').AsInteger,
                                                        Sistema.IdUsuario,
                                                        cdsSelBem.FieldByName('IDBEM').AsInteger,
                                                        edDataMov.Date, edDataMov.Date) then
                   Raise Exception.Create(MovReavaliacao.MessageInfo);
            end else                                                       // Método BaixaDep
            begin
               if not MovReavaliacao.EstornaReavaliacaoII(Sistema.IdModulo,
                                                          cdsSelBem.FieldByName('IDPESSOA').AsInteger,
                                                          Sistema.IdUsuario,
                                                          cdsSelBem.FieldByName('IDBEM').AsInteger,
                                                          edDataMov.Date, edDataMov.Date) then
                  Raise Exception.Create(MovReavaliacao.MessageInfo);
            end;
         end else
         //-------------------------------------------------------------------------------
         begin
            if not MovReavaliacao.EstornaTermoReaval(Sistema.IdModulo,
                                                     cdsSelTermo.FieldByName('IDPESSOA').AsInteger,
                                                     Sistema.IdUsuario,
                                                     cdsSelTermo.FieldByName('IDSELBAIXA').AsInteger,
                                                     edDataMov.Date, edDataMov.Date) then
               Raise Exception.Create(MovReavaliacao.MessageInfo);
         end;
      except
         On E : Exception Do
         begin
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
   finally
      MovReavaliacao.Free;

   end;
end;
//========================================================================================
function TfrmMTEstornaMovimentacoes.EstornaDesmembramento: Boolean;
var
   MovDesmembramento : TCtrlMovDesmembramento;
begin
   MovDesmembramento := TCtrlMovDesmembramento.Create;
   MovDesmembramento.InitializeAs(Padroes);
   try
      Result := True;
      try
         if not MovDesmembramento.EstornaDesmembramento(Sistema.IdModulo,
                                                        cdsSelBem.FieldByName('IDPESSOA').AsInteger,
                                                        Sistema.IdUsuario,
                                                        cdsSelBem.FieldByName('IDBEM').AsInteger,
                                                        edDataMov.Date, edDataMov.Date) then
            Raise Exception.Create(MovDesmembramento.MessageInfo);
      except
         On E : Exception Do
         begin
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
   finally
      MovDesmembramento.Free;
   end;
end;
//========================================================================================
function TfrmMTEstornaMovimentacoes.EstornaRemembramento: Boolean;
var
   MovRemembramento : TCtrlMovRemembramento;
begin
   MovRemembramento := TCtrlMovRemembramento.Create;
   MovRemembramento.InitializeAs(Padroes);
   try
      Result := True;
      try
         if not MovRemembramento.EstornaRemembramento(Sistema.IdModulo,
                                                      cdsSelBem.FieldByName('IDPESSOA').AsInteger,
                                                      Sistema.IdUsuario,
                                                      cdsSelBem.FieldByName('IDBEM').AsInteger,
                                                      edDataMov.Date, edDataMov.Date) then
            Raise Exception.Create(MovRemembramento.MessageInfo);
      except
         On E : Exception Do
         begin
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
   finally
      MovRemembramento.Free;
   end;
end;
//========================================================================================
function TfrmMTEstornaMovimentacoes.EstornaTransferencia: Boolean;
var
   MovTransfBem : TCtrlMovTransfBem;
begin
   MovTransfBem := TCtrlMovTransfBem.Create;
   MovTransfBem.InitializeAs(Padroes);
   try
      Result := True;
      try
         if cdsSelTermo.IsEmpty then
         begin
            if not MovTransfBem.EstornaTransferencia(Sistema.IdModulo,
                                                     cdsSelBem.FieldByName('IDPESSOA').AsInteger,
                                                     Sistema.IdUsuario,
                                                     cdsSelBem.FieldByName('IDBEM').AsInteger,
                                                     edDataMov.Date, edDataMov.Date, 0) then
               Raise Exception.Create(MovTransfBem.MessageInfo);
         end else
         //-------------------------------------------------------------------------------
         begin
            if not MovTransfBem.EstornaTermoTransferencia(Sistema.IdModulo,
                                                          cdsSelTermo.FieldByName('IDPESSOA').AsInteger,
                                                          Sistema.IdUsuario,
                                                          cdsSelTermo.FieldByName('IDSELBAIXA').AsInteger,
                                                          edDataMov.Date, edDataMov.Date) then
               Raise Exception.Create(MovTransfBem.MessageInfo);
         end;
      except
         On E : Exception Do
         begin
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
   finally
      MovTransfBem.Free;
   end;
end;
//========================================================================================
procedure TfrmMTEstornaMovimentacoes.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   cmbControle.SetFocus;
end;
//========================================================================================
procedure TfrmMTEstornaMovimentacoes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   cdsPlaca.Close;
   cdsSelBem.Close;
   cdsSelTermo.Close;
   cdsSelTermoBens.Close;
   cdsVerificaMov.Close;
   cdsAcrescimos.Close;
   ParamCAF.Free;
   Bem.Free;
end;

end.
