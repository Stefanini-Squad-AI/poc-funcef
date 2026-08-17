unit fApurRoteiroManual;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, uCmSqlParams, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmApurRoteiroManual = class(TFrmCadastroGridMT)
    Panel1: TPanel;
    ComboBox1: TComboBox;
    Label1: TLabel;
    CMDateTimePicker3: TCMDateTimePicker;
    Label3: TLabel;
    CMSqlParams1: TCMSqlParams;
    Edit1: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    Label4: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmApurRoteiroManual: TfrmApurRoteiroManual;

implementation

{$R *.DFM}

end.
