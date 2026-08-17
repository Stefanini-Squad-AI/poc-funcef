{-------------------------------------------------------------------------------
-------------------------------- ALTERAÇÕES ------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
 N. SIG.............: 119748
 Data da Alteração..: 03/11/2021
 Responsável........: Ewerton Beltramini
 Descrição..........: Remanejando o Indice Banco 61 para seguir o mesmo fluxo do 62.
--------------------------------------------------------------------------------
Pendência   :  SIG 114623
Responsável :  Ewerton Beltramini
Data        :  29/01/2021
Descrição   :  Implementação do comando Copy, para igualar as bases de produção.
-------------------------------------------------------------------------------
 N. SIG.............: 103323
 Data da Alteração..: 07/12/2020
 Responsável........: Everson Cunha
 Descrição..........: Implementação do Modelo:
                                        BANCO CEF - SIACC - DEB - SEM FINANCEIRO
--------------------------------------------------------------------------------
Rotina.............: SetcdsConvBancario, Destroy, OnCreateAppServer,
                     AbreQueries, BuscaBaixa, MontaGrid
N. SIG.............: 63651
Data da Alteração..: 11/11/2019
Responsável........: Cássio Florencio Rovaroto
Descrição..........: Inclusão de tratamento de baixa de documento no
                     convênio SIACC 150.
--------------------------------------------------------------------------------
Rotina.............: bbtnConfirmarClick
N. SIG.............: 87371
Data da Alteração..: 05/07/2019
Responsável........: Taffarel Sevaybriker
Descrição..........: Correção para não alterar a descrição de alteradores na
                     baixa do doc.
--------------------------------------------------------------------------------
Rotina.............: SetQtdeBaixaETL, GerarArquivo, PegaCaminhoETL
N. SIG.............: 82888
Data da Alteração..: 14/03/2019
Responsável........: Cássio Florencio Rovaroto
Descrição..........: Alterações para leitura do arquivo de retorno via ETL.
--------------------------------------------------------------------------------
Rotina......: MontaGrid
Nº SIG......: SIG TIBERO
Data........: 30/10/2018
Responsável.: André Imakawa
Descrição...: Erro de memória insuficiente, foi necessario alterar rotina
              para utilizar apenas o objeto CdsAuxCodDoc. Objeto CdsAuxCodDoc
              está sendo destruido/contruido em tempo de execução a cada 500
              linhas do arquivo.
--------------------------------------------------------------------------------
Rotina......: bbtnConfirmarClick
Nº SIG......: 71002
Data........: 03/07/2018
Responsável.: Taffarel Sevaybriker
Descrição...: Ajuste no update da LANCTODOCUM para CODDOCUMENTO <= 8
--------------------------------------------------------------------------------
Rotina......: MontaGrid
Nº SOL......: 228964
Nº KINTANA..: 2062828
Data........: 26/03/2014
Responsável.: Thiago Melo
Descrição...: baixa automatica
--------------------------------------------------------------------------------
Rotina                : MontaGrid, bbtnConfirmarClick, ProcessaBaixaManual
N. Sol..........      : 214738_15892
N. Kintana......      : 2057238
Data da Alteração:    : 14/03/2014
Alteração Form:       : FBaixaIntBancoMT
Responsável:          : Paulo Nobre
Descrição.......      : Inclusão do campo FLGMARCADO
                        Inclusão do Parametro p/ indicar se a barra de progresso
                        será apresentada ou não.
                        Alteração na ProcessaBaixaManual p/ incluir o valor
                        zero na datalancamento
--------------------------------------------------------------------------------
Rotina......: bbtnConfirmarClick
Nº SOL......: 221860
Nº KINTANA..: 2054992
Data........: 10/12/2013
Responsável.: Edilaine Ferraresi
Descrição...: valida se baixa é total ou parcial
--------------------------------------------------------------------------------
Rotina..........: bbtnConfirmarClick, MontaGrid
N. Sol..........: 221352
N. Kintana......: 2053933
Data............: 26/11/2013
Responsável.....: Edilaine Ferraresi
Descrição.......: flag indicando baixa total
--------------------------------------------------------------------------------
Rotina..........: MontaGrid
N. Sol..........: 213402/14987
N. Kintana......: 2040787
Data............: 05/08/2013
Responsável.....: Thiago Melo
Descrição.......: Não inserir casos com operadores diferente de 5 na lanctodocum
                  através da rotina baixa automática do contas a receber.
--------------------------------------------------------------------------------
Rotina..........: MontaGrid
N. Sol..........: 213402
N. Kintana......: 2039896
Data............: 05/08/2013
Responsável.....: Thiago Melo
Descrição.......: Ajustar processo de baixa automática
--------------------------------------------------------------------------------
Rotina..........: MontaGrid
N. Sol..........: 210410
N. Kintana......: 2027839
Data............: 01/07/2013
Responsável.....: Thiago Melo
Descrição.......: Incluir filtro na select para que condicione
                  também o valor vindo arquivo
--------------------------------------------------------------------------------
Rotina..........: GerarArquivo
N. Sol..........: 187427-13894
N. Kintana......: 1920585
Data............: 24/01/2013
Responsável.....: Edilaine Ferraresi
Descrição.......: Incluir Codigo do modelo CNAB no arquivo ETL
--------------------------------------------------------------------------------
Rotina..........: bbtnConfirmarClick
N. Sol..........: 187427
N. Kintana......: 1793755
Data............: 07/01/2013
Responsável.....: Paulo Nobre
Descrição.......: Inclusão de Rotina para atualizar os lançamentos
                  com as ocorrências
--------------------------------------------------------------------------------
Rotina..........: SetbUsaPortFormaRetorno
N. Sol..........: 187427/12463
N. Kintana......: 185959
Data............: 12/12/2012
Responsável.....: Tadeu Passos
Descrição.......: Inclusão do campo CODOCORRENCIA
--------------------------------------------------------------------------------
Rotina..........: bbtnConfirmarClick
N. Sol..........: 191915
N. Kintana......: 1823081
Data............: 19/10/2012
Responsável.....: Edilaine Ferraresi
Descrição.......: commit dentro processamento dos documentos filhos
--------------------------------------------------------------------------------
Rotina......: MontaGrid
Nº SOL......: 183486
Nº KINTANA..: 1718525
Data........: 05/07/2012
Responsável.: Edilaine Ferraresi
Descrição...: filtro do grid para visualizar apenas recebimentos efetivados
--------------------------------------------------------------------------------
Rotina..........: bbtnConfirmarClick
N. Sol..........: 123366/10522
N. Kintana......: 1726805
Data............: 09/07/2012
Responsável.....: Helen V. Bianchi
Descrição.......: Alterado a regra Dt de Baixa p/ Doc Filho PGA
--------------------------------------------------------------------------------
Rotina..........: bbtnConfirmarClick
N. Sol..........: 126261/1121
N. Kintana......: 760963
Data............: 10/01/2012
Responsável.....: Helen V. Bianchi
Descrição.......: CdsDocsFilhoPag, CdsDocsFilhoRec
--------------------------------------------------------------------------------
Rotina......: bbtnConfirmarClick
Nº SOL......: 151965
Nº KINTANA..: 1124894
Data........: 07/12/2011
Responsável.: Arnaldo Vicente Scarin
Descrição...: Inclusão de um flag para indicar a baixa do arquivo de
              retorno SIGCB
--------------------------------------------------------------------------------
Rotina......: GerarArquivo, bbtnConfirmarClick
Nº SOL......: 155003
Nº KINTANA..: 1195982
Data........: 21/03/2011
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Correção para passar o campo "DATABAIXA" ao inves de
              "DataDisponibilidade". Implementação para trazer o
              proximo dia util.
--------------------------------------------------------------------------------
Rotina......: PegaCaminhoETL, VerificarBaixaETL, bbtnConfirmarClick
Nº SOL......: 124570/3781 e 124570/3782
Nº KINTANA..: 1136318 e 1136319
Data........: 08/02/2011
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Implementação para trazer o PathEtlProducao na utilização do
              ambiente de produção ou trazer PathEtlHom se outros.
--------------------------------------------------------------------------------
Rotina............: bbtnConfirmarClick
N. Sol.............: 124570
N. Kintana......: 103005
Data...............: 20/12/2010
Responsável...: Gustavo Oliveira
Descrição........: Criação do objeto CdsETL
--------------------------------------------------------------------------------
Rotina........: MontaGrid
N. Sol........: 148054
N. Kintana....: 1031906
Data..........: 23/11/2010
Responsável...: Brunno Mattos
Descrição.....: Inclusão do layout para apresentação do documento
                referente ao convênio 6034 que deve ser apresentado
                conforme layout 61 presente na uRetornoCobrMT.
--------------------------------------------------------------------------------
Rotina............: bbtnConfirmarClick
N. Sol.............: 133216
N. Kintana......: 775057
Data...............: 18/04/2010
Responsável...: Cássio Camargo
Descrição........: Correção do processo de Baixa Automática, que trata possível
                   erro em arquivo de retorno.
--------------------------------------------------------------------------------
Rotina............: bbtnConfirmarClick
N. Sol.............: 111077
N. Kintana......: 509193
Data...............: 10/03/2009
Responsável...: Ricardo Alves
Descrição........: Baixa manual/automática não estava sensibilizando
                   o financeiro. Também não estava agrupando as contas.
--------------------------------------------------------------------------------
Rotina............: bbtnConfirmarClick
N. Sol.............: 110469, 110532
N. Kintana......: 505144, 505141
Data...............: 04/03/2009
Responsável...: Ricardo Alves
Descrição........: Corrigido bug na geração de histórico de lançamentos.
--------------------------------------------------------------------------------
Rotina............: Destroy, OpenCdsInDesign
N. Sol.............: 103843
N. Kintana......: 464129
Data...............: 02/02/2009
Responsável...: Ricardo Alves
Descrição........: Modificado código para que os objetos sejam
                   corretamente liberados da memória após sua utilização.
--------------------------------------------------------------------------------
Rotina............: MontaGrid
N. Sol.............: 103842
N. Kintana......: 464127
Data...............: 26/01/2009
Responsável...: Ricardo Alves
Descrição........: Reestruturado código para que a sentença SQL seja montada
                   apenas uma vez. Efetuado um prepare no banco antes de
                   serem executadas as sentenças.
--------------------------------------------------------------------------------
Rotina    : BaixaDocumento
Data      : 01/09/2006
Pendência : 23195
Autor     : Andre Tavares
Descrição : Utilizar o float do código de liquidação de baixa se o mesmo
            estiver preenchido.
--------------------------------------------------------------------------------
  Autor      : André Tavares
  Rotina     : Diversas
  Data       : 30/05/2006
  Pendência  : 21102
  Descrição  : Adaptação para fazer o lançamento no cfinan de acordo com o
               portadorforma de retorno (vide sicob Cef CNAB 240 nota 42)
--------------------------------------------------------------------------------
 atualizado em 24/08/2004 - Andre tavares - pendência - 18013 - só processa um
 documento (um registro) por vez e não um pacote de dados cheio de documentos,
 portanto só vai fazer o commit para um documento por vez
--------------------------------------------------------------------------------
 atualizado em 24/08/2004 - Andre tavares - pendência 17412 -
                            criação do parâmetro pdataDisp na
                            rotina bbtnConfirmarClick
--------------------------------------------------------------------------------
 atualizado em 05/03/2004 - André Tavares - pendência 16170
--------------------------------------------------------------------------------
 atualizado em 25/07/2003 - André Tavares - pendência 14439
--------------------------------------------------------------------------------
 atualizado em 14/06/2004 - André Tavares - pendência 16953
--------------------------------------------------------------------------------
 atualizado em 11/01/2006 - Andre Tavares - pendencia 21229 - retira os zeros à
 esquerda do campo nossoNumero
--------------------------------------------------------------------------------}

Unit
   uCtrlBaixaIntBanco;

Interface

Uses
   SysUtils, Classes, DB, DbClient, uCmControlObject, uCmDbObject, uDataBase, ComCtrls,
   uCMTypes, uMidasUtil, JclStrings, uCMClientDataSet, uCMSqlParams, uCtrlIntBanco,
   uCtrlPadroes, uCtrlFinanc, uCtrlDocumento, uDtmBaixaIntBanco, uCtrlBaixaDocumentos,
   dbaseDados, usistema, ucmFileUtils, uMensErro, DBTables, windows, ExtCtrls,
   uCtrlBaixaRecXPag, uCtrlParamIntegra; //Helen - Sol: 126261/1121 - Kintana: 760963

Type

   TEventoLogFinanceiro = Procedure(Const sLog: String) Of Object; // evento para o log do financeiro

   TCtrlBaixaIntBanco = Class(TCmControlObject)

   Protected
      Procedure DoChangeDataBase; Override;
      Procedure OnCreateAppServer; Override;
      Procedure AfterInitialize; Override;
   Private
      DtmBaixaIntBanco: TDtmBaixaIntBanco;
      CtrlDocumento: TCtrlDocumento;
      CtrlLancFinanc: TCtrlFinanc;
      CtrlIntBanco: TCtrlIntBanco;
      CtrlBaixaDocumentos: TCtrlBaixaDocumentos;

      sDataLancto: String;

      FUsaPlanoPatro: Boolean;
      FIdUsuario: Double;
      FIdModulo: Double;
      FIdEspAcesso: Double;
      FIdEmpresa: Double;
      FPlanoConta: Double;
      FParamIntegraRecPag: String;
      FPrefixoServidor: String;
      FLancaBaixaFloat: Boolean;
      FPartidaDobrada: Boolean;
      FIntegraContab: Boolean;

      FCdsAuxCodDoc: TClientDataSet;
      FCdsPortaDorForma: TClientDataSet;
      FCdsModelosCnab: TClientDataSet;
      FCdsDocumentos: TClientDataSet;
      FCdsOcorrencia: TClientDataSet;
      FCdsAlt: TClientDataSet;
      FCdsAux: TClientDataSet;
      FCdsUnid: TClientDataSet;
      FCdsParamCAP: TClientDataSet;
      FCds: TClientDataSet;
      // Número do SOL: 124570 2981 Kintana 103005 - Baixa ETL Início
      FCdsETL: TClientDataSet;
      FsNomeArqLog: String;
      FbUsaPortFormaRetorno: boolean;
      FSequenceBaixa: Integer;
      FQryInsertETL: TQuery;
      FDataDisponibilidade: tdatetime;
      FChequeBordero: Double;
      FBaixaETL: Boolean;
      // Número do SOL: 124570 2981 Kintana 103005 - Baixa ETL Fim
      FQtdeBaixaETL: Integer; // Alterado por FHBS - SOL: 124570/3781 e 124570/3782 KTN: 1136318 e 1136319

      //Helen - Sol: 126261/1121 KTN:76963 - Inicio
      BaixaRecXPag: TCtrlBaixaRecXPag;
      FcdsDocsFilhoPag: TClientDataSet;
      FcdsDocsFilhoRec: TClientDataSet;
      FcdsConvBancario: TClientDataSet;
      Function PreencheDocFilho: OleVariant;
      //Helen - Sol: 126261/1121 KTN:76963 - Fim

      Function StrToFloatDef(sValor: String; rDefault: Double): Double;
      Function DevolveString(sString, sCaracter: String): String;
      Function Devolvevirgula(sString, sCaracter: String): String;

      Procedure SetCdsAlt(Const Value: TClientDataSet);
      Procedure SetCdsAux(Const Value: TClientDataSet);
      Procedure SetCdsAuxCodDoc(Const Value: TClientDataSet);
      Procedure SetCdsDocumentos(Const Value: TClientDataSet);
      Procedure SetCdsModelosCnab(Const Value: TClientDataSet);
      Procedure SetCdsOcorrencia(Const Value: TClientDataSet);
      Procedure SetCdsParamCAP(Const Value: TClientDataSet);
      Procedure SetCdsPortaDorForma(Const Value: TClientDataSet);
      Procedure SetCdsUnid(Const Value: TClientDataSet);
      Procedure SetCds(Const Value: TClientDataSet);
      Procedure SetsNomeArqLog(Const Value: String);
      Procedure SetCdsETL(Const Value: TClientDataSet);
      Function gravaLog(Const sConteudo: String): String;
      Procedure SetbUsaPortFormaRetorno(Const Value: boolean);
      Procedure SetcdsDocsFilhoPag(Const Value: TClientDataSet); //Helen - Sol: 126261/1121 KTN:76963
      Procedure SetcdsDocsFilhoRec(Const Value: TClientDataSet); //Helen - Sol: 126261/1121 KTN:76963
      procedure SetQtdeBaixaETL(const Value: Integer); //Cássio Rovaroto - SIG nº 82888
      procedure SetcdsConvBancario(const Value: TClientDataSet); //Cássio Rovaroto - SIG 63651
   Public
      OnBaixa: TEventoBaixa;
      OnGravaLogFinan: TEventoLogFinanceiro;
      // Número do SOL: 124570 2981 Kintana 103005 - Baixa ETL Início
      ArqDadosBaixa: TextFile;
      AlteradorAbat, AlteradorDesc, AlteradorJuros, AlteradorTarifa: Integer;
      // Número do SOL: 124570 2981 Kintana 103005 - Baixa ETL Fim

      //Cássio Rovaroto - SIG nº 82888 - Início
      sPathArqParamBaixa: string;

      Constructor Create; Override;
      Destructor Destroy; Override;

      Function AbreOcorrencia(pCmbModeloCnabLookupValue: String): Boolean;
      Function BuscaBaixa(pCmbModeloCnabLookupValue: Integer;
         pDlgAbrirFileName,
         pNomeEmpresa,
         pApresentaVisulaizacao : String; pDataRetorno: string = ''; pCodPortForma: Integer = -1): TStrings;   // Paulo Nobre - Sol 214738_15892  KTN 2057238 - 13/03/2014
      Function bbtnConfirmarClick(sModeloCNAB: String; psListaRetorno: TStrings;
         pCodPortForma: Integer;
         pNumChqBordero: Double;
         pDataBaixa: TDateTime;
         pDataLancamento: TDateTime; // Paulo Nobre - Sol 214738_15892  KTN 2057238 - 13/03/2014
         pDataDisp: TDateTime = 0; // André Tavares - pendência 17412 - 24/08/2004
         iCommit: integer = 100; // Alex commitar a x registros
         bSintetizaContabilidade: Boolean = false;
         pUsarETL: Boolean = True;
         bSIGCB: Boolean = False): Boolean;

      // Número do SOL: 124570 2981 Kintana 103005 - Baixa ETL Início
      Function GerarArquivo: Boolean;
      Function PegaCaminhoETL(pRECPag: String): String;
      Function InserirDadosBaixaAutoETL(pNomeProcesso: String; pUsuario: Integer;
         pModulo: Integer): Boolean;
      Function VerificarBaixaETL(pProcesso: Integer): Boolean;
      Function GerarArquivoLOG(pProcesso: Integer): Boolean;
      Procedure gerarSequenceETL;
      Procedure CarregaFilhoDocumento(pDocumento: Integer; pDadosBaixa: String;
         pDataDisponibilidade: String; pDmais: Integer; pCodAlteradorBaixa: String;
         pFloatFormPag, pFlgContabAlterador: String);

       function RetornaUltbaixaProc: Integer;
       function ExcluiDadosProcerssoBaixa(pIdProcesso: Integer): Boolean;

      // Número do SOL: 124570 2981 Kintana 103005 - Baixa ETL Fim

      Procedure AbreQueries;
      Procedure FechaQueries;
      Procedure MontaGrid(psListaRetorno: TStrings; pCmbModeloCnabLookupValue, pApresentaProgresso: String);
      procedure LimpaDocumentos; // Sol 214738_15892  KTN 2057238  Paulo Nobre   13/03/2014

      function RetornoViaETL(pIdModeloCNAB: Integer; pRecPag: string): Boolean;
      function RetornaDadosRetorno(pIdProcesso: Integer): OleVariant;

      function buscaFloat(pPortForma: Integer): integer;


      Property IdEmpresa: Double Read FIdEmpresa Write FIdEmpresa;
      Property IdModulo: Double Read FIdModulo Write FIdModulo;
      Property IdUsuario: Double Read FIdUsuario Write FIdUsuario;
      Property IdEspAcesso: Double Read FIdEspAcesso Write FIdEspAcesso;
      Property UsaPlanoPatro: Boolean Read FUsaPlanoPatro Write FUsaPlanoPatro;
      Property PlanoConta: Double Read FPlanoConta Write FPlanoConta;
      Property RecPag: String Read FParamIntegraRecPag Write FParamIntegraRecPag;
      Property PrefixoServidor: String Read FPrefixoServidor Write FPrefixoServidor;
      Property LancaBaixaFloat: Boolean Read FLancaBaixaFloat Write FLancaBaixaFloat;
      Property IntegraContab: Boolean Read FIntegraContab Write FIntegraContab;
      Property PartidaDobrada: Boolean Read FPartidaDobrada Write FPartidaDobrada;
      Property CdsDocumentos: TClientDataSet Read FCdsDocumentos Write SetCdsDocumentos;
      Property CdsPortaDorForma: TClientDataSet Read FCdsPortaDorForma Write SetCdsPortaDorForma;
      Property CdsParamCAP: TClientDataSet Read FCdsParamCAP Write SetCdsParamCAP;
      Property CdsOcorrencia: TClientDataSet Read FCdsOcorrencia Write SetCdsOcorrencia;
      Property CdsAux: TClientDataSet Read FCdsAux Write SetCdsAux;
      Property CdsUnid: TClientDataSet Read FCdsUnid Write SetCdsUnid;
      Property CdsModelosCnab: TClientDataSet Read FCdsModelosCnab Write SetCdsModelosCnab;
      Property CdsAlt: TClientDataSet Read FCdsAlt Write SetCdsAlt;
      Property CdsAuxCodDoc: TClientDataSet Read FCdsAuxCodDoc Write SetCdsAuxCodDoc;
      Property Cds: TClientDataSet Read FCds Write SetCds;
      Property sNomeArqLog: String Read FsNomeArqLog Write SetsNomeArqLog;
      Property bUsaPortFormaRetorno: boolean Read FbUsaPortFormaRetorno Write SetbUsaPortFormaRetorno; //  andre tavares 02/06/2006 - Pendência  : 21102 - propriedade que indica se usa portador forma de retorno para baixa
      // Número do SOL: 124570 2981 Kintana 103005 - Baixa ETL Início
      Property CdsETL: TClientDataSet Read FCdsETL Write SetCdsETL;
      Property SequenceBaixa: Integer Read FSequenceBaixa Write FSequenceBaixa;
      Property QryInsertETL: TQuery Read FQryInsertETL Write FQryInsertETL;
      Property DataDisponibilidade: TDateTime Read FDataDisponibilidade Write FDataDisponibilidade;
      Property ChequeBordero: Double Read FChequeBordero Write FChequeBordero;
      Property BaixaETL: Boolean Read FBaixaETL Write FBaixaETL;
      // Número do SOL: 124570 2981 Kintana 103005 - Baixa ETL Fim
          //Helen - Sol: 126261/1121 KTN:76963 - Inicio
      Property cdsDocsFilhoPag: TClientDataSet Read FcdsDocsFilhoPag Write SetcdsDocsFilhoPag;
      Property cdsDocsFilhoRec: TClientDataSet Read FcdsDocsFilhoRec Write SetcdsDocsFilhoRec;
      //Helen - Sol: 126261/1121 KTN:76963 - Fim
      property cdsConvBancario: TClientDataSet read FcdsConvBancario write SetcdsConvBancario; //Cássio Rovaroto - SIG 63651
      
      property QtdeBaixaETL: Integer read FQtdeBaixaETL write SetQtdeBaixaETL; //Cássio Rovaroto - SIG nº 82888

   End;

Implementation

Uses
   WWQuery, Provider, Dialogs, uDiasUteis;

{ TCtrlBaixaIntBanco }

Constructor TCtrlBaixaIntBanco.Create;
Begin
   Inherited;
   OnBaixa := Nil;
   OnGravaLogFinan := Nil;

   FbUsaPortFormaRetorno := false;
End;

Destructor TCtrlBaixaIntBanco.Destroy;
Begin
   If isAppServer Then FreeCds([CdsDocumentos, CdsPortaDorForma, CdsParamCAP,
         CdsOcorrencia, CdsAux, CdsUnid,
            CdsModelosCnab, CdsAlt, CdsAuxCodDoc,
            CdsETL,
            CdsDocsFilhoPag, CdsDocsFilhoRec]); //Helen- Sol: 126261/1121 - Kintana: 760963
   FreeAndNil(DtmBaixaIntBanco);
   FreeAndNil(CtrlDocumento);
   FreeAndNil(CtrlLancFinanc);
   FreeAndNil(CtrlIntBanco);
   FreeAndNil(CtrlBaixaDocumentos);
   FreeAndNil(FCds);
   //Helen- Sol: 126261/1121 - Kintana: 760963 - Inicio
   FreeAndNil(FCdsDocsFilhoPag);
   FreeAndNil(FCdsDocsFilhoRec);
   FreeAndNil(BaixaRecXPag);
   //Helen- Sol: 126261/1121 - Kintana: 760963 - Fim
   FreeAndNil(fCdsConvBancario);//Cássio Rovaroto - SIG nº 63651
   
   Inherited;
End;

Procedure TCtrlBaixaIntBanco.AfterInitialize;
Begin
   Inherited;
   Cds := TClientDataSet.Create(Nil);
   DtmBaixaIntBanco := TDtmBaixaIntBanco.Create(Nil);

   CtrlDocumento := TCtrlDocumento.Create;
   CtrlLancFinanc := TCtrlFinanc.Create(IdEmpresa, IdModulo, IdUsuario, UsaPlanoPatro);
   CtrlIntBanco := TCtrlIntBanco.Create;
   CtrlBaixaDocumentos := TCtrlBaixaDocumentos.Create;
   //Helen- Sol: 126261/1121 - Kintana: 760963
   BaixaRecXPag := TCtrlBaixaRecXPag.Create;
   BaixaRecXPag.InitializeAs(ParamIntegra);
   cdsDocsFilhoPag := TClientDataSet.Create(Nil);
   cdsDocsFilhoRec := TClientDataSet.Create(Nil);
   //Helen- Sol: 126261/1121 - Kintana: 760963- Fim

   DtmBaixaIntBanco.SqlDocumentos.ClientDataSet := CdsDocumentos;
   DtmBaixaIntBanco.SqlPortaDorForma.ClientDataSet := CdsPortaDorForma;
   DtmBaixaIntBanco.SqlParamCAP.ClientDataSet := CdsParamCAP;
   DtmBaixaIntBanco.SqlOcorrencia.ClientDataSet := CdsOcorrencia;
   DtmBaixaIntBanco.SqlAux.ClientDataSet := CdsAux;
   DtmBaixaIntBanco.SqlUnid.ClientDataSet := CdsUnid;
   DtmBaixaIntBanco.SqlModelosCnab.ClientDataSet := CdsModelosCnab;
   DtmBaixaIntBanco.SqlAlt.ClientDataSet := CdsAlt;
   DtmBaixaIntBanco.SqlAuxCodDoc.ClientDataSet := CdsAuxCodDoc;
   DtmBaixaIntBanco.SqlETL.ClientDataSet := CdsETL; // Número do SOL: 124570 2981 Kintana 103005 - Baixa ETL Início

   DtmBaixaIntBanco.sqlConvBancarioSIACC.ClientDataSet := cdsConvBancario; //Cássio Rovaroto - SIG nº 63651
   
   CtrlDocumento.OpenTransaction := False;
   CtrlLancFinanc.OpenTransaction := False;
   CtrlIntBanco.OpenTransaction := False;

   CtrlDocumento.IdModulo := Trunc(IdModulo);
   CtrlDocumento.IdUsuario := Trunc(IdUsuario);
   CtrlDocumento.UsaPlanoPatro := UsaPlanoPatro;
   CtrlDocumento.IdEspAcesso := Trunc(IdEspAcesso);

   CtrlDocumento.InitializeAs(Self);
   CtrlLancFinanc.InitializeAs(Self);
   CtrlIntBanco.InitializeAs(Self);
   CtrlBaixaDocumentos.InitializeAs(Self);
End;

Procedure TCtrlBaixaIntBanco.DoChangeDataBase;
Begin
   Inherited;

End;

Procedure TCtrlBaixaIntBanco.OnCreateAppServer;
Begin
   Inherited;
   CdsDocumentos := TClientDataSet.Create(Nil);
   CdsPortaDorForma := TClientDataSet.Create(Nil);
   CdsParamCAP := TClientDataSet.Create(Nil);
   CdsOcorrencia := TClientDataSet.Create(Nil);
   CdsAux := TClientDataSet.Create(Nil);
   CdsUnid := TClientDataSet.Create(Nil);
   CdsModelosCnab := TClientDataSet.Create(Nil);
   CdsAlt := TClientDataSet.Create(Nil);
   CdsAuxCodDoc := TClientDataSet.Create(Nil);
   CdsETL := TClientDataSet.Create(Nil);
   //Helen- Sol: 126261/1121 - Kintana: 760963 - Início
   CdsDocsFilhoPag := TClientDataSet.Create(Nil);
   CdsDocsFilhoRec := TClientDataSet.Create(Nil);
   //Helen- Sol: 126261/1121 - Kintana: 760963 - Fim
   cdsConvBancario := TClientDataSet.Create(nil); //Cássio rovaroto - SIG nº 63651

End;

Procedure TCtrlBaixaIntBanco.SetCdsAlt(Const Value: TClientDataSet);
Begin
   FCdsAlt := Value;
End;

Procedure TCtrlBaixaIntBanco.SetCdsAux(Const Value: TClientDataSet);
Begin
   FCdsAux := Value;
End;

Procedure TCtrlBaixaIntBanco.SetCdsAuxCodDoc(Const Value: TClientDataSet);
Begin
   FCdsAuxCodDoc := Value;
End;

Procedure TCtrlBaixaIntBanco.SetCdsDocumentos(Const Value: TClientDataSet);
Begin
   FCdsDocumentos := Value;
End;

Procedure TCtrlBaixaIntBanco.SetCdsModelosCnab(Const Value: TClientDataSet);
Begin
   FCdsModelosCnab := Value;
End;

Procedure TCtrlBaixaIntBanco.SetCdsOcorrencia(Const Value: TClientDataSet);
Begin
   FCdsOcorrencia := Value;
End;

Procedure TCtrlBaixaIntBanco.SetCdsParamCAP(Const Value: TClientDataSet);
Begin
   FCdsParamCAP := Value;
End;

Procedure TCtrlBaixaIntBanco.SetCdsPortaDorForma(Const Value: TClientDataSet);
Begin
   FCdsPortaDorForma := Value;
End;

Procedure TCtrlBaixaIntBanco.SetCdsUnid(Const Value: TClientDataSet);
Begin
   FCdsUnid := Value;
End;

Procedure TCtrlBaixaIntBanco.SetCds(Const Value: TClientDataSet);
Begin
   FCds := Value;
End;

Procedure TCtrlBaixaIntBanco.AbreQueries;
Begin
   With DtmBaixaIntBanco Do Begin
         SqlDocumentos.Open;

         CdsModelosCnab.Close;
         SqlModelosCnab.Prepare;
         SqlModelosCnab.ParamByName('PRECPAG').AsString := RecPag;
         SqlModelosCnab.Open;

         If Not SqlPortaDorForma.Prepared Then SqlPortaDorForma.Prepare;
         If Not SqlAlt.Prepared Then SqlAlt.Prepare;

         SqlParamcap.Sql.Text := 'SELECT ' +
            ' INTEGRACONTAB,HISTPADFINAN,CODALTERADORABAT,' +
            ' CODALTERADORDESC,CODALTERADORJUROS,CODALTERADORTARIF, FLGGERALOGFINAN ' +
            'FROM PARAMCAP ' +
            'WHERE (IDPESSOA = ' + FloatToStr(IdEmpresa) + ') AND ' +
            '(RECPAG = ''' + RecPag + ''')';
         SqlParamcap.Prepare;
         SqlParamcap.Open;

         Sqlunid.Sql.Text := 'SELECT UNIDNEGOC FROM ' + PrefixoServidor +
            'PARAMGLOBAL WHERE IDPESSOA = ' + FloatToStr(IdEmpresa);
         Sqlunid.Prepare;
         Sqlunid.Open;
         
         //Cássio Rovaroto - SIG nº 63651 - Início
         cdsConvBancario.Close;
         sqlConvBancarioSIACC.Prepare;
         sqlConvBancarioSIACC.ParamByName('PRECPAG').AsString := RecPag;
         sqlConvBancarioSIACC.Open;
         //Cássio Rovaroto - SIG nº 63651 - Fim
      End;
End;

Procedure TCtrlBaixaIntBanco.FechaQueries;
Begin
   If CdsAuxCodDoc.Active Then
      CdsPortaDorForma.Close;

   If DtmBaixaIntBanco.SqlPortaDorForma.Prepared Then
      DtmBaixaIntBanco.SqlPortaDorForma.UnPrepare;

   CdsAlt.Close;
   If DtmBaixaIntBanco.SqlAlt.Prepared Then
      DtmBaixaIntBanco.SqlAlt.UnPrepare;
End;

Function TCtrlBaixaIntBanco.AbreOcorrencia(pCmbModeloCnabLookupValue: String): Boolean;
Begin
   CdsOcorrencia.Close;

   DtmBaixaIntBanco.SqlOcorrencia.Sql.Text := 'SELECT ' +
      '  C.IDCODIGOSCNAB, ' +
      '  C.RECPAG, ' +
      '  C.IDMODELOSCNAB , ' +
      '  C.TIPO, ' +
      '  C.CODIGO, ' +
      '  C.DESCRICAO, ' +
      '  C.FLGINDICABAIXA, ' +

   // Rodolpho da Silva - P: 20932 - 21/12/2005
   '  C.FLGCONTABALTERADOR, ' +

   '  M.DESCRICAO AS DESCMODELO, C.CODALTERADOR ' + (* Gustavo - 06/03/2003 *)
   'FROM ' +
      '  CODIGOSCNAB C, MODELOSCNAB M ' +
      'WHERE ' +
      '  (C.IDMODELOSCNAB = ' + pCmbModeloCnabLookupValue + ') AND ' +
      '  (C.RECPAG = ''' + RecPag + ''') AND ' +
      '  (C.IDMODELOSCNAB = M.IDMODELOSCNAB) AND ' +
      '  (C.RECPAG = M.RECPAG) ';
   DtmBaixaIntBanco.SqlOcorrencia.Open;

   // Alterado por Arnaldo V. Scarin, em 01/07/2008
   // O Método RecordCount varre o resultSet todo, caso existam vários registros,
   // isso poderá se tornar demorado!
   //  If CdsOcorrencia.RecordCount = 0 Then Begin
   If CdsOcorrencia.IsEmpty Then
      Begin
         Result := False;

         If RecPag = 'R' Then
            MessageInfo := 'Falta indicação dos Códigos de Baixa para este tipo de Cobrança'
         Else
            MessageInfo := 'Falta indicação dos Códigos de Baixa para este tipo de Pagamento';

         CdsOcorrencia.Close;

      End
   Else
      Begin

         Result := True;
      End;
End;

Function TCtrlBaixaIntBanco.BuscaBaixa(pCmbModeloCnabLookupValue: Integer;
   pDlgAbrirFileName,
   pNomeEmpresa,
   pApresentaVisulaizacao, pDataRetorno : String;
   pCodPortForma: Integer): TStrings;  // Paulo Nobre - Sol 214738_15892  KTN 2057238 - 13/03/2014
Begin
   If RecPag = 'R' Then Begin
         //Cássio Rovaroto - SIG nº 63651 - Início
         if (pDlgAbrirFileName = '') and (pCodPortForma <> -1) then
          Result := CtrlIntBanco.BaixadeTitulosSiacc(pCmbModeloCnabLookupValue,
                                                     pNomeEmpresa,
                                                     pApresentaVisulaizacao,
                                                     pDataRetorno,
                                                     pCodPortForma)
         else
         //Cássio Rovaroto - SIG nº 63651 - Fim
          Result := CtrlIntBanco.BaixadeTitulosAutomatica(pCmbModeloCnabLookupValue,
                                                          pDlgAbrirFileName,
                                                          pNomeEmpresa, pApresentaVisulaizacao);    // Paulo Nobre - Sol 214738_15892  KTN 2057238 - 13/03/2014
      End Else Begin
         Result := CtrlIntBanco.BaixadeSispagAutomatica(pCmbModeloCnabLookupValue,
            pDlgAbrirFileName,
            pNomeEmpresa);
      End;
End;

// pendência 18013 - andre tavares - o log pode ser gravado também numa exceção dentro da function bbtnConfirmarClick

Function TCtrlBaixaIntBanco.gravaLog(Const sConteudo: String): String;
Var
   Arq: Text;
   sNomeArq: String;
Begin
   sNomeArq := 'Log_Docs_Nao_Recebidos_' + FormatDateTime('YYMMDD', Now) + '.txt';
   result := sNomeArq;
   AssignFile(Arq, sNomeArq);
   Try
      Try
         If Not FileExists(sNomeArq) Then
            Begin
               Rewrite(Arq);
               WriteLn(Arq, 'RELAÇÃO DE DOCUMENTOS GRUPADOS NÃO BAIXADOS');
               WriteLn(Arq, '--------------------------------------------------------------------------------------------------------------------------------------------------------------');
               WriteLn(Arq, 'RAZAO SOCIAL                                                     CODGRUPOCNAB             CODDOCUMENTO             NODOCUMENTO              DATA PROGRAMADA        VALOR                       MOTIVO');
               WriteLn(Arq, '---------------------------------------------------------------- ------------------------ ------------------------ ------------------------ ---------------------- --------------------------- -------------------------------------' +
                  '----------------------------------------------------------------------------------------------');
            End
         Else
            Append(Arq);

         WriteLn(Arq, sconteudo);
         Flush(Arq);
      Except
         MessageInfo := 'Não foi possível gravar o log de documentos rejeitados.'
      End;
   Finally
      CloseFile(Arq);
   End;
End;

Procedure TCtrlBaixaIntBanco.MontaGrid(psListaRetorno: TStrings; pCmbModeloCnabLookupValue, pApresentaProgresso: String);

Type
   TTipoChave = (tcDocumentoCompleto, tcDocumentoParcial, tcGrupoCompleto,
      tcGrupoParcial, tcNossoNumeroInt, tcNossoNumeroFloat);

Var
   X: Integer;
   sAux, SSQL,
      sFlgContabAlterador, // Rodolpho da Silva - P: 20932 - 21/12/2008
   //Cássio - SOL Nº 133216 KINTANA Nº 775057
   sSQLCond, strIBaixa, sCodAlterador, strDocumento: String;
   bChaveNossoNum, bRejeitaDocumento, blnQueryMontada: Boolean;

   cdsLocalAux, cdsSaldoDoc, cdsDocsCnab, cdsPortFormaRetorno: tDataSet;

   iLinValidas: integer; // Edilaine - SOL 191915 / KTN 1823081

   qryDocs: TWWQuery;
   //dtpDocs: TDataSetProvider; // André Imakawa - 30/10/2018 - Tibero
   varTipoChave: TTipoChave;
   SSQL_Aux: String; // André Imakawa - 30/10/2018 - Tibero

   // retorna o valor total liquido do documento
   Function PegaValorLiquidoDocum(codDocumento: integer): Extended;
   Begin
      result := 0;
      OpenDataSetParams(cdsSaldoDoc, ['CODDOCUMENTO'], vararrayof([CodDocumento]));
      result := cdsSaldoDoc.fieldByName('VALOR').asFloat;
   End;

   // retorna o valor total liquido dos documentos do grupoCnab
   Function PegaValorTotalGrupoCnab(codGrupoCnab: integer): Extended;
   Var valTotal: Extended;
   Begin
      result := 0;
      valTotal := 0;
      OpenDataSetParams(cdsDocsCnab, ['CODGRUPOCNAB'], vararrayof([codGrupoCnab]));

      cdsDocsCnab.First;
      While Not cdsDocsCnab.Eof Do
         Begin
            valTotal := valTotal + PegaValorLiquidoDocum(cdsDocsCnab.FieldByName('CODDOCUMENTO').asInteger);
            cdsDocsCnab.Next;
         End;
      result := valTotal;
   End;

Begin
   sNomeArqLog := '';
   bRejeitaDocumento := False;
   bChaveNossoNum := False;
   FbUsaPortFormaRetorno := False;

   Try
      // criando datasets PARA PREPARE UNICO
      cdsSaldoDoc := CreateDataSetParams(' SELECT ' +
         '  SUM(DECODE(LANC.DEBCRE,''D'',DECODE(DOC.RECPAG,''R'',LANC.VALOR,LANC.VALOR * -1),DECODE(DOC.RECPAG,''R'',LANC.VALOR * -1,LANC.VALOR))) AS VALOR, ' +
         '  SUM(DECODE(LANC.DEBCRE,''D'',DECODE(DOC.RECPAG,''R'',LANC.VALOROUTRAMOEDA,LANC.VALOROUTRAMOEDA * -1),DECODE(DOC.RECPAG,''R'',LANC.VALOROUTRAMOEDA * -1,LANC.VALOROUTRAMOEDA))) AS VALOROUTRAMOEDA ' +
         ' FROM  LANCTODOCUM LANC, DOCUMENTO DOC ' +
         ' WHERE DOC.CODDOCUMENTO = :CODDOCUMENTO ' +
         ' AND DOC.CODDOCUMENTO = LANC.CODDOCUMENTO ', ['CODDOCUMENTO'], [ftInteger]);

      cdsDocsCnab := CreateDataSetParams(' SELECT D.CODDOCUMENTO FROM DOCUMENTO D ' +
         ' WHERE D.CODGRUPOCNAB = :CODGRUPOCNAB ' +
         ' ORDER BY D.CODDOCUMENTO ASC ', ['CODGRUPOCNAB'], [ftInteger]);

      cdsLocalAux := CreateDataSetParams('SELECT CODDOCUMENTO, CODGRUPOCNAB FROM DOCUMENTO' +
         ' WHERE CODDOCUMENTO = :CODDOCUMENTO', ['CODDOCUMENTO'], [ftInteger]);

      cdsPortFormaRetorno := CreateDataSetParams(' SELECT PF.* FROM CODLIQBAIXACNAB CL, CODIGOSCNAB CC, PORTADORFORMA PF, FORMARECPAG FRP ' +
         ' WHERE CL.IDMODELOSCNAB = CC.IDMODELOSCNAB ' +
         ' AND CL.CODPORTFORMA = PF.CODPORTFORMA ' +
         ' AND PF.CODFORMA = FRP.CODFORMA ' +
         ' AND CC.CODIGO = :CODIGO ' +
         ' AND CL.CODIGOLIQ = :CODIGOLIQ ' +
         ' AND CL.IDMODELOSCNAB = :IDMODELOSCNAB ' +
         ' AND FRP.CODFORMABANCO = :CODFORMABANCO ',
         ['CODIGO', 'CODIGOLIQ', 'IDMODELOSCNAB', 'CODFORMABANCO'],
         [ftString, ftString, ftString, ftInteger, ftString]);

      // Paulo Nobre - Sol 214738_15892  KTN 2057238 - 13/03/2014
      If pApresentaProgresso = 'S' Then
         // Exibe o formprogresso
         OnBaixa([0, 1, 1, 1, 1, 'Aguardando...', 1, psListaRetorno.Count, 'Processando arquivo de retorno']);

      // Ricardo A. SOL: 103842 KTN: 464127
      // a query será montada apenas uma vez
      blnQueryMontada := False;

      If (RecPag = 'R') Then
         Begin
            x := 0;
            While (x <= psListaRetorno.Count - 1) And (Not blnQueryMontada) Do
               Begin

                  { sAux vai receber o CODIGO DE OCORRÊNCIA de RETORNO }
                  sAux := Trim(Copy(psListaRetorno[X], 26, 2));

                  // Se encontrar o código da ocorrência de retorno...
                  If (CdsOcorrencia.Locate('Codigo', sAux, [])) Then
                     Begin
                        strIBaixa := CdsOcorrencia.FieldByName('FLGINDICABAIXA').AsString;

                        //andre tavares - pendência 24978 - 15/06/2007 - inclui o 58
                        //Brunno Mattos - SOL 148054 KTN 1031906 - inclui o 61
                        If (CtrlIntBanco.IndiceDoBanco In
                           [0, 1, 2, 9, 10, 11, 12, 13, 14, 17, 19, 20, 21, 23, 50, 52, 55, 58, 59]) Then    //Ewerton Beltramini - 03/11/2021 - Sig 119748 - Retirado o cod 61
                           Begin
                              sAux := Trim(Copy(psListaRetorno[x], 41, 16));
                              bChaveNossoNum := false;
                              If Trim(sAux) = '' Then
                                 Begin
                                    sAux := Trim(Copy(psListaRetorno[x], 1, 15));
                                    bChaveNossoNum := true;
                                    varTipoChave := tcNossoNumeroInt;
                                 End;
                           End
                              //Para fazer o recebimento do cnab240 do banco do brasil
                        Else
                           If CtrlIntBanco.IndiceDoBanco = 7 Then
                              sAux := Trim(Copy(psListaRetorno[x], 1, 15))
                           Else
                             //Cássio Rovaroto - SIG nº 63651 - Início
                             if CtrlIntBanco.IndiceDoBanco in [61, 62, 63] then    //Ewerton Beltramini - 03/11/2021 - Sig 119748 - Adicionado o cod 61
                                sAux := Trim(Copy(psListaRetorno[x], 41, 20))
                             else
                             //Cássio Rovaroto - SIG nº 63651 - Fim
                                sAux := Trim(Copy(psListaRetorno[x], 1, 20));


                        { Alterar as remessas do contas a receber para gravar junto com a referencia para retorno
                          (CODDOCUMENTO) o FLGGRUPO. Testar na baixa se o primeiro caracter do sAux acima é igual
                          a S, se for fazer o select pelo CODGRUPOCNAB, se for N ou se for numérico faser como
                          está abaixo, pelo CODDOCUMENTO.
                          Implementar um loop para preencher a query de baixa pq o CODGRUPOCNAB pode trazer vários
                          registros }

                        SSQL := ' SELECT D.CODDOCUMENTO, D.IDPESSOA,D.CODSUBCONTA, D.PLACONTA, D.CODCENTROCUSTO, D.IDFORCLI, ' +
                           '     D.IDUSUARIOINCLUSAO, D.NODOCUMENTO, D.COMPLDOCUMENTO, D.DATAEMISSAO, ' +
                           '     D.DATAVENCTO, D.DATAPROGRAMADA, D.OPERACAO,  ' +
                           '     SUM(DECODE(L.DEBCRE,''D'',DECODE(D.RECPAG,''R'',L.VALOR,L.VALOR*-1),DECODE(D.RECPAG,''R'',L.VALOR*-1,L.VALOR))) AS VALOR, ' +
                           '     SUM(DECODE(L.DEBCRE,''D'',DECODE(D.RECPAG,''R'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA*-1),DECODE(D.RECPAG,''R'',L.VALOROUTRAMOEDA*-1,L.VALOROUTRAMOEDA))) AS VALOROUTRAMOEDA, ' +
                           '     DECODE(D.RECPAG,''P'',''D'',''C'') AS DEBCRE, ' +
                           '     D.IDMODULO, D.NOSSONUMERO, ' +
                           '     DECODE( P.NOME, NULL, P.RAZAOSOCIAL, P.NOME ) AS RAZAOSOCIAL, ' +
                           '     D.STATUS, D.CODPORTFORMA, ' +
                           // Thiago Melo SOL 213402 Kintana 2039896
                        '     D.RECPAG, D.STATUS, D.CODTIPDOC, D.PLANO, D.CODGRUPOCNAB' +
                           //                           '     D.RECPAG, D.STATUS, D.CODTIPDOC, D.PLANO, D.CODGRUPOCNAB, L.NUMLANCTO, L.VLRLIQUIDO ' +
      // Thiago Melo SOL 213402 Kintana 2039896
                        ', ''00'' AS CODLIQBAIXA ' +
                           ', ''00'' AS CODFORMAPAG ' +
                           ', ''0'' AS FLOATFORMAPAG ' +
                           ', ''00'' AS CODOCORRENCIA ' + // Edilaine - SOL 183486 / KTN 1718525
                        sFlgContabAlterador +
                           sCodAlterador +
                           ' FROM DOCUMENTO D, LANCTODOCUM L, PESSOA P ';
                        //Brunno Mattos - SOL 148054 KTN 1031906 - inclui o 61
                        If (CtrlIntBanco.IndiceDoBanco In
                           [0, 1, 2, 7, 9, 10, 11, 12, 13, 14, 17, 19, 20, 21, 23, 50, 52, 55, 58, 59, 61, 62, 63]) Then
                           Begin
                              //Se a primeira posição não for um NÚMERO.
                              If Not StrIsNumber(Copy(sAux, 1, 1)) Then
                                 Begin
                                    { Se a primeira posição for igual a 'S' ou 'N', significa que o
                                      arquivo de remessa foi gerado utilizando essa nova filosofia da
                                      baixa pelo GRUPO. Se a segunda posição não estiver em branco,
                                      significa que este documento foi gerado por outro sistema e não
                                      deve ser baixado. }
                                    If Not bChaveNossoNum Then // andre tavares - pendencia 19024
                                       Begin
                                          If copy(sAux, 1, 1) = 'S' Then
                                             Begin
                                                //SSQL := SSQL+ ' WHERE (D.CODGRUPOCNAB = ' + Trim(Copy(sAux,3,20)) + ') AND ';
                                                //Cássio - SOL Nº 133216 KINTANA Nº 775057 - Início
                                                //SSQL := SSQL+ ' WHERE (D.CODGRUPOCNAB = :pDoc) AND ';
                                                sSQLCond := ' WHERE (D.CODGRUPOCNAB = :pDoc) AND ';
                                                //Cássio - SOL Nº 133216 KINTANA Nº 775057 - Fim
                                                varTipoChave := tcGrupoParcial
                                             End
                                          Else
                                             Begin
                                                //SSQL := SSQL+ ' WHERE (D.CODDOCUMENTO = ' + Trim(Copy(sAux,3,20)) + ') AND ';
                                                //Cássio - SOL Nº 133216 KINTANA Nº 775057 - Início
                                                //SSQL := SSQL+ ' WHERE (D.CODDOCUMENTO = :pDoc) AND ';
                                                sSQLCond := ' WHERE (D.CODDOCUMENTO = :pDoc) AND ';
                                                //Cássio - SOL Nº 133216 KINTANA Nº 775057 - Fim
                                                varTipoChave := tcDocumentoParcial
                                             End;
                                       End
                                    Else
                                       //SSQL := SSQL+ ' WHERE (D.NOSSONUMERO LIKE ''%' + intToStr(strToInt(sAux)) + '%'') AND ' ;
                                       //Cássio - SOL Nº 133216 KINTANA Nº 775057 - Início
                                       //SSQL := SSQL+ ' WHERE (D.NOSSONUMERO LIKE :pDoc) AND ' ;
                                       sSQLCond := ' WHERE (D.NOSSONUMERO LIKE :pDoc) AND ';
                                    //Cássio - SOL Nº 133216 KINTANA Nº 775057 - Início

                                  { Se TRUE, significa que o documento foi gerado por outro sistema }
                                    If (Trim(Copy(sAux, 2, 1)) <> '') Then
                                       //Cássio - SOL Nº 133216 KINTANA Nº 775057 - Início
                                       //SSQL := SSQL+ ' (1 = 2) AND ';
                                       sSQLCond := ' (1 = 2) AND ';
                                    //Cássio - SOL Nº 133216 KINTANA Nº 775057 - Fim

                                 End
                              Else
                                 {Se for um NÜMERO, significa que o arquivo de remessa foi gerado
                                  pela rotina antiga.}
                                 //Brunno Mattos - SOL 148054 KTN 1031906 - inclui o 61
                                 If ((CtrlIntBanco.IndiceDoBanco = 50) Or (CtrlIntBanco.IndiceDoBanco = 61) or (CtrlIntBanco.IndiceDoBanco in [62, 63])) Then //se é convênio SICOV ou SIACC150
                                    Begin
                                       OpenDataSetParams(cdsLocalAux, ['CODDOCUMENTO'], vararrayof([StrToIntDef(sAux, 0)]));
                                       If Not cdsLocalAux.IsEmpty Then
                                          Begin
                                             If (trim(cdsLocalAux.fieldByName('CODGRUPOCNAB').asString) <> '') Then
                                                Begin
                                                   //SSQL := SSQL+ ' WHERE (D.CODGRUPOCNAB = ' + cdsLocalAux.fieldByName('CODGRUPOCNAB').asString + ') AND '
                                                   //Cássio - SOL Nº 133216 KINTANA Nº 775057 - Início
                                                   //SSQL := SSQL+ ' WHERE (D.CODGRUPOCNAB = :pDoc) AND ';
                                                   sSQLCond := ' WHERE (D.CODGRUPOCNAB = :pDoc) AND ';
                                                   //Cássio - SOL Nº 133216 KINTANA Nº 775057 - Fim
                                                   varTipoChave := tcGrupoCompleto
                                                End
                                             Else
                                                Begin
                                                   //SSQL := SSQL+ ' WHERE (D.CODDOCUMENTO = ' + sAux + ') AND ';
                                                   //Cássio - SOL Nº 133216 KINTANA Nº 775057 - Início
                                                   //SSQL := SSQL+ ' WHERE (D.CODDOCUMENTO = :pDoc) AND ';
                                                   sSQLCond := ' WHERE (D.CODDOCUMENTO = :pDoc) AND ';
                                                   //Cássio - SOL Nº 133216 KINTANA Nº 775057 - Fim
                                                   varTipoChave := tcDocumentoCompleto
                                                End;
                                          End;
                                    End
                                 Else
                                    Begin
                                       If Not bChaveNossoNum Then // andre tavares - pendencia 19024
                                          Begin
                                             //SSQL := SSQL+ ' WHERE (D.CODDOCUMENTO = ' + sAux + ') AND '
                                             //Cássio - SOL Nº 133216 KINTANA Nº 775057 - Início
                                             //SSQL := SSQL+ ' WHERE (D.CODDOCUMENTO = :pDoc) AND ';
                                             sSQLCond := ' WHERE (D.CODDOCUMENTO = :pDoc) AND ';
                                             //Cássio - SOL Nº 133216 KINTANA Nº 775057 - Fim
                                             varTipoChave := tcDocumentoCompleto
                                          End
                                       Else
                                          Begin
                                             //SSQL := SSQL+ ' WHERE (D.NOSSONUMERO LIKE ''%' + floatToStr(strToFloat(sAux)) + '%'') AND ' ;
                                             //Cássio - SOL Nº 133216 KINTANA Nº 775057 - Início
                                             //SSQL := SSQL+ ' WHERE (D.NOSSONUMERO LIKE :pDoc) AND ' ;
                                             sSQLCond := ' WHERE (D.NOSSONUMERO LIKE :pDoc) AND ';
                                             //Cássio - SOL Nº 133216 KINTANA Nº 775057 - Fim
                                             varTipoChave := tcNossoNumeroFloat
                                          End;
                                    End;

                           End
                        Else
                           //SSQL := SSQL+ ' WHERE (D.NOSSONUMERO LIKE ''%' + sAux + '%'') AND ' ;
                           //Cássio - SOL Nº 133216 KINTANA Nº 775057 - Início
                           //SSQL := SSQL+ ' WHERE (D.NOSSONUMERO LIKE :pDoc) AND ' ;
                           sSQLCond := ' WHERE (D.NOSSONUMERO LIKE :pDoc) AND ';
                        //Cássio - SOL Nº 133216 KINTANA Nº 775057 - Fim

                      //Cássio - SOL Nº 133216 KINTANA Nº 775057 - Início
                        If Copy(sSQLCond, Length(sSQLCond) - 3, 4) = 'AND ' Then
                           Begin
                              SSQL := SSQL + sSQLCond +
                                 '    (D.IDPESSOA = ' + FloatToStr(IdEmpresa) + ') AND ' +
                                 '    (D.RECPAG = ''R'') AND ' +
                                 '    ((D.STATUS <> ''2'') OR (D.STATUS IS NULL))  AND ' + // isso não traz mais os caras 4, pois foram baixados
                              '    (D.IDFORCLI = P.IDPESSOA) AND ' +
                                 '    (D.CODDOCUMENTO = L.CODDOCUMENTO) AND ' +
                                 '    (RTRIM(D.OPERACAO) IN (''1'',''2'',''3'',''14'')) ' +
                                 'GROUP BY D.CODDOCUMENTO, D.IDPESSOA,D.CODSUBCONTA, D.PLACONTA, D.CODCENTROCUSTO, D.IDFORCLI, ' +
                                 '         D.IDUSUARIOINCLUSAO, D.NODOCUMENTO, D.COMPLDOCUMENTO, D.DATAEMISSAO, ' +
                                 '         D.DATAVENCTO, D.DATAPROGRAMADA, D.OPERACAO, D.RECPAG,  ' +
                                 '         D.IDMODULO, ' +
                                 '         D.NOSSONUMERO, ' +
                                 '         DECODE( P.NOME, NULL, P.RAZAOSOCIAL, P.NOME ), ' +
                                 '         D.STATUS, D.CODPORTFORMA, ' +
                                 // Thiago Melo SOL 213402 Kintana 2039896
//'         D.RECPAG, D.STATUS, D.CODTIPDOC, D.PLANO, D.CODGRUPOCNAB, L.NUMLANCTO, L.VLRLIQUIDO';
                              '         D.RECPAG, D.STATUS, D.CODTIPDOC, D.PLANO, D.CODGRUPOCNAB';
                              // Thiago Melo SOL 213402 Kintana 2039896

                              blnQueryMontada := True;

                           End
                        Else
                        Begin
                              MsgDlg('Erro de parametrização em um dos documentos, no Arquivo de Retorno.' + #10#13 +
                                 'Verificar o arquivo e executar a baixa novamente.', 'Aviso', mtError, [mbOK], 0);
                              Abort;
                        End;
                        //Cássio - SOL Nº 133216 KINTANA Nº 775057 - Fim
                     End;
                  Inc(x);
               End;

            qryDocs := TwwQuery.Create(Nil);
            //dtpDocs := TDataSetProvider.Create(Nil); // André Imakawa - 30/10/2018 - Tibero
            Try

               // Edilaine - SOL 191915 / KTN 1823081
               // conta o no. de linhas válidas
               iLinValidas := 0;
               For x := 0 To psListaRetorno.Count - 1 Do
                  Begin
                     sAux := Trim(Copy(psListaRetorno[X], 26, 2));
                     If (CdsOcorrencia.Locate('Codigo', sAux, [])) Then
                        inc(iLinValidas);
                  End;

               // Edilaine - SOL 191915 / KTN 1823081 - fim
               qryDocs.Name := 'qryDocs';
               qryDocs.DatabaseName := 'BaseDados';

               //dtpDocs.Name := 'dtpDocs';  // André Imakawa - 30/10/2018 - Tibero
               //dtpDocs.DataSet := qryDocs; // André Imakawa - 30/10/2018 - Tibero

               qryDocs.SQL.Text := SSQL;
               qryDocs.Prepare();
               SSQL_Aux := SSQL;  // André Imakawa - 30/10/2018 - Tibero

               CdsAuxCodDoc.Close();
               //CdsAuxCodDoc.SetProvider(dtpDocs);  // André Imakawa - 30/10/2018 - Tibero

               //Monta Grid de Pagamento do CNAB
               For x := 0 To psListaRetorno.Count - 1 Do
                  Begin
                     Try
                        // Edilaine - SOL 191915 / KTN 1823081
                        // Anda o formprogresso
                        //if Assigned( OnBaixa ) then
                        //  OnBaixa([1,1,(x + 1),1,1,'Aguardando...', 1, psListaRetorno.Count,
                        //    'Processando arquivo de retorno']);
                        // Edilaine - SOL 191915 / KTN 1823081 - fim

                        { sAux vai receber o CODIGO DE OCORRÊNCIA de RETORNO }
                        sAux := Trim(Copy(psListaRetorno[X], 26, 2));

                        // Se eoncontrar o código da ocorrência de retorno...
                        If (CdsOcorrencia.Locate('Codigo', sAux, [])) Then
                           Begin

                              // Paulo Nobre - Sol 214738_15892  KTN 2057238 - 13/03/2014
                              If pApresentaProgresso = 'S' Then
                                 Begin
                                    // Edilaine - SOL 191915 / KTN 1823081
                                    If Assigned(OnBaixa) Then
                                       OnBaixa([1, 1, (x + 1), 1, 1, 'Aguardando...', 1, iLinValidas, 'Processando arquivo de retorno']);
                                    // Edilaine - SOL 191915 / KTN 1823081 - fim
                                 End;

                              strIBaixa := CdsOcorrencia.FieldByName('FLGINDICABAIXA').AsString;

                              If (CdsOcorrencia.FieldByName('FLGINDICABAIXA').ASSTRING = 'S') Then
                                 Begin
                                    If (CdsOcorrencia.FieldByName('CODALTERADOR').AsFloat = 0) Then
                                       Begin
                                          sCodAlterador := '0';
                                          sFlgContabAlterador := 'N';
                                       End
                                    Else
                                       Begin
                                          sCodAlterador := CdsOcorrencia.FieldByName('CODALTERADOR').AsString;
                                          sFlgContabAlterador := CdsOcorrencia.FieldByName('FLGCONTABALTERADOR').AsString;
                                       End;

                                    //Brunno Mattos - SOL 148054 KTN 1031906 - inclui o 61
                                    If (CtrlIntBanco.IndiceDoBanco In
                                       [0, 1, 2, 9, 10, 11, 12, 13, 14, 17, 19, 20, 21, 23, 50, 52, 55, 58, 59, 61]) Then
                                       Begin
                                          sAux := Trim(Copy(psListaRetorno[x], 41, 16));
                                          If (Trim(sAux) = '') Then
                                             sAux := Trim(Copy(psListaRetorno[x], 1, 15));
                                       End
                                          //Para fazer o recebimento do cnab240 do banco do brasil
                                    Else
                                       If (CtrlIntBanco.IndiceDoBanco = 7) Then
                                          sAux := Trim(Copy(psListaRetorno[x], 1, 15))
                                       Else If (CtrlIntBanco.IndiceDoBanco = 60) Then
                                          sAux := Trim(Copy(psListaRetorno[x], 1, 17))
                                       Else
                                       //Cássio Rovaroto - SIG nº 63651 - Início
                                       if (CtrlIntBanco.IndicedoBanco in [62, 63]) then
                                          sAux:= Trim(Copy(psListaRetorno[x],41,20))
                                       else
                                       //Cássio Rovaroto - SIG nº 63651 - Fim
                                          sAux := Trim(Copy(psListaRetorno[x], 1, 20));

                                    Case varTipoChave Of
                                       tcDocumentoCompleto: strDocumento := sAux;
                                       tcDocumentoParcial: strDocumento := Trim(Copy(sAux, 3, 20));
                                       tcGrupoCompleto:
                                          Begin
                                             OpenDataSetParams(cdsLocalAux,
                                                ['CODDOCUMENTO'], vararrayof([StrToIntDef(sAux, 0)]));
                                             strDocumento := cdsLocalAux.FieldByName('CODGRUPOCNAB').asString;
                                          End;
                                       tcGrupoParcial: strDocumento := Trim(Copy(sAux, 3, 20));
                                       tcNossoNumeroInt: strDocumento := '%' + IntToStr(strToInt(sAux)) + '%';
                                       tcNossoNumeroFloat: strDocumento := '%' + FloatToStr(strToFloat(sAux)) + '%';
                                    End;

                                 End;

                              CdsAuxCodDoc.Close();
                              qryDocs.Close();

                              // André Imakawa - 30/10/2018 - Tibero - Início

                              //CdsAuxCodDoc.SetProvider(dtpDocs);
                              //qryDocs.ParamByName('pDoc').AsString := strDocumento;
                              //qryDocs.Open();
                              //CdsAuxCodDoc.Open();

                              if (x mod 500) = 0 then
                              begin
                                FreeCds([CdsAuxCodDoc]);
                                CdsAuxCodDoc := TClientDataSet.Create(Nil);
                                SSQL_Aux := StringReplace(SSQL, ':pDoc', strDocumento, [rfReplaceAll, rfIgnoreCase]);
                                CdsAuxCodDoc.Data := GetDataPacket(SSQL_Aux);
                              end
                              else
                              begin
                                SSQL_Aux := StringReplace(SSQL, ':pDoc', strDocumento, [rfReplaceAll, rfIgnoreCase]);
                                CdsAuxCodDoc.Data := GetDataPacket(SSQL_Aux);
                              end;
                              // André Imakawa - 30/10/2018 - Tibero - Fim

                              If Not CdsAuxCodDoc.IsEmpty Then
                                 Begin
                                    CdsAuxCodDoc.First();
                                    While Not CdsAuxCodDoc.EOF Do
                                       Begin
                                          //andre tavares - pendência 24978 - 15/06/2007 - inclui o 58
                                          If CtrlIntBanco.IndiceDoBanco In [8, 55, 58, 59, 60] Then
                                             Begin
                                                CdsAuxCodDoc.Edit;

                                                //preeche a coluna de código de liquidação de baixa
                                                CdsAuxCodDoc.fieldByName('CODLIQBAIXA').asString :=
                                                   Copy(psListaRetorno[x], 176, 2);

                                                //andré tavares - pendência 21102 - 24/05/2006 -
                                                // este campo será preenchido pelo código de pagamento no
                                                // banco do arquivo de retorno do banco
                                                CdsAuxCodDoc.fieldByName('CODFORMAPAG').asString :=
                                                   Copy(psListaRetorno[x], 178, 2);

                                                cdsPortFormaRetorno.Close;
                                                //Busca o portadorforma de retorno adequado para baixa
                                                //andre tavares pendência 23789 - retirei o parâmetro
                                                // CODFORMABANCO, pois não é necessário e esva causando problemas
                                                //andre tavares - pendencia 23195 - 06/12/2006 - se não tiver float no arquivo de retorno
                                                If (StrToIntDef(Copy(psListaRetorno[x], 180, 1), 0) <> 0) Then //andre tavares - pendencia 23195 - 06/12/2006 - se não tiver float no arquivo de retorno
                                                   CdsAuxCodDoc.fieldByName('FLOATFORMAPAG').asString :=
                                                      Copy(psListaRetorno[x], 180, 1)
                                                Else
                                                   OpenDataSetParams(cdsPortFormaRetorno, ['CODIGO', 'CODIGOLIQ',
                                                      'IDMODELOSCNAB', 'CODFORMABANCO'],
                                                         VarArrayOf([CdsOcorrencia.FieldByName('CODIGO').asString,
                                                      CdsAuxCodDoc.fieldByName('CODLIQBAIXA').asString,
                                                         CtrlIntBanco.IndiceDoBanco,
                                                         CdsAuxCodDoc.fieldByName('CODFORMAPAG').asString])
                                                         );

                                                If (cdsPortFormaRetorno.Active) And
                                                   (Not cdsPortFormaRetorno.IsEmpty) Then
                                                   Begin
                                                      CdsAuxCodDoc.FieldByName('CODPORTFORMA').asInteger :=
                                                         cdsPortFormaRetorno.fieldByName('CODPORTFORMA').asInteger;

                                                      //Float para o código de liquidação de baixa
                                                      CdsAuxCodDoc.FieldByName('FLOATFORMAPAG').asInteger :=
                                                         cdsPortFormaRetorno.fieldByName('DMAIS').asInteger;

                                                      FbUsaPortFormaRetorno := True;
                                                   End
                                                Else
                                                   FbUsaPortFormaRetorno := False;

                                                CdsAuxCodDoc.Post;
                                             End;

                                          // Edilaine - SOL 183486 / KTN 1718525
                                          If ((CtrlIntBanco.IndiceDoBanco In [8, 60]) And (Copy(psListaRetorno[X], 26, 2) <> '06')) Or
                                             ((CtrlIntBanco.IndiceDoBanco In [50, 14, 61, 62, 63]) And (Copy(psListaRetorno[X], 26, 2) <> '00')) Then
                                             Begin
                                                //preeche a coluna de código de ocorrência de retorno
                                                CdsAuxCodDoc.Edit;
                                                CdsAuxCodDoc.fieldByName('CODOCORRENCIA').asString := Trim(Copy(psListaRetorno[X], 26, 2));
                                                //
                                                CdsAuxCodDoc.Post;
                                             End;
                                          // Edilaine - SOL 183486 / KTN 1718525 - fim

                                          If StrToFloatDef(DevolveString(Copy(psListaRetorno[x], 111, 20), ','), 0) >= 0 Then // andre tavares - 28/04/2004
                                             Begin
                                                Try
                                                   If Trim(CdsAuxCodDoc.FieldByName('STATUS').AsString) <> '2' Then
                                                      sDataLancto := DevolveString(Copy(psListaRetorno[x], 31, 10), '/');
                                                Except
                                                   sDataLancto := DateToStr(Date);
                                                End;

                                                CdsDocumentos.fieldByName('VALOR').EditMask := '#,##0.00;(#,##0.00)';

                                                If Not (CdsDocumentos.Locate('CODDOCUMENTO', VarArrayOf([CdsAuxCodDoc.FieldByName('CODDOCUMENTO').AsInteger]), [])) Then
                                                   Begin

                                                      CdsDocumentos.Append;

                                                      //início andre Tavares - 05/03/2004 - pendência 16170
                                                      If Not CdsAuxCodDoc.fieldByName('CodGrupoCnab').IsNull Then //se é grupamento de documentos
                                                         Begin
                                                            {Thiago Melo SOL 228964 Kintana 2062828
                                                            // inicio - andre tavares - 29/07/2004 - coloquei o float formatado como string para evitar problemas de comparação de valores
                                                            If (formatFloat('#,##0.00', PegaValorTotalGrupoCnab(CdsAuxCodDoc.fieldByName('CodGrupoCnab').asInteger)) = formatFloat('#,##0.00', StrToFloatDef(DevolveString(Copy(psListaRetorno[x], 111, 20), ','), 0))) Then
                                                               // fim - andre tavares - 29/07/2004
                                                               Begin
                                                            Thiago Melo SOL 228964 Kintana 2062828}
                                                                  CdsDocumentos.FieldByName('VALOR').AsFloat := PegaValorLiquidoDocum(CdsAuxCodDoc.FieldByName('CODDOCUMENTO').AsInteger);
                                                                  bRejeitaDocumento := false;
                                                          {  Thiago Melo SOL 228964 Kintana 2062828
                                                              End
                                                            Else
                                                               bRejeitaDocumento := true;
                                                             Thiago Melo SOL 228964 Kintana 2062828}
                                                         End
                                                      Else //senão, é um único documento
                                                         Begin
                                                            // inicio - andre tavares - 29/07/2004 - coloquei o float formatado como string para evitar problemas de comparação de valores

                                                            //Conforme orientação da FUNCEF, se for sicov e o valor pago for
                                                            //diferente do valor nominal do documento
                                                            bRejeitaDocumento := ((CtrlIntBanco.IndiceDoBanco = 50) Or (CtrlIntBanco.IndiceDoBanco = 61) or (CtrlIntBanco.IndiceDoBanco in [62, 63])) And //Brunno Mattos - SOL 148054 KTN 1031906 - inclui o 61
                                                            (formatFloat('#,##0.00', StrToFloatDef(DevolveString(Copy(psListaRetorno[x], 111, 20), ','), 0)) <>
                                                               formatFloat('#,##0.00', PegaValorLiquidoDocum(CdsAuxCodDoc.FieldByName('CODDOCUMENTO').AsInteger)));

                                                            // Thiago Melo SOL 210410 Kintana 2027839 Ini
                                                            {
                                                            CdsDocumentos.FieldByName('VALOR').AsFloat := StrToFloatDef(DevolveString(Copy(psListaRetorno[x], 111, 20), ','), 0);
                                                            CdsAuxCodDoc.Edit;
                                                            CdsAuxCodDoc.FieldByName('VALOR').AsFloat := CdsDocumentos.FieldByName('VALOR').AsFloat;
                                                            }
                                                            // Thiago Melo SOL 210410 Kintana 2027839 Fim

                                                            // Thiago Melo SOL 213402 Kintana 2039896 Ini
                                                            If CtrlIntBanco.IndiceDoBanco = 60 Then
                                                            Begin
                                                                  CdsDocumentos.FieldByName('VALOR').AsFloat := CdsAuxCodDoc.FieldByName('VALOR').AsFloat;
                                                                  CdsAuxCodDoc.Edit;
                                                                  CdsAuxCodDoc.FieldByName('VALOR').AsFloat := CdsDocumentos.FieldByName('VALOR').AsFloat;
                                                            End
                                                            Else
                                                            Begin
                                                                  CdsDocumentos.FieldByName('VALOR').AsFloat := StrToFloatDef(DevolveString(Copy(psListaRetorno[x], 111, 20), ','), 0);
                                                                  CdsAuxCodDoc.Edit;
                                                                  CdsAuxCodDoc.FieldByName('VALOR').AsFloat := CdsDocumentos.FieldByName('VALOR').AsFloat;
                                                            End;
                                                            // Thiago Melo SOL 213402 Kintana 2039896 Fim
                                                         End;

                                                      If bRejeitaDocumento Then // se rejeita o documento ou o grupo de documentos]
                                                         Begin
                                                            // este documento é rejeitado e gravado num log
                                                            sNomeArqLog := gravaLog(
                                                               CdsAuxCodDoc.FieldByName('RAZAOSOCIAL').asString +
                                                               StringOfChar(' ', 65 - length(CdsAuxCodDoc.FieldByName('RAZAOSOCIAL').asString)) +
                                                               CdsAuxCodDoc.FieldByName('CODGRUPOCNAB').asString +
                                                               StringOfChar(' ', 25 - length(CdsAuxCodDoc.FieldByName('CODGRUPOCNAB').asString)) +
                                                               CdsAuxCodDoc.FieldByName('CODDOCUMENTO').asString +
                                                               StringOfChar(' ', 25 - length(CdsAuxCodDoc.FieldByName('CODDOCUMENTO').asString)) +
                                                               CdsAuxCodDoc.FieldByName('NODOCUMENTO').asString +
                                                               StringOfChar(' ', 25 - length(CdsAuxCodDoc.FieldByName('NODOCUMENTO').asString)) +
                                                               CdsAuxCodDoc.FieldByName('DATAPROGRAMADA').asString +
                                                               StringOfChar(' ', 23 - length(CdsAuxCodDoc.FieldByName('DATAPROGRAMADA').asString)) +
                                                               formatFloat('#,##0.00', StrToFloatDef(DevolveString(Copy(psListaRetorno[x], 111, 20), ','), 0)) +
                                                               StringOfChar(' ', 25 - length(CdsAuxCodDoc.FieldByName('VALOR').asString)) +
                                                               'O VALOR TOTAL PAGO DO GRUPO DE DOCUMENTOS É DIFERENTE DO VALOR TOTAL ESPERADO.'
                                                               );
                                                            CdsDocumentos.FieldByName('VALOR').AsFloat := CdsAuxCodDoc.FieldByName('VALOR').AsFloat;
                                                         End
                                                            //fim andre Tavares - 05/03/2004 - pendência 16170
                                                      Else
                                                         Begin
                                                            //início - andré tavares - pendência 21102 - 24/05/2006 - este campo será preenchido pelo código de liquidação/baixa oriundo do arquivo de retorno do banco
                                                            CdsDocumentos.FieldByName('CODLIQBAIXA').asString := CdsAuxCodDoc.FieldByName('CODLIQBAIXA').asString;
                                                            CdsDocumentos.FieldByName('CODFORMAPAG').asString := CdsAuxCodDoc.fieldByName('CODFORMAPAG').asString;
                                                            //fim - andré tavares - pendência 21102 - 24/05/2006 - este campo será preenchido pelo código de liquidação/baixa oriundo do arquivo de retorno do banco

                                                            //andré tavares - pendência 23195 - 04/09/2006
                                                            CdsDocumentos.fieldByName('FLOATFORMAPAG').asString := CdsAuxCodDoc.fieldByName('FLOATFORMAPAG').asString;

                                                            CdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger := CdsAuxCodDoc.FieldByName('CODDOCUMENTO').AsInteger;
                                                            CdsDocumentos.FieldByName('IDPESSOA').AsInteger := CdsAuxCodDoc.FieldByName('IDPESSOA').AsInteger;
                                                            CdsDocumentos.FieldByName('PLACONTA').AsString := CdsAuxCodDoc.FieldByName('PLACONTA').AsString;
                                                            CdsDocumentos.FieldByName('CODCENTROCUSTO').AsString := CdsAuxCodDoc.FieldByName('CODCENTROCUSTO').AsString;
                                                            CdsDocumentos.FieldByName('CODSUBCONTA').AsInteger := CdsAuxCodDoc.FieldByName('CODSUBCONTA').AsInteger;
                                                            CdsDocumentos.FieldByName('IDFORCLI').AsInteger := CdsAuxCodDoc.FieldByName('IDFORCLI').AsInteger;
                                                            CdsDocumentos.FieldByName('IDUSUARIOINCLUSAO').AsInteger := CdsAuxCodDoc.FieldByName('IDUSUARIOINCLUSAO').AsInteger;
                                                            CdsDocumentos.FieldByName('NODOCUMENTO').AsFloat := CdsAuxCodDoc.FieldByName('NODOCUMENTO').AsFloat;
                                                            CdsDocumentos.FieldByName('COMPLDOCUMENTO').AsString := CdsAuxCodDoc.FieldByName('COMPLDOCUMENTO').AsString;
                                                            CdsDocumentos.FieldByName('DATAEMISSAO').AsDateTime := CdsAuxCodDoc.FieldByName('DATAEMISSAO').AsDateTime;
                                                            CdsDocumentos.FieldByName('DATAVENCTO').AsDateTime := CdsAuxCodDoc.FieldByName('DATAVENCTO').AsDateTime;
                                                            CdsDocumentos.FieldByName('DATAPROGRAMADA').AsDateTime := CdsAuxCodDoc.FieldByName('DATAPROGRAMADA').AsDateTime;
                                                            CdsDocumentos.FieldByName('OPERACAO').AsString := CdsAuxCodDoc.FieldByName('OPERACAO').AsString;
                                                            CdsDocumentos.FieldByName('NOSSONUMERO').AsString := CdsAuxCodDoc.FieldByName('NOSSONUMERO').AsString;
                                                            CdsDocumentos.FieldByName('RAZAOSOCIAL').AsString := CdsAuxCodDoc.FieldByName('RAZAOSOCIAL').AsString;
                                                            CdsDocumentos.FieldByName('DataBaixa').AsDateTime := StrToDate(sDataLancto);
                                                            CdsDocumentos.FieldByName('CODPORTFORMA').AsInteger := CdsAuxCodDoc.FieldByName('CODPORTFORMA').AsInteger;

                                                            // ALEX 07/12/2005 GRAVAR O CODTIPDOC E IDMODULO
                                                            CdsDocumentos.FieldByName('IDMODULO').AsInteger := CdsAuxCodDoc.FieldByName('IDMODULO').AsInteger;
                                                            CdsDocumentos.FieldByName('CODTIPDOC').AsInteger := CdsAuxCodDoc.FieldByName('CODTIPDOC').AsInteger;
                                                            CdsDocumentos.FieldByName('VALOROUTRAMOEDA').AsFloat := CdsAuxCodDoc.FieldByName('VALOROUTRAMOEDA').AsFloat;
                                                            CdsDocumentos.FieldByName('VALORNOMINAL').AsFloat := PegaValorLiquidoDocum(CdsAuxCodDoc.FieldByName('CODDOCUMENTO').AsInteger);
                                                            // fim - André Tavares - pendência 16953 - 14/06/2004

                                                            CdsDocumentos.FieldByName('DebCre').AsString := CdsAuxCodDoc.FieldByName('DEBCRE').AsString;

                                                            // Thiago Melo SOL 213402.14987 Kintana 2040787 ini
                                                            //CdsDocumentos.FieldByName('Juros').AsFloat := StrToFloatDef(DevolveString(Copy(psListaRetorno[x], 131, 20), ','), 0);
                                                            CdsDocumentos.FieldByName('Juros').AsFloat := 0;
                                                            //CdsDocumentos.FieldByName('Descontos').AsFloat := StrToFloatDef(DevolveString(Copy(psListaRetorno[x], 91, 20), ','), 0);
                                                            CdsDocumentos.FieldByName('Descontos').AsFloat := 0;
                                                            // Thiago Melo SOL 213402.14987 Kintana 2040787 fim

                                                            If CtrlIntBanco.IndiceDoBanco = 9 Then //HSBC   MARIA
                                                               CdsDocumentos.FieldByName('Abatimento').AsFloat := 0
                                                            Else
                                                               Begin
                                                                  //Thiago Melo SOL 213402.14987 Kintana 2040787
                                                                  // CdsDocumentos.FieldByName('Abatimento').AsFloat := StrToFloatDef(DevolveString(Copy(psListaRetorno[x], 71, 20), ','), 0);
                                                                  CdsDocumentos.FieldByName('Abatimento').AsFloat := 0;
                                                                  //Thiago Melo SOL 213402.14987 Kintana 2040787
                                                               End;
                                                            // início andre tavares - 28/04/2004 - pendência 16170
                                                            //Brunno Mattos - SOL 148054 KTN 1031906 - inclui o 61
                                                            If ((CtrlIntBanco.IndiceDoBanco = 50) Or (CtrlIntBanco.IndiceDoBanco = 61) or (CtrlIntBanco.IndiceDoBanco in [62, 63])) Then // sicov - CEF
                                                               Begin
                                                                  CdsDocumentos.FieldByName('TarifaBancaria').AsFloat := 0;
                                                               End
                                                            Else
                                                               Begin
                                                                  If (CdsDocumentos.FieldByName('VALOR').AsFloat <> 0) And
                                                                     (CdsDocumentos.FieldByName('VALOR').AsFloat >= CdsDocumentos.FieldByName('ValorNominal').AsFloat) Then
                                                                     CdsDocumentos.FieldByName('TarifaBancaria').AsFloat := {((CdsDocumentos.FieldByName('ValorNominal').AsFloat +
                                                                     // Thiago Melo SOL 213402.14987 Kintana 2040787 Ini
                                                                     //CdsDocumentos.FieldByName('Juros').AsFloat -
                                                                     StrToFloatDef(DevolveString(Copy(psListaRetorno[x], 131, 20), ','), 0) -
                                                                     CdsDocumentos.FieldByName('Descontos').AsFloat -
                                                                     CdsDocumentos.FieldByName('Abatimento').AsFloat) -
                                                                     CdsDocumentos.FieldByName('VALOR').AsFloat)
                                                               Else
                                                                  CdsDocumentos.FieldByName('TarifaBancaria').AsFloat :=}0;
                                                                  // Thiago Melo SOL 213402.14987 Kintana 2040787 Fim
                                                               End;

                                                            If CdsDocumentos.FieldByName('TarifaBancaria').AsFloat < 0 Then
                                                               CdsDocumentos.FieldByName('TarifaBancaria').AsFloat := 0;

                                                            CdsDocumentos.FieldByName('CODALTERADORBAIXA').AsString := sCodAlterador;
                                                            CdsDocumentos.FieldByName('FLGCONTABALTERADOR').AsString := sFlgContabAlterador;

                                                            // Edilaine - SOL 183486 / KTN 1718525
                                                            CdsDocumentos.FieldByName('CODOCORRENCIA').asString := CdsAuxCodDoc.FieldByName('CODOCORRENCIA').asString;

                                                            CdsDocumentos.FieldByName('flgbaixatotal').asString := 'S'; // Edilaine Ferraresi - SOL 221352 / KTN 2053933

                                                            // Paulo Nobre - Sol 214738_15892  KTN 2057238 - 13/03/2014
                                                            CdsDocumentos.FieldByName('FLGMARCADO').asString := 'S';

                                                            CdsDocumentos.Post;

                                                            // Paulo Nobre - Sol 214738_15892  KTN 2057238 - 13/03/2014
                                                            If pApresentaProgresso = 'S' Then
                                                               Begin
                                                                  // Edilaine - SOL 191915 / KTN 1823081
                                                                  // Anda o formprogresso
                                                                  If assigned(OnBaixa) Then
                                                                     //OnBaixa([1,CdsAuxCodDoc.RecNo,(x + 1),1,CdsAuxCodDoc.RecordCount,'Processando documento',1,psListaRetorno.Count,'Processando arquivo de retorno']);
                                                                     OnBaixa([1, CdsAuxCodDoc.RecNo, (x + 1), 1, CdsAuxCodDoc.RecordCount, 'Processando documento', 1, iLinValidas, 'Processando arquivo de retorno']);
                                                                  // Edilaine - SOL 191915 / KTN 1823081 - fim
                                                               End;
                                                         End;
                                                   End;
                                             End; // else
                                          CdsAuxCodDoc.Next;
                                          //início andre Tavares - 05/03/2004 - pendência 16170
                                          If bRejeitaDocumento Then
                                             Begin
                                                cdsDocumentos.Delete;
                                                bRejeitaDocumento := false;
                                             End;
                                          //fim andre Tavares - 05/03/2004 - pendência 16170
                                       End;
                                 End;

                           End;

                     Except
                        On E: Exception Do
                           MessageInfo := E.Message;
                     End;
                  End;
            Finally
               CdsAuxCodDoc.Close();
               //FreeAndNil(dtpDocs); // André Imakawa - 30/10/2018 - Tibero
               qryDocs.Close;
               qryDocs.UnPrepare();
               FreeAndNil(qryDocs);
            End;
         End
      Else
         Begin
            //Monta Grid Do Sispag
            For x := 0 To psListaRetorno.Count - 1 Do Begin
                  Try
                     If DevolveString(Copy(psListaRetorno[x], 76, 20), ',') <> '' Then Begin
                           If CtrlIntBanco.IndiceDoBanco = 0 Then Begin
                                 CdsOcorrencia.Close;
                                 With DtmBaixaIntBanco Do Begin
                                       SqlOcorrencia.Sql.Text := 'SELECT ' +
                                          '  C.IDCODIGOSCNAB, ' +
                                          '  C.RECPAG, ' +
                                          '  C.IDMODELOSCNAB , ' +
                                          '  C.TIPO, ' +
                                          '  C.CODIGO, ' +
                                          '  C.DESCRICAO, ' +
                                          '  C.FLGINDICABAIXA, ' +

                                       // Rodolpho da Silva - P: 20932 - 21/12/2005
                                       '  C.FLGCONTABALTERADOR, ' +

                                       '  M.DESCRICAO AS DESCMODELO, C.CODALTERADOR ' + (* Gustavo - 06/03/2003 *)
                                       'FROM ' +
                                          '  CODIGOSCNAB C, MODELOSCNAB M ' +
                                          'WHERE ' +
                                          '  (C.IDMODELOSCNAB = ' + pCmbModeloCnabLookupValue + ') AND ' +
                                          '  (C.RECPAG = ''' + RecPag + ''') AND ' +
                                          '  (C.IDMODELOSCNAB = M.IDMODELOSCNAB) AND ' +
                                          '  (C.RECPAG = M.RECPAG) AND ' +
                                          '  (C.FLGINDICABAIXA = ''S'') AND ' +
                                          '  (C.CODIGO IN (' + DevolveString(Copy(psListaRetorno[x], 76, 20), ',') + '))';
                                       SqlOcorrencia.Open;
                                    End;
                              End
                           Else
                              Begin
                                 CdsOcorrencia.Close;
                                 If Copy(psListaRetorno[x], 76, 2) = '01' Then
                                    sAux := ' AND C.CODIGO = ''01'' '
                                 Else
                                    If (CtrlIntBanco.IndiceDoBanco = 18) And (RecPag = 'P') Then //maria
                                       sAux := ' AND C.CODIGO IN (' + Devolvevirgula(Copy(psListaRetorno[x], 76, 32), ',') + ')'
                                    Else If ((CtrlIntBanco.IndiceDoBanco = 58) And (RecPag = 'P')) Or
                                       ((CtrlIntBanco.IndiceDoBanco = 59) And (RecPag = 'R')) Then //andre tavares - 06/07/2007
                                       sAux := ' AND C.CODIGO IN (' + Devolvevirgula(Copy(psListaRetorno[x], 76, 32), ',') + ')'
                                    Else
                                       sAux := ' AND C.CODIGO IN (' + DevolveString(Copy(psListaRetorno[x], 76, 20), ',') + ')';

                                 With DtmBaixaIntBanco Do
                                    Begin
                                       SqlOcorrencia.Sql.Text := 'SELECT ' +
                                          '  C.IDCODIGOSCNAB, ' +
                                          '  C.RECPAG, ' +
                                          '  C.IDMODELOSCNAB , ' +
                                          '  C.TIPO, ' +
                                          '  C.CODIGO, ' +
                                          '  C.DESCRICAO, ' +
                                          '  C.FLGINDICABAIXA, ' +

                                       // Rodolpho da Silva - P: 20932 - 21/12/2005
                                       '  C.FLGCONTABALTERADOR, ' +

                                       '  M.DESCRICAO AS DESCMODELO, C.CODALTERADOR ' + (* Gustavo - 06/03/2003 *)
                                       'FROM ' +
                                          '  CODIGOSCNAB C, MODELOSCNAB M ' +
                                          'WHERE ' +
                                          '  (C.IDMODELOSCNAB = ' + pCmbModeloCnabLookupValue + ') AND ' +
                                          '  (C.RECPAG = ''' + RecPag + ''') AND ' +
                                          '  (C.IDMODELOSCNAB = M.IDMODELOSCNAB) AND ' +
                                          '  (C.FLGINDICABAIXA = ''S'') AND ' +
                                          '  (C.RECPAG = M.RECPAG) ' + sAux;
                                       SqlOcorrencia.Open;
                                    End;
                              End;

                           If Not CdsOcorrencia.IsEmpty Then
                              Begin
                                 sAux := (Trim(Copy(psListaRetorno[x], 31, 20)));
                                 If (sAux <> '') Then
                                    Begin
                                       If FazQuery(CdsAuxCodDoc, ' SELECT D.CODDOCUMENTO, D.IDPESSOA,D.CODSUBCONTA, D.PLACONTA, D.CODCENTROCUSTO, D.IDFORCLI, ' +
                                          '     D.IDUSUARIOINCLUSAO, D.NODOCUMENTO, D.COMPLDOCUMENTO, D.DATAEMISSAO, ' +
                                          '      D.DATAVENCTO, D.DATAPROGRAMADA, D.OPERACAO,  ' +
                                          '     SUM(DECODE(L.DEBCRE,''D'',DECODE(D.RECPAG,''R'',L.VALOR,L.VALOR*-1),DECODE(D.RECPAG,''R'',L.VALOR*-1,L.VALOR))) AS VALOR, ' +
                                          '     SUM(DECODE(L.DEBCRE,''D'',DECODE(D.RECPAG,''R'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA*-1),DECODE(D.RECPAG,''R'',L.VALOROUTRAMOEDA*-1,L.VALOROUTRAMOEDA))) AS VALOROUTRAMOEDA, ' +
                                          '     DECODE(D.RECPAG,''P'',''D'',''C'') AS DEBCRE, ' +
                                          '     D.NOSSONUMERO, DECODE( P.NOME, NULL, P.RAZAOSOCIAL, P.NOME ) RAZAOSOCIAL, D.STATUS, D.CODPORTFORMA, P.NOME, ' +
                                          '     D.RECPAG, D.STATUS, D.CODTIPDOC, D.PLANO, D.CODGRUPOCNAB, L.NUMLANCTO, L.VLRLIQUIDO, ' +

                                          //andré tavares - pendência 21102 - 24/05/2006 - este campo será preenchido pelo código de liquidação/baixa oriundo do arquivo de retorno do banco
                                          ' ''00'' AS CODLIQBAIXA, ' +
                                          //andré tavares - pendência 21102 - 24/05/2006 - este campo será preenchido pelo código de pagamento no banco do arquivo de retorno do banco
                                          ' ''00'' AS CODFORMAPAG, ' +
                                          //andré tavares - pendência 23195 - 01/09/2006 - float para o código de liquidação de baixa
                                          ' ''0'' AS FLOATFORMAPAG, ' +

                                          // Rodolpho da Silva - P: 20932 - 21/12/2005
                                          '  ''N'' AS FLGCONTABALTERADOR, ' +

                                          '     (0) AS CODALTERADORBAIXA, ' + (* Gustavo - 06/03/2003 *)
                                          //início - andré Tavares - pendência 22528 - pega o lote do documento para colocar no histórico contábil
                                          ' (SELECT MAX(NUMLOTE) FROM LOTEXDOCUM WHERE CODDOCUMENTO =  ' + sAux + ') AS NUMLOTE ' +
                                          //fim - andré Tavares - pendência 22528

                                          ' FROM DOCUMENTO D, LANCTODOCUM L, PESSOA P ' +
                                          ' WHERE (D.CODDOCUMENTO = ' + sAux + ') AND ' +
                                          '    (D.IDPESSOA = ' + FloatToStr(IdEmpresa) + ') AND ' +
                                          '    (D.RECPAG = ''P'') AND ' +
                                          '    ((D.STATUS <> ''2'') OR (D.STATUS IS NULL)) AND ' +
                                          '    (D.IDFORCLI = P.IDPESSOA) AND ' +
                                          '    (D.CODDOCUMENTO = L.CODDOCUMENTO) AND ' +
                                          '    (D.OPERACAO = L.OPERACAO) AND ' + //andre tavares - pendência 23586 - 20/10/2006
                                          '    (RTRIM(D.OPERACAO) IN (''1'',''2'',''3'',''14''))' +
                                          ' GROUP BY D.CODDOCUMENTO, D.IDPESSOA,D.CODSUBCONTA, D.PLACONTA, D.CODCENTROCUSTO, D.IDFORCLI, ' +
                                          '     D.IDUSUARIOINCLUSAO, D.NODOCUMENTO, D.COMPLDOCUMENTO, D.DATAEMISSAO, ' +
                                          '     D.DATAVENCTO, D.DATAPROGRAMADA, D.OPERACAO, D.RECPAG, ' +
                                          '     D.NOSSONUMERO, DECODE( P.NOME, NULL, P.RAZAOSOCIAL, P.NOME ), D.STATUS, D.CODPORTFORMA, P.NOME, ' +
                                          '     D.RECPAG, D.STATUS, D.CODTIPDOC, D.PLANO, D.CODGRUPOCNAB, L.NUMLANCTO, L.VLRLIQUIDO') Then
                                          If StrToFloatDef(DevolveString(Copy(psListaRetorno[x], 61, 15), ','), 0) > 0 Then
                                             Begin
                                                Try
                                                   If Trim(CdsAuxCodDoc.FieldByName('STATUS').AsString) <> '2' Then
                                                      sDataLancto := DevolveString(Copy(psListaRetorno[x], 51, 10), '/');
                                                Except
                                                   sDataLancto := DateToStr(Date);
                                                End;

                                                CdsDocumentos.fieldByName('VALOR').EditMask := '#,##0.00;(#,##0.00)';

                                                If Not (CdsDocumentos.Locate('CODDOCUMENTO', VarArrayOf([CdsAuxCodDoc.FieldByName('CODDOCUMENTO').AsInteger]), [])) Then
                                                   Begin
                                                      CdsDocumentos.Append;
                                                      //andré tavares - pendência 21102 - 24/05/2006 - este campo será preenchido pelo código de liquidação/baixa oriundo do arquivo de retorno do banco
                                                      CdsDocumentos.FieldByName('CODLIQBAIXA').asString := CdsAuxCodDoc.FieldByName('CODLIQBAIXA').asString;
                                                      CdsDocumentos.FieldByName('CODFORMAPAG').asString := CdsAuxCodDoc.fieldByName('CODFORMAPAG').asString;
                                                      //fim - andré tavares - pendência 21102 - 24/05/2006 - este campo será preenchido pelo código de liquidação/baixa oriundo do arquivo de retorno do banco

                                                      //andré tavares - pendência 23195 - 01/09/2006 - float para o código de liquidação de baixa
                                                      CdsDocumentos.FieldByName('FLOATFORMAPAG').asString := CdsAuxCodDoc.fieldByName('FLOATFORMAPAG').asString;

                                                      CdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger := CdsAuxCodDoc.FieldByName('CODDOCUMENTO').AsInteger;
                                                      CdsDocumentos.FieldByName('IDPESSOA').AsInteger := CdsAuxCodDoc.FieldByName('IDPESSOA').AsInteger;
                                                      CdsDocumentos.FieldByName('PLACONTA').AsString := CdsAuxCodDoc.FieldByName('PLACONTA').AsString;
                                                      CdsDocumentos.FieldByName('CODCENTROCUSTO').AsString := CdsAuxCodDoc.FieldByName('CODCENTROCUSTO').AsString;
                                                      CdsDocumentos.FieldByName('CODSUBCONTA').AsInteger := CdsAuxCodDoc.FieldByName('CODSUBCONTA').AsInteger;
                                                      CdsDocumentos.FieldByName('IDFORCLI').AsInteger := CdsAuxCodDoc.FieldByName('IDFORCLI').AsInteger;
                                                      CdsDocumentos.FieldByName('IDUSUARIOINCLUSAO').AsInteger := CdsAuxCodDoc.FieldByName('IDUSUARIOINCLUSAO').AsInteger;
                                                      CdsDocumentos.FieldByName('NODOCUMENTO').AsFloat := CdsAuxCodDoc.FieldByName('NODOCUMENTO').AsFloat;
                                                      CdsDocumentos.FieldByName('COMPLDOCUMENTO').AsString := CdsAuxCodDoc.FieldByName('COMPLDOCUMENTO').AsString;
                                                      CdsDocumentos.FieldByName('DATAEMISSAO').AsDateTime := CdsAuxCodDoc.FieldByName('DATAEMISSAO').AsDateTime;
                                                      CdsDocumentos.FieldByName('DATAVENCTO').AsDateTime := CdsAuxCodDoc.FieldByName('DATAVENCTO').AsDateTime;
                                                      CdsDocumentos.FieldByName('DATAPROGRAMADA').AsDateTime := CdsAuxCodDoc.FieldByName('DATAPROGRAMADA').AsDateTime;
                                                      CdsDocumentos.FieldByName('OPERACAO').AsString := CdsAuxCodDoc.FieldByName('OPERACAO').AsString;
                                                      CdsDocumentos.FieldByName('NOSSONUMERO').AsString := CdsAuxCodDoc.FieldByName('NOSSONUMERO').AsString;
                                                      CdsDocumentos.FieldByName('RAZAOSOCIAL').AsString := CdsAuxCodDoc.FieldByName('RAZAOSOCIAL').AsString;
                                                      CdsDocumentos.FieldByName('DataBaixa').AsDateTime := StrToDate(sDataLancto);
                                                      CdsDocumentos.FieldByName('CODPORTFORMA').AsInteger := CdsAuxCodDoc.FieldByName('CODPORTFORMA').AsInteger;

                                                      //início - andre tavares - pendência 23586 - 20/10/2006
                                                      CdsDocumentos.FieldByName('VALOR').asString := Copy(psListaRetorno[x], 61, 15);
                                                      //fim - andre tavares - pendência 23586 - 20/10/2006

                                                      CdsDocumentos.FieldByName('VALOROUTRAMOEDA').AsFloat := 0;

                                                      CdsDocumentos.FieldByName('ValorNominal').AsFloat := CdsAuxCodDoc.FieldByName('VALOR').AsFloat;

                                                      CdsDocumentos.FieldByName('DebCre').AsString := CdsAuxCodDoc.FieldByName('DEBCRE').AsString;
                                                      CdsDocumentos.FieldByName('Juros').AsFloat := 0;
                                                      CdsDocumentos.FieldByName('Descontos').AsFloat := 0;
                                                      CdsDocumentos.FieldByName('Abatimento').AsFloat := 0;
                                                      CdsDocumentos.FieldByName('TarifaBancaria').AsFloat := 0;
                                                      CdsDocumentos.FieldByName('RECPAG').AsString := CdsAuxCodDoc.FieldByName('RECPAG').AsString;
                                                      CdsDocumentos.FieldByName('STATUS').AsString := CdsAuxCodDoc.FieldByName('STATUS').AsString;
                                                      CdsDocumentos.FieldByName('CODTIPDOC').AsString := CdsAuxCodDoc.FieldByName('CODTIPDOC').AsString;
                                                      CdsDocumentos.FieldByName('PLANO').AsInteger := CdsAuxCodDoc.FieldByName('PLANO').AsInteger;
                                                      CdsDocumentos.FieldByName('CODGRUPOCNAB').AsInteger := CdsAuxCodDoc.FieldByName('CODGRUPOCNAB').AsInteger;
                                                      CdsDocumentos.FieldByName('NUMLANCTO').AsInteger := CdsAuxCodDoc.FieldByName('NUMLANCTO').AsInteger;
                                                      CdsDocumentos.FieldByName('VLRLIQUIDO').AsFloat := CdsAuxCodDoc.FieldByName('VLRLIQUIDO').AsFloat;
                                                      CdsDocumentos.FieldByName('CODALTERADORBAIXA').AsFloat := CdsAuxCodDoc.FieldByName('CODALTERADORBAIXA').AsFloat; (* Gustavo - 06/03/2003 *)
                                                      // Rodolpho da Silva - P: 20932 - 21/12/2005
                                                      CdsDocumentos.FieldByName('FLGCONTABALTERADOR').AsString := CdsAuxCodDoc.FieldByName('FLGCONTABALTERADOR').AsString;
                                                      //início - andré Tavares - pendência 22528 - pega o lote do documento para colocar no histórico contábil
                                                      CdsDocumentos.FieldByName('NUMLOTE').AsString := CdsAuxCodDoc.FieldByName('NUMLOTE').AsString;
                                                      //fim - andré Tavares - pendência 22528

                                                      CdsDocumentos.FieldByName('flgbaixatotal').asString := 'S'; // Edilaine Ferraresi - SOL 221352 / KTN 2053933

                                                      CdsDocumentos.Post;

                                                      // Paulo Nobre - Sol 214738_15892  KTN 2057238 - 13/03/2014
                                                      If pApresentaProgresso = 'S' Then
                                                         Begin
                                                            If assigned(OnBaixa) Then
                                                               OnBaixa([1, 0, psListaRetorno.count, cdsDocumentos.RecordCount, 'Selecionando Documentos para Baixa']); // andre tavares 07/12/2006

                                                            // Anda o formprogresso
                                                            If assigned(OnBaixa) Then
                                                               OnBaixa([1, CdsAuxCodDoc.RecNo, (x + 1), 1, CdsAuxCodDoc.RecordCount, 'Processando documento', 1, psListaRetorno.Count, 'Processando arquivo de retorno']);
                                                         End;

                                                   End;
                                             End;
                                    End;
                              End;
                        End;
                  Except
                     On E: Exception Do MessageInfo := E.Message;
                  End;
               End;
         End;
   Finally

      // 14/06/2008 - ### André tavares - para consertar o erro "insufficient memory for this operation"
      cdsSaldoDoc.Close;
      cdsDocsCnab.Close;
      cdsLocalAux.Close;
      cdsPortFormaRetorno.Close;

      FreeAndNil(cdsSaldoDoc);
      FreeAndNil(cdsDocsCnab);
      FreeAndNil(cdsLocalAux);
      FreeAndNil(cdsPortFormaRetorno);
   End;
End;

Function TCtrlBaixaIntBanco.bbtnConfirmarClick(
   sModeloCNAB: String;
   psListaRetorno: TStrings;
   pCodPortForma: Integer;
   pNumChqBordero: Double;
   pDataBaixa: TDateTime;
   pDataLancamento: TDateTime; // Paulo Nobre - Sol 214738_15892  KTN 2057238 - 13/03/2014
   pDataDisp: TDateTime = 0; // André Tavares - pendência 17412 - 24/08/2004
   iCommit: integer = 100; // alex commitar a cada x registros
   bSintetizaContabilidade: Boolean = false;
   pUsarETL: Boolean = True;
   bSIGCB: Boolean = False): Boolean;
Var
   iCodPortForma, intContador: Integer;
   sBaixaObservacao, sHistorico, sCodDocumento, sCodOcorrencia: String; // Paulo Nobre - Sol 187427 Kintana 1793755
   _PlnCodigoBaixa, _CodLancFinancBaixa, i: integer;
   bLancaFinanceiro: boolean;
   dDataDisp_Filho: TDateTime; //Helen - Sol: 126621/1121 - KTN: 760963
   lstDocumento: TStringList; // Edilaine - SOL 191915 / KTN 1823081
Begin
   lstDocumento := TStringList.create; // Edilaine - SOL 191915 / KTN 1823081

   If Assigned(Self.OnBaixa) Then
      CtrlBaixaDocumentos.OnBaixa := Self.OnBaixa; // andre tavares - 07/12/2006

   If Assigned(Self.OnGravaLogFinan) Then
      CtrlBaixaDocumentos.OnLogFinan := Self.OnGravaLogFinan;

   Result := False;

   // Início - Rodolpho da Silva - P: 22526 - 06/06/2006
   _Cds.Data := GetDataPacket('SELECT LANCAFINANC FROM PARAMCAP WHERE RECPAG = ''P''');
   bLancaFinanceiro := (_Cds.FieldByName('LANCAFINANC').AsString = 'N');
   // Fim - Rodolpho da Silva - P: 22526 - 06/06/2006

   If (pCodPortForma = 0) Then
      Begin
         CdsDocumentos.First; // andre tavares - 07/12/2006
         CtrlDocumento.Lote.GetNumLote(CdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger);
         iCodPortForma := CtrlDocumento.Lote.CodPortForma;
      End
   Else
      iCodPortForma := pCodPortForma;

   Try
      Try

         //-- Prepara o dataSet para o método (Fcds) // Paulo Nobre
         Cds.Data := CtrlBaixaDocumentos.GetEmptyCdsBaixa(True);

         _PlnCodigoBaixa := 0;
         _CodLancFinancBaixa := 0;
         CdsDocumentos.First;
         CdsDocumentos.LogChanges := false;
         fCds.LogChanges := false;

         // Ricardo A. SOL: 103843 KTN: 464129
         While (Not CdsDocumentos.Eof) Do
            Begin
               // inicia transação
               StartTransaction();
               If (pUsarETL) Then
                  Begin
                     iCommit := CdsDocumentos.RecordCount;
                  End;

               lstDocumento.clear; // Edilaine - SOL 191915 / KTN 1823081

               For intContador := 1 To iCommit Do
                  Begin
                     // Sol 214738_15892  KTN 2057238  Paulo Nobre   13/03/2014
                     If CdsDocumentos.FieldByName('FLGMARCADO').AsString = 'S' Then
                        Begin
                           lstDocumento.add(CdsDocumentos.FieldByName('CODDOCUMENTO').AsString); // Edilaine - SOL 191915 / KTN 1823081

                           fCds.Append;
                           fCds.FieldByName('IDFORCLI').AsInteger := CdsDocumentos.FieldByName('IDFORCLI').AsInteger;
                           fCds.FieldByName('OPERACAO').AsString := CdsDocumentos.FieldByName('OPERACAO').AsString;
                           fCds.FieldByName('CODTIPDOC').AsInteger := CdsDocumentos.FieldByName('CODTIPDOC').AsInteger;
                           fCds.FieldByName('IDPESSOA').AsInteger := CdsDocumentos.FieldByName('IDPESSOA').AsInteger;
                           fCds.FieldByName('CODDOCUMENTO').AsInteger := CdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger;
                           fCds.FieldByName('NODOCUMENTO').AsInteger := CdsDocumentos.FieldByName('NODOCUMENTO').AsInteger;
                           fCds.FieldByName('COMPLDOCUMENTO').AsString := CdsDocumentos.FieldByName('COMPLDOCUMENTO').AsString;
                           fCds.FieldByName('DATAPROGRAMADA').AsDateTime := CdsDocumentos.FieldByName('DATAPROGRAMADA').AsDateTime;
                           fCds.FieldByName('DATAVENCTO').AsDateTime := CdsDocumentos.FieldByName('DATAVENCTO').AsDateTime;
                           fCds.FieldByName('RECPAG').AsString := CdsDocumentos.FieldByName('RECPAG').AsString;
                           fCds.FieldByName('NOME').AsString := CdsDocumentos.FieldByName('RAZAOSOCIAL').AsString;
                           fCds.FieldByName('STATUS').AsString := CdsDocumentos.FieldByName('STATUS').AsString;
                           fCds.FieldByName('MOECODIGO').AsInteger := 0;
                           fCds.FieldByName('PLANO').AsInteger := CdsDocumentos.FieldByName('PLANO').AsInteger;
                           fCds.FieldByName('PLACONTA').AsString := CdsDocumentos.FieldByName('PLACONTA').AsString;
                           fCds.FieldByName('CODSUBCONTA').AsInteger := CdsDocumentos.FieldByName('CODSUBCONTA').AsInteger;
                           fCds.FieldByName('CODCENTROCUSTO').AsString := CdsDocumentos.FieldByName('CODCENTROCUSTO').AsString;
                           fCds.FieldByName('CODGRUPOCNAB').AsInteger := CdsDocumentos.FieldByName('CODGRUPOCNAB').AsInteger;
                           fCds.FieldByName('NOSSONUMERO').AsString := CdsDocumentos.FieldByName('NOSSONUMERO').AsString;
                           fCds.FieldByName('NUMLANCTO').AsInteger := CdsDocumentos.FieldByName('NUMLANCTO').AsInteger;
                           fCds.FieldByName('VALOROUTRAMOEDA').AsFloat := CdsDocumentos.FieldByName('VALOROUTRAMOEDA').AsFloat;
                           fCds.FieldByName('DEBCRE').AsString := CdsDocumentos.FieldByName('DEBCRE').AsString;
                           fCds.FieldByName('VLRLIQUIDO').AsFloat := CdsDocumentos.FieldByName('VLRLIQUIDO').AsFloat;
                           fCds.FieldByName('VALOR').AsFloat := CdsDocumentos.FieldByName('VALOR').AsFloat;
                           fCds.FieldByName('CODALTERADORBAIXA').AsFloat := CdsDocumentos.FieldByName('CODALTERADORBAIXA').AsFloat;

                           // Alterado por FHBS - SOL: 155003 KTN: 1195982
                           fCds.FieldByName('DATABAIXA').AsDateTime := CdsDocumentos.FieldByName('DATABAIXA').AsDateTime;

                           //início - andre tavares - pendencia 21102 - 30/05/2006 -
                           fCds.FieldByName('CODPORTFORMA').AsInteger := CdsDocumentos.FieldByName('CODPORTFORMA').AsInteger;

                           //andré tavares - pendência 23195 - 01/09/2006 - float para o código de liquidação de baixa
                           fCds.FieldByName('FLOATFORMAPAG').asString := CdsDocumentos.FieldByName('FLOATFORMAPAG').AsString;

                           // Rodolpho da Silva - P: 20932 - 21/12/2005
                           fCds.FieldByName('FLGCONTABALTERADOR').AsString := CdsDocumentos.FieldByName('FLGCONTABALTERADOR').AsString;

                           // Rodolpho da Silva - P: 18013 - 07/11/2005
                           fCds.FieldByName('IDMODULO').AsFloat := CdsDocumentos.FieldByName('IDMODULO').AsFloat;

                           // início - André Tavares - pendência 16170  - não estava correto
                           fCds.FieldByName('ABATIMENTO').AsFloat := CdsDocumentos.FieldByName('ABATIMENTO').AsFloat;
                           fCds.FieldByName('DESCONTOS').AsFloat := CdsDocumentos.FieldByName('DESCONTOS').AsFloat;
                           fCds.FieldByName('JUROS').AsFloat := CdsDocumentos.FieldByName('JUROS').AsFloat;
                           fCds.FieldByName('TARIFABANCARIA').AsFloat := CdsDocumentos.FieldByName('TARIFABANCARIA').AsFloat;
                           // fim - André Tavares - pendência 16170  - não estava correto

                           // André Tavares - pendência 22528  - não estava correto - 21/08/2006
                           If (CdsDocumentos.FindField('NUMLOTE') <> Nil) Then //este campo só deve existir se o documento for do cap
                              fCds.FieldByName('NUMLOTE').asInteger := CdsDocumentos.FieldByName('NUMLOTE').asInteger;

                           // TADEU PASSOS SOL 187427/12463 KINTANA 185959
                           fCds.FieldByName('CODOCORRENCIA').AsString := CdsDocumentos.FieldByName('CODOCORRENCIA').AsString;
                           // TADEU PASSOS SOL 187427/12463 KINTANA 185959

                           fCds.FieldByName('IDMODELOCNAB').AsInteger := StrToInt(sModeloCNAB); // Edilaine - SOL 187427-13894 / KTN 1920585

                           // Edilaine Ferraresi - SOL 221860 / KTN 2054992
                           If fCds.FieldByName('VALOR').AsCurrency = CdsDocumentos.FieldByName('VALORNOMINAL').AsCurrency Then
                              fCds.FieldByName('flgbaixatotal').AsString := 'S' // Edilaine Ferraresi - SOL 221352 / KTN 2053933
                           Else
                              fCds.FieldByName('flgbaixatotal').AsString := 'N'; // Edilaine Ferraresi - SOL 221860 / KTN 2054992

                           fCds.Post;

                        End;

                     CdsDocumentos.Next;

                     If CdsDocumentos.Eof Then
                        Break;
                  End;
               // Número do SOL: 124570 2981 Kintana 103005 - Baixa ETL Início
               ChequeBordero := pNumChqBordero;
               DataDisponibilidade := pDataDisp;

               If (pUsarETL) And (CdsDocumentos.FieldByName('IDPESSOA').AsInteger <> 0) Then
                  Begin
                     If Not GerarArquivo Then
                        Exit;

                     If Not InserirDadosBaixaAutoETL('Baixa Automática', Sistema.IdUsuario, Sistema.IdModulo) Then
                        Exit
                     Else
                        Begin
                           BaixaETL := True;
                           While BaixaETL Do
                              Begin
                                 BaixaETL := VerificarBaixaETL(SequenceBaixa);
                                 If Not BaixaETL Then
                                    Sleep(1000)
                                 Else
                                    Sleep(30000);
                              End;
                        End;
                     MessageInfo := 'Processo de Baixa finalizado com sucesso!'
                        + #13 + #10 + 'Total de documentos baixados: ' + IntToStr(FQtdeBaixaETL); // Alterado por FHBS - SOL: 124570/3781 e 124570/3782 KTN: 1136318 e 1136319
                     Result := True;
                     Exit;
                  End;
               // Número do SOL: 124570 2981 Kintana 103005 - Baixa ETL Fim

               //Helen - Sol: 126261/1121 - Kintana: 760963 - Início
               //CdsDocumentos.First;              // Edilaine - SOL 191915 / KTN 1823081
               //while not CdsDocumentos.Eof do    // Edilaine - SOL 191915 / KTN 1823081
               For intContador := 0 To lstDocumento.Count - 1 Do
                  Begin
                     // Edilaine - SOL 191915 / KTN 1823081
                     //cdsAux.Data := CtrlBaixaDocumentos.BuscaDocFilho(CdsDocumentos.FieldByName( 'CODDOCUMENTO' ).AsInteger, 0);
                     cdsAux.Data := CtrlBaixaDocumentos.BuscaDocFilho(StrToInt(lstDocumento.Strings[intContador]), 0);

                     CdsDocsFilhoPag.Data := PreencheDocFilho;
                     CdsDocsFilhoRec.Data := PreencheDocFilho;
                     While Not cdsAux.eof Do
                        Begin
                           If cdsAux.FieldByName('RECPAG').AsString = 'P' Then
                              Begin
                                 CdsDocsFilhoPag.Insert;
                                 CdsDocsFilhoPag.FieldByName('SELECIONA').AsString := 'S';
                                 CdsDocsFilhoPag.FieldByName('BAIXAPARCIAL').AsString := 'N';
                                 CdsDocsFilhoPag.FieldByName('CODTIPDOC').AsInteger := cdsAux.FieldByName('CODTIPDOC').AsInteger;
                                 CdsDocsFilhoPag.FieldByName('IDMODULO').AsInteger := cdsAux.FieldByName('IDMODULO').AsInteger;
                                 CdsDocsFilhoPag.FieldByName('IDFORCLI').AsInteger := cdsAux.FieldByName('IDFORCLI').AsInteger;
                                 CdsDocsFilhoPag.FieldByName('OPERACAO').AsString := cdsAux.FieldByName('OPERACAO').AsString;
                                 CdsDocsFilhoPag.FieldByName('IDPESSOA').AsString := cdsAux.FieldByName('IDPESSOA').AsString;
                                 CdsDocsFilhoPag.FieldByName('CODDOCUMENTO').AsInteger := cdsAux.FieldByName('CODDOCUMENTO').AsInteger;
                                 CdsDocsFilhoPag.FieldByName('NODOCUMENTO').AsString := cdsAux.FieldByName('NODOCUMENTO').AsString;
                                 CdsDocsFilhoPag.FieldByName('COMPLDOCUMENTO').AsString := cdsAux.FieldByName('COMPLDOCUMENTO').AsString;
                                 cdsDocsFilhoPag.FieldByName('DATADISPONIB').AsDateTime := cdsAux.FieldByName('DATADISPONIB').AsDateTime;
                                 CdsDocsFilhoPag.FieldByName('DATAPROGRAMADA').AsDateTime := cdsAux.FieldByName('DATAPROGRAMADA').AsDateTime;
                                 CdsDocsFilhoPag.FieldByName('DATAVENCTO').AsString := cdsAux.FieldByName('DATAVENCTO').AsString;
                                 CdsDocsFilhoPag.FieldByName('RECPAG').AsString := cdsAux.FieldByName('RECPAG').AsString;
                                 CdsDocsFilhoPag.FieldByName('NOME').AsString := cdsAux.FieldByName('NOME').AsString;
                                 CdsDocsFilhoPag.FieldByName('STATUS').AsString := cdsAux.FieldByName('STATUS').AsString;
                                 CdsDocsFilhoPag.FieldByName('MOECODIGO').AsString := cdsAux.FieldByName('MOECODIGO').AsString;
                                 CdsDocsFilhoPag.FieldByName('PLANO').AsString := cdsAux.FieldByName('PLANO').AsString;
                                 CdsDocsFilhoPag.FieldByName('PLACONTA').AsString := cdsAux.FieldByName('PLACONTA').AsString;
                                 CdsDocsFilhoPag.FieldByName('CODCENTROCUSTO').AsString := cdsAux.FieldByName('CODCENTROCUSTO').AsString;
                                 CdsDocsFilhoPag.FieldByName('CODSUBCONTA').AsString := cdsAux.FieldByName('CODSUBCONTA').AsString;
                                 CdsDocsFilhoPag.FieldByName('CODGRUPOCNAB').AsString := cdsAux.FieldByName('CODGRUPOCNAB').AsString;
                                 CdsDocsFilhoPag.FieldByName('NOSSONUMERO').AsString := cdsAux.FieldByName('NOSSONUMERO').AsString;
                                 CdsDocsFilhoPag.FieldByName('NUMLANCTO').AsInteger := cdsAux.FieldByName('NUMLANCTO').AsInteger;
                                 CdsDocsFilhoPag.FieldByName('VLRLIQUIDO').AsFloat := cdsAux.FieldByName('VLRLIQUIDO').AsFloat;
                                 CdsDocsFilhoPag.FieldByName('DEBCRE').AsString := cdsAux.FieldByName('DEBCRE').AsString;
                                 CdsDocsFilhoPag.FieldByName('VALOROUTRAMOEDA').AsFloat := cdsAux.FieldByName('VALOROUTRAMOEDA').AsFloat;
                                 CdsDocsFilhoPag.FieldByName('SALDO').AsFloat := cdsAux.FieldByName('SALDO').AsFloat;
                                 CdsDocsFilhoPag.FieldByName('SALDO1').AsFloat := cdsAux.FieldByName('SALDO1').AsFloat;
                                 CdsDocsFilhoPag.Post;
                              End
                           Else
                              Begin
                                 CdsDocsFilhoRec.Insert;
                                 CdsDocsFilhoRec.FieldByName('SELECIONA').AsString := 'S';
                                 CdsDocsFilhoRec.FieldByName('BAIXAPARCIAL').AsString := 'N';
                                 CdsDocsFilhoRec.FieldByName('CODTIPDOC').AsInteger := cdsAux.FieldByName('CODTIPDOC').AsInteger;
                                 CdsDocsFilhoRec.FieldByName('IDMODULO').AsInteger := cdsAux.FieldByName('IDMODULO').AsInteger;
                                 CdsDocsFilhoRec.FieldByName('IDFORCLI').AsInteger := cdsAux.FieldByName('IDFORCLI').AsInteger;
                                 CdsDocsFilhoRec.FieldByName('OPERACAO').AsString := cdsAux.FieldByName('OPERACAO').AsString;
                                 CdsDocsFilhoRec.FieldByName('IDPESSOA').AsString := cdsAux.FieldByName('IDPESSOA').AsString;
                                 CdsDocsFilhoRec.FieldByName('CODDOCUMENTO').AsInteger := cdsAux.FieldByName('CODDOCUMENTO').AsInteger;
                                 CdsDocsFilhoRec.FieldByName('NODOCUMENTO').AsString := cdsAux.FieldByName('NODOCUMENTO').AsString;
                                 CdsDocsFilhoRec.FieldByName('COMPLDOCUMENTO').AsString := cdsAux.FieldByName('COMPLDOCUMENTO').AsString;
                                 cdsDocsFilhoRec.FieldByName('DATADISPONIB').AsDateTime := cdsAux.FieldByName('DATADISPONIB').AsDateTime;
                                 CdsDocsFilhoRec.FieldByName('DATAPROGRAMADA').AsDateTime := cdsAux.FieldByName('DATAPROGRAMADA').AsDateTime;
                                 CdsDocsFilhoRec.FieldByName('DATAVENCTO').AsString := cdsAux.FieldByName('DATAVENCTO').AsString;
                                 CdsDocsFilhoRec.FieldByName('RECPAG').AsString := cdsAux.FieldByName('RECPAG').AsString;
                                 CdsDocsFilhoRec.FieldByName('NOME').AsString := cdsAux.FieldByName('NOME').AsString;
                                 CdsDocsFilhoRec.FieldByName('STATUS').AsString := cdsAux.FieldByName('STATUS').AsString;
                                 CdsDocsFilhoRec.FieldByName('MOECODIGO').AsString := cdsAux.FieldByName('MOECODIGO').AsString;
                                 CdsDocsFilhoRec.FieldByName('PLANO').AsString := cdsAux.FieldByName('PLANO').AsString;
                                 CdsDocsFilhoRec.FieldByName('PLACONTA').AsString := cdsAux.FieldByName('PLACONTA').AsString;
                                 CdsDocsFilhoRec.FieldByName('CODCENTROCUSTO').AsString := cdsAux.FieldByName('CODCENTROCUSTO').AsString;
                                 CdsDocsFilhoRec.FieldByName('CODSUBCONTA').AsString := cdsAux.FieldByName('CODSUBCONTA').AsString;
                                 CdsDocsFilhoRec.FieldByName('CODGRUPOCNAB').AsString := cdsAux.FieldByName('CODGRUPOCNAB').AsString;
                                 CdsDocsFilhoRec.FieldByName('NOSSONUMERO').AsString := cdsAux.FieldByName('NOSSONUMERO').AsString;
                                 CdsDocsFilhoRec.FieldByName('NUMLANCTO').AsInteger := cdsAux.FieldByName('NUMLANCTO').AsInteger;
                                 CdsDocsFilhoRec.FieldByName('VLRLIQUIDO').AsFloat := cdsAux.FieldByName('VLRLIQUIDO').AsFloat;
                                 CdsDocsFilhoRec.FieldByName('DEBCRE').AsString := cdsAux.FieldByName('DEBCRE').AsString;
                                 CdsDocsFilhoRec.FieldByName('VALOROUTRAMOEDA').AsFloat := cdsAux.FieldByName('VALOROUTRAMOEDA').AsFloat;
                                 CdsDocsFilhoRec.FieldByName('SALDO').AsFloat := cdsAux.FieldByName('SALDO').AsFloat;
                                 CdsDocsFilhoRec.FieldByName('SALDO1').AsFloat := cdsAux.FieldByName('SALDO1').AsFloat;
                                 CdsDocsFilhoRec.Post;
                              End;
                           cdsAux.Next;
                        End;

                     If (Not cdsDocsFilhoPag.IsEmpty) And (Not cdsDocsFilhoRec.IsEmpty) Then
                        Begin
                           If cdsDocsFilhoRec.FieldByName('DATAVENCTO').AsDateTime < pDataDisp Then
                              dDataDisp_Filho := pDataDisp
                           Else
                              //Helen - SOL: 123366/10522 KTN: 1726805 - Inicio
                              //dDataDisp_Filho :=  pDataDisp;
                              dDataDisp_Filho := cdsDocsFilhoRec.FieldByName('DATADISPONIB').AsDateTime;
                           //Helen - SOL: 123366/10522 KTN: 1726805 - Fim
                           If Not BaixaRecXPag.FazRecxPagto(pDataBaixa, cdsDocsFilhoPag.data, cdsDocsFilhoRec.data, dDataDisp_Filho) Then
                              Begin
                                 MessageInfo := BaixaRecXPag.MessageInfo;
                                 exit;
                              End;
                        End;
                     //CdsDocumentos.Next;  // Edilaine - SOL 191915 / KTN 1823081
                  End;
               //Helen - Sol: 126261/1121 - Kintana: 760963 - Fim

             // Início - Rodolpho da Silva - P: 22526 - 06/06/2006
               _Cds.Data := GetDataPacket('SELECT LANCAFINANC FROM PARAMCAP WHERE RECPAG = ''P''');
               bLancaFinanceiro := (_Cds.FieldByName('LANCAFINANC').AsString = 'N');
               // Fim - Rodolpho da Silva - P: 22526 - 06/06/2006

               If CtrlBaixaDocumentos.ProcessaBaixaManual(False,
                  iCodPortForma,
                  pNumChqBordero,
                  Cds.Data,
                  pDataLancamento, // Paulo Nobre - Sol 214738_15892  KTN 2057238 - 13/03/2014
                  pDataBaixa,
                  TSistemaLancto(Trunc(IdModulo) - 3),
                  LancaBaixaFloat,
                  Trunc(IdUsuario),
                  Trunc(IdEmpresa),
                  Trunc(IdEspAcesso),
                  Trunc(PlanoConta),
                  UsaPlanoPatro,
                  IntegraContab,
                  PartidaDobrada,
                  True,
                  0,
                  _PlnCodigoBaixa,
                  _CodLancFinancBaixa,
                  bLancaFinanceiro,
                  0,
                  -1,
                  pDataDisp,
                  false,
                  FbUsaPortFormaRetorno,
                  True,
                  sBaixaObservacao,
                  CdsDocumentos.RecordCount,
                  False,
                  bSintetizaContabilidade,
                  bSIGCB) Then
                  Begin
                     Result := True;
                  End
               Else
                  Begin
                     Result := false;
                     sNomeArqLog := gravaLog(CdsDocumentos.FieldByName('RAZAOSOCIAL').asString +
                        StringOfChar(' ', 65 - length(CdsDocumentos.FieldByName('RAZAOSOCIAL').asString)) +
                        CdsDocumentos.FieldByName('CODGRUPOCNAB').asString +
                        StringOfChar(' ', 25 - length(CdsDocumentos.FieldByName('CODGRUPOCNAB').asString)) +
                        CdsDocumentos.FieldByName('CODDOCUMENTO').asString +
                        StringOfChar(' ', 25 - length(CdsDocumentos.FieldByName('CODDOCUMENTO').asString)) +
                        CdsDocumentos.FieldByName('NODOCUMENTO').asString +
                        StringOfChar(' ', 25 - length(CdsDocumentos.FieldByName('NODOCUMENTO').asString)) +
                        CdsDocumentos.FieldByName('DATAPROGRAMADA').asString +
                        StringOfChar(' ', 23 - length(CdsDocumentos.FieldByName('DATAPROGRAMADA').asString)) +
                        formatFloat('#,##0.00', CdsDocumentos.FieldByName('VALOR').asfloat) +
                        StringOfChar(' ', 25 - length(CdsDocumentos.FieldByName('VALOR').asString)) +
                        CtrlBaixaDocumentos.MessageInfo
                        );
                  End; // else    }

               _PlnCodigoBaixa := strTointDef(formatFloat('0', CtrlBaixaDocumentos.PlnCodigoBaixa), 0);
               _CodLancFinancBaixa := strTointDef(formatFloat('0', CtrlBaixaDocumentos.CodLancFinancBaixa), -1);

               fcds.EmptyDataSet;

               // finaliza transação
               If InTransaction Then
                  Commit();

            End; // while

         If Not Padroes.GravaLogOperacoes(IdEmpresa, IdMOdulo, IdUsuario,
            'Pagamento Eletronico') Then
            MessageInfo := 'Não Consegui Gravar o Log';

         // Realiza a gravação dos dados
         CdsDocumentos.First;

         // Paulo Nobre - Sol 187427 Kintana 1793755
         // inicia transação
         StartTransaction();
         For intContador := 0 To psListaRetorno.Count - 1 Do
            Begin

               // Exibe o formprogresso
               OnBaixa([4, intContador, 0, 1, psListaRetorno.Count, 'Atualizando Baixas com Ocorrências.']);

               sCodDocumento := Trim(Copy(psListaRetorno[intContador], 41, 16));

               If (sCodDocumento <> '') And (Length(sCodDocumento) <= 8) Then //Taffarel - SIG71002
                  Begin
                     // Localizando a descrição da ocorrência
                     sCodOcorrencia := Trim(Copy(psListaRetorno[intContador], 26, 2));
                     _Cds.Data := GetDataPacket('SELECT DISTINCT C.DESCRICAO ' +
                        'FROM ' +
                        '  CODIGOSCNAB C ' +
                        'WHERE ' +
                        '  (C.IDMODELOSCNAB = ' + sModeloCNAB + ') AND ' +
                        '  (C.CODIGO = ' + sCodOcorrencia + ') AND ' +
                        '  (C.RECPAG = ''R'') AND ' +
                        '  (C.TIPO = ''T'') ');
                     sHistorico := _Cds.fieldbyname('DESCRICAO').asString;

                     //SIG87371 - início
                     {If sCodOcorrencia = '00' Then
                        Begin
                           // Baixas sem ocorrências
                           ExecSQL(' UPDATE LANCTODOCUM SET HISTORICOCOMPL = ' + quotedstr(sHistorico) + ',' +
                              ' CODOCORRENCIA = ' + quotedstr(sCodOcorrencia) +
                              ' WHERE CODDOCUMENTO = ' + sCodDocumento + ' AND OPERACAO = ''5'' ');
                        End
                     Else}
                        Begin
                           // Baixas com ocorrências
                           ExecSQL(' UPDATE LANCTODOCUM SET HISTORICOCOMPL = ' + quotedstr(sHistorico) + ',' +
                              ' CODOCORRENCIA = ' + quotedstr(sCodOcorrencia) +
                              //' WHERE CODDOCUMENTO = ' + sCodDocumento + ' AND CODALTERADOR IS NOT NULL AND OPERACAO = ''4'' '); //SIG87371
                              ' WHERE CODDOCUMENTO = ' + sCodDocumento + ' AND ((CODALTERADOR IS NOT NULL AND OPERACAO = ''4'') OR (OPERACAO = ''5'')) AND TRUNC(TRGDTINCLUSAO) = TRUNC(SysDate)'); //SIG87371
                        End;
                    //SIG87371 - fim    
                  End;
            End;

         // finaliza transação
         If InTransaction Then
            Commit();
         // fim - Paulo Nobre - Sol 187427 Kintana 1793755
      Except
         On E: Exception Do
            Begin
               If InTransaction() Then
                  Rollback();

               Result := False;
               MessageInfo := MessageInfo + #13 + #10 +
                  'Erro ao efetuar baixa dos documentos' + #13 + #10 +
                  E.Message;
            End;
      End;

   Finally

      lstDocumento.Destroy; // Edilaine - SOL 191915 / KTN 1823081
      If CdsDocumentos.Active Then
         If (CdsDocumentos.ChangeCount > 0) Then
            CdsDocumentos.CancelUpdates;

      CdsDocumentos.Close;
      DtmBaixaIntBanco.SqlDocumentos.Open;
   End;
End;

Function TCtrlBaixaIntBanco.StrToFloatDef(sValor: String; rDefault: Double): Double;
Begin
   Try
      Result := StrToFloat(sValor)

   Except
      Result := rDefault;
   End;
End;

Function TCtrlBaixaIntBanco.DevolveString(sString, sCaracter: String): String;
Var
   sAux: String;
Begin
   sAux := Trim(sString);
   While Pos(' ', sAux) <> 0 Do sAux[Pos(' ', sAux)] := sCaracter[1];
   Result := sAux;
End;

Function TCtrlBaixaIntBanco.Devolvevirgula(sString, sCaracter: String): String;
Var
   sAux: String;
   posi: integer;
Begin
   sAux := Trim(sString);
   While Pos(' ', sAux) <> 0 Do Begin
         posi := Pos(' ', sAux);
         sAux := Copy(sAux, 1, Posi - 2) + sCaracter[1] + copy(sAux, Posi + 2, length(saux));
      End;
   Result := sAux;
End;

Procedure TCtrlBaixaIntBanco.SetsNomeArqLog(Const Value: String);
Begin
   FsNomeArqLog := Value;
End;

Procedure TCtrlBaixaIntBanco.SetbUsaPortFormaRetorno(Const Value: boolean);
Begin
   FbUsaPortFormaRetorno := Value;
End;
// Número do SOL: 124570 2981 Kintana 103005 - Baixa ETL Início

Function TCtrlBaixaIntBanco.GerarArquivo: Boolean;
Var
   DadosBaixa: String; // Gustavo Teste Baixa
   sNomeArq: String;
   sNomeTmp: String;
   DMAIS: Integer;
   StrRecPag, Status, PlaContas, DebCre, CodSubConta: String;
   MoeCodigo, Plano, CodGrupoCnab: Integer;
   // Alterado por FHBS - SOL: 155003 KTN: 1195982
   _IdCidade: Integer;
   _IdPais: Integer;
   _UF: String;
   // Fim - Alterado por FHBS - SOL: 155003 KTN: 1195982
   //Cássio Rovaroto - SIG nº 82888 - Início
   sPathArqParamBaixa: String;
   tArquivoParamBaixa: TextFile;
   //Cássio Rovaroto - SIG nº 82888 - Fim


   Procedure buscaAlterador();
   Begin
      CdsETL.Close;
      DtmBaixaIntBanco.SqlETL.SQL.Clear;
      DtmBaixaIntBanco.SqlETL.SQL.Add('SELECT pa.codalteradorabat, pa.codalteradordesc, pa.codalteradorjuros, pa.codalteradortarif ');
      DtmBaixaIntBanco.SqlETL.SQL.Add('FROM paramcap pa ');
      DtmBaixaIntBanco.SqlETL.SQL.Add('WHERE pa.recpag = ''R'' ');
      DtmBaixaIntBanco.SqlETL.Prepare;
      DtmBaixaIntBanco.SqlETL.Open;
      AlteradorAbat := CdsETL.FieldValues['codalteradorabat'];
      AlteradorDesc := CdsETL.FieldValues['codalteradordesc'];
      AlteradorJuros := CdsETL.FieldValues['codalteradorjuros'];
      AlteradorTarifa := CdsETL.FieldValues['codalteradortarif'];
      CdsETL.Close;
   End;

   //Cássio Rovaroto - SIG nº 82288 - Início
   {Procedure buscaFloat(pPortForma: Integer);
   Begin
      CdsETL.Close;
      DtmBaixaIntBanco.SqlETL.SQL.Clear;
      DtmBaixaIntBanco.SqlETL.SQL.Add('select  DMAIS from portadorforma por ');
      DtmBaixaIntBanco.SqlETL.SQL.Add('where por.codportforma =  ' + IntToStr(pPortForma));
      DtmBaixaIntBanco.SqlETL.Prepare;
      DtmBaixaIntBanco.SqlETL.Open;
      DMAIS := CdsETL.FieldValues['DMAIS'];
      CdsETL.Close;
   End;}
   //Cássio Rovaroto - SIG nº 82288 - Fim

   Procedure buscarRecPag(pDocumento: Integer);
   Begin
      CdsETL.Close;
      DtmBaixaIntBanco.SqlETL.SQL.Clear;
      DtmBaixaIntBanco.SqlETL.SQL.Add(' select D.RECPAG, D.STATUS, decode(d.moecodigo, '''', 0) as moecodigo, d.plano, ');
      DtmBaixaIntBanco.SqlETL.SQL.Add(' d.placonta, d.codsubconta, d.codgrupocnab, ld.debcre from DOCUMENTO D, lanctodocum ld ');
      DtmBaixaIntBanco.SqlETL.SQL.Add(' where ld.coddocumento = d.coddocumento and ld.operacao = 2 and d.recpag = ''R'' ');
      DtmBaixaIntBanco.SqlETL.SQL.Add(' AND D.CODDOCUMENTO = ' + IntToStr(pDocumento));
      DtmBaixaIntBanco.SqlETL.Prepare;
      DtmBaixaIntBanco.SqlETL.Open;

      StrRecPag := CdsETL.FieldByName('RECPAG').AsString;
      Status := CdsETL.FieldByName('STATUS').AsString;
      Plano := CdsETL.FieldByName('Plano').AsInteger;
      MoeCodigo := CdsETL.FieldByName('MoeCodigo').AsInteger;
      PlaContas := CdsETL.FieldByName('placonta').AsString;
      DebCre := CdsETL.FieldByName('DebCre').AsString;
      CodSubConta := CdsETL.FieldByName('codsubconta').AsString;
      CodGrupoCnab := CdsETL.FieldByName('CodGrupoCnab').AsInteger;

      CdsETL.Close;
   End;

Begin
   Try
      // Alterado por FHBS - SOL: 155003 KTN: 1195982
      DiasUteis.SetLogradouro(Sistema.IdEmpresa, _IdCidade, _IdPais, _UF);

      // Início Gustavo teste Baixa
      sNomeArq := PegaCaminhoETL('R');
      sPathArqParamBaixa := StringReplace(sNomeArq, 'ARQUIVO_FAZ_BAIXA.TXT', 'ArqParamBaixa.txt', [rfReplaceAll, rfIgnoreCase]);
      AssignFile(tArquivoParamBaixa, sPathArqParamBaixa);
      Rewrite(tArquivoParamBaixa);
      Append(tArquivoParamBaixa);
      Write(tArquivoParamBaixa, EmptyStr);
      CloseFile(tArquivoParamBaixa);              

      sNomeTmp := StringReplace(sNomeArq, '.TXT', '.TMP', [rfReplaceAll, rfIgnoreCase]);
      AssignFile(ArqDadosBaixa, sNomeTmp); // CAMINHO: \\errai\BaixaAutomatica\EventWait
      Rewrite(ArqDadosBaixa);
      fCds.First;
      If ((SequenceBaixa = 0) Or (IntToStr(SequenceBaixa) = EmptyStr)) Then
         gerarSequenceETL;
      buscaAlterador;
      DadosBaixa := IntToStr(SequenceBaixa) + ';;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;'; //43 dados
      WriteLN(ArqDadosBaixa, DadosBaixa);
      While Not fCds.EOF Do
         Begin
            //Cássio Rovaroto - SIG nº 82888 - Início
            // buscaFloat(fCds.FieldByName('CODPORTFORMA').AsInteger);
            DMAIS := buscaFloat(fCds.FieldByName('CODPORTFORMA').AsInteger);
            //Cássio Rovaroto - SIG nº 82888 - Fim
            buscarRecPag(fCds.FieldByName('CODDOCUMENTO').AsInteger);

            DadosBaixa := '';
            DadosBaixa := DadosBaixa + fCds.FieldByName('IDFORCLI').AsString;
            DadosBaixa := DadosBaixa + ';' + fCds.FieldByName('OPERACAO').AsString;
            DadosBaixa := DadosBaixa + ';' + fCds.FieldByName('CODTIPDOC').AsString;
            DadosBaixa := DadosBaixa + ';' + fCds.FieldByName('IDPESSOA').AsString;
            DadosBaixa := DadosBaixa + ';' + fCds.FieldByName('CODDOCUMENTO').AsString;
            DadosBaixa := DadosBaixa + ';' + fCds.FieldByName('NODOCUMENTO').AsString;
            DadosBaixa := DadosBaixa + ';' + fCds.FieldByName('COMPLDOCUMENTO').AsString;
            DadosBaixa := DadosBaixa + ';' + fCds.FieldByName('DATAPROGRAMADA').AsString;

            // Alterado por FHBS - SOL: 155003 KTN: 1195982
            //DadosBaixa :=  DadosBaixa + ';' + fCds.FieldByName('DATAVENCTO').AsString;
            DadosBaixa := DadosBaixa + ';' + DateToStr(DiasUteis.PrimeiroDiaUtilPosterior((FCds.FieldByName('DATABAIXA').AsDateTime) + DMAIS - 1, _IdCidade, _IdPais, _UF, True, False, False));
            // Fim - Alterado por FHBS - SOL: 155003 KTN: 1195982

            DadosBaixa := DadosBaixa + ';' + StrRecPag;
            DadosBaixa := DadosBaixa + ';' + StrRecPag; //fCds.FieldByName('RECPAG').AsString; //recpagdoc
            DadosBaixa := DadosBaixa + ';' + fCds.FieldByName('NOME').AsString;
            DadosBaixa := DadosBaixa + ';' + Status; //fCds.FieldByName('STATUS').AsString;
            DadosBaixa := DadosBaixa + ';' + IntToStr(MoeCodigo); // fCds.FieldByName('MOECODIGO').AsString;
            DadosBaixa := DadosBaixa + ';' + IntToStr(Plano); //fCds.FieldByName('PLANO').AsString;
            DadosBaixa := DadosBaixa + ';' + PlaContas; //fCds.FieldByName('PLACONTA').AsString;
            DadosBaixa := DadosBaixa + ';' + CodSubConta; //fCds.FieldByName('CODSUBCONTA').AsString;
            DadosBaixa := DadosBaixa + ';' + fCds.FieldByName('CODCENTROCUSTO').AsString;
            DadosBaixa := DadosBaixa + ';' + IntToStr(CodGrupoCnab); //fCds.FieldByName('CODGRUPOCNAB').AsString;
            DadosBaixa := DadosBaixa + ';' + fCds.FieldByName('NOSSONUMERO').AsString;
            DadosBaixa := DadosBaixa + ';' + fCds.FieldByName('NUMLANCTO').AsString;
            DadosBaixa := DadosBaixa + ';' + fCds.FieldByName('VALOROUTRAMOEDA').AsString;
            DadosBaixa := DadosBaixa + ';' + DebCre; //fCds.FieldByName('DEBCRE').AsString;
            DadosBaixa := DadosBaixa + ';' + fCds.FieldByName('VLRLIQUIDO').AsString;
            DadosBaixa := DadosBaixa + ';' + fCds.FieldByName('VALOR').AsString;
            DadosBaixa := DadosBaixa + ';' + fCds.FieldByName('CODALTERADORBAIXA').AsString;
            DadosBaixa := DadosBaixa + ';' + fCds.FieldByName('CODPORTFORMA').AsString;
            DadosBaixa := DadosBaixa + ';' + fCds.FieldByName('FLOATFORMAPAG').asString;
            DadosBaixa := DadosBaixa + ';' + fCds.FieldByName('FLGCONTABALTERADOR').AsString;
            DadosBaixa := DadosBaixa + ';' + fCds.FieldByName('IDMODULO').AsString;
            DadosBaixa := DadosBaixa + ';' + IntToStr(AlteradorAbat);
            DadosBaixa := DadosBaixa + ';' + fCds.FieldByName('ABATIMENTO').AsString;
            DadosBaixa := DadosBaixa + ';' + IntToStr(AlteradorDesc);
            DadosBaixa := DadosBaixa + ';' + fCds.FieldByName('DESCONTOS').AsString;
            DadosBaixa := DadosBaixa + ';' + IntToStr(AlteradorJuros);
            DadosBaixa := DadosBaixa + ';' + fCds.FieldByName('JUROS').AsString;
            DadosBaixa := DadosBaixa + ';' + IntToStr(AlteradorTarifa);
            DadosBaixa := DadosBaixa + ';' + fCds.FieldByName('TARIFABANCARIA').AsString;
            DadosBaixa := DadosBaixa + ';' + fCds.FieldByName('NUMLOTE').AsString;

            // Alterado por FHBS - SOL: 155003 KTN: 1195982
            //DadosBaixa :=  DadosBaixa + ';' + DateToStr((DataDisponibilidade) + DMAIS) ;
            // Foi colocado o "DMAIS - 1" pois a função PrimeiroDiaUtilPosterior ja adiciona um dia.
            DadosBaixa := DadosBaixa + ';' + DateToStr(DiasUteis.PrimeiroDiaUtilPosterior((FCds.FieldByName('DATABAIXA').AsDateTime) + DMAIS - 1, _IdCidade, _IdPais, _UF, True, False, False));
            // Fim - Alterado por FHBS - SOL: 155003 KTN: 1195982

            DadosBaixa := DadosBaixa + ';' + DateToStr(DataDisponibilidade);
            DadosBaixa := DadosBaixa + ';' + FloatToStr(ChequeBordero);
            DadosBaixa := DadosBaixa + ';' + IntToStr(Sistema.IdUsuario);
            DadosBaixa := DadosBaixa + ';' + '-1';
            DadosBaixa := DadosBaixa + ';' + IntToStr(fCds.FieldByName('CODDOCUMENTO').AsInteger);

            // Edilaine - SOL 187427-13894 / KTN 1920585
            DadosBaixa := DadosBaixa + ';' + fCds.FieldByName('IDMODELOCNAB').AsString;
            // Edilaine - SOL 187427-13894 / KTN 1920585

            // TADEU PASSOS SOL 187427/12463 KINTANA 185959
            DadosBaixa := DadosBaixa + ';' + fCds.FieldByName('CODOCORRENCIA').AsString;
            // TADEU PASSOS SOL 187427/12463 KINTANA 185959

            WriteLN(ArqDadosBaixa, DadosBaixa);
            CarregaFilhoDocumento(fCds.FieldByName('CODDOCUMENTO').AsInteger, '', DateToStr(DataDisponibilidade), DMAIS, fCds.FieldByName('CODALTERADORBAIXA').AsString,
               fCds.FieldByName('FLOATFORMAPAG').asString, fCds.FieldByName('FLGCONTABALTERADOR').AsString);

            fCds.Next;
         End;
      CloseFile(ArqDadosBaixa);
      RenameFile(sNomeTmp, sNomeArq);
      Result := True;
   Except
      Result := False;
   End;
End;

Function TCtrlBaixaIntBanco.PegaCaminhoETL(pRECPag: String): String;
Begin
   CdsETL.Close;
   DtmBaixaIntBanco.SqlETL.SQL.Clear;

   // Alterado por FHBS - SOL: 124570/3781 e 124570/3782 KTN: 1136318 e 1136319
   //DtmBaixaIntBanco.SqlETL.SQL.Add('SELECT P.PATHETL ');
   If Copy(UpperCase(Trim(Sistema.AliasServidor)),1,8) = 'PRODUCAO' Then    //Ejrb - 29/04/2021 - SIG 114623 - Implementação do comando Copy, para igualar as bases de produção.
      DtmBaixaIntBanco.SqlETL.SQL.Add('SELECT P.PATHETLPRODUCAO as PATHETL ')
   Else
      DtmBaixaIntBanco.SqlETL.SQL.Add('SELECT P.PATHETLHOM as PATHETL ');
   // Fim - Alterado por FHBS - SOL: 124570/3781 e 124570/3782 KTN: 1136318 e 1136319

   DtmBaixaIntBanco.SqlETL.SQL.Add('  FROM PARAMCAP P ');
   DtmBaixaIntBanco.SqlETL.SQL.Add(' WHERE P.RECPAG = ''' + pRECPag + ''' ');
   DtmBaixaIntBanco.SqlETL.Prepare;
   DtmBaixaIntBanco.SqlETL.Open;

   // Alterado por FHBS - SOL: 124570/3781 e 124570/3782 KTN: 1136318 e 1136319
   //Result := CdsETL.FieldByName('PATHETL').AsString + '\ARQUIVO_FAZ_BAIXA.TXT';
   If Trim(CdsETL.FieldByName('PATHETL').AsString) <> '' Then
      Result := CdsETL.FieldByName('PATHETL').AsString + '\ARQUIVO_FAZ_BAIXA.TXT'
   Else
      Result := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\ARQUIVO_FAZ_BAIXA.TXT';
   // Fim - Alterado por FHBS - SOL: 124570/3781 e 124570/3782 KTN: 1136318 e 1136319

   sPathArqParamBaixa := CdsETL.FieldByName('PATHETL').AsString + '\Param_Baixa.txt';  //Cássio Rovaroto - SIG nº 82888

   CdsETL.Close;
End;
// Número do SOL: 124570 2981 Kintana 103005 - Baixa ETL Fim

Procedure TCtrlBaixaIntBanco.SetCdsETL(Const Value: TClientDataSet);
Begin
   FCdsETL := Value;
End;

// Número do SOL: 124570 2981 Kintana 103005 - Baixa ETL Início

Function TCtrlBaixaIntBanco.VerificarBaixaETL(pProcesso: Integer): Boolean;
Begin
   CdsETL.Close;
   DtmBaixaIntBanco.SqlETL.SQL.Clear;

   // Alterado por FHBS - SOL: 124570/3781 e 124570/3782 KTN: 1136318 e 1136319
   //DtmBaixaIntBanco.SqlETL.SQL.Add(' SELECT DATA_FIM FROM BAIXAUTO_CTC_PROCESSO ');
   DtmBaixaIntBanco.SqlETL.SQL.Add(' SELECT QTDBAIXA FROM BAIXAUTO_CTC_PROCESSO ');
   // Fim - Alterado por FHBS - SOL: 124570/3781 e 124570/3782 KTN: 1136318 e 1136319

   DtmBaixaIntBanco.SqlETL.SQL.Add(' WHERE IDPROCESSO = ' + IntToStr(pProcesso) + '');
   DtmBaixaIntBanco.SqlETL.SQL.Add(' AND DATA_FIM IS NOT NULL ');
   DtmBaixaIntBanco.SqlETL.Prepare;
   DtmBaixaIntBanco.SqlETL.Open;

   // Alterado por FHBS - SOL: 124570/3781 e 124570/3782 KTN: 1136318 e 1136319
   FQtdeBaixaETL := CdsETL.FieldByName('QTDBAIXA').AsInteger;

   If CdsETL.IsEmpty Then
      Result := True
   Else
      Result := False;

   CdsETL.Close;

End;

Function TCtrlBaixaIntBanco.InserirDadosBaixaAutoETL(pNomeProcesso: String;
   pUsuario, pModulo: Integer): Boolean;
Begin
   DtmBaixaIntBanco.QryInsertETL.SQL.Clear;
   DtmBaixaIntBanco.QryInsertETL.SQL.Add(' INSERT INTO BAIXAUTO_CTC_PROCESSO( ');
   DtmBaixaIntBanco.QryInsertETL.SQL.Add(' IDPROCESSO, IDUSUARIO, DATA_INICIO, ');
   DtmBaixaIntBanco.QryInsertETL.SQL.Add(' DATA_FIM, IDMODULO, NOME_PROCESSO) ');
   DtmBaixaIntBanco.QryInsertETL.SQL.Add(' VALUES ( ');
   DtmBaixaIntBanco.QryInsertETL.SQL.Add('' + IntToStr(SequenceBaixa) + ' , ''' + IntToStr(pUsuario) + ''' , '); // + IntToStr(SequenceBaixa) +
   DtmBaixaIntBanco.QryInsertETL.SQL.Add(' SYSDATE, ');
   DtmBaixaIntBanco.QryInsertETL.SQL.Add(' NULL, ''' + IntToStr(pModulo) + ''' , ''' + pNomeProcesso + ''') ');

   //DtmBaixaIntBanco.QryInsertETL.SQL.SaveToFile('c:\inserir.txt');
   Try
      //DtmBaixaIntBanco.QryInsertETL.Prepare;
      DtmBaixaIntBanco.QryInsertETL.ExecSQL;
      If InTransaction Then
         Commit();

      Result := True;

   Except
      If InTransaction Then
         Rollback;
      Result := False;
   End;
   CdsETL.Close;
End;

Procedure TCtrlBaixaIntBanco.gerarSequenceETL;
Begin
   //CdsETL.Close;
   DtmBaixaIntBanco.SqlETL.SQL.Clear;
   DtmBaixaIntBanco.SqlETL.SQL.Add('SELECT sq_baixauto_ctc_processo.NEXTVAL as Sequence FROM DUAL ');
   DtmBaixaIntBanco.SqlETL.Prepare;
   DtmBaixaIntBanco.SqlETL.Open;
   SequenceBaixa := CdsETL.FieldValues['Sequence'];

   CdsETL.Close;
End;

Procedure TCtrlBaixaIntBanco.CarregaFilhoDocumento(pDocumento: Integer;
   pDadosBaixa: String; pDataDisponibilidade: String; pDmais: Integer; pCodAlteradorBaixa: String;
   pFloatFormPag, pFlgContabAlterador: String);
Var
   DataDisp: String;

   Function CalculaDataDisponibilidadeFilho(prDataDisponibilidadePai, prDataDisponibilidadeFilho: String): String;
   Begin
      If StrToDate(prDataDisponibilidadeFilho) <= StrToDate(prDataDisponibilidadePai) Then
         Result := prDataDisponibilidadePai
      Else
         Result := prDataDisponibilidadeFilho;
   End;

Begin
   CdsETL.Close;
   DtmBaixaIntBanco.SqlETL.SQL.Clear;
   DtmBaixaIntBanco.SqlETL.SQL.Add(' Select doc.idforcli, doc.operacao, doc.codtipdoc, doc.idpessoa, ');
   DtmBaixaIntBanco.SqlETL.SQL.Add(' doc.coddocumento, doc.nodocumento, doc.compldocumento, doc.dataprogramada, ');
   DtmBaixaIntBanco.SqlETL.SQL.Add(' doc.datavencto, doc.recpag, doc.recpag as recpagdoc, la.debcre, la.valor, ');
   DtmBaixaIntBanco.SqlETL.SQL.Add(' pes.nome, doc.status, doc.moecodigo, doc.plano, doc.placonta, ');
   DtmBaixaIntBanco.SqlETL.SQL.Add(' doc.codsubconta, doc.codcentrocusto, doc.codgrupocnab, doc.nossonumero, ');
   DtmBaixaIntBanco.SqlETL.SQL.Add(' la.numlancto, la.valoroutramoeda, la.vlrliquido, '''' as codalteradorbaixa, ');
   DtmBaixaIntBanco.SqlETL.SQL.Add(' doc.codportforma, ''FloatAlterador'' as FloatAlterador, doc.idmodulo, ');
   DtmBaixaIntBanco.SqlETL.SQL.Add(' ''CodAlteradorAbat'' as CodAlteradorAbat, '''' as Abatimento, ');
   DtmBaixaIntBanco.SqlETL.SQL.Add(' ''0'' as AlteradorDesc, ''0'' as Descontos, '''' as AlteradorJuros, ');
   DtmBaixaIntBanco.SqlETL.SQL.Add(' '''' as Juros, ''CodAlteradorTarifa'' as AlteradorTarifa, '''' as AlteradorTarifa, ');
   DtmBaixaIntBanco.SqlETL.SQL.Add(' '''' as numlote, '''' as datafloat, ''datadisponibilidade'' as datadisponibilidade, ');
   DtmBaixaIntBanco.SqlETL.SQL.Add(' ''Numchequebordero'' as nunchequebordero,  ''Idusuario'' as idusuario, '''' ');
   DtmBaixaIntBanco.SqlETL.SQL.Add(' from documento doc, pessoa pes, lanctodocum la where doc.coddocumento in ');
   DtmBaixaIntBanco.SqlETL.SQL.Add('(select iddocumento from documxdocum dc where dc.iddocumentopai = ' + IntToStr(pDocumento) + ') ');
   DtmBaixaIntBanco.SqlETL.SQL.Add(' and la.operacao = 2 and doc.idforcli = pes.idpessoa  and doc.coddocumento = la.coddocumento ');
   DtmBaixaIntBanco.SqlETL.Prepare;
   DtmBaixaIntBanco.SqlETL.Open;

   If Not CdsETL.IsEmpty Then
      Begin
         While Not CdsETL.EOF Do
            Begin
               pDadosBaixa := '';
               pDadosBaixa := pDadosBaixa + CdsETL.FieldByName('IDFORCLI').AsString;
               pDadosBaixa := pDadosBaixa + ';' + CdsETL.FieldByName('OPERACAO').AsString;
               pDadosBaixa := pDadosBaixa + ';' + CdsETL.FieldByName('CODTIPDOC').AsString;
               pDadosBaixa := pDadosBaixa + ';' + CdsETL.FieldByName('IDPESSOA').AsString;
               pDadosBaixa := pDadosBaixa + ';' + CdsETL.FieldByName('CODDOCUMENTO').AsString;
               pDadosBaixa := pDadosBaixa + ';' + CdsETL.FieldByName('NODOCUMENTO').AsString;
               pDadosBaixa := pDadosBaixa + ';' + CdsETL.FieldByName('COMPLDOCUMENTO').AsString;
               pDadosBaixa := pDadosBaixa + ';' + CdsETL.FieldByName('DATAPROGRAMADA').AsString;
               pDadosBaixa := pDadosBaixa + ';' + CdsETL.FieldByName('DATAVENCTO').AsString;
               pDadosBaixa := pDadosBaixa + ';' + CdsETL.FieldByName('RECPAG').AsString;
               pDadosBaixa := pDadosBaixa + ';' + CdsETL.FieldByName('RECPAG').AsString; //recpagdoc
               pDadosBaixa := pDadosBaixa + ';' + CdsETL.FieldByName('NOME').AsString;
               pDadosBaixa := pDadosBaixa + ';' + CdsETL.FieldByName('STATUS').AsString;
               pDadosBaixa := pDadosBaixa + ';' + CdsETL.FieldByName('MOECODIGO').AsString;
               pDadosBaixa := pDadosBaixa + ';' + CdsETL.FieldByName('PLANO').AsString;
               pDadosBaixa := pDadosBaixa + ';' + CdsETL.FieldByName('PLACONTA').AsString;
               pDadosBaixa := pDadosBaixa + ';' + CdsETL.FieldByName('CODSUBCONTA').AsString;
               pDadosBaixa := pDadosBaixa + ';' + CdsETL.FieldByName('CODCENTROCUSTO').AsString;
               pDadosBaixa := pDadosBaixa + ';' + CdsETL.FieldByName('CODGRUPOCNAB').AsString;
               pDadosBaixa := pDadosBaixa + ';' + CdsETL.FieldByName('NOSSONUMERO').AsString;
               pDadosBaixa := pDadosBaixa + ';' + CdsETL.FieldByName('NUMLANCTO').AsString; //
               pDadosBaixa := pDadosBaixa + ';' + CdsETL.FieldByName('VALOROUTRAMOEDA').AsString;
               pDadosBaixa := pDadosBaixa + ';' + CdsETL.FieldByName('DEBCRE').AsString;
               pDadosBaixa := pDadosBaixa + ';' + CdsETL.FieldByName('VLRLIQUIDO').AsString;
               pDadosBaixa := pDadosBaixa + ';' + CdsETL.FieldByName('VALOR').AsString;
               pDadosBaixa := pDadosBaixa + ';' + pCodAlteradorBaixa;
               pDadosBaixa := pDadosBaixa + ';' + CdsETL.FieldByName('CODPORTFORMA').AsString;
               pDadosBaixa := pDadosBaixa + ';' + pFloatFormPag; //CdsETL.FieldByName('FLOATFORMAPAG').asString; //
               pDadosBaixa := pDadosBaixa + ';' + pFlgContabAlterador; //CdsETL.FieldByName('FLGCONTABALTERADOR').AsString; //FloatAlterador
               pDadosBaixa := pDadosBaixa + ';' + CdsETL.FieldByName('IDMODULO').AsString;
               pDadosBaixa := pDadosBaixa + ';' + IntToStr(AlteradorAbat);
               pDadosBaixa := pDadosBaixa + ';' + '0';
               pDadosBaixa := pDadosBaixa + ';' + IntToStr(AlteradorDesc);
               pDadosBaixa := pDadosBaixa + ';' + '0';
               pDadosBaixa := pDadosBaixa + ';' + IntToStr(AlteradorJuros);
               pDadosBaixa := pDadosBaixa + ';' + '0';
               pDadosBaixa := pDadosBaixa + ';' + IntToStr(AlteradorTarifa);
               pDadosBaixa := pDadosBaixa + ';' + '0';
               pDadosBaixa := pDadosBaixa + ';' + ''; //CdsETL.FieldByName('numlote').AsString ;
               DataDisp := CdsETL.FieldByName('datavencto').AsString;
               pDadosBaixa := pDadosBaixa + ';' + DateToStr(StrToDate(CalculaDataDisponibilidadeFilho(pDataDisponibilidade, DataDisp)) + pDmais); // //DateToStr((CdsETL.FieldByName('datavencto').AsDateTime ) + pDmais);
               pDadosBaixa := pDadosBaixa + ';' + CalculaDataDisponibilidadeFilho(pDataDisponibilidade, DataDisp);
               pDadosBaixa := pDadosBaixa + ';' + FloatToStr(ChequeBordero);
               pDadosBaixa := pDadosBaixa + ';' + IntToStr(Sistema.IdUsuario);
               pDadosBaixa := pDadosBaixa + ';' + '-1';
               pDadosBaixa := pDadosBaixa + ';' + IntToStr(pDocumento);

               WriteLN(ArqDadosBaixa, pDadosBaixa);
               CdsETL.Next;
            End;
      End;

End;

Function TCtrlBaixaIntBanco.GerarArquivoLOG(pProcesso: Integer): Boolean;
Var
   TextArquivo: TextFile;
   DadosLOG: String;
   CaminhoLOG: String;

   Procedure pegarCaminhoLOG;
   Begin
      CdsETL.Close;
      DtmBaixaIntBanco.SqlETL.SQL.Clear;
      DtmBaixaIntBanco.SqlETL.SQL.Add(' select caminhoarquivo from cm.paramglobal ');
      DtmBaixaIntBanco.SqlETL.Open;
      CaminhoLOG := CdsETL.FieldValues['caminhoarquivo'];
      CdsETL.Close;
   End;

Begin
   Try
      pegarCaminhoLOG;
      CdsETL.Close;
      DtmBaixaIntBanco.SqlETL.SQL.Clear;
      DtmBaixaIntBanco.SqlETL.SQL.Add(' select lp.dsc_processo || '';'' || DECODE(lp.TIPO_PROCESSO, ''RL'', ''Relatório análitico da contabilização'', ');
      DtmBaixaIntBanco.SqlETL.SQL.Add(' DECODE(lp.TIPO_PROCESSO, ''LF'', ''Log de validação do financeiro'', ''Log de validação principal do processo'' ))  as dsc_processo  ');
      DtmBaixaIntBanco.SqlETL.SQL.Add(' from baixauto_log_processo LP ');
      DtmBaixaIntBanco.SqlETL.SQL.Add(' where idprocesso = ' + IntToStr(pProcesso) + '');
      DtmBaixaIntBanco.SqlETL.SQL.Add(' ORDER BY TIPO_PROCESSO ');
      DtmBaixaIntBanco.SqlETL.Open;
      If Not CdsETL.IsEmpty Then
         Begin
            AssignFile(TextArquivo, CaminhoLOG + '\LogBaixaETL.csv');
            Rewrite(TextArquivo);
            While Not CdsETL.EOF Do
               Begin
                  DadosLOG := '';
                  DadosLOG := CdsETL.FieldValues['dsc_processo'];
                  WriteLN(TextArquivo, DadosLOG);
                  CdsETL.Next;
               End;
            CloseFile(TextArquivo);
         End;
      Result := True;
   Except
      Result := False;
   End;
End;
// Número do SOL: 124570 2981 Kintana 103005 - Baixa ETL Fim

Procedure TCtrlBaixaIntBanco.SetcdsDocsFilhoPag(Const Value: TClientDataSet);
Begin
   FcdsDocsFilhoPag := Value;
End;

Procedure TCtrlBaixaIntBanco.SetcdsDocsFilhoRec(Const Value: TClientDataSet);
Begin
   FcdsDocsFilhoRec := Value;
End;

Function TCtrlBaixaIntBanco.PreencheDocFilho: OleVariant;
Begin
   Result := GetDataPacket('   SELECT  ' +
      '    ''S'' AS SELECIONA,       ' +
      '  ''N'' AS BAIXAPARCIAL,      ' +
      '  0 AS VALORPAGO,             ' +
      '  0 as VALORPAGOOOTRMOE,      ' +
      '  (0)AS SALDO,                ' +
      '  (0) AS SALDO1,              ' +
      '  D.IDFORCLI,                 ' +
      '  D.IDMODULO,                 ' +
      '  D.CODTIPDOC,                ' +
      '  D.OPERACAO,                 ' +
      '  D.IDPESSOA,                 ' +
      '  D.CODDOCUMENTO,             ' +
      '  D.NODOCUMENTO,              ' +
      '  D.COMPLDOCUMENTO,           ' +
      '  D.DATAPROGRAMADA,           ' +
      '  D.DATADISPONIB,             ' +
      '  D.DATAVENCTO,               ' +
      '  D.RECPAG,                   ' +
      '  P.NOME,                     ' +
      '  D.STATUS,                   ' +
      '  D.MOECODIGO,                ' +
      '  D.PLANO,                    ' +
      '  D.PLACONTA,                 ' +
      '  D.CODCENTROCUSTO,           ' +
      '  D.CODSUBCONTA,              ' +
      '  D.CODGRUPOCNAB,             ' +
      '  D.NOSSONUMERO,              ' +
      '  L.NUMLANCTO,                ' +
      '  L.VLRLIQUIDO,               ' +
      '  L.DEBCRE,                   ' +
      '  L.VALOROUTRAMOEDA,          ' +
      '  0 AS IMPRET,                ' +
      '  0 AS IMP,                   ' +
      '  0 AS DIF,                   ' +
      '  ''                    '' AS PLANOPREV ' +
      ' FROM                          ' +
      '  DOCUMENTO D,                ' +
      '  PESSOA P,                   ' +
      '  LANCTODOCUM L               ' +
      ' WHERE                         ' +
      '  1 = 2                       ');

End;

// Sol 214738_15892  KTN 2057238  Paulo Nobre   13/03/2014
procedure TCtrlBaixaIntBanco.LimpaDocumentos;
begin
  CdsDocumentos.Close;
  DtmBaixaIntBanco.SqlDocumentos.Open;
  CdsDocumentos.EmptyDataSet;  
end;

function TCtrlBaixaIntBanco.RetornoViaETL(pIdModeloCNAB: Integer; pRecPag: string): Boolean;
var
  sSQL: string;
  cdsAux: TCMClientDataSet;
begin
  Result := False;
  CdsAux := TCMClientDataSet.Create(nil);
  try
    sSQL := 'SELECT NVL(FLGRETORNOETL, ''N'') AS FLGRETORNOETL  ' +#13#10+
            '  FROM MODELOSCNAB WHERE IDMODELOSCNAB = ' + IntToStr(pIdModeloCNAB) +#13#10+
            '   AND RECPAG = ' + QuotedStr(pRecPag);
    cdsAux.Data := GetDataPacket(sSQL);

    Result := cdsAux.FieldbyName('FLGRETORNOETL').AsString = 'S';

  finally
    FreeAndNil(cdsAux);
  end;
end;

function TCtrlBaixaIntBanco.RetornaUltbaixaProc: Integer;
var
  sSQL: string;
  cdsAux: TCMClientDataSet;
begin
  Result := -1;
  CdsAux := TCMClientDataSet.Create(nil);
  try
    sSQL := 'SELECT MAX(IDPROCESSO) AS IDPROCESSO ' + #13#10+
            '  FROM BAIXAUTO_CTC_PROCESSO         ' ;
//            ' WHERE DATA_FIM IS NOT NULL          ' ;
    CdsAux.Data := GetDataPacket(sSQL);

    Result := cdsAux.FieldByName('IDPROCESSO').asInteger;
  finally
    FreeAndNil(cdsAux);
  end;

end;

function TCtrlBaixaIntBanco.RetornaDadosRetorno(
  pIdProcesso: Integer): OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT NVL(NUMCHQBORDERO, 0) AS NUMCHQBORDERO, NVL(VALORTOT, 0) AS VALORTOT, ' + #13#10 +
          '       NVL(QTD_A_BAIXAR, 0) AS QTD_A_BAIXAR, NVL(CODPORTFORMA, 0) AS CODPORTFORMA ' + #13#10+
          '  FROM BAIXAUTO_CTC_PROCESSO WHERE IDPROCESSO = ' + IntToStr(pIdProcesso);
  Result := GetDataPacket(sSQL);
end;

procedure TCtrlBaixaIntBanco.SetQtdeBaixaETL(const Value: Integer);
begin
  FQtdeBaixaETL := Value;
end;

function TCtrlBaixaIntBanco.ExcluiDadosProcerssoBaixa(
  pIdProcesso: Integer): Boolean;
begin
  DtmBaixaIntBanco.QryInsertETL.SQL.Clear;
  DtmBaixaIntBanco.QryInsertETL.SQL.Add(' DELETE FROM BAIXAUTO_CTC_PROCESSO  ');
  DtmBaixaIntBanco.QryInsertETL.SQL.Add(' WHERE IDPROCESSO = ' + IntToStr(pIdProcesso));

  try
    DtmBaixaIntBanco.QryInsertETL.ExecSQL;
    if InTransaction then
      Commit();

    Result := True;
  except
    if InTransaction then
      Rollback;
    Result := False;
  end;
end;

function TCtrlBaixaIntBanco.buscaFloat(pPortForma: Integer): integer;
Begin
  CdsETL.Close;
  DtmBaixaIntBanco.SqlETL.SQL.Clear;
  DtmBaixaIntBanco.SqlETL.SQL.Add('select NVL(DMAIS, 0) as DMAIS from portadorforma por ');
  DtmBaixaIntBanco.SqlETL.SQL.Add('where por.codportforma =  ' + IntToStr(pPortForma));
  DtmBaixaIntBanco.SqlETL.Prepare;
  DtmBaixaIntBanco.SqlETL.Open;
  Result := CdsETL.FieldValues['DMAIS'];
  CdsETL.Close;
End;

procedure TCtrlBaixaIntBanco.SetcdsConvBancario(
  const Value: TClientDataSet);
begin
  FcdsConvBancario := Value;
end;
End.

