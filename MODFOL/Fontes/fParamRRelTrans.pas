// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamRRelTrans;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, Spin,
  DBTables, Wwquery, wwdblook, checklst, IniFiles, ComCtrls, wwdbdatetimepicker,
  CMDateTimePicker, fSairAjuda;

type
  TfrmRRelTrans = class(TfrmSairAjuda)
    gbxEstab: TGroupBox;
    dblkcbEstab: TwwDBLookupCombo;
    qryEstab: TwwQuery;
    gbxRubIncid: TGroupBox;
    qryRubrica: TwwQuery;
    qryTesta50446: TwwQuery;
    chkbxGravaRub: TCheckBox;
    dblkpcmbRubrica: TwwDBLookupCombo;
    qryVerificaRubrica: TwwQuery;
    gbxOrdem: TGroupBox;
    cmbOrderBy: TComboBox;
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
    gbxDiasMin: TGroupBox;
    spedDias: TSpinEdit;
    gbxIntervRef: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtedInicio: TCMDateTimePicker;
    dtedFim: TCMDateTimePicker;
    gbxDesconta: TGroupBox;
    chkbFerias: TCheckBox;
    chkbFaltas: TCheckBox;
    chkbFeriados: TCheckBox;
    gbxQuantDias: TGroupBox;
    spedQuantDias: TSpinEdit;
    rgImprimeNumFunc: TRadioGroup;
    gbxFunc: TGroupBox;
    pgctrlEmpregados: TPageControl;
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
    cbxPropDirSemVinc: TCheckBox;
    cbxAutonomos: TCheckBox;
    gbxSituacao: TGroupBox;
    cbxAtivos: TCheckBox;
    cbxAfastados: TCheckBox;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblkcbEstabChange(Sender: TObject);
    procedure chklstFuncDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure dtedInicioChange(Sender: TObject);
    procedure gbxSituacaoEnter(Sender: TObject);
    procedure gbxSituacaoExit(Sender: TObject);
    procedure gbxTipContraEnter(Sender: TObject);
    procedure gbxTipContraExit(Sender: TObject);
    procedure chklstFuncClickCheck(Sender: TObject);
    procedure bbtnSelTodosFuncClick(Sender: TObject);
    procedure bbtnInverteSelFuncClick(Sender: TObject);
    procedure chklstFuncKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    bmRegistro: TBookMark;

    iIDFuncionario, iIDEmpresa, ProxSeqRub, iPrimeiraDif, iSegundaDif, iTipoFerias,
    iTipoHorario, iTotDiasMes, iDiaMes, iDiaTrabalhado, iTotDiasDesc, iDiaSemanaInicio,
    iDiasFerias, iADom, iASeg, iATer, iAQua, iAQui, iASex, iASab, iDom, iSeg, iTer, iQua,
    iQui, iSex, iSab: integer;

    iIdRubrica, iIdRegra: LongInt;

    dDataInicio, dInicioFerias, dFimFerias, dNormalIni2, dNormalFim2: TDateTime;

    rQtdeTotal, rValorTotal, rQtdeLinhas, rRestoDivisao, rRazao, rTotHoras, rHora1,
    rHora2, rResto, rValorTotLinha, fValorLinha: real;

    wOldDecimal, sMatricula, sNumLinha, sTipoLinha, sCodRubClt: string;

    procedure LeAlteracoes;
    procedure GravaAlteracoes;
    procedure GravaDadosQuery;
    procedure CalcularDiasTrabalhados;
    procedure CalcularValorLinha;
    procedure GravarLinha;
    procedure MontaListaFuncionarios;
    function  VerificaOpcoesOk: boolean;
    procedure HabilitaBtOk;
    function  SelecionaSitFunc: string;
    function  SelecionaTipoContrato: string;
  end;

var
  frmRRelTrans: TfrmRRelTrans;

implementation

uses uSistema, uMensErro, uDiasUteis, uDataBase, fAguarde, dBaseDados, dFolha,
  uFuncoesUteis, UsoGeralRH, uComumRelats, fPrincipal, dRelatorios1;

{$R *.DFM}

procedure TfrmRRelTrans.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  if not(Assigned(ListaCodRubrica)) then
    ListaCodRubrica := TStringList.Create;
  if not(Assigned(ListaCodFunc)) then
    ListaCodFunc := TStringList.Create;
  IDEstab := -1;

  cmbTipoPapel.Items.Assign (dtmRelatorios1.rpRTransporte.PrinterSetup.PaperNames);

  iPos := ProcuraStList (cmbTipoPapel.Items,'A4');
  if (iPos = -1) then
    cmbTipoPapel. ItemIndex := 0
  else
    cmbTipoPapel. ItemIndex := iPos;

  FazQuery(dtmBaseDados.qry,'SELECT NORMALINI, NORMALFIM FROM PARAMRH');
  dtedInicio.Date := ProxMes(dtmBaseDados.qry.FieldByName('NORMALINI').asDateTime);
  dtedFim.Date    := ProxMes(dtmBaseDados.qry.FieldByName('NORMALFIM').asDateTime);
    
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
  qryRubrica.ParamByName('IDEMPRESA').asInteger := Sistema.IdEmpresa;  
  qryRubrica.Open;
  qryTesta50446.Open;

  if (qryTesta50446.Fields[1].asInteger > 0) then
    dblkpcmbRubrica.LookUpValue := qryTesta50446.FieldByName('IDPROVENTO').Value;

  cmbOrderBy.ItemIndex := 0;    
  pgctrlEmpregados.ActivePageIndex := 0;

  // Carrega alterações nas opções feitas anteriormente
  LeAlteracoes;
end;

procedure TfrmRRelTrans.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GravaAlteracoes;

  dtmBaseDados.qry.Close;
  qryEstab.Close;
  qryRubrica.Close;
  qryTesta50446.Close;
  inherited;
end;

procedure TfrmRRelTrans.chklstFuncDrawItem(Control: TWinControl; Index: Integer;
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

procedure TfrmRRelTrans.dtedInicioChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmRRelTrans.dblkcbEstabChange(Sender: TObject);
begin
  if (qryEstab.FieldByName('IDPESSOA').asInteger <> IDEstab) then
  begin
    MontaListaFuncionarios;
    IDEstab := qryEstab.FieldByName('IDPESSOA').asInteger;

    if (pgctrlEmpregados.ActivePageIndex = 0) then
      chklstFunc.Repaint;
  end;
end;

procedure TfrmRRelTrans.gbxTipContraEnter(Sender: TObject);
begin
  bTipContrEfet  := cbxEfetivos.Checked;
  bTipContrEspec := cbxEspeciais.Checked;
  bTipContrTemp  := cbxTemporarios.Checked;
  bTipContrEst   := cbxEstagiarios.Checked;
  bTipContrTerc  := cbxTerceiros.Checked;
  bTipContrProp  := cbxPropDirSemVinc.Checked;
  bTipContrAut   := cbxAutonomos.Checked;
end;

procedure TfrmRRelTrans.gbxTipContraExit(Sender: TObject);
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

procedure TfrmRRelTrans.gbxSituacaoEnter(Sender: TObject);
begin
  bSitAtivo := cbxAtivos.Checked;
  bSitAfast := cbxAfastados.Checked;
end;

procedure TfrmRRelTrans.gbxSituacaoExit(Sender: TObject);
begin
  if not(cbxAtivos.Checked) and not(cbxAfastados.Checked) then
  begin
    MsgDlg ('Pelo menos um Tipo de Situação deve ser selecionado !','Aviso', mtInformation,[mbOk,mbHelp],0);
    gbxSituacao.SetFocus;
  end
  else
  if (bSitAtivo <> cbxAtivos.Checked) or (bSitAfast <> cbxAfastados.Checked) then
    MontaListaFuncionarios;
end;

procedure TfrmRRelTrans.chklstFuncKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmRRelTrans.chklstFuncClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmRRelTrans.bbtnSelTodosFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := true;

  chklstFunc.Repaint;
end;

procedure TfrmRRelTrans.bbtnInverteSelFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := not(chklstFunc.Checked[c]);

  chklstFunc.Repaint;
end;

function TfrmRRelTrans.VerificaOpcoesOk: boolean;
begin
  Result := false;

  iIdRubrica:=0; iIdRegra:=0;

  // Testa se Data Final é MENOR do que a Data Inicial
  if (dtedFim.Date < dtedInicio.Date) then
  begin
    MsgDlg ('Data Final menor que a Inicial !','Aviso', mtInformation,[mbOk,mbHelp],0);
    dtedInicio.SetFocus;
    exit;
  end;

  // Verifico se Grava ou Não as Rubricas Individuais
  if (chkbxGravaRub.Checked) then
  begin
    // Não Encontrou a Rubrica
    if (qryTesta50446.Fields[1].asInteger <= 0) then
    begin
      // Verifica se foi escolhida alguma Rubrica
      if (Trim(dblkpcmbRubrica.Value) <> '') then
      begin
        iIdRubrica := qryRubrica.FieldByName('IDPROVENTO').asInteger;
        iIdRegra   := qryRubrica.FieldByname('IDREGRA').asInteger;
      end
      else
      begin
        MsgDlg('Deve ser escolhida alguma Rubrica !','Aviso', mtInformation,[mbOk,mbHelp],0);
        dblkpcmbRubrica.SetFocus;
        exit;
      end
    end
    else
    begin
      // Verifica se foi escolhida alguma Rubrica
      if (Trim(dblkpcmbRubrica.Value) <> '') then
      begin
        iIdRubrica := qryRubrica.FieldByName('IDPROVENTO').asInteger;
        iIdRegra   := qryRubrica.FieldByname('IDREGRA').asInteger;
      end
      else
      begin
        iIdRubrica := QryTesta50446.Fields[0].AsInteger;
        iIdRegra   := QryTesta50446.FieldByname('IDREGRA').asInteger;
      end;
    end;

    // Testa se a Rubrica existe para este Estabelecimento (Somente se o Estabelecimento for escolhido)
    if (IDEstab <> -1) then
    begin
      qryVerificaRubrica.Close;
      qryVerificaRubrica.ParamByName('IDPESSOA').asInteger  := Sistema.IdEmpresa;
      qryVerificaRubrica.ParamByName('IDRUBRICA').asInteger := iIdRubrica;
      qryVerificaRubrica.Open;
      // Faz Verificação
      if (qryVerificaRubrica.Fields[0].asInteger = 0) then
      begin
        MsgDlg('Esta Rubrica não está Relacionada a este Estabelecimento !','Aviso', mtInformation,[mbOk,mbHelp],0);
        dblkpcmbRubrica.SetFocus;
        exit;
      end;
    end;
  end;

  Result := true;
end;

procedure TfrmRRelTrans.bbtnConfirmarClick(Sender: TObject);
var
  wNum: word;
  sAnoMes: string;
  dInicio, dFim: TDateTime;    
begin
  // Verifica se as opções estão corretamente selecionadas
  if not(VerificaOpcoesOk) then
    exit;

  // Funcionários escolhidos
  wNum := CriaListaOpcoes (chklstFunc, ListaCodFunc, sCodFuncSel, ',', false);
  if (wNum = ListaCodFunc.Count) then
    sCodFuncSel := '';

  // Inicio variáveis
  sAnoMes := RetornaAnoMes(StrToDate(IncData(dtedInicio.Text,0,-1,0)));
  dInicio := StrToDateTime(dtedInicio.Text);
  dFim    := StrToDateTime(dtedFim.Text);

  dtmBaseDados.qry.Close;
  with (dtmBaseDados.qry.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  PJ.RAZAOSOCIAL AS EMPRESA,');
    Add('  PJ.NOME        AS ESTABELECIMENTO,');
    Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO || DECODE(E.COMPLEMENTO,NULL,NULL,'' - '' ||');
    Add('    RTRIM(E.COMPLEMENTO)) ||'' - ''|| RTRIM(E.BAIRRO) ||'' - ''|| RTRIM(CIDADES.NOME) ||'' - CEP:''||');
    Add('    RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS RUA,');
    Add('  E.IDCIDADES,');
    Add('  ES.CODESTADO AS UF,');
    Add('  ES.IDPAIS,');
    Add('  PF.IDPESSOA AS IDFUNCIONARIO,');
    Add('  PF.NOME AS FUNCIONARIO,');
    Add('  F.IDEMPRESA,');
    Add('  F.MATRICULA,');
    Add('  F.DATAREFHORARIO AS DATAREF,');
    Add('  F.CODCENTROCUSTO AS CENTROCUSTO,');
    Add('  CC.NOME          AS NOMECENTROCUSTO,');
    Add('  (NVL(HT.HORASFOLGA1,0)+NVL(HT.HORASSERVICO,0)+NVL(HT.HORASFOLGA2,0)) AS ESCALA,');
    Add('  HT.HORASSERVICO                 AS HORASSERVICO,');
    Add('  (HT.HORASFOLGA1+HT.HORASFOLGA2) AS HORASFOLGA,');
    Add('  HT.FLGTIPOHORARIO               AS TIPOHORARIO,');
    Add('  HT.HORASFOLGA1,');
    Add('  DECODE(PFFERIAS.INIGOZOFERIAS,Null,PFFERIAS.INIGOZOFERIAS, ');
    Add('  GREATEST(PFFERIAS.INIGOZOFERIAS,To_Date('+QuotedStr(DateTimeToStr(dInicio))+',''dd/mm/yyyy''))) AS INICIOFERIAS,');
    Add('  DECODE(PFFERIAS.FIMGOZOFERIAS,Null,PFFERIAS.FIMGOZOFERIAS, ');
    Add('  LEAST(PFFERIAS.FIMGOZOFERIAS,To_Date('+QuotedStr(DateTimeToStr(dFim))+',''dd/mm/yyyy''))) AS FIMFERIAS,');
    Add('  HT.JORNADAMENSAL,');
    Add('  LP.QTDDIARIA,');
    Add('  LT.TIPOLINHATRANSP AS TIPOLINHA,');
    Add('  LT.NUMLINHATRANSP  AS NUMLINHA,');
    Add('  LT.VLRLINHATRANSP  AS VALORLINHA,');
    Add('  TS.IDDIASEMANA AS DIASEMANA,');
    Add('  TD.INICIOEXPEDIENTE,');
    Add('  TD.FINALEXPEDIENTE,');
    Add('  DIASACUMULADOS.CODRUBCLT,');
    Add('  NVL(EXTRA.DIASEXTRAS,0) AS DIASEXTRA,');
    Add('  NVL(DIASACUMULADOS.VALORPROVENTO,0) AS VALOR');
    // ---------------------------------------------------------------------------- //
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, ENDPESS E, FUNCIONARIO F,');
    Add('  ESTADO ES, TURNOSEM TS, TURNODIA TD, HORATRAB HT, LINHATRANSP LT,');
    Add('  LINHAXPESS LP, CIDADES, CENTCUST CC,'+IFF((sCodFuncSel = ''),'  SITFUNC ST,',''));
    // --------------------------------------------------------------------------------- //
    Add('  (SELECT H.IDPESSOA, H.VALORPROVENTO, P.CODRUBCLT');
    Add('   FROM   HISTRUBSAL H, PROVDESC P');
    Add('   WHERE (P.CODRUBCLT LIKE(''00%''))  AND');
    Add('         (H.IDPESSJUR  = ' +IntToStr(Sistema.IDEmpresa)+ ') AND');
    Add('         (H.MES        = ' +QuotedStr(sAnoMes)+ ') AND');
    Add('         (P.IDPROVENTO = H.IDRUBRICA)) DIASACUMULADOS,');
    // --------------------------------------------------------------------------------- //
    Add('  (SELECT FE.IDPESSOA, FE.INIGOZOFERIAS, FE.FIMGOZOFERIAS');
    Add('   FROM   FERIAS FE');
    Add('   WHERE ((FE.INIGOZOFERIAS >= TO_DATE('+QuotedStr(DateToStr(dInicio))+',''DD/MM/YYYY'')) AND');
    Add('          (FE.INIGOZOFERIAS <= TO_DATE('+QuotedStr(DateToStr(dFim))+',''DD/MM/YYYY'')))    OR');
    Add('         ((FE.FIMGOZOFERIAS >= TO_DATE('+QuotedStr(DateToStr(dInicio))+',''DD/MM/YYYY'')) AND');
    Add('          (FE.FIMGOZOFERIAS <= TO_DATE('+QuotedStr(DateToStr(dFim))+',''DD/MM/YYYY''))) ) PFFERIAS,');
    // --------------------------------------------------------------------------------- //
    // DIAS EXTRAS DE TRABALHO NO PERIODO
    Add('  (SELECT IDPESSOA, COUNT(*) AS DIASEXTRAS');
    Add('   FROM   DIAEXTRATRAB');
    Add('   WHERE  DIATRAB BETWEEN TO_DATE('+QuotedStr(DateToStr(dInicio))+',''DD/MM/YYYY'') AND');
    Add('                          TO_DATE('+QuotedStr(DateToStr(dFim))   +',''DD/MM/YYYY'')');
    Add('   GROUP BY IDPESSOA) EXTRA');
    // --------------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (PJ.IDPESSOA = '+qryEstab.FieldByName('IDPESSOA').asString+') AND');

    // Funcionário selecionado
    if (sCodFuncSel <> '') then
    begin
      if (Pos(',',sCodFuncSel) > 0) then
      begin
        Add('  (PF.IDPESSOA IN (' +sCodFuncSel+ ')) AND');
        Add('  (F.IDPESSOA  IN (' +sCodFuncSel+ ')) AND');
      end
      else
      begin
        Add('  (PF.IDPESSOA  = ' +sCodFuncSel+ ') AND');
        Add('  (F.IDPESSOA   = ' +sCodFuncSel+ ') AND');
      end;
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

      sAux := SelecionaSitFunc;
      if (sAux <> '') then
        if (Pos(',',sAux) > 0) then
          Add('  (ST.TIPOSIT     IN (' +sAux+ ')) AND')
        else
          Add('  (ST.TIPOSIT      = ' +sAux+ ') AND');

      sAux := SelecionaTipoContrato;
      if (Pos(',',sAux) > 0) then
        Add('  (F.TIPOCONTRATO IN (' +sAux+ ')) AND')
      else
        Add('  (F.TIPOCONTRATO  = ' +sAux+ ') AND');
    end;

    if (chkbFerias.Checked) then
    begin
      Add('  ((PFFERIAS.INIGOZOFERIAS IS NULL) OR');
      Add('   (PFFERIAS.INIGOZOFERIAS > TO_DATE('+QuotedStr(DateTimeToStr(dInicio))+',''DD/MM/YYYY'')) OR');
      Add('   (PFFERIAS.FIMGOZOFERIAS IS NULL) OR');
      Add('   (PFFERIAS.FIMGOZOFERIAS < TO_DATE('+QuotedStr(DateTimeToStr(dFim))   +',''DD/MM/YYYY''))) AND');
    end;

    Add('  (PJ.IDPESSOA       = F.IDESTAB) AND');

    if (sCodFuncSel = '') then
      Add('  (ST.IDSITFUNC      = F.IDSITFUNC) AND');

    Add('  (F.IDPESSOA        = PF.IDPESSOA) AND');
    Add('  (F.IDHORARIO       = HT.IDHORARIO) AND');
    Add('  (F.CODCENTROCUSTO  = CC.CODCENTROCUSTO) AND');
    Add('  (F.IDEMPRESA       = CC.IDEMPRESA) AND');
    Add('  (F.IDPESSOA        = LP.IDPESSOA) AND');
    Add('  (LP.IDLINHATRANSP  = LT.IDLINHATRANSP) AND');
    Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO) AND');
    Add('  (PJ.IDPESSOA       = E.IDPESSOA) AND');
    Add('  (E.IDCIDADES       = CIDADES.IDCIDADES) AND');
    Add('  (CIDADES.IDESTADO  = ES.IDESTADO) AND');
    Add('  (TS.IDTURNODIARIO  = TD.IDTURNODIARIO(+)) AND');
    Add('  (HT.IDHORARIO      = TS.IDHORARIO(+)) AND');
    Add('  (PF.IDPESSOA       = DIASACUMULADOS.IDPESSOA(+)) AND');
    Add('  (PF.IDPESSOA       = PFFERIAS.IDPESSOA(+)) AND');
    Add('  (PF.IDPESSOA       = EXTRA.IDPESSOA(+))');
    Add('ORDER BY');
    case (cmbOrderBy.ItemIndex) of
      0 : Add('   EMPRESA, FUNCIONARIO, TIPOLINHA,   NUMLINHA');
      1 : Add('   EMPRESA, CENTROCUSTO, FUNCIONARIO, TIPOLINHA, NUMLINHA');
      2 : Add('   EMPRESA, CENTROCUSTO, MATRICULA,   TIPOLINHA, NUMLINHA');
      3 : Add('   EMPRESA, MATRICULA,   TIPOLINHA,   NUMLINHA');
    end;
    //SaveToFile ('c:\qry.txt');
    SaveToFile (Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;

  // Verifico se é preciso gravar a rubrica
  if (chkbxGravaRub.Checked) then
    dtmFolha.qryValeTransporte.Open;

  // Monta Query Principal
  with (dtmRelatorios1) do
  begin
    frmAguarde.Mostra('Relação de Transportes (Em Colunas)');
    frmAguarde.Pos := 0;

    // Aponto o UpdateSQL para a query principal
    qryRTransporte.UpdateObject := updSQL;

    dtmBaseDados.qry.Open;
    if not(qryRTransporte.IsEmpty) then
      qryRTransporte.CancelUpdates;
    qryRTransporte.Close;
    qryRTransporte.Open;

    // Processa dados para a geração da query
    dtmBaseDados.qry.Open;
    GravaDadosQuery;
    qryRTransporte.First;

    // Especifico Configurações do Relatório
    rpRTransporte.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
  end;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------
procedure TfrmRRelTrans.GravaDadosQuery;
var
  wNumFunc: word;
  byPos: byte;
  rValorTotalFunc: real;
begin
  with (dtmRelatorios1.qryRTransporte) do
  begin
    if not(dtmBaseDados.qry.IsEmpty) then
    begin
      frmAguarde.Min := 0;
      frmAguarde.Max := dtmBaseDados.qry.RecordCount;

      dtmRelatorios1.dNormalIni := StrToDateTime(dtedInicio.Text);
      dtmRelatorios1.dNormalFim := StrToDateTime(dtedFim.Text);
      rQtdeTotal  := 0;
      rValorTotal := 0;

      // Calculo o Número de Funcionários
      wNumFunc := 0;
      if (rgImprimeNumFunc.ItemIndex = 0) then
        while not(dtmBaseDados.qry.EOF) do
        begin
          sMatricula := dtmBaseDados.qry.FieldByName('MATRICULA').asString;
          CalcularDiasTrabalhados;

          if (iDiaTrabalhado > 0) then
            Inc (wNumFunc);

          while (sMatricula = dtmBaseDados.qry.FieldByName('MATRICULA').asString) and
                not(dtmBaseDados.qry.EOF) do
            dtmBaseDados.qry.Next;
        end;

      // Processa dados para a geração da query
      dtmBaseDados.qry.First;
      while not(dtmBaseDados.qry.EOF) do
      begin
        rValorTotalFunc := 0;
        sMatricula      := dtmBaseDados.qry.FieldByName('MATRICULA').asString;
        iIDFuncionario  := dtmBaseDados.qry.FieldByName('IDFUNCIONARIO').asInteger;
        iIDEmpresa      := dtmBaseDados.qry.FieldByName('IDEMPRESA').asInteger;
        CalcularDiasTrabalhados;
        if (iDiaTrabalhado > 0) then
        begin
          repeat
            // Atribui Valores à Query
            Insert;
            FieldByName('FUNCIONARIO').asString       := dtmBaseDados.qry.FieldByName('FUNCIONARIO').asString;
            FieldByName('EMPRESA').asString           := dtmBaseDados.qry.FieldByName('EMPRESA').asString;
            FieldByName('ESTABELECIMENTO').asString   := dtmBaseDados.qry.FieldByName('ESTABELECIMENTO').asString;
            FieldByName('UF').asString                := dtmBaseDados.qry.FieldByName('UF').asString;
            FieldByName('MATRICULA').asString         := dtmBaseDados.qry.FieldByName('MATRICULA').asString;
            FieldByName('CENTROCUSTO').asString       := dtmBaseDados.qry.FieldByName('CENTROCUSTO').asString;
            FieldByName('NOMECENTROCUSTO').asString   := dtmBaseDados.qry.FieldByName('NOMECENTROCUSTO').asString;
            FieldByName('NUM_FUNC').asInteger         := wNumFunc;

            // Calculo cada linha de transporte
            byPos      := 1;
            sNumLinha  := dtmBaseDados.qry.FieldByName('NUMLINHA').AsString;
            sTipoLinha := dtmBaseDados.qry.FieldByName('TIPOLINHA').AsString;
            while (sMatricula = dtmBaseDados.qry.FieldByName('MATRICULA').AsString) and
                  not(dtmBaseDados.qry.EOF) do
            begin
              CalcularValorLinha;
              FieldByName('NUMLINHA'+IntToStr(byPos)).asString  := dtmBaseDados.qry.FieldByName('NUMLINHA').asString;
              FieldByName('QTDE_LINHA'+IntToStr(byPos)).asFloat := rQtdeLinhas;
              FieldByName('VAL_LINHA'+IntToStr(byPos)).asFloat  := dtmBaseDados.qry.FieldByName('VALORLINHA').asFloat;

              rValorTotalFunc := rValorTotalFunc + (dtmBaseDados.qry.FieldByName('VALORLINHA').asFloat * rQtdeLinhas);
              // Somo a quantidade de vales da linha do funcionário a Quantidade Total
              rQtdeTotal := rQtdeTotal + rQtdeLinhas;

              while (sMatricula = dtmBaseDados.qry.FieldByName('MATRICULA').AsString) and
                    (sNumLinha  = dtmBaseDados.qry.FieldByName('NUMLINHA').AsString)  and
                    (sTipoLinha = dtmBaseDados.qry.FieldByName('TIPOLINHA').AsString) and
                    not(dtmBaseDados.qry.EOF) do
              begin
                frmAguarde.Pos := frmAguarde.Pos+1;
                dtmBaseDados.qry.Next;
              end;
              Inc(byPos);
            end;

            FieldByName('VAL_TOT_FUNC').asFloat  := rValorTotalFunc;

            // Somo o valor total da(s) linha(s) do funcionário ao Valor Total
            rValorTotal := rValorTotal + rValorTotalFunc;
            // Calculo ovalor total da(s) linha(s) do funcionário
            rValorTotLinha := rValorTotLinha + rValorTotalFunc;

            if (dtmBaseDados.qry.EOF) then
              FieldByName('QTDE_TOT_FUNC').asFloat := rQtdeTotal;

            // Gravo registro
            Post;
          until (sMatricula <> dtmBaseDados.qry.FieldByName('MATRICULA').asString) or
                (dtmBaseDados.qry.EOF);
          GravarLinha;
        end
        else
        begin
          while (sMatricula = dtmBaseDados.qry.FieldByName('MATRICULA').AsString) and
                not(dtmBaseDados.qry.EOF) do
          begin
            frmAguarde.Pos := frmAguarde.Pos+1;
            dtmBaseDados.qry.Next;
          end;  
        end;
      end;
    end
    else
    begin
      ModalResult := mrNone;
      frmAguarde.Apaga;
      MsgDlg('Não há dados a serem exibidos! Verifique.','Aviso',mtInformation,[mbOk,mbHelp],0);
    end;
  end;
end;

procedure TfrmRRelTrans.CalcularDiasTrabalhados;
var
  iPosicao, iContador: integer;
begin
  // Inteiras
  iTotDiasDesc     := 0;
  iPrimeiraDif     := 0; iSegundaDif    := 0; iTipoFerias  := 0;
  iDiaSemanaInicio := 0; iDiaTrabalhado := 0; iDiaMes   := 0; iTipoHorario := 0;
  iDiasFerias      := 0; iADom          := 0; iASeg     := 0; iATer        := 0;
  iAQua            := 0; iAQui          := 0; iASex     := 0; iASab        := 0;
  // Reais
  rRazao    := 0; rRestoDivisao := 0; rHora1         := 0; rHora2 := 0;
  rTotHoras := 0; rResto        := 0; rValorTotLinha := 0;
  // String
  sNumLinha := ''; sTipoLinha := ''; sCodRubClt := '';
  // Datas
  dInicioFerias := 0; dFimFerias := 0; dNormalIni2 := 0; dNormalFim2 := 0;

  with (dtmRelatorios1) do
  begin
    sMatricula    := dtmBaseDados.qry.FieldByName('MATRICULA').asString;
    dInicioFerias := dtmBaseDados.qry.FieldByName('INICIOFERIAS').asDateTime;
    dFimFerias    := dtmBaseDados.qry.FieldByName('FIMFERIAS').asDateTime;
    dNormalIni2   := dtmRelatorios1.dNormalIni;
    dNormalFim2   := dtmRelatorios1.dNormalFim;

    // Incializa variáveis gerais
    iDom:=0; iSeg:=0; iTer:=0; iQua:=0; iQui:=0; iSex:=0; iSab:=0;
    iTotDiasMes := Round(dtmRelatorios1.dNormalFim - dtmRelatorios1.dNormalIni);
    dDataInicio := dtmRelatorios1.dNormalIni;
    bmRegistro  := dtmBaseDados.qry.GetBookMark;

    // Testa se Casos de Férias
    // Verifica se Férias está no Intervalo escolhido pelo Usuário no Form de Parâmetros
    // As férias têm que terminar, também, antes da Data de Início de Processamento
    if (dInicioFerias = 0) or (dFimFerias = 0) or
       (dInicioFerias = StrToDateTime('31/12/1899')) or
       (dFimFerias = StrToDateTime('31/12/1899')) or
       (dFimFerias < dtmRelatorios1.dNormalIni) then
    begin // Se não for Período de Férias
      // Diferenças
      iPrimeiraDif := Round((dNormalIni2 - dtmBaseDados.qry.FieldByName('DATAREF').asDateTime)+1);
      iSegundaDif  := Round((dNormalFim2 - dtmBaseDados.qry.FieldByName('DATAREF').asDateTime)+1);
      iDiaMes      := Round((dNormalFim2 - dNormalIni2));
      // Pega Dia da Semana da Data de Contratação do Funcionário
      iDiaSemanaInicio := DayOfWeek(dtmBaseDados.qry.FieldByName('DATAREF').AsDateTime);
      iTipoHorario     := dtmBaseDados.qry.FieldByName('TIPOHORARIO').AsInteger;
      if (chkbFeriados.Checked) then
      begin
        if (spedQuantDias.Value > 0) then
          iSeg := spedQuantDias.Value
        else
          for iContador:=0 to iTotDiasMes do
          begin
            if not(DiasUteis.Feriado(dDataInicio+iContador,
                  dtmBaseDados.qry.FieldByName('IDCIDADES').asInteger,
                  dtmBaseDados.qry.FieldByName('IDPAIS').asInteger,
                  dtmBaseDados.qry.FieldByName('UF').asString, false,true)) then
              case DayOfWeek(dDataInicio + iContador) of
                1 : Inc(iDom);
                2 : Inc(iSeg);
                3 : Inc(iTer);
                4 : Inc(iQua);
                5 : Inc(iQui);
                6 : Inc(iSex);
                7 : Inc(iSab);
              end;
          end;
      end
      else
      begin
        if (spedQuantDias.Value > 0) then
          iSeg := spedQuantDias.Value
        else
          for iContador:=0 to iTotDiasMes do
            case DayOfWeek(dDataInicio + iContador) of
              1 : Inc(iDom);
              2 : Inc(iSeg);
              3 : Inc(iTer);
              4 : Inc(iQua);
              5 : Inc(iQui);
              6 : Inc(iSex);
              7 : Inc(iSab);
            end;
      end;
    end
    else // Se for Período de Férias
    begin
      if (spedQuantDias.Value > 0) then
         iSeg := spedQuantDias.Value
      else
        for iContador:=0 to iTotDiasMes do
          case DayOfWeek(dDataInicio + iContador) of
            1 : Inc(iDom);
            2 : Inc(iSeg);
            3 : Inc(iTer);
            4 : Inc(iQua);
            5 : Inc(iQui);
            6 : Inc(iSex);
            7 : Inc(iSab);
          end;

      // Testa Tipos de Férias
      if (chkbFerias.Checked) then
      begin
        // Se o Período de Férias estiver no Intervalo do Mês ( >= dNormalIni e <= dNormalFim )
        // Caso 1 e 4
        if (dInicioFerias >= dNormalIni2) and (dFimFerias <= dNormalFim2) then
          iTipoFerias := 1;
        // Caso 2
        if (dInicioFerias < dNormalIni2)  and (dFimFerias <= dNormalFim2) then
          iTipoFerias := 2;
        // Caso 3
        if (dInicioFerias >= dNormalIni2) and (dFimFerias > dNormalFim2) then
          iTipoFerias := 3;

        // Calcula o Número de Dias de Férias, se FOR ESCALA.
        // Caso 1 e 4
        if (iTipoFerias = 1) then
        begin
          // Quantidade de Dias da Semana em que o indivíduo ficou de Férias
          if (dtmBaseDados.qry.FieldByName('ESCALA').asFloat > 0) then // Se for ESCALA
          else // Se NÃO for escala
          begin
            // Pego todos os feriados no período
            if (chkbFeriados.Checked) then
            begin
              if (spedQuantDias.Value > 0) then
                 iSeg := spedQuantDias.Value
              else
                for iContador:=0 to iTotDiasMes do
                begin
                  if (DiasUteis.Feriado(dDataInicio+iContador,
                      dtmBaseDados.qry.FieldByName('IDCIDADES').asInteger,
                      dtmBaseDados.qry.FieldByName('IDPAIS').asInteger,
                      dtmBaseDados.qry.FieldByName('UF').asString, false,true)) and
                      not(((dDataInicio+iContador) >= dtmBaseDados.qry.FieldByName('INICIOFERIAS').asDateTime) and
                          ((dDataInicio+iContador) <= dtmBaseDados.qry.FieldByName('FIMFERIAS').asDateTime)) then
                    case DayOfWeek(dDataInicio + iContador) of
                      1 : Inc(iADom);
                      2 : Inc(iASeg);
                      3 : Inc(iATer);
                      4 : Inc(iAQua);
                      5 : Inc(iAQui);
                      6 : Inc(iASex);
                      7 : Inc(iASab);
                    end;
                end;
            end;
{            else
            begin
              if (spedQuantDias.Value > 0) then
                iSeg := spedQuantDias.Value
              else
                for iContador:=0 to iTotDiasMes do
                  case DayOfWeek(dDataInicio + iContador) of
                    1 : Inc(iADom);
                    2 : Inc(iASeg);
                    3 : Inc(iATer);
                    4 : Inc(iAQua);
                    5 : Inc(iAQui);
                    6 : Inc(iASex);
                    7 : Inc(iASab);
                  end;
            end;}

            // E Somo-os aos dias de férias
            while (dInicioFerias <= dFimFerias) do
            begin
              case (DayOfWeek(dInicioFerias)) of
                1 : Inc(iADom);
                2 : Inc(iASeg);
                3 : Inc(iATer);
                4 : Inc(iAQua);
                5 : Inc(iAQui);
                6 : Inc(iASex);
                7 : Inc(iASab);
              end;
              dInicioFerias := dInicioFerias + 1;
            end;
          end;
          dInicioFerias := dtmBaseDados.qry.FieldByName('INICIOFERIAS').AsDateTime;
        end;
        // Caso 2
        // Se as Férias Terminarem antes do último dia do mês
        if (iTipoFerias = 2) then
        begin
          iDiasFerias := Round(dFimFerias - dNormalIni2) + 1;
          dNormalIni2 := dFimFerias+1;
        end;
        // Caso 3
        // Se as Férias começarem antes do final do Mês
        if (iTipoFerias = 3) then
        begin
          iDiasFerias := Round(dInicioFerias - dNormalIni2) + 1;
          dNormalFim2 := dInicioFerias-1;
        end;
      end;
      // --------------------------------------------------------------------------------- //
      // Diferenças
      iPrimeiraDif     := Round((dNormalIni2 - dtmBaseDados.qry.FieldByName('DATAREF').AsDateTime)+1);
      iSegundaDif      := Round((dNormalFim2 - dtmBaseDados.qry.FieldByName('DATAREF').AsDateTime)+1);
      iDiaMes          := Round((dNormalFim2 - dNormalIni2));
      // Pega Dia da Semana da Data de Contratação do Funcionário
      iDiaSemanaInicio := DayOfWeek(dtmBaseDados.qry.FieldByName('DATAREF').AsDateTime);
      iTipoHorario     := dtmBaseDados.qry.FieldByName('TIPOHORARIO').AsInteger;
      // --------------------------------------------------------------------------------- //
    end;

    // Se for por Escala
    if (dtmBaseDados.qry.FieldByName('ESCALA').asInteger > 1) then
    begin
      // ESCALA VARIÁVEL
      if (iTipoHorario = 1) then
      begin
        if (frmPrincipal.iIDContraCheque = 2) then   // Só para a REFER
          iDiaTrabalhado := iDiaMes + 1 // Só para a REFER
        else
        begin
          for iContador:=0 to iDiaMes do
          begin
            // Por que ?!?!?!? Pergunte ao Eugênio : FrmRegHoras
            if (iContador = 0) then
            begin
              rTotHoras := dtmBaseDados.qry.FieldByName('ESCALA').Value;
              rHora1    := ((dNormalIni2 -
                             dtmBaseDados.qry.FieldByName('DATAREF').Value)*24 mod rTotHoras)+
                             dtmBaseDados.qry.FieldByName('HORASFOLGA1').Value;

              if (rHora1 >= 24) and
                 (rTotHoras - rHora1 < dtmBaseDados.qry.FieldByName('HORASSERVICO').Value) then
                rResto := dtmBaseDados.qry.FieldByName('HORASSERVICO').Value + rHora1 - rTotHoras;
            end; // Se Contador = 0

            if (rResto > 0) then
            begin
              rHora2 := rResto;
              rHora1 := 0;
            end
            else
            if (rResto = 0) then
            begin
              rHora1 := rHora2 + dtmBaseDados.qry.FieldByName('HORASFOLGA').Value;
              if (rHora1 > 24) then
                rHora1 := rHora1 - 24;
            end;

            if (rHora1 < 24) then
            begin
              if (rResto <= 0) then
              begin
                rHora2         := rHora1 + dtmBaseDados.qry.FieldByName('HORASSERVICO').Value;
                iDiaTrabalhado := iDiaTrabalhado + 1;
              end;
              if (rHora2 > 24) then
              begin
                rResto := rHora2 - 24;
                rHora2 := 24;
              end
              else
                rResto := 0;

              rHora1 := 0;
            end
            else
            begin
              rHora1 := rHora1 - 24;
              rResto := -1;
            end;
          end; // FOR
        end;
        // Testa se tem Férias do iTipoFerias ESPECIAL
        if (iTipoFerias = 1) then
          iDiaTrabalhado := Round(((((iDiaMes+1)-((dFimFerias-dInicioFerias)+1))*iDiaTrabalhado)/(iDiaMes+1)));

      end   // Se for ESCALA VARIÁVEL
      else
      begin // Se for ESCALA FIXA
        // Calcula a RAZÃO
        // RAZAO := Horas de Folga / 24; Se RAZAO < Round(RAZAO) então RAZAO := ROUND(Razao) - 1;
        rRazao := dtmBaseDados.qry.FieldByName('HORASFOLGA').AsInteger / 24;
        if (rRazao < Round(rRazao)) then
          rRazao := Round(rRazao) - 1;
        rRazao := rRazao + 1;

        // Faz Variação para Contagem de Dias Trabalhados
        for iContador:=iPrimeiraDif to iSegundaDif do
        begin
          // Pega o Resto da Divisão
          rRestoDivisao := (Round((dtmBaseDados.qry.FieldByName('DATAREF').asDateTime +
                                   iContador)-(dNormalIni2)) mod Round(rRazao));
          // Testa se o dia SERÁ ou NÃO trabalhado
          if (rRestoDivisao = 0) then
            iDiaTrabalhado := iDiaTrabalhado + 1;
        end; // FOR
      end; // Se for ESCALA FIXA
    end   // Se for Escala
    else
    begin // Se for NORMAL
      // Marca o Registro da Query para posterior Retorno
      iDiaTrabalhado := 0;
      sNumLinha      := dtmBaseDados.qry.FieldByName('NUMLINHA').asString;
      // Se não tiver período de Férias
      if (iTipoFerias = 0) then
      begin
        while (sMatricula = dtmBaseDados.qry.FieldByName('MATRICULA').asString) and
              (sNumLinha  = dtmBaseDados.qry.FieldByName('NUMLINHA').asString) and
              not(dtmBaseDados.qry.EOF) do
        begin
          // Contabiliza os Dias Trabalhados
          case (dtmBaseDados.qry.FieldByName('DIASEMANA').asInteger) of
            1 : iDiaTrabalhado := iDiaTrabalhado + iDom;
            2 : iDiaTrabalhado := iDiaTrabalhado + iSeg;
            3 : iDiaTrabalhado := iDiaTrabalhado + iTer;
            4 : iDiaTrabalhado := iDiaTrabalhado + iQua;
            5 : iDiaTrabalhado := iDiaTrabalhado + iQui;
            6 : iDiaTrabalhado := iDiaTrabalhado + iSex;
            7 : iDiaTrabalhado := iDiaTrabalhado + iSab;
          end;
          dtmBaseDados.qry.Next;
        end;
      end
      // Se estiver em período de Férias
      else
      begin
        // Loop para Calcular um Período Quebrado do Mês (não inteiro) Ex.: 18/03/99 a 31/03/99
        while (sMatricula = dtmBaseDados.qry.FieldByName('MATRICULA').asString) and
              (sNumLinha  = dtmBaseDados.qry.FieldByName('NUMLINHA').asString) and
              not(dtmBaseDados.qry.EOF) do
        begin
          // Contabiliza os Dias Trabalhados - Dias de Férias
          case (dtmBaseDados.qry.FieldByName('DIASEMANA').asInteger) of
            1 : iDiaTrabalhado := (iDiaTrabalhado + iDom) - iADom;
            2 : iDiaTrabalhado := (iDiaTrabalhado + iSeg) - iASeg;
            3 : iDiaTrabalhado := (iDiaTrabalhado + iTer) - iATer;
            4 : iDiaTrabalhado := (iDiaTrabalhado + iQua) - iAQua;
            5 : iDiaTrabalhado := (iDiaTrabalhado + iQui) - iAQui;
            6 : iDiaTrabalhado := (iDiaTrabalhado + iSex) - iASex;
            7 : iDiaTrabalhado := (iDiaTrabalhado + iSab) - iASab;
          end;
          dtmBaseDados.qry.Next;
        end;
      end;
    end;

    // Faz os descontos dos dias de faltas e/ou afastamentos
    dtmBaseDados.qry.GoToBookMark (bmRegistro);
    ListaCodRubrica.Clear;
    sCodRubClt := dtmBaseDados.qry.FieldByName('CODRUBCLT').asString;
    while (sMatricula = dtmBaseDados.qry.FieldByName('MATRICULA').asString) and
          (not dtmBaseDados.qry.EOF) and
          (chkbFaltas.Checked) do
    begin
      if (dtmBaseDados.qry.FieldByName('CODRUBCLT').asString <> '') and
         not(ListaCodRubrica.Find(sCodRubClt, iPosicao)) then
      begin
        // Total de Dias de Faltas Abonadas
        if (sCodRubClt = '00006') then
        begin
          ListaCodRubrica.Add (sCodRubClt);
          iTotDiasDesc := iTotDiasDesc - dtmBaseDados.qry.FieldByName('VALOR').AsInteger;
        end
        else
        if (sCodRubClt = '00001') or // Total de Dias de Faltas
           (sCodRubClt = '00024') or // Total de Dias de Afastamento por Doença
           (sCodRubClt = '00034') or // Total de Dias de Suspensão
           (sCodRubClt = '00039') or // Total de Dias de Afastamento pelo INSS por Doença
           (sCodRubClt = '00041') or // Total de Dias de Licença Remunerada
           (sCodRubClt = '00043') or // Total de Dias de Licença Não Remunerada
           (sCodRubClt = '00570') or // Total de Dias de Afastamento Maternidade
           (sCodRubClt = '00571') or // Total de Dias de Afastamento Paternidade
           (sCodRubClt = '00574') or // Total de Dias de Afastamento por Natmorte
           (sCodRubClt = '00696') or // Total de Dias de Afastamento Militar
           (sCodRubClt = '00697') then // Total de Dias de Afastamento pelo INSS (Acidente de Trabalho)
        begin
          ListaCodRubrica.Add (sCodRubClt);
          iTotDiasDesc := iTotDiasDesc + dtmBaseDados.qry.FieldByName('VALOR').AsInteger;
        end;
      end;
      sCodRubClt := dtmBaseDados.qry.FieldByName('CODRUBCLT').AsString;
      dtmBaseDados.qry.Next;
    end;

    // Dias Trabalhados - (Afastamentos, Faltas, etc.)
    iDiaTrabalhado := iDiaTrabalhado - iTotDiasDesc;

    if (iDiaTrabalhado < spedDias.Value) then
      iDiaTrabalhado := 0;

    dtmBaseDados.qry.GoToBookMark (bmRegistro);
    dtmBaseDados.qry.FreeBookMark (bmRegistro);
  end;
end;

procedure TfrmRRelTrans.CalcularValorLinha;
begin
  with (dtmRelatorios1) do
  begin
    sNumLinha  := dtmBaseDados.qry.FieldByName('NUMLINHA').asString;
    sTipoLinha := dtmBaseDados.qry.FieldByName('TIPOLINHA').asString;

    // Calculo Valores
    rQtdeLinhas := Round(iDiaTrabalhado * dtmBaseDados.qry.FieldByName('QTDDIARIA').asFloat)+
                   Round(dtmBaseDados.qry.FieldByName('DIASEXTRA').asInteger *
                         dtmBaseDados.qry.FieldByName('QTDDIARIA').asFloat);
    fValorLinha := rQtdeLinhas * dtmBaseDados.qry.FieldByName('VALORLINHA').asFloat;
  end;
end;

// Gravação na RUBRICAINDIV
procedure TfrmRRelTrans.GravarLinha;
begin
  if (chkbxGravaRub.Checked) and (iIdRubrica > 0) then
  begin
    with (dtmRelatorios1) do
    begin
      // Pega o Maior ID de RUBRICAINDIV somando 1
      ProxSeqRub := ProxRubricaIndiv(iIDFuncionario,iIdRubrica);
      if VerificaIDRubricaIndiv(iIDFuncionario,iIdRubrica,RetornaAnoMes(StrToDate(dtedFim.Text))) then
      begin
        // Insere Valores na Query
        dtmFolha.qryValeTransporte.Insert;
        dtmFolha.qryValeTransporte.FieldByName('SEQRUBRICAINDIV').asInteger := ProxSeqRub+1;
        dtmFolha.qryValeTransporte.FieldByName('IDRUBRICA').asInteger       := iIdRubrica;
        dtmFolha.qryValeTransporte.FieldByName('IDPESSOA').asInteger        := iIDFuncionario;
        dtmFolha.qryValeTransporte.FieldByName('IDEMPRESA').asInteger       := iIDEmpresa;
        dtmFolha.qryValeTransporte.FieldByName('NUMOCORRENCIAS').asInteger  := 0;
        if (iIdRegra > 0) then
          dtmFolha.qryValeTransporte.FieldByName('IDREGRACALCULO').asInteger := iIdRegra;
        dtmFolha.qryValeTransporte.FieldByName('VALORRUBRICA').asFloat    := rValorTotLinha;
        dtmFolha.qryValeTransporte.FieldByName('ANOMESINICIO').asString   := RetornaAnoMes(StrToDate(dtedFim.Text));
        dtmFolha.qryValeTransporte.FieldByName('FLGPERMANENTE').asInteger := 0;
        dtmFolha.qryValeTransporte.FieldByName('PARCELAS').asInteger      := 1;
        dtmFolha.qryValeTransporte.FieldByName('FLGTPRUBMANUT').asString  := '2';
        try
          dtmFolha.qryValeTransporte.Post;
          // Realiza a Gravação Física na Tabela RUBRICAINDIV
          dtmFolha.qryValeTransporte.ApplyUpdates;
          dtmFolha.qryValeTransporte.CommitUpdates;
        except
          dtmFolha.qryValeTransporte.Cancel;
          dtmFolha.qryValeTransporte.CancelUpdates;
        end;
      end
      else
      begin
        // Atualiza Valores na Query
        wOldDecimal      := DecimalSeparator;
        DecimalSeparator := '.';
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add('UPDATE RUBRICAINDIV SET VALORRUBRICA = '+FloatToStr(rValorTotLinha)+', ');
        if (iIdRegra > 0) then
          qryAux.SQL.Add('IDREGRACALCULO = '+IntToStr(iIdRegra))
        else
          qryAux.SQL.Add('IDREGRACALCULO = NULL ');
        qryAux.SQL.Add(' WHERE IDPESSOA        = '  +IntToStr(iIDFuncionario)+' AND '+
                       '       IDEMPRESA       = '  +IntToStr(iIDEmpresa)+' AND '+
                       '       IDRUBRICA       = '  +IntToStr(iIdRubrica)+' AND '+
                       '       NUMOCORRENCIAS  = '  +IntToStr(0)         +' AND '+
                       '       ANOMESINICIO    = '  +QuotedStr(RetornaAnoMes(StrToDate(dtedFim.Text)))+' AND '+
                       '       FLGPERMANENTE   = '  +IntToStr(0)         +' AND '+
                       '       SEQRUBRICAINDIV = '  +IntToStr(ProxSeqRub)+' AND '+
                       'FLGTPRUBMANUT          = ''2''');
        // Realiza a Gravação Física na Tabela RUBRICAINDIV
        qryAux.ExecSQL;
        DecimalSeparator := wOldDecimal[1];
        qryAux.Close;
      end;
    end;
  end;
end;

procedure TfrmRRelTrans.LeAlteracoes;
var
  LiEstabelec: string;
begin
  // Recupera as últimas alterações das opções
  //ArqConfig := TIniFile.Create('C:\CONFIG_FOLHAPAGTO.INI');
  ArqConfig := TIniFile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CONFIG_FOLHAPAGTO.INI');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332

  spedDias.Text      := ArqConfig.ReadString ('REL_TRANSCOLUNA', 'DiasMin' , '1');
  spedQuantDias.Text := ArqConfig.ReadString ('REL_TRANSCOLUNA', 'QtdeDias', '0');

  chkbFerias.Checked   := (ArqConfig.ReadString ('REL_TRANSCOLUNA', 'DescFerias'  , 'V') = 'V');
  chkbFaltas.Checked   := (ArqConfig.ReadString ('REL_TRANSCOLUNA', 'DescFaltas'  , 'V') = 'V');
  chkbFeriados.Checked := (ArqConfig.ReadString ('REL_TRANSCOLUNA', 'DescFeriados', 'V') = 'V');

  rgImprimeNumFunc.ItemIndex := StrToInt(ArqConfig.ReadString('REL_TRANSCOLUNA','ImprimeNumFunc','1'));
  cmbOrderBy.ItemIndex       := StrToInt(ArqConfig.ReadString('REL_TRANSCOLUNA','OrdemRel',      '0'));

  LiEstabelec := ArqConfig.ReadString ('REL_TRANSCOLUNA', 'Estabelec', '');
  if (LiEstabelec = '') then
  begin
    qryEstab.First;
    LiEstabelec := qryEstab.FieldByName('IDPESSOA').asString;
  end;
  dblkcbEstab.LookUpValue := LiEstabelec;
  dblkcbEstab.UpDate;
end;

procedure TfrmRRelTrans.GravaAlteracoes;
var
  sGravaPadrao: string;
begin
  ArqConfig.WriteString ('REL_TRANSCOLUNA', 'DiasMin' , spedDias.Text);
  ArqConfig.WriteString ('REL_TRANSCOLUNA', 'QtdeDias', spedQuantDias.Text);

  sGravaPadrao := IFF(chkbFerias.Checked,'V','F');
  ArqConfig.WriteString ('REL_TRANSCOLUNA', 'DescFerias', sGravaPadrao);

  sGravaPadrao := IFF(chkbFaltas.Checked,'V','F');
  ArqConfig.WriteString ('REL_TRANSCOLUNA', 'DescFaltas', sGravaPadrao);

  sGravaPadrao := IFF(chkbFeriados.Checked,'V','F');
  ArqConfig.WriteString ('REL_TRANSCOLUNA', 'DescFeriados', sGravaPadrao);

  sGravaPadrao := IntToStr(cmbOrderBy.ItemIndex);
  ArqConfig.WriteString ('REL_TRANSCOLUNA', 'OrdemRel', sGravaPadrao);

  sGravaPadrao := IntToStr(rgImprimeNumFunc.ItemIndex);
  ArqConfig.WriteString ('REL_TRANSCOLUNA', 'ImprimeNumFunc', sGravaPadrao);

  if (Trim(dblkcbEstab.Text) <> '') then
    ArqConfig.WriteString ('REL_TRANSCOLUNA', 'Estabelec', qryEstab.FieldByName('IDPESSOA').asString);
end;

procedure TfrmRRelTrans.HabilitaBtOk;
begin
  bbtnConfirmar.Enabled := (Trim(dblkcbEstab.Text) <> '') and
    (Trim(dtedInicio.Text) <> '') and (Trim(dtedFim.Text) <> '');
end;

procedure TfrmRRelTrans.MontaListaFuncionarios;
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
      Add('  PESSOA PF, FUNCIONARIO F, LINHATRANSP LT, LINHAXPESS LP, SITFUNC ST');
      Add('WHERE');
      Add('  (F.IDESTAB         = ' +qryEstab.FieldByName('IDPESSOA').asString+ ') AND');

      sAux := SelecionaSitFunc;
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

      sAux := SelecionaTipoContrato;
      if (Pos(',',sAux) > 0) then
        Add('  (F.TIPOCONTRATO    IN (' +sAux+ ')) AND')
      else
        Add('  (F.TIPOCONTRATO     = ' +sAux+ ') AND');

      Add('  (ST.IDSITFUNC      = F.IDSITFUNC) AND');
      Add('  (F.IDPESSOA        = PF.IDPESSOA) AND');
      Add('  (F.IDPESSOA        = LP.IDPESSOA) AND');
      Add('  (LP.IDLINHATRANSP  = LT.IDLINHATRANSP)');
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
  end;
  HabilitaBtOk;
end;

function TfrmRRelTrans.SelecionaSitFunc: string;
begin
  sAux := '';
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

function TfrmRRelTrans.SelecionaTipoContrato: string;
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

end.
