unit DRelatDemFinanceiro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE;

type
  TdtmRelatDemFinanceiro = class(TdtmReports)
    pplDemFinan: TppBDEPipeline;
    dsDemFinan: TwwDataSource;
    qryDemFinan: TwwQuery;
    rpDemFinan: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    DBText6: TppDBText;
    Line4: TppLine;
    ppLabel4: TppLabel;
    DBText1: TppDBText;
    ppLine3: TppLine;
    Line3: TppLine;
    DBText7: TppDBText;
    DBText3: TppDBText;
    dbtValor: TppDBText;
    ppLabel5: TppLabel;
    DBCalc1: TppDBCalc;
    Line5: TppLine;
    ppLabel6: TppLabel;
    DBText2: TppDBText;
    ppLine4: TppLine;
    DBDescStatus: TppDBText;
    ppLabel7: TppLabel;
    DBText8: TppDBText;
    ppDBText1: TppDBText;
    pplDataFinal: TppLabel;
    ppLabel8: TppLabel;
    ppLine5: TppLine;
    pplSaldoReal: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    procedure pplDataFinalPrint(Sender: TObject);
    procedure dbtValorPrint(Sender: TObject);
    procedure rpDemFinanBeforePrint(Sender: TObject);
    procedure pplSaldoRealPrint(Sender: TObject);
    procedure ppSummaryBand1BeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ppGroupHeaderBand3BeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    dDataFinal    : TDateTime;
    rTotalReal    : Real;
    bFim          : Boolean;
    sDescStatus   : String;
    function MostraParam(Form: string): boolean;override;
  end;

var
  dtmRelatDemFinanceiro: TdtmRelatDemFinanceiro;

implementation

uses FParamDemFinanceiro;

{$R *.DFM}

{ TdtmRelatDemFinanceiro }

procedure TdtmRelatDemFinanceiro.FormCreate(Sender: TObject);
begin
   inherited;
   sDescStatus:='';
end;

function TdtmRelatDemFinanceiro.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
     if (UPPERCASE(Form) = 'FRMPARAMDEMFINANCEIRO') then
        frm := TfrmParamDemFinanceiro.Create(Application)
     else
        frm := nil;

     if frm = nil then
        Result := false
     else
     begin
          with frm do
          begin
             Result := (ShowModal = mrOk);
             free;
          end;
     end;
end;

procedure TdtmRelatDemFinanceiro.rpDemFinanBeforePrint(Sender: TObject);
begin
   inherited;
   bFim:=False;
   rTotalReal:=qryDemFinan.FieldByName('SALDOCONTAB').AsFloat;
end;

procedure TdtmRelatDemFinanceiro.ppSummaryBand1BeforePrint(
  Sender: TObject);
begin
   inherited;
   bFim:=True;
   sDescStatus:='';
   DBDescStatus.Visible:=True;
end;

procedure TdtmRelatDemFinanceiro.pplDataFinalPrint(Sender: TObject);
begin
   pplDataFinal.Caption:='Data Final: '+FormatDateTime('dd/mm/yyyy',dDataFinal);
end;

procedure TdtmRelatDemFinanceiro.dbtValorPrint(Sender: TObject);
begin
   if (Pos('B)',qryDemFinan.FieldByName('DESCSTATUS').AsString)<>0) and not(bFim) then
      rTotalReal:=rTotalReal+qryDemFinan.FieldByName('SALDOANA').AsFloat;
end;

procedure TdtmRelatDemFinanceiro.pplSaldoRealPrint(Sender: TObject);
begin
   pplSaldoReal.Caption:=FormatFloat('#,##0.00',rTotalReal);
end;

procedure TdtmRelatDemFinanceiro.ppGroupHeaderBand3BeforePrint(
  Sender: TObject);
begin
   //if bFim then Exit;
   if (sDescStatus<>Trim(qryDemFinan.FieldByName('DESCSTATUS').AsString)) then
    begin
       DBDescStatus.Visible:=True;
       sDescStatus:=Trim(qryDemFinan.FieldByName('DESCSTATUS').AsString);
    end
   else
    DBDescStatus.Visible:=False;
end;

end.
