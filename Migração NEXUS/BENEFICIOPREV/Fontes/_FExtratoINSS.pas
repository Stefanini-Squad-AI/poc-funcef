unit FExtratoINSS;

// Alterações:
{
----------------------------------------------------------------------------------------------------
Pendência   : SOL 133037 KINTANA 772240
Responsável : BRUNO AZEVEDO
Data        : 29/03/2010
Descrição   : Alteração na qryFolhaFuncef, incluir a rubrica (%33404), rubrica de PA.
---------------------------------------------------------------------------------------------------
Autor      : Renato Visoni
Data       : 25/02/2010
Pendencia  : SOL 123118 Kintana 612606
Alteração  : Ajuste das consultas para mostrar os campos : CODSINONIMO, DTINICIOCRED, DTFIMCRED.
----------------------------------------------------------------------------------------------------
Autor      : Renato Visoni
Data       : 10/02/2010
Pendencia  : SOL122873 Kintana 615216
Alteração  : Criação do checkBox "Inibir rubricas de pensão alimentícia" e alteração na qryFolhaFuncef.
----------------------------------------------------------------------------------------------------
Autor      : Daniel Begnami
Data       : 20/08/2009
Pendencia  : SOL 122987 Kintana 610253
Alteração  : O sistema não estava buscando os dados quando a pesquisa era feita somente pela matri-
             cula.
----------------------------------------------------------------------------------------------------
Autor      : Renato Visoni
Rotina     : Query qryBeneficario
Data       : 21/09/2009
Pendencia  : SOL 124637 Kintana 634675
Alteração  : Alteração na qryBeneficario.
----------------------------------------------------------------------------------------------------
Autor      : Daniel Begnami
Rotina     : Query qryBeneficario
Data       : 15/09/2009
Pendencia  : SOL 124449 Kintana 631998
Alteração  : Query qryBeneficario
----------------------------------------------------------------------------------------------------
Autor      : Daniel Begnami
Rotina     : Extrato Individual de Conciliação do Preventos INSS
Data       : 26/08/2009
Pendencia  : SOL 121611 Kintana 601986
Alteração  : Correção nos campos Entidade Contábil e Plano Previdenciário porem a tela Extrato
             Individual informa como REG/REPLAN, os campos devem trazer o plano/entidade do
             benefício ativo, caso não tenha ativo, ele deve trazer o ultimo plano/entidade que
             esteve ativo.
----------------------------------------------------------------------------------------------------
Autor      : Renato Visoni
Rotina     : edMatriculaExit
Data       : 08/05/2009
Pendencia  : SOL 116331 Kintana 546984
Alteração  : Quando um participante é aposentado e pensionista e fazemos a consulta com a matrícula
da aposentadoria o sistema está trazendo a conciliação do benefício de pensão.
----------------------------------------------------------------------------------------------------
Autor      : Renato Visoni
Rotina     : edNBExit
Data       : 24/04/2009
Pendencia  : SOL79604 Kintana 534926
Alteração  : O sistema não estava buscando os dados quando a pesquisa era feita somente pela matricula.
----------------------------------------------------------------------------------------------------
Autor      : André Pontes
Rotina     : - (qryMatricula)
Data       : 10/12/2007
Pendencia  : 26976
Alteração  : qryMatricula: alterado join com a Depentit para levar em conta IDPESSOA e IDTITULAR
----------------------------------------------------------------------------------------------------
Autor      : André Pontes
Rotina     : - (qryGlosaExtrato)
Data       : 29/10/2007
Pendencia  : 26612
Alteração  : qryGlosaExtrato: corrigida query para desprezar rubricas informativas
----------------------------------------------------------------------------------------------------
Autor      : André Pontes
Rotina     : btnImprimirClick(...) e AtualizaRubFolha(...)
Data       : 16/10/2007
Pendencia  : 26612
Alteração  : qryGlosaExtrato: criado novo filtro por código de mantenedora, acompanhando as queries
             que alimentam as grids
----------------------------------------------------------------------------------------------------
Autor      : André Pontes
Rotina     : TabSheet4Exit e AtualizaRubFolha
Data       : 16/10/2006
Pendencia  : 23543
Alteração  : Correção da passagem do parâmetro NUMPROCINSS (estava sendo passado
             como .AsFloat, deveria ser .AsString.
----------------------------------------------------------------------------------------------------
Autor      : André Pontes
Rotina     : chkRubInfoClick
Data       : 27/09/2006
Pendencia  : 23332
Alteração  : Opção de ignorar o plano na DetConc. Criada nova query (qrySemPlano)
             ligada a uma nova grid. Em um momento qualquer, apenas uma das
             grids fica visível. O checkbox "Exibir Plano" alterna a grid visível
----------------------------------------------------------------------------------------------------
Autor      : André Pontes
Rotina     : chkRubInfoClick
Data       : 06/09/2006
Pendencia  : 21295
Alteração  : Correção das exibição das rubricas informativas, que estava invertida:
             chkRubInfo.Checked --> not(chkRubInfo.Checked)
----------------------------------------------------------------------------------------------------
Autor      : André Pontes
Rotina     : -
Data       : 04/09/2006
Pendencia  : 21295
Alteração  : Novo ajuste no layout da tela, com introdução de sliders para
             permitir redimensionamento das grids
----------------------------------------------------------------------------------------------------
Autor      : André Pontes
Rotina     : - (qryReembolso e qryTotReembolso)
Data       : 07/08/2006
Pendencia  : 21295
Alteração  : 1) Ajuste geral no layout da tela
             2) Passagem de parâmetros nas queries, em vez de texto concatenado que era passado
                na chkRubInfoClick(...)
----------------------------------------------------------------------------------------------------
Autor      : André Pontes
Rotina     : qryBeneficiario
Data       : 06/07/2006
Pendencia  : 22487
Alteração  : Exibição do plano contábil da BenefBFCiaro em vez do plando da DetConcINSS:
             BF.IDPLANPREVCONTAB = PL.IDPLANOPREV(+) vs. D.IDPLANOPREV = PL.IDPLANOPREV(+)
----------------------------------------------------------------------------------------------------
Autor      : Gleyber
Rotina     : FormCreate e FormClose
Data       : 19/05/2006
Pendencia  : -----
Alteração  : Implementação para criar o datamodule DtmRelatBeneficios e
             destrui-lo quando fechar o form.
----------------------------------------------------------------------------------------------------
Autor      : Augusto
Data       : 1) 06/12/2005 2) 18/04/2006  3) 16/05/2006
Pendencia  : 19846
Descrição  : 1) Nova disposição dos campos no GRID de reembolso
             2) Inclusão do código do plano
             3) Alteração no join com INFORME no componente QryFolhaFuncef
----------------------------------------------------------------------------------------------------
Autor      : Augusto
Data       : 28/07/2005
Pendencia  : 19821
Descrição  : Acerto na qryBeneficiario para trazer o ultimo registro da DTECONCINSS
----------------------------------------------------------------------------------------------------
Autor      : Augusto
Data       : 19/07/2005
Pendencia  : 19754
Descrição  : Acerto na query
----------------------------------------------------------------------------------------------------
Autor      : Augusto
Data       : 10/05/2005
Pendencia  : 19171
Descrição  : Mostrar o Plano Previdenciário
----------------------------------------------------------------------------------------------------
Autor      : Augusto
Data       : 08/04/2005
Pendencia  : 19011
Descrição  : Permitir pesquisas somente apartir de 1997/05
----------------------------------------------------------------------------------------------------
Autor      : Augusto
Data       : 01/04/2005
Descrição  : No caso de o participante ter mais de um proecsso na DETCONCINSS
             exibir combo com os processos
----------------------------------------------------------------------------------------------------
Autor      : Augusto
Data       : 18/01/2005
Descrição  : Acerto na diferença do relatório

Data       : 17/01/2005
Descrição  : Retirar rubricas informativas da QryGlosa

Data       : 11/01/2005
Pendencia  : 18450
Descrição  : Acertar pesquisa dos não identificados

Data       : 16/12/2004
Pendencia  : --
Descrição  : Acerto na pesquisa do relatorio (no reembolso)

Data       : 15/12/2004
Pendencia  : 18301
Descrição  : Retirar absoluto da diferenca do relatorio
----------------------------------------------------------------------------------------------------
Autor      : Augusto
Data       : 07/12/2004
Descrição  : Aceitar todos os beneficios
----------------------------------------------------------------------------------------------------
Rotina     : btnImprimirClick
Data       : 06/12/2004
Pendencia  : 18214
Descrição  : Acerto na totalização dos desembolsos, uso do INFORME
Descrição  : Acerto na totalização dos Reembolsos, Estava usando parametro errado
----------------------------------------------------------------------------------------------------
Autor      : Augusto
Rotina     : btnImprimirClick
Data       : 18/11/2004
Pendencia  : 18059

Rotina     : QryFolhaFUNCEF
Data       : 17/11/2004
Pendencia  : 17662
Descrição  : Utilizar ALTER JOIN

Rotina     : QryFolhaFUNCEF
Data       : 11/11/2004
Pendencia  : 18059/17662
Descrição  : Filtrar rubricas que não são de IR

Rotina     : btnImprimirClick
Data       : 08/11/2004
Pendencia  : 17905 / 17796 / 17871
Descrição  : Acerto no totalizador do Reembolso

Rotina     : QryFolhaFuncef
Data       : 05/11/2004
Pendencia  : 17499
Descrição  : Ordenar Desembolso FUNCEF tbm, pelo mes de referencia.
----------------------------------------------------------------------------------------------------
Autor      : Flavio Dias
Rotina     : medReembolso
Data       : 25.08.2004
Pendencia  : 17471
Descrição  : Apresentar o total excluindo o valor total da glosa
----------------------------------------------------------------------------------------------------
Autor      : Camille
Rotina     : qryTotReembolso
Data       : 02.08.2004
Pendencia  : 17268
Descrição  : Acrescimo do parametro CodMant como integer
----------------------------------------------------------------------------------------------------
Autor      : Camille
Rotina     : chkRubInfoClick
Data       : 02.08.2004
Pendencia  : 17268
Descrição  : Acrescimo do parametro CodMant como integer
----------------------------------------------------------------------------------------------------
Autor      : Camille
Rotina     : qryBeneficiario
Data       : 02.08.2004
Pendencia  : 17270
Descrição  : 1. Acrescimo dos joins no WHERE
                (BF.NUMPROCINSS(+) = :NUMPROC ) AND
                (BBB.IDBENEFICIO = D.IDBENEFICIO(+) )
                pois estava retornando linhas da benefbfciario que náo tinham
                nada a ver com o processo da detconcinss
             2. Acrescimo do BENEFICIO BBB, no FROM
             3. Alteracao no SELECT no tratamento do nome do beneficio
                NVL(B.NOME,NVL(BB.NOME,BBB.NOME)) AS NOMEBENEFICIO,
             4. Alteracao na query para buscar a matricula da DEPENTIT caso
                nao encontre na DETCONCINSS
---------------------------------------------------------------------------------------------------}


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Spin, Grids, Wwdbigrd, Wwdbgrid, Db, DBTables,
  Wwquery, Wwdatsrc, TREdit, FPreview,  Pptypes, ComCtrls, Menus, ppEndUsr,
  ppCtrls, ppDB, ppBands, ppVar, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, ppComm, ppRelatv, ppDBPipe, ppDBBDE, Mask, wwdbedit, wwdblook,
  MontaSelect, DBGrids, Wwdotdot, Wwdbcomb;

type

    TRubricaINSS  = Record
      CodRubrica      : String[4];
      Valor           : Double;
    end;

    TDetalhe      = Record
      TipoDetalhe     :String[1]; //1-Credito Concessão //2-Credito Manutencao
                                 //3-PAB //4-GLOSA
      Rubrica         : array of TRubricaINSS;
      NumeroBeneficio :String[10];
      FlgTemRubrica   :String[1];
    End;


  TfrmExtratoINSS = class(TfrmSairAjuda)
    ToolbarSep971: TToolbarSep97;
    pnlTopo: TPanel;
    btnImprimir: TBitBtn;
    UpdateSQL1: TUpdateSQL;
    ppLeituraArq: TppBDEPipeline;
    prLeituaArq: TppReport;
    ppHeaderBand15: TppHeaderBand;
    ppDBImage14: TppDBImage;
    ppDBText212: TppDBText;
    ppDBText213: TppDBText;
    ppDBText214: TppDBText;
    ppDBText215: TppDBText;
    ppDBText216: TppDBText;
    ppDBText217: TppDBText;
    ppDBText218: TppDBText;
    ppLabel206: TppLabel;
    ppDBText219: TppDBText;
    ppLabel210: TppLabel;
    ppLine62: TppLine;
    ppLabel212: TppLabel;
    ppLabel214: TppLabel;
    ppLine64: TppLine;
    ppDetailBand16: TppDetailBand;
    ppDBText220: TppDBText;
    ppDBText221: TppDBText;
    ppFooterBand15: TppFooterBand;
    ppLine63: TppLine;
    ppLabel213: TppLabel;
    ppSystemVariable27: TppSystemVariable;
    ppSummaryBand13: TppSummaryBand;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppLabel2: TppLabel;
    ppdsnLeituraArq: TppDesigner;
    qryFundacao: TwwQuery;
    dsFundacao: TwwDataSource;
    ppFundacao: TppBDEPipeline;
    shp1: TppShape;
    ppLabel3: TppLabel;
    ppDBText2: TppDBText;
    ppLabel4: TppLabel;
    ppDBText3: TppDBText;
    ppDBCalc3: TppDBCalc;
    qryAux: TwwQuery;
    dsFolhaFuncef: TwwDataSource;
    dsReembolso: TwwDataSource;
    qryFolhaFuncef: TwwQuery;
    qryReembolso: TwwQuery;
    edNB: TEdit;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dsBeneficiario: TwwDataSource;
    dblkMatricula: TwwDBLookupCombo;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    dsGlosa: TwwDataSource;
    qryGlosaExtrato: TwwQuery;
    Label10: TLabel;
    qryMatricula: TwwQuery;
    dsMatricula: TwwDataSource;
    qryFolhaFuncefMES: TStringField;
    qryFolhaFuncefMESCOBRANCA: TStringField;
    qryFolhaFuncefIDRUBRICA: TFloatField;
    qryFolhaFuncefCODPROVDESC: TStringField;
    qryFolhaFuncefVALORPROVENTO: TFloatField;
    qryFolhaFuncefSINAL: TStringField;
    qryFolhaFuncefDATAPAGTO: TStringField;
    qryFolhaFuncefNUMPROCINSS: TStringField;
    qryFolhaFuncefDESCRRUBRICA: TStringField;
    qryFolhaFuncefFONTEPAGADORA: TFloatField;
    qryReembolsoMESREFERENCIA: TStringField;
    qryReembolsoMESCOBRANCA: TStringField;
    qryReembolsoNUMPROCINSS: TStringField;
    qryReembolsoVALORINSS: TFloatField;
    qryReembolsoSINAL: TStringField;
    qryReembolsoRUBRICAINSS: TFloatField;
    qryReembolsoDESCRRUBRICA: TStringField;
    qryReembolsoIDPLANOPREV: TFloatField;
    qryReembolsoENTIDADECONTABIL: TStringField;
    qryGlosaExtratoVLRGLOSA: TFloatField;
    qryReembolsoRMREAJ: TFloatField;
    qryReembolsoAPREAJ: TFloatField;
    qryReembolsoESPECIE: TStringField;
    qryFolhaFuncefVALOR: TFloatField;
    BtPesqPorMatricula: TBitBtn;
    edMatricula: TEdit;
    qryReembolsoVALOR3: TFloatField;
    qryReembolsoVALOR4: TFloatField;
    qryDIB: TwwQuery;
    dsDIB: TwwDataSource;
    qryMantenedora: TwwQuery;
    dsMantenedora: TwwDataSource;
    qryReembolsoNOMEMANTENEDORA: TStringField;
    qryReembolsoCODCONCESSORINSS: TStringField;
    qryReembolsoCODMANTENEDORINSS: TStringField;
    qryReembolsoCODMANTENEDORA: TStringField;
    qryTotReembolso: TwwQuery;
    edNome: TEdit;
    edMantenedora: TEdit;
    edDIB: TEdit;
    edEspecie: TEdit;
    edBeneficio: TEdit;
    edEntidade: TEdit;
    dsTotReembolso: TDataSource;
    CbxNBs: TwwDBComboBox;
    qryReembolsoMATRICULA: TStringField;
    qryReembolsoSEQUENCIAL: TFloatField;
    qryReembolsoNOMEPLANOPREV: TStringField;
    Label13: TLabel;
    EdNomePlanoPrev: TEdit;
    qryReembolsoIDPLANOPREVPREV: TFloatField;
    qryBeneficiario: TwwQuery;
    qryTotReembolsoVALOR: TFloatField;
    Panel2: TPanel;
    Label15: TLabel;
    Label16: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    wwDBEdit6: TwwDBEdit;
    medReembolso: TMaskEdit;
    medDiferenca: TMaskEdit;
    wwDBEdit8: TwwDBEdit;
    spAno: TSpinEdit;
    spMes: TSpinEdit;
    ChBxAutoPesquisa: TCheckBox;
    SpAnoFim: TSpinEdit;
    SpMesFim: TSpinEdit;
    Panel3: TPanel;
    Panel4: TPanel;
    wwDBGrid5: TwwDBGrid;
    wwDBGrid5IButton: TwwIButton;
    Panel10: TPanel;
    Panel11: TPanel;
    chkRubInfo: TCheckBox;
    chkReembolsoFundacao: TCheckBox;
    DBgrdComPlano: TwwDBGrid;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    DBgrdSemPlano: TwwDBGrid;
    chkExibePlano: TCheckBox;
    qrySemPlano: TwwQuery;
    StringField1: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    StringField13: TStringField;
    dtsSemPlano: TwwDataSource;
    chkInibirPA: TCheckBox;
    qrySemPlanoCODSINONIMO: TFloatField;
    qrySemPlanoDTINICIOCRED: TDateTimeField;
    qrySemPlanoDTFIMCRED: TDateTimeField;
    qryFolhaFuncefIDPLANOCONTABIL: TFloatField;
    qryFolhaFuncefIDPLANOPREV: TFloatField;
    qryReembolsoCODSINONIMO: TFloatField;
    qryReembolsoDTINICIOCRED: TDateTimeField;
    qryReembolsoDTFIMCRED: TDateTimeField;

    procedure btnImprimirClick(Sender: TObject);
    procedure TabSheet4Exit(Sender: TObject);
    procedure edNBExit(Sender: TObject);
    procedure BtPesqPorMatriculaClick(Sender: TObject);
    procedure edMatriculaExit(Sender: TObject);
    procedure chkRubInfoClick(Sender: TObject);
    procedure DBgrdComPlanoCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure dblkMatriculaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure FormShow(Sender: TObject);
    procedure spAnoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CbxNBsExit(Sender: TObject);
    procedure CbxNBsCloseUp(Sender: TwwDBComboBox; Select: Boolean);
    procedure CbxNBsKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edMatriculaKeyPress(Sender: TObject; var Key: Char);


  private // Private declarations

    MesAno, sspAno, sspMes, sspMesFim, sspAnoFim, sCodmantenedora : String;  
    aRubricaINSS,
    aRubGrupoTipo4  : array of TRubricaINSS;
    dedReembolso : Double;
    iPessoa, iPlanoContab : Integer;

    procedure AtualizaRubFolha(iidpessoa : Integer);


  public  // Public declarations

    LDetalhe       :TDetalhe;


  end;



var
  frmExtratoINSS: TfrmExtratoINSS;



implementation
{$R *.DFM}
uses
  USistema, UdataBase,UmensErro, UAdmPrev, DRelatBeneficios, fAguarde, fParamRelEspecieRI, fParamRelRubricaRI;



procedure TfrmExtratoINSS.btnImprimirClick(Sender: TObject);
Var
   i, ilinha, iContRub : Integer;
   sIdProvento, sRubricaINSS, sNumProc, sNomePlanoPrev,
   sEspecieFolha, sBenefFolha : String;
   dReembolsoLocal, nDifer : Double;
   arqeof : Boolean;
begin
  inherited;
  With DtmRelatBeneficios do
  begin
   qryExtrIndiv.Close;
   qryExtrIndiv.Open;
   qryFolhaFuncef.First;     
   while not qryFolhaFuncef.EOF do begin
       iLinha := 1;
       sEspecieFolha  := edEspecie.text;
       sNomePlanoPrev := EdNomePlanoPrev.Text;
       sBenefFolha    := edBeneficio.text;
       sNumProc       := qryFolhaFuncef.FieldByName('NUMPROCINSS').AsString;
       arqeof := False;

       if qryReembolso.Locate('NUMPROCINSS',qryFolhaFuncef.FieldByName('NUMPROCINSS').AsString,
                              [loCaseInsensitive, loPartialKey]) then

         nDifer := (dedReembolso - qryFolhaFuncef.FieldByName('VALOR').AsFloat)
       else begin
         nDifer := (qryFolhaFuncef.FieldByName('VALOR').AsFloat);
         arqeof:= True;
       end;
       while (not qryFolhaFuncef.EOF) and (sNumProc = qryFolhaFuncef.FieldByName('NUMPROCINSS').AsString )do begin

          qryExtrIndiv.Insert;
          qryExtrIndiv.FieldByName('MANTENEDORA').AsString  := edMantenedora.Text;
          qryExtrIndiv.FieldByName('MESCOBRANCA').AsString  := qryFolhaFuncef.FieldByName('MESCOBRANCA').AsString;
          qryExtrIndiv.FieldByName('MESREFERENCIA').AsString:= qryFolhaFuncef.FieldByName('MES').AsString;
          qryExtrIndiv.FieldByName('IDPLANOPREV').AsInteger := iPlanoContab;
          qryExtrIndiv.FieldByName('NOMEPLANO').AsString    := edEntidade.Text;
          qryExtrIndiv.FieldByName('ESPECIE').AsString      := sEspecieFolha;
          qryExtrIndiv.FieldByName('NOMEPLANOPREV').AsString:= sNomePlanoPrev;
          qryExtrIndiv.FieldByName('MATRICULA').AsString    := dblkMatricula.LookupValue;
          qryExtrIndiv.FieldByName('NB').AsString           := qryFolhaFuncef.FieldByName('NUMPROCINSS').AsString;
          qryExtrIndiv.FieldByName('NOMEBENEF').AsString    := edNome.Text;
          qryExtrIndiv.FieldByName('RUBFUNCEF').AsString    := qryFolhaFuncef.FieldByName('CODPROVDESC').AsString;

          qryExtrIndiv.FieldByName('VALORFUNCEF').AsFloat   := qryFolhaFuncef.FieldByName('VALORPROVENTO').AsFloat;
          if (not arqeof) and (qryReembolso.FieldByName('NUMPROCINSS').AsString  = sNumProc) and
             (not qryReembolso.EOF) then begin
             qryExtrIndiv.FieldByName('MESCOBREEMB').AsString := qryReembolso.FieldByName('MESCOBRANCA').AsString;
             qryExtrIndiv.FieldByName('MESREFREEMB').AsString := qryReembolso.FieldByName('MESREFERENCIA').AsString;
             qryExtrIndiv.FieldByName('RMREAJ').AsFloat       := qryReembolso.FieldByName('RMREAJ').AsFloat;
             qryExtrIndiv.FieldByName('RUBINSS').AsString     := qryReembolso.FieldByName('RUBRICAINSS').AsString;
             qryExtrIndiv.FieldByName('VALORINSS').AsFloat    := qryReembolso.FieldByName('VALORINSS').AsFloat;
             qryExtrIndiv.FieldByName('IDPLANOPREVREEMB').AsInteger := qryReembolso.FieldByName('IDPLANOPREV').AsInteger;
          end else begin
             qryExtrIndiv.FieldByName('MESCOBREEMB').Clear;
             qryExtrIndiv.FieldByName('MESREFREEMB').Clear;
             qryExtrIndiv.FieldByName('RMREAJ').Clear;
             qryExtrIndiv.FieldByName('RUBINSS').Clear;
             qryExtrIndiv.FieldByName('VALORINSS').Clear;
          end;
          if iLinha = 1 then
             qryExtrIndiv.FieldByName('DIFERENCA').AsFloat  := nDifer
          else
             qryExtrIndiv.FieldByName('DIFERENCA').Clear;
          inc(iLinha);
          qryExtrIndiv.Post;
          if not qryReembolso.eof then
             qryReembolso.Next;
          qryFolhaFuncef.Next;
       end;
       {continuar a ler a qryReembolso para descarregar os registros restantes}
       while (not qryReembolso.EOF) and (qryReembolso.FieldByName('NUMPROCINSS').AsString  = sNumProc) do begin
          qryExtrIndiv.Insert;
          qryExtrIndiv.FieldByName('ESPECIE').AsString      := sEspecieFolha;
          qryExtrIndiv.FieldByName('NOMEPLANOPREV').AsString:= sNomePlanoPrev;
          qryExtrIndiv.FieldByName('MATRICULA').AsString    := dblkMatricula.LookupValue;
          qryExtrIndiv.FieldByName('NB').AsString           := edNB.Text;
          qryExtrIndiv.FieldByName('NOMEBENEF').AsString    := edNome.Text;

          qryExtrIndiv.FieldByName('MANTENEDORA').AsString  := edMantenedora.Text;
          qryExtrIndiv.FieldByName('MESCOBREEMB').AsString  := qryReembolso.FieldByName('MESCOBRANCA').AsString;
          qryExtrIndiv.FieldByName('MESREFREEMB').AsString  := qryReembolso.FieldByName('MESREFERENCIA').AsString;
          qryExtrIndiv.FieldByName('IDPLANOPREV').AsInteger := qryReembolso.FieldByName('IDPLANOPREV').AsInteger;
          qryExtrIndiv.FieldByName('NOMEPLANO').AsString    := qryReembolso.FieldByName('ENTIDADECONTABIL').AsString;
          qryExtrIndiv.FieldByName('RUBINSS').AsString      := qryReembolso.FieldByName('RUBRICAINSS').AsString;
          qryExtrIndiv.FieldByName('VALORINSS').AsFloat     := qryReembolso.FieldByName('VALORINSS').AsFloat;
          qryExtrIndiv.FieldByName('RMREAJ').AsFloat        := qryReembolso.FieldByName('RMREAJ').AsFloat;
          qryExtrIndiv.FieldByName('IDPLANOPREVREEMB').AsInteger := qryReembolso.FieldByName('IDPLANOPREV').AsInteger;

          qryExtrIndiv.Post;
          qryReembolso.Next;
       end;
   end;
   {ao acabar a query da Folha, partir da query do Reembolso e para cada registro
    não encontrado na query da Folha, inserir na query do relatório }
   qryReembolso.First;
   while not qryReembolso.EOF do begin
       iLinha := 1;

       if not qryFolhaFuncef.Locate('NUMPROCINSS',qryReembolso.FieldByName('NUMPROCINSS').AsString,[loCaseInsensitive, loPartialKey]) then begin
          sNumProc := qryReembolso.FieldByName('NUMPROCINSS').AsString;
          while (not qryReembolso.EOF) and (sNumProc = qryReembolso.FieldByName('NUMPROCINSS').AsString) do begin
             qryExtrIndiv.Insert;
             qryExtrIndiv.FieldByName('MANTENEDORA').AsString  := edMantenedora.Text;
             qryExtrIndiv.FieldByName('MESCOBREEMB').AsString  := qryReembolso.FieldByName('MESCOBRANCA').AsString;
             qryExtrIndiv.FieldByName('MESREFREEMB').AsString  := qryReembolso.FieldByName('MESREFERENCIA').AsString;
             qryExtrIndiv.FieldByName('IDPLANOPREV').AsInteger := qryReembolso.FieldByName('IDPLANOPREV').AsInteger;
             qryExtrIndiv.FieldByName('NOMEPLANO').AsString    := qryReembolso.FieldByName('ENTIDADECONTABIL').AsString;
             qryExtrIndiv.FieldByName('ESPECIE').AsString      := qryReembolso.FieldByName('ESPECIE').AsString;
             qryExtrIndiv.FieldByName('NOMEPLANOPREV').AsString:= qryReembolso.FieldByName('NOMEPLANOPREV').AsString;
             qryExtrIndiv.FieldByName('MATRICULA').AsString    := dblkMatricula.LookupValue; //qryReembolso.FieldByName('MATRICULA').AsString;
             qryExtrIndiv.FieldByName('NB').AsString           := qryReembolso.FieldByName('NUMPROCINSS').AsString;
             qryExtrIndiv.FieldByName('NOMEBENEF').AsString    := edNome.Text;
             qryExtrIndiv.FieldByName('RMREAJ').AsFloat        := qryReembolso.FieldByName('RMREAJ').AsFloat;
             qryExtrIndiv.FieldByName('RUBFUNCEF').Clear;
             qryExtrIndiv.FieldByName('VALORFUNCEF').Clear;
             qryExtrIndiv.FieldByName('RUBINSS').AsString      := qryReembolso.FieldByName('RUBRICAINSS').AsString;
             qryExtrIndiv.FieldByName('VALORINSS').AsFloat     := qryReembolso.FieldByName('VALORINSS').AsFloat;
             qryExtrIndiv.FieldByName('IDPLANOPREVREEMB').AsInteger := qryReembolso.FieldByName('IDPLANOPREV').AsInteger;


             if iLinha = 1 then
                DtmRelatBeneficios.qryExtrIndiv.FieldByName('DIFERENCA').AsFloat  := dedReembolso;


             inc(iLinha);
             DtmRelatBeneficios.qryExtrIndiv.Post;
             qryReembolso.Next;
          end;
       end else
          qryReembolso.Next;
   end;
   DtmRelatBeneficios.lblTotalFuncef.Caption := FormatFloat('#,##0.00',qryFolhaFuncef.FieldByName('VALOR').AsFloat);


   qryGlosaExtrato.Close;
   qryGlosaExtrato.Prepare;
   qryGlosaExtrato.ParamByName('MESCOB').AsString             := sspAno;
   qryGlosaExtrato.ParamByName('MESCOBFIM').AsString          := sspAnoFim;   
   qryGlosaExtrato.ParamByName('NUMPROC').AsString            := edNB.text;
   qryGlosaExtrato.ParamByName('PMANTENEDORAFUND').AsInteger  := Ord(chkReembolsoFundacao.Checked);
   qryGlosaExtrato.Open;

   if qryGlosaExtrato.EOF then
     dReembolsoLocal := dedReembolso
   else
     dReembolsoLocal := dedReembolso + qryGlosaExtrato.FieldByName('VLRGLOSA').AsFloat;

   DtmRelatBeneficios.lblTotalReemb.Caption  := FormatFloat('#,##0.00',dReembolsoLocal); { era dedReembolso }
   nDifer := nDifer + qryGlosaExtrato.FieldByName('VLRGLOSA').AsFloat;

   // SOL122987 - Daniel Begnami
   DtmRelatBeneficios.lblDiferenca.Caption   := medDiferenca.text; //FormatFloat('#,##0.00',StrToFloat(medDiferenca.text));
   DtmRelatBeneficios.lblGlosa.Caption       := wwDBEdit8.text;    //FormatFloat('#,##0.00',nDifer);

   if wwDBEdit8.text = '' then
     DtmRelatBeneficios.ppLabel267.Visible := False
   else
     DtmRelatBeneficios.ppLabel267.Visible := True;

   // FIM

   DtmRelatBeneficios.ppdExtrIndiv.Report.Template.SaveTo  := stFile;
   DtmRelatBeneficios.ppdExtrIndiv.Report.Template.Format  := ftASCII;
   DtmRelatBeneficios.ppdExtrIndiv.Report.Device           := dvScreen;


   TFrmPreview.CreateModalPreview(Application, ppdExtrIndiv.Report, 'Reembolso INSS - Extrato Individual');
  End; { With DtmRelatBeneficios }
end;



procedure TfrmExtratoINSS.TabSheet4Exit(Sender: TObject);
begin
  inherited;
  qryAux.Close;
  qryAux.SQL.Text := 'SELECT IDPESSOA FROM BENEFBFCIARIO WHERE NUMPROCINSS = ' + edNB.Text;
  qryAux.Open;
  if not qryAux.EOF then begin
     qryFolhaFuncef.Close;
     qryFolhaFuncef.ParamByName('idpessjur').AsInteger  := Sistema.IdEmpresa;
     qryFolhaFuncef.ParamByName('idpessoa').AsInteger   := qryAux.FieldByName('IDPESSOA').asInteger;
     qryFolhaFuncef.ParamByName('numprocinss').AsString := edNB.Text;
     qryFolhaFuncef.ParamByName('mescob').AsString      := sspAno;
     qryFolhaFuncef.ParamByName('MESCOBFIM').AsString   := sspAnoFim;

     // Renato Visoni SOL122873 Kintana 615216
     if chkInibirPA.Checked then begin
       qryFolhaFuncef.ParamByName('pConsideraPA').AsInteger  := 1;
     end else begin
       qryFolhaFuncef.ParamByName('pConsideraPA').AsInteger  := 2;
     end;
     // Renato Visoni SOL122873 Kintana 615216

     qryFolhaFuncef.Open;
  end;

  chkRubInfoClick(Self);
end;



procedure TfrmExtratoINSS.edNBExit(Sender: TObject);
begin
  inherited;
  edMatricula.SendtoBack;
  edNB.BringToFront;

  //Renato Visoni SOL79604 Kintana 534926
  if CbxNBs.Text <> '' then
    edNB.Text := CbxNBs.Text
  else
    edNB.Text :='';
  //Fim


  if edNB.Text = '' then
     exit;

  qryBeneficiario.Close;
  qryBeneficiario.ParamByName('numproc').AsString  := edNB.text;
  qryBeneficiario.Open;

  if qryBeneficiario.EOF then begin
    qryAux.SQL.text := 'SELECT B.IDPESSOA, B.IDPLANOPREV, B.IDPLANPREVCONTAB, B.DATAINICIO, ' +
                       '       D.MATRICULA, PL.NOME, BN.NOME AS NOMEBENEF, P.NOME AS NOMEPESSOA, ' +
                       '       BN.CODBENEFICIO AS ESPECIE, ' +
                       '       PP.NOME AS NOMEPLANOPREV '+
                       'FROM BENEFBFCIARIO B, DEPENTIT D, BENEFPLANPREV BP, BENEFICIO BN, '+
                       '     PESSOA P, PLANPREVCONTABIL PL,'+
                       '     PLANPREV PP '+
                       'WHERE B.NUMPROCINSS = ' + QuotedStr(edNB.text) + ' AND '+
                       '      B.IDTITULAR = D.IDTITULAR(+) AND ' +
                       '      B.IDPESSOA  = D.IDPESSOA(+) AND ' +
                       '      B.IDPESSOA  = P.IDPESSOA(+) AND ' +
                       '      B.IDPLANOPREV = PP.IDPLANOPREV(+) AND ' +
                       '      B.IDPLANOPREV = BP.IDPLANOPREV(+) AND ' +
                       '      B.IDBENEFICIO = BP.IDBENEFICIO(+) AND ' +
                       '      BP.FLGREFERENCIA = 1 AND ' +
                       '      B.IDBENEFICIO = BN.IDBENEFICIO AND ' +
                       '      B.IDPLANPREVCONTAB = PL.IDPLANOPREV(+) ' ;
    qryAux.Open;
    if not qryAux.EOF then begin
       iPessoa            := qryAux.FieldByName('IDPESSOA').AsInteger;
       iPlanoContab       := qryAux.FieldByName('IDPLANPREVCONTAB').AsInteger;
       edMantenedora.Text := 'FUNCEF';
       sCodmantenedora    :=  '99';
       edNome.Text        := qryAux.FieldByName('NOMEPESSOA').AsString;
       edDIB.Text         := qryAux.FieldByName('DATAINICIO').AsString;
       edEntidade.Text    := qryAux.FieldByName('NOME').AsString;
       edBeneficio.Text   := qryAux.FieldByName('NOMEBENEF').AsString;
       edEspecie.Text     := qryAux.FieldByName('ESPECIE').AsString;
       EdNomePlanoPrev.Text := qryAux.FieldByName('NOMEPLANOPREV').AsString;
       qryMatricula.Close;
       qryMatricula.ParamByName('numproc').AsString  := edNB.text;
       qryMatricula.Open;
       if not qryMatricula.EOF then begin
          dblkMatricula.LookupValue := qryMatricula.FieldByName('MATRICULA').AsString;
       end;
    end
    else begin
       ShowMessage('NB não encontrado');
       exit;
    end;
  end
  else begin
    iPessoa            := qryBeneficiario.FieldByName('IDPESSOA').AsInteger;
    iPlanoContab       := qryBeneficiario.FieldByName('IDPLANOPREV').AsInteger;
    edEntidade.Text    := qryBeneficiario.FieldByName('PLANOCONTABIL').AsString;
    edBeneficio.Text   := qryBeneficiario.FieldByName('NOMEBENEFICIO').AsString;
    edEspecie.Text     := qryBeneficiario.FieldByName('ESPECIE').AsString;
    EdNomePlanoPrev.Text := qryBeneficiario.FieldByName('NOMEPLANOPREV').AsString;
    
    qryDIB.Close;
    qryDIB.ParamByName('numproc').AsString  := edNB.text;
    qryDIB.Open;
    if not qryDIB.EOF then
       edDIB.Text  := qryDIB.FieldByName('DIB').AsString;

    qryMantenedora.Close;
    qryMantenedora.ParamByName('numproc').AsString  := edNB.text;
    qryMantenedora.Open;
    if not qryMantenedora.EOF then begin
       edMantenedora.Text := qryMantenedora.FieldByName('NOMEMANTENEDORA').AsString;
       sCodmantenedora    :=  qryMantenedora.FieldByName('CODMANTENEDORA').AsString;
    end;
    qryMatricula.Close;
    qryMatricula.ParamByName('numproc').AsString  := edNB.text;
    qryMatricula.Open;
    if not qryMatricula.EOF then begin
       dblkMatricula.LookupValue := qryMatricula.FieldByName('MATRICULA').AsString;
       edNome.Text := qryMatricula.FieldByName('NOME').AsString;
    end
    else begin
       qryBeneficiario.First;
       edNome.Text :=   qryBeneficiario.FieldByName('NOME').AsString;
       while (not qryBeneficiario.EOF) and (dblkMatricula.LookupValue = '') do begin
         if qryBeneficiario.FieldByName('MATRICULA').AsString <> '' then
           dblkMatricula.LookupValue := qryBeneficiario.FieldByName('MATRICULA').AsString;
         qryBeneficiario.Next;
       end;
    end;

    qryBeneficiario.First;

  end;

  spAnoChange(Self);
  chkRubInfoClick(Self);

  AtualizaRubFolha(iPessoa);
end;

procedure TfrmExtratoINSS.BtPesqPorMatriculaClick(Sender: TObject);
begin
  inherited;
  edMatricula.BringtoFront;
  edMatricula.SetFocus;
end;

procedure TfrmExtratoINSS.edMatriculaExit(Sender: TObject);
Var
  sIdPessoa, sNumProcINSS : String;
begin
  inherited;

  if edMatricula.Text = '' then
     exit;
  qryAux.Close;
  qryAux.SQL.Text := 'SELECT DISTINCT IDPESSOA, NUMPROCINSS, MATRICULA FROM DETCONCINSS WHERE MATRICULA = ' + QuotedStr(edMatricula.Text)+
                     ' ORDER BY NUMPROCINSS';
  qryAux.Open;
  CbxNbs.Clear;
  CbxNbs.Items.Clear;

  if qryAux.RecordCount > 1 then begin
    While not QryAux.Eof do begin
      CbxNbs.Items.Add(QryAux.FieldByName('NUMPROCINSS').AsString);
      QryAux.Next;
    End;
    QryAux.First; //Renato Visoni SOL 116331 Kintana 546984
    edMatricula.SendToBack;
    CbxNbs.BringToFront;
    CbxNbs.Text := qryAux.FieldByName('NUMPROCINSS').AsString;
    CbxNbsExit(Self);
    Exit;
  End;

  if not qryAux.EOF then begin
     CbxNbs.Text := qryAux.FieldByName('NUMPROCINSS').AsString;
     edMatricula.SendToBack;
     CbxNbsExit(Self);
  end else begin
     qryAux.Close;
     qryAux.SQL.Text := 'SELECT IDPESSOA, MATRICULA FROM DEPENTIT WHERE MATRICULA = ' + QuotedStr(edMatricula.Text);
     qryAux.Open;
     if not qryAux.EOF then begin
        sIdPessoa := qryAux.FieldByName('IDPESSOA').AsString;
        qryAux.Close;
        qryAux.SQL.Text := 'SELECT IDPESSOA,NUMPROCINSS FROM DETCONCINSS WHERE IDPESSOA = ' + sIdPessoa;
        qryAux.Open;
        if not qryAux.EOF then begin
           CbxNbs.Text := qryAux.FieldByName('NUMPROCINSS').AsString;
           edMatricula.SendToBack;
           CbxNbsExit(Self);
        end
        else begin
           qryAux.Close;
           qryAux.SQL.Text := 'SELECT IDPESSOA,NUMPROCINSS FROM BENEFBFCIARIO WHERE IDPESSOA = ' + sIdPessoa + ' AND FONTEPAGADORA = 2';
           qryAux.Open;
           if not qryAux.EOF then begin
              CbxNbs.Text := qryAux.FieldByName('NUMPROCINSS').AsString;
              edMatricula.SendToBack;
              edNBExit(Self);
           end;
        end;
     end
     else
       ShowMessage('Matrícula não encontrada');
  end;
end;





procedure TfrmExtratoINSS.chkRubInfoClick(Sender: TObject);
var
   sSQL         : String;
   sSQLComPlano : String;
   sSQLSemPlano : String;
begin
   inherited;

   sSQL :=
   'SELECT '                                                                                       + #13 +
   '   MESREFERENCIA, MESCOBRANCA, NUMPROCINSS, VALORINSS, MATRICULA, '                            + #13 +
   '   SINAL, ESPECIE, RUBRICAINSS, DESCRRUBRICA, VALOR3, VALOR4, IDPLANOPREV, '                   + #13 +
   '   ENTIDADECONTABIL, RMREAJ, APREAJ, CODMANTENEDORA, NOMEMANTENEDORA, SEQUENCIAL, '            + #13 +
   '   CODCONCESSORINSS, CODMANTENEDORINSS, IDPLANOPREVPREV, NOMEPLANOPREV '                       + #13 +
   '   ,CODSINONIMO,DTINICIOCRED, DTFIMCRED '                                                      + #13 + //Renato Visoni SOL 123118 Kintana 612606
   'FROM '                                                                                         + #13 +

   '   ( '                                                                                         + #13 +
   '   SELECT '                                                                                    + #13 +
   '      D.MESREFERENCIA, D.MESCOBRANCA, D.NUMPROCINSS, D.VALORINSS, D.MATRICULA, '               + #13 +
   '      DECODE(P.FLGDESCONTO, 1, ''(-)'', 0, ''(+)'', ''(*)'') AS SINAL, D.ESPECIE, '            + #13 +
   '      D.RUBRICAINSS,SUBSTR(P.DESCRICAO,1,30) AS DESCRRUBRICA, TOTAL.VALOR AS VALOR3, '         + #13 +
   '      0 AS VALOR4, D.IDPLANOPREV, PL.NOME AS ENTIDADECONTABIL , D.RMREAJ, D.APREAJ, '          + #13 +
   '      D.CODMANTENEDORA, NVL(M.NOME,''FUNCEF'') AS NOMEMANTENEDORA, D.SEQUENCIAL, '             + #13 +
   '      D.CODCONCESSORINSS, D.CODMANTENEDORINSS, D.IDPLANOPREVPREV, PP.NOME AS NOMEPLANOPREV '   + #13 +
   '      ,CODSINONIMO,DTINICIOCRED, DTFIMCRED '                                                   + #13 +//Renato Visoni SOL 123118 Kintana 612606
   '   FROM '                                                                                      + #13 +
   '      DETCONCINSS      D, '                                                                    + #13 +
   '      PROVDESC         P, '                                                                    + #13 +
   '      PLANPREVCONTABIL PL, '                                                                   + #13 +
   '      MANTENEDORA      M, '                                                                    + #13 +
   '      PLANPREV         PP, '                                                                   + #13 +

   '      ( '                                                                                      + #13 +
   '      SELECT '                                                                                 + #13 +
   '         SUM(DECODE(P.FLGDESCONTO, 0, VALORINSS, 1, -VALORINSS, 0)) AS VALOR '                 + #13 +
   '      FROM '                                                                                   + #13 +
   '         DETCONCINSS H, '                                                                      + #13 +
   '         PROVDESC    P '                                                                       + #13 +
   '      WHERE '                                                                                  + #13 +
   '             (H.NUMPROCINSS     = ' + QuotedStr(edNB.Text) + ') '                                                     + #13 +
   '         AND ((H.MESCOBRANCA   >= ' + QuotedStr(sspAno) + ') AND (H.MESCOBRANCA <= ' + QuotedStr(sspAnoFim) + ')) '   + #13;

   if not(chkRubInfo.Checked) then sSQL := sSQL +
   '         AND ((SUBSTR(H.RUBRICAINSS, 2, 1) <> ''3'') AND (SUBSTR(H.RUBRICAINSS, 2, 1) <> ''9'')) '   + #13;

   if chkReembolsoFundacao.Checked then sSQL := sSQL +
   '         AND (H.CODMANTENEDORA  IS NULL OR H.CODMANTENEDORA IN (6, 14, 99) ) '                 + #13;

   sSQL := sSQL +
   '         AND (H.IDRUBRICA       = P.IDPROVENTO) '                                              + #13 +
   '         AND (H.FLGMANUAL      <> 4) '                                                         + #13 +
   '         AND (H.FLGMANUAL      <> 1) '                                                         + #13 +
   '         AND (H.FLGMANUAL      <> 2) '                                                         + #13 +
   '      ) TOTAL '                                                                                + #13 +

   '   WHERE '                                                                                     + #13 +
   '          (D.NUMPROCINSS = ' + QuotedStr(edNB.Text) + ') '                                                       + #13 +

   '      AND ((D.MESCOBRANCA >= ' + QuotedStr(sspAno) + ') AND (D.MESCOBRANCA <= ' + QuotedStr(sspAnoFim) + ')) '   + #13;

   if not(chkRubInfo.Checked) then sSQL := sSQL +
   '      AND ((SUBSTR(D.RUBRICAINSS, 2, 1) <> ''3'') AND (SUBSTR(D.RUBRICAINSS, 2, 1) <> ''9'')) '      + #13;

   if chkReembolsoFundacao.Checked then sSQL := sSQL +
   '      AND (D.CODMANTENEDORA  IS NULL OR D.CODMANTENEDORA IN (6, 14, 99) ) '                    + #13;

   sSQL := sSQL +
   '      AND (D.IDRUBRICA       = P.IDPROVENTO) '                                                 + #13 +
   '      AND (D.IDPLANOPREVPREV = PP.IDPLANOPREV(+)) '                                            + #13 +
   '      AND (D.IDPLANOPREV     = PL.IDPLANOPREV(+)) '                                            + #13 +
   '      AND (D.FLGMANUAL      <> 4) '                                                            + #13 +
   '      AND (D.FLGMANUAL      <> 1) '                                                            + #13 +
   '      AND (D.FLGMANUAL      <> 2) '                                                            + #13 +
   '      AND (D.CODMANTENEDORA  = M.CODMANTENEDORA(+)) '                                          + #13 +

   '   UNION ALL '                                                                                 + #13 +

   '   SELECT '                                                                                    + #13 +
   '      D.MESREFERENCIA, D.MESPROCESSAMENTO AS MESCOBRANCA, D.NUMPROCINSS, '                     + #13 +
   '      D.VLRRUBRICA1 AS VALORINSS, D.MATRICULA, '                                               + #13 +
   '      DECODE(P.FLGDESCONTO, 1, ''(-)'', 0, ''(+)'', ''(*)'' ) AS SINAL, D.ESPECIE, '           + #13 +
   '      CODRUBRICA1 AS RUBRICAINSS, SUBSTR(P.DESCRICAO, 1, 30) AS DESCRRUBRICA, '                + #13 +
   '      TOTAL.VALOR AS VALOR3, 0 AS VALOR4, 2 AS IDPLANOPREV, ''REPLAN'' AS ENTIDADECONTABIL, '  + #13 +
   '      D.RMREAJ, D.APREAJ, ''99'' AS CODMANTENEDORA, ''NÃO IDENTIFICADO'' AS NOMEMANTENEDORA, ' + #13 +
   '      1 AS SEQUENCIAL, D.CODCONCESSORINSS,   D.CODMANTENEDORINSS, 0 AS IDPLANOPREVPREV, '      + #13 +
   '      ''  '' AS NOMEPLANOPREV '                                                                + #13 +
   '      ,D.CODSINONIMO,D.DTINICIOCRED, D.DTFIMCRED '                                             + #13 +//Renato Visoni SOL 123118 Kintana 612606
   '   FROM '                                                                                      + #13 +
   '      TEMPCONCINSS D, '                                                                        + #13 +
   '      PROVDESC     P, '                                                                        + #13 +
   '      RUBRICAXINSS R, '                                                                        + #13 +

   '      ( '                                                                                      + #13 +
   '      SELECT '                                                                                 + #13 +
   '         SUM(DECODE(P.FLGDESCONTO, 0, VLRRUBRICA1, 1, -VLRRUBRICA1, 0)) AS VALOR '             + #13 +
   '      FROM '                                                                                   + #13 +
   '         TEMPCONCINSS H, '                                                                     + #13 +
   '         PROVDESC     P, '                                                                     + #13 +
   '         RUBRICAXINSS R '                                                                      + #13 +
   '      WHERE '                                                                                  + #13 +
   '             (H.NUMPROCINSS        = ' + QuotedStr(edNB.Text) + ') '                                                         + #13 +
   '         AND ((H.MESPROCESSAMENTO >= ' + QuotedStr(sspAno) + ') AND (H.MESPROCESSAMENTO <= ' + QuotedStr(sspAnoFim) + ')) '  + #13;

   if not(chkRubInfo.Checked) then sSQL := sSQL +
   '         AND ((SUBSTR(H.CODRUBRICA1, 2, 1) <> ''3'') AND (SUBSTR(H.CODRUBRICA1, 2, 1) <> ''9'')) '   + #13;

   sSQL := sSQL +
   '         AND (H.CODRUBRICA1        = R.RUBRICAINSS(+) ) '                                      + #13 +
   '         AND (R.IDRUBRICA          = P.IDPROVENTO(+)) '                                        + #13 +
   '      ) TOTAL '                                                                                + #13 +

   '   WHERE '                                                                                     + #13 +
   '          (D.NUMPROCINSS        = ' + QuotedStr(edNB.Text) + ') '                              + #13 +
   '      AND ((D.MESPROCESSAMENTO >= ' + QuotedStr(sspAno) + ') AND (D.MESPROCESSAMENTO <= ' + QuotedStr(sspAnoFim) + ')) '  + #13;

   if not(chkRubInfo.Checked) then sSQL := sSQL +
   '      AND ((SUBSTR(D.CODRUBRICA1, 2, 1) <> ''3'') AND (SUBSTR(D.CODRUBRICA1,2,1) <> ''9'')) '  + #13;

   sSQL := sSQL +
   '      AND (D.CODRUBRICA1        = R.RUBRICAINSS(+) ) '                                         + #13 +
   '      AND (R.IDRUBRICA          = P.IDPROVENTO(+)) '                                           + #13 +

   '   UNION ALL '                                                                                 + #13 +

   '   SELECT '                                                                                    + #13 +
   '      D.MESREFERENCIA, D.MESCOBRANCA, D.NUMPROCINSS, D.VALORINSS, D.MATRICULA, '               + #13 +
   '      DECODE(P.FLGDESCONTO, 1, ''(-)'', 0, ''(+)'', ''(*)'') AS SINAL, D.ESPECIE, '            + #13 +
   '      D.RUBRICAINSS,SUBSTR(P.DESCRICAO, 1, 30) AS DESCRRUBRICA, 0 AS VALOR3, '                 + #13 +
   '      TOTAL.VALOR AS VALOR4, D.IDPLANOPREV, PL.NOME AS ENTIDADECONTABIL , D.RMREAJ, '          + #13 +
   '      D.APREAJ, D.CODMANTENEDORA, NVL(M.NOME,''FUNCEF'') AS NOMEMANTENEDORA, D.SEQUENCIAL, '   + #13 +
   '      D.CODCONCESSORINSS, D.CODMANTENEDORINSS, D.IDPLANOPREVPREV, PP.NOME AS NOMEPLANOPREV '   + #13 +
   '      ,D.CODSINONIMO,D.DTINICIOCRED, D.DTFIMCRED '                                             + #13 +//Renato Visoni SOL 123118 Kintana 612606
   '   FROM '                                                                                      + #13 +
   '      DETCONCINSS      D, '                                                                    + #13 +
   '      PROVDESC         P, '                                                                    + #13 +
   '      PLANPREVCONTABIL PL, '                                                                   + #13 +
   '      MANTENEDORA      M, '                                                                    + #13 +
   '      PLANPREV         PP, '                                                                   + #13 +

   '      ( '                                                                                      + #13 +
   '      SELECT '                                                                                 + #13 +
   '         DD.NUMPROCINSS, DD.CODMANTENEDORA, DD.MESREFERENCIA, DD.SEQUENCIAL '                  + #13 +
   '      FROM '                                                                                   + #13 +
   '         DETCONCINSS DD '                                                                      + #13 +
   '      WHERE '                                                                                  + #13 +
   '             (DD.NUMPROCINSS    = ' + QuotedStr(edNB.Text) + ') '                              + #13 +
   '         AND ((DD.MESCOBRANCA  >= ' + QuotedStr(sspAno) + ') AND (DD.MESCOBRANCA <= ' + QuotedStr(sspAnoFim) + ')) ' + #13;

   if not(chkRubInfo.Checked) then sSQL := sSQL +
   '         AND ((SUBSTR(DD.RUBRICAINSS, 2, 1) <> ''3'') AND (SUBSTR(DD.RUBRICAINSS, 2, 1) <> ''9'')) ' + #13;

   if chkReembolsoFundacao.Checked then sSQL := sSQL +
   '         AND (DD.CODMANTENEDORA  IS NULL OR DD.CODMANTENEDORA IN (6, 14, 99) ) '               + #13;

   sSQL := sSQL +
   '         AND (DD.FLGMANUAL      = 3) '                                                         + #13 +
   '      ) DTF3, '                                                                                + #13 +

   '      ( '                                                                                      + #13 +
   '      SELECT '                                                                                 + #13 +
   '         SUM(DECODE(P.FLGDESCONTO, 0, VALORINSS, 1, -VALORINSS, 0)) AS VALOR '                 + #13 +
   '      FROM '                                                                                   + #13 +
   '         DETCONCINSS H, '                                                                      + #13 +
   '         PROVDESC    P, '                                                                      + #13 +

   '         ( '                                                                                   + #13 +
   '         SELECT '                                                                              + #13 +
   '            DD.NUMPROCINSS, DD.CODMANTENEDORA, DD.MESREFERENCIA, DD.SEQUENCIAL '               + #13 +
   '         FROM '                                                                                + #13 +
   '            DETCONCINSS DD '                                                                   + #13 +
   '         WHERE '                                                                               + #13 +
   '                (DD.NUMPROCINSS    = ' + QuotedStr(edNB.Text) + ') '                           + #13 +
   '            AND ((DD.MESCOBRANCA  >= ' + QuotedStr(sspAno) + ') AND (DD.MESCOBRANCA <= ' + QuotedStr(sspAnoFim) + ')) ' + #13;

   if not(chkRubInfo.Checked) then sSQL := sSQL +
   '            AND ((SUBSTR(DD.RUBRICAINSS, 2, 1) <> ''3'') AND (SUBSTR(DD.RUBRICAINSS, 2, 1) <> ''9'')) ' + #13;

   if chkReembolsoFundacao.Checked then sSQL := sSQL +
   '            AND (DD.CODMANTENEDORA  IS NULL OR DD.CODMANTENEDORA IN (6, 14, 99) ) '            + #13;

   sSQL := sSQL +
   '            AND (DD.FLGMANUAL      = 3) '                                                      + #13 +
   '         ) DETF3 '                                                                             + #13 +

   '      WHERE '                                                                                  + #13 +
   '             (H.NUMPROCINSS              = ' + QuotedStr(edNB.Text) + ') '                     + #13 +
   '         AND (H.IDRUBRICA                = P.IDPROVENTO) '                                     + #13 +
   '         AND ((H.MESCOBRANCA            >= ' + QuotedStr(sspAno) + ') AND (H.MESCOBRANCA <= ' + QuotedStr(sspAnoFim) + ')) '   + #13;

   if not(chkRubInfo.Checked) then sSQL := sSQL +
   '         AND ((SUBSTR(H.RUBRICAINSS, 2, 1) <> ''3'') AND (SUBSTR(H.RUBRICAINSS, 2, 1) <> ''9'')) '   + #13;

   sSQL := sSQL +
   '         AND (H.FLGMANUAL                = 4) '                                                + #13 +
   '         AND (H.NUMPROCINSS              = DETF3.NUMPROCINSS) '                                + #13;

   if sCodmantenedora <> '' then sSQL := sSQL +
   '         AND (NVL(H.CODMANTENEDORA, 14)  = ' + sCodmantenedora + ') '                          + #13;

   if chkReembolsoFundacao.Checked then sSQL := sSQL +
   '      AND (H.CODMANTENEDORA              IS NULL OR H.CODMANTENEDORA IN (6, 14, 99) ) '        + #13;

   sSQL := sSQL +
   '         AND (H.MESREFERENCIA            = DETF3.MESREFERENCIA) '                              + #13 +
   '         AND (H.SEQUENCIAL+1             = DETF3.SEQUENCIAL) '                                 + #13 +
   '      ) TOTAL '                                                                                + #13 +

   '   WHERE '                                                                                     + #13 +
   '          (D.NUMPROCINSS              = ' + QuotedStr(edNB.Text) + ') '                        + #13 +

   '      AND ((D.MESCOBRANCA            >= ' + QuotedStr(sspAno) + ') AND (D.MESCOBRANCA <= ' + QuotedStr(sspAnoFim) + ')) '   + #13 +

   '      AND (D.IDRUBRICA                = P.IDPROVENTO) '                                        + #13 +
   '      AND (D.IDPLANOPREVPREV          = PP.IDPLANOPREV(+)) '                                   + #13 +
   '      AND (D.IDPLANOPREV              = PL.IDPLANOPREV(+)) '                                   + #13;

   if not(chkRubInfo.Checked) then sSQL := sSQL +
   '      AND ((SUBSTR(D.RUBRICAINSS, 2, 1) <> ''3'') AND (SUBSTR(D.RUBRICAINSS,2,1) <> ''9'')) '  + #13;

   sSQL := sSQL +
   '      AND (D.FLGMANUAL                = 4 ) '                                                  + #13 +
   '      AND (D.NUMPROCINSS              = DTF3.NUMPROCINSS) '                                    + #13 +
   '      AND (D.MESREFERENCIA            = DTF3.MESREFERENCIA) '                                  + #13 +
   '      AND (D.SEQUENCIAL + 1           = DTF3.SEQUENCIAL) '                                     + #13;

   if sCodmantenedora <> '' then sSQL := sSQL +
   '      AND (NVL(D.CODMANTENEDORA, 14)  = ' + sCodmantenedora + ') '                             + #13;

   sSQL := sSQL +
   '      AND (D.CODMANTENEDORA           = M.CODMANTENEDORA(+)) '                                 + #13 +

   '   UNION ALL '                                                                                 + #13 +

   '   SELECT '                                                                                    + #13 +
   '      D.MESREFERENCIA, D.MESCOBRANCA, D.NUMPROCINSS, D.VALORINSS, D.MATRICULA, '               + #13 +
   '      DECODE(P.FLGDESCONTO, 1, ''(-)'', 0, ''(+)'', ''(*)'') AS SINAL, D.ESPECIE, '            + #13 +
   '      D.RUBRICAINSS,SUBSTR(P.DESCRICAO,1,30) AS DESCRRUBRICA, TOTAL.VALOR AS VALOR3, '         + #13 +
   '      0 AS VALOR4, D.IDPLANOPREV, PL.NOME AS ENTIDADECONTABIL , D.RMREAJ, D.APREAJ, '          + #13 +
   '      D.CODMANTENEDORA, NVL(M.NOME, ''FUNCEF'') AS NOMEMANTENEDORA, D.SEQUENCIAL, '            + #13 +
   '      D.CODCONCESSORINSS, D.CODMANTENEDORINSS, D.IDPLANOPREVPREV, PP.NOME AS NOMEPLANOPREV '   + #13 +
   '      ,D.CODSINONIMO,D.DTINICIOCRED, D.DTFIMCRED '                                             + #13 +//Renato Visoni SOL 123118 Kintana 612606
   '   FROM '                                                                                      + #13 +
   '      DETCONCINSS      D, '                                                                    + #13 +
   '      PROVDESC         P, '                                                                    + #13 +
   '      PLANPREVCONTABIL PL, '                                                                   + #13 +
   '      MANTENEDORA      M, '                                                                    + #13 +
   '      PLANPREV         PP, '                                                                   + #13 +

   '      ( '                                                                                      + #13 +
   '      SELECT '                                                                                 + #13 +
   '         SUM(DECODE(P.FLGDESCONTO, 0, VALORINSS, 1, -VALORINSS, 0)) AS VALOR '                 + #13 +
   '      FROM '                                                                                   + #13 +
   '         DETCONCINSS H, '                                                                      + #13 +
   '         PROVDESC    P '                                                                       + #13 +
   '      WHERE '                                                                                  + #13 +
   '             (H.NUMPROCINSS     = ' + QuotedStr(edNB.Text) + ') '                              + #13 +
   '         AND (H.IDRUBRICA       = P.IDPROVENTO) '                                              + #13 +
   '         AND ((H.MESCOBRANCA   >= ' + QuotedStr(sspAno) + ') AND (H.MESCOBRANCA <= ' + QuotedStr(sspAnoFim) + ')) '   + #13;

   if not(chkRubInfo.Checked) then sSQL := sSQL +
   '         AND ((SUBSTR(H.RUBRICAINSS, 2, 1) <> ''3'') AND (SUBSTR(H.RUBRICAINSS, 2, 1) <> ''9'')) '   + #13;

   sSQL := sSQL +
   '         AND (((H.FLGMANUAL = 1) OR (H.FLGMANUAL = 2)) AND ((H.CODMANTENEDORA IS NULL ) OR (H.CODMANTENEDORA = 14))) ' + #13 +
   '      ) TOTAL '                                                                                + #13 +

   '   WHERE '                                                                                     + #13 +
   '          (D.NUMPROCINSS     = ' + QuotedStr(edNB.Text) + ') '                                 + #13 +
   '      AND (D.IDRUBRICA       = P.IDPROVENTO) '                                                 + #13 +
   '      AND ((D.MESCOBRANCA   >= ' + QuotedStr(sspAno) + ') AND (D.MESCOBRANCA <= ' + QuotedStr(sspAnoFim) + ')) '   + #13;

   if not(chkRubInfo.Checked) then sSQL := sSQL +
   '      AND ((SUBSTR(D.RUBRICAINSS, 2, 1) <> ''3'') AND (SUBSTR(D.RUBRICAINSS,2,1) <> ''9'')) '  + #13;

   if chkReembolsoFundacao.Checked then sSQL := sSQL +
   '      AND (D.CODMANTENEDORA  IS NULL OR D.CODMANTENEDORA IN (6, 14, 99) ) '                    + #13;

   sSQL := sSQL +
   '      AND (D.IDPLANOPREVPREV = PP.IDPLANOPREV(+)) '                                            + #13 +
   '      AND (D.IDPLANOPREV     = PL.IDPLANOPREV(+)) '                                            + #13;

   // ----------------------------------------------------------------------------------------------
   if not(chkRubInfo.Checked) then sSQL := sSQL +
   '      AND ((D.FLGMANUAL = 1) OR (D.FLGMANUAL = 2)) '                                           + #13

   else sSQL := sSQL +
   '      AND ( '                                                                                  + #13 +
   '              ((D.FLGMANUAL = 1) OR (D.FLGMANUAL = 2)) '                                       + #13 +
   '          AND ((D.CODMANTENEDORA IS NULL ) OR (D.CODMANTENEDORA = 14)) '                       + #13 +
   '          ) '                                                                                  + #13;
   // ----------------------------------------------------------------------------------------------

   sSQL := sSQL +
   '      AND (D.CODMANTENEDORA = M.CODMANTENEDORA(+)) '                                           + #13 +
   '   ) '                                                                                         + #13;

   sSQLComPlano := sSQL +
   'ORDER BY '                                                                                     + #13 +
   '   MESCOBRANCA DESC';


   qryReembolso.Close;
   qryReembolso.SQL.Clear;
   qryReembolso.SQL.Text := sSQLComPlano;
   qryReembolso.SQL.SaveToFile(Sistema.TempDir + 'qryReembolso.txt');
   qryReembolso.Open;


   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------

   sSQLSemPlano :=
   'SELECT '                                                                              + #13 +
   '   MESREFERENCIA, MESCOBRANCA, NUMPROCINSS, SUM(VALORINSS) AS VALORINSS, MATRICULA, ' + #13 +
   '   SINAL, ESPECIE, RUBRICAINSS, DESCRRUBRICA, VALOR3, VALOR4, '                       + #13 +
   '   RMREAJ, APREAJ, CODMANTENEDORA, NOMEMANTENEDORA, '                                 + #13 +
   '   CODCONCESSORINSS, CODMANTENEDORINSS '                                              + #13 +
   '   ,CODSINONIMO,DTINICIOCRED, DTFIMCRED '                                             + #13 +//Renato Visoni SOL 123118 Kintana 612606
   'FROM '                                                                                + #13 +
   '( '                                                                                   + #13;

   sSQLSemPlano := sSQLSemPlano + sSQL;

   sSQLSemPlano := sSQLSemPlano +
   ') '                                                                                   + #13 +
   'GROUP BY '                                                                            + #13 +      
   '   MESREFERENCIA, MESCOBRANCA, NUMPROCINSS, VALORINSS, MATRICULA, '                   + #13 +
   '   SINAL, ESPECIE, RUBRICAINSS, DESCRRUBRICA, VALOR3, VALOR4, '                       + #13 +
   '   RMREAJ, APREAJ, CODMANTENEDORA, NOMEMANTENEDORA, '                                 + #13 +
   '   CODCONCESSORINSS, CODMANTENEDORINSS '                                              + #13 +
   '   ,CODSINONIMO,DTINICIOCRED, DTFIMCRED '                                             + #13 +//Renato Visoni SOL 123118 Kintana 612606

   'ORDER BY '                                                                            + #13 +
   '   MESCOBRANCA DESC';


   qrySemPlano.Close;
   qrySemPlano.SQL.Clear;
   qrySemPlano.SQL.Text := sSQLSemPlano;
   qrySemPlano.SQL.SaveToFile(Sistema.TempDir + 'qryReembolsoSemPlano.txt');
   qrySemPlano.Open;

   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------


   sSQL :=
   'SELECT '                                                                                       + #13 +
   '   SUM(DECODE(P.FLGDESCONTO, 0, VALORINSS, 1, -VALORINSS, 0)) AS VALOR '                       + #13 +
   'FROM '                                                                                         + #13 +
   '   DETCONCINSS H, '                                                                            + #13 +
   '   PROVDESC    P '                                                                             + #13 +
   'WHERE '                                                                                        + #13 +
   '       (H.NUMPROCINSS                 = ' + QuotedStr(edNB.Text) + ') '                        + #13 +
   '   AND ((H.MESCOBRANCA               >= ' + QuotedStr(sspAno) + ') AND (H.MESCOBRANCA <= ' + QuotedStr(sspAnoFim) + ')) ' + #13 +
   '   AND ((SUBSTR(H.RUBRICAINSS, 2, 1) <> ''3'') AND (SUBSTR(H.RUBRICAINSS, 2, 1) <> ''9'')) '   + #13 +
   '   AND (SUBSTR(H.RUBRICAINSS, 1, 1)  <> ''9'') '                                               + #13 +
   '   AND (H.IDRUBRICA                   = P.IDPROVENTO) '                                        + #13 +
   '   AND (H.FLGMANUAL                  <> 4 ) '                                                  + #13 +
   '   AND (H.FLGMANUAL                  <> 1) '                                                   + #13 +
   '   AND (H.FLGMANUAL                  <> 2) '                                                   + #13;

   if chkReembolsoFundacao.Checked then sSQL := sSQL +
   '   AND (H.CODMANTENEDORA  IS NULL OR H.CODMANTENEDORA IN (6, 14, 99) ) '                       + #13;

   sSQL := sSQL +
   'UNION ALL '                                                                                    + #13 +

   'SELECT '                                                                                       + #13 +
   '   SUM(DECODE(P.FLGDESCONTO, 0, VLRRUBRICA1, 1, -VLRRUBRICA1, 0)) AS VALOR '                   + #13 +
   'FROM '                                                                                         + #13 +
   '   TEMPCONCINSS  H, '                                                                          + #13 +
   '   PROVDESC      P, '                                                                          + #13 +
   '   RUBRICAXINSS  R '                                                                           + #13 +
   'WHERE '                                                                                        + #13 +
   '       (H.NUMPROCINSS                 = ' + QuotedStr(edNB.Text) + ') '                        + #13 +
   '   AND ((H.MESPROCESSAMENTO          >= ' + QuotedStr(sspAno) + ') AND (H.MESPROCESSAMENTO <= ' + QuotedStr(sspAnoFim) + ')) '  + #13 +
   '   AND ((SUBSTR(H.CODRUBRICA1, 2, 1) <> ''3'') AND (SUBSTR(H.CODRUBRICA1, 2, 1) <> ''9'')) '   + #13 +
   '   AND (SUBSTR(H.CODRUBRICA1, 1, 1)  <> ''9'') '                                               + #13 +
   '   AND (H.CODRUBRICA1                 = R.RUBRICAINSS(+) ) '                                   + #13 +
   '   AND (R.IDRUBRICA                   = P.IDPROVENTO(+)) '                                     + #13 +

   'UNION ALL '                                                                                    + #13 +

   'SELECT '                                                                                       + #13 +
   '   SUM(DECODE(P.FLGDESCONTO, 0, VALORINSS, 1, -VALORINSS, 0)) AS VALOR '                       + #13 +
   'FROM '                                                                                         + #13 +
   '   DETCONCINSS H, '                                                                            + #13 +
   '   PROVDESC    P, '                                                                            + #13 +

   '   ( '                                                                                         + #13 +
   '   SELECT '                                                                                    + #13 +
   '      DD.NUMPROCINSS, DD.CODMANTENEDORA, DD.MESREFERENCIA, DD.SEQUENCIAL '                     + #13 +
   '   FROM '                                                                                      + #13 +
   '      DETCONCINSS DD '                                                                         + #13 +
   '   WHERE '                                                                                     + #13 +
   '          (DD.NUMPROCINSS                 = ' + QuotedStr(edNB.Text) + ') '                    + #13 +
   '      AND ((DD.MESCOBRANCA               >= ' + QuotedStr(sspAno) + ') AND (DD.MESCOBRANCA <= ' + QuotedStr(sspAnoFim) + ')) '  + #13 +
   '      AND ((SUBSTR(DD.RUBRICAINSS, 2, 1) <> ''3'')  AND (SUBSTR(DD.RUBRICAINSS, 2, 1) <> ''9'')) '   + #13 +
   '      AND (SUBSTR(DD.RUBRICAINSS, 1, 1)  <> ''9'') '                                           + #13 +
   '      AND (DD.FLGMANUAL                   = 3) '                                               + #13 +
   '   ) DETF3 '                                                                                   + #13 +

   'WHERE '                                                                                        + #13 +
   '       (H.NUMPROCINSS                 = ' + QuotedStr(edNB.Text) + ') '                        + #13 +
   '   AND ((H.MESCOBRANCA               >= ' + QuotedStr(sspAno) + ') AND (H.MESCOBRANCA <= ' + QuotedStr(sspAnoFim) + ')) ' + #13 +
   '   AND (H.IDRUBRICA                   = P.IDPROVENTO) '                                        + #13 +
   '   AND ((SUBSTR(H.RUBRICAINSS, 2, 1) <> ''3'') AND (SUBSTR(H.RUBRICAINSS, 2, 1) <> ''9'')) '   + #13 +
   '   AND (SUBSTR(H.RUBRICAINSS, 1, 1)  <> ''9'') '                                               + #13 +
   '   AND (H.FLGMANUAL                   = 4) '                                                   + #13 +
   '   AND (H.NUMPROCINSS                 = DETF3.NUMPROCINSS) '                                   + #13;

   if sCodmantenedora <> '' then sSQL := sSQL +
   '   AND (NVL(H.CODMANTENEDORA, 14)     = ' + sCodmantenedora + ') '                             + #13;

   sSQL := sSQL +
   '   AND (H.MESREFERENCIA               = DETF3.MESREFERENCIA) '                                 + #13 +
   '   AND (H.SEQUENCIAL + 1              = DETF3.SEQUENCIAL) '                                    + #13;

   if chkReembolsoFundacao.Checked then sSQL := sSQL +
   '   AND (H.CODMANTENEDORA  IS NULL OR H.CODMANTENEDORA IN (6, 14, 99) ) '                       + #13;

   sSQL := sSQL +
   'UNION ALL '                                                                                    + #13 +

   'SELECT '                                                                                       + #13 +
   '   SUM(DECODE(P.FLGDESCONTO, 0, VALORINSS, 1, -VALORINSS, 0)) AS VALOR '                       + #13 +
   'FROM '                                                                                         + #13 +
   '   DETCONCINSS H, '                                                                            + #13 +
   '   PROVDESC    P '                                                                             + #13 +
   'WHERE '                                                                                        + #13 +
   '       (H.NUMPROCINSS                 = ' + QuotedStr(edNB.Text) + ') '                        + #13 +
   '   AND ((H.MESCOBRANCA               >= ' + QuotedStr(sspAno) + ') AND (H.MESCOBRANCA <= ' + QuotedStr(sspAnoFim) + ')) ' + #13 +
   '   AND (H.IDRUBRICA                   = P.IDPROVENTO) '                                        + #13 +
   '   AND ((SUBSTR(H.RUBRICAINSS, 2, 1) <> ''3'') AND (SUBSTR(H.RUBRICAINSS, 2, 1) <> ''9'')) '   + #13 +
   '   AND (SUBSTR(H.RUBRICAINSS, 1, 1)  <> ''9'') '                                               + #13;

   if chkReembolsoFundacao.Checked then sSQL := sSQL +
   '   AND (H.CODMANTENEDORA  IS NULL OR H.CODMANTENEDORA IN (6, 14, 99) ) '                       + #13;

   sSQL := sSQL +
   '   AND ((H.FLGMANUAL                  = 1) OR (H.FLGMANUAL = 2)) '                             + #13;

   qryTotReembolso.Close;
   qryTotReembolso.SQL.Clear;
   qryTotReembolso.SQL.Text := sSQL;
   qryTotReembolso.SQL.SaveToFile(Sistema.TempDir + 'qryTotReembolso.txt');
   qryTotReembolso.Open;


   dedReembolso := 0;
   while not(qryTotReembolso.EOF) do
   begin
      dedReembolso := dedReembolso + qryTotReembolsoVALOR.AsCurrency;
      qryTotReembolso.Next;
   end;

   AtualizaRubFolha(iPessoa);

   DBgrdSemPlano.Visible := not(chkExibePlano.Checked);
   DBgrdComPlano.Visible := chkExibePlano.Checked;
end;



procedure TfrmExtratoINSS.DBgrdComPlanoCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  if (copy(qryReembolso.FieldByName('RUBRICAINSS').AsString,2,1) = '3') or
     (copy(qryReembolso.FieldByName('RUBRICAINSS').AsString,2,1) = '9') then
     ABrush.Color := clInfoBk;
end;

procedure TfrmExtratoINSS.dblkMatriculaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;

  if not qryMatricula.eof then
  begin
     AtualizaRubFolha(qryMatricula.FieldByName('IDPESSOA').asInteger);

     edNome.Text := qryMatricula.FieldByName('NOME').AsString;
  end;

end;

procedure TfrmExtratoINSS.FormShow(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;
end;

procedure TfrmExtratoINSS.spAnoChange(Sender: TObject);
begin
  inherited;

  sspAno := InttoStr(spAno.Value);
  if (spAno.Value < 1000) then                  
     exit;
  if spMes.Value < 10 then
    sspMes := '0' + InttoStr(spMes.Value)
  else if spMes.Value < 13 then
         sspMes := InttoStr(spMes.Value)
       else begin
         MsgDlg('Mês deve ser no máximo 12','Erro',mtError,[mbOk],0);
         spMes.Value := 12;
         spMes.SetFocus;
         exit;
       end;



  sspAno := sspAno + '/' + sspMes;

  sspAnoFim := InttoStr(spAnoFim.Value);                    
  if (spAnoFim.Value < 1000) then                             
     exit;
  if spMesFim.Value < 10 then
    sspMesFim := '0' + InttoStr(spMesFim.Value)
  else if spMesFim.Value < 13 then
         sspMesFim := InttoStr(spMesFim.Value)
       else begin
         MsgDlg('Mês deve ser no máximo 12','Erro',mtError,[mbOk],0);
         spMesFim.Value := 12;
         spMesFim.SetFocus;
         exit;
       end;
  sspAnoFim := sspAnoFim + '/' + sspMesFim;


  if sspAno < '1997/05' then begin
    MsgDlg('Periodo mínimo de pesquisa se inicia em "1997/05"','Erro',mtError,[mbOk],0);
    spAno.Value := 1997;
    spMes.Value := 05;
  End;

  if sspAnoFim < sspAno then begin
    MsgDlg('Periodo máximo de pesquisa deve ser maior que o mínimo','Erro',mtError,[mbOk],0);
    spAnoFim.Value := spAno.Value;
    spMesFim.Value := spMes.Value;
  End;

  if CbxNBs.Text = '' then Exit;

  if ChBxAutoPesquisa.Checked = True then begin
    chkRubInfoClick(Self);
    AtualizaRubFolha(iPessoa);
  End;
end;



procedure  TfrmExtratoINSS.AtualizaRubFolha(iidpessoa : Integer);
begin
  qryFolhaFuncef.Close;
  qryFolhaFuncef.ParamByName('idpessjur').AsInteger := Sistema.IdEmpresa;
  qryFolhaFuncef.ParamByName('idpessoa').AsInteger  := iidpessoa;
  qryFolhaFuncef.ParamByName('numprocinss').AsString := edNB.Text;
  qryFolhaFuncef.ParamByName('mescob').AsString     := sspAno;
  qryFolhaFuncef.ParamByName('MESCOBFIM').AsString  := sspAnoFim;

  // Renato Visoni SOL122873 Kintana 615216
  if chkInibirPA.Checked then begin
    qryFolhaFuncef.ParamByName('pConsideraPA').AsInteger  := 1;
  end else begin
    qryFolhaFuncef.ParamByName('pConsideraPA').AsInteger  := 2;
  end;
  // Renato Visoni SOL122873 Kintana 615216

  qryFolhaFuncef.Open;

  // -----------------------------------------------------------------------------------------------

  qryGlosaExtrato.Close;
  qryGlosaExtrato.ParamByName('numproc').AsString   := edNB.text;
  qryGlosaExtrato.ParamByName('mescob').AsString    := sspAno;         
  qryGlosaExtrato.ParamByName('MESCOBFIM').AsString := sspAnoFim;   

   qryGlosaExtrato.ParamByName('PMANTENEDORAFUND').AsInteger  := Ord(chkReembolsoFundacao.Checked);

  qryGlosaExtrato.Open;
  
  if qryGlosaExtrato.EOF then
    medReembolso.Text := FormatFloat('#,##0.00',dedReembolso)
  else
    medReembolso.Text := FormatFloat('#,##0.00',(dedReembolso +
                                      qryGlosaExtrato.FieldByName('VLRGLOSA').AsFloat));

  // -----------------------------------------------------------------------------------------------

  medDiferenca.Text := FormatFloat('#,##0.00',((dedReembolso +
                                                qryGlosaExtrato.FieldByName('VLRGLOSA').AsFloat) -
                                                qryFolhaFuncef.FieldByName('VALOR').AsFloat));


  if (dedReembolso + qryGlosaExtrato.FieldByName('VLRGLOSA').AsFloat -
      qryFolhaFuncef.FieldByName('VALOR').AsFloat) < 0 then
     medDiferenca.Color := clRed
  else
     medDiferenca.Color := clInfoBk;
end;



procedure TfrmExtratoINSS.FormCreate(Sender: TObject);
Var
  Year,Month,Day : Word;
begin
  inherited;
  sspAno := InttoStr(spAno.Value);
  if spMes.Value < 10 then
    sspMes := '0' + InttoStr(spMes.Value)
  else
    sspMes := InttoStr(spMes.Value);
  sspAno := sspAno + '/' + sspMes;

  DecodeDate(Date,Year,Month,Day);                           
  spAnoFim.Value := Year;
  spMesFim.Value := Month;
  sspAnoFim := InttoStr(spAnoFim.Value);
  if spMesFim.Value < 10 then
    sspMesFim := '0' + InttoStr(spMesFim.Value)
  else
    sspMesFim := InttoStr(spMesFim.Value);
  sspAnoFim := sspAnoFim + '/' + sspMesFim;

  try
    Application.CreateForm(TdtmRelatBeneficios, dtmRelatBeneficios);
  except
    MessageDlg(
      'Erro ao criar datamodule "TdtmRelatBeneficios".'+#13+#10+
      'Favor contatar o suporte da CM.', mtError, [mbOK], 0);
  end;
end;

procedure TfrmExtratoINSS.CbxNBsExit(Sender: TObject);
begin
  inherited;
  edMatricula.SendtoBack;

  if (BtPesqPorMatricula.Focused = True) or (bbtnSair.Focused = True)
  then
    Exit;

  if CbxNBs.Text = '' then exit;
  edNB.Text := CbxNBs.Text;

  qryBeneficiario.Close;

  qryBeneficiario.ParamByName('numproc').AsString  := CbxNBs.text;
  qryBeneficiario.Open;

  if qryBeneficiario.EOF then begin
    qryAux.SQL.text := 'SELECT B.IDPESSOA, B.IDPLANOPREV, B.IDPLANPREVCONTAB, B.DATAINICIO, ' +
                       '       D.MATRICULA, PL.NOME, BN.NOME AS NOMEBENEF, P.NOME AS NOMEPESSOA, ' +
                       '       BN.CODBENEFICIO AS ESPECIE, '+ 
                       '       PP.NOME AS NOMEPLANOPREV '+
                       'FROM BENEFBFCIARIO B, DEPENTIT D, BENEFPLANPREV BP,BENEFICIO BN,  '+
                       '     PESSOA P, PLANPREVCONTABIL PL, '+
                       '     PLANPREV PP '+
                       'WHERE B.NUMPROCINSS = ' + QuotedStr(CbxNBs.text) + ' AND '+
                       '      B.IDTITULAR = D.IDTITULAR(+) AND ' +
                       '      B.IDPESSOA  = D.IDPESSOA(+) AND ' +
                       '      B.IDPESSOA  = P.IDPESSOA(+) AND ' +
                       '      B.IDPLANOPREV = PP.IDPLANOPREV(+) AND ' +
                       '      B.IDPLANOPREV = BP.IDPLANOPREV(+) AND ' +
                       '      B.IDBENEFICIO = BP.IDBENEFICIO(+) AND ' +
                       '      BP.FLGREFERENCIA = 1 AND ' +
                       '      B.IDBENEFICIO = BN.IDBENEFICIO AND ' +
                       '      B.IDPLANPREVCONTAB = PL.IDPLANOPREV(+) ' ;
    qryAux.Open;
    if not qryAux.EOF then begin
       iPessoa            := qryAux.FieldByName('IDPESSOA').AsInteger;
       iPlanoContab       := qryAux.FieldByName('IDPLANPREVCONTAB').AsInteger;
       edMantenedora.Text := 'FUNCEF';
       sCodmantenedora    :=  '99';
       edNome.Text        := qryAux.FieldByName('NOMEPESSOA').AsString;
       edDIB.Text         := qryAux.FieldByName('DATAINICIO').AsString;
       edEntidade.Text    := qryAux.FieldByName('NOME').AsString;
       edBeneficio.Text   := qryAux.FieldByName('NOMEBENEF').AsString;
       edEspecie.Text     := qryAux.FieldByName('ESPECIE').AsString;
       EdNomePlanoPrev.Text := qryAux.FieldByName('NOMEPLANOPREV').AsString;

       qryMatricula.Close;
       qryMatricula.ParamByName('numproc').AsString  := CbxNBs.text;
       qryMatricula.Open;
       if not qryMatricula.EOF then begin
          dblkMatricula.LookupValue := qryMatricula.FieldByName('MATRICULA').AsString;
       end;
    end
    else begin
       ShowMessage('NB não encontrado');
       exit;
    end;
  end
  else begin
    iPessoa            := qryBeneficiario.FieldByName('IDPESSOA').AsInteger;
    iPlanoContab       := qryBeneficiario.FieldByName('IDPLANOPREV').AsInteger;
    edEntidade.Text    := qryBeneficiario.FieldByName('PLANOCONTABIL').AsString;
    edBeneficio.Text   := qryBeneficiario.FieldByName('NOMEBENEFICIO').AsString;
    edEspecie.Text     := qryBeneficiario.FieldByName('ESPECIE').AsString;
    EdNomePlanoPrev.Text := qryBeneficiario.FieldByName('NOMEPLANOPREV').AsString;

    qryDIB.Close;
    qryDIB.ParamByName('numproc').AsString  := CbxNBs.text;
    qryDIB.Open;
    if not qryDIB.EOF then
       edDIB.Text  := qryDIB.FieldByName('DIB').AsString;

    qryMantenedora.Close;
    qryMantenedora.ParamByName('numproc').AsString  := CbxNBs.text;
    qryMantenedora.Open;
    if not qryMantenedora.EOF then begin
       edMantenedora.Text := qryMantenedora.FieldByName('NOMEMANTENEDORA').AsString;
       sCodmantenedora    :=  qryMantenedora.FieldByName('CODMANTENEDORA').AsString;
    end;
    qryMatricula.Close;
    qryMatricula.ParamByName('numproc').AsString  := CbxNBs.text;
    qryMatricula.Open;
    if not qryMatricula.EOF then begin
       dblkMatricula.LookupValue := qryMatricula.FieldByName('MATRICULA').AsString;
       edNome.Text := qryMatricula.FieldByName('NOME').AsString;
    end
    else begin
       qryBeneficiario.First;
       edNome.Text :=   qryBeneficiario.FieldByName('NOME').AsString;
       while (not qryBeneficiario.EOF) and (dblkMatricula.LookupValue = '') do begin
         if qryBeneficiario.FieldByName('MATRICULA').AsString <> '' then
           dblkMatricula.LookupValue := qryBeneficiario.FieldByName('MATRICULA').AsString;
         qryBeneficiario.Next;
       end;
    end;

    qryBeneficiario.First;
  end;

  spAnoChange(Self);
  chkRubInfoClick(Self);

  AtualizaRubFolha(iPessoa);
end;

procedure TfrmExtratoINSS.CbxNBsCloseUp(Sender: TwwDBComboBox;
  Select: Boolean);
begin
  inherited;
  CbxNBsExit(Self);
end;

procedure TfrmExtratoINSS.CbxNBsKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  CbxNbs.Items.Clear;
end;

procedure TfrmExtratoINSS.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dtmRelatBeneficios.Free; 
end;



procedure TfrmExtratoINSS.edMatriculaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;

  //Renato Visoni SOL79604 Kintana 534926
  if (key = #13) and (edMatricula.text<>'') then edMatricula.OnExit(Sender);
  //Fim

end;

end.