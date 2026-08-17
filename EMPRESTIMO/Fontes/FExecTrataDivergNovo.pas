{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
//-------------------------------------------------------------------------------
Pendência   : SIG TIBERO
Responsável : Everson Cunha
Data        : 25/10/2018
Descrição   : Alteração no Owner da tabela CONTRATOAD
--------------------------------------------------------------------------------
Pendência   : SOL 143413 Kintana 938370
Responsável : Fanuel Junior
Data        : 05/11/2010
Descrição   : Bloquear usuario que for mutuario do contrato com a variavel
'bBuscaMutuario'.
--------------------------------------------------------------------------------
//Pendência   : SOL 145265 Kintana 970791
//Responsável : Renato Visoni
//Descrição   : Participantes que cancelaram seus planos previdenciários não estão
// Tendo suas prestações inadimplentes tratadas pelo tratamento de divergências
//--------------------------------------------------------------------------------
//Pendência   : SOL 145176 KINTANA 967827
//Responsável : Fanuel Marinho
//Data        : 08/10/2010                                        
//Descrição   : Tratado o DateTimePicker edtDataVencto e edtDataLancto
//--------------------------------------------------------------------------------
//Pendência   : SOL 133024 KINTANA 771123
//Responsável : BRUNO AZEVEDO
//Data        : 26/03/2010
//Descrição   : Tratado o campo FLGDESATIVADO na query.
//--------------------------------------------------------------------------------
//**************************************************************************************
//Rotina: Exec_SP_Preparo
//Nº SOL: 130879
//Nº KINTANA: 738508
//Data da Alteração: 12/02/2010
//Responsável: Ádler Souza
//Descrição: Incluir filtro de ANOMESCOBRANCA e ANOMESCOMPETENCIA na SP_PREPARADIVERGENCIA.
//**************************************************************************************
Pendência   : SOL 126361 KINTANA 660267
Responsável : Jéssica Lana
Data        : 30/10/2009
Descrição   : Incluir filtro de Tipo de Contrato e Contrato sendo os dois opcionais
--------------------------------------------------------------------------------
Pendência   : SOL 124889 KINTANA 638776
Responsável : Daniel Begnami
Data        : 08/10/2009
Descrição   : Incluir filtro de Tipo de Contrato e Contrato sendo os dois opcionais
--------------------------------------------------------------------------------
Pendência   : SOL 114575 KINTANA 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
--------------------------------------------------------------------------------
===============================================================================================
T R A T A M E N T O    DE    D I V E R G E N C I A
-----------------------------------------------------------------------------------------------

 Rotina    : Tratamento de divergencias
 Data      : 21/11/2008
 Autor     : Daniel Begnami
 Pendência : 92334_394810
 Descrição : O Tratamento será feito com o uso de uma tabela auxiliar.

-----------------------------------------------------------------------------------------------
DESCRIÇÃO DE FLG´S DAS TABELAS:  -   NOVO TRATAMENTO DE DIVERGENCIA
-----------------------------------------------------------------------------------------------
TABELA: PREPARAHISTMOVEMPTMO
  |CAMPOS: FLGSITREG    - 'A' - Alterado no tratamento
  |                     - 'I' - Inserido no tratamento
  |                     - ' ' - Não houve tratamento nenhum
  |
  |        FLGEFETIVADO - 'S' - Registro JA EFETIVADO
  |                     - 'N' - Registro ainda NÃO EFETIVADO
  |                     - 'T' - No momento da EFETIVAÇÃO é feito uma verificação se o Tratamento INDIVIDUAL
  |                             ja processou esse itens, caso ja tenha o feito, grava como "T" indicando que
  |                             o tratamento INDIVIDUAL ja tratou.

TABELA: HISTMOVEMPTMO
  |CAMPOS: FLGUSO - ' ' - Não esta em uso.
  |               - 'S' - Esta em uso para tratamento na tabela PREPARAHISTMOVMEMPTMO
                  - 'T' - Indica que o item ja foi tratado pelo Tratamento INDIVIDUAL

===============================================================================================









--------------------------------------------------------------------------------
Pendência   : 27370
Responsável : Daniel Simões
Data        : 11/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
Rotina    : Diversas
Data      : 19/07/2007
Autor     : Marchetti
Pendência : 25740
Descrição : Criação da nova estrutura de query e processamento de registros.
--------------------------------------------------------------------------------
Rotina    : qryHistMov
Data      : 05/07/2007
Autor     : Marchetti
Pendência : 25740
Descrição : Ativada leitura unidirecional para evitar erro Temporary table
            resource limit.
--------------------------------------------------------------------------------
Rotina    : AtualizaVencimento e TrataDivergencia
Data      : 26/09/2005
Autor     : Marchetti
Pendência : 20031
Descrição : Conforme parametrização nos parâmetros do Sistema, o tratamento de
            divergências irá ou não estornar os documentos do CaP/CaR.
--------------------------------------------------------------------------------
Rotina    : btnContinuaSelecaoClick
Data      : 14/06/205
Autor     : André Pontes
Pendência : 19437
Descrição : Filtro por arquivo (IDContratoEmptmo na tabela ContratoAD)
--------------------------------------------------------------------------------
Rotina    : Várias (VerificaPreenchimento e declarações em outros lugares)
Data      : 03/06/2005
Autor     : André Pontes
Pendência : 19404
Descrição : Bloqueio de lançamento e contabilização / estorno / exclusão de
            acordo com parâmetro contábil por módulo + TestaPeríodo.
--------------------------------------------------------------------------------
Rotina    : Contabiliza
Data      : 17/05/2005
Autor     : André Pontes
Pendencia : 19264
Descrição : '  AND NVL(ITC.FLGNAOCONTAB, 0)  = 0 '
--------------------------------------------------------------------------------
Rotina    : TrataDivergencia
Data      : 16/03/2004
Autor     : Marchetti
Pendência :
Descrição : Estorno do documento caso o envio tenha sido para o Financeiro
--------------------------------------------------------------------------------
Rotina    : TrataDivergencia, ExecutaAbono, AtualizaVencimento, btnConfirmaClick
Data      : 04/08/2003
Autor     : Marchetti
Pendência : 14530
Descrição : Commit de transação por contrato + parcela, para evitar perda de
            registros já processados.
--------------------------------------------------------------------------------
Rotina    : Contabiliza
Data      : 13/02/2003
Autor     : André Pontes
Descrição : Seleção dos itens a contabilizar passa a obedecer aos mesmos filtros
            definidos para o Tratamento.
--------------------------------------------------------------------------------
Rotina    : -
Data      : 13/02/2003
Autor     : André Pontes
Descrição : Exibição no "resultado" apenas dos itens calculados (exibia os itens
            calculados E os itens originais tratados);
--------------------------------------------------------------------------------
Rotina    : btnContinuaSelecaoClick
Data      : 22/11/2002
Autor     : André Pontes
Descrição : Correção do filtro por itens que não serão recebidos
            (6 - chkNaoSeraoPagos)
--------------------------------------------------------------------------------
Rotina    : TrataDivergência (* Atualiza tabela de histórico *)
Data      : 06/11/2002
Autor     : Marchetti
Descrição : Tratamento de divergência de valores que não serão recebidos.
--------------------------------------------------------------------------------
Rotina    : TrataDivergência (* Atualiza tabela de histórico *)
Data      : 10/10/2002
Autor     : André Pontes
Descrição : FLGENVIO = 0 (estava FLGENVIO = NULL)
--------------------------------------------------------------------------------
Rotina    : -
Data      : 09/10/2002
Autor     : Marchetti
Descrição : Mostrado na grid de itens divergentes a suspensão de cobrança, caso
            haja cadastro.
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FExecTrataDivergNovo;

(*

  Tipo de Divergência:
  1 - Valores não recebidos
  2 - Recebimentos Inesperados
  3 - Valores recebidos a menor
  4 - Valores recebidos a maior
  5 - Divergência de datas
  6 - Valores que não serão recebidos

*)

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   IvDictio, IvMulti, IvEMulti, ComCtrls, StdCtrls, MAHlpBtn,
   Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, Db, Wwdatsrc, DBTables,
   Wwquery, wwdbdatetimepicker, CMDateTimePicker, TREdit, Mask, DBCtrls,
   Grids, Wwdbigrd, Wwdbgrid, fcButton, fcImgBtn, fcShapeBtn, wwdblook,
   FSairAjudaImob, MontaSelect, DBGrids, mContratoEmptmo,
   wwdbedit, Wwdbspin, uTypesEmptmo, mMutuario,
   uCtrlContab, uCtrlPadroes, Provider, DBClient, uCMClientDataSet,
  wwstorep;

type
   TfrmExecTrataDivergNovo = class(TfrmSairAjudaImob)
      ntbPrincipal: TNotebook;
      btnContinuaSelecao: TfcShapeBtn;
      Panel4: TPanel;
      btnCancelaAltera: TfcShapeBtn;
      qry: TwwQuery;
      qryINSCRICAO: TFloatField;
      qryINSCRICAONUMERO: TFloatField;
      qryDESCSITCONTRATO: TStringField;
      qryIDSITPART: TFloatField;
      qrySITUACAO: TStringField;
      qryFLGINTERNO: TStringField;
      qryPLANOPREV: TStringField;
      qryPATRO: TStringField;
      qryMATRICULA: TStringField;
      qryTITULAR: TStringField;
      qryBENEFICIARIO: TStringField;
      qryDESCTIPOEMPTMO: TStringField;
      qryDATAINSC: TDateTimeField;
      qryBANCO: TStringField;
      qryCONTACORRENTE: TStringField;
      qryNUMAGENCIA: TStringField;
      qryIDCONTRQUITACAO: TFloatField;
      qryIDPESSOA: TFloatField;
      qryIDPLANOPREV: TFloatField;
      qryIDPATRO: TFloatField;
      qryIDVERBA: TFloatField;
      qryIDBENEF: TFloatField;
      qryCODFORMAPAG: TFloatField;
      qryPORTFORMAPAG: TFloatField;
      qryPORTFORMAREC: TFloatField;
      qryNUMPARCELAS: TFloatField;
      qryDATACREDITO: TDateTimeField;
      qryDATASITUACAO: TDateTimeField;
      qryDATAASSINATURA: TDateTimeField;
      qryDATAPRIMPARC: TDateTimeField;
      qryDATACANC: TDateTimeField;
      qryVLRCONTRATO: TFloatField;
      qryVLRPARCELA: TFloatField;
      qryTXJUROS: TFloatField;
      qryFLGSITUACAO: TStringField;
      qryFLGFORMAREC: TStringField;
      qryFLGFORMAPAG: TStringField;
      qryTCEDESCRICAO: TStringField;
      qryIDCONTRATOEMPTMO: TFloatField;
      qryIDTIPOEMPTMO: TFloatField;
      dts: TwwDataSource;
      dtsHistMovVirtual: TwwDataSource;
      qryHistMovVirtual: TwwQuery;
      DBrdgDebito: TRadioGroup;
      pnlCAR: TPanel;
      Label30: TLabel;
      DBcboFormaRecebimento: TwwDBLookupCombo;
      qryHistMov: TwwQuery;
      dtsHistMov: TwwDataSource;
      updHistMovVirtual: TUpdateSQL;
      lblTitulo: TfcLabel;
      qryIDINSCRICAOEMPTMO: TFloatField;
      qryIDTIPOCONTREMPTMO: TFloatField;
      Label5: TLabel;
      DBcboTipoContrato: TwwDBLookupCombo;
      DBcboPatro: TwwDBLookupCombo;
      Label1: TLabel;
      qryAux: TwwQuery;
      qryHistMovVirtualITEDESCRICAO: TStringField;
      qryHistMovVirtualEVENTO: TStringField;
      qryHistMovVirtualANOMES: TStringField;
      qryHistMovVirtualHMEANOCOMPETENCIA: TFloatField;
      qryHistMovVirtualHMEMESCOMPETENCIA: TFloatField;
      qryHistMovVirtualHMESEQCOBRANCA: TFloatField;
      qryHistMovVirtualHMETIPOMOV: TFloatField;
      qryHistMovVirtualIDCONTRATOEMPTMO: TFloatField;
      qryHistMovVirtualIDITEMEMPTMO: TFloatField;
      qryHistMovVirtualHMEDATAPREVISTA: TDateTimeField;
      qryHistMovVirtualHMEVLRPREVISTO: TFloatField;
      qryHistMovVirtualHMESALDODEV: TFloatField;
      qryHistMovVirtualHMETXJUROS: TFloatField;
      qryHistMovVirtualHMEPARCELA: TFloatField;
      molContratoEmptmo: TmolContratoEmptmo;
      Label7: TLabel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      DBcboPlano: TwwDBLookupCombo;
      Label8: TLabel;
      DBgrdHistMovVirtual: TwwDBGrid;
      DBgrdHistMov: TwwDBGrid;
      Panel1: TPanel;
      btnInverteSelecao: TBitBtn;
      btnMarcaTodos: TBitBtn;
      fcShapeBtn1: TfcShapeBtn;
      qryMOECODIGO: TFloatField;
      qryVLRSALBASE: TFloatField;
      qryVLRMARGEM: TFloatField;
      qryVLRMAXPERMIT: TFloatField;
      Panel2: TPanel;
      Label3: TLabel;
      dbspAnoCob: TwwDBSpinEdit;
      cboMesCobranca: TComboBox;
      Panel5: TPanel;
      Label4: TLabel;
      dbspAnoComp: TwwDBSpinEdit;
      cboMesCompet: TComboBox;
      chkCobranca: TCheckBox;
      chkCompetencia: TCheckBox;
      grpCompetencia: TGroupBox;
      Label15: TLabel;
      Label2: TLabel;
      DBspnAno: TwwDBSpinEdit;
      cboMes: TComboBox;
      edtDataVencto: TwwDBDateTimePicker;
      qryMOESIGLA: TStringField;
      GroupBox1: TGroupBox;
      chkRecebInesperado: TCheckBox;
      chkRecebidoMenor: TCheckBox;
      chkRecebidoMaior: TCheckBox;
      chkDivergData: TCheckBox;
      chkValorEmAberto: TCheckBox;
      rgOpcoes: TRadioGroup;
      chkTodos: TCheckBox;
      qryMOECODIGO_1: TFloatField;
      qryIDTIPOSUSPEMPTMO: TFloatField;
      qryDATAINICIOSUSP: TDateTimeField;
      qryDATAFIMSUSP: TDateTimeField;
      qryANOSUSPENSAO: TFloatField;
      qryMESSUSPENSAO: TFloatField;
      qryTSEDESCRICAO: TStringField;
      chkNaoSeraoPagos: TCheckBox;
      Label6: TLabel;
      edtDataLancto: TwwDBDateTimePicker;
      chkNAOContabiliza: TCheckBox;
      chkNAOGera: TCheckBox;
      qryIDCBANCARIADEB: TFloatField;
      qryIDCBANCARIA: TFloatField;
      qryIDPLANOORIGEM: TFloatField;
      bbtnParcela: TBitBtn;
      bbtnEncargos: TBitBtn;
      chkMarcaDivergentes: TCheckBox;
      molMutuario: TmolMutuario;
      chkInArquivo: TCheckBox;
      chkNotInArquivo: TCheckBox;
      btnContinuaEncerra: TfcShapeBtn;
      btnConfirmar: TfcShapeBtn;
      lblQuantItens: TLabel;
      chkNaoCommit: TCheckBox;
      chkParcDifer: TCheckBox;
      cdsHistMov: TCMClientDataSet;
      prvHistMov: TDataSetProvider;
      btnPrestacaoNao: TBitBtn;
      btnPrestacaoSim: TBitBtn;
      cdsHistMovFLGESCOLHA: TFloatField;
      cdsHistMovIDCONTRATOEMPTMO: TFloatField;
      cdsHistMovCONCAT_PARCELAS: TStringField;
      cdsHistMovMATRICULA: TStringField;
      cdsHistMovHMEVLRPREVISTO: TFloatField;
      cdsHistMovHMEVLREFETIVO: TFloatField;
      cdsHistMovHMEPARCELA: TFloatField;
      qryItens: TwwQuery;
      qryItensIDITEMEMPTMO: TFloatField;
      qryItensHMETIPOMOV: TFloatField;
      qryItensHMEORIGEM: TFloatField;
      qryItensHMEPARCELA: TFloatField;
      qryItensHMENUMPARCELAS: TFloatField;
      qryItensHMECENTRALIZA: TFloatField;
      qryItensHMEDESTACADO: TFloatField;
      qryItensHMEDATA: TDateTimeField;
      qryItensHMEDATAPREVISTA: TDateTimeField;
      qryItensHMEDATAEFETIVA: TDateTimeField;
      qryItensHMEDATAATUALIZA: TDateTimeField;
      qryItensHMEDATAVENCTO: TDateTimeField;
      qryItensHMEANOCOMPETENCIA: TFloatField;
      qryItensHMEMESCOMPETENCIA: TFloatField;
      qryItensHMEANOCOBRANCA: TFloatField;
      qryItensHMEMESCOBRANCA: TFloatField;
      qryItensHMEVLRPREVISTO: TFloatField;
      qryItensHMEVLREFETIVO: TFloatField;
      qryItensHMESALDODEV: TFloatField;
      qryItensHMETXJUROS: TFloatField;
      qryItensHMEFORMACOBRANCA: TStringField;
      qryItensFLGENVIO: TFloatField;
      qryItensFLGBAIXADO: TFloatField;
      qryItensFLGESTORNADO: TFloatField;
      qryItensFLGQUITADO: TFloatField;
      qryItensFLGABONADO: TFloatField;
      qryItensFLGDIVERGPEND: TFloatField;
      qryItensITEDESCRICAO: TStringField;
      qryItensIDHISTMOVEMPTMO: TFloatField;
      qryItensFLGSUSPENSAO: TFloatField;
      qryItensORDENACAO: TFloatField;
      qryItensHMEPARCELAALT: TFloatField;
      qryItensFLGTIPODIVERG: TFloatField;
      qryItensCODDOCUMENTO: TFloatField;
      qryItensPLNCODIGO: TFloatField;
      qryItensPLNCODIGOESTORNO: TFloatField;
      qryItensHMESEQCOBRANCA: TFloatField;
      qryItensIDITEMCENTRALIZA: TFloatField;
      qryItensHMEPRIORIDADE: TFloatField;
      qryItensHMERECPAG: TStringField;
      qryItensIDREGRA: TFloatField;
      qryItensIDRUBRICA: TFloatField;
      SP_EFETIVA: TStoredProc;
      btEfetiva: TButton;

      procedure btnContinuaSelecaoClick(Sender: TObject);
      procedure btnCancelaAlteraClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure DBrdgDebitoClick(Sender: TObject);
      procedure DBgrdVlrAtualizadosCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      procedure DBgrdVlrAtualizadosTopRowChanged(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure btnInverteSelecaoClick(Sender: TObject);
      procedure btnMarcaTodosClick(Sender: TObject);
      procedure molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
      procedure molContratoEmptmobtnLimpaContratoClick(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure DBcboTipoEmptmoExit(Sender: TObject);
      procedure btnContinuaEncerraClick(Sender: TObject);
      procedure btnConfirmarClick(Sender: TObject);
      procedure fcShapeBtn1Click(Sender: TObject);
      procedure cboMesExit(Sender: TObject);
      procedure DBgrdHistMovVirtualCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      procedure molMutuariobtnLimpaPartClick(Sender: TObject);
      procedure molMutuariobtnBuscaPartClick(Sender: TObject);
      procedure bbtnParcelaClick(Sender: TObject);
      procedure bbtnEncargosClick(Sender: TObject);
      procedure btnPrestacaoSimClick(Sender: TObject);
      procedure btnPrestacaoNaoClick(Sender: TObject);
    procedure btEfetivaClick(Sender: TObject);


   private  // Private declarations

      sArq                 : String;

      Contab               : TCtrlContab;   // André Pontes - 03/06/2005 - pendência 19404

      rContrato            : TDadosContrato;
      vLista               : TListaItem;
      sNovaFormaCobranca   : String;
      sNovaDataCobranca    : String;
      sNovoMesCobranca     : String;
      sNovoAnoCobranca     : String;

      bAtualizouDiverg     : Boolean;

      iPais                : Integer;
      sEstado              : String;
      iCidade              : Integer;

      procedure Sel(i: Extended);

      procedure AbreQueriesDebito;
      procedure AbreQueries;

      procedure HabilitaBotoes;
      procedure DesabilitaBotoes;
      procedure PreencheTabelaVirtual;

      function Contabiliza: Integer;

      function VerificaBaixa: Boolean;
      function VerificaPreenchimento: Boolean;
      function PegaAnoMes: String;

      procedure ExecutaAbono;
      procedure TrataDivergencia;
      procedure AtualizaVencimento;


      procedure InsereDiferencaHist(qryLocal:TwwQuery; fSaldoAReceber : Currency);

      procedure MarcaNaoRecebidosComoDivergentes(const sAnoMesDiverg: String);

      procedure MontaQuery;
      procedure AbreItens(const iContrato : Extended; iParcela : Integer; bTodos : Boolean);

      function PendenteEfetivacao : boolean; // 92334 Daniel Begnami

      function Exec_SP_Preparo(pAnoMes, pAnoMesCobra, pAnoMesComp : String ; pCargaIN, pCargaNOTIN : Integer ; sIDContrato : String ; iIDTipoContrato : Integer) : Boolean;  // 92334 Daniel Begnami
      function Exec_SP_Efetiva : Boolean;  // 92334 Daniel Begnami

   public   // Public declarations


   end;



var
  frmExecTrataDivergNovo: TfrmExecTrataDivergNovo;



implementation
{$R *.DFM}
uses
   UFuncoesEmptmo, (* LimpaParametros, AtualizaConjunto *)
   UMensErro,      (* MsgDlg *)
   USistema,       (* Sistema *)
   UIntegraEmptmo, (* IntegraEmptmo *)
   dEmptmo,        (* qryParamEmptmo *)
   DLookEmptmo,    (* qryLookPortadorFormaR *)
   FProgresso,     (* FrmProgresso *)
   UDocumento,     (* Rotinas do CAPCAR *)
   uDiasUteis,
   DBaseDados,
   UCalcEmptmo,
   uDataBase,
   uVerificaPreenchimento,
   uLancContab,
   fAguarde, dMS, DDividaEP;



function TfrmExecTrataDivergNovo.PegaAnoMes: String;
var
   dData : TDateTime;
begin
   inherited;

   dData    := EncodeDate(word(trunc(DBspnAno.Value)), (cboMes.ItemIndex + 1), 1);
   Result   := FormatDateTime('YYYYMM', dData);
end;



procedure TfrmExecTrataDivergNovo.FormCreate(Sender: TObject);
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

   ntbPrincipal.PageIndex  := 0;
end;



procedure TfrmExecTrataDivergNovo.HabilitaBotoes;
begin
   btnContinuaEncerra.Enabled := True;
   btnCancelaAltera.Enabled   := True;
   btnConfirmar.Enabled       := True;
   bbtnAjuda.Enabled          := True;
   bbtnSair.Enabled           := True;

   ntbPrincipal.Enabled       := True;
   Screen.Cursor              := crDefault;
end;



procedure TfrmExecTrataDivergNovo.DesabilitaBotoes;
begin
   Screen.Cursor              := crHourGlass;
   ntbPrincipal.Enabled       := False;

   btnContinuaEncerra.Enabled := False;
   btnCancelaAltera.Enabled   := False;
   btnConfirmar.Enabled       := False;
   bbtnAjuda.Enabled          := False;
   bbtnSair.Enabled           := False;
end;



procedure TfrmExecTrataDivergNovo.Sel(i: Extended);
begin
   // abre a query principal com os parâmetros passados
   with qry do
   begin
      LimpaParametros(qry);
      ParamByName('PIDCONTRATOEMPTMO').AsFloat := i;
      Open;
   end;
end;



procedure TfrmExecTrataDivergNovo.AbreQueriesDebito;
begin
   // Procedure que abre as queries utilizadas quando o Débito do Empréstimo será pelo CAR
   with dtmLookEmptmo.qryLookPortadorFormaR do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookPortadorFormaR);
      ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      Open;
   end;
end;



procedure TfrmExecTrataDivergNovo.AbreQueries;
begin
   // Tipo de Empréstimo
   with dtmLookEmptmo.qryLookTipoEmptmo do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoEmptmo);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
   end;

   // Patrocinadora
   LimpaParametros(dtmLookEmptmo.qryLookPatro);
   dtmLookEmptmo.qryLookPatro.Open;

   // Plano
   LimpaParametros(dtmLookEmptmo.qryLookPlanPrev);
   dtmLookEmptmo.qryLookPlanPrev.Open;
end;



function TfrmExecTrataDivergNovo.VerificaBaixa: Boolean;
var
   sSQL              : String;
   qryAux            : TwwQuery;
   fSaldo            : Real;
   fSaldoOutraMoeda  : Real;
begin
   // Cria a Query Auxiliar
   qryAux := TwwQuery.Create(Application);
   qryAux.DatabaseName := 'BaseDados';

   sSQL :=
   'SELECT '                                                                        + #13 +
   '  HMEDATAEFETIVA, CODDOCUMENTO '                                                + #13 +
   'FROM '                                                                          + #13 +
   '  HISTMOVEMPTMO '                                                               + #13 +
   'WHERE '                                                                         + #13 +
   '      ( IDCONTRATOEMPTMO = ' + FloatToStr(rContrato.IDContratoEmptmo) + ' ) '   + #13 +
   '  AND ( HMETIPOMOV       = 0 ) '                                                + #13 +
   '  AND ( HMECENTRALIZA    = 1 )';

   qryAux.SQL.Text := sSQL;

   try
      qryAux.Open;

      if not(qryAux.FieldByName('HMEDATAEFETIVA').IsNull) then
      begin
         // Participante já recebeu o Crédito do EP, logo pode quitar o EP
         Result := True;
      end
      else
      begin
         // Participante NÃO recebeu o Crédito do EP
         Documento.Saldo.GetSaldoDoc(qryAux.FieldByName('CODDOCUMENTO').AsInteger,
                                     '',     // Data do Saldo - Saldo Atual
                                     'P',    // RecPag
                                     fSaldo,
                                     fSaldoOutraMoeda
                                    );

         if fSaldo = 0 then
         begin
            // Crédito já pago pelo contas a Pagar, logo o participante pode quitar o EP
            Result := True;
         end
         else
         begin
            // Crédito ainda NÃO foi pago pelo contas a Pagar, logo o participante não poderá quitar o EP
            Result := False;
         end;  // if Saldo

      end;(* if DataEfetiva *)

   finally
      qryAux.Free;
   end;
end;



function TfrmExecTrataDivergNovo.VerificaPreenchimento: Boolean;
var
   dData       : TDateTime;
   sDataLanc   : String;
   sMsgContab  : String;
   iEmpresa    : Integer;
   iExercicio  : Integer;
   iPeriodo    : Integer;
   dDataMes    : TDateTime;
   dDataTrata  : TDateTime;
begin
	Result := False;

	try
      // -------------------------------------------------------------------------------------------

      if ( not(chkRecebInesperado.Checked) and not(chkRecebidoMenor.Checked) and
           not(chkRecebidoMaior.Checked)   and not(chkDivergData.Checked)    and
           not(chkValorEmAberto.Checked)   and not(chkNaoSeraoPagos.Checked)
         ) then
         raise EValidacao.CreateVal('É necessário indicar pelo ao menos um tipo de divergência!', chkRecebInesperado);

      if cboMes.ItemIndex < 0 then
         raise EValidacao.CreateVal('É necessário indicar a Mês de Competência!', cboMes);

      if DBspnAno.Value < 1980 then
         raise EValidacao.CreateVal('É necessário indicar a Ano de Competência!', DBspnAno);

      // -------------------------------------------------------------------------------------------

      if length(trim(edtDataVencto.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data de Vencimento!', edtDataVencto);

      if length(trim(edtDataLancto.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data de Lançamento!', edtDataLancto);

      // -------------------------------------------------------------------------------------------

      dDataMes    := DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(Sysdate), DiasUteis.ExtraiMes(Sysdate));
      dDataTrata  := DiasUteis.UltDiaMes(trunc(DBspnAno.Value), (cboMes.ItemIndex + 1));

      if dDataTrata > dDataMes then
         if MsgDlg('O mês de competência escolhido para o Tratamento de Divergências é posterior ao ' +
                   'mês corrente!' + #13 + #13 +
                   'TODOS os itens em aberto anteriores ao mês escolhido serão considerados divergentes.' + #13 + #13 +
                   'Deseja realmente prosseguir?', 'Empréstimo', mtWarning, [mbYes, mbNo], 0) = mrNo then
            Raise EValidacao.CreateVal('Processamento abortado!', cboMes);

      // -------------------------------------------------------------------------------------------

      // -------------------------------------------------------------------------------------------
      // André Pontes - 03/06/2005 - pendência 19404
      if dtmEmptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 1 then
      begin
         // Chamada da função TestaPeríodo para verificar se pode(m) ser lançada(s) planilha(s) de
         // estorno na data de cancelamento indicada
         iEmpresa    := Sistema.idEmpresa;
         sMsgContab  := '';

         // ----------------------------------------------------------------------------------------
         dData       := edtDataLancto.Date;
         sDataLanc   := FormatDateTime('dd/mm/yyyy', dData);

         if TestaPeriodo(False, 'BaseDados', sDataLanc, '15', iExercicio, iPeriodo, iEmpresa, sMsgContab) <> 0 then
            raise EValidacao.CreateVal('Não é possível fazer o estorno contábil na data indicada:' + #13 + '"' + sMsgContab + '"', edtDataLancto);

         if not(Contab.TestaDataBloqueadaProc(iEmpresa, 15, sDataLanc)) then
         begin
            sMsgContab := Contab.MessageInfo;
            raise EValidacao.CreateVal('Não é possível fazer lançamentos para a data escolhida:' + #13 + '"' + sMsgContab + '"', edtDataLancto);
         end;
         // ----------------------------------------------------------------------------------------

         // ----------------------------------------------------------------------------------------
         dData       := EncodeDate(word(trunc(DBspnAno.Value)), (cboMes.ItemIndex + 1), 1);
         sDataLanc   := FormatDateTime('dd/mm/yyyy', dData);

         if TestaPeriodo(False, 'BaseDados', sDataLanc, '15', iExercicio, iPeriodo, iEmpresa, sMsgContab) <> 0 then
            raise EValidacao.CreateVal('Não é possível fazer o estorno contábil na data indicada:' + #13 + '"' + sMsgContab + '"', cboMes);

         if not(Contab.TestaDataBloqueadaProc(iEmpresa, 15, sDataLanc)) then
         begin
            sMsgContab := Contab.MessageInfo;
            raise EValidacao.CreateVal('Não é possível fazer lançamentos para a data escolhida:' + #13 + '"' + sMsgContab + '"', cboMes);
         end;
         // ----------------------------------------------------------------------------------------

         // ----------------------------------------------------------------------------------------
         dData       := DiasUteis.UltDiaMes(word(trunc(DBspnAno.Value)), (cboMes.ItemIndex + 1));
         sDataLanc   := FormatDateTime('dd/mm/yyyy', dData);

         if TestaPeriodo(False, 'BaseDados', sDataLanc, '15', iExercicio, iPeriodo, iEmpresa, sMsgContab) <> 0 then
            raise EValidacao.CreateVal('Não é possível fazer o estorno contábil na data indicada:' + #13 + '"' + sMsgContab + '"', cboMes);

         if not(Contab.TestaDataBloqueadaProc(iEmpresa, 15, sDataLanc)) then
         begin
            sMsgContab := Contab.MessageInfo;
            raise EValidacao.CreateVal('Não é possível fazer lançamentos para a data escolhida:' + #13 + '"' + sMsgContab + '"', cboMes);
         end;
         // ----------------------------------------------------------------------------------------
      end;
      // FIM André Pontes - 03/06/2005 - pendência 19404
      // -------------------------------------------------------------------------------------------

   except
      on ev : EValidacao do
      begin
		   if ev.Show then MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
     		Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;
   Result := True;
end;



procedure TfrmExecTrataDivergNovo.btnContinuaSelecaoClick(Sender: TObject);
var
   //Ádler Souza - SOL 130879 - KINTANA 738508
   sAnoMesDiverg,
   sAnoMesCobra,
   //Fim - Ádler Souza - SOL 130879 - KINTANA 738508
   sAnoMesComp   : String;
   // 92334 Daniel Begnami
   sCargaIN    : integer;
   sCargaNOTIN : integer;
   // Fim

   // SOL:124889 - Daniel Begnami
   sIDContrato : String;
   iIDTipoContrato : Integer;
   // FIM

begin
   inherited;

   if not(VerificaPreenchimento) then Exit;

   if not(PendenteEfetivacao) then Exit; // 92334 Daniel Begnami

   if UFuncoesEmptmo.bBuscaMutuario then
     begin
        MessageBox(handle,'O processo não poderá ser executado.'+#13#10+
                          'O usuário é o próprio mutuário do '+
                          'contrato de empréstimo!','Atenção',MB_ICONWARNING + MB_OK);
        Abort;
     end;


   // por seguranca, desmarca o checkbox de processar TODOS
   chkTodos.Checked  := False;

   sAnoMesDiverg   := FormatFloat('0000', DBspnAno.Value) + FormatFloat('00', cboMes.ItemIndex + 1);
   //Ádler Souza - SOL 130879 - KINTANA 738508
   if chkCobranca.Checked then
     sAnoMesCobra := FormatFloat('0000', dbspAnoCob.Value) + FormatFloat('00', cboMesCobranca.ItemIndex + 1);

   if chkCompetencia.Checked then
     sAnoMesComp     := FormatFloat('0000', dbspAnoComp.Value) + FormatFloat('00', cboMesCompet.ItemIndex + 1);
   //Fim - Ádler Souza - SOL 130879 - KINTANA 738508

   if not(chkNAOGera.Checked) then
   begin

      sArq := 'TrataDiverg' + '-' + FormatDateTime('yyyymmdd-hhnnss', Now) + '.log';

      if chkMarcaDivergentes.Checked then
      begin

         // 92334 Daniel Begnami
         if chkInArquivo.Checked then
           sCargaIN := 1
         else
           sCargaIN := 0;

         if chkNotInArquivo.Checked then
           sCargaNOTIN := 1
         else
           sCargaNOTIN := 0;

         // SOL:124889 - Daniel Begnami
         if molContratoEmptmo.IDContrato > 0 then
           sIDContrato     := FloatToStr(molContratoEmptmo.IDContrato)
         else
           sIDContrato     := '';

        if DBcboTipoContrato.LookupValue <> '' then
          iIDTipoContrato := StrToInt(DBcboTipoContrato.LookupValue)
        else
          iIDTipoContrato := 0;
         // FIM - SOL:124889 - Daniel Begnami


        if not Exec_SP_Preparo(sAnoMesDiverg, sAnoMesCobra, sAnoMesComp, sCargaIN, sCargaNOTIN, sIDContrato, iIDTipoContrato) then
          exit;
      end
      else
      begin
         LogToFile('Não selecionada opção MarcaDivergentes', sArq, True, True, True);
      end;

      LogToFile('Antes da abertura da query dos itens divergentes', sArq, True, True, True);

      MontaQuery;

      cdsHistMov.Close;
      cdsHistMov.Open;

      LogToFile('Após abertura da query. Registros: ' + FormatFloat('#,#0', cdsHistMov.RecordCount), sArq, True, True, True);

      if cdsHistMov.IsEmpty then
      begin
         DBgrdHistMovVirtual.Enabled := False;
      end
      else
      begin
         DBgrdHistMovVirtual.Enabled := True;
      end;

      lblQuantItens.Caption := FormatFloat('#,#0', cdsHistMov.RecordCount);

   end;  // if not(chkNAOGera.Checked)

   ntbPrincipal.PageIndex  := 1;
end;



procedure TfrmExecTrataDivergNovo.MarcaNaoRecebidosComoDivergentes(const sAnoMesDiverg: String);
var
   qryAux         : TwwQuery;
   sSQL           : String;
begin
   // Cria a Query Auxiliar
   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';

   sSQL :=
   'UPDATE '                                                               + #13 +
   '  HISTMOVEMPTMO '                                                      + #13 +
   'SET '                                                                  + #13 +
   '  FLGDIVERGPEND = 1, '                                                 + #13 +
   '  FLGTIPODIVERG = 1 '                                                  + #13 +
   'WHERE '                                                                + #13 +
   '      ( HMECENTRALIZA        = 1 OR HMEDESTACADO = 1 ) '               + #13 +
   '  AND ( HMETIPOMOV           NOT IN (0, 5, 8) ) '                      + #13;

   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '  AND IDCONTRATOEMPTMO       = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)       + #13;

   if chkInArquivo.Checked then sSQL := sSQL +
//   '  AND IDCONTRATOEMPTMO       IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) '        + #13;  //Everson Luiz - TIBERO
   '  AND IDCONTRATOEMPTMO       IN (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD) '        + #13;       //Everson Luiz - TIBERO

   if chkNotInArquivo.Checked then sSQL := sSQL +
//   '  AND IDCONTRATOEMPTMO       NOT IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) '    + #13;  //Everson Luiz - TIBERO
   '  AND IDCONTRATOEMPTMO       NOT IN (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD) '    + #13;       //Everson Luiz - TIBERO

   sSQL := sSQL +
   '  AND HMEVLREFETIVO          IS NULL '                                 + #13 +
   '  AND HMEDATAEFETIVA         IS NULL '                                 + #13 +
   '  AND FLGBAIXADO             = 0 '                                     + #13 +
   '  AND NVL(FLGDIVERGPEND, 0)  = 0 '                                     + #13 +
   '  AND NVL(FLGESTORNADO, 0)   = 0 '                                     + #13 +
   '  AND NVL(FLGABONADO, 0)     = 0 '                                     + #13 +
   '  AND NVL(FLGQUITADO, 0)     = 0 '                                     + #13 +

   '  AND (LTRIM(RTRIM(TO_CHAR(HMEANOCOBRANCA, ''0000''))) '               +
         '|| LTRIM(RTRIM(TO_CHAR(HMEMESCOBRANCA, ''00''))) ) < ' + sAnoMesDiverg;

   qryAux.Close;

   qryAux.SQL.Clear;
   qryAux.SQL.Text := sSQL;
 //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
 //qryAux.SQL.SaveToFile(Sistema.TempDir + 'EP-MarcaDivergentes.txt');
   qryAux.SQL.SaveToFile(ftempregra + '\' + 'EP-MarcaDivergentes.txt');

   try
      try
         qryAux.ExecSQL;
      except
         bAtualizouDiverg  := False;
      end;

      if molContratoEmptmo.IDContrato <= 0 then bAtualizouDiverg := True;
   finally
      qryAux.Free;
   end;
end;



function TfrmExecTrataDivergNovo.Contabiliza: Integer;
var
   sSQL           : String;
   sHistorico     : String;
   sResult, sErro : TStringList;
   iPlanilha      : Integer;
begin
   //Pendência 19929 - 26/06/2006 - Alberto Carvalho
   sErro := TStringList.Create;

   // monta o select que será passado para para a função de contabilização
   sSQL :=
   'SELECT '                                                                                 + #13 +
   '   H.IDHISTMOVEMPTMO, '                                                                  + #13 +
   '   H.IDCONTRATOEMPTMO, TC.IDTIPOCONTREMPTMO, '                                           + #13 +
   '   NVL(MIG.IDPLANOCONTATU, C.IDPLANOPREV) AS IDPLANOPREV, '                              + #13 +
   '   MIG.IDPATROATU AS IDPATRO, MIG.IDPLANOCONTATU AS IDPLANOORIGEM, '                     + #13 +
   '   H.IDITEMEMPTMO, ITE.ITEDESCRICAO, H.IDITEMCENTRALIZA, '                               + #13 +
   '   ( ' +
   '   (LTRIM(RTRIM(TO_CHAR(HMEANOCOMPETENCIA, ''0000'')))) ' +
   '   || ' +
   '   (LTRIM(RTRIM(TO_CHAR(HMEMESCOMPETENCIA, ''00'')))) ' +
   '   ) AS ANOMES, '                                                                        + #13 +

   '   H.HMEFORMACOBRANCA, '                                                                 + #13 +
   '   H.HMEVLRPREVISTO, H.HMEVLREFETIVO, '                                                  + #13 +

   '   ITC.TIPCODIGO '                                                                       + #13 +

   'FROM '                                                                                   + #13 +
   '   HISTMOVEMPTMO   H,   '                                                                + #13 +
   '  VWMIGRACONTRATOEP MIG, '                                                               + #13 +
   '   CONTRATOEMPTMO  C,   '                                                                + #13 +
   '   ITEMXTIPOCONTR  ITC, '                                                                + #13 +
   '   ITEMEMPTMO      ITE, '                                                                + #13 +
   '   TIPOCONTREMPTMO TC,  '                                                                + #13 +
   '   TIPOEMPTMO      TE   '                                                                + #13 +

   'WHERE '                                                                                  + #13 +
   '       ( TE.IDEMPRESAPROP       = ' + IntToStr(Sistema.IDEmpresa) + ' ) '                + #13;

   // ----------------------------------------------------------------------------------------------
   if molMutuario.IDBenef > 0 then sSQL := sSQL +
   '   AND ( C.IDBENEF              = ' + IntToStr(molMutuario.IDBenef) + ' ) '              + #13;

   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '   AND ( H.IDCONTRATOEMPTMO     = ' + FloatToStr(molContratoEmptmo.IDContrato) + ' ) '   + #13;

   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '   AND ( TC.IDTIPOEMPTMO        = ' + DBcboTipoEmptmo.LookupValue + ' ) '                + #13;

   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '   AND ( C.IDTIPOCONTREMPTMO    = ' + DBcboTipoContrato.LookupValue + ' ) '              + #13;

   if DBcboPatro.LookupValue <> '' then sSQL := sSQL +
   '   AND ( C.IDPATRO              = ' + DBcboPatro.LookupValue + ' ) '                     + #13;

   if DBcboPlano.LookupValue <> '' then sSQL := sSQL +
   '   AND ( C.IDPLANOPREV          = ' + DBcboPlano.LookupValue + ' ) '                     + #13;
   // ----------------------------------------------------------------------------------------------

   sSQL := sSQL +
   '   AND H.HMETIPOMOV             = 4 '                                                    + #13 +
   '   AND H.HMESEQCOBRANCA         = 1 '                                                    + #13 +
   '   AND H.HMEVLRPREVISTO        <> 0 '                                                    + #13 +

   // André Pontes - 17/05/2005 - pendência 19264
   '  AND NVL(ITC.FLGNAOCONTAB, 0)  = 0 '                                                    + #13 +

   // André Pontes - 09/08/2005
   '   AND NVL(HME.HMECENTRALIZA, 0) = 0 '                                                   + #13 +

   '   AND ( H.PLNCODIGO            IS NULL ) '                                              + #13 +

   // itens já estornados --------------------------------------------------------------------------
   '   AND ( '                                                                               + #13 +
   '       ( H.FLGESTORNADO         = 0 OR H.FLGESTORNADO IS NULL ) OR '                     + #13 +
   '       ( H.FLGESTORNADO         = 1 AND H.PLNCODIGOESTORNO IS NOT NULL ) '               + #13 +
   '       ) '                                                                               + #13 +
   // ----------------------------------------------------------------------------------------------

   // itens abonados -------------------------------------------------------------------------------
   '   AND ( '                                                                               + #13 +
   '       ( H.FLGABONADO           = 0 OR H.FLGABONADO IS NULL ) OR '                       + #13 +
   '       ( H.FLGABONADO           = 1 AND H.PLNCODIGOESTORNO IS NOT NULL ) '               + #13 +
   '       ) '                                                                               + #13 +
   // ----------------------------------------------------------------------------------------------

   '   AND (((LTRIM(RTRIM(TO_CHAR(H.HMEANOCOMPETENCIA, ''0000'')))) || ' +
            '(LTRIM(RTRIM(TO_CHAR(H.HMEMESCOMPETENCIA, ''00''))))) = ' + QuotedStr(PegaAnoMes) + ' ) ' + #13 +

   '   AND ( H.IDCONTRATOEMPTMO     = C.IDCONTRATOEMPTMO ) '                                 + #13 +
   '   AND ( C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO ) '                               + #13 +
   '   AND ( TC.IDTIPOEMPTMO        = TE.IDTIPOEMPTMO ) '                                    + #13 +
   '   AND ( C.IDTIPOCONTREMPTMO    = ITC.IDTIPOCONTREMPTMO ) '                              + #13 +
   '   AND ( H.IDITEMEMPTMO         = ITC.IDITEMEMPTMO ) '                                   + #13 +
   '   AND ( ITC.IDITEMEMPTMO       = ITE.IDITEMEMPTMO ) '                                   + #13 +
   '   AND ( H.IDITEMEMPTMO         = ITE.IDITEMEMPTMO ) '                                   + #13 +
   '   AND ( ITC.IDTIPOCONTREMPTMO  = TC.IDTIPOCONTREMPTMO ) '                               + #13 +

   //Pendência 23255 - 09/10/2006 - Alberto
   '   AND MIG.IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO '                                       + #13 +
   '   AND MIG.DATAMIGRA        = (select max(DATAMIGRA) '                                   + #13 +
   '                               from   VWMIGRACONTRATOEP '                                + #13 +
   '                               where  IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO '            + #13 +
   '                               and    DATAMIGRA <= H.HMEDATAPREVISTA) '                  + #13 +
   //Fim Pendência 23255

   'ORDER BY '                                                                               + #13 +
   '   HMEPARCELA, H.IDCONTRATOEMPTMO ';


   sHistorico  := 'EMPRESTIMOS DE PARTICIPANTES - Atualizacao Encargos, ref: ' + FormatDateTime('dd/mm/yyyy', Sysdate);

   // ----------------------------------------------------------------------------------------------

   Result := IntegraEmptmo.ContabilizaItens('C',
                                            'N',
                                            sSQL,
                                            sHistorico,
                                            edtDataLancto.Date,
                                            sResult,
                                            sErro,
                                            iPlanilha
                                           );

   // ----------------------------------------------------------------------------------------------

   //Pendência 19929 - 26/06/2006 - Alberto Carvalho
   sErro.Free;
end;




procedure TfrmExecTrataDivergNovo.btnCancelaAlteraClick(Sender: TObject);
begin
   inherited;

   (* Confirma transação *)
   if dtmBaseDados.dbBaseDados.InTransaction then RollBackTransacao;


   cdsHistMov.Close;
   frmAguarde.Apaga;

   ntbPrincipal.PageIndex  := 0;
end;



procedure TfrmExecTrataDivergNovo.DBrdgDebitoClick(Sender: TObject);
begin
   inherited;

   if DBrdgDebito.ItemIndex = 0 then
   begin
      AbreQueriesDebito;

      DBcboFormaRecebimento.LookupValue := dtmEmptmo.qryParamEmptmoPORTFORMARECTO.AsString;

      AtualizaConjunto(True, pnlCAR);
   end
   else
   begin
      AtualizaConjunto(False, pnlCAR);
   end;
end;



procedure TfrmExecTrataDivergNovo.DBgrdVlrAtualizadosCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;

   if cdsHistMov.IsEmpty then Exit;

   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then
   begin
      if not(Highlight) then
      begin
         // linhas ímpares = amarelo, linhas pares = branco
         if (Sender as TwwDBGrid).CalcCellRow mod 2 = 0 then
         begin
            ABrush.Color := $00C0FFFF; (* amarelo bebê *)
         end
         else // if (Sender as TwwDBGrid).CalcCellRow mod 2 = 0
         begin
            ABrush.Color := clWhite;
         end;

         // Caso Selecionado muda cor
         if cdsHistMovFLGESCOLHA.AsInteger = 1 then
         begin
            AFont.Color  := clWhite;
            ABrush.Color := clNavy;
         end;
      end;
   end
   else // if State <> [gdSelected]
   begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end; // if State <> [gdSelected]
end;



procedure TfrmExecTrataDivergNovo.DBgrdVlrAtualizadosTopRowChanged(Sender: TObject);
begin
   inherited;

   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmExecTrataDivergNovo.FormShow(Sender: TObject);
begin
   inherited;

   ParametrosSistema;

   molMutuario.Visible := False;

   if (UpperCase(Sistema.NomeEmpresa) = 'FCRT') or
      (UpperCase(Sistema.NomeEmpresa) = 'BRTPREV') then
   begin
      molMutuario.Visible     := True;
   end;

   chkInArquivo.Visible       := (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1);
   chkNotInArquivo.Visible    := (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1);

   bAtualizouDiverg           := False;

   ntbPrincipal.PageIndex     := 0;

   molMutuario.btnLimpaPartClick(Sender);
   molContratoEmptmo.btnLimpaContratoClick(Sender);

   // preenche a data de lançamento e o ano de referência/competência
   cboMes.ItemIndex           := DiasUteis.ExtraiMes(Date) - 1;
   DBspnAno.Value             := DiasUteis.ExtraiAno(Date);

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
   begin
      edtDataVencto.Date      := EncodeDate(word(trunc(DBspnAno.Value)), (cboMes.ItemIndex + 1), 20);
      edtDataLancto.Date      := EncodeDate(word(trunc(DBspnAno.Value)), (cboMes.ItemIndex + 1), 20);
   end
   else
   begin
      edtDataVencto.Date      := DiasUteis.UltDiaMes(word(trunc(DBspnAno.Value)), (cboMes.ItemIndex + 1));
      edtDataLancto.Date      := DiasUteis.UltDiaMes(word(trunc(DBspnAno.Value)), (cboMes.ItemIndex + 1));
   end;

   if Sistema.TipoCliente = 20071 then
   begin
      edtDataVencto.Date      := EncodeDate(word(trunc(DBspnAno.Value)), (cboMes.ItemIndex + 1), 25);
      edtDataLancto.Date      := EncodeDate(word(trunc(DBspnAno.Value)), (cboMes.ItemIndex + 1), 25);
   end;

   cboMesCobranca.ItemIndex   := cboMes.ItemIndex;
   cboMesCompet.ItemIndex     := cboMes.ItemIndex;
   dbspAnoCob.Value           := DBspnAno.Value;
   dbspAnoComp.Value          := DBspnAno.Value;

   iPais    := dtmEmptmo.qryParamEmptmoIDPAIS.AsInteger;
   sEstado  := dtmEmptmo.qryParamEmptmoCODESTADO.AsString;
   iCidade  := dtmEmptmo.qryParamEmptmoIDCIDADES.AsInteger;

   if dtmEmptmo.qryParamEmptmoFLGCONTABENCARGO.AsInteger = 1 then
   begin
      chkNAOContabiliza.Checked := True;
      chkNAOContabiliza.Enabled := False;
   end
   else
   begin
      chkNAOContabiliza.Enabled := True;
   end;

   AbreQueries;
end;



procedure TfrmExecTrataDivergNovo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Contab.Free;   // André Pontes - 03/06/2005 - pendência 19404
   UFuncoesEmptmo.bBuscaMutuario := false;
   dtmLookEmptmo.qryLookTipoContrato.Close;
   dtmLookEmptmo.qryLookPatro.Close;

   if chkNaoCommit.Checked then
      if dtmBaseDados.dbBaseDados.InTransaction then RollbackTransacao;

   inherited;
end;



procedure TfrmExecTrataDivergNovo.btnInverteSelecaoClick(Sender: TObject);
var
   bMostra: Boolean;
begin
   inherited;

   bMostra := False;

   if cdsHistMov.RecordCount > 100 then
   begin
      cdsHistMov.DisableControls;

      { Acerta tela de acompanhamento }
      frmAguarde.Max := cdsHistMov.RecordCount;
      frmAguarde.Pos := 0;

      frmAguarde.Mostra('Processando, Aguarde...');

      bMostra := True;
   end;

   cdsHistMov.First;
   while not(cdsHistMov.EOF) do
   begin
      cdsHistMov.Edit;
      if cdsHistMovFLGESCOLHA.AsInteger = 1 then
      begin
         cdsHistMovFLGESCOLHA.AsInteger := 0;
      end
      else
      begin
         cdsHistMovFLGESCOLHA.AsInteger := 1;
      end;

      cdsHistMov.Next;

      (* Atualiza tela de acompanhamento *)
      if bMostra then frmAguarde.Pos := frmAguarde.Pos + 1;
   end;

   if cdsHistMov.Active then cdsHistMov.First;

   cdsHistMov.EnableControls;

   if bMostra then frmAguarde.Apaga;
end;



procedure TfrmExecTrataDivergNovo.btnMarcaTodosClick(Sender: TObject);
var
   Mostra: Boolean;
begin
   inherited;

   Mostra := False;

   cdsHistMov.DisableControls;

   if cdsHistMov.RecordCount > 10 then
   begin
      // Acerta tela de acompanhamento
      frmAguarde.Max := cdsHistMov.RecordCount;
      frmAguarde.Pos := 0;

      frmAguarde.Mostra('Processando, Aguarde...');

      Mostra := True;
   end;

   cdsHistMov.First;
   while not(cdsHistMov.EOF) do
   begin
      cdsHistMov.Edit;
      cdsHistMovFLGESCOLHA.AsInteger := 1;
      cdsHistMov.Post;

      cdsHistMov.Next;

      if Mostra = True then
      begin
         // Atualiza tela de acompanhamento
         frmAguarde.Pos := frmAguarde.Pos + 1;
      end;
   end;

   if cdsHistMov.Active then cdsHistMov.First;

   cdsHistMov.EnableControls;

   if Mostra = True then frmAguarde.Apaga;
end;



procedure TfrmExecTrataDivergNovo.PreencheTabelaVirtual;
var
   i : Integer;
begin
   // Laço que varre o vetor Lista inserindo na tabela virtual TODOS os itens calculados
   for i := 0 to High(vLista) do
   begin
      // Marchetti - Pendencia 23319
      vLista[i].Observacao             := 'Tratamento de divergência efetuado por: ' + Sistema.NomeUsuario;

      if vLista[i].Valor <> 0 then
      begin
         qryHistMovVirtual.Insert;

         qryHistMovVirtualITEDESCRICAO.AsString       := vLista[i].Nome;
         qryHistMovVirtualANOMES.AsString             := FormatFloat('00', vLista[i].MesCompetencia) + '/' + FormatFloat('0000', vLista[i].AnoCompetencia);
         qryHistMovVirtualHMEANOCOMPETENCIA.AsInteger := vLista[i].AnoCompetencia;
         qryHistMovVirtualHMEMESCOMPETENCIA.AsInteger := vLista[i].MesCompetencia;
         qryHistMovVirtualHMESEQCOBRANCA.AsInteger    := vLista[i].SeqCobranca;
         qryHistMovVirtualHMETIPOMOV.AsInteger        := vLista[i].iEvento;

         case vLista[i].iEvento of
            0: qryHistMovVirtualEVENTO.AsString       := 'Concessão';
            1: qryHistMovVirtualEVENTO.AsString       := 'Parcela';
            2: qryHistMovVirtualEVENTO.AsString       := 'Amortização';
            3: qryHistMovVirtualEVENTO.AsString       := 'Quitação';
            4: qryHistMovVirtualEVENTO.AsString       := 'Atualização Débito';
         end;

         qryHistMovVirtualIDCONTRATOEMPTMO.AsFloat    := rContrato.IDContratoEmptmo;
         qryHistMovVirtualIDITEMEMPTMO.AsInteger      := vLista[i].CodigoItem;
         qryHistMovVirtualHMEDATAPREVISTA.AsDateTime  := vLista[i].DataPrevista;
         qryHistMovVirtualHMEVLRPREVISTO.AsCurrency   := vLista[i].Valor;
         qryHistMovVirtualHMESALDODEV.AsCurrency      := vLista[i].SaldoDevedor;
         qryHistMovVirtualHMETXJUROS.AsCurrency       := vLista[i].TxJuros;
         qryHistMovVirtualHMEPARCELA.AsInteger        := vLista[i].Parcela;

         qryHistMovVirtual.Post;
      end;  // if vLista[i].Valor <> 0

   end;  // for i := 0 to High(vLista)
end;



procedure TfrmExecTrataDivergNovo.molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnBuscaContratoClick(Sender);

   Repaint;

   if molContratoEmptmo.IDContrato > 0 then
   begin
      Screen.Cursor := crHourGlass;

      (* abre a query principal com o participante escolhido *)
      Sel(molContratoEmptmo.IDContrato);

      PreencheDadosContrato(qry, rContrato);

      rContrato.DataFimSusp := qryDATAFIMSUSP.AsDateTime;

      // Verifica se o Participante já recebeu o Crédito do Empréstimo
      if VerificaBaixa then
      begin
         btnContinuaSelecao.Enabled := True;
      end
      else // if VerificaBaixa
      begin
         btnContinuaSelecao.Enabled := False;
         MsgDlg('Crédito do Empréstimo NÃO efetivado.' + #13 +
                'Utilize o Cancelamento de Concessão', 'Empréstimo', mtWarning, [mbOk], 0);
         Repaint;
      end; // if VerificaBaixa

      Screen.Cursor := crDefault;

   end; // if MontaSelect.RetornouValor
end;



procedure TfrmExecTrataDivergNovo.molContratoEmptmobtnLimpaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnLimpaContratoClick(Sender);
end;



procedure TfrmExecTrataDivergNovo.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
   with dtmLookEmptmo.qryLookTipoContr do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContr);

      if DBcboTipoEmptmo.LookupValue <> '' then
      begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
         Open;

         DBcboTipoContrato.Enabled := True;
      end
      else
      begin
         DBcboTipoContrato.Enabled := False;
      end;
   end;
end;



procedure TfrmExecTrataDivergNovo.DBcboTipoEmptmoExit(Sender: TObject);
begin
   inherited;

   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
   with dtmLookEmptmo.qryLookTipoContrato do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContrato);

      if DBcboTipoEmptmo.LookupValue <> '' then
      begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
         Open;

         DBcboTipoContrato.Enabled := True;
      end
      else
      begin
         DBcboTipoContrato.Enabled := False;
      end;
   end;
end;



procedure TfrmExecTrataDivergNovo.btnContinuaEncerraClick(Sender: TObject);
begin
   inherited;

   if MsgDlg('ATENÇÃO!' + #13 + #13 + 'Não há como desfazer o Tratamento de Divergências! Deseja prosseguir?',
             'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
   begin
      Repaint;
      Exit;
   end;
   Repaint;

   if rgOpcoes.ItemIndex = -1 then
      raise EValidacao.CreateVal('É necessário indicar a opção do tratamento!', rgOpcoes);

   if not(VerificaPreenchimento) then Exit;

   LogToFile('Antes do início do tratamento, tipo: ' + IntToStr(rgOpcoes.ItemIndex), sArq, True, True, True);

   qryHistMovVirtual.Close;
   qryHistMovVirtual.Open;

   try
      DesabilitaBotoes;

      if not(chkNAOGera.Checked) then
      begin
         case rgOpcoes.ItemIndex of
            0: TrataDivergencia;
//            1: ExecutaAbono;       // 92334 Daniel Begnami
//            2: AtualizaVencimento; // 92334 Daniel Begnami
         end;
      end;

      if not Exec_SP_Efetiva then exit; // 92334 Daniel Begnami

      frmAguarde.Apaga;  // 92334 Daniel Begnami

      LogToFile('Final do tratamento, tipo: ' + IntToStr(rgOpcoes.ItemIndex), sArq, True, True, True);

      ShowMessage('Fim do processo !');  // 92334 Daniel Begnami

      ntbPrincipal.PageIndex  := 2;

   finally
      frmAguarde.Apaga;

      HabilitaBotoes;
   end;
end;



procedure TfrmExecTrataDivergNovo.btnConfirmarClick(Sender: TObject);
var
   iResultContab : Integer;
   rLogTotalPrev : TLogTotalPrev;
begin
   inherited;

   ParametrosSistema;

   try
      if not(dtmBaseDados.dbBaseDados.InTransaction) then StartTransacao;

      // -------------------------------------------------------------------------------------------
      // Log de operações
      if not(Sistema.GravaLogOperacoes('Tratamento de Divergências (calcular encargos)')) then
      begin
         Raise Exception.Create('Falha na gravação do Log da operação.');
      end;
      // -------------------------------------------------------------------------------------------


      // -------------------------------------------------------------------------------------------

      LimpaRegistroLog(rLogTotalPrev);

      rLogTotalPrev.IDModulo   := Sistema.IDModulo;
      rLogTotalPrev.IDContrato := -1;
      rLogTotalPrev.IDHistMov  := -1;
      rLogTotalPrev.Origem     := 4;
      rLogTotalPrev.Operacao   := 'Tratamento de divergências - Cálculo de Encargos';
      rLogTotalPrev.Data       := SysDate;
      rLogTotalPrev.IDUsuario  := Sistema.IdUsuario;
      rLogTotalPrev.Versao     := Sistema.Versao;

      GravaLogTotalPrev(rLogTotalPrev);

      // -------------------------------------------------------------------------------------------

      if not(chkNaoCommit.Checked) then
      if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;

   except
      Raise;
      Repaint;
   end;

   try
      DesabilitaBotoes;

      try
         if (dtmEmptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 1) and
            not(chkNAOContabiliza.Checked) then
         begin

            if not(dtmBaseDados.dbBaseDados.InTransaction) then StartTransacao;

            iResultContab := Contabiliza;


            case iResultContab of
               -2: MsgDlg('Não foram encontrados Itens a contabilizar!', 'Empréstimo', mtWarning, [mbOk], 0);
               -1: MsgDlg('Não foi possivel abrir a seleção de Itens a contabilizar!', 'Empréstimo', mtWarning, [mbOk], 0);
            end;
            Repaint;

            if not(chkNaoCommit.Checked) then
               if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;

         end;

      except
      
         if dtmBaseDados.dbBaseDados.InTransaction then RollBackTransacao;

         Raise;
         Repaint;
      end;

   finally
      EscondeEspera;
      Repaint;

      ntbPrincipal.PageIndex := 0;
      Repaint;

      HabilitaBotoes;
   end;
end;



procedure TfrmExecTrataDivergNovo.fcShapeBtn1Click(Sender: TObject);
begin
   inherited;

   (* Confirma transação *)
   if dtmBaseDados.dbBaseDados.InTransaction then RollBackTransacao;

   cdsHistMov.Close;
   cdsHistMov.Open;

   qryHistMovVirtual.Close;
   frmAguarde.Apaga;

   ntbPrincipal.PageIndex  := 1;
end;



procedure TfrmExecTrataDivergNovo.cboMesExit(Sender: TObject);
var
  sDataVenctoDia,sDataLanctoDia:string;

begin
   inherited;

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
   begin

      sDataVenctoDia := FormatDateTime('dd/mm/yyyy',edtDataVencto.Date);
      sDataVenctoDia := copy(sDataVenctoDia,1,2);

      sDataLanctoDia := FormatDateTime('dd/mm/yyyy',edtDataLancto.Date);
      sDataLanctoDia := copy(sDataLanctoDia,1,2);
                                        
      edtDataVencto.Date := EncodeDate(word(trunc(DBspnAno.Value)), (cboMes.ItemIndex + 1), StrToInt(sDataVenctoDia) );
      edtDataLancto.Date := EncodeDate(word(trunc(DBspnAno.Value)), (cboMes.ItemIndex + 1), StrToInt(sDataLanctoDia) );
   end
   else
   begin
   edtDataVencto.Date  := DiasUteis.UltDiaMes(word(trunc(DBspnAno.Value)), (cboMes.ItemIndex + 1));
   edtDataLancto.Date  := DiasUteis.UltDiaMes(word(trunc(DBspnAno.Value)), (cboMes.ItemIndex + 1));

   end;
   if Sistema.TipoCliente = 20071 then
   begin
      edtDataVencto.Date      := EncodeDate(word(trunc(DBspnAno.Value)), (cboMes.ItemIndex + 1), 25);
      edtDataLancto.Date      := EncodeDate(word(trunc(DBspnAno.Value)), (cboMes.ItemIndex + 1), 25);
   end;
end;



procedure TfrmExecTrataDivergNovo.ExecutaAbono;
begin
   inherited;

   (* ---------------------------------------------------------------------------------------------

   1º Passo: Verifica se a FOLHA já leu TMPDESC (TMPDESC.SITENVIO = 1)
   2º Passo: Tratar ítem (válido) atualizando na tabela.
   3º Passo: Preparar entrada para contabilidade.

   OBS:  Não é possível abonar se o item já estiver enviado para CaR;
   ----------------------------------------------------------------------------------------------- *)

   (* 1ºPasso ------------------------------------------------------------------------------------ *)

   try
      with cdsHistMov do
      begin
         DisableControls;

         // Acerta tela de acompanhamento
         frmAguarde.Max := RecordCount;
         frmAguarde.Pos := 0;

         frmAguarde.Mostra('Processando registros. Aguarde...');

         First;
         while not(cdsHistMov.EOF) do
         begin
            // Atualiza tela de acompanhamento
            frmAguarde.Pos := frmAguarde.Pos + 1;

            // Caso não tenha sido selecionado pula
            if (cdsHistMovFLGESCOLHA.AsInteger = 0) and not(chkTodos.Checked) then
            begin
               cdsHistMov.Next;
               Continue;
            end;

            AbreItens(cdsHistMov.FieldByName('IDCONTRATOEMPTMO').AsFloat,cdsHistMov.FieldByName('HMEPARCELA').AsInteger, True);

            while not qryItens.eof do
            begin

               if not(dtmBaseDados.dbBaseDados.InTransaction) then StartTransacao;

               with qryAux do
               begin
                  SQL.Clear;
                  SQL.Text :=
                  'UPDATE '                                                      + #13 +
                  '  HISTMOVEMPTMO '                                             + #13 +
                  'SET '                                                         + #13 +
                  '  FLGDIVERGPEND     = NULL, '                                 + #13 +
                  '  FLGDIVERGTRAT     = 1, '                                    + #13 +
                  '  FLGTIPODIVERGTRAT = ' + IntToStr(rgOpcoes.ItemIndex) + ', ' + #13 +

                  // Marchetti - Pendencia 23319
                  '  HMEOBSERVACAO        = HMEOBSERVACAO || ' + #13 + QuotedStr(' Tratamento de divergência efetuado por: ' + Sistema.NomeUsuario) + ', ' + #13 +

                  '  HMEDATADIVERGTRAT = ' + OraData(SysDate)                    + #13 +
                  'WHERE '                                                       + #13 +
                  '  IDHISTMOVEMPTMO   = ' + FloatToStr(qryItensIDHISTMOVEMPTMO.asFloat);

                  try
                     ExecSQL;
                  except;
                     MsgDlg('Erro ao atualizar Histórico.', 'Empréstimo', mtError, [mbOk], 0);
                  end;

               end; (* with qryAux *)

               {FIM - 3ºPasso}
               PreencheTabelaVirtual;

               if not(chkNaoCommit.Checked) then
                  if (dtmBaseDados.dbBaseDados.InTransaction) then CommitTransacao;

               qryItens.Next;
            end;

            cdsHistMov.Next;
         end;

         EnableControls;
         frmAguarde.Apaga;
      end;


      // -------------------------------------------------------------------------------------
      // Log de operações
      if not(Sistema.GravaLogOperacoes('Tratamento de Divergências (ignorar diferenças)')) then
      begin
         Raise Exception.Create('Falha na gravação do Log da operação.');
      end;
      // -------------------------------------------------------------------------------------


      if not(chkNaoCommit.Checked) then
         if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;

   except;
      Raise;
      Repaint;
   end;
end;



procedure TfrmExecTrataDivergNovo.AtualizaVencimento;
var
   fSaldoAReceber       : Currency;
   sMensErro            : String;
   sSQL                 : String;
begin
   // Inicia uma transação

   // Gera nova forma de cobrança caso desejado
   if DBrdgDebito.ItemIndex <> 2 then
   begin
      if DBrdgDebito.ItemIndex = 0 then
      begin
         sNovaFormaCobranca := 'C';
      end
      else
      begin
         sNovaFormaCobranca := 'F';
      end;
   end;

   sMensErro   := '';

   try
      // Varre todo historico de Divergencias e trata as escolhidas *)
      with cdsHistMov do
      begin
         DisableControls;

         (* Acerta tela de acompanhamento *)
         frmAguarde.Max := RecordCount;
         frmAguarde.Pos := 0;

         frmAguarde.Mostra('Processando, Aguarde...');

         First;

         while not(cdsHistMov.EOF) do
         begin
            // Atualiza tela de acompanhamento
            frmAguarde.Pos := frmAguarde.Pos + 1;

            (* Caso não tenha sido selecionado pula *)
            if (cdsHistMovFLGESCOLHA.AsInteger = 0) and not(chkTodos.Checked) then
            begin
               cdsHistMov.Next;
               Continue;
            end;

            // abre a query principal com o participante escolhido
            Sel(cdsHistMov.FieldByName('IDCONTRATOEMPTMO').AsFloat);

            // Processa Registro Selecionado -------------------------------------------------------

            // Preenche registro com os dados do Contrato
            PreencheDadosContrato(qry, rContrato);

            AbreItens(cdsHistMov.FieldByName('IDCONTRATOEMPTMO').AsFloat,cdsHistMov.FieldByName('HMEPARCELA').AsInteger, False);

            while not qryItens.eof do
            begin
               if not(dtmBaseDados.dbBaseDados.InTransaction) then StartTransacao;

               { Acerta forma de Cobranca caso seja sempre a mesma }
               if DBrdgDebito.ItemIndex = 2 then sNovaFormaCobranca := qryItens.FieldByName('HMEFORMACOBRANCA').AsString;

               sNovaDataCobranca := DateToStr(edtDataVencto.Date);

               fSaldoAReceber := qryItens.FieldByName('HMEVLRPREVISTO').AsCurrency - qryItens.FieldByName('HMEVLREFETIVO').AsCurrency;

               // Calcula novos dados da Cobrança
               sNovoMesCobranca := Copy(sNovaDataCobranca, 4, 2);
               sNovoAnoCobranca := Copy(sNovaDataCobranca, 7, 4);

               // Atualiza Tabela de Historico
               sSQL :=
               'UPDATE '                                                            + #13 +
               '  HISTMOVEMPTMO '                                                   + #13 +
               'SET '                                                               + #13 +
               '  FLGBAIXADO           = 0, '                                       + #13 +
               '  FLGDIVERGTRAT        = 1, '                                       + #13 +
               '  FLGTIPODIVERGTRAT    = ' + IntToSTr(rgOpcoes.ItemIndex) + ', '    + #13 +

               // Marchetti - Pendencia 23319
               '  HMEOBSERVACAO        = HMEOBSERVACAO || ' + #13 + QuotedStr(' Tratamento de divergência efetuado por: ' + Sistema.NomeUsuario) + ', ' + #13 +

               '  HMEDATADIVERGTRAT    = ' + OraData(SysDate)             + ', '    + #13;

               if fSaldoAReceber = qryItens.FieldByName('HMEVLRPREVISTO').AsCurrency then sSQL := sSQL +
               '  HMEDATAVENCTO  = to_date(' + QuotedStr(sNovaDataCobranca) + ',''dd/mm/yyyy''),' + #13 +
               '  HMEANOCOBRANCA = ' + sNovoAnoCobranca + ','                       + #13 +
               '  HMEMESCOBRANCA = ' + sNovoMesCobranca + ','                       + #13;

               sSQL := sSQL +
               '  CODDOCUMENTO         = NULL, '                                    + #13 +
               '  FLGENVIO             = 0, '                                       + #13 +
               '  IDTMPDESC            = NULL, '                                    + #13 +
               '  FLGDIVERGPEND        = NULL, '                                    + #13 +
               '  HMEFORMACOBRANCA     = ' + QuotedStr(sNovaFormaCobranca)          + #13;

               if sNovaFormaCobranca = 'C' then sSQL := sSQL +
                  ' ,HMETIPOFOLHA     = NULL'                                       + #13;

               sSQL := sSQL +
               'WHERE '                                                                                     + #13 +
               '      IDCONTRATOEMPTMO = ' + FloatToStr(cdsHistMov.FieldByName('IDCONTRATOEMPTMO').AsFloat)            + #13 +
               '  AND HMEPARCELA       = ' + IntToStr(qryItens.FieldByName('HMEPARCELA').AsInteger)                  + #13 +
               '  AND HMEVLREFETIVO    IS NULL '                                                            + #13 +
               '  AND FLGDIVERGPEND    = 1 '                                                                + #13 +
               '  AND (HMECENTRALIZA   = 1 OR HMEDESTACADO = 1) ';

               dtmEmptmo.qryAuxEmptmo.SQL.Clear;
               dtmEmptmo.qryAuxEmptmo.SQL.Text := sSQL;
               dtmEmptmo.qryAuxEmptmo.ExecSQL;

               if (not(qryItensCODDOCUMENTO.IsNull)) then
               begin

                  if not(CalcEmptmo.ExisteHistMovXDocum(qryItensCODDOCUMENTO.AsFloat,
                                                        qryItensIDHISTMOVEMPTMO.AsFloat
                                                       )) then
                  begin

                     with dtmEmptmo.qryAuxEmptmo do
                     begin
                        sSQL :=
                        'INSERT INTO HISTMOVXDOCUM '                          + #13 +
                        '(IDHISTMOVEMPTMO, HMDCODDOCUMENTO, HMDDATA) '        + #13 +
                        'VALUES '                                             + #13 +
                        '( ' + FloatToStr(qryItensIDHISTMOVEMPTMO.AsFloat)  + ',' +
                               qryItensCODDOCUMENTO.AsString                + ',' +
                               QuotedStr(DateToStr(Date))                     + ' ) ';
                        Close;
                        SQL.Clear;
                        SQL.Text := sSQL;
                        ExecSQL;
                     end;
                  end;

                  // Pendência 25353 - 17/05/2007 - Alberto
                  if (dtmEmptmo.qryParamEmptmoFLGESTORNADIVERG.AsInteger = 1) then
                  begin
                     IntegraEmptmo.EfetuaBaixaCAR(qryItensCODDOCUMENTO.AsInteger);
                  end;

               end;

               if not(chkNaoCommit.Checked) then
                  if (dtmBaseDados.dbBaseDados.InTransaction) then CommitTransacao;

               qryItens.Next;
            end;

            cdsHistMov.Next;

         end;  // while not(cdsHistMov.EOF)

         cdsHistMov.First;
         EnableControls;

      end;  // with qryHistMov do

      Repaint;

   except
      // Caso tenha ocorrido um erro, Cancela transação
      if dtmBaseDados.dbBaseDados.InTransaction then RollBackTransacao;
      Raise;
      Repaint;
   end;
end;



procedure TfrmExecTrataDivergNovo.TrataDivergencia;
var
   fSaldoAReceber       : Currency;
   iParcela             : Integer;
   iParcelaAlt          : Integer;
   iParcAnt             : Integer;
   iNovoAnoCompetencia  : Integer;
   iNovoMesCompetencia  : Integer;

   iContador            : Integer;

   sMensErro            : String;
   sSQL                 : String;
   iContrato            : Extended;
   rLogTotalPrev        : TLogTotalPrev;
begin

   // Gera nova forma de cobrança caso desejado
   if DBrdgDebito.ItemIndex <> 2 then
   begin
      if DBrdgDebito.ItemIndex = 0 then
      begin
         sNovaFormaCobranca := 'C';
      end
      else
      begin
         sNovaFormaCobranca := 'F';
      end;
   end;

   sMensErro   := '';

   try
      iContador := 0;
      MostraFormProgresso('Processando itens divergentes...', 0, cdsHistMov.RecordCount, False, False);

      try
         // Varre todo historico de Divergencias e trata as escolhidas *)
         with cdsHistMov do
         begin
            DisableControls;

            First;

            while not(cdsHistMov.EOF) do
            begin

               LogToFile('Loop externo, registro nº ' + FormatFloat('#,#0', cdsHistMov.RecNo) + ', ' +
                         'Contrato: ' + FormatFloat('#0', cdsHistMovIDCONTRATOEMPTMO.AsFloat) + ', ' +
                         'Parcela: ' + cdsHistMovHMEPARCELA.AsString,
                         sArq
                        );

               // Caso não tenha sido selecionado pula
               if (cdsHistMovFLGESCOLHA.AsInteger = 0) and not(chkTodos.Checked) then
               begin
                  LogToFile('Registro nº ' + FormatFloat('#,#0', cdsHistMov.RecNo) + ' desmarcado', sArq);

                  cdsHistMov.Next;

                  inc(iContador);
                  AndaFormProgresso(iContador);
                  Repaint;

                  Continue;
               end;

               // abre a query principal com o participante escolhido
               Sel(cdsHistMovIDCONTRATOEMPTMO.AsFloat);
               LogToFile('Após SEL(iContrato)', sArq);

               // Preenche registro com os dados do Contrato
               PreencheDadosContrato(qry, rContrato);
               LogToFile('Após PreencheDadosContrato', sArq);

               if not(dtmBaseDados.dbBaseDados.InTransaction) then
               begin
                  StartTransacao;
                  LogToFile('Após Start Transação', sArq);
               end;

               LogToFile('Antes abertura da parcela', sArq, True, True, True);

               AbreItens(cdsHistMov.FieldByName('IDCONTRATOEMPTMO').AsFloat,cdsHistMov.FieldByName('HMEPARCELA').AsInteger, False);

               LogToFile('Após abertura da parcela', sArq, True, True, True);

               while not qryItens.eof do
               begin

                  LogToFile('Loop interno dos itens da parcela, ' +
                            'Contrato: ' + FormatFloat('#0', cdsHistMovIDCONTRATOEMPTMO.AsFloat) + ', ' +
                            'Parcela: ' + cdsHistMovHMEPARCELA.AsString,
                            sArq
                           );

                  { Acerta forma de Cobranca caso seja sempre a mesma }
                  if DBrdgDebito.ItemIndex = 2 then sNovaFormaCobranca := qryItens.FieldByName('HMEFORMACOBRANCA').AsString;

                  // calcula nova competência
                  iNovoAnoCompetencia  := trunc(DBspnAno.Value);
                  iNovoMesCompetencia  := cboMes.ItemIndex + 1;

                  // Acerta forma de Cobranca caso seja sempre a mesma
                  if DBrdgDebito.ItemIndex = 2 then sNovaFormaCobranca := qryItens.FieldByName('HMEFORMACOBRANCA').AsString;

                  sNovaDataCobranca := DateToStr(edtDataVencto.Date);

                  // Processa Registro Selecionado ----------------------------------------------------

                  fSaldoAReceber := qryItens.FieldByName('HMEVLRPREVISTO').AsCurrency - qryItens.FieldByName('HMEVLREFETIVO').AsCurrency;
                  iParcela       := qryItens.FieldByName('HMEPARCELA').AsInteger;
                  iParcelaAlt    := qryItens.FieldByName('HMEPARCELAALT').AsInteger;

                  // Calcula novos dados da Cobrança
                  sNovoMesCobranca := Copy(sNovaDataCobranca, 4, 2);
                  sNovoAnoCobranca := Copy(sNovaDataCobranca, 7, 4);

                  if (fSaldoAReceber = qryItens.FieldByName('HMEVLRPREVISTO').AsCurrency) then
                  begin
                     SetLength(vLista, 1);
                     vLista[0].Nome                   := qryItens.FieldByName('ITEDESCRICAO').AsString;
                     vLista[0].AnoCompetencia         := qryItens.FieldByName('HMEANOCOMPETENCIA').AsInteger;
                     vLista[0].MesCompetencia         := qryItens.FieldByName('HMEMESCOMPETENCIA').AsInteger;
                     vLista[0].SeqCobranca            := qryItens.FieldByName('HMESEQCOBRANCA').AsInteger;
                     vLista[0].iEvento                := qryItens.FieldByName('HMETIPOMOV').AsInteger;
                     vLista[0].CodigoItem             := qryItens.FieldByName('IDITEMEMPTMO').AsInteger;
                     vLista[0].DataPrevista           := edtDataVencto.Date;
                     vLista[0].Valor                  := fSaldoAReceber;
                     vLista[0].SaldoDevedor           := qryItens.FieldByName('HMESALDODEV').AsCurrency;
                     vLista[0].TxJuros                := qryItens.FieldByName('HMETXJUROS').AsCurrency;
                     vLista[0].Parcela                := qryItens.FieldByName('HMEPARCELA').AsInteger;
                     vLista[0].AnoCobranca            := StrToInt(sNovoAnoCobranca);
                     vLista[0].DataEfetiva            := 0;
                     vLista[0].FlgBaixado             := -1;
                     vLista[0].FlgCentraliza          := qryItens.FieldByName('HMECENTRALIZA').AsInteger;
                     vLista[0].FlgDestacado           := qryItens.FieldByName('HMEDESTACADO').AsInteger;
                     vLista[0].FlgDivergPend          := -1;
                     vLista[0].FlgEnvio               := 0;
                     vLista[0].FlgTipoDiverg          := -1;
                     vLista[0].FormaCobranca          := sNovaFormaCobranca;
                     vLista[0].IdItemCentraliza       := qryItens.FieldByName('IDITEMCENTRALIZA').AsInteger;
                     vLista[0].MesCobranca            := StrToInt(sNovoMesCobranca);
                     vLista[0].Origem                 := qryItens.FieldByName('HMEORIGEM').AsInteger;
                     vLista[0].ParcResta              := qryItens.FieldByName('HMENUMPARCELAS').AsInteger;
                     vLista[0].Prioridade             := qryItens.FieldByName('HMEPRIORIDADE').AsInteger;
                     vLista[0].RecPag                 := qryItens.FieldByName('HMERECPAG').AsString;
                     vLista[0].Regra                  := qryItens.FieldByName('IDREGRA').AsInteger;
                     vLista[0].Rubrica                := qryItens.FieldByName('IDRUBRICA').AsInteger;

                     // Preenche a Tabela de Resultados
                     PreencheTabelaVirtual;
                     LogToFile('Após PreencheTabelaVirtual (a receber = previsto)', sArq);
                  end;

                  // Limpa a lista de itens
                  SetLength(vLista, 0);

                  // Recebimento a menor ou Valor não recebido
                  if ( (fSaldoAReceber > 0) or
                       (qryItens.FieldByName('HMEDATAPREVISTA').AsDateTime <> qryItens.FieldByName('HMEDATAEFETIVA').AsDateTime)
                     ) then
                  begin
                     // -------------------------------------------------------------------------------
                     // -------------------------------------------------------------------------------
                     LogToFile('Antes CalculaItensDiverg, Contrato: ' + FormatFloat('#0', rContrato.IDContratoEmptmo) + ', ' +
                               'Parcela: ' + IntToStr(iParcela),
                               sArq
                              );

                     // Calcula novos itens de Cobranca
                     if not(CalcEmptmo.CalculaItensDiverg(rContrato,
                                                          4,                             // Origem
                                                          iParcela,
                                                          iParcelaAlt,
                                                          qryItens.FieldByName('HMENUMPARCELAS').AsInteger,
                                                          iNovoAnoCompetencia,
                                                          iNovoMesCompetencia,
                                                          edtDataVencto.Date,            // data do processo - para Saldo Anterior
                                                          StrToDate(sNovaDataCobranca),  // novo vencimento
                                                          StrToDate(sNovaDataCobranca),  // data de atualização
                                                          sNovaFormaCobranca,
                                                          vLista,
                                                          True,
                                                          False,
                                                          sArq                                                          ,
                                                          True  // 92334 Daniel Begnami
                                                         )) then
                     begin
                        LogToFile('FALHA CalculaItensDiverg, Contrato: ' + FormatFloat('#0', rContrato.IDContratoEmptmo) + ', ' +
                                  'Parcela: ' + IntToStr(iParcela),
                                  sArq
                                 );

                        // Não foi possível atualizar os itens, ou por problemas no Cálculo, ou
                        // por Cancelamento do Usuário, logo o procedimento será abortado
                        Exit;
                     end;

                     LogToFile('Após CalculaItensDiverg, Contrato: ' + FormatFloat('#0', rContrato.IDContratoEmptmo) + ', ' +
                               'Parcela: ' + IntToStr(iParcela),
                               sArq
                              );

                     // Preenche a Tabela de Resultados
                     PreencheTabelaVirtual;

                     LogToFile('Após PreencheTabelaVirtual', sArq);

                     CalcEmptmo.GravaMovEmptmo(rContrato,
                                               vLista,
                                               4,                                        // Atualização
                                               iParcela,
                                               iNovoAnoCompetencia,
                                               iNovoMesCompetencia,
                                               StrToInt(sNovoAnoCobranca),
                                               StrToInt(sNovoMesCobranca),
                                               qryItens.FieldByName('HMENUMPARCELAS').AsInteger,  // nº de parcelas remanescentes
                                               StrToDate(sNovaDataCobranca),
                                               StrToDate(sNovaDataCobranca),
                                               '',
                                               '',
                                               False,
                                               -1,
                                               True // 92334 Daniel Begnami
                                              );

                     LogToFile('Após GravaMovEmptmo, Contrato = ' + FormatFloat('#0', rContrato.IDContratoEmptmo) + ', ' +
                               'Parcela = ' + IntToStr(iParcela),
                               sArq
                              );
                  end; // if (fSaldoAReceber > 0) or

                  if (not(qryItensCODDOCUMENTO.IsNull)) then
                  begin

                     LogToFile('Antes HistMovXDocum, IDHist = ' + FormatFloat('#0', qryItensIDHISTMOVEMPTMO.AsFloat) +
                               ', Documento = ' + FormatFloat('#0', qryItensIDHISTMOVEMPTMO.AsFloat), sArq
                              );

                     if not(CalcEmptmo.ExisteHistMovXDocum(qryItensCODDOCUMENTO.AsFloat,
                                                           qryItensIDHISTMOVEMPTMO.AsFloat
                                                           )) then
                     begin

                        with dtmEmptmo.qryAuxEmptmo do
                        begin
                           sSQL :=
                           'INSERT INTO HISTMOVXDOCUM '                                  + #13 +
                           '(IDHISTMOVEMPTMO, HMDCODDOCUMENTO, HMDDATA) '                + #13 +
                           'VALUES '                                                     + #13 +
                           '( ' + FormatFloat('#0', qryItensIDHISTMOVEMPTMO.AsFloat)   + ',' +
                                  FormatFloat('#0', qryItensCODDOCUMENTO.AsFloat)      + ',' +
                                  QuotedStr(DateToStr(Date))                             +
                           ' ) ';

                           Close;
                           SQL.Clear;
                           SQL.Text := sSQL;
                           ExecSQL;
                        end;

                     end;

                     LogToFile('Após HistMovXDocum, IDHist = ' + FormatFloat('#0', qryItensIDHISTMOVEMPTMO.AsFloat) +
                               ', Documento = ' + FormatFloat('#0', qryItensIDHISTMOVEMPTMO.AsFloat), sArq
                              );

                     // Pendência 25353 - 17/05/2007 - Alberto
                     if (dtmEmptmo.qryParamEmptmoFLGESTORNADIVERG.AsInteger = 1) then
                     begin
                        LogToFile('Antes EfetuaBaixaCAR', sArq);

                        IntegraEmptmo.EfetuaBaixaCAR(qryItensCODDOCUMENTO.AsInteger);

                        LogToFile('Após EfetuaBaixaCAR', sArq);
                     end;

                     // ---------------------------------------------------------------------------------

                     LimpaRegistroLog(rLogTotalPrev);

                     rLogTotalPrev.IDModulo   := Sistema.IDModulo;
                     rLogTotalPrev.IDContrato := rContrato.IDContratoEmptmo;
                     rLogTotalPrev.IDHistMov  := qryItensIDHISTMOVEMPTMO.AsFloat;
                     rLogTotalPrev.CodPlanDoc := qryItensCODDOCUMENTO.AsInteger;
                     rLogTotalPrev.Origem     := 4;

                     if (dtmEmptmo.qryParamEmptmoFLGESTORNADIVERG.AsInteger = 1) then

                        rLogTotalPrev.Operacao   := 'HistMovXDocum + EfetuaBaixaCaR'
                     else
                        rLogTotalPrev.Operacao   := 'HistMovXDocum';

                     rLogTotalPrev.Data       := SysDate;
                     rLogTotalPrev.IDUsuario  := Sistema.IDUsuario;
                     rLogTotalPrev.Versao     := Sistema.Versao;

                     GravaLogTotalPrev(rLogTotalPrev);

                     LogToFile('Após GravaLogTotalPrev', sArq);
                     // ---------------------------------------------------------------------------------

                  end;

                  // Atualiza Tabela de Historico
                  LogToFile('Antes update do Histórico (divergente = null)', sArq);

                  sSQL :=
                  'UPDATE '                                                                             + #13 +
                  '  PREPARAHISTMOVEMPTMO '    + #13 +       // 92334 Daniel Begnami
                  'SET '                                                                                + #13 +
                  '  FLGSITREG            = ''A'', ' + #13 + // 92334 Daniel Begnami
                  '  FLGBAIXADO           = 0, '                                                        + #13 +
                  '  FLGDIVERGTRAT        = 1, '                                                        + #13 +
                  '  FLGTIPODIVERGTRAT    = ' + IntToStr(rgOpcoes.ItemIndex) + ', '                     + #13 +
                  '  HMEOBSERVACAO        = HMEOBSERVACAO || ' + #13 + QuotedStr(' Tratamento de divergência efetuado por: ' + Sistema.NomeUsuario) + ', ' + #13 +
                  '  HMEDATADIVERGTRAT    = ' + OraData(SysDate)             + ', '                     + #13;

                  if fSaldoAReceber = qryItens.FieldByName('HMEVLRPREVISTO').AsCurrency then
                  begin
                     sSQL := sSQL +
                     ' HMEDATAVENCTO  = to_date(' + QuotedStr(sNovaDataCobranca) + ',''dd/mm/yyyy''),'   + #13 +
                     ' HMEANOCOBRANCA = ' + sNovoAnoCobranca + ','                                       + #13 +
                     ' HMEMESCOBRANCA = ' + sNovoMesCobranca + ','                                       + #13;
                  end;

                  sSQL := sSQL +
                  '  CODDOCUMENTO         = NULL, '                                    + #13 +
                  '  FLGENVIO             = 0, '                                       + #13 +
                  '  IDTMPDESC            = NULL, '                                    + #13 +
                  '  FLGDIVERGPEND        = NULL, '                                    + #13 +
                  '  HMEFORMACOBRANCA     = ' + QuotedStr(sNovaFormaCobranca)          + #13;

                  if sNovaFormaCobranca = 'C' then sSQL := sSQL +
                     ' ,HMETIPOFOLHA     = NULL'                                       + #13;

                  sSQL := sSQL +
                  'WHERE '                                                                               + #13 +
                  '      IDCONTRATOEMPTMO = ' + FloatToStr(cdsHistMov.FieldByName('IDCONTRATOEMPTMO').AsFloat)      + #13 +
                  '  AND HMEPARCELA       = ' + IntToStr(qryItens.FieldByName('HMEPARCELA').AsInteger)            + #13 +
                  '  AND HMEVLREFETIVO    IS NULL '                                                      + #13 +
                  '  AND FLGDIVERGPEND    = 1 '                                                          + #13 +
                  '  AND (HMECENTRALIZA   = 1 OR HMEDESTACADO = 1) ';

                  dtmEmptmo.qryAuxEmptmo.SQL.Clear;
                  dtmEmptmo.qryAuxEmptmo.SQL.Text := sSQL;
                  dtmEmptmo.qryAuxEmptmo.ExecSQL;

                  LogToFile('Após update do Histórico (divergente = null)', sArq);

                  LimpaRegistroLog(rLogTotalPrev);

                  rLogTotalPrev.IDModulo   := Sistema.IDModulo;
                  rLogTotalPrev.IDContrato := rContrato.IDContratoEmptmo;
                  rLogTotalPrev.IDHistMov  := -1;
                  rLogTotalPrev.CodPlanDoc := -1;
                  rLogTotalPrev.Origem     := 4;
                  rLogTotalPrev.Operacao   := 'Atualiza Histórico e Limpa CodDocumento - parcela ' + IntToStr(FieldByName('HMEPARCELA').AsInteger);
                  rLogTotalPrev.Data       := SysDate;
                  rLogTotalPrev.IDUsuario  := Sistema.IDUsuario;
                  rLogTotalPrev.Versao     := Sistema.Versao;

                  GravaLogTotalPrev(rLogTotalPrev);

                  LogToFile('Após GravaLogTotalPrev', sArq);

                  LogToFile('Logo antes do Next dos itens', sArq);

                  qryItens.Next;
               end; // not qryItens.EOF

               if not(chkNaoCommit.Checked) then
                  if (dtmBaseDados.dbBaseDados.InTransaction) then CommitTransacao;

               LogToFile('Após Commit Transacao', sArq);

               LogToFile('Logo antes do Next da parcela', sArq);
               cdsHistMov.Next;

               inc(iContador);
               AndaFormProgresso(iContador);
               Repaint;
            end; // not(cdsHistMov.EOF)

            EnableControls;

         end; // with qryHistMov do

         Repaint;

      except
         // Caso tenha ocorrido um erro, Cancela transação
         if dtmBaseDados.dbBaseDados.InTransaction then RollBackTransacao;
         Raise;
         Repaint;
      end;

   finally
      EscondeFormProgresso;
   end;
end;



procedure TfrmExecTrataDivergNovo.InsereDiferencaHist(qryLocal: TwwQuery; fSaldoAReceber : Currency);
begin
   with qryLocal do
   begin
      SetLength(vLista, 1);

      vLista[0].Nome                   := FieldByName('ITEDESCRICAO').AsString;
      vLista[0].AnoCompetencia         := FieldByName('HMEANOCOMPETENCIA').AsInteger;
      vLista[0].MesCompetencia         := FieldByName('HMEMESCOMPETENCIA').AsInteger;
      vLista[0].SeqCobranca            := FieldByName('HMESEQCOBRANCA').AsInteger + 1;
      vLista[0].iEvento                := FieldByName('HMETIPOMOV').AsInteger;
      vLista[0].CodigoItem             := FieldByName('IDITEMEMPTMO').AsInteger;
      vLista[0].DataPrevista           := edtDataVencto.Date;
      vLista[0].Valor                  := fSaldoAReceber;
      vLista[0].SaldoDevedor           := FieldByName('HMESALDODEV').AsCurrency;
      vLista[0].TxJuros                := FieldByName('HMETXJUROS').AsCurrency;

      vLista[0].Parcela                := FieldByName('HMEPARCELA').AsInteger;
      vLista[0].ParcelaAlt             := FieldByName('HMEPARCELAALT').AsInteger;
      vLista[0].ParcResta              := FieldByName('HMENUMPARCELAS').AsInteger;

      vLista[0].AnoCobranca            := StrToInt(sNovoAnoCobranca);
      vLista[0].DataEfetiva            := 0;
      vLista[0].DataReceb              := 0;

      vLista[0].FlgBaixado             := 0;
      vLista[0].FlgCentraliza          := FieldByName('HMECENTRALIZA').AsInteger;
      vLista[0].FlgDestacado           := FieldByName('HMEDESTACADO').AsInteger;
      vLista[0].FlgDivergPend          := -1;
      vLista[0].FlgEnvio               := 0;
      vLista[0].FlgTipoDiverg          := -1;
      vLista[0].FormaCobranca          := sNovaFormaCobranca;
      vLista[0].IdItemCentraliza       := FieldByName('IDITEMCENTRALIZA').AsInteger;
      vLista[0].MesCobranca            := StrToInt(sNovoMesCobranca);
      vLista[0].Origem                 := FieldByName('HMEORIGEM').AsInteger;
      vLista[0].Prioridade             := FieldByName('HMEPRIORIDADE').AsInteger;
      vLista[0].RecPag                 := FieldByName('HMERECPAG').AsString;
      vLista[0].Regra                  := FieldByName('IDREGRA').AsInteger;
      vLista[0].Rubrica                := FieldByName('IDRUBRICA').AsInteger;


      // Marchetti - Pendencia 23319
      vLista[0].Observacao             := 'Tratamento de divergência efetuado por: ' + Sistema.NomeUsuario;

      if fSaldoAReceber < 0 then
      begin
         vLista[0].ValorEfetivo        := fSaldoAReceber;
         vLista[0].DataEfetiva         := FieldByName('HMEDATAEFETIVA').AsdateTime;
      end;

      if fSaldoAReceber < 0 then
      begin
         SetLength(vLista, 2);
         vLista[1].Nome                := FieldByName('ITEDESCRICAO').AsString;
         vLista[1].AnoCompetencia      := FieldByName('HMEANOCOMPETENCIA').AsInteger;
         vLista[1].MesCompetencia      := FieldByName('HMEMESCOMPETENCIA').AsInteger;
         vLista[1].SeqCobranca         := FieldByName('HMESEQCOBRANCA').AsInteger + 1;
         vLista[1].iEvento             := FieldByName('HMETIPOMOV').AsInteger;
         vLista[1].CodigoItem          := 0;
         vLista[1].DataPrevista        := edtDataVencto.Date;
         vLista[1].Valor               := fSaldoAReceber;
         vLista[1].ValorEfetivo        := fSaldoAReceber;
         vLista[1].FlgBaixado          := -1;
         vLista[1].SaldoDevedor        := FieldByName('HMESALDODEV').AsCurrency - Abs(fSaldoAReceber);
         vLista[1].TxJuros             := FieldByName('HMETXJUROS').AsCurrency;

         vLista[1].Parcela             := FieldByName('HMEPARCELA').AsInteger;
         vLista[1].ParcelaAlt          := FieldByName('HMEPARCELAALT').AsInteger;
         vLista[1].ParcResta           := FieldByName('HMENUMPARCELAS').AsInteger;

         vLista[1].AnoCobranca         := StrToInt(sNovoAnoCobranca);
         vLista[1].DataEfetiva         := 0;
         vLista[0].DataReceb           := 0;

         vLista[1].FlgBaixado          := 0;
         vLista[1].FlgCentraliza       := FieldByName('HMECENTRALIZA').AsInteger;
         vLista[1].FlgDestacado        := FieldByName('HMEDESTACADO').AsInteger;
         vLista[1].FlgDivergPend       := -1;
         vLista[1].FlgEnvio            := -1;
         vLista[1].FlgTipoDiverg       := -1;
         vLista[1].FormaCobranca       := sNovaFormaCobranca;
         vLista[1].IdItemCentraliza    := FieldByName('IDITEMCENTRALIZA').AsInteger;
         vLista[1].MesCobranca         := StrToInt(sNovoMesCobranca);
         vLista[1].Origem              := FieldByName('HMEORIGEM').AsInteger;
         vLista[1].Prioridade          := FieldByName('HMEPRIORIDADE').AsInteger;
         vLista[1].RecPag              := FieldByName('HMERECPAG').AsString;
         vLista[1].Regra               := FieldByName('IDREGRA').AsInteger;
         vLista[1].Rubrica             := FieldByName('IDRUBRICA').AsInteger;
         vLista[1].DataEfetiva         := FieldByName('HMEDATAEFETIVA').AsDateTime;

         // Marchetti - Pendencia 23319
         vLista[1].Observacao             := 'Tratamento de divergência efetuado por: ' + Sistema.NomeUsuario;
      end;

      // -------------------------------------------------------------------------------------------
      CalcEmptmo.GravaMovEmptmo(rContrato,
                                vLista,
                                FieldByName('HMETIPOMOV').AsInteger,
                                FieldByName('HMEPARCELA').AsInteger,
                                FieldByName('HMEANOCOMPETENCIA').AsInteger,
                                FieldByName('HMEMESCOMPETENCIA').AsInteger,
                                StrToInt(sNovoAnoCobranca),
                                StrToInt(sNovoMesCobranca),
                                rContrato.NumParcelas,         // nº de parcelas remanescentes
                                StrToDate(sNovaDataCobranca),
                                StrToDate(sNovaDataCobranca),
                                '',
                                '',
                                False                          // mostra progresso
                               );
      // -------------------------------------------------------------------------------------------
   end;
end;




procedure TfrmExecTrataDivergNovo.DBgrdHistMovVirtualCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;
   if qryHistMovVirtual.IsEmpty then Exit;

   (* faz com que as linhas do grid tenham cores alternadas *)
   if State <> [gdSelected] then
   begin
      if not(Highlight) then
      begin
         (* linhas ímpares = amarelo, linhas pares = branco *)
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
         begin
            ABrush.Color := $00C0FFFF; (* amarelo bebê *)
         end
         else // if not(Highlight)
         begin
            ABrush.Color := clWhite;
         end;
      end;
   end
   else // if State <> [gdSelected]
   begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;  // if State <> [gdSelected]
end;



procedure TfrmExecTrataDivergNovo.molMutuariobtnLimpaPartClick(Sender: TObject);
begin
   inherited;
   molMutuario.btnLimpaPartClick(Sender);
end;



procedure TfrmExecTrataDivergNovo.molMutuariobtnBuscaPartClick(Sender: TObject);
begin
   inherited;
   molMutuario.btnBuscaPartClick(Sender);
end;



procedure TfrmExecTrataDivergNovo.bbtnParcelaClick(Sender: TObject);
var
   Mostra: Boolean;
begin
   inherited;

   Mostra := False;

   if cdsHistMov.RecordCount > 100 then
   begin
      cdsHistMov.DisableControls;

      // Acerta tela de acompanhamento
      frmAguarde.Max := cdsHistMov.RecordCount;
      frmAguarde.Pos := 0;

      frmAguarde.Mostra('Processando, Aguarde...');

      Mostra := True;
   end;

   cdsHistMov.First;
   while not(cdsHistMov.EOF) do
   begin
      if cdsHistMov.FieldByName('HMETIPOMOV').AsInteger = 1 then
      begin
         cdsHistMov.Edit;
         cdsHistMovFLGESCOLHA.AsInteger := 1;
         cdsHistMov.Post;
      end;

      cdsHistMov.Next;

      if Mostra = True then
      begin
         // Atualiza tela de acompanhamento
         frmAguarde.Pos := frmAguarde.Pos + 1;
      end;
   end;

   if cdsHistMov.Active then cdsHistMov.First;

   cdsHistMov.EnableControls;

   if Mostra = True then frmAguarde.Apaga;
end;




procedure TfrmExecTrataDivergNovo.bbtnEncargosClick(Sender: TObject);
var
   Mostra: Boolean;
begin
   inherited;

   Mostra := False;

   if cdsHistMov.RecordCount > 100 then
   begin
      cdsHistMov.DisableControls;

      // Acerta tela de acompanhamento
      frmAguarde.Max := cdsHistMov.RecordCount;
      frmAguarde.Pos := 0;

      frmAguarde.Mostra('Processando, Aguarde...');

      Mostra := True;
   end;

   cdsHistMov.First;
   while not(cdsHistMov.EOF) do
   begin
      if cdsHistMov.FieldByName('HMETIPOMOV').AsInteger = 4 then
      begin
         cdsHistMov.Edit;
         cdsHistMovFLGESCOLHA.AsInteger := 1;
         cdsHistMov.Post;
      end;

      cdsHistMov.Next;

      if Mostra = True then
      begin
         // Atualiza tela de acompanhamento
         frmAguarde.Pos := frmAguarde.Pos + 1;
      end;
   end;

   if cdsHistMov.Active then cdsHistMov.First;

   cdsHistMov.EnableControls;

   if Mostra = True then frmAguarde.Apaga;
end;



procedure TfrmExecTrataDivergNovo.btnPrestacaoSimClick(Sender: TObject);
var
   iParcela    : Integer;
   IDContrato  : Extended;
begin
   inherited;

   iParcela    := cdsHistMovHMEPARCELA.AsInteger;
   IDContrato  := cdsHistMovIDCONTRATOEMPTMO.AsFloat;

   // ----------------------------------------------------------------------------------------------
   // 1 - Localiza o primeiro registro da parcela
   // ----------------------------------------------------------------------------------------------
   while not(cdsHistMov.BOF) and (cdsHistMovHMEPARCELA.AsInteger = iParcela) and (cdsHistMovIDCONTRATOEMPTMO.AsFloat = IDContrato) do
   begin
      cdsHistMov.Prior;
   end;
   // ----------------------------------------------------------------------------------------------

   // ----------------------------------------------------------------------------------------------
   // 2 - Vai até o fim, marcando todos os registros da parcela
   // ----------------------------------------------------------------------------------------------
   repeat
      if cdsHistMovHMEPARCELA.AsInteger = iParcela then
      begin
         cdsHistMov.Edit;
         cdsHistMovFLGESCOLHA.AsInteger := 1;
         cdsHistMov.Post;
      end;

      cdsHistMov.Next;
   until
      (cdsHistMovHMEPARCELA.AsInteger <> iParcela) or
      (cdsHistMovIDCONTRATOEMPTMO.AsFloat <> IDContrato) or
      (cdsHistMov.EOF);
   // ----------------------------------------------------------------------------------------------
end;



procedure TfrmExecTrataDivergNovo.btnPrestacaoNaoClick(Sender: TObject);
var
   iParcela    : Integer;
   IDContrato  : Extended;
begin
   inherited;

   iParcela    := cdsHistMovHMEPARCELA.AsInteger;
   IDContrato  := cdsHistMovIDCONTRATOEMPTMO.AsFloat;

   // ----------------------------------------------------------------------------------------------
   // 1 - Localiza o primeiro registro da parcela
   // ----------------------------------------------------------------------------------------------
   while not(cdsHistMov.BOF) and (cdsHistMovHMEPARCELA.AsInteger = iParcela) and (cdsHistMovIDCONTRATOEMPTMO.AsFloat = IDContrato) do
   begin
      cdsHistMov.Prior;
   end;
   // ----------------------------------------------------------------------------------------------

   // ----------------------------------------------------------------------------------------------
   // 2 - Vai até o fim, marcando todos os registros da parcela
   // ----------------------------------------------------------------------------------------------
   repeat
      if cdsHistMovHMEPARCELA.AsInteger = iParcela then
      begin
         cdsHistMov.Edit;
         cdsHistMovFLGESCOLHA.AsInteger := 0;
         cdsHistMov.Post;
      end;

      cdsHistMov.Next;
   until
      (cdsHistMovHMEPARCELA.AsInteger <> iParcela) or
      (cdsHistMovIDCONTRATOEMPTMO.AsFloat <> IDContrato) or
      (cdsHistMov.EOF);
   // ----------------------------------------------------------------------------------------------
end;



procedure TfrmExecTrataDivergNovo.MontaQuery;
var
   sSQL           : String;
   sFlgTipoDiverg : String;
   sAnoMesDiverg  : String;
begin
   sFlgTipoDiverg    := '';
   sAnoMesDiverg     := FormatFloat('0000', DBspnAno.Value) + FormatFloat('00', cboMes.ItemIndex + 1);


   // Busca Registros a processar

   if molContratoEmptmo.IDContrato > 0 then sSQL :=
      //Wylliam Leite da Silva SOL 253185 PPM 771995 - Início
      'SELECT  '                            + #13
      //Wylliam Leite da Silva SOL 253185 PPM 771995 - Fim
   else sSQL :=
      'SELECT '                                                                                             + #13;

   sSQL := sSQL +
   '  0 AS FLGESCOLHA, '                                                                                    + #13 +
   '  HME.IDCONTRATOEMPTMO,'                                                                                + #13 +
   '  NVL(DEP.MATRICULA, ELP.MATRICULA) AS MATRICULA,'                                                      + #13 +
   '  DECODE(NVL(PEP.FLGEXCEPCIONAL, 0), 0, ( '                                                             + #13 +
   '                                         TO_CHAR(NVL(HME.HMEPARCELA, 0),      ''00'') || '' / '' || '   + #13 +
   '                                         TO_CHAR(NVL(HME.HMENUMPARCELAS, 0),  ''00'') '                 + #13 +
   '                                         ), '                                                           + #13 +
   '                                      1, ( '                                                            + #13 +
   '                                         TO_CHAR(NVL(HME.HMEPARCELAALT, 0),   ''00'') || '' / '' || '   + #13 +
   '                                         TO_CHAR(NVL(HME.HMEPARCELA, 0),      ''00'') || '' / '' || '   + #13 +
   '                                         TO_CHAR(NVL(HME.HMENUMPARCELAS, 0),  ''00'') '                 + #13 +
   '                                         ) '                                                            + #13 +
   '         ) AS CONCAT_PARCELAS, '                                                                        + #13 +
   '  NVL(HME.HMEVLRPREVISTO,0) AS HMEVLRPREVISTO,'                                                         + #13 +
   '  NVL(HME.HMEVLREFETIVO,0) AS HMEVLREFETIVO,'                                                           + #13 +
   '  HME.HMEPARCELA'                                                                                       + #13 +
   'FROM'                                                                                                   + #13 +
   '   PESSOA          PES,'                                                                                + #13 +
   '   PARTPREVPLAN    PPP,'                                                                                + #13 +
   '   CONTRATOEMPTMO  CON,'                                                                                + #13 +
   '   ELEGPATRO       ELP,'                                                                                + #13 +
   '   DEPENTIT        DEP,'                                                                                + #13 +
   '   SITPART         STP,'                                                                                + #13 +
   '   PARAMEMPTMO     PEP,'                                                                                + #13 +
   '   TIPOCONTREMPTMO TC,'                                                                                 + #13 +
   '   TIPOEMPTMO      TE,'                                                                                 + #13 +
   '   ('                                                                                                   + #13 +
   '    SELECT'                                                                                             + #13 +
   '        HME.IDCONTRATOEMPTMO,'                                                                          + #13 +
   '        HME.HMEPARCELA,'                                                                                + #13 +
   '        HME.HMEPARCELAALT,'                                                                             + #13 +
   '        HME.HMENUMPARCELAS,'                                                                            + #13 +
   '        SUM(HME.HMEVLRPREVISTO) AS HMEVLRPREVISTO,'                                                     + #13 +
   '        SUM(HME.HMEVLREFETIVO)  AS HMEVLREFETIVO'                                                       + #13 +
   '    FROM'                                                                                               + #13 +
   '        PREPARAHISTMOVEMPTMO   HME,'                                                                    + #13 + // 92334 Daniel Begnami
// 92334 Daniel Begnami '        HISTMOVEMPTMO   HME,'                                                                    + #13 +
   '        CONTRATOEMPTMO  CON,'                                                                           + #13 +
   '        TIPOSUSPEMPTMO  TSE'                                                                            + #13 +
   '    WHERE'                                                                                              + #13 +
   '        HME.FLGDIVERGPEND        = 1'                                                                   + #13 +
   '    AND ( HME.HMECENTRALIZA      = 1 OR HME.HMEDESTACADO       = 1 )'                                   + #13 +
   '    AND (LTRIM(RTRIM(TO_CHAR(HME.HMEANOCOBRANCA, ''0000''))) '                                          +
   '      || LTRIM(RTRIM(TO_CHAR(HME.HMEMESCOBRANCA, ''00''))) ) < ' + sAnoMesDiverg                        + #13 +
   '    AND NVL(HME.FLGESTORNADO, 0) = 0'                                                                   + #13 +
   '    AND NVL(HME.FLGABONADO, 0)   = 0'                                                                   + #13 +
   '    AND NVL(HME.FLGQUITADO, 0)   = 0'                                                                   + #13 +
   '    AND HME.HMETIPOMOV         IN (1, 2, 3, 4, 7) '                                                     + #13;

   // 1 - Valores ainda não recebidos
   if chkValorEmAberto.Checked then
   begin
      if sFlgTipoDiverg <> '' then sFlgTipoDiverg := sFlgTipoDiverg + ',';
      sFlgTipoDiverg := sFlgTipoDiverg  + '1';
   end;

   // 2 - Recebimentos inesperados
   if chkRecebInesperado.Checked then
   begin
      if sFlgTipoDiverg <> '' then sFlgTipoDiverg := sFlgTipoDiverg + ',';
      sFlgTipoDiverg := sFlgTipoDiverg  + '2';
   end;

   // 3 - Valores recebidos a menor
   if chkRecebidoMenor.Checked then
   begin
      if sFlgTipoDiverg <> '' then sFlgTipoDiverg := sFlgTipoDiverg + ',';
      sFlgTipoDiverg := sFlgTipoDiverg  + '3';
   end;

   // 4 - Valores recebidos a maior
   if chkRecebidoMaior.Checked then
   begin
      if sFlgTipoDiverg <> '' then sFlgTipoDiverg := sFlgTipoDiverg + ',';
      sFlgTipoDiverg := sFlgTipoDiverg  + '4';
   end;

   // 5 - Divergência de datas
   if chkDivergData.Checked then
   begin
      if sFlgTipoDiverg <> '' then sFlgTipoDiverg := sFlgTipoDiverg + ',';
      sFlgTipoDiverg := sFlgTipoDiverg  + '5';
   end;

   // 6 - Valores não recebidos
   if chkNaoSeraoPagos.Checked then
   begin
      if sFlgTipoDiverg <> '' then sFlgTipoDiverg := sFlgTipoDiverg + ',';
      sFlgTipoDiverg := sFlgTipoDiverg  + '6';
   end;

   if sFlgTipoDiverg <> '' then sSQL := sSQL +
   '    AND HME.FLGTIPODIVERG IN (' + sFlgTipoDiverg + ') '                                                 + #13;

   sSQL := sSQL +
   '    AND HME.IDCONTRATOEMPTMO     = CON.IDCONTRATOEMPTMO'                                                + #13 +
   '    AND CON.FLGSITUACAO          NOT IN (''C'', ''Q'' )'                                                + #13 +
   '    AND HME.IDTIPOSUSPEMPTMO     = TSE.IDTIPOSUSPEMPTMO(+)'                                             + #13 +
   '    AND ('                                                                                              + #13 +
   '         NVL(HME.FLGSUSPENSAO, 0) = 0 OR'                                                               + #13 +
   '         (NVL(HME.FLGSUSPENSAO, 0) <> 0 AND NVL(TSE.FLGEMABERTO, 0) = 1)'                               + #13 +
   '        )'                                                                                              + #13;

   // 92334 Daniel Begnami
  {if chkInArquivo.Checked then sSQL := sSQL +
   '    AND CON.IDCONTRATOEMPTMO     IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) '                   + #13;

   if chkNotInArquivo.Checked then sSQL := sSQL +
   '    AND CON.IDCONTRATOEMPTMO     NOT IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) '               + #13;

   // Fim }

   if molMutuario.IDBenef > 0 then sSQL := sSQL +
   '    AND CON.IDBENEF              = ' + FormatFloat('#0', molMutuario.IDBenef)                           + #13;

   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '    AND CON.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)                  + #13;

   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '    AND CON.IDTIPOCONTREMPTMO    = ' + DBcboTipoContrato.LookupValue                                    + #13;

   if DBcboPatro.LookupValue <> '' then sSQL := sSQL +
   '    AND CON.IDPATRO              = ' + DBcboPatro.LookupValue                                           + #13;

   if DBcboPlano.LookupValue <> '' then sSQL := sSQL +
   '    AND CON.IDPLANOPREV          = ' + DBcboPlano.LookupValue                                           + #13;

   if chkCobranca.Checked then sSQL := sSQL +
   '    AND HME.HMEMESCOBRANCA       = ' + FormatFloat('00', cboMesCobranca.ItemIndex + 1)                  + #13 +
   '    AND HME.HMEANOCOBRANCA       = ' + FormatFloat('0000', dbspAnoCob.Value)                            + #13;

   if chkCompetencia.Checked then sSQL := sSQL +
   '    AND HME.HMEMESCOMPETENCIA    = ' + FormatFloat('00', cboMesCompet.ItemIndex + 1)                    + #13 +
   '    AND HME.HMEANOCOMPETENCIA    = ' + FormatFloat('0000', dbspAnoComp.Value)                           + #13;

   sSQL := sSQL +
   '    GROUP BY'                                                                                           + #13 +
   '        HME.IDCONTRATOEMPTMO,'                                                                          + #13 +
   '        HME.HMEPARCELA,'                                                                                + #13 +
   '        HME.HMEPARCELAALT,'                                                                             + #13 +
   '        HME.HMEPARCELA,'                                                                                + #13 +
   '        HME.HMENUMPARCELAS'                                                                             + #13 +
   '   ) HME'                                                                                               + #13 +
   'WHERE'                                                                                                  + #13 +
   '    PEP.IDEMPRESAPROP       = ' + FormatFloat('#0', Sistema.IDEmpresa)                                  + #13 +
   'AND TE.IDEMPRESAPROP        = ' + FormatFloat('#0', Sistema.IDEmpresa)                                  + #13 +
   //BRUNO AZEVEDO SOL 133024 KINTANA 771123
   //'AND PPP.FLGDESATIVADO       = 0'                                                                        + #13 +
   //BRUNO AZEVEDO SOL 133024 KINTANA 771123
   'AND CON.IDPATRO             = PPP.IDPESSJUR'                                                            + #13 +
   'AND CON.IDPESSOA            = PPP.IDPESSOA'                                                             + #13 +
   'AND PPP.IDSITPART           = STP.IDSITPART'                                                            + #13 +
   'AND CON.IDBENEF             = PES.IDPESSOA'                                                             + #13 +
   'AND CON.IDTIPOCONTREMPTMO   = TC.IDTIPOCONTREMPTMO'                                                     + #13 +
   'AND TC.IDTIPOEMPTMO         = TE.IDTIPOEMPTMO'                                                          + #13 +
   'AND CON.IDPATRO             = ELP.IDPESSJUR'                                                            + #13 +
   'AND CON.IDPESSOA            = ELP.IDPESSOA'                                                             + #13 +
   'AND CON.IDPESSOA            = DEP.IDTITULAR'                                                            + #13 +
   'AND CON.IDBENEF             = DEP.IDPESSOA'                                                             + #13 +
   'AND HME.IDCONTRATOEMPTMO    = CON.IDCONTRATOEMPTMO'                                                     + #13 +
   //BRUNO AZEVEDO SOL 133024 KINTANA 771123
   'AND  (ppp.idplanoprev = (SELECT MAX(ppp2.idplanoprev)'                                                  + #13 +
   '                                FROM partprevplan ppp2'                                                 + #13 +
   '                                WHERE ppp2.flgdesativado = 0'                                           + #13 +
   '                                AND   ppp2.idpessoa = ppp.idpessoa)'                                    + #13 +
   '             OR'                                                                                        + #13 +
   '            (PPP.FLGDESATIVADO = 1'                                                                     + #13 +
   '             AND NOT EXISTS (SELECT 1 FROM partprevplan ppp1'                                           + #13 +
   '                             WHERE ppp1.idpessoa = ppp.idpessoa'                                        + #13 +
   '                             AND ppp1.flgdesativado = 0)'                                               + #13 +
   '             AND (ppp.idsitplanoprev = 25'                                                              + #13 +
   '                  OR'                                                                                   + #13 +
   '                 (ppp.idplanoprev = (SELECT MAX(ppp1.idplanoprev)'                                      + #13 +
   '                                     FROM partprevplan ppp1'                                            + #13 +
   '                                     WHERE ppp1.idpessoa = ppp.idpessoa'                                + #13 +
   '                                     AND   nvl(ppp1.datacancelamento,TRIM(SYSDATE)) ='                  + #13 +
   '                                                       (SELECT nvl(MAX(ppp2.datacancelamento),TRIM(SYSDATE))' + #13 +
   '                                                        FROM partprevplan ppp2'                         + #13 +
   '                                                        WHERE ppp2.idpessoa = ppp1.idpessoa)'           + #13 +
   '                                     AND   NOT EXISTS (SELECT 1 FROM partprevplan ppp2'                 + #13 +
   '                                                       WHERE ppp2.idpessoa = ppp1.idpessoa'             + #13 +
   '                                                       AND   ppp2.idsitplanoprev = 25))))))';
   //BRUNO AZEVEDO SOL 133024 KINTANA 771123
   
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   'AND TC.IDTIPOEMPTMO          = ' + DBcboTipoEmptmo.LookupValue                           + #13;

   sSQL := sSQL +
   'ORDER BY'                                                                                + #13;

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then sSQL := sSQL +
   '   MATRICULA, HME.IDCONTRATOEMPTMO, HME.HMEPARCELA '  + #13
   else sSQL := sSQL +
   '   HME.IDCONTRATOEMPTMO, HME.HMEPARCELA'              + #13;

   // abre a query HistMovVirtual com os parâmetros passados
   qryHistMov.Close;
   qryHistMov.SQL.Text := sSQL;

 //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
 //qryHistMov.SQL.SaveToFile(Sistema.TempDir + 'EP-Tratamento de Divergencia.txt');
   qryHistMov.SQL.SaveToFile(ftempregra + '\' + 'EP-Tratamento de Divergencia.txt');
end;

procedure TfrmExecTrataDivergNovo.AbreItens(const iContrato: Extended; iParcela: Integer; bTodos : Boolean);
begin
   with qryItens do
   begin
      LimpaParametros(qryItens);
      ParamByName('PIDCONTRATOEMPTMO').AsFloat  := iContrato;
      ParamByName('PHMEPARCELA').AsInteger      := iParcela;
      ParamByName('PTODOS').AsInteger           := Ord(bTodos);

      // André Pontes - pendência 20261 - 07/10/2005
      if dtmEmptmo.qryParamEmptmoFLGABONODIVERG.AsInteger = 1 then
      begin
         ParamByName('PABONODIVERG').AsInteger := 1;
      end;
      // FIM André Pontes - pendência 20261 - 07/10/2005
      Open;
      First;
   end;
end;

// 92334 Daniel Begnami
function TfrmExecTrataDivergNovo.PendenteEfetivacao: boolean;
begin

  MostraEspera('Verificando se existem itens a serem efetivados - Aguarde...');

  with qryAux do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT COUNT(*) AS QTD FROM PREPARAHISTMOVEMPTMO WHERE FLGSITREG IN (''I'',''A'') AND FLGEFETIVADO = ''N'' ');
    Open;
  end;

  EscondeEspera;

  if (qryAux.FieldByName('QTD').AsInteger > 0) then
  begin

    if MsgDlg('ATENÇÃO: Existem ' + IntToStr(qryAux.FieldByName('QTD').AsInteger) + ' itens na tabela temporária a serem EFETIVADOS. ' + #13 + #13 +
              'Se você optar por prosseguir (botão <SIM>), os itens serão apagados para o novo tratamento!' + #13 + #13 +
              'Case você queira apenas EFETIVAR esses itens, Clique no botão <NÃO> e em seguida no botão <EFETIVAR>.' + #13 + #13 +
              'Deseja realmente prosseguir?', 'Empréstimo', mtWarning, [mbYes, mbNo], 0) = mrNo then
    begin
      LogToFile('Existem itens a serem efetivados, NÃO Proceguir', 'Verifica_EFETIVAÇÃO_pendente.log', True, True, True);
      btEfetiva.enabled := True;
      btEfetiva.SetFocus;
      Result := False
    end
    else
    begin
      Result := True;
      btEfetiva.enabled := False;
      LogToFile('Existem itens a serem efetivados, PROCEGUIR', 'Verifica_EFETIVAÇÃO_pendente.log', True, True, True);
    end;
  end
  else
  begin
    Result := True;
    LogToFile('Não existem itens a serem efetivados', 'Verifica_EFETIVAÇÃO_pendente.log', True, True, True);
  end;

end;
// Fim


// 92334 Daniel Begnami
function TfrmExecTrataDivergNovo.Exec_SP_Preparo(pAnoMes, pAnoMesCobra, pAnoMesComp  : String ; pCargaIN, pCargaNOTIN : Integer ; sIDContrato : String ; iIDTipoContrato : Integer) : Boolean;  // 92334 Daniel Begnami
var
  SP_ERRO : String;
  SP_PROC : TStoredProc;
begin
  try
    LogToFile('Antes do PREPARO dos dados a serem processados', 'Inicio-SP_PREPARADIVERGENCIA.log', True, True, True);

    MostraEspera('PREPARO - Preparando dados para processamento - Aguarde...');

    SP_PROC := TStoredProc.Create(Application);
    SP_PROC.DatabaseName  := 'BaseDados';

    SP_PROC.StoredProcName := 'PKG_PREV_EP_TRATADIVERGENCIA.SP_PREPARADIVERGENCIA';

    SP_PROC.Params.CreateParam(ftString,   'pANOMES',           ptInput);
    //Ádler Souza - SOL 130879 - KINTANA 738508
    SP_PROC.Params.CreateParam(ftString,   'pANOMESCOBRA',      ptInput);
    SP_PROC.Params.CreateParam(ftString,   'pANOMESCOMP',   ptInput);
    //Fim - Ádler Souza - SOL 130879 - KINTANA 738508
    SP_PROC.Params.CreateParam(ftInteger,   'pCARGA_IN',         ptInput);
    SP_PROC.Params.CreateParam(ftInteger,   'pCARGA_NOTIN',      ptInput);
    // 124889 Daniel Begnami
    SP_PROC.Params.CreateParam(ftString,   'pIDCONTRATO',       ptInput);
    SP_PROC.Params.CreateParam(ftinteger,   'pIDTIPOCONTRATO',  ptInput);
    // FIM
    SP_PROC.Params.CreateParam(ftString,   'pOutERRO',          ptOutput);

    SP_PROC.ParamByName('pANOMES').AsString       := pAnoMes;

    //Ádler Souza - SOL 130879 - KINTANA 738508
    SP_PROC.ParamByName('pANOMESCOBRA').AsString       := pAnoMesCobra;
    SP_PROC.ParamByName('pANOMESCOMP').AsString    := pAnoMesComp;
    //Fim - Ádler Souza - SOL 130879 - KINTANA 738508

    //126361 Jéssica Lana
    SP_PROC.ParamByName('pCARGA_IN').AsInteger    := pCargaIN;
    SP_PROC.ParamByName('pCARGA_NOTIN').AsInteger := pCargaNOTIN;
    // Fim  126361

    // 124889 Daniel Begnami
    SP_PROC.ParamByName('pIDCONTRATO').AsString      := sIDContrato;
    SP_PROC.ParamByName('pIDTIPOCONTRATO').AsInteger := iIDTipoContrato;
    // FIM

    SP_PROC.Prepare;
    SP_PROC.ExecProc;

    SP_ERRO := SP_PROC.ParamByName('pOutERRO').AsString;

    SP_PROC.Close;

    EscondeEspera;
    LogToFile('Após o PREPARO dos dados a serem processados - '+SP_ERRO , 'Fim-SP_PREPARADIVERGENCIA.log', True, True, True);

    if copy(Trim(SP_ERRO),1,2) = 'OK' then
      Result := True
    else
    begin
      Result := False;
      ShowMessage(SP_ERRO);
    end;

  finally
    FreeAndNil(SP_PROC);
  end;
end;
// Fim

// 92334 Daniel Begnami
function TfrmExecTrataDivergNovo.Exec_SP_Efetiva: Boolean;
var
  SP_ERRO : String;
  SP_PROC : TStoredProc;
begin
  try
    LogToFile('Antes da EFETIVAÇÃO dos dados que foram processados na tabela temporária', 'Inicio-SP_EFETIVADIVERGENCIA.log', True, True, True);

    MostraEspera('EFETIVAÇÃO - Efetivando dados que foram processados - Aguarde...');

    SP_PROC := TStoredProc.Create(Application);
    SP_PROC.DatabaseName  := 'BaseDados';

    SP_PROC.StoredProcName := 'PKG_PREV_EP_TRATADIVERGENCIA.SP_EFETIVADIVERGENCIA';

    SP_PROC.Params.CreateParam(ftString,   'pOutERRO',      ptOutput);
    SP_PROC.Params.CreateParam(ftDate  ,   'pDATAATUALIZA', ptInput);

    SP_PROC.ParamByName('pDATAATUALIZA').AsDate := edtDataLancto.date;

    SP_PROC.Prepare;
    SP_PROC.ExecProc;

    SP_ERRO := SP_PROC.ParamByName('pOutERRO').AsString;

    SP_PROC.Close;

    EscondeEspera;
    LogToFile('Após a EFETIVAÇÃO dos dados que foram processados na tabela temporária - '+SP_ERRO , 'Fim-SP_EFETIVADIVERGENCIA.log', True, True, True);

    if copy(Trim(SP_ERRO),1,2) = 'OK' then
      Result := True
    else
    begin
      Result := False;
      ShowMessage(SP_ERRO);
    end;

  finally
    FreeAndNil(SP_PROC);
  end;
end;
// Fim

// 92334 Daniel Begnami
procedure TfrmExecTrataDivergNovo.btEfetivaClick(Sender: TObject);
begin
  inherited;

  if UFuncoesEmptmo.bBuscaMutuario then
     begin
        MessageBox(handle,'O processo não poderá ser executado.'+#13#10+
                          'O usuário é o próprio mutuário do '+
                          'contrato de empréstimo!','Atenção',MB_ICONWARNING + MB_OK);
        Abort;
     end;


  btEfetiva.Enabled := False;
  if not Exec_SP_Efetiva then
end;
// Fim

end.
