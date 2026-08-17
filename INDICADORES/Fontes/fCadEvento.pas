unit fCadEvento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, StdCtrls, Mask, wwdbedit, MontaSelect, Db, DBClient,
  uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  DBTables, Provider;

type
  TfrmCadEvento = class(TFrmCadastroMT)
    wwDBEdit1: TwwDBEdit;
    Label1: TLabel;
    DataSetProvider1: TDataSetProvider;
    Query1: TQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadEvento: TfrmCadEvento;

implementation

{$R *.DFM}

end.
