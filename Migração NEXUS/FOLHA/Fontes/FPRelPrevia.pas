// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//--------------------------------------------------------------------------------
//Pendência   : WO3905
//Responsável : Helen V Bianchi
//Data        : 19/12/2023
//Descrição   : Ajuste quando recebedor é um terceiro sendo este pessoa juridica
//--------------------------------------------------------------------------------
//Pendência   : SIG125110
//Responsável : André Imakawa
//Data        : 02/05/2022
//Observaçao  : Andre Imakawa
//Descrição   : Quando passado IDLOTE não fazer tratamento com a descrição do Lote.
//--------------------------------------------------------------------------------
//Pendência   : SIG86157
//Responsável : André Imakawa
//Data        : 16/05/2019
//Observaçao  : Andre Imakawa
//Descrição   : Alterado MontaQueryMestre para tratar idresponsavelanterior conforme
//              utilização de lista individual.
//--------------------------------------------------------------------------------
//Pendência   : SIG44460
//Responsável : Peterson Victor
//Data        : 25/04/2017
//Observaçao  : Peterson Victor
//Descrição   : Alteração do agrupamento da query principal do relatorio
//--------------------------------------------------------------------------------
//Pendência   : SOL 215474 KINTANA 2044700
//Responsável : Fernando Xavier
//Data        : 11/09/2013
//Observaçao  : Desenvolvido em BSB.
//Descrição   : Alteração da regra de negocio para exibição do relatorio com base
//              na informação passada pelo usuario.
//--------------------------------------------------------------------------------
//Pendência   : SOL 215474 KINTANA 2044700
//Responsável : Marcio Sanches Spinosa SOL 215474 KINTANA 2044700
//Data        : 13/06/2013
//Descrição   : Ajuste no filtro da query e validações de campos para montagem do
//              relatorio.
//--------------------------------------------------------------------------------
//Pendência   : SOL 185038 KINTANA 1812976
//Responsável : Marcio Sanches Spinosa SOL 185038 KINTANA 1812976
//Data        : 13/06/2013
//Descrição   : Ajuste no filtro da query e validações de campos para montagem do
//              relatorio.
//--------------------------------------------------------------------------------
//Pendência   : SOL 185038 KINTANA 1812976
//Responsável : Higor Nayde Ferreira
//Data        : 05/11/2012
//Descrição   : Erro ao selecionar grupo familiar, o mesmo nao incluia membros
//              do grupo que pertenciao a outro plano.
//--------------------------------------------------------------------------------
//Pendência   : SOL 147567 KINTANA 1022979
//Responsável : Fernando Xavier
//Data        : 16/11/2010
//Descrição   : Erro nas informações de conferência da Previa.
//--------------------------------------------------------------------------------
//Pendência   : SOL 147391 KINTANA 1019719
//Responsável : BRUNO AZEVEDO
//Data        : 10/11/2010
//Descrição   : Erro na visualização da Prévia.
//--------------------------------------------------------------------------------
//Pendência   : SOL 145036 KINTANA 970354
//Responsável : Fernando Xavier
//Data        : 13/10/2010
//Descrição   : Senhores, Os relatórios da Prévia, Efetivação, Conferência 
//              PREVIA devem pegar os dados da conta bancária do histórico 
//              e não da situação cadastral. 
//--------------------------------------------------------------------------------
//Pendência   : SOL 143022 KINTANA 927497
//Responsável : BRUNO AZEVEDO
//Data        : 14/09/2010
//Descrição   : Adicionado a conta contabil no relatório da folha de benefícios.
//--------------------------------------------------------------------------------
//Pendência   : SOL 141143 KINTANA 905094
//Responsável : BRUNO AZEVEDO
//Data        : 19/08/2010
//Descrição   : Trazer apenas 1 plano por titular.
//--------------------------------------------------------------------------------
//Pendência   : SOL 139176 KINTANA 852660
//Responsável : BRUNO AZEVEDO
//Data        : 05/07/2010
//Descrição   : Adicionado na query principal informações de portabilidade.
//--------------------------------------------------------------------------------
//Pendência   : SOL 136490 KINTANA 817135
//Responsável : BRUNO AZEVEDO
//Data        : 25/05/2010
//Descrição   : Alteração na query principal do relatório. 
//--------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Data        : 19/05/2010
// Pendencia   : SOL 136167 Kintana 813322
// Alteração   : No relatório Folha de Benefícios (CONSULTAS/RELATÓRIOS/OPERACIONAIS/FOLHA DE BENEFÍCIOS)
//              A cunsulta está aparecendo em duplicidade para os casas que possuem rubricas em dois planos.
//------------------------------------------------------------------------------
// Autor(a)    : Daniel Begnami
// Rotina      : Diversas
// Data        : 09/06/2009
// Pendencia   : SOL 119584 Kintana 569852
// Alteração   : Todos os lugares onde existe FLGDESATIVADO = 0 adicionar 1 tambem
//------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Rotina      : rbtnvisualizarClick
// Data        : 27/05/2009
// Pendencia   : SOL 117953 Kintana 559710
// Alteração   : Não estava informando os participantes que estão recebendo
// pagamento de Resgate, devido ao FLGDESATIVADO = 1,trocamos o AND pelo OR
// na sql do relatorio.
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Rotina      : MontaQryMasterAgrupado, MontaQryMaster
// Data        : 06/05/2008
// Pendencia   : 27838
// Alteração   : Ajuste na rotina que gera a consulta de Prévia e histórico de pagamento.
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Rotina      : MontaQryMasterAgrupado, MontaQryMaster
// Data        : 19/02/2008
// Pendencia   : 27819
// Alteração   : Ajuste na query da Consulta da prévia.
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 03/12/2007
// Rotina      : MontaQueryMestre, MontaQueryDetalhe
// Pendência   : 26942
// Descricao   : Ajuste na duplciação das informações do relatorio
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Rotina      : MontaQryMaster e MontaQryMasterAgrupado
// Data        : 07/11/2007
// Pendencia   : 26800
// Alteração   : Ajustar a consulta para mostrar o favorecido qdo EPP.
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 23/08/2007
// Rotina      : MontaQueryMestre, MontaQueryDetalhe
// Pendência   : 26150
// Descricao   : Ajuste na duplciação das informações do relatorio
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 09/04/2007
// Rotina      : MontaQueryDetalhe
// Pendência   : 14769
// Descricao   : Permite agrupar valores das rubricas
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 09/03/2007
// Rotina      : MontaQryBenef
// Pendência   : 24679
// Descricao   : Trata casos da não existência do benefício fundação. Estes casos
//   tem apenas benefício de INSS.
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 06/11/2006
// Pendência   : 21921
// Descricao   : Inclir no relatório a Opção de Tributação
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 20/09/2006
// Rotina      : Diversas
// Pendência   : 23361
// Descricao   : Retirar RULE de consultas.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 05/09/2006
// Rotina      : MontaQryBenef
// Pendência   : 23099 (reabertura)
// Descricao   : Considerar também lote de folha de pagamento pendente.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 26/08/2006
// Rotina      : MontaQryBenef
// Pendência   : 23099
// Descricao   : No caso de lote ou versão de Folha Extra a qryBenef deve ser
//  alterada pois não precisa aparece.
//------------------------------------------------------------------------------
unit FPRelPrevia;

interface

uses
  Windows     , Messages, SysUtils, Classes    , Graphics, Controls, Forms   ,
  FCMParamRel , MAHlpBtn, StdCtrls, Buttons    , cmRepBtn, ExtCtrls, Db      ,
  DBTables    , Wwquery , checklst, Spin       , wwdblook, TB97    , ComCtrls,
  IvDictio    , IvMulti , IvEMulti, MontaSelect, uSistema, Wwdatsrc,
  FOkCancelar ,  Dialogs, TB97Tlbr, Menus, uobjfolha, dbasedados,
  fFrameLista, uConstFolha;

type
  TfrmPRelPREVIA = class(TfrmOkCancelar)
    qrymotivo            : TwwQuery;
    ToolbarSep972        : TToolbarSep97;
    MontaSelectBenef     : TMontaSelect;
    qryAux: TwwQuery;
    qryHistorico         : TwwQuery;
    qryCount             : TwwQuery;
    PageControl1         : TPageControl;
    qryLote: TwwQuery;
    qryPlano: TwwQuery;
    qryBeneficio: TwwQuery;
    qryPatro: TwwQuery;
    qryConverte: TwwQuery;
    qryBeneficiario: TwwQuery;
    Label10: TLabel;
    Label11: TLabel;
    PageControl2: TPageControl;
    tbsOpcoes: TTabSheet;
    pnlInformacoes: TPanel;
    grpEfet: TGroupBox;
    lblhistorico: TLabel;
    blkcmpHistorico: TwwDBLookupCombo;
    grpPrevia: TGroupBox;
    Label17: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    cmbMes: TComboBox;
    spedAno: TSpinEdit;
    rbManutencao: TCheckBox;
    rbConcessao: TCheckBox;
    dblkpcmbLote: TwwDBLookupCombo;
    GroupBox1: TGroupBox;
    Label22: TLabel;
    Label1: TLabel;
    dblkpcmbmotivo: TwwDBLookupCombo;
    GroupBox3: TGroupBox;
    ChkAgrupa: TCheckBox;
    grpTipoFolha: TRadioGroup;
    GroupBox2: TGroupBox;
    chk1: TCheckBox;
    chk2: TCheckBox;
    Panel1: TPanel;
    GroupBox5: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Bevel2: TBevel;
    Label12: TLabel;
    Label14: TLabel;
    edBeneficiario: TEdit;
    cmbBeneficiario: TwwDBLookupCombo;
    edMatricula: TEdit;
    edTitular: TEdit;
    edNumInscr: TEdit;
    bbtnProcurar: TBitBtn;
    BitBtn1: TBitBtn;
    cboxEspecifico: TCheckBox;
    edMatriculaDep: TEdit;
    edDependente: TEdit;
    bbtnProcurarDep: TBitBtn;
    gboxGenerico: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    cmbPatro: TwwDBLookupCombo;
    cmbPlano: TwwDBLookupCombo;
    cmbBeneficio: TwwDBLookupCombo;
    cboxGenerico: TCheckBox;
    GroupBox6: TGroupBox;
    cmbOrdem: TComboBox;
    tbsIndividual: TTabSheet;
    frameBenef: TfrmFrameListaBenef;
    cboxIndividual: TCheckBox;
    ckbAgrupaRubrica: TCheckBox;
    Chktrarubresgate: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure bbtnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rbtnvisualizarClick(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure blkcmpHistoricoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure grpTipoFolhaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edMatriculaChange(Sender: TObject);
    procedure edNumInscrChange(Sender: TObject);
    procedure cboxEspecificoClick(Sender: TObject);
    procedure cboxGenericoClick(Sender: TObject);
    procedure cmbMesChange(Sender: TObject);
    procedure spedAnoChange(Sender: TObject);
    procedure cmbBeneficioCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure edBeneficiarioChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnProcurarDepClick(Sender: TObject);
    procedure cboxIndividualClick(Sender: TObject);
  private
    bFaz : Boolean;
    sTabela: String;
    sIDTITULAR : String;
    sidlote,
    sIdHstFolhaBenef: string;
    Function fTotLinhas(sArquivo : String) : Integer;
    Function VerificaDados: Boolean;
    procedure MontaQueryMestre(Tabela: String);
    procedure MontaQueryDetalhe;
    procedure MontaQueryTotal;
    Procedure MontaQryBenef;
    Procedure MontaQryMatricBenef;
    procedure MontaQryRubricaIndiv;
    procedure MontaQryAcaoJudicial;

    function MontaQueryProgressivaRegressiva() : string; //Marcio Sanches Spinosa SOL 215474 KINTANA 2044700
  public
    sIdPessoa   , sIdPessJur, sIdPlanoPrev, sMesRef    : String;
    sIdBeneficio, strPatro  , strPlano    , sIdRubrica : String;
  end;

var
  frmPRelPREVIA : TfrmPRelPREVIA;

implementation

uses
  UMensErro, UFuncoesFolha, uFuncoesUteis, dPREVIA, fAguarde,
  uFolhaBenef, ppClass;

{$R *.DFM}

procedure TfrmPRelPREVIA.MontaQueryMestre(Tabela: String);
Var
  sSql: String;
Begin
  {* * * OBSERVAÇÕES * * *
  - Para fazer o filtro por benefício deve-se utilizar a tabela hstbenefbfciario:
  efetuar join com idtitular, idplanoprev, idpessjur, idmotivo, mes;
  filtrar idbeneficio na tabela hstbenefbfciario;
  Para a previa pode-se ir direto na tabela, pois possui o campo idbeneficio;
  - Para funcionar um rel. do tipo mestre/detalhe construído em runtime, deve-se
  desponteirar o datasource da qryDetalhe, pois o link do relacionamento ainda não
  foi definido ao montar a qryMestre e, ao terminar a mesma, este procura o link
  no detalhe pelo datasource, que não foi definido ainda.
  }

  dtmPREVIA.sTipoFolha := sTabela;
  dtmprevia.qryDetalhe.DataSource := nil;
  // Código da qry Master.

   //Higor Nayde Ferreira SOL 185038 KINTANA 1812976 Inicio
  IF not cboxIndividual.checked then
  begin
  sSql :=
          'SELECT DISTINCT TMP.NADA,'+
          '        TMP.IDRESPONSAVEL,'+
////Marcio Sanches Spinosa SOL 215474 KINTANA 2044700 - Inicio
          '        TMP.TIPOOPCAOIR, ' +
//          '        CASE WHEN (TMP.IDRESPONSAVEL = TMP.ProximoIDRESPONSAVEL) AND (TMP.TIPOOPCAO <> TMP.ProximoTIPOOPCAOIR)'+
//          '          THEN'+
//          '           TMP.TIPOOPCAO||''/''||TMP.ProximoTIPOOPCAOIR'+
//          '        ELSE   '+
////          '           TMP.TIPOOPCAO'+     //MARCIO SANCHES SPINOSA - SOL 185038 KINTANA 1812976
//          '           NULL '+       //MARCIO SANCHES SPINOSA - SOL 185038 KINTANA 1812976
//          '        END  AS TIPOOPCAOIR, '+
//          ' CASE WHEN  QTDE > 0  THEN ' +
//          '     CASE '+
//          '       WHEN (TMP.IDRESPONSAVEL = TMP.ProximoIDRESPONSAVEL) AND '+
//          '            (TMP.TIPOOPCAO <> TMP.ProximoTIPOOPCAOIR) THEN '+
//           '       TMP.TIPOOPCAO || ''/'' || TMP.ProximoTIPOOPCAOIR '+
//           '      ELSE ' +
//           '      TMP.TIPOOPCAO '+
//           '    END ' +
//           ' ELSE '+
//           '  ''Progressiva'' ' +
//           ' END AS TIPOOPCAOIR, ' +
 ////Marcio Sanches Spinosa SOL 215474 KINTANA 2044700 - Fim
          '  TMP.IDTITULAR,            '+
          '  TMP.PATRO,                '+
          '  TMP.IDPATRO,              '+
          '  TMP.IDPLANOPREV,          '+
          '  TMP.PLANO,                '+
          '  TMP.CPF,                  '+
          '  TMP.RESPONSAVEL,          '+
          '  TMP.TITULAR,              '+
          '  TMP.EPP,                  '+
          '  TMP.MESCOBRANCA,          '+
          '  TMP.FLGISENTOIRRF,        '+
          '  TMP.DATANASC,             '+
          '  TMP.FLGSOMAIRSUPINSS,     '+
          '  TMP.FLGFAZDEPOSITO,       '+
          '  TMP.NUMDEPIRRF,           '+
   //       '  TMP.INSCRICAONUMERO,      '+ // Peterson Victor SIG44460
          '  TMP.MATRICULA,            '+
          '  TMP.MATDEP,               '+
          '  TMP.CODPORTFORMA,         '+
          '  TMP.CONTACORRENTE,        '+
          '  TMP.NUMBANCO,             '+
          '  TMP.NUMAGENCIA,           '+
          '  TMP.BANCO,                ';
//Marcio Sanches Spinosa SOL 215474 KINTANA 2044700 - Inicio
//    if dblkpcmbLote.text = '' then
//      sSQL := sSQL + ' 0 as IDLOTE,               '
//    else
//Marcio Sanches Spinosa SOL 215474 KINTANA 2044700 - Fim
      sSQL := sSQL + 'TMP.IDLOTE,               ';
      sSQL := sSQL +    '  TMP.rank   '+
          ' FROM(';

  //BRUNO AZEVEDO SOL 141143 KINTANA 905094
sSQL := sSQL +  'SELECT NADA,                                 '+
                '       IDRESPONSAVEL,                        '+
//Marcio Sanches Spinosa SOL 215474 KINTANA 2044700 - Inicio
//                'DECODE(lead(IDRESPONSAVEL)'+
//                '                       over(ORDER BY DATANASC, TIPOOPCAOIR),'+
//                '                       NULL,'+
//                '                       IDRESPONSAVEL,'+
//                '                       lead(IDRESPONSAVEL)'+
//                '                       over(ORDER BY DATANASC, TIPOOPCAOIR)) ProximoIDRESPONSAVEL,'+
//                '                DECODE(LAG(IDRESPONSAVEL)'+
//                '                       over(ORDER BY DATANASC, TIPOOPCAOIR),'+
//                '                       NULL,'+
//                '                       IDRESPONSAVEL,'+
//                '                       LAG(IDRESPONSAVEL)'+
//                '                       over(ORDER BY DATANASC, TIPOOPCAOIR)) ANTERIORIDRESPONSAVEL,  '+
//                '                TIPOOPCAOIR as TIPOOPCAO,'+
//                '                DECODE(lead(TIPOOPCAOIR)'+
//                '                       over(ORDER BY DATANASC, TIPOOPCAOIR),'+
//                '                       NULL,'+
//                '                       TIPOOPCAOIR,'+
//                '                       lead(TIPOOPCAOIR)'+
//                '                       over(ORDER BY DATANASC, TIPOOPCAOIR)) ProximoTIPOOPCAOIR,'+
//Marcio Sanches Spinosa SOL 215474 KINTANA 2044700 - Fim
                'LAG(IDRESPONSAVEL) over(ORDER BY idtitular, IDRESPONSAVEL, DATANASC, TIPOOPCAOIR) ANTERIORIDRESPONSAVEL,'+ // Andre Imakawa - SIG 86157
                '       TIPOOPCAOIR,                          '+
                '       IDTITULAR,                            '+
                '       PATRO,                                '+
                '       IDPATRO,                              '+
                '       IDPLANOPREV,                          '+
                '       PLANO,                                '+
                '       CPF,                                  '+
                '       RESPONSAVEL,                          '+
                '       TITULAR,                              '+
                '       EPP,                                  '+
                '       MESCOBRANCA,                          '+
                '       FLGISENTOIRRF,                        '+
                '       DATANASC,                             '+
                '       FLGSOMAIRSUPINSS,                     '+
                '       FLGFAZDEPOSITO,                       '+
                '       NUMDEPIRRF,                           '+
                '       INSCRICAONUMERO,                      '+
                '       MATRICULA,                            '+
                '       MATDEP,                               '+
                '       CODPORTFORMA,                         '+
                '       CONTACORRENTE,                        '+
                '       NUMBANCO,                             '+
                '       NUMAGENCIA,                           '+
//                '       QTDE,                                 '+ //Marcio Sanches Spinosa SOL 215474 KINTANA 2044700
                '       BANCO,                                ';

                if sTabela = 'HISTRUBSAL' then
                  sSQL := sSQL +'        IDHSTFOLHABENEF AS IDLOTE, '
                else
                  sSQL := sSQL +'        IDLOTE, ';

                sSQL := sSQL +
                '       rank FROM (                           '+
                //BRUNO AZEVEDO SOL 141143 KINTANA 905094


' SELECT DISTINCT 1 AS NADA,                  '+
'        H.IDRESPONSAVEL,                     '+
'        H.IDTITULAR,                         '+
'        PAT.NOME AS PATRO,                   '+
'        H.IDPATRO,                           '+
'        H.IDPLANOPREV,                       '+
'        PL.NOME AS PLANO,                    '+
'        RESP.NUMDOCUMENTO AS CPF,            '+ 
'        RESP.NOME AS RESPONSAVEL,            '+
'        TIT.NOME AS TITULAR,                 '+
'        EPP.NOME AS EPP,                     '+ //CPrev - 26800
'        H.MESCOBRANCA,                       '+
'        DECODE(PF.FLGISENTOIRRF,1,''Sim'',''Não'') AS FLGISENTOIRRF, '+ 
'        PF.DATANASC,                         '+
'        DECODE(PF.FLGSOMAIRSUPINSS,1,''Sim'',''Não'') AS FLGSOMAIRSUPINSS, '+
'        DECODE(PCJ.FLGFAZDEPOSITO,1,''Sim'',''Não'') AS FLGFAZDEPOSITO,       '+
'        PF.NUMDEPIRRF,                       '+
'        PPP.INSCRICAONUMERO,                 '+
'        EL.MATRICULA,                        '+
'        DP.MATRICULA AS MATDEP, '+
'        H.CODPORTFORMA                       ';
  // preenche com o campo-chave de acordo com a tabela HISTRUBSAL
  if sTabela = 'HISTRUBSAL' then
    sSQL := sSQL +'        ,H.IDHSTFOLHABENEF '
  else
    sSQL := sSQL +'         ,H.IDLOTE ';

// sSQL := sSQL + ' , DECODE(PPP.TIPOOPCAOIR, ''2'', ''Regressiva'', ''Progressiva'') AS TIPOOPCAOIR, ';


   sSql := ssql + ', ' +  MontaQueryProgressivaRegressiva;////Marcio Sanches Spinosa SOL 215474 KINTANA 2044700
// SSQL := SSQL + ' ( ' +
//                '                   SELECT COUNT(1) AS QTDE FROM PARTPREVPLAN H ' +
//                '                   WHERE H.IDPESSOA = PPP.IDPESSOA '+
//                '                   AND   H.IDPLANOPREV  = PPP.IDPLANOPREV '+
//                '                   GROUP BY H.TIPOOPCAOIR HAVING COUNT(1) > 1 ) AS QTDE, ';
 sSQL := sSQL + ' H.CONTACORRENTE, H.NUMBANCO, H.NUMAGENCIA ,PE.NOME BANCO ';   // SOL 145036 KINTANA 970354

 //BRUNO AZEVEDO SOL 141143 KINTANA 905094
  sSQL := sSQL + ' , ( RANK() over(PARTITION BY H.idtitular , PF.DATANASC ORDER BY H.idplanoprev)) rank   ';

sSQL := sSQL +
' FROM '+sTabela+' H, '+
' PESSOAFISICA PF, '+
' ELEGPATRO EL, '+
' PARTPREVPLAN PPP, '+
' PLANPREV PL, '+
' PESSOA RESP, '+
' PROCJUD PCJ, '+
' PESSOA TIT, '+
' PESSOA EPP,  '+ //CPrev - 26800
' DEPENTIT DP, '+
' PESSOA PAT,  '+
' CONTABANCARIA  CC,  '+
' AGENCIABANCARIA AG, '+
' PESSOA PE    ';

if sTabela = 'HISTRUBSAL' then begin
  sSQL := sSQL + ', hstfolhabenef hsT ';
end else begin
  sSQL := sSQL + ', CTRLINTERFACE CT ';
end;

  if cmbBeneficio.text <> '' then
  begin
    if sTabela = 'HISTRUBSAL' then
      sSQL := sSQL + ' ,HSTBENEFBFCIARIO BNF  '
    else
      sSQL := sSQL + ' ,BENEFBFCIARIO BNF  ';
  end;

  //Filtra o tipo de folha (PREVIA HISTRUBSAL) (A Prévia pode ser por Lote ou AnoMês)
  if grpTipoFolha.ItemIndex = 0 then
  begin
    if dblkpcmbLote.text <> '' then
      sSQL := sSQL + ' WHERE H.IDLOTE = '+qryLote.FieldByName('IDLOTE').AsString+' '
    else if cmbMes.text <> '' then
      sSQL := sSQL + ' WHERE H.MESCOBRANCA = '+QuotedStr(sMesRef)+' '
    else 
      sSQL := sSQL + ' WHERE 1 = 1';
  end
  else
    sSQL := sSQL + ' WHERE H.IDHSTFOLHABENEF = '+qryHistorico.FieldByName('IDHSTFOLHABENEF').AsString+' ';

  if cmbPatro.Text <> '' then
    sSQL := sSQL + ' AND H.IDPATRO = '+qryPatro.FieldByName('IDPESSOA').AsString+' ';

  if cmbPlano.Text <> ''then
    sSQL := sSQL + ' AND H.IDPLANOPREV = '+qryPlano.FieldByName('IDPLANOPREV').AsString+' ';

  if cmbBeneficio.Text <> '' then // Independe da tabela.
    sSQL := sSQL + ' AND BNF.IDBENEFICIO = '+qryBeneficio.FieldByName('IDBENEFICIO').AsString+' ';

    if cboxIndividual.Checked then
      ssql:=ssql+'AND EXISTS (SELECT 1 '+
                             'FROM LISTAFOLHABENEFDET LD '+
                             'WHERE H.IDTITULAR = LD.IDTITULAR '+
                             'AND LD.IDLISTA = '+inttostr(frameBenef.ListaUsuario)+') '
    else
      if (sIdTitular <> '') then
        ssql:=ssql+' AND (H.IDTITULAR    = '+sIdTitular+') ';

        //BRUNO AZEVEDO SOL 136490 KINTANA 817135
        if sTabela = 'HISTRUBSAL' then begin
          sSQL := sSQL + ' AND H.IDHSTFOLHABENEF = '+qryHistorico.FieldByName('IDHSTFOLHABENEF').AsString+' ' +
                         ' AND (PL.IDPLANOPREV = H.IDPLANOPREV) ' +
                        // ' AND (PF.IDPESSOA = H.IDRESPONSAVEL) ' + WO3905 - Helen V Bianchi
                         ' AND (PF.IDPESSOA(+ ) = H.IDRESPONSAVEL) ' +
                         ' AND (RESP.IDPESSOA = H.IDRESPONSAVEL) ' +
                         ' AND (TIT.IDPESSOA = H.IDTITULAR) ' +
                         ' AND (EPP.IDPESSOA = NVL(H.IDRECEBEPGTO, H.IDRESPONSAVEL)) ' +
                         ' AND (PPP.IDPESSOA = H.IDTITULAR) ' +
                         ' AND (PPP.IDPESSJUR = H.IDPATRO) ' +
                         ' AND (((H.IDPLANOPREV = PPP.IDPLANOPREV) AND ' +
                         '     (H.IDRESPONSAVEL = H.IDTITULAR)) OR ' +
                         '     ((H.IDPLANOORIGEM = PPP.IDPLANOPREV) AND ' +
                         '     (H.IDRESPONSAVEL <> H.IDTITULAR))) ' +
                         ' AND (EL.IDPESSOA = H.IDTITULAR) ' +
                         ' AND (PF.IDPESSOA = PCJ.IDPESSOA(+)) ' +
                         ' AND (DP.IDTITULAR(+) = H.IDTITULAR) ' +
                         ' AND (DP.IDPESSOA(+) = H.IDRESPONSAVEL) ' +
                         ' AND (EL.IDPESSJUR = H.IDPATRO) ' +
                         ' AND (PAT.IDPESSOA = H.IDPATRO) ' +
                         ' AND (H.IDPESSOA = CC.IDPESSOA(+)) '+           //SOL 147391 KINTANA 1019719
                         ' AND (H.CONTACORRENTE = CC.CONTACORRENTE(+)) '+ //SOL 145036 KINTANA 970354
                         ' AND (CC.IDAGENCIA = AG.IDPESSOA(+)) '+         //SOL 147391 KINTANA 1019719
//						 ' AND (PPP.DATACANCELAMENTO IS NULL) ' +
                         ' AND (AG.IDBANCO = PE.IDPESSOA(+)) '+           //SOL 147391 KINTANA 1019719

                         ' AND h.idhstfolhabenef = HST.IDHSTFOLHABENEF ' +
                         //BRUNO AZEVEDO SOL 139176 KINTANA 852660
                         //ADICIONADO OR UPPER(HST.HISTORICO) LIKE ''%PORT%''
                         ' AND (UPPER(HST.HISTORICO) LIKE ''%ADT%'' OR UPPER(HST.HISTORICO) LIKE ''%RESG%'' OR UPPER(HST.HISTORICO) LIKE ''%PORT%''' +
                         '                                           AND EXISTS (SELECT 1 ' +
                         '                                           FROM HSTBENEFBFCIARIO HS ' +
                         '                                           WHERE HS.IDPESSOA = H.IDPESSOA ' +
                         '                                             AND HS.IDTITULAR = H.IDTITULAR ' +
                         '                                             AND hs.idhstfolhabenef = h.idhstfolhabenef ' +
                         '                                             AND HS.MES = H.MESCOBRANCA ' +
                         '                                             AND HS.IDPLANOPREV = H.IDPLANOPREV) ' +
                         '      OR (UPPER(HST.HISTORICO) LIKE ''%FOLHA%'' )) ';
        end else begin
          sSQL := sSQL + ' AND (PL.IDPLANOPREV = H.IDPLANOPREV) ' +
                         //' AND (PF.IDPESSOA = H.IDRESPONSAVEL)  ' + WO3905 - Helen V Bianchi
                         ' AND (PF.IDPESSOA(+ ) = H.IDRESPONSAVEL)  ' +
                         ' AND (RESP.IDPESSOA = H.IDRESPONSAVEL)' +
                         ' AND (TIT.IDPESSOA = H.IDTITULAR)     ' +
                         ' AND (EPP.IDPESSOA = NVL(H.IDRECEBEPGTO, H.IDRESPONSAVEL))' ;
                         //  SOL 147567 KINTANA 1022979
                         if (grpTipoFolha.ItemIndex = 0) and not(Chktrarubresgate.Checked) then
                            sSQL := sSQL + ' AND CT.FLGRESGATE  =  0 ' ;
         // Andre Imakawa - SIG 125110
         sSQL := sSQL +  ' AND H.IDLOTE = CT.IDLOTE ';
         if dblkpcmbLote.text = '' then
                         //  SOL 147567 KINTANA 1022979
                         //BRUNO AZEVEDO SOL 139176 KINTANA 852660
                         //ADICIONADO OR UPPER(CT.DESCRICAO) LIKE '%PORT%'
         sSQL := sSQL +  ' AND (UPPER(CT.DESCRICAO) LIKE ''%ADT%'' OR UPPER(CT.DESCRICAO) LIKE ''%RESG%'' OR UPPER(CT.DESCRICAO) LIKE ''%PORT%''  AND ' +
                         '                                          H.IDLOTE IN (SELECT HS.IDLOTE ' +
                         '                                                       FROM HSTBENEFBFCIARIO HS ' +
                         '                                                      WHERE HS.IDPESSOA = H.IDPESSOA ' +
                         '                                                        AND HS.IDTITULAR = H.IDTITULAR ' +
                         '                                                        AND HS.MES = H.MESCOBRANCA ' +
                         '                                                        AND HS.IDPLANOPREV = H.IDPLANOPREV) ' +
                         '       OR UPPER(CT.DESCRICAO) LIKE ''%BENEF%'' OR UPPER(CT.DESCRICAO) LIKE ''%PREPA%'' OR UPPER(CT.DESCRICAO) LIKE ''%CONTRIB%''  ) ';

         sSQL := sSQL +  ' AND (PPP.IDPESSOA       = H.IDTITULAR) ' +
                         ' AND (PF.IDPESSOA = PCJ.IDPESSOA(+)) ' +
                         ' AND (DP.IDTITULAR(+) = H.IDTITULAR) ' +
                         ' AND (DP.IDPESSOA(+) = H.IDRESPONSAVEL) ' +
                         ' AND (PPP.IDPESSJUR      = H.IDPATRO) ' +
                         ' AND ( ((H.IDPLANOPREV   = PPP.IDPLANOPREV) AND (H.IDRESPONSAVEL  =  H.IDTITULAR)) ' +
                         '  OR ((H.IDPLANOORIGEM = PPP.IDPLANOPREV) AND (H.IDRESPONSAVEL  <> H.IDTITULAR)) ) ' +
                         ' AND (EL.IDPESSOA        = H.IDTITULAR) ' +
                         ' AND (EL.IDPESSJUR       = H.IDPATRO) ' +
                         ' AND (PAT.IDPESSOA       = H.IDPATRO)'+
                         ' AND (H.IDPESSOA = CC.IDPESSOA(+)) '+
                         ' AND (H.CONTACORRENTE = CC.CONTACORRENTE(+)) '+
                         ' AND (CC.IDAGENCIA = AG.IDPESSOA(+)) '+
//						 ' AND (PPP.DATACANCELAMENTO IS NULL) ' +   //MARCIO SANCHES SPINOSA - SOL 185038 KINTANA 1812976
                         ' AND (AG.IDBANCO = PE.IDPESSOA(+)) ';
        end;
        //BRUNO AZEVEDO SOL 136490 KINTANA 817135

  if cmbBeneficio.text <> ''then
  begin
    if sTabela = 'HISTRUBSAL' then
      sSQL := sSQL +'  AND H.IDTITULAR        = BNF.IDTITULAR     '+
                    '  AND H.IDPLANOPREV      = BNF.IDPLANOPREV   '+
                    '  AND H.IDPATRO          = BNF.IDPESSJUR     '+
                    '  AND H.IDMOTIVO         = BNF.IDMOTIVO      '+
                    '  AND H.MES              = BNF.MES           '
    else
      sSQL := sSQL +'  AND H.IDTITULAR        = BNF.IDTITULAR     '+
                    '  AND H.IDPLANOPREV      = BNF.IDPLANOPREV   '+
                    '  AND H.IDPATRO          = BNF.IDPESSJUR     '+
                    '  AND H.SEQPROPOSTA      = BNF.SEQPROPOSTA   '+
                    '  AND H.IDPESSOA         = BNF.IDPESSOA      ';
  end;

  case  cmbOrdem.ItemIndex of
    0: Begin
         sSQL := sSQL +'ORDER BY PAT.NOME, PL.NOME, PPP.INSCRICAONUMERO';
         dtmPrevia.ppLblPatro.Visible               := False;
         dtmPrevia.ppdbtxtPatro.Visible             := False;
         dtmPrevia.ReportPREVIASummaryBand1.Visible := False;
         dtmPrevia.ppLabel4.Visible                 := True;
         dtmPrevia.ppDBText8.Visible                := True;
       End;
    1: Begin
         sSQL := sSQL +'ORDER BY PAT.NOME, PL.NOME, EL.MATRICULA';
         dtmPrevia.ppLblPatro.Visible               := False;
         dtmPrevia.ppdbtxtPatro.Visible             := False;
         dtmPrevia.ReportPREVIASummaryBand1.Visible := False;
         dtmPrevia.ppLabel4.Visible                 := True;
         dtmPrevia.ppDBText8.Visible                := True;
       End;
    2: Begin
         sSQL := sSQL +'ORDER BY PAT.NOME, PL.NOME, RESP.NOME';
         dtmPrevia.ppLblPatro.Visible               := False;
         dtmPrevia.ReportPREVIASummaryBand1.Visible := False;
         dtmPrevia.ppdbtxtPatro.Visible             := False;
         dtmPrevia.ppLabel4.Visible                 := True;
         dtmPrevia.ppDBText8.Visible                := True;
       End;
    3: Begin
         sSql := sSql +'ORDER BY PPP.INSCRICAONUMERO ASC';
         dtmPrevia.ReportPrevia.Groups[0].BreakName := 'NADA';
         dtmPrevia.ReportPrevia.Groups[0].NewPage   := False;
         dtmPrevia.ppLblPatro.Visible               := True;
         dtmPrevia.ppdbtxtPatro.Visible             := True;
         dtmPrevia.ReportPREVIASummaryBand1.Visible := True;
         dtmPrevia.ppLabel4.Visible                 := False;
         dtmPrevia.ppDBText8.Visible                := False;
       End;
    4: Begin
         sSql := sSql +'ORDER BY EL.MATRICULA ASC';
         dtmPrevia.ReportPrevia.Groups[0].BreakName := 'NADA';
         dtmPrevia.ReportPrevia.Groups[0].NewPage   := False;
         dtmPrevia.ppLblPatro.Visible               := True;
         dtmPrevia.ppdbtxtPatro.Visible             := True;
         dtmPrevia.ReportPREVIASummaryBand1.Visible := True;
         dtmPrevia.ppLabel4.Visible                 := False;
         dtmPrevia.ppDBText8.Visible                := False;
       End;
    5: Begin
         sSql := sSql +'ORDER BY RESP.NOME ASC';
         dtmPrevia.ReportPrevia.Groups[0].BreakName := 'NADA';
         dtmPrevia.ReportPrevia.Groups[0].NewPage   := False;
         dtmPrevia.ppLblPatro.Visible               := True;
         dtmPrevia.ppdbtxtPatro.Visible             := True;
         dtmPrevia.ReportPREVIASummaryBand1.Visible := True;
         dtmPrevia.ppLabel4.Visible                 := False;
         dtmPrevia.ppDBText8.Visible                := False;
       End;
  end;

  //sSQL := sSQL +' ) '; //BRUNO AZEVEDO SOL 141143 KINTANA 905094
  sSQL := sSQL +' ) WHERE rank = 1 ORDER BY DATANASC'; //BRUNO AZEVEDO SOL 141143 KINTANA 905094
  sSQL := sSQL +'  ) TMP';
  sSQL := sSQL +'  WHERE (TMP.IDRESPONSAVEL <> TMP.ANTERIORIDRESPONSAVEL) OR (TMP.ANTERIORIDRESPONSAVEL IS NULL)  ORDER BY IDTITULAR'; // Andre Imakawa - SIG 86157
//Marcio Sanches Spinosa SOL 215474 KINTANA 2044700 - Inicio
  //MARCIO SANCHES SPINOSA - SOL 185038 KINTANA 1812976
//  if sTabela = 'HISTRUBSAL' then
//      sSQL := sSQL +'  WHERE TMP.IDRESPONSAVEL = TMP.ProximoIDRESPONSAVEL';
//      sSql := sSql + '  AND  CASE WHEN (TMP.IDRESPONSAVEL = TMP.ProximoIDRESPONSAVEL) AND (TMP.TIPOOPCAO <> TMP.ProximoTIPOOPCAOIR)'+
//          '          THEN'+
//          '           TMP.TIPOOPCAO||''/''||TMP.ProximoTIPOOPCAOIR'+
//          '        ELSE   '+
////          '           TMP.TIPOOPCAO'+      //MARCIO SANCHES SPINOSA - SOL 185038 KINTANA 1812976
//          '           NULL '+           //MARCIO SANCHES SPINOSA - SOL 185038 KINTANA 1812976
//          '        END IS NOT NULL ';

//   SSQL := SSQL + ' AND CASE WHEN  QTDE > 0  THEN '+
//                  ' CASE ' +
//                  ' WHEN (TMP.IDRESPONSAVEL = TMP.ProximoIDRESPONSAVEL) AND ' +
//                  ' (TMP.TIPOOPCAO <> TMP.ProximoTIPOOPCAOIR) THEN ' +
//                  ' TMP.TIPOOPCAO || ''/'' || TMP.ProximoTIPOOPCAOIR '+
//                  ' ELSE ' +
//                  ' TMP.TIPOOPCAO ' +
//                  ' END ' +
//                  ' ELSE ' +
//                  '      ''Progressiva'' '+
//                  ' END IS NOT NULL ';
  //MARCIO SANCHES SPINOSA - SOL 185038 KINTANA 1812976
//  sSQL := sSQL +'  WHERE TMP.IDRESPONSAVEL = TMP.ProximoIDRESPONSAVEL';//marcio sanches spinosa
//Marcio Sanches Spinosa SOL 215474 KINTANA 2044700 - Fim
  end
  else
  begin
  sSql := ' SELECT TS.NADA,                  '+
          '    TS.IDRESPONSAVEL,             '+
          '    TS.TIPOOPCAOIR,               '+
          '    TS.IDTITULAR,                 '+
          '    TS.PATRO,                     '+
          '    TS.IDPATRO,                   '+
          '    TS.IDPLANOPREV,               '+
          '    TS.PLANO,                     '+
          '    TS.CPF,                       '+
          '    TS.RESPONSAVEL,               '+
          '    TS.TITULAR,                   '+
          '    TS.EPP,                       '+
          '    TS.MESCOBRANCA,               '+
          '    TS.FLGISENTOIRRF,             '+
          '    TS.DATANASC,                  '+
          '    TS.FLGSOMAIRSUPINSS,          '+
          '    TS.FLGFAZDEPOSITO,            '+
          '    TS.NUMDEPIRRF,                '+
          '    TS.INSCRICAONUMERO,           '+
          '    TS.MATRICULA,                 '+
          '    TS.MATDEP,                    '+
          '    TS.CODPORTFORMA,              '+
          '    TS.CONTACORRENTE,             '+
          '    TS.NUMBANCO,                  '+
          '    TS.NUMAGENCIA,                '+
          '    TS.BANCO,                     '+
          '    TS.IDLOTE,                    '+
          '    TS.rank                       '+
          ' FROM                             '+
          ' (SELECT  TMP.NADA,'+
          '        TMP.IDRESPONSAVEL,'+
          '        TMP.ANTERIORIDRESPONSAVEL,'+
          '        CASE WHEN (TMP.IDRESPONSAVEL = TMP.ProximoIDRESPONSAVEL) AND (TMP.TIPOOPCAO <> TMP.ProximoTIPOOPCAOIR)'+
          '        AND ((TMP.ProximoIDPLANOPREV = TMP.IDPLANOPREV)) THEN'+
          '           TMP.TIPOOPCAO||''/''||TMP.ProximoTIPOOPCAOIR'+
          '        ELSE   '+
          '           TMP.TIPOOPCAO'+
          '        END  AS TIPOOPCAOIR, '+

          '  TMP.IDTITULAR,            '+
          '  TMP.PATRO,                '+
          '  TMP.IDPATRO,              '+
          '  TMP.IDPLANOPREV,          '+
          '  TMP.PLANO,                '+
          '  TMP.CPF,                  '+
          '  TMP.RESPONSAVEL,          '+
          '  TMP.TITULAR,              '+
          '  TMP.EPP,                  '+
          '  TMP.MESCOBRANCA,          '+
          '  TMP.FLGISENTOIRRF,        '+
          '  TMP.DATANASC,             '+
          '  TMP.FLGSOMAIRSUPINSS,     '+
          '  TMP.FLGFAZDEPOSITO,       '+
          '  TMP.NUMDEPIRRF,           '+
          '  TMP.INSCRICAONUMERO,      '+
          '  TMP.MATRICULA,            '+
          '  TMP.MATDEP,               '+
          '  TMP.CODPORTFORMA,         '+
          '  TMP.CONTACORRENTE,        '+
          '  TMP.NUMBANCO,             '+
          '  TMP.NUMAGENCIA,           '+
          '  TMP.BANCO,                '+
          '  TMP.IDLOTE,               '+
          '  TMP.rank   '+
          ' FROM(';

  //BRUNO AZEVEDO SOL 141143 KINTANA 905094
sSQL := sSQL +  'SELECT NADA,                                 '+
                '       IDRESPONSAVEL,                        '+
               '       DECODE(lead(IDRESPONSAVEL)                                                                                '+
               '             over(ORDER BY idtitular,IDRESPONSAVEL, DATANASC, TIPOOPCAOIR),                                      '+
               '             NULL,                                                                                               '+
               '             IDRESPONSAVEL,                                                                                      '+
               '             lead(IDRESPONSAVEL)                                                                                 '+
               '             over(ORDER BY idtitular,IDRESPONSAVEL,DATANASC, TIPOOPCAOIR)) ProximoIDRESPONSAVEL,                 '+
               '         DECODE(lead(IDPLANOPREV)over(ORDER BY idtitular,IDRESPONSAVEL,DATANASC,TIPOOPCAOIR),                    '+
               '               NULL,IDPLANOPREV,lead(IDPLANOPREV) over(ORDER BY idtitular,                                       '+
               '                    IDRESPONSAVEL,DATANASC,TIPOOPCAOIR)) ProximoIDPLANOPREV,                                     '+

               '                                                                                                                 '+
               '   LAG(IDRESPONSAVEL) over(ORDER BY idtitular,IDRESPONSAVEL,DATANASC, TIPOOPCAOIR) ANTERIORIDRESPONSAVEL,        '+
               '                                                                                                                 '+
               '   DECODE(LAG(TIPOOPCAOIR)                                                                                       '+
               '             over(ORDER BY idtitular,IDRESPONSAVEL,DATANASC, TIPOOPCAOIR),                                       '+
               '             NULL,                                                                                               '+
               '             TIPOOPCAOIR,                                                                                        '+
               '             LAG(TIPOOPCAOIR) over(ORDER BY idtitular,IDRESPONSAVEL,DATANASC, TIPOOPCAOIR)) AnteriorOpcao,       '+
               '                                                                                                                 '+
               '      TIPOOPCAOIR as TIPOOPCAO,                                                                                  '+
               '    DECODE(lead(TIPOOPCAOIR) over(ORDER BY idtitular,IDRESPONSAVEL,DATANASC, TIPOOPCAOIR),                       '+
               '             NULL,                                                                                               '+
               '                                                                                                                 '+
               '             TIPOOPCAOIR,                                                                                        '+
               '             lead(TIPOOPCAOIR) over(ORDER BY idtitular,IDRESPONSAVEL, DATANASC, TIPOOPCAOIR)) ProximoTIPOOPCAOIR,'+

                '       IDTITULAR,                            '+
                '       PATRO,                                '+
                '       IDPATRO,                              '+
                '       IDPLANOPREV,                          '+
                '       PLANO,                                '+
                '       CPF,                                  '+
                '       RESPONSAVEL,                          '+
                '       TITULAR,                              '+
                '       EPP,                                  '+
                '       MESCOBRANCA,                          '+
                '       FLGISENTOIRRF,                        '+
                '       DATANASC,                             '+
                '       FLGSOMAIRSUPINSS,                     '+
                '       FLGFAZDEPOSITO,                       '+
                '       NUMDEPIRRF,                           '+
                '       INSCRICAONUMERO,                      '+
                '       MATRICULA,                            '+
                '       MATDEP,                               '+
                '       CODPORTFORMA,                         '+
                '       CONTACORRENTE,                        '+
                '       NUMBANCO,                             '+
                '       NUMAGENCIA,                           '+
                '       BANCO,                                ';

                if sTabela = 'HISTRUBSAL' then
                  sSQL := sSQL +'        IDHSTFOLHABENEF AS IDLOTE, '
                else
                  sSQL := sSQL +'        IDLOTE, ';


                sSQL := sSQL +
                '       rank FROM (                           '+
                //BRUNO AZEVEDO SOL 141143 KINTANA 905094


' SELECT DISTINCT 1 AS NADA,                  '+
'        H.IDRESPONSAVEL,                     '+
'        H.IDTITULAR,                         '+
'        PAT.NOME AS PATRO,                   '+
'        H.IDPATRO,                           '+
'        H.IDPLANOPREV,                       '+
'        PL.NOME AS PLANO,                    '+
'        RESP.NUMDOCUMENTO AS CPF,            '+
'        RESP.NOME AS RESPONSAVEL,            '+
'        TIT.NOME AS TITULAR,                 '+
'        EPP.NOME AS EPP,                     '+ //CPrev - 26800
'        H.MESCOBRANCA,                       '+
'        DECODE(PF.FLGISENTOIRRF,1,''Sim'',''Não'') AS FLGISENTOIRRF, '+
'        PF.DATANASC,                         '+
'        DECODE(PF.FLGSOMAIRSUPINSS,1,''Sim'',''Não'') AS FLGSOMAIRSUPINSS, '+
'        DECODE(PCJ.FLGFAZDEPOSITO,1,''Sim'',''Não'') AS FLGFAZDEPOSITO,       '+
'        PF.NUMDEPIRRF,                       '+
'        PPP.INSCRICAONUMERO,                 '+
'        EL.MATRICULA,                        '+
'        DP.MATRICULA AS MATDEP, '+
'        H.CODPORTFORMA                       ';
  // preenche com o campo-chave de acordo com a tabela HISTRUBSAL
  if sTabela = 'HISTRUBSAL' then
    sSQL := sSQL +'        ,H.IDHSTFOLHABENEF '
  else
    sSQL := sSQL +'         ,H.IDLOTE ';

 sSQL := sSQL + ' , DECODE(PPP.TIPOOPCAOIR, ''2'', ''Regressiva'', ''Progressiva'') AS TIPOOPCAOIR, ';
 sSQL := sSQL + ' H.CONTACORRENTE, H.NUMBANCO, H.NUMAGENCIA ,PE.NOME BANCO ';   // SOL 145036 KINTANA 970354

 //BRUNO AZEVEDO SOL 141143 KINTANA 905094
  sSQL := sSQL + ' , ( RANK() over(PARTITION BY H.idtitular , PF.DATANASC ORDER BY H.idplanoprev)) rank   ';

sSQL := sSQL +
' FROM '+sTabela+' H, '+
' PESSOAFISICA PF, '+
' ELEGPATRO EL, '+
' PARTPREVPLAN PPP, '+
' PLANPREV PL, '+
' PESSOA RESP, '+
' PROCJUD PCJ, '+
' PESSOA TIT, '+
' PESSOA EPP,  '+ //CPrev - 26800
' DEPENTIT DP, '+
' PESSOA PAT,  '+
' CONTABANCARIA  CC,  '+
' AGENCIABANCARIA AG, '+
' PESSOA PE    ';

if sTabela = 'HISTRUBSAL' then begin
  sSQL := sSQL + ', hstfolhabenef hsT ';
end else begin
  sSQL := sSQL + ', CTRLINTERFACE CT ';
end;

  if cmbBeneficio.text <> '' then
  begin
    if sTabela = 'HISTRUBSAL' then
      sSQL := sSQL + ' ,HSTBENEFBFCIARIO BNF  '
    else
      sSQL := sSQL + ' ,BENEFBFCIARIO BNF  ';
  end;

  //Filtra o tipo de folha (PREVIA HISTRUBSAL) (A Prévia pode ser por Lote ou AnoMês)
  if grpTipoFolha.ItemIndex = 0 then
  begin
    if dblkpcmbLote.text <> '' then
      sSQL := sSQL + ' WHERE H.IDLOTE = '+qryLote.FieldByName('IDLOTE').AsString+' '
    else if cmbMes.text <> '' then
      sSQL := sSQL + ' WHERE H.MESCOBRANCA = '+QuotedStr(sMesRef)+' ';
  end
  else
    sSQL := sSQL + ' WHERE H.IDHSTFOLHABENEF = '+qryHistorico.FieldByName('IDHSTFOLHABENEF').AsString+' ';

  if cmbPatro.Text <> '' then
    sSQL := sSQL + ' AND H.IDPATRO = '+qryPatro.FieldByName('IDPESSOA').AsString+' ';

  if cmbPlano.Text <> ''then
    sSQL := sSQL + ' AND H.IDPLANOPREV = '+qryPlano.FieldByName('IDPLANOPREV').AsString+' ';

  if cmbBeneficio.Text <> '' then // Independe da tabela.
    sSQL := sSQL + ' AND BNF.IDBENEFICIO = '+qryBeneficio.FieldByName('IDBENEFICIO').AsString+' ';

    if cboxIndividual.Checked then
      ssql:=ssql+'AND EXISTS (SELECT 1 '+
                             'FROM LISTAFOLHABENEFDET LD '+
                             'WHERE H.IDTITULAR = LD.IDTITULAR '+
                             'AND LD.IDLISTA = '+inttostr(frameBenef.ListaUsuario)+') '
    else
      if (sIdTitular <> '') then
        ssql:=ssql+' AND (H.IDTITULAR    = '+sIdTitular+') ';

        //BRUNO AZEVEDO SOL 136490 KINTANA 817135
        if sTabela = 'HISTRUBSAL' then begin
          sSQL := sSQL + ' AND H.IDHSTFOLHABENEF = '+qryHistorico.FieldByName('IDHSTFOLHABENEF').AsString+' ' +
                         ' AND (PL.IDPLANOPREV = H.IDPLANOPREV) ' +
                         //' AND (PF.IDPESSOA = H.IDRESPONSAVEL) ' + WO3905 - Helen V Bianchi
                         ' AND (PF.IDPESSOA(+ ) = H.IDRESPONSAVEL) ' +
                         ' AND (RESP.IDPESSOA = H.IDRESPONSAVEL) ' +
                         ' AND (TIT.IDPESSOA = H.IDTITULAR) ' +
                         ' AND (EPP.IDPESSOA = NVL(H.IDRECEBEPGTO, H.IDRESPONSAVEL)) ' +
                         ' AND (PPP.IDPESSOA = H.IDTITULAR) ' +
                         ' AND (PPP.IDPESSJUR = H.IDPATRO) ' +
                         ' AND (((H.IDPLANOPREV = PPP.IDPLANOPREV) AND ' +
                         '     (H.IDRESPONSAVEL = H.IDTITULAR)) OR ' +
                         '     ((H.IDPLANOORIGEM = PPP.IDPLANOPREV) AND ' +
                         '     (H.IDRESPONSAVEL <> H.IDTITULAR))) ' +
                         ' AND (EL.IDPESSOA = H.IDTITULAR) ' +
                         ' AND (PF.IDPESSOA = PCJ.IDPESSOA(+)) ' +
                         ' AND (DP.IDTITULAR(+) = H.IDTITULAR) ' +
                         ' AND (DP.IDPESSOA(+) = H.IDRESPONSAVEL) ' +
                         ' AND (EL.IDPESSJUR = H.IDPATRO) ' +
                         ' AND (PAT.IDPESSOA = H.IDPATRO) ' +
                         ' AND (H.IDPESSOA = CC.IDPESSOA(+)) '+           //SOL 147391 KINTANA 1019719
                         ' AND (H.CONTACORRENTE = CC.CONTACORRENTE(+)) '+ //SOL 145036 KINTANA 970354
                         ' AND (CC.IDAGENCIA = AG.IDPESSOA(+)) '+         //SOL 147391 KINTANA 1019719
                         ' AND (AG.IDBANCO = PE.IDPESSOA(+)) '+           //SOL 147391 KINTANA 1019719

                         ' AND h.idhstfolhabenef = HST.IDHSTFOLHABENEF ' +
                         //BRUNO AZEVEDO SOL 139176 KINTANA 852660
                         //ADICIONADO OR UPPER(HST.HISTORICO) LIKE ''%PORT%''
                         ' AND (UPPER(HST.HISTORICO) LIKE ''%ADT%'' OR UPPER(HST.HISTORICO) LIKE ''%RESG%'' OR UPPER(HST.HISTORICO) LIKE ''%PORT%''' +
                         '                                           AND EXISTS (SELECT 1 ' +
                         '                                           FROM HSTBENEFBFCIARIO HS ' +
                         '                                           WHERE HS.IDPESSOA = H.IDPESSOA ' +
                         '                                             AND HS.IDTITULAR = H.IDTITULAR ' +
                         '                                             AND hs.idhstfolhabenef = h.idhstfolhabenef ' +
                         '                                             AND HS.MES = H.MESCOBRANCA ' +
                         '                                             AND HS.IDPLANOPREV = H.IDPLANOPREV) ' +
                         '      OR (UPPER(HST.HISTORICO) LIKE ''%FOLHA%'' )) ';
        end else begin
          sSQL := sSQL + ' AND (PL.IDPLANOPREV = H.IDPLANOPREV) ' +
                         //' AND (PF.IDPESSOA = H.IDRESPONSAVEL)  ' + WO3905 - Helen V Bianchi
                         ' AND (PF.IDPESSOA(+ ) = H.IDRESPONSAVEL)  ' +
                         ' AND (RESP.IDPESSOA = H.IDRESPONSAVEL)' +
                         ' AND (TIT.IDPESSOA = H.IDTITULAR)     ' +
                         ' AND (EPP.IDPESSOA = NVL(H.IDRECEBEPGTO, H.IDRESPONSAVEL))' ;
                         //  SOL 147567 KINTANA 1022979
                         if (grpTipoFolha.ItemIndex = 0) and not(Chktrarubresgate.Checked) then
                            sSQL := sSQL + ' AND CT.FLGRESGATE  =  0 ' ;

         // Andre Imakawa - SIG 125110
         sSQL := sSQL +  ' AND H.IDLOTE = CT.IDLOTE ';
         if dblkpcmbLote.text = '' then
                         //  SOL 147567 KINTANA 1022979
                         //BRUNO AZEVEDO SOL 139176 KINTANA 852660
                         //ADICIONADO OR UPPER(CT.DESCRICAO) LIKE '%PORT%'
         sSQL := sSQL +  ' AND (UPPER(CT.DESCRICAO) LIKE ''%ADT%'' OR UPPER(CT.DESCRICAO) LIKE ''%RESG%'' OR UPPER(CT.DESCRICAO) LIKE ''%PORT%''  AND ' +
                         '                                          H.IDLOTE IN (SELECT HS.IDLOTE ' +
                         '                                                       FROM HSTBENEFBFCIARIO HS ' +
                         '                                                      WHERE HS.IDPESSOA = H.IDPESSOA ' +
                         '                                                        AND HS.IDTITULAR = H.IDTITULAR ' +
                         '                                                        AND HS.MES = H.MESCOBRANCA ' +
                         '                                                        AND HS.IDPLANOPREV = H.IDPLANOPREV) ' +
                         '       OR UPPER(CT.DESCRICAO) LIKE ''%BENEF%'' OR UPPER(CT.DESCRICAO) LIKE ''%PREPA%'' OR UPPER(CT.DESCRICAO) LIKE ''%CONTRIB%''  ) ';

         sSQL := sSQL +  ' AND (PPP.IDPESSOA       = H.IDTITULAR) ' +
                         ' AND (PF.IDPESSOA = PCJ.IDPESSOA(+)) ' +
                         ' AND (DP.IDTITULAR(+) = H.IDTITULAR) ' +
                         ' AND (DP.IDPESSOA(+) = H.IDRESPONSAVEL) ' +
                         ' AND (PPP.IDPESSJUR      = H.IDPATRO) ' +
                         ' AND ( ((H.IDPLANOPREV   = PPP.IDPLANOPREV) AND (H.IDRESPONSAVEL  =  H.IDTITULAR)) ' +
                         '  OR ((H.IDPLANOORIGEM = PPP.IDPLANOPREV) AND (H.IDRESPONSAVEL  <> H.IDTITULAR)) ) ' +
                         ' AND (EL.IDPESSOA        = H.IDTITULAR) ' +
                         ' AND (EL.IDPESSJUR       = H.IDPATRO) ' +
                         ' AND (PAT.IDPESSOA       = H.IDPATRO)'+
                         ' AND (H.IDPESSOA = CC.IDPESSOA(+)) '+
                         ' AND (H.CONTACORRENTE = CC.CONTACORRENTE(+)) '+
                         ' AND (CC.IDAGENCIA = AG.IDPESSOA(+)) '+
                         ' AND (AG.IDBANCO = PE.IDPESSOA(+)) ';
        end;
        //BRUNO AZEVEDO SOL 136490 KINTANA 817135

  if cmbBeneficio.text <> ''then
  begin
    if sTabela = 'HISTRUBSAL' then
      sSQL := sSQL +'  AND H.IDTITULAR        = BNF.IDTITULAR     '+
                    '  AND H.IDPLANOPREV      = BNF.IDPLANOPREV   '+
                    '  AND H.IDPATRO          = BNF.IDPESSJUR     '+
                    '  AND H.IDMOTIVO         = BNF.IDMOTIVO      '+
                    '  AND H.MES              = BNF.MES           '
    else
      sSQL := sSQL +'  AND H.IDTITULAR        = BNF.IDTITULAR     '+
                    '  AND H.IDPLANOPREV      = BNF.IDPLANOPREV   '+
                    '  AND H.IDPATRO          = BNF.IDPESSJUR     '+
                    '  AND H.SEQPROPOSTA      = BNF.SEQPROPOSTA   '+
                    '  AND H.IDPESSOA         = BNF.IDPESSOA      ';
  end;

  case  cmbOrdem.ItemIndex of
    0: Begin
         sSQL := sSQL +'ORDER BY PAT.NOME, PL.NOME, PPP.INSCRICAONUMERO';
         dtmPrevia.ppLblPatro.Visible               := False;
         dtmPrevia.ppdbtxtPatro.Visible             := False;
         dtmPrevia.ReportPREVIASummaryBand1.Visible := False;
         dtmPrevia.ppLabel4.Visible                 := True;
         dtmPrevia.ppDBText8.Visible                := True;
       End;
    1: Begin
         sSQL := sSQL +'ORDER BY PAT.NOME, PL.NOME, EL.MATRICULA';
         dtmPrevia.ppLblPatro.Visible               := False;
         dtmPrevia.ppdbtxtPatro.Visible             := False;
         dtmPrevia.ReportPREVIASummaryBand1.Visible := False;
         dtmPrevia.ppLabel4.Visible                 := True;
         dtmPrevia.ppDBText8.Visible                := True;
       End;
    2: Begin
         sSQL := sSQL +'ORDER BY PAT.NOME, PL.NOME, RESP.NOME';
         dtmPrevia.ppLblPatro.Visible               := False;
         dtmPrevia.ReportPREVIASummaryBand1.Visible := False;
         dtmPrevia.ppdbtxtPatro.Visible             := False;
         dtmPrevia.ppLabel4.Visible                 := True;
         dtmPrevia.ppDBText8.Visible                := True;
       End;
    3: Begin
         sSql := sSql +'ORDER BY PPP.INSCRICAONUMERO ASC';
         dtmPrevia.ReportPrevia.Groups[0].BreakName := 'NADA';
         dtmPrevia.ReportPrevia.Groups[0].NewPage   := False;
         dtmPrevia.ppLblPatro.Visible               := True;
         dtmPrevia.ppdbtxtPatro.Visible             := True;
         dtmPrevia.ReportPREVIASummaryBand1.Visible := True;
         dtmPrevia.ppLabel4.Visible                 := False;
         dtmPrevia.ppDBText8.Visible                := False;
       End;
    4: Begin
         sSql := sSql +'ORDER BY EL.MATRICULA ASC';
         dtmPrevia.ReportPrevia.Groups[0].BreakName := 'NADA';
         dtmPrevia.ReportPrevia.Groups[0].NewPage   := False;
         dtmPrevia.ppLblPatro.Visible               := True;
         dtmPrevia.ppdbtxtPatro.Visible             := True;
         dtmPrevia.ReportPREVIASummaryBand1.Visible := True;
         dtmPrevia.ppLabel4.Visible                 := False;
         dtmPrevia.ppDBText8.Visible                := False;
       End;
    5: Begin
         sSql := sSql +'ORDER BY RESP.NOME ASC';
         dtmPrevia.ReportPrevia.Groups[0].BreakName := 'NADA';
         dtmPrevia.ReportPrevia.Groups[0].NewPage   := False;
         dtmPrevia.ppLblPatro.Visible               := True;
         dtmPrevia.ppdbtxtPatro.Visible             := True;
         dtmPrevia.ReportPREVIASummaryBand1.Visible := True;
         dtmPrevia.ppLabel4.Visible                 := False;
         dtmPrevia.ppDBText8.Visible                := False;
       End;
  end;

  //sSQL := sSQL +' ) '; //BRUNO AZEVEDO SOL 141143 KINTANA 905094
  sSQL := sSQL +' ) ORDER BY IDTITULAR, IDRESPONSAVEL'; //BRUNO AZEVEDO SOL 141143 KINTANA 905094
  sSQL := sSQL +'  ) TMP';
  sSQL := sSQL +'  WHERE (TMP.IDRESPONSAVEL <> TMP.ANTERIORIDRESPONSAVEL) OR (TMP.ANTERIORIDRESPONSAVEL IS NULL)  ORDER BY IDTITULAR';

  sSQL := sSQL +') TS';
   //Higor Nayde Ferreira SOL 185038 KINTANA 1812976 Fim
   end;
  //Higor Nayde Ferreira SOL 185038 KINTANA 1812976 Fim
   {
   begin
   sSql :=

  //BRUNO AZEVEDO SOL 141143 KINTANA 905094
                'SELECT NADA,                                 '+
                '       IDRESPONSAVEL,                        '+
                '       IDTITULAR,                            '+
                '       PATRO,                                '+
                '       IDPATRO,                              '+
                '       IDPLANOPREV,                          '+
                '       PLANO,                                '+
                '       CPF,                                  '+
                '       RESPONSAVEL,                          '+
                '       TITULAR,                              '+
                '       EPP,                                  '+
                '       MESCOBRANCA,                          '+
                '       FLGISENTOIRRF,                        '+
                '       DATANASC,                             '+
                '       FLGSOMAIRSUPINSS,                      '+
                '       FLGFAZDEPOSITO,                        '+
                '       NUMDEPIRRF,                           '+
                '       INSCRICAONUMERO,                      '+
                '       MATRICULA,                            '+
                '       MATDEP,                               '+
                '       CODPORTFORMA,                         '+
                '       CONTACORRENTE,                        '+
                '       NUMBANCO,                             '+
                '       NUMAGENCIA,                           '+
                '       BANCO,                                ';

                if sTabela = 'HISTRUBSAL' then
                  sSQL := sSQL +'        IDHSTFOLHABENEF, '
                else
                  sSQL := sSQL +'        IDLOTE, ';

                sSQL := sSQL +'       TIPOOPCAOIR,             '+
                '       rank FROM (                           '+
                //BRUNO AZEVEDO SOL 141143 KINTANA 905094


' SELECT DISTINCT 1 AS NADA,                  '+
'        H.IDRESPONSAVEL,                     '+
'        H.IDTITULAR,                         '+
'        PAT.NOME AS PATRO,                   '+
'        H.IDPATRO,                           '+
'        H.IDPLANOPREV,                       '+
'        PL.NOME AS PLANO,                    '+
'        RESP.NUMDOCUMENTO AS CPF,            '+ 
'        RESP.NOME AS RESPONSAVEL,            '+
'        TIT.NOME AS TITULAR,                 '+
'        EPP.NOME AS EPP,                     '+ //CPrev - 26800
'        H.MESCOBRANCA,                       '+
'        DECODE(PF.FLGISENTOIRRF,1,''Sim'',''Não'') AS FLGISENTOIRRF, '+ 
'        PF.DATANASC,                         '+
'        DECODE(PF.FLGSOMAIRSUPINSS,1,''Sim'',''Não'') AS FLGSOMAIRSUPINSS, '+
'        DECODE(PCJ.FLGFAZDEPOSITO,1,''Sim'',''Não'') AS FLGFAZDEPOSITO,       '+
'        PF.NUMDEPIRRF,                       '+
'        PPP.INSCRICAONUMERO,                 '+
'        EL.MATRICULA,                        '+
'        DP.MATRICULA AS MATDEP, '+
'        H.CODPORTFORMA                       ';
  // preenche com o campo-chave de acordo com a tabela HISTRUBSAL
  if sTabela = 'HISTRUBSAL' then
    sSQL := sSQL +'        ,H.IDHSTFOLHABENEF '
  else
    sSQL := sSQL +'         ,H.IDLOTE ';

 sSQL := sSQL + ' , DECODE(PPP.TIPOOPCAOIR, ''2'', ''Regressiva'', ''Progressiva'') AS TIPOOPCAOIR, ';
 sSQL := sSQL + ' H.CONTACORRENTE, H.NUMBANCO, H.NUMAGENCIA ,PE.NOME BANCO ';   // SOL 145036 KINTANA 970354

 //BRUNO AZEVEDO SOL 141143 KINTANA 905094
  sSQL := sSQL + ' , ( RANK() over(PARTITION BY H.idtitular ORDER BY H.idplanoprev)) rank   ';

sSQL := sSQL +
' FROM '+sTabela+' H, '+
' PESSOAFISICA PF, '+
' ELEGPATRO EL, '+
' PARTPREVPLAN PPP, '+
' PLANPREV PL, '+
' PESSOA RESP, '+
' PROCJUD PCJ, '+   
' PESSOA TIT, '+
' PESSOA EPP,  '+ //CPrev - 26800
' DEPENTIT DP, '+ 
' PESSOA PAT,  '+
' CONTABANCARIA  CC,  '+
' AGENCIABANCARIA AG, '+
' PESSOA PE    ';

if sTabela = 'HISTRUBSAL' then begin
  sSQL := sSQL + ', hstfolhabenef hsT ';
end else begin
  sSQL := sSQL + ', CTRLINTERFACE CT ';
end;

  if cmbBeneficio.text <> '' then
  begin
    if sTabela = 'HISTRUBSAL' then
      sSQL := sSQL + ' ,HSTBENEFBFCIARIO BNF  '
    else
      sSQL := sSQL + ' ,BENEFBFCIARIO BNF  ';
  end;

  //Filtra o tipo de folha (PREVIA HISTRUBSAL) (A Prévia pode ser por Lote ou AnoMês)
  if grpTipoFolha.ItemIndex = 0 then
  begin
    if dblkpcmbLote.text <> '' then
      sSQL := sSQL + ' WHERE H.IDLOTE = '+qryLote.FieldByName('IDLOTE').AsString+' '
    else if cmbMes.text <> '' then
      sSQL := sSQL + ' WHERE H.MESCOBRANCA = '+QuotedStr(sMesRef)+' ';
  end
  else
    sSQL := sSQL + ' WHERE H.IDHSTFOLHABENEF = '+qryHistorico.FieldByName('IDHSTFOLHABENEF').AsString+' ';

  if cmbPatro.Text <> '' then
    sSQL := sSQL + ' AND H.IDPATRO = '+qryPatro.FieldByName('IDPESSOA').AsString+' ';

  if cmbPlano.Text <> ''then
    sSQL := sSQL + ' AND H.IDPLANOPREV = '+qryPlano.FieldByName('IDPLANOPREV').AsString+' ';

  if cmbBeneficio.Text <> '' then // Independe da tabela.
    sSQL := sSQL + ' AND BNF.IDBENEFICIO = '+qryBeneficio.FieldByName('IDBENEFICIO').AsString+' ';

    if cboxIndividual.Checked then
      ssql:=ssql+'AND EXISTS (SELECT 1 '+
                             'FROM LISTAFOLHABENEFDET LD '+
                             'WHERE H.IDTITULAR = LD.IDTITULAR '+
                             'AND LD.IDLISTA = '+inttostr(frameBenef.ListaUsuario)+') '
    else
      if (sIdTitular <> '') then
        ssql:=ssql+' AND (H.IDTITULAR    = '+sIdTitular+') ';

        //BRUNO AZEVEDO SOL 136490 KINTANA 817135
        if sTabela = 'HISTRUBSAL' then begin
          sSQL := sSQL + ' AND H.IDHSTFOLHABENEF = '+qryHistorico.FieldByName('IDHSTFOLHABENEF').AsString+' ' +
                         ' AND (PL.IDPLANOPREV = H.IDPLANOPREV) ' +
                         ' AND (PF.IDPESSOA = H.IDRESPONSAVEL) ' +
                         ' AND (RESP.IDPESSOA = H.IDRESPONSAVEL) ' +
                         ' AND (TIT.IDPESSOA = H.IDTITULAR) ' +
                         ' AND (EPP.IDPESSOA = NVL(H.IDRECEBEPGTO, H.IDRESPONSAVEL)) ' +
                         ' AND (PPP.IDPESSOA = H.IDTITULAR) ' +
                         ' AND (PPP.IDPESSJUR = H.IDPATRO) ' +
                         ' AND (((H.IDPLANOPREV = PPP.IDPLANOPREV) AND ' +
                         '     (H.IDRESPONSAVEL = H.IDTITULAR)) OR ' +
                         '     ((H.IDPLANOORIGEM = PPP.IDPLANOPREV) AND ' +
                         '     (H.IDRESPONSAVEL <> H.IDTITULAR))) ' +
                         ' AND (EL.IDPESSOA = H.IDTITULAR) ' +
                         ' AND (PF.IDPESSOA = PCJ.IDPESSOA(+)) ' +
                         ' AND (DP.IDTITULAR(+) = H.IDTITULAR) ' +
                         ' AND (DP.IDPESSOA(+) = H.IDRESPONSAVEL) ' +
                         ' AND (EL.IDPESSJUR = H.IDPATRO) ' +
                         ' AND (PAT.IDPESSOA = H.IDPATRO) ' +
                         ' AND (H.IDPESSOA = CC.IDPESSOA(+)) '+           //SOL 147391 KINTANA 1019719
                         ' AND (H.CONTACORRENTE = CC.CONTACORRENTE(+)) '+ //SOL 145036 KINTANA 970354
                         ' AND (CC.IDAGENCIA = AG.IDPESSOA(+)) '+         //SOL 147391 KINTANA 1019719
                         ' AND (AG.IDBANCO = PE.IDPESSOA(+)) '+           //SOL 147391 KINTANA 1019719

                         ' AND h.idhstfolhabenef = HST.IDHSTFOLHABENEF ' +
                         //BRUNO AZEVEDO SOL 139176 KINTANA 852660
                         //ADICIONADO OR UPPER(HST.HISTORICO) LIKE ''%PORT%''
                         ' AND (UPPER(HST.HISTORICO) LIKE ''%ADT%'' OR UPPER(HST.HISTORICO) LIKE ''%RESG%'' OR UPPER(HST.HISTORICO) LIKE ''%PORT%''' +
                         '                                           AND EXISTS (SELECT 1 ' +
                         '                                           FROM HSTBENEFBFCIARIO HS ' +
                         '                                           WHERE HS.IDPESSOA = H.IDPESSOA ' +
                         '                                             AND HS.IDTITULAR = H.IDTITULAR ' +
                         '                                             AND hs.idhstfolhabenef = h.idhstfolhabenef ' +
                         '                                             AND HS.MES = H.MESCOBRANCA ' +
                         '                                             AND HS.IDPLANOPREV = H.IDPLANOPREV) ' +
                         '      OR (UPPER(HST.HISTORICO) LIKE ''%FOLHA%'' )) ';
        end else begin
          sSQL := sSQL + ' AND (PL.IDPLANOPREV = H.IDPLANOPREV) ' +
                         ' AND (PF.IDPESSOA = H.IDRESPONSAVEL)  ' +
                         ' AND (RESP.IDPESSOA = H.IDRESPONSAVEL)' +
                         ' AND (TIT.IDPESSOA = H.IDTITULAR)     ' +
                         ' AND (EPP.IDPESSOA = NVL(H.IDRECEBEPGTO, H.IDRESPONSAVEL))' ;
                         //  SOL 147567 KINTANA 1022979
                         if (grpTipoFolha.ItemIndex = 0) and not(Chktrarubresgate.Checked) then
                            sSQL := sSQL + ' AND CT.FLGRESGATE  =  0 ' ;
                         //  SOL 147567 KINTANA 1022979
         sSQL := sSQL +  ' AND H.IDLOTE = CT.IDLOTE ' +
                         //BRUNO AZEVEDO SOL 139176 KINTANA 852660
                         //ADICIONADO OR UPPER(CT.DESCRICAO) LIKE '%PORT%'
                         ' AND (UPPER(CT.DESCRICAO) LIKE ''%ADT%'' OR UPPER(CT.DESCRICAO) LIKE ''%RESG%'' OR UPPER(CT.DESCRICAO) LIKE ''%PORT%''  AND ' +
                         '                                          H.IDLOTE IN (SELECT HS.IDLOTE ' +
                         '                                                       FROM HSTBENEFBFCIARIO HS ' +
                         '                                                      WHERE HS.IDPESSOA = H.IDPESSOA ' +
                         '                                                        AND HS.IDTITULAR = H.IDTITULAR ' +
                         '                                                        AND HS.MES = H.MESCOBRANCA ' +
                         '                                                        AND HS.IDPLANOPREV = H.IDPLANOPREV) ' +
                         '       OR UPPER(CT.DESCRICAO) LIKE ''%BENEF%'' OR UPPER(CT.DESCRICAO) LIKE ''%PREPA%'' OR UPPER(CT.DESCRICAO) LIKE ''%CONTRIB%''  ) ' +
                         ' AND (PPP.IDPESSOA       = H.IDTITULAR) ' +
                         ' AND (PF.IDPESSOA = PCJ.IDPESSOA(+)) ' +
                         ' AND (DP.IDTITULAR(+) = H.IDTITULAR) ' +
                         ' AND (DP.IDPESSOA(+) = H.IDRESPONSAVEL) ' +
                         ' AND (PPP.IDPESSJUR      = H.IDPATRO) ' +
                         ' AND ( ((H.IDPLANOPREV   = PPP.IDPLANOPREV) AND (H.IDRESPONSAVEL  =  H.IDTITULAR)) ' +
                         '  OR ((H.IDPLANOORIGEM = PPP.IDPLANOPREV) AND (H.IDRESPONSAVEL  <> H.IDTITULAR)) ) ' +
                         ' AND (EL.IDPESSOA        = H.IDTITULAR) ' +
                         ' AND (EL.IDPESSJUR       = H.IDPATRO) ' +
                         ' AND (PAT.IDPESSOA       = H.IDPATRO)'+
                         ' AND (H.IDPESSOA = CC.IDPESSOA(+)) '+
                         ' AND (H.CONTACORRENTE = CC.CONTACORRENTE(+)) '+
                         ' AND (CC.IDAGENCIA = AG.IDPESSOA(+)) '+
                         ' AND (AG.IDBANCO = PE.IDPESSOA(+)) ';
        end;
        //BRUNO AZEVEDO SOL 136490 KINTANA 817135

  if cmbBeneficio.text <> ''then
  begin
    if sTabela = 'HISTRUBSAL' then
      sSQL := sSQL +'  AND H.IDTITULAR        = BNF.IDTITULAR     '+
                    '  AND H.IDPLANOPREV      = BNF.IDPLANOPREV   '+
                    '  AND H.IDPATRO          = BNF.IDPESSJUR     '+
                    '  AND H.IDMOTIVO         = BNF.IDMOTIVO      '+
                    '  AND H.MES              = BNF.MES           '
    else
      sSQL := sSQL +'  AND H.IDTITULAR        = BNF.IDTITULAR     '+
                    '  AND H.IDPLANOPREV      = BNF.IDPLANOPREV   '+
                    '  AND H.IDPATRO          = BNF.IDPESSJUR     '+
                    '  AND H.SEQPROPOSTA      = BNF.SEQPROPOSTA   '+
                    '  AND H.IDPESSOA         = BNF.IDPESSOA      ';
  end;

  case  cmbOrdem.ItemIndex of
    0: Begin
         sSQL := sSQL +'ORDER BY PAT.NOME, PL.NOME, PPP.INSCRICAONUMERO';
         dtmPrevia.ppLblPatro.Visible               := False;
         dtmPrevia.ppdbtxtPatro.Visible             := False;
         dtmPrevia.ReportPREVIASummaryBand1.Visible := False;
         dtmPrevia.ppLabel4.Visible                 := True;
         dtmPrevia.ppDBText8.Visible                := True;
       End;
    1: Begin
         sSQL := sSQL +'ORDER BY PAT.NOME, PL.NOME, EL.MATRICULA';
         dtmPrevia.ppLblPatro.Visible               := False;
         dtmPrevia.ppdbtxtPatro.Visible             := False;
         dtmPrevia.ReportPREVIASummaryBand1.Visible := False;
         dtmPrevia.ppLabel4.Visible                 := True;
         dtmPrevia.ppDBText8.Visible                := True;
       End;
    2: Begin
         sSQL := sSQL +'ORDER BY PAT.NOME, PL.NOME, RESP.NOME';
         dtmPrevia.ppLblPatro.Visible               := False;
         dtmPrevia.ReportPREVIASummaryBand1.Visible := False;
         dtmPrevia.ppdbtxtPatro.Visible             := False;
         dtmPrevia.ppLabel4.Visible                 := True;
         dtmPrevia.ppDBText8.Visible                := True;
       End;
    3: Begin
         sSql := sSql +'ORDER BY PPP.INSCRICAONUMERO ASC';
         dtmPrevia.ReportPrevia.Groups[0].BreakName := 'NADA';
         dtmPrevia.ReportPrevia.Groups[0].NewPage   := False;
         dtmPrevia.ppLblPatro.Visible               := True;
         dtmPrevia.ppdbtxtPatro.Visible             := True;
         dtmPrevia.ReportPREVIASummaryBand1.Visible := True;
         dtmPrevia.ppLabel4.Visible                 := False;
         dtmPrevia.ppDBText8.Visible                := False;
       End;
    4: Begin
         sSql := sSql +'ORDER BY EL.MATRICULA ASC';
         dtmPrevia.ReportPrevia.Groups[0].BreakName := 'NADA';
         dtmPrevia.ReportPrevia.Groups[0].NewPage   := False;
         dtmPrevia.ppLblPatro.Visible               := True;
         dtmPrevia.ppdbtxtPatro.Visible             := True;
         dtmPrevia.ReportPREVIASummaryBand1.Visible := True;
         dtmPrevia.ppLabel4.Visible                 := False;
         dtmPrevia.ppDBText8.Visible                := False;
       End;
    5: Begin
         sSql := sSql +'ORDER BY RESP.NOME ASC';
         dtmPrevia.ReportPrevia.Groups[0].BreakName := 'NADA';
         dtmPrevia.ReportPrevia.Groups[0].NewPage   := False;
         dtmPrevia.ppLblPatro.Visible               := True;
         dtmPrevia.ppdbtxtPatro.Visible             := True;
         dtmPrevia.ReportPREVIASummaryBand1.Visible := True;
         dtmPrevia.ppLabel4.Visible                 := False;
         dtmPrevia.ppDBText8.Visible                := False;
       End;
  end;

  sSQL := sSQL +' ) WHERE rank = 1 '; //BRUNO AZEVEDO SOL 141143 KINTANA 905094
   end; }
  sIdHstFolhaBenef:=qryHistorico.FieldByName('IDHSTFOLHABENEF').AsString;
  (* =================== *)

  sidlote := dblkpcmbLote.Text;
  dtmPrevia.qryPREVIA.sql.Clear;
  dtmPrevia.qryPREVIA.sql.Add(sSQL);
 // dtmprevia.qryPREVIA.sql.SaveToFile('c:\marcio.sql');
  dtmPrevia.qryPrevia.Open;

  MontaQueryDetalhe;

  If cmbOrdem.ItemIndex > 2 Then MontaQueryTotal;
end;

procedure TfrmPRelPREVIA.MontaQueryDetalhe;
Begin
  // Monta o detalhe baseado na tabela utilizada (HISTRUBSAL / PREVIA)
  // alterar a relação mestre/detalhe.
  With dtmprevia.qryDetalhe Do
  Begin
    SQL.Clear;

    If (ckbAgrupaRubrica.Checked = True) Then
    Begin
      SQL.Add('SELECT  PARCELAS, '        + #13 +
              '        DECODE(ORDEM_1, 0, NULL) AS ORDEM_1, '         + #13 +
              '        FONTEPAGADORA, '   + #13 +
              '        IDPLANOCONTABIL, ' + #13 +  //BRUNO AZEVEDO SOL 143022 KINTANA 927497
              '        IDTITULAR, '       + #13 +
              '        IDRESPONSAVEL, '   + #13 +
              '        RESPONSAVEL, '     + #13 +
              '        IDPATRO, '         + #13 +
              '        MES, '             + #13 +
              '        MESCOBRANCA, '     + #13 +
              '        IDPROVENTO, '      + #13 +
              '        DESCRICAO, '       + #13 +
              '        FLGDESCONTO, ');

      If sTabela = 'HISTRUBSAL' Then
        SQL.Add('        IDHSTFOLHABENEF AS IDLOTE, ')
      Else
        SQL.Add('        ORDEM, ');


      SQL.Add('        PROVENTO, '        + #13 +
              '        DESCONTO, '        + #13 +
              '        INFORMATIVO '      + #13 +
              'FROM '                     + #13 +
              ' ( ' );

      SQL.Add(' SELECT '                                                                 + #13 +
              '        HST.PARCELAS, '                                                   + #13 +
              '        0 AS ORDEM_1, '                                               + #13 +
              '        DECODE(HST.FONTEPAGADORA,1,''FUND'',''INSS'') AS FONTEPAGADORA, ' + #13 +
              '        HST.IDPLANOCONTABIL, '                                            + #13 +  //BRUNO AZEVEDO SOL 143022 KINTANA 927497
              '        HST.IDTITULAR, '                                                  + #13 +
              '        HST.IDRESPONSAVEL, '                                              + #13 +
              '        RESP.NOME AS RESPONSAVEL, '                                       + #13 +
              '        HST.IDPATRO, '                                                    + #13 +
              '        HST.MES, '                                                        + #13 +
              '        HST.MESCOBRANCA, ');

      If SistemaFolha.FlgUsaCodRubExt = 0 Then
        SQL.Add('        PD.IDPROVENTO, ' + #13 +
                '        PD.DESCRICAO, '  + #13 +
                '        PD.FLGDESCONTO, ')
      Else
        SQL.Add('        NVL(PD.CODPROVDESC,PD.IDPROVENTO) AS IDPROVENTO, ' + #13 +
                '        NVL(PD.DESCRPROVDESC,PD.DESCRICAO) AS DESCRICAO, ' + #13 +
                '        PD.FLGDESCONTO, ');

      If sTabela = 'HISTRUBSAL' Then
        SQL.Add('        HST.IDHSTFOLHABENEF, ')
      Else
        SQL.Add('        HST.ORDEM, ');

      SQL.Add('        DECODE(PD.FLGDESCONTO,0,HST.VALORPROVENTO) AS PROVENTO, ' + #13 +
              '        DECODE(PD.FLGDESCONTO,1,HST.VALORPROVENTO) AS DESCONTO, ' + #13 +
              '        DECODE(PD.FLGESPECIAL, 0, DECODE(PD.FLGDESCONTO, ' +
              ' 2, HST.VALORINFO||'' (I)'', ' +
              ' 0, NULL, '+
              ' 1, DECODE(HST.VALORRECEBIDO-HST.VALORPROVENTO, ' +
              ' 0, DECODE(HST.VALORINFO, ' +
              ' 0, NULL, HST.VALORINFO||'' (I)''), ' +
              ' HST.VALORRECEBIDO-HST.VALORPROVENTO||'' (R)'')), ' +
              ' DECODE(HST.VALORPROVENTO,0,HST.VALORINFO, '+
              ' NVL(HST.VALORPROVENTO,HST.VALORINFO))||'' (I)'') INFORMATIVO ');

      SQL.Add(' FROM '                   + #13 +
              '      '+sTabela+' HST, '  + #13 +
              '      PROVDESC PD, '      + #13 +
              '      PESSOA RESP '   );
              If sTabela <> 'HISTRUBSAL' Then
                 SQL.Add('      ,CTRLINTERFACE CT ');

      SQL.Add(' WHERE 1 = 1 '            + #13 +
              '   AND (PD.FLGAGRUPA       = 0)');

      // constrói o filtro de acordo com a tabela.
      If sTabela = 'HISTRUBSAL' Then
        SQL.Add('   AND HST.IDHSTFOLHABENEF = :IDLOTE ')
      Else
      Begin
        If sidlote <> '' then
          SQL.Add('   AND HST.IDLOTE = :IDLOTE ')
        Else
          If cmbMes.Text <> '' Then
            SQL.Add('   AND HST.MESCOBRANCA = :MESCOBRANCA ');
      End;

      SQL.Add('   AND HST.IDRESPONSAVEL   = :IDRESPONSAVEL ' + #13 +
              '   AND HST.IDTITULAR       = :IDTITULAR '     + #13 +
            '   AND PD.IDPROVENTO     = HST.IDRUBRICA ' );
            
            If sTabela <> 'HISTRUBSAL' Then
            begin
               SQL.Add('  AND HST.IDLOTE        = CT.IDLOTE '); 
               if (grpTipoFolha.ItemIndex = 0) and not(Chktrarubresgate.Checked) then
                       SQL.Add('  AND CT.FLGRESGATE     =  0 ' );
            end;           
               
    SQL.Add('   AND RESP.IDPESSOA     = HST.IDRESPONSAVEL ');

      SQL.Add('UNION');
    End;

    SQL.Add(' SELECT '               + #13 +
            '        HST.PARCELAS, ' );

    If ckbAgrupaRubrica.Checked = True Then
      SQL.Add('        0 AS ORDEM_1, ')
    Else
      SQL.Add('        DECODE(HST.FLGTIPODESC,''Y'',HST.ORDEM,NULL) AS ORDEM_1, ');

    SQL.Add('        DECODE(HST.FONTEPAGADORA,1,''FUND'',''INSS'') AS FONTEPAGADORA, ' + #13 +
            '        HST.IDPLANOCONTABIL, '                                            + #13 +  //BRUNO AZEVEDO SOL 143022 KINTANA 927497
            '        HST.IDTITULAR, '                                                  + #13 +
            '        HST.IDRESPONSAVEL, '                                              + #13 +
            '        RESP.NOME AS RESPONSAVEL, '                                       + #13 +
            '        HST.IDPATRO, '                                                    + #13 +
            '        HST.MES, '                                                        + #13 +
            '        HST.MESCOBRANCA, ');

    If SistemaFolha.FlgUsaCodRubExt = 0 Then
      SQL.Add('        PD.IDPROVENTO, ' + #13 +
              '        PD.DESCRICAO, '  + #13 +
              '        PD.FLGDESCONTO, ')
    Else
      SQL.Add('        NVL(PD.CODPROVDESC,PD.IDPROVENTO) AS IDPROVENTO, ' + #13 +
              '        NVL(PD.DESCRPROVDESC,PD.DESCRICAO) AS DESCRICAO, ' + #13 +
              '        PD.FLGDESCONTO, ');

    // preenche o campo-chave da relação M/D para o caso HISTRUBSAL
    If sTabela = 'HISTRUBSAL' Then
    Begin
      If (SistemaFolha.FLGAGRUPARUBRICA = 0) AND
         (ckbAgrupaRubrica.Checked = False) Then                
        SQL.Add('        HST.IDHSTFOLHABENEF, HST.SEQRUBRICA, ')
      Else
        SQL.Add('        HST.IDHSTFOLHABENEF, ') 
    End
    Else
    Begin
      If (SistemaFolha.FLGAGRUPARUBRICA = 0) AND
         (ckbAgrupaRubrica.Checked = False) Then                
        SQL.Add('        HST.SEQRUBRICA, HST.ORDEM, ')
      Else
        SQL.Add('        HST.ORDEM, ');
    End;

    If (SistemaFolha.FLGAGRUPARUBRICA = 0) AND
       (ckbAgrupaRubrica.Checked = False) Then                
      SQL.Add('        DECODE(PD.FLGDESCONTO,0,HST.VALORPROVENTO) AS PROVENTO, ' + #13 +
              '        DECODE(PD.FLGDESCONTO,1,HST.VALORPROVENTO) AS DESCONTO, ' + #13 +
              '        DECODE(PD.FLGESPECIAL, ' +
              ' 0, DECODE(PD.FLGDESCONTO, ' +
              ' 2, HST.VALORINFO||'' (I)'', ' +
              ' 0, NULL, '+
              ' 1, DECODE(HST.VALORRECEBIDO-HST.VALORPROVENTO, ' +
              ' 0, DECODE(HST.VALORINFO, ' +
              ' 0, NULL, HST.VALORINFO||'' (I)''), ' +
              ' HST.VALORRECEBIDO-HST.VALORPROVENTO||'' (R)'')), ' +
              ' DECODE(HST.VALORPROVENTO,0,HST.VALORINFO, '+
              ' NVL(HST.VALORPROVENTO,HST.VALORINFO))||'' (I)'') INFORMATIVO ')
    Else
      SQL.Add('        SUM(DECODE(PD.FLGDESCONTO,0,HST.VALORPROVENTO)) AS PROVENTO, ' + #13 +
              '        SUM(DECODE(PD.FLGDESCONTO,1,HST.VALORPROVENTO)) AS DESCONTO, ' + #13 +
              '        DECODE(PD.FLGESPECIAL, '+
              ' 0, DECODE(PD.FLGDESCONTO, '+
              ' 2, SUM(HST.VALORINFO)||'' (I)'', '+
              ' 0, NULL, '+
              ' 1, DECODE(SUM(HST.VALORRECEBIDO-HST.VALORPROVENTO), '+
              ' 0, DECODE(SUM(HST.VALORINFO), '+
              ' 0, NULL, SUM(HST.VALORINFO)||'' (I)''), '+
              ' SUM(HST.VALORRECEBIDO-HST.VALORPROVENTO)||'' (R)'')), '+
              ' DECODE(SUM(HST.VALORPROVENTO),0,SUM(HST.VALORINFO), '+
              'SUM(NVL(HST.VALORPROVENTO,HST.VALORINFO)))||'' (I)'') INFORMATIVO ');

    SQL.Add(' FROM '                  + #13 +
            '      '+sTabela+' HST, ' + #13 +
            '      PROVDESC PD, '     + #13 +
            '      PESSOA RESP '  );
            If sTabela <> 'HISTRUBSAL' Then
               SQL.Add('      ,CTRLINTERFACE CT ');
    SQL.Add(' WHERE 1 = 1 ');

    If (ckbAgrupaRubrica.Checked) Then
    Begin
      SQL.Add('   AND (PD.FLGAGRUPA = 1) ');
    End;

    // constrói o filtro de acordo com a tabela.
    If sTabela = 'HISTRUBSAL' Then
      SQL.Add('   AND HST.IDHSTFOLHABENEF = :IDLOTE ')
    Else
    Begin
      If sidlote <> '' then
        SQL.Add('   AND HST.IDLOTE = :IDLOTE ')
      Else
        If cmbMes.Text <> '' Then
          SQL.Add('   AND HST.MESCOBRANCA = :MESCOBRANCA ');
    End;

    SQL.Add('   AND HST.IDRESPONSAVEL = :IDRESPONSAVEL ' + #13 +
            '   AND HST.IDTITULAR     = :IDTITULAR '     + #13 +
            '   AND PD.IDPROVENTO     = HST.IDRUBRICA ' );
            
            If sTabela <> 'HISTRUBSAL' Then
            begin
               SQL.Add('  AND HST.IDLOTE        = CT.IDLOTE '); 
               if (grpTipoFolha.ItemIndex = 0) and not(Chktrarubresgate.Checked) then
                       SQL.Add('  AND CT.FLGRESGATE     =  0 ' );
            end;           
               
    SQL.Add('   AND RESP.IDPESSOA     = HST.IDRESPONSAVEL ');

    If (SistemaFolha.FLGAGRUPARUBRICA = 1) Or
       (ckbAgrupaRubrica.Checked = True) Then                
    Begin 
      SQL.Add(' GROUP BY HST.MESCOBRANCA, ');

      SQL.Add('          HST.PARCELAS, HST.FLGTIPODESC, HST.FONTEPAGADORA, HST.IDPLANOCONTABIL, '); //BRUNO AZEVEDO SOL 143022 KINTANA 927497

      If SistemaFolha.FlgUsaCodRubExt = 0 Then
        SQL.Add('          PD.IDPROVENTO, PD.FLGESPECIAL, ')
      Else
        SQL.Add('          PD.CODPROVDESC, PD.IDPROVENTO, PD.FLGESPECIAL, ');

      SQL.Add('          HST.IDRESPONSAVEL, RESP.NOME, HST.IDPATRO, HST.MES, '+
              '          HST.CODPORTFORMA, ');

      // INCLUI A ORDEM DA RUBRICA DE ACORDO COM A TABELA (GROUP BY).
      If  sTabela = 'HISTRUBSAL' Then
      Begin
        If (SistemaFolha.FLGAGRUPARUBRICA = 0) AND
           (ckbAgrupaRubrica.Checked = False) Then                
          SQL.Add('          HST.SEQRUBRICA, HST.IDHSTFOLHABENEF, ')
        Else
          SQL.Add('          HST.IDHSTFOLHABENEF, '); 
        SQL.Add('          DECODE(HST.FLGTIPODESC,''Y'',HST.ORDEM,NULL), '); 
      End
      Else
      Begin
        If (SistemaFolha.FLGAGRUPARUBRICA = 0) AND
           (ckbAgrupaRubrica.Checked = False) Then                
          SQL.Add('          HST.SEQRUBRICA, HST.ORDEM, ')
        Else
          SQL.Add('          HST.ORDEM, '); 
      End;

      If SistemaFolha.FlgUsaCodRubExt = 0 Then
        SQL.Add('          PD.DESCRICAO, PD.FLGDESCONTO, HST.IDTITULAR ')
      Else
        SQL.Add('          PD.DESCRPROVDESC, PD.DESCRICAO, PD.FLGDESCONTO, HST.IDTITULAR ');
    End;

    If ckbAgrupaRubrica.Checked = True Then
    Begin
      SQL.Add(' ) ');

      If SistemaFolha.FlgUsaCodRubExt = 0 Then
        SQL.Add(' ORDER BY FLGDESCONTO, MES, IDPROVENTO ')
      Else
        SQL.Add(' ORDER BY SEQRUBRICA, FLGDESCONTO, MES, CODPROVDESC ');
    End
    Else
    Begin
      If SistemaFolha.FlgUsaCodRubExt = 0 Then
      Begin
        If (SistemaFolha.FLGAGRUPARUBRICA = 0) AND
           (Not ckbAgrupaRubrica.Checked) Then
          SQL.Add(' ORDER BY HST.SEQRUBRICA, PD.FLGDESCONTO, HST.MES, PD.IDPROVENTO ')
        Else
          SQL.Add(' ORDER BY PD.FLGDESCONTO, HST.MES, PD.IDPROVENTO ');
      End
      Else
      Begin
        If SistemaFolha.FLGAGRUPARUBRICA = 0 Then
          SQL.Add(' ORDER BY HST.SEQRUBRICA, PD.FLGDESCONTO, HST.MES, PD.CODPROVDESC ')
        Else
          SQL.Add(' ORDER BY PD.FLGDESCONTO, HST.MES, PD.CODPROVDESC ');
      End;
    End;

  dtmPREVIA.qryDetalhe.DataSource := dtmPREVIA.dsPREVIA;

  Open;
  End; { Fim do With dtmprevia.qryDetalhe Do Begin }
end;

procedure TfrmPRelPREVIA.FormActivate(Sender: TObject);
var
   wDia, wMes, wAno : Word;
begin
   inherited;
   DecodeDate(Date, wAno, wMes, wDia);
   // Inicialização das Variáveis
   spedAno.Value        := wAno;
   edBeneficiario.Text  := '';
   edTitular.Text       := '';
   edMatricula.Text     := '';
   edNumInscr.Text      := '';
   sIdPessoa            := '';
   sIdPessJur           := '';
   sIdPlanoPrev         := '';
   sIdTitular           := '';
end; 

procedure TfrmPRelPREVIA.FormClose(Sender: TObject;var Action: TCloseAction);
begin
  inherited;
  qryMotivo.Close;
  Action := caFree;
end; 

procedure TfrmPRelPREVIA.bbtnFecharClick(Sender: TObject);
begin
  inherited;
  Close;
end; 

procedure TfrmPRelPREVIA.bbtnProcurarClick(Sender: TObject);
  {=> BuscaTitular procura o titular apartir de uma matricula ou num. de inscrição.}
  Function BuscaTitular(Tipo: Char): Boolean;
  begin
    Result := True;
    qryAux.sql.Clear;
    qryAux.Sql.Add(' SELECT P.IDPESSOA, PPP.INSCRICAONUMERO, E.MATRICULA, P.NOME '+
                   ' FROM PARTPREVPLAN PPP, ELEGPATRO E, PESSOA P ');
    case Tipo of
      'M' : qryAux.Sql.Add(' WHERE E.MATRICULA LIKE '+QuotedStr(edMatricula.Text+'%')+'  ');
      'I' : qryAux.Sql.Add(' WHERE PPP.INSCRICAONUMERO = '+edNumInscr.Text+'  ');
    end;
    qryAux.Sql.Add('  AND E.IDPESSOA = PPP.IDPESSOA '+
                   '  AND P.IDPESSOA  = E.IDPESSOA   ');
    qryAux.Open;
    if qryAux.IsEmpty then Result := False;
  end;
  {<=Fim BuscaTitular}

  {=> VerificaBenef: acha os beneficiários do titular e coloca numa combobox.}
  procedure VerificaBenef(TITULAR: Integer);
  begin
    with qryBeneficio do
    begin
      Close;
      Params[0].AsInteger := Titular;
      Open;
      if Not IsEmpty then
        cmbBeneficio.BringToFront
      else cmbBeneficio.SendToBack;
    end;
  end;
  {<=Fim VerificaBenef}

var wsql,
    sMesRef : String;
begin  
  inherited;
  // verifica se os campos de inscrição ou matrícula estão preenchidos,
  // caso negativo executa o montaselect.
  if (edMatricula.Text <> '')  then
  begin
    if BuscaTitular('M') then
    begin
      // Alimenta variáveis
      EdMatricula.Text := qryAux.FieldByName('MATRICULA').AsString;
      edNumInscr.Text := qryAux.FieldByName('INSCRICAONUMERO').AsString;
      sIdTitular := qryAux.FieldByName('IDPESSOA').AsString;
      edTitular.Text := qryAux.FieldByName('NOME').AsString;
    end else
    begin
      EdMatricula.Clear;
      EdNumInscr.Clear;
      edTitular.Clear;
      sIdTitular := '';
      MsgDlg('Não foi encontrado nenhum participante com esta Matrícula.',
             'Aviso',mtInformation,[mbOK],0);
    end;
    Exit;
  end else if edNumInscr.Text <> '' then
  begin
    if BuscaTitular('I') then
    begin
      // Alimenta variáveis
      EdMatricula.Text := qryAux.FieldByName('MATRICULA').AsString;
      edNumInscr.Text := qryAux.FieldByName('INSCRICAONUMERO').AsString;
      sIdTitular := qryAux.FieldByName('IDPESSOA').AsString;
      edTitular.Text := qryAux.FieldByName('NOME').AsString;
    end else
    begin
      EdMatricula.Clear;
      EdNumInscr.Clear;
      edTitular.Clear;
      sIdTitular := '';
      MsgDlg('Não foi encontrado nenhum participante com este Número de Inscrição.',
             'Aviso',mtInformation,[mbOK],0);
    end;
    Exit;
  end;

  sMesRef := Trim(spedAno.Text)+ '/'+ IntCod(cmbMes.ItemIndex+1,2);
  MontaSelectBenef.Filtro.Clear;
  MontaSelectBenef.Filtro.Add('BF.IDTITULAR   = EL.IDPESSOA       ');
  MontaSelectBenef.Filtro.Add('PP.IDPESSJUR   = BF.IDPESSJUR      ');
  MontaSelectBenef.Filtro.Add('PP.IDPESSOA    = BF.IDTITULAR      ');
  MontaSelectBenef.Filtro.Add('PP.IDPLANOPREV = BF.IDPLANOPREV    ');
//  MontaSelectBenef.Filtro.Add('PP.FLGDESATIVADO = 0               ');   // SOL 119584
  MontaSelectBenef.Filtro.Add('PAT.IDPESSOA   = BF.IDPESSJUR      ');
  MontaSelectBenef.Filtro.Add('DEP.IDPESSOA   = BF.IDPESSOA       ');
  MontaSelectBenef.Filtro.Add('TIT.IDPESSOA   = BF.IDTITULAR      ');
  MontaSelectBenef.Filtro.Add('PL.IDPLANOPREV = BF.IDPLANOPREV    ');
  MontaSelectBenef.Filtro.Add('BF.IDPESSOA    = DP.IDPESSOA(+)    ');  
  MontaSelectBenef.Executar;
  edTitular.Text       := '';
  edMatricula.Text     := '';
  edNumInscr.Text      := '';
  sIdPessoa            := '';
  sIdPessJur           := '';
  sIdPlanoPrev         := '';
  sIdBeneficio         := '';
  sIdRubrica           := '';
  sIdTitular           := '';
end; 

procedure TfrmPRelPREVIA.blkcmpHistoricoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin 
  inherited;
  cmbMes.ItemIndex := strtoint(copy(qryhistorico.fieldbyname('mesreferencia').AsString,6,2))-1;
  spedAno.value    := strtoint(copy(qryhistorico.fieldbyname('mesreferencia').AsString,1,4));
end; 

Function TfrmPRelPREVIA.fTotLinhas(sArquivo : String) : Integer;
Var oArquivo : TextFile;
    iQtd     : Integer;
    sLinha   : String;
Begin 
  // Inicializa Variáveis
  iQtd := 0;
  // Abre arquivo especificado
  AssignFile(oArquivo, sArquivo);
  Reset (oArquivo);
  // Loop para pegar as matrículas
  While Not Eof(oArquivo) Do
  Begin
    ReadLn(oArquivo, sLinha);
    iQtd := iQtd + 1;
  End;
  CloseFile(oArquivo);
  Result := iQtd;
End; 

procedure TfrmPRelPREVIA.MontaQryRubricaIndiv;
var ssql: string;
begin
  ssql:='SELECT R.DATAINICIO, '+
               'R.DATAFINAL, '+
               'R.NUMOCORRENCIAS, '+
               'R.PARCELAS, '+
               'NVL(PD.CODPROVDESC, PD.IDPROVENTO) AS CODRUBRICA, '+
               'NVL(PD.DESCRPROVDESC, PD.DESCRICAO) AS NOMERUBRICA, '+
               'R.SEQRUBRICAINDIV, '+
               'R.IDREGRACALCULO, '+
               'RG.NOMEREGRA, '+
               'R.VALORRUBRICA, '+
               'DECODE(R.FLGPERMANENTE,1,''Sim'',''Não'') AS PERMANENTE, '+
               'DECODE(R.FLGPENSAOALIM,1,''Sim'',''Não'') AS PENSAOALIM '+
        'FROM RUBRICAINDIV R, PROVDESC PD, REGRA RG '+
        'WHERE R.IDTITULAR = :IDTITULAR '+
        'AND R.IDPESSOA = :IDRESPONSAVEL '+
        'AND R.IDEMPRESA = 1 '+
        'AND R.FLGTPRUBMANUT = ''1'' '+
        'AND PD.IDPROVENTO = R.IDRUBRICA '+
        'AND R.IDREGRACALCULO = RG.IDREGRA '+
        'AND ((R.FLGPERMANENTE = 1) OR '+
             '(R.FLGPERMANENTE = 0 AND (R.PARCELAS-R.NUMOCORRENCIAS > 1))) ';
//        'AND NVL(R.FLGDESATIVADO,0) = 0 ';          // SOL119584
  DtmPrevia.qryRubIndiv.Close;
  DtmPrevia.qryRubIndiv.Sql.Clear;
  DtmPrevia.qryRubIndiv.Sql.Add(sSql);
  DtmPrevia.qryRubIndiv.Params[0].DataType:=ftInteger;
  DtmPrevia.qryRubIndiv.Params[1].DataType:=ftInteger;
end;

procedure TfrmPRelPREVIA.MontaQryAcaoJudicial;
var ssql: string;
begin
  ssql:='SELECT DJ.IDREGRA, '+
               'RG.NOMEREGRA, '+
               'NVL(PD.CODPROVDESC, PD.IDPROVENTO) AS CODRUBRICA, '+
               'NVL(PD.DESCRPROVDESC, PD.DESCRICAO) AS NOMERUBRICA, '+
               'DECODE(PJ.FLGFAZDEPOSITO,1,''Sim'',''Não'') AS FAZDEPOSITO, '+
               'DECODE(PJ.SITPROCESSO,0,''Ação Judicial em Liminar'', '+
                       '1,''Ação Judicial Julgada Ganha'', '+
                       '2,''Ação Judicial Julgada Perdida'') AS SITUACAO '+
        'FROM PROCJUD PJ, DETPROCJUD DJ, REGRA RG, PROVDESC PD '+
        'WHERE PJ.IDPESSOA = :IDRESPONSAVEL '+
        'AND PJ.IDPROCJUD = DJ.IDPROCJUD '+
        'AND DJ.IDREGRA = RG.IDREGRA(+) '+
        'AND DJ.IDRUBRICA = PD.IDPROVENTO(+) '+
        'AND DJ.FLGATIVA = 0 ';
  DtmPrevia.qryAcJud.Close;
  DtmPrevia.qryAcJud.Sql.Clear;
  DtmPrevia.qryAcJud.Sql.Add(sSql);
  DtmPrevia.qryAcJud.Params[0].DataType:=ftInteger;
end;

Procedure TfrmPRelPREVIA.MontaQryBenef;
Var sSql: String;
begin
  sSql:=
    'SELECT DISTINCT BBF.NUMEROPROCESSO, BBF.DATAINICIO, '+_clinefeed+
    '       BBF.VLRINFINSS, BBF.VALORSRB, BBF.VALORTOTAL, '+_clinefeed+
    '       NVL(BBF.FLGDATAPREVISTA, 0) AS FLGDATAPREVISTA, '+_clinefeed+
    '       DECODE(BBF.FLGDATAPREVISTA, 0, ''Data Final'', 1, ''Data Final Prev.'') AS TEXTOLABEL, '+_clinefeed+
    '       DECODE(BBF.FLGDATAPREVISTA, 0, BBF.DATAFINAL, 1, BBF.DATAFINALPREVISTA) AS DATAFINAL '+_clinefeed+
    'FROM BENEFBFCIARIO BBF, HSTBENEFBFCIARIO HBF, '+_clinefeed+
    '     BENEFPLANPREV BPV, BENEFICIO BEN '+_clinefeed+
    'WHERE '+_clinefeed;
  If sTabela = 'HISTRUBSAL' then
    sSql:=sSql+
      '       HBF.IDHSTFOLHABENEF = :IDLOTE '+_clinefeed
  else
    sSql:=sSql+
      '       HBF.IDLOTE = :IDLOTE '+_clinefeed;
  sSql:=sSql+
    'AND HBF.IDTITULAR = :IDTITULAR '+_clinefeed+
    'AND HBF.IDTITULAR = BBF.IDTITULAR '+_clinefeed+
    'AND HBF.IDPLANOPREV = BBF.IDPLANOPREV '+_clinefeed+
    'AND HBF.IDBENEFICIO = BBF.IDBENEFICIO '+_clinefeed+
    'AND BBF.IDBENEFICIO = BPV.IDBENEFICIO '+_clinefeed+
    'AND BBF.IDPLANOPREV = BPV.IDPLANOPREV '+_clinefeed+
    'AND BBF.IDBENEFICIO = BEN.IDBENEFICIO '+_clinefeed+
    'AND BPV.FLGREFERENCIA = 0 '+_clinefeed+
    'AND BEN.TIPOBENEFICIO < 99 '+_clinefeed;

  //TRATA CASOS DA NÃO EXISTÊNCIA DO BENEFÍCIO FUNDAÇÃO-APENAS INSS
  sSql:=sSql+
    'UNION '+_clinefeed+
    'SELECT DISTINCT BBF.NUMEROPROCESSO, BBF.DATAINICIO, '+_clinefeed+
    '       BBF.VLRINFINSS, BBF.VALORSRB, BBF.VALORTOTAL, '+_clinefeed+
    '       NVL(BBF.FLGDATAPREVISTA, 0) AS FLGDATAPREVISTA, '+_clinefeed+
    '       DECODE(BBF.FLGDATAPREVISTA, 0, ''Data Final'', 1, ''Data Final Prev.'') AS TEXTOLABEL, '+_clinefeed+
    '       DECODE(BBF.FLGDATAPREVISTA, 0, BBF.DATAFINAL, 1, BBF.DATAFINALPREVISTA) AS DATAFINAL '+_clinefeed+
    'FROM BENEFBFCIARIO BBF, HSTBENEFBFCIARIO HBF, '+_clinefeed+
    '     BENEFPLANPREV BPV, BENEFICIO BEN '+_clinefeed+
    'WHERE '+_clinefeed;
  If sTabela = 'HISTRUBSAL' then
    sSql:=sSql+
      '       HBF.IDHSTFOLHABENEF = :IDLOTE '+_clinefeed
  else
    sSql:=sSql+
      '       HBF.IDLOTE = :IDLOTE '+_clinefeed;
  sSql:=sSql+
    'AND HBF.IDTITULAR = :IDTITULAR '+_clinefeed+
    'AND HBF.IDTITULAR = BBF.IDTITULAR '+_clinefeed+
    'AND HBF.IDPLANOPREV = BBF.IDPLANOPREV '+_clinefeed+
    'AND HBF.IDBENEFICIO = BBF.IDBENEFICIO '+_clinefeed+
    'AND BBF.IDBENEFICIO = BPV.IDBENEFICIO '+_clinefeed+
    'AND BBF.IDPLANOPREV = BPV.IDPLANOPREV '+_clinefeed+
    'AND BBF.IDBENEFICIO = BEN.IDBENEFICIO '+_clinefeed+
    'AND BPV.FLGREFERENCIA = 1 '+_clinefeed+
    'AND BEN.TIPOBENEFICIO < 99 '+_clinefeed+
    'AND NOT EXISTS (SELECT 1 '+_clinefeed+
    '            FROM BENEFBFCIARIO BBF, HSTBENEFBFCIARIO HBF, '+_clinefeed+
    '                 BENEFPLANPREV BPV, BENEFICIO BEN '+_clinefeed+
    '            WHERE '+_clinefeed;
  if sTabela = 'HISTRUBSAL' then
    sSql:=sSql+
      '       HBF.IDHSTFOLHABENEF = :IDLOTE '+_clinefeed
  else
    sSql:=sSql+
      '       HBF.IDLOTE = :IDLOTE '+_clinefeed;
  sSql:=sSql+
    'AND HBF.IDTITULAR = :IDTITULAR '+_clinefeed+
    'AND HBF.IDTITULAR = BBF.IDTITULAR '+_clinefeed+
    'AND HBF.IDPLANOPREV = BBF.IDPLANOPREV '+_clinefeed+
    'AND HBF.IDBENEFICIO = BBF.IDBENEFICIO '+_clinefeed+
    'AND BBF.IDBENEFICIO = BPV.IDBENEFICIO '+_clinefeed+
    'AND BBF.IDPLANOPREV = BPV.IDPLANOPREV '+_clinefeed+
    'AND BBF.IDBENEFICIO = BEN.IDBENEFICIO '+_clinefeed+
    'AND BPV.FLGREFERENCIA = 0 '+_clinefeed+
    'AND BEN.TIPOBENEFICIO < 99) '+_clinefeed;
  if ((grpTipoFolha.ItemIndex = 0) and
      //CONSIDERA FOLHA DE PAGAMENTO PENDENTE
      (qryLote.FieldByName('FLGTIPOFOLHA').asinteger in [1,2])) or
     ((grpTipoFolha.ItemIndex = 1) and
      (qryHistorico.FieldByName('FLGTIPOFOLHA').asinteger in [1,2])) then
  begin
    sSql:=sSql+
      'UNION '+_clinefeed+
      'SELECT 0 AS NUMEROPROCESSO, SYSDATE AS DATAINICIO, 0 AS VLRINFINSS, '+_clinefeed+
      '       0 AS VALORSRB, 0 AS VALORTOTAL, '+_clinefeed+
      '       0 AS FLGDATAPREVISTA,  '' '' AS TEXTOLABEL, SYSDATE AS DATAFINAL '+_clinefeed+
      'FROM PESSOA '+_clinefeed+
      'WHERE IDPESSOA = :IDTITULAR '+_clinefeed+
      'AND NOT EXISTS (SELECT 1 '+_clinefeed+
      '            FROM BENEFBFCIARIO BBF, HSTBENEFBFCIARIO HBF, '+_clinefeed+
      '                 BENEFPLANPREV BPV, BENEFICIO BEN '+_clinefeed+
      '            WHERE '+_clinefeed;
    if sTabela = 'HISTRUBSAL' then
      sSql:=sSql+
        '       HBF.IDHSTFOLHABENEF = :IDLOTE '+_clinefeed
    else
      sSql:=sSql+
        '       HBF.IDLOTE = :IDLOTE '+_clinefeed;
    sSql:=sSql+
      'AND HBF.IDTITULAR = :IDTITULAR '+_clinefeed+
      'AND HBF.IDTITULAR = BBF.IDTITULAR '+_clinefeed+
      'AND HBF.IDPLANOPREV = BBF.IDPLANOPREV '+_clinefeed+
      'AND HBF.IDBENEFICIO = BBF.IDBENEFICIO '+_clinefeed+
      'AND BBF.IDBENEFICIO = BPV.IDBENEFICIO '+_clinefeed+
      'AND BBF.IDPLANOPREV = BPV.IDPLANOPREV '+_clinefeed+
      'AND BBF.IDBENEFICIO = BEN.IDBENEFICIO '+_clinefeed+
      'AND BPV.FLGREFERENCIA = 0 '+_clinefeed+
      'AND BEN.TIPOBENEFICIO < 99) '+_clinefeed;
  end;

  DtmPrevia.qryBenef.Close;
  DtmPrevia.qryBenef.Sql.Clear;
  DtmPrevia.qryBenef.Sql.Add(sSql);
  DtmPrevia.qryBenef.Params[0].DataType:=ftInteger;
  DtmPrevia.qryBenef.Params[1].DataType:=ftInteger;

end;

procedure TfrmPRelPREVIA.rbtnvisualizarClick(Sender: TObject);
var
  sMesReferencia, sMesCobranca : String;
  sSql          , ssqlCount    : String;
  TabHistRubSal                : String;
  sMotivoTeste                 : String;
  Ordem, I, iPos      : Integer;
begin
  inherited;

  dtmBaseDados.dbBaseDados.StartTransaction;
  if not Sistema.GravaLogOperacoes('Emissão: '+caption) then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;

  MontaQryBenef;

  //Higor Nayde Ferreira SOL 185038 KINTANA 1812976 Inicio
  IF not cboxIndividual.checked then
  begin
  sSql := sSql +
                  //BRUNO AZEVEDO SOL 141143 KINTANA 905094
                'SELECT NADA,                                 '+
                '       IDRESPONSAVEL,                        '+
                '       IDTITULAR,                            '+
                '       PATRO,                                '+
                '       IDPATRO,                              '+
               // '       IDPLANOPREV,                          '+
               // '       PLANO,                                '+
                '       RESPONSAVEL,                          '+
                '       TITULAR,                              '+
                '       EPP,                                  '+
                '       MESCOBRANCA,                          '+
                '       FLGISENTOIRRF,                        '+
                '       DATANASC,                             '+
                '       NUMDEPIRRF,                           '+
                '       INSCRICAONUMERO,                      '+
                '       MATRICULA,                            '+
                '       CODPORTFORMA,                         '+
                '       TIPOOPCAOIR,                          ';
                if sTabela = 'HISTRUBSAL' then
                  sSQL := sSQL +'        IDHSTFOLHABENEF AS IDLOTE '
                else
                  sSQL := sSQL +'        IDLOTE ';

                // sSQL := sSQL +'       rank FROM (                           '+
                 sSQL := sSQL +'        FROM (                           '+
                //BRUNO AZEVEDO SOL 141143 KINTANA 905094
                 ' SELECT DISTINCT 1 AS NADA,       '                                                      + #13 +
                 '        H.IDRESPONSAVEL,          '                                                      + #13 +
                 '        H.IDTITULAR,              '                                                      + #13 +
                 '        PAT.NOME AS PATRO,        '                                                      + #13 +
                 '        H.IDPATRO,                '                                                      + #13 +
                // '        H.IDPLANOPREV,            '                                                      + #13 +
                // '        PL.NOME AS PLANO,         '                                                      + #13 +
                 '        RESP.NOME AS RESPONSAVEL, '                                                      + #13 +
                 '        TIT.NOME AS TITULAR,      '                                                      + #13 +
                 '        EPP.NOME AS EPP,          '                                                      + #13 + //Cprev - 26800
                 '        H.MESCOBRANCA,            '                                                      + #13 +
                 '        PF.FLGISENTOIRRF,         '                                                      + #13 +
                 '        PF.DATANASC,              '                                                      + #13 +
                 '        PF.NUMDEPIRRF,            '                                                      + #13 +
                 '        PPP.INSCRICAONUMERO,      '                                                      + #13 +
                 '        EL.MATRICULA,             '                                                      + #13 +
                 '        H.CODPORTFORMA,           '                                                      + #13 +
                 '        DECODE(PPP.TIPOOPCAOIR, ''2'', ''Regressiva'', ''Progressiva'') AS TIPOOPCAOIR ' + #13;

  // preenche com o campo-chave de acordo com a tabela HISTRUBSAL
  if sTabela = 'HISTRUBSAL' then
    sSQL := sSQL +'        ,H.IDHSTFOLHABENEF '
  else
    sSQL := sSQL +'         ,H.IDLOTE ';

  //BRUNO AZEVEDO SOL 141143 KINTANA 905094
//  sSQL := sSQL + ' , ( RANK() over(PARTITION BY H.idtitular ORDER BY H.idplanoprev)) rank   ';

  sSQL := sSQL + ' FROM '+sTabela+' H,    ' + #13 +
                 '      PESSOAFISICA PF,  ' + #13 +
                 '      ELEGPATRO    EL,  ' + #13 +
                 '      PARTPREVPLAN PPP, ' + #13 +
                 '      PLANPREV     PL,  ' + #13 +
                 '      PESSOA       RESP,' + #13 +
                 '      PESSOA       TIT, ' + #13 +
                 '      PESSOA       PAT, ' + #13 +
                 '      PESSOA       EPP  ' + #13;   //CPrev - 26800
                 if sTabela = 'HISTRUBSAL' then begin
                   sSQL := sSQL + ', hstfolhabenef hsT ';
                 end else begin
                   sSQL := sSQL + ', CTRLINTERFACE CT ';
                 end;

  if cmbBeneficio.text <> ''then
  begin
    if sTabela = 'HISTRUBSAL' then
      sSQL := sSQL + ' ,HSTBENEFBFCIARIO BNF  '
    else
      sSQL := sSQL + ' ,BENEFBFCIARIO BNF  ';
  end;

  sSQL := sSQL + ' WHERE 1 = 1 ';

  //Filtra o tipo de folha (PREVIA HISTRUBSAL) (A Prévia pode ser por Lote ou AnoMês)
  if grpTipoFolha.ItemIndex = 0 then
  begin
    if dblkpcmbLote.text <> '' then
      sSQL := sSQL + ' AND H.IDLOTE = '+qryLote.FieldByName('IDLOTE').AsString+' '
    else if cmbMes.text <> '' then
      sSQL := sSQL + ' AND H.MESCOBRANCA = '+QuotedStr(sMesRef)+' AND CT.Flgtipofolha <> 2  '; // SOL 215474 KINTANA 2044700 Xavier - Alteração para solucionar o problema da duplicidade e cabeçalho.
  end
  else
    sSQL := sSQL + ' AND H.IDHSTFOLHABENEF = '+qryHistorico.FieldByName('IDHSTFOLHABENEF').AsString+' ';

  if cmbPatro.Text <> '' then
    sSQL := sSQL + ' AND H.IDPATRO = '+qryPatro.FieldByName('IDPESSOA').AsString+' ';

  if cmbPlano.Text <> ''then
    sSQL := sSQL + ' AND H.IDPLANOPREV = '+qryPlano.FieldByName('IDPLANOPREV').AsString+' ';

  if cmbBeneficio.Text <> '' then // Independe da tabela.
    sSQL := sSQL + ' AND BNF.IDBENEFICIO = '+qryBeneficio.FieldByName('IDBENEFICIO').AsString+' ';

    if cboxIndividual.Checked then
      ssql:=ssql+'AND EXISTS (SELECT 1 '+
                             'FROM LISTAFOLHABENEFDET LD '+
                             'WHERE H.IDTITULAR = LD.IDTITULAR '+
                             'AND LD.IDLISTA = '+inttostr(frameBenef.ListaUsuario)+') '
    else
      if (sIdTitular <> '') then
        ssql:=ssql+' AND H.IDTITULAR = '+sIdTitular+' ';

  //BRUNO AZEVEDO SOL 136490 KINTANA 817135
        if sTabela = 'HISTRUBSAL' then begin
          sSQL := sSQL + ' AND H.IDHSTFOLHABENEF = '+qryHistorico.FieldByName('IDHSTFOLHABENEF').AsString+' ' +
                         ' AND (PL.IDPLANOPREV = H.IDPLANOPREV) ' +
                         ' AND (PF.IDPESSOA = H.IDRESPONSAVEL) ' +
                         ' AND (RESP.IDPESSOA = H.IDRESPONSAVEL) ' +
                         ' AND (TIT.IDPESSOA = H.IDTITULAR) ' +
                         ' AND (EPP.IDPESSOA = NVL(H.IDRECEBEPGTO, H.IDRESPONSAVEL)) ' +
                         ' AND (PPP.IDPESSOA = H.IDTITULAR) ' +
                         ' AND (PPP.IDPESSJUR = H.IDPATRO) ' +
                         ' AND (((H.IDPLANOPREV = PPP.IDPLANOPREV) AND ' +
                         '     (H.IDRESPONSAVEL = H.IDTITULAR)) OR ' +
                         '     ((H.IDPLANOORIGEM = PPP.IDPLANOPREV) AND ' +
                         '     (H.IDRESPONSAVEL <> H.IDTITULAR))) ' +
                         ' AND (EL.IDPESSOA = H.IDTITULAR) ' +
                         ' AND (EL.IDPESSJUR = H.IDPATRO) ' +
                         ' AND (PAT.IDPESSOA = H.IDPATRO) ' +
                         ' AND h.idhstfolhabenef = HST.IDHSTFOLHABENEF ' +
                         //BRUNO AZEVEDO SOL 139176 KINTANA 852660
                         //ADICIONADO OR UPPER(HST.HISTORICO) LIKE ''%PORT%''
                         ' AND (UPPER(HST.HISTORICO) LIKE ''%ADT%'' OR UPPER(HST.HISTORICO) LIKE ''%RESG%'' OR UPPER(HST.HISTORICO) LIKE ''%PORT%'' ' +
                         '                                           AND EXISTS (SELECT 1 ' +
                         '                                           FROM HSTBENEFBFCIARIO HS ' +
                         '                                           WHERE HS.IDPESSOA = H.IDPESSOA ' +
                         '                                             AND HS.IDTITULAR = H.IDTITULAR ' +
                         '                                             AND hs.idhstfolhabenef = h.idhstfolhabenef ' +
                         '                                             AND HS.MES = H.MESCOBRANCA ' +
                         '                                             AND HS.IDPLANOPREV = H.IDPLANOPREV) ' +
                         '      OR (UPPER(HST.HISTORICO) LIKE ''%FOLHA%'' )) ';
        end else begin
          sSQL := sSQL + ' AND (PL.IDPLANOPREV = H.IDPLANOPREV) ' +
                         ' AND (PF.IDPESSOA = H.IDRESPONSAVEL)  ' +
                         ' AND (RESP.IDPESSOA = H.IDRESPONSAVEL)' +
                         ' AND (TIT.IDPESSOA = H.IDTITULAR)     ' +
                         ' AND (EPP.IDPESSOA = NVL(H.IDRECEBEPGTO, H.IDRESPONSAVEL))' +
                         ' AND H.IDLOTE = CT.IDLOTE ' ;
                         //  SOL 147567 KINTANA 1022979
                         if (grpTipoFolha.ItemIndex = 0) and not(Chktrarubresgate.Checked) then
                            sSQL := sSQL + ' AND CT.FLGRESGATE  =  0 ' ;

                      // Andre Imakawa - SIG 125110
                      if dblkpcmbLote.text = '' then
                         //  SOL 147567 KINTANA 1022979
                         //BRUNO AZEVEDO SOL 139176 KINTANA 852660
                         //ADICIONADO OR UPPER(CT.DESCRICAO) LIKE '%PORT%'
                      sSQL := sSQL +   ' AND (UPPER(CT.DESCRICAO) LIKE ''%ADT%'' OR UPPER(CT.DESCRICAO) LIKE ''%RESG%'' OR UPPER(CT.DESCRICAO) LIKE ''%PORT%''  AND ' +
                         '                                          H.IDLOTE IN (SELECT HS.IDLOTE ' +
                         '                                                       FROM HSTBENEFBFCIARIO HS ' +
                         '                                                      WHERE HS.IDPESSOA = H.IDPESSOA ' +
                         '                                                        AND HS.IDTITULAR = H.IDTITULAR ' +
                         '                                                        AND HS.MES = H.MESCOBRANCA ' +
                         '                                                        AND HS.IDPLANOPREV = H.IDPLANOPREV) ' +
                         '       OR UPPER(CT.DESCRICAO) LIKE ''%BENEF%'' OR UPPER(CT.DESCRICAO) LIKE ''%PREPA%'' OR UPPER(CT.DESCRICAO) LIKE ''%CONTRIB%''  ) ';

                      sSQL := sSQL + ' AND (PPP.IDPESSOA       = H.IDTITULAR) ' +
                         ' AND (PPP.IDPESSJUR      = H.IDPATRO) ' +
                         ' AND (((H.IDPLANOPREV   = PPP.IDPLANOPREV) AND (H.IDRESPONSAVEL  =  H.IDTITULAR)) ' +
                         '  OR ((H.IDPLANOORIGEM = PPP.IDPLANOPREV) AND (H.IDRESPONSAVEL  <> H.IDTITULAR)) ) ' +
                         ' AND (EL.IDPESSOA        = H.IDTITULAR) ' +
                         ' AND (EL.IDPESSJUR       = H.IDPATRO) ' +
                         ' AND (PAT.IDPESSOA       = H.IDPATRO)';
        end;
        //BRUNO AZEVEDO SOL 136490 KINTANA 817135

  if cmbBeneficio.text <> ''then
  begin
    if sTabela = 'HISTRUBSAL' then
      sSQL := sSQL +'  AND H.IDTITULAR        = BNF.IDTITULAR     '+
                    '  AND H.IDPLANOPREV      = BNF.IDPLANOPREV   '+
                    '  AND H.IDPATRO          = BNF.IDPESSJUR     '+
                    '  AND H.IDMOTIVO         = BNF.IDMOTIVO      '+
                    '  AND H.MES              = BNF.MES           '
    else
      sSQL := sSQL +'  AND H.IDTITULAR        = BNF.IDTITULAR     '+
                    '  AND H.IDPLANOPREV      = BNF.IDPLANOPREV   '+
                    '  AND H.IDPATRO          = BNF.IDPESSJUR     '+
                    '  AND H.SEQPROPOSTA      = BNF.SEQPROPOSTA   '+
                    '  AND H.IDPESSOA         = BNF.IDPESSOA )   ';
  end;

   sSQL := sSQL +' )'; //BRUNO AZEVEDO SOL 141143 KINTANA 905094
  //sSQL := sSQL +' ) WHERE rank = 1 '; //BRUNO AZEVEDO SOL 141143 KINTANA 905094

  //if(edMatricula.text = '0307276')then
  //    sSQL := sSQL +'OR (IDRESPONSAVEL = 842576 AND RANK = 23) '; //Higor Nayde Ferreira
   //Higor Nayde Ferreira SOL 185038 KINTANA 1812976 Fim
   end
   else
  begin
     sSql := sSql +
                  //BRUNO AZEVEDO SOL 141143 KINTANA 905094
                'SELECT NADA,                                 '+
                '       IDRESPONSAVEL,                        '+
                '       IDTITULAR,                            '+
                '       PATRO,                                '+
                '       IDPATRO,                              '+
                '       IDPLANOPREV,                          '+
                '       PLANO,                                '+
                '       RESPONSAVEL,                          '+
                '       TITULAR,                              '+
                '       EPP,                                  '+
                '       MESCOBRANCA,                          '+
                '       FLGISENTOIRRF,                        '+
                '       DATANASC,                             '+
                '       NUMDEPIRRF,                           '+
                '       INSCRICAONUMERO,                      '+
                '       MATRICULA,                            '+
                '       CODPORTFORMA,                         '+
                '       TIPOOPCAOIR,                          ';
                if sTabela = 'HISTRUBSAL' then
                  sSQL := sSQL +'        IDHSTFOLHABENEF AS IDLOTE, '
                else
                  sSQL := sSQL +'        IDLOTE, ';

                 sSQL := sSQL +'       rank FROM (                           '+
                //BRUNO AZEVEDO SOL 141143 KINTANA 905094
                 ' SELECT DISTINCT 1 AS NADA,       '                                                      + #13 +
                 '        H.IDRESPONSAVEL,          '                                                      + #13 +
                 '        H.IDTITULAR,              '                                                      + #13 +
                 '        PAT.NOME AS PATRO,        '                                                      + #13 +
                 '        H.IDPATRO,                '                                                      + #13 +
                 '        H.IDPLANOPREV,            '                                                      + #13 +
                 '        PL.NOME AS PLANO,         '                                                      + #13 +
                 '        RESP.NOME AS RESPONSAVEL, '                                                      + #13 +
                 '        TIT.NOME AS TITULAR,      '                                                      + #13 +
                 '        EPP.NOME AS EPP,          '                                                      + #13 + //Cprev - 26800
                 '        H.MESCOBRANCA,            '                                                      + #13 +
                 '        PF.FLGISENTOIRRF,         '                                                      + #13 +
                 '        PF.DATANASC,              '                                                      + #13 +
                 '        PF.NUMDEPIRRF,            '                                                      + #13 +
                 '        PPP.INSCRICAONUMERO,      '                                                      + #13 +
                 '        EL.MATRICULA,             '                                                      + #13 +
                 '        H.CODPORTFORMA,           '                                                      + #13 +
                 '        DECODE(PPP.TIPOOPCAOIR, ''2'', ''Regressiva'', ''Progressiva'') AS TIPOOPCAOIR ' + #13;

  // preenche com o campo-chave de acordo com a tabela HISTRUBSAL
  if sTabela = 'HISTRUBSAL' then
    sSQL := sSQL +'        ,H.IDHSTFOLHABENEF '
  else
    sSQL := sSQL +'         ,H.IDLOTE ';

  //BRUNO AZEVEDO SOL 141143 KINTANA 905094
  sSQL := sSQL + ' , ( RANK() over(PARTITION BY H.idtitular ORDER BY H.idplanoprev)) rank   ';

  sSQL := sSQL + ' FROM '+sTabela+' H,    ' + #13 +
                 '      PESSOAFISICA PF,  ' + #13 +
                 '      ELEGPATRO    EL,  ' + #13 +
                 '      PARTPREVPLAN PPP, ' + #13 +
                 '      PLANPREV     PL,  ' + #13 +
                 '      PESSOA       RESP,' + #13 +
                 '      PESSOA       TIT, ' + #13 +
                 '      PESSOA       PAT, ' + #13 +
                 '      PESSOA       EPP  ' + #13;   //CPrev - 26800
                 if sTabela = 'HISTRUBSAL' then begin
                   sSQL := sSQL + ', hstfolhabenef hsT ';
                 end else begin
                   sSQL := sSQL + ', CTRLINTERFACE CT ';
                 end;

  if cmbBeneficio.text <> ''then
  begin
    if sTabela = 'HISTRUBSAL' then
      sSQL := sSQL + ' ,HSTBENEFBFCIARIO BNF  '
    else
      sSQL := sSQL + ' ,BENEFBFCIARIO BNF  ';
  end;

  sSQL := sSQL + ' WHERE 1 = 1 ';
  //Filtra o tipo de folha (PREVIA HISTRUBSAL) (A Prévia pode ser por Lote ou AnoMês)
  if grpTipoFolha.ItemIndex = 0 then
  begin
    if dblkpcmbLote.text <> '' then
      sSQL := sSQL + ' AND H.IDLOTE = '+qryLote.FieldByName('IDLOTE').AsString+' '
    else if cmbMes.text <> '' then
      sSQL := sSQL + ' AND H.MESCOBRANCA = '+QuotedStr(sMesRef)+' AND CT.Flgtipofolha <> 2 '; // SOL 215474 KINTANA 2044700 Xavier - Alteração para solucionar o problema da duplicidade e cabeçalho.
  end
  else
    sSQL := sSQL + ' AND H.IDHSTFOLHABENEF = '+qryHistorico.FieldByName('IDHSTFOLHABENEF').AsString+' ';

  if cmbPatro.Text <> '' then
    sSQL := sSQL + ' AND H.IDPATRO = '+qryPatro.FieldByName('IDPESSOA').AsString+' ';

  if cmbPlano.Text <> ''then
    sSQL := sSQL + ' AND H.IDPLANOPREV = '+qryPlano.FieldByName('IDPLANOPREV').AsString+' ';

  if cmbBeneficio.Text <> '' then // Independe da tabela.
    sSQL := sSQL + ' AND BNF.IDBENEFICIO = '+qryBeneficio.FieldByName('IDBENEFICIO').AsString+' ';

    if cboxIndividual.Checked then
      ssql:=ssql+'AND EXISTS (SELECT 1 '+
                             'FROM LISTAFOLHABENEFDET LD '+
                             'WHERE H.IDTITULAR = LD.IDTITULAR '+
                             'AND LD.IDLISTA = '+inttostr(frameBenef.ListaUsuario)+') '
    else
      if (sIdTitular <> '') then
        ssql:=ssql+' AND H.IDTITULAR = '+sIdTitular+' ';

  //BRUNO AZEVEDO SOL 136490 KINTANA 817135
        if sTabela = 'HISTRUBSAL' then begin
          sSQL := sSQL + ' AND H.IDHSTFOLHABENEF = '+qryHistorico.FieldByName('IDHSTFOLHABENEF').AsString+' ' +
                         ' AND (PL.IDPLANOPREV = H.IDPLANOPREV) ' +
                         ' AND (PF.IDPESSOA = H.IDRESPONSAVEL) ' +
                         ' AND (RESP.IDPESSOA = H.IDRESPONSAVEL) ' +
                         ' AND (TIT.IDPESSOA = H.IDTITULAR) ' +
                         ' AND (EPP.IDPESSOA = NVL(H.IDRECEBEPGTO, H.IDRESPONSAVEL)) ' +
                         ' AND (PPP.IDPESSOA = H.IDTITULAR) ' +
                         ' AND (PPP.IDPESSJUR = H.IDPATRO) ' +
                         ' AND (((H.IDPLANOPREV = PPP.IDPLANOPREV) AND ' +
                         '     (H.IDRESPONSAVEL = H.IDTITULAR)) OR ' +
                         '     ((H.IDPLANOORIGEM = PPP.IDPLANOPREV) AND ' +
                         '     (H.IDRESPONSAVEL <> H.IDTITULAR))) ' +
                         ' AND (EL.IDPESSOA = H.IDTITULAR) ' +
                         ' AND (EL.IDPESSJUR = H.IDPATRO) ' +
                         ' AND (PAT.IDPESSOA = H.IDPATRO) ' +
                         ' AND h.idhstfolhabenef = HST.IDHSTFOLHABENEF ' +
                         //BRUNO AZEVEDO SOL 139176 KINTANA 852660
                         //ADICIONADO OR UPPER(HST.HISTORICO) LIKE ''%PORT%''
                         ' AND (UPPER(HST.HISTORICO) LIKE ''%ADT%'' OR UPPER(HST.HISTORICO) LIKE ''%RESG%'' OR UPPER(HST.HISTORICO) LIKE ''%PORT%'' ' +
                         '                                           AND EXISTS (SELECT 1 ' +
                         '                                           FROM HSTBENEFBFCIARIO HS ' +
                         '                                           WHERE HS.IDPESSOA = H.IDPESSOA ' +
                         '                                             AND HS.IDTITULAR = H.IDTITULAR ' +
                         '                                             AND hs.idhstfolhabenef = h.idhstfolhabenef ' +
                         '                                             AND HS.MES = H.MESCOBRANCA ' +
                         '                                             AND HS.IDPLANOPREV = H.IDPLANOPREV) ' +
                         '      OR (UPPER(HST.HISTORICO) LIKE ''%FOLHA%'' )) ';
        end else begin
          sSQL := sSQL + ' AND (PL.IDPLANOPREV = H.IDPLANOPREV) ' +
                         ' AND (PF.IDPESSOA = H.IDRESPONSAVEL)  ' +
                         ' AND (RESP.IDPESSOA = H.IDRESPONSAVEL)' +
                         ' AND (TIT.IDPESSOA = H.IDTITULAR)     ' +
                         ' AND (EPP.IDPESSOA = NVL(H.IDRECEBEPGTO, H.IDRESPONSAVEL))' +
                         ' AND H.IDLOTE = CT.IDLOTE ' ;
                         //  SOL 147567 KINTANA 1022979
                         if (grpTipoFolha.ItemIndex = 0) and not(Chktrarubresgate.Checked) then
                            sSQL := sSQL + ' AND CT.FLGRESGATE  =  0 ' ;

                      // Andre Imakawa - SIG 125110
                      if dblkpcmbLote.text = '' then
                         //  SOL 147567 KINTANA 1022979
                         //BRUNO AZEVEDO SOL 139176 KINTANA 852660
                         //ADICIONADO OR UPPER(CT.DESCRICAO) LIKE '%PORT%'
                      sSQL := sSQL +   ' AND (UPPER(CT.DESCRICAO) LIKE ''%ADT%'' OR UPPER(CT.DESCRICAO) LIKE ''%RESG%'' OR UPPER(CT.DESCRICAO) LIKE ''%PORT%''  AND ' +
                         '                                          H.IDLOTE IN (SELECT HS.IDLOTE ' +
                         '                                                       FROM HSTBENEFBFCIARIO HS ' +
                         '                                                      WHERE HS.IDPESSOA = H.IDPESSOA ' +
                         '                                                        AND HS.IDTITULAR = H.IDTITULAR ' +
                         '                                                        AND HS.MES = H.MESCOBRANCA ' +
                         '                                                        AND HS.IDPLANOPREV = H.IDPLANOPREV) ' +
                         '       OR UPPER(CT.DESCRICAO) LIKE ''%BENEF%'' OR UPPER(CT.DESCRICAO) LIKE ''%PREPA%'' OR UPPER(CT.DESCRICAO) LIKE ''%CONTRIB%''  ) ';

                      sSQL := sSQL + ' AND (PPP.IDPESSOA       = H.IDTITULAR) ' +
                         ' AND (PPP.IDPESSJUR      = H.IDPATRO) ' +
                         ' AND ( ((H.IDPLANOPREV   = PPP.IDPLANOPREV) AND (H.IDRESPONSAVEL  =  H.IDTITULAR)) ' +
                         '  OR ((H.IDPLANOORIGEM = PPP.IDPLANOPREV) AND (H.IDRESPONSAVEL  <> H.IDTITULAR)) ) ' +
                         ' AND (EL.IDPESSOA        = H.IDTITULAR) ' +
                         ' AND (EL.IDPESSJUR       = H.IDPATRO) ' +
                         ' AND (PAT.IDPESSOA       = H.IDPATRO)';
        end;
        //BRUNO AZEVEDO SOL 136490 KINTANA 817135

  if cmbBeneficio.text <> ''then
  begin
    if sTabela = 'HISTRUBSAL' then
      sSQL := sSQL +'  AND H.IDTITULAR        = BNF.IDTITULAR     '+
                    '  AND H.IDPLANOPREV      = BNF.IDPLANOPREV   '+
                    '  AND H.IDPATRO          = BNF.IDPESSJUR     '+
                    '  AND H.IDMOTIVO         = BNF.IDMOTIVO      '+
                    '  AND H.MES              = BNF.MES           '
    else
      sSQL := sSQL +'  AND H.IDTITULAR        = BNF.IDTITULAR     '+
                    '  AND H.IDPLANOPREV      = BNF.IDPLANOPREV   '+
                    '  AND H.IDPATRO          = BNF.IDPESSJUR     '+
                    '  AND H.SEQPROPOSTA      = BNF.SEQPROPOSTA   '+
                    '  AND H.IDPESSOA         = BNF.IDPESSOA      ';
  end;

  sSQL := sSQL +' ) WHERE rank = 1 '; //BRUNO AZEVEDO SOL 141143 KINTANA 905094
  end;
  //Higor Nayde Ferreira SOL 185038 KINTANA 1812976 Fim
  dtmPrevia.qryAux.Close;
  dtmPrevia.qryAux.Sql.Clear;
  dtmPrevia.qryAux.Sql.Add(sSql);
  //dtmPrevia.qryAux.Sql.savetofile('c:\sql.sql');
  dtmPrevia.qryAux.Open;


//  DtmPrevia.qryBenef.Params[0].Value := dtmPrevia.qryAux.fIELDbYnAME('idlote').Value;
//  DtmPrevia.qryBenef.Params[1].Value := dtmPrevia.qryAux.fIELDbYnAME('IDTITULAR').Value;
//
//  dtmPREVIA.qryBenef.Open;

  If dtmPrevia.qryAux.IsEmpty Then
  Begin
    ShowMessage('Não foram encontradas as informações.');
    Exit;
  End
  Else
  Begin
    // verifica dados
    ModalResult := mrOk;

    if Not VerificaDados then
    begin
      ModalResult := MrNone;
      Exit;
    end;

    if sTabela = 'HISTRUBSAL' then
      dtmPrevia.lblDescricao.caption := 'Folha - '+blkcmpHistorico.text
    else
    begin
      if dblkpcmbLote.text <> ''then
        dtmPrevia.lblDescricao.caption := 'Prévia - Lote:'+qryLote.FieldByName('IDLOTE').AsString+' - '
            +qryLote.FieldByName('DESCRICAO').AsString
      else
        dtmPrevia.lblDescricao.caption := 'Prévia - Referência '+sMesRef;
    end;

    MontaQueryMestre(sTabela);

    exit;

    // Testa se Motivo está preenchido
    if (cmbOrdem.ItemIndex=-1) or (cmbOrdem.Text='') then Ordem := 0
    else Ordem := cmbOrdem.ItemIndex;

    with dtmPREVIA do
    begin
      sMesReferencia := Trim(spedAno.Text)+ '/'+ IntCod(cmbMes.ItemIndex+1,2);
      if grpTipoFolha.ItemIndex = 1 then
      begin
        ppLblIdLote.Visible := False;
        LabTitulo.Caption   := 'Folha de Benefícios';
      end
      else
      begin
        ppLblIdLote.Visible := False;
        LabTitulo.Caption   := 'Prévia da Folha de Benefícios';
      end;

      if rbManutencao.Checked then  ppLblIdLote.Visible := False
      else ppLblIdLote.Visible := False;

      sMesCobranca := sMesReferencia;

      dtmPrevia.qryPREVIA.Close;
      dtmPrevia.qryPREVIA.SQL.Clear;

         // Monta Query
         // -----------

         // HISTRUBSAL ou PREVIA
         If (grpTipoFolha.ItemIndex = 1) Then
         Begin // Se for HISTRUBSAL
            DtmPrevia.qryPREVIA.Close;
            DtmPrevia.qryPREVIA.SQL.Clear;
         End Else Begin  // PREVIA
            // Passa valor para a Variável do DataModule
            dPrevia.iIdFolha := 0;
         end;
          // Query do Cabeçalho
          qryFundacao.Close;
          qryFundacao.ParamByName('pFundacao').AsInteger := Sistema.IdEmpresa;
          qryFundacao.Open;

      dtmPREVIA.ReportPREVIALabel19.Visible   := grpTipoFolha.ItemIndex=0;
      dtmPREVIA.ReportPREVIALabel15.Visible   := True;
      frmAguarde.Mostra('Montando Relatório.');

    end;
  End;
end;

procedure TfrmPRelPREVIA.grpTipoFolhaClick(Sender: TObject);
begin
  case grpTipoFolha.ItemIndex of
    0:
     begin
       grpPrevia.Visible := true;
       grpEfet.Visible := false;
       dtmPrevia.bdefinitiva:=false;
       sTabela := 'PREVIA';
     end;
    1:
     begin
       grpPrevia.Visible := false;
       grpEfet.Visible := true;
       dtmPrevia.bdefinitiva:=true;
       sTabela := 'HISTRUBSAL';
     end;
  end; {Case}

  MontaQryMatricBenef;

  if grpTipoFolha.ItemIndex = 0 then
  begin
    MontaQryRubricaIndiv;
    MontaQryAcaoJudicial;
  end;
end;

procedure TfrmPRelPREVIA.FormCreate(Sender: TObject);
begin
  inherited;
  // ativa as querys
  qryPlano.Open;
  qryPatro.Open;
  qryBeneficio.Open;
  qryMotivo.Open;
  qryHistorico.Open;
  qryLote.open;
  grpTipoFolha.OnClick(Self);
end;

procedure TfrmPRelPREVIA.edMatriculaChange(Sender: TObject);
begin
  inherited;
  // se houver alteração no valor do edit deve-se apagar os demais p/ não prejudicar
  // a consulta posteriormente.
  if edMatricula.Focused then
  begin
    edNumInscr.clear;
    edTitular.Clear;
  end;
end;

procedure TfrmPRelPREVIA.edNumInscrChange(Sender: TObject);
begin
  inherited;
  // se houver alteração no valor do edit deve-se apagar os demais p/ não prejudicar
  // a consulta posteriormente.
  if edNumInscr.Focused then
  begin
    edMatricula.clear;
    edTitular.Clear;
  end;
end;

procedure TfrmPRelPREVIA.cboxEspecificoClick(Sender: TObject);
var
  iCont: Integer;
begin
  inherited;
  if cboxEspecifico.Checked then
  begin
    cboxGenerico.Checked := False;
    // limpa os cmbs do grupo genérico
    for iCont := 0 to ComponentCount - 1 do
      if Components[iCont] is TwwDBLookupCombo then
        if TwwDBLookupCombo(Components[iCont]).Parent = gboxGenerico then
          TwwDBLookupCombo(Components[iCont]).Text := '';
  end;
end;

procedure TfrmPRelPREVIA.cboxGenericoClick(Sender: TObject);
begin
  inherited;
  if cboxGenerico.Checked then
  begin
    cboxEspecifico.Checked := False;
  end;
end;

function TfrmPRelPREVIA.VerificaDados: Boolean;
{No caso da Previa não pode selecionar um lote e um AnoMês Referência juntos}
begin
  // executa verificação de acordo com as opções selecionadas
  Result := True;
  if grpTipoFolha.ItemIndex = 0 then
  begin // PREVIA
    if (dblkpcmbLote.Text = '') and (cmbMes.text = '') then
    begin
      MsgDlg('Selecione um Lote ou preencha o Mês e Ano!','Aviso',mtInformation,[mbOk],0);
      Result := False;
      Exit;
    end;
    if (dblkpcmbLote.Text <> '') and (cmbMes.text <> '') then
    begin
      MsgDlg('Selecione APENAS o Lote ou o Mês e Ano!','Aviso',mtInformation,[mbOk],0);
      Result := False;
      Exit;
    end;

  end else
  begin // HISTRUBSAL
    if blkcmpHistorico.Text = '' then
    begin
      MsgDlg('Selecione uma Versão da Folha.','Aviso',mtInformation,[mbOk],0);
      Result := False;
      Exit;
    end;
  end;
end;

procedure TfrmPRelPREVIA.cmbMesChange(Sender: TObject);
begin
  inherited;
  sMesRef := Trim(spedAno.Text)+ '/'+ IntCod(cmbMes.ItemIndex+1,2);
end;

procedure TfrmPRelPREVIA.spedAnoChange(Sender: TObject);
begin
  inherited;
  sMesRef := Trim(spedAno.Text)+ '/'+ IntCod(cmbMes.ItemIndex+1,2);
end;

procedure TfrmPRelPREVIA.cmbBeneficioCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  // verifica se alguma combo foi selecioanda.
  if TwwDBLookupCombo(Sender).Text <> '' then
  begin
    cboxGenerico.Checked := True;
    cboxGenerico.OnClick(Self);
  end;
end;

procedure TfrmPRelPREVIA.edBeneficiarioChange(Sender: TObject);
begin
  inherited;
  if Length(TEdit(Sender).Text) > 0 then
  begin
    cboxEspecifico.Checked := True;
    cboxEspecifico.OnClick(Self);
  end;
end;

procedure TfrmPRelPREVIA.BitBtn1Click(Sender: TObject);
begin
  inherited;
  MontaSelectBenef.Executar;
  if MontaSelectBenef.RetornouValor then
  begin
    sIDTITULAR            := MontaSelectBenef.ValoresChave[8];
    edBeneficiario.Text   := MontaSelectBenef.ValoresChave[2];
    edNumInscr.Text       := MontaSelectBenef.ValoresChave[5];
    edMatricula.Text      := MontaSelectBenef.ValoresChave[4];
    edTitular.Text        := MontaSelectBenef.ValoresChave[3];
  end;
end;

procedure TfrmPRelPREVIA.FormShow(Sender: TObject);
begin
  inherited;
  tbsIndividual.tabvisible:=false;
  cmbOrdem.ItemIndex := 0;
  frameBenef.DefineLista(0);
end;

procedure TfrmPRelPREVIA.MontaQueryTotal;
begin
  dtmPrevia.ssqltotal:=' SELECT '+
    ' SUM(DECODE(PD.FLGDESCONTO, 0, HST.VALORPROVENTO)) AS PROVENTO,    '+
    ' SUM(DECODE(PD.FLGDESCONTO, 1, HST.VALORPROVENTO)) AS DESCONTO,    '+
    ' SUM(DECODE(PD.FLGDESCONTO, 0, HST.VALORPROVENTO)) -               '+
    '     SUM(DECODE(PD.FLGDESCONTO, 1, HST.VALORPROVENTO)) AS LIQUIDO  '+
    ' FROM ';
  If grpTipoFolha.ItemIndex = 0 Then
    dtmPrevia.ssqltotal:=dtmPrevia.ssqltotal+
      ' PREVIA HST, PROVDESC PD, PESSOA RESP, PESSOA PAT, PLANPREV PL '
  Else
    dtmPrevia.ssqltotal:=dtmPrevia.ssqltotal+
      ' HISTRUBSAL HST, PROVDESC PD, PESSOA RESP, PESSOA PAT, PLANPREV PL ';

  If Trim(cmbBeneficio.text) <> '' Then
  Begin
    If sTabela = 'HISTRUBSAL' Then
      dtmPrevia.ssqltotal:=dtmPrevia.ssqltotal+' ,HSTBENEFBFCIARIO BNF  '
    Else
      dtmPrevia.ssqltotal:=dtmPrevia.ssqltotal+' ,BENEFBFCIARIO BNF  ';
  End;

  (* WHERE *)
  //Filtra o tipo de folha (PREVIA HISTRUBSAL) (A Prévia pode ser por Lote ou AnoMês)
  if grpTipoFolha.ItemIndex = 0 then
  begin
    If sIdLote <> '' then
      dtmPrevia.ssqltotal:=dtmPrevia.ssqltotal+
      ' WHERE HST.IDLOTE = '+sIdLote+' AND '
    Else If Trim(cmbMes.text) <> '' Then
      dtmPrevia.ssqltotal:=dtmPrevia.ssqltotal+
      ' WHERE HST.MESCOBRANCA = '+QuotedStr(sMesRef)+' AND ';
  End
  Else
   dtmPrevia.ssqltotal:=dtmPrevia.ssqltotal+
     ' WHERE HST.IDHSTFOLHABENEF = '+sIdHstFolhaBenef+' AND ';

  If cboxEspecifico.Checked Then
    dtmPrevia.ssqltotal:=dtmPrevia.ssqltotal+
      ' HST.IDRESPONSAVEL = '+IntToStr(dtmPrevia.qryPrevia.FieldByName('IDRESPONSAVEL').AsInteger)+ ' AND '+
      ' HST.IDTITULAR     = '+IntToStr(dtmPrevia.qryPrevia.FieldByName('IDTITULAR').AsInteger)+ ' AND ';

  If Trim(cmbPatro.Text) <> '' Then
    dtmPrevia.ssqltotal:=dtmPrevia.ssqltotal+
      ' HST.IDPATRO = '+qryPatro.FieldByName('IDPESSOA').AsString+' AND ';

  If Trim(cmbPlano.Text) <> '' Then
    dtmPrevia.ssqltotal:=dtmPrevia.ssqltotal+
      ' HST.IDPLANOPREV = '+qryPlano.FieldByName('IDPLANOPREV').AsString+' AND ';

  If Trim(cmbBeneficio.Text) <> '' Then
    dtmPrevia.ssqltotal:=dtmPrevia.ssqltotal+
      ' BNF.IDBENEFICIO = '+qryBeneficio.FieldByName('IDBENEFICIO').AsString+' AND ';

  dtmPrevia.ssqltotal:=dtmPrevia.ssqltotal+
    ' PD.IDPROVENTO       = HST.IDRUBRICA      AND                      '+
    ' RESP.IDPESSOA       = HST.IDRESPONSAVEL  AND                      '+
    ' PAT.IDPESSOA        = HST.IDPATRO        AND                      '+
    ' PL.IDPLANOPREV      = HST.IDPLANOPREV                             ';

  If Trim(cmbBeneficio.Text) <> '' Then
    dtmPrevia.ssqltotal:=dtmPrevia.ssqltotal+
      ' AND HST.IDTITULAR       = BNF.IDTITULAR      AND                '+
      '     HST.IDPLANOPREV     = BNF.IDPLANOPREV    AND                '+
      '     HST.IDPATRO         = BNF.IDPESSJUR      AND                '+
      '     HST.IDMOTIVO        = BNF.IDMOTIVO       AND                '+
      '     HST.MES             = BNF.MES                               ';
end;

procedure TfrmPRelPREVIA.bbtnProcurarDepClick(Sender: TObject);
  Function BuscaDependente : Boolean;
  begin
    Result := True;
    qryAux.close;
    qryAux.sql.Clear;
    qryAux.Sql.Add(' SELECT DP.IDPESSOA, DP.IDTITULAR , DP.MATRICULA as MATRICULA_DEP, '+
                   ' P.NOME AS NOME_DEP, E.MATRICULA AS MATRICULA_TIT, '+
                   ' V.NOME AS NOME_TIT '+
                   ' FROM PARTPREVPLAN PPP, DEPENTIT DP, PESSOA P, PESSOA V, ELEGPATRO E ' +
                   ' WHERE DP.MATRICULA LIKE '+QuotedStr(edMatriculadEP.Text+'%')+'  ');
    qryAux.Sql.Add('  AND DP.IDTITULAR = PPP.IDPESSOA '+
                   '  AND DP.IDPESSOA  = P.IDPESSOA   '+
                   '  AND DP.IDTITULAR = V.IDPESSOA   '+
                   '  AND DP.IDTITULAR = E.IDPESSOA');
    qryAux.Open;
    if qryAux.IsEmpty then Result := False;
  end;

var wsql, sMesRef : String;
begin
  inherited;
  // verifica se os campos de inscrição ou matrícula estão preenchidos,
  // caso negativo executa o montaselect.
  if (edMatriculaDep.Text <> '')  then
  begin
    if BuscaDependente then
    begin
      // Alimenta variáveis
      EdMatriculaDep.Text := qryAux.FieldByName('MATRICULA_DEP').AsString;
      EdMatricula.Text    := qryAux.FieldByName('MATRICULA_TIT').AsString;
      sIdTitular          := qryAux.FieldByName('IDTITULAR').AsString;
      edDEPENDENTE.Text   := qryAux.FieldByName('NOME_DEP').AsString;
      edTitular.Text      := qryAux.FieldByName('NOME_TIT').AsString;
    end else
    begin
      EdMatriculadep.Clear;
      edDependente.Clear;
      sIdTitular := '';
      MsgDlg('Não foi encontrado nenhum participante com esta Matrícula.',
             'Aviso',mtInformation,[mbOK],0);
    end;
    Exit;
  end;

  sMesRef := Trim(spedAno.Text)+ '/'+ IntCod(cmbMes.ItemIndex+1,2);
  MontaSelectBenef.Filtro.Clear;
  MontaSelectBenef.Filtro.Add('BF.IDTITULAR   = EL.IDPESSOA       ');
  MontaSelectBenef.Filtro.Add('PP.IDPESSJUR   = BF.IDPESSJUR      ');
  MontaSelectBenef.Filtro.Add('PP.IDPESSOA    = BF.IDTITULAR      ');
  MontaSelectBenef.Filtro.Add('PP.IDPLANOPREV = BF.IDPLANOPREV    ');
//  MontaSelectBenef.Filtro.Add('PP.FLGDESATIVADO = 0               ');  // SOL 119584
  MontaSelectBenef.Filtro.Add('PAT.IDPESSOA   = BF.IDPESSJUR      ');
  MontaSelectBenef.Filtro.Add('DEP.IDPESSOA   = BF.IDPESSOA       ');
  MontaSelectBenef.Filtro.Add('TIT.IDPESSOA   = BF.IDTITULAR      ');
  MontaSelectBenef.Filtro.Add('PL.IDPLANOPREV = BF.IDPLANOPREV    ');
  MontaSelectBenef.Filtro.Add('BF.IDPESSOA    = DP.IDPESSOA       ');
  MontaSelectBenef.Executar;
  edDependente.Text    := '';
  edMatriculaDep.Text  := '';
  sIdPessoa            := '';
  sIdPessJur           := '';
  sIdPlanoPrev         := '';
  sIdBeneficio         := '';
  sIdRubrica           := '';
  sIdTitular           := '';
end;

procedure TfrmPRelPREVIA.cboxIndividualClick(Sender: TObject);
begin
  inherited;
  tbsIndividual.tabvisible:=cboxIndividual.checked;
end;

procedure TfrmPRelPREVIA.MontaQryMatricBenef;
Var
  sSql : String;

begin
  sSql := ' SELECT DISTINCT D.MATRICULA, P.NOME ';

  If grpTipoFolha.ItemIndex = 0 Then
    sSql := sSql + ' FROM PREVIA PH, '
  Else
    sSql := sSql + ' FROM HISTRUBSAL PH, ';
  sSql := sSql + 'DEPENTIT D, PESSOA P  WHERE ';
  If grpTipoFolha.ItemIndex = 0 Then
    sSql := sSql + ' PH.IDLOTE          = :IDLOTE          AND '
  Else
    sSql := sSql + ' PH.IDHSTFOLHABENEF = :IDHSTFOLHABENEF AND ';

  sSql := sSql +
  ' PH.IDRESPONSAVEL   = :IDRESPONSAVEL   AND '+
  ' PH.IDPESSOA       <> PH.IDRESPONSAVEL AND '+
  ' PH.IDTITULAR       = D.IDTITULAR      AND '+
  ' PH.IDPESSOA        = D.IDPESSOA       AND '+
  ' PH.IDPESSOA        = P.IDPESSOA       AND '+
  ' PH.FLGTIPODESC     = ''B''';
  dtmPREVIA.qryMatricBenef.Close;
  dtmPREVIA.qryMatricBenef.Sql.Clear;
  dtmPREVIA.qryMatricBenef.Sql.Add(sSql);

  If grpTipoFolha.ItemIndex = 0 Then
    dtmPREVIA.qryMatricBenef.Params[0].Name     := 'IDLOTE'
  Else
    dtmPREVIA.qryMatricBenef.Params[0].Name     := 'IDLOTE';

  dtmPREVIA.qryMatricBenef.Params[0].DataType := ftInteger;
  dtmPREVIA.qryMatricBenef.Params[1].DataType := ftInteger;
end;

//Marcio Sanches Spinosa SOL 215474 KINTANA 2044700 - Inicio
function TfrmPRelPREVIA.MontaQueryProgressivaRegressiva: string;
var montaQuery : string;
begin
  montaQuery :=  ' (select TIPOOPCAOIR '+
                 ' from (select Case '+
                 ' When (DECODE(lead(NVL(TIPOOPCAOIR, 1)) '+
                 '            over(ORDER BY NVL(TIPOOPCAOIR, 1)), '+
                 '            NULL, ' +
                 '            NVL(TIPOOPCAOIR, 1), '+
                 '            lead(NVL(TIPOOPCAOIR, 1)) '+
                 '            over(ORDER BY NVL(TIPOOPCAOIR, 1)))) <> '+
                 '    NVL(TIPOOPCAOIR, 1) then '+
                 'DECODE(NVL(TIPOOPCAOIR, 1), 1, ''Progressiva'', ''Regressiva'') || ''\'' || '+
                 'DECODE((DECODE(lead(NVL(TIPOOPCAOIR, 1)) '+
                 '               over(ORDER BY NVL(TIPOOPCAOIR, 1)), '+
                 '               NULL, '+
                 '               NVL(TIPOOPCAOIR, 1), ' +
                 '               lead(NVL(TIPOOPCAOIR, 1)) '+
                 '               over(ORDER BY NVL(TIPOOPCAOIR, 1)))), '+
                 '       1, '+
                 '       ''Progressiva'', '+
                 '       ''Regressiva'') '+
                 ' else '+
                 'DECODE(NVL(TIPOOPCAOIR, 1), 1, ''Progressiva'', ''Regressiva'') '+
                 ' end TIPOOPCAOIR '+
                 ' from (SELECT distinct nvl(ppp.TIPOOPCAOIR, 1) AS TIPOOPCAOIR '+
                 'from partprevplan ppp, ' + sTabela+' H, '+

                 ' PESSOAFISICA PF, '+
                 ' ELEGPATRO EL, '+
                 ' PLANPREV PL, '+
                 ' PESSOA RESP, '+
                 ' PROCJUD PCJ, '+
                 ' PESSOA TIT, '+
                 ' PESSOA EPP,  '+ //CPrev - 26800
                 ' DEPENTIT DP, '+
                 ' PESSOA PAT,  '+
                 ' CONTABANCARIA  CC,  '+
                 ' AGENCIABANCARIA AG, '+
                 ' PESSOA PE    ';


          if sTabela = 'HISTRUBSAL' then begin
            montaQuery := montaQuery + ', hstfolhabenef hsT ';
          end else begin
            montaQuery := montaQuery + ', CTRLINTERFACE CT ';
          end;

          if cmbBeneficio.text <> '' then
          begin
            if sTabela = 'HISTRUBSAL' then
              montaQuery := montaQuery + ' ,HSTBENEFBFCIARIO BNF  '
            else
              montaQuery := montaQuery + ' ,BENEFBFCIARIO BNF  ';
          end;

        //Filtra o tipo de folha (PREVIA HISTRUBSAL) (A Prévia pode ser por Lote ou AnoMês)
        if grpTipoFolha.ItemIndex = 0 then
        begin
          if dblkpcmbLote.text <> '' then
            montaQuery := montaQuery + ' WHERE H.IDLOTE = '+qryLote.FieldByName('IDLOTE').AsString+' '
          else if cmbMes.text <> '' then
            montaQuery := montaQuery + ' WHERE H.MESCOBRANCA = '+QuotedStr(sMesRef)+' '
          else
            montaQuery := montaQuery + ' WHERE 1 = 1';
        end
        else
          montaQuery := montaQuery + ' WHERE H.IDHSTFOLHABENEF = '+qryHistorico.FieldByName('IDHSTFOLHABENEF').AsString+' ';

          montaQuery := montaQuery + ' AND PPP.IDPESSJUR = H.IDPATRO ' +
                     ' AND (((H.IDPLANOPREV = PPP.IDPLANOPREV) AND '+
                     ' (H.IDRESPONSAVEL = H.IDTITULAR)) OR '+
                     ' ((H.IDPLANOORIGEM = PPP.IDPLANOPREV) AND '+
                     ' (H.IDRESPONSAVEL <> H.IDTITULAR))) '+
                     ' AND PPP.IDPESSOA = H.IDTITULAR ' ;

        if cmbPatro.Text <> '' then
          montaQuery := montaQuery + ' AND H.IDPATRO = '+qryPatro.FieldByName('IDPESSOA').AsString+' ';

        if cmbPlano.Text <> ''then
          montaQuery := montaQuery + ' AND H.IDPLANOPREV = '+qryPlano.FieldByName('IDPLANOPREV').AsString+' ';

        if cmbBeneficio.Text <> '' then // Independe da tabela.
          montaQuery := montaQuery + ' AND BNF.IDBENEFICIO = '+qryBeneficio.FieldByName('IDBENEFICIO').AsString+' ';

        if cboxIndividual.Checked then
          montaQuery:=montaQuery+'AND EXISTS (SELECT 1 '+
                                 'FROM LISTAFOLHABENEFDET LD '+
                                 'WHERE H.IDTITULAR = LD.IDTITULAR '+
                                 'AND LD.IDLISTA = '+inttostr(frameBenef.ListaUsuario)+') '
        else
          if (sIdTitular <> '') then
            montaQuery := montaQuery+' AND (H.IDTITULAR    = '+sIdTitular+') ';

        //BRUNO AZEVEDO SOL 136490 KINTANA 817135
        if sTabela = 'HISTRUBSAL' then begin
          montaQuery := montaQuery + ' AND H.IDHSTFOLHABENEF = '+qryHistorico.FieldByName('IDHSTFOLHABENEF').AsString+' ' +
                         ' AND (PL.IDPLANOPREV = H.IDPLANOPREV) ' +
                         ' AND (PF.IDPESSOA = H.IDRESPONSAVEL) ' +
                         ' AND (RESP.IDPESSOA = H.IDRESPONSAVEL) ' +
                         ' AND (TIT.IDPESSOA = H.IDTITULAR) ' +
                         ' AND (EPP.IDPESSOA = NVL(H.IDRECEBEPGTO, H.IDRESPONSAVEL)) ' +
                         ' AND (PPP.IDPESSOA = H.IDTITULAR) ' +
                         ' AND (PPP.IDPESSJUR = H.IDPATRO) ' +
                         ' AND (((H.IDPLANOPREV = PPP.IDPLANOPREV) AND ' +
                         '     (H.IDRESPONSAVEL = H.IDTITULAR)) OR ' +
                         '     ((H.IDPLANOORIGEM = PPP.IDPLANOPREV) AND ' +
                         '     (H.IDRESPONSAVEL <> H.IDTITULAR))) ' +
                         ' AND (EL.IDPESSOA = H.IDTITULAR) ' +
                         ' AND (PF.IDPESSOA = PCJ.IDPESSOA(+)) ' +
                         ' AND (DP.IDTITULAR(+) = H.IDTITULAR) ' +
                         ' AND (DP.IDPESSOA(+) = H.IDRESPONSAVEL) ' +
                         ' AND (EL.IDPESSJUR = H.IDPATRO) ' +
                         ' AND (PAT.IDPESSOA = H.IDPATRO) ' +
                         ' AND (H.IDPESSOA = CC.IDPESSOA(+)) '+           //SOL 147391 KINTANA 1019719
                         ' AND (H.CONTACORRENTE = CC.CONTACORRENTE(+)) '+ //SOL 145036 KINTANA 970354
                         ' AND (CC.IDAGENCIA = AG.IDPESSOA(+)) '+         //SOL 147391 KINTANA 1019719
                         ' AND (AG.IDBANCO = PE.IDPESSOA(+)) '+           //SOL 147391 KINTANA 1019719

                         ' AND h.idhstfolhabenef = HST.IDHSTFOLHABENEF ' +
                         //BRUNO AZEVEDO SOL 139176 KINTANA 852660
                         //ADICIONADO OR UPPER(HST.HISTORICO) LIKE ''%PORT%''
                         ' AND (UPPER(HST.HISTORICO) LIKE ''%ADT%'' OR UPPER(HST.HISTORICO) LIKE ''%RESG%'' OR UPPER(HST.HISTORICO) LIKE ''%PORT%''' +
                         '                                           AND EXISTS (SELECT 1 ' +
                         '                                           FROM HSTBENEFBFCIARIO HS ' +
                         '                                           WHERE HS.IDPESSOA = H.IDPESSOA ' +
                         '                                             AND HS.IDTITULAR = H.IDTITULAR ' +
                         '                                             AND hs.idhstfolhabenef = h.idhstfolhabenef ' +
                         '                                             AND HS.MES = H.MESCOBRANCA ' +
                         '                                             AND HS.IDPLANOPREV = H.IDPLANOPREV) ' +
                         '      OR (UPPER(HST.HISTORICO) LIKE ''%FOLHA%'' )) ';
        end else begin
          montaQuery := montaQuery + ' AND (PL.IDPLANOPREV = H.IDPLANOPREV) ' +
                         ' AND (PF.IDPESSOA = H.IDRESPONSAVEL)  ' +
                         ' AND (RESP.IDPESSOA = H.IDRESPONSAVEL)' +
                         ' AND (TIT.IDPESSOA = H.IDTITULAR)     ' +
                         ' AND (EPP.IDPESSOA = NVL(H.IDRECEBEPGTO, H.IDRESPONSAVEL))' ;
                         //  SOL 147567 KINTANA 1022979
                         if (grpTipoFolha.ItemIndex = 0) and not(Chktrarubresgate.Checked) then
                            montaQuery := montaQuery + ' AND CT.FLGRESGATE  =  0 ' ;
                         //  SOL 147567 KINTANA 1022979
         montaQuery := montaQuery +  ' AND H.IDLOTE = CT.IDLOTE ' +
                         //BRUNO AZEVEDO SOL 139176 KINTANA 852660
                         //ADICIONADO OR UPPER(CT.DESCRICAO) LIKE '%PORT%'
                         ' AND (UPPER(CT.DESCRICAO) LIKE ''%ADT%'' OR UPPER(CT.DESCRICAO) LIKE ''%RESG%'' OR UPPER(CT.DESCRICAO) LIKE ''%PORT%''  AND ' +
                         '                                          H.IDLOTE IN (SELECT HS.IDLOTE ' +
                         '                                                       FROM HSTBENEFBFCIARIO HS ' +
                         '                                                      WHERE HS.IDPESSOA = H.IDPESSOA ' +
                         '                                                        AND HS.IDTITULAR = H.IDTITULAR ' +
                         '                                                        AND HS.MES = H.MESCOBRANCA ' +
                         '                                                        AND HS.IDPLANOPREV = H.IDPLANOPREV) ' +
                         '       OR UPPER(CT.DESCRICAO) LIKE ''%BENEF%'' OR UPPER(CT.DESCRICAO) LIKE ''%PREPA%'' OR UPPER(CT.DESCRICAO) LIKE ''%CONTRIB%''  ) ' +
                         ' AND (PPP.IDPESSOA       = H.IDTITULAR) ' +
                         ' AND (PF.IDPESSOA = PCJ.IDPESSOA(+)) ' +
                         ' AND (DP.IDTITULAR(+) = H.IDTITULAR) ' +
                         ' AND (DP.IDPESSOA(+) = H.IDRESPONSAVEL) ' +
                         ' AND (PPP.IDPESSJUR      = H.IDPATRO) ' +
                         ' AND ( ((H.IDPLANOPREV   = PPP.IDPLANOPREV) AND (H.IDRESPONSAVEL  =  H.IDTITULAR)) ' +
                         '  OR ((H.IDPLANOORIGEM = PPP.IDPLANOPREV) AND (H.IDRESPONSAVEL  <> H.IDTITULAR)) ) ' +
                         ' AND (EL.IDPESSOA        = H.IDTITULAR) ' +
                         ' AND (EL.IDPESSJUR       = H.IDPATRO) ' +
                         ' AND (PAT.IDPESSOA       = H.IDPATRO)'+
                         ' AND (H.IDPESSOA = CC.IDPESSOA(+)) '+
                         ' AND (H.CONTACORRENTE = CC.CONTACORRENTE(+)) '+
                         ' AND (CC.IDAGENCIA = AG.IDPESSOA(+)) '+
                         ' AND (AG.IDBANCO = PE.IDPESSOA(+)) ';
        end;
        //BRUNO AZEVEDO SOL 136490 KINTANA 817135

      if cmbBeneficio.text <> ''then
      begin
        if sTabela = 'HISTRUBSAL' then
          montaQuery := montaQuery +'  AND H.IDTITULAR        = BNF.IDTITULAR     '+
                        '  AND H.IDPLANOPREV      = BNF.IDPLANOPREV   '+
                        '  AND H.IDPATRO          = BNF.IDPESSJUR     '+
                        '  AND H.IDMOTIVO         = BNF.IDMOTIVO      '+
                        '  AND H.MES              = BNF.MES           '
        else
          montaQuery := montaQuery +'  AND H.IDTITULAR        = BNF.IDTITULAR     '+
                        '  AND H.IDPLANOPREV      = BNF.IDPLANOPREV   '+
                        '  AND H.IDPATRO          = BNF.IDPESSJUR     '+
                        '  AND H.SEQPROPOSTA      = BNF.SEQPROPOSTA   '+
                        '  AND H.IDPESSOA         = BNF.IDPESSOA      ';
      end;


      montaQuery := montaQuery + ' order by nvl(ppp.TIPOOPCAOIR, 1))) where rownum <= 1) AS TIPOOPCAOIR , ';

      Result := montaQuery;

end;
//Marcio Sanches Spinosa SOL 215474 KINTANA 2044700 - Fim
end.
{==============================================================================|
| UNIT: FPRELPREVIA                                                            |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   FORM FILTRO PARA O RELATÓRIO INDIVIDUAL DE PAGAMENTO DE UM RECEBEDOR.      |
|                                                                              |
===============================================================================|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 17/04/2002 A 17/04/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12J                                              |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   ALTERAÇÃO NO RELATÓRIO DA PREVIA. A IMPRESSÃO DA DIB AGORA É FEITA APARTIR |
| DA QUERY QRYNUMPROC, NÃO SENDO MAIS NECESSÁRIO PASSAR O NUMERO DO PROCESSO   |
| NA QRYPREVIA.                                                                |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: Sidnei B Marins                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE 26/07/2002 A 26/07/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (CBS)    Pendência 8221.                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Alteração da qryLote para exibir lotes de folha  |
|                               extra.                                         |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 27/08/2002 A 27/08/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   - Foi colocado mais três opções de ordenação.                              |
|   - Também foi colocado um campo virtual na query.                           |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: Sidnei de Brito Marins.                                       |
| PERÍODO DE IMPLEMENTAÇÃO: DE 26/11/2002 A 27/11/2002.                        |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FCRT) Pendência 10544.                                             |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Inclusão da Procedure AbreQryBenef. Alteração do |
|   Relatório para mostrar detalhes de benefícios.                             |
|------------------------------------------------------------------------------}
