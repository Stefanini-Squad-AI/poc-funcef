unit fMTMovBaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, MAHlpBtn, StdCtrls, Buttons, IvEMulti,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, Db, DBTables, Wwquery, TREdit,
  wwdblook, ComCtrls, Grids, Wwdbigrd, Wwdbgrid, DBCtrls, Mask, wwdbedit,
  Wwdatsrc, wwdbdatetimepicker, CMDateTimePicker, CMProcuraMask,
  uCmSqlParams, DBClient, uCMClientDataSet, uCMTypes, uCtrlPadroes,
  uCtrlMovBaixa, uCtrlParamCAF, uCtrlDomBem;

type
  TfrmMTMovBaixa = class(TfrmOkCancelar)
    PnlDetalhe: TPanel;
    pgctlBaixaBem: TPageControl;
    TabBaixaBem: TTabSheet;
    Data: TLabel;
    Label26: TLabel;
    Label22: TLabel;
    Label1: TLabel;
    Label7: TLabel;
    Label17: TLabel;
    edData: TCMDateTimePicker;
    bbtnSelBem: TBitBtn;
    TabSelBaixaBem: TTabSheet;
    dbeResponsavel: TwwDBEdit;
    dbeSbxProcesso: TwwDBEdit;
    Label2: TLabel;
    Processo: TLabel;
    Label8: TLabel;
    bbtnTermoBaixa: TBitBtn;
    Label9: TLabel;
    edDataSel: TCMDateTimePicker;
    Label10: TLabel;
    dbeSbxData: TCMDateTimePicker;
    dbgSelBaixaBens: TwwDBGrid;
    Label11: TLabel;
    grbProporcaoBaixaParcial: TGroupBox;
    edPropBaixar: TRealEdit;
    lblPercentual: TLabel;
    rdgTipoCalcProp: TRadioGroup;
    GroupBox2: TGroupBox;
    cmbMotivoBaixa: TwwDBLookupCombo;
    dbeGrupoContabil: TwwDBEdit;
    Label3: TLabel;
    dsContaDestino: TwwDataSource;
    GroupBox3: TGroupBox;
    edValVenda: TRealEdit;
    edContaDestino: TCMProcuraMaskContabil;
    rdgDepProRata: TRadioGroup;
    GroupBox4: TGroupBox;
    edObsBaixa: TMemo;
    Label5: TLabel;
    lblValor: TLabel;
    dsSelBem: TwwDataSource;
    cdsSelBem: TCMClientDataSet;
    MSBem: TMontaSelect;
    cdsSelTermo: TCMClientDataSet;
    dsSelTermo: TwwDataSource;
    MSTermo: TMontaSelect;
    dsDet: TwwDataSource;
    cdsDet: TCMClientDataSet;
    sqlDet: TCMSqlParams;
    cdsContaDestino: TCMClientDataSet;
    sqlContaDestino: TCMSqlParams;
    cdsMotivoBaixa: TCMClientDataSet;
    sqlMotivoBaixa: TCMSqlParams;
    cdsPlano: TCMClientDataSet;
    sqlPlano: TCMSqlParams;
    wwDBEdit1: TwwDBEdit;
    wwDBEdit2: TwwDBEdit;
    wwDBEdit3: TwwDBEdit;
    dbeDescBem: TDBMemo;
    edTermo: TwwDBEdit;
    cdsVerificaConta: TCMClientDataSet;
    sqlVerificaConta: TCMSqlParams;
    edPlaca: TEdit;
    cdsPlaca: TCMClientDataSet;
    sqlPlaca: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure edDataExit(Sender: TObject);
    procedure bbtnSelBemClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure edValVendaExit(Sender: TObject);
    procedure bbtnTermoBaixaClick(Sender: TObject);
    procedure edDataSelExit(Sender: TObject);
    procedure rdgTipoCalcPropExit(Sender: TObject);
    procedure rdgTipoCalcPropClick(Sender: TObject);
    procedure pgctlBaixaBemChange(Sender: TObject);
    procedure edContaDestinoApertouBotao(Sender: TObject);
    procedure edContaDestinoExit(Sender: TObject);
    procedure edPlacaExit(Sender: TObject);
  private
    { Private declarations }
    sContaDestino : String;
    //------------------------------------------------------------------------------------
    MovBaixa : TCtrlMovBaixa;
    ParamCAF : TCtrlParamCAF;
    Bem : TCtrlDomBem;
    procedure SelTermoBaixa(fIdPessoa, fIdSelBaixa : Extended);
    procedure LimpaCampos;
    //------------------------------------------------------------------------------------
    procedure Progresso(vParam : Array of Variant);
  public
    { Public declarations }
  end;

var
  frmMTMovBaixa: TfrmMTMovBaixa;

implementation

uses uSistema, uMensErro, fAguarde;

{$R *.DFM}

procedure TfrmMTMovBaixa.Progresso(vParam: array of Variant);
begin
   frmAguarde.Max     := vParam[1];
   frmAguarde.Pos     := vParam[2];
   frmAguarde.Caption := vParam[3];
   Application.ProcessMessages;
end;

procedure TfrmMTMovBaixa.FormCreate(Sender: TObject);
begin
   inherited;
   MovBaixa := TCtrlMovBaixa.Create;
   MovBaixa.InitializeAs(Padroes);
   MovBaixa.Progresso := Progresso;
   //-------------------------------------------------------------------------------------
   Bem := TCtrlDomBem.Create;
   Bem.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   MSTermo.Filtro.Add('SELBAIXA.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSBem.Filtro.Add('BEM.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSBem.Filtro.Add('PLANOGRUPO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSBem.Filtro.Add('BEM.FLGSAIDATEMP = 0');
   MSBem.Filtro.Add('BEM.BAIXATOTAL <> ''S''');
   //-------------------------------------------------------------------------------------
   ParamCAF := TCtrlParamCAF.Create;
   ParamCAF.InitializeAs(Padroes);
   if not ParamCAF.CarregaProp(Sistema.IdEmpresa) then
      Raise Exception.Create('Parâmetros do sistema inválidos!');
   //-------------------------------------------------------------------------------------
   rdgTipoCalcProp.Hint := 'Se a  baixa  for parcial, selecione  se a  proporção de' + #13 +
                           'baixa  do  Saldo  Contábil será  informada (Percentual)' + #13 +
                           'ou será calculada usando-se um valor contábil informado.|';
   rdgTipoCalcProp.ShowHint := True;
   //-------------------------------------------------------------------------------------
   edData.Date              := date();
   edPropBaixar.Value       := 100;
   pgctlBaixaBem.ActivePage := TabSelBaixaBem;
   //-------------------------------------------------------------------------------------
   cdsPlano.Close;
   sqlPlano.Prepare;
   sqlPlano.ParamByName('PPLANO').AsInteger := ParamCAF.PLANOVIGENTE;
   sqlPlano.Open;
   edContaDestino.Mascara   := trim(cdsPlano.FieldByName('MASCARA').AsString);
   edContaDestino.Plano     := ParamCAF.PLANOVIGENTE;
   edContaDestino.Enabled   := False;
   //-------------------------------------------------------------------------------------
   sqlMotivoBaixa.Open;
   //-------------------------------------------------------------------------------------
   rdgTipoCalcProp.ItemIndex := 0;
   lblPercentual.Visible := True;
   lblValor.Visible := False;
   grbProporcaoBaixaParcial.Caption := 'Percentual do Saldo Contábil';
end;
//========================================================================================
procedure TfrmMTMovBaixa.pgctlBaixaBemChange(Sender: TObject);
begin
   inherited;
   edContaDestino.Enabled := (pgctlBaixaBem.ActivePage = TabBaixaBem);
end;
//========================================================================================
procedure TfrmMTMovBaixa.SelTermoBaixa(fIdPessoa, fIdSelBaixa : Extended);
begin
   cdsSelTermo.Data := MovBaixa.ListaSelBaixa(fIdPessoa,fIdSelBaixa);
   if not cdsSelTermo.IsEmpty then
   begin
      sqlDet.Prepare;
      sqlDet.ParamByName('IDPESSOA').AsFloat   := fIdPessoa;
      sqlDet.ParamByName('IDSELBAIXA').AsFloat := fIdSelBaixa;
      sqlDet.ParamByName('DATASLD').AsDate     := cdsSelTermo.FieldByName('SBXDATA').AsDateTime;
      sqlDet.ParamByName('MOECODIGO').AsFloat  := ParamCAF.MOEDAOFICIAL;
      sqlDet.ParamByName('IDTAXADEP').AsFloat  := 1;                             // BRASIL
      sqlDet.Open;
   end else
   begin
      sqlDet.Prepare;
      sqlDet.ParamByName('IDPESSOA').AsFloat   := 0;
      sqlDet.ParamByName('IDSELBAIXA').AsFloat := 0;
      sqlDet.ParamByName('DATASLD').AsDate     := 0;
      sqlDet.ParamByName('MOECODIGO').AsFloat  := ParamCAF.MOEDAOFICIAL;
      sqlDet.ParamByName('IDTAXADEP').AsFloat  := 1;                             // BRASIL
      sqlDet.Open;
   end;
end;   
//========================================================================================
procedure TfrmMTMovBaixa.LimpaCampos;
begin
   cdsSelBem.Close;
   edPlaca.Text := '';
   SelTermoBaixa(Sistema.IdEmpresa,0);
   //-------------------------------------------------------------------------------------
   cmbMotivoBaixa.Text := '';
   edPropBaixar.Value  := 100;
   edValVenda.Value    := 0;
   edObsBaixa.Text     := '';
   cdsContaDestino.Close;
   edContaDestino.Clear;
   sContaDestino       := '';
end;
//========================================================================================
procedure TfrmMTMovBaixa.edDataExit(Sender: TObject);
begin
   inherited;
   if bbtnCancelar.Focused or bbtnSair.Focused then
      exit;
   //-------------------------------------------------------------------------------------
   if edData.Text = '' then
   begin
      MsgDlg('Preencha o campo Data da Movimentação','Erro',mtError,[mbOk],0);
      edData.SetFocus;
   end;
end;
//========================================================================================
procedure TfrmMTMovBaixa.edDataSelExit(Sender: TObject);
begin
   inherited;
   if bbtnCancelar.Focused or bbtnSair.Focused then
      exit;
   //-------------------------------------------------------------------------------------
   if edDataSel.Text = '' then
   begin
      MsgDlg('Preencha o campo Data da Movimentação','Erro',mtError,[mbOk],0);
      edDataSel.SetFocus;
   end else
   begin
      pgctlBaixaBem.Enabled := False;
      pnlDetalhe.SetFocus;
   end;
end;
//========================================================================================
procedure TfrmMTMovBaixa.bbtnTermoBaixaClick(Sender: TObject);
begin
   inherited;
   LimpaCampos;
   MSTermo.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSTermo.RetornouValor then
   begin
      SelTermoBaixa(strtofloat(MSTermo.ValoresChave[1]),strtofloat(MSTermo.ValoresChave[0]));
      //----------------------------------------------------------------------------------
      if cdsSelTermo.FieldByName('SBXFLGEXECUTADO').AsInteger = 1 then
      begin
         MsgDlg('Termo de Baixa executado em ' + cdsSelTermo.FieldByName('SBXDTAEXECUTADO').AsString,
                'Erro', mtError, [mbOk], 0);
         LimpaCampos;
         bbtnTermoBaixa.SetFocus;
      end else
      begin
         edDataSel.Date := cdsSelTermo.FieldByName('SBXDATA').AsDateTime;
         edDataSel.SetFocus;
      end;
   end else
   begin
      LimpaCampos;
      bbtnTermoBaixa.SetFocus;
   end;
end;
//========================================================================================
procedure TfrmMTMovBaixa.edPlacaExit(Sender: TObject);
begin
   inherited;
   if edPlaca.Text <> '' then
   begin
      sqlPlaca.Prepare;
      sqlPlaca.ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
      sqlPlaca.ParamByName('PLACA').AsFloat := StrToFloat(edPlaca.Text);
      sqlPlaca.Open;
      if not cdsPlaca.isEmpty then
      begin
         cdsSelBem.Data  := Bem.ListaBem(cdsPlaca.FieldByName('IDPESSOA').AsFloat,
                                         cdsPlaca.FieldByName('IDBEM').AsFloat);
         if cdsSelBem.IsEmpty then
         begin
            MsgDlg('Bem já baixado ou com controle físico.','Erro',mtError,[mbOk],0);
            LimpaCampos;
            edData.SetFocus;
         end else
         begin
            if cdsSelBem.FieldByName('FLGPENHORA').AsInteger = 1 then
            begin
               MsgDlg('Bem penhorado.','Erro',mtError,[mbOk],0);
               LimpaCampos;
               edData.SetFocus;
            end else
            if cdsSelBem.FieldByName('BAIXATOTAL').AsString = 'S' then
            begin
               MsgDlg('Bem já baixado ou com controle físico.','Erro',mtError,[mbOk],0);
               LimpaCampos;
               edData.SetFocus;
            end else
            if cdsSelBem.FieldByName('FLGSAIDATEMP').AsInteger = 1 then
            begin
               MsgDlg('Bem em Saída Temporária.','Erro',mtError,[mbOk],0);
               LimpaCampos;
               edData.SetFocus;
            end else
            begin
               cdsContaDestino.Close;
               sqlContaDestino.Prepare;
               sqlContaDestino.ParamByName('IDGRUPO').AsInteger            := cdsSelBem.FieldByName('IDGRUPO').AsInteger;
               sqlContaDestino.ParamByName('IDTIPOMOVIMENTACAO').AsInteger := 06;  // Baixa Custo
               sqlContaDestino.ParamByName('TIPOLANCAMENTO').AsString      := 'D'; // Conta Saída Padrão
               sqlContaDestino.ParamByName('PLANO').AsInteger              := ParamCAF.PLANOVIGENTE;
               sqlContaDestino.Open;
               sContaDestino := cdsContaDestino.FieldByName('PLACONTA').AsString;
               //-------------------------------------------------------------------------
               pgctlBaixaBem.Enabled := False;
               pnlDetalhe.SetFocus;
            end;
         end;
      end else
      begin
         MsgDlg('Placa não Cadastrada!','Erro',mtError,[mbOk],0);
         LimpaCampos;
         edData.SetFocus;
      end;
   end;
end;
//========================================================================================
procedure TfrmMTMovBaixa.bbtnSelBemClick(Sender: TObject);
begin
   inherited;
   LimpaCampos;
   MSBem.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSBem.RetornouValor then
   begin
      cdsSelBem.Data := Bem.ListaBem(strtofloat(MSBem.ValoresChave[0]),strtofloat(MSBem.ValoresChave[1]));
      edPlaca.Text := cdsSelBem.FieldByName('PLACA').AsString;
      if cdsSelBem.IsEmpty then
      begin
         MsgDlg('Bem já baixado ou com controle físico.','Erro',mtError,[mbOk],0);
         LimpaCampos;
         edData.SetFocus;
      end else
      begin
         if cdsSelBem.FieldByName('FLGPENHORA').AsInteger = 1 then
         begin
            MsgDlg('Bem Penhorado.','Erro',mtError,[mbOk],0);
            LimpaCampos;
            edData.SetFocus;
         end else
         if cdsSelBem.FieldByName('BAIXATOTAL').AsString = 'S' then
         begin
            MsgDlg('Bem já baixado ou com controle físico.','Erro',mtError,[mbOk],0);
            LimpaCampos;
            edData.SetFocus;
         end else
         if cdsSelBem.FieldByName('FLGSAIDATEMP').AsInteger = 1 then
         begin
            MsgDlg('Bem em Saída Temporária.','Erro',mtError,[mbOk],0);
            LimpaCampos;
            edData.SetFocus;
         end else
         begin
            cdsContaDestino.Close;
            sqlContaDestino.Prepare;
            sqlContaDestino.ParamByName('IDGRUPO').AsInteger := cdsSelBem.FieldByName('IDGRUPO').AsInteger;
            sqlContaDestino.ParamByName('IDTIPOMOVIMENTACAO').AsInteger := 06; // Baixa Custo
            sqlContaDestino.ParamByName('TIPOLANCAMENTO').AsString := 'D'; // Conta Saída Padrão
            sqlContaDestino.ParamByName('PLANO').AsInteger := ParamCAF.PLANOVIGENTE;
            sqlContaDestino.Open;
            sContaDestino := cdsContaDestino.FieldByName('PLACONTA').AsString;
            //----------------------------------------------------------------------------
            pgctlBaixaBem.Enabled := False;
            pnlDetalhe.SetFocus;
         end;
      end;
   end else
   begin
      LimpaCampos;
      edData.SetFocus;
   end;
end;
//========================================================================================
procedure TfrmMTMovBaixa.edValVendaExit(Sender: TObject);
begin
   inherited;
   if pgctlBaixaBem.ActivePage <> TabSelBaixaBem then
   begin
      if edValVenda.Value <= 0 then
      begin
         MsgDlg('O Valor da Venda está Zerado. Se o motivo da baixa for Venda/Alienação, '+
                'é obrigatório informar o valor da venda, para a apuração de resultado! ',
                'Atenção',mtWarning,[mbOk],0);
      end;
   end;
end;
//========================================================================================
procedure TfrmMTMovBaixa.rdgTipoCalcPropExit(Sender: TObject);
begin
   inherited;
   if rdgTipoCalcProp.ItemIndex = 0 then
   begin
      lblPercentual.Visible := True;
      lblValor.Visible := False;
      grbProporcaoBaixaParcial.Caption := 'Percentual do Saldo Contábil';
   end else
   if rdgTipoCalcProp.ItemIndex = 1 then
   begin
      lblPercentual.Visible := False;
      lblValor.Visible := True;
      grbProporcaoBaixaParcial.Caption := ' Valor sobre Saldo Contábil ';
   end else
   if rdgTipoCalcProp.ItemIndex = 2 then
   begin
      lblPercentual.Visible := False;
      lblValor.Visible := True;
      grbProporcaoBaixaParcial.Caption := ' Valor sobre Custo Aquisição';
   end;
end;
//========================================================================================
procedure TfrmMTMovBaixa.rdgTipoCalcPropClick(Sender: TObject);
begin
   inherited;
   if rdgTipoCalcProp.ItemIndex = 0 then
   begin
      lblPercentual.Visible := True;
      lblValor.Visible := False;
      grbProporcaoBaixaParcial.Caption := 'Percentual do Saldo Contábil';
      edPropBaixar.Value := 100;
   end else
   if rdgTipoCalcProp.ItemIndex = 1 then
   begin
      lblPercentual.Visible := False;
      lblValor.Visible := True;
      grbProporcaoBaixaParcial.Caption := ' Valor sobre Saldo Contábil ';
      edPropBaixar.Value := 0;
   end else
   if rdgTipoCalcProp.ItemIndex = 2 then
   begin
      lblPercentual.Visible := False;
      lblValor.Visible := True;
      grbProporcaoBaixaParcial.Caption := ' Valor sobre Custo Aquisição';
      edPropBaixar.Value := 0;
   end;
end;
//========================================================================================
procedure TfrmMTMovBaixa.edContaDestinoApertouBotao(Sender: TObject);
begin
   inherited;
   cdsContaDestino.Edit;
end;
//========================================================================================
procedure TfrmMTMovBaixa.edContaDestinoExit(Sender: TObject);
begin
   inherited;
   sqlVerificaConta.Prepare;
   sqlVerificaConta.ParamByName('PLANO').AsInteger     := edContaDestino.Plano;
   sqlVerificaConta.ParamByName('PLACONTA').AsString   := edContaDestino.Conta.Numero;
   sqlVerificaConta.ParamByName('PLAINATIVA').AsString := 'A';
   sqlVerificaConta.Open;
   if cdsVerificaConta.FieldByName('PLATIPO').AsString = 'S' then
   begin
      MsgDlg('A Conta Contábil '+cdsVerificaConta.FieldByName('PLACONTA').AsString+' - '+
             cdsVerificaConta.FieldByName('PLANOME').AsString + ' do Plano '+
             cdsVerificaConta.FieldByName('PLANO').AsString + ' é Sintética!',
             'Erro',mtError,[mbOk],0);
      cdsContaDestino.Close;
      sqlContaDestino.Prepare;
      sqlContaDestino.ParamByName('IDGRUPO').AsInteger            := cdsSelBem.FieldByName('IDGRUPO').AsInteger;
      sqlContaDestino.ParamByName('IDTIPOMOVIMENTACAO').AsInteger := 06; // Baixa Custo
      sqlContaDestino.ParamByName('TIPOLANCAMENTO').AsString      := 'D'; // Conta Saída Padrão
      sqlContaDestino.ParamByName('PLANO').AsInteger              := ParamCAF.PLANOVIGENTE;
      sqlContaDestino.Open;
      edContaDestino.SetFocus;
   end;
end;
//========================================================================================
procedure TfrmMTMovBaixa.bbtnConfirmarClick(Sender: TObject);
var
   sContaContabil : String;
   fPropBaixar : Extended;
   fValVenda : Currency;

begin
   inherited;
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
   sContaContabil := '';
   //-------------------------------------------------------------------------------------
   if pgctlBaixaBem.ActivePage = TabBaixaBem then
   begin
      if edData.Text = '' then
      begin
         MsgDlg('Data da Movimentação não pode estar vazia! ','Erro',mtError,[mbOk],0);
         bbtnConfirmar.Enabled := True;
         bbtnCancelar.Enabled  := True;
         pgctlBaixaBem.Enabled := True;
         edData.SetFocus;
         exit;
      end;
      //----------------------------------------------------------------------------------
      if edPlaca.Text = '' then
      begin
         MsgDlg('Selecione um bem! ','Erro',mtError,[mbOk],0);
         bbtnConfirmar.Enabled := True;
         bbtnCancelar.Enabled  := True;
         pgctlBaixaBem.Enabled := True;
         edData.SetFocus;
         exit;
      end;
      //----------------------------------------------------------------------------------
      if cmbMotivoBaixa.Text = '' then
      begin
         MsgDlg('Selecione o Motivo da Baixa do bem! ','Erro',mtError,[mbOk],0);
         bbtnConfirmar.Enabled := True;
         bbtnCancelar.Enabled  := True;
         cmbMotivoBaixa.SetFocus;
         exit;
      end;
      //----------------------------------------------------------------------------------
      if rdgTipoCalcProp.ItemIndex = 0 then
      begin
         if (edPropBaixar.Value <= 0) or (edPropBaixar.Value > 100) then
         begin
            MsgDlg('Selecione a Proporção da Baixa do bem! ','Erro',mtError,[mbOk],0);
            bbtnConfirmar.Enabled := True;
            bbtnCancelar.Enabled  := True;
            cmbMotivoBaixa.SetFocus;
            exit;
         end;
      end else
      begin
         if edPropBaixar.Value < 0 then
         begin
            MsgDlg('Valor para Baixa Parcial está inválido! ','Erro',mtError,[mbOk],0);
            bbtnConfirmar.Enabled := True;
            bbtnCancelar.Enabled  := True;
            cmbMotivoBaixa.SetFocus;
            exit;
         end;
      end;
      //----------------------------------------------------------------------------------
      if edObsBaixa.Text = '' then
      begin
         MsgDlg('Informe os detalhes relevantes da Baixa do Bem! ','Erro',mtError,[mbOk],0);
         bbtnConfirmar.Enabled := True;
         bbtnCancelar.Enabled  := True;
         cmbMotivoBaixa.SetFocus;
         exit;
      end;
      //----------------------------------------------------------------------------------
      if trim(edContaDestino.Conta.Numero) <> sContaDestino then
         sContaContabil := trim(edContaDestino.Conta.Numero);
      //----------------------------------------------------------------------------------
      Screen.Cursor := crSQLWait;
      fPropBaixar := edPropBaixar.Value;
      fValVenda   := edValVenda.Value;
      if MovBaixa.ExecutaBaixa(Sistema.IdModulo, Sistema.IdEmpresa, Sistema.IdUsuario,
                               cdsSelBem.FieldByName('IDBEM').AsFloat,
                               cdsMotivoBaixa.FieldByName('IDMOTIVOBAIXA').AsInteger,
                               edData.Date, rdgTipoCalcProp.ItemIndex,
                               fPropBaixar, fValVenda, edObsBaixa.Text,
                               sContaContabil, rdgDepProRata.ItemIndex) then
      begin
         MsgDlg('Movimentação Realizada!', 'Atenção', mtInformation, [mbOk], 0);
         Screen.Cursor := crDefault;
      end else
      begin
         MsgDlg('Movimentação não Realizada!' + #13 + #13 +
                'Causa : ' + MovBaixa.MessageInfo, 'Erro', mtError, [mbOk], 0);
         Screen.Cursor := crDefault;
      end;
      //----------------------------------------------------------------------------------
      LimpaCampos;
      pgctlBaixaBem.Enabled    := True;
      pgctlBaixaBem.ActivePage := TabBaixaBem;
      edData.SetFocus;
   end else
   //-------------------------------------------------------------------------------------
   // Processa um termo de seleção de baixa
   //-------------------------------------------------------------------------------------
   begin
      if edDataSel.Text = '' then
      begin
         MsgDlg('Data da Movimentação não pode estar vazia! ','Erro',mtError,[mbOk],0);
         bbtnConfirmar.Enabled := True;
         bbtnCancelar.Enabled  := True;
         pgctlBaixaBem.Enabled := True;
         edDataSel.SetFocus;
         exit;
      end;
      //----------------------------------------------------------------------------------
      if edTermo.Text = '' then
      begin
         MsgDlg('Selecione um Termo de Seleção de Baixa! ','Erro',mtError,[mbOk],0);
         bbtnConfirmar.Enabled := True;
         bbtnCancelar.Enabled  := True;
         pgctlBaixaBem.Enabled := True;
         edTermo.SetFocus;
         exit;
      end;
      //----------------------------------------------------------------------------------
      if cmbMotivoBaixa.Text = '' then
      begin
         MsgDlg('Selecione o Motivo da Baixa do bem! ','Erro',mtError,[mbOk],0);
         bbtnConfirmar.Enabled := True;
         bbtnCancelar.Enabled  := True;
         cmbMotivoBaixa.SetFocus;
         exit;
      end;
      //----------------------------------------------------------------------------------
      if rdgTipoCalcProp.ItemIndex = 0 then
      begin
         if (edPropBaixar.Value <= 0) or (edPropBaixar.Value > 100) then
         begin
            MsgDlg('Selecione a Proporção da Baixa do bem! ','Erro',mtError,[mbOk],0);
            bbtnConfirmar.Enabled := True;
            bbtnCancelar.Enabled  := True;
            cmbMotivoBaixa.SetFocus;
            exit;
         end;
      end else
      begin
         if edPropBaixar.Value < 0 then
         begin
            MsgDlg('Valor da Baixa parcial está inválido! ','Erro',mtError,[mbOk],0);
            bbtnConfirmar.Enabled := True;
            bbtnCancelar.Enabled  := True;
            cmbMotivoBaixa.SetFocus;
            exit;
         end;
      end;
      //----------------------------------------------------------------------------------
      if edObsBaixa.Text = '' then
      begin
         MsgDlg('Informe os detalhes relevantes da Baixa do Bem! ','Erro',mtError,[mbOk],0);
         bbtnConfirmar.Enabled := True;
         bbtnCancelar.Enabled  := True;
         cmbMotivoBaixa.SetFocus;
         exit;
      end;
      //----------------------------------------------------------------------------------
      frmAguarde.Min := 0;
      frmAguarde.Max := cdsDet.RecordCount;
      frmAguarde.Mostra('Baixando os Bens do Termo');
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      MovBaixa.CreateThreadProgresso;
      try
         fPropBaixar := edPropBaixar.Value;
         fValVenda   := edValVenda.Value;
         if MovBaixa.ExecutaTermoBaixa(Sistema.IdModulo, Sistema.IdEmpresa, Sistema.IdUsuario,
                                       cdsSelTermo.FieldByName('IDSELBAIXA').AsFloat,
                                       cdsMotivoBaixa.FieldByName('IDMOTIVOBAIXA').AsInteger,
                                       edDataSel.Date, rdgTipoCalcProp.ItemIndex,
                                       fPropBaixar, fValVenda, edObsBaixa.Text,
                                       sContaContabil, rdgDepProRata.ItemIndex,
                                       MovBaixa.ProgressFileName) then
         begin
            frmAguarde.Apaga;
            MsgDlg('Movimentação Realizada!','Atenção',mtInformation,[mbOk],0);
         end else
         begin
            frmAguarde.Apaga;
            MsgDlg('Movimentação não Realizada!' + #13 +
                   'Causa : ' + MovBaixa.MessageInfo,
                   'Erro', mtError, [mbOk], 0);
         end;
      finally
         MovBaixa.FreeThreadProgresso;
      end;
      //----------------------------------------------------------------------------------
      LimpaCampos;
      pgctlBaixaBem.Enabled    := True;
      pgctlBaixaBem.ActivePage := TabSelBaixaBem;
      bbtnTermoBaixa.SetFocus;
   end;
   bbtnConfirmar.Enabled  := True;
   bbtnCancelar.Enabled   := True;
end;
//========================================================================================
procedure TfrmMTMovBaixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   MovBaixa.Free;
   Bem.Free;
   ParamCAF.Free;
   cdsSelTermo.Close;
   cdsSelBem.Close;
   cdsDet.Close;
   cdsMotivoBaixa.Close;
   cdsPlano.Close;
   cdsContaDestino.Close;
end;
//========================================================================================
procedure TfrmMTMovBaixa.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   LimpaCampos;
   pgctlBaixaBem.Enabled    := True;
   pgctlBaixaBem.ActivePage := TabSelBaixaBem;
   bbtnConfirmar.Enabled    := True;
   bbtnTermoBaixa.SetFocus;
end;

end.

