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
  ppStrtch, ppRichTx, ppForms, ppPrvDlg, ppTypes;

type
  TfrmParamRelatSubstEvent = class(TfrmSairAjuda)
    qryEstab: TwwQuery;
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
    chklstRubrica1: TCheckListBox;
    tbshFiltroFunc: TTabSheet;
    chklstRubrica2: TCheckListBox;
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
    qryPrincipal: TwwQuery;
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
    updPrincipal: TUpdateSQL;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rbtnImprimirClick(Sender: TObject);
    procedure dblkcbEstabChange(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure chklstRubrica1ClickCheck(Sender: TObject);
    procedure chklstRubrica1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chklstRubrica1DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure bbtnSelTodasClick(Sender: TObject);
    procedure PaginasChange(Sender: TObject);
    procedure rpPrincipalSmryBndAfterPrint(Sender: TObject);
    procedure qryPrincipalAfterOpen(DataSet: TDataSet);
    procedure qryPrincipalAfterScroll(DataSet: TDataSet);
    procedure sbtnMarcarRubClick(Sender: TObject);
  private
    ListaIdRubrica: TStringList;
    sCodRubricaSel2: string;
    procedure LeAlteracoes;
    procedure GravaAlteracoes;
    procedure HabilitaBtOk;
  end;

var
  frmParamRelatSubstEvent: TfrmParamRelatSubstEvent;

implementation

uses uSistema, uMensErro, uFuncoesUteis, fAguarde, uComumRelats, UsoGeralRH,
  IniFiles, dBaseDados;

{$R *.DFM}

procedure TfrmParamRelatSubstEvent.FormCreate(Sender: TObject);
begin
  inherited;
  ListaIdRubrica := TStringList.Create;
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

  // Monto a Lista de Rubricas
  ListaCodRubrica.Clear;
  ListaIdRubrica.Clear;
  chklstRubrica1.Items.Clear;
  chklstRubrica2.Items.Clear;
  with (dtmBaseDados.qry) do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT');
    SQL.Add('  RP.CODPROVDESC, RP.DESCRPROVDESC, RP.IDRUBRICA');
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
      ListaIdRubrica.Add(FieldByName('IDRUBRICA').asString);
      chklstRubrica1.Items.Add(FieldByName('DESCRPROVDESC').asString);
      chklstRubrica2.Items.Add(FieldByName('DESCRPROVDESC').asString);
      Next;
    end;
  end;

  dtmBaseDados.qry.Close;
  dtmBaseDados.qry.SQL.Clear;
  dtmBaseDados.qry.SQL.Add('Select NormalIni, NormalFim from ParamRH');
  dtmBaseDados.qry.Open;

  dtedIni.Date := dtmBaseDados.qry.FieldByName('NormalIni').asDateTime;
  dtedFin.Date := dtmBaseDados.qry.FieldByName('NormalFim').asDateTime;
  Paginas.ActivePageIndex := 0;

  // Registro o Form de visualização
  ppRegisterForm(TppCustomPreviewer, TppPrintPreview);
  // Carrega alterações nas opções feitas anteriormente
  LeAlteracoes;

  PaginasChange(Self);
end;

procedure TfrmParamRelatSubstEvent.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GravaAlteracoes;

  qryEstab.Close;
  dtmBaseDados.qry.Close;
  inherited;
  ListaIdRubrica.Free;
end;

procedure TfrmParamRelatSubstEvent.chklstRubrica1DrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
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

procedure TfrmParamRelatSubstEvent.dblkcbEstabChange(Sender: TObject);
begin
  dblkcbEstab.Text := Trim(dblkcbEstab.Text);
end;

procedure TfrmParamRelatSubstEvent.PaginasChange(Sender: TObject);
begin
  if (Paginas.ActivePageIndex = 0) then
  begin
    edCodRubricas.Text := sCodRubricaSel;
    chkListAux := chklstRubrica1;
  end
  else
  begin
    edCodRubricas.Text := sCodRubricaSel2;
    chkListAux := chklstRubrica2;
  end;
end;

procedure TfrmParamRelatSubstEvent.chklstRubrica1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    chklstRubrica1ClickCheck(Sender);
end;

procedure TfrmParamRelatSubstEvent.chklstRubrica1ClickCheck(Sender: TObject);
begin
  if (Paginas.ActivePageIndex = 0) then
  begin
    CriaListaOpcoes(chkListAux, ListaCodRubrica, sCodRubricaSel, ',', false);
    edCodRubricas.Text := sCodRubricaSel;
  end
  else
  begin
    CriaListaOpcoes(chkListAux, ListaCodRubrica, sCodRubricaSel2, ',', false);
    edCodRubricas.Text := sCodRubricaSel2;
  end;

  InvalidateItemListBox(chkListAux, chkListAux.ItemIndex);
  HabilitaBtOk;
end;

procedure TfrmParamRelatSubstEvent.sbtnMarcarRubClick(Sender: TObject);
begin
  edCodRubricas.Text := Trim(edCodRubricas.Text);

  case (Paginas.ActivePageIndex) of
    0 : begin
          VerificaOpcoes (chklstRubrica1, ListaCodRubrica, edCodRubricas.Text, ',');
          sCodRubricaSel := edCodRubricas.Text;
          chklstRubrica1.Repaint;
        end;
    1 : begin
          VerificaOpcoes (chklstRubrica2, ListaCodRubrica, edCodRubricas.Text, ',');
          sCodRubricaSel2 := edCodRubricas.Text;
          chklstRubrica2.Repaint;
        end;
  end;
  HabilitaBtOk;
end;

procedure TfrmParamRelatSubstEvent.bbtnSelTodasClick(Sender: TObject);
var
  C: integer;
begin
  for C:=0 to chkListAux.Items.Count-1 do
    chkListAux.Checked[C] := true;
  chkListAux.Repaint;

  if (Paginas.ActivePageIndex = 0) then
  begin
    CriaListaOpcoes(chkListAux, ListaCodRubrica, sCodRubricaSel, ',', false);
    edCodRubricas.Text := sCodRubricaSel;
  end
  else
  begin
    CriaListaOpcoes(chkListAux, ListaCodRubrica, sCodRubricaSel2, ',', false);
    edCodRubricas.Text := sCodRubricaSel2;
  end;

  HabilitaBtOk;
end;

procedure TfrmParamRelatSubstEvent.bbtnInverteSelClick(Sender: TObject);
var
  C: integer;
begin
  for C:=0 to chkListAux.Items.Count-1 do
    chkListAux.Checked[C] := not(chkListAux.Checked[C]);
  chkListAux.Repaint;

  if (Paginas.ActivePageIndex = 0) then
  begin
    CriaListaOpcoes(chkListAux, ListaCodRubrica, sCodRubricaSel, ',', false);
    edCodRubricas.Text := sCodRubricaSel;
  end
  else
  begin
    CriaListaOpcoes(chkListAux, ListaCodRubrica, sCodRubricaSel2, ',', false);
    edCodRubricas.Text := sCodRubricaSel2;
  end;

  HabilitaBtOk;
end;

procedure TfrmParamRelatSubstEvent.rbtnImprimirClick(Sender: TObject);
var
  wNum: word;
begin
  frmAguarde.Mostra('Imprimindo Relatório');

  // Rubricas escolhidas
  wNum := CriaListaOpcoes(chklstRubrica1, ListaIdRubrica, sCodRubricaSel, ',', false);
  if (wNum = ListaCodRubrica.Count) then
    sCodRubricaSel := '';

  wNum := CriaListaOpcoes(chklstRubrica2, ListaIdRubrica, sCodRubricaSel2, ',', false);
  if (wNum = ListaCodRubrica.Count) then
    sCodRubricaSel2 := '';

  dtmBaseDados.qry.Close;
  with (dtmBaseDados.qry.SQL) do
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
    if (Pos(',',sCodRubricaSel) > 0) then
      Add('  (RI.IDRUBRICA     IN ('+sCodRubricaSel+')) AND')
    else
      Add('  (RI.IDRUBRICA      = '+sCodRubricaSel+') AND');

    Add('  (F.IDESTAB         = '+qryEstab.FieldByName('IDPESSOA').asString+') AND');
    Add('  (F.IDCARGO         = C.IDCARGO) AND');
    Add('  (F.IDPESSOA        = PF.IDPESSOA) AND');
    Add('  (F.IDCHEFE         = PC.IDPESSOA) AND');
    Add('  (MO.IDPESSOA       = F.IDPESSOA) AND');
    Add('  (CC.CODCENTROCUSTO = F.CODCENTROCUSTO) AND');
    Add('  (CC.IDEMPRESA      = F.IDEMPRESA) AND');
    Add('  (F.IDPESSOA        = RI.IDPESSOA) AND');
    Add('  (F.IDPESSOA        = H.IDPESSOA) AND');
    Add('  (H.MES             = RI.ANOMESINICIO OR RI.FLGPERMANENTE = 1)  AND');
    Add('  (H.MES             = TO_CHAR(MO.DATA,''YYYY/MM'') OR RI.FLGPERMANENTE = 1)  AND');

    if (Pos(',',sCodRubricaSel2) > 0) then
      Add('  (H.IDRUBRICA      IN ('+sCodRubricaSel2+'))')
    else
      Add('  (H.IDRUBRICA       = '+sCodRubricaSel2+')');

    Add('ORDER BY');
    Add('  PF.NOME, INICIO');
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  dtmBaseDados.qry.Open;

  if (dtmBaseDados.qry.IsEmpty) then
  begin
    frmAguarde.Apaga;
    MsgDlg('Não há registros a imprimir!','Aviso',mtInformation,[mbOk,mbHelp],0);
  end
  else
  begin
    if not(qryPrincipal.IsEmpty) then
      qryPrincipal.CancelUpdates;
    qryPrincipal.Close;
    qryPrincipal.Open;

    repeat
      if (dtmBaseDados.qry.FieldByName('INICIO').asDateTime >= StrToDate(dtedIni.Text)) and
         (dtmBaseDados.qry.FieldByName('FINAL').asDateTime  <= StrToDate(dtedFin.Text)) then
      begin
        qryPrincipal.Insert;
        qryPrincipal.FieldByName('INICIO').asString := dtmBaseDados.qry.FieldByName('INICIO').asString;
        qryPrincipal.FieldByName('FINAL').asString := dtmBaseDados.qry.FieldByName('FINAL').asString;
        qryPrincipal.FieldByName('EMPREGADO').asString := dtmBaseDados.qry.FieldByName('EMPREGADO').asString;
        qryPrincipal.FieldByName('CARGO').asString := dtmBaseDados.qry.FieldByName('CARGO').asString;
        qryPrincipal.FieldByName('LOTACAO').asString := dtmBaseDados.qry.FieldByName('LOTACAO').asString;
        qryPrincipal.FieldByName('PERIODO').asString := dtmBaseDados.qry.FieldByName('PERIODO').asString;
        qryPrincipal.FieldByName('SUBSTITUIDO').asString := dtmBaseDados.qry.FieldByName('SUBSTITUIDO').asString;
        qryPrincipal.FieldByName('QUANT_DIAS').asString := dtmBaseDados.qry.FieldByName('QUANT_DIAS').asString;
        qryPrincipal.FieldByName('MOTIVO').asString := dtmBaseDados.qry.FieldByName('MOTIVO').asString;
        qryPrincipal.FieldByName('VALOR').asString := dtmBaseDados.qry.FieldByName('VALOR').asString;
        qryPrincipal.Post;
      end;

      dtmBaseDados.qry.Next;
    until (dtmBaseDados.qry.EOF);

    if (qryPrincipal.IsEmpty) then
    begin
      frmAguarde.Apaga;
      MsgDlg('Não há registros a imprimir!','Aviso',mtInformation,[mbOk,mbHelp],0);
    end
    else
    begin
      rpPrincipal.Device := dvScreen;
      rpPrincipal.Print;
    end;
  end;
end;

procedure TfrmParamRelatSubstEvent.qryPrincipalAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TfrmParamRelatSubstEvent.qryPrincipalAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TfrmParamRelatSubstEvent.rpPrincipalSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

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
  ArqConfig := TIniFile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CONFIG_FOLHAPAGTO.INI');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332

  sCodEstabSel := ArqConfig.ReadString('REL_SUBSTEVENT', 'Estabelec', '');
  sCodRubricaSel  := ArqConfig.ReadString('REL_SUBSTEVENT', 'Rubricas1', '');
  sCodRubricaSel2 := ArqConfig.ReadString('REL_SUBSTEVENT', 'Rubricas2', '');

  if (sCodEstabSel = '') then
  begin
    qryEstab.First;
    sCodEstabSel := qryEstab.FieldByName('IDPESSOA').asString;
  end;
  dblkcbEstab.LookUpValue := sCodEstabSel;
  dblkcbEstab.UpDate;

  VerificaOpcoes(chklstRubrica1, ListaCodRubrica, sCodRubricaSel, ',');
  VerificaOpcoes(chklstRubrica2, ListaCodRubrica, sCodRubricaSel2, ',');

  edCodRubricas.Text := sCodEstabSel;
end;

procedure TfrmParamRelatSubstEvent.GravaAlteracoes;
begin
  // Grava as últimas alterações da Opção de Rubricas 1
  CriaListaOpcoes(chklstRubrica1, ListaCodRubrica, sCodRubricaSel, ',', false);
  ArqConfig.WriteString('REL_SUBSTEVENT','Rubricas1',sCodRubricaSel);

  // Grava as últimas alterações da Opção de Rubricas 2
  CriaListaOpcoes(chklstRubrica2, ListaCodRubrica, sCodRubricaSel2, ',', false);
  ArqConfig.WriteString('REL_SUBSTEVENT','Rubricas2',sCodRubricaSel2);
end;

end.
