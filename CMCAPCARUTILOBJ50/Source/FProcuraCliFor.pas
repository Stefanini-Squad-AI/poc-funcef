(*******************************************************************************
 11/02/99
 Implementação
         Para Otimizar os Combos de Busca a Clientes e fornecedores, passando para montaselect;
*******************************************************************************)

unit FProcuraCliFor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  MontaSelect, IvDictio, IvMulti, IvEMulti, uIntegraBack, CMProcuraSubTipo,
  {$IFDEF VER0505} uComum {$ELSE} uCMTypes{$ENDIF};

type
  TFrmProcuraCliFor = class(TfrmOkCancelar)
    CPForCli: TCMProcuraForCli;
    procedure FormCreate(Sender: TObject);
    procedure CPForCliExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmProcuraCliFor: TFrmProcuraCliFor;
  bNomeValidoCliFor: Boolean;

implementation

{$R *.DFM}

Uses uModulo;

procedure TFrmProcuraCliFor.FormCreate(Sender: TObject);
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
     CPForCli.Hint    := 'Pesquisa Cliente';
     CPForCli.Caption := ' Cliente ';
     CPForCli.ForCli  := FcCliente;     
  End;

  CPForCli.Mensagens.EmBranco := CPForCli.Caption + CPForCli.Mensagens.EmBranco;
  CPForCli.Mensagens.NaoExiste:= CPForCli.Caption + CPForCli.Mensagens.NaoExiste;
end;

procedure TFrmProcuraCliFor.CPForCliExit(Sender: TObject);
begin
  inherited;
  If (ActiveControl.Tag <> 99) Then
     bNomeValidoCliFor := (CPForCli.Valida = VCOk);
end;

end.
