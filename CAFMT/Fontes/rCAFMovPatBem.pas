unit rCAFMovPatBem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppVar, ppBands, ppClass, ppCtrls, ppPrnabl, ppCache, ppProd,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, Db, Wwdatsrc,
  DBTables, Wwquery, uCmRptManager, TXComp, CmParamReport;

type
  TRptCAFMovPatBem = class(TFrmCmReport)
    qryMovBem: TwwQuery;
    qryMovBemPLACA: TFloatField;
    qryMovBemIDBEM: TFloatField;
    qryMovBemDESCBEM: TStringField;
    qryMovBemCLASSE: TStringField;
    qryMovBemDATAMOVIMENTACAO: TDateTimeField;
    qryMovBemDESCTIPOMOVIMENTACAO: TStringField;
    qryMovBemVALOFI: TFloatField;
    qryMovBemDESCGRUPO: TStringField;
    dsMovBem: TwwDataSource;
    ppMovBem: TppBDEPipeline;
    rpMovBem: TppReport;
    ppHeaderBand16: TppHeaderBand;
    ppLabel24: TppLabel;
    ppLine33: TppLine;
    ppLabel38: TppLabel;
    rpMovBemLabel6: TppLabel;
    rpMovBemLabel7: TppLabel;
    rpMovBemLabel8: TppLabel;
    rpMovBemLabel9: TppLabel;
    ppDetailBand16: TppDetailBand;
    rpMovBemDBText4: TppDBText;
    rpMovBemDBText5: TppDBText;
    rpMovBemDBText6: TppDBText;
    ppFooterBand16: TppFooterBand;
    ppLine34: TppLine;
    ppLabel39: TppLabel;
    ppCalc31: TppSystemVariable;
    ppCalc32: TppSystemVariable;
    rpMovBemGroup1: TppGroup;
    rpMovBemGroupHeaderBand1: TppGroupHeaderBand;
    rpMovBemLabel1: TppLabel;
    rpMovBemDBText1: TppDBText;
    rpMovBemLine2: TppLine;
    rpMovBemGroupFooterBand1: TppGroupFooterBand;
    rpMovBemGroup2: TppGroup;
    rpMovBemGroupHeaderBand2: TppGroupHeaderBand;
    rpMovBemLabel2: TppLabel;
    rpMovBemDBText2: TppDBText;
    rpMovBemLine1: TppLine;
    rpMovBemLabel3: TppLabel;
    rpMovBemLabel4: TppLabel;
    rpMovBemLabel5: TppLabel;
    rpMovBemCalc1: TppVariable;
    rpMovBemGroupFooterBand2: TppGroupFooterBand;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CrmRptCMChangeDataBaseName(Sender: TObject;
      sDataBaseName: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptCAFMovPatBem: TRptCAFMovPatBem;

implementation

{$R *.DFM}

procedure TRptCAFMovPatBem.CrmRptCMBeforePrint(Sender: TObject);
begin
   inherited;
   with qryMovBem do
   begin
      Close;
      SQL.Clear;
      //----------------------------------------------------------------------------------
      SQL.Add('SELECT B.PLACA,                                                                        ');
      SQL.Add('       B.IDBEM,                                                                        ');
      SQL.Add('       B.DESBEM AS DESCBEM,                                                            ');
      SQL.Add('       G.CLASSE,                                                                       ');
      SQL.Add('       G.NOME AS DESCGRUPO,                                                            ');
      SQL.Add('       HM.DATAMOVIMENTACAO,                                                            ');
      SQL.Add('       TM.DESCTIPOMOVIMENTACAO,                                                        ');
      SQL.Add('       NVL(VM.VALOFI, 0) AS VALOFI                                                     ');
      SQL.Add('FROM   BEM B,                                                                          ');
      SQL.Add('       GRUPO G,                                                                        ');
      SQL.Add('       HISTORICOMOVIMENTACAO HM,                                                       ');
      SQL.Add('       VALORMOVIMENTACAO VM,                                                           ');
      SQL.Add('       TIPOMOVIMENTACAO TM                                                             ');
      SQL.Add('WHERE ((HM.DATAMOVIMENTACAO >= TO_DATE(' + #39 + CmpRptCM.ParamValues[0].AsString + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ')) AND' );
      SQL.Add('       (HM.DATAMOVIMENTACAO <= TO_DATE(' + #39 + CmpRptCM.ParamValues[1].AsString + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ')))' );
      //----------------------------------------------------------------------------------
      if not CmpRptCM.ParamValues[2].IsNull then
         SQL.Add('   AND (B.IDGRUPO = ' + CmpRptCM.ParamValues[2].AsString + ')');
      //----------------------------------------------------------------------------------
      if not CmpRptCM.ParamValues[3].IsNull then
         SQL.Add('   AND (B.IDBEM = ' + CmpRptCM.ParamValues[3].AsString + ')');
      //----------------------------------------------------------------------------------
      if not CmpRptCM.ParamValues[4].IsNull then
         SQL.Add('   AND (HM.IDTIPOMOVIMENTACAO = ' + CmpRptCM.ParamValues[4].AsString + ')');
      //----------------------------------------------------------------------------------
      SQL.Add('  AND (B.IDBEM               = HM.IDBEM)                                               ');
      SQL.Add('  AND (B.IDPESSOA            = HM.IDPESSOA)                                            ');
      SQL.Add('  AND (G.IDGRUPO             = B.IDGRUPO)                                               ');
      SQL.Add('  AND (HM.IDMOVIMENTACAO     = VM.IDMOVIMENTACAO(+))                                   ');
      SQL.Add('  AND (TM.IDTIPOMOVIMENTACAO = HM.IDTIPOMOVIMENTACAO)                                  ');
      SQL.Add('ORDER BY G.CLASSE, B.PLACA, HM.DATAMOVIMENTACAO, HM.IDMOVIMENTACAO                     ');
   end;
   //-------------------------------------------------------------------------------------
   rpMovBemLabel7.Text := CmpRptCM.ParamValues[0].AsString;
   rpMovBemLabel8.Text := CmpRptCM.ParamValues[1].AsString;
   qryMovBem.Open;
end;

procedure TRptCAFMovPatBem.CrmRptCMChangeDataBaseName(Sender: TObject; sDataBaseName: String);
begin
   inherited;
   if qryMovBem.Active then
      qryMovBem.Close;
   qryMovBem.DataBaseName := sDataBaseName;
end;

end.
