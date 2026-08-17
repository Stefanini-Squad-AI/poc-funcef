unit fParamFichaFuncAux;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn, Db,
  StdCtrls, Buttons, ExtCtrls, DBTables, Wwquery, wwdblook, TB97, ComCtrls, TB97Tlbr,
  IvDictio, IvMulti, IvEMulti, fSairAjuda;
  
type
  TfrmParamFichaFuncAux = class(TfrmSairAjuda)
    rgSelecao: TRadioGroup;
    dblcFunc: TwwDBLookupCombo;
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    qry: TwwQuery;
    gbxOpcoesImp: TGroupBox;
    cbxDocumentacao: TCheckBox;
    cbxUltEmpr: TCheckBox;
    cbxTreinamento: TCheckBox;
    cbxExper: TCheckBox;
    cbxAval: TCheckBox;
    cbxMedic: TCheckBox;
    cbxEvolFunc: TCheckBox;
    cbxBenef: TCheckBox;
    cbxFerias: TCheckBox;
    cbxSindical: TCheckBox;
    cbxDepen: TCheckBox;
    cbxSitFunc: TCheckBox;
    cbxObserv: TCheckBox;
    cbxDescCargo: TCheckBox;
    cbxCargoAltern: TCheckBox;
    qryParam: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure rgSelecaoClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure HabilitaBtOk;
  end;

var
  frmParamFichaFuncAux: TfrmParamFichaFuncAux;

implementation

uses uSistema, uDataBase, uMensErro, fAguarde, uFuncoesUteisRH,
  dRelatoriosComum, UsoGeralRH, dBaseDados;

{$R *.DFM}

procedure TfrmParamFichaFuncAux.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  cmbTipoPapel.Items.Assign (dtmRelatoriosComum.rpCartaComun.PrinterSetup.PaperNames);

  iPos := ProcuraStList (cmbTipoPapel.Items,'A4');
  if (iPos = -1) then
    cmbTipoPapel. ItemIndex := 0
  else
    cmbTipoPapel. ItemIndex := iPos;

  FazQuery(qryParam, 'SELECT FLGDOISCARGOS FROM PARAMRH');
  cbxCargoAltern.Visible := (qryParam.FieldByName('FLGDOISCARGOS').asInteger = 1);
  cbxCargoAltern.Checked := (qryParam.FieldByName('FLGDOISCARGOS').asInteger = 1);
  qryParam.Close;

  qry.Close;
  with (qry.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  PF.IDPESSOA, PF.NOME');
    Add('FROM');
    Add('  PESSOA PF, FUNCIONARIO F');
    Add('WHERE');

    if (sUsuXccusto <> '') then
      Add('  (F.CODCENTROCUSTO IN ' +sUsuXccusto+ ') AND');

    if (sUsuXfilial <> '') then
      Add('  (F.IDESTAB        IN ' +sUsuXfilial+ ') AND');

    if (sUsoGeralIdPessoa <> '') then
      Add('  (F.IDPESSOA = ' + sUsoGeralIdPessoa + ') AND');

    Add('  (F.IDPESSOA        = PF.IDPESSOA)');
    Add('ORDER BY UPPER(PF.NOME)');
  end;
  qry.Open;

  dblcFunc.Text := qry.FieldByName('NOME').asString;
end;

procedure TfrmParamFichaFuncAux.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qry.Close;
  inherited;
end;

procedure TfrmParamFichaFuncAux.rgSelecaoClick(Sender: TObject);
begin
  dblcFunc.Visible := (rgSelecao.ItemIndex = 0);
  HabilitaBtOk;
end;

procedure TfrmParamFichaFuncAux.bbtnConfirmarClick(Sender: TObject);
begin
  dtmBaseDados.qry.Close;
  dtmBaseDados.qry.Sql.Clear;
  dtmBaseDados.qry.Sql.Add('SELECT TP.MASCARA FROM TIPODOCPESSOA TP, TIPODOCOFICIAL TOF' +
                           ' WHERE TP.IDDOCUMENTO = TOF.IDDOCUMENTO AND' +
                           ' RTRIM(TOF.SIGLADOCUMENTO) = ''CNPJ:''');
  dtmBaseDados.qry.Open;
  if (Trim(dtmBaseDados.qry.FieldByName('MASCARA').asString) <> '') then
    dtmRelatoriosComum.rpFichaFuncDbCNPJ.DisplayFormat :=
              dtmBaseDados.qry.FieldByName('MASCARA').asString+';0;_';
  dtmBaseDados.qry.Close;

  with (dtmRelatoriosComum) do
  begin
    qryFichaFunc.Close;
    with (qryFichaFunc.SQL) do
    begin
      Clear;
      Add('SELECT');
      // Dados da Empresa
      Add('  (' +QuotedStr(Sistema.NomeEmpresa)+ ') AS EMPRESA,');
      // Dados do Empregado
      Add('  RTRIM(PF.NOME) AS NOME,');
      Add('  PF.IDIMAGEM, PF.IDPESSOA,');
      Add('  PJ.NUMDOCUMENTO AS CNPJ, TO_CHAR(FIL.IDCATCNAE)||''-''||TO_CHAR(FIL.IDITEMCNAE) AS CNAE,');
      Add('  F.MATRICULA, PAIS.NOMENACIONALIDADE AS NACIONALIDADE,');
      Add('  TRIM(CIDADES.NOME) || ''-'' || PEFIS.CODESTADO AS NATURALIDADE,');
      Add('  PEFIS.DATANASC, PEFIS.NOMEPAI, PEFIS.NOMEMAE,');
      Add('  RTRIM(ST.DESCRICAO) AS SITUACAO, ST.TIPOSIT, F.DATAOPCAOFGTS,');
      Add('  TO_CHAR(F.DATAADMISSAO,''DD/MM/YYYY'') AS DATAADMISSAO,');
      Add('  TO_CHAR(F.DATADESLIGAMENTO,''DD/MM/YYYY'') AS DATADEMISSAO,');
      Add('  MO.DESCRICAO AS MOTIVODESLIG,');
      Add('  EST.ANOCHEGADA, EST.IDPESSOA AS IDESTRANGEIRO,');
      Add('  DECODE(NVL(EST.FLGNATURALIZADO,0),0,''Não'',''Sim'') AS NATURALIZADO,');
      Add('  DECODE(NVL(EST.FLGCASADOBRASILEIRO,0),0,''Não'',''Sim'') AS CASADOBRASILEIRO,');
      Add('  DECODE(NVL(EST.FLGFILHOSBRASILEIROS,0),0,''Não'',''Sim'') AS FILHOSBRASILEIROS,');
      Add('  EST.DECRETONATURALIZACAO, EST.MOD19NUMERO, EST.MOD19REGISTRO,');
      Add('  DECODE(PEFIS.SEXO,''F'',''Feminino'',''M'',''Masculino'','''') AS SEXO,');
      Add('  DECODE(PEFIS.ESTCIVIL,''S'',''Solteir'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
      Add('    ''C'',''Casad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
      Add('    ''D'',''Separad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
      Add('    ''J'',''Separad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o'') || '' Judicialmente'',');
      Add('    ''E'',''Desquitad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
      Add('    ''V'',''Viúv'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
      Add('    ''O'',''Outro'') AS ESTCIVIL,');
      Add('  DECODE(F.TIPOCONTRATO, ''E'',''Efetivo'', ''S'',''Efetivo Especial'',');
      Add('    ''T'',''Temporário'', ''G'',''Estagiário'', ''3'',''Terceiro'',');
      Add('    ''P'',''Proprietário'', ''A'',''Autônomo'', ''Indefinido'') ||');
      Add('    DECODE(F.DATAFIMCONTRATO,NULL,'''','' (Até '' ||');
      Add('    TO_CHAR(F.DATAFIMCONTRATO,''DD/MM/YYYY'')) AS VINCULO,');
      Add('  EJ.LOGRADOURO AS LOGRAJ, EJ.BAIRRO AS BAIRROJ, EJ.CEP AS CEPJ, EJ.NUMERO AS NUMEROJ,');
      Add('  CJ.NOME AS CIDADEJ,EJ.CODESTADO AS UFJ, EJ.COMPLEMENTO AS COMPLEJ,');
      Add('  E.LOGRADOURO, E.BAIRRO, E.CEP, E.NUMERO, CI.NOME AS CIDADE,');
      Add('  E.CODESTADO, E.COMPLEMENTO, PJ.NOME AS ESTAB, C.TITULO AS CARGO,');
      if cbxDescCargo.Checked then
         Add('  C.DESCRICAO AS DESCRCARGO,')
      else
         Add('  '' '' AS DESCRCARGO,');
      Add('  PR.DESCRICAO AS PROFISSAO, CC.NOME AS C_CUSTO, NVL(F.SALARIOATUAL,0) AS SALARIOATUAL,');
      Add('  DECODE(F.TIPOPAGAMENTO, NULL,'''',');
      Add('    ''('' || DECODE(F.TIPOPAGAMENTO, ''H'',''Horista'', ''D'',''Diarista'',');
      Add('    ''M'', ''Mensalista'', ''T'',''Tarefa'') || '')'') AS TIPOPAGAMENTO,');
      Add('  GR.DESCRICAO AS GRINSTR,');
      Add('  DECODE(RTRIM(TELEFONE.DDI),NULL,'''',''(''||RTRIM(TELEFONE.DDI)||'')'') AS DDI,');
      Add('  DECODE(RTRIM(TELEFONE.DDD),NULL,'''',''(''||RTRIM(TELEFONE.DDD)||'')'') AS DDD,');
      Add('  RTRIM(TELEFONE.NUMERO) AS TELEFONE, HT.JORNADAMENSAL, HT.NOMEHORARIO ');
      Add('FROM');
      Add('  PESSOA PJ, PESSOA PF, PESSOAFISICA PEFIS, ENDPESS E, ENDPESS EJ, FUNCIONARIO F,');
      Add('  SITFUNC ST, FILIALPESSOA FIL, CIDADES CI, CIDADES, CIDADES CJ, CARGO C,');
      Add('  PROFISS PR, CENTCUST CC, GRINSTR GR, PAIS, ESTRANGEIRO EST, HORATRAB HT, MOTIVO MO,');
      // -------------------------------------------------------------------- //
      // Telefone do Funcionário
      Add('  (SELECT TE.IDENDERECO, TE.IDTELEFONE, TE.DDD, TE.DDI, TE.NUMERO');
      Add('   FROM');
      Add('     TELENDPESS TE,');
      Add('     (SELECT   MIN(IDTELEFONE) AS IDTELEFONE, IDENDERECO');
      Add('      FROM     TELENDPESS');
      Add('      GROUP BY IDENDERECO) END');
      Add('   WHERE');
      Add('     (END.IDTELEFONE = TE.IDTELEFONE)) TELEFONE');
      // -------------------------------------------------------------------- //
      Add('WHERE');

      if (rgSelecao.ItemIndex = 0) then
        Add('  (PF.IDPESSOA         = ' +qry.FieldByName('IDPESSOA').asString+ ') AND')
      else
        Add('  (PF.IDPESSOA         = -1) AND');

      Add('  (PF.IDPESSOA         = PEFIS.IDPESSOA)       AND');
      Add('  (PF.IDPESSOA         = F.IDPESSOA)           AND');
      Add('  (ST.IDSITFUNC        = F.IDSITFUNC)          AND');
      Add('  (F.IDESTAB           = PJ.IDPESSOA)          AND');
      Add('  (F.IDESTAB           = FIL.IDFILIALPESSOA)   AND');
      Add('  (F.IDMOTIVODESLIGRAIS= MO.IDMOTIVO(+))       AND');
      Add('  (PF.IDPESSOA         = EST.IDPESSOA(+))      AND');
      Add('  (PEFIS.IDPAIS        = PAIS.IDPAIS(+))       AND');
      Add('  (PEFIS.IDCIDADES     = CIDADES.IDCIDADES(+)) AND');
      if (cbxCargoAltern.Checked) then
         Add(' (DECODE(F.IDFUNCAO,NULL,F.IDCARGO,F.IDFUNCAO) = C.IDCARGO(+)) AND')
      else
         Add('  (F.IDCARGO           = C.IDCARGO(+))         AND');
      Add('  (F.IDHORARIO         = HT.IDHORARIO(+))      AND');
      Add('  (PEFIS.IDPROFISS     = PR.IDPROFISS(+))      AND');
      Add('  (F.CODCENTROCUSTO    = CC.CODCENTROCUSTO(+)) AND');
      Add('  (F.IDEMPRESA         = CC.IDEMPRESA(+))      AND');
      Add('  (PEFIS.IDGRINSTR     = GR.IDGRINSTR(+))      AND');
      Add('  (PJ.IDPESSOA         = EJ.IDPESSOA(+))       AND');
      Add('  (PJ.IDENDCOMERCIAL   = EJ.IDENDERECO(+))     AND');
      Add('  (EJ.IDCIDADES        = CJ.IDCIDADES(+))      AND');
      Add('  (PF.IDPESSOA         = E.IDPESSOA(+))        AND');
      Add('  (PF.IDENDRESIDENCIAL = E.IDENDERECO(+))      AND');
      Add('  (E.IDCIDADES         = CI.IDCIDADES(+))      AND');
      Add('  (PF.IDENDRESIDENCIAL = TELEFONE.IDENDERECO(+))');
      Add('ORDER BY NOME');
      SaveToFile('c:\qry.txt');
    end;

    byImprDescr := iff(cbxObserv.Checked, 1, 0);
    bMostraForm := (rgSelecao.ItemIndex = 1);
    bImp1       := (cbxDocumentacao.Checked);
    bImp2       := (cbxUltEmpr.Checked);
    bImp3       := (cbxTreinamento.Checked);
    bImp4       := (cbxExper.Checked);
    bImp5       := (cbxAval.Checked);
    bImp6       := (cbxMedic.Checked);
    bImp7       := (cbxEvolFunc.Checked);
    bImp8       := (cbxBenef.Checked);
    bImp9       := (cbxFerias.Checked);
    bImp10      := (cbxDepen.Checked);
    bImp11      := (cbxSindical.Checked);
    bImp12      := (cbxSitFunc.Checked);
    bImp13      := (cbxDescCargo.Checked);

    rpFichaFunc.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
  end;

  if (rgSelecao.ItemIndex = 0) then
  begin
    frmAguarde.Mostra('Ficha Funcional');
    frmAguarde.Pos := 0;
    dtmRelatoriosComum.qryFichaFunc.Open;
    if (dtmRelatoriosComum.qryFichaFunc.IsEmpty) then
    begin
      ModalResult := mrNone;
      frmAguarde.Apaga;
      MsgDlg('Não há dados a serem exibidos! Verifique.','Aviso',mtInformation,[mbOk,mbHelp],0);
    end;
  end;
end;

procedure TfrmParamFichaFuncAux.HabilitaBtOk;
begin
  bbtnConfirmar.Enabled := ((rgSelecao.ItemIndex = 0) and (Trim(dblcFunc.Text) <> '')) or
    (rgSelecao.ItemIndex = 1);
end;

end.
