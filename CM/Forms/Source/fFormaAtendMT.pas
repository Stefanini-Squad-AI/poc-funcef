unit fFormaAtendMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, DBCtrls,
  Mask, MConnect;

type
  TFrmCadastroMT1 = class(TFrmCadastroMT)
    DCOMConnection1: TDCOMConnection;
    Label1: TLabel;
    DbeDescricao: TDBEdit;
    DBCheckBox1: TDBCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadastroMT1: TFrmCadastroMT1;

implementation

{$R *.DFM}

end.
