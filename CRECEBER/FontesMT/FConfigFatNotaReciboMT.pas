unit FConfigFatNotaReciboMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FConfigRelatorioMT, ppDB, ppDBPipe, ppDBBDE, ppCache, ppClass, ppBands,
  ppRelatv, ppProd, ppReport, ppComm, ppEndUsr, Menus, uCmSqlParams,
  MontaSelect, Db, DBClient, uCMClientDataSet, CmEventosCadastro, ImgList,
  Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, TB97Ctls,
  TB97, StdCtrls, Buttons, Mask, wwdbedit, wwdblook, CMDBLookupCombo,
  ExtCtrls, DBCtrls;

type
  TFrmConfigFatNotaReciboMT = class(TFrmConfigRelatorioMT)
    RgTipoFatura: TDBRadioGroup;
    Label3: TLabel;
    EdtCodReduz: TwwDBEdit;
    Label5: TLabel;
    dblkAlterador: TwwDBLookupCombo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConfigFatNotaReciboMT: TFrmConfigFatNotaReciboMT;

implementation

{$R *.DFM}

end.
