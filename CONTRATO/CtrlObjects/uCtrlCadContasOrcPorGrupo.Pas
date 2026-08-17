// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina    : ListaCentRespon e ListaCentroDeCusto e ListaAtivProj
Data      : 17/12/2003
Autor     : André Pontes
Pendencia : 16005 / 15700
Descrição : Filtro para não listar os sintéticos
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : ListaCentRespon e ListaCentroDeCusto
Data      : 17/12/2003
Autor     : André Pontes
Pendencia : 15805
Descrição : Centros de Custo e Centro de Restponsabilidade filtradas pelo respectivo plano vigente
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : ListaCentRespon e ListaCentroDeCusto
Data      : 15/12/2003
Autor     : André Pontes
Pendencia : 15805
Descrição : Centros de Custo e Centro de Restponsabilidade filtradas pelo respectivo plano vigente
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : InclusaoNovaCR, AlteracaoNovaCR, ExclusaoNovaCR, MontaCodigosCR, ExisteCombinacaoCR
Data      : 03/12/2003 a 15/12/2003
Autor     : André Pontes
Pendencia : 15700
Descrição : Criadas novas funções para controlar a replicação por Centro de Responsabilidade
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : AlteracaoNova
Data      : 23/10/2003
Autor     : André Pontes
Pendencia : 10065
Descrição : Correção da alteração da conta "espelho" original
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : ExclusaoNova
Data      : 06/10/2003
Autor     : André Pontes
Pendencia : 10065
Descrição : Criada função para exclusão das contas
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : ExcluiCompContas
Data      : 03/10/2003
Autor     : André Pontes
Pendencia : 10065
Descrição : A exclusão da CompContas passa a ser conta a conta.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : ExisteCombinacao
Data      : 02/10/2003
Autor     : André Pontes
Pendencia : 10065
Descrição : Criada função para verificar se já existe alguma conta com a mesma combinação de
            parâmetros da que se deseja inserir
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : ListaCentroDeCusto   /  ListaAtivProj  /  ListaPatro  /  ListaPlanoPrev
Data      : 30/09/2003 a 01/10/2003
Autor     : André Pontes
Pendencia : 10065
Descrição : Criado parâmetro que indica se devem ser listados:
            0: Todos
            1: Apenas os que AINDA não estiverem utilizados por contas orçamentárias (p/ inserção)
            2: Apenas os que Já        estiverem utilizados por contas orçamentárias (p/ alteração)
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : AlteracaoNova / ExcluiCompContas
Data      : 29 e 30/09/2003
Autor     : André Pontes
Pendencia : 10065
Descrição : Novas funções para alteração de Contas Orçamentárias por Grupo
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    :
Data      : 22/09/2003
Autor     : André Pontes
Pendencia : 10065
Descrição : Nova função para criação das Contas Orçamentárias
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : até 19/09/2003
Autor     : André Pontes
Pendencia : 10065
Descrição : Reorganização de todo o código
---------------------------------------------------------------------------------------------------}

unit
   uCtrlCadContasOrcPorGrupo;

interface

uses
   DB, uDataBase, uCmControlObject, dbclient, sysutils, wwQuery, provider,
   uMidasUtil, uCMTypes, Classes, StdCtrls, uCmSqlParams, uDbDataView, uReccodigo,
   ComCtrls, Math, dialogs, Forms;

type
   TCtrlCadContasOrcPorGrupo = class(TCmControlObject)

   protected

      procedure DoChangeDataBase; override;
      procedure onCreateAppServer; override;


   private

      dbDataView        : TdbDataView;
      AtualizarLog      : Boolean;

      FCntStatus        : Integer;
      FIdEmpresa        : Double;
      FPlano            : Double;

      FCdsGrupoOrc      : TClientDataSet;

      // André Pontes - pendência 15700 - 03/12/2003
      FCdsCentRespon    : TClientDataSet;
      // FIM André Pontes - pendência 15700 - 03/12/2003

      FCdsCentroDeCusto : TClientDataSet;
      FCdsAtivProj      : TClientDataSet;
      FCdsPlanoPrev     : TClientDataSet;
      FCdsPatro         : TClientDataSet;

      // André Pontes - pendência 15700 - 03/12/2003
      FCdsCRSel         : TClientDataSet;    // Centros de Responsabilidade selecionados
      // FIM André Pontes - pendência 15700 - 03/12/2003

      // André Pontes - pendência 10065 - 23/09/2003
      FCdsCCSel         : TClientDataSet;    // Centros de Custo selecionados
      FCdsAPSel         : TClientDataSet;    // Atividades/Projetos selecionados
      FCdsPPSel         : TClientDataSet;    // Planos selecionados
      FCdsPTSel         : TClientDataSet;    // Patrocinadoras selecionadas

      FCdsCampoSel      : TClientDataSet;    // Campos selecionados (não usado)

      FCdsParamOrc      : TClientDataSet;    // Parâmetros do sistema (códigos dos Planos e Patrocinadoras)

      cdsCodigo         : TClientDataSet;    // Usado para o "cálculo" do código da conta.
                                             // É nele que se faz o loop para inserção/alteração
                                             // das contas orçamentárias
      cdsExiste         : TClientDataSet;    // Usado para verificar a existência de contas
                                             // orçamentárias com uma determinada combinação de
                                             // parâmetros
      // FIM André Pontes - pendência 10065 - 02/10/2003

      FCdsBase          : TClientDataSet;
      FCdsConta         : TClientDataSet;
      FCdsOrigem        : TClientDataSet;
      FCdsDataView      : TClientDataSet;

      // André Pontes - pendência 10065 - 06/10/2003
      FCdsContaEspelho  : TClientDataSet;
      FCdsContaNova     : TClientDataSet;
      // FIM André Pontes - pendência 10065 - 06/10/2003

      procedure SetCdsGrupoOrc(const Value: TClientDataSet);

      // André Pontes - pendência 15700 - 03/12/2003
      procedure SetCdsCentRespon(const Value: TClientDataSet);
      // FIM André Pontes - pendência 15700 - 03/12/2003

      procedure SetCdsCentroDeCusto(const Value: TClientDataSet);
      procedure SetCdsAtivProj(const Value: TClientDataSet);
      procedure SetCdsPatro(const Value: TClientDataSet);
      procedure SetCdsPlanoPrev(const Value: TClientDataSet);
      procedure SetCdsBase(const Value: TClientDataSet);
      procedure SetCdsConta(const Value: TClientDataSet);
      procedure SetCdsOrigem(const Value: TClientDataSet);
      procedure SetCdsDataView(const Value: TClientDataSet);

      // André Pontes - pendência 10065 - 06/10/2003
      procedure SetCdsContaEspelho(const Value: TClientDataSet);
      procedure SetCdsContaNova(const Value: TClientDataSet);
      // FIM André Pontes - pendência 10065 - 06/10/2003


      procedure PopulaOrigemContab(pContaOrigem: String);
      procedure PopulaOrigemContaOrc(pContaOrigem: String);
      procedure PopulaOrigemContaRea(pContaOrigem: String);
      procedure PopulaOrigemFluxoCai(pContaOrigem: String);
      procedure PopulaOrigemCondic(pContaOrigem: String);
      procedure PopulaOrigemArqGenerico(pContaOrigem: String);

      procedure GeraCodigo(pArrCodigo : array of TrecCodigo);

      // André Pontes - pendência 10065 - 24/09/2003
      procedure MontaCodigos(const IDGrupoOrcamen   : Extended;
                             const CodGrupoOrcamen  : String;
                             const bCalculaCodigo   : Boolean;
                             const sNomeBilhete     : String
                            );
      // FIM André Pontes - pendência 10065 - 24/09/2003

      // André Pontes - pendência 10065 - 02/10/2003
      function  ExisteCombinacao(const IDPlanoOrcamen : Extended;
                                 const IDGrupoOrcamen : Extended;
                                 const sCentroCusto   : String;
                                 const sUnidNegoc     : String;
                                 const sPlano         : String;
                                 const sPatro         : String
                                ): Boolean;
      // FIM André Pontes - pendência 10065 - 02/10/2003

      function AtualizaTabela(pSql: String): Boolean;

      procedure SetCdsCRSel(const Value: TClientDataSet);
      procedure SetCdsCCSel(const Value: TClientDataSet);
      procedure SetCdsAPSel(const Value: TClientDataSet);
      procedure SetCdsPPSel(const Value: TClientDataSet);
      procedure SetCdsPTSel(const Value: TClientDataSet);
      procedure SetCdsCampoSel(const Value: TClientDataSet);
      procedure SetCdsParamOrc(const Value: TClientDataSet);

      // André Pontes - pendência 15700 - 03/12/2003
      procedure MontaCodigosCR(const IDGrupoOrcamen   : Extended;
                               const CodGrupoOrcamen  : String;
                               const bCalculaCodigo   : Boolean;
                               const sNomeBilhete     : String
                              );
      // FIM André Pontes - pendência 15700 - 03/12/2003

      // André Pontes - pendência 15700 - 03/12/2003
      function  ExisteCombinacaoCR(const IDPlanoOrcamen : Extended;
                                   const IDGrupoOrcamen : Extended;
                                   const sCentRespon    : String;
                                   const sCentroCusto   : String;
                                   const sUnidNegoc     : String;
                                   const sPlano         : String;
                                   const sPatro         : String
                                ): Boolean;
      // FIM André Pontes - pendência 15700 - 03/12/2003

   public
      memStatus : TMemo;

      constructor Create;  override;
      destructor  Destroy; override;

      function ListaGrupoOrc       : OleVariant;


      function ListaCentRespon(const iTipo     : Integer = 0;
                               const iPlanoOrc : Integer = 0;
                               const iGrupoOrc : Integer = 0
                              ): OleVariant;

      // André Pontes - pendência 10065 - 01/10/2003
      function ListaCentroDeCusto(const iTipo     : Integer = 0;
                                  const iPlanoOrc : Integer = 0;
                                  const iGrupoOrc : Integer = 0
                                 ): OleVariant;

      function ListaAtivProj(const iTipo     : Integer = 0;
                             const iPlanoOrc : Integer = 0;
                             const iGrupoOrc : Integer = 0
                            ): OleVariant;

      function ListaPatro(const iTipo     : Integer = 0;
                          const iPlanoOrc : Integer = 0;
                          const iGrupoOrc : Integer = 0
                         ): OleVariant;

      function ListaPlanoPrev(const iTipo     : Integer = 0;
                              const iPlanoOrc : Integer = 0;
                              const iGrupoOrc : Integer = 0
                             ): OleVariant;
      // FIM André Pontes - pendência 10065 - 01/10/2003

      function Exclusao           : Boolean;
      function Alteracao(edtContaText  : String;
                         cboCampoValue : String
                        ): Boolean;

      function  AlteraCampo(pContaOrigem   : String;
                            pCampos        : array of String;
                            pcboCampoValue : String
                           ): Boolean;

      function  AlteraContab(pContaOrigem: String): Boolean;
      function  AlteraContaOrc(pContaOrigem: String): Boolean;
      function  AlteraContaRea(pContaOrigem: String): Boolean;
      function  AlteraFluxoCai(pContaOrigem: String): Boolean;
      function  AlteraCondic(pContaOrigem: String): Boolean;

      function  AlteraArqGenerico(pContaOrigem: String): Boolean;

      function  TamanhoMinimo(pCdsLocal : TDataSet;
                              pLtvSelec : TListView;
                              pCampo    : String
                             ): Integer;

      procedure BuscaContas(pLogar : Boolean);

      procedure PopulaOrigem(pContaOrigem : String);

      procedure GravaLog(pLog : String);

      procedure Estimar(pInserir : Boolean);

      function  Inclusao(pedtContaText : String;
                         pArrCodigo : array of TrecCodigo;
                         pLtvSelec  : TListView
                        ): Boolean;

      // André Pontes - pendência 10065 - 22/09/2003
      function  InclusaoNova(const IDGrupoOrcamen  : Extended;
                             const CodGrupoOrcamen : String;
                             const IDContaOrcamen  : String;
                             const sPath           : String;
                             const bSubstCC        : Boolean;
                             const bSubstAP        : Boolean;
                             const bSubstPP        : Boolean;
                             const bSubstPT        : Boolean;
                             const sNomeBilhete    : String
                            ): Boolean;
      // FIM André Pontes - pendência 10065 - 22/09/2003

      // André Pontes - pendência 10065 - 29/09/2003
      function  AlteracaoNova(const IDContaEspelho  : String;
                              const IDGrupoOrcamen  : String;
                              const CodGrupoOrcamen : String;
                              const IDEmpresProp    : String;
                              const sPath           : String;
                              const bSubstCompConta : Boolean;
                              const bSubstCC        : Boolean;
                              const bSubstAP        : Boolean;
                              const bSubstPP        : Boolean;
                              const bSubstPT        : Boolean;
                              const sNomeBilhete    : String
                             ): Boolean;

      function  ExcluiCompContas(const IDPlanoOrcamen  : String;
                                 const IDContaNova     : String
                                ): Boolean;
{
                                 const IDGrupoOrcamen  : String;
                                 const IDEmpresaProp   : String;
                                 const sCentroCusto    : String;
                                 const sUnidNegocio    : String;
                                 const sPlano          : String;
                                 const sPatro          : String
}

      // FIM André Pontes - pendência 10065 - 22/09/2003

      // André Pontes - pendência 10065 - 06/10/2003
      function  ExclusaoNova(const IDGrupoOrcamen  : String;
                             const CodGrupoOrcamen : String;
                             const IDEmpresProp    : String;
                             const sPath           : String;
                             const bSubstCC        : Boolean;
                             const bSubstAP        : Boolean;
                             const bSubstPP        : Boolean;
                             const bSubstPT        : Boolean;
                             const sNomeBilhete    : String
                            ): Boolean;
      // FIM André Pontes - pendência 10065 - 06/10/2003

      function  InclusaoNovaCR(const IDGrupoOrcamen  : Extended;
                               const CodGrupoOrcamen : String;
                               const IDContaOrcamen  : String;
                               const sPath           : String;
                               const bSubstCR        : Boolean;
                               const bSubstCC        : Boolean;
                               const bSubstAP        : Boolean;
                               const bSubstPP        : Boolean;
                               const bSubstPT        : Boolean;
                               const sNomeBilhete    : String
                              ): Boolean;

      function  AlteracaoNovaCR(const IDContaEspelho  : String;
                                const IDGrupoOrcamen  : String;
                                const CodGrupoOrcamen : String;
                                const IDEmpresProp    : String;
                                const sPath           : String;
                                const bSubstCompConta : Boolean;
                                const bSubstCR        : Boolean;
                                const bSubstCC        : Boolean;
                                const bSubstAP        : Boolean;
                                const bSubstPP        : Boolean;
                                const bSubstPT        : Boolean;
                                const sNomeBilhete    : String
                               ): Boolean;

      function  ExclusaoNovaCR(const IDGrupoOrcamen  : String;
                               const CodGrupoOrcamen : String;
                               const IDEmpresProp    : String;
                               const sPath           : String;
                               const bSubstCR        : Boolean;
                               const bSubstCC        : Boolean;
                               const bSubstAP        : Boolean;
                               const bSubstPP        : Boolean;
                               const bSubstPT        : Boolean;
                               const sNomeBilhete    : String
                              ): Boolean;

      // André Pontes - pendência 10065 - 26/09/2003
      procedure ExcluiContaEspelho;
      // FIM André Pontes - pendência 10065 - 26/09/2003

      property CntStatus        : Integer        read FCntStatus        write FCntStatus Default 0;
      property pIdEmpresa       : Double         read FIdEmpresa        write FIdEmpresa;
      property pPlano           : Double         read FPlano            write FPlano;

      property CdsGrupoOrc      : TClientDataSet read FCdsGrupoOrc      write SetCdsGrupoOrc;

      property CdsCentRespon    : TClientDataSet read FCdsCentRespon    write SetCdsCentRespon;

      property CdsCentroDeCusto : TClientDataSet read FCdsCentroDeCusto write SetCdsCentroDeCusto;
      property CdsAtivProj      : TClientDataSet read FCdsAtivProj      write SetCdsAtivProj;
      property CdsPlanoPrev     : TClientDataSet read FCdsPlanoPrev     write SetCdsPlanoPrev;
      property CdsPatro         : TClientDataSet read FCdsPatro         write SetCdsPatro;

      property CdsCRSel         : TClientDataSet read FCdsCRSel         write SetCdsCRSel;
      // André Pontes - pendência 10065 - 23/09/2003
      property CdsCCSel         : TClientDataSet read FCdsCCSel         write SetCdsCCSel;
      property CdsAPSel         : TClientDataSet read FCdsAPSel         write SetCdsAPSel;
      property CdsPPSel         : TClientDataSet read FCdsPPSel         write SetCdsPPSel;
      property CdsPTSel         : TClientDataSet read FCdsPTSel         write SetCdsPTSel;
      property CdsCampoSel      : TClientDataSet read FCdsCampoSel      write SetCdsCampoSel;
      property CdsParamOrc      : TClientDataSet read FCdsParamOrc      write SetCdsParamOrc;
      // FIM André Pontes - pendência 10065 - 23/09/2003

      property CdsBase          : TClientDataSet read FCdsBase          write SetCdsBase;
      property CdsConta         : TClientDataSet read FCdsConta         write SetCdsConta;
      property CdsOrigem        : TClientDataSet read FCdsOrigem        write SetCdsOrigem;
      property CdsDataView      : TClientDataSet read FCdsDataView      write SetCdsDataView;

      // André Pontes - pendência 10065 - 06/10/2003
      property CdsContaEspelho  : TClientDataSet read FCdsContaEspelho  write SetCdsContaEspelho;
      property CdsContaNova     : TClientDataSet read FCdsContaNova     write SetCdsContaNova;
      // FIM André Pontes - pendência 10065 - 06/10/2003


   end;



implementation
uses
   uFuncoesOrcamento;



procedure TCtrlCadContasOrcPorGrupo.onCreateAppServer;
begin
   inherited;

   CdsGrupoOrc       := TClientDataSet.Create(nil);
   CdsBase           := TClientDataSet.Create(nil);
   CdsOrigem         := TClientDataSet.Create(nil);

   CdsCentroDeCusto  := TClientDataSet.Create(nil);
   CdsAtivProj       := TClientDataSet.Create(nil);
   CdsPatro          := TClientDataSet.Create(nil);
   CdsPlanoPrev      := TClientDataSet.Create(nil);

   CdsCRSel          := TClientDataSet.Create(nil);

   // André Pontes - pendência 10065 - 23/09/2003
   CdsCCSel          := TClientDataSet.Create(nil);
   CdsAPSel          := TClientDataSet.Create(nil);
   CdsPPSel          := TClientDataSet.Create(nil);
   CdsPTSel          := TClientDataSet.Create(nil);
   CdsCampoSel       := TClientDataSet.Create(nil);

   CdsParamOrc       := TClientDataSet.Create(nil);
   // FIM André Pontes - pendência 10065 - 24/09/2003


   memStatus         := TMemo.Create(nil);
   AtualizarLog      := False;
end;



procedure TCtrlCadContasOrcPorGrupo.DoChangeDataBase;
begin
   inherited;
   dbDataView.DatabaseName := DataBaseName;
end;



constructor TCtrlCadContasOrcPorGrupo.Create;
begin
   inherited;

   dbDataView        := TdbDataView.Create(Self);

   cdsCodigo         := TClientDataSet.Create(nil);
   cdsExiste         := TClientDataSet.Create(nil);

   CdsConta          := TClientDataSet.Create(nil);
   CdsDataView       := TClientDataSet.Create(nil);

   // André Pontes - pendência 10065 - 06/10/2003
   cdsContaEspelho   := TClientDataSet.Create(nil);
   cdsContanova      := TClientDataSet.Create(nil);
   // FIM André Pontes - pendência 10065 - 06/10/2003

   AtualizarLog := True;
end;



destructor TCtrlCadContasOrcPorGrupo.Destroy;
begin
   inherited;

   CdsConta.Free;
   CdsDataView.Free;

   // André Pontes - pendência 10065 - 06/10/2003
   cdsContaEspelho.Free;
   cdsContanova.Free;
   // FIM André Pontes - pendência 10065 - 06/10/2003


   if (isAppServer) then
   begin
      FreeCds([CdsCentroDeCusto,
               CdsAtivProj,
               CdsPatro,
               CdsPlanoPrev,
               CdsGrupoOrc,
               CdsBase,
               CdsOrigem,
               CdsCRSel,
               CdsCCSel,
               CdsAPSel,
               CdsPPSel,
               CdsPTSel,
               CdsCampoSel,
               CdsParamOrc,
               cdsCodigo,
               cdsExiste]
             );

      memStatus.Free;
   end;
end;



// -------------------------------------------------------------------------------------------------
function TCtrlCadContasOrcPorGrupo.ListaGrupoOrc : OleVariant;
var
   SqlLocal : TStringList;
begin
   SqlLocal := TStringList.Create;
   try
      SqlLocal.Add('SELECT');
      SqlLocal.Add('  NOMEGRUPOORCAMEN AS NOME, IDGRUPOORCAMEN,');
      SqlLocal.Add('  FLGANALSINT,    CODGRUPOORC,');
      SqlLocal.Add('  FLGSINALGRUPO');
      SqlLocal.Add('FROM');
      SqlLocal.Add('  GRUPOORCAMEN');
      SqlLocal.Add('ORDER BY');
      SqlLocal.Add('  NOME');

      Result := GetDataPacket(SqlLocal.Text);
   except
      on E:Exception do MessageInfo := E.Message;
   end;
   SqlLocal.Free;
end;



// André Pontes - pendência 10065 - 01/10/2003
function TCtrlCadContasOrcPorGrupo.ListaCentRespon(const iTipo     : Integer = 0;
                                                   const iPlanoOrc : Integer = 0;
                                                   const iGrupoOrc : Integer = 0
                                                  ): OleVariant;
var
   sSQL : String;
begin
   try
      sSQL :=
      'SELECT '                                                            + #13 +
      '   NOME AS NOME, CODCENTRORESPON, CODEXTERNO '                      + #13 +
      'FROM '                                                              + #13 +
      '   CENTRESPON '                                                     + #13 +
      'WHERE '                                                             + #13 +
      '       IDPESSOA        = ' + FloatToStr(pIdEmpresa)                 + #13 +
      // Andre Pontes - pendência 15805 - 15/12/2003
      '   AND IDPLANCRESPON   = (SELECT IDPLANCRESPON FROM PARAMGLOBAL) '  + #13 +
      // FIM Andre Pontes - pendência 15805 - 15/12/2003
      '   AND ANALITICOSINTET = ''A'' '                                    + #13 +
      '   AND ATIVO           = ''S'' '                                    + #13;

//    0: Todos
//    1: Apenas os que AINDA não estiverem utilizados por contas orçamentárias (p/ inserção)
//    2: Apenas os que Já        estiverem utilizados por contas orçamentárias (p/ alteração)

      case iTipo of

         1: sSQL := sSQL +
      '   AND CODCENTRORESPON NOT IN '                            + #13 +
      '       ( '                                                 + #13 +
      '       SELECT '                                            + #13 +
      '          CODCENTRORESPON '                                + #13 +
      '       FROM '                                              + #13 +
      '          CONTASORCAMEN '                                  + #13 +
      '       WHERE '                                             + #13 +
      '              IDPLANOORCAMEN = ' + IntToStr(iPlanoOrc)     + #13 +
      '          AND IDGRUPOORCAMEN = ' + IntToStr(iGrupoOrc)     + #13 +
      '          AND IDPESSOA       = ' + FloatToStr(pIdEmpresa)  + #13 +
      '       ) '                                                 + #13;

         2: sSQL := sSQL +
      '   AND CODCENTRORESPON IN '                                + #13 +
      '       ( '                                                 + #13 +
      '       SELECT '                                            + #13 +
      '          CODCENTRORESPON  '                               + #13 +
      '       FROM '                                              + #13 +
      '          CONTASORCAMEN '                                  + #13 +
      '       WHERE '                                             + #13 +
      '              IDPLANOORCAMEN = ' + IntToStr(iPlanoOrc)     + #13 +
      '          AND IDGRUPOORCAMEN = ' + IntToStr(iGrupoOrc)     + #13 +
      '          AND IDPESSOA       = ' + FloatToStr(pIdEmpresa)  + #13 +
      '       ) '                                                 + #13;
      end;

      sSQL := sSQL +
      'ORDER BY '                                                 + #13 +
      '   NOME ';

      Result := GetDataPacket(sSQL);

   except
      on E:Exception do MessageInfo := E.Message;
   end;
end;



function TCtrlCadContasOrcPorGrupo.ListaCentroDeCusto(const iTipo     : Integer = 0;
                                                      const iPlanoOrc : Integer = 0;
                                                      const iGrupoOrc : Integer = 0
                                                     ): OleVariant;
var
   sSQL : String;
begin
   try
      sSQL :=
      'SELECT '                                                            + #13 +
      '   NOME AS NOME, CODCENTROCUSTO, CODEXTERNO '                       + #13 +
      'FROM '                                                              + #13 +
      '   CENTCUST '                                                       + #13 +
      'WHERE '                                                             + #13 +
      '       IDEMPRESA       = ' + FloatToStr(pIdEmpresa)                 + #13 +
      // Andre Pontes - pendência 15805 - 15/12/2003
      '   AND IDPLANCENTCUST  = (SELECT IDPLANCENTCUST FROM PARAMGLOBAL) ' + #13 +
      // FIM Andre Pontes - pendência 15805 - 15/12/2003
      '   AND STATUSGRUPOCDC  = ''A'' '                                    + #13 +
      '   AND ATIVO           = ''S'' '                                    + #13;

//    0: Todos
//    1: Apenas os que AINDA não estiverem utilizados por contas orçamentárias (p/ inserção)
//    2: Apenas os que Já        estiverem utilizados por contas orçamentárias (p/ alteração)

      case iTipo of

         1: sSQL := sSQL +
      '   AND CODCENTROCUSTO  NOT IN '                            + #13 +
      '       ( '                                                 + #13 +
      '       SELECT '                                            + #13 +
      '          CODCENTROCUSTO '                                 + #13 +
      '       FROM '                                              + #13 +
      '          CONTASORCAMEN '                                  + #13 +
      '       WHERE '                                             + #13 +
      '              IDPLANOORCAMEN = ' + IntToStr(iPlanoOrc)     + #13 +
      '          AND IDGRUPOORCAMEN = ' + IntToStr(iGrupoOrc)     + #13 +
      '          AND IDEMPRESA      = ' + FloatToStr(pIdEmpresa)  + #13 +
      '       ) '                                                 + #13;

         2: sSQL := sSQL +
      '   AND CODCENTROCUSTO  IN '                                + #13 +
      '       ( '                                                 + #13 +
      '       SELECT '                                            + #13 +
      '          CODCENTROCUSTO '                                 + #13 +
      '       FROM '                                              + #13 +
      '          CONTASORCAMEN '                                  + #13 +
      '       WHERE '                                             + #13 +
      '              IDPLANOORCAMEN = ' + IntToStr(iPlanoOrc)     + #13 +
      '          AND IDGRUPOORCAMEN = ' + IntToStr(iGrupoOrc)     + #13 +
      '          AND IDEMPRESA      = ' + FloatToStr(pIdEmpresa)  + #13 +
      '       ) '                                                 + #13;
      end;

      sSQL := sSQL +
      'ORDER BY '                                                 + #13 +
      '   NOME ';

      Result := GetDataPacket(sSQL);

   except
      on E:Exception do MessageInfo := E.Message;
   end;
end;



function TCtrlCadContasOrcPorGrupo.ListaAtivProj(const iTipo     : Integer = 0;
                                                 const iPlanoOrc : Integer = 0;
                                                 const iGrupoOrc : Integer = 0
                                                ): OleVariant;
var
   sSQL : String;
begin
   try
      sSQL :=
      'SELECT '                                                   + #13 +
      '   NOME AS NOME, UNIDNEGOC, UNETIPO, UNECODIGO '           + #13 +
      'FROM '                                                     + #13 +
      '   UNIDNEGOCIO '                                           + #13 +
      'WHERE '                                                    + #13 +
      '       IDPESSOA = ' + FloatToStr(pIdEmpresa)               + #13 +
      '   AND UNETIPO  = ''A'' '                                  + #13;

//    0: Todos
//    1: Apenas os que AINDA não estiverem utilizados por contas orçamentárias (p/ inserção)
//    2: Apenas os que Já        estiverem utilizados por contas orçamentárias (p/ alteração)

      case iTipo of

         1: sSQL := sSQL +
      '   AND UNIDNEGOC NOT IN '                                  + #13 +
      '       ( '                                                 + #13 +
      '       SELECT '                                            + #13 +
      '          UNIDNEGOC '                                      + #13 +
      '       FROM '                                              + #13 +
      '          CONTASORCAMEN '                                  + #13 +
      '       WHERE '                                             + #13 +
      '              IDPLANOORCAMEN = ' + IntToStr(iPlanoOrc)     + #13 +
      '          AND IDGRUPOORCAMEN = ' + IntToStr(iGrupoOrc)     + #13 +
      '          AND IDPESSOA       = ' + FloatToStr(pIdEmpresa)  + #13 +
      '       ) '                                                 + #13;

         2: sSQL := sSQL +
      '   AND UNIDNEGOC IN '                                      + #13 +
      '       ( '                                                 + #13 +
      '       SELECT '                                            + #13 +
      '          UNIDNEGOC '                                      + #13 +
      '       FROM '                                              + #13 +
      '          CONTASORCAMEN '                                  + #13 +
      '       WHERE '                                             + #13 +
      '              IDPLANOORCAMEN = ' + IntToStr(iPlanoOrc)     + #13 +
      '          AND IDGRUPOORCAMEN = ' + IntToStr(iGrupoOrc)     + #13 +
      '          AND IDPESSOA       = ' + FloatToStr(pIdEmpresa)  + #13 +
      '       ) '                                                 + #13;
      end;

      sSQL := sSQL +
      'ORDER BY '                                                 + #13 +
      '   NOME ';

      Result := GetDataPacket(sSQL);

   except
      on E:Exception do MessageInfo := E.Message;
   end;
end;



function TCtrlCadContasOrcPorGrupo.ListaPlanoPrev(const iTipo     : Integer = 0;
                                                  const iPlanoOrc : Integer = 0;
                                                  const iGrupoOrc : Integer = 0
                                                 ): OleVariant;
var
   sSQL : String;
begin
   try
      sSQL :=
      'SELECT '                                                   + #13 +
      '   NOME AS NOME, IDPLANOPREV, CODORCAMENTO '               + #13 +
      'FROM '                                                     + #13 +
      '   PLANPREVCONTABIL '                                      + #13;

//    0: Todos
//    1: Apenas os que AINDA não estiverem utilizados por contas orçamentárias (p/ inserção)
//    2: Apenas os que Já        estiverem utilizados por contas orçamentárias (p/ alteração)

      case iTipo of

         1: sSQL := sSQL +
      'WHERE '                                                    + #13 +
      '   IDPLANOPREV NOT IN '                                    + #13 +
      '       ( '                                                 + #13 +
      '       SELECT '                                            + #13 +
      '          IDPLANOPREV '                                    + #13 +
      '       FROM '                                              + #13 +
      '          CONTASORCAMEN '                                  + #13 +
      '       WHERE '                                             + #13 +
      '              IDPLANOORCAMEN = ' + IntToStr(iPlanoOrc)     + #13 +
      '          AND IDGRUPOORCAMEN = ' + IntToStr(iGrupoOrc)     + #13 +
      '          AND IDPESSOA       = ' + FloatToStr(pIdEmpresa)  + #13 +
      '       ) '                                                 + #13;

         2: sSQL := sSQL +
      'WHERE '                                                    + #13 +
      '   IDPLANOPREV IN '                                        + #13 +
      '       ( '                                                 + #13 +
      '       SELECT '                                            + #13 +
      '          IDPLANOPREV '                                    + #13 +
      '       FROM '                                              + #13 +
      '          CONTASORCAMEN '                                  + #13 +
      '       WHERE '                                             + #13 +
      '              IDPLANOORCAMEN = ' + IntToStr(iPlanoOrc)     + #13 +
      '          AND IDGRUPOORCAMEN = ' + IntToStr(iGrupoOrc)     + #13 +
      '          AND IDPESSOA       = ' + FloatToStr(pIdEmpresa)  + #13 +
      '       ) '                                                 + #13;
      end;

      sSQL := sSQL +
      'ORDER BY '                                                 + #13 +
      '   NOME ';

      Result := GetDataPacket(sSQL);
   except
      on E:Exception do MessageInfo := E.Message;
   end;
end;



function TCtrlCadContasOrcPorGrupo.ListaPatro(const iTipo     : Integer = 0;
                                              const iPlanoOrc : Integer = 0;
                                              const iGrupoOrc : Integer = 0
                                             ): OleVariant;
var
   sSQL : String;
begin
   try
      sSQL :=
      'SELECT '                                                   + #13 +
      '   P.NOME AS NOME, PT.IDPESSOA, PT.CODORCAMENTO '          + #13 +
      'FROM '                                                     + #13 +
      '   PESSOA P, '                                             + #13 +
      '   PATRO  PT '                                             + #13 +
      'WHERE '                                                    + #13 +
      '      P.IDPESSOA   = PT.IDPESSOA '                         + #13;

//    0: Todos
//    1: Apenas os que AINDA não estiverem utilizados por contas orçamentárias (p/ inserção)
//    2: Apenas os que Já        estiverem utilizados por contas orçamentárias (p/ alteração)

      case iTipo of

         1: sSQL := sSQL +
      '   AND PT.IDPESSOA NOT IN '                                + #13 +
      '       ( '                                                 + #13 +
      '       SELECT '                                            + #13 +
      '          IDPATRO '                                        + #13 +
      '       FROM '                                              + #13 +
      '          CONTASORCAMEN '                                  + #13 +
      '       WHERE '                                             + #13 +
      '              IDPLANOORCAMEN = ' + IntToStr(iPlanoOrc)     + #13 +
      '          AND IDGRUPOORCAMEN = ' + IntToStr(iGrupoOrc)     + #13 +
      '          AND IDPESSOA       = ' + FloatToStr(pIdEmpresa)  + #13 +
      '       ) '                                                 + #13;

         2: sSQL := sSQL +
      '   AND PT.IDPESSOA IN '                                    + #13 +
      '       ( '                                                 + #13 +
      '       SELECT '                                            + #13 +
      '          IDPATRO '                                        + #13 +
      '       FROM '                                              + #13 +
      '          CONTASORCAMEN '                                  + #13 +
      '       WHERE '                                             + #13 +
      '              IDPLANOORCAMEN = ' + IntToStr(iPlanoOrc)     + #13 +
      '          AND IDGRUPOORCAMEN = ' + IntToStr(iGrupoOrc)     + #13 +
      '          AND IDPESSOA       = ' + FloatToStr(pIdEmpresa)  + #13 +
      '       ) '                                                 + #13;
      end;

      sSQL := sSQL +
      'ORDER BY '                                                 + #13 +
      '   NOME ';

      Result := GetDataPacket(sSQL);
   except
      on E:Exception do MessageInfo := E.Message;
   end;
end;
// FIM André Pontes - pendência 10065 - 01/10/2003




procedure TCtrlCadContasOrcPorGrupo.BuscaContas(pLogar : Boolean);
var
   sqlLocal : TStringList;
begin
   sqlLocal := TStringList.Create;
   try
     if (pLogar) then GravaLog(' Selecionando contas');

     sqlLocal.Clear;
     sqlLocal.Add('SELECT');
     sqlLocal.Add('  IDCONTAORCAMEN, NOMECONTAORCAMEN, IDDATAVIEW');
     sqlLocal.Add('FROM');
     sqlLocal.Add('  CONTASORCAMEN');
     sqlLocal.Add('WHERE');

     if (CdsBase.FieldByName('BASGRUP').AsString <> '') then sqlLocal.Add('  IDGRUPOORCAMEN = ' + Trim(CdsBase.FieldByName('BASGRUP').AsString) + ' AND')  ;
     if (CdsBase.FieldByName('BASCENT').AsString <> '') then sqlLocal.Add('  CODCENTROCUSTO = ' + QuotedStr(CdsBase.FieldByName('BASCENT').AsString) + ' AND')  ;
     if (CdsBase.FieldByName('BASATIV').AsString <> '') then sqlLocal.Add('  UNIDNEGOC      = ' + Trim(CdsBase.FieldByName('BASATIV').AsString) + ' AND')  ;
     if (CdsBase.FieldByName('BASPLAN').AsString <> '') then sqlLocal.Add('  IDPLANOPREV    = ' + Trim(CdsBase.FieldByName('BASPLAN').AsString) + ' AND')  ;
     if (CdsBase.FieldByName('BASPATR').AsString <> '') then sqlLocal.Add('  IDPATRO        = ' + Trim(CdsBase.FieldByName('BASPATR').AsString) + ' AND')  ;

     sqlLocal.Add('  IDPLANOORCAMEN = ' + FloatToStr(pPlano));
     sqlLocal.Add('ORDER BY');
     sqlLocal.Add('  IDCONTAORCAMEN');

     CdsConta.Close;
     CdsConta.Data := GetDataPacket(sqlLocal.Text);
   finally
      sqlLocal.Free;
   end;
end;



function TCtrlCadContasOrcPorGrupo.Exclusao: Boolean;
var
   sqlLocal    : TStringList;
   Atualizados : Integer;
begin
   MessageInfo := '';

   Atualizados := 0;

   sqlLocal := TStringList.Create;
   try
      GravaLog('- Exclusão - iniciando');

      StartTransaction;

      CdsBase.First;
      while not(CdsBase.EOF) and (memStatus.Tag = 0) do
      begin
         //-----------------------------
         BuscaContas(True);     // Busca os contas orçamentárias para o registro atual do cdsbase

         while not(CdsConta.EOF) and (memStatus.Tag = 0) do
         begin
            GravaLog('  Conta - ' + CdsConta.FieldByName('IDCONTAORCAMEN').AsString);

            sqlLocal.Clear;
            sqlLocal.Add('DELETE FROM');
            sqlLocal.Add('  SALDOORCADO');
            sqlLocal.Add('WHERE');
            sqlLocal.Add('  IDPESSOA       = ' + FloatToStr(pIdEmpresa) + ' AND');
            sqlLocal.Add('  IDPLANOORCAMEN = ' + FloatToStr(pPlano) + ' AND');
            sqlLocal.Add('  IDCONTAORCAMEN = ' + QuotedStr(CdsConta.FieldByName('IDCONTAORCAMEN').AsString));
            AtualizaTabela(sqlLocal.Text);

            sqlLocal.Clear;
            sqlLocal.Add('DELETE FROM');
            sqlLocal.Add('  COMPCONTASORCAMEN');
            sqlLocal.Add('WHERE');
            sqlLocal.Add('  IDPESSOA       = ' + FloatToStr(pIdEmpresa) + ' AND');
            sqlLocal.Add('  IDPLANOORCAMEN = ' + FloatToStr(pPlano) + ' AND');
            sqlLocal.Add('  IDCONTAORCAMEN = ' + QuotedStr(CdsConta.FieldByName('IDCONTAORCAMEN').AsString));
            AtualizaTabela(sqlLocal.Text);

            sqlLocal.Clear;
            sqlLocal.Add('DELETE FROM');
            sqlLocal.Add('  CONTASORCAMEN');
            sqlLocal.Add('WHERE');
            sqlLocal.Add('  IDPESSOA       = ' + FloatToStr(pIdEmpresa) + ' AND');
            sqlLocal.Add('  IDPLANOORCAMEN = ' + FloatToStr(pPlano) + ' AND');
            sqlLocal.Add('  IDCONTAORCAMEN = ' + QuotedStr(CdsConta.FieldByName('IDCONTAORCAMEN').AsString));
            AtualizaTabela(sqlLocal.Text);

            Inc (Atualizados);
            CdsConta.Next;
         end;
         CdsBase.Next;
      end;

      MessageInfo := MessageInfo + 'Foram excluídas ' + IntToStr(Atualizados) + ' contas orçamentárias' + #13 + #10 +
                     ' Exclusão concluída';

      GravaLog(' ' + MessageInfo);

      Result := True;

   except
      on E:Exception do
      begin
         Result := False;
         Rollback;
         MessageInfo := MessageInfo + E.Message;
         GravaLog(' ' + MessageInfo);
      end;
   end;
   sqllocal.Free;
end;



function TCtrlCadContasOrcPorGrupo.Alteracao(edtContaText  : String;
                                             cboCampoValue : String
                                            ): Boolean;
begin
   if      (cboCampoValue = 'TRS') then Result := AlteraCampo(edtContaText, ['TIPOCALCREALIZADO'], cboCampoValue)
   else if (cboCampoValue = 'TOS') then Result := AlteraCampo(edtContaText, ['TIPOCALCORCADO'], cboCampoValue)
   else if (cboCampoValue = 'SCS') then Result := AlteraCampo(edtContaText, ['FLGSINALCONTA'], cboCampoValue)
   else if (cboCampoValue = 'VAS') then Result := AlteraCampo(edtContaText, ['FLGACUMULADO'], cboCampoValue)
   else if (cboCampoValue = 'DID') then Result := AlteraCampo(edtContaText, ['DATAINATIVA'], cboCampoValue)
   else if (cboCampoValue = 'DRD') then Result := AlteraCampo(edtContaText, ['DATAATIVA'], cboCampoValue)
   else if (cboCampoValue = 'CIS') then Result := AlteraCampo(edtContaText, ['FLGATIVA'], cboCampoValue)
   else if (cboCampoValue = 'OMS') then Result := AlteraCampo(edtContaText, ['FLGCONTAMONETARIA'], cboCampoValue)
   else if (cboCampoValue = 'EES') then Result := AlteraCampo(edtContaText, ['FLGTRANSFSALDO'], cboCampoValue)
   else if (cboCampoValue = 'FAS') then Result := AlteraCampo(edtContaText, ['FORMULAORCADO', 'FORMULAREALIZADO'], cboCampoValue)
   else if (cboCampoValue = 'FIF') then Result := AlteraCampo(edtContaText, ['VLRINFORMADOORC', 'VLRINFORMADOREAL'], cboCampoValue)
   else if (cboCampoValue = 'OBS') then Result := AlteraCampo(edtContaText, ['OBSERVACAO'], cboCampoValue)
   else if (cboCampoValue = 'CRS') then Result := AlteraCampo(edtContaText, ['CODCENTRORESPon'], cboCampoValue)
   else if (cboCampoValue = 'CTL') then Result := AlteraContab(edtContaText)
   else if (cboCampoValue = 'COL') then Result := AlteraContaOrc(edtContaText)
   else if (cboCampoValue = 'CRL') then Result := AlteraContaRea(edtContaText)
   else if (cboCampoValue = 'FCL') then Result := AlteraFluxoCai(edtContaText)
   else if (cboCampoValue = 'CDL') then Result := AlteraCondic(edtContaText)
   else if (cboCampoValue = 'AGL') then Result := AlteraArqGenerico(edtContaText)
   else begin
      Result      := False;
      MessageInfo := 'Campo desconhecido - ' + cboCampoValue;
      GravaLog(' ' + MessageInfo);
   end;
end;



function  TCtrlCadContasOrcPorGrupo.AlteraCampo(pContaOrigem   : String;
                                                pCampos        : array of String;
                                                pcboCampoValue : String
                                               ): Boolean;
var
   sqlLocal    : TStringList;
   Posicao     : Integer;
   Atualizados : Integer;
   Mascara     : String;
   Conteudo    : String;
begin
   MessageInfo := '';

   sqlLocal := TStringList.Create;
   try
      StartTransaction;

      PopulaOrigem(pContaOrigem);

      GravaLog('- Alteração - ' + pcboCampoValue);
      //-------------------------------

      Atualizados := 0;

      CdsBase.First;
      while not(CdsBase.EOF) and (memStatus.Tag = 0) do
      begin
         BuscaContas(True);     // Busca os contas orçamentárias para o registro atual do cdsbase
         //-----------------------------
         while (not CdsConta.EOF) and (memStatus.Tag = 0) do
         begin
            sqlLocal.Clear;
            sqlLocal.Add('UPDATE');
            sqlLocal.Add('  CONTASORCAMEN');
            sqlLocal.Add('SET');

            for Posicao := 0 to Length(pCampos) - 1 do
            begin
               if (pcboCampoValue[3] = 'D') then   // Data
               begin
                  Conteudo := CdsOrigem.FieldByName(pCampos[Posicao]).AsString;

                  if      (Length(Conteudo) <= 10) then Mascara := 'dd/mm/yyyy'
                  else if (Length(Conteudo) <= 16) then Mascara := 'dd/mm/yyyy hh24:mi'
                  else                                  Mascara := 'dd/mm/yyyy hh24:mi:ss';

                  Conteudo := 'TO_DATE(' + QuotedStr(Conteudo) + ', ' + QuotedStr(Mascara) + ')';
               end
               else  // String / Float
               begin
                  Conteudo := QuotedStr(CdsOrigem.FieldByName(pCampos[Posicao]).AsString);
                  Mascara  := '';
               end;

               if (Posicao = (Length(pCampos) - 1)) then
               begin
                  sqlLocal.Add('  ' + pCampos[Posicao] + ' = ' + Conteudo);
               end
               else
               begin
                  sqlLocal.Add('  ' + pCampos[Posicao] + ' = ' + Conteudo + ',');
               end;
            end;

            sqlLocal.Add('WHERE');
            sqlLocal.Add('  IDPESSOA       = ' + FloatToStr(pIdEmpresa) + ' AND');
            sqlLocal.Add('  IDPLANOORCAMEN = ' + FloatToStr(pPlano) + ' AND');
            sqlLocal.Add('  IDCONTAORCAMEN = ' + QuotedStr(CdsConta.FieldByName('IDCONTAORCAMEN').AsString));
            AtualizaTabela(sqlLocal.Text);
            Inc(Atualizados);
            //-----------------------------
            CdsConta.Next;
         end;
         CdsBase.Next;
      end;
      Commit;

      MessageInfo := 'Foram atualizadas ' + IntToStr(Atualizados) + ' contas orçamentárias' + #13 + #10 +
                     ' Alteração concluída';

      GravaLog(' ' + MessageInfo);

      Result := True;
   except
      on E:exception do
      begin
         Result := False;
         Rollback;
         MessageInfo := MessageInfo + #13 + #10 + E.Message;
         GravaLog(' ' + MessageInfo);
      end;
   end;
   sqllocal.Free;
end;



function TCtrlCadContasOrcPorGrupo.AlteraContab(pContaOrigem : String): Boolean;
var
   sqlLocal    : TStringList;
   Atualizados : Integer;
begin
   MessageInfo := '';
   sqlLocal := TStringList.Create;

   try
      GravaLog('- Alteração - CTL');

      StartTransaction;
      //----------------------------- Busca as contas contábeis da conta origem
      GravaLog('  Lendo dados de origem');

      PopulaOrigemContab(pContaOrigem);
      Atualizados := 0;

      CdsBase.First;
      while not(CdsBase.EOF) and (memStatus.Tag = 0) do
      begin
         BuscaContas(True);     // Busca os contas orçamentárias para o registro atual do cdsbase
         //-----------------------------
         while not(CdsConta.EOF) and (memStatus.Tag = 0) do
         begin
            sqlLocal.Clear;
            sqlLocal.Add('DELETE FROM');
            sqlLocal.Add('  COMPCONTASORCAMEN');
            sqlLocal.Add('WHERE');
            sqlLocal.Add('  IDPESSOA       = ' + FloatToStr(pIdEmpresa) + ' AND');
            sqlLocal.Add('  IDPLANOORCAMEN = ' + FloatToStr(pPlano) + ' AND');
            sqlLocal.Add('  IDCONTAORCAMEN = ' + QuotedStr(CdsConta.FieldByName('IDCONTAORCAMEN').AsString) + ' AND');
            sqlLocal.Add('  PLACONTA IS NOT NULL');

            AtualizaTabela(sqlLocal.Text);

            CdsOrigem.First;
            while not(CdsOrigem.EOF) do
            begin
               sqlLocal.Clear;
               sqlLocal.Add('INSERT INTO');
               sqlLocal.Add('  COMPCONTASORCAMEN');
               sqlLocal.Add('  (IDCOMPCONTASORC, IDPLANOORCAMEN, IDCONTAORCAMEN,');
               sqlLocal.Add('    IDPESSOA,        IDEMPRESA,');
               sqlLocal.Add('    PLANO,           PLACONTA,       CODCENTROCUSTO,');
               sqlLocal.Add('    UNIDNEGOC,       IDPLANOPREV,    IDPATRO)');
               sqlLocal.Add('  VALUES (');
               sqlLocal.Add('  ' + FloatToStr(GetSequence('COMPCONTASORCAMEN')) + ',');
               sqlLocal.Add('  ' + FloatToStr(pPlano) + ',');
               sqlLocal.Add('  ' + QuotedStr(CdsConta.FieldByName('IDCONTAORCAMEN').AsString) + ',');
               sqlLocal.Add('  ' + FloatToStr(pIdEmpresa) + ',');
               sqlLocal.Add('  ' + FloatToStr(pIdEmpresa) + ',');
               sqlLocal.Add('  ' + FloatToStr(CdsOrigem.FieldByName('PLANO').AsFloat) + ',');
               sqlLocal.Add('  ' + QuotedStr(CdsOrigem.FieldByName('PLACONTA').AsString) + ',');
               sqlLocal.Add('  DECODE(' + QuotedStr(CdsOrigem.FieldByName('CODCENTROCUSTO').AsString) + ', 0, NULL, ' +
                                            QuotedStr(CdsOrigem.FieldByName('CODCENTROCUSTO').AsString)+ '),');
               sqlLocal.Add('  DECODE(' + FloatToStr(CdsOrigem.FieldByName('UNIDNEGOC').AsFloat) + ', 0, NULL, ' +
                                            FloatToStr(CdsOrigem.FieldByName('UNIDNEGOC').AsFloat)+ '),');
               sqlLocal.Add('  DECODE(' + FloatToStr(CdsOrigem.FieldByName('IDPLANOPREV').AsFloat) + ', 0, NULL, ' +
                                            FloatToStr(CdsOrigem.FieldByName('IDPLANOPREV').AsFloat)+ '),');
               sqlLocal.Add('  DECODE(' + FloatToStr(CdsOrigem.FieldByName('IDPATRO').AsFloat) + ', 0, NULL, ' +
                                            FloatToStr(CdsOrigem.FieldByName('IDPATRO').AsFloat)+ '))');

               AtualizaTabela(sqlLocal.Text);
               //-----------------------------
               CdsOrigem.Next;
            end;
            Inc(Atualizados);
            CdsConta.Next;
         end;
         CdsBase.Next;
      end;

      Commit;

      MessageInfo := 'Foram atualizadas ' + IntToStr(Atualizados) + ' contas orçamentárias' + #13 + #10 +
                     ' Alteração concluída';
      Result := True;

      GravaLog(' ' + MessageInfo);
   except
      on E:exception do
      begin
         Result := False;
         Rollback;
         MessageInfo := MessageInfo + #13 + #10 + E.Message;
         GravaLog(' ' + MessageInfo);
      end;
   end;
   sqllocal.Free;
end;



function TCtrlCadContasOrcPorGrupo.AlteraContaOrc(pContaOrigem : String): Boolean;
var
   sqlLocal    : TStringList;
   Atualizados : Integer;
begin
   MessageInfo := '';

   sqlLocal := TStringList.Create;

   try
      GravaLog('- Alteração - COL');

      StartTransaction;

      //----------------------------- Busca as contas de orçado da conta origem
      GravaLog(' Lendo dados de origem');

      PopulaOrigemContaOrc(pContaOrigem);

      Atualizados := 0;

      CdsBase.First;
      while not(CdsBase.EOF) and (memStatus.Tag = 0) do
      begin
         BuscaContas(True);     // Busca os contas orçamentárias para o registro atual do cdsbase
         //-----------------------------
         while not(CdsConta.EOF) and (memStatus.Tag = 0) do
         begin
            sqlLocal.Clear;
            sqlLocal.Add('DELETE FROM');
            sqlLocal.Add('  COMPCONTASORCAMEN');
            sqlLocal.Add('WHERE');
            sqlLocal.Add('  IDPLANOORCAMEN = ' + FloatToStr(pPlano) + ' AND');
            sqlLocal.Add('  IDCONTAORCAMEN = ' + QuotedStr(CdsConta.FieldByName('IDCONTAORCAMEN').AsString) + ' AND');
            sqlLocal.Add('  IDCONTAREFORCADO IS not NULL');

            AtualizaTabela(sqlLocal.Text);

            CdsOrigem.First;
            while not(CdsOrigem.EOF) do
            begin
               sqlLocal.Clear;
               sqlLocal.Add('INSERT INTO');
               sqlLocal.Add('  COMPCONTASORCAMEN');
               sqlLocal.Add('  (IDCOMPCONTASORC,  IDPLANOORCAMEN, IDCONTAORCAMEN,');
               sqlLocal.Add('    IDCONTAREFORCADO, PERCCONTAREFORC)');
               sqlLocal.Add('  VALUES (');
               sqlLocal.Add('  ' + FloatToStr(GetSequence('COMPCONTASORCAMEN')) + ',');
               sqlLocal.Add('  ' + FloatToStr(pPlano) + ',');
               sqlLocal.Add('  ' + QuotedStr(CdsConta.FieldByName('IDCONTAORCAMEN').AsString) + ',');
               sqlLocal.Add('  DECODE(' + QuotedStr(CdsOrigem.FieldByName('IDCONTAREFORCADO').AsString) + ', 0, NULL, ' +
                                            QuotedStr(CdsOrigem.FieldByName('IDCONTAREFORCADO').AsString)+ '),');
               sqlLocal.Add('  ' + FloatToStr(CdsOrigem.FieldByName('PERCCONTAREFORC').AsFloat) + ')');

               AtualizaTabela(sqlLocal.Text);
               //-----------------------------
               CdsOrigem.Next;
            end;
            Inc(Atualizados);
            CdsConta.Next;
         end;
         CdsBase.Next;
      end;

      Commit;

      MessageInfo := 'Foram atualizadas ' + IntToStr(Atualizados) + ' contas orçamentárias' + #13 + #10 +
                     ' Alteração concluída';
      Result := True;

      GravaLog(' ' + MessageInfo);
   except
      on E:exception do
      begin
        Result := False;
        Rollback;
        MessageInfo := MessageInfo + #13 + #10 + E.Message;
        GravaLog(' ' + MessageInfo);
      end;
   end;
   sqllocal.Free;
end;



function TCtrlCadContasOrcPorGrupo.AlteraContaRea(pContaOrigem : String): Boolean;
var
   sqlLocal    : TStringList;
   Atualizados : Integer;
begin
   MessageInfo := '';
   sqlLocal := TStringList.Create;

   try
      GravaLog('- Alteração - CRL');

      StartTransaction;

      //----------------------------- Busca as contas de realizado da conta origem
      GravaLog('  Lendo dados de origem');

      PopulaOrigemContaRea(pContaOrigem);

      Atualizados := 0;

      CdsBase.First;
      while not(CdsBase.EOF) and (memStatus.Tag = 0) do
      begin
         BuscaContas(True);     // Busca os contas orçamentárias para o registro atual do cdsbase
         //-----------------------------
         while not(CdsConta.EOF) and (memStatus.Tag = 0) do
         begin
            sqlLocal.Clear;
            sqlLocal.Add('DELETE FROM');
            sqlLocal.Add('  COMPCONTASORCAMEN');
            sqlLocal.Add('WHERE');
            sqlLocal.Add('  IDPLANOORCAMEN = ' + FloatToStr(pPlano) + ' AND');
            sqlLocal.Add('  IDCONTAORCAMEN = ' + QuotedStr(CdsConta.FieldByName('IDCONTAORCAMEN').AsString) + ' AND');
            sqlLocal.Add('  IDCONTAREFREAL IS NOT NULL');
            AtualizaTabela(sqlLocal.Text);

            CdsOrigem.First;
            while not(CdsOrigem.EOF) do
            begin
               sqlLocal.Clear;
               sqlLocal.Add('INSERT INTO');
               sqlLocal.Add('  COMPCONTASORCAMEN');
               sqlLocal.Add('  (IDCOMPCONTASORC,  IDPLANOORCAMEN, IDCONTAORCAMEN,');
               sqlLocal.Add('    IDCONTAREFREAL, PERCCONTAREFREA)');
               sqlLocal.Add('  VALUES (');
               sqlLocal.Add('  ' + FloatToStr(GetSequence('COMPCONTASORCAMEN')) + ',');
               sqlLocal.Add('  ' + FloatToStr(pPlano) + ',');
               sqlLocal.Add('  ' + QuotedStr(CdsConta.FieldByName('IDCONTAORCAMEN').AsString) + ',');
               sqlLocal.Add('  DECODE(' + QuotedStr(CdsOrigem.FieldByName('IDCONTAREFREAL').AsString) + ', 0, NULL, ' +
                                            QuotedStr(CdsOrigem.FieldByName('IDCONTAREFREAL').AsString)+ '),');
               sqlLocal.Add('  ' + FloatToStr(CdsOrigem.FieldByName('PERCCONTAREFREA').AsFloat) + ')');

               AtualizaTabela(sqlLocal.Text);
               //-----------------------------
               CdsOrigem.Next;
            end;
            Inc(Atualizados);
            CdsConta.Next;
         end;
         CdsBase.Next;
      end;

      Commit;

      MessageInfo := 'Foram atualizadas ' + IntToStr(Atualizados) + ' contas orçamentárias' + #13 + #10 +
                     ' Alteração concluída';
      Result := True;

      GravaLog(' ' + MessageInfo);
   except
      on E:exception do
      begin
        Result := False;
        Rollback;
        MessageInfo := MessageInfo + #13 + #10 + E.Message;
        GravaLog(' ' + MessageInfo);
      end;
   end;
   sqllocal.Free;
end;



function TCtrlCadContasOrcPorGrupo.AlteraFluxoCai(pContaOrigem : String): Boolean;
var
   sqlLocal    : TStringList;
   Atualizados : Integer;
begin
   MessageInfo := '';
   sqlLocal    := TStringList.Create;

   try
      GravaLog('- Alteração - FCL');

      StartTransaction;

      //----------------------------- Busca as contas de fluxo de caixa da conta origem
      GravaLog('  Lendo dados de origem');
      PopulaOrigemFluxoCai(pContaOrigem);
      Atualizados := 0;
      CdsBase.First;

      while not(CdsBase.EOF) and (memStatus.Tag = 0) do
      begin

         BuscaContas(True);     // Busca os contas orçamentárias para o registro atual do cdsbase
         //-----------------------------
         while not(CdsConta.EOF) and (memStatus.Tag = 0) do
         begin
            sqlLocal.Clear;
            sqlLocal.Add('DELETE FROM');
            sqlLocal.Add('  COMPCONTASORCAMEN');
            sqlLocal.Add('WHERE');
            sqlLocal.Add('  IDPLANOORCAMEN = ' + FloatToStr(pPlano) + ' AND');
            sqlLocal.Add('  IDCONTAORCAMEN = ' + QuotedStr(CdsConta.FieldByName('IDCONTAORCAMEN').AsString) + ' AND');
            sqlLocal.Add('  CODTIPRECDES IS NOT NULL');
            AtualizaTabela(sqlLocal.Text);

            CdsOrigem.First;
            while not(CdsOrigem.EOF) do
            begin
               sqlLocal.Clear;
               sqlLocal.Add('INSERT INTO');
               sqlLocal.Add('  COMPCONTASORCAMEN');
               sqlLocal.Add('  (IDCOMPCONTASORC, IDPLANOORCAMEN, IDCONTAORCAMEN,');
               sqlLocal.Add('    CODTIPRECDES,    RECPAG,         CODCENTRORESPON,');
               sqlLocal.Add('    IDPLANOPREV,     IDPATRO,        UNIDNEGOC,');
               sqlLocal.Add('    CODCENTROCUSTO,  IDPESSOA,        IDEMPRESA)');
               sqlLocal.Add('  VALUES (');
               sqlLocal.Add('  ' + FloatToStr(GetSequence('COMPCONTASORCAMEN')) + ',');
               sqlLocal.Add('  ' + FloatToStr(pPlano) + ',');
               sqlLocal.Add('  ' + QuotedStr(CdsConta.FieldByName('IDCONTAORCAMEN').AsString) + ',');
               sqlLocal.Add('  DECODE(' + QuotedStr(CdsOrigem.FieldByName('CODTIPRECDES').AsString) + ', '''', NULL, ' +
                                            QuotedStr(CdsOrigem.FieldByName('CODTIPRECDES').AsString)+ '),');
               sqlLocal.Add('  DECODE(' + QuotedStr(CdsOrigem.FieldByName('RECPAG').AsString) + ', '''', NULL, ' +
                                            QuotedStr(CdsOrigem.FieldByName('RECPAG').AsString)+ '),');
               sqlLocal.Add('  DECODE(' + QuotedStr(CdsOrigem.FieldByName('CODCENTRORESPon').AsString) + ', '''', NULL, ' +
                                            QuotedStr(CdsOrigem.FieldByName('CODCENTRORESPon').AsString)+ '),');
               sqlLocal.Add('  DECODE(' + FloatToStr(CdsOrigem.FieldByName('IDPLANOPREV').AsFloat) + ', 0, NULL, ' +
                                            FloatToStr(CdsOrigem.FieldByName('IDPLANOPREV').AsFloat)+ '),');
               sqlLocal.Add('  DECODE(' + FloatToStr(CdsOrigem.FieldByName('IDPATRO').AsFloat) + ', 0, NULL, ' +
                                            FloatToStr(CdsOrigem.FieldByName('IDPATRO').AsFloat)+ '),');
               sqlLocal.Add('  DECODE(' + FloatToStr(CdsOrigem.FieldByName('UNIDNEGOC').AsFloat) + ', 0, NULL, ' +
                                            FloatToStr(CdsOrigem.FieldByName('UNIDNEGOC').AsFloat)+ '),');
               sqlLocal.Add('  DECODE(' + QuotedStr(CdsOrigem.FieldByName('CODCENTROCUSTO').AsString) + ', 0, NULL, ' +
                                            QuotedStr(CdsOrigem.FieldByName('CODCENTROCUSTO').AsString)+ '),');
               sqlLocal.Add('  DECODE(' + FloatToStr(pIdEmpresa ) + ', 0, NULL, ' +
                                            FloatToStr(pIdEmpresa)+ '),');
               sqlLocal.Add('  DECODE(' + FloatToStr(pIdEmpresa) + ', 0, NULL, ' +
                                            FloatToStr(pIdEmpresa)+ '))');

               AtualizaTabela(sqlLocal.Text);
               //-----------------------------
               CdsOrigem.Next;
            end;
            Inc(Atualizados);
            CdsConta.Next;
         end;
         CdsBase.Next;
      end;

      Commit;

      MessageInfo := 'Foram atualizadas ' + IntToStr(Atualizados) + ' contas orçamentárias' + #13 + #10 +
                     ' Alteração concluída';
      Result := True;

      GravaLog(' ' + MessageInfo);

   except
      on E:exception do
      begin
        Result := False;
        Rollback;
        MessageInfo := MessageInfo + #13 + #10 + E.Message;
        GravaLog(' ' + MessageInfo);
      end;
   end;
   sqllocal.Free;
end;



function TCtrlCadContasOrcPorGrupo.AlteraCondic(pContaOrigem: String): Boolean;
var
   sqlLocal    : TStringList;
   Atualizados : Integer;
begin
   MessageInfo := '';
   sqlLocal := TStringList.Create;

   try
      GravaLog('- Alteração - CDL');

      StartTransaction;

      //----------------------------- Busca as condições da conta origem
      GravaLog('  Lendo dados de origem');
      PopulaOrigemCondic(pContaOrigem);
      Atualizados := 0;
      CdsBase.First;

      while not(CdsBase.EOF) and (memStatus.Tag = 0) do
      begin
         BuscaContas(True);     // Busca os contas orçamentárias para o registro atual do cdsbase

         //-----------------------------

         while not(CdsConta.EOF) and (memStatus.Tag = 0) do
         begin
            sqlLocal.Clear;
            sqlLocal.Add('DELETE FROM');
            sqlLocal.Add('  COMPCONTASORCAMEN');
            sqlLocal.Add('WHERE');
            sqlLocal.Add('  IDPLANOORCAMEN = ' + FloatToStr(pPlano) + ' AND');
            sqlLocal.Add('  IDCONTAORCAMEN = ' + QuotedStr(CdsConta.FieldByName('IDCONTAORCAMEN').AsString) + ' AND');
            sqlLocal.Add('  IDCONTACONDINI IS NOT NULL');
            AtualizaTabela(sqlLocal.Text);

            CdsOrigem.First;
            while not(CdsOrigem.EOF) and (memStatus.Tag = 0) do
            begin
               sqlLocal.Clear;
               sqlLocal.Add('INSERT INTO');
               sqlLocal.Add('  COMPCONTASORCAMEN');
               sqlLocal.Add('  (IDCOMPCONTASORC, IDPLANOORCAMEN, IDCONTAORCAMEN,');
               sqlLocal.Add('    IDCONTACONDINI,  IDCONTACONDFIM, IDCONTACONDRES,');
               sqlLocal.Add('    TIPOCONDINI,     TIPOCONDRES,    CONDICAO,');
               sqlLocal.Add('    VLRCONDINI,      VLRCONDRES)');
               sqlLocal.Add('  VALUES (');
               sqlLocal.Add('  ' + FloatToStr(GetSequence('COMPCONTASORCAMEN')) + ',');
               sqlLocal.Add('  ' + FloatToStr(pPlano) + ',');
               sqlLocal.Add('  ' + QuotedStr(CdsConta.FieldByName('IDCONTAORCAMEN').AsString) + ',');
               sqlLocal.Add('  DECODE(' + QuotedStr(CdsOrigem.FieldByName('IDCONTACONDINI').AsString) + ', '''', NULL, ' +
                                            QuotedStr(CdsOrigem.FieldByName('IDCONTACONDINI').AsString) + '),');
               sqlLocal.Add('  DECODE(' + QuotedStr(CdsOrigem.FieldByName('IDCONTACONDFIM').AsString) + ', '''', NULL, ' +
                                            QuotedStr(CdsOrigem.FieldByName('IDCONTACONDFIM').AsString) + '),');
               sqlLocal.Add('  DECODE(' + QuotedStr(CdsOrigem.FieldByName('IDCONTACONDRES').AsString) + ', '''', NULL, ' +
                                            QuotedStr(CdsOrigem.FieldByName('IDCONTACONDRES').AsString) + '),');
               sqlLocal.Add('  DECODE(' + QuotedStr(CdsOrigem.FieldByName('TIPOCONDINI').AsString) + ', '''', NULL, ' +
                                            QuotedStr(CdsOrigem.FieldByName('TIPOCONDINI').AsString) + '),');
               sqlLocal.Add('  DECODE(' + QuotedStr(CdsOrigem.FieldByName('TIPOCONDRES').AsString) + ', '''', NULL, ' +
                                            QuotedStr(CdsOrigem.FieldByName('TIPOCONDRES').AsString) + '),');
               sqlLocal.Add('  DECODE(' + QuotedStr(CdsOrigem.FieldByName('CONDICAO').AsString) + ', '''', NULL, ' +
                                            QuotedStr(CdsOrigem.FieldByName('CONDICAO').AsString) + '),');
               sqlLocal.Add('  ' + FloatToStr(CdsOrigem.FieldByName('VLRCONDINI').AsFloat) + ',');
               sqlLocal.Add('  ' + FloatToStr(CdsOrigem.FieldByName('VLRCONDRES').AsFloat) + ')');

               AtualizaTabela(sqlLocal.Text);
               //-----------------------------
               CdsOrigem.Next;
            end;
            Inc(Atualizados);
            CdsConta.Next;
         end;
         CdsBase.Next;
      end;

      Commit;

      MessageInfo := 'Foram atualizadas ' + IntToStr(Atualizados) + ' contas orçamentárias' + #13 + #10 +
                     ' Alteração concluída';
      Result := True;
      GravaLog(' ' + MessageInfo);

   except
      on E:exception do
      begin
         Result := False;
         Rollback;
         MessageInfo := MessageInfo + #13 + #10 + E.Message;
         GravaLog(' ' + MessageInfo);
      end;
   end;
   sqllocal.Free;
end;



function TCtrlCadContasOrcPorGrupo.AlteraArqGenerico(pContaOrigem: String): Boolean;
var
  sqlLocal    : TCMSqlParams;
  Atualizados : Integer;
  IdDataView  : Double;
begin
   MessageInfo := '';
   sqlLocal    := TCMSqlParams.Create(nil);
   try
      GravaLog('- Alteração - AGL');

      StartTransaction;

      //----------------------------- Busca o texto de busca da conta origem
      GravaLog('  Lendo dados de origem');
      PopulaOrigemArqGenerico(pContaOrigem);
      Atualizados := 0;
      CdsBase.First;

      while not(CdsBase.EOF) and (memStatus.Tag = 0) do
      begin
         BuscaContas(True);     // Busca os contas orçamentárias para o registro atual do cdsbase
         //-----------------------------

         while not(CdsConta.EOF) and (memStatus.Tag = 0) do
         begin
            if CdsOrigem.IsEmpty then
            begin
               IdDataView := 0;
            end
            else
            begin
               IdDataView := GetSequence('DATAVIEW');

               with CdsDataView do
               begin
                  EmptyDataSet;
                  Append;
                  FieldByName('IDDATAVIEW').AsFloat        := IdDataView;
                  FieldByName('CLASSNAME').AsString        := CdsOrigem.FieldByName('CLASSNAME').AsString;
                  FieldByName('TEMPLATE').AsString         := CdsOrigem.FieldByName('TEMPLATE').AsString;
                  FieldByName('NAME').AsString             := CdsOrigem.FieldByName('NAME').AsString;
                  FieldByName('CLASSDESCRIPTION').AsString := CdsOrigem.FieldByName('CLASSDESCRIPTION').AsString;
                  FieldByName('DESCRIPTION').AsString      := CdsOrigem.FieldByName('DESCRIPTION').AsString;
                  Post;
               end;

               // Transformar este applycds em sql local
               ApplyCds(CdsDataView, dbDataView, [], [])
            end;

            sqlLocal.SQL.Clear;
            sqlLocal.SQL.Add('UPDATE');
            sqlLocal.SQL.Add('  CONTASORCAMEN');
            sqlLocal.SQL.Add('SET');
            sqlLocal.SQL.Add('  IDDATAVIEW = DECODE(' + FloatToStr(IdDataView) + ', 0, NULL, ' +
                                                          FloatToStr(IdDataView) + '),');
            sqlLocal.SQL.Add('  ORIGEMCMDV = ''0''');
            sqlLocal.SQL.Add('WHERE');
            sqlLocal.SQL.Add('  IDPLANOORCAMEN = ' + FloatToStr(pPlano) + ' AND');
            sqlLocal.SQL.Add('  IDCONTAORCAMEN = ' + QuotedStr(CdsConta.FieldByName('IDCONTAORCAMEN').AsString));

            AtualizaTabela(sqlLocal.SQL.Text);

            if not(CdsConta.FieldByName('IDDATAVIEW').IsNull) then
            begin
               sqlLocal.SQL.Clear;
               sqlLocal.SQL.Add('DELETE FROM');
               sqlLocal.SQL.Add('  DATAVIEW');
               sqlLocal.SQL.Add('WHERE');
               sqlLocal.SQL.Add('  IDDATAVIEW = ' + FloatToStr(CdsConta.FieldByName('IDDATAVIEW').AsFloat) + ' AND');
               sqlLocal.SQL.Add('  ORIGEMCMDV = ''0''');
               AtualizaTabela(sqlLocal.SQL.Text);
            end;
            Inc(Atualizados);
            CdsConta.Next;
         end;
         CdsBase.Next;
      end;
      Commit;
      MessageInfo := 'Foram atualizadas ' + IntToStr(Atualizados) + ' contas orçamentárias' + #13 + #10 +
                     ' Alteração concluída';
      Result := True;
      GravaLog(' ' + MessageInfo);
   except
      on E:exception do
      begin
         Result := False;
         Rollback;
         MessageInfo := MessageInfo + #13 + #10 + E.Message;
         GravaLog(' ' + MessageInfo);
      end;
   end;
   sqllocal.Free;
end;



procedure TCtrlCadContasOrcPorGrupo.PopulaOrigem(pContaOrigem : String);
var
   sqlLocal : TStringList;
begin
   sqlLocal := TStringList.Create;
   try
      sqlLocal.Add('SELECT');
      sqlLocal.Add('  NVL(IDGRUPOORCAMEN   , '''') AS IDGRUPOORCAMEN   ,');
      sqlLocal.Add('  NVL(NOMECONTAORCAMEN , '''') AS NOMECONTAORCAMEN ,');
      sqlLocal.Add('  NVL(TIPOCALCREALIZADO, '''') AS TIPOCALCREALIZADO,');
      sqlLocal.Add('  NVL(TIPOCALCORCADO   , '''') AS TIPOCALCORCADO   ,');
      sqlLocal.Add('  NVL(FLGSINALCONTA    , '''') AS FLGSINALCONTA    ,');
      sqlLocal.Add('  NVL(FLGACUMULADO     , '''') AS FLGACUMULADO     ,');
      sqlLocal.Add('  NVL(DATAINATIVA      , '''') AS DATAINATIVA      ,');
      sqlLocal.Add('  NVL(DATAATIVA        , '''') AS DATAATIVA        ,');
      sqlLocal.Add('  NVL(FLGATIVA         , '''') AS FLGATIVA         ,');
      sqlLocal.Add('  NVL(FLGCONTAMONETARIA, '''') AS FLGCONTAMONETARIA,');
      sqlLocal.Add('  NVL(FLGTRANSFSALDO   , '''') AS FLGTRANSFSALDO   ,');
      sqlLocal.Add('  NVL(FORMULAORCADO    , '''') AS FORMULAORCADO    ,');
      sqlLocal.Add('  NVL(FORMULAREALIZADO , '''') AS FORMULAREALIZADO ,');
      sqlLocal.Add('  NVL(VLRINFORMADOORC  , '''') AS VLRINFORMADOORC  ,');
      sqlLocal.Add('  NVL(VLRINFORMADOREAL , '''') AS VLRINFORMADOREAL ,');
      sqlLocal.Add('  NVL(OBSERVACAO       , '''') AS OBSERVACAO       ,');
      sqlLocal.Add('  NVL(CODCENTRORESPON  , '''') AS CODCENTRORESPON   ');
      sqlLocal.Add('FROM');
      sqlLocal.Add('  CONTASORCAMEN');
      sqlLocal.Add('WHERE');
      sqlLocal.Add('  IDPESSOA       = ' + FloatToStr(pIdEmpresa) + ' AND');
      sqlLocal.Add('  IDPLANOORCAMEN = ' + FloatToStr(pPlano) + ' AND');
      sqlLocal.Add('  IDCONTAORCAMEN = ' + QuotedStr(pContaOrigem));
      CdsOrigem.Close;
      CdsOrigem.Data := GetDataPacket(sqlLocal.Text);
   finally
      sqlLocal.Free;
   end;
end;



procedure TCtrlCadContasOrcPorGrupo.PopulaOrigemContab(pContaOrigem : String);
var
   sqlLocal : TStringList;
begin
   sqlLocal := TStringList.Create;
   try
      sqlLocal.Add('SELECT');
      sqlLocal.Add('  PLANO,     PLACONTA,    CODCENTROCUSTO,');
      sqlLocal.Add('  UNIDNEGOC, IDPLANOPREV, IDPATRO');
      sqlLocal.Add('FROM');
      sqlLocal.Add('  COMPCONTASORCAMEN');
      sqlLocal.Add('WHERE');
      sqlLocal.Add('  IDPESSOA       = ' + FloatToStr(pIdEmpresa) + ' AND');
      sqlLocal.Add('  IDPLANOORCAMEN = ' + FloatToStr(pPlano) + ' AND');
      sqlLocal.Add('  IDCONTAORCAMEN = ' + QuotedStr(pContaOrigem) + ' AND');
      sqlLocal.Add('  PLACONTA IS NOT NULL');

      CdsOrigem.Close;
      CdsOrigem.Data := GetDataPacket(sqlLocal.Text);
   finally
      sqlLocal.Free;
   end;
end;



procedure TCtrlCadContasOrcPorGrupo.PopulaOrigemContaOrc(pContaOrigem : String);
var
   sqlLocal : TStringList;
begin
   sqlLocal := TStringList.Create;
   try
      sqlLocal.Add('SELECT');
      sqlLocal.Add('  IDCONTAREFORCADO, PERCCONTAREFORC');
      sqlLocal.Add('FROM');
      sqlLocal.Add('  COMPCONTASORCAMEN');
      sqlLocal.Add('WHERE');
      sqlLocal.Add('  IDPLANOORCAMEN = ' + FloatToStr(pPlano) + ' AND');
      sqlLocal.Add('  IDCONTAORCAMEN = ' + QuotedStr(pContaOrigem) + ' AND');
      sqlLocal.Add('  IDCONTAREFORCADO IS NOT NULL');

      CdsOrigem.Close;
      CdsOrigem.Data := GetDataPacket(sqlLocal.Text);
   finally
      sqlLocal.Free;
   end;
end;



procedure TCtrlCadContasOrcPorGrupo.PopulaOrigemContaRea(pContaOrigem : String);
var
   sqlLocal : TStringList;
begin
   sqlLocal := TStringList.Create;
   try
      sqlLocal.Add('SELECT');
      sqlLocal.Add('  IDCONTAREFREAL, PERCCONTAREFREA');
      sqlLocal.Add('FROM');
      sqlLocal.Add('  COMPCONTASORCAMEN');
      sqlLocal.Add('WHERE');
      sqlLocal.Add('  IDPLANOORCAMEN = ' + FloatToStr(pPlano) + ' AND');
      sqlLocal.Add('  IDCONTAORCAMEN = ' + QuotedStr(pContaOrigem) + ' AND');
      sqlLocal.Add('  IDCONTAREFREAL IS NOT NULL');

      CdsOrigem.Close;
      CdsOrigem.Data := GetDataPacket(sqlLocal.Text);
   finally
      sqlLocal.Free;
   end;
end;



procedure TCtrlCadContasOrcPorGrupo.PopulaOrigemFluxoCai(pContaOrigem : String);
var
   sqlLocal : TStringList;
begin
   sqlLocal := TStringList.Create;

   try
      sqlLocal.Add('SELECT');
      sqlLocal.Add('  CODTIPRECDES, RECPAG,    CODCENTRORESPON, IDPLANOPREV,');
      sqlLocal.Add('  IDPATRO,      UNIDNEGOC, IDPESSOA,        IDEMPRESA,');
      sqlLocal.Add('  CODCENTROCUSTO');
      sqlLocal.Add('FROM');
      sqlLocal.Add('  COMPCONTASORCAMEN');
      sqlLocal.Add('WHERE');
      sqlLocal.Add('  IDPLANOORCAMEN = ' + FloatToStr(pPlano) + ' AND');
      sqlLocal.Add('  IDCONTAORCAMEN = ' + QuotedStr(pContaOrigem) + ' AND');
      sqlLocal.Add('  CODTIPRECDES IS NOT NULL');

      CdsOrigem.Close;
      CdsOrigem.Data := GetDataPacket(sqlLocal.Text);
   finally
      sqlLocal.Free;
   end;
end;



procedure TCtrlCadContasOrcPorGrupo.PopulaOrigemCondic(pContaOrigem : String);
var
   sqlLocal : TStringList;
begin
   sqlLocal := TStringList.Create;

   try
      sqlLocal.Add('SELECT');
      sqlLocal.Add('  IDCONTACONDINI, IDCONTACONDFIM, IDCONTACONDRES,');
      sqlLocal.Add('  TIPOCONDINI,    TIPOCONDRES,    CONDICAO,');
      sqlLocal.Add('  VLRCONDINI,     VLRCONDRES');
      sqlLocal.Add('FROM');
      sqlLocal.Add('  COMPCONTASORCAMEN');
      sqlLocal.Add('WHERE');
      sqlLocal.Add('  IDPLANOORCAMEN = ' + FloatToStr(pPlano) + ' AND');
      sqlLocal.Add('  IDCONTAORCAMEN = ' + QuotedStr(pContaOrigem) + ' AND');
      sqlLocal.Add('  IDCONTACONDINI IS NOT NULL');

      CdsOrigem.Close;
      CdsOrigem.Data := GetDataPacket(sqlLocal.Text);
   finally
      sqlLocal.Free;
   end;
end;



procedure TCtrlCadContasOrcPorGrupo.PopulaOrigemArqGenerico(pContaOrigem : String);
var
   sqlLocal : TStringList;
begin
   sqlLocal := TStringList.Create;

   try
      sqlLocal.Add('SELECT');
      sqlLocal.Add('  DV.IDDATAVIEW,       DV.CLASSNAME,  DV.TEMPLATE,   DV.NAME,');
      sqlLocal.Add('  DV.CLASSDESCRIPTION, DV.DESCRIPTION');
      sqlLocal.Add('FROM');
      sqlLocal.Add('  DATAVIEW DV, CONTASORCAMEN CO');
      sqlLocal.Add('WHERE');
      sqlLocal.Add('  CO.IDPLANOORCAMEN = ' + FloatToStr(pPlano) + ' AND');
      sqlLocal.Add('  CO.IDCONTAORCAMEN = ' + QuotedStr(pContaOrigem) + ' AND');
      sqlLocal.Add('  DV.IDDATAVIEW     = CO.IDDATAVIEW AND');
      sqlLocal.Add('  DV.ORIGEMCMDV     = ''0''');

      CdsOrigem.Close;
      CdsOrigem.Data := GetDataPacket(sqlLocal.Text);

      CdsDataView.Data := CdsOrigem.Data;           //   Somente para pegar
      CdsDataView.EmptyDataSet;                     //    a estrutura

   finally
      sqlLocal.Free;
   end;
end;



procedure TCtrlCadContasOrcPorGrupo.GravaLog(pLog : String);
begin
   if (AtualizarLog) then
   begin
      memStatus.Lines.Add(pLog);

      if (memStatus.Lines.Count = 1000) or (pLog = 'Fim do Log') then
      begin
         memStatus.Lines.SaveTofile('LogContasPorGrupo' + FormatFloat('00', CntStatus) + '.Txt');

         if (memStatus.Lines.Count = 1000) then memStatus.Clear;

         CntStatus := CntStatus + 1;
      end;
   end;
end;



procedure TCtrlCadContasOrcPorGrupo.Estimar(pInserir : Boolean);
var
   Posicao   : Integer;
   Restantes : Integer;
begin
   Posicao   := 0;
   Restantes := CdsBase.RecordCount;

   GravaLog('Estimar - iniciando');
   GravaLog(' Linhas restantes - ' + IntToStr(Restantes));
   GravaLog(' Quantidade de contas que serão atualizadas - 0');

   CdsBase.First;
   while not(CdsBase.EOF) and (memStatus.Tag = 0) do
   begin
      BuscaContas (False);     // Busca os contas orçamentárias para o registro atual do cdsbase

      if (pInserir) then
      begin                     // Se for inserção as combinações que
         if (CdsConta.RecordCount = 0) then
         begin   // interessam são as que não possuem contas
            Inc(Posicao);
         end;
      end
      else
      begin
         Posicao := Posicao + CdsConta.RecordCount;
      end;
      Dec(Restantes);

      cdsBase.Edit;
      cdsBase.FieldByName('BASQUANT').AsInteger := CdsConta.RecordCount;
      cdsBase.Post;

      memStatus.Lines[memStatus.Lines.Count - 1] := ' Quantidade de contas que serão atualizadas - ' + IntToStr(Posicao);
      memStatus.Lines[memStatus.Lines.Count - 2] := ' Linhas restantes - ' + IntToSTr(Restantes);

      CdsBase.Next;
      Application.ProcessMessages;
   end;

   GravaLog(StringofChar('=', 40));
end;



function  TCtrlCadContasOrcPorGrupo.TamanhoMinimo(pCdsLocal : TDataSet;
                                                  pLtvSelec : TListView;
                                                  pCampo    : String) : Integer;
var
   Posicao : Integer;
begin
   Result := 0;
   for Posicao := 0 To pLtvSelec.Items.Count - 1 do
   begin
      pCdsLocal.RecNo := StrToInt(pltvSelec.Items[Posicao].SubItems[0]);
      if (Result < Length(Trim(pCdsLocal.FieldByName(pCampo).AsString))) then
      begin
         Result := Length(Trim(pCdsLocal.FieldByName(pCampo).AsString));
      end;
   end;
end;



procedure TCtrlCadContasOrcPorGrupo.GeraCodigo(pArrCodigo : array of TrecCodigo);
var
   Formato  : String;
   Posicao  : Integer;
   SeqPlano : Integer;
   SeqPatro : Integer;
begin
   SeqPlano := 0;
   SeqPatro := 0;

   cdsBase.Filtered := False;
   cdsBase.Filter   := 'BASQUANT = 0';
   cdsBase.Filtered := True;
   cdsBase.First;

   while not(cdsBase.EOF) and (memStatus.Tag = 0) do
   begin
      Posicao := 0;
      while (Posicao < Length(pArrCodigo)) and (memStatus.Tag = 0) do
      begin
         if (pArrcodigo[Posicao].Inicio <> 0) and (pArrcodigo[Posicao].Digitos <> 0) then
         begin

            Formato := StringofChar('0', pArrcodigo[Posicao].Digitos);

            if (pArrcodigo[Posicao].Campo = 'GO') then
            begin
               try
                  CdsGrupoOrc.Locate('CODGRUPOORC',
                                     Vararrayof([CdsBase.FieldByName('BASGRUP').AsFloat]),
                                     [loCaseInsensitive]);
               except
                  on E:Exception do showmessage(E.Message);
               end;

               pArrcodigo[Posicao].Conteudo := FormatFloat(Formato, StrTofloat(Trim(CdsGrupoOrc.FieldByName('CODGRUPOORC').AsString)));
            end
            else if (pArrcodigo[Posicao].Campo = 'CC') then
            begin
               pArrcodigo[Posicao].Conteudo := FormatFloat(Formato, CdsBase.FieldByName('BASCENT').AsFloat);
            end
            else if (pArrcodigo[Posicao].Campo = 'AP') then
            begin
               CdsAtivProj.Locate('UNIDNEGOC',
                                  Vararrayof([CdsBase.FieldByName('BASATIV').AsFloat]),
                                  [loCaseInsensitive]);

               pArrcodigo[Posicao].Conteudo := FormatFloat(Formato, StrTofloat(Trim(CdsAtivProj.FieldByName('UNECODIGO').AsString)));
            end
            else if (pArrcodigo[Posicao].Campo = 'PP') then
            begin
               Inc(SeqPlano);
               if (SeqPlano > Power(10, pArrcodigo[Posicao].Digitos) - 1) then SeqPlano := 1;

               pArrcodigo[Posicao].Conteudo := FormatFloat(Formato, SeqPlano + pArrcodigo[Posicao].Valor);
            end
            else if (pArrcodigo[Posicao].Campo = 'PT') then
            begin
               Inc(SeqPatro);
               if (SeqPatro > Power(10, pArrcodigo[Posicao].Digitos) - 1) then SeqPatro := 1;

               pArrcodigo[Posicao].Conteudo := FormatFloat(Formato, SeqPatro + pArrcodigo[Posicao].Valor);
            end
            else
            begin
               pArrcodigo[Posicao].Conteudo := '';
            end;
         end;
         Inc(Posicao);
      end;

      CdsBase.Edit;
      CdsBase.FieldByName('BASCONTA').AsString := pArrcodigo[0].Conteudo +
                                                  pArrcodigo[1].Conteudo +
                                                  pArrcodigo[2].Conteudo +
                                                  pArrcodigo[3].Conteudo +
                                                  pArrcodigo[4].Conteudo;
      CdsBase.Post;
      cdsBase.Next;
   end;

   cdsBase.Filtered := False;
   cdsBase.Filter   := '';
end;



function  TCtrlCadContasOrcPorGrupo.Inclusao(pedtContaText : String;
                                             pArrCodigo    : array of TrecCodigo;
                                             pLtvSelec     : TListView
                                            ): Boolean;
var
   sqlLocal : TStringList;
   Posicao  : Integer;
begin
   Result := True;
   MessageInfo := '';
   sqlLocal := TStringList.Create;

   GravaLog('- Inclusão - iniciando');
   GravaLog('  Gerando códigos');
   GeraCodigo(pArrcodigo);  // Gera ID para as contas

   cdsBase.Filtered := False;
   cdsBase.Filter   := 'BASQUANT = 0';
   cdsBase.Filtered := True;
   cdsBase.First;

   while not(cdsBase.EOF) and (memStatus.Tag = 0) do
   begin
      try
         sqlLocal.Clear;
         sqlLocal.Add('INSERT INTO');
         sqlLocal.Add('  CONTASORCAMEN');
         sqlLocal.Add('  (IDPESSOA,       IDPLANOORCAMEN, IDCONTAORCAMEN,');
         sqlLocal.Add('    IDGRUPOORCAMEN, CODCENTROCUSTO, UNIDNEGOC,');
         sqlLocal.Add('    IDPLANOPREV,    IDPATRO,        NOMECONTAORCAMEN)');
         sqlLocal.Add('  VALUES (');
         sqlLocal.Add('    ' + FloatToStr(pIdEmpresa) + ',');
         sqlLocal.Add('    ' + FloatToStr(pPlano) + ',');
         sqlLocal.Add('    ' + QuotedStr(cdsBase.FieldByName('BASCONTA').AsString) + ',');
         sqlLocal.Add('    ' + Trim(CdsBase.FieldByName('BASGRUP').AsString) + ',');
         sqlLocal.Add('    DECODE(' + QuotedStr(cdsBase.FieldByName('BASCENT').AsString) + ', '''', NULL, ' +
                                        QuotedStr(cdsBase.FieldByName('BASCENT').AsString)+ '),');
         sqlLocal.Add('    DECODE(' + QuotedStr(cdsBase.FieldByName('BASATIV').AsString) + ', '''', NULL, ' +
                                        QuotedStr(cdsBase.FieldByName('BASATIV').AsString) + '),');
         sqlLocal.Add('    DECODE(' + QuotedStr(cdsBase.FieldByName('BASPLAN').AsString) + ', '''', NULL, ' +
                                        QuotedStr(cdsBase.FieldByName('BASPLAN').AsString) + '),');
         sqlLocal.Add('    DECODE(' + QuotedStr(cdsBase.FieldByName('BASPATR').AsString) + ', '''', NULL, ' +
                                        QuotedStr(cdsBase.FieldByName('BASPATR').AsString) + '),');
         sqlLocal.Add('    ' + QuotedStr(cdsBase.FieldByName('BASCONTA').AsString) + ')');

         AtualizaTabela(sqlLocal.Text);

      except
         on E:Exception do
         begin
            Result := False;
            MessageInfo := MessageInfo + E.Message;
            GravaLog(' ' + MessageInfo);
         end;
      end;

      CdsBase.Next;
   end;

   // Utiliza os métodos de alteração para popular os demais dados da conta
   AtualizarLog := False;
   Posicao      := 0;

   while (Posicao < pLtvSelec.Items.Count) and (memStatus.Tag <> -1) do
   begin
      if not(Alteracao(pedtContaText, pLtvSelec.Items[Posicao].SubItems[0])) then
      begin
         Posicao := pLtvSelec.Items.Count;       // Para sair do loop
      end;

      Inc(Posicao);
   end;

   AtualizarLog := not(isAppServer);
   GravaLog('Fim do Log');

   cdsBase.Filtered := False;
   cdsBase.Filter   := '';
end;








// André Pontes - pendência 10065 - 22/09/2003
function  TCtrlCadContasOrcPorGrupo.InclusaoNova(const IDGrupoOrcamen  : Extended;
                                                 const CodGrupoOrcamen : String;
                                                 const IDContaOrcamen  : String;
                                                 const sPath           : String;
                                                 const bSubstCC        : Boolean;
                                                 const bSubstAP        : Boolean;
                                                 const bSubstPP        : Boolean;
                                                 const bSubstPT        : Boolean;
                                                 const sNomeBilhete    : String
                                                ): Boolean;
var
   ArqLog   : TextFile;
   iTamanho : Integer;

   iQuant   : Integer;
   iCriada  : Integer;
   iPos     : Integer;

   bLog     : Boolean;

   sCC      : String;
   sAP      : String;
   sPP      : String;
   sPT      : String;

   sSQL     : String;
   sLinha   : String;
   sCodigo  : String;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.InclusaoNova(IDGrupoOrcamen,
                                                  CodGrupoOrcamen,
                                                  IDContaOrcamen,
                                                  sPath,
                                                  bSubstCC,
                                                  bSubstAP,
                                                  bSubstPP,
                                                  bSubstPT,
                                                  sNomeBilhete
                                                 );

      if not(Result) then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         MontaCodigos(IDGrupoOrcamen, CodGrupoOrcamen, True, sNomeBilhete);
      except
         on E:Exception do
         begin
            MessageInfo := E.Message;
            Result := False;
            Exit;
         end;
      end;

      try
         bLog := not(isAppServer);

         // ----------------------------------------------------------------------------------------
         // 1) Prepara gravação do arquivo de log
         // ----------------------------------------------------------------------------------------

         if bLog then
         begin
            AssignFile(ArqLog, sPath + 'ContasOrcamenINCLUSAO' + FormatDateTime('yyyy-mm-dd', Date) + '.txt');
            ReWrite(ArqLog);

            sLinha   := FormatDateTime('hh:nn:ss', Now) + ' Início do processo...';

            WriteLN(ArqLog, sLinha);
            WriteLN(ArqLog, '');
         end;  // if bLog


         // ----------------------------------------------------------------------------------------
         // 2) Itera pelo cdsCodigo, fazendo Insert na CONTASORCAMEN e COMPCONTASORCAMEN
         // ----------------------------------------------------------------------------------------

         StartTransaction;

         iQuant   := cdsCodigo.RecordCount;
         iPos     := 0;
         iCriada  := 0;

         // MostraFormProgresso
         DoProgresso([sNomeBilhete, 0, 0, iQuant, iPos, 'Criando Contas Orçamentárias...']);

         cdsCodigo.First;
         while not(cdsCodigo.EOF) do
         begin
            inc(iPos);

            // AndaFormProgresso
            DoProgresso([sNomeBilhete, 1, 0, iQuant, iPos, 'Criando Contas Orçamentárias...']);

            // -------------------------------------------------------------------------------------
            //    Verifica se a combinação já existe
            // -------------------------------------------------------------------------------------

            if ExisteCombinacao(pPlano,
                                cdsCodigo.FieldByName('IDGRUPOORCAMEN').AsFloat,
                                cdsCodigo.FieldByName('CODCENTROCUSTO').AsString,
                                cdsCodigo.FieldByName('UNIDNEGOC').AsString,
                                cdsCodigo.FieldByName('IDPLANOPREV').AsString,
                                cdsCodigo.FieldByName('IDPATRO').AsString
                               ) then
            begin
               if bLog then
               begin
                  sLinha   := FormatDateTime('hh:nn:ss', Now) + ' ' +
                              CompletaFIM(cdsCodigo.FieldByName('CODIGO').AsString, ' ', 30) + ' - ' +
                              'Já existe uma conta orçamentária com os mesmos parâmetros.';

                  WriteLN(ArqLog, sLinha);
               end;  // if bLog

               cdsCodigo.Next;
               Continue;
            end;


            // -------------------------------------------------------------------------------------
            //    CONTASORCAMEN
            // -------------------------------------------------------------------------------------

            try
               sSQL :=
               'INSERT INTO CONTASORCAMEN '                                                        + #13 +
               '( '                                                                                + #13 +
               'IDPESSOA, IDPLANOORCAMEN, IDGRUPOORCAMEN, '                                        + #13 +
               'IDCONTAORCAMEN, '                                                                  + #13 +
               'NOMECONTAORCAMEN, CODCENTRORESPON, IDEMPRESA, '                                    + #13 +
               'CODCENTROCUSTO, UNIDNEGOC, IDPLANOPREV, IDPATRO, '                                 + #13 +
               'TIPOCALCREALIZADO, FORMULAREALIZADO, VLRINFORMADOREAL, '                           + #13 +
               'TIPOCALCORCADO, FORMULAORCADO, VLRINFORMADOORC, '                                  + #13 +
               'OBSERVACAO, '                                                                      + #13 +
               'FLGCONTAMONETARIA, FLGSINALCONTA, FLGCALCORCADO, FLGCALCREAL, FLGINFDIAMES, '      + #13 +
               'FLGACUMULADO, FLGTRANSFSALDO, FLGATIVA, DATAATIVA, DATAINATIVA, '                  + #13 +
               'IDDATAVIEW, ORIGEMCMDV '                                                           + #13 +
               ') '                                                                                + #13 +
               '( '                                                                                + #13 +
               'SELECT '                                                                           + #13 +
               '   IDPESSOA, IDPLANOORCAMEN, IDGRUPOORCAMEN, '                                     + #13 +

               // IDCONTAORCAMEN
               '   ' + QuotedStr(cdsCodigo.FieldByName('CODIGO').AsString) + ', '                  + #13 +

               '   NOMECONTAORCAMEN, CODCENTRORESPON, '                                            + #13 +
               '   ' + FormatFloat(#0, pIDEmpresa) + ', '                                          + #13 +

               // Centro de Custo, Ativ/Proj, Plano, Patro
               '   ' + QuotedStr(cdsCodigo.FieldByName('CODCENTROCUSTO').AsString) + ', '          + #13 +
               '   ' + cdsCodigo.FieldByName('UNIDNEGOC').AsString + ', '                          + #13 +
               '   ' + cdsCodigo.FieldByName('IDPLANOPREV').AsString + ', '                        + #13 +
               '   ' + cdsCodigo.FieldByName('IDPATRO').AsString + ', '                            + #13 +

               '   TIPOCALCREALIZADO, FORMULAREALIZADO, VLRINFORMADOREAL, '                        + #13 +
               '   TIPOCALCORCADO, FORMULAORCADO, VLRINFORMADOORC, '                               + #13 +
               '   OBSERVACAO, '                                                                   + #13 +
               '   FLGCONTAMONETARIA, FLGSINALCONTA, FLGCALCORCADO, FLGCALCREAL, FLGINFDIAMES, '   + #13 +
               '   FLGACUMULADO, FLGTRANSFSALDO, FLGATIVA, DATAATIVA, DATAINATIVA, '               + #13 +
               '   IDDATAVIEW, ORIGEMCMDV '                                                        + #13 +
               'FROM '                                                                             + #13 +
               '   CONTASORCAMEN '                                                                 + #13 +
               'WHERE '                                                                            + #13 +
               '   IDCONTAORCAMEN = ''-1'' '                                                       + #13 +
               ') ';

               ExecSQL(sSQL);

            except
               on E:Exception do
               begin
                  Rollback;

                  if bLog then
                  begin
                     sLinha   := FormatDateTime('hh:nn:ss', Now) + ' ' +
                                 CompletaFIM(cdsCodigo.FieldByName('CODIGO').AsString, ' ', 30) + ' - ' +
                                 'ERRO na inserção da Conta Orçamentária: ' +
                                 E.message;

                     MessageInfo := sLinha;

                     WriteLN(ArqLog, sLinha);

                     WriteLN(ArqLog, '');

                     sLinha   := FormatDateTime('hh:nn:ss', Now) + ' Processo interrompido';

                     WriteLN(ArqLog, sLinha);

                  end;  // if bLog
                  Exit;
               end;  // on E:Exception
            end;  // try..except


            // -------------------------------------------------------------------------------------
            //    COMPCONTASORCAMEN
            // -------------------------------------------------------------------------------------

            try
               sSQL :=
               'INSERT INTO COMPCONTASORCAMEN '                                           + #13 +
               '( '                                                                       + #13 +
               'IDCOMPCONTASORC, IDCONTAORCAMEN, '                                        + #13 +
               'IDCONTACONDRES, IDCONTACONDFIM, IDCONTACONDINI, '                         + #13 +
               'IDCONTAREFREAL, IDPLANOORCAMEN, IDCONTAREFORCADO, '                       + #13 +
               'IDPESSOA, CODTIPRECDES, CODCENTRORESPON, IDEMPRESA, '                     + #13 +
               'CODCENTROCUSTO, UNIDNEGOC, IDPLANOPREV, IDPATRO, '                        + #13 +
               'PLANO, PLACONTA, RECPAG, PERCCONTAREFORC, PERCCONTAREFREA, '              + #13 +
               'CONDICAO, TIPOCONDINI, TIPOCONDRES, VLRCONDINI, VLRCONDRES, '             + #13 +
               'CODTIPDOC '                                                               + #13 +
               ') '                                                                       + #13 +
               '( '                                                                       + #13 +
               'SELECT '                                                                  + #13 +
               '   SEQCOMPCONTASORCAMEN.NEXTVAL, '                                        + #13 +

               // IDCONTAORCAMEN
               '   ' + QuotedStr(cdsCodigo.FieldByName('CODIGO').AsString) + ', '         + #13 +

               '   IDCONTACONDRES, IDCONTACONDFIM, IDCONTACONDINI, '                      + #13 +
               '   IDCONTAREFREAL, IDPLANOORCAMEN, IDCONTAREFORCADO, '                    + #13 +
               '   IDPESSOA, CODTIPRECDES, CODCENTRORESPON, IDEMPRESA, '                  + #13;

               // ----------------------------------------------------------------------------------
               if bSubstCC then
               begin
                  sSQL := sSQL +
               '   ' + QuotedStr(cdsCodigo.FieldByName('CODCENTROCUSTO').AsString) + ', ' + #13;
               end
               else
               begin
                  sSQL := sSQL + '   CODCENTROCUSTO, '                                    + #13;
               end;

               if bSubstAP then
               begin
                  sSQL := sSQL +
               '   ' + cdsCodigo.FieldByName('UNIDNEGOC').AsString + ', '                 + #13;
               end
               else
               begin
                  sSQL := sSQL + '   UNIDNEGOC, '                                         + #13;
               end;

               if bSubstPP then
               begin
                  sSQL := sSQL +
               '   ' + cdsCodigo.FieldByName('IDPLANOPREV').AsString + ', '               + #13;
               end
               else
               begin
                  sSQL := sSQL + '   IDPLANOPREV, '                                       + #13;
               end;

               if bSubstPT then
               begin
                  sSQL := sSQL +
               '   ' + cdsCodigo.FieldByName('IDPATRO').AsString + ', '                   + #13;
               end
               else
               begin
                  sSQL := sSQL + '   IDPATRO, '                                           + #13;
               end;
               // ----------------------------------------------------------------------------------

               sSQL := sSQL +
               'PLANO, PLACONTA, RECPAG, PERCCONTAREFORC, PERCCONTAREFREA, '              + #13 +
               'CONDICAO, TIPOCONDINI, TIPOCONDRES, VLRCONDINI, VLRCONDRES, '             + #13 +
               'CODTIPDOC '                                                               + #13 +
               'FROM '                                                                    + #13 +
               '   COMPCONTASORCAMEN '                                                    + #13 +
               'WHERE '                                                                   + #13 +
               '   IDCONTAORCAMEN = ''-1'' '                                              + #13 +
               ') ';

               ExecSQL(sSQL);

            except
               on E:Exception do
               begin
                  Rollback;

                  if bLog then
                  begin
                     sLinha   := FormatDateTime('hh:nn:ss', Now) + ' ' +
                                 CompletaFIM(cdsCodigo.FieldByName('CODIGO').AsString, ' ', 30) + ' - ' +
                                 'ERRO na inserção da Composição da Conta Orçamentária: ' +
                                 E.message;

                     MessageInfo := sLinha;

                     WriteLN(ArqLog, sLinha);

                     WriteLN(ArqLog, '');

                     sLinha   := FormatDateTime('hh:nn:ss', Now) + ' Processo interrompido';

                     WriteLN(ArqLog, sLinha);
                  end;  // if bLog
                  Exit;
               end;  // on E:Exception
            end;  // try..except

            // -------------------------------------------------------------------------------------

            if bLog then
            begin
               sLinha := FormatDateTime('hh:nn:ss', Now) + ' ' + CompletaFIM(cdsCodigo.FieldByName('CODIGO').AsString, ' ', 30);

               WriteLN(ArqLog, sLinha);
            end;  // if bLog

            inc(iCriada);

            cdsCodigo.Next;
         end;  // while not(cdsCodigo.EOF)

         Commit;

         // ----------------------------------------------------------------------------------------
         // 3) Exclui a conta "base"
         // ----------------------------------------------------------------------------------------
         ExcluiContaEspelho;
         // ----------------------------------------------------------------------------------------

         Result := True;

      finally
         // EscondeFormProgresso
         DoProgresso([sNomeBilhete, 2, 0, iQuant, iPos, 'Criando Contas Orçamentárias...']);

         if bLog then
         begin
            WriteLN(ArqLog, '');

            sLinha := 'Foram criadas ' + IntToStr(iCriada) + ' Contas Orçamentárias, de ' +
                      IntToStr(iQuant) + ' previstas.';

            WriteLN(ArqLog, sLinha);

            WriteLN(ArqLog, '');

            sLinha := FormatDateTime('hh:nn:ss', Now) + ' Término do processo.';

            WriteLN(ArqLog, sLinha);
            CloseFile(ArqLog);
         end;  // if bLog
      end;  // try..finally
   end;  // if ConnectionSide = cnsClient
end;
// FIM André Pontes - pendência 10065 - 22/09/2003



// André Pontes - pendência 10065 - 29/09/2003
function  TCtrlCadContasOrcPorGrupo.AlteracaoNova(const IDContaEspelho  : String;
                                                  const IDGrupoOrcamen  : String;
                                                  const CodGrupoOrcamen : String;
                                                  const IDEmpresProp    : String;
                                                  const sPath           : String;
                                                  const bSubstCompConta : Boolean;
                                                  const bSubstCC        : Boolean;
                                                  const bSubstAP        : Boolean;
                                                  const bSubstPP        : Boolean;
                                                  const bSubstPT        : Boolean;
                                                  const sNomeBilhete    : String
                                                 ): Boolean;
var
   iQuant    : Integer;
   iAlterada : Integer;
   iPos      : Integer;

   ArqLog    : TextFile;

   bLog      : Boolean;

   sCC       : String;
   sAP       : String;
   sPP       : String;
   sPT       : String;

   sSQL      : String;
   sLinha    : String;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AlteracaoNova(IDContaEspelho,
                                                   IDGrupoOrcamen,
                                                   CodGrupoOrcamen,
                                                   IDEmpresProp,
                                                   bSubstCompConta,
                                                   bSubstCC,
                                                   bSubstAP,
                                                   bSubstPP,
                                                   bSubstPT,
                                                   sNomeBilhete
                                                  );

      if not(Result) then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      // -------------------------------------------------------------------------------------------
      try
         MontaCodigos(StrToFloat(IDGrupoOrcamen), CodGrupoOrcamen, True, sNomeBilhete);
      except
         on E:Exception do
         begin
            MessageInfo := E.Message;
            Result := False;
            Exit;
         end;
      end;
      // -------------------------------------------------------------------------------------------

      // -------------------------------------------------------------------------------------------
      try
         bLog := not(isAppServer);

         // ----------------------------------------------------------------------------------------
         // 1) Prepara gravação do arquivo de log
         // ----------------------------------------------------------------------------------------

         if bLog then
         begin
            AssignFile(ArqLog, sPath + 'ContasOrcamenALTERACAO' + FormatDateTime('yyyy-mm-dd', Date) + '.txt');
            ReWrite(ArqLog);

            sLinha   := FormatDateTime('hh:nn:ss', Now) + ' Início do processo...';

            WriteLN(ArqLog, sLinha);
            WriteLN(ArqLog, '');
         end;  // if bLog

         // ----------------------------------------------------------------------------------------
         // 2) Itera pelo cdsCodigo, fazendo update na CONTASORCAMEN e
         //    delete + insert na COMPCONTASORCAMEN
         // ----------------------------------------------------------------------------------------

         StartTransaction;

         iQuant    := cdsCodigo.RecordCount;
         iPos      := 0;
         iAlterada := 0;

         // MostraFormProgresso
         DoProgresso([sNomeBilhete, 0, 0, iQuant, iPos, 'Atualizando Contas Orçamentárias...']);

         // Abre a tabela de contas orçamentárias, trazendo a conta que será usada como "espelho"
         sSQL :=
         'SELECT * '                + #13 +
         'FROM '                    + #13 +
         '   CONTASORCAMEN '        + #13 +
         'WHERE '                                                 + #13 +
         '       IDPLANOORCAMEN = ' + FormatFloat('#0', pPlano)   + #13 +
         '   AND IDGRUPOORCAMEN = ' + IDGrupoOrcamen              + #13 +
         '   AND IDCONTAORCAMEN = ' + QuotedStr(IDContaEspelho);

         cdsContaEspelho.Close;
         cdsContaEspelho.Data := GetDataPacket(sSQL);
         // ----------------------------------------------------------------------------------

         cdsCodigo.First;
         while not(cdsCodigo.EOF) do
         begin
            inc(iPos);

            // AndaFormProgresso
            DoProgresso([sNomeBilhete, 1, 0, iQuant, iPos, 'Atualizando Contas Orçamentárias...']);

            // -------------------------------------------------------------------------------------
            //    CONTASORCAMEN
            // -------------------------------------------------------------------------------------

            try
               // ----------------------------------------------------------------------------------
               // Abre a tabela de contas orçamentárias, trazendo a conta que será alterada
               // *** Garante não haver problemas na inserção da CompContas, o que poderia de outra
               //     forma ocorrer (se a composição do código for mudada, p.ex.) ***
               // ----------------------------------------------------------------------------------
               sSQL :=
               'SELECT IDCONTAORCAMEN FROM CONTASORCAMEN '                                               + #13 +
               'WHERE '                                                                                  + #13 +
               '       IDPLANOORCAMEN = ' + FormatFloat('#0', pPlano)                                    + #13 +
               '   AND IDGRUPOORCAMEN = ' + IDGrupoOrcamen                                               + #13 +
               '   AND CODCENTROCUSTO = ' + QuotedStr(cdsCodigo.FieldByName('CODCENTROCUSTO').AsString)  + #13 +
               '   AND IDEMPRESA      = ' + IDEmpresProp                                                 + #13 +
               '   AND UNIDNEGOC      = ' + cdsCodigo.FieldByName('UNIDNEGOC').AsString                  + #13 +
               '   AND IDPESSOA       = ' + IDEmpresProp                                                 + #13 +
               '   AND IDPLANOPREV    = ' + cdsCodigo.FieldByName('IDPLANOPREV').AsString                + #13 +
               '   AND IDPATRO        = ' + cdsCodigo.FieldByName('IDPATRO').AsString;

               cdsContaNova.Close;
               cdsContaNova.Data := GetDataPacket(sSQL);
               // ----------------------------------------------------------------------------------


               // ----------------------------------------------------------------------------------
               //    Se a conta atual for a própria conta espelho, pula o registro, verifica se
               //    deve alterar a composição da mesma, mas não faz (delete + insert)
               // ----------------------------------------------------------------------------------
               if CdsContaNova.FieldByName('IDCONTAORCAMEN').AsString = CdsContaEspelho.FieldByName('IDCONTAORCAMEN').AsString then
               begin
                  if bSubstCompConta then
                  begin
                     try
                        if bSubstCC then
                        begin
                           sSQL :=
                           'UPDATE COMPCONTASORCAMEN '                                                            + #13 +
                           'SET '                                                                                 + #13 +
                           '   CODCENTROCUSTO = ' + QuotedStr(cdsCodigo.FieldByName('CODCENTROCUSTO').AsString)   + #13 +
                           'WHERE '                                                                               + #13 +
                           '   IDCONTAORCAMEN = ' + QuotedStr(IDContaEspelho);

                           ExecSQL(sSQL);
                        end;

                        if bSubstAP then
                        begin
                           sSQL :=
                           'UPDATE COMPCONTASORCAMEN '                                          + #13 +
                           'SET '                                                               + #13 +
                           '   UNIDNEGOC      = ' + cdsCodigo.FieldByName('UNIDNEGOC').AsString + #13 +
                           'WHERE '                                                             + #13 +
                           '   IDCONTAORCAMEN = ' + QuotedStr(IDContaEspelho);

                           ExecSQL(sSQL);
                        end;

                        if bSubstPP then
                        begin
                           sSQL :=
                           'UPDATE COMPCONTASORCAMEN '                                             + #13 +
                           'SET '                                                                  + #13 +
                           '   IDPLANOPREV    = ' + cdsCodigo.FieldByName('IDPLANOPREV').AsString  + #13 +
                           'WHERE '                                                                + #13 +
                           '   IDCONTAORCAMEN = ' + QuotedStr(IDContaEspelho);

                           ExecSQL(sSQL);
                        end;

                        if bSubstPT then
                        begin
                           sSQL :=
                           'UPDATE COMPCONTASORCAMEN '                                          + #13 +
                           'SET '                                                               + #13 +
                           '   IDPATRO        = ' + cdsCodigo.FieldByName('IDPATRO').AsString   + #13 +
                           'WHERE '                                                             + #13 +
                           '   IDCONTAORCAMEN = ' + QuotedStr(IDContaEspelho);

                           ExecSQL(sSQL);
                        end;

                     except

                       on E:Exception do
                       begin
                          Rollback;

                          if bLog then
                          begin
                             sLinha   := FormatDateTime('hh:nn:ss', Now) + ' ' +
                                         CompletaInicio(IDContaEspelho, ' ', 25) + ' - ' +
                                         'ERRO na atualização da Composição da Conta Orçamentária: ' +
                                         E.message;

                             MessageInfo := sLinha;

                             WriteLN(ArqLog, sLinha);

                             WriteLN(ArqLog, '');

                             sLinha   := FormatDateTime('hh:nn:ss', Now) + ' Processo interrompido';

                             WriteLN(ArqLog, sLinha);
                          end;  // if bLog
                          Exit;
                       end;  // on E:Exception
                    end;  // try..except

                  end;  // if bSubstCompConta

                  cdsCodigo.Next;
                  Continue;
               end;
               // ----------------------------------------------------------------------------------


               sSQL :=
               'UPDATE CONTASORCAMEN '                                                                                     + #13 +
               'SET '                                                                                                      + #13 +
               '   NOMECONTAORCAMEN    = ' + QuotedStr(cdsContaEspelho.FieldByName('NOMECONTAORCAMEN').AsString)  + ', '   + #13 +
               '   CODCENTRORESPON     = ' + QuotedStr(cdsContaEspelho.FieldByName('CODCENTRORESPON').AsString)   + ', '   + #13 +
               '   TIPOCALCREALIZADO   = ' + QuotedStr(cdsContaEspelho.FieldByName('TIPOCALCREALIZADO').AsString) + ', '   + #13 +
               '   FORMULAREALIZADO    = ' + QuotedStr(cdsContaEspelho.FieldByName('FORMULAREALIZADO').AsString)  + ', '   + #13 +
               '   VLRINFORMADOREAL    = ' + QuotedStr(cdsContaEspelho.FieldByName('VLRINFORMADOREAL').AsString)  + ', '   + #13 +
               '   TIPOCALCORCADO      = ' + QuotedStr(cdsContaEspelho.FieldByName('TIPOCALCORCADO').AsString)    + ', '   + #13 +
               '   FORMULAORCADO       = ' + QuotedStr(cdsContaEspelho.FieldByName('FORMULAORCADO').AsString)     + ', '   + #13 +
               '   VLRINFORMADOORC     = ' + QuotedStr(cdsContaEspelho.FieldByName('VLRINFORMADOORC').AsString)   + ', '   + #13 +
               '   OBSERVACAO          = ' + QuotedStr(cdsContaEspelho.FieldByName('OBSERVACAO').AsString)        + ', '   + #13 +
               '   FLGCONTAMONETARIA   = ' + QuotedStr(cdsContaEspelho.FieldByName('FLGCONTAMONETARIA').AsString) + ', '   + #13 +
               '   FLGSINALCONTA       = ' + QuotedStr(cdsContaEspelho.FieldByName('FLGSINALCONTA').AsString)     + ', '   + #13 +
               '   FLGCALCORCADO       = ' + QuotedStr(cdsContaEspelho.FieldByName('FLGCALCORCADO').AsString)     + ', '   + #13 +
               '   FLGCALCREAL         = ' + QuotedStr(cdsContaEspelho.FieldByName('FLGCALCREAL').AsString)       + ', '   + #13 +
               '   FLGINFDIAMES        = ' + QuotedStr(cdsContaEspelho.FieldByName('FLGINFDIAMES').AsString)      + ', '   + #13 +
               '   FLGACUMULADO        = ' + QuotedStr(cdsContaEspelho.FieldByName('FLGACUMULADO').AsString)      + ', '   + #13 +
               '   FLGTRANSFSALDO      = ' + QuotedStr(cdsContaEspelho.FieldByName('FLGTRANSFSALDO').AsString)    + ', '   + #13 +
               '   FLGATIVA            = ' + QuotedStr(cdsContaEspelho.FieldByName('FLGATIVA').AsString)          + ', '   + #13 +
               '   DATAATIVA           = ' + QuotedStr(cdsContaEspelho.FieldByName('DATAATIVA').AsString)         + ', '   + #13 +
               '   DATAINATIVA         = ' + QuotedStr(cdsContaEspelho.FieldByName('DATAINATIVA').AsString)       + ', '   + #13 +
               '   IDDATAVIEW          = ' + QuotedStr(cdsContaEspelho.FieldByName('IDDATAVIEW').AsString)        + ', '   + #13 +
               '   ORIGEMCMDV          = ' + QuotedStr(cdsContaEspelho.FieldByName('ORIGEMCMDV').AsString)                 + #13 +
               'WHERE '                                                                                                    + #13 +
               '       IDPLANOORCAMEN = ' + FormatFloat('#0', pPlano)                                                      + #13 +
               '   AND IDGRUPOORCAMEN = ' + IDGrupoOrcamen                                                                 + #13 +
               '   AND IDCONTAORCAMEN = ' + QuotedStr(CdsContaNova.FieldByName('IDCONTAORCAMEN').AsString);

{
               '   AND CODCENTROCUSTO = ' + QuotedStr(cdsCodigo.FieldByName('CODCENTROCUSTO').AsString)                     + #13 +
               '   AND IDEMPRESA      = ' + IDEmpresProp                                                                    + #13 +
               '   AND UNIDNEGOC      = ' + cdsCodigo.FieldByName('UNIDNEGOC').AsString                                     + #13 +
               '   AND IDPESSOA       = ' + IDEmpresProp                                                                    + #13 +
               '   AND IDPLANOPREV    = ' + cdsCodigo.FieldByName('IDPLANOPREV').AsString                                   + #13 +
               '   AND IDPATRO        = ' + cdsCodigo.FieldByName('IDPATRO').AsString;
}

               ExecSQL(sSQL);

            except
               on E:Exception do
               begin
                  Rollback;

                  if bLog then
                  begin
                     sLinha   := FormatDateTime('hh:nn:ss', Now) + ' ' +
                                 CompletaFIM(cdsCodigo.FieldByName('CODIGO').AsString, ' ', 30) + ' - ' +
                                 'ERRO na atualização da Conta Orçamentária: ' +
                                 E.message;

                     MessageInfo := sLinha;

                     WriteLN(ArqLog, sLinha);

                     WriteLN(ArqLog, '');

                     sLinha   := FormatDateTime('hh:nn:ss', Now) + ' Processo interrompido';

                     WriteLN(ArqLog, sLinha);

                  end;  // if bLog
                  Exit;
               end;  // on E:Exception
            end;  // try..except


            // -------------------------------------------------------------------------------------
            //    COMPCONTASORCAMEN
            // -------------------------------------------------------------------------------------

            if bSubstCompConta then
            begin
               // Exclui a composição anterior
               if not(ExcluiCompContas(FormatFloat('#0', pPlano),
                                       CdsContaNova.FieldByName('IDCONTAORCAMEN').AsString
                                      )) then
               begin
                  if bLog then
                  begin
                     sLinha   := FormatDateTime('hh:nn:ss', Now) + ' ' +
                                 CompletaFIM(cdsCodigo.FieldByName('CODIGO').AsString, ' ', 30) + ' - ' +
                                 'ERRO na exclusão da Composição anterior da Conta Orçamentária.';

                     MessageInfo := sLinha;

                     WriteLN(ArqLog, sLinha);

                     WriteLN(ArqLog, '');

                     sLinha   := FormatDateTime('hh:nn:ss', Now) + ' Processo interrompido';

                     WriteLN(ArqLog, sLinha);

                     Exit;
                  end;  // if bLog
               end
               else
               begin

                  try
                     sSQL :=
                     'INSERT INTO COMPCONTASORCAMEN '                                              + #13 +
                     '( '                                                                          + #13 +
                     'IDCOMPCONTASORC, IDCONTAORCAMEN, '                                           + #13 +
                     'IDCONTACONDRES, IDCONTACONDFIM, IDCONTACONDINI, '                            + #13 +
                     'IDCONTAREFREAL, IDPLANOORCAMEN, IDCONTAREFORCADO, '                          + #13 +
                     'IDPESSOA, CODTIPRECDES, CODCENTRORESPON, IDEMPRESA, '                        + #13 +
                     'CODCENTROCUSTO, UNIDNEGOC, IDPLANOPREV, IDPATRO, '                           + #13 +
                     'PLANO, PLACONTA, RECPAG, PERCCONTAREFORC, PERCCONTAREFREA, '                 + #13 +
                     'CONDICAO, TIPOCONDINI, TIPOCONDRES, VLRCONDINI, VLRCONDRES, '                + #13 +
                     'CODTIPDOC '                                                                  + #13 +
                     ') '                                                                          + #13 +
                     '( '                                                                          + #13 +
                     'SELECT '                                                                     + #13 +
                     '   SEQCOMPCONTASORCAMEN.NEXTVAL, '                                           + #13 +

                     // IDCONTAORCAMEN
                     '   ' + QuotedStr(cdsContaNova.FieldByName('IDCONTAORCAMEN').AsString) + ', ' + #13 +

                     '   IDCONTACONDRES, IDCONTACONDFIM, IDCONTACONDINI, '                         + #13 +
                     '   IDCONTAREFREAL, IDPLANOORCAMEN, IDCONTAREFORCADO, '                       + #13 +
                     '   IDPESSOA, CODTIPRECDES, CODCENTRORESPON, IDEMPRESA, '                     + #13;

                     // ----------------------------------------------------------------------------
                     if bSubstCC then
                     begin
                        sSQL := sSQL +
                     '   ' + QuotedStr(cdsCodigo.FieldByName('CODCENTROCUSTO').AsString) + ', '    + #13;
                     end
                     else
                     begin
                        sSQL := sSQL + '   CODCENTROCUSTO, '                                       + #13;
                     end;

                     if bSubstAP then
                     begin
                        sSQL := sSQL +
                     '   ' + cdsCodigo.FieldByName('UNIDNEGOC').AsString + ', '                    + #13;
                     end
                     else
                     begin
                        sSQL := sSQL + '   UNIDNEGOC, '                                            + #13;
                     end;

                     if bSubstPP then
                     begin
                        sSQL := sSQL +
                     '   ' + cdsCodigo.FieldByName('IDPLANOPREV').AsString + ', '                  + #13;
                     end
                     else
                     begin
                        sSQL := sSQL + '   IDPLANOPREV, '                                          + #13;
                     end;

                     if bSubstPT then
                     begin
                        sSQL := sSQL +
                     '   ' + cdsCodigo.FieldByName('IDPATRO').AsString + ', '                      + #13;
                     end
                     else
                     begin
                        sSQL := sSQL + '   IDPATRO, '                                              + #13;
                     end;
                     // ----------------------------------------------------------------------------

                     sSQL := sSQL +
                     '   PLANO, PLACONTA, RECPAG, PERCCONTAREFORC, PERCCONTAREFREA, '              + #13 +
                     '   CONDICAO, TIPOCONDINI, TIPOCONDRES, VLRCONDINI, VLRCONDRES, '             + #13 +
                     '   CODTIPDOC '                                                               + #13 +
                     'FROM '                                                                       + #13 +
                     '   COMPCONTASORCAMEN '                                                       + #13 +
                     'WHERE '                                                                      + #13 +
                     '       IDPLANOORCAMEN = ' + FormatFloat('#0', pPlano)                        + #13 +
                     '   AND IDCONTAORCAMEN = ' + QuotedStr(IDContaEspelho)                        + #13 +
                     ') ';

                     ExecSQL(sSQL);

                  except
                     on E:Exception do
                     begin
                        Rollback;

                        if bLog then
                        begin
                           sLinha   := FormatDateTime('hh:nn:ss', Now) + ' ' +
                                       CompletaFIM(cdsCodigo.FieldByName('CODIGO').AsString, ' ', 30) + ' - ' +
                                       'ERRO na inserção da Composição da Conta Orçamentária: ' +
                                       E.message;

                           MessageInfo := sLinha;

                           WriteLN(ArqLog, sLinha);

                           WriteLN(ArqLog, '');

                           sLinha   := FormatDateTime('hh:nn:ss', Now) + ' Processo interrompido';

                           WriteLN(ArqLog, sLinha);
                        end;  // if bLog
                        Exit;
                     end;  // on E:Exception
                  end;  // try..except

               end;  // if not(ExcluiCompConts(...
            end;  // if bSubstCompConta

            // -------------------------------------------------------------------------------------

            if bLog then
            begin
               sLinha := FormatDateTime('hh:nn:ss', Now) + ' ' + CompletaFIM(cdsCodigo.FieldByName('CODIGO').AsString, ' ', 30);

               WriteLN(ArqLog, sLinha);
            end;  // if bLog

            inc(iAlterada);

            cdsCodigo.Next;
         end;  // while not(cdsCodigo.EOF)

         Commit;

         Result := True;

         // ----------------------------------------------------------------------------------------

      finally
         // EscondeFormProgresso
         DoProgresso([sNomeBilhete, 2, 0, iQuant, iPos, 'Atualizando Composição das Contas Orçamentárias...']);

         if bLog then
         begin
            WriteLN(ArqLog, '');

            sLinha := 'Foram alteradas ' + IntToStr(iAlterada) + ' Contas Orçamentárias, de ' +
                      IntToStr(iQuant - 1) + ' previstas.';

            WriteLN(ArqLog, sLinha);

            WriteLN(ArqLog, '');

            sLinha := FormatDateTime('hh:nn:ss', Now) + ' Término do processo.';

            WriteLN(ArqLog, sLinha);
            CloseFile(ArqLog);
         end;  // if bLog

      end;  // try..finally
   end;  // if ConnectionSide = cnsClient
end;



function  TCtrlCadContasOrcPorGrupo.ExcluiCompContas(const IDPlanoOrcamen  : String;
                                                     const IDContaNova     : String
                                                    ): Boolean;

{
                                                     const IDGrupoOrcamen  : String;
                                                     const IDEmpresaProp   : String;
                                                     const sCentroCusto    : String;
                                                     const sUnidNegocio    : String;
                                                     const sPlano          : String;
                                                     const sPatro          : String
}
var
   sSQL : String;
begin
   sSQL :=
   'DELETE FROM COMPCONTASORCAMEN '                               + #13 +
   'WHERE '                                                       + #13 +
   '       IDCONTAORCAMEN  = ' + QuotedStr(IDContaNova)           + #13 +
   '   AND IDPLANOORCAMEN  = ' + IDPlanoOrcamen;
{
   '   AND IDCONTAORCAMEN IN '                                    + #13 +
   '       ( '                                                    + #13 +
   '       SELECT '                                               + #13 +
   '          IDCONTAORCAMEN '                                    + #13 +
   '       FROM '                                                 + #13 +
   '          CONTASORCAMEN '                                     + #13 +
   '       WHERE '                                                + #13 +
   '              IDCONTAORCAMEN <> ' + QuotedStr(IDContaOrcamen) + #13 +
   '          AND IDPLANOORCAMEN  = ' + IDPlanoOrcamen            + #13 +
   '          AND IDGRUPOORCAMEN  = ' + IDGrupoOrcamen            + #13 +
   '          AND CODCENTROCUSTO  = ' + QuotedStr(sCentroCusto)   + #13 +
   '          AND IDEMPRESA       = ' + IDEmpresaProp             + #13 +
   '          AND UNIDNEGOC       = ' + sUnidNegocio              + #13 +
   '          AND IDPESSOA        = ' + IDEmpresaProp             + #13 +
   '          AND IDPLANOPREV     = ' + sPlano                    + #13 +
   '          AND IDPATRO         = ' + sPatro                    + #13 +
   '       ) ';
}
   try
      ExecSQL(sSQL);
      Result := True;
   except
      Result := False;
   end;

end;
// FIM André Pontes - pendência 10065 - 30/09/2003



// André Pontes - pendência 10065 - 06/10/2003
function  TCtrlCadContasOrcPorGrupo.ExclusaoNova(const IDGrupoOrcamen  : String;
                                                 const CodGrupoOrcamen : String;
                                                 const IDEmpresProp    : String;
                                                 const sPath           : String;
                                                 const bSubstCC        : Boolean;
                                                 const bSubstAP        : Boolean;
                                                 const bSubstPP        : Boolean;
                                                 const bSubstPT        : Boolean;
                                                 const sNomeBilhete    : String
                                                ): Boolean;
var
   iQuant    : Integer;
   iExcluida : Integer;
   iPos      : Integer;

   ArqLog    : TextFile;

   bLog      : Boolean;
   bExcluiu  : Boolean;

   sCC       : String;
   sAP       : String;
   sPP       : String;
   sPT       : String;

   sSQL      : String;
   sLinha    : String;
begin
   Result := True;

   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ExclusaoNova(IDGrupoOrcamen,
                                                  CodGrupoOrcamen,
                                                  IDEmpresProp,
                                                  bSubstCC,
                                                  bSubstAP,
                                                  bSubstPP,
                                                  bSubstPT,
                                                  sNomeBilhete
                                                 );

      if not(Result) then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      // -------------------------------------------------------------------------------------------
      try
         MontaCodigos(StrToFloat(IDGrupoOrcamen), CodGrupoOrcamen, True, sNomeBilhete);
      except
         on E:Exception do
         begin
            MessageInfo := E.Message;
            Result := False;
            Exit;
         end;
      end;
      // -------------------------------------------------------------------------------------------

      // -------------------------------------------------------------------------------------------
      try
         bLog := not(isAppServer);

         // ----------------------------------------------------------------------------------------
         // 1) Prepara gravação do arquivo de log
         // ----------------------------------------------------------------------------------------

         if bLog then
         begin
            AssignFile(ArqLog, sPath + 'ContasOrcamenEXCLUSAO' + FormatDateTime('yyyy-mm-dd', Date) + '.txt');
            ReWrite(ArqLog);

            sLinha   := FormatDateTime('hh:nn:ss', Now) + ' Início do processo...';

            WriteLN(ArqLog, sLinha);
            WriteLN(ArqLog, '');
         end;  // if bLog

         // ----------------------------------------------------------------------------------------
         // 2) Itera pelo cdsCodigo, fazendo update na CONTASORCAMEN e
         //    delete + insert na COMPCONTASORCAMEN
         // ----------------------------------------------------------------------------------------

         iQuant    := cdsCodigo.RecordCount;
         iPos      := 0;
         iExcluida := 0;

         // MostraFormProgresso
         DoProgresso([sNomeBilhete, 0, 0, iQuant, iPos, 'Excluindo Contas Orçamentárias...']);

         cdsCodigo.First;
         while not(cdsCodigo.EOF) do
         begin
            inc(iPos);

            // AndaFormProgresso
            DoProgresso([sNomeBilhete, 1, 0, iQuant, iPos, 'Excluindo Contas Orçamentárias...']);

            // Abre a tabela de contas orçamentárias, trazendo a conta que será alterada
            // *** Garante não haver problemas na inserção da CompContas, o que poderia de outra
            //     forma ocorrer (se a composição do código for mudada, p.ex.) ***
            sSQL :=
            'SELECT IDCONTAORCAMEN FROM CONTASORCAMEN '                                               + #13 +
            'WHERE '                                                                                  + #13 +
            '       IDPLANOORCAMEN = ' + FormatFloat('#0', pPlano)                                    + #13 +
            '   AND IDGRUPOORCAMEN = ' + IDGrupoOrcamen                                               + #13 +
            '   AND CODCENTROCUSTO = ' + QuotedStr(cdsCodigo.FieldByName('CODCENTROCUSTO').AsString)  + #13 +
            '   AND IDEMPRESA      = ' + IDEmpresProp                                                 + #13 +
            '   AND UNIDNEGOC      = ' + cdsCodigo.FieldByName('UNIDNEGOC').AsString                  + #13 +
            '   AND IDPESSOA       = ' + IDEmpresProp                                                 + #13 +
            '   AND IDPLANOPREV    = ' + cdsCodigo.FieldByName('IDPLANOPREV').AsString                + #13 +
            '   AND IDPATRO        = ' + cdsCodigo.FieldByName('IDPATRO').AsString;

            cdsContaNova.Close;
            cdsContaNova.Data := GetDataPacket(sSQL);
            // ----------------------------------------------------------------------------------

            if not(cdsContaNova.isEmpty) then
            begin
               StartTransaction;

               try
                  sSQL :=
                  'DELETE FROM COMPCONTASORCAMEN '                                                             + #13 +
                  'WHERE '                                                                                     + #13 +
                  '       IDPLANOORCAMEN = ' + FormatFloat('#0', pPlano)                                       + #13 +
                  '   AND IDCONTAORCAMEN = ' + QuotedStr(CdsContaNova.FieldByName('IDCONTAORCAMEN').AsString);

                  bExcluiu := ExecSQL(sSQL);

                  if bExcluiu then
                  begin
                     sSQL :=
                     'DELETE FROM CONTASORCAMEN '                                                                 + #13 +
                     'WHERE '                                                                                     + #13 +
                     '       IDPLANOORCAMEN = ' + FormatFloat('#0', pPlano)                                       + #13 +
                     '   AND IDGRUPOORCAMEN = ' + IDGrupoOrcamen                                                  + #13 +
                     '   AND IDCONTAORCAMEN = ' + QuotedStr(CdsContaNova.FieldByName('IDCONTAORCAMEN').AsString);

                     bExcluiu := ExecSQL(sSQL, True);
                  end;  // if bExcluiu

                  if bExcluiu then
                  begin
                     Commit;

                     inc(iExcluida);

                     if bLog then
                     begin
                        sLinha := FormatDateTime('hh:nn:ss', Now) + ' ' +
                                  CompletaFIM(cdsCodigo.FieldByName('CODIGO').AsString, ' ', 30);

                        WriteLN(ArqLog, sLinha);
                     end;  // if bLog
                  end
                  else  // if ExecSQL(sSQL, True)
                  begin
                     Rollback;

                     if bLog then
                     begin
                        sLinha   := FormatDateTime('hh:nn:ss', Now) + ' ' +
                                    CompletaFIM(cdsCodigo.FieldByName('CODIGO').AsString, ' ', 30) + ' - ' +
                                    'Conta Orçamentária NÃO EXCLUÍDA.';

                        MessageInfo := sLinha;

                        WriteLN(ArqLog, sLinha);
                     end;  // if bLog
                  end;  // if bExcluiu

               except
                  on E: Exception do
                  begin
                     Rollback;

                     if bLog then
                     begin
                        sLinha   := FormatDateTime('hh:nn:ss', Now) + ' ' +
                                    CompletaFIM(cdsCodigo.FieldByName('CODIGO').AsString, ' ', 30) + ' - ' +
                                    'ERRO na exclusão da Conta Orçamentária: ' + E.Message;

                        MessageInfo := sLinha;

                        WriteLN(ArqLog, sLinha);
                     end;  // if bLog
                  end;  // on E: Exception
               end;  // try..except

            end
            else  // if not(cdsContaNova.isEmpty)
            begin
               if bLog then
               begin
                  sLinha   := FormatDateTime('hh:nn:ss', Now) + ' ' +
                              CompletaFIM(cdsCodigo.FieldByName('CODIGO').AsString, ' ', 30) + ' - ' +
                              'Conta Orçamentária não encontrada.';

                  MessageInfo := sLinha;

                  WriteLN(ArqLog, sLinha);
               end;  // if bLog
            end;  // if not(cdsContaNova.isEmpty)

            cdsCodigo.Next;
         end;  // while not(cdsCodigo.EOF)

      // -------------------------------------------------------------------------------------------

      finally
         // EscondeFormProgresso
         DoProgresso([sNomeBilhete, 2, 0, iQuant, iPos, 'Atualizando Composição das Contas Orçamentárias...']);

         if bLog then
         begin
            WriteLN(ArqLog, '');

            sLinha := 'Foram excluídas ' + IntToStr(iExcluida) + ' Contas Orçamentárias, de ' +
                      IntToStr(iQuant) + ' previstas.';

            WriteLN(ArqLog, sLinha);

            WriteLN(ArqLog, '');

            sLinha := FormatDateTime('hh:nn:ss', Now) + ' Término do processo.';

            WriteLN(ArqLog, sLinha);
            CloseFile(ArqLog);
         end;  // if bLog

      end;  // try..finally
   end;  // if ConnectionSide = cnsClient
end;
// FIM André Pontes - pendência 10065 - 06/10/2003



// André Pontes - pendência 10065 - 26/09/2003
procedure TCtrlCadContasOrcPorGrupo.ExcluiContaEspelho;
var
   sSQL : String;
begin
   sSQL := 'DELETE FROM COMPCONTASORCAMEN WHERE IDCONTAORCAMEN = ''-1'' ';
   ExecSQL(sSQL);

   sSQL := 'DELETE FROM CONTASORCAMEN WHERE IDCONTAORCAMEN = ''-1'' ';
   ExecSQL(sSQL);
end;
// FIM André Pontes - pendência 10065 - 26/09/2003



// André Pontes - pendência 10065 - 02/10/2003
function TCtrlCadContasOrcPorGrupo.ExisteCombinacao(const IDPlanoOrcamen : Extended;
                                                    const IDGrupoOrcamen : Extended;
                                                    const sCentroCusto   : String;
                                                    const sUnidNegoc     : String;
                                                    const sPlano         : String;
                                                    const sPatro         : String
                                                   ): Boolean;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT COUNT(*) AS TOTAL FROM CONTASORCAMEN '                    + #13 +
   'WHERE '                                                          + #13 +
   '       IDPLANOORCAMEN = ' + FormatFloat('#0', IDPlanoOrcamen)    + #13 +
   '   AND IDGRUPOORCAMEN = ' + FormatFloat('#0', IDGrupoOrcamen)    + #13 +
   '   AND CODCENTROCUSTO = ' + QuotedStr(sCentroCusto)              + #13 +
   '   AND UNIDNEGOC      = ' + sUnidNegoc                           + #13 +
   '   AND IDPLANOPREV    = ' + sPlano                               + #13 +
   '   AND IDPATRO        = ' + sPatro;

   cdsExiste.Data := GetDataPacket(sSQL);

   Result := False;
   if cdsExiste.FieldByName('TOTAL').AsInteger > 0 then Result := True;

   cdsExiste.Close;
end;
// FIM André Pontes - pendência 10065 - 02/10/2003



// André Pontes - pendência 10065 - 24/09/2003
procedure TCtrlCadContasOrcPorGrupo.MontaCodigos(const IDGrupoOrcamen   : Extended;
                                                 const CodGrupoOrcamen  : String;
                                                 const bCalculaCodigo   : Boolean;
                                                 const sNomeBilhete     : String
                                                );
var
   sSQL        : String;

   sCampo1     : String;
   sCampo2     : String;
   sCampo3     : String;
   sCampo4     : String;
   sCampo5     : String;

   iPos        : Integer;
   iQuant      : Integer;

   iTamCod     : Integer;
   iTamCod1    : Integer;
   iTamCod2    : Integer;
   iTamCod3    : Integer;
   iTamCod4    : Integer;
   iTamCod5    : Integer;

   iTipoCod1   : Integer;
   iTipoCod2   : Integer;
   iTipoCod3   : Integer;
   iTipoCod4   : Integer;
   iTipoCod5   : Integer;
begin
   // ----------------------------------------------------------------------------------------------
   // 1) Monta o cds que conterá os registros dos códigos
   // ----------------------------------------------------------------------------------------------

   iTipoCod1   := CdsParamOrc.FieldByName('FLGTIPOCOD1').AsInteger;
   iTipoCod2   := CdsParamOrc.FieldByName('FLGTIPOCOD2').AsInteger;
   iTipoCod3   := CdsParamOrc.FieldByName('FLGTIPOCOD3').AsInteger;
   iTipoCod4   := CdsParamOrc.FieldByName('FLGTIPOCOD4').AsInteger;
   iTipoCod5   := CdsParamOrc.FieldByName('FLGTIPOCOD5').AsInteger;

   iTamCod1    := CdsParamOrc.FieldByName('TAMCOD1').AsInteger;
   iTamCod2    := CdsParamOrc.FieldByName('TAMCOD2').AsInteger;
   iTamCod3    := CdsParamOrc.FieldByName('TAMCOD3').AsInteger;
   iTamCod4    := CdsParamOrc.FieldByName('TAMCOD4').AsInteger;
   iTamCod5    := CdsParamOrc.FieldByName('TAMCOD5').AsInteger;

   iTamCod     := iTamCod1 + iTamCod2 + iTamCod3 + iTamCod4 + iTamCod5;

   sSQL :=
   'SELECT '                                                            + #13 +

//   '   ' + QuotedStr(StringOfChar(' ', iTamCod1)) + ' AS COD1, '        + #13 +
//   '   ' + QuotedStr(StringOfChar(' ', iTamCod2)) + ' AS COD2, '        + #13 +
//   '   ' + QuotedStr(StringOfChar(' ', iTamCod3)) + ' AS COD3, '        + #13 +
//   '   ' + QuotedStr(StringOfChar(' ', iTamCod4)) + ' AS COD4, '        + #13 +
//   '   ' + QuotedStr(StringOfChar(' ', iTamCod5)) + ' AS COD5, '        + #13 +

   '   ' + QuotedStr(StringOfChar(' ', iTamCod)) + ' AS CODIGO, '       + #13 +

   '   ' + QuotedStr(StringOfChar(' ', 12)) + ' AS CODGRUPOORCAMEN, '   + #13 +

   '   ' + QuotedStr(StringOfChar(' ', 10)) + ' AS CODCENTROCUSTO, '    + #13 +
   '   ' + QuotedStr(StringOfChar(' ', 10)) + ' AS CODEXTERNOCC, '      + #13 +

   '   ' + QuotedStr(StringOfChar(' ', 10)) + ' AS UNECODIGO, '         + #13 +
   '   ' + QuotedStr(StringOfChar(' ',  2)) + ' AS CODPLANO, '          + #13 +
   '   ' + QuotedStr(StringOfChar(' ',  2)) + ' AS CODPATRO, '          + #13 +

   '0.00 AS IDGRUPOORCAMEN, '                                           + #13 +
   '0.00 AS UNIDNEGOC, '                                                + #13 +
   '0.00 AS IDPLANOPREV, '                                              + #13 +
   '0.00 AS IDPATRO '                                                   + #13 +

   'FROM '                                                              + #13 +
   '   DUAL '                                                           + #13 +
   'WHERE '                                                             + #13 +
   '   1 = 2 ';

   cdsCodigo.Close;
   cdsCodigo.Data := GetDataPacket(sSQL);
   // ----------------------------------------------------------------------------------------------



   // ----------------------------------------------------------------------------------------------
   // 2) 4 loops aninhados, por Centro de Custo, Ativ/Projeto, Plano e Patro
   //    Cada iteração vai produzir um código único, e os parâmetros da conta seguirão o código
   // ----------------------------------------------------------------------------------------------

   iQuant := CdsCCSel.RecordCount * CdsAPSel.RecordCount * CdsPPSel.RecordCount * CdsPTSel.RecordCount;
   iPos   := 0;

   // MostraFormProgresso
   DoProgresso([sNomeBilhete, 0, 0, iQuant, iPos, 'Montando Códigos...']);

   CdsCCSel.First;
   while not(CdsCCSel.EOF) do
   begin

      CdsAPSel.First;
      while not(CdsAPSel.EOF) do
      begin

         CdsPPSel.First;
         while not(CdsPPSel.EOF) do
         begin

            CdsPTSel.First;
            while not(CdsPTSel.EOF) do
            begin
               inc(iPos);

               // AndaFormProgresso
               DoProgresso([sNomeBilhete, 1, 0, iQuant, iPos, 'Montando Códigos...']);

               cdsCodigo.Append;

               cdsCodigo.FieldByName('CODGRUPOORCAMEN').AsString  := CodGrupoOrcamen;
               cdsCodigo.FieldByName('CODEXTERNOCC').AsString     := CdsCCSel.FieldByName('CODEXTERNO').AsString;
               cdsCodigo.FieldByName('UNECODIGO').AsString        := CdsAPSel.FieldByName('UNECODIGO').AsString;
               cdsCodigo.FieldByName('CODPLANO').AsString         := CdsPPSel.FieldByName('CODORCAMENTO').AsString;
               cdsCodigo.FieldByName('CODPATRO').AsString         := CdsPTSel.FieldByName('CODORCAMENTO').AsString;

               cdsCodigo.FieldByName('IDGRUPOORCAMEN').AsFloat    := IDGrupoOrcamen;
               cdsCodigo.FieldByName('CODCENTROCUSTO').AsString   := CdsCCSel.FieldByName('CODCENTROCUSTO').AsString;
               cdsCodigo.FieldByName('UNIDNEGOC').AsFloat         := CdsAPSel.FieldByName('UNIDNEGOC').AsFloat;
               cdsCodigo.FieldByName('IDPLANOPREV').AsFloat       := CdsPPSel.FieldByName('IDPLANOPREV').AsFloat;
               cdsCodigo.FieldByName('IDPATRO').AsFloat           := CdsPTSel.FieldByName('IDPESSOA').AsFloat;

               cdsCodigo.Post;

               CdsPTSel.Next;
            end;  // while not(CdsPTSel.EOF)

            CdsPPSel.Next;
         end;  // while not(CdsPPSel.EOF)

         CdsAPSel.Next;
      end;  // while not(CdsAPSel.EOF)

      CdsCCSel.Next;
   end;  // while not(CdsCCSel.EOF)

   // EscondeFormProgresso
   DoProgresso([sNomeBilhete, 2, 0, iQuant, iPos, 'Montando Códigos...']);
   // ----------------------------------------------------------------------------------------------



   // ----------------------------------------------------------------------------------------------
   // 4) Define a composição do código
   // ----------------------------------------------------------------------------------------------

   case iTipoCod1 of
      1: sCampo1 := 'CODGRUPOORCAMEN';
      2: sCampo1 := 'CODEXTERNOCC';
      3: sCampo1 := 'UNECODIGO';
      4: sCampo1 := 'CODPLANO';
      5: sCampo1 := 'CODPATRO';
   end;

   case iTipoCod2 of
      1: sCampo2 := 'CODGRUPOORCAMEN';
      2: sCampo2 := 'CODEXTERNOCC';
      3: sCampo2 := 'UNECODIGO';
      4: sCampo2 := 'CODPLANO';
      5: sCampo2 := 'CODPATRO';
   end;

   case iTipoCod3 of
      1: sCampo3 := 'CODGRUPOORCAMEN';
      2: sCampo3 := 'CODEXTERNOCC';
      3: sCampo3 := 'UNECODIGO';
      4: sCampo3 := 'CODPLANO';
      5: sCampo3 := 'CODPATRO';
   end;

   case iTipoCod4 of
      1: sCampo4 := 'CODGRUPOORCAMEN';
      2: sCampo4 := 'CODEXTERNOCC';
      3: sCampo4 := 'UNECODIGO';
      4: sCampo4 := 'CODPLANO';
      5: sCampo4 := 'CODPATRO';
   end;

   case iTipoCod5 of
      1: sCampo5 := 'CODGRUPOORCAMEN';
      2: sCampo5 := 'CODEXTERNOCC';
      3: sCampo5 := 'UNECODIGO';
      4: sCampo5 := 'CODPLANO';
      5: sCampo5 := 'CODPATRO';
   end;
   // ----------------------------------------------------------------------------------------------


   // ----------------------------------------------------------------------------------------------
   // 4) Itera pelo cdsCodigo, compondo o código final
   // ----------------------------------------------------------------------------------------------

   if bCalculaCodigo then
   begin
      iPos := 0;

      // MostraFormProgresso
      DoProgresso([sNomeBilhete, 0, 0, iQuant, iPos, 'Montando Códigos...']);

      cdsCodigo.First;
      while not(cdsCodigo.EOF) do
      begin
         inc(iPos);

         // AndaFormProgresso
         DoProgresso([sNomeBilhete, 1, 0, iQuant, iPos, 'Montando Códigos...']);

         cdsCodigo.Edit;
         cdsCodigo.FieldByName('CODIGO').AsString  := CompletaInicio(cdsCodigo.FieldByName(sCampo1).AsString, '0', iTamCod1) +
                                                      CompletaInicio(cdsCodigo.FieldByName(sCampo2).AsString, '0', iTamCod2) +
                                                      CompletaInicio(cdsCodigo.FieldByName(sCampo3).AsString, '0', iTamCod3) +
                                                      CompletaInicio(cdsCodigo.FieldByName(sCampo4).AsString, '0', iTamCod4) +
                                                      CompletaInicio(cdsCodigo.FieldByName(sCampo5).AsString, '0', iTamCod5);
         cdsCodigo.Post;
         cdsCodigo.Next;
      end;

      // EscondeFormProgresso
      DoProgresso([sNomeBilhete, 2, 0, iQuant, iPos, 'Montando Códigos...']);
   end;  // if bCalculaCodigo
   // ----------------------------------------------------------------------------------------------
end;
// FIM André Pontes - pendência 10065 - 24/09/2003



function TCtrlCadContasOrcPorGrupo.AtualizaTabela(pSql : String) : Boolean;
begin
   Application.ProcessMessages;

   if (memStatus.Tag = 0) then
   begin
      if (ConnectionSide = cnsClient) then
      begin
        Result := Connection.AppServer.AtualizaTabela(pSql);

        if not Result then MessageInfo := Connection.AppServer.MessageInfo;
      end
      else
      begin
         try
            ExecSql(pSql);
            Result := True;
         except
            on E: exception do
            begin
               MessageInfo := E.Message;
               Result := False;
            end;
         end;
      end;
   end
   else
   begin
      MessageInfo := 'Processo cancelado pelo usuário' + #13 + #10;
      GravaLog(MessageInfo);
      Result := False;
   end;
end;





// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
procedure TCtrlCadContasOrcPorGrupo.SetCdsAtivProj(Const Value: TClientDataSet);
begin FCdsAtivProj := Value; end;

procedure TCtrlCadContasOrcPorGrupo.SetCdsGrupoOrc(Const Value: TClientDataSet);
begin FCdsGrupoOrc := Value; end;

procedure TCtrlCadContasOrcPorGrupo.SetCdsCentroDeCusto(Const Value: TClientDataSet);
begin FCdsCentroDeCusto := Value; end;

procedure TCtrlCadContasOrcPorGrupo.SetCdsPatro(Const Value: TClientDataSet);
begin FCdsPatro := Value; end;

procedure TCtrlCadContasOrcPorGrupo.SetCdsConta(Const Value: TClientDataSet);
begin FCdsConta := Value; end;

procedure TCtrlCadContasOrcPorGrupo.SetCdsPlanoPrev(Const Value: TClientDataSet);
begin FCdsPlanoPrev := Value; end;

procedure TCtrlCadContasOrcPorGrupo.SetCdsBase(Const Value: TClientDataSet);
begin FCdsBase := Value; end;

procedure TCtrlCadContasOrcPorGrupo.SetCdsOrigem(Const Value: TClientDataSet);
begin FCdsOrigem := Value; end;

procedure TCtrlCadContasOrcPorGrupo.SetCdsDataView(Const Value: TClientDataSet);
begin FCdsDataView := Value; end;

procedure TCtrlCadContasOrcPorGrupo.SetCdsAPSel(const Value: TClientDataSet);
begin FCdsAPSel := Value; end;

procedure TCtrlCadContasOrcPorGrupo.SetCdsCCSel(const Value: TClientDataSet);
begin FCdsCCSel := Value; end;

procedure TCtrlCadContasOrcPorGrupo.SetCdsPPSel(const Value: TClientDataSet);
begin FCdsPPSel := Value; end;

procedure TCtrlCadContasOrcPorGrupo.SetCdsPTSel(const Value: TClientDataSet);
begin FCdsPTSel := Value; end;

procedure TCtrlCadContasOrcPorGrupo.SetCdsCampoSel(const Value: TClientDataSet);
begin FCdsCampoSel := Value; end;

procedure TCtrlCadContasOrcPorGrupo.SetCdsParamOrc(const Value: TClientDataSet);
begin FCdsParamOrc := Value; end;

procedure TCtrlCadContasOrcPorGrupo.SetCdsContaEspelho(const Value: TClientDataSet);
begin FCdsContaEspelho := Value; end;

procedure TCtrlCadContasOrcPorGrupo.SetCdsContaNova(const Value: TClientDataSet);
begin FCdsContaNova := Value; end;

procedure TCtrlCadContasOrcPorGrupo.SetCdsCentRespon(const Value: TClientDataSet);
begin FCdsCentRespon := Value; end;

procedure TCtrlCadContasOrcPorGrupo.SetCdsCRSel(const Value: TClientDataSet);
begin FCdsCRSel := Value; end;
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------





function TCtrlCadContasOrcPorGrupo.InclusaoNovaCR(const IDGrupoOrcamen  : Extended;
                                                  const CodGrupoOrcamen : String;
                                                  const IDContaOrcamen  : String;
                                                  const sPath           : String;
                                                  const bSubstCR        : Boolean;
                                                  const bSubstCC        : Boolean;
                                                  const bSubstAP        : Boolean;
                                                  const bSubstPP        : Boolean;
                                                  const bSubstPT        : Boolean;
                                                  const sNomeBilhete    : String
                                                 ): Boolean;
var
   ArqLog   : TextFile;
   iTamanho : Integer;

   iQuant   : Integer;
   iCriada  : Integer;
   iPos     : Integer;

   bLog     : Boolean;
   bInseriu : Boolean;

   sCC      : String;
   sAP      : String;
   sPP      : String;
   sPT      : String;

   sSQL     : String;
   sLinha   : String;
   sCodigo  : String;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.InclusaoNovaCR(IDGrupoOrcamen,
                                                    CodGrupoOrcamen,
                                                    IDContaOrcamen,
                                                    sPath,
                                                    bSubstCR,
                                                    bSubstCC,
                                                    bSubstAP,
                                                    bSubstPP,
                                                    bSubstPT,
                                                    sNomeBilhete
                                                   );

      if not(Result) then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         MontaCodigosCR(IDGrupoOrcamen, CodGrupoOrcamen, True, sNomeBilhete);
      except
         on E:Exception do
         begin
            MessageInfo := E.Message;
            Result := False;
            Exit;
         end;
      end;

      try
         bLog := not(isAppServer);

         // ----------------------------------------------------------------------------------------
         // 1) Prepara gravação do arquivo de log
         // ----------------------------------------------------------------------------------------

         if bLog then
         begin
            AssignFile(ArqLog, sPath + 'ContasOrcamenINCLUSAO' + FormatDateTime('yyyy-mm-dd', Date) + '.txt');
            ReWrite(ArqLog);

            sLinha   := FormatDateTime('hh:nn:ss', Now) + ' Início do processo...';

            WriteLN(ArqLog, sLinha);
            WriteLN(ArqLog, '');
         end;  // if bLog


         // ----------------------------------------------------------------------------------------
         // 2) Itera pelo cdsCodigo, fazendo Insert na CONTASORCAMEN e COMPCONTASORCAMEN
         // ----------------------------------------------------------------------------------------

         StartTransaction;

         iQuant   := cdsCodigo.RecordCount;
         iPos     := 0;
         iCriada  := 0;

         // MostraFormProgresso
         DoProgresso([sNomeBilhete, 0, 0, iQuant, iPos, 'Criando Contas Orçamentárias...']);

         cdsCodigo.First;
         while not(cdsCodigo.EOF) do
         begin
            inc(iPos);

            // AndaFormProgresso
            DoProgresso([sNomeBilhete, 1, 0, iQuant, iPos, 'Criando Contas Orçamentárias...']);

            // -------------------------------------------------------------------------------------
            //    Verifica se a combinação já existe
            // -------------------------------------------------------------------------------------

            if ExisteCombinacaoCR(pPlano,
                                  cdsCodigo.FieldByName('IDGRUPOORCAMEN').AsFloat,
                                  cdsCodigo.FieldByName('CODCENTRORESPON').AsString,
                                  cdsCodigo.FieldByName('CODCENTROCUSTO').AsString,
                                  cdsCodigo.FieldByName('UNIDNEGOC').AsString,
                                  cdsCodigo.FieldByName('IDPLANOPREV').AsString,
                                  cdsCodigo.FieldByName('IDPATRO').AsString
                                 ) then
            begin
               if bLog then
               begin
                  sLinha   := FormatDateTime('hh:nn:ss', Now) + ' ' +
                              CompletaFIM(cdsCodigo.FieldByName('CODIGO').AsString, ' ', 30) + ' - ' +
                              'Já existe uma conta orçamentária com os mesmos parâmetros.';

                  WriteLN(ArqLog, sLinha);
               end;  // if bLog

               cdsCodigo.Next;
               Continue;
            end;


            // -------------------------------------------------------------------------------------
            //    CONTASORCAMEN
            // -------------------------------------------------------------------------------------

            try
               sSQL :=
               'INSERT INTO CONTASORCAMEN '                                                        + #13 +
               '( '                                                                                + #13 +
               'IDPESSOA, IDPLANOORCAMEN, IDGRUPOORCAMEN, '                                        + #13 +
               'IDCONTAORCAMEN, '                                                                  + #13 +
               'NOMECONTAORCAMEN, CODCENTRORESPON, '                                               + #13 +
               'CODCENTROCUSTO, IDEMPRESA, UNIDNEGOC, IDPLANOPREV, IDPATRO, '                      + #13 +
               'TIPOCALCREALIZADO, FORMULAREALIZADO, VLRINFORMADOREAL, '                           + #13 +
               'TIPOCALCORCADO, FORMULAORCADO, VLRINFORMADOORC, '                                  + #13 +
               'OBSERVACAO, '                                                                      + #13 +
               'FLGCONTAMONETARIA, FLGSINALCONTA, FLGCALCORCADO, FLGCALCREAL, FLGINFDIAMES, '      + #13 +
               'FLGACUMULADO, FLGTRANSFSALDO, FLGATIVA, DATAATIVA, DATAINATIVA, '                  + #13 +
               'IDDATAVIEW, ORIGEMCMDV '                                                           + #13 +
               ') '                                                                                + #13 +
               '( '                                                                                + #13 +
               'SELECT '                                                                           + #13 +
               '   IDPESSOA, IDPLANOORCAMEN, IDGRUPOORCAMEN, '                                     + #13 +

               // IDCONTAORCAMEN
               '   ' + QuotedStr(cdsCodigo.FieldByName('CODIGO').AsString) + ', '                  + #13 +

               '   NOMECONTAORCAMEN, '                                                             + #13 +
               '   ' + QuotedStr(cdsCodigo.FieldByName('CODCENTRORESPON').AsString) + ', '         + #13;

               // Centro de Custo, Ativ/Proj, Plano, Patro -----------------------------------------
               if not(cdsCodigo.FieldByName('CODCENTROCUSTO').IsNull)
                  and (length(trim(cdsCodigo.FieldByName('CODCENTROCUSTO').AsString)) > 0) then
               begin
                  sSQL := sSQL +
               '   ' + QuotedStr(cdsCodigo.FieldByName('CODCENTROCUSTO').AsString) + ', '          + #13 +
               '   ' + FormatFloat(#0, pIDEmpresa) + ', '                                          + #13;
               end
               else
               begin
                  sSQL := sSQL +
               '   NULL, NULL, '                                                                   + #13;
               end;

               if not(cdsCodigo.FieldByName('UNIDNEGOC').IsNull)
                  and (cdsCodigo.FieldByName('UNIDNEGOC').AsFloat > 0) then
               begin
                  sSQL := sSQL +
               '   ' + cdsCodigo.FieldByName('UNIDNEGOC').AsString + ', '                          + #13;
               end
               else
               begin
                  sSQL := sSQL +
               '   NULL, '                                                                         + #13;
               end;

               if not(cdsCodigo.FieldByName('IDPLANOPREV').IsNull)
                  and (cdsCodigo.FieldByName('IDPLANOPREV').AsFloat > 0) then
               begin
                  sSQL := sSQL +
               '   ' + cdsCodigo.FieldByName('IDPLANOPREV').AsString + ', '                        + #13;
               end
               else
               begin
                  sSQL := sSQL +
               '   NULL, '                                                                         + #13;
               end;

               if not(cdsCodigo.FieldByName('IDPATRO').IsNull)
                  and (cdsCodigo.FieldByName('IDPATRO').AsFloat > 0) then
               begin
                  sSQL := sSQL +
               '   ' + cdsCodigo.FieldByName('IDPATRO').AsString + ', '                            + #13;
               end
               else
               begin
                  sSQL := sSQL +
               '   NULL, '                                                                         + #13;
               end;
               // ----------------------------------------------------------------------------------

               sSQL := sSQL +
               '   TIPOCALCREALIZADO, FORMULAREALIZADO, VLRINFORMADOREAL, '                        + #13 +
               '   TIPOCALCORCADO, FORMULAORCADO, VLRINFORMADOORC, '                               + #13 +
               '   OBSERVACAO, '                                                                   + #13 +
               '   FLGCONTAMONETARIA, FLGSINALCONTA, FLGCALCORCADO, FLGCALCREAL, FLGINFDIAMES, '   + #13 +
               '   FLGACUMULADO, FLGTRANSFSALDO, FLGATIVA, DATAATIVA, DATAINATIVA, '               + #13 +
               '   IDDATAVIEW, ORIGEMCMDV '                                                        + #13 +
               'FROM '                                                                             + #13 +
               '   CONTASORCAMEN '                                                                 + #13 +
               'WHERE '                                                                            + #13 +
               '   IDCONTAORCAMEN = ''-1'' '                                                       + #13 +
               ') ';

               bInseriu := ExecSQL(sSQL);
               if not(bInseriu) then Raise Exception.Create('Erro');

            except
               on E:Exception do
               begin
                  Rollback;

                  if bLog then
                  begin
                     sLinha   := FormatDateTime('hh:nn:ss', Now) + ' ' +
                                 CompletaFIM(cdsCodigo.FieldByName('CODIGO').AsString, ' ', 30) + ' - ' +
                                 'ERRO na inserção da Conta Orçamentária: ' +
                                 E.message;

                     MessageInfo := sLinha;

                     WriteLN(ArqLog, sLinha);

                     WriteLN(ArqLog, '');

                     sLinha   := FormatDateTime('hh:nn:ss', Now) + ' Processo interrompido';

                     WriteLN(ArqLog, sLinha);

                  end;  // if bLog
                  Exit;
               end;  // on E:Exception
            end;  // try..except


            // -------------------------------------------------------------------------------------
            //    COMPCONTASORCAMEN
            // -------------------------------------------------------------------------------------

            try
               sSQL :=
               'INSERT INTO COMPCONTASORCAMEN '                                           + #13 +
               '( '                                                                       + #13 +
               'IDCOMPCONTASORC, IDCONTAORCAMEN, '                                        + #13 +
               'IDCONTACONDRES, IDCONTACONDFIM, IDCONTACONDINI, '                         + #13 +
               'IDCONTAREFREAL, IDPLANOORCAMEN, IDCONTAREFORCADO, '                       + #13 +
               'IDPESSOA, CODTIPRECDES, CODCENTRORESPON, '                                + #13 +
               'CODCENTROCUSTO, IDEMPRESA, UNIDNEGOC, IDPLANOPREV, IDPATRO, '             + #13 +
               'PLANO, PLACONTA, RECPAG, PERCCONTAREFORC, PERCCONTAREFREA, '              + #13 +
               'CONDICAO, TIPOCONDINI, TIPOCONDRES, VLRCONDINI, VLRCONDRES, '             + #13 +
               'CODTIPDOC '                                                               + #13 +
               ') '                                                                       + #13 +
               '( '                                                                       + #13 +
               'SELECT '                                                                  + #13 +
               '   SEQCOMPCONTASORCAMEN.NEXTVAL, '                                        + #13 +

               // IDCONTAORCAMEN
               '   ' + QuotedStr(cdsCodigo.FieldByName('CODIGO').AsString) + ', '         + #13 +

               '   IDCONTACONDRES, IDCONTACONDFIM, IDCONTACONDINI, '                      + #13 +
               '   IDCONTAREFREAL, IDPLANOORCAMEN, IDCONTAREFORCADO, '                    + #13 +
               '   IDPESSOA, CODTIPRECDES, '                                              + #13;

               // ----------------------------------------------------------------------------------
               if (bSubstCR) and not(cdsCodigo.FieldByName('CODCENTRORESPON').IsNull)
                  and (length(trim(cdsCodigo.FieldByName('CODCENTRORESPON').AsString)) > 0) then
               begin
                  sSQL := sSQL +
               '   ' + QuotedStr(cdsCodigo.FieldByName('CODCENTRORESPON').AsString) + ', '+ #13;
               end
               else
               begin
                  sSQL := sSQL + '   CODCENTRORESPON, '                                   + #13;
               end;

               if (bSubstCC) and not(cdsCodigo.FieldByName('CODCENTROCUSTO').IsNull)
                  and (length(trim(cdsCodigo.FieldByName('CODCENTROCUSTO').AsString)) > 0) then
               begin
                  sSQL := sSQL +
               '   ' + QuotedStr(cdsCodigo.FieldByName('CODCENTROCUSTO').AsString) + ', ' + #13 +
               '   ' + FormatFloat(#0, pIDEmpresa) + ', '                                 + #13;
               end
               else
               begin
                  sSQL := sSQL + '   CODCENTROCUSTO, IDEMPRESA, '                         + #13;
               end;

               if (bSubstAP) and not(cdsCodigo.FieldByName('UNIDNEGOC').IsNull)
                  and (cdsCodigo.FieldByName('UNIDNEGOC').AsFloat > 0) then
               begin
                  sSQL := sSQL +
               '   ' + cdsCodigo.FieldByName('UNIDNEGOC').AsString + ', '                 + #13;
               end
               else
               begin
                  sSQL := sSQL + '   UNIDNEGOC, '                                         + #13;
               end;

               if (bSubstPP) and not(cdsCodigo.FieldByName('IDPLANOPREV').IsNull)
                  and (cdsCodigo.FieldByName('IDPLANOPREV').AsFloat > 0) then
               begin
                  sSQL := sSQL +
               '   ' + cdsCodigo.FieldByName('IDPLANOPREV').AsString + ', '               + #13;
               end
               else
               begin
                  sSQL := sSQL + '   IDPLANOPREV, '                                       + #13;
               end;

               if (bSubstPT) and not(cdsCodigo.FieldByName('IDPATRO').IsNull)
                  and (cdsCodigo.FieldByName('IDPATRO').AsFloat > 0) then
               begin
                  sSQL := sSQL +
               '   ' + cdsCodigo.FieldByName('IDPATRO').AsString + ', '                   + #13;
               end
               else
               begin
                  sSQL := sSQL + '   IDPATRO, '                                           + #13;
               end;
               // ----------------------------------------------------------------------------------

               sSQL := sSQL +
               'PLANO, PLACONTA, RECPAG, PERCCONTAREFORC, PERCCONTAREFREA, '              + #13 +
               'CONDICAO, TIPOCONDINI, TIPOCONDRES, VLRCONDINI, VLRCONDRES, '             + #13 +
               'CODTIPDOC '                                                               + #13 +
               'FROM '                                                                    + #13 +
               '   COMPCONTASORCAMEN '                                                    + #13 +
               'WHERE '                                                                   + #13 +
               '   IDCONTAORCAMEN = ''-1'' '                                              + #13 +
               ') ';

               bInseriu := ExecSQL(sSQL);
               if not(bInseriu) then Raise Exception.Create('Erro');

            except
               on E:Exception do
               begin
                  Rollback;

                  if bLog then
                  begin
                     sLinha   := FormatDateTime('hh:nn:ss', Now) + ' ' +
                                 CompletaFIM(cdsCodigo.FieldByName('CODIGO').AsString, ' ', 30) + ' - ' +
                                 'ERRO na inserção da Composição da Conta Orçamentária: ' +
                                 E.message;

                     MessageInfo := sLinha;

                     WriteLN(ArqLog, sLinha);

                     WriteLN(ArqLog, '');

                     sLinha   := FormatDateTime('hh:nn:ss', Now) + ' Processo interrompido';

                     WriteLN(ArqLog, sLinha);
                  end;  // if bLog

                  Exit;
               end;  // on E:Exception
            end;  // try..except

            // -------------------------------------------------------------------------------------

            if bLog then
            begin
               sLinha := FormatDateTime('hh:nn:ss', Now) + ' ' + CompletaFIM(cdsCodigo.FieldByName('CODIGO').AsString, ' ', 30);

               WriteLN(ArqLog, sLinha);
            end;  // if bLog

            inc(iCriada);

            cdsCodigo.Next;
         end;  // while not(cdsCodigo.EOF)

         Commit;

         // ----------------------------------------------------------------------------------------
         // 3) Exclui a conta "base"
         // ----------------------------------------------------------------------------------------
         ExcluiContaEspelho;
         // ----------------------------------------------------------------------------------------

         Result := True;

      finally
         // EscondeFormProgresso
         DoProgresso([sNomeBilhete, 2, 0, iQuant, iPos, 'Criando Contas Orçamentárias...']);

         if bLog then
         begin
            WriteLN(ArqLog, '');

            sLinha := 'Foram criadas ' + IntToStr(iCriada) + ' Contas Orçamentárias, de ' +
                      IntToStr(iQuant) + ' previstas.';

            WriteLN(ArqLog, sLinha);

            WriteLN(ArqLog, '');

            sLinha := FormatDateTime('hh:nn:ss', Now) + ' Término do processo.';

            WriteLN(ArqLog, sLinha);
            CloseFile(ArqLog);
         end;  // if bLog
      end;  // try..finally
   end;  // if ConnectionSide = cnsClient
end;



function TCtrlCadContasOrcPorGrupo.AlteracaoNovaCR(const IDContaEspelho  : String;
                                                   const IDGrupoOrcamen  : String;
                                                   const CodGrupoOrcamen : String;
                                                   const IDEmpresProp    : String;
                                                   const sPath           : String;
                                                   const bSubstCompConta : Boolean;
                                                   const bSubstCR        : Boolean;
                                                   const bSubstCC        : Boolean;
                                                   const bSubstAP        : Boolean;
                                                   const bSubstPP        : Boolean;
                                                   const bSubstPT        : Boolean;
                                                   const sNomeBilhete    : String
                                                  ): Boolean;
var
   iQuant    : Integer;
   iAlterada : Integer;
   iPos      : Integer;

   ArqLog    : TextFile;

   bLog      : Boolean;
   bAlterou  : Boolean;

   sCC       : String;
   sAP       : String;
   sPP       : String;
   sPT       : String;

   sSQL      : String;
   sLinha    : String;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AlteracaoNovaCR(IDContaEspelho,
                                                     IDGrupoOrcamen,
                                                     CodGrupoOrcamen,
                                                     IDEmpresProp,
                                                     bSubstCompConta,
                                                     bSubstCR,
                                                     bSubstCC,
                                                     bSubstAP,
                                                     bSubstPP,
                                                     bSubstPT,
                                                     sNomeBilhete
                                                    );

      if not(Result) then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      // -------------------------------------------------------------------------------------------
      try
         MontaCodigosCR(StrToFloat(IDGrupoOrcamen), CodGrupoOrcamen, True, sNomeBilhete);
      except
         on E:Exception do
         begin
            MessageInfo := E.Message;
            Result := False;
            Exit;
         end;
      end;
      // -------------------------------------------------------------------------------------------

      // -------------------------------------------------------------------------------------------
      try
         bLog := not(isAppServer);

         // ----------------------------------------------------------------------------------------
         // 1) Prepara gravação do arquivo de log
         // ----------------------------------------------------------------------------------------

         if bLog then
         begin
            AssignFile(ArqLog, sPath + 'ContasOrcamenALTERACAO' + FormatDateTime('yyyy-mm-dd', Date) + '.txt');
            ReWrite(ArqLog);

            sLinha   := FormatDateTime('hh:nn:ss', Now) + ' Início do processo...';

            WriteLN(ArqLog, sLinha);
            WriteLN(ArqLog, '');
         end;  // if bLog

         // ----------------------------------------------------------------------------------------
         // 2) Itera pelo cdsCodigo, fazendo update na CONTASORCAMEN e
         //    delete + insert na COMPCONTASORCAMEN
         // ----------------------------------------------------------------------------------------

         StartTransaction;

         iQuant    := cdsCodigo.RecordCount;
         iPos      := 0;
         iAlterada := 0;

         // MostraFormProgresso
         DoProgresso([sNomeBilhete, 0, 0, iQuant, iPos, 'Atualizando Contas Orçamentárias...']);

         // Abre a tabela de contas orçamentárias, trazendo a conta que será usada como "espelho"
         sSQL :=
         'SELECT * '                + #13 +
         'FROM '                    + #13 +
         '   CONTASORCAMEN '        + #13 +
         'WHERE '                                                 + #13 +
         '       IDPLANOORCAMEN = ' + FormatFloat('#0', pPlano)   + #13 +
         '   AND IDGRUPOORCAMEN = ' + IDGrupoOrcamen              + #13 +
         '   AND IDCONTAORCAMEN = ' + QuotedStr(IDContaEspelho);

         cdsContaEspelho.Close;
         cdsContaEspelho.Data := GetDataPacket(sSQL);
         // ----------------------------------------------------------------------------------

         cdsCodigo.First;
         while not(cdsCodigo.EOF) do
         begin
            inc(iPos);

            // AndaFormProgresso
            DoProgresso([sNomeBilhete, 1, 0, iQuant, iPos, 'Atualizando Contas Orçamentárias...']);

            // -------------------------------------------------------------------------------------
            //    CONTASORCAMEN
            // -------------------------------------------------------------------------------------

            try
               // ----------------------------------------------------------------------------------
               // Abre a tabela de contas orçamentárias, trazendo a conta que será alterada
               // *** Garante não haver problemas na nova inserção da CompContas, o que poderia de
               //     outra forma ocorrer (se a composição do código for mudada, p.ex.) ***
               // ----------------------------------------------------------------------------------
               sSQL :=
               'SELECT IDCONTAORCAMEN FROM CONTASORCAMEN '                                                  + #13 +
               'WHERE '                                                                                     + #13 +
               '       IDPLANOORCAMEN  = ' + FormatFloat('#0', pPlano)                                      + #13 +
               '   AND IDGRUPOORCAMEN  = ' + IDGrupoOrcamen                                                 + #13 +
               '   AND CODCENTRORESPON = ' + QuotedStr(cdsCodigo.FieldByName('CODCENTRORESPON').AsString)   + #13;

               // ----------------------------------------------------------------------------------
               if not(cdsCodigo.FieldByName('CODCENTROCUSTO').IsNULL)
                  and (length(trim(cdsCodigo.FieldByName('CODCENTROCUSTO').AsString)) > 0) then
               begin
                  sSQL := sSQL +
               '   AND CODCENTROCUSTO  = ' + QuotedStr(cdsCodigo.FieldByName('CODCENTROCUSTO').AsString)    + #13 +
               '   AND IDEMPRESA       = ' + IDEmpresProp                                                   + #13;
               end
               else
               begin
                  sSQL := sSQL +
               '   AND CODCENTROCUSTO  IS NULL '                                                            + #13;
               end;

               if not(cdsCodigo.FieldByName('UNIDNEGOC').IsNULL)
                  and (cdsCodigo.FieldByName('UNIDNEGOC').AsFloat > 0) then
               begin
                  sSQL := sSQL +
               '   AND UNIDNEGOC       = ' + cdsCodigo.FieldByName('UNIDNEGOC').AsString                    + #13;
               end
               else
               begin
                  sSQL := sSQL +
               '   AND UNIDNEGOC       IS NULL '                                                            + #13;
               end;

               if not(cdsCodigo.FieldByName('IDPLANOPREV').IsNULL)
                  and (cdsCodigo.FieldByName('IDPLANOPREV').AsFloat > 0) then
               begin
                  sSQL := sSQL +
               '   AND IDPLANOPREV     = ' + cdsCodigo.FieldByName('IDPLANOPREV').AsString                  + #13;
               end
               else
               begin
                  sSQL := sSQL +
               '   AND IDPLANOPREV     IS NULL '                                                            + #13;
               end;

               if not(cdsCodigo.FieldByName('IDPATRO').IsNULL)
                  and (cdsCodigo.FieldByName('IDPATRO').AsFloat > 0) then
               begin
                  sSQL := sSQL +
               '   AND IDPATRO         = ' + cdsCodigo.FieldByName('IDPATRO').AsString;
               end
               else
               begin
                  sSQL := sSQL +
               '   AND IDPATRO         IS NULL ';
               end;
               // ----------------------------------------------------------------------------------

               cdsContaNova.Close;
               cdsContaNova.Data := GetDataPacket(sSQL);
               // ----------------------------------------------------------------------------------


               // ----------------------------------------------------------------------------------
               //    Se a conta atual for a própria conta espelho, pula o registro, verifica se
               //    deve alterar a composição da mesma, mas não faz (delete + insert)
               // ----------------------------------------------------------------------------------
               if CdsContaNova.FieldByName('IDCONTAORCAMEN').AsString = CdsContaEspelho.FieldByName('IDCONTAORCAMEN').AsString then
               begin
                  if bSubstCompConta then
                  begin
                     try
                        if (bSubstCR) and not(cdsCodigo.FieldByName('CODCENTRORESPON').IsNull)
                           and (length(trim(cdsCodigo.FieldByName('CODCENTRORESPON').AsString)) > 0) then
                        begin
                           sSQL :=
                           'UPDATE COMPCONTASORCAMEN '                                                            + #13 +
                           'SET '                                                                                 + #13 +
                           '   CODCENTRORESPON = ' + QuotedStr(cdsCodigo.FieldByName('CODCENTRORESPON').AsString) + #13 +
                           'WHERE '                                                                               + #13 +
                           '   IDCONTAORCAMEN  = ' + QuotedStr(IDContaEspelho);

                           bAlterou := ExecSQL(sSQL);
                           if not(bAlterou) then Raise Exception.Create('Erro');
                        end;

                        if (bSubstCC) and not(cdsCodigo.FieldByName('CODCENTROCUSTO').IsNull)
                           and (length(trim(cdsCodigo.FieldByName('CODCENTROCUSTO').AsString)) > 0) then
                        begin
                           sSQL :=
                           'UPDATE COMPCONTASORCAMEN '                                                            + #13 +
                           'SET '                                                                                 + #13 +
                           '   CODCENTROCUSTO = ' + QuotedStr(cdsCodigo.FieldByName('CODCENTROCUSTO').AsString)   + #13 +
                           'WHERE '                                                                               + #13 +
                           '   IDCONTAORCAMEN = ' + QuotedStr(IDContaEspelho);

                           ExecSQL(sSQL);
                        end;

                        if (bSubstAP) and not(cdsCodigo.FieldByName('UNIDNEGOC').IsNull)
                           and (cdsCodigo.FieldByName('UNIDNEGOC').AsFloat > 0) then
                        begin
                           sSQL :=
                           'UPDATE COMPCONTASORCAMEN '                                          + #13 +
                           'SET '                                                               + #13 +
                           '   UNIDNEGOC      = ' + cdsCodigo.FieldByName('UNIDNEGOC').AsString + #13 +
                           'WHERE '                                                             + #13 +
                           '   IDCONTAORCAMEN = ' + QuotedStr(IDContaEspelho);

                           bAlterou := ExecSQL(sSQL);
                           if not(bAlterou) then Raise Exception.Create('Erro');
                        end;

                        if (bSubstPP) and not(cdsCodigo.FieldByName('IDPLANOPREV').IsNull)
                           and (cdsCodigo.FieldByName('IDPLANOPREV').AsFloat > 0) then
                        begin
                           sSQL :=
                           'UPDATE COMPCONTASORCAMEN '                                             + #13 +
                           'SET '                                                                  + #13 +
                           '   IDPLANOPREV    = ' + cdsCodigo.FieldByName('IDPLANOPREV').AsString  + #13 +
                           'WHERE '                                                                + #13 +
                           '   IDCONTAORCAMEN = ' + QuotedStr(IDContaEspelho);

                           bAlterou := ExecSQL(sSQL);
                           if not(bAlterou) then Raise Exception.Create('Erro');
                        end;

                        if (bSubstPT) and not(cdsCodigo.FieldByName('IDPATRO').IsNull)
                           and (cdsCodigo.FieldByName('IDPATRO').AsFloat > 0) then
                        begin
                           sSQL :=
                           'UPDATE COMPCONTASORCAMEN '                                          + #13 +
                           'SET '                                                               + #13 +
                           '   IDPATRO        = ' + cdsCodigo.FieldByName('IDPATRO').AsString   + #13 +
                           'WHERE '                                                             + #13 +
                           '   IDCONTAORCAMEN = ' + QuotedStr(IDContaEspelho);

                           bAlterou := ExecSQL(sSQL);
                           if not(bAlterou) then Raise Exception.Create('Erro');
                        end;

                     except

                        on E:Exception do
                        begin
                           Rollback;

                           if bLog then
                           begin
                              sLinha   := FormatDateTime('hh:nn:ss', Now) + ' ' +
                                         CompletaInicio(IDContaEspelho, ' ', 25) + ' - ' +
                                         'ERRO na atualização da Composição da Conta Orçamentária: ' +
                                         E.message;

                              MessageInfo := sLinha;

                              WriteLN(ArqLog, sLinha);
                              WriteLN(ArqLog, '');

                              sLinha   := FormatDateTime('hh:nn:ss', Now) + ' Processo interrompido';

                              WriteLN(ArqLog, sLinha);
                           end;  // if bLog
                           Exit;
                        end;  // on E:Exception
                     end;  // try..except

                  end;  // if bSubstCompConta

                  cdsCodigo.Next;
                  Continue;
               end;
               // ----------------------------------------------------------------------------------


               sSQL :=
               'UPDATE CONTASORCAMEN '                                                                                     + #13 +
               'SET '                                                                                                      + #13 +
               '   NOMECONTAORCAMEN    = ' + QuotedStr(cdsContaEspelho.FieldByName('NOMECONTAORCAMEN').AsString)  + ', '   + #13 +
//               '   CODCENTRORESPON     = ' + QuotedStr(cdsContaEspelho.FieldByName('CODCENTRORESPON').AsString)   + ', '   + #13 +
               '   TIPOCALCREALIZADO   = ' + QuotedStr(cdsContaEspelho.FieldByName('TIPOCALCREALIZADO').AsString) + ', '   + #13 +
               '   FORMULAREALIZADO    = ' + QuotedStr(cdsContaEspelho.FieldByName('FORMULAREALIZADO').AsString)  + ', '   + #13 +
               '   VLRINFORMADOREAL    = ' + QuotedStr(cdsContaEspelho.FieldByName('VLRINFORMADOREAL').AsString)  + ', '   + #13 +
               '   TIPOCALCORCADO      = ' + QuotedStr(cdsContaEspelho.FieldByName('TIPOCALCORCADO').AsString)    + ', '   + #13 +
               '   FORMULAORCADO       = ' + QuotedStr(cdsContaEspelho.FieldByName('FORMULAORCADO').AsString)     + ', '   + #13 +
               '   VLRINFORMADOORC     = ' + QuotedStr(cdsContaEspelho.FieldByName('VLRINFORMADOORC').AsString)   + ', '   + #13 +
               '   OBSERVACAO          = ' + QuotedStr(cdsContaEspelho.FieldByName('OBSERVACAO').AsString)        + ', '   + #13 +
               '   FLGCONTAMONETARIA   = ' + QuotedStr(cdsContaEspelho.FieldByName('FLGCONTAMONETARIA').AsString) + ', '   + #13 +
               '   FLGSINALCONTA       = ' + QuotedStr(cdsContaEspelho.FieldByName('FLGSINALCONTA').AsString)     + ', '   + #13 +
               '   FLGCALCORCADO       = ' + QuotedStr(cdsContaEspelho.FieldByName('FLGCALCORCADO').AsString)     + ', '   + #13 +
               '   FLGCALCREAL         = ' + QuotedStr(cdsContaEspelho.FieldByName('FLGCALCREAL').AsString)       + ', '   + #13 +
               '   FLGINFDIAMES        = ' + QuotedStr(cdsContaEspelho.FieldByName('FLGINFDIAMES').AsString)      + ', '   + #13 +
               '   FLGACUMULADO        = ' + QuotedStr(cdsContaEspelho.FieldByName('FLGACUMULADO').AsString)      + ', '   + #13 +
               '   FLGTRANSFSALDO      = ' + QuotedStr(cdsContaEspelho.FieldByName('FLGTRANSFSALDO').AsString)    + ', '   + #13 +
               '   FLGATIVA            = ' + QuotedStr(cdsContaEspelho.FieldByName('FLGATIVA').AsString)          + ', '   + #13 +
               '   DATAATIVA           = ' + QuotedStr(cdsContaEspelho.FieldByName('DATAATIVA').AsString)         + ', '   + #13 +
               '   DATAINATIVA         = ' + QuotedStr(cdsContaEspelho.FieldByName('DATAINATIVA').AsString)       + ', '   + #13 +
               '   IDDATAVIEW          = ' + QuotedStr(cdsContaEspelho.FieldByName('IDDATAVIEW').AsString)        + ', '   + #13 +
               '   ORIGEMCMDV          = ' + QuotedStr(cdsContaEspelho.FieldByName('ORIGEMCMDV').AsString)                 + #13 +
               'WHERE '                                                                                                    + #13 +
               '       IDPLANOORCAMEN = ' + FormatFloat('#0', pPlano)                                                      + #13 +
               '   AND IDGRUPOORCAMEN = ' + IDGrupoOrcamen                                                                 + #13 +
               '   AND IDCONTAORCAMEN = ' + QuotedStr(CdsContaNova.FieldByName('IDCONTAORCAMEN').AsString);

{
               '   AND CODCENTROCUSTO = ' + QuotedStr(cdsCodigo.FieldByName('CODCENTROCUSTO').AsString)                     + #13 +
               '   AND IDEMPRESA      = ' + IDEmpresProp                                                                    + #13 +
               '   AND UNIDNEGOC      = ' + cdsCodigo.FieldByName('UNIDNEGOC').AsString                                     + #13 +
               '   AND IDPESSOA       = ' + IDEmpresProp                                                                    + #13 +
               '   AND IDPLANOPREV    = ' + cdsCodigo.FieldByName('IDPLANOPREV').AsString                                   + #13 +
               '   AND IDPATRO        = ' + cdsCodigo.FieldByName('IDPATRO').AsString;
}

               bAlterou := ExecSQL(sSQL);
               if not(bAlterou) then Raise Exception.Create('Erro');

            except
               on E:Exception do
               begin
                  Rollback;

                  if bLog then
                  begin
                     sLinha   := FormatDateTime('hh:nn:ss', Now) + ' ' +
                                 CompletaFIM(cdsCodigo.FieldByName('CODIGO').AsString, ' ', 30) + ' - ' +
                                 'ERRO na atualização da Conta Orçamentária: ' +
                                 E.message;

                     MessageInfo := sLinha;

                     WriteLN(ArqLog, sLinha);

                     WriteLN(ArqLog, '');

                     sLinha   := FormatDateTime('hh:nn:ss', Now) + ' Processo interrompido';

                     WriteLN(ArqLog, sLinha);

                  end;  // if bLog
                  Exit;
               end;  // on E:Exception
            end;  // try..except


            // -------------------------------------------------------------------------------------
            //    COMPCONTASORCAMEN
            // -------------------------------------------------------------------------------------

            if bSubstCompConta then
            begin
               // Exclui a composição anterior
               if not(ExcluiCompContas(FormatFloat('#0', pPlano),
                                       CdsContaNova.FieldByName('IDCONTAORCAMEN').AsString
                                      )) then
               begin
                  if bLog then
                  begin
                     sLinha   := FormatDateTime('hh:nn:ss', Now) + ' ' +
                                 CompletaFIM(cdsCodigo.FieldByName('CODIGO').AsString, ' ', 30) + ' - ' +
                                 'ERRO na exclusão da Composição anterior da Conta Orçamentária.';

                     MessageInfo := sLinha;

                     WriteLN(ArqLog, sLinha);

                     WriteLN(ArqLog, '');

                     sLinha   := FormatDateTime('hh:nn:ss', Now) + ' Processo interrompido';

                     WriteLN(ArqLog, sLinha);

                     Exit;
                  end;  // if bLog
               end
               else
               begin

                  try
                     sSQL :=
                     'INSERT INTO COMPCONTASORCAMEN '                                              + #13 +
                     '( '                                                                          + #13 +
                     'IDCOMPCONTASORC, IDCONTAORCAMEN, '                                           + #13 +
                     'IDCONTACONDRES, IDCONTACONDFIM, IDCONTACONDINI, '                            + #13 +
                     'IDCONTAREFREAL, IDPLANOORCAMEN, IDCONTAREFORCADO, '                          + #13 +
                     'IDPESSOA, CODTIPRECDES, CODCENTRORESPON, IDEMPRESA, '                        + #13 +
                     'CODCENTROCUSTO, UNIDNEGOC, IDPLANOPREV, IDPATRO, '                           + #13 +
                     'PLANO, PLACONTA, RECPAG, PERCCONTAREFORC, PERCCONTAREFREA, '                 + #13 +
                     'CONDICAO, TIPOCONDINI, TIPOCONDRES, VLRCONDINI, VLRCONDRES, '                + #13 +
                     'CODTIPDOC '                                                                  + #13 +
                     ') '                                                                          + #13 +
                     '( '                                                                          + #13 +
                     'SELECT '                                                                     + #13 +
                     '   SEQCOMPCONTASORCAMEN.NEXTVAL, '                                           + #13 +

                     // IDCONTAORCAMEN
                     '   ' + QuotedStr(cdsContaNova.FieldByName('IDCONTAORCAMEN').AsString) + ', ' + #13 +

                     '   IDCONTACONDRES, IDCONTACONDFIM, IDCONTACONDINI, '                         + #13 +
                     '   IDCONTAREFREAL, IDPLANOORCAMEN, IDCONTAREFORCADO, '                       + #13 +
                     '   IDPESSOA, CODTIPRECDES, IDEMPRESA, '                                      + #13;

                     // ----------------------------------------------------------------------------
                     if bSubstCR then
                     begin
                        sSQL := sSQL +
                     '   ' + QuotedStr(cdsCodigo.FieldByName('CODCENTRORESPON').AsString) + ', '   + #13;
                     end
                     else
                     begin
                        sSQL := sSQL + '   CODCENTRORESPON, '                                      + #13;
                     end;

                     if bSubstCC then
                     begin
                        sSQL := sSQL +
                     '   ' + QuotedStr(cdsCodigo.FieldByName('CODCENTROCUSTO').AsString) + ', '    + #13;
                     end
                     else
                     begin
                        sSQL := sSQL + '   CODCENTROCUSTO, '                                       + #13;
                     end;

                     if bSubstAP then
                     begin
                        sSQL := sSQL +
                     '   ' + cdsCodigo.FieldByName('UNIDNEGOC').AsString + ', '                    + #13;
                     end
                     else
                     begin
                        sSQL := sSQL + '   UNIDNEGOC, '                                            + #13;
                     end;

                     if bSubstPP then
                     begin
                        sSQL := sSQL +
                     '   ' + cdsCodigo.FieldByName('IDPLANOPREV').AsString + ', '                  + #13;
                     end
                     else
                     begin
                        sSQL := sSQL + '   IDPLANOPREV, '                                          + #13;
                     end;

                     if bSubstPT then
                     begin
                        sSQL := sSQL +
                     '   ' + cdsCodigo.FieldByName('IDPATRO').AsString + ', '                      + #13;
                     end
                     else
                     begin
                        sSQL := sSQL + '   IDPATRO, '                                              + #13;
                     end;
                     // ----------------------------------------------------------------------------

                     sSQL := sSQL +
                     '   PLANO, PLACONTA, RECPAG, PERCCONTAREFORC, PERCCONTAREFREA, '              + #13 +
                     '   CONDICAO, TIPOCONDINI, TIPOCONDRES, VLRCONDINI, VLRCONDRES, '             + #13 +
                     '   CODTIPDOC '                                                               + #13 +
                     'FROM '                                                                       + #13 +
                     '   COMPCONTASORCAMEN '                                                       + #13 +
                     'WHERE '                                                                      + #13 +
                     '       IDPLANOORCAMEN = ' + FormatFloat('#0', pPlano)                        + #13 +
                     '   AND IDCONTAORCAMEN = ' + QuotedStr(IDContaEspelho)                        + #13 +
                     ') ';

                     bAlterou := ExecSQL(sSQL);
                     if not(bAlterou) then Raise Exception.Create('Erro');

                  except
                     on E:Exception do
                     begin
                        Rollback;

                        if bLog then
                        begin
                           sLinha   := FormatDateTime('hh:nn:ss', Now) + ' ' +
                                       CompletaFIM(cdsCodigo.FieldByName('CODIGO').AsString, ' ', 30) + ' - ' +
                                       'ERRO na inserção da Composição da Conta Orçamentária: ' +
                                       E.message;

                           MessageInfo := sLinha;

                           WriteLN(ArqLog, sLinha);

                           WriteLN(ArqLog, '');

                           sLinha   := FormatDateTime('hh:nn:ss', Now) + ' Processo interrompido';

                           WriteLN(ArqLog, sLinha);
                        end;  // if bLog
                        Exit;
                     end;  // on E:Exception
                  end;  // try..except

               end;  // if not(ExcluiCompConts(...
            end;  // if bSubstCompConta

            // -------------------------------------------------------------------------------------

            if bLog then
            begin
               sLinha := FormatDateTime('hh:nn:ss', Now) + ' ' + CompletaFIM(cdsCodigo.FieldByName('CODIGO').AsString, ' ', 30);

               WriteLN(ArqLog, sLinha);
            end;  // if bLog

            inc(iAlterada);

            cdsCodigo.Next;
         end;  // while not(cdsCodigo.EOF)

         Commit;

         Result := True;

         // ----------------------------------------------------------------------------------------

      finally
         // EscondeFormProgresso
         DoProgresso([sNomeBilhete, 2, 0, iQuant, iPos, 'Atualizando Composição das Contas Orçamentárias...']);

         if bLog then
         begin
            WriteLN(ArqLog, '');

            sLinha := 'Foram alteradas ' + IntToStr(iAlterada) + ' Contas Orçamentárias, de ' +
                      IntToStr(iQuant - 1) + ' previstas.';

            WriteLN(ArqLog, sLinha);

            WriteLN(ArqLog, '');

            sLinha := FormatDateTime('hh:nn:ss', Now) + ' Término do processo.';

            WriteLN(ArqLog, sLinha);
            CloseFile(ArqLog);
         end;  // if bLog

      end;  // try..finally
   end;  // if ConnectionSide = cnsClient
end;



function TCtrlCadContasOrcPorGrupo.ExclusaoNovaCR(const IDGrupoOrcamen  : String;
                                                  const CodGrupoOrcamen : String;
                                                  const IDEmpresProp    : String;
                                                  const sPath           : String;
                                                  const bSubstCR        : Boolean;
                                                  const bSubstCC        : Boolean;
                                                  const bSubstAP        : Boolean;
                                                  const bSubstPP        : Boolean;
                                                  const bSubstPT        : Boolean;
                                                  const sNomeBilhete    : String
                                                 ): Boolean;
var
   iQuant    : Integer;
   iExcluida : Integer;
   iPos      : Integer;

   ArqLog    : TextFile;

   bLog      : Boolean;
   bExcluiu  : Boolean;

   sCC       : String;
   sAP       : String;
   sPP       : String;
   sPT       : String;

   sSQL      : String;
   sLinha    : String;
begin
   Result := True;

   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ExclusaoNovaCR(IDGrupoOrcamen,
                                                    CodGrupoOrcamen,
                                                    IDEmpresProp,
                                                    bSubstCR,
                                                    bSubstCC,
                                                    bSubstAP,
                                                    bSubstPP,
                                                    bSubstPT,
                                                    sNomeBilhete
                                                   );

      if not(Result) then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      // -------------------------------------------------------------------------------------------
      try
         MontaCodigosCR(StrToFloat(IDGrupoOrcamen), CodGrupoOrcamen, True, sNomeBilhete);
      except
         on E:Exception do
         begin
            MessageInfo := E.Message;
            Result := False;
            Exit;
         end;
      end;
      // -------------------------------------------------------------------------------------------

      // -------------------------------------------------------------------------------------------
      try
         bLog := not(isAppServer);

         // ----------------------------------------------------------------------------------------
         // 1) Prepara gravação do arquivo de log
         // ----------------------------------------------------------------------------------------

         if bLog then
         begin
            AssignFile(ArqLog, sPath + 'ContasOrcamenEXCLUSAO' + FormatDateTime('yyyy-mm-dd', Date) + '.txt');
            ReWrite(ArqLog);

            sLinha   := FormatDateTime('hh:nn:ss', Now) + ' Início do processo...';

            WriteLN(ArqLog, sLinha);
            WriteLN(ArqLog, '');
         end;  // if bLog

         // ----------------------------------------------------------------------------------------
         // 2) Itera pelo cdsCodigo, fazendo update na CONTASORCAMEN e
         //    delete + insert na COMPCONTASORCAMEN
         // ----------------------------------------------------------------------------------------

         iQuant    := cdsCodigo.RecordCount;
         iPos      := 0;
         iExcluida := 0;

         // MostraFormProgresso
         DoProgresso([sNomeBilhete, 0, 0, iQuant, iPos, 'Excluindo Contas Orçamentárias...']);

         cdsCodigo.First;
         while not(cdsCodigo.EOF) do
         begin
            inc(iPos);

            // AndaFormProgresso
            DoProgresso([sNomeBilhete, 1, 0, iQuant, iPos, 'Excluindo Contas Orçamentárias...']);

            // Abre a tabela de contas orçamentárias, trazendo a conta que será alterada
            // *** Garante não haver problemas na inserção da CompContas, o que poderia de outra
            //     forma ocorrer (se a composição do código for mudada, p.ex.) ***
            sSQL :=
            'SELECT IDCONTAORCAMEN FROM CONTASORCAMEN '                                                  + #13 +
            'WHERE '                                                                                     + #13 +
            '       IDPLANOORCAMEN  = ' + FormatFloat('#0', pPlano)                                      + #13 +
            '   AND IDGRUPOORCAMEN  = ' + IDGrupoOrcamen                                                 + #13 +
            '   AND CODCENTRORESPON = ' + QuotedStr(cdsCodigo.FieldByName('CODCENTRORESPON').AsString)   + #13;

            // ----------------------------------------------------------------------------------
            if not(cdsCodigo.FieldByName('CODCENTROCUSTO').IsNULL) then
            begin
               sSQL := sSQL +
            '   AND CODCENTROCUSTO  = ' + QuotedStr(cdsCodigo.FieldByName('CODCENTROCUSTO').AsString)    + #13 +
            '   AND IDEMPRESA       = ' + IDEmpresProp                                                   + #13;
            end
            else
            begin
               sSQL := sSQL +
            '   AND CODCENTROCUSTO  IS NULL '                                                            + #13;
            end;

            if not(cdsCodigo.FieldByName('UNIDNEGOC').IsNULL) then
            begin
               sSQL := sSQL +
            '   AND UNIDNEGOC       = ' + cdsCodigo.FieldByName('UNIDNEGOC').AsString                    + #13;
            end
            else
            begin
               sSQL := sSQL +
            '   AND UNIDNEGOC       IS NULL '                                                            + #13;
            end;

            if not(cdsCodigo.FieldByName('IDPLANOPREV').IsNULL) then
            begin
               sSQL := sSQL +
            '   AND IDPLANOPREV     = ' + cdsCodigo.FieldByName('IDPLANOPREV').AsString                  + #13;
            end
            else
            begin
               sSQL := sSQL +
            '   AND IDPLANOPREV     IS NULL '                                                            + #13;
            end;

            if not(cdsCodigo.FieldByName('IDPATRO').IsNULL) then
            begin
               sSQL := sSQL +
            '   AND IDPATRO         = ' + cdsCodigo.FieldByName('IDPATRO').AsString;
            end
            else
            begin
               sSQL := sSQL +
            '   AND IDPATRO         IS NULL ';
            end;
            // ----------------------------------------------------------------------------------

            cdsContaNova.Close;
            cdsContaNova.Data := GetDataPacket(sSQL);
            // ----------------------------------------------------------------------------------

            if not(cdsContaNova.isEmpty) then
            begin
               StartTransaction;

               try
                  sSQL :=
                  'DELETE FROM COMPCONTASORCAMEN '                                                             + #13 +
                  'WHERE '                                                                                     + #13 +
                  '       IDPLANOORCAMEN = ' + FormatFloat('#0', pPlano)                                       + #13 +
                  '   AND IDCONTAORCAMEN = ' + QuotedStr(CdsContaNova.FieldByName('IDCONTAORCAMEN').AsString);

                  bExcluiu := ExecSQL(sSQL);

                  if bExcluiu then
                  begin
                     sSQL :=
                     'DELETE FROM CONTASORCAMEN '                                                                 + #13 +
                     'WHERE '                                                                                     + #13 +
                     '       IDPLANOORCAMEN = ' + FormatFloat('#0', pPlano)                                       + #13 +
                     '   AND IDGRUPOORCAMEN = ' + IDGrupoOrcamen                                                  + #13 +
                     '   AND IDCONTAORCAMEN = ' + QuotedStr(CdsContaNova.FieldByName('IDCONTAORCAMEN').AsString);

                     bExcluiu := ExecSQL(sSQL, True);
                  end;  // if bExcluiu

                  if bExcluiu then
                  begin
                     Commit;

                     inc(iExcluida);

                     if bLog then
                     begin
                        sLinha := FormatDateTime('hh:nn:ss', Now) + ' ' +
                                  CompletaFIM(cdsCodigo.FieldByName('CODIGO').AsString, ' ', 30);

                        WriteLN(ArqLog, sLinha);
                     end;  // if bLog
                  end
                  else  // if ExecSQL(sSQL, True)
                  begin
                     Rollback;

                     if bLog then
                     begin
                        sLinha   := FormatDateTime('hh:nn:ss', Now) + ' ' +
                                    CompletaFIM(cdsCodigo.FieldByName('CODIGO').AsString, ' ', 30) + ' - ' +
                                    'Conta Orçamentária NÃO EXCLUÍDA.';

                        MessageInfo := sLinha;

                        WriteLN(ArqLog, sLinha);
                     end;  // if bLog
                  end;  // if bExcluiu

               except
                  on E: Exception do
                  begin
                     Rollback;

                     if bLog then
                     begin
                        sLinha   := FormatDateTime('hh:nn:ss', Now) + ' ' +
                                    CompletaFIM(cdsCodigo.FieldByName('CODIGO').AsString, ' ', 30) + ' - ' +
                                    'ERRO na exclusão da Conta Orçamentária: ' + E.Message;

                        MessageInfo := sLinha;

                        WriteLN(ArqLog, sLinha);
                     end;  // if bLog
                  end;  // on E: Exception
               end;  // try..except

            end
            else  // if not(cdsContaNova.isEmpty)
            begin
               if bLog then
               begin
                  sLinha   := FormatDateTime('hh:nn:ss', Now) + ' ' +
                              CompletaFIM(cdsCodigo.FieldByName('CODIGO').AsString, ' ', 30) + ' - ' +
                              'Conta Orçamentária não encontrada.';

                  MessageInfo := sLinha;

                  WriteLN(ArqLog, sLinha);
               end;  // if bLog
            end;  // if not(cdsContaNova.isEmpty)

            cdsCodigo.Next;
         end;  // while not(cdsCodigo.EOF)

      // -------------------------------------------------------------------------------------------

      finally
         // EscondeFormProgresso
         DoProgresso([sNomeBilhete, 2, 0, iQuant, iPos, 'Atualizando Composição das Contas Orçamentárias...']);

         if bLog then
         begin
            WriteLN(ArqLog, '');

            sLinha := 'Foram excluídas ' + IntToStr(iExcluida) + ' Contas Orçamentárias, de ' +
                      IntToStr(iQuant) + ' previstas.';

            WriteLN(ArqLog, sLinha);

            WriteLN(ArqLog, '');

            sLinha := FormatDateTime('hh:nn:ss', Now) + ' Término do processo.';

            WriteLN(ArqLog, sLinha);
            CloseFile(ArqLog);
         end;  // if bLog

      end;  // try..finally
   end;  // if ConnectionSide = cnsClient
end;



// FIM André Pontes - pendência 15700 - 03/12/2003
procedure TCtrlCadContasOrcPorGrupo.MontaCodigosCR(const IDGrupoOrcamen   : Extended;
                                                   const CodGrupoOrcamen  : String;
                                                   const bCalculaCodigo   : Boolean;
                                                   const sNomeBilhete     : String
                                                  );
var
   sSQL        : String;

   sCampo1     : String;
   sCampo2     : String;
   sCampo3     : String;
   sCampo4     : String;
   sCampo5     : String;
   sCampo6     : String;

   iPos        : Integer;
   iQuant      : Integer;
   iQuantCR    : Integer;
   iQuantCC    : Integer;
   iQuantAP    : Integer;
   iQuantPP    : Integer;
   iQuantPT    : Integer;

   iTamCod     : Integer;
   iTamCod1    : Integer;
   iTamCod2    : Integer;
   iTamCod3    : Integer;
   iTamCod4    : Integer;
   iTamCod5    : Integer;
   iTamCod6    : Integer;

   iTipoCod1   : Integer;
   iTipoCod2   : Integer;
   iTipoCod3   : Integer;
   iTipoCod4   : Integer;
   iTipoCod5   : Integer;
   iTipoCod6   : Integer;
begin
   // ----------------------------------------------------------------------------------------------
   // 1) Monta o cds que conterá os registros dos códigos
   // ----------------------------------------------------------------------------------------------

   iTipoCod1   := CdsParamOrc.FieldByName('FLGTIPOCOD1').AsInteger;
   iTipoCod2   := CdsParamOrc.FieldByName('FLGTIPOCOD2').AsInteger;
   iTipoCod3   := CdsParamOrc.FieldByName('FLGTIPOCOD3').AsInteger;
   iTipoCod4   := CdsParamOrc.FieldByName('FLGTIPOCOD4').AsInteger;
   iTipoCod5   := CdsParamOrc.FieldByName('FLGTIPOCOD5').AsInteger;
   iTipoCod6   := CdsParamOrc.FieldByName('FLGTIPOCOD6').AsInteger;

   iTamCod1    := CdsParamOrc.FieldByName('TAMCOD1').AsInteger;
   iTamCod2    := CdsParamOrc.FieldByName('TAMCOD2').AsInteger;
   iTamCod3    := CdsParamOrc.FieldByName('TAMCOD3').AsInteger;
   iTamCod4    := CdsParamOrc.FieldByName('TAMCOD4').AsInteger;
   iTamCod5    := CdsParamOrc.FieldByName('TAMCOD5').AsInteger;
   iTamCod6    := CdsParamOrc.FieldByName('TAMCOD6').AsInteger;

   iTamCod     := iTamCod1 + iTamCod2 + iTamCod3 + iTamCod4 + iTamCod5 + iTamCod6;

   sSQL :=
   'SELECT '                                                            + #13 +

//   '   ' + QuotedStr(StringOfChar(' ', iTamCod1)) + ' AS COD1, '        + #13 +
//   '   ' + QuotedStr(StringOfChar(' ', iTamCod2)) + ' AS COD2, '        + #13 +
//   '   ' + QuotedStr(StringOfChar(' ', iTamCod3)) + ' AS COD3, '        + #13 +
//   '   ' + QuotedStr(StringOfChar(' ', iTamCod4)) + ' AS COD4, '        + #13 +
//   '   ' + QuotedStr(StringOfChar(' ', iTamCod5)) + ' AS COD5, '        + #13 +

   '   ' + QuotedStr(StringOfChar(' ', iTamCod)) + ' AS CODIGO, '       + #13 +

   '   ' + QuotedStr(StringOfChar(' ', 12)) + ' AS CODGRUPOORCAMEN, '   + #13 +

   '   ' + QuotedStr(StringOfChar(' ', 10)) + ' AS CODCENTRORESPON, '   + #13 +
   '   ' + QuotedStr(StringOfChar(' ', 10)) + ' AS CODEXTERNOCR, '      + #13 +

   '   ' + QuotedStr(StringOfChar(' ', 10)) + ' AS CODCENTROCUSTO, '    + #13 +
   '   ' + QuotedStr(StringOfChar(' ', 10)) + ' AS CODEXTERNOCC, '      + #13 +

   '   ' + QuotedStr(StringOfChar(' ', 10)) + ' AS UNECODIGO, '         + #13 +
   '   ' + QuotedStr(StringOfChar(' ',  2)) + ' AS CODPLANO, '          + #13 +
   '   ' + QuotedStr(StringOfChar(' ',  2)) + ' AS CODPATRO, '          + #13 +

   '0.00 AS IDGRUPOORCAMEN, '                                           + #13 +
   '0.00 AS UNIDNEGOC, '                                                + #13 +
   '0.00 AS IDPLANOPREV, '                                              + #13 +
   '0.00 AS IDPATRO '                                                   + #13 +

   'FROM '                                                              + #13 +
   '   DUAL '                                                           + #13 +
   'WHERE '                                                             + #13 +
   '   1 = 2 ';

   cdsCodigo.Close;
   cdsCodigo.Data := GetDataPacket(sSQL);
   // ----------------------------------------------------------------------------------------------



   // ----------------------------------------------------------------------------------------------
   // 2) Calcula a quantidade de códigos a gerar (apenas para o form de progressão)
   // ----------------------------------------------------------------------------------------------

   iQuantCR := CdsCRSel.RecordCount;
   iQuantCC := 1;
   iQuantAP := 1;
   iQuantPP := 1;
   iQuantPT := 1;

   if CdsCCSel.RecordCount > 0 then iQuantCC := CdsCCSel.RecordCount;
   if CdsAPSel.RecordCount > 0 then iQuantAP := CdsAPSel.RecordCount;
   if CdsPPSel.RecordCount > 0 then iQuantPP := CdsPPSel.RecordCount;
   if CdsPTSel.RecordCount > 0 then iQuantPT := CdsPTSel.RecordCount;

   iQuant   := iQuantCR * iQuantCC * iQuantAP * iQuantPP * iQuantPT;
   // ----------------------------------------------------------------------------------------------



   // ----------------------------------------------------------------------------------------------
   // 3) Geração dos Códigos
   // ----------------------------------------------------------------------------------------------

   iPos   := 0;

   // MostraFormProgresso
   DoProgresso([sNomeBilhete, 0, 0, iQuant, iPos, 'Montando Códigos...']);

   CdsCRSel.First;
   while not(CdsCRSel.EOF) do
   begin
      CdsCCSel.First;
      repeat
         CdsAPSel.First;
         repeat
            CdsPPSel.First;
            repeat
               CdsPTSel.First;
               repeat
                  cdsCodigo.Append;

                  cdsCodigo.FieldByName('IDGRUPOORCAMEN').AsFloat       := IDGrupoOrcamen;
                  cdsCodigo.FieldByName('CODGRUPOORCAMEN').AsString     := CodGrupoOrcamen;

                  cdsCodigo.FieldByName('CODCENTRORESPON').AsString     := CdsCRSel.FieldByName('CODCENTRORESPON').AsString;
                  cdsCodigo.FieldByName('CODEXTERNOCR').AsString        := CdsCRSel.FieldByName('CODEXTERNO').AsString;

                  if not(CdsCCSel.IsEmpty) then
                  begin
                     cdsCodigo.FieldByName('CODCENTROCUSTO').AsString   := CdsCCSel.FieldByName('CODCENTROCUSTO').AsString;
                     cdsCodigo.FieldByName('CODEXTERNOCC').AsString     := CdsCCSel.FieldByName('CODEXTERNO').AsString;
                  end
                  else
                  begin
                     cdsCodigo.FieldByName('CODCENTROCUSTO').Clear;
                     cdsCodigo.FieldByName('CODEXTERNOCC').Clear;
                  end;

                  if not(CdsCCSel.IsEmpty) then
                  begin
                     cdsCodigo.FieldByName('UNECODIGO').AsString        := CdsAPSel.FieldByName('UNECODIGO').AsString;
                     cdsCodigo.FieldByName('UNIDNEGOC').AsFloat         := CdsAPSel.FieldByName('UNIDNEGOC').AsFloat;
                  end
                  else
                  begin
                     cdsCodigo.FieldByName('UNECODIGO').Clear;
                     cdsCodigo.FieldByName('UNIDNEGOC').Clear;
                  end;

                  if not(CdsCCSel.IsEmpty) then
                  begin
                     cdsCodigo.FieldByName('CODPLANO').AsString         := CdsPPSel.FieldByName('CODORCAMENTO').AsString;
                     cdsCodigo.FieldByName('IDPLANOPREV').AsFloat       := CdsPPSel.FieldByName('IDPLANOPREV').AsFloat;
                  end
                  else
                  begin
                     cdsCodigo.FieldByName('CODPLANO').Clear;
                     cdsCodigo.FieldByName('IDPLANOPREV').Clear;
                  end;

                  if not(CdsCCSel.IsEmpty) then
                  begin
                     cdsCodigo.FieldByName('CODPATRO').AsString         := CdsPTSel.FieldByName('CODORCAMENTO').AsString;
                     cdsCodigo.FieldByName('IDPATRO').AsFloat           := CdsPTSel.FieldByName('IDPESSOA').AsFloat;
                  end
                  else
                  begin
                     cdsCodigo.FieldByName('CODPATRO').Clear;
                     cdsCodigo.FieldByName('IDPATRO').Clear;
                  end;

                  cdsCodigo.Post;

                  inc(iPos);
                  // AndaFormProgresso
                  DoProgresso([sNomeBilhete, 1, 0, iQuant, iPos, 'Montando Códigos...']);

                  CdsPTSel.Next;
               until CdsPTSel.EOF;
               CdsPPSel.Next;
            until CdsPPSel.EOF;
            CdsAPSel.Next;
         until CdsAPSel.EOF;
         CdsCCSel.Next;
      until CdsCCSel.EOF;
      CdsCRSel.Next;
   end;  // while not(CdsCRSel.EOF)

   // EscondeFormProgresso
   DoProgresso([sNomeBilhete, 2, 0, iQuant, iPos, 'Montando Códigos...']);
   // ----------------------------------------------------------------------------------------------



   // ----------------------------------------------------------------------------------------------
   // 4) Define a composição do código
   // ----------------------------------------------------------------------------------------------

   case iTipoCod1 of
      1: sCampo1 := 'CODGRUPOORCAMEN';
      2: sCampo1 := 'CODEXTERNOCC';
      3: sCampo1 := 'UNECODIGO';
      4: sCampo1 := 'CODPLANO';
      5: sCampo1 := 'CODPATRO';
      6: sCampo1 := 'CODEXTERNOCR';
   end;

   case iTipoCod2 of
      1: sCampo2 := 'CODGRUPOORCAMEN';
      2: sCampo2 := 'CODEXTERNOCC';
      3: sCampo2 := 'UNECODIGO';
      4: sCampo2 := 'CODPLANO';
      5: sCampo2 := 'CODPATRO';
      6: sCampo2 := 'CODEXTERNOCR';
   end;

   case iTipoCod3 of
      1: sCampo3 := 'CODGRUPOORCAMEN';
      2: sCampo3 := 'CODEXTERNOCC';
      3: sCampo3 := 'UNECODIGO';
      4: sCampo3 := 'CODPLANO';
      5: sCampo3 := 'CODPATRO';
      6: sCampo3 := 'CODEXTERNOCR';
   end;

   case iTipoCod4 of
      1: sCampo4 := 'CODGRUPOORCAMEN';
      2: sCampo4 := 'CODEXTERNOCC';
      3: sCampo4 := 'UNECODIGO';
      4: sCampo4 := 'CODPLANO';
      5: sCampo4 := 'CODPATRO';
      6: sCampo4 := 'CODEXTERNOCR';
   end;

   case iTipoCod5 of
      1: sCampo5 := 'CODGRUPOORCAMEN';
      2: sCampo5 := 'CODEXTERNOCC';
      3: sCampo5 := 'UNECODIGO';
      4: sCampo5 := 'CODPLANO';
      5: sCampo5 := 'CODPATRO';
      6: sCampo5 := 'CODEXTERNOCR';
   end;

   case iTipoCod6 of
      1: sCampo6 := 'CODGRUPOORCAMEN';
      2: sCampo6 := 'CODEXTERNOCC';
      3: sCampo6 := 'UNECODIGO';
      4: sCampo6 := 'CODPLANO';
      5: sCampo6 := 'CODPATRO';
      6: sCampo6 := 'CODEXTERNOCR';
   end;
   // ----------------------------------------------------------------------------------------------


   // ----------------------------------------------------------------------------------------------
   // 4) Itera pelo cdsCodigo, compondo o código final
   // ----------------------------------------------------------------------------------------------

   if bCalculaCodigo then
   begin
      iPos := 0;

      // MostraFormProgresso
      DoProgresso([sNomeBilhete, 0, 0, iQuant, iPos, 'Montando Códigos...']);

      cdsCodigo.First;
      while not(cdsCodigo.EOF) do
      begin
         inc(iPos);

         // AndaFormProgresso
         DoProgresso([sNomeBilhete, 1, 0, iQuant, iPos, 'Montando Códigos...']);

         cdsCodigo.Edit;
         cdsCodigo.FieldByName('CODIGO').AsString  := CompletaFim(cdsCodigo.FieldByName(sCampo1).AsString, '0', iTamCod1) +
                                                      CompletaFim(cdsCodigo.FieldByName(sCampo2).AsString, '0', iTamCod2) +
                                                      CompletaFim(cdsCodigo.FieldByName(sCampo3).AsString, '0', iTamCod3) +
                                                      CompletaFim(cdsCodigo.FieldByName(sCampo4).AsString, '0', iTamCod4) +
                                                      CompletaFim(cdsCodigo.FieldByName(sCampo5).AsString, '0', iTamCod5) +
                                                      CompletaFim(cdsCodigo.FieldByName(sCampo6).AsString, '0', iTamCod6);
         cdsCodigo.Post;
         cdsCodigo.Next;
      end;

      // EscondeFormProgresso
      DoProgresso([sNomeBilhete, 2, 0, iQuant, iPos, 'Montando Códigos...']);
   end;  // if bCalculaCodigo
   // ----------------------------------------------------------------------------------------------
end;
// FIM André Pontes - pendência 15700 - 03/12/2003



// André Pontes - pendência 15700 - 03/12/2003
function TCtrlCadContasOrcPorGrupo.ExisteCombinacaoCR(const IDPlanoOrcamen : Extended;
                                                      const IDGrupoOrcamen : Extended;
                                                      const sCentRespon    : String;
                                                      const sCentroCusto   : String;
                                                      const sUnidNegoc     : String;
                                                      const sPlano         : String;
                                                      const sPatro         : String
                                                     ): Boolean;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT COUNT(*) AS TOTAL FROM CONTASORCAMEN '                    + #13 +
   'WHERE '                                                          + #13 +
   '       IDPLANOORCAMEN  = ' + FormatFloat('#0', IDPlanoOrcamen)   + #13 +
   '   AND IDGRUPOORCAMEN  = ' + FormatFloat('#0', IDGrupoOrcamen)   + #13 +
   '   AND CODCENTRORESPON = ' + QuotedStr(sCentRespon)              + #13;

   // ----------------------------------------------------------------------------------------------
   if length(trim(sCentroCusto)) > 0 then
   begin
      sSQL := sSQL +
   '   AND CODCENTROCUSTO  = ' + QuotedStr(sCentroCusto)             + #13;
   end
   else
   begin
      sSQL := sSQL +
   '   AND CODCENTROCUSTO  IS NULL '                                 + #13;
   end;

   if (length(trim(sUnidNegoc)) > 0) and (StrToInt(sUnidNegoc) > 0) then
   begin
      sSQL := sSQL +
   '   AND UNIDNEGOC       = ' + sUnidNegoc                          + #13;
   end
   else
   begin
      sSQL := sSQL +
   '   AND UNIDNEGOC       IS NULL '                                 + #13;
   end;

   if (length(trim(sPlano)) > 0) and (StrToInt(sPlano) > 0) then
   begin
      sSQL := sSQL +
   '   AND IDPLANOPREV     = ' + sPlano                              + #13;
   end
   else
   begin
      sSQL := sSQL +
   '   AND IDPLANOPREV     IS NULL '                                 + #13;
   end;

   if (length(trim(sPatro)) > 0) and (StrToInt(sPatro) > 0) then
   begin
      sSQL := sSQL +
   '   AND IDPATRO         = ' + sPatro;
   end
   else
   begin
      sSQL := sSQL +
   '   AND IDPATRO         IS NULL ';
   end;
   // ----------------------------------------------------------------------------------------------

   cdsExiste.Data := GetDataPacket(sSQL);

   Result := False;
   if cdsExiste.FieldByName('TOTAL').AsInteger > 0 then Result := True;

   cdsExiste.Close;
end;
// FIM André Pontes - pendência 15700 - 03/12/2003



end.
