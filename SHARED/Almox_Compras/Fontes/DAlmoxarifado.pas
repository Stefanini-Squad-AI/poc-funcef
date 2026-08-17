{*******************************************************************************
  Alterações:
********************************************************************************
 Data       : 25.08.2006
 Autor      : Antonio Marcos Fernandes de Souza (amf)
 Pendências : 25515
 Descrição  : Alteração na spListDifInventArtigo. Acrescentada a coluna que traz
 a descrição do item de estoque que apresentou diferença no inventário.
---------------------------------------------------------------------------------
 Data       : 25.08.2006
 Autor      : Antonio Marcos Fernandes de Souza (amf)
 Pendências : 22580
 Descrição  : Alteração na spListDifInventArtigo. Retirei a obrigatoriedade da seleção do artigo
              Traz o número do inventário se houver diferenças
---------------------------------------------------------------------------------
 Data       : 16.08.2006
 Autor      : Antonio Marcos Fernandes de Souza (amf)
 Pendências : 22576
 Descrição  : Alteração no spGetItem para acrescentar as quantidades atendidas e
              quantidades devolvidas.
             (I.QTDEPEDIDA - I.QTDEPENDENTE) AS QTDEATENDIDA,
             NVL(DECODE(SUB.FLGSTATUS, 'D', SUB.QTDEENTREGA), 0) AS QTDEDEVOLVIDA,

             Alteração no subselect
             (
              SELECT CODARTIGO, FLGSTATUS, QTDEENTREGA  FROM ITEMENTR
              WHERE (NUMREQUISICAO = :NUMREQUISICAO)
              )SUB
----------------------------------------------------------------------------------
 Rotina     :
 Data       : 06/07/2005
 Autor      : André Tavares
 Pendências : 18169
 Descrição  : comentei a cláusula order by do sql spListContab pois não estava
 possibilitando o lançamentos contábeis em partida dobrada.
---------------------------------------------------------------------------------
 Componente : spListItemRecMerc
 Data       : 02/12/04 (término)
 Autor      : Bruno Bastos
 Pendências : 18113
 Descrição  : Inclusão dos novos campos IdPlanoPrev, IdPatro e IdPrograma.
---------------------------------------------------------------------------------
 Componente : spListItemRecMerc
 Data       : 22/06/04 (término)
 Autor      : David Ayrolla
 Pendências : 17057
 Descrição  : Incluído campos novos para recuperação do compromisso orçamentário.
---------------------------------------------------------------------------------
 Componente: spListItemRecMerc
 Data      : 27/02/2004 (término)
 Autor     : David Ayrolla
 Pendência : 15868
 Descrição : Incluído campo IDSEGREGACRITER para lançamento de documentos com
             múltiplas contas de baixa e segregados.
--------------------------------------------------------------------------------
 Componente: spListItemRecMerc
 Data      : 17057
 Autor     : David Ayrolla
 Pendência : 17057
 Descrição : Incluídos os campos NUMRESERVA e VLRRESERVA.
--------------------------------------------------------------------------------
}

unit DAlmoxarifado;

interface

uses

  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCmSqlParams, Db, DBClient, uCMClientDataSet;

type
  TDtmAlmoxarifado = class(TDataModule)
    spListReqMat: TCMSqlParams;
    spGetItem: TCMSqlParams;
    cds: TCMClientDataSet;
    spReqManual: TCMSqlParams;
    spItemReqManual: TCMSqlParams;
    spFichaTec: TCMSqlParams;
    spExisteRequisicao: TCMSqlParams;
    spArqInvent: TCMSqlParams;
    spGeraItensiInvent: TCMSqlParams;
    spExisteInvent: TCMSqlParams;
    spListContagem: TCMSqlParams;
    spListDiferencas: TCMSqlParams;
    spExisteContagem: TCMSqlParams;
    spGeraAnaliseInvent: TCMSqlParams;
    spListResultAnalise: TCMSqlParams;
    spUpdResCont: TCMSqlParams;
    spFechaInvetario: TCMSqlParams;
    spAtualizaDataUltInvent: TCMSqlParams;
    spInsertContagem: TCMSqlParams;
    spListAltCustoMed: TCMSqlParams;
    spConverteValor: TCMSqlParams;
    spListTipoPerda: TCMSqlParams;
    spListDifInventArtigo: TCMSqlParams;
    spGetAtendItem: TCMSqlParams;
    spListProdAtuRepresa: TCMSqlParams;
    spReqJaEntregue: TCMSqlParams;
    spListOutrasReq: TCMSqlParams;
    spListItemAtend: TCMSqlParams;
    spConfDevolAtend: TCMSqlParams;
    spListItemConfAtend: TCMSqlParams;
    spAtuIntegraContab: TCMSqlParams;
    spAtuDataUltIntegra: TCMSqlParams;
    spListIntegraContab: TCMSqlParams;
    spConverte: TCMSqlParams;
    spAtuMovUn: TCMSqlParams;
    spAtuSaldoUn: TCMSqlParams;
    spCustoMedUn: TCMSqlParams;
    spListMovPlanilha: TCMSqlParams;
    spListImpSlado: TCMSqlParams;
    spListItemRecMerc: TCMSqlParams;
    spListRecMerc: TCMSqlParams;
    spListContab: TCMSqlParams;
    spListDadosCAP: TCMSqlParams;
    spBaixaSCI: TCMSqlParams;
    spAtuItemSoli: TCMSqlParams;
    spInsertSoliBaixadas: TCMSqlParams;
    spDelBaixaSCI: TCMSqlParams;
    spBaixaDir: TCMSqlParams;
    spGetNotaCompl: TCMSqlParams;
    spListAgregNFCompl: TCMSqlParams;
    spGetAgregItem: TCMSqlParams;
    spGetAgregNota: TCMSqlParams;
    spGetAgregItemForItem: TCMSqlParams;
    spListBaixaDir: TCMSqlParams;
    spListItemDevol: TCMSqlParams;
    spGetAgregDevol: TCMSqlParams;
    spAgregNFComplDevol: TCMSqlParams;
    spGetAgergItemDevol: TCMSqlParams;
    spBaixaSCIComOC: TCMSqlParams;
    procedure spListDifInventArtigoFormartParam(sParamName,
      sOldValue: String; var sNewValue: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

procedure TDtmAlmoxarifado.spListDifInventArtigoFormartParam(sParamName,
  sOldValue: String; var sNewValue: String);
begin
  IF AnsiUpperCase(sParamName) = 'LISTALMOX' Then
     sNewValue := Copy( sOldValue,1,Length(sOldValue));

end;

end.
