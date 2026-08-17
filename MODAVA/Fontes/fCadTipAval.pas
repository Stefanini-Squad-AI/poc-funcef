unit fCadTipAval;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, StdCtrls, ExtCtrls, DBCtrls, Mask, CmEventosCadastro,
  ImgList, Db, Wwdatsrc, MontaSelect, DBTables, IvDictio, IvMulti,
  IvEMulti, Wwquery, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids,
  Wwdbigrd, Wwdbgrid;

type
  TfrmCadTipAval = class(TFrmCadastroGridCS)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    dbrgCategoria: TDBRadioGroup;
    procedure CmeCadastroFind(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTipAval: TfrmCadTipAval;

implementation

uses uMensErro;

{$R *.DFM}

procedure TfrmCadTipAval.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    qry.Locate ('CODTIPOAVAL', MontaSelect.ValoresChave[0], []);
end;

procedure TfrmCadTipAval.bbtnConfirmarClick(Sender: TObject);
begin
  if (dbrgCategoria.ItemIndex = -1) then
  begin
    MsgDlg('Por favor indique a Categoria !', 'Aviso',  mtWarning, [mbOk,mbHelp], 0);
    dbrgCategoria.SetFocus;
  end
  else
    inherited;
end;

end.
