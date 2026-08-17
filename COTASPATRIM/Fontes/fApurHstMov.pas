unit fApurHstMov;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMT, StdCtrls, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid,
  ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, Mask, DBCtrls,
  uCmSqlParams;

type
  TfrmApurHstMov = class(TFrmCadastroGridMT)
    Panel1: TPanel;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    ComboBox2: TComboBox;
    CMSqlParams1: TCMSqlParams;
    CdsIDCPHSTMOV: TFloatField;
    CdsIDCPCONTA: TFloatField;
    CdsIDCPTIPOOPER: TFloatField;
    CdsDATA: TDateTimeField;
    CdsVALOR: TFloatField;
    CdsIDCPCOTACAOATV: TFloatField;
    CdsIDCPIMPORTACAO: TFloatField;
    CdsSITUACAO: TStringField;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    CMDateTimePicker3: TCMDateTimePicker;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmApurHstMov: TfrmApurHstMov;

implementation

{$R *.DFM}

end.
