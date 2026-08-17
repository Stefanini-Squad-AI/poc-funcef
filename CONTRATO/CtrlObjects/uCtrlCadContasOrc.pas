// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina    : VerificaFormula, TestaCaracteres
Data      : 19/11/2003
Autor     : André Pontes
Pendencia : 10065
Descrição : Funções passam a tratar 'G' como indicador de Grupo orçamentário,
            além do 'C', indicador de Conta orçamentária
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : TrazContaOrc
Data      : 03/10/2003
Autor     : André Pontes
Pendencia : 10065
Descrição : Novo filtro por Centro de Responsabilidade. Retirados Centro de Custo, Ativ/Projeto,
            Plano e Patro
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : TrazContaOrc
Data      : 29/09/2003
Autor     : André Pontes
Pendencia : 10065
Descrição : Função criada para, a partir dos parâmetros da Conta, trazer apenas 1 Conta Orçamentária
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : até 19/09/2003
Autor     : André Pontes
Pendencia : 10065
Descrição : Reorganização de todo o código
---------------------------------------------------------------------------------------------------}

unit uCtrlCadContasOrc;

interface

uses
   DB, uDataBase, stdctrls, uCmControlObject, dbclient, sysutils, wwQuery, provider,
   uMidasUtil, udtmCadContasOrcamen, wwdbedit, uString, Mask, ComCtrls,
   uDbContasOrcamen, uDbSaldoOrcado, uDbCompContasOrcamen, uDbDataView, uCMTypes, classes;

type
   TCtrlCadContasOrc = class(TCmControlObject)

   protected

      procedure DoChangeDataBase; override;
      procedure OnCreateAppServer; override;


   private

      _dbContasOrcamen     : TdbContasOrcamen;
      _dbSaldoOrcado       : TdbSaldoOrcado;
      _dbCompContasOrcamen : TdbCompContasOrcamen;

      _dbDet               : TdbCompContasOrcamen;
      _dbDetCond           : TdbCompContasOrcamen;
      _dbDetContaOrc       : TdbCompContasOrcamen;
      _dbDetContaRea       : TdbCompContasOrcamen;
      _dbDetFluxo          : TdbCompContasOrcamen;
      _DbDataView          : TdbDataView;

      FidEmpresa           : Integer;
      FiPlanoOrc           : LongInt;
      FiPos                : LongInt;
      FiAbrePar            : LongInt;
      FiFechaPar           : LongInt;
      FiConsulta           : LongInt;
      FbInicioConta        : Boolean;
      FsCodContaOrc        : String;
      FsConta              : String;
      FMensagem            : TEdit;
      FConfirmado          : Boolean;
      FsMascaraGrupo       : String;
      FpgbStatus           : TProgressBar;

      //Somente usado no controle
      FCdsAuxContab        : TClientDataSet;

      FCds                 : TClientDataSet;
      FCdsAux              : TClientDataSet;
      FCdsCCusto           : TClientDataSet;
      FCdsCCustoConta      : TClientDataSet;
      FCdsCCustoFluxo      : TClientDataSet;
      FCdsCenRespConta     : TClientDataSet;
      FCdsCentroRespon     : TClientDataSet;
      FCdsContaCondFim     : TClientDataSet;
      FCdsContaCondIni     : TClientDataSet;
      FCdsContaCondRes     : TClientDataSet;
      FCdsContaContab      : TClientDataSet;
      FCdsContaContabil    : TClientDataSet;
      FCdsContasOrc        : TClientDataSet;
      FCdsContasRef        : TClientDataSet;
      FCdsDataView         : TClientDataSet;
      FCdsDet              : TClientDataSet;
      FCdsDetCond          : TClientDataSet;
      FCdsDetContaOrc      : TClientDataSet;
      FCdsDetContaRea      : TClientDataSet;
      FCdsDetFluxo         : TClientDataSet;
      FCdsGrupo            : TClientDataSet;
      FCdsGrupoAux         : TClientDataSet;
      FCdsMovOrcamento     : TClientDataSet;
      FCdsPatro            : TClientDataSet;
      FCdsPatroConta       : TClientDataSet;
      FCdsPlanoContabil    : TClientDataSet;
      FCdsPlanoPrev        : TClientDataSet;
      FCdsPlanoPrevConta   : TClientDataSet;
      FCdsTestaComposicao  : TClientDataSet;
      FCdsTipoRD           : TClientDataSet;
      FCdsTodoDet          : TClientDataSet;
      FCdsUnidNegoc        : TClientDataSet;
      FCdsUnidNegocConta   : TClientDataSet;

      function  PegaUltimoCaracter(edt           : TwwDBEdit;
                                    var pMensagem : String): char;

      procedure CdsCalcFields(DataSet: TDataSet);
      procedure CdsDetCondCalcFields(DataSet: TDataSet);

      procedure SetCdsAuxContab       (const Value: TClientDataSet);

      procedure SetCds                (const Value: TClientDataSet);
      procedure SetCdsAux             (const Value: TClientDataSet);
      procedure SetCdsCCusto          (const Value: TClientDataSet);
      procedure SetCdsCCustoConta     (const Value: TClientDataSet);
      procedure SetCdsCCustoFluxo     (const Value: TClientDataSet);
      procedure SetCdsCenRespConta    (const Value: TClientDataSet);
      procedure SetCdsCentroRespon    (const Value: TClientDataSet);
      procedure SetCdsContaCondFim    (const Value: TClientDataSet);
      procedure SetCdsContaCondIni    (const Value: TClientDataSet);
      procedure SetCdsContaCondRes    (const Value: TClientDataSet);
      procedure SetCdsContaContab     (const Value: TClientDataSet);
      procedure SetCdsContaContabil   (const Value: TClientDataSet);
      procedure SetCdsContasOrc       (const Value: TClientDataSet);
      procedure SetCdsContasRef       (const Value: TClientDataSet);
      procedure SetCdsDataView        (const Value: TClientDataSet);
      procedure SetCdsDet             (const Value: TClientDataSet);
      procedure SetCdsDetCond         (const Value: TClientDataSet);
      procedure SetCdsDetContaOrc     (const Value: TClientDataSet);
      procedure SetCdsDetContaRea     (const Value: TClientDataSet);
      procedure SetCdsDetFluxo        (const Value: TClientDataSet);
      procedure SetCdsGrupo           (const Value: TClientDataSet);
      procedure SetCdsGrupoAux        (const Value: TClientDataSet);
      procedure SetCdsMovOrcamento    (const Value: TClientDataSet);
      procedure SetCdsPatro           (const Value: TClientDataSet);
      procedure SetCdsPatroConta      (const Value: TClientDataSet);
      procedure SetCdsPlanoContabil   (const Value: TClientDataSet);
      procedure SetCdsPlanoPrev       (const Value: TClientDataSet);
      procedure SetCdsPlanoPrevConta  (const Value: TClientDataSet);
      procedure SetCdsTestaComposicao (const Value: TClientDataSet);
      procedure SetCdsTipoRD          (const Value: TClientDataSet);
      procedure SetCdsTodoDet         (const Value: TClientDataSet);
      procedure SetCdsUnidNegoc       (const Value: TClientDataSet);
      procedure SetCdsUnidNegocConta  (const Value: TClientDataSet);

      procedure pgbStatusAtualiza(pPos: Integer);


   public

      dtmCadContasOrcamen : TdtmCadContasOrcamen;

      Constructor Create; override;
      Destructor  Destroy;override;

      function AplicaOperacaoCadContasOrcDelete : Boolean;
      function AplicaOperacaoCadContasOrcGravar : Boolean;

      function Procurar(idContasOrcamen : String): OleVariant;

      function VerificaFormula(edt           : TwwDBEdit;
                               var pMensagem : String): Boolean;

      function  TestaCaracteres(edt           : TwwDBEdit;
                                sCaracter     : Char;
                                iPos          : Integer;
                                var pMensagem : String): Boolean;

      function VerificaLinhaGrid(Cds               : TClientDataSet;
                                 iTagChave         : Integer;
                                 iTagVazio         : Integer;
                                 sTabelaMensagem   : String;
                                 bPermiteChaveVazia: Boolean
                                ): Boolean;

      procedure FazerQryPrincipal;
      procedure SelecionaFilhos;

      procedure ProcessaConfirma;

      procedure AbreQueries;
      procedure CadastroDelete;
      procedure AbreQryMovOrcamento;
      procedure ValoresDefault;

      procedure CadastroConfirma(pdbeCodigoContaOrc : String;
                                 pmemSQLLines       : String);

      procedure ProcessaDetalheConfirma1(psePosIni1   : Real;
                                         psePosFim1   : Real;
                                         pedConteudo1 : String;
                                         prPerc       : Real);

      procedure ProcessaDetalheConfirma2(psePosIni2   : Real;
                                         psePosFim2   : Real;
                                         pedConteudo2 : String;
                                         prPerc       : Real);

      procedure AbreqryAuxContab;

      procedure btnImportaContabClick(var pdbeNomeContaOrc   : String;
                                      var pdbeCodigoContaOrc : String;
                                      var sConta             : String
                                     );

      procedure ProcessabtnTransfClick1;
      procedure ProcessabtnTransfClick2;

      // André Pontes - pendência 10065 - 29/09/2003
      function  TrazContaOrc(const IDPlanoOrcamen  : String;
                             const IDGrupoOrcamen  : String;
                             const IDEmpresaProp   : String;
                             const sCentroRespon   : String = '';
                             const sCentroCusto    : String = '';
                             const sUnidNegocio    : String = '';
                             const sPlano          : String = '';
                             const sPatro          : String = ''
                            ): OleVariant;
      // FIM André Pontes - pendência 10065 - 29/09/2003

      property Mensagem      : TEdit        read FMensagem      write FMensagem;
      property idEmpresa     : Integer      read FidEmpresa     write FidEmpresa;

      property Confirmado    : Boolean      read FConfirmado    write FConfirmado;
      property iPlanoOrc     : LongInt      read FiPlanoOrc     write FiPlanoOrc;
      property iPos          : LongInt      read FiPos          write FiPos;
      property iAbrePar      : LongInt      read FiAbrePar      write FiAbrePar;
      property iFechaPar     : LongInt      read FiFechaPar     write FiFechaPar;
      property iConsulta     : LongInt      read FiConsulta     write FiConsulta;
      property bInicioConta  : Boolean      read FbInicioConta  write FbInicioConta;
      property sCodContaOrc  : String       read FsCodContaOrc  write FsCodContaOrc;
      property sConta        : String       read FsConta        write FsConta;
      property sMascaraGrupo : String       read FsMascaraGrupo write FsMascaraGrupo;
      property pgbStatus     : TProgressBar read FpgbStatus     write FpgbStatus;

      // Somenteusado no controle
      property CdsAuxContab       : TClientDataSet read FCdsAuxContab       write SetCdsAuxContab;

      property Cds                : TClientDataSet read FCds                write SetCds;
      property CdsAux             : TClientDataSet read FCdsAux             write SetCdsAux;
      property CdsCCusto          : TClientDataSet read FCdsCCusto          write SetCdsCCusto;
      property CdsCCustoConta     : TClientDataSet read FCdsCCustoConta     write SetCdsCCustoConta;
      property CdsCCustoFluxo     : TClientDataSet read FCdsCCustoFluxo     write SetCdsCCustoFluxo;
      property CdsCenRespConta    : TClientDataSet read FCdsCenRespConta    write SetCdsCenRespConta;
      property CdsCentroRespon    : TClientDataSet read FCdsCentroRespon    write SetCdsCentroRespon;
      property CdsContaCondFim    : TClientDataSet read FCdsContaCondFim    write SetCdsContaCondFim;
      property CdsContaCondIni    : TClientDataSet read FCdsContaCondIni    write SetCdsContaCondIni;
      property CdsContaCondRes    : TClientDataSet read FCdsContaCondRes    write SetCdsContaCondRes;
      property CdsContaContab     : TClientDataSet read FCdsContaContab     write SetCdsContaContab;
      property CdsContaContabil   : TClientDataSet read FCdsContaContabil   write SetCdsContaContabil;
      property CdsContasOrc       : TClientDataSet read FCdsContasOrc       write SetCdsContasOrc;
      property CdsContasRef       : TClientDataSet read FCdsContasRef       write SetCdsContasRef;
      property CdsDataView        : TClientDataSet read FCdsDataView        write SetCdsDataView;
      property CdsDet             : TClientDataSet read FCdsDet             write SetCdsDet;
      property CdsDetCond         : TClientDataSet read FCdsDetCond         write SetCdsDetCond;
      property CdsDetContaOrc     : TClientDataSet read FCdsDetContaOrc     write SetCdsDetContaOrc;
      property CdsDetContaRea     : TClientDataSet read FCdsDetContaRea     write SetCdsDetContaRea;
      property CdsDetFluxo        : TClientDataSet read FCdsDetFluxo        write SetCdsDetFluxo;
      property CdsGrupo           : TClientDataSet read FCdsGrupo           write SetCdsGrupo;
      property CdsGrupoAux        : TClientDataSet read FCdsGrupoAux        write SetCdsGrupoAux;
      property CdsMovOrcamento    : TClientDataSet read FCdsMovOrcamento    write SetCdsMovOrcamento;
      property CdsPatro           : TClientDataSet read FCdsPatro           write SetCdsPatro;
      property CdsPatroConta      : TClientDataSet read FCdsPatroConta      write SetCdsPatroConta;
      property CdsPlanoContabil   : TClientDataSet read FCdsPlanoContabil   write SetCdsPlanoContabil;
      property CdsPlanoPrev       : TClientDataSet read FCdsPlanoPrev       write SetCdsPlanoPrev;
      property CdsPlanoPrevConta  : TClientDataSet read FCdsPlanoPrevConta  write SetCdsPlanoPrevConta;
      property CdsTestaComposicao : TClientDataSet read FCdsTestaComposicao write SetCdsTestaComposicao;
      property CdsTipoRD          : TClientDataSet read FCdsTipoRD          write SetCdsTipoRD;
      property CdsTodoDet         : TClientDataSet read FCdsTodoDet         write SetCdsTodoDet;
      property CdsUnidNegoc       : TClientDataSet read FCdsUnidNegoc       write SetCdsUnidNegoc;
      property CdsUnidNegocConta  : TClientDataSet read FCdsUnidNegocConta  write SetCdsUnidNegocConta;

   end;



implementation



procedure TCtrlCadContasOrc.OnCreateAppServer;
begin
   inherited;

   Cds                := TClientDataSet.Create(nil);
   CdsAux             := TClientDataSet.Create(nil);
   CdsCCusto          := TClientDataSet.Create(nil);
   CdsCCustoConta     := TClientDataSet.Create(nil);
   CdsCCustoFluxo     := TClientDataSet.Create(nil);
   CdsCenRespConta    := TClientDataSet.Create(nil);
   CdsCentroRespon    := TClientDataSet.Create(nil);
   CdsContaCondFim    := TClientDataSet.Create(nil);
   CdsContaCondIni    := TClientDataSet.Create(nil);
   CdsContaCondRes    := TClientDataSet.Create(nil);
   CdsContaContab     := TClientDataSet.Create(nil);
   CdsContaContabil   := TClientDataSet.Create(nil);
   CdsContasOrc       := TClientDataSet.Create(nil);
   CdsContasRef       := TClientDataSet.Create(nil);
   CdsDataView        := TClientDataSet.Create(nil);
   CdsDet             := TClientDataSet.Create(nil);
   CdsDetCond         := TClientDataSet.Create(nil);
   CdsDetContaOrc     := TClientDataSet.Create(nil);
   CdsDetContaRea     := TClientDataSet.Create(nil);
   CdsDetFluxo        := TClientDataSet.Create(nil);
   CdsGrupo           := TClientDataSet.Create(nil);
   CdsGrupoAux        := TClientDataSet.Create(nil);
   CdsMovOrcamento    := TClientDataSet.Create(nil);
   CdsPatro           := TClientDataSet.Create(nil);
   CdsPatroConta      := TClientDataSet.Create(nil);
   CdsPlanoContabil   := TClientDataSet.Create(nil);
   CdsPlanoPrev       := TClientDataSet.Create(nil);
   CdsPlanoPrevConta  := TClientDataSet.Create(nil);
   CdsTestaComposicao := TClientDataSet.Create(nil);
   CdsTipoRD          := TClientDataSet.Create(nil);
   CdsTodoDet         := TClientDataSet.Create(nil);
   CdsUnidNegoc       := TClientDataSet.Create(nil);
   CdsUnidNegocConta  := TClientDataSet.Create(nil);

   pgbStatus          := TProgressBar.Create(nil);
end;



procedure TCtrlCadContasOrc.DoChangeDataBase;
begin
   inherited;

   _dbContasOrcamen.DatabaseName     := DataBaseName;
   _dbSaldoOrcado.DatabaseName       := DataBaseName;
   _dbCompContasOrcamen.DatabaseName := DataBaseName;
   _dbDet.DatabaseName               := DataBaseName;
   _dbDetCond.DatabaseName           := DataBaseName;
   _dbDetContaOrc.DatabaseName       := DataBaseName;
   _dbDetContaRea.DatabaseName       := DataBaseName;
   _dbDetFluxo.DatabaseName          := DataBaseName;
   _DbDataView.DatabaseName          := DataBaseName;
end;



constructor TCtrlCadContasOrc.Create;
begin
   inherited;

   dtmCadContasOrcamen := TdtmCadContasOrcamen.Create(nil);

   _dbContasOrcamen     := TDbContasOrcamen.Create(Self);
   _dbSaldoOrcado       := TdbSaldoOrcado.Create(Self);
   _dbCompContasOrcamen := TdbCompContasOrcamen.Create(Self);
   _dbDet               := TdbCompContasOrcamen.Create(Self);
   _dbDetCond           := TdbCompContasOrcamen.Create(Self);
   _dbDetContaOrc       := TdbCompContasOrcamen.Create(Self);
   _dbDetContaRea       := TdbCompContasOrcamen.Create(Self);
   _dbDetFluxo          := TdbCompContasOrcamen.Create(Self);
   _DbDataView          := TdbDataView.Create(Self);

   // Cds somente usados no controle
   FCdsAuxContab := TClientDataSet.Create(nil);
end;



destructor TCtrlCadContasOrc.Destroy;
begin
   inherited;

   _DbContasOrcamen.Free;
   _dbSaldoOrcado.Free;
   _dbCompContasOrcamen.Free;
   _dbDet.Free;
   _dbDetCond.Free;
   _dbDetContaOrc.Free;
   _dbDetContaRea.Free;
   _dbDetFluxo.Free;
   _DbDataView.Free;

   FreeCds([FCdsAuxContab]);

   if (isAppServer) then
   begin
      FreeCds([FCds,                FCdsAux,           FCdsCCusto,       FCdsCCustoConta,
               FCdsCCustoFluxo,     FCdsCenRespConta,  FCdsCentroRespon, FCdsContaCondFim,
               FCdsContaCondIni,    FCdsContaCondRes,  FCdsContaContab,  FCdsContaContabil,
               FCdsContasOrc,       FCdsContasRef,     FCdsDataView,     FCdsDet,
               FCdsDetCond,         FCdsDetContaOrc,   FCdsDetContaRea,  FCdsDetFluxo,
               FCdsGrupo,           FCdsGrupoAux,      FCdsMovOrcamento, FCdsPatro,
               FCdsPatroConta,      FCdsPlanoContabil, FCdsPlanoPrev,    FCdsPlanoPrevConta,
               FCdsTestaComposicao, FCdsTipoRD,        FCdsTodoDet,      FCdsUnidNegoc,
               FCdsUnidNegocConta]);

      pgbStatus.Free;
   end;
end;



// André Pontes - pendência 10065 - 29/09/2003
function  TCtrlCadContasOrc.TrazContaOrc(const IDPlanoOrcamen  : String;
                                         const IDGrupoOrcamen  : String;
                                         const IDEmpresaProp   : String;
                                         const sCentroRespon   : String = '';
                                         const sCentroCusto    : String = '';
                                         const sUnidNegocio    : String = '';
                                         const sPlano          : String = '';
                                         const sPatro          : String = ''
                                       ): OleVariant;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT '                                                      + #13 +
   '   MIN(COR.IDCONTAORCAMEN) AS IDCONTAORCAMEN '                + #13 +
   'FROM '                                                        + #13 +
   '   CONTASORCAMEN COR '                                        + #13 +
   'WHERE '                                                       + #13 +
   '       COR.IDPLANOORCAMEN    = ' + IDPlanoOrcamen             + #13 +
   '   AND COR.IDGRUPOORCAMEN    = ' + IDGrupoOrcamen             + #13 +
   '   AND COR.IDPESSOA          = ' + IDEmpresaProp;

   if sCentroRespon <> '' then sSQL := sSQL + #13 +
   '   AND COR.CODCENTRORESPON   = ' + QuotedStr(sCentroRespon);

   if sCentroCusto <> '' then sSQL := sSQL + #13 +
   '   AND COR.CODCENTROCUSTO    = ' + QuotedStr(sCentroCusto)    + #13 +
   '   AND COR.IDEMPRESA         = ' + IDEmpresaProp;

   if sUnidNegocio <> '' then sSQL := sSQL + #13 +
   '   AND COR.UNIDNEGOC         = ' + sUnidNegocio;

   if sPlano <> '' then sSQL := sSQL + #13 +
   '   AND COR.IDPLANOPREV       = ' + sPlano;

   if sPatro <> '' then sSQL := sSQL + #13 +
   '   AND COR.IDPATRO    = ' + sPatro;

   Result := GetDataPacket(sSQL);
end;
// FIM André Pontes - pendência 10065 - 29/09/2003



function TCtrlCadContasOrc.Procurar(idContasOrcamen : String): OleVariant;
begin
   _DbContasOrcamen.IdContaOrcamen.AsString := idContasOrcamen;
   Result := GetDataPacket(_DbContasOrcamen.SSqlSelect);
end;



procedure TCtrlCadContasOrc.FazerQryPrincipal;
begin
   with dtmCadContasOrcamen.Qry do
   begin
      Prepare;
      ParamByName('IDPLANOORCAMEN').AsInteger := iPlanoOrc;
      ParamByName('IDCONTAORCAMEN').AsString  := sCodContaOrc;

      Cds.Data := Data;
   end;
end;



procedure TCtrlCadContasOrc.SelecionaFilhos;
begin
   //Seleciona os registros das Tabelas Filhas

   //Consulta do Banco de Dados de Arquivos Genéricos
   with dtmCadContasOrcamen.qryDataView do
   begin
      Prepare;
      ParamByName('IDDATAVIEW').asInteger := iConsulta;
      CdsDataView.Data := Data;
   end;

   //Composição de Contas Orçamentárias de Contabilidade
   with dtmCadContasOrcamen.qryDet do
   begin
      Prepare;
      ParamByName('IDPLANOORCAMEN').AsInteger := iPlanoOrc;
      ParamByName('IDCONTAORCAMEN').AsString  := sCodContaOrc;
      CdsDet.Data := Data;
   end;

   //Composição de Contas Orçamentárias Orçadas
   with dtmCadContasOrcamen.qryDetContaOrc do
   begin
      Prepare;
      ParamByName('IDPLANOORCAMEN').AsInteger := iPlanoOrc;
      ParamByName('IDCONTAORCAMEN').AsString  := sCodContaOrc;
      CdsDetContaOrc.Data := Data;
   end;

   //Composição de Contas Orçamentárias Realizadas
   with dtmCadContasOrcamen.qryDetContaRea do
   begin
      Prepare;
      ParamByName('IDPLANOORCAMEN').AsInteger := iPlanoOrc;
      ParamByName('IDCONTAORCAMEN').AsString  := sCodContaOrc;
      CdsDetContaRea.Data := Data;
   end;

   //Composição de Contas Orçamentárias Condicionais
   with dtmCadContasOrcamen.qryDetCond do
   begin
      SQL.Clear;
      SQL.Add('SELECT ' + QuotedStr(StringOfChar(' ', 130)) + ' AS CONDDESCRICAO, ');
      SQL.Add('IDCONTACONDINI, IDCONTACONDFIM, IDCONTACONDRES, CONDICAO,');
      SQL.Add('TIPOCONDINI, TIPOCONDRES, VLRCONDINI, VLRCONDRES, ');
      SQL.Add('IDCONTAORCAMEN, IDPLANOORCAMEN, IDCOMPCONTASORC');
      SQL.Add('FROM COMPCONTASORCAMEN ');
      SQL.Add('WHERE IDPLANOORCAMEN = ' + IntToStr(iPlanoOrc));
      SQL.Add(' AND IDCONTAORCAMEN = ''' + sCodContaOrc + '''');
      SQL.Add(' AND IDCONTACONDINI IS NOT NULL');
      Prepare;

      CdsDetCond.Data := Data;
   end;

   //Composição de Contas Orçamentárias Fluxo de Caixa
   with dtmCadContasOrcamen.qryDetFluxo do
   begin
      Prepare;
      ParamByName('IDPLANOORCAMEN').AsInteger := iPlanoOrc;
      ParamByName('IDCONTAORCAMEN').AsString  := sCodContaOrc;
      CdsDetFluxo.Data := Data;
   end;
end;



function TCtrlCadContasOrc.VerificaFormula(edt           : TwwDBEdit;
                                           var pMensagem : String): Boolean;
var
   i, j, k, iInicio, iFim, iTamanho : Integer;
   sTeste : string;
begin
   //Faz a Verificação Final da fórmula
   Result := true;

   sTeste := edt.text;

   if (iAbrePar <> iFechaPar) then
   begin
      pMensagem   := 'Parênteses não balanceados. Verifique.';
      Result      := False;
   end;

   if PegaUltimoCaracter(edt, pMensagem) in ['.', '+', '-', '*', '/', '^', 'C', 'G', '('] then
   begin
      pMensagem   := 'Fórmula terminada incorretamente. Verifique.';
      Result      := False;
   end;

   //Pega as Contas presentes na fórmula (C) e as transforma no valor 1
   //para serem verificadas pelo parser

   iTamanho := length(sTeste);

   //Faz a varredura das contas e as substitui
   for k := 1 to length(sTeste) do
   begin
      for i := 1 to iTamanho do
      begin
         if sTeste[i] in ['C', 'G'] then
         begin
            iInicio := i;
            for j := (i + 1) to iTamanho do
            begin
               if not(sTeste[j] in ['0'..'9', 'C', 'G']) then
               begin
                  iFim := j;

                  delete(sTeste, iInicio, iFim-iInicio);
                  insert('1', sTeste, iInicio);
                  iTamanho := length(sTeste);
                  Break;
               end;  // if not(sTeste[j] in ['0'..'9', 'C'])
            end;  // for j := (i + 1) to iTamanho
            Break;
         end;  // if sTeste[i] in ['C']
      end;  // for i := 1 to iTamanho
   end;  // for k := 1 to length(sTeste)

   // Caso haja uma conta no final da fórmula, faz a varredura dela também
   for i := 1 to length(sTeste) do
   begin
      if sTeste[i] in ['C', 'G'] then
      begin
         iInicio := i;

         delete(sTeste, iInicio, length(sTeste));
         insert('1', sTeste, iInicio);
      end;  // if sTeste[i] in ['C']
   end;  // for i := 1 to length(sTeste)

   try
      dtmCadContasOrcamen.Parser.expression := sTeste;
   except
      pMensagem := 'Existem erros na Fórmula. Verifique.';
      result := False;
   end;
end;



function TCtrlCadContasOrc.PegaUltimoCaracter(    edt       : TwwDBEdit;
                                              var pMensagem : String
                                             ): Char;
var
   sTexto   : String;
   iTamanho : Integer;
begin
   // Retorna qual é o último caracter da caixa de texto
   sTexto   := edt.text;
   iTamanho := length(sTexto);
   if iTamanho <> 0 then Result := sTexto[iTamanho] else Result := #0;
end;



function TCtrlCadContasOrc.TestaCaracteres(    edt       : TwwDBEdit;
                                               sCaracter : Char;
                                               iPos      : Integer;
                                           var pMensagem : String): Boolean;
var
   sSQL        : String;
   sContaAux   : String;
begin
   Result := true;

   // Verifica se o caracter digitado é válido
   if not(sCaracter in ['0'..'9', '+', '-', '*', '/', '^', 'C', 'G', '(', ')', '.']) then
   begin
      pMensagem   := 'Este caracter não pode ser usado na fórmula.';
      Result      := False;
      Exit;
   end;

   //Verifica se o primeiro caracter não é um operador
   if (iPos = 1) and not(sCaracter in ['0'..'9', 'C', 'G', '(', ')']) then
   begin
      pMensagem   := 'Este caracter não pode ser usado no início da fórmula.';
      Result      := False;
      Exit;
   end;

   // Verifica se o caracter após o ")" é válido
   if (iPos > 1) and (sCaracter in ['0'..'9', '.', 'C', 'G']) then
   begin
      if PegaUltimoCaracter(edt, pMensagem) in [')'] then
      begin
         pMensagem   := 'Este caracter não pode ser usado na fórmula nesta posição.';
         Result      := False;
         Exit;
      end;
   end;

   //Verifica se o caracter antes do "(" é válido
   if (iPos > 1) and (sCaracter in ['(']) then
   begin
      if PegaUltimoCaracter(edt, pMensagem) in ['0'..'9', '.', 'C', 'G'] then
      begin
         pMensagem   := 'Este caracter não pode ser usado na fórmula nesta posição.';
         Result      := False;
         Exit;
      end;
   end;

   //Verifica se não estão sendo digitados dois operadores iguais (ex.: 66++7)
   if (iPos > 1) and not(sCaracter in ['0'..'9', '(', ')']) then
   begin
      if PegaUltimoCaracter(edt, pMensagem) = sCaracter then
      begin
         pMensagem   := 'Este caracter não pode ser usado na fórmula nesta posição.';
         Result      := False;
         Exit;
      end;
   end;

   //Verifica se o operador está numa posição correta
   if (iPos > 1) and not(sCaracter in ['0'..'9', 'C', 'G', '(', ')']) then
   begin
      if (PegaUltimoCaracter(edt, pMensagem)) in ['.', '+', '-', '*', '/', '^', 'C', 'G'] then
      begin
         pMensagem   := 'Este caracter não pode ser usado na fórmula nesta posição.';
         Result      := False;
         Exit;
      end;
   end;

   //Condições indicadoras de que a digitação corrente é de uma conta Orçamentária
   if bInicioConta = True then if not(sCaracter in ['0'..'9']) then bInicioConta := False;

   // ----------------------------------------------------------------------------------------------
   //    Verificação de Conta/Grupo
   // ----------------------------------------------------------------------------------------------
   if sCaracter in ['C'] then
   begin
      bInicioConta   := True;
      sConta         := '';
   end;

   if bInicioConta = True then sConta := sConta + sCaracter;

   //Verifica se a conta Orçamentária digitada é válida
   if (iPos = 1) or (sCaracter in ['.', '+', '-', '*', '/', '^', 'C', 'G', '(', ')']) then
   begin
      if sConta <> 'C' then
      begin
         sContaAux := copy(sConta, 2, (length(sConta) - 1));

         sSQL :=
         'SELECT '                                          + #13 +
         '   IDCONTAORCAMEN '                               + #13 +
         'FROM '                                            + #13 +
         '   CONTASORCAMEN '                                + #13 +
         'WHERE '                                           + #13 +
         '       IDPLANOORCAMEN = ' + IntToStr(iPlanoOrc)   + #13 +
         '   AND IDCONTAORCAMEN = ' + QuotedStr(sContaAux);

         with dtmCadContasOrcamen.qryAux do
         begin
            SQL.Clear;
            SQL.Text := sSQL;
            Prepare;
            CdsAux.Data := Data;
         end;

         bInicioConta := False;

         if CdsAux.IsEmpty then
         begin
            pMensagem   := 'Conta Orçamentária não cadastrada.';
            Result      := False;
            sConta      := '';
            Exit;
         end;
      end;
   end;

   // ----------------------------------------------------------------------------------------------

   if sCaracter in ['G'] then
   begin
      bInicioConta   := True;
      sConta         := '';
   end;

   if bInicioConta = True then sConta := sConta + sCaracter;

   //Verifica se a conta Orçamentária digitada é válida
   if (iPos = 1) or (sCaracter in ['.', '+', '-', '*', '/', '^', 'C', 'G', '(', ')']) then
   begin
      if sConta <> 'C' then
      begin
         sContaAux := copy(sConta, 2, (length(sConta) - 1));

         sSQL :=
         'SELECT '                                          + #13 +
         '   IDGRUPOORCAMEN '                               + #13 +
         'FROM '                                            + #13 +
         '   GRUPOORCAMEN '                                 + #13 +
         'WHERE '                                           + #13 +
         '       IDPLANOORCAMEN = ' + IntToStr(iPlanoOrc)   + #13 +
         '   AND CODGRUPOORC    = ' + QuotedStr(sContaAux);

         with dtmCadContasOrcamen.qryAux do
         begin
            SQL.Clear;
            SQL.Text := sSQL;
            Prepare;
            CdsAux.Data := Data;
         end;

         bInicioConta := False;

         if CdsAux.IsEmpty then
         begin
            pMensagem   := 'Grupo Orçamentário não cadastrado.';
            Result      := False;
            sConta      := '';
            Exit;
         end;
      end;
   end;
   // ----------------------------------------------------------------------------------------------
   //    FIM Verificação de Conta/Grupo
   // ----------------------------------------------------------------------------------------------

   //Verificação de balanceamento de parêntesis
   if sCaracter = '(' then iAbrePar  := iAbrePar  + 1;
   if sCaracter = ')' then iFechaPar := iFechaPar + 1;
end;



procedure TCtrlCadContasOrc.ProcessaConfirma;
begin
   pgbStatus.Position   := 0;
   pgbStatus.Min        := 0;
   pgbStatus.Max        := 5;

   with dtmCadContasOrcamen do
   begin
      if Cds.FieldByName('CODCENTROCUSTO').isNull then
      begin
         Cds.FieldByName('IDEMPRESA').Clear;
      end
      else
      begin
         Cds.FieldByName('IDEMPRESA').AsInteger := idEmpresa;
      end;

      CdsDet.First;
      while not(CdsDet.EOF) do
      begin

        // 23/01/2004 - Marchetti - Pendencia 15549

{         CdsDet.Edit;

         if CdsDet.FieldByName('IDCOMPCONTASORC').AsInteger = 0 then
            CdsDet.FieldByName('IDCOMPCONTASORC').AsInteger := GetSequence('COMPCONTASORCAMEN');

         if CdsDet.FieldByName('IDCONTAORCAMEN').AsString = '' then
            CdsDet.FieldByName('IDCONTAORCAMEN').AsString := Cds.FieldByName('IDCONTAORCAMEN').AsString;

         if CdsDet.FieldByName('IDPLANOORCAMEN').AsInteger = 0 then
            CdsDet.FieldByName('IDPLANOORCAMEN').AsInteger := Cds.FieldByName('IDPLANOORCAMEN').AsInteger;

         CdsDet.Post;
}
        // Fim Pendencia 15549 - Marchetti
         with QryTestaComposicao do
         begin
            SQL.Clear;
            SQL.Add('SELECT IDCONTAORCAMEN FROM COMPCONTASORCAMEN ');
            SQL.Add('WHERE (IDCONTAORCAMEN <> '''+Cds.FieldByName('IDCONTAORCAMEN').AsString+''')');
            SQL.Add('  AND (IDPLANOORCAMEN = '+Cds.FieldByName('IDPLANOORCAMEN').AsString+')');
            SQL.Add('  AND (PLACONTA = '''+Espaco(CdsDet.FieldByName('PLACONTA').AsString, 18)+''')');
            SQL.Add('  AND (PLANO = '+ CdsDet.FieldByName('PLANO').AsString+')');

            if not(CdsDet.FieldByName('IDPLANOPREV').isNull) then
               SQL.Add('  AND (IDPLANOPREV = '+ CdsDet.FieldByName('IDPLANOPREV').AsString + ')')
            else
               SQL.Add('  AND (IDPLANOPREV IS NULL)');

            if not(CdsDet.FieldByName('IDPATRO').isNull) then
               SQL.Add('  AND (IDPATRO = ' + CdsDet.FieldByName('IDPATRO').AsString+')')
            else
               SQL.Add('  AND (IDPATRO IS NULL)');

            if not(CdsDet.FieldByName('UNIDNEGOC').isNull) then
            begin
               SQL.Add('  AND (UNIDNEGOC = '+CdsDet.FieldByName('UNIDNEGOC').AsString+')');
               SQL.Add('  AND (IDPESSOA = '+CdsDet.FieldByName('IDPESSOA').AsString+')');
            end
            else
            begin
               SQL.Add('  AND (UNIDNEGOC IS NULL)');
            end;

            if not(CdsDet.FieldByName('CODCENTROCUSTO').isNull) then
            begin
               SQL.Add('  AND (CODCENTROCUSTO = '''+ CdsDet.FieldByName('CODCENTROCUSTO').AsString + ''')');
               SQL.Add('  AND (IDEMPRESA = ' + CdsDet.FieldByName('IDEMPRESA').AsString + ')');
            end else begin
               SQL.Add('  AND (CODCENTROCUSTO IS NULL)');
            end;
            CdsTestaComposicao.Data := Data;

            if not(CdsTestaComposicao.isEmpty) then
            begin
               // Ao atualizar a propriedade 'Mensagem', é chamado um método na tela principal
               // e esta atualiza a propriedade 'Confirmado'
               Mensagem.Text := 'Existe Composição de Contabilidade Repetida com a Conta Orçamentária ' +
                                CdsTestaComposicao.FieldByName('IDCONTAORCAMEN').AsString + '. Confirma?';

               if not(Confirmado) then Exit;
            end;
         end;

         CdsDet.Next;
      end;
     //

     pgbStatusAtualiza(2);

     CdsDetContaOrc.First;
     while (not CdsDetContaOrc.EOF) do begin
        CdsDetContaOrc.Edit;

        if CdsDetContaOrc.FieldByName('IDCOMPCONTASORC').isNull then
           CdsDetContaOrc.FieldByName('IDCOMPCONTASORC').AsInteger := GetSequence('COMPCONTASORCAMEN');

        if CdsDetContaOrc.FieldByName('IDCONTAORCAMEN').isNull then
           CdsDetContaOrc.FieldByName('IDCONTAORCAMEN').AsString := Cds.FieldByName('IDCONTAORCAMEN').AsString;

        if CdsDetContaOrc.FieldByName('IDPLANOORCAMEN').isNull then
           CdsDetContaOrc.FieldByName('IDPLANOORCAMEN').AsInteger := Cds.FieldByName('IDPLANOORCAMEN').AsInteger;

        CdsDetContaOrc.Post;
        CdsDetContaOrc.Next;
     end;

     //
     pgbStatusAtualiza(3);
     CdsDetFluxo.First;
     while (not CdsDetFluxo.EOF) do begin
        CdsDetFluxo.Edit;

        if CdsDetFluxo.FieldByName('IDCOMPCONTASORC').AsInteger = 0 then
           CdsDetFluxo.FieldByName('IDCOMPCONTASORC').AsInteger := GetSequence('COMPCONTASORCAMEN');

        if CdsDetFluxo.FieldByName('IDCONTAORCAMEN').AsString = '' then
           CdsDetFluxo.FieldByName('IDCONTAORCAMEN').AsString := Cds.FieldByName('IDCONTAORCAMEN').AsString;

        if CdsDetFluxo.FieldByName('IDPLANOORCAMEN').AsInteger = 0 then
           CdsDetFluxo.FieldByName('IDPLANOORCAMEN').AsInteger := Cds.FieldByName('IDPLANOORCAMEN').AsInteger;

        CdsDetFluxo.Post;
        //
        with QryTestaComposicao do begin

           SQL.Clear;
           SQL.Add('SELECT IDCONTAORCAMEN FROM COMPCONTASORCAMEN ');
           SQL.Add('WHERE (IDCONTAORCAMEN <> '''+Cds.FieldByName('IDCONTAORCAMEN').AsString+''')');
           SQL.Add('  AND (IDPLANOORCAMEN = '+Cds.FieldByName('IDPLANOORCAMEN').AsString+')');
           SQL.Add('  AND (CODTIPRECDES = '''+Espaco(CdsDetFluxo.FieldByName('CODTIPRECDES').AsString,15)+''')');
           SQL.Add('  AND (RECPAG = '''+CdsDetFluxo.FieldByName('RECPAG').AsString+''')');
           SQL.Add('  AND (IDPESSOA = '+CdsDetFluxo.FieldByName('IDPESSOA').AsString+')');
           if not CdsDetFluxo.FieldByName('IDPLANOPREV').isNull then
              SQL.Add('  AND (IDPLANOPREV = '+CdsDetFluxo.FieldByName('IDPLANOPREV').AsString+')')
           else
              SQL.Add('  AND (IDPLANOPREV IS NULL)');
           if not CdsDetFluxo.FieldByName('IDPATRO').isNull then
              SQL.Add('  AND (IDPATRO = '+CdsDetFluxo.FieldByName('IDPATRO').AsString+')')
           else
              SQL.Add('  AND (IDPATRO IS NULL)');
           if not CdsDetFluxo.FieldByName('UNIDNEGOC').isNull then
              SQL.Add('  AND (UNIDNEGOC = '+CdsDetFluxo.FieldByName('UNIDNEGOC').AsString+')')
           else
              SQL.Add('  AND (UNIDNEGOC IS NULL)');
           if not CdsDetFluxo.FieldByName('CODCENTRORESPON').isNull then
              SQL.Add('  AND (CODCENTRORESPON = '''+CdsDetFluxo.FieldByName('CODCENTRORESPON').AsString+''')')
           else
              SQL.Add('  AND (CODCENTRORESPON IS NULL)');
           if not CdsDetFluxo.FieldByName('CODCENTROCUSTO').isNull then begin
              SQL.Add('  AND (CODCENTROCUSTO = '''+CdsDetFluxo.FieldByName('CODCENTROCUSTO').AsString+''')');
              SQL.Add('  AND (IDEMPRESA = '+CdsDetFluxo.FieldByName('IDEMPRESA').AsString+')');
           end else begin
              SQL.Add('  AND (CODCENTROCUSTO IS NULL)');
           end;
           CdsTestaComposicao.Data := Data;

            if not(CdsTestaComposicao.isEmpty) then
            begin
               // Ao atualizar a propriedade 'Mensagem', é chamado um método na tela principal
               // e esta atualiza a propriedade 'Confirmado'
               Mensagem.Text := 'Existe Composição de Fluxo de Caixa Repetida com a Conta Orçamentária ' +
                                CdsTestaComposicao.FieldByName('IDCONTAORCAMEN').AsString +
                                '. Confirma?';

               if not(Confirmado) then Exit;
            end;
         end;
         CdsDetFluxo.Next;
      end;

      pgbStatusAtualiza(4);

      CdsDetContaRea.First;
      while not(CdsDetContaRea.EOF) do
      begin
         CdsDetContaRea.Edit;

         if CdsDetContaRea.FieldByName('IDCOMPCONTASORC').isNull then
            CdsDetContaRea.FieldByName('IDCOMPCONTASORC').AsInteger := GetSequence('COMPCONTASORCAMEN');

         if CdsDetContaRea.FieldByName('IDCONTAORCAMEN').isNull  then
            CdsDetContaRea.FieldByName('IDCONTAORCAMEN').AsString := Cds.FieldByName('IDCONTAORCAMEN').AsString;

         if CdsDetContaRea.FieldByName('IDPLANOORCAMEN').isNull  then
            CdsDetContaRea.FieldByName('IDPLANOORCAMEN').AsInteger := Cds.FieldByName('IDPLANOORCAMEN').AsInteger;

         CdsDetContaRea.Post;
         CdsDetContaRea.Next;
      end;

      pgbStatusAtualiza(5);
      CdsDetCond.First;

      while not(CdsDetCond.EOF) do
      begin
         CdsDetCond.Edit;

         if CdsDetCond.FieldByName('IDCOMPCONTASORC').AsInteger < 1 then
            CdsDetCond.FieldByName('IDCOMPCONTASORC').AsInteger := GetSequence('COMPCONTASORCAMEN');

         if CdsDetCond.FieldByName('IDCONTAORCAMEN').AsString = '' then
            CdsDetCond.FieldByName('IDCONTAORCAMEN').AsString := Cds.FieldByName('IDCONTAORCAMEN').AsString;

         if CdsDetCond.FieldByName('IDPLANOORCAMEN').AsInteger < 1 then
            CdsDetCond.FieldByName('IDPLANOORCAMEN').AsInteger := Cds.FieldByName('IDPLANOORCAMEN').AsInteger;

         CdsDetCond.Post;
         CdsDetCond.Next;
      end;
   end;
end;



procedure TCtrlCadContasOrc.AbreQueries;
begin
   pgbStatusAtualiza(3);

   with dtmCadContasOrcamen.qryAuxContab do
   begin
      Prepare;
      ParamByName('IDPESSOA').asInteger := idEmpresa;
      CdsAuxContab.Data := Data;
   end;

   //Seleciona os Grupos Orçamentários
   pgbStatusAtualiza(4);
   with dtmCadContasOrcamen.qryGrupo do
   begin
      Prepare;
      ParamByName('CODGRUPOORC').AsString := '';
      CdsGrupo.Data := Data;
   end;

   //Seleciona os Centros de Responsabilidade das Contas Orçamentários
   pgbStatusAtualiza(5);
   with dtmCadContasOrcamen.qryCenRespConta do
   begin
      Prepare;
      ParamByName('IDPESSOA').asInteger := idEmpresa;
      CdsCenRespConta.Data := Data;
   end;

   //Seleciona as Contas Orçamentários
   pgbStatusAtualiza(6);
   with dtmCadContasOrcamen.qryContasOrc do
   begin
      Prepare;
      ParamByName('IDPLANOORCAMEN').asInteger := iPlanoOrc;
      // CdsContasOrc.Data := Data;     // Comentado para melhorar o tempo de carga da tela
   end;

   //Seleciona as Contas Orçamentárias das Condições
   pgbStatusAtualiza(7);
   with dtmCadContasOrcamen.qryContaCondIni do
   begin
      Prepare;
      ParamByName('IDPLANOORCAMEN').asInteger := iPlanoOrc;
      //CdsContaCondIni.Data := Data;   // Comentado para melhorar o tempo de carga da tela
   end;

   pgbStatusAtualiza(8);
   with dtmCadContasOrcamen.qryContaCondFim do
   begin
      Prepare;
      ParamByName('IDPLANOORCAMEN').asInteger := iPlanoOrc;
      //CdsContaCondFim.Data := Data;   // Comentado para melhorar o tempo de carga da tela
   end;

   pgbStatusAtualiza(9);
   with dtmCadContasOrcamen.qryContaCondRes do
   begin
      Prepare;
      ParamByName('IDPLANOORCAMEN').asInteger := iPlanoOrc;
      //CdsContaCondRes.Data := Data;   // Comentado para melhorar o tempo de carga da tela
   end;

   //Seleciona Tipos de Recebimento
   pgbStatusAtualiza(10);
   with dtmCadContasOrcamen.qryTipoRD do
   begin
      Prepare;
      ParamByName('IDPESSOA').asInteger := idEmpresa;
      CdsTipoRD.Data := Data;
   end;

   //Seleciona Centros de Responsabilidade
   pgbStatusAtualiza(11);
   with dtmCadContasOrcamen.qryCentroRespon do
   begin
      Prepare;
      ParamByName('IDPESSOA').asInteger := idEmpresa;
      CdsCentroRespon.Data := Data;
   end;

   //Seleciona Unidades de Negócio
   pgbStatusAtualiza(12);
   with dtmCadContasOrcamen.qryUnidNegoc do
   begin
      Prepare;
      ParamByName('IDPESSOA').asInteger := idEmpresa;
      CdsUnidNegoc.Data := Data
   end;

   //Seleciona Unidades de Negócio
   pgbStatusAtualiza(13);
   with dtmCadContasOrcamen.qryUnidNegocConta do
   begin
      Prepare;
      ParamByName('IDPESSOA').asInteger := idEmpresa;
      CdsUnidNegocConta.Data := Data;
   end;

   //Seleciona os Centros de Custo
   pgbStatusAtualiza(14);

   with dtmCadContasOrcamen.qryCCusto do
   begin
      Prepare;
      ParamByName('IDEMPRESA').asInteger := IdEmpresa;
      CdsCCusto.Data := Data;
   end;

   //Seleciona os Centros de Custo
   pgbStatusAtualiza(15);
   with dtmCadContasOrcamen.qryCCustoConta do
   begin
      Prepare;
      ParamByName('IDEMPRESA').asInteger := IdEmpresa;
      CdsCCustoConta.Data := Data;
   end;

   //Seleciona os Centros de Custo do Fluxo de Caixa
   pgbStatusAtualiza(16);
   with dtmCadContasOrcamen.qryCCustoFluxo do
   begin
      Prepare;
      ParamByName('IDEMPRESA').asInteger := IdEmpresa;
      CdsCCustoFluxo.Data := Data;
   end;

   pgbStatusAtualiza(17);
   with dtmCadContasOrcamen.qryPlanoContabil do
   begin
      Prepare;
      CdsPlanoContabil.Data := Data;
   end;

   pgbStatusAtualiza(18);
   with dtmCadContasOrcamen.qryPlanoPrev do
   begin
      Prepare;
      CdsPlanoPrev.Data := Data;
   end;

   pgbStatusAtualiza(19);
   with dtmCadContasOrcamen.qryPlanoPrevConta do
   begin
      Prepare;
      CdsPlanoPrevConta.Data := Data;
   end;

   pgbStatusAtualiza(20);
   with dtmCadContasOrcamen.qryPatroConta do
   begin
      Prepare;
      CdsPatroConta.Data := Data;
   end;

   pgbStatusAtualiza(21);
   with dtmCadContasOrcamen.qryPatro do
   begin
      Prepare;
      CdsPatro.Data := Data;
   end;

   Cds.OnCalcFields             := CdsCalcFields;
   CdsDetCond.OnCalcFields      := CdsDetCondCalcFields;
   CdsTodoDet.OnCalcFields      := CdsCalcFields;
   CdsMovOrcamento.OnCalcFields := CdsCalcFields;
end;



procedure TCtrlCadContasOrc.CdsCalcFields(DataSet: TDataSet);
begin
   with dtmCadContasOrcamen.qryGrupoAux do
   begin
      SQL.Clear;
      SQL.Add('SELECT IDGRUPOORCAMEN, NOMEGRUPOORCAMEN, FLGANALSINT, CODGRUPOORC ');
      SQL.Add('FROM GRUPOORCAMEN WHERE IDGRUPOORCAMEN =:IDGRUPOORCAMEN');
      Prepare;
      ParamByName('IDGRUPOORCAMEN').asInteger := Cds.FieldByName('IDGRUPOORCAMEN').asInteger;

      CdsGrupoAux.Data := Data;

      Cds.FieldByName('DESCGRUPO').asString := FormatMaskText((Trim(sMascaraGrupo) + ';0;_'),
                                               CdsGrupoAux.FieldByName('CODGRUPOORC').asString) + ' - ' +
                                               CdsGrupoAux.FieldByName('NOMEGRUPOORCAMEN').asString;
   end;
end;



procedure TCtrlCadContasOrc.CdsDetCondCalcFields(DataSet: TDataSet);
var
   sDescricao : String;
begin
   inherited;

   sDescricao := '';

   with CdsDetCond do
   begin
      sDescricao := sDescricao + 'Se a Conta ' + FieldByName('IDCONTACONDINI').asString;

      if FieldByName('CONDICAO').asString = '<=' then sDescricao := sDescricao + ' for menor ou igual ';
      if FieldByName('CONDICAO').asString = '<' then  sDescricao := sDescricao + ' for menor ';
      if FieldByName('CONDICAO').asString = '=' then  sDescricao := sDescricao + ' for igual ';
      if FieldByName('CONDICAO').asString = '>=' then sDescricao := sDescricao + ' for maior ou igual ';
      if FieldByName('CONDICAO').asString = '>' then  sDescricao := sDescricao + ' for maior ';
      if FieldByName('CONDICAO').asString = '<>' then sDescricao := sDescricao + ' for diferente ';

      if FieldByName('TIPOCONDINI').asString = 'V' then sDescricao := sDescricao + 'que o Valor ' + FormatFloat('###,###,###,##0.00', FieldByName('VLRCONDINI').asFloat);
      if FieldByName('TIPOCONDINI').asString = 'C' then sDescricao := sDescricao + 'que a Conta ' + FieldByName('IDCONTACONDFIM').asString;

      sDescricao := sDescricao + ' então a condição receberá o Valor ';

      if FieldByName('TIPOCONDRES').asString = 'V' then sDescricao := sDescricao + FormatFloat('###,###,###,##0.00', FieldByName('VLRCONDRES').asFloat);
      if FieldByName('TIPOCONDRES').asString = 'C' then sDescricao := sDescricao + 'da Conta ' + FieldByName('IDCONTACONDRES').asString;

      FieldByName('CONDDESCRICAO').asString := sDescricao;
   end;
end;





procedure TCtrlCadContasOrc.CadastroDelete;
begin
   // Faz a deleção em cascata dos registros filhos e depois do pai

   with dtmCadContasOrcamen do
   begin
      QryTodoDet.Prepare;
      QryTodoDet.ParamByName('IDCONTAORCAMEN').AsString := Cds.FieldByName('IDCONTAORCAMEN').AsString;
      QryTodoDet.ParamByName('IDPLANOORCAMEN').AsInteger := Cds.FieldByName('IDPLANOORCAMEN').AsInteger;
      CdsTodoDet.Data := qryTodoDet.Data;

      CdsTodoDet.First;
      while not(CdsTodoDet.EOF) do CdsTodoDet.Delete;

      CdsMovOrcamento.First;
      while not(CdsMovOrcamento.EOF) do CdsMovOrcamento.Delete;

      Cds.Delete;
   end;

   AplicaOperacaoCadContasOrcDelete;
end;



procedure TCtrlCadContasOrc.AbreQryMovOrcamento;
begin
   with dtmCadContasOrcamen do
   begin
      QryMovOrcamento.Prepare;
      QryMovOrcamento.ParamByName('IDCONTAORCAMEN').AsString  := Cds.FieldByName('IDCONTAORCAMEN').AsString;
      QryMovOrcamento.ParamByName('IDPLANOORCAMEN').AsInteger := Cds.FieldByName('IDPLANOORCAMEN').AsInteger;
      CdsMovOrcamento.Data := qryMovOrcamento.Data;
   end;
end;



procedure TCtrlCadContasOrc.ValoresDefault;
begin
   // Inicializa os valores default's da tela de cadastro
   Cds.FieldByName('TIPOCALCREALIZADO').AsString := 'V';
   Cds.FieldByName('TIPOCALCORCADO').AsString    := 'V';
   Cds.FieldByName('FLGCONTAMONETARIA').AsString := 'S';
   Cds.FieldByName('FLGINFDIAMES').AsString      := 'P';
   Cds.FieldByName('FLGACUMULADO').AsString      := 'S';
   Cds.FieldByName('FLGTRANSFSALDO').AsString    := 'N';
   Cds.FieldByName('FLGATIVA').AsString          := 'A';
   Cds.FieldByName('IDPLANOORCAMEN').AsInteger   := iPlanoOrc;
   Cds.FieldByName('IDPESSOA').AsInteger         := idEmpresa;
   Cds.FieldByName('FLGSINALCONTA').AsString     := 'P';
end;



procedure TCtrlCadContasOrc.CadastroConfirma(pdbeCodigoContaOrc : String;
                                              pmemSQLLines       : String);
var
   iNovaConsulta : LongInt;
begin
   // iNovaConsulta := 0;
   if Cds.FieldByName('TIPOCALCREALIZADO').asString = 'G' then
   begin
      with CdsDataView do
      begin

      Data := dtmCadContasOrcamen.qryDataView.Data;

      if Cds.FieldByName('IDDATAVIEW').asInteger = 0 then //Cds.State = dsInsert then begin
      begin
         Append;
         iNovaConsulta := GetSequence('DATAVIEW');
      end
      else
      begin // if Cds.State = dsEdit then begin
         Edit;
         iNovaConsulta := Cds.FieldByName('IDDATAVIEW').asInteger;
      end;

      // if Cds.State in ([dsEdit, dsInsert]) then begin

         FieldByName('NAME').asString              := 'Consulta do Orçamento Conta ' + pdbeCodigoContaOrc;
         FieldByName('IDDATAVIEW').asInteger       := iNovaConsulta;
         FieldByName('CLASSNAME').asString         := 'Orçamento';
         FieldByName('ORIGEMCMDV').asString        := '0';
         FieldByName('TEMPLATE').asString          := pmemSQLLines;

         Post;

         Cds.FieldByName('IDDATAVIEW').asInteger   := iNovaConsulta;
         Cds.FieldByName('ORIGEMCMDV').asString    := '0';

      // end
      end;
   end;

   AplicaOperacaoCadContasOrcGravar;
end;



procedure TCtrlCadContasOrc.ProcessaDetalheConfirma1(psePosIni1   : Real;
                                                     psePosFim1   : Real;
                                                     pedConteudo1 : String;
                                                     prPerc       : Real);
begin
   CdsDetContaOrc.Delete;

   with dtmCadContasOrcamen.qryContasRef do
   begin
      Unprepare;
      SQL.Clear;
      SQL.Add('SELECT IDCONTAORCAMEN, NOMECONTAORCAMEN ');
      SQL.Add('FROM CONTASORCAMEN  ');
      SQL.Add('WHERE (SUBSTR(IDCONTAORCAMEN,' + FloatToStr(psePosIni1) + ',' + FloatToStr(psePosFim1)+') IN ('+trim(pedConteudo1)+')) ');
      SQL.Add('  AND (IDPLANOORCAMEN = '+IntToStr(iPlanoOrc)+')');
      Prepare;

      CdsContasRef.Data := Data;
   end;

   CdsContasRef.First;
   while not(CdsContasRef.EOF) do
   begin
      CdsDetContaOrc.Insert;
      CdsDetContaOrc.FieldByName('IDCONTAREFORCADO').AsString := CdsContasRef.FieldByName('IDCONTAORCAMEN').AsString;
      CdsDetContaOrc.FieldByName('NOMECONTAORCAMEN').AsString := CdsContasRef.FieldByName('NOMECONTAORCAMEN').AsString;
      CdsDetContaOrc.FieldByName('PERCCONTAREFORC').AsFloat   := prPerc;
      CdsContasRef.Next;
   end;

   CdsDetContaOrc.Edit;
end;



procedure TCtrlCadContasOrc.ProcessaDetalheConfirma2(psePosIni2   : Real;
                                                     psePosFim2   : Real;
                                                     pedConteudo2 : String;
                                                     prPerc       : Real);
begin
   CdsDetContaRea.Delete;

   with dtmCadContasOrcamen.qryContasRef do
   begin
      Unprepare;
      SQL.Clear;
      SQL.Add('SELECT IDCONTAORCAMEN, NOMECONTAORCAMEN ');
      SQL.Add('FROM CONTASORCAMEN  ');
      SQL.Add('WHERE (SUBSTR(IDCONTAORCAMEN,'+FloatToStr(psePosIni2)+','+FloatToStr(psePosFim2)+') IN ('+trim(pedConteudo2)+')) ');
      SQL.Add('  AND (IDPLANOORCAMEN = '+IntToStr(iPlanoOrc)+')');
      Prepare;

      CdsContasRef.Data := Data;
   end;

   CdsContasRef.First;
   while not(CdsContasRef.EOF) do
   begin
      CdsDetContaRea.Insert;
      CdsDetContaRea.FieldByName('IDCONTAREFREAL').AsString   := CdsContasRef.FieldByName('IDCONTAORCAMEN').AsString;
      CdsDetContaRea.FieldByName('NOMECONTAORCAMEN').AsString := CdsContasRef.FieldByName('NOMECONTAORCAMEN').AsString;
      CdsDetContaRea.FieldByName('PERCCONTAREFREA').AsFloat   := prPerc;
      CdsContasRef.Next;
   end;

   CdsDetContaRea.Edit;
end;



procedure TCtrlCadContasOrc.AbreqryAuxContab;
begin
   with dtmCadContasOrcamen.qryAuxContab do
   begin
      Prepare;
      ParamByName('IDPESSOA').asInteger := idEmpresa;

      CdsAuxContab.Data := Data;
   end;
end;



procedure TCtrlCadContasOrc.btnImportaContabClick(var pdbeNomeContaOrc   : String;
                                                  var pdbeCodigoContaOrc : String;
                                                  var sConta             : String
                                                 );
begin
   with dtmCadContasOrcamen.qryContaContab do
   begin
      Prepare;
      ParamByName('PLANO').asInteger   := CdsAuxContab.FieldByName('PLANO').asInteger;
      ParamByName('PLACONTA').asString := Trim(sConta);

      CdsContaContab.Data := Data;
   end;

   Cds.FieldByName('NOMECONTAORCAMEN').asString := CdsContaContab.FieldByName('PLANOME').asString;
   Cds.FieldByName('IDCONTAORCAMEN').asString   := CdsContaContab.FieldByName('PLACONTA').asString;

   pdbeNomeContaOrc   := CdsContaContab.FieldByName('PLANOME').asString;
   pdbeCodigoContaOrc := CdsContaContab.FieldByName('PLACONTA').asString;
end;



procedure TCtrlCadContasOrc.ProcessabtnTransfClick1;
begin
   with CdsDetContaRea do
   begin
      First;
      while not(EOF) do
      begin
         CdsDetContaOrc.Append;

         CdsDetContaOrc.FieldByName('IDCONTAREFORCADO').AsString := FieldByName('IDCONTAREFREAL').AsString;
         CdsDetContaOrc.FieldByName('PERCCONTAREFORC').AsFloat   := FieldByName('PERCCONTAREFREA').AsFloat;
         CdsDetContaOrc.FieldByName('IDCOMPCONTASORC').AsInteger := GetSequence('COMPCONTASORCAMEN');
         CdsDetContaOrc.FieldByName('IDCONTAORCAMEN').AsString   := FieldByName('IDCONTAORCAMEN').AsString;
         CdsDetContaOrc.FieldByName('IDPLANOORCAMEN').AsInteger  := FieldByName('IDPLANOORCAMEN').AsInteger;
         CdsDetContaOrc.FieldByName('NOMECONTAORCAMEN').AsString := FieldByName('NOMECONTAORCAMEN').AsString;
         CdsDetContaOrc.Post;

         Next;
      end;
   end;
end;



procedure TCtrlCadContasOrc.ProcessabtnTransfClick2;
begin
   with CdsDetContaOrc do
   begin
      First;
      while not EOF do
      begin
         CdsDetContaRea.Append;
         CdsDetContaRea.FieldByName('IDCONTAREFREAL').asString  := FieldByName('IDCONTAREFORCADO').asString;
         CdsDetContaRea.FieldByName('PERCCONTAREFREA').asFloat   := FieldByName('PERCCONTAREFORC').asFloat;
         CdsDetContaRea.FieldByName('IDCOMPCONTASORC').asInteger := GetSequence('COMPCONTASORCAMEN');
         CdsDetContaRea.FieldByName('IDCONTAORCAMEN').asString   := FieldByName('IDCONTAORCAMEN').asString;
         CdsDetContaRea.FieldByName('IDPLANOORCAMEN').asInteger  := FieldByName('IDPLANOORCAMEN').asInteger;
         CdsDetContaRea.FieldByName('NOMECONTAORCAMEN').asString := FieldByName('NOMECONTAORCAMEN').asString;
         CdsDetContaRea.Post;

         Next;
      end;
   end;
end;



function TCtrlCadContasOrc.AplicaOperacaoCadContasOrcDelete : Boolean ;
var
   Msg : String;
begin
   if (ConnectionSide = cnsClient) then
   begin
      Result := Connection.AppServer.AplicaOperacaoCadContasOrcDelete(FCdsMovOrcamento.Data, FCdsTodoDet.Data, FCds.Data);

      if not(Result) then
      begin
         MessageInfo := Connection.AppServer.MessageInfo;
      end;
   end
   else
   begin
      try
         StartTransaction;

      // itens Filhos
      Result := ApplyCds(FCdsMovOrcamento, _dbSaldoOrcado,
                          [_dbContasOrcamen.IdPessoa, _dbContasOrcamen.IdPlanoOrcamen, _dbContasOrcamen.IdContaOrcamen],
                          [_dbSaldoOrcado.IdPessoa,   _dbSaldoOrcado.IdPlanoOrcamen,   _dbSaldoOrcado.IdContaOrcamen]);

      Msg    := _dbSaldoOrcado.MessageInfo;
      if (not Result) then begin

        raise Exception.Create(Msg);
      end;

         // itens Filhos
         Result := ApplyCds(FCdsTodoDet,
                            _dbCompContasOrcamen,
                            [_dbContasOrcamen.IdPlanoOrcamen, _dbContasOrcamen.IdContaOrcamen],
                            [_dbCompContasOrcamen.IdPlanoOrcamen, _dbCompContasOrcamen.IdContaOrcamen]
                           );

         Msg := _dbCompContasOrcamen.MessageInfo;

         if not(Result) then raise Exception.Create(Msg);
         // ----------------------------------------------------------------------------------------

         // Pai
         Result := ApplyCds(FCds, _dbContasOrcamen, [], []);
         Msg    := _dbContasOrcamen.MessageInfo;

         if (not Result) then raise Exception.Create(Msg);
         // ----------------------------------------------------------------------------------------

         Commit;

      except
         on E:Exception do
         begin
            Rollback;
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;



function TCtrlCadContasOrc.AplicaOperacaoCadContasOrcGravar: Boolean;
var
   Msg : String;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaOperacaoCadContasOrcGravar(FCds.Data,
                                                                      FCdsDet.Data,
                                                                      FCdsDetContaOrc.Data,
                                                                      FCdsDetFluxo.Data,
                                                                      FCdsDetContaRea.Data,
                                                                      FCdsDetCond.Data,
                                                                      FCdsDataView.Data
                                                                     );

      if not(Result) then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         StartTransaction;

         // Pai ------------------------------------------------------------------------------------
         Result := ApplyCds(FCds, _dbContasOrcamen, [], []);
         Msg    := _dbContasOrcamen.MessageInfo;

         if not(Result) then raise Exception.Create(Msg);
         // ----------------------------------------------------------------------------------------

         // itens Filhos
         Result := ApplyCds(FCdsDet, _dbDet, [_dbContasOrcamen.IdPlanoOrcamen, _dbContasOrcamen.IdContaOrcamen], [_dbDet.IdPlanoOrcamen, _dbDet.IdContaOrcamen]);
         Msg    := _dbCompContasOrcamen.MessageInfo;

         if not(Result) then raise Exception.Create(Msg);
         // ----------------------------------------------------------------------------------------

         Result := ApplyCds(FCdsDetContaOrc, _dbDetContaOrc, [_dbContasOrcamen.IdPlanoOrcamen, _dbContasOrcamen.IdContaOrcamen], [_dbDetContaOrc.IdPlanoOrcamen, _dbDetContaOrc.IdContaOrcamen]);
         Msg    := _dbCompContasOrcamen.MessageInfo;

         if not(Result) then raise Exception.Create(Msg);
         // ----------------------------------------------------------------------------------------

         Result := ApplyCds(FCdsDetFluxo, _dbDetFluxo, [_dbContasOrcamen.IdPlanoOrcamen, _dbContasOrcamen.IdContaOrcamen], [_dbDetFluxo.IdPlanoOrcamen, _dbDetFluxo.IdContaOrcamen]);
         Msg    := _dbCompContasOrcamen.MessageInfo;

         if not(Result) then raise Exception.Create(Msg);
         // ----------------------------------------------------------------------------------------

         Result := ApplyCds(FCdsDetContaRea, _dbDetContaRea, [_dbContasOrcamen.IdPlanoOrcamen, _dbContasOrcamen.IdContaOrcamen], [_dbDetContaRea.IdPlanoOrcamen, _dbDetContaRea.IdContaOrcamen]);
         Msg    := _dbCompContasOrcamen.MessageInfo;

         if not(Result) then raise Exception.Create(Msg);
         // ----------------------------------------------------------------------------------------

         Result := ApplyCds(FCdsDetCond, _dbDetCond, [_dbContasOrcamen.IdPlanoOrcamen, _dbContasOrcamen.IdContaOrcamen], [_dbDetCond.IdPlanoOrcamen, _dbDetCond.IdContaOrcamen]);
         Msg    := _dbCompContasOrcamen.MessageInfo;

         if not(Result) then raise Exception.Create(Msg);
         // ----------------------------------------------------------------------------------------

         Result := ApplyCds(FCdsDataView, _dbDataView, [], []);
         Msg    := _dbDataView.MessageInfo;

         if not(Result) then raise Exception.Create(Msg);
         // ----------------------------------------------------------------------------------------

         Commit;

      except
         on E:Exception do begin
            Rollback;
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;



procedure TCtrlCadContasOrc.pgbStatusAtualiza(pPos : Integer);
begin
   pgbStatus.Visible  := True;
   pgbStatus.Position := pPos;
   pgbStatus.Repaint;
end;



function TCtrlCadContasOrc.VerificaLinhaGrid(Cds                : TClientDataSet;
                                             iTagChave          : Integer;
                                             iTagVazio          : Integer;
                                             sTabelaMensagem    : String;
                                             bPermiteChaveVazia : Boolean
                                            ): Boolean;
var
   X          : Integer;
   sChave     : String;
   ListaChave : TStrings;
begin
   ListaChave := TStringList.Create;

   if Cds.IsEmpty then
   begin
      Result := True;
      Exit;
   end;

   try
      Cds.First;

      while not(Cds.EOF) do
      begin
         sChave := '';

         for X:=0 To Cds.FieldCount - 1 do
         begin
            if (Cds.Fields[X].Tag = iTagChave) Or (Cds.Fields[X].Tag = iTagVazio) then
            begin
               sChave  := sChave + Trim(Cds.Fields[X].AsString);

               if not(bPermiteChaveVazia) and (Cds.Fields[X].Tag <> iTagVazio) then
               begin
                  if Cds.Fields[X].IsNull then
                  begin
                    MessageInfo := 'O Campo ' + Cds.Fields[X].DisPlayLabel + ' do Cadastro de ' + sTabelaMensagem + ' não foi informado';
                    Result := False;
                    Exit;
                  end;
               end;

            end;
         end;

         if ListaChave.IndexOf(sChave) <> -1 then
         begin
            MessageInfo := 'O Cadastro de ' + sTabelaMensagem + ' contém um registro repetido';
            Result      := False;
            Exit;
         end
         else
         begin
            if sChave = '' then
            begin
               MessageInfo := 'O Cadastro de ' + sTabelaMensagem + ' contém um registro não preenchido';
               Result      := False;
               Exit;
            end
            else
            begin
               ListaChave.Add(sChave);
            end;
         end;

         Cds.Next;
      end;

      Cds.First;
      Result := True;

   finally
      ListaChave.Free;
   end;
end;



// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
procedure TCtrlCadContasOrc.SetCds(const Value : TClientDataSet) ;
begin
   FCds := Value;
end;

procedure TCtrlCadContasOrc.SetCdsDet(const Value: TClientDataSet);
begin
   FCdsDet := Value;
end;

procedure TCtrlCadContasOrc.SetCdsDetCond(const Value: TClientDataSet);
begin
   FCdsDetCond := Value;
end;

procedure TCtrlCadContasOrc.SetCdsCCustoConta(const Value: TClientDataSet);
begin
   FCdsCCustoConta := Value;
end;

procedure TCtrlCadContasOrc.SetCdsCenRespConta(const Value: TClientDataSet);
begin
   FCdsCenRespConta := Value;
end;

procedure TCtrlCadContasOrc.SetCdsPatroConta(const Value: TClientDataSet);
begin
   FCdsPatroConta := Value;
end;

procedure TCtrlCadContasOrc.SetCdsPlanoPrevConta(const Value: TClientDataSet);
begin
   FCdsPlanoPrevConta := Value;
end;

procedure TCtrlCadContasOrc.SetCdsUnidNegocConta(const Value: TClientDataSet);
begin
   FCdsUnidNegocConta := Value;
end;

procedure TCtrlCadContasOrc.SetCdsGrupo(const Value: TClientDataSet);
begin
   FCdsGrupo := Value;
end;

procedure TCtrlCadContasOrc.SetCdsContaContabil(const Value: TClientDataSet);
begin
   FCdsContaContabil := Value;
end;

procedure TCtrlCadContasOrc.SetCdsDataView(const Value: TClientDataSet);
begin
   FCdsDataView := Value;
end;

procedure TCtrlCadContasOrc.SetCdsDetContaOrc(const Value: TClientDataSet);
begin
   FCdsDetContaOrc := Value;
end;

procedure TCtrlCadContasOrc.SetCdsDetContaRea(const Value: TClientDataSet);
begin
   FCdsDetContaRea := Value;
end;

procedure TCtrlCadContasOrc.SetCdsDetFluxo(const Value: TClientDataSet);
begin
   FCdsDetFluxo := Value;
end;

procedure TCtrlCadContasOrc.SetCdsMovOrcamento(const Value: TClientDataSet);
begin
   FCdsMovOrcamento := Value;
end;

procedure TCtrlCadContasOrc.SetCdsTodoDet(const Value: TClientDataSet);
begin
   FCdsTodoDet := Value;
end;

procedure TCtrlCadContasOrc.SetCdsContasRef(const Value: TClientDataSet);
begin
   FCdsContasRef := Value;
end;

procedure TCtrlCadContasOrc.SetCdsContasOrc(const Value: TClientDataSet);
begin
   FCdsContasOrc := Value;
end;

procedure TCtrlCadContasOrc.SetCdsAuxContab(const Value: TClientDataSet);
begin
   FCdsAuxContab := Value;
end;

procedure TCtrlCadContasOrc.SetCdsContaContab(const Value: TClientDataSet);
begin
   FCdsContaContab := Value;
end;

procedure TCtrlCadContasOrc.SetCdsAux(const Value: TClientDataSet);
begin
   FCdsAux := Value;
end;

procedure TCtrlCadContasOrc.SetCdsCCusto(const Value: TClientDataSet);
begin
   FCdsCCusto := Value;
end;

procedure TCtrlCadContasOrc.SetCdsCCustoFluxo(const Value: TClientDataSet);
begin
   FCdsCCustoFluxo := Value;
end;

procedure TCtrlCadContasOrc.SetCdsCentroRespon(const Value: TClientDataSet);
begin
   FCdsCentroRespon := Value;
end;

procedure TCtrlCadContasOrc.SetCdsContaCondFim(const Value: TClientDataSet);
begin
   FCdsContaCondFim := Value;
end;

procedure TCtrlCadContasOrc.SetCdsContaCondIni(const Value: TClientDataSet);
begin
   FCdsContaCondIni := Value;
end;

procedure TCtrlCadContasOrc.SetCdsContaCondRes(const Value: TClientDataSet);
begin
   FCdsContaCondRes := Value;
end;

procedure TCtrlCadContasOrc.SetCdsGrupoAux(const Value: TClientDataSet);
begin
   FCdsGrupoAux := Value;
end;

procedure TCtrlCadContasOrc.SetCdsPatro(const Value: TClientDataSet);
begin
   FCdsPatro := Value;
end;

procedure TCtrlCadContasOrc.SetCdsPlanoContabil(const Value: TClientDataSet);
begin
   FCdsPlanoContabil := Value;
end;

procedure TCtrlCadContasOrc.SetCdsPlanoPrev(const Value: TClientDataSet);
begin
   FCdsPlanoPrev := Value;
end;

procedure TCtrlCadContasOrc.SetCdsTestaComposicao( const Value: TClientDataSet);
begin
   FCdsTestaComposicao  := Value;
end;

procedure TCtrlCadContasOrc.SetCdsTipoRD(const Value: TClientDataSet);
begin
   FCdsTipoRD := Value;
end;

procedure TCtrlCadContasOrc.SetCdsUnidNegoc(const Value: TClientDataSet);
begin
   FCdsUnidNegoc := Value;
end;
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------



end.
