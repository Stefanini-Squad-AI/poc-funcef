unit fApuracao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  wwdbdatetimepicker, CMDateTimePicker, Wwdbspin, Wwdotdot, Wwdbcomb,
  DBCtrls, Mask, wwdbedit, DBTables, Provider;

type
  TfrmApuracao = class(TFrmCadastroMT)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    wwDBEdit1: TwwDBEdit;
    wwDBEdit2: TwwDBEdit;
    wwDBEdit3: TwwDBEdit;
    wwDBEdit4: TwwDBEdit;
    wwDBEdit5: TwwDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    wwDBComboBox1: TwwDBComboBox;
    wwDBSpinEdit1: TwwDBSpinEdit;
    Label8: TLabel;
    Label9: TLabel;
    CMDateTimePicker1: TCMDateTimePicker;
    wwDBEdit6: TwwDBEdit;
    DataSetProvider1: TDataSetProvider;
    Query1: TQuery;
    btnBuscaForn: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmApuracao: TfrmApuracao;

implementation

{$R *.DFM}

end.
