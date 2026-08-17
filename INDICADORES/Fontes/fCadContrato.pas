unit fCadContrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, wwdbdatetimepicker,
  CMDateTimePicker, Mask, wwdbedit, DBCtrls, DBTables, Provider, wwriched,
  Wwdbspin, wwdblook;

type
  TfrmCadContrato = class(TFrmCadastroMestreDetMT)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    wwDBEdit1: TwwDBEdit;
    wwDBEdit2: TwwDBEdit;
    wwDBEdit3: TwwDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    tbsAluguel: TTabSheet;
    Label8: TLabel;
    wwDBEdit6: TwwDBEdit;
    Label9: TLabel;
    wwDBEdit7: TwwDBEdit;
    Label11: TLabel;
    wwDBEdit8: TwwDBEdit;
    DataSetProvider1: TDataSetProvider;
    Query1: TQuery;
    tbsObs: TTabSheet;
    tbsEventos: TTabSheet;
    btnBuscaForn: TBitBtn;
    tbsDatas: TTabSheet;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    CMDateTimePicker1: TCMDateTimePicker;
    CMDateTimePicker2: TCMDateTimePicker;
    GroupBox2: TGroupBox;
    CMDateTimePicker3: TCMDateTimePicker;
    wwDBEdit4: TwwDBEdit;
    BitBtn1: TBitBtn;
    wwDBEdit5: TwwDBEdit;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    wwDBRichEdit1: TwwDBRichEdit;
    grpReajuste: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label34: TLabel;
    Label12: TLabel;
    Label50: TLabel;
    DBedtProxReajuste: TCMDateTimePicker;
    DBcboIndiceReajuste: TwwDBLookupCombo;
    DBspnPeriodicidadeReajuste: TwwDBSpinEdit;
    DBedtUltReajuste: TCMDateTimePicker;
    Panel2: TPanel;
    DBgrdEvento: TwwDBGrid;
    DBmemDescricao: TwwDBRichEdit;
    Label10: TLabel;
    wwDBEdit9: TwwDBEdit;
    BitBtn3: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadContrato: TfrmCadContrato;

implementation

{$R *.DFM}

end.
