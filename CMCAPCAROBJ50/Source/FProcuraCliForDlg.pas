unit FProcuraCliForDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MontaSelect, StdCtrls, Buttons, MAHlpBtn, TB97Tlbr, TB97,
  ExtCtrls, IvDictio, IvMulti, IvEMulti, CMProcuraSubTipo, uIntegraBack,
  {$IFDEF VER0505} uComum {$ELSE} uCMTypes{$ENDIF};

type
  TFrmProcuraCliForDlg = class(TfrmSairAjuda)
    CPForCli: TCMProcuraForCli;
    procedure FormCreate(Sender: TObject);
    procedure CPForCliExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmProcuraCliForDlg: TFrmProcuraCliForDlg;
  bNomeValidoCliForDlg: Boolean;
  
implementation

Uses uModulo;

{$R *.DFM}

procedure TFrmProcuraCliForDlg.FormCreate(Sender: TObject);
begin
  inherited;
  If IntegraBack.RecPag = 'P' Then
  Begin
     CPForCli.Hint    := 'Pesquisa Fornecedor';
     CPForCli.Caption := ' Fornecedor ';
     CPForCli.ForCli  := fcFornecedor;
  End
  Else
  Begin
     CPForCli.Hint    := 'Pesquisa Clinete';
     CPForCli.Caption := ' Cliente ';
     CPForCli.ForCli  := FcCliente;
  End;

  CPForCli.Mensagens.EmBranco := CPForCli.Caption + CPForCli.Mensagens.EmBranco;
  CPForCli.Mensagens.NaoExiste:= CPForCli.Caption + CPForCli.Mensagens.NaoExiste;
end;

procedure TFrmProcuraCliForDlg.CPForCliExit(Sender: TObject);
begin
  inherited;
  If (ActiveControl.Tag <> 99) Then
     bNomeValidoCliForDlg := (CPForCli.Valida = VCOk);
end;

end.
