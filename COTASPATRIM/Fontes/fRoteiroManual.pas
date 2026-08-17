unit fRoteiroManual;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TfrmRoteiroManual = class(TFrmCadastroMestreDetMT)
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    CdsDet: TCMClientDataSet;
    CdsDetEntrada: TStringField;
    CdsDetValor: TFloatField;
    Cdsvazio: TStringField;
    DateTimePicker1: TDateTimePicker;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRoteiroManual: TfrmRoteiroManual;

implementation

{$R *.DFM}

end.
