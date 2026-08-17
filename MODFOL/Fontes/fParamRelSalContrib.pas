// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamRelSalContrib;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook, Spin,
  checklst, TREdit, IvDictio, IvMulti, IvEMulti, ComCtrls, IniFiles, fSairAjuda,
  Provider, DBClient, Grids, DBGrids, Wwdatsrc, wwdbdatetimepicker, CMDateTimePicker,
  Wwdbigrd, Wwdbgrid;

type
  TDoc = array[1..4] of record
    ID: LongInt;
    Mascara: string;
  end;

  TfrmParamRelSalContrib = class(TfrmSairAjuda)
    qryEstab: TwwQuery;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    qryFunc: TwwQuery;
    qryRubSalParteFixa: TwwQuery;
    qryRubrica: TwwQuery;
    pgctrlPrincipal: TPageControl;
    tbshPrincipal: TTabSheet;
    TabSheet2: TTabSheet;
    gbxEstab: TGroupBox;
    dblkcbEstab: TwwDBLookupCombo;
    gbxFunc: TGroupBox;
    dblkcbFunc: TwwDBLookupCombo;
    gbxLimitadoPor: TGroupBox;
    Bevel1: TBevel;
    Bevel2: TBevel;
    lblDe1: TLabel;
    lblDe2: TLabel;
    lblQuantMeses: TLabel;
    rbLimitadoPorData: TRadioButton;
    rbLimitadoPorQuantMeses: TRadioButton;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    spedQuantMeses: TSpinEdit;
    gbxSalContrib: TGroupBox;
    Label1: TLabel;
    rgTipoSel: TRadioGroup;
    chklstRubrica: TCheckListBox;
    bbtnSelTodas: TBitBtn;
    bbtnInverteSel: TBitBtn;
    edCodRubricas: TEdit;
    sbtnMarcarRub: TBitBtn;
    gbxSalParteFixa: TGroupBox;
    dblckSalParteFixa: TwwDBLookupCombo;
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
    rgImprimeRelReqBenefIncap: TRadioGroup;
    Bevel3: TBevel;
    rgGozoBenef: TRadioGroup;
    rgOutraAtiv: TRadioGroup;
    gbxFilhos: TGroupBox;
    stgrFilhos: TStringGrid;
    qryFilhos: TwwQuery;
    Bevel4: TBevel;
    rgImprimeRelAtestAfastTrab: TRadioGroup;
    Label2: TLabel;
    dtedUltDiaTrab: TCMDateTimePicker;
    dspAux: TDataSetProvider;
    cdsAux: TClientDataSet;
    qryAux: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblkcbEstabChange(Sender: TObject);
    procedure dblkcbFuncChange(Sender: TObject);
    procedure rbLimitadoPorDataClick(Sender: TObject);
    procedure chklstRubricaDrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
      State: TOwnerDrawState);
    procedure chklstRubricaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure chklstRubricaClickCheck(Sender: TObject);
    procedure bbtnSelTodasClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure sbtnMarcarRubClick(Sender: TObject);
    procedure rgTipoSelClick(Sender: TObject);
  private
    Doc: TDoc;
    rValorMes: real;
    sDataPorExtenso, sCodRubSalParteFixa, sMesAtual, sCodRub, sMesIni, sMesFin: string;
    //bTeste: boolean;

    procedure LeAlteracoes;
    procedure GravaAlteracoes;
    procedure HabilitaBtOk;
    procedure MontaListaFuncionarios;
    procedure ConfigRelat;    
    procedure GerarRelatorios;
    procedure GerarRelatorio0;
    procedure GerarRelatorio1;
    procedure GerarRelatorio2;
    procedure GerarRelatorio3;
    procedure GerarRelatorio4;
  end;

var
  frmParamRelSalContrib: TfrmParamRelSalContrib;

implementation

uses ppCtrls, uSistema, uMensErro, uDataBase, fAguarde, dBaseDados, uComumRelats,
  uFuncoesUteisRH, UsoGeralRH, dRelatorios;

{$R *.DFM}

procedure TfrmParamRelSalContrib.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  if not(Assigned(ListaCodRubrica)) then
    ListaCodRubrica := TStringList.Create;

  cmbTipoPapel.Items.Assign(dtmRelatorios.rpRelSalContrib.PrinterSetup.PaperNames);

  iPos := ProcuraStList(cmbTipoPapel.Items, 'A4');
  if (iPos = -1) then
    cmbTipoPapel. ItemIndex := 0
  else
    cmbTipoPapel. ItemIndex := iPos;

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

  qryRubSalParteFixa.ParamByName('IDEMPRESA').asInteger := Sistema.IdEmpresa;
  qryRubSalParteFixa.Open;

  with (qryRubrica) do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT');
    SQL.Add('  RP.CODPROVDESC, RP.DESCRPROVDESC, PD.FLGDESCONTO');
    SQL.Add('FROM');
    SQL.Add('  RUBRICAXPESS RP, PROVDESC PD');
    SQL.Add('WHERE');
    SQL.Add('  (RP.IDPESSOA        = ' +IntToStr(Sistema.IdEmpresa)+ ') AND');
    SQL.Add('  (PD.FLGTPRUBRICA LIKE ''%F%'') AND');
    SQL.Add('  (PD.IDPROVENTO      = RP.IDRUBRICA)');
    SQL.Add('ORDER BY');
    SQL.Add('  UPPER(DESCRPROVDESC)');
    Open;
  end;

  // Monto a Lista de Rubricas
  rgTipoSelClick(Sender);

  cmbMes.ItemIndex := 6;
  pgctrlPrincipal.ActivePageIndex := 0;

  // Carrega alterações nas opções feitas anteriormente
  LeAlteracoes;
end;

procedure TfrmParamRelSalContrib.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GravaAlteracoes;

  dtmBaseDados.qry.Close;
  qryRubrica.Close;
  qryRubSalParteFixa.Close;
  qryEstab.Close;
  qryFunc.Close;
  qryFilhos.Close;
  inherited;
end;

procedure TfrmParamRelSalContrib.chklstRubricaDrawItem(Control: TWinControl; Index: Integer;
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

procedure TfrmParamRelSalContrib.dblkcbEstabChange(Sender: TObject);
begin
  MontaListaFuncionarios;
end;

procedure TfrmParamRelSalContrib.dblkcbFuncChange(Sender: TObject);
var
  c: byte;
begin
  if (qryFunc.Active) then
  begin
    HabilitaBtOk;

    c:=0;
    qryFilhos.Close;
    qryFilhos.ParamByName('IdTitular').asString := qryFunc.FieldByName('IdPessoa').asString;
    qryFilhos.Open;
    stgrFilhos.RowCount := qryFilhos.RecordCount;
    stgrFilhos.ColWidths[0] := 480;
    if not(qryFilhos.IsEmpty) then
      repeat
        stgrFilhos.Cells[0,c] := qryFilhos.FieldByName('Nome').asString;
        qryFilhos.Next;
        Inc(c);
      until (qryFilhos.EOF);
  end;    
end;

procedure TfrmParamRelSalContrib.chklstRubricaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    chklstRubricaClickCheck(Sender);
end;

procedure TfrmParamRelSalContrib.chklstRubricaClickCheck(Sender: TObject);
begin
  CriaListaOpcoes(chklstRubrica, ListaCodRubrica, sCodRubricaSel, ',', false);
  edCodRubricas.Text := sCodRubricaSel;
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
  HabilitaBtOk;
end;

procedure TfrmParamRelSalContrib.rgTipoSelClick(Sender: TObject);
begin
  chklstRubrica.Items.BeginUpdate;
  chklstRubrica.Items.Clear;
  ListaCodRubrica.Clear;
  qryRubrica.First;
  while not(qryRubrica.EOF) do
  begin
    if (rgTipoSel.ItemIndex = 1) or ((rgTipoSel.ItemIndex = 0) and
       (qryRubrica.FieldByName('FLGDESCONTO').asInteger = 2)) then
    begin
      ListaCodRubrica.Add(qryRubrica.FieldByName('CODPROVDESC').asString);
      chklstRubrica.Items.Add(qryRubrica.FieldByName('DESCRPROVDESC').asString);
    end;
    qryRubrica.Next;
  end;
  sbtnMarcarRubClick(Sender);
  CriaListaOpcoes(chklstRubrica, ListaCodRubrica, sCodRubricaSel, ',', false);
  edCodRubricas.Text := sCodRubricaSel;
  chklstRubrica.Items.EndUpdate;
end;

procedure TfrmParamRelSalContrib.bbtnSelTodasClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstRubrica.Items.Count-1 do
    chklstRubrica.Checked[c] := true;
  chklstRubrica.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamRelSalContrib.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstRubrica.Items.Count-1 do
    chklstRubrica.Checked[c] := not(chklstRubrica.Checked[c]);
  chklstRubrica.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamRelSalContrib.sbtnMarcarRubClick(Sender: TObject);
begin
  edCodRubricas.Text := Trim(edCodRubricas.Text);
  VerificaOpcoes(chklstRubrica, ListaCodRubrica, edCodRubricas.Text, ',');
  chklstRubrica.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamRelSalContrib.rbLimitadoPorDataClick(Sender: TObject);
begin
  lblDe1.Visible := rbLimitadoPorData.Checked;
  lblDe2.Visible := rbLimitadoPorData.Checked;
  cmbMes.Visible := rbLimitadoPorData.Checked;
  speAno.Visible := rbLimitadoPorData.Checked;
  spedQuantMeses.Visible := rbLimitadoPorQuantMeses.Checked;
  lblQuantMeses.Visible := rbLimitadoPorQuantMeses.Checked;
  HabilitaBtOk;
end;

procedure TfrmParamRelSalContrib.bbtnConfirmarClick(Sender: TObject);
begin
  // Rubrica(s) selecionada(s)
  CriaListaOpcoes(chklstRubrica, ListaCodRubrica, sCodRubricaSel, ',', true);

  sCodRubSalParteFixa := qryRubSalParteFixa.FieldByName('CODPROVDESC').asString;

  // Inicia variáveis
  if (rbLimitadoPorData.Checked) then
  begin
    sMesIni := speAno.Text +'/'+ PoeZero(cmbMes.ItemIndex+1);
    sMesFin := '';
  end
  else
  begin
    with (dtmBaseDados.qry) do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT MAX(MES) ULT_MES');
      SQL.Add('FROM   HISTRUBSAL');
      SQL.Add('WHERE (IDPESSOA = ' +qryFunc.FieldByName('IDPESSOA').asString+ ')');
      Open;
      sMesIni := IncDataAM(FieldByName('ULT_MES').asString, -spedQuantMeses.Value+1);
      sMesFin := FieldByName('ULT_MES').asString;
    end;
  end;

  // Máscaras dos Documentos
  with (dtmBaseDados.qry) do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT DECODE(TDP.MASCARA,NULL,'' '',RTRIM(TDP.MASCARA)) AS MASCARA,');
    SQL.Add('       TDO.IDDOCUMENTO, TDO.SIGLADOCUMENTO');
    SQL.Add('FROM   TIPODOCPESSOA TDP, TIPODOCOFICIAL TDO');
    SQL.Add('WHERE ((TDO.SIGLADOCUMENTO = ''CTPS:'') OR');
    SQL.Add('       (TDO.SIGLADOCUMENTO = ''INSS:'') OR');
    SQL.Add('       (TDO.SIGLADOCUMENTO = ''CPF:'') OR');
    SQL.Add('       (TDO.SIGLADOCUMENTO = ''PIS/PASEP:'') OR');
    SQL.Add('       (TDO.SIGLADOCUMENTO = ''CGC:'') OR');
    SQL.Add('       (TDO.SIGLADOCUMENTO = ''CNPJ:'')) AND');
    SQL.Add('      (TDO.IDDOCUMENTO     = TDP.IDDOCUMENTO)');
    Open;
    while not(EOF) do
    begin
      if (FieldByName('SIGLADOCUMENTO').asString = 'CGC:') or
         (FieldByName('SIGLADOCUMENTO').asString = 'CNPJ:') then
      begin
        Doc[1].ID      := FieldByName('IDDOCUMENTO').asInteger;
        Doc[1].Mascara := FieldByName('MASCARA').asString;
      end
      else
      if (FieldByName('SIGLADOCUMENTO').asString = 'CTPS:') or
         (FieldByName('SIGLADOCUMENTO').asString = 'INSS:') then
      begin
        Doc[2].ID      := FieldByName('IDDOCUMENTO').asInteger;
        Doc[2].Mascara := FieldByName('MASCARA').asString;
      end
      else
      if (FieldByName('SIGLADOCUMENTO').asString = 'CPF:') then
      begin
        Doc[3].ID      := FieldByName('IDDOCUMENTO').asInteger;
        Doc[3].Mascara := FieldByName('MASCARA').asString;
      end
      else
      if (FieldByName('SIGLADOCUMENTO').asString = 'PIS/PASEP:') then
      begin
        Doc[4].ID      := FieldByName('IDDOCUMENTO').asInteger;
        Doc[4].Mascara := FieldByName('MASCARA').asString;
      end;
      Next;
    end;
  end;

  // Monto Query Principal conforme a seleção do usuário
  dtmBaseDados.qry.Close;
  with (dtmBaseDados.qry.SQL) do
  begin
    Clear;
    Add('SELECT');
    // Dados do Estabelecimento
    Add('  PJ.RAZAOSOCIAL AS EMPRESA,');
    Add('  DECODE(RTRIM(PJ.NUMDOCUMENTO),NULL,NULL,RTRIM(PJ.NUMDOCUMENTO)) AS CNPJ,');
    Add('  RTRIM(E1.LOGRADOURO)||'', ''||E1.NUMERO||');
    Add('    DECODE(RTRIM(E1.COMPLEMENTO),NULL,NULL,'' - ''||RTRIM(E1.COMPLEMENTO||'' - ''))||');
    Add('    RTRIM(E1.BAIRRO)||'' - ''||RTRIM(CI.NOME)||'' - CEP:''||');
    Add('    RTRIM(SUBSTR(E1.CEP,1,5))||''-''||RTRIM(SUBSTR(E1.CEP,6,3)||');
    Add('    DECODE(ES.CODESTADO,NULL,NULL,'' - ''||ES.CODESTADO)) AS ENDERECO,');
    Add('  RTRIM(CI.NOME) AS CIDADE,');
    // Dados do Empregado
    Add('  UPPER(RTRIM(PF.NOME)) AS EMPREGADO,');
    Add('  RTRIM(E2.LOGRADOURO)||'', ''||E2.NUMERO||'' ''||RTRIM(E2.BAIRRO) AS EMPREGADO_END,');
    Add('  RTRIM(SUBSTR(E2.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E2.CEP,6,3)) AS EMPREGADO_CEP,');
    Add('  DOC_INCRICAO.NUM AS INCRICAO,');
    Add('  DOC_CPF.NUM AS CPF,');
    Add('  DOC_PIS.NUM AS PIS,');
    Add('  PEFIS.DATANASC,');
    Add('  PEFIS.SEXO,');
    Add('  PAIS.NOMENACIONALIDADE,');
    Add('  PEFIS.NUMDEPIRRF,');
    Add('  PEFIS.ESTCIVIL,');
    Add('  F.TIPOCONTRATO,');
    Add('  F.DATAADMISSAO,');
    Add('  DECODE(ST.TIPOSIT,''D'',F.DATADESLIGAMENTO,'''') AS DATADESLIGAMENTO,');
    Add('  MO.DESCRICAO AS MOTIVO');
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, PESSOAFISICA PEFIS, ENDPESS E1, ENDPESS E2, FUNCIONARIO F,');
    Add('  MOTIVO MO, ESTADO ES, CIDADES CI, SITFUNC ST, PAIS,');
    // -------------------------------------------------------------------- //
    // Matrícula INSS
    Add('  (SELECT IDPESSOA, NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA');
    Add('   WHERE (IDPESSOA    = ' +qryFunc.FieldByName('IDPESSOA').asString+ ') AND');
    Add('         (IDDOCUMENTO = ' +IntToStr(Doc[2].ID)+ ')) DOC_INCRICAO,');
    // -------------------------------------------------------------------- //
    // CPF
    Add('  (SELECT IDPESSOA, NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA');
    Add('   WHERE (IDPESSOA    = ' +qryFunc.FieldByName('IDPESSOA').asString+ ') AND');
    Add('         (IDDOCUMENTO = ' +IntToStr(Doc[3].ID)+ ')) DOC_CPF,');
    // -------------------------------------------------------------------- //
    // PIS
    Add('  (SELECT IDPESSOA, NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA');
    Add('   WHERE (IDPESSOA    = ' +qryFunc.FieldByName('IDPESSOA').asString+ ') AND');
    Add('         (IDDOCUMENTO = ' +IntToStr(Doc[4].ID)+ ')) DOC_PIS');
    // -------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (PJ.IDPESSOA         = ' +qryEstab.FieldByName('IDPESSOA').asString+ ') AND');
    Add('  (F.IDPESSOA          = ' +qryFunc.FieldByName('IDPESSOA').asString+ ') AND');
    Add('  (F.IDSITFUNC         = ST.IDSITFUNC) AND');
    Add('  (PJ.IDPESSOA         = E1.IDPESSOA) AND');
    Add('  (PJ.IDENDCOMERCIAL   = E1.IDENDERECO) AND');
    Add('  (E1.IDCIDADES        = CI.IDCIDADES) AND');
    Add('  (CI.IDESTADO         = ES.IDESTADO) AND');
    Add('  (PJ.IDPESSOA         = F.IDESTAB) AND');
    Add('  (F.IDPESSOA          = PF.IDPESSOA) AND');
    Add('  (F.IDPESSOA          = PEFIS.IDPESSOA) AND');
    Add('  (F.IDPESSOA          = DOC_CPF.IDPESSOA) AND');
    Add('  (F.IDPESSOA          = DOC_PIS.IDPESSOA) AND');
    Add('  (PF.IDPESSOA         = E2.IDPESSOA) AND');
    Add('  (PF.IDENDRESIDENCIAL = E2.IDENDERECO) AND');
    Add('  (PEFIS.IDPAIS        = PAIS.IDPAIS) AND');
    Add('  (F.IDMOTIVODESLIGGERENCIAL = MO.IDMOTIVO(+)) AND');
    Add('  (F.IDPESSOA          = DOC_INCRICAO.IDPESSOA(+))');
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;

  // Monto Query de Salário Parte Fixa conforme a seleção do usuário
  qryAux.Close;
  with (qryAux.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  0 AS SAL_PARTE_FIXA,');
    Add('  TO_CHAR(RECOLHIM.DATAFIMGRPS,''DD/MM/YYYY'') AS RECOLHIMENTO,');
    if (rgTipoSel.ItemIndex = 0) then
    begin
      Add('  RP2.CODPROVDESC AS COD_RUBRICA,');
      Add('  RP2.DESCRPROVDESC AS NOM_RUBRICA,');
      Add('  RXR.FLGACAOINCIDE AS TIPO_INCID,');
    end
    else
    begin
      Add('  RP.CODPROVDESC AS COD_RUBRICA,');
      Add('  RP.DESCRPROVDESC AS NOM_RUBRICA,');
      Add('  PD.FLGDESCONTO AS TIPO_INCID,');
    end;
    Add('  SUBSTR(H.MES,1,4) AS ANO,');
    Add('  H.MES,');
    Add('  H.VALORPROVENTO');
    Add('FROM');
    if (rgTipoSel.ItemIndex = 0) then
      Add('  HISTRUBSAL H, RUBRICAXPESS RP,RUBRICAXPESS RP2, RUBXRUB RXR, PROVDESC PD,')
    else
      Add('  HISTRUBSAL H, RUBRICAXPESS RP, PROVDESC PD,');
    // -------------------------------------------------------------------- //
    // Data do Recolhimento da Contribuição
    Add('  (SELECT TO_CHAR(ADD_MONTHS(DATAVENCGRPS,-1),''YYYY'') || ''/'' ||');
    Add('          TO_CHAR(ADD_MONTHS(DATAVENCGRPS,-1),''MM'') AS MES,');
    Add('          DATAFIMGRPS');
    Add('   FROM   GUIAGRPS) RECOLHIM');
    // -------------------------------------------------------------------- //
    Add('WHERE');
    if (Pos(',',sCodRubricaSel) > 0) then
      Add('  (RP.CODPROVDESC IN ('+sCodRubricaSel+')) AND')
    else
      Add('  (RP.CODPROVDESC  = '+sCodRubricaSel+') AND');
    Add('  (H.IDPESSOA      = ' +qryFunc.FieldByName('IDPESSOA').asString+ ') AND');
    if (rgTipoSel.ItemIndex = 0) then
    begin
      Add('  (RP.IDRUBRICA    = RXR.IDRUBSECUND) AND');
      Add('  (RXR.IDRUBPRINC  = RP2.IDRUBRICA) AND');
      Add('  (RXR.IDRUBPRINC  = PD.IDPROVENTO) AND');
      Add('  (RP2.CODPROVDESC = H.CODPROVDESC) AND');
      Add('  (RXR.IDRUBPRINC  = H.IDRUBRICA) AND');
    end
    else
    begin
      Add('  (RP.IDRUBRICA    = PD.IDPROVENTO) AND');
      Add('  (RP.CODPROVDESC  = H.CODPROVDESC) AND');
    end;
    Add('  (H.MES          >= '+QuotedStr(sMesIni)+') AND');
    if (rbLimitadoPorQuantMeses.Checked) then
      Add('  (H.MES          <= ' +QuotedStr(sMesFin)+ ') AND');
    Add('  (H.MES           = RECOLHIM.MES(+))');
    Add('UNION');
    Add('SELECT');
    Add('  1 AS SAL_PARTE_FIXA,');
    Add('  ('' '') AS RECOLHIMENTO,');
    Add('  '+QuotedStr(sCodRubSalParteFixa)+' AS COD_RUBRICA,');
    Add('  ''Salário (Parte Fixa)'' AS NOM_RUBRICA,');
    Add('  PD.FLGDESCONTO AS TIPO_INCID,');
    Add('  SUBSTR(H.MES,1,4) AS ANO,');
    Add('  H.MES,');
    Add('  H.VALORPROVENTO');
    Add('FROM');
    Add('  HISTRUBSAL H, RUBRICAXPESS RP, PROVDESC PD');
    Add('WHERE');
    Add('  (RP.CODPROVDESC = '+QuotedStr(sCodRubSalParteFixa)+') AND');
    Add('  (H.IDPESSOA     = '+qryFunc.FieldByName('IDPESSOA').asString+ ') AND');
    Add('  (H.MES         >= '+QuotedStr(sMesIni)+') AND');
    if (rbLimitadoPorQuantMeses.Checked) then
      Add('  (H.MES         <= ' +QuotedStr(sMesFin)+ ') AND');
    Add('  (RP.IDRUBRICA   = PD.IDPROVENTO) AND');
    Add('  (RP.CODPROVDESC = H.CODPROVDESC)');
    Add('ORDER BY');
    Add('  MES');
    //SaveToFile('c:\qryAux.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qryAux.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;

  // Monta Query Principal
  with (dtmRelatorios) do
  begin
    frmAguarde.Mostra('Relação dos Salários de Contribuição');
    frmAguarde.Pos := 0;

    // Aponto o UpdateSQL para a query principal
    qryRelSalContrib.UpdateObject := updSQL;

    if not(qryRelSalContrib.IsEmpty) then
      qryRelSalContrib.CancelUpdates;
    if not(qryRelSalContrib2.IsEmpty) then
      qryRelSalContrib2.CancelUpdates;
    if not(qryRelSalContrib3.IsEmpty) then
      qryRelSalContrib3.CancelUpdates;

    // Processa dados para a geração da query
    //bTeste := (TComponent(Sender).Name = 'Button1');
    GerarRelatorios;
    {if (bTeste) then
    begin
      wwDBGrid1.Align := alClient;
      wwDBGrid1.Visible := true;
      Self.ModalResult := mrNone;
    end;}

    // Especifico Configurações do Relatório
    ConfigRelat;
  end;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------
procedure TfrmParamRelSalContrib.GerarRelatorios;
begin
  dtmBaseDados.qry.Open;

  cdsAux.Close;
  cdsAux.IndexName := '';
  cdsAux.Open;

  if not(cdsAux.IsEmpty) then
  begin
    sDataPorExtenso := dtmBaseDados.qry.FieldByName('CIDADE').asString +'  '+
      Copy(DateToStr(Date),1,2) +', '+ MesExtensoAno(Copy(DateToStr(Date),7,4)+'/'+
      Copy(DateToStr(Date),4,2));

    frmAguarde.Min := 0;
    frmAguarde.Max := cdsAux.RecordCount * 2;

    // Relação dos Salários de Contribuição
    GerarRelatorio0;
    //if (bTeste) then
    //  exit;

    // Aumentos Salariais
    GerarRelatorio1;

    // Discriminação das Parcelas do Salário-Contribuição
    GerarRelatorio2;

    with (dtmRelatorios) do
    begin
      // Requerimento de Benefício por Incapacidade
      if (rgImprimeRelReqBenefIncap.ItemIndex = 0) then
      begin
        rpRelSalContribSubRep3.DataPipeline := ppRelSalContrib3;
        rpRelSalContribSubRep3.Visible := true;
        GerarRelatorio3;
      end
      else
      begin
        rpRelSalContribSubRep3.DataPipeline := nil;
        rpRelSalContribSubRep3.Visible := false;
      end;

      // Atestado de Afastamento do Trabalho
      if (rgImprimeRelAtestAfastTrab.ItemIndex = 0) then
      begin
        rpRelSalContribSubRep4.DataPipeline := ppRelSalContrib;
        rpRelSalContribSubRep4.Visible := true;
        GerarRelatorio4;
      end
      else
      begin
        rpRelSalContribSubRep4.DataPipeline := nil;
        rpRelSalContribSubRep4.Visible := false;
      end;

      qryRelSalContrib.First;
      cdsRelSalContrib2.First;
    end;
  end
  else
  begin
    ModalResult := mrNone;
    frmAguarde.Apaga;
    MsgDlg('Não há dados a serem exibidos.'+CR_LF+'Verifique.', 'Aviso',
      mtInformation, [mbOk,mbHelp], 0);
  end;
end;

procedure TfrmParamRelSalContrib.GerarRelatorio0;
var
  iMesAtual, iNumAno, iAnoAtual: integer;
begin
  with (dtmRelatorios.qryRelSalContrib) do
  begin
    Close;
    Open;
    repeat
      Insert;
      // Dados do Estabelecimento
      FieldByName('EMPRESA').asString := dtmBaseDados.qry.FieldByName('EMPRESA').asString;
      FieldByName('CNPJ').asString := dtmBaseDados.qry.FieldByName('CNPJ').asString;
      FieldByName('ENDERECO').asString := dtmBaseDados.qry.FieldByName('ENDERECO').asString;
      // Dados do Empregado
      FieldByName('EMPREGADO').asString := dtmBaseDados.qry.FieldByName('EMPREGADO').asString;
      FieldByName('INCRICAO').asString := dtmBaseDados.qry.FieldByName('INCRICAO').asString;
      FieldByName('CPF').asString := dtmBaseDados.qry.FieldByName('CPF').asString;
      FieldByName('PIS').asString := dtmBaseDados.qry.FieldByName('PIS').asString;
      FieldByName('DATAADMISSAO').asString := dtmBaseDados.qry.FieldByName('DATAADMISSAO').asString;
      FieldByName('DATADESLIGAMENTO').asString := dtmBaseDados.qry.FieldByName('DATADESLIGAMENTO').asString;
      FieldByName('MOTIVO').asString := dtmBaseDados.qry.FieldByName('MOTIVO').asString;

      // LOOP para todas as contribuições do empregado
      iAnoAtual := StrInt(Copy(cdsAux.FieldByName('MES').asString,1,4));
      iNumAno := 1;
      repeat
        rValorMes := 0;
        sMesAtual := cdsAux.FieldByName('MES').asString;
        iMesAtual := StrInt(Copy(sMesAtual,6,2));
        FieldByName('RECOLHIMENTO_' +IntToStr(iMesAtual) +'_'+ IntToStr(iNumAno)).asString :=
          cdsAux.FieldByName('RECOLHIMENTO').asString;
        repeat
          if (cdsAux.FieldByName('TIPO_INCID').asInteger = 1) then
            rValorMes := rValorMes - cdsAux.FieldByName('VALORPROVENTO').asFloat
          else
            rValorMes := rValorMes + cdsAux.FieldByName('VALORPROVENTO').asFloat;

          frmAguarde.Pos := frmAguarde.Pos+1;
          cdsAux.Next;
        until (cdsAux.EOF) or (cdsAux.FieldByName('MES').asString <> sMesAtual);

        FieldByName('ANO_'+IntToStr(iNumAno)).asInteger := iAnoAtual;
        FieldByName('VAL_'+IntToStr(iMesAtual)+'_'+IntToStr(iNumAno)).asFloat := Abs(rValorMes);
        FieldByName('TOTAL_ANO_' +IntToStr(iNumAno)).asFloat :=
          FieldByName('TOTAL_ANO_' +IntToStr(iNumAno)).asFloat + Abs(rValorMes);

        if (iAnoAtual <> StrInt(Copy(cdsAux.FieldByName('MES').asString,1,4))) then
        begin
          iAnoAtual := StrInt(Copy(cdsAux.FieldByName('MES').asString,1,4));
          Inc(iNumAno);
        end;
      until (cdsAux.EOF) or ((iMesAtual = 12) and (iNumAno = 6));
    until (cdsAux.EOF);
    Post;
  end;
end;

procedure TfrmParamRelSalContrib.GerarRelatorio1;
var
  sDataIni, sDataFin: string;
begin
  // Data inicial e final para a seleção dos aumentos salariais
  sDataIni := '01/'+ Copy(sMesIni,6,2) +'/'+ Copy(sMesIni,1,4);
  sDataFin := IntToStr(TrazUltDiaMes(StrInt(Copy(sMesFin,6,2)), StrInt(Copy(sMesFin,1,4)))) +
    '/'+ Copy(sMesFin,6,2) +'/'+ Copy(sMesFin,1,4);

  with (dtmRelatorios.qryRelSalContrib1) do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT');
    SQL.Add('  TO_CHAR(EF.DATAALTERFUNC,''MM/YYYY'') AS MESANO,');
    SQL.Add('  ''     '' || MO.DESCRICAO AS MOTIVO,');
    SQL.Add('  EF.PERC_REAJ');
    SQL.Add('FROM');
    SQL.Add('  EVOLFUNC EF, MOTIVO MO');
    SQL.Add('WHERE');
    SQL.Add('  (EF.IDPESSOA       = ' +qryFunc.FieldByName('IDPESSOA').asString+ ') AND');
    SQL.Add('  (EF.DATAALTERFUNC >= TO_DATE(' +QuotedStr(sDataIni)+ ',''DD/MM/YYYY'')) AND');

    if (rbLimitadoPorQuantMeses.Checked) then
      SQL.Add('  (EF.DATAALTERFUNC <= TO_DATE(' +QuotedStr(sDataFin)+ ',''DD/MM/YYYY'')) AND');

    SQL.Add('  (EF.PERC_REAJ      > 0) AND');
    SQL.Add('  (EF.IDMOTIVO       = MO.IDMOTIVO)');
    SQL.Add('ORDER BY');
    SQL.Add('  EF.DATAALTERFUNC');
    //SQL.SaveToFile('c:\qry1.txt');
    SQL.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry1.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
    Open;
  end;
end;

procedure TfrmParamRelSalContrib.GerarRelatorio2;
var
  c: byte;
  sMes, sAno: string;
begin
  cdsAux.IndexName := 'cdsAuxIndex';
  cdsAux.First;

  with (dtmRelatorios.cdsRelSalContrib2) do
  begin
    Close;
    Open;

    repeat
      sCodRub := cdsAux.FieldByName('COD_RUBRICA').asString;
      // LOOP para cada Rubrica do Empregado
      repeat
        sAno := Copy(cdsAux.FieldByName('MES').asString,1,4);

        Insert;
        FieldByName('RUBRICA').asString := cdsAux.FieldByName('NOM_RUBRICA').asString;
        FieldByName('ANO').asString := sAno;

        // Zero todos os Valores para a visualização dos ZEROS no Relatório
        for c:=1 to 12 do
        begin
          FieldByName('VAL_ABS_'+PoeZero(c)).asFloat := 0;
          FieldByName('VAL_'+PoeZero(c)).asFloat := 0;
        end;

        // LOOP a Rubrica Atual no mesmo Ano
        repeat
          rValorMes := 0;
          sMes := Copy(cdsAux.FieldByName('MES').asString,6,2);
          // LOOP de Somatório das Rubricas que compõe Atual no mesmo Ano
          repeat
            if (cdsAux.FieldByName('TIPO_INCID').asInteger = 1) then
              rValorMes := rValorMes - cdsAux.FieldByName('VALORPROVENTO').asFloat
            else
              rValorMes := rValorMes + cdsAux.FieldByName('VALORPROVENTO').asFloat;

            frmAguarde.Pos := frmAguarde.Pos+1;
            cdsAux.Next;
          until (cdsAux.FieldByName('MES').asString <> sAno+'/'+sMes) or (cdsAux.EOF) or
                (cdsAux.FieldByName('COD_RUBRICA').asString <> sCodRub);

          FieldByName('VAL_ABS_'+sMes).asFloat := Abs(rValorMes);
          FieldByName('VAL_'+sMes).asFloat := rValorMes;
        until (cdsAux.EOF) or (cdsAux.FieldByName('ANO').asString <> sAno) or
              (cdsAux.FieldByName('COD_RUBRICA').asString <> sCodRub);
        Post;
      until (cdsAux.EOF) or (cdsAux.FieldByName('COD_RUBRICA').asString <> sCodRub);
    until (cdsAux.EOF);
  end;
end;

procedure TfrmParamRelSalContrib.GerarRelatorio3;
begin
  with (dtmRelatorios.qryRelSalContrib3) do
  begin
    // Aponto o UpdateSQL para a query
    UpdateObject := dtmRelatorios.updSQL;
    Close;
    Open;

    Insert;
    FieldByName('EMPREGADO').asString := dtmBaseDados.qry.FieldByName('EMPREGADO').asString;
    FieldByName('DATANASC').asString := dtmBaseDados.qry.FieldByName('DATANASC').asString;
    FieldByName('ENDERECO').asString := dtmBaseDados.qry.FieldByName('EMPREGADO_END').asString;
    FieldByName('CEP').asString := dtmBaseDados.qry.FieldByName('EMPREGADO_CEP').asString;

    if (dtmBaseDados.qry.FieldByName('SEXO').asString = 'F') then
      FieldByName('FEMININO').asString := 'X'
    else
      FieldByName('MASCULINO').asString := 'X';

    FieldByName('NACIONALIDADE').asString := dtmBaseDados.qry.FieldByName('NOMENACIONALIDADE').asString;
    FieldByName('INCRICAO').asString := dtmBaseDados.qry.FieldByName('INCRICAO').asString;
    FieldByName('PIS').asString := dtmBaseDados.qry.FieldByName('PIS').asString;
    FieldByName('CPF').asString := dtmBaseDados.qry.FieldByName('CPF').asString;
    FieldByName('NUMDEPIRRF').asString := PoeZero(dtmBaseDados.qry.FieldByName('NUMDEPIRRF').asInteger);

    if (dtmBaseDados.qry.FieldByName('ESTCIVIL').asString = 'S') then
      FieldByName('SOLTEIRO').asString := 'X'
    else
    if (dtmBaseDados.qry.FieldByName('ESTCIVIL').asString = 'C') then
      FieldByName('CASADO').asString := 'X'
    else
    if (dtmBaseDados.qry.FieldByName('ESTCIVIL').asString = 'V') then
      FieldByName('VIUVO').asString := 'X'
    else
    if (dtmBaseDados.qry.FieldByName('ESTCIVIL').asString = 'D') or
       (dtmBaseDados.qry.FieldByName('ESTCIVIL').asString = 'J') or
       (dtmBaseDados.qry.FieldByName('ESTCIVIL').asString = 'E') then
      FieldByName('DESQUITADO_DIVORCIADO').asString := 'X';

    if (dtmBaseDados.qry.FieldByName('TIPOCONTRATO').asString = 'E') or
       (dtmBaseDados.qry.FieldByName('TIPOCONTRATO').asString = 'S') then
      FieldByName('SIT_EMPREGADO').asString := 'X'
    else
    if (dtmBaseDados.qry.FieldByName('TIPOCONTRATO').asString = 'P') then
      FieldByName('SIT_EMPRESARIO').asString := 'X'
    else
    if (dtmBaseDados.qry.FieldByName('TIPOCONTRATO').asString = 'A') then
      FieldByName('SIT_AUTONOMO').asString := 'X';

    if (rgGozoBenef.ItemIndex = 0) then
      FieldByName('POSSUI_BENEF').asString := 'X'
    else
      FieldByName('NAO_POSSUI_BENEF').asString := 'X';

    if (rgOutraAtiv.ItemIndex = 0) then
      FieldByName('POSSUI_VINC').asString := 'X'
    else
      FieldByName('NAO_POSSUI_VINC').asString := 'X';

    FieldByName('LOCAL_DATA').asString := dtmBaseDados.qry.FieldByName('CIDADE').asString +'  '+
      IntToStr(ExtraiDia(Date)) + ', '+ MesExtensoAno(RetornaAnoMes(Date));

    Post;
  end;
end;

procedure TfrmParamRelSalContrib.GerarRelatorio4;
var
  c: byte;
begin
  with (dtmRelatorios) do
  begin
    for c:=0 to stgrFilhos.RowCount-1 do
      TppLabel(FindComponent('rpRelSalContribSubRep4LblPreNome'+
        IntToStr(c+1))).Caption := stgrFilhos.Cells[0,c];

    if not(qryFilhos.IsEmpty) then
    begin
      c:=0;
      qryFilhos.First;
      repeat
        TppLabel(FindComponent('rpRelSalContribSubRep4LblDataNasc'+
          IntToStr(c+1))).Caption := qryFilhos.FieldByName('DataNasc').asString;
        qryFilhos.Next;
        Inc(c);
      until (qryFilhos.EOF);
    end;      
  end;
end;

procedure TfrmParamRelSalContrib.ConfigRelat;
begin
  with (dtmRelatorios) do
  begin
    rpRelSalContrib.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
    rpRelSalContribLblLOCAL_DATA1.Caption := sDataPorExtenso;
    rpRelSalContribSubRep1LblLOCAL_DATA.Caption := sDataPorExtenso;
    rpRelSalContribSubRep2LblLOCAL_DATA.Caption := sDataPorExtenso;
    rpRelSalContribSubRep4LblUltDiaTrab.Caption := dtedUltDiaTrab.Text;

    if (Trim(Doc[1].Mascara) = '') then
    begin
      rpRelSalContribDBTxt2.DisplayFormat := '';
      rpRelSalContribSubRep4DBTxt2.DisplayFormat := '';
    end
    else
    begin
      rpRelSalContribDBTxt2.DisplayFormat := Doc[1].Mascara + ';0;_';
      rpRelSalContribSubRep4DBTxt2.DisplayFormat := Doc[1].Mascara + ';0;_';
    end;

    if (Trim(Doc[2].Mascara) = '') then
      rpRelSalContribDBTxt7.DisplayFormat := ''
    else
      rpRelSalContribDBTxt7.DisplayFormat := Doc[2].Mascara + ';0;_';

    if (Trim(Doc[3].Mascara) = '') then
      rpRelSalContribDBTxt6.DisplayFormat := ''
    else
      rpRelSalContribDBTxt6.DisplayFormat := Doc[3].Mascara + ';0;_';

    if (Trim(Doc[4].Mascara) = '') then
      rpRelSalContribDBTxt10.DisplayFormat := ''
    else
      rpRelSalContribDBTxt10.DisplayFormat := Doc[4].Mascara + ';0;_';
  end;    
end;

procedure TfrmParamRelSalContrib.LeAlteracoes;
var
  sAuxiliar: string;
begin
  // Recupera as últimas alterações das opções
  //ArqConfig := TIniFile.Create('C:\CONFIG_FOLHAPAGTO.INI');
  ArqConfig := TIniFile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CONFIG_FOLHAPAGTO.INI');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332

  rgImprimeRelReqBenefIncap.ItemIndex := StrToInt(ArqConfig.ReadString(
    'REL_RELSALCONTRIB', 'RelReqBenefIncap', '1'));

  sAuxiliar := ArqConfig.ReadString('REL_RELSALCONTRIB', 'Estabelec', '');
  if (sAuxiliar = '') then
  begin
    qryEstab.First;
    sAuxiliar := qryEstab.FieldByName('IDPESSOA').asString;
  end;
  dblkcbEstab.LookUpValue := sAuxiliar;
  dblkcbEstab.UpDate;

{  sAuxiliar := ArqConfig.ReadString('REL_RELSALCONTRIB', 'Empregado', '');
  if (sAuxiliar = '') then
  begin
    qryFunc.First;
    sAuxiliar := qryFunc.FieldByName('IDPESSOA').asString;
  end;
  dblkcbFunc.LookUpValue := sAuxiliar;
  dblkcbFunc.Update;}

  sAuxiliar := ArqConfig.ReadString('REL_RELSALCONTRIB', 'TipoSelecaoRub', 'Incidências');
  rgTipoSel.ItemIndex := IFF(sAuxiliar = 'Incidências',0,1);

  sAuxiliar := ArqConfig.ReadString ('REL_RELSALCONTRIB', 'RubricaSalContrib', '');
  VerificaOpcoes(chklstRubrica, ListaCodRubrica, sAuxiliar, ',');
  edCodRubricas.Text := sAuxiliar;

  sAuxiliar := ArqConfig.ReadString('REL_RELSALCONTRIB', 'RubricaSalParteFixa', '');
  if (sAuxiliar = '') then
  begin
    qryRubSalParteFixa.First;
    sAuxiliar := qryRubSalParteFixa.FieldByName('CODPROVDESC').asString;
  end;
  dblckSalParteFixa.LookUpValue := sAuxiliar;
  dblckSalParteFixa.Update;

  HabilitaBtOk;
end;

procedure TfrmParamRelSalContrib.GravaAlteracoes;
var
  sGravaPadrao: string;
begin
  ArqConfig.WriteString('REL_RELSALCONTRIB','Estabelec',qryEstab.FieldByName('IDPESSOA').asString);
//  ArqConfig.WriteString('REL_RELSALCONTRIB','Empregado',qryFunc.FieldByName('IDPESSOA').asString);
  ArqConfig.WriteString('REL_RELSALCONTRIB','RubricaSalParteFixa',qryRubSalParteFixa.FieldByName('CODPROVDESC').asString);
  ArqConfig.WriteString('REL_RELSALCONTRIB','TipoSelecaoRub',IFF(rgTipoSel.itemIndex = 0,'Incidências','Valor'));
  ArqConfig.WriteString('REL_RELSALCONTRIB','RelReqBenefIncap',IntToStr(rgImprimeRelReqBenefIncap.ItemIndex));

  // Grava as últimas alterações da Opção de Rubricas
  CriaListaOpcoes(chklstRubrica, ListaCodRubrica, sGravaPadrao, ',', false);
  ArqConfig.WriteString('REL_RELSALCONTRIB','RubricaSalContrib',sGravaPadrao);
end;

procedure TfrmParamRelSalContrib.MontaListaFuncionarios;
begin
  if (dblkcbEstab.Text <> '') then
  begin
    qryFunc.DisableControls;
    qryFunc.Close;

    with (qryFunc.SQL) do
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
      Add('  (F.IDPESSOA     = PF.IDPESSOA)');
      Add('ORDER BY');
      Add('  UPPER(NOME)');
    end;
    qryFunc.Open;
    qryFunc.EnableControls;
  end;
  HabilitaBtOk;
end;

procedure TfrmParamRelSalContrib.HabilitaBtOk;
var
  c: integer;
  bSelRub: boolean;
begin
  bSelRub := false;
  for c:=0 to chklstRubrica.Items.Count-1 do
    if (chklstRubrica.Checked[c]) then
    begin
      bSelRub := true;
      break;
    end;

  bbtnConfirmar.Enabled := (bSelRub) and (Trim(dblkcbEstab.Text) <> '') and
    (Trim(dblkcbFunc.Text) <> '') and (Trim(dblckSalParteFixa.Text) <> '') and
    (((rbLimitadoPorData.Checked) and (Trim(speAno.Text) <> '')) or
     ((rbLimitadoPorQuantMeses.Checked) and (Trim(spedQuantMeses.Text) <> '')));
end;

end.
