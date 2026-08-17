unit dMovimentacaoDependentes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppDB, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv,
  ppDBPipe, ppDBBDE, ppParameter;

type
  TdtmMovimentacaoDependentes = class(TdtmReports)
    dsConsulta: TwwDataSource;
    qryConsulta: TwwQuery;
    prMovimentacaoDependentes: TppReport;
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
    ppMovimentacaoDependentes: TppBDEPipeline;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppMovimentacaoDependentesppField1: TppField;
    ppMovimentacaoDependentesppField2: TppField;
    ppMovimentacaoDependentesppField3: TppField;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
  private
    { Private declarations }
  public
    function MostraParam(Form: string): boolean; override;
  end;

var
  dtmMovimentacaoDependentes: TdtmMovimentacaoDependentes;

implementation

uses
  FMovimentacaoDependentes;

{$R *.DFM}

{ TdtmMovimentacaoDependentes }

function TdtmMovimentacaoDependentes.MostraParam(Form: string): boolean;
var
  frm: TForm;
begin
  if (UPPERCASE(Form) = 'FRMMOVIMENTACAODEPENDENTES') then begin
    frm := TFrmMovimentacaoDependentes.Create(Application);
  end;
  if (frm = nil) then begin
    Result := false;
  end else begin
    with (frm) do begin
      Result := (ShowModal = mrOk);
      Free;
    end;
  end;
end;

end.
