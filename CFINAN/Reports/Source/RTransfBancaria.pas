unit RTransfBancaria;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, TXRB, CmParamReport, ppCtrls, ppPrnabl,
  ppClass, ppBands, ppCache, Db, ppDB, ppDBPipe, ppComm, ppRelatv, ppProd,
  ppReport, DBClient, uCMClientDataSet, uCmSqlParams, uCtrlTransfBancaria,
  uCtrlPadroes, uSistema, ppVar, ppStrtch, ppMemo;

type
  TrptTranfBancaria = class(TFrmCmReport)
    cdsPrincipal: TCMClientDataSet;
    ppReport1: TppReport;
    ppPrincipal: TppDBPipeline;
    dsPrincipal: TDataSource;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBImage3: TppDBImage;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppLblTitulo: TppLabel;
    cdsLogo: TCMClientDataSet;
    DsLogo: TDataSource;
    ppLogo: TppDBPipeline;
    ppLogoppField1: TppField;
    ppLogoppField2: TppField;
    ppLogoppField3: TppField;
    ppLine13: TppLine;
    lblSistema: TppLabel;
    ppCalc11: TppSystemVariable;
    ppCalc12: TppSystemVariable;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppDBText3: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText4: TppDBText;
    ppLabel5: TppLabel;
    ppDBText5: TppDBText;
    ppLabel6: TppLabel;
    ppDBText6: TppDBText;
    ppLabel7: TppLabel;
    ppDBText7: TppDBText;
    ppLine2: TppLine;
    ppLabel9: TppLabel;
    ppDBText9: TppDBText;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppLabel8: TppLabel;
    ppLabel10: TppLabel;
    ppLblPerIni: TppLabel;
    pplblPerFim: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLabel11: TppLabel;

    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormDestroy(Sender: TObject);


  private { Private declarations }

    CtrlTransfBancaria : TCtrlTransfBancaria;


  public  { Public declarations }


  end;



var
  rptTranfBancaria: TrptTranfBancaria;



implementation
{$R *.DFM}



procedure TrptTranfBancaria.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  CtrlTransfBancaria := TCtrlTransfBancaria.Create;
  CtrlTransfBancaria.InitializeAs(Padroes);
  cdsLogo.data := CtrlTransfBancaria.ListaImagem(Sistema.IdEmpresa);
  cdsPrincipal.data := CtrlTransfBancaria.ListTransfContasBancarias( DateToStr( CmpRptCM.ParamValues[0].AsDateTime ), DateToStr( CmpRptCM.ParamValues[1].AsDateTime ) );
  ppLblPerIni.Caption := DateToStr( CmpRptCM.ParamValues[0].AsDateTime ) ;
  pplblPerFim.Caption := DateToStr( CmpRptCM.ParamValues[1].AsDateTime ) ;

end;



procedure TrptTranfBancaria.FormDestroy(Sender: TObject);
begin
  inherited;
  CtrlTransfBancaria.Free;
end;



end.
