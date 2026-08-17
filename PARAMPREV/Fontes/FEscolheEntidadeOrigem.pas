unit FEscolheEntidadeOrigem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Db;

type
  TfrmEscolheEntidadeOrigem = class(TfrmOkCancelar)
    pnlTop: TPanel;
    pnlInfo: TPanel;
    DBGridDados: TwwDBGrid;
    lblinfoA: TLabel;
    lblInfoB: TLabel;
    lblInfoC: TLabel;
    dsCNPJ: TDataSource;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEscolheEntidadeOrigem: TfrmEscolheEntidadeOrigem;

implementation

uses FCadEntidadeOrigem;

{$R *.DFM}

procedure TfrmEscolheEntidadeOrigem.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  // Atribui o valor da qryCNPJ para query qry
  frmCadEntidadeOrigem.qry.FieldByName('NOME').AsString :=
  frmCadEntidadeOrigem.qryCNPJ.FieldByName('NOME').AsString;

  frmCadEntidadeOrigem.edtCnpj.Text :=
  frmCadEntidadeOrigem.qryCNPJ.FieldByName('CNPJ').AsString;

  frmCadEntidadeOrigem.qry.FieldByName('TIPO').AsString :=
  frmCadEntidadeOrigem.qryCNPJ.FieldByName('TIPO').AsString;

  frmCadEntidadeOrigem.qry.FieldByName('CNPBSUSEP').AsString :=
  frmCadEntidadeOrigem.qryCNPJ.FieldByName('CNPBSUSEP').AsString;


end;

procedure TfrmEscolheEntidadeOrigem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmCadEntidadeOrigem.qryCNPJ.Close;
  frmCadEntidadeOrigem.edtCnpj.SetFocus;
end;

end.
