unit FViewRestricao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Db, DBTables,
  Wwquery, Wwdatsrc, DBCtrls;

type
  TFrmViewRestricao = class(TfrmSairAjuda)
    plnf: TPanel;
    Panel1: TPanel;
    Grd: TwwDBGrid;
    Label1: TLabel;
    edForn: TEdit;
    qry: TwwQuery;
    ds: TwwDataSource;
    qryCODARTIGO: TStringField;
    qryDESCRICAO: TStringField;
    qryDATAINI: TDateTimeField;
    qryDATAFIM: TDateTimeField;
    qryFLGFLEXIVEL: TStringField;
    qryFLEXIVEL: TStringField;
    qryMOTIVO: TStringField;
    Panel2: TPanel;
    Panel3: TPanel;
    memMotivo: TDBMemo;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmViewRestricao: TFrmViewRestricao;

implementation

{$R *.DFM}
Uses uAvaliForn;

procedure TFrmViewRestricao.FormShow(Sender: TObject);
begin
  inherited;
  edForn.Text := AvaliForn.RazaoSocial;
  qry.Close;
  qry.ParamByName('pIDFORCLI').asInteger := AvaliForn.IdForCli;
  qry.ParamByName('pIDPESS').asInteger   := AvaliForn.IdPessoa;
  qry.Open;

end;

end.
