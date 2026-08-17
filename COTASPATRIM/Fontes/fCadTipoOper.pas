unit fCadTipoOper;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, DBCtrls, Mask,
  uCmSqlParams;

type
  TfrmCadTipoOper = class(TFrmCadastroGridMT)
    CMSqlParams1: TCMSqlParams;
    CdsIDCPTIPOOPER: TFloatField;
    CdsNOME: TStringField;
    CdsDECRICAO: TStringField;
    CdsRECDES: TStringField;
    CdsRENTABCOTIZA: TStringField;
    CdsQUANTVALOR: TStringField;
    CdsPLANO: TFloatField;
    CdsPLACONTA: TStringField;
    CdsDTINICIO: TDateTimeField;
    CdsDTFIM: TDateTimeField;
    CdsFLGOBRIGAAPUR: TFloatField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    DBRadioGroup3: TDBRadioGroup;
    CMDateTimePicker3: TCMDateTimePicker;
    CMDateTimePicker1: TCMDateTimePicker;
    Label3: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTipoOper: TfrmCadTipoOper;

implementation

{$R *.DFM}

end.
