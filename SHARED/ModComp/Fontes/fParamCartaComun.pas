// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************

//------------------------------------------------------------------------------
//RESPONSÁVEL.: Douglas Siqueira
//Nº SOL......: 171426
//Nº KINTANA..: 1537613
//Data........: 06/01/2012
//Descrição...: Alteração do limite de faixas de 9 para 20.
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamCartaComun;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, ComCtrls, MontaSelect,
  wwdblook, Db, DBTables, Wwquery, fSairAjuda;

type
  TfrmParamCartaComun = class(TfrmSairAjuda)
    rgSelecao: TRadioGroup;
    gbxNome: TGroupBox;
    rgNossoNome: TRadioGroup;
    rgNomeEnd: TRadioGroup;
    sbtnProcurar: TSpeedButton;
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
    memNome: TMemo;
    MontaSelect: TMontaSelect;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    procedure FormCreate(Sender: TObject);
    procedure rgSelecaoClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    procedure HabilitaBtOk;
  public
    // Tipo do Layout do Formulário (com ou sem a Seleção da Carta e das pessoas)
    TipoParam: byte;
    sIdPessoaParCarta,
    // Número da carta a ser impressa
    NumCarta: string;
  end;

var
  frmParamCartaComun: TfrmParamCartaComun;

implementation

uses uSistema, uFuncoesUteisRH, UsoGeralRH, dRelatorioCartaComun;

{$R *.DFM}

procedure TfrmParamCartaComun.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  TipoParam := 0;

  cmbTipoPapel.Items.Assign(dtmRelatorioCartaComun.rpCartaComun.PrinterSetup.PaperNames);

  iPos := ProcuraStList(cmbTipoPapel.Items,'A4');
  if (iPos = -1) then
    cmbTipoPapel.ItemIndex := 0
  else
    cmbTipoPapel.ItemIndex := iPos;

  MontaSelect.Filtro.Clear;

  // Estabelecimento(s) habilitados para o usuário
  if (sUsuXfilial <> '') then
    MontaSelect.Filtro.Add('FUNCIONARIO.IDESTAB IN ' +sUsuXfilial);

  // C. de Custo(s) habilitado(s) para o usuário
  if (sUsuXccusto <> '') then
    MontaSelect.Filtro.Add('FUNCIONARIO.CODCENTROCUSTO IN ' +sUsuXccusto);

  MontaSelect.Filtro.Add('PESSOA.IDPESSOA = FUNCIONARIO.IDPESSOA(+)');
end;

procedure TfrmParamCartaComun.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if (TipoParam <> 0) then
    Action := caHide;
end;

// Muda o Layout do Formulário para impressão com ou sem a Seleção da Carta e das pessoas
procedure TfrmParamCartaComun.FormShow(Sender: TObject);
begin
  inherited;
  gbxNome.Visible := (TipoParam  = 0);
  rgSelecao.Visible := (TipoParam <> 3);

  case (TipoParam) of
    0 :
    begin
      rgSelecao.Caption := 'Endereçar a';
      rgSelecao.Width := 152;
      rgSelecao.Height := 100;
      rgSelecao.Columns := 1;
      rgSelecao.Items.Clear;
      rgSelecao.Items.Add('Uma só Pessoa');
      rgSelecao.Items.Add('Pessoas a Selecionar');
      rgSelecao.ItemIndex := 1;

      rgNossoNome.Top := 111;
      rgNomeEnd.Top := 111;
      gbxTipoPapel.Top := 179;
      Self.Height := 304;
    end;
    1,2 :
    begin
      if (TipoParam = 1) then
        rgSelecao.Caption := 'Forma de Impressão'
      else
        rgSelecao.Caption := 'Critério de Efetivação';

      rgSelecao.Width := 400;
      rgSelecao.Height := 50;
      rgSelecao.Columns := 2;
      rgSelecao.Items.Clear;
      rgSelecao.Items.Add('Pessoa Indicada');
      rgSelecao.Items.Add('Todas');
      rgSelecao.ItemIndex := 0;

      rgNossoNome.Top := 63;
      rgNomeEnd.Top := 63;
      gbxTipoPapel.Top := 132;
      Self.Height := 255;
    end;
    3 :
    begin
      rgNossoNome.Top := 7;
      rgNomeEnd.Top := 7;
      gbxTipoPapel.Top := 76;
      Self.Height := 200;
    end;
  end;

  rgSelecaoClick(Sender);
end;

procedure TfrmParamCartaComun.rgSelecaoClick(Sender: TObject);
begin
  if (TipoParam = 0) then
    gbxNome.Visible := (rgSelecao.ItemIndex <> 1);
  HabilitaBtOk;
end;

procedure TfrmParamCartaComun.sbtnProcurarClick(Sender: TObject);
begin
  MontaSelect.Executar;

  if (MontaSelect.RetornouValor) then
  begin
    sIdPessoaParCarta := MontaSelect.ValoresChave[0];
    memNome.Text := MontaSelect.ValoresChave[1];
  end
  else
  begin
    sIdPessoaParCarta := '';
    memNome.Text := '';
  end;

  sbtnProcurar.Down := false;
  HabilitaBtOk;
end;

procedure TfrmParamCartaComun.bbtnConfirmarClick(Sender: TObject);
begin
  with (dtmRelatorioCartaComun) do
  begin
    qryCartaComun.Close;
    with (qryCartaComun.SQL) do
    begin
      Clear;
      Add('SELECT');
      // Campos SOMENTE usados no Relatório
      Add('  RTRIM(CARTA.ASSUNTO) AS ASSUNTO,');
      Add('  CARTA.TEXTO AS TEXTO,');
      Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO || DECODE(RTRIM(E.COMPLEMENTO),');
      Add('    NULL,NULL, '' - '' || RTRIM(E.COMPLEMENTO)) AS ENDERECO,');
      Add('  DECODE(RTRIM(CI.NOME),NULL,NULL,''Cidade: '' || RTRIM(CI.NOME)) ||');
      Add('  DECODE(RTRIM(E.CEP),NULL,NULL,'' CEP: '' || RTRIM(SUBSTR(E.CEP,1,5)) ||');
      Add('    ''-''|| RTRIM(SUBSTR(E.CEP,6,3))) AS CEPCID,');
      // Campos usados nas substituições de texto
      Add('  ('+QuotedStr(FormatDateTime('dd "de" mmmm "de" yyyy',Date))+') AS DTH,');
      Add('  CARTA.DATACARTA AS DTT,');
      Add('  (' +QuotedStr(Sistema.RazaoSocial)+ ') AS RZSE,');
      Add('  (' +QuotedStr(Sistema.NomeEmpresa)+ ') AS NMFE,');
      Add('  RTRIM(E2.LOGRADOURO) || DECODE(E2.NUMERO,NULL,NULL,'' Nº''|| E2.NUMERO) ||');
      Add('    DECODE(RTRIM(E2.COMPLEMENTO),NULL,NULL,'' - ''|| RTRIM(E2.COMPLEMENTO)) ||');
      Add('    DECODE(RTRIM(E2.BAIRRO),NULL,NULL,'', ''|| RTRIM(E2.BAIRRO)) ||');
      Add('    DECODE(RTRIM(E2.CEP),NULL,NULL,'' - CEP: '' || RTRIM(SUBSTR(E2.CEP,1,5)) ||');
      Add('    ''-''|| RTRIM(SUBSTR(E2.CEP,6,3))) || DECODE(RTRIM(CI2.NOME),NULL,NULL,');
      Add('    '' - '' || RTRIM(CI2.NOME)) || DECODE(RTRIM(ES2.CODESTADO),NULL,NULL,');
      Add('    '' - '' || RTRIM(ES2.CODESTADO)) AS ENDE,');
      Add('  RTRIM(E2.LOGRADOURO) AS LOGE,');
      Add('  E2.NUMERO AS NUME,');
      Add('  RTRIM(E2.COMPLEMENTO) AS CMPE,');
      Add('  RTRIM(E2.BAIRRO) AS BAIE,');
      Add('  RTRIM(SUBSTR(E2.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E2.CEP,6,3)) AS CEPE,');
      Add('  RTRIM(CI2.NOME) AS CIDE,');
      Add('  RTRIM(ES2.CODESTADO) AS ESTE,');
      Add('  RTRIM(CNPJ.NUMDOCUMENTO) AS CNPJ,');
      Add('  RTRIM(ISCE.NUMDOCUMENTO) AS ISCE,');
      Add('  RTRIM(ISCM.NUMDOCUMENTO) AS ISCM,');
      Add('  RTRIM(DECODE(P.TIPO, ''F'', P.NOME, P.RAZAOSOCIAL)) AS NOM,');
      Add('  RTRIM(CPF.NUMDOCUMENTO) AS CPF,');
      Add('  CPF.DATAEMISSAO AS CPFD,');
      Add('  RTRIM(CPF.ORGAO) AS CPFO,');
      Add('  RTRIM(CTPS.NUMDOCUMENTO) AS CTPS,');
      Add('  CTPS.DATAEMISSAO AS CTPSD,');
      Add('  RTRIM(CTPS.UF) AS CTPSU,');
      Add('  RTRIM(RG.NUMDOCUMENTO) AS RG,');
      Add('  RG.DATAEMISSAO AS RGD,');
      Add('  RTRIM(RG.ORGAO) AS RGO,');
      Add('  RTRIM(RG.UF) AS RGU,');
      Add('  RTRIM(PIS.NUMDOCUMENTO) AS PIS,');
      Add('  PIS.DATAEMISSAO AS PISD,');
      Add('  RTRIM(TIT.NUMDOCUMENTO) AS TITE,');
      Add('  TIT.DATAEMISSAO AS TITED,');
      Add('  RTRIM(E.LOGRADOURO) || DECODE(E.NUMERO,NULL,NULL,'' Nº''|| E.NUMERO) ||');
      Add('    DECODE(RTRIM(E.COMPLEMENTO),NULL,NULL,'' - ''|| RTRIM(E.COMPLEMENTO)) ||');
      Add('    DECODE(RTRIM(E.BAIRRO),NULL,NULL,'', ''|| RTRIM(E.BAIRRO)) ||');
      Add('    DECODE(RTRIM(E.CEP),NULL,NULL,'' - CEP: '' || RTRIM(SUBSTR(E.CEP,1,5)) ||');
      Add('    ''-''|| RTRIM(SUBSTR(E.CEP,6,3))) || DECODE(RTRIM(CI.NOME),NULL,NULL,');
      Add('    '' - '' || RTRIM(CI.NOME)) || DECODE(RTRIM(ES.CODESTADO),NULL,NULL,');
      Add('    '' - '' || RTRIM(ES.CODESTADO)) AS END,');
      Add('  RTRIM(E.LOGRADOURO) AS LOG,');
      Add('  E.NUMERO AS NUM,');
      Add('  RTRIM(E.COMPLEMENTO) AS CMP,');
      Add('  RTRIM(E.BAIRRO) AS BAI,');
      Add('  RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS CEP,');
      Add('  RTRIM(CI.NOME) AS CID,');
      Add('  RTRIM(ES.CODESTADO) AS EST,');
      Add('  PEFIS.DATANASC AS DTN,');
      Add('  DECODE(PEFIS.SEXO,''M'',''Masculino'',''F'',''Feminino'') AS SEX,');
      Add('  DECODE(PEFIS.CORPESSOA,2,''Branca'',4,''Negra'',6,''Amarela'',8,''Parda'',0,'+
          '''Indígena'') AS COR,');
      Add('  RTRIM(PEFIS.TIPOSANG) AS TPS,');
      Add('  DECODE(PEFIS.FLGDEFICIENTE,1,''Sim'',''Não'') AS DEF,');
      Add('  DECODE(PEFIS.ESTCIVIL,');
      Add('    ''S'',''Solteir'' || DECODE(PEFIS.SEXO,''M'',''o'',''a''),');
      Add('    ''C'',''Casad'' || DECODE(PEFIS.SEXO,''M'',''o'',''a''),');
      Add('    ''D'',''Separad'' || DECODE(PEFIS.SEXO,''M'',''o'',''a''),');
      Add('    ''J'',''Separad'' || DECODE(PEFIS.SEXO,''M'',''o'',''a'') || ''Judicialmente'',');
      Add('    ''E'',''Desquitad'' || DECODE(PEFIS.SEXO,''M'',''o'',''a''),');
      Add('    ''V'',''Viúv'' || DECODE(PEFIS.SEXO,''M'',''o'',''a''),');
      Add('    ''O'',''Outro'','''') AS ESC,');
      Add('  RTRIM(PEFIS.NOMEMAE) AS NMM,');
      Add('  RTRIM(PEFIS.NOMEPAI) AS NMP,');
      Add('  DECODE(PEFIS.FLGISENTOIRRF,0,''Não'',''Sim'') AS IIR,');
      Add('  NVL(PEFIS.NUMDEPTOT,0) AS QTD,');
      Add('  NVL(PEFIS.NUMDEPIRRF,0) AS QIR,');
      Add('  NVL(PEFIS.NUMDEPSALF,0) AS QSF,');
      Add('  RTRIM(PAIS.NOMENACIONALIDADE) AS NAC,');
      Add('  RTRIM(CIN.NOME) AS NCI,');
      Add('  RTRIM(ESN.NOMEESTADO) AS NES,');
      Add('  RTRIM(PS.RAZAOSOCIAL) AS SIN,');
      Add('  RTRIM(GR.DESCRICAO) AS GRI,');
      Add('  RTRIM(PR.DESCRICAO) AS PRO,');
      Add('  RTRIM(F.MATRICULA) AS MAT,');
      Add('  F.DATAADMISSAO AS DTA,');
      Add('  RTRIM(ST.DESCRICAO) AS SIT,');
      Add('  DECODE(ST.TIPOSIT,''A'',''Ativo(a)'',''F'',''Afastado(a)'',''D'','+
          '''Demitido(a)'','''') AS TSF,');
      Add('  RTRIM(HT.NOMEHORARIO) AS HOR,');
      Add('  F.DATAREFHORARIO AS DTH,');
      Add('  RTRIM(MO.DESCRICAO) AS MOD,');
      Add('  F.DATADESLIGAMENTO AS DTD,');
      Add('  F.DATARETORNO AS DTR,');
      Add('  F.DATAAVISO AS DAV,');
      Add('  RTRIM(F.HOMOLOGACAONUMERO) AS DHM,');
      Add('  RTRIM(C1.TITULO) AS CAR,');
      Add('  F.DATACARGO AS DTC,');
      Add('  DECODE(PH.FLGNIVELINDIV,0,FS1.IDFAIXASALARIAL,F.IDFAIXACARGO) AS FXC,');
      Add('  PH.FLGNIVELINDIV, F.NIVELINDIV1, F.NIVELINDIV2,');
      Add('  F.SALARIOATUAL,');
      Add('  FS1.STEP1 AS FS1_STEP1,');
      Add('  FS1.STEP2 AS FS1_STEP2,');
      Add('  FS1.STEP3 AS FS1_STEP3,');
      Add('  FS1.STEP4 AS FS1_STEP4,');
      Add('  FS1.STEP5 AS FS1_STEP5,');
      Add('  FS1.STEP6 AS FS1_STEP6,');
      Add('  FS1.STEP7 AS FS1_STEP7,');
      Add('  FS1.STEP8 AS FS1_STEP8,');
      Add('  FS1.STEP9 AS FS1_STEP9,');

      //Douglas.Siqueira SOL 171426 Kintana 1537613
      Add('  FS1.STEP10 AS FS1_STEP10,');
      Add('  FS1.STEP11 AS FS1_STEP11,');
      Add('  FS1.STEP12 AS FS1_STEP12,');
      Add('  FS1.STEP13 AS FS1_STEP13,');
      Add('  FS1.STEP14 AS FS1_STEP14,');
      Add('  FS1.STEP15 AS FS1_STEP15,');
      Add('  FS1.STEP16 AS FS1_STEP16,');
      Add('  FS1.STEP17 AS FS1_STEP17,');
      Add('  FS1.STEP18 AS FS1_STEP18,');
      Add('  FS1.STEP19 AS FS1_STEP19,');
      Add('  FS1.STEP20 AS FS1_STEP20,');
      //Douglas.Siqueira SOL 171426 Kintana 1537613 - fim

      Add('  RTRIM(C2.TITULO) AS FUN,');
      Add('  F.DATACARGO2 AS DTF,');
      Add('  DECODE(PH.FLGNIVELINDIV,0,FS2.IDFAIXASALARIAL,F.IDFAIXAFUNCAO) AS FXF,');
      Add('  FS2.STEP1 AS FS2_STEP1,');
      Add('  FS2.STEP2 AS FS2_STEP2,');
      Add('  FS2.STEP3 AS FS2_STEP3,');
      Add('  FS2.STEP4 AS FS2_STEP4,');
      Add('  FS2.STEP5 AS FS2_STEP5,');
      Add('  FS2.STEP6 AS FS2_STEP6,');
      Add('  FS2.STEP7 AS FS2_STEP7,');
      Add('  FS2.STEP8 AS FS2_STEP8,');
      Add('  FS2.STEP9 AS FS2_STEP9,');
      //Douglas.Siqueira SOL 171426 Kintana 1537613
      Add('  FS2.STEP10 AS FS2_STEP10,');
      Add('  FS2.STEP11 AS FS2_STEP11,');
      Add('  FS2.STEP12 AS FS2_STEP12,');
      Add('  FS2.STEP13 AS FS2_STEP13,');
      Add('  FS2.STEP14 AS FS2_STEP14,');
      Add('  FS2.STEP15 AS FS2_STEP15,');
      Add('  FS2.STEP16 AS FS2_STEP16,');
      Add('  FS2.STEP17 AS FS2_STEP17,');
      Add('  FS2.STEP18 AS FS2_STEP18,');
      Add('  FS2.STEP19 AS FS2_STEP19,');
      Add('  FS2.STEP20 AS FS2_STEP20,');
      //Douglas.Siqueira SOL 171426 Kintana 1537613 - fim

      Add('  DECODE(F.TIPOCONTRATO,''E'',''Efetivo'',''S'',''Efetivo Especial'',''T'',');
      Add('    ''Temporário'',''G'',''Estagiário'',''3'',''Terceiro'',''P'','+
          '''Prop/Dir s/ Vinc'',''A'',''Autônomo'') TPC,');
      Add('  F.DATAFIMCONTRATO AS DTP,');
      Add('  F.DURACAOCONTRATO AS DUP,');
      Add('  F.PRORROGCONTRATO AS PRP,');
      Add('  DECODE(F.TIPOPAGAMENTO,''H'',''Hora'',''D'',''Dia'',''M'',''Mês'','+
          '''T'',''Tarefa'') AS TPA,');
      Add('  F.SALARIOATUAL AS SAL,');
      Add('  F.DATASALARIO AS DTE,');
      Add('  RTRIM(PC.NOME) AS CHE,');
      Add('  RTRIM(CC.NOME) AS CCU,');
      Add('  F.DATALOTACAO AS DTU,');
      Add('  RTRIM(PB.RAZAOSOCIAL) AS BCS,');
      Add('  RTRIM(PA.RAZAOSOCIAL) AS AGS,');
      Add('  F.NUMCONTASALARIO AS NCS');
      Add('FROM');
      Add('  PESSOA PE, PESSOA P, PESSOA PS, PESSOA PC, PESSOA PB, PESSOA PA,');
      Add('  PESSOAFISICA PEFIS, ENDPESS E, ENDPESS E2, FUNCIONARIO F, CIDADES CI,');
      Add('  CIDADES CI2, CIDADES CIN, ESTADO ES, ESTADO ES2, ESTADO ESN, PROFISS PR,');
      Add('  AGENCIABANCARIA AG, MOTIVO MO, CARGO C1, CARGO C2, CENTCUST CC, FAIXASAL FS1,');
      Add('  FAIXASAL FS2, CARTA, SITFUNC ST, GRINSTR GR, PAIS, HORATRAB HT, PARAMRH PH,');
      // ------------------------------------------------------------------------------------
      // CNPJ
      Add('  (SELECT DP.IDPESSOA, DP.NUMDOCUMENTO');
      Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO');
      Add('   WHERE ((TDO.SIGLADOCUMENTO = ''CGC:'') OR');
      Add('          (TDO.SIGLADOCUMENTO = ''CNPJ:'')) AND');
      Add('         (TDO.IDDOCUMENTO     = DP.IDDOCUMENTO)) CNPJ,');
      // ------------------------------------------------------------------------------------
      // Inscrição Estadual
      Add('  (SELECT DP.IDPESSOA, DP.NUMDOCUMENTO');
      Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO');
      Add('   WHERE (TDO.SIGLADOCUMENTO = ''ESTADUAL:'') AND');
      Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO)) ISCE,');
      // ------------------------------------------------------------------------------------
      // Inscrição Municipal
      Add('  (SELECT DP.IDPESSOA, DP.NUMDOCUMENTO');
      Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO');
      Add('   WHERE (TDO.SIGLADOCUMENTO = ''MUNICIPAL:'') AND');
      Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO)) ISCM,');
      // ------------------------------------------------------------------------------------
      // CPF
      Add('  (SELECT DP.IDPESSOA, DP.NUMDOCUMENTO, DP.DATAEMISSAO, DP.ORGAO');
      Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO');
      Add('   WHERE (TDO.SIGLADOCUMENTO = ''CPF:'') AND');
      Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO)) CPF,');
      // ------------------------------------------------------------------------------------
      // CTPS
      Add('  (SELECT DP.IDPESSOA, DP.NUMDOCUMENTO, DP.DATAEMISSAO, ES.CODESTADO AS UF');
      Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO, ESTADO ES');
      Add('   WHERE (TDO.SIGLADOCUMENTO = ''CTPS:'') AND');
      Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
      Add('         (DP.IDESTADO        = ES.IDESTADO(+))) CTPS,');
      // ------------------------------------------------------------------------------------
      // Carteira de Identidade
      Add('  (SELECT DP.IDPESSOA, DP.NUMDOCUMENTO, DP.DATAEMISSAO, DP.ORGAO, ES.CODESTADO AS UF');
      Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO, ESTADO ES');
      Add('   WHERE (TDO.SIGLADOCUMENTO = ''RG:'') AND');
      Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
      Add('         (DP.IDESTADO        = ES.IDESTADO(+))) RG,');
      // ------------------------------------------------------------------------------------
      // PIS
      Add('  (SELECT DP.IDPESSOA, DP.NUMDOCUMENTO, DP.DATAEMISSAO');
      Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO');
      Add('   WHERE (TDO.SIGLADOCUMENTO = ''PIS:'') AND');
      Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO)) PIS,');
      // ------------------------------------------------------------------------------------
      // Título de eleitor
      Add('  (SELECT DP.IDPESSOA, DP.NUMDOCUMENTO, DP.DATAEMISSAO');
      Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO');
      Add('   WHERE (TDO.SIGLADOCUMENTO = ''TITULO:'') AND');
      Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO)) TIT');
      // ------------------------------------------------------------------------------------
      Add('WHERE');

      if (TipoParam = 0) then
      begin
        Add('  (CARTA.NUMCARTA  = ' +NumCarta+ ') AND');
        if (rgSelecao.ItemIndex = 0) then
          Add('  (P.IDPESSOA      = ' +sIdPessoaParCarta+ ') AND')
        else
          Add('  (P.IDPESSOA      = -1) AND');
      end
      else
      begin
        Add('  (CARTA.NUMCARTA  = -1) AND');
        Add('  (P.IDPESSOA      = -1) AND');
      end;

      Add('  (PE.IDPESSOA     = '+IntToStr(Sistema.IdEmpresa)+') AND');
      Add('  (PE.IDPESSOA     = CNPJ.IDPESSOA(+)) AND');
      Add('  (PE.IDPESSOA     = ISCE.IDPESSOA(+)) AND');
      Add('  (PE.IDPESSOA     = ISCM.IDPESSOA(+)) AND');
      Add('  (PE.IDENDCOMERCIAL = E2.IDENDERECO(+)) AND');
      Add('  (E2.IDCIDADES    = CI2.IDCIDADES(+)) AND');
      Add('  (CI2.IDESTADO    = ES2.IDESTADO(+)) AND');

      Add('  (P.IDPESSOA      = PEFIS.IDPESSOA(+)) AND');
      Add('  (P.IDPESSOA      = F.IDPESSOA(+)) AND');
      Add('  (P.IDPESSOA      = CPF.IDPESSOA(+)) AND');
      Add('  (P.IDPESSOA      = CTPS.IDPESSOA(+)) AND');
      Add('  (P.IDPESSOA      = RG.IDPESSOA(+)) AND');
      Add('  (P.IDPESSOA      = PIS.IDPESSOA(+)) AND');
      Add('  (P.IDPESSOA      = TIT.IDPESSOA(+)) AND');
      Add('  (PEFIS.IDPAIS    = PAIS.IDPAIS(+)) AND');
      Add('  (PEFIS.IDCIDADES = CIN.IDCIDADES(+)) AND');
      Add('  (PEFIS.CODESTADO = ESN.CODESTADO(+)) AND');
      Add('  (PEFIS.IDSINDICATO = PS.IDPESSOA(+)) AND');
      Add('  (PEFIS.IDGRINSTR   = GR.IDGRINSTR(+)) AND');
      Add('  (PEFIS.IDPROFISS   = PR.IDPROFISS(+)) AND');
      Add('  (F.IDSITFUNC       = ST.IDSITFUNC(+)) AND');
      Add('  (F.IDHORARIO       = HT.IDHORARIO(+)) AND');
      Add('  (F.IDMOTIVODESLIGRAIS = MO.IDMOTIVO(+)) AND');
      Add('  (F.IDEMPRESA          = CC.IDEMPRESA(+)) AND');
      Add('  (F.CODCENTROCUSTO     = CC.CODCENTROCUSTO(+)) AND');
      Add('  (F.IDCARGO            = C1.IDCARGO(+)) AND');
      Add('  (F.IDFUNCAO           = C2.IDCARGO(+)) AND');
      Add('  (C1.IDFAIXASALARIAL   = FS1.IDFAIXASALARIAL(+)) AND');
      Add('  (C2.IDFAIXASALARIAL   = FS2.IDFAIXASALARIAL(+)) AND');
      Add('  (F.IDCHEFE            = PC.IDPESSOA(+)) AND');
      Add('  (F.IDAGENCIASALARIO   = AG.IDPESSOA(+)) AND');
      Add('  (F.IDAGENCIASALARIO   = PA.IDPESSOA(+)) AND');
      Add('  (AG.IDBANCO           = PB.IDPESSOA(+)) AND');
      Add('  (DECODE(P.TIPO,''F'',P.IDENDRESIDENCIAL,P.IDENDCOMERCIAL) = E.IDENDERECO(+)) AND');
      Add('  (E.IDCIDADES    = CI.IDCIDADES(+)) AND');
      Add('  (CI.IDESTADO    = ES.IDESTADO(+))');
      Add('ORDER BY');
      Add('  NOM');
      //SaveToFile('c:\qry.txt');
      SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
    end;

    byNossoNome  := rgNossoNome.ItemIndex;
    byNomeEnd    := rgNomeEnd.ItemIndex;
    bSelecPessoa := (rgSelecao.ItemIndex = 1);

    rpCartaComun.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
  end;
end;

procedure TfrmParamCartaComun.HabilitaBtOk;
begin
  bbtnConfirmar.Enabled := (TipoParam <> 0) or ((rgSelecao.ItemIndex = 1) or
    ((rgSelecao.ItemIndex = 0) and (Trim(memNome.Text) <> '')));
end;

end.
