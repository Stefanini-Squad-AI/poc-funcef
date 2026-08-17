unit DtmRptSaf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppCtrls, ppBands, ppPrnabl, ppClass, ppProd, ppReport, Db,
  DBTables, Wwquery, Wwdatsrc, ppComm, ppCache, ppDB, ppDBBDE, ppVar,
  ppRelatv, ppDBPipe;

type
  TDRptSaf = class(TdtmReports)
    PpFornCliSc: TppBDEPipeline;
    DsFornCliSc: TwwDataSource;
    QryFornCliSc: TwwQuery;
    RptForCliSc: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    BDetalhe: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    QryFornCliScIDFORCLI: TFloatField;
    QryFornCliScNOME: TStringField;
    QryFornCliScFC: TStringField;
    RptForCliScDBText1: TppDBText;
    RptForCliScDBText2: TppDBText;
    QryFornCliScDESCGRUPO: TStringField;
    RptForCliScDBText3: TppDBText;
    RptForCliScLine1: TppLine;
    SpDetalhe: TppShape;
    ppCalc1: TppSystemVariable;
    ppCalc2: TppSystemVariable;
    procedure QryFornCliScBeforeOpen(DataSet: TDataSet);
    procedure QryFornCliScCalcFields(DataSet: TDataSet);
    procedure BDetalheBeforePrint(Sender: TObject);
  private
    { Private declarations }
    function MostraParam(Form: string): boolean; Override;
  public
    { Public declarations }
  end;

var
  DRptSaf: TDRptSaf;

implementation

{$R *.DFM}

Uses uSistema;

procedure TDRptSaf.QryFornCliScBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  QryFornCliSc.Params[0].AsFloat := Sistema.IdEmpresa;
end;

function TDRptSaf.MostraParam(Form: string): boolean;
var frm : TForm;
begin
     if (Trim(Form) = '') then
     Begin
        Result := True;
        Exit;
     End;

     if (AnsiUpperCase(Form) = 'FPARAMCCSAF') then
     Begin
        If QryFornCliSc.Active Then QryFornCliSc.Close;
        QryFornCliSc.Open;
        Result := True;
        Exit;
     End
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



procedure TDRptSaf.QryFornCliScCalcFields(DataSet: TDataSet);
begin
  inherited;
  If QryFornCliScFC.AsString = 'C' Then
    QryFornCliScDESCGRUPO.AsString := 'Clientes'
  Else
    QryFornCliScDESCGRUPO.AsString := 'Fornecedores';
end;

procedure TDRptSaf.BDetalheBeforePrint(Sender: TObject);
begin
  inherited;
  If SpDetalhe.Brush.Color = Clwhite Then
     SpDetalhe.Brush.Color :=  $00DADBDE
  Else
      SpDetalhe.Brush.Color := Clwhite;
end;

end.
