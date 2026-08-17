// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Bruno Bastos
// Data        : 03/02/2010
// Rotina      : Relatório Informe Facultativo
// Pendência   : 130432_732115
// Descricao   : Alteração do campo que mostra o total recebido parar usar o campo valorrecebido.
//------------------------------------------------------------------------------
// Autor(a)    : Ádler Teodoro de Souza
// Data        : 12/02/2009
// Rotina      : Relatório Informe Facultativo
// Pendência   : SOL 106861 KINTANA 492828
// Descricao   : Mudança no layout do relatório (rpinformefacultativo) de acordo com a solicitação.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 23/02/2006
// Rotina      : Relatório Facultativos
// Pendência   : 21633
// Descricao   : Inclusão de contribuições de anos anteriores (devolução, atraso e total)
//------------------------------------------------------------------------------
unit dRelatInformeFacultativo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppDB, DBClient, uCMClientDataSet, uCmSqlParams, ppVar, ppBands,
  ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppReport, Db, DBTables,
  Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDBPipe, ppDBBDE, Provider;

type
  TdtmInformeFacultativo = class(TdtmReports)
    sqlInformeFacultativo: TCMSqlParams;
    cdsInformeFacultativo: TCMClientDataSet;
    dsInformeFacultativo: TwwDataSource;
    ppInformeFacultativo: TppBDEPipeline;
    rptInformeFacultativo: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    lblExercicio: TppLabel;
    lblAnoBase: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel21: TppLabel;
    ppDBText11: TppDBText;
    ppShape2: TppShape;
    ppShape4: TppShape;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppShape6: TppShape;
    ppShape7: TppShape;
    ppLabel26: TppLabel;
    lblAnoBaseDet: TppLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    function MostraParam(Form: string): boolean; override;
  end;

var
  dtmInformeFacultativo: TdtmInformeFacultativo;

implementation

uses fRelatInformeFacultativo;

{$R *.DFM}



function TdtmInformeFacultativo.MostraParam(Form: string): boolean;
var frm : TForm;
begin
     if UPPERCASE(Form)= 'FRMRELATINFORMEFACULTATIVO' then
        frm := TfrmRelatInformeFacultativo.Create(Application)
     else
        frm := nil;

     if frm = nil then
        Result := true
     else
     begin
        with frm do
        begin
           Result := (ShowModal = mrOk);
           free;
        end;
     end;
end;



end.
