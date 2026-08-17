unit fSimContribOpcao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls;

type
  TfrmSimContribOpcao = class(TfrmOkCancelar)
    grbContrib: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtOpcao1: TEdit;
    edtOpcao2: TEdit;
    edtOpcao3: TEdit;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);


  private { Private declarations }


  public  { Public declarations }


  end;



var
  frmSimContribOpcao: TfrmSimContribOpcao;



implementation
{$R *.DFM}
uses 
  FSimulaContrib;



procedure TfrmSimContribOpcao.FormShow(Sender: TObject);
begin
  inherited;

  Label1.Visible := False;
  Label2.Visible := False;
  Label3.Visible := False;

  edtOpcao1.Visible := False;
  edtOpcao2.Visible := False;
  edtOpcao3.Visible := False;

  edtOpcao1.Text := '';
  edtOpcao2.Text := '';
  edtOpcao3.Text := '';

  If frmSimulaContrib.qryContribuicoes.FieldByName('NOMEVALORBASE1').AsString <> '' Then
  Begin
   Label1.Visible    := True;
   edtOpcao1.Visible := True;
   Label1.Caption    := frmSimulaContrib.qryContribuicoes.FieldByName('NOMEVALORBASE1').AsString;
  End;

 If frmSimulaContrib.qryContribuicoes.FieldByName('NOMEVALORBASE2').AsString <> '' Then
  Begin
   Label2.Caption := frmSimulaContrib.qryContribuicoes.FieldByName('NOMEVALORBASE2').AsString;
   Label2.Visible    := True;
   edtOpcao2.Visible := True;
  End;

 If frmSimulaContrib.qryContribuicoes.FieldByName('NOMEVALORBASE3').AsString <> '' Then
  Begin
   Label3.Caption := frmSimulaContrib.qryContribuicoes.FieldByName('NOMEVALORBASE3').AsString;
   Label3.Visible    := True;
   edtOpcao3.Visible := True;
  End;
end;



procedure TfrmSimContribOpcao.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
//  *** NÃO RETIRAR O COMENTÁRIO ***
//  inherited;
end;



end.