unit FConsCalcMktInvest;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTInvFMD, Menus, MontaSelect, Db, DBClient,
  uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, fcLabel, faMensagem, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, TREdit,
  wwdblook, wwdbdatetimepicker, CMDateTimePicker, uCmSqlParams, ComCtrls;

type
  TFrmConsCalcMktInvest = class(TFrmCadastroGridMTInvFMD)
    sprCds: TCMSqlParams;
    lblInvestimento: TLabel;
    dblkPlanPatroO: TwwDBLookupCombo;
    bbtnImprimir: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    wwDBGrid1: TwwDBGrid;
    Panel1: TPanel;
    dbrVlrOperacao: TDBRealEdit;
    lblTXCompra: TLabel;
    dbePuOperacao: TDBRealEdit;
    lblPUPar: TLabel;
    DBRealEdit2: TDBRealEdit;
    lblPUMercado: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    edDataIni: TCMDateTimePicker;
    lblData: TLabel;
    Label9: TLabel;
    CMDateTimePicker1: TCMDateTimePicker;
    lblTxEmissao: TLabel;
    DBRealEdit1: TDBRealEdit;
    Label10: TLabel;
    CMDateTimePicker2: TCMDateTimePicker;
    Label11: TLabel;
    DBRealEdit11: TDBRealEdit;
    Label12: TLabel;
    CMDateTimePicker3: TCMDateTimePicker;
    Label1: TLabel;
    CMDateTimePicker4: TCMDateTimePicker;
    DBRealEdit3: TDBRealEdit;
    Label2: TLabel;
    DBRealEdit4: TDBRealEdit;
    Label3: TLabel;
    CMDateTimePicker5: TCMDateTimePicker;
    Label4: TLabel;
    DBRealEdit6: TDBRealEdit;
    Label14: TLabel;
    Label8: TLabel;
    DBRealEdit9: TDBRealEdit;
    Label5: TLabel;
    CMDateTimePicker6: TCMDateTimePicker;
    DBRealEdit5: TDBRealEdit;
    Label6: TLabel;
    Label7: TLabel;
    DBRealEdit7: TDBRealEdit;
    DBRealEdit8: TDBRealEdit;
    Label13: TLabel;
    DBRealEdit10: TDBRealEdit;
    Label16: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsCalcMktInvest: TFrmConsCalcMktInvest;

implementation

{$R *.DFM}

end.
