unit RTransfFundos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, Db, DBClient,
  uCMClientDataSet, uCmSqlParams, uExtensoCM, Wwdatsrc, ppDB, ppDBPipe,
  ppDBBDE, ppBands, ppMemo, ppCtrls, ppClass, ppStrtch, ppPrnabl, ppCache,
  ppComm, ppRelatv, ppProd, ppReport, TXRB;

type
  TRptTransfFundos = class(TFrmCmReport)
    spTransfFundos: TCMSqlParams;
    cdsTransfFundos: TCMClientDataSet;
    Extenso: TExtensoCM;
    rpTransfFundos: TppReport;
    ppDetailBand5: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    rpEmisTransfDBText1: TppDBText;
    rpEmisTransfDBText3: TppDBText;
    rpEmisTransfDBMemo2: TppDBMemo;
    ppFooterBand5: TppFooterBand;
    rpEmisTransfShape3: TppShape;
    rpEmisTransfShape6: TppShape;
    rpEmisTransfShape7: TppShape;
    rpEmisTransfShape8: TppShape;
    rpEmisTransfShape9: TppShape;
    rpEmisTransfShape10: TppShape;
    rpEmisTransfLabel8: TppLabel;
    rpEmisTransfLabel9: TppLabel;
    rpEmisTransfLabel10: TppLabel;
    rpEmisTransfLabel11: TppLabel;
    rpEmisTransfLabel12: TppLabel;
    rpEmisTransfLabel13: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppShape2: TppShape;
    rpEmisTransfShape1: TppShape;
    rpEmisTransfShape2: TppShape;
    ppDBText13: TppDBText;
    ppLabel19: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel24: TppLabel;
    ppLabel26: TppLabel;
    rpEmisTransfLabel1: TppLabel;
    rpEmisTransfLabel2: TppLabel;
    rpEmisTransfLabel4: TppLabel;
    rpEmisTransfLabel5: TppLabel;
    rpEmisTransfShape4: TppShape;
    rpEmisTransfShape5: TppShape;
    rpEmisTransfDBText2: TppDBText;
    rpEmisTransfLabel3: TppLabel;
    rpEmisTransfLabel6: TppLabel;
    rpEmisTransfLine2: TppLine;
    rpEmisTransfLabel7: TppLabel;
    rpEmisTransfDBText4: TppDBText;
    rpEmisTransfLine3: TppLine;
    rpEmisTransfLabel15: TppLabel;
    rpEmisTransfShape11: TppShape;
    rpEmisTransfLine1: TppLine;
    rpEmisTransfLabel14: TppLabel;
    rpEmisTransfLabel16: TppLabel;
    ppmExtenso: TppMemo;
    rpEmisTransfDBMemo1: TppDBMemo;
    rpEmisTransfDBText5: TppDBText;
    rpEmisTransfDBText6: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    pplTransfFundos: TppBDEPipeline;
    dsTransfFundos: TwwDataSource;
    ppDBText1: TppDBText;
    ppDBText5: TppDBText;
    sqlVALMINTRASNFDIA: TCMSqlParams;
    cdsVALMINTRASNFDIA: TCMClientDataSet;
    ppLabel1: TppLabel;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppDBText14: TppDBText;

    procedure ppmExtensoPrint(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);


  private { Private declarations }


  public  { Public declarations }


  end;



var
  RptTransfFundos: TRptTransfFundos;



implementation
{$R *.DFM}



procedure TRptTransfFundos.CrmRptCMBeforePrint(Sender: TObject);
begin
   inherited;

   sqlVALMINTRASNFDIA.Prepare;
   sqlVALMINTRASNFDIA.ParamByName('idEmpresa').AsFloat:=CrmRptCM.IdEmpresa ;
   sqlVALMINTRASNFDIA.open;

   spTransfFundos.Prepare;
   spTransfFundos.ParamByName('IDPessoa').AsFloat:=CrmRptCM.IdEmpresa ;
   spTransfFundos.ParamByName('DataIni').AsString:=
           FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[0].AsDateTime);
   spTransfFundos.ParamByName('DataFim').AsString:=
           FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[1].AsDateTime);

   spTransfFundos.ParamByName('VALMINTRASNFDIA').AsFloat := cdsVALMINTRASNFDIA.fieldbyname('VALMINTRASNFDIA').AsFloat;
   spTransfFundos.Open;
end;



procedure TRptTransfFundos.ppmExtensoPrint(Sender: TObject);
begin
   inherited;
   Extenso.SetaIdiomaPadrao;
   Extenso.SetaMoedaPadrao;
   Extenso.Valor             :=cdsTransfFundos.FieldByName('VALORLANCFINAN').AsFloat;
   Extenso.CaracterAdicional :='* ';
   Extenso.CompletaExtenso   :=True;
   Extenso.TamanhoLinha      :=500;
   Extenso.Escreve;
   ppmExtenso.Lines.Text:=Extenso.LinhasExtenso.Linha1;
end;



end.
