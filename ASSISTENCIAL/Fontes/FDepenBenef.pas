unit FDepenBenef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, Grids, Wwdbigrd,
  Wwdbgrid, Db, Wwdatsrc, DBTables, Wwquery, TB97Tlbr, IvDictio, IvMulti,
  IvEMulti;

type
  TfrmDepenBenef = class(TfrmSairAjuda)
    wwDBGrid1: TwwDBGrid;
    dsdepen: TwwDataSource;
    qrydepen: TwwQuery;
    qrydepenNOME: TStringField;
    qrydepenBENEF: TStringField;
    qryaux: TwwQuery;
    procedure FormActivate(Sender: TObject);
    procedure qrydepenCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDepenBenef: TfrmDepenBenef;

implementation

uses FCadPartass;

{$R *.DFM}

procedure TfrmDepenBenef.FormActivate(Sender: TObject);
begin
   inherited;
   qrydepen.close;
   qrydepen.parambyname('IDPESSOA').Value := frmCadPartass.qryplanass.fieldbyname('IDPESSOA').AsInteger;
   qrydepen.open;
end;

procedure TfrmDepenBenef.qrydepenCalcFields(DataSet: TDataSet);
begin
  inherited;
  qryaux.close;
  qryaux.sql.clear;
  qryaux.sql.add(' SELECT IDTITULAR'+
                   ' FROM BENEFASS'+
                  ' WHERE (IDTITULAR = '+frmCadPartass.qryplanass.fieldbyname('IDPESSOA').AsString+')'+
                    ' AND (IDPLANASS = '+frmCadPartass.qryplanass.fieldbyname('IDPLANASS').AsString+')'+
                    ' AND (IDPLANOPREV = '+frmCadPartass.qryplanass.fieldbyname('IDPLANOPREV').AsString+')'+
                    ' AND (IDPESSJUR = '+frmCadPartass.qryplanass.fieldbyname('IDPESSJUR').AsString+')');
  qryaux.open;

  if qryaux.isempty then
    qrydepen.fieldbyname('benef').AsString := 'Sim'
  else
    qrydepen.fieldbyname('benef').AsString := 'Não';
end;

end.
