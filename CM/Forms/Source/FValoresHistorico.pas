unit FValoresHistorico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, DBClient, uCMClientDataSet,
  uCmSqlParams, ComCtrls, StdCtrls, Buttons, ExtCtrls;

type
  TFrmValoresHistorico = class(TForm)
    SQLCamposeValores: TCMSqlParams;
    CdsCamposeValores: TCMClientDataSet;
    DsCamposeValores: TwwDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GrdValores: TwwDBGrid;
    PnlBotoes: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

end.
