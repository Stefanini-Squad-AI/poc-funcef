// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamDCT;

interface
                
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook, Spin,
  checklst, IvDictio, IvMulti, IvEMulti, ComCtrls, wwdbdatetimepicker,
  CMDateTimePicker, fSairAjuda, Grids, DBGrids;

type
  TfrmParamDCT = class(TfrmSairAjuda)
    gbxEstabelecimento: TGroupBox;
    dblkcbEstab: TwwDBLookupCombo;
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
    qryEstab: TwwQuery;
    gbxFunc: TGroupBox;
    ToolbarSep971: TToolbarSep97;
    bbtnConfirmar: TBitBtn;
    chklstFunc: TCheckListBox;
    bbtnSelTodosFunc: TBitBtn;
    bbtnInverteSelFunc: TBitBtn;
    chkbxSelSemPIS: TCheckBox;
    Label1: TLabel;
    rgImprimeCarimbo: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblkcbEstabChange(Sender: TObject);
    procedure chklstFuncDrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
      State: TOwnerDrawState);
    procedure chklstFuncClickCheck(Sender: TObject);
    procedure bbtnSelTodosFuncClick(Sender: TObject);
    procedure bbtnInverteSelFuncClick(Sender: TObject);
    procedure chklstFuncKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure chkbxSelSemPISClick(Sender: TObject);
    procedure chkbxSelSemPISKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    sIDPIS: string;
    procedure HabilitaBtOk;
    procedure MontaListaFuncionarios;
    procedure GravaDadosQuery;
  end;

var
  frmParamDCT: TfrmParamDCT;

implementation

uses uSistema, uMensErro, uDiasUteis, uDataBase, fAguarde, dBaseDados,
  uFuncoesUteis, UsoGeralRH, uComumRelats, dRelatorios;

{$R *.DFM}

procedure TfrmParamDCT.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  if not(Assigned(ListaCodFunc)) then
    ListaCodFunc := TStringList.Create;
  IDEstab := -1;

  cmbTipoPapel.Items.Assign (dtmRelatorios.rpDCT.PrinterSetup.PaperNames);

  iPos := ProcuraStList (cmbTipoPapel.Items,'A4');
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

  // ID do PIS
  with (dtmBaseDados.qry) do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT TDO.IDDOCUMENTO');
    SQL.Add('FROM   TIPODOCPESSOA TDP, TIPODOCOFICIAL TDO');
    SQL.Add('WHERE (TDO.SIGLADOCUMENTO = ''PIS/PASEP:'') AND');
    SQL.Add('      (TDO.IDDOCUMENTO    = TDP.IDDOCUMENTO)');
    Open;
    if not(IsEmpty) then
      sIDPIS := FieldByName('IDDOCUMENTO').asString;
    Close;
  end;

  HabilitaBtOk;
end;

procedure TfrmParamDCT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dtmBaseDados.qry.Close;
  qryEstab.Close;
  inherited;
end;

procedure TfrmParamDCT.chklstFuncDrawItem(Control: TWinControl; Index: Integer;
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

procedure TfrmParamDCT.dblkcbEstabChange(Sender: TObject);
begin
  if (qryEstab.FieldByName('IDPESSOA').asInteger <> IDEstab) then
  begin
    MontaListaFuncionarios;
    IDEstab := qryEstab.FieldByName('IDPESSOA').asInteger;
    chklstFunc.Repaint;
  end;
end;

procedure TfrmParamDCT.chklstFuncKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    chklstFuncClickCheck(Sender);
end;

procedure TfrmParamDCT.chkbxSelSemPISKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  MontaListaFuncionarios;
end;

procedure TfrmParamDCT.chklstFuncClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
  HabilitaBtOk;
end;

procedure TfrmParamDCT.chkbxSelSemPISClick(Sender: TObject);
begin
  MontaListaFuncionarios;
end;

procedure TfrmParamDCT.bbtnSelTodosFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := true;
  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamDCT.bbtnInverteSelFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := not(chklstFunc.Checked[c]);
  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamDCT.bbtnConfirmarClick(Sender: TObject);
var
  wNum: word;
  DocID: array[1..3] of integer;
begin
  // Funcionários escolhidos
  wNum := CriaListaOpcoes (chklstFunc, ListaCodFunc, sCodFuncSel, ',', false);
  if (wNum > 50) and (wNum = ListaCodFunc.Count) then
    sCodFuncSel := '';

  // IDs dos Documentos
  with (dtmBaseDados.qry) do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT TDO.IDDOCUMENTO, TDO.SIGLADOCUMENTO, TDP.MASCARA');
    SQL.Add('FROM   TIPODOCPESSOA TDP, TIPODOCOFICIAL TDO');
    SQL.Add('WHERE ((TDO.SIGLADOCUMENTO = ''CTPS:'')   OR');
    SQL.Add('       (TDO.SIGLADOCUMENTO = ''CPF:'')    OR');
    SQL.Add('       (TDO.SIGLADOCUMENTO = ''CNPJ:'')   OR');
    SQL.Add('       (TDO.SIGLADOCUMENTO = ''TITULO:'') OR');
    SQL.Add('       (TDO.SIGLADOCUMENTO = ''RG:''))   AND');
    SQL.Add('      (TDO.IDDOCUMENTO     = TDP.IDDOCUMENTO)');
    Open;
    while not(EOF) do
    begin
      if (FieldByName('SIGLADOCUMENTO').asString = 'CTPS:') then
      begin
        DocID[1] := FieldByName('IDDOCUMENTO').asInteger;
        if (Trim(FieldByName('MASCARA').asString) <> '') then
          dtmRelatorios.rpDCTDBTxt13.DisplayFormat := Copy(FieldByName('MASCARA').asString,1,7) + ';0';
      end
      else
      if (FieldByName('SIGLADOCUMENTO').asString = 'CPF:') and
         (Trim(FieldByName('MASCARA').asString) <> '') then
        dtmRelatorios.rpDCTDBTxt16.DisplayFormat := Copy(FieldByName('MASCARA').asString,1,9) + ';0'
      else
      if (FieldByName('SIGLADOCUMENTO').asString = 'CNPJ:') and
         (Trim(FieldByName('MASCARA').asString) <> '') then
      begin
        dtmRelatorios.rpDCTDBTxt1.DisplayFormat := FieldByName('MASCARA').asString + ';0';
        dtmRelatorios.rpDCTDBTxtCarimboCNPJ.DisplayFormat := FieldByName('MASCARA').asString + ';0';
      end
      else
      if (FieldByName('SIGLADOCUMENTO').asString = 'RG:') then
      begin
        DocID[2] := FieldByName('IDDOCUMENTO').asInteger;
        if (Trim(FieldByName('MASCARA').asString) <> '') then
          dtmRelatorios.rpDCTDBTxt18.DisplayFormat := FieldByName('MASCARA').asString + ';0';
      end
      else
      if (FieldByName('SIGLADOCUMENTO').asString = 'TITULO:') then
      begin
        DocID[3] := FieldByName('IDDOCUMENTO').asInteger;
        if (Trim(FieldByName('MASCARA').asString) <> '') then
          dtmRelatorios.rpDCTDBTxt20.DisplayFormat := FieldByName('MASCARA').asString + ';0';
      end;
      Next;
    end;
  end;

  // Monta Query Auxiliar
  dtmBaseDados.qry.Close;
  with (dtmBaseDados.qry.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  RTRIM(PJ.RAZAOSOCIAL) AS EMPRESA,');
    Add('  PJ.NUMDOCUMENTO AS CNPJ,');
    Add('  RTRIM(EJ.LOGRADOURO) ||'', ''|| EJ.NUMERO ||');
    Add('    DECODE(RTRIM(EJ.COMPLEMENTO),NULL,'''','' - '' || RTRIM(EJ.COMPLEMENTO)) ||');
    Add('    DECODE(RTRIM(EJ.BAIRRO),     NULL,'''','' - '' || RTRIM(EJ.BAIRRO)) ||');
    Add('    DECODE(RTRIM(CIJ.NOME),      NULL,'''','' - '' || RTRIM(CIJ.NOME)) ||');
    Add('    '' - CEP:'' || RTRIM(SUBSTR(EJ.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(EJ.CEP,6,3)) AS END_EMPRESA,');
    Add('  TEL.NUMERO AS TELEFONE,');
    Add('  FAX.NUMERO AS FAX,');
    Add('  PF.NOME AS EMPREGADO,');
    Add('  TO_CHAR(PEFIS.DATANASC,''DD/MM/YYYY'') AS DATANASC,');
    Add('  PEFIS.SEXO,');
    Add('  PEFIS.NOMEMAE,');
    Add('  CIFN.NOME AS CIDADE_NASC,');
    Add('  PEFIS.CODESTADO AS UF_NASC,');
    Add('  PAIS.CODRECEITAFEDERAL AS COD_NACI,');
    Add('  CTPS.NUM AS CTPS_NUM,');
    Add('  CTPS.CODESTADO AS CTPS_UF,');
    Add('  PF.NUMDOCUMENTO AS CPF_NUM,');
    Add('  RG.NUM AS RG_NUM,');
    Add('  RG.ORGAO AS RG_EMISSOR,');
    Add('  TITULO.NUM AS TITULO_NUM,');
    Add('  (EF.LOGRADOURO ||'', ''|| EJ.NUMERO) AS LOGRADOURO,');
    Add('  EF.BAIRRO,');
    Add('  CIF.NOME AS CIDADE,');
    Add('  ES.CODESTADO AS UF,');
    Add('  RTRIM(SUBSTR(EJ.CEP,1,5)) AS CEP1,');
    Add('  RTRIM(SUBSTR(EJ.CEP,6,3)) AS CEP2');
    Add('FROM');
    // -------------------------------------------------------------------------- //
    Add('  PESSOA PJ, PESSOA PF, PESSOAFISICA PEFIS, ENDPESS EF, ENDPESS EJ, FUNCIONARIO F,');
    Add('  ESTADO ES, CIDADES CIFN, CIDADES CIF, CIDADES CIJ, PAIS,');
    // -------------------------------------------------------------------------- //
    // CTPS do Funcionário
    Add('  (SELECT DP.IDPESSOA, DP.NUMDOCUMENTO AS NUM, ES.CODESTADO');
    Add('   FROM   DOCPESSOA DP, ESTADO ES');
    if(sCodFuncSel <> '') then
    begin
      if(Pos(',',sCodFuncSel) > 0) then
        Add('   WHERE (IDPESSOA       IN ('+sCodFuncSel+')) AND')
      else
        Add('   WHERE (IDPESSOA       = '+sCodFuncSel+') AND');
      Add('         (DP.IDDOCUMENTO = ' +IntToStr(DocID[1])+ ') AND');
    end
    else
      Add('   WHERE (DP.IDDOCUMENTO = ' +IntToStr(DocID[1])+ ') AND');
    Add('         (DP.IDPAIS      = ES.IDPAIS) AND');
    Add('         (DP.IDESTADO    = ES.IDESTADO)) CTPS,');
    // -------------------------------------------------------------------------- //
    // RG do Funcionário
    Add('  (SELECT IDPESSOA, NUMDOCUMENTO AS NUM, ORGAO');
    Add('   FROM   DOCPESSOA');
    if(sCodFuncSel <> '') then
    begin
      if(Pos(',',sCodFuncSel) > 0) then
        Add('   WHERE (IDPESSOA   IN ('+sCodFuncSel+')) AND')
      else
        Add('   WHERE (IDPESSOA    = '+sCodFuncSel+') AND');
      Add('         (IDDOCUMENTO = ' +IntToStr(DocID[2])+ ')) RG,');
    end
    else
      Add('   WHERE (IDDOCUMENTO = ' +IntToStr(DocID[2])+ ')) RG,');
    // -------------------------------------------------------------------------- //
    // Título de Eleitor do Funcionário
    Add('  (SELECT IDPESSOA, NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA');
    if(sCodFuncSel <> '') then
    begin
      if(Pos(',',sCodFuncSel) > 0) then
        Add('   WHERE (IDPESSOA   IN ('+sCodFuncSel+')) AND')
      else
        Add('   WHERE (IDPESSOA    = '+sCodFuncSel+') AND');
      Add('         (IDDOCUMENTO = ' +IntToStr(DocID[3])+ ')) TITULO,');
    end
    else
      Add('   WHERE (IDDOCUMENTO = ' +IntToStr(DocID[3])+ ')) TITULO,');
    // -------------------------------------------------------------------------- //
    Add('  (SELECT TE.IDENDERECO, TE.IDTELEFONE, TE.DDD, TE.NUMERO');
    Add('   FROM');
    Add('     TELENDPESS TE,');
    Add('     (SELECT   MIN(IDTELEFONE) AS IDTELEFONE, IDENDERECO');
    Add('      FROM     TELENDPESS');
    Add('      GROUP BY IDENDERECO) END');
    Add('   WHERE');
    Add('     (END.IDTELEFONE = TE.IDTELEFONE)) TEL,');
    // -------------------------------------------------------------------------- //
    Add('  (SELECT TE.IDENDERECO, TE.IDTELEFONE, TE.DDD, TE.NUMERO');
    Add('   FROM');
    Add('     TELENDPESS TE,');
    Add('     (SELECT   MIN(IDTELEFONE) AS IDTELEFONE, IDENDERECO');
    Add('      FROM     TELENDPESS');
    Add('      WHERE    (TIPO LIKE ''%F%'')');
    Add('      GROUP BY IDENDERECO) END');
    Add('   WHERE');
    Add('     (END.IDTELEFONE = TE.IDTELEFONE)) FAX');
    // -------------------------------------------------------------------------- //
    Add('WHERE');
    if(sCodFuncSel <> '') then
    begin
      if(Pos(',',sCodFuncSel) > 0) then
        Add('  (PF.IDPESSOA        IN ('+sCodFuncSel+')) AND')
      else
        Add('  (PF.IDPESSOA         = '+sCodFuncSel+') AND');
    end
    else
    if (chkbxSelSemPIS.Checked) then
      Add('  (PF.IDPESSOA    NOT IN (SELECT IDPESSOA FROM DOCPESSOA WHERE IDDOCUMENTO = ' +sIDPIS+ ')) AND');

    Add('  (PF.IDPESSOA         = F.IDPESSOA)         AND');
    Add('  (PF.IDPESSOA         = PEFIS.IDPESSOA)     AND');
    Add('  (PEFIS.IDPAIS        = PAIS.IDPAIS)        AND');
    Add('  (F.IDESTAB           = PJ.IDPESSOA)        AND');
    Add('  (PJ.IDENDCOMERCIAL   = EJ.IDENDERECO)      AND');
    Add('  (PJ.IDPESSOA         = EJ.IDPESSOA)        AND');
    Add('  (EJ.IDCIDADES        = CIJ.IDCIDADES)      AND');
    Add('  (PF.IDENDRESIDENCIAL = EF.IDENDERECO)      AND');
    Add('  (PF.IDPESSOA         = EF.IDPESSOA)        AND');
    Add('  (EF.IDCIDADES        = CIF.IDCIDADES)      AND');
    Add('  (CIF.IDESTADO        = ES.IDESTADO)        AND');
    Add('  (PEFIS.IDCIDADES     = CIFN.IDCIDADES(+))  AND');
    Add('  (PF.IDPESSOA         = CTPS.IDPESSOA(+))   AND');
    Add('  (PF.IDPESSOA         = RG.IDPESSOA(+))     AND');
    Add('  (PF.IDPESSOA         = TITULO.IDPESSOA(+)) AND');
    Add('  (PJ.IDENDCOMERCIAL   = TEL.IDENDERECO(+))  AND');
    Add('  (PJ.IDENDCOMERCIAL   = FAX.IDENDERECO(+))');
    Add('ORDER BY');
    Add('  EMPREGADO');
    //SaveToFile ('c:\qry.txt');
    SaveToFile (Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt'); //Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;

  // Monta Query Principal
  with (dtmRelatorios) do
  begin
    frmAguarde.Mostra ('Impresso DCT');
    frmAguarde.Pos := 0;

    // Aponto o UpdateSQL para a query principal
    qryDCT.UpdateObject := updSQL;

    if not(qryDCT.IsEmpty) then
      qryDCT.CancelUpdates;
    qryDCT.Close;
    qryDCT.Open;

    // Processa dados para a geração da query
    dtmBaseDados.qry.Open;
    GravaDadosQuery;
    qryDCT.First;

    // Especifico Configurações do Relatório
    rpDCT.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
    rpDCTDBTxtCarimboCNPJ.Visible     := (rgImprimeCarimbo.ItemIndex = 0);
    rpDCTDBTxtCarimboEmpresa.Visible  := (rgImprimeCarimbo.ItemIndex = 0);
    rpDCTDBTxtCarimboEndereco.Visible := (rgImprimeCarimbo.ItemIndex = 0);
  end;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------
procedure TfrmParamDCT.GravaDadosQuery;
var
  c: byte;
  sAux: string;
begin
  with (dtmRelatorios.qryDCT) do
  begin
    if not(dtmBaseDados.qry.IsEmpty) then
    begin
      frmAguarde.Min := 0;
      frmAguarde.Max := dtmBaseDados.qry.RecordCount;

      repeat
        for c:=1 to 2 do
        begin
          Insert;
          FieldByName('EMPRESA').asString     := dtmBaseDados.qry.FieldByName('EMPRESA').asString;
          FieldByName('CNPJ').asString        := dtmBaseDados.qry.FieldByName('CNPJ').asString;
          FieldByName('END_EMPRESA').asString := dtmBaseDados.qry.FieldByName('END_EMPRESA').asString;
          FieldByName('TELEFONE').asString    := dtmBaseDados.qry.FieldByName('TELEFONE').asString;
          FieldByName('FAX').asString         := dtmBaseDados.qry.FieldByName('FAX').asString;
          FieldByName('EMPREGADO').asString   := dtmBaseDados.qry.FieldByName('EMPREGADO').asString;
          FieldByName('DATANASC').asString    := dtmBaseDados.qry.FieldByName('DATANASC').asString;
          FieldByName('SEXO').asString        := dtmBaseDados.qry.FieldByName('SEXO').asString;
          FieldByName('NOMEMAE').asString     := dtmBaseDados.qry.FieldByName('NOMEMAE').asString;
          FieldByName('CIDADE_NASC').asString := dtmBaseDados.qry.FieldByName('CIDADE_NASC').asString;
          FieldByName('UF_NASC').asString     := dtmBaseDados.qry.FieldByName('UF_NASC').asString;
          FieldByName('COD_NACI').asString    := dtmBaseDados.qry.FieldByName('COD_NACI').asString;
          sAux := dtmBaseDados.qry.FieldByName('CTPS_NUM').asString;
          if (sAux <> '') then
          begin
            FieldByName('CTPS_NUM').asString   := Replicate ('0',Abs(7-Length(Copy(sAux,1,7))))+Copy(sAux,1,7);
            FieldByName('CTPS_SERIE').asString := Replicate ('0',Abs(5-Length(Copy(sAux,8,5))))+Copy(sAux,8,5);
            FieldByName('CTPS_UF').asString    := dtmBaseDados.qry.FieldByName('CTPS_UF').asString;
          end
          else
          begin
            FieldByName('CTPS_NUM').asString   := '';
            FieldByName('CTPS_SERIE').asString := '';
            FieldByName('CTPS_UF').asString    := '';
          end;
          sAux := dtmBaseDados.qry.FieldByName('CPF_NUM').asString;
          if (sAux <> '') then
          begin
            FieldByName('CPF_NUM').asString   := Replicate ('0',Abs(9-Length(Copy(sAux,1,9))))+Copy(sAux,1,9);
            FieldByName('CPF_CONTR').asString := Replicate ('0',Abs(2-Length(Copy(sAux,10,2))))+Copy(sAux,10,2);
          end
          else
          begin
            FieldByName('CPF_NUM').asString   := '';
            FieldByName('CPF_CONTR').asString := '';
          end;
          if (dtmBaseDados.qry.FieldByName('RG_NUM').asString <> '') then
          begin
            FieldByName('RG_NUM').asString     := dtmBaseDados.qry.FieldByName('RG_NUM').asString;
            FieldByName('RG_EMISSOR').asString := dtmBaseDados.qry.FieldByName('RG_EMISSOR').asString;
          end
          else
          begin
            FieldByName('RG_NUM').asString     := '';
            FieldByName('RG_EMISSOR').asString := '';
          end;
          sAux := dtmBaseDados.qry.FieldByName('TITULO_NUM').asString;
          if (sAux <> '') then
          begin
            FieldByName('TITULO_NUM').asString := Replicate ('0',Abs(9-Length(Copy(sAux,1,9))))+Copy(sAux,1,9);
            FieldByName('TITULO_DV').asString  := Replicate ('0',Abs(2-Length(Copy(sAux,10,2))))+Copy(sAux,10,2);
          end
          else
          begin
            FieldByName('TITULO_NUM').asString := '';
            FieldByName('TITULO_DV').asString  := '';
          end;
          FieldByName('LOGRADOURO').asString  := dtmBaseDados.qry.FieldByName('LOGRADOURO').asString;
          FieldByName('BAIRRO').asString      := dtmBaseDados.qry.FieldByName('BAIRRO').asString;
          FieldByName('CIDADE').asString      := dtmBaseDados.qry.FieldByName('CIDADE').asString;
          FieldByName('UF').asString          := dtmBaseDados.qry.FieldByName('UF').asString;
          FieldByName('CEP1').asString        := dtmBaseDados.qry.FieldByName('CEP1').asString;
          FieldByName('CEP2').asString        := dtmBaseDados.qry.FieldByName('CEP2').asString;
          if (c = 1) then
            FieldByName('VIA_DCT').asString := '1ª Via da Agência'
          else
            FieldByName('VIA_DCT').asString := '2ª Via do Empregador';
          Post;
        end;
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

procedure TfrmParamDCT.HabilitaBtOk;
var
  c: integer;
  bSelFunc: boolean;
begin
  bSelFunc := false;
  for c:=0 to chklstFunc.Items.Count-1 do
    if (chklstFunc.Checked[c]) then
    begin
      bSelFunc := true;
      break;
    end;

  bbtnConfirmar.Enabled := (dblkcbEstab.Text <> '') and (bSelFunc);
end;

procedure TfrmParamDCT.MontaListaFuncionarios;
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
      Add('  (ST.TIPOSIT        = ''A'') AND');
      Add('  (F.IDSITFUNC       = ST.IDSITFUNC) AND');
      if (chkbxSelSemPIS.Checked) then
      begin
        Add('  (F.IDPESSOA    NOT IN (SELECT IDPESSOA');
        Add('                         FROM   DOCPESSOA');
        Add('                         WHERE  (IDDOCUMENTO = ' +sIDPIS+ '))) AND');
      end;
      Add('  (F.IDPESSOA        = PF.IDPESSOA)');
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

end.
