// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//Rotina.............: AbrirQueryPrincipal, ProcessarGeracao, ProcessarDados
//N. SIG.............: 133912
//Responsável........: Cássio Florêncio Rovaroto
//Descrição..........: Inclusão do uso de convênio bancário de Float antecipado.
//***************************************************************************************
//Pendência   :  SIG 114623
//Responsável :  Ewerton Beltramini
//Data        :  29/01/2021
//Descrição   :  Implementação do comando Copy, para igualar as bases de produção.
//******************************************************************************
//Rotina.............: GravaLinha, CriaArquivo, MontaArquivoCNAB240, MontaLinhaB
//N. SIG.............: 101591
//Data da Alteração..: 14/08/2020
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Correção no formato geração do arquivo.
// *****************************************************************************
//Rotina             : MontaArquivoCNAB240, ProcessarGeracao, SelecionaDadosCabecArq,
//                     Impersonate, MontaLinhaA
//N. SIG..........   : 101266
//Data da Alteração: : 30/07/2020
//Responsável:       : Cássio Florêncio Rovaroto
//Descrição.......   : Inclusão do código NSA na interface de geração do arquivo.
//***************************************************************************************
//Rotina             : AbrirQueryPrincipal, AbrirQueryDocTxtLeiaute240, AlimentaQryDocTxtLeiaute240,
//                     RemoveCaracterEspecial, ProcessarDados, MontaArquivoCNAB240,
//                     MontaArquivoCNAB240, GetParametrosArquivo, CriaArquivo,
//                     GetNumNSA, SelecionaDadosCabecArq, SelecionaDadosCabecLote,
//                     SelecionaDadosRodapeLote, SelecionaDadosRodapeArq, MontaLinhaA,
//                     MontaLinhaB, FormatarValor, ZeroEsquerda, ZeroDireita,
//                     AjustaTamCampo, GeraArquivoDeRemessa, GravaLinha, SaveToCSV, GetNomePlanoPrev,
//                     Impersonate, _DecryptSTR
//N. SIG..........   : 61776
//Data da Alteração: : 27/07/2020
//Alteração Form:    : uCtrlParamArqPagto
//Responsável:       : Cássio Florêncio Rovaroto
//Descrição.......   : Adaptação da funcionalidade para geração do arquivo no Layout
//                     CNAB240, para pagamento de salários.
//***************************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit uCtrlParamArqPagto;

interface

uses SysUtils, classes, Controls, DB, uCmControlObject, uCmDbObject, uCmClientDataSet,
  uCMTypes, uCtrlCustomRH, uCtrlBancoPortFolha, uCtrlListTerceirosRH,
  uCtrlPessoaFuncionario, uCtrlIntBanco, USistema, Forms, Windows, uString, wwQuery,
  uCtrlPadroes, Shellapi, filectrl, ucmFileUtils;

// Chaves de encriptação
Const StKey = 7848567;
Const MtKey = 1741378;
Const AdKey = 6574985;

const fUser = '±'#5'­'#$D'TZ!,|'#$1F'j¼'#$15'rôVà9'; //Login de acesso ao servidor, criptografado.
const fPw   = 'ãq‘º%Ú¯ô'; //Senha do login de acesso ao servidor, criptografado.

type
  TCtrlParamArqPagto = class(TCtrlCustomRH)
  protected
    procedure AfterInitialize; override;
    procedure DoChangeDataBase; override;
  private
    FCtrlIntBanco: TCtrlIntBanco;
    FCtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    FCtrlListTerceirosRH: TCtrlListTerceirosRH;
    FCtrlBancoPortFolha: TCtrlBancoPortFolha;

    FLstPortForma: TStringList;

    FCdsPrincipal, FCdsPortadorForma, FCdsDocTxt: TCMClientDataSet;
    FSQL: TStringList;

    //Cássio Rovaroto - SIG nº 61776 - Início
    FCdsMontaArquivo: TCMClientDataSet;
    FcdsGeraCabecRodapeArq: TCMClientDataSet;
    FcdsGeraCabecRodapeLote: TCMClientDataSet;
    FcdsGeraMovLote: TCMClientDataSet;
    FcdsParamConvenio: TCMClientDataSet;
    //Cássio Rovaroto - SIG nº 61776 - Fim


    FUltPortForma, FPortadorFormaPadrao: integer;
    FDiretorio: string;

    FIdEmpresa: integer;
    FIdEstab: double;
    FMesRef: string; // Mês de Referência (AAAA/MM)
    FDataCredito: TDate;
    FNomeTabela: string;
    FListaIdFunc: string;
    FListaIdTipoFolha: string;
    FListaSelSitFunc: string;
    FListaSelTipoContrato: string;
    FDadosIncompletos: boolean;
    FConvFloat: Boolean;

    //Cássio Rovaroto - SIG nº 61776 - Início
    ArquivoEnvioCEF: TextFile;
    iSeqArquivoPagto, iSeqCodDocArq, iSeqDocXPessoa, IdMotivoAnt, iIdPlanoPrev: Integer;
    dValorLiquidoFolha: Double;
    qryTarifaArqPagto: TwwQuery;
    //Cássio Rovaroto - SIG nº 61776 - Fim

    function  AbrirQueryPrincipal: boolean;
    procedure AbrirQueryDocTXT;
    procedure AlimentaQryDocTxt;

    //Cássio Rovaroto - SIG nº 61776
    procedure AbrirQueryDocTxtLeiaute240;
    procedure AlimentaQryDocTxtLeiaute240;
    function RemoveCaracterEspecial(pTexto: String; pRemoveExtra: boolean): String;
    Function _DecryptSTR(Const InString: String; StartKey, MultKey, AddKey: Integer): String;
    function Impersonate: boolean;
  public
    constructor Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral: string); reintroduce;
    destructor  Destroy; override;

    function ProcessarGeracao(IdEmpresa: integer; IdEstab: double; MesRef, AnoRef: integer;
      DataCredito: TDate; Previa: boolean; ListaIdTipoFolha, ListaIdFunc, Diretorio,
      ListaSelSitFunc, ListaSelTipoContrato: string): boolean;

    //Cássio Rovaroto - SIG nº 61776 - Início
    function ProcessarDados(IdEmpresa: integer; IdEstab: double; MesRef, AnoRef: integer;
      DataCredito: TDate; Previa: boolean; ListaIdTipoFolha, ListaIdFunc, Diretorio,
      ListaSelSitFunc, ListaSelTipoContrato: string; ConvFloat: Boolean = False): boolean;

    function MontaArquivoCNAB240(var sNSA: string): boolean;
    function GetParametrosArquivo(iCodPortadorForma, iNumArquivo: integer): OleVariant;
    function CriaArquivo(sArquivo: String): Boolean;
    function GetNumNSA: OleVariant;
    function SelecionaDadosCabecArq(iCodPortForma: integer; sNSA: string): OleVariant;
    function SelecionaDadosCabecLote(pCodPortForma, pSeqLote, pFormaLanc, pTipCompromisso, pTipoServico: String): Olevariant;
    function SelecionaDadosRodapeLote(pSeqLote, pQtdRegsLote, pVlrTotalLote: String): OleVariant;
    function SelecionaDadosRodapeArq(pQtdLotesArq, pQtdRegsArq: String): Olevariant;
    function MontaLinhaA(pNSR, pSeqLote, pFinalidadeDoc: string): string;
    function MontaLinhaB(pNSR, pSeqLote: string): string;
    function GeraArquivoDeRemessa(pNomeCompletoArquivoRemessa, pCodPortForma, pNSA: String): boolean;
    //-------------
    procedure GravaLinha(sArquivo, sLinha: string);
    procedure SaveToCSV(DataSet: TDataSet; FileName, sHeader: string);
    function GetNomePlanoPrev(pIdPlanoPrev: integer): String;
    function FormatarValor(NumCasas: integer; Valor: string): string;
    function ZeroEsquerda(TamanhoTexto : Integer; Texto : String) : String;
    function ZeroDireita(TamanhoTexto : integer; texto : String) : string;
    function AjustaTamCampo(sCampo : string; iTam : integer; sChar: string): string;

    procedure RegistraTarifaBancaria(pIdArquivoPagto, pCodDocArq, pCodPortForma, pCodForma : Integer);

    //Cássio Rovaroto - SIG nº 61776 - Fim

    property DadosIncompletos: boolean read FDadosIncompletos;
  end;

implementation

uses uCtrlFuncoesRH, DBaseDados, uCtrlParamIntegra;

{ TCtrlParamArqPagto }

constructor TCtrlParamArqPagto.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral: string);
begin
  inherited Create;
  SetAutorizacoes(UsuXFilial, UsuXCCusto, IdUsuarioGeral);

  FCtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral);
  FCtrlListTerceirosRH := TCtrlListTerceirosRH.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral);
  FCtrlBancoPortFolha := TCtrlBancoPortFolha.Create;
  FCtrlIntBanco := TCtrlIntBanco.Create;
  FCtrlIntBanco.FechaQryTexto := false;

  FCdsPortadorForma := TCMClientDataSet.Create(nil);
  FSQL := TStringList.Create;
  FLstPortForma := TStringList.Create;

  //Cássio Rovaroto - SIG nº 61776 - Início
  FCdsPrincipal := TCMClientDataSet.Create(nil);
  FCdsDocTxt := TCMClientDataSet.Create(nil);
  FCdsMontaArquivo := TCMClientDataSet.Create(nil);
  FcdsGeraCabecRodapeArq := TCMClientDataSet.Create(nil);
  FcdsGeraCabecRodapeLote := TCMClientDataSet.Create(nil);
  FcdsGeraMovLote:= TCMClientDataSet.Create(nil);
  FcdsParamConvenio := TCMClientDataSet.Create(nil);
  qryTarifaArqPagto:= TwwQuery.Create(nil);
  qryTarifaArqPagto.DatabaseName := dtmBaseDados.dbBaseDados.DatabaseName;

  IdMotivoAnt := 0;
  iIdPlanoPrev := 110;// Plano PGA
  //Cássio Rovaroto - SIG nº 61776 - Fim
end;

destructor TCtrlParamArqPagto.Destroy;
begin
  FCtrlIntBanco.Free;
  FCdsPortadorForma.Free;
  FSQL.Free;
  FCtrlBancoPortFolha.Free;
  FCtrlListTerceirosRH.Free;
  FCtrlPessoaFuncionario.Free;
  FLstPortForma.Free;
  //Cássio Rovaroto - SIG nº 61776 - Início
  FreeAndNil(FCdsMontaArquivo);
  FreeAndNil(FcdsGeraCabecRodapeArq);
  FreeAndNil(FcdsGeraCabecRodapeLote);
  FreeAndNil(FcdsGeraMovLote);
  FreeAndNil(FcdsParamConvenio);
  FreeAndNil(FCdsPrincipal);
  FreeAndNil(FCdsDocTxt);
  qryTarifaArqPagto.Free;
  //Cássio Rovaroto - SIG nº 61776 - Fim
  inherited;
end;

procedure TCtrlParamArqPagto.AfterInitialize;
begin
  inherited;
  FCtrlBancoPortFolha.InitializeAs(Self);
  FCtrlListTerceirosRH.InitializeAs(Self);
  FCtrlPessoaFuncionario.InitializeAs(Self);
  FCtrlIntBanco.InitializeAs(Self);
  FCdsPortadorForma.Data := FCtrlBancoPortFolha.ListPortadorXConta;
  FPortadorFormaPadrao := FCtrlBancoPortFolha.GetCodPortFormaPadrao;
end;

procedure TCtrlParamArqPagto.DoChangeDataBase;
begin
  inherited;
end;

function TCtrlParamArqPagto.AbrirQueryPrincipal: boolean;
begin
  with (FSQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  F.MATRICULA, F.IDPESSOA,');
    Add('  PJ.RAZAOSOCIAL AS EMPRESA,');
    Add('  PF.NOME AS EMPREGADO,');
    Add('  PF.NUMDOCUMENTO AS CPF,');
    Add('  AG.NUMAGENCIA AS CODAGENCIA,');
    Add('  PA.NOME AS NOMEAGENCIA,');
    Add('  F.NUMCONTASALARIO AS CONTA,');
    Add('  CASE WHEN INSTR(F.NUMCONTASALARIO, ''-'') = 0 THEN ');
    Add('       CASE WHEN SUBSTR(F.NUMCONTASALARIO, 1, 3) = ''000'' THEN ');
    Add('                 LPAD(NVL(F.NUMCONTASALARIO, 0), 12, ''0'') ');
    Add('            ELSE LPAD(NVL(F.NUMCONTASALARIO, 0), 11, ''0'') ');
    Add('        END ');
    Add('       ELSE ');
    Add('       CASE WHEN SUBSTR(F.NUMCONTASALARIO, 1, 3) = ''000'' THEN ');
    //Add('                 LPAD(NVL(SUBSTR(F.NUMCONTASALARIO, 0, INSTR(F.NUMCONTASALARIO, ''-'')-1), 0), 12, ''0'') ');
    Add('            CASE ');
    Add('             WHEN LPAD(B.NUMBANCO, 3, ''0'') = ''399'' THEN ');
    Add('               LPAD(NVL(SUBSTR(F.NUMCONTASALARIO, 0, INSTR(F.NUMCONTASALARIO, ''-'')), 0), 12, ''0'') ');
    Add('             ELSE ');
    Add('               LPAD(NVL(SUBSTR(F.NUMCONTASALARIO, 0, INSTR(F.NUMCONTASALARIO, ''-'')-1), 0), 12, ''0'') ');
    Add('             END ');
    Add('       ELSE LPAD(NVL(SUBSTR(F.NUMCONTASALARIO, 0, INSTR(F.NUMCONTASALARIO, ''-'')-1), 0), 11, ''0'') ');
    Add('        END ');
    Add('   END AS CONTA_SALARIO, ');
    Add('  CASE WHEN INSTR(F.NUMCONTASALARIO, ''-'') = 0 THEN SUBSTR(F.NUMCONTASALARIO, LENGTH(F.NUMCONTASALARIO), 1)');
    //Add('       ELSE NVL(SUBSTR(F.NUMCONTASALARIO, INSTR(F.NUMCONTASALARIO, ''-'')+1, 1), '' '')');
    Add('  ELSE ');
    Add('    NVL(SUBSTR(F.NUMCONTASALARIO, INSTR(F.NUMCONTASALARIO, ''-'') + 1, 1), '' '') ');
    Add('  END AS DV_CONTA_SALARIO,');
    // Data de Crédito selecionada
    if (FDataCredito > 0) then
    begin
      Add('  (' +QuotedStr(IntToStr(ExtraiDia(FDataCredito)))+ ') AS DIA_CREDITO,');
      Add('  (' +QuotedStr(IntToStr(ExtraiMes(FDataCredito)))+ ') AS MES_CREDITO,');
      Add('  (' +QuotedStr(IntToStr(ExtraiAno(FDataCredito)))+ ') AS ANO_CREDITO,');
    end
    else
    begin
      Add('  ('' '') AS DIA_CREDITO,');
      Add('  ('' '') AS MES_CREDITO,');
      Add('  ('' '') AS ANO_CREDITO,');
    end;

    Add('  B.NUMBANCO,');
    Add('  PB.NOME AS BANCO,');
    Add('  RTRIM(DECODE(RTRIM(ESTADUAL.NUMDOCUMENTO),'''',');
    Add('    DECODE(RTRIM(MUNICIPAL.NUMDOCUMENTO),'''','''',');
    Add('    ''Inscrição Municipal: ''|| MUNICIPAL.NUMDOCUMENTO),');
    Add('    ''Inscrição Estadual: '' || ESTADUAL.NUMDOCUMENTO)) AS ESTADUALMUNICIPAL,');
    Add('  CGC.NUM AS CGCCPF,');
    Add('  ES.CODESTADO AS UF,');
    Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO || DECODE(E.COMPLEMENTO,'' '','' - '' ||');
    Add('    RTRIM(E.COMPLEMENTO)) ||'' - ''|| RTRIM(E.BAIRRO) ||'' - ''|| RTRIM(CIDADES.NOME) ||'' - CEP:''||');
    Add('    RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS ENDERECO,');
    Add('  DECODE(END.LOGRADOURO,NULL,'''',RTRIM(END.LOGRADOURO) ||'', ''|| END.NUMERO ||');
    Add('    DECODE(END.COMPLEMENTO,'' '','' - '' || RTRIM(END.COMPLEMENTO)) ||'' - ''||');
    Add('    RTRIM(END.BAIRRO) ||'' - ''|| RTRIM(CID.NOME) ||'' - CEP:''||');
    Add('    RTRIM(SUBSTR(END.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(END.CEP,6,3))) AS ENDERECOAGENCIA,');
    //Cássio Rovaroto - SIG nº 61776 - Início
    Add('  PTF.CODPORTFORMA, PTF.CODFORMAPAGTO, PTF.CODTIPOPAGTO, PTF.FLGEMITEAVISO, ');
    Add('  PTF.NOCONTACORR, PTF.IDBANCO, PTF.NOME_CONVENIO, PTF.FORMA_PAGTO, PTF.CODFORMA, ');
    Add('  DECODE(RUBRICA.VALOR, NULL,  PROVENTOS.DATAPAGAMENTO, RUBRICA.DATAPAGAMENTO) AS DATAPAGAMENTO, ');
    Add('  DECODE(RUBRICA.VALOR, NULL,  PROVENTOS.IDMOTIVO, RUBRICA.IDMOTIVO) AS IDMOTIVO, ');
    // Se a Rubrica 40999 não existir, calcula
    Add('  DECODE(RUBRICA.VALOR,NULL,(PROVENTOS.VALOR-DESCONTOS.VALOR),RUBRICA.VALOR) AS LIQUIDO');
    //Add('  SUM(DECODE(RUBRICA.VALOR,NULL,(PROVENTOS.VALOR-DESCONTOS.VALOR),RUBRICA.VALOR)) AS LIQUIDO');
    //Cássio Rovaroto - SIG nº 61776 - Fim


    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, PESSOA PB, PESSOA PA, ENDPESS E, ENDPESS END,');
    Add('  FUNCIONARIO F, CIDADES, CIDADES CID, ESTADO ES, BANCO B, AGENCIABANCARIA AG,'+
      IFF((FListaIdFunc = ''),'SITFUNC ST,',''));
    // -------------------------------------------------------------------------- //
    // CGC do Estabelecimento
    Add('  (SELECT FP.IDFILIALPESSOA AS IDPESSOA,');
    Add('          RTRIM(TDO.SIGLADOCUMENTO ||'' ''|| DO.NUMDOCUMENTO) AS NUM');
    Add('   FROM   DOCPESSOA DO, FILIALPESSOA FP, TIPODOCOFICIAL TDO');
    Add('   WHERE  ((TDO.SIGLADOCUMENTO = ''CNPJ:'') OR');
    Add('           (TDO.SIGLADOCUMENTO = ''CGC:'')) AND');
    Add('          (TDO.IDDOCUMENTO     = DO.IDDOCUMENTO) AND');
    Add('          (FP.IDFILIALPESSOA   = DO.IDPESSOA)) CGC,');
    // -------------------------------------------------------------------------- //
    // Inscrição Estadual
    Add('  (SELECT D.IDPESSOA, TD.CODDOCUMENTO, D.NUMDOCUMENTO, UPPER(TD.SIGLADOCUMENTO)');
    Add('   FROM   DOCPESSOA D, TIPODOCOFICIAL TD');
    Add('   WHERE (TD.SIGLADOCUMENTO = ''ESTADUAL:'') AND');
    Add('         (TD.IDDOCUMENTO    = D.IDDOCUMENTO)) ESTADUAL,');
    // -------------------------------------------------------------------------- //
    // Inscrição Municipal
    Add('  (SELECT D.IDPESSOA, TD.CODDOCUMENTO, D.NUMDOCUMENTO, UPPER(TD.SIGLADOCUMENTO)');
    Add('   FROM   DOCPESSOA D, TIPODOCOFICIAL TD');
    Add('   WHERE (TD.SIGLADOCUMENTO = ''MUNICIPAL:'') AND');
    Add('         (TD.IDDOCUMENTO    = D.IDDOCUMENTO)) MUNICIPAL,');
    // -------------------------------------------------------------------------- //
    // Proventos do Empregado
    Add('  (SELECT H.IDPESSOA, SUM(H.VALORPROVENTO) AS VALOR, H.DATAPAGAMENTO, H.IDMOTIVO');
    Add('   FROM   ' +FNomeTabela+ ' H, PROVDESC P, FUNCIONARIO F, FILIALPESSOA FP'+
      IFF((FListaIdFunc = ''),', SITFUNC ST',''));
    Add('   WHERE (FP.IDFILIALPESSOA = ' +FloatToStr(FIdEstab)+ ') AND');
    Add('         (P.FLGDESCONTO     = 0) AND');
    Add('         (H.IDPESSJUR       = ' +IntToStr(FIdEmpresa)+ ') AND');
    Add('         (H.MES             = ' +QuotedStr(FMesRef)+ ') AND');

    if (Pos(',', FListaIdTipoFolha) > 0) then
      Add('         (H.IDMOTIVO       IN (' +FListaIdTipoFolha+ ')) AND')
    else
      Add('         (H.IDMOTIVO        = ' +FListaIdTipoFolha+ ') AND');

    // Funcionário(s) selecionado(s)
    if (FListaIdFunc <> '') then
    begin
      if (Pos(',', FListaIdFunc) > 0) then
        Add('         (F.IDPESSOA       IN (' +FListaIdFunc+ ')) AND')
      else
        Add('         (F.IDPESSOA        = ' +FListaIdFunc+ ') AND');
    end
    else
    begin
      // C. de Custo(s) habilitados para o usuário
      if (FUsuXCCusto <> '') then
      begin
        if (Pos(',', FUsuXCCusto) > 0) then
          Add('         (F.CODCENTROCUSTO IN ' +FUsuXCCusto+ ') AND')
        else
          Add('         (F.CODCENTROCUSTO  = ' +FUsuXCCusto+ ') AND');
      end;

      if (FListaSelSitFunc <> '') then
        if (Pos(',', FListaSelSitFunc) > 0) then
          Add('         (ST.TIPOSIT       IN (' +FListaSelSitFunc+ ')) AND')
        else
          Add('         (ST.TIPOSIT        = ' +FListaSelSitFunc+ ') AND');

      if (Pos(',', FListaSelTipoContrato) > 0) then
        Add('         (F.TIPOCONTRATO   IN (' +FListaSelTipoContrato+ ')) AND')
      else
        Add('         (F.TIPOCONTRATO    = ' +FListaSelTipoContrato+ ') AND');

      Add('         (ST.IDSITFUNC      = F.IDSITFUNC) AND');
    end;

    Add('         (FP.IDFILIALPESSOA = F.IDESTAB) AND');
    Add('         (F.IDPESSOA        = H.IDPESSOA) AND');
    Add('         (H.DATAPAGAMENTO IS NULL OR H.DATAPAGAMENTO = TO_DATE(' +QuotedStr(DateToStr(FDataCredito)) +',''DD/MM/YYYY'')) AND');
    Add('         (H.IDRUBRICA       = P.IDPROVENTO)');
    Add('   GROUP BY H.IDPESSOA, H.DATAPAGAMENTO, H.IDMOTIVO) PROVENTOS,');
    // -------------------------------------------------------------------------- //
    // Desconto do Empregado
    Add('  (SELECT H.IDPESSOA, SUM(H.VALORPROVENTO) AS VALOR, H.DATAPAGAMENTO, H.IDMOTIVO');
    Add('   FROM   ' +FNomeTabela+ ' H, PROVDESC P, FUNCIONARIO F, FILIALPESSOA FP'+
      IFF((FListaIdFunc = ''),', SITFUNC ST',''));
    Add('   WHERE (FP.IDFILIALPESSOA = ' +FloatToStr(FIdEstab)+ ') AND');
    Add('         (P.FLGDESCONTO     = 1) AND');
    Add('         (H.IDPESSJUR       = ' +IntToStr(FIdEmpresa)+ ') AND');
    Add('         (H.MES             = ' +QuotedStr(FMesRef)+ ') AND');

    if (Pos(',', FListaIdTipoFolha) > 0) then
      Add('         (H.IDMOTIVO       IN (' +FListaIdTipoFolha+ ')) AND')
    else
      Add('         (H.IDMOTIVO        = ' +FListaIdTipoFolha+ ') AND');

    // Funcionário(s) selecionado(s)
    if (FListaIdFunc <> '') then
    begin
      if (Pos(',', FListaIdFunc) > 0) then
        Add('         (F.IDPESSOA       IN (' +FListaIdFunc+ ')) AND')
      else
        Add('         (F.IDPESSOA        = ' +FListaIdFunc+ ') AND');
    end
    else
    begin
      // C. de Custo(s) habilitados para o usuário
      if (FUsuXCCusto <> '') then
      begin
        if (Pos(',', FUsuXCCusto) > 0) then
          Add('         (F.CODCENTROCUSTO IN ' +FUsuXCCusto+ ') AND')
        else
          Add('         (F.CODCENTROCUSTO  = ' +FUsuXCCusto+ ') AND');
      end;

      if (FListaSelSitFunc <> '') then
        if (Pos(',', FListaSelSitFunc) > 0) then
          Add('         (ST.TIPOSIT       IN (' +FListaSelSitFunc+ ')) AND')
        else
          Add('         (ST.TIPOSIT        = ' +FListaSelSitFunc+ ') AND');

      if (Pos(',', FListaSelTipoContrato) > 0) then
        Add('         (F.TIPOCONTRATO   IN (' +FListaSelTipoContrato+ ')) AND')
      else
        Add('         (F.TIPOCONTRATO    = ' +FListaSelTipoContrato+ ') AND');

      Add('         (ST.IDSITFUNC      = F.IDSITFUNC) AND');
    end;

    Add('         (FP.IDFILIALPESSOA = F.IDESTAB) AND');
    Add('         (F.IDPESSOA        = H.IDPESSOA) AND');
    Add('         (H.DATAPAGAMENTO IS NULL OR H.DATAPAGAMENTO = TO_DATE(' +QuotedStr(DateToStr(FDataCredito)) +',''DD/MM/YYYY'')) AND');
    Add('         (H.IDRUBRICA       = P.IDPROVENTO)');
    Add('   GROUP BY H.IDPESSOA, H.DATAPAGAMENTO, H.IDMOTIVO) DESCONTOS,');
    // -------------------------------------------------------------------------- //
    // Rubrica de Salário
    Add('  (SELECT H.IDPESSOA,H.VALORPROVENTO AS VALOR, H.DATAPAGAMENTO, H.IDMOTIVO');
    Add('   FROM   ' +FNomeTabela+ ' H, PROVDESC P, FUNCIONARIO F, FILIALPESSOA FP'+
      IFF((FListaIdFunc = ''),', SITFUNC ST',''));
    Add('   WHERE (FP.IDFILIALPESSOA = ' +FloatToStr(FIdEstab)+ ') AND');
    Add('         (P.CODRUBCLT       = ''40999'') AND');
    Add('         (H.IDPESSJUR       = ' +IntToStr(FIdEmpresa)+ ') AND');
    Add('         (H.MES             = ' +QuotedStr(FMesRef)+ ') AND');

    if (Pos(',', FListaIdTipoFolha) > 0) then
      Add('         (H.IDMOTIVO       IN (' +FListaIdTipoFolha+ ')) AND')
    else
      Add('         (H.IDMOTIVO        = ' +FListaIdTipoFolha+ ') AND');

    // Funcionário(s) selecionado(s)
    if (FListaIdFunc <> '') then
    begin
      if (Pos(',', FListaIdFunc) > 0) then
        Add('         (F.IDPESSOA       IN (' +FListaIdFunc+ ')) AND')
      else
        Add('         (F.IDPESSOA        = ' +FListaIdFunc+ ') AND');
    end
    else
    begin
      // C. de Custo(s) habilitados para o usuário
      if (FUsuXCCusto <> '') then
      begin
        if (Pos(',', FUsuXCCusto) > 0) then
          Add('         (F.CODCENTROCUSTO IN ' +FUsuXCCusto+ ') AND')
        else
          Add('         (F.CODCENTROCUSTO  = ' +FUsuXCCusto+ ') AND');
      end;

      if (FListaSelSitFunc <> '') then
        if (Pos(',', FListaSelSitFunc) > 0) then
          Add('         (ST.TIPOSIT       IN (' +FListaSelSitFunc+ ')) AND')
        else
          Add('         (ST.TIPOSIT        = ' +FListaSelSitFunc+ ') AND');

      if (Pos(',', FListaSelTipoContrato) > 0) then
        Add('         (F.TIPOCONTRATO   IN (' +FListaSelTipoContrato+ ')) AND')
      else
        Add('         (F.TIPOCONTRATO    = ' +FListaSelTipoContrato+ ') AND');

      Add('         (ST.IDSITFUNC      = F.IDSITFUNC) AND');
    end;

    Add('         (FP.IDFILIALPESSOA = F.IDESTAB) AND');
    Add('         (F.IDPESSOA        = H.IDPESSOA) AND');
    Add('         (H.DATAPAGAMENTO IS NULL OR H.DATAPAGAMENTO = TO_DATE(' +QuotedStr(DateToStr(FDataCredito)) +',''DD/MM/YYYY'')) AND');
    Add('         (P.IDPROVENTO      = H.IDRUBRICA)) RUBRICA');
    // -------------------------------------------------------------------------- //

    //Cássio Rovaroto - SIG nº 61776 - Início
    //---------------------------------------------------------------------------
    //--Portador Forma
    Add(', (SELECT POR.IDPESSOA, PFR.CODPORTFORMA, PFR.CODPORTADOR, PFR.CODARQUIVOREMESSA,');
    Add('        PFR.CODFORMAPAGTO, PFR.FLGEMITEAVISO, PFR.CODTIPOPAGTO, PFR.NUMEMPRESABANCO,');
    Add('        PCT.IDBANCO, PCT.NOCONTACORR, PFR.DESCRICAO AS NOME_CONVENIO,');
    Add('        FRP.DESCRICAO AS FORMA_PAGTO, FRP.CODFORMA,');
    Add('        FRP.FLGPERMITELISTAFAVORECIDO, FRP.FLGPERMITETITULOSPAGTO');
    Add('   FROM PORTADORFORMA PFR,PORTADORCONTA PCT,FORMARECPAG FRP,');
    //Cássio Rovaroto - SIG nº 133912 - Início
    if (FConvFloat) then
      Add('        (SELECT F.IDPESSOA, 311 AS CODPORTFORMA')
    else
      Add('        (SELECT F.IDPESSOA, NVL(BPF.CODPORTFORMA, PFP.CODPORTFORMA) AS CODPORTFORMA');
    //Cássio Rovaroto - SIG nº 133912 - Fim
    Add('           FROM FUNCIONARIO F, AGENCIABANCARIA AGB,BANCOPORTFOLHA BPF,');
    Add('                (SELECT NVL(CODPORTFORMA, -1) AS CODPORTFORMA');
    Add('                   FROM BANCOPORTFOLHA');
    Add('                  WHERE (IDBANCO IS NULL)) PFP');
    Add('          WHERE (F.IDAGENCIASALARIO = AGB.IDPESSOA) AND');
    Add('                 (AGB.IDBANCO        = BPF.IDBANCO(+))) POR');
    Add('  WHERE (PCT.CODPORTADOR = PFR.CODPORTADOR)');
    Add('    AND (PFR.CODPORTFORMA = POR.CODPORTFORMA)');
    Add('    AND (FRP.CODFORMA = PFR.CODFORMA)) PTF ');
    //Cássio Rovaroto - SIG nº 61776 - Fim
    Add('WHERE');
    Add('  (PJ.IDPESSOA        = ' +FloatToStr(FIdEstab)+ ') AND');

    // Funcionário(s) selecionado(s)
    if (FListaIdFunc <> '') then
    begin
      if (Pos(',', FListaIdFunc) > 0) then
        Add('  (F.IDPESSOA         IN (' +FListaIdFunc+ ')) AND')
      else
        Add('  (F.IDPESSOA          = ' +FListaIdFunc+ ') AND');
    end
    else
    begin
      // C. de Custo(s) habilitados para o usuário
      if (FUsuXCCusto <> '') then
      begin
        if (Pos(',', FUsuXCCusto) > 0) then
          Add('  (F.CODCENTROCUSTO IN ' +FUsuXCCusto+ ') AND')
        else
          Add('  (F.CODCENTROCUSTO  = ' +FUsuXCCusto+ ') AND');
      end;

      if (FListaSelSitFunc <> '') then
        if (Pos(',', FListaSelSitFunc) > 0) then
          Add('  (ST.TIPOSIT        IN (' +FListaSelSitFunc+ ')) AND')
        else
          Add('  (ST.TIPOSIT         = ' +FListaSelSitFunc+ ') AND');

      if (Pos(',', FListaSelTipoContrato) > 0) then
        Add('  (F.TIPOCONTRATO    IN (' +FListaSelTipoContrato+ ')) AND')
      else
        Add('  (F.TIPOCONTRATO     = ' +FListaSelTipoContrato+ ') AND');

      Add('  (ST.IDSITFUNC       = F.IDSITFUNC) AND');
    end;

    Add('  (PJ.IDPESSOA        = CGC.IDPESSOA) AND');
    Add('  (PJ.IDPESSOA        = F.IDESTAB) AND');
    Add('  (F.IDPESSOA         = PF.IDPESSOA) AND');
    Add('  (F.IDAGENCIASALARIO = AG.IDPESSOA) AND');
    Add('  (AG.IDBANCO         = B.IDPESSOA) AND');
    Add('  (AG.IDPESSOA        = PA.IDPESSOA) AND');
    Add('  (B.IDPESSOA         = PB.IDPESSOA) AND');
    Add('  ((PROVENTOS.VALOR  IS NOT NULL) OR');
    Add('   (DESCONTOS.VALOR  IS NOT NULL) OR');
    Add('   (RUBRICA.VALOR    IS NOT NULL)) AND');
    Add('  (PJ.IDPESSOA        = E.IDPESSOA) AND');
    Add('  (PJ.IDENDCOMERCIAL  = E.IDENDERECO) AND');
    Add('  (E.IDCIDADES        = CIDADES.IDCIDADES(+)) AND');
    Add('  (CIDADES.IDESTADO   = ES.IDESTADO(+)) AND');
    Add('  (PA.IDPESSOA        = END.IDPESSOA(+)) AND');
    Add('  (PA.IDENDCOMERCIAL  = END.IDENDERECO(+)) AND');
    Add('  (END.IDCIDADES      = CID.IDCIDADES(+)) AND');
    Add('  (PJ.IDPESSOA        = ESTADUAL.IDPESSOA(+)) AND');
    Add('  (PJ.IDPESSOA        = MUNICIPAL.IDPESSOA(+)) AND');
    Add('  (PF.IDPESSOA        = RUBRICA.IDPESSOA(+)) AND');
    Add('  (PF.IDPESSOA        = DESCONTOS.IDPESSOA(+)) AND');
    Add('  (PF.IDPESSOA        = PROVENTOS.IDPESSOA(+))');
    //Cássio Rovaroto - SIG nº 61776 - Início
    Add('  AND (PF.IDPESSOA        = PTF.IDPESSOA)');
    {Add('GROUP BY F.MATRICULA, F.IDPESSOA,');
    Add('  PJ.RAZAOSOCIAL,');
    Add('  PF.NOME,');
    Add('  PF.NUMDOCUMENTO,');
    Add('  AG.NUMAGENCIA,');
    Add('  PA.NOME,');
    Add('  F.NUMCONTASALARIO,');
    Add('  CASE WHEN INSTR(F.NUMCONTASALARIO, ''-'') = 0 THEN');
    Add('            LPAD(NVL(F.NUMCONTASALARIO, 0), 11, ''0'')');
    Add('       ELSE  LPAD(NVL(SUBSTR(F.NUMCONTASALARIO, 0, INSTR(F.NUMCONTASALARIO, ''-'')-1), 0), 11, ''0'')');
    Add('   END,');
    Add('  CASE WHEN INSTR(F.NUMCONTASALARIO, ''-'') = 0 THEN '' ''');
    Add('       ELSE NVL(SUBSTR(F.NUMCONTASALARIO, INSTR(F.NUMCONTASALARIO, ''-'')+1, 1), '' '')');
    Add('   END ,');
    Add('  B.NUMBANCO,');
    Add('  PB.NOME,');
    Add('  RTRIM(DECODE(RTRIM(ESTADUAL.NUMDOCUMENTO),'''',');
    Add('    DECODE(RTRIM(MUNICIPAL.NUMDOCUMENTO),'''','''',');
    Add('    ''Inscrição Municipal: ''|| MUNICIPAL.NUMDOCUMENTO),');
    Add('    ''Inscrição Estadual: '' || ESTADUAL.NUMDOCUMENTO)),');
    Add('  CGC.NUM,');
    Add('  ES.CODESTADO,');
    Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO || DECODE(E.COMPLEMENTO,'' '','' - '' ||');
    Add('    RTRIM(E.COMPLEMENTO)) ||'' - ''|| RTRIM(E.BAIRRO) ||'' - ''|| RTRIM(CIDADES.NOME) ||'' - CEP:''||');
    Add('    RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)),');
    Add('  DECODE(END.LOGRADOURO,NULL,'''',RTRIM(END.LOGRADOURO) ||'', ''|| END.NUMERO ||');
    Add('    DECODE(END.COMPLEMENTO,'' '','' - '' || RTRIM(END.COMPLEMENTO)) ||'' - ''||');
    Add('    RTRIM(END.BAIRRO) ||'' - ''|| RTRIM(CID.NOME) ||'' - CEP:''||');
    Add('    RTRIM(SUBSTR(END.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(END.CEP,6,3))),');
    Add('  PTF.CODPORTFORMA, PTF.CODFORMAPAGTO, PTF.CODTIPOPAGTO, PTF.FLGEMITEAVISO,');
    Add('  PTF.NOCONTACORR, PTF.IDBANCO, PTF.NOME_CONVENIO, PTF.FORMA_PAGTO, PTF.CODFORMA,');
    Add('  DECODE(RUBRICA.VALOR, NULL,  PROVENTOS.DATAPAGAMENTO, RUBRICA.DATAPAGAMENTO),');
    Add('  DECODE(RUBRICA.VALOR, NULL,  PROVENTOS.IDMOTIVO, RUBRICA.IDMOTIVO)');}

    //Cássio Rovaroto - SIG nº 61776 - Fim
    Add('ORDER BY');
    Add('  IDMOTIVO,  BANCO, NOMEAGENCIA, EMPREGADO');
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;

  try
  FCdsPrincipal.Data := GetDataPacket(FSQL);

  Result := not(FCdsPrincipal.IsEmpty);
    if not(Result) then
    MessageInfo := 'Não há dados a serem processados para esta competência ou' +CR_LF+
      'Dados Cadastrais incompletos.';
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

procedure TCtrlParamArqPagto.AbrirQueryDocTXT;
begin
  with (FSQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  LPAD(''1'', 18, ''2'') CONTALIQUIDO,');
    Add('  0 IDPESSOA,');
    Add('  LPAD(''1'', 30, ''2'') NOME,');
    Add('  LPAD(''1'', 30, ''2'') RAZAOSOCIAL,');
    Add('  LPAD(''1'', 18, ''2'') NUMDOCUMENTO,');
    Add('  LPAD(''1'', 15, ''2'') CONTACORRENTE,');
    Add('  LPAD(''1'', 10, ''2'') CODBANCOFAVORECIDO,');
    Add('  LPAD(''1'', 15, ''2'') NUMAGENCIA,');
    Add('  LPAD(''1'', 40, ''2'') LOGRADOURO,');
    Add('  ''12345678'' NUMERO,');
    Add('  LPAD(''1'', 20, ''2'') COMPLEMENTO,');
    Add('  LPAD(''1'', 20, ''2'') BAIRRO,');
    Add('  LPAD(''1'', 20, ''2'') CIDADE,');
    Add('  ''123'' CODESTADO,');
    Add('  ''12345678'' CEP,');
    Add('  0 IDFORCLI,');
    Add('  0 CODDOCUMENTO,');
    Add('  LPAD(''1'', 13, ''2'') LIVRE,');
    Add('  0 VALOR,');
    Add('  0 VALORDESCONTO,');
    Add('  0 VALORJUROS,');
    Add('  ''01/01/2003'' DATAVENCTO,');
    Add('  ''01/01/2003'' DATAPROGRAMADA,');
    Add('  0 TIPOMOEDA,');
    Add('  0 NUMLOTE,');
    Add('  0 CODPORTFORMA,');
    Add('  0 CODFORMAPAGTO,');
    Add('  0 CODTIPOPAGTO,');
    Add('  ''0'' FLGEMITEAVISO,');
    Add('  0 CODARQUIVOREMESSA,');
    Add('  0 CODPORTADOR,');
    Add('  0 IDBANCO,');
    Add('  LPAD(''1'', 15, ''2'') NOCONTACORR,');
    Add('  ''1234567890'' CODBARRA,');
    Add('  ''1234567890'' CODBARRAVALOR,');
    Add('  0 NODOCUMENTO,');
    Add('  ''123'' COMPLDOCUMENTO,');
    Add('  ''1'' TIPO,');
    Add('  LPAD(''1'', 20, ''2'') NUMEMPRESABANCO,');
    Add('  ''1'' DEBCRE,');
    Add('  ''1'' TIPOCONTA');
    Add('FROM');
    Add('  DUAL');
    Add('WHERE');
    Add('  (1 = 2)');
  end;
  FCdsDocTxt.Data := GetDataPacket(FSQL);
end;

procedure TCtrlParamArqPagto.AlimentaQryDocTxt;
var
  sLogradouro, sNumero, sComplemento, sBairro, sCidade, sCodestado, sCEP: string;
begin
  if (FCdsPrincipal.FieldByName('LIQUIDO').asFloat = 0) or
     (FCdsPrincipal.FieldByName('CONTA').asString = '') then
    exit;

  _Cds.Data := FCtrlPessoaFuncionario.ListAgenciaSalario(FCdsPrincipal.FieldByName('IDPESSOA').asFloat);
  if not(_Cds.IsEmpty) then
  begin
    FUltPortForma := _Cds.FieldByName('CODPORTFORMA').asInteger;
    if (FUltPortForma = 0) then
      FUltPortForma := FPortadorFormaPadrao;
  end;

  if (FLstPortForma.IndexOf(IntToStr(FUltPortForma)) = -1) then
    FLstPortForma.Add(IntToStr(FUltPortForma));

  FCdsPortadorForma.Locate('CODPORTFORMA', FUltPortForma, []);

  _Cds.Data := FCtrlListTerceirosRH.ListEndereco(FCdsPrincipal.FieldByName('IDPESSOA').asFloat);

  
  if not(_Cds.IsEmpty) then
  begin
    sLogradouro := _Cds.FieldByName('LOGRADOURO').asString;
    sNumero := _Cds.FieldByName('NUMERO').asString;
    sComplemento := _Cds.FieldByName('COMPLEMENTO').asString;
    sBairro := _Cds.FieldByName('BAIRRO').asString;
    sCidade := _Cds.FieldByName('CIDADE').asString;
    sCodEstado := _Cds.FieldByName('CODESTADO').asString;
    sCEP := _Cds.FieldByName('CEP').asString;
  end
  else
  begin
    sLogradouro := '';
    sNumero := '';
    sComplemento := '';
    sBairro := '';
    sCidade := '';
    sCodEstado := '';
    sCEP := '';
  end;

  with (FCdsDocTxt) do
  begin
    Insert;
    FieldByName('CONTALIQUIDO').asString := '';
    FieldByName('IDPESSOA').asInteger := FCdsPrincipal.FieldByName('IDPESSOA').asInteger;
    FieldByName('NOME').asString := FCdsPrincipal.FieldByName('EMPREGADO').asString;
    FieldByName('RAZAOSOCIAL').asString := FCdsPrincipal.FieldByName('EMPREGADO').asString;
    FieldByName('NUMDOCUMENTO').asString := FCdsPrincipal.FieldByName('CPF').asString;
    FieldByName('CONTACORRENTE').asString := FCdsPrincipal.FieldByName('CONTA').asString;
    FieldByName('CODBANCOFAVORECIDO').asString := FCdsPrincipal.FieldByName('NUMBANCO').asString;
    FieldByName('NUMAGENCIA').asString := FCdsPrincipal.FieldByName('CODAGENCIA').asString;
    FieldByName('LOGRADOURO').asString := sLogradouro;
    FieldByName('NUMERO').asString := sNumero;
    FieldByName('COMPLEMENTO').asString := sComplemento;
    FieldByName('BAIRRO').asString := sBairro;
    FieldByName('CIDADE').asString := sCidade;
    FieldByName('CODESTADO').asString := sCodEstado;
    FieldByName('CEP').asString := sCEP;
    FieldByName('IDFORCLI').asFloat := FCdsPrincipal.FieldByName('IDPESSOA').asFloat;
    FieldByName('TIPOCONTA').asString := '1';
    FieldByName('CODDOCUMENTO').asString := '0';
    FieldByName('LIVRE').asString := Trim(FCdsPrincipal.FieldByName('MATRICULA').asString);
    FieldByName('VALOR').asFloat := FCdsPrincipal.FieldByName('LIQUIDO').asFloat;
    FieldByName('VALORDESCONTO').asFloat := 0;
    FieldByName('VALORJUROS').asFloat := 0;
    FieldByName('DATAVENCTO').asString := DateToStr(FDataCredito);
    FieldByName('DATAPROGRAMADA').asString := DateToStr(FDataCredito);
    FieldByName('TIPOMOEDA').asInteger := 0;
    FieldByName('NUMLOTE').asInteger := 0;
    FieldByName('CODPORTFORMA').asInteger := FUltPortForma;
    FieldByName('CODPORTADOR').asFloat := FCdsPortadorForma.FieldByName('CODPORTADOR').asFloat;
    FieldByName('CODFORMAPAGTO').asFloat := FCdsPortadorForma.FieldByName('CODFORMAPAGTO').asFloat;
    FieldByName('CODTIPOPAGTO').asFloat := FCdsPortadorForma.FieldByName('CODTIPOPAGTO').asFloat;
    FieldByName('FLGEMITEAVISO').asString := FCdsPortadorForma.FieldByName('FLGEMITEAVISO').asString;
    FieldByName('CODARQUIVOREMESSA').asInteger := FCdsPortadorForma.FieldByName('CODARQUIVOREMESSA').asInteger;
    FieldByName('IDBANCO').asFloat := FCdsPortadorForma.FieldByName('IDBANCO').asFloat;
    FieldByName('NOCONTACORR').asString := FCdsPortadorForma.FieldByName('NOCONTACORR').asString;
    FieldByName('CODBARRA').asString := '';
    FieldByName('CODBARRAVALOR').asString := '';
    FieldByName('NODOCUMENTO').asFloat := StrToFloat(IntToStr(FCdsPrincipal.FieldByName('IDPESSOA').asInteger)+Copy(FMesRef,1,4)); // Codigo que aparece no relatorio
    FieldByName('COMPLDOCUMENTO').asString := Copy(FMesRef,6,2); // Codigo que aparece no relatorio
    FieldByName('TIPO').asString := 'F';
    FieldByName('NUMEMPRESABANCO').asString := FCdsPortadorForma.FieldByName('NUMEMPRESABANCO').asString;
    FieldByName('DEBCRE').asString := '';
    Post;
  end;
end;

function TCtrlParamArqPagto.ProcessarGeracao(IdEmpresa: integer; IdEstab: double; MesRef,
  AnoRef: integer; DataCredito: TDate; Previa: boolean; ListaIdTipoFolha, ListaIdFunc,
  Diretorio, ListaSelSitFunc, ListaSelTipoContrato: string): boolean;
var
  FCdsPessoasAux: TCMClientDataSet;
  sNumNSA: string;
{-->}procedure InserirCdsPessoas;
     var
       c: byte;
     begin
       FCdsDocTxt.First;
       FCdsPessoasAux.EmptyDataSet;
       while not(FCdsDocTxt.EOF) do
       begin
         FCdsPessoasAux.Insert;
         for c:=0 to FCdsDocTxt.FieldCount-1 do
           FCdsPessoasAux.Fields[c].Value := FCdsDocTxt.Fields[c].Value;
         FCdsPessoasAux.Post;
         FCdsDocTxt.Next;
       end;
       FCdsPessoasAux.First;
{-->}end;
begin
  try
    Result := false;
    FCdsPessoasAux := TCMClientDataSet.Create(nil);

    FIdEmpresa := IdEmpresa;
    FIdEstab := IdEstab;
    FMesRef := IntToStr(AnoRef) + '/'+ PoeZero(MesRef);
    FDataCredito := DataCredito;
    FListaIdFunc := ListaIdFunc;
    FListaIdTipoFolha := ListaIdTipoFolha;
    FListaSelSitFunc := QuotedListaString(ListaSelSitFunc,',');
    FListaSelTipoContrato := QuotedListaString(ListaSelTipoContrato,',');
    FDiretorio := Diretorio;

    //Cássio Rovaroto -  SIG nº 61776 - Início
    //if (Previa) then
    //  FNomeTabela := 'PREVIAFOLPAG'
    //else
    //  FNomeTabela := 'HISTRUBSAL';

    dValorLiquidoFolha := 0.00;

    try
      {FDadosIncompletos := not(AbrirQueryPrincipal);
      if (FDadosIncompletos) then
        raise Exception.Create(MessageInfo);
      //Cássio Rovaroto -  SIG n 61776 - Início
      //AbrirQueryDocTXT;
      AbrirQueryDocTxtLeiaute240;
      //Cássio Rovaroto -  SIG n 61776 - Fim

      while not(FCdsPrincipal.EOF) do
      begin
        //Cássio Rovaroto -  SIG n 61776 - Início
        //AlimentaQryDocTxt;
        AlimentaQryDocTxtLeiaute240;
        dValorLiquidoFolha := dValorLiquidoFolha + FCdsPrincipal.FieldByName('LIQUIDO').asFloat;
        //Cássio Rovaroto -  SIG n 61776 - Fim
        FCdsPrincipal.Next;
      end;}

      FCdsPessoasAux.Data := FCdsDocTxt.Data;
      FCdsDocTxt.Filter := '';
      FCdsDocTxt.Filtered := true;

      //Cássio Rovaroto - SIG nº 133912 - Início
      if FConvFloat then
      begin
        FCdsDocTxt.Filter := 'CODPORTFORMA = ' + IntToStr(FUltPortForma);
        InserirCdsPessoas;

        if not MontaArquivoCNAB240(sNumNSA) then ///Cássio Rovaroto - SIG nº 101266
          raise Exception.Create('Erro na geração do arquivo de Pagamento Eletrônico.'+CR_LF+
                                  ' * Código do Portador Forma = ' + IntToStr(FUltPortForma)+CR_LF+
                                  'Erro: ' +CR_LF);
      end
      else
      //Cássio Rovaroto - SIG nº 133912 - Fim
      begin
        FCdsPrincipal.Data := FCtrlBancoPortFolha.ListPortadorXContaXFolha;
        while not(FCdsPrincipal.EOF) do
        begin
          FUltPortForma := FCdsPrincipal.FieldByName('CODPORTFORMA').asInteger;
          if (FLstPortForma.IndexOf(IntToStr(FUltPortForma)) <> -1) then
          begin
            FCdsDocTxt.Filter := 'CODPORTFORMA = ' + IntToStr(FUltPortForma);
            InserirCdsPessoas;
            //Cássio Rovaroto - SIG Nº 61776 - Início

            if not MontaArquivoCNAB240(sNumNSA) then ///Cássio Rovaroto - SIG nº 101266
              raise Exception.Create('Erro na geração do arquivo de Pagamento Eletrônico.'+CR_LF+
                                       ' * Código do Portador Forma = ' + IntToStr(FUltPortForma)+CR_LF+
                                       'Erro: ' +CR_LF{+ FCtrlIntBanco.MessageInfo})

            //FCtrlIntBanco.IndiceDoBanco := FCdsPrincipal.FieldByName('CODARQUIVOREMESSA').asInteger;
            //if (FCtrlIntBanco.VerficaDadosEmpresa('P', FUltPortForma)) then
            //begin
            //  if (FCtrlIntBanco.ValidaRemessa('P', FCdsPessoasAux.Data, false)) then
            //  begin
            //    FCtrlIntBanco.DataPagamento := DateToStr(DataCredito);
            //    DoProgresso([0]);
            //    FCtrlIntBanco.MontaPagamentoEletronico(
            //      FCdsPrincipal.FieldByName('CODARQUIVOREMESSA').asInteger,
            //      FCdsPrincipal.FieldByName('CONTROLEREMESSA').asInteger,
            //      FCdsPessoasAux.Data, FDiretorio);
            //  end
            //  else
            //    raise Exception.Create('Erro na geração do arquivo de Pagamento Eletrônico.'+CR_LF+
            //                           ' * Código do Portador Forma = ' + IntToStr(FUltPortForma)+CR_LF+
            //                           'Erro: ' +CR_LF+ FCtrlIntBanco.MessageInfo);
            //end;
          end;
          FCdsPrincipal.Next;
        end;
      end;
      MessageInfo := 'Arquivo de Pagamento gerado com sucesso. ' +#10#13+
                     'Número Sequencial do Arquivo (NSA): ' + sNumNSA; //Cássio Rovaroto - SIG nº 101266
      
      Result := true;
    except
      on E: Exception do
        MessageInfo := E.Message;
    end;
  finally
    FreeAndNil(FCdsPessoasAux);
  end;
  //Cássio Rovaroto -  SIG nº 61776 - Fim
end;

function TCtrlParamArqPagto.MontaArquivoCNAB240(var sNSA: string): boolean;
var sNomeArquivoGerado, sNomeCompletoArquivoRemessa, sNomeCompletoBackup, sTipCompromisso, sFinalidadeDOC: String;
    cdsAux: TCMClientDataSet;
    iNumArquivo: Integer;
    sNomeCompletoArquivoRemessaServidor: string;  //Cássio Rovaroto - SIG nº 101591
begin
  Result := True;

  //Obtendo NSA para o arquivo
  cdsAux := TCMClientDataSet.Create(nil);
  cdsAux.Data := GetNumNSA;
  iNumArquivo := cdsAux.FieldByName('SEQ').asInteger;
  sNSA := ZeroEsquerda(6, cdsAux.FieldByName('SEQ').AsString); //Cássio Rovaroto - SIG nº 101266
  FCdsMontaArquivo.Data := GetParametrosArquivo(FCdsPrincipal.FieldByName('CODPORTFORMA').asInteger, iNumArquivo);

  try
    if FCdsMontaArquivo.IsEmpty then
    begin
      Result := False;
      Exit;
    end
    else
    begin
      sNomeArquivoGerado := FCdsMontaArquivo.FieldByName('NOME_ARQ_REM').asString;
      sNomeCompletoArquivoRemessa := 'C:\Planus\Temp\RemessaEletronica\Remessa\' + sNomeArquivoGerado; // Cássio Rovaroto - SIG nº 101591

      if Copy(UpperCase(Sistema.AliasServidor),1,8) <> 'PRODUCAO' then    //Ejrb - 29/04/2021 - SIG 114623 - Implementação do comando Copy, para igualar as bases de produção.
      begin
        sNomeCompletoBackup := 'C:\Planus\Temp\RemessaEletronica\Remessa\' + sNomeArquivoGerado;
      end
      else
      begin
        sNomeCompletoArquivoRemessaServidor := FCdsMontaArquivo.FieldByName('PATHARQUIVOREM').asString + '\' + sNomeArquivoGerado; //Cássio Rovaroto - SIG nº 101591
        sNomeCompletoBackup := FCdsMontaArquivo.FieldByName('PATHARQUIVOBACKUP').asString + '\' + sNomeArquivoGerado;
      end;

      if Impersonate then
      begin
        //Cássio Rovaroto - SIG nº 101591 - Início
        if not DirectoryExists(ExtractFileDir(sNomeCompletoArquivoRemessa)) then
          ForceDirectories(ExtractFileDir(sNomeCompletoArquivoRemessa));
        //Cássio Rovaroto - SIG nº 101591 - Fim

        if FileExists(sNomeCompletoArquivoRemessa) Then
          DeleteFile(pChar(sNomeCompletoArquivoRemessa));
        RevertToSelf;
      end;

      if CriaArquivo(sNomeCompletoArquivoRemessa) then
      begin
        //Gerando e gravando dados paara o arquivo de remessa
        if GeraArquivoDeRemessa(sNomeCompletoArquivoRemessa,
                                FCdsPrincipal.FieldByName('CODPORTFORMA').asString,
                                IntToStr(iNumArquivo)) then
        begin
          if Impersonate then
          begin
            // Copiando o arquivo do diretório de remessa para o de backup
            CopyFile(pChar(sNomeCompletoArquivoRemessa), pChar(sNomeCompletoBackup), False);

            //Cássio Rovaroto - SIG Nº 101591 - Início
            if (copy(UpperCase(Sistema.AliasServidor),1,8) = 'PRODUCAO') then  //Ejrb - 29/04/2021 - SIG 114623 - Implementação do comando Copy, para igualar as bases de produção.
            begin
              if not DirectoryExists(ExtractFileDir(sNomeCompletoArquivoRemessaServidor)) then
                ForceDirectories(ExtractFileDir(sNomeCompletoArquivoRemessaServidor));

              // Copiando o arquivo do diretório de remessa para PRODUCAO
              CopyFile(pchar(sNomeCompletoArquivoRemessa), pchar(sNomeCompletoArquivoRemessaServidor), False);
            end;
            //Cássio Rovaroto - SIG Nº 101591 - Fim
            RevertToSelf;
          end;
        end;
      end;
    end;
  finally
    FreeAndNil(cdsAux);
  end;
end;

function TCtrlParamArqPagto.GetParametrosArquivo(
  iCodPortadorForma, iNumArquivo: integer): OleVariant;
var sSQL: string;
begin
  sSQL := 'SELECT ''ACC.'' || TO_CHAR(SYSDATE, ''DDMMYYYY.'') || TRIM(CONV.NUMEMPRESABANCO) || ''.'' || LPAD(' + QuotedStr(IntToStr(iNumArquivo)) + ', 6, ''0'') || ''.rem'' AS NOME_ARQ_REM,  ' +#13#10 +
          '       PO.PATHARQUIVOREM, PO.PATHARQUIVOBACKUP, BA.NUMBANCO, NVL(PE.NOME, PE.RAZAOSOCIAL) NOME_BANCO, NVL(PP.VLR_OBRIGA_CPF_CNPJ, 0) VLR_OBRIGA_CPF_CNPJ, ' +#13#10 +
          '       PP.PARAM_TRANSMISSAO, PP.AMBIENTE, PP.VERSAO_LEIAUTE_ARQ, PP.VERSAO_LEIAUTE_LOTE, PP.DENSIDADE, PP.TIPO_OPERACAO, PP.COD_COMPROMISSO,              ' +#13#10 +
          '       PP.TIPO_SERVICO, PP.TIPO_SERVICO_K, PP.TIPO_COMPROMISSO, PP.TIPO_COMPROMISSO_K, PP.FINALIDADE_DOC                                                  ' +#13#10 +
          '  FROM PORTADORFORMA PO                                                                                                                                   ' +#13#10 +
          '  JOIN PORTFORMAXPARAMARQREM PP ON PP.CODPORTFORMA = PO.CODPORTFORMA                                                                                      ' +#13#10 +
          '  JOIN BANCO BA ON BA.IDPESSOA = PP.IDBANCO_PAGADOR                                                                                                       ' +#13#10 +
          '  JOIN PESSOA PE ON PE.IDPESSOA = BA.IDPESSOA                                                                                                             ' +#13#10 +
          '  LEFT JOIN SEQREMESSA CONV ON PO.NUMEMPRESABANCO = CONV.NUMEMPRESABANCO                                                                                  ' +#13#10 +
          ' WHERE PO.CODPORTFORMA = ' + IntToStr(iCodPortadorForma);

  Result := GetDataPacket(sSQL);
end;

function TCtrlParamArqPagto.CriaArquivo(sArquivo: String): Boolean;
begin
//Cássio Rovaroto - SIG nº 101591 - Início
//  Result := False;
  try
//    if Impersonate then
//    begin
    AssignFile(ArquivoEnvioCEF, sArquivo);
    Rewrite(ArquivoEnvioCEF);
    CloseFile(ArquivoEnvioCEF);
//      RevertToSelf;
//    end;
    Result := True;
  except
    Result := False;
  end;
//Cássio Rovaroto - SIG nº 101591 - Fim
end;

function TCtrlParamArqPagto.GetNumNSA: OleVariant;
begin
  Result := GetDataPacket('SELECT SEQNSAFOLHAFUNC.NEXTVAL SEQ FROM DUAL');
end;

function TCtrlParamArqPagto.GeraArquivoDeRemessa(
  pNomeCompletoArquivoRemessa, pCodPortForma, pNSA: String): boolean;
Var sLinha, sTipFormaRecPag, sFormaLanc, sVlrTotalLote, sTipoServico, sTipoCompromisso, sFinalidadeDOC: String;
    iQtdLotesArq, iQtdRegsArq, iSeqLote, iQtdRegsLote, iContador1, iContador2: Integer;
    dVlrTotalLote: Double;
    cdsAux: TCMClientDataSet;
    sHeader: string;
    iRegLote, iNumDoc: integer;
begin
  Result := true;
  iQtdLotesArq := 0;
  iQtdRegsArq := 0;
  iSeqLote := 0;
  iQtdRegsLote := 0;
  iContador1 := 0;
  sVlrTotalLote := EmptyStr;
  sTipoServico := EmptyStr;
  sTipoCompromisso := EmptyStr;
  sFinalidadeDOC := EmptyStr;
  iRegLote := 0;
  iNumDoc:= 0;

  cdsAux := TCMClientDataSet.Create(nil);
  try
    try
      // 1.0 - Linha do Cabeçalho do Arquivo
      FcdsGeraCabecRodapeArq.Data := SelecionaDadosCabecArq(StrToInt(pCodPortForma), pNSA);
      sLinha := FcdsGeraCabecRodapeArq.FieldByName('LINHACABECARQ').asString;
      GravaLinha(pNomeCompletoArquivoRemessa, sLinha);

      // 2.0 - linhas do Movimento do Lote
      sFormaLanc := '01'; //Crédito em Conta Corrente CAIXA
      sTipFormaRecPag:= '30'; // Pagamento de salário
      Inc(iSeqLote); // Determina o número do LOTE
      sFinalidadeDOC := FCdsMontaArquivo.FieldByName('FINALIDADE_DOC').asString;
      sTipoServico := FCdsMontaArquivo.FieldByName('TIPO_SERVICO').asString;
      sTipoCompromisso := FCdsMontaArquivo.FieldByName('TIPO_COMPROMISSO').asString;
      dVlrTotalLote := 0.00;

      //2.1 - Cabeçalho do Lote
      cdsAux.Data := SelecionaDadosCabecLote(pCodPortForma, IntToStr(iSeqLote), sFormaLanc, sTipoCompromisso, sTipoServico);
      sLinha := cdsAux.FieldByName('LINHACABECLOTE').AsString;
      GravaLinha(pNomeCompletoArquivoRemessa, sLinha);

      FCdsDocTxt.First;
      iRegLote := 0; //Inicializa contando a linha do HEADER do LOTE.
      iContador2 := 1; //Inicializa a contagem de linha do LOTE.
      while not FCdsDocTxt.Eof do
      begin
        //------------------
        Inc(iNumDoc);
        //2.2 - Linhas A  e B
        //Grava linha A
        GravaLinha(pNomeCompletoArquivoRemessa, MontaLinhaA(IntToStr(iContador2), IntToStr(iSeqLote), sFinalidadeDOC));
        Inc(iContador2);

        //Grava linha B
        GravaLinha(pNomeCompletoArquivoRemessa, MontaLinhaB(IntToStr(iContador2), IntToStr(iSeqLote)));
        Inc(iContador2);

        dVlrTotalLote := dVlrTotalLote + FCdsDocTxt.FieldByName('VALOR').asFloat;
        Inc(iRegLote,2);

        RegistraTarifaBancaria(StrToInt(pNSA), iNumDoc, FCdsDocTxt.FieldByName('CODPORTFORMA').asInteger, FCdsDocTxt.FieldByName('CODFORMA').asInteger);
        FCdsDocTxt.Next;
      end;
      //------------------

      //2.3 - Linha do Rodapé do Lote
      iQtdRegsLote := iRegLote + 2; // 2 = Inclusão de contagem do HEADER e do TRAILLER
      sVlrTotalLote := FormatarValor(2, FloatToStr(dVlrTotalLote));
      //iQtdRegsLote := FCdsDocTxt.Recordcount + 2; // Inclui o cabec e o rodape
      //Inc(iRegLote, 2);
      //iQtdRegsLote := iRegLote + 1; // Inclui o cabec e o rodape
      FcdsGeraCabecRodapeLote.data := SelecionaDadosRodapeLote(inttostr(iSeqLote), inttostr(iQtdRegsLote), sVlrTotalLote);
      sLinha := FcdsGeraCabecRodapeLote.FieldByName('LINHARODAPELOTE').asString;
      GravaLinha(pNomeCompletoArquivoRemessa, sLinha);

      iQtdRegsArq := iQtdRegsLote;
      //------------------

      // 3.0. - Linha do Rodapé do Arquivo
      iQtdLotesArq := iSeqLote;
      iQtdRegsArq := iQtdRegsArq + 2;
      FcdsGeraCabecRodapeArq.data := SelecionaDadosRodapeArq(IntToStr(iQtdLotesArq), IntToStr(iQtdRegsArq));
      sLinha := FcdsGeraCabecRodapeArq.FieldByName('LINHARODAPEARQ').asString;
      GravaLinha(pNomeCompletoArquivoRemessa, sLinha);
    except
      Result := False;
    end;
  finally
    FreeAndNil(cdsAux);
  end;
end;

function TCtrlParamArqPagto.SelecionaDadosCabecArq(iCodPortForma: integer;
  sNSA: string): OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT ' + Quotedstr(FCdsMontaArquivo.FieldByName('NUMBANCO').asString) + '||--BANCO,                     ' + #13#10 +
          '       LPAD(''0'', 4, ''0'') ||--COD_LOTE,                                                                ' + #13#10 +
          '       ''0'' ||--REG,                                                                                     ' + #13#10 +
          '       RPAD('' '', 9) ||--FILLER,                                                                         ' + #13#10 +
          '       DECODE(LENGTH(REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D'')), 11, ''1'', 14, ''2'', ''0'') ||--TIP_INSC,  ' + #13#10 +
          '       LPAD(REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D''), 14, ''0'') ||--NUM_INSC,                              ' + #13#10 +
          '       LPAD(REGEXP_REPLACE(PO.NUMEMPRESABANCO, ''\D''), 6, ''0'') ||--COD_CONV,                           ' + #13#10 +
          '       RPAD('+ Quotedstr(FCdsMontaArquivo.FieldByName('PARAM_TRANSMISSAO').asString) + ', 2, ''0'') ||    ' + #13#10;
          if Copy(UpperCase(Sistema.AliasServidor),1,8) = 'PRODUCAO' then   //Ejrb - 29/04/2021 - SIG 114623 - Implementação do comando Copy, para igualar as bases de produção.
            //Cássio Rovaroto - SIG nº 101266 - Início
            //sSql := sSql + Quotedstr(FCdsMontaArquivo.FieldByName('AMBIENTE').asString) + '|| || --AMB_CLI,          ' + #13#10
            sSql := sSql + Quotedstr(FCdsMontaArquivo.FieldByName('AMBIENTE').asString) + ' || --AMB_CLI,            ' + #13#10
            //Cássio Rovaroto - SIG nº 101266 - Fim
          else
            sSql := sSql + '''T'' || --AMB_CLI,                                                                      ' + #13#10;
          sSql := sSql + '       '' '' ||--AMB_CAIXA,                                                                ' + #13#10 +
          '       RPAD('' '', 3) ||--ORIG_APLIC,                                                                     ' + #13#10 +
          '       LPAD(''0'', 4, ''0'') ||--NUM_VERSAO,                                                              ' + #13#10 +
          '       RPAD('' '', 3) ||--FILLER,                                                                         ' + #13#10 +
          '       CASE                                                                                               ' + #13#10 +
          '         WHEN INSTR(BA.MASCARAAGENCIA, ''-'') = 0 THEN                                                    ' + #13#10 +
          '           LPAD(NVL(REGEXP_REPLACE(AG.NUMAGENCIA, ''\W''), ''0''), 5, ''0'')                              ' + #13#10 +
          '         ELSE                                                                                             ' + #13#10 +
          '           LPAD(NVL(SUBSTR(REGEXP_REPLACE(AG.NUMAGENCIA, ''\W''), 0, INSTR(TRIM(BA.MASCARAAGENCIA), ''-'')-1), 0), 5, ''0'')  ' + #13#10 +
          '       END ||--AGENCIA_CLI,                                                                               ' + #13#10 +
          '       /*CASE                                                                                             ' + #13#10 +
          '         WHEN INSTR(BA.MASCARAAGENCIA, ''-'') = 0 THEN                                                    ' + #13#10 +
          '           ''0''                                                                                          ' + #13#10 +
          '         ELSE                                                                                             ' + #13#10 +
          '           NVL(SUBSTR(REGEXP_REPLACE(AG.NUMAGENCIA, ''\W''), INSTR(TRIM(BA.MASCARAAGENCIA), ''-''), 1), ''0'')  ' + #13#10 +
          '       END ||DV_AG, */                                                                                    ' + #13#10 +
          '       ''9'' ||--DV_AG,                                                                                   ' + #13#10 +
          '       CASE                                                                                               ' + #13#10 +
          '         WHEN INSTR(BA.MASCARACC, ''-'') = 0 THEN                                                         ' + #13#10 +
          '           LPAD(NVL(REGEXP_REPLACE(CO.CONTACORRENTE, ''\W''), ''0''), 12, ''0'')                          ' + #13#10 +
          '         ELSE                                                                                             ' + #13#10 +
          '           LPAD(NVL(SUBSTR(REGEXP_REPLACE(CO.CONTACORRENTE, ''\W''), 0, INSTR(TRIM(BA.MASCARACC), ''-'')-1), ''0''), 12, ''0'')  ' + #13#10 +
          '       END ||--CONTA_CLI,                                                                                 ' + #13#10 +
          '       CASE                                                                                               ' + #13#10 +
          '         WHEN INSTR(BA.MASCARACC, ''-'') = 0 THEN                                                         ' + #13#10 +
          '           '' ''                                                                                          ' + #13#10 +
          '         ELSE                                                                                             ' + #13#10 +
          '           NVL(SUBSTR(REGEXP_REPLACE(CO.CONTACORRENTE, ''\W''), INSTR(TRIM(BA.MASCARACC), ''-''), 1), '' '')  ' + #13#10 +
          '       END ||--DV_CC,                                                                                     ' + #13#10 +
          '       '' '' ||--DV_AG_CC,                                                                                ' + #13#10 +
          '       RPAD(UPPER(TRANSLATE(TRIM(P.NOME) ||'' - ''|| TRIM(P.RAZAOSOCIAL), ''ÁÇÉÍÓÚÀÈÌÒÙÂÊÎÔÛÃÕËÜáçéíóúàèìòùâêîôûãõëü'',''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu'')), 30) ||--NOME_EMPRESA,  ' + #13#10 +
          '       RPAD(' + Quotedstr(FCdsMontaArquivo.FieldByName('NOME_BANCO').asString) + ', 30, '' '') ||         ' + #13#10 +
          '       RPAD('' '', 10) ||--FILLER,                                                                        ' + #13#10 +
          '       ''1'' ||--REM_RET,                                                                                 ' + #13#10 +
          '       TO_CHAR(SYSDATE, ''DDMMYYYYHH24MISS'') ||--DT_HORA_ARQ, --CAMPOS 0.23 e 0.24                       ' + #13#10 +
          '       LPAD(' + Quotedstr(sNSA) + ', 6, ''0'') ||                                                         ' + #13#10 +
          '       LPAD(' + Quotedstr(FCdsMontaArquivo.FieldByName('VERSAO_LEIAUTE_ARQ').asString) + ', 3, ''0'') ||  ' + #13#10 +
          '       LPAD(' + Quotedstr(FCdsMontaArquivo.FieldByName('DENSIDADE').asString) + ', 5, ''0'') ||           ' + #13#10 +
          '       RPAD('' '', 20) ||--RESERVADO_BANCO,                                                               ' + #13#10 +
          '       RPAD('' '', 20) ||--RESERVADO_EMPRESA,                                                             ' + #13#10 +
          '       RPAD('' '', 11) ||--USO_FEBRA,                                                                     ' + #13#10 +
          '       RPAD('' '', 3) ||--ID_COBRANCA,                                                                    ' + #13#10 +
          '       LPAD(''0'', 3, ''0'') ||--VANS,                                                                    ' + #13#10 +
          '       RPAD('' '', 2) ||--TIP_SERVICO,                                                                    ' + #13#10 +
          '       RPAD('' '', 10) --SEM_PAPEL                                                                        ' + #13#10 +
          '        AS LINHACABECARQ                                                                                  ' + #13#10 +
          ' FROM PESSOA P                                                                                            ' + #13#10 +
          ' JOIN PORTADORFORMA PO ON PO.IDPESSOA = P.IDPESSOA                                                        ' + #13#10 +
          ' JOIN PORTADORCONTA PC ON PC.CODPORTADOR = PO.CODPORTADOR                                                 ' + #13#10 +
          ' JOIN AGENCIABANCARIA AG ON AG.IDPESSOA = PC.IDAGENCIA                                                    ' + #13#10 +
          ' JOIN BANCO BA ON BA.IDPESSOA = AG.IDBANCO                                                                ' + #13#10 +
          ' JOIN CONTABANCARIA CO ON CO.IDAGENCIA = AG.IDPESSOA AND CO.IDPESSOA = P.IDPESSOA                         ' + #13#10 +
          'WHERE PO.CODPORTFORMA = ' + IntToStr(iCodPortForma)                                                         + #13#10 +
          '      AND PO.RECPAG = ''P''';                                                                               
  Result := GetDataPacket(sSQL);
end;

procedure TCtrlParamArqPagto.GravaLinha(sArquivo, sLinha: string);
begin
//Cássio Rovaroto - SIG nº 101591 - Início
  if sLinha <> '' Then
  begin
//    if Impersonate then
//    begin
      AssignFile(ArquivoEnvioCEF, sArquivo);
      Append(ArquivoEnvioCEF);
      Write(ArquivoEnvioCEF, sLinha);
      WriteLn(ArquivoEnvioCEF);
      CloseFile(ArquivoEnvioCEF);

//      RevertToSelf;
//    end;
  end;
//Cássio Rovaroto - SIG nº 101591 - Início
end;

function TCtrlParamArqPagto.SelecionaDadosCabecLote(pCodPortForma,
  pSeqLote, pFormaLanc, pTipCompromisso, pTipoServico: String): Olevariant;
var sSQL : string;
begin
  {
  NOTA 2: TIPO DE SERVIÇO
  '00' = Optantes                                   '60' = Pagamento Despesas Viajante em Trânsito
  '05' = Débitos/Recebimentos                       '70' = Pagamento Autorizado
  '10' = Pagamento de Dividendos                    '75' = Pagamento Credenciados
  '20' = Pagamento Fornecedor                       '80' = Pagamento Representantes/Vendedores Autorizados
  '30' = Pagamento Salários                         '90' = Pagamento Benefícios
  '50' = Pagamento Sinistros Segurados              '98' = Pagamento Diversos

  NOTA 3: FORMA DE LANÇAMENTO
  '01' = Crédito em CC                              '02' = Cheque pagamento/administrativo
  '03' = DOC                                        '05' = Crédito em Conta Poupança
  '10' = OP a disposição                            '11' = Pagamento de contas e tributos com código de barras
  '30' = Liquidação de títulos do próprio banco
  '31' = Pagamento de Títulos de outros Bancos      '41' = TED,
  '43' = TED mesma titularidade                     '50' = Débito em conta corrente - recebimento

  NOTA 4: TIPO DE COMPROMISSO
  '01' = Pagamento à Fornecedor                     '06' = Salário Ampliação de Base
  '02' = Pagamento de Salários                      '11' = Débito em Conta
  '03' = Autopagamento
  }

  sSQL := 'SELECT ' + Quotedstr(FCdsMontaArquivo.FieldByName('NUMBANCO').asString) + ' || --BANCO,                       ' + #13#10;
  sSQL := sSQL + 'LPAD(' + Quotedstr(pSeqLote) + ', 4, ''0'') ||                                                         ' + #13#10 +
    '       ''1'' ||--REG,                                                                                               ' + #13#10 ;
  sSQL := sSQL + Quotedstr(FCdsMontaArquivo.FieldByName('TIPO_OPERACAO').asString) + '||                                 ' + #13#10 +
    '       LPAD(' + Quotedstr(pTipoServico) + ', 2, ''0'') ||--NOTA2                                                    ' + #13#10 +
    '       RPAD(' + Quotedstr(pFormaLanc) + ', 2, ''0'') ||                                                             ' + #13#10 +
    '       LPAD(' + Quotedstr(FCdsMontaArquivo.FieldByName('VERSAO_LEIAUTE_LOTE').asString) + ', 3, ''0'') ||           ' + #13#10 +
    '       '' '' ||--FILLER,                                                                                            ' + #13#10 +
    '       DECODE(LENGTH(REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D'')), 11, ''1'', 14, ''2'', ''0'') ||--TIP_INSC,            ' + #13#10 +
    '       LPAD(REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D''), 14, ''0'') ||--NUM_INSC,                                        ' + #13#10 +
    '       LPAD(REGEXP_REPLACE(PO.NUMEMPRESABANCO, ''\D''), 6, ''0'') ||--COD_CONV,                                     ' + #13#10 +
    '       LPAD(' + Quotedstr(pTipCompromisso) + ', 2, ''0'') || -- NOTA 4                                              ' + #13#10 +
    '       LPAD(' + Quotedstr(FCdsMontaArquivo.FieldByName('COD_COMPROMISSO').asString) + ', 4, ''0'') ||               ' + #13#10 +
    '       RPAD(' + Quotedstr(FCdsMontaArquivo.FieldByName('PARAM_TRANSMISSAO').asString) + ', 2, ''0'') ||             ' + #13#10 +
    '       RPAD('' '', 6) ||--FILLER,                                                                                   ' + #13#10 +
    '       CASE                                                                                                         ' + #13#10 +
    '         WHEN INSTR(BA.MASCARAAGENCIA, ''-'') = 0 THEN                                                              ' + #13#10 +
    '           LPAD(NVL(REGEXP_REPLACE(AG.NUMAGENCIA, ''\W''), ''0''), 5, ''0'')                                        ' + #13#10 +
    '         ELSE                                                                                                       ' + #13#10 +
    '           LPAD(NVL(SUBSTR(REGEXP_REPLACE(AG.NUMAGENCIA, ''\W''), 0, INSTR(TRIM(BA.MASCARAAGENCIA), ''-'')-1), 0), 5, ''0'')  ' + #13#10 +
    '       END ||--AGENCIA,                                                                                             ' + #13#10 +
    '       ''9'' ||--DV_AG,                                                                                             ' + #13#10 +
    '       CASE                                                                                                         ' + #13#10 +
    '         WHEN INSTR(BA.MASCARACC, ''-'') = 0 THEN                                                                   ' + #13#10 +
    '           LPAD(NVL(REGEXP_REPLACE(CO.CONTACORRENTE, ''\W''), ''0''), 12, ''0'')                                    ' + #13#10 +
    '         ELSE                                                                                                       ' + #13#10 +
    '           LPAD(NVL(SUBSTR(REGEXP_REPLACE(CO.CONTACORRENTE, ''\W''), 0, INSTR(TRIM(BA.MASCARACC), ''-'')-1), ''0''), 12, ''0'')  ' + #13#10 +
    '       END ||--CONTA,                                                                                               ' + #13#10 +
    '       CASE                                                                                                         ' + #13#10 +
    '         WHEN INSTR(BA.MASCARACC, ''-'') = 0 THEN                                                                   ' + #13#10 +
    '           '' ''                                                                                                    ' + #13#10 +
    '         ELSE                                                                                                       ' + #13#10 +
    '           NVL(SUBSTR(REGEXP_REPLACE(CO.CONTACORRENTE, ''\W''), INSTR(TRIM(BA.MASCARACC), ''-''), 1), '' '')        ' + #13#10 +
    '       END ||--DV_CC,                                                                                               ' + #13#10 +
    '       '' '' ||--DV_AG_CC,                                                                                          ' + #13#10 +
    '       RPAD(UPPER(TRANSLATE(TRIM(P.NOME) ||'' - ''|| TRIM(P.RAZAOSOCIAL), ''ÁÇÉÍÓÚÀÈÌÒÙÂÊÎÔÛÃÕËÜáçéíóúàèìòùâêîôûãõëü'',''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu'')), 30) ||--NOME_EMPRESA,  ' + #13#10 +
    '       RPAD('' '', 40) ||--MSG_AVISO1,                                                                              ' + #13#10 +
    '       RPAD(NVL(TRIM(ED.LOGRADOURO), '' ''), 30) ||--LOGRADOURO,                                                    ' + #13#10 +
    '       LPAD(NVL(TRIM(ED.NUMERO), ''0''), 5, ''0'') ||--NUM_LOCAL,                                                   ' + #13#10 +
    '       RPAD(NVL(TRIM(ED.COMPLEMENTO), '' ''), 15) ||--COMPL_LOGRADOURO,                                             ' + #13#10 +
    '       RPAD(NVL(TRIM(C.NOME), '' ''), 20) ||--CIDADE,                                                               ' + #13#10 +
    '       LPAD(NVL(TRIM(ED.CEP), ''0''), 5, ''0'') ||--CEP,                                                            ' + #13#10 +
    '       RPAD(NVL(SUBSTR(TRIM(ED.CEP), 6, 3), '' ''), 3) ||--COMPL_CEP,                                               ' + #13#10 +
    '       RPAD(NVL(TRIM(C.UF), '' ''), 2) ||--UF,                                                                      ' + #13#10 +
    '       RPAD('' '', 8) ||--USO_FEBRA,                                                                                ' + #13#10 +
    '       RPAD('' '', 10) /*OCORRENCIAS*/ AS LINHACABECLOTE                                                            ' + #13#10 +
    '  FROM PESSOA P                                                                                                     ' + #13#10 +
    '  JOIN PORTADORFORMA PO ON PO.IDPESSOA = P.IDPESSOA                                                                 ' + #13#10 +
    '  JOIN PORTADORCONTA PC ON PC.CODPORTADOR = PO.CODPORTADOR                                                          ' + #13#10 +
    '  JOIN AGENCIABANCARIA AG ON AG.IDPESSOA = PC.IDAGENCIA                                                             ' + #13#10 +
    '  JOIN BANCO BA ON BA.IDPESSOA = AG.IDBANCO                                                                         ' + #13#10 +
    '  JOIN CONTABANCARIA CO ON CO.IDAGENCIA = AG.IDPESSOA AND CO.IDPESSOA = P.IDPESSOA                                  ' + #13#10 +
    '  LEFT JOIN (SELECT MAX(E.IDENDERECO) MAX_ID,                                                                       ' + #13#10 +
    '                    E.IDPESSOA                                                                                      ' + #13#10 +
    '             FROM ENDPESS E                                                                                         ' + #13#10 +
    '             GROUP BY E.IDPESSOA) MAX_END ON P.IDPESSOA = MAX_END.IDPESSOA                                          ' + #13#10 +
    '  LEFT JOIN ENDPESS ED ON ED.IDENDERECO = MAX_END.MAX_ID                                                            ' + #13#10 +
    '  LEFT JOIN CIDADES C ON C.IDCIDADES = ED.IDCIDADES                                                                 ' + #13#10 +
    ' WHERE PO.CODPORTFORMA = ' + pCodPortForma                                                                            + #13#10 +
    '   AND PO.RECPAG = ''P''                                                                                            ';

  Result := GetDataPacket(sSQL);
end;

procedure TCtrlParamArqPagto.AlimentaQryDocTxtLeiaute240;
  var
  sLogradouro, sNumero, sComplemento, sBairro, sCidade, sCodestado, sCEP: string;
begin
  if (FCdsPrincipal.FieldByName('LIQUIDO').asFloat = 0) or
     (FCdsPrincipal.FieldByName('CONTA').asString = '') then
    exit;

  if not FConvFloat then
  begin
    _Cds.Data := FCtrlPessoaFuncionario.ListAgenciaSalario(FCdsPrincipal.FieldByName('IDPESSOA').asFloat);
    if not(_Cds.IsEmpty) then
    begin
      FUltPortForma := _Cds.FieldByName('CODPORTFORMA').asInteger;
      if (FUltPortForma = 0) then
        FUltPortForma := FPortadorFormaPadrao;
  end;
  end
  else
    FUltPortForma := FCdsPrincipal.FieldByName('CODPORTFORMA').AsInteger;

  if (FLstPortForma.IndexOf(IntToStr(FUltPortForma)) = -1) then
    FLstPortForma.Add(IntToStr(FUltPortForma));

  FCdsPortadorForma.Locate('CODPORTFORMA', FUltPortForma, []);

  _Cds.Data := FCtrlListTerceirosRH.ListEndereco(FCdsPrincipal.FieldByName('IDPESSOA').asInteger);

  if not(_Cds.IsEmpty) then
  begin
    sLogradouro :=  RemoveCaracterEspecial(_Cds.FieldByName('LOGRADOURO').asString, true);
    sNumero := RemoveCaracterEspecial(_Cds.FieldByName('NUMERO').asString, true);
    sComplemento := RemoveCaracterEspecial(_Cds.FieldByName('COMPLEMENTO').asString, true);
    sBairro := RemoveCaracterEspecial(_Cds.FieldByName('BAIRRO').asString, true);
    sCidade := RemoveCaracterEspecial(_Cds.FieldByName('CIDADE').asString, true);
    sCodEstado := _Cds.FieldByName('CODESTADO').asString;
    sCEP := _Cds.FieldByName('CEP').asString;
  end
  else
  begin
    sLogradouro := '';
    sNumero := '';
    sComplemento := '';
    sBairro := '';
    sCidade := '';
    sCodEstado := '';
    sCEP := '';
  end;


  with (FCdsDocTxt) do
  begin
    Insert;
    FieldByName('IDPESSOA').AsInteger := FCdsPrincipal.FieldByName('IDPESSOA').AsInteger;
    {FieldByName('NOME').AsString := FCdsPrincipal.FieldByName('EMPREGADO').AsString;
    FieldByName('NODOCUMENTO').AsString := FCdsPrincipal.FieldByName('CPF').AsString;
    FieldByName('NUMBANCO').AsString := FCdsPrincipal.FieldByName('NUMBANCO').AsString;
    FieldByName('NUMAGENCIA').AsString := FCdsPrincipal.FieldByName('CODAGENCIA').AsString;
    FieldByName('NUMOPERACAO').AsString := copy(FCdsPrincipal.FieldByName('CONTA').AsString, 1, 3);
    FieldByName('NUMCONTA').AsString := copy(FCdsPrincipal.FieldByName('CONTA').AsString, 4, length(FCdsPrincipal.FieldByName('CONTA').AsString) -3);
    FieldByName('TIPOCONTA').AsString := '0'; // SEM CONTA PARA TED
    FieldByName('VALOR').AsFloat := FCdsPrincipal.FieldByName('LIQUIDO').AsFloat;
    FieldByName('FLGIMPORTADO').AsString := 'N';
    FieldByName('CODFORMA').AsInteger := FCdsPrincipal.FieldByName('CODFORMA').AsInteger;
    FieldByName('CODPORTFORMA').AsInteger := FCdsPrincipal.FieldByName('CODPORTFORMA').AsInteger;
    FieldByName('IDMOTIVO').AsInteger := FCdsPrincipal.FieldByName('IDMOTIVO').AsInteger;
    FieldByName('DATAPROGRAMADA').AsDateTime := FCdsPrincipal.FieldByName('DATAPAGAMENTO').AsDateTime;}
    FieldByName('NUM_BANCO').asString := '104';
    FieldByName('COD_REG').asString := '3';
    FieldByName('SEG').asString := 'A';
    FieldByName('TIP_MOV').asString := '0';
    FieldByName('COD_INST').asString := '00';
    FieldByName('COD_BAN_D').asString := FCdsPrincipal.FieldByName('NUMBANCO').asString;
    FieldByName('COD_AGE_D').asString := copy(FCdsPrincipal.FieldByName('CODAGENCIA').asString, 1, 4);
    FieldByName('DV_AGE_D').asString := '9';
    FieldByName('CC_D').asString := FCdsPrincipal.FieldByName('CONTA_SALARIO').asString;
    FieldByName('DV_CC_D').asString := FCdsPrincipal.FieldByName('DV_CONTA_SALARIO').asString;
    FieldByName('DV_AGE_CC_D').asString := ' ';
    FieldByName('NOME').asString := Copy(FCdsPrincipal.FieldByName('EMPREGADO').asString, 1, 40);
    FieldByName('NUM_DOC').asString := FCdsPrincipal.FieldByName('CPF').asString;
    FieldByName('FILLER').asString := '             ';
    FieldByName('TP_CONT').asString := '0';
    FieldByName('DT_VENC').asString := FormatDateTime('ddmmyyyy', FCdsPrincipal.FieldByName('DATAPAGAMENTO').AsDateTime);
    FieldByName('TP_MOE').asString :=  'BRL';
    FieldByName('VALOR').asString := StringReplace(FloatToStr(FCdsPrincipal.FieldByName('LIQUIDO').AsFloat), '.', '',[rfReplaceAll, rfIgnoreCase]);
    FieldByName('NUM_DOC_BAN').asString := '000000000';
    FieldByName('QTD_PAR').asString := '01';
    FieldByName('IND_BLOQ').asString := 'N';
    FieldByName('IND_FORMA_PAR').asString := '1';
    FieldByName('PER_VENC').asString := FormatDateTime('dd', FCdsPrincipal.FieldByName('DATAPAGAMENTO').AsDateTime);
    FieldByName('NUM_PAR').asString := '00';
    FieldByName('DT_EFET').asString := '00000000';
    FieldByName('VLR_REAL').asString := '0000000000000';
    FieldByName('INF').asString := '                                        ';
    FieldByName('USO_FEBRABAN').asString := '          ';
    FieldByName('EMITE_AVISO').asString :=  '0';
    FieldByName('OCORRENCIAS').asString := '          ';
    FieldByName('TIP_INSCR').asString := '1';
    FieldByName('NUM_IDENT').asString := FCdsPrincipal.FieldByName('CPF').asString;
    FieldByName('LOGRADOURO').asString := Copy(sLogradouro,1,40);
    FieldByName('NUMERO').asString := Copy(sNumero, 1, 9);
    FieldByName('COMPL').asString :=  Copy(sComplemento, 1, 15);
    FieldByName('BAIRRO').asString := Copy(sBairro, 1, 15);
    FieldByName('CIDADE').asString := Copy(sCidade, 1, 20);
    FieldByName('CEP').asString :=  Copy(sCEP, 1, 5);
    FieldByName('COMPL_CEP').asString := Copy(sCEP, 6, 3);
    FieldByName('UF').asString := Copy(sCodEstado, 1, 2);
    FieldByName('VL_DOC').asString := '0000000000000';
    FieldByName('VL_ABAT').asString := '0000000000000';
    FieldByName('VL_DESC').asString := '0000000000000';
    FieldByName('VL_MORA').asString := '0000000000000';
    FieldByName('VL_MULTA').asString := '0000000000000';
    FieldByName('CODPORTFORMA').AsInteger := FUltPortForma;
    FieldByName('CODFORMA').AsInteger := FCdsPrincipal.FieldByName('CODFORMA').asInteger;
    FieldByName('IDMOTIVO').AsInteger := FCdsPrincipal.FieldByName('IDMOTIVO').AsInteger;
    Post;
  end;
end;

procedure TCtrlParamArqPagto.AbrirQueryDocTxtLeiaute240;
begin
  with (FSQL) do
  begin
    Clear;
    Add('SELECT 0 AS IDPESSOA,                                                                              ');
    Add('       ''   '' AS NUM_BANCO,                                                                       ');
    Add('       '' '' AS COD_REG,                                                                           ');
    Add('       '' '' AS SEG,                                                                               ');
    Add('       '' '' AS TIP_MOV,                                                                           ');
    Add('       ''  '' AS COD_INST,                                                                         ');
    Add('       ''   '' AS COD_BAN_D,                                                                       ');
    Add('       ''     '' AS COD_AGE_D,                                                                     ');
    Add('       '' ''AS DV_AGE_D,                                                                           ');
    Add('       ''            '' AS CC_D,                                                                   ');
    Add('       '' '' AS DV_CC_D,                                                                           ');
    Add('       '' '' AS DV_AGE_CC_D,                                                                       ');
    Add('       ''                              '' AS NOME,                                                 ');
    Add('       ''      '' AS NUM_DOC,                                                                      ');
    Add('       ''             '' AS FILLER,                                                                ');
    Add('       '' '' AS TP_CONT,                                                                           ');
    Add('       ''        '' AS DT_VENC,                                                                    ');
    Add('       ''   '' AS TP_MOE,                                                                          ');
    Add('       ''                '' AS VALOR,                                                              ');
    Add('       ''         '' AS NUM_DOC_BAN,                                                               ');
    Add('       ''  '' AS QTD_PAR,                                                                          ');
    Add('       '' '' AS IND_BLOQ,                                                                          ');
    Add('       '' '' AS IND_FORMA_PAR,                                                                     ');
    Add('       ''  '' AS PER_VENC,                                                                         ');
    Add('       ''  '' AS NUM_PAR,                                                                          ');
    Add('       ''        '' AS DT_EFET,                                                                    ');
    Add('       ''                '' AS VLR_REAL,                                                           ');
    Add('       ''                                       '' AS INF,                                         ');
    Add('       ''  '' AS USO_FEBRABAN,                                                                     ');
    Add('       '' '' AS EMITE_AVISO,                                                                       ');
    Add('       ''          '' AS OCORRENCIAS,                                                              ');
    Add('       '' '' AS TIP_INSCR,                                                                         ');
    Add('       ''              '' AS NUM_IDENT,                                                            ');
    Add('       ''                              '' AS LOGRADOURO,                                           ');
    Add('       ''     '' AS NUMERO,                                                                        ');
    Add('       ''                '' AS COMPL,                                                              ');
    Add('       ''                '' AS BAIRRO,                                                             ');
    Add('       ''                     '' AS CIDADE,                                                        ');
    Add('       ''     '' AS CEP,                                                                           ');
    Add('       ''   '' AS COMPL_CEP,                                                                       ');
    Add('       ''  '' AS UF,                                                                               ');
    Add('       ''                '' AS VL_DOC,                                                             ');
    Add('       ''                '' AS VL_ABAT,                                                            ');
    Add('       ''                '' AS VL_DESC,                                                            ');
    Add('       ''                '' AS VL_MORA,                                                            ');
    Add('       ''                '' AS VL_MULTA,                                                           ');
    Add('       0 AS CODPORTFORMA,                                                                          ');
    Add('       0 AS CODFORMA,                                                                              ');
    Add('       0 AS IDMOTIVO                                                                               ');
    Add('  FROM DUAL                                                                                        ');
    Add(' WHERE (1 = 2)                                                                                     ');
  end;
  FCdsDocTxt.Data := GetDataPacket(FSQL);
end;

function TCtrlParamArqPagto.MontaLinhaA(pNSR, pSeqLote, pFinalidadeDoc: string): string;
var
  sLinha: string;
begin
  sLinha := FCdsDocTxt.FieldByName('NUM_BANCO').AsString +                                  // CÓDIGO DO BANCO
            ZeroEsquerda(4, pSeqLote) +                                                     // LOTE DE SERVIÇO
            FCdsDocTxt.FieldByName('COD_REG').AsString +                                    // CÓDIGO DE REGISTRO
            ZeroEsquerda(5, pNSR) +                                                         // NSR
            AjustaTamCampo(FCdsDocTxt.FieldByName('SEG').AsString, 1, ' ')+                 // CÓDIGO SEGMENTO
            FCdsDocTxt.FieldByName('TIP_MOV').AsString +                                    // TIPO MOVIMENTO
            FCdsDocTxt.FieldByName('COD_INST').AsString +                                   // CÓD. INSTRUÇÃO MOVIMENTO
            '000' +                                                                         // CÂMARA DE COMPENSAÇÃO
            ZeroEsquerda(3, FCdsDocTxt.FieldByName('COD_BAN_D').AsString) +                 // CÓD. BANCO DESTINO
            Zeroesquerda(5, FCdsDocTxt.FieldByName('COD_AGE_D').AsString) +                 // CÓD AGÊNCIA DESTINO
            AjustaTamCampo(FCdsDocTxt.FieldByName('DV_AGE_D').asString, 1, ' ') +           // DV AGÊNCIA DESTINO
            ZeroEsquerda(12, FCdsDocTxt.FieldByName('CC_D').asString) +                     // CONTA CORRENTE DESTINO
            AjustaTamCampo(FCdsDocTxt.FieldByName('DV_CC_D').asString, 1, ' ')+             // DV CONTA DESTINO
            AjustaTamCampo(FCdsDocTxt.FieldByName('DV_AGE_CC_D').asString, 1, ' ') +        // DV AGÊNCIA/CONTA DESTINO
            AjustaTamCampo(Copy(FCdsDocTxt.FieldByName('NOME').asString, 1, 30), 30, ' ') + // NOME DO TERCEIRO
            ZeroEsquerda(6, pNSR) +                                                         // NÚM. DOCUMENTO ATRIBUÍDO PELA EMPRESA
            AjustaTamCampo(FCdsDocTxt.FieldByName('FILLER').asString, 13, ' ') +            // FILLER
            AjustaTamCampo(FCdsDocTxt.FieldByName('TP_CONT').asString, 1, ' ') +            // TIPO CONTA - FINALIDADE TED
            FCdsDocTxt.FieldByName('DT_VENC').asString +                                    // DATA VENCIMENTO
            AjustaTamCampo(FCdsDocTxt.FieldByName('TP_MOE').asString, 3, ' ') +             // TIPO DE MOEDA
            FormatarValor(14, '0') +                                                        // QUANTIDADE DE MOEDA
            FormatarValor(16, FCdsDocTxt.FieldByName('VALOR').asString) +                   // VALOR LANÇAMENTO
            ZeroEsquerda(9, FCdsDocTxt.FieldByName('NUM_DOC_BAN').asString) +               // NÚMERO DOCUMENTO BANCO
            AjustaTamCampo(FCdsDocTxt.FieldByName('FILLER').asString, 3, ' ') +             // FILLER
            ZeroEsquerda(2, FCdsDocTxt.FieldByName('QTD_PAR').asString) +                   // QUANTIDADE DE PARCELAS
            AjustaTamCampo(FCdsDocTxt.FieldByName('IND_BLOQ').asString, 1, ' ') +           // INDICADOR DE BLOQUEIO
            FCdsDocTxt.FieldByName('IND_FORMA_PAR').asString +                              // IND. FORMA PARCELAMENTO
            AjustaTamCampo(FCdsDocTxt.FieldByName('PER_VENC').asString, 2, ' ') +           // PERÍODO/DIA DE VENCIMENTO
            FCdsDocTxt.FieldByName('NUM_PAR').asString +                                    // NÚMERO PARCELA
            FCdsDocTxt.FieldByName('DT_EFET').asString +                                    // DATA DA EFETIVAÇÃO
            FormatarValor(13, FCdsDocTxt.FieldByName('VLR_REAL').asString) +                // VALOR REAL EFETIVADO
            AjustaTamCampo(FCdsDocTxt.FieldByName('INF').asString, 40, ' ') +               // INFORMAÇÃO 2
            ZeroEsquerda(2, pFinalidadeDoc) +                                               // FINALIDADE DOC
            AjustaTamCampo(FCdsDocTxt.FieldByName('USO_FEBRABAN').asString, 10, ' ') +      // USO FEBRABAN
            FCdsDocTxt.FieldByName('EMITE_AVISO').asString +                                // AVISO AO FAVORECIDO
            AjustaTamCampo(FCdsDocTxt.FieldByName('OCORRENCIAS').asString, 10, ' ');        // OCORRÊNCIAS

  
  Result := sLinha;
end;

function TCtrlParamArqPagto.MontaLinhaB(pNSR, pSeqLote: string): string;
var
  sLinha : string;

begin
  sLinha := ZeroEsquerda(3, FCdsDocTxt.FieldByName('NUM_BANCO').AsString) +                       // CÓDIGO DO BANCO
            ZeroEsquerda(4, pSeqLote) +                                                           // LOTE DE SERVIÇO
            FCdsDocTxt.FieldByName('COD_REG').AsString +                                          // CÓDIGO DO REGISTRO
            ZeroEsquerda(5, pNSR) +                                                               // NSR
            'B' +                                                                                 // CÓDIGO SEGMENTO
            AjustaTamCampo('', 3, ' ') +                                                          // USO FEBRABAN
            '1' +                                                                                 // TIPO INSCRIÇÃO
            ZeroEsquerda(14, FCdsDocTxt.FieldByName('NUM_IDENT').asString) +                      // NÚMERO DE INSCRIÇÃO
            AjustaTamCampo(Copy(FCdsDocTxt.FieldByName('LOGRADOURO').asString, 1, 30), 30, ' ') + // LOGRADOURO
            ZeroEsquerda(5, FCdsDocTxt.FieldByName('NUMERO').asString) +                          // NÚMERO NO LOCAL
            AjustaTamCampo(Copy(FCdsDocTxt.FieldByName('COMPL').asString, 1, 15), 15, ' ') +      // COMPLEMENTO
            AjustaTamCampo(Copy(FCdsDocTxt.FieldByName('BAIRRO').asString, 1, 15), 15, ' ') +     // BAIRRO
            AjustaTamCampo(Copy(FCdsDocTxt.FieldByName('CIDADE').asString, 1, 20), 20, ' ') +     // CIDADE
            ZeroEsquerda(5, FCdsDocTxt.FieldByName('CEP').asString) +                             // CEP
  //Cássio Rovaroto  - SIG nº 101591 - Início
  //          AjustaTamCampo(Copy(FCdsDocTxt.FieldByName('COMPL_CEP').asString, 1, 3), 3, ' ');     // COMPLEMENTO CEP
  //if FCdsDocTxt.FieldByName('UF').IsNull then
    //sLinha := sLinha + AjustaTamCampo('', 2, ' ')
  //else
    //sLinha := sLinha + FCdsDocTxt.FieldByName('UF').asString;                                     // UF DO ESTADO

  //sLinha := sLinha + FCdsDocTxt.FieldByName('DT_VENC').asString +                                 // DATA VENCIMENTO
            AjustaTamCampo(Copy(FCdsDocTxt.FieldByName('COMPL_CEP').asString, 1, 3), 3, ' ') +    // COMPLEMENTO CEP
            AjustaTamCampo(Copy(FCdsDocTxt.FieldByName('UF').asString, 1,2), 2, ' ') +            // UF DO ESTADO
            FCdsDocTxt.FieldByName('DT_VENC').asString +                                 // DATA VENCIMENTO
  //Cássio Rovaroto  - SIG nº 101591 - Fim
            FormatarValor(13, FCdsDocTxt.FieldByName('VL_DOC').asString) +                        // VALOR DO DOCUMENTO
            FormatarValor(13, FCdsDocTxt.FieldByName('VL_ABAT').asString) +                       // VALOR DO ABATIMENTO
            FormatarValor(13, FCdsDocTxt.FieldByName('VL_DESC').asString) +                       // VALOR DO DESCONTO
            FormatarValor(13, FCdsDocTxt.FieldByName('VL_MORA').asString) +                       // VALOR DA MORA
            FormatarValor(13, FCdsDocTxt.FieldByName('VL_MULTA').asString) +                      // VALOR DA MULTA
            AjustaTamCampo('', 15, ' ') +                                                         // CÓD. DOCUMENTO FAVORECIDO
            AjustaTamCampo('', 15, ' ');                                                          // USO DA FEBRABAN

  Result := sLinha;
end;

function TCtrlParamArqPagto.SelecionaDadosRodapeLote(pSeqLote,
  pQtdRegsLote, pVlrTotalLote: String): OleVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT ' + Quotedstr(FCdsMontaArquivo.FieldByName('NUMBANCO').asString) + '|| /*BANCO,*/                  ' + #13#10 +
    '       LPAD(' + Quotedstr(pSeqLote) + ', 4, ''0'') ||                                                           ' + #13#10 +
    '       ''5'' ||/*REG,*/                                                                                         ' + #13#10 +
    '       RPAD('' '', 9) ||/*USO_FEBRA,*/                                                                          ' + #13#10 +
    '       LPAD(' + Quotedstr(pQtdRegsLote) + ', 6, ''0'') ||                                                       ' + #13#10 +
    '       LPAD(' + Quotedstr(pVlrTotalLote) + ', 18, ''0'') ||                                                     ' + #13#10 +
    '       LPAD(''0'', 18, ''0'') ||/*SUM_QTD_MOEDA,*/                                                              ' + #13#10 +
    '       LPAD(''0'', 6, ''0'') ||/*N_AVISO_DEBITO,*/                                                              ' + #13#10 +
    '       RPAD('' '', 165) ||/*USO_FEBRA2,*/                                                                       ' + #13#10 +
    '       RPAD('' '', 10) /*OCORRENCIAS*/ AS LINHARODAPELOTE                                                       ' + #13#10 +
    '  FROM DUAL ';
  Result := GetDataPacket(sSQL);
end;

function TCtrlParamArqPagto.FormatarValor(NumCasas: integer;
  Valor: string): string;
var
 x, y, flag : integer;
 Resultado, left, right : string;
begin
  left      := '';
  right     := '';
  Resultado := '';
  flag := 0;
  for x := 1 to length(Valor) do
    Begin
      if Valor[x] = ',' then
        Begin
          for y := x + 1 to length(valor) do
           right := right + Valor[y];
          flag  := 1;
        end
      else if flag = 0 then
        left  := Left + valor[x];
    end;

    result := ZeroEsquerda((NumCasas - 2), left) + ZeroDireita(2, copy(right, 1, 2))

end;
          
function TCtrlParamArqPagto.ZeroEsquerda(TamanhoTexto: Integer;
  Texto: String): String;
var
  numzeros : integer;
  f        : integer;
  zeros    : string;
begin
  zeros := '';
  numzeros := tamanhoTexto - length(texto);

  for f := 1 to numzeros do
    zeros := zeros + '0';

  result := zeros + texto;
end;

function TCtrlParamArqPagto.ZeroDireita(TamanhoTexto: integer;
  texto: String): string;
var
  numzeros : integer;
  f        : integer;
  zeros    : string;
begin
  zeros := '';
  numzeros := tamanhoTexto - length(texto);

  for f := 1 to numzeros do
    zeros := zeros + '0';

  result := texto + zeros;
end;
function TCtrlParamArqPagto.AjustaTamCampo(sCampo: string; iTam: integer;
  sChar: string): string;
begin
  while Length(sCampo) < iTam do
  begin
    sCampo := sCampo + sChar;
  end;
  Result := Copy(sCampo, 1, iTam);
end;

function TCtrlParamArqPagto.SelecionaDadosRodapeArq(pQtdLotesArq,
  pQtdRegsArq: String): Olevariant;
var
  sSQL: String;
begin
  sSQL := 'SELECT ' + Quotedstr(FCdsMontaArquivo.FieldByName('NUMBANCO').asString) + '|| /*BANCO,*/ ' + #13#10 +
    '       LPAD(''9'', 4, ''9'') ||/*LOTE,*/                                                       ' + #13#10 +
    '       ''9'' ||/*REG,*/                                                                        ' + #13#10 +
    '       RPAD('' '', 9) ||/*USO_FEBRA,*/                                                         ' + #13#10 +
    '       LPAD(' + Quotedstr(pQtdLotesArq) +', 6, ''0'') ||                                       ' + #13#10 +
    '       LPAD(' + Quotedstr(pQtdRegsArq) + ', 6, ''0'') ||                                       ' + #13#10 +
    '       LPAD(''0'', 6, ''0'') || /*QTD_CONTAS_CONCILIACAO,*/                                    ' + #13#10 +
    '       RPAD('' '', 205) /*USO_FEBRA2*/ AS LINHARODAPEARQ                                       ' + #13#10 +
    'FROM DUAL ';

  Result := GetDataPacket(sSQL);
end;


procedure TCtrlParamArqPagto.SaveToCSV(DataSet: TDataSet; FileName, sHeader: string);
var
  List: TStringList;
  S: String;
  I: Integer;
  Delimiter: Char;
  Enclosure: Char;

  function EscapeString(s: string): string;
  var
    i: Integer;
  begin
    Result := StringReplace(s,Enclosure,Enclosure+Enclosure,[rfReplaceAll]);
    if (Pos(Delimiter,s) > 0) OR (Pos(Enclosure,s) > 0) then  // Comment this line for enclosure in every fields
        Result := Enclosure+Result+Enclosure;
  end;
  function RPad(S: string; Ch: Char; Len: Integer): string;
  var   RestLen: Integer;
  begin   Result  := S;
    RestLen := Len - Length(s);
    if RestLen < 1 then Exit;
    Result := S + StringOfChar(Ch, RestLen);
  end;

  procedure AddHeader(sHeader: string);
  var
    I: Integer;
  begin
    S := sHeader;
    List.Add(S);
  end;

  procedure AddRecord;
  var
    I: Integer;
  begin
    S := '';
    for I := 0 to DataSet.FieldCount - 1 do begin
      if S > '' then
        S := S + Delimiter;

     if (I = 0) then
      S := S +'="'+EscapeString(DataSet.Fields[I].AsString)+'"'
     else
      S := S + EscapeString(DataSet.Fields[I].AsString);

    end;
    List.Add(S);
  end;
begin
  Delimiter := ';';
  Enclosure := '"';
  List := TStringList.Create;

  try
    AddHeader(sHeader);
    DataSet.DisableControls;
    DataSet.First;
    while not DataSet.Eof do begin
      AddRecord;
      DataSet.Next;
    end;
  finally
    List.SaveToFile(FileName);
    DataSet.First;
    DataSet.EnableControls;
    List.Free;
  end;
end;

function TCtrlParamArqPagto.GetNomePlanoPrev(
  pIdPlanoPrev: integer): String;
var
  cdsAux: TCMClientDataSet;
begin
  cdsAux := TCMClientDataSet.Create(nil);
  Result := '';
  try
    cdsAux.Data := GetDataPacket('SELECT NOME FROM PLANPREVCONTABIL WHERE IDPLANOPREV = ' + IntToStr(pIdPlanoPrev));

    Result := cdsAux.FieldByName('NOME').asString;
  finally
    FreeAndNil(cdsAux);
  end;
end;

function TCtrlParamArqPagto.RemoveCaracterEspecial(pTexto: String; pRemoveExtra: boolean): String;
const
  //Lista de caracteres especiais
  xCarEsp: array[1..38] of String = ('á', 'à', 'ã', 'â', 'ä','Á', 'À', 'Ã', 'Â', 'Ä',
                                     'é', 'è','É', 'È','í', 'ì','Í', 'Ì',
                                     'ó', 'ò', 'ö','õ', 'ô','Ó', 'Ò', 'Ö', 'Õ', 'Ô',
                                     'ú', 'ù', 'ü','Ú','Ù', 'Ü','ç','Ç','ñ','Ñ');
  //Lista de caracteres para troca
  xCarTro: array[1..38] of String = ('a', 'a', 'a', 'a', 'a','A', 'A', 'A', 'A', 'A',
                                     'e', 'e','E', 'E','i', 'i','I', 'I',
                                     'o', 'o', 'o','o', 'o','O', 'O', 'O', 'O', 'O',
                                     'u', 'u', 'u','u','u', 'u','c','C','n', 'N');
  //Lista de Caracteres Extras
  xCarExt: array[1..48] of string = ('<','>','!','@','#','$','%','¨','&','*',
                                     '(',')','_','+','=','{','}','[',']','?',
                                     ';',':',',','|','*','"','~','^','´','`',
                                     '¨','æ','Æ','ø','£','Ø','ƒ','ª','º','¿',
                                     '®','½','¼','ß','µ','þ','ý','Ý');
var
  xTexto : string;
  i : Integer;
begin
   xTexto := pTexto;
   for i:=1 to 38 do
     xTexto := StringReplace(xTexto, xCarEsp[i], xCarTro[i], [rfreplaceall]);
   //De acordo com o parâmetro aLimExt, elimina caracteres extras.  
   if (pRemoveExtra) then
     for i:=1 to 48 do
       xTexto := StringReplace(xTexto, xCarExt[i], '', [rfreplaceall]);   
   Result := xTexto;
end;

function TCtrlParamArqPagto.ProcessarDados(IdEmpresa: integer;
  IdEstab: double; MesRef, AnoRef: integer; DataCredito: TDate;
  Previa: boolean; ListaIdTipoFolha, ListaIdFunc, Diretorio,
  ListaSelSitFunc, ListaSelTipoContrato: string; ConvFloat: Boolean): boolean;
var
  sHeader: string;
begin

    Result := false;

    FIdEmpresa := IdEmpresa;
    FIdEstab := IdEstab;
    FMesRef := IntToStr(AnoRef) + '/'+ PoeZero(MesRef);
    FDataCredito := DataCredito;
    FListaIdFunc := ListaIdFunc;
    FListaIdTipoFolha := ListaIdTipoFolha;
    FListaSelSitFunc := QuotedListaString(ListaSelSitFunc,',');
    FListaSelTipoContrato := QuotedListaString(ListaSelTipoContrato,',');
    FDiretorio := Diretorio;
    FConvFloat := ConvFloat; //Cássio Rovaroto - SIG nº 133912

    if (Previa) then
      FNomeTabela := 'PREVIAFOLPAG'
    else
      FNomeTabela := 'HISTRUBSAL';

    dValorLiquidoFolha := 0.00; //Cássio Rovaroto -  SIG nº 61776

    try
      FDadosIncompletos := not(AbrirQueryPrincipal);
      if (FDadosIncompletos) then
        raise Exception.Create(MessageInfo);
      //Cássio Rovaroto -  SIG n 61776 - Início
      //AbrirQueryDocTXT;
      AbrirQueryDocTxtLeiaute240;
      //Cássio Rovaroto -  SIG n 61776 - Fim

      while not(FCdsPrincipal.EOF) do
      begin
        //Cássio Rovaroto -  SIG n 61776 - Início
        //AlimentaQryDocTxt;
        AlimentaQryDocTxtLeiaute240;
        dValorLiquidoFolha := dValorLiquidoFolha + FCdsPrincipal.FieldByName('LIQUIDO').asFloat;
        //Cássio Rovaroto -  SIG n 61776 - Fim
        FCdsPrincipal.Next;
      end;

      FCdsDocTxt.First;
      sHeader :=  'IDPESSOA;NUM_BANCO;COD_REG;SEG;TIP_MOV;COD_INST;COD_BAN_D;COD_AGE_D;DV_AGE_D;CC_D;DV_CC_D;DV_AGE_CC_D;NOME;' +
                  'NUM_DOC;FILLER;TP_CONT;DT_VENC;TP_MOE;VALOR;NUM_DOC_BAN;QTD_PAR;IND_BLOQ;IND_FORMA_PAR;PER_VENC;NUM_PAR;'+
                  'DT_EFET;VLR_REAL;INF;USO_FEBRABAN;EMITE_AVISO;OCORRENCIAS;TIP_INSCR;NUM_IDENT;LOGRADOURO;NUMERO;COMPL;BAIRRO;'+
                  'CIDADE;CEP;COMPL_CEP;UF;VL_DOC;VL_ABAT;VL_DESC;VL_MORA;VL_MULTA;CODPORTFORMA;IDMOTIVO;';
      SaveToCSV(FCdsDocTxt, Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+ '\ResumoArquivo.csv', sHeader);

      MessageInfo := 'Dados para arquivo preparados com sucesso.' + #13#10 +
                     'Resumo do arquivo, em CSV, armazenado em ' + QuotedStr(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)) + #13#10 +
                     'O Arquivo de Pagamento será gerado a partir de agora.';
      Result := True;
     except
      on E: Exception do
        MessageInfo := E.Message;
     end;

end;

procedure TCtrlParamArqPagto.RegistraTarifaBancaria(pIdArquivoPagto, pCodDocArq, pCodPortForma, pCodForma: Integer);
var
  sSQL: string;
begin
  sSQL := 'INSERT INTO TARIFAARQPAGTO(IDTARIFAARQPAGTO, IDARQUIVOPAGTO, CODDOCARQ, IDPLANOPREV, IDPATRO, IDTARIFABANCARIA, PERCENTUAL) ' +#13#10+
          '       SELECT SEQTARIFAARQPAGTO.NEXTVAL,                                                                                    ' +#13#10+
                         IntToStr(pIdArquivoPagto) + ',                                                                                ' +#13#10+
                         IntToStr(pCodDocArq) + ',                                                                                     ' +#13#10+
          '              110,                                                                                                          ' +#13#10+
          '              (SELECT IDPATRO FROM PLANPREVCONTABPATRO WHERE IDPLANOPREV = 110),                                            ' +#13#10+
          '              NVL((SELECT IDTARIFABANCARIA FROM TARIFABANCARIA WHERE CODPORTFORMA = ' + IntToStr(pCodPortForma)               +#13#10+
          '                      AND CODFORMA = ' + IntToStr(pCodForma) + '), -1),                                                     ' +#13#10+
          '              1                                                                                                             ' +#13#10+
          '         FROM DUAL                                                                                                          ';

  qryTarifaArqPagto.Close;
  qryTarifaArqPagto.SQL.Clear;
  qryTarifaArqPagto.SQL.Add(sSQL);
  qryTarifaArqPagto.ExecSQL;
end;


function TCtrlParamArqPagto.Impersonate: boolean;
var
  LogonType: Integer;
  LogonProvider: Integer;
  TokenHandle: THandle;
begin
  LogonType := LOGON32_LOGON_INTERACTIVE;
  LogonProvider := LOGON32_PROVIDER_DEFAULT;

  Result := LogonUser(PChar(_DecryptSTR(fUser, StKey, MtKey, AdKey)), nil, PChar(_DecryptSTR(fPw, StKey, MtKey, AdKey)),
                      LogonType, LogonProvider, TokenHandle);

  if Result then
    Result := ImpersonateLoggedOnUser(TokenHandle);
end;

function TCtrlParamArqPagto._DecryptSTR(const InString: String; StartKey,
  MultKey, AddKey: Integer): String;
var i: Byte;
begin
  Result := '';
  for i := 1 To Length(InString) do
  begin
    Result := Result + Char(Byte(InString[i]) Xor (StartKey Shr 8));
    StartKey := (Byte(InString[i]) + StartKey) * MultKey + AddKey;
  end;
end;
{$R+}{$Q+}
end.
