Unit RConsTransPlanosDireitosRV;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCmReport, ppBands, ppClass, ppVar, ppCtrls, ppPrnabl, ppCache, ppProd,
   ppReport, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE, uCmSqlParams, Db,
   DBClient, uCMClientDataSet, uCmRptManager, TXComp, TXRB, CmParamReport,
   uCtrlPadroes, uCtrlRendaVariavel, uMensErro, FConsTransPlanosDireitosMT,
   ppModule, daDataModule;

Type
   TRelConsTransPlanosDireitosRV = Class(TFrmCmReport)
      CdsConsTransPlanosDireitosMT: TCMClientDataSet;
      dsConsTransPlanosDireitosMT: TDataSource;
      pplConsTransPlanosDireitosMT: TppBDEPipeline;
      rptConsTransPlanosDireitosMT: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppShape1: TppShape;
      lblTituloRelatorio: TppLabel;
      lblEmpresa: TppLabel;
      ppDBImage1: TppDBImage;
      lblPeriodos: TppLabel;
      pplPlanoOrig: TppLabel;
      pplCarteira: TppLabel;
      pplData: TppLabel;
      pplPlanoDest: TppLabel;
      pplSldAtuDest: TppLabel;
      pplPercentual: TppLabel;
      ppDetailBand1: TppDetailBand;
      shpDetalhe: TppShape;
      ppdbSldAtuDest: TppDBText;
      ppDBText3: TppDBText;
      ppLabel2: TppLabel;
      ppFooterBand1: TppFooterBand;
      lblSistema: TppLabel;
      ppLine2: TppLine;
      ppSystemVariable2: TppSystemVariable;
      ppSystemVariable1: TppSystemVariable;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppdbData: TppDBText;
      ppdbCarteira: TppDBText;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppLine1: TppLine;
      ppGroupFooterBand1: TppGroupFooterBand;
      sprConsTransPlanosDireitosMT: TCMSqlParams;
      lblinicio: TppLabel;
      ppLabel5: TppLabel;
      lblfim: TppLabel;
      ppLabel1: TppLabel;
      ppDBText4: TppDBText;
      ppDBText8: TppDBText;
      ppLabel3: TppLabel;
      ppDBText1: TppDBText;
      ppLabel4: TppLabel;
      ppLabel6: TppLabel;
      ppDBCalc1: TppDBCalc;
      CdsConsTransPlanosDireitosMTIDOPERACAODIREITO: TFloatField;
      CdsConsTransPlanosDireitosMTDESCINVESTIMENTO: TStringField;
      CdsConsTransPlanosDireitosMTQUANTIDADEANTERIORDAORIGEM: TFloatField;
      CdsConsTransPlanosDireitosMTVALORANTERIORDAORIGEM: TFloatField;
      CdsConsTransPlanosDireitosMTDATADAOPERACAO: TDateTimeField;
      CdsConsTransPlanosDireitosMTBOLETA: TStringField;
      CdsConsTransPlanosDireitosMTIDBOLETA: TStringField;
      CdsConsTransPlanosDireitosMTDATATRANSF: TDateTimeField;
      CdsConsTransPlanosDireitosMTQTDTRANSF: TFloatField;
      CdsConsTransPlanosDireitosMTVLRTRANSF: TFloatField;
      CdsConsTransPlanosDireitosMTQTDATUALORIG: TFloatField;
      CdsConsTransPlanosDireitosMTVLRATUALORIG: TFloatField;
      CdsConsTransPlanosDireitosMTQTDDEST: TFloatField;
      CdsConsTransPlanosDireitosMTVLRDEST: TFloatField;
      CdsConsTransPlanosDireitosMTDATADESTINO: TDateTimeField;
      CdsConsTransPlanosDireitosMTVALORATUALDESTINO: TFloatField;
      CdsConsTransPlanosDireitosMTBOLETATRANSF: TStringField;
      CdsConsTransPlanosDireitosMTDESCCARTINVESTGRD: TStringField;
      CdsConsTransPlanosDireitosMTDESCCARTINVESTGRD_1: TStringField;
      CdsConsTransPlanosDireitosMTDESCTIPOOPERACAOGRD: TStringField;
      CdsConsTransPlanosDireitosMTPLANOORIGEMGRD: TStringField;
      CdsConsTransPlanosDireitosMTPU: TFloatField;
      CdsConsTransPlanosDireitosMTPERCENTUAL: TFloatField;
      CdsConsTransPlanosDireitosMTPLANODESTINOGRD: TStringField;
      daDataModule1: TdaDataModule;
      Procedure FormCreate(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure rptConsTransPlanosDireitosMTBeforePrint(Sender: TObject);
   Private
      { Private declarations }
      CtrlRendaVariavel: TCtrlRendaVariavel;
      TransPlanosDireitosMT: TfrmConsTransPlanosDireitosMT;
   Public
      { Public declarations }
   End;

Var
   RelConsTransPlanosDireitosRV: TRelConsTransPlanosDireitosRV;
   iCarteira, iPlanPrevOrig, iPlanPrevDest, iInvestimento: Integer;

Implementation

{$R *.DFM}

Procedure TRelConsTransPlanosDireitosRV.FormCreate(Sender: TObject);
Begin
   Inherited;
   CtrlRendaVariavel := TCtrlRendaVariavel.Create;
   CtrlRendaVariavel.InitializeAs(Padroes);

End;

Procedure TRelConsTransPlanosDireitosRV.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   FreeAndNil(CtrlRendaVariavel);
   Inherited;

End;

Procedure TRelConsTransPlanosDireitosRV.rptConsTransPlanosDireitosMTBeforePrint(
   Sender: TObject);
Begin

   Inherited;
   lblfim.caption := DatetoStr(ddatafim);
   lblinicio.caption := DatetoStr(ddataini);

End;

End.

