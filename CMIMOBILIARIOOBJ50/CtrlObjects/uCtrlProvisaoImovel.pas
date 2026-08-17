//-------------------------------------------------------------------------------
//Nº SIG......: 127938
//Data........: 06/09/2022
//Responsável.: Cássio Florencio Rovaroto
//Descrição...: Correções relacionadas ao processo de provisão de custo de imóveis.
//--------------------------------------------------------------------------------------------------
//Nº SIG......: 113136
//Data........: 04/07/2022
//Responsável.: Cássio Florencio Rovaroto
//Descrição...: Implementação da provisão de custos de imóveis. 
//-------------------------------------------------------------------------------
unit uCtrlProvisaoImovel;

interface
uses SysUtils, dbClient, DB, uCMControlObject, uCMDbObject, uCMClientDataSet,
     uCMTypes, uDbImovel, uCtrlBem, uCtrlModuloImobiliario, uSistema,
     dbtables, classes, uDbProvisaoImovel, uDbSaldoProvisaoImovel, uComunsImobiliarioDB,
     uCMMath, DCAF, uCtrlImobCAFxContab, UFuncoesImob, uCtrlHistMovBem, Math, uCtrlParamCAF;

type

  TCtrlProvisaoImovel = class(TCMControlObject)
  private
    FCdsProvisaoImovel: TCMClientDataSet;
    FDbProvisaoImovel: TDbProvisaoImovel;
    FDbSaldoProvisaoImovel: TDbSaldoProvisaoImovel;
    Bem : TCtrlBem;
    ModuloImobiliario: TCtrlModuloImobiliario;
    ComunsImobiliarioDB : TComunsImobiliarioDB;
    CafxContab : TCtrlImobCAFxContab;
    HistMovBem : TCtrlHistMovBem;
    ParamCAF : TCtrlParamCAF;
    FidEmpresa: Integer;
    aHistMovBem: array of Extended;
    iaHistMovBem: Integer;
    FbContabProvisao: Boolean;


    procedure SetCdsProvisaoImovel(const Value: TCMClientDataSet);
    procedure SetDbProvisaoImovel(const Value: TDbProvisaoImovel);
    procedure SetDbSaldoProvisaoImovel(const Value: TDbSaldoProvisaoImovel);
    procedure AfterInitialize;   override;
    procedure SetidEmpresa(const Value: Integer);
    procedure SetbContabProvisao(const Value: Boolean);
  public
    property CdsProvisaoImovel: TCMClientDataSet read FCdsProvisaoImovel write SetCdsProvisaoImovel;
    property DbProvisaoImovel : TDbProvisaoImovel read FDbProvisaoImovel write SetDbProvisaoImovel;
    property DbSaldoProvisaoImovel : TDbSaldoProvisaoImovel read FDbSaldoProvisaoImovel write SetDbSaldoProvisaoImovel;
    property idEmpresa : Integer read FidEmpresa write SetidEmpresa;
    property bContabProvisao : Boolean read FbContabProvisao write SetbContabProvisao;
    constructor Create;  override;
    destructor  Destroy; override;

    function VerificaMovimentacaoProvisaoPeriodo(pIdImovel: Integer; pDataInicioVigencia: TDateTime): Boolean;
    function AtualizaStatusProvisaoAnterior(pIdImovel: Integer; pDataInicioProvAtual: TDateTime): Boolean;
    function LookupProvisaoImovel(pIdImovel: Integer): OleVariant;
    function ProvisaoExistente(pIdImovel: Integer; dProvisaoInicio: TDateTime; var sMSG: string): Boolean;
    function GetProvisaoBemImovel(pIdBem: Integer; pDataMov: TDateTime): OleVariant;
    function GravaProvisao(pIdImovel: TCmDbField; sMsg: String): Boolean;
    procedure ExcluiProvisaoImovel(pIdProvisaoImovel: Integer);
    procedure ExcluiProvisao;
    function SaldoContabilBem(const iEmpresaProp, iIdBem, iMoeCodigo, iTaxaDep: Integer; const dData: tDatetime): Extended;
    function BuscaSaldoProvisaoAnteriorBem(pIdBem: Integer; dDataMov: TDateTime; bAnterior: Boolean = True): Extended;
    function RegistraSaldoProvisaoImovel(pIdBem: Integer; dDataMovimentacao: TDateTime; pIdMovimentacao : Extended; pIdProvisaoImovel, pIdImovel: Integer; pCodTipImovel: string; dValorProvisao, dValorVariacao: Double): Boolean;
    function EstornaProvisaoCustoImovel(iIdUsuario, iModulo,iEmpresaProp, iTipoMovimentacao: Integer;
                                        dDataMov : TDateTime;
                                        bIntegraContab, bUsaPlanoPatro: Boolean;
                                        iIdBem: Integer = -1): Boolean;
    function ExecutaProvisaoCusto(iIdBem, iIdPessoa,
                                  iIdModulo, iMoeCodigo, iIdProvisaoImovel,
                                  iIdImovel, iIdGrupo, iIdConjunto,
                                  iUnigNegoc, iCodSubConta : Integer;
                                  sCodTipImovel, sPlaca, sDesBem, sDescGrupo: string;
                                  dDataMov: TDateTime; dValor: Extended;
                                  dPercentual: Double;
                                  bIntegraContab, bCtaxCCusto: boolean): Boolean;
    function VerificaProvisaoImoveis(sIdImovel: string): OleVariant;
    procedure InicializaContabProvisao;
    function ContabilizaProvisao(iIdModulo, iIdPessoa, iIdUsuario: Integer; dDataMov: TDateTime): Boolean;
    function RetornaBem(iIdImovel: integer): OleVariant;
    function InsereProvisaoImovelDesmembrado(pIdImovelOrigem, pIdImovelDestino: Integer; pDataMov: TDateTime): Integer;
    function AtualizaProvisaoImovelDesmembrado(pIdImovelOrigem: Integer; pDataMov: TDateTime): Boolean;
    function VerificaBensBaixados(pIdImovel: Integer): Boolean;
  end;
implementation
{ TCtrlProvisaoImovel }

procedure TCtrlProvisaoImovel.AfterInitialize;
begin
  inherited;
  FDbProvisaoImovel.DataBaseName    := DataBaseName;
  FDbSaldoProvisaoImovel.DataBaseName := DataBaseName;

  Bem.InitializeAs(Self);
  ModuloImobiliario.InitializeAs(Self);
  ComunsImobiliarioDB.InitializeAs(Self);
  CafXContab.InitializeAs(Self);
  HistMovBem.InitializeAs(Self);
  ParamCAF.InitializeAs(Self);
end;

function TCtrlProvisaoImovel.AtualizaStatusProvisaoAnterior(
  pIdImovel: Integer; pDataInicioProvAtual: TDateTime): Boolean;
var cdsAux: TCMClientDataSet;
    sSQL: string;
    dDataFimAnterior: TDateTime;
begin
  Result := True;
  try
    cdsAux := TCMClientDataSet.Create(nil);

    try
      sSQL := 'SELECT IDIMOVEL,      ' +#10#13+
              '       VIGENCIA_FIM,  ' +#10#13+
              '       FGLATIVO       ' +#10#13+
              '  FROM PROVISAOIMOVEL ' +#10#13+
              ' WHERE IDIMOVEL = ' + IntToStr(pIdImovel)+#10#13+
              '   AND VIGENCIA_INICIO < ' + DateTimeToStr(pDataInicioProvAtual);

      cdsAux.Data := GetDataPacket(sSQL);

      if not cdsAux.IsEmpty then
      begin
        dDataFimAnterior := pDataInicioProvAtual-1;
        cdsAux.First;
        while not cdsAux.Eof do
        begin
          cdsAux.Edit;
          cdsAux.FieldByName('FLGATIVO').AsString := 'N';
          if cdsAux.FieldByName('VIGENCIA_FIM').AsDateTime = null then
            cdsAux.FieldByName('VIGENCIA_FIM').AsDateTime := dDataFimAnterior;
          cdsAux.Post;
          cdsAux.Next;
        end;
      end;
    except
      Result := False;
    end;

  finally
    FreeAndNil(cdsAux);
  end;
end;

function TCtrlProvisaoImovel.BuscaSaldoProvisaoAnteriorBem(pIdBem: Integer;
  dDataMov: TDateTime; bAnterior: Boolean = True): Extended;
var
    sSQL: string;
    cdsAux: TCMClientDataSet;
begin
  Result:= 0;
  cdsAux := TCMClientDataSet.Create(nil);
  try
    sSQL :=  'SELECT NVL(SUM(S.VALOR),0) AS PROVISAOANTERIOR                                   '+#13#10+
             '  FROM SALDOPROVISAOIMOVEL S                                                     '+#13#10+
             '  JOIN IMOVELXBEM IXB ON IXB.IDBEM = S.IDBEM                                     '+#13#10+
             ' WHERE S.IDBEM = ' + IntToStr(pIdBem)                                             +#13#10+
             '   AND S.DATAPROVISAO = (SELECT MAX(DATAPROVISAO)                                '+#13#10+
             '   						             FROM SALDOPROVISAOIMOVEL S1                           '+#13#10+
             '   						            WHERE S1.IDBEM = S.IDBEM                               '+#13#10;
    if bAnterior then
      sSQL := sSQL + '                            AND S1.DATAPROVISAO < '+ QuotedStr(DateTimeToStr(dDataMov)) + ')'
    else
      sSQL := sSQL + '                            AND S1.DATAPROVISAO <= '+ QuotedStr(DateTimeToStr(dDataMov)) + ')';

     cdsAux.Data := GetDataPacket(sSQL);

     if not(cdsAux.IsEmpty) and (cdsAux.FieldByName('PROVISAOANTERIOR').asFloat <> 0) then
      Result := cdsAux.FieldByName('PROVISAOANTERIOR').asFloat;

  finally
    FreeAndNil(cdsAux);
  end;
end;

constructor TCtrlProvisaoImovel.Create;
begin
  inherited;

  Bem               := TCtrlBem.Create;
  ModuloImobiliario := TCtrlModuloImobiliario.Create;
  ComunsImobiliarioDB := TComunsImobiliarioDB.Create(idEmpresa, Sistema.IdModulo, Sistema.IdUsuario, Sistema.IdEspAcesso, true);
  CafxContab := TCtrlImobCAFxContab.Create;
  HistMovBem := TCtrlHistMovBem.Create;
  ParamCAF := TCtrlParamCAF.Create;
  FDbProvisaoImovel := TDbProvisaoImovel.Create(Self);
  FDbSaldoProvisaoImovel := TDbSaldoProvisaoImovel.Create(Self);
end;

destructor TCtrlProvisaoImovel.Destroy;
begin
  inherited;

  FreeAndNil(Bem);
  FreeAndNil(ModuloImobiliario);
  FreeAndNil(ComunsImobiliarioDB);
  FreeAndNil(CafxContab);
  FreeAndNil(HistMovBem);
  FreeAndNil(ParamCAF);
  FreeAndNil(FDbProvisaoImovel);
  FreeAndNil(FDbSaldoProvisaoImovel);
end;

function TCtrlProvisaoImovel.EstornaProvisaoCustoImovel(iIdUsuario,
  iModulo, iEmpresaProp, iTipoMovimentacao: Integer;
  dDataMov: TDateTime; bIntegraContab, bUsaPlanoPatro: Boolean; iIdbem: Integer = -1): Boolean;
var
  sSQL: string;
  iaPlanilha, iPlan: Integer;
  aPlanilha                 : Array of Integer;
begin
  Result := True;
  if not ParamCAF.CarregaProp(iEmpresaProp) then
  begin
    MessageInfo := 'Parâmetros do sistema inválidos!' + #13 + ParamCAF.MessageInfo;;
    Raise Exception.Create(MessageInfo);
  end;
  //-------------------------------------------------------------------------------
  // Recupera movimentações de provisão a excluir
  //-------------------------------------------------------------------------------
  sSQL := ' SELECT /*+ RULE */ DISTINCT B.IDGRUPO, HM.IDBEM, HM.PLNCODIGO ' +
          '   FROM HISTORICOMOVIMENTACAO HM, '+      
          '        BEM B, '+
          '        GRUPO G' +
          '  WHERE (HM.DATAMOVIMENTACAO = TO_DATE('+ #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
          '    AND (HM.TIPDEPPRORATA = 2) '+
          '    AND (HM.IDTIPOMOVIMENTACAO = ' + IntToStr(iTipoMovimentacao) + ')'+
          '    AND (HM.IDPESSOA = ' + inttostr(iEmpresaProp) + ') ' ;
  if (iIdBem <> -1) then
    sSQL := sSQL + '    AND (B.IDBEM = ' + IntToStr(iIdBem) +')';

  sSQL := sSQL + '    AND (HM.IDBEM = B.IDBEM) '+
          '    AND (HM.IDPESSOA = B.IDPESSOA) '+
          '    AND (B.IDGRUPO = G.IDGRUPO) '+
          '  ORDER BY B.IDGRUPO, HM.IDBEM';
  _cds.Data := GetDataPacket( sSql );

  //-------------------------------------------------------------------------------
  if not _Cds.IsEmpty then
  begin
    iaPlanilha :=  0;
    try
      while not _cds.Eof do
      begin
        if not _cds.FieldByName('PLNCODIGO').IsNull then
        begin
          if iaPlanilha = 0 then
          begin
            iaPlanilha := iaPlanilha + 1;
            SetLength(aPlanilha,iaPlanilha);
            aPlanilha[iaPlanilha - 1] := _cds.FieldByName('PLNCODIGO').AsInteger;
          end
          else
            if aPlanilha[iaPlanilha - 1] <> _cds.FieldByName('PLNCODIGO').AsFloat then
            begin
              iaPlanilha := iaPlanilha + 1;
              SetLength(aPlanilha,iaPlanilha);
              aPlanilha[iaPlanilha - 1] := _cds.FieldByName('PLNCODIGO').AsInteger;
            end;
        end;
        //----------------------------------------------------------------------------
        _cds.Next;
      end;

      //-------------------------------------------------------------------------------
      // Estorna Lancamento na Contabilidade
      //-------------------------------------------------------------------------------
      if bIntegraContab then
      begin
        //----------------------------------------------------------------------------
        // Retira o Link do Histórico com a Planilha Contábil
        //----------------------------------------------------------------------------
        LimpaParametros(dtmCAF.qryPlnMovProvisao);
        dtmCAF.qryPlnMovProvisao.Prepare;
        dtmCAF.qryPlnMovProvisao.ParamByName('IDPESSOA').AsInteger    := iEmpresaProp;
        dtmCAF.qryPlnMovProvisao.ParamByName('DATAMOV').AsDate        := dDataMov;
        dtmCAF.qryPlnMovProvisao.ParamByName('IDTIPOMOVIMENTACAO').AsInteger := iTipoMovimentacao;
        dtmCAF.qryPlnMovProvisao.ParamByName('IDBEM').asInteger := _Cds.FieldByName('IDBEM').asInteger;
        dtmCAF.qryPlnMovProvisao.ExecSQL;

        //----------------------------------------------------------------------------
        for iPlan := 0 to (iaPlanilha - 1) do
        begin
          if not CafxContab.RemovePlanContab(iEmpresaProp) then
          begin
            if not CafxContab.LancaContab.EstornaLancaContab(iIdUsuario, aPlanilha[iPlan],
                                                             iModulo,iEmpresaProp,
                                                             bUsaPlanoPatro,
                                                            DateToStr(dDataMov)) then
            begin
              MessageInfo := 'Estorno da Planilha Contabil não Executado !';
              raise Exception.Create(MessageInfo);
            end;
          end
          else
          begin
            if not CafxContab.LancaContab.ExcluiLancaContab(iIdUsuario, aPlanilha[iPlan],
                                                          iModulo, 0, bUsaPlanoPatro, True) then
            begin
              MessageInfo := 'Remoção da Planilha Contabil não Executada !';
              raise Exception.Create(MessageInfo);
            end;
          end;
        end;
      end;

      _cds.First;
      while not _cds.Eof do
      begin

        LimpaParametros(dtmCAF.qryDelSaldoProvisaoImovel);
        dtmCAF.qryDelSaldoProvisaoImovel.ParamByName('IDBEM').AsInteger := _Cds.FieldByName('IDBEM').AsInteger;
        dtmCAF.qryDelSaldoProvisaoImovel.ParamByName('DATAMOVIMENTACAO').AsDate := dDataMov;
        dtmCAF.qryDelSaldoProvisaoImovel.ExecSQL;

        LimpaParametros(dtmCAF.qryDelVlrHistMovProvisao);
        dtmCAF.qryDelVlrHistMovProvisao.ParamByName('DATAMOV').AsDate := dDataMov;
        dtmCAF.qryDelVlrHistMovProvisao.ParamByName('IDPESSOA').AsInteger := iEmpresaProp;
        dtmCAF.qryDelVlrHistMovProvisao.ParamByName('IDTIPOMOVIMENTACAO').AsInteger := iTipoMovimentacao;
        dtmCAF.qryDelVlrHistMovProvisao.ParamByName('IDBEM').AsInteger := _Cds.FieldByName('IDBEM').AsInteger;
        dtmCAF.qryDelVlrHistMovProvisao.ExecSQL;

        LimpaParametros(dtmCAF.qryDelHistMovProvisao);
        dtmCAF.qryDelHistMovProvisao.ParamByName('DATAMOV').AsDate := dDataMov;
        dtmCAF.qryDelHistMovProvisao.ParamByName('IDPESSOA').AsInteger := iEmpresaProp;
        dtmCAF.qryDelHistMovProvisao.ParamByName('IDTIPOMOVIMENTACAO').AsInteger := iTipoMovimentacao;
        dtmCAF.qryDelHistMovProvisao.ParamByName('IDBEM').AsInteger := _Cds.FieldByName('IDBEM').AsInteger;
        dtmCAF.qryDelHistMovProvisao.ExecSQL;  

        _cds.Next;
      end;
    except
      on e: Exception do
      begin
        Result := False;
        MessageInfo := e.Message;
      end;
    end;
  end;
end;

procedure TCtrlProvisaoImovel.ExcluiProvisao;
begin
  while not CdsProvisaoImovel.Eof do
    CdsProvisaoImovel.Delete; 
end;

function TCtrlProvisaoImovel.ExecutaProvisaoCusto( iIdBem, iIdPessoa,
                                                  iIdModulo, iMoeCodigo, iIdProvisaoImovel,
                                                  iIdImovel, iIdGrupo, iIdConjunto,
                                                  iUnigNegoc, iCodSubConta : Integer;
                                                  sCodTipImovel, sPlaca, sDesBem, sDescGrupo: string;
                                                  dDataMov: TDateTime; dValor: Extended;
                                                  dPercentual: Double;
                                                  bIntegraContab, bCtaxCCusto: boolean): Boolean;
var
  dSaldoContabBem, dSaldoAnteriorProvisaoBem, dVariacaoProvisaoBem,
  dSaldoProvisaoBem : Double;
  nSeqHist, nPlanilha: Extended;
  iExercicio, iPeriodo, iDia: word;
  iTipoMovimetacao: integer;
  bBaixa: Boolean;
begin
  Result:= True;
  try
    //Buscar saldo atual do bem;
    if dValor <= 0 then
    begin
      iTipoMovimetacao := 203;
      bBaixa := True;
    end
    else
    begin
      iTipoMovimetacao := 202;
      bBaixa := False;
    end;

    if (dValor <> 0) or (iTipoMovimetacao = 203) then
    begin
      //Aplicar cálculo de provisão;
      dSaldoProvisaoBem := RoundCM(dValor * (dPercentual / 100), 2);

      // Verificar se o valor de provisão encontrado é diferente do último valor de provisão calculado
     dSaldoAnteriorProvisaoBem := BuscaSaldoProvisaoAnteriorBem(iIdBem, dDataMov, False);
     dVariacaoProvisaoBem := dSaldoProvisaoBem - dSaldoAnteriorProvisaoBem;

     //Se valor diferente, inserir a nova provisão, criar a nova movimentação;
      if dVariacaoProvisaoBem <> 0 then
      begin
        //-------------------------------------------------------------------
        // Registra na tabela HISTORICOMOVIMENTACAO
        //-------------------------------------------------------------------
        nSeqHist := HistMovBem.RegistraHistMovBem(iIdBem,           // IDBEM
                                                  iIdPessoa,        // IDPESSOA
                                                  iIdModulo,        // IDMODULO
                                                  iTipoMovimetacao, // IDTIPOMOVIMENTACAO
                                                  dDataMov,         // DATAMOVIMENTACAO
                                                  -1,               // IDREAVALACRESC
                                                  -1,               // DATAULTDEP
                                                  -1,               // IDGRUPANT
                                                  -1,               // IDCONJANT
                                                  -1,               // IDLOCALANT
                                                  -1,               // IDRESPANT
                                                  -1,               // PLACAANT
                                                  -1,               // PLNCODIGO
                                                  '',               // OBSREAVAL
                                                  2,                // TIPDEPPRORATA
                                                  -1,               // IDTIPODESPESA
                                                  '',               // OBSACRESCIMO
                                                  -1,               // IDMOTIVOBAIXA
                                                  0,                // PROPBAIXA
                                                  0,                // VALVENDAOFI
                                                  '');              // OBSBAIXA
        if nSeqHist = -1 then
          raise Exception.Create(HistMovBem.MessageInfo);

        //-------------------------------------------------------------------
        // Registra o valor no histórico
        //-------------------------------------------------------------------
        if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                iMoeCodigo,
                                                0,
                                                dVariacaoProvisaoBem) then
          raise Exception.Create(HistMovBem.MessageInfo);
        //-------------------------------------------------------------------

        //-------------------------------------------------------------------
        //Se valor diferente, gravar a nova posição de provisão (SALDOPROVISAOIMOVEL)
        //-------------------------------------------------------------------
        if not RegistraSaldoProvisaoImovel(iIdBem,
                                           dDataMov,
                                           nSeqHist,
                                           iIdProvisaoImovel,
                                           iIdImovel,
                                           sCodTipImovel,
                                           dSaldoProvisaoBem,
                                           dVariacaoProvisaoBem) then
          raise Exception.Create(MessageInfo);

        //-------------------------------------------------------------------
        // Contabilizar movimentação.
        //Registra a Provisão do Custo na Contabilidade
        //-------------------------------------------------------------------
        if bIntegraContab then
        begin
          DecodeDate(dDataMov, iExercicio, iPeriodo, iDia);
          //----------------------------------------------------------------
          // Alimenta o DataSet que irá acumular a planilha contábil
          // para a integração
          //----------------------------------------------------------------
          if not CafxContab.ContabilizaProvisaoCusto(iIdModulo,
                                                     iIdPessoa,
                                                     iIdBem,
                                                     iIdGrupo,
                                                     iIdConjunto,
                                                     iUnigNegoc,
                                                     iCodSubConta,
                                                     sPlaca,
                                                     sDesBem,
                                                     sDescGrupo,
                                                     dDataMov,
                                                     dVariacaoProvisaoBem,
                                                     iExercicio,
                                                     iPeriodo,
                                                     False,
                                                     bBaixa) then
            raise Exception.Create(CafxContab.MessageInfo);
          FbContabProvisao := True;
          //----------------------------------------------------------------
          // Capta o id da movimentacao para registro da planilha contábil
          //----------------------------------------------------------------
          SetLength(aHistMovBem,iaHistMovBem + 1);
          aHistMovBem[iaHistMovBem] := nSeqHist;
          iaHistMovBem := iaHistMovBem + 1;
        end;
      end;
    end;
  except
    on e : Exception do
    begin
      MessageInfo := e.Message;
      Result := False;
    end;
  end;
end;

procedure TCtrlProvisaoImovel.ExcluiProvisaoImovel(pIdProvisaoImovel: Integer);
begin
  LimpaParametros(dtmCAF.qryDelProvisaoImovel);
  dtmCAF.qryDelProvisaoImovel.Prepare;
  dtmCAF.qryDelProvisaoImovel.ParamByName('PIDPROVISAOIMOVEL').asInteger := pIdProvisaoImovel;
  dtmCAF.qryDelProvisaoImovel.ExecSQL;
end;

function TCtrlProvisaoImovel.GetProvisaoBemImovel(pIdBem: Integer;
  pDataMov: TDateTime): OleVariant;
var
 sSQL: string;
begin
  sSQL := 'SELECT PI.IDPROVISAOIMOVEL, IB.IDBEM, IB.IDIMOVEL, PI.PERCENTUAL, IM.CODTIPIMOVEL ' +#13#10+
          '  FROM CM.IMOVELXBEM  IB ' +#13#10+
          '  JOIN CM.IMOVEL IM ON IM.IDIMOVEL = IB.IDIMOVEL ' +#13#10+
          '  JOIN CM.PROVISAOIMOVEL PI ' +#13#10+
          '    ON PI.IDIMOVEL = IM.IDIMOVEL ' +#13#10+
          '   AND PI.VIGENCIA_INICIO <= ' + QuotedStr(DateTimeToStr(pDataMov)) + #13#10+
          '   AND (PI.VIGENCIA_FIM IS NULL OR PI.VIGENCIA_FIM >= ' + QuotedStr(DateTimeToStr(pDataMov)) + ')' + #13#10+
          '   AND PI.FLGATIVO = ''S''' + #13#10+
          ' WHERE IB.IDBEM = ' + IntToStr(pIdBem);

  Result := GetDataPacket(sSQL);
end;

function TCtrlProvisaoImovel.GravaProvisao(pIdImovel: TCmDbField; sMsg: String): Boolean;
begin
   Result := ApplyCds(CdsProvisaoImovel ,DbProvisaoImovel, [pIdImovel ], [DbProvisaoImovel.IdImovel], True);

  if not Result then
    sMsg := DbProvisaoImovel.MessageInfo;
end;

function TCtrlProvisaoImovel.LookupProvisaoImovel(
  pIdImovel: Integer): OleVariant;
var
    sSQL: string;
begin
  sSQL := 'SELECT IDPROVISAOIMOVEL,                                                                ' +#13#10+
          '       IDIMOVEL,                                                                        ' +#13#10+
          '       PERCENTUAL,                                                                      ' +#13#10+
          '       VIGENCIA_INICIO,                                                                 ' +#13#10+
          '       VIGENCIA_FIM,                                                                    ' +#13#10+
          '       FLGATIVO,                                                                        ' +#13#10+
          '       DECODE(FLGATIVO, ''S'', ''Vigência de provisão atual'', ''Vigência de provisão anterior'') AS FLGATIVO_S ' +#13#10+
          '  FROM PROVISAOIMOVEL                                                                   ' +#13#10+
          ' WHERE IDIMOVEL = ' + IntToStr(pIdImovel)                                                 +#13#10+
          ' ORDER BY VIGENCIA_INICIO DESC                                                          ' +#13#10;

  Result:= GetDataPacket(sSQL);
end;

function TCtrlProvisaoImovel.ProvisaoExistente(pIdImovel: Integer;
  dProvisaoInicio: TDateTime; var sMSG: string): Boolean;
var
  sSQL: string;
  cdsAux: TCMClientDataSet;
begin
  Result := False;
  cdsAux := TCMClientDataSet.Create(nil);
  try
    sSQL :=  'SELECT 1               ' +#13#10+
             '  FROM PROVISAOIMOVEL  ' +#13#10+
             ' WHERE IDIMOVEL = ' + IntToStr(pIdImovel) +#13#10+
             '   AND VIGENCIA_INICIO = ' + QuotedStr(DateTimeToStr(dProvisaoInicio));

    cdsAux.Data := GetDataPacket(sSQL);

    if not cdsAux.IsEmpty then
    begin
      Result := True;
      sMSG := 'Já existe uma vigência de provisão iniciando nesta data.';
      Exit;
    end;

  finally
    FreeAndNil(cdsAux);
  end;
end;

function TCtrlProvisaoImovel.RegistraSaldoProvisaoImovel(pIdBem: Integer;
  dDataMovimentacao: TDateTime; pIdMovimentacao: Extended;
  pIdProvisaoImovel, pIdImovel: Integer; pCodTipImovel: string; dValorProvisao, dValorVariacao: Double): Boolean;
var
  cdsPlanoPatroImovel: TCMClientDataSet;
  bResult: Boolean;
  fValor, fValorSegAcum,
  fVaricaoAcum, fVariacaoSegTotAcum: Currency;
begin
  cdsPlanoPatroImovel := TCMClientDataSet.Create(nil);
  fValor := dValorProvisao;
  fValorSegAcum := 0;
  fVaricaoAcum := dValorVariacao;
  fVariacaoSegTotAcum := 0;
  try
    try
      cdsPlanoPatroImovel.Data := ComunsImobiliarioDB.BuscaPlanoPatroxImovel(pIdImovel);
      if cdsPlanoPatroImovel.RecordCount >= 1 then
      begin
        Result:= True;
        DbSaldoProvisaoImovel.Clear;
        while not cdsPlanoPatroImovel.Eof do
        begin
          DbSaldoProvisaoImovel.IdProvisaoImovel.asInteger := pIdProvisaoImovel;
          DbSaldoProvisaoImovel.IdBem.asInteger := pIdBem;
          DbSaldoProvisaoImovel.IdMovimentacao.AsFloat := pIdMovimentacao;
          DbSaldoProvisaoImovel.CodTipImovel.AsString := pCodTipImovel;
          DbSaldoProvisaoImovel.DataProvisao.AsDateTime := dDataMovimentacao;
          DbSaldoProvisaoImovel.IdPatro.AsInteger := cdsPlanoPatroImovel.FieldByName('IDPATRO').AsInteger;
          DbSaldoProvisaoImovel.IdPlanoPrev.AsInteger := cdsPlanoPatroImovel.FieldByName('IDPLANOPREV').AsInteger;

          if cdsPlanoPatroImovel.RecNo = cdsPlanoPatroImovel.RecordCount then
          begin
              DbSaldoProvisaoImovel.Valor.AsFloat := RoundCM(fValor - fValorSegAcum, 2);
              DbSaldoProvisaoImovel.ValorVariacao.AsFloat := RoundCM(fVaricaoAcum - fVariacaoSegTotAcum, 2);
          end
          else
          begin
            DbSaldoProvisaoImovel.Valor.AsFloat := RoundCM((fValor * cdsPlanoPatroImovel.FieldByName('PERCENTRATEIO').asFloat)/100, 2);
            fValorSegAcum := fValorSegAcum + DbSaldoProvisaoImovel.Valor.AsFloat;

            DbSaldoProvisaoImovel.ValorVariacao.AsFloat := RoundCM((fVaricaoAcum * cdsPlanoPatroImovel.FieldByName('PERCENTRATEIO').asFloat)/100, 2);
            fVariacaoSegTotAcum := fVariacaoSegTotAcum + DbSaldoProvisaoImovel.ValorVariacao.AsFloat;
          end;

          If not DbSaldoProvisaoImovel.Insert then
          begin
            Result := False;
            raise Exception.Create(DbSaldoProvisaoImovel.MessageInfo);
          end;

          cdsPlanoPatroImovel.Next;                 
        end;
      end
      else
      begin
        Result:= False;
        raise Exception.Create('Processo foi abortado, pois o imóvel não possui segregação.');
      end;

    except
      on e: Exception do
      begin
        Result := False;
        MessageInfo := e.Message;
      end;
    end;
  finally
    FreeAndNil(cdsPlanoPatroImovel);
  end;
end;

function TCtrlProvisaoImovel.SaldoContabilBem(const iEmpresaProp,
  iIdBem, iMoeCodigo, iTaxaDep: Integer; const dData: tDatetime): Extended;
var sSql    : String;
    cdsTemp : TCMClientDataSet;
begin
  sSql := 'SELECT /*+ RULE */ ' +#13#10+
          '       SB.IDBEM, ' +#13#10+
          '       ROUND((SB.VALORG + SB.CMBEM - SB.DEPLANC - SB.CMDEP + SB.REAVVALORG + SB.REAVCMBEM - ' +#13#10+
          '        SB.REAVDEPLANC - SB.REAVCMDEP + SB.ULTREAVVALORG +  SB.ULTREAVCMBEM - ' +#13#10+
          '        SB.ULTREAVDEPLANC - SB.ULTREAVCMDEP),2) AS SALDO ' +#13#10+
          'FROM (SELECT SCB1.IDBEM, SCB1.IDPESSOA, SCB1.DATASLDBEM, SCB1.MOECODIGO, SCD1.IDSLDCTBBEMXDEP, ' +#13#10+
          '             SCB1.VALORG, SCB1.REAVVALORG, SCB1.ULTREAVVALORG, ' +#13#10+
          '             SCB1.VALORRES, ' +#13#10+
          '             SCB1.CMBEM, SCB1.REAVCMBEM, SCB1.ULTREAVCMBEM, ' +#13#10+
          '             SCD1.DEPLANC, SCD1.REAVDEPLANC, SCD1.ULTREAVDEPLANC, ' +#13#10+
          '             SCD1.CMDEP, SCD1.REAVCMDEP, SCD1.ULTREAVCMDEP, ' +#13#10+
          '             SCB1.IDGRUPO, SCB1.IDLOCALIZACAO, SCB1.IDRESPONSAVEL ' +#13#10+
          '      FROM SALDOCONTABBEM SCB1, ' +#13#10+
          '           SLDCTBBEMXDEP SCD1, ' +#13#10+
          '           (SELECT IDBEM, MAX(DATASLDBEM) AS DATA ' +#13#10+
          '            FROM SALDOCONTABBEM ' +#13#10+
          '            WHERE DATASLDBEM <= ' + QuotedStr(DateToStr(dData)) +#13#10+
          '              AND MOECODIGO = ' + IntToStr(iMoeCodigo) +#13#10+
          '              AND IDPESSOA  = ' + IntToStr(iEmpresaProp) +#13#10+
          '            GROUP BY IDBEM) DTAMAX ' +#13#10+
          '      WHERE SCB1.IDBEM = ' + IntToStr(iIdBem) +#13#10+
          '        AND SCB1.IDPESSOA = ' + IntToStr(iEmpresaProp) +#13#10+
          '        AND SCB1.MOECODIGO = ' + IntToStr(iMoeCodigo)  +#13#10+
          '        AND SCD1.IDSLDCTBBEMXDEP = ' + IntToStr(iTaxaDep) +#13#10+
          '        AND DTAMAX.DATA = SCB1.DATASLDBEM ' +#13#10+
          '        AND DTAMAX.IDBEM = SCB1.IDBEM ' +#13#10+
          '        AND SCD1.IDBEM = SCB1.IDBEM ' +#13#10+
          '        AND SCD1.IDPESSOA = SCB1.IDPESSOA ' +#13#10+
          '        AND SCD1.MOECODIGO = SCB1.MOECODIGO ' +#13#10+
          '        AND SCD1.DATASLDBEM = SCB1.DATASLDBEM' +#13#10+
          '        AND DTAMAX.IDBEM = ' + IntToStr(iIdBem) +#13#10+
          '        AND SCD1.IDBEM = ' + IntToStr(iIdBem) +#13#10+
          '        AND SCD1.IDPESSOA = ' + IntToStr(iEmpresaProp) +#13#10+
          '        AND SCD1.MOECODIGO = ' + IntToStr(iMoeCodigo) +#13#10+
          '        AND SCD1.DATASLDBEM = DTAMAX.DATA ' +#13#10+
          '        AND SCD1.IDBEM = DTAMAX.IDBEM) SB, ' +#13#10+
          '       (SELECT ATX.IDBEM, ATX.DATAMOVIMENTACAO, ' +#13#10+
          '               SUM(ATX.VLCMBEM) AS VALCMBEM, SUM(ATX.VLCMREAV) AS VALCMREAV, ' +#13#10+
          '               SUM(ATX.VLDEPBEM) AS VALDEPBEM, SUM(ATX.VLDEPREAV) AS VALDEPREAV, ' +#13#10+
          '               SUM(ATX.VLCMULTREAV) AS VALCMULTREAV, SUM(ATX.VLDEPULTREAV) AS VALDEPULTREAV ' +#13#10+
          '          FROM (SELECT HM1.IDBEM, HM1.DATAMOVIMENTACAO, ' +#13#10+
          '                       SUM(DECODE(HM1.IDTIPOMOVIMENTACAO, 15, NVL(VM1.VALOR, 0), ' +#13#10+
          '                                                          34, NVL(VM1.VALOR, 0), ' +#13#10+
          '                                                          50, NVL(VM1.VALOR, 0), 0)) AS VLCMBEM, ' +#13#10+
          '                                                                                   0 AS VLCMREAV, ' +#13#10+
          '                                                                                   0 AS VLDEPBEM, ' +#13#10+
          '                                                                                   0 AS VLDEPREAV, ' +#13#10+
          '                                                                                   0 AS VLCMULTREAV, ' +#13#10+
          '                                                                                   0 AS VLDEPULTREAV ' +#13#10+
          '                FROM HISTORICOMOVIMENTACAO HM1, ' +#13#10+
          '                     VLRHISTMOVBEM VM1 ' +#13#10+
          '                WHERE HM1.IDBEM = ' + IntToStr(iIdBem) +#13#10+
          '                  AND HM1.IDPESSOA = ' + IntToStr(iEmpresaProp)  +#13#10+
          '                  AND HM1.DATAMOVIMENTACAO = ' + QuotedStr(DateToStr(dData)) +#13#10+
          '                  AND VM1.MOECODIGO = ' + IntToStr(iMoeCodigo) +#13#10+
          '                  AND HM1.IDMOVIMENTACAO = VM1.IDMOVIMENTACAO (+) ' +#13#10+
          '                GROUP BY HM1.IDBEM, HM1.DATAMOVIMENTACAO ' +#13#10+
          '                UNION ' +#13#10+
          '                SELECT HM2.IDBEM, HM2.DATAMOVIMENTACAO, ' +#13#10+
          '                       0 AS VLCMBEM, ' +#13#10+
          '                       0 AS VLCMREAV, ' +#13#10+
          '                       SUM(DECODE(HM2.IDTIPOMOVIMENTACAO, 14, NVL(VM2.VALOR, 0), ' +#13#10+
          '                                                          17, NVL(VM2.VALOR, 0), ' +#13#10+
          '                                                          35, NVL(VM2.VALOR, 0), ' +#13#10+
          '                                                          99, NVL(VM2.VALOR, 0), 0)) AS VLDEPBEM, ' +#13#10+
          '                                                                                   0 AS VLDEPREAV, ' +#13#10+
          '                                                                                   0 AS VLCMULTREAV, ' +#13#10+
          '                                                                                   0 AS VLDEPULTREAV ' +#13#10+
          '                FROM HISTORICOMOVIMENTACAO HM2, ' +#13#10+
          '                     VLRHISTMOVBEM VM2 ' +#13#10+
          '                WHERE HM2.IDBEM = ' + IntToStr(iIdBem) +#13#10+
          '                  AND HM2.IDPESSOA = ' + IntToStr(iEmpresaProp) +#13#10+
          '                  AND HM2.DATAMOVIMENTACAO = ' + QuotedStr(DateToStr(dData)) +#13#10+
          '                  AND VM2.MOECODIGO =  ' + IntToStr(iMoeCodigo) +#13#10+
          '                  AND VM2.IDTAXADEP = ' + IntToStr(iTaxaDep) +#13#10+
          '                  AND HM2.IDMOVIMENTACAO = VM2.IDMOVIMENTACAO (+) ' +#13#10+
          '                GROUP BY HM2.IDBEM, HM2.DATAMOVIMENTACAO ' +#13#10+
          '                UNION ' +#13#10+
          '               SELECT HM3.IDBEM, HM3.DATAMOVIMENTACAO, ' +#13#10+
          '                                                                                   0 AS VALCMBEM, ' +#13#10+
          '                       SUM(DECODE(HM3.IDTIPOMOVIMENTACAO, 22, NVL(VM3.VALOR, 0), 0)) AS VALCMREAV, ' +#13#10+
          '                                                                                   0 AS VALDEPBEM, ' +#13#10+
          '                                                                                   0 AS VALDEPREAV, ' +#13#10+
          '                                                                                   0 AS VALCMULTREAV, ' +#13#10+
          '                                                                                   0 AS VALDEPULTREAV ' +#13#10+
          '                FROM HISTORICOMOVIMENTACAO HM3, ' +#13#10+
          '                     VLRHISTMOVBEM VM3, ' +#13#10+
          '                     REAVALIACAO R1 ' +#13#10+
          '                WHERE HM3.IDBEM = ' + IntToStr(iIdBem) +#13#10+
          '                  AND HM3.IDPESSOA = ' + IntToStr(iEmpresaProp) +#13#10+
          '                  AND HM3.DATAMOVIMENTACAO = ' + QuotedStr(DateToStr(dData)) +#13#10+
          '                  AND VM3.MOECODIGO = ' + IntToStr(iMoeCodigo) +#13#10+
          '                  AND R1.FLGULTREAVAL = 0 ' +#13#10+
          '                  AND HM3.IDMOVIMENTACAO = VM3.IDMOVIMENTACAO (+) ' +#13#10+
          '                  AND HM3.IDREAVALACRESC = R1.IDREAVALIACAO (+) ' +#13#10+
          '                GROUP BY HM3.IDBEM, HM3.DATAMOVIMENTACAO ' +#13#10+
          '                UNION ' +#13#10+
          '                SELECT HM4.IDBEM, HM4.DATAMOVIMENTACAO, ' +#13#10+
          '                                                                                   0 AS VALCMBEM, ' +#13#10+
          '                                                                                   0 AS VALCMREAV, ' +#13#10+
          '                                                                                   0 AS VALDEPBEM, ' +#13#10+
          '                       SUM(DECODE(HM4.IDTIPOMOVIMENTACAO, 18, NVL(VM4.VALOR, 0), ' +#13#10+
          '                                                          33, NVL(VM4.VALOR, 0), 0)) AS VALDEPREAV, ' +#13#10+
          '                                                                                   0 AS VALCMULTREAV, ' +#13#10+
          '                                                                                   0 AS VALDEPULTREAV ' +#13#10+
          '                FROM HISTORICOMOVIMENTACAO HM4, ' +#13#10+
          '                     VLRHISTMOVBEM VM4, ' +#13#10+
          '                     REAVALIACAO R2 ' +#13#10+
          '                WHERE HM4.IDBEM = ' + IntToStr(iIdBem) +#13#10+
          '                  AND HM4.IDPESSOA = ' + IntToStr(iEmpresaProp) +#13#10+
          '                  AND HM4.DATAMOVIMENTACAO = ' + QuotedStr(DateToStr(dData)) +#13#10+
          '                  AND VM4.MOECODIGO = ' + IntToStr(iMoeCodigo) +#13#10+
          '                  AND VM4.IDTAXADEP = ' + IntToStr(iTaxaDep) +#13#10+
          '                  AND R2.FLGULTREAVAL = 0 ' +#13#10+
          '                  AND HM4.IDMOVIMENTACAO = VM4.IDMOVIMENTACAO (+) ' +#13#10+
          '                  AND HM4.IDREAVALACRESC = R2.IDREAVALIACAO (+) ' +#13#10+
          '                GROUP BY HM4.IDBEM, HM4.DATAMOVIMENTACAO ' +#13#10+
          '                UNION ' +#13#10+
          '                SELECT HM5.IDBEM, HM5.DATAMOVIMENTACAO, ' +#13#10+
          '                                                                                   0 AS VALCMBEM, ' +#13#10+
          '                                                                                   0 AS VALCMREAV, ' +#13#10+
          '                                                                                   0 AS VALDEPBEM, ' +#13#10+
          '                                                                                   0 AS VALDEPREAV, ' +#13#10+
          '                       SUM(DECODE(HM5.IDTIPOMOVIMENTACAO, 22, NVL(VM5.VALOR, 0), 0)) AS VALCMULTREAV, ' +#13#10+
          '                                                                                   0 AS VALDEPULTREAV ' +#13#10+
          '                FROM HISTORICOMOVIMENTACAO HM5, ' +#13#10+
          '                     VLRHISTMOVBEM VM5, ' +#13#10+
          '                     REAVALIACAO R3 ' +#13#10+
          '                WHERE HM5.IDBEM = ' + IntToStr(iIdBem) +#13#10+
          '                  AND HM5.IDPESSOA = ' + IntToStr(iEmpresaProp) +#13#10+
          '                  AND HM5.DATAMOVIMENTACAO = ' + QuotedStr(DateToStr(dData)) +#13#10+
          '                  AND VM5.MOECODIGO = ' + IntToStr(iMoeCodigo) +#13#10+
          '                  AND R3.FLGULTREAVAL = 1 ' +#13#10+
          '                  AND HM5.IDMOVIMENTACAO = VM5.IDMOVIMENTACAO (+) ' +#13#10+
          '                  AND HM5.IDREAVALACRESC = R3.IDREAVALIACAO (+) ' +#13#10+
          '                GROUP BY HM5.IDBEM, HM5.DATAMOVIMENTACAO ' +#13#10+
          '                UNION ' +#13#10+
          '                SELECT HM6.IDBEM, HM6.DATAMOVIMENTACAO, ' +#13#10+
          '                                                                                   0 AS VALCMBEM, ' +#13#10+
          '                                                                                   0 AS VALCMREAV, ' +#13#10+
          '                                                                                   0 AS VALDEPBEM, ' +#13#10+
          '                                                                                   0 AS VALDEPREAV, ' +#13#10+
          '                                                                                   0 AS VALCMULTREAV, ' +#13#10+
          '                       SUM(DECODE(HM6.IDTIPOMOVIMENTACAO, 18, NVL(VM6.VALOR, 0), ' +#13#10+
          '                                                          33, NVL(VM6.VALOR, 0), 0)) AS VALDEPULTREAV ' +#13#10+
          '                FROM HISTORICOMOVIMENTACAO HM6, ' +#13#10+
          '                     VLRHISTMOVBEM VM6, ' +#13#10+
          '                     REAVALIACAO R4 ' +#13#10+
          '                WHERE HM6.IDBEM = ' + IntToStr(iIdBem) +#13#10+
          '                  AND HM6.IDPESSOA = ' + IntToStr(iEmpresaProp) +#13#10+
          '                  AND HM6.DATAMOVIMENTACAO = ' + QuotedStr(DateToStr(dData)) +#13#10+
          '                  AND VM6.MOECODIGO = ' + IntToStr(iMoeCodigo) +#13#10+
          '                  AND VM6.IDTAXADEP = ' + IntToStr(iTaxaDep) +#13#10+
          '                  AND R4.FLGULTREAVAL = 1 ' +#13#10+
          '                  AND HM6.IDMOVIMENTACAO = VM6.IDMOVIMENTACAO (+) ' +#13#10+
          '                  AND HM6.IDREAVALACRESC = R4.IDREAVALIACAO (+) ' +#13#10+
          '                GROUP BY HM6.IDBEM, HM6.DATAMOVIMENTACAO) ATX ' +#13#10+
          '         GROUP BY ATX.IDBEM, ATX.DATAMOVIMENTACAO) ATU ' +#13#10+
          'WHERE SB.IDBEM = ' + IntToStr(iIdBem) +#13#10+
          '  AND SB.IDPESSOA = ' + IntToStr(iEmpresaProp) +#13#10+
          '  AND SB.MOECODIGO = ' + IntToStr(iMoeCodigo) +#13#10+
          '  AND SB.IDSLDCTBBEMXDEP = ' + IntToStr(iTaxaDep) +#13#10+
          '  AND SB.IDBEM = ATU.IDBEM (+) ' +#13#10+
          '  AND SB.DATASLDBEM = ATU.DATAMOVIMENTACAO (+) ';

  try
    cdsTemp := TCMClientDataSet.Create( nil );
    cdsTemp.Data := GetDataPacket( sSql );
    if cdsTemp.isEmpty then
         Result := 0
    else Result := cdsTemp.FieldByName('SALDO').AsFloat;
  finally
    FreeAndNil( cdsTemp );
  end;
end;

procedure TCtrlProvisaoImovel.SetCdsProvisaoImovel(
  const Value: TCMClientDataSet);
begin
  FCdsProvisaoImovel := Value;
end;

procedure TCtrlProvisaoImovel.SetDbProvisaoImovel(
  const Value: TDbProvisaoImovel);
begin
  FDbProvisaoImovel := Value;
end;

procedure TCtrlProvisaoImovel.SetDbSaldoProvisaoImovel(
  const Value: TDbSaldoProvisaoImovel);
begin
  FDbSaldoProvisaoImovel := Value;
end;

procedure TCtrlProvisaoImovel.SetidEmpresa(const Value: Integer);
begin
  FidEmpresa := Value;
end;

function TCtrlProvisaoImovel.VerificaMovimentacaoProvisaoPeriodo(
  pIdImovel: Integer; pDataInicioVigencia: TDateTime): Boolean;
var
  cdsAux: TCMClientDataSet;
  sSQL: string;
begin
  Result := False;

  cdsAux := TCMClientDataSet.Create(nil);
  try
    sSQL := 'SELECT 1                   ' +#10#13+
            '  FROM SALDOPROVISAOIMOVEL S ' +#10#13+
            '  JOIN PROVISAOIMOVEL P ON P.IDPROVISAOIMOVEL =  S.IDPROVISAOIMOVEL '#13#10+
            '   AND P.IDIMOVEL = ' + IntToStr(pIdImovel) +#10#13+
            ' WHERE S.DATAPROVISAO >= ' + QuotedStr(DateTimeToStr(pDataInicioVigencia)) + #10#13;
    cdsAux.Data := GetDataPacket(sSQL);

    if  not cdsAux.IsEmpty then
      Result := True;
  finally
    FreeAndNil(cdsAux);
  end;
end;

function TCtrlProvisaoImovel.VerificaProvisaoImoveis(
  sIdImovel: string): OleVariant;
var
  sSQL: String;
begin
  sSQL := 'SELECT I.IDIMOVEL, NVL(P.PERCENTUAL, 0) AS PERCENTUAL ' +#13#10+
          '  FROM IMOVEL I                                        ' +#13#10+
          '  LEFT JOIN PROVISAOIMOVEL P                           ' +#13#10+
          '    ON P.IDIMOVEL = I.IDIMOVEL                         ' +#13#10+
          '   AND P.FLGATIVO = ''S''                              ' +#13#10+
          ' WHERE I.IDIMOVEL IN (' + sIdImovel + ')               ';

  Result := GetDataPacket(sSQL);
end;

procedure TCtrlProvisaoImovel.InicializaContabProvisao;
begin
  if not ParamCAF.CarregaProp(Sistema.IdEmpresa) then
    raise Exception.Create('Parâmetros do sistema inválidos!' + #13 + ParamCAF.MessageInfo);

  if not CafxContab.InicializaMontaContab then
    raise Exception.Create(CafxContab.MessageInfo);

   //----------------------------------------------------------------------------
   // Inicializa a query com a Parametrização contábil
   //----------------------------------------------------------------------------
   if not CafxContab.MontaParamCAFxContab(Sistema.IdEmpresa, ParamCAF.PLANOVIGENTE) then
    raise Exception.Create(CafxContab.MessageInfo);
   //----------------------------------------------------------------------------
end;

function TCtrlProvisaoImovel.ContabilizaProvisao(iIdModulo, iIdPessoa, iIdUsuario: Integer; dDataMov: TDateTime): Boolean;
var
    nPlanilha: Extended;
    iHistMovBem: Integer;
begin
  Result := True;
  //----------------------------------------------------------------------------
  // Registra a Planilha Contábil
  //----------------------------------------------------------------------------
  nPlanilha := CAFxContab.RegistraPlanilhaContabil(iIdModulo,
                                                   iIdPessoa,
                                                   iIdUsuario,
                                                   DateToStr(dDataMov));
  if nPlanilha <= 0 then
  begin
    Result := False;
    raise Exception.Create(CAFxContab.MessageInfo);
  end;

  //----------------------------------------------------------------------------
  // Registra a Planilha no Historico
  //----------------------------------------------------------------------------
  if nPlanilha > 0 then
  begin
    for iHistMovBem := 0 to (iaHistMovBem - 1) do
    begin
      if not HistMovBem.RegistraPlanHistMovBem(aHistMovBem[iHistMovBem],nPlanilha) then
      begin
        Result := False;
        MessageInfo := HistMovBem.MessageInfo + #13 +
                       ' Indice ' + IntToStr(iHistMovBem) +
                       ' Movimento ' + FloattoStr(aHistMovBem[iHistMovBem]);
        raise Exception.Create(MessageInfo);
      end;
    end;
      SetLength(aHistMovBem, 0);
      iaHistMovBem := 0;

  end;
end;

procedure TCtrlProvisaoImovel.SetbContabProvisao(const Value: Boolean);
begin
  FbContabProvisao := Value;
end;

function TCtrlProvisaoImovel.RetornaBem(iIdImovel: integer): OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT IDBEM FROM IMOVELXBEM WHERE IDIMOVEL = ' + IntToStr(iIdImovel);
  Result := GetDataPacket(sSQL);
end;

function TCtrlProvisaoImovel.InsereProvisaoImovelDesmembrado(
  pIdImovelOrigem, pIdImovelDestino: Integer; pDataMov: TDateTime): Integer;
var
  sSQL: string;
  cdsProvisaoImovelNovo: TCMClientDataSet;
  bResult: Boolean;
  sMensagem: string;
begin
  Result := -1;
  cdsProvisaoImovelNovo := TCMClientDataSet.Create(nil);
  try
    try
      sSQL :=  'SELECT ' + IntToStr(pIdImovelDestino) + ' AS IDIMOVEL, ' +#13#10+
               '       PERCENTUAL,  ' +#13#10+
                       DateToStr(pDataMov) + ' AS VIGENCIA_INICIO, ' +#13#10+
               '       0 AS VIGENCIA_FIM, ' +#13#10+
               '       FLGATIVO ' +#13#10+
               '  FROM PROVISAOIMOVEL  ' +#13#10+
               ' WHERE IDIMOVEL = ' + IntToStr(pIdImovelOrigem);

      cdsProvisaoImovelNovo.Data := getDataPacket(sSQL);

      if not cdsProvisaoImovelNovo.IsEmpty then
      begin
        DbProvisaoImovel.IdImovel.AsInteger := cdsProvisaoImovelNovo.FieldByName('IDIMOVEL').AsInteger;
        DbProvisaoImovel.Percentual.AsFloat := cdsProvisaoImovelNovo.FieldByName('PERCENTUAL').AsFloat;
        DbProvisaoImovel.VigenciaInicio.AsDateTime := pDataMov;
        DbProvisaoImovel.VigenciaFim.AsDateTime := 0;
        DbProvisaoImovel.FlgAtivo.AsString := 'S';

        bResult   := DbProvisaoImovel.Insert;
        sMensagem := DbProvisaoImovel.MessageInfo;
        if not bResult then Raise Exception.Create(sMensagem);
        Result := DbProvisaoImovel.IdProvisaoImovel.AsInteger;
      end;

    except
      on e: Exception do
      begin
        Result := -1;
        MessageInfo := E.Message;
      end;
    end;
  finally
    FreeAndNil(cdsProvisaoImovelNovo);
  end;
end;

function TCtrlProvisaoImovel.AtualizaProvisaoImovelDesmembrado(
  pIdImovelOrigem: Integer; pDataMov: TDateTime): Boolean;
var
  sSQL: string;
  cdsProvisaoImovel: TCMClientDataSet;
  bResult: Boolean;
  sMensagem: string;
begin
  cdsProvisaoImovel := TCMClientDataSet.Create(nil);
  try
    try
      sSQL :=  'SELECT IDPROVISAOIMOVEL, ' +#13#10+
               '       IDIMOVEL, ' +#13#10+
               '       PERCENTUAL,  ' +#13#10+
               '       VIGENCIA_INICIO, ' +#13#10+
               '       FLGATIVO ' +#13#10+
               '  FROM PROVISAOIMOVEL  ' +#13#10+
               ' WHERE IDIMOVEL = ' + IntToStr(pIdImovelOrigem);

      cdsProvisaoImovel.Data := getDataPacket(sSQL);

      if not cdsProvisaoImovel.IsEmpty then
      begin
        DbProvisaoImovel.IdProvisaoImovel.AsInteger := cdsProvisaoImovel.FieldByName('IDPROVISAOIMOVEL').AsInteger;
        DbProvisaoImovel.IdImovel.AsInteger := cdsProvisaoImovel.FieldByName('IDIMOVEL').AsInteger;
        DbProvisaoImovel.Percentual.AsFloat := cdsProvisaoImovel.FieldByName('PERCENTUAL').AsFloat;
        DbProvisaoImovel.VigenciaInicio.AsDateTime := cdsProvisaoImovel.FieldByName('VIGENCIA_INICIO').AsDateTime;
        DbProvisaoImovel.VigenciaFim.AsDateTime := pDataMov;
        DbProvisaoImovel.FlgAtivo.AsString := 'N';

        bResult   := DbProvisaoImovel.Update;
        sMensagem := DbProvisaoImovel.MessageInfo;
        if not bResult then Raise Exception.Create(sMensagem);
        Result := bResult;
      end;

    except
      on e: Exception do
      begin
        Result := False;
        MessageInfo := E.Message;
      end;
    end;
  finally
    FreeAndNil(cdsProvisaoImovel);
  end;

end;

function TCtrlProvisaoImovel.VerificaBensBaixados(
  pIdImovel: Integer): Boolean;
var
  sSQL: string;
  cdsAux: TCMClientDataSet;
begin
  Result := False;
  cdsAux := TCMClientDataSet.Create(nil);
  try
    sSQL := 'SELECT COUNT(IB.IDBEM) AS QTD_BENS ' +#13#10+
            '  FROM CM.IMOVELXBEM  IB ' +#13#10+
            '  JOIN CM.IMOVEL IM ON IM.IDIMOVEL = IB.IDIMOVEL AND IM.IDIMOVEL = ' + IntToStr(pIdImovel) +#13#10+
            '  JOIN CM.BEM B ON IB.IDBEM = B.IDBEM AND B.PROPBAIXA < 100';
    cdsAux.Data := GetDataPacket(sSQL);

    Result := cdsAux.FieldByName('QTD_BENS').AsInteger = 0;
  finally
    FreeAndNil(cdsAux);
  end;
end;

end.
