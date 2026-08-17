// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamArqPagto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook, Spin,
  checklst, IvDictio, IvMulti, IvEMulti, ComCtrls, fcLabel, uIea, FileCtrl,
  wwdbdatetimepicker, CMDateTimePicker, fSairAjuda;

type
  TfrmParamArqPagto = class(TfrmSairAjuda)
    qryMotivo: TwwQuery;
    qryFunc: TwwQuery;
    qryEstab: TwwQuery;
    qryParamRH: TwwQuery;
    qryFerias: TwwQuery;
    qryArqPagto: TwwQuery;
    updDocTxt: TUpdateSQL;
    qryDocTxt: TwwQuery;
    qryPortadorForma: TwwQuery;
    qryBanco: TwwQuery;
    pnlDiretorio: TPanel;
    fcLabel2: TfcLabel;
    Bevel2: TBevel;
    DriveComboBox1: TDriveComboBox;
    DirectoryListBox1: TDirectoryListBox;
    btnOkDir: TBitBtn;
    btnSairDiretorio: TBitBtn;
    qryAux: TwwQuery;
    qryEndereco: TwwQuery;
    pnlSelecao: TPanel;
    gbxAnoMesRef: TGroupBox;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    gbxDataCredito: TGroupBox;
    dtedDtCredito: TCMDateTimePicker;
    rgProcesso: TRadioGroup;
    gbxEstab: TGroupBox;
    dblkcbEstab: TwwDBLookupCombo;
    gbxFunc: TGroupBox;
    Paginas: TPageControl;
    tbshListaFunc: TTabSheet;
    chklstFunc: TCheckListBox;
    bbtnSelTodosFunc: TBitBtn;
    bbtnInverteSelFunc: TBitBtn;
    tbshFiltroFunc: TTabSheet;
    gbxTipContra: TGroupBox;
    cbxEfetivos: TCheckBox;
    cbxEspeciais: TCheckBox;
    cbxTemporarios: TCheckBox;
    cbxEstagiarios: TCheckBox;
    cbxTerceiros: TCheckBox;
    cbxProprietarios: TCheckBox;
    cbxAutonomos: TCheckBox;
    gbxSituacao: TGroupBox;
    cbxAtivos: TCheckBox;
    cbxAfastados: TCheckBox;
    btnSelDir: TBitBtn;
    lblDiretorio: TLabel;
    pnlResult: TPanel;
    memResult: TMemo;
    bbtnVoltar: TBitBtn;
    Bevel1: TBevel;
    rbtnGerar: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    gbxTipPag: TGroupBox;
    chklstTipoFolha: TCheckListBox;
    bbtnSelTodosTipoFolha: TBitBtn;
    bbtnInvSelTipoFolha: TBitBtn;
    cbxDemitidos: TCheckBox;
    Bevel3: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblkcbEstabChange(Sender: TObject);
    procedure chklstFuncDrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
      State: TOwnerDrawState);
    procedure gbxTipContraEnter(Sender: TObject);
    procedure gbxTipContraExit(Sender: TObject);
    procedure gbxSituacaoEnter(Sender: TObject);
    procedure gbxSituacaoExit(Sender: TObject);
    procedure chklstFuncClickCheck(Sender: TObject);
    procedure bbtnSelTodosFuncClick(Sender: TObject);
    procedure bbtnInverteSelFuncClick(Sender: TObject);
    procedure btnOkDirClick(Sender: TObject);
    procedure btnSairDiretorioClick(Sender: TObject);
    procedure DirectoryListBox1KeyPress(Sender: TObject; var Key: Char);
    procedure pnlDiretorioExit(Sender: TObject);
    procedure btnSelDirClick(Sender: TObject);
    procedure bbtnVoltarClick(Sender: TObject);
    procedure rbtnGerarClick(Sender: TObject);
    procedure dblkcbMotivoChange(Sender: TObject);
    procedure chklstTipoFolhaClickCheck(Sender: TObject);
    procedure bbtnSelTodosTipoFolhaClick(Sender: TObject);
    procedure bbtnInvSelTipoFolhaClick(Sender: TObject);
    procedure chklstTipoFolhaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure chklstFuncKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
//    Registry: TRegistry;
    ListaFunc, ListaTipoFolha: TStringList;
    {LstContaLiquido,} LstPortForma: TStrings;

    bSitAtivo, bSitAfast, bSitDemit, bTipContrEfet, bTipContrEspec, bTipContrTemp,
    bTipContrEst, bTipContrTerc, bTipContrProp, bTipContrAut: boolean;
    UltPortForma, PortadorFormaDefault, UltIdbanco: integer;
    sAux, sMesRef, sCodEstab, PathArquivoRem, ContaLiquido: string;

    procedure MudaListaFuncionarios;
    procedure HabilitaBtOk;
    function  SelSitFunc: string;
    function  SelTipoContrato: string;
    procedure AlimentaQryDocTxt;
//    procedure GravaDiretorioCAP;
  end;

var
  frmParamArqPagto: TfrmParamArqPagto;

implementation

uses uSistema, uMensErro, uFuncoesUteisRH, dRelatorios1, fAguarde, UsoGeralRH;

{$R *.DFM}

procedure TfrmParamArqPagto.FormCreate(Sender: TObject);
begin
  inherited;
  ListaFunc := TStringList.Create;
  ListaTipoFolha := TStringList.Create;
  LstPortForma := TStringList.Create;
//  Registry       := TRegistry.Create;
  Ieacm := TIeacm.Create;

  // Estabelecimento(s) habilitados para o usuário
  if (sUsuXfilial <> '') then
  begin
    if (Pos(',',sUsuXfilial) > 0) then
      qryEstab.SQL[5] := '  (PJ.IDPESSOA IN ' +sUsuXfilial+ ') AND'
    else
      qryEstab.SQL[5] := '  (PJ.IDPESSOA  = ' +sUsuXfilial+ ') AND';
  end;

  qryEstab.ParamByName('EMPRESA').asInteger := Sistema.IdEmpresa;
  qryEstab.Open;
  qryParamRH.Open;
  qryFerias.Open;
  qryMotivo.Open;

  qryDocTxt.Close;
  qryDocTxt.Prepare;
  qryDocTxt.Open;

  qryPortadorForma.Close;
  qryPortadorForma.Open;

  with (qryArqPagto) do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT CODPORTFORMA FROM BANCOPORTFOLHA WHERE IDBANCO IS NULL');
    Open;

    if not(IsEmpty) then
      PortadorFormaDefault := FieldByName('CODPORTFORMA').asInteger
    else
      PortadorFormaDefault := 0;

    Close;
  end;

  // Monta ChekListBox de Tipo de Folha
  chklstTipoFolha.Items.Clear;
  ListaTipoFolha.Clear;
  while not(qryMotivo.EOF) do
  begin
    chklstTipoFolha.Items.Add(qryMotivo.FieldByName('DESCRICAO').asString);
    ListaTipoFolha.Add(qryMotivo.FieldByName('IDMOTIVO').asString);
    qryMotivo.Next;
  end;

  Ieacm.FechaQryTexto := false;
  cmbMes.ItemIndex := ExtraiMes(qryParamRH.FieldByName('NORMALINI').asDateTime) - 1;
  speAno.Text := Copy(qryParamRH.FieldByName('NORMALINI').asString,7,4);
end;

procedure TfrmParamArqPagto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ListaFunc.Free;
  ListaTipoFolha.Free;
  LstPortForma.Free;
//  Registry.Free;
  Ieacm.Free;

  qryMotivo.Close;
  qryFerias.Close;
  qryFunc.Close;
  qryEstab.Close;
  qryParamRH.Close;
  inherited;
end;

procedure TfrmParamArqPagto.chklstFuncDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
  with (TCheckListBox(Control).Canvas) do
  begin
    if (TCheckListBox(Control).Checked[Index]) then
      if (odSelected in State) then
      begin
        Brush.Color := clTeal;
        Font.Color := clWhite;
      end
      else
      begin
        Brush.Color := CL_AMARELO_CLARO;
        Font.Color := clBlack;
      end;

    FillRect(Rect);
    TextOut(Rect.Left+1, Rect.Top+1, TCheckListBox(Control).Items[Index]);
  end;
end;

procedure TfrmParamArqPagto.dblkcbEstabChange(Sender: TObject);
begin
  dblkcbEstab.Text := Trim(dblkcbEstab.Text);

  if (dblkcbEstab.Text <> sCodEstab) then
  begin
    MudaListaFuncionarios;
    sCodEstab := dblkcbEstab.Text;
  end;

  if (Paginas.ActivePage = tbshListaFunc) then
    chklstFunc.Repaint;
end;

procedure TfrmParamArqPagto.dblkcbMotivoChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamArqPagto.chklstTipoFolhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    chklstTipoFolhaClickCheck(Sender);
end;

procedure TfrmParamArqPagto.chklstFuncKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmParamArqPagto.DirectoryListBox1KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #27) then
    pnlDiretorio.Visible := false;
end;

procedure TfrmParamArqPagto.gbxTipContraEnter(Sender: TObject);
begin
  bTipContrEfet := cbxEfetivos.Checked;
  bTipContrEspec := cbxEspeciais.Checked;
  bTipContrTemp := cbxTemporarios.Checked;
  bTipContrEst := cbxEstagiarios.Checked;
  bTipContrTerc := cbxTerceiros.Checked;
  bTipContrProp := cbxProprietarios.Checked;
  bTipContrAut := cbxAutonomos.Checked;
end;

procedure TfrmParamArqPagto.gbxTipContraExit(Sender: TObject);
begin
  if not(cbxEfetivos.Checked)      and not(cbxEspeciais.Checked) and
     not(cbxTemporarios.Checked)   and not(cbxTerceiros.Checked) and
     not(cbxProprietarios.Checked) and not(cbxAutonomos.Checked) and
     not(cbxEstagiarios.Checked) then
  begin
    MsgDlg('Pelo menos um Tipo de Contrato deve ser selecionado.', 'Aviso',
      mtInformation, [mbOk,mbHelp], 0);
    cbxEfetivos.SetFocus;
  end
  else
  if (bTipContrEfet <> cbxEfetivos.Checked) or (bTipContrEspec <> cbxEspeciais.Checked) or
     (bTipContrTemp <> cbxTemporarios.Checked) or (bTipContrEst <> cbxEstagiarios.Checked) or
     (bTipContrTerc <> cbxTerceiros.Checked) or (bTipContrProp <> cbxProprietarios.Checked) or
     (bTipContrAut <> cbxAutonomos.Checked) then
    MudaListaFuncionarios;
end;

procedure TfrmParamArqPagto.gbxSituacaoEnter(Sender: TObject);
begin
  bSitAtivo := cbxAtivos.Checked;
  bSitAfast := cbxAfastados.Checked;
  bSitDemit := cbxDemitidos.Checked;
end;

procedure TfrmParamArqPagto.gbxSituacaoExit(Sender: TObject);
begin
  if not(cbxAtivos.Checked) and not(cbxAfastados.Checked) and not(cbxDemitidos.Checked) then
  begin
    MsgDlg('Pelo menos um Tipo de Situação deve ser selecionado.', 'Aviso',
      mtInformation, [mbOk,mbHelp], 0);
    gbxSituacao.SetFocus;
  end
  else
  if (bSitAtivo <> cbxAtivos.Checked) or (bSitAfast <> cbxAfastados.Checked) or
     (bSitDemit <> cbxDemitidos.Checked) then
    MudaListaFuncionarios;
end;

procedure TfrmParamArqPagto.pnlDiretorioExit(Sender: TObject);
begin
  pnlDiretorio.Visible := false;
end;

procedure TfrmParamArqPagto.chklstTipoFolhaClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender), TCustomListBox(Sender).ItemIndex);
  HabilitaBtOk;
end;

procedure TfrmParamArqPagto.chklstFuncClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender), TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmParamArqPagto.bbtnSelTodosTipoFolhaClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstTipoFolha.Items.Count-1 do
    chklstTipoFolha.Checked[c] := true;
  chklstTipoFolha.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamArqPagto.bbtnInvSelTipoFolhaClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstTipoFolha.Items.Count-1 do
    chklstTipoFolha.Checked[c] := not(chklstTipoFolha.Checked[c]);
  chklstTipoFolha.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamArqPagto.bbtnSelTodosFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := true;
  chklstFunc.Repaint;
end;

procedure TfrmParamArqPagto.bbtnInverteSelFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := not(chklstFunc.Checked[c]);
  chklstFunc.Repaint;
end;

procedure TfrmParamArqPagto.btnOkDirClick(Sender: TObject);
begin
  lblDiretorio.Caption := DirectoryListBox1.Directory;
  pnlDiretorio.Visible := false;
//  GravaDiretorioCAP;
end;

procedure TfrmParamArqPagto.btnSairDiretorioClick(Sender: TObject);
begin
  pnlDiretorio.Visible := false;
end;

procedure TfrmParamArqPagto.btnSelDirClick(Sender: TObject);
begin
  pnlDiretorio.Left := 125;
  pnlDiretorio.Top := 72;
  pnlDiretorio.BringToFront;
  pnlDiretorio.Visible := true;
end;

procedure TfrmParamArqPagto.bbtnVoltarClick(Sender: TObject);
begin
  pnlResult.SendToBack;
end;

procedure TfrmParamArqPagto.rbtnGerarClick(Sender: TObject);
var
  wNum: word;
  K: integer;
  sMes, NomeTabela, sQueryFunc, sQueryTipoFolha: string;
begin
  // Inicia variáveis
  if (rgProcesso.ItemIndex = 0) then
    NomeTabela := 'PREVIAFOLPAG'
  else
    NomeTabela := 'HISTRUBSAL';

  sMes := QuotedStr(IntToStr(speAno.Value) + '/'+ PoeZero(cmbMes.ItemIndex+1));
  sMesRef := (IntToStr(speAno.Value) + '/'+ PoeZero(cmbMes.ItemIndex+1));

  // Funcionários escolhidos
  wNum := CriaListaOpcoes(chklstFunc, ListaFunc, sQueryFunc, ',', false);
  if (wNum = ListaFunc.Count) then
    sQueryFunc := '';

  // Rubricas para Remuneração selecionadas
  K := CriaListaOpcoes(chklstTipoFolha, ListaTipoFolha, sQueryTipoFolha, ',', true);

  if (K > 1) and (MsgDlg('Confirma Mesmo Arquivo para Mais de um Tipo de Pagamento?',
                         'Confirmação ', mtConfirmation, [mbYes,mbNo,mbHelp], 0) <> mrYes) then
    exit;

  qryArqPagto.Close;

  // Monta Query Principal
  with (qryArqPagto.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  F.MATRICULA, F.IDPESSOA,');
    Add('  PJ.RAZAOSOCIAL AS EMPRESA,');
    Add('  PF.NOME AS EMPREGADO ,');
    Add('  PF.NUMDOCUMENTO AS CPF,');
    Add('  AG.NUMAGENCIA AS CODAGENCIA ,');
    Add('  PA.NOME AS NOMEAGENCIA,');
    Add('  F.NUMCONTASALARIO AS CONTA,');

    // Data de Crédito selecionada
    if (Trim(dtedDtCredito.Text) <> '') then
    begin
      Add('  ('+QuotedStr(Copy(dtedDtCredito.Text,1,2))+') AS DIA_CREDITO,');
      Add('  ('+QuotedStr(Copy(dtedDtCredito.Text,4,2))+') AS MES_CREDITO,');
      Add('  ('+QuotedStr(Copy(dtedDtCredito.Text,7,4))+') AS ANO_CREDITO,');
    end
    else
    begin
      Add('  ('' '') AS DIA_CREDITO,');
      Add('  ('' '') AS MES_CREDITO,');
      Add('  ('' '') AS ANO_CREDITO,');
    end;

    Add('  B.NUMBANCO,');
    Add('  PB.NOME AS BANCO,');
    Add('  RTRIM(DECODE(RTRIM(ESTADUAL.NUMDOCUMENTO),'''',');
    Add('    DECODE(RTRIM(MUNICIPAL.NUMDOCUMENTO),'''','''',');
    Add('    ''Inscrição Municipal: ''|| MUNICIPAL.NUMDOCUMENTO),');
    Add('    ''Inscrição Estadual: '' || ESTADUAL.NUMDOCUMENTO)) AS ESTADUALMUNICIPAL,');
    Add('  CGC.NUM AS CGCCPF,');
    Add('  ES.CODESTADO AS UF,');
    Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO || DECODE(E.COMPLEMENTO,'' '','' - '' ||');
    Add('    RTRIM(E.COMPLEMENTO)) ||'' - ''|| RTRIM(E.BAIRRO) ||'' - ''|| RTRIM(CIDADES.NOME) ||'' - CEP:''||');
    Add('    RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS ENDERECO,');
    Add('  DECODE(END.LOGRADOURO,NULL,'''',RTRIM(END.LOGRADOURO) ||'', ''|| END.NUMERO ||');
    Add('    DECODE(END.COMPLEMENTO,'' '','' - '' || RTRIM(END.COMPLEMENTO)) ||'' - ''||');
    Add('    RTRIM(END.BAIRRO) ||'' - ''|| RTRIM(CID.NOME) ||'' - CEP:''||');
    Add('    RTRIM(SUBSTR(END.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(END.CEP,6,3))) AS ENDERECOAGENCIA,');
    // Se a Rubrica 40999 não existir, calcula
    Add('  DECODE(RUBRICA.VALOR,NULL,(PROVENTOS.VALOR-DESCONTOS.VALOR),RUBRICA.VALOR) AS LIQUIDO');
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, PESSOA PB, PESSOA PA, ENDPESS E, ENDPESS END,');
    Add('  FUNCIONARIO F, CIDADES, CIDADES CID, ESTADO ES, BANCO B, AGENCIABANCARIA AG,'+
      IFF((sQueryFunc = ''),'SITFUNC ST,',''));
    // -------------------------------------------------------------------------- //
    // CGC do Estabelecimento
    Add('  (SELECT FP.IDFILIALPESSOA AS IDPESSOA,');
    Add('          RTRIM(TDO.SIGLADOCUMENTO ||'' ''|| DO.NUMDOCUMENTO) AS NUM');
    Add('   FROM   DOCPESSOA DO, FILIALPESSOA FP, TIPODOCOFICIAL TDO');
    Add('   WHERE  ((TDO.SIGLADOCUMENTO = ''CNPJ:'') OR');
    Add('           (TDO.SIGLADOCUMENTO = ''CGC:'')) AND');
    Add('          (TDO.IDDOCUMENTO     = DO.IDDOCUMENTO) AND');
    Add('          (FP.IDFILIALPESSOA   = DO.IDPESSOA)) CGC,');
    // -------------------------------------------------------------------------- //
    // Inscrição Estadual
    Add('  (SELECT D.IDPESSOA, TD.CODDOCUMENTO, D.NUMDOCUMENTO, UPPER(TD.SIGLADOCUMENTO)');
    Add('   FROM   DOCPESSOA D, TIPODOCOFICIAL TD');
    Add('   WHERE (TD.SIGLADOCUMENTO = ''ESTADUAL:'') AND');
    Add('         (TD.IDDOCUMENTO    = D.IDDOCUMENTO)) ESTADUAL,');
    // -------------------------------------------------------------------------- //
    // Inscrição Municipal
    Add('  (SELECT D.IDPESSOA, TD.CODDOCUMENTO, D.NUMDOCUMENTO, UPPER(TD.SIGLADOCUMENTO)');
    Add('   FROM   DOCPESSOA D, TIPODOCOFICIAL TD');
    Add('   WHERE (TD.SIGLADOCUMENTO = ''MUNICIPAL:'') AND');
    Add('         (TD.IDDOCUMENTO    = D.IDDOCUMENTO)) MUNICIPAL,');
    // -------------------------------------------------------------------------- //
    // Proventos do Empregado
    Add('  (SELECT H.IDPESSOA, SUM(H.VALORPROVENTO) AS VALOR');
    Add('   FROM   ' +NomeTabela+ ' H, PROVDESC P, FUNCIONARIO F, FILIALPESSOA FP'+
      IFF((sQueryFunc = ''),', SITFUNC ST',''));
    Add('   WHERE (FP.IDFILIALPESSOA = ' +qryEstab.FieldByName('CODIGO').asString+ ') AND');
    Add('         (P.FLGDESCONTO     = 0) AND');
    Add('         (H.IDPESSJUR       = ' +IntToStr(Sistema.IdEmpresa)+ ') AND');
    Add('         (H.MES             = ' +sMes+ ') AND');

    if (Pos(',',sQueryTipoFolha) > 0) then
      Add('         (H.IDMOTIVO       IN (' +sQueryTipoFolha+ ')) AND')
    else
      Add('         (H.IDMOTIVO        = ' +sQueryTipoFolha+ ') AND');

    // Funcionário(s) selecionado(s)
    if (sQueryFunc <> '') then
    begin
      if (Pos(',',sQueryFunc) > 0) then
        Add('         (F.IDPESSOA       IN (' +sQueryFunc+ ')) AND')
      else
        Add('         (F.IDPESSOA        = ' +sQueryFunc+ ') AND');
    end
    else
    begin
      // C. de Custo(s) habilitados para o usuário
      if (sUsuXccusto <> '') then
      begin
        if (Pos(',',sUsuXccusto) > 0) then
          Add('         (F.CODCENTROCUSTO IN ' +sUsuXccusto+ ') AND')
        else
          Add('         (F.CODCENTROCUSTO  = ' +sUsuXccusto+ ') AND');
      end;

      sAux := SelSitFunc;
      if (sAux <> '') then
        if (Pos(',',sAux) > 0) then
          Add('         (ST.TIPOSIT       IN (' +sAux+ ')) AND')
        else
          Add('         (ST.TIPOSIT        = ' +sAux+ ') AND');

      sAux := SelTipoContrato;
      if (Pos(',',sAux) > 0) then
        Add('         (F.TIPOCONTRATO   IN (' +sAux+ ')) AND')
      else
        Add('         (F.TIPOCONTRATO    = ' +sAux+ ') AND');

      Add('         (ST.IDSITFUNC      = F.IDSITFUNC) AND');
    end;

    Add('         (FP.IDFILIALPESSOA = F.IDESTAB) AND');
    Add('         (F.IDPESSOA        = H.IDPESSOA) AND');
    Add('         (H.IDRUBRICA       = P.IDPROVENTO)');
    Add('   GROUP BY H.IDPESSOA) PROVENTOS,');
    // -------------------------------------------------------------------------- //
    // Desconto do Empregado
    Add('  (SELECT H.IDPESSOA, SUM(H.VALORPROVENTO) AS VALOR');
    Add('   FROM   ' +NomeTabela+ ' H, PROVDESC P, FUNCIONARIO F, FILIALPESSOA FP'+
      IFF((sQueryFunc = ''),', SITFUNC ST',''));
    Add('   WHERE (FP.IDFILIALPESSOA = ' +qryEstab.FieldByName('CODIGO').asString+ ') AND');
    Add('         (P.FLGDESCONTO     = 1) AND');
    Add('         (H.IDPESSJUR       = ' +IntToStr(Sistema.IdEmpresa)+ ') AND');
    Add('         (H.MES             = ' +sMes+ ') AND');

    if (Pos(',',sQueryTipoFolha) > 0) then
      Add('         (H.IDMOTIVO       IN (' +sQueryTipoFolha+ ')) AND')
    else
      Add('         (H.IDMOTIVO        = ' +sQueryTipoFolha+ ') AND');

    // Funcionário(s) selecionado(s)
    if (sQueryFunc <> '') then
    begin
      if (Pos(',',sQueryFunc) > 0) then
        Add('         (F.IDPESSOA       IN (' +sQueryFunc+ ')) AND')
      else
        Add('         (F.IDPESSOA        = ' +sQueryFunc+ ') AND');
    end
    else
    begin
      // C. de Custo(s) habilitados para o usuário
      if (sUsuXccusto <> '') then
      begin
        if (Pos(',',sUsuXccusto) > 0) then
          Add('         (F.CODCENTROCUSTO IN ' +sUsuXccusto+ ') AND')
        else
          Add('         (F.CODCENTROCUSTO  = ' +sUsuXccusto+ ') AND');
      end;

      sAux := SelSitFunc;
      if (sAux <> '') then
        if (Pos(',',sAux) > 0) then
          Add('         (ST.TIPOSIT       IN (' +sAux+ ')) AND')
        else
          Add('         (ST.TIPOSIT        = ' +sAux+ ') AND');

      sAux := SelTipoContrato;
      if (Pos(',',sAux) > 0) then
        Add('         (F.TIPOCONTRATO   IN (' +sAux+ ')) AND')
      else
        Add('         (F.TIPOCONTRATO    = ' +sAux+ ') AND');

      Add('         (ST.IDSITFUNC      = F.IDSITFUNC) AND');
    end;

    Add('         (FP.IDFILIALPESSOA = F.IDESTAB)  AND');
    Add('         (F.IDPESSOA        = H.IDPESSOA) AND');
    Add('         (H.IDRUBRICA       = P.IDPROVENTO)');
    Add('   GROUP BY H.IDPESSOA) DESCONTOS,');
    // -------------------------------------------------------------------------- //
    // Rubrica de Salário
    Add('  (SELECT H.IDPESSOA,H.VALORPROVENTO AS VALOR');
    Add('   FROM   ' +NomeTabela+ ' H, PROVDESC P, FUNCIONARIO F, FILIALPESSOA FP'+
      IFF((sQueryFunc = ''),', SITFUNC ST',''));
    Add('   WHERE (FP.IDFILIALPESSOA = '+qryEstab.FieldByName('CODIGO').asString+') AND');
    Add('         (P.CODRUBCLT       = ''40999'') AND');
    Add('         (H.IDPESSJUR       = ' +IntToStr(Sistema.IdEmpresa)+ ') AND');
    Add('         (H.MES             = ' +sMes+ ') AND');

    if (Pos(',',sQueryTipoFolha) > 0) then
      Add('         (H.IDMOTIVO       IN (' +sQueryTipoFolha+ ')) AND')
    else
      Add('         (H.IDMOTIVO        = ' +sQueryTipoFolha+ ') AND');

    // Funcionário(s) selecionado(s)
    if (sQueryFunc <> '') then
    begin
      if (Pos(',',sQueryFunc) > 0) then
        Add('         (F.IDPESSOA       IN (' +sQueryFunc+ ')) AND')
      else
        Add('         (F.IDPESSOA        = ' +sQueryFunc+ ') AND');
    end
    else
    begin
      // C. de Custo(s) habilitados para o usuário
      if (sUsuXccusto <> '') then
      begin
        if (Pos(',',sUsuXccusto) > 0) then
          Add('         (F.CODCENTROCUSTO IN ' +sUsuXccusto+ ') AND')
        else
          Add('         (F.CODCENTROCUSTO  = ' +sUsuXccusto+ ') AND');
      end;

      sAux := SelSitFunc;
      if (sAux <> '') then
        if (Pos(',',sAux) > 0) then
          Add('         (ST.TIPOSIT       IN (' +sAux+ ')) AND')
        else
          Add('         (ST.TIPOSIT        = ' +sAux+ ') AND');

      sAux := SelTipoContrato;
      if (Pos(',',sAux) > 0) then
        Add('         (F.TIPOCONTRATO   IN (' +sAux+ ')) AND')
      else
        Add('         (F.TIPOCONTRATO    = ' +sAux+ ') AND');

      Add('         (ST.IDSITFUNC      = F.IDSITFUNC) AND');
    end;

    Add('         (FP.IDFILIALPESSOA = F.IDESTAB) AND');
    Add('         (F.IDPESSOA        = H.IDPESSOA) AND');
    Add('         (P.IDPROVENTO      = H.IDRUBRICA)) RUBRICA');
    // -------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (PJ.IDPESSOA        = '+qryEstab.FieldByName('CODIGO').asString+') AND');

    // Funcionário(s) selecionado(s)
    if (sQueryFunc <> '') then
    begin
      if (Pos(',',sQueryFunc) > 0) then
        Add('  (F.IDPESSOA         IN (' +sQueryFunc+ ')) AND')
      else
        Add('  (F.IDPESSOA          = ' +sQueryFunc+ ') AND');
    end
    else
    begin
      // C. de Custo(s) habilitados para o usuário
      if (sUsuXccusto <> '') then
      begin
        if (Pos(',',sUsuXccusto) > 0) then
          Add('  (F.CODCENTROCUSTO IN ' +sUsuXccusto+ ') AND')
        else
          Add('  (F.CODCENTROCUSTO  = ' +sUsuXccusto+ ') AND');
      end;

      sAux := SelSitFunc;
      if (sAux <> '') then
        if (Pos(',',sAux) > 0) then
          Add('  (ST.TIPOSIT        IN (' +sAux+ ')) AND')
        else
          Add('  (ST.TIPOSIT         = ' +sAux+ ') AND');

      sAux := SelTipoContrato;
      if (Pos(',',sAux) > 0) then
        Add('  (F.TIPOCONTRATO    IN (' +sAux+ ')) AND')
      else
        Add('  (F.TIPOCONTRATO     = ' +sAux+ ') AND');

      Add('  (ST.IDSITFUNC       = F.IDSITFUNC) AND');
    end;

    Add('  (PJ.IDPESSOA        = CGC.IDPESSOA) AND');
    Add('  (PJ.IDPESSOA        = F.IDESTAB) AND');
    Add('  (F.IDPESSOA         = PF.IDPESSOA) AND');
    Add('  (F.IDAGENCIASALARIO = AG.IDPESSOA) AND');
    Add('  (AG.IDBANCO         = B.IDPESSOA) AND');
    Add('  (AG.IDPESSOA        = PA.IDPESSOA) AND');
    Add('  (B.IDPESSOA         = PB.IDPESSOA) AND');
    Add('  ((PROVENTOS.VALOR  IS NOT NULL) OR');
    Add('   (DESCONTOS.VALOR  IS NOT NULL) OR');
    Add('   (RUBRICA.VALOR    IS NOT NULL)) AND');
    Add('  (PJ.IDPESSOA        = E.IDPESSOA) AND');
    Add('  (PJ.IDENDCOMERCIAL  = E.IDENDERECO) AND');
    Add('  (E.IDCIDADES        = CIDADES.IDCIDADES(+)) AND');
    Add('  (CIDADES.IDESTADO   = ES.IDESTADO(+)) AND');
    Add('  (PA.IDPESSOA        = END.IDPESSOA(+)) AND');
    Add('  (PA.IDENDCOMERCIAL  = END.IDENDERECO(+)) AND');
    Add('  (END.IDCIDADES      = CID.IDCIDADES(+)) AND');
    Add('  (PJ.IDPESSOA        = ESTADUAL.IDPESSOA(+)) AND');
    Add('  (PJ.IDPESSOA        = MUNICIPAL.IDPESSOA(+)) AND');
    Add('  (PF.IDPESSOA        = RUBRICA.IDPESSOA(+)) AND');
    Add('  (PF.IDPESSOA        = DESCONTOS.IDPESSOA(+)) AND');
    Add('  (PF.IDPESSOA        = PROVENTOS.IDPESSOA(+))');
    Add('ORDER BY');
    Add('  BANCO, NOMEAGENCIA, EMPREGADO');
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+ '\qry.txt'); //Ádler Teodoro de Souza SOL 109421 KINTANA 496332

  end;

  frmAguarde.Mostra('Gerando o Arquivo de Pagamento...');

  qryArqPagto.Open;
  while not(qryArqPagto.EOF) do
  begin
    AlimentaQryDocTxt;
    qryArqPagto.Next;
  end;

  PathArquivoRem := lblDiretorio.Caption;
  qryDocTxt.Filtered := true;

  //Pln  := 0;
  with (qryArqPagto) do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT');
    SQL.Add('  BPF.CODPORTFORMA, PFR.CODARQUIVOREMESSA, PFR.CONTROLEREMESSA,');
    SQL.Add('  PTB.IDBANCO');
    SQL.Add('FROM');
    SQL.Add('  PORTADORFORMA PFR, PORTADORCONTA PTB, BANCOPORTFOLHA BPF');
    SQL.Add('WHERE');
    SQL.Add('  (PFR.CODPORTFORMA = BPF.CODPORTFORMA) AND');
    SQL.Add('  (PTB.CODPORTADOR  = PFR.CODPORTADOR)');
    Open;
    while not(EOF) do
    begin
      UltIdbanco   := FieldByName('IDBANCO').asInteger;
      UltPortForma := FieldByName('CODPORTFORMA').asInteger;
      if (LstPortForma.IndexOf(IntToStr(UltPortForma)) <> -1) then
      begin
        {verificação implementada em 12.08.99 em função da validação ter sido retirada
         da função ForCli.Inserir - será recolocada pelo Gustavo }

//         sSQL := 'SELECT IDPESSOA FROM FORNSERV WHERE IDPESSOA = '+ inttoStr(UltidBanco);
//         qryAux.SQL.Add(sSQL);
//         qryAux.Open;
//         if (qryAux.Eof) Then
//             Documento.ForCli.Inserir(UltIdbanco, -1, -1, iPlano,
//                   0{FrmPrincipal.prmIdRamoTipoForn????}, Sistema.IdEmpresa, '', '','','','F',true);

        //CodArquivoRemessa := FieldByName('CodArquivoRemessa').asInteger;
        //ControleRemessa   := FieldByName('ControleRemessa').asInteger;
        qryDocTxt.Filter := 'CodPortForma='+IntToStr(UltPortForma)+' and ContaLiquido='+#39+''{LstContaLiquido[C]}+#39;
        qryDocTxt.First;
        Ieacm.IndiceDoBanco := FieldByName('CodArquivoRemessa').asInteger;

        if (Ieacm.VerficaDadosEmpresa('P',FieldByName('CodPortForma').asInteger)) then
          if (Ieacm.ValidaRemessa('P',qryDocTxt,false)) then
          begin
            Ieacm.DataPagamento := dtedDtCredito.Text;
            Ieacm.MontaPagamentoEletronico(FieldByName('CodArquivoRemessa').asInteger,
              FieldByName('ControleRemessa').asInteger,qryDocTxt,PathArquivoRem);
          end
          else
          begin
            memResult.Lines.Add('Erro na geração do arquivo de remessa!');
            memResult.Lines.Add('  CodPortForma='+IntToStr(UltPortForma)+',ContaLiquido='{+LstContaLiquido[C]});
            memResult.Lines.Add('');
            frmAguarde.Apaga;
            pnlSelecao.SendToBack;
          end;
      end;
      Next;
    end;
    Close;
  end;
  frmAguarde.Apaga;
end;

procedure TfrmParamArqPagto.HabilitaBtOk;
var
  c: integer;
  bSel: boolean;
begin
  bSel := false;
  for c:=0 to chklstTipoFolha.Items.Count-1 do
    if (chklstTipoFolha.Checked[c]) then
    begin
      bSel := true;
      break;
    end;

  rbtnGerar.Enabled := (bSel) and (Trim(speAno.Text) <> '') and
    (Trim(dtedDtCredito.Text) <> '') and (Trim(dblkcbEstab.Text) <> '');
end;

procedure TfrmParamArqPagto.MudaListaFuncionarios;
begin
  qryFunc.Close;
  ListaFunc.Clear;
  chklstFunc.Items.Clear;

  if (dblkcbEstab.Text <> '') then
  begin
    with (qryFunc.SQL) do
    begin
      Clear;
      Add('SELECT');
      Add('  PF.IDPESSOA, PF.NOME AS EMPREGADO');
      Add('FROM');
      Add('  PESSOA PF, FUNCIONARIO F, SITFUNC ST');
      Add('WHERE');
      Add('  (F.IDESTAB         = ' +qryEstab.FieldByName('CODIGO').asString+ ') AND');

      sAux := SelSitFunc;
      if (sAux <> '') then
        if (Pos(',',sAux) > 0) then
          Add('  (ST.TIPOSIT        IN (' +sAux+ ')) AND')
        else
          Add('  (ST.TIPOSIT         = ' +sAux+ ') AND');

      // C. de Custo(s) habilitados para o usuário
      if (sUsuXccusto <> '') then
      begin
        if (Pos(',',sUsuXccusto) > 0) then
          Add('  (F.CODCENTROCUSTO IN ' +sUsuXccusto+ ') AND')
        else
          Add('  (F.CODCENTROCUSTO  = ' +sUsuXccusto+ ') AND');
      end;

      sAux := SelTipoContrato;
      if (Pos(',',sAux) > 0) then
        Add('  (F.TIPOCONTRATO    IN (' +sAux+ ')) AND')
      else
        Add('  (F.TIPOCONTRATO     = ' +sAux+ ') AND');

      Add('  (ST.IDSITFUNC      = F.IDSITFUNC) AND');
      Add('  (F.IDPESSOA        = PF.IDPESSOA)');
      Add('ORDER BY');
      Add('  UPPER(EMPREGADO)');
    end;
    qryFunc.Open;

    while not(qryFunc.EOF) do
    begin
      ListaFunc.Add(QryFunc.FieldByName('IDPESSOA').asString);
      chklstFunc.Items.Add(qryFunc.FieldByName('EMPREGADO').asString);
      qryFunc.Next;
    end;
  end;

  HabilitaBtOk;
end;

function TfrmParamArqPagto.SelSitFunc: string;
begin
  sAux := '';
  if (cbxDemitidos.Checked) then
    sAux := QuotedStr('D');

  if (cbxAtivos.Checked) then
    if (length(sAux) > 0) then
      sAux := sAux +','+ QuotedStr('A')
    else
      sAux := QuotedStr('A');

  if (cbxAfastados.Checked) then
    if (length(sAux) > 0) then
      sAux := sAux +','+ QuotedStr('F')
    else
      sAux := QuotedStr('F');

  Result := sAux;
end;

function TfrmParamArqPagto.SelTipoContrato: string;
begin
  sAux := '';
  if (cbxEfetivos.Checked) then
    sAux := QuotedStr('E');

  if (cbxEspeciais.Checked) then
    if (length(sAux) > 0) then
      sAux := sAux +','+ QuotedStr('S')
    else
      sAux := QuotedStr('S');

  if (cbxTemporarios.Checked) then
    if (length(sAux) > 0) then
      sAux := sAux +','+ QuotedStr('T')
    else
      sAux := QuotedStr('T');

  if (cbxTerceiros.Checked) then
    if (length(sAux) > 0) then
      sAux := sAux +','+ QuotedStr('3')
    else
      sAux := QuotedStr('3');

  if (cbxProprietarios.Checked) then
    if (length(sAux) > 0) then
      sAux := sAux +','+ QuotedStr('P')
    else
      sAux := QuotedStr('P');

  if (cbxAutonomos.Checked) then
    if (length(sAux) > 0) then
      sAux := sAux +','+ QuotedStr('A')
    else
      sAux := QuotedStr('A');

  if (cbxEstagiarios.Checked) then
    if (length(sAux) > 0) then
      sAux := sAux +','+ QuotedStr('G')
    else
      sAux := QuotedStr('G');

  Result := sAux;
end;

{procedure TfrmParamArqPagto.GravaDiretorioCAP;
begin
  Registry.RootKey := HKEY_CURRENT_USER;
  if Registry.OpenKey('Software\CM\Folha de Pagamento\',true) then
    Registry.WriteString('Diretorio CAP', lblDiretorio.Caption);
  Registry.CloseKey;
end;}

procedure TfrmParamArqPagto.AlimentaQryDocTxt;
var
  sLogradouro, sNumero, sComplemento, sBairro, sCidade, sCodestado, sCep, sNumdocumento: string;
begin
  if (qryArqPagto.FieldByName('LIQUIDO').asFloat = 0) or
     (qryArqPagto.FieldByName('CONTA').asString  = '') then
    exit;

  qryBanco.Close;
  qryBanco.ParamByName('IdResponsavel').asFloat := qryArqPagto.FieldByName('IDPESSOA').asFloat;
  qryBanco.Open;

  if not(qryBanco.EOF) then
  begin
    UltPortForma := qryBanco.FieldByName('codportforma').asInteger;

    if (UltPortForma = 0) then
      UltPortForma := PortadorFormaDefault;
  end;
  qryBanco.Close;

  if (LstPortForma.IndexOf(IntToStr(UltPortForma)) = -1) then
    LstPortForma.Add(IntToStr(UltPortForma));

  qryPortadorForma.Locate('CODPORTFORMA',UltPortForma,[]);

  sLOGRADOURO:=''; sNUMERO:=''; sCOMPLEMENTO:=''; sBAIRRO:=''; sCIDADE:=''; sCODESTADO:='';
  sCEP:= ''; sNumdocumento:='';

  qryEndereco.Close;
  qryEndereco.ParamByName('IdResponsavel').asFloat := qryArqPagto.FieldByName('IDPESSOA').asFloat;
  qryEndereco.Open;

  if not(qryEndereco.EOF) then
  begin
    sLOGRADOURO   := qryEndereco.FieldByName('LOGRADOURO').asString;
    sNUMERO       := qryEndereco.FieldByName('NUMERO').asString;
    sCOMPLEMENTO  := qryEndereco.FieldByName('COMPLEMENTO').asString;
    sBAIRRO       := qryEndereco.FieldByName('BAIRRO').asString;
    sCIDADE       := qryEndereco.FieldByName('CIDADE').asString;
    sCODESTADO    := qryEndereco.FieldByName('CODESTADO').asString;
    sCEP          := qryEndereco.FieldByName('CEP').asString;
    sNumdocumento := qryEndereco.FieldByName('NUMDOCUMENTO').asString;
    qryEndereco.Close;
  end;

  with (qryDocTxt) do
  begin
    Insert;
    FieldByName('CONTALIQUIDO').asString       := CONTALIQUIDO;
    FieldByName('IDPESSOA').asInteger          := qryArqPagto.FieldByName('IDPESSOA').asInteger;
    FieldByName('NOME').asString               := qryArqPagto.FieldByName('EMPREGADO').asString;
    FieldByName('RAZAOSOCIAL').asString        := qryArqPagto.FieldByName('EMPREGADO').asString;
    FieldByName('NUMDOCUMENTO').asString       := qryArqPagto.FieldByName('CPF').asString;
    FieldByName('CONTACORRENTE').asString      := qryArqPagto.FieldByName('CONTA').asString;
    FieldByName('CODBANCOFAVORECIDO').asString := qryArqPagto.FieldByName('NUMBANCO').asString;
    FieldByName('NUMAGENCIA').asString         := qryArqPagto.FieldByName('CODAGENCIA').asString;
    FieldByName('LOGRADOURO').asString         := sLOGRADOURO;
    FieldByName('NUMERO').asString             := sNUMERO;
    FieldByName('COMPLEMENTO').asString        := sCOMPLEMENTO;
    FieldByName('BAIRRO').asString             := sBAIRRO;
    FieldByName('CIDADE').asString             := sCIDADE;
    FieldByName('CODESTADO').asString          := sCODESTADO;
    FieldByName('CEP').asString                := sCEP;
    FieldByName('IDFORCLI').asInteger          := qryArqPagto.FieldByName('IDPESSOA').asInteger;
    FieldByName('TIPOCONTA').asString          := '1'; // Acertar depois !!!!!!????????
    FieldByName('CODDOCUMENTO').asString       := '0';
    FieldByName('LIVRE').asString              := Trim(qryArqPagto.FieldByName('MATRICULA').asString);
    FieldByName('VALOR').asFloat               := qryArqPagto.FieldByName('LIQUIDO').asFloat;
    FieldByName('VALORDESCONTO').asFloat       := 0;
    FieldByName('VALORJUROS').asFloat          := 0;
    FieldByName('DATAVENCTO').asString         := '';
    FieldByName('DATAPROGRAMADA').asString     := '';
    FieldByName('TIPOMOEDA').asInteger         := 0;
    FieldByName('NUMLOTE').asInteger           := 0;
    FieldByName('CODPORTFORMA').asInteger      := UltPortForma;
    FieldByName('CODPORTADOR').asInteger       := qryPortadorForma.FieldByName('CODPORTADOR').asInteger;
    FieldByName('CODFORMAPAGTO').asInteger     := qryPortadorForma.FieldByName('CODFORMAPAGTO').asInteger;
    FieldByName('CODTIPOPAGTO').asInteger      := qryPortadorForma.FieldByName('CODTIPOPAGTO').asInteger;
    FieldByName('FLGEMITEAVISO').asString      := qryPortadorForma.FieldByName('FLGEMITEAVISO').asString;
    FieldByName('CODARQUIVOREMESSA').asInteger := qryPortadorForma.FieldByName('CODARQUIVOREMESSA').asInteger;
    FieldByName('IDBANCO').asInteger           := qryPortadorForma.FieldByName('IDBANCO').asInteger;           //Portador Forma
    FieldByName('NOCONTACORR').asString        := qryPortadorForma.FieldByName('NOCONTACORR').asString;
    FieldByName('CODBARRA').asString           := '';
    FieldByName('CODBARRAVALOR').asString      := '';
    FieldByName('NODOCUMENTO').asFloat         := StrToFloat(IntToStr(qryArqPagto.FieldByName('IDPESSOA').asInteger)+Copy(sMesRef,1,4)); // Codigo que aparece no relatorio
    FieldByName('COMPLDOCUMENTO').asString     := Copy(sMesRef,6,2); // Codigo que aparece no relatorio
    FieldByName('TIPO').asString               := 'F';
    FieldByName('NUMEMPRESABANCO').asString    := qryPortadorForma.FieldByName('NUMEMPRESABANCO').asString;
    FieldByName('DEBCRE').asString             := '';
    Post;
  end;
end;

end.
