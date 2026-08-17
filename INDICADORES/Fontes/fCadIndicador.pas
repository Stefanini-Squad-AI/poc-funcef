unit fCadIndicador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, StdCtrls, DBCtrls, ExtCtrls, Mask, wwdbedit, MontaSelect,
  Db, DBClient, uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97,
  DBTables, Provider, Wwdotdot, Wwdbcomb;

type
  TfrmCadIndicador = class(TFrmCadastroMT)
    wwDBEdit1: TwwDBEdit;
    Label1: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DataSetProvider1: TDataSetProvider;
    Query1: TQuery;
    wwDBComboBox1: TwwDBComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadIndicador: TfrmCadIndicador;

implementation

{$R *.DFM}

end.
