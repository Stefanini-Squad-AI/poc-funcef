unit dMovimentacaoTempoServico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppDB, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv,
  ppDBPipe, ppDBBDE, ppParameter;

type
  TdtmMovimentacaoTempoServico = class(TdtmReports)
    dsConsulta: TwwDataSource;
    qryConsulta: TwwQuery;
    prMovimentacaoTempoServico: TppReport;
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
    ppMovimentacaoTempoServico: TppBDEPipeline;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppDBText4: TppDBText;
    ppLabel7: TppLabel;
  private
    { Private declarations }
  public
    function MostraParam(Form: string): boolean; override;
  end;

var
  dtmMovimentacaoTempoServico: TdtmMovimentacaoTempoServico;

implementation

uses
  FMovimentacaoTempoServico;

{$R *.DFM}

{ TdtmMovimentacaoDependentes }

function TdtmMovimentacaoTempoServico.MostraParam(Form: string): boolean;
var
  frm: TForm;
begin
  if (UPPERCASE(Form) = 'FRMMOVIMENTACAOTEMPOSERVICO') then begin
    frm := TFrmMovimentacaoTempoServico.Create(Application);
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
