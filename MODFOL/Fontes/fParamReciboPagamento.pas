// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamReciboPagamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook, Spin,
  checklst, IvDictio, IvMulti, IvEMulti, ComCtrls, fSairAjuda;

type
  TfrmParamReciboPagamento = class(TfrmSairAjuda)
    qryMotivo: TwwQuery;
    gbxEstab: TGroupBox;
    gbxTipoPag: TGroupBox;
    dblkcbMotivo: TwwDBLookupCombo;
    dblkcbEstab: TwwDBLookupCombo;
    qryEstab: TwwQuery;
    gbxAnoMesRef: TGroupBox;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    gbxOrdem: TGroupBox;
    cmbOrderBy: TComboBox;
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
    rgProcesso: TRadioGroup;
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
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure speAnoChange(Sender: TObject);
    procedure dblkcbEstabChange(Sender: TObject);
    procedure gbxSituacaoEnter(Sender: TObject);
    procedure gbxSituacaoExit(Sender: TObject);
    procedure gbxTipContraEnter(Sender: TObject);
    procedure gbxTipContraExit(Sender: TObject);
    procedure chklstFuncClickCheck(Sender: TObject);
    procedure bbtnSelTodosFuncClick(Sender: TObject);
    procedure bbtnInverteSelFuncClick(Sender: TObject);
    procedure chklstFuncDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure chklstFuncKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure HabilitaBtOk;
    procedure GravaDadosQuery;    
    procedure MontaListaFuncionarios;
    function  SelecionaTipoContrato: string;
    function  SelecionaSitFunc: string;        
  end;

var
  frmParamReciboPagamento: TfrmParamReciboPagamento;

implementation

uses uSistema, uMensErro, uDataBase, fAguarde, dBaseDados,
  uFuncoesUteis, UsoGeralRH, uComumRelats, dRelatorios2;

{$R *.DFM}

procedure TfrmParamReciboPagamento.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  if not(Assigned(ListaCodFunc)) then
    ListaCodFunc := TStringList.Create;
  IDEstab := -1;

  cmbTipoPapel.Items.Assign (dtmRelatorios2.rpReciboPagamento.PrinterSetup.PaperNames);

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
  qryMotivo.Open;

  cmbOrderBy.ItemIndex := 0;
  pgctrlEmpregados.ActivePageIndex := 0;

  HabilitaBtOk;  
end;

procedure TfrmParamReciboPagamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dtmBaseDados.qry.Close;
  qryMotivo.Close;
  qryEstab.Close;
  inherited;
end;

procedure TfrmParamReciboPagamento.chklstFuncDrawItem(Control: TWinControl; Index: Integer;
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

procedure TfrmParamReciboPagamento.dblkcbEstabChange(Sender: TObject);
begin
  if (qryEstab.FieldByName('IDPESSOA').asInteger <> IDEstab) then
  begin
    MontaListaFuncionarios;
    IDEstab := qryEstab.FieldByName('IDPESSOA').asInteger;

    if (pgctrlEmpregados.ActivePageIndex = 0) then
      chklstFunc.Repaint;
  end;
end;

procedure TfrmParamReciboPagamento.speAnoChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamReciboPagamento.gbxTipContraEnter(Sender: TObject);
begin
  bTipContrEfet  := cbxEfetivos.Checked;
  bTipContrEspec := cbxEspeciais.Checked;
  bTipContrTemp  := cbxTemporarios.Checked;
  bTipContrEst   := cbxEstagiarios.Checked;
  bTipContrTerc  := cbxTerceiros.Checked;
  bTipContrProp  := cbxPropDirSemVinc.Checked;
  bTipContrAut   := cbxAutonomos.Checked;
end;

procedure TfrmParamReciboPagamento.gbxTipContraExit(Sender: TObject);
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

procedure TfrmParamReciboPagamento.gbxSituacaoEnter(Sender: TObject);
begin
  bSitAtivo := (cbxAtivos.Checked);
  bSitAfast := (cbxAfastados.Checked);
  bSitDemit := (cbxDemitidos.Checked);
end;

procedure TfrmParamReciboPagamento.gbxSituacaoExit(Sender: TObject);
begin
  if not(cbxAtivos.Checked) and not(cbxAfastados.Checked) and not(cbxDemitidos.Checked) then
  begin
    MsgDlg ('Pelo menos um Tipo de Situação deve ser selecionado !', 'Aviso',
      mtInformation, [mbOk,mbHelp], 0);
    cbxAtivos.SetFocus;
  end
  else
  if (bSitAtivo <> cbxAtivos.Checked) or (bSitAfast <> cbxAfastados.Checked) or
     (bSitDemit <> cbxDemitidos.Checked) then
    MontaListaFuncionarios;
end;

procedure TfrmParamReciboPagamento.chklstFuncKeyDown(Sender: TObject;  var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    chklstFuncClickCheck(Sender);
end;

procedure TfrmParamReciboPagamento.chklstFuncClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
  HabilitaBtOk;  
end;

procedure TfrmParamReciboPagamento.bbtnSelTodosFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := true;
  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamReciboPagamento.bbtnInverteSelFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := not(chklstFunc.Checked[c]);
  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamReciboPagamento.bbtnConfirmarClick(Sender: TObject);
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

  dtmBaseDados.qry.Close;
  with (dtmBaseDados.qry.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  PJ.RAZAOSOCIAL AS EMPRESA,');
    Add('  PF.NOME        AS EMPREGADO,');
    Add('  P.FLGDESCONTO  AS TIPORUBRICA,');
    Add('  RTRIM(DECODE(RTRIM(H.REFERENCIA),''***'','''',''Ferias'','''',''Férias'','''',');
    Add('    ''Rescisao'','''',''Rescisão'','''',''13.o Salar'','''',H.REFERENCIA)) AS REFERENCIA,');
    Add('  F.MATRICULA,');
    Add('  CC.NOME AS NOMECENTROCUSTO,');
    Add('  C.TITULO,');
    Add('  P.CODRUBCLT      AS CODRUBRICA,');    
    Add('  RP.CODPROVDESC   AS CODRUBRICACLIENTE,');
    Add('  RP.DESCRPROVDESC AS RUBRICA,');
    Add('  CGC.NUM          AS CGC,');
    Add('  RTRIM(DECODE(RTRIM(ESTADUAL.NUMDOCUMENTO),NULL,');
    Add('    DECODE(RTRIM(MUNICIPAL.NUMDOCUMENTO),NULL,NULL,');
    Add('    ''Inscrição Municipal: ''|| MUNICIPAL.NUMDOCUMENTO),');
    Add('    ''Inscrição Estadual: '' || ESTADUAL.NUMDOCUMENTO)) AS ESTADUALMUNICIPAL,');
    Add('  RTRIM(END.LOGRADOURO) ||'', ''|| END.NUMERO || DECODE(END.COMPLEMENTO,NULL,NULL,'' - '' ||');
    Add('    RTRIM(END.COMPLEMENTO)) ||'' - ''|| RTRIM(END.BAIRRO) ||'' - ''|| RTRIM(CIDADES.NOME) ||'' - CEP:''||');
    Add('    RTRIM(SUBSTR(END.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(END.CEP,6,3)) AS ENDERECO,');
    Add('  H.VALORPROVENTO AS VALOR,');
    Add('  (F.SALARIOATUAL * DECODE(F.TIPOPAGAMENTO,''M'',1,HT.JORNADAMENSAL)) AS SALBASE');
    Add('FROM');
    Add('  '+NomeTabela+' H, PESSOA PJ, PESSOA PF, DOCPESSOA D, ENDPESS END, PROVDESC P,');
    Add('  RUBRICAXPESS RP, FUNCIONARIO F, CARGO C, MOTIVO MO, CIDADES, HORATRAB HT,');
    Add('  CENTCUST CC, SITFUNC ST, PARAMRH PR,');
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
    Add('  (PJ.IDPESSOA       = ' +qryEstab.FieldByName('IDPESSOA').asString+ ') AND');
    Add('  (MO.IDMOTIVO       = ' +qryMotivo.FieldByName('IDMOTIVO').asString+ ') AND');
    Add('  (H.IDPESSJUR       = ' +IntToStr(Sistema.IDEmpresa)+ ') AND');

    // Funcionário(s) selecionado(s) (para HISTRUBSAL)
    if (sCodFuncSel <> '') then
      if (Pos(',',sCodFuncSel) > 0) then
        Add('  (H.IDPESSOA IN (' +sCodFuncSel+ ')) AND')
      else
        Add('  (H.IDPESSOA  = ' +sCodFuncSel+ ') AND');

    Add('  (H.MES             = '+QuotedStr(speAno.Text +'/'+ PoeZero(cmbMes.ItemIndex+1))+ ') AND');

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
          Add('     (F.CODCENTROCUSTO  = ' +sUsuXccusto+ ') AND');
      end;

      sAux := SelecionaSitFunc;
      if (sAux <> '') then
        if (Pos(',',sAux) > 0) then
          Add('     (ST.TIPOSIT       IN (' +sAux+ ')) AND')
        else
          Add('     (ST.TIPOSIT        = ' +sAux+ ') AND');

      sAux := SelecionaTipoContrato;
      if (Pos(',',sAux) > 0) then
        Add('     (F.TIPOCONTRATO   IN (' +sAux+ ')) AND')
      else
        Add('     (F.TIPOCONTRATO    = ' +sAux+ ') AND');
    end;

    Add('  (ST.IDSITFUNC      = F.IDSITFUNC)           AND');
    Add('  (PJ.IDPESSOA       = CGC.IDFILIALPESSOA)    AND');
    Add('  (D.IDPESSOA        = PF.IDPESSOA)           AND');
    Add('  (PJ.IDPESSOA       = F.IDESTAB)             AND');
    Add('  (PF.IDPESSOA       = F.IDPESSOA)            AND');
    Add('  (H.IDPESSOA        = PF.IDPESSOA)           AND');
    Add('  (C.IDCARGO         = F.IDCARGO)             AND');
    Add('  (H.IDMOTIVO        = MO.IDMOTIVO)           AND');
    Add('  (H.IDRUBRICA       = RP.IDRUBRICA)          AND');
    Add('  (CC.IDEMPRESA      = F.IDEMPRESA)           AND');
    Add('  (H.IDRUBRICA       = P.IDPROVENTO)          AND');
    Add('  (RP.IDPESSOA       = F.IDEMPRESA)           AND');
    Add('  (HT.IDHORARIO      = F.IDHORARIO)           AND');
    Add('  (PJ.IDPESSOA       = END.IDPESSOA(+))       AND');
    Add('  (PJ.IDENDCOMERCIAL = END.IDENDERECO(+))     AND');
    Add('  (END.IDCIDADES     = CIDADES.IDCIDADES(+))  AND');
    Add('  (PJ.IDPESSOA       = ESTADUAL.IDPESSOA(+))  AND');
    Add('  (PJ.IDPESSOA       = MUNICIPAL.IDPESSOA(+)) AND');
    Add('  (F.CODCENTROCUSTO  = CC.CODCENTROCUSTO(+))');
    Add('ORDER BY');
    case (cmbOrderBy.ItemIndex) of
      1 : Add('  EMPRESA, CENTROCUSTO, EMPREGADO, TIPORUBRICA, CODRUBRICACLIENTE');
      2 : Add('  EMPRESA, CENTROCUSTO, MATRICULA, TIPORUBRICA, CODRUBRICACLIENTE');
      3 : Add('  EMPRESA, MATRICULA, TIPORUBRICA, CODRUBRICACLIENTE');
     else Add('  EMPRESA, EMPREGADO, TIPORUBRICA, CODRUBRICACLIENTE');
    end;
    //SaveToFile ('c:\qry.txt');
    SaveToFile (Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;

  // Monta Query Principal
  with (dtmRelatorios2) do
  begin
    frmAguarde.Mostra ('Recibo de Pagamento');
    frmAguarde.Pos := 0;

    // Aponto o UpdateSQL para a query principal
    qryReciboPagamento.UpdateObject := updSQL;

    if not(qryReciboPagamento.IsEmpty) then
      qryReciboPagamento.CancelUpdates;
    qryReciboPagamento.Close;
    qryReciboPagamento.Open;

    // Processa dados para a geração da query
    dtmBaseDados.qry.Open;
    GravaDadosQuery;
    qryReciboPagamento.First;

    // Especifico Configurações do Relatório
    rpReciboPagamento.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
  end;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------
procedure TfrmParamReciboPagamento.GravaDadosQuery;
var
  wTotPagEmpregado: word;
  sMatricula: string;
  rSalBase, rBaseINSS, rBaseFGTS, rFGTSMes, rBaseIRRF, rProventos, rDescontos: real;
  iPaginaAtual, iPagina, iRubrica: integer;
  Marca: TBookmark;
begin
  with (dtmRelatorios2.qryReciboPagamento) do
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
          FieldByName('MES_REF').asString           := cmbMes.Items[cmbMes.ItemIndex] +' de '+ speAno.Text;
          FieldByName('MATRICULA').asString         := dtmBaseDados.qry.FieldByName('MATRICULA').asString;
          FieldByName('C_CUSTO').asString           := dtmBaseDados.qry.FieldByName('NOMECENTROCUSTO').asString;
          FieldByName('CARGO').asString             := dtmBaseDados.qry.FieldByName('TITULO').asString;
          FieldByName('EMPRESA').asString           := dtmBaseDados.qry.FieldByName('EMPRESA').asString;
          FieldByName('CGC').asString               := dtmBaseDados.qry.FieldByName('CGC').asString;
          FieldByName('INSCRICAO').asString         := dtmBaseDados.qry.FieldByName('ESTADUALMUNICIPAL').asString;
          FieldByName('ENDERECO').asString          := dtmBaseDados.qry.FieldByName('ENDERECO').asString;

          rSalBase := dtmBaseDados.qry.FieldByName('SALBASE').asFloat;

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
              if (dtmBaseDados.qry.FieldByName('CODRUBRICA').asString = '60025') then
                rBaseINSS := dtmBaseDados.qry.FieldByName('VALOR').asFloat
              else
              // FGTS do Mês
              if (dtmBaseDados.qry.FieldByName('CODRUBRICA').asString = '40695') or
                 (dtmBaseDados.qry.FieldByName('CODRUBRICA').asString = '43696') or
                 (dtmBaseDados.qry.FieldByName('CODRUBRICA').asString = '43700') then
                rFGTSMes := dtmBaseDados.qry.FieldByName('VALOR').asFloat
              else
              // Base do FGTS
              if (dtmBaseDados.qry.FieldByName('CODRUBRICA').asString = '60695') then
                rBaseFGTS := dtmBaseDados.qry.FieldByName('VALOR').asFloat
              else
              // Base do IRRF
              if (dtmBaseDados.qry.FieldByName('CODRUBRICA').asString = '60026') or
                 (dtmBaseDados.qry.FieldByName('CODRUBRICA').asString = '60028') or
                 (dtmBaseDados.qry.FieldByName('CODRUBRICA').asString = '62026') then
                rBaseIRRF := dtmBaseDados.qry.FieldByName('VALOR').asFloat;
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
            FieldByName('SALBASE').asFloat  := rSalBase;
            FieldByName('BASEINSS').asFloat := rBaseINSS;
            FieldByName('BASEFGTS').asFloat := rBaseFGTS;
            FieldByName('FGTSMES').asFloat  := rFGTSMes;
            FieldByName('BASEIRRF').asFloat := rBaseIRRF;
            FieldByName('TOT_PROVENTOS').asFloat := rProventos;
            FieldByName('TOT_DESCONTOS').asFloat := rDescontos;
            FieldByName('TOT_GERAL').asString    := ValStr(rProventos - rDescontos,12,2,true,',');
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

procedure TfrmParamReciboPagamento.HabilitaBtOk;
begin
  bbtnConfirmar.Enabled := (dblkcbMotivo.Text <> '') and (Trim(speAno.Text) <> '');
end;

procedure TfrmParamReciboPagamento.MontaListaFuncionarios;
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

function TfrmParamReciboPagamento.SelecionaTipoContrato: string;
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

function TfrmParamReciboPagamento.SelecionaSitFunc: string;
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
