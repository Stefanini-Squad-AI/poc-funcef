unit FCadastroMestreDetMTImob;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls;

type
  TFrmCadastroMestreDetMTImob = class(TFrmCadastroMestreDetMT)
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadastroMestreDetMTImob: TFrmCadastroMestreDetMTImob;

implementation

{$R *.DFM}

procedure TFrmCadastroMestreDetMTImob.CmeCadastroInsert(Sender: TObject);
begin
  Cds.Close;
  Cds.CreateDataSet;
  inherited;
end;

procedure TFrmCadastroMestreDetMTImob.CmeCadastroApplyInsert(
  sender: TObject; var Accept: Boolean);
begin
  inherited;
  if (Cds.State = dsbrowse) then Cds.Edit;
end;

end.
