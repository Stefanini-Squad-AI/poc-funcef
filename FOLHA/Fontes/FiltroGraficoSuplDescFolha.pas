unit FiltroGraficoSuplDescFolha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FReports_Folha, Db, Wwdatsrc, DBTables, Wwquery, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, wwdblook, Spin,
  ExtCtrls;

type
  TFrmFiltroGraficoSuplDescFolha = class(TFrmReports_Folha)
    SpinEdit1: TSpinEdit;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFiltroGraficoSuplDescFolha: TFrmFiltroGraficoSuplDescFolha;

implementation

{$R *.DFM}

end.
