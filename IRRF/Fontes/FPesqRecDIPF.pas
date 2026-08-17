unit FPesqRecDIPF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, uCtrlDaconMT,
  Db, DBClient, uCMClientDataSet, Wwdatsrc, uCmSqlParams, Grids, Wwdbigrd,
  Wwdbgrid, Mask, StdCtrls, ExtCtrls;

type
  TfrPesqRecDIPJ = class(TForm)
    dbgPesqRec: TwwDBGrid;
    CMSqlPesqRec: TCMSqlParams;
    dsPesqRec: TwwDataSource;
    cdsPesqRec: TCMClientDataSet;
    Panel1: TPanel;
    Label7: TLabel;
    Label1: TLabel;
    edData: TEdit;
    edNroRecibo: TMaskEdit;
    cdsPesqRecIDRECIBO: TFloatField;
    cdsPesqRecIDRECIBORET: TFloatField;
    cdsPesqRecNUMERORECIBO: TStringField;
    cdsPesqRecDATARECIBO: TDateTimeField;
    cdsPesqRecRETIFICADOR: TStringField;
    cdsPesqRecEXERCICIO: TStringField;
    procedure cdsPesqRecAfterScroll(DataSet: TDataSet);
    procedure dbgPesqRecDblClick(Sender: TObject);
  private
    { Private declarations }
  Protected
    oDaconMT: TCtrlDaconMT;
  public
    { Public declarations }
  end;

var
  frPesqRecDIPJ: TfrPesqRecDIPJ;

implementation

uses FCadDIPJ;

{$R *.DFM}

procedure TfrPesqRecDIPJ.cdsPesqRecAfterScroll(DataSet: TDataSet);
begin
  frmCadDIPJ.idReciboRetPesq := cdsPesqRec.FieldByName('IDRECIBORET').AsInteger;
  frmCadDIPJ.idReciboPesq    := cdsPesqRec.FieldByName('IDRECIBO').AsInteger;
  edNroRecibo.Text           := cdsPesqRec.FieldByName('NUMERORECIBO').AsString;
  edData.Text                := cdsPesqRec.FieldByName('DATARECIBO').AsString;
end;

procedure TfrPesqRecDIPJ.dbgPesqRecDblClick(Sender: TObject);
begin
  Close;
end;

end.
