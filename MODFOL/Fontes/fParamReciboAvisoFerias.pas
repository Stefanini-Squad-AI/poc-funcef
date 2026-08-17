// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamReciboAvisoFerias;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook, Spin,
  checklst, IvDictio, IvMulti, IvEMulti, ComCtrls, wwdbdatetimepicker, CMDateTimePicker,
  fSairAjuda;

type
  TfrmParamReciboAvisoFerias = class(TfrmSairAjuda)
    qryMotivo: TwwQuery;
    gbxEstab: TGroupBox;
    gbxTipoPag: TGroupBox;
    dblkcbMotivo: TwwDBLookupCombo;
    dblkcbEstab: TwwDBLookupCombo;
    qryEstab: TwwQuery;
    gbxOrdem: TGroupBox;
    cmbOrderBy: TComboBox;
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
    rgProcesso: TRadioGroup;
    gbxIntervRef: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtedIni: TCMDateTimePicker;
    dtedFin: TCMDateTimePicker;
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
    rgExibeMaiorRem: TRadioGroup;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chklstFuncDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure dblkcbEstabChange(Sender: TObject);
    procedure dblkcbMotivoChange(Sender: TObject);
    procedure gbxTipContraEnter(Sender: TObject);
    procedure gbxTipContraExit(Sender: TObject);
    procedure chklstFuncClickCheck(Sender: TObject);
    procedure bbtnSelTodosFuncClick(Sender: TObject);
    procedure bbtnInverteSelFuncClick(Sender: TObject);
    procedure dtedIniChange(Sender: TObject);
    procedure chklstFuncKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure HabilitaBtOk;
    procedure GravaDadosQuery;    
    procedure MontaListaFuncionarios;
    function  SelecionaTipoContrato: string;    
  end;

var
  frmParamReciboAvisoFerias: TfrmParamReciboAvisoFerias;

implementation

uses uSistema, uMensErro, uExtenso, uDataBase, fAguarde, dBaseDados,
  uFuncoesUteis, UsoGeralRH, uComumRelats, dRelatorios2;

{$R *.DFM}

procedure TfrmParamReciboAvisoFerias.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  if not(Assigned(ListaCodFunc)) then
    ListaCodFunc := TStringList.Create;
  IDEstab := -1;

  cmbTipoPapel.Items.Assign (dtmRelatorios2.rpReciboAvisoFerias.PrinterSetup.PaperNames);

  iPos := ProcuraStList (cmbTipoPapel.Items,'A4');
  if (iPos = -1) then
    cmbTipoPapel. ItemIndex := 0
  else
    cmbTipoPapel. ItemIndex := iPos;

  FazQuery(dtmBaseDados.qry,'SELECT NORMALINI, NORMALFIM FROM PARAMRH');
  dtedIni.Date := dtmBaseDados.qry.FieldByName('NORMALINI').asDateTime;
  dtedFin.Date := dtmBaseDados.qry.FieldByName('NORMALFIM').asDateTime;

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
  qryMotivo.Open;

  cmbOrderBy.ItemIndex := 0;
  pgctrlEmpregados.ActivePageIndex := 0;

  HabilitaBtOk;
end;

procedure TfrmParamReciboAvisoFerias.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dtmBaseDados.qry.Close;
  qryMotivo.Close;
  qryEstab.Close;
  inherited;
end;

procedure TfrmParamReciboAvisoFerias.chklstFuncDrawItem(Control: TWinControl; Index: Integer;
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

procedure TfrmParamReciboAvisoFerias.dblkcbEstabChange(Sender: TObject);
begin
  if (qryEstab.FieldByName('IDPESSOA').asInteger <> IDEstab) then
  begin
    MontaListaFuncionarios;
    IDEstab := qryEstab.FieldByName('IDPESSOA').asInteger;

    if (pgctrlEmpregados.ActivePageIndex = 0) then
      chklstFunc.Repaint;
  end;
end;

procedure TfrmParamReciboAvisoFerias.dblkcbMotivoChange(Sender: TObject);
begin
  dblkcbMotivo.Text := Trim(dblkcbMotivo.Text);
  HabilitaBtOk;
end;

procedure TfrmParamReciboAvisoFerias.dtedIniChange(Sender: TObject);
begin
  try
    StrToDate(TEdit(Sender).Text);
    MontaListaFuncionarios;
  except
  end;
end;

procedure TfrmParamReciboAvisoFerias.gbxTipContraEnter(Sender: TObject);
begin
  bTipContrEfet  := cbxEfetivos.Checked;
  bTipContrEspec := cbxEspeciais.Checked;
  bTipContrTemp  := cbxTemporarios.Checked;
  bTipContrEst   := cbxEstagiarios.Checked;
  bTipContrTerc  := cbxTerceiros.Checked;
  bTipContrProp  := cbxPropDirSemVinc.Checked;
  bTipContrAut   := cbxAutonomos.Checked;
end;

procedure TfrmParamReciboAvisoFerias.gbxTipContraExit(Sender: TObject);
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
      MontaListaFuncionarios;
  end;
end;

procedure TfrmParamReciboAvisoFerias.chklstFuncKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    chklstFuncClickCheck(Sender);
end;

procedure TfrmParamReciboAvisoFerias.chklstFuncClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
  HabilitaBtOk;
end;

procedure TfrmParamReciboAvisoFerias.bbtnSelTodosFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := true;
  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamReciboAvisoFerias.bbtnInverteSelFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := not(chklstFunc.Checked[c]);
  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamReciboAvisoFerias.bbtnConfirmarClick(Sender: TObject);
var
  wNum: word;
  NomeTabela: string;
begin
  if (rgProcesso.ItemIndex = 0) then
    NomeTabela := 'PREVIAFOLPAG'
  else
    NomeTabela := 'HISTRUBSAL';

  // Funcionários escolhidos
  wNum := CriaListaOpcoes (chklstFunc, ListaCodFunc, sCodFuncSel, ',', false);
  if (wNum = ListaCodFunc.Count) then
    sCodFuncSel := '';

  // Monta Query Auxiliar
  dtmBaseDados.qry.Close;
  with (dtmBaseDados.qry.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  RTRIM(PJ.RAZAOSOCIAL) AS EMPRESA,');
    Add('  RTRIM(PF.NOME)        AS EMPREGADO,');
    Add('  P.FLGDESCONTO         AS TIPORUBRICA,');
    Add('  F.MATRICULA,');
    Add('  RTRIM(CC.NOME)        AS NOMECENTROCUSTO,');
    Add('  RTRIM(DECODE(RTRIM(H.REFERENCIA),''***'','''',''Ferias'','''',''Férias'','''',');
    Add('    ''Rescisao'','''',''Rescisão'','''',''13.o Salar'','''',H.REFERENCIA)) AS REFERENCIA,');
    Add('  C.TITULO,');
    Add('  P.CODRUBCLT      AS CODRUBRICA,');
    Add('  RP.CODPROVDESC   AS CODRUBRICACLIENTE,');
    Add('  RTRIM(RP.DESCRPROVDESC) AS RUBRICA,');
    Add('  CGC.NUM          AS CGC,');
    Add('  RTRIM(CTPS.NUM)  AS CTPS_NUM,');
    Add('  DECODE(CTPS.UF,NULL,NULL,''/'' || CTPS.UF) AS CTPS_UF,');
    Add('  CTPS.MASCARA     AS MASCARA_CTPS,');
    Add('  RTRIM(DECODE(RTRIM(ESTADUAL.NUMDOCUMENTO),NULL,');
    Add('    DECODE(RTRIM(MUNICIPAL.NUMDOCUMENTO),NULL,NULL,');
    Add('    ''Inscrição Municipal: '' || MUNICIPAL.NUMDOCUMENTO),');
    Add('    ''Inscrição Estadual:  '' || ESTADUAL.NUMDOCUMENTO)) AS ESTADUALMUNICIPAL,');
    Add('  RTRIM(END.LOGRADOURO) ||'', ''|| END.NUMERO || DECODE(END.COMPLEMENTO,NULL,NULL,'' - '' ||');
    Add('    RTRIM(END.COMPLEMENTO)) ||'' - ''|| RTRIM(END.BAIRRO) ||'' - ''|| RTRIM(CIDADES.NOME) ||'' - CEP:''||');
    Add('    RTRIM(SUBSTR(END.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(END.CEP,6,3)) AS ENDERECO,');
    Add('  H.VALORPROVENTO AS VALOR,');
    Add('  FERIAS.FLGABONO,');
    Add('  FERIAS.INIPERIODOFERIAS,');
    Add('  FERIAS.INIGOZOFERIAS,');
    Add('  FERIAS.FIMGOZOFERIAS,');
    Add('  (F.SALARIOATUAL * DECODE(F.TIPOPAGAMENTO,''M'',1,HT.JORNADAMENSAL)) AS SALBASE,');

    if (rgExibeMaiorRem.ItemIndex = 0) then
      Add('  NVL(MAIOR_REM.VALOR,0) AS MAIOR_REMUNERACAO')
    else
      Add('  (0) AS MAIOR_REMUNERACAO');

    Add('FROM');
    Add('  '+NomeTabela+' H, PESSOA PJ, PESSOA PF, PROVDESC P, RUBRICAXPESS RP,');
    Add('  FUNCIONARIO F, ENDPESS END, CENTCUST CC, CARGO C,');
    Add('  CIDADES, FERIAS, HORATRAB HT,');
    // -------------------------------------------------------------------- //
    // Maior Remuneração do Funcionário
    if (rgExibeMaiorRem.ItemIndex = 0) then
    begin
      Add('  (SELECT H.IDPESSOA, SUM(H.VALORPROVENTO) AS VALOR');
      Add('   FROM   '+NomeTabela+' H, PROVDESC P');
      Add('   WHERE  (P.CODRUBCLT  = ''90007'') AND');

      // Funcionário(s) selecionado(s)
      if (sCodFuncSel <> '') then
      begin
        if (Pos(',',sCodFuncSel) > 0) then
          Add('          (H.IDPESSOA    IN (' +sCodFuncSel+ ')) AND')
        else
          Add('          (H.IDPESSOA     = ' +sCodFuncSel+ ') AND');
      end;

      Add('          (H.MES  BETWEEN '+QuotedStr(Copy(dtedIni.Text,7,4)+'/'+Copy(dtedIni.Text,4,2))+
        ' AND '+QuotedStr(Copy(dtedFin.Text,7,4)+'/'+Copy(dtedFin.Text,4,2))+') AND');
      Add('          (H.IDMOTIVO   = '+IntToStr(qryMotivo.FieldByName('IDMOTIVO').asInteger)+') AND');
      Add('          (P.IDPROVENTO = H.IDRUBRICA)');
      Add('   GROUP BY');
      Add('     H.IDPESSOA, P.IDPROVENTO) MAIOR_REM,');
    end;
    // -------------------------------------------------------------------- //
    // CTPS do Funcionário
    Add('  (SELECT DP.IDPESSOA, TDP.MASCARA, DP.NUMDOCUMENTO AS NUM, ES.CODESTADO AS UF');
    Add('   FROM   DOCPESSOA DP, ESTADO ES, TIPODOCPESSOA TDP, TIPODOCOFICIAL TDO, PAIS PA');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''CTPS:'')       AND');
    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO)  AND');
    Add('         (TDO.IDDOCUMENTO    = TDP.IDDOCUMENTO) AND');
    Add('         (DP.IDPAIS          = PA.IDPAIS)       AND');
    Add('         (PA.IDPAIS          = ES.IDPAIS)       AND');
    Add('         (DP.IDESTADO        = ES.IDESTADO)) CTPS,');
    // -------------------------------------------------------------------------- //
    // CGC da Empresa
    Add('  (SELECT FP.IDFILIALPESSOA,');
    Add('          RTRIM(TDO.SIGLADOCUMENTO ||'' ''|| DO.NUMDOCUMENTO) AS NUM');
    Add('   FROM   DOCPESSOA DO, TIPODOCOFICIAL TDO, FILIALPESSOA FP');
    Add('   WHERE ((TDO.SIGLADOCUMENTO = ''CNPJ:'')       OR');
    Add('          (TDO.SIGLADOCUMENTO = ''CGC:''))      AND');
    Add('         (TDO.IDDOCUMENTO     = DO.IDDOCUMENTO) AND');
    Add('         (FP.IDFILIALPESSOA   = DO.IDPESSOA)) CGC,');
    // -------------------------------------------------------------------------- //
    // Inscrição Estadual
    Add('  (SELECT D.IDPESSOA, TD.CODDOCUMENTO, D.NUMDOCUMENTO');
    Add('   FROM   DOCPESSOA D, TIPODOCOFICIAL TD');
    Add('   WHERE (TD.SIGLADOCUMENTO = ''ESTADUAL:'') AND');
    Add('         (TD.IDDOCUMENTO    = D.IDDOCUMENTO)) ESTADUAL,');
    // -------------------------------------------------------------------------- //
    // Inscrição Municipal
    Add('  (SELECT D.IDPESSOA, TD.CODDOCUMENTO, D.NUMDOCUMENTO');
    Add('   FROM   DOCPESSOA D, TIPODOCOFICIAL TD');
    Add('   WHERE (TD.SIGLADOCUMENTO = ''MUNICIPAL:'') AND');
    Add('         (TD.IDDOCUMENTO    = D.IDDOCUMENTO)) MUNICIPAL');
    // -------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (PJ.IDPESSOA       = '+qryEstab.FieldByName('IDPESSOA').asString+') AND');

    if (rgProcesso.ItemIndex = 0) then
      Add('  (FERIAS.FLGOCORRIDA    = 0) AND')
    else
      Add('  (FERIAS.FLGOCORRIDA    = 1) AND');

    Add('  (FERIAS.INIGOZOFERIAS BETWEEN TO_DATE('+QuotedStr(dtedIni.Text)+',''DD/MM/YYYY'') AND '+
      'TO_DATE('+QuotedStr(dtedFin.Text)+',''DD/MM/YYYY'')) AND');

    // Funcionário(s) selecionado(s) (para HISTRUBSAL)
    if (sCodFuncSel <> '') then
    begin
      if (Pos(',',sCodFuncSel) > 0) then
        Add('  (H.IDPESSOA    IN (' +sCodFuncSel+ ')) AND')
      else
        Add('  (H.IDPESSOA     = ' +sCodFuncSel+ ') AND');
    end;

    Add('  (H.MES           BETWEEN '+QuotedStr(Copy(dtedIni.Text,7,4)+'/'+Copy(dtedIni.Text,4,2))+
      ' AND '+QuotedStr(Copy(dtedFin.Text,7,4)+'/'+Copy(dtedFin.Text,4,2))+') AND');
    Add('  (H.IDMOTIVO            = '+IntToStr(qryMotivo.FieldByName('IDMOTIVO').asInteger)+') AND');

    // Funcionário(s) selecionado(s) (para PESSOA)
    if (sCodFuncSel <> '') then
    begin
      if (Pos(',',sCodFuncSel) > 0) then
        Add('  (F.IDPESSOA IN (' +sCodFuncSel+ ')) AND')
      else
        Add('  (F.IDPESSOA  = ' +sCodFuncSel+ ') AND');
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

        sAux := SelecionaTipoContrato;
        if (Pos(',',sAux) > 0) then
          Add('  (F.TIPOCONTRATO   IN (' +sAux+ ')) AND')
        else
          Add('  (F.TIPOCONTRATO    = ' +sAux+ ') AND');
      end;

    Add('  ((P.CODRUBCLT      <> ''60049'')      OR');
    Add('   (P.CODRUBCLT      IS NULL))         AND');
    Add('  (CGC.IDFILIALPESSOA = PJ.IDPESSOA)   AND');
    Add('  (FERIAS.IDPESSOA    = F.IDPESSOA)    AND');
    Add('  (F.IDPESSOA         = CTPS.IDPESSOA) AND');
    Add('  (F.IDCARGO          = C.IDCARGO)     AND');
    Add('  (F.IDEMPRESA        = CC.IDEMPRESA)  AND');
    Add('  (F.IDEMPRESA        = RP.IDPESSOA)   AND');
    Add('  (F.IDHORARIO        = HT.IDHORARIO)  AND');
    Add('  (F.IDESTAB          = PJ.IDPESSOA)   AND');
    Add('  (F.IDPESSOA         = PF.IDPESSOA)   AND');
    Add('  (F.IDPESSOA         = H.IDPESSOA)    AND');
    Add('  (RP.IDRUBRICA       = H.IDRUBRICA)   AND');
    Add('  (H.IDRUBRICA        = P.IDPROVENTO)  AND');
    Add('  (PJ.IDPESSOA        = END.IDPESSOA(+))       AND');
    Add('  (PJ.IDENDCOMERCIAL  = END.IDENDERECO(+))     AND');
    Add('  (END.IDCIDADES      = CIDADES.IDCIDADES(+))  AND');
    Add('  (PJ.IDPESSOA        = ESTADUAL.IDPESSOA(+))  AND');
    Add('  (PJ.IDPESSOA        = MUNICIPAL.IDPESSOA(+)) AND');

    if (rgExibeMaiorRem.ItemIndex = 0) then
      Add('  (F.IDPESSOA        = MAIOR_REM.IDPESSOA(+)) AND');

    Add('  (F.CODCENTROCUSTO  = CC.CODCENTROCUSTO(+))');
    Add('ORDER BY');
    case (cmbOrderBy.ItemIndex) of
      0 : Add('  EMPRESA, EMPREGADO, TIPORUBRICA, CODRUBRICACLIENTE');
      1 : Add('  EMPRESA, NOMECENTROCUSTO, EMPREGADO, TIPORUBRICA, CODRUBRICACLIENTE');
      2 : Add('  EMPRESA, NOMECENTROCUSTO, MATRICULA, TIPORUBRICA, CODRUBRICACLIENTE');
      3 : Add('  EMPRESA, MATRICULA, TIPORUBRICA, CODRUBRICACLIENTE');
    end;
    //SaveToFile ('c:\qry.txt');
    SaveToFile (Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;

  // Monta Query Principal
  with (dtmRelatorios2) do
  begin
    frmAguarde.Mostra ('Recibo / Aviso de Férias');
    frmAguarde.Pos := 0;

    // Aponto o UpdateSQL para a query principal
    qryReciboAvisoFerias.UpdateObject := updSQL;

    if not(qryReciboAvisoFerias.IsEmpty) then
      qryReciboAvisoFerias.CancelUpdates;
    qryReciboAvisoFerias.Close;
    qryReciboAvisoFerias.Open;

    // Processa dados para a geração da query
    dtmBaseDados.qry.Open;
    GravaDadosQuery;
    qryReciboAvisoFerias.First;

    // Especifico Configurações do Relatório
    rpReciboAvisoFerias.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];

    if (Trim(dtmBaseDados.qry.FieldByName('MASCARA_CTPS').asString) <> '') then
      rpReciboAvisoFeriasDBTextCTPS.DisplayFormat := dtmBaseDados.qry.FieldByName('MASCARA_CTPS').asString+';0;_';
  end;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------
procedure TfrmParamReciboAvisoFerias.GravaDadosQuery;
var
  dtPerAquiFinal: TDateTime;
  wTotPagEmpregado: word;
  sMatricula: string;
  rMaiorRem, rSalBase, rBaseINSS, rBaseFGTS, rFGTSMes,
  rBaseIRRF, rProventos, rDescontos: real;
  iPaginaAtual, iPagina, iRubrica: integer;
  Marca: TBookmark;
begin
  with (dtmRelatorios2.qryReciboAvisoFerias) do
  begin
    if not(dtmBaseDados.qry.IsEmpty) then
    begin
      frmAguarde.Min := 0;
      frmAguarde.Max := dtmBaseDados.qry.RecordCount;

      iPaginaAtual := 1;
      while not(dtmBaseDados.qry.EOF) do
      begin
        sMatricula       := dtmBaseDados.qry.FieldByName('MATRICULA').asString;
        Marca            := dtmBaseDados.qry.GetBookMark;
        iPagina          := 1;
        wTotPagEmpregado := 1;
        iRubrica         := 0;

        // Calculo todas as páginas do Funcionário
        repeat
          if (dtmBaseDados.qry.FieldByName('TIPORUBRICA').asInteger < 2) then
            Inc(iRubrica);
          dtmBaseDados.qry.Next;
        until (sMatricula <> dtmBaseDados.qry.FieldByName('MATRICULA').asString) or
              (dtmBaseDados.qry.EOF);
        if (iRubrica in [01..15]) then wTotPagEmpregado := 1
        else
        if (iRubrica in [16..30]) then wTotPagEmpregado := 2
        else
        if (iRubrica in [31..45]) then wTotPagEmpregado := 3
        else
        if (iRubrica in [46..60]) then wTotPagEmpregado := 4
        else
        if (iRubrica in [61..75]) then wTotPagEmpregado := 5;
        dtmBaseDados.qry.GotoBookmark(Marca);
        dtmBaseDados.qry.FreeBookmark(Marca);

        rBaseINSS:=0; rBaseFGTS:=0; rFGTSMes:=0; rBaseIRRF:=0;
        rProventos:=0; rDescontos:=0;

        // Monto as informações em Páginas por Funcionário
        repeat
          Insert;
          FieldByName('EMPREGADO').asString         := dtmBaseDados.qry.FieldByName('EMPREGADO').asString;
          FieldByName('PAGINA').asInteger           := iPaginaAtual;
          FieldByName('FOLHA').asString             :=
            'Folha: '+IntToStr(iPagina)+' de '+ IntToStr(wTotPagEmpregado);
          FieldByName('MATRICULA').asString         := dtmBaseDados.qry.FieldByName('MATRICULA').asString;
          FieldByName('C_CUSTO').asString           := dtmBaseDados.qry.FieldByName('NOMECENTROCUSTO').asString;
          FieldByName('CARGO').asString             := dtmBaseDados.qry.FieldByName('TITULO').asString;
          FieldByName('EMPRESA').asString           := dtmBaseDados.qry.FieldByName('EMPRESA').asString;
          FieldByName('CGC').asString               := dtmBaseDados.qry.FieldByName('CGC').asString;
          FieldByName('INSCRICAO').asString         := dtmBaseDados.qry.FieldByName('ESTADUALMUNICIPAL').asString;
          FieldByName('ENDERECO').asString          := dtmBaseDados.qry.FieldByName('ENDERECO').asString;
          FieldByName('INIPERIODOFERIAS').asString  := dtmBaseDados.qry.FieldByName('INIPERIODOFERIAS').asString;

          dtPerAquiFinal := StrToDate(IncData(dtmBaseDados.qry.FieldByName('INIPERIODOFERIAS').asString,0,0,1))-1;
          if (dtPerAquiFinal >= dtmBaseDados.qry.FieldByName('INIGOZOFERIAS').asDateTime) then
            FieldByName('FIMPERIODOFERIAS').asString :=
              DateToStr(dtmBaseDados.qry.FieldByName('INIGOZOFERIAS').asDateTime-1)
          else
            FieldByName('FIMPERIODOFERIAS').asString := DateToStr(dtPerAquiFinal);

          FieldByName('INIGOZOFERIAS').asString     := dtmBaseDados.qry.FieldByName('INIGOZOFERIAS').asString;
          FieldByName('FIMGOZOFERIAS').asString     := dtmBaseDados.qry.FieldByName('FIMGOZOFERIAS').asString;
          FieldByName('DIASDEFERIAS').asInteger     :=
            (dtmBaseDados.qry.FieldByName('FIMGOZOFERIAS').Value -
             dtmBaseDados.qry.FieldByName('INIGOZOFERIAS').Value + 1);
          FieldByName('FLGABONO').asInteger         := dtmBaseDados.qry.FieldByName('FLGABONO').asInteger;
          FieldByName('CTPS_NUM').asString          := dtmBaseDados.qry.FieldByName('CTPS_NUM').asString;
          FieldByName('CTPS_UF').asString           := dtmBaseDados.qry.FieldByName('CTPS_UF').asString;

          rMaiorRem := dtmBaseDados.qry.FieldByName('MAIOR_REMUNERACAO').asFloat;
          rSalBase  := dtmBaseDados.qry.FieldByName('SALBASE').asFloat;

          // Preencho cada Linha da Página do Funcionário com suas Rubricas
          iRubrica := 1;
          repeat
            if (dtmBaseDados.qry.FieldByName('TIPORUBRICA').asInteger < 2) then
            begin
              FieldByName('CODRUBRICA'+IntToStr(iRubrica)).asString := dtmBaseDados.qry.FieldByName('CODRUBRICACLIENTE').asString;
              FieldByName('RUBRICA'+IntToStr(iRubrica)).asString    := dtmBaseDados.qry.FieldByName('RUBRICA').asString;
              FieldByName('REFERENCIA'+IntToStr(iRubrica)).asString := dtmBaseDados.qry.FieldByName('REFERENCIA').asString;

              if (dtmBaseDados.qry.FieldByName('TIPORUBRICA').asInteger = 0) then
              begin
                FieldByName('PROVENTO'+IntToStr(iRubrica)).asFloat := dtmBaseDados.qry.FieldByName('VALOR').asFloat;
                rProventos := rProventos + dtmBaseDados.qry.FieldByName('VALOR').asFloat;
              end
              else
              begin
                FieldByName('DESCONTO'+IntToStr(iRubrica)).asFloat := dtmBaseDados.qry.FieldByName('VALOR').asFloat;
                rDescontos := rDescontos + dtmBaseDados.qry.FieldByName('VALOR').asFloat;
              end;
              Inc(iRubrica);
            end
            else
            begin
              // Base do INSS
              if (dtmBaseDados.qry.FieldByName('CODRUBRICA').asString = '60017') then
                rBaseINSS := rBaseINSS + dtmBaseDados.qry.FieldByName('VALOR').asFloat
              else
              // FGTS do Mês
              if (dtmBaseDados.qry.FieldByName('CODRUBRICA').asString = '40695') or
                 (dtmBaseDados.qry.FieldByName('CODRUBRICA').asString = '43696') or
                 (dtmBaseDados.qry.FieldByName('CODRUBRICA').asString = '43700') then
                rFGTSMes := rFGTSMes + dtmBaseDados.qry.FieldByName('VALOR').asFloat
              else
              // Base do FGTS
              if (dtmBaseDados.qry.FieldByName('CODRUBRICA').asString = '60695') or
                 (dtmBaseDados.qry.FieldByName('CODRUBRICA').asString = '62022') then
                rBaseFGTS := rBaseFGTS + dtmBaseDados.qry.FieldByName('VALOR').asFloat
              else
              // Base do IRRF
              if (dtmBaseDados.qry.FieldByName('CODRUBRICA').asString = '60026') then
                rBaseIRRF := rBaseIRRF + dtmBaseDados.qry.FieldByName('VALOR').asFloat;
            end;
            sMatricula := dtmBaseDados.qry.FieldByName('MATRICULA').asString;

            frmAguarde.Pos := frmAguarde.Pos+1;
            dtmBaseDados.qry.Next;
          until (sMatricula <> dtmBaseDados.qry.FieldByName('MATRICULA').asString) or
                (dtmBaseDados.qry.EOF) or
                ((sMatricula = dtmBaseDados.qry.FieldByName('MATRICULA').asString) and
                 (dtmBaseDados.qry.FieldByName('TIPORUBRICA').asInteger < 2) and
                 (iRubrica = 16));

          if (sMatricula <> dtmBaseDados.qry.FieldByName('MATRICULA').asString) or
             (dtmBaseDados.qry.EOF) then
          begin
            FieldByName('MAIOR_REMUNERACAO').asFloat := rMaiorRem;
            FieldByName('SALBASE').asFloat  := rSalBase;
            FieldByName('BASEINSS').asFloat := rBaseINSS;
            FieldByName('BASEFGTS').asFloat := rBaseFGTS;
            FieldByName('FGTSMES').asFloat  := rFGTSMes;
            FieldByName('BASEIRRF').asFloat := rBaseIRRF;
            FieldByName('TOT_PROVENTOS').asFloat   := rProventos;
            FieldByName('TOT_DESCONTOS').asFloat   := rDescontos;
            FieldByName('TOT_GERAL').asString      := ValStr(rProventos - rDescontos,12,2,true,',');
            FieldByName('DESC_TOT_GERAL').asString :=
              'Total Líquido por Extenso: '+Extenso.PorExtensoII(rProventos - rDescontos);
          end
          else
            FieldByName('TOT_GERAL').asString := 'CONTINUA       ';

          Post;
          Inc(iPagina);
          Inc(iPaginaAtual);
        until (sMatricula <> dtmBaseDados.qry.FieldByName('MATRICULA').asString) or
              (dtmBaseDados.qry.EOF);
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

procedure TfrmParamReciboAvisoFerias.HabilitaBtOk;
begin
  bbtnConfirmar.Enabled := (Trim(dtedIni.Text) <> '') and (Trim(dtedFin.Text) <> '') and
    (Trim(dblkcbEstab.Text) <> '') and (Trim(dblkcbMotivo.Text) <> '');
end;

procedure TfrmParamReciboAvisoFerias.MontaListaFuncionarios;
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
      Add('  PESSOA PF, FUNCIONARIO F, FERIAS FE');
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

      Add('  (FE.INIGOZOFERIAS BETWEEN TO_DATE('+
        QuotedStr(dtedIni.Text)+',''DD/MM/YYYY'') AND '+
        'TO_DATE('+QuotedStr(dtedFin.Text)+',''DD/MM/YYYY'')) AND');

      if (rgProcesso.ItemIndex = 0) then
        Add('  (FE.FLGOCORRIDA = 0) AND')
      else
        Add('  (FE.FLGOCORRIDA = 1) AND');

      Add('  (FE.IDPESSOA    = F.IDPESSOA) AND');
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

function TfrmParamReciboAvisoFerias.SelecionaTipoContrato: string;
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
