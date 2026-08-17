// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------

unit fParamCadDependente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook, Spin,
  checklst, IvDictio, IvMulti, IvEMulti, DBGrids, ComCtrls, fSairAjuda, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TTipoRelatorio = (tprDeclaracao, tprRelacao);

  TDocumento = array of record
    Id: LongInt;
    Mascara: string;
  end;

  TfrmParamCadDependente = class(TfrmSairAjuda)
    qryEstab: TwwQuery;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    gbxEstab: TGroupBox;
    dblkcbEstab: TwwDBLookupCombo;
    gbxFunc: TGroupBox;
    pgctrlEmpregados: TPageControl;
    tbshListaFunc: TTabSheet;
    chklstFunc: TCheckListBox;
    bbtnInverteSel: TBitBtn;
    bbtnSelTodos: TBitBtn;
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
    gbxDependente: TGroupBox;
    gbxOrdem: TGroupBox;
    cmbOrderBy: TComboBox;
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
    pgctrlDepend: TPageControl;
    tbshTipoDepend: TTabSheet;
    tbshOpcoes: TTabSheet;
    GroupBox2: TGroupBox;
    cbxMasculino: TCheckBox;
    cbxFeminino: TCheckBox;
    chklstTipoDepend: TCheckListBox;
    gbxIdade: TGroupBox;
    Label5: TLabel;
    ednIda1: TSpinEdit;
    ednIda2: TSpinEdit;
    gbxSexoFunc: TGroupBox;
    cbxMascFunc: TCheckBox;
    cbxFemFunc: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblkcbEstabChange(Sender: TObject);
    procedure chklstFuncDrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
      State: TOwnerDrawState);
    procedure gbxSituacaoEnter(Sender: TObject);
    procedure gbxSituacaoExit(Sender: TObject);
    procedure gbxTipContraEnter(Sender: TObject);
    procedure gbxTipContraExit(Sender: TObject);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure chklstFuncClickCheck(Sender: TObject);
    procedure chklstFuncKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ednIda1Change(Sender: TObject);
    procedure ednIda2Change(Sender: TObject);
    procedure cbxMascFuncClick(Sender: TObject);
    procedure cbxFemFuncClick(Sender: TObject);
  private
    Tipo: TTipoRelatorio;
    Doc: TDocumento;
    ListaCodTipoDepend: TStringList;

    procedure HabilitaBtOk;
    procedure MontaListaFuncionarios;
    function  SelecionaTipoContrato: string;
    function  SelecionaSitFunc: string;
    function  SelecionaSexo: string;
  public
    constructor Create(AOwner: TComponent; TipoRelatorio: TTipoRelatorio); reintroduce;
  end;

var
  frmParamCadDependente: TfrmParamCadDependente;

implementation

uses uSistema, uMensErro, uFuncoesUteis, UsoGeralRH, uComumRelats, fAguarde,
  dBaseDados, uDataBase, dRelatorios;

{$R *.DFM}

constructor TfrmParamCadDependente.Create(AOwner: TComponent; TipoRelatorio: TTipoRelatorio);
begin
  Tipo := TipoRelatorio;
  inherited Create(AOwner);
end;

procedure TfrmParamCadDependente.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  if not(Assigned(ListaCodFunc)) then
    ListaCodFunc := TStringList.Create;
  ListaCodTipoDepend := TStringList.Create;
  IdEstab := -1;

  cmbTipoPapel.Items.Assign(dtmRelatorios.rpCadDependente.PrinterSetup.PaperNames);

  iPos := ProcuraStList(cmbTipoPapel.Items, 'A4');
  if (iPos = -1) then
    cmbTipoPapel.ItemIndex := 0
  else
    cmbTipoPapel.ItemIndex := iPos;

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

  // Monto a Lista de Tipos de Dependência
  chklstTipoDepend.Items.Clear;
  ListaCodTipoDepend.Clear;
  with (dtmBaseDados.qry) do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT');
    SQL.Add('  IDDEPENDENCIA, RTRIM(LTRIM(DESCRICAO)) AS DESCRICAO');
    SQL.Add('FROM');
    SQL.Add('  DEPEN');
    SQL.Add('WHERE');
    SQL.Add('  (IDDEPENDENCIA <> ''PRP'')');
    SQL.Add('ORDER BY');
    SQL.Add('  DESCRICAO');
    Open;
    while not(EOF) do
    begin
      ListaCodTipoDepend.Add(FieldByName('IDDEPENDENCIA').asString);
      chklstTipoDepend.Items.Add(FieldByName('DESCRICAO').asString);
      Next;
    end;
  end;

  if (Tipo = tprDeclaracao) then
  begin
    Caption := 'Declaração de Dependentes para Fins de Imposto de Renda';
    SetLength(Doc, 2);
  end
  else
  begin
    Caption := 'Relação de Dependentes';
    SetLength(Doc, 3);
  end;

  cmbOrderBy.ItemIndex := 0;
  pgctrlEmpregados.ActivePageIndex := 0;
  pgctrlDepend.ActivePageIndex := 0;

  HabilitaBtOk;
end;

procedure TfrmParamCadDependente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryEstab.Close;
  inherited;
  ListaCodTipoDepend.Free;
end;

procedure TfrmParamCadDependente.chklstFuncDrawItem(Control: TWinControl; Index: Integer;
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

procedure TfrmParamCadDependente.dblkcbEstabChange(Sender: TObject);
begin
  if (qryEstab.FieldByName('IDPESSOA').asInteger <> IdEstab) then
  begin
    MontaListaFuncionarios;
    IdEstab := qryEstab.FieldByName('IDPESSOA').asInteger;

    if (pgctrlEmpregados.ActivePageIndex = 0) then
      chklstFunc.Repaint;
  end;
end;

procedure TfrmParamCadDependente.gbxTipContraEnter(Sender: TObject);
begin
  bTipContrEfet := cbxEfetivos.Checked;
  bTipContrEspec := cbxEspeciais.Checked;
  bTipContrTemp := cbxTemporarios.Checked;
  bTipContrEst := cbxEstagiarios.Checked;
  bTipContrTerc := cbxTerceiros.Checked;
  bTipContrProp := cbxPropDirSemVinc.Checked;
  bTipContrAut := cbxAutonomos.Checked;
end;

procedure TfrmParamCadDependente.gbxTipContraExit(Sender: TObject);
begin
  if not(cbxEfetivos.Checked) and not(cbxEspeciais.Checked) and not(cbxTemporarios.Checked) and
     not(cbxTerceiros.Checked) and not(cbxPropDirSemVinc.Checked) and
     not(cbxAutonomos.Checked) and not(cbxEstagiarios.Checked) then
  begin
    MsgDlg('Pelo menos um Tipo de Contrato deve ser selecionado.', 'Aviso',
      mtInformation, [mbOk,mbHelp], 0);
    cbxEfetivos.SetFocus;
  end
  else
  if (bTipContrEfet <> cbxEfetivos.Checked) or (bTipContrEspec <> cbxEspeciais.Checked) or
     (bTipContrTemp <> cbxTemporarios.Checked) or (bTipContrEst <> cbxEstagiarios.Checked) or
     (bTipContrTerc <> cbxTerceiros.Checked) or (bTipContrProp <> cbxPropDirSemVinc.Checked) or
     (bTipContrAut <> cbxAutonomos.Checked) then
    MontaListaFuncionarios;
end;

procedure TfrmParamCadDependente.gbxSituacaoEnter(Sender: TObject);
begin
  bSitAtivo := (cbxAtivos.Checked);
  bSitAfast := (cbxAfastados.Checked);
end;

procedure TfrmParamCadDependente.gbxSituacaoExit(Sender: TObject);
begin
  if not(cbxAtivos.Checked) and not(cbxAfastados.Checked) then
  begin
    MsgDlg('Pelo menos um Tipo de Situação deve ser selecionado.', 'Aviso',
      mtInformation, [mbOk,mbHelp], 0);
    cbxAtivos.SetFocus;
  end
  else
  if (bSitAtivo <> cbxAtivos.Checked) or (bSitAfast <> cbxAfastados.Checked) then
    MontaListaFuncionarios;
end;

procedure TfrmParamCadDependente.chklstFuncKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    InvalidateItemListBox(TCustomListBox(Sender), TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmParamCadDependente.chklstFuncClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender), TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmParamCadDependente.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := true;
  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamCadDependente.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := not(chklstFunc.Checked[c]);
  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamCadDependente.bbtnConfirmarClick(Sender: TObject);
var
  wNum: word;
  sCodTipoDependSel: string;
  qryAux: TwwQuery;
begin
  // Empregados escolhidos
  wNum := CriaListaOpcoes(chklstFunc, ListaCodFunc, sCodFuncSel, ',', false);
  if (wNum = ListaCodFunc.Count) then
    sCodFuncSel := '';

  // Empregados escolhidos
  CriaListaOpcoes(chklstTipoDepend, ListaCodTipoDepend, sCodTipoDependSel, ',', true);

  // Máscaras dos Documentos
  with (dtmBaseDados.qry) do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT TDO.IDDOCUMENTO, TDO.SIGLADOCUMENTO,');
    SQL.Add('       DECODE(RTRIM(TDP.MASCARA),'''','''',RTRIM(TDP.MASCARA)) AS MASCARA');
    SQL.Add('FROM   TIPODOCPESSOA TDP, TIPODOCOFICIAL TDO');
    if (Tipo = tprDeclaracao) then
    begin
      SQL.Add('WHERE ((TDO.SIGLADOCUMENTO = ''CTPS:'') OR');
      SQL.Add('       (TDO.SIGLADOCUMENTO = ''CPF:'')) AND');
    end
    else
    begin
      SQL.Add('WHERE ((TDO.SIGLADOCUMENTO = ''CGC:'') OR');
      SQL.Add('       (TDO.SIGLADOCUMENTO = ''CNPJ:'') OR');
      SQL.Add('       (TDO.SIGLADOCUMENTO = ''ESTADUAL:'') OR');
      SQL.Add('       (TDO.SIGLADOCUMENTO = ''MUNICIPAL:'')) AND');
    end;
    SQL.Add('      (TDO.IDDOCUMENTO     = TDP.IDDOCUMENTO)');
    Open;
    while not(EOF) do
    begin
      if (FieldByName('SIGLADOCUMENTO').asString = 'CNPJ:') or
         (FieldByName('SIGLADOCUMENTO').asString = 'CGC:') then
      begin
        Doc[0].Id := FieldByName('IDDOCUMENTO').asInteger;
        Doc[0].Mascara := FieldByName('MASCARA').asString;
      end
      else
      if (FieldByName('SIGLADOCUMENTO').asString = 'ESTADUAL:') then
      begin
        Doc[1].Id := FieldByName('IDDOCUMENTO').asInteger;
        Doc[1].Mascara := FieldByName('MASCARA').asString;
      end
      else
      if (FieldByName('SIGLADOCUMENTO').asString = 'MUNICIPAL:') then
      begin
        Doc[2].Id := FieldByName('IDDOCUMENTO').asInteger;
        Doc[2].Mascara := FieldByName('MASCARA').asString;
      end
      else
      if (FieldByName('SIGLADOCUMENTO').asString = 'CTPS:') then
      begin
        Doc[0].Id := FieldByName('IDDOCUMENTO').asInteger;
        Doc[0].Mascara := FieldByName('MASCARA').asString;
      end
      else
      if (FieldByName('SIGLADOCUMENTO').asString = 'CPF:') then
      begin
        Doc[1].Id := FieldByName('IDDOCUMENTO').asInteger;
        Doc[1].Mascara := FieldByName('MASCARA').asString;
      end;
      Next;
    end;
  end;

  if (Tipo = tprDeclaracao) then
    qryAux := dtmRelatorios.qryDeclDependente
  else
    qryAux := dtmRelatorios.qryCadDependente;

  // Monta Query
  qryAux.Close;
  with (qryAux.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  RTRIM(PJ.RAZAOSOCIAL) AS ESTAB,');
    Add('  F.MATRICULA,');
    if (Tipo = tprDeclaracao) then
    begin
      Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO || DECODE(RTRIM(E.COMPLEMENTO),');
      Add('    NULL,'''','' - ''||RTRIM(E.COMPLEMENTO)) AS LOGRADOURO,');
      Add('  CIDADES.NOME AS CIDADE,');
      Add('  E.BAIRRO,');
      Add('  RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS CEP,');
      Add('  DECODE(PEFIS.ESTCIVIL,''S'',''Solteir'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
      Add('    ''C'',''Casad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
      Add('    ''D'',''Separad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
      Add('    ''J'',''Separad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o'') || '' Judicialmente'',');
      Add('    ''E'',''Desquitad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
      Add('    ''V'',''Viúv'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
      Add('    ''O'',''Outro'') AS ESTCIVIL,');
      Add('  DOC_CTPS.NUM AS CTPS,');
      Add('  DOC_CTPS.UF AS CTPS_UF,');
      Add('  DOC_CPF.NUM AS CPF,');
      Add('  DECODE(RTRIM(TEL.DDD),'''','''',''(''|| RTRIM(TEL.DDD) || '') '') ||');
      Add('    DECODE(RTRIM(TEL.NUMERO),'''','''',RTRIM(TEL.NUMERO)) AS TELEFONE,');
    end
    else
    begin
      Add('  DOC_CNPJ.NUM AS CGC,');
      Add('  RTRIM(DECODE(RTRIM(DOC_ESTADUAL.NUM),'''',');
      Add('    DECODE(RTRIM(DOC_MUNICIPAL.NUM),'''','''',');
      Add('    ''Inscrição Municipal: ''|| DOC_MUNICIPAL.NUM),');
      Add('    ''Inscrição Estadual: '' || DOC_ESTADUAL.NUM)) AS ESTADUALMUNICIPAL,');
      Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO ||');
      Add('    DECODE(RTRIM(E.COMPLEMENTO),NULL,'''','' - '' || RTRIM(E.COMPLEMENTO)) ||');
      Add('    DECODE(RTRIM(E.BAIRRO),NULL,'''','' - '' || RTRIM(E.BAIRRO)) ||');
      Add('    DECODE(RTRIM(CIDADES.NOME),NULL,'''','' - '' || RTRIM(CIDADES.NOME)) ||');
      Add('    '' - CEP:'' || RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS ENDERECO,');
      Add('  TO_CHAR(F.DATAADMISSAO,''DD/MM/YYYY'') AS DATAADMISSAO,');
    end;
    Add('  ES.CODESTADO AS UF,');
    Add('  UPPER(PF.NOME) AS EMPREGADO,');
    Add('  PFD.NOME AS DEPENDENTE, PEFISD.DATANASC, DP.DESCRICAO AS DEPENDENCIA');
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, PESSOA PFD, PESSOAFISICA PEFIS, PESSOAFISICA PEFISD,');
    Add('  ENDPESS E, FUNCIONARIO F, CIDADES, ESTADO ES, DEPENTIT DT, DEPEN DP, SITFUNC ST,');
    if (Tipo = tprDeclaracao) then
    begin
      // ------------------------------------------------------------------------------- //
      // CTPS do(s) Empregado(s)
      Add('  (SELECT DP.IDPESSOA, DP.NUMDOCUMENTO AS NUM, ES.CODESTADO AS UF');
      Add('   FROM   DOCPESSOA DP, ESTADO ES, PAIS PA');
      Add('   WHERE (DP.IDDOCUMENTO = ' +IntToStr(Doc[0].Id)+ ') AND');
      Add('         (DP.IDPAIS      = PA.IDPAIS) AND');
      Add('         (PA.IDPAIS      = ES.IDPAIS) AND');
      Add('         (DP.IDESTADO    = ES.IDESTADO)) DOC_CTPS,');
      // -------------------------------------------------------------------------- //
      // CPF do(s) Empregado(s)
      Add('  (SELECT IDPESSOA, NUMDOCUMENTO AS NUM');
      Add('   FROM   DOCPESSOA');
      Add('   WHERE (IDDOCUMENTO = ' +IntToStr(Doc[1].Id)+ ')) DOC_CPF,');
      // -------------------------------------------------------------------------- //
      // Telefone do(s) Empregado(s)
      Add('  (SELECT TE.IDENDERECO, TE.IDTELEFONE, TE.DDD, TE.NUMERO');
      Add('   FROM');
      Add('     TELENDPESS TE,');
      Add('     (SELECT   MIN(IDTELEFONE) AS IDTELEFONE, IDENDERECO');
      Add('      FROM     TELENDPESS');
      Add('      GROUP BY IDENDERECO) END');
      Add('   WHERE');
      Add('     (END.IDTELEFONE = TE.IDTELEFONE)) TEL');
    end
    else
    begin
      // -------------------------------------------------------------------------- //
      // CGC/CNPJ do Estabelecimento
      Add('  (SELECT DO.IDPESSOA, RTRIM(TDO.SIGLADOCUMENTO ||'' ''|| DO.NUMDOCUMENTO) AS NUM');
      Add('   FROM   DOCPESSOA DO, TIPODOCOFICIAL TDO');
      Add('   WHERE (DO.IDPESSOA    = ' +qryEstab.FieldByName('IDPESSOA').asString+ ') AND');
      Add('         (DO.IDDOCUMENTO = ' +IntToStr(Doc[0].Id)+ ') AND');
      Add('         (DO.IDDOCUMENTO = TDO.IDDOCUMENTO)) DOC_CNPJ,');
      // ------------------------------------------------------------------------------- //
      // Inscrição Estadual dO Estabelecimento
      Add('  (SELECT IDPESSOA, NUMDOCUMENTO AS NUM');
      Add('   FROM   DOCPESSOA');
      Add('   WHERE (IDDOCUMENTO = ' +IntToStr(Doc[1].Id)+ ')) DOC_ESTADUAL,');
      // -------------------------------------------------------------------------- //
      // Inscrição Municipal do Estabelecimento
      Add('  (SELECT IDPESSOA, NUMDOCUMENTO AS NUM');
      Add('   FROM   DOCPESSOA');
      Add('   WHERE (IDDOCUMENTO = ' +IntToStr(Doc[2].Id)+ ')) DOC_MUNICIPAL');
    end;
    // -------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (PJ.IDPESSOA         = '+qryEstab.FieldByName('IDPESSOA').asString+') AND');

    // Funcionário(s) selecionado(s)
    if (sCodFuncSel <> '') then
    begin
      if (Pos(',',sCodFuncSel) > 0) then
        Add('  (F.IDPESSOA         IN (' +sCodFuncSel+ ')) AND')
      else
        Add('  (F.IDPESSOA          = ' +sCodFuncSel+ ') AND');
    end
    else
    begin
      // C. de Custo(s) habilitados para o usuário
      if (sUsuXccusto <> '') then
      begin
        if (Pos(',',sUsuXccusto) > 0) then
          Add('  (F.CODCENTROCUSTO   IN ' +sUsuXccusto+ ') AND')
        else
          Add('  (F.CODCENTROCUSTO    = ' +sUsuXccusto+ ') AND');
      end;

      sAux := SelecionaSitFunc;
      if (sAux <> '') then
        if (Pos(',',sAux) > 0) then
          Add('  (ST.TIPOSIT         IN (' +sAux+ ')) AND')
        else
          Add('  (ST.TIPOSIT          = ' +sAux+ ') AND');

      sAux := SelecionaTipoContrato;
      if (Pos(',',sAux) > 0) then
        Add('  (F.TIPOCONTRATO     IN (' +sAux+ ')) AND')
      else
        Add('  (F.TIPOCONTRATO      = ' +sAux+ ') AND');
    end;

    if (sCodTipoDependSel = '') then
    begin
      Add('  (DT.IDDEPENDENCIA   <> ''PRP'') AND');
      Add('  (DT.FLGCONTAIMPOSTOR = 1) AND');
    end
    else
    if (Pos(',',sCodTipoDependSel) > 0) then
      Add('  (DT.IDDEPENDENCIA   IN (' +sCodTipoDependSel+ ')) AND')
    else
      Add('  (DT.IDDEPENDENCIA    = ' +sCodTipoDependSel+ ') AND');

    Add('  (F.IDSITFUNC         = ST.IDSITFUNC) AND');
    Add('  (F.IDPESSOA          = PF.IDPESSOA) AND');
    Add('  (F.IDPESSOA          = PEFIS.IDPESSOA) AND');
    Add('  (F.IDPESSOA          = DT.IDTITULAR) AND');
    Add('  (DT.IDPESSOA         = PFD.IDPESSOA) AND');
    Add('  (PFD.IDPESSOA        = PEFISD.IDPESSOA) AND');

    sAux := SelecionaSexo;
    if (Pos(',',sAux) > 0) then
      Add('  (PEFISD.SEXO        IN ('+sAux+')) AND')
    else
      Add('  (PEFISD.SEXO         = '+sAux+') AND');

    if (ednIda1.Value > 0) then  //Faixa Etária Inicial
      Add('  (TRUNC((SYSDATE - 1 - PEFISD.DATANASC)/365.25) >= ' +IntToStr(ednIda1.Value)+ ') AND');
    if (ednIda2.Value < 99) then  //Faixa Etária Final
      Add('  (TRUNC((SYSDATE - 1 - PEFISD.DATANASC)/365.25) <= ' +IntToStr(ednIda2.Value)+ ') AND');

    Add('  (DT.IDDEPENDENCIA    = DP.IDDEPENDENCIA) AND');
    Add('  (PJ.IDPESSOA         = F.IDESTAB) AND');
    if (Tipo = tprDeclaracao) then
    begin
      Add('  (PF.IDPESSOA         = E.IDPESSOA) AND');
      Add('  (PF.IDENDRESIDENCIAL = E.IDENDERECO) AND');
      Add('  (E.IDCIDADES         = CIDADES.IDCIDADES) AND');
      Add('  (CIDADES.IDESTADO    = ES.IDESTADO) AND');
      Add('  (PF.IDENDRESIDENCIAL = TEL.IDENDERECO(+)) AND');
      Add('  (PF.IDPESSOA         = DOC_CTPS.IDPESSOA(+)) AND');
      Add('  (PF.IDPESSOA         = DOC_CPF.IDPESSOA(+))');
    end
    else
    begin
      Add('  (PJ.IDPESSOA         = E.IDPESSOA) AND');
      Add('  (PJ.IDENDCOMERCIAL   = E.IDENDERECO) AND');
      Add('  (E.IDCIDADES         = CIDADES.IDCIDADES) AND');
      Add('  (CIDADES.IDESTADO    = ES.IDESTADO) AND');
      Add('  (PJ.IDPESSOA         = DOC_CNPJ.IDPESSOA(+)) AND');
      Add('  (PJ.IDPESSOA         = DOC_ESTADUAL.IDPESSOA(+)) AND');
      Add('  (PJ.IDPESSOA         = DOC_MUNICIPAL.IDPESSOA(+))');
    end;
    Add('ORDER BY');
    case (cmbOrderBy.ItemIndex) of
      0 : Add('  EMPREGADO');
      1 : Add('  MATRICULA');
    end;
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+ '\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;

  frmAguarde.Mostra(Caption);
  frmAguarde.Pos := 0;

  qryAux.Open;

  with (dtmRelatorios) do
  begin
    // Especifico Configurações do Relatório
    if (Tipo = tprDeclaracao) then
      rpDeclDependente.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex]
    else
      rpCadDependente.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];

    if (Tipo = tprDeclaracao) then
    begin
      rpDeclDependenteDBTxt10.DisplayFormat := Doc[0].Mascara+';0;_';
      rpDeclDependenteDBTxt11.DisplayFormat := Doc[1].Mascara+';0;_';
    end;
  end;

  if (qryAux.IsEmpty) then
  begin
    ModalResult := mrNone;
    frmAguarde.Apaga;
    MsgDlg('Não há dados a serem exibidos.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
  end
  else
    ModalResult := mrOk;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------
procedure TfrmParamCadDependente.HabilitaBtOk;
begin
  bbtnConfirmar.Enabled := (Trim(dblkcbEstab.Text) <> '');
end;

procedure TfrmParamCadDependente.MontaListaFuncionarios;
begin
  if (dblkcbEstab.Text <> '') then
  begin
    dtmBaseDados.qry.Close;
    ListaCodFunc.Clear;
    chklstFunc.Items.Clear;

    with (dtmBaseDados.qry.SQL) do
    begin
      Clear;
      Add('SELECT');
      Add('  PF.IDPESSOA, PF.NOME');
      Add('FROM');
      Add('  PESSOA PF, FUNCIONARIO F, SITFUNC ST');

      if (not cbxMascFunc.Checked) or (not cbxFemFunc.Checked) then
        Add('  , PESSOAFISICA PFIS');

      Add('WHERE');
      Add('  (F.IDESTAB         = ' +qryEstab.FieldByName('IDPESSOA').asString+ ') AND');

      if (not cbxMascFunc.Checked) or (not cbxFemFunc.Checked) then
      begin
        Add(' (PF.IDPESSOA = PFIS.IDPESSOA) AND');
        if (not cbxMascFunc.Checked) then
          Add(' (PFIS.SEXO <> ''M'') AND');
        if (not cbxFemFunc.Checked) then
          Add(' (PFIS.SEXO <> ''F'') AND');
      end;
      
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
  end;
  HabilitaBtOk;
end;

function TfrmParamCadDependente.SelecionaTipoContrato: string;
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

function TfrmParamCadDependente.SelecionaSitFunc: string;
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

function TfrmParamCadDependente.SelecionaSexo: string;
begin
  sAux := '';
  if (cbxMasculino.Checked) then
    sAux := QuotedStr('M');

  if (cbxFeminino.Checked) then
    if (length(sAux) > 0) then
      sAux := sAux +','+ QuotedStr('F')
    else
      sAux := QuotedStr('F');

  Result := sAux;
end;

procedure TfrmParamCadDependente.ednIda1Change(Sender: TObject);
begin
  if (ednIda1.Value > ednIda2.Value) then
    ednIda1.Value := ednIda2.Value;
end;

procedure TfrmParamCadDependente.ednIda2Change(Sender: TObject);
begin
  if (ednIda2.Value < ednIda1.Value) then
    ednIda2.Value := ednIda1.Value;
end;

procedure TfrmParamCadDependente.cbxMascFuncClick(Sender: TObject);
begin
  inherited;
  MontaListaFuncionarios;
end;

procedure TfrmParamCadDependente.cbxFemFuncClick(Sender: TObject);
begin
  inherited;
  MontaListaFuncionarios;
end;

end.
