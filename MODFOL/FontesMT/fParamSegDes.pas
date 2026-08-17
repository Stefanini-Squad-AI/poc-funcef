// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamSegDes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook, Spin,
  checklst, IvDictio, IvMulti, IvEMulti, IniFiles, uGImp, ComCtrls, CMDateTimePicker,
  wwdbdatetimepicker, fSairAjuda, DBClient, uCMClientDataSet, uCtrlParamSegDes,
  uCtrlListTerceirosRH, uCtrlProvDesc, uCtrlPessoaFilialPessoa, uCtrlGlobalRH,
  uCtrlPessoaFuncionario, ColorCheckListBox;

type
  TfrmParamSegDes = class(TfrmSairAjuda)
    rbtnGerarArquivo: TBitBtn;
    ToolbarSep973: TToolbarSep97;
    btImprimir: TBitBtn;
    svdlgDialogo: TOpenDialog;
    GImp: TGImp;
    ToolbarSep971: TToolbarSep97;
    CdsAgBanc: TCMClientDataSet;
    btImprimirSolto: TBitBtn;
    gbDataRef: TGroupBox;
    dtedDataRef: TCMDateTimePicker;
    rgModeloImpressao: TRadioGroup;
    PageControl1: TPageControl;
    tbshEmpregado: TTabSheet;
    chklstFunc: TColorCheckListBox;
    bbtnSelTodosFunc: TBitBtn;
    bbtnInverteSelFunc: TBitBtn;
    tbshEstabelecimento: TTabSheet;
    chklstEstab: TColorCheckListBox;
    bbtnSelTodosEstab: TBitBtn;
    bbtnInverteSelEstab: TBitBtn;
    rgAgBanc: TRadioGroup;
    dblkcbAgencia: TwwDBLookupCombo;
    gbxSeleciona: TGroupBox;
    Label1: TLabel;
    Paginas: TPageControl;
    tbshMesResc: TTabSheet;
    chklstRubrica1: TColorCheckListBox;
    tbsh2MesesAnt: TTabSheet;
    chklstRubrica2: TColorCheckListBox;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    edCodRubricas: TEdit;
    sbtnMarcarRub: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btImprimirClick(Sender: TObject);
    procedure rbtnGerarArquivoClick(Sender: TObject);
    procedure dtedDataRefChange(Sender: TObject);
    procedure rgAgBancClick(Sender: TObject);
    procedure bbtnSelTodosFuncClick(Sender: TObject);
    procedure bbtnInverteSelFuncClick(Sender: TObject);
    procedure chklstFuncClickCheck(Sender: TObject);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure sbtnMarcarRubClick(Sender: TObject);
    procedure chklstRubrica1ClickCheck(Sender: TObject);
    procedure PaginasChange(Sender: TObject);
    procedure btImprimirSoltoClick(Sender: TObject);
    procedure bbtnSelTodosEstabClick(Sender: TObject);
    procedure bbtnInverteSelEstabClick(Sender: TObject);
  private
    ArqConfig: TIniFile;

    CtrlParamSegDes: TCtrlParamSegDes;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlProvDesc: TCtrlProvDesc;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;

    chkListAux: TColorCheckListBox;
    ListaIdEstab, ListaIdRubrica, ListaIdFunc: TStringList;

    ListaIdRubricaSel: array [0..1] of string;
    sListaIdEstabSel, FileName: string;

    function  GerarDadosSegDes: string;

    procedure MontaListaFuncionarios;
    procedure HabilitaBtOk;
    procedure LeAlteracoes;
    procedure GravaAlteracoes;
    procedure Progresso(Arg: array of variant);
  end;

var
  frmParamSegDes: TfrmParamSegDes;

implementation

uses uSistema, uMensErro, uCtrlPadroes, uCtrlFuncoesRH, fAguarde, uCtrlUsoGeralRH, dCds,
  RSegDesemprego;

{$R *.DFM}

procedure TfrmParamSegDes.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlParamSegDes := TCtrlParamSegDes.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlParamSegDes.InitializeAs(Padroes);
  CtrlParamSegDes.Progresso := Progresso;

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  CtrlProvDesc := TCtrlProvDesc.Create;
  CtrlProvDesc.InitializeAs(Padroes);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  ListaIdFunc := TStringList.Create;
  ListaIdRubrica := TStringList.Create;
  ListaIdEstab := TStringList.Create;

  // Apagar o índice se este existir
  dmCds.Cds.IndexName := '';
  if (dmCds.Cds.IndexDefs.IndexOf('Index1') > 0) then
    dmCds.Cds.DeleteIndex('Index1');

  // Lista de Estabelecimentos
  dmCds.Cds.Data := CtrlPessoaFilialPessoa.ListPessoaEstab(IntToStr(Sistema.IdEmpresa));
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdEstab.Add(dmCds.Cds.FieldByName('IDPESSOA').asString);
    chklstEstab.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
    chklstEstab.Checked[chklstEstab.Items.Count-1] := true;
    dmCds.Cds.Next;
  end;

  // Lista das Rubricas
  chklstRubrica1.Items.Clear;
  chklstRubrica2.Items.Clear;
  dmCds.Cds.Data := CtrlProvDesc.ListRubricaEmpresa(IntToStr(Sistema.IdEmpresa));
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdRubrica.Add(dmCds.Cds.FieldByName('CODPROVDESC').asString);
    chklstRubrica1.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
    chklstRubrica2.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
    dmCds.Cds.Next;
  end;

  CdsAgBanc.Data := CtrlListTerceirosRH.ListAgenciaBancaria;

  // Inicializa variáveis e valores dos objetos
  dtedDataRef.Date := CtrlGlobalRH.GetNormalIni;
  Paginas.ActivePageIndex := 0;
  FileName := Sistema.TempDir+'CmImpFolha.TXT';

  LeAlteracoes;
  MontaListaFuncionarios;
  PaginasChange(Sender);
end;

procedure TfrmParamSegDes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GravaAlteracoes;

  FreeAndNil(ListaIdRubrica);
  FreeAndNil(ListaIdFunc);
  FreeAndNil(ListaIdEstab);

  FreeAndNil(CtrlParamSegDes);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlProvDesc);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlPessoaFuncionario);
  inherited;
end;

procedure TfrmParamSegDes.dtedDataRefChange(Sender: TObject);
begin
  MontaListaFuncionarios;
end;

procedure TfrmParamSegDes.PaginasChange(Sender: TObject);
begin
  edCodRubricas.Text := ListaIdRubricaSel[Paginas.ActivePageIndex];

  case (Paginas.ActivePageIndex) of
    0 : chkListAux := chklstRubrica1;
    1 : chkListAux := chklstRubrica2;
  end;
end;

procedure TfrmParamSegDes.chklstFuncClickCheck(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamSegDes.chklstRubrica1ClickCheck(Sender: TObject);
begin
  FU.CriaListaOpcoes(chkListAux, ListaIdRubrica,
    ListaIdRubricaSel[Paginas.ActivePageIndex], ',', false);
  HabilitaBtOk;
  edCodRubricas.Text := ListaIdRubricaSel[Paginas.ActivePageIndex];
end;

procedure TfrmParamSegDes.rgAgBancClick(Sender: TObject);
begin
  dblkcbAgencia.Visible := (rgAgBanc.ItemIndex = 1);
end;

procedure TfrmParamSegDes.bbtnSelTodosFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count -1 do
    chklstFunc.Checked[c] := true;
  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamSegDes.bbtnInverteSelFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count -1 do
    chklstFunc.Checked[c] := not(chklstFunc.Checked[c]);
  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamSegDes.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chkListAux.Items.Count-1 do
    chkListAux.Checked[c] := true;

  FU.CriaListaOpcoes(chkListAux, ListaIdRubrica,
    ListaIdRubricaSel[Paginas.ActivePageIndex], ',', false);
  chkListAux.Repaint;
  edCodRubricas.Text := ListaIdRubricaSel[Paginas.ActivePageIndex];
  HabilitaBtOk;
end;

procedure TfrmParamSegDes.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chkListAux.Items.Count-1 do
    chkListAux.Checked[c] := not(chkListAux.Checked[c]);

  FU.CriaListaOpcoes(chkListAux, ListaIdRubrica,
    ListaIdRubricaSel[Paginas.ActivePageIndex], ',', false);
  chkListAux.Repaint;
  edCodRubricas.Text := ListaIdRubricaSel[Paginas.ActivePageIndex];
  HabilitaBtOk;
end;

procedure TfrmParamSegDes.bbtnSelTodosEstabClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count -1 do
    chklstEstab.Checked[c] := true;
  chklstEstab.Repaint;
  dtedDataRefChange(Sender);
end;

procedure TfrmParamSegDes.bbtnInverteSelEstabClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count -1 do
    chklstEstab.Checked[c] := not(chklstEstab.Checked[c]);
  chklstEstab.Repaint;
  dtedDataRefChange(Sender);
end;

procedure TfrmParamSegDes.sbtnMarcarRubClick(Sender: TObject);
begin
  edCodRubricas.Text := Trim(edCodRubricas.Text);

  FU.VerificaOpcoes(chkListAux, ListaIdRubrica, edCodRubricas.Text, ',');
  chkListAux.Repaint;

  ListaIdRubricaSel[Paginas.ActivePageIndex] := edCodRubricas.Text;
  HabilitaBtOk;
end;

procedure TfrmParamSegDes.btImprimirClick(Sender: TObject);
var
  Arq: TStringList;
begin
  if (GImp.Inicializar) then
  begin
    //GImp.EjetarPagina := false;
    //GImp.SaltodeLinhaCondensado := false;
    //GImp.TipoFonte := TfNormal;
    //GImp.Condensado := false;
    //GImp.Sublinhado := false;

    try
      Arq := TStringList.Create;
      Arq.Text := GerarDadosSegDes;

      frmAguarde.Apaga;
      if (Arq.Text = '') then
        MsgDlg('Não há dados a serem impressos.', 'Aviso', mtInformation, [mbOk,mbHelp], 0)
      else
      begin
        Arq.SaveToFile(FileName);
        frmAguarde.Mostra('Imprimindo dados...');
        GImp.ImprimirArquivo(FileName);
        GImp.Finalizar;
        DeleteFile(FileName);
        frmAguarde.Apaga;
        MsgDlg('Dados impressos com sucesso.', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
      end;
      Arq.Free;
    except
      on E: Exception do
      begin
        frmAguarde.Apaga;
        GImp.Finalizar;
        MsgDlg('Ocorreu um Erro ao Imprimir'+CR_LF+
          'Verifique a Impressora e tente novamente.'+CR_LF+'Erro:'+CR_LF+ CR_LF+ E.Message,
          'Erro', mtError, [mbOk, mbHelp], 0);
      end;
    end;
  end;
end;

procedure TfrmParamSegDes.rbtnGerarArquivoClick(Sender: TObject);
var
  Arq: TStringList;
begin
  if (SvDlgDialogo.Execute) then
  begin
    // Verifica se o arquivo existe na pasta escolhida
    if (FileExists(svdlgDialogo.FileName)) then
      if (MsgDlg('O arquivo já existe na pasta especificada.'+CR_LF+
            'Você deseja sobrescrevê-lo?', 'Aviso', mtConfirmation, [mbOK,mbCancel], 0) = mrCancel) then
        exit;

    try
      Arq := TStringList.Create;
      Arq.Text := GerarDadosSegDes;

      frmAguarde.Apaga;
      if (Arq.Text = '') then
        MsgDlg('Não há dados a serem gerados.', 'Aviso', mtInformation, [mbOk,mbHelp], 0)
      else
      begin
        frmAguarde.Mostra('Gerando Arquivo...');
        Arq.SaveToFile(SvDlgDialogo.FileName);
        frmAguarde.Apaga;
        MsgDlg('Arquivo gerado com sucesso.', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
      end;
      Arq.Free;
    except
      on E: Exception do
      begin
        frmAguarde.Apaga;
        MsgDlg('Erro durante a criação de ' +FileName +CR_LF+'Erro:'+CR_LF+ CR_LF+ E.Message,
          'Erro', mtError, [mbOk, mbHelp], 0);
      end;
    end;
  end;
end;

procedure TfrmParamSegDes.btImprimirSoltoClick(Sender: TObject);
var
  Rpt: TRptSegDesemprego;
  sListaIdFuncSel: string;
begin
  // Criar lista com os IDs dos funcionários escolhidos
  FU.CriaListaOpcoes(chklstFunc, ListaIdFunc, sListaIdFuncSel, ',', false);

  Rpt := TRptSegDesemprego.Create(Application);

  Rpt.ListaIdEstab := sListaIdEstabSel;
  Rpt.ListaIdFunc := sListaIdFuncSel;
  Rpt.AnoMes := FU.RetornaAnoMes(dtedDataRef.Date);
  Rpt.ListaIdRubricaMesRescisao := ListaIdRubricaSel[0];
  Rpt.ListaIdRubricaOutrosMeses := ListaIdRubricaSel[1];
  Rpt.TipoImpressaoAgenciaBanc:= rgAgBanc.ItemIndex;
  Rpt.NumAgenciaBanc := CdsAgBanc.FieldByName('NUMAGENCIA').asString;
  Rpt.NomeAgenciaBanc := CdsAgBanc.FieldByName('AGENCIA').asString;
  Rpt.DataRef := dtedDataRef.Date;

  Rpt.CrmRptCM.IdReports := 3162;
  Rpt.CrmRptCM.IdEmpresa := Sistema.IdEmpresa;
  Rpt.CrmRptCM.OrigemCM := 1;
  Rpt.CrmRptCM.IdModulo := Sistema.IdModulo;
  Rpt.CrmRptCM.IdUsuario := Sistema.IdUsuario;
  Rpt.CrmRptCM.Print;
  FreeAndNil(Rpt);
end;

// ------------------------------------------------------------------------------------------
// Funções do Form
// ------------------------------------------------------------------------------------------

procedure TfrmParamSegDes.Progresso(Arg: array of variant);
begin
  if (Arg[0] <> 0) then
  begin
    //CtrlParamSegDes.SQL.SaveToFile('C:\QRY.TXT');
    CtrlParamSegDes.SQL.SaveToFile( Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\QRY.TXT');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
    frmAguarde.Min := 0;
    frmAguarde.Max := Arg[0];
  end
  else
    frmAguarde.Pos := frmAguarde.Pos + 1;

  frmAguarde.Update;
end;

// Cria lista contendo os códigos dos funcionários
procedure TfrmParamSegDes.MontaListaFuncionarios;
begin
  // Estabelecimentos selecionados
  FU.CriaListaOpcoes(chklstEstab, ListaIdEstab, sListaIdEstabSel, ',', false);

  ListaIdFunc.Clear;
  chklstFunc.Items.BeginUpdate;
  chklstFunc.Items.Clear;

  if (sListaIdEstabSel <> '') then
  begin
    dmCds.Cds.Data := CtrlPessoaFuncionario.ListEmpresaFuncionario(Sistema.IdEmpresa, '',
      sListaIdEstabSel, 'D', '', '', '', '', FU.RetornaAnoMes(dtedDataRef.Date));

    while not(dmCds.Cds.EOF) do
    begin
      ListaIdFunc.Add(dmCds.Cds.FieldByName('IDPESSOA').asString);
      chklstFunc.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
      chklstFunc.Checked[chklstFunc.Items.Count-1] := true;
      dmCds.Cds.Next;
    end;
  end;
  HabilitaBtOk;
  chklstFunc.Items.EndUpdate;
end;

procedure TfrmParamSegDes.HabilitaBtOk;
var
  c: integer;
  bSelFunc, bSelRub1, bSelRub2: boolean;
begin
  bSelFunc := false;
  for c:=0 to chklstFunc.Items.Count-1 do
    if (chklstFunc.Checked[c]) then
    begin
      bSelFunc := true;
      break;
    end;

  // Verifica se alguma rubrica foi selecionada para o Mês da Rescisão
  bSelRub1 := false;
  for c:=0 to chklstRubrica1.Items.Count-1 do
    if (chklstRubrica1.Checked[c]) then
    begin
      bSelRub1 := true;
      break;
    end;

  // Verifica se alguma rubrica foi selecionada para os Dois Meses Anteriores à Rescisão
  bSelRub2 := false;
  for c:=0 to chklstRubrica2.Items.Count-1 do
    if (chklstRubrica2.Checked[c]) then
    begin
      bSelRub2 := true;
      break;
    end;

  rbtnGerarArquivo.Enabled := (bSelFunc) and (bSelRub1) and (bSelRub2) and
    (dtedDataRef.Text <> '');
  btImprimir.Enabled := rbtnGerarArquivo.Enabled;
  btImprimirSolto.Enabled := rbtnGerarArquivo.Enabled;
end;

procedure TfrmParamSegDes.LeAlteracoes;
begin
  // Recuperar as últimas alterações das opções
  //ArqConfig := TIniFile.Create('C:\CONFIG_FOLHAPAGTO.INI');
  ArqConfig := TIniFile.Create('C:\CONFIG_FOLHAPAGTO.INI');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  
  ListaIdRubricaSel[0] := ArqConfig.ReadString('REL_SEGDESEMPREGO', 'Rubricas1', '');
  FU.VerificaOpcoes(chklstRubrica1, ListaIdRubrica, ListaIdRubricaSel[0], ',');

  ListaIdRubricaSel[1] := ArqConfig.ReadString('REL_SEGDESEMPREGO', 'Rubricas2', '');
  FU.VerificaOpcoes(chklstRubrica2, ListaIdRubrica, ListaIdRubricaSel[1], ',');

  edCodRubricas.Text := ListaIdRubricaSel[0];

  rgModeloImpressao.ItemIndex := StrToInt(ArqConfig.ReadString('REL_SEGDESEMPREGO', 'ModeloImpressao', '0'));
end;

procedure TfrmParamSegDes.GravaAlteracoes;
var
  sGravaPadrao: string;
begin
  // Gravar as últimas alterações da Opção de Rubricas do Mês da Rescisão
  FU.CriaListaOpcoes(chklstRubrica1, ListaIdRubrica, sGravaPadrao, ',', false);
  ArqConfig.WriteString('REL_SEGDESEMPREGO', 'Rubricas1', sGravaPadrao);

  // Gravar as últimas alterações da Opção de Rubricas dos Meses anteriores
  FU.CriaListaOpcoes(chklstRubrica2, ListaIdRubrica, sGravaPadrao, ',', false);
  ArqConfig.WriteString('REL_SEGDESEMPREGO', 'Rubricas2', sGravaPadrao);

  // Gravar o Modelo de Impressão em Formato Contínuo
  ArqConfig.WriteString('REL_SEGDESEMPREGO', 'ModeloImpressao', IntToStr(rgModeloImpressao.ItemIndex));

  ArqConfig.Free;
end;

function TfrmParamSegDes.GerarDadosSegDes: string;
var
  sListaIdFuncSel: string;
begin
  // Criar lista com os IDs dos funcionários escolhidos
  FU.CriaListaOpcoes(chklstFunc, ListaIdFunc, sListaIdFuncSel, ',', false);

  frmAguarde.Mostra('Preparando dados...');
  frmAguarde.Pos := 0;

  CtrlParamSegDes.CreateThreadProgresso;
  Result := CtrlParamSegDes.GerarDadosImpressao(rgModeloImpressao.ItemIndex,
    dtedDataRef.Date, sListaIdEstabSel, sListaIdFuncSel, ListaIdRubricaSel[0],
    ListaIdRubricaSel[1], rgAgBanc.ItemIndex, CdsAgBanc.FieldByName('NUMAGENCIA').asString,
    CdsAgBanc.FieldByName('AGENCIA').asString);
  CtrlParamSegDes.FreeThreadProgresso;
end;

end.
