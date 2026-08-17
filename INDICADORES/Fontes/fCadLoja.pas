unit fCadLoja;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Mask,
  wwdbedit, DBTables, Provider;

type
  TfrmCadLoja = class(TFrmCadastroMT)
    DataSetProvider1: TDataSetProvider;
    Query1: TQuery;
    Label2: TLabel;
    Label3: TLabel;
    wwDBEdit2: TwwDBEdit;
    wwDBEdit3: TwwDBEdit;
    Label4: TLabel;
    wwDBEdit4: TwwDBEdit;
    RadioGroup1: TRadioGroup;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadLoja: TfrmCadLoja;

implementation

{$R *.DFM}

end.
