unit fCadHistEvento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  wwdbdatetimepicker, CMDateTimePicker, DBTables, Provider;

type
  TfrmCadHistEvento = class(TFrmCadastroMT)
    Label1: TLabel;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    CMDateTimePicker1: TCMDateTimePicker;
    CMDateTimePicker2: TCMDateTimePicker;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    DataSetProvider1: TDataSetProvider;
    Query1: TQuery;
    btnBuscaForn: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadHistEvento: TfrmCadHistEvento;

implementation

{$R *.DFM}

end.
