unit FSelTreinColetivo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSelPessoal, Db, DBTables, Wwquery, Wwdatsrc, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  wwdblook, wwdbdatetimepicker, CMDateTimePicker, Spin, TEdNum, ComCtrls;

type
  TfrmSelTreinColetivo = class(TfrmSelPessoal)
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelTreinColetivo: TfrmSelTreinColetivo;

implementation

uses FRegTreinColetivo;

{$R *.DFM}

procedure TfrmSelTreinColetivo.FormCreate(Sender: TObject);
begin
  inherited;
  cbxCandidatos.Checked    := not bEmpregado;
  cbxCandidatos.Enabled    := not bEmpregado;
  cbxEfetivos.Enabled      := bEmpregado;
  cbxEspeciais.Enabled     := bEmpregado;
  cbxTemporarios.Enabled   := bEmpregado;
  cbxEstagiarios.Enabled   := bEmpregado;
  cbxTerceiros.Enabled     := bEmpregado;
  cbxProprietarios.Enabled := bEmpregado;
  cbxAutonomos.Enabled     := bEmpregado;
  LstFunc := TStringList.Create;
  LstNome := TStringList.Create;
  //dblcLotacao.SelText := '**********';
end;

procedure TfrmSelTreinColetivo.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  LstFunc.Clear;
  LstNome.Clear;
  tblPessoal.First;
  while not (tblPessoal.EOF) do
  begin
    LstFunc.Add(tblPessoal.FieldByName('IDPESSOA').asString);
    LstNome.Add(tblPessoal.FieldByName('NOME').asString);
    tblPessoal.Next;
  end;

end;

end.
