unit fFrameConsultaAssistencial;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, StdCtrls, Db, DBTables,
  Wwquery, Wwdatsrc;

type
  TfrmFrameConsultaAssistencial = class(TFrame)
    PageControl1: TPageControl;
    Panel1: TPanel;
    dbgPlanAssist: TwwDBGrid;
    dbgContribuicoes: TwwDBGrid;
    tbsDependentes: TTabSheet;
    tbsCaptSeg: TTabSheet;
    dbgDependentes: TwwDBGrid;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    wwDBGrid1: TwwDBGrid;
    dsPlanoAssist: TwwDataSource;
    qryPlanoAssist: TwwQuery;
    dsAux: TwwDataSource;
    qryAux: TwwQuery;
    dsCapitaisSeg: TwwDataSource;
    qryCapitaisSeg: TwwQuery;
    dsDependentes: TwwDataSource;
    dsMostraParticip: TwwDataSource;
    qryMostraParticip: TwwQuery;
    qryDependentes: TwwQuery;
    dsContribuicoes: TwwDataSource;
    qryContribuicoes: TwwQuery;
    TabSheet1: TTabSheet;
    dbgSinistros: TwwDBGrid;
    qrySinistros: TwwQuery;
    dsSinistros: TwwDataSource;
    procedure FrameEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

procedure TfrmFrameConsultaAssistencial.FrameEnter(Sender: TObject);
begin
  //PageControl1.ActivePage:= tbsDependentes;
end;

end.
