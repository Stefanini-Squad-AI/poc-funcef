// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamRelatSubstEvent;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook, Spin,
  checklst, IvDictio, IvMulti, IvEMulti, ExtDlgs, ComCtrls, fSairAjuda, Wwdatsrc,
  wwdbdatetimepicker, CMDateTimePicker, ppDB, ppDBPipe, ppDBBDE, ppCtrls, ppBands,
  ppVar, ppPrnabl, ppClass, ppCache, ppRelatv, ppProd, ppReport, ppComm, ppEndUsr,
  ppStrtch, ppRichTx, ppForms, ppPrvDlg, ppTypes, IniFiles, DBClient, uCMClientDataSet,
  uCmSqlParams, uCtrlPessoaFilialPessoa, uCtrlProvDesc, uCtrlGlobalRH,
  ColorCheckListBox;

type
  TfrmParamRelatSubstEvent = class(TfrmSairAjuda)
    rbtnImprimir: TBitBtn;
    ToolbarSep973: TToolbarSep97;
    gbxEstab: TGroupBox;
    dblkcbEstab: TwwDBLookupCombo;
    gbxIntervRef: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtedIni: TCMDateTimePicker;
    dtedFin: TCMDateTimePicker;
    gbxFunc: TGroupBox;
    Paginas: TPageControl;
    tbshListaFunc: TTabSheet;
    chklstRubrica1: TColorCheckListBox;
    tbshFiltroFunc: TTabSheet;
    chklstRubrica2: TColorCheckListBox;
    bbtnSelTodas: TBitBtn;
    bbtnInverteSel: TBitBtn;
    dsgnPrincipal: TppDesigner;
    rpPrincipal: TppReport;
    rpPrincipalHdrBnd1: TppHeaderBand;
    ppCalc3: TppCalc;
    ppCalc4: TppCalc;
    ppLabel3: TppLabel;
    ppLabel6: TppLabel;
    rpPrincipalDtlBnd1: TppDetailBand;
    rpPrincipalFootBnd1: TppFooterBand;
    rpPrincipalSmryBnd: TppSummaryBand;
    ppPrincipal: TppBDEPipeline;
    dsPrincipal: TwwDataSource;
    Label3: TLabel;
    edCodRubricas: TEdit;
    sbtnMarcarRub: TBitBtn;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel13: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppDBText1: TppDBText;
    ppDBText5: TppDBText;
    ppDBRichText1: TppDBRichText;
    ppDBRichText2: TppDBRichText;
    ppDBRichText3: TppDBRichText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText2: TppDBText;
    CdsRubrica: TCMClientDataSet;
    CdsEstab: TCMClientDataSet;
    CdsPrincipal: TCMClientDataSet;
    sqlPrincipal: TCMSqlParams;
    CdsAux: TCMClientDataSet;
    sqlAux: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rbtnImprimirClick(Sender: TObject);
    procedure dblkcbEstabChange(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure chklstRubrica1ClickCheck(Sender: TObject);
    procedure bbtnSelTodasClick(Sender: TObject);
    procedure PaginasChange(Sender: TObject);
    procedure rpPrincipalSmryBndAfterPrint(Sender: TObject);
    procedure sbtnMarcarRubClick(Sender: TObject);
  private
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlProvDesc: TCtrlProvDesc;
    CtrlGlobalRH: TCtrlGlobalRH;

    ArqConfig: TIniFile;
    chkListAux: TColorCheckListBox;
    ListaIdRubrica, ListaCodRubrica: TStringList;

    sCodEstabSel: string;
    sCodRubricaSel: array[1..2] of string;

    procedure LeAlteracoes;
    procedure GravaAlteracoes;
    procedure HabilitaBtOk;
  end;

var
  frmParamRelatSubstEvent: TfrmParamRelatSubstEvent;

implementation

uses uSistema, uMensErro, uCtrlPadroes, uCtrlFuncoesRH, fAguarde, fPreview, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmParamRelatSubstEvent.FormCreate(Sender: TObject);
begin
  inherited;
  ListaIdRubrica := TStringList.Create;
  ListaCodRubrica := TStringList.Create;

  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  CtrlProvDesc := TCtrlProvDesc.Create;
  CtrlProvDesc.InitializeAs(Padroes);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CdsEstab.Data := CtrlPessoaFilialPessoa.ListPessoaEstab(IntToStr(Sistema.IdEmpresa));

  // Monto a Lista de Rubricas
  ListaCodRubrica.Clear;
  ListaIdRubrica.Clear;
  chklstRubrica1.Items.Clear;
  chklstRubrica2.Items.Clear;
  CdsRubrica.Data := CtrlProvDesc.ListRubricaEmpresa(IntToStr(Sistema.IdEmpresa));
  while not(CdsRubrica.EOF) do
  begin
    ListaCodRubrica.Add(CdsRubrica.FieldByName('CODPROVDESC').asString);
    ListaIdRubrica.Add(CdsRubrica.FieldByName('IDRUBRICA').asString);
    chklstRubrica1.Items.Add(CdsRubrica.FieldByName('DESCRPROVDESC').asString);
    chklstRubrica2.Items.Add(CdsRubrica.FieldByName('DESCRPROVDESC').asString);
    CdsRubrica.Next;
  end;

  dtedIni.Date := CtrlGlobalRH.GetNormalIni;
  dtedFin.Date := CtrlGlobalRH.GetNormalFim;
  Paginas.ActivePageIndex := 0;

  // Carrega alterações nas opções feitas anteriormente
  LeAlteracoes;

  PaginasChange(Self);
end;

procedure TfrmParamRelatSubstEvent.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlProvDesc);
  FreeAndNil(CtrlGlobalRH);
  GravaAlteracoes;
  FreeAndNil(ListaIdRubrica);
  FreeAndNil(ListaCodRubrica);
  inherited;
end;

procedure TfrmParamRelatSubstEvent.dblkcbEstabChange(Sender: TObject);
begin
  dblkcbEstab.Text := Trim(dblkcbEstab.Text);
end;

procedure TfrmParamRelatSubstEvent.PaginasChange(Sender: TObject);
begin
  edCodRubricas.Text := sCodRubricaSel[Paginas.ActivePageIndex+1];
  chkListAux := TColorCheckListBox(Self.FindComponent('chklstRubrica'+IntToStr(Paginas.ActivePageIndex+1)));
end;

procedure TfrmParamRelatSubstEvent.chklstRubrica1ClickCheck(Sender: TObject);
begin
  inherited;
  FU.CriaListaOpcoes(chkListAux, ListaCodRubrica, sCodRubricaSel[Paginas.ActivePageIndex+1],
    ',', false);
  edCodRubricas.Text := sCodRubricaSel[Paginas.ActivePageIndex+1];
  HabilitaBtOk;
end;

procedure TfrmParamRelatSubstEvent.sbtnMarcarRubClick(Sender: TObject);
begin
  edCodRubricas.Text := Trim(edCodRubricas.Text);
  FU.VerificaOpcoes(chkListAux, ListaCodRubrica, edCodRubricas.Text, ',');
  sCodRubricaSel[Paginas.ActivePageIndex+1] := edCodRubricas.Text;
  chkListAux.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamRelatSubstEvent.bbtnSelTodasClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chkListAux.Items.Count-1 do
    chkListAux.Checked[c] := true;
  chkListAux.Repaint;

  FU.CriaListaOpcoes(chkListAux, ListaCodRubrica, sCodRubricaSel[Paginas.ActivePageIndex+1],
    ',', false);
  edCodRubricas.Text := sCodRubricaSel[Paginas.ActivePageIndex+1];
  HabilitaBtOk;
end;

procedure TfrmParamRelatSubstEvent.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chkListAux.Items.Count-1 do
    chkListAux.Checked[c] := not(chkListAux.Checked[c]);
  chkListAux.Repaint;

  FU.CriaListaOpcoes(chkListAux, ListaCodRubrica, sCodRubricaSel[Paginas.ActivePageIndex+1],
    ',', false);
  edCodRubricas.Text := sCodRubricaSel[Paginas.ActivePageIndex+1];
  HabilitaBtOk;
end;

procedure TfrmParamRelatSubstEvent.rbtnImprimirClick(Sender: TObject);
var
  wNum: word;
begin
  frmAguarde.Mostra('Imprimindo Relatório');

  // Rubricas escolhidas
  wNum := FU.CriaListaOpcoes(chklstRubrica1, ListaIdRubrica, sCodRubricaSel[1], ',', false);
  if (wNum = ListaCodRubrica.Count) then
    sCodRubricaSel[1] := '';

  wNum := FU.CriaListaOpcoes(chklstRubrica2, ListaIdRubrica, sCodRubricaSel[2], ',', false);
  if (wNum = ListaCodRubrica.Count) then
    sCodRubricaSel[2] := '';

  with (sqlAux.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  TO_DATE(MO.DATA) AS INICIO,');
    Add('  TO_DATE(MO.DATA + RI.VALORRUBRICA-1) AS FINAL,');
    Add('  PF.NOME AS EMPREGADO,');
    Add('  C.TITULO AS CARGO,');
    Add('  CC.NOME AS LOTACAO,');
    Add('  TO_CHAR(TO_DATE(MO.DATA),''DD /MM/YYYY'') ||'' a   ''||');
    Add('    TO_CHAR(TO_DATE(MO.DATA + RI.VALORRUBRICA-1),''DD/MM/YYYY'') AS PERIODO,');
    Add('  PC.NOME AS SUBSTITUIDO,');
    Add('  RI.VALORRUBRICA AS QUANT_DIAS,');
    Add('  MO.DESCRICAO AS MOTIVO,');
    Add('  H.VALORPROVENTO AS VALOR');
    Add('FROM');
    Add('  HISTRUBSAL H, PESSOA PF, PESSOA PC, FUNCIONARIO F, CARGO C,');
    Add('  CENTCUST CC, RUBRICAINDIV RI,');
    // -------------------------------------------------------------------------
    Add('  (SELECT HS.IDPESSOA, MO.DESCRICAO, HS.DATASITFUNC AS DATA');
    Add('   FROM   MOTIVO MO, HSTSITFUNC HS');
    Add('   WHERE  (MO.IDMOTIVO IN (51,52)) AND');
    Add('          (MO.IDMOTIVO = HS.IDMOTIVOOFIC)) MO');
    // -------------------------------------------------------------------------
    Add('WHERE');
    if (Pos(',',sCodRubricaSel[1]) > 0) then
      Add('  (RI.IDRUBRICA     IN ('+sCodRubricaSel[1]+')) AND')
    else
      Add('  (RI.IDRUBRICA      = '+sCodRubricaSel[1]+') AND');

    Add('  (F.IDESTAB         = '+CdsEstab.FieldByName('IDPESSOA').asString+') AND');
    Add('  (F.IDCARGO         = C.IDCARGO) AND');
    Add('  (F.IDPESSOA        = PF.IDPESSOA) AND');
    Add('  (F.IDCHEFE         = PC.IDPESSOA) AND');
    Add('  (MO.IDPESSOA       = F.IDPESSOA) AND');
    Add('  (CC.CODCENTROCUSTO = F.CODCENTROCUSTO) AND');
    Add('  (CC.IDEMPRESA      = F.IDEMPRESA) AND');
    Add('  (F.IDPESSOA        = RI.IDPESSOA) AND');
    Add('  (F.IDPESSOA        = H.IDPESSOA) AND');
    Add('  (H.MES             = RI.ANOMESINICIO OR RI.FLGPERMANENTE = 1) AND');
    Add('  (H.MES             = TO_CHAR(MO.DATA,''YYYY/MM'') OR RI.FLGPERMANENTE = 1) AND');

    if (Pos(',',sCodRubricaSel[2]) > 0) then
      Add('  (H.IDRUBRICA      IN ('+sCodRubricaSel[2]+'))')
    else
      Add('  (H.IDRUBRICA       = '+sCodRubricaSel[2]+')');

    Add('ORDER BY');
    Add('  PF.NOME, INICIO');
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  sqlAux.Open;
  frmAguarde.Max := CdsAux.RecordCount;
  frmAguarde.Min := 0;

  if (CdsAux.IsEmpty) then
  begin
    frmAguarde.Apaga;
    MsgDlg('Não há registros a imprimir.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
  end
  else
  begin
    sqlPrincipal.Open;
    repeat
      if (CdsAux.FieldByName('INICIO').asDateTime >= StrToDate(dtedIni.Text)) and
         (CdsAux.FieldByName('FINAL').asDateTime  <= StrToDate(dtedFin.Text)) then
      begin
        CdsPrincipal.Insert;
        CdsPrincipal.FieldByName('INICIO').asString := CdsAux.FieldByName('INICIO').asString;
        CdsPrincipal.FieldByName('FINAL').asString := CdsAux.FieldByName('FINAL').asString;
        CdsPrincipal.FieldByName('EMPREGADO').asString := CdsAux.FieldByName('EMPREGADO').asString;
        CdsPrincipal.FieldByName('CARGO').asString := CdsAux.FieldByName('CARGO').asString;
        CdsPrincipal.FieldByName('LOTACAO').asString := CdsAux.FieldByName('LOTACAO').asString;
        CdsPrincipal.FieldByName('PERIODO').asString := CdsAux.FieldByName('PERIODO').asString;
        CdsPrincipal.FieldByName('SUBSTITUIDO').asString := CdsAux.FieldByName('SUBSTITUIDO').asString;
        CdsPrincipal.FieldByName('QUANT_DIAS').asString := CdsAux.FieldByName('QUANT_DIAS').asString;
        CdsPrincipal.FieldByName('MOTIVO').asString := CdsAux.FieldByName('MOTIVO').asString;
        CdsPrincipal.FieldByName('VALOR').asString := CdsAux.FieldByName('VALOR').asString;
        CdsPrincipal.Post;
      end;
      frmAguarde.Pos := frmAguarde.Pos + 1;
      frmAguarde.Update;
      CdsAux.Next;
    until (CdsAux.EOF);

    if (CdsPrincipal.IsEmpty) then
    begin
      frmAguarde.Apaga;
      MsgDlg('Não há registros a imprimir.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    end
    else
      TFrmPreview.CreateModalPreview(Application, rpPrincipal, rpPrincipal.Caption);
  end;
end;

procedure TfrmParamRelatSubstEvent.rpPrincipalSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------
procedure TfrmParamRelatSubstEvent.HabilitaBtOk;
var
  c: integer;
  bSelRub1, bSelRub2: boolean;
begin
  bSelRub1 := false;
  for c:=0 to chklstRubrica1.Items.Count-1 do
    if (chklstRubrica1.Checked[c]) then
    begin
      bSelRub1 := true;
      break;
    end;

  bSelRub2 := false;
  for c:=0 to chklstRubrica2.Items.Count-1 do
    if (chklstRubrica2.Checked[c]) then
    begin
      bSelRub2 := true;
      break;
    end;

  rbtnImprimir.Enabled := (bSelRub1) and (bSelRub2) and (dblkcbEstab.Text <> '') and
    (Trim(dtedIni.Text) <> '') and (Trim(dtedFin.Text) <> '');
end;

procedure TfrmParamRelatSubstEvent.LeAlteracoes;
begin
  // Recupera as últimas alterações das opções
  //ArqConfig := TIniFile.Create('C:\CONFIG_FOLHAPAGTO.INI');
  ArqConfig := TIniFile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+ '\CONFIG_FOLHAPAGTO.INI');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332

  sCodEstabSel := ArqConfig.ReadString('REL_SUBSTEVENT', 'Estabelec', '');
  sCodRubricaSel[1] := ArqConfig.ReadString('REL_SUBSTEVENT', 'Rubricas1', '');
  sCodRubricaSel[2] := ArqConfig.ReadString('REL_SUBSTEVENT', 'Rubricas2', '');

  if (sCodEstabSel = '') then
  begin
    CdsEstab.First;
    sCodEstabSel := CdsEstab.FieldByName('IDPESSOA').asString;
  end;
  dblkcbEstab.LookUpValue := sCodEstabSel;
  dblkcbEstab.UpDate;

  FU.VerificaOpcoes(chklstRubrica1, ListaCodRubrica, sCodRubricaSel[1], ',');
  FU.VerificaOpcoes(chklstRubrica2, ListaCodRubrica, sCodRubricaSel[2], ',');

  edCodRubricas.Text := sCodEstabSel;
end;

procedure TfrmParamRelatSubstEvent.GravaAlteracoes;
begin
  // Grava as últimas alterações da Opção de Rubricas 1
  FU.CriaListaOpcoes(chklstRubrica1, ListaCodRubrica, sCodRubricaSel[1], ',', false);
  ArqConfig.WriteString('REL_SUBSTEVENT','Rubricas1', sCodRubricaSel[1]);

  // Grava as últimas alterações da Opção de Rubricas 2
  FU.CriaListaOpcoes(chklstRubrica2, ListaCodRubrica, sCodRubricaSel[2], ',', false);
  ArqConfig.WriteString('REL_SUBSTEVENT','Rubricas2', sCodRubricaSel[2]);
end;

end.
