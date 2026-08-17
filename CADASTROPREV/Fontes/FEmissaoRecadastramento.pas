unit FEmissaoRecadastramento;

// Alterações:
{---------------------------------------------------------------------------------------------------
Autor(a)  :
Data      :
Pendência :
Rotina    :
Descricao :
----------------------------------------------------------------------------------------------------
Autor(a)  : André Pontes
Data      : 25/07/2007
Pendência : 25783
Rotina    : -
Descricao : Ocorria access violation na chamada do frmProgresso, uma vez que o mesmo não constava
            no projeto nem, conseqüentemente, poderia estar criado
----------------------------------------------------------------------------------------------------
Autor(a)  : Ricardo Vigorito
Data      : 06/10/2003
Pendência :
Rotina    :
Descricao : Criacao do Parametro NumCartaRecad na montagem da  qyrauxilia, porque da forma anterior
            estava causando erro
----------------------------------------------------------------------------------------------------
Autor(a)  : Camille
Data      : 25/06/2006
Pendência :
Rotina    :
Descricao : Inclusao do Filtro de MULTI-FUNDACAO
----------------------------------------------------------------------------------------------------
Autor(a)  : Gleyber
Data      : 31/03/2003
Pendência : 11335
Rotina    : várias
Descricao : Permitir emissão de carta de agradecimento e falta de recadastramento.
---------------------------------------------------------------------------------------------------}

//	------------------------------------------------------------------------------------------------
//
//	Emissão de Cartas de Recadastramento
//
//	Autor          :  André Pontes
//	Data de Início	:  27/07/1999
//	Data de Término:  28/07/1999
//
//	Modificações	:  29/07/1999  -  Alteração na forma de atualização da Tabela BENEFBFCIARIO, em
//                                  função da baixa performance (deixou de ser feita a cada iteração
//                                  da qryBeneficiarios)
//                   09/08/1999  -  Verificação: DataLimite > DataEmissão
//                               -  Filtro por data de aniversário (no mesmo ano)
//                   11/08/1999  -  Carta-Padrão (configuração e impressão)
//                   12/08/1999  -  Etiquetas (configuração e impressão)
//         Augusto - 03/07/2002  -  Inclusão de novo filtro no Update da BENEFBFCIARIO
//         Augusto - 03/07/2002  -  Opção para enviar segunda via de documentos
//         Gleyber - 19/09/2002  -  Possibilitar geração de todas as patrocinadoras e todos benefícios;
//                                  Adicionar no txt Nº de dependentes e Data de Nascimento.
//         Gleyber - 16/10/2002  -  Fazendo com que a segunda via seja específica para um participante.
//         Gleyber - 25/10/2002  -  Adicionando rotina para salvar lay-out de carta digitada
//
// -------------------------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, ExtCtrls, Db, DBTables, Wwquery, Mask, ppBands, ppClass,
  ppStrtch, ppMemo, ppCtrls, ppPrnabl, ppCache, ppProd, ppReport, Menus,
  ppEndUsr, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, Wwdatsrc, fcButton,
  fcImgBtn, fcShapeBtn, StdCtrls, wwdbdatetimepicker, CMDateTimePicker,
  wwdblook, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97,
  TREdit,  ppForms, dbClient,
  ppDsgnCt, ppUtils, ppSubRpt, ppRuler, ppViewr, ppRegion, ppPrintr,
  ppTmplat, Printers, CMDBLookupCombo, pptypes, ppBarCod, ppModule,
  daDataModule, ppVar, CheckLst, MontaSelect;

type
  TfrmEmiteRecadastramento = class(TfrmOkCancelar)
    qryLookPatrocinadora: TwwQuery;
    qryLookBeneficio: TwwQuery;
    rdgGeracao: TRadioGroup;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DBcboPatrocinadora: TwwDBLookupCombo;
    DBcboBeneficio: TwwDBLookupCombo;
    DBcboEstado: TwwDBLookupCombo;
    DBcboPais: TwwDBLookupCombo;
    Label5: TLabel;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    edtDataAniIni: TCMDateTimePicker;
    edtDataAniFim: TCMDateTimePicker;
    Label4: TLabel;
    GroupBox2: TGroupBox;
    edtInicialIni: TEdit;
    qryLookPais: TwwQuery;
    qryLookPaisNOMEPAIS: TStringField;
    qryLookPaisIDPAIS: TFloatField;
    qryLookEstado: TwwQuery;
    qryLookEstadoNOMEESTADO: TStringField;
    qryLookEstadoCODESTADO: TStringField;
    qryLookEstadoIDPAIS: TFloatField;
    qryBeneficiarios: TwwQuery;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    DBcboDocumento: TwwDBLookupCombo;
    edtInicialFim: TEdit;
    Label7: TLabel;
    edtDataLimite: TCMDateTimePicker;
    Label10: TLabel;
    SaveDialog: TSaveDialog;
    edtCarta: TEdit;
    Label11: TLabel;
    edtDataEmissao: TCMDateTimePicker;
    Label12: TLabel;
    ToolbarSep972: TToolbarSep97;
    qryTipoDoc: TwwQuery;
    qryTipoDocIDDOCUMENTO: TFloatField;
    qryTipoDocNOMEDOCUMENTO: TStringField;
    qryBeneficiariosIdentidade: TStringField;
    qryBeneficiariosOrgao: TStringField;
    qryDocumento: TwwQuery;
    qryDocumentoNUMDOCUMENTO: TStringField;
    qryDocumentoORGAO: TStringField;
    qryDocumentoDATAEMISSAO: TDateTimeField;
    qryDocumentoUF: TStringField;
    qryAtualiza: TwwQuery;
    qryLookPatrocinadoraIDPESSOA: TFloatField;
    qryLookPatrocinadoraNOME: TStringField;
    qryLookPatrocinadoraRAZAOSOCIAL: TStringField;
    qryLookBeneficioIDBENEFICIO: TFloatField;
    qryLookBeneficioIDEVENTOGERADOR: TFloatField;
    qryLookBeneficioCODNATUREZA: TStringField;
    qryLookBeneficioIDTPPAGTOBENEFIC: TFloatField;
    qryLookBeneficioNOME: TStringField;
    qryLookBeneficioFLGDESTBENEF: TStringField;
    qryLookBeneficioFLGBENEFOBRIGATO: TFloatField;
    qryLookBeneficioCODBENEFICIO: TStringField;
    qryLookBeneficioNUMORDEMEVENTO: TFloatField;
    qryLookBeneficioFLGRESGATE: TFloatField;
    qryLookBeneficioFLGBENEFTEMP: TFloatField;
    qryLookBeneficioFLGBENEFPROV: TFloatField;
    qryLookBeneficioFLGPECULIO: TFloatField;
    qryLookBeneficioCODBENEFSPC: TStringField;
    btnModeloCarta: TfcShapeBtn;
    qryReports: TwwQuery;
    qryReportsNAME: TStringField;
    qryReportsIDREPORTS: TFloatField;
    qryReportsORIGEMCM: TFloatField;
    qryReportsTEMPLATE: TBlobField;
    dsConsulta: TwwDataSource;
    qrySQL: TwwQuery;
    ppRelatorio: TppBDEPipeline;
    DsgnCM: TppDesigner;
    MergeMenu: TMainMenu;
    mniFile: TMenuItem;
    mniFileSave: TMenuItem;
    mniFileLine3: TMenuItem;
    mniFilePageSetup: TMenuItem;
    mniFilePrintToFileSetup: TMenuItem;
    mniFileLine4: TMenuItem;
    mniFilePrint: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    MnuRlatorio: TMenuItem;
    MnuTitulo: TMenuItem;
    MnuSumario: TMenuItem;
    N2: TMenuItem;
    MnuCabecalho: TMenuItem;
    MnuRodape: TMenuItem;
    N3: TMenuItem;
    MnuGrupos: TMenuItem;
    MnuLInha: TMenuItem;
    MnuRetrato: TMenuItem;
    MnuPaisagem: TMenuItem;
    N5: TMenuItem;
    MnuUnidades: TMenuItem;
    MnuPixelsTela: TMenuItem;
    MnuPixelsImpressora: TMenuItem;
    MnuPolegada: TMenuItem;
    MnuMilimetros: TMenuItem;
    MnuMMilimetros: TMenuItem;
    qryModelo: TwwQuery;
    qryModeloIDCARTACOBRANCA: TFloatField;
    qryModeloMODELOCARTA: TStringField;
    qryModeloIDREPORTS: TFloatField;
    qryModeloORIGEMCM: TFloatField;
    qryModeloFLGTIPOCARTA: TStringField;
    updModelo: TUpdateSQL;
    rptImprime: TppReport;
    pplImprime: TppBDEPipeline;
    dsBeneficiario: TwwDataSource;
    qryBeneficiariosCarta: TStringField;
    qryBeneficiariosDataEmissaoExtensa: TStringField;
    qryBeneficiariosDataLimite: TDateField;
    qrySQLIdentidade: TStringField;
    qrySQLOrgao: TStringField;
    qrySQLCarta: TStringField;
    qrySQLDataEmissaoExtensa: TStringField;
    qrySQLDataLimite: TDateField;
    memReports: TMemo;
    btnModeloEtiqueta: TfcShapeBtn;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    Label13: TLabel;
    Bevel1: TBevel;
    qryModeloEtiq: TwwQuery;
    qryModeloEtiqMODELOETIQ: TStringField;
    qryModeloEtiqIDETIQUETA: TFloatField;
    qryModeloEtiqIDREPORTS: TFloatField;
    qryModeloEtiqORIGEMCM: TFloatField;
    DBcboEtiqueta: TwwDBLookupCombo;
    qryLookEstadoIDESTADO: TFloatField;
    GroupBox5: TGroupBox;
    cmbTipoEndereco: TComboBox;
    btnDVR: TfcShapeBtn;
    rptDvr: TppReport;
    ppDVR: TppBDEPipeline;
    rptDvrShape1: TppShape;
    rptDvrLabel2: TppLabel;
    rptDvrDBText1: TppDBText;
    rptDvrLabel3: TppLabel;
    rptDvrDBText2: TppDBText;
    rptDvrLabel4: TppLabel;
    rptDvrDBText3: TppDBText;
    rptDvrLabel5: TppLabel;
    rptDvrDBText4: TppDBText;
    rptDvrDBText5: TppDBText;
    rptDvrLabel6: TppLabel;
    rptDvrLabel7: TppLabel;
    rptDvrDBText6: TppDBText;
    rptDvrLabel8: TppLabel;
    rptDvrDBText7: TppDBText;
    rptDvrLabel9: TppLabel;
    rptDvrDBText8: TppDBText;
    qryBeneficiariosBeneficio2: TStringField;
    QryBenef: TwwQuery;
    rptDvrShape2: TppShape;
    rptDvrLabel10: TppLabel;
    rptDvrShape3: TppShape;
    rptDvrDBText9: TppDBText;
    rptDvrLabel11: TppLabel;
    rptDvrShape4: TppShape;
    rptDvrLabel12: TppLabel;
    rptDvrShape5: TppShape;
    rptDvrLabel13: TppLabel;
    rptDvrShape6: TppShape;
    rptDvrLabel14: TppLabel;
    rptDvrShape7: TppShape;
    rptDvrShape8: TppShape;
    rptDvrLabel15: TppLabel;
    rptDvrLabel16: TppLabel;
    rptDvrShape9: TppShape;
    rptDvrLabel17: TppLabel;
    rptDvrShape10: TppShape;
    rptDvrLabel18: TppLabel;
    rptDvrShape11: TppShape;
    rptDvrLabel19: TppLabel;
    rptDvrShape12: TppShape;
    rptDvrLabel20: TppLabel;
    rptDvrLabel21: TppLabel;
    rptDvrShape13: TppShape;
    rptDvrLabel22: TppLabel;
    rptDvrLabel23: TppLabel;
    rptDvrLabel24: TppLabel;
    rptDvrLabel25: TppLabel;
    rptDvrShape14: TppShape;
    rptDvrShape15: TppShape;
    rptDvrShape16: TppShape;
    rptDvrShape17: TppShape;
    rptDvrLabel26: TppLabel;
    rptDvrLabel27: TppLabel;
    rptDvrShape18: TppShape;
    rptDvrLabel28: TppLabel;
    rptDvrShape19: TppShape;
    rptDvrLabel29: TppLabel;
    rptDvrShape23: TppShape;
    rptDvrLabel33: TppLabel;
    rptDvrShape24: TppShape;
    rptDvrLabel34: TppLabel;
    rptDvrShape25: TppShape;
    rptDvrLabel35: TppLabel;
    rptDvrShape26: TppShape;
    rptDvrLabel36: TppLabel;
    rptDvrShape27: TppShape;
    rptDvrLabel37: TppLabel;
    rptDvrShape28: TppShape;
    rptDvrLabel38: TppLabel;
    rptDvrShape29: TppShape;
    rptDvrShape30: TppShape;
    rptDvrLabel39: TppLabel;
    rptDvrLabel40: TppLabel;
    rptDvrShape31: TppShape;
    rptDvrLabel41: TppLabel;
    rptDvrShape32: TppShape;
    rptDvrLabel42: TppLabel;
    rptDvrShape20: TppShape;
    rptDvrLabel30: TppLabel;
    rptDvrShape21: TppShape;
    rptDvrLabel31: TppLabel;
    rptDvrShape22: TppShape;
    rptDvrLabel32: TppLabel;
    rptDvrLabel43: TppLabel;
    rptDvrShape33: TppShape;
    rptDvrMemo1: TppMemo;
    rptDvrShape34: TppShape;
    rptDvrLabel44: TppLabel;
    rptDvrShape35: TppShape;
    rptDvrLabel45: TppLabel;
    rptDvrLabel46: TppLabel;
    rptDvrShape36: TppShape;
    rptDvrLabel47: TppLabel;
    rptDvrLabel49: TppLabel;
    rptDvrLabel50: TppLabel;
    rptDvrShape37: TppShape;
    rptDvrShape39: TppShape;
    rptDvrShape40: TppShape;
    rptDvrShape38: TppShape;
    rptDvrShape41: TppShape;
    rptDvrLabel48: TppLabel;
    rptDvrLabel51: TppLabel;
    rptDvrLabel1: TppLabel;
    rptDvrShape42: TppShape;
    rptDvrLabel52: TppLabel;
    qryBeneficiariosIDPESSOA: TFloatField;
    qryBeneficiariosIDPESSJUR: TFloatField;
    qryBeneficiariosIDTITULAR: TFloatField;
    qryBeneficiariosNOME: TStringField;
    qryBeneficiariosNOMEFANTASIA: TStringField;
    qryBeneficiariosCPF: TStringField;
    qryBeneficiariosMATRICULA: TStringField;
    qryBeneficiariosLOGRADOURO: TStringField;
    qryBeneficiariosNUMERO: TStringField;
    qryBeneficiariosCOMPLEMENTO: TStringField;
    qryBeneficiariosBAIRRO: TStringField;
    qryBeneficiariosCEP: TStringField;
    qryBeneficiariosCIDADE: TStringField;
    qryBeneficiariosIDPAIS: TFloatField;
    qryBeneficiariosIDESTADO: TFloatField;
    qryBeneficiariosCODESTADO: TStringField;
    qryBeneficiariosDATANASC: TDateTimeField;
    qryBeneficiariosIDBENEFICIO: TFloatField;
    qryBeneficiariosIDENDERECO: TFloatField;
    qryBeneficiariosBENEFICIO: TStringField;
    qrySQLIDPESSOA: TFloatField;
    qrySQLIDPESSJUR: TFloatField;
    qrySQLIDTITULAR: TFloatField;
    qrySQLNOME: TStringField;
    qrySQLCPF: TStringField;
    qrySQLMATRICULA: TStringField;
    qrySQLLOGRADOURO: TStringField;
    qrySQLNUMERO: TStringField;
    qrySQLCOMPLEMENTO: TStringField;
    qrySQLBAIRRO: TStringField;
    qrySQLCEP: TStringField;
    qrySQLCIDADE: TStringField;
    qrySQLCODESTADO: TStringField;
    qrySQLIDPAIS: TFloatField;
    qrySQLDATANASC: TDateTimeField;
    qryBeneficiariosANIVERSARIO: TStringField;
    ppRptCarta: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppConsulta: TppBDEPipeline;
    ppLabel93: TppLabel;
    ppLine53: TppLine;
    rpCartaInadimplDBImage1: TppDBImage;
    rpCartaInadimplLabel1: TppLabel;
    rpCartaInadimplDBText1: TppDBText;
    rpCartaInadimplDBText2: TppDBText;
    rpCartaInadimplDBText3: TppDBText;
    rpCartaInadimplDBText4: TppDBText;
    rpCartaInadimplDBText5: TppDBText;
    rpCartaInadimplDBText6: TppDBText;
    rpCartaInadimplDBText8: TppDBText;
    rpCartaInadimplLabel2: TppLabel;
    rpCartaInadimplLabel4: TppLabel;
    rpCartaInadimplLabel7: TppLabel;
    rpCartaInadimplLabel9: TppLabel;
    rpCartaInadimplLblData: TppLabel;
    rpCartaInadimplLabel11: TppLabel;
    rpCartaInadimplLine1: TppLine;
    rpCartaInadimplLabel12: TppLabel;
    ppLine54: TppLine;
    ppLabel129: TppLabel;
    ppCalc46: TppSystemVariable;
    ppCalc47: TppSystemVariable;
    ChLstOpcoes: TCheckListBox;
    Label9: TLabel;
    QryAux: TwwQuery;
    qryBeneficiariosNUMDEPEND: TFloatField;
    MontaSelect: TMontaSelect;
    grb2Via: TGroupBox;
    ChBx2Via: TCheckBox;
    edtNomeBenef: TEdit;
    bbtnProcurar: TBitBtn;
    Label14: TLabel;
    ckbArqTexto: TCheckBox;
    qrySQLCODIGO_DE_BARRAS: TStringField;
    chklstBeneficios: TCheckListBox;

    // função de manipulação de strings
    function CompletaInicio(sOriginal, sCompleta: string; iLimiteTamanho: word): string;
    function CompletaFim(sOriginal, sCompleta: string; iLimiteTamanho: word): string;
    function DataExtenso(dData: TDateTime): string;

    // procedimentos definidos
    function DefineEscopo: boolean;
    procedure EmiteCartas;

    function VerificaPreenchimento: boolean;

    
    procedure DBcboPaisCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure edtInicialIniKeyPress(Sender: TObject; var Key: Char);
    procedure edtInicialFimKeyPress(Sender: TObject; var Key: Char);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBcboPatrocinadoraCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure qryBeneficiariosCalcFields(DataSet: TDataSet);
    procedure DBcboDocumentoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBcboPatrocinadoraExit(Sender: TObject);
    procedure btnModeloCartaClick(Sender: TObject);

    procedure mniFileSaveClick(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure mniFilePrintToFileSetupClick(Sender: TObject);
    procedure mniFilePrintClick(Sender: TObject);
    procedure mniFilePageSetupClick(Sender: TObject);
    procedure DsgnCMCreate(Sender: TObject);
    procedure btnModeloEtiquetaClick(Sender: TObject);
    procedure cmbTipoEnderecoChange(Sender: TObject);
    procedure btnDVRClick(Sender: TObject);
    procedure SetaDadosRptAux(Var Relatorio: TppReport; Var Pipeline: TPPBdePipeline;sTemplate: String);
    procedure ChBx2ViaClick(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure ckbArqTextoClick(Sender: TObject);

  private { Private declarations }
   bBenef, bPatro: boolean;
   rptEtiqCM: TppReport;
   bCriaTemplate, bCriaTemplate2 : Boolean;
   Fmodelo: TStrings;
   Procedure CriaLista(ChkList:TCheckListBox; Query:TwwQuery;
                       Lista: TStringList; Chave, Descricao:String);


  public { Public declarations }
    LstOpcoes : TStringList;
  end;

var
  frmEmiteRecadastramento: TfrmEmiteRecadastramento;
  vParam : String;

implementation
{$R *.DFM}
Uses
   USistema, UMensErro, UDatabase, DBaseDados, UVerificaPreenchimento, FProgresso, UData,
   uModeloRelatCM, uFuncaoGeral, uEtiquetaCM, FTelaAut, uCtrlPadroes,
   UAdmPrev;


function TfrmEmiteRecadastramento.CompletaInicio(sOriginal, sCompleta: string; iLimiteTamanho: word): string;
var
  i, iRepeticoes : integer;
  sAux : string;
begin
   sAux := '';

   iRepeticoes := iLimiteTamanho - length(sOriginal);

   for i := 1 to iRepeticoes do sAux := sAux + sCompleta;

   Result := sAux + sOriginal;
end;



function TfrmEmiteRecadastramento.CompletaFim(sOriginal, sCompleta: string; iLimiteTamanho: word): string;
var
  i, iRepeticoes : integer;
  sAux : string;
begin
   sAux := '';

   iRepeticoes := iLimiteTamanho - length(sOriginal);

   for i := 1 to iRepeticoes do sAux := sAux + sCompleta;

   Result := sOriginal + sAux;
end;



function TfrmEmiteRecadastramento.DataExtenso(dData: TDateTime): string;
var
   iAno, iMes, iDia: word;
   sAno, sMesExtenso, sDia: string;
begin
   DecodeDate(dData, iAno, iMes, iDia);

   sAno  := IntToStr(iAno);

   Case iMes of
      1  : sMesExtenso := 'janeiro';
      2  : sMesExtenso := 'fevereiro';
      3  : sMesExtenso := 'março';
      4  : sMesExtenso := 'abril';
      5  : sMesExtenso := 'maio';
      6  : sMesExtenso := 'junho';
      7  : sMesExtenso := 'julho';
      8  : sMesExtenso := 'agosto';
      9  : sMesExtenso := 'setembro';
      10 : sMesExtenso := 'outubro';
      11 : sMesExtenso := 'novembro';
      12 : sMesExtenso := 'dezembro';
   end;

   sDia  := IntToStr(iDia);
   if length(sDia) = 1 then sDia := '0' + sDia;

   Result := sDia + ' de ' + sMesExtenso + ' de ' + sAno;
end;



function TfrmEmiteRecadastramento.DefineEscopo: boolean;
var
   dDataIni, dDataFim : TDateTime;
   bExiste, bFiltraAni: boolean;
   sOpcoes, sIdBeneficio : String;
   W, iContRub, i : Integer;
begin
   Result      := True;

   bExiste     := False;
   bBenef      := False;
   bPatro      := False;

   bFiltraAni  := (
                  (edtDataAniIni.Date > 0) and
                  (edtDataAniFim.Date > 0) and
                  (edtDataAniFim.Date >= edtDataAniIni.Date)
                  );

   dDataIni    := edtDataAniIni.Date;
   dDataFim    := edtDataAniFim.Date;

   

   frmProgresso.MostraFormProgresso('Selecionando Beneficiários...', False, False, False,0,0);

   try
      

      { Monta linha com opcoes }
      sOpcoes := '';
      { Guarda as opcoes escolhidas }
      For W := 0 To (ChLstOpcoes.Items.Count-1) Do Begin
        If ChLstOpcoes.Checked[W] = True Then Begin
          sOpcoes := sOpcoes + LstOpcoes.Strings[W]+ ', '  ;
        End;
      End;
      { Acerta diferenca na lista }
      sOpcoes := Copy(Trim(sOpcoes),1,(Length(Trim(sOpcoes))-1));

      
      // -- Selecão do escopo (Beneficiários)

      try
         with qryBeneficiarios do begin
            Close;
            SQL.Text :=
            '  SELECT DISTINCT' +
            '     BF.IDRESPONSAVEL AS IDPESSOA, B.IDPESSJUR, B.IDTITULAR,  ' +
            '     P.NOME, P.RAZAOSOCIAL AS NOMEFANTASIA, P.NUMDOCUMENTO AS CPF, ' +
            '     E.MATRICULA, EP.LOGRADOURO, EP.NUMERO, EP.COMPLEMENTO, ' +
            '     EP.BAIRRO, EP.CEP, EP.CIDADE, EP.IDPAIS, EP.IDESTADO, EP.CODESTADO, ' +
            '     PF.DATANASC, TO_CHAR(PF.DATANASC, ''DD/MM'') AS ANIVERSARIO, B.IDBENEFICIO, EP.IDENDERECO, '+
            '     BN.NOME AS BENEFICIO, '+QuotedStr(' ')+' AS CONTATO, '+  // Gleyber - 26/06/2003
            
            '     ND.NUMDEPEND  '+
            
            '  FROM ' +
            '     BENEFBFCIARIO B, BFCIARIOTITPLAN BF, PESSOA P, ELEGPATRO E, PESSOAFISICA PF, BENEFICIO BN,  ' +
            '     ( SELECT P.IDPESSOA, E.LOGRADOURO, E.NUMERO, E.COMPLEMENTO, E.CEP, E.IDENDERECO, '+
            '              E.BAIRRO, C.NOME CIDADE, ES.NOMEESTADO ESTADO, PA.NOMEPAIS PAIS, ES.IDESTADO, '+
            '              ES.CODESTADO, PA.IDPAIS '+
            '       FROM PESSOA P, ENDPESS E, CIDADES C, ESTADO ES, PAIS PA '+
	         
            '       WHERE (P.IDPESSOA = E.IDPESSOA) '+
            '         AND (E.IDCIDADES = C.IDCIDADES(+)) '+
            '         AND (C.IDESTADO = ES.IDESTADO(+)) '+
            '         AND (PA.IDPAIS(+) = ES.IDPAIS) ) EP, '+
            
            '     ( SELECT IDTITULAR, COUNT(*) AS NUMDEPEND '+
            '       FROM DEPENTIT                           '+
            '       WHERE IDTITULAR <> IDPESSOA             '+
            '       GROUP BY IDTITULAR ) ND                 ';
            
            SQL.Text := SQL.Text + '  WHERE ';


            if ( (DBcboPais.LookupValue <> '') and (length(trim(DBcboPais.Text)) > 0) ) then begin
               bExiste := True;
               SQL.Text := SQL.Text + '     ( EP.IDPAIS = ' + DBcboPais.LookupValue + ' ) ';
            end;

            if ( (DBcboEstado.LookupValue <> '') and (length(trim(DBcboEstado.Text)) > 0) ) then begin
               if bExiste then
                  SQL.Text := SQL.Text + ' AND ';
               bExiste := True;
               SQL.Text := SQL.Text + '     ( EP.IDESTADO = '+ DBcboEstado.LookupValue + ' ) ';
            end;

            if ( (DBcboPatrocinadora.LookupValue <> '') and (length(trim(DBcboPatrocinadora.Text)) > 0) ) then begin
               bPatro := True;
               if bExiste then
                  SQL.Text := SQL.Text + ' AND ';
               bExiste := True;
               SQL.Text := SQL.Text + '     ( B.IDPESSJUR = ' + DBcboPatrocinadora.LookupValue + ' ) ';
            end;

            
            sIdBeneficio  := '';
            iContRub      := 0;
            // Preencher Benefícios selecionadas
            for i := 0 to chklstBeneficios.Items.Count - 1 do
            begin
               if not chklstBeneficios.checked[i] then continue;
               if not qryLookBeneficio.Locate('NOME',chklstBeneficios.Items[i],[loCaseInsensitive,loPartialKey])
               then continue;
               if iContRub > 0 Then Begin
                  sIdBeneficio  := sIdBeneficio  + ',' ;
               end;
               // Adicionar string dos Benefícios
               sIdBeneficio  := sIdBeneficio  + InttoStr(qryLookBeneficio.FieldByName('IdBeneficio').AsInteger);
               inc(iContRub);
            end;  
            

            if ( (DBcboBeneficio.LookupValue <> '') and (length(trim(DBcboBeneficio.Text)) > 0) ) then begin
            bBenef := True;
                   if bExiste then
                      SQL.Text := SQL.Text + ' AND ';
                   bExiste := True;

                   SQL.Text := SQL.Text +'     ( B.IDBENEFICIO IN ( ' + sIdBeneficio + ' ) ';
            end;

            if bFiltraAni then begin
               if bExiste then
                  SQL.Text := SQL.Text + ' AND ';
               bExiste := True;
               SQL.Text := SQL.Text +'     TO_CHAR(PF.DATANASC, ''DD/MM'') BETWEEN TO_CHAR(:DATAINI, ''DD/MM'') AND TO_CHAR(:DATAFIM, ''DD/MM'') ';
            end;

            if ( (length(edtInicialIni.Text) > 0) and (length(edtInicialFim.Text) > 0) ) then begin
               if bExiste then
                  SQL.Text := SQL.Text + ' AND ';
               bExiste := True;
               SQL.Text := SQL.Text +'     ( SUBSTR(P.NOME, 1, 1) BETWEEN ''' +
                           edtInicialIni.Text + ''' AND ''' + edtInicialFim.Text + ''' ) ';
            end;

            If (ChBx2Via.Checked) and (MontaSelect.RetornouValor) then begin
               if bExiste then
                  SQL.Text := SQL.Text + ' AND ';
               bExiste := True;
               SQL.Text := SQL.Text +'     ( B.IDPESSOA = '+MontaSelect.ValoresChave[0]+' ) ';
            end;


             if bExiste then
               SQL.Text := SQL.Text + '     AND ';

            SQL.Text := SQL.Text +

            '         ( B.IDSITBENEFICIO = 1 ) '+
            'AND     (BF.IDPESSJUR     = B.IDPESSJUR )    '+
            'AND     (BF.IDTITULAR     = B.IDTITULAR )    '+
            'AND     (BF.IDPLANOORIGEM = B.IDPLANOORIGEM )'+
            'AND     (BF.IDPESSOA      = B.IDPESSOA )     '+
            'AND     (BF.SEQPROPOSTA   = 1)               '+
            'AND     (BF.IDPLANOPREV   = B.IDPLANOPREV )  '+
            'AND     (BF.IDBENEFICIO   = B.IDBENEFICIO)   '+
            '     AND ( B.IDPESSJUR = E.IDPESSJUR ) '+
            '     AND ( B.IDTITULAR = E.IDPESSOA ) '+
            '     AND ( B.IDBENEFICIO = BN.IDBENEFICIO ) '+
            '     AND ( BF.IDRESPONSAVEL = EP.IDPESSOA ) '+
            '     AND ( BF.IDRESPONSAVEL = PF.IDPESSOA ) '+
            '     AND ( BF.IDRESPONSAVEL = P.IDPESSOA ) '+
            '     AND ( NOT BN.TIPOBENEFICIO = 99 ) '+ 

            
            '     AND (B.IDTITULAR = ND.IDTITULAR(+)) ';
            

         
            
            Case rdgGeracao.ItemIndex of
               0 : If ChBx2Via.Checked      // Para Carta de Recadastramento
                    Then SQL.Text := SQL.Text +
                         ' AND (B.FLGSTATUS = ''P'') '+
                         ' AND (B.DATARECEBRECAD IS NULL ) ';
               2 : SQL.Text := SQL.Text +   // Para Carta de Agradecimento
                               ' AND (B.FLGSTATUS = ''N'') '+
                               ' AND (B.DATARECEBRECAD IS NOT NULL ) ';
               3 : SQL.Text := SQL.Text +   // Para Carta de Falta de Recadastramento
                               ' AND (B.FLGSTATUS = ''P'') '+
                               ' AND (B.DATARECEBRECAD IS NULL ) ';
             End;
            



           
            If Trim(SOpcoes) <> '' Then begin
              SQL.Text := SQL.Text +
                ' AND (B.IDTPPAGTOBENEFIC IN ('+sOpcoes+')) ';
            End;
            

            Case cmbTipoEndereco.ItemIndex of
                  0 : SQL.Text := SQL.Text +' AND (P.IDENDCORRESP = EP.IDENDERECO)     ';
                  1 : SQL.Text := SQL.Text +' AND (P.IDENDCOMERCIAL = EP.IDENDERECO)   ';
                  2 : SQL.Text := SQL.Text +' AND (P.IDENDENTREGA = EP.IDENDERECO)     ';
                  3 : SQL.Text := SQL.Text +' AND (P.IDENDRESIDENCIAL = EP.IDENDERECO) ';
                  4 : SQL.Text := SQL.Text +' AND (P.IDENDCOBRANCA = EP.IDENDERECO)    ';
                  else begin
                       SQL.Text := SQL.Text + ' AND  '+
                                ' (( EP.IDENDERECO = P.IDENDCORRESP ) OR ( EP.IDENDERECO = P.IDENDCOMERCIAL ) OR '+
                                ' ( EP.IDENDERECO = P.IDENDENTREGA ) OR ( EP.IDENDERECO = P.IDENDRESIDENCIAL ) OR '+
                                ' ( EP.IDENDERECO = P.IDENDCOBRANCA ))';
                  end;
            End;

            Sql.Text := Sql.Text + ' ORDER BY P.NOME';

            if bFiltraAni then begin
               ParamByName('DATAINI').DataType     := ftDateTime;
               ParamByName('DATAFIM').DataType     := ftDateTime;
               ParamByName('DATAINI').asDateTime   := dDataIni;
               ParamByName('DATAFIM').asDateTime   := dDataFim;
            end;
            Open;
         end;

         if qryBeneficiarios.isEmpty then begin
            Result := False;
            Screen.Cursor := crHourGlass;
            MsgDlg('Não há Beneficiários que satisfaçam os critérios selecionados.', 'Informação', mtInformation, [mbOk], 0);
            Repaint;
            Exit;
         end;

   

         with qryAtualiza do begin
            Close;

            SQL.Text :=
            '  UPDATE  BENEFBFCIARIO ' +
            '  SET     NUMCARTARECAD = :NUMCARTARECAD, '  +
            '          DATAEMISSAORECAD =:DATAEMISSAO, ' +
            '          DATALIMITERECAD =:DATALIMITE, ' +
            '          FLGSTATUS = ''P'' ' +
            '  WHERE  ( IDPESSOA =:BENEFICIARIO ) '+
            '     AND ( IDSITBENEFICIO = 1 )  '; 

            if bBenef then SQL.Text := SQL.Text +
            '     AND ( IDBENEFICIO =:BENEFICIO ) ';

            if bPatro then SQL.Text := SQL.Text +
            '     AND ( IDPESSJUR =:PATRO ) ';

      
            if bBenef then
                      ParamByName('BENEFICIO').DataType   := ftInteger;
            if bPatro then
               ParamByName('PATRO').DataType       := ftInteger;

            Prepare;

 
            ParamByName('DATAEMISSAO').AsDate  := edtDataEmissao.Date;
            ParamByName('DATALIMITE').AsDate   := edtDataLimite.Date;
            ParamByName('NUMCARTARECAD').AsString :=   edtCarta.Text;
            if bBenef then
               ParamByName('BENEFICIO').asInteger  := StrToInt(DBcboBeneficio.LookupValue);
            if bPatro then
               ParamByName('PATRO').asInteger      := StrToInt(DBcboPatrocinadora.LookupValue);

         end;

      except
         Screen.Cursor := crDefault;
         Raise;
         Repaint;
      end;

   finally
      frmProgresso.EscondeFormProgresso;
   end;
end;



procedure TfrmEmiteRecadastramento.EmiteCartas;
var
   vEnd, vSql, sLinha, sAviso : string;
   arquivo: TextFile;
   i: longint;
   vPar : Variant;
begin
   Case cmbTipoEndereco.ItemIndex of
        0 : vEnd := '(P.IDENDCORRESP = E.IDENDERECO)     ';
        1 : vEnd := '(P.IDENDCOMERCIAL = E.IDENDERECO)   ';
        2 : vEnd := '(P.IDENDENTREGA = E.IDENDERECO)     ';
        3 : vEnd := '(P.IDENDRESIDENCIAL = E.IDENDERECO) ';
        4 : vEnd := '(P.IDENDCOBRANCA = E.IDENDERECO)    ';
   End;



   if (ckbArqTexto.Checked) and (rdgGeracao.ItemIndex <> 1)
   then begin 
      if not SaveDialog.Execute then Exit;
      Repaint;
      AssignFile(arquivo, SaveDialog.FileName);
      Rewrite(arquivo);

      
      try
         
         i := 1;
         frmProgresso.MostraFormProgresso('Gerando arquivo...', False, False, True, i, qryBeneficiarios.RecordCount);
         with qryBeneficiarios do
         begin
            First;
            while not EOF do
            begin
               with qryAtualiza do begin
                    If rdgGeracao.ItemIndex = 0
                     Then Begin
                         Close;
                         ParamByName('BENEFICIARIO').asInteger := qryBeneficiarios.FieldByName('IDPESSOA').asInteger;
                         ExecSQL;
                     End;
               end;
               sLinha := '';
               sLinha := sLinha + CompletaInicio(edtCarta.Text, ' ', 4);                                                     { 4}
               sLinha := sLinha + CompletaFim(DataExtenso(edtDataEmissao.Date), ' ', 23);                                    {23}
               sLinha := sLinha + CompletaFim(FieldByName('MATRICULA').asString, ' ', 13);                                   {13}
               sLinha := sLinha + Copy(CompletaFim(FieldByName('NOME').asString, ' ', 50), 1, 50);                           {50}
               sLinha := sLinha + Copy(CompletaFim(FieldByName('IDENTIDADE').asString, ' ', 10), 1, 10);                     {10}
               sLinha := sLinha + Copy(CompletaFim(FieldByName('ORGAO').asString, ' ', 6), 1, 6);                            { 6}
               sLinha := sLinha + Copy(CompletaFim(FieldByName('CPF').asString, ' ', 11), 1, 11);                            {11}
               sLinha := sLinha + DateToStr(edtDataLimite.Date);                                                             {10}
               sLinha := sLinha + Copy(CompletaFim(FieldByName('LOGRADOURO').asString, ' ', 60), 1, 60);                     {60}
               sLinha := sLinha + Copy(CompletaFim(FieldByName('NUMERO').asString, ' ', 8), 1, 8);                           { 8}
               sLinha := sLinha + Copy(CompletaFim(FieldByName('COMPLEMENTO').asString, ' ', 20), 1, 20);                    {20}
               sLinha := sLinha + Copy(CompletaFim(FieldByName('BAIRRO').asString, ' ', 20), 1, 20);                         {20}
               sLinha := sLinha + Copy(CompletaFim(FieldByName('CIDADE').asString, ' ', 20), 1, 20);                         {20}
               sLinha := sLinha + Copy(CompletaFim(FieldByName('CODESTADO').asString, ' ', 3), 1, 3);                        { 3}
               sLinha := sLinha + Copy(FieldByName('CEP').asString, 1, 5) + '-' + Copy(FieldByName('CEP').asString, 6, 3);   { 9}
               sLinha := sLinha + ' ';                                                                                       { 1}
               sLinha := sLinha + CompletaFim(FieldByName('DATANASC').asString, ' ', 12);                                    {12}
               If FieldByName('NUMDEPEND').AsInteger > 0
                Then sLinha := sLinha + CompletaFim(FieldByName('NUMDEPEND').asString, ' ', 3)
                Else sLinha := sLinha + CompletaFim('0', ' ', 3);                                                            { 3}
               WriteLn(arquivo, sLinha);
               Next;
               inc(i);
               frmProgresso.AndaFormProgresso(i);
               Application.ProcessMessages;
            end;
         end;
      finally
         CloseFile(arquivo);
         frmProgresso.EscondeFormProgresso;
         qryBeneficiarios.Close;
      end;
   end
   else begin
      qryBeneficiarios.First;
      while not qryBeneficiarios.Eof do
      begin
         with qryAtualiza do
         begin
             Close;
             ParamByName('BENEFICIARIO').asInteger := qryBeneficiarios.FieldByName('IDPESSOA').asInteger;
             ExecSQL;
         end;
         qryBeneficiarios.Next;
      end;

      with qrySQL do
      begin
         Close;
         Sql.Clear;
         vSql := ' SELECT  DISTINCT(B.IDPESSOA), B.IDPESSJUR, B.IDTITULAR,            '+
                 '         E.MATRICULA||DP.NUMSEQUENCIA||TO_CHAR(PF.DATANASC, ''DDMMYYYY'')||'+Copy(edtDataEmissao.Text,7,4)+' AS CODBARRAS, '+
                 '         P.NOME, P.NUMDOCUMENTO AS CPF, E.MATRICULA, EP.LOGRADOURO, '+
                 '         EP.NUMERO, EP.COMPLEMENTO, EP.BAIRRO, EP.CEP, EP.CIDADE, EP.CODESTADO, '+
                 '         EP.IDPAIS,  PF.DATANASC, TO_CHAR(PF.DATANASC, ''DD/MM'') AS ANIVERSARIO, '+
                 '         TRIM(TO_CHAR(TO_NUMBER(SUBSTR(E.MATRICULA,1,(INSTR(E.MATRICULA,''-'',1)-1))),''00099999''))||'+QuotedStr('-')+
                 '||TRIM(SUBSTR(E.MATRICULA,(INSTR(E.MATRICULA,''-'',1)+1),1))||'+
                 'TRIM(TO_CHAR(DP.NUMSEQUENCIA,''009''))||'+
                 'TRIM(TO_CHAR(PF.DATANASC,''DDMMYYYY''))||:ANO AS CODIGO_DE_BARRAS, '+
                 QuotedStr('  ')+' AS CONTATO '+
                 ' FROM    BENEFBFCIARIO B, BFCIARIOTITPLAN BF,PESSOA P, PESSOAFISICA PF, ELEGPATRO E, DEPENTIT DP,  '+
                 '        (SELECT  P.IDPESSOA, E.LOGRADOURO, E.NUMERO, E.COMPLEMENTO, E.CEP, E.BAIRRO, '+
                 '                 C.NOME CIDADE, ES.NOMEESTADO ESTADO, PA.NOMEPAIS PAIS, PA.IDPAIS, ES.IDESTADO, '+
                 '                 ES.CODESTADO '+
                 '         FROM    PESSOA P, ENDPESS E, CIDADES C, ESTADO ES, PAIS PA '+
                 '         WHERE   (P.IDPESSOA = E.IDPESSOA) '+
                 '         AND     '+vEnd+
                 '         AND     (E.IDCIDADES = C.IDCIDADES) '+
                 '         AND     (C.IDESTADO = ES.IDESTADO)  '+
                 '         AND     (PA.IDPAIS = ES.IDPAIS)) EP '+
                 'WHERE   (B.IDSITBENEFICIO = 1 )              '+
                 'AND     (BF.IDPESSJUR     = B.IDPESSJUR )    '+
                 'AND     (BF.IDTITULAR     = B.IDTITULAR )    '+
                 'AND     (BF.IDPLANOORIGEM = B.IDPLANOORIGEM )'+
                 'AND     (BF.IDPESSOA      = B.IDPESSOA )     '+
                 'AND     (BF.SEQPROPOSTA   = 1)               '+
                 'AND     (BF.IDPLANOPREV   = B.IDPLANOPREV )  '+
                 'AND     (BF.IDBENEFICIO   = B.IDBENEFICIO)   '+
                 'AND     (B.IDPESSJUR = E.IDPESSJUR)          '+
                 'AND     (B.IDTITULAR = E.IDPESSOA)           '+
                 'AND     (BF.IDRESPONSAVEL = P.IDPESSOA )    '+
                 'AND     (BF.IDRESPONSAVEL = PF.IDPESSOA )    '+
                 'AND     (BF.IDRESPONSAVEL = EP.IDPESSOA )     '+
                 'AND     (B.IDTITULAR = DP.IDTITULAR)         ';   

            
            Case rdgGeracao.ItemIndex of
               0 : If ChBx2Via.Checked      
                    Then SQL.Text := SQL.Text +
                         ' AND     (B.FLGSTATUS = ''P'') '+
                         ' AND     (B.DATARECEBRECAD IS NULL ) ';
               2 : SQL.Text := SQL.Text +   
                               ' AND     (B.FLGSTATUS = ''N'') '+
                               ' AND     (B.DATARECEBRECAD IS NOT NULL ) ';
               3 : SQL.Text := SQL.Text +   
                               ' AND     (B.FLGSTATUS = ''P'') '+
                               ' AND     (B.DATARECEBRECAD IS NULL ) ';
             End;
            

            if DBcboPatrocinadora.Text <> '' then
               vSql := vSql + 'AND ( B.IDPESSJUR = '+DBcboPatrocinadora.LookupValue+' ) ';
            if DBcboBeneficio.LookupValue <> '' then
               vSql := vSql +'AND ( B.IDBENEFICIO = ' + DBcboBeneficio.LookupValue + ' ) ';


            If (ChBx2Via.Checked) and (MontaSelect.RetornouValor) then
               vSql :=  vSql +'AND (B.IDPESSOA = '+MontaSelect.ValoresChave[0]+') ';


            Sql.Add(vSql);

            ParamByName('ANO').DataType :=  ftMemo;               
            ParamByName('ANO').AsMemo   := InputBox('Complemento','Entre com o complemento para o código de barras','');

            Open;
      end; 

      vPar := VarArrayCreate([0,1],VarVariant);
      vPar[0] := rdgGeracao.Items[rdgGeracao.ItemIndex];
      vPar[1] := 'R';
      if rdgGeracao.ItemIndex in ([0, 2, 3])
      then begin
         if qryModelo.Locate('MODELOCARTA;FLGTIPOCARTA',vPar,[])
         then begin
            if qryReports.Active then qryReports.Close;
            if not(qryReports.Prepared)
            then qryReports.Prepare;
            qryReports.ParamByName('PIDREPORTS').asInteger := qryModelo.FieldByName('IDREPORTS').asInteger;
            qryReports.ParamByName('PORIGEMCM').asInteger  := qryModelo.FieldByName('ORIGEMCM').asInteger;
            qryReports.Open;
            memReports.Lines.Text := qryReports.FieldByName('TEMPLATE').asString;
            // atribui o pipeline correto ao relatório
            ModeloRelatCM.SetaDataPipeline('frmEmiteRecadastramento', 'pplImprime', 'frmEmiteRecadastramento', 'ppConsulta', memReports);

            // grava o template no diretório temporário
            memReports.Lines.SaveToFile(Sistema.TempDir + ArqCmRecadastra);
            // carrega o template e imprime o relatório
            rptImprime.Template.FileName := Sistema.TempDir + ArqCmRecadastra;

            
            rptImprime.Template.SaveTo   := stFile;
            rptImprime.Template.Format   := ftASCII;
            
            Case rdgGeracao.ItemIndex Of
             0 : rptImprime.Template.FileName := Sistema.TempDir + 'Carta';
             2 : rptImprime.Template.FileName := Sistema.TempDir + 'Grato';
             3 : rptImprime.Template.FileName := Sistema.TempDir + 'Falta';
            End;
            
            rptImprime.Template.LoadFromFile;
           



            rptImprime.Template.SaveToFile;
            rptImprime.Template.LoadFromFile;
            rptImprime.Device := dvScreen;
            rptImprime.Print;
         end;
      end;

      if rdgGeracao.ItemIndex = 1
      then begin
         if qryModelo.Locate('MODELOCARTA;FLGTIPOCARTA',vPar,[])
         then begin
            if qryReports.Active        then qryReports.Close;
            if not(qryReports.Prepared) then qryReports.Prepare;
            qryReports.ParamByName('PIDREPORTS').asInteger   := qryModelo.FieldByName('IDREPORTS').asInteger;
            qryReports.ParamByName('PORIGEMCM').asInteger    := qryModelo.FieldByName('ORIGEMCM').asInteger;
            qryReports.Open;
            // carrega o template para a memo memReports (bluebox)
            memReports.Lines.Text := qryReports.FieldByName('TEMPLATE').asString;
            // atribui o pipeline correto ao relatório
            ModeloRelatCM.SetaDataPipeline('frmEmiteRecadastramento', 'pplImprime', 'frmEmiteRecadastramento', 'ppConsulta', memReports);
            // grava o template no diretório temporário
            memReports.Lines.SaveToFile(Sistema.TempDir + 'DeclarResidCM.Tmp');
            // carrega o template e imprime o relatório
            rptImprime.Template.FileName := Sistema.TempDir + 'DeclarResidCM.Tmp';

            rptImprime.Template.SaveToFile;
            rptImprime.Template.LoadFromFile;
            rptImprime.Device := dvScreen;
            rptImprime.Print;
         end;
      end;

      // -- Impressão das Etiquetas ----------------------------------------------------------------------

      if MsgDlg('Deseja gerar etiquetas para acompanhar as cartas?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes
      then begin
         Repaint;
         rptEtiqCM := TppReport.Create(Application);
         try
           qryReports.Close;
           if not(qryReports.Prepared) then qryReports.Prepare;
           qryReports.Params[0].AsInteger := qryModeloEtiq.FieldByName('IDREPORTS').asInteger;
           qryReports.Params[1].AsInteger := qryModeloEtiq.FieldByName('ORIGEMCM').asInteger;
           qryReports.Open;

           memReports.Lines.Clear;
           memReports.Lines.Text := qryReports.FieldByName('TEMPLATE').AsString;

           // Substitui o Pipeline do Template pelo Pipeline do Report
           ModeloRelatCM.SetaDataPipeline('frmEmiteRecadastramento', 'pplImprime', 'frmEmiteRecadastramento', 'ppConsulta', memReports);
           MemReports.Lines.SaveToFile(Sistema.TempDir + ArqCmEtiqueta);

           rptEtiqCM.Template.FileName  := Sistema.TempDir + ArqCmEtiqueta;
           rptEtiqCM.ModalPreview       := False;

           rptEtiqCM.Template.SaveToFile;
           rptEtiqCM.Template.LoadFromFile;

           ModeloRelatCM.SetaDadosRpt(rptEtiqCM, pplImprime, ArqCmEtiqueta);

           rptEtiqCM.Device        := dvScreen;
           rptEtiqCM.ModalPreview  := True;
           rptEtiqCM.Print;
         finally
           rptEtiqCM.Free;
         end;
      end;

      // mostra uma mensagem de aviso após a impressão
      sAviso := 'ATENÇÃO!' + chr(13) + 'Verifique se as cartas (e as etiquetas, se for o caso) foram impressas corretamente; ' +
                 'em caso negativo, por favor repetir a operação.';
      MsgDlg(sAviso, 'Aviso', mtWarning, [mbOk], 0);
      Repaint;
      qryReports.Close;
   end;
end;

function TfrmEmiteRecadastramento.VerificaPreenchimento: boolean;
begin
	Result := False;

	try

      if length(edtCarta.Text) = 0 then
         raise EValidacao.CreateVal('É necessário preencher o Nº da Carta!', edtCarta);

// -- Datas de Emissão e Limite --------------------------------------------------------------------

      if edtDataEmissao.Date = 0 then
         raise EValidacao.CreateVal('É necessário preencher a Data de Emissão!', edtDataEmissao);

      if edtDataLimite.Date = 0 then
         raise EValidacao.CreateVal('É necessário preencher a Data Limite!', edtDataLimite);

      if not(edtDataLimite.Date > edtDataEmissao.Date) then
         raise EValidacao.CreateVal('A Data Limite deve ser posterior à Data de Emisssão!', edtDataLimite);

// -- Estado ---------------------------------------------------------------------------------------

      if DBcboPais.LookupValue <> '' then
         if DBcboEstado.LookupValue = '' then
            raise EValidacao.CreateVal('É necessário selecionar o Estado!', DBcboEstado);

      if DBcboEstado.LookupValue <> '' then
         if DBcboPais.LookupValue = '' then
            raise EValidacao.CreateVal('É necessário selecionar o País!', DBcboPais);

// -- Data de Aniversário --------------------------------------------------------------------------

      if edtDataAniIni.Date > 0 then
         if edtDataAniFim.Date = 0 then
            raise EValidacao.CreateVal('É necessário preencher corretamente o Período da Data de Nascimento!', edtDataAniFim);

      if edtDataAniFim.Date > 0 then
         if edtDataAniIni.Date = 0 then
            raise EValidacao.CreateVal('É necessário preencher corretamente o Período da Data de Nascimento!', edtDataAniIni);

      if not(edtDataAniFim.Date >= edtDataAniIni.Date) then
         raise EValidacao.CreateVal('É necessário preencher corretamente o Período da Data de Nascimento!', edtDataAniIni);

      if not( Year(edtDataAniFim.Date) = Year(edtDataAniIni.Date) ) then
         raise EValidacao.CreateVal('É necessário que as Datas de Aniversário pertençam ao mesmo ano!', edtDataAniIni);

// -- Iniciais do Nome -----------------------------------------------------------------------------

      if length(edtInicialIni.Text) > 0 then
         if length(edtInicialFim.Text) = 0 then
            raise EValidacao.CreateVal('É necessário preencher corretamente as Inicias do Nome!', edtInicialFim);

      if length(edtInicialFim.Text) > 0 then
         if length(edtInicialIni.Text) = 0 then
            raise EValidacao.CreateVal('É necessário preencher corretamente as Inicias do Nome!', edtInicialIni);

// -------------------------------------------------------------------------------------------------

      if DBcboDocumento.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário selecionar o Documento de Identidade!', DBcboDocumento);

// -------------------------------------------------------------------------------------------------

      if rdgGeracao.ItemIndex in ([0, 2, 3]) then
         if DBcboEtiqueta.LookupValue = '' then
            raise EValidacao.CreateVal('É necessário selecionar o Modelo de Etiquetas!', DBcboEtiqueta);

      if ChBx2Via.Checked Then
         if edtNomeBenef.Text = '' then
            raise EValidacao.CreateVal('É necessário escolher beneficiário para emitir 2ª via!', bbtnProcurar);

   except

      on ev : EValidacao do begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
			Repaint;
         ev.Control.SetFocus;
         Exit;
      end;

   end;

   Result := True;
end;



procedure TfrmEmiteRecadastramento.DBcboPaisCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  
end;



procedure TfrmEmiteRecadastramento.edtInicialIniKeyPress(Sender: TObject; var Key: Char);
begin
   inherited;
   if not(isCharAlpha(Key)) then Key := #0;
end;



procedure TfrmEmiteRecadastramento.edtInicialFimKeyPress(Sender: TObject; var Key: Char);
begin
   inherited;
   if not(isCharAlpha(Key)) then Key := #0;
end;



procedure TfrmEmiteRecadastramento.bbtnConfirmarClick(Sender: TObject);
begin
   if VerificaPreenchimento then begin

      Screen.Cursor := crHourGlass;
      bbtnConfirmar.Enabled := False;

      try

         if DefineEscopo then begin

            StartTransacao;

            try
               EmiteCartas;

               
               Try
                 If Not Sistema.GravaLogOperacoes(Self.Caption) Then
                   raise exception.Create('Erro ao gravar Log.')
               Except
               End;


               CommitTransacao;

               Screen.Cursor := crDefault;
               MsgDlg('Operação completada.', 'Informação', mtInformation, [mbOk], 0);
               Repaint;

            except
               RollBackTransacao;
               Screen.Cursor := crDefault;
               Raise;
               Repaint;
            end;

         end;

      finally
         bbtnConfirmar.Enabled := True;
         Screen.Cursor := crDefault;
      end;
   end;
end;



procedure TfrmEmiteRecadastramento.FormShow(Sender: TObject);
begin
   inherited;
   ChBx2Via.Checked := False; 
   qryLookPais.Open;


   qryLookPatrocinadora.Close;
   qryLookPatrocinadora.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; 
   qryLookPatrocinadora.Open;
      
   qryTipoDoc.Open;

   qryModelo.Open;
   ModeloRelatCM := TModeloRelatCM.Create;
   bCriaTemplate := True;
   bCriaTemplate2 := False;

   qryDocumento.Close;
   qryDocumento.Prepare;

   qryLookBeneficio.Close;
   qryLookBeneficio.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; 
   qryLookBeneficio.Open;
   chklstBeneficios.Items.Clear;
   while not qryLookBeneficio.EOF Do Begin
      chklstBeneficios.Items.Add(qryLookBeneficio.FieldByName('NOME').AsString );
      qryLookBeneficio.Next;
   end;


  
   qryLookEstado.Open;

   qryModeloEtiq.Close;
   qryModeloEtiq.Open;

   cmbTipoEndereco.ItemIndex := 0;
 


   edtDataEmissao.Date := Date;


   
   LstOpcoes := TStringList.Create;
   If FazQuery(QryAux,'SELECT IDTPPAGTOBENEFIC, NOME '+
                      'FROM TPPAGTOBENEFICIO ORDER BY NOME ')
   Then Begin
     CriaLista(ChLstOpcoes,QryAux,LstOpcoes,'IDTPPAGTOBENEFIC','NOME');
   End;

   

  MontaSelect.Filtro.Add('PP.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); // CAMILLE - 25.06.2003
end;

Procedure TfrmEmiteRecadastramento.CriaLista(ChkList:TCheckListBox; Query:TwwQuery;
                                             Lista: TStringList; Chave, Descricao:String);
begin
  Lista.Clear;
  ChkList.Clear;
  while Not Query.Eof Do Begin
    ChkList.Items.Add(Query.FieldByName(Descricao).AsString);
    Lista.Add(Query.FieldByName(Chave).AsString);
    Query.Next;
  end;
end;



procedure TfrmEmiteRecadastramento.DBcboPatrocinadoraCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin

end;



procedure TfrmEmiteRecadastramento.qryBeneficiariosCalcFields(DataSet: TDataSet);
begin
   inherited;

   with qryBeneficiarios do begin

      qryDocumento.ParamByName('PESSOA').asInteger := FieldByName('IDPESSOA').asInteger;
      qryDocumento.Open;

      FieldByName('Identidade').asString           := qryDocumento.FieldByName('NUMDOCUMENTO').asString;
      FieldByName('Orgao').asString                := qryDocumento.FieldByName('ORGAO').asString;
      FieldByName('Carta').asString                := edtCarta.Text;
      FieldByName('DataEmissaoExtensa').asString   := DataExtenso(edtDataEmissao.Date);
      FieldByName('DataLimite').asString           := edtDataLimite.Text;

      qryDocumento.Close;
   end;
end;



procedure TfrmEmiteRecadastramento.DBcboDocumentoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   if DBcboDocumento.LookupValue <> '' then begin
      qryDocumento.ParamByName('DOCUMENTO').asInteger := StrToInt(DBcboDocumento.LookupValue);
   end;
end;



procedure TfrmEmiteRecadastramento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FuncaoGeral.FechaQry(
   [
   qryLookPais,
   qryLookPatrocinadora,
   qryTipoDoc,
   qryDocumento,
   qryLookBeneficio,
   qryLookEstado,
   qryBeneficiarios
   ], False, True);

   ModeloRelatCM.Free;
   LstOpcoes.Free;
   inherited;
end;



procedure TfrmEmiteRecadastramento.DBcboPatrocinadoraExit(Sender: TObject);
begin
   inherited;

end;



procedure TfrmEmiteRecadastramento.btnModeloCartaClick(Sender: TObject);
begin
   inherited;

   DsgnCM.Report := ppRptCarta;

   if qryModelo.isEmpty then begin
      if bCriaTemplate then begin

         try
            qryModelo.Append;
            qryModeloIDCARTACOBRANCA.AsFloat := LeUltRegistro(nil,'CARTACOBRANCA');
            qryModeloMODELOCARTA.AsString    := 'Carta de Recadastramento';
            qryModeloIDREPORTS.AsFloat       := LeUltRegistro(nil,'REPORTS');
            qryModeloORIGEMCM.AsFloat        := 0;
            qryModeloFLGTIPOCARTA.AsString   := 'R';
            qryModelo.Post;

            ModeloRelatCM.CmRecadastra.SaveToFile(Sistema.TempDir + ArqCmRecadastra);

         finally
            bCriaTemplate := False;
         end;

      end;

   end else begin

      if bCriaTemplate then begin

         // abre e ponteira a qry que contém o modelo da Carta-padrão
         qryReports.Close;
         qryReports.ParamByName('PIDREPORTS').asInteger  := qryModelo.FieldByName('IDREPORTS').asInteger;
         qryReports.ParamByName('PORIGEMCM').asInteger   := qryModelo.FieldByName('ORIGEMCM').asInteger;
         qryReports.Open;

         // carrega o template para a memo memReports (bluebox)
         memReports.Lines.Clear;
         memReports.Lines.Text := qryReports.FieldByName('TEMPLATE').asString;
         memReports.Lines.SaveToFile(Sistema.TempDir + ArqCmRecadastra);

         bCriaTemplate := False;


         // carrega o template e imprime o relatório
         ppRptCarta.Template.FileName := Sistema.TempDir + ArqCmRecadastra;
         // Salva o template
         ppRptCarta.template.SaveToFile;
         ppRptCarta.Template.LoadFromFile;

         
         DsgnCM.Report.Template.SaveTo   := stFile;
         DsgnCM.Report.Template.Format   := ftASCII;
         DsgnCM.Report.Template.FileName := Sistema.TempDir + 'Carta';

         Try
          DsgnCM.Report.Template.LoadFromFile;
         Except
          Raise
         End;

         
      end;
   end;

   DsgnCM.ShowModal;

   if MsgDlg('Deseja salvar o modelo de Carta de Recadastramento criado?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin

      DsgnCM.Report.Template.SaveTo   := stFile;
      DsgnCM.Report.Template.Format   := ftASCII;
      DsgnCM.Report.Template.FileName := Sistema.TempDir + 'Carta';
      DsgnCM.Report.Template.SaveToFile;

      Repaint;
      // carrega o template para a memo (bluebox)
      memReports.Lines.LoadFromFile(Sistema.TempDir + ArqCmRecadastra);

      // abre, prepara e ponteira a qry que contém o modelo da Carta-padrão
      if qryReports.Active then qryReports.Close;
      if not(qryReports.Prepared) then qryReports.Prepare;
      qryReports.ParamByName('PIDREPORTS').asInteger  := qryModelo.FieldByName('IDREPORTS').asInteger;
      qryReports.ParamByName('PORIGEMCM').asInteger   := qryModelo.FieldByName('ORIGEMCM').asInteger;

      qryReports.Open;

      // se não existir ainda o modelo gravado, o cria
      if qryReports.IsEmpty then begin
         qryReports.Append;
      end else begin
         qryReports.Edit;
      end;

      qryReports.FieldByName('NAME').asString     := 'Carta de Recadastramento';
      qryReports.FieldByName('IDREPORTS').asFloat := qryModelo.FieldByName('IDREPORTS').asFloat;
      qryReports.FieldByName('ORIGEMCM').asFloat  := qryModelo.FieldByName('ORIGEMCM').asFloat;
      qryReports.FieldByName('TEMPLATE').asString := memReports.Lines.Text;

      qryReports.Post;
      qryReports.Close;

      AplicaAlteracoes([QryModelo]);

   end else begin

      // salva o template
      MemReports.Lines.SaveToFile(Sistema.TempDir + ArqCmRecadastra);

   end;
end;



procedure TfrmEmiteRecadastramento.mniFileSaveClick(Sender: TObject);
begin
  inherited;
  
  ppRptCarta.Template.SaveToFile;
end;



procedure TfrmEmiteRecadastramento.Sair1Click(Sender: TObject);
begin
  inherited;

  ppRptCarta.Template.SaveToFile;
  DsgnCM.Close;
end;



procedure TfrmEmiteRecadastramento.mniFilePageSetupClick(Sender: TObject);
var
   lPageSetupDlg: TppCustomPageSetupDialog;
   lFormClass: TFormClass;
begin
   inherited;

   if (DsgnCM.CurrentReport = nil) then Exit;

   lFormClass     := ppGetFormClass(TppCustomPageSetupDialog);
   lPageSetupDlg  := TppCustomPageSetupDialog(lFormClass.Create(Self));

   lPageSetupDlg.Report := DsgnCM.CurrentReport;
   lPageSetupDlg.ShowModal;

   lPageSetupDlg.Free;
end;



procedure TfrmEmiteRecadastramento.mniFilePrintClick(Sender: TObject);
begin
   inherited;

   if (DsgnCM.Report = nil) then Exit;

   DsgnCM.PrintReport;
end;



procedure TfrmEmiteRecadastramento.mniFilePrintToFileSetupClick(Sender: TObject);
var
   lTextFileDialog: TppCustomPrintToFileSetupDialog;
   lFormClass: TFormClass;
begin
   inherited;

   if (DsgnCM.CurrentReport = nil) then Exit;

   lFormClass        := ppGetFormClass(TppCustomPrintToFileSetupDialog);
   lTextFileDialog   := TppCustomPrintToFileSetupDialog(lFormClass.Create(Self));

   lTextFileDialog.Report        := DsgnCM.Report;
   lTextFileDialog.CurrentReport := DsgnCM.CurrentReport;

   lTextFileDialog.ShowModal;

   lTextFileDialog.Free;
end;


procedure TfrmEmiteRecadastramento.DsgnCMCreate(Sender: TObject);
var
   x, y: Integer;
begin
   inherited;

   for x := 0 to DsgnCM.Menu.items.count - 1 do begin

      for y := 0 to DsgnCM.Menu.items[x].Count - 1 do begin

         if DsgnCM.Menu.items[x].items[y].name = 'mniReportData' then begin
            DsgnCM.Menu.items[x].items[y].Visible := False;
         end else begin
            if DsgnCM.Menu.items[x].items[y].name = 'N1' then begin
               DsgnCM.Menu.items[x].items[y].Visible := False;
            end else begin
               if DsgnCM.Menu.items[x].items[y].name = 'mniViewLine3' then begin
                  DsgnCM.Menu.items[x].items[y].Visible := False;
               end else begin
                  if DsgnCM.Menu.items[x].items[y].name = 'mniViewOutline' then begin
                     DsgnCM.Menu.items[x].items[y].Visible := False;
                  end;
               end;
            end;
         end;

      end;
   end;
end;



procedure TfrmEmiteRecadastramento.btnModeloEtiquetaClick(Sender: TObject);
begin
   inherited;
   EtiquetaCM.AbrirFormConfig;
   Repaint;
end;



procedure TfrmEmiteRecadastramento.cmbTipoEnderecoChange(Sender: TObject);
begin
  inherited; 
  Case cmbTipoEndereco.ItemIndex of
       0 : vParam := '(P.IDENDCORRESP = E.IDENDERECO) AND ';
       1 : vParam := '(P.IDENDCOMERCIAL = E.IDENDERECO) AND ';
       2 : vParam := '(P.IDENDENTREGA = E.IDENDERECO) AND ';
       3 : vParam := '(P.IDENDRESIDENCIAL = E.IDENDERECO) AND ';
       4 : vParam := '(P.IDENDCOBRANCA = E.IDENDERECO) AND ';
  End;

  vParam := '((P.IDENDCORRESP IS NOT NULL) OR (P.IDENDCOMERCIAL IS NOT NULL) OR (P.IDENDENTREGA IS NOT NULL) OR '+
            '(P.IDENDRESIDENCIAL IS NOT NULL) OR (P.IDENDCOBRANCA IS NOT NULL)) AND ';

end;



procedure TfrmEmiteRecadastramento.btnDVRClick(Sender: TObject);
Var
  vPar : Variant;
begin
  inherited; //Configuração de Delcaração de residência

  vPar := VarArrayCreate([0,1],VarVariant);
  vPar[0] := 'Declaração de Residência';
  vPar[1] := 'R';
  if not qryModelo.Locate('MODELOCARTA;FLGTIPOCARTA',vPar,[]) then begin
     qryModelo.Append;
     qryModeloIDCARTACOBRANCA.AsFloat := LeUltRegistro(nil,'CARTACOBRANCA');
     qryModeloMODELOCARTA.AsString    := 'Declaração de Residência';
     qryModeloIDREPORTS.AsFloat       := LeUltRegistro(nil,'REPORTS');
     qryModeloORIGEMCM.AsFloat        := 0;
     qryModeloFLGTIPOCARTA.AsString   := 'R';
     qryModelo.Post;
  end;

  qryReports.Close;
  qryReports.ParamByName('PIDREPORTS').asInteger  := qryModelo.FieldByName('IDREPORTS').asInteger;
  qryReports.ParamByName('PORIGEMCM').asInteger   := qryModelo.FieldByName('ORIGEMCM').asInteger;
  qryReports.Open;

  if qryReports.IsEmpty then begin
     SetaDadosRptAux(rptDvr, ppDVR, 'DeclarResidCM.Tmp');
     rptDvr.Template.FileName := Sistema.TempDir + 'DeclarResidCM.Tmp';
     try

        rptDvr.Template.SaveToFile;
        rptDvr.Template.LoadFromFile;
     except
           //
     end;
     DsgnCM.Report := rptDvr;
     DsgnCM.ShowModal;
     rptDvr.Template.SaveToFile;
     
  end else begin
      memReports.Lines.Text := qryReports.FieldByName('TEMPLATE').asString;
      memReports.Lines.SavetoFile(Sistema.TempDir + 'DeclarResidCM.Tmp');
      SetaDadosRptAux(rptDvr, ppDVR, 'DeclarResidCM.Tmp');
      rptDvr.Template.FileName := Sistema.TempDir + 'DeclarResidCM.Tmp';

      rptDvr.Template.SaveToFile;
      rptDvr.Template.LoadFromFile;
      DsgnCM.Report := rptDvr;
      DsgnCM.ShowModal;
  end;


  if MsgDlg('Deseja salvar o modelo de Declaração de Residência criado?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
     Repaint;
     // carrega o template para a memo (bluebox)
     memReports.Lines.LoadFromFile(rptDvr.Template.FileName);
     // abre, prepara e ponteira a qry que contém o modelo da Carta-padrão
     if qryReports.Active then
        qryReports.Close;
     if not(qryReports.Prepared) then
        qryReports.Prepare;
     qryReports.ParamByName('PIDREPORTS').asInteger  := qryModelo.FieldByName('IDREPORTS').asInteger;
     qryReports.ParamByName('PORIGEMCM').asInteger   := qryModelo.FieldByName('ORIGEMCM').asInteger;
     qryReports.Open;

     // se não existir ainda o modelo gravado, o cria
     if qryReports.IsEmpty then begin
        qryReports.Append;
     end else begin
        qryReports.Edit;
     end;
     qryReports.FieldByName('NAME').asString     := 'Declaração de Residência';
     qryReports.FieldByName('IDREPORTS').asFloat := qryModelo.FieldByName('IDREPORTS').asFloat;
     qryReports.FieldByName('ORIGEMCM').asFloat  := qryModelo.FieldByName('ORIGEMCM').asFloat;
     qryReports.FieldByName('TEMPLATE').asString := memReports.Lines.Text;
     qryReports.Post;
     qryReports.Close;

     AplicaAlteracoes([QryModelo]);
   end else begin
      // salva o template
      MemReports.Lines.SaveToFile(rptDvr.Template.FileName);
   end;
end;

procedure TfrmEmiteRecadastramento.SetaDadosRptAux(Var Relatorio: TppReport; Var Pipeline: TPPBdePipeline;sTemplate: String);
begin
     Relatorio.Language := lgPortugueseBrazil;
     Relatorio.AllowPrintToArchive := True;
     Relatorio.AllowPrintToFile := True;
     Relatorio.SaveAsTemplate := True;
     Relatorio.DataPipeline := Pipeline;
     Relatorio.Template.FileName := Sistema.TempDir + sTemplate;
     Relatorio.Template.Saveto := stFile;
     Relatorio.Template.Format := ftASCII;
End;


procedure TfrmEmiteRecadastramento.ckbArqTextoClick(Sender: TObject);
begin
  inherited;
  grb2Via.Visible := ckbArqTexto.Checked;
end;

procedure TfrmEmiteRecadastramento.ChBx2ViaClick(Sender: TObject);
begin
  inherited;
  If ChBx2Via.Checked
   Then Begin
     bbtnProcurar.Visible := True;
     edtNomeBenef.Visible := True;
     Label14.Visible      := True;
   End
   Else Begin
     bbtnProcurar.Visible := False;
     edtNomeBenef.Visible := False;
     Label14.Visible      := False;
   End;
end;

procedure TfrmEmiteRecadastramento.bbtnProcurarClick(Sender: TObject);
begin
  inherited;
  MontaSelect.Executar;

  If MontaSelect.RetornouValor
   Then edtNomeBenef.Text := MontaSelect.ValoresChave[1];

end;


end.




SELECT  DISTINCT(B.IDPESSOA), B.IDPESSJUR, B.IDTITULAR,
E.MATRICULA||DP.NUMSEQUENCIA||TO_CHAR(PF.DATANASC, 'DDMMYYYY')|| AS CODBARRAS,
P.NOME, P.NUMDOCUMENTO AS CPF, E.MATRICULA, EP.LOGRADOURO,
EP.NUMERO, EP.COMPLEMENTO, EP.BAIRRO, EP.CEP, EP.CIDADE, EP.CODESTADO,
EP.IDPAIS,  PF.DATANASC, TO_CHAR(PF.DATANASC, 'DD/MM') AS ANIVERSARIO,
TRIM(TO_CHAR(TO_NUMBER(SUBSTR(E.MATRICULA,1,(INSTR(E.MATRICULA,'-',1)-1))),'00099999'))||'-'
||TRIM(SUBSTR(E.MATRICULA,(INSTR(E.MATRICULA,'-',1)+1),1))||
TRIM(TO_CHAR(DP.NUMSEQUENCIA,'009'))||
TRIM(TO_CHAR(PF.DATANASC,'DDMMYYYY'))||:ANO AS CODIGO_DE_BARRAS,
'  ' AS CONTATO
 FROM    BENEFBFCIARIO B, BFCIARIOTITPLAN BF,PESSOA P, PESSOAFISICA PF, ELEGPATRO E, DEPENTIT DP,
        (SELECT  P.IDPESSOA, E.LOGRADOURO, E.NUMERO, E.COMPLEMENTO, E.CEP, E.BAIRRO,
                 C.NOME CIDADE, ES.NOMEESTADO ESTADO, PA.NOMEPAIS PAIS, PA.IDPAIS, ES.IDESTADO,
                 ES.CODESTADO
         FROM    PESSOA P, ENDPESS E, CIDADES C, ESTADO ES, PAIS PA
         WHERE   (P.IDPESSOA = E.IDPESSOA)
         AND     (E.IDCIDADES = C.IDCIDADES)
         AND     (C.IDESTADO = ES.IDESTADO)
         AND     (PA.IDPAIS = ES.IDPAIS)) EP
WHERE   (B.IDSITBENEFICIO = 1 )
AND     (BF.IDTITULAR = B.IDTITULAR )
AND     (BF.IDPESSOA = B.IDPESSOA )
AND     (B.IDTITULAR = E.IDPESSOA)
AND     (E.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO =2
AND     (BF.IDRESPONSAVEL = P.IDPESSOA )
AND     (BF.IDRESPONSAVEL = PF.IDPESSOA )
AND     (BF.IDRESPONSAVEL = EP.IDPESSOA )
AND     (B.IDTITULAR = DP.IDTITULAR)




  SELECT DISTINCT
     BF.IDRESPONSAVEL AS IDPESSOA, B.IDPESSJUR, B.IDTITULAR,
     P.NOME, P.RAZAOSOCIAL AS NOMEFANTASIA, P.NUMDOCUMENTO AS CPF,
     E.MATRICULA, EP.LOGRADOURO, EP.NUMERO, EP.COMPLEMENTO,
     EP.BAIRRO, EP.CEP, EP.CIDADE, EP.IDPAIS, EP.IDESTADO, EP.CODESTADO,
     PF.DATANASC, TO_CHAR(PF.DATANASC, ''DD/MM'') AS ANIVERSARIO, B.IDBENEFICIO, EP.IDENDERECO,
     BN.NOME AS BENEFICIO, ' ' AS CONTATO,
     ND.NUMDEPEND
  FROM
     BENEFBFCIARIO B, PESSOA P, ELEGPATRO E, PESSOAFISICA PF, BENEFICIO BN, BFCIARIOTITPLAN BF,
     ( SELECT P.IDPESSOA, E.LOGRADOURO, E.NUMERO, E.COMPLEMENTO, E.CEP, E.IDENDERECO,
              E.BAIRRO, C.NOME CIDADE, ES.NOMEESTADO ESTADO, PA.NOMEPAIS PAIS, ES.IDESTADO,
              ES.CODESTADO, PA.IDPAIS
       FROM PESSOA P, ENDPESS E, CIDADES C, ESTADO ES, PAIS PA
       WHERE (P.IDPESSOA = E.IDPESSOA)
         AND (E.IDCIDADES = C.IDCIDADES(+))
         AND (C.IDESTADO = ES.IDESTADO(+))
         AND (PA.IDPAIS(+) = ES.IDPAIS) ) EP,
     ( SELECT IDTITULAR, COUNT(*) AS NUMDEPEND      *)
       FROM DEPENTIT
       WHERE IDTITULAR <> IDPESSOA
       GROUP BY IDTITULAR ) ND
       WHERE


       ( B.IDSITBENEFICIO = 1 )
            AND ( B.IDTITULAR = E.IDPESSOA ) '+
            AND ( B.IDPESSJUR = E.IDPESSJUR ) '+
            AND ( B.IDBENEFICIO = BN.IDBENEFICIO ) '+
            AND ( BF.IDRESPONSAVEL = EP.IDPESSOA ) '+
            AND ( BF.IDRESPONSAVEL = PF.IDPESSOA ) '+
            AND ( BF.IDRESPONSAVEL = P.IDPESSOA ) '+
            AND ( BF.IDTITULAR = B.IDTITULAR ) '+
            AND ( BF.IDPESSOA = B.IDPESSOA ) '+
            AND ( NOT BN.TIPOBENEFICIO = 99 ) '+ //Segundo a Camille TIPOBENEFICIO = 99 deve ser utilizado para esta busca
            AND ( E.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+'))'+ // CAMILLE - 25.06.2003

            AND (B.IDTITULAR = ND.IDTITULAR(+)) ';


            
            
            Case rdgGeracao.ItemIndex of
               0 : If ChBx2Via.Checked      // Para Carta de Recadastramento
                    Then SQL.Text := SQL.Text +
                         ' AND (B.FLGSTATUS = ''P'') '+
                         ' AND (B.DATARECEBRECAD IS NULL ) ';
               2 : SQL.Text := SQL.Text +   // Para Carta de Agradecimento
                               ' AND (B.FLGSTATUS = ''N'') '+
                               ' AND (B.DATARECEBRECAD IS NOT NULL ) ';
               3 : SQL.Text := SQL.Text +   // Para Carta de Falta de Recadastramento
                               ' AND (B.FLGSTATUS = ''P'') '+
                               ' AND (B.DATARECEBRECAD IS NULL ) ';
             End;
            



           

            If Trim(SOpcoes) <> '' Then begin
              SQL.Text := SQL.Text +
                ' AND (B.IDTPPAGTOBENEFIC IN ('+sOpcoes+')) ';
            End;
            

            Case cmbTipoEndereco.ItemIndex of
                  0 : SQL.Text := SQL.Text +' AND (P.IDENDCORRESP = EP.IDENDERECO)     ';
                  1 : SQL.Text := SQL.Text +' AND (P.IDENDCOMERCIAL = EP.IDENDERECO)   ';
                  2 : SQL.Text := SQL.Text +' AND (P.IDENDENTREGA = EP.IDENDERECO)     ';
                  3 : SQL.Text := SQL.Text +' AND (P.IDENDRESIDENCIAL = EP.IDENDERECO) ';
                  4 : SQL.Text := SQL.Text +' AND (P.IDENDCOBRANCA = EP.IDENDERECO)    ';
                  else begin
                       SQL.Text := SQL.Text + ' AND  '+
                                ' (( EP.IDENDERECO = P.IDENDCORRESP ) OR ( EP.IDENDERECO = P.IDENDCOMERCIAL ) OR '+
                                ' ( EP.IDENDERECO = P.IDENDENTREGA ) OR ( EP.IDENDERECO = P.IDENDRESIDENCIAL ) OR '+
                                ' ( EP.IDENDERECO = P.IDENDCOBRANCA ))';
                  end;
            End;

            Sql.Text := Sql.Text + ' ORDER BY P.NOME';




SELECT  DISTINCT(B.IDPESSOA), B.IDPESSJUR, B.IDTITULAR,
P.NOME, P.NUMDOCUMENTO AS CPF, E.MATRICULA,  PF.DATANASC, TO_CHAR(PF.DATANASC, 'DD/MM') AS ANIVERSARIO,
'  ' AS CONTATO
 FROM    BENEFBFCIARIO B, BFCIARIOTITPLAN BF,PESSOA P, PESSOAFISICA PF, ELEGPATRO E, DEPENTIT DP

WHERE   (B.IDSITBENEFICIO = 1 )
AND     (BF.IDPESSJUR     = B.IDPESSJUR )
AND     (BF.IDPLANOPREV   = B.IDPLANOPREV )
AND     (BF.IDTITULAR     = B.IDTITULAR )
AND     (BF.IDPESSOA      = B.IDPESSOA )
AND     (BF.IDBENEFICIO   = B.IDBENEFICIO)
AND     (BF.SEQPROPOSTA   = 1)
AND     (B.IDPESSJUR = E.IDPESSJUR)
AND     (B.IDTITULAR = E.IDPESSOA)
AND     (BF.IDRESPONSAVEL = P.IDPESSOA )
AND     (BF.IDRESPONSAVEL = PF.IDPESSOA )
AND     (B.IDTITULAR = DP.IDTITULAR)
