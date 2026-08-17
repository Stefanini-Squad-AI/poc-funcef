unit fconsultaregra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, Grids, DBGrids,
  Mask, wwdbedit, Db, DBTables, Wwquery, wwdblook, DBCtrls, Wwdatsrc,
  TB97Tlbr, IvDictio, IvMulti, IvEMulti;

type
  TFrmconsultaRegra = class(TfrmOkCancelar)
    wwlkpcmbRegra: TwwDBLookupCombo;
    wwQueryregra: TwwQuery;
    wwDBEdit1: TwwDBEdit;
    Label9: TLabel;
    Label2: TLabel;
    wwDBEdit2: TwwDBEdit;
    Label1: TLabel;
    Label3: TLabel;
    DBMemo1: TDBMemo;
    DBGrid1: TDBGrid;
    wwDataSource1: TwwDataSource;
    DBCheckBox1: TDBCheckBox;
    wwQrypassos: TwwQuery;
    wwDataSource2: TwwDataSource;
    wwQueryregraIDREGRA: TFloatField;
    wwQueryregraNOMEREGRA: TStringField;
    wwQueryregraIDTIPOREGRA: TFloatField;
    wwQueryregraDESCRICAOREGRA: TMemoField;
    wwQueryregraPUBLICADA: TFloatField;
    wwQueryregraDESCREGRA: TStringField;
    procedure wwDataSource1DataChange(Sender: TObject; Field: TField);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure wwQueryregraAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmconsultaRegra	:TFrmconsultaRegra;
  uiregra         	:Integer;
  usDescEscolhido 	:String;

implementation

uses usistema;

{$R *.DFM}

procedure TFrmconsultaRegra.wwDataSource1DataChange(Sender: TObject;
  Field: TField);
begin
	inherited;
	wwqrypassos.close;
	wwqrypassos.params[0].asfloat	:=wwqueryregra.fieldbyname('idregra').AsFloat;
	wwqrypassos.open;
end;

procedure TFrmconsultaRegra.bbtnConfirmarClick(Sender: TObject);
begin
	inherited;
	uiregra				:=wwqueryregra.fieldbyname('idregra').asinteger;
	usDescEscolhido	                :=wwqueryregra.fieldbyname('nomeregra').asstring;
        ModalResult			:= mrOk;

end;

procedure TFrmconsultaRegra.wwQueryregraAfterScroll(DataSet: TDataSet);
begin
	inherited;
	wwlkpcmbRegra.Text:=wwqueryregra.fieldbyname('nomeregra').asstring;
end;

end.
