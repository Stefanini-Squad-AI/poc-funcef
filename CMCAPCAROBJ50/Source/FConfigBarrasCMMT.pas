// Alterações:
{--------------------------------------------------------------------------------------------------
Atender   : WO16145
Data      : 19/12/2024
Autor     : Arnaldo V. Scarin
Descrição : Correção do FatorVencimento, que a partir de 22/02/2025 será reiniciado em 1000, por conta
            do Codigo exceder 9999
--------------------------------------------------------------------------------------------------}
{ -----------------------------------------------------------------------------}
// Rotinas   : GetDocumentos
// Data      : 07/04/2005
// Autor     : Andre Tavares
// Pendência : 22079
// Descrição : criei várias propriedades para o form para que seja possível chamálo preenchido na tela de
//lançamento de documentos no CAR.
//------------------------------------------------------------------------------
{--------------------------------------------------------------------------------------------------
Rotina    : Procure pelo numero da pendencia para encontrar as alteraçoes
Data      : 23/02/2006
Autor     : André Tavares
Pendência : 21632
Descrição : o campo nosso número do boleto tem que ser o mesmo que sai no código de barras.
--------------------------------------------------------------------------------------------------}
{--------------------------------------------------------------------------------------------------
Rotina    : Procure pelo numero da pendencia para encontrar as alteraçoes
Data      : 26/12/2005
Autor     : André Tavares
Pendência : 21127
Descrição : IntBancoManager.NossoNumero := formatFloat('#0', rNossoNumero); - isso aqui tem que ser atualizado, pois é utilizado ao longo dos processos
--------------------------------------------------------------------------------------------------}
{--------------------------------------------------------------------------------------------------
Rotina    : Procure pelo numero da pendencia para encontrar as alteraçoes
Data      : 31/03/2005
Autor     : André Tavares
Pendência : 18844
Descrição : Não deixar repetir o nossoNumero do documento.
---------------------------------------------------------------------------------------------------}
{--------------------------------------------------------------------------------------------------
Rotina    : ALTEREI A QUERY DO SQLBLOQUETE
Data      : 20/12/2004
Autor     : André Tavares
Pendência : 18246
Descrição : a query não estava grupando os documentos com o mesmo codgrupocnab.
---------------------------------------------------------------------------------------------------}
{--------------------------------------------------------------------------------------------------
Rotina    : MemMensagem1Print
Data      : 19/11/2004
Autor     : André Tavares
Pendência : 18122
Descrição : pergunta se a linha está vazia antes de adicionar
---------------------------------------------------------------------------------------------------}
//início - andre tavares - pendência 17283 - 30/08/2004
{--------------------------------------------------------------------------------------------------
Rotina    : SelDados
Data      : 30/08//2004
Autor     : André Tavares
Pendência : 17283
Descrição : Ao reimprimir o boloqute com o mesmo nosso número, o sistema estava adicionando o DV novamente.
---------------------------------------------------------------------------------------------------}

{--------------------------------------------------------------------------------------------------
Componente: CdsBloqueteTipoCli
Data      : 28/02/2004
Autor     : David
Pendência : 15931
Descrição : Solução do problema que ocorria quando se tentava imprimir a ficha
            filtrada pelo tipo de cliente. O SQL do componente foi alterado. O
            SQL original está comentado no fim do código.
---------------------------------------------------------------------------------------------------}

{--------------------------------------------------------------------------------------------------
Rotina    : SelDados
Data      : 04/02/2004
Autor     : André Tavares
Descrição : resolução da pendência 15474
---------------------------------------------------------------------------------------------------}

{ --------------------------------------------------------------------------------------------------
Rotina    : MemMensagem1Print
Data      : 28/08/2003
Autor     : André Tavares
Descrição : resolução da pendência 13159
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : SelDados e
Data      : 26/08/2003
Autor     : Gleyber
Pendência : 14894
Descrição : Correção para que quando não houver documentos a ser impresso não mostrar mensagens.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : OpenBloquete
Data      : 22/07/2003
Autor     : André Pontes
Pendência : 14629
Descrição : Correção SqlBloqueteTipoCli (campo NODOCUMENTO)
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : BtnImprimeClick
Data      : 04/07/2003
Autor     : André Tavares
Descrição : resolução da pendência 14324
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : SelDados
Data      : 03/07/2003
Autor     : André Tavares
Descrição : resolução da pendência 14179
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : SelDados
Data      : 02/07/2003
Autor     : André Tavares
Descrição : Preenchimeno do campo nossonumero que por estar vazio, não estava mantendo o noosonumero
original como deveria. resolução da pendência 14263
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : OpenBloquete
Data      : 20/06/2003
Autor     : André Pontes
Descrição : Criação de novo filtro por Usuário
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
 02/06/2000 - 2.23.05
  Correção na seleção de documentos a serem impressos;
  Implementação do tratamento de erros de seleção de documentos e impressão;
  Correção na gravação da impressão dos documentos;
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
 06/06/2000 - 02.24.02
   Correção na seleção das mensagens associadas ao documento para impressão;
   Indicação do nº de registros a serem impressos;
   Implementação da Possibilidade de cancelamento da impressão;
   Otimização da consulta de seleção dos registros;
---------------------------------------------------------------------------------------------------}

Unit FConfigBarrasCMMT;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppClass, ppBands, ppProd, ppReport, ppComm, ppCache, ppDB, ppDBBDE, Db, Menus,
  ppEndUsr, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Wwdatsrc,
  MAHlpBtn, TB97Ctls, TB97Tlbr, TB97, StdCtrls, Buttons, Mask, wwdbedit, wwdblook,
  CMDBLookupCombo, ExtCtrls, ppStrtch, ppMemo, ppCtrls, ppBarCod, ppPrnabl, ExtDlgs,
  Grids, Wwdbigrd, Wwdbgrid, ppVar, ppRelatv, ppDBPipe, CmEventosCadastro,
  ImgList, JclDateTime, FConfigRelatorioMT, uCmSqlParams, DBClient, uCMClientDataSet,
  uCtrlParamIntegra, uCtrlIntBanco, uString, uContaBancariaMT, uCtrlConfigbarras,
  uDataBase, uCtrlParamBloqueteCobranca, ppModule, raCodMod,   
  DBCtrls; //início andre tavares - pendencia 22455 26/05/2006

Type
   EImprimeFichaCompError = Exception;

   TFrmConfigBarrasCMMT = Class(TFrmConfigRelatorioMT)
      Label3: TLabel;
      Label4: TLabel;
      Label5: TLabel;
      Label6: TLabel;
      Label7: TLabel;
      Label8: TLabel;
      Label9: TLabel;
      Label10: TLabel;
      EdnNomeBanco: TwwDBEdit;
      EdtNumBanco: TwwDBEdit;
      EdtCateira: TwwDBEdit;
      EdtCodMoeda: TwwDBEdit;
      EdtAceite: TwwDBEdit;
      EdtEspecieDoc: TwwDBEdit;
      EdtNumDig: TwwDBEdit;
      ScrollBox1: TScrollBox;
      ImgBanco: TImage;
      RptBarrasBBLine36: TppLine;
      RptBarrasBBLine41: TppLine;
      RptBarrasBBLine29: TppLine;
      RptBarrasBBLine43: TppLine;
      RptBarrasBBLine42: TppLine;
      RptBarrasBBLabel42: TppLabel;
      RptBarrasBBLine48: TppLine;
      RptBarrasBBLine52: TppLine;
      RptBarrasBBLine50: TppLine;
      RptBarrasBBLine49: TppLine;
      RptBarrasBBLine21: TppLine;
      RptBarrasBBLine23: TppLine;
      RptBarrasBBLine22: TppLine;
      RptBarrasBBLine19: TppLine;
      RptBarrasBBLine5: TppLine;
      RptBarrasBBLine13: TppLine;
      LblNomeBanco2: TppLabel;
      LblNumBanco2: TppLabel;
      RptBarrasBBLine1: TppLine;
      RptBarrasBBLine3: TppLine;
      RptBarrasBBLine2: TppLine;
      RptBarrasBBLine4: TppLine;
      RptBarrasBBLine6: TppLine;
      RptBarrasBBLine7: TppLine;
      RptBarrasBBLine8: TppLine;
      RptBarrasBBLine9: TppLine;
      RptBarrasBBLine10: TppLine;
      RptBarrasBBLine11: TppLine;
      RptBarrasBBLabel3: TppLabel;
      RptBarrasBBLine14: TppLine;
      RptBarrasBBLine15: TppLine;
      RptBarrasBBLine16: TppLine;
      RptBarrasBBLine17: TppLine;
      RptBarrasBBLabel4: TppLabel;
      RptBarrasBBLabel5: TppLabel;
      RptBarrasBBLabel6: TppLabel;
      RptBarrasBBLabel7: TppLabel;
      RptBarrasBBLabel8: TppLabel;
      RptBarrasBBLabel9: TppLabel;
      RptBarrasBBLabel10: TppLabel;
      RptBarrasBBLabel11: TppLabel;
      RptBarrasBBLabel12: TppLabel;
      RptBarrasBBLabel13: TppLabel;
      RptBarrasBBLabel14: TppLabel;
      RptBarrasBBLabel15: TppLabel;
      RptBarrasBBLabel16: TppLabel;
      RptBarrasBBLabel17: TppLabel;
      RptBarrasBBLabel18: TppLabel;
      RptBarrasBBLabel19: TppLabel;
      RptBarrasBBLabel20: TppLabel;
      RptBarrasBBLabel21: TppLabel;
      RptBarrasBBLabel22: TppLabel;
      RptBarrasBBLine18: TppLine;
      RptBarrasBBLabel23: TppLabel;
      RptBarrasBBLine20: TppLine;
      RptBarrasBBLabel24: TppLabel;
      RptBarrasBBLabel25: TppLabel;
      RptBarrasBBLabel26: TppLabel;
      RptBarrasBBLabel27: TppLabel;
      RptBarrasBBLabel28: TppLabel;
      RptBarrasBBLabel29: TppLabel;
      RptBarrasBBLabel30: TppLabel;
      LblAceite2: TppLabel;
      RptBarrasBBLabel32: TppLabel;
      RptBarrasBBLine24: TppLine;
      RptBarrasBBLine25: TppLine;
      RptBarrasBBLine26: TppLine;
      RptBarrasBBLine27: TppLine;
      RptBarrasBBLine28: TppLine;
      LblNomeBanco1: TppLabel;
      LblNumBanco1: TppLabel;
      RptBarrasBBLine30: TppLine;
      RptBarrasBBLine31: TppLine;
      RptBarrasBBLine32: TppLine;
      RptBarrasBBLine33: TppLine;
      RptBarrasBBLine34: TppLine;
      RptBarrasBBLine35: TppLine;
      RptBarrasBBLine37: TppLine;
      RptBarrasBBLine38: TppLine;
      RptBarrasBBLabel36: TppLabel;
      RptBarrasBBLine40: TppLine;
      RptBarrasBBLabel37: TppLabel;
      RptBarrasBBLabel39: TppLabel;
      RptBarrasBBLabel40: TppLabel;
      RptBarrasBBLabel41: TppLabel;
      RptBarrasBBLabel43: TppLabel;
      RptBarrasBBLabel44: TppLabel;
      RptBarrasBBLabel45: TppLabel;
      RptBarrasBBLabel46: TppLabel;
      RptBarrasBBLabel47: TppLabel;
      RptBarrasBBLabel48: TppLabel;
      RptBarrasBBLabel49: TppLabel;
      RptBarrasBBLabel50: TppLabel;
      RptBarrasBBLabel51: TppLabel;
      RptBarrasBBLabel52: TppLabel;
      RptBarrasBBLabel53: TppLabel;
      RptBarrasBBLabel54: TppLabel;
      RptBarrasBBLabel55: TppLabel;
      RptBarrasBBLine44: TppLine;
      RptBarrasBBLabel56: TppLabel;
      RptBarrasBBLine45: TppLine;
      RptBarrasBBLabel57: TppLabel;
      RptBarrasBBLabel58: TppLabel;
      RptBarrasBBLabel59: TppLabel;
      RptBarrasBBLabel60: TppLabel;
      RptBarrasBBLabel61: TppLabel;
      RptBarrasBBLabel62: TppLabel;
      RptBarrasBBLabel63: TppLabel;
      LblAceite1: TppLabel;
      RptBarrasBBLabel65: TppLabel;
      RptBarrasBBLine46: TppLine;
      RptBarrasBBLine47: TppLine;
      RptBarrasBBDBText1: TppDBText;
      RptBarrasBBCalc1: TppCalc;
      RptBarrasBBDBText2: TppDBText;
      RptBarrasBBDBText4: TppDBText;
      RptBarrasBBDBText5: TppDBText;
      RptBarrasBBDBText6: TppDBText;
      RptBarrasBBLabel35: TppLabel;
      RptBarrasBBLabel38: TppLabel;
      RptBarrasBBLabel66: TppLabel;
      LblCarteira1: TppLabel;
      RptBarrasBBDBText3: TppDBText;
      RptBarrasBBDBText7: TppDBText;
      RptBarrasBBLabel69: TppLabel;
      RptBarrasBBLabel70: TppLabel;
      RptBarrasBBLabel71: TppLabel;
      RptBarrasBBDBText17: TppDBText;
      RptBarrasBBDBText18: TppDBText;
      RptBarrasBBLabel72: TppLabel;
      RptBarrasBBDBText19: TppDBText;
      RptBarrasBBDBText20: TppDBText;
      RptBarrasBBDBText21: TppDBText;
      RptBarrasBBDBText22: TppDBText;
      RptBarrasBBDBText23: TppDBText;
      RptBarrasBBDBText24: TppDBText;
      RptBarrasBBDBText25: TppDBText;
      RptBarrasBBDBText26: TppDBText;
      RptBarrasBBDBText27: TppDBText;
      RptBarrasBBLabel73: TppLabel;
      RptBarrasBBDBText28: TppDBText;
      RptBarrasBBDBText29: TppDBText;
      RptBarrasBBDBText30: TppDBText;
      RptBarrasBBDBText31: TppDBText;
      RptBarrasBBDBText32: TppDBText;
      RptBarrasBBDBText33: TppDBText;
      RptBarrasBBDBText34: TppDBText;
      RptBarrasBBLabel74: TppLabel;
      LblEmpresa2: TppLabel;
      RptBarrasBBDBText40: TppDBText;
      RptBarrasBBDBText41: TppDBText;
      RptBarrasBBDBText42: TppDBText;
      LblCarteira2: TppLabel;
      RptBarrasBBDBText43: TppDBText;
      RptBarrasBBDBText44: TppDBText;
      RptBarrasBBCalc2: TppCalc;
      RptBarrasBBDBText45: TppDBText;
      RptBarrasBBDBText46: TppDBText;
      LblEmpresa: TppLabel;
      RptBarrasBBDBText47: TppDBText;
      RptBarrasBBDBText48: TppDBText;
      RptBarrasBBDBText49: TppDBText;
      Barras: TppDBBarCode;
      RptBarrasBBLine51: TppLine;
      ImgLogo1: TppImage;
      ImgLogo2: TppImage;
      MemMensagem2: TppMemo;
      MemMensagem1: TppMemo;
      LblEspecieDoc1: TppLabel;
      LblEspecieDoc2: TppLabel;
      PpmImagem: TPopupMenu;
      MnuSeleciona: TMenuItem;
      MnuImgPadrao: TMenuItem;
      MnuLimpaImg: TMenuItem;
      MnuUnibanco: TMenuItem;
      MnuBancoDoBrasil: TMenuItem;
      MnuBanerj: TMenuItem;
      MnuBradesco: TMenuItem;
      MnuCaixa: TMenuItem;
      MnuItau: TMenuItem;
      MnuMeridional: TMenuItem;
      MnuAbn: TMenuItem;
      MnuReal: TMenuItem;
      MnuHsbc: TMenuItem;
      OpFoto: TOpenPictureDialog;
      DsBloquete: TwwDataSource;
      LblPortForma: TLabel;
      DbLcPortador: TwwDBLookupCombo;
      Label12: TLabel;
      Label13: TLabel;
      Label14: TLabel;
      dblkTipClie: TwwDBLookupCombo;
      CmbTipoDoc: TwwDBLookupCombo;
      CMDBMODULO: TCMDBLookupCombo;
      RptModeloDBText1: TppDBText;
      PnlDocsImpressos: TPanel;
      GrdDocsImpressos: TwwDBGrid;
      SqlPortForma: TCMSqlParams;
      CdsPortForma: TCMClientDataSet;
      CdsBloquete: TCMClientDataSet;
      SqlBloquete: TCMSqlParams;
      CdsBloqueteTipoCli: TCMClientDataSet;
      SqlBloqueteTipoCli: TCMSqlParams;
      CdsBloqImpressos: TCMClientDataSet;
      SqlBloqImpressos: TCMSqlParams;
      CdsBanco: TCMClientDataSet;
      SqlBanco: TCMSqlParams;
      CdsModulo: TCMClientDataSet;
      SqlModulo: TCMSqlParams;
      CdsTipoDoc: TCMClientDataSet;
      SqlTipoDoc: TCMSqlParams;
      CdsAux: TCMClientDataSet;
      SqlAux: TCMSqlParams;
      CdsTipClie: TCMClientDataSet;
      SqlTipClie: TCMSqlParams;
      CdsDadosCEP: TStringField;
      CdsDadosCODESTADO: TStringField;
      CdsDadosCIDADE: TStringField;
      CdsDadosBAIRRO: TStringField;
      CdsDadosCOMPLEMENTO: TStringField;
      CdsDadosNUMERO: TStringField;
      CdsDadosLOGRADOURO: TStringField;
      CdsDadosNUMDOCUMENTO: TStringField;
      CdsDadosNOME: TStringField;
      CdsDadosVALORDESCONTO: TFloatField;
      CdsDadosDATALIMITE: TDateTimeField;
      CdsDadosDATAPROGRAMADA: TDateTimeField;
      CdsDadosCODPORTFORMA: TFloatField;
      CdsDadosDATAVENCTO: TDateTimeField;
      CdsDadosDATAREMESSA: TDateTimeField;
      CdsDadosEMISBLOQ: TStringField;
      CdsDadosSTATUS: TStringField;
      CdsDadosNODOCUMENTO: TFloatField;
      CdsDadosMOESIGLA: TStringField;
      CdsDadosCODDOCUMENTO: TFloatField;
      CdsDadosTIPO: TStringField;
      CdsDadosNOSSONUMERO: TStringField;
      CdsDadosCOMPLDOCUMENTO: TStringField;
      CdsDadosTIPOENDERECO: TStringField;
      CdsDadosNUMAGENCIA: TStringField;
      CdsDadosNUMCONTA: TStringField;
      CdsDadosVALORJUROS: TFloatField;
      CdsDadosCODBARRA: TStringField;
      CdsDadosRSALDO: TFloatField;
      CdsDadosRSALDOOUTRAMOEDA: TFloatField;
      CdsDadosCODBARRADIG: TStringField;
      CdsDadosFLGGRUPO: TStringField;
      CdsDadosAGENCIACODCEDENTE: TStringField;
      DBcboUsuario: TCMDBLookupCombo;
      Label15: TLabel;
      sqlUsuario: TCMSqlParams;
      cdsUsuario: TCMClientDataSet;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    CdsDadosDATAEMISSAO: TDateTimeField;
    CdsDadosDATADOCUMENTO: TDateTimeField;
    Label11: TLabel;
    cdsMSG: TCMClientDataSet;
    sqlMsg: TCMSqlParams;
    dblkmsg: TwwDBLookupCombo;
    Edit9: TEdit;
    CdsDadosNUMEMPRESABANCO: TStringField;

      procedure MnuLimpaImgClick(Sender: TObject);
      procedure MnuUnibancoClick(Sender: TObject);

      procedure FormCreate(Sender: TObject);
      procedure MnuSelecionaClick(Sender: TObject);
      procedure DsgnCMShow(Sender: TObject);
      procedure MemMensagem1Print(Sender: TObject);
      procedure CmbModeloCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; Modified: Boolean);
      procedure BtnImprimeClick(Sender: TObject);
      procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
      procedure CmeCadastroEdit(Sender: TObject);
      procedure CmeCadastroInsert(Sender: TObject);
      procedure CmeCadastroFind(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
      procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
      procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
      procedure RptModeloBeforePrint(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure dblkmsgCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkmsgChange(Sender: TObject);
  private
    Fidmodulo: integer;
    Fidusuario: integer;
    Fcodtipodoc: integer;
    Fidconfigbarras: integer;
    Fidtipocliente: integer;
    Fcodportadorforma: integer;
    Fcoddocumento: integer;
    procedure Setcodtipodoc(const Value: integer);
    procedure Setidconfigbarras(const Value: integer);
    procedure Setidmodulo(const Value: integer);
    procedure Setidtipocliente(const Value: integer);
    procedure Setidusuario(const Value: integer);
    procedure Setcodportadorforma(const Value: integer);
    procedure Setcoddocumento(const Value: integer);

   private  // Public declarations

      CtrlConfigbarras: TCtrlConfigbarras;
      CtrlIntBanco: TCtrlIntBanco;

      bSelecionaBloquetos, bMudouImagem: Boolean;
      iDigito11: Longint;
      ListDbg: TStrings;
      bGravaImpressao: Boolean;

      fCodPortForma: Integer;
      { Seleciona o PORTADORFORMA de acordo com o controle dblcPortadorForma.
       Apenas se a variável fCodPortForma < 0   }

      function GetCodPortForma: Integer;
      procedure CdsDadosCalcFields;
      function RemoveAllChar(S: String): String;
      procedure SetaLabelRpt(Edt: TwwDBEdit; Lbl: TppLabel);

      //andré tavares - cálculo do dv do nossonúmero do banco Banespa
      function CalculaDvBANESPA(sNossoNumero: String): String;
      function CalculaDv1Dv2CampoLivreBANESPA(sCampoLivre: String): String;

      //andré  tavares - 19/10/2007 - monta o nossonúmero dos boletos do besc
      function montaNossoNumeroBESC(sNossoNumero: string): string;
      //andré  tavares - 20/10/2007 - monta o campolivre dos boletos do besc que
      //irá concatenar com o restante da linha digitável
      function montaCampolivreBESC(sDados: string): string;



      { Rotina generica para cálculo do dígito verificador com variaçao apenas da Base ( Módulo ) }
      function CalculaDac(sNossoNumero: String; iModulo: Integer): String;
      { Rotina para cálculo do dígito verificador para o Banco 341 > Itaú }
      function CalculaDac341(sNossoNumero: String): String;
      { Rotina para cálculo do dígito verificador fixo com módulo 11 }
      function CalculaDac11(sNum: String): Integer;
      function CalculaModulo11HSBC(sNossoNumero: String): String;
      function MontaBarras(bCodBarras: Boolean): String;
      function MontaCampoLivre: String;
      function calculadigd: String;

      function NossoNumeroIsEmpty(sNossoNumero: String): Boolean;

      procedure OpenBloquete(ClientDataset: TClientDataset);

   protected

      procedure SelDados; override;
      procedure SelModelo; override;
      procedure InsereCdsPrincipal; override;
      function TestaImpressao: Boolean; override;
      procedure AbreCdsPrincipal(iId: Integer); override;


   public   // Public declarations

      controlerem, PORTFORMA: Integer;
      diasprotesto: real;

      //início - andre tavares - pendência 22079 - 17/07/2006
      property coddocumento      : integer read Fcoddocumento     write Setcoddocumento      default 0;
      property idconfigbarras    : integer read Fidconfigbarras   write Setidconfigbarras    default 0;
      property codportadorforma  : integer read Fcodportadorforma write Setcodportadorforma  default 0;
      property idtipocliente     : integer read Fidtipocliente    write Setidtipocliente     default 0;
      property codtipodoc        : integer read Fcodtipodoc       write Setcodtipodoc        default 0;
      property idmodulo          : integer read Fidmodulo         write Setidmodulo          default 0;
      property idusuario         : integer read Fidusuario        write Setidusuario         default 0;

      procedure HabilitaImpressao(bImprime: Boolean); override;
      procedure TRATACMBMODELO;

      procedure MsgErro( sMsg : string );

    end;



var
  FrmConfigBarrasCMMT: TFrmConfigBarrasCMMT;
  CtrlParamBloqueteCobranca : TCtrlParamBloqueteCobranca; //ANDRE TAVARES 03/06/2006

Implementation

{$R *.DFM}
{$R *.RES}

Uses uMensErro, uSistema, dBaseDados, ufuncaogeral, uCMTypes, uIntBancoManager;



procedure TFrmConfigBarrasCMMT.OpenBloquete(ClientDataset: TClientDataset);
begin
      ClientDataSet.Data := CtrlParamBloqueteCobranca.GetDocsEmissao(sistema.IdEmpresa, StrToIntDef(DBcboUsuario.LookupValue, 0), 'N', StrToIntDef(CMDBMODULO.LookupValue, 0), 0,
                                                                     GetCodPortForma, StrToIntDef(dblkTipClie.LookupValue, 0),
                                                                     false, strToIntDef(CmbTipoDoc.LookupValue, 0), fcoddocumento);

      if Trim(CmbTipoDoc.Text) <> '' then
      begin
        ClientDataSet.Filter := ' CODTIPDOC = ' + CmbTipoDoc.LookupValue;
        ClientDataSet.Filtered := True;
      end;

      if DBcboUsuario.LookupValue <> '' then
      begin
         if ClientDataSet.Filter <> '' then
            ClientDataSet.Filter := ClientDataSet.Filter + ' AND IDUSUARIOINCLUSAO = ' + DBcboUsuario.LookupValue
         else
            ClientDataSet.Filter := ' IDUSUARIOINCLUSAO = ' + DBcboUsuario.LookupValue;
            ClientDataSet.Filtered := True;
      end;

end;

function TFrmConfigBarrasCMMT.CalculaDigd: String; //Maria 26/07
var
  I, Multiplicador, Val, Valor: Integer;
  sNossoNumero, sNumAgencia, sNumConta: String;
begin
  sNumAgencia := RemoveAllChar(CdsDados.FieldByName('NUMAGENCIA').AsString);
  sNumConta := RemoveAllChar(CdsDados.FieldByName('NUMCONTA').AsString);

  sNossoNumero := RemoveAllChar(CdsDados.FieldByName('NOSSONUMERO').AsString);

  Result := sNossoNumero +
    ZD(Copy(sNumAgencia, 1, Length(sNumAgencia) - 1), 4) +
    ZD(Copy(sNumConta, 1, Length(sNumConta) - 1), 7);
  if (Length(Result) Mod 2) <> 0 then
    Multiplicador := 2
  else
    Multiplicador := 1;

  Valor := 0;

  for I := 1 To Length(Result) do
  begin
    Val := StrToInt(Copy(Result, I, 1)) * Multiplicador;
    if Val >= 10 then
      Val := StrToInt(Copy(IntToStr(Val), 1, 1)) + StrToInt(Copy(IntToStr(Val), 2, 1));
    Valor := Valor + Val;
    if Multiplicador = 1 then
      Multiplicador := 2
    else
      Multiplicador := 1;
  end;

  Result := '0';
  if (Valor Mod 10) <> 10 then
    Result := IntToStr(10 - (Valor Mod 10));
end;



procedure TFrmConfigBarrasCMMT.HabilitaImpressao(bImprime: Boolean);
begin
  Inherited;
  if bImprime then
  begin
    DsBloquete.DataSet := CdsBloquete;
    {PANEL que exibe na GRID os Documentos que serão impressos}
    PnlDocsImpressos.Visible := False;

    if bImprime then
      GroupBox1.Align := alNone
    else
    begin
      GroupBox1.Align := alBottom;
    end;

    SqlTipoDoc.Prepare;
    SqlTipoDoc.ParambyName('RECPAG').AsString := ParamIntegra.RecPag;
    SqlTipoDoc.ParambyName('idusuario').AsInteger := sistema.idusuario;
    SqlTipoDoc.Open;

    SqlTipClie.Open;
    SqlModulo.Open;
    sqlUsuario.Open;

    if CdsModelo.Locate('IDCONFIGBARRAS', VarArrayOf([Fidconfigbarras]), [loCaseInsensitive, loPartialKey]) then
    begin
      CmbModelo.Text        := CdsModelo.fieldByName('DESCCONFIGBARRAS').asString;
      CmbModelo.LookupValue := CdsModelo.fieldByName('IDCONFIGBARRAS').asString;
    end;

    TRATACMBMODELO;
    if (not CdsBanco.IsEmpty) and (CdsBanco.Locate('CODPORTFORMA', VarArrayOf([Fcodportadorforma]), [loCaseInsensitive, loPartialKey])) then
    begin
      DbLcPortador.Text        := CdsBanco.fieldByName('DESCRICAO').asString;
      DbLcPortador.LookupValue := CdsBanco.fieldByName('CODPORTFORMA').asString;
    end;

    if CdsTipClie.Locate('IDTIPOCLIENTE', VarArrayOf([Fidtipocliente]), [loCaseInsensitive, loPartialKey]) then
    begin
      dblkTipClie.Text        := CdsTipClie.fieldByName('DESCRICAO').asString;
      dblkTipClie.LookupValue := CdsTipClie.fieldByName('IDTIPOCLIENTE').asString;
    end;

    if CdsTipoDoc.Locate('CODTIPDOC', VarArrayOf([Fcodtipodoc]), [loCaseInsensitive, loPartialKey]) then
    begin
      CmbTipoDoc.Text        := CdsTipoDoc.fieldByName('DESCRICAO').asString;
      CmbTipoDoc.LookupValue := CdsTipoDoc.fieldByName('CODTIPDOC').asString;
    end;

    if CdsModulo.Locate('IDMODULO', VarArrayOf([Fidmodulo]), [loCaseInsensitive, loPartialKey]) then
    begin
      cmdbmodulo.Text        := CdsModulo.fieldByName('NOMEMODULO').asString;
      cmdbmodulo.LookupValue := CdsModulo.fieldByName('IDMODULO').asString;
    end;

    if cdsUsuario.Locate('IDUSUARIO', VarArrayOf([fidusuario]), [loCaseInsensitive, loPartialKey]) then
    begin
      DBcboUsuario.Text        := cdsUsuario.fieldByName('NOMEUSUARIO').asString;
      DBcboUsuario.LookupValue := cdsUsuario.fieldByName('IDUSUARIO').asString;
    end;

    CAPTION := 'Impressão  de Bloquetos (Ficha de Compensação) Com Código de Barras';
    Height := 550;
  end
  else
  begin
    CAPTION := 'Configuração de Bloquetos (Ficha de Compensação) Com Código de Barras';
    Height := 314;
  end;
end;

procedure TFrmConfigBarrasCMMT.CmeCadastroInsert(Sender: TObject);
begin
  Inherited;
  ImgBanco.picture := Nil;
  if DeRelatorio.CanFocus then
    DeRelatorio.SetFocus;
end;

procedure TFrmConfigBarrasCMMT.CmeCadastroEdit(Sender: TObject);
begin
  Inherited;
  if DeRelatorio.CanFocus then
    DeRelatorio.SetFocus;
end;



procedure TFrmConfigBarrasCMMT.SelDados;
var
  sSql: String;
  rNossoNumero, rNossoNumeroTemp: Extended;
  sNossoNumero, sString: String;
  bEspera: boolean;
begin
  Inherited;
  
  fCodPortForma := -1;
  with SqlDados do
  begin
    SQL.Clear;
    SQL.Append('SELECT ');
    SQL.Append('  E.CEP, ES.CODESTADO, C.NOME AS CIDADE, E.BAIRRO,  ');
    SQL.Append('  E.COMPLEMENTO, E.NUMERO, E.LOGRADOURO, P.NUMDOCUMENTO, ');
    SQL.Append('  P.RAZAOSOCIAL AS NOME, D.VALORDESCONTO, D.DATALIMITE, D.DATAPROGRAMADA, ');
    SQL.Append('  D.CODPORTFORMA, D.DATAVENCTO, D.DATAREMESSA, D.EMISBLOQ, D.STATUS, ');
    SQL.Append('  D.DATAEMISSAO, D.DATAEMISSAO AS DATADOCUMENTO, D.NODOCUMENTO, M.MOESIGLA, D.CODDOCUMENTO, P.TIPO, D.NOSSONUMERO, ');
    SQL.Append('  D.COMPLDOCUMENTO, E.TIPOENDERECO, AB.NUMAGENCIA, PC.NOCONTACORR AS NUMCONTA, F.JUROSPORDIA AS VALORJUROS, ');
    SQL.Append('  (''01234567890123456789012345678901234567890123'') AS CODBARRA, (0) As rSaldo, (0) As rSaldoOutraMoeda, ');
    SQL.Append('  (''00186.99595  90309.403922  00152.059168                                      000'') AS CODBARRADIG, ('' '') AS FLGGRUPO, ');
    SQL.Append('  (''01234567890123456789012345678901234567890123'') AS AGENCIACODCEDENTE, ');
    SQL.Append('  (''00000-00'') AS NUMEMPRESABANCO ');
    SQL.Append(' FROM ');
    SQL.Append('  ENDPESS E, CIDADES C, ESTADO ES,  ');
    SQL.Append('  PESSOA P, ');
    SQL.Append('  DOCUMENTO D, ');
    SQL.Append('  PORTADORFORMA F , ');
    SQL.Append('  MOEDA M, ');
    SQL.Append('  AGENCIABANCARIA AB, ');
    SQL.Append('  PORTADORCONTA PC ');
    SQL.Append(' WHERE 1=2  ');
    Open;
  end;

  { -----------------------------------------------------------------------------
    Pega o PORTADORFORMA selecionado no DBLCPortador. Só faz isso se a variável
    fCodPortForma < 0
    ----------------------------------------------------------------------------- }
  GetCodPortForma;

  if fCodPortadorForma > 0 then
    fCodPortForma := fCodPortadorForma;

  if trim(IntBancoManager.NossoNumero) = '' then
    IntBancoManager.NossoNumero := '0';
    
  IntBancoManager.NossoNumero := floatToStr(CtrlConfigbarras.GetNossoNumero(fCodPortForma));
  cdsPortForma.Edit;
  cdsPortForma.FieldByName('NOSSONUMERO').asString := IntBancoManager.NossoNumero;

  try
    rNossoNumero := strToFloat(IntBancoManager.NossoNumero);
  except
    rNossoNumero := 0;
  end;

  if (cdsPortForma.IsEmpty = false) and
     (trim(cdsPortForma.FieldByName('NOSSONUMERO').asString) = '') and
     (MsgDlg('Atenção! O campo "Nosso Número" do cadastro de portador forma não está preenchido.'+ #13#10 +
             'Confirma a impressão?', 'Confirmar', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
  begin
    bGravaImpressao := False;
    bImprimeRelat   := False;
    Abort;
  end;

  TestaImpressao;
  {ADICIONA DADOS PARA IMPRESSÃO}
  if bSelecionaBloquetos then
  begin
    { Passa parâmetros para seleção dos bloquetos }
    bGravaImpressao := False;

    Try
      SCREEN.Cursor := crHourGlass;
      if not(PnlDocsImpressos.Visible) then
      begin
        if Trim(dblkTipClie.Text) <> '' then
          DsBloquete.DataSet := CdsBloqueteTipoCli
        else
          DsBloquete.DataSet := CdsBloquete;
      end;

      bGravaImpressao := (DsBloquete.DataSet <> CdsBloqImpressos);

      with (DsBloquete.DataSet As TCMClientDataSet) do
      begin
        if bGravaImpressao then
        begin

          OpenBloquete(DsBloquete.DataSet as TCmClientDataSet);

        end;

        SqlDados.Open;

        { ------------------------------------------------------------------------------ }
                // Inicializar o NossoNumero
        if bGravaImpressao then
        begin
          ListDbg.Add('Nosso Número do portador forma: ' + CdsPortForma.FieldByName('NOSSONUMERO').AsString);
          if CdsPortForma.FieldByName('NOSSONUMERO').IsNull then
            rNossoNumero := 0
          else
            rNossoNumero := CdsPortForma.FieldByName('NOSSONUMERO').AsFloat;
        end
        else
          rNossoNumero := 0;
          
        if not(IsEmpty) then
        begin
          bImprimeRelat := True;

          //Valida o endereço do cliente no boleto
          CtrlIntBanco.IndiceDoBanco := CdsPortForma.FieldByName('CodArquivoRemessa').AsInteger;

          if (MsgDlg('Existe(m) ' + IntToStr(RecordCount) + ' documentos pendente(s) para impressão' +
            (#13 + #10) + 'Confirma a Impressão da(s) Ficha(s) de Compensação?',
            'Confirmar', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
          begin

            //David - Pendência 26006
            bImprimeRelat := False;

            SCREEN.Cursor := crDefault;
            MsgDlg('Impressão cancelada pelo usuário.', 'Aviso', mtWarning, [mbOK], 0);
            exit;
          end;

          if bGravaImpressao then
          begin
            { ------------------------------------------------------------------
              Testa se o Nosso Numero no PORTADOR FORMA está em Branco e
              configura o tamanho do mesmo de acordo com o que foi informado
              no cadastro de modelo de Ficha de Compensação.
              ------------------------------------------------------------------ }
            if not(NossoNumeroIsEmpty(CdsPortForma.FieldByName('NOSSONUMERO').AsString)) then
              rNossoNumero := StrToFloat(Copy(CdsPortForma.FieldByName('NOSSONUMERO').AsString, 1,
                CdsModelo.FieldByName('TAMNOSSONUMERO').AsInteger))
            else
              rNossoNumero := 0;

            ListDbg.Add('Nosso Número Inicial para impressão: ' + FloatToStr(rNossoNumero));
          end;

          { -----------------------------------------------------------------------------
            Insere os Registros do Bloqueto para Impressão
            ----------------------------------------------------------------------------- }
          First;
          While (not(EOF)) do
          begin
            CdsDados.Append;
            CdsDados.FieldByName('CEP').Value := FieldByName('CEP').Value;
            CdsDados.FieldByName('CODESTADO').Value := FieldByName('CODESTADO').Value;
            CdsDados.FieldByName('CIDADE').Value := FieldByName('CIDADE').Value;
            CdsDados.FieldByName('BAIRRO').Value := FieldByName('BAIRRO').Value;
            CdsDados.FieldByName('COMPLEMENTO').Value := FieldByName('COMPLEMENTO').Value;
            CdsDados.FieldByName('NUMERO').Value := FieldByName('NUMERO').Value;
            CdsDados.FieldByName('LOGRADOURO').Value := FieldByName('LOGRADOURO').Value;
            CdsDados.FieldByName('NUMDOCUMENTO').Value := FieldByName('NUMDOCUMENTO').Value;
            CdsDados.FieldByName('NOME').Value := FieldByName('NOME').Value;
            CdsDados.FieldByName('VALORDESCONTO').Value := FieldByName('VALORDESCONTO').Value;
            CdsDados.FieldByName('DATALIMITE').Value := FieldByName('DATALIMITE').Value;
            CdsDados.FieldByName('DATAPROGRAMADA').Value := FieldByName('DATAPROGRAMADA').Value;
            CdsDados.FieldByName('CODPORTFORMA').Value := FieldByName('CODPORTFORMA').Value;
            CdsDados.FieldByName('DATAVENCTO').Value := FieldByName('DATAVENCTO').Value;
            CdsDados.FieldByName('DATAEMISSAO').Value := FieldByName('DATAEMISSAO').Value;
            CdsDados.FieldByName('DATADOCUMENTO').Value := FieldByName('DATADOCUMENTO').Value;
            CdsDados.FieldByName('NODOCUMENTO').Value := FieldByName('NODOCUMENTO').Value;
            CdsDados.FieldByName('MOESIGLA').Value := FieldByName('MOESIGLA').Value;
            CdsDados.FieldByName('CODDOCUMENTO').Value := FieldByName('CODDOCUMENTO').Value;
            CdsDados.FieldByName('TIPO').Value := FieldByName('TIPO').Value;
            CdsDados.FieldByName('COMPLDOCUMENTO').Value := FieldByName('COMPLDOCUMENTO').Value;
            CdsDados.FieldByName('TIPOENDERECO').Value := FieldByName('TIPOENDERECO').Value;
            CdsDados.FieldByName('NUMAGENCIA').Value := FieldByName('NUMAGENCIA').Value;
            CdsDados.FieldByName('NUMCONTA').Value := FieldByName('NUMCONTA').Value;
            CdsDados.FieldByName('VALORJUROS').Value := FieldByName('VALORJUROS').Value;
            cdsDados.FieldByName('FLGGRUPO').Value := FieldByName('FLGGRUPO').Value;
            cdsDados.FieldByName('CODBARRADIG').Value := FieldByName('CODBARRADIG').Value;
            CdsDados.FieldByName('RSALDO').Value := FieldByName('VALOR').Value;
            CdsDados.FieldByName('RSALDOOUTRAMOEDA').Value := FieldByName('VALOROM').Value;
            CdsDados.FieldByName('STATUS').AsString := '1';
            CdsDados.FieldByName('EMISBLOQ').AsString := 'S';
            CdsDados.FieldByName('DATAREMESSA').AsDateTime := Date;
            CdsDados.FieldByName('NOSSONUMERO').Value := FieldByName('NOSSONUMERO').Value;
            CdsDados.FieldByName('NUMEMPRESABANCO').Value := FieldByName('NUMEMPRESABANCO').Value;

            ListDbg.Add('Nosso Número do Registro antes do processamento: ' + CdsDados.FieldByName('NOSSONUMERO').AsString + ' - ' +
              CdsDados.FieldByName('FLGGRUPO').AsString + ' - ' + CdsDados.FieldByName('NODOCUMENTO').AsString);


            if not FieldByName('NOSSONUMERO').isNull then  //se o NN do documento está preenchido
              IntBancoManager.NossoNumero := copy(FieldByName('NOSSONUMERO').Value, 4, 7)
            else
            begin
              rNossoNumero := CtrlConfigbarras.GetNossoNumero(fCodPortForma);
              IntBancoManager.NossoNumero := floatToStr(rNossoNumero);
            end;

            { ---------------------------------------------------------------------------------------
              Este CASE determina como será o calculo do DV do Nosso Número de acordo com cada BANCO.
              ------------------------------------------------------------------------------------- }
            case StrTointDef(Copy(CdsModelo.FieldByName('NUMEROBANCO').AsString, 1, 3), -1) Of

              27:
              begin
                IntBancoManager.NossoNumero := stringOfChar('0', 7 - length(IntBancoManager.NossoNumero)) + IntBancoManager.NossoNumero;
                if bGravaImpressao then
                //se nosso numero do boleto está vazio então
                if (NossoNumeroIsEmpty(CdsDados.FieldByName('NOSSONUMERO').AsString)) or
                   (CdsDados.FieldByName('NOSSONUMERO').isNull) then
                    CdsDados.FieldByName('NOSSONUMERO').AsString := montaNossoNumeroBESC(IntBancoManager.NossoNumero);
              end;

              33:
              begin // banespa

                IntBancoManager.NossoNumero := stringOfChar('0', 7 - length(IntBancoManager.NossoNumero)) + IntBancoManager.NossoNumero;
                if bGravaImpressao then
                //se nosso numero do boleto está vazio então
                if (NossoNumeroIsEmpty(CdsDados.FieldByName('NOSSONUMERO').AsString)) or
                   (CdsDados.FieldByName('NOSSONUMERO').isNull) then
                    CdsDados.FieldByName('NOSSONUMERO').AsString := CalculaDvBANESPA(copy(intToStr(CdsDados.FieldByName('NUMAGENCIA').asInteger), 1, 3) +
                                                                                     IntBancoManager.NossoNumero);
              end;

              341:
                begin
                  if bGravaImpressao then
                  begin
                    if NossoNumeroIsEmpty(CdsDados.FieldByName('NOSSONUMERO').AsString) then
                      CdsDados.FieldByName('NOSSONUMERO').AsString := CalculaDac341(FloatToStr(rNossoNumero))
                  end
                  else
                    CdsDados.FieldByName('NOSSONUMERO').AsString := CalculaDac341(CdsBloqImpressos.FieldByName('NOSSONUMERO').AsString);
                end;

              320:
                begin
                  if bGravaImpressao then
                  begin
                    if NossoNumeroIsEmpty(CdsDados.FieldByName('NOSSONUMERO').AsString) then
                      CdsDados.FieldByName('NOSSONUMERO').AsString := CalculaDac(
                        ZD(Copy(RemoveAllChar(CdsDados.FieldByName('NUMAGENCIA').AsString), 1, 3), 3) +
                        ZD(Copy(FloatToStr(rNossoNumero), 1, 6), 6), 320)
                  end
                  else
                    CdsDados.FieldByName('NOSSONUMERO').AsString := CalculaDac(
                      ZD(Copy(RemoveAllChar(CdsDados.FieldByName('NUMAGENCIA').AsString), 1, 3), 3) +
                      ZD(Copy(Trim(CdsBloqImpressos.FieldByName('NOSSONUMERO').AsString), 1, 6), 6), 320);
                end;

              399:
                begin
                  if CdsPortForma.FieldByName('CODARQUIVOREMESSA').AsString <> '9' then
                  begin
                    if bGravaImpressao then
                    begin
                      if NossoNumeroIsEmpty(CdsDados.FieldByName('NOSSONUMERO').AsString) then
                        CdsDados.FieldByName('NOSSONUMERO').AsString := CalculaModulo11(Trim(FloatToStr(rNossoNumero)), True, 7)
                      else
                        CdsDados.FieldByName('NOSSONUMERO').AsString :=
                          CalculaModulo11(Trim(CdsDados.FieldByName('NOSSONUMERO').AsString), True, 7);
                    end
                    else
                      CdsDados.FieldByName('NOSSONUMERO').AsString :=
                        CalculaModulo11(Trim(CdsBloqImpressos.FieldByName('NOSSONUMERO').AsString), True, 7);

                  end
                  else
                  begin
                    if bGravaImpressao then
                    begin
                      if NossoNumeroIsEmpty(CdsDados.FieldByName('NOSSONUMERO').AsString) then
                      begin
                        CdsDados.FieldByName('NOSSONUMERO').AsString := FloatToStr(rNossoNumero) +
                          CalculaModulo11HSBC(Trim(FloatToStr(rNossoNumero)));
                        {Soma o NOSSONUMERO + NUMEMPRESABANCO + DATAVENCIMENTO}
                        rNossoNumeroTemp := StrToFloat(CdsDados.FieldByName('NOSSONUMERO').AsString + '4') +
                          CdsPortForma.FieldByName('NUMEMPRESABANCO').AsFloat +
                          StrToFloat(RemoveBarras(CdsDados.FieldByName('DATAPROGRAMADA').AsString));
                        sString := CalculaModulo11HSBC(FloatToStr(rNossoNumeroTemp));
                        CdsDados.FieldByName('NOSSONUMERO').AsString := CdsDados.FieldByName('NOSSONUMERO').AsString + '4' + sString;
                      end
                      else
                      begin
                        CdsDados.FieldByName('NOSSONUMERO').AsString := CdsDados.FieldByName('NOSSONUMERO').AsString +
                          CalculaModulo11HSBC(CdsDados.FieldByName('NOSSONUMERO').AsString);
                        {Soma o NOSSONUMERO + NUMEMPRESABANCO + DATAVENCIMENTO}
                        rNossoNumeroTemp := StrToFloat(CdsDados.FieldByName('NOSSONUMERO').AsString + '4') +
                          CdsPortForma.FieldByName('NUMEMPRESABANCO').AsFloat +
                          StrToFloat(RemoveBarras(CdsDados.FieldByName('DATAPROGRAMADA').AsString));
                        sString := CalculaModulo11HSBC(FloatToStr(rNossoNumeroTemp));
                        CdsDados.FieldByName('NOSSONUMERO').AsString := CdsDados.FieldByName('NOSSONUMERO').AsString + '4' + sString;
                      end
                    end
                    else
                    begin
                      CdsDados.FieldByName('NOSSONUMERO').AsString := CdsBloqImpressos.FieldByName('NOSSONUMERO').AsString +
                        CalculaModulo11HSBC(CdsBloqImpressos.FieldByName('NOSSONUMERO').AsString);
                      {Soma o NOSSONUMERO + NUMEMPRESABANCO + DATAVENCIMENTO}
                      rNossoNumeroTemp := StrToFloat(CdsDados.FieldByName('NOSSONUMERO').AsString + '4') +
                        CdsPortForma.FieldByName('NUMEMPRESABANCO').AsFloat +
                        StrToFloat(RemoveBarras(CdsDados.FieldByName('DATAPROGRAMADA').AsString));
                      sString := CalculaModulo11HSBC(FloatToStr(rNossoNumeroTemp));
                      CdsDados.FieldByName('NOSSONUMERO').AsString := CdsDados.FieldByName('NOSSONUMERO').AsString + '4' + sString;
                    end;
                  end;
                end;

              641:
                begin
                  if bGravaImpressao then
                  begin
                    if NossoNumeroIsEmpty(CdsDados.FieldByName('NOSSONUMERO').AsString) then
                    begin
                      sString := ZD(CdsPortForma.FieldByName('NUMEMPRESABANCO').AsString, 7) +
                        ZD(CalculaModulo11(Trim(FloatToStr(rNossoNumero)), True, 8), 8);
                      CdsDados.FieldByName('NOSSONUMERO').AsString := CalculaModulo11(sString, True, 9);
                    end
                    else
                    begin
                      sString := ZD(CdsPortForma.FieldByName('NUMEMPRESABANCO').AsString, 7) +
                        ZD(CalculaModulo11(Trim(CdsDados.FieldByName('NOSSONUMERO').AsString), True, 9), 8);
                      CdsDados.FieldByName('NOSSONUMERO').AsString := CalculaModulo11(sString, True, 9);
                    end;
                  end
                  else
                  begin
                    sString := ZD(CdsPortForma.FieldByName('NUMEMPRESABANCO').AsString, 7) +
                      ZD(CalculaModulo11(Trim(CdsBloqImpressos.FieldByName('NOSSONUMERO').AsString), True, 9), 8);
                    CdsDados.FieldByName('NOSSONUMERO').AsString := CalculaModulo11(sString, True, 9);
                  end;
                end;

              275, 356: {Serve tanto para COBRANÇA REGISTRADA quanto para COBRANÇA SEM REGISTRO - Fábio Barros 15/03/2002}
                begin

                  if NossoNumeroIsEmpty(FieldByName('NOSSONUMERO').AsString) then
                    CdsDados.FieldByName('NOSSONUMERO').AsString := FloatToStr(rNossoNumero) + IntToStr(
                      CalculaDac10(ZD(CdsPortForma.FieldByName('NUMEMPRESABANCO').AsString, 15) +
                      ZD(Copy(RemoveAllChar(CdsDados.FieldByName('NUMAGENCIA').AsString), 1, 4), 4) +
                      ZD(Copy(RemoveAllChar(CdsDados.FieldByName('NUMCONTA').AsString), 1, 7), 7)))
                  else
                    CdsDados.FieldByName('NOSSONUMERO').AsString := Trim(FieldByName('NOSSONUMERO').AsString);
                end;
              409: {COBRANÇA COM REGISTRO}
                begin
                  if NossoNumeroIsEmpty(CdsBloqImpressos.FieldByName('NOSSONUMERO').AsString) then
                    CdsDados.FieldByName('NOSSONUMERO').AsString := CalcMod11Unibanco('1' +
                      CalcMod11Unibanco(FloatToStr(rNossoNumero)))
                  else
                    CdsDados.FieldByName('NOSSONUMERO').AsString := CalcMod11Unibanco('1' +
                      CalcMod11Unibanco(Trim(CdsBloqImpressos.FieldByName('NOSSONUMERO').AsString)));
                end;

              { Outro tipo de Modelo }
            else
              begin
                if bGravaImpressao then
                begin
                  if NossoNumeroIsEmpty(CdsDados.FieldByName('NOSSONUMERO').AsString) then
                    CdsDados.FieldByName('NOSSONUMERO').AsString := CalculaDac(FloatToStr(rNossoNumero), 11)
                end
                else
                    CdsDados.FieldByName('NOSSONUMERO').AsString := CalculaDac(CdsPortForma.FieldByName('NOSSONUMERO').AsString, 11);
              end;
            end;
            {  ----------------------------------------------------------------------------- }
            CdsDados.FieldByName('CODBARRA').AsString := MontaBarras(True);    //'01234567890123456789012345678901234567890123'
            CdsDados.FieldByName('CODBARRADIG').AsString := MontaBarras(False); //00186.99595  90309.403922  00152.059168         123'

            if CdsDados.FieldByName('MOESIGLA').IsNull then
              CdsDados.FieldByName('MOESIGLA').AsString := 'R$';
            CdsDadosCalcFields;

            CdsDados.Post;
            ListDbg.Add('Nosso Número do Registro depois do processamento: ' + CdsDados.FieldByName('NOSSONUMERO').AsString + ' - ' +
              CdsDados.FieldByName('FLGGRUPO').AsString + ' - ' + CdsDados.FieldByName('NODOCUMENTO').AsString);

            Next;
          end; // case

          if bGravaImpressao then
          begin

            //David - Pendência 26006
            if bImprimeRelat then
            begin

              CtrlConfigbarras.AtualizaDoc(CdsDados, IntToStr(CdsPortForma.FieldByName('CONTROLEREMESSA').AsInteger + 1), fCodPortForma);

              //Varre o dadaset de dados e valida o preenchimento do NOSSONUMERO
              CdsDados.First;
              while not CdsDados.Eof do
              begin
                sNossoNumero := CtrlConfigbarras.RecuperaNossoNumero( IntToStr(CdsPortForma.FieldByName('CONTROLEREMESSA').AsInteger + 1), CdsDados.FieldByName('CODDOCUMENTO').AsFloat, CdsDados.FieldByName('FLGGRUPO').AsString );

                if trim( sNossoNumero ) = '' then
                  raise Exception.Create( 'O documento ' + CdsDados.FieldByName('NODOCUMENTO').AsString + ' não possui NOSSONUMERO válido.' );

                CdsDados.Edit;
                CdsDados.FieldByName('NOSSONUMERO').AsString := sNossoNumero;
                CdsDados.Post;

                CdsDados.Next;
              end;
              CdsDados.First;

            end;

            ListDbg.Add('Gravação do portador forma: ' + FloatToStr(rNossoNumero) + ' -  ' + IntToStr(GetCodPortForma));
          end;
        end // ISEMPTY
        else
        begin
          SCREEN.Cursor := crDefault;
          ShowMessage('Não Existem Documentos pendentes para impressão.');
          bImprimeRelat := False;
        end;
      end;
    Except
      On E: Exception do
      begin
        SCREEN.Cursor := crDefault;

        Raise;
      end;
    end;
  end; //ADICIONA DADOS PARA IMPRESSÃO
end;



procedure TFrmConfigBarrasCMMT.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   Accept := ( Trim( DeRelatorio.Text ) <> '') and
             ( Trim( EdnNomeBanco.Text ) <> '') and
             ( Trim( EdtNumBanco.Text ) <> '') and
             ( Trim( EdtEspecieDoc.Text ) <> '') and
             ( Trim( EdtNumDig.Text ) <> '') and
             ( Trim( EdtCodMoeda.Text ) <> '') and
             ( Trim( EdtCateira.Text ) <> '');

   if not(Accept) then
   begin
      MsgDlg('Faltam dados pra gravação do modelo', 'Aviso', mtError, [mbOK], 0);
      Repaint;
   end
   else
   begin
      Accept := ( ( EdtAceite.Text = 'S') Or ( EdtAceite.Text = 'N' ) );
      if not Accept then
      begin
         MsgDlg('Aceite deve ser S ou N', 'Aviso', mtError, [mbOK], 0);
         Repaint;
      end
      else
      begin
         inherited;
      end;
   end;
end;



function TFrmConfigBarrasCMMT.TestaImpressao: Boolean;
begin
  Result := ((Trim(CmbModelo.Text) <> '') and
    (Trim(DbLcPortador.Text) <> '')) Or
    (PnlDocsImpressos.Visible);
  bSelecionaBloquetos := Result;
end;



procedure TFrmConfigBarrasCMMT.InsereCdsPrincipal;
begin
   Cds.FieldByName('IDCONFIGBARRAS').AsFloat := -1;
   Cds.FieldByName('IDREPORTS').AsInteger    := -1;
   Cds.FieldByName('ORIGEMCM').AsInteger     := 0;
end;



procedure TFrmConfigBarrasCMMT.MnuLimpaImgClick(Sender: TObject);
begin
  Inherited;
  if (CmeCadastro.Operacao In [OpInserir, OpAlterar]) then
  begin
    ImgBanco.picture := Nil;
    ImgLogo1.picture := Nil;
    ImgLogo2.picture := Nil;
  end;
end;



procedure TFrmConfigBarrasCMMT.MnuUnibancoClick(Sender: TObject);
var
  sBanco: String;
begin
  Inherited;
  if (CmeCadastro.Operacao In [OpInserir, OpAlterar]) and
    (Sender Is TMenuItem) then
  begin
    ImgBanco.picture := Nil;
    ImgLogo1.picture := Nil;
    ImgLogo2.picture := Nil;

    case (Sender As TMenuItem).Tag Of
      0: sBanco := 'BBRASIL';
      1: sBanco := 'UNIBANCO';
      2: sBanco := 'BANERJ';
      3: sBanco := 'BRADESCO';
      4: sBanco := 'CAIXA';
      5: sBanco := 'ITAU';
      6: sBanco := 'MERIDIONAL';
      7: sBanco := 'REAL';
      8: sBanco := 'REAL';
      9: sBanco := 'BAMERINDUS';
    end;
    Try
      ImgBanco.picture.Bitmap.LoadFromResourceName(HInstance, sBanco);
      ImgLogo1.picture.Bitmap.LoadFromResourceName(HInstance, sBanco);
      ImgLogo2.picture.Bitmap.LoadFromResourceName(HInstance, sBanco);
      bMudouImagem := True;
    Except
      MsgDlg('Erro Ao Carregar Imagem do Banco', 'Aviso', mtError, [mbOK], 0);
    end;
  end;
end;

procedure TFrmConfigBarrasCMMT.FormCreate(Sender: TObject);
begin
  Inherited;
  CtrlConfigbarras := TCtrlConfigbarras.Create;
  CtrlConfigbarras.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );

  CtrlIntBanco := TCtrlIntBanco.Create;
  CtrlIntBanco.InitializeAs( CtrlConfigbarras );

  CtrlParamBloqueteCobranca := TCtrlParamBloqueteCobranca.Create; //andre tavares - 03/06/2006
  CtrlParamBloqueteCobranca.InitializeAs( CtrlConfigbarras );

  sqlMsg.Open;

  bSelecionaBloquetos := False;
  bMudouImagem := False;
  ListDbg := TStringList.Create;
  fCodPortForma := -1;
  MontaSelect.Filtro.Clear;
end;

procedure TFrmConfigBarrasCMMT.MnuSelecionaClick(Sender: TObject);
begin
  Inherited;
  if OpFoto.Execute then
  begin
    ImgBanco.picture := Nil;
    ImgLogo1.picture := Nil;
    ImgLogo2.picture := Nil;
    ImgBanco.picture.LOADFROMFILE(OpFoto.Filename);
    ImgLogo1.picture.LOADFROMFILE(OpFoto.Filename);
    ImgLogo2.picture.LOADFROMFILE(OpFoto.Filename);
    bMudouImagem := True;
  end;
end;



procedure TFrmConfigBarrasCMMT.CmeCadastroFind(Sender: TObject);
begin
  Inherited;
  if MontaSelect.RetornouValor then
  begin
    ImgBanco.picture := Nil;
  end;
end;

procedure TFrmConfigBarrasCMMT.DsgnCMShow(Sender: TObject);
begin
  Inherited;
  if (ImgBanco.picture <> Nil) and bMudouImagem then
  begin
    bMudouImagem := False;
    ImgLogo1.picture.Bitmap := ImgBanco.picture.Bitmap;
    ImgLogo2.picture.Bitmap := ImgBanco.picture.Bitmap;
  end;

  SetaLabelRpt(EdnNomeBanco, LblNomeBanco1);
  SetaLabelRpt(EdnNomeBanco, LblNomeBanco2);
  SetaLabelRpt(EdtNumBanco, LblNumBanco1);
  SetaLabelRpt(EdtNumBanco, LblNumBanco2);
  SetaLabelRpt(EdtEspecieDoc, LblEspecieDoc1);
  SetaLabelRpt(EdtEspecieDoc, LblEspecieDoc2);
  SetaLabelRpt(EdtCateira, LblCarteira1);
  SetaLabelRpt(EdtCateira, LblCarteira2);
  SetaLabelRpt(EdtAceite, LblAceite1);
  SetaLabelRpt(EdtAceite, LblAceite2);
end;

procedure TFrmConfigBarrasCMMT.SetaLabelRpt(Edt: TwwDBEdit; Lbl: TppLabel);
begin
  Inherited;
  Try
    if Edt.Modified then
      Lbl.CAPTION := Edt.Text;
  Except;

  end;
end;

function TFrmConfigBarrasCMMT.MontaBarras(bCodBarras: Boolean): String;
var
  sCodBarras, sAuxCodBarras, sBanco, sMoeda, sValor, sCampoLivre: String;
  FatorVencimento: real;
  iCdigito: Array[0..3] Of Integer;
begin

  FatorVencimento := CdsDados.FieldByName('DATAPROGRAMADA').AsDateTime - StrToDate('07/10/1997');
  // WO16145 - Inicio
  // Alterado por Arnaldo V. Scarin em 19/12/2024
  // Descrição : A partir de 22/02/2025 o Fator de Vencimento deverá ser reiniciado, pois
  // o Valor dele chegará a 9999 em 21/02/2025, e começará a gerar problemas nos boletos.
  // Para tanto, foi implementada a verificação abaixo, fazendo com que seja ajustado o
  // Fator de Vencimento.
  if FatorVencimento > 9999 then
    FatorVencimento := 1000 + CdsDados.FieldByName('DATAPROGRAMADA').AsDateTime - StrToDate('22/02/2025');
  // WO16145 - Término


  if bCodBarras then
  begin
    // -----------------------------------------------------------------------------
    // Favor comentar as mudanças neste módulo.
    // -----------------------------------------------------------------------------
        {Código do Banco}
    sBanco := Copy(RemoveAllChar(CdsModelo.FieldByName('NUMEROBANCO').AsString), 1, 3);

    {Código da Moeda}
    if CdsModelo.FieldByName('CODMOEDA').IsNull then
      sMoeda := '9'
    else
      sMoeda := Copy(CdsModelo.FieldByName('CODMOEDA').AsString, 1, 1);

    {Valor do Boleto}
    sValor := ZD(RemoveVirgulas(CdsDados.FieldByName('RSALDO').AsFloat, 2), 10);

    {Campo Livre tem 25 posições}
    sCampoLivre := MontaCampoLivre;
    sAuxCodBarras := RemoveAllChar(sBanco + sMoeda + FloatToStr(fatorvencimento) + sValor + sCampoLivre);
    {Calcula o DAC do Código de Barras}
    iDigito11 := CalculaDac11(sAuxCodBarras);
    {Retorna o CÓDIGO DE BARRAS já com o DAC}
    Result := Trim(sBanco + sMoeda + IntToStr(iDigito11) + ZD(FloatToStr(FatorVencimento), 4) + sValor + sCampoLivre);
  end
  else { Linha digitável }
  begin
    sBanco := Copy(RemoveAllChar(CdsModelo.FieldByName('NUMEROBANCO').AsString), 1, 3);
    sMoeda := CdsModelo.FieldByName('CODMOEDA').AsString;
    sCampoLivre := MontaCampoLivre;

    //Calculas os 3 Primeiros Dv's
    sCodBarras := RemoveAllChar(sBanco + sMoeda + sCampoLivre);

    //Cálculo do DV do Campo 1
    sAuxCodBarras := Copy(sCodBarras, 1, 9);
    iCdigito[0] := CalculaDac10(sAuxCodBarras);

    //Cálculo do DV do Campo 2
    sAuxCodBarras := Copy(sCodBarras, 10, 10);
    iCdigito[1] := CalculaDac10(sAuxCodBarras);

    //Cálculo do DV do Campo 3
    sAuxCodBarras := Copy(sCodBarras, 20, 10);
    iCdigito[2] := CalculaDac10(sAuxCodBarras);

    sValor := ZD(RemoveVirgulas(CdsDados.FieldByName('RSALDO').AsFloat, 2), 10);

    //Calculas o Dv Geral
    sCodBarras := sBanco + sMoeda + sCampoLivre;

    sAuxCodBarras := Copy(sCodBarras, 1, 9) + IntToStr(iCdigito[0]) +
      Copy(sCodBarras, 10, 10) + IntToStr(iCdigito[1]) +
      Copy(sCodBarras, 20, 10) + IntToStr(iCdigito[2]) + sValor;

    sAuxCodBarras := sAuxCodBarras + IntToStr(iDigito11) + ZD(FloatToStr(fatorvencimento), 4) + sValor;

    Result := Copy(sAuxCodBarras, 1, 5) + '.' +
      Copy(sAuxCodBarras, 6, 5) + '  ' +
      Copy(sAuxCodBarras, 11, 5) + '.' +
      Copy(sAuxCodBarras, 16, 6) + '  ' +
      Copy(sAuxCodBarras, 22, 5) + '.' +
      Copy(sAuxCodBarras, 27, 6) + '  ' +
      IntToStr(iDigito11) + '  ';
    Result := Result + ZD(FloatToStr(fatorvencimento), 4) + sValor;
  end;


end;

function TFrmConfigBarrasCMMT.CalculaDac(sNossoNumero: String; iModulo: Integer): String;
var
  sNumero, sAuxResult: String;
  iPosicao, iBase, X, iDividendo, iDigito, iTamNum: Integer;
begin
  sNossoNumero := RemoveAllChar(sNossoNumero);

  case iModulo Of
    11:
      begin
        sNumero := ZD(sNossoNumero, CdsModelo.FieldByName('TAMNOSSONUMERO').AsInteger);
        iBase := 9;
        iDividendo := 0;
        iTamNum := Length(sNumero) + 1;
        for X := 1 To Length(sNumero) do
        begin
          iDividendo := iDividendo + (StrToInt(sNumero[iTamNum - X]) * iBase);
          if iBase = 2 then
            iBase := 9
          else
            Dec(iBase);
        end;
        if (iDividendo Mod 11) <> 0 then
        begin
          iDigito := (iDividendo Mod 11)
        end
        else
          iDigito := 0;
        if iDigito = 10 then
        begin
          if Copy(CdsModelo.FieldByName('NUMEROBANCO').AsString, 1, 3) = '001' then
            Result := sNumero + 'X'
          else
            Result := sNumero + '0';
        end
        else
          Result := sNumero + IntToStr(iDigito);
      end;
    10:
      begin
        sNumero := Trim(sNossoNumero);
        iPosicao := Length(sNumero) + 1;
        iBase := 2;
        iDividendo := 0;
        for X := 1 To Length(sNumero) do
        begin
          sAuxResult := IntToStr((StrToInt(sNumero[iPosicao - X]) * iBase));
          if Length(sAuxResult) > 1 then
            iDividendo := iDividendo + StrToInt(sAuxResult[1]) + StrToInt(sAuxResult[2])
          else
            iDividendo := iDividendo + StrToInt(sAuxResult[1]);
          Dec(iBase);
          if iBase = 0 then
            iBase := 2;
        end;
        iDigito := 10 - (iDividendo Mod 10);
        Result := ZD(sNossoNumero + IntToStr(iDigito), 12);
      end;

    320:
      begin
        sNumero := sNossoNumero;
        iBase := 9;
        iDividendo := 0;
        iTamNum := Length(sNumero) + 1;
        for X := 1 To Length(sNumero) do
        begin
          iDividendo := iDividendo + (StrToInt(sNumero[iTamNum - X]) * iBase);
          if iBase = 2 then
            iBase := 9
          else
            Dec(iBase);
        end;
        if (iDividendo Mod 11) <> 0 then
        begin
          iDigito := (iDividendo Mod 11)
        end
        else
          iDigito := 0;
        case iDigito Of
           0: Result := sNumero + '1';  {29/04/2003 Clementino}
           1: Result := sNumero + '0';  {29/04/2003 Clementino}
          10: Result := sNumero + '0';
          11: Result := sNumero + '1';
        else
          Result := sNumero + IntToStr(iDigito);
        end;
        Result := Copy(Trim(Result), 4, Length(Trim(Result)));
      end;
  end;
end;

function TFrmConfigBarrasCMMT.CalculaDac341(sNossoNumero: String): String; //maria 08/2000
var
  sNumero: String;
  Val, Multiplicador, I: Integer;
  Valor: Integer;
begin
  sNumero := ZD(sNossoNumero, CdsModelo.FieldByName('TAMNOSSONUMERO').AsInteger);

  Result :=
    ZD(CdsDados.FieldByName('NUMAGENCIA').AsString, 4) +
    ZD(Copy(Trim(CdsDados.FieldByName('NUMCONTA').AsString), 1, Length(Trim(CdsDados.FieldByName('NUMCONTA').AsString)) - 1), 5)
    +
    ZD(CdsModelo.FieldByName('CARTEIRACOBR').AsString, 3) + sNumero;
  if (Length(Result) Mod 2) <> 0 then
    Multiplicador := 2
  else
    Multiplicador := 1;
  Valor := 0;
  for I := 1 To Length(Result) do
  begin
    Val := StrToInt(Copy(Result, I, 1)) * Multiplicador;
    if Val >= 10 then
      Val := StrToInt(Copy(IntToStr(Val), 1, 1)) + StrToInt(Copy(IntToStr(Val), 2, 1));
    Valor := Valor + Val;
    if Multiplicador = 1 then
      Multiplicador := 2
    else
      Multiplicador := 1;
  end;
  Val := (10 - (Valor Mod 10));
  if Val = 10 then
    Val := 0;
  Result := Copy(Result, Length(Result) - CdsModelo.FieldByName('TAMNOSSONUMERO').AsInteger + 1,
    CdsModelo.FieldByName('TAMNOSSONUMERO').AsInteger) + IntToStr(Val);
end;

procedure TFrmConfigBarrasCMMT.MemMensagem1Print(Sender: TObject);
var
  X: Integer;
begin
  Inherited;
  MemMensagem1.Lines.Clear;
  MemMensagem2.Lines.Clear;
  if (CdsDados.FieldByName('FLGGRUPO').AsString = 'N') then
    SqlAux.Sql.Text :=
//início - André Tavares - 28/08/2003 - pendência 13159
      'SELECT MENSAGEM1,MENSAGEM2,MENSAGEM3,MENSAGEM4,MENSAGEM5,MENSAGEM6,MENSAGEM7,MENSAGEM8,MENSAGEM9, MENSAGEM10 FROM MENSAGENSCNAB WHERE CODDOCUMENTO = ' +
       FloatToStr(CdsDados.FieldByName('CODDOCUMENTO').AsFloat)
//fim - André Tavares - 28/08/2003 - pendência 13159
  else
    SqlAux.Sql.Text :=
//início - André Tavares - 28/08/2003 - pendência 13159
      'SELECT MENSAGEM1,MENSAGEM2,MENSAGEM3,MENSAGEM4,MENSAGEM5,MENSAGEM6,MENSAGEM7,MENSAGEM8,MENSAGEM9, MENSAGEM10 FROM MENSAGENSCNAB WHERE CODGRUPOCNAB = ' +
//fim - André Tavares - 28/08/2003 - pendência 13159
      FloatToStr(CdsDados.FieldByName('CODDOCUMENTO').AsFloat);
  SqlAux.Open;

  if trim(edit1.text) <> '' then  // andre tavares - pendência 18122 - 19/11/2004 - pergunta se a linha está vazia antes de adicionar
    MemMensagem1.Lines.Add(edit1.text);
  if trim(edit2.text) <> '' then
    MemMensagem1.Lines.Add(edit2.text);
  if trim(edit3.text) <> '' then
    MemMensagem1.Lines.Add(edit3.text);
  if trim(edit4.text) <> '' then
    MemMensagem1.Lines.Add(edit4.text);
  if trim(edit5.text) <> '' then
    MemMensagem1.Lines.Add(edit5.text);
  if trim(edit6.text) <> '' then
    MemMensagem1.Lines.Add(edit6.text);
  if trim(edit7.text) <> '' then
    MemMensagem1.Lines.Add(edit7.text);
  if trim(edit8.text) <> '' then
    MemMensagem1.Lines.Add(edit8.text);
  if trim(edit9.text) <> '' then
    MemMensagem1.Lines.Add(edit9.text);

  if trim(edit1.text) <> '' then
    MemMensagem2.Lines.Add(edit1.text);
  if trim(edit2.text) <> '' then
    MemMensagem2.Lines.Add(edit2.text);
  if trim(edit3.text) <> '' then
    MemMensagem2.Lines.Add(edit3.text);
  if trim(edit4.text) <> '' then
    MemMensagem2.Lines.Add(edit4.text);
  if trim(edit5.text) <> '' then
    MemMensagem2.Lines.Add(edit5.text);
  if trim(edit6.text) <> '' then
    MemMensagem2.Lines.Add(edit6.text);
  if trim(edit7.text) <> '' then
    MemMensagem2.Lines.Add(edit7.text);
  if trim(edit8.text) <> '' then
    MemMensagem2.Lines.Add(edit8.text);
  if trim(edit9.text) <> '' then
    MemMensagem2.Lines.Add(edit9.text);

// fim - Andre Tavares - pendência 16555 - 05/05/2004
  if CdsDados.FieldByName('VALORJUROS').AsFloat <> 0 then
  begin
    MemMensagem1.Lines.Add('Após o vencimento cobrar R$ (' + FormatFloat('##0.00', CdsDados.FieldByName('VALORJUROS').AsFloat *
      CdsDados.FieldByName('RSALDO').AsFloat /
      100) + ') por dia de atraso.');
    MemMensagem2.Lines.Add('Após o vencimento cobrar R$ (' + FormatFloat('##0.00', CdsDados.FieldByName('VALORJUROS').AsFloat *
      CdsDados.FieldByName('RSALDO').AsFloat /
      100) + ') por dia de atraso.');
  end;

  if CdsDados.FieldByName('VALORDESCONTO').AsFloat <> 0 then
  begin
    MemMensagem1.Lines.Add('Até ' + CdsDados.FieldByName('DATALIMITE').AsString + ' conceder desconto R$ (' + FormatFloat('##0.00',
      CdsDados.FieldByName('VALORDESCONTO').AsFloat) + ').');
    MemMensagem2.Lines.Add('Até ' + CdsDados.FieldByName('DATALIMITE').AsString + ' conceder desconto R$ (' + FormatFloat('##0.00',
      CdsDados.FieldByName('VALORDESCONTO').AsFloat) + ').');
  end;

  { Pega as Mensagens cadastradas no menu Documentos x Mensagens }
//início - André Tavares - 28/08/2003 - pendência 13159
  for x := 0 To 9 do
//fim - André Tavares - 28/08/2003 - pendência 13159
  begin
//início - André Tavares - 09/09/2003 - pendência 13159
    if CdsAux.Fields[x].AsString <> '' then
    begin
      MemMensagem1.Lines.Add(CdsAux.Fields[x].AsString);
      MemMensagem2.Lines.Add(CdsAux.Fields[x].AsString);
    end;
  end;
//fim - André Tavares - 09/09/2003 - pendência 13159

end;

function TFrmConfigBarrasCMMT.CalculaDac11(sNum: String): Integer;
var
  sNumero: String;
  iBase, iDividendo, iDigito, X, iTamNum: Integer;
begin
  sNumero := sNum;
  iBase := 9;
  iDividendo := 0;
  iTamNum := Length(sNumero) + 1;
  for X := 1 To Length(sNumero) do
  begin
    iDividendo := iDividendo + (StrToInt(sNumero[iTamNum - X]) * iBase);
    if iBase = 2 then
      iBase := 9
    else
      Dec(iBase);
  end;
  iDigito := (iDividendo Mod 11);
  if (iDigito = 0) Or (iDigito > 9) then
    Result := 1
  else
    Result := iDigito;
end;

procedure TFrmConfigBarrasCMMT.CmbModeloCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; Modified: Boolean);
begin
  Inherited;
  TRATACMBMODELO;
end;

procedure TFrmConfigBarrasCMMT.TRATACMBMODELO;
begin
  if (CmbModelo.Text <> '') then
  begin
    diasprotesto := 0;
    SqlBanco.SQL.Text := ' Select PF.CodPortForma, PF.Descricao, PF.CodBloqChe, PF.CodArquivoRemessa, PF.NossoNumero,' +
      ' PF.JurosPorDia, PF.PrazoProtesto, PF.NumEmpresaBanco, PF.ControleRemessa, PF.PathArquivoRem, C.FLGIMPCONDENSADO, PF.IDCONFIGBARRAS ' +
      ' From PortadorForma PF, TEMPLBLOQCHEQUE C' +
      ' Where (PF.RecPag = ''' + ParamIntegra.RecPag + ''') AND ' +
      '       (PF.CodBloqChe = C.CodBloqChe(+)) AND ' +
      '       (PF.idPessoa = ' + IntToStr(sistema.IdEmpresa) + ') AND ' +
      '       (PF.IDCONFIGBARRAS = ' + CmbModelo.LookupValue + ')   ' +
      ' Order by PF.Descricao';
    SqlBanco.Open;
    if not CdsBanco.IsEmpty then
    begin
      if CdsBanco.FieldByName('PrazoProtesto').IsNull then
        diasprotesto := 0
      else
        diasprotesto := CdsBanco.FieldByName('PrazoProtesto').AsFloat;
    end;
    DbLcPortador.ENABLED := True;
  end
  else
    DbLcPortador.ENABLED := False;
end;


function TFrmConfigBarrasCMMT.MontaCampoLivre: String;
var
  iNumBanco, iTamNossoNumero: Longint;
  sDigito, sNumAgencia, sCarteira, sNumConta, sNossoNumero, sNumEmpresaBanco: String;
begin
  //Correção do comprimento do campo livre para 25 posições
  iNumBanco := StrToIntDef(Copy(CdsModelo.FieldByName('NUMEROBANCO').AsString, 1, 3), -1);
  iTamNossoNumero := CdsModelo.FieldByName('TAMNOSSONUMERO').AsInteger;
  sNumAgencia := RemoveAllChar(CdsDados.FieldByName('NUMAGENCIA').AsString);
  sCarteira := RemoveAllChar(CdsModelo.FieldByName('CARTEIRACOBR').AsString);
  // andre tavares - pendencia 20812 - 24/11/2005 - se o código da carteira for letra, então não entra no código de barras.
  sCarteira := intToStr(strToIntDef(sCarteira, 0));
  sNumConta := RemoveAllChar(CdsDados.FieldByName('NUMCONTA').AsString);
  sNossoNumero := RemoveAllChar(CdsDados.FieldByName('NOSSONUMERO').AsString);
  sNumEmpresaBanco := RemoveAllChar(CdsPortForma.FieldByName('NUMEMPRESABANCO').AsString);

  if iNumBanco <> 1 then
  begin
    sDigito := Trim(calculadigd);
    if sDigito = '10' then
      sDigito := '0';
  end;
  case iNumBanco Of

    //andre tavares - monta o campo livre do boleto bancario do besc
    27:
    begin
      result := montaCampolivreBESC(stringOfChar( '0', 5 - length( copy(sNumEmpresaBanco, 1, 5) ) ) + copy(sNumEmpresaBanco, 1, 5) + copy(sNossoNumero, 1, 3) + '25' + copy(sNossoNumero, 4, 10) + '027');
    end;

  //início andre tavares - Montar o campoLivre do banespa
    33: //banespa
    begin
      // composição do campo livre: Código do Cedente + Nosso Número + 00 + 033 + Dv1 + Dv2
      Result := CalculaDv1Dv2CampoLivreBANESPA(sNumEmpresaBanco + IntBancoManager.NossoNumero + '00033');
    end;
  //início andre tavares - Montar o campoLivre do banespa

    237: //Conta Com o DV - Tam 4 + 13 + 7
    // numero da conta sem dv
      Result := ZD(sNumAgencia, 4) +
        ZD(Copy(sNossoNumero, 1, iTamNossoNumero), 13) +
        ZD(copy(sNumConta,1,length(sNumConta)-1), 7) +
        '0';

    275, 356: //Conta e Agencia Sem o DV - Tam 4 + 7 + 1 + 13
      Result := ZD(Copy(sNumAgencia, 1, Length(sNumAgencia) - 1), 4) +
        ZD(Copy(sNumConta, 1, Length(sNumConta) - 1), 7) + sDigito +
        ZD(sNossoNumero, 13);

    341: //Agencia e Conta Com o DV - Tam 3 + 9 + 4 + 6
      begin
        Result := ZD(sCarteira, 3) +
          ZD(Copy(sNossoNumero, 1, iTamNossoNumero + 1), 9) +
          ZD(sNumAgencia, 4) + ZD(sNumConta, 6) + '000';
      end;
    1: //Montar Sem o DV do Num da Empresa no banco - Tam 11 + 4 + 8 + 2
      Result := ZD(Copy(sNossoNumero, 1, iTamNossoNumero), 11) +
        ZD(sNumAgencia, 4) +
        ZD(Copy(sNumConta, 1, Length(sNumConta) - 1), 8) +
        ZD(sCarteira, 2);

    104: //NNNNNNNNNNAAAAYYYXXXXXXXX Onde N - Nosso Número, A - Num Agencia Cedente, Operacao Código Cedente, Código da Agencia Cedenete Fornecido Pela Agência
      //Tam 10 + 4 + 11
      Result := ZD(Copy(sNossoNumero, 1, 10), 10) +
        ZD(Copy(sNumAgencia, 1, 4), 4) +
        ZD(Copy(sNumConta, 1, 11), 11);

    320: //Tam = 3 + 9 + 7 +
      Result := ZD(Copy(sNumAgencia, 1, 3), 3) +
        ZD(Copy(sNumConta, 1, 9), 9) +
        ZD(Copy(sNossoNumero, 1, 7), 7) +
        ZD('0', 3) +
        ZD(sCarteira, 3);
    641:
      begin
        Try
          sNumAgencia := IntToStr(StrToInt(sNumAgencia));
        Except
        end;
        Result := Copy(sNumEmpresaBanco, 1, 7) + ZD(CalculaModulo11(CdsPortForma.FieldByName('NOSSONUMERO').AsString,
          True, 8), 8) +
          ZD(Copy(sNumAgencia, 1, 3), 3) + ZD(Copy(sNumEmpresaBanco, 1, 6), 6) +
          IntToStr(CalculaDac11(Copy(sNumEmpresaBanco, 1, 7) +
          ZD(CalculaModulo11(CdsPortForma.FieldByName('NOSSONUMERO').AsString, True, 8), 8) +
          ZD(Copy(sNumAgencia, 1, 3), 3) +
          Copy(sNumEmpresaBanco, 1, 6)));
      end;
    409:
      begin
        Result := '04' +
          Copy(RemoveBarras3(CdsDados.FieldByName('DATAPROGRAMADA').AsString), 3, 6) +
          zd(sNumAgencia, 5) +
          ZD(copy(sNossoNumero, 2, 12), 12);
      end;

    399: //Tam = 12 + 4 + 7 + 2
      begin
        if CdsPortForma.FieldByName('CODARQUIVOREMESSA').AsString <> '9' then
          Result := Copy(sNossoNumero, 1, 5) + ZD(Copy(sNossoNumero, 6, 6), 6) +
            ZD(Copy(sNumAgencia, 1, 4), 4) +
            ZD(Copy(sNumConta, 1, 7), 7) + '001'
        else
          // O Nosso Numero deve ser colocado sem as 3 ultimas posicoes
          // porque estas sao os DVS.
          // 7 + 13 + 3 + 1 + 2
          Result := ZD(sNumEmpresaBanco, 7) +
            ZD(Copy(sNossoNumero, 1, length(sNossoNumero) - 3), 13) +
            ZD(IntToStr(DayOfTheYear(CdsDados.FieldByName('DATAPROGRAMADA').AsDateTime)), 3) +
            Copy(RemoveBarras2(CdsDados.FieldByName('DATAPROGRAMADA').AsString), 8, 1) + '2';
      end;
  else
    begin
      //Tam - 11 + 4 + 8 + 2
      Result := ZD(Copy(sNossoNumero, 1, iTamNossoNumero), 11) +
        ZD(sNumAgencia, 4) +
        ZD(sNumEmpresaBanco, 8) +
        ZD(sCarteira, 2);
    end;
  end;
end;

procedure TFrmConfigBarrasCMMT.CdsDadosCalcFields;
var
  sNumBanco, sNumAgencia, sNumConta, sDigito: String;
begin
  Inherited;
  sNumBanco := RemoveAllChar(CdsModelo.FieldByName('NUMEROBANCO').AsString);
  sNumAgencia := RemoveAllChar(CdsDados.FieldByName('NUMAGENCIA').AsString);
  sNumConta := RemoveAllChar(CdsDados.FieldByName('NUMCONTA').AsString);
  if StrToIntDef(Copy(sNumBanco, 1, 3), 0) <> 1 then
  begin
    sDigito := Trim(calculadigd);
    if sDigito = '10' then
      sDigito := '0';
  end;
  case StrToIntDef(Copy(sNumBanco, 1, 3), 0) Of
    33: // andre tavares - banco banespa - monta o código do cedente
      CdsDados.FieldByName('AGENCIACODCEDENTE').AsString :=  copy(CdsPortForma.FieldByName('NUMEMPRESABANCO').asString, 1, 3) + '/' +
                                                             copy(CdsPortForma.FieldByName('NUMEMPRESABANCO').asString, 4, 7)+ '-' +
                                                             copy(CdsPortForma.FieldByName('NUMEMPRESABANCO').asString, 11, 1);
    275, 356:
      CdsDados.FieldByName('AGENCIACODCEDENTE').AsString :=
        ZD(Copy(sNumAgencia, 1, Length(sNumAgencia) - 1), 4) + '/' +
        ZD(Copy(sNumConta, 1, Length(sNumConta) - 1), 7) + '/' +
        sDigito;
    104:
      CdsDados.FieldByName('AGENCIACODCEDENTE').AsString := sNumAgencia + '.' + sNumConta;

    399:
      begin
        if CdsPortForma.FieldByName('CODARQUIVOREMESSA').AsString = '9' then
          CdsDados.FieldByName('AGENCIACODCEDENTE').AsString := CdsPortForma.FieldByName('NUMEMPRESABANCO').AsString;

      end
  else
    CdsDados.FieldByName('AGENCIACODCEDENTE').AsString := sNumAgencia + '/' + sNumConta;
  end;
end;

procedure TFrmConfigBarrasCMMT.BtnImprimeClick(Sender: TObject);
begin
  Try
    bGravaImpressao := (DsBloquete.DataSet <> CdsBloqImpressos);
    if bGravaImpressao then

//inicio andre tavares 04/07/2003 resolução da pendência 14324
    if (DbLcPortador.text = '') or (DbLcPortador.lookupValue = '') then
    begin
      if DbLcPortador.Canfocus then DbLcPortador.setfocus;

      //andre tavares - pendência 18844
      Raise Exception.Create('O preenchimento do campo "Contas Caixas X Tipo de Cobrança" é obrigatório.');
    end;
    //CATIA P:19394 20/06/2006
    if (DBcboUsuario.Text = '') then
      begin
      SqlAux.SQL.Text := ' Select FLGOBRIGAUSUARIO from PARAMCAP ' +
                         ' Where (RecPag = ''R'') AND (FLGOBRIGAUSUARIO = ''S'') AND ' +
                         '       (idPessoa = ' + IntToStr(sistema.IdEmpresa) + ')';
      SqlAux.Open;
     if  not CdsAux.IsEmpty then
     begin
      if DBcboUsuario.Canfocus then DBcboUsuario.setfocus;

      //andre tavares - pendência 18844
      Raise Exception.Create('O preenchimento do campo "Usuário que lançou o documento" é obrigatório.');

      end;
    //FIM

    end;

    Inherited;

//fim - andre tavares - pendência 24373 - 31/01/2007

      ListDbg.SaveToFile(Sistema.TempDir + 'Remessa.log');

      if cdsDados.RecordCount > 0 then
        MsgDlg('A(s) ' + IntToStr(cdsDados.RecordCount) + ' ficha(s) de compensação foi(ram) impressa(s) e cada Nosso Número atribuído ao(s) respectivo(s) documento(s).'+#13+
               'Caso deseje reimprimí-las, utilize a janela: '+#13+
               'Cobrança\Cobrança Bancária\Libera Reimpressão de Bloqueto.', 'Numeração atribuída com sucesso', mtWarning, [MbOk], 0);
  Except
    On E: Exception do
    begin
      MsgErro( E.Message );

      Abort;
    end;
  end;//try
end;



procedure TFrmConfigBarrasCMMT.bbtnConfirmarClick(Sender: TObject);
begin
  if not PnlCadastro.Visible then
  begin
    if not CdsModelo.IsEmpty then
      CdsModelo.Locate('IDCONFIGBARRAS', StrToIntDef(CmbModelo.LookupValue, -1), []);
    if not CdsBanco.IsEmpty then
      CdsBanco.Locate('CODPORTFORMA', GetCodPortForma, []);
  end;

  Inherited;
end;



function TFrmConfigBarrasCMMT.RemoveAllChar(S: String): String;
begin
   S := Trim(S);
   S := funcaogeral.RemoveChar('-', S);
   S := funcaogeral.RemoveChar('.', S);
   S := funcaogeral.RemoveChar('/', S);
   S := funcaogeral.RemoveChar('_', S);
   S := funcaogeral.RemoveChar('\', S);
   S := funcaogeral.RemoveChar(' ', S);
   Result := S;
end;



function TFrmConfigBarrasCMMT.NossoNumeroIsEmpty(sNossoNumero: String): Boolean;
var
  sAux: String;
begin
   if Trim(sNossoNumero) = '' then
     Result := True
   else
   begin
     sAux := Trim(sNossoNumero);
     While Pos('0', sAux) <> 0 do
       Delete(saux, Pos('0', sAux), 1);
     Result := (Trim(saux) = '');
   end
end;



procedure TFrmConfigBarrasCMMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Inherited;
   ListDbg.Free;
   CtrlConfigbarras.Free;
   CtrlParamBloqueteCobranca.Free; //andre tavares 03/06/2006
end;



function TFrmConfigBarrasCMMT.GetCodPortForma: Integer;
begin
  if fCodPortForma <= 0 then
  begin
    SqlPortForma.Prepare;
    SqlPortForma.Params[0].AsInteger := StrToIntDef(DbLcPortador.LookupValue, -1);
    SqlPortForma.Open;
    if CdsPortForma.IsEmpty then
      fCodPortForma := -1
    else
      fCodPortForma := CdsPortForma.Fields[0].AsInteger;
  end;
  Result := fCodPortForma;
end;



function TFrmConfigBarrasCMMT.CalculaModulo11HSBC(sNossoNumero: String): String;
var
  sNumero: String;
  Divisor, iResto, iBase, x, iDividendo, iDigito: Integer;
begin
   sNumero := sNossoNumero;
   iBase := 9;
   iDividendo := 0;
   Divisor := 11;
   for X := Length(sNumero) downto 1 do
   begin
     iDividendo := iDividendo + (StrToInt(sNumero[x]) * ibase);
     Dec(iBase);
     if iBase < 2 then
       iBase := 9;
   end;
   iResto := (iDividendo Mod Divisor);
   iDigito := iResto;
   case iResto Of
     0, 10: iDigito := 0;
   end;
   Result := IntToStr(iDigito);
end;



procedure TFrmConfigBarrasCMMT.SelModelo;
begin
   sqlModelo.Open;
end;



procedure TFrmConfigBarrasCMMT.AbreCdsPrincipal(iId: Integer);
begin
   Sql.Prepare;
   Sql.Params[0].AsFloat := iId;
   Sql.Open;
end;



procedure TFrmConfigBarrasCMMT.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  // inherited;
  Accept := CtrlConfigBarras.ProcessaConfig(Cds.Data, CdsReports.Data, OpInserir);
end;



procedure TFrmConfigBarrasCMMT.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
   // inherited;
   Accept := CtrlConfigBarras.ProcessaConfig(Cds.Data, CdsReports.Data, OpAlterar);
end;



procedure TFrmConfigBarrasCMMT.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
   // inherited;
   Accept := CtrlConfigBarras.ProcessaConfig(Cds.Data, CdsReports.Data, OpApagar);
end;



procedure TFrmConfigBarrasCMMT.RptModeloBeforePrint(Sender: TObject);
begin
   inherited;
   Barras.AutoSize := False;
end;

procedure TFrmConfigBarrasCMMT.FormResize(Sender: TObject);
begin
  inherited;
  top := top + 20;
end;

procedure TFrmConfigBarrasCMMT.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;

  
end;

//início - andre tavares - 28/11/2005 - calcula o DV do NossoNumero do Banco Banespa
function TFrmConfigBarrasCMMT.CalculaDvBANESPA(sNossoNumero: String): String;
var sFatores, sAux : string;
    i, iSomatorio: integer;
begin
  sAux := '';
  iSomatorio := 0;
  sFatores := '7319731973';
  if length(sNossoNumero) < 10 then
    sFatores := copy(sFatores, 11 - length(sNossoNumero) , 10);

  for i := 1 to length(sNossoNumero) do
  begin
    sAux := intToStr(strToIntDef(sNossoNumero[i], 0) * strToInt(sFatores[i]));
    iSomatorio := iSomatorio + strToInt(sAux[length(sAux)]);
  end;
  sAux := intToStr(iSomatorio);
  if (iSomatorio mod 10) = 0 then
    result := sNossoNumero + '0'
  else
    result := sNossoNumero + intToStr(10 - strToInt(sAux[length(sAux)]));
end;

function TFrmConfigBarrasCMMT.CalculaDv1Dv2CampoLivreBANESPA(sCampoLivre: String): String;
var Dv1, Dv2: integer;
    sFatores : string;
    i, S, P, K: integer;
    brecalc : boolean;
begin
  brecalc := false;
  Dv1 := 0;
  Dv2 := 0;
  S := 0;
  K := 0;
  result := sCampoLivre;
  //início do Cálculo do Dv1
  sFatores := '21212121212121212121212'; //pesos
  if length(sCampoLivre) < 23 then
    sFatores := copy(sFatores, 24 - length(sCampoLivre) , 23);

  for i := 1 to length(sCampoLivre) do
  begin
    P := strToInt(sCampoLivre[i]) * strToInt(sFatores[i]);

    if (P > 9) then S := P - 9
    else if (P < 10) then S := P;

    K := K + S; //realizar o somatório de s gerando K
  end;//for

  if (K mod 10) = 0 then Dv1 := 0
  else if (K mod 10) > 0 then Dv1 := 10 - (K mod 10);

  sCampoLivre := sCampoLivre + intToStr(Dv1);
  //fim do Cálculo do Dv1

  //início do Cálculo do Dv2
  while not bRecalc do
  begin
    K := 0;
    sFatores := '765432765432765432765432'; //pesos
    if length(sCampoLivre) < 24 then
      sFatores := copy(sFatores, 25 - length(sCampoLivre), 24);

    for i := 1 to length(sCampoLivre) do
    begin
      P := strToInt(sCampoLivre[i]) * strToInt(sFatores[i]);
      k := k + p;
    end;//for

    if ((K mod 11) = 0) then //andre tavares 28/12/2005 - pendência 21153
    begin
      Dv2 := 0;
      brecalc := true;
    end
    else if ((K mod 11) = 10) or ((K mod 11) > 1) then
    begin
      Dv2 := 11 - (K mod 11);
      brecalc := true;
    end
    else if ((K mod 11) = 1) then
      if Dv1 = 9 then
      begin
        Dv1 := 0;
        sCampoLivre := copy(sCampoLivre, 1, length(sCampoLivre) - 1) + intToStr(Dv1);
        bRecalc := false;
      end
      else if dv1 < 9 then
      begin
        dv1 := dv1 + 1;
        sCampoLivre := copy(sCampoLivre, 1, length(sCampoLivre) - 1) + intToStr(Dv1);
        bRecalc := false;
      end;
  end;//while
  //fim do Cálculo do Dv2

  result := sCampoLivre + intToStr(Dv2);
end;
//fim - andre tavares - 28/11/2005


function TFrmConfigBarrasCMMT.montaNossoNumeroBESC(sNossoNumero: string): string;
const sPesosDV1 = '7890123456789';
const sPesosDV2 = '567890123456789';
var Dv1, Dv2, i: integer;

begin

  if (trim(sNossoNumero) <> '') and (length(sNossoNumero) < 13) then
    sNossoNumero := stringOfChar('0', 13 - length(sNossoNumero)) + sNossoNumero;

  result := sNossoNumero;

//cálculo do primeiro dv
  Dv1 := 0;
  for i := 1 to 13 do
    Dv1 := Dv1 + strToInt(sNossoNumero[i]) * strToInt(sPesosDV1[i]);

  Dv1 := Dv1 mod 11;
  if Dv1 = 10 then
    Dv1 := 0;

  //o sNossoNumero é acrescido do primeiro dv + a constante 3
  result := result + intToStr(Dv1) + '3';

//cálculo do segundo dv
  Dv2 := 0;
  for i := 1 to 15 do
    Dv2 := Dv2 + strToInt(result[i]) * strToInt(sPesosDV2[i]);

  Dv2 := Dv2 mod 11;
  if Dv2 = 10 then
    Dv2 := 0;

  result := result + intToStr(Dv2);
end;




//andré  tavares - 20/10/2007 - monta o campolivre dos boletos do besc que
//irá concatenar com o restante da linha digitável
function TFrmConfigBarrasCMMT.montaCampolivreBESC(sDados: string): string;
const sPesos1 = '21212121212121212121212'; //pesos

var Dv1, Dv2, P, S, i, X, Y, Z: integer;
    sAux: String;

    function SomaP(const sDigs: String): integer;
    var sPesos2 : string ; //pesos
    var i, P: integer;
    begin
      sPesos2 := '765432765432765432765432';
      P := 0;
      for i := 1 to 24 do //calcula o segundo Dv
        P := P + (strToInt(sDigs[i]) * strToInt(sPesos2[i]));
      SomaP := P;
    end;

    function calculaDv2: integer;
    begin
      Z := SomaP(sAux);
      X := Z mod 11;
      if X = 0 then  //se resto = 0
        Y := 0
      else if X = 1 then //se resto = 1 então somar 1 à vigésima-quarta posição e recalcular Z e Y (recursivamente)
      begin
        if sAux[24] = '9' then
          sAux[24] := '0'
        else
          sAux[24] := intToStr(strToInt(sAux[24]) + 1)[1];
        result := calculaDv2;
        exit;
      end
      else if X > 1 then //se resto > 1
      begin
        Y := 11 - X;
      end;

      Y := Y + 2;

      if Y = 10 then //se dv = 10
        Y := 0
      else if Y = 11 then  //se dv = 11
        Y := 1;

      result := Y;
    end;

begin

  result := sDados;
  if length(sDados) <> 23 then
  begin
    result := '';
    raise Exception.Create( ' A chave da linha digitável tem que ser de 23 dígitos. Chave = '+ sDados );
    exit;
  end;


  Dv1:= 0;
  P := 0;
  S := 0;
  for i := 1 to 23 do  //calcula o primeiro Dv
  begin
    P := strToInt(result[i]) * strToInt(sPesos1[i]);

    if P > 9 then
      S := P - 9
    else // se P < 10 
      S := P;

    Dv1 := Dv1 + S;

  end; //for

  Dv1 := Dv1 mod 10;

  if Dv1 > 0 then
    Dv1 := 10 - Dv1;

  result := result + intToStr(Dv1);
  sAux := result;

  result := result + intToStr(calculaDv2);
end;




procedure TFrmConfigBarrasCMMT.Setcodtipodoc(const Value: integer);
begin
  Fcodtipodoc := Value;
end;

procedure TFrmConfigBarrasCMMT.Setidconfigbarras(const Value: integer);
begin
  Fidconfigbarras := Value;
end;

procedure TFrmConfigBarrasCMMT.Setidmodulo(const Value: integer);
begin
  Fidmodulo := Value;
end;

procedure TFrmConfigBarrasCMMT.Setidtipocliente(const Value: integer);
begin
  Fidtipocliente := Value;
end;

procedure TFrmConfigBarrasCMMT.Setidusuario(const Value: integer);
begin
  Fidusuario := Value;
end;

procedure TFrmConfigBarrasCMMT.Setcodportadorforma(const Value: integer);
begin
  Fcodportadorforma := Value;
end;

procedure TFrmConfigBarrasCMMT.Setcoddocumento(const Value: integer);
begin
  Fcoddocumento := Value;
  SqlBloquete.Prepare;
  SqlBloquete.paramByName('CODDOCUMENTO').asInteger := Fcoddocumento;
end;

procedure TFrmConfigBarrasCMMT.dblkmsgCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;

  if (trim(dblkmsg.text) <> '') and (not cdsMsg.Eof) then
  begin
    edit1.text := cdsMsg.fieldByName('TEXTOLINHA_1').asString;
    edit2.text := cdsMsg.fieldByName('TEXTOLINHA_2').asString;
    edit3.text := cdsMsg.fieldByName('TEXTOLINHA_3').asString;
    edit4.text := cdsMsg.fieldByName('TEXTOLINHA_4').asString;
    edit5.text := cdsMsg.fieldByName('TEXTOLINHA_5').asString;
    edit6.text := cdsMsg.fieldByName('TEXTOLINHA_6').asString;
    edit7.text := cdsMsg.fieldByName('TEXTOLINHA_7').asString;
    edit8.text := cdsMsg.fieldByName('TEXTOLINHA_8').asString;
    edit9.text := cdsMsg.fieldByName('TEXTOLINHA_9').asString;
  end;

end;

procedure TFrmConfigBarrasCMMT.dblkmsgChange(Sender: TObject);
begin
  inherited;
  if trim(dblkmsg.Text) = '' then
  begin
    Edit1.Text := '';
    Edit2.Text := '';
    Edit3.Text := '';
    Edit4.Text := '';
    Edit5.Text := '';
    Edit6.Text := '';
    Edit7.Text := '';
    Edit8.Text := '';
    Edit9.Text := '';
  end;
end;


procedure TFrmConfigBarrasCMMT.MsgErro(sMsg: string);
begin
  MsgDlg( sMsg, 'Atenção', mtError, [mbOK], 0 );
end;


end.



