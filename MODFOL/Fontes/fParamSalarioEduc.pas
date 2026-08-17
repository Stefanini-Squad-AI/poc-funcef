// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamSalarioEduc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook, Spin,
  checklst, IvDictio, IvMulti, IvEMulti, IniFiles, wwdbdatetimepicker, Mask, TREdit,
  CMDateTimePicker, fSairAjuda;

type
  TfrmParamSalarioEduc = class(TfrmSairAjuda)
    qryEstab: TwwQuery;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    gbxEstabelecimento: TGroupBox;
    dblkcbEstab: TwwDBLookupCombo;
    rgGera13: TRadioGroup;
    gbxAnoMesRef: TGroupBox;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    gbxVencimento: TGroupBox;
    dtedVencimento: TCMDateTimePicker;
    gbxAgCetraliz: TGroupBox;
    mkedAgCentraliz: TMaskEdit;
    gbxNumConta: TGroupBox;
    mkedNumConta: TMaskEdit;
    gbxNumConvRec: TGroupBox;
    spedNumConvRec: TSpinEdit;
    gbxPerContrFPAS: TGroupBox;
    redPercContrib: TRealEdit;
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
    gbxTipoPag: TGroupBox;
    chklstTipoFolha: TCheckListBox;
    bbtnSelTodosFunc: TBitBtn;
    bbtnInverteSelFunc: TBitBtn;
    rgProcesso: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblkcbEstabChange(Sender: TObject);
    procedure chklstTipoFolhaDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure chklstTipoFolhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chklstTipoFolhaClickCheck(Sender: TObject);
    procedure bbtnSelTodosFuncClick(Sender: TObject);
    procedure bbtnInverteSelFuncClick(Sender: TObject);
  private
    procedure LeAlteracoes;
    procedure GravaAlteracoes;
    procedure HabilitaBtOk;
  end;

var
  frmParamSalarioEduc: TfrmParamSalarioEduc;

implementation

uses uSistema, uMensErro, uDataBase, fAguarde, dBaseDados,
  uFuncoesUteis, UsoGeralRH, uComumRelats, dRelatorios1;

{$R *.DFM}

procedure TfrmParamSalarioEduc.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  if not(Assigned(ListaCodTipoFolha)) then
    ListaCodTipoFolha := TStringList.Create;

  cmbTipoPapel.Items.Assign (dtmRelatorios1.rpSalarioEduc.PrinterSetup.PaperNames);

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

  // Monto a Lista de Tipos de Folha
  chklstTipoFolha.Items.Clear;
  ListaCodTipoFolha.Clear;
  with (dtmBaseDados.qry) do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT');
    SQL.Add('  IDMOTIVO, DESCRICAO');
    SQL.Add('FROM');
    SQL.Add('  MOTIVO');
    SQL.Add('WHERE');
    SQL.Add('  (GRUPOMOTIVO IN (''F'',''D''))');
    SQL.Add('ORDER BY');
    SQL.Add('  DESCRICAO');
    Open;
    while not(EOF) do
    begin
      ListaCodTipoFolha.Add(FieldByName('IDMOTIVO').asString);
      chklstTipoFolha.Items.Add(FieldByName('DESCRICAO').asString);
      Next;
    end;
  end;

  // Carrega alterações nas opções feitas anteriormente
  LeAlteracoes;
end;

procedure TfrmParamSalarioEduc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GravaAlteracoes;

  dtmBaseDados.qry.Close;
  qryEstab.Close;
  inherited;
end;

procedure TfrmParamSalarioEduc.chklstTipoFolhaDrawItem(Control: TWinControl; Index: Integer;
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

procedure TfrmParamSalarioEduc.chklstTipoFolhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmParamSalarioEduc.dblkcbEstabChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamSalarioEduc.chklstTipoFolhaClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmParamSalarioEduc.bbtnSelTodosFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstTipoFolha.Items.Count-1 do
    chklstTipoFolha.Checked[c] := true;
  chklstTipoFolha.Repaint;
end;

procedure TfrmParamSalarioEduc.bbtnInverteSelFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstTipoFolha.Items.Count-1 do
    chklstTipoFolha.Checked[c] := not(chklstTipoFolha.Checked[c]);
  chklstTipoFolha.Repaint;
end;

procedure TfrmParamSalarioEduc.bbtnConfirmarClick(Sender: TObject);
var
  wNum: word;
  sCodigoBarras, sMes, NomeTabela: string;
begin
  // Inicia variáveis
  if (rgProcesso.ItemIndex = 0) then
    NomeTabela := 'PREVIAFOLPAG'
  else
    NomeTabela := 'HISTRUBSAL';

  sMes := QuotedStr(speAno.Text +'/'+ PoeZero(cmbMes.ItemIndex+1));

  // Tipos de Folha selecionados
  wNum := CriaListaOpcoes (chklstTipoFolha, ListaCodTipoFolha, sCodTipoFolhaSel, ',', false);
  if (wNum = ListaCodTipoFolha.Count) then
    sCodTipoFolhaSel := '';


  // Monta Query Auxiliar
  dtmRelatorios1.qrySalarioEduc.Close;
  with (dtmRelatorios1.qrySalarioEduc.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  RTRIM(PJ.RAZAOSOCIAL) AS ESTAB,');
    Add('  DECODE(CNPJ.NUM,NULL,''0'',''1'') AS TIPO_INSCRICAO,');
    Add('  RTRIM(DECODE(CNPJ.NUM,NULL,CEI.NUM,CNPJ.NUM)) AS INSCRICAO,');
    Add('  LTRIM(RTRIM(DECODE(CNPJ.NUM,NULL,CEI.MASCARA,CNPJ.MASCARA))) AS MASCARA_INSCRICAO,');
    Add('  ('+QuotedStr(spedNumConvRec.Text)+') AS NUMCONVREC,');
    Add('  ('+QuotedStr(IFF(Trim(dtedVencimento.Text)<>'',dtedVencimento.Text,'IDÊNTICO INSS'))+') AS VENCIMENTO,');
    Add('  ('+QuotedStr(mkedAgCentraliz.Text)+') AS AG_CENTRALIZ,');
    Add('  ('+QuotedStr(mkedNumConta.Text)+')    AS NUM_CONTA,');
    Add('  ('''') AS NUMPROC_EXECFISC,');
    Add('  (0) AS VALOR_ATUALIZADO,');
    Add('  (0) AS COMPENSACAO,');
    Add('  (0) AS ATUALIZ_MONET,');
    Add('  (0) AS MULTA_JUROS,');
    Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO ||''''|| DECODE(E.COMPLEMENTO,'' '','' - '' ||''''||');
    Add('    RTRIM(E.COMPLEMENTO)) ||'' - ''|| RTRIM(E.BAIRRO) AS ENDERECO,');
    Add('  RTRIM(CIDADES.NOME) ||''-''|| CIDADES.CODESTADO AS CIDADE,');
    Add('  RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS CEP,');

    if (rgGera13.ItemIndex = 0) then
      Add('  ('+QuotedStr('13/'+ IntToStr(speAno.Value))+') AS REFERENCIA,')
    else
      Add('  ('+QuotedStr(PoeZero(cmbMes.ItemIndex+1) +'/'+ IntToStr(speAno.Value))+') AS REFERENCIA,');

    Add('  NVL(VLR_DED_SME.VALOR,0) AS DEDUCAO_SME,');
    Add('  (VLR_BASE_CONTRIB.VALOR) AS BASE_CONTRIB,');
    if (redPercContrib.Value = 0) then
    begin
      Add('  (VLR_BASE_CONTRIB.VALOR * (CP.PERCCONVPREVID / 100)) AS SAL_EDUCACAO,');
      Add('  ((VLR_BASE_CONTRIB.VALOR * (CP.PERCCONVPREVID / 100)) -'+
          '  NVL(VLR_DED_SME.VALOR,0)) AS VALOR_TOTAL');
    end
    else
    begin
      Add('  (VLR_BASE_CONTRIB.VALOR  * ('+ Float2String(redPercContrib.Value)+' / 100)) AS SAL_EDUCACAO,');
      Add('  ((VLR_BASE_CONTRIB.VALOR * ('+ Float2String(redPercContrib.Value)+' / 100)) -'+
          '  NVL(VLR_DED_SME.VALOR,0)) AS VALOR_TOTAL');
    end;
    Add('FROM');
    if (redPercContrib.Value = 0) then
      Add('  PESSOA PJ, ENDPESS E, CIDADES, CONVPREVID CP, FILIALPESSOA FP,')
    else
      Add('  PESSOA PJ, ENDPESS E, CIDADES, FILIALPESSOA FP,');
    // -------------------------------------------------------------------------- //
    // CNPJ da Empresa
    Add('  (SELECT FP.IDFILIALPESSOA, TDP.MASCARA, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, TIPODOCPESSOA TDP, TIPODOCOFICIAL TDO, FILIALPESSOA FP');
    Add('   WHERE  ((TDO.SIGLADOCUMENTO = ''CNPJ:'')       OR');
    Add('           (TDO.SIGLADOCUMENTO = ''CGC:''))      AND');
    Add('          (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO)  AND');
    Add('          (TDO.IDDOCUMENTO    = TDP.IDDOCUMENTO) AND');
    Add('          (DP.IDPESSOA        = FP.IDFILIALPESSOA)) CNPJ,');
    // -------------------------------------------------------------------------- //
    // CEI da Empresa
    Add('  (SELECT FP.IDFILIALPESSOA, TDP.MASCARA, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, TIPODOCPESSOA TDP, TIPODOCOFICIAL TDO, FILIALPESSOA FP');
    Add('   WHERE  (TDO.SIGLADOCUMENTO = ''CEI:'')       AND');
    Add('          (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
    Add('          (TDO.IDDOCUMENTO    = TDP.IDDOCUMENTO) AND');
    Add('          (DP.IDPESSOA        = FP.IDFILIALPESSOA)) CEI,');
    // -------------------------------------------------------------------------- //
    // FNDE da Empresa
{    Add('  (SELECT FP.IDFILIALPESSOA, TDP.MASCARA, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, TIPODOCPESSOA TDP, TIPODOCOFICIAL TDO, FILIALPESSOA FP');
    Add('   WHERE  (TDO.SIGLADOCUMENTO = ''FNDE:'')       AND');
    Add('          (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO)  AND');
    Add('          (TDO.IDDOCUMENTO    = TDP.IDDOCUMENTO) AND');
    Add('          (DP.IDPESSOA        = FP.IDFILIALPESSOA)) FNDE,');}
    // -------------------------------------------------------------------- //
    // Valor da Dedução para o SME
    Add('  (SELECT F.IDESTAB, SUM(H.VALORPROVENTO) AS VALOR');
    Add('   FROM   '+NomeTabela+' H, PROVDESC P, FUNCIONARIO F');
    Add('   WHERE (P.CODRUBCLT  = ''40460'') AND');
    Add('         (H.MES        = '+sMes+')   AND');

    if (sCodTipoFolhaSel <> '') then
      if (Pos(',',sCodTipoFolhaSel) > 0) then
        Add('         (H.IDMOTIVO  IN (' +sCodTipoFolhaSel+ ')) AND')
      else
        Add('         (H.IDMOTIVO   = ' +sCodTipoFolhaSel+ ') AND');

    Add('         (P.IDPROVENTO = H.IDRUBRICA) AND');
    Add('         (H.IDPESSOA   = F.IDPESSOA)');
    Add('   GROUP BY F.IDESTAB) VLR_DED_SME,');
    // -------------------------------------------------------------------------- //
    // Valor do Salário Educação
    Add('  (SELECT F.IDESTAB, SUM(H.VALORPROVENTO) AS VALOR');
    Add('   FROM   '+NomeTabela+' H, PROVDESC P, FUNCIONARIO F');
    Add('   WHERE (P.CODRUBCLT  = ''60025'')  AND');
    Add('         (H.MES        = ' +sMes+ ') AND');

    if (sCodTipoFolhaSel <> '') then
      if (Pos(',',sCodTipoFolhaSel) > 0) then
        Add('         (H.IDMOTIVO  IN (' +sCodTipoFolhaSel+ ')) AND')
      else
        Add('         (H.IDMOTIVO   = ' +sCodTipoFolhaSel+ ') AND');

    Add('         (P.IDPROVENTO = H.IDRUBRICA) AND');
    Add('         (F.IDPESSOA   = H.IDPESSOA)');
    Add('   GROUP BY F.IDESTAB) VLR_BASE_CONTRIB');
    // -------------------------------------------------------------------------- //
    Add('WHERE');
    // Estabelecimento selecionado
    Add('  (PJ.IDPESSOA       = ' +qryEstab.FieldByName('IDPESSOA').asString+ ') AND');
    Add('  (PJ.IDPESSOA       = FP.IDFILIALPESSOA) AND');
    if (redPercContrib.Value = 0) then
    begin
      Add('  (FP.IDFPAS         = CP.IDFPAS)         AND');
      Add('  (FP.IDCONVPREVID   = CP.IDCONVPREVID)   AND');
    end;
    Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO)      AND');
    Add('  (PJ.IDPESSOA       = E.IDPESSOA)        AND');
    Add('  (E.IDCIDADES       = CIDADES.IDCIDADES) AND');
    Add('  (PJ.IDPESSOA       = VLR_BASE_CONTRIB.IDESTAB) AND');
    Add('  (PJ.IDPESSOA       = VLR_DED_SME.IDESTAB(+))   AND');
//    Add('  (PJ.IDPESSOA       = FNDE.IDFILIALPESSOA(+)) AND');
    Add('  (PJ.IDPESSOA       = CNPJ.IDFILIALPESSOA(+)) AND');
    Add('  (PJ.IDPESSOA       = CEI.IDFILIALPESSOA(+))');
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;

  frmAguarde.Mostra('Salário Educação');
  frmAguarde.Pos := 0;
  dtmRelatorios1.qrySalarioEduc.Open;
  frmAguarde.Min := 0;
  frmAguarde.Max := dtmRelatorios1.qrySalarioEduc.RecordCount;

  if (dtmRelatorios1.qrySalarioEduc.IsEmpty) then
  begin
    ModalResult := mrNone;
    frmAguarde.Apaga;
    MsgDlg('Não há dados a serem exibidos! Verifique.','Aviso',mtInformation,[mbOk,mbHelp],0);
  end
  else
  with (dtmRelatorios1) do
  begin
    // Calculo o Código de Barras
    sCodigoBarras :=
      // 01-Identificação do Produto
      '8'+
      // 02-Identificação do Segmento
      '5'+
      // 03-Valor Referência
      '7'+
      // 04-DAC (no momento não é inserido)
      // 05-Valor da Guia
      '00000000000'+
      // 06-Código do FNDE (Febraban)
      '0155'+
      // 07-Tipo de receita/convênio
      // 1001 - corresponderá ao número "01".
      // 1002 - corresponderá ao número "02".
      // 1006 - corresponderá ao número "06".
      // 1009 - corresponderá ao número "09".
      IFF(spedNumConvRec.Text='1001','01',IFF(spedNumConvRec.Text='1002','02',
      IFF(spedNumConvRec.Text='1006','06',IFF(spedNumConvRec.Text='1009','09','00'))))+
      // 08-Validade da Guia
      FormatDateTime('YYMMDD',dtedVencimento.Date)+
      // 09-Competência
      IFF(rgGera13.ItemIndex=0,Copy(IntToStr(speAno.Value),3,2)+'13',
        Copy(IntToStr(speAno.Value),3,2)+PoeZero(cmbMes.ItemIndex+1))+
      // 10-Tipo de identificação - 0 ou 1
      // Para identificação de empresa com CNPJ, igual a "1".
      // Para identificação de empresa com CEI, igual a "0".
      qrySalarioEduc.FieldByName('TIPO_INSCRICAO').asString+
      // 11-Identificação do Contribuinte
      qrySalarioEduc.FieldByName('INSCRICAO').asString;

    sCodigoBarras := Copy(DVCodigoDeBarras(sCodigoBarras), 01, 11) + ' ' +
                     Copy(DVCodigoDeBarras(sCodigoBarras), 12, 01) + ' ' +
                     Copy(DVCodigoDeBarras(sCodigoBarras), 13, 11) + ' ' +
                     Copy(DVCodigoDeBarras(sCodigoBarras), 24, 01) + ' ' +
                     Copy(DVCodigoDeBarras(sCodigoBarras), 25, 11) + ' ' +
                     Copy(DVCodigoDeBarras(sCodigoBarras), 36, 01) + ' ' +
                     Copy(DVCodigoDeBarras(sCodigoBarras), 37, 11) + ' ' +
                     Copy(DVCodigoDeBarras(sCodigoBarras), 48, 01);

    rpSalarioEducBarCode1.Data         := StringReplace(sCodigoBarras,' ','',[rfReplaceAll]);
    rpSalarioEducBarCode2.Data         := StringReplace(sCodigoBarras,' ','',[rfReplaceAll]);
    rpSalarioEducLblCodBarras1.Caption := sCodigoBarras;
    rpSalarioEducLblCodBarras2.Caption := sCodigoBarras;

    // Máscara da Inscrição
    if (Trim(qrySalarioEduc.FieldByName('MASCARA_INSCRICAO').asString) <> '') then
    begin
      dtmRelatorios1.rpSalarioEducDBTxtINSCRICAO1.DisplayFormat :=
        qrySalarioEduc.FieldByName('MASCARA_INSCRICAO').asString+';0;_';
      dtmRelatorios1.rpSalarioEducDBTxtINSCRICAO2.DisplayFormat :=
        qrySalarioEduc.FieldByName('MASCARA_INSCRICAO').asString+';0;_';
      dtmRelatorios1.rpSalarioEducDBTxtINSCRICAO3.DisplayFormat :=
        qrySalarioEduc.FieldByName('MASCARA_INSCRICAO').asString+';0;_';
      dtmRelatorios1.rpSalarioEducDBTxtINSCRICAO4.DisplayFormat :=
        qrySalarioEduc.FieldByName('MASCARA_INSCRICAO').asString+';0;_';
    end;
    rpSalarioEduc.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
  end;
end;

procedure TfrmParamSalarioEduc.LeAlteracoes;
var
  sLePadrao: string;
begin
  // Recupera as últimas alterações das opções
  //ArqConfig := TIniFile.Create('C:\CONFIG_FOLHAPAGTO.INI');
  ArqConfig := TIniFile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CONFIG_FOLHAPAGTO.INI');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332

  mkedAgCentraliz.Text := ArqConfig.ReadString ('SALARIO_EDUC', 'AgCentraliz', '');
  mkedNumConta.Text    := ArqConfig.ReadString ('SALARIO_EDUC', 'NumConta',    '');
  spedNumConvRec.Text  := ArqConfig.ReadString ('SALARIO_EDUC', 'NumConvRec',  '');

  sLePadrao := ArqConfig.ReadString ('SALARIO_EDUC', 'Estabelecimento', '');
  if (sLePadrao = '') then
  begin
    qryEstab.First;
    sLePadrao := qryEstab.FieldByName('IDPESSOA').asString;
  end
  else
    qryEstab.Locate ('IDPESSOA', sLePadrao, [loCaseInsensitive]);
  dblkcbEstab.LookUpValue := sLePadrao;
  dblkcbEstab.UpDate;

  HabilitaBtOk;  
end;

procedure TfrmParamSalarioEduc.GravaAlteracoes;
begin
  ArqConfig.WriteString ('SALARIO_EDUC', 'Estabelecimento',qryEstab.FieldByName('IDPESSOA').asString);
  ArqConfig.WriteString ('SALARIO_EDUC', 'AgCentraliz', mkedAgCentraliz.Text);
  ArqConfig.WriteString ('SALARIO_EDUC', 'NumConta',    mkedNumConta.Text);
  ArqConfig.WriteString ('SALARIO_EDUC', 'NumConvRec',  spedNumConvRec.Text);
end;

procedure TfrmParamSalarioEduc.HabilitaBtOk;
begin
  bbtnConfirmar.Enabled := (Trim(dblkcbEstab.Text) <> '') and (Trim(speAno.Text) <> '') and
    (Trim(mkedAgCentraliz.Text) <> '') and (Trim(mkedNumConta.Text) <> '') and
    (Trim(spedNumConvRec.Text) <> '');
end;

end.
