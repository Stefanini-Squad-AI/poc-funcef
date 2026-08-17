unit FFolUpProc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Wwquery, Db, Wwtable, Wwdatsrc, MAHlpBtn,
  StdCtrls, Buttons, TEdNum, Spin, wwdblook, ExtCtrls, Grids, Wwdbigrd,
  Wwdbgrid, TB97, ComCtrls, IvDictio, IvMulti, IvEMulti, FSairAjuda, TB97Tlbr;

type
  TfrmFolUpProc = class(TfrmSairAjuda)
    wwDBGrid1: TwwDBGrid;
    dsEtapa: TwwDataSource;
    qryEtapa: TwwQuery;
    procedure qryEtapaFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFolUpProc: TfrmFolUpProc;

implementation

uses FSelFolUp;

{$R *.DFM}

procedure TfrmFolUpProc.qryEtapaFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  Accept := (frmSelFolUp.qryProcesso.Locate('NUMPROCTRAB',
             qryEtapa.FieldByName('NUMPROCTRAB').Value,[loCaseInsensitive]))  and
            (frmSelFolUp.qryProcesso.Locate('IDPESSOA',
             qryEtapa.FieldByName('IDRECLAMANTE').Value,
            [loCaseInsensitive]))                          and
            (qryEtapa.FieldByName('DATAREALOCOR').Value >=
             frmSelFolUp.EdDataEnc1.Date)  and
            (qryEtapa.FieldByName('DATAREALOCOR').Value <=
             frmSelFolUp.EdDataEnc2.Date)
end;

procedure TfrmFolUpProc.FormCreate(Sender: TObject);
begin
  inherited;
  ModalResult := mrNone;
  qryEtapa.Close;
  qryEtapa.Filtered := True;
  qryEtapa.Open;
end;

end.
