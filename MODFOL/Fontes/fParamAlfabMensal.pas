// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamAlfabMensal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db,
  DBTables, Wwquery, Wwdatsrc, Mask, wwdbedit, Wwdotdot, Wwdbcomb, Machklb,
  wwdblook, checklst, TREdit, Spin, IvDictio, IvMulti, IvEMulti,
  ComCtrls, Grids, Wwdbigrd, IniFiles, Wwdbgrid, FSairAjuda;

type
  TRegTitulo = record
    Linha1, Linha2: string;
  end;

  TfrmParamAlfabMensal = class(TfrmSairAjuda)
    qryEstab: TwwQuery;
    gbxEstab: TGroupBox;
    dblkcbEstab: TwwDBLookupCombo;
    gbxOrdem: TGroupBox;
    cmbOrderBy: TComboBox;
    gbxTitulo: TGroupBox;
    edTitulo: TEdit;
    gbxAnoMesRef: TGroupBox;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
    pgctrlPaginas: TPageControl;
    tbshRubricas: TTabSheet;
    Label1: TLabel;
    pgctrlPaginas2: TPageControl;
    tbshColuna1: TTabSheet;
    chklstRubrica1: TCheckListBox;
    tbshColuna2: TTabSheet;
    chklstRubrica2: TCheckListBox;
    tbshColuna3: TTabSheet;
    chklstRubrica3: TCheckListBox;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    gbxTituloColunas: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    edTituloLinha1: TEdit;
    edTituloLinha2: TEdit;
    edCodRubricas: TEdit;
    sbtnMarcarRub: TBitBtn;
    tbshTipoEmpr: TTabSheet;
    gbxTipContra: TGroupBox;
    cbxEfetivos: TCheckBox;
    cbxEspeciais: TCheckBox;
    cbxTemporarios: TCheckBox;
    cbxEstagiarios: TCheckBox;
    cbxTerceiros: TCheckBox;
    cbxPropDirSemVinc: TCheckBox;
    cbxAutonomos: TCheckBox;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    gbxSituacao: TGroupBox;
    cbxAtivos: TCheckBox;
    cbxAfastados: TCheckBox;
    cbxDemitidos: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnMarcarRubClick(Sender: TObject);
    procedure chklstRubrica1DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure chklstRubrica1ClickCheck(Sender: TObject);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure pgctrlPaginas2Change(Sender: TObject);
    procedure dblkcbEstabChange(Sender: TObject);
    procedure edTituloLinha1Change(Sender: TObject);
    procedure gbxTipContraExit(Sender: TObject);
    procedure gbxSituacaoExit(Sender: TObject);
    procedure chklstRubrica1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    regTituloLinha: array[1..3] of TRegTitulo;
    LiRubrica1, LiRubrica2, LiRubrica3: string;

    procedure LeAlteracoes;
    procedure GravaAlteracoes;
    procedure HabilitaBtOk;
    function  SelecionaTipoContrato: string;
    function  SelecionaSitFunc: string;
  end;

var
  frmParamAlfabMensal: TfrmParamAlfabMensal;

implementation

uses uSistema, uMensErro, uDataBase, fAguarde, dBaseDados,
  uFuncoesUteis, UsoGeralRH, uComumRelats, dRelatorios2;

{$R *.DFM}

procedure TfrmParamAlfabMensal.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  if not(Assigned(ListaCodRubrica)) then
    ListaCodRubrica := TStringList.Create;

  cmbTipoPapel.Items.Assign (dtmRelatorios2.rpAlfabMensal.PrinterSetup.PaperNames);

  iPos := ProcuraStList (cmbTipoPapel.Items,'A4');
  if (iPos = -1) then
    cmbTipoPapel. ItemIndex := 0
  else
    cmbTipoPapel. ItemIndex := iPos;

  FazQuery(dtmBaseDados.qry,'SELECT NORMALINI FROM PARAMRH');
  cmbMes.ItemIndex := ExtraiMes(dtmBaseDados.qry.FieldByName('NORMALINI').asDateTime) - 1;
  speAno.Text      := Copy(dtmBaseDados.qry.FieldByName('NORMALINI').asString,7,4);

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
  chklstRubrica1.Items.Clear;
  chklstRubrica2.Items.Clear;
  chklstRubrica3.Items.Clear;
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
      chklstRubrica1.Items.Add(FieldByName('DESCRPROVDESC').asString);
      chklstRubrica2.Items.Add(FieldByName('DESCRPROVDESC').asString);
      chklstRubrica3.Items.Add(FieldByName('DESCRPROVDESC').asString);
      Next;
    end;
  end;

  cmbOrderBy.ItemIndex := 0;
  pgctrlPaginas.ActivePageIndex  := 0;
  pgctrlPaginas2.ActivePageIndex := 0;
  edTituloLinha1.Text := '';
  edTituloLinha2.Text := '';

  // Carrega alterações nas opções feitas anteriormente
  LeAlteracoes;
end;

procedure TfrmParamAlfabMensal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GravaAlteracoes;

  dtmBaseDados.qry.Close;  
  qryEstab.Close;
  inherited;
end;

procedure TfrmParamAlfabMensal.chklstRubrica1DrawItem(Control: TWinControl; Index: Integer;
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

procedure TfrmParamAlfabMensal.dblkcbEstabChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamAlfabMensal.pgctrlPaginas2Change(Sender: TObject);
begin
  case (pgctrlPaginas2.ActivePageIndex) of
    0 : edCodRubricas.Text := LiRubrica1;
    1 : edCodRubricas.Text := LiRubrica2;
    2 : edCodRubricas.Text := LiRubrica3;
  end;

  edTituloLinha1.Text := regTituloLinha[pgctrlPaginas2.ActivePageIndex+1].Linha1;
  edTituloLinha2.Text := regTituloLinha[pgctrlPaginas2.ActivePageIndex+1].Linha2;
end;

procedure TfrmParamAlfabMensal.edTituloLinha1Change(Sender: TObject);
begin
  case (pgctrlPaginas2.ActivePageIndex) of
    0 : begin
          if (TEdit(Sender).Name = 'edTituloLinha1') then
            regTituloLinha[1].Linha1 := edTituloLinha1.Text
          else
            regTituloLinha[1].Linha2 := edTituloLinha2.Text;
        end;
    1 : begin
          if (TEdit(Sender).Name = 'edTituloLinha1') then
            regTituloLinha[2].Linha1 := edTituloLinha1.Text
          else
            regTituloLinha[2].Linha2 := edTituloLinha2.Text;
        end;
    2 : begin
          if (TEdit(Sender).Name = 'edTituloLinha1') then
            regTituloLinha[3].Linha1 := edTituloLinha1.Text
          else
            regTituloLinha[3].Linha2 := edTituloLinha2.Text;
        end;
  end;
  HabilitaBtOk;
end;

procedure TfrmParamAlfabMensal.chklstRubrica1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    chklstRubrica1ClickCheck(Sender);
end;

procedure TfrmParamAlfabMensal.gbxTipContraExit(Sender: TObject);
begin
  if not(cbxEfetivos.Checked)       and not(cbxEspeciais.Checked) and
     not(cbxTemporarios.Checked)    and not(cbxTerceiros.Checked) and
     not(cbxPropDirSemVinc.Checked) and not(cbxAutonomos.Checked) and
     not(cbxEstagiarios.Checked) then
  begin
    MsgDlg ('Pelo menos um Tipo de Contrato deve ser selecionado !','Aviso', mtInformation,[mbOk,mbHelp],0);
    cbxEfetivos.SetFocus;
  end;
end;

procedure TfrmParamAlfabMensal.gbxSituacaoExit(Sender: TObject);
begin
  if not(cbxAtivos.Checked) and not(cbxAfastados.Checked) and not(cbxDemitidos.Checked) then
  begin
    MsgDlg ('Pelo menos um Tipo de Situação deve ser selecionado !', 'Aviso',
      mtInformation, [mbOk,mbHelp], 0);
    cbxAtivos.SetFocus;
  end;
end;

procedure TfrmParamAlfabMensal.chklstRubrica1ClickCheck(Sender: TObject);
begin
  case (pgctrlPaginas2.ActivePageIndex) of
    0 : begin
          CriaListaOpcoes (chklstRubrica1, ListaCodRubrica, LiRubrica1, ',', false);
          edCodRubricas.Text := LiRubrica1;
        end;
    1 : begin
          CriaListaOpcoes (chklstRubrica2, ListaCodRubrica, LiRubrica2, ',', false);
          edCodRubricas.Text := LiRubrica2;
        end;
    2 : begin
          CriaListaOpcoes (chklstRubrica3, ListaCodRubrica, LiRubrica3, ',', false);
          edCodRubricas.Text := LiRubrica3;
        end;
  end;
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
  HabilitaBtOk;
end;

procedure TfrmParamAlfabMensal.sbtnMarcarRubClick(Sender: TObject);
begin
  edCodRubricas.Text := Trim(edCodRubricas.Text);

  case (pgctrlPaginas2.ActivePageIndex) of
    0 : begin
          VerificaOpcoes (chklstRubrica1, ListaCodRubrica, edCodRubricas.Text, ',');
          LiRubrica1 := edCodRubricas.Text;
          chklstRubrica1.Repaint;
        end;
    1 : begin
          VerificaOpcoes (chklstRubrica2, ListaCodRubrica, edCodRubricas.Text, ',');
          LiRubrica2 := edCodRubricas.Text;
          chklstRubrica2.Repaint;
        end;
    2 : begin
          VerificaOpcoes (chklstRubrica3, ListaCodRubrica, edCodRubricas.Text, ',');
          LiRubrica3 := edCodRubricas.Text;
          chklstRubrica3.Repaint;
        end;
  end;
  HabilitaBtOk;
end;

procedure TfrmParamAlfabMensal.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  case (pgctrlPaginas2.ActivePageIndex) of
    0 : chkListAux := chklstRubrica1;
    1 : chkListAux := chklstRubrica2;
    2 : chkListAux := chklstRubrica3;
  end;

  for c:=0 to chkListAux.Items.Count-1 do
    chkListAux.Checked[c] := true;

  case (pgctrlPaginas2.ActivePageIndex) of
    0 : begin
          CriaListaOpcoes (chklstRubrica1, ListaCodRubrica, LiRubrica1, ',', false);
          edCodRubricas.Text := LiRubrica1;
        end;
    1 : begin
          CriaListaOpcoes (chklstRubrica2, ListaCodRubrica, LiRubrica2, ',', false);
          edCodRubricas.Text := LiRubrica2;
        end;
    2 : begin
          CriaListaOpcoes (chklstRubrica3, ListaCodRubrica, LiRubrica3, ',', false);
          edCodRubricas.Text := LiRubrica3;
        end;
  end;
  chkListAux.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamAlfabMensal.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  case (pgctrlPaginas2.ActivePageIndex) of
    0 : begin
          for c:=0 to chklstRubrica1.Items.Count-1 do
            chklstRubrica1.Checked[c] := not(chklstRubrica1.Checked[c]);

          CriaListaOpcoes (chklstRubrica1, ListaCodRubrica, LiRubrica1, ',', false);
          edCodRubricas.Text := LiRubrica1;
          chklstRubrica1.Repaint;
        end;
    1 : begin
          for c:=0 to chklstRubrica2.Items.Count-1 do
            chklstRubrica2.Checked[c] := not(chklstRubrica2.Checked[c]);

          CriaListaOpcoes (chklstRubrica2, ListaCodRubrica, LiRubrica2, ',', false);
          edCodRubricas.Text := LiRubrica2;
          chklstRubrica2.Repaint;
        end;
    2 : begin
          for c:=0 to chklstRubrica3.Items.Count-1 do
            chklstRubrica3.Checked[c] := not(chklstRubrica3.Checked[c]);

          CriaListaOpcoes (chklstRubrica3, ListaCodRubrica, LiRubrica3, ',', false);
          edCodRubricas.Text := LiRubrica3;
          chklstRubrica3.Repaint;
        end;
  end;
  HabilitaBtOk;
end;

procedure TfrmParamAlfabMensal.bbtnConfirmarClick(Sender: TObject);
var
  sMes: string;
begin
  // Inicia variáveis
  sMes := QuotedStr(speAno.Text +'/'+ PoeZero(cmbMes.ItemIndex+1));

  // Rubricas para Remuneração selecionadas
  CriaListaOpcoes (chklstRubrica1, ListaCodRubrica, LiRubrica1, ',', true);
  if (LiRubrica1 = '') then
    LiRubrica1 := QuotedStr('-1');

  // Rubricas para Contribuição selecionadas
  CriaListaOpcoes (chklstRubrica2, ListaCodRubrica, LiRubrica2, ',', true);
  if (LiRubrica2 = '') then
    LiRubrica2 := QuotedStr('-1');

  // Rubricas para Anuênio selecionadas
  CriaListaOpcoes (chklstRubrica3, ListaCodRubrica, LiRubrica3, ',', true);
  if (LiRubrica3 = '') then
    LiRubrica3 := QuotedStr('-1');

  // Monto Query conforme a seleção do usuário
  dtmRelatorios2.qryAlfabMensal.Close;
  with (dtmRelatorios2.qryAlfabMensal.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  PJ.RAZAOSOCIAL AS EMPRESA,');
    Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO || DECODE(E.COMPLEMENTO,NULL,NULL,'' - '' ||');
    Add('    RTRIM(E.COMPLEMENTO)) ||'' - ''|| RTRIM(E.BAIRRO) ||'' - ''||');
    Add('    RTRIM(CIDADES.NOME) ||'' - CEP:''||');
    Add('    RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS ENDERECO,');
    Add('  ES.CODESTADO AS UF,');
    Add('  DECODE(PJ.NUMDOCUMENTO,NULL,NULL,''CNPJ: '' || PJ.NUMDOCUMENTO) AS CGC,');
    Add('  F.MATRICULA,');
    Add('  UPPER(RTRIM(PF.NOME)) AS EMPREGADO,');
    Add('  UPPER(RTRIM(CC.NOME)) AS NOMECENTROCUSTO, CC.CODREDUZIDO,');
    Add('  F.DATAADMISSAO,');
    Add('  RTRIM(DECODE(HST_CARGO.TITULO,NULL,C.TITULO,HST_CARGO.TITULO)) AS CARGO,');
    Add('  DECODE(VALSALARIO.VALOR,NULL,F.SALARIOATUAL,VALSALARIO.VALOR) AS VAL_SALARIO,');
    Add('  NVL(GRATIFFUNC.VALOR,0) AS GRATIF_FUNC,');
    Add('  NVL(ANUENIO.VALOR,0)    AS VAL_ANUENIO,');
    Add('  (DECODE(VALSALARIO.VALOR,NULL,F.SALARIOATUAL,VALSALARIO.VALOR) +');
    Add('     NVL(GRATIFFUNC.VALOR,0) + NVL(ANUENIO.VALOR,0)) AS VAL_TOTAL');
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, ENDPESS E, FUNCIONARIO F, ESTADO ES, CIDADES,');
    Add('  CARGO C, CENTCUST CC, SITFUNC ST,');
    // -----------------------------------------------------------------------
    Add('  (SELECT H.MES, H.IDPESSOA, SUM(H.VALORPROVENTO) AS VALOR');
    Add('   FROM   HISTRUBSAL H, FUNCIONARIO F, SITFUNC ST');
    Add('   WHERE  (F.IDESTAB         = '+qryEstab.FieldByName('IDPESSOA').asString+') AND');

    sAux := SelecionaSitFunc;
    if (Pos(',',sAux) > 0) then
      Add('          (ST.TIPOSIT       IN (' +sAux+ ')) AND')
    else
      Add('          (ST.TIPOSIT        = ' +sAux+ ') AND');

    sAux := SelecionaTipoContrato;
    if (Pos(',',sAux) > 0) then
      Add('          (F.TIPOCONTRATO   IN (' +sAux+ ')) AND')
    else
      Add('          (F.TIPOCONTRATO    = ' +sAux+ ') AND');

    // C. de Custo(s) habilitado(s) para o usuário
    if (sUsuXccusto <> '') then
      Add('          (F.CODCENTROCUSTO IN ' +sUsuXccusto+ ') AND');

    if (Pos(',',LiRubrica1) > 0) then
      Add('          (H.CODPROVDESC    IN (' +LiRubrica1+ ')) AND')
    else
      Add('          (H.CODPROVDESC     = ' +LiRubrica1+ ') AND');

    Add('          (H.MES             = '+sMes+') AND');
    Add('          (ST.IDSITFUNC      = F.IDSITFUNC) AND');
    Add('          (F.IDPESSOA        = H.IDPESSOA)');
    Add('   GROUP BY H.MES, H.IDPESSOA) VALSALARIO,');
    // -----------------------------------------------------------------------
    Add('  (SELECT H.MES, H.IDPESSOA, SUM(H.VALORPROVENTO) AS VALOR');
    Add('   FROM   HISTRUBSAL H, FUNCIONARIO F, SITFUNC ST');
    Add('   WHERE  (F.IDESTAB         = '+qryEstab.FieldByName('IDPESSOA').asString+') AND');

    sAux := SelecionaSitFunc;
    if (Pos(',',sAux) > 0) then
      Add('          (ST.TIPOSIT       IN (' +sAux+ ')) AND')
    else
      Add('          (ST.TIPOSIT        = ' +sAux+ ') AND');

    sAux := SelecionaTipoContrato;
    if (Pos(',',sAux) > 0) then
      Add('          (F.TIPOCONTRATO   IN (' +sAux+ ')) AND')
    else
      Add('          (F.TIPOCONTRATO    = ' +sAux+ ') AND');

    // C. de Custo(s) habilitado(s) para o usuário
    if (sUsuXccusto <> '') then
      Add('          (F.CODCENTROCUSTO IN ' +sUsuXccusto+ ') AND');

    if (Pos(',',LiRubrica2) > 0) then
      Add('          (H.CODPROVDESC    IN (' +LiRubrica2+ ')) AND')
    else
      Add('          (H.CODPROVDESC     = ' +LiRubrica2+ ') AND');

    Add('          (H.MES             = '+sMes+') AND');
    Add('          (ST.IDSITFUNC      = F.IDSITFUNC) AND');
    Add('          (F.IDPESSOA        = H.IDPESSOA)');
    Add('   GROUP BY H.MES, H.IDPESSOA) GRATIFFUNC,');
    // -----------------------------------------------------------------------
    Add('  (SELECT H.MES, H.IDPESSOA, SUM(H.VALORPROVENTO) AS VALOR');
    Add('   FROM   HISTRUBSAL H, FUNCIONARIO F, SITFUNC ST');
    Add('   WHERE  (F.IDESTAB         = '+qryEstab.FieldByName('IDPESSOA').asString+') AND');

    sAux := SelecionaSitFunc;
    if (Pos(',',sAux) > 0) then
      Add('          (ST.TIPOSIT       IN (' +sAux+ ')) AND')
    else
      Add('          (ST.TIPOSIT        = ' +sAux+ ') AND');

    sAux := SelecionaTipoContrato;
    if (Pos(',',sAux) > 0) then
      Add('          (F.TIPOCONTRATO   IN (' +sAux+ ')) AND')
    else
      Add('          (F.TIPOCONTRATO    = ' +sAux+ ') AND');

    // C. de Custo(s) habilitado(s) para o usuário
    if (sUsuXccusto <> '') then
      Add('          (F.CODCENTROCUSTO IN ' +sUsuXccusto+ ') AND');

    if (Pos(',',LiRubrica3) > 0) then
      Add('          (H.CODPROVDESC    IN (' +LiRubrica3+ ')) AND')
    else
      Add('          (H.CODPROVDESC     = ' +LiRubrica3+ ') AND');

    Add('          (H.MES             = '+sMes+') AND');
    Add('          (ST.IDSITFUNC      = F.IDSITFUNC) AND');    
    Add('          (F.IDPESSOA        = H.IDPESSOA)');
    Add('   GROUP BY H.MES, H.IDPESSOA) ANUENIO,');
    // -----------------------------------------------------------------------
    // Última evolução Funcional do Funcionário
    Add('  (SELECT CARGO.IDCARGO, CARGO.TITULO, EVOL.IDPESSOA');
    Add('   FROM   EVOLFUNC EVOL, CARGO');
    Add('   WHERE  (CARGO.IDCARGO      = EVOL.IDCARGO) AND');
    Add('          (EVOL.DATAALTERFUNC = (SELECT MAX(DATAALTERFUNC)');
    Add('                                 FROM   EVOLFUNC');
    Add('                                 WHERE  (EVOLFUNC.IDPESSOA       = EVOL.IDPESSOA) AND');
    Add('                                        (EVOLFUNC.DATAALTERFUNC <= TO_DATE('+
      QuotedStr(IntToStr(TrazUltDiaMes(cmbMes.ItemIndex+1, speAno.Value)) +'/'+
      PoeZero(cmbMes.ItemIndex+1) +'/'+ speAno.Text)+
      ',''DD/MM/YYYY''))))) HST_CARGO');
    // -----------------------------------------------------------------------
    Add('WHERE');
    Add('  (PJ.IDPESSOA       = '+qryEstab.FieldByName('IDPESSOA').asString+') AND');

    sAux := SelecionaSitFunc;
    if (Pos(',',sAux) > 0) then
      Add('  (ST.TIPOSIT       IN (' +sAux+ ')) AND')
    else
      Add('  (ST.TIPOSIT        = ' +sAux+ ') AND');

    sAux := SelecionaTipoContrato;
    if (Pos(',',sAux) > 0) then
      Add('  (F.TIPOCONTRATO   IN (' +sAux+ ')) AND')
    else
      Add('  (F.TIPOCONTRATO    = ' +sAux+ ') AND');

    // C. de Custo(s) habilitado(s) para o usuário
    if (sUsuXccusto <> '') then
      Add('  (F.CODCENTROCUSTO IN ' +sUsuXccusto+ ') AND');

    Add('  (F.DATAADMISSAO   <= TO_DATE(' +
      QuotedStr(IntToStr(TrazUltDiaMes(cmbMes.ItemIndex+1, speAno.Value)) +'/'+
      PoeZero(cmbMes.ItemIndex+1) +'/'+ speAno.Text)+',''DD/MM/YYYY'')) AND');

    Add('  (ST.IDSITFUNC      = F.IDSITFUNC)       AND');
    Add('  (PJ.IDPESSOA       = E.IDPESSOA)        AND');
    Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO)      AND');
    Add('  (E.IDCIDADES       = CIDADES.IDCIDADES) AND');
    Add('  (CIDADES.IDESTADO  = ES.IDESTADO)       AND');
    Add('  (PJ.IDPESSOA       = F.IDESTAB)         AND');
    Add('  (F.IDPESSOA        = PF.IDPESSOA)       AND');
    Add('  (F.CODCENTROCUSTO  = CC.CODCENTROCUSTO) AND');
    Add('  (F.IDEMPRESA       = CC.IDEMPRESA)      AND');
    Add('  (F.IDCARGO         = C.IDCARGO)         AND');
    Add('  (F.IDPESSOA        = HST_CARGO.IDPESSOA(+))  AND');
    Add('  (F.IDPESSOA        = VALSALARIO.IDPESSOA(+)) AND');
    Add('  (F.IDPESSOA        = ANUENIO.IDPESSOA(+))    AND');
    Add('  (F.IDPESSOA        = GRATIFFUNC.IDPESSOA(+))');
    Add('ORDER BY');
    case (cmbOrderBy.ItemIndex) of
      0 : Add('  UPPER(EMPREGADO)');
      1 : Add('  MATRICULA');
      2 : Add('  UPPER(CARGO), UPPER(EMPREGADO)');
      3 : Add('  UPPER(CARGO), UPPER(MATRICULA)');
      4 : Add('  UPPER(NOMECENTROCUSTO), UPPER(EMPREGADO)');
      5 : Add('  UPPER(NOMECENTROCUSTO), MATRICULA');
    end;
    //SaveToFile ('c:\qry.txt');
    SaveToFile (Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt'); //Ádler Teodoro de Souza SOL 109421 KINTANA 496332

  end;

  frmAguarde.Mostra('Rel. de Empregados Alfabética Mensal');
  frmAguarde.Pos := 0;
  dtmRelatorios2.qryAlfabMensal.Open;

  if (dtmRelatorios2.qryAlfabMensal.IsEmpty) then
  begin
    ModalResult := mrNone;
    frmAguarde.Apaga;
    MsgDlg('Não há dados a serem exibidos! Verifique.','Aviso',mtInformation,[mbOk,mbHelp],0);
    exit;
  end;

  with (dtmRelatorios2) do
  begin
    rpAlfabMensalLblTitulo1Linha1.Caption := regTituloLinha[1].Linha1;
    rpAlfabMensalLblTitulo1Linha2.Caption := regTituloLinha[1].Linha2;
    rpAlfabMensalLblTitulo2Linha1.Caption := regTituloLinha[2].Linha1;
    rpAlfabMensalLblTitulo2Linha2.Caption := regTituloLinha[2].Linha2;
    rpAlfabMensalLblTitulo3Linha1.Caption := regTituloLinha[3].Linha1;
    rpAlfabMensalLblTitulo3Linha2.Caption := regTituloLinha[3].Linha2;

    rpAlfabMensalLblTITULO.Caption := edTitulo.Text;
    rpAlfabMensallblMesRef.Caption := 'Mês de Referência : '+
      MesExtensoAno(speAno.Text +'/'+ PoeZero(cmbMes.ItemIndex+1));

    rpAlfabMensal.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
  end;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------
procedure TfrmParamAlfabMensal.LeAlteracoes;
var
  c: integer;
  sTitulo, sEstab: string;
begin
  // Recupera as últimas alterações das opções
  //ArqConfig  := TIniFile.Create('C:\CONFIG_FOLHAPAGTO.INI');
  ArqConfig  := TIniFile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CONFIG_FOLHAPAGTO.INI'); //Ádler Teodoro de Souza SOL 109421 KINTANA 496332

  sEstab     := ArqConfig.ReadString ('REL_ALFABMENSAL', 'Estabelec', '');
  LiRubrica1 := ArqConfig.ReadString ('REL_ALFABMENSAL', 'Rubricas1', '');
  LiRubrica2 := ArqConfig.ReadString ('REL_ALFABMENSAL', 'Rubricas2', '');
  LiRubrica3 := ArqConfig.ReadString ('REL_ALFABMENSAL', 'Rubricas3', '');
  sTitulo    := ArqConfig.ReadString ('REL_ALFABMENSAL', 'Titulo', 'Relação de Empregados Alfabética Mensal');

  cbxEfetivos.Checked       := (ArqConfig.ReadString ('REL_ALFABMENSAL', 'Efetivos'     , 'V') = 'V');
  cbxEspeciais.Checked      := (ArqConfig.ReadString ('REL_ALFABMENSAL', 'Especiais'    , 'V') = 'V');
  cbxTemporarios.Checked    := (ArqConfig.ReadString ('REL_ALFABMENSAL', 'Temporarios'  , 'F') = 'V');
  cbxTerceiros.Checked      := (ArqConfig.ReadString ('REL_ALFABMENSAL', 'Terceiros'    , 'F') = 'V');
  cbxEstagiarios.Checked    := (ArqConfig.ReadString ('REL_ALFABMENSAL', 'Estagiarios'  , 'V') = 'V');
  cbxPropDirSemVinc.Checked := (ArqConfig.ReadString ('REL_ALFABMENSAL', 'Proprietarios', 'F') = 'V');
  cbxAutonomos.Checked      := (ArqConfig.ReadString ('REL_ALFABMENSAL', 'Autonomos'    , 'F') = 'V');

  for c:=1 to 3 do
  begin
    regTituloLinha[c].Linha1 := ArqConfig.ReadString ('REL_ALFABMENSAL', 'Coluna'+IntToStr(c)+'Linha1', '');
    regTituloLinha[c].Linha2 := ArqConfig.ReadString ('REL_ALFABMENSAL', 'Coluna'+IntToStr(c)+'Linha2', '');
  end;

  VerificaOpcoes(chklstRubrica1, ListaCodRubrica,  LiRubrica1, ',');
  VerificaOpcoes(chklstRubrica2, ListaCodRubrica,  LiRubrica2, ',');
  VerificaOpcoes(chklstRubrica3, ListaCodRubrica,  LiRubrica3, ',');

  if (sEstab = '') then
  begin
    qryEstab.First;
    sEstab := qryEstab.FieldByName('IDPESSOA').asString;
  end;
  dblkcbEstab.LookUpValue := sEstab;
  dblkcbEstab.UpDate;

  edTitulo.Text       := sTitulo;
  edCodRubricas.Text  := LiRubrica1;
  edTituloLinha1.Text := regTituloLinha[1].Linha1;
  edTituloLinha2.Text := regTituloLinha[1].Linha2;

  HabilitaBtOk;
end;

procedure TfrmParamAlfabMensal.GravaAlteracoes;
var
  c: integer;
begin
  // Grava as últimas alterações da Opção de Rubricas 1
  CriaListaOpcoes (chklstRubrica1, ListaCodRubrica, LiRubrica1, ',', false);
  ArqConfig.WriteString ('REL_ALFABMENSAL','Rubricas1',LiRubrica1);

  // Grava as últimas alterações da Opção de Rubricas 2
  CriaListaOpcoes (chklstRubrica2, ListaCodRubrica, LiRubrica2, ',', false);
  ArqConfig.WriteString ('REL_ALFABMENSAL','Rubricas2',LiRubrica2);

  // Grava as últimas alterações da Opção de Rubricas 3
  CriaListaOpcoes (chklstRubrica3, ListaCodRubrica, LiRubrica3, ',', false);
  ArqConfig.WriteString ('REL_ALFABMENSAL','Rubricas3',LiRubrica3);

  // Grava o Título do Relatório
  ArqConfig.WriteString ('REL_ALFABMENSAL','Titulo',edTitulo.Text);

  ArqConfig.WriteString ('REL_ALFABMENSAL','Estabelec',qryEstab.FieldByName('IDPESSOA').asString);

  for c:=1 to 3 do
  begin
    ArqConfig.WriteString ('REL_ALFABMENSAL', 'Coluna'+IntToStr(c)+'Linha1', regTituloLinha[c].Linha1);
    ArqConfig.WriteString ('REL_ALFABMENSAL', 'Coluna'+IntToStr(c)+'Linha2', regTituloLinha[c].Linha2);
  end;

  ArqConfig.WriteString ('REL_ALFABMENSAL', 'Efetivos'     , IFF(cbxEfetivos.Checked,'V','F'));
  ArqConfig.WriteString ('REL_ALFABMENSAL', 'Especiais'    , IFF(cbxEspeciais.Checked,'V','F'));
  ArqConfig.WriteString ('REL_ALFABMENSAL', 'Temporarios'  , IFF(cbxTemporarios.Checked,'V','F'));
  ArqConfig.WriteString ('REL_ALFABMENSAL', 'Terceiros'    , IFF(cbxTerceiros.Checked,'V','F'));
  ArqConfig.WriteString ('REL_ALFABMENSAL', 'Estagiarios'  , IFF(cbxEstagiarios.Checked,'V','F'));
  ArqConfig.WriteString ('REL_ALFABMENSAL', 'Proprietarios', IFF(cbxPropDirSemVinc.Checked,'V','F'));
  ArqConfig.WriteString ('REL_ALFABMENSAL', 'Autonomos'    , IFF(cbxAutonomos.Checked,'V','F'));
end;

procedure TfrmParamAlfabMensal.HabilitaBtOk;
var
  c: integer;
  bSelRub1, bSelRub2, bSelRub3: boolean;
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

  bSelRub3 := false;
  for c:=0 to chklstRubrica3.Items.Count-1 do
    if (chklstRubrica3.Checked[c]) then
    begin
      bSelRub3 := true;
      break;
    end;

  bbtnConfirmar.Enabled := ((bSelRub1) or (bSelRub2) or (bSelRub3)) and
    (Trim(dblkcbEstab.Text) <> '')    and (Trim(speAno.Text) <> '') and
    ((Trim(regTituloLinha[1].Linha1) <> '') or (Trim(regTituloLinha[1].Linha2) <> '') or
     (Trim(regTituloLinha[2].Linha1) <> '') or (Trim(regTituloLinha[2].Linha2) <> '') or
     (Trim(regTituloLinha[3].Linha1) <> '') or (Trim(regTituloLinha[3].Linha2) <> ''));
end;

function TfrmParamAlfabMensal.SelecionaTipoContrato: string;
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

function TfrmParamAlfabMensal.SelecionaSitFunc: string;
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
