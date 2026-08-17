//******************************************************************************
// Data      : 28/02/2007
// Código    : AL_3
// Pendencia : 24551
// SOL       : 47397
// Desc      : Implementação para que o saldo anterior e posterior,
//             quando existirem mais de uma conta, apareça a quantidade real.
//******************************************************************************
// Data     : 08/11/2006
// Código   : AL_2
// Pendencia: 23690
// SOL      : 47397
// Desc     : Alteração do Lay out para colocar os Saldos em Colunas
//******************************************************************************
// Data     : 02/10/2006
// Código   : AL_1
// Pendencia: 22967
// Desc     : Segregação de Planos
//******************************************************************************
// Data     : 30/08/2006
// Pendencia: 22957
// Desc     : Implementação da Consulta
//******************************************************************************

unit RConsTransPlanosRV;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, TXRB, CmParamReport, ppDB, ppDBPipe,
  ppDBBDE, ppBands, ppClass, ppVar, ppCtrls, ppPrnabl, ppCache, ppComm,
  ppRelatv, ppProd, ppReport, Db, DBClient, uCMClientDataSet, uCmSqlParams,
  uCtrlPadroes, uCtrlRendaVariavel, uMensErro;

type
  TRelConsTransPlanosRV = class(TFrmCmReport)
    sprConsTransPlanosMT: TCMSqlParams;
    CdsConsTransPlanosMT: TCMClientDataSet;
    dsConsTransPlanosMT: TDataSource;
    rptConsTransPlanosMT: TppReport;
    ppHeaderBand1: TppHeaderBand;
    lblTituloRelatorio: TppLabel;
    lblEmpresa: TppLabel;
    ppDBImage1: TppDBImage;
    lblPeriodo: TppLabel;
    ppDetailBand1: TppDetailBand;
    shpDetalhe: TppShape;
    //AL_3
    ppdbSldAntOrig: TppDBText;
    ppdbSldAntDest: TppDBText;
    ppFooterBand1: TppFooterBand;
    lblSistema: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLine2: TppLine;
    ppSystemVariable2: TppSystemVariable;
    pplPlanoOrig: TppLabel;
    pplData: TppLabel;
    pplBoleta: TppLabel;
    pplSldQtdAntOrig: TppLabel;
    pplCarteira: TppLabel;
    pplSldQtdAntDest: TppLabel;
    pplConsTransPlanosMT: TppBDEPipeline;
    //AL_3
    CdsConsTransPlanosMTPERCENTUAL: TFloatField;
    CdsConsTransPlanosMTSALDOANTORIG: TFloatField;
    CdsConsTransPlanosMTSALDOATUORIG: TFloatField;
    CdsConsTransPlanosMTSALDOANTDEST: TFloatField;
    CdsConsTransPlanosMTSALDOATUDEST: TFloatField;
    //AL_3
    CdsConsTransPlanosMTIDINVESTIMENTO: TFloatField;
    //AL_3
    CdsConsTransPlanosMTPLANOORIG: TStringField;
    CdsConsTransPlanosMTPLANODEST: TStringField;
    CdsConsTransPlanosMTDESCCARTINVEST: TStringField;
    ppShape1: TppShape;
    pplPlanoDest: TppLabel;
    pplQtdTransf: TppLabel;
    pplQtdRecebida: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    CdsConsTransPlanosMTQTDTRANSFORIG: TFloatField;
    CdsConsTransPlanosMTQTDTRANSFDEST: TFloatField;
    pplSldAtuOrig: TppLabel;
    pplSldAtuDest: TppLabel;
    ppdbSldAtuOrig: TppDBText;
    ppdbSldAtuDest: TppDBText;
    pplPercentual: TppLabel;
    ppDBText3: TppDBText;
    CdsConsTransPlanosMTDESCINVESTIMENTO: TStringField;
    ppLabel1: TppLabel;
    //AL_3
    CdsConsTransPlanosMTTIPOSALDO: TStringField;
    CdsConsTransPlanosMTGRUPO: TMemoField;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText7: TppDBText;
    ppLabel3: TppLabel;
    ppLabel2: TppLabel;
    //AL_3
    CdsConsTransPlanosMTDATAOPERACAO: TDateTimeField;
    CdsConsTransPlanosMTNUMDOCUMENTO: TStringField;
    ppdbData: TppDBText;
    ppdbCarteira: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText4: TppDBText;
    ppdbBoleta: TppDBText;
    ppLine1: TppLine;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure shpDetalhePrint(Sender: TObject);
    procedure rptConsTransPlanosMTStartPage(Sender: TObject);
    procedure shpRodapePrint(Sender: TObject);
  private
    { Private declarations }
    cCorZebra : TColor;
    CtrlRendaVariavel : TCtrlRendaVariavel;
  public
    { Public declarations }
  end;

var
  RelConsTransPlanosRV: TRelConsTransPlanosRV;
  iCarteira, iPlanPrevOrig, iPlanPrevDest, iInvestimento : Integer;


implementation

//AL_3
uses UDiasUteisInv;

{$R *.DFM}

procedure TRelConsTransPlanosRV.CrmRptCMBeforePrint(Sender: TObject);
//AL_3
var dDataAnt : TDateTime;
begin
  inherited;
  iCarteira := -1;
  iInvestimento := -1;
  iPlanPrevOrig := -1;
  iPlanPrevDest := -1;
  //AL_3
  if Trim(CmpRptCM.ParamByName('DataFinal').AsString) = '' then
  begin
      MsgDlg('Informe a Data.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      Exit;
  end;

  if not CmpRptCM.ParamByName('Carteira').IsNull then
     iCarteira := CmpRptCM.ParamByName('Carteira').AsInteger;

  if not CmpRptCM.ParamByName('Investimento').IsNull then
     iInvestimento := CmpRptCM.ParamByName('Investimento').AsInteger;

  if not CmpRptCM.ParamByName('PlanoOrigem').IsNull then
     iPlanPrevOrig := CmpRptCM.ParamByName('PlanoOrigem').AsInteger;
  //AL_3
  dDataAnt := DiasUteisInv.UltDiaUtilAnterior(CmpRptCM.ParamByName('DataFim').AsDateTime,-1,1,'',True,False,False);     

  lblPeriodo.Caption := CmpRptCM.ParamByName('DataFim').AsString;

  CdsConsTransPlanosMT.Data := CtrlRendaVariavel.ListOperTrcPlanos(dDataAnt,
                                                                   CmpRptCM.ParamByName('DataFim').AsDateTime,
                                                                   iInvestimento,
                                                                   iCarteira,
                                                                   iPlanPrevOrig);
end;

procedure TRelConsTransPlanosRV.FormCreate(Sender: TObject);
begin
   inherited;
   CtrlRendaVariavel := TCtrlRendaVariavel.Create;
   CtrlRendaVariavel.InitializeAs(Padroes);
end;

procedure TRelConsTransPlanosRV.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FreeAndNil(CtrlRendaVariavel);
   inherited;
end;

procedure TRelConsTransPlanosRV.shpDetalhePrint(Sender: TObject);
begin
  inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra
end;

procedure TRelConsTransPlanosRV.rptConsTransPlanosMTStartPage(Sender: TObject);
begin
   lblTituloRelatorio.Caption := rptConsTransPlanosMT.PrinterSetup.DocumentName;
   inherited;
   cCorZebra := $00E3E3E3
end;

procedure TRelConsTransPlanosRV.shpRodapePrint(Sender: TObject);
begin
   inherited;
   TppShape(Sender).Brush.Color := cCorZebra
end;

end.
