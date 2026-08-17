unit FCadastroMTInv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, ExtCtrls, fcLabel, uCmSqlParams, MontaSelect, Db, DBClient,
  uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97;

type
  TFrmCadastroMTInv = class(TFrmCadastroMT)
    CMSqlParams: TCMSqlParams;
    pnlTitulo: TPanel;
    lbNomDescricao: TfcLabel;
    bvlSepTit: TBevel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadastroMTInv: TFrmCadastroMTInv;

implementation

{$R *.DFM}

end.
