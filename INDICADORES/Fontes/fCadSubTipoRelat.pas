unit fCadSubTipoRelat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, StdCtrls, Mask, wwdbedit, MontaSelect, Db,
  DBClient, uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, Buttons, TB97Ctls, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls,
  Wwdbspin, DBCtrls, Provider, DBTables;

type
  TfrmCadSubTipoRelat = class(TFrmCadastroMestreDetMT)
    wwDBEdit1: TwwDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label3: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    Label4: TLabel;
    wwDBSpinEdit1: TwwDBSpinEdit;
    Query1: TQuery;
    DataSetProvider1: TDataSetProvider;
    DataSetProvider2: TDataSetProvider;
    Query2: TQuery;
    UpdateSQL1: TUpdateSQL;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadSubTipoRelat: TfrmCadSubTipoRelat;

implementation

{$R *.DFM}

end.
