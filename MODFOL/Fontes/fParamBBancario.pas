// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------

// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------

unit fParamBBancario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, Wwdatsrc, Mask,
  wwdbedit, Wwdotdot, Wwdbcomb, Machklb, wwdblook, checklst, Spin, IvDictio, IvMulti,
  IvEMulti, ComCtrls, wwdbdatetimepicker, CMDateTimePicker, fSairAjuda;

type
  TfrmBBancario = class(TfrmSairAjuda)
    qryMotivo: TwwQuery;
    gbxEstab: TGroupBox;
    gbxTipoPag: TGroupBox;
    dblkcbMotivo: TwwDBLookupCombo;
    dblkcbEstab: TwwDBLookupCombo;
    qryEstab: TwwQuery;
    gbxAnoMesRef: TGroupBox;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    qryFerias: TwwQuery;
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
    rgProcesso: TRadioGroup;
    gbxNContaEmpresa: TGroupBox;
    edNContaEmpresa: TEdit;
    gbxDataCredito: TGroupBox;
    dtedDtCredito: TCMDateTimePicker;
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
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblkcbEstabChange(Sender: TObject);
    procedure chklstFuncDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure gbxTipContraEnter(Sender: TObject);
    procedure gbxTipContraExit(Sender: TObject);
    procedure gbxSituacaoEnter(Sender: TObject);
    procedure gbxSituacaoExit(Sender: TObject);
    procedure chklstFuncClickCheck(Sender: TObject);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure dblkcbMotivoChange(Sender: TObject);
    procedure chklstFuncKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    sNContasAtual, sNContaAtual, sNumBanco: string;

    function  PegaContaAtual: string;    
    procedure HabilitaBtOk;
    procedure GravaDadosQuery;
    procedure MontaListaFuncionarios;
    function  SelecionaTipoContrato: string;
    function  SelecionaSitFunc: string;        
  end;

var
  frmBBancario: TfrmBBancario;

implementation

uses uSistema, uMensErro, uDataBase, fAguarde, dBaseDados,
  uFuncoesUteisRH, UsoGeralRH, uComumRelats, dRelatorios1;

{$R *.DFM}

procedure TfrmBBancario.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  if not(Assigned(ListaCodFunc)) then
    ListaCodFunc := TStringList.Create;
  IDEstab := -1;

  cmbTipoPapel.Items.Assign (dtmRelatorios1.rpRBBancario.PrinterSetup.PaperNames);

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
    qryEstab.SQL[5] := MontaLinhaSelSQL ('  (PJ.IDPESSOA',sUsuXfilial, 1);

  qryEstab.ParamByName('EMPRESA').asInteger := Sistema.IdEmpresa;
  qryEstab.Open;
  qryFerias.Open;
  qryMotivo.Open;

  edNContaEmpresa.Text := '';

  HabilitaBtOk;  
end;

procedure TfrmBBancario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dtmBaseDados.qry.Close;
  qryMotivo.Close;
  qryFerias.Close;
  qryEstab.Close;
  inherited;
end;

procedure TfrmBBancario.chklstFuncDrawItem(Control: TWinControl; Index: Integer;
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

procedure TfrmBBancario.dblkcbEstabChange(Sender: TObject);
begin
  if (qryEstab.FieldByName('IDPESSOA').asInteger <> IDEstab) then
  begin
    MontaListaFuncionarios;
    IDEstab := qryEstab.FieldByName('IDPESSOA').asInteger;

    if (pgctrlEmpregados.ActivePageIndex = 0) then
      chklstFunc.Repaint;
  end;
end;

procedure TfrmBBancario.dblkcbMotivoChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmBBancario.gbxTipContraEnter(Sender: TObject);
begin
  bTipContrEfet  := cbxEfetivos.Checked;
  bTipContrEspec := cbxEspeciais.Checked;
  bTipContrTemp  := cbxTemporarios.Checked;
  bTipContrEst   := cbxEstagiarios.Checked;
  bTipContrTerc  := cbxTerceiros.Checked;
  bTipContrProp  := cbxPropDirSemVinc.Checked;
  bTipContrAut   := cbxAutonomos.Checked;
end;

procedure TfrmBBancario.gbxTipContraExit(Sender: TObject);
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

procedure TfrmBBancario.gbxSituacaoEnter(Sender: TObject);
begin
  bSitAtivo := (cbxAtivos.Checked);
  bSitAfast := (cbxAfastados.Checked);
end;

procedure TfrmBBancario.gbxSituacaoExit(Sender: TObject);
begin
  if not(cbxAtivos.Checked) and not(cbxAfastados.Checked) then
  begin
    MsgDlg ('Pelo menos um Tipo de Situação deve ser selecionado !', 'Aviso',
      mtInformation, [mbOk,mbHelp], 0);
    cbxAtivos.SetFocus;
  end
  else
  if (bSitAtivo <> cbxAtivos.Checked) or (bSitAfast <> cbxAfastados.Checked) then
    MontaListaFuncionarios;
end;

procedure TfrmBBancario.chklstFuncKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmBBancario.chklstFuncClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmBBancario.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := true;
  chklstFunc.Repaint;
end;

procedure TfrmBBancario.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := not(chklstFunc.Checked[c]);
  chklstFunc.Repaint;
end;

procedure TfrmBBancario.bbtnConfirmarClick(Sender: TObject);
var
  wNum: word;
  NomeTabela, sMes: string;
begin
  // Inicia variáveis
  if (rgProcesso.ItemIndex = 0) then
    NomeTabela := 'PREVIAFOLPAG'
  else
    NomeTabela := 'HISTRUBSAL';

  sMes := QuotedStr(IntToStr(speAno.Value) + '/'+ PoeZero(cmbMes.ItemIndex+1));

  // Funcionários selecionados
  wNum := CriaListaOpcoes (chklstFunc, ListaCodFunc, sCodFuncSel, ',', false);
  if (wNum = ListaCodFunc.Count) then
    sCodFuncSel := '';

  // Monta Query Principal
  dtmRelatorios1.qryRBBancario.Close;
  with (dtmRelatorios1.qryRBBancario.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  F.MATRICULA,');
    Add('  PJ.RAZAOSOCIAL    AS EMPRESA,');
    Add('  PF.NOME           AS EMPREGADO ,');
    Add('  PF.NUMDOCUMENTO   AS CPF,');
    Add('  AG.NUMAGENCIA     AS CODAGENCIA ,');
    Add('  PA.NOME           AS NOMEAGENCIA,');
    Add('  F.NUMCONTASALARIO AS CONTA,');

    // Data de Crédito selecionada
    if (Trim(dtedDtCredito.Text) <> '') then
    begin
      Add('  ('+QuotedStr(Copy(dtedDtCredito.Text,1,2))+') AS DIA_CREDITO,');
      Add('  ('+QuotedStr(Copy(dtedDtCredito.Text,4,2))+') AS MES_CREDITO,');
      Add('  ('+QuotedStr(Copy(dtedDtCredito.Text,7,4))+') AS ANO_CREDITO,');
    end
    else
    begin
      Add('  ('' '') AS DIA_CREDITO,');
      Add('  ('' '') AS MES_CREDITO,');
      Add('  ('' '') AS ANO_CREDITO,');
    end;

    Add('  B.NUMBANCO,');
    Add('  PB.NOME AS BANCO,');
    Add('  RTRIM(DECODE(RTRIM(ESTADUAL.NUMDOCUMENTO),NULL,');
    Add('    DECODE(RTRIM(MUNICIPAL.NUMDOCUMENTO),NULL,NULL,');
    Add('    ''Inscrição Municipal: ''|| MUNICIPAL.NUMDOCUMENTO),');
    Add('    ''Inscrição Estadual: '' || ESTADUAL.NUMDOCUMENTO)) AS ESTADUALMUNICIPAL,');
    Add('  PJ.NUMDOCUMENTO AS CGCCPF,');
    Add('  ES.CODESTADO    AS UF,');
    Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO || DECODE(E.COMPLEMENTO,NULL,NULL,'' - '' ||');
    Add('    RTRIM(E.COMPLEMENTO)) ||'' - ''|| RTRIM(E.BAIRRO) ||'' - ''|| RTRIM(CIDADES.NOME) ||');
    Add('    '' - CEP:''|| RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS ENDERECO,');
    Add('  DECODE(END.LOGRADOURO,NULL,NULL,RTRIM(END.LOGRADOURO) ||'', ''|| END.NUMERO ||');
    Add('    DECODE(RTRIM(END.COMPLEMENTO),NULL,NULL,'' - '' || RTRIM(END.COMPLEMENTO)) ||'' - ''||');
    Add('    RTRIM(END.BAIRRO) ||'' - ''|| RTRIM(CID.NOME) ||'' - CEP:''||');
    Add('    RTRIM(SUBSTR(END.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(END.CEP,6,3))) AS ENDERECOAGENCIA,');
    // Se a Rubrica 40999 não existir, calcula
    Add('  DECODE(RUBRICA.VALOR,NULL,(PROVENTOS.VALOR-DESCONTOS.VALOR),RUBRICA.VALOR) AS LIQUIDO');
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, PESSOA PB, PESSOA PA, ENDPESS E, ENDPESS END,');
    Add('  FUNCIONARIO F, BANCO B, CIDADES, CIDADES CID, ESTADO ES, AGENCIABANCARIA AG,');
    Add('  SITFUNC ST,');
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
    // -------------------------------------------------------------------------- //
    // Proventos do Funcionário
    Add('  (SELECT H.IDPESSOA, SUM(H.VALORPROVENTO) AS VALOR');
    Add('   FROM   ' +NomeTabela+ ' H, PROVDESC P, FUNCIONARIO F, SITFUNC ST');
    Add('   WHERE (P.FLGDESCONTO = 0) AND');
    Add('         (F.IDESTAB     = ' +qryEstab.FieldByName('IDPESSOA').asString+ ') AND');

    // Funcionário(s) selecionado(s)
    if (sCodFuncSel <> '') then
      Add(MontaLinhaSelSQL ('         (F.IDPESSOA',sCodFuncSel, 4))
    else
    begin
      // C. de Custo(s) habilitados para o usuário
      if (sUsuXccusto <> '') then
        Add(MontaLinhaSelSQL ('         (F.CODCENTROCUSTO',sUsuXccusto, 1));

      sAux := SelecionaSitFunc;
      Add(MontaLinhaSelSQL ('         (ST.TIPOSIT',sAux, 4));

      sAux := SelecionaTipoContrato;
      Add(MontaLinhaSelSQL ('         (F.TIPOCONTRATO',sAux, 1));
    end;

    Add('         (H.IDPESSJUR    = ' +IntToStr(Sistema.IDEmpresa)+ ') AND');
    Add('         (H.MES          = ' +sMes+ ') AND');
    Add('         (H.IDMOTIVO     = ' +qryMotivo.FieldByName('IDMOTIVO').asString+ ') AND');
    Add('         (ST.IDSITFUNC   = F.IDSITFUNC) AND');
    Add('         (P.IDPROVENTO   = H.IDRUBRICA) AND');
    Add('         (F.IDPESSOA     = H.IDPESSOA)');
    Add('   GROUP BY H.IDPESSOA) PROVENTOS,');
    // -------------------------------------------------------------------------- //
    // Descontos do Funcionário
    Add('  (SELECT H.IDPESSOA, SUM(H.VALORPROVENTO) AS VALOR');
    Add('   FROM   ' +NomeTabela+ ' H, PROVDESC P, FUNCIONARIO F, SITFUNC ST');
    Add('   WHERE (P.FLGDESCONTO = 1) AND');
    Add('         (F.IDESTAB     = ' +qryEstab.FieldByName('IDPESSOA').asString+ ') AND');

    // Funcionário(s) selecionado(s)
    if (sCodFuncSel <> '') then
      Add(MontaLinhaSelSQL ('         (F.IDPESSOA',sCodFuncSel, 4))
    else
    begin
      // C. de Custo(s) habilitados para o usuário
      if (sUsuXccusto <> '') then
        Add(MontaLinhaSelSQL ('         (F.CODCENTROCUSTO',sUsuXccusto, 1));

      sAux := SelecionaSitFunc;
      Add(MontaLinhaSelSQL ('         (ST.TIPOSIT',sAux, 4));

      sAux := SelecionaTipoContrato;
      Add(MontaLinhaSelSQL ('         (F.TIPOCONTRATO',sAux, 1));
    end;

    Add('         (H.IDPESSJUR    = ' +IntToStr(Sistema.IDEmpresa)+ ') AND');
    Add('         (H.MES          = ' +sMes+ ') AND');
    Add('         (H.IDMOTIVO     = ' +qryMotivo.FieldByName('IDMOTIVO').asString+ ') AND');
    Add('         (ST.IDSITFUNC   = F.IDSITFUNC) AND');
    Add('         (P.IDPROVENTO   = H.IDRUBRICA) AND');
    Add('         (F.IDPESSOA     = H.IDPESSOA)');
    Add('   GROUP BY H.IDPESSOA) DESCONTOS,');
    // -------------------------------------------------------------------------- //
    // Rubrica de Salário
    Add('  (SELECT H.IDPESSOA,H.VALORPROVENTO AS VALOR');
    Add('   FROM   ' +NomeTabela+ ' H, PROVDESC P, FUNCIONARIO F, SITFUNC ST');
    Add('   WHERE (P.CODRUBCLT  = ''40999'') AND');
    Add('         (F.IDESTAB    = ' +qryEstab.FieldByName('IDPESSOA').asString+ ') AND');

    // Funcionário(s) selecionado(s)
    if (sCodFuncSel <> '') then
      Add(MontaLinhaSelSQL ('         (F.IDPESSOA',sCodFuncSel, 4))
    else
    begin
      // C. de Custo(s) habilitados para o usuário
      if (sUsuXccusto <> '') then
        Add(MontaLinhaSelSQL ('         (F.CODCENTROCUSTO',sUsuXccusto, 1));

      sAux := SelecionaSitFunc;
      Add(MontaLinhaSelSQL ('         (ST.TIPOSIT',sAux, 4));

      sAux := SelecionaTipoContrato;
      Add(MontaLinhaSelSQL ('         (F.TIPOCONTRATO',sAux, 4));
    end;

    Add('         (H.IDPESSJUR    = ' +IntToStr(Sistema.IDEmpresa)+ ') AND');
    Add('         (H.MES          = ' +sMes+ ') AND');
    Add('         (H.IDMOTIVO     = ' +qryMotivo.FieldByName('IDMOTIVO').asString+ ') AND');
    Add('         (ST.IDSITFUNC   = F.IDSITFUNC) AND');
    Add('         (P.IDPROVENTO   = H.IDRUBRICA) AND');
    Add('         (F.IDPESSOA     = H.IDPESSOA)) RUBRICA');
    // -------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (PJ.IDPESSOA        = ' +qryEstab.FieldByName('IDPESSOA').asString+ ') AND');

    // Funcionário(s) selecionado(s)
    if (sCodFuncSel <> '') then
      Add(MontaLinhaSelSQL ('  (F.IDPESSOA',sCodFuncSel, 8))
    else
    begin
      // C. de Custo(s) habilitados para o usuário
      if (sUsuXccusto <> '') then
        Add(MontaLinhaSelSQL ('  (F.CODCENTROCUSTO',sUsuXccusto, 2));

      sAux := SelecionaSitFunc;
      Add(MontaLinhaSelSQL ('  (ST.TIPOSIT',sAux, 8));

      sAux := SelecionaTipoContrato;
      Add(MontaLinhaSelSQL ('  (F.TIPOCONTRATO',sAux, 4));
    end;

    Add('  (ST.IDSITFUNC       = F.IDSITFUNC) AND');
    Add('  (PJ.IDPESSOA        = F.IDESTAB) AND');
    Add('  (F.IDPESSOA         = PF.IDPESSOA) AND');
    Add('  (F.IDAGENCIASALARIO = AG.IDPESSOA) AND');
    Add('  (AG.IDBANCO         = B.IDPESSOA) AND');
    Add('  (AG.IDPESSOA        = PA.IDPESSOA) AND');
    Add('  (B.IDPESSOA         = PB.IDPESSOA) AND');
    Add('  ((PROVENTOS.VALOR IS NOT NULL) OR');
    Add('   (DESCONTOS.VALOR IS NOT NULL) OR');
    Add('   (RUBRICA.VALOR   IS NOT NULL)) AND');
    Add('  (PJ.IDPESSOA       = E.IDPESSOA) AND');
    Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO) AND');
    Add('  (E.IDCIDADES       = CIDADES.IDCIDADES) AND');
    Add('  (CIDADES.IDESTADO  = ES.IDESTADO) AND');
    Add('  (PA.IDPESSOA       = END.IDPESSOA(+)) AND');
    Add('  (PA.IDENDCOMERCIAL = END.IDENDERECO(+)) AND');
    Add('  (END.IDCIDADES     = CID.IDCIDADES(+)) AND');
    Add('  (PJ.IDPESSOA       = ESTADUAL.IDPESSOA(+)) AND');
    Add('  (PJ.IDPESSOA       = MUNICIPAL.IDPESSOA(+)) AND');
    Add('  (PF.IDPESSOA       = RUBRICA.IDPESSOA(+)) AND');
    Add('  (PF.IDPESSOA       = DESCONTOS.IDPESSOA(+)) AND');
    Add('  (PF.IDPESSOA       = PROVENTOS.IDPESSOA(+))');
    Add('ORDER BY');
    Add('  NUMBANCO, NOMEAGENCIA, EMPREGADO');
    //SaveToFile ('c:\qry.txt');
    SaveToFile (Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332

  end;

  // Monta Query Secundária Auxiliar
  dtmRelatorios1.qryRBBancarioSub.Close;
  with (dtmBaseDados.qry.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  (AG.NUMAGENCIA) AS CODAGENCIA,');
    Add('  (PA.NOME)       AS NOMEAGENCIA,');
    Add('  B.NUMBANCO,');
    Add('  COUNT (*) NUM_FUNC,');
    Add('  SUM(DECODE(RUBRICA.VALOR,NULL,(PROVENTOS.VALOR-DESCONTOS.VALOR),RUBRICA.VALOR)) AS LIQUIDO');
    Add('FROM');
    Add('  PESSOA PA, FUNCIONARIO F, AGENCIABANCARIA AG, BANCO B,'+
      IFF(sCodFuncSel <> '','',' SITFUNC ST,'));
    // -------------------------------------------------------------------------- //
    // Proventos do Funcionário
    Add('  (SELECT H.IDPESSOA, SUM(H.VALORPROVENTO) AS VALOR');
    Add('   FROM   ' +NomeTabela+ ' H, PROVDESC P, FUNCIONARIO F'+
      IFF(sCodFuncSel <> '','',', SITFUNC ST'));
    Add('   WHERE (P.FLGDESCONTO = 0) AND');
    Add('         (F.IDESTAB     = ' +qryEstab.FieldByName('IDPESSOA').asString+ ') AND');

    // Funcionário(s) selecionado(s)
    if (sCodFuncSel <> '') then
      Add(MontaLinhaSelSQL ('         (F.IDPESSOA',sCodFuncSel, 4))
    else
    begin
      // C. de Custo(s) habilitados para o usuário
      if (sUsuXccusto <> '') then
        Add(MontaLinhaSelSQL ('         (F.CODCENTROCUSTO',sUsuXccusto, 1));

      sAux := SelecionaSitFunc;
      Add(MontaLinhaSelSQL ('         (ST.TIPOSIT',sAux, 4));

      sAux := SelecionaTipoContrato;
      Add(MontaLinhaSelSQL ('         (F.TIPOCONTRATO',sAux, 1));
    end;

    Add('         (H.IDPESSJUR    = ' +IntToStr(Sistema.IDEmpresa)+ ') AND');
    Add('         (H.MES          = ' +sMes+ ') AND');
    Add('         (H.IDMOTIVO     = ' +qryMotivo.FieldByName('IDMOTIVO').asString+ ') AND');
    if (sCodFuncSel = '') then
      Add('         (ST.IDSITFUNC   = F.IDSITFUNC) AND');
    Add('         (P.IDPROVENTO   = H.IDRUBRICA) AND');
    Add('         (F.IDPESSOA     = H.IDPESSOA)');
    Add('   GROUP BY H.IDPESSOA) PROVENTOS,');
    // -------------------------------------------------------------------------- //
    // Descontos do Funcionário
    Add('  (SELECT H.IDPESSOA, SUM(H.VALORPROVENTO) AS VALOR');
    Add('   FROM   ' +NomeTabela+ ' H, PROVDESC P, FUNCIONARIO F'+
      IFF(sCodFuncSel <> '','',', SITFUNC ST'));
    Add('   WHERE (P.FLGDESCONTO = 1) AND');
    Add('         (F.IDESTAB     = ' +qryEstab.FieldByName('IDPESSOA').asString+ ') AND');

    // Funcionário(s) selecionado(s)
    if (sCodFuncSel <> '') then
      Add(MontaLinhaSelSQL ('         (F.IDPESSOA',sCodFuncSel, 4))
    else
    begin
      // C. de Custo(s) habilitados para o usuário
      if (sUsuXccusto <> '') then
        Add(MontaLinhaSelSQL ('         (F.CODCENTROCUSTO',sUsuXccusto, 1));

      sAux := SelecionaSitFunc;
      Add(MontaLinhaSelSQL ('         (ST.TIPOSIT',sAux, 4));

      sAux := SelecionaTipoContrato;
      Add(MontaLinhaSelSQL ('         (F.TIPOCONTRATO',sAux, 1));
    end;

    Add('         (H.IDPESSJUR    = ' +IntToStr(Sistema.IDEmpresa)+ ') AND');
    Add('         (H.MES          = ' +sMes+ ') AND');
    Add('         (H.IDMOTIVO     = ' +qryMotivo.FieldByName('IDMOTIVO').asString+ ') AND');
    if (sCodFuncSel = '') then
      Add('         (ST.IDSITFUNC   = F.IDSITFUNC) AND');
    Add('         (P.IDPROVENTO   = H.IDRUBRICA) AND');
    Add('         (F.IDPESSOA    = H.IDPESSOA)');
    Add('   GROUP BY H.IDPESSOA) DESCONTOS,');
    // -------------------------------------------------------------------------- //
    // Rubrica de Salário
    Add('  (SELECT H.IDPESSOA,H.VALORPROVENTO AS VALOR');
    Add('   FROM   ' +NomeTabela+ ' H, PROVDESC P, FUNCIONARIO F'+
      IFF(sCodFuncSel <> '','',', SITFUNC ST'));
    Add('   WHERE (P.CODRUBCLT   = ''40999'') AND');
    Add('         (F.IDESTAB     = ' +qryEstab.FieldByName('IDPESSOA').asString+ ') AND');

    // Funcionário(s) selecionado(s)
    if (sCodFuncSel <> '') then
      Add(MontaLinhaSelSQL ('         (F.IDPESSOA',sCodFuncSel, 4))
    else
    begin
      // C. de Custo(s) habilitados para o usuário
      if (sUsuXccusto <> '') then
        Add(MontaLinhaSelSQL ('         (F.CODCENTROCUSTO',sUsuXccusto, 1));

      sAux := SelecionaSitFunc;
      Add(MontaLinhaSelSQL ('         (ST.TIPOSIT',sAux, 4));

      sAux := SelecionaTipoContrato;
      Add(MontaLinhaSelSQL ('         (F.TIPOCONTRATO',sAux, 1));
    end;

    Add('         (H.IDPESSJUR    = ' +IntToStr(Sistema.IDEmpresa)+ ') AND');
    Add('         (H.MES          = ' +sMes+ ') AND');
    Add('         (H.IDMOTIVO     = ' +qryMotivo.FieldByName('IDMOTIVO').asString+ ') AND');
    if (sCodFuncSel = '') then
      Add('         (ST.IDSITFUNC   = F.IDSITFUNC) AND');
    Add('         (P.IDPROVENTO   = H.IDRUBRICA) AND');
    Add('         (F.IDPESSOA     = H.IDPESSOA)) RUBRICA');
    // -------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (F.IDESTAB          = ' +qryEstab.FieldByName('IDPESSOA').asString+ ') AND');

    // Funcionário(s) selecionado(s)
    if (sCodFuncSel <> '') then
      Add(MontaLinhaSelSQL ('  (F.IDPESSOA',sCodFuncSel, 8))
    else
    begin
      // C. de Custo(s) habilitados para o usuário
      if (sUsuXccusto <> '') then
        Add(MontaLinhaSelSQL ('  (F.CODCENTROCUSTO',sUsuXccusto, 2));

      sAux := SelecionaSitFunc;
      Add(MontaLinhaSelSQL ('  (ST.TIPOSIT',sAux, 8));

      sAux := SelecionaTipoContrato;
      Add(MontaLinhaSelSQL ('  (F.TIPOCONTRATO',sAux, 4));
    end;

    if (sCodFuncSel = '') then
      Add('  (ST.IDSITFUNC       = F.IDSITFUNC) AND');

    Add('  (F.IDAGENCIASALARIO = AG.IDPESSOA) AND');
    Add('  (AG.IDBANCO         = B.IDPESSOA) AND');
    Add('  (AG.IDPESSOA        = PA.IDPESSOA) AND');
    Add('  ((PROVENTOS.VALOR  IS NOT NULL) OR');
    Add('   (DESCONTOS.VALOR  IS NOT NULL) OR');
    Add('   (RUBRICA.VALOR    IS NOT NULL)) AND');
    Add('  (F.IDPESSOA         = PROVENTOS.IDPESSOA(+)) AND');
    Add('  (F.IDPESSOA         = DESCONTOS.IDPESSOA(+)) AND');
    Add('  (F.IDPESSOA         = RUBRICA.IDPESSOA(+))');
    Add('GROUP BY');
    Add('  AG.NUMAGENCIA, PA.NOME, B.NUMBANCO');
    Add('ORDER BY');
    Add('  NUMBANCO');
    //SaveToFile ('c:\qry1.txt');
    SaveToFile (Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry1.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;

  sNContasAtual := Trim(edNContaEmpresa.Text);

  // Monta Query Secundária
  with (dtmRelatorios1) do
  begin
    frmAguarde.Mostra('Relação do Borderô Bancário');
    frmAguarde.Pos := 0;

    // Aponto o UpdateSQL para a query secundária
    qryRBBancarioSub.UpdateObject := updSQL;

    if not(qryRBBancarioSub.IsEmpty) then
      qryRBBancarioSub.CancelUpdates;
    qryRBBancarioSub.Close;
    qryRBBancarioSub.Open;

    // Processa dados para a geração da query
    qryRBBancario.Open;
    dtmBaseDados.qry.Open;
    GravaDadosQuery;
    qryRBBancarioSub.First;

    // Especifico Configurações do Relatório
    sMesRef := cmbMes.Items[cmbMes.ItemIndex]+' de '+speAno.Text;
    rpRBBancario.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
    sTipoFolha := dblkcbMotivo.Text;
  end;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------
procedure TfrmBBancario.GravaDadosQuery;
begin
  with (dtmRelatorios1.qryRBBancarioSub) do
  begin
    if not(dtmRelatorios1.qryRBBancario.IsEmpty) then
    begin
      frmAguarde.Min := 0;
      frmAguarde.Max := dtmRelatorios1.qryRBBancario.RecordCount + dtmBaseDados.qry.RecordCount;

      repeat
        sNContaAtual := PegaContaAtual;
        repeat
          sNumBanco := dtmBaseDados.qry.FieldByName('NUMBANCO').asString;
          Insert;
          FieldByName('CODAGENCIA').asString    := dtmBaseDados.qry.FieldByName('CODAGENCIA').asString;
          FieldByName('NOMEAGENCIA').asString   := dtmBaseDados.qry.FieldByName('NOMEAGENCIA').asString;
          FieldByName('NUMBANCO').asString      := dtmBaseDados.qry.FieldByName('NUMBANCO').asString;
          FieldByName('NUMCONTABANCO').asString := sNContaAtual;
          FieldByName('NUM_FUNC').asString      := dtmBaseDados.qry.FieldByName('NUM_FUNC').asString;
          FieldByName('LIQUIDO').asFloat        := dtmBaseDados.qry.FieldByName('LIQUIDO').asFloat;
          Post;

          dtmBaseDados.qry.Next;
        until (sNumBanco <> dtmBaseDados.qry.FieldByName('NUMBANCO').asString) or
              (dtmBaseDados.qry.EOF);
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

function TfrmBBancario.PegaContaAtual: string;
var
  iPos: integer;
begin
  iPos := Pos(';',sNContasAtual);
  if (iPos > 0) then
  begin
    sAux := Copy (sNContasAtual,1,iPos-1);
    Delete (sNContasAtual,1,iPos);
  end
  else
    sAux := sNContasAtual;

  Result := sAux;
end;

procedure TfrmBBancario.HabilitaBtOk;
begin
  bbtnConfirmar.Enabled := (Trim(dblkcbEstab.Text) <> '') and (Trim(speAno.Text) <> '') and
    (edNContaEmpresa.Text <> '') and (Trim(dblkcbMotivo.Text) <> '');
end;

procedure TfrmBBancario.MontaListaFuncionarios;
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
      if (sAux <> '') then
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
  end;
  HabilitaBtOk;
end;

function TfrmBBancario.SelecionaTipoContrato: string;
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

function TfrmBBancario.SelecionaSitFunc: string;
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
