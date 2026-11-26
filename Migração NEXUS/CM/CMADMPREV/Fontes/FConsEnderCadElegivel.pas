{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
//******************************************************************************
Nº SIG:.............: 136301 
Data da Alteração...: 26/05/2023
Responsável.........: Cássio Florencio Rovaroto
Descrição...........: Atribuição automática do nome do endereço.
--------------------------------------------------------------------------------
Nº SIG:.............: 136187 
Data da Alteração...: 23/05/2023
Responsável.........: Cássio Florencio Rovaroto
Descrição...........: Readequação nas alterações do nome do endereço, pelo
                      Cadastro Previdenciário.
--------------------------------------------------------------------------------
//Rotina:RetornaValoresCadDepenBenef, RetornaValoresCadElegivel
//Nº SOL:  237166_16404
//Nº PPM: 481817
//Data da Alteração: 14/08/2014
//Alteração Form: Não foi efetuada alteração de Form
//Responsável: Sadi Freire
//Descrição: RetornaValoresCadDepenBenef, RetornaValoresCadElegivel
//******************************************************************************
-------------------------------------------------------------------------------
Pendência   : SOL 164168/11242 KINTANA 1793508
Responsável : TADEU PASSOS
Descrição   : Implementação Inicial para realizar a Consulta geral de endereços.
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FConsEnderCadElegivel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, Db, DBTables, Wwquery, Mask, DBCtrls,
  Grids, Wwdbigrd, Wwdbgrid, DBClient, Provider, uCMClientDataSet,
  uCmSqlParams, Wwdatsrc, Clipbrd;

const
   vQL = #13+#10;

type
   TfrmConsEnderCadElegivel = class(TfrmSairAjuda)
      pgctrlBusca: TPageControl;
      tbsBusca: TTabSheet;
      pnlEstado: TPanel;
      Label5: TLabel;
      pnlCidade: TPanel;
      Label2: TLabel;
      pnlBairro: TPanel;
      Label3: TLabel;
      cmbEstado: TComboBox;
      cmbCidade: TComboBox;
      cmbBairro: TComboBox;
      edEstado: TEdit;
      edCidade: TEdit;
      edBairro: TEdit;
      ToolbarSep971: TToolbarSep97;
      bbtnBusca: TBitBtn;
      ToolbarSep973: TToolbarSep97;
      bbtnParticipante: TBitBtn;
      PnlLogradouro: TPanel;
      Label6: TLabel;
      CmbLogradouro: TComboBox;
      edLogradouro: TEdit;
      pnlCEP: TPanel;
      Label9: TLabel;
      cmbCEP: TComboBox;
      edCEP: TEdit;
      ToolbarSep972: TToolbarSep97;
    PgCtrlResultado: TPageControl;
    TbsResultado: TTabSheet;
    dbgResultado: TwwDBGrid;
    qryRes: TwwQuery;
    Cds: TClientDataSet;
    dsRes: TDataSource;
    Dsp: TDataSetProvider;

      procedure FormShow(Sender: TObject);
      procedure bbtnBuscaClick(Sender: TObject);
      procedure dbgResultadoDblClick(Sender: TObject);
      procedure bbtnElegivelClick(Sender: TObject);
      procedure dbgResultadoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure dbgResultadoTitleButtonClick(Sender: TObject; AFieldName: String);
      procedure SetCadDepenBenef(Estado : Boolean);
      procedure RetornaValoresCadDepenBenef;
      procedure RetornaValoresCadElegivel;


   private  // Private declarations

      bElegivel      : Boolean;
      bParticipante  : Boolean;
      bDependente    : Boolean;
      bBeneficiario  : Boolean;
      bBenefAss      : Boolean;
      bRecebedor     : Boolean;
      bBenefpp       : Boolean;

      function TextoFiltro(sTexto, sCampo : string; iItem : Integer) : String;
      function ExisteForm(frm: string): Boolean;

      function TiraAcentos(pTexto: string): string;

   public   // Public declarations

   end;



var
  frmConsEnderCadElegivel: TfrmConsEnderCadElegivel;


  cCidade, cCEP, cIdpessoa, cIdPessjur,
  cIdLogradouroPrev, cSeqProposta, cIdRgElegBenef,
  cPatro, cSitFund, cIdTitular, cLogradouro : string;

  bCadDepenBenef : Boolean = False;



implementation
{$R *.DFM}
uses
   FTelaAut, fConsPart, uConsPart, dConsPart1, FCadElegivel, FCadDepenBenef;



procedure TfrmConsEnderCadElegivel.FormShow(Sender: TObject);
begin
  inherited;

   pgctrlBusca.ActivePage      := tbsBusca;

   cmbCEP.ItemIndex            := 1;
   cmbEstado.ItemIndex         := 1;
   cmbCidade.ItemIndex         := 0;
   cmbBairro.ItemIndex         := 0;
   cmbLogradouro.ItemIndex  := 0;

   bElegivel     := False;
   bParticipante := False;
   bDependente   := False;
   bBeneficiario := False;
   bBenefAss     := False;
   bRecebedor    := False;
   bBenefpp      := False;

   edCEP.SetFocus;
end;

procedure TfrmConsEnderCadElegivel.bbtnBuscaClick(Sender: TObject);
var
  sIdPessoa,
  sIdPessjur,
  sFiltro,
  sSQL : String;
begin
  inherited;

  sSQL           := '';
  cIdpessoa      := '';
  cIdTitular     := '';
  cIdPessjur     := '';
  cIdLogradouroPrev   := '';
  cSeqProposta   := '';
  cIdRgElegBenef := '';

  cds.Close;

  //   Início - Tratamento de Busca a partir do cep
  if ( Trim(EdCEP.Text)<>'' ) then
    sFiltro := sFiltro+TextoFiltro(' AND CEP ',EdCEP.Text,cmbCEP.ItemIndex);
  // Estado UF
  if ( Trim(EdEstado.Text)<>'' ) then
    sFiltro := sFiltro+TextoFiltro(' AND UPPER(UF)',EdEstado.Text,cmbEstado.ItemIndex);

  // Cidade
  if ( Trim(EdCidade.Text)<>'' ) then
    sFiltro := sFiltro+TextoFiltro(' AND UPPER(CIDADE) ' ,EdCidade.Text,cmbCidade.ItemIndex);
  // Bairro
  if ( Trim(EdBairro.Text)<>'' ) then
    sFiltro := sFiltro+TextoFiltro(' AND UPPER(BAIRRO) ',EdBairro.Text,cmbBairro.ItemIndex);
  // Logradouro
  if ( Trim(EdLogradouro.Text)<>'' ) then
    sFiltro := sFiltro+TextoFiltro(' AND UPPER(LOGRADOURO)',EdLogradouro.Text,cmbLogradouro.ItemIndex);

  qryRes.DisableControls;

  if trim(sFiltro) = '' then begin
    if messageBox(Handle,'Não foram selecionado(s) filtro(s) para a busca'+#13#10+'por isso a sua pesquisa pode demorar a ser exibida. Deseja Continuar?','Aviso',mb_iconinformation + mb_YesNo) = id_No then begin
      Exit;
    end;
  end;

  if (Trim(EdEstado.Text)='') then
  begin
    MessageDlg('Por favor, Informe o estado da pesquisa', mtInformation, [mbOK], 0);
    Exit;
  end;


  cds.Close;
  qryRes.Close;
  qryRes.SQL.Text :=  'SELECT  CEP, '               +
                      '        UF,  '               + vQL +
                      '        CIDADE, '            + vQL +
                      '        BAIRRO, '            + vQL +
                      '        LOGRADOURO, '        + vQL +
                      '        TIPOLOGRADOURO '     + vQL +
                      'FROM DNECORREIOS WHERE 1=1 ' + vQL +
                      sFiltro + vQL;

  if ( qryRes.Prepared ) then
    qryRes.UnPrepare;

  qryRes.Prepare;
  qryRes.ExecSQL;
  cds.Open;

  if (Trim(EdCEP.Text)<>'') and (cds.IsEmpty) then
  begin
    sFiltro := '';
    sFiltro := sFiltro + TextoFiltro(' AND CEP ',EdCEP.Text,cmbCEP.ItemIndex);

    if (Trim(EdEstado.Text)<>'') then
      sFiltro := sFiltro + TextoFiltro(' AND UPPER(UF) ',EdEstado.Text,cmbEstado.ItemIndex);

    if (Trim(EdCidade.Text)<>'') then
      sFiltro := sFiltro + TextoFiltro(' AND UPPER(CIDADE)',EdCidade.Text,cmbCidade.ItemIndex);

    if (Trim(EdBairro.Text)<>'') then
      sFiltro := sFiltro + TextoFiltro(' AND UPPER(BAIRRO)',EdBairro.Text,cmbBairro.ItemIndex);

    if (Trim(edLogradouro.Text)<>'') then
      sFiltro := sFiltro + TextoFiltro(' AND UPPER(LOGRADOURO)',EdLogradouro.Text,cmbLogradouro.ItemIndex);

    cds.Close;
    qryRes.SQL.Text :=  'SELECT '                 +
                        '       CEP, '           + vQL +
                        '       UF, '            + vQL +
                        '       CIDADE, '        + vQL +
                        '       BAIRRO, '        + vQL +
                        '       LOGRADOURO, '    + vQL +
                        '       TIPOLOGRADOURO ' + vQL +
                        'FROM DNECORREIOS WHERE 1=1 ' +
                        vQL+sFiltro                   + vQL;

    if qryRes.Prepared then
      qryRes.UnPrepare;

    qryRes.Prepare;
    cds.Open;
  end;

  try
    dsRes.DataSet := cds;
    dbgResultado.DataSource    := dsRes;
  except
  end;

  qryRes.EnableControls;

  if bCadDepenBenef then
    frmCadDepenBenef.HabilitaCamposEndereco(True);

  if not bCadDepenBenef then
    FrmCadElegivel.HabilitaCamposEndereco(True);

  if cds.IsEmpty then
  begin
    if not bCadDepenBenef then
    begin
      MessageDlg('O endereço não está cadastrado em nossa base, favor realizar o cadastro manualmente.', mtInformation, [mbOK], 0);
      //Cássio Rovaroto - SIG nº 136301  - Início
      //Incluindo o termo RESIDENCIAL no caso de Local em Branco
      if FrmCadElegivel.dbedNomeEndereco.Text = EmptyStr then
      begin
        FrmCadElegivel.dbedNomeEndereco.Enabled := True;
        FrmCadElegivel.dbedNomeEndereco.Field.AsString := 'RESIDENCIAL';
        FrmCadElegivel.dbedNomeEndereco.Enabled := False;
      end;
      //Cássio Rovaroto - SIG nº 136301  - Fim
      FrmCadElegivel.HabilitaCamposEndereco(True);
      Close;
    end else if bCadDepenBenef then
    begin
      MessageDlg('O endereço não está cadastrado em nossa base, favor realizar o cadastro manualmente.', mtInformation, [mbOK], 0);
      //Cássio Rovaroto - SIG nº 136301  - Início
      //Incluindo o termo RESIDENCIAL no caso de Local em Branco
      if frmCadDepenBenef.dbedNomeEndereco.Text = EmptyStr then
      begin
        frmCadDepenBenef.dbedNomeEndereco.Enabled := True;
        frmCadDepenBenef.dbedNomeEndereco.Field.AsString := 'RESIDENCIAL';
        frmCadDepenBenef.dbedNomeEndereco.Enabled := False;
      end;
      //Cássio Rovaroto - SIG nº 136301  - Fim
      frmCadDepenBenef.HabilitaCamposEndereco(True);
      Close;
    end;


  end
  else
    bbtnParticipante.Enabled := true;
end;

function TfrmConsEnderCadElegivel.TextoFiltro(sTexto, sCampo: string; iItem: Integer): String;
begin
   case iItem of
      0 : TextoFiltro := sTexto +' LIKE '''+Trim(sCampo)+'%''';
      1 : TextoFiltro := sTexto +' =    '''+Trim(sCampo)+'''';
      2 : TextoFiltro := sTexto +' LIKE ''%'+Trim(sCampo)+'%''';
   end;
end;

procedure TfrmConsEnderCadElegivel.dbgResultadoDblClick(Sender: TObject);
Var
  S: String;

begin
  inherited;
  if not cds.Eof then
  begin
    if dbgResultado.GetActiveCol = 0 then
      S :=  cds.FieldByName('CEP').AsString;
    if dbgResultado.GetActiveCol = 1 then
      S :=  cds.FieldByName('UF').AsString;
    if dbgResultado.GetActiveCol = 2 then
      S :=  cds.FieldByName('CIDADE').AsString;
    if dbgResultado.GetActiveCol = 3 then
      S :=  cds.FieldByName('BAIRRO').AsString;
    if dbgResultado.GetActiveCol = 4 then
      S :=  cds.FieldByName('LOGRADOURO').AsString;
    if dbgResultado.GetActiveCol = 5 then
      S :=  cds.FieldByName('TIPOLOGRADOURO').AsString;
    ClipBoard.AsText := S;
  end;
end;


procedure TfrmConsEnderCadElegivel.bbtnElegivelClick(Sender: TObject);
begin
  if bCadDepenBenef then
    RetornaValoresCadDepenBenef
  else
    RetornaValoresCadElegivel;
    
  self.Close;
end;



function TfrmConsEnderCadElegivel.ExisteForm(frm: string): Boolean;
var
   i: Integer;
begin
   Result := False;

   for i := 0 to Screen.FormCount - 1 do
   begin
      if uppercase(Screen.Forms[i].Name) = uppercase(frm) then
      begin
         Result := True;
         Break;
      end;
   end;
end;


procedure TfrmConsEnderCadElegivel.dbgResultadoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   inherited;
   if key = vk_return then bbtnElegivelClick(sender);
end;



procedure TfrmConsEnderCadElegivel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;



procedure TfrmConsEnderCadElegivel.dbgResultadoTitleButtonClick(Sender: TObject; AFieldName: String);
begin
   inherited;

   cds.IndexName        := 'CHANGEINDEX';
   cds.IndexFieldNames  := AFieldName;
end;

procedure TfrmConsEnderCadElegivel.RetornaValoresCadDepenBenef;
var
  Cidade, CodEstado : String;
begin
  if not cds.Eof then
  begin
    with frmCadDepenBenef do
    begin
      dbeCEP.Field.AsString        := cds.FieldByName('CEP').AsString;
      dbeBairro.Field.AsString     := cds.FieldByName('BAIRRO').AsString;
      dbeLogradouro.Field.AsString := cds.FieldByName('LOGRADOURO').AsString;

      //Cássio Rovaroto - SIG nº 136301  - Início
      //Incluindo o termo RESIDENCIAL no casos de Local em Branco
      if dbedNomeEndereco.Text = EmptyStr then
      begin
        dbedNomeEndereco.Enabled := True;
        dbedNomeEndereco.Field.AsString := 'RESIDENCIAL';
        dbedNomeEndereco.Enabled := False;
      end;
      //Cássio Rovaroto - SIG nº 136301  - Fim
                                                        
      //Inicio - Sadi - SOL 234123_16294 - PPM  451314
      Cidade := UpperCase(TiraAcentos(Trim(cds.FieldByName('CIDADE').AsString)));
      CodEstado := Trim(edEstado.Text);
      qryCidade.Locate('NOMECIDADE;CODESTADO', VarArrayOf([Cidade,CodEstado]),[]);
      //Fim - Sadi - SOL 234123_16294 - PPM  451314


      dbePais.Text := qryCidadeNOMEPAIS.AsString;
      cmbCidade.Text := qryCidadeNOMECIDADE.AsString;
      cmbCidade.PerformSearch;



    end;
  end;
end;

function TfrmConsEnderCadElegivel.TiraAcentos(pTexto: string): string;
var
  strValor, strComAcento, strSemAcento: string;
  I: Integer; 
begin 
  //Passa tudo pra mauísculas e sem acentos     
  strComAcento := 'áàãâäéèêëíìîïóòõôöúùûüçÁÀÃÂÄÉÈÊËÍÌÎÏÓÒÕÖÔÚÙÛÜÇ';
  strSemAcento := 'aaaaaeeeeiiiiooooouuuucAAAAAEEEEIIIIOOOOOUUUUC';
  strValor := pTexto; 
  for I := 1 to Length(strComAcento) do
    strValor := StringReplace(strValor, copy(strComAcento, I, 1), copy(strSemAcento, I, 1), [rfReplaceAll]); 
  Result := strValor; 
end;

procedure TfrmConsEnderCadElegivel.SetCadDepenBenef(Estado : Boolean);
begin
  bCadDepenBenef := Estado;
end;

procedure TfrmConsEnderCadElegivel.RetornaValoresCadElegivel;
var
  Cidade, CodEstado : String;
begin
  if not cds.Eof then
  begin
    with frmCadElegivel do
    begin
      dbedCEP.Field.AsString        := cds.FieldByName('CEP').AsString;
      dbedBairro.Field.AsString     := cds.FieldByName('BAIRRO').AsString;
      dbedLogradouro.Field.AsString := cds.FieldByName('LOGRADOURO').AsString;

      //Cássio Rovaroto - SIG nº 136187  - Início
      //Incluindo o termo RESIDENCIAL no casos de Local em Branco
      if dbedNomeEndereco.Text = EmptyStr then
      begin
        dbedNomeEndereco.Enabled := True;
        dbedNomeEndereco.Field.AsString := 'RESIDENCIAL';
        dbedNomeEndereco.Enabled := False;
      end;
      //Cássio Rovaroto - SIG nº 136187  - Fim

      //Inicio - Sadi - SOL 234123_16294 - PPM  451314
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' select IDESTADO from estado where codestado = '+QuotedStr(edEstado.Text));
      qryAux.Open;

      qryCidade.Close;
      qryCidade.ParamByName('IDESTADO').AsInteger :=  qryAux.FieldByName('IDESTADO').AsInteger;
      qryCidade.Open;


      Cidade := UpperCase(TiraAcentos(Trim(cds.FieldByName('CIDADE').AsString)));
      CodEstado := Trim(edEstado.Text);//TiraAcentos(Trim(cds.FieldByName('CODESTADO').AsString));
      qryCidade.Locate('NOMECIDADE;CODESTADO', VarArrayOf([Cidade,CodEstado]),[]);


      //Fim - Sadi - SOL 234123_16294 - PPM  451314

      dbeCodEstado.Field.AsString := qryCidadeCODESTADO.AsString;
      dbedEstado.Field.AsString := qryCidadeNOMEESTADO.AsString;
      dbedPais.Field.AsString := qryCidadeNOMEPAIS.AsString;

      cmbCidade.Text := qryCidadeNOMECIDADE.AsString;
      cmbCidade.PerformSearch;
      cmbCidadeCloseUp(Self,qryCidade,nil,False);
      cmbCidade.PerformSearch;
    end;
  end;
end;

end.







