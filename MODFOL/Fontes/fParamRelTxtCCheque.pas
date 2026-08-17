// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamRelTxtCCheque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook, Spin,
  checklst, IvDictio, IvMulti, IvEMulti, uGImp, ExtDlgs, ComCtrls, fSairAjuda, Wwdatsrc,
  IniFiles, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmParamRelTxtCCheque = class(TfrmSairAjuda)
    qryMotivo: TwwQuery;
    gbxEstab: TGroupBox;
    gbxTipPag: TGroupBox;
    qryFunc: TwwQuery;
    qryMotivoIDMOTIVO: TFloatField;
    qryMotivoDESCRICAO: TStringField;
    dblkcbEstab: TwwDBLookupCombo;
    qryEstab: TwwQuery;
    gbxMesAnoRef: TGroupBox;
    qryParamRH: TwwQuery;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    gbxOrdImpress: TGroupBox;
    cmbOrderBy: TComboBox;
    qryPessoa: TwwQuery;
    ds: TwwDataSource;
    qryMargem: TwwQuery;
    rgProcesso: TRadioGroup;
    edNomeArqFrente: TEdit;
    edNomeArqVerso: TEdit;
    chklstTipoFolha: TCheckListBox;
    bbtnSelTodosTipoFolha: TBitBtn;
    bbtnInvSelTipoFolha: TBitBtn;
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
    cbxDemitidos: TCheckBox;
    qryBaseIRRF: TwwQuery;
    qryFGTS: TwwQuery;
    qrySalParticip: TwwQuery;
    qryBaseINSS: TwwQuery;
    qrySalBase: TwwQuery;
    qryDescontos: TwwQuery;
    qryProventos: TwwQuery;
    GImp: TGImp;
    SaveDialog: TSaveDialog;
    opnpicDoc: TOpenPictureDialog;
    OpenAplicativo: TOpenDialog;
    PrintDialogo: TPrintDialog;
    bbtnImagem: TBitBtn;
    bbtnGerar: TBitBtn;
    rbtnImprimir: TBitBtn;
    ToolbarSep973: TToolbarSep97;
    ToolbarSep972: TToolbarSep97;
    ToolbarSep974: TToolbarSep97;
    qryBaseFGTS: TwwQuery;
    Rubricas: TTabSheet;
    chklstRubrica: TCheckListBox;
    bbtnSelTodosRub: TBitBtn;
    bbtnInverteSelRub: TBitBtn;
    qryMargem2: TwwQuery;
    rgImprCab: TRadioGroup;
    rgAltura: TRadioGroup;
    gbxDatas: TGroupBox;
    dtPagamento: TCMDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnGerarClick(Sender: TObject);
    procedure rbtnImprimirClick(Sender: TObject);
    procedure dblkcbEstabChange(Sender: TObject);
    procedure bbtnImagemClick(Sender: TObject);
    procedure bbtnSelTodosTipoFolhaClick(Sender: TObject);
    procedure bbtnInvSelTipoFolhaClick(Sender: TObject);
    procedure chklstTipoFolhaDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure chklstTipoFolhaClickCheck(Sender: TObject);
    procedure speAnoChange(Sender: TObject);
    procedure gbxSituacaoEnter(Sender: TObject);
    procedure gbxSituacaoExit(Sender: TObject);
    procedure gbxTipContraEnter(Sender: TObject);
    procedure gbxTipContraExit(Sender: TObject);
    procedure chklstFuncClickCheck(Sender: TObject);
    procedure bbtnSelTodosFuncClick(Sender: TObject);
    procedure bbtnInverteSelFuncClick(Sender: TObject);
    procedure bbtnSelTodosRubClick(Sender: TObject);
    procedure bbtnInverteSelRubClick(Sender: TObject);
    procedure chklstRubricaClickCheck(Sender: TObject);
    procedure chklstRubricaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    ListaFunc, ListaTipoFolha: TStringList;

    sAux, sCodEstab, Mes, MesBarraAno: string;

    Gravou3, bSitAtivo, bSitDemit, bSitAfast, bTipContrEfet, bTipContrEspec,
    bTipContrTemp, bTipContrEst, bTipContrTerc, bTipContrProp, bTipContrAut: boolean;

    function  GeraTxt      (FileName,MesAno: string): boolean;
    function  GeraTxtMod1  (FileName,MesAno: string): boolean;
    function  GeraTxtMod2  (FileName,MesAno: string): boolean;
    function  GeraTxtMod3  (FileName,MesAno: string): boolean;
    function  GeraTxtMod4  (FileName,MesAno: string): boolean;
    function  GeraTxtMod5  (FileName,MesAno: string): boolean;
    function  GeraTxtMod99 (FileName,MesAno: string): boolean;
    function  CompStr      (a:string; Tam:integer; Letra:char; Direcao:boolean): string;
    function  SelSitFunc: string;
    function  SelTipoContrato: string;
    procedure HabilitaBtOk;
    procedure MudaListaFuncionarios;
    procedure GerarQuery;
    procedure LeAlteracoes;
    procedure GravaAlteracoes;
  end;

var
  frmParamRelTxtCCheque: TfrmParamRelTxtCCheque;
  msg, msg1, msg2: string;
  MesLongo: array[1..12] of string = ('JANEIRO', 'FEVEREIRO', 'MARCO', 'ABRIL',
    'MAIO', 'JUNHO', 'JULHO', 'AGOSTO', 'SETEMBRO', 'OUTUBRO', 'NOVEMBRO', 'DEZEMBRO');

implementation

uses {$IFNDEF VERSAO0505} uCMFileUtils, {$ENDIF}
  FileCtrl, uSistema, dRelatorios, uMensErro, uFuncoesUteisRH, fAguarde, uComumRelats,
  fPrincipal, UsoGeralRH, dBaseDados;

{$R *.DFM}

procedure TfrmParamRelTxtCCheque.FormCreate(Sender: TObject);
begin
  inherited;
  ListaTipoFolha := TStringList.Create;
  ListaFunc      := TStringList.Create;

  if not(Assigned(ListaCodRubrica)) then
    ListaCodRubrica := TStringList.Create;


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
  qryMotivo.Open;

  // Monta ChekListBox de Tipo de Folha
  chklstTipoFolha.Items.Clear;
  while not(qryMotivo.EOF) do
  begin
    ListaTipoFolha.Add(qryMotivo.FieldByName('IDMOTIVO').asString);
    chklstTipoFolha.Items.Add(qryMotivo.FieldByName('DESCRICAO').asString);
    qryMotivo.Next;
  end;

  // Monto a Lista de Rubricas
  chklstRubrica.Items.Clear;
  ListaCodRubrica.Clear;
  with (dtmBaseDados.qry) do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT');
    SQL.Add('  RP.CODPROVDESC, RP.DESCRPROVDESC ');
    SQL.Add('FROM');
    SQL.Add('  RUBRICAXPESS RP, PROVDESC PD');
    SQL.Add('WHERE');
    SQL.Add('  (RP.IDPESSOA    = ' +IntToStr(Sistema.IdEmpresa)+ ') AND');
    SQL.Add('  (PD.FLGTPRUBRICA LIKE ''%F%'') AND');
    SQL.Add('  (PD.IDPROVENTO  = RP.IDRUBRICA)');
    SQL.Add('ORDER BY');
    SQL.Add('  UPPER(DESCRPROVDESC)');
    Open;
    while not(EOF) do
    begin
      ListaCodRubrica.Add(FieldByName('CODPROVDESC').asString);
      chklstRubrica.Items.Add(FieldByName('DESCRPROVDESC').asString);
      Next;
    end;
  end;


  rgAltura.Visible        := (frmPrincipal.iIDContraCheque = 99);
  rgImprCab.Visible       := (frmPrincipal.iIDContraCheque = 99);
  bbtnImagem.Visible      := (frmPrincipal.iIDContraCheque = 3);
  ToolbarSep972.Visible   := (frmPrincipal.iIDContraCheque = 3);
  edNomeArqFrente.Visible := (frmPrincipal.iIDContraCheque = 3);
  ToolbarSep974.Visible   := (frmPrincipal.iIDContraCheque <> 2) and (frmPrincipal.iIDContraCheque <> 5);
  rbtnImprimir.Visible    := (frmPrincipal.iIDContraCheque <> 2) and (frmPrincipal.iIDContraCheque <> 5);
  //                     and (frmPrincipal.iIDContraCheque <> 3);
  gbxDatas.Visible        := (frmPrincipal.iIDContraCheque = 5);
  //edNomeArqVerso.Visible := (frmPrincipal.iIDContraCheque = 3);

  Gravou3              := false;
  cmbMes.ItemIndex     := ExtraiMes(qryParamRH.FieldByName('NORMALINI').asDateTime) - 1;
  speAno.Text          := Copy(qryParamRH.FieldByName('NORMALINI').asString,7,4);
  dtPagamento.Date     := qryParamRH.FieldByName('NORMALFIM').asDateTime;
  cmbOrderBy.ItemIndex := 0;
  LeAlteracoes;
end;

procedure TfrmParamRelTxtCCheque.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ListaFunc.Free;
  ListaTipoFolha.Free;

  qryMotivo.Close;
  qryFunc.Close;
  qryEstab.Close;
  qryParamRH.Close;
  inherited;
  GravaAlteracoes;
end;

function TfrmParamRelTxtCCheque.SelSitFunc: string;
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

function TfrmParamRelTxtCCheque.SelTipoContrato: string;
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

procedure TfrmParamRelTxtCCheque.HabilitaBtOk;
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

  bbtnGerar.Enabled := (bSel) and (dblkcbEstab.Text <> '') and (Trim(speAno.Text) <> '');
  rbtnImprimir.Enabled := bbtnGerar.Enabled;
end;

// Cria lista contendo os códigos dos funcionários
procedure TfrmParamRelTxtCCheque.MudaListaFuncionarios;
begin
  qryFunc.Close;
  ListaFunc.Clear;
  chklstFunc.Items.Clear;

  if (dblkcbEstab.Text <> '') then
  begin
    with (qryFunc.SQL) do
    begin
      Clear;
      Add ('SELECT DISTINCT');
      Add ('  PF.IDPESSOA, PF.NOME AS EMPREGADO');
      Add ('FROM');
      Add ('  PESSOA PF, FUNCIONARIO F, SITFUNC ST');
      Add ('WHERE');
      Add ('  (F.IDESTAB         = ' +qryEstab.FieldByName('CODIGO').asString+ ') AND');

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
          Add ('  (F.CODCENTROCUSTO IN ' +sUsuXccusto+ ') AND')
        else
          Add ('  (F.CODCENTROCUSTO  = ' +sUsuXccusto+ ') AND');
      end;

      sAux := SelTipoContrato;
      if (Pos(',',sAux) > 0) then
        Add('  (F.TIPOCONTRATO    IN (' +sAux+ ')) AND')
      else
        Add('  (F.TIPOCONTRATO     = ' +sAux+ ') AND');

      Add ('  (ST.IDSITFUNC      = F.IDSITFUNC) AND');
      Add ('  (F.IDPESSOA        = PF.IDPESSOA)');
      Add ('ORDER BY');
      Add ('  UPPER(EMPREGADO)');
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

procedure TfrmParamRelTxtCCheque.chklstTipoFolhaDrawItem(Control: TWinControl; Index: Integer;
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
    TextOut(Rect.Left, Rect.Top, TCheckListBox(Control).Items[Index]);
  end;
end;

procedure TfrmParamRelTxtCCheque.speAnoChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamRelTxtCCheque.dblkcbEstabChange(Sender: TObject);
begin
  dblkcbEstab.Text := Trim(dblkcbEstab.Text);

  if (dblkcbEstab.Text <> sCodEstab) then
  begin
    MudaListaFuncionarios;
    
    sCodEstab := dblkcbEstab.Text;

    if (Paginas.ActivePage = tbshListaFunc) then
      chklstFunc.Repaint;
  end;
end;

procedure TfrmParamRelTxtCCheque.gbxSituacaoEnter(Sender: TObject);
begin
  bSitAtivo := cbxAtivos.Checked;
  bSitAfast := cbxAfastados.Checked;
  bSitDemit := cbxDemitidos.Checked;
end;

procedure TfrmParamRelTxtCCheque.gbxSituacaoExit(Sender: TObject);
begin
  if not(cbxAtivos.Checked) and not(cbxAfastados.Checked) and not(cbxDemitidos.Checked) then
  begin
    MsgDlg ('Pelo menos um Tipo de Situação deve ser selecionado !','Aviso', mtInformation,[mbOk,mbHelp],0);
    gbxSituacao.SetFocus;
  end
  else
  if (bSitAtivo <> cbxAtivos.Checked) or (bSitAfast <> cbxAfastados.Checked) or
     (bSitDemit <> cbxDemitidos.Checked) then
    MudaListaFuncionarios;
end;

procedure TfrmParamRelTxtCCheque.gbxTipContraEnter(Sender: TObject);
begin
  bTipContrEfet  := cbxEfetivos.Checked;
  bTipContrEspec := cbxEspeciais.Checked;
  bTipContrTemp  := cbxTemporarios.Checked;
  bTipContrEst   := cbxEstagiarios.Checked;
  bTipContrTerc  := cbxTerceiros.Checked;
  bTipContrProp  := cbxProprietarios.Checked;
  bTipContrAut   := cbxAutonomos.Checked;
end;

procedure TfrmParamRelTxtCCheque.gbxTipContraExit(Sender: TObject);
begin
  if not(cbxEfetivos.Checked)      and not(cbxEspeciais.Checked) and
     not(cbxTemporarios.Checked)   and not(cbxTerceiros.Checked) and
     not(cbxProprietarios.Checked) and not(cbxAutonomos.Checked) and
     not(cbxEstagiarios.Checked) then
  begin
    MsgDlg ('Pelo menos um Tipo de Contrato deve ser selecionado !','Aviso', mtInformation,[mbOk,mbHelp],0);
    cbxEfetivos.SetFocus;
  end
  else
  begin
    if (bTipContrEfet <> cbxEfetivos.Checked)    or (bTipContrEspec <> cbxEspeciais.Checked)     or
       (bTipContrTemp <> cbxTemporarios.Checked) or (bTipContrEst   <> cbxEstagiarios.Checked)   or
       (bTipContrTerc <> cbxTerceiros.Checked)   or (bTipContrProp  <> cbxProprietarios.Checked) or
       (bTipContrAut  <> cbxAutonomos.Checked) then
      MudaListaFuncionarios;
  end;
end;

procedure TfrmParamRelTxtCCheque.chklstTipoFolhaClickCheck(Sender: TObject);
begin
  HabilitaBtOk;
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmParamRelTxtCCheque.chklstFuncClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmParamRelTxtCCheque.bbtnSelTodosTipoFolhaClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstTipoFolha.Items.Count-1 do
    chklstTipoFolha.Checked[c] := true;

  chklstTipoFolhaClickCheck(Sender);
end;

procedure TfrmParamRelTxtCCheque.bbtnInvSelTipoFolhaClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstTipoFolha.Items.Count-1 do
    chklstTipoFolha.Checked[c] := not(chklstTipoFolha.Checked[c]);

  chklstTipoFolhaClickCheck(Sender);
end;

procedure TfrmParamRelTxtCCheque.bbtnSelTodosFuncClick(Sender: TObject);
var
  C: integer;
begin
  for C:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[C] := true;

  if (Paginas.ActivePage = tbshListaFunc) then
    chklstFunc.Repaint;
end;

procedure TfrmParamRelTxtCCheque.bbtnInverteSelFuncClick(Sender: TObject);
var
  C: integer;
begin
  for C:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[C] := not(chklstFunc.Checked[C]);

  if (Paginas.ActivePage = tbshListaFunc) then
    chklstFunc.Repaint;
end;

procedure TfrmParamRelTxtCCheque.bbtnImagemClick(Sender: TObject);
begin
  //if MsgDlg('Responda SIM para a Frente e NÃO para o Verso','Confirmação ',mtConfirmation,
  //                        [mbYes,mbNo,mbHelp],0) = mrYes
//  begin
    if (opnPicDoc.Execute) then
    begin
      edNomeArqFrente.Text := MinimizeName(OpnPicDoc.FileName,Self.Canvas,edNomeArqFrente.Width);
      //PrintDialogo.FileName := OpnPicDoc.FileName;
      //PrintDialogo.Execute;
    end
    else
      edNomeArqFrente.Text := '';
{  end
  else
  begin
    if (opnPicDoc.Execute) then
    begin
      edNomeArqVerso.Text := OpnPicDoc.FileName;
      PrintDialogo.Execute;
    end
    else
      edNomeArqVerso.Text := '';
  end;}
end;

procedure TfrmParamRelTxtCCheque.GerarQuery;
var
  wNum: word;
  K: integer;
  NomeTabela, sQueryFunc, sQueryTipoFolha: string;
  bDemInformativo: Boolean;
begin
  inherited;
  if (rgProcesso.ItemIndex = 0) then
    NomeTabela := 'PREVIAFOLPAG' // Prévia
  else
    NomeTabela := 'HISTRUBSAL';

  Mes         := IntToStr(speAno.Value) +'/'+ PoeZero (cmbMes.ItemIndex + 1);
  MesBarraAno := Copy(MES,6,2) +'/'+ Copy(MES,1,4);

  // Funcionários escolhidos
  wNum := CriaListaOpcoes (chklstFunc, ListaFunc, sQueryFunc, ',', false);
  if (wNum = ListaFunc.Count) then
    sQueryFunc := '';

  wNum := CriaListaOpcoes (chklstRubrica, ListaCodRubrica, sCodRubricaSel, ',', false);

  bDemInformativo := (wNum > 0);

  // Rubricas para Remuneração selecionadas
  K := CriaListaOpcoes (chklstTipoFolha, ListaTipoFolha, sQueryTipoFolha, ',', true);

  if (K > 1) and (MsgDlg('Confirma Mesmo Demonstrativo para Mais de um Tipo de Pagamento ?',
                         'Confirmação ',mtConfirmation, [mbYes,mbNo,mbHelp],0) <> mrYes) then
    exit;

  if (bDemInformativo) and (MsgDlg('Confirma Mesmo Demonstrativo Selecionado e Apenas Informativo ?',
                         'Confirmação ',mtConfirmation, [mbYes,mbNo,mbHelp],0) <> mrYes) then
    exit;


  if (K > 0) then
  begin
    frmAguarde.Mostra ('Gerando Dados - FUNCIONÁRIOS');
    frmAguarde.pbAguarde.Hide;
    frmAguarde.UpDate;
    qryPessoa.Close;
    with (qryPessoa.SQL) do
    begin
      Clear;
      Add('SELECT DISTINCT');
      Add('  PJ.RAZAOSOCIAL AS EMPRESA,');
      Add('  PF.NOME AS EMPREGADO, PF.IDPESSOA, PFIS.NUMDEPSALF, PFIS.NUMDEPIRRF,');
      Add('  F.NUMCONTASALARIO, AG.NUMAGENCIA, B.NUMBANCO, C.TITULO, CC.NOME AS NOMECC,');
      Add('  F.MATRICULA, F.IDCARGO, F.IDEMPRESA, F.IDFAIXACARGO, F.IDFUNCAO,');
      Add('  CGC.NUM AS CGC, CGC.TIPO AS TIPOCGC,');
      Add('  RTRIM(DECODE(RTRIM(ESTADUAL.NUMDOCUMENTO),'''',');
      Add('    DECODE(RTRIM(MUNICIPAL.NUMDOCUMENTO),'''','''',');
      Add('    ''Inscrição Municipal: ''|| MUNICIPAL.NUMDOCUMENTO),');
      Add('    ''Inscrição Estadual: '' || ESTADUAL.NUMDOCUMENTO)) AS ESTADUALMUNICIPAL,');
      Add('  RTRIM(ENDJ.LOGRADOURO) ||'', ''|| ENDJ.NUMERO ||''''|| DECODE(ENDJ.COMPLEMENTO,'' '','' - '' ||''''||');
      Add('    RTRIM(ENDJ.COMPLEMENTO)) ||'' - ''|| RTRIM(ENDJ.BAIRRO) ||'' - ''|| RTRIM(CIDADES.NOME) ||'' - CEP:''||');
      Add('    RTRIM(SUBSTR(ENDJ.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(ENDJ.CEP,6,3)) AS ENDEMPRESA,');

      if (frmPrincipal.iIDContraCheque = 1) then  // 1 = Serpros
        Add('  F.CODCENTROCUSTO AS CENTROCUSTO, PPP.INSCRICAONUMERO, RTRIM(C2.TITULO) AS FUNCAO,')
      else
        Add('  F.CODCENTROCUSTO AS CENTROCUSTO, RTRIM(C2.TITULO) AS FUNCAO, '' '' AS INSCRICAONUMERO,');

      if (frmPrincipal.iIDContraCheque = 5) then  // 5 = CTRQ
        Add('  HT.NOMEHORARIO,');

      Add('  F.DATAADMISSAO,');
      Add('  rtrim(end.logradouro) || '', '' || rtrim(end.numero) || '' '' || rtrim(end.complemento) as endereco,');
      Add('  cid.nome as cidade, end.codestado, end.cep, DECODE(DOC.IDDOCUMENTO,NULL,''  '',DOC.NUMDOCUMENTO) AS CARTPROF');
      Add('FROM');

      if (frmPrincipal.iIDContraCheque = 1) then // 1 = Serpros
      begin
        Add(' (SELECT IDPESSOA,NUMDOCUMENTO AS INSCRICAONUMERO ');
        Add('  FROM DOCPESSOA ');
        Add('  WHERE IDDOCUMENTO = 145) PPP, ');
      end;

      Add('  '+NomeTabela+' H, PESSOA PF, PESSOA PJ, PESSOAFISICA PFIS, ENDPESS END,');
      Add('  ENDPESS ENDJ, PROVDESC P, RUBRICAXPESS  RP, FUNCIONARIO F, CIDADES CID,');
      Add('  CIDADES, AGENCIABANCARIA AG, BANCO B, CARGO C, CARGO C2, CENTCUST CC,'+
        IFF((sQueryFunc = ''),'SITFUNC ST,',''));

      if (frmPrincipal.iIDContraCheque = 5) then  // 5 = CTRQ
        Add('  HORATRAB HT,');

      // -------------------------------------------------------------------------- //
      Add('  (SELECT D.NUMDOCUMENTO,D.IDDOCUMENTO, D.IDPESSOA');
      Add('   FROM   DOCPESSOA D, TIPODOCOFICIAL TDO');
      Add('   WHERE (TDO.CODDOCUMENTO = ''24'') AND');
      Add('         (D.IDDOCUMENTO    = TDO.IDDOCUMENTO)) DOC,');
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
      // CGC do Estabelecimento
      Add('  (SELECT FP.IDFILIALPESSOA, TDO.SIGLADOCUMENTO AS TIPO,');
      Add('          (DO.NUMDOCUMENTO) AS NUM');
      Add('   FROM   DOCPESSOA DO, TIPODOCOFICIAL TDO, FILIALPESSOA FP');
      Add('   WHERE  ((TDO.SIGLADOCUMENTO = ''CNPJ:'')    OR');
      Add('           (TDO.SIGLADOCUMENTO = ''CGC:''))   AND');
      Add('          (TDO.IDDOCUMENTO     = DO.IDDOCUMENTO) AND');
      Add('          (DO.IDPESSOA         = FP.IDFILIALPESSOA)) CGC');
      // -------------------------------------------------------------------------- //
      Add('WHERE');
      Add('  (PJ.IDPESSOA  = ' +qryEstab.FieldByName('CODIGO').asString+ ') AND');
      Add('  (F.IDESTAB    = ' +qryEstab.FieldByName('CODIGO').asString+ ') AND');

      // Funcionário selecionado
      if (sQueryFunc <> '') then
      begin
        if (Pos(',',sQueryFunc) > 0) then
          Add('  (F.IDPESSOA  IN (' +sQueryFunc+ ')) AND')
        else
          Add('  (F.IDPESSOA   = ' +sQueryFunc+ ') AND');
      end
      else
      begin
        // C. de Custo(s) habilitados para o usuário
        if (sUsuXccusto <> '') then
        begin
          if (Pos(',',sUsuXccusto) > 0) then
            Add('  (F.CODCENTROCUSTO IN ' +sUsuXccusto+ ') AND')
          else
            Add('  (F.CODCENTROCUSTO = ' +sUsuXccusto+ ') AND');
        end;

        sAux := SelSitFunc;
        if (sAux <> '') then
          if (Pos(',',sAux) > 0) then
            Add('  (ST.TIPOSIT  IN (' +sAux+ ')) AND')
          else
            Add('  (ST.TIPOSIT   = ' +sAux+ ') AND');

        sAux := SelTipoContrato;
        if (Pos(',',sAux) > 0) then
          Add('  (F.TIPOCONTRATO IN (' +sAux+ ')) AND')
        else
          Add('  (F.TIPOCONTRATO = ' +sAux+ ') AND');

        Add('  (ST.IDSITFUNC           = F.IDSITFUNC)        AND');
      end;

      Add('  (H.IDPESSJUR         = ' +IntToStr(Sistema.IdEmpresa)+ ') AND');
      Add('  (H.MES               = ' +QuotedStr(MES)+ ') AND');

      if (Pos(',',sQueryTipoFolha) > 0) then
        Add('  (H.IDMOTIVO         IN (' +sQueryTipoFolha+ ')) AND')
      else
        Add('  (H.IDMOTIVO          = ' +sQueryTipoFolha+ ') AND');

      Add('  (F.IDESTAB           = PJ.IDPESSOA)           AND');
      Add('  (PJ.IDPESSOA         = CGC.IDFILIALPESSOA)    AND');
      Add('  (F.IDPESSOA          = PF.IDPESSOA)           AND');
      Add('  (F.IDPESSOA          = PFIS.IDPESSOA)         AND');
      Add('  (F.IDEMPRESA         = CC.IDEMPRESA)          AND');
      Add('  (F.CODCENTROCUSTO    = CC.CODCENTROCUSTO)     AND');
      Add('  (F.IDCARGO           = C.IDCARGO)             AND');
      Add('  (F.IDEMPRESA         = RP.IDPESSOA)           AND');
      Add('  (F.IDPESSOA          = H.IDPESSOA)            AND');
      Add('  (H.IDRUBRICA         = RP.IDRUBRICA)          AND');
      Add('  (H.IDRUBRICA         = P.IDPROVENTO)          AND');

      if (frmPrincipal.iIDContraCheque = 5) then  // 5 = CTRQ
        Add('   (F.IDHORARIO          = HT.IDHORARIO)            AND');

      Add('  (PF.IDPESSOA         = DOC.IDPESSOA(+))       AND');
      Add('  (PF.IDENDRESIDENCIAL = END.IDENDERECO(+))     AND');
      Add('  (PF.IDPESSOA         = END.IDPESSOA(+))       AND');
      Add('  (END.IDCIDADES       = CID.IDCIDADES(+))      AND');
      Add('  (AG.IDBANCO          = B.IDPESSOA(+))         AND');
      Add('  (F.IDAGENCIASALARIO  = AG.IDPESSOA(+))        AND');
      Add('  (PJ.IDENDCOMERCIAL   = ENDJ.IDENDERECO(+))    AND');
      Add('  (PJ.IDPESSOA         = ENDJ.IDPESSOA(+))      AND');
      Add('  (ENDJ.IDCIDADES      = CIDADES.IDCIDADES(+))  AND');
      Add('  (PJ.IDPESSOA         = ESTADUAL.IDPESSOA(+))  AND');
      Add('  (PJ.IDPESSOA         = MUNICIPAL.IDPESSOA(+)) AND');
      if (frmPrincipal.iIDContraCheque = 1) then // 1 = Serpros
      begin
        Add('  (F.IDFUNCAO          = C2.IDCARGO(+))         AND');
        Add('  (H.IDPESSOA          = PPP.IDPESSOA(+))');
      end
      else
        Add('  (F.IDFUNCAO          = C2.IDCARGO(+))');

      Add ('ORDER BY');
      case (cmbOrderBy.ItemIndex) of
        1 :  Add('  F.IDEMPRESA, CENTROCUSTO, UPPER(EMPREGADO)');
        2 :  Add('  F.IDEMPRESA, CENTROCUSTO, MATRICULA');
        3 :  Add('  F.IDEMPRESA, MATRICULA');
        else Add('  F.IDEMPRESA, UPPER(EMPREGADO)');
      end;
      //SaveToFile('c:\qry.txt');
      SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
    end;
    qryPessoa.Open;

    // ------------------------------------------------------------------------------------
    // PROVENTOS
    // ------------------------------------------------------------------------------------
    frmAguarde.Mostra ('Gerando Dados - PROVENTOS');
    frmAguarde.UpDate;
    qryProventos.Close;
    with (qryProventos.SQL) do
    begin
      Clear;
      Add ('SELECT DISTINCT');
      Add ('  P.CODRUBCLT AS CODRUBRICA,');
      Add ('  RP.CODPROVDESC,');
      Add ('  RP.DESCRPROVDESC AS DESCRICAO,');
      Add ('  H.VALORPROVENTO, H.MES, H.REFERENCIA, H.SEQRUBRICA');
      Add ('FROM');
      Add ('  '+NomeTabela+' H, PROVDESC P, RUBRICAXPESS RP');
      Add ('WHERE');
      if bDemInformativo then
      begin
        Add ('  (P.FLGDESCONTO <> 1)            AND');
        Add ('  (H.CODPROVDESC IN (' + sCodRubricaSel + '))            AND');
      end
      else
        Add ('  (P.FLGDESCONTO = 0)            AND');
      Add ('  (H.IDPESSOA    = :IDPESSOA)    AND');
      Add ('  (H.MES         = ' +QuotedStr(MES)+ ') AND');

      if (Pos(',',sQueryTipoFolha) > 0) then
        Add ('  (H.IDMOTIVO   IN (' +sQueryTipoFolha+ ')) AND')
      else
        Add ('  (H.IDMOTIVO    = ' +sQueryTipoFolha+ ') AND');

      Add ('  (RP.IDRUBRICA  = H.IDRUBRICA) AND');
      Add ('  (RP.IDPESSOA   = H.IDPESSJUR) AND');
      Add ('  (P.IDPROVENTO  = H.IDRUBRICA)');
      Add ('ORDER BY UPPER(CODPROVDESC)');
    end;
    qryProventos.Open;

    // ------------------------------------------------------------------------------------
    // DESCONTOS
    // ------------------------------------------------------------------------------------
    frmAguarde.Mostra ('Gerando Dados - DESCONTOS');
    frmAguarde.UpDate;
    qryDescontos.Close;
    with (qryDescontos.SQL) do
    begin
      Clear;
      Add ('SELECT DISTINCT');
      Add ('  P.CODRUBCLT AS CODRUBRICA,');
      Add ('  RP.CODPROVDESC,');
      Add ('  RP.DESCRPROVDESC AS DESCRICAO,');
      Add ('  H.VALORPROVENTO, H.MES, H.REFERENCIA, H.SEQRUBRICA');
      Add ('FROM');
      Add ('  '+NomeTabela+' H, PROVDESC P, RUBRICAXPESS RP');
      Add ('WHERE');
      Add ('  (P.FLGDESCONTO = 1)            AND');
      if bDemInformativo then
        Add ('  (H.CODPROVDESC IN (' + sCodRubricaSel + '))            AND');
      Add ('  (H.IDPESSOA    = :IDPESSOA)    AND');
      Add ('  (H.MES         = ' +QuotedStr(MES)+ ') AND');

      if (Pos(',',sQueryTipoFolha) > 0) then
        Add ('  (H.IDMOTIVO   IN (' +sQueryTipoFolha+ ')) AND')
      else
        Add ('  (H.IDMOTIVO    = ' +sQueryTipoFolha+ ') AND');

      Add ('  (RP.IDRUBRICA  = H.IDRUBRICA) AND');
      Add ('  (RP.IDPESSOA   = H.IDPESSJUR) AND');
      Add ('  (P.IDPROVENTO  = H.IDRUBRICA)');
      Add ('ORDER BY UPPER(CODPROVDESC)');
    end;
    qryDescontos.Open;


    if not bDemInformativo then
    begin

      // ------------------------------------------------------------------------------------
      // Salario Base
      // ------------------------------------------------------------------------------------
      frmAguarde.Mostra ('Gerando Dados - SAL. BASE');
      frmAguarde.UpDate;
      qrySalBase.Close;
      with (qrySalBase.SQL) do
      begin
        Clear;
        Add ('  SELECT                                     ');
        Add ('   H.VALORPROVENTO AS SALBASE                ');
        Add ('  FROM '+NomeTabela+' H, PROVDESC P          ');
        Add ('  WHERE                                      ');
        Add ('   (H.IDMOTIVO IN ('+sQueryTipoFolha+')) AND ');
        Add ('   (H.IDPESSOA  = :IDPESSOA)       AND       ');
        Add ('   (H.MES  = ' +QuotedStr(MES)+ ') AND       ');
        Add ('   (P.CODRUBCLT = ''60052'')       AND       ');
        Add ('   (H.IDRUBRICA = P.IDPROVENTO)              ');
        Add ('  UNION                                      ');
        Add ('  SELECT                                     ');
        Add ('   F.SALARIOATUAL *                          ');
        Add ('   DECODE(F.TIPOPAGAMENTO,''M'',1,H.JORNADAMENSAL) AS SALBASE ');
        Add ('  FROM                                       ');
        Add ('   FUNCIONARIO F, HORATRAB H                 ');
        Add ('  WHERE                                      ');
        Add ('   (F.IDPESSOA  = :IDPESSOA) AND             ');
        Add ('   (F.IDHORARIO = H.IDHORARIO)               ');
      end;
      qrySalBase.Open;

      // ------------------------------------------------------------------------------------
      // Salário de Contribuição de INSS e Salário Participação Prev. Privada
      // ------------------------------------------------------------------------------------
      frmAguarde.Mostra ('Gerando Dados - INSS');
      frmAguarde.UpDate;
      qryBaseINSS.Close;
      with (qryBaseINSS.SQL) do
      begin
        Clear;
        Add ('SELECT');
        Add ('  H1.VALORPROVENTO AS VALORBASEINSS');
        Add ('FROM');
        Add ('  '+NomeTabela+' H1, PROVDESC P1');
        Add ('WHERE');
        Add ('  (H1.IDPESSOA   = :IDPESSOA)     AND');
        Add ('  (H1.MES        = ' +QuotedStr(MES)+ ') AND');

        if (Pos(',',sQueryTipoFolha) > 0) then
          Add ('  (H1.IDMOTIVO  IN (' +sQueryTipoFolha+ ')) AND')
        else
          Add ('  (H1.IDMOTIVO   = ' +sQueryTipoFolha+ ') AND');

        if (frmPrincipal.iIDContraCheque = 3) then // 3 = FUNCEF
           Add ('  (P1.CODRUBCLT  = ''60056'') AND')
        else
           Add ('  (P1.CODRUBCLT IN (''60014'',''60025'',''62015'',''60017'',''60035'',''60421'',''62016'')) AND');

        Add ('  (P1.IDPROVENTO = H1.IDRUBRICA)');
      end;
      qryBaseINSS.Open;

      qrySalParticip.Close;
      with (qrySalParticip.SQL) do
      begin
        Clear;
        Add ('SELECT');
        Add ('  H1.VALORPROVENTO AS VALORSALPART ');
        Add ('FROM');
        Add ('  '+NomeTabela+' H1, PROVDESC P1');
        Add ('WHERE');
        Add ('  (H1.IDPESSOA   = :IDPESSOA)     AND');
        Add ('  (H1.MES        = ' +QuotedStr(MES)+ ') AND');

        if (Pos(',',sQueryTipoFolha) > 0) then
          Add ('  (H1.IDMOTIVO  IN (' +sQueryTipoFolha+ ')) AND')
        else
          Add ('  (H1.IDMOTIVO   = ' +sQueryTipoFolha+ ') AND');

        Add ('  (P1.CODRUBCLT  = ''90011'')     AND');
        Add ('  (P1.IDPROVENTO = H1.IDRUBRICA)');
      end;
      qrySalParticip.Open;

      // ------------------------------------------------------------------------------------
      // Base do FGTS
      // ------------------------------------------------------------------------------------
      frmAguarde.Mostra ('Gerando Dados - Base do FGTS');
      frmAguarde.UpDate;
      qryBaseFGTS.Close;
      with (qryBaseFGTS.SQL) do
      begin
        Clear;
        Add ('SELECT');
        Add ('  SUM(H1.VALORPROVENTO) AS BASEFGTS');
        Add ('FROM');
        Add ('  '+NomeTabela+' H1, PROVDESC P1');
        Add ('WHERE');
        Add ('  (H1.IDPESSOA   = :IDPESSOA)     AND');
        Add ('  (H1.MES        = ' +QuotedStr(MES)+ ') AND');

        if (Pos(',',sQueryTipoFolha) > 0) then
          Add ('  (H1.IDMOTIVO  IN (' +sQueryTipoFolha+ ')) AND')
        else
          Add ('  (H1.IDMOTIVO   = ' +sQueryTipoFolha+ ') AND');

        Add ('  (P1.CODRUBCLT IN (''60695'',''62022'')) AND');
        Add ('  (P1.IDPROVENTO = H1.IDRUBRICA)');
      end;
      qryBaseFGTS.Open;

      // ------------------------------------------------------------------------------------
      // Base de Cálculo FGTS
      // ------------------------------------------------------------------------------------
      frmAguarde.Mostra ('Gerando Dados - FGTS');
      frmAguarde.UpDate;
      qryFGTS.Close;
      with (qryFGTS.SQL) do
      begin
        Clear;
        Add ('SELECT');
        Add ('  SUM(H1.VALORPROVENTO) AS VALORFGTS');
        Add ('FROM');
        Add ('  '+NomeTabela+' H1, PROVDESC P1');
        Add ('WHERE');
        Add ('  (H1.IDPESSOA   = :IDPESSOA) AND');
        Add ('  (H1.MES        = ' +QuotedStr(MES)+ ') AND');
        if (Pos(',',sQueryTipoFolha) > 0) then
          Add ('  (H1.IDMOTIVO      IN (' +sQueryTipoFolha+ ')) AND')
        else
          Add ('  (H1.IDMOTIVO       = ' +sQueryTipoFolha+ ') AND');

        Add ('  (P1.CODRUBCLT IN (''40695'',''43696'',''43700'')) AND');
        Add ('  (P1.IDPROVENTO = H1.IDRUBRICA)');
      end;
      qryFGTS.Open;

      // ------------------------------------------------------------------------------------
      // Base de Cálculo do IRRF
      // ------------------------------------------------------------------------------------
      frmAguarde.Mostra ('Gerando Dados - IRRF');
      frmAguarde.UpDate;
      qryBaseIRRF.Close;
      with (qryBaseIRRF.SQL) do
      begin
        Clear;
        if (frmPrincipal.iIDContraCheque = 3) then // 3 = FUNCEF
        begin
           Add ('SELECT');
           Add ('  SUM(H1.VALORPROVENTO) AS VALORBASEIRRF');
           Add ('FROM');
           Add ('  '+NomeTabela+' H1, PROVDESC P1');
           Add ('WHERE');
           Add ('  (H1.IDPESSOA   = :IDPESSOA) AND');
           Add ('  (H1.MES        = ' +QuotedStr(MES)+ ') AND');

           if (Pos(',',sQueryTipoFolha) > 0) then
             Add ('  (H1.IDMOTIVO  IN (' +sQueryTipoFolha+ ')) AND')
           else
             Add ('  (H1.IDMOTIVO   = ' +sQueryTipoFolha+ ') AND');

           Add ('  (P1.CODRUBCLT IN (''60026'',''60028'',''62026'',''60027'',''60036'',');
           Add ('                    ''60422'')) AND');
           Add ('  (P1.IDPROVENTO = H1.IDRUBRICA)');
        end else
        begin
           Add ('SELECT');
           Add ('  H1.VALORPROVENTO AS VALORBASEIRRF');
           Add ('FROM');
           Add ('  '+NomeTabela+' H1, PROVDESC P1');
           Add ('WHERE');
           Add ('  (H1.IDPESSOA   = :IDPESSOA) AND');
           Add ('  (H1.MES        = ' +QuotedStr(MES)+ ') AND');

           if (Pos(',',sQueryTipoFolha) > 0) then
             Add ('  (H1.IDMOTIVO  IN (' +sQueryTipoFolha+ ')) AND')
           else
             Add ('  (H1.IDMOTIVO   = ' +sQueryTipoFolha+ ') AND');

           Add ('  (P1.CODRUBCLT IN (''60026'',''60028'',''62026'',''60027'',''60036'',''60422'')) AND');
           Add ('  (P1.IDPROVENTO = H1.IDRUBRICA)');
        end;
      end;
      qryBaseIRRF.Open;

      // ------------------------------------------------------------------------------------
      // Margem
      // ------------------------------------------------------------------------------------
      frmAguarde.Mostra ('Gerando Dados - MARGEM');
      frmAguarde.UpDate;
      qryMargem.Close;
      with (qryMargem.SQL) do
      begin
        Clear;
        Add ('SELECT DISTINCT');
        Add ('  H1.VALORPROVENTO AS VALORMARGEM');
        Add ('FROM');
        Add ('  '+NomeTabela+' H1, PROVDESC P1');
        Add ('WHERE');
        Add ('  (H1.IDPESSOA   = :IDPESSOA) AND');
        Add ('  (H1.MES        = ' +QuotedStr(MES)+ ') AND');

        if (Pos(',',sQueryTipoFolha) > 0) then
          Add ('  (H1.IDMOTIVO  IN (' +sQueryTipoFolha+ ')) AND')
        else
          Add ('  (H1.IDMOTIVO   = ' +sQueryTipoFolha+ ') AND');

        Add ('  (P1.CODRUBCLT  = ''90010'') AND');
        Add ('  (P1.IDPROVENTO = H1.IDRUBRICA)');
      end;
      qryMargem.Open;

      with (qryMargem2.SQL) do
      begin
        Clear;
        Add ('SELECT DISTINCT');
        Add ('  H1.VALORPROVENTO AS VALORMARGEM2');
        Add ('FROM');
        Add ('  '+NomeTabela+' H1, PROVDESC P1');
        Add ('WHERE');
        Add ('  (H1.IDPESSOA   = :IDPESSOA) AND');
        Add ('  (H1.MES        = ' +QuotedStr(MES)+ ') AND');

        if (Pos(',',sQueryTipoFolha) > 0) then
          Add ('  (H1.IDMOTIVO  IN (' +sQueryTipoFolha+ ')) AND')
        else
          Add ('  (H1.IDMOTIVO   = ' +sQueryTipoFolha+ ') AND');

        Add ('  (P1.CODRUBCLT  = ''90012'') AND');
        Add ('  (P1.IDPROVENTO = H1.IDRUBRICA)');
      end;
      qryMargem2.Open;
      frmAguarde.Apaga;
    end
    else
    begin
      // ------------------------------------------------------------------------------------
      // Salario Base Zerado
      // ------------------------------------------------------------------------------------
      frmAguarde.Mostra ('Gerando Dados - SAL. BASE');
      frmAguarde.UpDate;
      qrySalBase.Close;
      with (qrySalBase.SQL) do
      begin
        Clear;
        Add ('  SELECT                                     ');
        Add ('   0 AS SALBASE                              ');
        Add ('  FROM '+NomeTabela+' H, PROVDESC P          ');
        Add ('  WHERE                                      ');
        Add ('   (H.IDMOTIVO IN ('+sQueryTipoFolha+')) AND ');
        Add ('   (H.IDPESSOA  = :IDPESSOA)       AND       ');
        Add ('   (H.MES  = ' +QuotedStr(MES)+ ') AND       ');
        Add ('   (P.CODRUBCLT = ''60052'')       AND       ');
        Add ('   (H.IDRUBRICA = P.IDPROVENTO)              ');
      end;
      qrySalBase.Open;

      // ------------------------------------------------------------------------------------
      // Salário de Contribuição de INSS e Salário Participação Prev. Privada  Zerados
      // ------------------------------------------------------------------------------------
      frmAguarde.Mostra ('Gerando Dados - INSS');
      frmAguarde.UpDate;
      qryBaseINSS.Close;
      with (qryBaseINSS.SQL) do
      begin
        Clear;
        Add ('SELECT');
        Add ('  0 AS VALORBASEINSS');
        Add ('FROM');
        Add ('  '+NomeTabela+' H1, PROVDESC P1');
        Add ('WHERE');
        Add ('  (H1.IDPESSOA   = :IDPESSOA)     AND');
        Add ('  (H1.MES        = ' +QuotedStr(MES)+ ') AND');

        if (Pos(',',sQueryTipoFolha) > 0) then
          Add ('  (H1.IDMOTIVO  IN (' +sQueryTipoFolha+ ')) AND')
        else
          Add ('  (H1.IDMOTIVO   = ' +sQueryTipoFolha+ ') AND');

        if (frmPrincipal.iIDContraCheque = 3) then // 3 = FUNCEF
           Add ('  (P1.CODRUBCLT  = ''60056'') AND')
        else
           Add ('  (P1.CODRUBCLT IN (''60014'',''60025'',''62015'',''60017'',''60035'',''60421'',''62016'')) AND');

        Add ('  (P1.IDPROVENTO = H1.IDRUBRICA)');
      end;
      qryBaseINSS.Open;

      qrySalParticip.Close;
      with (qrySalParticip.SQL) do
      begin
        Clear;
        Add ('SELECT');
        Add ('  0 AS VALORSALPART ');
        Add ('FROM');
        Add ('  '+NomeTabela+' H1, PROVDESC P1');
        Add ('WHERE');
        Add ('  (H1.IDPESSOA   = :IDPESSOA)     AND');
        Add ('  (H1.MES        = ' +QuotedStr(MES)+ ') AND');

        if (Pos(',',sQueryTipoFolha) > 0) then
          Add ('  (H1.IDMOTIVO  IN (' +sQueryTipoFolha+ ')) AND')
        else
          Add ('  (H1.IDMOTIVO   = ' +sQueryTipoFolha+ ') AND');

        Add ('  (P1.CODRUBCLT  = ''90011'')     AND');
        Add ('  (P1.IDPROVENTO = H1.IDRUBRICA)');
      end;
      qrySalParticip.Open;

      // ------------------------------------------------------------------------------------
      // Base do FGTS Zearada
      // ------------------------------------------------------------------------------------
      frmAguarde.Mostra ('Gerando Dados - Base do FGTS');
      frmAguarde.UpDate;
      qryBaseFGTS.Close;
      with (qryBaseFGTS.SQL) do
      begin
        Clear;
        Add ('SELECT');
        Add ('  0 AS BASEFGTS');
        Add ('FROM');
        Add ('  '+NomeTabela+' H1, PROVDESC P1');
        Add ('WHERE');
        Add ('  (H1.IDPESSOA   = :IDPESSOA)     AND');
        Add ('  (H1.MES        = ' +QuotedStr(MES)+ ') AND');

        if (Pos(',',sQueryTipoFolha) > 0) then
          Add ('  (H1.IDMOTIVO  IN (' +sQueryTipoFolha+ ')) AND')
        else
          Add ('  (H1.IDMOTIVO   = ' +sQueryTipoFolha+ ') AND');

        Add ('  (P1.CODRUBCLT IN (''60695'',''62022'')) AND');
        Add ('  (P1.IDPROVENTO = H1.IDRUBRICA)');
      end;
      qryBaseFGTS.Open;

      // ------------------------------------------------------------------------------------
      // Base de Cálculo FGTS Zerada
      // ------------------------------------------------------------------------------------
      frmAguarde.Mostra ('Gerando Dados - FGTS');
      frmAguarde.UpDate;
      qryFGTS.Close;
      with (qryFGTS.SQL) do
      begin
        Clear;
        Add ('SELECT');
        Add ('  0 AS VALORFGTS');
        Add ('FROM');
        Add ('  '+NomeTabela+' H1, PROVDESC P1');
        Add ('WHERE');
        Add ('  (H1.IDPESSOA   = :IDPESSOA) AND');
        Add ('  (H1.MES        = ' +QuotedStr(MES)+ ') AND');
        if (Pos(',',sQueryTipoFolha) > 0) then
          Add ('  (H1.IDMOTIVO      IN (' +sQueryTipoFolha+ ')) AND')
        else
          Add ('  (H1.IDMOTIVO       = ' +sQueryTipoFolha+ ') AND');

        Add ('  (P1.CODRUBCLT IN (''40695'',''43696'',''43700'')) AND');
        Add ('  (P1.IDPROVENTO = H1.IDRUBRICA)');
      end;
      qryFGTS.Open;

      // ------------------------------------------------------------------------------------
      // Base de Cálculo do IRRF Zerada
      // ------------------------------------------------------------------------------------
      frmAguarde.Mostra ('Gerando Dados - IRRF');
      frmAguarde.UpDate;
      qryBaseIRRF.Close;
      with (qryBaseIRRF.SQL) do
      begin
        Clear;
        if (frmPrincipal.iIDContraCheque = 3) then // 3 = FUNCEF
        begin
           Add ('SELECT');
           Add ('  0 AS VALORBASEIRRF');
           Add ('FROM');
           Add ('  '+NomeTabela+' H1, PROVDESC P1');
           Add ('WHERE');
           Add ('  (H1.IDPESSOA   = :IDPESSOA) AND');
           Add ('  (H1.MES        = ' +QuotedStr(MES)+ ') AND');

           if (Pos(',',sQueryTipoFolha) > 0) then
             Add ('  (H1.IDMOTIVO  IN (' +sQueryTipoFolha+ ')) AND')
           else
             Add ('  (H1.IDMOTIVO   = ' +sQueryTipoFolha+ ') AND');

           Add ('  (P1.CODRUBCLT IN (''60026'',''60028'',''62026'',''60027'',''60036'',');
           Add ('                    ''60422'',''50025'',''50565'')) AND');
           Add ('  (P1.IDPROVENTO = H1.IDRUBRICA)');
        end else
        begin
           Add ('SELECT');
           Add ('  0 AS VALORBASEIRRF');
           Add ('FROM');
           Add ('  '+NomeTabela+' H1, PROVDESC P1');
           Add ('WHERE');
           Add ('  (H1.IDPESSOA   = :IDPESSOA) AND');
           Add ('  (H1.MES        = ' +QuotedStr(MES)+ ') AND');

           if (Pos(',',sQueryTipoFolha) > 0) then
             Add ('  (H1.IDMOTIVO  IN (' +sQueryTipoFolha+ ')) AND')
           else
             Add ('  (H1.IDMOTIVO   = ' +sQueryTipoFolha+ ') AND');

           Add ('  (P1.CODRUBCLT IN (''60026'',''60028'',''62026'',''60027'',''60036'',''60422'')) AND');
           Add ('  (P1.IDPROVENTO = H1.IDRUBRICA)');
        end;
      end;
      qryBaseIRRF.Open;

      // ------------------------------------------------------------------------------------
      // Margem Zerada
      // ------------------------------------------------------------------------------------
      frmAguarde.Mostra ('Gerando Dados - MARGEM');
      frmAguarde.UpDate;
      qryMargem.Close;
      with (qryMargem.SQL) do
      begin
        Clear;
        Add ('SELECT DISTINCT');
        Add ('  0 AS VALORMARGEM');
        Add ('FROM');
        Add ('  '+NomeTabela+' H1, PROVDESC P1');
        Add ('WHERE');
        Add ('  (H1.IDPESSOA   = :IDPESSOA) AND');
        Add ('  (H1.MES        = ' +QuotedStr(MES)+ ') AND');

        if (Pos(',',sQueryTipoFolha) > 0) then
          Add ('  (H1.IDMOTIVO  IN (' +sQueryTipoFolha+ ')) AND')
        else
          Add ('  (H1.IDMOTIVO   = ' +sQueryTipoFolha+ ') AND');

        Add ('  (P1.CODRUBCLT  = ''90010'') AND');
        Add ('  (P1.IDPROVENTO = H1.IDRUBRICA)');
      end;
      qryMargem.Open;

      qryMargem2.Close;
      with (qryMargem2.SQL) do
      begin
        Clear;
        Add ('SELECT DISTINCT');
        Add ('  0 AS VALORMARGEM2');
        Add ('FROM');
        Add ('  '+NomeTabela+' H1, PROVDESC P1');
        Add ('WHERE');
        Add ('  (H1.IDPESSOA   = :IDPESSOA) AND');
        Add ('  (H1.MES        = ' +QuotedStr(MES)+ ') AND');

        if (Pos(',',sQueryTipoFolha) > 0) then
          Add ('  (H1.IDMOTIVO  IN (' +sQueryTipoFolha+ ')) AND')
        else
          Add ('  (H1.IDMOTIVO   = ' +sQueryTipoFolha+ ') AND');

        Add ('  (P1.CODRUBCLT  = ''90012'') AND');
        Add ('  (P1.IDPROVENTO = H1.IDRUBRICA)');
      end;
      qryMargem2.Open;
      frmAguarde.Apaga;


    end; // do  not bDemInformativo then

  end
  else
  begin
    MsgDlg('Nenhum Tipo de Pagamento foi escolhido.','Aviso', mtInformation,[mbOk,mbHelp],0);
    ModalResult := mrNone;
  end;
end;

function TfrmParamRelTxtCCheque.GeraTxt(FileName,mesano: string): Boolean;
begin
  case (frmPrincipal.iIDContraCheque) of
    1  : Result := GeraTxtMod1  (FileName, MesAno); // Serpros
    2  : Result := GeraTxtMod2  (FileName, MesAno); // Refer
    3  : Result := GeraTxtMod3  (FileName, MesAno); // Funcef
    4  : Result := GeraTxtMod4  (FileName, MesAno); // FCRT
    5  : Result := GeraTxtMod5  (FileName, MesAno); // CTRQ (Rio Quente)
    99 : Result := GeraTxtMod99 (FileName, MesAno); // Padrão
    else Result := false;  
  end;
end;

procedure TfrmParamRelTxtCCheque.bbtnGerarClick(Sender: TObject);
begin
  inherited;
  if (frmPrincipal.iIDContraCheque = 3) and (edNomeArqFrente.Text = '') then
  begin
    MsgDlg('Imagem não foi informada.','Aviso', mtInformation,[mbOk,mbHelp],0);
    bbtnImagem.SetFocus;
    ModalResult := mrNone;
    exit;
  end;

{  if (frmPrincipal.iIDContraCheque = 3) and (edNomeArqFrente.Text = '') and (edNomeArqVerso.Text = '') then
  begin
    MsgDlg('Nenhuma Imagem foi informada.','Aviso', mtInformation,[mbOk,mbHelp],0);
    bbtnImagem.SetFocus;
    ModalResult := mrNone;
    exit;
  end;

  if (frmPrincipal.iIDContraCheque = 3) and ((edNomeArqFrente.Text = '') or (edNomeArqVerso.Text = '')) then
  begin
    if MsgDlg('Uma só imagem foi informada. Confirma Mesmo Arquivo para Frente e Verso ?',
               'Confirmação ',mtConfirmation, [mbYes,mbNo,mbHelp],0) <> mrYes
    then begin
         bbtnImagem.SetFocus;
         ModalResult := mrNone;
         exit;
    end;
  end;
}

  GerarQuery;
  SaveDialog.InitialDir := ExtractFilePath(Application.ExeName);

  if (SaveDialog.Execute) and GeraTxt(SaveDialog.FileName,mes) and
     (frmPrincipal.iIDContraCheque <> 3) then
    Close;
end;

procedure TfrmParamRelTxtCCheque.rbtnImprimirClick(Sender: TObject);
begin
  inherited;
  if (frmPrincipal.iIDContraCheque = 3) then
  begin
    if not(Gravou3) then
    begin
      ShowMessage('Primeiro Grave o Arquivo');
      exit;
    end;
    ShowMessage('Busque o Aplicativo da Impressora');

    if (OpenAplicativo.Execute) then
      ShellExecuteFile(OpenAplicativo.FileName,'', '', SW_SHOW);

    exit;
  end;
  GerarQuery;
  GeraTxt('PRN',mes);
end;

function TfrmParamRelTxtCCheque.CompStr(a:string; Tam:integer; Letra:char; Direcao:boolean): string;
var
  i: integer;
  b: string;
begin
  b:='';

  if (Tam < Length(a)) then
    a := Copy(a,1,Tam);

  if (Tam > Length(a)) then
    for i:=1 to Abs(Tam - Length(a)) do
      b := b + Letra;

  if (Direcao) then
    b := b+a
  else
    b := a+b;
    
  Result := b;
end;

function TfrmParamRelTxtCCheque.GeraTxtMod1(FileName,MesAno: string): boolean;
var
  Arq: TextFile;
  n: word;
  Ok: boolean;
  Lin: string;
  TotalDesc, TotalProv: real;
begin
  Ok     := true;
  Result := false;

  if not InputQuery('Demonstrativo de Pagamento','Entre a MENSAGEM :',Msg) then
    exit;

  if (FileName <> 'PRN') then // ARQUIVO
  begin
    try
      AssignFile(Arq,FileName);
      Rewrite(Arq);

      // Gera Registros
      frmAguarde.Mostra ('Gerando Arquivo');
      frmAguarde.Max := qryProventos.RecordCount + qryDescontos.RecordCount;
      frmAguarde.Min := 0;
      frmAguarde.UpDate;

      qryPessoa.First;
//      TotalDesc := 0;
      TotalProv := 0;
      while not(qryPessoa.EOF) do
      begin
        // mes
        WriteLn(Arq);
        WriteLn(Arq,Replicate(' ',75)+Copy(MesAno,6,2)+'/'+Copy(MesAno,3,2));
        // nome
        WriteLn(Arq);
        WriteLn(Arq,Replicate(' ',02)+LeftPad(Trim(qryPessoa.FieldByName('EMPREGADO').asString)+
                              ' - '+Trim(qryPessoa.FieldByName('TITULO').asString),85));
        // matricula,insc.,irrf
        WriteLn(Arq);
        WriteLn(Arq,
          Replicate(' ',02) + LeftPad(qryPessoa.FieldByName('MATRICULA').asString,15) +
          Replicate(' ',05) + LeftPad(qryPessoa.FieldByName('INSCRICAONUMERO').asString,10) +
          Replicate(' ',09) + //LeftPad(qryPessoa.FieldByName('IDCARGO').asString,4) +
          Replicate(' ',20) + //LeftPad(qryPessoa.FieldByName('CENTROCUSTO').asString,10) +
          Replicate(' ',10) + LeftPad(qryPessoa.FieldByName('NUMDEPSALF').asString,5) +
          Replicate(' ',02) + LeftPad(qryPessoa.FieldByName('NUMDEPIRRF').asString,5));
        // endereco
        WriteLn(Arq);
        Lin := qryPessoa.FieldByName('ENDERECO').asString;
        WriteLn(Arq,
          Replicate(' ',02) + LeftPad(Lin,60) +
          Replicate(' ',08) + LeftPad(qryPessoa.FieldByName('CIDADE').asString,15) +
          Replicate(' ',12) + qryPessoa.FieldByName('CODESTADO').asString +
          Replicate(' ',12) + Copy(qryPessoa.FieldByName('CEP').asString,1,5)+
          '-'               + Copy(qryPessoa.FieldByName('CEP').asString,6,3));
        // PROVENTOS
        WriteLn(Arq);
        WriteLn(Arq);
        WriteLn(Arq);
        for n:=1 to 12 do
        begin
          Lin := '';
          if not(qryProventos.EOF) then
          begin
            Lin := Replicate(' ',2) + LeftPad(qryProventos.FieldByName('CODPROVDESC').asString,4);

            if  (qryProventos.FieldByName('REFERENCIA').asString = '***') or
                (qryProventos.FieldByName('REFERENCIA').asString = 'Férias') or
                (qryProventos.FieldByName('REFERENCIA').asString = 'Ferias') then
              Lin := Lin + Replicate(' ',2) + LeftPad(qryProventos.FieldByName('DESCRICAO').asString,32)
            else
              Lin := Lin + Replicate(' ',2) +
                     LeftPad(Trim(qryProventos.FieldByName('DESCRICAO').asString) + ' ' +
                             Trim(qryProventos.FieldByName('REFERENCIA').asString),32);
            Lin := Lin +
               Replicate(' ',3) + RightPad(FormatFloat('###,###,##0.00',qryProventos.FieldByName('VALORPROVENTO').asFloat),15);
            TotalProv := TotalProv + qryProventos.FieldByName('VALORPROVENTO').asFloat;

            qryProventos.Next;
          end
          else
            Lin := Replicate(' ',58);

          if not(qryDescontos.EOF) then
          begin
            Lin := Lin +
              Replicate(' ',5) + LeftPad(qryDescontos.FieldByName('CODPROVDESC').asString,4);

            if (qryDescontos.FieldByName('REFERENCIA').asString = '***') or
               (qryDescontos.FieldByName('REFERENCIA').asString = 'Férias') or
               (qryProventos.FieldByName('REFERENCIA').asString = 'Ferias') then
              Lin := Lin + Replicate(' ',2) + LeftPad(qryDescontos.FieldByName('DESCRICAO').asString,32)
            else
              Lin := Lin + Replicate(' ',2) +
                     LeftPad(Trim(qryDescontos.FieldByName('DESCRICAO').asString) + ' ' +
                             Trim(qryDescontos.FieldByName('REFERENCIA').asString),32);
            Lin := Lin +
              Replicate(' ',3) + RightPad(FormatFloat('###,###,##0.00',qryDescontos.FieldByName('VALORPROVENTO').asFloat),15);

            TotalDesc := TotalDesc + qryDescontos.FieldByName('VALORPROVENTO').asFloat;

            qryDescontos.Next;
          end;
          WriteLn(Arq,Lin);
        end;
        // saldos e margem
        WriteLn(Arq);
        if (qryProventos.EOF) and (qryDescontos.EOF) then  // se acabou os detalhes
          WriteLn(Arq,
            Replicate(' ',05) + RightPad(FormatFloat('###,###,##0.00',TotalProv),20) +
            Replicate(' ',12) + RightPad(FormatFloat('###,###,##0.00',TotalDesc),20) +
            Replicate(' ',12) + RightPad(FormatFloat('###,###,##0.00',TotalProv-TotalDesc),20) +
            Replicate(' ',12) + RightPad(FormatFloat('###,###,##0.00',qryMargem.FieldByName('VALORMARGEM').asFloat),20))
        else
          WriteLn(Arq,Replicate(' ',37) + '(CONTINUA)');
        // FGTS e conta bancaria
        WriteLn(Arq);
        if (qryProventos.EOF) and (qryDescontos.EOF) then  // se acabou os detalhes
          WriteLn(Arq,
            Replicate(' ',05) + RightPad(FormatFloat('###,###,##0.00',qryFGTS.FieldByName('VALORFGTS').asFloat),20) +
            Replicate(' ',45) + LeftPad(qryPessoa.FieldByName('NUMBANCO').asString,10) +
            Replicate(' ',06) + LeftPad(qryPessoa.FieldByName('NUMAGENCIA').asString,10) +
            Replicate(' ',12) + LeftPad(qryPessoa.FieldByName('NUMCONTASALARIO').asString,20))
        else
          WriteLn(Arq);
        // mensagem
        WriteLn(Arq);
        if (qryProventos.EOF) and (qryDescontos.EOF) then  // se acabou os detalhes
          WriteLn(Arq,Replicate(' ',2) + LeftPad(msg,120))
        else
          WriteLn(Arq);
        // avanco final
        WriteLn(Arq);
        WriteLn(Arq);
        WriteLn(Arq);
        WriteLn(Arq);
        // confirma posição
        if not(Ok) then
          Ok := (MsgDlg('Confirma a posição ?','Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrYes);
        // proximo registro
        if (Ok) then                                          // se posição ok
          if (qryProventos.EOF) and (qryDescontos.EOF) then   // se acabou os detalhes
          begin
            TotalDesc := 0;
            TotalProv := 0;
            qryPessoa.Next;
          end;
      end;
      Result := true;
      frmAguarde.Apaga;
      ShowMessage('Arquivo criado com sucesso!');
    except
      Result := false;
      frmAguarde.Apaga;
      ShowMessage('Erro durante a criação em ' + FileName);
    end;
    CloseFile(Arq);
  end
  else // Para a IMPRESSORA
  begin
    if (GImp.Inicializar) then
    begin
      GImp.EjetarPagina           := false;
      GImp.SaltodeLinhaCondensado := false;
      GImp.TipoFonte              := TfNormal;
      GImp.Condensado             := true;
      GImp.Sublinhado             := false;

      // Gera Registros
      frmAguarde.Mostra ('Imprimindo Dados');
      frmAguarde.Max := qryProventos.RecordCount + qryDescontos.RecordCount;
      frmAguarde.Min := 0;
      frmAguarde.UpDate;
{      qryPessoa.Close;
      qryPessoa.Open;}

      try
        qryPessoa.First;
        TotalDesc := 0;
        TotalProv := 0;
        while not(qryPessoa.EOF) do
        begin
          // mes
          GImp.ImprimirTexto(' ');
          GImp.ImprimirTexto(Replicate(' ',70)+Copy(MesAno,6,2)+'/'+Copy(MesAno,1,4));
          // nome
          GImp.ImprimirTexto(' ');
          GImp.ImprimirTexto(GImp.TrocaChar(Replicate(' ',02)+
                             LeftPad(Trim(qryPessoa.FieldByName('EMPREGADO').asString),85)));
          // matricula,insc.,cargo,sf,irrf
          GImp.ImprimirTexto(' ');
          GImp.ImprimirTexto(
            Replicate(' ',02) + LeftPad(qryPessoa.FieldByName('MATRICULA').asString,8) +
            Replicate(' ',03) + LeftPad(qryPessoa.FieldByName('INSCRICAONUMERO').asString,10) +
            Replicate(' ',05) + LeftPad(Trim(qryPessoa.FieldByName('TITULO').asString),40) +
            Replicate(' ',01) + //LeftPad(qryPessoa.FieldByName('CENTROCUSTO').asString,10) +
            Replicate(' ',04) + LeftPad(qryPessoa.FieldByName('NUMDEPSALF').asString,3) +
            Replicate(' ',02) + LeftPad(qryPessoa.FieldByName('NUMDEPIRRF').asString,4));
          // endereco
          GImp.ImprimirTexto(' ');
          Lin := qryPessoa.FieldByName('ENDERECO').asString;
          GImp.ImprimirTexto(GImp.TrocaChar(
            Replicate(' ',02) + LeftPad(Lin,80) +
            Replicate(' ',03) + LeftPad(qryPessoa.FieldByName('CIDADE').asString,15) +
            Replicate(' ',05) + qryPessoa.FieldByName('CODESTADO').asString +
            Replicate(' ',08) + Copy(qryPessoa.FieldByName('CEP').asString,1,5)+
            '-'               + Copy(qryPessoa.FieldByName('CEP').asString,6,3)));
          // PROVENTOS
          GImp.ImprimirTexto(' ');
          GImp.ImprimirTexto(' ');
          GImp.ImprimirTexto(' ');
          for n:=1 to 12 do
          begin
            Lin := '';
            if not(qryProventos.EOF) then
            begin
              Lin :=
                Replicate(' ',2) + LeftPad(qryProventos.FieldByName('CODPROVDESC').asString,4);
              if (qryProventos.FieldByName('REFERENCIA').asString = '***') or
                 (qryProventos.FieldByName('REFERENCIA').asString = 'Férias') or
                 (qryProventos.FieldByName('REFERENCIA').asString = 'Ferias') then
                Lin := Lin + Replicate(' ',2) + LeftPad(qryProventos.FieldByName('DESCRICAO').asString,40)
              else
                Lin := Lin + Replicate(' ',2) +
                       LeftPad(Trim(qryProventos.FieldByName('DESCRICAO').asString) + ' ' +
                               Trim(qryProventos.FieldByName('REFERENCIA').asString),40);
              Lin := Lin +
                Replicate(' ',1) + RightPad(FormatFloat('###,###,##0.00',qryProventos.FieldByName('VALORPROVENTO').asFloat),9);

              TotalProv := TotalProv + qryProventos.FieldByName('VALORPROVENTO').asFloat;

              qryProventos.Next;
            end
            else
              Lin := Replicate(' ',58);

            if not(qryDescontos.EOF) then
            begin
              Lin := Lin +
                Replicate(' ',5) + LeftPad(qryDescontos.FieldByName('CODPROVDESC').asString,4);
              if (qryDescontos.FieldByName('REFERENCIA').asString = '***') or
                 (qryDescontos.FieldByName('REFERENCIA').asString = 'Férias') or
                 (qryProventos.FieldByName('REFERENCIA').asString = 'Ferias') then
                Lin := Lin + Replicate(' ',2) + LeftPad(qryDescontos.FieldByName('DESCRICAO').asString,40)
              else
                Lin := Lin + Replicate(' ',2) +
                       LeftPad(Trim(qryDescontos.FieldByName('DESCRICAO').asString) + ' ' +
                       Trim(qryDescontos.FieldByName('REFERENCIA').asString),40);
              Lin := Lin +
                Replicate(' ',1) + RightPad(FormatFloat('###,###,##0.00',qryDescontos.FieldByName('VALORPROVENTO').asFloat),9);

              TotalDesc := TotalDesc + qryDescontos.FieldByName('VALORPROVENTO').asFloat;

              qryDescontos.Next;
            end;
            GImp.ImprimirTexto(GImp.TrocaChar(Lin));
          end;
          // saldos e margem
          GImp.ImprimirTexto(' ');
          if (qryProventos.EOF) and (qryDescontos.EOF) then  // se acabou os detalhes
            GImp.ImprimirTexto(
              Replicate(' ',05) + RightPad(FormatFloat('###,###,##0.00',TotalProv),20) +
              Replicate(' ',12) + RightPad(FormatFloat('###,###,##0.00',TotalDesc),20) +
              Replicate(' ',12) + RightPad(FormatFloat('###,###,##0.00',TotalProv-TotalDesc),20) +
              Replicate(' ',12) + RightPad(FormatFloat('###,###,##0.00',qryMargem.FieldByName('VALORMARGEM').asFloat),20))
          else
            GImp.ImprimirTexto(Replicate(' ',37) + '(CONTINUA)');
          // FGTS e conta bancaria
          GImp.ImprimirTexto(' ');
          if (qryProventos.EOF) and (qryDescontos.EOF) then  // se acabou os detalhes
            GImp.ImprimirTexto(
              Replicate(' ',05) + RightPad(FormatFloat('###,###,##0.00',qryFGTS.FieldByName('VALORFGTS').asFloat),20) +
              Replicate(' ',25) + LeftPad(qryPessoa.FieldByName('NUMBANCO').asString,10) +
              Replicate(' ',16) + LeftPad(qryPessoa.FieldByName('NUMAGENCIA').asString,10) +
              Replicate(' ',22) + LeftPad(qryPessoa.FieldByName('NUMCONTASALARIO').asString,20))
          else
            GImp.ImprimirTexto(' ');
          // mensagem
          GImp.ImprimirTexto(' ');
          if (qryProventos.EOF) and (qryDescontos.EOF) then  // se acabou os detalhes
            GImp.ImprimirTexto(GImp.TrocaChar(Replicate(' ',2) + LeftPad(msg,120)))
          else
            GImp.ImprimirTexto(' ');
          // avanco final
          GImp.ImprimirTexto(' ');
          GImp.ImprimirTexto(' ');
          GImp.ImprimirTexto(' ');
          GImp.ImprimirTexto(' ');
          // confirma posição
          if not (Ok) then
            Ok := MsgDlg('Confirma a posição ?','Confirmação ',mtConfirmation,
                          [mbYes,mbNo,mbHelp],0) = mrYes;
          // proximo registro
          if (Ok) then                                        // se posição ok
            if (qryProventos.EOF) and (qryDescontos.EOF) then // se acabou os detalhes
            begin
              TotalDesc := 0;
              TotalProv := 0;
              qryPessoa.Next;
            end;
        end;
        Result := true;
        frmAguarde.Apaga;
        ShowMessage('Dados impressos com sucesso!');
      except
        Result := false;
        frmAguarde.Apaga;
        MessageDlg('Ocorreu um Erro ao Imprimir! Verifique a Impressora.', mtWarning, [mbOk], 0);
      end;
      GImp.Finalizar;
    end;
  end;
end;

function TfrmParamRelTxtCCheque.GeraTxtMod2(FileName,MesAno: string): boolean;
var
  Texto: TextFile;
  Ok, First: boolean;
  byAux: byte;
  n: word;
  i, k, y: integer;
  TotalDesc, TotalProv: real;
  sTemp, Cod, MesAtual, Nome, MesAno1, MesAno2, sRefer: string;
begin
  Result:=false; y:=0; Ok:=true;
  MesAno1 := Copy(MesAno,1,5)+CompStr(IntToStr(StrToInt(Copy(MesAno,6,2))+1),2,'0',true);
  MesAno2 := Copy(MesAno,1,5)+CompStr(IntToStr(StrToInt(Copy(MesAno,6,2))+2),2,'0',true);

  if not(InputQuery('Demonstrativo de Pagamento','Entre a MENSAGEM :',Msg)) then
    exit;

  try
    AssignFile(Texto,FileName);
    Rewrite(Texto);

    frmAguarde.Mostra ('Gerando Arquivo');
    frmAguarde.Max := qryProventos.RecordCount + qryDescontos.RecordCount;
    frmAguarde.Min := 0;
    frmAguarde.UpDate;

    // Gera Registros
    qryPessoa.First;
    TotalDesc := 0;
//    TotalProv := 0;
    while not(qryPessoa.EOF) do
    begin
      Inc(y);
      //LINHA_CAB_01
      WriteLn(Texto,'12'+CompStr('',48,' ',false)+MesBarraAno+'   1/1       ');

      //LINHA_CAB_02
      WriteLn(Texto,'-  '+CompStr(qryPessoa.FieldByName('NOMECC').asString,08,' ',false)+
              ' - '+CompStr(qryPessoa.FieldByName('CENTROCUSTO').asString,06,' ',false)+'  '+
              CompStr(qryPessoa.FieldByName('MATRICULA').asString,08,' ',true)+'  '+
              CompStr(qryPessoa.FieldByName('EMPREGADO').asString,38,' ',false));

      //LINHA_CAB_03
      WriteLn(Texto,'-  '+CompStr(qryPessoa.FieldByName('NUMBANCO').asString,05,' ',false)+
              CompStr(qryPessoa.FieldByName('NUMAGENCIA').asString,07,' ',false)+
              CompStr(qryPessoa.FieldByName('NUMCONTASALARIO').asString,11,' ',false)+'  '+
              CompStr(qryPessoa.FieldByName('TITULO').asString,32,' ',false)+
              CompStr('N'+qryPessoa.FieldByName('IDFAIXACARGO').asString,07,' ',false));

      //LINHA_CAB_04
      if  qryPessoa.FieldByName('FUNCAO').asString  <> '' then
          WriteLn(Texto,'-  '+CompStr('   '+qryPessoa.FieldByName('CARTPROF').asString,10,' ',false)+'   '+
                  qryPessoa.FieldByName('DATAADMISSAO').asString+'  '+
                  CompStr(qryPessoa.FieldByName('FUNCAO').asString,30,' ',false)+
                  CompStr(' '+qryPessoa.FieldByName('IDFUNCAO').asString,12,' ',false))
      else
          WriteLn(Texto,'-  '+CompStr('   '+qryPessoa.FieldByName('CARTPROF').asString,10,' ',false)+'   '+
                  qryPessoa.FieldByName('DATAADMISSAO').asString+'  '+
                  CompStr(qryPessoa.FieldByName('FUNCAO').asString,30,'*',false)+
                  CompStr(' '+qryPessoa.FieldByName('IDFUNCAO').asString,12,' ',false));

      MesAtual:=MesAno; i:=2;
      for k:=1 to 1 do  //(1 mes)   // k := 1 to 3 do begin   (3 meses)
      begin
        sTemp:=''; {n:=0; }TotalProv:=0; First:=true;

        if (qryProventos.IsEmpty) and (First) then
        begin
          WriteLn(Texto,'-  ');
          First := false;
        end;

        qryProventos.First;

        while (not qryProventos.EOF) {and (qryProventos.FieldbyName('mescobranca').asString = mesatual)} do
        begin
          if (First) then
          begin
            cod   := '-  ';
            First := false;
          end
          else
            cod := '   ';

          sRefer := Trim(qryProventos.FieldByName('REFERENCIA').asString);

          if (sRefer = '***') or (sRefer = 'Férias') or (sRefer = 'Ferias') or (sRefer = '13.o Salar') then
            sRefer := '   ';

          case (k) of
            1 : if (qryProventos.FieldByName('MES').asString = MesAtual) then
            begin
              WriteLn(Texto,cod+
              CompStr(qryProventos.FieldByName('DESCRICAO').asString,30,' ',false)+' '+
              CompStr(qryProventos.FieldByName('CODPROVDESC').asString,05,' ',false)+' '+
              CompStr(sRefer,08,' ',false)+
              CompStr(FormatFloat('###,###,##0.00',qryProventos.FieldByName('VALORPROVENTO').asFloat),14,' ',true)+'+');
              TotalProv := TotalProv + qryProventos.FieldByName('VALORPROVENTO').asFloat;
//              Inc(n);
            end
            else
            begin
              qryProventos.Next;
              WriteLn(Texto,cod);
            end;
            2 : if (qryProventos.FieldByName('MES').asString = MesAno1) then
            begin
              WriteLn(Texto,cod+
              CompStr(qryProventos.FieldByName('DESCRICAO').asString,30,' ',false)+'   '+
              CompStr(mesano1,9,' ',true)+'   '+
              CompStr(FormatFloat('###,###,##0.00',qryProventos.FieldByName('VALORPROVENTO').asFloat),17,' ',true));
              TotalProv := TotalProv + qryProventos.FieldByName('VALORPROVENTO').asFloat;
//              Inc(n);
            end
            else
            begin
              qryProventos.Next;
              WriteLn(Texto,cod);
            end;
            3 : if (qryProventos.FieldByName('MES').asString = MesAno2) then
            begin
              WriteLn(Texto,cod+
              CompStr(qryProventos.FieldByName('DESCRICAO').asString,30,' ',false)+'   '+
              CompStr(mesano1,9,' ',true)+'   '+
              CompStr(FormatFloat('###,###,##0.00',qryProventos.FieldByName('VALORPROVENTO').asFloat),17,' ',true));
              TotalProv := TotalProv + qryProventos.FieldByName('VALORPROVENTO').asFloat;
//              Inc(n);
            end
            else
            begin
              qryProventos.Next;
              WriteLn(Texto,cod);
            end;
          end;
          qryProventos.Next;
        end;

        TotalDesc := 0;

        if (qryDescontos.IsEmpty) and (First) then
        begin
          WriteLn(Texto,'-  ');
          First := false;
        end;
        qryDescontos.First;

        while (not qryDescontos.EOF){ and (qryDescontos.FieldbyName('mescobranca').asString = mesatual)} do
        begin
          if (First) then
          begin
            cod   := IntToStr(i)+'2';
            First := false;
          end
          else
            cod := '   ';

          sRefer := Trim(qryDescontos.FieldByName('REFERENCIA').asString);

          if (sRefer = '***') or (sRefer = 'Férias') or (sRefer = 'Ferias') or (sRefer = '13.o Salar') then
            sRefer := '   ';

          case (k) of
            1 : if (qryDescontos.FieldByName('MES').asString = MesAtual) then
            begin
              WriteLn(Texto,cod+
                CompStr(qryDescontos.FieldByName('DESCRICAO').asString,30,' ',false)+' '+
                CompStr(qryDescontos.FieldByName('CODPROVDESC').asString,05,' ',false)+' '+
                CompStr(sRefer,08,' ',false)+
                CompStr(FormatFloat('###,###,##0.00',qryDescontos.FieldByName('VALORPROVENTO').asFloat),14,' ',true)+'-');

              TotalDesc := TotalDesc + qryDescontos.FieldByName('VALORPROVENTO').asFloat;
//              Inc(n);
            end
            else
            begin
              qryDescontos.Next;
              WriteLn(Texto,cod);
            end;
            2 : if (qryDescontos.FieldByName('MES').asString = MesAno1) then
            begin
              WriteLn(Texto,cod+
                CompStr(qryDescontos.FieldByName('DESCRICAO').asString,30,' ',false)+'   '+
                CompStr(mesano1,9,' ',true)+'   '+
                CompStr(FormatFloat('###,###,##0.00',qryDescontos.FieldByName('VALORPROVENTO').asFloat),17,' ',true));

              TotalDesc := TotalDesc + qryDescontos.FieldByName('VALORPROVENTO').asFloat;
//              Inc(n);
            end
            else
            begin
              qryDescontos.Next;
              WriteLn(Texto,cod);
            end;
            3 : if (qryDescontos.FieldByName('MES').asString = MesAno2) then
            begin
              WriteLn(Texto,cod+
                CompStr(qryDescontos.FieldByName('DESCRICAO').asString,30,' ',false)+'   '+
                CompStr(mesano2,9,' ',true)+'   '+
                CompStr(FormatFloat('###,###,##0.00',qryDescontos.FieldByName('VALORPROVENTO').asFloat),17,' ',true));

              TotalDesc := TotalDesc + qryDescontos.FieldByName('VALORPROVENTO').asFloat;
//              Inc(n);
            end
            else
            begin
              qryDescontos.Next;
              WriteLn(Texto,cod);
            end;
          end;
          qryDescontos.Next;
        end;
//        First := true;
        Inc(i);
        MesAtual := Copy(MesAno,1,5)+CompStr(IntToStr(StrToInt(Copy(MesAno,6,2))+1),2,'0',true);//
      end;
      // LINHA_FECHAMENTO_24
      WriteLn(Texto,'22 '+CompStr(FormatFloat('###,###,##0.00',TotalProv),18,' ',true)+'   '+
         CompStr(FormatFloat('###,###,##0.00',TotalDesc),18,' ',true)+'   '+
         CompStr(FormatFloat('###,###,##0.00',TotalProv-TotalDesc),18,' ',true)+'       ');
      // LINHA_FECHAMENTO_25
      WriteLn(Texto,'-  '+CompStr(FormatFloat('###,###,##0.00',qryBaseInss.FieldByName('VALORBASEINSS').asFloat),18,' ',true)+'   '+
         CompStr(FormatFloat('###,###,##0.00',qryBaseIrrf.FieldByName('VALORBASEIRRF').asFloat),18,' ',true)+'   '+
         CompStr(FormatFloat('###,###,##0.00',qryFGTS.FieldByName('VALORFGTS').asFloat),18,' ',true)+'       ');
      // LINHA_FECHAMENTO_26
      WriteLn(Texto,'-2 '+CompStr('',58, ' ',true)); // Reserva de Poupança !!!!????????????

      Msg   := AnsiUpperCase(msg);
      byAux := 0;
      for n:=0 to 2 do
      begin
        sTemp := Replicate(' ', 62);

        for i:=1 to 62 do
          if (((i+(62*n))-byAux) <= length(Msg)) then
            sTemp[i] := Msg[(i+(62*n))-byAux];

        // Testar se o ultmo byte da linha (62) e diferente de branco
        // Sendo diferente iniciar um for c := 62 to 1 do até encontra um byte braco
        // Transferir esses bytes para ptemp e apaga-los de stemp
        // Iniciar i = 62 - c, tranferir de ptemp para stemp e ptemp = '';
        // Após iniciar i zerar c

        // Se próximo caractere do contador é menor ou igual ao tamanho da Msg,
        // o último caractere da linha e o primeiro caractere da próxima linha forem
        // diferentes de ESPAÇO, então quebre a palavra
        if (((i+(62*n)-1)-byAux) <= length(Msg)) and
           (sTemp[62] <> ' ') and (Msg[(i+(62*n)-1)-byAux] <> ' ') then
          for i:=62 downto 1 do
            if (sTemp[i] <> ' ') then
            begin
              sTemp[i] := ' ';
              Inc(byAux);
            end
            else
              break;

        WriteLn(Texto, ' 2 '+sTemp);
      end;

      if (y mod 2 = 0) or (qryPessoa.RecordCount = qryPessoa.RecNo+1) or
         (qryPessoa.RecordCount = 1) then
      begin
        if not(qryPessoa.RecordCount = 1) then
        begin
          WriteLn(Texto,'32 '+CompStr('',46,' ',false)+MesBarraAno+'   1/1         ');
          WriteLn(Texto,nome);
        end;

        WriteLn(Texto,'32 '+CompStr('',46,' ',false)+MesBarraAno+'   1/1         ');
        WriteLn(Texto,'-  '+CompStr(qryPessoa.FieldByName('NOMECC').asString,06,' ',false)+
              ' - '+CompStr(qryPessoa.FieldByName('CENTROCUSTO').asString,08,' ',false)+
              CompStr(qryPessoa.FieldByName('MATRICULA').asString,10,' ',true)+'    '+
              CompStr(qryPessoa.FieldByName('EMPREGADO').asString,38,' ',false));

      end;

      WriteLn(Texto,'+1');
      Nome := '-  '+CompStr(qryPessoa.FieldByName('NOMECC').asString,06,' ',false)+
              ' - '+CompStr(qryPessoa.FieldByName('CENTROCUSTO').asString,08,' ',false)+
              CompStr(qryPessoa.FieldByName('MATRICULA').asString,10,' ',true)+'    '+
              CompStr(qryPessoa.FieldByName('EMPREGADO').asString,38,' ',false);
      // if not ok then
      //   ok := MessageDlg('Confirma a posição ?',mtConfirmation,[mbYes,mbNo],0) = mrYes;
      // proximo registro
      if (Ok) then
        // if qryProventos.EOF or qryDescontos.EOF then  qryPessoa.Next; ????
        if (qryProventos.EOF) and (qryDescontos.EOF) then
          qryPessoa.Next;
    end;
    // fim
    if ((y mod 2) <> 0) then
    begin
      WriteLn(Texto,'12');
      WriteLn(Texto,'- ');
      WriteLn(Texto,'- ');
      WriteLn(Texto,'- ');
      WriteLn(Texto,'- ');
      WriteLn(Texto,'22');
      WriteLn(Texto,'- ');
      WriteLn(Texto,'-2');
      WriteLn(Texto,' 2');
      WriteLn(Texto,'32 '+CompStr('',46,' ',false)+MesBarraAno+'   1/1         ');
      WriteLn(Texto,nome);
      WriteLn(Texto,'32');
      WriteLn(Texto,'- ');
      WriteLn(Texto,'+1');
    end;
    Result := true;
    frmAguarde.Apaga;
    ShowMessage('Arquivo criado com sucesso!');
  except
    frmAguarde.Apaga;
    ShowMessage('Erro durante a criação em ' + FileName);
  end;

  CloseFile(Texto);
end;

function TfrmParamRelTxtCCheque.GeraTxtMod3(FileName,MesAno: string): Boolean;
var
//  n: word;
  Arq: TextFile;
  Alt: real;
  TotalDesc, TotalProv: array[1..2] of real;
  ok: boolean;
  MesExtAno, NomeArqFrente, NomeArqVerso: string;
  iPos, i, j, k1, k2, iMaxProv, iMaxDesc: integer;
  ArrPessoa: array[1..2,1..17]  of string;
  ArrProv  : array[1..2,1..150] of string;
  ArrDesc  : array[1..2,1..150] of string;
begin
  Ok     := true;
  Result := false;

  if (FileName <> 'PRN') then // ARQUIVO
  begin
    MesExtAno := MesLongo[StrToInt(Copy(MesBarraAno,1,2))] + Copy(MesBarraAno,3,5);

    NomeArqFrente := Trim(edNomeArqFrente.Text);
    NomeArqVerso  := Trim(edNomeArqVerso.Text);

    if (NomeArqFrente = '') then
      NomeArqFrente := Trim(edNomeArqVerso.Text);

    if (NomeArqVerso = '') then
      NomeArqVerso := Trim(edNomeArqFrente.Text);

    while (1 = 1) do
    begin
      iPos := pos('\', NomeArqFrente);
      if (iPos > 0) then
        NomeArqFrente := Copy(NomeArqFrente, iPos+1,length(NomeArqFrente)-iPos)
      else
        break;
    end;
    NomeArqFrente := '/var/spool/xerox/' + NomeArqFrente + '_dir/' +
      NomeArqFrente + '.p00000002.tif';

    while (1 = 1) do
    begin
      iPos := pos('\', NomeArqVerso);
      if (iPos > 0) then
        NomeArqVerso := Copy(NomeArqVerso, iPos+1,length(NomeArqVerso)-iPos)
      else
        break;
    end;
    NomeArqVerso := '/var/spool/xerox/' + NomeArqVerso + '_dir/' +
      NomeArqVerso + '.p00000001.tif';

    if not(InputQuery('Caminho e Nome do Arquivo para a Frente',
                      'Confirme ou Altere :',NomeArqFrente)) then
      exit;

    if not(InputQuery('Caminho e Nome do Arquivo para o Verso',
                      'Confirme ou Altere :',NomeArqVerso)) then
      exit;

    try
      AssignFile(Arq,FileName);
      Rewrite(Arq);
      
      // Gera Registros
      frmAguarde.Mostra ('Gerando Arquivo');
      frmAguarde.Max := qryProventos.RecordCount + qryDescontos.RecordCount;
      frmAguarde.Min := 0;
      frmAguarde.UpDate;
{      qryPessoa.Close;
      qryPessoa.Open;}

      qryPessoa.First;
      TotalDesc[1] := 0;
      TotalProv[1] := 0;
      TotalDesc[2] := 0;
      TotalProv[2] := 0;
      i := 0;
      while (1 = 1) do    // loop do qryPessoa
      begin
        Inc(i);
        j := (i mod 2);

        if (j = 0) then
          j := 2;

        if (j = 1) and (qryPessoa.EOF) then
          break;

        if (j = 1) then
        begin
          for k1:=1 to 2 do
            for k2:=1 to 17 do
              ArrPessoa[k1,k2] := '';
          for k1:=1 to 2 do
            for k2:=1 to 150 do
              ArrProv[k1,k2] := '';
          for k1:=1 to 2 do
            for k2:=1 to 150 do
              ArrDesc[k1,k2] := '';
          //LINHA_CAB_01
          WriteLn(Arq,'%!PS');
          WriteLn(Arq,'%XRXrequirements:duplex');
          WriteLn(Arq,'/cm {72 mul 2.545 div} def');
          // linha abaixo indica o caminho e o nome da imagem
          WriteLn(Arq,'(' + Trim(NomeArqVerso) + ')GetTiff');
          WriteLn(Arq,'/Courier 7 selectfont');
          WriteLn(Arq,'595 0 translate');
          WriteLn(Arq,'90 rotate');
          WriteLn(Arq);
          iMaxProv := 0;
          iMaxDesc := 0;
          TotalDesc[1] := 0;
          TotalProv[1] := 0;
          TotalDesc[2] := 0;
          TotalProv[2] := 0;
        end;
        if (not qryPessoa.EOF) then
        begin
          ArrPessoa[j,1]  := CompStr(qryPessoa.FieldByName('EMPREGADO').asString ,50,' ',false);
          ArrPessoa[j,2]  := CompStr(qryPessoa.FieldByName('MATRICULA').asString,10,'0',true);
          ArrPessoa[j,3]  := CompStr(qryPessoa.FieldByName('NOMECC').asString ,40,' ',false);
          ArrPessoa[j,4]  := CompStr(qryPessoa.FieldByName('NUMAGENCIA').asString ,06,' ',false);
          ArrPessoa[j,5]  := CompStr(qryPessoa.FieldByName('NUMCONTASALARIO').asString ,13,' ',true);
          if qryPessoa.FieldByName('FUNCAO').asString <> '' then
            ArrPessoa[j,6]  := CompStr(qryPessoa.FieldByName('FUNCAO').asString ,40,' ',false)
          else
            ArrPessoa[j,6]  := CompStr(qryPessoa.FieldByName('TITULO').asString ,40,' ',false);
          ArrPessoa[j,7]  := CompStr(qryPessoa.FieldByName('NUMDEPSALF').asString,02,'0',true);
          ArrPessoa[j,8]  := CompStr(qryPessoa.FieldByName('NUMDEPIRRF').asString,02,'0',true);
          ArrPessoa[j,9]  := RightPad(FormatFloat('###,###,##0.00',qrySalBase.FieldByName('SALBASE').asFloat),12);
          ArrPessoa[j,10] := RightPad(FormatFloat('###,###,##0.00',qryBaseInss.FieldByName('VALORBASEINSS').asFloat),12);
          ArrPessoa[j,11] := RightPad(FormatFloat('###,###,##0.00',qrySalParticip.FieldByName('VALORSALPART').asFloat),12);
          ArrPessoa[j,12] := RightPad(FormatFloat('###,###,##0.00',qryBaseIRRF.FieldByName('VALORBASEIRRF').asFloat),12);
          ArrPessoa[j,13] := RightPad(FormatFloat('###,###,##0.00',qryFGTS.FieldByName('VALORFGTS').asFloat),12);
          ArrPessoa[j,14] := RightPad(FormatFloat('###,###,##0.00',qryMargem.FieldByName('VALORMARGEM').asFloat),12);
          ArrPessoa[j,17] := RightPad(FormatFloat('###,###,##0.00',qryMargem2.FieldByName('VALORMARGEM2').asFloat),12);
          ArrPessoa[j,15] := CompStr(qryPessoa.FieldByName('CENTROCUSTO').asString ,10,' ',false);
          ArrPessoa[j,16] := CompStr(mesextano ,15,' ',false);

          k1 := 0;
          while not(qryProventos.EOF) do
          begin
            Inc(k1);
            ArrProv[j,(k1-1)*3+1] := LeftPad(qryProventos.FieldByName('CODPROVDESC').asString,5);
            ArrProv[j,(k1-1)*3+2] := LeftPad(qryProventos.FieldByName('DESCRICAO').asString,40);
            if  (qryProventos.FieldByName('REFERENCIA').asString <> '***') and
                (qryProventos.FieldByName('REFERENCIA').asString <> 'Férias') and
                (qryProventos.FieldByName('REFERENCIA').asString <> 'Ferias') then
                ArrProv[j,(k1-1)*3+2] := ArrProv[j,(k1-1)*3+2] + ' ' +
                                         qryProventos.FieldByName('REFERENCIA').asString;
            ArrProv[j,(k1-1)*3+3] := RightPad(FormatFloat('###,###,##0.00',qryProventos.FieldByName('VALORPROVENTO').asFloat),15);
            TotalProv[j] := TotalProv[j] + qryProventos.FieldByName('VALORPROVENTO').asFloat;
            qryProventos.Next;
          end;
          if (k1 > iMaxProv) then
            iMaxProv := k1;

          k1 := 0;
          while not(qryDescontos.EOF) do
          begin
            Inc(k1);
            ArrDesc[j,(k1-1)*3+1] := LeftPad(qryDescontos.FieldByName('CODPROVDESC').asString,5);
            ArrDesc[j,(k1-1)*3+2] := LeftPad(qryDescontos.FieldByName('DESCRICAO').asString,40);

            if  (qryDescontos.FieldByName('REFERENCIA').asString <> '***') and
                (qryDescontos.FieldByName('REFERENCIA').asString <> 'Férias') and
                (qryDescontos.FieldByName('REFERENCIA').asString <> 'Ferias') then
                ArrDesc[j,(k1-1)*3+2] := ArrDesc[j,(k1-1)*3+2] + ' ' +
                                         qryDescontos.FieldByName('REFERENCIA').asString;

            ArrDesc[j,(k1-1)*3+3] := RightPad(FormatFloat('###,###,##0.00',qryDescontos.FieldByName('VALORPROVENTO').asFloat),15);
            TotalDesc[j] := TotalDesc[j] + qryDescontos.FieldByName('VALORPROVENTO').asFloat;
            qryDescontos.Next;
          end;
          if (k1 > iMaxDesc) then
            iMaxDesc := k1;
        end;

        if (j = 2) then
        begin
          WriteLn(Arq,'10.55 cm 19.3 cm moveto');
          WriteLn(Arq,'(' + ArrPessoa[1,16] + ') show');
          WriteLn(Arq,'25.5 cm 19.3 cm moveto');
          WriteLn(Arq,'(' + ArrPessoa[2,16] + ') show');
          WriteLn(Arq);
          //LINHA_CAB_02
          WriteLn(Arq,'2.3 cm 17.0 cm moveto');
          WriteLn(Arq,'(' + ArrPessoa[1,1] + ') show');
          WriteLn(Arq,'11.85 cm 17.0 cm moveto');
          WriteLn(Arq,'(' + ArrPessoa[1,2] + ') show');
          WriteLn(Arq,'17.3 cm 17.0 cm moveto');
          WriteLn(Arq,'(' + ArrPessoa[2,1] + ') show');
          WriteLn(Arq,'26.8 cm 17.0 cm moveto');
          WriteLn(Arq,'(' + ArrPessoa[2,2] + ') show');
          WriteLn(Arq);
          //LINHA_CAB_03
          WriteLn(Arq,'2.3 cm 16.35 cm moveto');
          WriteLn(Arq,'(' + ArrPessoa[1,3] + ') show');
          WriteLn(Arq,'10.3 cm 16.35 cm moveto');
          WriteLn(Arq,'(' + ArrPessoa[1,4] + ') show');
          WriteLn(Arq,'11.8 cm 16.35 cm moveto');
          WriteLn(Arq,'(' + ArrPessoa[1,5] + ') show');
          WriteLn(Arq,'17.3 cm 16.35 cm moveto');
          WriteLn(Arq,'(' + ArrPessoa[2,3] + ') show');
          WriteLn(Arq,'25.0 cm 16.35 cm moveto');
          WriteLn(Arq,'(' + ArrPessoa[2,4] + ') show');
          WriteLn(Arq,'26.75 cm 16.35 cm moveto');
          WriteLn(Arq,'(' + ArrPessoa[2,5] + ') show');
          WriteLn(Arq);
          //LINHA_CAB_04
          WriteLn(Arq,'2.3 cm 15.7 cm moveto');
          WriteLn(Arq,'(' + ArrPessoa[1,6] + ') show');
          WriteLn(Arq,'11.9 cm 15.7 cm moveto');
          WriteLn(Arq,'(' + ArrPessoa[1,7] + ') show');
          WriteLn(Arq,'13.05 cm 15.7 cm moveto');
          WriteLn(Arq,'(' + ArrPessoa[1,8] + ') show');
          WriteLn(Arq,'17.3 cm 15.7 cm moveto');
          WriteLn(Arq,'(' + ArrPessoa[2,6] + ') show');
          WriteLn(Arq,'26.8 cm 15.7 cm moveto');
          WriteLn(Arq,'(' + ArrPessoa[2,7] + ') show');
          WriteLn(Arq,'28.0 cm 15.7 cm moveto');
          WriteLn(Arq,'(' + ArrPessoa[2,8] + ') show');
          WriteLn(Arq);

          // PROVENTOS E DESCONTOS
          Alt := 15.15;
//          n   := 0;

          for k1:=1 to iMaxProv do
          begin
//            Inc(n);
            Alt := Alt-(0.35);
            WriteLn(Arq,'2.25 cm ' + Float2String(Alt) + ' cm moveto');
            WriteLn(Arq,'(' + ArrProv[1,(k1-1)*3+1] + ') show');
            WriteLn(Arq,'3.45 cm ' + Float2String(Alt) + ' cm moveto');
            WriteLn(Arq,'(' + ArrProv[1,(k1-1)*3+2] + ') show');
            WriteLn(Arq,'10.2 cm ' + Float2String(Alt) + ' cm moveto');
            WriteLn(Arq,'(     ) show');
            WriteLn(Arq,'11.2 cm ' + Float2String(Alt) + ' cm moveto');
            WriteLn(Arq,'(' + ArrProv[1,(k1-1)*3+3] + ') show');
            WriteLn(Arq,'17.2 cm ' + Float2String(Alt) + ' cm moveto');
            WriteLn(Arq,'(' + ArrProv[2,(k1-1)*3+1] + ') show');
            WriteLn(Arq,'18.4 cm ' + Float2String(Alt) + ' cm moveto');
            WriteLn(Arq,'(' + ArrProv[2,(k1-1)*3+2] + ') show');
            WriteLn(Arq,'25.2 cm ' + Float2String(Alt) + ' cm moveto');
            WriteLn(Arq,'(     ) show');
            WriteLn(Arq,'26.2 cm ' + Float2String(Alt) + ' cm moveto');
            WriteLn(Arq,'(' + ArrProv[2,(k1-1)*3+3] + ') show');
            WriteLn(Arq);
          end;

//          Inc(n);
          Alt := Alt-(0.35);
          WriteLn(Arq,'2.25 cm ' + Float2String(Alt) + ' cm moveto');
          WriteLn(Arq,'() show');
          WriteLn(Arq,'3.45 cm ' + Float2String(Alt) + ' cm moveto');
          WriteLn(Arq,'() show');
          WriteLn(Arq,'10.2 cm ' + Float2String(Alt) + ' cm moveto');
          WriteLn(Arq,'() show');
          WriteLn(Arq,'11.2 cm ' + Float2String(Alt) + ' cm moveto');
          WriteLn(Arq,'() show');
          WriteLn(Arq,'17.2 cm ' + Float2String(Alt) + ' cm moveto');
          WriteLn(Arq,'() show');
          WriteLn(Arq,'18.4 cm ' + Float2String(Alt) + ' cm moveto');
          WriteLn(Arq,'() show');
          WriteLn(Arq,'25.2 cm ' + Float2String(Alt) + ' cm moveto');
          WriteLn(Arq,'() show');
          WriteLn(Arq,'26.2 cm ' + Float2String(Alt) + ' cm moveto');
          WriteLn(Arq,'() show');
          WriteLn(Arq);

          for k1:=1 to iMaxDesc do
          begin
//            Inc(n);
            Alt := Alt-(0.35);
            WriteLn(Arq,'2.25 cm ' + Float2String(Alt) + ' cm moveto');
            WriteLn(Arq,'(' + ArrDesc[1,(k1-1)*3+1] + ') show');
            WriteLn(Arq,'3.45 cm ' + Float2String(Alt) + ' cm moveto');
            WriteLn(Arq,'(' + ArrDesc[1,(k1-1)*3+2] + ') show');
            WriteLn(Arq,'10.2 cm ' + Float2String(Alt) + ' cm moveto');
            WriteLn(Arq,'(     ) show');
            WriteLn(Arq,'11.2 cm ' + Float2String(Alt) + ' cm moveto');
            WriteLn(Arq,'(' + ArrDesc[1,(k1-1)*3+3] + ') show');
            WriteLn(Arq,'17.2 cm ' + Float2String(Alt) + ' cm moveto');
            WriteLn(Arq,'(' + ArrDesc[2,(k1-1)*3+1] + ') show');
            WriteLn(Arq,'18.4 cm ' + Float2String(Alt) + ' cm moveto');
            WriteLn(Arq,'(' + ArrDesc[2,(k1-1)*3+2] + ') show');
            WriteLn(Arq,'25.2 cm ' + Float2String(Alt) + ' cm moveto');
            WriteLn(Arq,'(     ) show');
            WriteLn(Arq,'26.2 cm ' + Float2String(Alt) + ' cm moveto');
            WriteLn(Arq,'(' + ArrDesc[2,(k1-1)*3+3] + ') show');
            WriteLn(Arq);
          end;

//          Inc(n);
          Alt := Alt-(0.35);
          WriteLn(Arq,'2.25 cm ' + Float2String(Alt) + ' cm moveto');
          WriteLn(Arq,'() show');
          WriteLn(Arq,'3.45 cm ' + Float2String(Alt) + ' cm moveto');
          WriteLn(Arq,'() show');
          WriteLn(Arq,'10.2 cm ' + Float2String(Alt) + ' cm moveto');
          WriteLn(Arq,'() show');
          WriteLn(Arq,'11.2 cm ' + Float2String(Alt) + ' cm moveto');
          WriteLn(Arq,'() show');
          WriteLn(Arq,'17.2 cm ' + Float2String(Alt) + ' cm moveto');
          WriteLn(Arq,'() show');
          WriteLn(Arq,'18.4 cm ' + Float2String(Alt) + ' cm moveto');
          WriteLn(Arq,'() show');
          WriteLn(Arq,'25.2 cm ' + Float2String(Alt) + ' cm moveto');
          WriteLn(Arq,'() show');
          WriteLn(Arq,'26.2 cm ' + Float2String(Alt) + ' cm moveto');
          WriteLn(Arq,'() show');
          WriteLn(Arq);

          // saldos e margem
          if (1 = 1) then   // (qryProventos.EOF) and (qryDescontos.EOF) then
          begin// se acabou os detalhes
            WriteLn(Arq,'3.0 cm 5.2 cm moveto');
            WriteLn(Arq,'(' + ArrPessoa[1,9] + ') show');
            WriteLn(Arq,'5.9 cm 5.2 cm moveto');
            WriteLn(Arq,'(' + RightPad(FormatFloat('###,###,##0.00',TotalProv[1]),12) + ') show');
            WriteLn(Arq,'8.8 cm 5.2 cm moveto');
            WriteLn(Arq,'(' + RightPad(FormatFloat('###,###,##0.00',TotalDesc[1]),12) + ') show');
            WriteLn(Arq,'11.7 cm 5.2 cm moveto');
            WriteLn(Arq,'(' + RightPad(FormatFloat('###,###,##0.00',TotalProv[1]-TotalDesc[1]),12) + ') show');
            WriteLn(Arq,'18.0 cm 5.2 cm moveto');
            WriteLn(Arq,'(' + ArrPessoa[2,9] + ') show');
            WriteLn(Arq,'20.9 cm 5.2 cm moveto');
            WriteLn(Arq,'(' + RightPad(FormatFloat('###,###,##0.00',TotalProv[2]),12) + ') show');
            WriteLn(Arq,'23.8 cm 5.2 cm moveto');
            WriteLn(Arq,'(' + RightPad(FormatFloat('###,###,##0.00',TotalDesc[2]),12) + ') show');
            WriteLn(Arq,'26.7 cm 5.2 cm moveto');
            WriteLn(Arq,'(' + RightPad(FormatFloat('###,###,##0.00',TotalProv[2]-TotalDesc[2]),12) + ') show');
            WriteLn(Arq);
            WriteLn(Arq,'2.0 cm 4.05 cm moveto');
            WriteLn(Arq,'(' + ArrPessoa[1,10] + ') show');
            WriteLn(Arq,'3.9 cm 4.05 cm moveto');
            WriteLn(Arq,'(' + ArrPessoa[1,11] + ') show');
            WriteLn(Arq,'5.8 cm 4.05 cm moveto');
            WriteLn(Arq,'(' + ArrPessoa[1,12] + ') show');
            WriteLn(Arq,'7.7 cm 4.05 cm moveto');
            WriteLn(Arq,'(' + ArrPessoa[1,13] + ') show');
            WriteLn(Arq,'9.6 cm 4.05 cm moveto');
            WriteLn(Arq,'(' + ArrPessoa[1,14] + ') show');
            WriteLn(Arq,'11.7 cm 4.05 cm moveto');
            WriteLn(Arq,'(' + ArrPessoa[1,17] + ') show');

            WriteLn(Arq,'17.0 cm 4.05 cm moveto');
            WriteLn(Arq,'(' + ArrPessoa[2,10] + ') show');
            WriteLn(Arq,'18.9 cm 4.05 cm moveto');
            WriteLn(Arq,'(' + ArrPessoa[2,11] + ') show');
            WriteLn(Arq,'20.8 cm 4.05 cm moveto');
            WriteLn(Arq,'(' + ArrPessoa[2,12] + ') show');
            WriteLn(Arq,'22.7 cm 4.05 cm moveto');
            WriteLn(Arq,'(' + ArrPessoa[2,13] + ') show');
            WriteLn(Arq,'24.6 cm 4.05 cm moveto');
            WriteLn(Arq,'(' + ArrPessoa[2,14] + ') show');
            WriteLn(Arq,'26.7 cm 4.05 cm moveto');
            WriteLn(Arq,'(' + ArrPessoa[2,17] + ') show');
            WriteLn(Arq,'showpage');
            WriteLn(Arq);

            // FRENTE DO FORM.
            // linha abaixo indica o caminho e o nome da imagem
            WriteLn(Arq,'(' + Trim(NomeArqFrente) + ')GetTiff');
            WriteLn(Arq,'/Courier 7 selectfont');
            WriteLn(Arq,'595 0 translate');
            WriteLn(Arq,'90 rotate');
            WriteLn(Arq,'10.7 cm 11.5 cm moveto');
            WriteLn(Arq,'(' + ArrPessoa[1,16] + ') show');
            WriteLn(Arq,'25.75 cm 11.5 cm moveto');
            WriteLn(Arq,'(' + ArrPessoa[2,16] + ') show');
            WriteLn(Arq,'2.4 cm 8.35 cm moveto');
            WriteLn(Arq,'(' + ArrPessoa[1,1] + ') show');
            WriteLn(Arq,'11.8 cm 8.35 cm moveto');
            WriteLn(Arq,'(' + ArrPessoa[1,2] + ') show');
            WriteLn(Arq,'17.4 cm 8.35 cm moveto');
            WriteLn(Arq,'(' + ArrPessoa[2,1] + ') show');
            WriteLn(Arq,'26.8 cm 8.35 cm moveto');
            WriteLn(Arq,'(' + ArrPessoa[2,2] + ') show');
            WriteLn(Arq,'2.4 cm 7.7 cm moveto');
            WriteLn(Arq,'(' + ArrPessoa[1,3] + ') show');
            WriteLn(Arq,'11.8 cm 7.7 cm moveto');
            WriteLn(Arq,'(' + ArrPessoa[1,15] + ') show');
            WriteLn(Arq,'17.4 cm 7.7 cm moveto');
            WriteLn(Arq,'(' + ArrPessoa[2,3] + ') show');
            WriteLn(Arq,'26.8 cm 7.7 cm moveto');
            WriteLn(Arq,'(' + ArrPessoa[2,15] + ') show');
            WriteLn(Arq);
            WriteLn(Arq,'showpage');
            WriteLn(Arq);
          end;
        end; // if j = 2

        //else  WriteLn(Arq,Replicate(' ',37) + '(CONTINUA)');
        // proximo registro
        if (Ok) then                                          // se posição ok
          if (qryProventos.EOF) and (qryDescontos.EOF) then   // se acabou os detalhes
          begin
            //TotalDesc := 0;
            //TotalProv := 0;
            if (qryPessoa.EOF) then
              break;
            qryPessoa.Next;
          end;
      end;
      Result := true;
      Gravou3:= true;
      frmAguarde.Apaga;
      ShowMessage('Arquivo criado com sucesso!');
    except
      frmAguarde.Apaga;
      ShowMessage('Erro durante a criação em ' + FileName);
    end;
    CloseFile(Arq);
  end;
end;

function TfrmParamRelTxtCCheque.GeraTxtMod4(FileName,MesAno: string): boolean;
var
  Arq: TextFile;
  n: word;
  Ok: boolean;
  Lin: string;
  TotalDesc, TotalProv: real;
begin
  Ok     := true;
  Result := false;

  //if not InputQuery('Demonstrativo de Pagamento','Entre a MENSAGEM :',Msg) then
  //  exit;

  if (FileName <> 'PRN') then // ARQUIVO
  begin
    try
      AssignFile(Arq,FileName);
      Rewrite(Arq);

      // Gera Registros
      frmAguarde.Mostra ('Gerando Arquivo');
      frmAguarde.Max := qryProventos.RecordCount + qryDescontos.RecordCount;
      frmAguarde.Min := 0;
      frmAguarde.UpDate;

      qryPessoa.First;
      TotalDesc := 0;
      TotalProv := 0;
      while not(qryPessoa.EOF) do
      begin
        // mes
        WriteLn(Arq);
        WriteLn(Arq,Replicate(' ',75)+Copy(MesAno,6,2)+'/'+Copy(MesAno,3,2));
        // nome
        WriteLn(Arq);
        WriteLn(Arq,Replicate(' ',02)+LeftPad(Trim(qryPessoa.FieldByName('EMPREGADO').asString)+
                              ' - '+Trim(qryPessoa.FieldByName('TITULO').asString),85));
        // matricula,insc.,irrf
        WriteLn(Arq);
        WriteLn(Arq,
          Replicate(' ',02) + LeftPad(qryPessoa.FieldByName('MATRICULA').asString,15) +
          Replicate(' ',05) + LeftPad(qryPessoa.FieldByName('INSCRICAONUMERO').asString,10) +
          Replicate(' ',09) + //LeftPad(qryPessoa.FieldByName('IDCARGO').asString,4) +
          Replicate(' ',20) + //LeftPad(qryPessoa.FieldByName('CENTROCUSTO').asString,10) +
          Replicate(' ',10) + LeftPad(qryPessoa.FieldByName('NUMDEPSALF').asString,5) +
          Replicate(' ',02) + LeftPad(qryPessoa.FieldByName('NUMDEPIRRF').asString,5));
        // endereco
        WriteLn(Arq);
        Lin := qryPessoa.FieldByName('ENDERECO').asString;
        WriteLn(Arq,
          Replicate(' ',02) + LeftPad(Lin,60) +
          Replicate(' ',08) + LeftPad(qryPessoa.FieldByName('CIDADE').asString,15) +
          Replicate(' ',12) + qryPessoa.FieldByName('CODESTADO').asString +
          Replicate(' ',12) + Copy(qryPessoa.FieldByName('CEP').asString,1,5)+
          '-'               + Copy(qryPessoa.FieldByName('CEP').asString,6,3));
        // PROVENTOS
        WriteLn(Arq);
        WriteLn(Arq);
        WriteLn(Arq);
        for n:=1 to 12 do
        begin
          Lin := '';
          if not(qryProventos.EOF) then
          begin
            Lin := Replicate(' ',2) + LeftPad(qryProventos.FieldByName('CODPROVDESC').asString,4);

            if  (qryProventos.FieldByName('REFERENCIA').asString = '***') or
                (qryProventos.FieldByName('REFERENCIA').asString = 'Férias') or
                (qryProventos.FieldByName('REFERENCIA').asString = 'Ferias') then
              Lin := Lin + Replicate(' ',2) + LeftPad(qryProventos.FieldByName('DESCRICAO').asString,32)
            else
              Lin := Lin + Replicate(' ',2) +
                     LeftPad(Trim(qryProventos.FieldByName('DESCRICAO').asString) + ' ' +
                             Trim(qryProventos.FieldByName('REFERENCIA').asString),32);
            Lin := Lin +
               Replicate(' ',3) + RightPad(FormatFloat('###,###,##0.00',qryProventos.FieldByName('VALORPROVENTO').asFloat),15);
            TotalProv := TotalProv + qryProventos.FieldByName('VALORPROVENTO').asFloat;

            qryProventos.Next;
          end
          else
            Lin := Replicate(' ',58);

          if not(qryDescontos.EOF) then
          begin
            Lin := Lin +
              Replicate(' ',5) + LeftPad(qryDescontos.FieldByName('CODPROVDESC').asString,4);

            if (qryDescontos.FieldByName('REFERENCIA').asString = '***') or
               (qryDescontos.FieldByName('REFERENCIA').asString = 'Férias') or
               (qryProventos.FieldByName('REFERENCIA').asString = 'Ferias') then
              Lin := Lin + Replicate(' ',2) + LeftPad(qryDescontos.FieldByName('DESCRICAO').asString,32)
            else
              Lin := Lin + Replicate(' ',2) +
                     LeftPad(Trim(qryDescontos.FieldByName('DESCRICAO').asString) + ' ' +
                             Trim(qryDescontos.FieldByName('REFERENCIA').asString),32);
            Lin := Lin +
              Replicate(' ',3) + RightPad(FormatFloat('###,###,##0.00',qryDescontos.FieldByName('VALORPROVENTO').asFloat),15);

            TotalDesc := TotalDesc + qryDescontos.FieldByName('VALORPROVENTO').asFloat;

            qryDescontos.Next;
          end;
          WriteLn(Arq,Lin);
        end;
        // saldos e margem
        WriteLn(Arq);
        if (qryProventos.EOF) and (qryDescontos.EOF) then  // se acabou os detalhes
          WriteLn(Arq,
            Replicate(' ',05) + RightPad(FormatFloat('###,###,##0.00',TotalProv),20) +
            Replicate(' ',12) + RightPad(FormatFloat('###,###,##0.00',TotalDesc),20) +
            Replicate(' ',12) + RightPad(FormatFloat('###,###,##0.00',TotalProv-TotalDesc),20) +
            Replicate(' ',12) + RightPad(FormatFloat('###,###,##0.00',qryMargem.FieldByName('VALORMARGEM').asFloat),20))
        else
          WriteLn(Arq,Replicate(' ',37) + '(CONTINUA)');
        // FGTS e conta bancaria
        WriteLn(Arq);
        if (qryProventos.EOF) and (qryDescontos.EOF) then  // se acabou os detalhes
          WriteLn(Arq,
            Replicate(' ',05) + RightPad(FormatFloat('###,###,##0.00',qryFGTS.FieldByName('VALORFGTS').asFloat),20) +
            Replicate(' ',45) + LeftPad(qryPessoa.FieldByName('NUMBANCO').asString,10) +
            Replicate(' ',06) + LeftPad(qryPessoa.FieldByName('NUMAGENCIA').asString,10) +
            Replicate(' ',12) + LeftPad(qryPessoa.FieldByName('NUMCONTASALARIO').asString,20))
        else
          WriteLn(Arq);
        // mensagem
        WriteLn(Arq);
        if (qryProventos.EOF) and (qryDescontos.EOF) then  // se acabou os detalhes
          WriteLn(Arq,Replicate(' ',2) + LeftPad(msg,120))
        else
          WriteLn(Arq);
        // avanco final
        WriteLn(Arq);
        WriteLn(Arq);
        WriteLn(Arq);
        WriteLn(Arq);
        // confirma posição
        if not(Ok) then
          Ok := (MsgDlg('Confirma a posição ?','Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrYes);
        // proximo registro
        if (Ok) then                                          // se posição ok
          if (qryProventos.EOF) and (qryDescontos.EOF) then   // se acabou os detalhes
          begin
            TotalDesc := 0;
            TotalProv := 0;
            qryPessoa.Next;
          end;
      end;
      Result := true;
      frmAguarde.Apaga;
      ShowMessage('Arquivo criado com sucesso!');
    except
      Result := false;
      frmAguarde.Apaga;
      ShowMessage('Erro durante a criação em ' + FileName);
    end;
    CloseFile(Arq);
  end
  else // Para a IMPRESSORA
  begin
    if (GImp.Inicializar) then
    begin
      GImp.EjetarPagina           := false;
      GImp.SaltodeLinhaCondensado := false;
      GImp.TipoFonte              := TfNormal;
      GImp.Condensado             := true;
      GImp.Sublinhado             := false;

      // Gera Registros
      frmAguarde.Mostra ('Imprimindo Dados');
      frmAguarde.Max := qryProventos.RecordCount + qryDescontos.RecordCount;
      frmAguarde.Min := 0;
      frmAguarde.UpDate;
{      qryPessoa.Close;
      qryPessoa.Open;}

      try
        qryPessoa.First;
        TotalDesc := 0;
        TotalProv := 0;
        while not(qryPessoa.EOF) do
        begin
          GImp.ImprimirTexto(' ');
          GImp.ImprimirTexto(' ');
          GImp.ImprimirTexto(' ');
          GImp.ImprimirTexto(' ');
          GImp.ImprimirTexto(' ');
          // matricula, nome, mesref
          GImp.ImprimirTexto(
                  Replicate(' ',02) + LeftPad(qryPessoa.FieldByName('MATRICULA').asString,8) +
                  GImp.TrocaChar(Replicate(' ',13)+
                             LeftPad(Trim(qryPessoa.FieldByName('EMPREGADO').asString),70))  +
                  Replicate(' ',13) + Copy(MesAno,6,2)+'/'+Copy(MesAno,1,4));

{
         // cargo,setor,sf,irrf
          GImp.ImprimirTexto(
            Replicate(' ',05) + LeftPad(Trim(qryPessoa.FieldByName('TITULO').asString),40) +
            Replicate(' ',01) + LeftPad(qryPessoa.FieldByName('CENTROCUSTO').asString,10) +
            Replicate(' ',04) + LeftPad(qryPessoa.FieldByName('NUMDEPSALF').asString,3) +
            Replicate(' ',02) + LeftPad(qryPessoa.FieldByName('NUMDEPIRRF').asString,4));
          // endereco
          GImp.ImprimirTexto(' ');
          Lin := qryPessoa.FieldByName('ENDERECO').asString;
          GImp.ImprimirTexto(GImp.TrocaChar(
            Replicate(' ',02) + LeftPad(Lin,80) +
            Replicate(' ',03) + LeftPad(qryPessoa.FieldByName('CIDADE').asString,15) +
            Replicate(' ',05) + qryPessoa.FieldByName('CODESTADO').asString +
            Replicate(' ',08) + Copy(qryPessoa.FieldByName('CEP').asString,1,5)+
            '-'               + Copy(qryPessoa.FieldByName('CEP').asString,6,3)));
}
          // PROVENTOS
          GImp.ImprimirTexto(' ');
          for n:=1 to 16 do
          begin
            Lin := '';
            if not(qryProventos.EOF) then
            begin
              Lin :=
                Replicate(' ',2) + LeftPad(qryProventos.FieldByName('CODPROVDESC').asString,5);
              if (qryProventos.FieldByName('REFERENCIA').asString = '***') or
                 (qryProventos.FieldByName('REFERENCIA').asString = 'Férias') or
                 (qryProventos.FieldByName('REFERENCIA').asString = 'Ferias') then
                Lin := Lin + Replicate(' ',1) + LeftPad(qryProventos.FieldByName('DESCRICAO').asString,48)
              else
                Lin := Lin + Replicate(' ',1) +
                       LeftPad(Trim(qryProventos.FieldByName('DESCRICAO').asString) + ' ' +
                               Trim(qryProventos.FieldByName('REFERENCIA').asString),48);
              Lin := Lin +
                Replicate(' ',1) + RightPad(FormatFloat('###,###,##0.00',qryProventos.FieldByName('VALORPROVENTO').asFloat),9);

              TotalProv := TotalProv + qryProventos.FieldByName('VALORPROVENTO').asFloat;

              qryProventos.Next;
            end
            else
              Lin := Replicate(' ',66);

            if not(qryDescontos.EOF) then
            begin
              Lin := Lin +
                Replicate(' ',3) + LeftPad(qryDescontos.FieldByName('CODPROVDESC').asString,5);
              if (qryDescontos.FieldByName('REFERENCIA').asString = '***') or
                 (qryDescontos.FieldByName('REFERENCIA').asString = 'Férias') or
                 (qryProventos.FieldByName('REFERENCIA').asString = 'Ferias') then
                Lin := Lin + Replicate(' ',1) + LeftPad(qryDescontos.FieldByName('DESCRICAO').asString,48)
              else
                Lin := Lin + Replicate(' ',1) +
                       LeftPad(Trim(qryDescontos.FieldByName('DESCRICAO').asString) + ' ' +
                       Trim(qryDescontos.FieldByName('REFERENCIA').asString),48);
              Lin := Lin +
                Replicate(' ',1) + RightPad(FormatFloat('###,###,##0.00',qryDescontos.FieldByName('VALORPROVENTO').asFloat),9);

              TotalDesc := TotalDesc + qryDescontos.FieldByName('VALORPROVENTO').asFloat;

              qryDescontos.Next;
            end;
            GImp.ImprimirTexto(GImp.TrocaChar(Lin));
          end;
          // saldos
          GImp.ImprimirTexto(' ');
          if (qryProventos.EOF) and (qryDescontos.EOF) then  // se acabou os detalhes
          begin
            GImp.ImprimirTexto(
              Replicate(' ',46) + RightPad(FormatFloat('###,###,##0.00',TotalProv),20) +
              Replicate(' ',48) + RightPad(FormatFloat('###,###,##0.00',TotalDesc),20));
            GImp.ImprimirTexto(' ');
            GImp.ImprimirTexto(
              Replicate(' ',114) + RightPad(FormatFloat('###,###,##0.00',TotalProv-TotalDesc),20));
          end
          else
          begin
            GImp.ImprimirTexto(' ');
            GImp.ImprimirTexto(Replicate(' ',114) + '(CONTINUA)');
          end;
          // FGTS e bases
          GImp.ImprimirTexto(' ');
          if (qryProventos.EOF) and (qryDescontos.EOF) then  // se acabou os detalhes
            GImp.ImprimirTexto(
              Replicate(' ',06) + RightPad(FormatFloat('###,###,##0.00',qryBaseInss.FieldByName('VALORBASEINSS').asFloat),20) +
              Replicate(' ',06) + RightPad(FormatFloat('###,###,##0.00',qryFGTS.FieldByName('VALORFGTS').asFloat/0.08),20) +
              Replicate(' ',06) + RightPad(FormatFloat('###,###,##0.00',qryFGTS.FieldByName('VALORFGTS').asFloat),20) +
              Replicate(' ',06) + RightPad(FormatFloat('###,###,##0.00',qryBaseInss.FieldByName('VALORBASEINSS').asFloat),20))
          else
            GImp.ImprimirTexto(' ');
{
          // mensagem
          GImp.ImprimirTexto(' ');
          if (qryProventos.EOF) and (qryDescontos.EOF) then  // se acabou os detalhes
            GImp.ImprimirTexto(GImp.TrocaChar(Replicate(' ',2) + LeftPad(msg,120)))
          else
            GImp.ImprimirTexto(' ');
}
          // avanco final
          GImp.ImprimirTexto(' ');
          GImp.ImprimirTexto(' ');
          GImp.ImprimirTexto(' ');
          GImp.ImprimirTexto(' ');

          // confirma posição
          if not (Ok) then
            Ok := MsgDlg('Confirma a posição ?','Confirmação ',mtConfirmation,
                          [mbYes,mbNo,mbHelp],0) = mrYes;
          // proximo registro
          if (Ok) then                                        // se posição ok
            if (qryProventos.EOF) and (qryDescontos.EOF) then // se acabou os detalhes
            begin
              TotalDesc := 0;
              TotalProv := 0;
              qryPessoa.Next;
            end;
        end;
        Result := true;
        frmAguarde.Apaga;
        ShowMessage('Dados impressos com sucesso!');
      except
        Result := false;
        frmAguarde.Apaga;
        MessageDlg('Ocorreu um Erro ao Imprimir! Verifique a Impressora.', mtWarning, [mbOk], 0);
      end;
      GImp.Finalizar;
    end;
  end;
end;

function TfrmParamRelTxtCCheque.GeraTxtMod5(FileName,MesAno: string): boolean;
var
  Texto: TextFile;
  Ok, First: boolean;
  byAux: byte;
  n: word;
  i, k, y: integer;
  TotalDesc, TotalProv: real;
  sTemp, Cod, MesAtual, Nome, MesAno1, MesAno2, sRefer: string;
begin
  Result:=false; y:=0; Ok:=true;
  MesAno1 := CompStr(IntToStr(StrToInt(Copy(MesAno,6,2))-1),2,'0',true)+'/'+Copy(MesAno,1,4);
  MesAno2 := CompStr(Copy(MesAno,6,2),2,'0',true)+'/'+Copy(MesAno,1,4);

  if copy(MesAno1, 1, 2) = '00' then
    MesAno1 := '01/' + IntToStr(speAno.Value - 1);
  MesAtual:= '21/' + MesAno1 + ' ATE 20/' + MesAno2;

  K := ListaTipoFolha.IndexOf(qryParamRH.FieldByName('IDMOTIVO').asString);
  if (K > -1) and (not chklstTipoFolha.Checked[k]) then
    MesAtual:= '';

  if not(InputQuery('Demonstrativo de Pagamento','Entre a MENSAGEM :',Msg)) then
    exit;

  try
    AssignFile(Texto,FileName);
    Rewrite(Texto);

    frmAguarde.Mostra ('Gerando Arquivo');
    frmAguarde.Max := qryProventos.RecordCount + qryDescontos.RecordCount;
    frmAguarde.Min := 0;
    frmAguarde.UpDate;

    // Gera Registros
    qryPessoa.First;
    TotalDesc := 0;
//    TotalProv := 0;
    while not(qryPessoa.EOF) do
    begin
      Inc(y);
      //LINHA_CAB_01
      WriteLn(Texto,'1'+
              CompStr(Sistema.NomeEmpresa,26,' ',false)+
              CompStr(qryPessoa.FieldByName('CGC').asString,15,' ',false)+
              CompStr(qryPessoa.FieldByName('EMPRESA').asString,39,' ',false)+
              CompStr(qryPessoa.FieldByName('MATRICULA').asString,11,' ',false)+
              CompStr(qryPessoa.FieldByName('EMPREGADO').asString,39,' ',false)+
              CompStr(qryPessoa.FieldByName('DATAADMISSAO').asString,10,' ',false)+
              CompStr(MesExtensoAno(MesAno),20,' ',false)+
              CompStr(qryPessoa.FieldByName('TITULO').asString,50,' ',false)+
              CompStr(qryPessoa.FieldByName('NOMECC').asString,50,' ',false)+
              CompStr(MesAtual,25,' ',false)+   // Periodo
              CompStr(qryPessoa.FieldByName('NOMEHORARIO').asString,80,' ',false)
              );

      i:=2;

      sTemp:=''; {n:=0; }TotalProv:=0; First:=true;
      cod := '2';
      qryProventos.First;

      while (not qryProventos.EOF) do
      begin
        sRefer := Trim(qryProventos.FieldByName('REFERENCIA').asString);

        if (sRefer = '***') or (sRefer = 'Férias') or (sRefer = 'Ferias') or (sRefer = '13.o Salar') then
          sRefer := '   ';

          WriteLn(Texto,cod+
          CompStr(qryProventos.FieldByName('DESCRICAO').asString,50,' ',false)+
          CompStr(sRefer,10,' ',true)+
          CompStr(FormatFloat('###,###,##0.00',qryProventos.FieldByName('VALORPROVENTO').asFloat),15,' ',true));
          TotalProv := TotalProv + qryProventos.FieldByName('VALORPROVENTO').asFloat;
        qryProventos.Next;
      end;

      TotalDesc := 0;

      qryDescontos.First;

      while (not qryDescontos.EOF) do
      begin

        sRefer := Trim(qryDescontos.FieldByName('REFERENCIA').asString);

        if (sRefer = '***') or (sRefer = 'Férias') or (sRefer = 'Ferias') or (sRefer = '13.o Salar') then
          sRefer := '   ';

            WriteLn(Texto,cod+
              CompStr(qryDescontos.FieldByName('DESCRICAO').asString,50,' ',false)+
              CompStr(sRefer,10,' ',true)+
              CompStr('',15,' ',false)+
              CompStr(FormatFloat('###,###,##0.00',qryDescontos.FieldByName('VALORPROVENTO').asFloat),15,' ',true));

            TotalDesc := TotalDesc + qryDescontos.FieldByName('VALORPROVENTO').asFloat;
        qryDescontos.Next;
      end;

      Inc(i);


      // LINHA_FECHAMENTO_24
      WriteLn(Texto,'3'+
         CompStr(FormatFloat('###,###,##0.00',TotalProv),15,' ',true)+
         CompStr(FormatFloat('###,###,##0.00',TotalDesc),15,' ',true)+
         CompStr(FormatFloat('###,###,##0.00',TotalProv-TotalDesc),15,' ',true));
      // LINHA_FECHAMENTO_25
      WriteLn(Texto,'4'+
         CompStr(FormatFloat('###,###,##0.00',qrySalBase.FieldByName('SALBASE').asFloat),15,' ',true)+
         CompStr(FormatFloat('###,###,##0.00',qryBaseInss.FieldByName('VALORBASEINSS').asFloat),15,' ',true)+
         CompStr(FormatFloat('###,###,##0.00',qryBaseFgts.FieldByName('BASEFGTS').asFloat),15,' ',true)+
         CompStr(FormatFloat('###,###,##0.00',qryFGTS.FieldByName('VALORFGTS').asFloat),15,' ',true)+
         CompStr(FormatFloat('###,###,##0.00',qryBaseIrrf.FieldByName('VALORBASEIRRF').asFloat),15,' ',true)+
         CompStr('BCO No '+qryPessoa.FieldByName('NUMBANCO').asString,17,' ',false)+
         CompStr('AG. No '+qryPessoa.FieldByName('NUMAGENCIA').asString,17,' ',false)+
         CompStr(qryPessoa.FieldByName('NUMCONTASALARIO').asString,17,' ',false)+
         dtPagamento.Text);

      // LINHA_MENSAGEM
      WriteLn(Texto, '5'+ CompStr(msg,50,' ',false));
{      Msg   := AnsiUpperCase(msg);
      byAux := 0;
      for n:=0 to 2 do
      begin
        sTemp := Replicate(' ', 62);

        for i:=1 to 62 do
          if (((i+(62*n))-byAux) <= length(Msg)) then
            sTemp[i] := Msg[(i+(62*n))-byAux];

        // Testar se o ultmo byte da linha (62) e diferente de branco
        // Sendo diferente iniciar um for c := 62 to 1 do até encontra um byte braco
        // Transferir esses bytes para ptemp e apaga-los de stemp
        // Iniciar i = 62 - c, tranferir de ptemp para stemp e ptemp = '';
        // Após iniciar i zerar c

        // Se próximo caractere do contador é menor ou igual ao tamanho da Msg,
        // o último caractere da linha e o primeiro caractere da próxima linha forem
        // diferentes de ESPAÇO, então quebre a palavra
        if (((i+(62*n)-1)-byAux) <= length(Msg)) and
           (sTemp[62] <> ' ') and (Msg[(i+(62*n)-1)-byAux] <> ' ') then
          for i:=62 downto 1 do
            if (sTemp[i] <> ' ') then
            begin
              sTemp[i] := ' ';
              Inc(byAux);
            end
            else
              break;

        WriteLn(Texto, '5'+sTemp);
      end;
}

{ Verso não tem
      if (y mod 2 = 0) or (qryPessoa.RecordCount = qryPessoa.RecNo+1) or
         (qryPessoa.RecordCount = 1) then
      begin
        if not(qryPessoa.RecordCount = 1) then
        begin
          WriteLn(Texto,'32 '+CompStr('',46,' ',false)+MesBarraAno+'   1/1         ');
          WriteLn(Texto,nome);
        end;

        WriteLn(Texto,'32 '+CompStr('',46,' ',false)+MesBarraAno+'   1/1         ');
        WriteLn(Texto,'-  '+CompStr(qryPessoa.FieldByName('NOMECC').asString,06,' ',false)+
              ' - '+CompStr(qryPessoa.FieldByName('CENTROCUSTO').asString,08,' ',false)+
              CompStr(qryPessoa.FieldByName('MATRICULA').asString,10,' ',true)+'    '+
              CompStr(qryPessoa.FieldByName('EMPREGADO').asString,38,' ',false));

      end;

      WriteLn(Texto,'+1');
      Nome := '-  '+CompStr(qryPessoa.FieldByName('NOMECC').asString,06,' ',false)+
              ' - '+CompStr(qryPessoa.FieldByName('CENTROCUSTO').asString,08,' ',false)+
              CompStr(qryPessoa.FieldByName('MATRICULA').asString,10,' ',true)+'    '+
              CompStr(qryPessoa.FieldByName('EMPREGADO').asString,38,' ',false);
      // if not ok then
      //   ok := MessageDlg('Confirma a posição ?',mtConfirmation,[mbYes,mbNo],0) = mrYes;
      // proximo registro
}

      if (Ok) then
        // if qryProventos.EOF or qryDescontos.EOF then  qryPessoa.Next; ????
        if (qryProventos.EOF) and (qryDescontos.EOF) then
          qryPessoa.Next;
    end;
    // fim

{
    if ((y mod 2) <> 0) then
    begin
      WriteLn(Texto,'12');
      WriteLn(Texto,'- ');
      WriteLn(Texto,'- ');
      WriteLn(Texto,'- ');
      WriteLn(Texto,'- ');
      WriteLn(Texto,'22');
      WriteLn(Texto,'- ');
      WriteLn(Texto,'-2');
      WriteLn(Texto,' 2');
      WriteLn(Texto,'32 '+CompStr('',46,' ',false)+MesBarraAno+'   1/1         ');
      WriteLn(Texto,nome);
      WriteLn(Texto,'32');
      WriteLn(Texto,'- ');
      WriteLn(Texto,'+1');
    end;
}
    Result := true;
    frmAguarde.Apaga;
    ShowMessage('Arquivo criado com sucesso!');
  except
    frmAguarde.Apaga;
    ShowMessage('Erro durante a criação em ' + FileName);
  end;

  CloseFile(Texto);
end;

function TfrmParamRelTxtCCheque.GeraTxtMod99(FileName,MesAno: string): boolean;
var
  Arq: TextFile;
  n: Word;
  Lin: string;
  TotalDesc, TotalProv: real;
  Ok: Boolean;
begin
  Ok     := true; // Para não perguntar mais se confirma a posição
  Result := false;

  if not InputQuery('Demonstrativo de Pagamento','Entre a 1a. linha da MENSAGEM (até 70 pos.)',Msg1) then
    exit;
  if not InputQuery('Demonstrativo de Pagamento','Entre a 2a. linha da MENSAGEM (até 70 pos.)',Msg2) then
    exit;

  if (FileName <> 'PRN') then // Para um ARQUIVO
  begin
    try
      AssignFile(Arq, FileName);
      Rewrite(Arq);

      // gera registros
      frmAguarde.Mostra ('Gerando Arquivo');
      frmAguarde.Max := qryProventos.RecordCount + qryDescontos.RecordCount;
      frmAguarde.Min := 0;
      frmAguarde.UpDate;

      qryPessoa.First;

      TotalDesc := 0;
      TotalProv := 0;
      while not(qryPessoa.EOF) do
      begin
        // empresa,CNPJ,endereço
        WriteLn(Arq);
        if rgImprCab.ItemIndex = 0 then
        begin
          WriteLn(Arq, Alinha(Trim(qryPessoa.FieldByName('EMPRESA').asString), 80, 'C', ' '));
          WriteLn(Arq, Alinha(qryPessoa.FieldByName('CGC').asString + '   '  +
                       qryPessoa.FieldByName('ESTADUALMUNICIPAL').asString, 80, 'C', ' '));
          WriteLn(Arq, Alinha(qryPessoa.FieldByName('ENDEMPRESA').asString, 80, 'C', ' '));
        end
        else
        begin
          WriteLn(Arq);
          WriteLn(Arq);
          WriteLn(Arq);
        end;
        // matricula,nome,mes
        WriteLn(Arq);
        WriteLn(Arq);
        WriteLn(Arq,
          Replicate(' ',02) + LeftPad(qryPessoa.FieldByName('MATRICULA').asString,15) +
          Replicate(' ',00) + LeftPad(qryPessoa.FieldByName('EMPREGADO').asString,60) +
          Replicate(' ',23) + MesExtensoAno(MesAno));
        // Cargo, C. de Custo
        WriteLn(Arq,
          Replicate(' ',17)+LeftPad(qryPessoa.FieldByName('TITULO').asString,37)+
          Replicate(' ',20)+Trim(qryPessoa.FieldByName('NOMECC').asString));
        // PROVENTOS
        WriteLn(Arq);
        WriteLn(Arq);
        for n:=1 to 15 do
        begin
          Lin := '';
          if not(qryProventos.EOF) then
          begin
            Lin :=
              Replicate(' ',2) + LeftPad(qryProventos.FieldByName('CODPROVDESC').asString,5);
            if (qryProventos.FieldByName('REFERENCIA').asString = '***')    or
               (qryProventos.FieldByName('REFERENCIA').asString = 'Férias') or
               (qryProventos.FieldByName('REFERENCIA').asString = 'Ferias') then
              Lin := Lin + Replicate(' ',2) + LeftPad(qryProventos.FieldByName('DESCRICAO').asString,60)
            else
              Lin := Lin + Replicate(' ',2) +
                     LeftPad(Trim(qryProventos.FieldByName('DESCRICAO').asString),50) + '   ' +
                     LeftPad(Trim(qryProventos.FieldByName('REFERENCIA').asString),07);
            Lin := Lin +
              Replicate(' ',6) + RightPad(FormatFloat('###,###,##0.00',qryProventos.FieldByName('VALORPROVENTO').asFloat),15);
            TotalProv := TotalProv + qryProventos.FieldByName('VALORPROVENTO').asFloat;
            qryProventos.Next;
          end
          else
          if not(qryDescontos.EOF) then
          begin
            Lin :=
              Replicate(' ',2) + LeftPad(qryDescontos.FieldByName('CODPROVDESC').asString,5);
            if (qryDescontos.FieldByName('REFERENCIA').asString = '***')    or
               (qryDescontos.FieldByName('REFERENCIA').asString = 'Férias') or
               (qryProventos.FieldByName('REFERENCIA').asString = 'Ferias') then
              Lin := Lin + Replicate(' ',2) + LeftPad(qryDescontos.FieldByName('DESCRICAO').asString,60)
            else
              Lin := Lin + Replicate(' ',2) +
                     LeftPad(Trim(qryDescontos.FieldByName('DESCRICAO').asString),50) + '   ' +
                     LeftPad(Trim(qryDescontos.FieldByName('REFERENCIA').asString),07);
            Lin := Lin +
              Replicate(' ',29) + RightPad(FormatFloat('###,###,##0.00',qryDescontos.FieldByName('VALORPROVENTO').asFloat),15);
            TotalDesc := TotalDesc + qryDescontos.FieldByName('VALORPROVENTO').asFloat;
            qryDescontos.Next;
          end;
          WriteLn(Arq, Lin);
        end;
        // Totais
        WriteLn(Arq);
        if (qryProventos.EOF) and (qryDescontos.EOF) then // se acabou os detalhes
        begin
          WriteLn(Arq,
            Replicate(' ',2) +LeftPad(msg1,70) +
            Replicate(' ',3) +RightPad(FormatFloat('###,###,##0.00',TotalProv),15) +
            Replicate(' ',08)+RightPad(FormatFloat('###,###,##0.00',TotalDesc),15));
          WriteLn(Arq,
            Replicate(' ',2)+LeftPad(msg2,70));
          WriteLn(Arq,
            Replicate(' ',98)+RightPad(FormatFloat('###,###,##0.00',TotalProv-TotalDesc),15));
        end
        else
        begin
          WriteLn(Arq);
          WriteLn(Arq);
          WriteLn(Arq, Replicate(' ',102) + '(CONTINUA)');
        end;
        // Valores Base
        WriteLn(Arq);
        if (qryProventos.EOF) and (qryDescontos.EOF) then // se acabou os detalhes
          WriteLn(Arq,
            Replicate(' ',13) + LeftPad(FormatFloat('###,###,##0.00',qrySalBase.FieldByName('SALBASE').asFloat),20) +
            Replicate(' ',02) + LeftPad(FormatFloat('###,###,##0.00',qryBaseInss.FieldByName('VALORBASEINSS').asFloat),20) +
            Replicate(' ',03) + LeftPad(FormatFloat('###,###,##0.00',qryBaseFGTS.FieldByName('BASEFGTS').asFloat),18) +
            Replicate(' ',00) + LeftPad(FormatFloat('###,###,##0.00',qryFGTS.FieldByName('VALORFGTS').asFloat),16) +
            Replicate(' ',00) + LeftPad(FormatFloat('###,###,##0.00',qryBaseIRRF.FieldByName('VALORBASEIRRF').asFloat),13) +
            Replicate(' ',00) + iff(qrySalParticip.FieldByName('VALORSALPART').asFloat = 0,
                            ' ',LeftPad(FormatFloat('###,###,##0.00',qrySalParticip.FieldByName('VALORSALPART').asFloat),13)))
        else
          WriteLn(Arq);
        // Avanco final
        WriteLn(Arq);
        WriteLn(Arq);
        if rgAltura.ItemIndex = 1 then // Altura de 6"
        begin
          WriteLn(Arq);
          WriteLn(Arq);
          WriteLn(Arq);
        end;
        // confirma posição
        if not(Ok) then
          Ok := (MsgDlg('Confirma a posição ?','Confirmação ',mtConfirmation,
                 [mbYes,mbNo,mbHelp],0) = mrYes);
        // Proximo Registro
        if (Ok) then // se posição ok
          if (qryProventos.EOF) and (qryDescontos.EOF) then // se acabou os detalhes
          begin
            TotalDesc := 0;
            TotalProv := 0;
            qryPessoa.Next;
          end;
      end;
      Result := true;
      frmAguarde.Apaga;
      ShowMessage('Arquivo criado com sucesso!');
    except
      Result := false;
      frmAguarde.Apaga;
      ShowMessage('Erro durante a criação em ' + FileName);
    end;
    CloseFile(Arq);
  end
  else // Para a IMPRESSORA
  begin
    if (GImp.Inicializar) then
    begin
      GImp.EjetarPagina           := false;
      GImp.SaltodeLinhaCondensado := false;
      GImp.TipoFonte              := TfNormal;
      GImp.Condensado             := true;
      GImp.Sublinhado             := false;

      // Gera Registros
      frmAguarde.Mostra ('Imprimindo Dados');
      frmAguarde.Max := qryProventos.RecordCount + qryDescontos.RecordCount;
      frmAguarde.Min := 0;
      frmAguarde.UpDate;

      try
        qryPessoa.First;
        TotalDesc := 0;
        TotalProv := 0;
        while not(qryPessoa.EOF) do
        begin
          // Empresa, CNPJ, Endereço
          GImp.ImprimirTexto(' ');
          if rgImprCab.ItemIndex = 0 then
          begin
            GImp.ImprimirTexto(GImp.TrocaChar(Alinha(Trim(qryPessoa.FieldByName('EMPRESA').asString), 80, 'C', ' ')));
            GImp.ImprimirTexto(Alinha(qryPessoa.FieldByName('TIPOCGC').asString + ' ' +
              qryPessoa.FieldByName('CGC').asString + '   '  +
              qryPessoa.FieldByName('ESTADUALMUNICIPAL').asString, 80, 'C', ' '));
            GImp.ImprimirTexto(GImp.TrocaChar(Alinha(qryPessoa.FieldByName('ENDEMPRESA').asString, 80, 'C', ' ')));
          end
          else
          begin
            GImp.ImprimirTexto(' ');
            GImp.ImprimirTexto(' ');
            GImp.ImprimirTexto(' ');
          end;

          // Matricula, Nome, Mes
          if rgAltura.ItemIndex = 1 then // Altura de 6"
             GImp.ImprimirTexto(' ');
          GImp.ImprimirTexto(' ');
          GImp.ImprimirTexto(
            Replicate(' ',02) + LeftPad(qryPessoa.FieldByName('MATRICULA').asString,15) +
            Replicate(' ',00) + GImp.TrocaChar(LeftPad(qryPessoa.FieldByName('EMPREGADO').asString,60)) +
            Replicate(' ',23) + MesExtensoAno(MesAno));
          // Cargo, C. de Custo
          GImp.ImprimirTexto(
            Replicate(' ',17)+LeftPad(GImp.TrocaChar(qryPessoa.FieldByName('TITULO').asString),37)+
            Replicate(' ',20)+Trim(GImp.TrocaChar(qryPessoa.FieldByName('NOMECC').asString)));
          // PROVENTOS
          GImp.ImprimirTexto(' ');
          GImp.ImprimirTexto(' ');
          for n:=1 to 15 do
          begin
            Lin := '';
            if not(qryProventos.EOF) then
            begin
              Lin :=
                Replicate(' ',2) + LeftPad(qryProventos.FieldByName('CODPROVDESC').asString,5);
              if (qryProventos.FieldByName('REFERENCIA').asString = '***')    or
                 (qryProventos.FieldByName('REFERENCIA').asString = 'Férias') or
                 (qryProventos.FieldByName('REFERENCIA').asString = 'Ferias') then
                Lin := Lin + Replicate(' ',2) + LeftPad(qryProventos.FieldByName('DESCRICAO').asString,60)
              else
                Lin := Lin + Replicate(' ',2) +
                       LeftPad(Trim(qryProventos.FieldByName('DESCRICAO').asString),50) + '   ' +
                       LeftPad(Trim(qryProventos.FieldByName('REFERENCIA').asString),07);
              Lin := Lin +
                Replicate(' ',6) + RightPad(FormatFloat('###,###,##0.00',qryProventos.FieldByName('VALORPROVENTO').asFloat),15);
              TotalProv := TotalProv + qryProventos.FieldByName('VALORPROVENTO').asFloat;
              qryProventos.Next;
            end
            else
            if not(qryDescontos.EOF) then
            begin
              Lin :=
                Replicate(' ',2) + LeftPad(qryDescontos.FieldByName('CODPROVDESC').asString,5);
              if (qryDescontos.FieldByName('REFERENCIA').asString = '***')    or
                 (qryDescontos.FieldByName('REFERENCIA').asString = 'Férias') or
                 (qryProventos.FieldByName('REFERENCIA').asString = 'Ferias') then
                Lin := Lin + Replicate(' ',2) + LeftPad(qryDescontos.FieldByName('DESCRICAO').asString,60)
              else
                Lin := Lin + Replicate(' ',2) +
                       LeftPad(Trim(qryDescontos.FieldByName('DESCRICAO').asString),50) + '   ' +
                       LeftPad(Trim(qryDescontos.FieldByName('REFERENCIA').asString),07);
              Lin := Lin +
                Replicate(' ',29) + RightPad(FormatFloat('###,###,##0.00',qryDescontos.FieldByName('VALORPROVENTO').asFloat),15);
              TotalDesc := TotalDesc + qryDescontos.FieldByName('VALORPROVENTO').asFloat;
              qryDescontos.Next;
            end;
            GImp.ImprimirTexto(GImp.TrocaChar(Lin));
          end;
          // Totais
          if rgAltura.ItemIndex = 0 then // Altura de 5,5"
             GImp.ImprimirTexto(' ');
          GImp.ImprimirTexto(' ');
          if (qryProventos.EOF) and (qryDescontos.EOF) then // se acabou os detalhes
          begin
            GImp.ImprimirTexto(
              Replicate(' ',2) +LeftPad(msg1,70) +
              Replicate(' ',3) +RightPad(FormatFloat('###,###,##0.00',TotalProv),15) +
              Replicate(' ',08)+RightPad(FormatFloat('###,###,##0.00',TotalDesc),15));
            GImp.ImprimirTexto(
              Replicate(' ',2)+LeftPad(msg2,70));
            GImp.ImprimirTexto(
              Replicate(' ',98)+RightPad(FormatFloat('###,###,##0.00',TotalProv-TotalDesc),15));
          end
          else
          begin
            GImp.ImprimirTexto(' ');
            GImp.ImprimirTexto(' ');
            GImp.ImprimirTexto(Replicate(' ',102) + '(CONTINUA)');
          end;
          // Valores Base
          GImp.ImprimirTexto(' ');
          if (qryProventos.EOF) and (qryDescontos.EOF) then  // se acabou os detalhes
            GImp.ImprimirTexto(
              Replicate(' ',13) + LeftPad(FormatFloat('###,###,##0.00',qrySalBase.FieldByName('SALBASE').asFloat),20) +
              Replicate(' ',02) + LeftPad(FormatFloat('###,###,##0.00',qryBaseInss.FieldByName('VALORBASEINSS').asFloat),20) +
              Replicate(' ',03) + LeftPad(FormatFloat('###,###,##0.00',qryBaseFGTS.FieldByName('BASEFGTS').asFloat),18) +
              Replicate(' ',00) + LeftPad(FormatFloat('###,###,##0.00',qryFGTS.FieldByName('VALORFGTS').asFloat),16) +
              Replicate(' ',00) + LeftPad(FormatFloat('###,###,##0.00',qryBaseIRRF.FieldByName('VALORBASEIRRF').asFloat),13) +
              Replicate(' ',00) + iff(qrySalParticip.FieldByName('VALORSALPART').asFloat = 0,
                            ' ',LeftPad(FormatFloat('###,###,##0.00',qrySalParticip.FieldByName('VALORSALPART').asFloat),13)))
          else
            GImp.ImprimirTexto(' ');
          // avanco final
          GImp.ImprimirTexto(' ');
          GImp.ImprimirTexto(' ');
          if rgAltura.ItemIndex = 1 then // Altura de 6"
          begin
            GImp.ImprimirTexto(' ');
            GImp.ImprimirTexto(' ');
            GImp.ImprimirTexto(' ');
          end;
          // confirma posição
          if not(Ok) then
            Ok := (MsgDlg('Confirma a posição ?','Confirmação ',mtConfirmation,
                   [mbYes,mbNo,mbHelp],0) = mrYes);
          // proximo registro
          if (Ok) then
            if (qryProventos.EOF) and (qryDescontos.EOF) then // se acabou os detalhes
            begin
              TotalDesc := 0;
              TotalProv := 0;
              qryPessoa.Next;
            end;
        end;
        Result := true;
        frmAguarde.Apaga;
        ShowMessage('Dados impressos com sucesso!');
      except
        Result := false;
        frmAguarde.Apaga;
        MessageDlg('Ocorreu um Erro ao Imprimir! Verifique a Impressora.', mtWarning, [mbOk], 0);
      end;
      GImp.Finalizar;
    end;
  end;
end;

procedure TfrmParamRelTxtCCheque.bbtnSelTodosRubClick(Sender: TObject);
var
  c: integer;
begin
  inherited;
  for c:=0 to chklstRubrica.Items.Count-1 do
    chklstRubrica.Checked[c] := true;
  chklstRubrica.Repaint;
  CriaListaOpcoes (chklstRubrica, ListaCodRubrica, sCodRubricaSel, ',', false);
end;

procedure TfrmParamRelTxtCCheque.bbtnInverteSelRubClick(Sender: TObject);
var
  c: integer;
begin
  inherited;
  for c:=0 to chklstRubrica.Items.Count-1 do
    chklstRubrica.Checked[c] := not(chklstRubrica.Checked[c]);
  chklstRubrica.Repaint;
  CriaListaOpcoes (chklstRubrica, ListaCodRubrica, sCodRubricaSel, ',', false);
end;

procedure TfrmParamRelTxtCCheque.chklstRubricaClickCheck(Sender: TObject);
begin
  inherited;
  CriaListaOpcoes (chklstRubrica, ListaCodRubrica, sCodRubricaSel, ',', false);
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
  HabilitaBtOk;
end;

procedure TfrmParamRelTxtCCheque.chklstRubricaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_TAB) then
    chklstTipoFolhaClickCheck(Sender);
end;

procedure TfrmParamRelTxtCCheque.LeAlteracoes;
begin
  // Recupera as últimas alterações das opções
  //ArqConfig  := TIniFile.Create('C:\CONFIG_FOLHAPAGTO.INI');
  ArqConfig  := TIniFile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CONFIG_FOLHAPAGTO.INI');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  rgAltura.ItemIndex := StrToInt(ArqConfig.ReadString ('REL_TXTCCHEQUE', 'Altura', '0'));
  rgImprCab.ItemIndex := StrToInt(ArqConfig.ReadString ('REL_TXTCCHEQUE', 'ImprimeCab', '0'));
  msg  := ArqConfig.ReadString ('REL_TXTCCHEQUE', 'Mensagem', '');
  msg1 := ArqConfig.ReadString ('REL_TXTCCHEQUE', 'Mensagem 1', '');
  msg2 := ArqConfig.ReadString ('REL_TXTCCHEQUE', 'Mensagem 2', '');
end;

procedure TfrmParamRelTxtCCheque.GravaAlteracoes;
begin
  // Grava as últimas alterações da Opção de Altura e mensagens
  ArqConfig.WriteString ('REL_TXTCCHEQUE','Altura',IntToStr(rgAltura.ItemIndex));
  ArqConfig.WriteString ('REL_TXTCCHEQUE','ImprimeCab',IntToStr(rgImprCab.ItemIndex));
  ArqConfig.WriteString ('REL_TXTCCHEQUE','Mensagem',msg);
  ArqConfig.WriteString ('REL_TXTCCHEQUE','Mensagem 1',msg1);
  ArqConfig.WriteString ('REL_TXTCCHEQUE','Mensagem 2',msg2);
end;


end.
