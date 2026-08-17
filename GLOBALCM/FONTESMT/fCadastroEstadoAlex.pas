unit fCadastroEstadoAlex;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Mask,
  DBCtrls, uCmSqlParams, wwdblook;

type
  TfrmCadastroEstadoAlex = class(TFrmCadastroMT)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    dbLkPais: TwwDBLookupCombo;
    lblPais: TLabel;
    cdsPais: TCMClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroEstadoAlex: TfrmCadastroEstadoAlex;

implementation

{$R *.DFM}

end.
