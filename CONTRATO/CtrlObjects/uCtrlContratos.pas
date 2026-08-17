{--------------------------------------------------------------------------------
--------------------- ALTERAÇÕES / IMPLEMENTAÇÕES -------------------------------
-------------------------------------------------------------------------------------
N.WO............: WO38245
Data............: 15/05/2026
Responsável.....: Paulo Nobre
Descrição.......: Ajustes para somente permitir a indisponibilização do Contrato e
                  e Aditamentos quando a funcionalidade de encerramento for chamada
                  pelo Cadastro de Contratos.
-------------------------------------------------------------------------------------
N.WO............: WO37036
Data............: 06/05/2026
Responsável.....: Paulo Nobre
Descrição.......: Ajustes para melhorar:
                  .A função: _VerificaSeAditamentoTemParcelamento foi comentada nesta
                   control e levada para a uCtrlAditamento.
                  .Na seleção da função: _ListaOrigemSaldo foi inclusa a coluna
                   FLG_TP_VLR_ORCADO_APROVADO para identificar o Contrato com a
                   condição de "Não se Aplica"..     
-------------------------------------------------------------------------------------
N.WO............: WO28914          
Data............: 13/03/2026
Responsável.....: Paulo Nobre
Descrição.......: Ajustes para melhorar:
                  .A apresentação dos Aditamentos e Pagamentos.
                  .Informação correta do saldo a pagar (_ListaSaldoSinteticoOrigem).
-------------------------------------------------------------------------------------
N.WO............: WO31928
Data............: 02/02/2026
Responsável.....: Paulo Nobre
Descrição.......: .Ajustes para atender a nova forma de indisponibilizar tudo pra tras
                   quando do lançamento de um aditamento com reinicio de parcelas
                  .Ajustes para incluir o novo tipo de aditamento - "Regularização"
                  .No cdsPagtosSintetico, incluso novo campo: TOTAL_PAGO_CONTRATO
                  .Inclusão da tela do display deste novo campo.
-------------------------------------------------------------------------------------
N.Chamado.....: WO29228
Dt.Alteração..: 19/12/2025
Responsável...: Paulo Nobre
Descrição.....: Na função "selecionaJustificativa", inclusão do CAST no campo
                JUSTIFICATIVA.
---------------------------------------------------------------------------------
N.Chamado.....: MIGRACAO-ORACLE-2025 (TAS000000006791)
Dt.Alteração..: 17/10/2025
Responsável...: Paulo Nobre
Descrição.....: Inclusão da função CAST, em campos, nas qrerys:
                ._ListaOrigemSaldo
                ._ListaMovimentoAnaliticoOrigem 
---------------------------------------------------------------------------------
N.WO............: MIGRACAO-ORACLE
Data............: 10/10/2025
Responsável.....: LEANDRO POCEBON
Descrição.......: ajuste para o oracle
------------------------------------------------------------------------------------
N.WO............: WO22956
Data............: 27/06/2025
Responsável.....: Paulo Nobre
Descrição.......: Comentado a chamada da função: _AtualizaFlgSaldoTransf por não
                  ser mais necessária neste ponto.
------------------------------------------------------------------------------------
N.WO............: WO22494
Data............: 02/06/2025
Responsável.....: Paulo Nobre
Descrição.......: Na função: _ListaOrigemSaldo, retirando da seleção a condição
                  "AND A.VL_ADITAMENTO > 0"
------------------------------------------------------------------------------------
N.WO............: WO22434
Data............: 27/05/2025
Responsável.....: Paulo Nobre
Descrição.......: Incluso um NVL na coluna: CO.FLGSALDOTRANSFERIDO = ''N''
                  na função: _BuscaUltimoSaldoContratoOuAditamento.
------------------------------------------------------------------------------------
N.WO............: WO20776
Data............: 25/04/2025
Responsável.....: Paulo Nobre
Descrição.......: .Inclusão de um bloco de união para o FLGTIPO = "C" (Outros
                   tipos de Aditamento) na seleção da origem dos saldos, função:
                   _ListaOrigemSaldo e correção dos textos.
                  .Correção no retorno da função:
                   _VerificaSeAditamentoTemParcelamento
                  .Desabilitando funções desnecessárias:
                   _BuscaSaldoContrato.
--------------------------------------------------------------------------------
N.WO............: WO19761
Data............: 18/03/2025
Responsável.....: Paulo Nobre
Descrição.......: Corrigindo bug falta do campo: FLG_TP_VLR_ORCADO_APROVADO na
                  função: TCtrlContratos._BuscaUltimoSaldoContratoOuAditamento
--------------------------------------------------------------------------------
N.WO............: WO15750
Data............: 05/12/2024
Responsável.....: Paulo Nobre
Descrição.......: .Criadas novas funções para suportar as novas regras e processos
                  implementados.
                  .Foram incorporados a esta demanda o solicitado na WO15652 (
                  mostrar valor do contrato e saldo = 0 quando o valor do
                  contrato orçado/aprovado tiver a marcação de "Não se Aplica".
---------------------------------------------------------------------------------
Rotina..........: 
Atender.........: WO10498
Data............: 10/05/2024
Responsável.....: Luis Ferrari
Descrição.......: Incluir Flag Vigencia Indeterminada para desobrigar a data
                  prevista de encerramento do contrato
--------------------------------------------------------------------------------
N. SIG..........: WO7471
Data............: 31/01/2024
Responsável.....: Arnaldo V. Scarin
Descrição.......: Incluir os dados da Área Técnica do Contrato
--------------------------------------------------------------------------------
Rotina..........: AplicaAtualContratos()
N. SIG..........: 132255
Data............: 23/05/2023
Responsável.....: Marcos Lima
Descrição.......: Ajustando os cds inativos
--------------------------------------------------------------------------------
N. SIG..........: 103333
Data............: 15/02/2022
Responsável.....: Everson Cunha
Descrição.......: Implementar a aba "Negociação" no cadastro do Contrato
--------------------------------------------------------------------------------
N. SIG..........: 96771
Data............: 18/03/2020
Responsável.....: Rafael Vasconcelos
Descrição.......: Trazer contratos mesmo que não tenham produtoxitem para
                  alterar o aditamento.
--------------------------------------------------------------------------------
N. SIG..........: 50897
Data............: 05/12/2019
Responsável.....: Everson Cunha
Descrição.......: Marcação do Valor Base, se fixo, variável ou sem valor.
--------------------------------------------------------------------------------
N. SIG..........: 46231
Data............: 27/08/2019
Responsável.....: Everson Cunha
Descrição.......: Área Gestora do Contrato frmCadContratoMT
--------------------------------------------------------------------------------
N. SIG..........: 61610
Data............: 24/01/2018
Responsável.....: Darivaldo Alencar
Descrição.......: Apply em CDS sem tratamento de memória.
--------------------------------------------------------------------------------
N. Sol..........: 242313/17289
N. PPM..........: 828977
Data............: 19/06/2015
Responsável.....: Felipe A. Santos
Descrição.......: criação da aba ANS.
--------------------------------------------------------------------------------
N. Sol..........: 217597/17169
N. PPM..........: 772732
Data............: 12/05/2015
Responsável.....: Felipe A. Santos
Descrição.......: alteração no método que lista o histórico de renovação,
                  pegando somente o último registro com maior data de andamento,
                  e que a data de andamento seja ou igual maior que a data do aditamento.
-------------------------------------------------------------------------------
N. Sol..........: 218909/16724
N. PPM..........: 588170
Data............: 20/02/2015
Responsável.....: Felipe A. Santos
Descrição.......: Criação da flag de contrato receberá alerta de medição, para
                  monitoramento do contrato.
-------------------------------------------------------------------------------
N. Sol..........: 174920
N. Kintana......: 1591690
Data............: 25/10/2012
Responsável.....: Thiago Melo
Descrição.......: Manter histórico de renovação de contratos
-------------------------------------------------------------------------------
Rotina..........: verificaAlcadas
N. Sol..........: 190509
N. Kintana......: 1802910
Data............: 25/09/2012
Responsável.....: Higor Nayde Ferreira
Descrição.......: Alterar Consulta passando Valor Total como parametro
--------------------------------------------------------------------------------
Rotina..........: carregaAlcadas, listaTodosItensContratos, alcadasDisponivel
                  e listaItensContrato
N. Sol..........: 142171
N. Kintana......: 913629
Data............: 20/09/2011
Responsável.....: Vinicius Eduardo Nascimento Maciel
Descrição.......: Criação das funcionalidade para controle da aba Alçada da tela
                  de cadastro.
--------------------------------------------------------------------------------
Rotina..........: ListContratoAditamento
N. Sol..........: 120378
N. Kintana......: 575744
Data............: 08/12/2009
Responsável.....: Marilza Colpani
Descrição.......: Criação de uma nova função que lista os contratos de
                  aditamentos.
--------------------------------------------------------------------------------
Pendência   : 26187
Responsável : Gustavo Mendes
Data        : 28/04/2008
Descrição   : Ao excluir um contrado ocorre um erro de Constraint que impede o
              processo.
--------------------------------------------------------------------------------
Pendência   : 19646
Responsável : Daniel Simões
Data        : 25/04/2006
Descrição   : Ao carregar a query da combo "dblcContrato" lista todos os
              contratos cujo status seja diferente de "Encerrado" ...
--------------------------------------------------------------------------------
Pendência   : 16455
Responsável : Marchetti
Data        : 03/09/2004
Descrição   : Criação do processo RAD para aditamento caso a fundação utilize
              RAD...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit uCtrlContratos;

interface

uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     uCMTypes, uCMClientDataSet, uDbContratoContr, uDbAditamento, uDbLogAditamento,
     uCtrlOrcamento, uCtrlRAD, uDbContratoUsuario, uCtrlUsuXContrato,uDbContratoOrig,
     uDbJustificaContrato,//Vinicius Maciel - SOL 142171 KTN 913629
     uDbObjxItOrig, uDbRateioCCOrig, uDbHstRenovacao,
     uDbCtrlParcelaMedicao, uCtrlFuncoesRH, // Felipe A. Santos SOL 218909/16724 PPM 588170
     uCtrlContratoANS, uDbContratoANS, // Felipe A. Santos SOL 242313/17289 PPM 828977
     uDbContratoAreaGestora, uDbNegociacao,
     uDbContratoAreaTecnica,
     dBaseDados, Wwquery
     ;
type
   TCtrlContratos = Class(TCmControlObject)

   private
      F_rIDPessoa       : Double;
      F_rIDUsuario      : Double;
      FDbContratoContr  : TDbContratoContr;
      //Vinicius Maciel - SOL 142171 KTN 913629
      FDbJustificaContrato  : TDbJustificaContrato;
      FCdsJustificaContrato : TCMClientDataSet;
      //Vinicius Maciel - SOL 142171 KTN 913629 - FIM
      FCdsContratoContr : TCMClientDataSet;
      FDbContratoOrig   : TDbContratoOrig;
      FDbObjxItOrig     : TDbObjxItOrig;
      FDbRateioCCOrig   : TDbRateioCCOrig;
      FDbAditamento     : TDbAditamento;
      FDbLogAditamento  : TDbLogAditamento;
      FCdsAditamento    : TCMClientDataSet;
      FCdsLogAditamento : TCMClientDataSet;
      // Thiago Melo SOL 174920 KINTANA 1591690 ini
      FDbHstRenovacao   : TDbHstRenovacao;
      // Thiago Melo SOL 174920 KINTANA 1591690 fim
      cdsAux            : TCMClientDataSet;

      CtrlOrcamento     : TOrcamentoBackMT;
      CtrlRAD           : TCtrlRAD;

      cdsContratoOrig   : TCMClientDataSet;
      cdsObjetoOrig     : TCMClientDataSet;
      cdsRateioOrig     : TCMClientDataSet;
      FCdsHstRenovacao  : TCMClientDataSet;
      FCdsAreaGestora   : TCMClientDataSet; //Everson Cunha - SIG46231



      // Felipe A. Santos SOL 218909/16724 PPM 588170 - início
      FCdsCtrlParcelaMedicao: TCMClientDataSet;
      FDbCtrlParcelaMedicao : TDbCtrlParcelaMedicao;
      // Felipe A. Santos SOL 218909/16724 PPM 588170 - fim

      // Felipe A. Santos SOL 242313/17289 PPM 828977 { fim FDbContratoANS }
      FCdsContratoANS: TCMClientDataSet;
      FDbContratoANS: TDbContratoAns;

      FDbContratoAreaGestora : TDbContratoAreaGestora; //Everson Cunha - SIG46231

      FCdsNegociacao : TCMClientDataSet; //Everson Cunha - SIG103333
      FDbNegociacao  : TDbNegociacao;
      FCdsAreaTecnica: TCMClientDataSet;
      FDbContratoAreaTecnica: TDbContratoAreaTecnica;    //Everson Cunha - SIG103333

      procedure CarregaContratoOriginal;
      //Vinicius Maciel - SOL 142171 KTN 913629
      function verificaAlcadas(sDtAssinatura: String): OleVariant;
      function retornaDiasAlcadas: Integer;
      //Vinicius Maciel - SOL 142171 KTN 913629 - FIM

    procedure SetDbContratoAreaGestora(const Value: TDbContratoAreaGestora);
    procedure SetCdsAreaGestora(const Value: TCMClientDataSet);
    procedure SetCdsNegociacao(const Value: TCMClientDataSet);
    procedure SetDbNegociacao(const Value: TDbNegociacao);
    procedure SetCdsAreaTecnica(const Value: TCMClientDataSet);
    procedure SetDbContratoAreaTecnica(const Value: TDbContratoAreaTecnica);

   public
   //Vinicius Maciel - SOL 142171 KTN 913629
      function carregaAlcadas(dValor: Double; dCargo: String = '' ): OleVariant; //Higor Nayde Ferreira SOL 190509 - KTN 1802910
      function CarregarValorAlcada(dValor: String): OleVariant;                  //Higor Nayde Ferreira SOL 190509 - KTN 1802910
      function ValorDisponivel   (dValor: String):  String;                      //Higor Nayde Ferreira SOL 190509 - KTN 1802910
      function CargoDisponivel   (dValor: String):  String;                      //Higor Nayde Ferreira SOL 190509 - KTN 1802910
      function CarregaCargoAlcada(dValor: String):  OleVariant;                  //Higor Nayde Ferreira SOL 190509 - KTN 1802910

      function listaTodosItensContratos(cds: TCMClientDataSet; bAlterador : boolean): TCMClientDataSet;
      function carregaUsuario(iIdUsuario: Integer): String;
      function alcadasDisponivel(sDtAssinatura : String) : boolean;
      function somaValorContratos(CdsOriginal: TCMClientDataSet): Double;
      function listaItensContratos(idContraparte,sDataBaseContrato: String): OleVariant;
      function selecionaJustificativa(iIdContrato : integer) : OleVariant;
      property CdsJustificaContrato: TCMClientDataSet read FCdsJustificaContrato write FCdsJustificaContrato;
      //Vinicius Maciel - SOL 142171 KTN 913629 - Fim
      property CdsContratoContr: TCMClientDataSet read FCdsContratoContr write FCdsContratoContr;
      property CdsAditamento:    TCMClientDataSet read FCdsAditamento    write FCdsAditamento;
      property CdsLogAditamento: TCMClientDataSet read FCdsLogAditamento write FCdsLogAditamento;
      property IDPessoa:  Double read F_rIDPessoa  write F_rIDPessoa;
      property IDUsuario: Double read F_rIDUsuario write F_rIDUsuario;
      // Thiago Melo SOL 174920 KINTANA 1591690
      property CdsHstRenovacao : TCMClientDataSet read FCdsHstRenovacao write FCdsHstRenovacao;
      // Thiago Melo SOL 174920 KINTANA 1591690 fim

      // Felipe A. Santos SOL 218909/16724 PPM 588170  - Início
      property CdsCtrlParcelaMedicao : TCMClientDataSet read FCdsCtrlParcelaMedicao write FCdsCtrlParcelaMedicao;
      // Felipe A. Santos SOL 218909/16724 PPM 588170  - fim

      property CdsContratoANS : TCMClientDataSet read FCdsContratoANS write FCdsContratoANS; // Felipe A. Santos SOL 242313/17289 PPM 828977

      //Everson Cunha - SIG46231 - Início
      property DbContratoAreaGestora : TDbContratoAreaGestora read FDbContratoAreaGestora write SetDbContratoAreaGestora;
      property CdsAreaGestora : TCMClientDataSet read FCdsAreaGestora write SetCdsAreaGestora;
      //Everson Cunha - SIG46231 - Fim


      // WO7471 - Contratos e Projetos - Cadastro de Contratos - Área técnica
      // Alterado por Arnaldo V. Scarin em 31/01/2024
      property DbContratoAreaTecnica : TDbContratoAreaTecnica read FDbContratoAreaTecnica write SetDbContratoAreaTecnica;
      property CdsAreaTecnica : TCMClientDataSet read FCdsAreaTecnica write SetCdsAreaTecnica;



      //Everson Cunha - SIG103333 - Ini
      property CdsNegociacao : TCMClientDataSet read FCdsNegociacao write SetCdsNegociacao;
      property DbNegociacao  : TDbNegociacao read FDbNegociacao write SetDbNegociacao;
      //Everson Cunha - SIG103333 - Fim

      constructor Create(rIDPessoa, rIDUsuario: Double); reintroduce;
      destructor Destroy; override;

      function ListContratos(rIDContrato: Double; bAtivos: Boolean = False): OleVariant;
      function ListContratosACorrigir(rIDContrato, rNumDiasAviso: Double; dDataTeste: TDateTime): OleVariant;
      function ListContratoOrig(rIDContrato: Double): OleVariant;

      // Paulo Nobre - WO31928 - Inicio

      // Paulo Nobre - WO15750 - Inicio
//      function AplicaAtualContratos(bGeraContratoOrig, bchkbImportaSaldo : Boolean; iIdContrato, iIdAditamento : Integer; dValorManual : double): Boolean;
      // Paulo Nobre - WO15750 - Fim

      function AplicaAtualContratos(bGeraContratoOrig : Boolean; sOrigem : String): Boolean;
      
      // Paulo Nobre - WO31928 - Fim

      function ExcluiContrato(const P_IdContrato: Integer): Boolean;
      function ExcluiContratoOrig(const idContrato:Double): Boolean;
      function StatusContrato(const rIdContrato: Double): String;

      // Marilza Colpani SOL 120378
      function ListContratoAditamento( IdContrato: Double ): OleVariant;
      // Thiago Melo SOL 174920 KINTANA 1591690 ini
      function ListaDadosHistoricoRenovacao (IdContrato : Double) : OleVariant;
      function ExcluirHstRenovacao (IdContrato: Integer): Boolean;
      // Thiago Melo SOL 174920 KINTANA 1591690 fim

      // Felipe A. Santos - SOL218909/16724 PPM 588170 - início
      function ItemVinculadoAoContrato(IdContrato : Double) : Boolean;
      // Felipe A. Santos - SOL218909/16724 PPM 588170 - fim

      function ListAreaGestora(IdContrato : Double; sDisponiveis : String) : OleVariant; //Everson Cunha - SIG46231

      // WO7471 - Contratos e Projetos - Cadastro de Contratos - Área técnica
      // Alterado por Arnaldo V. Scarin em 31/01/2024
      function ListAreaTecnica(IdContrato: Double; sDisponiveis: String): OleVariant;


      function ValorBaseContratoVariavel(IdContrato : string) : OleVariant; //Everson Cunha - SIG50897

      function ListNegociacao(IdContrato : Double = -1) : OleVariant; //Everson Cunha - SIG103333

      // Paulo Nobre -  WO15750 - Inicio
      
      // Paulo Nobre - WO31928 - Inicio
//      Procedure _AtualizaFlgSaldoTransf(iIdContrato, iIdAditamento : Integer; bSaldoTransf : Boolean; dValorManual : double); // Paulo Nobre - WO20776
      // Paulo Nobre - WO31928 - Fim

      Function _ListaOrigemSaldo(IdContrato: Integer): OleVariant;
      Function _BuscaUltimoSaldoContratoOuAditamento(IdContrato: Integer): OleVariant;
//      Function _VerificaSeAditamentoTemParcelamento(iIdContrato, iIdAditamento: Integer): Boolean;   // Paulo Nobre - WO37036
      Function _ListaSaldoSinteticoOrigem(IdContrato, IdAditamento: Integer): OleVariant;
      Function _ListaMovimentoAnaliticoOrigem(IdContrato, IdAditamento: Integer): OleVariant;
      // Paulo Nobre -  WO15750 - Fim

//      Function _BuscaSaldoContrato(IdContrato: Integer): Double;   // Paulo Nobre -  WO15653     // Paulo Nobre - WO20776

      procedure OnCreateAppServer; override;
   protected
      procedure DoChangeDataBase; override;
      procedure AfterInitialize; override;
   end;

implementation

{ TCtrlContratos }

constructor TCtrlContratos.Create(rIDPessoa, rIDUsuario: Double);
begin
   F_rIDPessoa  := rIDPessoa;
   F_rIDUsuario := rIDUsuario;
   inherited Create;
   FDbContratoContr := TDbContratoContr.Create(Self);
   FDbJustificaContrato  := TDbJustificaContrato.Create(Self);//Vinicius Maciel - SOL 142171 KTN 913629
   FDbContratoOrig  := TDbContratoOrig.Create(Self);
   FDbObjxItOrig    := TDbObjxItOrig.Create(Self);
   FDbRateioCCOrig  := TDbRateioCCOrig.Create(Self);
   FDbAditamento    := TDbAditamento.Create(Self);
   FDbLogAditamento := TDbLogAditamento.Create(Self);
   CtrlOrcamento    := TOrcamentoBackMT.Create;
   CtrlRAD          := TCtrlRAD.Create;
   // Thiago Melo SOL 174920 KINTANA 1591690 ini
   FDbHstRenovacao := TDbHstRenovacao.Create(Self);
// Thiago Melo SOL 174920 KINTANA 1591690 fim

   // Cria cds temporários para gravar o contrato original
   cdsContratoOrig := TCMClientDataSet.Create( nil );
   cdsObjetoOrig   := TCMClientDataSet.Create( nil );
   cdsRateioOrig   := TCMClientDataSet.Create( nil );
   cdsAux          := TCMClientDataSet.Create(nil);

   FDbCtrlParcelaMedicao := TDbCtrlParcelaMedicao.Create(Self); // Felipe A. Santos SOL 218909/16724 PPM 588170
   FDbContratoANS := TDbContratoAns.Create(Self); // Felipe A. Santos SOL 242313/17289 PPM 828977

   //Everson Cunha - SIG46231 - Início
   FDbContratoAreaGestora := TDbContratoAreaGestora.Create(Self);
   FCdsAreaGestora := TCMClientDataSet.Create(Nil);
   //Everson Cunha - SIG46231 - Fim

   FDbContratoAreaTecnica := TDbContratoAreaTecnica.Create(Self);
   FCdsAreaTecnica := TCMClientDataSet.Create(Nil);


   //Everson Cunha - SIG103333 - Ini
   FDbNegociacao  := TDbNegociacao.Create(Self);
   FCdsNegociacao := TCMClientDataSet.Create(Nil);
   //Everson Cunha - SIG103333 - Fim
end;

procedure TCtrlContratos.OnCreateAppServer;
begin
   inherited;
   FCdsContratoContr := TCMClientDataSet.Create(nil);
   FCdsJustificaContrato := TCMClientDataSet.Create(nil); //Vinicius Maciel - SOL 142171 KTN 913629
   FCdsAditamento    := TCMClientDataSet.Create(nil);
   FCdsLogAditamento := TCMClientDataSet.Create(nil);
   FCdsCtrlParcelaMedicao := TCMClientDataSet.Create(nil); // Felipe A. Santos SOL 218909/16724 PPM 588170
end;

destructor TCtrlContratos.Destroy;
begin
   FDbContratoContr.Free;
   FDbJustificaContrato.Free;//Vinicius Maciel - SOL 142171 KTN 913629
   FDbContratoOrig.Free;
   FDbObjxItOrig.Free;
   FDbRateioCCOrig.Free;
   FDbAditamento.Free;
   FDbLogAditamento.Free;
   cdsContratoOrig.Free;
   cdsObjetoOrig.Free;
   cdsRateioOrig.Free;
   // Thiago Melo SOL 174920 KINTANA 1591690 ini
   FDbHstRenovacao.Free;
   // Thiago Melo SOL 174920 KINTANA 1591690 fim

   cdsAux.Free;
   
   if IsAppServer then begin
     FCdsContratoContr.Free;
     FCdsAditamento.Free;
     FCdsLogAditamento.Free;
     FCdsJustificaContrato.Free;
     //Vinicius Maciel - SOL 142171 KTN 913629
   end;
   CtrlOrcamento.Free;
   CtrlRAD.Free;

   FDbCtrlParcelaMedicao.Free; // Felipe A. Santos SOL 218909/16724 PPM 588170
   FDbContratoANS.Free; // Felipe A. Santos SOL 242313/17289 PPM 828977

   //Everson Cunha - SIG46231 - Início
   FDbContratoAreaGestora.Free;
   FCdsAreaGestora.Free;
   //Everson Cunha - SIG46231 - Fim

   FDbContratoAreaTecnica.Free;
   FCdsAreaTecnica.Free;

   //Everson Cunha - SIG103333 - Ini
   FDbNegociacao.Free;
   FCdsNegociacao.Free;
   //Everson Cunha - SIG103333 - Fim

   inherited;
end;

procedure TCtrlContratos.DoChangeDataBase;
begin
   inherited;
   FDbContratoContr.DataBaseName := DataBaseName;
   FDbJustificaContrato.DataBaseName := DataBaseName;//Vinicius Maciel - SOL 142171 KTN 913629
   FDbContratoOrig.DataBaseName  := DataBaseName;
   FDbObjxItOrig.DataBaseName    := DataBaseName;
   FDbRateioCCOrig.DataBaseName  := DataBaseName;
   FDbAditamento.DataBaseName    := DataBaseName;
   FDbLogAditamento.DataBaseName := DataBaseName;
   // Thiago Melo SOL 174920 KINTANA 1591690 ini
   FDbHstRenovacao.DataBaseName  := DataBaseName;
// Thiago Melo SOL 174920 KINTANA 1591690 fim

   FDbCtrlParcelaMedicao.DataBaseName := DataBaseName; // Felipe A. Santos SOL 218909/16724 PPM 588170
   FDbContratoANS.DataBaseName := DataBaseName; // Felipe A. Santos SOL 242313/17289 PPM 828977

   FDbContratoAreaGestora.DataBaseName := DataBaseName; //Everson Cunha - SIG46231

   FDbContratoAreaTecnica.DataBaseName := DataBaseName;

   FDbNegociacao.DataBaseName := DataBaseName; //Everson Cunha - SIG103333

end;

procedure TCtrlContratos.AfterInitialize;
begin
   inherited;
   CtrlOrcamento.InitializeAs(Self);
   CtrlRAD.InitializeAs(Self);
end;

function TCtrlContratos.ListContratos(rIDContrato: Double; bAtivos: Boolean): OleVariant;
var sSql, sParam: String;
begin
   sParam := '';
   if rIDContrato <> 0 then sParam := sParam + ' AND IDCONTRATO = ' + FloatToStr(rIDContrato) +#13;

   sSql := 'SELECT * '+#13+
           '  FROM CONTRATOCONTR ' +#13+
           ' WHERE IDPESSOA = ' + FloatToStr(F_rIDPessoa) + sParam;

           if (bAtivos=True) then sSql := sSql+'   AND FLGFIMCONTRATO <> ''E'' '; // Daniel Simões - 19646 - 25/04/2006

   sSql := sSql + ' ORDER BY NOMECONTRATO ';

   Result := GetDataPacket( sSql );
end;

function TCtrlContratos.ListContratosACorrigir(rIDContrato,
  rNumDiasAviso: Double; dDataTeste: TDateTime): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT '+
         '   ''S'' AS FLG_CORRIGE, '+
         '   C.IDCONTRATO, '+
         '   C.NOMECONTRATO, '+
         '   C.CODCONTRATOEMPR,'+
         '   Min(COR.DATAEFETIVA) AS DATAPROXCORR '+
         'FROM '+
         '  CONTRATOCONTR C, '+
         '  (SELECT '+
         '      CR.IDCONTRATO, '+
         '      DECODE(CR.DATAULTIMACORR,NULL,DECODE(CR.FREQUENCIA,''D'',(CR.DATABASE+CR.INTERVALO), '+
         '                                                         ''M'',ADD_MONTHS(CR.DATABASE,CR.INTERVALO), '+
         '                                                         ''A'',ADD_MONTHS(CR.DATABASE,(12*CR.INTERVALO))), '+
      	'			                            DECODE(CR.FREQUENCIA,''D'',(CR.DATAULTIMACORR+CR.INTERVALO), '+
         '                                                         ''M'',ADD_MONTHS(CR.DATAULTIMACORR,CR.INTERVALO), '+
         '                                                         ''A'',ADD_MONTHS(CR.DATAULTIMACORR,(12*CR.INTERVALO)))) AS DATAEFETIVA '+
         '   FROM '+
         '      CORRECAOCONTR CR, '+
         '      OBJETOSXITEMCONTR OB '+
         '   WHERE '+
         '      (CR.FLGATIVO = ''S'') AND '+
         '      (CR.IDCONTRATO = OB.IDCONTRATO) AND '+
         '      (CR.IDOBJETO = OB.IDOBJETO) AND '+
         '      (CR.IDITEM = OB.IDITEM)) COR '+
         'WHERE '+
         '   (C.IDCONTRATO = COR.IDCONTRATO) AND '+
         '   (C.FLGFIMCONTRATO <> ''E'') AND '+
         '	 (TO_DATE('''+FormatDateTime('dd/mm/yyyy',dDataTeste)+''',''dd/mm/yyyy'') >= '+
         '   (COR.DATAEFETIVA - '+FloatToStr(rNumDiasAviso)+')) ';

   if (rIDContrato<>0) then
       sSql:=sSql+'   AND (C.IDCONTRATO = '+FloatToStr(rIDContrato)+') ';

   sSql:=sSql+'GROUP BY C.IDCONTRATO,C.NOMECONTRATO,C.CODCONTRATOEMPR ';

   Result:=GetDataPacket(sSql);
end;

// Paulo Nobre - WO31928 - Inicio
//function TCtrlContratos.AplicaAtualContratos(bGeraContratoOrig, bchkbImportaSaldo : Boolean; iIdContrato, iIdAditamento : Integer; dValorManual : double): Boolean;
function TCtrlContratos.AplicaAtualContratos(bGeraContratoOrig : Boolean; sOrigem : String): Boolean;
// Paulo Nobre - WO31928 - Fim
var bGeraUsuXContr : Boolean;
    idProcessoRAD  : Double;
    sListaCampos   : String;
    bRadRecusado   : Boolean;
    sSQL           : String;
    _qryAux : Twwquery;    // Paulo Nobre - WO31928
begin
  MessageInfo   := '';
  IdProcessoRAD := 0;
  sListaCampos  := '';
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.AplicaAtualContratos(FCdsContratoContr.Data, FCdsAditamento.Data);
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin

    // Paulo Nobre - WO31928 - Inicio
    _qryAux := Twwquery.Create(nil);
    _qryAux.DatabaseName := 'BaseDados';
    // Paulo Nobre - WO31928 - Fim

    StartTransaction;           
    Try
      //Gera Registro Original
      if bGeraContratoOrig then
      begin

        // Verifica se utiliza o RAD
        CtrlRAD.OpenTransaction := False;
        CtrlRAD.TipoProcesso    := CtrlRAD.GetTipoProcesso( 26 , FCdsContratoContr.FieldByName('IDPESSOA').AsInteger ); // É fixa a referência

        // Encerra o RAD anterior
        if not FCdsContratoContr.FieldByName('IDPROCESSORAD').IsNull then
        begin
          if not CtrlRAD.GravaStatusProcesso( FCdsContratoContr.FieldByName('IDPROCESSORAD').AsFloat, rsRecusado ) then
             raise Exception.Create( CtrlRAD.MessageInfo );
        end;

        // Gera Processo RAD
        if CtrlRAD.TipoProcesso > 0 then
        begin
          CtrlRAD.IdPessoa        := FCdsContratoContr.FieldByName('IDPESSOA').AsInteger;
          CtrlRAD.IdUsuario       := StrToInt(FloatToStr(F_rIDUsuario));
          CtrlRAD.idEmpresa       := FCdsContratoContr.FieldByName('IDPESSOA').AsInteger;
          CtrlRAD.CodCentroRespon := FCdsContratoContr.FieldByName('CODCENTRORESPON').AsString;
          CtrlRAD.UnidNegoc       := FCdsContratoContr.FieldByName('UNIDNEGOC').AsInteger;
          CtrlRAD.OBS             := 'Processo  : '+ FCdsContratoContr.FieldByName('CODCONTRATOEMPR').AsString +#13+
                                     'Contrato  : '+ FCdsContratoContr.FieldByName('NOMECONTRATO').AsString +#13+
                                     'Descrição : '+ FCdsContratoContr.FieldByName('DESCRICAOCONTRATO').AsString;
          CtrlRAD.Valor           := FCdsContratoContr.FieldByName('VALORBASECONTRATO').AsFloat;

          IdProcessoRAD := CtrlRAD.IniciarProcesso;
          if IdProcessoRAD < 0 then
            raise Exception.Create( CtrlRAD.MessageInfo );
        end;

        // Atualiza Processo RAD e Flag de Fim do Cadastro no Contrato
        FCdsContratoContr.Edit;
        FCdsContratoContr.FieldByName('FLGFIMCONTRATO').AsString   := 'S';
        if IdProcessoRAD > 0 then
          FCdsContratoContr.FieldByName('IDPROCESSORAD').AsFloat := IdProcessoRAD;

        FCdsContratoContr.Post;

        CarregaContratoOriginal;
      end;

      bGeraUsuXContr := (FCdsContratoContr.FieldByName('IDContrato').AsFloat = 0);

      Result := ApplyCds(FCdsContratoContr,FDbContratoContr,[],[]);
      if not Result then
        raise Exception.Create( FDbContratoContr.MessageInfo );

      if Assigned(FCdsJustificaContrato) then //Darivaldo Alencar SIG61610
      begin
        //Vinicius Maciel - SOL 142171 KTN 913629
        Result := ApplyCds(FCdsJustificaContrato,FDbJustificaContrato,[FDbContratoContr.Idcontrato],[FDbJustificaContrato.Idcontrato]);

        if not Result then
          raise Exception.Create( FDbJustificaContrato.MessageInfo );
        //Vinicius Maciel - SOL 142171 KTN 913629 - FIM
        // *****************************************************************************************
        // Marchetti - Pendencia 16455
        // *****************************************************************************************
      end;

      if (Sistema.UsaRAD) and (not FCdsLogAditamento.IsEmpty) then
      begin

        sListaCampos := sListaCampos + 'Contrato.........: ' + FCdsContratoContr.FieldByName('NOMECONTRATO').AsString +#13+#10;
        FCdsLogAditamento.First;

        while not FCdsLogAditamento.Eof do
        begin
           sSQL := 'SELECT DESCRICAO FROM DDFIELD WHERE IDDDFIELD = ' + FCdsLogAditamento.FieldByName('IDDDFIELD').AsString;

           cdsAux.Data := GetDataPacket(sSQL);

           sListaCampos := sListaCampos +
                           ' Campo..........: ' + Trim(cdsAux.FieldByName('DESCRICAO').AsString) + #13+#10 +
                           '   ValorAnterior: ' + Trim(FCdsLogAditamento.FieldByName('VLRANTERIOR').AsString) + #13+#10 +
                           '   Valor Atual..: ' + Trim(FCdsLogAditamento.FieldByName('VLRATUAL').AsString) + #13+#10;

           FCdsLogAditamento.Next;
        end;
        FCdsLogAditamento.First;

        // Verifica se utiliza o RAD
        CtrlRAD.OpenTransaction := False;
        CtrlRAD.TipoProcesso    := CtrlRAD.GetTipoProcesso( 29 , FCdsContratoContr.FieldByName('IDPESSOA').AsInteger ); // É fixa a referência

        // Encerra o RAD anterior
        if not FCdsAditamento.FieldByName('NUMRAD').IsNull then
        begin
           if not CtrlRAD.GravaStatusProcesso( FCdsAditamento.FieldByName('NUMRAD').AsFloat, rsRecusado ) then
              raise Exception.Create( CtrlRAD.MessageInfo );
           bRadRecusado := True;
        end;
        // Gera Processo RAD
        if CtrlRAD.TipoProcesso > 0 then
        begin
           CtrlRAD.IdPessoa        := FCdsContratoContr.FieldByName('IDPESSOA').AsInteger;
           CtrlRAD.IdUsuario       := StrToInt(FloatToStr(F_rIDUsuario));
           CtrlRAD.idEmpresa       := FCdsContratoContr.FieldByName('IDPESSOA').AsInteger;
           CtrlRAD.CodCentroRespon := FCdsContratoContr.FieldByName('CODCENTRORESPON').AsString;
           CtrlRAD.UnidNegoc       := FCdsContratoContr.FieldByName('UNIDNEGOC').AsInteger;
           CtrlRAD.OBS             := sListaCampos;

           IdProcessoRAD := CtrlRAD.IniciarProcesso;
           if IdProcessoRAD < 0 then
            raise Exception.Create( CtrlRAD.MessageInfo );
        end;

        if idProcessoRad > 0 then
        begin
           FCdsAditamento.Edit;
           FCdsAditamento.FieldByName('NUMRAD').AsFloat := IdProcessoRad;
           FCdsAditamento.Post;
        end;
      end;

      // *****************************************************************************************
      // Marchetti - Fim Pendencia 16455
      // *****************************************************************************************

      Result := ApplyCds(FCdsAditamento,FDbAditamento,[],[]);
      if not Result then
        raise Exception.Create( FDbAditamento.MessageInfo );

      Result := ApplyCds(FCdsLogAditamento,FDbLogAditamento,[FDbAditamento.Idaditamento],[FDbLogAditamento.Idaditamento]);
      if not Result then
        raise Exception.Create( FDbLogAditamento.MessageInfo );

      if Assigned(FCdsCtrlParcelaMedicao) then //Darivaldo Alencar SIG61610
      begin
          // Felipe A. Santos SOL 218909/16724 PPM 588170
          Result := ApplyCds(FCdsCtrlParcelaMedicao, FDbCtrlParcelaMedicao, [FDbAditamento.Idaditamento], [FDbCtrlParcelaMedicao.IdAditamento]);
          if not Result then
            raise Exception.Create( FDbCtrlParcelaMedicao.MessageInfo );
          // Felipe A. Santos SOL 218909/16724 PPM 588170
      end;

      if Assigned(FCdsContratoANS) then  //Darivaldo Alencar SIG61610
      begin
          // Felipe A. Santos SOL 242313/17289 PPM 828977 - início
          Result := ApplyCds(FCdsContratoANS, FDbContratoANS, [FDbContratoContr.Idcontrato], [FDbContratoANS.IdContrato]);
          if not Result then
            raise Exception.Create( FDbContratoANS.MessageInfo );
          // Felipe A. Santos SOL 242313/17289 PPM 828977 - fim
      end;

      //Associa Usuário ao Contrato recém cadastrado
      if bGeraUsuXContr then
      begin
        Result := ExecSQL('INSERT INTO CONTRATOUSUARIO(IDCONTRATO,IDUSUARIO) '+
                          'VALUES('+FloatToStr(FDbContratoContr.Idcontrato.AsFloat)+','+
                                    FloatToStr(F_rIDUsuario)+') ');
        if not Result then
          raise Exception.Create('Erro ao inserir em CONTRATOUSUARIO');
      end;

      if bGeraContratoOrig then begin
        Result := ExcluiContratoOrig(FDbContratoContr.Idcontrato.AsFloat);
        if not Result then
          raise Exception.create( MessageInfo );

        Result := ApplyCds(CdsContratoOrig,FDbContratoOrig,[],[]);
        if not Result then
          raise Exception.create( FDbContratoOrig.MessageInfo );

        Result := ApplyCds(CdsObjetoOrig,FDbObjxItOrig,[],[]);
        if not Result then
          raise Exception.create( FDbObjxItOrig.MessageInfo );

        Result := ApplyCds(CdsRateioOrig,FDbRateioCCOrig,[],[]);
        if not Result then
          raise Exception.create( FDbRateioCCOrig.MessageInfo );
      end;

      if Assigned(FCdsHstRenovacao) then  //Darivaldo Alencar SIG61610
      begin
          // Thiago Melo SOL 174920 KINTANA 1591690 ini
          FCdsHstRenovacao.First;

          while not FCdsHstRenovacao.Eof do
          begin
            FCdsHstRenovacao.Edit;
            FCdsHstRenovacao.FieldByName('IDCONTRATO').AsFloat := FDbContratoContr.Idcontrato.AsFloat;
            FCdsHstRenovacao.Post;

            FCdsHstRenovacao.Next;
          end;

          FCdsHstRenovacao.FieldByName('IDCONTRATO').AsString;


          Result := ApplyCds(FCdsHstRenovacao,FDbHstRenovacao,[],[]);
          if not Result then
            raise Exception.Create( FDbHstRenovacao.MessageInfo );
          //fimini
      end;

      //Everson Cunha - SIG46231 - Início
      //Marcos Lima - SIG132255 - Início
      if Assigned(FCdsAreaGestora) and (FCdsAreaGestora.Active) then
      //Marcos Lima - SIG132255 - Fim
      begin
        FCdsAreaGestora.First;

        while not FCdsAreaGestora.Eof do
        begin
          FCdsAreaGestora.Edit;
          FCdsAreaGestora.FieldByName('IDCONTRATO').AsFloat := FDbContratoContr.Idcontrato.AsFloat;
          FCdsAreaGestora.Post;

          FCdsAreaGestora.Next;
        end;

        Result := ApplyCds(FCdsAreaGestora, FDbContratoAreaGestora, [], []);

        if not Result then
          raise Exception.create( FDbContratoAreaGestora.MessageInfo );
      end;
      //Everson Cunha - SIG46231 - Fim


      if Assigned(FCdsAreaTecnica) and (FCdsAreaTecnica.Active) then
      begin
        FCdsAreaTecnica.First;

        while not FCdsAreaTecnica.Eof do
        begin
          FCdsAreaTecnica.Edit;
          FCdsAreaTecnica.FieldByName('IDCONTRATO').AsFloat := FDbContratoContr.Idcontrato.AsFloat;
          FCdsAreaTecnica.Post;

          FCdsAreaTecnica.Next;
        end;

        Result := ApplyCds(FCdsAreaTecnica, FDbContratoAreaTecnica, [], []);

        if not Result then
          raise Exception.create( FDbContratoAreaTecnica.MessageInfo );
      end;

      //Everson Cunha - SIG103333 - Início
      //Marcos Lima - SIG132255 - Início
      if Assigned(FCdsNegociacao) and (FCdsNegociacao.Active) then
      //Marcos Lima - SIG132255 - Fim
      begin
        FCdsNegociacao.First;

        while not FCdsNegociacao.Eof do
        begin
          FCdsNegociacao.Edit;
          FCdsNegociacao.FieldByName('IDCONTRATO').AsFloat := FDbContratoContr.Idcontrato.AsFloat;
          FCdsNegociacao.Post;

          FCdsNegociacao.Next;
        end;

        Result := ApplyCds(FCdsNegociacao, FDbNegociacao, [], []);

        if not Result then
          raise Exception.create(FDbNegociacao.MessageInfo);
      end;
      //Everson Cunha - SIG103333 - Fim

      // Paulo Nobre - WO15750 - Inicio
      // Só atualiza o flag de saldo transferido se foi marcada esta opção no Cadastro de Aditamento
     // if bchkbImportaSaldo Then
//        _AtualizaFlgSaldoTransf(iIdContrato, iIdAditamento, bchkbImportaSaldo, dValorManual);    // Paulo Nobre - WO20776
      // Paulo Nobre - WO15750 - Fim

      // Paulo Nobre - WO38245 - Inicio

      // Paulo Nobre - WO31928 - Inicio

      if sOrigem = 'CE' Then  // Chamado pelo Cadastro de Encerramento
      Begin
         // Indisponibilizando o Contrato para medições
         _qryAux.Close;
         _qryAux.Sql.Clear;
         _qryAux.Sql.Add('UPDATE CM.CONTRATOCONTR SET FLGSALDOTRANSFERIDO = ''S'' ');
         _qryAux.Sql.Add('WHERE IDCONTRATO = ' + FDbContratoContr.Idcontrato.AsString );
         _qryAux.Execsql;

         // Indisponibilizando todos os Aditamentos do Contrato para medições
         _qryAux.Close;
         _qryAux.Sql.Clear;
         _qryAux.Sql.Add('UPDATE CM.ADITAMENTO SET FLGSALDOTRANSFERIDO = ''S'' ');
         _qryAux.Sql.Add('WHERE IDCONTRATO = ' + FDbContratoContr.Idcontrato.AsString );

    //     _qryAux.Sql.Add('      AND IDADITAMENTO < (SELECT MAX(A.IDADITAMENTO)  ');
    //     _qryAux.Sql.Add('                          FROM ADITAMENTO A             ');
    //     _qryAux.Sql.Add('                          WHERE A.IDCONTRATO = ' + FDbContratoContr.Idcontrato.AsString + ')' );

         _qryAux.Execsql;

         _qryAux.Free;

      end;
      // Paulo Nobre - WO31928 - Fim

      // Paulo Nobre - WO38245 - Fim

      Commit;
    except
      on E:Exception do
      begin
         MessageInfo := E.Message;
         Rollback;
         _qryAux.Free;
         Result := False;
      end;
    end;
  end;
end;

function TCtrlContratos.ExcluiContrato(const P_IdContrato: Integer): Boolean;
var
  sSql: string;

begin
  MessageInfo := '';
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.ExcluiContrato(FCdsContratoContr.Data);
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    StartTransaction;
    try
      // Encerra o RAD
      if not FCdsContratoContr.FieldByName('IDPROCESSORAD').IsNull then begin
        CtrlRAD.OpenTransaction := False;
        if not CtrlRAD.GravaStatusProcesso( FCdsContratoContr.FieldByName('IDPROCESSORAD').AsFloat, rsRecusado ) then
           raise Exception.Create( CtrlRAD.MessageInfo );
      end;
      //Gustavo Mendes - 26187
      sSql := 'DELETE FROM CONTRATOUSUARIO WHERE IDCONTRATO = ' + IntToStr(P_IdContrato);
      if not ExecSQL( sSql ) then
        raise exception.create('Erro ao excluir o usuário vinculado ao contrato.');
      //Gustavo Mendes - 26187 Fim
      //Vinicius Maciel - SOL 142171 KTN 913629
      sSql := 'DELETE FROM JUSTIFICACONTRATO WHERE IDCONTRATO = ' + IntToStr(P_IdContrato);
      if not ExecSQL( sSql ) then
        raise exception.create('Erro ao excluir as justificativas vinculadas ao contrato.');
      //Vinicius Maciel - SOL 142171 KTN 913629 - FIM

      // Thiago Melo SOL 174920 KINTANA 1591690 ini
      sSql := 'DELETE FROM HSTRENOVACONTRATO WHERE IDCONTRATO = ' + IntToStr(P_IdContrato);
      if not ExecSQL( sSql ) then
        raise exception.create('Erro ao excluir histórico de renovação de contrato.');
      // Thiago Melo SOL 174920 KINTANA 1591690 fim

      // Felipe A. Santos SOL 242313/17289 PPM 828977 - início
      sSQL := 'DELETE FROM CONTRATOANS WHERE IDCONTRATO = ' + IntToStr(P_IdContrato);
      if not ExecSQL( sSql ) then
        raise exception.create('Erro ao excluir os ANS vinculados ao contrato.');
      // Felipe A. Santos SOL 242313/17289 PPM 828977 - fim

      Result:=ApplyCds(FCdsContratoContr,FDbContratoContr,[],[]);
      if not Result then raise Exception.Create( FDbContratoContr.MessageInfo );

      Commit;
    except
      on E:Exception do begin
         MessageInfo := E.Message;
         Rollback;
         Result:=False;
      end;
    end;
  end;
end;

function TCtrlContratos.ExcluiContratoOrig(const idContrato:Double): Boolean;
var sSql : String;
begin
  Result := True;
  try
    sSql := 'DELETE FROM CONTRATOORIG WHERE IDCONTRATO = ' + FloatToStr(idContrato);
    if not ExecSQL( sSql ) then
      raise exception.create('Erro ao excluir o contrato original');
    sSql := 'DELETE FROM OBJXITORIG   WHERE IDCONTRATO = ' + FloatToStr(idContrato);
    if not ExecSQL( sSql ) then
      raise exception.create('Erro ao excluir os objetos do contrato original');
    sSql := 'DELETE FROM RATEIOCCORIG WHERE IDCONTRATO = ' + FloatToStr(idContrato);
    if not ExecSQL( sSql ) then
      raise exception.create('Erro ao excluir os rateios do contrato original');
  except
    on E:Exception do begin
       MessageInfo := E.Message;
       Result := False;
    end;
  end;
end;


function TCtrlContratos.ListContratoOrig(rIDContrato: Double): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT '+
         '   C.IDCONTRATO, C.CODPORTFORMA, C.CODCENTRORESPON, '+
         '   C.IDPESSOA, C.UNIDNEGOC, C.IDCONTATO, C.IDFORCLI, '+
         '   C.MOECODIGO,C.NOMECONTRATO, C.DESCRICAOCONTRATO, '+
         '   C.CODAUXCONTRATO,C.TIPOCONTRATO, C.DATAASSINATURA, '+
         '   C.VALORBASECONTRATO,C.DATABASECONTRATO, C.DATAPREVENCERRA, '+
         '   C.PRAZODENUNCIA, C.CODCONTRATOEMPR, C.FLGEMPENHO, '+
         '   C.DATAEFETENCERRA, C.MOTIVOENCERRA, C.FLGFIMCONTRATO, '+
         '   C.CODTIPDOC, C.RENOVACAO, C.OBSERVACAO, C.IDTELEFONE, '+
         '   C.IDRESERVAORCAMEN, C.AVISO, M.MOEDESC, C.IDRESPONSAVEL, '+
         '   C.IDENDCORRESPON, C.IDENDCOBRANCA, C.IDENDENTREGA,'+
         '   R.NUMRESERVA, C.DATAINICIO, '+
         '   RTRIM(T.DDI)||DECODE(T.DDI,'''','''',''-'')||DECODE(T.DDD,'''','''',''('')||'+
         '                 RTRIM(T.DDD)||DECODE(T.DDD,'''','''','') '')||'+
         '                 T.NUMERO||DECODE(TC.RAMAL,'''','' '',''/R.'')||TC.RAMAL  TELCONTATO, '+
         '   CP.NOME AS NOMECONTATO, '+
         '   P.RAZAOSOCIAL AS NOMEFORCLI, '+
         '   RTRIM(ECOR.LOGRADOURO)||'' ''||RTRIM(ECOR.NUMERO)||'' ''||'+
         '         RTRIM(ECOR.COMPLEMENTO)||'' ''||RTRIM(ECOR.BAIRRO)||'' ''||'+
         '         RTRIM(CDCOR.NOME)||DECODE(ECOR.CEP,'''','' '','' CEP:'')||'+
         '         RTRIM(ECOR.CEP) ENDCORRESP, '+
         '   RTRIM(ECOB.LOGRADOURO)||'' ''||RTRIM(ECOB.NUMERO)||'' ''||'+
         '         RTRIM(ECOB.COMPLEMENTO)||'' ''||RTRIM(ECOB.BAIRRO)||'' ''||'+
         '         RTRIM(CDCOB.NOME)||DECODE(ECOB.CEP,'''','' '','' CEP:'')||'+
         '         RTRIM(ECOB.CEP) ENDCOBRANCA, '+
         '   RTRIM(EENT.LOGRADOURO)||'' ''||RTRIM(EENT.NUMERO)||'' ''||'+
         '         RTRIM(EENT.COMPLEMENTO)||'' ''||RTRIM(EENT.BAIRRO)||'' ''||'+
         '         RTRIM(CDENT.NOME)||DECODE(EENT.CEP,'''','' '','' CEP:'')||'+
         '         RTRIM(EENT.CEP) ENDENTREGA, '+
         '   U.NOME AS NOMEUNEG, '+
         '   PRES.NOME AS NOMERESPON, '+
         '   CR.NOME AS NOMECENTRORESP, '+
         '   TD.DESCRICAO AS TIPODOCDESCR '+
         'FROM '+
         '   CONTRATOORIG C, '+
         '   MOEDA M, '+
         '   RESERVAORCAMEN R, '+
         '   TELENDPESS T, '+
         '   TELCONTATO TC, '+
         '   CONTATOPESS CP, '+
         '   PESSOA P, '+
         '   UNIDNEGOCIO U, '+
         '   CENTRESPON CR, '+
         '   TIPODOCRECPAG TD, '+
         '   ENDPESS ECOR, '+
         '   CIDADES CDCOR, '+
         '   ENDPESS ECOB, '+
         '   CIDADES CDCOB, '+
         '   ENDPESS EENT, '+
         '   CIDADES CDENT, '+
         '   RESPONSAVEL RES, '+
         '   PESSOA PRES '+
         'WHERE '+
         '   (C.IDCONTRATO = '+FloatToStr(rIDContrato)+') AND '+
         '   (C.MOECODIGO = M.MOECODIGO(+)) AND '+
         '   (C.IDRESERVAORCAMEN = R.IDRESERVAORCAMEN(+)) AND '+
         '   (C.IDCONTATO = TC.IDCONTATO(+)) AND '+
         '   (TC.IDTELEFONE = T.IDTELEFONE(+)) AND '+
         '   (C.IDCONTATO = CP.IDCONTATO(+)) AND '+
         '   (C.IDFORCLI = P.IDPESSOA(+)) AND '+
         '   (C.UNIDNEGOC = U.UNIDNEGOC(+)) AND '+
         '   (C.CODCENTRORESPON = CR.CODCENTRORESPON(+)) AND '+
         '   (C.CODTIPDOC = TD.CODTIPDOC(+)) AND '+
         '   (C.IDENDCORRESPON = ECOR.IDENDERECO(+)) AND '+
         '   (ECOR.IDCIDADES = CDCOR.IDCIDADES(+)) AND '+
         '   (C.IDENDCOBRANCA = ECOB.IDENDERECO(+)) AND '+
         '   (ECOB.IDCIDADES  = CDCOB.IDCIDADES(+)) AND '+
         '   (C.IDENDENTREGA = EENT.IDENDERECO(+)) AND '+
         '   (EENT.IDCIDADES = CDENT.IDCIDADES(+)) AND '+
         '   (C.IDRESPONSAVEL = RES.IDRESPONSAVEL(+)) AND '+
         '   (RES.IDRESPONSAVEL = PRES.IDPESSOA(+)) ';
    Result:=GetDataPacket(sSql);
end;


procedure TCtrlContratos.CarregaContratoOriginal;
var cdsTemp : TCMClientDataSet;
    sSql, sIdContrato : String;
    nCampo : Integer;
begin
  try
    cdsTemp := TCMClientDataSet.Create( nil );
    sIdContrato := IntToStr( cdsContratoContr.FieldByName('IDCONTRATO').AsInteger );

    // Preenche Contrato Original
    CdsContratoOrig.Data := ListContratos(-1);
    CdsContratoOrig.Insert;
    for nCampo := 0 to CdsContratoContr.FieldCount-1 do
        CdsContratoOrig.FieldByName(CdsContratoContr.Fields[nCampo].FieldName).Value:=
           CdsContratoContr.FieldByName(CdsContratoContr.Fields[nCampo].FieldName).Value;
    CdsContratoOrig.Post;

    // Preenche Objeto x Item Contratual Original
    sSql := 'SELECT * FROM OBJETOSXITEMCONTR WHERE IDCONTRATO = ';
    cdsTemp.Data := GetDataPacket( sSql + sIdContrato );
    cdsObjetoOrig.Data := GetDataPacket( sSql + ' -1' );
    while not cdsTemp.Eof do begin
      CdsObjetoOrig.Insert;
      for nCampo := 0 to CdsTemp.FieldCount-1 do
          CdsObjetoOrig.FieldByName(CdsTemp.Fields[nCampo].FieldName).Value:=
             CdsTemp.FieldByName(CdsTemp.Fields[nCampo].FieldName).Value;
      CdsObjetoOrig.Post;
      cdsTemp.Next;
    end;

    // Preenche Rateio de CC Original
    sSql := 'SELECT * FROM RATEIOCENTROCUSTO WHERE IDCONTRATO = ';
    cdsTemp.Data := GetDataPacket( sSql + sIdContrato );
    cdsRateioOrig.Data := GetDataPacket( sSql + ' -1' );
    while not cdsTemp.Eof do begin
      CdsRateioOrig.Insert;
      for nCampo := 0 to CdsTemp.FieldCount-1 do
          CdsRateioOrig.FieldByName(CdsTemp.Fields[nCampo].FieldName).Value:=
             CdsTemp.FieldByName(CdsTemp.Fields[nCampo].FieldName).Value;
      CdsRateioOrig.Post;
      cdsTemp.Next;
    end;
  finally
    FreeAndNil( cdsTemp );
  end;
end;

function TCtrlContratos.StatusContrato(const rIdContrato: Double): String;
var cdsTemp : TCMClientDataSet;
    sStatusRAD : TRADStatus;
begin
   try
     Result  := '';
     cdsTemp := TCMClientDataSet.Create( nil );
     cdsTemp.Data := GetDataPacket('SELECT * FROM CONTRATOCONTR WHERE IDCONTRATO = ' +
                                   FloatToStr(rIdContrato) );

     if cdsTemp.FieldByName('FLGFIMCONTRATO').AsString[1] in ['E','N'] then begin
       Result := cdsTemp.FieldByName('FLGFIMCONTRATO').AsString[1];
     end else begin
       if cdsTemp.FieldByName('IDPROCESSORAD').IsNull then begin
         Result := 'A';
       end else begin
         sStatusRAD := CtrlRAD.StatusProcesso(cdsTemp.FieldByName('IDPROCESSORAD').AsFloat);
         case sStatusRAD of
            rsRecusado   : Result := 'R';
            rsAutorizado : Result := 'A';
            rsPendente   : Result := 'S';
            rsExcluido   : Result := 'X';
         end;
       end;
     end;
   finally
     FreeAndNil( cdsTemp ); 
   end;
end;


function TCtrlContratos.ListContratoAditamento(
  IdContrato: Double): OleVariant;
var
  sSql, sParam: String;
begin
 sParam := '';
 if IdContrato <> 0 then
   sParam := ' AND CO.IDCONTRATO = ' + FloatToStr(IdContrato) +#13;

//Rafael SIG  - Inicio
 //sSql := ' SELECT ' +#13+ 
 //                ' CO.CODCONTRATOEMPR, ' +#13+
 //                 ' CO.NOMECONTRATO, ' +#13+
 //                 ' OC.NOMEOBJETO, ' +#13+
 //                 ' IC.NOME_ITEM, ' +#13+
 //                 ' CO.DATAASSINATURA, ' +#13+
 //                 ' CO.DATAASSINATURA, ' +#13+
 //                 ' OI.IDCONTRATO ' +#13+
 //        ' FROM ' +#13+
 //                 ' CONTRATOCONTR CO, ' +#13+
 //                 ' OBJETOCONTRATUAL OC, ' +#13+
 //                 ' ITEMCONTRATUAL IC, ' +#13+
 //                 ' OBJETOSXITEMCONTR OI ' +#13+
 //       ' WHERE ' +#13+
 //                ' ( CO.IDCONTRATO = OI.IDCONTRATO ) AND ' +#13+
 //                 ' ( IC.IDITEM = OI.IDITEM ) AND  ' +#13+
 //                 ' ( OC.IDOBJETO = OI.IDOBJETO )' +#13 +

 sSql := ' SELECT ' +#13+
                  ' CO.CODCONTRATOEMPR, ' +#13+
                  ' CO.NOMECONTRATO, ' +#13+
                  ' OC.NOMEOBJETO, ' +#13+
                  ' IC.NOME_ITEM, ' +#13+
                  ' CO.DATAASSINATURA, ' +#13+
                  ' CO.DATAASSINATURA, ' +#13+
                  ' OI.IDCONTRATO ' +#13+
          ' FROM  CONTRATOCONTR CO' +#13+
                  '  LEFT JOIN OBJETOSXITEMCONTR OI ON CO.IDCONTRATO = OI.IDCONTRATO ' +#13+
                  ' LEFT JOIN OBJETOCONTRATUAL OC ON OC.IDOBJETO = OI.IDOBJETO ' +#13+
                  ' LEFT JOIN ITEMCONTRATUAL IC ON IC.IDITEM = OI.IDITEM ' +#13+
         ' WHERE 1=1' +#13+

                  sParam;
//Rafael SIG  - Fim
   //+ sParam;

  //sSql := sSql + ' ORDER BY NOMECONTRATO ';

  Result := GetDataPacket( sSql );
end;

//Vinicius Maciel - SOL 142171 Kintana 913629
function TCtrlContratos.listaItensContratos(idContraparte,sDataBaseContrato : String) : OleVariant;
var
    sSQL : String;
begin
    sSQL := ' SELECT CTC.IDCONTRATO, CTC.DATAASSINATURA, CTC.NOMECONTRATO, CTC.VALORBASECONTRATO, CTC.DATABASECONTRATO  '+
            ' FROM CONTRATOCONTR CTC WHERE IDFORCLI = ' +QuotedStr(idContraparte) +
            ' AND DATABASECONTRATO > to_date('+QuotedStr(sDataBaseContrato)+') - ' + IntToStr(retornaDiasAlcadas) +
            ' AND DATABASECONTRATO<= to_date('+QuotedStr(sDataBaseContrato)+')';
Result := GetDataPacket(sSQL);
end;

function TCtrlContratos.retornaDiasAlcadas : Integer;
var
    sSQL : String;
    cdsDiasAlcadas : TCMClientDataSet;
begin
    cdsDiasAlcadas := TCMClientDataSet.Create (nil);
    cdsDiasAlcadas.Data := GetDataPacket('SELECT * FROM PARAMCONTRATO WHERE IDPESSOA = 1');
    Result := cdsDiasAlcadas.FieldBYName('QNTDIASALCADAS').AsInteger;
    cdsDiasAlcadas.free;
end;

function TCtrlContratos.listaTodosItensContratos (cds : TCMClientDataSet; bAlterador : boolean) : TCMClientDataSet;
var
    cdsItensContrato : TCMClientDataSet;
begin
    cdsItensContrato := TCMClientDataSet.Create(nil);
    cdsItensContrato.data :=ListaItensContratos(Cds.FieldByName('IDFORCLI').asString, Cds.FieldByName('DATABASECONTRATO').asString);
    if not (bAlterador) then
    begin
        cdsItensContrato.Insert;
        cdsItensContrato.FieldByName('DATABASECONTRATO').asString := cds.FieldByName('DATABASECONTRATO').asString;
        cdsItensContrato.FieldByName('NOMECONTRATO').asString := cds.FieldByName('NOMECONTRATO').asString;
        cdsItensContrato.FieldByName('VALORBASECONTRATO').asString := cds.FieldByName('VALORBASECONTRATO').asString;
    end
    else
    begin
        cdsItensContrato.Locate('IDCONTRATO', cds.FieldByName('IDCONTRATO').asString,[]);
        cdsItensContrato.Edit;
        cdsItensContrato.FieldByName('VALORBASECONTRATO').asString := cds.FieldByName('VALORBASECONTRATO').asString;
        cdsItensContrato.FieldByName('NOMECONTRATO').asString := cds.FieldByName('NOMECONTRATO').asString;
        cdsItensContrato.FieldByName('DATABASECONTRATO').asString := cds.FieldByName('DATABASECONTRATO').asString;
    end;
    cdsItensContrato.Post;
Result := cdsItensContrato;
end;


function TCtrlContratos.somaValorContratos (CdsOriginal : TCMClientDataSet) : Double;
var
    valor : Double;
begin
    CdsOriginal.first;
    while not cdsOriginal.eof Do
    Begin
        Valor:= Valor + CdsOriginal.FieldByName('VALORBASECONTRATO').asFloat;
    CdsOriginal.Next;
    End;
    Result := Valor;
end;

function TCtrlContratos.verificaAlcadas (sDtAssinatura : String) : OleVariant;
var
    sSQL : String;
begin
     //Higor Nayde Ferreira SOL 190509 - KTN 1802910  Inicio
     {sDtAssinatura := StringReplace(sDtAssinatura, '.', '', [rfReplaceAll]);

     sSQL := 'SELECT * FROM ALCADAS WHERE VALOR ='+ Trim(StringReplace(sDtAssinatura, ',', '.', [rfReplaceAll]));
     result := GetDataPacket(sSQL);      }
     //Higor Nayde Ferreira SOL 190509 - KTN 1802910 Fim


 {    sSQL := 'SELECT Max(DTINICIOVIGENCIA), IDCARGO'+
            ' FROM ALCADAS ' +
            'WHERE (DTINICIOVIGENCIA <= TO_DATE('+QuotedStr(sDtAssinatura)+') )'+
            ' GROUP BY IDCARGO ';
    result := GetDataPacket(sSQL); }

    sSQL := 'SELECT Max(DTINICIOVIGENCIA) FROM ALCADAS ';
    result := GetDataPacket(sSQL);
end;

function TCtrlContratos.alcadasDisponivel (sDtAssinatura : String) : boolean;
var
    CdsVerificaAlcada : TCMClientDataSet;
    resultado : boolean;
begin
    CdsVerificaAlcada := TCMClientDataSet.Create (nil);
    CdsVerificaAlcada.Data := verificaAlcadas(sDtAssinatura);
    resultado := CdsVerificaAlcada.isEmpty;
    CdsVerificaAlcada.free;
    Result := resultado;
end;

function TCtrlContratos.carregaUsuario (iIdUsuario : Integer) : String;
var
    CdsUsuario : TCMClientDataSet;
begin
    CdsUsuario := TCMClientDataSet.Create (nil);
    CdsUsuario.Data := GetDataPacket('SELECT * FROM USUARIOSISTEMA WHERE IDUSUARIO ='+ IntToStr(iIdUsuario));
    Result := CdsUsuario.FieldBYName('NOMEUSUARIO').asString;
    CdsUsuario.free;
end;

function TCtrlContratos.carregaAlcadas (dValor : Double; dCargo: String = '') : OleVariant; //Higor Nayde Ferreira SOL 190509 - KTN 1802910
var
    sSQL : String;
begin
    DecimalSeparator := '.';
    sSQL := ' SELECT DISTINCT DECODE(ALC.IDCARGO,NULL,'+QuotedStr('DIRETORIA EXECUTIVA')+',CG.TITULO) AS CARGO, ALC.IDALCADAS, ALC.VALOR FROM'+
            '(SELECT * FROM ALCADAS WHERE (FLGLIMITE = ' + QuotedStr('<=')+' AND VALOR >= '+FloatToStr(dValor)+')'+
            ' OR ( FLGLIMITE = '+ QuotedStr('>') + ' AND VALOR < '+FloatToStr(dValor)+') ) ALC, ' +
            '(SELECT Max(DTINICIOVIGENCIA) AS DTINICIOVIGENCIA, IDCARGO' +
            ' FROM ALCADAS WHERE (DTINICIOVIGENCIA <= SYSDATE )' +
            ' GROUP BY IDCARGO) ALCDISP, ' +
            ' CARGO CG WHERE ALC.IDCARGO  = CG.IDCARGO (+) ' +
            ' AND ALC.DTINICIOVIGENCIA = ALCDISP.DTINICIOVIGENCIA ' +
            ' AND (ALC.IDCARGO = ALCDISP.IDCARGO OR ALCDISP.IDCARGO IS NULL)' +
            ' AND ALC.DTINICIOVIGENCIA <= SYSDATE ';
             //Higor Nayde Ferreira SOL 190509 - KTN 1802910 Inicio
             if dCargo = '' then
                sSQL := sSQL + ' ORDER BY VALOR'
             else
             begin
                 sSQL := sSQL +' AND CG.TITULO = '''+dCargo+''''+
                               ' ORDER BY VALOR '
             end;
              sSQL := sSQL +'';
            //Higor Nayde Ferreira SOL 190509 - KTN 1802910 Fim

    DecimalSeparator := ',';
    result := GetDataPacket(sSQL);
end;

// Paulo Nobre - WO29228 - Inicio
function TCtrlContratos.selecionaJustificativa( iIdContrato: integer): OleVariant;
var sSQL : String;
begin

   sSQL:= sSQl + 'SELECT JC.IDJUSTIFICACONTRATO,                                                                          ';
   sSQL:= sSQl + '       JC.IDCONTRATO,                                                                                   ';
   sSQL:= sSQl + '       CAST(JC.JUSTIFICATIVA AS VARCHAR2(2000)) AS JUSTIFICATIVA,                                       ';
   sSQL:= sSQl + '       JC.IDRESPONSAVELALCADA,                                                                          ';
   sSQL:= sSQl + '       JC.DATARESPALCADA,                                                                               ';
   sSQL:= sSQl + '       JC.IDALCADAS,                                                                                    ';
   sSQL:= sSQl + '       JC.VALORESCONTRATOS                                                                              ';
   sSQL:= sSQl + 'FROM JUSTIFICACONTRATO JC,                                                                              ';
   sSQL:= sSQl + '     (SELECT MAX(IDJUSTIFICACONTRATO) AS ID, IDCONTRATO FROM JUSTIFICACONTRATO GROUP BY IDCONTRATO) JCI ';
   sSQL:= sSQl + 'WHERE JC.IDCONTRATO = ' + InttoStr(iIdContrato);
   sSQL:= sSQl + '      AND JC.IDJUSTIFICACONTRATO = JCI.ID                                                               ';
   Result := GetDataPacket(sSQL);

end;
// Paulo Nobre - WO29228 - Fim


//Vinicius Maciel - SOL 142171 Kintana 913629 - FIM
function TCtrlContratos.CarregarValorAlcada(dValor: String) :OleVariant;
var
    sSQL : String;
begin
     //Higor Nayde Ferreira SOL 190509 - KTN 1802910 Inicio
     dValor := StringReplace(dValor, '.', '', [rfReplaceAll]);
     sSQL:=  ' SELECT MIN (VALOR) VALOR                                                                     '+
    '   FROM (                                                                                              '+
    ' SELECT DISTINCT DECODE(ALC.IDCARGO,NULL,'+QuotedStr('DIRETORIA EXECUTIVA')+',CG.TITULO) AS CARGO,     '+
    '      ALC.VALOR                                                                                        '+
    '  FROM(SELECT *                                                                                        '+
    '         FROM ALCADAS                                                                                  '+
    '        WHERE (FLGLIMITE =' +QuotedStr('<=')+' AND VALOR >= '+(Trim(StringReplace(dValor, ',', '.', [rfReplaceAll])))+')      '+
    '           OR (FLGLIMITE =' +QuotedStr( '>')+' AND VALOR <  '+(Trim(StringReplace(dValor, ',', '.', [rfReplaceAll])))+'))ALC, '+
    '      (SELECT MAX(DTINICIOVIGENCIA) AS DTINICIOVIGENCIA,IDCARGO                                        '+
    '        FROM ALCADAS                                                                                   '+
    '        WHERE (DTINICIOVIGENCIA <= SYSDATE)GROUP BY IDCARGO                                            '+
    '      ) ALCDISP,                                                                                       '+
    '       CARGO CG                                                                                        '+
    ' WHERE ALC.IDCARGO = CG.IDCARGO(+)                                                                     '+
    '   AND ALC.DTINICIOVIGENCIA = ALCDISP.DTINICIOVIGENCIA                                                 '+
    '   AND ALC.DTINICIOVIGENCIA <= SYSDATE  ORDER BY VALOR)                                                ';

    result := GetDataPacket(sSQL);
    //Higor Nayde Ferreira SOL 190509 - KTN 1802910 Fim
end;
//Higor Nayde Ferreira SOL 190509 - KTN 1802910 Inicio
function TCtrlContratos.CarregaCargoAlcada(dValor: String): OleVariant;
var
   sSQL : string;
begin
     dValor := StringReplace(dValor, '.', '', [rfReplaceAll]);
     sSQL:=
        '  SELECT DECODE (AC.IDCARGO, NULL, '+QuotedStr('DE')+', CC.TITULO) CARGO               '+
        '         FROM ALCADAS AC                                                               '+
        '         LEFT JOIN CARGO CC ON CC.IDCARGO = AC.IDCARGO                                 '+
        '  WHERE AC.VALOR = '+(Trim(StringReplace(dValor, ',', '.', [rfReplaceAll])))+'       '+
        '         AND AC.DTINICIOVIGENCIA <= (SELECT MAX(DTINICIOVIGENCIA) AS DTINICIOVIGENCIA   '+
        '  FROM ALCADAS )                                                                       '+
        '         AND ROWNUM = 1                                                                ';
     result := GetDataPacket(sSQL);
end;
 //Higor Nayde Ferreira SOL 190509 - KTN 1802910 Fim
function TCtrlContratos.ValorDisponivel(dValor: String): String;
var
    CdsVerificaValor : TCMClientDataSet;
    resultado : String;
begin
    //Higor Nayde Ferreira SOL 190509 - KTN 1802910 Inicio
    CdsVerificaValor := TCMClientDataSet.Create (nil);
    CdsVerificaValor.Data := CarregarValorAlcada(dValor);
    resultado := CdsVerificaValor.FieldByName('VALOR').AsString;
    CdsVerificaValor.free;
    Result := resultado;
    //Higor Nayde Ferreira SOL 190509 - KTN 1802910 Fim
end;
//Higor Nayde Ferreira SOL 190509 - KTN 1802910 Inicio
function TCtrlContratos.CargoDisponivel(dValor: String): String;
var
    CdsVerificaCargo : TCMClientDataSet;
    resultado : String;
begin
    CdsVerificaCargo      := TCMClientDataSet.Create (nil);
    CdsVerificaCargo.Data := CarregaCargoAlcada(dValor);
    resultado             := CdsVerificaCargo.FieldByName('CARGO').AsString;
    CdsVerificaCargo.free;
    Result                := resultado;
end;
//Higor Nayde Ferreira SOL 190509 - KTN 1802910 Fim

function TCtrlContratos.ListaDadosHistoricoRenovacao(
  IdContrato: Double): OleVariant;
var
  sSql : String;
begin
  sSql := ' SELECT ' +
          '      HR.IDHSTRENOVACONTRATO, ' +
          '      HR.IDCONTRATO, '  +
          '      HR.DTANDAMENTO, ' +
          '      HR.DESCANDAMENTO  ' +
          '   FROM ' +
          '      HSTRENOVACONTRATO HR, ' +
          // Felipe A. Santos - SOL 217597/17169 PPM 772732 - início
          '      (SELECT HR1.IDCONTRATO, MAX(HR1.DTANDAMENTO) MAX_DTHIST ' +
          '         FROM HSTRENOVACONTRATO HR1 ' +
          '     GROUP BY HR1.IDCONTRATO) MAX_DTAND, ' +
          '      (SELECT A1.IDCONTRATO, TO_CHAR(MAX(A1.TRGDTINCLUSAO), ''DD/MM/YYYY'') AS MAX_DTADITA  ' +
          '        FROM ADITAMENTO A1 ' +
          '     GROUP BY A1.IDCONTRATO) A ' +
          // Felipe A. Santos - SOL 217597/17169 PPM 772732 - fim

          '   WHERE ' +
          '      (HR.IDCONTRATO = ' + FloatToStr(IdContrato) + ') ' +

          // Felipe A. Santos - SOL 217597/17169 PPM 772732 - início
          '    AND (HR.IDCONTRATO = A.IDCONTRATO(+)) ' +
          '    AND (HR.IDCONTRATO = MAX_DTAND.IDCONTRATO) ' +
          '    AND (HR.DTANDAMENTO >= NVL(A.MAX_DTADITA, MAX_DTAND.MAX_DTHIST) AND HR.DTANDAMENTO = MAX_DTAND.MAX_DTHIST )' +
          // Felipe A. Santos - SOL 217597/17169 PPM 772732 - fim

          '  ORDER BY IDHSTRENOVACONTRATO ';
   Result:=GetDataPacket(sSql);
end;

function TCtrlContratos.ExcluirHstRenovacao(IdContrato: Integer): Boolean;
var
  Instrucao : string;
begin
  try

    Instrucao := 'DELETE FROM HSTRENOVACONTRATO WHERE IDCONTRATO = ' + IntToStr(IdContrato);
    if not ExecSQL( Instrucao ) then
      raise exception.create('Erro ao excluir histórico de renovação de contrato.');

  except
    on E:Exception do begin
       MessageInfo := E.Message;
       Result := False;
    end;
  end;
end;

// Felipe A. Santos SOL 218909/16724 PPM 588170 - início
function TCtrlContratos.ItemVinculadoAoContrato(
  IdContrato: Double): Boolean;
var
   sSQL : string;
begin
  sSQL := 'SELECT C.IDCONTRATO ' +
          '  FROM CONTRATOCONTR C, OBJETOSXITEMCONTR O ' +
          ' WHERE C.IDCONTRATO = ' + FloatToStr(IdContrato) +
          '   AND C.IDCONTRATO = O.IDCONTRATO';

  _Cds.Data := GetDataPacket(sSQL);

  Result := not(_Cds.IsEmpty);
end;
// Felipe A. Santos SOL 218909/16724 PPM 588170 - fim

function TCtrlContratos.ListAreaGestora(IdContrato : Double; sDisponiveis: String): OleVariant;
var
  sSQL : String;
begin
  sSQL := 'SELECT C.CODCENTROCUSTO, C.NOME, C.CODEXTERNO,'+
           FloatToStr(IdContrato) +' AS IDCONTRATO,      '+
          '       C.IDEMPRESA                            '+
          '  FROM CM.CENTCUST C                          '+

          ' WHERE C.IDEMPRESA = 1                        '+
          '   AND C.ATIVO = ''S''                        '+
          '   AND C.STATUSGRUPOCDC = ''A''               ';

  if sDisponiveis = 'D' then
  begin
    sSQL := sSQL + 'AND NOT EXISTS (SELECT 1                                              '+
                   '          			  FROM CM.CONTRATO_AREAGESTORA CA                     '+
                   '				         WHERE CA.CODCENTROCUSTO = C.CODCENTROCUSTO           '+
                   '				           AND CA.IDEMPRESA = C.IDEMPRESA                     '+
                   '				           AND CA.IDCONTRATO = ' + floattostr(IdContrato) + ') '
  end
  else
  begin
    sSQL := sSQL + 'AND EXISTS (SELECT 1                                              '+
                   '         		  FROM CM.CONTRATO_AREAGESTORA CA                     '+
                   '				     WHERE CA.CODCENTROCUSTO = C.CODCENTROCUSTO           '+
                   '				       AND CA.IDEMPRESA = C.IDEMPRESA                     '+
                   '				       AND CA.IDCONTRATO = ' + floattostr(IdContrato) + ') ';
  end;

  sSQL := sSQL + ' ORDER BY C.NOME                              ';

  Result := GetDataPacket(sSQL);
end;

function TCtrlContratos.ListAreaTecnica(IdContrato : Double; sDisponiveis: String): OleVariant;
var
  sSQL : String;
begin
  sSQL := 'SELECT C.CODCENTROCUSTO, C.NOME, C.CODEXTERNO,'+
           FloatToStr(IdContrato) +' AS IDCONTRATO,      '+
          '       C.IDEMPRESA                            '+
          '  FROM CM.CENTCUST C                          '+

          ' WHERE C.IDEMPRESA = 1                        '+
          '   AND C.ATIVO = ''S''                        '+
          '   AND C.STATUSGRUPOCDC = ''A''               ';

  if sDisponiveis = 'D' then
  begin
    sSQL := sSQL + 'AND NOT EXISTS (SELECT 1                                              '+
                   '          			  FROM CM.CONTRATO_AREATECNICA CA                     '+
                   '				         WHERE CA.CODCENTROCUSTO = C.CODCENTROCUSTO           '+
                   '				           AND CA.IDEMPRESA = C.IDEMPRESA                     '+
                   '				           AND CA.IDCONTRATO = ' + floattostr(IdContrato) + ') '
  end
  else
  begin
    sSQL := sSQL + 'AND EXISTS (SELECT 1                                              '+
                   '         		  FROM CM.CONTRATO_AREATECNICA CA                     '+
                   '				     WHERE CA.CODCENTROCUSTO = C.CODCENTROCUSTO           '+
                   '				       AND CA.IDEMPRESA = C.IDEMPRESA                     '+
                   '				       AND CA.IDCONTRATO = ' + floattostr(IdContrato) + ') ';
  end;

  sSQL := sSQL + ' ORDER BY C.NOME                              ';

  Result := GetDataPacket(sSQL);
end;

procedure TCtrlContratos.SetDbContratoAreaGestora(  const Value: TDbContratoAreaGestora);
begin
  FDbContratoAreaGestora := Value;
end;

procedure TCtrlContratos.SetCdsAreaGestora(const Value: TCMClientDataSet);
begin
  FCdsAreaGestora := Value;
end;

//Everson Cunha - SIG50897 - Início
function TCtrlContratos.ValorBaseContratoVariavel(IdContrato: string): OleVariant;
var
  _cds : TCMClientDataSet;
begin
  _cds := TCMClientDataSet.Create(Nil);

  _cds.Data:= GetDataPacket('SELECT avg(vlr) vlr FROM (     ' +
                            'SELECT sum(m.VALORMEDICAO) vlr ' +
                            '  FROM cm.MEDICAO m            ' +
                            '  JOIN cm.PARCELAMEDICAO pm ON pm.IDMEDICAO = m.IDMEDICAO                          ' +
                            ' WHERE m.IDCONTRATO = ' + QuotedStr(IdContrato) +
                            '   AND trunc(pm.DATAPREVISTAVENC) >= last_day(ADD_months(trunc(sysdate), -12)) + 1 ' +
                            '   AND trunc(pm.DATAPREVISTAVENC) <= last_day(trunc(sysdate))                      ' +
                            ' GROUP BY to_char(pm.DATAPREVISTAVENC, ''mm/yyyy''))                               ' );

  result := _cds.fieldbyname('vlr').asfloat;

  FreeAndNil(_cds);
end;
//Everson Cunha - SIG50897 - Fim

procedure TCtrlContratos.SetCdsNegociacao(const Value: TCMClientDataSet);
begin
  FCdsNegociacao := Value;
end;

procedure TCtrlContratos.SetDbNegociacao(const Value: TDbNegociacao);
begin
  FDbNegociacao := Value;
end;

function TCtrlContratos.ListNegociacao(IdContrato: Double): OleVariant;
var
  sSQL : String;
begin
  sSQL := 'SELECT CN.*, ' +
          '       DECODE(CN.TIPO, ''A'', ''Aditamento'', ''C'', ''Contratação'', ' +
          '              ''R'', ''Renovação'') DESC_TIPO, ' +
          '       DECODE(CN.NEGOCIACAO, ''V'', ''Redução de Valor'', ' +
          '              ''P'', ''Redução de Percentual de Reajuste'', ' +
          '              ''I'', ''Isenção de Reajuste'') DESC_NEGOCIACAO, ' +
          '       P_RESP.NOME NOME_RESP ' +
          '  FROM CM.CONTRATO_NEGOCIACAO CN ' +
          '  LEFT JOIN CM.PESSOA P_RESP ON P_RESP.IDPESSOA = CN.IDRESPONSAVEL ';

  if IdContrato <> 0 then
    sSQL := sSQL + ' WHERE CN.IDCONTRATO = ' + FloatToStr(IdContrato);

  sSQL := sSQL + ' ORDER BY CN.IDCONTRATO, CN.DTINICIOVIGENCIA ';

  Result := GetDataPacket(sSQL);
end;

procedure TCtrlContratos.SetCdsAreaTecnica(const Value: TCMClientDataSet);
begin
  FCdsAreaTecnica := Value;
end;

procedure TCtrlContratos.SetDbContratoAreaTecnica(const Value: TDbContratoAreaTecnica);
begin
  FDbContratoAreaTecnica := Value;
end;

// Paulo Nobre -  WO13254 - Inicio
// Paulo Nobre -  WO15750 - Inicio
function TCtrlContratos._ListaOrigemSaldo(IdContrato: Integer): OleVariant;
var sSQL : string;
begin
  // Paulo Nobre - WO31928 - Inicio
  sSQL := 'SELECT CAST(NOME || '' - '' || DATAASSINATURA AS VARCHAR2(30)) AS NOME,               ' + #13#10 +
  {CAST(SUBSTR(CASE                                                               ' + #13#10 +
		      '                WHEN IDADITAMENTO = 0 THEN (NOME || '' - '' || DATAASSINATURA)      ' + #13#10 +
          '                ELSE                                                                  ' + #13#10 +
          '                  CASE                                                                ' + #13#10 +
          '                 	 WHEN INSTR(NOME, ''Outros'') < 0 THEN (REGEXP_REPLACE(CODADITAMENTO, ''[^0-9]'', '''') || ''º '' || NOME || '' - '' || DATAASSINATURA)  ' + #13#10 +
          '                	   ELSE (NOME || '' - '' || DATAASSINATURA)                        ' + #13#10 +
         	'                  END 		                                                          ' + #13#10 +
	        '              END, 1, 30) AS VARCHAR2(30)) AS NOME,                                  ' + #13#10 +   // Paulo Nobre - TAS000000006791  }

  // Paulo Nobre - WO31928 - Fim

          '       DATAASSINATURA,                                                                ' + #13#10 +
          '       IDCONTRATO,                                                                    ' + #13#10 +
          '       IDADITAMENTO,                                                                  ' + #13#10 +
          '       FLGSALDOTRANSFERIDO,                                                           ' + #13#10 +
          '       FLGREINICIODASPARCELAS,                                                        ' + #13#10 +
          '       FLG_TP_VLR_ORCADO_APROVADO,                                                    ' + #13#10 +
          '       FLGTIPO                                                                        ' + #13#10 +
          'FROM (SELECT *                                                                        ' + #13#10 +
  	       '      FROM (SELECT ''Contrato'' AS NOME,                                              ' + #13#10 +
          '                   CO.IDCONTRATO AS IDCONTRATO,                                       ' + #13#10 +
          '                   0 AS IDADITAMENTO,                                                 ' + #13#10 +
          '                   TO_CHAR(CO.DATAASSINATURA,''DD/MM/YYYY'') AS DATAASSINATURA,       ' + #13#10 +
          '                   CO.FLGSALDOTRANSFERIDO,                                            ' + #13#10 +
          '                   ''S'' AS FLGREINICIODASPARCELAS,                                   ' + #13#10 +
          '                   CO.FLG_TP_VLR_ORCADO_APROVADO,                                     ' + #13#10 +
          '                   NULL AS FLGTIPO,                                                   ' + #13#10 +
		    '                   NULL AS CODADITAMENTO                                              ' + #13#10 +
          '            FROM CM.CONTRATOCONTR CO                                                  ' + #13#10 +
          '            WHERE IDCONTRATO = ' + FloatToStr(IdContrato)                               + #13#10 +
          '                                                                                      ' + #13#10 +
          '       	  UNION                                                                     ' + #13#10 +
          // Paulo Nobre - WO28914 - Inicio
          '                                                                                      ' + #13#10 +
          '            SELECT CASE                                                               ' + #13#10 +
          '                     WHEN A.FLGTIPO = ''A'' THEN ''Aditamento''                       ' + #13#10 +
          '                     WHEN A.FLGTIPO = ''C'' THEN ''Outros''                           ' + #13#10 +
          '                     WHEN A.FLGTIPO = ''R'' THEN ''Regularização''                    ' + #13#10 +
          '                     ELSE ''Não Informado''                                           ' + #13#10 +
          '                   END AS NOME,                                                       ' + #13#10 +
          '                   A.IDCONTRATO AS IDCONTRATO,                                        ' + #13#10 +
          '                   A.IDADITAMENTO AS IDADITAMENTO,                                    ' + #13#10 +
          '                   TO_CHAR(A.DATAASSADITAMENTO,''DD/MM/YYYY'') AS DATAASSINATURA,     ' + #13#10 +
          '                   A.FLGSALDOTRANSFERIDO,                                             ' + #13#10 +
          '                   A.FLGREINICIODASPARCELAS,                                          ' + #13#10 +
          // Paulo Nobre - WO37036 - Inicio
          '                   (SELECT C.FLG_TP_VLR_ORCADO_APROVADO FROM CONTRATOCONTR C WHERE C.IDCONTRATO = A.IDCONTRATO) AS FLG_TP_VLR_ORCADO_APROVADO, ' + #13#10 +
          // Paulo Nobre - WO37036 - Fim
          '                   A.FLGTIPO,                                                         ' + #13#10 +
		    '                   A.CODADITAMENTO                                                    ' + #13#10 +
          '      	     FROM CM.ADITAMENTO A                                                      ' + #13#10 +
          '            WHERE IDCONTRATO = ' + FloatToStr(IdContrato)                               + #13#10 +
          '                                                                                      ' + #13#10 +
          '	          )                                                                          ' + #13#10 +
          '                                                                                      ' + #13#10 +
{
          '      	           AND A.FLGTIPO = ''A''                                               ' + #13#10 +
 //         '      	           AND A.VL_ADITAMENTO > 0                                             ' + #13#10 +   // Paulo Nobre - WO22494
//          '                  AND A.IDADITAMENTO IN (SELECT DISTINCT IDADITAMENTO FROM CTRLPARCELAMEDICAO WHERE IDCONTRATO = ' + FloatToStr(IdContrato) + ')' + #13#10 +
          '                                                                                      ' + #13#10 +
          '      	     UNION                                                                     ' + #13#10 +
          '                                                                                      ' + #13#10 +
          '            SELECT ''Outros'' AS NOME,                          ' + #13#10 +
          '                   A.IDCONTRATO AS IDCONTRATO,                                        ' + #13#10 +
          '                   A.IDADITAMENTO AS IDADITAMENTO,                                    ' + #13#10 +
          '                   TO_CHAR(A.DATAASSADITAMENTO,''DD/MM/YYYY'') AS DATAASSINATURA,     ' + #13#10 +
          '                   A.FLGSALDOTRANSFERIDO,                                             ' + #13#10 +
          '                   A.FLGREINICIODASPARCELAS,                                          ' + #13#10 +
          '                   NULL AS FLG_TP_VLR_ORCADO_APROVADO,                                ' + #13#10 +
          '                   A.FLGTIPO,                                                         ' + #13#10 +
			 '                   A.CODADITAMENTO                                                    ' + #13#10 +
          '      	     FROM CM.ADITAMENTO A                                                      ' + #13#10 +
          '            WHERE IDCONTRATO = ' + FloatToStr(IdContrato)                               + #13#10 +
          '      	           AND A.FLGTIPO = ''C''                                               ' + #13#10 +
//          '      	           AND A.VL_ADITAMENTO > 0                                             ' + #13#10 +       // Paulo Nobre - WO22494
//          '                  AND A.IDADITAMENTO IN (SELECT DISTINCT IDADITAMENTO FROM CTRLPARCELAMEDICAO WHERE IDCONTRATO = ' + FloatToStr(IdContrato) + ')' + #13#10 +

          // Paulo Nobre - WO31928 - Inicio

          '       	   UNION                                                                    ' + #13#10 +
          '                                                                                      ' + #13#10 +
          '            SELECT ''Regularização'' AS NOME,                                         ' + #13#10 +
          '                   A.IDCONTRATO AS IDCONTRATO,                                        ' + #13#10 +
          '                   A.IDADITAMENTO AS IDADITAMENTO,                                    ' + #13#10 +
          '                   TO_CHAR(A.DATAASSADITAMENTO,''DD/MM/YYYY'') AS DATAASSINATURA,     ' + #13#10 +
          '                   A.FLGSALDOTRANSFERIDO,                                             ' + #13#10 +
          '                   A.FLGREINICIODASPARCELAS,                                          ' + #13#10 +
          '                   NULL AS FLG_TP_VLR_ORCADO_APROVADO,                                ' + #13#10 +
          '                   A.FLGTIPO,                                                         ' + #13#10 +
  	       '                   A.CODADITAMENTO                                                    ' + #13#10 +
          '      	     FROM CM.ADITAMENTO A                                                      ' + #13#10 +
          '            WHERE IDCONTRATO = ' + FloatToStr(IdContrato)                               + #13#10 +
          '      	           AND A.FLGTIPO = ''R''                                               ' + #13#10 +

          // Paulo Nobre - WO31928 - Fim
}
//          '      ORDER BY 3 ASC                                                                  ' + #13#10 +
          '-- Garante que os Aditamentos tenham parcelas geradas                                ' + #13#10 +
          'WHERE NVL(IDADITAMENTO,0) IN (SELECT NVL(CP.IDADITAMENTO,0)                          ' + #13#10 +
          '                              FROM CTRLPARCELAMEDICAO CP                             ' + #13#10 +
          '                              WHERE CP.IDCONTRATO = IDCONTRATO                       ' + #13#10 +
          '                                    AND CP.IDADITAMENTO = IDADITAMENTO)              ' + #13#10 +
          'ORDER BY 3 DESC                                                                      ' + #13#10 +
          // Paulo Nobre - WO28914 - Fim
          '                                                                                     ' + #13#10 +
          ') ';

  Result := GetDataPacket(sSQL);
end;

// Paulo Nobre -  WO15750 - Fim
// Paulo Nobre -  WO13254 - Fim

// Paulo Nobre - WO20776 - Inicio
// Paulo Nobre - WO19761 - Inicio
function TCtrlContratos._BuscaUltimoSaldoContratoOuAditamento(IdContrato: Integer): OleVariant;
var sSQL : string;
begin
  sSQL := 'SELECT TIPO,                                                                                            ' + #13#10 +
          '       IDCONTRATO,                                                                                      ' + #13#10 +
	       '       IDADITAMENTO,                                                                                    ' + #13#10 +
          '	      VALORBASECONTRATO,                                                                               ' + #13#10 +
          '	      TOTALMEDICAO,                                                                                    ' + #13#10 +
          '	      SALDO_A_PAGAR,                                                                                   ' + #13#10 +
          '	      FLG_TP_VLR_ORCADO_APROVADO                                                                       ' + #13#10 +
          'FROM (                                                                                                  ' + #13#10 +
          '	     SELECT ''C'' AS TIPO,   	-- Contrato                                                              ' + #13#10 +
          '    		  	  IDCONTRATO,                                                                                ' + #13#10 +
          '			        IDADITAMENTO,                                                                              ' + #13#10 +
          '		        	  VALORBASECONTRATO,                                                                         ' + #13#10 +
          '			        NVL(TOTALMEDICAO,0) AS TOTALMEDICAO,                                                       ' + #13#10 +
          '			        (VALORBASECONTRATO - NVL(TOTALMEDICAO,0)) AS SALDO_A_PAGAR,                                ' + #13#10 +
          '			        FLG_TP_VLR_ORCADO_APROVADO                                                                 ' + #13#10 +
          '	     FROM (                                                                                            ' + #13#10 +
          '		         SELECT CO.IDCONTRATO,                                                                       ' + #13#10 +
          '			              0 IDADITAMENTO,                                                                      ' + #13#10 +
          '			 	            DECODE(CO.FLGTIPOVALORBASE, ''F'', CO.VALORBASECONTRATO, CO.VALOR_ORCADO) VALORBASECONTRATO, ' + #13#10 +
          '			 	            (SELECT SUM(MI.VALORMEDICAO)                                                         ' + #13#10 +
          '				             FROM CM.MEDICAO MI                                                                  ' + #13#10 +
          '				             JOIN CM.CTRLPARCELAMEDICAO CP ON CP.IDMEDICAO = MI.IDMEDICAO                        ' + #13#10 +
          '			   	           WHERE MI.IDCONTRATO = CO.IDCONTRATO                                                 ' + #13#10 +
          '					 	               AND NVL(CP.IDADITAMENTO, 0) = 0) AS TOTALMEDICAO,                             ' + #13#10 +
          '					 	        CO.FLG_TP_VLR_ORCADO_APROVADO                                                        ' + #13#10 +
          '		         FROM CM.CONTRATOCONTR CO                                                                    ' + #13#10 +
          '            WHERE CO.IDCONTRATO = ' + IntToStr(IdContrato)                                                + #13#10 +
//          '			  	         AND NVL(CO.FLGSALDOTRANSFERIDO, ''N'') = ''N''                                       ' + #13#10 +    // Paulo Nobre - WO22434
//          '			  	         AND NVL(CO.FLGSALDOTRANSFERIDO, ''N'') = ''N''                                       ' + #13#10 +    // Paulo Nobre - WO22494
          ' 		      )                                                                                            ' + #13#10 +
          '	     UNION                                                                                             ' + #13#10 +
          '	     SELECT ''A'' AS TIPO,		-- Aditamento                                                            ' + #13#10 +
          '		 	        IDCONTRATO,                                                                                ' + #13#10 +
          '			        IDADITAMENTO,                                                                              ' + #13#10 +
          '			        VALORBASEADITAMENTO,                                                                       ' + #13#10 +
          '			        NVL(TOTALMEDICAO,0) AS TOTALMEDICAO,                                                       ' + #13#10 +
          '			        (VALORBASEADITAMENTO - NVL(TOTALMEDICAO,0)) AS SALDO_A_PAGAR,                              ' + #13#10 +
          '			        NULL AS FLG_TP_VLR_ORCADO_APROVADO                                                         ' + #13#10 +
          '	     FROM (                                                                                            ' + #13#10 +
          '			       SELECT A.IDCONTRATO,                                                                        ' + #13#10 +
          '					          A.IDADITAMENTO,                                                                      ' + #13#10 +
          '					          A.VL_ADITAMENTO AS VALORBASEADITAMENTO,                                              ' + #13#10 +
          '					          (SELECT SUM(MI.VALORMEDICAO)                                                         ' + #13#10 +
          '					           FROM CM.MEDICAO MI                                                                  ' + #13#10 +
          '					           JOIN CM.CTRLPARCELAMEDICAO CP ON CP.IDMEDICAO = MI.IDMEDICAO                        ' + #13#10 +
          '					           WHERE MI.IDCONTRATO = A.IDCONTRATO                                                  ' + #13#10 +
          '						               AND NVL(CP.IDADITAMENTO, 0) = (SELECT MAX(A1.IDADITAMENTO) AS IDADITAMENTO    ' + #13#10 +
          '											                         	  	      FROM ADITAMENTO A1                             ' + #13#10 +
          '													                                WHERE A1.IDCONTRATO = A.IDCONTRATO             ' + #13#10 +
          '														                                    AND A1.VL_ADITAMENTO > 0                 ' + #13#10 +
          '															                                  AND A1.FLGREINICIODASPARCELAS = ''S'') ) AS TOTALMEDICAO ' + #13#10 +
          '			       FROM CM.ADITAMENTO A                                                                        ' + #13#10 +
          '            WHERE A.IDCONTRATO = ' + IntToStr(IdContrato)                                                 + #13#10 +
          '				           AND A.IDADITAMENTO = (SELECT MAX(A2.IDADITAMENTO) AS IDADITAMENTO                     ' + #13#10 +
          '									                     	 FROM ADITAMENTO A2                                              ' + #13#10 +
          '										                     WHERE A2.IDCONTRATO = A.IDCONTRATO                              ' + #13#10 +
          '											                         AND A2.VL_ADITAMENTO > 0                                  ' + #13#10 +
          '											                         AND A2.FLGREINICIODASPARCELAS = ''S'')                    ' + #13#10 +
          '           )                                                                                            ' + #13#10 +
          '     )                                                                                                  ' + #13#10 +
          '                                                                                                        ' + #13#10 +
          'WHERE IDADITAMENTO = NVL((SELECT MAX(A3.IDADITAMENTO) AS IDADITAMENTO                                   ' + #13#10 +
          '		            		       FROM ADITAMENTO A3                                                            ' + #13#10 +
          '                          WHERE A3.IDCONTRATO = ' + IntToStr(IdContrato)                                  + #13#10 +
          '						                     AND A3.VL_ADITAMENTO > 0                                                ' + #13#10 +
          //'						     	               AND A3.FLGREINICIODASPARCELAS = ''S''), 0);                             ' + #13#10;  //MIGRACAO-ORACLE LEANDRO
          '						     	               AND A3.FLGREINICIODASPARCELAS = ''S''), 0)                              ' + #13#10;  //MIGRACAO-ORACLE LEANDRO

   Result := GetDataPacket(sSQL);
end;
// Paulo Nobre - WO19761 - Fim
// Paulo Nobre - WO20776 - Fim

// Paulo Nobre - WO37036 - Inicio

// Paulo Nobre -  WO15750 - Inicio
{function TCtrlContratos._VerificaSeAditamentoTemParcelamento(iIdContrato, iIdAditamento: Integer): Boolean;
var sSQL : string;
    cdsTemp : TCMClientDataSet;
begin
  try
    Result := False;
    cdsTemp := TCMClientDataSet.Create(nil);

    sSQL := 'SELECT DISTINCT IDADITAMENTO                         ' + #13#10 +      // Paulo Nobre -  WO20776
    'FROM CTRLPARCELAMEDICAO                                      ' + #13#10 +
    'WHERE IDCONTRATO = ' + IntToStr(iIdContrato)                   + #13#10 +
    '      AND NVL(IDADITAMENTO,0) = ' + IntToStr(iIdAditamento)           + #13#10;

    cdstemp.Data := GetDataPacket(sSQL);
  finally
     Result := not cdstemp.isEmpty;                                                // Paulo Nobre -  WO20776
     FreeAndNil(cdsTemp);
  end;
end;    }

// Paulo Nobre - WO37036 - Fim

function TCtrlContratos._ListaSaldoSinteticoOrigem(IdContrato, IdAditamento: Integer): OleVariant;
var  sSQL : string;
begin
  sSQL := 'SELECT                                                                        ' + #13#10 +
          '       -- VALOR TOTAL DO CONTRATO                                             ' + #13#10;
  // Paulo Nobre - WO28914 - Inicio
  If IdAditamento = 0 Then
  Begin
    sSQL := sSQL + '       CASE                                                          ' + #13#10 +
    // Paulo Nobre - WO37036 - Inicio
    '         WHEN CON.FLG_TP_VLR_ORCADO_APROVADO = ''N'' THEN 0.00 -- Não se Aplica ' + #13#10 +  // Se o saldo orçado não se aplica
    // Paulo Nobre - WO37036 - Fim
    '         ELSE NVL(VL_BASE_CONTRATO.VALORBASECONTRATO,0)                               ' + #13#10 +
    '       END AS VL_TOTAL_CONTRATO,                                                      ' + #13#10;
  End
  else
  begin
    sSQL := sSQL + '       NVL(VL_BASE_CONTRATO.VALORBASECONTRATO,0) AS VL_TOTAL_CONTRATO, ' + #13#10;
  end;
  sSQL := sSQL + '       -- VALORES PAGOS (VALORES MEDIDOS)                                ' + #13#10 +
    '       NVL(MED.VALORMEDICAO,0) VL_PAGO_CONTRATO,                                      ' + #13#10 +
    '       -- SALDO DO CONTRATO A PAGAR (VALOR TOTAL - VALORES PAGOS)                     ' + #13#10 +

    // Paulo Nobre - WO37036 - Inicio
    '       CASE                                                                           ' + #13#10 +
    '          WHEN CON.FLG_TP_VLR_ORCADO_APROVADO = ''N'' THEN 0.00  -- Não se Aplica     ' + #13#10 +
    '          ELSE                                                                        ' + #13#10 +
    '            CASE                                                                      ' + #13#10 +
    '               WHEN VL_BASE_CONTRATO.VALORBASECONTRATO < 0 THEN (VL_BASE_CONTRATO.VALORBASECONTRATO + NVL(MED.VALORMEDICAO,0)) ' + #13#10 +
    '               ELSE (VL_BASE_CONTRATO.VALORBASECONTRATO - NVL(MED.VALORMEDICAO,0))                                             ' + #13#10 +
    '            END                                                                       ' + #13#10 +
    '       END AS SALDO_A_PAGAR,                                                          ' + #13#10 +
    // Paulo Nobre - WO37036 - Fim

 // Paulo Nobre - WO28914 - Fim
    '       CON.IDCONTRATO,                                                                ' + #13#10 +
    '       CON.FLGSALDOTRANSFERIDO,                                                       ' + #13#10 +  // Paulo Nobre - WO31928
    '       TOTPAGO.TOTAL_PAGO_CONTRATO                                                    ' + #13#10 +
    'FROM (SELECT IDCONTRATO, FLGSALDOTRANSFERIDO, FLG_TP_VLR_ORCADO_APROVADO              ' + #13#10 +
    '       FROM CONTRATOCONTR                                                             ' + #13#10 +
    '       WHERE IDCONTRATO = ' + IntToStr(IdContrato)                                      + #13#10 +
    '      ) CON                                                                           ' + #13#10;

  // Paulo Nobre - WO28914 - Inicio
  If IdAditamento = 0 Then
  Begin
    sSQL := sSQL + '-- VALOR TOTAL DO CONTRATO                                             ' + #13#10 +
   {       'JOIN (SELECT CO.IDCONTRATO, SUM(DECODE(CO.FLGTIPOVALORBASE, ''F'', CO.VALORBASECONTRATO, CO.VALOR_ORCADO)) VALORBASECONTRATO ' + #13#10 +
          '      FROM CM.CONTRATOCONTR CO                                                  ' + #13#10 +
          '      GROUP BY CO.IDCONTRATO) VL_BASE_CONTRATO ON VL_BASE_CONTRATO.IDCONTRATO = CON.IDCONTRATO ' + #13#10;
   }
          'JOIN (SELECT CO.IDCONTRATO, DECODE(CO.FLGTIPOVALORBASE, ''F'', CO.VALORBASECONTRATO, CO.VALOR_ORCADO) VALORBASECONTRATO ' + #13#10 +
          '      FROM CM.CONTRATOCONTR CO) VL_BASE_CONTRATO ON VL_BASE_CONTRATO.IDCONTRATO = CON.IDCONTRATO ' + #13#10;
  end
  Else
  begin
    sSQL := sSQL + '-- VALOR TOTAL DOS ADITAMENTOS                                         ' + #13#10 +
    {      'JOIN (SELECT A.IDCONTRATO, A.IDADITAMENTO, SUM(NVL(A.VL_ADITAMENTO, 0)) VALORBASECONTRATO ' + #13#10 +
          '      FROM CM.ADITAMENTO A                                                      ' + #13#10 +
          '      GROUP BY A.IDCONTRATO, A.IDADITAMENTO) VL_BASE_CONTRATO ON VL_BASE_CONTRATO.IDCONTRATO = CON.IDCONTRATO  ' + #13#10 +
          '                                                          AND VL_BASE_CONTRATO.IDADITAMENTO = ' + IntToStr(IdAditamento) + #13#10;
    }
          'JOIN (SELECT A.IDCONTRATO, A.IDADITAMENTO, NVL(A.VL_ADITAMENTO, 0) VALORBASECONTRATO ' + #13#10 +
          '      FROM CM.ADITAMENTO A) VL_BASE_CONTRATO ON VL_BASE_CONTRATO.IDCONTRATO = CON.IDCONTRATO  ' + #13#10 +
          '                                                          AND VL_BASE_CONTRATO.IDADITAMENTO = ' + IntToStr(IdAditamento) + #13#10;
  end;
  // Paulo Nobre - WO28914 - Fim

  sSQL := sSQL + '-- MEDICAO (VALORES PAGOS)                                                       ' + #13#10 +
         'LEFT JOIN (SELECT MI.IDCONTRATO, NVL(CP.IDADITAMENTO,0) AS IDADITAMENTO, SUM(MI.VALORMEDICAO) VALORMEDICAO  ' + #13#10 +
         '           FROM CM.MEDICAO MI                                                        ' + #13#10 +
         '           LEFT JOIN CTRLPARCELAMEDICAO CP ON CP.IDMEDICAO = MI.IDMEDICAO            ' + #13#10 +
         '                                           AND CP.IDMEDICAO IS NOT NULL              ' + #13#10 +
         '                                           AND CP.FLGPARCELAMEDIDA = 1               ' + #13#10 +
         '           GROUP BY MI.IDCONTRATO, NVL(CP.IDADITAMENTO,0)) MED ON MED.IDCONTRATO = CON.IDCONTRATO ' + #13#10 +   // Paulo Nobre - WO28914
         '                                                                  AND NVL(MED.IDADITAMENTO,0) = ' + IntToStr(IdAditamento) + #13#10;
  // Paulo Nobre - WO31928 - Inicio
  sSQL := sSQL + '-- TOTAL MEDIDO (PAGO) DO CONTRATO                                           ' + #13#10 +
         'LEFT JOIN (SELECT MI.IDCONTRATO, SUM(MI.VALORMEDICAO) TOTAL_PAGO_CONTRATO            ' + #13#10 +
         '           FROM CM.MEDICAO MI                                                        ' + #13#10 +
         '           LEFT JOIN CTRLPARCELAMEDICAO CP ON CP.IDMEDICAO = MI.IDMEDICAO AND CP.IDMEDICAO IS NOT NULL  AND CP.FLGPARCELAMEDIDA = 1 ' + #13#10 +
         '           GROUP BY MI.IDCONTRATO) TOTPAGO ON TOTPAGO.IDCONTRATO = CON.IDCONTRATO    ' + #13#10 +
  // Paulo Nobre - WO31928 - Fim

         'WHERE CON.IDCONTRATO = ' + IntToStr(IdContrato) + #13#10;

  Result := GetDataPacket(sSQL);
end;

Function TCtrlContratos._ListaMovimentoAnaliticoOrigem(IdContrato, IdAditamento: Integer): OleVariant;
var sSQL : string;
begin
  sSQL := 'SELECT M.IDCONTRATO, M.IDMEDICAO, PR.CODDOCUMENTO, M.NODOCUMENTO, NVL(CP.IDADITAMENTO,0) AS IDADITAMENTO,    ' + #13#10 +
  '      PR.DATAVENCPARCELA, M.VALORMEDICAO,                                                                            ' + #13#10 +
  '      CAST(SUBSTR(M.OBS, 0, 254) AS VARCHAR2(254)) AS OBS,                                                           ' + #13#10 +
  '      CAST(SUBSTR(M.HISTORICOCOMPL, 0, 254) AS VARCHAR2(254)) AS HISTORICOCOMPL                                      ' + #13#10 +  // Paulo Nobre - TAS000000006791
  'FROM CM.MEDICAO M                                                                                                    ' + #13#10 +  // Paulo Nobre - TAS000000006791
  'JOIN CM.PARCELAREALCONTR PR ON PR.IDMEDICAO = M.IDMEDICAO                                                            ' + #13#10 +
  'LEFT JOIN CM.CTRLPARCELAMEDICAO CP ON CP.IDMEDICAO = PR.IDMEDICAO                                                    ' + #13#10 +
  'WHERE M.IDCONTRATO = ' + IntToStr(IdContrato)                                                                          + #13#10 +
  '      AND NVL(CP.IDADITAMENTO,0) = ' + IntToStr(IdAditamento)                                                          + #13#10 +
  'ORDER BY PR.DATAVENCPARCELA DESC                                                                                     ' + #13#10;

  Result := GetDataPacket(sSQL);
end;

// Paulo Nobre - WO31928 - Inicio

{procedure TCtrlContratos._AtualizaFlgSaldoTransf(iIdContrato, iIdAditamento : Integer; bSaldoTransf : Boolean; dValorManual : double);
var sFlgSaldoTransf : String;
    _qryAux : Twwquery;
begin
  _qryAux := Twwquery.Create(nil);
  _qryAux.DatabaseName := 'BaseDados';

  sFlgSaldoTransf := 'N';
  if bSaldoTransf then               // Marcado o flag de importar o saldo
    sFlgSaldoTransf := 'S';

  if iIdAditamento = 0 then
  begin
    _qryAux.Close;
    _qryAux.Sql.Clear;
    _qryAux.Sql.Add('UPDATE CM.CONTRATOCONTR SET FLGSALDOTRANSFERIDO = ' + QuotedStr(sFlgSaldoTransf) );
    _qryAux.Sql.Add('WHERE IDCONTRATO = ' + inttostr(iIdContrato) );
    _qryAux.EXECSQL;
  end
  else
  begin
    _qryAux.Close;
    _qryAux.Sql.Clear;

    // Foi lançado um aditamento manual sem a importação do saldo anterior
    if (dValorManual <> 0) and (sFlgSaldoTransf = 'N') Then
      sFlgSaldoTransf := 'I';  // Indisponível

    _qryAux.Sql.Add('UPDATE CM.ADITAMENTO SET FLGSALDOTRANSFERIDO = ' + QuotedStr(sFlgSaldoTransf) );
    _qryAux.Sql.Add('WHERE IDCONTRATO = ' + inttostr(iIdContrato) );
    _qryAux.Sql.Add('      AND IDADITAMENTO = ' + inttostr(iIdAditamento) );
    _qryAux.EXECSQL;
  end;

  _qryAux.Free;
end;
// Paulo Nobre -  WO15750 - Fim
}

// Paulo Nobre - WO31928 - Fim

{
// Paulo Nobre -  WO15653 - Inicio
{function TCtrlContratos._BuscaSaldoContrato(IdContrato: Integer): Double;
var sSQL : string;
begin
  sSQL := 'SELECT *                                                                                        ' + #13#10 +
  'FROM (                                                                                                  ' + #13#10 +
  '      SELECT CON.IDCONTRATO,                                                                            ' + #13#10 +
  '              -- SALDO DO CONTRATO/ADITAMENTO A PAGAR (VALOR TOTAL - VALORES PAGOS)                     ' + #13#10 +
  '             (TOTALVLBASE.VALORBASECONTRATO - NVL(TOTALMED.VALORMEDICAO,0)) AS SALDO_A_PAGAR            ' + #13#10 +
  '      FROM (                                                                                            ' + #13#10 +
  '            SELECT IDCONTRATO, FLGSALDOTRANSFERIDO                                                      ' + #13#10 +
  '            FROM CONTRATOCONTR                                                                          ' + #13#10 +
  '            WHERE IDCONTRATO = ' + IntToStr(IdContrato)                                                   + #13#10 +
  '           ) CON                                                                                        ' + #13#10 +

  '           -- TOTAL DO CONTRATO/ADITAMENTO                                                              ' + #13#10 +
  '            JOIN (                                                                                      ' + #13#10 +
  '                  SELECT IDCONTRATO, IDADITAMENTO, FLGSALDOTRANSFERIDO, VALORBASECONTRATO               ' + #13#10 +
  '                  FROM (                                                                                ' + #13#10 +
  '                        SELECT CO.IDCONTRATO, 0 AS IDADITAMENTO, CO.FLGSALDOTRANSFERIDO, SUM(DECODE(CO.FLGTIPOVALORBASE, ''F'', CO.VALORBASECONTRATO, CO.VALOR_ORCADO)) VALORBASECONTRATO ' + #13#10 +
  '                        FROM CM.CONTRATOCONTR CO                                                        ' + #13#10 +
  '                        WHERE CO.IDCONTRATO = ' + IntToStr(IdContrato)                                    + #13#10 +
  '                              AND CO.FLGSALDOTRANSFERIDO = ''N''                                        ' + #13#10 +
  '                        GROUP BY CO.IDCONTRATO, 0, CO.FLGSALDOTRANSFERIDO                               ' + #13#10 +
  '                       )                                                                                ' + #13#10 +
  '                 ) TOTALVLBASE ON TOTALVLBASE.IDCONTRATO = CON.IDCONTRATO                               ' + #13#10 +

  '            --  TOTAL DOS VALORES PAGOS (MEDICAO)                                                       ' + #13#10 +
  '            LEFT JOIN (                                                                                 ' + #13#10 +
  '                  SELECT TIPO, IDCONTRATO, IDADITAMENTO, VALORMEDICAO                                   ' + #13#10 +
  '                  FROM (                                                                                ' + #13#10 +
  '                        SELECT ''C'' TIPO, MI.IDCONTRATO, 0 AS IDADITAMENTO, SUM(MI.VALORMEDICAO) VALORMEDICAO ' + #13#10 +
  '                        FROM CM.MEDICAO MI                                                              ' + #13#10 +
  '                        JOIN CONTRATOCONTR CO ON CO.IDCONTRATO = MI.IDCONTRATO AND CO.FLGSALDOTRANSFERIDO = ''N''  ' + #13#10 +
  '                        LEFT JOIN CTRLPARCELAMEDICAO CP ON CP.IDMEDICAO = MI.IDMEDICAO                  ' + #13#10 +
  '                        WHERE MI.IDCONTRATO = ' + IntToStr(IdContrato)                                    + #13#10 +
  '                              AND CP.IDADITAMENTO IS NULL                                               ' + #13#10 +
  '                        GROUP BY MI.IDCONTRATO, 0                                                       ' + #13#10 +
  '                        UNION ALL                                                                       ' + #13#10 +
  '                        SELECT ''A'' TIPO, MI.IDCONTRATO, CP.IDADITAMENTO, SUM(MI.VALORMEDICAO) VALORMEDICAO ' + #13#10 +
  '                        FROM CM.MEDICAO MI                                                              ' + #13#10 +
  '                        JOIN CTRLPARCELAMEDICAO CP ON CP.IDMEDICAO = MI.IDMEDICAO                       ' + #13#10 +
  '                        WHERE MI.IDCONTRATO = ' + IntToStr(IdContrato)                                    + #13#10 +
  '                              AND CP.IDADITAMENTO = (SELECT MAX(IDADITAMENTO) AS IDADITAMENTO           ' + #13#10 +
  '                                                     FROM ADITAMENTO                                    ' + #13#10 +
  '										                                  WHERE IDCONTRATO = ' + IntToStr(IdContrato)          + #13#10 +
  '											                                      AND VL_ADITAMENTO > 0                        ' + #13#10 +
  '										                                        AND FLGSALDOTRANSFERIDO = ''N'')             ' + #13#10 +
  '                              AND CP.IDMEDICAO IS NOT NULL                                              ' + #13#10 +
  '                              AND CP.FLGPARCELAMEDIDA = 1                                               ' + #13#10 +
  '                        GROUP BY MI.IDCONTRATO, CP.IDADITAMENTO                                         ' + #13#10 +
  '                       )                                                                                ' + #13#10 +
  '                ) TOTALMED ON TOTALMED.IDCONTRATO = CON.IDCONTRATO                                      ' + #13#10 +

  '      WHERE CON.IDCONTRATO = ' + IntToStr(IdContrato)                                                     + #13#10 +
  '            AND (TOTALVLBASE.IDADITAMENTO = 0 AND NVL(TOTALMED.TIPO, ''C'') = ''C'') OR                 ' + #13#10 +
  '                (TOTALVLBASE.IDADITAMENTO <> 0 AND NVL(TOTALMED.TIPO, ''A'') = ''A'')                   ' + #13#10 +
  '      ORDER BY IDCONTRATO, IDADITAMENTO DESC                                                            ' + #13#10 +
  '   )                                                                                                    ' + #13#10 +
  '                                                                                                        ' + #13#10 +
  'WHERE ROWNUM = 1                                                                                        ' + #13#10;

   Result := GetDataPacket(sSQL);
end;}
// Paulo Nobre - WO20776 - Fim

end.


