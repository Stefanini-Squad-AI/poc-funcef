{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 07/08/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlParamRelTxtCCheque;

interface

uses SysUtils, Classes, Controls, uCmDbObject, uCmControlObject, IvDictio,
  uCMClientDataSet, uCtrlCustomRH, uCtrlFuncoesRH;

type
  TCtrlParamRelTxtCCheque = class(TCtrlCustomRH)
  protected
    procedure OnCreateAppServer; override;
  private
    FOnProgRelTxtCCheque: TOnProc;

    FCdsPessoa: TCMClientDataSet;
    FCdsProventos: TCMClientDataSet;
    FCdsDescontos: TCMClientDataSet;
    FCdsSalBase: TCMClientDataSet;
    FCdsBaseINSS: TCMClientDataSet;
    FCdsSalParticip: TCMClientDataSet;
    FCdsBaseFGTS: TCMClientDataSet;
    FCdsFGTS: TCMClientDataSet;
    FCdsBaseIRRF: TCMClientDataSet;
    FCdsMargem: TCMClientDataSet;
    FCdsMargem2: TCMClientDataSet;

    FSQL: TStringList;
    FArquivo: TStringList;
    
    FTotalProv: double;
    FTotalDesc: double;

    FImprimirCabecalho, FAutonomo: boolean;
    FIdContraCheque, FIdEmpresa, FOrdenacao: integer;
    FListaIdEstab, FListaCodCCusto, FListaIdFunc, FMesRef, FNomeTabela,
    FListaSitFunc, FListaTipoContrato, FListaIdMotivo, FListaIdRubrica: string;

    FDataCredito: TDate;

    FDemInformativo: boolean;
    procedure IncProgresso;
    function CompStr(a:string; Tam:integer; Letra:char; Direcao:boolean): string;
  public
    constructor Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral: string); reintroduce; 
    destructor  Destroy; override;

    procedure InitDadosQuerysPessoas(ListaIdFunc: string; IdContraCheque, IdEmpresa: integer;
      ListaIdEstab, ListaCodCCusto, MesRef, NomeTabela, ListaSitFunc, ListaTipoContrato,
      ListaIdMotivo: string; Ordenacao: integer; DemInformativo: boolean;
      ListaIdRubrica: string; ImprimirCabecalho: boolean; DataCredito: TDate);

    function ListPessoas(bAutonomo: boolean): OleVariant;
    function ListProventos(IdPessoa: double): OleVariant;
    function ListDescontos(IdPessoa: double): OleVariant;
    function ListSalBase(IdPessoa: double): OleVariant;
    function ListBaseINSS(IdPessoa: double): OleVariant;
    function ListSalParticip(IdPessoa: double): OleVariant;
    function ListBaseFGTS(IdPessoa: double): OleVariant;
    function ListFGTS(IdPessoa: double): OleVariant;
    function ListBaseIRRF(IdPessoa: double): OleVariant;
    function ListMargem(IdPessoa: double): OleVariant;
    function ListMargem2(IdPessoa: double): OleVariant;

    procedure SelecionarRubricasPessoa;

    function GerarModelo_SERPROS(AnoBarraMes, Mensagem: string): string;
    function GerarModelo_REFER(AnoBarraMes, Mensagem: string): string;
    function GerarModelo_FUNCEF(AnoBarraMes, NomeArqFrente, NomeArqVerso: string;
                                bAutonomo: boolean): string;
    function GerarModelo_FCRT(AnoBarraMes: string; DataPag: TDate): string;
    function GerarModelo_CTRQ(AnoBarraMes, NomeEmpresa, Mensagem: string; DataPag: TDate;
      SelPeriodo: boolean): string;
    function GerarModelo_MAKSOUD(AnoBarraMes, Msg1, Msg2: string): string;
    function GerarModelo_CLIENTE_PADRAO(AnoBarraMes, Msg1, Msg2: string;
      Altura6Polegadas: boolean): string;

    property CdsPessoa: TCMClientDataSet read FCdsPessoa write FCdsPessoa;
    property CdsProventos: TCMClientDataSet read FCdsProventos write FCdsProventos;
    property CdsDescontos: TCMClientDataSet read FCdsDescontos write FCdsDescontos;

    property SQL: TStringList read FSQL;
    property TotalProv: double read FTotalProv write FTotalProv;
    property TotalDesc: double read FTotalDesc write FTotalDesc;
    property OnProgresso: TOnProc read FOnProgRelTxtCCheque write FOnProgRelTxtCCheque;
  end;

implementation

uses uCMTypes;

{ TCtrlParamRelTxtCCheque }

constructor TCtrlParamRelTxtCCheque.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral: string);
begin
  inherited Create;
  SetAutorizacoes(UsuXFilial, UsuXCCusto, IdUsuarioGeral);

  FCdsPessoa := TCMClientDataSet.Create(nil);
  FCdsProventos := TCMClientDataSet.Create(nil);
  FCdsDescontos := TCMClientDataSet.Create(nil);
  FCdsSalBase := TCMClientDataSet.Create(nil);
  FCdsBaseINSS := TCMClientDataSet.Create(nil);
  FCdsSalParticip := TCMClientDataSet.Create(nil);
  FCdsBaseFGTS := TCMClientDataSet.Create(nil);
  FCdsFGTS := TCMClientDataSet.Create(nil);
  FCdsBaseIRRF := TCMClientDataSet.Create(nil);
  FCdsMargem := TCMClientDataSet.Create(nil);
  FCdsMargem2 := TCMClientDataSet.Create(nil);

  FSQL := TStringList.Create;
  FArquivo := TStringList.Create;
end;

destructor TCtrlParamRelTxtCCheque.Destroy;
begin
  FSQL.Free;
  FArquivo.Free;
  FCdsPessoa.Free;
  FCdsProventos.Free;
  FCdsDescontos.Free;
  FCdsSalBase.Free;
  FCdsBaseINSS.Free;
  FCdsSalParticip.Free;
  FCdsBaseFGTS.Free;
  FCdsFGTS.Free;
  FCdsBaseIRRF.Free;
  FCdsMargem.Free;
  FCdsMargem2.Free;
  inherited;
end;

procedure TCtrlParamRelTxtCCheque.OnCreateAppServer;
begin
  inherited;
end;

procedure TCtrlParamRelTxtCCheque.InitDadosQuerysPessoas(ListaIdFunc: string;
  IdContraCheque, IdEmpresa: integer; ListaIdEstab, ListaCodCCusto, MesRef, NomeTabela,
  ListaSitFunc, ListaTipoContrato, ListaIdMotivo: string; Ordenacao: integer;
  DemInformativo: boolean; ListaIdRubrica: string; ImprimirCabecalho: boolean;
  DataCredito: TDate);
begin
  FListaIdFunc := ListaIdFunc;
  FIdContraCheque := IdContraCheque;
  FIdEmpresa := IdEmpresa;
  FListaIdEstab := ListaIdEstab;
  FListaCodCCusto := ListaCodCCusto;
  FMesRef := MesRef;
  FNomeTabela := NomeTabela;
  FListaSitFunc := ListaSitFunc;
  FListaTipoContrato := ListaTipoContrato;
  FListaIdMotivo := ListaIdMotivo;
  FOrdenacao := Ordenacao;
  FDemInformativo := DemInformativo;
  FListaIdRubrica := ListaIdRubrica;
  FImprimirCabecalho := ImprimirCabecalho;
  FDataCredito := DataCredito;
end;

function TCtrlParamRelTxtCCheque.ListPessoas(bAutonomo: boolean): OleVariant;
begin
  FAutonomo := (bAutonomo) and (FIdContraCheque = FUNCEF);
  with (FSQL) do
  begin
    Clear;
    Add('SELECT ' +IFF(FIdContraCheque = FUNCEF, '/*+ RULE */', '')+ ' DISTINCT');
    Add('  PJ.RAZAOSOCIAL AS EMPRESA,');
    Add('  PF.NUMDOCUMENTO AS CPF,');
    Add('  PF.NOME AS EMPREGADO,');
    Add('  PF.IDPESSOA,');
    Add('  PFIS.NUMDEPSALF,');
    Add('  PFIS.NUMDEPIRRF,');
    Add('  F.NUMCONTASALARIO,');
    Add('  AG.NUMAGENCIA,');
    Add('  B.NUMBANCO,');
    Add('  C.TITULO,');
    Add('  CC.NOME AS NOMECC,');
    Add('  F.MATRICULA,');
    Add('  F.IDCARGO,');
    Add('  F.IDEMPRESA,');
    Add('  F.IDFAIXACARGO,');
    Add('  F.IDFUNCAO,');
    Add('  CNPJ.NUM AS CNPJ,');
    Add('  CNPJ.TIPO AS TIPOCNPJ,');
    Add('  TO_CHAR(DECODE(RTRIM(ESTADUAL.NUMDOCUMENTO),');
    Add('    NULL,TO_CHAR(DECODE(RTRIM(MUNICIPAL.NUMDOCUMENTO),');
    Add('           NULL,'''',');
    Add('           ' +QuotedStr(('Inscrição Municipal: '))+ '|| RTRIM(MUNICIPAL.NUMDOCUMENTO)');
    Add('         )),');
    Add('    ' +QuotedStr(('Inscrição Estadual: '))+ ' || RTRIM(ESTADUAL.NUMDOCUMENTO)');
    Add('  )) AS ESTADUALMUNICIPAL,');
    Add('  RTRIM(ENDJ.LOGRADOURO) ||'', ''|| TO_CHAR(ENDJ.NUMERO) ||');
    Add('    TO_CHAR(DECODE(ENDJ.COMPLEMENTO,');
    Add('      NULL,'''',');
    Add('      '' - '' || RTRIM(ENDJ.COMPLEMENTO)');
    Add('    )) ||'' - ''|| RTRIM(ENDJ.BAIRRO) ||'' - ''||');
    Add('    RTRIM(CID2.NOME) ||'' - CEP:''|| RTRIM(SUBSTR(ENDJ.CEP,1,5)) ||''-''||');
    Add('    RTRIM(SUBSTR(ENDJ.CEP,6,3)) AS ENDEMPRESA,');

    if (FIdContraCheque = SERPROS) then
      Add('  F.CODCENTROCUSTO AS CENTROCUSTO, PPP.INSCRICAONUMERO, RTRIM(C2.TITULO) AS FUNCAO,')
    else
      Add('  F.CODCENTROCUSTO AS CENTROCUSTO, RTRIM(C2.TITULO) AS FUNCAO, '' '' AS INSCRICAONUMERO,');

    if (FIdContraCheque = CTRQ) then
      Add('  HT.NOMEHORARIO,');

    Add('  F.DATAADMISSAO,');
    Add('  RTRIM(ENDER.LOGRADOURO) || '', '' || RTRIM(ENDER.NUMERO) ||'' ''||');
    Add('    RTRIM(ENDER.COMPLEMENTO) AS ENDERECO,');
    Add('  CID.NOME AS CIDADE,');
    Add('  ENDER.CODESTADO,');
    Add('  ENDER.CEP,');
    Add('  TO_CHAR(DECODE(CTPS.NUMDOCUMENTO,NULL,'''',CTPS.NUMDOCUMENTO)) AS CARTPROF,');

    if (FIdContraCheque = FUNCEF) and (bAutonomo) then
      Add('  PIS.NUM AS PIS')
    else
      Add('  '' '' AS PIS');

    Add('FROM');

    if (FIdContraCheque = SERPROS) then
    begin
      Add(' (SELECT IDPESSOA,NUMDOCUMENTO AS INSCRICAONUMERO');
      Add('  FROM   DOCPESSOA');
      Add('  WHERE  (IDDOCUMENTO = 145)) PPP,');
    end;

    Add('  ' +FNomeTabela+ ' H, PESSOA PF, PESSOA PJ, PESSOAFISICA PFIS, ENDPESS ENDER,');
    Add('  ENDPESS ENDJ, PROVDESC P, RUBRICAXPESS  RP, FUNCIONARIO F, CIDADES CID,');
    Add('  CIDADES CID2, AGENCIABANCARIA AG, BANCO B, CARGO C, CARGO C2, CENTCUST CC,');

    if (FListaIdFunc = '') then
      Add('SITFUNC ST,');

    if (FIdContraCheque = CTRQ) then
      Add('  HORATRAB HT,');
    // -------------------------------------------------------------------------- //
    // CNPJ do Estabelecimento
    Add('  (SELECT FP.IDFILIALPESSOA, TDO.SIGLADOCUMENTO AS TIPO, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO, FILIALPESSOA FP');
    Add('   WHERE  ((TDO.SIGLADOCUMENTO = ''CNPJ:'') OR');
    Add('           (TDO.SIGLADOCUMENTO = ''CGC:'')) AND');
    Add('          (TDO.IDDOCUMENTO     = DP.IDDOCUMENTO) AND');
    Add('          (DP.IDPESSOA         = FP.IDFILIALPESSOA)) CNPJ,');
    // -------------------------------------------------------------------------- //
    Add('  (SELECT DP.IDPESSOA, DP.NUMDOCUMENTO');
    Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''CTPS:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO)) CTPS,');
    // -------------------------------------------------------------------------- //
    // Inscrição Estadual
    Add('  (SELECT DP.IDPESSOA, DP.NUMDOCUMENTO');
    Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''ESTADUAL:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO)) ESTADUAL,');
    // -------------------------------------------------------------------------- //
    // Inscrição Municipal
    Add('  (SELECT DP.IDPESSOA, DP.NUMDOCUMENTO');
    Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''MUNICIPAL:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO)) MUNICIPAL');
    // -------------------------------------------------------------------------- //
    if (FIdContraCheque = FUNCEF) and (bAutonomo) then
    begin
    // PIS do Funcionário
      Add(', (SELECT F.IDPESSOA, DP.NUMDOCUMENTO AS NUM');
      Add('   FROM   DOCPESSOA DP, FUNCIONARIO F, TIPODOCOFICIAL TDO');
      Add('   WHERE ((TDO.SIGLADOCUMENTO = ''PIS:'') OR');
      Add('          (TDO.SIGLADOCUMENTO = ''PIS/PASEP:'')) AND');
      Add('         (TDO.IDDOCUMENTO     = DP.IDDOCUMENTO) AND');
      Add('         (DP.IDPESSOA         = F.IDPESSOA)) PIS');
    end;
    // -------------------------------------------------------------------- //
    Add('WHERE');
    if (FListaIdEstab <> '') then
      Add(MontaLinhaSelSQL('  (PJ.IDPESSOA',FListaIdEstab,8));

    // Funcionário selecionado
    if (FListaIdFunc <> '') then
      Add(MontaLinhaSelSQL('  (F.IDPESSOA',FListaIdFunc,2))
    else
    begin
      // C. de Custo(s) selecionados
      if (FListaCodCCusto <> '') then
        Add(MontaLinhaSelSQL('  (F.CODCENTROCUSTO',FListaCodCCusto,1))
      else
      // C. de Custo(s) habilitados para o usuário
      if (FUsuXCCusto <> '') then
        Add(MontaLinhaSelSQL('  (F.CODCENTROCUSTO',FUsuXCCusto,1));

      if (FListaSitFunc <> '') then
        Add(MontaLinhaSelSQL('  (ST.TIPOSIT',FListaSitFunc,9));

      Add(MontaLinhaSelSQL('  (F.TIPOCONTRATO',FListaTipoContrato,5));
      Add('  (ST.IDSITFUNC        = F.IDSITFUNC) AND');
    end;

    Add('  (F.IDESTAB           = PJ.IDPESSOA) AND');
    Add('  (PJ.IDPESSOA         = CNPJ.IDFILIALPESSOA) AND');
    Add('  (F.IDPESSOA          = PF.IDPESSOA) AND');
    Add('  (F.IDPESSOA          = PFIS.IDPESSOA) AND');
    Add('  (F.CODCENTROCUSTO    = CC.CODCENTROCUSTO) AND');
    Add('  (F.IDEMPRESA         = CC.IDEMPRESA) AND');
    Add('  (F.IDCARGO           = C.IDCARGO) AND');
    Add('  (F.IDEMPRESA         = RP.IDPESSOA) AND');
    Add('  (F.IDPESSOA          = H.IDPESSOA) AND');
    Add('  (H.IDRUBRICA         = RP.IDRUBRICA) AND');
    Add('  (H.IDRUBRICA         = P.IDPROVENTO) AND');
    Add('  (H.IDPESSJUR         = ' +IntToStr(FIdEmpresa)+ ') AND');
    Add('  (H.MES               = ' +QuotedStr(FMesRef)+ ') AND');
    Add(MontaLinhaSelSQL('  (H.IDMOTIVO',FListaIdMotivo,9));

    if (FIdContraCheque = CTRQ) then
      Add('  (F.IDHORARIO         = HT.IDHORARIO) AND');

    if (FIdContraCheque = SERPROS) then
    begin
      Add('  (H.IDPESSOA          = PPP.IDPESSOA(+)) AND');
      Add('  (F.IDFUNCAO          = C2.IDCARGO(+)) AND');
    end
    else
      Add('  (F.IDFUNCAO          = C2.IDCARGO(+)) AND');

    Add('  (F.IDPESSOA          = CTPS.IDPESSOA(+)) AND');

    if (FIdContraCheque = FUNCEF) and (bAutonomo) then
      Add('  (F.IDPESSOA          = PIS.IDPESSOA(+)) AND');

    Add('  (F.IDAGENCIASALARIO  = AG.IDPESSOA(+)) AND');
    Add('  (AG.IDBANCO          = B.IDPESSOA(+)) AND');
    Add('  (ENDER.IDENDERECO(+) = PF.IDENDRESIDENCIAL) AND');
    Add('  (ENDER.IDPESSOA(+)   = PF.IDPESSOA) AND');
    Add('  (ENDER.IDCIDADES     = CID.IDCIDADES(+)) AND');
    Add('  (PJ.IDPESSOA         = ESTADUAL.IDPESSOA(+)) AND');
    Add('  (PJ.IDPESSOA         = MUNICIPAL.IDPESSOA(+)) AND');
    Add('  (PJ.IDENDCOMERCIAL   = ENDJ.IDENDERECO(+)) AND');
    Add('  (PJ.IDPESSOA         = ENDJ.IDPESSOA(+)) AND');
    Add('  (ENDJ.IDCIDADES      = CID2.IDCIDADES(+))');
    Add('ORDER BY');

    case (FOrdenacao) of
      1 :  Add('  F.IDEMPRESA, CENTROCUSTO, EMPREGADO');
      2 :  Add('  F.IDEMPRESA, CENTROCUSTO, MATRICULA');
      3 :  Add('  F.IDEMPRESA, MATRICULA');
      else Add('  F.IDEMPRESA, EMPREGADO');
    end;
  end;
  Result := GetDataPacket(FSQL.Text);
end;

function TCtrlParamRelTxtCCheque.ListProventos(IdPessoa: double): OleVariant;
begin
  with (FSQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  P.CODRUBCLT AS CODRUBRICA,');
    Add('  RP.CODPROVDESC,');
    Add('  RP.DESCRPROVDESC AS DESCRICAO,');
    Add('  H.VALORPROVENTO, H.MES, H.REFERENCIA, H.SEQRUBRICA');
    Add('FROM');
    Add('  ' +FNomeTabela+ ' H, PROVDESC P, RUBRICAXPESS RP');
    Add('WHERE');
    Add('  (H.IDPESSOA   = ' +FloatToStr(IdPessoa)+ ') AND');
    Add('  (H.MES        = ' +QuotedStr(FMesRef)+ ') AND');

    if (FDemInformativo) then
    begin
      Add('  (P.FLGDESCONTO <> 1) AND');
      Add(MontaLinhaSelSQL('  (H.CODPROVDESC',QuotedListaString(FListaIdRubrica, ','),1));
    end
    else
      Add('  (P.FLGDESCONTO = 0) AND');

    Add(MontaLinhaSelSQL('  (H.IDMOTIVO',FListaIdMotivo,3));
    Add('  (RP.IDRUBRICA  = H.IDRUBRICA) AND');
    Add('  (RP.IDPESSOA   = H.IDPESSJUR) AND');

    if (FIdContraCheque = CTRQ) or (FIdContraCheque = FCRT) then
      Add('  (H.DATAPAGAMENTO IS NULL OR H.DATAPAGAMENTO = TO_DATE(' +QuotedStr(DateToStr(FDataCredito)) +',''DD/MM/YYYY'')) AND');

    Add('  (P.IDPROVENTO  = H.IDRUBRICA)');
    Add('ORDER BY');
    Add('  RP.CODPROVDESC');
  end;
  Result := GetDataPacket(FSQL.Text);
end;

function TCtrlParamRelTxtCCheque.ListDescontos(IdPessoa: double): OleVariant;
begin
  with (FSQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  P.CODRUBCLT AS CODRUBRICA,');
    Add('  RP.CODPROVDESC,');
    Add('  RP.DESCRPROVDESC AS DESCRICAO,');
    Add('  H.VALORPROVENTO, H.MES, H.REFERENCIA, H.SEQRUBRICA');
    Add('FROM');
    Add('  '+FNomeTabela+' H, PROVDESC P, RUBRICAXPESS RP');
    Add('WHERE');
    Add('  (P.FLGDESCONTO = 1) AND');
    Add('  (H.IDPESSOA   = ' +FloatToStr(IdPessoa)+ ') AND');
    Add('  (H.MES        = ' +QuotedStr(FMesRef)+ ') AND');

    if (FDemInformativo) then
      Add(MontaLinhaSelSQL('  (H.CODPROVDESC',QuotedListaString(FListaIdRubrica, ','),1));

    Add(MontaLinhaSelSQL('  (H.IDMOTIVO',FListaIdMotivo,3));
    Add('  (RP.IDRUBRICA  = H.IDRUBRICA) AND');
    Add('  (RP.IDPESSOA   = H.IDPESSJUR) AND');

    if (FIdContraCheque = CTRQ) or (FIdContraCheque = FCRT) then
      Add('  (H.DATAPAGAMENTO IS NULL OR H.DATAPAGAMENTO = TO_DATE(' +QuotedStr(DateToStr(FDataCredito)) +',''DD/MM/YYYY'')) AND');

    Add('  (P.IDPROVENTO  = H.IDRUBRICA)');
    Add('ORDER BY');
    Add('  RP.CODPROVDESC');
  end;
  Result := GetDataPacket(FSQL.Text);
end;

function TCtrlParamRelTxtCCheque.ListSalBase(IdPessoa: double): OleVariant;
begin
  with (FSQL) do
  begin
    Clear;
    Add('SELECT');

    if (FDemInformativo) then
      Add('  0 AS SALBASE')
    else
      Add('  H.VALORPROVENTO AS SALBASE');

    Add('FROM ' +FNomeTabela+ ' H, PROVDESC P');
    Add('WHERE');
    Add('  (H.IDPESSOA   = ' +FloatToStr(IdPessoa)+ ') AND');
    Add('  (H.MES        = ' +QuotedStr(FMesRef)+ ') AND');
    Add(MontaLinhaSelSQL('  (H.IDMOTIVO',FListaIdMotivo,3));

    if (FIdContraCheque = CTRQ) or (FIdContraCheque = FCRT) then
      Add('  (H.DATAPAGAMENTO IS NULL OR H.DATAPAGAMENTO = TO_DATE(' +QuotedStr(DateToStr(FDataCredito)) +',''DD/MM/YYYY'')) AND');

    Add('  (P.CODRUBCLT = ''60052'') AND');
    Add('  (H.IDRUBRICA = P.IDPROVENTO)');

    if not(FDemInformativo) then
    begin
      Add('UNION');
      Add('SELECT');
      Add('  NVL(F.SALARIOATUAL,0) *');
      Add('    TO_NUMBER(DECODE(F.TIPOPAGAMENTO,''M'',1,H.JORNADAMENSAL)) AS SALBASE');
      Add('FROM');
      Add('  FUNCIONARIO F, HORATRAB H');
      Add('WHERE');
      Add('  (F.IDPESSOA  = ' +FloatToStr(IdPessoa)+ ') AND');
      Add('  (F.IDHORARIO = H.IDHORARIO)');
    end;

    Add('ORDER BY 1 DESC');
  end;
  Result := GetDataPacket(FSQL.Text);
end;

function TCtrlParamRelTxtCCheque.ListBaseINSS(IdPessoa: double): OleVariant;
begin
  with (FSQL) do
  begin
    Clear;
    Add('SELECT');

    if (FDemInformativo) then
      Add('  0 AS VALORBASEINSS')
    else
      Add('  H.VALORPROVENTO AS VALORBASEINSS');

    Add('FROM');
    Add('  ' +FNomeTabela+ ' H, PROVDESC P');
    Add('WHERE');
    Add('  (H.IDPESSOA   = ' +FloatToStr(IdPessoa)+ ') AND');
    Add('  (H.MES        = ' +QuotedStr(FMesRef)+ ') AND');

    if (FIdContraCheque = CTRQ) or (FIdContraCheque = FCRT) then
      Add('  (H.DATAPAGAMENTO IS NULL OR H.DATAPAGAMENTO = TO_DATE(' +QuotedStr(DateToStr(FDataCredito)) +',''DD/MM/YYYY'')) AND');

    Add(MontaLinhaSelSQL('  (H.IDMOTIVO',FListaIdMotivo,3));

    if (FIdContraCheque = FUNCEF) then
    begin
      if (FAutonomo) then
        Add('  (P.CODRUBCLT  = ''60052'') AND')
      else
        Add('  (P.CODRUBCLT  = ''60056'') AND');
    end
    else
      Add('  (P.CODRUBCLT IN (''60014'',''60025'',''62015'',''60017'',''60035'',''60421'',''62016'')) AND');

    Add('  (P.IDPROVENTO = H.IDRUBRICA)');
  end;
  Result := GetDataPacket(FSQL.Text);
end;

function TCtrlParamRelTxtCCheque.ListSalParticip(IdPessoa: double): OleVariant;
begin
  with (FSQL) do
  begin
    Clear;
    Add('SELECT');

    if (FDemInformativo) then
      Add('  0 AS VALORSALPART')
    else
      Add('  H.VALORPROVENTO AS VALORSALPART');

    Add('FROM');
    Add('  ' +FNomeTabela+ ' H, PROVDESC P');
    Add('WHERE');
    Add('  (H.IDPESSOA   = ' +FloatToStr(IdPessoa)+ ') AND');
    Add('  (H.MES        = ' +QuotedStr(FMesRef)+ ') AND');

    if (FIdContraCheque = CTRQ) or (FIdContraCheque = FCRT) then
      Add('  (H.DATAPAGAMENTO IS NULL OR H.DATAPAGAMENTO = TO_DATE(' +QuotedStr(DateToStr(FDataCredito)) +',''DD/MM/YYYY'')) AND');

    Add(MontaLinhaSelSQL('  (H.IDMOTIVO',FListaIdMotivo,3));
    Add('  (P.CODRUBCLT  = ''90011'') AND');
    Add('  (P.IDPROVENTO = H.IDRUBRICA)');
  end;
  Result := GetDataPacket(FSQL.Text);
end;

function TCtrlParamRelTxtCCheque.ListBaseFGTS(IdPessoa: double): OleVariant;
begin
  with (FSQL) do
  begin
    Clear;
    Add('SELECT');

    if (FDemInformativo) then
      Add('  0 AS BASEFGTS')
    else
      Add('  SUM(H.VALORPROVENTO) AS BASEFGTS');

    Add('FROM');
    Add('  ' +FNomeTabela+ ' H, PROVDESC P');
    Add('WHERE');
    Add('  (H.IDPESSOA   = ' +FloatToStr(IdPessoa)+ ') AND');
    Add('  (H.MES        = ' +QuotedStr(FMesRef)+ ') AND');

    if (FIdContraCheque = CTRQ) or (FIdContraCheque = FCRT) then
      Add('  (H.DATAPAGAMENTO IS NULL OR H.DATAPAGAMENTO = TO_DATE(' +QuotedStr(DateToStr(FDataCredito)) +',''DD/MM/YYYY'')) AND');

    Add(MontaLinhaSelSQL('  (H.IDMOTIVO',FListaIdMotivo,3));

    if (not FAutonomo) then
      Add('  (P.CODRUBCLT IN (''60695'',''62022'')) AND')
    else
      Add('  (P.CODRUBCLT = ''60002'') AND');

    Add('  (P.IDPROVENTO = H.IDRUBRICA)');
  end;
  Result := GetDataPacket(FSQL.Text);
end;

function TCtrlParamRelTxtCCheque.ListFGTS(IdPessoa: double): OleVariant;
begin
  with (FSQL) do
  begin
    Clear;
    Add('SELECT');

    if (FDemInformativo) then
      Add('  0 AS VALORFGTS')
    else
      Add('  SUM(H.VALORPROVENTO) AS VALORFGTS');

    Add('FROM');
    Add('  ' +FNomeTabela+ ' H, PROVDESC P');
    Add('WHERE');
    Add('  (H.IDPESSOA   = ' +FloatToStr(IdPessoa)+ ') AND');
    Add('  (H.MES        = ' +QuotedStr(FMesRef)+ ') AND');

    if (FIdContraCheque = CTRQ) or (FIdContraCheque = FCRT) then
      Add('  (H.DATAPAGAMENTO IS NULL OR H.DATAPAGAMENTO = TO_DATE(' +QuotedStr(DateToStr(FDataCredito)) +',''DD/MM/YYYY'')) AND');

    Add(MontaLinhaSelSQL('  (H.IDMOTIVO',FListaIdMotivo,3));
    Add('  (P.CODRUBCLT IN (''40695'',''43696'',''43700'')) AND');
    Add('  (P.IDPROVENTO = H.IDRUBRICA)');
  end;
  Result := GetDataPacket(FSQL.Text);
end;

function TCtrlParamRelTxtCCheque.ListBaseIRRF(IdPessoa: double): OleVariant;
begin
  with (FSQL) do
  begin
    Clear;
    Add('SELECT');

    if (FDemInformativo) then
      Add('  0 AS VALORBASEIRRF')
    else
    begin
      if (FIdContraCheque = FUNCEF) then
        Add('  SUM(H.VALORPROVENTO) AS VALORBASEIRRF')
      else
        Add('  H.VALORPROVENTO AS VALORBASEIRRF');
    end;

    Add('FROM');
    Add('  ' +FNomeTabela+ ' H, PROVDESC P');
    Add('WHERE');
    Add('  (H.IDPESSOA   = ' +FloatToStr(IdPessoa)+ ') AND');
    Add('  (H.MES        = ' +QuotedStr(FMesRef)+ ') AND');

    if (FIdContraCheque = CTRQ) or (FIdContraCheque = FCRT) then
      Add('  (H.DATAPAGAMENTO IS NULL OR H.DATAPAGAMENTO = TO_DATE(' +QuotedStr(DateToStr(FDataCredito)) +',''DD/MM/YYYY'')) AND');

    Add(MontaLinhaSelSQL('  (H.IDMOTIVO',FListaIdMotivo,3));
    Add('  (P.CODRUBCLT IN (''60026'',''60028'',''62026'',''60027'',''60036'',''60422'')) AND');
    Add('  (P.IDPROVENTO = H.IDRUBRICA)');
  end;
  Result := GetDataPacket(FSQL.Text);
end;

function TCtrlParamRelTxtCCheque.ListMargem(IdPessoa: double): OleVariant;
begin
  with (FSQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');

    if (FDemInformativo) then
      Add('  0 AS VALORMARGEM')
    else
      Add('  H.VALORPROVENTO AS VALORMARGEM');

    Add('FROM');
    Add('  ' +FNomeTabela+ ' H, PROVDESC P');
    Add('WHERE');
    Add('  (H.IDPESSOA   = ' +FloatToStr(IdPessoa)+ ') AND');
    Add('  (H.MES        = ' +QuotedStr(FMesRef)+ ') AND');

    if (FIdContraCheque = CTRQ) or (FIdContraCheque = FCRT) then
      Add('  (H.DATAPAGAMENTO IS NULL OR H.DATAPAGAMENTO = TO_DATE(' +QuotedStr(DateToStr(FDataCredito)) +',''DD/MM/YYYY'')) AND');

    Add(MontaLinhaSelSQL('  (H.IDMOTIVO',FListaIdMotivo,3));
    Add('  (P.CODRUBCLT  = ''90010'') AND');
    Add('  (P.IDPROVENTO = H.IDRUBRICA)');
  end;
  Result := GetDataPacket(FSQL.Text);
end;

function TCtrlParamRelTxtCCheque.ListMargem2(IdPessoa: double): OleVariant;
begin
  with (FSQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');

    if (FDemInformativo) then
      Add('  0 AS VALORMARGEM')
    else
      Add('  H.VALORPROVENTO AS VALORMARGEM');

    Add('FROM');
    Add('  ' +FNomeTabela+ ' H, PROVDESC P');
    Add('WHERE');
    Add('  (H.IDPESSOA   = ' +FloatToStr(IdPessoa)+ ') AND');
    Add('  (H.MES        = ' +QuotedStr(FMesRef)+ ') AND');

    if (FIdContraCheque = CTRQ) or (FIdContraCheque = FCRT) then
      Add('  (H.DATAPAGAMENTO IS NULL OR H.DATAPAGAMENTO = TO_DATE(' +QuotedStr(DateToStr(FDataCredito)) +',''DD/MM/YYYY'')) AND');

    Add(MontaLinhaSelSQL('  (H.IDMOTIVO',FListaIdMotivo,3));
    Add('  (P.CODRUBCLT  = ''90012'') AND');
    Add('  (P.IDPROVENTO = H.IDRUBRICA)');
  end;
  Result := GetDataPacket(FSQL.Text);
end;

procedure TCtrlParamRelTxtCCheque.SelecionarRubricasPessoa;
begin
  FCdsProventos.Data := ListProventos(FCdsPessoa.FieldByName('IDPESSOA').asFloat);
  FCdsDescontos.Data := ListDescontos(FCdsPessoa.FieldByName('IDPESSOA').asFloat);
  FCdsSalBase.Data := ListSalBase(FCdsPessoa.FieldByName('IDPESSOA').asFloat);
  FCdsBaseINSS.Data := ListBaseINSS(FCdsPessoa.FieldByName('IDPESSOA').asFloat);
  FCdsSalParticip.Data := ListSalParticip(FCdsPessoa.FieldByName('IDPESSOA').asFloat);
  FCdsBaseFGTS.Data := ListBaseFGTS(FCdsPessoa.FieldByName('IDPESSOA').asFloat);
  FCdsFGTS.Data := ListFGTS(FCdsPessoa.FieldByName('IDPESSOA').asFloat);
  FCdsBaseIRRF.Data := ListBaseIRRF(FCdsPessoa.FieldByName('IDPESSOA').asFloat);
  FCdsMargem.Data := ListMargem(FCdsPessoa.FieldByName('IDPESSOA').asFloat);
  FCdsMargem2.Data := ListMargem2(FCdsPessoa.FieldByName('IDPESSOA').asFloat);
end;

procedure TCtrlParamRelTxtCCheque.IncProgresso;
begin
  if Assigned(OnProgresso) then
    OnProgresso;
end;

function TCtrlParamRelTxtCCheque.CompStr(a:string; Tam:integer; Letra:char; Direcao:boolean): string;
var
  i: integer;
  b: string;
begin
  b := '';
  if (Tam < Length(a)) then
    a := Copy(a, 1, Tam);

  if (Tam > Length(a)) then
    for i:=1 to Abs(Tam - Length(a)) do
      b := b + Letra;

  if (Direcao) then
    b := b + a
  else
    b := a + b;

  Result := b;
end;

function TCtrlParamRelTxtCCheque.GerarModelo_SERPROS(AnoBarraMes, Mensagem: string): string;
var
  c: word;
  Lin: string;
begin
  FArquivo.Clear;
  // MES
  FArquivo.Add(' ');
  FArquivo.Add(Replicate(' ',70)+ Copy(AnoBarraMes,6,2) +'/'+ Copy(AnoBarraMes,1,4));

  // Nome
  FArquivo.Add(' ');
  FArquivo.Add(Replicate(' ',02)+
    LeftPad(Trim(FCdsPessoa.FieldByName('EMPREGADO').asString), 85));

  // Matricula, Inscrição, Número de Dependentes Sal. Fam., Número de Dependentes IRRF
  FArquivo.Add(' ');
  FArquivo.Add(
    Replicate(' ',02) + LeftPad(FCdsPessoa.FieldByName('MATRICULA').asString,8)+
    Replicate(' ',03) + LeftPad(FCdsPessoa.FieldByName('INSCRICAONUMERO').asString,10)+
    Replicate(' ',05) + LeftPad(Trim(FCdsPessoa.FieldByName('TITULO').asString),40)+
    Replicate(' ',01) +
    Replicate(' ',04) + LeftPad(FCdsPessoa.FieldByName('NUMDEPSALF').asString,3)+
    Replicate(' ',02) + LeftPad(FCdsPessoa.FieldByName('NUMDEPIRRF').asString,4));

  // Endereço
  FArquivo.Add(' ');
  Lin := FCdsPessoa.FieldByName('ENDERECO').asString;
  FArquivo.Add(
    Replicate(' ',02) + LeftPad(Lin,80)+
    Replicate(' ',03) + LeftPad(FCdsPessoa.FieldByName('CIDADE').asString,15)+
    Replicate(' ',05) + FCdsPessoa.FieldByName('CODESTADO').asString+
    Replicate(' ',08) + Copy(FCdsPessoa.FieldByName('CEP').asString,1,5)+
    '-'               + Copy(FCdsPessoa.FieldByName('CEP').asString,6,3));

  // Linhas de Proventos e Descontos
  FArquivo.Add(' ');
  FArquivo.Add(' ');
  FArquivo.Add(' ');
  for c:=1 to 12 do
  begin
    Lin := '';

    // Gerar linhas com os proventos
    if not(FCdsProventos.EOF) then
    begin
      Lin := Replicate(' ',2) +
        LeftPad(FCdsProventos.FieldByName('CODPROVDESC').asString,4);

      if (FCdsProventos.FieldByName('REFERENCIA').asString = '***') or
         (FCdsProventos.FieldByName('REFERENCIA').asString = 'Férias') or
         (FCdsProventos.FieldByName('REFERENCIA').asString = 'Ferias') then
        Lin := Lin + Replicate(' ',2) +
          LeftPad(FCdsProventos.FieldByName('DESCRICAO').asString,40)
      else
        Lin := Lin + Replicate(' ',2) +
          LeftPad(Trim(FCdsProventos.FieldByName('DESCRICAO').asString) +' '+
          Trim(FCdsProventos.FieldByName('REFERENCIA').asString),40);

      Lin := Lin +' '+ RightPad(FormatFloat('###,###,##0.00',
        FCdsProventos.FieldByName('VALORPROVENTO').asFloat),9);

      FTotalProv := FTotalProv + FCdsProventos.FieldByName('VALORPROVENTO').asFloat;

      FCdsProventos.Next;
    end
    else
      Lin := Replicate(' ',58);

    // Gerar linhas com os descontos
    if not(FCdsDescontos.EOF) then
    begin
      Lin := Lin +
        Replicate(' ',5) + LeftPad(FCdsDescontos.FieldByName('CODPROVDESC').asString,4);

      if (FCdsDescontos.FieldByName('REFERENCIA').asString = '***') or
         (FCdsDescontos.FieldByName('REFERENCIA').asString = 'Férias') or
         (FCdsProventos.FieldByName('REFERENCIA').asString = 'Ferias') then
        Lin := Lin + Replicate(' ',2) +
          LeftPad(FCdsDescontos.FieldByName('DESCRICAO').asString,40)
      else
        Lin := Lin + Replicate(' ',2) +
          LeftPad(Trim(FCdsDescontos.FieldByName('DESCRICAO').asString) +' '+
          Trim(FCdsDescontos.FieldByName('REFERENCIA').asString),40);

      Lin := Lin +' '+ RightPad(FormatFloat('###,###,##0.00',
        FCdsDescontos.FieldByName('VALORPROVENTO').asFloat),9);

      FTotalDesc := FTotalDesc + FCdsDescontos.FieldByName('VALORPROVENTO').asFloat;

      FCdsDescontos.Next;
    end;
    FArquivo.Add(Lin);
  end;

  // Saldos e Margem
  FArquivo.Add(' ');
  if (FCdsProventos.EOF) and (FCdsDescontos.EOF) then  // se acabou os detalhes
    FArquivo.Add(
      Replicate(' ',05) + RightPad(FormatFloat('###,###,##0.00', FTotalProv),20)+
      Replicate(' ',12) + RightPad(FormatFloat('###,###,##0.00', FTotalDesc),20)+
      Replicate(' ',12) + RightPad(FormatFloat('###,###,##0.00', FTotalProv - FTotalDesc),20)+
      Replicate(' ',12) + RightPad(FormatFloat('###,###,##0.00',
        FCdsMargem.FieldByName('VALORMARGEM').asFloat),20))
  else
    FArquivo.Add(Replicate(' ',37) +('(CONTINUA)'));

  // FGTS e conta bancaria
  FArquivo.Add(' ');
  if (FCdsProventos.EOF) and (FCdsDescontos.EOF) then  // se acabou os detalhes
    FArquivo.Add(
      Replicate(' ',05) + RightPad(FormatFloat('###,###,##0.00',
        FCdsFGTS.FieldByName('VALORFGTS').asFloat),20) +
      Replicate(' ',25) + LeftPad(FCdsPessoa.FieldByName('NUMBANCO').asString,10) +
      Replicate(' ',16) + LeftPad(FCdsPessoa.FieldByName('NUMAGENCIA').asString,10) +
      Replicate(' ',22) + LeftPad(FCdsPessoa.FieldByName('NUMCONTASALARIO').asString,20))
  else
    FArquivo.Add(' ');

  // Mensagem
  FArquivo.Add(' ');
  if (FCdsProventos.EOF) and (FCdsDescontos.EOF) then  // se acabou os detalhes
    FArquivo.Add(Replicate(' ',2) + LeftPad(Mensagem, 120))
  else
    FArquivo.Add(' ');

  // avanco final
  FArquivo.Add(' ');
  FArquivo.Add(' ');
  FArquivo.Add(' ');
  FArquivo.Add(' ');

  Result := FArquivo.Text;
end;

function TCtrlParamRelTxtCCheque.GerarModelo_REFER(AnoBarraMes, Mensagem: string): string;
var
  bOk, First: boolean;
  byAux: byte;
  n: word;
  i, k, y, iTotLin, iTotPes, iTotMov: integer;
  sTemp, Cod, MesAtual, Nome, MesAno1, MesAno2, sRefer, MesAno: string;
begin
  MesAno := Copy(AnoBarraMes,6,2) +'/'+ Copy(AnoBarraMes,1,4);
  y := 0;
  iTotLin := 0;
  iTotPes := FCdsPessoa.RecordCount;
  bOk := true;
  MesAno1 := Copy(AnoBarraMes,1,5)+CompStr(IntToStr(StrToInt(Copy(AnoBarraMes,6,2))+1),2,'0',true);
  MesAno2 := Copy(AnoBarraMes,1,5)+CompStr(IntToStr(StrToInt(Copy(AnoBarraMes,6,2))+2),2,'0',true);

  FArquivo.Clear;
  while not(FCdsPessoa.EOF) do
  begin
    Inc(y);
    iTotMov := FCdsProventos.RecordCount + FCdsDescontos.RecordCount;

    //LINHA_CAB_01
    FArquivo.Add('12'+CompStr('',48,' ',false)+MesAno+'   '+
          iff(iTotLin < 31,'1','2')+'/'+iff(iTotMov < 31,'1','2')+'       ');

    //LINHA_CAB_02
    FArquivo.Add(
      '-  '+CompStr(FCdsPessoa.FieldByName('NOMECC').asString,08,' ',false)+
      ' - '+CompStr(FCdsPessoa.FieldByName('CENTROCUSTO').asString,06,' ',false)+'  '+
      CompStr(FCdsPessoa.FieldByName('MATRICULA').asString,08,' ',true)+'  '+
      CompStr(FCdsPessoa.FieldByName('EMPREGADO').asString,38,' ',false));

    //LINHA_CAB_03
    FArquivo.Add(
      '-  '+CompStr(FCdsPessoa.FieldByName('NUMBANCO').asString,05,' ',false)+
      CompStr(FCdsPessoa.FieldByName('NUMAGENCIA').asString,07,' ',false)+
      CompStr(FCdsPessoa.FieldByName('NUMCONTASALARIO').asString,11,' ',false)+'  '+
      CompStr(FCdsPessoa.FieldByName('TITULO').asString,32,' ',false)+
      CompStr('N'+FCdsPessoa.FieldByName('IDFAIXACARGO').asString,07,' ',false));

    //LINHA_CAB_04
    if (FCdsPessoa.FieldByName('FUNCAO').asString <> '') then
      FArquivo.Add(
        '-  '+CompStr('   '+FCdsPessoa.FieldByName('CARTPROF').asString,10,' ',false)+'   '+
        FCdsPessoa.FieldByName('DATAADMISSAO').asString+'  '+
        CompStr(FCdsPessoa.FieldByName('FUNCAO').asString,30,' ',false)+
        CompStr(' '+FCdsPessoa.FieldByName('IDFUNCAO').asString,12,' ',false))
    else
      FArquivo.Add(
        '-  '+CompStr('   '+FCdsPessoa.FieldByName('CARTPROF').asString,10,' ',false)+'   '+
        FCdsPessoa.FieldByName('DATAADMISSAO').asString+'  '+
        CompStr(FCdsPessoa.FieldByName('FUNCAO').asString,30,'*',false)+
        CompStr(' '+FCdsPessoa.FieldByName('IDFUNCAO').asString,12,' ',false));

    MesAtual := AnoBarraMes;
    i := 2;
    for k:=1 to 1 do
    begin
      sTemp := '';
      First := true;

      if (FCdsProventos.EOF) and (First) then
      begin
        FArquivo.Add('-  ');
        First := false;
      end;

      if (iTotLin <> 31) then
      begin
        FCdsProventos.First;
        FTotalProv := 0;
      end;

      while not(FCdsProventos.EOF) do
      begin
        if (First) then
        begin
          Cod := '-  ';
          First := false;
        end
        else
          Cod := '   ';

        inc(iTotLin);
        if iTotLin = 31 then
        begin
          inc(iTotPes);
          break;
        end;

        sRefer := Trim(FCdsProventos.FieldByName('REFERENCIA').asString);

        if (sRefer = '***') or (sRefer = 'Férias') or (sRefer = 'Ferias') or
           (sRefer = '13.o Salar') then
          sRefer := '   ';

        case (k) of
          1 :
          if (FCdsProventos.FieldByName('MES').asString = MesAtual) then
          begin
            FArquivo.Add(Cod+
              CompStr(FCdsProventos.FieldByName('DESCRICAO').asString,30,' ',false)+' '+
              CompStr(FCdsProventos.FieldByName('CODPROVDESC').asString,05,' ',false)+' '+
              CompStr(sRefer,08,' ',false) + CompStr(FormatFloat('###,###,##0.00',
              FCdsProventos.FieldByName('VALORPROVENTO').asFloat),14,' ',true)+'+');

            FTotalProv := FTotalProv + FCdsProventos.FieldByName('VALORPROVENTO').asFloat;
          end
          else
          begin
            FCdsProventos.Next;
            FArquivo.Add(Cod);
          end;

          2 :
          if (FCdsProventos.FieldByName('MES').asString = MesAno1) then
          begin
            FArquivo.Add(Cod +
              CompStr(FCdsProventos.FieldByName('DESCRICAO').asString,30,' ',false)+'   '+
              CompStr(MesAno1,9,' ',true) +'   '+ CompStr(FormatFloat('###,###,##0.00',
              FCdsProventos.FieldByName('VALORPROVENTO').asFloat),17,' ',true));

            FTotalProv := FTotalProv + FCdsProventos.FieldByName('VALORPROVENTO').asFloat;
          end
          else
          begin
            FCdsProventos.Next;
            FArquivo.Add(Cod);
          end;

          3 :
          if (FCdsProventos.FieldByName('MES').asString = MesAno2) then
          begin
            FArquivo.Add(Cod+
              CompStr(FCdsProventos.FieldByName('DESCRICAO').asString,30,' ',false)+'   '+
              CompStr(MesAno1,9,' ',true) +'   '+ CompStr(FormatFloat('###,###,##0.00',
              FCdsProventos.FieldByName('VALORPROVENTO').asFloat),17,' ',true));

            FTotalProv := FTotalProv + FCdsProventos.FieldByName('VALORPROVENTO').asFloat;
          end
          else
          begin
            FCdsProventos.Next;
            FArquivo.Add(Cod);
          end;
        end;
        FCdsProventos.Next;
      end;

      if (FCdsDescontos.EOF) and (First) then
      begin
        FArquivo.Add('-  ');
        First := false;
      end;

      if (iTotLin <> 31) then
      begin
      FCdsDescontos.First;
        FTotalDesc := 0;
      end;

      while not(FCdsDescontos.EOF) do
      begin
        if (First) then
        begin
          Cod := IntToStr(i)+'2';
          First := false;
        end
        else
          Cod := '   ';

        inc(iTotLin);
        if iTotLin = 31 then
        begin
          inc(iTotPes);
          break;
        end;

        sRefer := Trim(FCdsDescontos.FieldByName('REFERENCIA').asString);

        if (sRefer = '***') or (sRefer = 'Férias') or (sRefer = 'Ferias') or
           (sRefer = '13.o Salar') then
          sRefer := '   ';

        case (k) of
          1 :
          if (FCdsDescontos.FieldByName('MES').asString = MesAtual) then
          begin
            FArquivo.Add(Cod +
              CompStr(FCdsDescontos.FieldByName('DESCRICAO').asString,30,' ',false)+' '+
              CompStr(FCdsDescontos.FieldByName('CODPROVDESC').asString,05,' ',false)+' '+
              CompStr(sRefer,08,' ',false)+ CompStr(FormatFloat('###,###,##0.00',
                FCdsDescontos.FieldByName('VALORPROVENTO').asFloat),14,' ',true)+'-');

            FTotalDesc := FTotalDesc + FCdsDescontos.FieldByName('VALORPROVENTO').asFloat;
          end
          else
          begin
            FCdsDescontos.Next;
            FArquivo.Add(Cod);
          end;

          2 :
          if (FCdsDescontos.FieldByName('MES').asString = MesAno1) then
          begin
            FArquivo.Add(Cod +
              CompStr(FCdsDescontos.FieldByName('DESCRICAO').asString,30,' ',false)+'   '+
              CompStr(mesano1,9,' ',true) +'   '+ CompStr(FormatFloat('###,###,##0.00',
                FCdsDescontos.FieldByName('VALORPROVENTO').asFloat),17,' ',true));

            FTotalDesc := FTotalDesc + FCdsDescontos.FieldByName('VALORPROVENTO').asFloat;
          end
          else                                        
          begin
            FCdsDescontos.Next;
            FArquivo.Add(Cod);
          end;

          3 :
          if (FCdsDescontos.FieldByName('MES').asString = MesAno2) then
          begin
            FArquivo.Add(Cod +
              CompStr(FCdsDescontos.FieldByName('DESCRICAO').asString,30,' ',false)+'   '+
              CompStr(MesAno2,9,' ',true) +'   '+ CompStr(FormatFloat('###,###,##0.00',
                FCdsDescontos.FieldByName('VALORPROVENTO').asFloat),17,' ',true));

            FTotalDesc := FTotalDesc + FCdsDescontos.FieldByName('VALORPROVENTO').asFloat;
          end
          else
          begin
            FCdsDescontos.Next;
            FArquivo.Add(Cod);
          end;
        end;
        FCdsDescontos.Next;
      end;
      Inc(i);
      MesAtual := Copy(AnoBarraMes,1,5)+CompStr(IntToStr(StrToInt(Copy(AnoBarraMes,6,2))+1),2,'0',true);
    end;

    if (iTotLin <> 31) then
    begin
      // LINHA_FECHAMENTO_24
      FArquivo.Add('22 '+CompStr(FormatFloat('###,###,##0.00',FTotalProv),18,' ',true)+'   '+
        CompStr(FormatFloat('###,###,##0.00',FTotalDesc),18,' ',true)+'   '+
        CompStr(FormatFloat('###,###,##0.00',FTotalProv-FTotalDesc),18,' ',true)+'       ');

      // LINHA_FECHAMENTO_25
      FArquivo.Add('-  '+CompStr(FormatFloat('###,###,##0.00',
          FCdsBaseInss.FieldByName('VALORBASEINSS').asFloat),18,' ',true)+'   '+
        CompStr(FormatFloat('###,###,##0.00',
          FCdsBaseIRRF.FieldByName('VALORBASEIRRF').asFloat),18,' ',true)+'   '+
        CompStr(FormatFloat('###,###,##0.00',
          FCdsFGTS.FieldByName('VALORFGTS').asFloat),18,' ',true)+'       ');

      // LINHA_FECHAMENTO_26
      FArquivo.Add('-2 '+CompStr('',58, ' ',true));

      Mensagem := AnsiUpperCase(Mensagem);
      byAux := 0;
      for n:=0 to 2 do
      begin
        sTemp := Replicate(' ', 62);

        for i:=1 to 62 do
          if (((i+(62*n))-byAux) <= length(Mensagem)) then
            sTemp[i] := Mensagem[(i+(62*n))-byAux];

        // Testar se o ultmo byte da linha (62) e diferente de branco
        // Sendo diferente iniciar um for c := 62 to 1 do até encontra um byte braco
        // Transferir esses bytes para ptemp e apaga-los de stemp
        // Iniciar i = 62 - c, tranferir de ptemp para stemp e ptemp = '';
        // Após iniciar i zerar c

        // Se próximo caracter do contador é menor ou igual ao tamanho da Mensagem,
        // o último caractere da linha e o primeiro caractere da próxima linha forem
        // diferentes de ESPAÇO, então quebre a palavra
        if (((i+(62*n)-1)-byAux) <= length(Mensagem)) and
           (sTemp[62] <> ' ') and (Mensagem[(i+(62*n)-1)-byAux] <> ' ') then
          for i:=62 downto 1 do
            if (sTemp[i] <> ' ') then
            begin
              sTemp[i] := ' ';
              Inc(byAux);
            end
            else
              break;

        FArquivo.Add(' 2 '+sTemp);
      end;
    end
    else
    begin
      // LINHA_FECHAMENTO_24
      FArquivo.Add('22 ');

      // LINHA_FECHAMENTO_25
      FArquivo.Add('-  ');

      // LINHA_FECHAMENTO_26
      FArquivo.Add('-2 '+CompStr('',58, ' ',true));

      // MENSAGEM DE CONTINUAÇÃO
      FArquivo.Add(' 2 ');
      FArquivo.Add(' 2      (CONTINUA NA PRÓXIMA PÁGINA');
      FArquivo.Add(' 2 ');
    end;

    if (y mod 2 = 0) or (iTotPes = y-1) or
       (iTotPes = 1) then
    begin
      if not(iTotPes = 1) then
      begin
        FArquivo.Add('32 '+CompStr('',46,' ',false)+MesAno+'   1/'+
          iff(iTotMov < 31,'1','2')+'       ');
        FArquivo.Add(Nome);
      end;

      FArquivo.Add('32 '+CompStr('',46,' ',false)+MesAno+'   '+
          iff(iTotLin < 31,'1','2')+'/'+iff(iTotMov < 31,'1','2')+'       ');
      FArquivo.Add(
        '-  '+CompStr(FCdsPessoa.FieldByName('NOMECC').asString,06,' ',false)+
        ' - '+CompStr(FCdsPessoa.FieldByName('CENTROCUSTO').asString,08,' ',false)+
        CompStr(FCdsPessoa.FieldByName('MATRICULA').asString,10,' ',true)+'    '+
        CompStr(FCdsPessoa.FieldByName('EMPREGADO').asString,38,' ',false));
    end;

    FArquivo.Add('+1');
    Nome := '-  '+CompStr(FCdsPessoa.FieldByName('NOMECC').asString,06,' ',false)+
            ' - '+CompStr(FCdsPessoa.FieldByName('CENTROCUSTO').asString,08,' ',false)+
            CompStr(FCdsPessoa.FieldByName('MATRICULA').asString,10,' ',true)+'    '+
            CompStr(FCdsPessoa.FieldByName('EMPREGADO').asString,38,' ',false);

    if (bOk) and (FCdsProventos.EOF) and (FCdsDescontos.EOF) then
    begin
      iTotLin := 0;
      FCdsPessoa.Next;
      IncProgresso;
      SelecionarRubricasPessoa;
    end;  
  end;

  // Final
  if ((y mod 2) <> 0) then
  begin
    FArquivo.Add('12');
    FArquivo.Add('- ');
    FArquivo.Add('- ');
    FArquivo.Add('- ');
    FArquivo.Add('- ');
    FArquivo.Add('22');
    FArquivo.Add('- ');
    FArquivo.Add('-2');
    FArquivo.Add(' 2');
    FArquivo.Add('32 ' +CompStr('',46,' ',false)+ MesAno +'   1/1         ');
    FArquivo.Add(Nome);
    FArquivo.Add('32');
    FArquivo.Add('- ');
    FArquivo.Add('+1');
  end;

  Result := FArquivo.Text;
end;

function TCtrlParamRelTxtCCheque.GerarModelo_FUNCEF(AnoBarraMes, NomeArqFrente,
  NomeArqVerso: string; bAutonomo: boolean): string;
var
  Alt: double;
  TotalDesc, TotalProv: array[1..2] of double;
  MesExtAno: string;
  i, j, k1, k2, iMaxProv, iMaxDesc: integer;
  ArrPessoa: array[1..2, 1..17] of string;
  ArrProv, ArrDesc: array[1..2, 1..150] of string;
begin
  FArquivo.Clear;

  MesExtAno := UpperCase(MesLongo[StrToInt(Copy(AnoBarraMes,6,2))]) +'/'+ Copy(AnoBarraMes,1,4);
  NomeArqFrente := Trim(NomeArqFrente);
  NomeArqVerso := Trim(NomeArqVerso);

  FCdsPessoa.First;
  TotalDesc[1] := 0;
  TotalProv[1] := 0;
  TotalDesc[2] := 0;
  TotalProv[2] := 0;
  iMaxProv := 0;
  iMaxDesc := 0;
  i := 0;
  while (true) do
  begin
    Inc(i);
    j := (i mod 2);

    if (j = 0) then
      j := 2;

    if (j = 1) then
    begin
      if (FCdsPessoa.EOF) then
        break;

      for k1:=1 to 2 do
        for k2:=1 to 17 do
          ArrPessoa[k1,k2] := '';

      for k1:=1 to 2 do
        for k2:=1 to 150 do
          ArrProv[k1,k2] := '';

      for k1:=1 to 2 do
        for k2:=1 to 150 do
          ArrDesc[k1,k2] := '';

      //LINHA_CAB_01
      FArquivo.Add('%!PS');
      FArquivo.Add('%XRXrequirements:duplex');
      FArquivo.Add('/cm {72 mul 2.545 div} def');

      // linha abaixo indica o caminho e o nome da imagem
      FArquivo.Add('(' +NomeArqVerso+ ')GetTiff');
      FArquivo.Add('/Courier 7 selectfont');
      FArquivo.Add('595 0 CMTranslate');
      FArquivo.Add('90 rotate');
      FArquivo.Add(' ');
      iMaxProv := 0;
      iMaxDesc := 0;
      TotalDesc[1] := 0;
      TotalProv[1] := 0;
      TotalDesc[2] := 0;
      TotalProv[2] := 0;
    end;

    if not(FCdsPessoa.EOF) then
    begin
      ArrPessoa[j,01] := CompStr(FCdsPessoa.FieldByName('EMPREGADO').asString,50,' ',false);
      ArrPessoa[j,02] := CompStr(FCdsPessoa.FieldByName('MATRICULA').asString,10,'0',true);
      if (not bAutonomo) then
      begin
        ArrPessoa[j,03] := CompStr(FCdsPessoa.FieldByName('NOMECC').asString,40,' ',false);
        ArrPessoa[j,04] := CompStr(FCdsPessoa.FieldByName('NUMAGENCIA').asString,06,' ',false);
        ArrPessoa[j,05] := CompStr(FCdsPessoa.FieldByName('NUMCONTASALARIO').asString,13,' ',true);

        if (FCdsPessoa.FieldByName('FUNCAO').asString <> '') then
          ArrPessoa[j,6] := CompStr(FCdsPessoa.FieldByName('FUNCAO').asString,40,' ',false)
        else
          ArrPessoa[j,6] := CompStr(FCdsPessoa.FieldByName('TITULO').asString,40,' ',false);

        ArrPessoa[j,07] := CompStr(FCdsPessoa.FieldByName('NUMDEPSALF').asString,02,'0',true);
        ArrPessoa[j,08] := CompStr(FCdsPessoa.FieldByName('NUMDEPIRRF').asString,02,'0',true);
        ArrPessoa[j,09] := RightPad(FormatFloat('###,###,##0.00',FCdsSalBase.FieldByName('SALBASE').asFloat),12);
        ArrPessoa[j,10] := RightPad(FormatFloat('###,###,##0.00',FCdsBaseInss.FieldByName('VALORBASEINSS').asFloat),12);
        ArrPessoa[j,11] := RightPad(FormatFloat('###,###,##0.00',FCdsSalParticip.FieldByName('VALORSALPART').asFloat),12);
        ArrPessoa[j,12] := RightPad(FormatFloat('###,###,##0.00',FCdsBaseIRRF.FieldByName('VALORBASEIRRF').asFloat),12);
        ArrPessoa[j,13] := RightPad(FormatFloat('###,###,##0.00',FCdsFGTS.FieldByName('VALORFGTS').asFloat),12);
        ArrPessoa[j,14] := RightPad(FormatFloat('###,###,##0.00',FCdsMargem.FieldByName('VALORMARGEM').asFloat),12);
        ArrPessoa[j,15] := CompStr(FCdsPessoa.FieldByName('CENTROCUSTO').asString,10,' ',false);
        ArrPessoa[j,16] := CompStr(MesExtAno,15,' ',false);
        ArrPessoa[j,17] := RightPad(FormatFloat('###,###,##0.00',FCdsMargem2.FieldByName('VALORMARGEM').asFloat),12);
      end
      else
      begin
        ArrPessoa[j,03] := CompStr(FCdsPessoa.FieldByName('TITULO').asString,40,' ',false);
        ArrPessoa[j,04] := CompStr(FCdsPessoa.FieldByName('NUMBANCO').asString,06,' ',false);
        ArrPessoa[j,05] := CompStr(FCdsPessoa.FieldByName('NUMAGENCIA').asString,06,' ',false);
        ArrPessoa[j,06] := CompStr(' ',10,' ',false) +
                           CompStr(FCdsPessoa.FieldByName('PIS').asString,28,' ',false) +
                           CompStr(FCdsPessoa.FieldByName('CPF').asString,12,' ',false);
        ArrPessoa[j,07] := CompStr(FCdsPessoa.FieldByName('NUMCONTASALARIO').asString,15,' ',false);

        ArrPessoa[j,09] := RightPad(FormatFloat('###,###,##0.00',FCdsSalBase.FieldByName('SALBASE').asFloat),12);
        ArrPessoa[j,10] := RightPad(FormatFloat('###,###,##0.00',FCdsBaseInss.FieldByName('VALORBASEINSS').asFloat),12);
        ArrPessoa[j,12] := RightPad(FormatFloat('###,###,##0.00',FCdsBaseIRRF.FieldByName('VALORBASEIRRF').asFloat),12);
        ArrPessoa[j,13] := RightPad(FormatFloat('###,###,##0.00',FCdsBaseFGTS.FieldByName('BASEFGTS').asFloat),12);
        ArrPessoa[j,14] := '     '+CompStr(FCdsPessoa.FieldByName('NUMDEPIRRF').asString,02,'0',true)+'     ';
        ArrPessoa[j,15] := CompStr(FCdsPessoa.FieldByName('CENTROCUSTO').asString,10,' ',false);
        ArrPessoa[j,16] := CompStr(MesExtAno,15,' ',false);
        ArrPessoa[j,17] := '';
      end;

      k1 := 0;
      while not(FCdsProventos.EOF) do
      begin
        Inc(k1);
        ArrProv[j,(k1-1)*3+1] := LeftPad(FCdsProventos.FieldByName('CODPROVDESC').asString,5);
        ArrProv[j,(k1-1)*3+2] := LeftPad(FCdsProventos.FieldByName('DESCRICAO').asString,40);
        if (FCdsProventos.FieldByName('REFERENCIA').asString <> '***') and
           (FCdsProventos.FieldByName('REFERENCIA').asString <> 'Férias') and
           (FCdsProventos.FieldByName('REFERENCIA').asString <> 'Ferias') then
          ArrProv[j,(k1-1)*3+2] := ArrProv[j,(k1-1)*3+2] +' '+
            FCdsProventos.FieldByName('REFERENCIA').asString;

        ArrProv[j,(k1-1)*3+3] := RightPad(FormatFloat('###,###,##0.00',
          FCdsProventos.FieldByName('VALORPROVENTO').asFloat),15);
        TotalProv[j] := TotalProv[j] + FCdsProventos.FieldByName('VALORPROVENTO').asFloat;
        FCdsProventos.Next;
      end;

      if (k1 > iMaxProv) then
        iMaxProv := k1;

      k1 := 0;
      while not(FCdsDescontos.EOF) do
      begin
        Inc(k1);
        ArrDesc[j,(k1-1)*3+1] := LeftPad(FCdsDescontos.FieldByName('CODPROVDESC').asString,5);
        ArrDesc[j,(k1-1)*3+2] := LeftPad(FCdsDescontos.FieldByName('DESCRICAO').asString,40);

        if (FCdsDescontos.FieldByName('REFERENCIA').asString <> '***') and
           (FCdsDescontos.FieldByName('REFERENCIA').asString <> 'Férias') and
           (FCdsDescontos.FieldByName('REFERENCIA').asString <> 'Ferias') then
          ArrDesc[j,(k1-1)*3+2] := ArrDesc[j,(k1-1)*3+2] +' '+
            FCdsDescontos.FieldByName('REFERENCIA').asString;

        ArrDesc[j,(k1-1)*3+3] := RightPad(FormatFloat('###,###,##0.00',
          FCdsDescontos.FieldByName('VALORPROVENTO').asFloat),15);
        TotalDesc[j] := TotalDesc[j] + FCdsDescontos.FieldByName('VALORPROVENTO').asFloat;
        FCdsDescontos.Next;
      end;

      if (k1 > iMaxDesc) then
        iMaxDesc := k1;
    end;

    if (j = 2) then
    begin
      FArquivo.Add('10.05 cm 19.3 cm moveto');
      FArquivo.Add('(' +ArrPessoa[1,16]+ ') show');
      FArquivo.Add('25.0 cm 19.3 cm moveto');
      FArquivo.Add('(' +ArrPessoa[2,16]+ ') show');
      FArquivo.Add(' ');
      //LINHA_CAB_02
      FArquivo.Add('1.8 cm 17.0 cm moveto');
      FArquivo.Add('(' +ArrPessoa[1,1]+ ') show');
      FArquivo.Add('11.35 cm 17.0 cm moveto');
      FArquivo.Add('(' +ArrPessoa[1,2]+ ') show');
      FArquivo.Add('16.8 cm 17.0 cm moveto');
      FArquivo.Add('(' +ArrPessoa[2,1]+ ') show');
      FArquivo.Add('26.3 cm 17.0 cm moveto');
      FArquivo.Add('(' +ArrPessoa[2,2]+ ') show');
      FArquivo.Add(' ');
      //LINHA_CAB_03
      FArquivo.Add('1.8 cm 16.35 cm moveto');
      FArquivo.Add('(' +ArrPessoa[1,3]+ ') show');
      FArquivo.Add('09.8 cm 16.35 cm moveto');
      FArquivo.Add('(' +ArrPessoa[1,4]+ ') show');
      if (not bAutonomo) then
        FArquivo.Add('11.0 cm 16.35 cm moveto')
      else
        FArquivo.Add('11.3 cm 16.35 cm moveto');
      FArquivo.Add('(' +ArrPessoa[1,5]+ ') show');
      FArquivo.Add('16.8 cm 16.35 cm moveto');
      FArquivo.Add('(' +ArrPessoa[2,3]+ ') show');
      FArquivo.Add('24.5 cm 16.35 cm moveto');
      FArquivo.Add('(' +ArrPessoa[2,4]+ ') show');
      if (not bAutonomo) then
        FArquivo.Add('25.95 cm 16.35 cm moveto')
      else
        FArquivo.Add('26.25 cm 16.35 cm moveto');
      FArquivo.Add('(' +ArrPessoa[2,5]+ ') show');
      FArquivo.Add(' ');
      //LINHA_CAB_04
      FArquivo.Add('1.8 cm 15.7 cm moveto');
      FArquivo.Add('(' +ArrPessoa[1,6]+ ') show');
      if (not bAutonomo) then
        FArquivo.Add('11.4 cm 15.7 cm moveto')
      else
        FArquivo.Add('11.2 cm 15.7 cm moveto');
      FArquivo.Add('(' +ArrPessoa[1,7]+ ') show');
      FArquivo.Add('12.55 cm 15.7 cm moveto');
      if (not bAutonomo) then
        FArquivo.Add('(' +ArrPessoa[1,8]+ ') show');
      FArquivo.Add('16.8 cm 15.7 cm moveto');
      FArquivo.Add('(' +ArrPessoa[2,6]+ ') show');
      if (not bAutonomo) then
        FArquivo.Add('26.3 cm 15.7 cm moveto')
      else
        FArquivo.Add('26.0 cm 15.7 cm moveto');
      FArquivo.Add('(' +ArrPessoa[2,7]+ ') show');
      FArquivo.Add('27.5 cm 15.7 cm moveto');
      if (not bAutonomo) then
        FArquivo.Add('(' +ArrPessoa[2,8]+ ') show');
      FArquivo.Add(' ');

      // PROVENTOS E DESCONTOS
      Alt := 15.15;
      for k1:=1 to iMaxProv do
      begin
        Alt := Alt - 0.35;
        FArquivo.Add('1.75 cm ' +Float2String(Alt)+ ' cm moveto');
        FArquivo.Add('(' +ArrProv[1,(k1-1)*3+1]+ ') show');
        FArquivo.Add('2.95 cm ' +Float2String(Alt)+ ' cm moveto');
        FArquivo.Add('(' +ArrProv[1,(k1-1)*3+2]+ ') show');
        FArquivo.Add('09.7 cm ' +Float2String(Alt)+ ' cm moveto');
        FArquivo.Add('(     ) show');
        FArquivo.Add('10.7 cm ' +Float2String(Alt)+ ' cm moveto');
        FArquivo.Add('(' +ArrProv[1,(k1-1)*3+3]+ ') show');
        FArquivo.Add('16.7 cm ' +Float2String(Alt)+ ' cm moveto');
        FArquivo.Add('(' +ArrProv[2,(k1-1)*3+1]+ ') show');
        FArquivo.Add('17.9 cm ' +Float2String(Alt)+ ' cm moveto');
        FArquivo.Add('(' +ArrProv[2,(k1-1)*3+2]+ ') show');
        FArquivo.Add('24.7 cm ' +Float2String(Alt)+ ' cm moveto');
        FArquivo.Add('(     ) show');
        FArquivo.Add('25.7 cm ' +Float2String(Alt)+ ' cm moveto');
        FArquivo.Add('(' +ArrProv[2,(k1-1)*3+3]+ ') show');
        FArquivo.Add(' ');
      end;

      Alt := Alt - 0.35;
      FArquivo.Add('1.75 cm ' +Float2String(Alt)+ ' cm moveto');
      FArquivo.Add('() show');
      FArquivo.Add('2.95 cm ' +Float2String(Alt)+ ' cm moveto');
      FArquivo.Add('() show');
      FArquivo.Add('09.7 cm ' +Float2String(Alt)+ ' cm moveto');
      FArquivo.Add('() show');
      FArquivo.Add('10.7 cm ' +Float2String(Alt)+ ' cm moveto');
      FArquivo.Add('() show');
      FArquivo.Add('16.7 cm ' +Float2String(Alt)+ ' cm moveto');
      FArquivo.Add('() show');
      FArquivo.Add('17.9 cm ' +Float2String(Alt)+ ' cm moveto');
      FArquivo.Add('() show');
      FArquivo.Add('24.7 cm ' +Float2String(Alt)+ ' cm moveto');
      FArquivo.Add('() show');
      FArquivo.Add('25.7 cm ' +Float2String(Alt)+ ' cm moveto');
      FArquivo.Add('() show');
      FArquivo.Add(' ');

      for k1:=1 to iMaxDesc do
      begin
        Alt := Alt - 0.35;
        FArquivo.Add('1.75 cm ' +Float2String(Alt)+ ' cm moveto');
        FArquivo.Add('(' +ArrDesc[1,(k1-1)*3+1]+ ') show');
        FArquivo.Add('2.95 cm ' +Float2String(Alt)+ ' cm moveto');
        FArquivo.Add('(' +ArrDesc[1,(k1-1)*3+2]+ ') show');
        FArquivo.Add('09.7 cm ' +Float2String(Alt)+ ' cm moveto');
        FArquivo.Add('(     ) show');
        FArquivo.Add('10.7 cm ' +Float2String(Alt)+ ' cm moveto');
        FArquivo.Add('(' +ArrDesc[1,(k1-1)*3+3]+ ') show');
        FArquivo.Add('16.7 cm ' +Float2String(Alt)+ ' cm moveto');
        FArquivo.Add('(' +ArrDesc[2,(k1-1)*3+1]+ ') show');
        FArquivo.Add('17.9 cm ' +Float2String(Alt)+ ' cm moveto');
        FArquivo.Add('(' +ArrDesc[2,(k1-1)*3+2]+ ') show');
        FArquivo.Add('24.7 cm ' +Float2String(Alt)+ ' cm moveto');
        FArquivo.Add('(     ) show');
        FArquivo.Add('25.7 cm ' +Float2String(Alt)+ ' cm moveto');
        FArquivo.Add('(' +ArrDesc[2,(k1-1)*3+3]+ ') show');
        FArquivo.Add(' ');
      end;

      Alt := Alt - 0.35;
      FArquivo.Add('1.75 cm ' +Float2String(Alt)+ ' cm moveto');
      FArquivo.Add('() show');
      FArquivo.Add('2.95 cm ' +Float2String(Alt)+ ' cm moveto');
      FArquivo.Add('() show');
      FArquivo.Add('09.7 cm ' +Float2String(Alt)+ ' cm moveto');
      FArquivo.Add('() show');
      FArquivo.Add('10.7 cm ' +Float2String(Alt)+ ' cm moveto');
      FArquivo.Add('() show');
      FArquivo.Add('16.7 cm ' +Float2String(Alt)+ ' cm moveto');
      FArquivo.Add('() show');
      FArquivo.Add('17.9 cm ' +Float2String(Alt)+ ' cm moveto');
      FArquivo.Add('() show');
      FArquivo.Add('24.7 cm ' +Float2String(Alt)+ ' cm moveto');
      FArquivo.Add('() show');
      FArquivo.Add('25.7 cm ' +Float2String(Alt)+ ' cm moveto');
      FArquivo.Add('() show');
      FArquivo.Add(' ');

      // saldos e margem
      FArquivo.Add('2.5 cm 5.2 cm moveto');
      FArquivo.Add('(' +ArrPessoa[1,09]+ ') show');
      FArquivo.Add('5.4 cm 5.2 cm moveto');
      FArquivo.Add('(' +RightPad(FormatFloat('###,###,##0.00', TotalProv[1]),12)+ ') show');
      FArquivo.Add('8.3 cm 5.2 cm moveto');
      FArquivo.Add('(' +RightPad(FormatFloat('###,###,##0.00', TotalDesc[1]),12)+ ') show');
      FArquivo.Add('11.2 cm 5.2 cm moveto');
      FArquivo.Add('(' +RightPad(FormatFloat('###,###,##0.00', TotalProv[1] - TotalDesc[1]),12)+ ') show');
      FArquivo.Add('17.5 cm 5.2 cm moveto');
      FArquivo.Add('(' + ArrPessoa[2,09] + ') show');
      FArquivo.Add('20.4 cm 5.2 cm moveto');
      FArquivo.Add('(' +RightPad(FormatFloat('###,###,##0.00', TotalProv[2]),12)+ ') show');
      FArquivo.Add('23.3 cm 5.2 cm moveto');
      FArquivo.Add('(' +RightPad(FormatFloat('###,###,##0.00', TotalDesc[2]),12)+ ') show');
      FArquivo.Add('26.2 cm 5.2 cm moveto');
      FArquivo.Add('(' +RightPad(FormatFloat('###,###,##0.00', TotalProv[2] - TotalDesc[2]),12)+ ') show');
      FArquivo.Add(' ');
      if (not bAutonomo) then
      begin
        FArquivo.Add('1.5 cm 4.05 cm moveto');
        FArquivo.Add('(' +ArrPessoa[1,10]+ ') show');
        FArquivo.Add('3.4 cm 4.05 cm moveto');
        FArquivo.Add('(' +ArrPessoa[1,11]+ ') show');
        FArquivo.Add('5.3 cm 4.05 cm moveto');
        FArquivo.Add('(' +ArrPessoa[1,12]+ ') show');
        FArquivo.Add('7.2 cm 4.05 cm moveto');
        FArquivo.Add('(' +ArrPessoa[1,13]+ ') show');
        FArquivo.Add('9.1 cm 4.05 cm moveto');
        FArquivo.Add('(' +ArrPessoa[1,14]+ ') show');
        FArquivo.Add('11.2 cm 4.05 cm moveto');
        FArquivo.Add('(' +ArrPessoa[1,17]+ ') show');

        FArquivo.Add('16.5 cm 4.05 cm moveto');
        FArquivo.Add('(' +ArrPessoa[2,10]+ ') show');
        FArquivo.Add('18.4 cm 4.05 cm moveto');
        FArquivo.Add('(' +ArrPessoa[2,11]+ ') show');
        FArquivo.Add('20.3 cm 4.05 cm moveto');
        FArquivo.Add('(' +ArrPessoa[2,12]+ ') show');
        FArquivo.Add('22.2 cm 4.05 cm moveto');
        FArquivo.Add('(' +ArrPessoa[2,13]+ ') show');
        FArquivo.Add('24.1 cm 4.05 cm moveto');
        FArquivo.Add('(' +ArrPessoa[2,14]+ ') show');
        FArquivo.Add('26.2 cm 4.05 cm moveto');
        FArquivo.Add('(' +ArrPessoa[2,17]+ ') show');
      end
      else
      begin
        FArquivo.Add('2.50 cm 4.05 cm moveto');
        FArquivo.Add('(' +ArrPessoa[1,10]+ ') show');
        FArquivo.Add('5.40 cm 4.05 cm moveto');
        FArquivo.Add('(' +ArrPessoa[1,12]+ ') show');
        FArquivo.Add('8.30 cm 4.05 cm moveto');
        FArquivo.Add('(' +ArrPessoa[1,13]+ ') show');
        FArquivo.Add('11.20 cm 4.05 cm moveto');
        FArquivo.Add('(' +ArrPessoa[1,14]+ ') show');

        FArquivo.Add('17.50 cm 4.05 cm moveto');
        FArquivo.Add('(' +ArrPessoa[2,10]+ ') show');
        FArquivo.Add('20.40 cm 4.05 cm moveto');
        FArquivo.Add('(' +ArrPessoa[2,12]+ ') show');
        FArquivo.Add('23.30 cm 4.05 cm moveto');
        FArquivo.Add('(' +ArrPessoa[2,13]+ ') show');
        FArquivo.Add('26.20 cm 4.05 cm moveto');
        FArquivo.Add('(' +ArrPessoa[2,14]+ ') show');
      end;

      FArquivo.Add('showpage');
      FArquivo.Add(' ');

      // FRENTE DO FORM.
      // linha abaixo indica o caminho e o nome da imagem
      FArquivo.Add('(' +NomeArqFrente+ ')GetTiff');
      FArquivo.Add('/Courier 7 selectfont');
      FArquivo.Add('595 0 CMTranslate');
      FArquivo.Add('90 rotate');
      FArquivo.Add('10.2 cm 11.5 cm moveto');
      FArquivo.Add('(' +ArrPessoa[1,16]+ ') show');
      FArquivo.Add('25.25 cm 11.5 cm moveto');
      FArquivo.Add('(' +ArrPessoa[2,16]+ ') show');
      FArquivo.Add('1.9 cm 8.35 cm moveto');
      FArquivo.Add('(' +ArrPessoa[1,01]+ ') show');
      FArquivo.Add('11.3 cm 8.35 cm moveto');
      FArquivo.Add('(' +ArrPessoa[1,02]+ ') show');
      FArquivo.Add('16.9 cm 8.35 cm moveto');
      FArquivo.Add('(' +ArrPessoa[2,01]+ ') show');
      FArquivo.Add('26.3 cm 8.35 cm moveto');
      FArquivo.Add('(' +ArrPessoa[2,02]+ ') show');
      FArquivo.Add('1.9 cm 7.7 cm moveto');
      FArquivo.Add('(' +ArrPessoa[1,03]+ ') show');
      FArquivo.Add('11.3 cm 7.7 cm moveto');
      FArquivo.Add('(' +ArrPessoa[1,15]+ ') show');
      FArquivo.Add('16.9 cm 7.7 cm moveto');
      FArquivo.Add('(' +ArrPessoa[2,03]+ ') show');
      FArquivo.Add('26.3 cm 7.7 cm moveto');
      FArquivo.Add('(' +ArrPessoa[2,15]+ ') show');
      FArquivo.Add(' ');
      FArquivo.Add('showpage');
      FArquivo.Add(' ');
//      end;
    end;

    // proximo registro
    if (FCdsProventos.EOF) and (FCdsDescontos.EOF) then   // se acabou os detalhes
    begin
      if (FCdsPessoa.EOF) then
        break;

      FCdsPessoa.Next;
      IncProgresso;
      SelecionarRubricasPessoa;
    end;
  end;

  Result := FArquivo.Text;
end;

function TCtrlParamRelTxtCCheque.GerarModelo_FCRT(AnoBarraMes: string; DataPag: TDate): string;
var
  n: word;
  Lin: string;
begin
  FArquivo.Clear;

  FCdsPessoa.First;
  FTotalDesc := 0;
  FTotalProv := 0;
  while not(FCdsPessoa.EOF) do
  begin
    FArquivo.Add(' ');
    FArquivo.Add(' ');
    FArquivo.Add(' ');
    FArquivo.Add(' ');
    FArquivo.Add(' ');
    // matricula, nome, mesref
    FArquivo.Add(
      Replicate(' ',02)+ LeftPad(FCdsPessoa.FieldByName('MATRICULA').asString,8)+
      Replicate(' ',13)+ LeftPad(Trim(FCdsPessoa.FieldByName('EMPREGADO').asString),70)+
      Replicate(' ',13)+ Copy(AnoBarraMes,6,2) +'/'+ Copy(AnoBarraMes,1,4));

    // PROVENTOS
    FArquivo.Add(' ');
    for n:=1 to 16 do
    begin
      Lin := '';
      if not(FCdsProventos.EOF) then
      begin
        Lin := Replicate(' ',2)+ LeftPad(FCdsProventos.FieldByName('CODPROVDESC').asString,5);

        if (FCdsProventos.FieldByName('REFERENCIA').asString = '***') or
           (FCdsProventos.FieldByName('REFERENCIA').asString = 'Férias') or
           (FCdsProventos.FieldByName('REFERENCIA').asString = 'Ferias') then
          Lin := Lin+
            Replicate(' ',1)+ LeftPad(FCdsProventos.FieldByName('DESCRICAO').asString,48)
        else
          Lin := Lin+
            Replicate(' ',1)+ LeftPad(Trim(FCdsProventos.FieldByName('DESCRICAO').asString)+
            ' '+ Trim(FCdsProventos.FieldByName('REFERENCIA').asString),48);

        Lin := Lin+
          Replicate(' ',1)+ RightPad(FormatFloat('###,###,##0.00',
            FCdsProventos.FieldByName('VALORPROVENTO').asFloat),9);

        FTotalProv := FTotalProv + FCdsProventos.FieldByName('VALORPROVENTO').asFloat;

        FCdsProventos.Next;
      end
      else
        Lin := Replicate(' ',66);

      if not(FCdsDescontos.EOF) then
      begin
        Lin := Lin+
          Replicate(' ',3)+ LeftPad(FCdsDescontos.FieldByName('CODPROVDESC').asString,5);

        if (FCdsDescontos.FieldByName('REFERENCIA').asString = '***') or
           (FCdsDescontos.FieldByName('REFERENCIA').asString = 'Férias') or
           (FCdsProventos.FieldByName('REFERENCIA').asString = 'Ferias') then
          Lin := Lin+
            Replicate(' ',1)+ LeftPad(FCdsDescontos.FieldByName('DESCRICAO').asString,48)
        else
          Lin := Lin+
            Replicate(' ',1)+ LeftPad(Trim(FCdsDescontos.FieldByName('DESCRICAO').asString)+
            ' '+ Trim(FCdsDescontos.FieldByName('REFERENCIA').asString),48);

        Lin := Lin+
          Replicate(' ',1)+ RightPad(FormatFloat('###,###,##0.00',
            FCdsDescontos.FieldByName('VALORPROVENTO').asFloat),9);

        FTotalDesc := FTotalDesc + FCdsDescontos.FieldByName('VALORPROVENTO').asFloat;

        FCdsDescontos.Next;
      end;
      FArquivo.Add(Lin);
    end;

    // saldos
    FArquivo.Add(' ');
    if (FCdsProventos.EOF) and (FCdsDescontos.EOF) then  // se acabou os detalhes
    begin
      FArquivo.Add(
        Replicate(' ',46)+ RightPad(FormatFloat('###,###,##0.00',FTotalProv),20) +
        Replicate(' ',48)+ RightPad(FormatFloat('###,###,##0.00',FTotalDesc),20));

      FArquivo.Add(
        Replicate(' ',46)+ RightPad(DateToStr(DataPag),20));
      FArquivo.Add(
        Replicate(' ',114)+ RightPad(FormatFloat('###,###,##0.00',FTotalProv - FTotalDesc),20));
    end
    else
    begin
      FArquivo.Add(' ');
      FArquivo.Add(Replicate(' ',114)+ '(CONTINUA)');
    end;

    // FGTS e bases
    FArquivo.Add(' ');
    if (FCdsProventos.EOF) and (FCdsDescontos.EOF) then  // se acabou os detalhes
      FArquivo.Add(
        Replicate(' ',06)+ RightPad(FormatFloat('###,###,##0.00', FCdsBaseInss.FieldByName('VALORBASEINSS').asFloat),20)+
        Replicate(' ',06)+ RightPad(FormatFloat('###,###,##0.00', FCdsFGTS.FieldByName('VALORFGTS').asFloat/0.08),20)+
        Replicate(' ',06)+ RightPad(FormatFloat('###,###,##0.00', FCdsFGTS.FieldByName('VALORFGTS').asFloat),20)+
        Replicate(' ',06)+ RightPad(FormatFloat('###,###,##0.00', FCdsBaseINSS.FieldByName('VALORBASEINSS').asFloat),20))
    else
      FArquivo.Add(' ');

    // avanco final
    FArquivo.Add(' ');
    FArquivo.Add(' ');
    FArquivo.Add(' ');
    FArquivo.Add(' ');

    if (FCdsProventos.EOF) and (FCdsDescontos.EOF) then
    begin
      FTotalDesc := 0;
      FTotalProv := 0;
      FCdsPessoa.Next;
      IncProgresso;
      SelecionarRubricasPessoa;
    end;
  end;

  Result := FArquivo.Text;
end;

function TCtrlParamRelTxtCCheque.GerarModelo_CTRQ(AnoBarraMes, NomeEmpresa, Mensagem: string;
  DataPag: TDate; SelPeriodo: boolean): string;
var
  MesAtual, MesAno1, MesAno2, sRefer: string;
begin
  MesAno1 := CompStr(PoeZero(StrToInt(Copy(AnoBarraMes,6,2))-1),2,'0',true) +'/'+ Copy(AnoBarraMes,1,4);
  MesAno2 := CompStr(Copy(AnoBarraMes,6,2),2,'0',true) +'/'+ Copy(AnoBarraMes,1,4);

  if (Copy(MesAno1,1,2) = '00') then
    MesAno1 := '01/' + Copy(AnoBarraMes,1,4);

  if (SelPeriodo) then
    MesAtual := '21/' +MesAno1+ ' ATE 20/' +MesAno2
  else
    MesAtual := '';

  FArquivo.Clear;
  FCdsPessoa.First;
  while not(FCdsPessoa.EOF) do
  begin
    FArquivo.Add(' ');
    // LINHA_CAB_01
    FArquivo.Add('1'+
      CompStr(NomeEmpresa,26,' ',false)+
      CompStr(FCdsPessoa.FieldByName('CNPJ').asString,15,' ',false)+
      CompStr(FCdsPessoa.FieldByName('EMPRESA').asString,39,' ',false)+
      CompStr(FCdsPessoa.FieldByName('MATRICULA').asString,11,' ',false)+
      CompStr(FCdsPessoa.FieldByName('EMPREGADO').asString,39,' ',false)+
      CompStr(FCdsPessoa.FieldByName('DATAADMISSAO').asString,10,' ',false)+
      CompStr(MesExtensoAno(AnoBarraMes),20,' ',false)+
      CompStr(FCdsPessoa.FieldByName('TITULO').asString,50,' ',false)+
      CompStr(FCdsPessoa.FieldByName('NOMECC').asString,50,' ',false)+
      CompStr(MesAtual,25,' ',false)+   // Periodo
      CompStr(FCdsPessoa.FieldByName('NOMEHORARIO').asString,80,' ',false));

    FTotalProv := 0;
    FTotalDesc := 0;
    FCdsProventos.First;
    while not(FCdsProventos.EOF) do
    begin
      sRefer := Trim(FCdsProventos.FieldByName('REFERENCIA').asString);

      if (sRefer = '***') or (sRefer = 'Férias') or (sRefer = 'Ferias') or
         (sRefer = '13.o Salar') then
        sRefer := '   ';

      FArquivo.Add('2'+
        CompStr(FCdsProventos.FieldByName('DESCRICAO').asString,50,' ',false)+
        CompStr(sRefer,10,' ',true) + CompStr(FormatFloat('###,###,##0.00',
          FCdsProventos.FieldByName('VALORPROVENTO').asFloat),15,' ',true));

      FTotalProv := FTotalProv + FCdsProventos.FieldByName('VALORPROVENTO').asFloat;
      FCdsProventos.Next;
    end;

    FCdsDescontos.First;
    while not(FCdsDescontos.EOF) do
    begin
      sRefer := Trim(FCdsDescontos.FieldByName('REFERENCIA').asString);

      if (sRefer = '***') or (sRefer = 'Férias') or (sRefer = 'Ferias') or
         (sRefer = '13.o Salar') then
        sRefer := '   ';

      FArquivo.Add('2'+
        CompStr(FCdsDescontos.FieldByName('DESCRICAO').asString,50,' ',false)+
        CompStr(sRefer,10,' ',true) + CompStr('',15,' ',false)+
        CompStr(FormatFloat('###,###,##0.00',
          FCdsDescontos.FieldByName('VALORPROVENTO').asFloat),15,' ',true));

      FTotalDesc := FTotalDesc + FCdsDescontos.FieldByName('VALORPROVENTO').asFloat;
      FCdsDescontos.Next;
    end;

    // LINHA_FECHAMENTO_24
    FArquivo.Add('3'+
      CompStr(FormatFloat('###,###,##0.00',FTotalProv),15,' ',true)+
      CompStr(FormatFloat('###,###,##0.00',FTotalDesc),15,' ',true)+
      CompStr(FormatFloat('###,###,##0.00',FTotalProv - FTotalDesc),15,' ',true));

    // LINHA_FECHAMENTO_25
    FArquivo.Add('4'+
      CompStr(FormatFloat('###,###,##0.00',FCdsSalBase.FieldByName('SALBASE').asFloat),15,' ',true)+
      CompStr(FormatFloat('###,###,##0.00',FCdsBaseINSS.FieldByName('VALORBASEINSS').asFloat),15,' ',true)+
      CompStr(FormatFloat('###,###,##0.00',FCdsBaseFgts.FieldByName('BASEFGTS').asFloat),15,' ',true)+
      CompStr(FormatFloat('###,###,##0.00',FcdsFGTS.FieldByName('VALORFGTS').asFloat),15,' ',true)+
      CompStr(FormatFloat('###,###,##0.00',FCdsBaseIRRF.FieldByName('VALORBASEIRRF').asFloat),15,' ',true)+
      CompStr('BCO No '+FCdsPessoa.FieldByName('NUMBANCO').asString,17,' ',false)+
      CompStr('AG. No '+FCdsPessoa.FieldByName('NUMAGENCIA').asString,17,' ',false)+
      CompStr(FCdsPessoa.FieldByName('NUMCONTASALARIO').asString,17,' ',false)+
      DateToStr(DataPag));

    // LINHA_MENSAGEM
    FArquivo.Add('5'+ CompStr(Mensagem, 50, ' ', false));

    if (FCdsProventos.EOF) and (FCdsDescontos.EOF) then
    begin
      FTotalDesc := 0;
      FTotalProv := 0;
      FCdsPessoa.Next;
      IncProgresso;
      SelecionarRubricasPessoa;
    end;
  end;

  Result := FArquivo.Text;
end;

function TCtrlParamRelTxtCCheque.GerarModelo_MAKSOUD(AnoBarraMes, Msg1, Msg2: string): string;
var
  n: Word;
  Lin: string;
begin
  FArquivo.Clear;

  FCdsPessoa.First;
  FTotalDesc := 0;
  FTotalProv := 0;
  while not(FCdsPessoa.EOF) do
  begin
    // Empresa, CNPJ, Endereço
    FArquivo.Add(' ');
    FArquivo.Add(' ');
    FArquivo.Add(Alinha(Trim(FCdsPessoa.FieldByName('EMPRESA').asString), 80, 'C', ' '));
    FArquivo.Add(Alinha(FCdsPessoa.FieldByName('TIPOCNPJ').asString +' '+
      FCdsPessoa.FieldByName('CNPJ').asString +'   '+
      FCdsPessoa.FieldByName('ESTADUALMUNICIPAL').asString, 80, 'C', ' '));
    FArquivo.Add(Alinha(FCdsPessoa.FieldByName('ENDEMPRESA').asString, 80, 'C', ' '));

    // Matrícula, Nome e Mês de Referência
    FArquivo.Add(
      Replicate(' ',05)+ LeftPad(Trim(FCdsPessoa.FieldByName('MATRICULA').asString),10)+
      Replicate(' ',10)+ LeftPad(Trim(FCdsPessoa.FieldByName('EMPREGADO').asString),60)+
      Replicate(' ',11)+ MesExtensoAno(AnoBarraMes));

    // Cargo, C. de Custo
    FArquivo.Add(
      Replicate(' ',07)+ LeftPad(Trim(FCdsPessoa.FieldByName('TITULO').asString),40)+
      Replicate(' ',18)+ LeftPad(Trim(FCdsPessoa.FieldByName('NOMECC').asString),30));

    // PROVENTOS
    FArquivo.Add(' ');
    FArquivo.Add(' ');
    FArquivo.Add(' ');
    for n:=1 to 15 do
    begin
      Lin := '';
      if not(FCdsProventos.EOF) then
      begin
        Lin := Replicate(' ',2)+ LeftPad(FCdsProventos.FieldByName('CODPROVDESC').asString,5);

        if (FCdsProventos.FieldByName('REFERENCIA').asString = '***')    or
           (FCdsProventos.FieldByName('REFERENCIA').asString = 'Férias') or
           (FCdsProventos.FieldByName('REFERENCIA').asString = 'Ferias') then
          Lin := Lin+
            Replicate(' ',2)+ LeftPad(FCdsProventos.FieldByName('DESCRICAO').asString,60)
        else
          Lin := Lin+
            Replicate(' ',2)+ LeftPad(Trim(FCdsProventos.FieldByName('DESCRICAO').asString),50)+
            '   '+ LeftPad(Trim(FCdsProventos.FieldByName('REFERENCIA').asString),07);

        Lin := Lin+
          Replicate(' ',6) + RightPad(FormatFloat('###,###,##0.00',
            FCdsProventos.FieldByName('VALORPROVENTO').asFloat),15);

        FTotalProv := FTotalProv + FCdsProventos.FieldByName('VALORPROVENTO').asFloat;
        FCdsProventos.Next;
      end
      else
      if not(FCdsDescontos.EOF) then
      begin
        Lin := Replicate(' ',2)+ LeftPad(FCdsDescontos.FieldByName('CODPROVDESC').asString,5);

        if (FCdsDescontos.FieldByName('REFERENCIA').asString = '***')    or
           (FCdsDescontos.FieldByName('REFERENCIA').asString = 'Férias') or
           (FCdsProventos.FieldByName('REFERENCIA').asString = 'Ferias') then
          Lin := Lin+
            Replicate(' ',2)+ LeftPad(FCdsDescontos.FieldByName('DESCRICAO').asString,60)
        else
          Lin := Lin+
            Replicate(' ',2)+ LeftPad(Trim(FCdsDescontos.FieldByName('DESCRICAO').asString),50)+
            '   '+ LeftPad(Trim(FCdsDescontos.FieldByName('REFERENCIA').asString),07);

        Lin := Lin +
          Replicate(' ',29)+ RightPad(FormatFloat('###,###,##0.00',
            FCdsDescontos.FieldByName('VALORPROVENTO').asFloat),15);

        FTotalDesc := FTotalDesc + FCdsDescontos.FieldByName('VALORPROVENTO').asFloat;
        FCdsDescontos.Next;
      end;
      FArquivo.Add(Lin);
    end;

    FArquivo.Add(' ');
    FArquivo.Add(' ');
    if (FCdsProventos.EOF) and (FCdsDescontos.EOF) then
    begin
      FArquivo.Add(
        Replicate(' ',02)+ LeftPad(Msg1, 70) +
        Replicate(' ',03)+ RightPad(FormatFloat('###,###,##0.00',TotalProv),15) +
        Replicate(' ',08)+ RightPad(FormatFloat('###,###,##0.00',TotalDesc),15));
      FArquivo.Add(
        Replicate(' ',02)+ LeftPad(Msg2, 70) +
        Replicate(' ',18)+ RightPad(FormatFloat('###,###,##0.00',TotalProv - TotalDesc),15));
    end
    else
    begin
      FArquivo.Add(' ');
      FArquivo.Add(Replicate(' ',102)+ ('(CONTINUA)'));
    end;

    // Valores Base
    FArquivo.Add(' ');
    if (FCdsProventos.EOF) and (FCdsDescontos.EOF) then
      FArquivo.Add(
        Replicate(' ',02)+ LeftPad(FormatFloat('###,###,##0.00', FCdsSalBase.FieldByName('SALBASE').asFloat),20)+
        Replicate(' ',03)+ LeftPad(FormatFloat('###,###,##0.00', FCdsBaseInss.FieldByName('VALORBASEINSS').asFloat),17)+
        Replicate(' ',02)+ LeftPad(FormatFloat('###,###,##0.00', FCdsBaseFGTS.FieldByName('BASEFGTS').asFloat),16)+
        Replicate(' ',00)+ LeftPad(FormatFloat('###,###,##0.00', FCdsFGTS.FieldByName('VALORFGTS').asFloat),17)+
        Replicate(' ',02)+ LeftPad(FormatFloat('###,###,##0.00', FCdsBaseIRRF.FieldByName('VALORBASEIRRF').asFloat),13)+
        Replicate(' ',00)+ IFF(FCdsSalParticip.FieldByName('VALORSALPART').asFloat = 0,
          ' ', LeftPad(FormatFloat('###,###,##0.00',
          FCdsSalParticip.FieldByName('VALORSALPART').asFloat),13)))
    else
      FArquivo.Add(' ');

    // Avanço final
    FArquivo.Add(' ');
    FArquivo.Add(' ');

    if (FCdsProventos.EOF) and (FCdsDescontos.EOF) then
    begin
      FTotalDesc := 0;
      FTotalProv := 0;
      FCdsPessoa.Next;
      IncProgresso;
      SelecionarRubricasPessoa;
    end;
  end;

  Result := FArquivo.Text;
end;

function TCtrlParamRelTxtCCheque.GerarModelo_CLIENTE_PADRAO(AnoBarraMes, Msg1, Msg2: string;
  Altura6Polegadas: boolean): string;
var
  n: Word;
  Lin: string;
  iNumLinhas: integer;
begin
  FArquivo.Clear;

  FCdsPessoa.First;
  FTotalDesc := 0;
  FTotalProv := 0;
  while not(FCdsPessoa.EOF) do
  begin
    // Empresa, CNPJ, Endereço
    FArquivo.Add(' ');
    if (FImprimirCabecalho) then
    begin
      FArquivo.Add(IFF(FIdContraCheque <> VILA_GALE_BA,'', Replicate(' ',15)) +
        Alinha(Trim(FCdsPessoa.FieldByName('EMPRESA').asString)+
        IFF(FIdContraCheque <> VILA_GALE_BA,'', Replicate(' ',15)+ MesExtensoAno(AnoBarraMes)), 80, 'C', ' '));
      FArquivo.Add(IFF(FIdContraCheque <> VILA_GALE_BA,'', Replicate(' ',15)) +
        Alinha(FCdsPessoa.FieldByName('TIPOCNPJ').asString +' '+
        FCdsPessoa.FieldByName('CNPJ').asString +'   '+
        FCdsPessoa.FieldByName('ESTADUALMUNICIPAL').asString, 80, 'C', ' '));
      FArquivo.Add(IFF(FIdContraCheque <> VILA_GALE_BA,'', Replicate(' ',15)) +
        Alinha(FCdsPessoa.FieldByName('ENDEMPRESA').asString, 80, 'C', ' '));
    end
    else
    begin
      FArquivo.Add(' ');
      FArquivo.Add(' ');
      FArquivo.Add(' ');
    end;

    // Matricula, Nome, AnoBarraMes
    if (Altura6Polegadas) then
      FArquivo.Add(' ');

    FArquivo.Add(' ');

    if (FIdContraCheque = VILA_GALE_BA) then
    begin
      FArquivo.Add(
        Replicate(' ',02)+ LeftPad(FCdsPessoa.FieldByName('MATRICULA').asString,10)+
        Replicate(' ',00)+ LeftPad(FCdsPessoa.FieldByName('EMPREGADO').asString,50)+
        Replicate(' ',01)+ LeftPad(FCdsPessoa.FieldByName('TITULO').asString,25)+
        Replicate(' ',01)+ LeftPad(FCdsPessoa.FieldByName('NOMECC').asString,25));
    end
    else
    begin
      FArquivo.Add(
        Replicate(' ',02)+ LeftPad(FCdsPessoa.FieldByName('MATRICULA').asString,15)+
        Replicate(' ',00)+ LeftPad(FCdsPessoa.FieldByName('EMPREGADO').asString,60)+
        Replicate(' ',23)+ MesExtensoAno(AnoBarraMes));

      // Cargo, C. de Custo
      FArquivo.Add(
        Replicate(' ',17)+ LeftPad(FCdsPessoa.FieldByName('TITULO').asString,37)+
        Replicate(' ',20)+ Trim(FCdsPessoa.FieldByName('NOMECC').asString));
    end;

    if (FIdContraCheque = CM_SOLUCOES) then
      iNumLinhas := 14
    else if (FIdContraCheque = VILA_GALE_BA) then
      iNumLinhas := 16
    else
      iNumLinhas := 15;

    // PROVENTOS
    FArquivo.Add(' ');
    FArquivo.Add(' ');
    for n:=1 to iNumLinhas do
    begin
      Lin := '';
      if not(FCdsProventos.EOF) then
      begin
        Lin := Replicate(' ',2)+ LeftPad(FCdsProventos.FieldByName('CODPROVDESC').asString,5);

        if (FCdsProventos.FieldByName('REFERENCIA').asString = '***')    or
           (FCdsProventos.FieldByName('REFERENCIA').asString = 'Férias') or
           (FCdsProventos.FieldByName('REFERENCIA').asString = 'Ferias') then
          Lin := Lin+
            Replicate(' ',2)+ LeftPad(FCdsProventos.FieldByName('DESCRICAO').asString,
                              IFF(FIdContraCheque <> VILA_GALE_BA,60,63))
        else
          Lin := Lin+
            Replicate(' ',2)+ LeftPad(Trim(FCdsProventos.FieldByName('DESCRICAO').asString),
              IFF(FIdContraCheque <> VILA_GALE_BA,50,53))+
              '   '+ LeftPad(Trim(FCdsProventos.FieldByName('REFERENCIA').asString),07);

        Lin := Lin+
          Replicate(' ',6) + RightPad(FormatFloat('###,###,##0.00',
            FCdsProventos.FieldByName('VALORPROVENTO').asFloat),15);

        FTotalProv := FTotalProv + FCdsProventos.FieldByName('VALORPROVENTO').asFloat;
        FCdsProventos.Next;
      end
      else
      if not(FCdsDescontos.EOF) then
      begin
        Lin := Replicate(' ',2)+ LeftPad(FCdsDescontos.FieldByName('CODPROVDESC').asString,5);

        if (FCdsDescontos.FieldByName('REFERENCIA').asString = '***')    or
           (FCdsDescontos.FieldByName('REFERENCIA').asString = 'Férias') or
           (FCdsProventos.FieldByName('REFERENCIA').asString = 'Ferias') then
          Lin := Lin+
            Replicate(' ',2)+ LeftPad(FCdsDescontos.FieldByName('DESCRICAO').asString,8)
            //*  IFF(FIdContraCheque <> VILA_GALE_BA,60,63))
        else
          Lin := Lin+
            Replicate(' ',2)+ LeftPad(Trim(FCdsDescontos.FieldByName('DESCRICAO').asString),3) +
             //* IFF(FIdContraCheque <> VILA_GALE_BA,50,53))+
              '   '+ LeftPad(Trim(FCdsDescontos.FieldByName('REFERENCIA').asString),07);

        Lin := Lin +
          Replicate(' ',29)+ RightPad(FormatFloat('###,###,##0.00',
            FCdsDescontos.FieldByName('VALORPROVENTO').asFloat),15);

        FTotalDesc := FTotalDesc + FCdsDescontos.FieldByName('VALORPROVENTO').asFloat;
        FCdsDescontos.Next;
      end;
      FArquivo.Add(Lin);
    end;

    // Totais
    if not(Altura6Polegadas) then
      FArquivo.Add(' ');

    FArquivo.Add(' ');
    if (FCdsProventos.EOF) and (FCdsDescontos.EOF) then
    begin
      FArquivo.Add(
        Replicate(' ',02)+ LeftPad(Msg1,3)+
        //*IFF(FIdContraCheque <> VILA_GALE_BA,70,73)) +
        Replicate(' ',03)+ RightPad(FormatFloat('###,###,##0.00',TotalProv),15) +
        Replicate(' ',08)+ RightPad(FormatFloat('###,###,##0.00',TotalDesc),15));
      FArquivo.Add(
        Replicate(' ',02)+ LeftPad(Msg2,70));
      FArquivo.Add(
        Replicate(' ', 02)
        //*IFF(FIdContraCheque <> VILA_GALE_BA,98,101))
        + RightPad(FormatFloat('###,###,##0.00',TotalProv - TotalDesc),15));
    end
    else
    begin
      FArquivo.Add(' ');
      FArquivo.Add(' ');
      FArquivo.Add(Replicate(' ',102)+('(CONTINUA)'));
    end;

    // Valores Base
    FArquivo.Add(' ');
    if (FCdsProventos.EOF) and (FCdsDescontos.EOF) then
      FArquivo.Add(
        Replicate(' ',13)+ LeftPad(FormatFloat('###,###,##0.00', FCdsSalBase.FieldByName('SALBASE').asFloat),
         iff(FIdContraCheque <> VILA_GALE_BA,20,15))+
        Replicate(' ',02)+ LeftPad(FormatFloat('###,###,##0.00', FCdsBaseInss.FieldByName('VALORBASEINSS').asFloat),20)+
        Replicate(' ',03)+ LeftPad(FormatFloat('###,###,##0.00', FCdsBaseFGTS.FieldByName('BASEFGTS').asFloat),18)+
        Replicate(' ',00)+ LeftPad(FormatFloat('###,###,##0.00', FCdsFGTS.FieldByName('VALORFGTS').asFloat),16)+
        Replicate(' ',ctrlfuncoesrh.IFF(FIdContraCheque <> VILA_GALE_BA,00,10))+
          LeftPad(FormatFloat('###,###,##0.00', FCdsBaseIRRF.FieldByName('VALORBASEIRRF').asFloat),13)+
        Replicate(' ',00)+ IFF(FCdsSalParticip.FieldByName('VALORSALPART').asFloat = 0,
          ' ', LeftPad(FormatFloat('###,###,##0.00',
          FCdsSalParticip.FieldByName('VALORSALPART').asFloat),13)))
    else
      FArquivo.Add(' ');

    // Avanço final
    FArquivo.Add(' ');
    FArquivo.Add(' ');
    if (FIdContraCheque = CM_SOLUCOES) then
      FArquivo.Add(' ');

    if (Altura6Polegadas) then
    begin
      FArquivo.Add(' ');
      FArquivo.Add(' ');
      FArquivo.Add(' ');
    end;

    if (FCdsProventos.EOF) and (FCdsDescontos.EOF) then
    begin
      FTotalDesc := 0;
      FTotalProv := 0;
      FCdsPessoa.Next;
      IncProgresso;
      SelecionarRubricasPessoa;
    end;
  end;

  Result := FArquivo.Text;
end;

end.
