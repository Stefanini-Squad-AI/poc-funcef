unit FCadProcHabINSS;

// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//------------------------------------------------------------------------------
//Nº SIG.....: 23661
//Data       : 14/07/2016
//Responsável: Andre Imakawa
//Descrição..: Ao efetuarmos a concessão de benefício com a marcação de correção
//             monetária o sistema esta corrigindo os valores de benefícios e das
//             taxas administrativas, porém o Benefício Único Antecipado não é
//             corrigido.
//-------------------------------------------------------------------------------
//Autor(a)   : Fernando Xavier
//Data       : 23/02/2016
//Pendência  : SOL 269509 PPM 1298527
//Descricao  : Erro na gravação das informações cadastradas na funcionalidade
//             CADASTRO DE PROCESSOS INSS, módulo Benefício Prev
//------------------------------------------------------------------------------

//Autor(a)   : Douglas Siqueira
//Data       : 16/02/2016
//Pendência  : SOL 269218 PPM 1288265
//Descricao  : Erro na gravação das informações cadastradas na funcionalidade
//CADASTRO DE PROCESSOS INSS, módulo Benefício Prev
//------------------------------------------------------------------------------
//Autor(a)   : William Santana
//Data       : 12/05/2015
//Pendência  : SOL 251599.17194 PPM 783173
//DFM        : Criação de novos campos
//Descricao  : Alteração para requer / conceder benefício para mais de um
//             pensionista de um nucleo familiar
//------------------------------------------------------------------------------
//Autor(a)   : William Santana
//Data       : 30/03/2015
//Pendência  : SOL 218687.17129 PPM 757901
//DFM        : Criação de novos campos
//Descricao  : Ajustar funcionalidades de requerimento e concessão de benefícios
//------------------------------------------------------------------------------
//Autor(a)   : Edilaine Ferraresi
//Data       : 20/05/2015
//Pendência  : SOL 251333 PPM 799413
//Rotina     : bbtnSelSeguradoClick
//Descricao  : sistema permite cadastrar o mesmo numero de benefícios INSS (NB)
//             para mais de uma pessoa
//------------------------------------------------------------------------------
//Autor(a)   : William Moreira da Silva
//Data       : 31/03/2015
//Pendência  : SOL 251255 KTN 2019369
//DFM        : Apenas alteração no DFM
//Descricao  : O campo beneficio identificado para requerimento não aparecia
//------------------------------------------------------------------------------
//Autor(a)   : Higor Nayde / William Santana
//Data       : 09/01/2015
//Pendência  : SOL 208130 KIN 2019369
//DFM        : Criação dos campos "Tempo de Serviço INSS" ,"% INSS", "Índice Reajuste Teto".
//Descricao  : Validação do preenchimento dos campos
//------------------------------------------------------------------------------
//Autor(a)   : Fernando Xavier
//Data       : 19/03/2014
//Pendência  : SOL 227329 KTN 2061946
//DFM        : Alteração no DFM inclusão do campo IDPESSOA no update
//Descricao  : Ajuste da rotina de habilitação
//------------------------------------------------------------------------------
//Autor(a)   : FELIPE AZEVEDO DOS SANTOS
//Data       : 13/05/2013
//Pendência  : SOL 203790 KTN 1969208
//Descricao  : Validação data dos campo DER, DIB e DIP não devem ser maior que
//             a data atual.
//------------------------------------------------------------------------------
//Autor(a)   : FELIPE AZEVEDO DOS SANTOS
//Data       : 13/11/2012
//Pendência  : SOL 179506 KTN 1705120
//Descricao  : INSERIR CAMPO NUP PARA CADASTRO
//------------------------------------------------------------------------------
//Autor(a)   : Vinicius Ferreira
//Data       : 02/10/2011
//Pendência  : SOL 154494 KINTANA 1188399
//Descricao  : Criar uma nova funcionalidade que permita efetuar o registro
//              de informações da habilitação dos benefícios do INSS para posterior
//              requerimento e/ou concessão em lote.
//------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, Db, DBTables, Wwquery, CmEventosCadastro, ImgList,
  MontaSelect, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr,
  StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, DBCtrls, Mask, wwdbdatetimepicker,
  CMDateTimePicker, dBaseDados, uMensErro, wwdblook, UAdmprev, UDataBase,
  ppDB, ppDBPipe, ppParameter, ppBands, jpeg, ppCtrls, ppPrnabl, ppClass,
  ppCache, ppComm, ppRelatv, ppProd, ppReport, ppVar, ShellApi, ppModule,
  raCodMod, DBClient, wwclient, Provider;

type
  TfrmCadProcHabINSS = class(TfrmCadMestreDetalheCS)
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    cmdtpDtAlt: TCMDateTimePicker;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    MSseg: TMontaSelect;
    DsSelSegurado: TwwDataSource;
    qrySelSegurado: TwwQuery;
    qryLookEstado: TwwQuery;
    dsLookEstado: TwwDataSource;
    qryLookBenef: TwwQuery;
    dsLookBenef: TwwDataSource;
    dsLookStiHabBf: TwwDataSource;
    qryLookStiHabBf: TwwQuery;
    dblkpcmbNovaSitHabBfINSS: TwwDBLookupCombo;
    qryAux: TwwQuery;
    bbtnGeraRelatorio: TButton;
    dbeObservacoes: TDBMemo;
    Panel3: TPanel;
    Label8: TLabel;
    dbeBenefIdentReq: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    cmdtpDIB: TCMDateTimePicker;
    cmdtpDIP: TCMDateTimePicker;
    cmdtpDER: TCMDateTimePicker;
    dblkpcmbBenef: TwwDBLookupCombo;
    dbeNumBDRP: TDBEdit;
    dbeNumBenef: TDBEdit;
    Panel2: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    dbeCPFSegurado: TDBEdit;
    dbeNmTitular: TDBEdit;
    dbeDtNascSegurado: TDBEdit;
    dbeMatTitSegurado: TDBEdit;
    dbeMatBenefSegurado: TDBEdit;
    dbePlanContSegurado: TDBEdit;
    bbtnSelSegurado: TButton;
    qryDetIDBENEFHABILITA: TFloatField;
    qryDetIDHISTBENEFHABILITA: TFloatField;
    qryDetDATAREGISTRO: TDateTimeField;
    qryDetIDSITHABILITACAO: TFloatField;
    qryDetTRGDTINCLUSAO: TDateTimeField;
    qryDetTRGUSERINCLUSAO: TStringField;
    qryDetTRGDTALTERACAO: TDateTimeField;
    qryDetTRGUSERALTERACAO: TStringField;
    qryDetIDSITHABILITACAO_1: TFloatField;
    qryDetDESCRICAO: TStringField;
    qryDetFLGHABILITACAOINSS: TFloatField;
    qryDetTRGDTINCLUSAO_1: TDateTimeField;
    qryDetTRGUSERINCLUSAO_1: TStringField;
    qryDetTRGDTALTERACAO_1: TDateTimeField;
    qryDetTRGUSERALTERACAO_1: TStringField;
    qryDetOBSERVACAO: TMemoField;
    ppdbpSegurado: TppDBPipeline;
    ppdbpBeneficio: TppDBPipeline;
    ppdbpHistmov: TppDBPipeline;
    pprRelHabINSS: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel26: TppLabel;
    ppImage1: TppImage;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel42: TppLabel;
    ppDBText26: TppDBText;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppLabel48: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLabel49: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppParameterList1: TppParameterList;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    pplbBenefIdeReq: TppLabel;
    pplbBeneficio: TppLabel;
    dblkpcmbEstado: TwwDBLookupCombo;
    ppSystemVariable1: TppSystemVariable;
    ppLabel4: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppLabel5: TppLabel;
    MontaSelectBenef: TMontaSelect;
    pplbPlanoContabil: TppLabel;
    wwClientDataSet1: TwwClientDataSet;
    dspDet: TDataSetProvider;
    cdsDet: TClientDataSet;
    cdsDetDATAREGISTRO: TDateTimeField;
    cdsDetDESCRICAO: TStringField;
    cdsDetOBSERVACAO: TMemoField;
    cdsDetIDBENEFHABILITA: TFloatField;
    cdsDetIDHISTBENEFHABILITA: TFloatField;
    cdsDetIDSITHABILITACAO: TFloatField;
    cdsDetTRGDTINCLUSAO: TDateTimeField;
    cdsDetTRGUSERINCLUSAO: TStringField;
    cdsDetTRGDTALTERACAO: TDateTimeField;
    cdsDetTRGUSERALTERACAO: TStringField;
    cdsDetIDSITHABILITACAO_1: TFloatField;
    cdsDetFLGHABILITACAOINSS: TFloatField;
    cdsDetTRGDTINCLUSAO_1: TDateTimeField;
    cdsDetTRGUSERINCLUSAO_1: TStringField;
    cdsDetTRGDTALTERACAO_1: TDateTimeField;
    cdsDetTRGUSERALTERACAO_1: TStringField;
    dsDet_Grid: TwwDataSource;
    dsDet2: TwwDataSource;
    Panel1: TPanel;
    qryIDPESSOA: TFloatField;
    qryIDTITULAR: TFloatField;
    qryNOME: TStringField;
    qryNUMDOCUMENTO: TStringField;
    qryDATANASC: TDateTimeField;
    qryMATRICULADEP: TStringField;
    qryMATRICULATITULAR: TStringField;
    qryIDPLANOPREV: TFloatField;
    qryIDPLANPREVCONTAB: TFloatField;
    qryIDBENEFHABILITA: TFloatField;
    qryNUMBENEFICIO: TStringField;
    qryDATAREQUERIMENTO: TDateTimeField;
    qryDIB: TDateTimeField;
    qryDIP: TDateTimeField;
    qryESTADO: TStringField;
    qryIDBENEFICIO: TFloatField;
    qryNUMBRDP: TStringField;
    qryFLGREQUERIMENTO: TFloatField;
    qryFLGCONCESSAO: TFloatField;
    qryNUP: TStringField;
    Label18: TLabel;
    dbNup: TDBEdit;
    edtTempoAno: TDBEdit;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    edtTempoMes: TDBEdit;
    edtTempoDia: TDBEdit;
    Label22: TLabel;
    edtINSS: TDBEdit;
    Label23: TLabel;
    edtIndiceReajuste: TDBEdit;
    Label24: TLabel;
    qryTEMPOSERVICOANOS: TFloatField;
    qryTEMPOSERVICOMES: TFloatField;
    qryTEMPOSERVICODIAS: TFloatField;
    qryPERCENTUALINSS: TFloatField;
    qryINDICEREAJUSTETETO: TFloatField;
    lblDec: TLabel;
    tmpDEC: TCMDateTimePicker;
    lblBenefFora: TLabel;
    lbllei142: TLabel;
    dbeRMI: TDBEdit;
    lblRMI: TLabel;
    pnlEscondeBorda1: TPanel;
    dbrgBenefFora: TDBRadioGroup;
    pnlEscondeBorda2: TPanel;
    dbrgLei142: TDBRadioGroup;
    lblMatr: TLabel;
    lblNome: TLabel;
    dbeNomeSegurado: TDBEdit;
    qryRMI: TFloatField;
    qryDEC: TDateTimeField;
    qryFLGPAGAINSS: TFloatField;
    qryBENEFLEI142: TFloatField;
    lblSentencaJud: TLabel;
    lblDtFinal: TLabel;
    lblObs: TLabel;
    tmpDATAFINAL: TCMDateTimePicker;
    pnlEscondeBorda3: TPanel;
    dbrgSentencaJud: TDBRadioGroup;
    dbmObs: TDBMemo;
    qryFLGSENTENCAJUDICIAL: TFloatField;
    qryDATAFINAL: TDateTimeField;
    qryOBSSENTENCAJUDICIAL: TMemoField;
    procedure bbtnSelSeguradoClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure dbeNumBenefExit(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmeDetalheAtualizaBotoes(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeDetalheDelete(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure dbgrdDetCellChanged(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnGeraRelatorioClick(Sender: TObject);
    procedure ppDetailBand2BeforePrint(Sender: TObject);
    procedure qryDetAfterScroll(DataSet: TDataSet);
    procedure dblkpcmbEstadoNotInList(Sender: TObject;
      LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
    procedure dblkpcmbNovaSitHabBfINSSNotInList(Sender: TObject;
      LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
    procedure dblkpcmbBenefNotInList(Sender: TObject;
      LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
    procedure FormShow(Sender: TObject);
    procedure dblkpcmbBenefExit(Sender: TObject);
    procedure MSsegBeforeOpenCds(var sqlText: String;
      strListParams: TStringList);
    procedure MontaSelectBenefBeforeOpenCds(var sqlText: String;
      strListParams: TStringList);
    procedure dbeNumBDRPKeyPress(Sender: TObject; var Key: Char);
    procedure dbeNumBenefKeyPress(Sender: TObject; var Key: Char);
    procedure cdsDetAfterScroll(DataSet: TDataSet);
    procedure edtTempoAnoKeyPress(Sender: TObject; var Key: Char);
    procedure edtTempoMesKeyPress(Sender: TObject; var Key: Char);
    procedure edtTempoDiaKeyPress(Sender: TObject; var Key: Char);
    procedure edtINSSKeyPress(Sender: TObject; var Key: Char);
    procedure edtIndiceReajusteKeyPress(Sender: TObject; var Key: Char);
    procedure edtINSSExit(Sender: TObject);
    procedure dbrgSentencaJudChange(Sender: TObject);

  private
    { Private declarations }
    FlgIncluir, FlgExcluir, FlgEditar          : Boolean;
    FlgIncluirDet, FlgExcluirDet, FlgEditarDet : Boolean;
    sSQL, seqIDBENEFHABILITA                   : string;
    sIdPessoa, sIdPessoaTitular, vNumBenef: String; //BRUNO AZEVEDO
    DtMaior : TDateTime;
  public
    { Public declarations }
  end;

var
  frmCadProcHabINSS: TfrmCadProcHabINSS;

implementation

{$R *.DFM}
 uses  usistema;



procedure TfrmCadProcHabINSS.bbtnSelSeguradoClick(Sender: TObject);
begin
  //inherited;

   {qrySelSegurado.Close;
    qryDet.Close;
    qry.Close;}

   MSseg.Executar;

  if MSseg.RetornouValor then begin

    //PEGAR IDPESSOA
    {If ((MSseg.ValoresChave[0]) = (MSseg.ValoresChave[1])) or (MSseg.ValoresChave[1] = '')   then
    sIdPessoa := MSseg.ValoresChave[0]
    else
    sIdPessoa := MSseg.ValoresChave[1];}

    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add(' SELECT                          ');
    qryAux.Sql.Add(' DISTINCT                        ');
    qryAux.Sql.Add('   DT.MATRICULA,                 ');
    qryAux.Sql.Add('   D.MATRICULA,                  ');
    qryAux.Sql.Add('   P.NOME,                       ');
    qryAux.Sql.Add('   P.NUMDOCUMENTO,               ');
    qryAux.Sql.Add('   P.IDPESSOA,                   ');
    qryAux.Sql.Add('   DT.IDPESSOA as IDPESSOATITULAR ');
    qryAux.Sql.Add(' FROM                            ');
    qryAux.Sql.Add('   PESSOA P,                     ');
    qryAux.Sql.Add('   PESSOAFISICA PF,              ');
    qryAux.Sql.Add('   DEPENTIT D,                   ');
    qryAux.Sql.Add('   DEPENTIT DT,                  ');
    qryAux.Sql.Add('   PARTPREVPLAN PPP,             ');
    qryAux.Sql.Add('   PLANPREVCONTABIL PPC          ');
    qryAux.Sql.Add(' WHERE                           ');
    qryAux.Sql.Add('   ( P.IDPESSOA  = PF.IDPESSOA ) AND             ');
    qryAux.Sql.Add('   ( P.IDPESSOA  = D.IDPESSOA ) AND              ');
    qryAux.Sql.Add('   ( D.IDTITULAR = DT.IDPESSOA ) AND             ');
    qryAux.Sql.Add('   ( P.IDPESSOA  = PPP.IDPESSOA(+) ) AND         ');
    qryAux.Sql.Add('   ( PPP.IDPLANOPREV = PPC.IDPLANOPREV(+) ) AND  ');
    qryAux.Sql.Add('   ( PPP.FLGDESATIVADO(+)  = 0 )                 ');
    qryAux.Sql.Add('   AND P.NOME = '+ QuotedStr(MSseg.ValoresChave[3]));
    qryAux.Sql.Add('   AND DT.MATRICULA = '+ QuotedStr(MSseg.ValoresChave[0]));
    qryAux.Open;

    sIdPessoa := qryAux.FieldByName('IDPESSOA').AsString;
    sIdPessoaTitular := qryAux.FieldByName('IDPESSOATITULAR').AsString;

    qrySelSegurado.Close;
    qrySelSegurado.ParamByName('idpessoa').asInteger :=  StrToInt(sIdPessoa);
    qrySelSegurado.ParamByName('idpessoatitular').asInteger :=  StrToInt(sIdPessoaTitular);
    qrySelSegurado.Open;

    //sbtnInserir.Enabled := True;
    //sbtnProcurar.Enabled := True;
    //bbtnConfirmar.Enabled := False;
    //bbtnCancelar.Enabled := True;
    //bbtnGeraRelatorio.Enabled := False;
    bbtnSelSegurado.Enabled := False;

    If qrySelSegurado.FieldByName('DESCRICAOPLANOCONTABIL').AsString = '' then begin
    {qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add('    SELECT P.IDPESSOA,                         ');
    qryAux.Sql.Add('         P.NOME,                               ');
    qryAux.Sql.Add('         P.NUMDOCUMENTO,                       ');
    qryAux.Sql.Add('         PF.DATANASC,                          ');
    qryAux.Sql.Add('         D.MATRICULA AS MATRICULADEP,          ');
    qryAux.Sql.Add('         DT.MATRICULA AS MATRICULATITULAR,     ');
    qryAux.Sql.Add('         PPP.IDPLANOPREV,                      ');
    qryAux.Sql.Add('         PPC.IDPLANOPREV AS IDPLANPREVCONTAB,  ');
    qryAux.Sql.Add('         (SELECT NOME                          ');
    qryAux.Sql.Add('          FROM PLANPREVCONTABIL                ');
    qryAux.Sql.Add('          WHERE IDPLANOPREVPREV IN (2,66,74)   ');
    qryAux.Sql.Add('          AND ATIVO = ''S''                    ');
    qryAux.Sql.Add('          AND IDPLANOPREV = PPP.IDPLANOPREV    ');
    qryAux.Sql.Add('          AND IDPLANOPREVPREV = PPC.IDPLANOPREV) as DESCRICAOPLANOCONTABIL ');
    qryAux.Sql.Add('    FROM PESSOA           P,                   ');
    qryAux.Sql.Add('         PESSOAFISICA     PF,                  ');
    qryAux.Sql.Add('         DEPENTIT         D,                   ');
    qryAux.Sql.Add('         DEPENTIT         DT,                  ');
    qryAux.Sql.Add('         PARTPREVPLAN     PPP,                 ');
    qryAux.Sql.Add('         PLANPREVCONTABIL PPC                  ');
    qryAux.Sql.Add('   WHERE P.IDPESSOA  = PF.IDPESSOA             ');
    qryAux.Sql.Add('     AND P.IDPESSOA  = D.IDPESSOA              ');
    qryAux.Sql.Add('     AND D.IDTITULAR = DT.IDPESSOA             ');
    qryAux.Sql.Add('      AND P.IDPESSOA  = PPP.IDPESSOA (+)        ');
    qryAux.Sql.Add('     AND PPP.IDPLANOPREV = PPC.IDPLANOPREV (+) ');
    qryAux.Sql.Add('     AND DT.IDTITULAR = '+ QuotedStr(qrySelSegurado.FieldByName('IDTITULAR').asString));
    qryAux.Open; }//Vinicius Ferreira 27/01/2012

    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add('       SELECT D.IDPESSOA, D.IDTITULAR, P.NOME, P.NUMDOCUMENTO, PF.DATANASC,                                ');
    qryAux.Sql.Add('              decode(D.MATRICULA,DT.MATRICULA,'',D.MATRICULA) MATRICULADEP, DT.MATRICULA AS MATRICULATITULAR,                                  ');
    qryAux.Sql.Add('              (SELECT nvl(bf.idplanoprev,PP.IDPLANOPREV)                                                   ');
    qryAux.Sql.Add('               FROM PARTPREVPLAN PP                                                                        ');
    qryAux.Sql.Add('                    LEFT JOIN benefbfciario bf ON pp.idpessoa = bf.idtitular AND                           ');
    qryAux.Sql.Add('                                                  bf.idpessoa = '+ QuotedStr(qrySelSegurado.FieldByName('IDTITULAR').asString)+' AND');
    qryAux.Sql.Add('                                                  BF.IDTPPAGTOBENEFIC = 1 AND                              ');
    qryAux.Sql.Add('                                                  BF.FONTEPAGADORA = 1 AND                                 ');
    qryAux.Sql.Add('                                                  BF.IDSITBENEFICIO = 1 AND                                ');
    qryAux.Sql.Add('                                                  (BF.IDPLANPREVCONTAB = 28 OR                             ');
    qryAux.Sql.Add('                                                   (BF.IDPLANPREVCONTAB <> 28 AND                          ');
    qryAux.Sql.Add('                                                    NOT EXISTS (SELECT 1                                   ');
    qryAux.Sql.Add('                                                                FROM BENEFBFCIARIO BF1                     ');
    qryAux.Sql.Add('                                                                WHERE BF1.IDTPPAGTOBENEFIC = 1 AND         ');
    qryAux.Sql.Add('                                                                      BF1.FONTEPAGADORA = 1 AND            ');
    qryAux.Sql.Add('                                                                      BF1.IDPLANPREVCONTAB = 28 AND        ');
    qryAux.Sql.Add('                                                                      BF1.IDSITBENEFICIO = 1 AND           ');
    qryAux.Sql.Add('                                                                      BF1.IDTITULAR = BF.IDTITULAR AND     ');
    qryAux.Sql.Add('                                                                      BF1.IDPESSOA = BF.IDPESSOA)))        ');
    qryAux.Sql.Add('               WHERE PP.IDPESSOA = D.IDTITULAR AND                                                         ');
    qryAux.Sql.Add('                     (pp.idsitplanoprev IN (25,26,27,28,29) OR                                             ');
    qryAux.Sql.Add('                     (pp.idsitplanoprev NOT IN (25,26,27,28,29) AND                                        ');
    qryAux.Sql.Add('                      pp.flgdesativado = 0 AND                                                             ');
    qryAux.Sql.Add('                      NOT EXISTS (SELECT 1                                                                 ');
    qryAux.Sql.Add('                                  FROM partprevplan ppp1                                                   ');
    qryAux.Sql.Add('                                  WHERE ppp1.idpessoa = pp.idpessoa                                        ');
    qryAux.Sql.Add('                                    AND ppp1.idsitplanoprev IN (25,26,27,28,29)))) AND                     ');
    qryAux.Sql.Add('                      rownum = 1) IDPLANOPREV,                                                             ');
    qryAux.Sql.Add('              (SELECT nvl(bf.Idplanprevcontab,decode(pp.idsitplanoprev,25,28,26,28,27,28,28,28,29,28,PP.IDPLANOPREV))    ');
    qryAux.Sql.Add('               FROM PARTPREVPLAN PP                                                                        ');
    qryAux.Sql.Add('                    LEFT JOIN benefbfciario bf ON pp.idpessoa = bf.idtitular AND                           ');
    qryAux.Sql.Add('                                                  bf.idpessoa = '+ QuotedStr(qrySelSegurado.FieldByName('IDTITULAR').asString)+' AND');
    qryAux.Sql.Add('                                                  BF.IDTPPAGTOBENEFIC = 1 AND                              ');
    qryAux.Sql.Add('                                                  BF.FONTEPAGADORA = 1 AND                                 ');
    qryAux.Sql.Add('                                                  BF.IDSITBENEFICIO = 1 AND                                ');
    qryAux.Sql.Add('                                                  (BF.IDPLANPREVCONTAB = 28 OR                             ');
    qryAux.Sql.Add('                                                   (BF.IDPLANPREVCONTAB <> 28 AND                          ');
    qryAux.Sql.Add('                                                    NOT EXISTS (SELECT 1                                   ');
    qryAux.Sql.Add('                                                                FROM BENEFBFCIARIO BF1                     ');
    qryAux.Sql.Add('                                                                WHERE BF1.IDTPPAGTOBENEFIC = 1 AND         ');
    qryAux.Sql.Add('                                                                      BF1.FONTEPAGADORA = 1 AND            ');
    qryAux.Sql.Add('                                                                     BF1.IDPLANPREVCONTAB = 28 AND         ');
    qryAux.Sql.Add('                                                                      BF1.IDSITBENEFICIO = 1 AND           ');
    qryAux.Sql.Add('                                                                      BF1.IDTITULAR = BF.IDTITULAR AND     ');
    qryAux.Sql.Add('                                                                      BF1.IDPESSOA = BF.IDPESSOA)))        ');
    qryAux.Sql.Add('               WHERE PP.IDPESSOA = D.IDTITULAR AND                                                         ');
    qryAux.Sql.Add('                     (pp.idsitplanoprev IN (25,26,27,28,29) OR                                             ');
    qryAux.Sql.Add('                     (pp.idsitplanoprev NOT IN (25,26,27,28,29) AND                                        ');
    qryAux.Sql.Add('                      pp.flgdesativado = 0 AND                                                             ');
    qryAux.Sql.Add('                      NOT EXISTS (SELECT 1                                                                 ');
    qryAux.Sql.Add('                                  FROM partprevplan ppp1                                                   ');
    qryAux.Sql.Add('                                  WHERE ppp1.idpessoa = pp.idpessoa                                        ');
    qryAux.Sql.Add('                                    AND ppp1.idsitplanoprev IN (25,26,27,28,29)))) AND                     ');
    qryAux.Sql.Add('                      rownum = 1) IDPLANPREVCONTAB,                                                        ');
    qryAux.Sql.Add('              (SELECT (SELECT PPC.NOME                                                                     ');
    qryAux.Sql.Add('                       FROM PLANPREVCONTABIL PPC                                                           ');
    qryAux.Sql.Add('                       WHERE PPC.IDPLANOPREV = nvl(bf.Idplanprevcontab,decode(pp.idsitplanoprev,25,28,26,28,27,28,28,28,29,28,PP.IDPLANOPREV)))  ');
    qryAux.Sql.Add('               FROM PARTPREVPLAN PP                                                                        ');
    qryAux.Sql.Add('                    LEFT JOIN benefbfciario bf ON pp.idpessoa = bf.idtitular AND                           ');
    qryAux.Sql.Add('                                                  bf.idpessoa = '+ QuotedStr(qrySelSegurado.FieldByName('IDTITULAR').asString)+' AND');
    qryAux.Sql.Add('                                                  BF.IDTPPAGTOBENEFIC = 1 AND                              ');
    qryAux.Sql.Add('                                                  BF.FONTEPAGADORA = 1 AND                                 ');
    qryAux.Sql.Add('                                                  BF.IDSITBENEFICIO = 1 AND                                ');
    qryAux.Sql.Add('                                                  (BF.IDPLANPREVCONTAB = 28 OR                             ');
    qryAux.Sql.Add('                                                   (BF.IDPLANPREVCONTAB <> 28 AND                          ');
    qryAux.Sql.Add('                                                    NOT EXISTS (SELECT 1                                   ');
    qryAux.Sql.Add('                                                                FROM BENEFBFCIARIO BF1                     ');
    qryAux.Sql.Add('                                                                WHERE BF1.IDTPPAGTOBENEFIC = 1 AND         ');
    qryAux.Sql.Add('                                                                      BF1.FONTEPAGADORA = 1 AND            ');
    qryAux.Sql.Add('                                                                      BF1.IDPLANPREVCONTAB = 28 AND        ');
    qryAux.Sql.Add('                                                                      BF1.IDSITBENEFICIO = 1 AND           ');
    qryAux.Sql.Add('                                                                      BF1.IDTITULAR = BF.IDTITULAR AND     ');
    qryAux.Sql.Add('                                                                      BF1.IDPESSOA = BF.IDPESSOA)))        ');
    qryAux.Sql.Add('               WHERE PP.IDPESSOA = D.IDTITULAR AND                                                         ');
    qryAux.Sql.Add('                     (pp.idsitplanoprev IN (25,26,27,28,29) OR                                             ');
    qryAux.Sql.Add('                     (pp.idsitplanoprev NOT IN (25,26,27,28,29) AND                                        ');
    qryAux.Sql.Add('                      pp.flgdesativado = 0 AND                                                             ');
    qryAux.Sql.Add('                      NOT EXISTS (SELECT 1                                                                 ');
    qryAux.Sql.Add('                                  FROM partprevplan ppp1                                                   ');
    qryAux.Sql.Add('                                  WHERE ppp1.idpessoa = pp.idpessoa                                        ');
    qryAux.Sql.Add('                                    AND ppp1.idsitplanoprev IN (25,26,27,28,29)))) AND                     ');
    qryAux.Sql.Add('                      rownum = 1) DESCRICAOPLANOCONTABIL                                                   ');
    qryAux.Sql.Add('       FROM DEPENTIT D                                                                                     ');
    qryAux.Sql.Add('            JOIN PESSOA P ON D.IDPESSOA = P.IDPESSOA                                                       ');
    qryAux.Sql.Add('            JOIN PESSOAFISICA PF ON D.IDPESSOA = PF.IDPESSOA                                               ');
    qryAux.Sql.Add('            JOIN DEPENTIT DT ON D.IDTITULAR = DT.IDPESSOA AND                                              ');
    qryAux.Sql.Add('                                D.IDTITULAR = DT.IDTITULAR                                                 ');
    qryAux.Sql.Add('       WHERE D.IDPESSOA = '+ QuotedStr(qrySelSegurado.FieldByName('IDTITULAR').asString));
    qryAux.Open;

    dbePlanContSegurado.text := qryAux.FieldByName('DESCRICAOPLANOCONTABIL').asString;
    end;

     //Verificar se é Aposentado
     sSQL := 'Select idpessoa, idtitular from depentit where idpessoa = '+ sIdPessoa +' and idpessoa = idtitular';
     qryAux.Close;
     qryAux.SQl.Clear;
     qryAux.SQL.Add(sSQL);

     qryAux.Open;

     If not(qryAux.isempty) then begin

       //Verificar se o selecionado tem Número de Benefício do INSS cadastrado
       // edilaine - SOL 251333 / PPM 799413 - inicio
       If not (dbeNumBenef.Text = '') then begin
         //sSQL := 'SELECT * FROM BENEFBFCIARIO WHERE NUMPROCINSS = '+ dbeCPFSegurado.text +'';
         sSQL := 'SELECT * FROM BENEFBFCIARIO WHERE NUMPROCINSS = '+ QuotedStr(dbeNumBenef.Text) +' and idpessoa <> '+ sIdPessoa+''; //SOL 269509 PPM 1298527 
         qryAux.Close;
         qryAux.SQl.Clear;
         qryAux.SQL.Add(sSQL);
         qryAux.Open;

         If not(qryAux.isempty) then begin
           MsgDlg('NB já existe cadastrado', 'Informação', mtInformation, [mbOk], 0);
           qry.Close;
           qrySelSegurado.Close;
           qryDet.Close;
           Exit;
         end;
       end;
      // edilaine - SOL 251333 / PPM 799413 - fim
     end;

  //Verificações dbeNumBenef (Numero de Beneficio)
  If not (dbeNumBenef.text = '') then begin

      If not (ValidaNumProcesso(dbeNumBenef.text)) then begin
        MsgDlg('Numero de Benefício não valido', 'Informação', mtInformation, [mbOk], 0);
        qry.FieldByName('NUMBENEFICIO').AsString := '';
        dbeNumBenef.SetFocus;
        Exit;
      end;

     //Verificar se é Aposentado ou pensionista
     sSQL := 'Select idpessoa, idtitular from depentit where idpessoa = '+ sIdPessoa +' and idpessoa = idtitular';
     qryAux.Close;
     qryAux.SQl.Clear;
     qryAux.SQL.Add(sSQL);
     qryAux.Open;

     If not (qryAux.isempty) then begin
       sSQL := 'Select IDTITULAR from BENEFHABILITA where idpessoa = '+ sIdPessoa +' and NUMBENEFICIO = '+ QuotedStr(dbeNumBenef.Text) +' '; //SOL 269509 PPM 1298527
       qryAux.Close;
       qryAux.SQl.Clear;
       qryAux.SQL.Add(sSQL);
       qryAux.Open;

       If (qryAux.FieldByName('IDTITULAR').AsString = qrySelSegurado.fieldbyname('IDTITULAR').asString) then begin
         MsgDlg('NB já existe cadastrado', 'Informação', mtInformation, [mbOk], 0);
         dbeNumBenef.text := '';
         dbeNumBenef.SetFocus;
         Exit;
       end;
     End else begin
       sSQL := 'Select * from BENEFHABILITA where idpessoa = '+ sIdPessoa +' and FLGCONCESSAO = 1  ';
       qryAux.Close;
       qryAux.SQl.Clear;
       qryAux.SQL.Add(sSQL);
       qryAux.Open;

       If not(qryAux.isempty) then begin
         MsgDlg('A concessão para Participante / Número do beneficio INSS só pode ser feita uma vez.', 'Informação', mtInformation, [mbOk], 0);
         dbeNumBenef.text := '';
         dbeNumBenef.SetFocus;
         Exit;
       End;
     End;
  End;

   //Verificações dblkpcmbBenef (Combo Beneficio)
   If not (dblkpcmbBenef.Text = '') then begin
     // DIB / DIP
     sSQL := 'SELECT DIB, DTINICIOCRED, idbeneficio FROM DETCONCINSS WHERE IDPESSOA = '+ sIdPessoa +' AND IDBENEFICIO = '+ qryLookBenef.FieldByName('IDBENEFICIO').AsString +' AND DTINICIOCRED is not null ORDER BY DIB, DTINICIOCRED DESC ' ;
     qryAux.Close;
     qryAux.SQl.Clear;
     qryAux.SQL.Add(sSQL);
     qryAux.Open;

     If not(qryAux.isempty) then begin
       qry.Edit;
       qry.FieldByName('DIB').AsString := qryAux.FieldByName('DIB').AsString;
       qry.Post;
       qry.Edit;
       qry.FieldByName('DIP').AsString := qryAux.FieldByName('DTINICIOCRED').AsString;
       qry.Post;
     end else begin
       sSQL := 'SELECT DIB, DIP, idbeneficio FROM BENEFHABILITA WHERE IDPESSOA = '+ sIdPessoa +' AND IDBENEFICIO = '+ qryLookBenef.FieldByName('IDBENEFICIO').AsString +' AND DIP is not null ORDER BY DIB, DIP DESC ' ;
       qryAux.Close;
       qryAux.SQl.Clear;
       qryAux.SQL.Add(sSQL);
       qryAux.Open;

       If not(qryAux.isempty) then begin
         qry.Edit;
         qry.FieldByName('DIB').AsString := qryAux.FieldByName('DIB').AsString;
         qry.Post;
         qry.Edit;
         qry.FieldByName('DIP').AsString := qryAux.FieldByName('DIP').AsString;
         qry.Post;
       End;
     End;
   End;

  end else begin
    // DesabilitaBtn;
  end;

end;

procedure TfrmCadProcHabINSS.sbtnProcurarClick(Sender: TObject);
var
i: Integer;
begin
  //inherited;
  If (MontaSelectBenef.RetornouValor) then
    MontaSelectBenef.Cancela;

  MontaSelectBenef.Executar;

  if MontaSelectBenef.RetornouValor then begin
    Panel1.Enabled := True;

    qry.Close;
    qry.ParamByName('IDPESSOA').asInteger :=  StrToInt(MontaSelectBenef.ValoresChave[0]);
    qry.ParamByName('IDBENEFHABILITA').asInteger :=  StrToInt(MontaSelectBenef.ValoresChave[1]);
    qry.Open;

    vNumBenef := qry.FieldByName('NUMBENEFICIO').AsString;

    sIdPessoa := MontaSelectBenef.ValoresChave[0];

    qryLookBenef.Locate('IDBENEFICIO',qry.FieldByName('IDBENEFICIO').AsInteger,[]);
      if not(qryLookBenef.EOF) then
      begin
         dblkpcmbBenef.LookupValue := qry.FieldByName('IDBENEFICIO').AsString;
      end;

    qryLookEstado.Locate('SIGLACENTRAL',qry.FieldByName('ESTADO').AsString,[]);
      if not(qryLookEstado.EOF) then
      begin
         dblkpcmbEstado.LookupValue := qry.FieldByName('ESTADO').AsString;
      end;

    //RICARDO
    cdsDet.Close;
    cdsDet.Params.ParamByName('IDBENEFHABILITA').asInteger :=  StrToInt(MontaSelectBenef.ValoresChave[1]);
    cdsDet.Open;

    qryDet.Close;
    qryDet.ParamByName('IDBENEFHABILITA').asInteger :=  StrToInt(MontaSelectBenef.ValoresChave[1]);
    qryDet.Open;

    qrySelSegurado.Close;
    qrySelSegurado.ParamByName('IDPESSOA').asInteger :=  StrToInt(MontaSelectBenef.ValoresChave[0]);
    qrySelSegurado.ParamByName('idpessoatitular').asInteger :=  StrToInt(MontaSelectBenef.ValoresChave[2]); //arrumar
    qrySelSegurado.Open;

    //DtMaior := 0; // SOL 227329 KTN 2061946
    If not(cdsDet.IsEmpty) then
    begin
      cdsDet.First;
      For i:=1 to cdsDet.RecordCount do
      begin
         //If cdsDet.FieldByName('DataRegistro').AsDateTime > DtMaior then begin // SOL 227329 KTN 2061946
         //DtMaior := cdsDet.FieldByName('DataRegistro').AsDateTime;  // SOL 227329 KTN 2061946
         If cdsDet.FieldByName('FLGHABILITACAOINSS').AsInteger = 1 then
         begin
            dbeBenefIdentReq.Text := 'Sim'  ;
            break; // SOL 227329 KTN 2061946
         end
         else
            dbeBenefIdentReq.Text := 'Não';
            //End; // SOL 227329 KTN 2061946
         cdsDet.Next;
      End;
    End;

    qryLookStiHabBf.Locate('IDSITHABILITACAO',cdsDet.FieldByName('IDSITHABILITACAO').AsInteger,[]);
      if not(qryLookStiHabBf.EOF) then
      begin
         dblkpcmbNovaSitHabBfINSS.LookupValue := cdsDet.FieldByName('IDSITHABILITACAO').AsString;
      end;

  bbtnSelSegurado.Enabled := False;
  bbtnGeraRelatorio.Enabled := True;

  sbtnProcurar.Enabled := True;
  sbtnApagar.Enabled := True;
  sbtnAlterar.Enabled := True;
  sbtnInserir.Enabled := True;
  bbtnConfirmar.Enabled := False;
  bbtnSair.Enabled := True;
  bbtnCancelar.Enabled  := True;

  sbtnApagar.Down := False;
  sbtnAlterar.Down := False;
  sbtnInserir.Down := False;
  sbtnProcurar.Down := False;

  Panel1.Enabled := False;
  end else begin
    // DesabilitaBtn;
    sbtnProcurar.Enabled := True;
    sbtnApagar.Enabled := False;
    sbtnAlterar.Enabled := False;
    sbtnInserir.Enabled := True;
    sbtnApagar.Down := False;
    sbtnAlterar.Down := False;
    sbtnInserir.Down := False;
    sbtnProcurar.Down := False;
  end;


end;


procedure TfrmCadProcHabINSS.sbtnInserirClick(Sender: TObject);
begin
  //inherited;

  sIdPessoa := '';
  
  Panel1.Enabled := True;

  FlgIncluir := True;
  FlgExcluir := False;
  FlgEditar  := False;

  bbtnSelSegurado.Enabled := True;

  sbtnProcurar.Enabled := False;
  sbtnApagar.Enabled := False;
  sbtnAlterar.Enabled := False;
  sbtnInserir.Enabled := False;
  bbtnConfirmar.Enabled := True;
  bbtnSair.Enabled := False;
  bbtnCancelar.Enabled  := True;
  bbtnGeraRelatorio.Enabled := False;

  sbtnInsDet.enabled := True;

     qry.Close;
     qry.ParamByName('IDPESSOA').asInteger := 0;
     qry.ParamByName('IDBENEFHABILITA').asInteger := 0;
     qry.Open;
     qry.Insert;

     cdsDet.Close;
     qryDet.Close;
     qrySelSegurado.Close;

     dblkpcmbBenef.Text := '';
     dblkpcmbEstado.Text := '';
     dblkpcmbNovaSitHabBfINSS.Text := '';
     dbeBenefIdentReq.Text := '';
     //Início - William Santana SOL 218687.17129 PPM 757901
     dbrgBenefFora.ItemIndex := 1;
     dbrgLei142.ItemIndex := 1;
     //Término - William Santana SOL 218687.17129 PPM 757901              
     dbrgSentencaJud.ItemIndex := 1;   //William Santana - SOL 251599.17194 PPM 783173

     // Gerar Sequence IDBENEFHABILITA
     sSQL := 'SELECT SEQBFHABIDBENEFICIO.nextval from dual';
     qryAux.Close;
     qryAux.SQl.Clear;
     qryAux.SQL.Add(sSQL);
     qryAux.Open;

     If not(qryAux.isempty) then begin
       seqIDBENEFHABILITA := qryAux.FieldByName('nextval').AsString;
     end;

end;

procedure TfrmCadProcHabINSS.sbtnAlterarClick(Sender: TObject);
begin
  //inherited;
  Panel1.Enabled := True;

  if not (qry.FieldByName('FLGREQUERIMENTO').AsInteger = 1) or not (qry.FieldByName('FLGCONCESSAO').AsInteger = 1) then begin
     qry.Edit;
  end else begin
     MsgDlg('Não é possivel alterar pois o benefício já foi requerio e/ou concedido', 'Informação', mtInformation, [mbOk], 0);
     exit
  end;


  

  FlgIncluir := False;
  FlgExcluir := False;
  FlgEditar  := True;

  bbtnSelSegurado.Enabled := True;
  bbtnGeraRelatorio.Enabled := False;

  sbtnProcurar.Enabled := False;
  sbtnApagar.Enabled := False;
  sbtnAlterar.Enabled := False;
  sbtnInserir.Enabled := False;
  sbtnApagar.Down := False;
  sbtnAlterar.Down  := False;
  sbtnInserir.Down  := False;
  sbtnProcurar.Down  := True;

  bbtnConfirmar.Enabled := True;
  bbtnSair.Enabled := False;
  bbtnCancelar.Enabled  := True;

  //Verificar se a qryDet retorna
  if not(qryDet.isempty) then begin
    sbtnInsDet.Enabled := True;
    sbtnAltDet.Enabled := True;
    sbtnExcluiDet.Enabled := True;
  end;
  sbtnInsDet.Enabled := True;
end;

procedure TfrmCadProcHabINSS.sbtnApagarClick(Sender: TObject);
begin
  //inherited;

  If MsgDlg('Deseja realmente excluir o registro selecionado ?','Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes
  Then begin
    FlgIncluir := False;
    FlgExcluir := True;
    FlgEditar  := False;

    bbtnSelSegurado.Enabled := False;

    sbtnProcurar.Enabled := False;
    sbtnApagar.Enabled := False;
    sbtnAlterar.Enabled := False;
    sbtnInserir.Enabled := False;
    sbtnApagar.Down := False;
    sbtnAlterar.Down  := False;
    sbtnInserir.Down  := False;
    sbtnProcurar.Down  := True;

    bbtnConfirmar.Enabled := True;
    bbtnSair.Enabled := False;
    bbtnCancelar.Enabled  := True;

    bbtnGeraRelatorio.Enabled := False;
   end else begin

    bbtnSelSegurado.Enabled := False;

    sbtnProcurar.Enabled := False;
    sbtnApagar.Enabled := True;
    sbtnAlterar.Enabled := True;
    sbtnInserir.Enabled := False;
    sbtnApagar.Down := False;
    sbtnAlterar.Down  := False;
    sbtnInserir.Down  := False;
    sbtnProcurar.Down  := True;

    bbtnConfirmar.Enabled := True;
    bbtnSair.Enabled := False;
    bbtnCancelar.Enabled  := True;

  end;



end;

procedure TfrmCadProcHabINSS.sbtnInsDetClick(Sender: TObject);
begin
  //inherited;
      //cdsDet.First;
      //qryDet.First;

      tb97Detalhe.Visible := True;

      FlgIncluirDet := True;
      FlgExcluirDet := False;
      FlgEditarDet  := False;

      pgctrlDetalhe.SendToBack;

      if (cdsDet.IsEmpty) then
      begin
        cdsDet.Close;
        cdsDet.Params.ParamByName('IDBENEFHABILITA').asInteger := 0;
        cdsDet.Open;
      end;

      if (qryDet.IsEmpty) then begin
        qryDet.Close;
        qryDet.ParamByName('IDBENEFHABILITA').asInteger := 0;
        qryDet.Open;
      end;


      bbtnOkDet.Enabled := True;
      bbtnCancelarDet.Enabled := True;
      bbtnVoltarDet.Enabled := True;

      cdsDet.Insert;
      qryDet.Insert;

      cmdtpDtAlt.SetFocus;

      cdsDet.Insert;
      qryDet.Insert;

      dblkpcmbNovaSitHabBfINSS.Text := '';

end;

procedure TfrmCadProcHabINSS.sbtnAltDetClick(Sender: TObject);
begin
  //inherited;
  tb97Detalhe.Visible := True;

  FlgIncluirDet := False;
  FlgExcluirDet := False;
  FlgEditarDet  := True;

  bbtnOkDet.Enabled := True;
  bbtnCancelarDet.Enabled := True;
  bbtnVoltarDet.Enabled := True;

  pgctrlDetalhe.SendToBack;

  qryDet.Locate('IDHISTBENEFHABILITA', (cdsDet.FieldByName('IDHISTBENEFHABILITA').AsInteger), []);
  cdsDet.Edit; //Ricardo
  qryDet.Edit;
end;

procedure TfrmCadProcHabINSS.sbtnExcluiDetClick(Sender: TObject);
begin
  //inherited;
  tb97Detalhe.Visible := True;

  If MsgDlg('Deseja excluir o registro de histórico de movimentação selecionado ?','Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes
  Then begin
    qryDet.Locate('IDHISTBENEFHABILITA', (cdsDet.FieldByName('IDHISTBENEFHABILITA').AsInteger), []);
    cdsDet.Delete; //ricardo
    qryDet.Delete;

  end;

  FlgIncluirDet := False;
  FlgExcluirDet := True;
  FlgEditarDet  := False;

  bbtnOkDet.Enabled := True;
  bbtnCancelarDet.Enabled := True;
  bbtnVoltarDet.Enabled := True;
  
end;

procedure TfrmCadProcHabINSS.bbtnConfirmarClick(Sender: TObject);
begin
 // inherited;

 If (FlgIncluir) or (FlgEditar) then begin
     if (dbeNumBenef.text = '') then begin
      MsgDlg('É necessário informar o Número do Benefício', 'Informação', mtInformation, [mbOk], 0);
      dbeNumBenef.SetFocus;
      Exit;
     end else if (dblkpcmbBenef.text = '') then begin
      MsgDlg('É necessário selecionar o Benefício.', 'Informação', mtInformation, [mbOk], 0);
      dblkpcmbBenef.SetFocus;
      Exit;
     //Início - William Santana SOL 218687.17129 PPM 757901
     //end else if (dbeNumBDRP.text = '') then begin
     end else if (dbeNumBDRP.text = '') and (dbrgBenefFora.ItemIndex = 1) then begin
     //Término - William Santana SOL 218687.17129 PPM 757901
      MsgDlg('É necessário informar o Número do BRDP.', 'Informação', mtInformation, [mbOk], 0);
      dbeNumBDRP.SetFocus;
      Exit;
     end else if (cmdtpDER.text = '') then begin
      MsgDlg('É necessário informar a da Data de Entrada do Requerimento.', 'Informação', mtInformation, [mbOk], 0);
      cmdtpDER.SetFocus;
      Exit;
     end else if (cmdtpDIB.text = '') then begin
      MsgDlg('È necessário informar a DIB.', 'Informação', mtInformation, [mbOk], 0);
      cmdtpDIB.SetFocus;
      Exit;
     end else if (cmdtpDIP.text = '') then begin
      MsgDlg('È necessário informar a DIP.', 'Informação', mtInformation, [mbOk], 0);
      cmdtpDIP.SetFocus;
      Exit;
     end else if (dblkpcmbEstado.text = '') then begin
      MsgDlg('É necessário selecionar o Estado.', 'Informação', mtInformation, [mbOk], 0);
      dblkpcmbEstado.SetFocus;
     Exit;
     end else if (trim(dbNup.Text) = '') then begin
      MsgDlg('O campo NUP é de preenchimento obrigatório.', 'Informação', mtInformation, [mbOk], 0);
      dbNup.SetFocus;
      Exit;
     end else if (qrySelSegurado.IsEmpty) then begin
      MsgDlg('Segurado não selecionado.', 'Informação', mtInformation, [mbOk], 0);
      dblkpcmbEstado.SetFocus;
     Exit;
     // Felipe A. Santos SOL 203790 KTN 1969208
     end else if (cmdtpDER.Date > Date) then begin
      MsgDlg('Data informada não pode ser maior que data atual', 'Informação', mtInformation, [mbOk], 0);
      cmdtpDER.SetFocus;
      Exit;
     end else if (cmdtpDIB.Date > Date) then begin
      MsgDlg('Data informada não pode ser maior que data atual', 'Informação', mtInformation, [mbOk], 0);
      cmdtpDIB.SetFocus;
      Exit;
     end else if (cmdtpDIP.Date > Date) then begin
      MsgDlg('Data informada não pode ser maior que data atual', 'Informação', mtInformation, [mbOk], 0);
      cmdtpDIP.SetFocus;
      Exit;
      // Felipe A. Santos  SOL 203790 KTN 1969208 - FIM
      //Higor Nayde SOL 208130  KTN 2019369
     end else if ((trim(edtTempoAno.text) ='') or (trim(edtTempoMes.text) ='') or (trim(edtTempoDia.text) =''))then begin
      MsgDlg('É necessário informar o tempo de serviço em ano, mês e dias.', 'Informação', mtInformation, [mbOk], 0);
      if (trim(edtTempoAno.text) ='') then
         edtTempoAno.SetFocus;
      if (trim(edtTempoMes.text) ='') then
         edtTempoMes.SetFocus;
      if (trim(edtTempoDia.text) ='') then
         edtTempoDia.SetFocus;
      Exit;
     end  else if (trim(edtINSS.text) ='')then begin
      MsgDlg('É necessário informar o % do INSS.', 'Informação', mtInformation, [mbOk], 0);
      edtINSS.SetFocus;
      Exit;
     end else if (trim(edtIndiceReajuste.text) ='')then begin
      MsgDlg('É necessário informar o Índice de Reajuste do Teto.', 'Informação', mtInformation, [mbOk], 0);
      edtIndiceReajuste.SetFocus;
      Exit;
     end; //Higor Nayde SOL 208130 KTN 2019369

     //Início - William Santana SOL 218687.17129 PPM 757901
     if (trim(dbeRMI.Text) = EmptyStr) and (dbrgBenefFora.ItemIndex = 0) then
     begin
      MsgDlg('RMI é obrigatório para benefícios fora do convênio.', 'Informação', mtInformation, [mbOk], 0);
      dbeRMI.SetFocus;
      Exit;
     end;
     //Término - William Santana SOL 218687.17129 PPM 757901

     //Início - William Santana SOL 251599.17194 PPM 783173
     if (dbrgSentencaJud.ItemIndex = 0) and (dbmObs.Text = EmptyStr) then
     begin
      MsgDlg('Para sentença judicial é necessário preencher o campo observações!', 'Informação', mtInformation, [mbOk], 0);
      dbmObs.SetFocus;
      Exit;
     end;
     //Término - William Santana SOL 251599.17194 PPM 783173

     If (FlgIncluir) then begin
       qry.edit;
       qry.FieldByName('IDBENEFHABILITA').AsString := seqIDBENEFHABILITA;
     end
     else
     if (FlgEditar) then
     begin
        qry.edit;
     end;
     qry.FieldByName('ESTADO').AsString := dblkpcmbEstado.lookupvalue;
     qry.FieldByName('IDBENEFICIO').AsInteger := StrToInt(dblkpcmbBenef.lookupvalue);
     qry.FieldByName('IDPESSOA').AsInteger := qrySelSegurado.fieldbyname('IDPESSOA').AsInteger;
     qry.FieldByName('IDTITULAR').AsInteger := qrySelSegurado.fieldbyname('IDTITULAR').AsInteger;
  end;

  If not (FlgExcluir) then begin
    // If seqIDBENEFHABILITA = '' and (FlgIncluir) then
    // seqIDBENEFHABILITA := qry.FieldByName('IDBENEFHABILITA').AsString;

      If not(qryDet.isempty) then begin
       AplicaAlteracoes([qry,qryDet]);
       bbtnGeraRelatorio.Enabled := True;
       If not (FlgEditar) then
        MSseg.Cancela;
       //If (MontaSelectBenef.RetornouValor) then
       // MontaSelectBenef.Cancela;
      end else begin
       MsgDlg('É obrigatorio cadastrar um historico de movientação', 'Informação', mtInformation, [mbOk], 0);
       exit;
      End;


  end else begin

       sSQL := 'Delete from HISTBENEFHABILITA where IDBENEFHABILITA = '+ qry.FieldByName('IDBENEFHABILITA').AsString +' ';
       qryAux.Close;
       qryAux.SQl.Clear;
       qryAux.SQL.Add(sSQL);
       qryAux.ExecSQL;

       qrySelSegurado.Close;
       cdsDet.Close;
       qryDet.Close;
       qry.Delete;
       dblkpcmbBenef.Text := '';
       dblkpcmbEstado.Text := '';
       dblkpcmbNovaSitHabBfINSS.Text := '';
       dbeBenefIdentReq.Text := '';
       dbNup.Text := '';

       AplicaAlteracoes([qry])
  End;


 FlgExcluir := False;
 FlgIncluir := False;
 FlgEditar  := False;

  bbtnSelSegurado.Enabled := False;

  sbtnProcurar.Enabled := True;
  sbtnApagar.Enabled := True;
  sbtnAlterar.Enabled := True;
  sbtnInserir.Enabled := True;
  sbtnProcurar.Down := False;
  sbtnApagar.Down := False;
  sbtnAlterar.Down := False;
  sbtnInserir.Down := False;

  sbtnInsDet.Enabled := False;
  sbtnAltDet.Enabled := False;
  sbtnExcluiDet.Enabled := False;

  bbtnConfirmar.Enabled := False;
  bbtnCancelar.Enabled := True;
  bbtnSair.Enabled := True;

  If MSseg.RetornouValor then
  MSseg.Cancela;

  //If MontaSelectBenef.RetornouValor then
  //MontaSelectBenef.Cancela;

  Panel1.Enabled := False;
  
  sIdPessoa := '';
end;

procedure TfrmCadProcHabINSS.bbtnOkDetClick(Sender: TObject);
var
i: Integer;
begin
  //inherited;

   If (FlgIncluirDet) or (FlgEditarDet) then begin
     If (cmdtpDtAlt.text = '') then begin
      MsgDlg('É necessário informar a Data de Alteração.', 'Informação', mtInformation, [mbOk], 0);
      cmdtpDtAlt.SetFocus;
      Exit;
     end else if (dblkpcmbNovaSitHabBfINSS.text = '') then begin
      MsgDlg('É necessário informar a Nova Situação para Habilitação de Benefícios do INSS.', 'Informação', mtInformation, [mbOk], 0);
      dblkpcmbNovaSitHabBfINSS.SetFocus;
      Exit;
     end else if (dbeObservacoes.text = '') then begin
      MsgDlg('É necessário informar as Observações Complementares.', 'Informação', mtInformation, [mbOk], 0);
      dbeObservacoes.SetFocus;
     Exit;
     end;
   End;

   pgctrlDetalhe.BringToFront;
   Dock973.BringToFront;

   If qry.FieldByName('IDBENEFHABILITA').AsString <> '' then  begin //Inicio DODS - SOL 269218 PPM 1288265 //SOL 269509 PPM 1298527
      seqIDBENEFHABILITA := qry.FieldByName('IDBENEFHABILITA').AsString; // SOL 269509 PPM 1298527
   end;                                  //Fim   DODS - SOL 269218 PPM 1288265 //SOL 269509 PPM 1298527

   If (FlgIncluirDet) or (FlgEditarDet) then begin
     qryDet.FieldByName('DATAREGISTRO').AsDateTime:= cdsDet.FieldByName('DATAREGISTRO').AsDateTime;
     qryDet.FieldByName('OBSERVACAO').AsString := cdsDet.FieldByName('OBSERVACAO').AsString;
   End;

   If (FlgIncluirDet = True) then begin
     qryDet.FieldByName('IDBENEFHABILITA').AsInteger := StrToInt(seqIDBENEFHABILITA);
     cdsDet.FieldByName('IDBENEFHABILITA').AsInteger := StrToInt(seqIDBENEFHABILITA); //Ricardo (cds)
   End;

   If not (FlgExcluirDet = True) then begin
     qryDet.FieldByName('IDSITHABILITACAO').AsInteger := StrToInt(dblkpcmbNovaSitHabBfINSS.lookupvalue);
     qryDet.FieldByName('DESCRICAO').AsString         := dblkpcmbNovaSitHabBfINSS.Text; // FHBS
     //Ricardo (cds)
     cdsDet.FieldByName('IDSITHABILITACAO').AsInteger := StrToInt(dblkpcmbNovaSitHabBfINSS.lookupvalue);
     cdsDet.FieldByName('DESCRICAO').AsString         := dblkpcmbNovaSitHabBfINSS.Text; // FHBS
   End;

 //AplicaAlteracoes([qryDet]);

  FlgIncluirDet := False;
  FlgExcluirDet := False;
  FlgEditarDet  := False;

  bbtnOkDet.Enabled := False;
  bbtnCancelarDet.Enabled := False;
  bbtnVoltarDet.Enabled := False;

  sbtnInsDet.Down := False;
  sbtnAltDet.Down := False;
  sbtnExcluiDet.Down := False;

  //qryDet.Close;
  //qryDet.ParamByName('IDBENEFHABILITA').asInteger :=  strtoint(seqIDBENEFHABILITA);
 // qryDet.Open;

    DtMaior := 0;
    If not(qryDet.IsEmpty) then begin
    //qryDet.First;
    cdsDet.First;
      For i:=1 to cdsDet.RecordCount do begin      //qryDet.RecordCount do begin
       //If qryDet.FieldByName('DataRegistro').AsDateTime > DtMaior then begin
       If cdsDet.FieldByName('DataRegistro').AsDateTime > DtMaior then begin
       //DtMaior := qryDet.FieldByName('DataRegistro').AsDateTime;
       DtMaior := cdsDet.FieldByName('DataRegistro').AsDateTime;
       sSQL := 'Select * from SITHABILITACAOINSS where IDSITHABILITACAO = '+ qryDet.FieldByName('IDSITHABILITACAO').AsString +'';
       qryAux.Close;
       qryAux.SQl.Clear;
       qryAux.SQL.Add(sSQL);
       qryAux.Open;
           If qryAux.FieldByName('FLGHABILITACAOINSS').AsInteger = 1 then
           dbeBenefIdentReq.Text := 'Sim'
           else
           dbeBenefIdentReq.Text := 'Não';
       End;
      //qryDet.Next;
      cdsDet.Next;
      End;
    End;

  tb97Detalhe.Visible := False;
end;

procedure TfrmCadProcHabINSS.dbeNumBenefExit(Sender: TObject);
begin
  //inherited;

 If (MSseg.RetornouValor) or (MontaSelectBenef.RetornouValor) then begin
  //Verificaçoes Numero de Beneficio
  If not (dbeNumBenef.text = '') and not(sIdPessoa = '') then begin

      If not (ValidaNumProcesso(dbeNumBenef.text)) then begin
        MsgDlg('Numero de Benefício não valido', 'Informação', mtInformation, [mbOk], 0);
        qry.FieldByName('NUMBENEFICIO').AsString := '';
        dbeNumBenef.SetFocus;
        Exit;
      end;
       
     //Verificar se é Aposentado ou pensionista
     sSQL := 'Select idpessoa, idtitular from depentit where idpessoa = '+ sIdPessoa +' and idpessoa = idtitular';
     qryAux.Close;
     qryAux.SQl.Clear;
     qryAux.SQL.Add(sSQL);
     qryAux.Open;

     If not (qryAux.isempty) then begin

       If not (dbeNumBenef.text = vNumBenef) then begin
         //sSQL := 'Select IDTITULAR from BENEFHABILITA where idpessoa = '+ sIdPessoa +' and NUMBENEFICIO = '+ dbeNumBenef.Text +' ';  // edilaine - SOL 251333 / PPM 799413 - comentado
         sSQL := 'SELECT IDTITULAR  FROM BENEFBFCIARIO WHERE NUMPROCINSS = '+ QuotedStr(dbeNumBenef.Text) +' and idpessoa <> '+ sIdPessoa+'';     // edilaine - SOL 251333 / PPM 799413 //SOL 269509 PPM 1298527
         qryAux.Close;
         qryAux.SQl.Clear;
         qryAux.SQL.Add(sSQL);
         qryAux.Open;

         //If (qryAux.FieldByName('IDTITULAR').AsString = qrySelSegurado.fieldbyname('IDTITULAR').asString) then begin  // edilaine - SOL 251333 / PPM 799413 - comentado
         If not(qryAux.isempty) then begin                                                                              // edilaine - SOL 251333 / PPM 799413
           MsgDlg('NB já existe cadastrado', 'Informação', mtInformation, [mbOk], 0);
           dbeNumBenef.text := '';
           dbeNumBenef.SetFocus;
           Exit;
         end;
       end;
     End else begin
       sSQL := 'Select * from BENEFHABILITA where idpessoa = '+ sIdPessoa +' and FLGCONCESSAO = 1  ';
       qryAux.Close;
       qryAux.SQl.Clear;
       qryAux.SQL.Add(sSQL);
       qryAux.Open;

       If not(qryAux.isempty) then begin
         MsgDlg('A concessão para Participante / Número do beneficio INSS só pode ser feita uma vez.', 'Informação', mtInformation, [mbOk], 0);
         dbeNumBenef.text := '';
         dbeNumBenef.SetFocus;
         Exit;
       end;
     End;
   End;
  End;
end;



procedure TfrmCadProcHabINSS.bbtnCancelarClick(Sender: TObject);
begin
  //inherited;

  If not (qrySelSegurado.state = dsInactive) then begin
    qrySelSegurado.Close;
  End;

  If not (qry.state = dsInactive) then begin
      qry.CancelUpdates;
      qry.Close;
      qryDet.Close;
      cdsDet.Close;
      qrySelSegurado.Close;
  End;

  If MSseg.RetornouValor then
  MSseg.Cancela;

  //If MontaSelectBenef.RetornouValor then
  //MontaSelectBenef.Cancela;

  pgctrlDetalhe.BringToFront;
  Dock973.BringToFront;

  dblkpcmbBenef.Text := '';
  dblkpcmbEstado.Text := '';
  dblkpcmbNovaSitHabBfINSS.Text := '';
  dbeBenefIdentReq.Text := '';

  FlgExcluir := False;
  FlgIncluir := False;
  FlgEditar  := False;

  bbtnSelSegurado.Enabled := False;
  bbtnGeraRelatorio.Enabled := False;

  sbtnProcurar.Enabled := True;
  sbtnApagar.Enabled := False;
  sbtnAlterar.Enabled := False;
  sbtnInserir.Enabled := True;

  sbtnApagar.Down := False;
  sbtnAlterar.Down := False;
  sbtnInserir.Down := False;
  sbtnProcurar.Down := False;

  bbtnConfirmar.Enabled := False;
  bbtnCancelar.Enabled := False;
  bbtnSair.Enabled := True;

  sbtnInsDet.Enabled := False;
  sbtnAltDet.Enabled := False;
  sbtnExcluiDet.Enabled := False;

  Panel1.Enabled := False;

  tb97Detalhe.visible := False;

  sIdPessoa :='';
end;


procedure TfrmCadProcHabINSS.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  //inherited;

end;

procedure TfrmCadProcHabINSS.CmeCadastroConfirma(Sender: TObject);
begin
  //inherited;

end;

procedure TfrmCadProcHabINSS.CmeCadastroDelete(Sender: TObject);
begin
  //inherited;

end;

procedure TfrmCadProcHabINSS.CmeCadastroEdit(Sender: TObject);
begin
  //inherited;

end;

procedure TfrmCadProcHabINSS.CmeCadastroInsert(Sender: TObject);
begin
  //inherited;

end;

procedure TfrmCadProcHabINSS.FormCreate(Sender: TObject);
begin
    //inherited;
    qryLookBenef.Close;
    qryLookBenef.Open;

    qryLookEstado.Close;
    qryLookEstado.Open;

    qryLookStiHabBf.Close;
    qryLookStiHabBf.Open;
end;


procedure TfrmCadProcHabINSS.CmeDetalheAtualizaBotoes(Sender: TObject);
begin
  //inherited;

end;

procedure TfrmCadProcHabINSS.CmeDetalheConfirma(Sender: TObject);
begin
  //inherited;

end;

procedure TfrmCadProcHabINSS.CmeDetalheDelete(Sender: TObject);
begin
  //inherited;

end;

procedure TfrmCadProcHabINSS.CmeDetalheEdit(Sender: TObject);
begin
  //inherited;

end;

procedure TfrmCadProcHabINSS.dbgrdDetCellChanged(Sender: TObject);
begin
  inherited;

  If (cdsDet.FieldByName('IDSITHABILITACAO').AsInteger <> 0) then begin
      qryLookStiHabBf.Close;
      qryLookStiHabBf.Open;
      qryLookStiHabBf.Locate('IDSITHABILITACAO',cdsDet.FieldByName('IDSITHABILITACAO').AsInteger,[]);
      if not(qryLookStiHabBf.EOF) then
      begin
         dblkpcmbNovaSitHabBfINSS.LookupValue := cdsDet.FieldByName('IDSITHABILITACAO').AsString;
      end;
  end;

end;

procedure TfrmCadProcHabINSS.bbtnVoltarDetClick(Sender: TObject);
begin
  //inherited;
   if (qryDet <> nil) and (qryDet.State in [dsEdit,dsInsert]) then

   //cdsDet.Cancel;
   //qryDet.Cancel;
   //cdsDet.State. := dsBrowse;
   //qryDet.State := dsBrowse;

   cdsDet.CancelRange;

   if qryDet <> nil then begin
   pgctrlDetalhe.BringToFront;
   Dock973.BringToFront;
   end;

  FlgIncluirDet := False;
  FlgExcluirDet := False;
  FlgEditarDet  := False;

  bbtnOkDet.Enabled := False;
  bbtnCancelarDet.Enabled := False;
  bbtnVoltarDet.Enabled := False;

  sbtnInsDet.Down := False;
  sbtnAltDet.Down := False;
  sbtnExcluiDet.Down := False;

    {cdsDet.Close;
    If (MontaSelectBenef.RetornouValor) then begin
    cdsDet.Params.ParamByName('IDBENEFHABILITA').asInteger :=  StrToInt(MontaSelectBenef.ValoresChave[1]);
    end Else begin
    cdsDet.Params.ParamByName('IDBENEFHABILITA').asInteger := 0;
    end;
    cdsDet.Open;

    qryDet.Close;
    If (MontaSelectBenef.RetornouValor) then begin
     qryDet.Params.ParamByName('IDBENEFHABILITA').asInteger :=  StrToInt(MontaSelectBenef.ValoresChave[1]);
    end Else begin
     qryDet.Params.ParamByName('IDBENEFHABILITA').asInteger := 0;
    end;
    qryDet.Open;

    qryLookStiHabBf.Close;
    qryLookStiHabBf.Open;
    qryLookStiHabBf.Locate('IDSITHABILITACAO',qryDet.FieldByName('IDSITHABILITACAO').AsInteger,[]);
      if not(qryLookStiHabBf.EOF) then
      begin
         dblkpcmbNovaSitHabBfINSS.LookupValue := qryDet.FieldByName('IDSITHABILITACAO').AsString;
      end;}

  tb97Detalhe.Visible := False;
end;


procedure TfrmCadProcHabINSS.bbtnCancelarDetClick(Sender: TObject);
begin
  //inherited;

  qryDet.CancelUpdates;
  qryDet.Close;

  cdsDet.CancelUpdates;
  cdsDet.Close;

  FlgIncluirDet := False;
  FlgExcluirDet := False;
  FlgEditarDet  := False;

  bbtnOkDet.Enabled := False;
  bbtnCancelarDet.Enabled := False;
  bbtnVoltarDet.Enabled := False;

  sbtnInsDet.Down := False;
  sbtnAltDet.Down := False;
  sbtnExcluiDet.Down := False;

   pgctrlDetalhe.BringToFront;
   Dock973.BringToFront;

    cdsDet.Close;
    If (MontaSelectBenef.RetornouValor) then begin
    cdsDet.Params.ParamByName('IDBENEFHABILITA').asInteger :=  StrToInt(MontaSelectBenef.ValoresChave[1]);
    end Else begin
    cdsDet.Params.ParamByName('IDBENEFHABILITA').asInteger := 0;
    end;
    cdsDet.Open;

    qryDet.Close;
    If (MontaSelectBenef.RetornouValor) then begin
     qryDet.Params.ParamByName('IDBENEFHABILITA').asInteger :=  StrToInt(MontaSelectBenef.ValoresChave[1]);
    end Else begin
     qryDet.Params.ParamByName('IDBENEFHABILITA').asInteger := 0;
    end;
    qryDet.Open;

    qryLookStiHabBf.Close;
    qryLookStiHabBf.Open;
    qryLookStiHabBf.Locate('IDSITHABILITACAO',cdsDet.FieldByName('IDSITHABILITACAO').AsInteger,[]);
      if not(qryLookStiHabBf.EOF) then
      begin
         dblkpcmbNovaSitHabBfINSS.LookupValue := cdsDet.FieldByName('IDSITHABILITACAO').AsString;
      end;

    tb97Detalhe.Visible := False;
end;

procedure TfrmCadProcHabINSS.bbtnGeraRelatorioClick(Sender: TObject);
var sNomeArquivo, vBuffer     : String;
begin
  inherited;

    pplbBenefIdeReq.Caption := dbeBenefIdentReq.text;
    pplbBeneficio.Caption := dblkpcmbBenef.text;
    pplbPlanoContabil.Caption := dbePlanContSegurado.text;

    sNomeArquivo := 'Relatório Habilitação INSS';

    pprRelHabINSS.DeviceType       := 'PDFFile';
    pprRelHabINSS.AllowPrintToFile := True;
    pprRelHabINSS.ShowPrintDialog  := False;
    pprRelHabINSS.TextFileName     := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\'+pChar(sNomeArquivo)+'.PDF';
    pprRelHabINSS.Print;

    //Renato Visoni SOL 142792 Kintana 916318
//    sListaMesProcessado.Destroy;
//    sListaMesProcessado := TStringList.Create();
    //Renato Visoni SOL 142792 Kintana 916318

//    iIdentificador := 0;
//    QryDemonstrativoRel.First;

    pprRelHabINSS.DeviceType       := 'ExcelFile';
    pprRelHabINSS.TextFileName     := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\'+pChar(sNomeArquivo)+'.XLS';
    pprRelHabINSS.Print;

    //Renato Visoni SOL 142792 Kintana 916318
//    sListaMesProcessado.Destroy;
//    sListaMesProcessado := TStringList.Create();
    //Renato Visoni SOL 142792 Kintana 916318

    vBuffer := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\'+pChar(sNomeArquivo)+'.PDF';

    ShellExecute(Application.Handle, nil, PChar(vBuffer), nil, nil, SW_SHOWNORMAL);

end;

procedure TfrmCadProcHabINSS.ppDetailBand2BeforePrint(Sender: TObject);
var
steste: string;
begin
  inherited;
  steste := '1';
  steste := '1';
end;

procedure TfrmCadProcHabINSS.qryDetAfterScroll(DataSet: TDataSet);
var
vIDBENEFHABILITA :String;
i: integer;
begin
  inherited;
  {If (qryDet.RecordCount > 0) and (FlgIncluir) Then
  Begin
  sbtnInsDet.Enabled := True;
  sbtnAltDet.Enabled := True;
  sbtnExcluiDet.Enabled := True;
  End;}
end;

procedure TfrmCadProcHabINSS.dblkpcmbEstadoNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  inherited;
  Accept := LookupTable.Locate('SIGLACENTRAL', NewValue, [])
end;

procedure TfrmCadProcHabINSS.dblkpcmbNovaSitHabBfINSSNotInList(
  Sender: TObject; LookupTable: TDataSet; NewValue: String;
  var Accept: Boolean);
begin
  inherited;
  Accept := LookupTable.Locate('DESCRICAO', NewValue, [])
end;

procedure TfrmCadProcHabINSS.dblkpcmbBenefNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  inherited;
  Accept := LookupTable.Locate('NOME', NewValue, [])
end;

procedure TfrmCadProcHabINSS.FormShow(Sender: TObject);
begin
  //inherited;
  Icon := application.Icon;
end;

procedure TfrmCadProcHabINSS.dblkpcmbBenefExit(Sender: TObject);
begin
  inherited;

  If (MSseg.RetornouValor) or (MontaSelectBenef.RetornouValor) then begin
   If not (dblkpcmbBenef.Text = '') and not(sIdPessoa = '') then begin
     // DIB / DIP
     sSQL := 'SELECT DIB, DTINICIOCRED, idbeneficio FROM DETCONCINSS WHERE IDPESSOA = '+ sIdPessoa +' AND IDBENEFICIO = '+ qryLookBenef.FieldByName('IDBENEFICIO').AsString +' AND DTINICIOCRED is not null ORDER BY DIB, DTINICIOCRED DESC ' ;
     qryAux.Close;
     qryAux.SQl.Clear;
     qryAux.SQL.Add(sSQL);
     qryAux.Open;

     If not(qryAux.isempty) then begin
       qry.Edit;
       qry.FieldByName('DIB').AsString := qryAux.FieldByName('DIB').AsString;
       qry.Post;
       qry.Edit;
       qry.FieldByName('DIP').AsString := qryAux.FieldByName('DTINICIOCRED').AsString;
       qry.Post;
     {end else begin
       sSQL := 'SELECT DIB, DIP, idbeneficio FROM BENEFHABILITA WHERE IDPESSOA = '+ sIdPessoa +' AND IDBENEFICIO = '+ qryLookBenef.FieldByName('IDBENEFICIO').AsString +' AND DIP is not null ORDER BY DIB, DIP DESC ' ;
       qryAux.Close;
       qryAux.SQl.Clear;
       qryAux.SQL.Add(sSQL);
       qryAux.Open;

       If not(qryAux.isempty) then begin
         qry.Edit;
         qry.FieldByName('DIB').AsString := qryAux.FieldByName('DIB').AsString;
         qry.Post;
         qry.Edit;
         qry.FieldByName('DIP').AsString := qryAux.FieldByName('DIP').AsString;
         qry.Post;
       End;}
     End;

   End;
  End;

end;


procedure TfrmCadProcHabINSS.MSsegBeforeOpenCds(var sqlText: String;
  strListParams: TStringList);
begin
  inherited;
  //BRUNO AZEVEDO MANO DEU CERTO!!!
  {if Pos('LOWER(DT.MATRICULA)', sqlText) > 0 then begin
    sqlText := StringReplace(sqlText, 'ORDER BY C0 ASC', '', []);
    sqlText := sqlText + ' AND dt.idtitular = d.idpessoa ORDER BY C0 ASC'
  end else}
   If Pos('LOWER(D.MATRICULA)', sqlText) > 0 then begin
    sqlText := StringReplace(sqlText, 'ORDER BY C0 ASC', '', []);
    sqlText := sqlText + ' AND ( D.MATRICULA IS NOT NULL ) '
    //AND dt.idtitular <> d.idpessoa ORDER BY C0 ASC'
   end;
end;

procedure TfrmCadProcHabINSS.MontaSelectBenefBeforeOpenCds(
  var sqlText: String; strListParams: TStringList);
begin
  inherited;
  //BRUNO AZEVEDO MANO DEU CERTO!!!
  {if Pos('LOWER(DT.MATRICULA)', sqlText) > 0 then begin
    sqlText := StringReplace(sqlText, 'ORDER BY C0 ASC', '', []);
    sqlText := sqlText + ' AND dt.idtitular = d.idpessoa ORDER BY C0 ASC'
  end else}
  If Pos('LOWER(D.MATRICULA)', sqlText) > 0 then begin
    sqlText := StringReplace(sqlText, 'ORDER BY C0 ASC', '', []);
    sqlText := sqlText + ' AND ( D.MATRICULA IS NOT NULL ) '
    //AND dt.idtitular <> d.idpessoa ORDER BY C0 ASC'
  end;
end;

procedure TfrmCadProcHabINSS.dbeNumBDRPKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if ((key in ['0'..'9'] = false) and (word(key) <> vk_back) and (key <> '/')) then begin
    key := #0;
  end;
end;

procedure TfrmCadProcHabINSS.dbeNumBenefKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if ((key in ['0'..'9'] = false) and (word(key) <> vk_back)) then
  key := #0;
end;

procedure TfrmCadProcHabINSS.cdsDetAfterScroll(DataSet: TDataSet);
begin
  inherited;
  If (cdsDet.RecordCount > 0) and ((FlgIncluir) or (FlgEditar)) Then
  Begin
  sbtnInsDet.Enabled := True;
  sbtnAltDet.Enabled := True;
  sbtnExcluiDet.Enabled := True;
  End;
end;

//Início - Higor Nayde SOL 208130  KTN 2019369
procedure TfrmCadProcHabINSS.edtTempoAnoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
 if ((key in ['0'..'9'] = false) and (word(key) <> vk_back) and (key <> '/')) then begin
    key := #0;
  end;
end;

procedure TfrmCadProcHabINSS.edtTempoMesKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
 if ((key in ['0'..'9'] = false) and (word(key) <> vk_back) and (key <> '/')) then begin
    key := #0;
  end;
end;

procedure TfrmCadProcHabINSS.edtTempoDiaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
 if ((key in ['0'..'9'] = false) and (word(key) <> vk_back) and (key <> '/')) then begin
    key := #0;
  end;
end;
//Higor Nayde SOL 208130  KTN 2019369

//Início -  William Santana - SOL 208130 KTN 2019369
procedure TfrmCadProcHabINSS.edtINSSKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (key in ['0' .. '9', #8, #13, DecimalSeparator]) then
  begin
   if (Key = DecimalSeparator) and (Pos(DecimalSeparator, TEdit(Sender).Text) > 0) then
     Key := #0;

   if (Pos(DecimalSeparator, TEdit(Sender).Text) > 0) and (key <> #8) and
      (Length(Trim(Copy(TEdit(Sender).Text, Pos(DecimalSeparator, TEdit(Sender).Text ) + 1, 999))) >= 4) then
      Key := #0;
  end
  else Key := #0
end;

procedure TfrmCadProcHabINSS.edtIndiceReajusteKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (key in ['0' .. '9', #8, #13, DecimalSeparator]) then
  begin
   if (Key = DecimalSeparator) and (Pos(DecimalSeparator, TEdit(Sender).Text) > 0) then
     Key := #0;
  end
  else Key := #0
end;

procedure TfrmCadProcHabINSS.edtINSSExit(Sender: TObject);  // também é usado no edtIndiceReajusteExit
begin
  inherited;
  if (copy(trim(TEdit(Sender).Text),1,1) = DecimalSeparator) then
    TEdit(Sender).Text := '0'+ TEdit(Sender).Text;

end; 
//Término - Início -  William Santana - SOL 208130 KTN 2019369


//Término - Início -  William Santana - SOL 251599.17194 PPM 783173
procedure TfrmCadProcHabINSS.dbrgSentencaJudChange(Sender: TObject);
begin
  inherited;
  if (dbrgSentencaJud.ItemIndex = 0) then
  begin
     frmCadProcHabINSS.Height := 749;
     Panel1.Height            := 399;
     Panel2.Height            := 399;
     Panel3.Top               := 369;
     tbcDetalhe.Top           := 434;

     lblDtFinal.Visible       := true;
     tmpDATAFINAL.Visible     := true;
     lblObs.Visible           := true;
     dbmObs.Visible           := true;
  end
  else
  begin
     frmCadProcHabINSS.Height := 649;
     Panel1.Height            := 304;
     Panel2.Height            := 304;
     Panel3.Top               := 275;
     tbcDetalhe.Top           := 339;

     lblDtFinal.Visible       := false;
     tmpDATAFINAL.Visible     := false;
     tmpDATAFINAL.Text        := '';
     lblObs.Visible           := false;
     dbmObs.Visible           := false;
     dbmObs.Text              := '';
  end;
end;
//Término - Início -  William Santana - SOL 251599.17194 PPM 783173
end.
