unit fCadastroMTCotas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  uCMTypes,MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls;

type
  TFrmCadastroMTCotas = class(TFrmCadastroMT)
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadastroMTCotas: TFrmCadastroMTCotas;

implementation

{$R *.DFM}

procedure TFrmCadastroMTCotas.CmeCadastroInsert(Sender: TObject);
begin
  Cds.Close;
  Cds.CreateDataSet;
  inherited;

end;



procedure TFrmCadastroMTCotas.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  if (Cds.State = dsbrowse)and not(CmeCadastro.Operacao = opApagar) then
    Cds.Edit;
end;

end.
