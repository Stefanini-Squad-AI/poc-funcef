unit uCtrlParamArqPagto;

interface

uses SysUtils, Classes, Controls, DB, Forms, uCmControlObject, uCmDbObject, IvDictio,
   uCmClientDataSet, uCMTypes, uDiasUteis, uCtrlCustomRH, uCtrlIntBanco,   
  uCtrlBancoPortFolha, uCtrlListTerceirosRH, uCtrlPessoaFuncionario, uCtrlExecQryRH;

type
  TOnProgArqPagto = procedure (const NumReg: integer; const IncrProgresso: boolean) of object;

  TCtrlParamArqPagto = class(TCtrlCustomRH)
  protected
    procedure AfterInitialize; override;
    procedure DoChangeDataBase; override;
  private
    FOnProgArqPagto: TOnProgArqPagto;

    FCtrlIntBanco: TCtrlIntBanco;
    FCtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    FCtrlListTerceirosRH: TCtrlListTerceirosRH;
    FCtrlBancoPortFolha: TCtrlBancoPortFolha;
    FCtrlExecQryRH: TCtrlExecQryRH;

    FLstPortForma: TStringList;

    FCdsPrincipal, FCdsPortadorForma, FCdsDocTxt: TCMClientDataSet;
    FSQL: TStringList;

    FUltPortForma, FPortadorFormaPadrao: integer;
    FDiretorio: string;

    FIdEmpresa: integer;
    FIdEstab: integer;
    FMesRef: string; // Mês de Referência (AAAA/MM)
    FDataCredito: TDate;
    FNomeTabela: string;
    FListaIdFunc: string;
    FListaIdTipoFolha: string;
    FListaSelSitFunc: string;
    FListaSelTipoContrato: string;
    FDadosIncompletos: boolean;

    procedure IncProgresso(const NumReg: integer; const IncrProgresso: boolean);

    function  AbrirQueryPrincipal: boolean;
    procedure AbrirQueryDocTXT;
    procedure AlimentaQryDocTxt;
  public
    constructor Create(IdEmpresa: integer; UsuXFilial, UsuXCCusto, IdUsuarioGeral: string); reintroduce;
    destructor  Destroy; override;

    function ProcessarGeracao(IdEmpresa, IdEstab: integer; MesRef, AnoRef: integer;
      DataCredito: TDate; Previa: boolean; ListaIdTipoFolha, ListaIdFunc, Diretorio,
      ListaSelSitFunc, ListaSelTipoContrato: string): boolean;

    property DadosIncompletos: boolean read FDadosIncompletos;
    property OnProgresso: TOnProgArqPagto read FOnProgArqPagto write FOnProgArqPagto;
  end;

implementation

uses uCtrlFuncoesRH;

const
  // Constantes que são concatenadas durante o processamento de uma função. Usadas desta
  // forma para a melhor tradução pelo padrão.
  MSG_SEM_DADOS =
    'Não há dados a serem processados para esta competência ou :1'+
    'Dados Cadastrais incompletos.';

{ TCtrlParamArqPagto }

constructor TCtrlParamArqPagto.Create(IdEmpresa: integer;
  UsuXFilial, UsuXCCusto, IdUsuarioGeral: string);
begin
  inherited Create;
  SetAutorizacoes(UsuXFilial, UsuXCCusto, IdUsuarioGeral);

  FCtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(
    UsuXFilial, UsuXCCusto, IdUsuarioGeral, false, false, IdEmpresa);
  FCtrlListTerceirosRH := TCtrlListTerceirosRH.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral);
  FCtrlBancoPortFolha := TCtrlBancoPortFolha.Create(IdEmpresa);
  FCtrlExecQryRH := TCtrlExecQryRH.Create;
  FCtrlIntBanco := TCtrlIntBanco.Create;
  FCtrlIntBanco.FechaQryTexto := false;

  FCdsPortadorForma := TCMClientDataSet.Create(nil);
  FSQL := TStringList.Create;
  FLstPortForma := TStringList.Create;

  GetTempDir;
end;

destructor TCtrlParamArqPagto.Destroy;
begin
  FCtrlIntBanco.Free;
  FCdsPortadorForma.Free;
  FSQL.Free;
  FCtrlBancoPortFolha.Free;
  FCtrlExecQryRH.Free;
  FCtrlListTerceirosRH.Free;
  FCtrlPessoaFuncionario.Free;
  FLstPortForma.Free;
  inherited;
end;

procedure TCtrlParamArqPagto.AfterInitialize;
begin
  inherited;
  FCtrlBancoPortFolha.InitializeAs(Self);
  FCtrlListTerceirosRH.InitializeAs(Self);
  FCtrlPessoaFuncionario.InitializeAs(Self);
  FCtrlIntBanco.InitializeAs(Self);
  FCtrlExecQryRH.InitializeAs(Self);

  FCdsPortadorForma.Data := FCtrlBancoPortFolha.ListPortadorXConta;
  FPortadorFormaPadrao := FCtrlBancoPortFolha.GetCodPortFormaPadrao;
end;

procedure TCtrlParamArqPagto.DoChangeDataBase;
begin
  inherited;
end;

procedure TCtrlParamArqPagto.IncProgresso(const NumReg: integer; const IncrProgresso: boolean);
begin
  if Assigned(OnProgresso) then
    OnProgresso(NumReg, IncrProgresso);
end;

function TCtrlParamArqPagto.AbrirQueryPrincipal: boolean;
begin
  with (FSQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  F.IDPESSOA,');
    Add('  F.MATRICULA,');
    Add('  PF.NOME AS EMPREGADO,');
    Add('  PF.NUMDOCUMENTO AS CPF,');
    Add('  B.NUMBANCO,');
    Add('  AG.NUMAGENCIA AS CODAGENCIA,');
    Add('  F.NUMCONTASALARIO AS CONTA,');

    // Data de Crédito selecionada
    if (FDataCredito > 0) then
    begin
      Add('  ' +QuotedStr(IntToStr(ExtraiDia(FDataCredito)))+ ' AS DIA_CREDITO,');
      Add('  ' +QuotedStr(IntToStr(ExtraiMes(FDataCredito)))+ ' AS MES_CREDITO,');
      Add('  ' +QuotedStr(IntToStr(ExtraiAno(FDataCredito)))+ ' AS ANO_CREDITO,');
    end
    else
    begin
      Add('  '' '' AS DIA_CREDITO,');
      Add('  '' '' AS MES_CREDITO,');
      Add('  '' '' AS ANO_CREDITO,');
    end;

    // Se a Rubrica 40999 não existir, calcula
    Add('  TO_NUMBER(DECODE(RUBRICA.VALOR,NULL,NVL(PROVENTOS.VALOR,0) - NVL(DESCONTOS.VALOR,0),RUBRICA.VALOR)) AS LIQUIDO');
    Add('FROM');
    Add('  PESSOA PF, FUNCIONARIO F, BANCO B, AGENCIABANCARIA AG,'+
      IFF((FListaIdFunc = ''),' SITFUNC SF,',''));
    // -------------------------------------------------------------------------- //
    // Proventos do Empregado
    Add('  (SELECT H.IDPESSOA, SUM(H.VALORPROVENTO) AS VALOR');
    Add('   FROM   ' +FNomeTabela+ ' H, PROVDESC P, FUNCIONARIO F'+
      IFF((FListaIdFunc = ''),', SITFUNC SF',''));
    Add('   WHERE (F.IDESTAB         = ' +IntToStr(FIdEstab)+ ') AND');
    Add('         (P.FLGDESCONTO     = 0) AND');
    Add('         (H.IDPESSJUR       = ' +IntToStr(FIdEmpresa)+ ') AND');
    Add('         (H.MES             = ' +QuotedStr(FMesRef)+ ') AND');
    Add(MontaLinhaSelSQL('         (H.IDMOTIVO',FListaIdTipoFolha,7));

    // Funcionário(s) selecionado(s)
    if (FListaIdFunc <> '') then
      Add(MontaLinhaSelSQL('         (F.IDPESSOA',FListaIdFunc,7))
    else
    begin
      // C. de Custo(s) habilitados para o usuário
      if (FUsuXCCusto <> '') then
        Add(MontaLinhaSelSQL('         (F.CODCENTROCUSTO',FUsuXCCusto,1));

      if (FListaSelSitFunc <> '') then
        Add(MontaLinhaSelSQL('         (SF.TIPOSIT',FListaSelSitFunc,7));

      Add(MontaLinhaSelSQL('         (F.TIPOCONTRATO',FListaSelTipoContrato,3));
      Add('         (SF.IDSITFUNC      = F.IDSITFUNC) AND');
    end;

    Add('         (F.IDPESSOA        = H.IDPESSOA) AND');
    Add('         ((H.DATAPAGAMENTO IS NULL) OR');
    Add('          (H.DATAPAGAMENTO  = TO_DATE(' +QuotedStr(DateToStr(FDataCredito)) +',''DD/MM/YYYY''))) AND');
    Add('         (H.IDRUBRICA       = P.IDPROVENTO)');
    Add('   GROUP BY H.IDPESSOA) PROVENTOS,');
    // -------------------------------------------------------------------------- //
    // Desconto do Empregado
    Add('  (SELECT H.IDPESSOA, SUM(H.VALORPROVENTO) AS VALOR');
    Add('   FROM   ' +FNomeTabela+ ' H, PROVDESC P, FUNCIONARIO F'+
      IFF((FListaIdFunc = ''),', SITFUNC SF',''));
    Add('   WHERE (F.IDESTAB         = ' +IntToStr(FIdEstab)+ ') AND');
    Add('         (P.FLGDESCONTO     = 1) AND');
    Add('         (H.IDPESSJUR       = ' +IntToStr(FIdEmpresa)+ ') AND');
    Add('         (H.MES             = ' +QuotedStr(FMesRef)+ ') AND');
    Add(MontaLinhaSelSQL('         (H.IDMOTIVO',FListaIdTipoFolha,7));

    // Funcionário(s) selecionado(s)
    if (FListaIdFunc <> '') then
      Add(MontaLinhaSelSQL('         (F.IDPESSOA',FListaIdFunc,7))
    else
    begin
      // C. de Custo(s) habilitados para o usuário
      if (FUsuXCCusto <> '') then
        Add(MontaLinhaSelSQL('         (F.CODCENTROCUSTO',FUsuXCCusto,1));

      if (FListaSelSitFunc <> '') then
        Add(MontaLinhaSelSQL('         (SF.TIPOSIT',FListaSelSitFunc,7));

      Add(MontaLinhaSelSQL('         (F.TIPOCONTRATO',FListaSelTipoContrato,3));
      Add('         (SF.IDSITFUNC      = F.IDSITFUNC) AND');
    end;

    Add('         (F.IDPESSOA        = H.IDPESSOA) AND');
    Add('         ((H.DATAPAGAMENTO IS NULL) OR');
    Add('          (H.DATAPAGAMENTO  = TO_DATE(' +QuotedStr(DateToStr(FDataCredito)) +',''DD/MM/YYYY''))) AND');
    Add('         (H.IDRUBRICA       = P.IDPROVENTO)');
    Add('   GROUP BY H.IDPESSOA) DESCONTOS,');
    // -------------------------------------------------------------------------- //
    // Rubrica de Salário
    Add('  (SELECT H.IDPESSOA, H.VALORPROVENTO AS VALOR');
    Add('   FROM   ' +FNomeTabela+ ' H, PROVDESC P, FUNCIONARIO F'+
      IFF((FListaIdFunc = ''),', SITFUNC SF',''));
    Add('   WHERE (F.IDESTAB         = ' +IntToStr(FIdEstab)+ ') AND');
    Add('         (P.CODRUBCLT       = ''40999'') AND');
    Add('         (H.IDPESSJUR       = ' +IntToStr(FIdEmpresa)+ ') AND');
    Add('         (H.MES             = ' +QuotedStr(FMesRef)+ ') AND');
    Add(MontaLinhaSelSQL('         (H.IDMOTIVO',FListaIdTipoFolha,7));

    // Funcionário(s) selecionado(s)
    if (FListaIdFunc <> '') then
      Add(MontaLinhaSelSQL('         (F.IDPESSOA',FListaIdFunc,7))
    else
    begin
      // C. de Custo(s) habilitados para o usuário
      if (FUsuXCCusto <> '') then
        Add(MontaLinhaSelSQL('         (F.CODCENTROCUSTO',FUsuXCCusto,1));

      if (FListaSelSitFunc <> '') then
        Add(MontaLinhaSelSQL('         (SF.TIPOSIT',FListaSelSitFunc,7));

      Add(MontaLinhaSelSQL('         (F.TIPOCONTRATO',FListaSelTipoContrato,3));
      Add('         (SF.IDSITFUNC      = F.IDSITFUNC) AND');
    end;

    Add('         (F.IDPESSOA        = H.IDPESSOA) AND');
    Add('         ((H.DATAPAGAMENTO IS NULL) OR');
    Add('          (H.DATAPAGAMENTO  = TO_DATE(' +QuotedStr(DateToStr(FDataCredito)) +',''DD/MM/YYYY''))) AND');
    Add('         (P.IDPROVENTO      = H.IDRUBRICA)) RUBRICA');
    // -------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (F.IDESTAB          = ' +IntToStr(FIdEstab)+ ') AND');

    // Funcionário(s) selecionado(s)
    if (FListaIdFunc <> '') then
      Add(MontaLinhaSelSQL('  (F.IDPESSOA',FListaIdFunc,8))
    else
    begin
      // C. de Custo(s) habilitados para o usuário
      if (FUsuXCCusto <> '') then
        Add(MontaLinhaSelSQL('  (F.CODCENTROCUSTO',FUsuXCCusto,1));

      Add(MontaLinhaSelSQL('  (F.TIPOCONTRATO',FListaSelTipoContrato,4));
      Add('  (F.DATAADMISSAO    <= TO_DATE(' +QuotedStr(
        PoeZero(TrazUltDiaMes(StrToInt(Copy(FMesRef,6,2)), StrToInt(Copy(FMesRef,1,4))))+'/'+
        Copy(FMesRef,6,2) +'/'+ Copy(FMesRef,1,4))+ ',''DD/MM/YYYY'')) AND');

      if (FListaSelSitFunc <> '') then
        Add(MontaLinhaSelSQL('  (SF.TIPOSIT',FListaSelSitFunc,8));

      Add('  (SF.IDSITFUNC       = F.IDSITFUNC) AND');
    end;

    Add('  (F.IDPESSOA         = PF.IDPESSOA) AND');
    Add('  (F.IDAGENCIASALARIO = AG.IDPESSOA) AND');
    Add('  (AG.IDBANCO         = B.IDPESSOA) AND');
    Add('  ((NVL(RUBRICA.VALOR,0)   > 0) OR');
    Add('   (NVL(PROVENTOS.VALOR,0) -');
    Add('    NVL(DESCONTOS.VALOR,0) > 0)) AND');
    Add('  (PF.IDPESSOA        = RUBRICA.IDPESSOA(+)) AND');
    Add('  (PF.IDPESSOA        = DESCONTOS.IDPESSOA(+)) AND');
    Add('  (PF.IDPESSOA        = PROVENTOS.IDPESSOA(+))');
    Add('ORDER BY');
    Add('  NUMBANCO, CODAGENCIA, EMPREGADO');
    SaveToFile(DirTempLog + '\qry.txt');
  end;

  try
    FCdsPrincipal.Data := GetDataPacket(FSQL);

    Result := not(FCdsPrincipal.IsEmpty);
    if not(Result) then
      MessageInfo := CMTranslateMsg(MSG_SEM_DADOS, [CR_LF]);
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
    Add('  LPAD(''1'',18,''2'') AS CONTALIQUIDO,');
    Add('  0 AS IDPESSOA,');
    Add('  LPAD(''1'',30,''2'') AS NOME,');
    Add('  LPAD(''1'',30,''2'') AS RAZAOSOCIAL,');
    Add('  LPAD(''1'',18,''2'') AS NUMDOCUMENTO,');
    Add('  LPAD(''1'',15,''2'') AS CONTACORRENTE,');
    Add('  LPAD(''1'',10,''2'') AS CODBANCOFAVORECIDO,');
    Add('  LPAD(''1'',15,''2'') AS NUMAGENCIA,');
    Add('  LPAD(''1'',40,''2'') AS LOGRADOURO,');
    Add('  ''12345678'' AS NUMERO,');
    Add('  LPAD(''1'',20,''2'') AS COMPLEMENTO,');
    Add('  LPAD(''1'',20,''2'') AS BAIRRO,');
    Add('  LPAD(''1'',20,''2'') AS CIDADE,');
    Add('  ''123'' AS CODESTADO,');
    Add('  ''12345678'' AS CEP,');
    Add('  0 AS IDFORCLI,');
    //Add('  0 AS CODDOCUMENTO,');
    Add('  LPAD(''1'',13,''2'') AS CODDOCUMENTO,');
    Add('  LPAD(''1'',13,''2'') AS LIVRE,');
    Add('  0.00 AS VALOR,');
    Add('  0.00 AS VALORDESCONTO,');
    Add('  0.00 AS VALORJUROS,');
    Add('  ''01/01/2003'' AS DATAVENCTO,');
    Add('  ''01/01/2003'' AS DATAPROGRAMADA,');
    Add('  0 AS TIPOMOEDA,');
    Add('  0 AS NUMLOTE,');
    Add('  0 AS CODPORTFORMA,');
    Add('  0 AS CODFORMAPAGTO,');
    Add('  0 AS CODTIPOPAGTO,');
    Add('  ''0'' AS FLGEMITEAVISO,');
    Add('  0 AS CODARQUIVOREMESSA,');
    Add('  0 AS CODPORTADOR,');
    Add('  0 AS IDBANCO,');
    Add('  LPAD(''1'', 15, ''2'') AS NOCONTACORR,');
    Add('  ''1234567890'' AS CODBARRA,');
    Add('  ''1234567890'' AS CODBARRAVALOR,');
    Add('  0 AS NODOCUMENTO,');
    Add('  ''123'' AS COMPLDOCUMENTO,');
    Add('  ''1'' AS TIPO,');
    Add('  LPAD(''1'', 20, ''2'') AS NUMEMPRESABANCO,');
    Add('  ''1'' AS DEBCRE,');
    Add('  ''1'' AS TIPOCONTA');
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
    FieldByName('IDPESSOA').asFloat := FCdsPrincipal.FieldByName('IDPESSOA').asFloat;
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
    // Identificador para retorno do arquivo.
    // Data e Hora atual no seguinte formato: MSec + Sec + Min + Hor + Ano + Mes + Dia
    FieldByName('CODDOCUMENTO').asString := FormatDateTime('ZZZSSNNHHYYYYMMDD', Now);
    FieldByName('LIVRE').asString := Trim(FCdsPrincipal.FieldByName('MATRICULA').asString);
    FieldByName('VALOR').asFloat := FCdsPrincipal.FieldByName('LIQUIDO').asFloat;
    FieldByName('VALORDESCONTO').asFloat := 0;
    FieldByName('VALORJUROS').asFloat := 0;
    FieldByName('DATAVENCTO').asString := '';
    FieldByName('DATAPROGRAMADA').asDateTime := FDataCredito;
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
    FieldByName('NODOCUMENTO').asFloat := StrToFloat(FloatToStr(FCdsPrincipal.FieldByName('IDPESSOA').asFloat)+Copy(FMesRef,1,4)); // Codigo que aparece no relatorio
    FieldByName('COMPLDOCUMENTO').asString := Copy(FMesRef,6,2); // Codigo que aparece no relatorio
    FieldByName('TIPO').asString := 'F';
    FieldByName('NUMEMPRESABANCO').asString := FCdsPortadorForma.FieldByName('NUMEMPRESABANCO').asString;
    FieldByName('DEBCRE').asString := '';
    Post;
  end;
end;

function TCtrlParamArqPagto.ProcessarGeracao(IdEmpresa, IdEstab: integer; MesRef,
  AnoRef: integer; DataCredito: TDate; Previa: boolean; ListaIdTipoFolha, ListaIdFunc,
  Diretorio, ListaSelSitFunc, ListaSelTipoContrato: string): boolean;
var
  FCdsPessoasAux: TCMClientDataSet;
  FDiasUteis: TDiasUteis;

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

    FCdsPrincipal := TCMClientDataSet.Create(nil);
    FCdsDocTxt := TCMClientDataSet.Create(nil);
    FCdsPessoasAux := TCMClientDataSet.Create(nil);

    FDiasUteis := TDiasUteis.Create;
    FDiasUteis.InitializeAs(Self);
  //* FDiasUteis.DataBaseName := DataBaseName;

    FIdEmpresa := IdEmpresa;
    FIdEstab := IdEstab;
    FMesRef := IntToStr(AnoRef) + '/'+ PoeZero(MesRef);
    FDataCredito := DataCredito;
    FListaIdFunc := ListaIdFunc;
    FListaIdTipoFolha := ListaIdTipoFolha;
    FListaSelSitFunc := QuotedListaString(ListaSelSitFunc,',');
    FListaSelTipoContrato := QuotedListaString(ListaSelTipoContrato,',');
    FDiretorio := Diretorio;

    if (Previa) then
      FNomeTabela := 'PREVIAFOLPAG'
    else
      FNomeTabela := 'HISTRUBSAL';

    try
      FDadosIncompletos := not(AbrirQueryPrincipal);
      if (FDadosIncompletos) then
        raise Exception.Create(MessageInfo);
      AbrirQueryDocTXT;

      while not(FCdsPrincipal.EOF) do
      begin
        AlimentaQryDocTxt;
        FCdsPrincipal.Next;
      end;

      FCdsPessoasAux.Data := FCdsDocTxt.Data;
      FCdsDocTxt.Filter := '';
      FCdsDocTxt.Filtered := true;

      FCdsPrincipal.Data := FCtrlBancoPortFolha.ListPortadorXContaXFolha;
      IncProgresso(FCdsPrincipal.RecordCount, false);
      while not(FCdsPrincipal.EOF) do
      begin
        FUltPortForma := FCdsPrincipal.FieldByName('CODPORTFORMA').asInteger;
        if (FLstPortForma.IndexOf(IntToStr(FUltPortForma)) <> -1) then
        begin
          FCdsDocTxt.Filter := 'CODPORTFORMA = ' + IntToStr(FUltPortForma);
          InserirCdsPessoas;
          FCtrlIntBanco.IndiceDoBanco := FCdsPrincipal.FieldByName('CODARQUIVOREMESSA').asInteger;

          if (FCtrlIntBanco.VerficaDadosEmpresa('P', FUltPortForma)) then
          begin
            if (FCtrlIntBanco.ValidaRemessa('P', FCdsPessoasAux.Data, false)) then
            begin
              // Caso o modelo do arquivo for Folha de Pagamento Bradesco,
              // indicar a Data do Débito, que é sempre um dia antes da Data de Pagamento,
              // no mesmo campo que seria informada a Data de Pagamento.
              if (FCtrlIntBanco.IndiceDoBanco = 3) then
                FCtrlIntBanco.DataPagamento := DateToStr(FDiasUteis.UltDiaUtilAnterior(
                  FIdEmpresa, DataCredito, true, true, false))
              else
                FCtrlIntBanco.DataPagamento := DateToStr(DataCredito);

              FCtrlIntBanco.MontaPagamentoEletronico(
                FCdsPrincipal.FieldByName('CODARQUIVOREMESSA').asInteger,
                FCdsPrincipal.FieldByName('CONTROLEREMESSA').asInteger,
                FCdsPessoasAux.Data, FDiretorio);
            end
            else
              raise Exception.Create(
                ('Erro na geração do arquivo de Pagamento Eletrônico.') +CR_LF+
                (' * Código do Portador Forma = ')+ IntToStr(FUltPortForma)+CR_LF+
               ('Erro: ') +CR_LF+ FCtrlIntBanco.MessageInfo);
          end;
        end;
        FCdsPrincipal.Next;
        IncProgresso(0, true);
      end;

   //*   if not(FCtrlExecQryRH.ExecutarListaSQL(FCtrlIntBanco.stlComandosSQL.Text)) then
  //*      raise Exception.Create(FCtrlExecQryRH.MessageInfo);

      MessageInfo := ('Arquivo de Pagamento gerado com sucesso.');
      Result := true;
    except
      on E: Exception do
        MessageInfo := E.Message;
    end;
  finally
    FreeAndNil(FCdsPrincipal);
    FreeAndNil(FCdsDocTxt);
    FreeAndNil(FCdsPessoasAux);
    FreeAndNil(FDiasUteis);
  end;
end;

end.
