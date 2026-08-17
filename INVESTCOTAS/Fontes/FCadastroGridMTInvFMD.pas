unit FCadastroGridMTInvFMD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTInv, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  fcLabel, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids,
  Wwdbigrd, Wwdbgrid, ExtCtrls;

type
  TFrmCadastroGridMTInvFMD = class(TFrmCadastroGridMTInv)
    pnlDados: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadastroGridMTInvFMD: TFrmCadastroGridMTInvFMD;

implementation

{$R *.DFM}

end.
