// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamProvisaoFerias;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook, Spin,
  checklst, TREdit, IvDictio, IvMulti, IvEMulti, ComCtrls, wwdbdatetimepicker,
  CMDateTimePicker, fSairAjuda;

type
  TfrmParamProvisaoFerias = class(TfrmSairAjuda)
    qryEstab: TwwQuery;
    gbxEstab: TGroupBox;
    dblkcbEstab: TwwDBLookupCombo;
    gbxFunc: TGroupBox;
    pgctrlEmpregados: TPageControl;
    tbshListaFunc: TTabSheet;
    chklstFunc: TCheckListBox;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    tbshFiltroFunc: TTabSheet;
    gbxTipContra: TGroupBox;
    cbxEfetivos: TCheckBox;
    cbxEspeciais: TCheckBox;
    cbxTemporarios: TCheckBox;
    cbxEstagiarios: TCheckBox;
    cbxTerceiros: TCheckBox;
    cbxPropDirSemVinc: TCheckBox;
    cbxAutonomos: TCheckBox;
    gbxSituacao: TGroupBox;
    cbxAtivos: TCheckBox;
    cbxAfastados: TCheckBox;
    gbxRubricas: TGroupBox;
    Label1: TLabel;
    chklstRubrica: TCheckListBox;
    edCodRubricas: TEdit;
    sbtnMarcarRub: TBitBtn;
    gbxEncargo: TGroupBox;
    rePercent: TRealEdit;
    gbxDataBase: TGroupBox;
    dtedDataBase: TCMDateTimePicker;
    rgTipoCalc: TRadioGroup;
    rg13: TRadioGroup;
    gbxOrdem: TGroupBox;
    cmbOrderBy: TComboBox;
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblkcbEstabChange(Sender: TObject);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure gbxTipContraExit(Sender: TObject);
    procedure sbtnMarcarRubClick(Sender: TObject);
    procedure chklstRubricaDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure gbxSituacaoEnter(Sender: TObject);
    procedure gbxSituacaoExit(Sender: TObject);
    procedure gbxTipContraEnter(Sender: TObject);
    procedure chklstFuncClickCheck(Sender: TObject);
    procedure chklstRubricaClickCheck(Sender: TObject);
    procedure dtedDataBaseChange(Sender: TObject);
    procedure chklstFuncKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chklstRubricaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure HabilitaBtOk;
    procedure MontaListaFuncionarios;
    function  SelecionaTipoContrato: string;
    function  SelecionaSitFunc: string;
  end;

var
  frmParamProvisaoFerias: TfrmParamProvisaoFerias;

implementation

uses uSistema, uMensErro, uDataBase, fAguarde, dBaseDados,
  uFuncoesUteis, UsoGeralRH, uComumRelats, dRelatorios2;

{$R *.DFM}

procedure TfrmParamProvisaoFerias.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  if not(Assigned(ListaCodFunc)) then
    ListaCodFunc := TStringList.Create;
  if not(Assigned(ListaCodRubrica)) then
    ListaCodRubrica := TStringList.Create;
  IDEstab := -1;

  cmbTipoPapel.Items.Assign (dtmRelatorios2.rpProvisaoFerias.PrinterSetup.PaperNames);

  iPos := ProcuraStList (cmbTipoPapel.Items,'A4');
  if (iPos = -1) then
    cmbTipoPapel. ItemIndex := 0
  else
    cmbTipoPapel. ItemIndex := iPos;

  FazQuery(dtmBaseDados.qry,'SELECT NORMALINI FROM PARAMRH');
  dtedDataBase.Date := dtmBaseDados.qry.FieldByName('NORMALINI').Value - 1;

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
  chklstRubrica.Items.Clear;
  ListaCodRubrica.Clear;
  with (dtmBaseDados.qry) do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT');
    SQL.Add('  RP.CODPROVDESC, RP.DESCRPROVDESC');
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

  cmbOrderBy.ItemIndex := 0;
  pgctrlEmpregados.ActivePageIndex := 0;
end;

procedure TfrmParamProvisaoFerias.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dtmBaseDados.qry.Close;
  qryEstab.Close;
  inherited;
end;

procedure TfrmParamProvisaoFerias.chklstRubricaDrawItem(Control: TWinControl; Index: Integer;
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

procedure TfrmParamProvisaoFerias.dblkcbEstabChange(Sender: TObject);
begin
  if (qryEstab.FieldByName('IDPESSOA').asInteger <> IDEstab) then
  begin
    MontaListaFuncionarios;
    IDEstab := qryEstab.FieldByName('IDPESSOA').asInteger;

    if (pgctrlEmpregados.ActivePageIndex = 0) then
      chklstFunc.Repaint;
  end;
end;

procedure TfrmParamProvisaoFerias.dtedDataBaseChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamProvisaoFerias.gbxTipContraEnter(Sender: TObject);
begin
  bTipContrEfet  := cbxEfetivos.Checked;
  bTipContrEspec := cbxEspeciais.Checked;
  bTipContrTemp  := cbxTemporarios.Checked;
  bTipContrEst   := cbxEstagiarios.Checked;
  bTipContrTerc  := cbxTerceiros.Checked;
  bTipContrProp  := cbxPropDirSemVinc.Checked;
  bTipContrAut   := cbxAutonomos.Checked;
end;

procedure TfrmParamProvisaoFerias.gbxTipContraExit(Sender: TObject);
begin
  if not(cbxEfetivos.Checked)       and not(cbxEspeciais.Checked) and
     not(cbxTemporarios.Checked)    and not(cbxTerceiros.Checked) and
     not(cbxPropDirSemVinc.Checked) and not(cbxAutonomos.Checked) and
     not(cbxEstagiarios.Checked) then
  begin
    MsgDlg ('Pelo menos um Tipo de Contrato deve ser selecionado !','Aviso', mtInformation,[mbOk,mbHelp],0);
    cbxEfetivos.SetFocus;
  end
  else
  begin
    if (bTipContrEfet <> cbxEfetivos.Checked)    or (bTipContrEspec <> cbxEspeciais.Checked)      or
       (bTipContrTemp <> cbxTemporarios.Checked) or (bTipContrEst   <> cbxEstagiarios.Checked)    or
       (bTipContrTerc <> cbxTerceiros.Checked)   or (bTipContrProp  <> cbxPropDirSemVinc.Checked) or
       (bTipContrAut  <> cbxAutonomos.Checked) then
      MontaListaFuncionarios;
  end;
end;

procedure TfrmParamProvisaoFerias.gbxSituacaoEnter(Sender: TObject);
begin
  bSitAtivo := (cbxAtivos.Checked);
  bSitAfast := (cbxAfastados.Checked);
end;

procedure TfrmParamProvisaoFerias.gbxSituacaoExit(Sender: TObject);
begin
  if not(cbxAtivos.Checked) and not(cbxAfastados.Checked) then
  begin
    MsgDlg ('Pelo menos um Tipo de Situação deve ser selecionado !','Aviso',
      mtInformation,[mbOk,mbHelp],0);
    cbxAtivos.SetFocus;
  end
  else
  if (bSitAtivo <> cbxAtivos.Checked) or (bSitAfast <> cbxAfastados.Checked) then
    MontaListaFuncionarios;
end;

procedure TfrmParamProvisaoFerias.chklstFuncKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    chklstFuncClickCheck(Sender);
end;

procedure TfrmParamProvisaoFerias.chklstRubricaKeyDown(Sender: TObject; var Key:
  Word; Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    chklstRubricaClickCheck(Sender);
end;

procedure TfrmParamProvisaoFerias.chklstFuncClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
  HabilitaBtOk;
end;

procedure TfrmParamProvisaoFerias.chklstRubricaClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
  CriaListaOpcoes (chklstRubrica, ListaCodRubrica, sCodRubricaSel, ',', false);
  edCodRubricas.Text := sCodRubricaSel;
  HabilitaBtOk;
end;

procedure TfrmParamProvisaoFerias.sbtnMarcarRubClick(Sender: TObject);
begin
  edCodRubricas.Text := Trim(edCodRubricas.Text);

  VerificaOpcoes (chklstRubrica, ListaCodRubrica, edCodRubricas.Text, ',');
  HabilitaBtOk;
  chklstRubrica.Repaint;
end;

procedure TfrmParamProvisaoFerias.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := true;
  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamProvisaoFerias.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := not(chklstFunc.Checked[c]);
  chklstFunc.Repaint;
  HabilitaBtOk;  
end;

procedure TfrmParamProvisaoFerias.bbtnConfirmarClick(Sender: TObject);
var
  c, K: integer;
  byNumRubSel: byte;
  sQueryAux, sQuery: string;
begin
  // Verifica quantas rubricas foram selecionadas
  byNumRubSel:=0;
  for c:=0 to chklstRubrica.Items.Count-1 do
    if (chklstRubrica.checked[c]) then
      Inc (byNumRubSel);

  with (dtmRelatorios2.qryProvisaoFerias.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  PJ.RAZAOSOCIAL AS EMPRESA,');
    Add('  RTRIM(DECODE(RTRIM(ESTADUAL.NUMDOCUMENTO),NULL,');
    Add('    DECODE(RTRIM(MUNICIPAL.NUMDOCUMENTO),NULL,NULL,');
    Add('    ''Inscrição Municipal: ''|| MUNICIPAL.NUMDOCUMENTO),');
    Add('    ''Inscrição Estadual: '' || ESTADUAL.NUMDOCUMENTO)) AS ESTADUALMUNICIPAL,');
    Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO || DECODE(E.COMPLEMENTO,NULL,NULL,'' - '' ||');
    Add('    RTRIM(E.COMPLEMENTO)) ||'' - ''|| RTRIM(E.BAIRRO) ||'' - ''|| RTRIM(CIDADES.NOME) ||'' - CEP:''||');
    Add('    RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS ENDERECO,');
    Add('  ES.CODESTADO AS UF,');
    Add('  (''CNPJ: '' || PJ.NUMDOCUMENTO) AS CGC,');
    Add('  F.MATRICULA,');
    Add('  F.CODCENTROCUSTO AS CENTROCUSTO,');
    Add('  PF.NOME AS EMPREGADO,');
    Add('  DECODE(FE.ULTFERIAS,NULL,F.DATAADMISSAO,ADD_MONTHS(FE.ULTFERIAS,12)) AS DATAREFER,');
    Add('  NVL(DF.DIASFE,0)  AS  DIASFERIAS,');
    // --------------------------------------------------------------------------------- //
    // Calculo o valor parcial das férias  (Rubrica1 + Rubrica2 + ... RubricaN)
    K := 1;
    sQuery := '  (';
    for c:=0 to chklstRubrica.Items.Count-1 do
    begin
      if (chklstRubrica.checked[c]) then
      begin
        if (K > 1) then
          sQuery := sQuery +' + ';
        sQuery := sQuery + 'NVL(RUBRICA' +IntToStr(K)+ '.VALORPROVENTO,0)';
        Inc(K);
      end;
    end;
    Add (sQuery+ ') AS SALDOFERIAS');
    // --------------------------------------------------------------------------------- //
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, ENDPESS E, CIDADES, FUNCIONARIO F, ESTADO ES,');
    // --------------------------------------------------------------------------------- //
    Add('  (SELECT DP.IDPESSOA, TDO.CODDOCUMENTO, DP.NUMDOCUMENTO, UPPER(TDO.SIGLADOCUMENTO)');
    Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''ESTADUAL:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO)) ESTADUAL,');
    // -------------------------------------------------------------------------- //
    Add('  (SELECT DP.IDPESSOA, TDO.CODDOCUMENTO, DP.NUMDOCUMENTO, UPPER(TDO.SIGLADOCUMENTO)');
    Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''MUNICIPAL:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO)) MUNICIPAL,');
    // --------------------------------------------------------------------------------- //
    Add('  (SELECT IDPESSOA,');
    Add('     (MOD(SUM(FIMGOZOFERIAS - INIGOZOFERIAS + 1 + FLGABONO * 10),30)) AS DIASFE');
    Add('   FROM   FERIAS');
    Add('   WHERE (FLGOCORRIDA    = 1) AND');
    Add('         (INIGOZOFERIAS <= TO_DATE(' +QuotedStr(dtedDataBase.Text)+ ',''DD/MM/YYYY''))');
    Add('   GROUP BY IDPESSOA) DF,');
    // --------------------------------------------------------------------------------- //
    Add('  (SELECT IDPESSOA,');
    Add('     MAX(INIPERIODOFERIAS) AS ULTFERIAS');
    Add('   FROM   FERIAS');
    Add('   WHERE');

    K:=1; sQueryAux:='';
    for c:=0 to chklstFunc.Items.Count-1 do
      if (chklstFunc.Checked[c]) then
      begin
        if (K = 1) then
        begin
          sQueryAux := 'IDPESSOA IN ('+ListaCodFunc.Strings[c];
          Inc(K);
        end
        else
          sQueryAux := sQueryAux+','+ListaCodFunc.Strings[c];
      end;
    if (K > 1) then
    begin
      sQueryAux := sQueryAux+')) AND';
      Add('     ('+sQueryAux);
    end;

    Add('     (FLGOCORRIDA    = 1) AND');
    Add('     (INIGOZOFERIAS <= TO_DATE(' +QuotedStr(dtedDataBase.Text)+ ',''DD/MM/YYYY''))');
    Add('   GROUP BY IDPESSOA) FE,');
    // --------------------------------------------------------------------------------- //
    if (byNumRubSel > 1) then
      sQuery := ','
    else
      sQuery := '';

    K := 1;
    for c:=0 to chklstRubrica.Items.Count - 1 do
      if (chklstRubrica.checked[c]) then
      begin
        if (k = byNumRubSel) then
          sQuery := '';

        if (sQueryAux <> '') then
        begin
          Add('  (SELECT IDPESSOA, VALORPROVENTO');
          Add('   FROM   HISTRUBSAL');
          Add('   WHERE  (CODPROVDESC = '+QuotedStr(ListaCodRubrica[c])+') AND');
          Add('          ('+sQueryAux);
          Add('          (MES         = (SELECT MAX(MES) FROM HISTRUBSAL');
          Add('                          WHERE');
          Add('                            ('+sQueryAux);
          Add('                            (CODPROVDESC = '+QuotedStr(ListaCodRubrica[c])+'))');
          Add('  )) RUBRICA'+IntToStr(K)+sQuery);
        end
        else
        begin
          Add('  (SELECT F.IDPESSOA, H.VALORPROVENTO');
          Add('   FROM   HISTRUBSAL H, FUNCIONARIO F');
          Add('   WHERE');
          Add('     (H.CODPROVDESC     = '+QuotedStr(ListaCodRubrica[c])+') AND');

          // C. de Custo(s) habilitados para o usuário
          if (sUsuXccusto <> '') then
            Add('     (F.CODCENTROCUSTO IN ' +sUsuXccusto+ ') AND');

          Add('     (H.IDPESSOA        = F.IDPESSOA) AND');
          Add('     (H.MES             = (SELECT MAX(H.MES) FROM HISTRUBSAL H, FUNCIONARIO F');
          Add('                           WHERE');
          Add('                             (H.CODPROVDESC     = '+QuotedStr(ListaCodRubrica[c])+') AND');

          // C. de Custo(s) habilitados para o usuário
          if (sUsuXccusto <> '') then
            Add('                             (F.CODCENTROCUSTO IN ' +sUsuXccusto+ ') AND');

          Add('                             (H.IDPESSOA        = F.IDPESSOA))');
          Add('  )) RUBRICA'+IntToStr(K)+sQuery);
        end;

        Inc(K);
      end;
    // --------------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (PJ.IDPESSOA    = '+qryEstab.FieldByName('IDPESSOA').asString+') AND');
    // --------------------------------------------------------------------------------- //
    K:=1; sQueryAux:='';
    for c:=0 to chklstFunc.Items.Count-1 do
      if (chklstFunc.Checked[c]) then
      begin
        if (K = 1) then
        begin
          sQueryAux := '  (PF.IDPESSOA IN ('+ListaCodFunc.Strings[c];
          Inc(K);
        end
        else
          sQueryAux := sQueryAux+','+ListaCodFunc.Strings[c];
      end;
      
    if (K > 1) then
      Add (sQueryAux+')) AND')
    else
    begin
      // C. de Custo(s) habilitados para o usuário
      if (sUsuXccusto <> '') then
        Add('  (F.CODCENTROCUSTO IN ' +sUsuXccusto+ ') AND');
    end;
    // --------------------------------------------------------------------------------- //
    Add('  (PJ.IDPESSOA       = F.IDESTAB)             AND');
    Add('  (PF.IDPESSOA       = F.IDPESSOA)            AND');
    Add('  (PJ.IDPESSOA       = E.IDPESSOA)            AND');
    Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO)          AND');
    Add('  (E.IDCIDADES       = CIDADES.IDCIDADES)     AND');
    Add('  (CIDADES.IDESTADO  = ES.IDESTADO)           AND');
    Add('  (PJ.IDPESSOA       = ESTADUAL.IDPESSOA(+))  AND');
    Add('  (PJ.IDPESSOA       = MUNICIPAL.IDPESSOA(+)) AND');
    // --------------------------------------------------------------------------------- //
    sQuery:=' AND '; K:=1;
    for c:=0 to chklstRubrica.Items.Count - 1 do
      if (chklstRubrica.checked[c]) then
      begin
        Add('  (PF.IDPESSOA = RUBRICA'+IntToStr(K)+'.IDPESSOA(+))'+sQuery);
        Inc (k);
      end;
    // --------------------------------------------------------------------------------- //
    Add('  (PF.IDPESSOA    = FE.IDPESSOA(+)) AND ');
    Add('  (PF.IDPESSOA    = DF.IDPESSOA(+))');
    Add('ORDER BY');
    case (cmbOrderBy.ItemIndex) of
      0 : Add('  EMPRESA, EMPREGADO');
      1 : Add('  EMPRESA, CENTROCUSTO, EMPREGADO');
      2 : Add('  EMPRESA, CENTROCUSTO, MATRICULA');
      3 : Add('  EMPRESA, MATRICULA');
    end;
    //SaveToFile ('c:\qry.txt');
    SaveToFile (Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt'); //Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;

  frmAguarde.Mostra ('Provisão de Férias');
  frmAguarde.Pos := 0;
  dtmRelatorios2.qryProvisaoFerias.Open;
  if (dtmRelatorios2.qryProvisaoFerias.IsEmpty) then
  begin
    ModalResult := mrNone;
    frmAguarde.Apaga;
    MsgDlg('Não há dados a serem exibidos! Verifique.','Aviso',mtInformation,[mbOk,mbHelp],0);
  end;

  with (dtmRelatorios2) do
  begin
    rPercent   := rePercent.Value;
    dtDataBase := dtedDataBase.Date;
    TipoCalc   := rgTipoCalc.ItemIndex;
    FlgSoma13  := rg13.ItemIndex;
    rpProvisaoFeriasLblMESREF.Caption := MesExtensoAno(Copy(dtedDataBase.Text,7,4) +'/'+
      Copy(dtedDataBase.Text,4,2));

    rpProvisaoFerias.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
  end;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------
procedure TfrmParamProvisaoFerias.MontaListaFuncionarios;
begin
  if (dblkcbEstab.Text <> '') then
  begin
    dtmBaseDados.qry.Close;
    ListaCodFunc.Clear;
    chklstFunc.Items.Clear;

    with (dtmBaseDados.qry.SQL) do
    begin
      Clear;
      Add('SELECT DISTINCT');
      Add('  PF.IDPESSOA, PF.NOME');
      Add('FROM');
      Add('  PESSOA PF, FUNCIONARIO F, SITFUNC ST');
      Add('WHERE');
      Add('  (F.IDESTAB         = ' +qryEstab.FieldByName('IDPESSOA').asString+ ') AND');

      // C. de Custo(s) habilitados para o usuário
      if (sUsuXccusto <> '') then
      begin
        if (Pos(',',sUsuXccusto) > 0) then
          Add('  (F.CODCENTROCUSTO IN ' +sUsuXccusto+ ') AND')
        else
          Add('  (F.CODCENTROCUSTO  = ' +sUsuXccusto+ ') AND');
      end;

      sAux := SelecionaSitFunc;
      if (Pos(',',sAux) > 0) then
        Add('  (ST.TIPOSIT        IN (' +sAux+ ')) AND')
      else
        Add('  (ST.TIPOSIT         = ' +sAux+ ') AND');

      sAux := SelecionaTipoContrato;
      if (Pos(',',sAux) > 0) then
        Add('  (F.TIPOCONTRATO    IN (' +sAux+ ')) AND')
      else
        Add('  (F.TIPOCONTRATO     = ' +sAux+ ') AND');

      Add('  (ST.IDSITFUNC   = F.IDSITFUNC) AND');        
      Add('  (F.IDPESSOA     = PF.IDPESSOA)');
      Add('ORDER BY');
      Add('  UPPER(NOME)');
    end;
    dtmBaseDados.qry.Open;

    while not(dtmBaseDados.qry.EOF) do
    begin
      ListaCodFunc.Add(dtmBaseDados.qry.FieldByName('IDPESSOA').asString);
      chklstFunc.Items.Add(dtmBaseDados.qry.FieldByName('NOME').asString);
      dtmBaseDados.qry.Next;
    end;
    bbtnSelTodosClick(Self);    
  end;
  HabilitaBtOk;
end;

procedure TfrmParamProvisaoFerias.HabilitaBtOk;
var
  c: integer;
  bSelRub, bSelFunc: boolean;
begin
  bSelRub := false;
  for c:=0 to chklstRubrica.Items.Count-1 do
    if (chklstRubrica.Checked[c]) then
    begin
      bSelRub := true;
      break;
    end;

  bSelFunc := false;
  for c:=0 to chklstFunc.Items.Count-1 do
    if (chklstFunc.Checked[c]) then
    begin
      bSelFunc := true;
      break;
    end;

  bbtnConfirmar.Enabled := (bSelRub) and (bSelFunc) and (Trim(dtedDataBase.Text) <> '');
end;

function TfrmParamProvisaoFerias.SelecionaTipoContrato: string;
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

  if (cbxPropDirSemVinc.Checked) then
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

function TfrmParamProvisaoFerias.SelecionaSitFunc: string;
begin
  sAux := '';
  if (cbxAtivos.Checked) then
    sAux := QuotedStr('A');

  if (cbxAfastados.Checked) then
    if (length(sAux) > 0) then
      sAux := sAux +','+ QuotedStr('F')
    else
      sAux := QuotedStr('F');

  Result := sAux;
end;

end.
