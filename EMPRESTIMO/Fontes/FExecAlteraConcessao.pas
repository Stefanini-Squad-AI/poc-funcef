unit FExecAlteraConcessao;

//    Sistema.TipoCliente

//    Código   Cliente
//    -------- -------
//    19971    REFER
//    19981    CBS
//    19991    FUNCEF
//    20011    BRTPREV
//    20041    VALIA

{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : MIGRACAO-TIBERO
Responsável : lEANDRO POCEBON
Data        : 16/10/2025
Descrição   : aJUSTE NAS CONSULTAS


--------------------------------------------------------------------------------
Pendência   : SIG 117285
Responsável : Ewerton Beltramini
Data        : 16/11/2021
Descrição   : Após o recebimento do valor devolvido pelo mutuário, o sistema
              deve estornar automaticamente a atualização dos encargos que tiverem
              sidos geradas após a data do recebimento do débito.
              Realizada também correção em update na CONTRATOEMPTMO.

--------------------------------------------------------------------------------
Pendência   : SOL 262251 PPM 1089539
Responsável : Peterson Victor
Data        : 02/10/2015
Descrição   : Retirado o delete da tabela HISTMOVEMPTMO
-------------------------------------------------------------------------------
Pendência   : SOL 189082 Kintana 1985002
Responsável : Marcio Sanches Spinosa
Data        : 23/04/2013
Descrição   : retirada da chamada da função de ajuste situação do contrato.
-------------------------------------------------------------------------------
Pendência   : SOL 201395 KINTANA 1947848
Responsável : BRUNO AZEVEDO
Data        : 04/03/2013
Descrição   : Quando o participante não tiver margem e valor máximo disponível,
              considerar como zero.
-------------------------------------------------------------------------------
Pendência   : SOL 195538 KINTANA 1917765
Responsável : Otacilio Aquino
Data        : 25/01/2013
Descrição   : Implementado para adicionar o numero do contrato no campo obs
------------------------------------------------------------------------------
Pendência   : SOL 162404 Kintana 1380377
Responsável : Fanuel Junior
Data        : 05/08/2011
Descrição   : Correção do erro que ocorria na execução da regra
--------------------------------------------------------------------------------
Pendência   : SOL 153818 KINTANA 1163513
Responsável : BRUNO AZEVEDO
Data        : 01/03/2011
Descrição   : Atualizar o campo "VLRPARCELA" ao finalizar o processo.
-------------------------------------------------------------------------------
//Nº SOL: 151964
//Nº KINTANA: 1124438
//Data da Alteração: 03/02/2011
//Responsável: Fanuel Junior
//Descrição: Adicionado o o campo IDTIPOCONTREMPTMO na query de entrada do valor
//           de salário base
//******************************************************************************
Pendência   : SOL 143413 Kintana 938370
Responsável : Fanuel Junior
Data        : 05/11/2010
Descrição   : Utilizar a procedure buscaMutuario para procurar se o usuario é
o mutuario do contrato e bloquea-lo.
--------------------------------------------------------------------------------
//Nº SOL: 56282
//Nº KINTANA: 525253
//Data da Alteração: 15/03/2010
//Responsável: Ádler Souza
//Descrição: Correção para somar mais um dia caso passe da horaencerra.
//******************************************************************************
//Rotina: BuscaMargem
//Nº SOL: 75516
//Nº KINTANA: 523281
//Data da Alteração: 15/03/2010
//Responsável: Ádler Souza
//Descrição: Ajustado a consulta de entrada para passar o novo parâmetro com o
//           nome HMEORIGEM.
//******************************************************************************
//Rotina: BuscaMargem
//Nº SOL: 131189
//Nº KINTANA: 744558
//Data da Alteração: 19/02/2010
//Responsável: Ádler Souza
//Descrição: Criação de novo valor para o campo DATACREDITO da query de entrada
//           da regra de margem.
//******************************************************************************
Rotina    : Sel
Data      : 06/11/2008
Autor     : Renato Visoni
Pendência : SOL 100353 KINTANA 443617
Descrição : Coloquei a qryHistMov e seus parametros em tempo de execuçao,pois esse
            processo estava demorando muito.
--------------------------------------------------------------------------------
Rotina    : qryTipoContrato
Data      : 16/04/2008
Autor     : Alberto
Pendência : 27749
Descrição : Inclusão da coluna FLGNAOVERIFICAMRGPCL e seu respectivo TFloatField
--------------------------------------------------------------------------------
Pendência   : 27370
Responsável : Daniel Simões
Data        : 11/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
Rotina    : btnContinuarClick
Data      : 04/10/2006
Autor     : Marchetti
Pendência : 23449
Descrição : Gravação da data efetiva quando o valor liquido for = 0
--------------------------------------------------------------------------------
Rotina    : btnContinuarClick
Data      : 04/10/2006
Autor     : Marchetti
Pendência : 23449
Descrição : Gravação da data efetiva quando o valor liquido for = 0
--------------------------------------------------------------------------------
Rotina    : - EXCEPCIONAL
Data      : 20/12/2005
Autor     : André Pontes
Pendência :
Descrição : A pedido de Luciana, excepcional retira críticas de data.
            Gravação de log com o Excepcional.
--------------------------------------------------------------------------------
Rotina    : btnContinuarClick
Data      : 17/08/2005
Autor     : André Pontes
Pendência : 19987
Descrição : Ajuste dos valores finais de acordo com parâmetros dos itens por
            tipo de contrato
--------------------------------------------------------------------------------
Rotina    : Várias (VerificaPreenchimento e declarações em outros lugares)
Data      : 03/06/2005
Autor     : André Pontes
Pendência : 19404
Descrição : Bloqueio de lançamento e contabilização / estorno / exclusão de
            acordo com parâmetro contábil por módulo + TestaPeríodo
--------------------------------------------------------------------------------
Rotina    : EnviaItensPatroCAPCAR
Data      : 03/08/2004
Pendência :
Autor     : André Pontes
Descrição : Passagem do campo "MATRICULA"
--------------------------------------------------------------------------------
Rotina    : CalculaItens
Data      : 25/11/2002
Autor     : Marchetti
Descrição : É passado o record dos dados da concessão. Nesse processo os dados
            seguem sem valor, pois os mesmos somente serão utilizados na
            alteração de valores da concessão.
--------------------------------------------------------------------------------
                                SOFTTEK
--------------------------------------------------------------------------------
N. Pendência....: 81962
Data............: 03/07/2008
Responsável.....: Denise Arruda
Descrição.......:  Ajuste na rotina de alteração de valor de concessão no caso
                   de valor zero
--------------------------------------------------------------------------------}


interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FWizardMTEP, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
   TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls, wwdbdatetimepicker,
   CMDateTimePicker, Mask, DBCtrls, Db, Wwdatsrc, mContratoEmptmo, Grids,
   Wwdbigrd, Wwdbgrid, DBTables, Wwquery, wwdbedit, Wwdbspin, TREdit,
   uCtrlContab, uCtrlPadroes ,uFuncoesEmptmo,
   uTypesEmptmo;

type
   TfrmExecAlteraConcessao = class(TfrmWizardMTEP)
      Label21: TLabel;
      Label43: TLabel;
      Label12: TLabel;
      Label17: TLabel;
      Label38: TLabel;
      Label39: TLabel;
      Label3: TLabel;
      Label1: TLabel;
      Label4: TLabel;
      Label22: TLabel;
      Label7: TLabel;
      Label8: TLabel;
      Label11: TLabel;
      Label10: TLabel;
      DBedtJuros: TDBEdit;
      DBedtDataInsc: TCMDateTimePicker;
      DBedtDataCredito: TCMDateTimePicker;
      DBedtValSolic: TDBEdit;
      DBedtValorParcela: TDBEdit;
      DBedtParcelas: TDBEdit;
      DBedtDataPrimParcela: TCMDateTimePicker;
      DBedtPatro: TDBEdit;
      DBedtPlanoPrev: TDBEdit;
      DBedtSitPart: TDBEdit;
      grpTitular: TGroupBox;
      Label9: TLabel;
      Label16: TLabel;
      Label18: TLabel;
      DBedtMtrEmpresa: TDBEdit;
      DBedtCPF: TDBEdit;
      DBedtInscricao: TDBEdit;
      DBedtParticipante: TDBEdit;
      DBEdit1: TDBEdit;
      DBEdit2: TDBEdit;
      DBedtTipoEmptmo: TDBEdit;
      DBEdit3: TDBEdit;
      dts: TwwDataSource;
      Label29: TLabel;
      Label6: TLabel;
      btnBuscaContrato: TBitBtn;
      DBedtNumContrato: TDBEdit;
      DBedtBeneficiario: TDBEdit;
      Panel3: TPanel;
      GroupBox1: TGroupBox;
      CMDateTimePicker1: TCMDateTimePicker;
      Label2: TLabel;
      Label5: TLabel;
      CMDateTimePicker2: TCMDateTimePicker;
      Label14: TLabel;
      edtPrazo: TDBEdit;
      qryHistMov: TwwQuery;
      qryHistMovITEDESCRICAO: TStringField;
      qryHistMovANOMESCOMP: TStringField;
      qryHistMovANOMESCOBR: TStringField;
      qryHistMovANOMESCOMPET: TStringField;
      qryHistMovANOMESCOB: TStringField;
      qryHistMovFLGENVIO: TFloatField;
      qryHistMovFLGBAIXADO: TFloatField;
      qryHistMovFLGESTORNADO: TFloatField;
      qryHistMovFLGABONADO: TFloatField;
      qryHistMovFLGQUITADO: TFloatField;
      qryHistMovHMEANOCOMPETENCIA: TFloatField;
      qryHistMovHMEMESCOMPETENCIA: TFloatField;
      qryHistMovHMESEQCOBRANCA: TFloatField;
      qryHistMovHMETIPOMOV: TFloatField;
      qryHistMovIDCONTRATOEMPTMO: TFloatField;
      qryHistMovIDITEMEMPTMO: TFloatField;
      qryHistMovHMEDATAPREVISTA: TDateTimeField;
      qryHistMovHMEVLRPREVISTO: TFloatField;
      qryHistMovHMESALDODEV: TFloatField;
      qryHistMovHMETXJUROS: TFloatField;
      qryHistMovHMEPARCELA: TFloatField;
      qryHistMovHMEDATAEFETIVA: TDateTimeField;
      qryHistMovHMEDATAATUALIZA: TDateTimeField;
      qryHistMovHMEVLREFETIVO: TFloatField;
      qryHistMovPLNCODIGO: TFloatField;
      qryHistMovPLNCODIGOESTORNO: TFloatField;
      qryHistMovCODDOCUMENTO: TFloatField;
      qryHistMovIDRUBRICA: TFloatField;
      qryHistMovEVENTO: TStringField;
      qryHistMovFORMACOBRANCA: TStringField;
      qryHistMovTIPOFOLHA: TStringField;
      qryHistMovIDHISTMOVEMPTMO: TFloatField;
      qryHistMovHMENUMPARCELAS: TFloatField;
      qryHistMovHMEMESCOBRANCA: TFloatField;
      qryHistMovHMEANOCOBRANCA: TFloatField;
      qryHistMovHMEDATAVENCTO: TDateTimeField;
      qryHistMovHMEDATAQUITABONO: TDateTimeField;
      qryHistMovFLGBAIXAMANUAL: TFloatField;
      qryHistMovFLGDIVERGPEND: TFloatField;
      dtsHistMov: TwwDataSource;
      DBgrdHistMov: TwwDBGrid;
      Label15: TLabel;
      edtDataAlteracao: TCMDateTimePicker;
      Label19: TLabel;
      Label20: TLabel;
      edtDataCredito: TCMDateTimePicker;
      Label23: TLabel;
      edtNovoValor: TRealEdit;
      edtSalario: TRealEdit;
      Label25: TLabel;
      Label37: TLabel;
      Label26: TLabel;
      Label27: TLabel;
      edtMaximo: TRealEdit;
      edtValReserva: TRealEdit;
      Label28: TLabel;
      edtPrestacao: TRealEdit;
      TabSheet3: TTabSheet;
      Panel9: TPanel;
      DBgrdHistMovVirtual: TwwDBGrid;
      Label51: TLabel;
      DBEdit8: TDBEdit;
      dtsHistMovVirtual: TwwDataSource;
      qryHistMovVirtual: TwwQuery;
      updHistMovVirtual: TUpdateSQL;
      qryHistMovVirtualITEDESCRICAO: TStringField;
      qryHistMovVirtualEVENTO: TStringField;
      qryHistMovVirtualIDCONTRATOEMPTMO: TFloatField;
      qryHistMovVirtualIDITEMEMPTMO: TFloatField;
      qryHistMovVirtualHMEDATAPREVISTA: TDateTimeField;
      qryHistMovVirtualHMEVLRPREVISTO: TFloatField;
      qryHistMovVirtualHMESALDODEV: TFloatField;
      qryHistMovHMECENTRALIZA: TFloatField;
      qryHistMovHMEDESTACADO: TFloatField;
      qryContratoAnterior: TwwQuery;
      qryContratoAnteriorIDCONTRATOEMPTMO: TFloatField;
      qryHistoricoMov: TwwQuery;
      qryHistoricoMovIDHISTMOVEMPTMO: TFloatField;
      qryHistoricoMovIDCONTRATOEMPTMO: TFloatField;
      qryHistoricoMovCODDOCUMENTO: TFloatField;
      qryHistoricoMovHMEFORMACOBRANCA: TStringField;
      qryHistoricoMovHMECENTRALIZA: TFloatField;
      qryHistoricoMovHMEDESTACADO: TFloatField;
      qryHistoricoMovHMEVLRPREVISTO: TFloatField;
      qryHistoricoMovFLGENVIO: TFloatField;
      qryHistoricoMovPLNCODIGO: TFloatField;
      qryHistoricoMovSTATUS: TStringField;
      qryHistoricoMovHMEMESCOBRANCA: TFloatField;
      qryHistoricoMovHMEANOCOBRANCA: TFloatField;
      qryHistoricoMovHMEANOCOMPETENCIA: TFloatField;
      qryHistoricoMovHMEMESCOMPETENCIA: TFloatField;
      qryHistoricoMovHMEDATAPREVISTA: TDateTimeField;
      qryTipoContrato: TwwQuery;
      qryTipoContratoIDTIPOCONTREMPTMO: TFloatField;
      qryTipoContratoTCEDESCRICAO: TStringField;
      qryTipoContratoIDTIPOEMPTMO: TFloatField;
      qryTipoContratoIDREGRAJURCONC: TFloatField;
      qryTipoContratoIDREGRAELEG: TFloatField;
      qryTipoContratoIDREGRALIMITES: TFloatField;
      qryTipoContratoIDREGRAPRAZOSCONC: TFloatField;
      qryTipoContratoIDREGRAMARGEM: TFloatField;
      qryTipoContratoIDREGRARESERVA: TFloatField;
      qryTipoContratoDESCTIPOEMPTMO: TStringField;
      qryTipoContratoTEPMAXCONTRATO: TFloatField;
      qryTipoContratoFLGOBRIGBENEF: TFloatField;
      qryTipoContratoIDREGRASALBAS: TFloatField;
      qryTipoContratoMOECODIGO: TFloatField;
      qryTipoContratoFLGCONCESSAOZERO: TFloatField;
      qryTipoContratoTCEMINRENOVA: TFloatField;
      qryTipoContratoIDREGRADATACRED: TFloatField;
      edtVlrMargem: TRealEdit;
      btnAlteraMargem: TBitBtn;
      Label13: TLabel;
      edtNovoPrazo: TRealEdit;
      edtPrestacaoBasica: TRealEdit;
      Label24: TLabel;
      qryAlteracaoAnterior: TwwQuery;
      qryAlteracaoAnteriorQUANT: TFloatField;
      qryItemXTipoContr: TwwQuery;
      qryItemXTipoContrFLGVLRALTERACONC: TFloatField;
      chkExcepcional: TCheckBox;
    btnAlteraMaximo: TBitBtn;
    qryTipoContratoFLGEXCLUIALT: TFloatField;
    qryTipoContratoFLGNAOVERIFICAMRGPCL: TFloatField;
    QryAuxAlteradores: TwwQuery;

      procedure btnBuscaContratoClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure btnContinuarClick(Sender: TObject);
      procedure edtDataAlteracaoExit(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure DBgrdHistMovCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      procedure DBgrdHistMovTopRowChanged(Sender: TObject);
      procedure btnAlteraMargemClick(Sender: TObject);
      procedure edtVlrMargemExit(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure DBgrdHistMovVirtualCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      procedure DBgrdHistMovVirtualTopRowChanged(Sender: TObject);
      procedure edtMaximoExit(Sender: TObject);
      procedure btnAlteraMaximoClick(Sender: TObject);


   private  // Private declarations

      Contab : TCtrlContab;   // André Pontes - 03/06/2005 - pendência 19404

      iPais             : Integer;
      sEstado           : String;
      iCidade           : Integer;

      rContrato         : TDadosContrato;
      rConcessao        : TDadosConcessao;
      vLista            : TListaItem;
      vListaCalculo     : TListaItem;
      rSaldosAntPos     : TSaldosAntPos;
      fSalParticipacao  : Currency;
      fSalMantido       : Currency;
      fSalAuxDoenca     : Currency;
      fSalBenef         : Currency;
      fVlrSalBase       : Currency;
      sFiltroContEmp    : String;
      bRepeteConsulta   : Boolean;

      vDividasAnteriores : Array of Extended;


      function  VerificaPreenchimento: Boolean;
      function  VerificaPreenchimentoCancelamento: Boolean;

      procedure Sel(i: Extended);
      procedure PreencheDadosContrato(iNumParcela : Integer);
      function  CalculaNovaConcessao: Boolean;
      procedure EnviaItensPatroCAPCAR(const iIDContratoEmptmo : Extended);
      function  ExisteAlteracaoAnterior: Boolean;


   public   // Public declarations
   iIdbenef   : integer;  // xavier

   end;



var
   frmExecAlteraConcessao: TfrmExecAlteraConcessao;



implementation
{$R *.DFM}
uses
  DBaseDados, uDataBase, dEmptmo, dMS, uVerificaPreenchimento, uMensErro, uCalcEmptmo,
  uDiasUteis, uIntegraEmptmo, uSistema, uModulo, fExecBuscaContrato, dAtualizacaoDiaria,
  uLancContab;



procedure TfrmExecAlteraConcessao.Sel(i: Extended);
begin
   with dtmEmptmo.qryDadosContrato do
   begin
     LimpaParametros(dtmEmptmo.qryDadosContrato);
     ParamByName('PIDCONTRATOEMPTMO').AsFloat := i;
     Open;
   end;

   //Renato Visoni SOL 100353 KINTANA 443617
   qryHistMov.Close;
   qryHistMov.SQL.Clear;

   qryHistMov.SQL.ADD('SELECT');
   qryHistMov.SQL.ADD('IRC.ITEDESCRICAO,');

   qryHistMov.SQL.ADD('CAST(TO_CHAR(HME.HMEMESCOMPETENCIA, ''00'') || ''/'' || HME.HMEANOCOMPETENCIA  AS VARCHAR2(7)) AS ANOMESCOMP,'); //MIGRACAO-TIBERO
   qryHistMov.SQL.ADD('CAST(TO_CHAR(HME.HMEMESCOBRANCA, ''00'')    || ''/'' || HME.HMEANOCOBRANCA  AS VARCHAR2(7))    AS ANOMESCOBR,'); //MIGRACAO-TIBERO

   qryHistMov.SQL.ADD('CAST((LTRIM(RTRIM(TO_CHAR(HME.HMEANOCOMPETENCIA, ''0000'')))) || (LTRIM(RTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA, ''00'')))) AS VARCHAR2(7))  AS ANOMESCOMPET,'); //MIGRACAO-TIBERO
   qryHistMov.SQL.ADD('CAST((LTRIM(RTRIM(TO_CHAR(HME.HMEANOCOBRANCA, ''0000'')))) || (LTRIM(RTRIM(TO_CHAR(HME.HMEMESCOBRANCA, ''00''))))  AS VARCHAR2(7)) AS ANOMESCOB,');          //MIGRACAO-TIBERO

   qryHistMov.SQL.ADD('NVL(HME.FLGENVIO, 1)        AS FLGENVIO,');
   qryHistMov.SQL.ADD('NVL(HME.FLGBAIXADO, 1)      AS FLGBAIXADO,');
   qryHistMov.SQL.ADD('NVL(HME.FLGESTORNADO, 0)    AS FLGESTORNADO,');
   qryHistMov.SQL.ADD('NVL(HME.FLGABONADO, 0)      AS FLGABONADO,');
   qryHistMov.SQL.ADD('NVL(HME.FLGQUITADO, 0)      AS FLGQUITADO,');
   qryHistMov.SQL.ADD('NVL(HME.FLGBAIXAMANUAL, 0)  AS FLGBAIXAMANUAL,');
   qryHistMov.SQL.ADD('NVL(HME.FLGDIVERGPEND, 0)   AS FLGDIVERGPEND,');

   qryHistMov.SQL.ADD('HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, HME.HMESEQCOBRANCA,');
   qryHistMov.SQL.ADD('HME.HMETIPOMOV       , HME.IDCONTRATOEMPTMO , HME.IDITEMEMPTMO,');
   qryHistMov.SQL.ADD('HME.HMEDATAPREVISTA  , HME.HMECENTRALIZA    , HME.HMEDESTACADO,');

   qryHistMov.SQL.ADD('NVL(HME.HMEVLRPREVISTO, 0) AS HMEVLRPREVISTO,');
   qryHistMov.SQL.ADD('NVL(HME.HMESALDODEV, 0) AS HMESALDODEV,');

   qryHistMov.SQL.ADD('HME.HMETXJUROS       , HME.HMEPARCELA       , HME.HMEDATAEFETIVA ,');
   qryHistMov.SQL.ADD('HME.HMEDATAATUALIZA  , HME.HMEVLREFETIVO    , HME.PLNCODIGO      ,');
   qryHistMov.SQL.ADD('HME.PLNCODIGOESTORNO , HME.CODDOCUMENTO     ,');
   qryHistMov.SQL.ADD('HME.IDRUBRICA        , HME.HMEDATAVENCTO,');

   qryHistMov.SQL.ADD('DECODE(HME.HMETIPOMOV, 0, ''Concessão'',');
   qryHistMov.SQL.ADD('                       1, ''Parcela'',');
   qryHistMov.SQL.ADD('                       2, ''Amortização'',');
   qryHistMov.SQL.ADD('                       3, ''Quitação'',');
   qryHistMov.SQL.ADD('                       4, ''Atualização Débito'',');
   qryHistMov.SQL.ADD('                       5, ''Atualização Saldo'') AS EVENTO,');

   qryHistMov.SQL.ADD('DECODE(HME.HMEFORMACOBRANCA,''C'',''Financeiro'',''Folha'') AS FORMACOBRANCA,');
   qryHistMov.SQL.ADD('DECODE(HME.HMETIPOFOLHA,''B'',''Benefício'',''P'',''Patrocinadora'', NULL, '' '') AS TIPOFOLHA,');

   qryHistMov.SQL.ADD('HME.HMEDATAQUITABONO,');

   qryHistMov.SQL.ADD('HME.IDHISTMOVEMPTMO, HME.HMENUMPARCELAS, HME.HMEMESCOBRANCA, HME.HMEANOCOBRANCA');
   qryHistMov.SQL.ADD('FROM');
   qryHistMov.SQL.ADD('HISTMOVEMPTMO  HME,');
   qryHistMov.SQL.ADD('CONTRATOEMPTMO CON,');
   qryHistMov.SQL.ADD('ITEMXTIPOCONTR ITC,');
   qryHistMov.SQL.ADD('ITEMEMPTMO IRC,');
   qryHistMov.SQL.ADD('(SELECT SEQ.IDITEMEMPTMO, SEQ.IDTIPOCONTREMPTMO, MIN(SEQ.ITCSEQCALCULO) AS MINSEQCALCONC FROM ITEMXTIPOCONTR SEQ');
   qryHistMov.SQL.ADD('WHERE ( SEQ.ITCEVENTO         = 0 )');
   qryHistMov.SQL.ADD('GROUP BY SEQ.IDITEMEMPTMO, SEQ.IDTIPOCONTREMPTMO) MIN');

   qryHistMov.SQL.ADD('WHERE');
   qryHistMov.SQL.ADD('    ( CON.IDTIPOCONTREMPTMO = ITC.IDTIPOCONTREMPTMO )');
   qryHistMov.SQL.ADD('AND ( HME.IDITEMEMPTMO      = ITC.IDITEMEMPTMO )');
   qryHistMov.SQL.ADD('AND ( ITC.IDITEMEMPTMO      = IRC.IDITEMEMPTMO )');
   qryHistMov.SQL.ADD('AND ( HME.IDCONTRATOEMPTMO  = CON.IDCONTRATOEMPTMO )');
   qryHistMov.SQL.ADD('AND ( ITC.IDTIPOCONTREMPTMO = MIN.IDTIPOCONTREMPTMO )');
   qryHistMov.SQL.ADD('AND ( ITC.IDITEMEMPTMO      = MIN.IDITEMEMPTMO )');

   qryHistMov.SQL.ADD('AND ( HME.IDCONTRATOEMPTMO  ='+ floatTostr(i)+ ')' );
   qryHistMov.SQL.ADD('AND ( CON.IDCONTRATOEMPTMO  ='+ floatTostr(i)+ ')' );
   qryHistMov.SQL.ADD('AND ( HME.HMETIPOMOV        = 0 )');
   qryHistMov.SQL.ADD('AND ( HME.HMEPARCELA        = 0 )');
   qryHistMov.SQL.ADD('AND ( HME.HMESEQCOBRANCA    = 1 )');

   qryHistMov.SQL.ADD('ORDER BY');
   qryHistMov.SQL.ADD('ITC.ITCSEQCALCULO');

   qryHistMov.Open;
   //Fim Renato Visoni

end;



function TfrmExecAlteraConcessao.VerificaPreenchimento: Boolean;
var
   sDataLanc   : String;
   sMsgContab  : String;
   iEmpresa    : Integer;
   iExercicio  : Integer;
   iPeriodo    : Integer;
begin
   Result := False;

   try
      if qryTipoContrato.FieldByName('FLGEXCLUIALT').AsInteger  = 1 then
         raise EValidacao.CreateVal('O tipo de contrato não permite alteração da concessão!', btnBuscaContrato);

      if edtDataAlteracao.Text = '' then
         raise EValidacao.CreateVal('É necessário indicar a Data da Alteração!', edtDataAlteracao);

      if ExisteAlteracaoAnterior then
         raise EValidacao.CreateVal('Já existe uma alteração de concessão anterior!', edtDataAlteracao);

      // André Pontes - 03/06/2005 - pendência 19404
      if dtmEmptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 1 then
      begin
         // Chamada da função TestaPeríodo para verificar se pode(m) ser lançada(s) planilha(s) de
         // estorno na data de cancelamento indicada
         sDataLanc   := FormatDateTime('dd/mm/yyyy', edtDataAlteracao.Date);
         iEmpresa    := Sistema.idEmpresa;
         sMsgContab  := '';

         if TestaPeriodo(False, 'BaseDados', sDataLanc, '15', iExercicio, iPeriodo, iEmpresa, sMsgContab) <> 0 then
            raise EValidacao.CreateVal('Não é possível fazer lançamentos para a data escolhida:' + #13 + '"' + sMsgContab + '"', edtDataAlteracao);

         if not(Contab.TestaDataBloqueadaProc(iEmpresa, 15, sDataLanc)) then
         begin
            sMsgContab := Contab.MessageInfo;
            raise EValidacao.CreateVal('Não é possível fazer lançamentos para a data escolhida:' + #13 + '"' + sMsgContab + '"', edtDataAlteracao);
         end;
      end;
      // FIM André Pontes - 03/06/2005 - pendência 19404

   except

      on ev : EValidacao do begin
         Screen.Cursor := crDefault;
         if ev.Show then MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

   Result := True;
end;



function TfrmExecAlteraConcessao.VerificaPreenchimentoCancelamento: Boolean;
var
   sDataLanc   : String;
   sMsgContab  : String;
   iEmpresa    : Integer;
   iExercicio  : Integer;
   iPeriodo    : Integer;
begin
   Result := False;

   try
      if edtDataAlteracao.Text = '' then
         raise EValidacao.CreateVal('É necessário indicar a Data da Alteração!', edtDataAlteracao);

      if ExisteAlteracaoAnterior then
         raise EValidacao.CreateVal('Já existe uma alteração de concessão anterior!', edtDataAlteracao);

      if dtmEmptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 1 then
      begin
         // Chamada da função TestaPeríodo para verificar se pode(m) ser lançada(s) planilha(s) de
         // estorno na data de cancelamento indicada
         sDataLanc   := FormatDateTime('dd/mm/yyyy', dtmEmptmo.qryDadosContratoDATACREDITO.AsDateTime);
         iEmpresa    := Sistema.idEmpresa;
         sMsgContab  := '';

         if TestaPeriodo(False, 'BaseDados', sDataLanc, '15', iExercicio, iPeriodo, iEmpresa, sMsgContab) <> 0 then
            raise EValidacao.CreateVal('Não é possível estornar lançamentos a partir da data:' + #13 + '"' + sMsgContab + '"', edtDataAlteracao);

         if not(Contab.TestaDataBloqueadaProc(iEmpresa, 15, sDataLanc)) then
         begin
            sMsgContab := Contab.MessageInfo;
            raise EValidacao.CreateVal('Não é possível estornar lançamentos a partir da data:' + #13 + '"' + sMsgContab + '"', edtDataAlteracao);
         end;
      end;

   except

      on ev : EValidacao do begin
         Screen.Cursor := crDefault;
         if ev.Show then MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

   Result := True;
end;



procedure TfrmExecAlteraConcessao.btnBuscaContratoClick(Sender: TObject);
var
   dDataMaxima : TDateTime;
begin
   inherited;

   ParametrosSistema;

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
   begin
      Application.CreateForm(TfrmExecBuscaContrato, frmExecBuscaContrato);
      frmExecBuscaContrato.Filtro := 'AND CON.FLGSITUACAO = ''A'' ' + #13;
      frmExecBuscaContrato.ShowModal;

      Repaint;

      if frmExecBuscaContrato.RetornouValor then
      begin
         Screen.Cursor  := crHourGlass;

         Sel(StrToFloat(frmExecBuscaContrato.ValoresChave[0]));

         DBEdit1.Text   := frmExecBuscaContrato.ValoresChave[1];
         iIdbenef      := StrToint(frmExecBuscaContrato.ValoresChave[4]);
         frmExecBuscaContrato.Free;

         Screen.Cursor  := crDefault;

         // Verifica se o contrato pode ser alterado em relação a data de crédito (5 dias úteis)

         dDataMaxima := DiasUteis.SomaDiasUteis(dtmEmptmo.qryDadosContratoDATACREDITO.AsDateTime,
                                                5,
                                                iCidade,
                                                iPais,
                                                sEstado,
                                                True,
                                                True,
                                                False
                                               );

         if Date > dDataMaxima then
         begin
            if ( (Sistema.TipoCliente <> 19971) and not(chkExcepcional.Checked) ) then   // REFER
            begin
               MsgDlg('Data de hoje superior a 5 dias úteis após a data de crédito!', 'Empréstimo', mtWarning, [mbOk], 0);
               Repaint;
               Sel(-1);
               Exit;
            end;
         end;

         LimpaParametros(qryTipoContrato);
         qryTipoContrato.ParamByName('PIDTIPOCONTREMPTMO').AsInteger := dtmEmptmo.qryDadosContratoIDTIPOCONTREMPTMO.AsInteger;
         qryTipoContrato.Open;
      end;
   end
   else
   begin
      dtmMS.MS_ContratoEmptmo.Executar;

      // Redesenha o form na volta do MontaSelect
      Repaint;

      if dtmMS.MS_ContratoEmptmo.RetornouValor then
      begin
         Screen.Cursor := crHourGlass;

         // abre a query principal com o participante escolhido
         Sel(StrToFloat(dtmMS.MS_ContratoEmptmo.ValoresChave[0]));

         Screen.Cursor := crDefault;

         // Verifica se o contrato pode ser alterado em relação a data de crédito (5 dias úteis)

         dDataMaxima := DiasUteis.SomaDiasUteis(dtmEmptmo.qryDadosContratoDATACREDITO.AsDateTime,
                                                5,
                                                iCidade,
                                                iPais,
                                                sEstado,
                                                True,
                                                True,
                                                False
                                               );

         if Date > dDataMaxima then
         begin
            if ( (Sistema.TipoCliente <> 19971) and not(chkExcepcional.Checked) ) then   // REFER
            begin
               MsgDlg('Data de hoje superior a 5 dias úteis após a data de crédito!', 'Empréstimo', mtWarning, [mbOk], 0);
               Repaint;
               Sel(-1);
               Exit;
            end;
         end;

         LimpaParametros(qryTipoContrato);
         qryTipoContrato.ParamByName('PIDTIPOCONTREMPTMO').AsInteger := dtmEmptmo.qryDadosContratoIDTIPOCONTREMPTMO.AsInteger;
         qryTipoContrato.Open;
      end; // if dtmMS.MS_ContratoEmptmo.RetornouValor
   end;

   //Pendência 22953 - 03/08/2006 - Alberto
   edtNovoValor.Value    := 0;
   edtVlrMargem.Value    := 0;
   edtMaximo.Value       := 0;

   edtNovoPrazo.Value := dtmEmptmo.qryDadosContratoPRAZO.AsInteger;
end;



procedure TfrmExecAlteraConcessao.FormShow(Sender: TObject);
begin
   inherited;

   ParametrosSistema;

   Sel(-1);
   edtDataAlteracao.Date := SysDate;

   // Mostra ou não os dados do Titular
   grpTitular.Visible    := (dtmEmptmo.qryParamEmptmoFLGMOSTRATIT.AsInteger = 0);
end;



procedure TfrmExecAlteraConcessao.btnContinuarClick(Sender: TObject);
var
   i      : Integer;
   fValor : Currency;
   iItem  : Integer;
   fSaldo : Currency;
   iTrata : Integer;
   iDias  : Integer; //Pendência 24862 - 28/03/3007 - Alberto
   bAchou : Boolean; //Pendência 25959 - 30/07/2007 - Alberto
begin
   if not(VerificaPreenchimento) then Exit;

      // xavier
   uFuncoesEmptmo.buscaUsuarioMutuario(iIdbenef);

   if uFuncoesEmptmo.bBuscaMutuario then
   begin
      MessageBox(handle,'O processo não poderá ser executado.'+#13#10+
                        'O usuário é o próprio mutuário do contrato de empréstimo!','Atenção',MB_ICONWARNING + MB_OK);
      Abort;
   end;
   // xavier


   // Efetua o cálculo dos itens conforme os novos dados
   PreencheDadosContrato(dtmEmptmo.qryDadosContratoPRAZO.AsInteger);

   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------

   if pgcControle.ActivePageIndex = 0 then
   begin
         if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
         begin
            //Pendência 24862 - 28/03/2007 - Alberto
            iDias := 3;
            if Time > StrToTime(dtmEmptmo.qryParamEmptmoHORAENCERRA.AsString) then inc(iDias);

            edtDataCredito.Date := DiasUteis.SomaDiasUteis(Sistema.IDEmpresa,
                                                           Date,
                                                           //3,
                                                           iDias,
                                                           True,
                                                           True,
                                                           False
                                                          );
            //Fim Pendência 24862
         end
         else  // if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1
         begin
            edtDataCredito.Date := CalcEmptmo.BuscaData('C', // Crédito
                                                        dtmEmptmo.qryDadosContratoFLGFORMAPAG.AsString,
                                                        dtmEmptmo.qryDadosContratoFLGINTERNO.AsString,
                                                        dtmEmptmo.qryDadosContratoIDPATRO.AsInteger,
                                                        dtmEmptmo.qryDadosContratoIDPLANOPREV.AsInteger,
                                                        0, // Parcela
                                                        edtDataAlteracao.Date
                                                       );
         end;  // if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1


      // Calcula Reserva
      edtValReserva.Value := CalcEmptmo.BuscaReserva(dtmEmptmo.qryDadosContratoIDBENEF.AsInteger,
                                                     dtmEmptmo.qryDadosContratoIDPATRO.AsInteger,
                                                     dtmEmptmo.qryDadosContratoIDPLANOPREV.AsInteger,
                                                     qryTipoContratoIDREGRARESERVA.AsInteger,
                                                     dtmEmptmo.qryDadosContratoDATAINSC.AsDateTime,
                                                     True
                                                     //Pendência 22836 - 03/10/2006 - Alberto
                                                    ,0
                                                    ,chkExcepcional.Checked
                                                     //Fim Pendência 22836
                                                    );

      // Calcula Salário
      if not(qryTipoContratoIDREGRASALBAS.IsNull) then
      begin
         edtSalario.Value := CalcEmptmo.BuscaSalarioBase(qryTipoContratoIDREGRASALBAS.AsInteger,
                                                         dtmEmptmo.qryDadosContratoIDPESSOA.AsInteger,
                                                         dtmEmptmo.qryDadosContratoIDBENEF.AsInteger,
                                                         fSalParticipacao,
                                                         fSalMantido,
                                                         fSalAuxDoenca,
                                                         fSalBenef,
                                                         True,
                                                         Date,
                                                         //Fanuel Junior SOL151964 Kintana1124438
                                                         qryTipoContratoIDTIPOCONTREMPTMO.AsInteger
                                                         //Pendência 22836 - 03/10/2006 - Alberto
                                                         ,0
                                                         ,chkExcepcional.Checked
                                                         //Fim Pendência 22836
                                                        );
      end;

      // Calcula Margem
      if edtVlrMargem.Value = 0 then
      begin
         edtVlrMargem.Value := CalcEmptmo.BuscaMargem(dtmEmptmo.qryDadosContratoIDPESSOA.AsInteger,
                                                      dtmEmptmo.qryDadosContratoIDBENEF.AsInteger,
                                                      qryTipoContratoIDREGRAMARGEM.AsInteger,
                                                      edtSalario.Value,
                                                      dtmEmptmo.qryDadosContratoPRAZO.AsInteger,
                                                      0,
                                                      fSalParticipacao,
                                                      fSalMantido,
                                                      fSalAuxDoenca,
                                                      fSalBenef,
                                                      True,
                                                      Date,
                                                      dtmEmptmo.qryDadosContratoPRAZO.AsInteger,
                                                      vDividasAnteriores,
                                                      //Pendência 22836 - 03/10/2006 - Alberto
                                                      false,
                                                      0,
                                                      chkExcepcional.Checked,
                                                      //Fim Pendência 22836
                                                      '',
                                                      edtDataCredito.Text, // Ádler Souza - SOL 131189 Kintana 744558
                                                      13, // Ádler Souza - SOL 75516 Kintana 523281
                                                      -1, //Fanuel Junior SOL 162404 Kintana 1380377
                                                      dtmEmptmo.qryDadosContratoIDPLANOPREV.AsInteger //Fanuel Junior SOL 162404 Kintana 1380377
                                                     );
      end;

      // Calcula Valor Máximo
      rContrato.VlrContrato := 0;
      edtMaximo.Value       := CalcEmptmo.BuscaVlrSolicMax(rContrato,
                                                           dtmEmptmo.qryDadosContratoIDSITPART.AsInteger,
                                                           dtmEmptmo.qryDadosContratoTXJUROS.AsFloat,
                                                           edtVlrMargem.Value,
                                                           edtValReserva.Value,
                                                           0,
                                                           0,
                                                           fSalParticipacao,
                                                           fSalMantido,
                                                           fSalAuxDoenca,
                                                           fSalBenef,
                                                           edtSalario.Value,
                                                           True, // Mostra
                                                           //Pendência 26951 - 03/12/2007
                                                           vDividasAnteriores,
                                                           //Fim Pendência 26951
                                                           //Pendência 22836 - 03/10/2006 - Alberto
                                                           0,
                                                           chkExcepcional.Checked
                                                           //Fim Pendência 22836
                                                          );
      PreencheDadosContrato(dtmEmptmo.qryDadosContratoPRAZO.AsInteger);
   end;  // if pgcControle.ActivePageIndex = 1

   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------

   if pgcControle.ActivePageIndex = 1 then
   begin
      // Calcula a nova prestação básica, bem como todos os itens da nova concessão
      if not(CalculaNovaConcessao) then Exit;

      //Pendência 27749 - 16/04/2008
      //if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger <> 1) or not(dtmEmptmo.qryDadosContratoIDTIPOCONTREMPTMO.AsInteger in [11, 12, 13, 14, 15, 16, 19, 20]) then
      if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger <> 1) or
         (qryTipoContratoFLGNAOVERIFICAMRGPCL.AsInteger = 0) then
      //Fim Pendência 27749
      begin
         if edtNovoValor.Value > edtMaximo.Value then
         begin
            MsgDlg('Novo valor não pode ser superior ao máximo permitido!', 'Empréstimo', mtWarning, [mbOk], 0);
            Repaint;
            edtNovoValor.SetFocus;
            Exit;
         end;
      end;

      //Pendência 27749 - 16/04/2008
      //if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger <> 1) or not(dtmEmptmo.qryDadosContratoIDTIPOCONTREMPTMO.AsInteger in [11, 12, 13, 14, 15, 16, 19, 20, 21, 17]) then
      if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger <> 1) or
         (qryTipoContratoFLGNAOVERIFICAMRGPCL.AsInteger = 0) then
      //Fim Pendência 27749
      begin
         if edtPrestacao.Value > edtVlrMargem.Value then
         begin
            MsgDlg('Prestação Básica não pode ser superior a margem consignável!', 'Empréstimo', mtWarning, [mbOk], 0);
            Repaint;
            edtNovoValor.SetFocus;
            Exit;
         end;
      end;

      qryHistMovVirtual.Close;
      qryHistMovVirtual.Open;

      SetLength(vListaCalculo, High(vLista) + 1);
      fSaldo := 0;

      // Faz as comparações dos valores calculados com os itens anteriores
      for i := 0 to High(vLista) do
      begin

         iItem := vLista[i].CodigoItem;

         //Pendência 25959 - 30/07/2007 - Alberto
         //qryHistMov.Locate('IDITEMEMPTMO', iItem, [loCaseInsensitive]);
         bAchou := qryHistMov.Locate('IDITEMEMPTMO', iItem, [loCaseInsensitive]);

         if bAchou then
            fValor := (vLista[i].Valor - qryHistMov.FieldByName('HMEVLRPREVISTO').AsCurrency)
         else
            fValor := vLista[i].Valor;
         //Fim Pendência 25959

         // ----------------------------------------------------------------------------------------
         // André Pontes - 17/08/2005 - pendência 19987 (novo código que substitui o comentado abaixo)
         if ( (vLista[i].iEvento = 0) and (vLista[i].FlgCentraliza = 0) ) then
         begin

            //Pendência 25959 - 30/07/2007 - Alberto
            if bAchou then
               fValor := (vLista[i].Valor - qryHistMov.FieldByName('HMEVLRPREVISTO').AsCurrency)
            else
               fValor := vLista[i].Valor;
            //Fim Pendência 25959

            // Busca parâmetro de tratamento na alteração de concessão
            with qryItemXTipoContr do
            begin
               LimpaParametros(qryItemXTipoContr);
               ParamByName('PIDITEMEMPTMO').AsInteger       := iItem;
               ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := dtmEmptmo.qryDadosContratoIDTIPOCONTREMPTMO.AsInteger;
               Open;

               iTrata := 0;
               if not(isEmpty) then iTrata := qryItemXTipoContrFLGVLRALTERACONC.AsInteger;
               Close;
            end;

            case iTrata of
               1: fValor := 0;
               2: if fValor > 0 then fValor := 0;
               3: if fValor < 0 then fValor := 0;
            end;
         end;
         // FIM André Pontes - 17/08/2005 - 19987 (novo código que substitui o comentado abaixo)
         // ----------------------------------------------------------------------------------------

         if vLista[i].iEvento = 0 then
         begin
            // ----------------------------------------------------------------------------------
            //if fSaldo = 0 then -- Denise Arruda 03/07/2008 Sol nº81962
            if i = 0 then
            begin
               fSaldo := qryHistMov.FieldByName('HMESALDODEV').AsCurrency + fValor;
            end;
            // ----------------------------------------------------------------------------------

            if fValor < 0 then
            begin
               vListaCalculo[i].RecPag := 'R';
            end
            else
            begin
               vListaCalculo[i].RecPag := 'P';
            end;

            vListaCalculo[i].Valor              := fValor;
            vListaCalculo[i].SaldoDevedor       := fSaldo;

            vListaCalculo[i].CodigoItem         := vLista[i].CodigoItem;
            vListaCalculo[i].Regra              := vLista[i].Regra;
            vListaCalculo[i].Rubrica            := vLista[i].Rubrica;
            vListaCalculo[i].iEvento            := vLista[i].iEvento;
            vListaCalculo[i].FlgEnvio           := 0;
            vListaCalculo[i].FlgBaixado         := 0;
            vListaCalculo[i].Nome               := vLista[i].Nome;
            vListaCalculo[i].FormaCobranca      := vLista[i].FormaCobranca;
            vListaCalculo[i].TipoFolha          := vLista[i].TipoFolha;

            vListaCalculo[i].Parcela            := vLista[i].Parcela;
            vListaCalculo[i].ParcResta          := vLista[i].ParcResta;
            vListaCalculo[i].ParcelaAlt         := 0; // é concessão

            vListaCalculo[i].Origem             := vLista[i].Origem;
            vListaCalculo[i].Prioridade         := vLista[i].Prioridade;
            vListaCalculo[i].SeqCalculo         := vLista[i].SeqCalculo;
            vListaCalculo[i].SeqCobranca        := 2;
            vListaCalculo[i].FlgCentraliza      := vLista[i].FlgCentraliza;
            vListaCalculo[i].FlgDivergPend      := 0;
            vListaCalculo[i].IDItemCentraliza   := vLista[i].IDItemCentraliza;
            vListaCalculo[i].AnoCompetencia     := vLista[i].AnoCompetencia;
            vListaCalculo[i].MesCompetencia     := vLista[i].MesCompetencia;
            vListaCalculo[i].AnoCobranca        := vLista[i].AnoCobranca;
            vListaCalculo[i].MesCobranca        := vLista[i].MesCobranca;
            vListaCalculo[i].DataPrevista       := edtDataCredito.Date;
            vListaCalculo[i].DataVencto         := edtDataCredito.Date;
            vListaCalculo[i].DataEfetiva        := vLista[i].DataEfetiva;

            // Marchetti - Pendencia 23449
            if ( (vLista[i].FlgCentraliza = 1) and (fValor = 0) ) then
            begin
               vListaCalculo[i].DataEfetiva := edtDataCredito.Date;
               vListaCalculo[i].FlgBaixado  := -1;
            end;
            // Fim Marchetti - Pendencia 23449

            vListaCalculo[i].DataUltAtualiza    := vLista[i].DataUltAtualiza;
            vListaCalculo[i].TxJuros            := vLista[i].TxJuros;
            vListaCalculo[i].TxJurosAnt         := vLista[i].TxJurosAnt;
            vListaCalculo[i].FlgDestacado       := vLista[i].FlgDestacado;
            vListaCalculo[i].ValorEfetivo       := vLista[i].ValorEfetivo;
            vListaCalculo[i].FlgTipoDiverg      := vLista[i].FlgTipoDiverg;

            //Pendência 22953 - 02/08/2006 - Alberto
            vListaCalculo[i].FlgGravaZERO       := vLista[i].FlgGravaZERO;
            //Fim Pendência ...

            qryHistMovVirtual.Insert;
            qryHistMovVirtualITEDESCRICAO.AsString       := vListaCalculo[i].Nome;
            qryHistMovVirtualEVENTO.AsString             := 'Concessão';
            qryHistMovVirtualIDCONTRATOEMPTMO.AsFloat    := rContrato.IDContratoEmptmo;
            qryHistMovVirtualIDITEMEMPTMO.AsInteger      := vListaCalculo[i].CodigoItem;
            qryHistMovVirtualHMEDATAPREVISTA.AsDateTime  := vListaCalculo[i].DataPrevista;
            qryHistMovVirtualHMEVLRPREVISTO.AsCurrency   := vListaCalculo[i].Valor;
            qryHistMovVirtualHMESALDODEV.AsCurrency      := vListaCalculo[i].SaldoDevedor;
            qryHistMovVirtual.Post;
         end;  // if vLista[i].iEvento = 0
      end;  // for i := 0 to High(vLista)
   end;  // if pgcControle.ActivePageIndex = 1

   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------

   inherited;
end;



procedure TfrmExecAlteraConcessao.edtDataAlteracaoExit(Sender: TObject);
var
  iDias : Integer;
begin
   inherited;

   // Calcula a nova data de crédito
   if dtmEmptmo.qryDadosContratoVLRCONTRATO.AsCurrency > edtNovoValor.Value then
   begin
      if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
      begin
         //Ádler Souza - SOL 56282 KTN 525253
         iDias := 3;
         if Time > StrToTime(dtmEmptmo.qryParamEmptmoHORAENCERRA.AsString) then inc(iDias);

         edtDataCredito.Date  := DiasUteis.SomaDiasUteis(Sistema.IDEmpresa,
                                                         edtDataAlteracao.Date,
                                                         iDias,
                                                         True,
                                                         True,
                                                         False
                                                        );
      end
      else
      begin
         edtDataCredito.Date  := edtDataAlteracao.Date;
      end;
   end
   else  // if DBedtValSolic.Value > edtNovoValor.Value
   begin
      if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
      begin
         //Ádler Souza - SOL 56282 KTN 525253
         iDias := 2;
         if Time > StrToTime(dtmEmptmo.qryParamEmptmoHORAENCERRA.AsString) then inc(iDias);

         edtDataCredito.Date := DiasUteis.SomaDiasUteis(Sistema.IDEmpresa,
                                                        edtDataAlteracao.Date,
                                                        iDias,
                                                        True,
                                                        True,
                                                        False
                                                       );
      end
      else  // if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1
      begin
         edtDataCredito.Date := CalcEmptmo.BuscaData('C', // Crédito
                                                     dtmEmptmo.qryDadosContratoFLGFORMAPAG.AsString,
                                                     dtmEmptmo.qryDadosContratoFLGINTERNO.AsString,
                                                     dtmEmptmo.qryDadosContratoIDPATRO.AsInteger,
                                                     dtmEmptmo.qryDadosContratoIDPLANOPREV.AsInteger,
                                                     0, // Parcela
                                                     edtDataAlteracao.Date
                                                    );
      end;  //if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1
   end;  // if DBedtValSolic.Value > edtNovoValor.Value
end;



procedure TfrmExecAlteraConcessao.PreencheDadosContrato(iNumParcela : Integer);
var
   iContador   : Integer;
   qryAux      : TwwQuery;
   sSQL        : String;
begin
   // Procedimento que armazena os dados da Inscrição num registro
   LimpaRegistroContrato(rContrato);
   LimpaRegistroConcessao(rConcessao);

   // É nulo na Concessão
   rContrato.IdContratoEmptmo  := dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat;
   rContrato.IDContrQuitacao   := dtmEmptmo.qryDadosContratoIDCONTRQUITACAO.AsFloat;

   rContrato.IdPessoa          := dtmEmptmo.qryDadosContratoIDPESSOA.AsInteger;
   rContrato.IDTipoContrEmptmo := dtmEmptmo.qryDadosContratoIDTIPOCONTREMPTMO.AsInteger;
   rContrato.IDTipoEmptmo      := dtmEmptmo.qryDadosContratoIDTIPOEMPTMO.AsInteger;
   rContrato.IdPlanoPrev       := dtmEmptmo.qryDadosContratoIDPLANOPREV.AsInteger;
   rContrato.IDPlanoOrigem     := dtmEmptmo.qryDadosContratoIDPLANOORIGEM.AsInteger;
   rContrato.IdPatro           := dtmEmptmo.qryDadosContratoIDPATRO.AsInteger;
   rContrato.Indexador         := dtmEmptmo.qryDadosContratoMOECODIGO.AsInteger;
   rContrato.IdSitPart         := dtmEmptmo.qryDadosContratoIDSITPART.ASInteger;

   try
      qryAux               := TwwQuery.Create(Application);
      qryAux.DatabaseName  := 'BASEDADOS';

      sSQL := 'SELECT MOESIGLA FROM MOEDA WHERE MOECODIGO = ' + IntToStr(rContrato.Indexador);

      qryAux.SQL.Text := sSQL;
      qryAux.Open;

      rContrato.SiglaIndexador := qryAux.FieldByName('MOESIGLA').AsString;
   finally
      qryAux.Close;
      qryAux.Free;
   end;

   // Número da Inscrição
   rContrato.IDInscricaoEmptmo := dtmEmptmo.qryDadosContratoIDInscricaoEmptmo.AsFloat;

   // É nulo
   rContrato.IDVerba := -1;

   // Beneficiário do Contrato
   //   IDBENEF = IDPESSOA -> do Titular no caso de estar vivo
   //   e do Beneficiário no caso de Pensionista
   rContrato.IdBenef          := dtmEmptmo.qryDadosContratoIDBENEF.AsInteger;

   rContrato.FlgSuspensaoAuto := dtmEmptmo.qryDadosContratoFLGSUSPENSAOAUTO.AsInteger;

   if not(dtmEmptmo.qryDadosContratoIDCBANCARIA.IsNull) then begin
      rContrato.IDCBancaria   := dtmEmptmo.qryDadosContratoIDCBANCARIA.AsInteger;
   end else begin
      // É nulo
      rContrato.IDCBancaria   := -1;
   end;

   // É nulo
   if dtmEmptmo.qryDadosContratoCODFORMAPAG.AsString <> '' then
   begin
      rContrato.CodFormaPag   := dtmEmptmo.qryDadosContratoCODFORMAPAG.AsInteger;
   end
   else
   begin
      rContrato.CodFormaPag   := -1;
   end;

   if dtmEmptmo.qryDadosContratoPORTFORMAPAG.AsString <> '' then
   begin
      rContrato.PortFormaPag  := dtmEmptmo.qryDadosContratoPORTFORMAPAG.AsInteger;
   end
   else
   begin
      rContrato.PortFormaPag  := -1;
   end;

   if dtmEmptmo.qryDadosContratoPORTFORMAREC.AsString <> '' then
   begin
      rContrato.PortFormaRec  := dtmEmptmo.qryDadosContratoPORTFORMAREC.AsInteger;
   end
   else
   begin
      rContrato.PortFormaRec  := -1;
   end;

   rContrato.NumParcelas      := iNumParcela;                                     // Número de Parcelas
   rContrato.DataCredito      := edtDataCredito.Date;                             // Data em que o empréstimo será creditado
   rContrato.DataSituacao     := trunc(SysDate);                                  // Data da Situação do Contrato como data do Sistema
   rContrato.DataAssinatura   := StrToDate(DBedtDataInsc.Text);                   // Data de Assinatura do Contrato como data do Sistema
   rContrato.DataPrimParc     := StrToDate(DBedtDataPrimParcela.Text);            // Data do pagamento da Primeira Parcela do Contrato
   rContrato.DataInscricao    := StrToDate(DBedtDataInsc.Text);                   // Data da Solicitação - Inscrição
   rContrato.DataCanc         := -1;                                              // Data nula
   rContrato.VlrContrato      := dtmEmptmo.qryDadosContratoVLRCONTRATO.AsFloat;   // Valor do Contrato
   rContrato.VlrParcela       := dtmEmptmo.qryDadosContratoVLRPARCELA.AsFloat;    // Valor da Parcela
   rContrato.Txjuros          := dtmEmptmo.qryDadosContratoTXJUROS.AsFloat;       // Taxa de Juros do Contrato

   rContrato.VlrSalBase       := dtmEmptmo.qryDadosContratoVLRSALBASE.AsCurrency;
   rContrato.VlrMargem        := dtmEmptmo.qryDadosContratoVLRMARGEM.AsCurrency;
   rContrato.VlrMaxPermit     := dtmEmptmo.qryDadosContratoVLRMAXPERMIT.AsCurrency;

   rContrato.VlrParcelaMes    := 0;
   rContrato.VlrParcelaAtraso := 0;
   rContrato.VlrReserva       := dtmEmptmo.qryDadosContratoVLRRESERVA.AsCurrency;
   rContrato.VlrDebito        := 0;

   rContrato.FlgSituacao      := 'A';

   // FLGFORMAREC = C -> indicando que o Débito é pelo Contas a Receber
   //               F -> indicando que o Débito é pela Folha
   rContrato.flgFormaRec      := dtmEmptmo.qryDadosContratoFLGFORMAREC.AsString;


   // FLGFORMAPAG = C -> indicando que o Crédito é pelo Contas a Pagar
   //               F -> indicando que o Crédito é pela Folha
   rContrato.flgFormaPag      := dtmEmptmo.qryDadosContratoFLGFORMAPAG.AsString;

   // Carrega os dados da concessão
   rConcessao.DataCredito     := dtmEmptmo.qryDadosContrato.FieldByName('DATACREDITO').AsDateTime;
   rConcessao.ValorSolic      := dtmEmptmo.qryDadosContrato.FieldByName('VLRCONTRATO').AsCurrency;
   rConcessao.Prazo           := dtmEmptmo.qryDadosContrato.FieldByName('PRAZO').AsInteger;
end;



function  TfrmExecAlteraConcessao.CalculaNovaConcessao: Boolean;
var
   i, iMenorSeq   : Integer;
   sAnoMesCompet  : String;
   fSaldoEPAnt    : Currency;
   //BRUNO AZEVEDO SOL 201395 KINTANA 1947848
   dValorMargem, dValorMaximo: Double;
begin
   Result         := False;

   sAnoMesCompet  := FormatDateTime('YYYYMM', edtDataAlteracao.Date);

   try
      vLista        := nil;
      vListaCalculo := nil;

      rSaldosAntPos := CalcEmptmo.BuscaSaldosAntPos(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat,
                                                    edtDataAlteracao.Date
                                                   );

      iPais    := dtmEmptmo.qryParamEmptmoIDPAIS.AsInteger;
      iCidade  := dtmEmptmo.qryParamEmptmoIDCIDADES.AsInteger;
      sEstado  := dtmEmptmo.qryParamEmptmoCODESTADO.AsString;

      // Utiliza a função CalculaItens da unit UCalcEmptmo para pegar a parcela e
      //      os itens de concessão com seus respectivos valores, em relação ao número de
      //      parcelas escolhida pelo participante

      rContrato.NumParcelas := trunc(edtNovoPrazo.Value);

      fSaldoEPAnt := 0;

      qryHistMov.DisableControls;
      qryHistMov.First;
      while not(qryHistMov.EOF) do
      begin
         if (qryHistMovIDITEMEMPTMO.AsInteger = 18) and (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1) then
         begin
            fSaldoEPAnt := qryHistMovHMEVLRPREVISTO.AsCurrency;
         end;
         //Pendência 23078 - 15/08/2006 - Alberto
         if (qryHistMovIDITEMEMPTMO.AsInteger = 2) and (Sistema.TipoCliente = 19971) then
         begin
            fSaldoEPAnt := qryHistMovHMEVLRPREVISTO.AsCurrency;
         end;
         //Fim Pendência 23078
         qryHistMov.Next;
      end;

      qryHistMov.EnableControls;

      // -------------------------------------------------------------------------------------------

      //BRUNO AZEVEDO SOL 201395 KINTANA 1947848
      if (edtVlrMargem.Value <= 0) then begin
        dValorMargem := 0;
      end;

      if (edtMaximo.Value <= 0) then begin
        dValorMaximo := 0;
      end;
      //BRUNO AZEVEDO SOL 201395 KINTANA 1947848

      CalcEmptmo.CalculaItens(rContrato,
                              rConcessao,
                              0,    // Tipo do item - É parcela 0 na Concessão
                              13,   // Alteração de concessão
                              iPais,
                              sEstado,
                              iCidade,
                              rSaldosAntPos.iParcelaPos,
                              dtmEmptmo.qryDadosContratoIDSITPART.AsInteger,
                              rContrato.FlgFormaPag,
                              dtmEmptmo.qryDadosContratoTXJUROS.AsFloat,   // rSaldosAntPos.fTxJurosPos,
                              rContrato.VlrContrato,
                              edtNovoValor.Value,
                              fSaldoEPAnt,                                 // saldo devedor do contrato anterior (já quitado)
                              //BRUNO AZEVEDO SOL 201395 KINTANA 1947848
                              //rContrato.VlrMargem,
                              dValorMargem,
                              0, 0, 0, 0, 0, 0,
                              //BRUNO AZEVEDO SOL 201395 KINTANA 1947848
                              //edtMaximo.Value,
                              dValorMaximo,
                              0, 0, 0,
                              edtDataAlteracao.Date,
                              edtDataAlteracao.Date,
                              sAnoMesCompet,
                              False,
                              True,
                              True,
                             //Pendência 22913 - 28/07/2006 - Alberto
                             // vLista
                             //);
                              vLista,
                              0,
                              0,
                              0,
                              True,
                              0,
                              0,
                              -1,
                              False,
                              0,
                              0,
                              0,
                              0,
                              0,
                              True,
                              dtmEmptmo.qryDadosContratoFLGFINANCIAMENTO.AsInteger
                              //Pendência 22836 - 03/10/2006 - Alberto
                             ,chkExcepcional.Checked
                              //Fim Pendência 22836
                             );
                            //Fim Pendência 22913

   except
      MsgDlg('Erro ao calcular itens!', 'Empréstimo', mtError, [mbOk], 0);
      Exit;
   end;

   edtPrestacao.Value         := 0;
   edtPrestacaoBasica.Value   := 0;

   // Laço verificando se o item é parcela ou se é o Líquido concedido
   for i := 0 to High(vLista) do
   begin
      // é a Parcela
      if ( (vLista[i].iEvento = 1) and (vLista[i].FlgCentraliza = 1) ) then
      begin
         if vLista[i].Valor > 0 then
         begin
            edtPrestacao.Value         := vLista[i].Valor;
            edtPrestacaoBasica.Value   := vLista[i].Valor;
         end;

         // gravação do Valor Base (IOF Complementar)
         if ( (vLista[i].iEvento = 0) and (vLista[i].CodigoItem = dtmEmptmo.qryParamEmptmoIDITEMIOFCOMPLCON.AsInteger) ) then
         begin
            vLista[i].ValorBase := edtNovoValor.Value - rContrato.VlrContrato;
         end;
      end;
   end;  // for

   Result := True;
end;



procedure TfrmExecAlteraConcessao.bbtnConfirmarClick(Sender: TObject);
var
   qryAux            : TwwQuery;

   sMsgErro          : String;
   sSQL, sMsg        : String;
   sHistoricoContab  : String;

   sResult, sErro    : TStringList;

   //Pendência 22953 - 04/08/2006 - Alberto
   iContador,

   iPlanilhaResult   : Integer;

   iPlanilha         : Int64;
   iDocumento        : Int64;

   dDataUltAtuDia    : TDateTime;

   rLogTotalPrev     : TLogTotalPrev;
begin
   inherited;

   // ----------------------------------------------------------------------------------------------

   if not(VerificaPreenchimento) then Exit;

   // ----------------------------------------------------------------------------------------------

   // André Pontes - 20/02/2006 - pendência 21564
   if edtNovoValor.Value = 0 then if not(VerificaPreenchimentoCancelamento) then Exit;

   try
      try
         // Inicia uma transação - só se não ouver transação iniciada
         if dtmBaseDados.dbBaseDados.InTransaction then
         begin
            MsgDlg('Transação anterior em progresso!', 'Empréstimo', mtError, [mbOk], 0);
            Repaint;
            Exit;
         end;

         StartTransacao;

         // ----------------------------------------------------------------------------------------

         qryAux               := TwwQuery.Create(Application);
         qryAux.DatabaseName  := 'BaseDados';

         CalcEmptmo.GravaMovEmptmo(rContrato,
                                   vListaCalculo,
                                   0,                                                     // Evento 0 - Concessão
                                   0,                                                     // Parcela
                                   StrToInt(FormatDateTime('YYYY', edtDataCredito.Date)), // Ano Competência - Ano do Item
                                   StrToInt(FormatDateTime('MM', edtDataCredito.Date)),   // Mês Competência - Mês do Item
                                   StrToInt(FormatDateTime('YYYY', edtDataCredito.Date)), // Ano Cobrança - Ano da Data de Quitação
                                   StrToInt(FormatDateTime('MM', edtDataCredito.Date)),   // Mês Cobranca - Mês da Data de Quitação

                                   // André Pontes - 24/08/2005 - pendência 20040
                                   rContrato.NumParcelas,                                 // Parcelas Remanescentes (novo prazo)
//                                   StrToInt(edtPrazo.Text),                               // Parcelas Remanescentes
                                   // FIM André Pontes - 24/08/2005 - pendência 20040

                                   edtDataCredito.Date,                                   // DataPrevista -> Data de Amortização
                                   edtDataCredito.Date,                                   // dDataUltAtualiza -> Data de Amortização
                                   '',
                                   '',
                                   True                                                   // Mostra o Form de Progresso
                                  );


         if edtNovoValor.Value = 0 then
         begin
            // -------------------------------------------------------------------------------------
            // Desfaz a Quitação do Contrato Anterior
            // -------------------------------------------------------------------------------------
            LimpaParametros(qryContratoAnterior);
            qryContratoAnterior.ParamByName('PIDCONTRATOEMPTMO').AsFloat := dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat;
            qryContratoAnterior.Open;

            while not(qryContratoAnterior.EOF) do
            begin
               CalcEmptmo.CancelaQuitacao(qryContratoAnteriorIDCONTRATOEMPTMO.AsFloat,
                                          DBedtDataCredito.Date,  // Data da quitação
                                          edtDataAlteracao.Date,  // Data de cancelamento da quitação
                                          0                       // Origem da quitação
                                         );
               qryContratoAnterior.Next;
            end;

            qryContratoAnterior.Close;
         end;  // if edtNovoValor.Value = 0

         if Sistema.TipoCliente = 19991 then // FUNCEF
         begin
            dDataUltAtuDia := dtmAtualizacaoDiaria.UltimaAtuDia(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat, -1);

            // -------------------------------------------------------------------------------------

            dtmAtualizacaoDiaria.ExecutaAtuDia(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat,
                                               Sistema.IDModulo,
                                               -1,                            // Tipo Contr
                                               -1,                            // Tipo Emptmo
                                               -1,                            // Patro
                                               -1,                            // Plano
                                               1,                             // Estorno
                                               1,                             // Prov Perda
                                               1,                             // Atu Saldo
                                               -1,                            // In Arquivo
                                               -1,                            // Not In Arquivo
                                               edtDataAlteracao.Date,         // Data Ini
                                               dDataUltAtuDia,                // Data Fim
                                               (edtDataAlteracao.Date - 1)    // Data Considera
                                              );

            // -------------------------------------------------------------------------------------
         end;

         //Ewerton Beltramini - 16/11/2021 - SIG117285 - Inicio...
         QryAuxAlteradores.Close;
         QryAuxAlteradores.SQL.Clear;
         QryAuxAlteradores.SQL.Add(' UPDATE HMEATUDIARIA');
         QryAuxAlteradores.SQL.Add(' SET FLGESTORNADO = 1');
         QryAuxAlteradores.SQL.Add(' WHERE IDITEMEMPTMO IN (4,23,47)');
         QryAuxAlteradores.SQL.Add('    AND FLGESTORNADO <> 1 ');
         QryAuxAlteradores.SQL.Add('    AND IDCONTRATOEMPTMO = ' + FloatToStr(rContrato.IDContratoEmptmo));
(*
         QryAuxAlteradores.SQL.Add('    AND DATAPREVISTA >= (SELECT MAX(DATAPREVISTA)');
         QryAuxAlteradores.SQL.Add('                          FROM HMECONCESSAO');
         QryAuxAlteradores.SQL.Add('                         WHERE IDITEMEMPTMO IN(6)');
         QryAuxAlteradores.SQL.Add('                           AND IDCONTRATOEMPTMO = HMEATUDIARIA.IDCONTRATOEMPTMO');
         QryAuxAlteradores.SQL.Add('                           AND VLRPREVISTO < 0)');
*)
         QryAuxAlteradores.ExecSQL;
         //Ewerton Beltramini - 16/11/2021 - SIG117285 - Fim.

//         CalcEmptmo.AcertaSituacaoContratual(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat, 13); //Marcio Sanches Spinosa SOL 189082 Kintana 1985002

         // ----------------------------------------------------------------------------------------

         LimpaRegistroLog(rLogTotalPrev);

         rLogTotalPrev.IDModulo   := Sistema.IDModulo;
         rLogTotalPrev.IDContrato := dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat;
         rLogTotalPrev.IDHistMov  := -1;
         rLogTotalPrev.Origem     := 13;

         rLogTotalPrev.Operacao   := 'Alteração de Valores de Concessão de Empréstimo';

         // André Pontes - 20/12/2005
         if chkExcepcional.Checked then rLogTotalPrev.Operacao   := rLogTotalPrev.Operacao + ' - EXCEPCIONAL';

         rLogTotalPrev.Data       := SysDate;
         rLogTotalPrev.IDUsuario  := Sistema.IdUsuario;
         rLogTotalPrev.Versao     := Sistema.Versao;

         GravaLogTotalPrev(rLogTotalPrev);

         // ----------------------------------------------------------------------------------------
         // SOL 262251 PPM 1089539 inicio
         {
         sSQL:=
         'DELETE FROM '       + #13 +
         '   HISTMOVEMPTMO '  + #13 +
         'WHERE '             + #13 +
         '       IDCONTRATOEMPTMO = ' + dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsString + #13 +
         '   AND IDITEMEMPTMO     = 0';

         qryAux.SQL.Clear;
         qryAux.SQL.Add(sSQL);
         qryAux.ExecSQL;
         }

         //SOL 262251 PPM 1089539 fim

         if (dtmEmptmo.qryParamEmptmoFLGINTEGRACONC.AsInteger <> 1) and
            (edtNovoValor.Value <> 0) then
         begin
            EnviaItensPatroCAPCAR(rContrato.IDContratoEmptmo);
         end;

(*
         //BRUNO AZEVEDO SOL 153818 KINTANA 1163513
         sSQL:=
         ' UPDATE CONTRATOEMPTMO SET ' + #13 +
         '   VLRPARCELA = '  + QuotedStr(edtPrestacaoBasica.Text) + #13 +
         '  ,VLRCONTRATO = '  + QuotedStr(StringReplace(edtNovoValor.Text,'.','',[])) + #13 +
         ' WHERE IDCONTRATOEMPTMO = ' + dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsString;

         qryAux.SQL.Clear;
         qryAux.SQL.Add(sSQL);
         qryAux.ExecSQL;
         //BRUNO AZEVEDO SOL 153818 KINTANA 1163513
*)
         //Ewerton Beltramini - 17/11/2021 - SIG 117285 - Inicio... (Refazendo o bloco acima)
         sSQL:= ' UPDATE CONTRATOEMPTMO SET ' + #13;

         if ((POS('.', edtPrestacaoBasica.Text)  = 0) and (POS(',', edtPrestacaoBasica.Text) = 0)) or
            ((POS('.', edtPrestacaoBasica.Text) <> 0) and (POS(',', edtPrestacaoBasica.Text) = 0)) then
             sSQL:= sSQL + '   VLRPARCELA = '  +  edtPrestacaoBasica.Text + #13
         else if ((POS('.', edtPrestacaoBasica.Text) = 0) and (POS(',', edtPrestacaoBasica.Text) <> 0)) or
                 ((POS('.', edtPrestacaoBasica.Text) <> 0) and (POS(',', edtPrestacaoBasica.Text) <> 0)) then
             sSQL:= sSQL + '   VLRPARCELA = '  +  StringReplace(StringReplace(edtPrestacaoBasica.Text,'.','',[]),',','.',[]) + #13;

         if ((POS('.', edtNovoValor.Text)  = 0) and (POS(',', edtNovoValor.Text) = 0)) or
            ((POS('.', edtNovoValor.Text) <> 0) and (POS(',', edtNovoValor.Text) = 0)) then
             sSQL:= sSQL + '   ,VLRCONTRATO = '  +  edtNovoValor.Text + #13
         else if ((POS('.', edtNovoValor.Text) = 0) and (POS(',', edtNovoValor.Text) <> 0)) or
                 ((POS('.', edtNovoValor.Text) <> 0) and (POS(',', edtNovoValor.Text) <> 0)) then
             sSQL:= sSQL + '   ,VLRCONTRATO = '  +  StringReplace(StringReplace(edtNovoValor.Text,'.','',[]),',','.',[]) + #13;

         sSQL:= sSQL + ' WHERE IDCONTRATOEMPTMO = ' + dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsString;

         qryAux.SQL.Clear;
         qryAux.SQL.Text := sSQL;
         qryAux.ExecSQL;
         //Ewerton Beltramini - 17/11/2021 - SIG 117285 - Fim

         CommitTransacao;

         MsgDlg('Processo finalizado.' + #13 + 'Concessão Alterada.', 'Empréstimo', mtInformation, [mbOk], 0);
         Repaint;

         Sel(-1);

         pgcControle.ActivePageIndex := 0;

      except
         RollBackTransacao;

         MsgDlg('Processo interrompido.' + #13 + 'Não foi possível alterar esta concessão.',
                'Empréstimo', mtInformation, [mbOk], 0);
         Repaint;
      end;

   finally
      qryAux.Free;
   end;
end;



procedure TfrmExecAlteraConcessao.DBgrdHistMovCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;

   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then
   begin
      if not Highlight then
      begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
         begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end
         else
         begin
            ABrush.Color := clWhite;
         end;
      end;
   end
   else
   begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmExecAlteraConcessao.DBgrdHistMovTopRowChanged(Sender: TObject);
begin
   inherited;

   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmExecAlteraConcessao.EnviaItensPatroCAPCAR(const iIDContratoEmptmo : Extended);
var
   sResult           : TStringList;
   sErro             : TStringList;
   iPlanilha         : Integer;
   sSQL, sMensagem   : String;
   sSQLUpdate        : String;
   qryAux            : TwwQuery;
begin
   sSQL :=
   'SELECT '                                                                                 + #13 +
   '  HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, HME.IDITEMEMPTMO, '                         + #13 +
   '  HME.HMEFORMACOBRANCA, HME.IDITEMCENTRALIZA, '                                          + #13 +
   '  ABS(HME.HMEVLRPREVISTO) AS HMEVLRPREVISTO, '                                           + #13 +
   '  HME.HMERECPAG, HME.HMEDATAPREVISTA, HME.HMEDATAVENCTO, '                               + #13 +
   '  HME.HMEPARCELA, HME.HMENUMPARCELAS, HME.HMESALDODEV, '                                 + #13 +
   '  HME.HMETIPOMOV, '                                                                      + #13 +

   '  CAST((LTRIM(RTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA, ''00'')))) '                               + #13 +
   '  || ''/'' || '                                                                          + #13 +
   '  (LTRIM(RTRIM(TO_CHAR(HME.HMEANOCOMPETENCIA, ''0000''))))  AS VARCHAR2(7)) AS ANOMESCOMPETENCIA, '       + #13 + //MIGRACAO-TIBERO

   '  ITC.CONTABAIXA, ITC.TIPCODIGO, ITC.ITCTRATASALDODEV, '                                 + #13 +
   '  ''               '' AS MATRICULA,  '                                                   + #13 +
   '  CON.IDPLANOPREV, CON.IDPATRO, CON.IDBENEF, CON.IDPESSOA, '                             + #13 +
   '  CON.CODFORMAPAG, CON.PORTFORMAPAG, CON.PORTFORMAREC, CON.IDCBANCARIA, '                + #13 +
   '  TIP.IDTIPOCONTREMPTMO, IRC.ITEDESCRICAO, SIT.FLGINTERNO, '                             + #13 +
   '  TSE.FLGATUALSALDOENV, TSE.IDREGRAENVIOPARC, CON.IDTIPOSUSPEMPTMO '                     + #13 +

   'FROM '                                                                                   + #13 +
   '  HISTMOVEMPTMO   HME, '                                                                 + #13 +
   '  CONTRATOEMPTMO  CON, '                                                                 + #13 +
   '  PARTPREVPLAN    PPP, '                                                                 + #13 +
   '  ITEMXTIPOCONTR  ITC, '                                                                 + #13 +
   '  TIPOCONTREMPTMO TIP, '                                                                 + #13 +
   '  ITEMEMPTMO      IRC, '                                                                 + #13 +
   '  TIPOEMPTMO      TEM, '                                                                 + #13 +
   '  SITPART         SIT, '                                                                 + #13 +
   '  TIPOSUSPEMPTMO  TSE  '                                                                 + #13 +

   'WHERE '                                                                                  + #13 +
   '       ( HME.HMEFORMACOBRANCA   = ''C'' ) '                                              + #13 +
   '   AND ( HME.FLGENVIO           = 0 ) '                                                  + #13 +
   '   AND ( HME.HMEVLREFETIVO      = 0 OR HME.HMEVLREFETIVO IS NULL ) '                       + #13 +
   '   AND ( (HME.HMECENTRALIZA     = 1) OR (HME.HMEDESTACADO  = 1) ) '                      + #13 +
   '   AND ( (HME.FLGDIVERGPEND     = 0) OR (HME.FLGDIVERGPEND IS NULL) ) '                  + #13 +
   '   AND ( (HME.FLGESTORNADO      = 0) OR (HME.FLGESTORNADO IS NULL) ) '                   + #13 +
   '   AND ( HME.IDITEMEMPTMO       > 0  ) '                                                 + #13 +
   '   AND ( HME.HMETIPOMOV         <> 5  ) '                                                + #13 +
   '   AND ( HME.FLGABONADO         IS NULL OR HME.FLGABONADO = 0 ) '                        + #13 +
   '   AND ( HME.FLGQUITADO         IS NULL OR HME.FLGQUITADO = 0 ) '                        + #13 +
   '   AND ( HME.FLGBAIXADO         = 0 ) '                                                  + #13 +
   '   AND ( CON.FLGSITUACAO        IN (''A'', ''E'', ''K'', ''Q'') ) '                      + #13 +
   '   AND ( HME.CODDOCUMENTO       IS NULL ) '                                              + #13 +
   '   AND ( HME.FLGSUSPENSAO       IS NULL ) '                                              + #13 +
   '   AND ( CON.IDCONTRATOEMPTMO   = ' + FloatToStr(iIDContratoEmptmo) + ' ) '                + #13 +
   '   AND ( TEM.IDEMPRESAPROP      = ' + IntToStr(Sistema.IDEmpresa) + ' ) '                + #13 +
   '   AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO  ) '                              + #13 +
   '   AND ( CON.IDTIPOCONTREMPTMO  = TIP.IDTIPOCONTREMPTMO ) '                              + #13 +
   '   AND ( TIP.IDTIPOEMPTMO       = TEM.IDTIPOEMPTMO ) '                                   + #13 +
   '   AND ( CON.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO ) '                              + #13 +
   '   AND ( ITC.IDITEMEMPTMO       = IRC.IDITEMEMPTMO ) '                                   + #13 +
   '   AND ( ITC.IDITEMEMPTMO       = HME.IDITEMEMPTMO ) '                                   + #13 +
   '   AND ( CON.IDPESSOA           = PPP.IDPESSOA ) '                                       + #13 +
   '   AND ( CON.IDPATRO            = PPP.IDPESSJUR ) '                                      + #13 +
   '   AND ( CON.IDTIPOSUSPEMPTMO   = TSE.IDTIPOSUSPEMPTMO(+) ) '                            + #13 +
   '   AND ( PPP.IDSITPART          = SIT.IDSITPART ) '                                      + #13 +

   '   AND PPP.FLGDESATIVADO        = 0 '                                                    + #13 +

   'ORDER BY CON.IDCONTRATOEMPTMO, HME.HMEPARCELA, HME.HMEDATAVENCTO '                       + #13;

   try
      iPlanilha := 0;

      // prepara o Histórico-padrão que será passado adiante
      sMensagem  := 'Emprestimo, ref: ' + FormatDateTime('MM/YYYY', edtDataAlteracao.Date) + ', Contrato: ' + FloatToStr(iIDContratoEmptmo) ; // SOL 195538 KTN 1917765 Otacilio

      IntegraEmptmo.EnviaCAPCAR(sSQL,
                                sMensagem,
                                SysDate,
                                -1,
                                Modulo.iMoedaCorrente,
                                Modulo.sCentroCusto,
                                Modulo.iPrograma,
                                iPlanilha,
                                sResult,
                                sErro
                                );

   finally

   end;
end;


procedure TfrmExecAlteraConcessao.btnAlteraMargemClick(Sender: TObject);
begin
   inherited;

   edtVlrMargem.Enabled  := True;
   edtVlrMargem.ReadOnly := False;
   edtVlrMargem.Color    := clWindow;
   edtVlrMargem.SetFocus;
end;


procedure TfrmExecAlteraConcessao.edtVlrMargemExit(Sender: TObject);
begin
   inherited;

   edtVlrMargem.ReadOnly := True;
   edtVlrMargem.Color    := clBtnFace;
end;


//Pendência 22953 - 01/08/2006 - Alberto
procedure TfrmExecAlteraConcessao.btnAlteraMaximoClick(Sender: TObject);
begin
  inherited;

  edtMaximo.Enabled  := True;
  edtMaximo.ReadOnly := False;
  edtMaximo.Color    := clWindow;
  edtMaximo.SetFocus;
end;


procedure TfrmExecAlteraConcessao.edtMaximoExit(Sender: TObject);
begin
  inherited;

  edtMaximo.ReadOnly := True;
  edtMaximo.Color    := clBtnFace;
end;
//Fim Pendência 22953


procedure TfrmExecAlteraConcessao.FormCreate(Sender: TObject);
begin
   inherited;

   // André Pontes - 03/06/2005 - pendência 19404
   Contab := TCtrlContab.Create;
   Contab.Initialize(dtmBaseDados.dbBaseDados,
                     True,
                     Sistema.ConnectionType,
                     Sistema.ConnectionSide,
                     Sistema.AppRemoteServer,
                     True
                    );

   Contab.OpenTransaction := False;
   // FIM André Pontes - 03/06/2005 - pendência 19404

   ParametrosSistema;

   sFiltroContEmp := dtmMS.MS_ContratoEmptmo.Filtro.Text;

   // Faz o MontaSelect mostrar, somente os Contratos que estao pendentes de quitação
   bRepeteConsulta                  := dtmMS.MS_ContratoEmptmo.RepeteConsulta;
   dtmMS.MS_ContratoEmptmo.Filtro.Add('CON.FLGSITUACAO IN (''A'')');

   vDividasAnteriores := nil;   
end;



procedure TfrmExecAlteraConcessao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Contab.Free;   // André Pontes - 03/06/2005 - pendência 19404
   UFuncoesEmptmo.bBuscaMutuario := false;
   dtmMS.MS_ContratoEmptmo.Filtro.Clear;

   dtmMS.MS_ContratoEmptmo.Filtro.Text    := sFiltroContEmp;
   dtmMS.MS_ContratoEmptmo.RepeteConsulta := bRepeteConsulta;

   dtmEmptmo.qryDadosContrato.Close;

   inherited;
end;



function TfrmExecAlteraConcessao.ExisteAlteracaoAnterior: Boolean;
begin
   Result := True;

   with qryAlteracaoAnterior do
   begin
      LimpaParametros(qryAlteracaoAnterior);
      ParamByName('PIDCONTRATOEMPTMO').AsFloat := dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat;

      Result := qryAlteracaoAnteriorQUANT.AsInteger > 0;

      Close;
   end;
end;



procedure TfrmExecAlteraConcessao.DBgrdHistMovVirtualCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;
   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then
   begin
      if not(Highlight) then
      begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
         begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end
         else
         begin
            ABrush.Color := clWindow;
         end;
      end;
   end
   else
   begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmExecAlteraConcessao.DBgrdHistMovVirtualTopRowChanged(Sender: TObject);
begin
   inherited;
   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;



end.
