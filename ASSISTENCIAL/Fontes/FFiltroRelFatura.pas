unit FFiltroRelFatura;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, DBTables, Wwquery, dRelFat;

type
  TFrmFiltroRelFatura = class(TfrmOkCancelar)
    qryMeses: TwwQuery;
    dblkMesCoranca: TwwDBLookupCombo;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFiltroRelFatura: TFrmFiltroRelFatura;

implementation

{$R *.DFM}

procedure TFrmFiltroRelFatura.FormCreate(Sender: TObject);
begin
  inherited;
  qryMeses.close;
  qryMeses.Open;
end;

procedure TFrmFiltroRelFatura.bbtnConfirmarClick(Sender: TObject);
var sMesAnt : string;
begin
  inherited;
  dtmRelFat.qryFundacao.Close;
  dtmRelFat.qryFundacao.Open;

  dtmRelFat.qryRelFat.Close;
  dtmRelFat.qryRelFat.ParamByName('MESCORR').asString := qryMeses.FieldByName('MESCOBRANCA').asString;
  sMesAnt := Copy(qryMeses.FieldByName('MESCOBRANCA').asString, 6, 2);
  sMesAnt := copy(qryMeses.FieldByName('MESCOBRANCA').asString, 1, 5) + stringOfChar('0', 2 - length(intToStr(strToInt(sMesAnt) - 1))) + intToStr(strToInt(sMesAnt) - 1);
  dtmRelFat.qryRelFat.ParamByName('MESANT').asString := sMesAnt;
  dtmRelFat.qryRelFat.Open;
end;

end.
