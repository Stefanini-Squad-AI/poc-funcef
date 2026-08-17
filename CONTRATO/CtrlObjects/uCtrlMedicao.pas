{-------------------------------------------------------------------------------
------------------------- ALTERAÇÕES / IMPLEMENTAÇÕES --------------------------
--------------------------------------------------------------------------------
N.WO............: B_MIGRACAO_ORACLE_2025
Data............: 03/07/2025
Responsável.....: Paulo Nobre
Descrição.......: Ajustes ORACLE - Na função: ListMedicaoxRateio, foi retirado
                  o (+) e colocado LEFT no JOIN.
--------------------------------------------------------------------------------
N.WO............: WO15750
Data............: 10/12/2024
Responsável.....: Paulo Nobre
Descrição.......: .Implementado recurso no Cadastro de Medição, para a
                  identificação de qual documento estará na grid, se
                  "Contrato e/ou Aditamento".
                  .Foi incorporado a esta demanda o solicitado na WO15653:
                  Impossibilitar que as medições ultrapassem o valor de
                  "saldo a pagar" de cada contrato. Contudo, se a marcação de NÃO
                  SE APLICA estiver preenchida, no campo de vlr orçado/aprovado,
                  a referida regra não se aplicará, ou seja, a COFIN poderá
                  prosseguir com os pagamentos.
--------------------------------------------------------------------------------
N. Atender....: WO 8227
Dt Alteração..: 07/03/2024
Responsável...: Helen V Bianchi
Descrição.....: Correção da Tributação quando alterado as Dt Medição e Vencimento
--------------------------------------------------------------------------------
N. Atender....: WO 3524
Dt Alteração..: 25/10/2023
Responsável...: Cássio Florencio Rovaroto
Descrição.....: Alteração no formato de atribuição de valor de tributação,
                trocando arredondamento por "truncamento" na 2ª casa decimal.
--------------------------------------------------------------------------------
N. Atender....: WO 2795
Dt Alteração..: 14/09/2023
Responsável...: Cássio Florencio Rovaroto
Descrição.....: Correção no cálculo de impostos retidos.
--------------------------------------------------------------------------------
N. Atender....: WO 2824
Dt Alteração..: 08/09/2023
Responsável...: Cássio Florencio Rovaroto
Descrição.....: Retirada de função que calculava automaticamente impostos retidos.
--------------------------------------------------------------------------------
N. Solicitação: WO 2626
Dt Alteração..: 01/09/2023
Responsável...: Cássio Florencio Rovaroto
Descrição.....: Adequação do processo de lançamento de tributação,
                não permitindo o lançamento de outros alteradores.
--------------------------------------------------------------------------------
N. Atender....: WO 2528
Dt Alteração..: 28/08/2023
Responsável...: Andre Imakawa
Descrição.....: Ajuste para utilizar o CODTIPRECDES na busca da Contabilização
--------------------------------------------------------------------------------
N. Atender....: WO 2522
Dt Alteração..: 28/08/2023
Responsável...: Cássio Florencio Rovaroto
Descrição.....: Correção no lançaento de alteradores de tributação.
--------------------------------------------------------------------------------
N. SIG........: 135203
Dt Alteração..: 02/05/2023
Responsável...: Cássio Florencio Rovaroto
Descrição.....: Verificação de existência de serviços cadastrados para validação.
--------------------------------------------------------------------------------
N. SIG........: 133236
Dt Alteração..: 27/04/2023  
Responsável...: Cássio Florencio Rovaroto
Descrição.....: Inclusão do tratamento de tributação de notas fiscais de serviço.
--------------------------------------------------------------------------------
N. SIG........: 134176
Dt Alteração..: 29/03/2023
Responsável...: Cássio Rovaroto
Descrição.....: Correção no lançamento de medição, em casos de primeiro
                lançamento do contrato.
--------------------------------------------------------------------------------
N. SIG........: 96275
Dt Alteração..: 10/11/2021
Responsável...: Everson Cunha
Descrição.....: Criação do campo Mês/Ano Referência
--------------------------------------------------------------------------------
Rotina.............: AplicaIntegracao
N. SIG.............: 117685
Data da Alteração..: 29/07/2021 
Responsável........: Cássio Florencio Rovaroto
Descrição..........: Correção de lançamento de alteradores durante alteração de
                     lançamento.
--------------------------------------------------------------------------------
Rotina.............: ListMedicaoxRateio
N. SIG.............: 117136
Data da Alteração..: 24/06/2021
Responsável........: Ewerton Beltramini
Descrição..........: Correção de erro no retorno de uma consulta.
--------------------------------------------------------------------------------
Rotina.............: IncluiMedicao, ListMedicaoxRateio, AplicaIntegracao
N. SIG.............: 115595
Data da Alteração..: 20/05/2021
Responsável........: Edilaine
Descrição..........: Integração com FDO Digital para rateio de lançamentos
--------------------------------------------------------------------------------
Rotina..........: AplicaIntegracao, VerificaServicoMaoDeObra
N. SIG..........: 115585
Data ...........: 18/05/2021 
Responsável.....: Cássio Florencio Rovaroto
Descrição.......: Retira de gravação dos valores de tipo de serviço e processo 
//                judicial no lançamento da medição.
--------------------------------------------------------------------------------
Nº SIG......: 94320/95404
Data........: 11/12/2019
Responsável.: edilaine
Descrição...: Criação da Integração Orçamentária para sistema web - envio
-----------------------------------------------------------------------------
Rotina..........: AplicaIntegracao
N. SIG..........: 111898
Data ...........: 08/01/2021
Responsável.....: Edilaine
Descrição.......: Divergencia entre o rateio da mediçao x documento gerado
--------------------------------------------------------------------------------
Alteração ......: IFF, AplicaIntegracao
N. SIG..........: 111914
Data ...........: 17/12/2020
Responsável.....: Edilaine
Descrição.......: nao estava preenchendo array de multiplas contas passado para CtrlDocumento
--------------------------------------------------------------------------------
SIG.............: 82259
Data............: 13/03/2019
Responsável.....: Darivaldo Alencar
Descrição.......: Tabela DOCUMENTO gravando CODPORTPORMA com valor nulo
--------------------------------------------------------------------------------
SIG.............: 61347
Data............: 29/01/2018
Responsável.....: Peterson Victor
Descrição.......: Erro na gravação dos valores da medição
--------------------------------------------------------------------------------
//Rotina             : TRegRateioDocum, ListTipoServico, ListProcessos,
											 IncluiMedicao, ListMedicao, AplicaIntegracao,
//N. SIG..........   : 23656.58469
//Data da Alteração: : 17/11/2017
//Alteração Form:    : <Nome do fonte alterado>
//Responsável:       : Cássio Rovaroto
//Descrição.......   : <Descrição da alteração>
--------------------------------------------------------------------------------
N. Sol..........: 265181
PPM.............: 1166774
Data............: 18/11/2015
Responsável.....: Felipe A. Santos
Descrição.......: erro na integração com contas a pagar.
--------------------------------------------------------------------------------
N. Sol..........: 257896
PPM.............: 1014759
Data............: 27/08/2015
Responsável.....: Petri Nocentini
Descrição.......: Informação duplicada em rateio diferenciado na medição de
                  contrato
--------------------------------------------------------------------------------
N. Sol..........: 242313/17289
N. PPM..........: 828977
Data............: 19/06/2015
Responsável.....: Felipe A. Santos
Descrição.......: Criação da aba ANS.
--------------------------------------------------------------------------------
N. Sol..........: 257100, 257101
PPM.............: 852753, 852764
Data............: 03/07/2015
Responsável.....: Felipe A. Santos e Fernando Xavier
Descrição.......: erro de chave na estrutura CTRLPARCELAMEDICAO, erro no incremento
                  da parcela, erro de zera a parcela.
--------------------------------------------------------------------------------
N. Sol..........: 253522
PPM.............: 781892
Data............: 12/05/2015
Responsável.....: Petri Nocentini
Descrição.......: Erro ao alterar rateio
--------------------------------------------------------------------------------
N. Sol..........: 218909/16724 
N. PPM..........: 588170
Data............: 20/02/2015
Responsável.....: Felipe A. Santos
Descrição.......: Criação do alerta de contratos.
--------------------------------------------------------------------------------
N. Sol..........: 238708
PPM.............: 506114
Data............: 05/09/2014
Responsável.....: Thiago Melo
Descrição.......: Não está sendo possível realizar a medição do contrato, pois
                  está ocorrendo um erro de conversão.
--------------------------------------------------------------------------------
N. Sol..........: 238060
PPM.............: 496839
Data............: 27/08/2014
Responsável.....: Thiago Melo
Descrição.......: Problemas ao realizar a medição do contrato no rateio       
--------------------------------------------------------------------------------
N. Sol..........: 237146
PPM.............: 482149
Data............: 19/08/2014
Responsável.....: Thiago Melo
Descrição.......: A funcionalidade de medição não está realizando a verificação
                  da sub despesa por item 
--------------------------------------------------------------------------------
N. Sol..........: 227975.16197
PPM.............: 430656
Data............: 26/06/2014
Responsável.....: Thiago Melo
Descrição.......: Manter estados das contas ao realizar alteração no rateio
--------------------------------------------------------------------------------
N. Sol..........: 227975
N. Kintana......: 2061959
Data............: 06/06/2014
Responsável.....: Thiago Melo
Descrição.......: Ajustar a montagem da conta orçamentária para verificar saldo
--------------------------------------------------------------------------------
Data        : 30/07/2013
Autor       : Thiago Melo
SOL/KINTANA : 213041/2038992
Descrição   : Ao realizar a medição de um contrato os valores informados para a
              verificação do FDO estão incorretas
--------------------------------------------------------------------------------
Data        : 25/10/2012
Autor       : José Roberto Marque - JRM6
SOL/KINTANA : 189816/1793898
Descrição   : Gravação do documento no Contas a Pagar, alterada para criação dos
              alteradores automáticos de impostos (quando parametrizado no tipo
              de desembolso).
--------------------------------------------------------------------------------
Nº SOL......: 203613
Nº KINTANA..: 1967518
Data........: 25/03/2013
Responsável.: Fernando Xavier
Descrição...: correção no lançamento de Medições quando da necessidade de
              realizar um rateio diferenciado ao rateio definido no cadastro
--------------------------------------------------------------------------------
Nº SOL......: 200778
Nº KINTANA..: 1953121
Data........: 04/03/2013
Responsável.: Otacilio
Descrição...: Implementação para encontrar conta orçamentaria para o lançamento
              de FDO.
--------------------------------------------------------------------------------
Nº SOL......: 200540
Nº KINTANA..: 1932783
Data........: 08/02/2013
Responsável.: Fernando Xavier
Descrição...: Correção no processo de integração de forma que seja acertado o fato
              de o módulo contratos não esta levando em consideração a subdespesa
--------------------------------------------------------------------------------
Nº SOL......: 172384/9603
Nº KINTANA..: 1661662
Data........: 25/06/2012
Responsável.: MARCIO SANCHES SPINOSA - EDILAINE FERRARESI
Descrição...: Function para verificar se integra orçamento
--------------------------------------------------------------------------------
Sol_Kintana : 130441_732123
Responsável : Marilza Colpani
Data        : 29/04/2010
Descrição   : Correção do erro apresentado: constraint R_10667
--------------------------------------------------------------------------------
Analista : Daniel Simões
Pendência: 26185
Data     : 23/08/2007
Descrição: Adicionado mais um parâmetro (IdPrograma) no registro variável
           'TRegRateioDocum'.
--------------------------------------------------------------------------------
Analista : Marchetti
Pendência: 19477
Data     : 06/07/2005
Descrição: Substuição do campo IDCONTRATO por CODCONTRATOEMPR no histórico de
           lançamentos
--------------------------------------------------------------------------------
Analista : Rodolpho da Silva
Pendência: 17689
Data     : 24/01/2005
Descrição: Fazer verificação da data de disponibilidade financeira sobre a data
           de vencimento da medição.
--------------------------------------------------------------------------------
Analista : Rodolpho da Silva
Pendência: 18449
Data     : 21/01/2005
Descrição: Correção na tela, pois ao fazer a medição sem contabilizar, estava
           dando erro de 'ACCESS VIOLATION'.
--------------------------------------------------------------------------------
Analista : André Tavares
Pendência: 17867
Data     : 10/11/2004
Descrição: Criação da propriedade DataEstornoDoc para estornar o documento nesta
           data, o valor default é a data corrente.
--------------------------------------------------------------------------------
Analista : Bruno Bastos
Pendência: 15867
Data     : 27/10/2004
Descrição: Alteração para medição de contrato suportar múltiplas contas de baixa
--------------------------------------------------------------------------------
Analista : Bruno Bastos
Pendência: 17963
Data     : 19/10/2004
Descrição: Correção de Erro - Ordenar a busca das contas contábeis
           Fazer a contabilização primeiramente pela conta do tipo de desembolso
           senão pela conta do fornecedor.
--------------------------------------------------------------------------------
Analista : Vinícius
Pendência: 17820
Data     : 30/09/2004
Descrição: Correção de Erro - Não está checando o resultado a integração,
           gravando medição indevida.
--------------------------------------------------------------------------------
Analista : Marchetti
Pendência: 16347
Data     : 16/08/2004
Descrição: Criação do processo RAD caso a fundação utilize RAD. Separado o
           processo de Integração para ser chamado tambem pelo form de medição.
--------------------------------------------------------------------------------
Analista : Marchetti
Pendência: 16957
Data     : 02/07/2004
Descrição: Criada a função EstornaMedicao
--------------------------------------------------------------------------------
Analista : Alex Pereira
Pendência: 16367
Data     : 29/03/04
Descrição: Erro de arredondamento no rateiodocum
           este erro so ocorre com o monitor ligado !!!
           alterar o contrato da sky base da cbs com item com rateio
           diferenciado
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit uCtrlMedicao;

interface

uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     uCMTypes, uCMClientDataSet, uDbMedicao, uDbMedicaoxRateio, uDbParcelaRealContr,
     uDbParcelaMedicao, uCtrlImpostoRetido, uCtrlDocumento, uCtrlLancamento,
     uGeralContrato, uCtrlParamIntegra, uCtrlOrcamento, uCtrlRAD, uCtrlMultiplasContas,
     {SOL:189816 KTN:1793898 JRM6}
     wwQuery,
     uCtrlAlteradorImpostos,
     {SOL:189816 KTN:1793898 JRM6}
     uCtrlSegregacao, uCtrlFinanc, uCtrlListTerceirosRH, uCtrlPadroes, //MARCIO SANCHES SPINOSA - EDILAINE FERRARESI - 172384/9603 - INICIO
     uDbCtrlParcelaMedicao,
     uDbContratoANS // Felipe A. Santos SOL 242313/17289 PPM 828977
     , uCtrlListaServicos, FSelAltTributacao, uCMDialogs, Dialogs, Controls
     , uCMMath//Cássio Rovaroto - SIG nº 123523
     ;
type

   // Início Pendência 23048 - Marcos Topini - 18/08/2006
   TRegRateioDocum = Record
      sCodTipRecDes      : String;
      sCodCentroRespon   : String;
      iUnidNeg           : Integer;
      iIdReservaOrcamen  : Integer;
      sCodCentroCusto    : String;
      iIdPatro           : Integer;
      iIdPlanoPrev       : Integer;
      dValorRateio       : Double;
      dValorOrca         : Double;
      iIdPrograma        : Integer; // Daniel - 26185
      // Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656
      iIdPlanoPrevOrigem : Integer;
      iIdPatroOrigem     : Integer;
      iIdPlano           : Integer;
      // Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656
      IidDespesaOrc      : Integer; // Thiago Melo SOL 237146 PPM 482149
      //Cássio Rovaroto - SIG nº 23656.58469 - Início
      //iIdProcessoSusp    : Integer; //Cássio Rovaroto - SIG nº 115585
      //iIdTipoServico		 : Integer; //Cássio Rovaroto - SIG nº 115585
      //Cássio Rovaroto - SIG nº 23656.58469 - Fim
   End;

   TRateioDocum = array of TRegRateioDocum;
   // Fim Pendência 

   TCtrlMedicao = Class(TCmControlObject)
   private
      FDbMedicao         : TDbMedicao;
      FDbMedicaoxRateio  : TDbMedicaoxRateio;
      FDbParcelaMedicao  : TDbParcelaMedicao;
      FDbParcelaRealContr: TDbParcelaRealContr;
      FDbCtrlParcelaMedicao : TDbCtrlParcelaMedicao; // Felipe A. Santos SOL 218909/16724 PPM 588170
      FDbContratoANS : TDbContratoAns; // Felipe A. Santos SOL 242313/17289 PPM 828977

      FCdsMedicao        : TCMClientDataSet;
      FCdsRateioxCC      : TCMClientDataSet;
      FCdsAlteradores    : TCMClientDataSet;
      FCdsCtrlParcelaMedicao : TCMClientDataSet; // Felipe A. Santos SOL 218909/16724 PPM 588170
      FCdsANS: TCMClientDataSet; // Felipe A. Santos SOL 242313/17289 PPM 828977

      CtrlImpostoRetido  : TCtrlImpostoRetido;
      CtrlLancamento     : TCtrlLancamento;
      CtrlParamIntegra   : TCtrlParamIntegra;
      CtrlDocumento      : TCtrlDocumento;
      GeralContrato      : TGeralContrato;
      //MARCIO SANCHES SPINOSA - EDILAINE FERRARESI - 172384/9603 - INICIO
      CtrlTerceirosRH    : TCtrlListTerceirosRH;
      //MARCIO SANCHES SPINOSA - EDILAINE FERRARESI - 172384/9603 - FIM

      // Início - Rodolpho - P: 17689 - 24/01/2005
      CtrlFinanceiro     : TCtrlFinanc;
      // Fim    - Rodolpho - P: 17689 - 24/01/2005



      //Bruno Bastos - Pend. 15867 - 21/10/2004
      CtrlMultiplasContas: TCtrlMultiplasContas;
      CtrlSegregacao     : TCtrlSegregacao;

      // Marcio Motta - 21/05/2004 - Pendência: 16347
      CtrlOrcamento      : TOrcamentoBackMT;

      // Marchetti - Pendencia 16347
      CtrlRAD           : TCtrlRAD;

      {SOL:189816 KTN:1793898 JRM6}
      CtrlAlteradorImpostos : TCtrlAlteradorImpostos;
      {SOL:189816 KTN:1793898 JRM6}

      CtrlListaServicos : TCtrlListaServicos;

      F_rIDPessoa     : Double;
      F_rIDModulo     : Double;
      F_rIDUsuario    : Double;
      F_rIDEspAcesso  : Double;
      F_bUsaPlanoPatro: Boolean;
      bPartidaDobrada : Boolean;

      rCodDocumentoAux   : Double;
      rPlnCodigoAux      : Double;
      FDataEstornoDoc: TdateTime;
    FCdsTributacao: TCMClientDataSet;



      procedure SetDataEstornoDoc(const Value: TdateTime);
      procedure SetCdsTributacao(const Value: TCMClientDataSet);
    procedure SetCdsAlteradores(const Value: TCMClientDataSet);

   public

      //DAVID - Retenção de Imposto
      OnRetencaoINSS : TOnRetencaoINSS;

      property CdsCtrlParcelaMedicao : TCMClientDataSet read FCdsCtrlParcelaMedicao write FCdsCtrlParcelaMedicao; // Felipe A. Santos SOL 218909/16724 PPM 588170 
      property CdsMedicao: TCMClientDataSet read FCdsMedicao write FCdsMedicao;
      property CdsRateioxCC: TCMClientDataSet read FCdsRateioxCC write FCdsRateioxCC;
      property CdsANS: TCMClientDataSet read FCdsANS write FCdsANS; // Felipe A. Santos SOL 242313/17289 PPM 828977
      property CdsTributacao: TCMClientDataSet read FCdsTributacao write SetCdsTributacao;
      property IDPessoa: Double read F_rIDPessoa write F_rIDPessoa;
      property IDModulo: Double read F_rIDModulo write F_rIDModulo;
      property IDUsuario: Double read F_rIDUsuario write F_rIDUsuario;
      property IDEspAcesso: Double read F_rIDEspAcesso write F_rIDEspAcesso;
      property UsaPlanoPatro: Boolean read F_bUsaPlanoPatro write F_bUsaPlanoPatro;
      property DataEstornoDoc: TdateTime read FDataEstornoDoc write SetDataEstornoDoc; // andré tavares - pendência 17867 - 10/11/2004
      property CdsAlteradores: TCMClientDataSet read FCdsAlteradores write SetCdsAlteradores;

      constructor Create(rIDPessoa,rIDModulo,rIDUsuario, IdEspAcesso: Double; bUsaPlanoPatro: Boolean); reintroduce;
      destructor Destroy; override;
      function ListMedicao(rIDMedicao, rIDPessoa: Double): OleVariant;
      function ListMedicaoxRateio(rIdMedicao: Double; bIncluiItemSemMedicao:Boolean = False): OleVariant;
      function ListParcelaMedicao(rIDMedicao: Double): OleVariant;
      function ListParcelaReal(rIDMedicao: Double): OleVariant;
      function ListParcelaXDoc(rCodDocumento: Double): OleVariant;
      function ListContratoMedicao(rIDContrato: Double): OleVariant;

      function GetUltimaParcelaParaEstorno(rIDContrato, rIdObjeto, rIdItem : Double) : Integer; // Felipe A. Santos SOL 218909/16724 PPM 588170

      function ListaMedicaoContrato(rIDContrato: Double): OleVariant;

      function AplicaAtualMedicao(const iOperacao: Integer; const bContabiliza:Boolean = True; const iIdServico: Integer = -1; const iCodNAturezaREINF: Integer = -1 ): Boolean;
      function IncluiMedicao(const rNumAPgr: Double; const bContabiliza:Boolean = True; const iIdServico: Integer = -1; const iCodNAturezaREINF: Integer = -1): Boolean;
      function AlteraMedicao(const bContabiliza:Boolean = True; const iIdServico: Integer = -1): Boolean;
      function ExcluiMedicao: Boolean;

      procedure OnCreateAppServer; override;

      // Marchetti - Pendencia 16957
      function EstornaMedicao : Boolean;
      // Fim - Marchetti - Pendencia 16957

      // Marcio Motta - 21/05/2004 - 16347
      function IntegraOrcamento(iIdReservaOrcamen: Int64;  fValor: Double): Boolean;

      // Marchetti - Pendencia 16347
      function AplicaIntegracao(const rNumAPgr: Double; const bContabiliza:Boolean = True): Boolean;
      function StatusMedicaoRAD(const rIdContrato, iRad: Double; var iNumRad : Double): String;
      function AplicaDadosIntegrados(const iMedicao : String; const rNumAPgr: Double; const bContabiliza:Boolean = True): Boolean;
      {SOL:189816 KTN:1793898 JRM6}
      function TestaCriaAlteradores(): Boolean;
      {SOL:189816 KTN:1793898 JRM6}

      // Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656
      function IFF(Condicao:boolean;Primeiro,Segundo:string):string;   overload;
      // Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656

      function IFF(Condicao:boolean;Primeiro,Segundo:integer):integer; overload;    //SIG111914

      //Cássio Rovaroto -  SIG nº 23656.58469 - Início
      function ListTipoServico: OleVariant;
      function ListProcessos(pIdForCli : Integer; pDataMedicao: TDateTime): OleVariant;
      function ListaDadosCPRBFornecedor(pIdForCli: integer): OleVariant;
      //Cássio Rovaroto -  SIG nº 23656.58469 - Fim
	    function VerificaServicoMaoDeObra(pIdContrato, pIdObjeto: integer): Boolean; //Cássio Rovaroto - SIG nº 115585
      function LancamentoAlteradoresTributacao(iOperacao: Integer; pIdServico: Integer; pValorMedicao: Extended; pDataLanc: TDateTime; pDataVenc: TDateTime): Boolean; //Cássio Rovaroto - SIG nº 123523
      function RegistraDadosAlterador(pIdServico, pTipoTributo: Integer; pValorMedicao: Extended; pDataLanc: TDateTime; pDataVenc: TDateTime): Boolean; //Cássio Rovaroto - SIG nº 123523
      function GetDadosAlterador(pCodDocumento: Integer): OleVariant;
      function VerificaAlteradorTribLancado(iIdServico: Integer): Boolean;
      function existeAtivProdServ: Boolean; //Cássio Rovaroto - SIG nº 135203


   protected
      procedure DoChangeDataBase; override;
      procedure AfterInitialize; override;
   end;

var
  {SOL:189816 KTN:1793898 JRM6}
  v_DebCre,
  v_RecPag,
  v_CodDocumento,
  v_CodDocumento_aux,
  v_CodtipRecDes:     String;
  v_Coddocumento_Alt,
  v_codtipdoc:        Integer;
  v_ValorDoc:         Double;
  {SOL:189816 KTN:1793898 JRM6}

implementation

{ TCtrlMedicao }

constructor TCtrlMedicao.Create(rIDPessoa, rIDModulo, rIDUsuario, IdEspAcesso: Double; bUsaPlanoPatro: Boolean);
begin
   inherited Create;

   F_rIDPessoa:=rIDPessoa;
   F_rIDModulo:=rIDModulo;
   F_rIDUsuario:=rIDUsuario;
   F_bUsaPlanoPatro:=bUsaPlanoPatro;
   FDataEstornoDoc := Date; // andré tavares - pendência 17867 - 10/11/2004

   FDbMedicao:=TDbMedicao.Create(Self);
   FDbMedicaoxRateio:=TDbMedicaoxRateio.Create(Self);
   FDbParcelaMedicao:=TDbParcelaMedicao.Create(Self);
   FDbParcelaRealContr:=TDbParcelaRealContr.Create(Self);
   FDbCtrlParcelaMedicao := TDbCtrlParcelaMedicao.Create(Self); // Felipe A. Santos SOL 218909/16724 PPM 588170
   FDbContratoANS := TDbContratoAns.Create(Self); // Felipe A. Santos SOL 242313/17289 PPM 828977

   FCdsAlteradores:=TCMClientDataSet.Create(nil);

   // Marcio Motta - 21/05/2004 - 16347
   CtrlOrcamento := TOrcamentoBackMT.Create;

   CtrlImpostoRetido:=TCtrlImpostoRetido.Create;
   CtrlDocumento:=TCtrlDocumento.Create;
   CtrlLancamento:=TCtrlLancamento.Create;
   CtrlParamIntegra:=TCtrlParamIntegra.Create;
   GeralContrato:=TGeralContrato.Create;

   {SOL:189816 KTN:1793898 JRM6}
   CtrlAlteradorImpostos := TCtrlAlteradorImpostos.Create;
   {SOL:189816 KTN:1793898 JRM6}

   //Bruno Bastos - Pend. 15867 - 21/10/2004
   CtrlMultiplasContas := TCtrlMultiplasContas.Create;
   CtrlSegregacao      := TCtrlSegregacao.Create;

   // Marchetti - Pendencia 16347
   CtrlRAD          := TCtrlRAD.Create;

   //  Início - Rodolpho - P: 17689 - 24/01/2005
    CtrlFinanceiro   := TCtrlFinanc.Create(Sistema.IdEmpresa,Sistema.IdModulo,Sistema.IdUsuario,Sistema.UsaPlanoPatro);
   //  Fim    - Rodolpho - P: 17689 - 24/01/2005

   //MARCIO SANCHES SPINOSA - EDILAINE FERRARESI - 172384/9603 - INICIO
   CtrlTerceirosRH :=  TCtrlListTerceirosRH.Create('', '', '');
   CtrlTerceirosRH.InitializeAs(Padroes);
   //MARCIO SANCHES SPINOSA - EDILAINE FERRARESI - 172384/9603 - FIM
   CtrlListaServicos := TCtrlListaServicos.Create; //Cássio Rovaroto - SIG nº 133236
   CtrlListaServicos.InitializeAs(Padroes);  //Cássio Rovaroto - SIG nº 133236
end;

//SIG111914 : inicio
function TCtrlMedicao.IFF(Condicao: boolean; Primeiro,
  Segundo: integer): integer;
begin
  if Condicao then begin
    IFF := Primeiro;
  end else  begin
    IFF := Segundo;
  end;
end;
//SIG111914 : fim


procedure TCtrlMedicao.OnCreateAppServer;
begin
   inherited;
   FCdsMedicao   := TCMClientDataSet.Create(nil);
   FCdsRateioxCC := TCMClientDataSet.Create(nil);
end;

destructor TCtrlMedicao.Destroy;
begin
   FDbMedicao.Free;
   FDbMedicaoxRateio.Free;
   FDbParcelaMedicao.Free;
   FDbParcelaRealContr.Free;
   FDbContratoANS.Free; // Felipe A. Santos SOL 242313/17289 PPM 828977
   CtrlImpostoRetido.Free;
   CtrlDocumento.Free;
   CtrlLancamento.Free;
   CtrlParamIntegra.Free;
   CtrlOrcamento.Free;
   GeralContrato.Free;
   FCdsAlteradores.Free;

   {SOL:189816 KTN:1793898 JRM6}
   CtrlAlteradorImpostos.Free;
   {SOL:189816 KTN:1793898 JRM6}


   //Bruno Bastos - Pend. 15867 - 21/10/2004
   CtrlMultiplasContas.Free;
   CtrlSegregacao.Free;


   //  Início - Rodolpho - P: 17689 - 24/01/2005
   CtrlFinanceiro.Free;
   //  Fim    - Rodolpho - P: 17689 - 24/01/2005

   CtrlRAD.Free;

   if IsAppServer then
    begin
       FCdsMedicao.Free;
       FCdsRateioxCC.Free;
    end;

    FreeAndNil(CtrlListaServicos); //Cássio Rovaroto - SIG nº 133236
   inherited;
end;

procedure TCtrlMedicao.AfterInitialize;
begin
   inherited;
   CtrlImpostoRetido.InitializeAs(Self);
   CtrlDocumento.InitializeAs(Self);
   CtrlLancamento.InitializeAs(Self);
   CtrlParamIntegra.InitializeAs(Self);
   GeralContrato.InitializeAs(Self);

   CtrlOrcamento.InitializeAs(Self);

   {SOL:189816 KTN:1793898 JRM6}
   CtrlAlteradorImpostos.InitializeAs(Self);
   {SOL:189816 KTN:1793898 JRM6}


   //Bruno Bastos - Pend. 15867 - 21/10/2004
   CtrlMultiplasContas.InitializeAs(Self);
   CtrlSegregacao.InitializeAs(Self);


   //  Início - Rodolpho - P: 17689 - 24/01/2005
   CtrlFinanceiro.InitializeAs(self);
   //  Fim    - Rodolpho - P: 17689 - 24/01/2005


   CtrlImpostoRetido.OpenTransaction:=False;
   CtrlDocumento.OpenTransaction:=False;

   CtrlRAD.InitializeAs(Self);

   with TCMClientDataSet.Create(nil) do
   try
      Data:=GetDataPacket('SELECT PACDOBRADA '+
                          'FROM PARAMCONTAB '+
                          'WHERE (IDPESSOA = '+FloatToStr(F_rIDPessoa)+') ');
      bPartidaDobrada:=(FieldByName('PACDOBRADA').AsString='S');
   finally
      Free;
   end;
end;



procedure TCtrlMedicao.DoChangeDataBase;
begin
   inherited;
   FDbMedicao.DataBaseName:=DataBaseName;
   FDbMedicaoxRateio.DataBaseName:=DataBaseName;
   FDbParcelaMedicao.DataBaseName:=DataBaseName;
   FDbParcelaRealContr.DataBaseName:=DataBaseName;
   FDbCtrlParcelaMedicao.DataBaseName :=DataBaseName; // Felipe A. Santos SOL 218909/16724 PPM 588170
   FDbContratoANS.DataBaseName := DataBaseName; // Felipe A. Santos SOL 242313/17289 PPM 828977
end;



function TCtrlMedicao.AplicaAtualMedicao(const iOperacao: Integer; const bContabiliza:Boolean;
                                         const iIdServico: Integer; const iCodNAturezaREINF: Integer): Boolean;
begin

   //  Início - Rodolpho - P: 17689 - 24/01/2005
   //   Verifica se o usuário está disponível no controle financeiro
   if not CtrlFinanceiro.TestaDispFinanc(Sistema.IdEmpresa,Sistema.IdUsuario,FCdsMedicao.FieldByName('DATAPREVISTAVENC').AsDateTime) then
   begin
// Rodolpho - p: 19904 -
      MessageInfo := CtrlFinanceiro.MessageInfo;
      Result      := False;
   end
   else
   begin
     MessageInfo:='';
     Result:=True;
     if ConnectionSide = cnsClient then
     begin
        Result := Connection.AppServer.AplicaAtualMedicao(iOperacao, bContabiliza);
        if not Result then MessageInfo := Connection.AppServer.MessageInfo;
     end
     else
     begin
     //  Fim - Rodolpho - P: 17689 - 24/01/2005


        StartTransacao;
        try
           case iOperacao of
              1: Result := IncluiMedicao(0, bContabiliza, iIdServico, iCodNaturezaREINF); //Inclusão
              2: Result := AlteraMedicao(bContabiliza);    //Alteração
              3: Result := ExcluiMedicao;                  //Exclusão
              4: Result := EstornaMedicao;                 //Estorno
           end;

           if not(Result) then
              Rollback
           else
              Commit;

        except
           on E:Exception do
           begin
              Result := False;
              MessageInfo := E.Message;
              Rollback;
          end;
        end;
     end;

   end;
end;



function TCtrlMedicao.IncluiMedicao(const rNumAPgr: Double; const bContabiliza:Boolean;
                                    const iIdServico: Integer; const iCodNAturezaREINF: Integer): Boolean;
var
   iNumRad : Double;
   fValorMedicao : Currency;
begin
   Result := True;
   try  //except

      rCodDocumentoAux   := -1;
      rPlnCodigoAux      := -1;
      fValorMedicao      := 0;
      iNumRad            := -1;

      // Marchetti - Pendência: 16347
      FCdsMedicao.First;
      while not FCdsMedicao.eof do
      begin
         fValorMedicao := fValorMedicao + FCdsMedicao.FieldByName('VALORMEDICAO').AsFloat;
         FCdsMedicao.Next;
      end;
      FCdsMedicao.First;

      if Sistema.UsaRad then
      begin
         // Verifica se utiliza o RAD
         CtrlRAD.OpenTransaction := False;
         CtrlRAD.TipoProcesso    := CtrlRAD.GetTipoProcesso( 28 , FCdsMedicao.FieldByName('IDPessoa').AsInteger ); // É fixa a referência

         // Encerra o RAD anterior
         if not FCdsMedicao.FieldByName('NUMRAD').IsNull then begin
           if not CtrlRAD.GravaStatusProcesso( FCdsMedicao.FieldByName('NUMRAD').AsFloat, rsRecusado ) then
              raise Exception.Create( CtrlRAD.MessageInfo );
         end;

         // Gera Processo RAD
         if CtrlRAD.TipoProcesso > 0 then begin
            CtrlRAD.IdPessoa        := FCdsMedicao.FieldByName('IDPessoa').AsInteger;
            CtrlRAD.IdUsuario       := StrToInt(FloatToStr(F_rIDUsuario));
            CtrlRAD.idEmpresa       := FCdsMedicao.FieldByName('IDPessoa').AsInteger;
            CtrlRAD.OBS             := 'Contrato  : '+ FCdsMedicao.FieldByName('IDCONTRATO').AsString +#13+#10+
                                       'Data      : '+ FCdsMedicao.FieldByName('DATAMEDICAO').AsString;
            CtrlRAD.Valor           := fValorMedicao;

            iNumRad := CtrlRAD.IniciarProcesso;
            if iNumRad < 0 then raise Exception.Create( CtrlRAD.MessageInfo );
         end;
      end;


      if not FCdsTributacao.IsEmpty then
      begin
        FCdsAlteradores.Data := GetDadosAlterador(-1);
        FCdsTributacao.First;
        while not FCdsTributacao.Eof do
        begin
          FCdsAlteradores.Append;
          FCdsAlteradores.FieldByName('CODALTERADOR').asInteger    := FCdsTributacao.FieldByName('CODALTERADOR').asInteger;
          FCdsAlteradores.FieldByName('VALOR').asFloat             := FCdsTributacao.FieldByName('VALOR').asFloat;
          FCdsAlteradores.FieldByName('VALOROUTRAMOEDA').asFloat   := FCdsTributacao.FieldByName('VALOROUTRAMOEDA').asFloat;
          FCdsAlteradores.FieldByName('VLRLIQUIDO').asFloat        := FCdsTributacao.FieldByName('VLRLIQUIDO').asFloat;
          FCdsAlteradores.FieldByName('HISTORICOCOMPL').asString   := FCdsTributacao.FieldByName('HISTORICOCOMPL').asString;
          FCdsAlteradores.FieldByName('UNIDNEGOC').asInteger       := FCdsTributacao.FieldByName('UNIDNEGOC').asInteger;
          FCdsAlteradores.FieldByName('DATALANCTO').asDatetime     := FCdsTributacao.FieldByName('DATALANCTO').asDatetime;
          FCdsAlteradores.FieldByName('VALORBASERETENCAO').asFloat := FCdsTributacao.FieldByName('VALORBASERETENCAO').asFloat;
          FCdsAlteradores.FieldByName('DEBCRE').asString           := FCdsTributacao.FieldByName('DEBCRE').asString;
          FCdsAlteradores.FieldByName('IDPESSOA').asInteger        := FCdsTributacao.FieldByName('IDPESSOA').asInteger;
          FCdsAlteradores.FieldByName('CONTABILIZA').asString      := FCdsTributacao.FieldByName('CONTABILIZA').asString;
          FCdsAlteradores.FieldByName('NUMRECIBO').asString        := FCdsTributacao.FieldByName('NUMRECIBO').asString;
          FCdsAlteradores.FieldByName('IDTIPOSERVICO').AsInteger   := FCdsTributacao.FieldByName('IDTIPOSERVICO').AsInteger;
          FCdsAlteradores.FieldByName('IDPROCESSO').asInteger      := FCdsTributacao.FieldByName('IDPROCESSO').asInteger;
          FCdsAlteradores.FieldByName('DESCRICAO').asString        := FCdsTributacao.FieldByName('DESCRICAO').asString;
          FCdsAlteradores.Post;
          FCdsTributacao.Next;
        end;
      end;



      //Cássio Rovaroto - SIG nº 133236 - Início
      //Verificação e possível gravação de alteradores de tributação
      //if iIdServico > -1 then
      //begin
      //  if not LancamentoAlteradoresTributacao(1, iIdServico, fValorMedicao,
      //                                        FCdsMedicao.FieldByName('DATALANCAMENTO').AsDateTime,
      //                                         FCdsMedicao.FieldByName('DATAPREVISTAVENC').AsDateTime) then
      //  begin
      //    Result := False;
      //    Exit;
      //  end;
      //end;
      //Cássio Rovaroto - SIG nº 133236 - Fim

      // Marchetti - Pendência: 16347
      if (not Sistema.UsaRAD) or
         ((Sistema.UsaRAD) and (CtrlRAD.TipoProcesso = 0)) then
      begin
         // Efetua as integrações Financeira/Contábeis
         // Pend 17820 - Vinicius
         if not AplicaIntegracao(rNumAPgr, bContabiliza) then
            raise Exception.Create( MessageInfo );
      end;

      //------------------------------------------------------------------------
      // Inclusão da Medição, Parcela Medição e Parcela Real Contratual
      //------------------------------------------------------------------------
      FCdsMedicao.First;
      while not FCdsMedicao.Eof do begin
         //--------------------------------------------------------------
         //Grava Medição
         //--------------------------------------------------------------
         FDbMedicao.Idcontrato.AsFloat       := FCdsMedicao.FieldByName('IDCONTRATO').AsFloat;
         FDbMedicao.Iditem.AsFloat           := FCdsMedicao.FieldByName('IDITEM').AsFloat;
         FDbMedicao.Idobjeto.AsFloat         := FCdsMedicao.FieldByName('IDOBJETO').AsFloat;
         FDbMedicao.Idpessoa.AsFloat         := F_rIDPessoa;
         FDbMedicao.Dataprevmedicao.AsFloat  := FCdsMedicao.FieldByName('DATAPREVMEDICAO').AsDateTime;
         FDbMedicao.Datamedicao.AsDateTime   := FCdsMedicao.FieldByName('DATAMEDICAO').AsDateTime;
         FDbMedicao.Qtdemedicao.AsFloat      := FCdsMedicao.FieldByName('QTDEMEDICAO').AsFloat;
         FDbMedicao.Valormedicao.AsFloat     := FCdsMedicao.FieldByName('VALORMEDICAO').AsFloat;
         FDbMedicao.Observacao.AsString      := FCdsMedicao.FieldByName('OBSERVACAO').AsString;
         FDbMedicao.Historicocompl.AsString  := FCdsMedicao.FieldByName('HISTORICOCOMPL').AsString;
         FDbMedicao.FlgEstornado.AsInteger   := 0;

         // Marcio Motta - 21/05/2004 - 16347
         FDbMedicao.IdReservaOrcamen.AsFloat := FCdsMedicao.FieldByName('IDRESERVAORCAMEN').AsFloat;

         // Marchetti - Pendencia 16347
         if iNumRad > 0 then FDbMedicao.NumRad.AsFloat := iNumRad;

         FDbMedicao.DataLancamento.Value   := FCdsMedicao.FieldByName('DATALANCAMENTO').Value;
         FDbMedicao.IDCBancaria.Value      := FCdsMedicao.FieldByName('IDCBANCARIA').Value;
         FDbMedicao.NoDocumento.Value      := FCdsMedicao.FieldByName('NODOCUMENTO').Value;
         FDbMedicao.ComplDocumento.Value   := FCdsMedicao.FieldByName('COMPLDOCUMENTO').Value;
         FDbMedicao.Obs.Value              := FCdsMedicao.FieldByName('OBS').Value;
         FDbMedicao.NumLeitCodBarras.Value := FCdsMedicao.FieldByName('NUMLEITCODBARRAS').Value;
         FDbMedicao.NumDigCodBarras.Value  := FCdsMedicao.FieldByName('NUMDIGCODBARRAS').Value;
         FDbMedicao.CodForma.Value         := FCdsMedicao.FieldByName('CODFORMA').Value;

         FDbMedicao.MesReferencia.Value    := FCdsMedicao.FieldByName('MES_REFERENCIA').Value;
         FDbMedicao.AnoReferencia.Value    := FCdsMedicao.FieldByName('ANO_REFERENCIA').Value;

		 //Cássio Rovaroto - SIG nº 23656.58469 - Início
         //FDbMedicao.IdTipoServico.Value  	 := FCdsMedicao.FieldByName('IDTIPOSERVICO').Value; //Cássio Rovaroto - SIG nº 115585
         //FDbMedicao.IdProcessoSusp.Value   := FCdsMedicao.FieldByName('IDPROCESSOSUSP').Value; //Cássio Rovaroto - SIG nº 115585
         //Cássio Rovaroto - SIG nº 23656.58469 - Fim
		 
         Result := FDbMedicao.Insert;
         if not Result then begin
            MessageInfo := FDbMedicao.MessageInfo;
            Exit;
         end;

         //--------------------------------------------------------------
         //Grava a medição no controle de parcelas que estão em alerta
         //--------------------------------------------------------------

         // Felipe A. Santos SOL 218909/16724 PPM 588170 - inicio
         FDbCtrlParcelaMedicao.Clear;
         FDbCtrlParcelaMedicao.IdParcMedicao.AsFloat    := FCdsMedicao.FieldByName('IDPARCMEDICAO').AsFloat;
         FDbCtrlParcelaMedicao.Idcontrato.AsFloat       := FCdsMedicao.FieldByName('IDCONTRATO').AsFloat;
         FDbCtrlParcelaMedicao.Iditem.AsFloat           := FCdsMedicao.FieldByName('IDITEM').AsFloat;
         FDbCtrlParcelaMedicao.Idobjeto.AsFloat         := FCdsMedicao.FieldByName('IDOBJETO').AsFloat;
         FDbCtrlParcelaMedicao.ParcelaNum.AsFloat       := FCdsMedicao.FieldByName('PARCELANUM').AsFloat;
         FDbCtrlParcelaMedicao.Vencimento.AsDateTime    := FCdsMedicao.FieldByName('VENCIMENTO').AsDateTime;
         FDbCtrlParcelaMedicao.IdAditamento.AsFloat     := FCdsMedicao.FieldByName('IDADITAMENTO').AsInteger;
         FDbCtrlParcelaMedicao.IdMedicao.AsFloat        := FDbMedicao.Idmedicao.AsFloat;
         FDbCtrlParcelaMedicao.FlgParcelaMedida.AsFloat := 1;

         Result := FDbCtrlParcelaMedicao.Update;

         if not Result then begin
           MessageInfo := FDbCtrlParcelaMedicao.MessageInfo;
           Exit;
         end;

         // Felipe A. Santos SOL 218909/16724 PPM 588170 - fim

         // Felipe A. Santos SOL 242313/17289 PPM 828977 - início
         //--------------------------------------------------------------
         //Grava os registros de ANS da medição
         //--------------------------------------------------------------
         cdsANS.Filtered := False;
         cdsANS.Filter := 'IDOBJETO = ' + FCdsMedicao.FieldByName('IDOBJETO').AsString + ' AND ' +
                          'IDITEM = ' + FCdsMedicao.FieldByName('IDITEM').AsString + ' AND ' +
                          'PARCELANUM = ' + FCdsMedicao.FieldByName('PARCELANUM').AsString;
         cdsANS.Filtered := True;

         cdsANS.First;
         while not (CdsANS.Eof) do
         begin
            FDbContratoANS.Clear;
            FDbContratoANS.IdContrato.AsFloat := FDbMedicao.IdContrato.AsFloat;
            FDbContratoANS.IdMedicao.AsFloat := FDbMedicao.IdMedicao.AsFloat;
            FDbContratoANS.VlrMensal.AsFloat := CdsANS.FieldByName('VLRMENSAL').AsFloat;
            FDbContratoANS.VlrANS.AsFloat    := CdsANS.FieldByName('VLRANS').AsFloat;
            FDbContratoANS.NumCI.AsString := CdsANS.FieldByName('NUMCI').AsString;
            FDbContratoANS.Referencia.AsString := CdsANS.FieldByName('REFERENCIA').AsString;
            FDbContratoANS.Obs.AsString := CdsANS.FieldByName('OBS').AsString;
            FDbContratoANS.NumDocumento.AsString := FCdsMedicao.FieldByName('NODOCUMENTO').AsString + '/' +
                                                    FCdsMedicao.FieldByName('COMPLDOCUMENTO').AsString;
            FDbContratoANS.DtLancto.AsDateTime := Now;

            Result := FDbContratoANS.Insert;

            if not Result then begin
              MessageInfo := FDbContratoANS.MessageInfo;
              Exit;
            end;

            CdsANS.Next;
         end;
          // Felipe A. Santos SOL 242313/17289 PPM 828977 - fim


         //--------------------------------------------------------------
         //Grava o Rateio da Medição
         //--------------------------------------------------------------
         FCdsRateioxCC.Filtered := False;
         FCdsRateioxCC.Filter   := 'IDITEM='+FloatToStr(FCdsMedicao.FieldByName('IDITEM').AsFloat)+
                                   ' AND '+
                                   'IDOBJETO='+FloatToStr(FCdsMedicao.FieldByName('IDOBJETO').AsFloat)+
                                   ' AND '+
                                   'PARCELANUM='+FloatToStr(FCdsMedicao.FieldByName('PARCELANUM').AsFloat);//Petri SOL 257896 PPM 1014759
         FCdsRateioxCC.Filtered := True;
         FCdsRateioxCC.First;
         while not FCdsRateioxCC.Eof do begin
            FDbMedicaoxRateio.IdMedicao.AsFloat       := FDbMedicao.Idmedicao.AsFloat;
            FDbMedicaoxRateio.IdPrograma.AsFloat      := FCdsRateioxCC.FieldByName('IDPROGRAMA').AsFloat;
            FDbMedicaoxRateio.IdPatro.AsFloat         := FCdsRateioxCC.FieldByName('IDPATRO').AsFloat;
            FDbMedicaoxRateio.IdPlanoPrev.AsFloat     := FCdsRateioxCC.FieldByName('IDPLANOPREV').AsFloat;
            FDbMedicaoxRateio.IdPessoa.AsFloat        := FCdsRateioxCC.FieldByName('IDPESSOA').AsFloat;
            FDbMedicaoxRateio.UnidNegoc.AsFloat       := FCdsRateioxCC.FieldByName('UNIDNEGOC').AsFloat;
            FDbMedicaoxRateio.IdEmpresa.AsFloat       := FCdsRateioxCC.FieldByName('IDEMPRESA').AsFloat;
            FDbMedicaoxRateio.Codcentrocusto.AsString := FCdsRateioxCC.FieldByName('CODCENTROCUSTO').AsString;
            FDbMedicaoxRateio.Divisor.AsString        := FCdsRateioxCC.FieldByName('DIVISOR').AsString;
            FDbMedicaoxRateio.Vlrrateio.AsFloat       := FCdsRateioxCC.FieldByName('PERCRATEIOCONTR').AsFloat;

            FDbMedicaoxRateio.IDFDO.AsFloat           := FCdsRateioxCC.FieldByName('ID_FDO').AsFloat;    //edilaine SIG115595

            Result := FDbMedicaoxRateio.Insert;
            if not Result then begin
               MessageInfo := FDbMedicaoxRateio.MessageInfo;
               Exit;
            end;

            FCdsRateioxCC.Next;
         end;

         //--------------------------------------------------------------
         //Grava Parcela Medição
         //--------------------------------------------------------------
         FDbParcelaMedicao.Idmedicao.AsFloat:=FDbMedicao.Idmedicao.AsFloat;
         FDbParcelaMedicao.Dataprevistavenc.AsDateTime:=
                           FCdsMedicao.FieldByName('DATAPREVISTAVENC').AsDateTime;
         FDbParcelaMedicao.Idpessoa.AsFloat:=F_rIDPessoa;
         FDbParcelaMedicao.Valorprevisto.AsFloat:=
                           FCdsMedicao.FieldByName('VALORMEDICAO').AsFloat;
         if rCodDocumentoAux <> -1 then
            FDbParcelaMedicao.Coddocumento.AsFloat:=rCodDocumentoAux
         else
            FDbParcelaMedicao.Coddocumento.Clear;


         // Marchetti - Pendencia 16347
         if iNumRad > 0 then FDbParcelaMedicao.NumRad.AsFloat := iNumRad;

         Result := FDbParcelaMedicao.Insert;
         if not Result then begin
            MessageInfo := FDbParcelaMedicao.MessageInfo;
            Exit;
         end;

         //--------------------------------------------------------------
         //Grava Parcela Real Contratual
         //--------------------------------------------------------------
         FDbParcelaRealContr.Idmedicao.AsFloat:=FDbMedicao.Idmedicao.AsFloat;
         FDbParcelaRealContr.Idparcelamedicao.AsFloat:=
                             FDbParcelaMedicao.Idparcelamedicao.AsFloat;
         FDbParcelaRealContr.Idcontrato.AsFloat:=
                             FCdsMedicao.FieldByName('IDCONTRATO').AsFloat;
         FDbParcelaRealContr.Iditem.AsFloat:=
                             FCdsMedicao.FieldByName('IDITEM').AsFloat;
         FDbParcelaRealContr.Idobjeto.AsFloat:=
                             FCdsMedicao.FieldByName('IDOBJETO').AsFloat;
         FDbParcelaRealContr.Idpessoa.AsFloat     := F_rIDPessoa;

         FDbParcelaRealContr.FlgEstornado.AsInteger := 0;


         if rCodDocumentoAux <> -1 then
            FDbParcelaRealContr.Coddocumento.AsFloat := rCodDocumentoAux
         else
            FDbParcelaRealContr.Coddocumento.Clear;


         if rPlnCodigoAux <> -1 then
            FDbParcelaRealContr.Plncodigo.AsFloat    := rPlnCodigoAux
         else
            FDbParcelaRealContr.Plncodigo.Clear;


         // Marcio Motta - 21/05/2004 - 16347
         FDbParcelaRealContr.IdReservaOrcamen.AsFloat:= FCdsMedicao.FieldByName('IDRESERVAORCAMEN').AsFloat;

         FDbParcelaRealContr.Datavencparcela.AsDateTime:=
                             FCdsMedicao.FieldByName('DATAPREVISTAVENC').AsDateTime;
         FDbParcelaRealContr.Datarealparcela.AsDateTime:=
                             FCdsMedicao.FieldByName('DATAMEDICAO').AsDateTime;
         FDbParcelaRealContr.Qtdeparcela.AsFloat:=
                             FCdsMedicao.FieldByName('QTDEMEDICAO').AsFloat;
         FDbParcelaRealContr.Observacao.AsString:=
                             FCdsMedicao.FieldByName('OBSERVACAO').AsString;
         FDbParcelaRealContr.HistoricoCompl.AsString:=
                             FCdsMedicao.FieldByName('HISTORICOCOMPL').AsString;

         if (FCdsMedicao.FieldByName('QTDEMEDICAO').AsFloat <> 0) then
             FDbParcelaRealContr.Valorobjparcela.AsFloat:=
                       FCdsMedicao.FieldByName('VALORMEDICAO').AsFloat/
                       FCdsMedicao.FieldByName('QTDEMEDICAO').AsFloat;

         FDbParcelaRealContr.Vlrmoedacorrente.AsFloat:=
                             FCdsMedicao.FieldByName('VALORMEDICAO').AsFloat;


         Result := FDbParcelaRealContr.Insert;
         if not Result then begin
            MessageInfo := FDbParcelaRealContr.MessageInfo;
            Exit;
         end;

         //TestaCriaAlteradores();    {SOL:189816 KTN:1793898 JRM6}

         FCdsMedicao.Next;
      end;

      if not FCdsAlteradores.IsEmpty then
        FCdsAlteradores.Data := GetDadosAlterador(-1);
        
   except
      On E : Exception do
      begin
         Result := False;
         if ( E is EAbort ) then MessageInfo := ''
         else MessageInfo := E.Message;
      end;
   end;
end;



function TCtrlMedicao.AlteraMedicao(const bContabiliza:Boolean; const iIdServico: Integer): Boolean;
var sSql             : String;
    cdsAux           : TCMClientDataSet;
    rNumAPgrAux      : Double;
    cdsAux2          : TCMClientDataSet; // Felipe A. Santos SOL 242313/17289 PPM 828977
    cdsFDO           : TCMClientDataSet; //edilaine SIG117602
    fValorMedicao    : Currency;
begin
   //A alteração consiste em apagar no banco todos os dados refrentes a medição e então
   //incluí-los novamente
   Result      := True;
   MessageInfo := '';
   try
      cdsFDO := TCMClientDataSet.create(nil); //edilaine SIG117602

      cdsAux:=TCMClientDataSet.Create(nil);
      cdsAux2:=TCMClientDataSet.Create(nil); // Felipe A. Santos SOL 242313/17289 PPM 828977
      try
         rCodDocumentoAux := FCdsMedicao.FieldByName('CODDOCUMENTO').AsFloat;

         // Guarda os alteradores do documento para lançar novamente,
         // exceto alteradores de imposto retido
         sSql := 'SELECT L.* '+
                 '  FROM LANCTODOCUM L '+
                 ' WHERE (L.CODDOCUMENTO = ' + FloatToStr(rCodDocumentoAux)+') AND '+
                 '       (RTRIM(L.OPERACAO) = ''4'') AND '+
                 '       (L.ESTORNO IS NULL) AND '+
                 '       (NOT EXISTS(SELECT CODDOCUMENTO '+
                 '                     FROM IMPOSTORETIDO I '+
                 '                    WHERE (I.CODDOCUMENTO = L.CODDOCUMENTO) AND '+
                 '                          (I.NUMLANCTO = L.NUMLANCTO)))';
         FCdsAlteradores.Data := GetDataPacket( sSql );

         FCdsMedicao.First;
         while not FCdsMedicao.eof do
         begin
          fValorMedicao := fValorMedicao + FCdsMedicao.FieldByName('VALORMEDICAO').AsFloat;
          FCdsMedicao.Next;
         end;
         FCdsMedicao.First;

         //Cássio Rovaroto - SIG nº 133236 - Início
         //Verificação e possível gravação de alteradores de tributação
         if iIdServico > -1 then
         begin
          if not LancamentoAlteradoresTributacao(2, iIdServico, fValorMedicao,
                                                 FCdsMedicao.FieldByName('DATALANCAMENTO').AsDateTime,
                                                 FCdsMedicao.FieldByName('DATAPREVISTAVENC').AsDateTime) then
          begin
            Result := False;
            Exit;
          end;
        end;
        //Cássio Rovaroto - SIG nº 133236 - Fim

         // Guarda o Nr. da AP
         sSql := 'SELECT NUMAPGR '+
                 '  FROM DOCUMENTO '+
                 ' WHERE (CODDOCUMENTO = '+FloatToStr(rCodDocumentoAux)+') AND '+
                 '       (NUMAPGR IS NOT NULL) ';
         cdsAux.Data := GetDataPacket( sSql );
         rNumAPgrAux := cdsAux.FieldByName('NUMAPGR').AsFloat;

         // Guarda os dados da medição para posterior inclusão
         cdsAux.Close;
         cdsAux.Data := FCdsMedicao.Data;

         // Felipe A. Santos SOL 242313/17289 PPM 828977 - início
         FCdsANS.Filtered := False;
         cdsAux2.Close;
         cdsAux2.Data := FCdsANS.Data;
         // Felipe A. Santos SOL 242313/17289 PPM 828977 - fim


         //edilaine SIG117602 : inicio
         //guarda integracao FDO Digital
         sSql := 'SELECT FDO.*, FDD.COD_FDO AS NUMFDO, FDO.MES_ANO_SERVICO AS MESFDO,  ' + #13 +
                 '      (select COUNT(1)                          ' + #13 +
                 '          from CM.INTEGRA_FDO_DIGITAL           ' + #13 +
                 '         where CODDOCUMENTO = FDO.NUMERO_BAIXA  ' + #13 +
                 '           and NUMFDO = FDD.COD_FDO             ' + #13 +
                 '       ) as FLGINTEGRADO                        ' + #13 +
                 '  FROM USER_INTEGRACAO_ORCAMENTARIA.BAIXA_FDO   FDO ' + #13 +
                 '  JOIN USER_INTEGRACAO_ORCAMENTARIA.FDO_DIGITAL FDD ' + #13 +
                 '    ON FDD.ID_FDO = FDO.ID_FDO '                      + #13 +
                 ' WHERE FDO.NUMERO_BAIXA = ' + IntToStr(Trunc(rCodDocumentoAux));
         cdsFDO.Data := GetDataPacket( sSql );
         //edilaine SIG117602 : fim


         //---------------------------------------------------------------------
         //Exclui Medição
         //---------------------------------------------------------------------
         if not ExcluiMedicao then raise Exception.Create( MessageInfo );

         //---------------------------------------------------------------------
         //Limpa Cds de Medição e inclui dados
         //---------------------------------------------------------------------
         FCdsMedicao.EmptyDataSet;
         FCdsMedicao.Data := GeralContrato.IncluiDados( cdsAux.Data );

         // Felipe A. Santos SOL 242313/17289 PPM 828977 - início
         //---------------------------------------------------------------------
         //Limpa Cds de ANS e inclui dados
         //---------------------------------------------------------------------
         FCdsANS.EmptyDataSet;
         FCdsANS.Data := GeralContrato.IncluiDados( cdsAux2.Data );
         // Felipe A. Santos SOL 242313/17289 PPM 828977 - fim

         //---------------------------------------------------------------------
         //Inclui a medição já modificada
         //---------------------------------------------------------------------
         if not IncluiMedicao( rNumAPgrAux, bContabiliza ) then raise exception.Create( MessageInfo );

         //edilaine SIG117602 : inicio
         //---------------------------------------------------------------------
         //Atualiza integração FDO Digital
         //---------------------------------------------------------------------
         cdsFDO.first;
         while not cdsFDO.eof do
         begin
           if cdsFDO.FieldByName('FLGINTEGRADO').AsInteger = 1 then
           begin
             sSQL := 'INSERT INTO CM.INTEGRA_FDO_DIGITAL (CODDOCUMENTO, NUMFDO, MESFDO) ' +
                     ' VALUES ( ' +
                     IntToStr(Trunc(rCodDocumentoAux)) + ', ' +
                     QuotedStr(cdsFDO.FieldByName('NUMFDO').AsString) + ', ' +
                     QuotedStr(cdsFDO.FieldByName('MESFDO').AsString) + ') ';

             if not ExecSql(sSQL) then raise exception.create('Não foi possível atualizar a Integração do FDO Digital');
           end;

           sSQL :=
           'UPDATE USER_INTEGRACAO_ORCAMENTARIA.BAIXA_FDO '                   + #13 +
           'SET    NUMERO_BAIXA = ' + IntToStr(Trunc(rCodDocumentoAux))       + #13 +
           '       , SITUACAO = '+QuotedStr(cdsFDO.FieldByName('SITUACAO').AsString)  + #13 +
           'WHERE '                                                           + #13 +
           '       ID_FDO   = '+cdsFDO.FieldByName('ID_FDO').AsString +
           '  AND  ID_BAIXA = '+cdsFDO.FieldByName('ID_BAIXA').AsString;

           if not ExecSql(sSQL) then raise exception.create('Não foi possível atualizar a baixa do FDO Digital');

           cdsFDO.next;
         end;
        //edilaine SIG117602 : fim

      except
         on E:Exception do begin
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
   finally
      cdsAux.Free;
      cdsAux2.Free; // Felipe A. Santos SOL 242313/17289 PPM 828977
      cdsFDO.free;  //edilaine SIG117602
   end;
end;

function TCtrlMedicao.ExcluiMedicao: Boolean;
var
   cdsParcelaMedicaoAux : TCMClientDataSet;
   cdsParcelaRealAux    : TCMClientDataSet;
   cdsMedicaoxRateioAux : TCMClientDataSet;
   fNumRad              : extended;
   iIDMedicao           : Double;  //Marilza Colpani SOL130441_KTN732123
begin
   Result           := True;
   MessageInfo      := '';
   rCodDocumentoAux := 0;
   fNumRad          := 0;

   try
      try
         cdsParcelaMedicaoAux := TCMClientDataSet.Create(nil);
         cdsParcelaRealAux    := TCMClientDataSet.Create(nil);
         cdsMedicaoxRateioAux := TCMClientDataSet.Create(nil);
         //Marilza Colpani SOL130441_KTN732123
         iIDMedicao := FCdsMedicao.FieldByName('IDMedicao').AsFloat;
         FCdsMedicao.First;

         if not FCdsMedicao.FieldByName('NUMRAD').IsNull then
           fNumRad := FCdsMedicao.FieldByName('NUMRAD').AsFloat;

         //---------------------------------------------------------------------
         //Exclui parcela medição e parcela Real
         //---------------------------------------------------------------------
         cdsParcelaMedicaoAux.Close;
         //Marilza Colpani SOL130441_KTN732123
         cdsParcelaMedicaoAux.Data := ListParcelaMedicao(iIDMedicao);
         //cdsParcelaMedicaoAux.Data := ListParcelaMedicao(FCdsMedicao.FieldByName('IDMedicao').AsFloat);
         cdsParcelaMedicaoAux.First;

         while not cdsParcelaMedicaoAux.Eof do
         begin
            cdsParcelaMedicaoAux.Edit;
            cdsParcelaMedicaoAux.FieldByName('NUMRAD').Clear;
            cdsParcelaMedicaoAux.Post;
            cdsParcelaMedicaoAux.Next;
         end;

         cdsParcelaMedicaoAux.First;

         rCodDocumentoAux := cdsParcelaMedicaoAux.FieldByName('CODDOCUMENTO').AsFloat;
         while not(cdsParcelaMedicaoAux.IsEmpty) do
          cdsParcelaMedicaoAux.Delete;

         cdsParcelaRealAux.Close;
         //Marilza Colpani SOL130441_KTN732123
         //cdsParcelaRealAux.Data := ListParcelaReal(FCdsMedicao.FieldByName('IDMedicao').AsFloat);
         cdsParcelaRealAux.Data := ListParcelaReal(iIDMedicao);
         cdsParcelaRealAux.First;
         while not(cdsParcelaRealAux.IsEmpty) do cdsParcelaRealAux.Delete;
         //Marilza Colpani SOL130441_KTN732123
         //cdsMedicaoxRateioAux.Data := ListMedicaoxRateio(FCdsMedicao.FieldByName('IDMedicao').AsFloat, False);
         cdsMedicaoxRateioAux.Data := ListMedicaoxRateio(iIDMedicao, false);
         while not(cdsMedicaoxRateioAux.IsEmpty) do cdsMedicaoxRateioAux.Delete;

         // Marchetti - Pendencia 16347
         // Encerra o RAD anterior
         FCdsMedicao.First;
         while not FCdsMedicao.Eof do
         begin
            if not FCdsMedicao.FieldByName('NUMRAD').IsNull then begin
               if not CtrlRAD.GravaStatusProcesso( FCdsMedicao.FieldByName('NUMRAD').AsFloat, rsRecusado ) then
                  raise Exception.Create( CtrlRAD.MessageInfo );
            end;
            FCdsMedicao.Edit;
            FCdsMedicao.FieldByName('NUMRAD').Clear;
            FCdsMedicao.Post;


            // SOL 257100 PPM 852753 e SOL 257101 PPM 852764 - Felipe A. Santos e Fernando Xavier - início
            if FCdsMedicao.FieldByName('IDMEDICAO').AsString <> '' then
            begin
              FCdsCtrlParcelaMedicao.Filtered := False;
              FCdsCtrlParcelaMedicao.Filter := ' IDMEDICAO = ' + FCdsMedicao.FieldByName('IDMEDICAO').AsString;
              FCdsCtrlParcelaMedicao.Filtered := True;

              if not(FCdsCtrlParcelaMedicao.IsEmpty) then
              begin
                FCdsCtrlParcelaMedicao.Edit;
                FCdsCtrlParcelaMedicao.FieldByName('IDMEDICAO').AsFloat := 0;
                FCdsCtrlParcelaMedicao.FieldByName('FLGPARCELAMEDIDA').AsFloat := 0;
                FCdsCtrlParcelaMedicao.Post;
              end;

              // Felipe A. Santos SOL 242313/17289 PPM 828977 - início
              CdsANS.Filtered := False;
              CdsANS.Filter := 'IDMEDICAO = ' + FCdsMedicao.FieldByName('IDMEDICAO').AsString;
              CdsANS.Filtered := True;
              CdsANS.First;
              while not(CdsANS.IsEmpty) do CdsANS.Delete;
              // Felipe A. Santos SOL 242313/17289 PPM 828977 - fim

              FCdsCtrlParcelaMedicao.Filtered := False;
            end;

            // SOL 257100 PPM 852753 e SOL 257101 PPM 852764 - Felipe A. Santos e Fernando Xavier - fim

            FCdsMedicao.Next;

         end;

         //---------------------------------------------------------------------
         // Exclui a medição na tabela de controle de alerta
         //---------------------------------------------------------------------

         // Felipe A. Santos SOL 218909/16724 PPM 588170 - início

         // SOL 257100 PPM 852753 e SOL 257101 PPM 852764 - Felipe A. Santos e Fernando Xavier - início - comentário
         {FCdsCtrlParcelaMedicao.First;
         while not(FCdsCtrlParcelaMedicao.Eof) do
         begin
           FCdsCtrlParcelaMedicao.Edit;
           FCdsCtrlParcelaMedicao.FieldByName('IDMEDICAO').AsFloat := 0;
           FCdsCtrlParcelaMedicao.FieldByName('FLGPARCELAMEDIDA').AsFloat := 0;
           FCdsCtrlParcelaMedicao.Post;
           FCdsCtrlParcelaMedicao.Next;
         end; }
         // SOL 257100 PPM 852753 e SOL 257101 PPM 852764 - Felipe A. Santos e Fernando Xavier - fim - comentário

         // Felipe A. Santos SOL 218909/16724 PPM 588170 - fim

         //---------------------------------------------------------------------
         //Exclui medição
         //---------------------------------------------------------------------
         FCdsMedicao.First;
         while not(FCdsMedicao.IsEmpty) do FCdsMedicao.Delete;

         //---------------------------------------------------------------------
         //Aplica Exclusões
         //---------------------------------------------------------------------
         if not ApplyCds(cdsParcelaRealAux,FDbParcelaRealContr,[],[]) then
            raise exception.Create( FDbParcelaRealContr.MessageInfo );

         if not ApplyCds(cdsParcelaMedicaoAux,FDbParcelaMedicao,[],[]) then
            raise exception.Create( FDbParcelaMedicao.MessageInfo );

         if not ApplyCds(cdsMedicaoxRateioAux,FDbMedicaoxRateio,[],[]) then
            raise exception.Create( FDbMedicaoxRateio.MessageInfo );

         // Felipe A. Santos SOL 218909/16724 PPM 588170 - início
         if not ApplyCds(CdsCtrlParcelaMedicao ,FDbCtrlParcelaMedicao,[],[]) then
            raise exception.Create( FDbCtrlParcelaMedicao.MessageInfo );
         // Felipe A. Santos SOL 218909/16724 PPM 588170 - fim

         // Felipe A. Santos SOL 242313/17289 PPM 828977 - início
         if not ApplyCds(CdsANS, FDbContratoANS, [], []) then
            raise exception.Create( FDbContratoANS.MessageInfo);
         // Felipe A. Santos SOL 242313/17289 PPM 828977 - fim

         if not ApplyCds(CdsMedicao,FDbMedicao,[],[]) then
            raise exception.Create( FDbMedicao.MessageInfo );

         if rCodDocumentoAux > 0 then
         begin
            // Exclui o documento
            CtrlDocumento.Prepare( OpDocumento, odlEfetivo );
            CtrlDocumento.CodDocumento  := rCodDocumentoAux;
            CtrlDocumento.IdEspAcesso   := F_rIDEspAcesso;
            CtrlDocumento.IdUsuario     := Trunc(F_rIDUsuario);
            CtrlDocumento.IdModulo      := Trunc(F_rIDModulo);
            CtrlDocumento.UsaPlanoPatro := F_bUsaPlanoPatro;

            //---------------------------------------------------------------------
            //Exclui Documento, seu imposto e sua Contabilização
            //---------------------------------------------------------------------
            if not CtrlDocumento.Delete(True) then
               raise exception.Create( CtrlDocumento.MessageInfo );
         end;
      except
         on E:Exception do begin
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
   finally
      cdsParcelaMedicaoAux.Free;
      cdsParcelaRealAux.Free;
   end;
end;
                                    
function TCtrlMedicao.ListMedicao(rIDMedicao, rIDPessoa: Double): OleVariant;
var
   sSql : String;
begin
   sSql:=' SELECT * FROM (  '+      // Paulo Nobre -  WO15750
         '   SELECT DISTINCT '+
         '   M.IDMEDICAO, '+
         '   M.IDCONTRATO, '+
         '   M.IDPROJETO, '+
         '   M.IDATIVIDADE, '+
         '   M.IDITEM, '+
         '   M.IDOBJETO, '+
         '   M.IDPESSOA, '+
         '   M.DATAPREVMEDICAO, '+
         '   M.DATAMEDICAO, '+
         '   M.MEDICAOAPROVADA, '+
         '   M.QTDEMEDICAO, '+
         '   M.VALORMEDICAO, '+
         '   M.QTDEPREVISTA, '+
         '   M.VALORPREVISTO, '+
         '   M.NUMPARCELAS, '+
         '   M.FREQUENCIA, '+
         '   M.INTERVALO, '+
         '   M.OBSERVACAO, '+
         '   M.HISTORICOCOMPL, '+
         '   M.IDRESERVAORCAMEN, '+
         '   NVL(M.FLGESTORNADO,0) AS FLGESTORNADO, '+
         '   M.NUMRAD, '+

          // Felipe A. Santos SOL 218909/16724 PPM 588170 - início
         '   NVL(CPM.PARCELANUM,0) AS PARCELANUM, '  +
         '   CPM.IDPARCMEDICAO, ' +
         '   CPM.IDADITAMENTO, ' +
         '   CPM.VENCIMENTO, ' +
         '   OI.NUMPARCELAS AS NUMPARC2, ' +
          // Felipe A. Santos SOL 218909/16724 PPM 588170 - fim

         '   PM.DATAPREVISTAVENC, '+
         '   DECODE(M.DATALANCAMENTO, NULL,LD.DATALANCTO, M.DATALANCAMENTO) AS DATALANCAMENTO, '+
         '   PM.CODDOCUMENTO, '+
         '   I.NOME_ITEM, '+

         // Paulo Nobre -  WO15750 - Inicio
//         '   O.NOMEOBJETO, '+
         '   CASE               ' +
         '     WHEN NVL(CPM.IDADITAMENTO, 0) = 0 THEN (''Contrato - '' || O.NOMEOBJETO)  ' +
         '     ELSE (''Aditamento - '' || O.NOMEOBJETO ) ' +
         '   END AS NOMEOBJETO,                     ' +
         // Paulo Nobre -  WO15750 - Fim

//SIG61347 - Peterson Victor - INICIO
         '   M.VALORMEDICAO AS VALORUNITARIOOBJETO, '+
 //        '   OI.VALORUNITARIOOBJETO,'+
//SIG61347 - Peterson Victor - FIM

         '   OI.MOECODIGO, '+
         '   C.NOMECONTRATO, '+
         '   C.IDFORCLI , '+
         '   C.TIPOCONTRATO, '+
         //'   C.CODPORTFORMA, '+                                        //SIG82259
         '   COALESCE(C.CODPORTFORMA, D.CODPORTFORMA) AS CODPORTFORMA, '+//SIG82259
         '   C.CODCONTRATOEMPR, '+
         '   CTA.CONTACORRENTE, '+
         '   CTA.NUMBANCO, '+
         '   CTA.NUMAGENCIA, '+
         '   CTA.TIPOCONTA, '+
         '   DECODE(M.IDCBANCARIA,NULL,CTA.IDCBANCARIA,M.IDCBANCARIA) AS IDCBANCARIA, '+
         '   CTA.DESCTIPOCONTA, '+
         '   CTA.NOMEAGENCIA, '+
         '   CTA.NOMEBANCO, '+
         '   DECODE(M.NODOCUMENTO,NULL,D.NODOCUMENTO,M.NODOCUMENTO) AS NODOCUMENTO, '+
         '   DECODE(M.COMPLDOCUMENTO,NULL,D.COMPLDOCUMENTO, M.COMPLDOCUMENTO) AS COMPLDOCUMENTO, '+
         '   DECODE(M.OBS,NULL,D.OBS,M.OBS) AS OBS, '+
         '   DECODE(M.NUMLEITCODBARRAS,NULL,D.NUMLEITCODBARRAS,M.NUMLEITCODBARRAS) AS NUMLEITCODBARRAS, '+
         '   DECODE(M.NUMDIGCODBARRAS,NULL,D.NUMDIGCODBARRAS,M.NUMDIGCODBARRAS) AS NUMDIGCODBARRAS, '+
         '   DECODE(M.CODFORMA,NULL,D.CODFORMA,M.CODFORMA) AS CODFORMA, '+

         // Marchetti - Pendencia 16957
         'DECODE(M.FLGESTORNADO,NULL, ''Ativa'',DECODE(M.FLGESTORNADO,0,''Ativa'',''Estornada'')) AS STATUS,  '+
         // Fim - Marchetti - Pendencia 16957

         '   C.FLGANS ' + // Felipe A. Santos SOL 242313/17289 PPM 828977

		 //Cássio Rovaroto - SIG nº 23656.58469 - Início
         //'   , M.IDTIPOSERVICO, '+ //Cássio Rovaroto - SIG nº 115585
         //'   M.IDPROCESSOSUSP, '+ //Cássio Rovaroto - SIG nº 115585
         '   , D.NFSNUMERO, '+
         '   D.NFSSERIE, '+
         '   D.NFSDATAEMISSAO, '+
         '   D.NFSOBS '+
         //Cássio Rovaroto - SIG nº 23656.58469 - Fim
         ' , D.NFSSERVICO ' + //Cássio Rovaroto - SIG nº 133236
         ' , LS.CODNATUREZAREINF ' + //Cássio Rovaroto - SIG nº 133236
         ' , M.MES_REFERENCIA '+
         ' , M.ANO_REFERENCIA '+
         ' , D.FLGSIMPLES ' + // Cássio Rovaroto - SIG nº 136888

         ' , C.FLG_TP_VLR_ORCADO_APROVADO ' + // Paulo Nobre -  WO15653

         'FROM '+
         '   MEDICAO M, '+
         '   ITEMCONTRATUAL I, '+
         '   OBJETOCONTRATUAL O, '+
         '   OBJETOSXITEMCONTR OI, '+
         '   PARCELAMEDICAO PM, '+
         '   CONTRATOCONTR C , '+
         '   DOCUMENTO D, '+
         '   LANCTODOCUM LD, '+
         '   CTRLPARCELAMEDICAO CPM, ' + // Felipe A. Santos SOL 218909/16724 PPM 588170
         '   LISTA_SERVICOS LS , ' + //Cássio Rovaroto -  Nº 133236
         '  (SELECT '+
         '      C.CONTACORRENTE, '+
         '      B.NUMBANCO, '+
         '      A.NUMAGENCIA, '+
         '      C.TIPOCONTA, '+
         '      C.IDCBANCARIA, '+
         '      DECODE(C.TIPOCONTA,''1'',''Conta Corrente'','+
                                  '''2'',''Cartão Salário'','+
                                  '''3'',''Conta Poupança'','''') AS DESCTIPOCONTA, '+
         '      DECODE(PA.RAZAOSOCIAL,NULL,PA.NOME,PA.RAZAOSOCIAL) AS NOMEAGENCIA, '+
         '      DECODE(PB.RAZAOSOCIAL,NULL,PB.NOME,PB.RAZAOSOCIAL) AS NOMEBANCO, '+
         '      CL.IDMEDICAO '+
         '   FROM '+
         '      PESSOA PA, '+
         '      PESSOA PB, '+
         '      CONTABANCARIA C, '+
         '      AGENCIABANCARIA A, '+
         '      BANCO B, '+
         '     (SELECT C1.IDFORCLI, MED.IDMEDICAO, MED.IDCBANCARIA '+
         '      FROM CONTRATOCONTR C1, MEDICAO MED '+
         '      WHERE (MED.IDCONTRATO = C1.IDCONTRATO) AND '+
         '            (MED.IDMEDICAO = '+FloatToStr(rIDMedicao)+')) CL '+
         '   WHERE '+
         '      (C.IDPESSOA = CL.IDFORCLI) AND '+
         '      (C.FLGCONTAPREF = 1) AND '+
         '      (C.IDAGENCIA = A.IDPESSOA) AND '+
         '      (A.IDBANCO = B.IDPESSOA) AND '+
         '      (A.IDPESSOA = PA.IDPESSOA) AND '+
         '      (CL.IDCBANCARIA = C.IDCBANCARIA(+)) AND '+
         '      (B.IDPESSOA = PB.IDPESSOA)) CTA '+
         'WHERE '+
         '   (M.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
         '   (M.IDMEDICAO = PM.IDMEDICAO) AND '+
         '   (M.IDITEM = I.IDITEM) AND '+
         '   (M.IDOBJETO = O.IDOBJETO) AND '+
         '   (M.IDITEM = OI.IDITEM) AND '+
         '   (M.IDOBJETO = OI.IDOBJETO) AND '+
         '   (M.IDCONTRATO = OI.IDCONTRATO) AND '+
         '   (M.IDCONTRATO = C.IDCONTRATO(+)) AND '+
         '   (M.IDMEDICAO = CPM.IDMEDICAO(+)) AND ' + // Felipe A. Santos SOL 218909/16724 PPM 588170
         '   (M.IDPESSOA = C.IDPESSOA) AND '+
         '   (M.IDMEDICAO = CTA.IDMEDICAO(+)) AND '+
         '   (PM.CODDOCUMENTO = D.CODDOCUMENTO(+)) AND '+
         '   (PM.CODDOCUMENTO = LD.CODDOCUMENTO(+)) AND '+
         '   ((PM.CODDOCUMENTO IS NULL) OR (PM.CODDOCUMENTO IS NOT NULL AND RTRIM(LD.OPERACAO) = ''2'')) AND '+
         '   ((PM.CODDOCUMENTO IS NULL AND PM.NUMRAD = (SELECT DISTINCT PM1.NUMRAD '+
         '                                              FROM PARCELAMEDICAO PM1 '+
         '                                              WHERE PM1.IDMEDICAO = '+FloatToStr(rIDMedicao)+')) OR ' +
         '   (PM.CODDOCUMENTO = (SELECT PM1.CODDOCUMENTO '+
         '                       FROM PARCELAMEDICAO PM1 '+
         '                       WHERE (PM1.IDMEDICAO = '+FloatToStr(rIDMedicao)+')))) '+
         '   AND (D.NFSSERVICO = LS.IDSERVICO (+)) ' + //Cássio Rovaroto - SIG nº 133236

         ' ) ORDER BY NOME_ITEM, NOMEOBJETO ';  // Paulo Nobre -  WO15750

   Result:=GetDataPacket(sSql);
end;


function TCtrlMedicao.ListMedicaoxRateio(rIdMedicao: Double; bIncluiItemSemMedicao:Boolean): OleVariant;
var sSql : String;
begin
   sSql := 'SELECT MR.IDMEDICAOXRATEIO, MR.IDMEDICAO,   MR.CODCENTROCUSTO, '+#13+
           '       MR.IDPROGRAMA,       MR.IDPESSOA,    MR.UNIDNEGOC,      '+#13+
           '       MR.IDPATRO,          MR.IDPLANOPREV, MR.IDEMPRESA,      '+#13+
           '       MR.DIVISOR,          MR.VLRRATEIO AS PERCRATEIOCONTR,   '+#13+
           '       M.IDCONTRATO,        M.IDOBJETO,     M.IDITEM,          '+#13+
           '       PR.DESCPROGRAMA AS NOMEPROG,   '+#13+
           '       CC.NOME AS DESCCC,             '+#13+
           '       PA.RAZAOSOCIAL AS NOME_PATRO,  '+#13+
           '       PL.NOME AS NOME_PLANO,         '+#13+
           '       UN.NOME AS NOME_UNIDNEGOCIO    '+#13+

           ', OI.PLACONTA       '+#13+//Bruno Bastos - Pend. 15867 - 24/11/2004
           ', MR.ID_FDO         '+#13+    //edilaine SIG115595
           ', FDO.COD_FDO       '+#13+    //edilaine SIG115595
           //Thiago Melo SOL 238060 PPM 496839
           ', OI.PLANO          ' +#13+
           ', 0 AS PLANOORIGEM  ' +#13+
           ', 0 AS PATROORIGEM  ' +#13+
           ', 0 AS IDDESPESAORC ' +#13+
           //', TR.CODTIPRECDES   ' +#13+                                        //edilaine SIG115595
           ', NVL(FDO.CODTIPRECDES, TR.CODTIPRECDES) AS CODTIPRECDES ' +#13+     //edilaine SIG115595
           //Thiago Melo SOL 238060 PPM 496839
           //', NVL(TR.PLACONTACREDITO, E.CONTACFORN) AS CONTA '+#13+//Bruno Bastos - Pend. 15867 - 24/11/2004   //edilaine SIG115595
           ', DECODE(MR.ID_FDO, NULL, NVL(TR.PLACONTACREDITO, E.CONTACFORN), FDO.CONTAC) AS CONTA '+#13+         //edilaine SIG115595
           ', 0 as TIPODESPESA '+#13+ //Petri Nocentini SOl 253522 PPM 781892
           ', CPM.PARCELANUM ' +//Petri SOL 257896 PPM 1014759
           '  FROM MEDICAOXRATEIO MR, '+#13+
           '       MEDICAO M,         '+#13+
           '       PARCELAMEDICAO PM, '+#13+
           '       CENTCUST CC, PESSOA PA, PLANPREVCONTABIL PL, '+#13+
           '       PROGRAMA PR, UNIDNEGOCIO UN, '+#13+

           //edilaine SIG115595 : inicio
           '       (SELECT FDD.COD_FDO, FDD.ID_FDO, CC.IDPROGRAMA,   '+#13+
           '               FDI.ID_ATIVIDADE_PROJETO  AS UNIDNEGOC,   '+#13+
           '               DES.CODIGO          AS CODTIPRECDES,      '+#13+
           '               FDI.ID_CENTRO_CUSTO AS CODCENTROCUSTO,    '+#13+
           '               FDI.VALOR_ITEM      AS PERCRATEIOCONTR,   '+#13+
           '               FDI.CONTA_CREDITO   AS CONTAC,            '+#13+
           '               FDI.CONTA_DEBITO    AS CONTAD             '+#13+
           '          FROM USER_INTEGRACAO_ORCAMENTARIA.FDO_DIGITAL           FDD  '+#13+
           '          JOIN USER_INTEGRACAO_ORCAMENTARIA.FDO_ITEM_ORCAMENTARIO FDI  '+#13+
           '            ON FDD.ID_FDO = FDI.ID_FDO                                 '+#13+
           // Paulo Nobre - B_MIGRACAO_ORACLE_2025 - Inicio
           '          LEFT JOIN USER_INTEGRACAO_ORCAMENTARIA.VW_FDO_DESEMBOLSO     DES  '+#13+
           '            ON FDI.ID_DESEMBOLSO = DES.IDTIPORDXCCXCONTA               '+#13+
           // Paulo Nobre - B_MIGRACAO_ORACLE_2025 - Fim
           '          JOIN CENTCUST CC ON CC.CODCENTROCUSTO = FDI.ID_CENTRO_CUSTO  '+#13+
           '       ) FDO,                                                           '+#13+
           //edilaine SIG115595 : fim

           '       OBJETOXITEM OI, TIPORECEBDESEMB TR, CONTRATOCONTR C, '+#13+//Bruno Bastos - Pend. 15867 - 24/11/2004
           '       EMPRESAFORN E, '+#13+//Bruno Bastos - Pend. 15867 - 24/11/2004
           '       CTRLPARCELAMEDICAO CPM, ' +    //Petri SOL 257896 PPM 1014759
           '       (SELECT CODDOCUMENTO   '+#13+
           '        FROM PARCELAMEDICAO ' + #13+
           '        WHERE IDMEDICAO = ' + FloatToStr(rIdMedicao) + ' ) PM1 '+#13+
           ' WHERE MR.IDMEDICAO      = PM.IDMEDICAO           '+#13+
           '   AND MR.IDMEDICAO      = M.IDMEDICAO            '+#13+

//           '   AND MR.ID_FDO(+)      = FDO.ID_FDO             '+#13+    //edilaine SIG115595
           '   AND MR.ID_FDO      = FDO.ID_FDO (+)            '+#13+    //Ewerton Beltramini - SIG 117136

           //Bruno Bastos - Pend. 15867 - 24/11/2004 - Início
           ' AND M.IDITEM            = OI.IDITEM              '+#13+
           ' AND M.IDMEDICAO         = CPM.IDMEDICAO(+)       '+#13+    //Petri SOL 257896 PPM 1014759
           ' AND M.IDOBJETO          = OI.IDOBJETO            '+#13+
           ' AND OI.IDPESSOA         = TR.IDPESSOA(+)         '+#13+
           ' AND OI.CODTIPRECDES     = TR.CODTIPRECDES(+)     '+#13+
           ' AND OI.RECPAG           = TR.RECPAG(+)           '+#13+
           ' AND M.IDCONTRATO        = C.IDCONTRATO           '+#13+
           ' AND C.IDFORCLI          = E.IDFORCLI             '+#13+
           ' AND E.IDPESSOA          = M.IDPESSOA             '+#13+
           //Bruno Bastos - Pend. 15867 - 24/11/2004 - Fim

           '   AND MR.IDEMPRESA      = CC.IDEMPRESA(+)        '+#13+
           '   AND MR.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)   '+#13+
           '   AND MR.IDPROGRAMA     = PR.IDPROGRAMA(+)       '+#13+
           '   AND MR.IDPATRO        = PA.IDPESSOA(+)         '+#13+
           '   AND MR.IDPLANOPREV    = PL.IDPLANOPREV(+)      '+#13+
           '   AND MR.IDPESSOA       = UN.IDPESSOA(+)         '+#13+
           '   AND MR.UNIDNEGOC      = UN.UNIDNEGOC(+)        '+#13+
           '   AND '+#13+
           '   ((PM.CODDOCUMENTO IS NULL AND PM.NUMRAD = (SELECT DISTINCT NUMRAD FROM PARCELAMEDICAO WHERE IDMEDICAO = ' + FloatToStr(rIdMedicao) + ')) '+ #13 +
           '   OR ' + #13 +
           '    PM.CODDOCUMENTO   = PM1.CODDOCUMENTO ' + #13 +
           '   ) '+ #13;

   if bIncluiItemSemMedicao then begin

   // Define Sql
   sSql := sSql + ' UNION '+#13+
           'SELECT 0 AS IDMEDICAOXRATEIO, ' +FloatToStr(rIdMedicao)+ ' AS IDMEDICAO, R.CODCENTROCUSTO,'+#13+
           '       R.IDPROGRAMA,          R.IDPESSOA,        R.UNIDNEGOC,      '+#13+
           '       R.IDPATRO,             R.IDPLANOPREV,     R.IDEMPRESA,      '+#13+
           '       ''P'' AS DIVISOR,      R.PERCRATEIOCONTR,                   '+#13+
           '       R.IDCONTRATO,          R.IDOBJETO,        R.IDITEM,         '+#13+
           '       PR.DESCPROGRAMA AS NOMEPROG,  '+#13+
           '       CC.NOME AS DESCCC,            '+#13+
           '       PA.RAZAOSOCIAL AS NOME_PATRO, '+#13+
           '       PL.NOME AS NOME_PLANO,        '+#13+
           '       UN.NOME AS NOME_UNIDNEGOCIO   '+#13+

           ', OI.PLACONTA       '+#13+//Bruno Bastos - Pend. 15867 - 24/11/2004
           ', 0 AS ID_FDO       '+#13+    //edilaine SIG115595
           ', ''                              '' as COD_FDO       '+#13+    //edilaine SIG115595
           //Thiago Melo SOL 238060 PPM 496839
           ', OI.PLANO         ' +#13+
           ', 0 AS PLANOORIGEM ' +#13+
           ', 0 AS PATROORIGEM ' +#13+
           ', R.IDDESPESAORC   ' +#13+
           ', TR.CODTIPRECDES  ' +#13+
           //Thiago Melo SOL 238060 PPM 496839
           ', NVL(TR.PLACONTACREDITO, E.CONTACFORN) AS CONTA '+#13+//Bruno Bastos - Pend. 15867 - 24/11/2004
           ', 0 as TIPODESPESA '+#13+ //Petri Nocentini SOL 253522 PPM 781892
           ', 0 AS PARCELANUM ' +    //Petri SOL 257896 PPM 1014759 
           '  FROM RATEIOCENTROCUSTO R,                         '+#13+
           '       PESSOA PA, PLANPREVCONTABIL PL, CENTCUST CC, '+#13+
           '       PROGRAMA PR, UNIDNEGOCIO UN                  '+#13+
           '     , OBJETOXITEM OI, TIPORECEBDESEMB TR, CONTRATOCONTR C, '+#13+//Bruno Bastos - Pend. 15867 - 24/11/2004
           '       EMPRESAFORN E '+#13+//Bruno Bastos - Pend. 15867 - 24/11/2004
           ' WHERE R.IDEMPRESA      = CC.IDEMPRESA ' + #13 +
           '    AND R.CODCENTROCUSTO = CC.CODCENTROCUSTO ' + #13 +
           '    AND R.IDPROGRAMA     = PR.IDPROGRAMA(+) ' + #13 +
           '    AND R.IDPATRO        = PA.IDPESSOA(+) ' + #13 +
           '    AND R.IDPLANOPREV    = PL.IDPLANOPREV(+) ' + #13 +
           '    AND R.IDPESSOA       = UN.IDPESSOA(+) ' + #13 +

           //Bruno Bastos - Pend. 15867 - 24/11/2004 - Início
           '   AND R.IDITEM         = OI.IDITEM '+
           '   AND R.IDOBJETO       = OI.IDOBJETO '+
           '   AND OI.IDPESSOA      = TR.IDPESSOA(+) '+
           '   AND OI.CODTIPRECDES  = TR.CODTIPRECDES(+) '+
           '   AND OI.RECPAG        = TR.RECPAG(+) '+
           '   AND R.IDCONTRATO     = C.IDCONTRATO '+
           '   AND C.IDFORCLI       = E.IDFORCLI '+
           '   AND E.IDPESSOA       = R.IDEMPRESA '+
           //Bruno Bastos - Pend. 15867 - 24/11/2004 - Fim

           '    AND R.UNIDNEGOC      = UN.UNIDNEGOC(+) ' + #13 +
           '    AND R.IDCONTRATO     IN (SELECT DISTINCT IDCONTRATO ' + #13 +
           '                              FROM MEDICAO ' + #13 +
           '                             WHERE IDMEDICAO IN (SELECT PM.IDMEDICAO FROM PARCELAMEDICAO PM ' + #13 +
           '                                                 WHERE ' + #13 +
           '                                                     (PM.CODDOCUMENTO IS NULL AND PM.NUMRAD = (SELECT DISTINCT NUMRAD ' + #13 +
           '                                                                                                FROM   PARCELAMEDICAO ' + #13 +
           '                                                                                                WHERE IDMEDICAO = '+FloatToStr(rIdMedicao)+
           '                                                                                               )) ' + #13 +
           '                                                   OR ' + #13 +
           '                                                       PM.CODDOCUMENTO = (SELECT CODDOCUMENTO ' + #13 +
           '                                                                          FROM PARCELAMEDICAO WHERE IDMEDICAO = '+FloatToStr(rIdMedicao)+
           '                                                                         ) ' + #13 +
           '                                                 ) ) ' + #13 +
           '    AND TO_CHAR(R.IDOBJETO) || TO_CHAR(R.IDITEM) NOT IN ' + #13 +
           '                           (SELECT DISTINCT TO_CHAR(IDOBJETO) || TO_CHAR(IDITEM) ' + #13 +
           '                              FROM MEDICAO ' + #13 +
           '                             WHERE IDMEDICAO IN (SELECT PM.IDMEDICAO FROM PARCELAMEDICAO PM ' + #13 +
           '                                                 WHERE ' + #13 +
           '                                                     (PM.CODDOCUMENTO IS NULL AND PM.NUMRAD = (SELECT DISTINCT NUMRAD ' + #13 +
           '                                                                                                FROM   PARCELAMEDICAO ' + #13 +
           '                                                                                                WHERE IDMEDICAO = '+FloatToStr(rIdMedicao)+
           '                                                                                               )) ' + #13 +
           '                                                   OR ' + #13 +
           '                                                       PM.CODDOCUMENTO = (SELECT CODDOCUMENTO ' + #13 +
           '                                                                          FROM PARCELAMEDICAO WHERE IDMEDICAO = '+FloatToStr(rIdMedicao)+
           '                                                                         ) ' + #13 +
           '                                                 ) ' + #13 +
           ' ) ' + #13;
   end;
   sSql := sSql + ' ORDER BY IDOBJETO, IDITEM, DESCCC ';


   Result := GetDataPacket( sSql );
end;


function TCtrlMedicao.ListParcelaMedicao(rIDMedicao: Double): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT '+
         '   PM.* '+
         'FROM '+
         'PARCELAMEDICAO PM '+
         'WHERE '+
         '((PM.CODDOCUMENTO IS NULL AND PM.NUMRAD = (SELECT DISTINCT NUMRAD '+
         '                                           FROM PARCELAMEDICAO '+
         '                                           WHERE IDMEDICAO = ' + FloatToStr(rIDMedicao) + ')) OR ' +
         ' (PM.CODDOCUMENTO = (SELECT CODDOCUMENTO ' +
         '                     FROM PARCELAMEDICAO ' +
         '                     WHERE IDMEDICAO = '+ FloatToStr(rIDMedicao)+ '))) ';
   Result:=GetDataPacket(sSql);
end;

function TCtrlMedicao.ListParcelaReal(rIDMedicao: Double): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT '+
         '    PR.*, '+
         '    CPM.PARCELANUM ' + // Felipe A. Santos SOL 218909/16724 PPM 588170
         'FROM '+
         '    PARCELAREALCONTR PR, '+
         '    CTRLPARCELAMEDICAO CPM, ' +  // Felipe A. Santos SOL 218909/16724 PPM 588170
         '    (SELECT '+
         '         IDMEDICAO '+
         '     FROM '+
         '         PARCELAMEDICAO '+
         '     WHERE '+
         '         (CODDOCUMENTO IS NULL AND NUMRAD = (SELECT DISTINCT NUMRAD '+
         '                                            FROM PARCELAMEDICAO '+
         '                                            WHERE IDMEDICAO = '+FloatToStr(rIDMedicao)+'))'+
         '     OR '+
         '         (CODDOCUMENTO = (SELECT CODDOCUMENTO '+
         '                          FROM PARCELAMEDICAO '+
         '                          WHERE IDMEDICAO = '+FloatToStr(rIDMedicao)+')) '+
         '    ) PM '+
         'WHERE '+
         '    PR.IDMEDICAO = PM.IDMEDICAO ' +
         '    AND PM.IDMEDICAO = CPM.IDMEDICAO(+)';  // Felipe A. Santos SOL 218909/16724 PPM 588170;

   Result:=GetDataPacket(sSql);
end;

function TCtrlMedicao.ListParcelaXDoc(rCodDocumento: Double): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT * FROM PARCELAREALCONTR WHERE (CODDOCUMENTO = '+FloatToStr(rCodDocumento)+') ';
   Result:=GetDataPacket(sSql);
end;

function TCtrlMedicao.ListContratoMedicao(rIDContrato: Double): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT '+
         '   C.IDCONTRATO, '+
         '   C.CODCONTRATOEMPR, '+
         '   C.CODCENTRORESPON, '+
         '   C.TIPOCONTRATO, '+
         '   C.CODPORTFORMA, '+
         '   C.IDFORCLI, '+
         '   C.CODTIPDOC, '+
         '   O.MOECODIGO, '+
         '   O.DATAINICIOCOBR, '+
         '   O.OBSERVACAO, '+
         '   O.IDITEM, '+
         '   O.IDOBJETO, '+
         '   OI.CODTIPRECDES, '+
         '   OI.RECPAG, '+
         '   OI.CODSUBCONTA, '+
         '   OI.PLACONTA, '+
         '   TR.PLACONTACREDITO, '+//Bruno Bastos - Pend. 17963 - 19/10/2004
         '   TR.ATIVO AS RECDES_ATIVO '+
         '   , NVL(CPM.PARCELANUM, 0) AS PARCELANUM ' + // Felipe A. Santos SOL 265181 PPM 1166774 
         'FROM '+
         '   CONTRATOCONTR C, '+
         '   OBJETOSXITEMCONTR O, '+
         '   OBJETOXITEM OI, '+
         '   TIPORECEBDESEMB TR '+
         '   , CTRLPARCELAMEDICAO CPM ' + // Felipe A. Santos SOL 265181 PPM 1166774
         'WHERE '+
         '   (OI.IDPESSOA = TR.IDPESSOA(+)) AND '+
         '   (OI.CODTIPRECDES = TR.CODTIPRECDES(+)) AND '+
         '   (OI.RECPAG = TR.RECPAG(+)) AND '+
         '   (O.IDCONTRATO = '+FloatToStr(rIDContrato)+') AND '+
         '   (C.IDCONTRATO = O.IDCONTRATO) AND '+
         '   (O.IDOBJETO = OI.IDOBJETO) AND '+
         '   (O.IDITEM = OI.IDITEM) ' +
         // Felipe A. Santos SOL 265181 PPM 1166774 = início
         '    AND O.IDCONTRATO = CPM.IDCONTRATO(+) ' +
         '    AND O.IDITEM = CPM.IDITEM(+) ' +
         '    AND O.IDOBJETO = CPM.IDOBJETO(+) ' +
         '    AND NVL(CPM.IDADITAMENTO,0) = (SELECT NVL(MAX(IDADITAMENTO),0)  FROM CTRLPARCELAMEDICAO CPM2 ' +
         '                                  where CPM2.IDCONTRATO = O.IDCONTRATO ' +
         '                                    AND CPM2.IDITEM = O.IDITEM ' +
         '                                    AND CPM2.IDOBJETO = O.IDOBJETO) ';
         // Felipe A. Santos SOL 265181 PPM 1166774 - fim
   Result:=GetDataPacket(sSql);
end;


function TCtrlMedicao.IntegraOrcamento(iIdReservaOrcamen: Int64; fValor: Double): Boolean;
var
  iNumCompromisso, iRetorno: integer;
begin
// Marcio Motta - 21/05/2004 - 16347
  iRetorno := 0;
  Result   := True;
  try
    CtrlOrcamento.IdEmpresa  := Trunc(F_rIDPessoa);
    CtrlOrcamento.IdUsuario  := Trunc(F_rIDUsuario);
    CtrlOrcamento.IdReserva  := iIdReservaOrcamen;
    CtrlOrcamento.NumReserva := CtrlOrcamento.BuscaIdNumReserva(CtrlOrcamento.IdReserva, 0, True);

    if CtrlOrcamento.NumReserva <= 0 then
      raise Exception.Create( CtrlOrcamento.MessageInfo );

    iNumCompromisso := CtrlOrcamento.NumReserva;
    iRetorno := CtrlOrcamento.EfetivaCompromisso(iNumCompromisso, fValor, True);

    if iRetorno > 0 then
      raise Exception.Create( CtrlOrcamento.MessageInfo );

   except
     on e:Exception do begin
       Result := False;
       MessageInfo := e.Message;
      end;
   end;
end;

function TCtrlMedicao.EstornaMedicao: Boolean;
var
   cdsParcelaMedicaoAux : TCMClientDataSet;
   cdsParcelaRealAux    : TCMClientDataSet;
   cdsMedicaoxRateioAux : TCMClientDataSet;
   cdsAux               : TCMClientDataSet;
   iNumLanc             : Integer;
   rCodDocumento        : Int64;
   BM : TBookMark;
begin
   Result           := True;
   MessageInfo      := '';
   rCodDocumento    := 0;
   try
      try
         cdsParcelaMedicaoAux := TCMClientDataSet.Create(nil);
         cdsParcelaRealAux    := TCMClientDataSet.Create(nil);
         cdsMedicaoxRateioAux := TCMClientDataSet.Create(nil);
         cdsAux               := TCMClientDataSet.Create(nil);

         FCdsMedicao.First;
         //---------------------------------------------------------------------
         //Estorna parcela Real
         //---------------------------------------------------------------------
         cdsParcelaMedicaoAux.Close;
         cdsParcelaMedicaoAux.Data := ListParcelaMedicao(FCdsMedicao.FieldByName('IDMedicao').AsFloat);
         cdsParcelaMedicaoAux.First;
         rCodDocumento := cdsParcelaMedicaoAux.FieldByName('CODDOCUMENTO').AsInteger;

         iNumLanc := 0;

         cdsAux.Data := GetDataPacket('SELECT STATUS FROM DOCUMENTO WHERE CODDOCUMENTO = ' + IntToStr(rCodDocumento));

         if (not cdsAux.IsEmpty) and (cdsAux.FieldByName('STATUS').AsInteger = 2) then
         begin
            MessageInfo := 'Documento já está baixado. Não é possível efetuar estorno!';
            raise exception.Create( MessageInfo );
         end;

         cdsParcelaRealAux.Close;
         cdsParcelaRealAux.Data := ListParcelaReal(FCdsMedicao.FieldByName('IDMedicao').AsFloat);
         cdsParcelaRealAux.First;
         while not(cdsParcelaRealAux.Eof) do
         begin
            // Felipe A. Santos SOL 218909/16724 PPM 588170 - início
            // pega a ultima parcela de cada objeto para estornar
            cdsParcelaRealAux.Locate('IDCONTRATO;IDOBJETO;IDITEM;PARCELANUM', VarArrayOf([cdsParcelaRealAux.FieldByName('IDCONTRATO').AsInteger,
                                                                                          cdsParcelaRealAux.FieldByName('IDOBJETO').AsInteger,
                                                                                          cdsParcelaRealAux.FieldByName('IDITEM').AsInteger,
                                                                                          GetUltimaParcelaParaEstorno(
                                                                                          cdsParcelaRealAux.FieldByName('IDCONTRATO').AsInteger,
                                                                                          cdsParcelaRealAux.FieldByName('IDOBJETO').AsInteger,
                                                                                          cdsParcelaRealAux.FieldByName('IDITEM').AsInteger
                                                                                          )]), []);
            // Felipe A. Santos SOL 218909/16724 PPM 588170 - fim

            cdsParcelaRealAux.Edit;
            cdsParcelaRealAux.FieldByName('FLGESTORNADO').AsInteger := 1;
            cdsParcelaRealAux.Post;
            cdsParcelaRealAux.Next;
         end;
         //---------------------------------------------------------------------
         //Estorna medição no controle de alertas
         //---------------------------------------------------------------------

         FCdsCtrlParcelaMedicao.First;
         while not(FCdsCtrlParcelaMedicao.Eof) do
         begin
            // Felipe A. Santos SOL 218909/16724 PPM 588170 - início
            // pega a ultima parcela de cada objeto para estornar
            FCdsCtrlParcelaMedicao.Locate('IDCONTRATO;IDOBJETO;IDITEM;PARCELANUM', VarArrayOf([FCdsCtrlParcelaMedicao.FieldByName('IDCONTRATO').AsInteger,
                                                                                              FCdsCtrlParcelaMedicao.FieldByName('IDOBJETO').AsInteger,
                                                                                              FCdsCtrlParcelaMedicao.FieldByName('IDITEM').AsInteger,
                                                                                              GetUltimaParcelaParaEstorno(
                                                                                              FCdsCtrlParcelaMedicao.FieldByName('IDCONTRATO').AsInteger,
                                                                                              FCdsCtrlParcelaMedicao.FieldByName('IDOBJETO').AsInteger,
                                                                                              FCdsCtrlParcelaMedicao.FieldByName('IDITEM').AsInteger
                                                                                    )]), []);
            // Felipe A. Santos SOL 218909/16724 PPM 588170 - fim

            FCdsCtrlParcelaMedicao.Edit;
            FCdsCtrlParcelaMedicao.FieldByName('FLGPARCELAMEDIDA').AsFloat := 0;
            FCdsCtrlParcelaMedicao.Post;
            FCdsCtrlParcelaMedicao.Next;
         end;


         //---------------------------------------------------------------------
         //Estorna medição
         //---------------------------------------------------------------------

         FCdsMedicao.First;
         while not(FCdsMedicao.Eof) do
         begin
            // Felipe A. Santos SOL 218909/16724 PPM 588170 - início
            // pega a ultima parcela de cada objeto para estornar
            FCdsMedicao.Locate('IDCONTRATO;IDOBJETO;IDITEM;PARCELANUM', VarArrayOf([FCdsMedicao.FieldByName('IDCONTRATO').AsInteger,
                                                                                    FCdsMedicao.FieldByName('IDOBJETO').AsInteger,
                                                                                    FCdsMedicao.FieldByName('IDITEM').AsInteger,
                                                                                    GetUltimaParcelaParaEstorno(
                                                                                    FCdsMedicao.FieldByName('IDCONTRATO').AsInteger,
                                                                                    FCdsMedicao.FieldByName('IDOBJETO').AsInteger,
                                                                                    FCdsMedicao.FieldByName('IDITEM').AsInteger
                                                                                    )]), []);
            // Felipe A. Santos SOL 218909/16724 PPM 588170 - fim

            FCdsMedicao.Edit;
            FCdsMedicao.FieldByName('FLGESTORNADO').AsInteger := 1;
            FCdsMedicao.Post;

            // Felipe A. Santos SOL 242313/17289 PPM 828977 - início
            if (FCdsMedicao.FieldByName('IDMEDICAO').AsString <> '') then
            begin
              CdsANS.Filtered := False;
              CdsANS.Filter := 'IDMEDICAO = ' + FCdsMedicao.FieldByName('IDMEDICAO').AsString;
              CdsANS.Filtered := True;
              CdsANS.First;
              while not(CdsANS.IsEmpty) do CdsANS.Delete;
            end;
            // Felipe A. Santos SOL 242313/17289 PPM 828977 - fim

            FCdsMedicao.Next;
         end;

         //---------------------------------------------------------------------
         //Aplica Exclusões
         //---------------------------------------------------------------------
         if not ApplyCds(cdsParcelaRealAux,FDbParcelaRealContr,[],[]) then
            raise exception.Create( FDbParcelaRealContr.MessageInfo );

         // Felipe A. Santos SOL 218909/16724 PPM 588170 - início
         if not ApplyCds(CdsCtrlParcelaMedicao,FDbCtrlParcelaMedicao,[],[]) then
            raise exception.Create( FDbCtrlParcelaMedicao.MessageInfo );
         // Felipe A. Santos SOL 218909/16724 PPM 588170 - fim

         // Felipe A. Santos SOL 242313/17289 PPM 828977 - início
         if not ApplyCds(CdsANS, FDbContratoANS, [], []) then
            raise exception.Create( FDbContratoANS.MessageInfo);
         // Felipe A. Santos SOL 242313/17289 PPM 828977 - fim

         if not ApplyCds(CdsMedicao,FDbMedicao,[],[]) then
            raise exception.Create( FDbMedicao.MessageInfo );

         // Estorna o documento
         CtrlDocumento.Prepare( OpDocumento, odlEfetivo );
         CtrlDocumento.CodDocumento  := rCodDocumento;
         CtrlDocumento.IdEspAcesso   := F_rIDEspAcesso;
         CtrlDocumento.IdUsuario     := Trunc(F_rIDUsuario);
         CtrlDocumento.IdModulo      := Trunc(F_rIDModulo);
         CtrlDocumento.UsaPlanoPatro := F_bUsaPlanoPatro;

         //---------------------------------------------------------------------
         //Estorna Documento, seu imposto e sua Contabilização
         //---------------------------------------------------------------------

         // início - andre tavares - pendência 18508 - 23/02/2004
         // estrornar os impostos (tabela de retenção)
         if not CtrlDocumento.Estornar(FDataEstornoDoc,
                                       Sistema.IdModulo,
                                       Sistema.IdEmpresa,
                                       Sistema.IdUsuario,
                                       rCodDocumento,
                                       iNumLanc,
                                       0,
                                       F_bUsaPlanoPatro, oeSoProcessa, 0, 0, true, true )
      // fim - andre tavares - pendência 18508 - 23/02/2004
         then
         raise exception.Create( CtrlDocumento.MessageInfo );

         MessageInfo := 'Medição Estornada';
      except
         on E:Exception do begin
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
   finally
      cdsParcelaMedicaoAux.Free;
      cdsParcelaRealAux.Free;
      cdsAux.Free;
   end;
end;



function TCtrlMedicao.AplicaIntegracao(const rNumAPgr: Double; const bContabiliza:Boolean): Boolean;

  // Thiago Melo SOL 238060 PPM 496839
  function retornaDespesaOrc(_idContrato, _idItem, _idObjeto : String) : String;
  var
    CdsAux : TCMClientDataSet;
    sSql : String;
  begin
    try
      CdsAux := TCMClientDataSet.Create(nil);

      sSql := (' SELECT DISTINCT NVL(R.IDDESPESAORC, -1) AS IDDESPESAORC FROM RATEIOCENTROCUSTO R '+
               ' WHERE R.IDCONTRATO = '+  _idContrato +
               ' AND R.IDITEM = ' + _idItem +
               ' AND R.IDOBJETO = ' + _idObjeto);
      CdsAux.Data := GetDataPacket(sSql);

      result := CdsAux.FieldByName('IDDESPESAORC').AsString;
    finally
      FreeAndNil(CdsAux);
    end;
  end;
  // Thiago Melo SOL 238060 PPM 496839

var
   sDebCre            : String;
   sRecPag            : String;
   sContaC            : String;
   sContaD            : String;
   sContaOriC         : String;
   sContaOriD         : String;
   sContaAranha       : String;
   rCodSubContaC      : Double;
   rCodSubContaD      : Double;
   sCCustoC           : String;
   sCCustoD           : String;
   rValor             : Double;
   rVlrTotalAux       : Double;
   rIDPatro           : Double;
   rIDPlanoPrev       : Double;
   sHist1,sHist2      : String;
   sHist3,sHist4      : String;
   sHist5             : String;
   sHistorico         : String;

   sTipoContrato      : String;

   iContRateio        : Integer;
   iVlrAuxRateio      : Int64;
   iVlrTotalRateio    : Int64;

   //Bruno Bastos - Pend. 15867 - 21/10/2004
   bMultiplasContas   : Boolean;
   vLancaMB           : TLancaMB;
   vContab            : TLancaMB;

   iIDSegregaCriter   : Integer;
   sContaSegregaCriter: String;
   i                  : integer;

   rTotalLancto       : Double;
   fVlrOrca           : Double;
   bEmissaoBloq       : Boolean;
   cdsDadosForCli     : TCMClientDataSet;
   cdsDadosContrato   : TCMClientDataSet;

   // Início Pendência : 23048 - Marcos Topini - 18/08/2006
   vRateioDocum : TRateioDocum;
   bNovoLancto  : boolean;
   // Fim Pêndência

  iIDProgramaOrcamen : integer;    //MARCIO SANCHES SPINOSA - EDILAINE FERRARESI - 172384/9603 - INICIO

  CdsAux        : TCMClientDataSet;
  iIdDespesaOrc : Integer;
  sSql          : String;

  _idDespesaOrc : String; // Thiago Melo SOL 238708 PPM 506114
begin
   //Bruno Bastos - Pend. 15867 - Início
   If not CtrlSegregacao.Active Then
     CtrlSegregacao.GetParams(Trunc(F_rIDPessoa));
   //Bruno Bastos - Pend. 15867 - Fim

   iIDSegregaCriter := -1;

   Result := True;
   cdsDadosForCli   := TCMClientDataSet.Create(nil);
   cdsDadosContrato := TCMClientDataSet.Create(nil);
   try  //finally

     try  //except


       rCodDocumentoAux      := -1;
       rPlnCodigoAux         := -1;

       //Carrrega cds
       cdsDadosContrato.Data := ListContratoMedicao(FCdsMedicao.FieldByName('IDCONTRATO').AsFloat);
       cdsDadosContrato.FilterOptions := [foCaseInsensitive];
       cdsDadosContrato.Filtered := False;

       sTipoContrato:=cdsDadosContrato.FieldByName('TIPOCONTRATO').AsString;

       if sTipoContrato = 'A' then
       begin
         {SOL:189816 KTN:1793898 JRM6}
         v_DebCre    := 'D';
         v_RecPag    := 'R';
         v_ValorDoc  := rTotalLancto;
         {SOL:189816 KTN:1793898 JRM6}
         sDebCre := 'D';
         sRecPag := 'R';
         CtrlParamIntegra.GetParams(Sistema.IdEmpresa, 0, 'INTEGRACONTAB', 'PARAMCAP', tiCAR );
       end
       else
       begin
          {SOL:189816 KTN:1793898 JRM6}
          v_DebCre    := 'C';
          v_RecPag    := 'P';
          v_ValorDoc  := rTotalLancto;
          {SOL:189816 KTN:1793898 JRM6}
          sDebCre := 'C';
          sRecPag := 'P';
          CtrlParamIntegra.GetParams(Sistema.IdEmpresa, 0, 'INTEGRACONTAB', 'PARAMCAP', tiCAP);
       end;

       if sTipoContrato = 'A' then begin
          cdsDadosForCli.Data := GetDataPacket('SELECT '+
                                     '   NVL(E.CODSUBCONTA,0) AS CODSUBCONTA, '+
                                     '   E.CONTACCLIENTE AS CONTA, '+
                                     '   E.CODCENTROCUSTO, '+
                                     '   E.PLANO, '+
                                     '   P.RAZAOSOCIAL '+
                                     'FROM '+
                                     '   PESSOA P, '+
                                     '   EMPRESACLIENTE E '+
                                     'WHERE '+
                                     '   (E.IDFORCLI = '+
                                     FloatToStr(cdsDadosContrato.FieldByName('IDFORCLI').AsFloat)+') AND '+
                                     '   (E.IDPESSOA = '+
                                     FloatToStr(F_rIDPessoa)+') AND '+
                                     '   (P.IDPESSOA = E.IDFORCLI) ');

          sContaOriC := cdsDadosContrato.FieldByName('PLACONTA').AsString;
          sContaOriD := cdsDadosForCli.FieldByName('CONTA').AsString;
       end else begin
          cdsDadosForCli.Data:=GetDataPacket('SELECT '+
                                              '   NVL(E.CODSUBCONTA,0) AS CODSUBCONTA, '+
                                              '   E.CONTACFORN AS CONTA, '+
                                              '   E.CODCENTROCUSTO, '+
                                              '   E.PLANO, '+
                                              '   P.RAZAOSOCIAL '+
                                              'FROM '+
                                              '   PESSOA P, '+
                                              '   EMPRESAFORN E '+
                                              'WHERE '+
                                              '   (E.IDFORCLI = '+
                                              FloatToStr(cdsDadosContrato.FieldByName('IDFORCLI').AsFloat)+') AND '+
                                              '   (E.IDPESSOA = '+
                                              FloatToStr(F_rIDPessoa)+') AND '+
                                              '   (P.IDPESSOA = E.IDFORCLI) ');

          sContaOriC := cdsDadosForCli.FieldByName('CONTA').AsString;
          sContaOriD := cdsDadosContrato.FieldByName('PLACONTA').AsString;
       end;

       bEmissaoBloq := ((cdsDadosContrato.FieldByName('CODPORTFORMA').AsFloat <> 0) and (sDebCre = 'D'));

       //------------------------------------------------------------------------
       //Geração da Contabilização
       //------------------------------------------------------------------------
       rPlnCodigoAux := 0;
       rTotalLancto  := 0;
       rValor        := 0;
       rVlrTotalAux  := 0;

       if ( ParamIntegra.IntegraContab ) and ( bContabiliza ) then begin
          FCdsMedicao.First;
          i := 0; //Bruno Bastos - Pend. 15867 - 27/10/2004
          while not(FCdsMedicao.Eof) do begin
             //Filtra Cds
             cdsDadosContrato.Filtered := False;

             cdsDadosContrato.Filter := 'IDOBJETO = '+
                                        FloatToStr(FCdsMedicao.FieldByName('IDOBJETO').AsFloat)+
                                        'AND '+
                                        'IDITEM = '+
                                        FloatToStr(FCdsMedicao.FieldByName('IDITEM').AsFloat) +
                                        // Felipe A. Santos SOL 265181 PPM 1166774 - início
                                        ' AND '+
                                        'PARCELANUM = ' + FloatToStr(FCdsMedicao.FieldByName('PARCELANUM').AsFloat);
                                        // Felipe A. Santos SOL 265181 PPM 1166774 - fim
             cdsDadosContrato.Filtered := True;
             cdsDadosContrato.First;

             FCdsRateioxCC.Filtered := False;
             FCdsRateioxCC.Filter := 'IDITEM='+FloatToStr(FCdsMedicao.FieldByName('IDITEM').AsFloat)+
                                     ' AND '+
                                     'IDOBJETO='+
                                     FloatToStr(FCdsMedicao.FieldByName('IDOBJETO').AsFloat) +
                                     // Felipe A. Santos SOL 265181 PPM 1166774 - início
                                     ' AND '+
                                     'PARCELANUM = ' + FloatToStr(FCdsMedicao.FieldByName('PARCELANUM').AsFloat);
                                     // Felipe A. Santos SOL 265181 PPM 1166774 - fim
             FCdsRateioxCC.Filtered := True;
             FCdsRateioxCC.First;

             if sTipoContrato = 'A' then begin
                sContaC       := cdsDadosContrato.FieldByName('PLACONTA').AsString;
                sContaD       := cdsDadosForCli.FieldByName('CONTA').AsString;
                rCodSubContaC := cdsDadosContrato.FieldByName('CODSUBCONTA').AsFloat;
                rCodSubContaD := cdsDadosForCli.FieldByName('CODSUBCONTA').AsFloat;
             end else begin
                //Bruno Bastos - Pend. 17963 - 19/10/2004
                sContaC       := cdsDadosContrato.FieldByName('PLACONTACREDITO').AsString;//Bruno Bastos - Pend. 17963 - 19/10/2004
                sContaD       := cdsDadosContrato.FieldByName('PLACONTA').AsString;
                rCodSubContaC := cdsDadosForCli.FieldByName('CODSUBCONTA').AsFloat;
                rCodSubContaD := cdsDadosContrato.FieldByName('CODSUBCONTA').AsFloat;
             end;

             //Bruno Bastos - Pend. 17963 - 19/10/2004 - Início
             If sContaC <> '' Then
               sContaOriC := sContaC;
             //Bruno Bastos - Pend. 17963 - 19/10/2004 - Fim

             //Bruno Bastos - Pend. 17963 - 19/10/2004
             sContaOriD := sContaD;

             sHistorico := 'Lançamento doc. No. '+
                           FCdsMedicao.FieldByName('NODOCUMENTO').AsString+'/'+
                           FCdsMedicao.FieldByName('COMPLDOCUMENTO').AsString+' '+
                           cdsDadosForCli.FieldByName('RAZAOSOCIAL').AsString+
                           ' ref. contrato No. '+
                           // Marchetti - Pendencia 19477
                           FCdsMedicao.FieldByName('CODCONTRATOEMPR').AsString + ' ' +
                           'Vencimento: ' + FCdsMedicao.FieldByName('DATAPREVISTAVENC').AsString + ' ' +
                           FCdsMedicao.FieldByName('HISTORICOCOMPL').AsString;
                           // Fim Marchetti - Pendencia 19477

             GeralContrato.ArrumaHistorico(sHistorico,
                                           sHist1,sHist2,sHist3,sHist4,sHist5);

             // 22/01/04: 15856 - Vinicius: Caso exista diferença de centavos no rateio, acertar
             //                             no último lançamento.
             iContRateio     := 1;
             // Alex 29/03/04 16367
             iVlrTotalRateio := Trunc( FCdsMedicao.FieldByName('VALORMEDICAO').AsCurrency * 100 );

             FCdsRateioxCC.First;
             while not FCdsRateioxCC.Eof do begin

                if F_bUsaPlanoPatro then begin
                   rIDPatro     := FCdsRateioxCC.FieldByName('IDPATRO').AsFloat;
                   rIDPlanoPrev := FCdsRateioxCC.FieldByName('IDPLANOPREV').AsFloat;
                end else begin
                   rIDPatro     := 0;
                   rIDPlanoPrev := 0;
                end;

                sContaC := sContaOriC;
                sContaD := sContaOriD;
                sContaAranha := '';
                if FCdsRateioxCC.FieldByName('IDPROGRAMA').AsFloat <> 0 then begin
                    sContaAranha := CtrlLancamento.BuscaContaContabil(
                                                   Trunc(F_rIDPessoa),
                                                   Trunc(FCdsRateioxCC.FieldByName('IDPROGRAMA').AsFloat),
                                                   //cdsDadosContrato.FieldByName('CODTIPRECDES').AsString, //Andre Imakawa - WO2528
                                                   FCdsRateioxCC.FieldByName('CODTIPRECDES').AsString,      //Andre Imakawa - WO2528
                                                   FCdsRateioxCC.FieldByName('CODCENTROCUSTO').AsString,
                                                   cdsDadosContrato.FieldByName('RECPAG').AsString);
                end;

                if sTipoContrato = 'A' then begin //Cliente
                   sCCustoC := FCdsRateioxCC.FieldByName('CODCENTROCUSTO').AsString;
                   sCCustoD := cdsDadosForCli.FieldByName('CODCENTROCUSTO').AsString;
                   if sContaAranha <> '' then sContaC := sContaAranha;
                end else begin //Fornecedor
                   sCCustoC := cdsDadosForCli.FieldByName('CODCENTROCUSTO').AsString;
                   sCCustoD := FCdsRateioxCC.FieldByName('CODCENTROCUSTO').AsString;
                   if sContaAranha <> '' then sContaD := sContaAranha;
                end;

                rValor := 0;
                if FCdsRateioxCC.FieldByName('DIVISOR').AsString = 'P' then        // Percentual
                    rValor := GeralContrato.Arredonda( (FCdsMedicao.FieldByName('VALORMEDICAO').AsCurrency *
                                                        FCdsRateioxCC.FieldByName('PERCRATEIOCONTR').AsFloat / 100), 2)
                else if  FCdsRateioxCC.FieldByName('DIVISOR').AsString = 'Q' then  // Quantidade
                    rValor := GeralContrato.Arredonda( ((FCdsMedicao.FieldByName('VALORMEDICAO').AsCurrency /
                                                         FCdsMedicao.FieldByName('QTDEMEDICAO').AsFloat) *
                                                         FCdsRateioxCC.FieldByName('PERCRATEIOCONTR').AsFloat), 2)
                else if  FCdsRateioxCC.FieldByName('DIVISOR').AsString = 'V' then  // Valor
                    rValor := FCdsRateioxCC.FieldByName('PERCRATEIOCONTR').AsFloat;

                // 22/01/04: 15856 - Vinicius: Caso exista diferença de centavos no rateio, acertar
                //                             no último lançamento.
                // se for o ultimo registro da query colocar o valor restante nela. Usa valor inteiro para evitar sujeira Delphi
                if iContRateio = FCdsRateioxCC.RecordCount then rValor := iVlrTotalRateio / 100;

                //Buscar Critério de Segregação
                //Bruno Bastos - Pend. 15867 - 22/10/2004 - Início
                SetLength(vContab, (Length(vContab)+1));
                i := High(vContab);
                if sTipoContrato = 'A' then //Cliente - {Contas a Receber}
                begin
                   vContab[i].iIdSegregaCriter := CtrlSegregacao.RetornaSegregaCriter(CtrlParamIntegra.Plano,
                                                            Trunc(rIdPLanoPrev),
                                                            Trunc(rIDPatro),
                                                            FCdsRateioxCC.FieldByName('CONTA').AsString,
                                                            sContaSegregaCriter);
                   if vContab[i].iIdSegregaCriter = -1 then
                      vContab[i].iIdSegregaCriter := CtrlSegregacao.RetornaSegregaCriter(CtrlParamIntegra.Plano,
                                                            Trunc(rIdPLanoPrev),
                                                            Trunc(rIDPatro),
                                                            sContaD,
                                                            sContaSegregaCriter);
                end
                else
                begin //Fornecedor - {Contas a Pagar}
                   vContab[i].iIdSegregaCriter := CtrlSegregacao.RetornaSegregaCriter(CtrlParamIntegra.Plano,
                                                            Trunc(rIdPLanoPrev),
                                                            Trunc(rIDPatro),
                                                            sContaD,
                                                            sContaSegregaCriter);
                   if vContab[i].iIdSegregaCriter = -1 then
                      vContab[i].iIdSegregaCriter := CtrlSegregacao.RetornaSegregaCriter(CtrlParamIntegra.Plano,
                                                            Trunc(rIdPLanoPrev),
                                                            Trunc(rIDPatro),
                                                            FCdsRateioxCC.FieldByName('CONTA').AsString,
                                                            sContaSegregaCriter);
                end;

                vContab[i].iIdPatro     := Trunc(rIdPatro);
                vContab[i].iIdPlanoPrev := Trunc(rIdPlanoPrev);
                vContab[i].iUnidNegoc   := FCdsRateioxCC.FieldByName('UNIDNEGOC').AsInteger;
                vContab[i].sConta       := FCdsRateioxCC.FieldByName('CONTA').AsString;
                vContab[i].rValor       := rValor;
                //Bruno Bastos - Pend. 15867 - 22/10/2004 - Fim

                if rValor > 0 then begin

                   if not bPartidaDobrada then begin
                      Result := CtrlLancamento.InsereLancaContab(
                                             '0',F_rIDPessoa,F_rIDModulo,F_rIDUsuario,
                                             CtrlParamIntegra.Plano,
                                             FCdsRateioxCC.FieldByName('UNIDNEGOC').AsFloat,
                                             rCodSubContaD,0,rIDPlanoPrev,
                                             rIDPatro,rPlnCodigoAux,0,
                                             FormatDateTime('dd/mm/yyyy',
                                             FCdsMedicao.FieldByName('DATALANCAMENTO').AsDateTime),
                                             FCdsMedicao.FieldByName('NODOCUMENTO').AsString,
                                             sHist1,sHist2,sHist3,sHist4,sHist5,'03',
                                             sCCustoD,sContaD,'','','',rValor,
                                             True,F_bUsaPlanoPatro,
                                             vContab[i].iIdSegregaCriter, //Bruno Bastos - Pend. 15867 - 22/10/2004
                                             FCdsMedicao.FieldByName('DATALANCAMENTO').AsDateTime); //Bruno Bastos - Pend. 15867 - 22/10/2004

                      if not Result then begin
                         MessageInfo := CtrlLancamento.MessageInfo;
                         Exit;
                      end else begin
                         rPlnCodigoAux := CtrlLancamento.RetornoPlnCodigo;
                      end;

                      Result := CtrlLancamento.InsereLancaContab(
                                             '1',F_rIDPessoa,F_rIDModulo,F_rIDUsuario,
                                             CtrlParamIntegra.Plano,
                                             FCdsRateioxCC.FieldByName('UNIDNEGOC').AsFloat,
                                             0,rCodSubContaC,rIDPlanoPrev,
                                             rIDPatro,rPlnCodigoAux,0,
                                             FormatDateTime('dd/mm/yyyy',
                                                   FCdsMedicao.FieldByName('DATALANCAMENTO').AsDateTime),
                                             FCdsMedicao.FieldByName('NODOCUMENTO').AsString,
                                             sHist1,sHist2,sHist3,sHist4,sHist5,'03',
                                             '','',sCCustoC,
                                             FCdsRateioxCC.FieldByName('CONTA').AsString,//Bruno Bastos - Pend. 15867 - 25/10/2004
                                             '',rValor,
                                             True,F_bUsaPlanoPatro,
                                             vContab[i].iIdSegregaCriter, //Bruno Bastos - Pend. 15867 - 22/10/2004
                                             FCdsMedicao.FieldByName('DATALANCAMENTO').AsDateTime); //Bruno Bastos - Pend. 15867 - 22/10/2004

                      if not Result then begin
                         MessageInfo:=CtrlLancamento.MessageInfo;
                         Exit;
                      end;
                   end else begin
                      Result := CtrlLancamento.InsereLancaContab(
                                              '2',F_rIDPessoa,F_rIDModulo,F_rIDUsuario,
                                              CtrlParamIntegra.Plano,
                                              FCdsRateioxCC.FieldByName('UNIDNEGOC').AsFloat,
                                              rCodSubContaD,rCodSubContaC,rIDPlanoPrev,
                                              rIDPatro,rPlnCodigoAux,0,
                                              FormatDateTime('dd/mm/yyyy',
                                                    FCdsMedicao.FieldByName('DATALANCAMENTO').AsDateTime),
                                              FCdsMedicao.FieldByName('NODOCUMENTO').AsString,
                                              sHist1,sHist2,sHist3,sHist4,sHist5,'03',
                                              sCCustoD,sContaD,sCCustoC,
                                              FCdsRateioxCC.FieldByName('CONTA').AsString,//Bruno Bastos - Pend. 15867 - 25/10/2004
                                              '',rValor, True,F_bUsaPlanoPatro,
                                              vContab[i].iIdSegregaCriter, //Bruno Bastos - Pend. 15867 - 22/10/2004
                                              FCdsMedicao.FieldByName('DATALANCAMENTO').AsDateTime); //Bruno Bastos - Pend. 15867 - 22/10/2004

                      if not Result then begin
                         MessageInfo := CtrlLancamento.MessageInfo;
                         Exit;
                      end else begin
                         rPlnCodigoAux := CtrlLancamento.RetornoPlnCodigo;
                      end;
                   end;

                end;
                FCdsRateioxCC.Next;

                // 22/01/04: 15856 - Vinicius: Caso exista diferença de centavos no rateio, acertar
                //                             no último lançamento.
                // subtrai o valor rateado do total
                rVlrTotalAux    := ( rValor * 100 );
                iVlrAuxRateio   := Round(rVlrTotalAux);
                iVlrTotalRateio := iVlrTotalRateio - iVlrAuxRateio;
                Inc(iContRateio);
             end;

             rTotalLancto := rTotalLancto+FCdsMedicao.FieldByName('VALORMEDICAO').AsFloat;
             FCdsMedicao.Next;
             Inc(i);//Bruno Bastos - Pend. 15867 - 27/10/2004
          end;
       end else begin
          FCdsMedicao.First;
          i := 0; //Bruno Bastos - Pend. 15867 - 27/10/2004
          while not(FCdsMedicao.Eof) do begin
             //Filtra Cds
             cdsDadosContrato.Filtered := False;
             cdsDadosContrato.Filter := 'IDOBJETO = '+
                                        FloatToStr(FCdsMedicao.FieldByName('IDOBJETO').AsFloat)+
                                        'AND '+
                                        'IDITEM = '+
                                        FloatToStr(FCdsMedicao.FieldByName('IDITEM').AsFloat) +
                                        // Felipe A. Santos SOL 265181 PPM 1166774 - início
                                        ' AND '+
                                        'PARCELANUM = ' + FloatToStr(FCdsMedicao.FieldByName('PARCELANUM').AsFloat);
                                        // Felipe A. Santos SOL 265181 PPM 1166774 - fim
             cdsDadosContrato.Filtered := True;
             cdsDadosContrato.First;

             FCdsRateioxCC.Filtered := False;
             FCdsRateioxCC.Filter := 'IDITEM='+FloatToStr(FCdsMedicao.FieldByName('IDITEM').AsFloat)+
                                     ' AND '+
                                     'IDOBJETO='+
                                     FloatToStr(FCdsMedicao.FieldByName('IDOBJETO').AsFloat) +
                                      // Felipe A. Santos SOL 265181 PPM 1166774 - início
                                      ' AND '+
                                      'PARCELANUM = ' + FloatToStr(FCdsMedicao.FieldByName('PARCELANUM').AsFloat);
                                      // Felipe A. Santos SOL 265181 PPM 1166774 - fim
             FCdsRateioxCC.Filtered := True;
             FCdsRateioxCC.First;

             if sTipoContrato = 'A' then begin
                sContaC       := cdsDadosContrato.FieldByName('PLACONTA').AsString;
                sContaD       := cdsDadosForCli.FieldByName('CONTA').AsString;
                rCodSubContaC := cdsDadosContrato.FieldByName('CODSUBCONTA').AsFloat;
                rCodSubContaD := cdsDadosForCli.FieldByName('CODSUBCONTA').AsFloat;
             end else begin
                //Bruno Bastos - Pend. 17963 - 19/10/2004
                sContaC       := cdsDadosContrato.FieldByName('PLACONTACREDITO').AsString;//Bruno Bastos - Pend. 17963 - 19/10/2004
                sContaD       := cdsDadosContrato.FieldByName('PLACONTA').AsString;
                rCodSubContaC := cdsDadosForCli.FieldByName('CODSUBCONTA').AsFloat;
                rCodSubContaD := cdsDadosContrato.FieldByName('CODSUBCONTA').AsFloat;
             end;

             //Bruno Bastos - Pend. 17963 - 19/10/2004 - Início
             If sContaC <> '' Then
               sContaOriC := sContaC;
             //Bruno Bastos - Pend. 17963 - 19/10/2004 - Fim

             //Bruno Bastos - Pend. 17963 - 19/10/2004
             sContaOriD := sContaD;

             // 22/01/04: 15856 - Vinicius: Caso exista diferença de centavos no rateio, acertar
             //                             no último lançamento.
             iContRateio     := 1;
             // Alex 29/03/04 16367
             iVlrTotalRateio := Trunc( FCdsMedicao.FieldByName('VALORMEDICAO').AsCurrency * 100 );

             FCdsRateioxCC.First;
             while not FCdsRateioxCC.Eof do begin

                if F_bUsaPlanoPatro then begin
                   rIDPatro     := FCdsRateioxCC.FieldByName('IDPATRO').AsFloat;
                   rIDPlanoPrev := FCdsRateioxCC.FieldByName('IDPLANOPREV').AsFloat;
                end else begin
                   rIDPatro     := 0;
                   rIDPlanoPrev := 0;
                end;

                sContaC := sContaOriC;
                sContaD := sContaOriD;
                sContaAranha := '';
                if FCdsRateioxCC.FieldByName('IDPROGRAMA').AsFloat <> 0 then begin
                    sContaAranha := CtrlLancamento.BuscaContaContabil(
                                                   Trunc(F_rIDPessoa),
                                                   Trunc(FCdsRateioxCC.FieldByName('IDPROGRAMA').AsFloat),
                                                   //cdsDadosContrato.FieldByName('CODTIPRECDES').AsString, //Andre Imakawa - WO2528
                                                   FCdsRateioxCC.FieldByName('CODTIPRECDES').AsString,      //Andre Imakawa - WO2528
                                                   FCdsRateioxCC.FieldByName('CODCENTROCUSTO').AsString,
                                                   cdsDadosContrato.FieldByName('RECPAG').AsString);
                end;

                if sTipoContrato = 'A' then begin //Cliente
                   sCCustoC := FCdsRateioxCC.FieldByName('CODCENTROCUSTO').AsString;
                   sCCustoD := cdsDadosForCli.FieldByName('CODCENTROCUSTO').AsString;
                   if sContaAranha <> '' then sContaC := sContaAranha;
                end else begin //Fornecedor
                   sCCustoC := cdsDadosForCli.FieldByName('CODCENTROCUSTO').AsString;
                   sCCustoD := FCdsRateioxCC.FieldByName('CODCENTROCUSTO').AsString;
                   if sContaAranha <> '' then sContaD := sContaAranha;
                end;

                rValor := 0;
                if FCdsRateioxCC.FieldByName('DIVISOR').AsString = 'P' then        // Percentual
                    rValor := GeralContrato.Arredonda( (FCdsMedicao.FieldByName('VALORMEDICAO').AsCurrency *
                                                        FCdsRateioxCC.FieldByName('PERCRATEIOCONTR').AsFloat / 100), 2)
                else if  FCdsRateioxCC.FieldByName('DIVISOR').AsString = 'Q' then  // Quantidade
                    rValor := GeralContrato.Arredonda( ((FCdsMedicao.FieldByName('VALORMEDICAO').AsCurrency /
                                                         FCdsMedicao.FieldByName('QTDEMEDICAO').AsFloat) *
                                                         FCdsRateioxCC.FieldByName('PERCRATEIOCONTR').AsFloat), 2)
                else if  FCdsRateioxCC.FieldByName('DIVISOR').AsString = 'V' then  // Valor
                    rValor := FCdsRateioxCC.FieldByName('PERCRATEIOCONTR').AsFloat;

                // 22/01/04: 15856 - Vinicius: Caso exista diferença de centavos no rateio, acertar
                //                             no último lançamento.
                if iContRateio = FCdsRateioxCC.RecordCount then rValor := iVlrTotalRateio / 100;

                //Buscar Critério de Segregação
                //Bruno Bastos - Pend. 15867 - 22/10/2004 - Início
                SetLength(vContab, (Length(vContab)+1));
                i := High(vContab);
                if sTipoContrato = 'A' then //Cliente - {Contas a Receber}
                begin
                   vContab[i].iIdSegregaCriter := CtrlSegregacao.RetornaSegregaCriter(CtrlParamIntegra.Plano,
                                                            Trunc(rIdPLanoPrev),
                                                            Trunc(rIDPatro),
                                                            FCdsRateioxCC.FieldByName('CONTA').AsString,
                                                            sContaSegregaCriter);
                   if vContab[i].iIdSegregaCriter = -1 then
                      vContab[i].iIdSegregaCriter := CtrlSegregacao.RetornaSegregaCriter(CtrlParamIntegra.Plano,
                                                            Trunc(rIdPLanoPrev),
                                                            Trunc(rIDPatro),
                                                            sContaD,
                                                            sContaSegregaCriter);
                end
                else
                begin //Fornecedor - {Contas a Pagar}
                   vContab[i].iIdSegregaCriter := CtrlSegregacao.RetornaSegregaCriter(CtrlParamIntegra.Plano,
                                                            Trunc(rIdPLanoPrev),
                                                            Trunc(rIDPatro),
                                                            sContaD,
                                                            sContaSegregaCriter);
                   if vContab[i].iIdSegregaCriter = -1 then
                      vContab[i].iIdSegregaCriter := CtrlSegregacao.RetornaSegregaCriter(CtrlParamIntegra.Plano,
                                                            Trunc(rIdPLanoPrev),
                                                            Trunc(rIDPatro),
                                                            FCdsRateioxCC.FieldByName('CONTA').AsString,
                                                            sContaSegregaCriter);
                end;

                vContab[i].iIdPatro     := Trunc(rIdPatro);
                vContab[i].iIdPlanoPrev := Trunc(rIdPlanoPrev);
                vContab[i].iUnidNegoc   := FCdsRateioxCC.FieldByName('UNIDNEGOC').AsInteger;
                vContab[i].sConta       := FCdsRateioxCC.FieldByName('CONTA').AsString;
                vContab[i].rValor       := rValor;
                //Bruno Bastos - Pend. 15867 - 22/10/2004 - Fim

                FCdsRateioxCC.Next;

                // 22/01/04: 15856 - Vinicius: Caso exista diferença de centavos no rateio, acertar
                //                             no último lançamento.
                // subtrai o valor rateado do total
                rVlrTotalAux    := ( rValor * 100 );
                iVlrAuxRateio   := Round(rVlrTotalAux);
                iVlrTotalRateio := iVlrTotalRateio - iVlrAuxRateio;
                Inc(iContRateio);
             end;

             rTotalLancto := rTotalLancto+FCdsMedicao.FieldByName('VALORMEDICAO').AsFloat;
             FCdsMedicao.Next;
             Inc(i);//Bruno Bastos - Pend. 15867 - 27/10/2004
          end;
       end;

       {SOL:189816 KTN:1793898 JRM6}
       v_CodtipRecDes := cdsDadosContrato.FieldByName('CODTIPRECDES').AsString;
       v_ValorDoc     := rTotalLancto;
       {SOL:189816 KTN:1793898 JRM6}

       //------------------------------------------------------------------------
       // Integração com Orçamento
       //------------------------------------------------------------------------

       // Marcio Motta - 21/05/2004 - 16347
       FCdsMedicao.First;
       while not(FCdsMedicao.Eof) do begin
          if FCdsMedicao.FieldByName('IDRESERVAORCAMEN').AsInteger > 0 then begin
             Result := IntegraOrcamento(FCdsMedicao.FieldByName('IDRESERVAORCAMEN').AsInteger,
                                        FCdsMedicao.FieldByName('VALORMEDICAO').AsFloat);
          end;
          if not Result then Exit;
          FCdsMedicao.Next;
       end;

       //------------------------------------------------------------------------
       //Geração do Documento no CAP/CAR
       //------------------------------------------------------------------------
       CtrlDocumento.Prepare( OpDocumento, odlEfetivo, sdocAberto );
       CtrlDocumento.UsaPlanoPatro := F_bUsaPlanoPatro;
       CtrlDocumento.IdEspAcesso   := F_rIDEspAcesso;
       CtrlDocumento.IdUsuario     := Trunc(F_rIDUsuario);                    
       CtrlDocumento.IdModulo      := Trunc(F_rIDModulo);

       if ( CtrlParamIntegra.IntegraContab ) and ( bContabiliza ) then begin
          if sTipoContrato = 'A' then begin
             sContaC       := cdsDadosContrato.FieldByName('PLACONTA').AsString;
             sContaD       := cdsDadosForCli.FieldByName('CONTA').AsString;
             rCodSubContaC := cdsDadosContrato.FieldByName('CODSUBCONTA').AsFloat;
             rCodSubContaD := cdsDadosForCli.FieldByName('CODSUBCONTA').AsFloat;
          end else begin
             //Bruno Bastos - Pend. 17963
             sContaC       := cdsDadosContrato.FieldByName('PLACONTACREDITO').AsString; //Bruno Bastos - Pend. 17963
             sContaD       := cdsDadosContrato.FieldByName('PLACONTA').AsString;
             rCodSubContaC := cdsDadosForCli.FieldByName('CODSUBCONTA').AsFloat;
             rCodSubContaD := cdsDadosContrato.FieldByName('CODSUBCONTA').AsFloat;
          end;
       end;

       //Bruno Bastos - Pend. 17963 - 21/10/2004 - Início
       vLancaMB := nil;
       bMultiplasContas := CtrlMultiplasContas.BuscaMultiplasContas(vLancaMB, vContab);

       If bMultiplasContas Then
         sContaC := ''
       Else
         If sContaC = '' Then
           sContaC := cdsDadosForCli.FieldByName('CONTA').AsString;

        i := 0;   
       //Bruno Bastos - Pend. 17963 - 21/10/2004 - Fim

       CtrlDocumento.SetValues(0,FCdsMedicao.FieldByName('NODOCUMENTO').AsFloat,
                               FCdsMedicao.FieldByName('COMPLDOCUMENTO').AsString,
                               '',sRecPag,'2','',
                               FCdsMedicao.FieldByName('NUMLEITCODBARRAS').AsString,
                               //Bruno Bastos - Pend. 17963
                               sContaC, //Bruno Bastos - Pend. 17963
                               cdsDadosForCli.FieldByName('CODCENTROCUSTO').AsString,
                               '',
                               FCdsMedicao.FieldByName('NUMDIGCODBARRAS').AsString,
                               '','','','',
                               cdsDadosContrato.FieldByName('CODCONTRATOEMPR').AsString,
                               FCdsMedicao.FieldByName('OBS').AsString,
                               FCdsMedicao.FieldByName('DATAPREVISTAVENC').AsDateTime,
                               FCdsMedicao.FieldByName('DATAMEDICAO').AsDateTime,
                               FCdsMedicao.FieldByName('DATAPREVISTAVENC').AsDateTime,
                               0,0,0,0,0,0,0,0,
                               Trunc(cdsDadosContrato.FieldByName('CODTIPDOC').AsFloat),
                               Trunc(F_rIDPessoa),Trunc(F_rIDModulo),
                               Trunc(cdsDadosContrato.FieldByName('IDFORCLI').AsFloat),
                               0,
                               Trunc(FCdsMedicao.FieldByName('IDCBANCARIA').AsFloat),
                               0,
                               Trunc(cdsDadosForCli.FieldByName('PLANO').AsFloat),0,
                               Trunc(rNumAPgr),
                               Trunc(FCdsMedicao.FieldByName('MOECODIGO').AsFloat),
                               0,0,Trunc(F_rIDUsuario),Trunc(F_rIDPessoa),0,0,
                               Trunc(cdsDadosForCli.FieldByName('CODSUBCONTA').AsFloat),
                               //Trunc(cdsDadosContrato.FieldByName('CODPORTFORMA').AsFloat),  //SIG82259
                               Trunc(CdsMedicao.fieldbyname('CODPORTFORMA').asFloat),          //SIG82259
                               0,0,
                               Trunc(FCdsMedicao.FieldByName('CODFORMA').AsFloat),
                               iff(bMultiplasContas, vLancaMB[i].iIdSegregaCriter, -1)     //SIG111914
							   //Cássio Rovaroto - SIG nº 23656.58469 - Início
                               , '',
                               -1,
                               FCdsMedicao.FieldByName('FLGSIMPLES').AsString,
                               '',
                               FCdsMedicao.FieldByName('NFSNUMERO').AsString,
                               FCdsMedicao.FieldByName('NFSSERIE').AsString,
                               FCdsMedicao.FieldByName('NFSDATAEMISSAO').AsDateTime,
                               FCdsMedicao.FieldByName('NFSOBS').AsString,
                               EmptyStr,
                               FCdsMedicao.FieldByName('NFSSERVICO').AsInteger
                               //Cássio Rovaroto - SIG nº 23656.58469 - Fim
							   );//Bruno Bastos - Pend. 15867 - 26/10/2004

       CtrlDocumento.Lanctodocum.SetValues(FCdsMedicao.FieldByName('DATALANCAMENTO').AsDateTime,
                                           0,0,rTotalLancto,0,rTotalLancto,0,
                                           Trunc(rPlnCodigoAux),0,
                                           Trunc(F_rIDUsuario),
                                           Trunc(F_rIDPessoa),0,0,0,0,0,'2',
                                           '','','',
                                           FCdsMedicao.FieldByName('HISTORICOCOMPL').AsString,
                                           '','','',sDebCre,
                                           Trunc(F_rIDModulo),
                                           Trunc(cdsDadosForCli.FieldByName('PLANO').AsFloat),
                                           F_bUsaPlanoPatro);
      {SOL:189816 KTN:1793898 JRM6}
      v_codtipdoc := Trunc(cdsDadosContrato.FieldByName('CODTIPDOC').AsFloat);
      {SOL:189816 KTN:1793898 JRM6}
      rVlrTotalAux := 0;
      FCdsMedicao.First;

       rVlrTotalAux := 0;
       FCdsMedicao.First;

       // Início Pendência : 23048 - Marcos Topini
       vRateioDocum := nil;
       // Fim Pendência : 23048

       while not FCdsMedicao.Eof do begin
          cdsDadosContrato.Filtered := False;
          cdsDadosContrato.Filter := 'IDOBJETO = '+
                                     FloatToStr(FCdsMedicao.FieldByName('IDOBJETO').AsFloat)+
                                     'AND '+
                                     'IDITEM = '+
                                     FloatToStr(FCdsMedicao.FieldByName('IDITEM').AsFloat)  +
                                     // Felipe A. Santos SOL 265181 PPM 1166774 - início
                                     ' AND '+
                                     'PARCELANUM = ' + FloatToStr(FCdsMedicao.FieldByName('PARCELANUM').AsFloat);
                                     // Felipe A. Santos SOL 265181 PPM 1166774 - fim
          cdsDadosContrato.Filtered := True;
          cdsDadosContrato.First;

          FCdsRateioxCC.Filtered := False;
          FCdsRateioxCC.Filter := 'IDITEM='+FloatToStr(FCdsMedicao.FieldByName('IDITEM').AsFloat)+
                                 ' AND '+
                                 'IDOBJETO='+
                                 FloatToStr(FCdsMedicao.FieldByName('IDOBJETO').AsFloat) +
                                // Felipe A. Santos SOL 265181 PPM 1166774 - início
                                ' AND '+
                                'PARCELANUM = ' + FloatToStr(FCdsMedicao.FieldByName('PARCELANUM').AsFloat);
                                // Felipe A. Santos SOL 265181 PPM 1166774 - fim
          FCdsRateioxCC.Filtered := True;

          if cdsDadosContrato.FieldByName('RECDES_ATIVO').AsString = 'N' then begin
             Result      := False;
             MessageInfo := 'Tipo de Recebimento / Desembolso Inativo';
             Exit;
          end;

          // 22/01/04: 15856 - Vinicius: Caso exista diferença de centavos no rateio, acertar
          //                             no último lançamento.
          iContRateio     := 1;
          // Alex 29/03/04 16367
          iVlrTotalRateio := Trunc( FCdsMedicao.FieldByName('VALORMEDICAO').AsCurrency * 100 );

          FCdsRateioxCC.First;
          while not FCdsRateioxCC.Eof do begin

             if F_bUsaPlanoPatro then begin
                rIDPatro     := FCdsRateioxCC.FieldByName('IDPATRO').AsFloat;
                rIDPlanoPrev := FCdsRateioxCC.FieldByName('IDPLANOPREV').AsFloat;
             end else begin
                rIDPatro     := 0;
                rIDPlanoPrev := 0;
             end;

             rValor := 0;
             if FCdsRateioxCC.FieldByName('DIVISOR').AsString = 'P' then        // Percentual
                 rValor := GeralContrato.Arredonda( (FCdsMedicao.FieldByName('VALORMEDICAO').AsCurrency *
                                                     FCdsRateioxCC.FieldByName('PERCRATEIOCONTR').AsFloat / 100), 2)
             else if  FCdsRateioxCC.FieldByName('DIVISOR').AsString = 'Q' then  // Quantidade
                 rValor := GeralContrato.Arredonda( ((FCdsMedicao.FieldByName('VALORMEDICAO').AsCurrency /
                                                      FCdsMedicao.FieldByName('QTDEMEDICAO').AsFloat) *
                                                      FCdsRateioxCC.FieldByName('PERCRATEIOCONTR').AsFloat), 2)
             else if  FCdsRateioxCC.FieldByName('DIVISOR').AsString = 'V' then  // Valor
                 rValor := FCdsRateioxCC.FieldByName('PERCRATEIOCONTR').AsFloat;

             // 22/01/04: 15856 - Vinicius: Caso exista diferença de centavos no rateio, acertar
             //                             no último lançamento.
             // se for o ultimo registro da query colocar o valor restante nela. Usa valor inteiro para evitar sujeira Delphi
             if iContRateio = FCdsRateioxCC.RecordCount then rValor := iVlrTotalRateio / 100;

             if rValor > 0 then begin

                fVlrOrca := 0;
                if not(FcdsMedicao.FieldByName('IDRESERVAORCAMEN').IsNull) then
                  fVlrOrca := rValor;

                // Início Pendência : 23048 - Marcos Topini 18/08/2006
                { PROCESSO PARA AGRUPAR NO VETOR PARA A RATEIODOCUM }
                bNovoLancto := True;
                for i := 0 to Length(vRateioDocum)-1 do begin
                  //if (vRateioDocum[i].sCodTipRecDes     = cdsDadosContrato.FieldByName('CODTIPRECDES').AsString)    and   //edilaine SIG115595
                  if (vRateioDocum[i].sCodTipRecDes     = FCdsRateioxCC.FieldByName('CODTIPRECDES').AsString)    and        //edilaine SIG115595
                     (vRateioDocum[i].sCodCentroRespon  = cdsDadosContrato.FieldByName('CODCENTRORESPON').AsString) and
                     (vRateioDocum[i].iUnidNeg          = FCdsRateioxCC.FieldByName('UNIDNEGOC').AsFloat)           and
                     (vRateioDocum[i].iIdReservaOrcamen = FCdsMedicao.FieldByName('IDRESERVAORCAMEN').AsInteger)    and
                     (vRateioDocum[i].sCodCentroCusto   = FCdsRateioxCC.FieldByName('CODCENTROCUSTO').AsString)     and
                     (vRateioDocum[i].iIdPatro          = Trunc(rIDPatro))                                          and
                     (vRateioDocum[i].iIdPlanoPrev      = rIDPlanoPrev)                                             and
                     // Daniel - 26185
                     (vRateioDocum[i].iIdPrograma       = FCdsRateioxCC.FieldByName('IDPROGRAMA').AsInteger) then
                  begin
                    vRateioDocum[i].dValorRateio := vRateioDocum[i].dValorRateio + rValor;
                    vRateioDocum[i].dValorOrca   := vRateioDocum[i].dValorOrca   + fVlrOrca;
                    bNovoLancto := False;
                  end;
                end;

                if bNovoLancto then begin
                   SetLength(vRateioDocum,(Length(vRateioDocum)+1) );
                   i := High(vRateioDocum);
                   //vRateioDocum[i].sCodTipRecDes      := cdsDadosContrato.FieldByName('CODTIPRECDES').AsString;    //edilaine SIG115595
                   vRateioDocum[i].sCodTipRecDes      := FCdsRateioxCC.FieldByName('CODTIPRECDES').AsString;         //edilaine SIG115595
                   vRateioDocum[i].sCodCentroRespon   := cdsDadosContrato.FieldByName('CODCENTRORESPON').AsString;
                   vRateioDocum[i].iUnidNeg           := Trunc(FCdsRateioxCC.FieldByName('UNIDNEGOC').AsFloat);
                   vRateioDocum[i].iIdReservaOrcamen  := FCdsMedicao.FieldByName('IDRESERVAORCAMEN').AsInteger;
                   vRateioDocum[i].sCodCentroCusto    := FCdsRateioxCC.FieldByName('CODCENTROCUSTO').AsString;
                   vRateioDocum[i].iIdPatro           := Trunc(rIDPatro);

                   // Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656
                   vRateioDocum[i].iIdPlano           := FCdsRateioxCC.FieldByName('PLANO').AsInteger;
                   vRateioDocum[i].iIdPlanoPrev       := Trunc(rIDPlanoPrev);
                   // Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656

                   vRateioDocum[i].dValorRateio       := rValor;
                   vRateioDocum[i].dValorOrca         := fVlrOrca;
                   // Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656
                   vRateioDocum[i].iIdPlanoPrevOrigem := FCdsRateioxCC.FieldByName('PLANOORIGEM').AsInteger;
                   vRateioDocum[i].iIdPatroOrigem     := FCdsRateioxCC.FieldByName('PATROORIGEM').AsInteger;
                   // Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656

                   // Daniel - 26185
                   vRateioDocum[i].iIdPrograma       := FCdsRateioxCC.FieldByName('IDPROGRAMA').AsInteger;
//                   vRateioDocum[i].IidDespesaOrc     := FCdsRateioxCC.FieldByName('IDDESPESAORC').AsInteger; // Thiago Melo SOL 237146 PPM 482149

                   // Thiago Melo SOL 238708 PPM 506114

                   if ((Trim(FCdsRateioxCC.FieldByName('IDDESPESAORC').AsString) = '0') or
                       (Trim(FCdsRateioxCC.FieldByName('IDDESPESAORC').AsString) = '')  or
                       (Trim(FCdsRateioxCC.FieldByName('IDDESPESAORC').AsString) = '-1'))
                   then begin
                     _idDespesaOrc := retornaDespesaOrc( FCdsMedicao.FieldByName('IDCONTRATO').AsString,FCdsMedicao.FieldByName('IDITEM').AsString, FCdsMedicao.FieldByName('IDOBJETO').AsString );
                     if (_idDespesaOrc <> '') then begin
                       vRateioDocum[i].IidDespesaOrc := StrToInt(_idDespesaOrc);
                     end else begin
                       vRateioDocum[i].IidDespesaOrc := -1;
                     end;
                   end else begin
                     vRateioDocum[i].IidDespesaOrc   := FCdsRateioxCC.FieldByName('IDDESPESAORC').AsInteger;
                   end;

                   {vRateioDocum[i].IidDespesaOrc     := StrToInt(IFF(
                                                                     FCdsRateioxCC.FieldByName('IDDESPESAORC').AsString = '0',
                                                                     retornaDespesaOrc(
                                                                                       FCdsMedicao.FieldByName('IDCONTRATO').AsString,
                                                                                       FCdsMedicao.FieldByName('IDITEM').AsString,
                                                                                       FCdsMedicao.FieldByName('IDOBJETO').AsString ),
                                                                     FCdsRateioxCC.FieldByName('IDDESPESAORC').AsString)); // Thiago Melo SOL 238060 PPM 496839}
                   // Thiago Melo SOL 238708 PPM 506114
				   //Cássio Rovaroto -  SIG nº 23656.58469 - Início
                   //vRateioDocum[i].iIdProcessoSusp := FCdsmedicao.FieldByName('IDPROCESSOSUSP').AsInteger; //Cássio Rovaroto - SIG nº 115585
                   //vRateioDocum[i].iIdTipoServico := FCdsmedicao.FieldByName('IDTIPOSERVICO').AsInteger; //Cássio Rovaroto - SIG nº 115585
                   //Cássio Rovaroto -  SIG nº 23656.58469 - Fim
                end;
                // Fim Pendência : 23048

             end;
             FCdsRateioxCC.Next;

             // 22/01/04: 15856 - Vinicius: Caso exista diferença de centavos no rateio, acertar
             //                             no último lançamento.
             // subtrai o valor rateado do total
             rVlrTotalAux    := ( rValor * 100 );
             iVlrAuxRateio   := Round(rVlrTotalAux);
             iVlrTotalRateio := iVlrTotalRateio - iVlrAuxRateio;
             Inc(iContRateio);
          end;

          FCdsMedicao.Next;
       end;

       //MARCIO SANCHES SPINOSA - EDILAINE FERRARESI - 172384/9603 - INICIO
       // Início Pendência : 23048 - Marcos Topini
       for i := 0 to Length(vRateioDocum)-1 do
       begin
      //Vander Campos - SOL: 172384/9603 - KINTANA: 1661662 | Inclusão do Parametro IDProgramaOrcamen
      CtrlTerceirosRH.GetIdProgramaCCusto(vRateioDocum[i].sCodCentroCusto,
                                          Sistema.IdEmpresa,
                                          iIDProgramaOrcamen);

      // SOL 200540 KINTANA 1932783 inicio

      try
          CdsAux := TCMClientDataSet.Create(nil);

          sSql := (' SELECT DISTINCT NVL(R.IDDESPESAORC, -1) AS IDDESPESAORC FROM RATEIOCENTROCUSTO R '+
                   ' WHERE R.IDCONTRATO = '+  FCdsMedicao.FieldByName('IDCONTRATO').AsString +
                   //' AND R.CODCENTROCUSTO = '+ vRateioDocum[i].sCodCentroCusto + // SOL 203613 KINTANA 1967518
                   ' AND R.IDITEM = ' + FCdsMedicao.FieldByName('IDITEM').AsString +  // Otacilio SOL 200778 KTN 1953121
                   ' AND R.IDOBJETO = ' + FCdsMedicao.FieldByName('IDOBJETO').AsString); // Otacilio SOL 200778 KTN 1953121


          CdsAux.Data := GetDataPacket(sSql);

         iIdDespesaOrc := CdsAux.FieldByName('IDDESPESAORC').AsInteger;
      finally
         //Free;
      end;

      // SOL 200540 KINTANA 1932783 Final

          //edilaine SIG111898 : fim
          {if (cdsDadosContrato.FieldByName('RECPAG').asString = 'P') And
             (TRIM(vRateioDocum[i].sCodCentroCusto) <> '')                         Then
             CtrlDocumento.Orcamento.FDO_SetCDS( cdsDadosContrato.FieldByName('IdForCli').AsInteger,
                                                 //DataEmisso,
                                                 FCdsMedicao.FieldByName('DATAMEDICAO').asDateTime,
                                                 vRateioDocum[i].sCodTipRecDes,
                                                 vRateioDocum[i].sCodCentroCusto,
                                                 vRateioDocum[i].iUnidNeg,
                                                 // Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656
                                                 vRateioDocum[i].iIdPlanoPrev,
                                                 //vRateioDocum[i].iIdPlanoPrevOrigem,
                                                 // Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656
                                                 vRateioDocum[i].iIdPatro,
                                                 vRateioDocum[i].iIdPrograma,

                                                 // Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656
                                                 vRateioDocum[i].dValorRateio,

                                                 //rValor,
                                                 // Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656

                                                 //0,
                                                 // Thiago Melo SOL 237146 PPM 482149
                                                 // iIdDespesaOrc,  // SOL 200540 KINTANA 1932783
                                                 vRateioDocum[i].IidDespesaOrc,
                                                 // Thiago Melo SOL 237146 PPM 482149
                                                 //vRateioDocum[i].iIDProgramaOrcamen//,
                                                 iIDProgramaOrcamen, vRateioDocum[i].iIdPlano // Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656
                                                 //iCompromisso
                                                 );
          //Fim - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662  - passas esses camposs
          }//edilaine SIG111898 : fim

          CtrlDocumento.Rateiodocum.SetValues(vRateioDocum[i].dValorRateio,0,
                                              vRateioDocum[i].dValorOrca,0,Trunc(F_rIDPessoa),
                                              0,
                                              vRateioDocum[i].iUnidNeg,
                                              0,Trunc(F_rIDUsuario),
                                              vRateioDocum[i].iIdReservaOrcamen,
                                              // Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656
                                              //0,
//                                              Trunc(vRateioDocum[i].iIdPlanoPrev),
                                              Trunc(vRateioDocum[i].iIdPlano),
                                              StrToInt(IFF(vRateioDocum[i].iIdPlanoPrevOrigem = 0, IntToStr(vRateioDocum[i].iIdPlanoPrev), IntToStr(vRateioDocum[i].iIdPlanoPrevOrigem))),
                                              //StrToInt(IFF(vRateioDocum[i].iIdPlanoPrevOrigem = 0, '0', IntToStr(vRateioDocum[i].iIdPlanoPrev))),
                                              StrToInt(IFF(vRateioDocum[i].iIdPatroOrigem = 0, IntToStr(vRateioDocum[i].iIdPatro), IntToStr(vRateioDocum[i].iIdPatroOrigem))),
                                              //vRateioDocum[i].iIdPatro,
                                              //vRateioDocum[i].iIdPatroOrigem,
                                              // Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656
                                              // Daniel - 26185
                                              vRateioDocum[i].iIdPrograma,
                                              0,
                                              Trunc(F_rIDPessoa),
                                              vRateioDocum[i].sCodTipRecDes,
                                              sRecPag,
                                              vRateioDocum[i].sCodCentroRespon,
                                              vRateioDocum[i].sCodCentroCusto,'',
                                              True, 0, 0,
                                              //Usa-se o mesmo DataSet pois foi montado com todas as informações
                                              CtrlDocumento.Orcamento.CdsFDORateio,
                                              CtrlDocumento.Orcamento.CdsFDORateio
                                              //Fim - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
											  //Cássio Rovaroto - SIG nº 23656.58469 - Início
                                              //, nil, // Cássio Rovaroto - SIG nº 115585
                                              //vRateioDocum[i].iIdProcessoSusp, // Cássio Rovaroto - SIG nº 115585
                                              //vRateioDocum[i].iIdTipoServico // Cássio Rovaroto - SIG nº 115585
                                              //Cássio Rovaroto - SIG nº 23656.58469 - Início
                                              );
       end;
       //MARCIO SANCHES SPINOSA - EDILAINE FERRARESI - 172384/9603 - FIM
       // Fim Pendência : 23048 - Marcos Topini

       //Bruno Bastos - Pend. 15867 - 25/10/2004 - Início
       If bMultiplasContas Then
         For i := 0 to Length(vLancaMB) - 1 do
         Begin
           CtrlDocumento.CcBaixasxDocum.SetValues(vLancaMB[i].rValor, 0,
                                                  Trunc(F_rIDPessoa),
                                                  0,
                                                  vLancaMB[i].iUnidNegoc,
                                                  CtrlParamIntegra.Plano,
                                                  vLancaMB[i].iIdPlanoPrev,
                                                  vLancaMB[i].iIdPatro,
                                                  vLancaMB[i].iIdSegregaCriter,
                                                  vLancaMB[i].sConta);

         End;
       //Bruno Bastos - Pend. 15867 - 25/10/2004 - Fim

       Result := CtrlDocumento.Insert;
       if not Result then begin
       begin
          MessageInfo := CtrlDocumento.MessageInfo;
          CtrlDocumento.EstornaIntegraOrc(CtrlDocumento.CodDocumento, Trunc(rPlnCodigoAux));      //edilaine SIG95404
          Exit;
       end
       end else begin
          rCodDocumentoAux := CtrlDocumento.CodDocumento;
       end;
       {
       //------------------------------------------------------------------------
       // Imposto Automático
       //------------------------------------------------------------------------
       CtrlImpostoRetido.DataProgramada    := FCdsMedicao.FieldByName('DATAPREVISTAVENC').AsDateTime;
       CtrlImpostoRetido.OperacaoDocumento := '2';
       CtrlImpostoRetido.IdForCli          := Trunc(cdsDadosContrato.FieldByName('IDFORCLI').AsFloat);
       CtrlImpostoRetido.CodDocumento      := Trunc(rCodDocumentoAux);
       CtrlImpostoRetido.NumLancto         := CtrlDocumento.Lanctodocum.NumLancto;
       CtrlImpostoRetido.ValorLancto       := rTotalLancto;
       CtrlImpostoRetido.ValorLiquido      := rTotalLancto;
       CtrlImpostoRetido.DataLancto        := FCdsMedicao.FieldByName('DATALANCAMENTO').AsDateTime;
       CtrlImpostoRetido.DataEmissao       := FCdsMedicao.FieldByName('DATAMEDICAO').AsDateTime;
       CtrlImpostoRetido.CodTipoDoc        := Trunc(cdsDadosContrato.FieldByName('CODTIPDOC').AsFloat);
       CtrlImpostoRetido.IdModulo          := Trunc(F_rIDModulo);
       CtrlImpostoRetido.IdEmpresa         := Trunc(F_rIDPessoa);
       CtrlImpostoRetido.IdUsuario         := Trunc(F_rIDUsuario);
       CtrlImpostoRetido.IdPlanoConta      := Trunc(cdsDadosForCli.FieldByName('PLANO').AsFloat);
       CtrlImpostoRetido.UsaPlanoPatro     := F_bUsaPlanoPatro;
       CtrlImpostoRetido.IntegraContab     := ( CtrlParamIntegra.IntegraContab and bContabiliza );
       CtrlImpostoRetido.RecPag            := sRecPag[1];

       //DAVID - Retenção de Imposto
       CtrlImpostoRetido.OnRetencaoINSS    := Self.OnRetencaoINSS;

       CtrlImpostoRetido.Incluir;
       }
       //---------------------------------------------------------------------------
       //Incluir novamente os alteradores
       //---------------------------------------------------------------------------
       if not FcdsAlteradores.IsEmpty then begin
          FcdsAlteradores.First;
          while not FcdsAlteradores.Eof do begin
             {DAVID - 10/03/06
             O bloco abaixo foi movido de fora para cá}
             CtrlDocumento.Prepare( OpLanctoDocum, odlAlterador );
             CtrlDocumento.PartidaDobrada := bPartidaDobrada;
             CtrlDocumento.IdEspAcesso    := F_rIDEspAcesso;
             CtrlDocumento.UsaPlanoPatro  := F_bUsaPlanoPatro;
             CtrlDocumento.IdUsuario      := Trunc(F_rIDUsuario);
             CtrlDocumento.IdModulo       := Trunc(F_rIDModulo);

             CtrlDocumento.Lanctodocum.SetValues(//FCdsMedicao.FieldByName('DATALANCAMENTO').AsDateTime,
                                                 FCdsAlteradores.FieldByName('DATALANCTO').AsDateTime,
                                                 Trunc(rCodDocumentoAux),
                                                 0,
                                                 FCdsAlteradores.FieldByName('VLRLIQUIDO').AsFloat,
                                                 FCdsAlteradores.FieldByName('VALOROUTRAMOEDA').AsFloat,
                                                 FCdsAlteradores.FieldByName('VALOR').AsFloat,
                                                 Trunc(FCdsAlteradores.FieldByName('UNIDNEGOC').AsFloat),
                                                 0,
                                                 0,
                                                 Trunc(F_rIDUsuario),
                                                 Trunc(F_rIDPessoa),
                                                 0,
                                                 0,
                                                 0,
                                                 0,
                                                 Trunc(FCdsAlteradores.FieldByName('CODALTERADOR').AsFloat),
                                                 '4',
                                                 FCdsAlteradores.FieldByName('NUMRECIBO').AsString,
                                                 '',
                                                 '',
                                                 FCdsAlteradores.FieldByName('HISTORICOCOMPL').AsString,
                                                 '',
                                                 '',
                                                 '',
                                                 FCdsAlteradores.FieldByName('DEBCRE').AsString,
                                                 Trunc(F_rIDModulo),
                                                 CtrlParamIntegra.Plano,
                                                 F_bUsaPlanoPatro,
                                                 bContabiliza
                                                 //Cássio Rovaroto - SIG nº 117685 - Início
                                                 , 0,
                                                 0,
                                                 '',
                                                 0,
                                                 0,
                                                 0,
                                                 FCdsAlteradores.FieldByName('IDTIPOSERVICO').AsInteger,
                                                 FCdsAlteradores.FieldByName('IDPROCESSO').AsInteger,
                                                 FCdsAlteradores.FieldByName('VALORBASERETENCAO').AsFloat
                                                 //Cássio Rovaroto - SIG nº 117685 - Fim
                                                 );

             Result := CtrlDocumento.Insert;
             if not Result then begin
                MessageInfo := CtrlDocumento.MessageInfo;
                Exit;
             end;

             FcdsAlteradores.Next;
          end;
       end;

     except
       //DAVID - Retenção de Imposto
       On E : Exception do
       begin

         CtrlDocumento.EstornaIntegraOrc(CtrlDocumento.CodDocumento, Trunc(rPlnCodigoAux));      //edilaine SIG95404

         Result := False;
         if ( E is EAbort ) then
           MessageInfo := ''
         else
           MessageInfo := E.Message;
       end;
     end;

   finally
      cdsDadosForCli.Free;
      cdsDadosContrato.Free;
   end;
end;



function TCtrlMedicao.StatusMedicaoRAD(const rIdContrato, iRad: Double; var iNumRad : Double): String;
var cdsTemp : TCMClientDataSet;
    sStatusRAD : TRADStatus;
begin
   try
     Result  := '';
     cdsTemp := TCMClientDataSet.Create( nil );
     cdsTemp.Data := GetDataPacket('SELECT M.* FROM MEDICAO M, PARCELAMEDICAO P WHERE M.IDCONTRATO = ' + FloatToStr(rIdContrato) +
                                   ' AND M.IDMEDICAO = '+ FloatToStr(iRad) + ' AND P.IDMEDICAO = M.IDMEDICAO AND P.CODDOCUMENTO IS NULL '
                                   );

     iNumRad := cdsTemp.FieldByName('NUMRAD').AsFloat;
     if (cdsTemp.IsEmpty) or(cdsTemp.FieldByName('NUMRAD').IsNull) then begin
        Result := 'A';
     end
     else
     begin
        sStatusRAD := CtrlRAD.StatusProcesso(cdsTemp.FieldByName('NUMRAD').AsFloat);
        case sStatusRAD of
           rsRecusado   : Result := 'R';
           rsAutorizado : Result := 'A';
           rsPendente   : Result := 'P';
           rsExcluido   : Result := 'E';
        end;
     end;
   finally
     FreeAndNil( cdsTemp );
   end;
end;


function TCtrlMedicao.AplicaDadosIntegrados(const iMedicao : String; const rNumAPgr: Double; const bContabiliza:Boolean = True): Boolean;
var
   sSQL : String;
begin
   Result := True;

   try
      StartTransacao;

      // Pend 17820 - Vinicius
      if not AplicaIntegracao(rNumAPgr, bContabiliza) then
         raise Exception.Create( MessageInfo );                  

      sSQL :=
      'UPDATE PARCELAREALCONTR '                                         + #13 +
      'SET    CODDOCUMENTO = ' + IntToStr(Trunc(rCodDocumentoAux)) + ',' + #13 +
      '       PLNCODIGO    = ' + IntToStr(Trunc(rPlnCodigoAux))          + #13 +
      'WHERE '                                                           + #13 +
      '       IDMEDICAO   IN ( ' + iMedicao + ')';
      if not ExecSql(sSQL) then raise exception.create('Não foi possível atualizar a Parcela da Medição');

      sSQL :=
      'UPDATE PARCELAMEDICAO '                                           + #13 +
      'SET    CODDOCUMENTO = ' + IntToStr(Trunc(rCodDocumentoAux))       + #13 +
      'WHERE '                                                           + #13 +
      '       IDMEDICAO   IN ( ' + iMedicao + ')';
      if not ExecSql(sSQL) then raise exception.create('Não foi possível atualizar a Parcela da Medição');

      Commit;
   except
      on E:Exception do begin
         Result := False;
         MessageInfo := E.Message;
         Rollback;
      end;
   end;
end;

function TCtrlMedicao.ListaMedicaoContrato(rIDContrato: Double): OleVariant;
var
   sSql : String;
begin
   sSql:=
   'SELECT * FROM PARCELAREALCONTR WHERE (CODDOCUMENTO IS NULL AND IDCONTRATO = '+FloatToStr(rIDContrato)+') ';
   Result:=GetDataPacket(sSql);
end;

procedure TCtrlMedicao.SetDataEstornoDoc(const Value: TdateTime);
begin
  FDataEstornoDoc := Value;
end;

function TCtrlMedicao.TestaCriaAlteradores: Boolean;
Var
  sSql: TwwQuery;

begin
  {SOL:189816 KTN:1793898 JRM6}
  // Propósito : Fazer chamada passando os parametros necessários ao
  //             Programa responsável pelo lançamento dos alteradores
  //             cadastrados para o tipo de desembolso.
  CtrlAlteradorImpostos := nil;
  //  1 - Testa se o objeto já foi criado
  if CtrlAlteradorImpostos = Nil then
  begin
    CtrlAlteradorImpostos := TCtrlAlteradorImpostos.create;
    CtrlAlteradorImpostos.InitializeAs(Self);
    ssql := TwwQuery.Create(Nil);
    ssql.DatabaseName := DatabaseName;
  end;

  //  2 - Preenche os campos necessários (Estes são do documento a pagar que se está criando).
  {}
  CtrlAlteradorImpostos.p_IDPESSOA  :=  1;
  Begin
    if ssql.Active then
      sSql.Close;

    ssql.SQL.Clear;
    ssql.sql.add('SELECT P.NUMDOCUMENTO');
    ssql.sql.add('  FROM PESSOA P');
    ssql.sql.add(' WHERE (P.IDPESSOA = '+ IntToStr( CtrlDocumento.IdForCli )+ ')');
    ssql.Open;
  end;
  CtrlAlteradorImpostos.p_coddocumento    :=  StrtoInt( FloatToStr( CtrlDocumento.CodDocumento));
  CtrlAlteradorImpostos.p_coddocumento    :=  CtrlAlteradorImpostos.p_coddocumento + 1;
//  v_CodtipRecDes  :=  '1050056';
  CtrlAlteradorImpostos.p_codTipRecDes    :=  v_CodtipRecDes;
  CtrlAlteradorImpostos.p_numlancto       :=  CtrlDocumento.Lanctodocum.NumLancto;

  // Recuperar o CNPJ do fornecedor pois os impostos podem ser acumulaodos por CNPJ
  CtrlAlteradorImpostos.p_CNPJBUSCAR      :=  sSql.FieldByName('NUMDOCUMENTO').AsString;
  sSql.Close;
  {
  if (CtrlAlteradorImpostos.p_coddocumento = 1) and (vCoddocumento_Alt <> 0 ) then
  begin
    CtrlAlteradorImpostos.p_coddocumento  := vCoddocumento_Alt + 1;
  end;
  {}
  CtrlAlteradorImpostos.p_plncodigo       :=  CtrlDocumento.PlnCodigo;
  CtrlAlteradorImpostos.p_datalancto      :=  CtrlDocumento.DataDisponibilidade;
  CtrlAlteradorImpostos.p_valor           :=  v_ValorDoc;
  CtrlAlteradorImpostos.p_VALORBRUTO      :=  v_ValorDoc;

  CtrlAlteradorImpostos.p_debcre          :=  v_Debcre;
  CtrlAlteradorImpostos.p_RecPag          :=  v_RecPag;
  //CtrlAlteradorImpostos.p_historicocompl  :=  CdsDet.FieldByName( 'HISTORICOCOMPL' ).AsString;
  //CtrlAlteradorImpostos.p_estorno         :=  V_Estorno;

  CtrlAlteradorImpostos.p_vlrliquido      :=  CtrlDocumento.Saldo.Valor;
  CtrlAlteradorImpostos.p_numfatura       :=  IntTostr( CtrlDocumento.GetNumFatura );
  {}
//  CtrlAlteradorImpostos.p_unidnegoc       :=  IntToStr( CtrlDocumento.UnidNegocio );
  {}
  CtrlAlteradorImpostos.p_codtipdoc       :=  v_codtipdoc;
  CtrlAlteradorImpostos.p_FlgSimples      :=  false;
  CtrlAlteradorImpostos.p_FlgEspecial     :=  False;
  //  3 - Dispara a geração de alteradores.
  //
  if v_CodDocumento <> FloatToStr( CtrlDocumento.CodDocumento) then
  begin
    v_CodDocumento := FloatToStr( CtrlDocumento.CodDocumento);
    CtrlAlteradorImpostos.VerificaAlteradores;
  end;
  //  4 - Destroy o objeto query criado e armazena o número do documento gerado
  //      Para referência.
  sSql.Close;
  FreeAndNil( sSql );

  Result := true;
  {SOL:189816 KTN:1793898 JRM6}
end;


function TCtrlMedicao.IFF(Condicao: boolean; Primeiro,
  Segundo: string): string;
begin
  if Condicao then begin
    IFF := Primeiro;
  end else  begin
    IFF := Segundo;
  end;
end;

function TCtrlMedicao.GetUltimaParcelaParaEstorno(
  rIDContrato, rIdObjeto, rIdItem: Double): Integer;
var
  sSQL : string;
begin
  sSQL := 'SELECT MAX(PARCELANUM) AS PARCELANUM FROM CTRLPARCELAMEDICAO CPM ' +
          ' WHERE IDCONTRATO = ' + FloatToStr(rIDContrato) +
          '   AND IDOBJETO = ' + FloatToStr(rIdObjeto) +
          '   AND IDITEM = ' + FloatToStr(rIdItem) +
          '   AND FLGPARCELAMEDIDA = 1 ' +
          '   AND NVL(CPM.IDADITAMENTO,0) = (SELECT NVL(MAX(IDADITAMENTO),0) FROM CTRLPARCELAMEDICAO CPM2 ' +
          '                                    WHERE CPM2.IDCONTRATO  = CPM.IDCONTRATO ' +
          '                                      AND CPM2.IDOBJETO  = CPM.IDOBJETO ' +
          '                                      AND CPM2.IDITEM  = CPM.IDITEM) ' +
          '   AND (CPM.IDCONTRATO IN (SELECT IDCONTRATO ' +
          '                              FROM CONTRATOUSUARIO '+
          '                             WHERE (IDUSUARIO = '+FloatToStr(Sistema.IdUsuario)+')))';

  _Cds.Data := GetDataPacket(sSQL);
  Result := _Cds.FieldByName('PARCELANUM').AsInteger;
end;

function TCtrlMedicao.ListProcessos(pIdForCli: Integer; pDataMedicao: TDateTime): OleVariant;
begin
	Result := GetDataPacket('SELECT IDPROCESSO, NUMERO '+
  												'	 FROM PROCESSOS '+
                          ' WHERE IDFORCLI = ' + IntToStr(pIdForCli) +
                          '   AND (DATAFIM IS NULL) OR (DATAFIM >= TO_DATE('+ QuotedStr(DateToStr(pDataMedicao))+ ', ''DD/MM/YYYY''))');
end;

function TCtrlMedicao.ListTipoServico: OleVariant;
begin
  Result := GetDataPacket('SELECT IDTIPOSERVICO, DESCRICAO FROM TIPOSERVICO');
end;

function TCtrlMedicao.ListaDadosCPRBFornecedor(
  pIdForCli: integer): OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT NVL(FLGCPRB,0) AS FLGCPRB, NVL(ALIQCPRB, 11) AS ALIQCPRB ' +
          '  FROM EMPRESAFORN ' +
  				' WHERE IDFORCLI =  ' + IntToStr(pIdForCli);

	Result := GetDataPacket(sSQL);
end;

function TCtrlMedicao.VerificaServicoMaoDeObra(pIdContrato,
  pIdObjeto: integer): Boolean;
var
  sSQL: string;
  cdsAux: TCMClientDataSet;
begin
  Result := False;
  try
    cdsAux := TCMClientDataSet.Create(nil);

    sSQL := 'SELECT NVL(OXI.FLGMAODEOBRA, ''N'') AS FLGMAODEOBRA' +
            '  FROM OBJETOSXITEMCONTR OXI ' +
  		  		' WHERE IDOBJETO =  ' + IntToStr(pIdObjeto) +
            '   AND IDCONTRATO = ' + IntToStr(pIdContrato);

	  cdsAux.Data := GetDataPacket(sSQL);

    Result := cdsAux.FieldByName('FLGMAODEOBRA').AsString = 'S';

  finally
    FreeAndNil(cdsAux);
  end;
end;

function TCtrlMedicao.LancamentoAlteradoresTributacao(iOperacao,
  pIdServico: Integer; pValorMedicao: Extended; pDataLanc: TDateTime; pDataVenc: TDateTime): Boolean;
var
   cdsAltTributo: TCMClientDataSet;
begin
  Result := False;
  cdsAltTributo := TCMClientDataSet.Create(nil);
  try
    cdsAltTributo.Data := CtrlListaServicos.GetTipoTributacaoServico(pIdServico);

    if not cdsAltTributo.IsEmpty then
    begin
      if not ((iOperacao = 2) and (VerificaAlteradorTribLancado(pIdServico))) or (iOperacao = 1) then
      begin
        if MsgDlg('Deseja fazer o registro de tributação?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrNO then
        begin
          if MsgDlg('Deseja continuar o lançamento?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYES then
          begin
            MsgDlg('Este lançamento indica a inclusão de tributação. ' + #13#10 +
                   'Faça o lançamento, se necessário, após o registro do documento', 'Aviso', mtWarning, [mbOK], 0);
            Result := True;
          end
          else
          Result := False;
        end
        else
        begin
          FCdsTributacao.Data := GetDadosAlterador(-1);

          while not cdsAltTributo.Eof do
          begin
            Result := RegistraDadosAlterador(pIdServico, cdsAltTributo.FieldByName('TIPOTRIBUTO').asInteger,
                                             pValorMedicao, pDataLanc, pDataVenc);
            if Result then
              cdsAltTributo.Next
            else
              Exit;
          end;

        end;
      end
      else
        Result := True;
    end
    else
      Result := True;
  finally
    FreeAndNil(cdsAltTributo);
  end;
end;

function TCtrlMedicao.RegistraDadosAlterador(pIdServico, pTipoTributo: Integer;
  pValorMedicao: Extended; pDataLanc, pDataVenc: TDateTime): Boolean;
var
  cdsAux: TCMClientDataSet;
  iCodAlterador: Integer;
  sDescAlterador: string;
  dAliquota : Double;
  sAcrescDesc: string;
  iPeriodoTributacao: Integer;
begin
  Result := False;
  cdsAux := TCMClientDataSet.Create(nil);
  try
    cdsAux.Data := CtrlListaServicos.GetAlteradorTributacaoServico(pIdServico, pTipoTributo);

    if not FCdsTributacao.Locate('CODALTERADOR', cdsAux.FieldByName('CODALTERADOR').asInteger, [loCaseInsensitive, loPartialKey]) then
    begin  
      if cdsAux.RecordCount = 1 then
      begin
        iCodAlterador := cdsAux.FieldByName('CODALTERADOR').asInteger;
        sDescAlterador := cdsAux.FieldByName('DESCRICAO').asString;
        dAliquota := cdsAux.FieldByName('ALIQUOTA').asFloat;
        sAcrescDesc := cdsAux.FieldByName('ACRESDECRES').asString;
        iPeriodoTributacao := cdsAux.FieldByName('PERTRIBUTO').asInteger;
        Result := True;
      end
      else
      begin
        try
          frmSelAltTributacao := TfrmSelAltTributacao.Create(nil);
          frmSelAltTributacao.Visible := False;
          frmSelAltTributacao.cdsAlteradores.Data  := CtrlListaServicos.GetAlteradorTributacaoServico(pIdServico, pTipoTributo);
          frmSelAltTributacao.lblText2.Caption := cdsAux.FieldByName('DESC_TIPOTRIBUTO').asString +
                                                  ' possui mais de um tipo de alterador.';
          frmSelAltTributacao.ShowModal;
          iCodAlterador := frmSelAltTributacao.iCodAlterador;
          sDescAlterador := frmSelAltTributacao.sDescricao;
          dAliquota := frmSelAltTributacao.dAliquota;
          sAcrescDesc := frmSelAltTributacao.sAcrescDesc;
          iPeriodoTributacao := frmSelAltTributacao.iPeriodoTributacao;

          Result := frmSelAltTributacao.bOperacaoOK;
        finally
          FreeAndNil(frmSelAltTributacao);
        end;
      end;

      if Result then
      begin
        try
          FCdsTributacao.Append;
          FCdsTributacao.FieldByName('CODALTERADOR').asInteger := iCodAlterador;
          FCdsTributacao.FieldByName('VALOR').asFloat := StrToFloat(FormatFloat('#0.00',(pValorMedicao * (dAliquota/100)))); // Cássio Rovaroto - WO 3524
          FCdsTributacao.FieldByName('VALOROUTRAMOEDA').asFloat := 0.00;
          FCdsTributacao.FieldByName('VLRLIQUIDO').asFloat := FCdsTributacao.FieldByName('VALOR').asFloat;
          FCdsTributacao.FieldByName('HISTORICOCOMPL').asString := EmptyStr;
          FCdsTributacao.FieldByName('UNIDNEGOC').asInteger := -1;

          if iPeriodoTributacao = 0 then
            FCdsTributacao.FieldByName('DATALANCTO').asDatetime := pDataLanc
          else
            FCdsTributacao.FieldByName('DATALANCTO').asDatetime := pDataVenc;

          FCdsTributacao.FieldByName('VALORBASERETENCAO').asFloat := pValorMedicao;
          FCdsTributacao.FieldByName('DEBCRE').asString := sAcrescDesc;
          FCdsTributacao.FieldByName('IDPESSOA').asInteger := Sistema.IdEmpresa;
          FCdsTributacao.FieldByName('CONTABILIZA').asString := 'S';
          FCdsTributacao.FieldByName('NUMRECIBO').asString := EmptyStr;
          FCdsTributacao.FieldByName('IDTIPOSERVICO').AsInteger := -1;
          FCdsTributacao.FieldByName('IDPROCESSO').asInteger := -1;
          FCdsTributacao.FieldByName('DESCRICAO').asString := sDescAlterador;
          FCdsTributacao.Post;
        except
          on e: Exception do
          begin
            Result := False;
            MsgDlg('Não possível registrar o alterador (' + e.Message + ')', 'Erro', mtError, [mbOK], 0);
          end;
        end;
      end
      else
      begin
        FCdsTributacao.DisableControls;
        FCdsTributacao.Filtered := False;
        FCdsTributacao.Filter := 'TIPOLANCALT = 1';
        FCdsTributacao.Filtered := True;

        while not FCdsTributacao.Eof do
        begin
          FCdsTributacao.Delete;
          FCdsTributacao.Next;
        end;
        FCdsTributacao.Filtered := False;
        FCdsTributacao.First;
        FCdsTributacao.EnableControls;

        MsgDlg('O registro de tributação não foi realizado. ', 'Aviso', mtWarning, [mbOK], 0);
        Result := False;
      end;
    end
    else
      Result := True;
  finally
    FreeAndNil(CdsAux);
  end;

end;

function TCtrlMedicao.GetDadosAlterador(pCodDocumento: Integer): OleVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT TA.DESCRICAO,                                 ' +#13#10+
          '  LC.DATALANCTO,                                     ' +#13#10+
          '  LC.VALOROUTRAMOEDA,                                ' +#13#10+
          '  LC.VALOR,                                          ' +#13#10+
          '  LC.HISTORICOCOMPL,                                 ' +#13#10+
          '  LC.DEBCRE,                                         ' +#13#10+
          '  LC.VLRLIQUIDO,                                     ' +#13#10+
          '  LC.UNIDNEGOC,                                      ' +#13#10+
          '  LC.IDPESSOA,                                       ' +#13#10+
          '  LC.CODALTERADOR,                                   ' +#13#10+
          '  (''S'') AS CONTABILIZA,                            ' +#13#10+
          '  LC.NUMRECIBO,                                      ' +#13#10+
          '  NVL(LC.VALORBASERETENCAO, 0) AS VALORBASERETENCAO, ' +#13#10+
          '  LC.IDTIPOSERVICO,                                  ' +#13#10+
          '  LC.IDPROCESSO                                      ' +#13#10+
          '  ,TA.CODNATUREZA                                    ' +#13#10+  //WO8227 - Helen V Bianchi
          'FROM                                                 ' +#13#10+
          '  LANCTODOCUM LC                                     ' +#13#10+
          'JOIN                                                 ' +#13#10+
          '  TIPOALTERADOR TA                                   ' +#13#10+
          '  ON                                                 ' +#13#10+
          '  TA.CODALTERADOR = LC.CODALTERADOR                  ' +#13#10+
          'WHERE                                                ' +#13#10;
  if pCodDocumento = -1 then
    sSQL := sSQL + '  LC.CODDOCUMENTO = -1                      '
  else
      sSQL := sSQL + '  LC.CODDOCUMENTO = ' + IntToStr(pCodDocumento);

  Result := GetDataPacket(sSQL);
end;

function TCtrlMedicao.VerificaAlteradorTribLancado(
  iIdServico: Integer): Boolean;
var
  iTipoTributoAnt, iTributoLanc, iAltLanc: Integer;
  cdsAux: TClientDataSet;
begin
  Result := False;
  iAltLanc := 0;
  iTributoLanc := 0;
  iTipoTributoAnt := -1;
  cdsAux := TClientDataSet.Create(nil);
  try
    cdsAux.Data := CtrlListaServicos.ListTributacaoServico(iIdServico);

    if not FCdsAlteradores.IsEmpty then
    begin
      while not cdsAux.Eof do
       begin
        if FCdsAlteradores.Locate('CODALTERADOR', cdsAux.FieldByName('CODALTERADOR').asInteger, [loCaseInsensitive, loPartialKey]) then
          Inc(iAltLanc);

        if (iTipoTributoAnt <> cdsAux.FieldByName('TIPOTRIBUTO').asInteger) then
         Inc(iTributoLanc);

        iTipoTributoAnt := cdsAux.FieldByName('TIPOTRIBUTO').asInteger;
        cdsAux.Next;
       end;

       if iAltLanc = iTributoLanc then
        Result := True;
    end;
  finally
    FreeAndNil(cdsAux);
  end;    
end;

procedure TCtrlMedicao.SetCdsTributacao(const Value: TCMClientDataSet);
begin
  FCdsTributacao := Value;
end;

function TCtrlMedicao.existeAtivProdServ: Boolean;
var
  cdsAux:  TCMClientDataSet;
  sSQL : string;
begin
  cdsAux := TCMClientDataSet.Create(nil);
  try
    sSQL :=  'SELECT 1 FROM LISTA_SERVICOS';
    cdsAux.Data := GetDataPacket(sSQL);

    if not cdsAux.IsEmpty then
      Result := True;
  finally
    FreeAndNil(cdsAux);
  end;
end;

procedure TCtrlMedicao.SetCdsAlteradores(const Value: TCMClientDataSet);
begin
  FCdsAlteradores := Value;
end;

end.



