{ Alterações
**********************************************************************
Analista.: Edilaine
SOL......: 196824
Kintana..: 1884092
Data.....: 13/12/2012
Rotina...: BuscaLancamentos
Descrição: nao esta considerando ações judiciais
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 27719
Data.....: 28/04/2007
Rotina...: TrataAcertoAbonoFund
Descrição: Inclusão de 3 novos parâmetros na rotina para tratar a ação judicial que a pessoa teve após o adiantamento.
**********************************************************************
Analista.: Claudio Faria
Pendencia: 24663
Data.....: 25/2007
Rotina...: GeraFolha
Descrição: Gerar Folha apartir de uma lista.
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 26108
Data.....: 16/10/2007
Rotina...: TrataIdosoAbono
Descrição: No abono, quando o idoso tiver rendimento negativo, lança o valor na linha de rendimento
           e não mais na linha de idoso.  
**********************************************************************

Analista.: Bruno Bastos
Pendencia: 18542
Data.....: 21/09/2007
Rotina...: GeraFolha
Descrição: Implementando mensagem ao usuário mostrando as rubricas especiais parametrizadas com li_
           nha de informe.
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 20091
Data.....: 05/07/2007
Rotina...: Várias
Descrição: Implementando a gravação do campo IdProcJud na LancIRRF.
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 24659
Data.....: 25/06/2007
Rotina...: Várias
Descrição: Melhoria no código para unificá-lo posteriormente.
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 24449
Data.....: 18/05/2007
Rotina...: GeraFolha
Descrição: Comentário do código para não mais buscar valores de décimo-terceiro para devolver se a
           pessoa é virou molestia grave.
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 24723
Data.....: 18/05/2007
Rotina...: GeraFolha
Descrição: Alteração para utilizar o tipo de desembolso do favorecido da RubricaxPlano quando for uma
           rubrica de IR.
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 24530
Data.....: 18/04/2007
Rotina...: GeraFolha
Descrição: Separar a gravação dos registros de aposentados/pensionistas dos registros de recebedor de
           pensão alimentícia.
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 23063
Data.....: 10/04/2007
Rotina...: ProcessaEstornos
Descrição: Processar apenas registros com data de pagamento anterior a data inicial da busca.
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 23017
Data.....: 09/04/2007
Rotina...: GeraFolha
Descrição: Ignorar a rubrica que tiver parametrizada com o informe de rendimento de 65 anos.
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 23784
Data.....: 20/11/2006
Rotina...: GeraFolha
Descrição: Inicializar as variáveis que se referem a moléstia grave.
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 23696
Data.....: 07/11/2006
Rotina...: GeraFolha
Descrição: Não processar rubricas com flgespecial <> 0 para a folha de benefícios.
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 22465
Data.....: 18/10/2006
Rotina...: ProcessaEstornos
Descrição: Não utilizar o campo PlaContaRecDesc. Usar agora o PlaConta.
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 23229
Data.....: 01/09/2006
Rotina...: GeraFolha
Descrição: Alterar o filtro na subquery da procjud.
**********************************************************************
Analista.: Paulo Ramos
Pendencia: 21366
Data.....: 21/06/2006
Rotina...: GeraFolha
Descrição: Buscar a diferença do último dia do mês da data de pagamento pela
           data de nascimento.
**********************************************************************
Analista.: Paulo Ramos
Pendencia: 21142
Data.....: 21/06/2006
Rotina...: GeraFolha
Descrição: Eliminar o cdsPessFisica, e incoporar suas informações no cdsDocumentos.
**********************************************************************
Analista.: Flavio Dias
Pendencia: 21712
Data.....: 08/06/2006
Rotina...: GeraFolha
Descrição: Acertar DECODE de FLGDESCONTO para considerar valor 2
**********************************************************************
Analista.: Flavio Dias
Pendencia: 21145
Data.....: 07/06/2006
Rotina...: GeraFolha
Descrição: Utilizar FLGISENTOIRRF para colocar rendimento como ISENTO
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 21550
Data.....: 16/02/2006
Rotina...: ProcessaEstornos
Descrição: Coloquei um NVL no flgestorno.
**********************************************************************
Analista.: Marchetti
Pendencia: Sem pendência
Data.....: 20/01/2006
Rotina...: GeraFolha
Descrição: Mudança nas regras de determinação dos descontos do valor idoso
           conforme determinação FUNCEF
**********************************************************************
Analista.: Bruno Bastos
Pendencia: Sem pendência
Data.....: 16/01/2006
Rotina...: GeraFolha
Descrição: Tirei da condição do while o motivo, já que o mesmo não é usado para
           gravar nada;

           Alterei o filtro da busca individual de idpessoa, para idresponsavel,
           já que é o idresponsavel que é utilizado no update da histrubsal.
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 21254
Data.....: 16/01/2006
Rotina...: GeraFolha
Descrição: Permitir fazer a busca por rubrica.
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 20594
Data.....: 05/12/2005
Rotina...: ProcessaEstornos
Descrição: Buscando a data de pagamento para passar para a função GravaIRRF a
           data de pagamento, caso seja um registro de estorno.
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 20156
Data.....: 13/09/2005
Rotina...: GeraFolha
Descrição: Alterar o sinal dos valores das rubricas informativas, igual aos
           valores das rubricas de desconto para o lançamento na LancxInforme
           ser feito corretamente.
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 19348
Data.....: 30/05/2005
Rotina...: GeraFolha
Descrição: Buscar o idmotivo de abono, somente quando a rubrica de ir
           (FlgTipoDesc = 'I' e FlgTipoDesc = 'K') referente a abono.
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 19259
Data.....: 16/05/2005
Rotina...: GeraFolha
Descrição: Coloquei o teste para saber se tem ou não duas fontes pagadoras, e
           assim permitir o update na histrubsal para a segunda fonte pagadora.
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 19101 e 19102
Data.....: 10/05/2005
Rotina...: ProcessaEstornos
Descrição: Fazer o teste para saber se é para compensar ou não o estorno.
           Situações a não compensar: Décimo Terceiro ou ano de estorno diferente
                                      do ano de lançamento do irrf na lancirrf
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 19187
Data.....: 05/05/2005
Rotina...: GeraFolha
Descrição: Buscar da HistRubSal o campo Plano ao invés de buscar o idplanocontabil
           e colocá-lo no campo PlanoContab do dataset principal (cdsDocumentos).
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 18904
Data.....: 04/05/2005
Rotina...: GeraFolha
Descrição: Foi colocado um filtro pelo valorprovento, dependendo dos campos
           flgdesconto e flgespecial da provdesc
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 19064
Rotina...: GeraFolha
Descrição: Esta função está recebendo mais um parâmetro, que indica se os campos
           CodIrrfDarf e IdInforme, serão buscados na ProvDesc ou somente na
           HistRubSal. Caso busque as informações da ProvDesc, será feita uma
           atualização destes campos na HistRubSal e depois será feito a busca
           normalmente nesta tabela.
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 18976
Rotina...: GeraFolha
Descrição: Buscar o CodCentroCusto na paramFolha e passar para a query
**********************************************************************
Analista.: Marchetti
Pendencia: 18649
Rotina...: GeraFolha
Descrição: Levar em consideracao o FLGDESCONTO para ser trazido na query como negativo
**********************************************************************


CODDIRF
1 - Não vai para Dirf
2 - Rendimento Bruto
3 - IRRF
4 - Deduções
5 - 13º. Salário - Rendimento
6 - 13º. Salário - Deduções
7 - 13º. Salário - IRRF
8 - Compensação por decisão judicial
9 - Rendimentos - Exigibilidade suspensa
10 - 13º. Salário - por decisão judicial
11 - 13º. Salário - exigibilidade suspensa
12 - Por decisão judicial - Anos anteriores
13 - Deduções - exigibilidade suspensa
14 - IRRF - exigibilidade suspensa
15 - 13º Salário - decisão judicial anos anteriores
16 - 13º Salário - Deduções exigibilidade suspensa
17 - 13º Salário - IRRF exigibilidade suspensa
}
unit uCtrlGeraFolhaFUNCEF;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     uCtrlParamIRRF, uCtrLancIRRF, UDiasUteis, umenserro, dialogs, uCMMath, Classes,
     {$IFNDEF VERSAO0505} uCMTypes {$ENDIF}, uCMFileUtils, uCtrlDirf2008, CMwwQuery;
  Type
    TCtrlGeraFolhaFUNCEF = Class(TCmControlObject)

    private
      cdsDocumento     : TClientDataSet;
      cdsRubricas      : TClientDataSet;
      cdsAux           : TClientDataSet;
      cdsInformeDePara : TClientDataSet;
      cdsAux2          : TClientDataSet;
      cdsAux3          : TClientDataSet;
      cdsAux4          : TClientDataSet;
      cdsDet           : TClientDataSet;
      cdsDetAbono      : TClientDataSet;
      cdsMantido       : TClientDataSet;
      cdsParamFolha    : TClientDataSet;
      cdsParamIRRF     : TClientDataSet;
      ParamIRRF        : TCtrlParamIRRF;
      LancIRRF         : TCtrLancIRRF;
      wAno, wMes, wDia : Word;

      bExisteRegraIT   : boolean;  // Edilaine - SOL 196824 / KTN 1884092

      function  VerificaRegraIT(iIdPessoa, iRegraInss : integer): boolean; // Edilaine - SOL 196824 / KTN 1884092

      procedure ProcessaEstornos(IdEmpresa, iTipoFiltro, piIdListaUsuario : Integer; CodNatureza, DataIni : string; UsaPlanoPatro : Boolean);
    procedure ValidaRubricas(const oDocumentos: TClientDataSet;
      var bProcessa: Boolean);
    protected
      procedure DoChangeDataBase; Override;
      procedure AfterInitialize;override;
    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      function GeraFolha(IdEmpresa        : LongInt;
                         iSistema         : integer;
                         DataIni,
                         DataFim,
                         CodNatureza      : string;
                         UsaPlanoPatro : Boolean;
                         iTipoFiltro,
                         iVersao          : Integer;
                         //iPessoa        : Integer; //CPrev - 24663
                         //sListaPessoa   : String;  //CPrev - 24663
                         bBuscaProvDesc: Boolean;
                         sCodRubricas     : String;
                         piIdListaUsuario : Integer; //CPrev - 24663
                         lstRevisao: TStringList) : Boolean;

      function strZero(TamanhoTexto : Integer; Texto : String) : String;  // preenche um valor com zeros a esquerda

      function EstaemTransacao: boolean;
      procedure TrataAcertoAbonoFund(const pbIdoso             : Boolean;
                                     const pbMolestiaGrave     : Boolean;
                                     const pbTemAcao           : Boolean;
                                     const prPercAcao          : Double;
                                     Var   prValorIdoso        : Double;
                                     const piLinhaAbonoAcima65 : Integer;
                                     const piLinhaInformeOrig  : Integer;
                                     const piLinhaRendAcJud13  : Integer);

      procedure TrataAcertoAbonoINSS(const pbIdoso                 : Boolean;
                                     const pbMolestiaGrave         : Boolean;
                                     var   prValorIdoso            : Double;
                                     const piLinhaAbonoAcima65INSS : Integer;
                                     const piLinhaInformeOrig      : Integer);                                     

      procedure TrataIdosoMensal(const piLinhaAcima65     : Integer;
                                 const piLinhaAcima65INSS : Integer;
                                 const piLinhaRend        : Integer;
                                 const piLinhaRendINSS    : integer;
                                 const piLinhaRendAcJud   : Integer;
                                 const prTotRend1         : Double;
                                 const prTotRend2         : Double;
                                 const prValorIdosoAcum   : Double;
                                 const prPercAcao         : Double;
                                 var   prValIdosoFixo     : Double;
                                 var   prValorIdoso       : Double;
                                 const psCodRubricas      : String;
                                 const pbTemAcJud         : Boolean);

      procedure TrataIdosoAbono(const piLinhaAbonoAcima65     : Integer;
                                const piLinhaAbonoAcima65INSS : Integer;
                                const piLinhaRend13           : Integer;
                                const piLinhaRend13INSS       : Integer;
                                const piLinhaRendAcJud13      : Integer;
                                const prValorIdoso13          : Double;
                                const prValorIdoso13Acum      : Double;
                                const prtotRend131            : Double;
                                const prtotRend131A           : Double;
                                const prtotRend132            : Double;
                                const prtotRend132A           : Double;
                                const prPercAcao              : Double;
                                var   prValorIdoso            : Double;
                                var   prValIdosoFixo          : Double;
                                const pbTemAcJud              : Boolean);

      procedure BuscaLancamentos(const psCodRubricas    : String;
                                 //const psListaPessoa  : String;      //CPrev - 24663
                                 //const piPessoa       : Integer;     //CPrev - 24663
                                 const psCodNatureza    : String;
                                 const psCodCentroCusto : String;
                                 const piIdEmpresa      : Integer;
                                 const piTipoFiltro     : Integer;
                                 const piVersao         : Integer;
                                 const piIdListaUsuario : Integer;     //CPrev - 24663 
                                 const pdDataIni        : TDateTime;
                                 const pdDataFim        : TDateTime);

      procedure AtualizaParamHist(//const psListaPessoa  : String;     //CPrev - 24663
                                  //const piIdPessoa     : Integer;    //CPrev - 24663
                                  const piIdListaUsuario : Integer;    //CPrev - 24663
                                  const psCodRubricas : String;
                                  const pdDataIni     : TDateTime;
                                  const pdDataFim     : TDateTime;
                                  const piIdVersao    : Integer);

      procedure TrataDeducaoDepAbono(const piIdInformeDedDepAbono    : Integer;
                                     const piIdInformeDedDepAbonoMol : Integer;
                                     const piAno                     : Integer;
                                     const piIdPessoa                : Integer;
                                     const pbMolestiaGrave           : Boolean);

      procedure BuscaDedDepAbono(const piIdInformeDedDepAbono    : Integer;
                                 const piIdInformeDedDepAbonoMol : Integer;
                                 const piAno                     : Integer;
                                 const piIdPessoa                : Integer);

      procedure ApagaRegistro(const piIdPessoa                : Integer;
                              const piIdInformeDedDepAbono    : Integer;
                              const piIdInformeDedDepAbonoMol : Integer;
                              const piAno                     : Integer);

      procedure BuscaParametros(const piIdEmpresa: Integer);

      function RetornaExcepcional : Boolean;

    protected

    End;

implementation
Uses FGeraFolhaMT;

{ TCtrlGeraFolha }

procedure TCtrlGeraFolhaFUNCEF.AfterInitialize;
begin
  inherited;
  ParamIRRF.InitializeAs(self);
  LancIRRF.InitializeAs(self);
  ParamIRRF.OpenTransaction := False;
  LancIRRF.OpenTransaction := False;
end;


function TCtrlGeraFolhaFUNCEF.EstaemTransacao: boolean;
begin
  if DbConnectionType = cntBDE then
    Result := DataBase.InTransaction
  else
    Result := DbAdoConnection.InTransaction;
end;


constructor TCtrlGeraFolhaFUNCEF.Create;
begin
  inherited;
  cdsDocumento     := TClientDataSet.Create(nil);
  cdsRubricas      := TClientDataSet.Create(nil);
  cdsAux           := TClientDataSet.Create(nil);
  cdsInformeDePara := TClientDataSet.Create(nil);
  cdsAux2          := TClientDataSet.Create(nil);
  cdsAux3          := TClientDataSet.Create(nil);
  cdsAux4          := TClientDataSet.Create(nil);
  cdsDet           := TClientDataSet.Create(nil);
  cdsDetAbono      := TClientDataSet.Create(nil);
  cdsMantido       := TClientDataSet.Create(nil);
  cdsparamFolha    := TClientDataSet.Create(nil);
  cdsParamIRRF     := TClientDataSet.Create(nil);
  ParamIRRF        := TCtrlParamIRRF.create;
  LancIRRF         := TCtrLancIRRF.Create;
end;

destructor TCtrlGeraFolhaFUNCEF.Destroy;
begin
  inherited;
  cdsDocumento.free;
  cdsRubricas.free;
  cdsAux.free;
  cdsInformeDePara.free;
  cdsAux2.free;
  cdsAux3.free;
  cdsAux4.free;
  cdsDet.free;
  cdsDetAbono.free;
  cdsParamIRRF.free;
  ParamIRRF.free;
  LancIRRF.free;
  cdsMantido.free;
  cdsParamFolha.free;
end;

procedure TCtrlGeraFolhaFUNCEF.DoChangeDataBase;
begin
  inherited;
end;

procedure TCtrlGeraFolhaFuncef.ValidaRubricas(const oDocumentos : TClientDataSet;
                                              var bProcessa : Boolean);
begin
  frmGeraFolhaMT.memResult.Lines.Add('Início da Verificação de Rubricas: '+formatdatetime('dd/mm/yyyy hh:nn:ss', now));
  With oDocumentos do
  Begin
    First;
    While not EOF do
    begin
      If fieldbyname('FLGDESCONTO').asinteger <> 2 then
      begin
        If trim(fieldbyname('CODIRRFDARF').asstring) = '' then
        begin
          MostraMensagem('A Rubrica '+FieldbyName('IDPROVENTO').asString +
                         ' está sem a informação de Natureza de Rendimentos Preenchida.' +
                         ' Favor verificar o Cadastro de Rubricas Salariais, no Sistema' +
                         ' de Folha de Benefícios. ');
          bProcessa := False;
        end;
      end;
      Next;
    end;
    First;
  end;
  frmGeraFolhaMT.memResult.Lines.Add('Fim da Verificação de Rubricas: '+formatdatetime('dd/mm/yyyy hh:nn:ss', now));
end;

function TCtrlGeraFolhaFUNCEF.GeraFolha(IdEmpresa : LongInt;
                                  iSistema : integer;
                                        DataIni,
                                        DataFim,
                                  CodNatureza : string;
                                  UsaPlanoPatro : Boolean;
                                  iTipoFiltro,
                                        iVersao          : Integer;
                                  bBuscaProvDesc: Boolean;
                                        sCodRubricas     : String;
                                        piIdListaUsuario : Integer; //CPrev - 24663
                                  lstRevisao: TStringList) : Boolean;

var
  iCodLanc,               iCodLanc2,              rValIRRFINSS,      rValBaseINSS,
  rValorLinha,            rValorLinhaSinal,       rValIRRF,          rValBase,
  dPercAcao,              rTotRend131A,           rTotRend132A,      rTotRend1,
  rTotRend2,              rTotRend131,            rTotRend132,       rValorIdosoacum,
  rValorIdoso13acum,      rValorIdoso,            rValorIdoso13,     rValIdosoFixo,
  iCodLancAux                                                                              : Double;

  iIdPatro,               iIdPlanoPrev,           iIdModulo,         iIdMotivo,
  iIdPrograma,            iCont,                  iIdFoBenef,        iLinhaInforme,
  iIdPessoa,              iLinhaAcima65,          iLinhaAcima65INSS, iLinhaAbonoAcima65,
  iLinhaAbonoAcima65INSS, iFontePagadora,         iLinhaRend,        iLinhaRendINSS,
  iLinhaRend13,           iLinhaRend13INSS,       iLinhaRendAcJud,   iLinhaRendAcJud13,
  iFlgPensaoAlim,         iPlanoContab,           iIdMolestiagrave,  iIdMolestiaGraveINSS,
  iPosicao,               iLinhaDedDepAbono,      iLinhaDedDepAbonoMol,
  iLinhaAbonoOrigFund,    iLinhaAbonoOrigINSS,    iIdProcJudFund,    iIdProcJudINSS,
  iMeses,                 iContLstRub                                                                              : Integer;

  sCodCentroCusto,        sIdMotivoAtuHist,       sCodNatur,         sDataEfet,
  sSql,                   sCodCentroRespon,       sCodtiprecdes,     sPlacontac            : String;

  b65acumprimvez,         b65acumprimvezabono,    bIdoso,            bMolestiaGrave,
  bTemAcJud,              bBaseSeparada,          bPrim,             bFaltaParmMolestia,
  bFaltaParmMais65,       bFaltaPrograma,         bProcessa,         bTemDecTerc,
  bAchouRub                                                                                : Boolean;

  dDataComparaIdade,      dDataIni,               dDataFim                                 : TDateTime;

  iAno,                   iMes,                   iDia                                     : Word;
  lstRubricaEspecial                                                                       : TStringList;
  iRegraInssIT : integer; // Edilaine - SOL 196824 / KTN 1884092
begin

    iCont := 0;
    DecodeDate(Date, wAno, wMes, wDia);

    lstRubricaEspecial    := TStringList.Create;

    cdsAux.Data           := GetDataPacket('SELECT VALORPARAM FROM PARAMFOLHA WHERE NOMEPARAM = ''CODCCUSTOFINAN''');
    cdsInformeDePara.Data := GetDataPacket('SELECT * FROM cm.INFORMEDEPARA ORDER BY IDSITUACAO, IDINFORMEORIGEM ');

    If cdsAux.FieldByName('VALORPARAM').AsString = '' Then
      sCodCentroCusto := ' '
    Else
      sCodCentroCusto := cdsAux.FieldByName('VALORPARAM').AsString;

  InicializaFormulario(True);
  MostraMensagemComLinha('BUSCA LANÇAMENTOS DA FOLHA DE BENEFÍCIOS');
  MostraMensagemComLinha('Início do Processamento: '+formatdatetime('dd/mm/yyyy hh:nn:ss', now));
  MostraMensagemComLinha('Parâmetros para a Busca dos Lançamentos :');

    bFaltaParmMolestia := False;
    bFaltaParmMais65   := False;
    bFaltaPrograma     := False;
    bProcessa          := True;
    bBaseSeparada      := True;
    b65acumprimvez     := True;

  // Busca os Paramentros necessarios para as validações.
    BuscaParametros(Sistema.IdEmpresa);

    iLinhaDedDepAbono    := cdsParamFolha.FieldByName('IDINFORME').AsInteger;
    iLinhaDedDepAbonoMol := cdsParamFolha.FieldByName('IDINFORMEDESTINO').AsInteger;

    if cdsParamIRRF.IsEmpty then
    begin
      bFaltaPrograma := True;
      bProcessa      := false;
    end;

    iIdPrograma       := cdsParamIRRF.FieldByName('IDPROGRAMA').AsInteger;
    cdsParamIRRF.data := ParamIRRF.ProcurarParamIRRF(IdEmpresa);

    If (trim(cdsParamIrrf.fieldbyname('IDINFORMEMOLESTIA').asString) = '') then
    begin
      bfaltaParmMolestia := true;
      bProcessa          := false;
    end
    else
    begin
      iIdMolestiagrave     := cdsParamIrrf.fieldbyname('IDINFORMEMOLESTIA').AsInteger;
      iIdMolestiagraveINSS := cdsParamIrrf.fieldbyname('IDINFORMEMOLINSS').AsInteger;
    end;

    If (trim(cdsParamIrrf.fieldbyname('IDINFORME65ANOS').asString) = '') then
    begin
      bFaltaParmMais65       := True;
      bProcessa              := False;
    end
    else
    begin
      iLinhaAcima65          := cdsParamIrrf.fieldbyname('IDINFORME65ANOS').asInteger;
      iLinhaAcima65INSS      := cdsParamIrrf.fieldbyname('IDINFORME65INSS').asInteger;
      iLinhaRendAcJud        := cdsParamIrrf.fieldbyname('IDINFORMEACJUD').asInteger;
      iLinhaRendAcJud13      := cdsParamIrrf.fieldbyname('IDINFORMEACJUD13').asInteger;
      iLinhaAbonoAcima65     := cdsParamIRRF.FieldByName('IDINFORME65ANOS13').AsInteger;
      iLinhaAbonoAcima65INSS := cdsParamIRRF.FieldByName('IDINFORME65INSS13').AsInteger;
      iRegraInssIT           := cdsParamIrrf.fieldbyname('IdRegraInss').asInteger;          // Edilaine - SOL 196824 / KTN 1884092
    end;

    Result   := True;
    dDataIni := StrToDate(DataIni);
    dDataFim := strTodate(DataFim);

    {Atualizar IdInforme e CodIRRFDARF na HistRubSal com as informações vindas da ProvDesc}
    If bBuscaProvDesc Then
    Begin
      //AtualizaParamHist(sListaPessoa, sCodRubricas, dDataIni, dDataFim, iPessoa, iVersao); //CPrev - 24663
      AtualizaParamHist(piIdListaUsuario, //CPrev - 24663
                        sCodRubricas,
                        dDataIni,
                        dDataFim,
                        iVersao);
    End;

    {Query principal do processo}
    If bProcessa then
    begin
    MostraMensagem('Linha do Informe para Maiores de 65 anos : PREENCHIDA');
    MostraMensagemComLinha('Linha do Informe para Moléstia Grave     : PREENCHIDA');
    MostraMensagem('Inicio da seleção de Registros a processar: ' + FormatDateTime('hh:nn:ss',Time));

      //CPrev - 24663 - Inicio
      //BuscaLancamentos(sCodRubricas, sListaPessoa, CodNatureza, sCodCentroCusto, IdEmpresa, iTipoFiltro, iVersao, iPessoa, dDataIni, dDataFim);

    // Essa Rotina é a responsável por buscar as informações que serão utilizadas no
    // processamento da folha, para criação das linhas de informes de rendimento.

      BuscaLancamentos( sCodRubricas,
                        CodNatureza,
                        sCodCentroCusto,
                        IdEmpresa,
                        iTipoFiltro,
                        iVersao,
                        piIdListaUsuario,
                        dDataIni,
                        dDataFim);
      //CPrev - 24663 - Fim

    MostraMensagem('Final da seleção de Registros a processar: ' + FormatDateTime('hh:nn:ss',Time));


    IncrementaPasso(0,cdsDocumento.RecordCount);

      cdsDocumento.First;
      iPosicao := 0;

      If not cdsDocumento.eof then
      begin
        // VERIFICANDO SE AS CONDICOES DE PROCESSAMENTO ESTÃO SATISFEITAS - INICIO
      MostraMensagem('Inicio de processamento: ' + FormatDateTime('hh:nn:ss',Time));

        cdsDocumento.First;
        if not bBuscaProvDesc Then
        ValidaRubricas(cdsDocumento,bProcessa);

        // VERIFICANDO SE AS CONDICOES DE PROCESSAMENTO ESTÃO SATISFEITAS - FIM
        If bProcessa then
        begin

          sDataEfet := '';

          cdsDocumento.first;
          While not cdsDocumento.EOF do
          Begin
            Inc(iCont);
            sIdMotivoAtuHist := '';

            DecodeDate(cdsDocumento.FieldByName('DATAPAGAMENTO').AsDateTime, iAno, iMes, iDia);
            dDataComparaIdade := DiasUteis.UltDiaMes(iAno, iMes);
            iMeses := DiasUteis.IntervaloMeses(cdsDocumento.fieldByname('DATANASC').AsDateTime, dDataComparaIdade) div 12; 
            if (not cdsDocumento.fieldByname('DATANASC').IsNull) and                      //os .25 ficam por conta do ano bisexto que a cada 4 anos tem mais um dia.
               (iMeses >= cdsParamIRRF.fieldByname('IDADEIDOSO').AsInteger) Then
              bIdoso := true
            else
              bIdoso := False;

            {Testa se o recebedor está em molestia grave - Início}
            if cdsDocumento.fieldByname('DATAMOLESTIAGRAVE').IsNull then
            begin
              if ((cdsDocumento.fieldByname('FLGMOLESTIAGRAVE').AsInteger = 1) or
                  (cdsDocumento.fieldByname('FLGISENTOIRRF').AsInteger    = 1)) then
              begin
                bMolestiaGrave := True
              end
              else
              begin
                bMolestiaGrave := False
              end;
            end
            else
            begin
              if (cdsDocumento.fieldByname('DATAMOLESTIAGRAVE').AsDateTime <= StrToDate(DataFim)) and
                 ((cdsDocumento.fieldByname('FLGMOLESTIAGRAVE').AsInteger   = 1) or
                  (cdsDocumento.fieldByname('FLGISENTOIRRF').AsInteger      = 1)) then
              begin
                bMolestiaGrave := True
              end
              else
              begin
                bMolestiaGrave := False
              end;
            end;
            {Testa se o recebedor está em molestia grave - Fim}

            bTemAcJud           := (cdsdocumento.FieldByName('TEMACAO').AsInteger = 1);
            dPercAcao           := cdsdocumento.FieldByName('PERCACAO').AsFloat;
            iIdPlanoPrev        := cdsDocumento.FieldByName('IDPLANOPREV').AsInteger;
            iIdFoBenef          := cdsDocumento.FieldByName('IDHSTFOLHABENEF').AsInteger;
            iIdPessoa           := cdsDocumento.FieldByName('IDPESSOA').AsInteger;
            sCodNatur           := trim(cdsDocumento.FieldByName('CODIRRFDARF').AsString);
            iIdMotivo           := cdsDocumento.FieldByName('IDMOTIVO').AsInteger;
            iFlgPensaoAlim      := cdsDocumento.FieldByName('FLGPENSAOALIM').AsInteger;
            bTemDecTerc         := False;
            iLinhaAbonoOrigFund := 0;
            iLinhaAbonoOrigINSS := 0;
            iIdProcJudFund      := 0;
            iIdProcJudINSS      := 0;
            b65acumprimvez      := True;
            b65acumprimvezabono := True;

            bExisteRegraIT      := VerificaRegraIT(iIdPessoa, iRegraInssIT );    // Edilaine - SOL 196824 / KTN 1884092

            if sDataEfet <> cdsDocumento.FieldByName('DATAPAGAMENTO').AsString Then
            Begin
              sDataEfet         := cdsDocumento.FieldByName('DATAPAGAMENTO').AsString;
              cdsParamIRRF.Data := GetDataPacket(
                                                 'SELECT ' +
                                                 '    VLRIDOSO AS VLRIDOSOS, ' +
                                                 '    IDADEIDOSO ' +
                                                 'FROM ' +
                                                 '    HSTPARAMIRRF   ' +
                                                 'WHERE ' +
                                                 '    DATAINIVIGENCIA = (SELECT MAX(DATAINIVIGENCIA) ' +
                                                 '                       FROM   HSTPARAMIRRF   ' +
                                                 '                       WHERE  DATAINIVIGENCIA <= TO_DATE(' + QuotedStr(sDataEfet) + ',''DD/MM/YYYY''))');
            end;
            rValIdosoFixo := cdsParamIRRF.FieldByName('VLRIDOSOS').AsFloat;
            rValorIdoso   := cdsParamIRRF.FieldByName('VLRIDOSOS').AsFloat;
            rValorIdoso13 := cdsParamIRRF.FieldByName('VLRIDOSOS').AsFloat;
            bBaseSeparada := (cdsDocumento.FieldByName('FLGSOMAIRSUPINSS').AsInteger = 0);

            Try
              If not InTransaction Then
                StartTransaction;

              cdsDet.Close;
              Ssql := 'SELECT (0) AS VLRLANCSINAL, IDINFORME, IDLANCIRRF, PERCLANC, VLRLANC, FONTEPAGADORA '+
                      'FROM  LANCXINFORME  '+
                      'WHERE (1 = 2)';
              cdsDet.data     := GetDataPacket(SSql);

              rTotRend1         := 0;
              rTotRend2         := 0;
              rTotRend131       := 0;
              rTotRend132       := 0;
              rTotRend131A      := 0;
              rTotRend132A      := 0;
              rValorIdosoacum   := 0;
              rValorIdoso13acum := 0;

              While (cdsDocumento.FieldByName('IDPESSOA').AsFloat           = iIdPessoa)      and
                    (cdsDocumento.FieldByName('IDHSTFOLHABENEF').AsInteger  = iIdFoBenef)     and
                    (trim(cdsDocumento.FieldByName('CODIRRFDARF').AsString) = sCodNatur)      and
                    (cdsDocumento.FieldByName('IDPLANOPREV').AsInteger      = iIdPlanoPrev)   and
                    (cdsDocumento.FieldByName('FLGPENSAOALIM').AsInteger    = iFlgPensaoAlim) and
                    (not cdsDocumento.EOF) do
              Begin
                iPosicao         := iPosicao + 1;
                rValIRRF         := 0;
                rValBase         := 0;
                rValIRRFINSS     := 0;
                rValBaseINSS     := 0;
                iIdPatro         := cdsDocumento.FieldByName('IDPESSJUR').AsInteger;
                iIdPlanoPrev     := cdsDocumento.FieldByName('IDPLANOPREV').AsInteger;
                sCodCentroCusto  := cdsDocumento.FieldByName('CODCENTROCUSTO').AsString;
                iIdMotivo        := cdsDocumento.FieldByName('IDMOTIVO').AsInteger;
                iIdModulo        := cdsDocumento.FieldByName('IDMODULO').AsInteger;
                sCodCentroRespon := cdsDocumento.FieldByName('CODCENTRORESPON').AsString;

                if (bTemAcJud) {and
                   ((cdsDocumento.FieldByName('CODIRRFDARF').AsString = '7416') or
                    (cdsDocumento.FieldByName('CODIRRFDARF').AsString = '7431'))} then   // Edilaine - SOL 196824 / KTN 1884092 - comentado
                begin
                  if (cdsDocumento.FieldByName('FONTEPAGADORA').AsInteger = 1) then
                    iIdProcJudFund := cdsdocumento.fieldByname('IDPROCJUD').AsInteger
                  else
                    iIdProcJudINSS := cdsdocumento.fieldByname('IDPROCJUD').AsInteger;
                end;    

                While (cdsDocumento.FieldByName('IDPESSOA').AsFloat           = iIdPessoa)      and
                      (cdsDocumento.FieldByName('IDHSTFOLHABENEF').AsInteger  = iIdFoBenef)     and
                      (cdsDocumento.FieldByName('IDPESSJUR').AsInteger        = iIdPatro)       and
                      (cdsDocumento.FieldByName('IDPLANOPREV').AsInteger      = iIdPlanoPrev)   and
                      (cdsDocumento.FieldByName('FLGPENSAOALIM').AsInteger    = iFlgPensaoAlim) and
                      (trim(cdsDocumento.FieldByName('CODIRRFDARF').AsString) = sCodNatur)      and
                      (not cdsDocumento.EOF) do
                Begin
                  
                  if ( cdsDocumento.FieldByName('FLGESPECIAL').AsInteger = 1 ) and
                     ( not cdsDocumento.FieldByName('IDINFORME').IsNull      ) then
                  begin
                    bAchouRub := False;
                    for iContLstRub := 0 to lstRubricaEspecial.Count - 1 do
                    begin
                      if lstRubricaEspecial[iContLstRub] = cdsDocumento.FieldByName('IDPROVENTO').AsString then
                        bAchouRub := True;
                    end;

                    if not bAchouRub then
                      lstRubricaEspecial.Add( cdsDocumento.FieldByName('IDPROVENTO').AsString );
                  end;
                  

                  if Trim(sIdMotivoAtuHist) = '' Then
                    sIdMotivoAtuHist  := cdsDocumento.FieldByName('IDMOTIVO').AsString
                  else
                  Begin
                    If Pos(cdsDocumento.FieldByName('IDMOTIVO').AsString, sIdMotivoAtuHist) <= 0 Then
                      sIdMotivoAtuHist  := sIdMotivoAtuHist + ',' + cdsDocumento.FieldByName('IDMOTIVO').AsString;
                  End;

                  iLinhaInforme    := cdsDocumento.FieldByName('IDINFORME').AsInteger;
                  rValorLinha      := cdsDocumento.FieldByName('VALOR').AsFloat;
                  rValorLinhaSinal := cdsDocumento.FieldByName('VALORSINAL').AsFloat;

                  if (iLinhaInforme = iLinhaAcima65)    or
                     (iLinhaInforme = iLinhaAcima65INSS) then
                  begin
                    cdsdocumento.next;
                    Continue;
                  end;

                  iFontePagadora   := cdsDocumento.FieldByName('FONTEPAGADORA').AsInteger;

                  {Guardar o valor de IRRF nas variáveis}
                  if cdsDocumento.FieldByName('FLGIRRF').AsString = 'S' then
                  begin
                    If (cdsdocumento.FieldByName('FLGESPECIAL').AsInteger = 0) Then
                    Begin
                      if not bBaseSeparada or (iFontePagadora = 1) then
                      begin
                        rValIRRF := rValIRRF+ (cdsDocumento.FieldByName('VALORSINAL').AsFloat * -1);
                        If cdsDocumento.FieldByName('IDMODULO').AsInteger = 18 then
                          rValBase := rValBase + cdsDocumento.FieldByName('VALORINFO').AsFloat;
                      end
                      else
                      begin
                        rValIRRFINSS := rValIRRFINSS + (cdsDocumento.FieldByName('VALORSINAL').AsFloat * -1);
                        If cdsDocumento.FieldByName('IDMODULO').AsInteger = 18 then
                          rValBaseINSS := rValBaseINSS + cdsDocumento.FieldByName('VALORINFO').AsFloat;
                      end;
                      iPlanoContab    := cdsDocumento.FieldByName('PLANOCONTAB').AsInteger;
                      sCodtiprecdes   := cdsDocumento.FieldByname('CODTIPRECDES').AsString;
                      sPlacontac      := cdsDocumento.FieldByname('PLACONTAC').AsString;
                    End;
                  end;

                  If iPlanoContab = 0 Then
                    iPlanoContab    := cdsDocumento.FieldByName('PLANOCONTAB').AsInteger;

                  If sCodtiprecdes = '' Then
                    sCodtiprecdes   := cdsDocumento.FieldByname('CODTIPRECDES').AsString;

                  If sPlacontac = '' Then
                    sPlacontac      := cdsDocumento.FieldByname('PLACONTAC').AsString;

                  if (cdsDocumento.FieldByName('FLGBASE').AsString = 'S') or
                     (cdsDocumento.FieldByName('CODDIRF').AsInteger = 5) then
                  Begin
                    if cdsDocumento.FieldByName('IDMODULO').AsInteger = 18 then
                    Begin
                      if bMolestiaGrave Then
                      Begin
                        If (sCodNatur <> '3223') then
                        begin
                          if (cdsDocumento.FieldByName('FLGBASE').AsString = 'S') then
                          begin
                            if cdsDocumento.FieldByName('CODDIRF').AsInteger <> 5 then
                            begin
                              If cdsInformeDePara.Locate('IDSITUACAO; IDINFORMEORIGEM', VarArrayOf(['1', cdsDocumento.FieldByName('IDINFORME').AsString]), []) Then
                                iLinhaInforme := cdsInformeDePara.FieldByName('IDINFORMEDESTINO').AsInteger;
                            end
                            else
                            begin
                              If cdsInformeDePara.Locate('IDSITUACAO; IDINFORMEORIGEM', VarArrayOf(['1', cdsDocumento.FieldByName('IDINFORME').AsString]), []) Then
                                iLinhaInforme := cdsInformeDePara.FieldByName('IDINFORMEDESTINO').AsInteger;
                              iLinhaRend13      := cdsDocumento.FieldByName('IDINFORME').AsInteger;
                            end;
                          end;
                        end
                        else
                        begin
                          If (cdsParamFolha.Fieldbyname('PARAMRESGATE').asInteger = 1) then
                          begin
                            if (cdsDocumento.FieldByName('FLGBASE').AsString = 'S') then
                              iLinhaInforme := cdsDocumento.FieldByName('IDINFORME').AsInteger
                            else
                              if (cdsDocumento.FieldByName('FLGBASE').AsString = 'S') then
                                iLinhaInforme := iIdMolestiaGrave;

                            if bBaseSeparada then
                              if cdsDocumento.FieldByName('FONTEPAGADORA').AsInteger = 1 then
                                iLinhaInforme := iIdMolestiaGrave
                              else
                                iLinhaInforme := iIdMolestiaGraveINSS;
                          end;
                        end;
                      end
                      else
                      Begin
                        If bIdoso Then
                        Begin
                          cdsAux.Close;

                          if (cdsDocumento.FieldByName('CODDIRF').AsInteger <> 5) And
                             (rValorIdosoacum = 0) And
                             (b65acumprimvez) Then
                          Begin
                            b65acumprimvez := False;
                            Ssql := 'SELECT SUM(DECODE(H.FLGDESCONTO,0,H.VALORPROVENTO,1,-H.VALORPROVENTO)) AS VLRBASE65 '+
                                    'FROM  HISTRUBSAL H '+
                                    'WHERE H.IDRESPONSAVEL = ' + cdsDocumento.FieldByName('IDPESSOA').Asstring + ' AND ' +
                                    '      TO_CHAR(H.DATAPAGAMENTO,''YYYY/MM'') = ''' + copy(sDataEfet, 7,4) + '/' + copy(sDataEfet, 4,2) + ''' AND ' +
                                    '      H.IDMODULO = 18 AND ' +
                                    '      H.IDLANCIRRF IS NOT NULL AND ' +
                                    '      H.FLGESTORNO = 0 AND '+
                                    '      H.IDINFORME IN (SELECT IDINFORME FROM INFORME WHERE FLGBASE = ''S'' )';
                            cdsAux.data     := GetDataPacket(SSql);

                            if not cdsAux.EOF Then
                              rValorIdosoacum := cdsAux.FieldByName('VLRBASE65').AsFloat;

                          end
                          else
                          Begin
                            If (rValorIdoso13acum = 0) And
                               (b65acumprimvezabono) Then
                            Begin
                              b65acumprimvezabono := False;
                              sSql := ' SELECT SUM(LI.VLRLANC) AS VLRBASE65 '+
                                      ' FROM LANCXINFORME LI, LANCIRRF L '+
                                      ' WHERE LI.IDLANCIRRF = L.IDLANCIRRF '+
                                      '   AND LI.IDINFORME IN ('+IntToStr(iLinhaAbonoAcima65)+','+IntToStr(iLinhaAbonoAcima65INSS)+')'+
                                      '   AND TO_CHAR(L.DATAPAGAMENTO, ''YYYY'') = '+QuotedStr(Copy(cdsDocumento.fieldByname('DATAPAGAMENTO').AsString, 7, 4))+
                                      '   AND L.IDBENEFIRRF = '+cdsDocumento.fieldByname('IDPESSOA').AsString;
                              cdsAux.data     := GetDataPacket(SSql);

                              if not cdsAux.EOF Then
                                rValorIdoso13acum := cdsAux.FieldByName('VLRBASE65').AsFloat;
                            End;
                          end;

                          if cdsDocumento.FieldByName('CODDIRF').AsInteger <> 5 Then
                          Begin

                            case cdsDocumento.FieldByName('FONTEPAGADORA').AsInteger of
                              1 : Begin
                                    rTotRend1 := rTotRend1 + cdsDocumento.FieldByName('VALORSINAL').AsFloat;
                                    iLinhaRend := iLinhaInforme;
                                  end;
                              2 : Begin
                                    rTotRend2 := rTotRend2 + cdsDocumento.FieldByName('VALORSINAL').AsFloat;
                                    iLinhaRendINSS := iLinhaInforme;
                                  end;
                            end;

                            rValorLinha      := 0;
                            rValorLinhaSinal := 0;

                          end
                          else
                          Begin
                            cdsRubricas.First;
                            if cdsRubricas.Locate('CODPROVDESC', Trim(cdsDocumento.FieldByName('CODPROVDESC').AsString),[]) then
                            begin
                              case cdsDocumento.FieldByName('FONTEPAGADORA').AsInteger of
                                1 : Begin
                                      rTotRend131A  := rTotRend131A + cdsDocumento.FieldByName('VALORSINAL').AsFloat;
                                      iLinhaRend13  := iLinhaInforme;
                                    end;
                                2 : Begin
                                      rTotRend132A      := rTotRend132A + cdsDocumento.FieldByName('VALORSINAL').AsFloat;
                                      iLinhaRend13INSS  := iLinhaInforme;
                                    end;
                              end;
                            end
                            else
                            begin
                              case cdsDocumento.FieldByName('FONTEPAGADORA').AsInteger of
                                1 : Begin
                                      rTotRend131  := rTotRend131 + cdsDocumento.FieldByName('VALORSINAL').AsFloat;
                                      iLinhaRend13 := iLinhaInforme;
                                    end;
                                2 : Begin
                                      rTotRend132      := rTotRend132 + cdsDocumento.FieldByName('VALORSINAL').AsFloat;
                                      iLinhaRend13INSS := iLinhaInforme;
                                    end;
                              end;
                            end;

                            rValorLinha      := 0;
                            rValorLinhaSinal := 0;

                          end;
                        end;
                      end;
                    end;
                  end;

                  if (cdsDocumento.FieldByName('CODDIRF').AsInteger = 5) then
                  begin
                    bTemDecTerc     := True;
                    if cdsDocumento.FieldByName('FONTEPAGADORA').AsInteger = 1 then
                      iLinhaAbonoOrigFund := cdsDocumento.FieldByName('IDINFORME').AsInteger
                    else
                      iLinhaAbonoOrigINSS := cdsDocumento.FieldByName('IDINFORME').AsInteger;
                  end;

                  if rValorLinha <> 0 then
                  begin
                    If bTemAcJud and (iFontePagadora = 1) and
                       (cdsdocumento.fieldByname('FLGBASE').AsString  = 'S') And
                       (not bMolestiaGrave) and
                       (iFlgPensaoAlim <> 2) Then
                    Begin
                      {Trata linha do informe mensal de ação judicial e normal}
                      If (cdsdocumento.fieldByname('CODDIRF').AsString <> '5') Then
                      Begin
                        if cdsDet.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([iLinhaRendAcJud,iFontePagadora]), []) Then
                        Begin
                          cdsDet.Edit;
                          cdsDet.FieldByName('IDINFORME').AsInteger  := iLinhaRendAcJud;
                          cdsDet.FieldByName('VLRLANC').AsFloat      := cdsDet.FieldByName('VLRLANC').AsFloat + RoundCM((rValorLinha * dPercAcao)/100, 2) ;
                          cdsDet.FieldByName('VLRLANCSINAL').AsFloat := cdsDet.FieldByName('VLRLANCSINAL').AsFloat + RoundCM((rValorLinhaSinal * dPercAcao)/100, 2);
                        end
                        else
                        Begin
                          cdsDet.Insert;
                          cdsDet.FieldByName('IDINFORME').AsInteger     := iLinhaRendAcJud;
                          cdsDet.FieldByName('VLRLANC').AsFloat         := RoundCM((rValorLinha * dPercAcao) / 100, 2);
                          cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM((rValorLinhaSinal * dPercAcao) / 100, 2);
                          cdsDet.FieldByName('FONTEPAGADORA').AsInteger := iFontePagadora;
                        end;

                        if cdsDet.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([iLinhaInforme,iFontePagadora]), []) Then
                        Begin
                          cdsDet.Edit;
                          cdsDet.FieldByName('IDINFORME').AsInteger  := iLinhaInforme;
                          cdsDet.FieldByName('VLRLANC').AsFloat      := cdsDet.FieldByName('VLRLANC').AsFloat + RoundCM((rValorLinha * (100 - dPercAcao))/100, 2);
                          cdsDet.FieldByName('VLRLANCSINAL').AsFloat := cdsDet.FieldByName('VLRLANCSINAL').AsFloat + RoundCM((rValorLinhaSinal * (100 - dPercAcao))/100, 2);
                        end
                        else
                        Begin
                          cdsDet.Insert;
                          cdsDet.FieldByName('IDINFORME').AsInteger     := iLinhaInforme;
                          cdsDet.FieldByName('VLRLANC').AsFloat         := RoundCM((rValorLinha * (100 - dPercAcao))/100, 2);
                          cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM((rValorLinhaSinal * (100 - dPercAcao))/100, 2);
                          cdsDet.FieldByName('FONTEPAGADORA').AsInteger := iFontePagadora;
                        end;
                      End
                      Else
                      Begin
                        {Trata Linha do Informe de Décimo terceiro de ação judicial e normal}
                        if cdsDet.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([iLinhaRendAcJud13,iFontePagadora]), []) Then
                        Begin
                          cdsDet.Edit;
                          cdsDet.FieldByName('IDINFORME').AsInteger  := iLinhaRendAcJud13;
                          cdsDet.FieldByName('VLRLANC').AsFloat      := cdsDet.FieldByName('VLRLANC').AsFloat + RoundCM((rValorLinha * dPercAcao)/100, 2) ;
                          cdsDet.FieldByName('VLRLANCSINAL').AsFloat := cdsDet.FieldByName('VLRLANCSINAL').AsFloat + RoundCM((rValorLinhaSinal * dPercAcao)/100, 2);
                        end
                        else
                        Begin
                          cdsDet.Insert;
                          cdsDet.FieldByName('IDINFORME').AsInteger     := iLinhaRendAcJud13;
                          cdsDet.FieldByName('VLRLANC').AsFloat         := RoundCM((rValorLinha * dPercAcao) / 100, 2);
                          cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM((rValorLinhaSinal * dPercAcao) / 100, 2);
                          cdsDet.FieldByName('FONTEPAGADORA').AsInteger := iFontePagadora;
                        end;

                        if cdsDet.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([iLinhaInforme,iFontePagadora]), []) Then
                        Begin
                          cdsDet.Edit;
                          cdsDet.FieldByName('IDINFORME').AsInteger  := iLinhaInforme;
                          cdsDet.FieldByName('VLRLANC').AsFloat      := cdsDet.FieldByName('VLRLANC').AsFloat + RoundCM((rValorLinha * (100 - dPercAcao))/100, 2);
                          cdsDet.FieldByName('VLRLANCSINAL').AsFloat := cdsDet.FieldByName('VLRLANCSINAL').AsFloat + RoundCM((rValorLinhaSinal * (100 - dPercAcao))/100, 2);
                        end
                        else
                        Begin
                          cdsDet.Insert;
                          cdsDet.FieldByName('IDINFORME').AsInteger     := iLinhaInforme;
                          cdsDet.FieldByName('VLRLANC').AsFloat         := RoundCM((rValorLinha * (100 - dPercAcao))/100, 2);
                          cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM((rValorLinhaSinal * (100 - dPercAcao))/100, 2);
                          cdsDet.FieldByName('FONTEPAGADORA').AsInteger := iFontePagadora;
                        end;
                      End;
                    End
                    Else
                    Begin
                      If bMolestiaGrave Then
                        If cdsInformeDePara.Locate('IDSITUACAO; IDINFORMEORIGEM', VarArrayOf(['1', cdsDocumento.FieldByName('IDINFORME').AsString]), []) Then
                          iLinhaInforme := cdsInformeDePara.FieldByName('IDINFORMEDESTINO').AsInteger;

                      if cdsDet.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([iLinhaInforme,iFontePagadora]), []) Then
                      Begin
                        cdsDet.Edit;
                        cdsDet.FieldByName('IDINFORME').AsInteger  := iLinhaInforme;
                        cdsDet.FieldByName('VLRLANC').AsFloat      := RoundCM(cdsDet.FieldByName('VLRLANC').AsFloat + rValorLinha, 2);
                        cdsDet.FieldByName('VLRLANCSINAL').AsFloat := RoundCM(cdsDet.FieldByName('VLRLANCSINAL').AsFloat + rValorLinhaSinal, 2);
                      end
                      else
                      Begin
                        cdsDet.Insert;
                        cdsDet.FieldByName('IDINFORME').AsInteger     := iLinhaInforme;
                        cdsDet.FieldByName('VLRLANC').AsFloat         := RoundCM(rValorLinha, 2);
                        cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM(rValorLinhaSinal, 2);
                        cdsDet.FieldByName('FONTEPAGADORA').AsInteger := iFontePagadora;
                      end;
                    End;
                    cdsDet.Post;
                  end;
                  cdsDocumento.Next;

                IncrementaPasso(cdsDocumento.Recno,cdsDocumento.RecordCount);
                end;
              end;

              {Tratamento da linha de idoso, tanto fundação como inss}
              TrataIdosoMensal(iLinhaAcima65,
                               iLinhaAcima65INSS,
                               iLinhaRend,
                               iLinhaRendINSS,
                               iLinhaRendAcJud,
                               rTotRend1,
                               rTotRend2,
                               rValorIdosoacum,
                               dPercAcao,
                               rValIdosoFixo,
                               rValorIdoso,
                               sCodRubricas,
                               bTemAcJud);

              {Tratamento da linha de idoso para abono, tanto fundação como inss}
              TrataIdosoAbono(iLinhaAbonoAcima65,
                              iLinhaAbonoAcima65INSS,
                              iLinhaRend13,
                              iLinhaRend13INSS,
                              iLinhaRendAcJud13,
                              rValorIdoso13,
                              rValorIdoso13acum,
                              rTotRend131,
                              rTotRend131A,
                              rTotRend132,
                              rTotRend132A,
                              dPercAcao,
                              rValorIdoso,
                              rValIdosoFixo,
                              bTemAcJud);


              {Tratamento de }
              if bTemDecTerc Then
              Begin
                sSql := ' SELECT '                                                    + #13#10 +
                        '   (SUM(LI.VLRLANC) * -1) AS VALOR, '                        + #13#10 +
                        '   LI.FONTEPAGADORA, '                                       + #13#10 +
//CPrev - Pend. 27719 -                          '   L.DATALANCAMENTO, '                                       + #13#10 +
                        '   LI.IDINFORME, '                                           + #13#10 +
                        '   I.CODDIRF '                                               + #13#10 +

                        ' FROM '                                                      + #13#10 +
                        '   INFORME I, '                                              + #13#10 +
                        '   LANCXINFORME LI, '                                        + #13#10 +
                        '   LANCIRRF L '                                              + #13#10 +

                        ' WHERE (I.CODDIRF = ''5'' OR I.IDINFORME IN ('+IntToStr(iLinhaAbonoAcima65)+','+IntToStr(iLinhaRendAcJud13)+')) '+ #13#10 +
                        '   AND LI.IDINFORME               = I.IDINFORME '            + #13#10 +
                        '   AND L.IDLANCIRRF               = LI.IDLANCIRRF '          + #13#10 +
                        '   AND L.IDBENEFIRRF              = '+IntToStr(iIdPessoa)    + #13#10 +
                        '   AND NVL(LI.FLGTIPOREG, ''N'') IN  (''N'', ''D'')'         + #13#10 +
                        '   AND L.DATALANCAMENTO BETWEEN TO_DATE('+QuotedStr('01/01/'+IntToStr(iAno))+', ''DD/MM/YYYY'') AND ' + #13#10 +
                        '                                TO_DATE('+QuotedStr('31/12/'+IntToStr(iAno))+', ''DD/MM/YYYY'') '     + #13#10 +

                        ' GROUP BY '                                                  + #13#10 +
                        '   LI.FONTEPAGADORA, '                                       + #13#10 +
//CPrev - Pend. 27719 -                        '   L.DATALANCAMENTO, '                                       + #13#10 +
                        '   LI.IDINFORME, '                                           + #13#10 +
                        '   I.CODDIRF '                                               + #13#10 +

                        
                        ' HAVING '                                                    + #13#10 +
                        '   SUM(LI.VLRLANC) > 0 '                                     + #13#10 +
                        

                        ' ORDER BY '                                                  + #13#10 +
                        '   LI.FONTEPAGADORA '                                        + #13#10 ;
//CPrev - Pend. 27719 -                        '   L.DATALANCAMENTO ';

                cdsAux.Data := GetDataPacket(sSql);

                Ssql        := 'SELECT (0) AS VLRLANCSINAL, IDINFORME, IDLANCIRRF, PERCLANC, VLRLANC, FONTEPAGADORA, FLGTIPOREG '+
                               'FROM  LANCXINFORME  '+
                               'WHERE (1 = 2)';

                cdsDetAbono.data  := GetDataPacket(SSql);

                TrataAcertoAbonoFund(bIdoso, bMolestiaGrave, bTemAcJud, dPercAcao, rValorIdoso, iLinhaAbonoAcima65, iLinhaAbonoOrigFund, iLinhaRendAcJud13);
                TrataAcertoAbonoINSS(bIdoso, bMolestiaGrave, rValorIdoso, iLinhaAbonoAcima65INSS, iLinhaAbonoOrigINSS);
                TrataDeducaoDepAbono(iLinhaDedDepAbono, iLinhaDedDepAbonoMol, iAno, iIdPessoa, bMolestiaGrave);

                //Testa se tem algum registro com valor diferente de zero - Início
                cdsDetAbono.First;
                while not cdsDetAbono.Eof do
                begin
                  if cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat = 0 Then
                    cdsDetAbono.delete
                  Else
                    cdsDetAbono.Next;
                end;
                //Testa se tem algum registro com valor diferente de zero - Fim

                if not cdsDetAbono.IsEmpty then
                begin
                  LancIRRF.GravaIRRF(IdEmpresa,
                                     UsaPlanoPatro,
                                     0,
                                     IdEmpresa,
                                     iIdPessoa,
                                     sCodNatur,
                                     sDataEfet,
                                     rValBaseINSS,
                                     rValIRRFINSS,
                                     0,
                                     0,
                                     rValBaseINSS,
                                     0,
                                     0,
                                     0,
                                     0,
                                     cdsDetAbono.data,
                                     iCodLancAux,
                                     sPlacontac,
                                     iPlanoContab,
                                     'S',
                                     iIdPlanoPrev,
                                     iIdPatro,
                                     iIdPrograma,
                                     bPrim,
                                     iIdModulo,
                                     iIdModulo,
                                     iIdMotivo,
                                     sCodCentroCusto,
                                     iIdFoBenef,
                                     sCodtiprecdes,
                                     sPlacontac,
                                     sCodCentroRespon,
                                     0,
                                     0,
                                     False,
                                     0,
                                     True,
                                     '',
                                     0,
                                     iFlgPensaoAlim)
                end;
              End; {if bTemDecTerc Then}

//------------------------------------------------------------------------------------------------
              iCodLanc  := 0;
              bPrim     := True;

              cdsAux3.Close;
              cdsAux4.Close;

              Ssql := 'SELECT (0) AS VLRLANCSINAL, IDINFORME, IDLANCIRRF, PERCLANC, VLRLANC, FONTEPAGADORA '+
                      'FROM  LANCXINFORME  '+
                      'WHERE (1 = 2)';
              cdsAux3.data     := GetDataPacket(SSql);
              cdsAux4.Data     := GetDataPacket(SSql);

              cdsDet.first;
              while not cdsDet.eof do
              begin
                If cdsDet.FieldByName('VLRLANCSINAL').AsFloat <> 0 Then
                Begin
                  if cdsDet.FieldByName('FONTEPAGADORA').AsInteger = 1 then
                  begin
                    cdsAux3.Insert;
                    cdsAux3.FieldByName('IDINFORME').AsInteger     := cdsDet.FieldByName('IDINFORME').AsInteger;
                    cdsAux3.FieldByName('VLRLANC').AsFloat         := cdsDet.FieldByName('VLRLANC').AsFloat;
                    cdsAux3.FieldByName('VLRLANCSINAL').AsFloat    := cdsDet.FieldByName('VLRLANCSINAL').AsFloat;
                    cdsAux3.FieldByName('FONTEPAGADORA').AsInteger := cdsDet.FieldByName('FONTEPAGADORA').AsInteger;
                    cdsAux3.Post;
                  end;

                  if cdsDet.FieldByName('FONTEPAGADORA').AsInteger = 2 then
                  begin
                    cdsAux4.Insert;
                    cdsAux4.FieldByName('IDINFORME').AsInteger     := cdsDet.FieldByName('IDINFORME').AsInteger;
                    cdsAux4.FieldByName('VLRLANC').AsFloat         := cdsDet.FieldByName('VLRLANC').AsFloat;
                    cdsAux4.FieldByName('VLRLANCSINAL').AsFloat    := cdsDet.FieldByName('VLRLANCSINAL').AsFloat;
                    cdsAux4.FieldByName('FONTEPAGADORA').AsInteger := cdsDet.FieldByName('FONTEPAGADORA').AsInteger;
                    cdsAux4.Post;
                  end;
                End;
                cdsDet.Next;
              end;

              if not cdsAux3.isempty then
                LancIRRF.GravaIRRF(IdEmpresa,
                                   UsaPlanoPatro,
                                   0,
                                   IdEmpresa,
                                   iIdPessoa,
                                   sCodNatur,
                                   sDataEfet,
                                   rValBase,
                                   rValIRRF,
                                   0,
                                   0,
                                   rValBase,
                                   0,
                                   0,
                                   0,
                                   0,
                                   cdsAux3.data,
                                   iCodLanc,
                                   sPlacontac,
                                   iPlanoContab,
                                   'S',
                                   iIdPlanoPrev,
                                   iIdPatro,
                                   iIdPrograma,
                                   bPrim,
                                   iIdModulo,
                                   iIdModulo,
                                   iIdMotivo,
                                   sCodCentroCusto,
                                   iIdFoBenef,
                                   sCodtiprecdes,
                                   sPlacontac,
                                   sCodCentroRespon,
                                   0,
                                   0,
                                   False,
                                   0,
                                   True,
                                   '',
                                   0,
                                   iFlgPensaoAlim,
                                   iIdProcJudFund)
              else
              begin
                if not bBaseSeparada then
                begin
                  rValBaseINSS:=rValBase;
                  rValIRRFINSS:=rValIRRF;
                  rValBase:=0;
                  rValIRRF:=0;
                end;
              end;

              if not cdsAux4.IsEmpty then
              begin
                iCodLanc2 := 0;
                bPrim     := True;
                LancIRRF.GravaIRRF(IdEmpresa,
                                   UsaPlanoPatro,
                                   0,
                                   IdEmpresa,
                                   iIdPessoa,
                                   sCodNatur,
                                   sDataEfet,
                                   rValBaseINSS,
                                   rValIRRFINSS,
                                   0,
                                   0,
                                   rValBaseINSS,
                                   0,
                                   0,
                                   0,
                                   0,
                                   cdsAux4.data,
                                   iCodLanc2,
                                   sPlacontac,
                                   iPlanoContab,
                                   'S',
                                   iIdPlanoPrev,
                                   iIdPatro,
                                   iIdPrograma,
                                   bPrim,
                                   iIdModulo,
                                   iIdModulo,
                                   iIdMotivo,
                                   sCodCentroCusto,
                                   iIdFoBenef,
                                   sCodtiprecdes,
                                   sPlacontac,
                                   sCodCentroRespon,
                                   0,
                                   0,
                                   False,
                                   0,
                                   True,
                                   '',
                                   0,
                                   iFlgPensaoAlim,
                                   iIdProcJudINSS)
              end;

              If iCodLanc > 0 Then
              Begin
                ssql := 'UPDATE HISTRUBSAL H SET H.IDLANCIRRF = '+ FloatTostr(iCodLanc)+#13#10+
                        'WHERE ';

                if iIdFoBenef <> 0 then
                  sSql := sSql + ' (H.IDHSTFOLHABENEF = '+IntToStr(iIdFoBenef)+') '+#13#10;

                sSql := sSql + ' AND (H.IDMOTIVO IN ('+sIdMotivoAtuHist+')) ';
                sSql := sSql + ' AND (H.IDRESPONSAVEL = '+IntToStr(iIdPessoa)+') '+#13#10+
                               ' AND (H.DATAPAGAMENTO >= TO_DATE('''+DateToStr(dDataIni)+''',''DD/MM/YYYY'')) '+#13#10+
                               ' AND (H.DATAPAGAMENTO <= TO_DATE('''+DateToStr(dDataFim)+''',''DD/MM/YYYY'')) '+#13#10+
                               ' AND (H.IDMODULO = 18)  '+#13#10;

                sSql := sSql + 'AND H.FONTEPAGADORA = 1 ' +#13#10+
                        'AND (NVL(H.IDPLANOCONTABIL,H.IDPLANOPREV) ='+IntToStr(iIdPlanoPrev)+' )'+
                        'AND (H.CODIRRFDARF = '+QuotedStr(sCodNatur)+' OR H.CODIRRFDARF IS NULL)'+#13#10;

                If Pos(',', sCodRubricas) > 0 Then
                Begin
                  If Trim(sCodRubricas) <> '' Then
                    sSql := sSql + '  AND (IDRUBRICA IN ('+sCodRubricas+')) ';
                End
                Else
                  If Trim(sCodRubricas) <> '' Then
                    sSql := sSql + '  AND (IDRUBRICA = '+sCodRubricas+') ';

                if iFlgPensaoAlim = 2 Then
                  sSql := sSql + ' AND (H.FLGPENSAOALIM = 2) ' + #13#10
                else
                  sSql := sSql + ' AND (H.FLGPENSAOALIM in (0, 1))' + #13#10;

                if not ExecSQL(sSql) then
                  Raise Exception.Create(messageinfo);
              End;

              if iCodLanc2 > 0 Then
              Begin
                ssql := 'UPDATE HISTRUBSAL H SET H.IDLANCIRRF = '+ FloatTostr(iCodLanc2)+#13#10+
                        'WHERE ';

                if iIdFoBenef <> 0 then
                  sSql := sSql + ' (H.IDHSTFOLHABENEF = '+IntToStr(iIdFoBenef)+') '+#13#10;

                sSql := sSql + ' AND (H.IDMOTIVO IN ('+sIdMotivoAtuHist+')) ';
                sSql := sSql + ' AND (H.IDRESPONSAVEL = '+IntToStr(iIdPessoa)+') '+#13#10+
                               ' AND (H.DATAPAGAMENTO >= TO_DATE('''+DateToStr(dDataIni)+''',''DD/MM/YYYY'')) '+#13#10+
                               ' AND (H.DATAPAGAMENTO <= TO_DATE('''+DateToStr(dDataFim)+''',''DD/MM/YYYY'')) '+#13#10+
                               ' AND (H.IDMODULO = 18)  '+#13#10;

                sSql := sSql + 'AND H.FONTEPAGADORA = 2 ' +#13#10+
                        'AND (NVL(H.IDPLANOCONTABIL,H.IDPLANOPREV) ='+IntToStr(iIdPlanoPrev)+' )'+
                        'AND (H.CODIRRFDARF = '+QuotedStr(sCodNatur)+' OR H.CODIRRFDARF IS NULL)'+#13#10;

                If Pos(',', sCodRubricas) > 0 Then
                Begin
                  If Trim(sCodRubricas) <> '' Then
                    sSql := sSql + '  AND (IDRUBRICA IN ('+sCodRubricas+')) ';
                End
                Else
                  If Trim(sCodRubricas) <> '' Then
                    sSql := sSql + '  AND (IDRUBRICA = '+sCodRubricas+') ';

                if iFlgPensaoAlim = 2 Then
                  sSql := sSql + ' AND (H.FLGPENSAOALIM = 2) ' + #13#10
                else
                  sSql := sSql + ' AND (H.FLGPENSAOALIM in (0, 1))' + #13#10;

                if not ExecSQL(sSql) then
                  Raise Exception.Create(messageinfo);
              End;


              If ((iCont mod 1000) = 0) or
                 (cdsDocumento.Eof) Then
                Commit;

            Except
              On E:Exception Do
              Begin
                cdsDocumento.Next;
              MostraMensagem('Verificar o IdPessoa: ' + IntToStr(iIdPessoa));
                MessageInfo := E.Message;
              End;
            end;
          end;

          
        MostraMensagem('Atenção: rubricas com situação especial parametrizadas com linha de informe! Verifique.');
        for iContLstRub := 0  to lstRubricaEspecial.Count - 1 do
          MostraMensagem('código interno da rubrica: '+ lstRubricaEspecial[iContLstRub]);

        lstRubricaEspecial.Free;
          

        MostraMensagemComLinha('Fim do Processamento: '+formatdatetime('dd/mm/yyyy hh:nn:ss', now));
        result := true;
      end
      else
      begin
        MostraMensagem('O processamento foi interrompido na fase de verificação devido a inconsistências cadastrais ');
        MostraMensagemComLinha('e só poderá ser executado completamente se estas informações estiverem parametrizadas.');
        MostraMensagemComLinha('Fim do Processamento: '+formatdatetime('dd/mm/yyyy hh:nn:ss', now));
          result := false;
        end;
      end
      else
      begin
        //CPREV - 24663 - ProcessaEstornos(IdEmpresa, iTipoFiltro, iPessoa, CodNatureza, DataIni, UsaPlanoPatro);
        ProcessaEstornos(IdEmpresa, iTipoFiltro, piIdListaUsuario, CodNatureza, DataIni, UsaPlanoPatro); //CPREV - 24663

      MostraMensagemComLinha('NÃO HÁ NADA A PROCESSAR');
      MostraMensagemComLinha('Fim do Processamento: '+formatdatetime('dd/mm/yyyy hh:nn:ss', now));
        result := false;
      end;
    end
    else
    begin
    MostraMensagemComLinha('');
      If bfaltaParmMolestia then
      MostraMensagem('Linha do Informe para Moléstia Grave não preenchida.');

      If bFaltaParmMais65 then
      MostraMensagem('Linha do Informe para Maiores de 65 anos não preenchida.');

      If bFaltaPrograma then
      MostraMensagem('Tipo de Programa Previdenciário no cadastro Global não preenchido.');

      Linha;
    MostraMensagem('O processamento só poderá ser feito se estas informações estiverem parametrizadas.');
    MostraMensagem('Fim do Processamento: '+formatdatetime('dd/mm/yyyy hh:nn:ss', now));
      result := false;
  end;
end;



function TCtrlGeraFolhaFUNCEF.strZero(TamanhoTexto: Integer;
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

procedure TCtrlGeraFolhaFUNCEF.ProcessaEstornos(IdEmpresa, iTipoFiltro, piIdListaUsuario : Integer; CodNatureza, DataIni : string; UsaPlanoPatro : Boolean);
var
   sSQL            : String;
   iPosicao        : Integer;
   iCodLanc        : Double;
   bPrimVez        : Boolean;

   sDataPagamento  : String; 
   sDataLancamento : String;
   iIdBenefIrrf    : Integer;
   fVlrBase        : Real;
   sCodNatureza    : String;
   fVlrIrrf        : Real;
   sNumDocumento   : String;
   fVlrreferencia  : Real;
   iPlano          : Integer;
   iPlanoPrev      : Integer;
   sPlaconta       : String;
   iPatro          : Integer;
   iPrograma       : Integer;
   sCodCentroCusto : String;

   iIDMotivo       : Integer;
   iIDHistFolha    : Integer;
   sCodTipRecDes   : String;
   sPlaContaD      : String;
   sCodCentroRespon: String;

   sAnoProc        : String;
   bFlgCompensa    : Boolean;

begin
    try
       SSql :=
       'SELECT DISTINCT '                                                                  + #13 +
       '    L.IDLANCIRRF, '                                                                + #13 +
       '    L.DATALANCAMENTO, '                                                            + #13 +
       '    L.IDPESSOA, '                                                                  + #13 +
       '    L.IDBENEFIRRF, '                                                               + #13 +
       '    L.VLRBASE, '                                                                   + #13 +
       '    L.CODNATUREZA, '                                                               + #13 +
       '    L.VLRIRRF, '                                                                   + #13 +
       '    L.NUMDOCUMENTO, '                                                              + #13 +
       '    L.VLRREFERENCIA, '                                                             + #13 +
       '    L.PLANO, '                                                                     + #13 +
       '    L.PLACONTA, '                                                                  + #13 +
       '    L.FLGFOLHA, '                                                                  + #13 +
       '    L.IDMODULO, '                                                                  + #13 +
       '    L.IDMOTIVO, '                                                                  + #13 +
       '    L.IDHSTFOLHABENEF, '                                                           + #13 +
       '    L.IDPROGRAMA, '                                                                + #13 +
       '    L.CODCENTROCUSTO, '                                                            + #13 +
       '    L.CODTIPRECDES, '                                                              + #13 +
       '    L.PLACONTA AS PLACONTARECDES, '                                                + #13 +
       '    L.IDPLANOPREV, '                                                               + #13 +
       '    MIN(H.MES) AS MES, '                                                           + #13 +
       '    L.IDPATRO, '                                                                   + #13 +
       '    L.CODCENTRORESPON, '                                                           + #13 +
       '    H.DATAPAGAMENTO '                                                              + #13 +  
       'FROM '                                                                             + #13 +
       '    LANCIRRF L, HISTRUBSAL H '                                                     + #13 +
       'WHERE '                                                                            + #13 +
       '    H.IDMODULO           = 18 '                                                    + #13 +
       'AND H.IDPESSJUR          = ' + IntToStr(IdEmpresa)                                 + #13 +
       'AND NVL(H.FLGESTORNO, 0)<> 0 '                                                     + #13 + 
       'AND H.IDLANCIRRF        IS NOT NULL '                                              + #13 +
       'AND H.IDLANCIRRFESTORNO IS NULL '                                                  + #13 +
       'AND L.IDLANCIRRF         = H.IDLANCIRRF '                                          + #13 +
       'AND H.DATAPAGAMENTO     <= TO_DATE('+QuotedStr(DataIni)+', ''DD/MM/YYYY'') '       + #13 ; 

       If iTipoFiltro = 1 then
          ssql := ssql +
          'AND H.CODIRRFDARF       = '+QuotedStr(CodNatureza) + #13;

       //CPrev - 24663 - Inicio
       // If (iPessoa > 0) then
       //    ssql := ssql +
       //    'AND H.IDPESSOA             = '+Inttostr(iPessoa) + #13;
       If piIdListaUsuario > 0 Then
         sSql:= sSql + ' AND EXISTS (SELECT 1 FROM LISTAFOLHABENEFDET LD '                       + #13#10 +
                                   ' WHERE H.IDTITULAR     = LD.IDTITULAR '                      + #13#10 +
                                     ' AND H.IDRESPONSAVEL = LD.IDPESSOA '                       + #13#10 +
                                     ' AND LD.IDLISTA      = '+ IntToStr(piIdListaUsuario) +') ' + #13#10;

       //CPrev - 24663 - Fim

       sSql := sSql + ' GROUP BY           '                                    + #13 +
                      ' L.IDLANCIRRF,      '                                    + #13 +
                      ' L.DATALANCAMENTO,  '                                    + #13 +
                      ' L.IDPESSOA,        '                                    + #13 +
                      ' L.IDBENEFIRRF,     '                                    + #13 +
                      ' L.VLRBASE,         '                                    + #13 +
                      ' L.CODNATUREZA,     '                                    + #13 +
                      ' L.VLRIRRF,         '                                    + #13 +
                      ' L.NUMDOCUMENTO,    '                                    + #13 +
                      ' L.VLRREFERENCIA,   '                                    + #13 +
                      ' L.PLANO,           '                                    + #13 +
                      ' L.PLACONTA,        '                                    + #13 +
                      ' L.FLGFOLHA,        '                                    + #13 +
                      ' L.IDMODULO,        '                                    + #13 +
                      ' L.IDMOTIVO,        '                                    + #13 +
                      ' L.IDHSTFOLHABENEF, '                                    + #13 +
                      ' L.IDPROGRAMA,      '                                    + #13 +
                      ' L.CODCENTROCUSTO,  '                                    + #13 +
                      ' L.CODTIPRECDES,    '                                    + #13 +
                      
                      ' L.PLACONTA,  '                                          + #13 + 
                      ' L.IDPLANOPREV,     '                                    + #13 +
                      ' L.IDPATRO,         '                                    + #13 +
                      ' H.DATAPAGAMENTO,   '                                    + #13 +  
                      ' L.CODCENTRORESPON  '                                    + #13 ;

       cdsDocumento.data := GetDataPacket(Ssql);

       iPosicao                             := 0;

       IncrementaPasso(0,cdsDocumento.RecordCount);

       cdsDocumento.First;

       try
         StartTransacao;
         While not cdsDocumento.EOF do
         Begin

            IncrementaPasso(cdsDocumento.Recno,cdsDocumento.RecordCount);

            sDataLancamento := DataIni;  
            sDataPagamento  := cdsDocumento.FieldByName('DATAPAGAMENTO').AsString; 
            iIdBenefIrrf    := cdsDocumento.FieldByName('IDBENEFIRRF').AsInteger;
            fVlrBase        := cdsDocumento.FieldByName('VLRBASE').AsFloat;
            sCodNatureza    := cdsDocumento.FieldByName('CODNATUREZA').AsString;
            fVlrIrrf        := cdsDocumento.FieldByName('VLRIRRF').AsFloat * -1;
            fVlrreferencia  := cdsDocumento.FieldByName('VLRBASE').AsFloat * -1;
            iPlano          := cdsDocumento.FieldByName('PLANO').AsInteger;
            iPlanoPrev      := cdsDocumento.FieldByName('IDPLANOPREV').AsInteger;
            sPlaconta       := cdsDocumento.FieldByName('PLACONTA').AsString;
            iPatro          := cdsDocumento.FieldByName('IDPATRO').AsInteger;
            iPrograma       := cdsDocumento.FieldByName('IDPROGRAMA').AsInteger;
            sCodCentroCusto := cdsDocumento.FieldByName('CODCENTROCUSTO').AsString;
            iIDMotivo       := cdsDocumento.FieldByName('IDMOTIVO').AsInteger;
            iIDHistFolha    := cdsDocumento.FieldByName('IDHSTFOLHABENEF').AsInteger;
            sCodTipRecDes   := cdsDocumento.FieldByName('CODTIPRECDES').AsString;
            sPlaContaD      := cdsDocumento.FieldByName('PLACONTARECDES').AsString;
            sCodCentroRespon:= cdsDocumento.FieldByName('CODCENTRORESPON').AsString;
            sAnoProc        := Copy(cdsDocumento.FieldByName('DATALANCAMENTO').AsString, 7, 4);

            If (wAno <> StrToInt(sAnoProc)) Or
               (Copy(cdsDocumento.FieldByName('MES').AsString, 6, 2) = '13') Then
              bFlgCompensa := False
            Else
              bFlgCompensa := True;
            cdsAux.Data := GetDataPacket('SELECT * FROM LANCXINFORME WHERE IDLANCIRRF = ' + cdsDocumento.FieldByName('IDLANCIRRF').AsString);
            Ssql := 'SELECT (0) AS VLRLANCSINAL, IDINFORME, IDLANCIRRF, PERCLANC, VLRLANC, FONTEPAGADORA '+
                    '  FROM  LANCXINFORME '+
                    ' WHERE (1 = 2)';

            cdsDet.data     := GetDataPacket(SSql);

            while not cdsAux.eof do
            begin

               cdsDet.Insert;
               cdsDet.FieldByName('IDINFORME').AsInteger  := cdsAux.FieldByName('IDINFORME').AsInteger;
               cdsDet.FieldByName('VLRLANC').AsFloat      := cdsAux.FieldByName('VLRLANC').AsFloat * -1;
               cdsDet.FieldByName('FONTEPAGADORA').AsFloat:= cdsAux.FieldByName('FONTEPAGADORA').AsFloat; 
               cdsDet.Post;

               cdsAux.Next;
            end;

            bPrimVez := True;
            iCodLanc:=0; 
            LancIRRF.GravaIRRF(IdEmpresa,
                               UsaPlanoPatro,
                               0,
                               IdEmpresa,
                               iIdBenefIrrf,
                               sCodNatureza,
                               sDataLancamento,
                               fVlrBase,
                               fVlrIrrf,
                               0,
                               0,
                               fVlrreferencia,
                               0,
                               0,
                               0,
                               0,
                               cdsDet.data,
                               iCodLanc,
                               sPlaconta,
                               iPlano,
                               'S',
                               iPlanoPrev,
                               iPatro,
                               iPrograma,
                               bPrimVez,
                               18,
                               18,
                               iIDMotivo,
                               sCodCentroCusto,
                               iIDHistFolha,
                               sCodTipRecDes,
                               sPlaContaD,
                               sCodCentroRespon,
                               0,
                               0,
                               true  //restorno
                               , 0,
                               bFlgCompensa, 
                               sDataPagamento); 

            Ssql := 'UPDATE HISTRUBSAL SET IDLANCIRRFESTORNO = '+ FloatTostr(iCodLanc)                + #13 +
                    'WHERE '                                                                          + #13 +
                    '    IDMODULO          = 18 '                                                     + #13 +
                    'AND FLGESTORNO        <> 0 '                                                     + #13 +
                    'AND IDRESPONSAVEL     = ' + IntToStr(iIdBenefIrrf)                               + #13 +
                    'AND IDHSTFOLHABENEF   = ' + IntToStr(iIDHistFolha)                               + #13 +
                    'AND IDLANCIRRF        = ' + cdsDocumento.FieldByName('IDLANCIRRF').AsString;

            if not ExecSQL(sSql) then
               Raise Exception.Create(messageinfo);
            cdsDocumento.Next;

         end;
         Commit;
      Except
         On E:Exception Do
         Begin
            Rollback;
            MessageInfo := E.Message;
         end;
      end;
   finally
   end;

end;



function TCtrlGeraFolhaFUNCEF.RetornaExcepcional: Boolean;
begin
   cdsAux.Data := GetDataPacket('SELECT NVL(FLGEXCEPCIONAL,0) AS FLGEXCEPCIONAL FROM PARAMEMPTMO');
   Result := (cdsAux.FieldByName('FLGEXCEPCIONAL').AsInteger = 1);
end;

procedure TCtrlGeraFolhaFUNCEF.TrataAcertoAbonoFund(const pbIdoso             : Boolean;
                                                    const pbMolestiaGrave     : Boolean;
                                                    const pbTemAcao           : Boolean;
                                                    const prPercAcao          : Double;
                                                    Var   prValorIdoso        : Double;
                                                    const piLinhaAbonoAcima65 : Integer;
                                                    const piLinhaInformeOrig  : Integer;
                                                    const piLinhaRendAcJud13  : Integer);

Var
  rTotal        : double;
  iLinhaInforme : Integer;

begin
  {Tratamento de Pessoas que ficaram Isenta ou Idosas durante o ano}
  {13º da Fundação                                                 }
  if pbMolestiaGrave Then
  Begin

    {Lançar as linhas de informe negativas}
    rTotal := 0;
    While (not cdsAux.Eof) And (cdsAux.FieldByName('FONTEPAGADORA').AsInteger = 1) Do
    Begin
      rTotal := rTotal + (cdsAux.FieldByName('VALOR').AsFloat*-1);

      If cdsDetAbono.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([cdsAux.FieldByName('IDINFORME').AsInteger, 1]), []) Then
      Begin
        cdsDetAbono.Edit;
        cdsDetAbono.FieldByName('VLRLANC').AsFloat      := RoundCM(cdsDetAbono.FieldByName('VLRLANC').AsFloat + cdsAux.FieldByName('VALOR').AsFloat, 2);
        cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat := RoundCM(cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat + cdsAux.FieldByName('VALOR').AsFloat, 2);
        cdsDetAbono.FieldByName('FLGTIPOREG').AsString  := 'D';
        cdsDetAbono.Post;
      End
      Else
      Begin
        cdsDetAbono.Insert;
        cdsDetAbono.FieldByName('IDINFORME').AsInteger     := cdsAux.FieldByName('IDINFORME').AsInteger;
        cdsDetAbono.FieldByName('VLRLANC').AsFloat         := RoundCM(cdsAux.FieldByName('VALOR').AsFloat, 2);
        cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM(cdsAux.FieldByName('VALOR').AsFloat, 2);
        cdsDetAbono.FieldByName('FLGTIPOREG').AsString     := 'D';
        cdsDetAbono.FieldByName('FONTEPAGADORA').AsInteger := 1;
        cdsDetAbono.Post;
      End;

      if cdsAux.FieldByName('CODDIRF').AsString = '5' Then
        iLinhaInforme := cdsAux.FieldByName('IDINFORME').AsInteger
      else
        iLInhaInforme := piLinhaInformeOrig;

      cdsAux.Next;
    End;

    {Lançar a linha de informe de molestia grave}
    If not cdsAux.IsEmpty  Then
    Begin
      If cdsInformeDePara.Locate('IDSITUACAO; IDINFORMEORIGEM', VarArrayOf(['1', IntToStr(iLinhaInforme)]), []) Then
      Begin
        iLinhaInforme := cdsInformeDePara.FieldByName('IDINFORMEDESTINO').AsInteger;

        If cdsDetAbono.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([iLinhaInforme, 1]), []) Then
        Begin
          cdsDetAbono.Edit;
          cdsDetAbono.FieldByName('VLRLANC').AsFloat      := RoundCM(cdsDetAbono.FieldByName('VLRLANC').AsFloat + rTotal, 2);
          cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat := RoundCM(cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat + rTotal, 2);
          cdsDetAbono.FieldByName('FLGTIPOREG').AsString  := 'D';
          cdsDetAbono.Post;
        End
        Else
        Begin
          cdsDetAbono.Insert;
          cdsDetAbono.FieldByName('IDINFORME').AsInteger     := iLinhaInforme;
          cdsDetAbono.FieldByName('VLRLANC').AsFloat         := RoundCM(rTotal, 2);
          cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM(rTotal, 2);
          cdsDetAbono.FieldByName('FLGTIPOREG').AsString     := 'D';
          cdsDetAbono.FieldByName('FONTEPAGADORA').AsInteger := 1;
          cdsDetAbono.Post;
        End;
      End;
    End;
  End
  Else
  Begin

    {Tratamento somente de idosos}
    //CPrev - Pend. 27719 - If pbIdoso And (prValorIdoso > 0) Then
    If pbIdoso Then //CPrev - Pewnd. 27719
    Begin

      {Tratamento de idosos sem Ação Judicial}
      //CPrev - Pend. 27719 - Início
      if not pbTemAcao then
      begin
      //CPrev - Pend. 27719 - Fim

        While (not cdsAux.Eof) And (prValorIdoso > 0) And
              (cdsAux.FieldByName('FONTEPAGADORA').AsInteger = 1) Do
        Begin
          if cdsAux.FieldByName('IDINFORME').AsInteger = piLinhaAbonoAcima65 Then
          begin
            cdsAux.Next;
            Continue;
          end;

          {Lançar linha dos proventos de abono com valor negativo (devolução)}
          If cdsDetAbono.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([cdsAux.FieldByName('IDINFORME').AsInteger, 1]), []) Then
          Begin
            cdsDetAbono.Edit;
            cdsDetAbono.FieldByName('VLRLANC').AsFloat      := RoundCM(cdsDetAbono.FieldByName('VLRLANC').AsFloat + cdsAux.FieldByName('VALOR').AsFloat, 2);
            cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat := RoundCM(cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat + cdsAux.FieldByName('VALOR').AsFloat, 2);
            cdsDetAbono.FieldByName('FLGTIPOREG').AsString  := 'D';
            cdsDetAbono.Post;
          End
          Else
          Begin
            cdsDetAbono.Insert;
            cdsDetAbono.FieldByName('IDINFORME').AsInteger     := cdsAux.FieldByName('IDINFORME').AsInteger;
            cdsDetAbono.FieldByName('VLRLANC').AsFloat         := RoundCM(cdsAux.FieldByName('VALOR').AsFloat, 2);
            cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM(cdsAux.FieldByName('VALOR').AsFloat, 2);
            cdsDetAbono.FieldByName('FLGTIPOREG').AsString     := 'D';
            cdsDetAbono.FieldByName('FONTEPAGADORA').AsInteger := 1;
            cdsDetAbono.Post;
          End;
  
          {Lançar linha de dedução por idade                                               }
          {Se dedução menor ou igual que o lançamento, lançar o valor total da dedução e o }
          {restante na linha de proventos                                                  }
          If (prValorIdoso <= (cdsAux.FieldByName('VALOR').AsFloat*-1)) Then
          Begin
            If cdsDetAbono.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([piLinhaAbonoAcima65, 1]), []) Then
            Begin
              cdsDetAbono.Edit;
              cdsDetAbono.FieldByName('VLRLANC').AsFloat      := RoundCM(cdsDetAbono.FieldByName('VLRLANC').AsFloat + prValorIdoso, 2);
              cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat := RoundCM(cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat + prValorIdoso, 2);
              cdsDetAbono.FieldByName('FLGTIPOREG').AsString  := 'D';
              cdsDetAbono.Post;
            End
            Else
            Begin
              cdsDetAbono.Insert;
              cdsDetAbono.FieldByName('IDINFORME').AsInteger     := piLinhaAbonoAcima65;
              cdsDetAbono.FieldByName('VLRLANC').AsFloat         := RoundCM(prValorIdoso, 2);
              cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM(prValorIdoso, 2);
              cdsDetAbono.FieldByName('FLGTIPOREG').AsString     := 'D';
              cdsDetAbono.FieldByName('FONTEPAGADORA').AsInteger := 1;
              cdsDetAbono.Post;
            End;
  
            {Lança a linha dos proventos de abono (positiva)}
            If cdsDetAbono.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([cdsAux.FieldByName('IDINFORME').AsInteger, 1]), []) Then
            Begin
              cdsDetAbono.Edit;
              cdsDetAbono.FieldByName('VLRLANC').AsFloat      := RoundCM(cdsDetAbono.FieldByName('VLRLANC').AsFloat + ((cdsAux.FieldByName('VALOR').AsFloat*-1) - prValorIdoso), 2);
              cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat := RoundCM(cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat + ((cdsAux.FieldByName('VALOR').AsFloat*-1) - prValorIdoso), 2);
              cdsDetAbono.FieldByName('FLGTIPOREG').AsString  := 'D';
              cdsDetAbono.Post;
            End
            Else
            Begin
              cdsDetAbono.Insert;
              cdsDetAbono.FieldByName('IDINFORME').AsInteger     := cdsAux.FieldByName('IDINFORME').AsInteger;
              cdsDetAbono.FieldByName('VLRLANC').AsFloat         := RoundCM((cdsAux.FieldByName('VALOR').AsFloat*-1) - prValorIdoso, 2);
              cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM((cdsAux.FieldByName('VALOR').AsFloat*-1) - prValorIdoso, 2);
              cdsDetAbono.FieldByName('FLGTIPOREG').AsString     := 'D';
              cdsDetAbono.FieldByName('FONTEPAGADORA').AsInteger := 1;
              cdsDetAbono.Post;
            End;

            if prValorIdoso >= (cdsAux.FieldByName('VALOR').AsFloat*-1) Then
              prValorIdoso := prValorIdoso - (cdsAux.FieldByName('VALOR').AsFloat*-1)
            else
              prValorIdoso := 0;

          End
          Else
          {Senão lançar somente o lançamento na linha de dedução}
          Begin
            If cdsDetAbono.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([piLinhaAbonoAcima65, 1]), []) Then
            Begin
              cdsDetAbono.Edit;
              cdsDetAbono.FieldByName('VLRLANC').AsFloat      := RoundCM(cdsDetAbono.FieldByName('VLRLANC').AsFloat + (cdsAux.FieldByName('VALOR').AsFloat*-1), 2);
              cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat := RoundCM(cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat + (cdsAux.FieldByName('VALOR').AsFloat*-1), 2);
              cdsDetAbono.FieldByName('FLGTIPOREG').AsString  := 'D';
              cdsDetAbono.Post;
            End
            Else
            Begin
              cdsDetAbono.Insert;
              cdsDetAbono.FieldByName('IDINFORME').AsInteger     := piLinhaAbonoAcima65;
              cdsDetAbono.FieldByName('VLRLANC').AsFloat         := RoundCM((cdsAux.FieldByName('VALOR').AsFloat*-1), 2);
              cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM((cdsAux.FieldByName('VALOR').AsFloat*-1), 2);
              cdsDetAbono.FieldByName('FLGTIPOREG').AsString     := 'D';
              cdsDetAbono.FieldByName('FONTEPAGADORA').AsInteger := 1;
              cdsDetAbono.Post;
            End; {If cdsDetAbono.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([iLinhaAbonoAcima65, 1]), []) Then}
          End; {If (fValorIdoso <= (cdsAux.FieldByName('VLRLANC').AsFloat*-1)) Then}

          cdsAux.Next;
        End; {While}

      //CPrev - Pend. 27719 - Início
      end
      else
      begin

        While (not cdsAux.Eof) And
              (cdsAux.FieldByName('FONTEPAGADORA').AsInteger = 1) Do
        Begin
          if cdsAux.FieldByName('IDINFORME').AsInteger = piLinhaAbonoAcima65 Then
          begin
            cdsAux.Next;
            Continue;
          end;

          {Lançar linha dos proventos de abono com valor negativo (devolução)}
          If cdsDetAbono.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([cdsAux.FieldByName('IDINFORME').AsInteger, 1]), []) Then
          Begin
            cdsDetAbono.Edit;
            cdsDetAbono.FieldByName('VLRLANC').AsFloat      := RoundCM(cdsDetAbono.FieldByName('VLRLANC').AsFloat + cdsAux.FieldByName('VALOR').AsFloat, 2);
            cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat := RoundCM(cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat + cdsAux.FieldByName('VALOR').AsFloat, 2);
            cdsDetAbono.FieldByName('FLGTIPOREG').AsString  := 'D';
            cdsDetAbono.Post;
          End
          Else
          Begin
            cdsDetAbono.Insert;
            cdsDetAbono.FieldByName('IDINFORME').AsInteger     := cdsAux.FieldByName('IDINFORME').AsInteger;
            cdsDetAbono.FieldByName('VLRLANC').AsFloat         := RoundCM(cdsAux.FieldByName('VALOR').AsFloat, 2);
            cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM(cdsAux.FieldByName('VALOR').AsFloat, 2);
            cdsDetAbono.FieldByName('FLGTIPOREG').AsString     := 'D';
            cdsDetAbono.FieldByName('FONTEPAGADORA').AsInteger := 1;
            cdsDetAbono.Post;
          End;

          {Lançar linha de dedução por idade                                               }
          {Se dedução menor ou igual que o lançamento, lançar o valor total da dedução e o }
          {restante na linha de proventos                                                  }
          If (prValorIdoso <= (cdsAux.FieldByName('VALOR').AsFloat*-1)) Then
          Begin
            If cdsDetAbono.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([piLinhaAbonoAcima65, 1]), []) Then
            Begin
              cdsDetAbono.Edit;
              cdsDetAbono.FieldByName('VLRLANC').AsFloat      := RoundCM(cdsDetAbono.FieldByName('VLRLANC').AsFloat + prValorIdoso, 2);
              cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat := RoundCM(cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat + prValorIdoso, 2);
              cdsDetAbono.FieldByName('FLGTIPOREG').AsString  := 'D';
              cdsDetAbono.Post;
            End
            Else
            Begin
              cdsDetAbono.Insert;
              cdsDetAbono.FieldByName('IDINFORME').AsInteger     := piLinhaAbonoAcima65;
              cdsDetAbono.FieldByName('VLRLANC').AsFloat         := RoundCM(prValorIdoso, 2);
              cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM(prValorIdoso, 2);
              cdsDetAbono.FieldByName('FLGTIPOREG').AsString     := 'D';
              cdsDetAbono.FieldByName('FONTEPAGADORA').AsInteger := 1;
              cdsDetAbono.Post;
            End;

            {Lança a linha dos proventos de abono (positiva)}
            If cdsDetAbono.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([piLinhaInformeOrig, 1]), []) Then
            Begin
              cdsDetAbono.Edit;
              cdsDetAbono.FieldByName('VLRLANC').AsFloat      := RoundCM(cdsDetAbono.FieldByName('VLRLANC').AsFloat + (((cdsAux.FieldByName('VALOR').AsFloat*-1) - prValorIdoso) * (100 - prPercAcao))/100, 2);
              cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat := RoundCM(cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat + (((cdsAux.FieldByName('VALOR').AsFloat*-1) - prValorIdoso) * (100 - prPercAcao))/100, 2);
              cdsDetAbono.FieldByName('FLGTIPOREG').AsString  := 'D';
              cdsDetAbono.Post;
            End
            Else
            Begin
              cdsDetAbono.Insert;
              cdsDetAbono.FieldByName('IDINFORME').AsInteger     := piLinhaInformeOrig;
              cdsDetAbono.FieldByName('VLRLANC').AsFloat         := RoundCM((((cdsAux.FieldByName('VALOR').AsFloat*-1) - prValorIdoso) * (100 - prPercAcao))/100, 2);
              cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM((((cdsAux.FieldByName('VALOR').AsFloat*-1) - prValorIdoso) * (100 - prPercAcao))/100, 2);
              cdsDetAbono.FieldByName('FLGTIPOREG').AsString     := 'D';
              cdsDetAbono.FieldByName('FONTEPAGADORA').AsInteger := 1;
              cdsDetAbono.Post;
            End;
  
            {Lançando linha de rendimento da fonte pagadora Fundação 13º para Ação Judicial}
            If cdsDetAbono.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([piLinhaRendAcJud13, 1]), []) Then
            Begin
              cdsDetAbono.Edit;
              cdsDetAbono.FieldByName('VLRLANC').AsFloat      := RoundCM(cdsDetAbono.FieldByName('VLRLANC').AsFloat + (((cdsAux.FieldByName('VALOR').AsFloat*-1) - prValorIdoso) * prPercAcao)/100, 2);
              cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat := RoundCM(cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat + (((cdsAux.FieldByName('VALOR').AsFloat*-1) - prValorIdoso) * prPercAcao)/100, 2);
              cdsDetAbono.FieldByName('FLGTIPOREG').AsString  := 'D';
              cdsDetAbono.Post;
            End
            Else
            Begin
              cdsDetAbono.Insert;
              cdsDetAbono.FieldByName('IDINFORME').AsInteger     := piLinhaRendAcJud13;
              cdsDetAbono.FieldByName('VLRLANC').AsFloat         := RoundCM((((cdsAux.FieldByName('VALOR').AsFloat*-1) - prValorIdoso) * prPercAcao)/100, 2);
              cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM((((cdsAux.FieldByName('VALOR').AsFloat*-1) - prValorIdoso) * prPercAcao)/100, 2);
              cdsDetAbono.FieldByName('FLGTIPOREG').AsString     := 'D';
              cdsDetAbono.FieldByName('FONTEPAGADORA').AsInteger := 1;
              cdsDetAbono.Post;
            End;

            if prValorIdoso >= (cdsAux.FieldByName('VALOR').AsFloat*-1) Then
              prValorIdoso := prValorIdoso - (cdsAux.FieldByName('VALOR').AsFloat*-1)
            else
              prValorIdoso := 0;

          End
          Else
          {Senão lançar somente o lançamento na linha de dedução}
          Begin
            If cdsDetAbono.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([piLinhaAbonoAcima65, 1]), []) Then
            Begin
              cdsDetAbono.Edit;
              cdsDetAbono.FieldByName('VLRLANC').AsFloat      := RoundCM(cdsDetAbono.FieldByName('VLRLANC').AsFloat + (cdsAux.FieldByName('VALOR').AsFloat*-1), 2);
              cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat := RoundCM(cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat + (cdsAux.FieldByName('VALOR').AsFloat*-1), 2);
              cdsDetAbono.FieldByName('FLGTIPOREG').AsString  := 'D';
              cdsDetAbono.Post;
            End
            Else
            Begin
              cdsDetAbono.Insert;
              cdsDetAbono.FieldByName('IDINFORME').AsInteger     := piLinhaAbonoAcima65;
              cdsDetAbono.FieldByName('VLRLANC').AsFloat         := RoundCM((cdsAux.FieldByName('VALOR').AsFloat*-1), 2);
              cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM((cdsAux.FieldByName('VALOR').AsFloat*-1), 2);
              cdsDetAbono.FieldByName('FLGTIPOREG').AsString     := 'D';
              cdsDetAbono.FieldByName('FONTEPAGADORA').AsInteger := 1;
              cdsDetAbono.Post;
            End; {If cdsDetAbono.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([iLinhaAbonoAcima65, 1]), []) Then}
          End; {If (fValorIdoso <= (cdsAux.FieldByName('VLRLANC').AsFloat*-1)) Then}

          cdsAux.Next;
        End; {While}
      end; {if not pbTemAcao then}
    end
    else
    begin

      if (pbTemAcao) and (bExisteRegraIT) then  // Edilaine - SOL 196824 / KTN 1884092
      begin

        While (not cdsAux.Eof) And
              (cdsAux.FieldByName('FONTEPAGADORA').AsInteger = 1) Do
        Begin
          if cdsAux.FieldByName('IDINFORME').AsInteger = piLinhaAbonoAcima65 Then
          begin
            cdsAux.Next;
            Continue;
          end;

          {Lançar linha dos proventos de abono com valor negativo (devolução)}
          If cdsDetAbono.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([cdsAux.FieldByName('IDINFORME').AsInteger, 1]), []) Then
          Begin
            cdsDetAbono.Edit;
            cdsDetAbono.FieldByName('VLRLANC').AsFloat      := RoundCM(cdsDetAbono.FieldByName('VLRLANC').AsFloat + cdsAux.FieldByName('VALOR').AsFloat, 2);
            cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat := RoundCM(cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat + cdsAux.FieldByName('VALOR').AsFloat, 2);
            cdsDetAbono.FieldByName('FLGTIPOREG').AsString  := 'D';
            cdsDetAbono.Post;
          End
          Else
          Begin
            cdsDetAbono.Insert;
            cdsDetAbono.FieldByName('IDINFORME').AsInteger     := cdsAux.FieldByName('IDINFORME').AsInteger;
            cdsDetAbono.FieldByName('VLRLANC').AsFloat         := RoundCM(cdsAux.FieldByName('VALOR').AsFloat, 2);
            cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM(cdsAux.FieldByName('VALOR').AsFloat, 2);
            cdsDetAbono.FieldByName('FLGTIPOREG').AsString     := 'D';
            cdsDetAbono.FieldByName('FONTEPAGADORA').AsInteger := 1;
            cdsDetAbono.Post;
          End;

          {Lança a linha dos proventos de abono (positiva)}
          If cdsDetAbono.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([piLinhaInformeOrig, 1]), []) Then
          Begin
            cdsDetAbono.Edit;
            cdsDetAbono.FieldByName('VLRLANC').AsFloat      := RoundCM(cdsDetAbono.FieldByName('VLRLANC').AsFloat + ((cdsAux.FieldByName('VALOR').AsFloat*-1) * (100 - prPercAcao))/100, 2);
            cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat := RoundCM(cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat + ((cdsAux.FieldByName('VALOR').AsFloat*-1) * (100 - prPercAcao))/100, 2);
            cdsDetAbono.FieldByName('FLGTIPOREG').AsString  := 'D';
            cdsDetAbono.Post;
          End
          Else
          Begin
            cdsDetAbono.Insert;
            cdsDetAbono.FieldByName('IDINFORME').AsInteger     := piLinhaInformeOrig;
            cdsDetAbono.FieldByName('VLRLANC').AsFloat         := RoundCM(((cdsAux.FieldByName('VALOR').AsFloat*-1) * (100 - prPercAcao))/100, 2);
            cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM(((cdsAux.FieldByName('VALOR').AsFloat*-1) * (100 - prPercAcao))/100, 2);
            cdsDetAbono.FieldByName('FLGTIPOREG').AsString     := 'D';
            cdsDetAbono.FieldByName('FONTEPAGADORA').AsInteger := 1;
            cdsDetAbono.Post;
          End;

          {Lançando linha de rendimento da fonte pagadora Fundação 13º para Ação Judicial}
          If cdsDetAbono.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([piLinhaRendAcJud13, 1]), []) Then
          Begin
            cdsDetAbono.Edit;
            cdsDetAbono.FieldByName('VLRLANC').AsFloat      := RoundCM(cdsDetAbono.FieldByName('VLRLANC').AsFloat + ((cdsAux.FieldByName('VALOR').AsFloat*-1) * prPercAcao)/100, 2);
            cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat := RoundCM(cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat + ((cdsAux.FieldByName('VALOR').AsFloat*-1) * prPercAcao)/100, 2);
            cdsDetAbono.FieldByName('FLGTIPOREG').AsString  := 'D';
            cdsDetAbono.Post;
          End
          Else
          Begin
            cdsDetAbono.Insert;
            cdsDetAbono.FieldByName('IDINFORME').AsInteger     := piLinhaRendAcJud13;
            cdsDetAbono.FieldByName('VLRLANC').AsFloat         := RoundCM(((cdsAux.FieldByName('VALOR').AsFloat*-1) * prPercAcao)/100, 2);
            cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM(((cdsAux.FieldByName('VALOR').AsFloat*-1) * prPercAcao)/100, 2);
            cdsDetAbono.FieldByName('FLGTIPOREG').AsString     := 'D';
            cdsDetAbono.FieldByName('FONTEPAGADORA').AsInteger := 1;
            cdsDetAbono.Post;
          End;

          cdsAux.Next;
        End; {While}

      end; {if pbTemAcao then}
      //CPrev - Pend. 27719 - Fim

    End; {If bIdoso And (fValorIdoso > 0) Then}
  End; {if bMolestiaGrave Then}

end;

procedure TCtrlGeraFolhaFUNCEF.TrataAcertoAbonoINSS(const pbIdoso                 : Boolean;
                                                    const pbMolestiaGrave         : Boolean;
                                                    var   prValorIdoso            : Double;
                                                    const piLinhaAbonoAcima65INSS : Integer;
                                                    const piLinhaInformeOrig      : Integer);
Var
  rTotal        : Double;
  iLinhaInforme : Integer;

begin
  {Tratamento de Pessoas que ficaram Isenta ou Idosas durante o ano}
  {13º do INSS                                                     }
  if pbMolestiaGrave Then
  Begin

    {Lançar as linhas de informe negativas}
    rTotal := 0;
    While (not cdsAux.Eof) And (cdsAux.FieldByName('FONTEPAGADORA').AsInteger = 2) Do
    Begin
      rTotal := rTotal + (cdsAux.FieldByName('VALOR').AsFloat*-1);

      If cdsDetAbono.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([cdsAux.FieldByName('IDINFORME').AsInteger, 2]), []) Then
      Begin
        cdsDetAbono.Edit;
        cdsDetAbono.FieldByName('VLRLANC').AsFloat      := RoundCM(cdsDetAbono.FieldByName('VLRLANC').AsFloat + cdsAux.FieldByName('VALOR').AsFloat, 2);
        cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat := RoundCM(cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat + cdsAux.FieldByName('VALOR').AsFloat, 2);
        cdsDetAbono.FieldByName('FLGTIPOREG').AsString  := 'D';
        cdsDetAbono.Post;
      End
      Else
      Begin
        cdsDetAbono.Insert;
        cdsDetAbono.FieldByName('IDINFORME').AsInteger     := cdsAux.FieldByName('IDINFORME').AsInteger;
        cdsDetAbono.FieldByName('VLRLANC').AsFloat         := RoundCM(cdsAux.FieldByName('VALOR').AsFloat, 2);
        cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM(cdsAux.FieldByName('VALOR').AsFloat, 2);
        cdsDetAbono.FieldByName('FLGTIPOREG').AsString     := 'D';
        cdsDetAbono.FieldByName('FONTEPAGADORA').AsInteger := 2;
        cdsDetAbono.Post;
      End;

      if cdsAux.FieldByName('CODDIRF').AsString = '5' Then
        iLinhaInforme := cdsAux.FieldByName('IDINFORME').AsInteger
      else
        iLinhaInforme := piLinhaInformeOrig;

      cdsAux.Next;
    End;

    {Lançar a linha de informe de molestia grave}
    If not cdsAux.IsEmpty  Then
    Begin
      If cdsInformeDePara.Locate('IDSITUACAO; IDINFORMEORIGEM', VarArrayOf(['1', IntToStr(iLinhaInforme)]), []) Then
      Begin
        iLinhaInforme := cdsInformeDePara.FieldByName('IDINFORMEDESTINO').AsInteger;

        If cdsDetAbono.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([iLinhaInforme, 2]), []) Then
        Begin
          cdsDetAbono.Edit;
          cdsDetAbono.FieldByName('VLRLANC').AsFloat      := RoundCM(cdsDetAbono.FieldByName('VLRLANC').AsFloat + rTotal, 2);
          cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat := RoundCM(cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat + rTotal, 2);
          cdsDetAbono.FieldByName('FLGTIPOREG').AsString  := 'D';
          cdsDetAbono.Post;
        End
        Else
        Begin
          cdsDetAbono.Insert;
          cdsDetAbono.FieldByName('IDINFORME').AsInteger     := iLinhaInforme;
          cdsDetAbono.FieldByName('VLRLANC').AsFloat         := RoundCM(rTotal, 2);
          cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM(rTotal, 2);
          cdsDetAbono.FieldByName('FLGTIPOREG').AsString     := 'D';
          cdsDetAbono.FieldByName('FONTEPAGADORA').AsInteger := 2;
          cdsDetAbono.Post;
        End;
      End;
    End;
  End
  Else
  Begin

    {Tratamento somente de idosos}
    If pbIdoso And
      (prValorIdoso > 0) Then
    Begin
      While (not cdsAux.Eof) And (prValorIdoso > 0) And
            (cdsAux.FieldByName('FONTEPAGADORA').AsInteger = 2) Do
      Begin
        if cdsAux.FieldByName('IDINFORME').AsInteger = piLinhaAbonoAcima65INSS Then
        begin
          cdsAux.Next;
          Continue;
        end;

        {Lançar linha dos proventos de abono com valor negativo (devolução)}
        If cdsDetAbono.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([cdsAux.FieldByName('IDINFORME').AsInteger, 2]), []) Then
        Begin
          cdsDetAbono.Edit;
          cdsDetAbono.FieldByName('VLRLANC').AsFloat      := RoundCM(cdsDetAbono.FieldByName('VLRLANC').AsFloat + cdsAux.FieldByName('VALOR').AsFloat, 2);
          cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat := RoundCM(cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat + cdsAux.FieldByName('VALOR').AsFloat, 2);
          cdsDetAbono.FieldByName('FLGTIPOREG').AsString  := 'D';
          cdsDetAbono.Post;
        End
        Else
        Begin
          cdsDetAbono.Insert;
          cdsDetAbono.FieldByName('IDINFORME').AsInteger     := cdsAux.FieldByName('IDINFORME').AsInteger;
          cdsDetAbono.FieldByName('VLRLANC').AsFloat         := RoundCM(cdsAux.FieldByName('VALOR').AsFloat, 2);
          cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM(cdsAux.FieldByName('VALOR').AsFloat, 2);
          cdsDetAbono.FieldByName('FLGTIPOREG').AsString     := 'D';
          cdsDetAbono.FieldByName('FONTEPAGADORA').AsInteger := 2;
          cdsDetAbono.Post;
        End;

        {Lançar linha de dedução por idade                                               }
        {Se dedução menor ou igual que o lançamento, lançar o valor total da dedução e o }
        {restante na linha de proventos                                                  }
        If (prValorIdoso <= (cdsAux.FieldByName('VALOR').AsFloat*-1)) Then
        Begin
          If cdsDetAbono.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([piLinhaAbonoAcima65INSS, 2]), []) Then
          Begin
            cdsDetAbono.Edit;
            cdsDetAbono.FieldByName('VLRLANC').AsFloat      := RoundCM(cdsDetAbono.FieldByName('VLRLANC').AsFloat + prValorIdoso, 2);
            cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat := RoundCM(cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat + prValorIdoso, 2);
            cdsDetAbono.FieldByName('FLGTIPOREG').AsString  := 'D';
            cdsDetAbono.Post;
          End
          Else
          Begin
            cdsDetAbono.Insert;
            cdsDetAbono.FieldByName('IDINFORME').AsInteger     := piLinhaAbonoAcima65INSS;
            cdsDetAbono.FieldByName('VLRLANC').AsFloat         := RoundCM(prValorIdoso, 2);
            cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM(prValorIdoso, 2);
            cdsDetAbono.FieldByName('FLGTIPOREG').AsString     := 'D';
            cdsDetAbono.FieldByName('FONTEPAGADORA').AsInteger := 2;
            cdsDetAbono.Post;
          End;

          {Lança a linha dos proventos de abono (positiva)}
          If cdsDetAbono.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([cdsAux.FieldByName('IDINFORME').AsInteger, 2]), []) Then
          Begin
            cdsDetAbono.Edit;
            cdsDetAbono.FieldByName('VLRLANC').AsFloat      := RoundCM(cdsDetAbono.FieldByName('VLRLANC').AsFloat + ((cdsAux.FieldByName('VALOR').AsFloat*-1) - prValorIdoso), 2);
            cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat := RoundCM(cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat + ((cdsAux.FieldByName('VALOR').AsFloat*-1) - prValorIdoso), 2);
            cdsDetAbono.FieldByName('FLGTIPOREG').AsString  := 'D';
            cdsDetAbono.Post;
          End
          Else
          Begin
            cdsDetAbono.Insert;
            cdsDetAbono.FieldByName('IDINFORME').AsInteger     := cdsAux.FieldByName('IDINFORME').AsInteger;
            cdsDetAbono.FieldByName('VLRLANC').AsFloat         := RoundCM((cdsAux.FieldByName('VALOR').AsFloat*-1) - prValorIdoso, 2);
            cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM((cdsAux.FieldByName('VALOR').AsFloat*-1) - prValorIdoso, 2);
            cdsDetAbono.FieldByName('FLGTIPOREG').AsString     := 'D';
            cdsDetAbono.FieldByName('FONTEPAGADORA').AsInteger := 2;
            cdsDetAbono.Post;
          End;
        End
        Else
        {Senão lançar somente o lançamento na linha de dedução}
        Begin
          If cdsDetAbono.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([piLinhaAbonoAcima65INSS, 2]), []) Then
          Begin
            cdsDetAbono.Edit;
            cdsDetAbono.FieldByName('VLRLANC').AsFloat      := RoundCM(cdsDetAbono.FieldByName('VLRLANC').AsFloat + (cdsAux.FieldByName('VALOR').AsFloat*-1), 2);
            cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat := RoundCM(cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat + (cdsAux.FieldByName('VALOR').AsFloat*-1), 2);
            cdsDetAbono.FieldByName('FLGTIPOREG').AsString  := 'D';
            cdsDetAbono.Post;
          End
          Else
          Begin
            cdsDetAbono.Insert;
            cdsDetAbono.FieldByName('IDINFORME').AsInteger     := piLinhaAbonoAcima65INSS;
            cdsDetAbono.FieldByName('VLRLANC').AsFloat         := RoundCM((cdsAux.FieldByName('VALOR').AsFloat*-1), 2);
            cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM((cdsAux.FieldByName('VALOR').AsFloat*-1), 2);
            cdsDetAbono.FieldByName('FLGTIPOREG').AsString     := 'D';
            cdsDetAbono.FieldByName('FONTEPAGADORA').AsInteger := 2;
            cdsDetAbono.Post;
          End; {If cdsDetAbono.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([cdsAux.FieldByName('IDINFORME').AsInteger, 2]), []) Then}
        End; {If cdsDetAbono.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([cdsAux.FieldByName('IDINFORME').AsInteger, 2]), []) Then}

        cdsAux.Next;
      End; {While}
    End; {If bIdoso And (fValorIdoso > 0) Then}
  End; {if bMolestiaGrave Then}
end;

procedure TCtrlGeraFolhaFUNCEF.TrataIdosoMensal(const piLinhaAcima65     : Integer;
                                                const piLinhaAcima65INSS : Integer;
                                                const piLinhaRend        : Integer;
                                                const piLinhaRendINSS    : integer;
                                                const piLinhaRendAcJud   : Integer;
                                                const prTotRend1         : Double;
                                                const prTotRend2         : Double;
                                                const prValorIdosoAcum   : Double;
                                                const prPercAcao         : Double;
                                                var   prValIdosoFixo     : Double;
                                                var   prValorIdoso       : Double;
                                                const psCodRubricas      : String;
                                                const pbTemAcJud         : Boolean);

Var
  rTotalRend : Double;

begin
  {Começa o tratamento dos idosos conforme a fontepagadora dos rendimentos de Janeiro a Dezembro}
  // total dos rendimentos é a soma dos redimentos da funcef (prTotRend1) e os rendimentos do INSS (prTotRend2)
  rTotalRend    := prTotRend1    + prTotRend2;


  if  prValorIdosoAcum > 0 Then
  begin
    if prValorIdosoAcum >= prValIdosoFixo Then
    Begin
      prValIdosoFixo := 0;
      prValorIdoso   := 0;
    end
    else
    Begin
      prValIdosoFixo := prValIdosoFixo - prValorIdosoAcum;
      prValorIdoso   := prValorIdoso   - prValorIdosoAcum;
    end;
  end;
  // total de Rendimentos não está zerado
  if rTotalRend <> 0   then
  begin
    // Total de Rendimentos é menor que zero.
    if rTotalRend < 0 then
    begin
      // Rendimentos da Funcef e do Inss são menores ou igual a zero.
      if ( prTotRend1 <= 0 ) and
         ( prTotRend2 <= 0 ) then
      begin
        if not cdsDet.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([piLinhaRend,1]), []) then
        begin
          cdsDet.Insert;
          cdsDet.FieldByName('IDINFORME').AsInteger     := piLinhaRend;
          cdsDet.FieldByName('VLRLANC').AsFloat         := RoundCM(prTotRend1, 2);
          cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM(prTotRend1, 2);
          cdsDet.FieldByName('FONTEPAGADORA').AsInteger := 1;
        end
        else
        begin
          cdsDet.Edit;
          cdsDet.FieldByName('VLRLANC').AsFloat         := RoundCM(cdsDet.FieldByName('VLRLANC').AsFloat      + prTotRend1, 2);
          cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM(cdsDet.FieldByName('VLRLANCSINAL').AsFloat + prTotRend1, 2);
        end;

        if not cdsDet.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([piLinhaRendINSS,2]), []) then
        begin
          cdsDet.Insert;
          cdsDet.FieldByName('IDINFORME').AsInteger     := piLinhaRendINSS;
          cdsDet.FieldByName('VLRLANC').AsFloat         := RoundCM(prTotRend2, 2);
          cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM(prTotRend2, 2);
          cdsDet.FieldByName('FONTEPAGADORA').AsInteger := 2;
        end
        else
        begin
          cdsDet.Edit;
          cdsDet.FieldByName('VLRLANC').AsFloat         := RoundCM(cdsDet.FieldByName('VLRLANC').AsFloat      + prTotRend2, 2);
          cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM(cdsDet.FieldByName('VLRLANCSINAL').AsFloat + prTotRend2, 2);
        end;
      end
      // Redimentos da Funcef e INSS são maiores que zero
      else
      begin
        if ( Abs(prTotRend1) > Abs(prTotRend2) ) then
        begin
          { Se valor absoluto do rendimento da fundação for maior que do INSS a linha de informe }
          { da fundação recebe a diferença dos duas fontes pagadoras ...                         }
          if not cdsDet.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([piLinhaRend,1]), []) then
          begin
            cdsDet.Insert;
            cdsDet.FieldByName('IDINFORME').AsInteger     := piLinhaRend;
            cdsDet.FieldByName('VLRLANC').AsFloat         := RoundCM(((Abs(prTotRend1) - Abs(prTotRend2)) * -1), 2);
            cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM(((Abs(prTotRend1) - Abs(prTotRend2)) * -1), 2);
            cdsDet.FieldByName('FONTEPAGADORA').AsInteger := 1;
          end
          else
          begin
            cdsDet.Edit;
            cdsDet.FieldByName('VLRLANC').AsFloat         := RoundCM(cdsDet.FieldByName('VLRLANC').AsFloat      + ((Abs(prTotRend1) - Abs(prTotRend2)) * -1), 2);
            cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM(cdsDet.FieldByName('VLRLANCSINAL').AsFloat + ((Abs(prTotRend1) - Abs(prTotRend2)) * -1), 2);
          end;
        end
        // rendimento funcef é menor ou igual ao rendimento do inss
        else
        begin
          if not cdsDet.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([piLinhaRendINSS,2]), []) then
          begin
            cdsDet.Insert;
            cdsDet.FieldByName('IDINFORME').AsInteger     := piLinhaRendINSS;
            cdsDet.FieldByName('VLRLANC').AsFloat         := RoundCM(((Abs(prTotRend2) - Abs(prTotRend1)) * -1), 2);
            cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM(((Abs(prTotRend2) - Abs(prTotRend1)) * -1), 2);
            cdsDet.FieldByName('FONTEPAGADORA').AsInteger := 2;
          end
          else
          begin
            cdsDet.Edit;
            cdsDet.FieldByName('VLRLANC').AsFloat         := RoundCM(cdsDet.FieldByName('VLRLANC').AsFloat      + ((Abs(prTotRend2) - Abs(prTotRend1)) * -1), 2);
            cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM(cdsDet.FieldByName('VLRLANCSINAL').AsFloat + ((Abs(prTotRend2) - Abs(prTotRend1)) * -1), 2);
          end;
        end;
      end;
    end
    // Total de Rendimentos é maior que zero (não é possivel ser zero, por que a primeira condição satisfeita
    // é que o Total de Rendimentos tem de ser diferente de zero para chegar nesse ponto.
    else
    begin

      {1º Caso -  Somatorio das duas fontes nao ultrapassem o valor do idoso}
      if rTotalRend < prValIdosoFixo then
      begin
        // Rendimento da Funcef maior que zero
        if prTotRend1 > 0 then
        begin
          If Trim(psCodRubricas) = '' Then
          Begin
            if not cdsDet.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([piLinhaAcima65,1]), []) Then
            Begin
              cdsDet.Insert;
              cdsDet.FieldByName('IDINFORME').AsInteger     := piLinhaAcima65;
              cdsDet.FieldByName('VLRLANC').AsFloat         := prTotRend1;
              cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := prTotRend1;
              cdsDet.FieldByName('FONTEPAGADORA').AsInteger := 1;
            end
            else
            begin
              cdsDet.Edit;
              cdsDet.FieldByName('VLRLANC').AsFloat         := cdsDet.FieldByName('VLRLANC').AsFloat + prTotRend1;
              cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := cdsDet.FieldByName('VLRLANCSINAL').AsFloat + prTotRend1;
            end;
            cdsDet.Post;
          End;
        end;
        // Rendimento do Inss maior que zero
        if prTotRend2 > 0 then
        begin
          // Rendimento da Funcef menor que zero
          If prTotRend1 < 0 then
          Begin
            If Trim(psCodRubricas) = '' Then
            Begin
              if not cdsDet.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([piLinhaAcima65INSS,2]), []) Then
              Begin
                cdsDet.Insert;
                cdsDet.FieldByName('IDINFORME').AsInteger     := piLinhaAcima65INSS;
                cdsDet.FieldByName('VLRLANC').AsFloat         := prTotRend2 + prTotRend1;
                cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := prTotRend2 + prTotRend1;
                cdsDet.FieldByName('FONTEPAGADORA').AsInteger := 2;
              end
              else
              begin
                cdsDet.Edit;
                cdsDet.FieldByName('VLRLANC').AsFloat         := cdsDet.FieldByName('VLRLANC').AsFloat + (prTotRend2 + prTotRend1);
                cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := cdsDet.FieldByName('VLRLANCSINAL').AsFloat + (prTotRend2 + prTotRend1);
              end;
              cdsDet.Post;
            End;
          end
          // Rendimento Funcef maior ou igual a Zero
          Else
          Begin
            If Trim(psCodRubricas) = '' Then
            Begin
              if not cdsDet.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([piLinhaAcima65INSS,2]), []) Then
              Begin
                cdsDet.Insert;
                cdsDet.FieldByName('IDINFORME').AsInteger     := piLinhaAcima65INSS;
                cdsDet.FieldByName('VLRLANC').AsFloat         := prTotRend2;
                cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := prTotRend2;
                cdsDet.FieldByName('FONTEPAGADORA').AsInteger := 2;
              end
              else
              begin
                cdsDet.Edit;
                cdsDet.FieldByName('VLRLANC').AsFloat         := cdsDet.FieldByName('VLRLANC').AsFloat + prTotRend2;
                cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := cdsDet.FieldByName('VLRLANCSINAL').AsFloat + prTotRend2;
              end;
              cdsDet.Post;
            End;
          End;
        end;
      end
      {Fim 1º Caso -  Somatorio das duas fontes nao ultrapassem o valor do idoso}
      else
      begin
        {2º Caso - A fonte pagadora 1 (funcef) é maior ou igual ao o valor do idoso}
        if prTotRend1 >= prValIdosoFixo then
        begin
          // Se tem Acão Judicial
          If pbTemAcJud Then
          Begin
            if cdsDet.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([piLinhaRend,1]), []) Then
            Begin
              cdsDet.Edit;
              cdsDet.FieldByName('VLRLANC').AsFloat         := cdsDet.FieldByName('VLRLANC').AsFloat + RoundCM(((prTotRend1 - prValIdosoFixo) * (100 - prPercAcao))/100, 2);
              cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := cdsDet.FieldByName('VLRLANCSINAL').AsFloat + RoundCM(((prTotRend1 - prValIdosoFixo) * (100 - prPercAcao))/100, 2);
            end
            else
            Begin
              cdsDet.Insert;
              cdsDet.FieldByName('IDINFORME').AsInteger     := piLinhaRend;
              cdsDet.FieldByName('VLRLANC').AsFloat         := RoundCM(((prTotRend1 - prValIdosoFixo) * (100 - prPercAcao))/100, 2);
              cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM(((prTotRend1 - prValIdosoFixo) * (100 - prPercAcao))/100, 2);
              cdsDet.FieldByName('FONTEPAGADORA').AsInteger := 1;
            end;

            if cdsDet.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([piLinhaRendAcJud,1]), []) Then
            Begin
              cdsDet.Edit;
              cdsDet.FieldByName('VLRLANC').AsFloat         := cdsDet.FieldByName('VLRLANC').AsFloat + RoundCM(((prTotRend1 - prValIdosoFixo) * prPercAcao)/100, 2);
              cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := cdsDet.FieldByName('VLRLANCSINAL').AsFloat + RoundCM(((prTotRend1 - prValIdosoFixo) * prPercAcao)/100, 2);
            end
            else
            Begin
              cdsDet.Insert;
              cdsDet.FieldByName('IDINFORME').AsInteger     := piLinhaRendAcJud;
              cdsDet.FieldByName('VLRLANC').AsFloat         := RoundCM(((prTotRend1 - prValIdosoFixo) * prPercAcao)/100, 2);
              cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM(((prTotRend1 - prValIdosoFixo) * prPercAcao)/100, 2);
              cdsDet.FieldByName('FONTEPAGADORA').AsInteger := 1;
            end;
          End
          // Não possue Ação Judicial
          else
          begin
            if cdsDet.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([piLinhaRend,1]), []) Then
            Begin
              cdsDet.Edit;
              cdsDet.FieldByName('VLRLANC').AsFloat         := cdsDet.FieldByName('VLRLANC').AsFloat + (prTotRend1 - prValIdosoFixo);
              cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := cdsDet.FieldByName('VLRLANCSINAL').AsFloat + (prTotRend1 - prValIdosoFixo);
            end
            else
            Begin
              cdsDet.Insert;
              cdsDet.FieldByName('IDINFORME').AsInteger     := piLinhaRend;
              cdsDet.FieldByName('VLRLANC').AsFloat         := (prTotRend1 - prValIdosoFixo);
              cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := (prTotRend1 - prValIdosoFixo);
              cdsDet.FieldByName('FONTEPAGADORA').AsInteger := 1;
            end;
          end;
          cdsDet.Post;

          If Trim(psCodRubricas) = '' Then
          Begin
            if not cdsDet.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([piLinhaAcima65,1]), []) Then
            Begin
              cdsDet.Insert;
              cdsDet.FieldByName('IDINFORME').AsInteger     := piLinhaAcima65;
              cdsDet.FieldByName('VLRLANC').AsFloat         := prValIdosoFixo;
              cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := prValIdosoFixo;
              cdsDet.FieldByName('FONTEPAGADORA').AsInteger := 1;
              cdsDet.Post;
            end;
          End;

          // Se Rendimento do INSS é maior que zero
          if prTotRend2 > 0 then
          begin
            if cdsDet.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([piLinhaRendINSS,2]), []) Then
            Begin
              cdsDet.Edit;
              cdsDet.FieldByName('VLRLANC').AsFloat         := cdsDet.FieldByName('VLRLANC').AsFloat + prTotRend2;
              cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := cdsDet.FieldByName('VLRLANCSINAL').AsFloat + prTotRend2;
            end
            else
            Begin
              cdsDet.Insert;
              cdsDet.FieldByName('IDINFORME').AsInteger     := piLinhaRendINSS;
              cdsDet.FieldByName('VLRLANC').AsFloat         := prTotRend2;
              cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := prTotRend2;
              cdsDet.FieldByName('FONTEPAGADORA').AsInteger := 2;
            end;
            cdsDet.Post;
          end;
        end
        {Fim 2º Caso - A fonte pagadora 1 é maior ou igual ao o valor do idoso}

        else
        begin

          {3º Caso - A fonte pagadora 1 é menor que valor do idoso e a fonte pagadora 2 é maior que valor do idoso}
          if (prTotRend1 < prValIdosoFixo) and (prTotRend2 >= prValIdosoFixo) then
          begin
            // Se rendimento Funcef maior que zero
            if prTotRend1 > 0 then
            begin
              If Trim(psCodRubricas) = '' Then
              Begin
                if not cdsDet.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([piLinhaAcima65,1]), []) Then
                Begin
                  cdsDet.Insert;
                  cdsDet.FieldByName('IDINFORME').AsInteger     := piLinhaAcima65;
                  cdsDet.FieldByName('VLRLANC').AsFloat         := prTotRend1;
                  cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := prTotRend1;
                  cdsDet.FieldByName('FONTEPAGADORA').AsInteger := 1;
                end
                else
                begin
                  cdsDet.Edit;
                  cdsDet.FieldByName('VLRLANC').AsFloat         := cdsDet.FieldByName('VLRLANC').AsFloat + prTotRend1;
                  cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := cdsDet.FieldByName('VLRLANCSINAL').AsFloat + prTotRend1;
                end;
                cdsDet.Post;
              End;
            end;

            // Se redimento funcef maior que zero
            if prTotRend1 > 0 then
              // Valor do Idoso passa a ser o Valor de Desconto Idoso (fixo) o valor do rendimento da funcef
              prValorIdoso := prValIdosoFixo - prTotRend1
            else
              prValorIdoso := prValIdosoFixo;

            // Se rendimento Funcef for maior ou igual a zero
            if prTotRend1 >= 0 then
            begin
              if cdsDet.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([piLinhaRendINSS,2]), []) Then
              Begin
                cdsDet.Edit;
                cdsDet.FieldByName('VLRLANC').AsFloat         := cdsDet.FieldByName('VLRLANC').AsFloat + (prTotRend2 - prValorIdoso);
                cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := cdsDet.FieldByName('VLRLANCSINAL').AsFloat + (prTotRend2 - prValorIdoso);
              end
              else
              Begin
                cdsDet.Insert;
                cdsDet.FieldByName('IDINFORME').AsInteger     := piLinhaRendINSS;
                cdsDet.FieldByName('VLRLANC').AsFloat         := (prTotRend2 - prValorIdoso);
                cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := (prTotRend2 - prValorIdoso);
                cdsDet.FieldByName('FONTEPAGADORA').AsInteger := 2;
              end;
              cdsDet.Post;
            end
            // Se rendimento da Funcef for menor que zero
            else
            begin
              if cdsDet.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([piLinhaRendINSS,2]), []) Then
              Begin
                cdsDet.Edit;
                cdsDet.FieldByName('VLRLANC').AsFloat         := cdsDet.FieldByName('VLRLANC').AsFloat + (prTotRend2 - prValorIdoso + prTotRend1);
                cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := cdsDet.FieldByName('VLRLANCSINAL').AsFloat + (prTotRend2 - prValorIdoso + prTotRend1);
              end
              else
              Begin
                cdsDet.Insert;
                cdsDet.FieldByName('IDINFORME').AsInteger     := piLinhaRendINSS;
                cdsDet.FieldByName('VLRLANC').AsFloat         := (prTotRend2 - prValorIdoso + prTotRend1);
                cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := (prTotRend2 - prValorIdoso + prTotRend1);
                cdsDet.FieldByName('FONTEPAGADORA').AsInteger := 2;
              end;
              cdsDet.Post;
            end;
            If Trim(psCodRubricas) = '' Then
            Begin
              if not cdsDet.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([piLinhaAcima65INSS,2]), []) Then
              Begin
                cdsDet.Insert;
                cdsDet.FieldByName('IDINFORME').AsInteger     := piLinhaAcima65INSS;
                cdsDet.FieldByName('VLRLANC').AsFloat         := prValorIdoso;
                cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := prValorIdoso;
                cdsDet.FieldByName('FONTEPAGADORA').AsInteger := 2;
              end
              else
              begin
                cdsDet.Edit;
                cdsDet.FieldByName('VLRLANC').AsFloat         := cdsDet.FieldByName('VLRLANC').AsFloat + prValorIdoso;
                cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := cdsDet.FieldByName('VLRLANCSINAL').AsFloat + prValorIdoso;
              end;
              cdsDet.Post;
            End;
          end
          {Fim 3º Caso - A fonte pagadora 1 é menor que valor do idoso e a fonte pagadora 2 é maior que valor do idoso}
          else
          begin

            {4º Caso - A fonte pagadora 1 é menor que valor do idoso e a fonte pagadora 2 é menor que valor do idoso}
            if (prTotRend1 + prTotRend2 > 0) and (prTotRend1 < prValIdosoFixo) and (prTotRend2 < prValIdosoFixo) then
            begin
              if prTotRend1 > 0 then
              begin
                If Trim(psCodRubricas) = '' Then
                Begin
                  if not cdsDet.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([piLinhaAcima65,1]), []) Then
                  Begin
                    cdsDet.Insert;
                    cdsDet.FieldByName('IDINFORME').AsInteger     := piLinhaAcima65;
                    cdsDet.FieldByName('VLRLANC').AsFloat         := prTotRend1;
                    cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := prTotRend1;
                    cdsDet.FieldByName('FONTEPAGADORA').AsInteger := 1;
                  end
                  else
                  begin
                    cdsDet.Edit;
                    cdsDet.FieldByName('VLRLANC').AsFloat         := cdsDet.FieldByName('VLRLANC').AsFloat + prTotRend1;
                    cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := cdsDet.FieldByName('VLRLANCSINAL').AsFloat + prTotRend1;
                  end;
                  cdsDet.Post;
                End;
              end;

              if prTotRend1 > 0 then
                prValorIdoso := prValIdosoFixo - prTotRend1
              else
                prValorIdoso := prValIdosoFixo;

              if prTotRend2 > 0 then
              begin
                if prTotRend1 >= 0 then
                begin
                  if cdsDet.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([piLinhaRendINSS,2]), []) Then
                  Begin
                    cdsDet.Edit;
                    cdsDet.FieldByName('VLRLANC').AsFloat         := cdsDet.FieldByName('VLRLANC').AsFloat + (prTotRend2 - prValorIdoso);
                    cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := cdsDet.FieldByName('VLRLANCSINAL').AsFloat + (prTotRend2 - prValorIdoso);
                  end
                  else
                  Begin
                    cdsDet.Insert;
                    cdsDet.FieldByName('IDINFORME').AsInteger     := piLinhaRendINSS;
                    cdsDet.FieldByName('VLRLANC').AsFloat         := (prTotRend2 - prValorIdoso);
                    cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := (prTotRend2 - prValorIdoso);
                    cdsDet.FieldByName('FONTEPAGADORA').AsInteger := 2;
                  end;
                  cdsDet.Post;
                end
                else
                begin
                  if cdsDet.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([piLinhaRendINSS,2]), []) Then
                  Begin
                    cdsDet.Edit;
                    cdsDet.FieldByName('VLRLANC').AsFloat         := cdsDet.FieldByName('VLRLANC').AsFloat + (prTotRend2 - prValorIdoso + prTotRend1);
                    cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := cdsDet.FieldByName('VLRLANCSINAL').AsFloat + (prTotRend2 - prValorIdoso + prTotRend1);
                  end
                  else
                  Begin
                    cdsDet.Insert;
                    cdsDet.FieldByName('IDINFORME').AsInteger     := piLinhaRendINSS;
                    cdsDet.FieldByName('VLRLANC').AsFloat         := (prTotRend2 - prValorIdoso + prTotRend1);
                    cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := (prTotRend2 - prValorIdoso + prTotRend1);
                    cdsDet.FieldByName('FONTEPAGADORA').AsInteger := 2;
                  end;
                  cdsDet.Post;
                end;

                If Trim(psCodRubricas) = '' Then
                Begin
                  if not cdsDet.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([piLinhaAcima65INSS,2]), []) Then
                  Begin
                    cdsDet.Insert;
                    cdsDet.FieldByName('IDINFORME').AsInteger     := piLinhaAcima65INSS;
                    cdsDet.FieldByName('VLRLANC').AsFloat         := prValorIdoso;
                    cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := prValorIdoso;
                    cdsDet.FieldByName('FONTEPAGADORA').AsInteger := 2;
                  end
                  else
                  begin
                    cdsDet.Edit;
                    cdsDet.FieldByName('VLRLANC').AsFloat         := cdsDet.FieldByName('VLRLANC').AsFloat + prValorIdoso;
                    cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := cdsDet.FieldByName('VLRLANCSINAL').AsFloat + prValorIdoso;
                  end;
                  cdsDet.Post;
                End;
              end;
            end;
          End;
        End;
      End;
      {Fim 4º Caso - A fonte pagadora 1 é menor que valor do idoso e a fonte pagadora 2 é menor que valor do idoso}

      {5º Caso - A fonte pagadora 1 é menor que 0 e  nao tem fonte pagadora 2}
      if (prTotRend1 + prTotRend2 <> 0) and (prTotRend1 < 0) and (prTotRend2 = 0) then
      begin
        if prTotRend1 < 0 then
        begin
          if cdsDet.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([piLinhaRend,1]), []) Then
          Begin
            cdsDet.Edit;
            cdsDet.FieldByName('VLRLANC').AsFloat         := cdsDet.FieldByName('VLRLANC').AsFloat + prTotRend1;
            cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := cdsDet.FieldByName('VLRLANCSINAL').AsFloat + prTotRend1;
          end
          else
          Begin
            cdsDet.Insert;
            cdsDet.FieldByName('IDINFORME').AsInteger     := piLinhaRend;
            cdsDet.FieldByName('VLRLANC').AsFloat         := prTotRend1;
            cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := prTotRend1;
            cdsDet.FieldByName('FONTEPAGADORA').AsInteger := 1;
          end;
          cdsDet.Post;
        end;
      end;
      {Fim 5º Caso - A fonte pagadora 1 é menor que 0 e  nao tem fonte pagadora 2}

      {6º Caso - A fonte pagadora 2 é menor que 0 e  nao tem fonte pagadora 1}
      if (prTotRend1 + prTotRend2 <> 0) and (prTotRend2 < 0) and (prTotRend1 = 0) then
      begin
        if prTotRend2 < 0 then
        begin
          if cdsDet.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([piLinhaRendINSS,2]), []) Then
          Begin
            cdsDet.Edit;
            cdsDet.FieldByName('VLRLANC').AsFloat         := cdsDet.FieldByName('VLRLANC').AsFloat + prTotRend2;
            cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := cdsDet.FieldByName('VLRLANCSINAL').AsFloat + prTotRend2;
          end
          else
          Begin
            cdsDet.Insert;
            cdsDet.FieldByName('IDINFORME').AsInteger     := piLinhaRendINSS;
            cdsDet.FieldByName('VLRLANC').AsFloat         := prTotRend2;
            cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := prTotRend2;
            cdsDet.FieldByName('FONTEPAGADORA').AsInteger := 2;
          end;
          cdsDet.Post;
        end;
      end;
      {Fim 6º Caso - A fonte pagadora 1 é menor que 0 e  nao tem fonte pagadora 2}

      {7º Caso - A fonte pagadora 1 e 2 são menores são menores que 0}
      if (prTotRend1 < 0) and (prTotRend2 < 0) then
      begin
        if prTotRend1 < 0 then
        begin
          if cdsDet.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([piLinhaRend,1]), []) Then
          Begin
            cdsDet.Edit;
            cdsDet.FieldByName('VLRLANC').AsFloat         := cdsDet.FieldByName('VLRLANC').AsFloat + prTotRend1;
            cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := cdsDet.FieldByName('VLRLANCSINAL').AsFloat + prTotRend1;
          end
          else
          Begin
            cdsDet.Insert;
            cdsDet.FieldByName('IDINFORME').AsInteger     := piLinhaRend;
            cdsDet.FieldByName('VLRLANC').AsFloat         := prTotRend1;
            cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := prTotRend1;
            cdsDet.FieldByName('FONTEPAGADORA').AsInteger := 1;
          end;
          cdsDet.Post;
        end;

        if prTotRend2 < 0 then
        begin
          if cdsDet.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([piLinhaRendINSS,2]), []) Then
          Begin
            cdsDet.Edit;
            cdsDet.FieldByName('VLRLANC').AsFloat         := cdsDet.FieldByName('VLRLANC').AsFloat + prTotRend2;
            cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := cdsDet.FieldByName('VLRLANCSINAL').AsFloat + prTotRend2;
          end
          else
          Begin
            cdsDet.Insert;
            cdsDet.FieldByName('IDINFORME').AsInteger     := piLinhaRendINSS;
            cdsDet.FieldByName('VLRLANC').AsFloat         := prTotRend2;
            cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := prTotRend2;
            cdsDet.FieldByName('FONTEPAGADORA').AsInteger := 2;
          end;
          cdsDet.Post;
        end;
      end;
      {Fim 7º Caso - A fonte pagadora 1 é menor que 0 e  nao tem fonte pagadora 2}
    end;
  end;
end;

procedure TCtrlGeraFolhaFUNCEF.TrataIdosoAbono(const piLinhaAbonoAcima65     : Integer;
                                               const piLinhaAbonoAcima65INSS : Integer;
                                               const piLinhaRend13           : Integer;
                                               const piLinhaRend13INSS       : Integer;
                                               const piLinhaRendAcJud13      : Integer;
                                               const prValorIdoso13          : Double;
                                               const prValorIdoso13Acum      : Double;
                                               const prtotRend131            : Double;
                                               const prtotRend131A           : Double;
                                               const prtotRend132            : Double;
                                               const prtotRend132A           : Double;
                                               const prPercAcao              : Double;
                                               var   prValorIdoso            : Double;
                                               var   prValIdosoFixo          : Double;
                                               const pbTemAcJud              : Boolean);
Var
  rTotalRend13  : Double;
  rTotalRend13A : Double;

begin
  {Tratamento de Décimo Terceiro para Idosos}
  rTotalRend13  := prTotRend131 + prTotRend132;
  rTotalRend13A := prTotRend131A + prTotRend132A;

  prValorIdoso := prValorIdoso13;
  if (rTotalRend13 <> 0) or (rTotalRend13A > 0) then
  begin
    if  prValorIdoso13Acum > 0 Then
    Begin
      if prValorIdoso13Acum >= prValIdosoFixo Then
      Begin
        prValIdosoFixo := 0;
        prValorIdoso   := 0;
      end
      else
      Begin
        prValIdosoFixo := prValIdosoFixo - prValorIdoso13Acum;
        prValorIdoso   := prValIdosoFixo;
      end;
    End;

    If not pbTemAcJud Then
    Begin
      if ((prtotRend131 + prTotRend131A) >= prValorIdoso) Then
      Begin
        {Lançando linha de idoso da fonte pagadora Fundação 13º}
        if cdsDet.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([piLinhaAbonoAcima65, 1]), []) Then
        Begin
          cdsDet.Edit;
          cdsDet.FieldByName('VLRLANC').AsFloat         := cdsDet.FieldByName('VLRLANC').AsFloat + RoundCM(prValorIdoso, 2);
          cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := cdsDet.FieldByName('VLRLANCSINAL').AsFloat + RoundCM(prValorIdoso, 2);
          cdsDet.Post;
        end
        else
        Begin
          cdsDet.Insert;
          cdsDet.FieldByName('IDINFORME').AsInteger     := piLinhaAbonoAcima65;
          cdsDet.FieldByName('VLRLANC').AsFloat         := RoundCM(prValorIdoso, 2);
          cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM(prValorIdoso, 2);
          cdsDet.FieldByName('FONTEPAGADORA').AsInteger := 1;
          cdsDet.Post;
        end;

        {Lançando linha de rendimento da fonte pagadora Fundação 13º}
        if cdsDet.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([piLinhaRend13, 1]), []) Then
        Begin
          cdsDet.Edit;
          cdsDet.FieldByName('VLRLANC').AsFloat         := cdsDet.FieldByName('VLRLANC').AsFloat + RoundCM((prtotRend131 + prTotRend131A) - prValorIdoso, 2);
          cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := cdsDet.FieldByName('VLRLANCSINAL').AsFloat + RoundCM((prtotRend131 + prTotRend131A) - prValorIdoso, 2);
          cdsDet.Post;
        end
        else
        Begin
          cdsDet.Insert;
          cdsDet.FieldByName('IDINFORME').AsInteger     := piLInhaRend13;
          cdsDet.FieldByName('VLRLANC').AsFloat         := RoundCM((prtotRend131 + prTotRend131A) - prValorIdoso, 2);
          cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM((prtotRend131 + prTotRend131A) - prValorIdoso, 2);
          cdsDet.FieldByName('FONTEPAGADORA').AsInteger := 1;
          cdsDet.Post;
        end;
        prValorIdoso := 0;

        {Lançando linha de rendimento da fonte pagadora INSS 13º}
        if cdsDet.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([piLinhaRend13INSS, 2]), []) Then
        Begin
          cdsDet.Edit;
          cdsDet.FieldByName('VLRLANC').AsFloat         := cdsDet.FieldByName('VLRLANC').AsFloat + RoundCM((prtotRend132 + prtotRend132A), 2);
          cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := cdsDet.FieldByName('VLRLANCSINAL').AsFloat + RoundCM((prtotRend132 + prtotRend132A), 2);
          cdsDet.Post;
        end
        else
        Begin
          cdsDet.Insert;
          cdsDet.FieldByName('IDINFORME').AsInteger     := piLinhaRend13INSS;
          cdsDet.FieldByName('VLRLANC').AsFloat         := RoundCM((prtotRend132 + prtotRend132A), 2);
          cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM((prtotRend132 + prtotRend132A), 2);
          cdsDet.FieldByName('FONTEPAGADORA').AsInteger := 2;
          cdsDet.Post;
        end;
      End
      Else
      Begin
        {Lançando linha de rendimento negativa da fonte pagadora Fundação 13º}
        
        If (( prtotRend131 + prtotRend131A ) < 0 ) Then 
        Begin
          if cdsDet.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([piLinhaRend13, 1]), []) Then
          Begin
            cdsDet.Edit;
            cdsDet.FieldByName('VLRLANC').AsFloat         := cdsDet.FieldByName('VLRLANC').AsFloat + RoundCM((prtotRend131 + prtotRend131A), 2);
            cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := cdsDet.FieldByName('VLRLANCSINAL').AsFloat + RoundCM((prtotRend131 + prtotRend131A), 2);
            cdsDet.Post;
          end
          else
          Begin
            cdsDet.Insert;
            cdsDet.FieldByName('IDINFORME').AsInteger     := piLinhaRend13;
            cdsDet.FieldByName('VLRLANC').AsFloat         := RoundCM((prtotRend131 + prtotRend131A), 2);
            cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM((prtotRend131 + prtotRend131A), 2);
            cdsDet.FieldByName('FONTEPAGADORA').AsInteger := 1;
            cdsDet.Post;
          end;
        end
        else
        begin
          {Lançando linha de idoso da fonte pagadora Fundação 13º}
          if cdsDet.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([piLinhaAbonoAcima65, 1]), []) Then
          Begin
            cdsDet.Edit;
            cdsDet.FieldByName('VLRLANC').AsFloat         := cdsDet.FieldByName('VLRLANC').AsFloat + RoundCM((prtotRend131 + prtotRend131A), 2);
            cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := cdsDet.FieldByName('VLRLANCSINAL').AsFloat + RoundCM((prtotRend131 + prtotRend131A), 2);
            cdsDet.Post;
          end
          else
          Begin
            cdsDet.Insert;
            cdsDet.FieldByName('IDINFORME').AsInteger     := piLinhaAbonoAcima65;
            cdsDet.FieldByName('VLRLANC').AsFloat         := RoundCM((prtotRend131 + prtotRend131A), 2);
            cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM((prtotRend131 + prtotRend131A), 2);
            cdsDet.FieldByName('FONTEPAGADORA').AsInteger := 1;
            cdsDet.Post;
          end;
          prValorIdoso := prValorIdoso - (prtotRend131 + prtotRend131A);
        end;

        
        If ((prtotRend132 + prtotRend132A) >= prValorIdoso) then 
        Begin
          {Lançando linha de idoso da fonte pagadora INSS 13º}
          if cdsDet.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([piLinhaAbonoAcima65INSS, 2]), []) Then
          Begin
            cdsDet.Edit;
            cdsDet.FieldByName('VLRLANC').AsFloat         := cdsDet.FieldByName('VLRLANC').AsFloat + RoundCM(prValorIdoso, 2);
            cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := cdsDet.FieldByName('VLRLANCSINAL').AsFloat + RoundCM(prValorIdoso, 2);
            cdsDet.Post;
          end
          else
          Begin
            cdsDet.Insert;
            cdsDet.FieldByName('IDINFORME').AsInteger     := piLinhaAbonoAcima65INSS;
            cdsDet.FieldByName('VLRLANC').AsFloat         := RoundCM(prValorIdoso, 2);
            cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM(prValorIdoso, 2);
            cdsDet.FieldByName('FONTEPAGADORA').AsInteger := 2;
            cdsDet.Post;
          end;

          {Lançando linha de Rendimento da fonte pagadora INSS 13º}
          if cdsDet.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([piLinhaRend13INSS, 2]), []) Then
          Begin
            cdsDet.Edit;
            cdsDet.FieldByName('VLRLANC').AsFloat         := cdsDet.FieldByName('VLRLANC').AsFloat + RoundCM((prtotRend132 + prtotRend132A) - prValorIdoso, 2);
            cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := cdsDet.FieldByName('VLRLANCSINAL').AsFloat + RoundCM((prtotRend132 + prtotRend132A) - prValorIdoso, 2);
            cdsDet.Post;
          end
          else
          Begin
            cdsDet.Insert;
            cdsDet.FieldByName('IDINFORME').AsInteger     := piLinhaRend13INSS;
            cdsDet.FieldByName('VLRLANC').AsFloat         := RoundCM((prtotRend132 + prtotRend132A) - prValorIdoso, 2);
            cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM((prtotRend132 + prtotRend132A) - prValorIdoso, 2);
            cdsDet.FieldByName('FONTEPAGADORA').AsInteger := 2;
            cdsDet.Post;
          end;
          prValorIdoso := 0;
        End
        Else
        Begin
          
          if ((prtotRend132 + prtotRend132A) < 0 ) then
          begin
            {Lançando linha de rendimento negativa da fonte pagadora INSS 13º}
            if cdsDet.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([piLinhaRend13INSS, 2]), []) Then
            Begin
              cdsDet.Edit;
              cdsDet.FieldByName('VLRLANC').AsFloat         := cdsDet.FieldByName('VLRLANC').AsFloat + RoundCM((prtotRend132 + prtotRend132A), 2);
              cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := cdsDet.FieldByName('VLRLANCSINAL').AsFloat + RoundCM((prtotRend132 + prtotRend132A), 2);
              cdsDet.Post;
            end
            else
            Begin
              cdsDet.Insert;
              cdsDet.FieldByName('IDINFORME').AsInteger     := piLinhaRend13INSS;
              cdsDet.FieldByName('VLRLANC').AsFloat         := RoundCM((prtotRend132 + prtotRend132A), 2);
              cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM((prtotRend132 + prtotRend132A), 2);
              cdsDet.FieldByName('FONTEPAGADORA').AsInteger := 2;
              cdsDet.Post;
            end;
          end
          
          else
          begin
            {Lançando linha de idoso da fonte pagadora INSS 13º}
            if cdsDet.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([piLinhaAbonoAcima65INSS, 2]), []) Then
            Begin
              cdsDet.Edit;
              cdsDet.FieldByName('VLRLANC').AsFloat         := cdsDet.FieldByName('VLRLANC').AsFloat + RoundCM((prtotRend132 + prtotRend132A), 2);
              cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := cdsDet.FieldByName('VLRLANCSINAL').AsFloat + RoundCM((prtotRend132 + prtotRend132A), 2);
              cdsDet.Post;
            end
            else
            Begin
              cdsDet.Insert;
              cdsDet.FieldByName('IDINFORME').AsInteger     := piLinhaAbonoAcima65INSS;
              cdsDet.FieldByName('VLRLANC').AsFloat         := RoundCM((prtotRend132 + prtotRend132A), 2);
              cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM((prtotRend132 + prtotRend132A), 2);
              cdsDet.FieldByName('FONTEPAGADORA').AsInteger := 2;
              cdsDet.Post;
            end;
            prValorIdoso := prValorIdoso - (prtotRend132 + prtotRend132A)
          end;
        End;
      End;
    End
    Else
    Begin
      {Ação Judicial }
      if ((prtotRend131 + prtotRend131A) >= prValorIdoso) Then
      Begin
        {Lançando linha de idoso da fonte pagadora Fundação 13º}
        if cdsDet.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([piLinhaAbonoAcima65, 1]), []) Then
        Begin
          cdsDet.Edit;
          cdsDet.FieldByName('VLRLANC').AsFloat         := cdsDet.FieldByName('VLRLANC').AsFloat + RoundCM(prValorIdoso, 2);
          cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := cdsDet.FieldByName('VLRLANCSINAL').AsFloat + RoundCM(prValorIdoso, 2);
          cdsDet.Post;
        end
        else
        Begin
          cdsDet.Insert;
          cdsDet.FieldByName('IDINFORME').AsInteger     := piLinhaAbonoAcima65;
          cdsDet.FieldByName('VLRLANC').AsFloat         := RoundCM(prValorIdoso, 2);
          cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM(prValorIdoso, 2);
          cdsDet.FieldByName('FONTEPAGADORA').AsInteger := 1;
          cdsDet.Post;
        end;

        {Lançando linha de rendimento da fonte pagadora Fundação 13º}
        if cdsDet.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([piLinhaRend13,1]), []) Then
        Begin
          cdsDet.Edit;
          cdsDet.FieldByName('VLRLANC').AsFloat         := cdsDet.FieldByName('VLRLANC').AsFloat + RoundCM((((prtotRend131 + prtotRend131A)-prValorIdoso) * (100 - prPercAcao))/100, 2);
          cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := cdsDet.FieldByName('VLRLANCSINAL').AsFloat + RoundCM((((prtotRend131 + prtotRend131A)-prValorIdoso) * (100 - prPercAcao))/100, 2);
          cdsDet.Post;
        End
        Else
        begin
          cdsDet.Insert;
          cdsDet.FieldByName('IDINFORME').AsInteger     := piLinhaRend13;
          cdsDet.FieldByName('VLRLANC').AsFloat         := RoundCM((((prtotRend131 + prtotRend131A)-prValorIdoso) * (100 - prPercAcao))/100, 2);
          cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM((((prtotRend131 + prtotRend131A)-prValorIdoso) * (100 - prPercAcao))/100, 2);
          cdsDet.FieldByName('FONTEPAGADORA').AsInteger := 1;
          cdsDet.Post;
        End;


        {Lançando linha de rendimento da fonte pagadora Fundação 13º para Ação Judicial}
        if cdsDet.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([piLinhaRendAcJud13,1]), []) Then
        Begin
          cdsDet.Edit;
          cdsDet.FieldByName('VLRLANC').AsFloat         := cdsDet.FieldByName('VLRLANC').AsFloat + RoundCM((((prtotRend131 + prtotRend131A)-prValorIdoso) * prPercAcao)/100, 2);
          cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := cdsDet.FieldByName('VLRLANCSINAL').AsFloat + RoundCM((((prtotRend131 + prtotRend131A)-prValorIdoso) * prPercAcao)/100, 2);
          cdsDet.Post;
        End
        Else
        begin
          cdsDet.Insert;
          cdsDet.FieldByName('IDINFORME').AsInteger     := piLinhaRendAcJud13;
          cdsDet.FieldByName('VLRLANC').AsFloat         := RoundCM((((prtotRend131 + prtotRend131A)-prValorIdoso) * prPercAcao)/100, 2);
          cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM((((prtotRend131 + prtotRend131A)-prValorIdoso) * prPercAcao)/100, 2);
          cdsDet.FieldByName('FONTEPAGADORA').AsInteger := 1;
          cdsDet.Post;
        End;
        prValorIdoso := 0;
      End
      Else
      Begin
        
        If (( prtotRend131 + prtotRend131A ) < 0 ) Then 
        Begin
          {Lançando linha de rendimento negativa da fonte pagadora Fundação 13º}
          if cdsDet.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([piLinhaRend13,1]), []) Then
          Begin
            cdsDet.Edit;
            cdsDet.FieldByName('VLRLANC').AsFloat         := cdsDet.FieldByName('VLRLANC').AsFloat + RoundCM((((prtotRend131 + prtotRend131A)-prValorIdoso) * (100 - prPercAcao))/100, 2);
            cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := cdsDet.FieldByName('VLRLANCSINAL').AsFloat + RoundCM((((prtotRend131 + prtotRend131A)-prValorIdoso) * (100 - prPercAcao))/100, 2);
            cdsDet.Post;
          End
          Else
          begin
            cdsDet.Insert;
            cdsDet.FieldByName('IDINFORME').AsInteger     := piLinhaRend13;
            cdsDet.FieldByName('VLRLANC').AsFloat         := RoundCM((((prtotRend131 + prtotRend131A)-prValorIdoso) * (100 - prPercAcao))/100, 2);
            cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM((((prtotRend131 + prtotRend131A)-prValorIdoso) * (100 - prPercAcao))/100, 2);
            cdsDet.FieldByName('FONTEPAGADORA').AsInteger := 1;
            cdsDet.Post;
          End;

          {Lançando linha de rendimento negativa da fonte pagadora Fundação 13º para Ação Judicial}
          if cdsDet.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([piLinhaRendAcJud13,1]), []) Then
          Begin
            cdsDet.Edit;
            cdsDet.FieldByName('VLRLANC').AsFloat         := cdsDet.FieldByName('VLRLANC').AsFloat + RoundCM((((prtotRend131 + prtotRend131A)-prValorIdoso) * prPercAcao)/100, 2);
            cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := cdsDet.FieldByName('VLRLANCSINAL').AsFloat + RoundCM((((prtotRend131 + prtotRend131A)-prValorIdoso) * prPercAcao)/100, 2);
            cdsDet.Post;
          End
          Else
          begin
            cdsDet.Insert;
            cdsDet.FieldByName('IDINFORME').AsInteger     := piLinhaRendAcJud13;
            cdsDet.FieldByName('VLRLANC').AsFloat         := RoundCM((((prtotRend131 + prtotRend131A)-prValorIdoso) * prPercAcao)/100, 2);
            cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM((((prtotRend131 + prtotRend131A)-prValorIdoso) * prPercAcao)/100, 2);
            cdsDet.FieldByName('FONTEPAGADORA').AsInteger := 1;
            cdsDet.Post;
          End;
        End
        
        else
        begin
          {Lançando linha de idoso da fonte pagadora INSS 13º}
          if cdsDet.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([piLinhaAbonoAcima65, 1]), []) Then
          Begin
            cdsDet.Edit;
            cdsDet.FieldByName('VLRLANC').AsFloat         := cdsDet.FieldByName('VLRLANC').AsFloat + RoundCM((prtotRend131 + prtotRend131A), 2);
            cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := cdsDet.FieldByName('VLRLANCSINAL').AsFloat + RoundCM((prtotRend131 + prtotRend131A), 2);
            cdsDet.Post;
          end
          else
          Begin
            cdsDet.Insert;
            cdsDet.FieldByName('IDINFORME').AsInteger     := piLinhaAbonoAcima65;
            cdsDet.FieldByName('VLRLANC').AsFloat         := RoundCM((prtotRend131 + prtotRend131A), 2);
            cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM((prtotRend131 + prtotRend131A), 2);
            cdsDet.FieldByName('FONTEPAGADORA').AsInteger := 1;
            cdsDet.Post;
          end;
          prValorIdoso := prValorIdoso - (prtotRend131 + prtotRend131A);
        end;
        
      End;

      If ((prtotRend132 + prtotRend132A) >= prValorIdoso) Then
      Begin
        {Lançando linha de idoso da fonte pagadora INSS 13º}
        if cdsDet.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([piLinhaAbonoAcima65INSS, 2]), []) Then
        Begin
          cdsDet.Edit;
          cdsDet.FieldByName('VLRLANC').AsFloat         := cdsDet.FieldByName('VLRLANC').AsFloat + RoundCM(prValorIdoso, 2);
          cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := cdsDet.FieldByName('VLRLANCSINAL').AsFloat + RoundCM(prValorIdoso, 2);
          cdsDet.Post;
        end
        else
        Begin
          cdsDet.Insert;
          cdsDet.FieldByName('IDINFORME').AsInteger     := piLinhaAbonoAcima65INSS;
          cdsDet.FieldByName('VLRLANC').AsFloat         := RoundCM(prValorIdoso, 2);
          cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM(prValorIdoso, 2);
          cdsDet.FieldByName('FONTEPAGADORA').AsInteger := 2;
          cdsDet.Post;
        end;

        {Lançando linha de Rendimento da fonte pagadora INSS 13º}
        if cdsDet.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([piLinhaRend13INSS, 2]), []) Then
        Begin
          cdsDet.Edit;
          cdsDet.FieldByName('VLRLANC').AsFloat         := cdsDet.FieldByName('VLRLANC').AsFloat + RoundCM((prtotRend132 + prtotRend132A) - prValorIdoso, 2);
          cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := cdsDet.FieldByName('VLRLANCSINAL').AsFloat + RoundCM((prtotRend132 + prtotRend132A) - prValorIdoso, 2);
          cdsDet.Post;
        end
        else
        Begin
          cdsDet.Insert;
          cdsDet.FieldByName('IDINFORME').AsInteger     := piLinhaRend13INSS;
          cdsDet.FieldByName('VLRLANC').AsFloat         := RoundCM((prtotRend132 + prtotRend132A) - prValorIdoso, 2);
          cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM((prtotRend132 + prtotRend132A) - prValorIdoso, 2);
          cdsDet.FieldByName('FONTEPAGADORA').AsInteger := 2;
          cdsDet.Post;
        end;
        prValorIdoso := 0;
      End
      Else
      Begin

        if ((prtotRend132 + prtotRend132A) < 0 ) then
        begin
          {Lançando linha de rendimento negativa da fonte pagadora INSS 13º}
          if cdsDet.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([piLinhaRend13INSS, 2]), []) Then
          Begin
            cdsDet.Edit;
            cdsDet.FieldByName('VLRLANC').AsFloat         := cdsDet.FieldByName('VLRLANC').AsFloat + RoundCM((prtotRend132 + prtotRend132A), 2);
            cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := cdsDet.FieldByName('VLRLANCSINAL').AsFloat + RoundCM((prtotRend132 + prtotRend132A), 2);
            cdsDet.Post;
          end
          else
          Begin
            cdsDet.Insert;
            cdsDet.FieldByName('IDINFORME').AsInteger     := piLinhaRend13INSS;
            cdsDet.FieldByName('VLRLANC').AsFloat         := RoundCM((prtotRend132 + prtotRend132A), 2);
            cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM((prtotRend132 + prtotRend132A), 2);
            cdsDet.FieldByName('FONTEPAGADORA').AsInteger := 2;
            cdsDet.Post;
          end;
        end
        else
        begin
          {Lançando linha de idoso da fonte pagadora INSS 13º}
          if cdsDet.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([piLinhaAbonoAcima65INSS, 2]), []) Then
          Begin
            cdsDet.Edit;
            cdsDet.FieldByName('VLRLANC').AsFloat         := cdsDet.FieldByName('VLRLANC').AsFloat + RoundCM((prtotRend132 + prtotRend132A), 2);
            cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := cdsDet.FieldByName('VLRLANCSINAL').AsFloat + RoundCM((prtotRend132 + prtotRend132A), 2);
            cdsDet.Post;
          end
          else
          Begin
            cdsDet.Insert;
            cdsDet.FieldByName('IDINFORME').AsInteger     := piLinhaAbonoAcima65INSS;
            cdsDet.FieldByName('VLRLANC').AsFloat         := RoundCM((prtotRend132 + prtotRend132A), 2);
            cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM((prtotRend132 + prtotRend132A), 2);
            cdsDet.FieldByName('FONTEPAGADORA').AsInteger := 2;
            cdsDet.Post;
          end;
          prValorIdoso := prValorIdoso - (prtotRend132 + prtotRend132A)
        end;
      End;
    End;
  End;
end;

procedure TCtrlGeraFolhaFUNCEF.BuscaLancamentos(const psCodRubricas    : String;
                                                //const psListaPessoa    : String;
                                                //const piPessoa         : Integer;
                                                const psCodNatureza    : String;
                                                const psCodCentroCusto : String;
                                                const piIdEmpresa      : Integer;
                                                const piTipoFiltro     : Integer;
                                                const piVersao         : Integer;
                                                const piIdListaUsuario : Integer;
                                                const pdDataIni        : TDateTime;
                                                const pdDataFim        : TDateTime);
Var
  sSql : String;

begin
  sSql :=
    ' SELECT '                                                                                     + #13#10 +
    '   ABS(SUM(DECODE(H.VALORPROVENTO, 0, '                                                       + #13#10 +
    '             DECODE(H.FLGDESCONTO, 2, H.VALORINFO, H.VALORPROVENTO), H.VALORPROVENTO) * '     + #13#10 +
    '             DECODE(PD.FLGDESCONTO, 1, -1, 1))) AS VALOR, '                                   + #13#10 +
    '   SUM(DECODE(H.VALORPROVENTO, 0, '                                                           + #13#10 +
    '         DECODE(H.FLGDESCONTO, 2, H.VALORINFO, H.VALORPROVENTO), H.VALORPROVENTO) * '         + #13#10 +
    '           DECODE(I.CODDIRF, 22, '                                                            + #13#10 +
    '             DECODE(PD.FLGDESCONTO, 0, 1, -1), 16, '                                          + #13#10 +
    '               DECODE(PD.FLGDESCONTO, 0, 1, -1), 23, '                                        + #13#10 +
    '                 DECODE(PD.FLGDESCONTO, 0, 1, -1), 24, '                                      + #13#10 +
    '                   DECODE(PD.FLGDESCONTO, 0, 1, -1), 25, '                                    + #13#10 +
    '               DECODE(PD.FLGDESCONTO, 0, 1, -1), '                                            + #13#10 +
    '                 DECODE(PD.FLGDESCONTO, 1, -1, 1))) AS VALORSINAL, '                          + #13#10 +
    '  H.IDINFORME, '                                                                              + #13#10 +
    '  H.IDRESPONSAVEL AS IDPESSOA, '                                                              + #13#10 +
    '  H.IDRESPONSAVEL, '                                                                          + #13#10 +
    '  PF.DATAMOLESTIAGRAVE, '                                                                     + #13#10 +
    '  PF.DATANASC, '                                                                              + #13#10 +
    '  H.FLGISENTOIRRF, '                                                                          + #13#10 +
    '  PF.FLGSOMAIRSUPINSS, '                                                                      + #13#10 +
    '  H.FONTEPAGADORA, '                                                                          + #13#10 +
    '  H.IDHSTFOLHABENEF, '                                                                        + #13#10 +
    '  H.IDMOTIVO, '                                                                               + #13#10 +
    '  H.IDPATRO AS IDPESSJUR, '                                                                   + #13#10 +
    '  H.IDPATRO, '                                                                                + #13#10 +
    '  H.DATAPAGAMENTO,'                                                                           + #13#10 +
    '  I.FLGIRRF, '                                                                                + #13#10 +
    '  I.FLGBASE, '                                                                                + #13#10 +
    '  I.CODDIRF, '                                                                                + #13#10 +
    '  P.NUMDOCUMENTO, '                                                                           + #13#10 +
    '  H.CODIRRFDARF, '                                                                            + #13#10 +
    '  NVL(H.IDPLANOCONTABIL, H.IDPLANOPREV) AS IDPLANOPREV, '                                     + #13#10 +
    '  H.IDMODULO, '                                                                               + #13#10 +
       QuotedStr(psCodCentroCusto)+' AS CODCENTROCUSTO, '                                          + #13#10 +
    '  H.FLGMOLESTIAGRAVE, '                                                                       + #13#10 +
    '  PD.CODPROVDESC, '                                                                           + #13#10 +
    '  PD.IDPROVENTO, '                                                                            + #13#10 +
    '  H.VALORINFO,  '                                                                             + #13#10 +
    '  DECODE(PD.FLGDESCONTO, '                                                                    + #13#10 +
    '    0, NVL(H.PLACONTAD, RX.PLACONTAD), NVL(H.PLACONTAC, RX.PLACONTAC)) AS PLACONTAC, '        + #13#10 +
    '  DECODE(H.FLGTIPODESC, ''I'', '                                                              + #13#10 +
    '    DECODE(TRIM(RX.CODTIPRECDESFAV), '''', H.CODTIPRECDES, RX.CODTIPRECDESFAV), '             + #13#10 +
    '      DECODE(TRIM(H.CODTIPRECDES), '''', RX.CODTIPRECDES, H.CODTIPRECDES)) AS CODTIPRECDES, ' + #13#10 +
    '  DECODE(H.PLANO, NULL, RX.PLANO, H.PLANO) AS PLANOCONTAB, '                                  + #13#10 +
    '  PD.FLGDESCONTO, '                                                                           + #13#10 +
    '  H.CODCENTRORESPON, '                                                                        + #13#10 +
    '  PD.FLGESPECIAL, '                                                                           + #13#10 +
    '  PR.PERCACAO, '                                                                              + #13#10 +
    '  DECODE(NVL(PR.PERCACAO, 0), 0, 0, 1) AS TEMACAO, '                                          + #13#10 +
    '  DECODE(H.FLGPENSAOALIM, 2, H.FLGPENSAOALIM, 0) AS FLGPENSAOALIM, '                          + #13#10 +
    '  PR.IDPROCJUD '                                                                             + #13#10 +

    ' FROM '                                                                                       + #13#10 +
    '   HISTRUBSAL    H, '                                                                         + #13#10 +
    '   PROVDESC      PD, '                                                                        + #13#10 +
    // Edilaine - SOL 196824 / KTN 1884092
    //'   INFORME       I, '                                                                       + #13#10 +
    '   (SELECT DISTINCT IDINFORME, FLGIRRF, FLGBASE, CODDIRF FROM INFORME) I, '                   + #13#10 +
    // Edilaine - SOL 196824 / KTN 1884092
    '   PESSOA        P, '                                                                         + #13#10 +
    '   PESSOAFISICA  PF, '                                                                        + #13#10 +
    '   RUBRICAXPLANO RX, '                                                                        + #13#10 +
    '   PROCJUD       PR '                                                                        + #13#10 +
//  '  , PROCJUD       PR2 '                                                                        + #13#10 +

    ' WHERE (H.IDRUBRICA       = PD.IDPROVENTO) '                                                  + #13#10 +
    '   AND (H.IDINFORME       = I.IDINFORME) '                                                    + #13#10 +
    '   AND (H.IDMODULO        = 18) '                                                             + #13#10 ;

    If Pos(',', psCodRubricas) > 0 Then
    Begin
      If Trim(psCodRubricas) <> '' Then
        sSql := sSql + '   AND (H.IDRUBRICA      IN ('+psCodRubricas+')) '                         + #13#10 ;
    End
    Else
      If Trim(psCodRubricas) <> '' Then
        sSql := sSql + '   AND (H.IDRUBRICA       = '+psCodRubricas+') '                           + #13#10 ;

    If piTipoFiltro = 1 then
      ssql := ssql + '   AND (H.CODIRRFDARF     = '+QuotedStr(psCodNatureza)+') '                  + #13#10 ;

    ssql := ssql +
      '   AND ((H.FLGESTORNO     = 0) OR '                                                         + #13#10 +
      '        (H.FLGESTORNO    IS NULL)) '                                                        + #13#10 +
      '   AND (H.IDLANCIRRF     IS NULL) '                                                         + #13#10 +
      '   AND (H.IDPESSJUR       = '+IntToStr(piIdEmpresa)+' ) '                                   + #13#10 +
      '   AND (H.IDRESPONSAVEL   = PF.IDPESSOA) '                                                  + #13#10 +
      '   AND (P.IDPESSOA        = H.IDPESSJUR) '                                                  + #13#10 ;

    //CPrev - 24663 - Inicio
    //If Trim(psListaPessoa) <> '' Then
    //  sSql := sSql + '   AND (H.IDRESPONSAVEL  IN ('+psListaPessoa+')) '                           + #13#10 ;

    If piIdListaUsuario > 0 Then
      sSql:= sSql + '   AND EXISTS (SELECT 1 FROM LISTAFOLHABENEFDET LD '                          + #13#10 +
                    '               WHERE H.IDTITULAR     = LD.IDTITULAR '                         + #13#10 +
                    '                 AND H.IDRESPONSAVEL = LD.IDPESSOA '                          + #13#10 +
                    '                 AND LD.IDLISTA      = '+ IntToStr(piIdListaUsuario) +') '    + #13#10;

    //If (piPessoa > 0) then
    //  ssql := ssql + '   AND (H.IDRESPONSAVEL   = '+Inttostr(piPessoa)+' ) '                       + #13#10 ;
    //CPrev - 24663 - Fim

    if piVersao <> -1 then
      ssql := ssql + '   AND (H.IDHSTFOLHABENEF = '+Inttostr(piVersao)+' ) '                       + #13#10 ;

    Ssql := Ssql +
      '  AND (H.DATAPAGAMENTO  >= TO_DATE('+quotedStr(DateTostr(pdDataIni))+',''DD/MM/YYYY'') ) '  + #13#10 +
      '  AND (H.DATAPAGAMENTO  <= TO_DATE('+quotedStr(DateTostr(pdDataFim))+',''DD/MM/YYYY'') ) '  + #13#10 +
      '  AND (RX.IDPESSJUR(+)   = H.IDPATRO) '                                                     + #13#10 +
      '  AND (RX.IDRUBRICA(+)   = H.IDRUBRICA) '                                                   + #13#10 +
      '  AND (RX.IDPLANOPREV(+) = H.IDPLANOPREV) '                                                 + #13#10 +
      '  AND (((PD.FLGDESCONTO IN (0, 1)) AND '                                                    + #13#10 +
      '        (PD.FLGESPECIAL  = 0)      AND '                                                    + #13#10 +
      '        (H.VALORPROVENTO > 0)) OR      '                                                    + #13#10 +
      '       ((PD.FLGDESCONTO  = 2)      AND '                                                    + #13#10 +
      '        (PD.FLGESPECIAL <> 0)))        '                                                    + #13#10 +
      '  AND (H.IDINFORME      IS NOT NULL) '                                                      + #13#10 +
      '  AND (H.IDRESPONSAVEL   = PR.IDPESSOA(+)) '                                                + #13#10 +
      //'  AND (H.IDPROCJUD       = PR.IDPROCJUD(+)) '                                             + #13#10 +   // Edilaine - SOL 196824 / KTN 1884092 - COMENTADO
      '  AND (PR.SITPROCESSO = 0 OR PR.DATAFINAL IS NULL) '                                        + #13#10 +   // Edilaine - SOL 196824 / KTN 1884092 

      ' GROUP BY '                                                                                 + #13#10 +
      '   H.IDINFORME, '                                                                           + #13#10 +
      '   H.IDRESPONSAVEL, '                                                                       + #13#10 +
      '   PF.DATAMOLESTIAGRAVE, '                                                                  + #13#10 +
      '   PF.DATANASC, '                                                                           + #13#10 +
      '   H.FLGISENTOIRRF, '                                                                       + #13#10 +
      '   PF.FLGSOMAIRSUPINSS, '                                                                   + #13#10 +
      '   H.FONTEPAGADORA, '                                                                       + #13#10 +
      '   H.IDPESSJUR, '                                                                           + #13#10 +
      '   I.FLGIRRF, '                                                                             + #13#10 +
      '   I.FLGBASE, '                                                                             + #13#10 +
      '   P.NUMDOCUMENTO, '                                                                        + #13#10 +
      '   NVL(H.IDPLANOCONTABIL, H.IDPLANOPREV), '                                                 + #13#10 +
      '   H.CODIRRFDARF, '                                                                         + #13#10 +
      '   H.IDPATRO, '                                                                             + #13#10 +
      '   H.IDMODULO, '                                                                            + #13#10 +
      '   H.IDHSTFOLHABENEF, '                                                                     + #13#10 +
      '   I.CODDIRF, '                                                                             + #13#10 +
      '   H.DATAPAGAMENTO, '                                                                       + #13#10 +
      '   H.FLGMOLESTIAGRAVE , '                                                                   + #13#10 +
      '   PD.CODPROVDESC, '                                                                        + #13#10 +
      '   PD.IDPROVENTO, '                                                                         + #13#10 +
      '   H.VALORINFO , '                                                                          + #13#10 +
      '   DECODE(PD.FLGDESCONTO,0,NVL(H.PLACONTAD,RX.PLACONTAD),NVL(H.PLACONTAC,RX.PLACONTAC)), '  + #13#10 +
      '   DECODE(NVL(H.CODTIPRECDES,''''),'''',RX.CODTIPRECDES, H.CODTIPRECDES), '                 + #13#10 +
      '   DECODE(H.FLGTIPODESC, ''I'', '                                                           + #13#10 +
      '     DECODE(TRIM(RX.CODTIPRECDESFAV), '''', H.CODTIPRECDES, RX.CODTIPRECDESFAV), '          + #13#10 +
      '       DECODE(TRIM(H.CODTIPRECDES), '''', RX.CODTIPRECDES, H.CODTIPRECDES)), '              + #13#10 +
      '   DECODE(H.PLANO,NULL,RX.PLANO, H.PLANO), '                                                + #13#10 +
      '   PD.FLGDESCONTO, '                                                                        + #13#10 +
      '   H.IDMOTIVO, '                                                                            + #13#10 +
      '   H.CODCENTRORESPON, '                                                                     + #13#10 +
      '   PD.FLGESPECIAL, '                                                                        + #13#10 +
      '   PR.PERCACAO, '                                                                           + #13#10 +
      '   DECODE(H.FLGPENSAOALIM, 2, H.FLGPENSAOALIM, 0), '                                        + #13#10 +
      '   PR.IDPROCJUD '                                                                           + #13#10 +

      ' ORDER BY '                                                                                 + #13#10 +
      '   H.IDRESPONSAVEL, '                                                                       + #13#10 +
      '   H.IDHSTFOLHABENEF, '                                                                     + #13#10 +
      '   IDPLANOPREV, '                                                                           + #13#10 +
      '   CODIRRFDARF, '                                                                           + #13#10 +
      '   H.FONTEPAGADORA, '                                                                       + #13#10 +
      '   IDMOTIVO, '                                                                              + #13#10 +
      '   FLGIRRF DESC, '                                                                          + #13#10 +
      '   H.IDPATRO, '                                                                             + #13#10 +
      '   FLGPENSAOALIM '                                                                          + #13#10 ;

  cdsDocumento.data := GetDataPacket(sSql);
end;


procedure TCtrlGeraFolhaFUNCEF.BuscaParametros(const piIdEmpresa: Integer);
Var
  sSql : String;

begin
  {Busca parâmetros do IRRF}
  sSql := 'SELECT IDPROGRAMA FROM PROGRAMA   WHERE FLGTIPOPROGRAMA = ''PRE''';
  cdsParamIRRF.data := GetDataPacket(sSql);

  {Busca rubricas de adiantamento da Folha de Benefícios}
  sSql :=
    ' SELECT IDPROVENTO, TRIM(CODPROVDESC) AS CODPROVDESC, DESCRICAO, 1 AS TIPO ' + #13 +
    ' FROM PROVDESC                                                             ' + #13 +
    ' WHERE IDPROVENTO IN (SELECT IDRUBANTECABONO FROM BENEFPLANPREV)           ' + #13 +
    ' UNION                                                                     ' + #13 +
    ' SELECT IDPROVENTO, TRIM(CODPROVDESC) AS CODPROVDESC, DESCRICAO, 2 AS TIPO ' + #13 +
    ' FROM PROVDESC                                                             ' + #13 +
    ' WHERE IDPROVENTO IN (SELECT IDRUBDEVANTABONO FROM BENEFPLANPREV)          ' + #13 ;
  cdsRubricas.Data  := GetDataPacket(sSql);

  {Busca parâmetros da Folha de Benefícios e linhas de dedução de dependente de abono normal e de molestia grave}
  sSql := ' SELECT '+
            ' PRV.IDINFORME, '+
            ' INF.IDINFORMEDESTINO, '+
            ' NVL(PAR2.VALORPARAM,0) AS PARAMRESGATE '+

          ' FROM '+
            ' PARAMFOLHA    PAR, '+
            ' PROVDESC      PRV, '+
            ' INFORMEDEPARA INF, '+
            ' PARAMFOLHA    PAR2 '+

          ' WHERE PAR.NOMEPARAM   = ''IDRUBDEDDEPABONO'' '+
            ' AND PAR.VALORPARAM  = PRV.IDPROVENTO '+
            ' AND PRV.IDINFORME   = INF.IDINFORMEORIGEM(+) '+
            ' AND PAR2.NOMEPARAM  = ''FLGCALCULAIRRESGATEISENTO'' '+
            ' AND PAR2.IDFUNDACAO = '+InttoStr(piIdEmpresa);
  cdsParamFolha.data := GetDataPacket(sSql);
end;

procedure TCtrlGeraFolhaFUNCEF.AtualizaParamHist(//const psListaPessoa  : String;  //CPrev - 24663
                                                 //const piIdPessoa     : Integer; //CPrev - 24663
                                                 const piIdListaUsuario : Integer; //CPrev - 24663
                                                 const psCodRubricas : String;
                                                 const pdDataIni     : TDateTime;
                                                 const pdDataFim     : TDateTime;
                                                 const piIdVersao    : Integer);
Var
  sSql : String;

begin
  sSql :=
    ' UPDATE HISTRUBSAL H '+
    ' SET H.IDINFORME   = (SELECT IDINFORME   FROM PROVDESC WHERE IDPROVENTO = H.IDRUBRICA), '+
    '     H.CODIRRFDARF = (SELECT CODIRRFDARF FROM PROVDESC WHERE IDPROVENTO = H.IDRUBRICA)  '+
    ' WHERE EXISTS (SELECT 1 FROM PROVDESC P '+
                  ' WHERE P.IDPROVENTO       = H.IDRUBRICA '+
                  '   AND P.CODIRRFDARF IS NOT NULL '+
                  '   AND P.IDINFORME   IS NOT NULL) '+
    '   AND H.IDLANCIRRF       IS NULL ';

  //CPrev - 24663 - Inicio
  //If Trim(psListaPessoa) <> '' Then
  //  sSql := sSql + '   AND (H.IDRESPONSAVEL  IN ('+psListaPessoa+')) ';

  //If Trim(psListaPessoa) = '' Then
  //  If piIdPessoa > 0 then
  //    ssql := ssql + '   AND (H.IDRESPONSAVEL  = '+Inttostr(piIdPessoa)+' ) ';

  If piIdListaUsuario > 0 Then
    sSql:= sSql + '   AND EXISTS (SELECT 1 FROM LISTAFOLHABENEFDET LD '                          + #13#10 +
                  '               WHERE H.IDTITULAR     = LD.IDTITULAR '                         + #13#10 +
                  '                 AND H.IDRESPONSAVEL = LD.IDPESSOA '                          + #13#10 +
                  '                 AND LD.IDLISTA      = '+ IntToStr(piIdListaUsuario) +') '    + #13#10;
  //CPrev - 24663 - Fim

  sSql := sSql +
    '   AND (H.DATAPAGAMENTO   >= TO_DATE('''+DateToStr(pdDataIni)+''',''DD/MM/YYYY'')) '+
    '   AND (H.DATAPAGAMENTO   <= TO_DATE('''+DateToStr(pdDataFim)+''',''DD/MM/YYYY'')) ';

  If Pos(',', psCodRubricas) > 0 Then
  Begin
    If Trim(psCodRubricas) <> '' Then
      sSql := sSql + '   AND (H.IDRUBRICA IN ('+psCodRubricas+')) ';
  End
  Else
    If Trim(psCodRubricas) <> '' Then
      sSql := sSql + '   AND (H.IDRUBRICA = '+psCodRubricas+') ';

  sSql := sSql +
    '   AND H.IDMODULO          = 18 '+
    '   AND (H.CODIRRFDARF     IS NULL OR '+
    '        H.IDINFORME       IS NULL) ';

  if piIdVersao > 0 then
    sSql := sSql + ' AND (H.IDHSTFOLHABENEF = '+IntToStr(piIdVersao)+') ';

  MostraMensagem('Inicio do ajuste da HISTRUBSAL: ' + FormatDateTime('hh:nn:ss',Time));

  Try
    ExecSQL(sSql);
  Except
    MostraMensagem('Não foi possível atualizar os parâmetros no histórico de rubricas salariais. ');
    Raise Exception.Create(messageinfo);
  End;

  MostraMensagem('Final do ajuste da HISTRUBSAL: ' + FormatDateTime('hh:nn:ss',Time));
end;

procedure TCtrlGeraFolhaFUNCEF.TrataDeducaoDepAbono(const piIdInformeDedDepAbono    : Integer;
                                                    const piIdInformeDedDepAbonoMol : Integer;
                                                    const piAno                     : Integer;
                                                    const piIdPessoa                : Integer;
                                                    const pbMolestiaGrave           : Boolean);
Var
  rValor : Double;

begin
  BuscaDedDepAbono(piIdInformeDedDepAbono, piIdInformeDedDepAbonoMol, piAno, piIdPessoa);

  if not cdsAux.IsEmpty Then
  begin
    {Se o recebedor estiver em molestia grave, lançar a diferença na linha de molestia}
    if pbMolestiaGrave then
    begin
      if cdsDet.Locate('IDINFORME',piIdInformeDedDepAbonoMol, []) then
      begin
        rValor := cdsDet.FieldByName('VLRLANC').AsFloat;
        cdsDet.delete;

        if cdsDetAbono.Locate('IDINFORME', piIdInformeDedDepAbono, []) then
        begin
          cdsDetAbono.Edit;
          cdsDetAbono.FieldByName('VLRLANC').AsFloat      := RoundCM(cdsDetAbono.FieldByName('VLRLANC').AsFloat + cdsAux.FieldByName('VALOR').AsFloat, 2);
          cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat := RoundCM(cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat + cdsAux.FieldByName('VALOR').AsFloat, 2);
          cdsDetAbono.FieldByName('FLGTIPOREG').AsString  := 'D';
          cdsDetAbono.Post;
        end
        else
        begin
          cdsDetAbono.Insert;
          cdsDetAbono.FieldByName('IDINFORME').AsInteger     := piIdInformeDedDepAbono;
          cdsDetAbono.FieldByName('VLRLANC').AsFloat         := RoundCM(cdsAux.FieldByName('VALOR').AsFloat, 2);
          cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM(cdsAux.FieldByName('VALOR').AsFloat, 2);
          cdsDetAbono.FieldByName('FLGTIPOREG').AsString     := 'D';
          cdsDetAbono.FieldByName('FONTEPAGADORA').AsInteger := 1;
          cdsDetAbono.Post;
        end;

        if rValor = cdsAux.FieldByName('VALOR').AsFloat then
        begin
          if cdsDetAbono.Locate('IDINFORME', piIdInformeDedDepAbonoMol, []) then
          begin
            cdsDetAbono.Edit;
            cdsDetAbono.FieldByName('VLRLANC').AsFloat      := RoundCM(cdsDetAbono.FieldByName('VLRLANC').AsFloat + cdsAux.FieldByName('VALOR').AsFloat, 2);
            cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat := RoundCM(cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat + cdsAux.FieldByName('VALOR').AsFloat, 2);
            cdsDetAbono.FieldByName('FLGTIPOREG').AsString  := 'D';
            cdsDetAbono.Post;
          end
          else
          begin
            cdsDetAbono.Insert;
            cdsDetAbono.FieldByName('IDINFORME').AsInteger     := piIdInformeDedDepAbonoMol;
            cdsDetAbono.FieldByName('VLRLANC').AsFloat         := RoundCM(cdsAux.FieldByName('VALOR').AsFloat * -1, 2);
            cdsDetAbono.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM(cdsAux.FieldByName('VALOR').AsFloat * -1, 2);
            cdsDetAbono.FieldByName('FLGTIPOREG').AsString     := 'D';
            cdsDetAbono.FieldByName('FONTEPAGADORA').AsInteger := 1;
            cdsDetAbono.Post;
          end;
          exit;
        end;
        if cdsAux.FieldByName('VALOR').AsFloat <> rValor then
        begin
          if cdsAux.FieldByName('VALOR').AsFloat > rValor then
          begin
            cdsDet.Insert;
            cdsDet.FieldByName('IDINFORME').AsInteger     := piIdInformeDedDepAbonoMol;
            cdsDet.FieldByName('VLRLANC').AsFloat         := RoundCM(rValor * -1, 2);
            cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM(rValor * -1, 2);
            cdsDet.FieldByName('FONTEPAGADORA').AsInteger := 1;
            cdsDet.Post;
          end
          else
          begin
            cdsDet.Insert;
            cdsDet.FieldByName('IDINFORME').AsInteger     := piIdInformeDedDepAbonoMol;
            cdsDet.FieldByName('VLRLANC').AsFloat         := RoundCM(rValor * -1, 2);
            cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM(rValor * -1, 2);
            cdsDet.FieldByName('FONTEPAGADORA').AsInteger := 1;
            cdsDet.Post;
          end;
        end;
      end;
    end
    else
    begin
      {Senão for molestia grave lançar a diferença na linha normal}
      if cdsDet.Locate('IDINFORME',piIdInformeDedDepAbono, []) then
      begin
        rValor := cdsDet.FieldByName('VLRLANC').AsFloat;
        cdsDet.delete;

        if cdsAux.FieldByName('VALOR').AsFloat <> rValor then
        begin
          if cdsAux.FieldByName('VALOR').AsFloat > rValor then
          begin
            cdsDet.Insert;
            cdsDet.FieldByName('IDINFORME').AsInteger     := piIdInformeDedDepAbono;
            cdsDet.FieldByName('VLRLANC').AsFloat         := RoundCM((rValor - cdsAux.FieldByName('VALOR').AsFloat) * -1, 2);
            cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM((rValor - cdsAux.FieldByName('VALOR').AsFloat) * -1, 2);
            cdsDet.FieldByName('FONTEPAGADORA').AsInteger := 1;
            cdsDet.Post;
          end
          else
          begin
            cdsDet.Insert;
            cdsDet.FieldByName('IDINFORME').AsInteger     := piIdInformeDedDepAbono;
            cdsDet.FieldByName('VLRLANC').AsFloat         := RoundCM(cdsAux.FieldByName('VALOR').AsFloat - rValor, 2);
            cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM(cdsAux.FieldByName('VALOR').AsFloat - rValor, 2);
            cdsDet.FieldByName('FONTEPAGADORA').AsInteger := 1;
            cdsDet.Post;
          end;
        end;
      end
      else
      begin
        if cdsDet.Locate('IDINFORME',piIdInformeDedDepAbonoMol, []) then
        begin
          rValor := cdsDet.FieldByName('VLRLANC').AsFloat;
          cdsDet.delete;

          if cdsAux.FieldByName('VALOR').AsFloat <> rValor then
          begin
            if cdsAux.FieldByName('VALOR').AsFloat > rValor then
            begin
              cdsDet.Insert;
              cdsDet.FieldByName('IDINFORME').AsInteger     := piIdInformeDedDepAbono;
              cdsDet.FieldByName('VLRLANC').AsFloat         := RoundCM((rValor - cdsAux.FieldByName('VALOR').AsFloat) * -1, 2);
              cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM((rValor - cdsAux.FieldByName('VALOR').AsFloat) * -1, 2);
              cdsDet.FieldByName('FONTEPAGADORA').AsInteger := 1;
              cdsDet.Post;
            end
            else
            begin
              cdsDet.Insert;
              cdsDet.FieldByName('IDINFORME').AsInteger     := piIdInformeDedDepAbono;
              cdsDet.FieldByName('VLRLANC').AsFloat         := RoundCM(cdsAux.FieldByName('VALOR').AsFloat - rValor, 2);
              cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM(cdsAux.FieldByName('VALOR').AsFloat - rValor, 2);
              cdsDet.FieldByName('FONTEPAGADORA').AsInteger := 1;
              cdsDet.Post;
            end;
          end;
        end;
      end;
    end;
  end
end;

procedure TCtrlGeraFolhaFUNCEF.BuscaDedDepAbono(const piIdInformeDedDepAbono    : Integer;
                                                const piIdInformeDedDepAbonoMol : Integer;
                                                const piAno                     : Integer;
                                                const piIdPessoa                : Integer);
Var
  sSql : String;

begin
  sSql :=
    ' SELECT '+
      ' LXI.IDINFORME, '+
      ' LXI.VLRLANC AS VALOR '+

    ' FROM '+
      ' LANCXINFORME LXI, '+
      ' LANCIRRF     LIR '+

    ' WHERE LIR.IDBENEFIRRF          = '+IntToStr(piIdPessoa)+
      ' AND LIR.DATALANCAMENTO BETWEEN TO_DATE('+QuotedStr('01/01/'+IntToStr(piAno))+', ''DD/MM/YYYY'') AND '+
                                     ' TO_DATE('+QuotedStr('31/12/'+IntToStr(piAno))+', ''DD/MM/YYYY'') '+
      ' AND LIR.IDLANCIRRF           = LXI.IDLANCIRRF '+
      ' AND LXI.IDINFORME           IN ('+IntToStr(piIdInformeDedDepAbono)+','+IntToStr(piIdInformeDedDepAbonoMol)+')';

  cdsAux.Data := GetDataPacket(sSql);
end;

procedure TCtrlGeraFolhaFUNCEF.ApagaRegistro(const piIdPessoa                : Integer;
                                             const piIdInformeDedDepAbono    : Integer;
                                             const piIdInformeDedDepAbonoMol : Integer;
                                             const piAno                     : Integer);
Var
  sSql : String;

begin
  sSql := ' DELETE LANXINFORME '+
          ' WHERE IDLANCIRRF IN (SELECT IDLANCIRRF FROM LANCIRRF '+
                               ' WHERE IDBENEFIRRF          = '+IntToStr(piIdPessoa)+
                                 ' AND DATALANCAMENTO BETWEEN TO_DATE('+QuotedStr('01/01/'+IntToStr(piAno))+', ''DD/MM/YYYY'') AND '+
                                                            ' TO_DATE('+QuotedStr('31/12/'+IntToStr(piAno))+', ''DD/MM/YYYY'')) '+
            ' AND IDINFORME  IN ('+IntToStr(piIdInformeDedDepAbono)+','+IntToStr(piIdInformeDedDepAbonoMol)+')';

  Try
    ExecSQL(sSql);
  Except

  End;
end;


function TCtrlGeraFolhaFUNCEF.VerificaRegraIT(iIdPessoa, iRegraInss : integer): boolean;
Begin
   with TCMwwQuery.Create(Nil) do
     try
       DatabaseName := 'BaseDados';
       SQL.Text := 'SELECT D.IDPESSOA,' + #13#10 +
                   '       D.IDPROCJUD,' + #13#10 +
                   '       D.IDREGRA,' + #13#10 +
                   '       D.FLGATIVA,' + #13#10 +
                   '       R.NOMEREGRA,' + #13#10 +
                   '       D.IDRUBRICA,' + #13#10 +
                   '       P.DESCRPROVDESC AS DESCRICAO,' + #13#10 +
                   '       D.IDRUBRICAABONO,' + #13#10 +
                   '       P1.DESCRICAO' + #13#10 +
                   '  FROM REGRA R, DETPROCJUD D, PROVDESC P, PROVDESC P1' + #13#10 +
                   ' Where R.IDREGRA = D.IDREGRA' + #13#10 +
                   '   AND R.IDRegra = '+IntToStr(iRegraInss)+ #13#10 +
                   '   AND D.IDRUBRICA = P.IDPROVENTO' + #13#10 +
                   '   AND D.IDRUBRICAABONO = P1.IDPROVENTO(+)' + #13#10 +
                   '   AND D.IDPessoa = '+IntToStr(iIdPessoa);

       Open;
       Result := Not IsEmpty;
     finally
       Free;
     end;
end;


end.


