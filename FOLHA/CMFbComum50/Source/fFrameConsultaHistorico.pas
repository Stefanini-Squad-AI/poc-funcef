// *************************************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ********************************************
// *************************************************************************************************
//***************************************************************************************************
//--------------------------------------------------------------------------------------------------
// No.        : MIGRACAO-ORACLE
// Data       : 15/10/2025
// Autor      : Edilaine
// Descrição  : remover ; e fazer cast em campo da consulta em QryObtemBasePagamento
//--------------------------------------------------------------------------------------------------
// Data       : 22/03/2023
// SIG        : 133922
// Autor      : Andre Imakawa
// Descrição  : Ajuste na Consulta de Histórico de Pagamento para retornar recebedores Pessoa Jurídica.
//***************************************************************************************************
// Autor(a)  : Ewerton Beltramini
// Data      : 02/10/2019
// Pendencia : 92331
// Alteração : Alteração nos componentes:  QryObtemBasePagamento;
//             Para carregar os dados consolidados;
//--------------------------------------------------------------------------------------------------
// Data       : 27/05/2019
// SIG        : 86762
// Autor      : Andre Imakawa
// Descrição  : Inserido o campo REFERENCIA na query da rotina MontaQryDet e MontaQryDetAgrupado
//***************************************************************************************************
// Data       : 19/02/2018
// SIG        : SIG TIBERO
// Autor      : Everson Luiz Pereira da Cunha
// Descrição  : Ajustes nos SQL, incluindo os alias nas tabelas/campos.
//              Retirada de INDEX, +rule etc.
//              Melhoria realizada para adaptação ao TIBERO.
//***************************************************************************************************
// Data       : 07/02/2018
// SIG        : 63028
// Autor      : Andre Imakawa
// Descrição  : Correção DFM (SQL = QryObtemBasePagamento)
//              Corrigido SQL do MontaQryDet, pois falta tabela PERFILINVEST no FROM.
//***************************************************************************************************
// Data       : 27/11/2017
// SIG        : 56702
// Autor      : Peterson Victor
// Descrição  : Alterações para tratar perfil de investimento
//***************************************************************************************************
//alteração   : {.dfm TabSheet2), AjustaPosicao, MostraBasePagamento
//SIG         : 42986
//Responsável : Edilaine 
//Data        : 04/08/2017
//Descrição   : ajustes para apresentação maximizada dos paineis
//****************************************************************************************
//Pendência   : SOL 207789/16616 PPM 554285
//Data        : 05/07/2015
//Responsável : Fernando Xavier
//Alteração   : Criação de Nova Funcionalidade para Batimento de Retorno das Informações da
//              Fita de Crédito
//****************************************************************************************
// Autor(a)  : Fernando Xavier
// Rotina    : MontaQryMaster e MontaQryMasterAgrupado
// Data      : 01/10/2013
//Pendência  : SOL 217759 KTN 2047999
// Alteração : alimentação o campo "DARF" está sendo feito com base no código do
//             darf da provdesc, quando correto seria buscar da histrubsal.
//------------------------------------------------------------------------------
// Autor(a)  : Claudio Faria
// Rotina    : MontaQryMaster e MontaQryMasterAgrupado
// Data      : 16/06/2008
// Pendencia : 27952
// Alteração : Ajuste na rotina que gera a consulta de Prévia e histórico de pagamento.
//------------------------------------------------------------------------------
// Autor(a)  : Claudio Faria
// Rotina    : MontaQryMaster e MontaQryMasterAgrupado
// Data      : 06/05/2008
// Pendencia : 27838
// Alteração : Ajuste na rotina que gera a consulta de Prévia e histórico de pagamento.
//------------------------------------------------------------------------------
// Autor(a)  : Claudio Faria
// Rotina    : MontaQryDet e MontaQryDetAgrupado
// Data      : 19/02/2008
// Pendencia : 27415
// Alteração : Ajuste na ordenação das informações da consulta de histórico de pagamento.
//------------------------------------------------------------------------------
// Autor(a)  : Claudio Faria
// Rotina    : MontaQryDet e MontaQryDetAgrupado
// Data      : 17/01/2008
// Pendencia : 26150
// Alteração : Ajuste na duplciação das informações da consulta
//------------------------------------------------------------------------------
// Autor(a)  : Claudio Faria
// Rotina    : MontaQryDet e MontaQryDetAgrupado
// Data      : 27/11/2007
// Pendencia : 26869
// Alteração : Não Permitir que o valor de provento e desconto sejam nulos.
//------------------------------------------------------------------------------
// Autor(a)  : Bruno Bastos
// Rotina    : MontaQryDet e MontaQryDetAgrupado
// Data      : 02/08/2007
// Pendencia : 23758
// Alteração : Inclusão de alguns campos.
//------------------------------------------------------------------------------
// Autor(a)  : Claudio Faria
// Rotina    : MontaQryMaster e MontaQryMasterAgrupado
// Data      : 22/06/2007
// Pendencia : 21962
// Alteração : Ajustar a consulta para mostrar o favorecido qdo EPP.
//------------------------------------------------------------------------------
// Autor(a)  : Paulo Ramos
// Rotina    : MontaQryDet e MontaQryDetAgrupado
// Data      : 01/09/2006
// Pendencia : 22941
// Alteração : Colocar o plano contábil nas consultas de detalhe de rubricas.
//------------------------------------------------------------------------------
unit fFrameConsultaHistorico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Wwdatsrc, DBTables, Wwquery, wwdblook, StdCtrls, DBCtrls, Mask,
  wwdbedit, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, uComumFolha, ComCtrls, uSistema, shellapi,
  DBGrids, DBClient, uCMClientDataSet, uCmSqlParams;

type
  TfrmFrameConsultaHistorico = class(TFrame)
    qryPrevia: TwwQuery;
    dsPrevia: TwwDataSource;
    dsRubricasDetalhe: TwwDataSource;
    qryRubricasDetalhe: TwwQuery;
    qryAux: TwwQuery;
    dsFator: TDataSource;
    qryFator: TwwQuery;
    QryObtemBasePagamento: TwwQuery; //SOL 207789/16616 PPM 554285
    dsSelecao: TwwDataSource;
    qrySelecao: TwwQuery;
    qrySelecaoIDHSTFOLHABENEF: TFloatField;
    qrySelecaoMESCOBRANCA: TStringField;
    qrySelecaoDATAPAGAMENTO: TDateTimeField;
    qrySelecaoHISTORICO: TStringField;
    pnlFundo: TPanel;
    PnlValores: TPanel;
    LblProventos: TLabel;
    LblDescontos: TLabel;
    LblValLiquido: TLabel;
    pnlProventos: TPanel;
    pnlDescontos: TPanel;
    pnlLiquido: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    dbgDetalhe: TwwDBGrid;
    wwDBgrid1: TwwDBGrid;
    PnlDetalhes: TPanel;
    LblDataNasc: TLabel;
    LblNumDep: TLabel;
    LblBanco: TLabel;
    LblAgencia: TLabel;
    LblContaCorrente: TLabel;
    LblArqTxt: TLabel;
    LblPortForma: TLabel;
    LblSitucao: TLabel;
    lblVersaoEstorno: TLabel;
    dbedPortForma: TwwDBEdit;
    dbedVersaoEstorno: TwwDBEdit;
    dbedSituacao: TwwDBEdit;
    dbedDataNasc: TwwDBEdit;
    dbedNumDepIR: TwwDBEdit;
    dbchIsentoIR: TDBCheckBox;
    dbedBanco: TwwDBEdit;
    dbedAgencia: TwwDBEdit;
    dbedContaCorrente: TwwDBEdit;
    dbedNomeArqTxt: TwwDBEdit;
    PnlSRB: TPanel;
    pnlMostraSRB: TPanel;
    lblValorSRB: TLabel;
    lblValorINSS: TLabel;
    lblSuplementacao: TLabel;
    pnlValorSRB: TPanel;
    pnlValorINSS: TPanel;
    pnlValorSupl: TPanel;
    PnlHistorico: TPanel;
    dbgHistorico: TwwDBGrid;
    DBGridRecebedor: TwwDBGrid;
    Splitter1: TSplitter;
    edtDtInicio: TEdit;
    edtDtFinal: TEdit;
    lblDtInicio: TLabel;
    lblDtFinal: TLabel;
    chkBenefProvisorio: TDBCheckBox;
    pnlFavorecido: TPanel;
    LB: TLabel;
    wwDBEdit1: TwwDBEdit;
    TbsBasePagamento: TTabSheet; //SOL 207789/16616 PPM 554285
    TbsConciliacaoCredito: TTabSheet; //SOL 207789/16616 PPM 554285
    PnlBasePagamento: TPanel; //SOL 207789/16616 PPM 554285
    dbgBasePagamento: TDBGrid;//SOL 207789/16616 PPM 554285
    PnlConcCredito: TPanel;//SOL 207789/16616 PPM 554285
    dbgConcCredito: TDBGrid;
    //QryObtemBasePagamentoIDBASEPGTO: TFloatField;    // Ewerton Beltramini - SIG92331
    QryObtemBasePagamentoIDTITULAR: TFloatField;
    QryObtemBasePagamentoIDPESSOA: TFloatField;
    QryObtemBasePagamentoMATRICULA: TStringField;
    QryObtemBasePagamentoDATAPAGAMENTO: TDateTimeField;
    QryObtemBasePagamentoMES: TStringField;
    QryObtemBasePagamentoMESCOBRANCA: TStringField;
    QryObtemBasePagamentoPRAZOMEDIOPONDERADO: TFloatField;
    QryObtemBasePagamentoPERCENTUALIRREGRESSIVO: TFloatField;
    QryObtemBasePagamentoBASECALCIRREGRESSIVO: TFloatField;
    QryObtemBasePagamentoVLRIRREGRESSIVO: TFloatField;
    QryObtemBasePagamentoVLRBRUTO: TFloatField;
    QryObtemBasePagamentoVLRDESCONTO: TFloatField;
    QryObtemBasePagamentoVLRLIQUIDO: TFloatField;
    QryObtemBasePagamentoTIPOFOLHA: TFloatField;
    QryObtemBasePagamentoFLGEFETIVADO: TFloatField;
    QryObtemBasePagamentoIDHSTFOLHABENEF: TFloatField;
    //QryObtemBasePagamentoTRGUSERINCLUSAO: TStringField;  // Ewerton Beltramini - SIG92331
    //QryObtemBasePagamentoTRGDTINCLUSAO: TDateTimeField;  // Ewerton Beltramini - SIG92331
    //QryObtemBasePagamentoTRGUSERALTERACAO: TStringField; // Ewerton Beltramini - SIG92331
    //QryObtemBasePagamentoTRGDTALTERACAO: TDateTimeField; // Ewerton Beltramini - SIG92331
    QryObtemBasePagamentoFLGISENTOIRRF: TFloatField;
    QryObtemBasePagamentoFLGMOLESTIAGRAVE: TFloatField;
    QryObtemBasePagamentoDATAINICIOMOLESTIA: TDateTimeField;
    QryObtemBasePagamentoDATAFIMMOLESTIA: TDateTimeField;
    QryObtemBasePagamentoNUMPROCINSS: TStringField;
    QryObtemBasePagamentoFLGSOMAIRSUPINSS: TFloatField;
    QryObtemBasePagamentoNUMDEPIRRF: TFloatField;
    QryObtemBasePagamentoNUMBANCO: TStringField;
    QryObtemBasePagamentoNUMAGENCIA: TStringField;
    QryObtemBasePagamentoCONTACORRENTE: TStringField;
    QryObtemBasePagamentoDATANASC: TDateTimeField;
    QryObtemBasePagamentoCODPORTFORMA: TFloatField;
    QryObtemBasePagamentoNUMDOCUMENTO: TStringField;
    //QryObtemBasePagamentoIDLOTE: TFloatField;          // Ewerton Beltramini - SIG92331
    qryConcCreditoEfetuado: TwwQuery;
    qryConcCreditoEfetuadoIDHSTREGULARIZACAOFOLHA: TFloatField;
    qryConcCreditoEfetuadoIDCADEVENTOSDEREGULARIZACAO: TFloatField;
    qryConcCreditoEfetuadoDESCRICAOEVENTO: TStringField;
    qryConcCreditoEfetuadoARQUIVOREGULARIZACAO: TBlobField;
    qryConcCreditoEfetuadoDATAREGULARIZACAO: TDateTimeField;
    qryConcCreditoEfetuadoTIPOREGULARIZACAO: TStringField;
    qryConcCreditoEfetuadoARQUIVOREGULARIZACAO_1: TBlobField;
    qryConcCreditoEfetuadoNUMEROAP: TFloatField;
    qryConcCreditoEfetuadoDATAVENCTOAP: TDateTimeField;
    qryConcCreditoEfetuadoNUMEROAR: TFloatField;
    qryConcCreditoEfetuadoDATAVENCTOAR: TDateTimeField;
    qryConcCreditoEfetuadoNUMBANCO: TStringField;
    qryConcCreditoEfetuadoNUMAGENCIA: TStringField;
    qryConcCreditoEfetuadoCONTABANCARIA: TStringField;
    qryConcCreditoEfetuadoOBSERVACAO: TMemoField;
    qryConcCreditoEfetuadoEXTENSAOARQUIVO: TStringField;
    dsConcCreditoEfetuado: TwwDataSource;
    qryConcCreditoEfetuadoNOMEARQUIVO: TStringField;
    qryConcCreditoEfetuadoCODIGORETORNO: TStringField;
    QryObtemBasePagamentoIRINFORMATIVO: TFloatField;
    QryObtemBasePagamentoIRINFORMATIVO13: TFloatField;
    QryObtemBasePagamentoIRCOMPENSADO: TFloatField;
    QryObtemBasePagamentoIRCOMPENSADO13: TFloatField;
    QryObtemBasePagamentoMARGEMCONSIGNAVEL: TFloatField;
    QryObtemBasePagamentoRENDABASE: TFloatField;
    QryObtemBasePagamentoMARGEMREAL: TFloatField;
    QryObtemBasePagamentoPORTADORFORMA: TStringField;
    QryObtemBasePagamentoCPF_MASCARA: TStringField;
    QryObtemBasePagamentoNOMEBANCO: TStringField;
    QryObtemBasePagamentoNOMEAGENCIA: TStringField;
	SqlCampos: TCMSqlParams;
    dsBasePagamento: TwwDataSource;
    CdsBasePagamento: TCMClientDataSet;    
    QryObtemBasePagamentoALTMANUAL: TStringField;
    QryObtemBasePagamentoTIPOPAGAMENTO: TStringField;
    pnlBasePagDir: TPanel;
    pnlDadosPagDir: TPanel;
    pnlDadosPagGeral: TPanel;
    pnlDadosPag2: TPanel;          
    pnlDadosPag1: TPanel;           
    procedure qrySelecaoAfterScroll(DataSet: TDataSet);
    procedure qryPreviaAfterOpen(DataSet: TDataSet);
    procedure DBGridRecebedorRowChanged(Sender: TObject);
    procedure DBGridRecebedorColEnter(Sender: TObject);
    procedure DBGridRecebedorColExit(Sender: TObject);
    procedure DBGridRecebedorCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure qryRubricasDetalheAfterOpen(DataSet: TDataSet);	
    procedure qryPreviaAfterScroll(DataSet: TDataSet);
    procedure dbgConcCreditoDrawDataCell(Sender: TObject;
      const Rect: TRect; Field: TField; State: TGridDrawState);
    procedure dbgConcCreditoDblClick(Sender: TObject);
    procedure dbgConcCreditoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
	 procedure PageControl1Changing(Sender: TObject;
      var AllowChange: Boolean);
  private
    { Private declarations }
    rtotprov: Real;
    rtotdesc: Real;
    sMesCobranca: string;
    iFlgUsaCodRubExt, iFlgAgrupaRub : Integer;
    iIdTitular: integer;
    bPrimeiro: boolean;
    actcontrol: TWinControl;
	
	wsMaxMin :  TWindowState;         //edilaine - SIG42986
	
    Procedure MontaQryMaster;
    Procedure MontaQryMasterAgrupado;
    Procedure MontaQryDet;
    Procedure MontaQryDetAgrupado;
    function MontaConsulta: boolean;
    procedure MostraValores;
    procedure MostraSRB;
    procedure MostraMensagem(sMsg: string);
    function ExecutaMestre(aidTitular: integer; asMesCob: string) : boolean;
    function ExecutaDetalhe(aidTitular: integer; asMesCob: string) : boolean;
	
	//edilaine - SIG42986 - inicio
    procedure AjustaPosicao;
    procedure MostraBasePagamento;
    //edilaine - SIG42986 - fim
	
  public
    { Public declarations }
    procedure ResetaFrame;
    procedure MontaQry;
    function ExecutaConsulta(aidTitular: integer): boolean;
	procedure AjustaFrame(pwsMaxMin :  TWindowState);         //edilaine - SIG42986
  end;

implementation

{$R *.DFM}

function IFF(Condicao:boolean;Primeiro,Segundo:string):string;
begin
  if Condicao
    then IFF:=Primeiro
    else IFF:=Segundo;
end;


function TfrmFrameConsultaHistorico.ExecutaDetalhe(aidTitular: integer;
  asMesCob: string): boolean;
begin
  result:=false;

  qryRubricasDetalhe.close;
  qryFator.Close;

  if (aidTitular = 0) or (asMesCob = '') then exit;

  qryRubricasDetalhe.ParamByName('IDTITULAR').asinteger:=aidTitular;
  qryRubricasDetalhe.ParamByName('IDFOLHA').AsInteger:=qrySelecao.FieldByName('IDHSTFOLHABENEF').AsInteger;
  qryFator.ParamByName('pidTitular').asinteger:=aidTitular;
  qryFator.ParamByName('IDFOLHA').AsInteger:=qrySelecao.FieldByName('IDHSTFOLHABENEF').AsInteger;
  qryFator.ParamByName('PMES').asstring:=qrySelecao.FieldByName('MESCOBRANCA').asstring;

  qryRubricasDetalhe.ParamByName('IDPESSOA').AsInteger:=qryPrevia.FieldByName('IDRESPONSAVEL').AsInteger;
  qryFator.ParamByName('PIDRESPONSAVEL').AsInteger:=qryPrevia.Fieldbyname('IDRESPONSAVEL').AsInteger;

  Try
    rtotprov := 0;
    rtotdesc := 0;
    qryRubricasDetalhe.open;
    qryFator.Open;
    If iFlgUsaCodRubExt = 0 Then
    Begin
      qryRubricasDetalhe.fieldbyname('CODRUBRICA').Visible    := True;
      qryRubricasDetalhe.fieldbyname('CODRUBRICAEXT').Visible := False;
    End
    Else
    Begin
      qryRubricasDetalhe.fieldbyname('CODRUBRICA').Visible    := False;
      qryRubricasDetalhe.fieldbyname('CODRUBRICAEXT').Visible := True;
    End;

    (qryRubricasDetalhe.fieldbyname('VALORPROVENTO') as tfloatfield).DisplayFormat:='#0.00';
    (qryRubricasDetalhe.fieldbyname('VALORDESCONTO') as tfloatfield).DisplayFormat:='#0.00';

    qryRubricasDetalhe.disablecontrols;
    while Not qryRubricasDetalhe.Eof do
    begin
      rtotprov := rtotprov + qryRubricasDetalhe.FieldByName('VALORPROVENTO').AsFloat;
      rtotdesc := rtotdesc + qryRubricasDetalhe.FieldByName('VALORDESCONTO').AsFloat;
      qryRubricasDetalhe.Next;
    end;
    qryRubricasDetalhe.First;
    qryRubricasDetalhe.enablecontrols;
    Mostravalores;

    if pnlSRB.Visible then
      MostraSRB;
	  
	 //edilaine - SIG42986 - inicio
    MostraBasePagamento;

    qryConcCreditoEfetuado.close;
    qryConcCreditoEfetuado.ParamByName('IDHSTFOLHABENEF').AsString    := qrySelecao.FieldByName('IDHSTFOLHABENEF').AsString;
    qryConcCreditoEfetuado.ParamByName('IDPESSOA').AsString           := qryPrevia.FieldByName('IDRESPONSAVEL').AsString;
    qryConcCreditoEfetuado.ParamByName('IDTITULAR').AsString          := qryPrevia.ParamByName('IDTITULAR').AsString;
    qryConcCreditoEfetuado.Open;
    //edilaine - SIG42986 - fim
	
  except
    Raise;
  end;
  Result := Not qryRubricasDetalhe.IsEmpty;
end;

function TfrmFrameConsultaHistorico.ExecutaMestre(aidTitular: integer;
  asMesCob: string): boolean;
begin
  pnlLiquido.Caption   := '';
  pnlProventos.Caption := '';
  pnlDescontos.Caption := '';
  pnlLiquido.Update;
  pnlProventos.Update;
  pnlDescontos.Update;
  qryPrevia.Close;
  qryPrevia.ParamByName('IDFOLHA').asinteger:=qrySelecao.FieldByName('IDHSTFOLHABENEF').AsInteger;
  qryPrevia.ParamByName('IDTITULAR').asinteger:=aidTitular;
  if iFlgAgrupaRub = 0 Then 
    qryPrevia.ParamByName('MESCOB').AsString:=asMesCob;
  qryPrevia.open;

  pnlFavorecido.Visible := False;
  If (qryPrevia.FieldByName('IDRECEBEPGTO').AsInteger <>
      qryPrevia.FieldByName('IDRESPONSAVEL').AsInteger) And
     (qryPrevia.FieldByName('IDRECEBEPGTO').AsInteger <> 0)  Then
    pnlFavorecido.Visible := True;

  Result:=not qryPrevia.IsEmpty;
end;

function TfrmFrameConsultaHistorico.MontaConsulta: boolean;
begin
  sMesCobranca:=qryselecao.fieldbyname('MESCOBRANCA').asstring;
  result:=true;
  if not ExecutaMestre(iIdTitular, sMesCobranca) then
  begin
    result:=false;
    qryselecao.close;
    Exit;
  end;
  Mostravalores;
end;

procedure TfrmFrameConsultaHistorico.MontaQryDet;
const _clinefeed = #13#10;
Begin
  qryRubricasDetalhe.SQL.Clear;
  qryRubricasDetalhe.SQL.Add(
//  'SELECT /*+ INDEX(HISTRUBSAL XIE17HISTRUBSAL) */ '+_clinefeed+  //Everson TIBERO
  'SELECT MES, IDPESSOA, ORDEM, FLGDESCONTO, CODIRRFDARF, FLGIRRF, FLGSALFAM, '+_clinefeed+ //Everson TIBERO
  '       PARCELAS, FLGTIPODESC, SEQRUB, FONTEPAGADORA, '+_clinefeed+
  '       IDPLANOCONTABIL, '+_clinefeed+
//  '       FLGESTORNO, '+_clinefeed+
  '       VALORPROVENTO, VALORDESCONTO, INFORMATIVO, CODRUBRICA, RUBRICA, CODRUBRICAEXT '+_clinefeed+

  //CPrev - 27415 - Inicio
  'FROM (SELECT HST.MES, HST.IDPESSOA, MIN(HST.SEQRUBRICA) AS ORDEM, '+_clinefeed+
  //'FROM (SELECT HST.MES, HST.IDPESSOA, MIN(HST.ORDEM) AS ORDEM, '+_clinefeed+ //Bruno Bastos - Pend. 23758 - 02/08/2007
  //CPrev - 27415 - Fim

  '             HST.FLGESTORNO, '+_clinefeed+
  '             HST.IDPLANOCONTABIL, '+_clinefeed+
  '             NVL(HST.FLGDESCONTO,PRD.FLGDESCONTO) AS FLGDESCONTO, '+_clinefeed+
  '             HST.PARCELAS AS PARCELAS, HST.FLGTIPODESC, '+_clinefeed+
  '             DECODE(HST.FLGTIPODESC,''Y'',HST.ORDEM,NULL) AS SEQRUB, '+_clinefeed+
  '             DECODE(HST.FONTEPAGADORA,1,''FUND'',2,''INSS'',4,''PATRO'',NULL) AS FONTEPAGADORA, '+_clinefeed+
//  '             PRD.CODIRRFDARF, HST.FLGIRRF, HST.FLGSALFAM, '+_clinefeed+ // SOL 217759 KTN 2047999
  '             HST.CODIRRFDARF, HST.FLGIRRF, HST.FLGSALFAM, '+_clinefeed+ // SOL 217759 KTN 2047999
  '             NVL(SUM(DECODE(NVL(HST.FLGDESCONTO,PRD.FLGDESCONTO), 0, HST.VALORPROVENTO, NULL)), 0) VALORPROVENTO, '+_clinefeed+ //CPrev - 26869
  '             NVL(SUM(DECODE(NVL(HST.FLGDESCONTO,PRD.FLGDESCONTO), 1, HST.VALORPROVENTO, NULL)), 0) VALORDESCONTO, '+_clinefeed+ //CPrev - 26869
  '             DECODE(NVL(HST.FLGESPECIAL,PRD.FLGESPECIAL), '+_clinefeed+ //P.RAMOS-13.01.2005-PEND.18477
  '               0, DECODE(NVL(HST.FLGDESCONTO,PRD.FLGDESCONTO), '+_clinefeed+ //P.RAMOS-13.01.2005-PEND.18477
  '                    2, NVL(SUM(HST.VALORINFO),SUM(HST.VALORPROVENTO))||'' (I)'', '+_clinefeed+
  '                    0, NULL, '+_clinefeed+
  '                    1, DECODE(SUM(HST.VALORRECEBIDO-HST.VALORPROVENTO), '+_clinefeed+
  '                         0, DECODE(NVL(SUM(HST.VALORINFO),0), '+_clinefeed+
  '                              0, NULL, '+_clinefeed+
  '                              SUM(HST.VALORINFO)||'' (I)''), '+_clinefeed+
  '                         SUM(HST.VALORRECEBIDO-HST.VALORPROVENTO)||'' (R)'')'+_clinefeed+
  '               ), '+_clinefeed+
  //EXIBIR O VALOR INFORMATIVO
  '             DECODE(SUM(HST.VALORPROVENTO),0,SUM(HST.VALORINFO), '+_clinefeed+
  '               SUM(NVL(HST.VALORPROVENTO,HST.VALORINFO)))||'' (I)'') INFORMATIVO, ');
  qryRubricasDetalhe.SQL.Add('             HST.IDRUBRICA AS CODRUBRICA, ');
  qryRubricasDetalhe.SQL.Add('             PRD.CODPROVDESC AS CODRUBRICAEXT,');
  qryRubricasDetalhe.SQL.Add('             PRD.DESCRICAO AS RUBRICA, ');
  qryRubricasDetalhe.SQL.Add(' TRIM(PE.NOME || ' + ''' - ''' + ' ||cast(PE.IDPLANPREVCONTAB as varchar(10))) as NOMEPLANO '); //Peterson Victor - SIG56702

  qryRubricasDetalhe.SQL.Add('       ,HST.REFERENCIA '); // Andre Imakawa - SIG 86762

  qryRubricasDetalhe.SQL.Add(
    '      FROM HISTRUBSAL HST, PROVDESC PRD, PERFILINVEST PE '+_clinefeed+   // Andre Imakawa - SIG 63028
    '      WHERE (HST.IDHSTFOLHABENEF = :IDFOLHA) '+_clinefeed+
    '      AND (HST.IDTITULAR = :IDTITULAR) '+_clinefeed+
    '      AND (HST.IDRESPONSAVEL = :IDPESSOA) '+_clinefeed+
    '      AND (HST.IDPERFILINVEST = PE.IDPERFILINVEST(+)) '+_clinefeed+   //Peterson Victor - SIG56702
    '      AND (PRD.IDPROVENTO = HST.IDRUBRICA) ');

  If iFlgUsaCodRubExt = 0 Then
    qryRubricasDetalhe.SQL.Add(
    '      GROUP BY HST.MES, HST.IDRUBRICA, '+_clinefeed+
    '               HST.IDPLANOCONTABIL, '+_clinefeed+
//    '               PRD.CODIRRFDARF, NVL(HST.FLGDESCONTO,PRD.FLGDESCONTO), '+_clinefeed+ // SOL 217759 KTN 2047999
    '               HST.CODIRRFDARF, NVL(HST.FLGDESCONTO,PRD.FLGDESCONTO), '+_clinefeed+// SOL 217759 KTN 2047999
    '               PRD.DESCRICAO, HST.FLGIRRF, HST.FLGSALFAM, HST.IDPESSOA, '+_clinefeed+
    '               HST.PARCELAS, HST.FLGTIPODESC, '+_clinefeed+
    '               DECODE(HST.FLGTIPODESC,''Y'',HST.ORDEM,NULL), '+_clinefeed+
    '               DECODE(HST.FONTEPAGADORA,1,''FUND'',2,''INSS'',4,''PATRO'',NULL), '+_clinefeed+
    //ADAPTA QUERY PARA RUBRICAS INFORMATIVAS PROVENTO OU DESCONTO
    '               NVL(HST.FLGESPECIAL,PRD.FLGESPECIAL), PRD.CODPROVDESC)')
  Else
    qryRubricasDetalhe.SQL.Add(
    '      GROUP BY HST.MES, PRD.CODPROVDESC, '+_clinefeed+
    '               HST.IDPLANOCONTABIL, '+_clinefeed+
//    '               PRD.CODIRRFDARF, NVL(HST.FLGDESCONTO,PRD.FLGDESCONTO), '+_clinefeed+ // SOL 217759 KTN 2047999
    '               HST.CODIRRFDARF, NVL(HST.FLGDESCONTO,PRD.FLGDESCONTO), '+_clinefeed+ // SOL 217759 KTN 2047999
    '               HST.FLGESTORNO, '+_clinefeed+
    '               PRD.DESCRPROVDESC, HST.FLGIRRF, HST.FLGSALFAM, HST.IDPESSOA, '+_clinefeed+
    '               HST.PARCELAS, HST.FLGTIPODESC, '+_clinefeed+
    '               DECODE(HST.FLGTIPODESC,''Y'',HST.ORDEM,NULL), '+_clinefeed+
    '               DECODE(HST.FONTEPAGADORA,1,''FUND'',2,''INSS'',4,''PATRO'',NULL), '+_clinefeed+
    //ADAPTA QUERY PARA RUBRICAS INFORMATIVAS PROVENTO OU DESCONTO
    '               NVL(HST.FLGESPECIAL,PRD.FLGESPECIAL), HST.IDRUBRICA, PRD.DESCRICAO)');
  qryRubricasDetalhe.SQL.Add('ORDER BY ORDEM, CODRUBRICA');
  qryRubricasDetalhe.prepare;
End;

procedure TfrmFrameConsultaHistorico.MontaQryDetAgrupado;
const _clinefeed = #13#10;
Begin
  qryRubricasDetalhe.Sql.clear;
  qryRubricasDetalhe.Sql.add(
//    'SELECT DISTINCT /*+ INDEX(HISTRUBSAL XIE17HISTRUBSAL) */ '+_clinefeed+ //Everson TIBERO
    'SELECT DISTINCT HST.MES, HST.IDPESSOA, HST.VALORPROVENTO AS IDPROVENTO, '+_clinefeed+ //Everson TIBERO
    '       HST.FLGESTORNO, '+_clinefeed+
    '       HST.IDPLANOCONTABIL, '+_clinefeed+
    '       DECODE(NVL(HST.FLGDESCONTO,PRD.FLGDESCONTO),0,HST.VALORPROVENTO,NULL) VALORPROVENTO, '+_clinefeed+
    '       DECODE(NVL(HST.FLGDESCONTO,PRD.FLGDESCONTO),1,HST.VALORPROVENTO,NULL) VALORDESCONTO, '+_clinefeed+
    '       HST.PARCELAS, HST.FLGTIPODESC, ' +_clinefeed+
    '       DECODE(HST.FLGTIPODESC,''Y'',HST.ORDEM,NULL) AS SEQRUB, ' +_clinefeed+
    '       DECODE(HST.FONTEPAGADORA,1,''FUND'',2,''INSS'',4,''PATRO'',NULL) AS FONTEPAGADORA, ' +_clinefeed+
    '       NVL(HST.FLGDESCONTO,PRD.FLGDESCONTO) AS FLGDESCONTO, '+_clinefeed+

    //CPrev - 27415 - Inicio
//    '       HST.SEQRUBRICA AS ORDEM, PRD.CODIRRFDARF, ' + _clinefeed + // SOL 217759 KTN 2047999
    '       HST.SEQRUBRICA AS ORDEM, HST.CODIRRFDARF, ' + _clinefeed + // SOL 217759 KTN 2047999
    //'       HST.ORDEM AS ORDEM, PRD.CODIRRFDARF, '+_clinefeed+ //Bruno Bastos - Pend. 23758 - 02/08/2007
    //CPrev - 27415 - Fim

    '       DECODE(NVL(HST.FLGESPECIAL,PRD.FLGESPECIAL), '+_clinefeed+
    '         0,DECODE(NVL(HST.FLGDESCONTO,PRD.FLGDESCONTO), '+_clinefeed+
    '             2, NVL(HST.VALORINFO,HST.VALORPROVENTO)||'' (I)'', '+_clinefeed+
    '             0, NULL, '+_clinefeed+
    '             1, DECODE(HST.VALORRECEBIDO-HST.VALORPROVENTO, '+_clinefeed+
    '                  0, DECODE(NVL(HST.VALORINFO,0), '+_clinefeed+
    '                       0, NULL, '+_clinefeed+
    '                       HST.VALORINFO||'' (I)''), '+_clinefeed+
    '                  HST.VALORRECEBIDO-HST.VALORPROVENTO||'' (R)'')'+_clinefeed+
    '             ), '+_clinefeed+
    //EXIBIR CORRETAMENTE O VALOR INFORMATIVO
    '       DECODE(HST.VALORPROVENTO,0,HST.VALORINFO, '+_clinefeed+
    '              NVL(HST.VALORPROVENTO,HST.VALORINFO))||'' (I)'') INFORMATIVO, '+_clinefeed+
    '       HST.FLGIRRF, HST.FLGSALFAM, ');
  qryRubricasDetalhe.SQL.Add('       HST.IDRUBRICA AS CODRUBRICA, ');
  qryRubricasDetalhe.SQL.Add('       PRD.CODPROVDESC AS CODRUBRICAEXT,');
  qryRubricasDetalhe.SQL.Add('       PRD.DESCRICAO AS RUBRICA, ');
  qryRubricasDetalhe.SQL.Add(' TRIM(PE.NOME || ' + ''' - ''' + ' ||cast(PE.IDPLANPREVCONTAB as varchar(10))) as NOMEPLANO '); //Peterson Victor - SIG56702

  qryRubricasDetalhe.SQL.Add('       ,HST.REFERENCIA '); // Andre Imakawa - SIG 86762

  qryRubricasDetalhe.Sql.add
  ('FROM HISTRUBSAL HST, PROVDESC PRD, PERFILINVEST PE '+_clinefeed+  //Peterson Victor - SIG56702
 //  ('FROM HISTRUBSAL HST, PROVDESC PRD, PERFILINVEST PE '+_clinefeed+
 //
    'WHERE (HST.IDHSTFOLHABENEF = :IDFOLHA) '+_clinefeed+
    'AND (HST.IDTITULAR  = :IDTITULAR) '+_clinefeed+
    //TRATA SEMPRE OS RECEBEDORES
    'AND (HST.IDRESPONSAVEL = :IDPESSOA) '+_clinefeed+
    'AND (PRD.IDPROVENTO = HST.IDRUBRICA) '+_clinefeed+
    'AND (HST.IDPERFILINVEST = PE.IDPERFILINVEST(+)) '+_clinefeed+   //Peterson Victor - SIG56702
    'ORDER BY ORDEM ');
  qryRubricasDetalhe.prepare;
end;

procedure TfrmFrameConsultaHistorico.MontaQryMaster;
//Query Master sem opção de abono e não agrupada
begin
  qryPrevia.Sql.clear;
  qryprevia.Sql.Add( 'SELECT '+
//                     '       DISTINCT /*+ INDEX(HISTRUBSAL XIE17HISTRUBSAL) */ '                               + #13 + //Everson TIBERO
                     '       DISTINCT  '                                                                       + #13 +   //Everson TIBERO
                     '       PJR.NOME AS PATROCINADORA, TIT.NOME AS TITULAR, '                                 + #13 +
                     '       ELG.MATRICULA, '                                                                  + #13 +
                     '       BEN.NOME AS BENEFICIARIO, '                                                       + #13 +
                     '       PLP.NOME AS PLANO, '                                                              + #13 +
                     '       PPP.INSCRICAONUMERO, '                                                            + #13 +
                     '       HST.FLGESTORNO, '                                                                 + #13 +
                     '       DECODE(HST.FLGESTORNO, '                                                          + #13 +
                     '              Null, ''PAGAMENTO NORMAL'', '                                              + #13 +
                     '              0,    ''PAGAMENTO NORMAL'', '                                              + #13 +
                     '              1,    ''ESTORNADO - PAGAMENTO PENDENTE'', '                                + #13 +
                     '              2,    ''ESTORNADO - PAGAMENTO PENDENTE EM PROCESSO DE PREVIA'', '          + #13 +
                     '              3,    ''ESTORNADO - PGTO PENDENTE PAGO NOVAMENTE (REENVIADO PARA CAP)'', ' + #13 +
                     '              4,    ''ESTORNADO - REPROCESSAMENTO DE PAGAMENTO'', '                      + #13 +
                     '              9,    ''ESTORNADO - PAGAMENTO INDEVIDO'') AS SITUACAO, '                   + #13 +
                     '       HST.IDVERSAOPAGTO, '                                                              + #13 +
                     '       SUBSTR(TO_CHAR(HST.DATAPAGAMENTO,''DD/MM/YYYY''),7,4) || '                        + #13 +
                     '              SUBSTR(TO_CHAR(HST.DATAPAGAMENTO,''DD/MM/YYYY''),3,3) AS DATAPAGAMENTO, '  + #13 +
                     '       NVL(HST.NUMDEPIRRF,NVL(PSF.NUMDEPIRRF,0)) AS NUMDEPIRRF, '                        + #13 +
                     '       NVL(HST.FLGISENTOIRRF,NVL(PSF.FLGISENTOIRRF,0)) AS FLGISENTOIRRF, '               + #13 +
                     '       PSF.DATANASC, '                                                                   + #13 +
                     '       HST.IDRESPONSAVEL, '                                                              + #13 +
                     '       HST.IDRECEBEPGTO, '                                                               + #13 +
                     '       FAV.NOME AS FAVORECIDO, '                                                         + #13 +
                     '       HST.MESCOBRANCA, '                                                                + #13 +
                     '       HST.IDPESSJUR, '                                                                  + #13 +
                     '       HST.NUMBANCO, '                                                                   + #13 +
                     '       HST.NUMAGENCIA, '                                                                 + #13 +
                     '       HST.CONTACORRENTE, '                                                              + #13 +
                     '       NVL(PSF.FLGSOMAIRSUPINSS,0) AS FLGSOMAIRSUPINSS , '                               + #13 +
                     '       HFCAP.NOMETXT, '                                                                  + #13 +
                     '       PTF.DESCRICAO '                                                                   + #13 +
                     'FROM HISTRUBSAL HST, '                                                                   + #13 +
                     '     PARTPREVPLAN PPP, '                                                                 + #13 +
                     '     ELEGPATRO ELG, '                                                                    + #13 +
                     '     PESSOAFISICA PSF, '                                                                 + #13 +
                     '     PESSOA PJR, '                                                                       + #13 +
                     '     PESSOA TIT, '                                                                       + #13 +
                     '     PESSOA BEN, '                                                                       + #13 +
                     '     PESSOA FAV, '                                                                       + #13 +
                     '     PLANPREV PLP, '                                                                     + #13 +
                     '     HSTFOLHABENEFCAP HFCAP, '                                                           + #13 +
                     '     PORTADORFORMA PTF '                                                                 + #13 +
                     'WHERE '+
                     '      (HST.IDHSTFOLHABENEF = :IDFOLHA) '                                                 + #13 +
                     '  AND (PJR.IDPESSOA        = HST.IDPATRO) '                                              + #13 +
                     '  AND (HST.IDTITULAR       = :IDTITULAR) '                                               + #13 +
                     '  AND (HST.IDHSTFOLHABENEF = HFCAP.IDHSTFOLHABENEF(+))'                                  + #13 +
                     '  AND (HST.CODDOCUMENTO    = HFCAP.CODDOCUMENTO(+)) '                                    + #13 +
                     '  AND (HST.CODPORTFORMA    = PTF.CODPORTFORMA(+)) '                                      + #13 +
                     '  AND (PPP.IDPESSJUR       = HST.IDPATRO) '                                              + #13 +
                     '  AND (PPP.IDPESSOA        = HST.IDTITULAR) '                                            + #13 +
                     '  AND ( (HST.IDPLANOPREV   = PPP.IDPLANOPREV AND HST.IDPESSOA = HST.IDTITULAR) '         + #13 +
                     '     OR (HST.IDPLANOORIGEM = PPP.IDPLANOPREV AND HST.IDPESSOA <> HST.IDTITULAR) ) '      + #13 +
                     '  AND (TIT.IDPESSOA        = HST.IDTITULAR) '                                            + #13 +
                     '  AND (BEN.IDPESSOA        = HST.IDRESPONSAVEL) '                                        + #13 +
                     '  AND (PLP.IDPLANOPREV     = HST.IDPLANOPREV) '                                          + #13 +
                     '  AND (ELG.IDPESSOA        = HST.IDTITULAR) '                                            + #13 +
                     '  AND (ELG.IDPESSJUR       = HST.IDPATRO) '                                              + #13 +
                     '  AND (HST.IDPESSJUR       = HST.IDPATRO) '                                              + #13 +
                     '  AND (HST.IDRECEBEPGTO    = FAV.IDPESSOA(+)) '                                          + #13 +

                     //CPrev - 26150 - Inicio
                     //'  AND ((PPP.FLGDESATIVADO = 0)                                                       '   + #13 +
                     //'       OR (HST.idtitular IN (SELECT DISTINCT PPP.IDPESSOA                            '   + #13 +
                     //'                           FROM PARTPREVPLAN PPP                                     '   + #13 +
                     //'                           WHERE PPP.IDPESSOA NOT IN (SELECT DISTINCT IDPESSOA       '   + #13 +
                     //'                                                      FROM PARTPREVPLAN P            '   + #13 +
                     //'                                                      WHERE P.FLGDESATIVADO = 0))) ) '   + #13 +
                     //CPrev - 26150 - Inicio

                     //CPrev - 27838 - Inicio
                     //'  AND ((PPP.FLGDESATIVADO = 0)                                                       '   + #13 +
                     //'       OR (HST.idtitular IN (SELECT DISTINCT PPP.IDPESSOA                            '   + #13 +
                     //'                           FROM PARTPREVPLAN PPP                                     '   + #13 +
                     //'                           WHERE PPP.IDPESSOA IN (SELECT DISTINCT IDPESSOA           '   + #13 +
                     //'                                                      FROM PARTPREVPLAN P            '   + #13 +
                     //'                                                      WHERE P.FLGDESATIVADO = 0)     '   + #13 +
                     //'                             AND PPP.FLGDESATIVADO = 1 )) ) '                            + #13 +
                     //CPrev - 27838 - Inicio

                     //CPrev - 27952 - Inicio
                     '  AND ((PPP.FLGDESATIVADO = 0)                                                       '   + #13 +
                     '    OR (HST.IDTITULAR     IN (SELECT DISTINCT PPP.IDPESSOA                                    '   + #13 +
                     '                           FROM PARTPREVPLAN PPP                                     '   + #13 +
//                     '                            WHERE ((PPP.IDPESSOA IN (SELECT DISTINCT IDPESSOA               '   + #13 + //Everson TIBERO
                     '                              WHERE ((PPP.IDPESSOA IN (SELECT DISTINCT P.IDPESSOA               '   + #13 + //Everson TIBERO
                     '                                                      FROM PARTPREVPLAN P            '   + #13 +
                     '                                                       WHERE P.FLGDESATIVADO = 0))            '   + #13 +
                     '                                 AND (PPP.FLGDESATIVADO = 1))                                 '   + #13 +
//                     '                               OR (PPP.IDPESSOA NOT IN (SELECT DISTINCT IDPESSOA            '   + #13 + //Everson TIBERO
                     '                                 OR (PPP.IDPESSOA NOT IN (SELECT DISTINCT P.IDPESSOA            '   + #13 + //Everson TIBERO
                     '                                                          FROM PARTPREVPLAN P                 '   + #13 +
                     '                                                          WHERE P.FLGDESATIVADO = 0 )) 	))) '   + #13 +
                     //CPrev - 27952 - Fim

                     '  AND (PSF.IDPESSOA(+)        = BEN.IDPESSOA) '); // Andre Imakawa - SIG 133922 - Ajuste para retornar PJ

  qryPrevia.ParamByName('IDTITULAR').datatype := ftinteger;
  qryPrevia.ParamByName('IDFOLHA').datatype   := ftinteger;
  qryPrevia.prepare;
end;

procedure TfrmFrameConsultaHistorico.MontaQryMasterAgrupado;
begin
  qryPrevia.sql.clear;
//  qryPrevia.sql.add('SELECT DISTINCT /*+ INDEX(HISTRUBSAL XIE17HISTRUBSAL) */ HST.MESCOBRANCA, '             + #13 +  //Everson TIBERO
  qryPrevia.sql.add('SELECT DISTINCT  HST.MESCOBRANCA, '                                                     + #13 +    //Everson TIBERO
                    '       HST.IDRESPONSAVEL, '                                                             + #13 +
                    '       PJR.NOME AS PATROCINADORA, '                                                     + #13 +
                    '       TIT.NOME AS TITULAR, '                                                           + #13 +
                    '       ELG.MATRICULA, '                                                                 + #13 +
                    '       BEN.NOME AS BENEFICIARIO, '                                                      + #13 +
                    '       PLP.NOME AS PLANO, '                                                             + #13 +
                    '       PPP.INSCRICAONUMERO, '                                                           + #13 +
                    '       SUBSTR(TO_CHAR(HST.DATAPAGAMENTO,''DD/MM/YYYY''),7,4) || '                       + #13 +
                    '              SUBSTR(TO_CHAR(HST.DATAPAGAMENTO,''DD/MM/YYYY''),3,3) AS DATAPAGAMENTO, ' + #13 +
                    '       NVL(HST.NUMDEPIRRF,NVL(PSF.NUMDEPIRRF,0)) AS NUMDEPIRRF, '                       + #13 +
                    '       NVL(HST.FLGISENTOIRRF,NVL(PSF.FLGISENTOIRRF,0)) AS FLGISENTOIRRF, '              + #13 +
                    '       HST.FLGESTORNO, '                                                                + #13 + 
                    '       NVL(PSF.FLGSOMAIRSUPINSS,0) AS FLGSOMAIRSUPINSS , '                              + #13 + 
                    '       DECODE(HST.FLGESTORNO, '                                                         + #13 +
                    '              Null, ''PAGAMENTO NORMAL'', '                                             + #13 +
                    '              0,    ''PAGAMENTO NORMAL'', '                                             + #13 +
                    '              1,    ''ESTORNADO - PAGAMENTO PENDENTE'', '                               + #13 +
                    '              2,    ''ESTORNADO - PAGAMENTO PENDENTE EM PROCESSO DE PREVIA'', '         + #13 +
                    '              3,    ''ESTORNADO - PGTO PENDENTE PAGO NOVAMENTE (REENVIADO PARA CAP)'', '+ #13 +
                    '              4,    ''ESTORNADO - REPROCESSAMENTO DE PAGAMENTO'', '                     + #13 +
                    '              9,    ''ESTORNADO - PAGAMENTO INDEVIDO'') AS SITUACAO, '                  + #13 +
                    '       HST.IDVERSAOPAGTO, '                                                             + #13 +
                    '       HFCAP.NOMETXT, '                                                                 + #13 +
                    '       PTF.DESCRICAO, '                                                                 + #13 +
                    '       PSF.DATANASC, '                                                                  + #13 +
                    '       HST.IDRESPONSAVEL, '                                                             + #13 +
                    '       HST.IDRECEBEPGTO, '                                                              + #13 + 
                    '       FAV.NOME AS FAVORECIDO, '                                                        + #13 + 
                    '       HST.IDPESSJUR, '                                                                 + #13 +
                    '       HST.NUMBANCO, '                                                                  + #13 +
                    '       HST.NUMAGENCIA, '                                                                + #13 +
                    '       HST.CONTACORRENTE '                                                              + #13 +
                    'FROM HISTRUBSAL HST, '                                                                  + #13 +
                    '     PARTPREVPLAN PPP, '                                                                + #13 +
                    '     ELEGPATRO ELG, '                                                                   + #13 +
                    '     PESSOA TIT, '                                                                      + #13 +
                    '     PESSOA PJR, '                                                                      + #13 +
                    '     PESSOA BEN, '                                                                      + #13 +
                    '     PESSOA FAV, '                                                                      + #13 + 
                    '     PLANPREV PLP, '                                                                    + #13 +
                    '     HSTFOLHABENEFCAP HFCAP, '                                                          + #13 +
                    '     PORTADORFORMA PTF, '                                                               + #13 +
                    '     PESSOAFISICA PSF '                                                                 + #13 +
                    'WHERE (HST.IDHSTFOLHABENEF = :idfolha) '                                                + #13 +
                    '  AND (HST.MESCOBRANCA     = :Mescob) '                                                 + #13 +
                    '  AND (PJR.IDPESSOA        = HST.IDPATRO) '                                             + #13 +
                    '  AND (HST.IDTITULAR       = :idTitular) '                                              + #13 +
                    '  AND (HST.CODDOCUMENTO    = HFCAP.CODDOCUMENTO(+)) '                                   + #13 +
                    '  AND (HST.CODPORTFORMA    = PTF.CODPORTFORMA(+)) '                                     + #13 +
                    '  AND (PPP.IDPESSJUR       = HST.IDPATRO) '                                             + #13 +
                    '  AND (PPP.IDPESSOA        = HST.IDTITULAR) '                                           + #13 +
                    '  AND ( (HST.IDPLANOPREV = PPP.IDPLANOPREV AND HST.IDPESSOA = HST.IDTITULAR) '          + #13 + 
                    '     OR (HST.IDPLANOORIGEM = PPP.IDPLANOPREV AND HST.IDPESSOA <> HST.IDTITULAR) ) '     + #13 + 
                    '  AND (TIT.IDPESSOA        = HST.IDTITULAR) '                                           + #13 +
                    '  AND (BEN.IDPESSOA        = HST.IDRESPONSAVEL) '                                       + #13 +
                    '  AND (PLP.IDPLANOPREV     = HST.IDPLANOPREV) '                                         + #13 +
                    '  AND (ELG.IDPESSOA        = HST.IDTITULAR) '                                           + #13 +
                    '  AND (ELG.IDPESSJUR       = HST.IDPATRO) '                                             + #13 +
                    '  AND (HST.IDRECEBEPGTO    = FAV.IDPESSOA(+)) '                                         + #13 + 

                     //CPrev - 26150 - Inicio
                     //'  AND ((PPP.FLGDESATIVADO = 0)                                                       '   + #13 +
                     //'       OR (HST.idtitular IN (SELECT DISTINCT PPP.IDPESSOA                            '   + #13 +
                     //'                           FROM PARTPREVPLAN PPP                                     '   + #13 +
                     //'                           WHERE PPP.IDPESSOA NOT IN (SELECT DISTINCT IDPESSOA       '   + #13 +
                     //'                                                      FROM PARTPREVPLAN P            '   + #13 +
                     //'                                                      WHERE P.FLGDESATIVADO = 0))) ) '   + #13 +
                     //CPrev - 26150 - Inicio

                     //CPrev - 27838 - Inicio
                     //'  AND ((PPP.FLGDESATIVADO = 0)                                                       '   + #13 +
                     //'       OR (HST.idtitular IN (SELECT DISTINCT PPP.IDPESSOA                            '   + #13 +
                     //'                           FROM PARTPREVPLAN PPP                                     '   + #13 +
                     //'                           WHERE PPP.IDPESSOA IN (SELECT DISTINCT IDPESSOA           '   + #13 +
                     //'                                                      FROM PARTPREVPLAN P            '   + #13 +
                     //'                                                      WHERE P.FLGDESATIVADO = 0)     '   + #13 +
                     //'                             AND PPP.FLGDESATIVADO = 1 )) ) '                            + #13 +
                     //CPrev - 27838 - Inicio

                     //CPrev - 27952 - Inicio
                     '  AND ((PPP.FLGDESATIVADO = 0)                                                       '   + #13 +
                     '    OR (HST.IDTITULAR     IN (SELECT DISTINCT PPP.IDPESSOA                                    '   + #13 +
                     '                           FROM PARTPREVPLAN PPP                                     '   + #13 +
//                   '                              WHERE ((PPP.IDPESSOA IN (SELECT DISTINCT IDPESSOA               '   + #13 + //Everson TIBERO
                     '                              WHERE ((PPP.IDPESSOA IN (SELECT DISTINCT P.IDPESSOA               '   + #13 + //Everson TIBERO
                     '                                                      FROM PARTPREVPLAN P            '   + #13 +
                     '                                                       WHERE P.FLGDESATIVADO = 0))            '   + #13 +
                     '                                 AND (PPP.FLGDESATIVADO = 1))                                 '   + #13 +
//                   '                                 OR (PPP.IDPESSOA NOT IN (SELECT DISTINCT IDPESSOA            '   + #13 +  //Everson TIBERO
                     '                                 OR (PPP.IDPESSOA NOT IN (SELECT DISTINCT P.IDPESSOA            '   + #13 +  //Everson TIBERO
                     '                                                          FROM PARTPREVPLAN P                 '   + #13 +
                     '                                                          WHERE P.FLGDESATIVADO = 0 )) 	))) '   + #13 +
                     //CPrev - 27952 - Fim

                    '  AND (PSF.IDPESSOA(+)        = BEN.IDPESSOA) ');// Andre Imakawa - SIG 133922 - Ajuste para retornar PJ

  qryPrevia.ParamByName('IDTITULAR').datatype:=ftinteger;
  qryPrevia.ParamByName('MESCOB').datatype:=ftstring;
  qryPrevia.ParamByName('IDFOLHA').datatype:=ftinteger;
  qryPrevia.prepare;
end;

procedure TfrmFrameConsultaHistorico.MostraSRB;
Var
  vsrb, vinss, vsup: Double;
  bFlgProvisorio   : Boolean;
  sDtInicio, sDtFim: String;

begin
  bFlgProvisorio := False; 
  sDtInicio      := '';    
  sDtFim         := '';    

  vsrb := ComumFolha.PegaSRBBeneficio( qryAux, QrySelecao.fieldbyname('MESCOBRANCA').asstring,
                                       inttostr(iIdTitular), inttostr(qryPrevia.FieldByName('IDRESPONSAVEL').AsInteger),
                                       bFlgProvisorio, sDtInicio, sDtFim );

  vinss := ComumFolha.PegaINSSBeneficio( qryAux, QrySelecao.fieldbyname('MESCOBRANCA').asstring,
                                         inttostr(iIdTitular), inttostr(qryPrevia.FieldByName('IDRESPONSAVEL').AsInteger));
                                         vsup:=ComumFolha.PegaValorIntegralBeneficio(qryAux, QrySelecao.fieldbyname('MESCOBRANCA').asstring,
                                         inttostr(iIdTitular), inttostr(qryPrevia.FieldByName('IDRESPONSAVEL').AsInteger) );

  chkBenefProvisorio.Checked := bFlgProvisorio;
  edtDtInicio.Text           := sDtInicio;
  edtDtFinal.Text            := sDtFim;

  if vsrb > 0 then
    pnlValorSRB.Caption:=FloatToStrf(vsrb,ffnumber,15,2)+' '
  else
    pnlValorSRB.Caption:='';

  if vinss > 0 then
    pnlValorINSS.Caption:=FloatToStrf(vinss,ffnumber,15,2)+' '
  else
    pnlValorINSS.Caption:='';

  if vsup = 0 then
  begin
    if (vsrb > 0) and (vinss > 0) then
      pnlValorSupl.caption:=FloatToStrf(vsrb-vinss,ffnumber,15,2)+' '
    else
      pnlValorSupl.caption:='';
  end
  else
    pnlValorSupl.Caption:=FloatToStrf(vsup,ffnumber,15,2)+' ';
end;

procedure TfrmFrameConsultaHistorico.MostraValores;
begin
  pnlLiquido.Caption:=FloatToStrf((rTotProv-rTotDesc),ffnumber,15,2);
  pnlProventos.Caption:=FloatToStrf(rTotProv,ffnumber,15,2);
  pnlDescontos.Caption:=FloatToStrf(rTotDesc,ffnumber,15,2);
end;

procedure TfrmFrameConsultaHistorico.qrySelecaoAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  if not bPrimeiro then
    ExecutaMestre(iIdTitular, qryselecao.fieldbyname('MESCOBRANCA').asstring);
end;

procedure TfrmFrameConsultaHistorico.qryPreviaAfterOpen(DataSet: TDataSet);
begin
  ExecutaDetalhe(iIdTitular, sMesCobranca);
end;

procedure TfrmFrameConsultaHistorico.ResetaFrame;
begin
  bPrimeiro:=true;
  rTotProv:=0;
  rTotDesc:=0;
  qrySelecao.close;
  qryPrevia.close;
  qryRubricasDetalhe.close;
  pnlproventos.caption:='';
  pnldescontos.caption:='';
  pnlliquido.caption:='';
  PageControl1.ActivePageIndex:=0;
end;

procedure TfrmFrameConsultaHistorico.MostraMensagem(sMsg: string);
begin
  LblProventos.visible:=sMsg='';
  pnlProventos.visible:=sMsg='';
  LblDescontos.visible:=sMsg='';
  pnlDescontos.visible:=sMsg='';
  LblValLiquido.visible:=sMsg='';
  pnlLiquido.visible:=sMsg='';

  if sMsg='' then
    PnlValores.font.color:=clWindowText
  else
    PnlValores.font.color:=clred;

  PnlValores.caption:=sMsg;
end;

function TfrmFrameConsultaHistorico.ExecutaConsulta(aidTitular: integer): boolean;
begin
  iIdTitular:=aidTitular;
  qrySelecao.Close;
  qryselecao.parambyname('TITULAR').asinteger:=iIdTitular;
  qrySelecao.Open;
  result:=MontaConsulta;
  bPrimeiro:=false;
  if result then
    dbgHistorico.setfocus;
end;

procedure TfrmFrameConsultaHistorico.MontaQry;
begin
  qryAux.Sql.Clear;
  qryAux.Sql.Add('SELECT VALORPARAM FROM PARAMFOLHA WHERE NOMEPARAM = ''FLGUSACODRUBEXT''');
  qryAux.Open;
  iFlgUsaCodRubExt := qryAux.FieldByName('VALORPARAM').AsInteger;
  qryAux.Sql.Clear;
  qryAux.Sql.Add('SELECT VALORPARAM FROM PARAMFOLHA WHERE NOMEPARAM = ''FLGAGRUPARUBRICA''');
  qryAux.Open;
  iFlgAgrupaRub := qryAux.FieldByName('VALORPARAM').AsInteger;

  If iFlgAgrupaRub = 1 Then 
  begin
    MontaQryMaster;
    MontaQryDet;
  End
  Else
  Begin
    MontaQryMasterAgrupado;
    MontaQryDetAgrupado;
  End;
  PageControl1.ActivePageIndex:=0;
  PageControl1.Height:=197;
end;

procedure TfrmFrameConsultaHistorico.DBGridRecebedorRowChanged(Sender: TObject);
 var smsg: string;
begin
  smsg:='';
  if not qryPrevia.isempty then
    if (actcontrol = sender) then
      if not ExecutaDetalhe(iIdTitular, sMesCobranca) then
        sMsg:='Problema na consulta do histórico de pagamento para o Beneficiário.';
  MostraMensagem(sMsg);
end;

procedure TfrmFrameConsultaHistorico.DBGridRecebedorColEnter(Sender: TObject);
begin
  actcontrol:=DBGridRecebedor;
end;

procedure TfrmFrameConsultaHistorico.DBGridRecebedorColExit(Sender: TObject);
begin
  actcontrol:=nil;
end;

procedure TfrmFrameConsultaHistorico.DBGridRecebedorCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  if qryPrevia.FieldByName('FLGESTORNO').asinteger = 0 then
  begin
    Abrush.color:=clLime;
    AFont.color:=clBlack;
  end
  else
  begin
    Abrush.color:=clRed;
    AFont.color:=clWhite;
  end;
end;

procedure TfrmFrameConsultaHistorico.qryRubricasDetalheAfterOpen(
  DataSet: TDataSet);
begin
  if qryRubricasDetalhe.FieldByName('FLGESTORNO').asinteger = 0 then
  begin
    dbedSituacao.color:=clLime;
    dbedSituacao.font.color:=clBlack;
  end
  else
  begin
    dbedSituacao.color:=clRed;
    dbedSituacao.font.color:=clWhite;
  end;
  lblVersaoEstorno.top:=dbedVersaoEstorno.top+4;
  lblVersaoEstorno.Visible :=qryRubricasDetalhe.FieldByName('FLGESTORNO').asinteger = 3;
  dbedVersaoEstorno.Visible:=qryRubricasDetalhe.FieldByName('FLGESTORNO').asinteger = 3;
  LblPortForma.top:=dbedPortForma.top-3;
  LblPortForma.Visible     :=qryRubricasDetalhe.FieldByName('FLGESTORNO').asinteger = 0;
  dbedPortForma.Visible    :=qryRubricasDetalhe.FieldByName('FLGESTORNO').asinteger = 0;
end;

procedure TfrmFrameConsultaHistorico.qryPreviaAfterScroll(
  DataSet: TDataSet);
begin
    QryObtemBasePagamento.close;
    QryObtemBasePagamento.ParamByName('IDHSTFOLHABENEF').AsString    := qrySelecao.FieldByName('IDHSTFOLHABENEF').AsString;
    QryObtemBasePagamento.ParamByName('IDPESSOA').AsString           := qryPrevia.FieldByName('IDRESPONSAVEL').AsString;
    QryObtemBasePagamento.ParamByName('IDTITULAR').AsString          := qryPrevia.ParamByName('IDTITULAR').AsString;
    QryObtemBasePagamento.Open;


    qryConcCreditoEfetuado.close;
    qryConcCreditoEfetuado.ParamByName('IDHSTFOLHABENEF').AsString    := qrySelecao.FieldByName('IDHSTFOLHABENEF').AsString;
    qryConcCreditoEfetuado.ParamByName('IDPESSOA').AsString           := qryPrevia.FieldByName('IDRESPONSAVEL').AsString;
    qryConcCreditoEfetuado.ParamByName('IDTITULAR').AsString          := qryPrevia.ParamByName('IDTITULAR').AsString;
    qryConcCreditoEfetuado.Open;
end;

procedure TfrmFrameConsultaHistorico.dbgConcCreditoDrawDataCell(
  Sender: TObject; const Rect: TRect; Field: TField;
  State: TGridDrawState);
Var R : TRect;
begin
   inherited;
   R := Rect;
   Dec(R.Bottom,2);
   If Field = qryConcCreditoEfetuadoOBSERVACAO Then
   Begin
      If Not (gdSelected  in State) Then
         dbgConcCredito.Canvas.FillRect(Rect);
      DrawText(dbgConcCredito.Canvas.Handle,PChar(qryConcCreditoEfetuadoOBSERVACAO.AsString),Length(qryConcCreditoEfetuadoOBSERVACAO.AsString),R,DT_WORDBREAK);
   End;
end;

procedure TfrmFrameConsultaHistorico.dbgConcCreditoDblClick(
  Sender: TObject);
begin
   IF dbgConcCredito.Columns[dbgConcCredito.SelectedIndex].FieldName = 'NOMEARQUIVO' Then
   begin
      if qryConcCreditoEfetuado.FieldByName('CODIGORETORNO').Asstring <> '' then
      begin
         if qryConcCreditoEfetuado.FieldByName('EXTENSAOARQUIVO').Asstring <> '' then
         begin
            If FileExists(Sistema.TempDir + 'ARQUIVO'+qryConcCreditoEfetuado.FieldByName('EXTENSAOARQUIVO').Asstring) Then
              deletefile(Sistema.TempDir + 'ARQUIVO'+qryConcCreditoEfetuado.FieldByName('EXTENSAOARQUIVO').Asstring);

            TBlobField(qryConcCreditoEfetuado.FieldByName('ARQUIVOREGULARIZACAO')).SaveToFile(sistema.TempDir + 'ARQUIVO'+qryConcCreditoEfetuado.FieldByName('EXTENSAOARQUIVO').Asstring);

            If FileExists(Sistema.TempDir + 'ARQUIVO'+qryConcCreditoEfetuado.FieldByName('EXTENSAOARQUIVO').Asstring) Then
               ShellExecute(Handle, nil, Pchar(sistema.TempDir + 'ARQUIVO'+qryConcCreditoEfetuado.FieldByName('EXTENSAOARQUIVO').Asstring), nil, nil, SW_SHOWNORMAL);
         end;
      end;
   end;
end;

procedure TfrmFrameConsultaHistorico.dbgConcCreditoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
Var R : TRect;
begin
   inherited;
   R := Rect;
   Dec(R.Bottom,2);
   If Column.Field = qryConcCreditoEfetuadoOBSERVACAO Then
   Begin
      If Not (gdSelected  in State) Then
         dbgConcCredito.Canvas.FillRect(Rect);
      DrawText(dbgConcCredito.Canvas.Handle,PChar(qryConcCreditoEfetuadoOBSERVACAO.AsString),Length(qryConcCreditoEfetuadoOBSERVACAO.AsString),R,DT_WORDBREAK);
   End;

end;

//edilaine - SIG42986 - inicio
procedure TfrmFrameConsultaHistorico.AjustaFrame(pwsMaxMin :  TWindowState);
begin
  wsMaxMin := pwsMaxMin;

  AjustaPosicao;
end;

procedure TfrmFrameConsultaHistorico.AjustaPosicao;
begin
  if PageControl1.activePage = TabSheet2 then
  begin
    pnlDadosPagDir.BevelOuter := bvNone;
    pnlDadosPagDir.Visible := (wsMaxMin = wsMaximized);

    TabSheet2.repaint;
  end;
end;

procedure TfrmFrameConsultaHistorico.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  AjustaPosicao;
end;

procedure TfrmFrameConsultaHistorico.MostraBasePagamento;
begin
  QryObtemBasePagamento.close;
  QryObtemBasePagamento.ParamByName('IDHSTFOLHABENEF').AsString    := qrySelecao.FieldByName('IDHSTFOLHABENEF').AsString;
  QryObtemBasePagamento.ParamByName('IDPESSOA').AsString           := qryPrevia.FieldByName('IDRESPONSAVEL').AsString;
  QryObtemBasePagamento.ParamByName('IDTITULAR').AsString          := qryPrevia.ParamByName('IDTITULAR').AsString;
  QryObtemBasePagamento.Open;

  SqlCampos.Prepare;
  SqlCampos.Open;
  CdsBasePagamento.ReadOnly := false;
  CdsBasePagamento.delete;

  CdsBasePagamento.Insert;
  CdsBasePagamento.FieldByName('Campo').AsString                := 'Matricula';
  CdsBasePagamento.FieldByName('Valor').AsString                := QryObtemBasePagamento.FieldByName('MATRICULA').AsString;
  CdsBasePagamento.Insert;
  CdsBasePagamento.FieldByName('Campo').AsString                := 'Data Pagamento';
  CdsBasePagamento.FieldByName('Valor').AsString                := QryObtemBasePagamento.FieldByName('DATAPAGAMENTO').AsString;
  CdsBasePagamento.Insert;
  CdsBasePagamento.FieldByName('Campo').AsString                := 'Mês Pagamento';
  CdsBasePagamento.FieldByName('Valor').AsString                := QryObtemBasePagamento.FieldByName('MESCOBRANCA').AsString;
  CdsBasePagamento.Insert;
  CdsBasePagamento.FieldByName('Campo').AsString                := 'PMP';
  CdsBasePagamento.FieldByName('Valor').AsString                := iff(QryObtemBasePagamento.eof, '', FormatFloat('##0.00', QryObtemBasePagamento.FieldByName('PRAZOMEDIOPONDERADO').AsFloat));
  CdsBasePagamento.Insert;
  CdsBasePagamento.FieldByName('Campo').AsString                := 'Base Cálculo IR Regressivo';
  CdsBasePagamento.FieldByName('Valor').AsString                := iff(QryObtemBasePagamento.eof, '', FormatFloat('#,##0.00', QryObtemBasePagamento.FieldByName('BASECALCIRREGRESSIVO').AsCurrency));
  CdsBasePagamento.Insert;
  CdsBasePagamento.FieldByName('Campo').AsString                := 'Percentual IR Regressivo';
  CdsBasePagamento.FieldByName('Valor').AsString                := iff(QryObtemBasePagamento.eof, '', FormatFloat('##0.00', QryObtemBasePagamento.FieldByName('PERCENTUALIRREGRESSIVO').AsFloat));
  CdsBasePagamento.Insert;
  CdsBasePagamento.FieldByName('Campo').AsString                := 'Valor IR Regressivo';
  CdsBasePagamento.FieldByName('Valor').AsString                := iff(QryObtemBasePagamento.eof, '', FormatFloat('#,##0.00', QryObtemBasePagamento.FieldByName('VLRIRREGRESSIVO').AsCurrency));
  CdsBasePagamento.Insert;
  CdsBasePagamento.FieldByName('Campo').AsString                := 'Bruto';
  CdsBasePagamento.FieldByName('Valor').AsString                := iff(QryObtemBasePagamento.eof, '', FormatFloat('#,##0.00', QryObtemBasePagamento.FieldByName('VLRBRUTO').AsCurrency));
  CdsBasePagamento.Insert;
  CdsBasePagamento.FieldByName('Campo').AsString                := 'Desconto';
  CdsBasePagamento.FieldByName('Valor').AsString                := iff(QryObtemBasePagamento.eof, '', FormatFloat('#,##0.00', QryObtemBasePagamento.FieldByName('VLRDESCONTO').AsCurrency));
  CdsBasePagamento.Insert;
  CdsBasePagamento.FieldByName('Campo').AsString                := 'Liquido';
  CdsBasePagamento.FieldByName('Valor').AsString                := iff(QryObtemBasePagamento.eof, '', FormatFloat('#,##0.00', QryObtemBasePagamento.FieldByName('VLRLIQUIDO').AsCurrency));
  CdsBasePagamento.Insert;
  CdsBasePagamento.FieldByName('Campo').AsString                := 'Tipo Pagamento';
  CdsBasePagamento.FieldByName('Valor').AsString                := iff(QryObtemBasePagamento.eof, '', QryObtemBasePagamento.FieldByName('TIPOPAGAMENTO').AsString);
  CdsBasePagamento.Insert;
  //CdsBasePagamento.FieldByName('Campo').AsString                := 'Beneficío de Risco';
  //CdsBasePagamento.FieldByName('Valor').AsString                := iff(QryObtemBasePagamento.eof, '', iff(QryObtemBasePagamento.FieldByName('FLGRISCO').AsInteger = 0, 'Normal', 'Benefício de Risco'));
  CdsBasePagamento.Insert;
  CdsBasePagamento.FieldByName('Campo').AsString                := 'Pagamento Efetivado';
  CdsBasePagamento.FieldByName('Valor').AsString                := iff(QryObtemBasePagamento.eof, '', iff(QryObtemBasePagamento.FieldByName('FLGEFETIVADO').AsInteger = 0, 'Não efetivado', 'Efetivado'));
  CdsBasePagamento.Insert;
  CdsBasePagamento.FieldByName('Campo').AsString                := 'Versão da Folha';
  CdsBasePagamento.FieldByName('Valor').AsString                := qrySelecao.FieldByName('IDHSTFOLHABENEF').AsString+' - '+qrySelecao.FieldByName('HISTORICO').AsString;
  CdsBasePagamento.Insert;
  CdsBasePagamento.FieldByName('Campo').AsString                := 'Isento de IRRF';
  CdsBasePagamento.FieldByName('Valor').AsString                := iff(QryObtemBasePagamento.eof, '', iff(QryObtemBasePagamento.FieldByName('FLGISENTOIRRF').AsInteger = 0, 'Não Isento', 'Isento'));
  CdsBasePagamento.Insert;
  CdsBasePagamento.FieldByName('Campo').AsString                := 'Moléstia Grave';
  CdsBasePagamento.FieldByName('Valor').AsString                := iff(QryObtemBasePagamento.eof, '', iff(QryObtemBasePagamento.FieldByName('FLGMOLESTIAGRAVE').AsInteger = 0, 'Não Possui', 'Possui'));
  CdsBasePagamento.Insert;
  CdsBasePagamento.FieldByName('Campo').AsString                := 'Data Início Moléstia';
  CdsBasePagamento.FieldByName('Valor').AsString                := QryObtemBasePagamento.FieldByName('DATAINICIOMOLESTIA').AsString;
  CdsBasePagamento.Insert;
  CdsBasePagamento.FieldByName('Campo').AsString                := 'Data Fim Moléstia';
  CdsBasePagamento.FieldByName('Valor').AsString                := QryObtemBasePagamento.FieldByName('DATAFIMMOLESTIA').AsString;
  CdsBasePagamento.Insert;
  CdsBasePagamento.FieldByName('Campo').AsString                := 'Número Processo INSS';
  CdsBasePagamento.FieldByName('Valor').AsString                := QryObtemBasePagamento.FieldByName('NUMPROCINSS').AsString;
  CdsBasePagamento.Insert;
  CdsBasePagamento.FieldByName('Campo').AsString                := 'IR Total';
  CdsBasePagamento.FieldByName('Valor').AsString                := iff(QryObtemBasePagamento.eof, '', iff(QryObtemBasePagamento.FieldByName('FLGSOMAIRSUPINSS').AsInteger = 0, 'Não', 'Sim'));
  CdsBasePagamento.Insert;
  CdsBasePagamento.FieldByName('Campo').AsString                := 'N. Dependentes';
  CdsBasePagamento.FieldByName('Valor').AsString                := QryObtemBasePagamento.FieldByName('NUMDEPIRRF').AsString;
  CdsBasePagamento.Insert;
  CdsBasePagamento.FieldByName('Campo').AsString                := 'Banco';
  CdsBasePagamento.FieldByName('Valor').AsString                := iff(QryObtemBasePagamento.eof, '', QryObtemBasePagamento.FieldByName('NUMBANCO').AsString +' - '+ QryObtemBasePagamento.FieldByName('NOMEBANCO').AsString);
  CdsBasePagamento.Insert;
  CdsBasePagamento.FieldByName('Campo').AsString                := 'Agência';
  CdsBasePagamento.FieldByName('Valor').AsString                := iff(QryObtemBasePagamento.eof, '', QryObtemBasePagamento.FieldByName('NUMAGENCIA').AsString + ' - '+ QryObtemBasePagamento.FieldByName('NOMEAGENCIA').AsString);
  CdsBasePagamento.Insert;
  CdsBasePagamento.FieldByName('Campo').AsString                := 'Conta';
  CdsBasePagamento.FieldByName('Valor').AsString                := QryObtemBasePagamento.FieldByName('CONTACORRENTE').AsString;
  CdsBasePagamento.Insert;
  CdsBasePagamento.FieldByName('Campo').AsString                := 'Data de Nascimento';
  CdsBasePagamento.FieldByName('Valor').AsString                := QryObtemBasePagamento.FieldByName('DATANASC').AsString;
  CdsBasePagamento.Insert;
  CdsBasePagamento.FieldByName('Campo').AsString                := 'Portador Forma';
  CdsBasePagamento.FieldByName('Valor').AsString                := QryObtemBasePagamento.FieldByName('PORTADORFORMA').AsString;
  CdsBasePagamento.Insert;
  CdsBasePagamento.FieldByName('Campo').AsString                := 'CPF';
  CdsBasePagamento.FieldByName('Valor').AsString                := QryObtemBasePagamento.FieldByName('CPF_MASCARA').AsString;
  CdsBasePagamento.Insert;
  CdsBasePagamento.FieldByName('Campo').AsString                := 'IR Informativo';
  CdsBasePagamento.FieldByName('Valor').AsString                := iff(QryObtemBasePagamento.eof, '', FormatFloat('#,##0.00', QryObtemBasePagamento.FieldByName('IRINFORMATIVO').AsCurrency));
  CdsBasePagamento.Insert;
  CdsBasePagamento.FieldByName('Campo').AsString                := 'IR Informativo 13';
  CdsBasePagamento.FieldByName('Valor').AsString                := iff(QryObtemBasePagamento.eof, '', FormatFloat('#,##0.00', QryObtemBasePagamento.FieldByName('IRINFORMATIVO13').AsCurrency));
  CdsBasePagamento.Insert;
  CdsBasePagamento.FieldByName('Campo').AsString                := 'IR Compensado';
  CdsBasePagamento.FieldByName('Valor').AsString                := iff(QryObtemBasePagamento.eof, '', FormatFloat('#,##0.00', QryObtemBasePagamento.FieldByName('IRCOMPENSADO').AsCurrency));
  CdsBasePagamento.Insert;
  CdsBasePagamento.FieldByName('Campo').AsString                := 'IR Compensado 13';
  CdsBasePagamento.FieldByName('Valor').AsString                := iff(QryObtemBasePagamento.eof, '', FormatFloat('#,##0.00', QryObtemBasePagamento.FieldByName('IRCOMPENSADO13').AsCurrency));
  CdsBasePagamento.Insert;
  CdsBasePagamento.FieldByName('Campo').AsString                := 'Margem Consignável';
  CdsBasePagamento.FieldByName('Valor').AsString                := iff(QryObtemBasePagamento.eof, '', FormatFloat('#,##0.00', QryObtemBasePagamento.FieldByName('MARGEMCONSIGNAVEL').AsCurrency));
  CdsBasePagamento.Insert;
  CdsBasePagamento.FieldByName('Campo').AsString                := 'Renda Base';
  CdsBasePagamento.FieldByName('Valor').AsString                := iff(QryObtemBasePagamento.eof, '', FormatFloat('#,##0.00', QryObtemBasePagamento.FieldByName('RENDABASE').AsCurrency));
  CdsBasePagamento.Insert;
  CdsBasePagamento.FieldByName('Campo').AsString                := 'Margem Real';
  CdsBasePagamento.FieldByName('Valor').AsString                := iff(QryObtemBasePagamento.eof, '', FormatFloat('#,##0.00', QryObtemBasePagamento.FieldByName('MARGEMREAL').AsCurrency));

  CdsBasePagamento.Post;

  CdsBasePagamento.Filter := 'Campo is not null';
  CdsBasePagamento.Filtered := true;
  CdsBasePagamento.First;

  CdsBasePagamento.ReadOnly := true;
end;
//edilaine - SIG42986 - fim




end.
{------------------------------------------------------------------------------|
| UNIT: FFRAMECONSULTAHISTORICO                                                |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   FRAME COM INFORMAÇÕES DE PAGAMENTO DE RUBRICA DE UMA VERSÃO.               |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 26/06/2002 A 27/06/2002                         |
| PENDÊNCIA:                                                                   |
| VERSÃO PARA LIBERAÇÃO: 3.02.13j                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - CONSTRUÇÃO DO FRAME.                                                       |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 20/02/2003 A 20/02/2003                         |
| PENDÊNCIA: 11932                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.03H                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| VINCULADA A PENDENCIA 11932 PARA EXIBIR CORRETAMENTE O VALOR INFORMATIVO NA  |
| CONSULTA                                                                     |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 07/08/2003 A 07/08/2003                         |
| PENDÊNCIA: 14796                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.01                                               |
| CLIENTE: CBS                                                                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - PEGAR O NUMDEPIRRF E FLGISENTOIRRF DA HISTRUBSAL PRIORITARIAMENTE E PESSOA |
| FISICA CASO ESTEJA NULO NA HISTRUBSAL.                                       |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 08/08/2003 A 08/08/2003                         |
| PENDÊNCIA: 14816                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.01                                               |
| CLIENTE: CBS                                                                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - COLOCAR DATA DE PAGAMENTO NA ORDENAÇÃO DO GRID DE VERSÕES.                 |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: André Tavares                                                 |
| PERÍODO DE IMPLEMENTAÇÃO: DE 05/02/2004                                      |
| PENDÊNCIA: 15109 e 16058                                                     |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: FCRT                                                                |
| DESCRIÇÃO DA CORREÇÃO: ajuste no join da query e inclusão da coluna que      |
| contém o codigo de rubrica extrerno.                                         |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 20/09/2004 A 20/09/2004                         |
| PENDÊNCIA: 17727                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.00.09                                               |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Ajustes na exibição das informações de pagamento estornado. Exibir cores   |
| diferenciadas para realçar os pagementos estornados. Ajuste na visibilidade  |
| dos componentes para pagamentos estornardos. Ajuste na descrição e posição   |
| do componente do portadorforma.                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 26/11/2004 A 26/11/2004                         |
| PENDÊNCIA: 17911                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.14                                               |
| CLIENTE: FUNCEF                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| AJUSTE NA QUERY QRYFATOR PARA EXIBIR O NOME DOS BENEFICIARIOS DO GRUPO DE    |
| PENSÃO VINCULADOS AO RESPONSAVEL.                                            |
|------------------------------------------------------------------------------|}

