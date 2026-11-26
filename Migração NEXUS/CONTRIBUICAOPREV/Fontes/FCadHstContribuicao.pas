unit FCadHstContribuicao;

// Alterações:
{
---------------------------------------------------------------------------------------------------
Nº WO.....: 4557
Data.......: 19/10/2021
Responsável: Helen V Bianchi
Descrição..: Inclusão de critério de verificaçao do valor inferior à soma da última contribuição normal
---------------------------------------------------------------------------------------------------
Nº SIG.....: 104014
Data.......: 24/12/2021
Responsável: edilaine
Descrição..: calcular data prevista a partir do mes/ano cobrança
---------------------------------------------------------------------------------------------------
Nº SIG.....: 61677
Data.......: 16/07/2020
Responsável: Ewerton Beltramini (Ejrb)
Descrição..: Inclusão de novos campos: Salario de contribuição e Percentual de Contribuição.
---------------------------------------------------------------------------------------------------
Nº SIG.....: SIG96931 
Data.......: 07/04/2020
Responsável: Rafael Vasconcelos
Descrição..: Não alterar contribuições já tratadas
---------------------------------------------------------------------------------------------------
Nº SIG.....: SIG98483 
Data.......: 06/03/2020
Responsável: Rafael Vasconcelos
Descrição..: A exclusão das inserções em lote sejam efetuada por grupos.Grupo da folha só pode excluir o que eles inseriram
---------------------------------------------------------------------------------------------------
Nº SIG.....: SIG95907
Data.......: 06/01/2020
Responsável: Ewerton Beltramini (Ejrb)
Descrição..: Incluir e excluir a importação de arquivos.
---------------------------------------------------------------------------------------------------
Alteração  :
Nº SIG.....: 91445
Data.......: 11/09/2019
Responsável: Darivaldo Alencar
Descrição..: controle de transação no botão OK/Cancelar para importação de arquivo
---------------------------------------------------------------------------------------------------
Alteração  :
Nº SIG.....: 90078
Data.......: 15/08/2019
Responsável: Andre Imakawa
Descrição..: Controle de Transação
---------------------------------------------------------------------------------------------------
Alteração  : qryDetBeforePost
Nº SIG.....: 90194
Data.......: 14/08/2019
Responsável: Andre Imakawa
Descrição..: Atualização da TMPDESC passando o NUMRECEBIMENTO
---------------------------------------------------------------------------------------------------
Alteração  : sbtnAltDetClick
Nº SIG.....: 85321
Data.......: 29/04/2019
Responsável: Darivaldo Alencar
Descrição..: Critica indevida ao tentar alterar uma contibuição ainda não processada
---------------------------------------------------------------------------------------------------
Alteração  : grpMesAnoRefExit, qryDetAfterPost, qryDet
Nº SIG.....: 60728
Data.......: 17/01/2018
Responsável: Andre Imakawa
Descrição..: Correção para trazer registros da pessoa correta, quando ele é Titular e Pensionista
             ao mesmo tempo
---------------------------------------------------------------------------------------------------
Alteração  : DFM, CmeCadastroFind, FormActivate e BBtnImportaClick
Nº SIG.....: 47372
Data.......: 31/05/2017
Responsável: Andre Imakawa
Descrição..: Correção para trazer registros do IdTitular correto
---------------------------------------------------------------------------------------------------
Pendência   : SIG 46976
Responsável : Andre Imakawa
Data        : 25/05/2017
Descrição   : Com a entrada do SIG 46066 o sistema passou a gravar o IDTITULAR incorreto
              Funcionalidade utilizada apenas para titulares, então passando o proprio idpessoa.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 263499 - PPM 1124000
Responsável : Wiliam Moreira da Silva
Data        : 26/10/2015
Descrição   : Erro ao excluir ou modificar alguma contribuição que já tenha sido lançada na folha de benefício
---------------------------------------------------------------------------------------------------
Pendência   : SOL 253577/17650 PPM 1015003
Responsável : Helio Lima Custódio
Data        : 12/08/2015
Descrição   : Permitir inserir Plano Contabil em serie
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
Pendência   : SOL 162126*RE01 KINTANA 792563
Responsável : Higor Nayde
Data        : 25/05/2015
Descrição   : Criação do campo Plano Contabil
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
Pendência   : SOL 211020 Kintana 2034882
Responsável : Fernando Xavier
Data        : 16/07/2013
Descrição   : O sistema bloqueia o 'campo' ao inserir uma 2° contribuição para o mesma matricula
---------------------------------------------------------------------------------------------------
Pendência   : SOL 205293 Kintana 1985760
Responsável : Thiago Melo
Data        : 22/04/2013
DFM         :
Descrição   : Erro ao importar arquivo das contribuições.
---------------------------------------------------------------------------------------------------
Pendência   : SOL 197515 Kintana 1892354
Responsável : Bruno Azevedo
Data        : 21/12/2012
DFM         : Não teve.
Descrição   : Ajustes na alteração da tabela CONTPREV no campo IDREGRACALCULO.
---------------------------------------------------------------------------------------------------
Pendência   : SOL 194021 Kintana 1848642
Responsável : Higor Nayde Ferreria
Data        : 05/11/2012
DFM         :
Descrição   : Validação para Ano e Mês Referencia quando o mesmo for igual a 13.
---------------------------------------------------------------------------------------------------
Pendência   : SOL 181197 Kintana 1679385
Responsável : Higor Nayde Ferreria
Data        : 13/09/2012
DFM         : Inclusão do campo DATAEMISSCOB na QryDet
Descrição   : Alteração dos campos mes referencia, mes cobraça e motivo para contribuições que possuem alterador.
---------------------------------------------------------------------------------------------------
Pendência   : SOL 182010 Kintana 1690237
Responsável : Fernando Xavier
Data        : 06/06/2012
DFM         : Inclusão do campo DATAEMISSCOB na QryDet
Descrição   : Inconsistência na gravação da contribuição, botão Ok
--------------------------------------------------------------------------------
Pendência   : SOL 180156 Kintana 1668852
Responsável : Fernando Xavier
Data        : 24/05/2012
Descrição   : Inconsistência na gravação da data de envio de contribuições.
--------------------------------------------------------------------------------
Autor(a)    : Fernando Xavier
Data        : 13/04/2012
Pendência   : SOL 160624  KINTANA 1351068
Descricao   : Entrada Manual de Contribuições
-------------------------------------------------------------------------------------------------
Autor(a)    : Fernando Santana
Data        : 03/08/2010
Pendência   : SOL 133951  KINTANA 783947
Descricao   : Alimentar a tebela CONTRIBUICAOXANOBASEXPESSOA.
-------------------------------------------------------------------------------------------------
Autor(a)    : Ádler Teodoro de Souza
Data        : 07/08/2009
Rotina      : RetornaIdTitular
Pendência   : SOL 108902  KINTANA 493923
Descricao   : O campo IDTITULAR está sendo inserido na tabela HSTCONTRIBPREV.
-------------------------------------------------------------------------------------------------
Data      : 27/01/2009
Autor(a)  : Renato Visoni
Pendência : SOL 102263 \	Kintana 456414
Alteração : Acrescentar o campo Origem do Recurso na Grid.
----------------------------------------------------------------------------------------------------
Data      : 21/11/2008
Autor(a)  : Renato Visoni
Pendência : SOL 101115 \	Kintana 448902
Alteração : Criação dos campos : Tipo de Recurso e Origem do Recurso
----------------------------------------------------------------------------------------------------
Rotina    :
Data      : 29/11/2007
Autor(a)  : André Pontes
Pendência : 26656
Alteração : Retirada do preenchimento da data de recebimento com a data prevista
----------------------------------------------------------------------------------------------------
Rotina    : sbtnAltDetClick
Data      : 03/08/2007
Autor(a)  : Gleyber
Pendência : 25903
Alteração : Alteração para verificar corretamente a parametrização que permita alterar o cadastro de
            histórico de contribuição.
----------------------------------------------------------------------------------------------------
Rotina    : sbtnAltDetClick
Data      : 27/06/2007
Autor(a)  : Gleyber
Pendência : 25696
Alteração : Alteração para não verificar a existência de registro na TMPDESC
            se na HSTCONTRIBPREV estiver com SITRECEBIMENTO = 0
----------------------------------------------------------------------------------------------------
Rotina    : sbtnExcluiDetClick
Data      : 27/10/2006
Autor(a)  : André Pontes
Pendência : 23640
Alteração : Correção da exclusão de contribuições cujo valor esperado é zero
----------------------------------------------------------------------------------------------------
Rotina    : qryDetBeforePost
Data      : 16/05/2006
Autor(a)  : Gleyber
Pendência : 19358
Alteração : Correção para colocar nulo no campo PORTADOR FORMA caso este não
            seja preenchido.
----------------------------------------------------------------------------------------------------
Rotina    : edMesRefExit
Data      : 30/03/2006
Autor(a)  : Paulo Ramos
Pendência : 19832
Alteração : Alterar para a mensagem não apareça como erro e nos meses de abono.
----------------------------------------------------------------------------------------------------
Rotina    : qryDetBeforePost e BuscaSitAnterior
Data      : 10/01/2006
Autor(a)  : Gleyber
Pendência : 20095
Alteração : Implementação para buscar a situação anterior do participante
            caso este seja CANCELADO.
----------------------------------------------------------------------------------------------------
Rotina    : edMesRefExit
Data      : 02/01/2006
Autor(a)  : Gleyber
Pendência : 19832
Alteração : Crítica para verificar se o MÊS DE COBRANÇA é menor do que o
            MÊS DE REFERENCIA.
----------------------------------------------------------------------------------------------------
Rotina    : FormActivate, CmeDetalheInsert e qryDetBeforePost
Data      : 02/01/2006
Autor(a)  : Gleyber
Pendência : 19318
Alteração : Gravação do campo CODPORTFORMA na HSTCONTRIBPREV e alteração do
            FLGMANUAL para 2 quando houver alteração do valor diferente da
            CONTRIBPREVPARTP do participante.
----------------------------------------------------------------------------------------------------
Rotina    : sbtnAltDetClick e  sbtnExcluiDetClick
Data      : 20/10/2005
Autor(a)  : Augusto
Pendência : 20538
Alteração : Acerto nos parametros da pesquisa na BRTPREV
----------------------------------------------------------------------------------------------------
Rotina    : qryDetBeforePost
Data      : 21/09/2005
Autor(a)  : Leo
Pendência : 20277
Alteração : tratamento para baixar/reabrir alteradores conforme situação do recebimento
----------------------------------------------------------------------------------------------------
Rotina    : sbtnAltDetClick e  sbtnExcluiDetClick
Data      : 06/09/2005
Autor(a)  : Leo
Pendência : 20141
Alteração : retirei ")" a mais na claúsula do lote
----------------------------------------------------------------------------------------------------
Rotina    : qryDetBeforePost
Data      : 28/12/2004
Autor(a)  : Gleyber
Pendência : 18293
Alteração : - CANCELAMENTO DA PENDÊNCIA - VOLTA DO CÓDIGO ANTERIOR -
----------------------------------------------------------------------------------------------------
Rotina    : sbtnAltDetClick e  sbtnExcluiDetClick
Data      : 16/08/2005
Autor(a)  : Leo
Pendência : 19967
Alteração : criticar envio de contribuições de assistidos para a PREVIA
----------------------------------------------------------------------------------------------------
Rotina    : qryDetBeforePost
Data      : 07/07/2005
Autor(a)  : Augusto
Pendência : 19590
Alteração : Não pesquisar mes 13
----------------------------------------------------------------------------------------------------
Rotina    : qryDetBeforePost
Data      : 28/06/2005
Autor(a)  : Augusto
Pendência : 19574
Alteração : Acerto para o caso da Regra estar vazia
----------------------------------------------------------------------------------------------------
Rotina    : chkDivTratClick
Data      : 30/05/2005
Autor(a)  : Gleyber
Pendência : 17843
Alteração : Criação do filtro para visualizar ou não as contribuições com
            divergências já tratadas.
----------------------------------------------------------------------------------------------------
Rotina    : qryDetAfterPost
Data      : 17/02/2005
Autor(a)  : Gleyber
Pendência : 17773
Alteração : Alterar o campo ULTMESPREPARO considerando sempre o maior já
            gravado no histórico de contribuição.
----------------------------------------------------------------------------------------------------
Rotina    : qryDetBeforePost
Data      : 28/12/2004
Autor(a)  : Gleyber
Pendência : 18293
Alteração : Gravar a situação da contribuição no histórico e não a situação
            atual do participante.
----------------------------------------------------------------------------------------------------
Rotina    : wwDBLookupCombo1DropDown e rdgrpatrasodevolChange
Data      : 04/11/2004
Autor(a)  : Gleyber
Pendência : 17844
Alteração : Tratamento para visualização de lote e correção de label
----------------------------------------------------------------------------------------------------
Rotina    : bbtnConfirmarClick
Data      : 28/10/2004
Autor(a)  : Augusto
Pendência : 18014
Alteração : Tratamento para agilizar confirmação.
----------------------------------------------------------------------------------------------------
Rotina    : bbtnConfirmarClick
Data      : 25.10.2004
Autor(a)  : Camille
Pendência : 17773
Alteração : A montagem de ano/mes estava edanocob + edANOcob
            Alterei para                 edanocob + edMEScob
----------------------------------------------------------------------------------------------------
Rotina    : bbtnConfirmarClick
Data      : 27/09/2004
Autor(a)  : Gleyber
Pendência : 17773
Alteração : Comentado o código da pendência 16293.
----------------------------------------------------------------------------------------------------
Rotina    : qryDetAfterPost
Data      : 22.09.2004
Autor(a)  : Camille
Pendência : ----
Alteração : Acertar HSTATRASOCONTRIB
----------------------------------------------------------------------------------------------------
Rotina    : qryDetBeforePost
Data      : 16/08/2004
Autor(a)  : Gleyber
Pendência : 17389
Alteração : Quando o participante for assistido questionar se houver modificação
            na forma de cobrança.
----------------------------------------------------------------------------------------------------
Autor(a)  : Camille
Pendência : 17125
Data      : 30.06.2004
Alteração : Só atualizar o ultmespreparo se o anomescobranca for maior que
            o ultmespreparo e o registro que estiver sendo inserido não for
            um acerto
----------------------------------------------------------------------------------------------------
Autor(a)  : Camille
Pendência : 16612
Data      : 16.04.2004
Alteração : Alteração no filtro pois estava duplicando linhas para
            participantes que tinham migrado de plano
----------------------------------------------------------------------------------------------------
Autor(a)  : Ricardo Vigorito
Pendência : 16095
Data      : 29.03.2004
Alteração : O programa passou a gravar todas as movimentações no arquivo
 de log.
----------------------------------------------------------------------------------------------------
Autor(a)  : Ricardo Vigorito
Pendência : 16247
Data      : 29.03.2004
Alteração : Gravar , com último preparo, a maior data de cobrança
----------------------------------------------------------------------------------------------------
Rotina    : grpMesAnoRefExit
Autor(a)  : Camille
Data      : 25.03.2004
Alteração : Chamar regra de 13o se o mes de referencia for 13
----------------------------------------------------------------------------------------------------
Rotina    : qry e montaselect
Autor(a)  : Camille
Data      : 23.03.2004
Alteração : Acerto para tratar responsavel do nucleo familiar
----------------------------------------------------------------------------------------------------
Rotina    : sbtnExcluiDetClick(
Autor(a)  : Augusto
Data      : 08/03/2004
Alteração : Excluir HSTATRASOCONTRIB
----------------------------------------------------------------------------------------------------
Rotina    : grpMesAnoRefExit
Autor(a)  : Gleyber
Data      : 05/12/2003
Pendencia : 14864
Alteração : Tratamento para valores negativos
----------------------------------------------------------------------------------------------------
Rotina    : qryDetBeforePost
Autor(a)  : Augusto
Data      : 19/08/2003
Pendencia : 14873
Alteração : Alteração nos controles dos campo FLGDESCFOLHA - FOLHAORIGEM
----------------------------------------------------------------------------------------------------
Rotina    : Confirmação do Detalhe
Autor(a)  : Augusto
Data      : 06/01/2003
Alteração : Novo valor (Folha Benficios - B) para o campo FolhaOrigem
----------------------------------------------------------------------------------------------------
Rotina    :
Autor(a)  : Leo
Data      : 13/09/2002
Alteração : tratamento para inserir e alterar o FOLHAORIGEM
----------------------------------------------------------------------------------------------------
Rotina    : alteração e deleção
Autor(a)  : Leo
Data      : 30/08/2002
Alteração : crítica para não deixar alterar ou excluír contribuições já enviadas para
            o contas a receber
----------------------------------------------------------------------------------------------------
Rotina    : dbdtRecebimentoExit   e   dbedRecebidoExit
Autor(a)  : Leo
Data      : 27/08/2002
Alteração : tratamento para facilitar a marcação do sitrecebimento em casos de
            "Recebidas SEM Divergências" e "Recebida COM Divergência"
----------------------------------------------------------------------------------------------------}

interface
                                                                                        
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, DBCtrls,
  Mask, wwdbedit, wwdbdatetimepicker, CMDateTimePicker, CmEventosCadastro,
  ImgList, wwdblook, Wwdbdlg, ComObj, UCtrlDocumento, UCtrlLancamento,
  DBClient, uCMClientDataSet,uCmControlObject;

type
  TfrmCadHstContribuicao = class(TfrmCadMestreDetalheCS)
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    DBText9: TDBText;
    grpMesAnoRef: TGroupBox;
    Label10: TLabel;
    edAnoRef: TEdit;
    edMesRef: TEdit;
    grpMesCobranca: TGroupBox;
    Label11: TLabel;
    edAnoCob: TEdit;
    edMesCob: TEdit;
    Label12: TLabel;
    dbedEsperado: TwwDBEdit;
    dbrgrpForma: TDBRadioGroup;
    Label13: TLabel;
    dbedRecebido: TwwDBEdit;
    dbdtPrevisao: TCMDateTimePicker;
    dbdtRecebimento: TCMDateTimePicker;
    Label14: TLabel;
    Label15: TLabel;
    dbrgrpSitRecebimento: TDBRadioGroup;
    tbtnReceberTudo: TToolbarButton97;
    qryHistContribPrev: TwwQuery;
    qryUpdateHistContribPrev: TwwQuery;
    rdgrpatrasodevol: TDBRadioGroup;
    qryMAIORMES: TwwQuery;
    UPDMAIORMES: TwwQuery;
    qryMotivo: TwwQuery;
    DBLKPCMBMOTIVO: TwwDBLookupCombo;
    qryDetNUMRECEBIMENTO: TFloatField;
    qryDetIDMOTIVO: TFloatField;
    qryDetMESREFERENCIA: TStringField;
    qryDetMESCOBRANCA: TStringField;
    qryDetIDPESSJUR: TFloatField;
    qryDetIDPLANOPREV: TFloatField;
    qryDetIDPESSOA: TFloatField;
    qryDetIDCONTRIBUICAO: TFloatField;
    qryDetSEQPROPOSTA: TFloatField;
    qryDetFLGDEVOLUCAO: TFloatField;
    qryDetFLGDIVERGENTE: TFloatField;
    qryDetFLGCONCESSAO: TFloatField;
    qryDetFLGEVENTO: TFloatField;
    qryDetFLGCALCRESERVA: TFloatField;
    qryDetFLGDESCFOLHA: TFloatField;
    qryDetFLGSITFUNDACAO: TStringField;
    qryDetFLGAPORTE: TFloatField;
    qryDetVALORESPERADO: TFloatField;
    qryDetVALORRECEBIDO: TFloatField;
    qryDetVALORCALCULADO: TFloatField;
    qryDetDATAPREVISAORECE: TDateTimeField;
    qryDetDATARECEBIMENTO: TDateTimeField;
    qryDetDATAINICIO: TDateTimeField;
    qryDetDATAFINAL: TDateTimeField;
    qryDetIDREGRACALCULO: TFloatField;
    qryDetSITRECEBIMENTO: TStringField;
    qryDetTIPO: TStringField;
    qryDetVALOROP1: TFloatField;
    qryDetVALOROP2: TFloatField;
    qryDetVALOROP3: TFloatField;
    qryDetVALORPARARESERVA: TFloatField;
    qryDetDESCRICAO: TStringField;
    qryDetFLGMANUAL: TFloatField;
    qryDetCODDOCUMENTOPREV: TFloatField;
    qryDetFOLHAORIGEM: TStringField;
    Label16: TLabel;
    qryLote: TwwQuery;
    Label17: TLabel;
    wwDBLookupCombo1: TwwDBLookupCombo;
    qryDetIDLOTE: TFloatField;
    qryDetFLGALTERADO: TFloatField;
    chkDivTrat: TCheckBox;
    qryAux: TwwQuery;
    Label18: TLabel;
    qryPortadorForma: TwwQuery;
    qryDetCODPORTFORMA: TFloatField;
    dblgCodPortForma: TwwDBLookupCombo;
    Label20: TLabel;
    Label23: TLabel;
    EdOrigemRecurso: TEdit;
    cboTipoRecurso: TwwDBLookupCombo;
    qryTipoRecurso: TwwQuery;
    GroupBox1: TGroupBox;
    memobs: TMemo;
    qryDetIDTIPORECURSO: TFloatField;
    qryDetORIGEMRECURSO: TStringField;
    qryDetNOMETIPORECURSO: TStringField;
    qryDetIDTITULAR: TFloatField;
    edAnoDIRF: TEdit;
    Label19: TLabel;
    qryDetANODIRF: TFloatField;
    LblCodDocPrev: TLabel;
    btnProcura: TToolbarButton97;
    OpenDialog1: TOpenDialog;
    qryDetSELECIONA: TFloatField;
    MontaSelectCapCar: TMontaSelect;
    BBtnImporta: TBitBtn;
    BBtnContabiliza: TBitBtn;
    StringGrid1: TStringGrid;
    btnInverte: TBitBtn;
    btnMarcaTodas: TBitBtn;
    edtCodDocPrev: TwwDBEdit;
    qryAux2: TwwQuery;
    tbsLog: TTabSheet;
    Panel1: TPanel;
    MmOcorrencia: TMemo;
    qryContabil: TwwQuery;
    qryContabilPLACONTA: TStringField;
    qryContabilCODSUBCONTA: TFloatField;
    qryContabilNOME_1: TStringField;
    qryContabilNOME: TStringField;
    qryContabilLACDEBCRE: TStringField;
    qryContabilLACVALOR: TFloatField;
    qryContabilLACVALHIST: TFloatField;
    qryContabilLACHIST1: TStringField;
    qryContabilLACHIST2: TStringField;
    qryContabilLACHIST3: TStringField;
    qryContabilPLNCODIGO: TFloatField;
    qryContabilLACNUMLAN: TFloatField;
    qryContabilHITCODHIST: TStringField;
    qryContabilIDPESSOA: TFloatField;
    qryContabilIDEMPRESA: TFloatField;
    qryContabilIDMODULO: TFloatField;
    qryContabilUNIDNEGOC: TFloatField;
    qryContabilIDUSUARIOINCLUSAO: TFloatField;
    qryContabilCODCENTROCUSTO: TStringField;
    qryContabilPLANO: TFloatField;
    qryContabilLACTIPO: TStringField;
    qryContabilLACNUMDOC: TStringField;
    qryContabilLACHIST4: TStringField;
    qryContabilLACHIST5: TStringField;
    qryContabilLACTIPCONVOFICIAL: TStringField;
    qryContabilLACVALOFICIAL: TFloatField;
    qryContabilLACTIPCONVGER: TStringField;
    qryContabilLACVALGERENCIAL: TFloatField;
    qryContabilLACTIPCONVGEREN1: TStringField;
    qryContabilLACVALGEREN1: TFloatField;
    qryContabilLACTIPCONVGEREN2: TStringField;
    qryContabilLACVALGEREN2: TFloatField;
    qryContabilLACATOUTMOEDA: TStringField;
    qryContabilLACORIGEMAPLIC: TStringField;
    qryContabilTIPCODIGO: TStringField;
    qryContabilIDELEMDEMONSTRAT: TFloatField;
    qryContabilCODCENTROCUSTO_1: TStringField;
    qryContabilPLNDATDIA: TDateTimeField;
    qryContabilIDPESSJUR: TFloatField;
    qryContabilIDPLANOPREV: TFloatField;
    updContabil: TUpdateSQL;
    qryDetCONTABILIZA: TFloatField;
    qryDetFLGIMPORTADO: TFloatField;
    qryvaloralterador: TwwQuery;
    qryDetDATAEMISSCOB: TDateTimeField;
    cdsChavesprimarias: TCMClientDataSet;
    qryDetNOMEPLANO: TStringField;
    edtPlanoContabil: TwwDBEdit;
    Label21: TLabel;
    qryDetIDPLANPREVCONTAB: TFloatField;
    GroupBox2: TGroupBox;
    GBExcluirImportacao: TGroupBox;
    LblImporta: TLabel;
    edtImporta: TEdit;
    btnImporta: TToolbarButton97;
    Label22: TLabel;
    EdtDescricaoImportacao: TEdit;
    btnExcluirArquivo: TSpeedButton;
    QryImpAux: TwwQuery;
    DscExcluirArquivo: TwwDataSource;
    QryExcluirArquivo: TwwQuery;
    QryExcluirArquivonomeusuario: TStringField;
    QryExcluirArquivoidusuario: TFloatField;
    QryExcluirArquivoid: TFloatField;
    QryExcluirArquivodescricao: TMemoField;
    QryExcluirArquivodata: TDateTimeField;
    DBNavigator1: TDBNavigator;
    EdtUsuario: TEdit;
    EdtData: TEdit;
    MemoDescricao: TMemo;
    btnPesquisarExcluirArq: TSpeedButton;
    qryDetSALCONTRIB: TFloatField;
    Label24: TLabel;
    dbeSalContrib: TwwDBEdit;
    Label25: TLabel;
    dbePercContrib: TwwDBEdit;
    qryDetOBSERVACAO: TStringField;

    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure qryDetBeforePost(DataSet: TDataSet);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure dbedEsperadoExit(Sender: TObject);
    procedure dbdtPrevisaoExit(Sender: TObject);
    procedure grpMesAnoRefExit(Sender: TObject);
    procedure tbtnReceberTudoClick(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure edMesRefExit(Sender: TObject);
    procedure qryDetAfterInsert(DataSet: TDataSet);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure dbedRecebidoExit(Sender: TObject);
    procedure dbdtRecebimentoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grpMesCobrancaExit(Sender: TObject);
    procedure qryDetAfterScroll(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure wwDBLookupCombo1DropDown(Sender: TObject);
    procedure rdgrpatrasodevolChange(Sender: TObject);
    procedure qryDetAfterPost(DataSet: TDataSet);
    procedure chkDivTratClick(Sender: TObject);
    procedure cboTipoRecursoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure btnProcuraClick(Sender: TObject);
    procedure btnImportaClick(Sender: TObject);
    procedure BBtnImportaClick(Sender: TObject);
    procedure BBtnContabilizaClick(Sender: TObject);
    procedure dbgrdDetDblClick(Sender: TObject);
    procedure btnInverteClick(Sender: TObject);
    procedure btnMarcaTodasClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbcDetalheChange(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure btnExcluirArquivoClick(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure MemoDescricaoChange(Sender: TObject);
    procedure btnPesquisarExcluirArqClick(Sender: TObject);



  private // Private declarations
    flg_Movimentacao : integer;
    QRYCONTXANOBASEXPESSOA : TwwQuery;
    bErroValidacao      : boolean;
    iHabBtContabiliza : integer; // xavier
    CtrlDocumento       : TCtrlDocumento;
    CtrlLancamento      : TCtrlLancamento;

    bArqImportado: Boolean;  //SIG91445

    bObrigaObservacao: Boolean; //WO4557 - Helen
    sNaoEnviados     : String;  //WO4557 - Helen

    procedure CONTRIBUICAOXANOBASEXPESSOA ;
    function  XlsToStringGrid(AGrid: TStringGrid; AXLSFile: string): Boolean;
    procedure GravaDadosTabela;
    procedure MarcaDesmarca(pTipo: String);

    procedure FinalizaImportacao(btn: TBitbtn);//SIG91445

  public  // Public declarations
     vMesCobraca, vMesReferencia, vMotivo, vNumeroRecebimento, vCodAlterador :String; //Higor Nayde Ferreria SOL 181197 Kintana 1679385
     bnavegador : Boolean;
     iPlnCodigo  : integer;
     sIdGrupo:    String;
     function ExisteNaTmpDesc(qry: TwwQuery) : Boolean;

     function BuscaSitAnterior(pIdPessJur, pIdPlanoPrev, pIdTitular, pSeqProposta : String) : String;

     procedure AtualizaULTMESPREPARO(); // Andre Imakawa - SIG 60728
     procedure ValidaVlEsperado();     //WO4557 - Helen


  end;



var
  frmCadHstContribuicao: TfrmCadHstContribuicao;



implementation
{$R *.DFM}
uses
  UAdmPrev, UMensErro, UDataBase, DAPrev, UContribuicaoPrev, DBaseDados,
  UFuncoesUteis, USistema, UModulo, UParticipante;


procedure TfrmCadHstContribuicao.MarcaDesmarca(pTipo: String);
 var Lista : TStringList;
begin
  //pTipo = 'TODAS': Botão Marca Todas;
  //pTipo = 'INVERTE': Botão Inverte Seleção;
   qryDet.DisableControls;
//   Lista := TStringList.Create;
//   Lista.Add(updDet.ModifySQL.Text);
//   updDet.ModifySQL.Clear;
   qryDet.First;
   while not qryDet.Eof do
   begin
      if qryDet.FieldByName('CONTABILIZA').Asinteger = 0 then
      begin
         qryDet.Edit;
         edAnoRef.Text  := Copy(qryDet.FieldByName('MesReferencia').AsString,1,4);
         edMesRef.Text  := Copy(qryDet.FieldByName('MesReferencia').AsString,6,2);
         edAnoCob.Text  := Copy(qryDet.FieldByName('MesCobranca').AsString,1,4);
         edMesCob.Text  := Copy(qryDet.FieldByName('MesCobranca').AsString,6,2);
         edAnoDIRF.Text := qryDet.FieldByName('ANODIRF').AsString;
         if (pTipo = 'TODAS') then
         begin
            qryDet.FieldByName('SELECIONA').AsString := '1';
         end
         else
         if (pTipo = 'INVERTE') then
         begin
            if (qryDet.FieldByName('SELECIONA').AsString = '1') then
            begin
               qryDet.FieldByName('SELECIONA').AsString := '0';
            end
            else
            begin
               qryDet.FieldByName('SELECIONA').AsString := '1';
            end;
         end;
         qryDet.Post;
      end;
      qryDet.Next;
   end;
//   updDet.ModifySQL.Add(Lista.Text);
   qryDet.EnableControls;
   BBtnContabiliza.Enabled := (qryDet.FieldByName('SELECIONA').AsString = '1') ;
//   FreeAndNil(Lista);
end;

procedure TfrmCadHstContribuicao.GravaDadosTabela;
var iIndice, iIndice2, iCount : Integer;
    iNumrecebimento : extended;
    sSql, sCampos, sValues, sSqlAux, sSeq : String;
    fValoresperado : double; // Helen V Bianchi - WO4557
    sMatricula : String; // Helen V Bianchi - WO4557
begin
   iIndice  := 0;
   iIndice2 := 0;
   iCount   := 0;
   iNumrecebimento := 0;
   fValoresperado  := 0;   // Helen V Bianchi - WO4557
   sNaoEnviados    := '';  // Helen V Bianchi - WO4557

   //Ewerton Beltramini - SIG95907 - 23/12/2019 - Inicio.................................................
   //Capturando a sequencia...
   QryImpAux.Close;
   QryImpAux.sql.clear;
   QryImpAux.sql.add('select cm.seq_importacaohstcontrib.nextval as seq from dual');
   QryImpAux.open;
   sSeq := IntToStr(QryImpAux.FieldByName('seq').AsInteger);
   //Inserindo a nova importação...
   QryImpAux.Close;
   QryImpAux.sql.clear;
   QryImpAux.sql.add('INSERT INTO cm.importacaohstcontrib (id, idusuario, data, descricao) values ( ');
   QryImpAux.sql.add(sSeq + ', ' + IntToStr(Sistema.IdUsuario) + ', ' + quotedStr(Formatdatetime('dd/mm/yyyy',date)) + ', ' + QuotedStr(EdtDescricaoImportacao.Text));
   QryImpAux.sql.add(' )');
   QryImpAux.execsql;
   //Ewerton Beltramini - SIG95907 - 23/12/2019 - Fim....................................................

   sSql := 'INSERT INTO cm.HSTCONTRIBPREV ( ';
   with StringGrid1 do //StringGrid
   begin
      // navega nas colunas criando a instrução insert
      For iIndice2 := 1 to ColCount -1 do
      begin
         sCampos := sCampos + trim(StringGrid1.Cells[iIndice2,0])+ ', ';
      end;
      // numrecebinmentop
      sCampos := sCampos + 'NUMRECEBIMENTO, FLGIMPORTADO, idimportacaohstcontrib  ';    //Ewerton Beltramini - SIG95907 - 23/12/2019
      sCampos := copy(sCampos,1,length(sCampos)-2);
      sSql := sSql + sCampos + ') Values ( ';
      iIndice2 := 0;
      // começa o tratamento dos values e inserção
      sSqlAux :=  sSql;
      For iIndice := 1 to RowCount -1 do
      begin
         For iIndice2 := 1 to ColCount -1 do
         begin
            sValues := sValues + QuotedStr(trim(StringGrid1.Cells[(iIndice2),iIndice]))+ ', ' ;
         end;
         if trim(StringGrid1.Cells[(0),(iIndice )]) <> '' then
         begin
            iNumrecebimento := LeUltRegistro(dtmAPrev.qryAux,'HSTCONTRIBPREV');
            sValues := sValues + QuotedStr(Floattostr(iNumrecebimento))+ ', 1, ';
            sValues := copy(sValues,1,length(sValues)-2);
            sValues := sValues + ', ' + sSeq; //Ewerton Beltramini - SIG95907 - 23/12/2019
            sSql := sSql + sValues + ' ) ';

            // Helen V Bianchi - WO4557 - Inicio
            fValoresperado  :=  StrToFloat(trim(StringGrid1.Cells[(6),iIndice])) ;
            if ((StrToInt(trim(StringGrid1.Cells[(11),iIndice])) = 54) or
              (StrToInt(trim(StringGrid1.Cells[(11),iIndice])) = 601)) and
            ((StrToInt(trim(StringGrid1.Cells[(7),iIndice])) = 66) or
             (StrToInt(trim(StringGrid1.Cells[(7),iIndice])) = 74)) then
            begin
                qryAux.Close;
                qryAux.SQL.Clear;
                qryAux.SQL.Add('select round(h.valorEsperado, 2) as valorEsperado, substr(MESREFERENCIA, 6,2)tst,el.matricula, h.* ');
                qryAux.SQL.Add('  from cm.hstcontribprev h , cm.ELEGPATRO EL ');
                qryAux.SQL.Add(' where h.idcontribuicao in (1, 19, 784) ');
                qryAux.SQL.Add('   and h.idplanoprev = ' + (trim(StringGrid1.Cells[(7),iIndice])));
                qryAux.SQL.Add('   and h.idpessoa = ' + (trim(StringGrid1.Cells[(4),iIndice])));
                qryAux.SQL.Add('   AND h.FLGDEVOLUCAO = 0 ');
                qryAux.SQL.Add('   AND substr(MESREFERENCIA, 6,2) <> ' + '''13''');
                qryAux.SQL.Add('   AND h.idpessoa = EL.IDPESSOA ');
                qryAux.SQL.Add('  order by h.MESREFERENCIA DESC ');


                qryAux.Open;
                sMatricula := qryAux.FieldByName('matricula').asString;
                if fValoresperado < qryAux.FieldByName('valorEsperado').AsFloat then
                begin
                    sNaoEnviados := sNaoEnviados +
                                  //  ' Matricula : ' + (trim(StringGrid1.Cells[4, iIndice])) +
                                    ' Matricula : ' + qryAux.FieldByName('matricula').asString +
                                    ' - Plano Previdenciário : ' + (trim(StringGrid1.Cells[7, iIndice]))+ #13#10#13#10;
                end
                else
                begin
                   qryAux.Close;
                   qryAux.SQL.Clear;
                   qryAux.SQL.Add('select CPP.IDPLANOPREV, CPP.IDCONTRIBUICAO,CPP.IDPESSOA ,CPP.IDPESSJUR,CPP.SEQPROPOSTA  ');
                   qryAux.SQL.Add('  from  CONTRIBPREVPARTP CPP '   );
                   qryAux.SQL.Add(' where CPP.IDCONTRIBUICAO = '+ (trim(StringGrid1.Cells[(11),iIndice])));
                   qryAux.SQL.Add('   AND CPP.idpessoa =   '+ (trim(StringGrid1.Cells[(4),iIndice])));
                   qryAux.SQL.Add('   AND CPP.IDPESSJUR =  '+ (trim(StringGrid1.Cells[(50),iIndice])));
                   qryAux.SQL.Add('   AND CPP.SEQPROPOSTA = 1 ' );
                   qryAux.Open;
                   If  qryAux.IsEmpty Then
                   begin
                      sNaoEnviados := sNaoEnviados +
                                    ' Contribuição: ' +  (trim(StringGrid1.Cells[(11),iIndice]))  +
                                    ' não cadastrada nas opções de Contribuições do Participante: '+
                                    ' Matricula : ' + sMatricula +
                                    ' - Plano Previdenciário : ' + (trim(StringGrid1.Cells[7, iIndice]))+ #13#10#13#10;
                   end
                   else
                   begin
                      qryaux.Close;
                      qryaux.Sql.Clear;
                      qryaux.Sql.Add(sSql);
                      qryaux.ExecSQL;
                   end
                end;
            end
            else
            begin
                qryaux.Close;
                qryaux.Sql.Clear;
                qryaux.Sql.Add(sSql);
                qryaux.ExecSQL;
            end;

          //  qryaux.Close;
          //  qryaux.Sql.Clear;
          //  qryaux.Sql.Add(sSql);
          //if not dtmBaseDados.dbBaseDados.inTransaction then //SIG91445
         //   dtmBaseDados.dbBaseDados.StartTransaction;      //SIG91445

         //qryaux.ExecSQL;
          // Helen V Bianchi - WO4557 - Fim
         end
         else
         begin
         //   dtmBaseDados.dbBaseDados.commit; //SIG91445
            exit;
         end;
         sSql := sSqlAux ; //na aux tem o inicio da sql até o Values "(" que é o start
         sValues := '';  // zera os values para começar a incluir novamente
//                 DM.ExecutaComando('STP_INSERE_TB_TABELAS_ANALISE ' +
//                                                        QuotedStr(Cells[0, iIndice]) + ',' +                                      //Coluna 1 do StringGrid
 //                                                       QuotedStr(Cells[1, iIndice]), DM.qryDBNegocio);  //Coluna 2 do StringGrid
      end;
   end;

end;

function TfrmCadHstContribuicao.XlsToStringGrid(AGrid: TStringGrid; AXLSFile: string): Boolean;
const
  xlCellTypeLastCell = $0000000B;
var
  XLApp, Sheet: OLEVariant;
  RangeMatrix: Variant;
  x, y, k, r: Integer;

  // Thiago Melo SOL 205293 Kintana 1985760
  ultimaLinha : Boolean;
  t : Integer;
  CellValue : ShortString;
  // Thiago Melo SOL 205293 Kintana 1985760
begin
  Result:=False;
  ultimaLinha := False; // Thiago Melo SOL 205293 Kintana 1985760

  //Cria Excel- OLE Object
  XLApp:=CreateOleObject('Excel.Application');
  try
    //Esconde Excel
    XLApp.Visible:=False;
    //Abre o Workbook
    XLApp.Workbooks.Open(AXLSFile);
    Sheet:=XLApp.Workbooks[ExtractFileName(AXLSFile)].WorkSheets[1];
    Sheet.Cells.SpecialCells(xlCellTypeLastCell, EmptyParam).Activate;

    //Pegar o número da última linha
    // Thiago Melo SOL 205293 Kintana 1985760
    t := 1;
    while not ultimaLinha do begin
      CellValue := XLApp.WorkBooks[1].Sheets[1].Cells[t, 1];
      if Trim(CellValue) = '' then begin
        ultimaLinha := True;
      end
      else begin
        Inc(t);
      end;
    end;
    //x:=XLApp.ActiveCell.Row;
    Dec(t);
    x:=t;
    // Thiago Melo SOL 205293 Kintana 1985760

    //Pegar o número da última coluna
    y:=XLApp.ActiveCell.Column;
    //Seta Stringgrid linha e coluna
    AGrid.RowCount:=x;
    AGrid.ColCount:=y;
    //Associaca a variant WorkSheet com a variant do Delphi
    RangeMatrix:=XLApp.Range['A1', XLApp.Cells.Item[X, Y]].Value;
    //Cria o loop para listar os registros no TStringGrid
    k:=1;
    repeat
      for r:=1 to y do
        AGrid.Cells[(r - 1),(k - 1)]:=RangeMatrix[K, R];
      Inc(k,1);
    until k > x;
    RangeMatrix:=Unassigned;
  finally
    //Fecha o Excel
    if not VarIsEmpty(XLApp) then
    begin
      XLApp.Quit;
      XLAPP:=Unassigned;
      Sheet:=Unassigned;
      Result:=True;
    end;
  end;
end;

procedure TfrmCadHstContribuicao.CmeCadastroFind(Sender: TObject);
begin

  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '')
  then begin
     qry.Close;
     qry.ParamByName('IdPessJur').Value      := StrToInt(MontaSelect.ValoresChave[0]);
     qry.ParamByName('IdPlanoPrev').Value    := StrToInt(MontaSelect.ValoresChave[1]);
     qry.ParamByName('IdPessoa').Value       := StrToInt(MontaSelect.ValoresChave[2]);
     qry.ParamByName('SeqProposta').Value    := StrToInt(MontaSelect.ValoresChave[3]);
     qry.ParamByName('IdContribuicao').Value := StrToInt(MontaSelect.ValoresChave[4]);
     qry.Open;

     qryDet.Close;
     qryDet.ParamByName('IdPessJur').Value      := StrToInt(MontaSelect.ValoresChave[0]);
     qryDet.ParamByName('IdPlanoPrev').Value    := StrToInt(MontaSelect.ValoresChave[1]);
     qryDet.ParamByName('IdPessoa').Value       := StrToInt(MontaSelect.ValoresChave[2]);
     qryDet.ParamByName('SeqProposta').Value    := StrToInt(MontaSelect.ValoresChave[3]);
     qryDet.ParamByName('IdContribuicao').Value := StrToInt(MontaSelect.ValoresChave[4]);
     qryDet.ParamByName('IdTitular').Value      := StrToInt(MontaSelect.ValoresChave[2]);// Andre Imakawa - SIG 47372
     qryDet.Open;

     btnImporta.Enabled    := true;
     btnInverte.Enabled    := true;
     btnMarcaTodas.Enabled := true;

  end;
end;

procedure TfrmCadHstContribuicao.CmeDetalheInsert(Sender: TObject);
begin
  inherited;


  edAnoRef.Text                                   := '';
  edMesRef.Text                                   := '';
  edAnoCob.Text                                   := '';
  edMesCob.Text                                   := '';
  edAnoDIRF.Text                                  := '';

  cboTipoRecurso.Text                             := 'PRÓPRIO'; //Renato Visoni SOL 101115 \	Kintana 448902
  EdOrigemRecurso.Text                            := ''; //Renato Visoni SOL 101115 \	Kintana 448902

  dbrgrpSitRecebimento.ItemIndex                  :=  0;
  dbrgrpForma.ItemIndex                           := -1;
  rdgrpatrasodevol.ItemIndex                      := -1;
  qryDet.FieldByName('SITRECEBIMENTO').Value      :=  0;
  qryDet.FieldByName('FLGDESCFOLHA').Value        :=  1;
  qryDet.FieldByName('VALORESPERADO').AsFloat     :=  0;
  qryDet.FieldByName('VALORRECEBIDO').AsFloat     :=  0;
  qryDet.FieldByName('DATAPREVISAORECE').AsString := '';
  qryDet.FieldByName('DATARECEBIMENTO').AsString  := '';
  qryDet.FieldByName('FLGDEVOLUCAO').Value        :=  0;
  qryDet.FieldByName('FLGMANUAL').Value           :=  1;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT CODPORTFORMA');
  qryAux.SQL.Add('FROM CONTRIBPREVPARTP');
  qryAux.SQL.Add('WHERE IDPESSOA       = '+MontaSelect.ValoresChave[2]);
  qryAux.SQL.Add('  AND IDPESSJUR      = '+MontaSelect.ValoresChave[0]);
  qryAux.SQL.Add('  AND IDPLANOPREV    = '+MontaSelect.ValoresChave[1]);
  qryAux.SQL.Add('  AND SEQPROPOSTA    = '+MontaSelect.ValoresChave[3]);
  qryAux.SQL.Add('  AND IDCONTRIBUICAO = '+MontaSelect.ValoresChave[4]);

  qryAux.Open;

  If Not qryAux.IsEmpty
    Then qryDet.FieldByName('CODPORTFORMA').AsInteger := qryAux.FieldByName('CODPORTFORMA').AsInteger;

  memobs.visible := false;
end;



procedure TfrmCadHstContribuicao.CmeDetalheEdit(Sender: TObject);
var
  fValor, fValorEntrado: Extended; //WO4557 - Helen V Bianchi
begin
  inherited;

  edAnoRef.Text  := Copy(qryDet.FieldByName('MesReferencia').AsString,1,4);
  edMesRef.Text  := Copy(qryDet.FieldByName('MesReferencia').AsString,6,2);
  edAnoCob.Text  := Copy(qryDet.FieldByName('MesCobranca').AsString,1,4);
  edMesCob.Text  := Copy(qryDet.FieldByName('MesCobranca').AsString,6,2);
  edAnoDIRF.Text := qryDet.FieldByName('ANODIRF').AsString;

  //Renato Visoni SOL 101115 \	Kintana 448902
  cboTipoRecurso.LookupValue := qryDet.FieldByName('IDTIPORECURSO').AsString;
  EdOrigemRecurso.Text       := qryDet.FieldByName('ORIGEMRECURSO').AsString;

  if qryDet.FieldByName('IDTIPORECURSO').AsString <> '' then begin
    QryTipoRecurso.Locate('idtipoRecurso',(qryDet.FieldByName('IDTIPORECURSO').AsString),[]);
    cboTipoRecurso.Text := QryTipoRecurso.FieldByname('NOME').asstring;
  end else begin
    cboTipoRecurso.Text :='';
  end;
  //Renato Visoni SOL 101115 \	Kintana 448902

  memobs.visible := false;

  ValidaVlEsperado();  //WO4557 - Helen V Bianchi

end; // CmeDetalhe.Edit(Self)

procedure TfrmCadHstContribuicao.CmeCadastroConfirma(Sender: TObject);
begin
   inherited;
   try
      If qryDet.FieldByName('FLGALTERADO').AsFloat <> 1 then
         AplicaAlteracoes([qryDet]);

    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;
   except
      raise;
   end;
end;



procedure TfrmCadHstContribuicao.sbtnInserirClick(Sender: TObject);
begin
  MsgDlg('Esta tela NÃO permite a inclusão de contribuições no histórico. ','Atenção',mterror,[mbOK],0);
  sbtnInserir.Down := False;
  Abort;

  inherited;
end;

procedure TfrmCadHstContribuicao.sbtnApagarClick(Sender: TObject);
begin
  MsgDlg('Esta tela permite apenas a exclusão de linhas do histórico. Utilize o botão "Alterar". ','Atenção',mterror,[mbOK],0);
  sbtnApagar.Down := False;
  Abort;
  inherited;

end;

procedure TfrmCadHstContribuicao.FormActivate(Sender: TObject);
begin
  inherited;

  qry.Close;
  qry.ParamByName('IdPessJur').Value      := 0;
  qry.ParamByName('IdPlanoPrev').Value    := 0;
  qry.ParamByName('IdPessoa').Value       := 0;
  qry.ParamByName('SeqProposta').Value    := 0;
  qry.ParamByName('IdContribuicao').Value := 0;
  qry.Open;

  qryDet.Close;
  qryDet.ParamByName('IdPessJur').Value      := 0;
  qryDet.ParamByName('IdPlanoPrev').Value    := 0;
  qryDet.ParamByName('IdPessoa').Value       := 0;
  qryDet.ParamByName('SeqProposta').Value    := 0;
  qryDet.ParamByName('IdContribuicao').Value := 0;
  qryDet.ParamByName('IdTitular').Value      := 0; // Andre Imakawa - SIG 47372
  qryDet.Open;

  qryMotivo.Close;
  qryMotivo.Open;

  qryLote.Close;
  qryLote.ParamByName('MESREFERENCIA').AsString := Copy(DateToStr(date),7,4)+'/'+Copy(DateToStr(date),4,2);
  qryLote.Open;

  qryPortadorForma.Close;
  qryPortadorForma.Open;

  QryExcluirArquivo.Close;             //Ewerton Beltramini - SIG95907 - 23/12/2019
   //if  (sIdGrupo <> '822')   Rafael  - Erro ao entrar na tela quando a pessoa não estava vinculado ao grupo
   if  (sIdGrupo <> '822') and (sIdGrupo<>'') then
     QryExcluirArquivo.SQL[4] := 'and ih.idusuario in  (select gg.idusuario from GrupoUsu gg where gg.idgrupo = ' + sIdGrupo+ ')';
  QryExcluirArquivo.Open;              //Ewerton Beltramini - SIG95907 - 23/12/2019

end;



procedure TfrmCadHstContribuicao.qryDetBeforePost(DataSet: TDataSet);
var ssql : String;
begin
   if (qryDet.FieldByName('SITRECEBIMENTO').AsInteger = 0) or (qryDet.FieldByName('SITRECEBIMENTO').AsInteger = 8) then  // SOL 180156 Kintana 1668852
      qryDet.FieldByName('DATAEMISSCOB').AsDatetime := 0 // SOL 180156 Kintana 1668852
   else if (qryDet.FieldByName('SITRECEBIMENTO').AsInteger = 1) or (qryDet.FieldByName('SITRECEBIMENTO').AsInteger = 2) then //SOL 180156 Kintana 1668852
      qryDet.FieldByName('DATAEMISSCOB').AsDatetime := Date; // SOL 180156 Kintana 1668852


    If (edAnoRef.Text = '') Or
       (edMesRef.Text = '') Or
       (edAnoCob.Text = '') Or
       (edMesCob.Text = '')
    Then Begin
      MsgDlg('Mês de Cobrança ou Referência não preenchido.Verifique. ','Atenção',mterror,[mbOK],0);
      Abort;
    End;

    if (dblkpcmbMotivo.Text = '')
    then begin
      MsgDlg('Motivo não preenchido. Verifique.','Informação',mtError,[mbOK],0);
      Abort;
    end;

    //1.não deixar que data de recebimento e valor recebido possam ser informados com divergência. Se existrir um,
    //o ourtro tb deve ser infromado
    if (dbedRecebido.text <> '' ) and (qryDet.FieldByName('FLGIMPORTADO').Asinteger <= 0) then
    begin
       if (strtofloat(dbedRecebido.text) > 0) and (dbdtRecebimento.text = '') then
       begin
          MsgDlg('O valor recebido foi preenchido, porém, a data de recebimento não foi informada. Verifique.','Informação',mtError,[mbOK],0);
          Abort;
       end
       else if (strtofloat(dbedRecebido.text) = 0) and (dbdtRecebimento.text <> '') then
       begin
          MsgDlg('A data de recebimento foi informada, porém, o valor recebido não. Verifique.','Informação',mtError,[mbOK],0);
          Abort;
       end;
    end;


    //2. não deixar que a situação da contribuição fique divergente das infromações de recebimento
    if (dbdtRecebimento.text <> '') and (dbrgrpSitRecebimento.itemindex < 2) then
    begin
       MsgDlg('O recebimento foi informado, porém, a situação da contribuição não se refere a uma contribuição recebida. Verifique.','Informação',mtError,[mbOK],0);
       Abort;
    end
    else if (dbdtRecebimento.text = '') and (dbrgrpSitRecebimento.itemindex > 1) then
    begin
       MsgDlg('A situação da contribuição foi informada como recebida, porém, não existem data ou valor do recebimento. Verifique.','Informação',mtError,[mbOK],0);
       Abort;
    end;


    //3. alterar situação dos alteradores confSorme recebimento
    sSQL := ' UPDATE HSTATRASOCONTRIB SET VALORRECEBIDO = DECODE('''+trim(dbdtRecebimento.text)+''','''', NULL, VALOR) , DATARECEBIMENTO = TO_DATE('''+dbdtRecebimento.text+''',''DD/MM/YYYY'') '+
            ' WHERE NUMRECEBIMENTO = '+qryDet.FieldByName('NUMRECEBIMENTO').AsString;
    ExecutarQuery(dtmAPrev.qryAux, sSQL);

    //Ewerton Beltramini - 19/07/2020 - SIG 61677 - Inicio... (66,74)
    if (qryDet.FieldByName('IDPLANPREVCONTAB').AsInteger = 66) or
       (qryDet.FieldByName('IDPLANPREVCONTAB').AsInteger = 74) then
    begin
        if (qryDetSALCONTRIB.AsFloat <=0 ) or (qryDetVALOROP1.AsFloat <= 0 ) then
        begin
              MsgDlg( 'O Salário e o Percentual de Contribuição, ' + #13 + 'são de preenchimento obrigatório para o plano selecionado.',
                      'Informação', mtWarning, [mbOK], 0);
              Abort;
        end;
    end;
   //Ewerton Beltramini - 19/07/2020 - SIG 61677 - Fim.


  inherited;

  if qryDet.State = dsInsert
  then begin
     qryDet.FieldByName('NumRecebimento').AsInteger := LeUltRegistro(dtmAPrev.qryAux,'HSTCONTRIBPREV');
     qryDet.FieldByName('IdPessJur').AsInteger      := qry.FieldByName('IdPessJur').AsInteger;
     qryDet.FieldByName('IdPlanoPrev').AsInteger    := qry.FieldByName('IdPlanoPrev').AsInteger;
     qryDet.FieldByName('IdPessoa').AsInteger       := qry.FieldByName('IdPessoa').AsInteger;
     qryDet.FieldByName('IdContribuicao').AsInteger := qry.FieldByName('IdContribuicao').AsInteger;
     qryDet.FieldByName('SeqProposta').AsInteger    := qry.FieldByName('SeqProposta').AsInteger;
     qryDet.FieldByName('ValorOp1').AsFloat         := qry.FieldByName('ValorBase1').AsFloat;
     qryDet.FieldByName('ValorOp2').AsFloat         := qry.FieldByName('ValorBase2').AsFloat;
     qryDet.FieldByName('ValorOp3').AsFloat         := qry.FieldByName('ValorBase3').AsFloat;

     // Andre Imakawa - SIG 46976 - Inicio
     //qryDet.FieldByName('Idtitular').asString       := RetornaIdTitular(qry.FieldByName('IdPessoa').AsString , qry.FieldByName('IdPlanoPrev').AsString); //Ádler Souza - SOL 108902
     qryDet.FieldByName('Idtitular').Asinteger      := StrToInt(MontaSelect.ValoresChave[2]);
     // Andre Imakawa - SIG 46976 - Fim

     //qryDet.FieldByName('IDPLANPREVCONTAB').AsFloat := qry.FieldByName('IDPLANOPREV').AsFloat;
     qryDet.FieldByName('NOMEPLANO').AsString := edtPlanoContabil.Text;      //Higor Nayde  SOL 162126*RE01 KINTANA 792563
   end;

  qryDet.FieldByName('FlgDivergente').AsInteger     := 0;
  qryDet.FieldByName('FlgConcessao').AsInteger      := 0;
  qryDet.FieldByName('FlgEvento').AsInteger         := 0;
  qryDet.FieldByName('FlgCalcReserva').AsInteger    := 0;
  qryDet.FieldByName('FlgAporte').AsInteger         := 0;

  If qry.FieldByName('FlgInterno').AsString = 'CA'
   Then qryDet.FieldByName('FlgSitFundacao').AsString     := BuscaSitAnterior(qry.FieldByName('IDPESSJUR').AsString,
                                                                              qry.FieldByName('IDPLANOPREV').AsString,
                                                                              qry.FieldByName('IDPESSOA').AsString,
                                                                              qry.FieldByName('SEQPROPOSTA').AsString)

   Else qryDet.FieldByName('FlgSitFundacao').AsString     := qry.FieldByName('FlgInterno').AsString;


  qryDet.FieldByName('MesReferencia').AsString      := Trim(edAnoRef.Text)+'/'+Trim(edMesRef.Text);
  qryDet.FieldByName('MesCobranca').AsString        := Trim(edAnoCob.Text)+'/'+Trim(edMesCob.Text);
  qryDet.FieldByName('AnoDIRF').AsString            := Trim(edAnoDIRF.Text);
  qryDet.FieldByName('DataInicio').AsString         := qry.FieldByName('DataInicio').AsString;
  qryDet.FieldByName('DataFinal').AsString          := qry.FieldByName('DataFinal').AsString;
  qryDet.FieldByName('IdRegraCalculo').AsString     := qry.FieldByName('IdRegraCalculo').AsString;
  qryDet.FieldByName('Tipo').AsString               := 'F';
  qryDet.FieldByName('Descricao').AsString          := qryMotivo.FieldByName('DESCRICAO').AsString;
  qryDet.FieldByName('VALORCALCULADO').AsFloat      := qryDet.FieldbyName('VALORESPERADO').AsFloat;

  qryDet.FieldByName('ORIGEMRECURSO').AsString      := EdOrigemRecurso.Text;       //Renato Visoni SOL 101115 \	Kintana 448902
  qryDet.FieldByName('IDTIPORECURSO').AsString      := cboTipoRecurso.LookupValue; //Renato Visoni SOL 101115 \	Kintana 448902

  If Trim(dblgCodPortForma.Text) = ''
  Then qryDet.FieldByName('CODPORTFORMA').Value := Null;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT CODPORTFORMA');
  qryAux.SQL.Add('FROM CONTRIBPREVPARTP');
  qryAux.SQL.Add('WHERE IDPESSOA       = '+qry.FieldByName('IDPESSOA').AsString);
  qryAux.SQL.Add('  AND IDPESSJUR      = '+qry.FieldByName('IDPESSJUR').AsString);
  qryAux.SQL.Add('  AND IDPLANOPREV    = '+qry.FieldByName('IDPLANOPREV').AsString);
  qryAux.SQL.Add('  AND SEQPROPOSTA    = '+qry.FieldByName('SEQPROPOSTA').AsString);
  qryAux.SQL.Add('  AND IDCONTRIBUICAO = '+qry.FieldByName('IDCONTRIBUICAO').AsString);

  qryAux.Open;

  If (qryAux.FieldByName('CODPORTFORMA').AsInteger <> qryDet.FieldByName('CODPORTFORMA').AsInteger)
   Then qryDet.FieldByName('FLGMANUAL').AsInteger := 2
   Else qryDet.FieldByName('FLGMANUAL').AsFloat   := 1;

  If (UpperCase(qry.FieldByName('FlgInterno').AsString) = 'AS') and
     (qryDet.FieldByName('FOLHAORIGEM').AsString <> 'B')
   Then
    If MsgDlg('ATENÇÃO !'+#13+#10+
              'A situação do participante obriga a forma de cobrança para a'+#13+#10+
              'FOLHA DE BENEFÍCIOS. '+#13+#10+''+#13+#10+
              'Deseja realmente mudar esta opção ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo
     Then qryDet.FieldByName('FOLHAORIGEM').AsString := 'B';


  if dbrgrpForma.itemindex = 0 then
    qryDet.FieldByName('FLGDESCFOLHA').AsInteger := 1
  else if dbrgrpForma.itemindex = 1 then
    qryDet.FieldByName('FLGDESCFOLHA').AsInteger := 1
  else if dbrgrpForma.itemindex = 2 then
    qryDet.FieldByName('FLGDESCFOLHA').AsInteger := 0;

  if qryDet.State = dsEdit
  then begin

     qryDet.FieldByName('FLGALTERADO').AsFloat      := 1;

     dtmAPrev.qryAux.Close;
     dtmAPrev.qryAux.sql.Text :=  ' UPDATE TMPDESC SET  '+
                                ' VALOR = '+oranumero(qryDet.FieldbyName('VALORESPERADO').AsString)+',  '+
                                ' VALORRECEBIDO = '+oranumero(qryDet.FieldbyName('VALORRECEBIDO').AsString)+'  '+
                                ' WHERE MESREFERENCIA = '''+qryDet.FieldByName('MESREFERENCIA').AsString+''' '+
                                ' AND MESCOBRANCA = '''+qryDet.FieldByName('MESCOBRANCA').AsString+''' '+
                                ' AND IDPESSJUR = '+qryDet.FieldByName('IDPESSJUR').AsString+' '+
                                ' AND IDPLANOPREV = '+qryDet.FieldByName('IDPLANOPREV').AsString+' '+
                                ' AND IDPESSOA = '+qryDet.FieldByName('IDPESSOA').AsString+' '+
                                ' AND IDDESCONTO = '+qryDet.FieldByName('IDCONTRIBUICAO').AsString+' '+
                                ' AND NUMRECEBIMENTO = ' +qryDet.FieldByName('NUMRECEBIMENTO').AsString+' ' + // Andre Imakawa - SIG 90194
                                ' AND NVL(SITENVIO,''0'') = ''0'' ';
     dtmAPrev.qryAux.ExecSql;


  end;
  //WO4557 - Inicio - Helen V Bianchi
  if (bObrigaObservacao) and (trim(memobs.Text) = '') then
  begin
    MsgDlg('ATENÇÃO !'+#13+#10+
           'Valor esperado da Facultativa está menor que o último valor registrado da Normal Participante.'+#13+#10+
           'Deste modo, é obrigatório o preenchimento da justificativa no campo "Observação".', 'Aviso', mtInformation, [mbOk], 0);
    memobs.MaxLength := 150;
    if memobs.CanFocus then
      memobs.SetFocus;

    Abort;
  end
  else
  begin
     if (bObrigaObservacao) and (trim(memobs.Text) <> '') then
         qryDet.FieldByName('OBSERVACAO').AsString := memobs.Text;
  end;
  //WO4557 - Fim - Helen V Bianchi
end;

procedure TfrmCadHstContribuicao.sbtnAltDetClick(Sender: TObject);
begin
  vMesCobraca        := Trim(qryDet.FieldByName('MESCOBRANCA').AsString);
  vMesReferencia     := Trim(qryDet.FieldByName('MESREFERENCIA').AsString);
  vMotivo            := Trim(qryDet.FieldByName('IDMOTIVO').AsString);
  vNumeroRecebimento := Trim(qryDet.FieldByName('NumRecebimento').AsString);
  //vCodAlterador      := Trim(qryDet.FieldByName('CODALTERADOR'  ).AsString);

  If (qryDet.FieldByName('SITRECEBIMENTO').AsInteger > 0) And
     (ExisteNaTmpDesc(qryDet)) And
     (Not PermiteAlteracaoPorExcecao(qry.FieldByName('IDPESSJUR').AsInteger, 'C')) Then
  Begin
     bErroValidacao := true;
     MsgDlg('Esta contribuição já foi cobrada, não podendo mais ser alterada.','Atenção',mtError,[mbOK],0);
     Exit;
  End;

  if qryDet.FieldByName('FlgCalcReserva').AsInteger = 1
  then begin
     bErroValidacao := true;
     MsgDlg('Esta contribuição já foi alimentada na reserva do participante e não pode ser alterada. '+#13+
            'Caso seja necessário, utilize a opção de "Estorno" no Controle Individual de Contribuição para '+
            'retirá-la da reserva.','Atenção',mtError,[mbOK],0);
     Exit;
  end;

  if (trim(qryDet.FieldByName('CODDOCUMENTOPREV').AsString) <> '')  and (qryDet.FieldByName('FLGIMPORTADO').Asinteger <= 0)
  then begin
     bErroValidacao := true;
     MsgDlg('Esta contribuição já foi enviada para o sistema de Contas e Receber não podendo ser alterada. '+#13+
            'Caso seja necessário, utilize a opção de "Cancelar" no Controle Individual de Contribuição para '+#13+
            'desfazer o envio.','Atenção',mtError,[mbOK],0);
     Exit;
  end;

  //se chegou neste ponto, é porque, possivelmente, a contrib. foi enviada para a PREVIA
  //e ainda não sofreu ataulização na TMPDESC(SITENVIO = 1), já que só a efetivação marca o sitenvio.
  //Caso o usuário faça alguma modificação em registro existente na PREVIA, avisar e dexar alterar, deletando a PREVIA.
  if trim(qryDet.FieldByName('FOLHAORIGEM').AsString) = 'B'
  then begin
     qryAux.close;
     qryAux.sql.Clear;
     qryAux.sql.Add(' SELECT C.FLGVOLTATMP /*+INDEX (PREVIA XIE6PREVIA) */ '+
        ' FROM PREVIA P , CTRLINTERFACE C '+
        ' WHERE P.IDTITULAR = '+inttostr(qrydet.fieldbyname('idpessoa').asinteger)+' '+
        ' AND C.IDLOTE = P.IDLOTE '+
        ' AND P.MESCOBRANCA = '''+qrydet.fieldbyname('mescobranca').asString+''' ');

      if qrydet.fieldbyname('IDLOTE').asString <> '' then
         qryAux.sql.Add(' AND P.IDLOTE = '''+qrydet.fieldbyname('IDLOTE').asString+''' ');

      qryAux.Open;


      //achou prévia
      if (not qryaux.isempty) and
         (qrydet.fieldbyname('IDLOTE').asString <> EmptyStr)   //SIG85321
      then
      begin
         //a prévia já foi "paga"
         if qryaux.fieldbyname('FLGVOLTATMP').AsString = '1' then
         begin
            bErroValidacao := true;
            MsgDlg('Esta contribuição já foi processada pela Folha de benefícios, e não pode ser modificada.','Atenção',mtWarning ,[mbOK],0);
            bbtnCancelarClick(self);
            Exit;
         end
         //a prévia ainda pode ser refeita
         else
         begin
            bErroValidacao := true;
            if MsgDlg('Esta contribuição já foi enviada para a Folha de benefícios, porém, ainda '+
                   'não foi processada. Deseja modificar a contribuição e apagar a Prévia?',
                   'Atenção',mtConfirmation,[mbNo, mbYes],0) = mrYes then
            begin
               qryAux.close;
               qryAux.sql.Clear;
               qryAux.sql.Add(' DELETE /*+INDEX (PREVIA XIE6PREVIA) */ '+
                  ' FROM PREVIA P  '+
                  ' WHERE P.IDTITULAR = '+inttostr(qrydet.fieldbyname('IDPESSOA').asinteger)+' '+
                  ' AND EXISTS (SELECT 1 '+
                  '            FROM CTRLINTERFACE C '+
                  '            WHERE C.IDLOTE = P.IDLOTE '+
                  '            AND C.FLGVOLTATMP = 0) '+
                  ' AND P.MESCOBRANCA = '''+qrydet.fieldbyname('MESCOBRANCA').AsString+''' ');

                if qrydet.fieldbyname('IDLOTE').asString <> '' then
                   qryAux.sql.Add(' AND P.IDLOTE = '''+qrydet.fieldbyname('IDLOTE').asString+''' ');

                qryAux.ExecSql;
            end
            else
            begin
               bbtnCancelarClick(self);
               Exit;
            end;
         end;
      end;

  end;
  inherited;
  flg_Movimentacao := 2;
end;



procedure TfrmCadHstContribuicao.sbtnExcluiDetClick(Sender: TObject);
Var
  sSQL:String;
begin

  if ExisteNaTmpDesc(qryDet) then
  begin
     MsgDlg('Esta contribuição já foi cobrada, não podendo mais ser excluída.','Atenção',mtError,[mbOK],0);
     Exit;
  end;

  if qryDet.FieldByName('FlgCalcReserva').AsInteger = 1
  then begin
     MsgDlg('Esta contribuição já foi alimentada na reserva do participante e não pode ser excluída. '+#13+
            'Caso seja necessário, utilize a opção de "Estorno" no Controle Individual de Contribuição para '+
            'retirá-la da reserva.','Atenção',mtError,[mbOK],0);
     Exit;
  end;

  if (trim(qryDet.FieldByName('CODDOCUMENTOPREV').AsString) <> '')   and (qryDet.FieldByName('FLGIMPORTADO').Asinteger <= 0)
  then begin
     MsgDlg('Esta contribuição já foi enviada para o sistema de Contas e Receber não podendo ser excluída. '+#13+
            'Caso seja necessário, utilize a opção de "Cancelar" no Controle Individual de Contribuição para '+#13+
            'desfazer o envio.','Atenção',mtError,[mbOK],0);
     Exit;
  end;

  if qryDet.FieldByName('SitRecebimento').AsInteger = 1 // enviada e não recebida
  then begin
     if MsgDlg('Esta contribuição já foi enviada para cobrança. Deseja excluí-la ? . ','Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrNo
     then Exit;
  end;


  //se chegou neste ponto, é porque, possivelmente, a contrib. foi enviada para a PREVIA
  //e ainda não sofreu ataulização na TMPDESC(SITENVIO = 1), já que só a efetivação marca o sitenvio.
  //Caso o usuário faça alguma modificação em registro existente na PREVIA, avisar e dexar alterar, deletando a PREVIA.
  if trim(qryDet.FieldByName('FOLHAORIGEM').AsString) = 'B'
  then begin
     qryAux.close;
     qryAux.sql.Clear;
     qryAux.sql.Add(' SELECT C.FLGVOLTATMP /*+INDEX (PREVIA XIE6PREVIA) */ '+
        ' FROM PREVIA P , CTRLINTERFACE C '+
        ' WHERE P.IDTITULAR = '+inttostr(qrydet.fieldbyname('idpessoa').asinteger)+' '+
        ' AND C.IDLOTE = P.IDLOTE '+
        ' AND P.MESCOBRANCA = '''+qrydet.fieldbyname('mescobranca').asString+''' ');

      if qrydet.fieldbyname('IDLOTE').asString <> '' then
         qryAux.sql.Add(' AND P.IDLOTE = '''+qrydet.fieldbyname('IDLOTE').asString+''' ');

      qryAux.Open;


      //achou prévia
      if (not qryaux.isempty) then
      begin
         //a prévia já foi "paga"
         if qryaux.fieldbyname('FLGVOLTATMP').AsString = '1' then
         begin
            MsgDlg('Esta contribuição já foi processada pela Folha de benefícios, e não pode ser modificada.','Atenção',mtWarning ,[mbOK],0);
            bbtnCancelarClick(self);
            Exit;
         end
         //a prévia ainda pode ser refeita
         else
         begin
            if MsgDlg('Esta contribuição já foi enviada para a Folha de benefícios, porém, ainda '+
                   'não foi processada. Deseja modificar a contribuição e apagar a Prévia?',
                   'Atenção',mtConfirmation,[mbNo, mbYes],0) = mrYes then
            begin
               qryAux.close;
               qryAux.sql.Clear;
               qryAux.sql.Add(' DELETE /*+INDEX (PREVIA XIE6PREVIA) */ '+
                  ' FROM PREVIA P  '+
                  ' WHERE P.IDTITULAR = '+inttostr(qrydet.fieldbyname('IDPESSOA').asinteger)+' '+
                  ' AND EXISTS (SELECT 1 '+
                  '            FROM CTRLINTERFACE C '+
                  '            WHERE C.IDLOTE = P.IDLOTE '+
                  '            AND C.FLGVOLTATMP = 0) '+
                  ' AND P.MESCOBRANCA = '''+qrydet.fieldbyname('MESCOBRANCA').AsString+''' ');

                if qrydet.fieldbyname('IDLOTE').asString <> '' then
                   qryAux.sql.Add(' AND P.IDLOTE = '''+qrydet.fieldbyname('IDLOTE').asString+''') ');

                qryAux.ExecSql;
            end
            else
            begin
               bbtnCancelarClick(self);
               Exit;
            end;
         end;
      end;

  end;


  { Excluir HSTATRASOCONTRIB }
  sSQL := 'DELETE FROM HSTATRASOCONTRIB WHERE NUMRECEBIMENTO = '+
          qryDet.FieldByName('NUMRECEBIMENTO').AsString;
  ExecutarQuery(dtmAPrev.qryAux, sSQL);

  //William Moreira da Silva - SOL 263499 - PPM 1124000
  //inherited;
  //William Moreira da Silva - SOL 263499 - PPM 1124000

   if not(qryDet.IsEmpty) then
   begin
      dtmAPrev.qryAux.Close;
      dtmAPrev.qryAux.sql.Text :=
      'DELETE FROM TMPDESC '                                                                + #13 +
      'WHERE '                                                                              + #13 +
      '       MESREFERENCIA         = ' + QuotedStr(qryDetMESREFERENCIA.AsString)           + #13 +
      '   AND MESCOBRANCA           = ' + QuotedStr(qryDetMESCOBRANCA.AsString)             + #13 +
      '   AND IDPESSJUR             = ' + FormatFloat('#0', qryDetIDPESSJUR.AsInteger)      + #13 +
      '   AND IDPLANOPREV           = ' + FormatFloat('#0', qryDetIDPLANOPREV.AsInteger)    + #13 +
      '   AND IDPESSOA              = ' + FormatFloat('#0', qryDetIDPESSOA.AsInteger)       + #13 +
      '   AND IDDESCONTO            = ' + FormatFloat('#0', qryDetIDCONTRIBUICAO.AsInteger) + #13 +
      '   AND NUMRECEBIMENTO        = ' + IntToStr(qryDetNUMRECEBIMENTO.AsInteger)          + #13 + // Andre Imakawa - SIG 90194
      '   AND NVL(SITENVIO, ''0'')  = ''0'' ';

      dtmAPrev.qryAux.ExecSql;
   end;

  //William Moreira da Silva - SOL 263499 - PPM 1124000
  inherited;
  //William Moreira da Silva - SOL 263499 - PPM 1124000

end;



procedure TfrmCadHstContribuicao.dbedEsperadoExit(Sender: TObject);
begin
  inherited;
  if (dbedRecebido.datasource.dataset.state <> dsEdit)
     and (not memobs.visible) Then
     dbedRecebido.Text := dbedEsperado.Text;

  ValidaVlEsperado(); //WO4557 - Helen V Bianchi
end;
//WO4557 - Helen V Bianchi - Criação da Procedure
procedure TfrmCadHstContribuicao.ValidaVlEsperado();
var
  fValor, fValorEntrado: Extended;
begin
  if ((qry.FieldByName('IDCONTRIBUICAO').Asinteger = 54) or
      (qry.FieldByName('IDCONTRIBUICAO').Asinteger = 601)) and
     ((qry.FieldByName('IDPLANOPREV').Asinteger = 66) or
      (qry.FieldByName('IDPLANOPREV').Asinteger = 74)) then
  begin
    fValor := 0;
    fValorEntrado := 0;

    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('select round(h.valorEsperado, 2) as valorEsperado, substr(MESREFERENCIA, 6,2)tst, h.* ');
    qryAux.SQL.Add('  from cm.hstcontribprev h ');
    qryAux.SQL.Add(' where h.idcontribuicao in (1, 19, 784) ');
    qryAux.SQL.Add('   and h.idplanoprev = ' + qry.FieldByName('IDPLANOPREV').AsString);
    qryAux.SQL.Add('   and h.idpessoa = ' + qry.FieldByName('IDPESSOA').AsString);
    qryAux.SQL.Add('   AND h.FLGDEVOLUCAO = 0 ');
    qryAux.SQL.Add('   AND substr(MESREFERENCIA, 6,2) <> ' + '''13''');
    qryAux.SQL.Add('  order by h.MESREFERENCIA DESC ');
    qryAux.Open;

    fValorEntrado := StrToFloat(dbedEsperado.Text);
    fValor        := StrToFloat(qryAux.FieldByName('valorEsperado').AsString);

    if (fValorEntrado < fValor) then
    begin
        If qryDet.FieldByName('OBSERVACAO').AsString = '' then
        begin
            MsgDlg('Valor esperado da Facultativa está menor que o último valor registrado da Normal Participante.'+#13+#10+
                   'Deste modo, é obrigatório o preenchimento da justificativa no campo "Observação".',
                   'Atenção',mtInformation,[mbOk],0) ;
        end;
        bObrigaObservacao := True;
        memobs.MaxLength  := 150;
        memobs.Color      := clWindow;
        memobs.Font.Color := clBlack;
        memobs.Visible    := True;
        memobs.Text       := qryDet.FieldByName('OBSERVACAO').AsString;
    end
    else
    begin
      //Essas são as configurações atuais
      bObrigaObservacao := False;
      memobs.MaxLength  := 0;
      memobs.Color      := clActiveBorder;
      memobs.Font.Color := clRed;
      memobs.Visible    := False;
      memobs.text       := '';
      qryDet.FieldByName('OBSERVACAO').AsString := '';
      //Fim atuais
    end;
  end;
end;

procedure TfrmCadHstContribuicao.dbdtPrevisaoExit(Sender: TObject);
begin
  inherited;
  // André Pontes - Pendência 26656 - 29/11/2007
  // Retirada a linha abaixo
  // dbdtRecebimento.Text := dbdtPrevisao.Text;
end;

procedure TfrmCadHstContribuicao.grpMesAnoRefExit(Sender: TObject);
var sValorRegra,
    sDataRef,
    sSQL : string;
    bErro : boolean;
    dDiferenca : double;
begin
  inherited;

  memobs.visible := false;
  rdgrpatrasodevol.visible   := True;
  rdgrpatrasodevol.itemindex := 0;

  if not (qryDet.State = dsInsert) then Exit;

  if (Trim(edAnoRef.Text) = '') or (Trim(edMesRef.Text) = '')
  then Exit;

  if (StrToInt(edMesRef.Text) = 2)
  then sDataRef := '28/'+ Trim(edMesRef.Text)+'/'+Trim(edAnoRef.Text)
  else if edMesRef.Text = '13'
       then sDataRef := '30/12/'+Trim(edAnoRef.Text)
  else sDataRef := '30/'+Trim(edMesRef.Text)+'/'+Trim(edAnoRef.Text);

  // Calcular contribuicao e colocar como valor esperado
  sSQL := MontaSQLContribNOVA( qry.FieldByName('IdPessJur').AsInteger,
                               qry.FieldByName('IdPlanoPrev').AsInteger,
                               qry.FieldByName('IdPessoa').AsInteger,
                               qry.FieldByName('SeqProposta').AsInteger,
                               qry.FieldByName('IdContribuicao').AsInteger,
                               prmIdMotivoContrib,
                               qry.FieldByName('FlgInternoContrib').AsString,
                               Trim(edAnoRef.Text)+'/'+Trim(edMesRef.Text),
                               sDataRef,
                               '0',
                               qry.FieldByName('InscricaoData').AsString,
                               qry.FieldByName('DataNasc').AsString,
                               'N',
                               'HSTCONTRIBPREV','VALORESPERADO',
                               '0' ,
                               qry.FieldByName('IdSitPart').AsString,
                               '01/'+Trim(edMesRef.Text)+'/'+Trim(edAnoRef.Text),
                               IntToStr(TrazUltDiaMes(StrToInt(edMesRef.Text), StrToInt(edAnoRef.Text)))+'/'+Trim(edMesRef.Text)+'/'+Trim(edAnoRef.Text),
                               0,-1,Trim(edAnoRef.Text)+'/'+Trim(edMesRef.Text),-1);
  try
     if (edMesRef.Text <> '13') or (qry.FieldByName('IdRegraCalculo').AsString = '')
     then sValorRegra := RegraNumerica(qry.FieldByName('IdRegraCalculo').AsString, sSQL, bErro,iIdCalculoGeral)
     else sValorRegra := RegraNumerica(qry.FieldByName('IdRegraCalculo13').AsString, sSQL, bErro,iIdCalculoGeral);
  except
     if (edMesRef.Text <> '13') or (qry.FieldByName('IdRegraCalculo').AsString = '')
     then MsgDlg('Erro na Regra de Cálculo da Contribuição - Regra Nº '+qry.FieldByName('IdRegraCalculo').AsString,'Erro',mtError,[mbOk, mbHelp],0)
     else MsgDlg('Erro na Regra de Cálculo da Contribuição - Regra Nº '+qry.FieldByName('IdRegraCalculo13').AsString,'Erro',mtError,[mbOk, mbHelp],0);

     Exit;
  end;

  If StrToFloat(ClienteNumero(sValorRegra)) < 0
   Then Begin
     MsgDlg('Valor Inválido !! Cancele esta operação !!','Erro',mtError,[mbOk, mbHelp],0);
     Exit;
   End;

  dbedEsperado.Text := FormatFloat('#0.00',StrToFloat(ClienteNumero(sValorRegra))) ;

  //edilaine SIG104014 : inicio
  //dbdtPrevisao.Text := sDataRef;
  //qryDet.FieldByName('DATAPREVISAORECE').AsString  := sDataRef;
  //edilaine SIG104014 : fim


  qryDet.FieldByName('ValorEsperado').AsString  := ClienteNumero(sValorRegra);
  qryDet.FieldByName('ValorCalculado').AsString := ClienteNumero(sValorRegra);

  //verifica se há contribuições já recebidas neste mês
  //de referência e avisa ao usuário para auxliliar os
  //casos de acerto por motivo de mudança no valor

  dtmAPrev.qryaux.close;
  dtmAPrev.qryaux.sql.text := ' SELECT SUM(DECODE(FLGDEVOLUCAO,1,-1*NVL(VALORRECEBIDO,0),NVL(VALORRECEBIDO,0))) VALOR FROM HSTCONTRIBPREV WHERE '+
                     ' IDPESSJUR = '+IntToStr(qry.FieldByName('IdPessJur').AsInteger)+' '+
                     ' AND IDPLANOPREV =  '+IntToStr(qry.FieldByName('IdPlanoPrev').AsInteger)+' '+
                     ' AND IDPESSOA = '+IntToStr(qry.FieldByName('IdPessoa').AsInteger)+' '+
                     ' AND SEQPROPOSTA =  '+IntToStr(qry.FieldByName('SeqProposta').AsInteger)+' '+
                     ' AND IDCONTRIBUICAO =  '+IntToStr(qry.FieldByName('IdContribuicao').AsInteger)+'  '+
                     ' AND MESREFERENCIA = '''+Trim(edAnoRef.Text)+'/'+Trim(edMesRef.Text)+''' '+                 // Andre Imakawa - SIG 60728
                     ' AND NVL(IDTITULAR,IDPESSOA) = '+IntToStr(qry.FieldByName('IdTitular').AsInteger)+' '; // Andre Imakawa - SIG 60728

  try
     dtmAPrev.qryaux.open;
  except
  end;

  if not dtmAPrev.qryaux.isempty
  then
     if dtmAPrev.qryaux.fieldbyname('valor').AsFloat > 0
     then begin
        dDiferenca := StrToFloat(ClienteNumero(sValorRegra)) - dtmAPrev.qryaux.fieldbyname('valor').AsFloat;
        dDiferenca := StrToFloat(FormatFloat('#0.00',dDiferenca));
        qryDet.FieldByName('ValorEsperado').AsFloat  := Abs(dDiferenca);
        qryDet.FieldByName('ValorCalculado').AsFloat := Abs(dDiferenca);
        //WO4557 - Inicio - Helen V Bianchi
        {memobs.lines.Text := 'ATENÇÃO: Neste mês já existe R$ '+dtmAPrev.qryaux.fieldbyname('valor').AsString+' recebidos '+
                             ' desta contribuição. O valor esperado total é de R$ '+ClienteNumero(sValorRegra)+'.'+#13+
                             ' Calculado : R$'+ClienteNumero(sValorRegra)+'. Já Cobrado : R$ '+dtmAPrev.qryaux.fieldbyname('valor').AsString+
                             '. A Cobrar : R$ '+FloatToStr(dDiferenca);     }
         MsgDlg('ATENÇÃO: Neste mês já existe R$ '+dtmAPrev.qryaux.fieldbyname('valor').AsString+' recebidos '+
                ' desta contribuição. O valor esperado total é de R$ '+ClienteNumero(sValorRegra)+'.'+#13+
                ' Calculado : R$'+ClienteNumero(sValorRegra)+'. Já Cobrado : R$ '+dtmAPrev.qryaux.fieldbyname('valor').AsString+
                '. A Cobrar : R$ '+FloatToStr(dDiferenca),
                'Atenção',mtInformation,[mbOk],0) ;
        //WO4557 - Fim - Helen V Bianchi
        //trata para não mostrar valores negativos
        if dDiferenca < 0 then
        begin
           rdgrpatrasodevol.visible := true;
           rdgrpatrasodevol.itemindex := 1;
           dDiferenca := -1*dDiferenca;
        end;

        dbedEsperado.Text := FormatFloat('#0.00',dDiferenca);

        dbedRecebido.Text := '';
        memobs.visible := true;

     end;


  if not memobs.visible then
  begin
     dbedRecebido.Text  := FormatFloat('#0.00',StrToFloat(ClienteNumero(sValorRegra)));

     qryDet.FieldByName('ValorRecebido').AsString  := ClienteNumero(sValorRegra);
  end;
  //WO4557 - Inicio - Helen V Bianchi
  if StrtoFloat(dbedEsperado.text) > 0 then
     ValidaVlEsperado();
  //WO4557 - Fim - Helen V Bianchi
end;



procedure TfrmCadHstContribuicao.tbtnReceberTudoClick(Sender: TObject);
var sDiaRecebimento,
    sMesRecebimento,
    sAnoRecebimento,
    sDataRecebimento : string;

begin
  inherited;
  PedeInfAux('Informe o Dia ...','Dia (apenas o dia do mês)','',1, sDiaRecebimento);
  if Trim(sDiaRecebimento) = ''
  then Exit;

  dtmBaseDados.dbBaseDados.StartTransaction;

  Try
    With qryHistContribPrev  Do
     Begin
      Close ;
      ParamByName('IDPESSJUR').Value    := qryDet.FieldbyName('IDPESSJUR').AsInteger;
      ParamByName('IDPLANOPREV').Value  := qryDet.FieldbyName('IDPLANOPREV').AsInteger;
      ParamByName('IDPESSOA').Value     := qryDet.FieldbyName('IDPESSOA').AsInteger;
      ParamByName('SEQPROPOSTA').Value  := qryDet.FieldbyName('SEQPROPOSTA').AsInteger;
      Open;
      First;

      While Not Eof do
      begin

        If Copy(FieldbyName('MESREFERENCIA').AsString ,6,2) =  '13' Then
           sMesRecebimento :=  '12'
        else
           sMesRecebimento := Copy(FieldbyName('MESREFERENCIA').AsString ,6,2);
        sAnorecebimento    := Copy(FieldbyName('MESREFERENCIA').AsString ,1,4);
        sDataRecebimento    :=  sDiaRecebimento + '/' +sMesRecebimento + '/' +sAnorecebimento;

        qryUpdateHistContribPrev.Close;
        qryUpdateHistContribPrev.Sql.Clear;
        qryUpdateHistContribPrev.Sql.Add( ' UPDATE HSTCONTRIBPREV          '+
                                          ' SET  VALORRECEBIDO   = VALORESPERADO,   '+
                                          '      DATAEMISSCOB    = SYSDATE ,'+ // SOL 180156 Kintana 1668852
                                          '      DATARECEBIMENTO =  TO_DATE( ' + QuotedStr(sDataRecebimento) + ',''DD/MM/YYYY'' ), ' +
                                          '      SITRECEBIMENTO  = ''2'' ,         '+
                                          '      IDPLANPREVCONTAB = '+ IntToStr(QryDet.FieldbyName('IDPLANPREVCONTAB').AsInteger)  +
                                          ' WHERE                                                                           '+
                                          ' AND  IDPESSJUR =   '+ IntToStr(QryDet.FieldbyName('IDPESSJUR').AsInteger)    +
                                          ' AND  IDPLANOPREV = '+ IntToStr(QryDet.FieldbyName('IDPLANOPREV').AsInteger)  +
                                          ' AND  IDPESSOA    = '+ IntToStr(QryDet.FieldbyName('IDPESSOA').AsInteger)     +
                                          ' AND  SEQPROPOSTA = '+ IntToStr(QryDet.FieldbyName('SEQPROPOSTA').AsInteger)  +
                                          ' AND  MESREFERENCIA = '+ QuotedStr(FieldbyName('MESREFERENCIA').AsString)     +
                                          ' AND  ((VALORRECEBIDO < = 0) OR (VALORRECEBIDO IS NULL))  ');


        qryUpdateHistContribPrev.ExecSQL;

        Next;
      end;
    end;

  except
     on E:EDBEngineError do
     begin
        tbtnReceberTudo.Down := False;
        dtmBaseDados.dbBaseDados.RollBack;
        MostrarErro(E);
        Exit;
     end;
  end;

    if not GravaLogTOTALPREV ('Contribuição Recebida Manualmente - Part. '+qry.fieldbyname('nome').AsString +'Contr.'+
            copy(qry.fieldbyname('NOMECONTRIB').AsString,1,20))
     then begin
     MsgDlg('Erro ao Gravar o Log.','Erro',mtError,[mbOK],0);
     end;
  tbtnReceberTudo.Down := False;
  dtmBaseDados.dbBaseDados.Commit;
  MsgDlg('Contribuições Recebidas com Sucesso.','Informação',mtInformation,[mbOk],0);
end;

procedure TfrmCadHstContribuicao.edMesRefExit(Sender: TObject);
begin
  inherited;

  if (Trim(edAnoRef.Text)+'/'+Trim(edMesRef.Text) <>
     Trim(edAnoCob.Text)+'/'+Trim(edMesCob.Text))
     and (length(Trim(edAnoRef.Text)+'/'+Trim(edMesRef.Text)) = 7 )
     and (length(Trim(edAnoCob.Text)+'/'+Trim(edMesCob.Text)) = 7 ) then
  begin
     rdgrpatrasodevol.Visible := true;
  end
  else
     rdgrpatrasodevol.Visible := True;

  try
    if StrToInt(edMesRef.Text) < 13 then
    begin
      If ((Trim(edAnoCob.Text) <> '') And
          (Trim(edMesCob.Text) <> '')) And
          (StrToInt(Trim(edAnoRef.Text)+Trim(edMesRef.Text)) >
           StrToInt(Trim(edAnoCob.Text)+Trim(edMesCob.Text))) then
        MsgDlg(
          'O mês cobrança informado é menor que o mês referência.',
          'Informação', mtWarning, [mbOK], 0);
    end
    else
    begin
      If (StrToInt(Trim(edAnoRef.Text)) > StrToInt(Trim(edAnoCob.Text))) then
        MsgDlg(
          'O abono se refere a um ano posterior ao corrente.',
          'Informação', mtWarning, [mbOK], 0);
    end;
  except
  end;
end;



procedure TfrmCadHstContribuicao.qryDetAfterInsert(DataSet: TDataSet);
begin
  inherited;

  if (Trim(edAnoRef.Text)+'/'+Trim(edMesRef.Text) <>
     Trim(edAnoCob.Text)+'/'+Trim(edMesCob.Text))
     and (length(Trim(edAnoRef.Text)+'/'+Trim(edMesRef.Text)) = 7 )
     and (length(Trim(edAnoCob.Text)+'/'+Trim(edMesCob.Text)) = 7 ) then
  begin
     rdgrpatrasodevol.Visible := true;
     rdgrpatrasodevol.ItemIndex := 0;
     qryDet.FieldByName('flgdevolucao').AsInteger     := 0;
  end
  else
     rdgrpatrasodevol.Visible := True;
end;



function TfrmCadHstContribuicao.ExisteNaTmpDesc(qry: TwwQuery) : Boolean;
begin

   Result := False;

   dtmAPrev.qryAux.Close;
   dtmAPrev.qryAux.sql.Text :=  ' SELECT 1 FROM TMPDESC '+
                                ' WHERE MESREFERENCIA = '''+qrydet.FieldByName('MESREFERENCIA').AsString+''' '+
                                ' AND MESCOBRANCA = '''+qrydet.FieldByName('MESCOBRANCA').AsString+''' '+
                                ' AND IDPESSJUR = '+qrydet.FieldByName('IDPESSJUR').AsString+' '+
                                ' AND IDPLANOPREV = '+qrydet.FieldByName('IDPLANOPREV').AsString+' '+
                                ' AND IDPESSOA = '+qrydet.FieldByName('IDPESSOA').AsString+' '+
                                ' AND IDDESCONTO = '+qrydet.FieldByName('IDCONTRIBUICAO').AsString+' '+
                                ' AND NUMRECEBIMENTO = ' +qryDet.FieldByName('NUMRECEBIMENTO').AsString+' ' + // Andre Imakawa - SIG 90194
                                ' AND NVL(SITENVIO,''0'') <> ''0'' ';
   dtmAPrev.qryAux.open;

   if not dtmAPrev.qryAux.isempty then
      Result := True;


end;


procedure TfrmCadHstContribuicao.bbtnOkDetClick(Sender: TObject);
var
MESCOBRANCA : String;
 qryPlanoContabil:TwwQuery; //Helio - SOL Nº 253577/17650 PPM Nº 1015003
begin
  try
    ///Higor Nayde Ferreria SOL 181197 Kintana 1679385  INICIO
    //Higor Nayde Ferreria SOL 194021 Kintana 1848642  INICIO
    if StrToInt(edMesRef.Text) < 13 then
    begin
      If ((Trim(edAnoCob.Text) <> '') And
            (Trim(edMesCob.Text) <> '')) And
            (StrToInt(Trim(edAnoRef.Text)+Trim(edMesRef.Text)) >
             StrToInt(Trim(edAnoCob.Text)+Trim(edMesCob.Text))) then
          begin
            MsgDlg(
              'O mês cobrança informado é menor que o mês referência.',
              'Informação', mtWarning, [mbOK], 0);
            Exit;
          end
    end
    else
    begin
          If (StrToInt(Trim(edAnoRef.Text)) > StrToInt(Trim(edAnoCob.Text))) then
          MsgDlg(
            'O abono se refere a um ano posterior ao corrente.',
            'Informação', mtWarning, [mbOK], 0);
    end;
    //Higor Nayde Ferreria SOL 194021 Kintana 1848642  FIM
    //Higor Nayde Ferreria SOL 181197 Kintana 1679385  FIM
    // Renato Visoni SOL 101115 \	Kintana 448902
     if (Qry.FieldByname('FlgOrigem').asString = 'S') and ((cboTipoRecurso.LookupValue ='') or (EdOrigemRecurso.Text = '')) then begin
       MsgDlg('O tipo e a origem da contribuição são de preenchimento obrigatório.','Erro',mtError,[mbOK],0);
      exit;
     end;

  // Renato Visoni SOL 101115 \	Kintana 448902

    //edtPlanoContabil.text := DBText3.Field.AsString;

    //qryDet.FieldByName('IDPLANPREVCONTAB').AsString :=  qry.FieldByName('IDPLANOPREV').AsString;

  except
  end;
  //William Moreira da Silva - SOL 263499 - PPM 1124000
  //inherited;
  //William Moreira da Silva - SOL 263499 - PPM 1124000

  //Inicio - Helio - SOL Nº 253577/17650 PPM Nº 1015003
  qryPlanoContabil := TWWQuery.Create(Application);
  qryPlanoContabil.DataBaseName := 'BaseDados';


  qryPlanoContabil.SQL.Text := ' SELECT DECODE(IDPLANPREVCONTAB,2,''REG/REPLAN'',74,''NOVO PLANO'',PN.NOME) AS NOME,PN.IDPLANOPREV from PLANPREVCONTABIL PN,CONTRIBPREVPARTP CP  ' +
                                  '                                                              '            +
                                  '        WHERE ( CP.IDPLANPREVCONTAB = PN.IDPLANOPREV)         '            +
                                  '        AND  (CP.IDPESSJUR      = '+(MontaSelect.ValoresChave[0])+') '+
                                  '        AND  (CP.IDPLANOPREV    = '+(MontaSelect.ValoresChave[1])+') '+
                                  '        AND  (CP.IDPESSOA       = '+(MontaSelect.ValoresChave[2])+') '+
                                  '        AND  (CP.IDCONTRIBUICAO = '+(MontaSelect.ValoresChave[4])+') ';
  qryPlanoContabil.Open;

  qryDet.FieldByName('IDPLANPREVCONTAB').AsString :=  qryPlanoContabil.FieldByName('IDPLANOPREV').AsString;
  edtPlanoContabil.text := qryPlanoContabil.FieldByName('NOME').AsString;


  //William Moreira da Silva - SOL 263499 - PPM 1124000
  inherited;
  //William Moreira da Silva - SOL 263499 - PPM 1124000

  qryPlanoContabil.Close;
  FreeAndNil(qryPlanoContabil);
  //Fim - Helio - SOL Nº 253577/17650 PPM Nº 1015003
  end;

procedure TfrmCadHstContribuicao.dbedRecebidoExit(Sender: TObject);
begin
  inherited;

  try
     if (StrToFloat(dbedRecebido.Text) > 0) and
        (dbedRecebido.Text = dbedEsperado.Text)  and
        (dbdtRecebimento.text <> '') then
     begin
        dbrgrpSitRecebimento.ItemIndex := 2;
        qryDet.FieldByName('SITRECEBIMENTO').AsString      :=  '2' ;
     end
     else if (dbedRecebido.Text <> dbedEsperado.Text)  and
             (dbdtRecebimento.text <> '') then
     begin
        dbrgrpSitRecebimento.ItemIndex := 3;
        qryDet.FieldByName('SITRECEBIMENTO').AsString      :=  '3' ;
     end
  except
  end;
end;



procedure TfrmCadHstContribuicao.dbdtRecebimentoExit(Sender: TObject);
begin
  inherited;

  try
     if (StrToFloat(dbedRecebido.Text) > 0)   and
        (dbedRecebido.Text = dbedEsperado.Text)  and
        (dbdtRecebimento.text <> '') then
     begin
        dbrgrpSitRecebimento.ItemIndex := 2;
        qryDet.FieldByName('SITRECEBIMENTO').AsString      :=  '2' ;
     end
     else if (dbedRecebido.Text <> dbedEsperado.Text)  and
             (dbdtRecebimento.text <> '') then
     begin
        dbrgrpSitRecebimento.ItemIndex := 3;
        qryDet.FieldByName('SITRECEBIMENTO').AsString      :=  '3' ;
     end
  except
  end;
end;



procedure TfrmCadHstContribuicao.FormShow(Sender: TObject);
begin
  inherited;
  MontaSelect.Filtro.Add('CPP.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')');

  qryTipoRecurso.Close; //Renato Visoni SOL 101115 \	Kintana 448902
  qryTipoRecurso.Open;  //Renato Visoni SOL 101115 \	Kintana 448902

  //Ewerton Beltramini - SIG95907 - 23/12/2019 - Inicio..................................................
  QryImpAux.Close;
  QryImpAux.Sql.Clear;
  QryImpAux.Sql.add('SELECT IDUSUARIO, IDGRUPO FROM GRUPOUSU');
  QryImpAux.Sql.add(' WHERE IDGRUPO in (822,1035) ');
  QryImpAux.Sql.add('   AND IDUSUARIO = ' + IntToStr(Sistema.IdUsuario));
  QryImpAux.Open;

  sIdGrupo:= QryImpAux.FieldByName('IDGRUPO').AsString;

  if QryImpAux.FieldByName('IDUSUARIO').AsString = IntToStr(Sistema.IdUsuario) then
     GBExcluirImportacao.Visible:= True
  else
     GBExcluirImportacao.Visible:= False;
  //Ewerton Beltramini - SIG95907 - 23/12/2019 - Fim.....................................................

end;

procedure TfrmCadHstContribuicao.grpMesCobrancaExit(Sender: TObject);
begin
  if (Trim(edMesCob.Text) <> '') and
     ( (StrToInt(Trim(edMesCob.Text)) <= 0) or (StrToInt(Trim(edMesCob.Text)) > 12) )
  then begin
     MsgDlg('O mês de cobrança deve estar entre 1 e 12. Verifique.','Erro',mtError,[mbOK],0);
     edMesCob.SetFocus;
     Exit;
  end;

  inherited;

  qryLote.Close;
  qryLote.ParamByName('MESREFERENCIA').AsString := Trim(edAnoCob.Text)+'/'+Trim(edMesCob.Text);
  qryLote.Open;

  //edilaine SIG104014 : inicio
  if (StrToInt(edMesCob.Text) = 2) then
     dbdtPrevisao.Text := '28/'+ Trim(edMesCob.Text)+'/'+Trim(edAnoCob.Text)
  else
     dbdtPrevisao.Text := '30/'+ Trim(edMesCob.Text)+'/'+Trim(edAnoCob.Text);

  qryDet.FieldByName('DATAPREVISAORECE').AsString  := dbdtPrevisao.Text;
  //edilaine SIG104014 : fim

end;

procedure TfrmCadHstContribuicao.qryDetAfterScroll(DataSet: TDataSet);
begin
  inherited;
  qryLote.Close;
  qryLote.ParamByName('MESREFERENCIA').AsString := qryDet.FieldByName('MESCOBRANCA').AsString;
  qryLote.Open;
end;

procedure TfrmCadHstContribuicao.bbtnConfirmarClick(Sender: TObject);
VAR
 sSQL : string;
 MESCOBRANCA  : STRING;
 Ctrl: TCmControlObject;
 i : Integer;
 Rparametros : TStringList;
begin
  //SIG91445 -Inicio
   if (bArqImportado) then
     begin
       FinalizaImportacao(TBitBtn(Sender));
       exit;
     end;
  //SIG91445 -Inicio

  Rparametros := TStringList.Create;
  Ctrl := TCmControlObject.Create;
  qryDet.DisableControls;
  sSQL:= '';
  // inicio - Fernando Santana - SOL 133951  KINTANA 783947
  sSQL:= ' delete from  cm.CONTRIBUICAOXANOBASEXPESSOA ' +#13+
         ' where not exists (select 1                  ' +#13+
         '                   from cm.HSTCONTRIBPREV    ' +#13+
         '                   where HSTCONTRIBPREV.numrecebimento  = CONTRIBUICAOXANOBASEXPESSOA.numrecebimento) ';
  ExecutarQuery(dtmAPrev.qryAux,sSQL);
 // Fim - Fernando Santana - SOL 133951  KINTANA 783947
 // Higor Nayde Ferreria SOL 181197 Kintana 1679385 Inic
   If qryDet.FieldByName('FLGALTERADO').AsFloat = 1 then begin

      try
              dtmBaseDados.dbBaseDados.StartTransaction;
              Ctrl.Initialize(
              dtmBaseDados.dbBaseDados,
              True,
              Sistema.ConnectionType,
              Sistema.ConnectionSide,
              Sistema.AppRemoteServer,
              True
              );
             sSQL:= '';
             sSQL:= 'SELECT * FROM HSTATRASOCONTRIB WHERE MESCOBRANCA   =   '''+ vMesCobraca+''''+
                    '      AND  MESREFERENCIA = '''+vMesReferencia+''''+
                    '      AND  IDMOTIVO      = '+vMotivo+
                    '      AND  NUMRECEBIMENTO = '+vNumeroRecebimento;

             cdsChavesprimarias.Data := Ctrl.GetDataPacket(sSql);
             // DELETE TABELA FILHA
             sSQL:= '';
             sSQL:= 'DELETE FROM HSTATRASOCONTRIB WHERE MESREFERENCIA = '''+vMesReferencia+''''+
                    ' AND  MESCOBRANCA = '''+ vMesCobraca+''''+
                    ' AND  IDMOTIVO = '+vMotivo+
                    ' AND  NUMRECEBIMENTO = '+vNumeroRecebimento;

             ExecutarQuery(dtmAPrev.qryAux,sSQL);

            //ATUALIZA TELA PAI
            with dtmAPrev.qryAux do
            begin
              Close;
              SQL.Clear;
              SQL.Add(' UPDATE HSTCONTRIBPREV SET MESREFERENCIA ='''+qryDet.FieldByName('MESREFERENCIA').AsString+''',');
              SQL.Add('          MESCOBRANCA = '''+qryDet.FieldByName('MESCOBRANCA').AsString+''',');
              //  SQL.Add('          IDMOTIVO = '+qryDet.FieldByName('IDMOTIVO').AsString+',');
              // SQL.Add('          NUMRECEBIMENTO = '+qryDet.FieldByName('NumRecebimento').AsString);
  ///----
              SQL.Add('  NUMRECEBIMENTO = '''+qryDet.FieldByName('NumRecebimento').AsString+''',');

              SQL.Add('  IDMOTIVO = '+qryDet.FieldByName('IDMOTIVO').AsString+',');

              SQL.Add('  IDPESSJUR = '+qryDet.FieldByName('IDPESSJUR').AsString+',');
              SQL.Add('  IDPLANOPREV = '+qryDet.FieldByName('IDPLANOPREV').AsString+',');
              SQL.Add('  IDPESSOA = '+qryDet.FieldByName('IDPESSOA').AsString+',');
              SQL.Add('  IDCONTRIBUICAO = '+qryDet.FieldByName('IDCONTRIBUICAO').AsString+',');
              SQL.Add('  SEQPROPOSTA = '+qryDet.FieldByName('SEQPROPOSTA').AsString+',');
              SQL.Add('  FLGDEVOLUCAO = '+qryDet.FieldByName('FLGDEVOLUCAO').AsString+',');
              SQL.Add('  FLGDIVERGENTE = '+qryDet.FieldByName('FLGDIVERGENTE').AsString+',');
              SQL.Add('  FLGCONCESSAO = '+qryDet.FieldByName('FLGCONCESSAO').AsString+',');
              SQL.Add('  FLGEVENTO = '+qryDet.FieldByName('FLGEVENTO').AsString+',');
              SQL.Add('  FLGCALCRESERVA = '+qryDet.FieldByName('FLGCALCRESERVA').AsString+',');
              SQL.Add('  FLGDESCFOLHA = '+qryDet.FieldByName('FLGDESCFOLHA').AsString+',');
              SQL.Add('  FLGSITFUNDACAO = '''+qryDet.FieldByName('FLGSITFUNDACAO').AsString+''',');
              SQL.Add('  FLGAPORTE ='+qryDet.FieldByName('FLGAPORTE').AsString+',');
              SQL.Add('  VALORESPERADO = '''+qryDet.FieldByName('VALORESPERADO').AsString+''',');
              SQL.Add('  VALORRECEBIDO = '''+qryDet.FieldByName('VALORRECEBIDO').AsString+''',');
              SQL.Add('  VALORCALCULADO = '''+qryDet.FieldByName('VALORCALCULADO').AsString+''',');
              SQL.Add('  DATAPREVISAORECE = '''+qryDet.FieldByName('DATAPREVISAORECE').AsString+''',');
              SQL.Add('  DATARECEBIMENTO = '''+qryDet.FieldByName('DATARECEBIMENTO').AsString+''',');
              SQL.Add('  DATAINICIO = '''+qryDet.FieldByName('DATAINICIO').AsString+''',');
              SQL.Add('  DATAFINAL ='''+qryDet.FieldByName('DATAFINAL').AsString+''',');
              //BRUNO AZEVEDO SOL 197515 KINTANA 1892354
              //SQL.Add('  IDREGRACALCULO = '+qryDet.FieldByName('IDREGRACALCULO').AsString+',');
              SQL.Add('  IDREGRACALCULO = '''+qryDet.FieldByName('IDREGRACALCULO').AsString+''',');
              //BRUNO AZEVEDO SOL 197515 KINTANA 1892354
              SQL.Add('  SITRECEBIMENTO = '''+qryDet.FieldByName('SITRECEBIMENTO').AsString+''',');
              SQL.Add('  TIPO = '''+qryDet.FieldByName('TIPO').AsString+''',');
              SQL.Add('  SALCONTRIB = '''+qryDet.FieldByName('SALCONTRIB').AsString+''',');  //Ewerton Beltramini - 61677
              SQL.Add('  VALOROP1 = '''+qryDet.FieldByName('VALOROP1').AsString+''',');
              SQL.Add('  VALOROP2 = '''+qryDet.FieldByName('VALOROP2').AsString+''',');
              SQL.Add('  VALOROP3 = '''+qryDet.FieldByName('VALOROP3').AsString+''',');

              if(qryDet.FieldByName('IDLOTE').AsString ='')then
                   SQL.Add('  IDLOTE = 0,')
              else
                   SQL.Add('  IDLOTE = '+qryDet.FieldByName('IDLOTE').AsString+',');

              SQL.Add('  FLGMANUAL = '''+qryDet.FieldByName('FLGMANUAL').AsString+''',');
              SQL.Add('  FOLHAORIGEM = '''+qryDet.FieldByName('FOLHAORIGEM').AsString+''',');
              SQL.Add('  CODPORTFORMA = '''+qryDet.FieldByName('CODPORTFORMA').AsString+''',');
              SQL.Add('  IDTIPORECURSO ='''+qryDet.FieldByName('IDTIPORECURSO').AsString+''',');
              SQL.Add('  ORIGEMRECURSO ='''+qryDet.FieldByName('ORIGEMRECURSO').AsString+''',');
              SQL.Add('  CODDOCUMENTOPREV ='''+qryDet.FieldByName('CODDOCUMENTOPREV').AsString+'''');
              SQL.Add(',  OBSERVACAO ='''+qryDet.FieldByName('OBSERVACAO').AsString+''''); //Helen - WO4557

             SQL.Add(',  IDPLANPREVCONTAB = '+ IntToStr(QryDet.FieldbyName('IDPLANPREVCONTAB').AsInteger) ); // HIGOR NAYDE FERREIRA

              SQL.Add('    WHERE MESREFERENCIA = '''+vMesReferencia+'''');
              SQL.Add('    AND   MESCOBRANCA = '''+vMesCobraca+'''');
              SQL.Add('    AND   IDMOTIVO = '+vMotivo);
              SQL.Add('    AND   SITRECEBIMENTO <> 4 ');   //Rafael SIG 96931
              SQL.Add('    AND   NUMRECEBIMENTO = '+vNumeroRecebimento);

              ExecSQL;
            end;
            //Inserir dados Do CDS na tabela filha
            //cdsChavesprimarias.First;
            while not cdsChavesprimarias.Eof do
            begin
                sSQL := '';

                sSQL := ' INSERT INTO HSTATRASOCONTRIB  (MESREFERENCIA';
                Rparametros.Add('MESREFERENCIA');

                for i := 1 to  cdsChavesprimarias.Fields.Count -1 do
                begin
                  if  cdsChavesprimarias.Fields[i].value <> null then
                  begin
                       sSQL := sSQL + ','+ cdsChavesprimarias.Fields[i].FieldName;
                       Rparametros.Add(cdsChavesprimarias.Fields[i].FieldName);
                   {if (i <> cdsChavesprimarias.Fields.Count -1)  then
                   begin
                       if (i+1 <> cdsChavesprimarias.Fields.Count -1) then
                          sSQL := sSQL + ','
                       else if  cdsChavesprimarias.Fields[cdsChavesprimarias.Fields.Count -1].value <> null then
                          sSQL := sSQL + ',';
                   end;}
                   end;
                end;
                sSQL := sSQL + ') VALUES ( ';

                for i := 0 to  Rparametros.Count -1 do
                begin
                  if  (Rparametros[i] <> null) then
                  begin
                   sSQL := sSQL + ':' + Rparametros[i];
                   if (i) <> (Rparametros.Count -1) then
                    begin
                          sSQL := sSQL + ',';
                    end;
                       //sSQL := sSQL + ',';
                   end;
                end;


                  sSQL := sSQL + ')';

                qryAux2.Close;
                qryAux2.SQL.Clear;
                qryAux2.SQL.Text := sSQL;
                qryAux2.Params.ParamByName('MESREFERENCIA').AsString  := qryDet.FieldByName('MESREFERENCIA').AsString;
                qryAux2.Params.ParamByName('NUMRECEBIMENTO').AsString := qryDet.FieldByName('NUMRECEBIMENTO').AsString;
                qryAux2.Params.ParamByName('MESCOBRANCA').AsString    := qryDet.FieldByName('MESCOBRANCA').AsString;
                qryAux2.Params.ParamByName('IDMOTIVO').AsString       := qryDet.FieldByName('IDMOTIVO').AsString;


                for i := 4 to cdsChavesprimarias.Fields.count-1  do
                begin
                   if  cdsChavesprimarias.Fields[i].value <> null then
                       CAse cdsChavesprimarias.Fields[i].DataType of
                         ftDate,
                         ftDateTime: qryAux2.Params.ParamByName(cdsChavesprimarias.Fields[i].FieldName).AsDateTime := cdsChavesprimarias.fields[i].AsDateTime;
                       else
                          qryAux2.Params.ParamByName(cdsChavesprimarias.Fields[i].FieldName).AsString := cdsChavesprimarias.fields[i].AsString;
                       End;

                end;

                //qryAux2.SQL.SaveToFile('C:\QRYAUX.txt');

                qryAux2.ExecSQL;
                Rparametros.Clear;
                cdsChavesprimarias.Next;
            end;
         dtmBaseDados.dbBaseDados.Commit;
      except;
         dtmBaseDados.dbBaseDados.Rollback;
         raise;
      end;
   end;
   FreeAndNil(Rparametros);
   CONTRIBUICAOXANOBASEXPESSOA;
 // Higor Nayde Ferreria SOL 181197 Kintana 1679385 Fim.

    if flg_Movimentacao = 1 then
      begin
         if not GravaLogTOTALPREV ('Inclusão Manual de Contribuição - Mês '+edAnoCob.Text+'-Part. '+copy(qry.fieldbyname('nome').AsString,1,20)+'Contr.'+
            copy(qry.fieldbyname('NOMECONTRIB').AsString,1,20))
               then begin
                MsgDlg('Erro ao Gravar o Log.','Atenção',mtError,[mbOK],0);
           end;
     end;

     if flg_Movimentacao = 2 then
      begin
         if not GravaLogTOTALPREV ('Alteração Manual de Contribuição  - Mês '+edAnoCob.Text+'-Part. '+qry.fieldbyname('nome').AsString+'Contr.'+
            copy(qry.fieldbyname('NOMECONTRIB').AsString,1,20))
               then begin
                MsgDlg('Erro ao Gravar o Log.','Atenção',mtError,[mbOK],0);
           end;
     end;

    flg_Movimentacao := 0;
    CommitTransacao; // Fernando Santana - SOL 133951  KINTANA 783947
  qryDet.EnableControls; // SOL 211020 Kintana 2034882
  inherited;
  AtualizaULTMESPREPARO(); // Andre Imakawa - SIG 60728
end;




procedure TfrmCadHstContribuicao.FormCreate(Sender: TObject);
begin
inherited;
  flg_Movimentacao := 0;
  iHabBtContabiliza := 0;

  bArqImportado:= False;//SIG91445

   try
      CtrlDocumento := TCtrlDocumento.Create;
      CtrlDocumento.Initialize( dtmBaseDados.dbBaseDados,
                                True,
                                Sistema.ConnectionType,
                                Sistema.ConnectionSide,
                                Sistema.AppRemoteServer,
                                True
                               );
   except
      MsgDlg('Erro ao criar Controle de Documentos.','Erro',mtError,[mbOK],0);
      Abort;
   end;



   try
      CtrlLancamento := TCtrlLancamento.Create;
      CtrlLancamento.Initialize( dtmBaseDados.dbBaseDados,
                                True,
                                Sistema.ConnectionType,
                                Sistema.ConnectionSide,
                                Sistema.AppRemoteServer,
                                True
                               );
   except
      MsgDlg('Erro ao criar Controle de Lançamento Contábil.','Erro',mtError,[mbOK],0);
      Abort;
   end;



end;


procedure TfrmCadHstContribuicao.sbtnInsDetClick(Sender: TObject);
var IdPlano, NomePlano : String;
    qryPlanoContabil:TwwQuery;
begin
  qryPlanoContabil := TwwQuery.Create(Application); //Higor Nayde  SOL 162126*RE01 KINTANA 792563
  qryPlanoContabil.DataBaseName := 'BaseDados';    //Higor Nayde  SOL 162126*RE01 KINTANA 792563
//  qryDet.FieldByName('IDPLANPREVCONTAB').AsString
  //if not qryDet.IsEmpty then begin
  //   IdPlano    := qryDet.FieldByName('IDPLANPREVCONTAB').AsString;
  //   NomePlano  := qryDet.FieldByName('NOMEPLANO').AsString
  //end  else begin
    //Higor Nayde  SOL 162126*RE01 KINTANA 792563
    qryPlanoContabil.SQL.Text := ' SELECT DECODE(IDPLANPREVCONTAB,2,''REG/REPLAN'',74,''NOVO PLANO'',PN.NOME) AS NOME,PN.IDPLANOPREV from PLANPREVCONTABIL PN,CONTRIBPREVPARTP CP  ' +
                                  '                                                              '            +
                                  '        WHERE ( CP.IDPLANPREVCONTAB = PN.IDPLANOPREV)         '            +
                                  '        AND  (CP.IDPESSJUR      = '+(MontaSelect.ValoresChave[0])+') '+
                                  '        AND  (CP.IDPLANOPREV    = '+(MontaSelect.ValoresChave[1])+') '+
                                  '        AND  (CP.IDPESSOA       = '+(MontaSelect.ValoresChave[2])+') '+
                                  '        AND  (CP.IDCONTRIBUICAO = '+(MontaSelect.ValoresChave[4])+') ';
    qryPlanoContabil.Open;

     IdPlano    :=  qryPlanoContabil.FieldByName('IDPLANOPREV').AsString;

     NomePlano  := qryPlanoContabil.FieldByName('NOME').AsString;
     qryPlanoContabil.Destroy;
     //Higor Nayde  SOL 162126*RE01 KINTANA 792563
  //end;
  inherited;
  flg_Movimentacao := 1;


  //Higor Nayde  SOL 162126*RE01 KINTANA 792563
  edtPlanoContabil.text                   := NomePlano;
  qryDet.FieldByName('IDPLANPREVCONTAB').AsString :=  IdPlano;
  //Higor Nayde  SOL 162126*RE01 KINTANA 792563
  memobs.text := '';  //WO4557 - Helen V Bianchi

end;



procedure TfrmCadHstContribuicao.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  flg_Movimentacao := 0;
  iHabBtContabiliza := 0;
  edtImporta.ReadOnly := false;
  edtImporta.Text := '';
  edtImporta.ReadOnly := true;
  BBtnImporta.Enabled := false;
  btnInverte.Enabled := false;
  btnMarcaTodas.Enabled := false;
  // Andre Imakawa - SIG 90078 - Inicio
  If dtmBaseDados.dbBaseDados.InTransaction Then
    dtmBaseDados.dbBaseDados.Rollback;
  // Andre Imakawa - SIG 90078 - Fim
end;



procedure TfrmCadHstContribuicao.bbtnSairClick(Sender: TObject);
begin
  inherited;
  flg_Movimentacao := 0;
  // Andre Imakawa - SIG 90078 - Inicio
  If dtmBaseDados.dbBaseDados.InTransaction Then
    dtmBaseDados.dbBaseDados.Rollback;
  // Andre Imakawa - SIG 90078 - Fim  
end;




procedure TfrmCadHstContribuicao.wwDBLookupCombo1DropDown(Sender: TObject);
Var
 sFiltro : String;
begin
  inherited;
  sFiltro := '';

  If dbrgrpSitRecebimento.ItemIndex  = 0
   Then sFiltro := 'DATAVOLTATMP IS NULL';

  If dbrgrpForma.ItemIndex = 1
   Then If Trim(sFiltro) = ''
         Then sFiltro := 'TIPO = ''B'''
         Else sFiltro := sFiltro + ' AND TIPO = ''B''';

  If Trim(sFiltro) <> ''
   Then Begin
     qryLote.Filter   := sFiltro;
     qryLote.Filtered := True;
     qryLote.First;
   End;
  qryLote.Filter   := '';
  qryLote.Filtered := False;
end;

procedure TfrmCadHstContribuicao.rdgrpatrasodevolChange(Sender: TObject);
begin
  inherited;
  If rdgrpatrasodevol.ItemIndex = 0
   Then dbrgrpForma.Caption := 'Forma de Cobrança'
   Else dbrgrpForma.Caption := 'Forma de Pagamento';
end;



procedure TfrmCadHstContribuicao.qryDetAfterPost(DataSet: TDataSet);
Var
  sMaiorMesReferencia : String;
begin
  inherited;
  With dtmaprev.qryAux do
   Begin
     Close;
     Sql.Clear;
     Sql.Add('SELECT MAX(MESREFERENCIA) AS MESREFERENCIA');
     Sql.Add('FROM HSTCONTRIBPREV');
     Sql.Add('WHERE IDPESSJUR      = '+qry.FieldByName('IdPessJur').AsString);
     Sql.Add('  AND IDPLANOPREV    = '+qry.FieldByName('IdPlanoPrev').AsString);
     Sql.Add('  AND IDPESSOA       = '+qry.FieldByName('IdPessoa').AsString);
     Sql.Add('  AND SUBSTR(MESREFERENCIA,6,2) <> '+QuotedStr('13'));
     Sql.Add('  AND IDCONTRIBUICAO = '+qry.FieldByName('IdContribuicao').AsString);
     Sql.Add('  AND NVL(IDTITULAR,IDPESSOA) = '+qry.FieldByName('IdTitular').AsString); // Andre Imakawa - SIG 60728
     Open;

     If Not IsEmpty
      Then sMaiorMesReferencia := FieldByName('MESREFERENCIA').AsString
      Else sMaiorMesReferencia := Trim(edAnoRef.Text)+'/'+Trim(edMesRef.Text);

     Close;
     Sql.Clear;
     Sql.Add('UPDATE CONTRIBPREVPARTP');
     Sql.Add('SET ULTMESPREPARO = '+QuotedStr(sMaiorMesReferencia));
     Sql.Add('WHERE IDPESSJUR      = '+qry.FieldByName('IdPessJur').AsString);
     Sql.Add('  AND IDPLANOPREV    = '+qry.FieldByName('IdPlanoPrev').AsString);
     Sql.Add('  AND IDPESSOA       = '+qry.FieldByName('IdPessoa').AsString);
     Sql.Add('  AND IDCONTRIBUICAO = '+qry.FieldByName('IdContribuicao').AsString);
     ExecSQL;
   end;
end;



procedure TfrmCadHstContribuicao.chkDivTratClick(Sender: TObject);
begin
  inherited;
  If chkDivTrat.Checked
   Then qryDet.Filter := 'SITRECEBIMENTO <> 4'
   Else qryDet.Filter := '';
  qryDet.Filtered := chkDivTrat.Checked;
  qryDet.First;
end;



function TfrmCadHstContribuicao.BuscaSitAnterior(pIdPessJur, pIdPlanoPrev,
  pIdTitular, pSeqProposta: String): String;
Var
  sIdEventoGerador : String;
begin
  sIdEventoGerador := BuscaUltimoEvento(qryAux,
                                        StrToInt(pIdPessjur),
                                        StrToInt(pIdPlanoPrev),
                                        StrToInt(pIdTitular),
                                        StrToInt(pSeqProposta),
                                        DateToStr(Now),
                                        'IDEVENTOGERADOR');

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT EP.IDSITFUNCATUAL, EP.IDSITFUNCNOVO, EP.IDSITPLANOATUAL, EP.IDSITPLANONOVO, ');
  qryAux.SQL.Add('	EP.IDSITPARTATUAL, EP.IDSITPARTNOVO, SP.FLGINTERNO AS FLGINTERNOATUAL,       ');
  qryAux.SQL.Add('	SP2.FLGINTERNO AS FLGINTERNONOVO                                             ');
  qryAux.SQL.Add('FROM   EVENTOSPREV EP, SITPART SP, SITPART SP2                                     ');
  qryAux.SQL.Add('WHERE  EP.IDSITPARTATUAL  = SP.IDSITPART                                           ');
  qryAux.SQL.Add('AND    EP.IDSITPARTNOVO   = SP2.IDSITPART                                          ');
  qryAux.SQL.Add('AND    EP.IDPESSJUR       = '+pIdPessJur      );
  qryAux.SQL.Add('AND    EP.IDPLANOPREV     = '+pIdPlanoPrev    );
  qryAux.SQL.Add('AND    EP.IDPESSOA        = '+pIdTitular      );
  qryAux.SQL.Add('AND    EP.SEQPROPOSTA     = '+pSeqProposta    );
  qryAux.SQL.Add('AND    EP.IDEVENTOGERADOR = '+sIdEventoGerador);
  qryAux.SQL.Add('AND EP.IDEVENTOSPREV = (SELECT MAX(E.IDEVENTOSPREV)                   ');
  qryAux.SQL.Add('                        FROM EVENTOSPREV E                            ');
  qryAux.SQL.Add('                        WHERE E.IDPESSJUR = EP.IDPESSJUR              ');
  qryAux.SQL.Add('                          AND E.IDPLANOPREV = EP.IDPLANOPREV          ');
  qryAux.SQL.Add('                          AND E.IDPESSOA = EP.IDPESSOA                ');
  qryAux.SQL.Add('                          AND E.SEQPROPOSTA = EP.SEQPROPOSTA          ');
  qryAux.SQL.Add('                          AND E.IDEVENTOGERADOR = EP.IDEVENTOGERADOR) ');

  qryAux.Open;

  Result := qryAux.FieldByName('FLGINTERNOATUAL').AsString;
end;




procedure TfrmCadHstContribuicao.CONTRIBUICAOXANOBASEXPESSOA;
var sSQL : string;

begin
   // inicio - Fernando Santana - SOL 133951  KINTANA 783947
  if trim(qryDetANODIRF.AsString) = '' then
  begin
    sSQL := ' delete from  cm.CONTRIBUICAOXANOBASEXPESSOA ' +#13+
            '  where NUMRECEBIMENTO = '+qryDetNUMRECEBIMENTO.AsString;
    ExecutarQuery(dtmAPrev.qryAux,sSQL);
  end
  else
  begin
     sSQL := 'select ANODIRF from CM.CONTRIBUICAOXANOBASEXPESSOA  where NUMRECEBIMENTO = '+qryDetNUMRECEBIMENTO.AsString;

    if FazQuery(dtmAPrev.qryAux,sSQL) then
    begin
      sSQL := '  update cm.CONTRIBUICAOXANOBASEXPESSOA  set' +#13+
              '  IDPESSOA = '+ qryDetIDPessoa.AsString       +#13+
              ', ANODIRF  = '+ qryDetANODIRF.AsString        +#13+
              '  where NUMRECEBIMENTO = '+qryDetNUMRECEBIMENTO.AsString;
    end
    else
    begin
      sSQL := 'INSERT INTO cm.CONTRIBUICAOXANOBASEXPESSOA (  NUMRECEBIMENTO, IDPESSOA, ANODIRF ) ' +#13+
                                                   'VALUES('+qryDetNUMRECEBIMENTO.AsString +','    +#13+
                                                             qryDetIDPessoa.AsString       +','    +#13+
                                                             qryDetANODIRF.AsString        +' )';
    end;
  end;

  ExecutarQuery(dtmAPrev.qryAux,sSQL);
 // Fim - Fernando Santana - SOL 133951  KINTANA 783947
end;

procedure TfrmCadHstContribuicao.cboTipoRecursoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;

  cboTipoRecurso.Text := qryTipoRecurso.FieldByname('Nome').asstring;

end;

procedure TfrmCadHstContribuicao.btnProcuraClick(Sender: TObject);
begin
   inherited;
   MontaSelectCapCar.Executar;

   if (MontaSelectCapCar.RetornouValor) then
   begin
       edtCodDocPrev.text := MontaSelectCapCar.ValoresChave[0];
       qryDet.FieldByName('CODDOCUMENTOPREV').AsString := edtCodDocPrev.text;
   end;
   btnProcura.down := false;
end;

procedure TfrmCadHstContribuicao.btnImportaClick(Sender: TObject);
begin
   inherited;
   OpenDialog1.Execute;

   if OpenDialog1.FileName <> '' then
   begin
      edtImporta.ReadOnly := false;
      edtImporta.text := OpenDialog1.FileName;
      edtImporta.ReadOnly := true;
      BBtnImporta.Enabled := true;
      btnInverte.Enabled := true;
      btnMarcaTodas.Enabled := true;
   end;
end;

procedure TfrmCadHstContribuicao.BBtnImportaClick(Sender: TObject);
var bErro  : boolean;
begin
   inherited;

   //Ewerton Beltramini - SIG95907 Inicio......................................................
   if Trim(EdtDescricaoImportacao.text) = '' then
   begin
         MsgDlg('O campo Descrição é obrigatório!','Erro',mtError,[mbOK],0);
         EdtDescricaoImportacao.setFocus;
         Abort;
   end;
   //Ewerton Beltramini - SIG95907 Fim......................................................

   bErro := false;
   MmOcorrencia.Lines.Clear;
   MmOcorrencia.Lines.add('');
   MmOcorrencia.Lines.add(' Importação de Arquivo');
   MmOcorrencia.Lines.add(' ------------------------------------------');
   MmOcorrencia.Lines.add('');
   try
      XlsToStringGrid(StringGrid1,OpenDialog1.FileName);
      if StringGrid1.RowCount > 0 then
      begin
         //SIG91445 -Inicio
         RollBackTransacao;
         dtmBaseDados.dbBaseDados.StartTransaction;
         bArqImportado       := True;
         bbtnCancelar.Enabled:= True;
        //SIG91445 -Fim

         GravaDadosTabela;
      end;
   except
     on E:EDBEngineError do
      begin
        if pos('CM.R_1899',E.Message) > 0 then
        MmOcorrencia.Lines.add('O valor do campo CODDOCUMENTOPREV informado não existe na tabela DOCUMENTO.');

        if pos('CM.FK_HSTCONTRIBPREV_14',E.Message) > 0 then
        MmOcorrencia.Lines.add('O valor do campo IDPORTABILIDADE informado não existe na tabela PORTABILIDADEPREV.');

        if pos('CM.R_10803',E.Message) > 0 then
        MmOcorrencia.Lines.add('O valor do campo IDMOVBENEF informado não existe na tabela MOVBENEF.');

        if pos('CM.R_1897',E.Message) > 0 then
        MmOcorrencia.Lines.add('O valor do campo PLNCODIGOEFET informado não existe na tabela PLANILHA.');

        if pos('CM.R_1900',E.Message) > 0 then
        MmOcorrencia.Lines.add('O valor do campo PLNCODIGOPREV informado não existe na tabela PLANILHA.');

        if pos('CM.R_1901',E.Message) > 0 then
        MmOcorrencia.Lines.add('O valor do campo CODPORTFORMA informado não existe na tabela PORTADORFORMA.');

        if pos('CM.R_2329',E.Message) > 0 then
        MmOcorrencia.Lines.add('O valor do campo IDREGRACALCULO informado não existe na tabela REGRA.');

        if pos('CM.R_3722',E.Message) > 0 then
        MmOcorrencia.Lines.add('O valor do campo IDCONTRIBUICAO informado não existe na tabela CONTRIBUICAO.');

        if pos('CM.R_3723',E.Message) > 0 then
        MmOcorrencia.Lines.add('O valor do campo IDPESSOA informado não existe na tabela PESSOA.');

        if pos('CM.R_6871',E.Message) > 0 then
        MmOcorrencia.Lines.add('O valor do campo IDPESSJUR, IDPLANOPREV informado não existe na tabela PLANPREVPATRO.');

        if pos('CM.R_7178',E.Message) > 0 then
        MmOcorrencia.Lines.add('O valor do campo IDLANCIRRF informado não existe na tabela LANCIRRF.');

        if pos('CM.R_838',E.Message) > 0 then
        MmOcorrencia.Lines.add('O valor do campo IDMOTIVO informado não existe na tabela MOTIVO.');

        if pos('CM.R_9092',E.Message) > 0 then
        MmOcorrencia.Lines.add('O valor do campo IDLOTE informado não existe na tabela CTRLINTERFACE.');

        if pos('CM.R_9370',E.Message) > 0 then
        MmOcorrencia.Lines.add('O valor do campo IDPARCELAMENTO informado não existe na tabela PARCELAMENTO.');

        bErro := true;
      end;
   end;
   MmOcorrencia.Lines.add(' ');

   bbtnConfirmar.Enabled:= not(bErro);//SIG91445

   if bErro then
      MmOcorrencia.Lines.add(' ERRO ao Importar arquivo.')
   else begin
      MmOcorrencia.Lines.add(' Arquivo Importado com Sucesso.');
      // Helen V Bianchi - WO4557 - Inicio
      if sNaoEnviados <> '' then
      begin
          MmOcorrencia.Lines.add(' Os registros abaixo não foram processados pelo motivo do valor da contribuição ');
          MmOcorrencia.Lines.add(' Facultativa ser inferior à contribuição normal:');
          MmOcorrencia.Lines.add(' ');
          MmOcorrencia.Lines.add(sNaoEnviados);
      end;
      // Helen V Bianchi - WO4557 - fim              
      MmOcorrencia.Lines.add(' Clique em OK/Cancelar para Concluir/Reverter.');//
   end;

   if MontaSelect.retornouvalor  //SIG91445 
   then begin
     qryDet.Close;
     qryDet.ParamByName('IdPessJur').Value      := StrToInt(MontaSelect.ValoresChave[0]);
     qryDet.ParamByName('IdPlanoPrev').Value    := StrToInt(MontaSelect.ValoresChave[1]);
     qryDet.ParamByName('IdPessoa').Value       := StrToInt(MontaSelect.ValoresChave[2]);
     qryDet.ParamByName('SeqProposta').Value    := StrToInt(MontaSelect.ValoresChave[3]);
     qryDet.ParamByName('IdContribuicao').Value := StrToInt(MontaSelect.ValoresChave[4]);
     qryDet.ParamByName('IdTitular').Value      := StrToInt(MontaSelect.ValoresChave[2]); // Andre Imakawa - SIG 47372
     qryDet.Open;
   end;

   pgctrlDetalhe.ActivePage := TbsLog;
   tbcDetalhe.TabIndex := 1;              


end;

procedure TfrmCadHstContribuicao.BBtnContabilizaClick(Sender: TObject);
var iCont : integer;
    bErro : boolean;
    sNumRecebimento, sNumRecebimentoAux, sMsgPga, sSQLwhere, sMsgErro : string ;
    sContaCredito, sContaDebito, sContaCreditoAlt, sContaDebitoAlt : string ;
begin
   inherited;
   If not dtmBaseDados.dbBaseDados.InTransaction Then
      dtmBaseDados.dbBaseDados.Starttransaction;
   bErro :=  False;
   MmOcorrencia.Lines.Clear;
   iCont               := 0;
   iPlnCodigo          := 0;
   sNumRecebimento     := '';
   sSQLwhere           := '';
   sMsgPga             := '';
   sMsgErro            := '';
   sContaCredito       := '';
   sContaDebito        := '';
   sContaCreditoAlt    := '';
   sContaDebitoAlt     := '';

   qryDet.DisableControls;

   qryDet.Filtered := True;
   qryDet.Filter := 'SELECIONA =  1 ';

   qryDet.first;
   sNumRecebimento := '';
   while not(qryDet.eof) do
   begin
      if qryDet.FieldByName('SELECIONA').AsInteger = 1 then
         sNumRecebimento := sNumRecebimento + QuotedStr(qryDet.FieldByName('NUMRECEBIMENTO').asstring) + ', ';

   //BAIXAR AS CONTRIBUIÇÕES
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add(' UPDATE HSTCONTRIBPREV ' +
                    '    SET SITRECEBIMENTO   = 2, ' +
                    '        DATAEMISSCOB     = SYSDATE ,'+ // SOL 180156 Kintana 1668852
                    '        MESCOBRANCA = ' + QuotedStr(qryDet.FieldByName('MESCOBRANCA').AsString) + ', '+
                    '        VALORRECEBIDO    = ' + OraNumero(FormatFloat('#0.00', qryDet.FieldByName('VALORESPERADO').AsFloat)) + ', ' +
                    '        DATARECEBIMENTO  = TO_DATE(''' + datetostr(Date) + ''', ''dd/mm/yyyy'') ' +
                    ',  IDPLANPREVCONTAB = '+ IntToStr(QryDet.FieldbyName('IDPLANPREVCONTAB').AsInteger) + // HIGOR NAYDE FERREIRA
                    '  WHERE NUMRECEBIMENTO  = ' + qryDet.FieldByName('NUMRECEBIMENTO').AsString +
                    '    AND MESREFERENCIA   = ' + QuotedStr(qryDet.FieldByName('MESREFERENCIA').AsString) +
                    '    AND MESCOBRANCA     = ' + QuotedStr(qryDet.FieldByName('MESCOBRANCA').AsString));
   try
     qryAux.ExecSql;
   except
     bErro := true;
   end;

   //BAIXAR OS ALTERADORES
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add(' UPDATE HSTATRASOCONTRIB ' +
                    '    SET VALORRECEBIDO   = VALOR, ' +
                    '        DATARECEBIMENTO = TO_DATE(''' + datetostr(Date) + ''', ''dd/mm/yyyy'') ' +
                    '  WHERE NUMRECEBIMENTO  = ' + qryDet.FieldByName('NUMRECEBIMENTO').AsString +
                    '    AND MESREFERENCIA   = ' + QuotedStr(qryDet.FieldByName('MESREFERENCIA').AsString) +
                    '    AND MESCOBRANCA     = ' + QuotedStr(qryDet.FieldByName('MESCOBRANCA').AsString));
   try
     qryAux.ExecSql;
   except
     bErro := true;
   end;

      qryDet.next;
   end;
   qryDet.Filtered := false;
   sNumRecebimento := copy(sNumRecebimento,1,length(sNumRecebimento)-2);
   qryDet.EnableControls;

   MmOcorrencia.Lines.Add('');

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add('SELECT CODDOCUMENTOPREV, M.IDMOTIVO, ');
   qryAux.SQL.Add('       SUM(NVL(DECODE(H.VALORPARARESERVA, NULL, H.VALORRECEBIDO, H.VALORPARARESERVA),0)) AS VALORPARARESERVA ');
   qryAux.SQL.Add('FROM   HSTCONTRIBPREV H, MOTIVO M ');
   qryAux.SQL.Add('WHERE  M.IDMOTIVO     = H.IDMOTIVO ');
   qryAux.SQL.Add('  AND  IDPESSOA       = '+MontaSelect.ValoresChave[2]);
   qryAux.SQL.Add('  AND  IDPESSJUR      = '+MontaSelect.ValoresChave[0]);
   qryAux.SQL.Add('  AND  IDPLANOPREV    = '+MontaSelect.ValoresChave[1]);
   qryAux.SQL.Add('  AND  SEQPROPOSTA    = '+MontaSelect.ValoresChave[3]);
   qryAux.SQL.Add('  AND  IDCONTRIBUICAO = '+MontaSelect.ValoresChave[4]);
   qryAux.SQL.Add('  AND  NUMRECEBIMENTO in ( '+sNumRecebimento+' ) ');
   qryAux.SQL.Add('  group BY CODDOCUMENTOPREV, M.IDMOTIVO order by CODDOCUMENTOPREV desc ');
   try
     if sNumRecebimento <> '' then
        qryAux.Open;
   except
     bErro := true;
   end;


   // na hora de gerar o PGA pega o coddocumentoprev que foi contabilizado e lança no codigopgapagar ou codigopgareceber

   while not(qryAux.eof) do
   begin


      qryAux2.Close;
      qryAux2.SQL.Clear;
      qryAux2.SQL.Add('SELECT NUMRECEBIMENTO ');
      qryAux2.SQL.Add('FROM   HSTCONTRIBPREV H, MOTIVO M ');
      qryAux2.SQL.Add('WHERE  M.IDMOTIVO     = H.IDMOTIVO ');
      qryAux2.SQL.Add('  AND  IDPESSOA       = '+MontaSelect.ValoresChave[2]);
      qryAux2.SQL.Add('  AND  IDPESSJUR      = '+MontaSelect.ValoresChave[0]);
      qryAux2.SQL.Add('  AND  IDPLANOPREV    = '+MontaSelect.ValoresChave[1]);
      qryAux2.SQL.Add('  AND  SEQPROPOSTA    = '+MontaSelect.ValoresChave[3]);
      qryAux2.SQL.Add('  AND  IDCONTRIBUICAO = '+MontaSelect.ValoresChave[4]);
      qryAux2.SQL.Add('  AND  NUMRECEBIMENTO in ( '+sNumRecebimento+' ) ');
      qryAux2.SQL.Add('  AND  CODDOCUMENTOPREV = '+QuotedStr(qryAux.FieldByName('CODDOCUMENTOPREV').asstring));
      qryAux2.SQL.Add('  AND  H.IDMOTIVO     = '+QuotedStr(qryAux.FieldByName('IDMOTIVO').asstring));
      try
         if sNumRecebimento <> '' then
         qryAux2.Open;
      except
         bErro := true;
      end;
      sNumRecebimentoAux := '';
      while not(qryAux2.eof) do
      begin
         sNumRecebimentoAux := sNumRecebimentoAux + qryAux2.FieldByName('NUMRECEBIMENTO').asstring + ' - ';
         qryAux2.next;
      end;
      sNumRecebimentoAux := copy(sNumRecebimentoAux,1,length(sNumRecebimentoAux)-2);
      // se o campo plncodigo estiver preenchido ja foi contabilizado
      if  qryAux.FieldByName('CODDOCUMENTOPREV').asstring = '' then
      begin
         bErro :=  true;
         MmOcorrencia.Lines.Add('Erro: Código do documento Previdenciário não pode ser nulo. ' );
         MmOcorrencia.Lines.Add('NumRecebimento: '+sNumRecebimentoAux);
         qryAux.next;
         continue;
      end;

      if  (qryAux.FieldByName('VALORPARARESERVA').asstring = '0') then
      begin
         bErro :=  true;
         MmOcorrencia.Lines.Add('Erro: Valor da contribuição não pode ser zero. ');
         MmOcorrencia.Lines.Add('NumRecebimento: '+sNumRecebimentoAux);
         qryAux.next;
         continue;
      end;

      // se o campo valor da contribuicao for '0' não sera contabilizado o mesmo se aplica para  e
      // motivo
      qryAux2.Close;
      qryAux2.SQL.Clear;
      qryAux2.SQL.Add('SELECT nvl(M.Flgcontabiliza,0) As Flgcontabiliza, M.PLACONTAC, M.PLACONTAD, M.PLACONTADALT, M.PLACONTACALT ');
      qryAux2.SQL.Add('FROM   MOTIVO M ');
      qryAux2.SQL.Add('WHERE  M.IDMOTIVO     = '+qryAux.FieldByName('IDMOTIVO').asstring);
      try
         qryAux2.Open;
      except
         bErro := true;
      end;

      if qryAux2.FieldByName('Flgcontabiliza').asstring = '0' then
      begin
         bErro :=  true;
         MmOcorrencia.Lines.Add('Erro: Motivo '+qryAux.FieldByName('IDMOTIVO').asstring+' Não parametrizado para contabilizar. ');
         qryAux.next;
         continue;
      end
      else
      begin
         if (QryAux2.FieldByName('PLACONTAC').asstring = '') or (QryAux2.FieldByName('PLACONTAD').asstring = '') then
         begin
             MmOcorrencia.Lines.Add('Erro Conta Contabil não parametrizada para o Motivo '+qryAux.FieldByName('IDMOTIVO').asstring);
             qryAux.next;
             continue;
         end;
         if ((QryAux2.FieldByName('PLACONTACALT').asstring = '') or (QryAux2.FieldByName('PLACONTADALT').asstring = '')) and
            ((QryAux2.FieldByName('PLACONTACALT').asstring <> '') or (QryAux2.FieldByName('PLACONTADALT').asstring <> '')) then
         begin
             MmOcorrencia.Lines.Add('Erro na parametrização da conta contábil de alteradores para o Motivo '+qryAux.FieldByName('IDMOTIVO').asstring);
             qryAux.next;
             continue;
         end;
      end;
      sContaCredito    := qryAux2.FieldByName('PLACONTAC').asstring;
      sContaDebito     := qryAux2.FieldByName('PLACONTAD').asstring;
      sContaCreditoAlt := qryAux2.FieldByName('PLACONTADALT').asstring;
      sContaDebitoAlt  := qryAux2.FieldByName('PLACONTACALT').asstring;

      if (sContaCredito <> '') and (sContaDebito <> '') then
      begin
         qryContabil.Close;
         qryContabil.ParamByName('PLNCODIGO').AsInteger := -1;
         qryContabil.Open;

         FazerInsertContab(qryContabil,
                           sContaCredito,
                           '',
                           'C',
                           '2',
                           '5',
                           'Contabilização de contribuição.',
                           '',
                           '', '', '',
                           prmUnidNegoc,
                           0,
                           qryAux.FieldByName('VALORPARARESERVA').AsFloat,
                           0,
                           Date,
                           '',
                           qry.FieldByName('IDPESSJUR').AsInteger,
                           qry.FieldByName('IDPLANOPREV').AsInteger);

         sMsgErro := '';
         IncluiContabilidade(CtrlLancamento, qryContabil, iPlnCodigo, sMsgErro, sContaDebito);

         if iPlnCodigo < 0
         then begin
            bErro :=  true;
            sMsgErro := ' Erro na inclusão do lançamento na contabilidade : '+sMsgErro;
            MmOcorrencia.Lines.Add(sMsgErro);
         end
         else
         begin
            sNumRecebimentoAux := StringReplace(sNumRecebimentoAux,'-',',',[rfReplaceAll, rfIgnoreCase]);
            qryAux2.Close;
            qryAux2.SQL.Clear;
            qryAux2.SQL.Add(' UPDATE HSTCONTRIBPREV SET PLNCODIGO = ' + IntToStr(iPlnCodigo));
            qryAux2.SQL.Add('  WHERE NUMRECEBIMENTO in (' +sNumRecebimentoAux+' ) ');
            try
               if sNumRecebimentoAux <> '' then
               qryAux2.ExecSql;
            except
               bErro := true;
            end;

            if sSQLwhere ='' then begin
               sSQLwhere := 'AND ((H.CODDOCUMENTOPREV = '+QuotedStr(qryAux.FieldByName('CODDOCUMENTOPREV').asstring)+')';
            end else begin
              sSQLwhere := sSQLwhere + ' OR (H.CODDOCUMENTOPREV = '+QuotedStr(qryAux.FieldByName('CODDOCUMENTOPREV').asstring)+')';
            end;
            if qryAux.eof then
               sSQLwhere := sSQLwhere + ')';

         end;

      end;

      if (sContaCreditoAlt <> '') and (sContaDebitoAlt <> '') then
      begin


         qryvaloralterador.Close;
         qryvaloralterador.SQL.Clear;
         qryvaloralterador.SQL.Add(' SELECT CASE WHEN TMP.VALOR > 0 THEN TMP.VALOR ELSE TMP.VALOR * -1 END AS VALOR  ');
         qryvaloralterador.SQL.Add(' FROM ( SELECT (NVL(SUM(DECODE(FLGTIPO,''D'',NVL(H.VALOR,0))),0) - ');
         qryvaloralterador.SQL.Add(' NVL(SUM(DECODE(FLGTIPO,''A'',NVL(H.VALOR,0))),0)) AS VALOR FROM   HSTATRASOCONTRIB H ');
         qryvaloralterador.SQL.Add(' WHERE  (H.NUMRECEBIMENTO  IN ( '+sNumRecebimentoAux+' ) ) ');
         qryvaloralterador.SQL.Add('AND    (H.IDMOTIVO  = '+qryAux.FieldByName('IDMOTIVO').asstring +' ) )TMP ');
         try
            qryvaloralterador.Open;
         except
            bErro := true;
         end;

         qryContabil.Close;
         qryContabil.ParamByName('PLNCODIGO').AsInteger := -1;
         qryContabil.Open;

         FazerInsertContab(qryContabil,
                           sContaCreditoAlt,
                           '',
                           'C',
                           '2',
                           '5',
                           'Contabilização de contribuição.',
                           '',
                           '', '', '',
                           prmUnidNegoc,
                           0,
                           qryvaloralterador.FieldByName('VALOR').AsFloat,
                           0,
                           Date,
                           '',
                           qry.FieldByName('IDPESSJUR').AsInteger,
                           qry.FieldByName('IDPLANOPREV').AsInteger);

         sMsgErro := '';
         IncluiContabilidade(CtrlLancamento, qryContabil, iPlnCodigo, sMsgErro, sContaDebitoAlt);

         if iPlnCodigo < 0
         then begin
            bErro :=  true;
            sMsgErro := ' Erro na inclusão do lançamento na contabilidade : '+sMsgErro;
            MmOcorrencia.Lines.Add(sMsgErro);
         end
         else
         begin
            qryAux2.Close;
            qryAux2.SQL.Clear;
            qryAux2.SQL.Add(' UPDATE HSTATRASOCONTRIB SET PLNCODIGO = ' + IntToStr(iPlnCodigo));
            qryAux2.SQL.Add('  WHERE NUMRECEBIMENTO in (' +sNumRecebimentoAux+' ) ');
            try
               if sNumRecebimentoAux <> '' then
               qryAux2.ExecSql;
            except
               bErro := true;
            end;

            if sSQLwhere ='' then
            begin
               sSQLwhere := 'AND ((H.CODDOCUMENTOPREV = '+QuotedStr(qryAux.FieldByName('CODDOCUMENTOPREV').asstring)+')';

            end else
            begin
              sSQLwhere := sSQLwhere + ' OR (H.CODDOCUMENTOPREV = '+QuotedStr(qryAux.FieldByName('CODDOCUMENTOPREV').asstring)+')';
            end;
         end;

      end;

      qryAux.next;
   end;
   if sSQLwhere <> '' then
   begin
      sSQLwhere := sSQLwhere + ')'+#13+
                               ' AND H.NUMRECEBIMENTO in ('+sNumRecebimento+' ) ';
   end;
   if sSQLwhere <> '' then
   begin
      if not(bErro) then
      if MsgDlg('Deseja gerar PGA? ','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then
      begin
         sMsgErro := RealizaIntegracaoPGAIndiv('', CtrlDocumento, CtrlLancamento, '', sSQLwhere, 'CADHSTCONTRIBUICAO','',FALSE,'');
         if sMsgErro <> '' then
            bErro := true;
         MmOcorrencia.Lines.Add(sMsgErro);
      end;
   end
   else
   begin
      bErro := true;
      MmOcorrencia.Lines.Add('');
      MmOcorrencia.Lines.Add('ERRO na geração do PGA ');
      MmOcorrencia.Lines.Add('Nenhum Documento Selecionado. ');
      MmOcorrencia.Lines.Add('');
   end;


   if bErro then
   begin
      MmOcorrencia.Lines.Add('PROCESSO CONCLUIDO COM ERROS.');
      If dtmBaseDados.dbBaseDados.InTransaction Then
         dtmBaseDados.dbBaseDados.Rollback;
   end
   ELSE
   begin
      MmOcorrencia.Lines.Add('PROCESSO CONCLUIDO COM SUCESSO.');
      If dtmBaseDados.dbBaseDados.InTransaction Then
         dtmBaseDados.dbBaseDados.Commit;
   end;

   pgctrlDetalhe.ActivePage := TbsLog;
   tbcDetalhe.TabIndex := 1;
end;

procedure TfrmCadHstContribuicao.dbgrdDetDblClick(Sender: TObject);
begin
   If qryDet.FieldByName('CONTABILIZA').AsInteger > 0 Then
   Begin
     MsgDlg('Esta contribuição já foi Contabilizada.','Atenção',mtError,[mbOK],0);
     Exit;
   End;
   bErroValidacao := false;
   inherited;
   // xavier
   //qryDet.DisableControls;
   if not(bErroValidacao) then
   begin
     pnlControlesDet.visible := false;
     qryDet.edit;
     if qryDet.FieldByName('SELECIONA').asinteger = 1 then
     begin
        qryDet.FieldByName('SELECIONA').asinteger := 0;
        Dec(iHabBtContabiliza);
     end
     else
     begin
        qryDet.FieldByName('SELECIONA').asinteger := 1;
        Inc(iHabBtContabiliza);
     end;
     //qryDet.EnableControls;
     qryDet.Post;
     bbtnVoltarDet.onclick(self);
     pnlControlesDet.visible := true;
     BBtnContabiliza.Enabled := (iHabBtContabiliza > 0) ;
     // xavier
   end;
end;

procedure TfrmCadHstContribuicao.btnInverteClick(Sender: TObject);
begin
  inherited;
  MarcaDesmarca('INVERTE');
end;

procedure TfrmCadHstContribuicao.btnMarcaTodasClick(Sender: TObject);
begin
  inherited;
  MarcaDesmarca('TODAS');
end;

procedure TfrmCadHstContribuicao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil( CtrlDocumento );
  FreeAndNil( CtrlLancamento );
end;

procedure TfrmCadHstContribuicao.tbcDetalheChange(Sender: TObject);
begin
  if pgctrlDetalhe.ActivePage = tbsDet then
  begin
     pgctrlDetalhe.ActivePage := tbsLog;
     tbcDetalhe.TabIndex := 1;
  end
  else
  begin
     pgctrlDetalhe.ActivePage := tbsDet;
     tbcDetalhe.TabIndex := 0;
  end;
  //inherited;
end;

// Andre Imakawa - SIG 60728 - Inicio
procedure TfrmCadHstContribuicao.AtualizaULTMESPREPARO();
Var
  sMaiorMesReferencia : String;
begin
  if not(qry.IsEmpty) and not(qryDet.IsEmpty) then
  Begin
    Try    // ANdre Imakawa - SIG 90078
      With dtmaprev.qryAux do
       Begin
         Close;
         Sql.Clear;
         Sql.Add('SELECT MAX(MESREFERENCIA) AS MESREFERENCIA');
         Sql.Add('FROM HSTCONTRIBPREV');
         Sql.Add('WHERE IDPESSJUR      = '+qry.FieldByName('IdPessJur').AsString);
         Sql.Add('  AND IDPLANOPREV    = '+qry.FieldByName('IdPlanoPrev').AsString);
         Sql.Add('  AND IDPESSOA       = '+qry.FieldByName('IdPessoa').AsString);
         Sql.Add('  AND SUBSTR(MESREFERENCIA,6,2) <> '+QuotedStr('13'));
         Sql.Add('  AND IDCONTRIBUICAO = '+qry.FieldByName('IdContribuicao').AsString);
         Sql.Add('  AND NVL(IDTITULAR,IDPESSOA) = '+qry.FieldByName('IdTitular').AsString); // Andre Imakawa - SIG 60728
         Open;

         If Not IsEmpty
          Then sMaiorMesReferencia := FieldByName('MESREFERENCIA').AsString
          Else sMaiorMesReferencia := Trim(edAnoRef.Text)+'/'+Trim(edMesRef.Text);

         // Andre Imakawa - SIG 90078 - Inicio
         if not dtmBaseDados.dbBaseDados.inTransaction then
           dtmBaseDados.dbBaseDados.StartTransaction;
         // Andre Imakawa - SIG 90078 - Fim

         Close;
         Sql.Clear;
         Sql.Add('UPDATE CONTRIBPREVPARTP');
         Sql.Add('SET ULTMESPREPARO = '+QuotedStr(sMaiorMesReferencia));
         Sql.Add('WHERE IDPESSJUR      = '+qry.FieldByName('IdPessJur').AsString);
         Sql.Add('  AND IDPLANOPREV    = '+qry.FieldByName('IdPlanoPrev').AsString);
         Sql.Add('  AND IDPESSOA       = '+qry.FieldByName('IdPessoa').AsString);
         Sql.Add('  AND IDCONTRIBUICAO = '+qry.FieldByName('IdContribuicao').AsString);
         ExecSQL;

         // Andre Imakawa - SIG 90078 - Inicio
         if dtmBaseDados.dbBaseDados.inTransaction then
           dtmBaseDados.dbBaseDados.commit;
         // Andre Imakawa - SIG 90078 - Fim

       end;
    except
      // Andre Imakawa - SIG 90078 - Inicio
      if dtmBaseDados.dbBaseDados.inTransaction then
        dtmBaseDados.dbBaseDados.Rollback;
      // Andre Imakawa - SIG 90078 - Fim
    end;
  end;
end;
// Andre Imakawa - SIG 60728 - Fim

//SIG91445 -Inicio
procedure TfrmCadHstContribuicao.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;

  bArqImportado:= False;
end;

procedure TfrmCadHstContribuicao.FinalizaImportacao(btn: TBitbtn);
begin
  try
    try
      if (btn = bbtnConfirmar) then
        begin
           CommitTransacao;
        end
      else begin
         RollBackTransacao;
      end;
      btn.Enabled         := False;
      bbtnCancelar.Enabled:= False;
    except on e: exception do
      raise exception.create('Erro concluir transação: '+ e.message);
    end;
  finally
    bArqImportado:= btn.Enabled;
  end;
end;
//SIG91445 -Fim

//Ewerton Beltramini - SIG95907 - Inicio....................................................
procedure TfrmCadHstContribuicao.btnExcluirArquivoClick(Sender: TObject);
var sTotal : string;
begin
  inherited;

     if Trim(MemoDescricao.text) = '' then
     begin
          MsgDlg( 'Para realizar a exclusão é necessário primeiramente selecionar uma importação!','Confirmação' ,mtConfirmation,[mbOk],0);
          abort;
     end;

     //Verificando os registros e contando...
     QryImpAux.Close;
     QryImpAux.sql.clear;
     QryImpAux.sql.add('select count(*) as total from CM.HSTCONTRIBPREV' );
     QryImpAux.sql.add('where idimportacaohstcontrib = ' + QryExcluirArquivo.FieldByName('id').AsString );
     QryImpAux.sql.add('and flgcalcreserva = 0');
     QryImpAux.open;
     sTotal :=  QryImpAux.FieldByName('total').AsString;

     if sTotal = '0' then
     begin
          MsgDlg( 'Não é possivél excluir a importação selecionada!' + #13 +
                  'Todas as contribuições desta importação já foram alimentadas.','Confirmação' ,mtConfirmation,[mbYes],0);
          abort;
     end;

     if MsgDlg('Atenção! Deseja realmente excluir a importação selecionada: ' + #13
             + 'Usuário: ' + QryExcluirArquivo.FieldByName('NomeUsuario').AsString + #13
             + 'Data: ' + QryExcluirArquivo.FieldByName('data').AsString + #13
             + 'Descição: ' + QryExcluirArquivo.FieldByName('descricao').AsString + #13
             + 'Total de Registros: ' + sTotal
             ,'Confirmação' ,mtConfirmation,[mbYes,mbNo],0) = mrNo then
        abort;

     try
               //Apagando os registros importados...
               QryImpAux.Close;
               QryImpAux.sql.clear;
               QryImpAux.sql.add('delete CM.HSTCONTRIBPREV' );
               QryImpAux.sql.add('where idimportacaohstcontrib = ' + QryExcluirArquivo.FieldByName('id').AsString );
               QryImpAux.sql.add('and flgcalcreserva = 0');
               QryImpAux.execSql;

               //Apagando o registro de importação...
               QryImpAux.Close;
               QryImpAux.sql.clear;
               QryImpAux.sql.add('delete cm.importacaohstcontrib ');
               QryImpAux.sql.add('where id = ' + QryExcluirArquivo.FieldByName('id').AsString );
               QryImpAux.sql.add('and idusuario = ' + QryExcluirArquivo.FieldByName('idusuario').AsString );
               QryImpAux.sql.add('and data = ' + QuotedStr(QryExcluirArquivo.FieldByName('data').AsString));
               QryImpAux.sql.add('and descricao = ' + QuotedStr(QryExcluirArquivo.FieldByName('descricao').AsString) );
               QryImpAux.execSql;

               MsgDlg('Registro(s) apagado(s) com exito!','Confirmação' ,mtConfirmation,[mbok],0);

              dtmBaseDados.dbBaseDados.Commit;
      except;
              dtmBaseDados.dbBaseDados.Rollback;
      end;

     QryExcluirArquivo.Close;
     QryExcluirArquivo.Open;

     EdtUsuario.Text    := '';
     EdtData.Text       := '';
     MemoDescricao.Text := '';

end;
//Ewerton Beltramini - SIG95907 Fim..........................................................

//Bolabloa Inicio.......................................................
procedure TfrmCadHstContribuicao.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  inherited;
  bnavegador:= True;
  MemoDescricao.Text := QryExcluirArquivo.FieldByName('descricao').AsString;
  EdtUsuario.Text    := QryExcluirArquivo.FieldByName('nomeusuario').AsString;
  EdtData.Text       := QryExcluirArquivo.FieldByName('data').AsString;

end;
//BolaBloa Fim..........................................................

//Ewerton Beltramini - SIG95907 Inicio.......................................................
procedure TfrmCadHstContribuicao.MemoDescricaoChange(Sender: TObject);
begin
  inherited;

  if (bnavegador = false) then
  begin
        EdtUsuario.Text    := '';
        EdtData.Text       := '';
  end;
  bnavegador := false;

end;
//Ewerton Beltramini - SIG95907 Fim..........................................................

//Ewerton Beltramini - SIG95907 Inicio.......................................................
procedure TfrmCadHstContribuicao.btnPesquisarExcluirArqClick(
  Sender: TObject);
var
   sTexto: String;
begin
  inherited;

  sTexto := trim(MemoDescricao.Text);

  if (bnavegador = false) then
  begin
        EdtUsuario.Text    := '';
        EdtData.Text       := '';

        if ( length(sTexto) >= 1 ) then
        begin
              QryExcluirArquivo.Close;
              QryExcluirArquivo.SQL[3] := 'and upper(ih.descricao) like upper(' + QuotedStr('%' + sTexto + '%') + ')' ;
              if  sIdGrupo <> '822' then
                  QryExcluirArquivo.SQL[4] := 'and ih.idusuario in  (select gg.idusuario from GrupoUsu gg where gg.idgrupo = ' + sIdGrupo+ ')';
              
              QryExcluirArquivo.Open;

              if trim(QryExcluirArquivo.FieldByName('descricao').AsString) = '' then
              begin
                   MsgDlg('Nenhum registro encontrado com a descrição informada!' + #13 + '--> (' + sTexto + ')','Confirmação' ,mtConfirmation,[mbok],0);
                   QryExcluirArquivo.Close;
                   QryExcluirArquivo.SQL[3] := '';
                   QryExcluirArquivo.Open;
              end;

              MemoDescricao.Text := QryExcluirArquivo.FieldByName('descricao').AsString;
              EdtUsuario.Text    := QryExcluirArquivo.FieldByName('nomeusuario').AsString;
              EdtData.Text       := QryExcluirArquivo.FieldByName('data').AsString;
        end;
  end;
  bnavegador := false;

end;
//Ewerton Beltramini - SIG95907 Fim..................................................................

ENd.



