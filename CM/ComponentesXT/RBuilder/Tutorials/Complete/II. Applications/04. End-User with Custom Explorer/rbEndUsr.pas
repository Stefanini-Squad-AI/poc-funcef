{******************************************************************************}
{                                                                              }
{                   ReportBuilder Tutorials                                    }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit rbEndUsr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppComm, ppRelatv, ppDB, ppDBPipe, Db, DBTables, daDatMan, daDBBDE,
  ppRptExp, ppEndUsr, ppProd, ppClass, ppReport, StdCtrls, ExtCtrls,
  ComCtrls, ppBands, ppCache;

type
  TmyEndUserSolution = class(TForm)
    tblFolder: TTable;
    dsFolder: TDataSource;
    plFolder: TppDBPipeline;
    tblItem: TTable;
    dsItem: TDataSource;
    pltem: TppDBPipeline;
    ppReport1: TppReport;
    ppDesigner1: TppDesigner;
    ppReportExplorer1: TppReportExplorer;
    btnLaunch: TButton;
    pnlStatusBar: TStatusBar;
    procedure btnLaunchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  myEndUserSolution: TmyEndUserSolution;

implementation

{$R *.DFM}

{------------------------------------------------------------------------------}
{ TmyEndUserSolution.btnLaunchClick }

procedure TmyEndUserSolution.btnLaunchClick(Sender: TObject);
begin
  if not(ppReportExplorer1.Execute) then
    pnlStatusBar.SimpleText := ppReportExplorer1.ErrorMessage;
end;

end.
