unit dTermoDiario;

interface

uses

  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Wwquery, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppBands,uDataBase,
  ppClass, ppCtrls, ppPrnabl, ppStrtch, ppRichTx, ppCache, ppComm,
  ppRelatv, ppProd, ppReport, DBClient, uCMClientDataSet,uCmSqlParams,
  uCmControlObject;

type
  TdtmTermo = class(TForm)
    rptTermos: TppReport;
    ppHeaderBand11: TppHeaderBand;
    ppDetailBand5: TppDetailBand;
    rptTermosDBRichText1: TppDBRichText;
    ppFooterBand11: TppFooterBand;
    rptTermosLine1: TppLine;
    rptTermosLabel1: TppLabel;
    rptTermosDBText1: TppDBText;
    rptTermosGroup1: TppGroup;
    rptTermosGroupHeaderBand1: TppGroupHeaderBand;
    rptTermosGroupFooterBand1: TppGroupFooterBand;
    pplTermos: TppBDEPipeline;
    pplTermosppField1: TppField;
    pplTermosppField2: TppField;
    pplTermosppField3: TppField;
    dsTermos: TwwDataSource;
    cdsTermo: TCMClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure FazOnCalcField(iPerIni,iPerFim :Integer);

  end;

var
  dtmTermo: TdtmTermo;

implementation

{$R *.DFM}

{ TdtmTermo }

procedure TdtmTermo.FazOnCalcField(iPerIni, iPerFim: Integer);
begin
  cdsTermo.First;
  while not cdsTermo.Eof do
  begin
    cdsTermo.Edit;
    if cdsTermo.FieldByName('ABERTFECHAM').asString = 'A' then begin
       cdsTermo.FieldByName('PAGINA').asInteger := iPerIni;
    end else begin
       cdsTermo.FieldByName('PAGINA').asInteger := iPerFim;
    end;
    cdsTermo.post;
    cdsTermo.Next;
  end;

end;


end.
