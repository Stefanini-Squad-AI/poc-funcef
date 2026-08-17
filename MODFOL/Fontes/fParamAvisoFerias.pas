// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamAvisoFerias;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook, Spin,
  checklst, IvDictio, IvMulti, IvEMulti, ComCtrls, wwdbdatetimepicker, fSairAjuda,
  CMDateTimePicker;

type
  TfrmParamAvisoFerias = class(TfrmSairAjuda)
    qryEstab: TwwQuery;
    gbxEstab: TGroupBox;
    dblkcbEstab: TwwDBLookupCombo;
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
    gbxOrdem: TGroupBox;
    cmbOrderBy: TComboBox;
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
    ToolbarSep971: TToolbarSep97;
    bbtnConfirmar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chklstFuncDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure dblkcbEstabChange(Sender: TObject);
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
  frmParamAvisoFerias: TfrmParamAvisoFerias;

implementation

uses uSistema, uMensErro, uDataBase, fAguarde, dBaseDados,
  uFuncoesUteis, UsoGeralRH, uComumRelats, dRelatorios;

{$R *.DFM}

procedure TfrmParamAvisoFerias.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  if not(Assigned(ListaCodFunc)) then
    ListaCodFunc := TStringList.Create;
  IDEstab := -1;

  cmbTipoPapel.Items.Assign (dtmRelatorios.rpAvisoFerias.PrinterSetup.PaperNames);
  iPos := ProcuraStList (cmbTipoPapel.Items,'A4');
  if (iPos = -1) then
    cmbTipoPapel. ItemIndex := 0
  else
    cmbTipoPapel. ItemIndex := iPos;

  FazQuery(dtmBaseDados.qry,'SELECT NORMALINI, NORMALFIM FROM PARAMRH');
  dtedIni.Text := dtmBaseDados.qry.FieldByName('NORMALINI').asString;
  dtedFin.Text := dtmBaseDados.qry.FieldByName('NORMALFIM').asString;

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

  cmbOrderBy.ItemIndex := 0;
  pgctrlEmpregados.ActivePageIndex := 0;

  HabilitaBtOk;
end;

procedure TfrmParamAvisoFerias.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dtmBaseDados.qry.Close;
  qryEstab.Close;
  inherited;
end;

procedure TfrmParamAvisoFerias.chklstFuncDrawItem(Control: TWinControl; Index: Integer;
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

procedure TfrmParamAvisoFerias.dblkcbEstabChange(Sender: TObject);
begin
  if (qryEstab.FieldByName('IDPESSOA').asInteger <> IDEstab) then
  begin
    MontaListaFuncionarios;
    IDEstab := qryEstab.FieldByName('IDPESSOA').asInteger;

    if (pgctrlEmpregados.ActivePageIndex = 0) then
      chklstFunc.Repaint;
  end;
end;

procedure TfrmParamAvisoFerias.dtedIniChange(Sender: TObject);
begin
  try
    StrToDate(TEdit(Sender).Text);
    MontaListaFuncionarios;
  except
  end;
end;

procedure TfrmParamAvisoFerias.gbxTipContraEnter(Sender: TObject);
begin
  bTipContrEfet  := cbxEfetivos.Checked;
  bTipContrEspec := cbxEspeciais.Checked;
  bTipContrTemp  := cbxTemporarios.Checked;
  bTipContrEst   := cbxEstagiarios.Checked;
  bTipContrTerc  := cbxTerceiros.Checked;
  bTipContrProp  := cbxPropDirSemVinc.Checked;
  bTipContrAut   := cbxAutonomos.Checked;
end;

procedure TfrmParamAvisoFerias.gbxTipContraExit(Sender: TObject);
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

procedure TfrmParamAvisoFerias.chklstFuncKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmParamAvisoFerias.chklstFuncClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
  HabilitaBtOk;
end;

procedure TfrmParamAvisoFerias.bbtnSelTodosFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := true;

  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamAvisoFerias.bbtnInverteSelFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := not(chklstFunc.Checked[c]);

  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamAvisoFerias.bbtnConfirmarClick(Sender: TObject);
var
  wNum: word;
begin
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
    Add('  RTRIM(DECODE(RTRIM(ESTADUAL.NUMDOCUMENTO),'''',');
    Add('    DECODE(RTRIM(MUNICIPAL.NUMDOCUMENTO),'''','''',');
    Add('    ''Inscrição Municipal: ''|| MUNICIPAL.NUMDOCUMENTO),');
    Add('    ''Inscrição Estadual: '' || ESTADUAL.NUMDOCUMENTO)) AS ESTADUALMUNICIPAL,');
    Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO ||');
    Add('    DECODE(RTRIM(E.COMPLEMENTO),NULL,'''','' - '' || RTRIM(E.COMPLEMENTO)) ||');
    Add('    DECODE(RTRIM(E.BAIRRO),     NULL,'''','' - '' || RTRIM(E.BAIRRO)) ||');
    Add('    DECODE(RTRIM(CIDADES.NOME), NULL,'''','' - '' || RTRIM(CIDADES.NOME)) ||');
    Add('    '' - CEP:'' || RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS ENDERECO,');
    Add('  ES.CODESTADO   AS UF,');
    Add('  RTRIM(PF.NOME) AS EMPREGADO,');
    Add('  F.MATRICULA,F.CODCENTROCUSTO,');
    Add('  RTRIM(CC.NOME) AS C_CUSTO,');
    Add('  C.TITULO       AS CARGO,');
    Add('  ''CNPJ: '' || PJ.NUMDOCUMENTO AS CGC,');
    Add('  RTRIM(CTPS.NUM) AS CTPS_NUM,');
    Add('  DECODE(CTPS.UF,'''','''',''/''||CTPS.UF) AS CTPS_UF,');
    Add('  CTPS.MASCARA    AS MASCARA_CTPS,');
    Add('  ANT13.MES, ANT13.ANO, ANT13.FLGOCORRIDA,');
    Add('  FERIAS.FLGABONO,');
    Add('  FERIAS.QTDPARCDEVOL,');
    Add('  FERIAS.INIPERIODOFERIAS,');
    Add('  FERIAS.INIGOZOFERIAS,');
    Add('  FERIAS.FIMGOZOFERIAS');
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, FUNCIONARIO F, ENDPESS E, CENTCUST CC, CARGO C,');
    Add('  CIDADES, ESTADO ES, FERIAS,');
//    Add('  CIDADES, ESTADO ES, FERIAS, HORATRAB HT,');
    // -------------------------------------------------------------------- //
    // CTPS do Funcionário
    Add('  (SELECT DP.IDPESSOA, TDP.MASCARA, DP.NUMDOCUMENTO AS NUM, ES.CODESTADO AS UF');
    Add('   FROM   DOCPESSOA DP, ESTADO ES, TIPODOCPESSOA TDP, TIPODOCOFICIAL TDO');
//    Add('   FROM   DOCPESSOA DP, ESTADO ES, TIPODOCPESSOA TDP, TIPODOCOFICIAL TDO, PAIS PA');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''CTPS:'')       AND');
    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO)  AND');
    Add('         (TDO.IDDOCUMENTO    = TDP.IDDOCUMENTO) AND');
    Add('         (DP.IDPAIS          = ES.IDPAIS)       AND');
//    Add('         (DP.IDPAIS          = PA.IDPAIS)       AND');
//    Add('         (PA.IDPAIS          = ES.IDPAIS)       AND');
    Add('         (DP.IDESTADO        = ES.IDESTADO)) CTPS,');
    // -------------------------------------------------------------------------- //
    // Antecipação 13
    Add('  (SELECT IDPESSOA, MES, ANO, FLGOCORRIDA ');
    Add('   FROM   ANTECIP13 ');
    Add('   WHERE (ANO =  SUBSTR('+QuotedStr(dtedIni.Text)+',7,4))) ANT13,');
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
    Add('  (PJ.IDPESSOA           = '+qryEstab.FieldByName('IDPESSOA').asString+') AND');
    Add('  (FERIAS.FLGOCORRIDA    = 0) AND');
    Add('  (FERIAS.INIGOZOFERIAS BETWEEN TO_DATE('+QuotedStr(dtedIni.Text)+',''DD/MM/YYYY'') AND '+
      'TO_DATE('+QuotedStr(dtedFin.Text)+',''DD/MM/YYYY'')) AND');

    // Funcionário(s) selecionado(s)
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

    Add('  (FERIAS.IDPESSOA   = F.IDPESSOA)         AND');
    Add('  (F.IDPESSOA        = CTPS.IDPESSOA)      AND');
    Add('  (F.IDCARGO         = C.IDCARGO)          AND');
    Add('  (F.IDEMPRESA       = CC.IDEMPRESA)       AND');
//    Add('  (F.IDHORARIO       = HT.IDHORARIO)       AND');
    Add('  (F.IDESTAB         = PJ.IDPESSOA)        AND');
    Add('  (F.IDPESSOA        = PF.IDPESSOA)        AND');
    Add('  (PJ.IDPESSOA       = E.IDPESSOA)         AND');
    Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO)       AND');
    Add('  (E.IDCIDADES       = CIDADES.IDCIDADES)     AND');
    Add('  (CIDADES.IDESTADO  = ES.IDESTADO)           AND');
    Add('  (PJ.IDPESSOA       = ESTADUAL.IDPESSOA(+))  AND');
    Add('  (PJ.IDPESSOA       = MUNICIPAL.IDPESSOA(+)) AND');
    Add('  (F.IDPESSOA        = ANT13.IDPESSOA(+))  AND');
    Add('  (F.CODCENTROCUSTO  = CC.CODCENTROCUSTO(+))');
    Add('ORDER BY');
    case (cmbOrderBy.ItemIndex) of
      0 : Add('  EMPRESA, EMPREGADO, MATRICULA');
      1 : Add('  EMPRESA, MATRICULA, EMPREGADO');
      2 : Add('  EMPRESA, CODCENTROCUSTO, EMPREGADO');
      3 : Add('  EMPRESA, CODCENTROCUSTO, MATRICULA');
      4 : Add('  EMPRESA, CODCENTROCUSTO, INIGOZOFERIAS, EMPREGADO');
      5 : Add('  EMPRESA, CODCENTROCUSTO, INIGOZOFERIAS, MATRICULA');
      6 : Add('  INIGOZOFERIAS, EMPRESA, EMPREGADO');
      7 : Add('  INIGOZOFERIAS, EMPRESA, MATRICULA');
      8 : Add('  INIGOZOFERIAS, EMPRESA, CODCENTROCUSTO, EMPREGADO');
      9 : Add('  INIGOZOFERIAS, EMPRESA, CODCENTROCUSTO, MATRICULA');
    end;
    //SaveToFile ('c:\qry.txt');
    SaveToFile (Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt'); //Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;

  // Monta Query Principal
  with (dtmRelatorios) do
  begin
    frmAguarde.Mostra('Aviso de Férias');
    frmAguarde.Pos := 0;

    // Aponto o UpdateSQL para a query Principal
    qryAvisoFerias.UpdateObject := updSQL;

    if not(qryAvisoFerias.IsEmpty) then
      qryAvisoFerias.CancelUpdates;
    qryAvisoFerias.Close;
    qryAvisoFerias.Open;

    // Processa dados para a geração da query
    dtmBaseDados.qry.Open;
    GravaDadosQuery;
    qryAvisoFerias.First;

    // Especifico Configurações do Relatório
    rpAvisoFerias.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
  end;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------
procedure TfrmParamAvisoFerias.GravaDadosQuery;
var
  dtPerAquiFinal: TDateTime;
begin
  with (dtmRelatorios.qryAvisoFerias) do
  begin
    if not(dtmBaseDados.qry.IsEmpty) then
    begin
      frmAguarde.Min := 0;
      frmAguarde.Max := dtmBaseDados.qry.RecordCount;

      if (Trim(dtmBaseDados.qry.FieldByName('MASCARA_CTPS').asString) <> '') then
        dtmRelatorios.AvisoFeriasDbTxt7.DisplayFormat :=
          dtmBaseDados.qry.FieldByName('MASCARA_CTPS').asString+';0;_';

      repeat
        Insert;
        FieldByName('EMPREGADO').asString        := dtmBaseDados.qry.FieldByName('EMPREGADO').asString;
        FieldByName('MATRICULA').asString        := dtmBaseDados.qry.FieldByName('MATRICULA').asString;
        FieldByName('C_CUSTO').asString          := dtmBaseDados.qry.FieldByName('C_CUSTO').asString;
        FieldByName('CARGO').asString            := dtmBaseDados.qry.FieldByName('CARGO').asString;
        FieldByName('EMPRESA').asString          := dtmBaseDados.qry.FieldByName('EMPRESA').asString;
        FieldByName('CGC').asString              := dtmBaseDados.qry.FieldByName('CGC').asString;
        FieldByName('INSCRICAO').asString        := dtmBaseDados.qry.FieldByName('ESTADUALMUNICIPAL').asString;
        FieldByName('ENDERECO').asString         := dtmBaseDados.qry.FieldByName('ENDERECO').asString;
        FieldByName('UF').asString               := dtmBaseDados.qry.FieldByName('UF').asString;
        FieldByName('INIPERIODOFERIAS').asString := dtmBaseDados.qry.FieldByName('INIPERIODOFERIAS').asString;
        FieldByName('QTDPARCDEVOL').asInteger    := dtmBaseDados.qry.FieldByName('QTDPARCDEVOL').asInteger;

        if dtmBaseDados.qry.FieldByName('ANO').asInteger > 0 then
           FieldByName('ANTECIPACAO13').asString :=
              LongMonthNames[dtmBaseDados.qry.FieldByName('MES').asInteger] + ' de ' +
              dtmBaseDados.qry.FieldByName('ANO').asString +
              iff(dtmBaseDados.qry.FieldByName('FLGOCORRIDA').asInteger=1,' (Já Concedida)',' ')
        else
          FieldByName('ANTECIPACAO13').asString := 'Não Programada';

        dtPerAquiFinal := StrToDate(IncData(dtmBaseDados.qry.FieldByName('INIPERIODOFERIAS').asString,0,0,1))-1;
        if (dtPerAquiFinal >= dtmBaseDados.qry.FieldByName('INIGOZOFERIAS').asDateTime) then
          FieldByName('FIMPERIODOFERIAS').asString :=
            DateToStr(dtmBaseDados.qry.FieldByName('INIGOZOFERIAS').asDateTime-1)
        else
          FieldByName('FIMPERIODOFERIAS').asString := DateToStr(dtPerAquiFinal);

        FieldByName('INIGOZOFERIAS').asString := dtmBaseDados.qry.FieldByName('INIGOZOFERIAS').asString;
        FieldByName('FIMGOZOFERIAS').asString := dtmBaseDados.qry.FieldByName('FIMGOZOFERIAS').asString;
        FieldByName('DIASDEFERIAS').asInteger :=
          (dtmBaseDados.qry.FieldByName('FIMGOZOFERIAS').Value -
           dtmBaseDados.qry.FieldByName('INIGOZOFERIAS').Value + 1);
        FieldByName('FLGABONO').asInteger     := dtmBaseDados.qry.FieldByName('FLGABONO').asInteger;
        FieldByName('CTPS_NUM').asString      := dtmBaseDados.qry.FieldByName('CTPS_NUM').asString;
        FieldByName('CTPS_UF').asString       := dtmBaseDados.qry.FieldByName('CTPS_UF').asString;
        Post;

        frmAguarde.Pos := frmAguarde.Pos+1;

        dtmBaseDados.qry.Next;
      until (dtmBaseDados.qry.EOF);
    end
    else
    begin
      ModalResult := mrNone;
      frmAguarde.Apaga;
      MsgDlg('Não há dados a serem exibidos! Verifique.','Aviso',mtInformation,[mbOk,mbHelp],0);
    end;
  end;
end;

procedure TfrmParamAvisoFerias.HabilitaBtOk;
begin
  bbtnConfirmar.Enabled := (Trim(dtedIni.Text) <> '') and (Trim(dtedFin.Text) <> '') and
    (Trim(dblkcbEstab.Text) <> '');
end;

procedure TfrmParamAvisoFerias.MontaListaFuncionarios;
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

      Add('  (FE.INIGOZOFERIAS BETWEEN TO_DATE(' + QuotedStr(dtedIni.Text) +
          ',''DD/MM/YYYY'') AND ' +
          'TO_DATE('+QuotedStr(dtedFin.Text)+',''DD/MM/YYYY'')) AND');
      Add('  (FE.FLGOCORRIDA = 0)          AND');
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

function TfrmParamAvisoFerias.SelecionaTipoContrato: string;
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
