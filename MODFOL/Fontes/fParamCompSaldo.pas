// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamCompSaldo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, Spin,
  DBTables, Wwquery, wwdblook, checklst, ComCtrls, wwdbdatetimepicker, fSairAjuda,
  CMDateTimePicker;

type
  TfrmParamCompSaldo = class(TfrmSairAjuda)
    gbxEstab: TGroupBox;
    dblkcbEstab: TwwDBLookupCombo;
    qryEstab: TwwQuery;
    gbxAnoMesRef: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtedInicio: TCMDateTimePicker;
    dtedFim: TCMDateTimePicker;
    gbxOrdem: TGroupBox;
    cmbOrderBy: TComboBox;
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
    gbxRubBase: TGroupBox;
    dblkcbRubBase: TwwDBLookupCombo;
    gbxRubReportada: TGroupBox;
    qryRubBase: TwwQuery;
    qryRubReportada: TwwQuery;
    dblkcbRubReportada: TwwDBLookupCombo;
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
    cbxDemitidos: TCheckBox;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblkcbEstabChange(Sender: TObject);
    procedure chklstFuncDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure dblkcbRubBaseChange(Sender: TObject);
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
    procedure HabilitaBtOk;
    function  VerificaOpcoesOk: boolean;    
    procedure MontaListaFuncionarios;
    function  SelecionaTipoContrato: string;
    function  SelecionaSitFunc: string;
  end;

var
  frmParamCompSaldo: TfrmParamCompSaldo;

implementation

uses uSistema, uMensErro, uDataBase, fAguarde, dBaseDados,
  uFuncoesUteisRH, UsoGeralRH, uComumRelats, dFolha, dRelatorios2;

{$R *.DFM}

procedure TfrmParamCompSaldo.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  if not(Assigned(ListaCodFunc)) then
    ListaCodFunc := TStringList.Create;
  IDEstab := -1;

  cmbTipoPapel.Items.Assign (dtmRelatorios2.rpCompSaldo.PrinterSetup.PaperNames);
  
  iPos := ProcuraStList (cmbTipoPapel.Items,'A4');
  if (iPos = -1) then
    cmbTipoPapel. ItemIndex := 0
  else
    cmbTipoPapel. ItemIndex := iPos;

  FazQuery(dtmBaseDados.qry,'SELECT NORMALINI, NORMALFIM FROM PARAMRH');
  dtedFim.Date    := dtmBaseDados.qry.FieldByName('NORMALFIM').asDateTime;
  dtedInicio.Date := StrToDate(IncData (dtmBaseDados.qry.FieldByName('NORMALINI').asString,0,
                     -ExtraiMes(dtmBaseDados.qry.FieldByName('NORMALINI').asDateTime)+1,0));

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
  qryRubBase.ParamByName('IDEMPRESA').asInteger := Sistema.IdEmpresa;
  qryRubBase.Open;
  qryRubReportada.ParamByName('IDEMPRESA').asInteger := Sistema.IdEmpresa;
  qryRubReportada.Open;

  cmbOrderBy.ItemIndex := 0;
  pgctrlEmpregados.ActivePageIndex := 0;
end;

procedure TfrmParamCompSaldo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dtmBaseDados.qry.Close;
  qryEstab.Close;
  qryRubBase.Close;
  qryRubReportada.Close;
  inherited;
end;

procedure TfrmParamCompSaldo.chklstFuncDrawItem(Control: TWinControl; Index: Integer;
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

procedure TfrmParamCompSaldo.dblkcbEstabChange(Sender: TObject);
begin
  if (qryEstab.FieldByName('IDPESSOA').asInteger <> IDEstab) then
  begin
    MontaListaFuncionarios;
    IDEstab := qryEstab.FieldByName('IDPESSOA').asInteger;

    if (pgctrlEmpregados.ActivePageIndex = 0) then
      chklstFunc.Repaint;
  end;
end;

procedure TfrmParamCompSaldo.dblkcbRubBaseChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamCompSaldo.gbxTipContraEnter(Sender: TObject);
begin
  bTipContrEfet  := cbxEfetivos.Checked;
  bTipContrEspec := cbxEspeciais.Checked;
  bTipContrTemp  := cbxTemporarios.Checked;
  bTipContrEst   := cbxEstagiarios.Checked;
  bTipContrTerc  := cbxTerceiros.Checked;
  bTipContrProp  := cbxPropDirSemVinc.Checked;
  bTipContrAut   := cbxAutonomos.Checked;
end;

procedure TfrmParamCompSaldo.gbxTipContraExit(Sender: TObject);
begin
  if not(cbxEfetivos.Checked)       and not(cbxEspeciais.Checked) and
     not(cbxTemporarios.Checked)    and not(cbxTerceiros.Checked) and
     not(cbxPropDirSemVinc.Checked) and not(cbxAutonomos.Checked) and
     not(cbxEstagiarios.Checked) then
  begin
    MsgDlg ('Pelo menos um Tipo de Contrato deve ser selecionado !','Aviso',
      mtInformation,[mbOk,mbHelp],0);
    cbxEfetivos.SetFocus;
  end
  else
  begin
    if (bTipContrEfet <> cbxEfetivos.Checked)    or (bTipContrEspec <> cbxEspeciais.Checked)      or
       (bTipContrTemp <> cbxTemporarios.Checked) or (bTipContrEst   <> cbxEstagiarios.Checked)    or
       (bTipContrTerc <> cbxTerceiros.Checked)   or (bTipContrProp  <> cbxPropDirSemVinc.Checked) or
       (bTipContrAut  <> cbxAutonomos.Checked) then
      MontaListaFuncionarios
  end;
end;

procedure TfrmParamCompSaldo.gbxSituacaoEnter(Sender: TObject);
begin
  bSitAtivo := cbxAtivos.Checked;
  bSitAfast := cbxAfastados.Checked;
  bSitDemit := cbxDemitidos.Checked;
end;

procedure TfrmParamCompSaldo.gbxSituacaoExit(Sender: TObject);
begin
  if not(cbxAtivos.Checked) and not(cbxAfastados.Checked) and not(cbxDemitidos.Checked) then
  begin
    MsgDlg ('Pelo menos um Tipo de Situação deve ser selecionado !','Aviso',
      mtInformation,[mbOk,mbHelp],0);
    cbxAtivos.SetFocus;
  end
  else
  if (bSitAtivo <> cbxAtivos.Checked) or (bSitAfast <> cbxAfastados.Checked) or
     (bSitDemit <> cbxDemitidos.Checked) then
    MontaListaFuncionarios
end;

procedure TfrmParamCompSaldo.chklstFuncKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmParamCompSaldo.chklstFuncClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmParamCompSaldo.bbtnSelTodosFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := true;
  chklstFunc.Repaint;
end;

procedure TfrmParamCompSaldo.bbtnInverteSelFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := not(chklstFunc.Checked[c]);
  chklstFunc.Repaint;
end;

function TfrmParamCompSaldo.VerificaOpcoesOk: boolean;
begin
  Result := false;

  // Testa se Data Final é MENOR do que a Data Inicial
  if (dtedFim.Date < dtedInicio.Date) then
  begin
    MsgDlg ('Data Final MENOR que a Inicial !','Aviso', mtInformation,[mbOk,mbHelp],0);
    dtedInicio.SetFocus;
    exit;
  end;

  Result := true;
end;

procedure TfrmParamCompSaldo.bbtnConfirmarClick(Sender: TObject);
var
  wNum: word;
  sAnoMesIni, sAnoMesFin: string;
begin
  // Verifica se as opções selecionadas estão corretamente selecionadas
  if not(VerificaOpcoesOk) then
  begin
    ModalResult := mrNone;
    exit;
  end;  

  sAnoMesIni := RetornaAnoMes(dtedInicio.Date);
  sAnoMesFin := RetornaAnoMes(dtedFim.Date);

  // Funcionários escolhidos
  wNum := CriaListaOpcoes (chklstFunc, ListaCodFunc, sCodFuncSel, ',', false);
  if (wNum = ListaCodFunc.Count) then
    sCodFuncSel := '';

  // Monta Query Pricipal
  with (dtmRelatorios2) do
  begin
    qryCompSaldo.Close;
    with (qryCompSaldo.SQL) do
    begin
      Clear;
      Add('SELECT DISTINCT');
      Add('  RTRIM(PJ.RAZAOSOCIAL) AS EMPRESA,');
      Add('  ('+QuotedStr(dtedInicio.Text)+') AS PERIODO_INI,');
      Add('  ('+QuotedStr(dtedFim.Text)+')    AS PERIODO_FIN,');
      Add('  (''CNPJ: '' || PJ.NUMDOCUMENTO)  AS CGCCPF,');
      Add('  ES.CODESTADO AS UF,');
      Add('  RTRIM(DECODE(RTRIM(ESTADUAL.NUMDOCUMENTO),NULL,');
      Add('    DECODE(RTRIM(MUNICIPAL.NUMDOCUMENTO),NULL,NULL,');
      Add('    ''Inscrição Municipal: ''|| MUNICIPAL.NUMDOCUMENTO),');
      Add('    ''Inscrição Estadual: '' || ESTADUAL.NUMDOCUMENTO)) AS ESTADUALMUNICIPAL,');
      Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO || DECODE(E.COMPLEMENTO,NULL,NULL,'' - '' ||');
      Add('    RTRIM(E.COMPLEMENTO)) ||'' - ''|| RTRIM(E.BAIRRO) ||'' - ''|| RTRIM(CIDADES.NOME) ||'' - CEP:''||');
      Add('    RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS ENDERECO,');
      Add('  F.MATRICULA,');
      Add('  RTRIM(PF.NOME) AS FUNCIONARIO,');
      Add('  (SUBSTR(RUBREPORTADA.MES,6,2)||''/''||SUBSTR(RUBREPORTADA.MES,1,4)) AS MES_RUBRICA,');
      Add('  RUBREPORTADA.MES,');
      Add('  (RUBREPORTADA.DESCRICAO) AS NOME_RUB_REPORTADA,');
      Add('  (RUBREPORTADA.VALOR)     AS VALOR_RUB_REPORTADA,');
      Add('  (RUBBASE.DESCRICAO)      AS NOME_RUB_BASE,');
      Add('  NVL(RUBBASE.VALOR,0)     AS VALOR_RUB_BASE');
      Add('FROM');
      Add('  PESSOA PJ, PESSOA PF, ENDPESS E, FUNCIONARIO F, CIDADES, ESTADO ES, SITFUNC ST,');
      // ------------------------------------------------------------------------------- //
      // Inscrição Estadual do(s) Estabelecimento(s)
      Add('  (SELECT DO.IDPESSOA, TDO.CODDOCUMENTO, DO.NUMDOCUMENTO');
      Add('   FROM   DOCPESSOA DO, TIPODOCOFICIAL TDO');
      Add('   WHERE (TDO.SIGLADOCUMENTO = ''ESTADUAL:'') AND');
      Add('         (TDO.IDDOCUMENTO    = DO.IDDOCUMENTO)) ESTADUAL,');
      // -------------------------------------------------------------------------- //
      // Inscrição Municipal do(s) Estabelecimento(s)
      Add('  (SELECT DO.IDPESSOA, TDO.CODDOCUMENTO, DO.NUMDOCUMENTO');
      Add('   FROM   DOCPESSOA DO, TIPODOCOFICIAL TDO');
      Add('   WHERE (TDO.SIGLADOCUMENTO = ''MUNICIPAL:'') AND');
      Add('         (TDO.IDDOCUMENTO    = DO.IDDOCUMENTO)) MUNICIPAL,');
      // -------------------------------------------------------------------------------*/
      // Rubrica base
      Add('  (SELECT H.IDPESSOA, RP.DESCRPROVDESC AS DESCRICAO, H.MES, (H.VALORPROVENTO) AS VALOR');
      Add('   FROM   HISTRUBSAL H, RUBRICAXPESS RP');
      Add('   WHERE (H.CODPROVDESC  = '+QuotedStr(qryRubBase.FieldByName('CODPROVDESC').asString)+') AND');
      Add('         (RP.CODPROVDESC = '+QuotedStr(qryRubBase.FieldByName('CODPROVDESC').asString)+') AND');

      if (sCodFuncSel <> '') then
        if (Pos(',',sCodFuncSel) > 0) then
          Add('         (H.IDPESSOA IN (' +sCodFuncSel+ ')) AND')
        else
          Add('         (H.IDPESSOA  = ' +sCodFuncSel+ ') AND');

      Add('         (H.MES       >= '+QuotedStr(sAnoMesIni)+') AND');
      Add('         (H.MES       <= '+QuotedStr(sAnoMesFin)+') AND');
      Add('         (RP.IDRUBRICA = H.IDRUBRICA)) RUBBASE,');
      // ------------------------------------------------------------------------------- //
      // Rubrica reportada
      Add('  (SELECT H.IDPESSOA, RP.DESCRPROVDESC AS DESCRICAO, H.MES, (H.VALORPROVENTO) AS VALOR');
      Add('   FROM   HISTRUBSAL H, RUBRICAXPESS RP');
      Add('   WHERE (H.CODPROVDESC  = '+QuotedStr(qryRubReportada.FieldByName('CODPROVDESC').asString)+') AND');
      Add('         (RP.CODPROVDESC = '+QuotedStr(qryRubReportada.FieldByName('CODPROVDESC').asString)+') AND');

      if (sCodFuncSel <> '') then
        if (Pos(',',sCodFuncSel) > 0) then
          Add('         (H.IDPESSOA IN (' +sCodFuncSel+ ')) AND')
        else
          Add('         (H.IDPESSOA  = ' +sCodFuncSel+ ') AND');

      Add('         (H.MES       >= '+QuotedStr(sAnoMesIni)+') AND');
      Add('         (H.MES       <= '+QuotedStr(sAnoMesFin)+') AND');
      Add('         (RP.IDRUBRICA = H.IDRUBRICA)) RUBREPORTADA');
      // ------------------------------------------------------------------------------- //
      Add('WHERE');
      Add('  (PJ.IDPESSOA = '+qryEstab.FieldByName('IDPESSOA').asString+') AND');

      // Funcionário(s) selecionado(s)
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
            Add('  (ST.TIPOSIT       IN (' +sAux+ ')) AND')
          else
            Add('  (ST.TIPOSIT        = ' +sAux+ ') AND');

        sAux := SelecionaTipoContrato;
        if (Pos(',',sAux) > 0) then
          Add('  (F.TIPOCONTRATO   IN (' +sAux+ ')) AND')
        else
          Add('  (F.TIPOCONTRATO    = ' +sAux+ ') AND');
      end;

      Add('  (ST.IDSITFUNC      = F.IDSITFUNC)           AND');
      Add('  (PJ.IDPESSOA       = F.IDESTAB)             AND');
      Add('  (F.IDPESSOA        = PF.IDPESSOA)           AND');
      Add('  (F.IDPESSOA        = RUBREPORTADA.IDPESSOA) AND');
      Add('  (F.IDPESSOA        = RUBBASE.IDPESSOA)      AND');
      Add('  (RUBREPORTADA.MES  = RUBBASE.MES)           AND');
      Add('  (PJ.IDPESSOA       = E.IDPESSOA)            AND');
      Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO)          AND');
      Add('  (E.IDCIDADES       = CIDADES.IDCIDADES)     AND');
      Add('  (CIDADES.IDESTADO  = ES.IDESTADO)           AND');
      Add('  (PJ.IDPESSOA       = ESTADUAL.IDPESSOA(+))  AND');
      Add('  (PJ.IDPESSOA       = MUNICIPAL.IDPESSOA(+))');
      Add('ORDER BY');
      case (cmbOrderBy.ItemIndex) of
        0 : Add('  EMPRESA, FUNCIONARIO, MES');
        1 : Add('  EMPRESA, MATRICULA, MES');
      end;
      //SaveToFile ('c:\qry.txt');
      SaveToFile (Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+ '\qry.txt'); //Ádler Teodoro de Souza SOL 109421 KINTANA 496332
    end;

    // Monta Query Secundária
    qryCompSaldoSub.Close;
    with (qryCompSaldoSub.SQL) do
    begin
      Clear;
      Add('SELECT DISTINCT');
      Add('  RTRIM(PJ.RAZAOSOCIAL) AS EMPRESA,');
      Add('  RUBREPORTADA.MES,');
      Add('  (DECODE(TO_NUMBER(SUBSTR(RUBREPORTADA.MES,6,2)),1,''Janeiro'',2,''Fevereiro'',3,''Março'',4,''Abril'',');
      Add('     5,''Maio'',6,''Junho'',7,''Julho'',8,''Agosto'',9,''Setembro'',10,''Outubro'',');
      Add('     11,''Novembro'',12,''Dezembro'')||''/''||SUBSTR(RUBREPORTADA.MES,1,4)) AS MES_RUBRICA,');
      Add('  (RUBREPORTADA.DESCRICAO) AS NOME_RUB_REPORTADA,');
      Add('  (RUBREPORTADA.VALOR)     AS VALOR_RUB_REPORTADA');
      Add('FROM');
      Add('  PESSOA PJ, PESSOA PF, FUNCIONARIO F, SITFUNC ST,');
      // ------------------------------------------------------------------------------- //
      // Rubricas reportadas
      Add('  (SELECT H.IDPESSOA, RP.DESCRPROVDESC AS DESCRICAO, H.MES, (H.VALORPROVENTO) AS VALOR');
      Add('   FROM   HISTRUBSAL H, RUBRICAXPESS RP');
      Add('   WHERE (H.CODPROVDESC  = '+QuotedStr(qryRubReportada.FieldByName('CODPROVDESC').asString)+') AND');
      Add('         (RP.CODPROVDESC = '+QuotedStr(qryRubReportada.FieldByName('CODPROVDESC').asString)+') AND');

      if (sCodFuncSel <> '') then
        if (Pos(',',sCodFuncSel) > 0) then
          Add('         (H.IDPESSOA IN (' +sCodFuncSel+ ')) AND')
        else
          Add('         (H.IDPESSOA  = ' +sCodFuncSel+ ') AND');

      Add('         (H.MES       >= '+QuotedStr(sAnoMesIni)+') AND');
      Add('         (H.MES       <= '+QuotedStr(sAnoMesFin)+') AND');
      Add('         (RP.IDRUBRICA = H.IDRUBRICA)) RUBREPORTADA');
      // ------------------------------------------------------------------------------- //
      Add('WHERE');
      Add('  (PJ.IDPESSOA = '+qryEstab.FieldByName('IDPESSOA').asString+') AND');

      // Funcionário(s) selecionado(s)
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
            Add('  (F.CODCENTROCUSTO = ' +sUsuXccusto+ ') AND');
        end;

        sAux := SelecionaSitFunc;
        if (sAux <> '') then
          if (Pos(',',sAux) > 0) then
            Add('  (ST.TIPOSIT   IN (' +sAux+ ')) AND')
          else
            Add('  (ST.TIPOSIT   = ' +sAux+ ') AND');

        sAux := SelecionaTipoContrato;
        if (Pos(',',sAux) > 0) then
          Add('  (F.TIPOCONTRATO IN (' +sAux+ ')) AND')
        else
          Add('  (F.TIPOCONTRATO = ' +sAux+ ') AND');
      end;

      Add('  (ST.IDSITFUNC = F.IDSITFUNC) AND');
      Add('  (PJ.IDPESSOA  = F.IDESTAB)   AND');
      Add('  (F.IDPESSOA   = PF.IDPESSOA) AND');
      Add('  (F.IDPESSOA   = RUBREPORTADA.IDPESSOA)');
      Add('ORDER BY');
      Add('  EMPRESA, MES');
      //SaveToFile ('c:\qry1.txt');
      SaveToFile (Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry1.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
    end;

    rpCompSaldo.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
  end;

  frmAguarde.Mostra('Composição de Saldo');
  frmAguarde.Pos := 0;
  dtmRelatorios2.qryCompSaldo.Open;
  dtmRelatorios2.qryCompSaldoSub.Open;
  frmAguarde.Min := 0;
  frmAguarde.Max := dtmRelatorios2.qryCompSaldo.RecordCount + dtmRelatorios2.qryCompSaldoSub.RecordCount;

  if (dtmRelatorios2.qryCompSaldo.IsEmpty) or (dtmRelatorios2.qryCompSaldoSub.IsEmpty) then
  begin
    ModalResult := mrNone;
    frmAguarde.Apaga;
    MsgDlg('Não há dados a serem exibidos! Verifique.','Aviso',mtInformation,[mbOk,mbHelp],0);
  end;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------
procedure TfrmParamCompSaldo.MontaListaFuncionarios;
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
      Add('  PESSOA PF, FUNCIONARIO F');
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

      sAux := SelecionaTipoContrato;
      if (Pos(',',sAux) > 0) then
        Add('  (F.TIPOCONTRATO    IN (' +sAux+ ')) AND')
      else
        Add('  (F.TIPOCONTRATO     = ' +sAux+ ') AND');

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
  end;
  HabilitaBtOk;
end;

procedure TfrmParamCompSaldo.HabilitaBtOk;
begin
  bbtnConfirmar.Enabled := (Trim(dblkcbRubBase.Text) <> '') and (Trim(dtedFim.Text) <> '') and
    (Trim(dblkcbRubReportada.Text) <> '') and (Trim(dtedInicio.Text) <> '');
end;

function TfrmParamCompSaldo.SelecionaTipoContrato: string;
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

function TfrmParamCompSaldo.SelecionaSitFunc: string;
begin
  sAux := '';
  if (cbxAtivos.Checked) then
    sAux := QuotedStr('A');

  if (cbxAfastados.Checked) then
    if (length(sAux) > 0) then
      sAux := sAux +','+ QuotedStr('F')
    else
      sAux := QuotedStr('F');

  if (cbxDemitidos.Checked) then
    if (length(sAux) > 0) then
      sAux := sAux +','+ QuotedStr('D')
    else
      sAux := QuotedStr('D');

  Result := sAux;
end;

end.
