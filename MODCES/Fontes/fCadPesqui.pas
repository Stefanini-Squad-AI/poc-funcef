unit fCadPesqui;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCadastroGridCS,
  IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, Grids,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, Wwdbigrd, Wwdbgrid, ExtCtrls, Mask, DBCtrls,
  wwdbdatetimepicker, CMDateTimePicker, CmEventosCadastro, ImgList;

type
  TfrmCadPesqui = class(TFrmCadastroGridCS)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBDateEdit1: TCMDateTimePicker;
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  end;

var
  frmCadPesqui: TfrmCadPesqui;

implementation

{$R *.DFM}

procedure TfrmCadPesqui.FormCreate(Sender: TObject);
begin
  inherited;
  qry.Open;
end;

procedure TfrmCadPesqui.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.RetornouValor) then
    qry.Locate ('IDPESQSALAR', MontaSelect.ValoresChave[0], []);
end;

end.
