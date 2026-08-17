{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : SOL 143413 Kintana 938370
Responsável : Fanuel Junior
Data        : 05/11/2010
Descrição   : Utilizar a procedure buscaMutuario para procurar se o usuario é
o mutuario do contrato e bloquea-lo.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------}
unit mContratoEmptmo;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons,UFuncoesEmptmo;

type
  TmolContratoEmptmo = class(TFrame)
    edtNome: TEdit;
    Label2: TLabel;
    btnBuscaContrato: TBitBtn;
    btnLimpaContrato: TBitBtn;
    edtIdContrato: TEdit;
    Label1: TLabel;
    procedure btnBuscaContratoClick(Sender: TObject);
    procedure btnLimpaContratoClick(Sender: TObject);

  private { Private declarations }
   FRetornaValor : Boolean;
   FIdContrato   : Int64;
   FNomePessoa   : String;
   iIdBenef      : Integer;

  public { Public declarations }
    property RetornouValor : Boolean read FRetornaValor;
    property IdContrato    : Int64 read FIdContrato;
    property NomePessoa    : String read FNomePessoa;
  end;

implementation

{$R *.DFM}

uses dMS;

procedure TmolContratoEmptmo.btnBuscaContratoClick(Sender: TObject);
begin
   dtmMS.MS_ContratoEmptmo.Executar;
   FRetornaValor         := dtmMS.MS_ContratoEmptmo.RetornouValor;
   if dtmMS.MS_ContratoEmptmo.RetornouValor then
   begin
      iIdBenef           := IntToStr(dtmMS.MS_ContratoEmptmo.ValoresChave[2]);
      UFuncoesEmptmo.buscaUsuarioMutuario(iIdBenef);
      edtIdContrato.Text := dtmMS.MS_ContratoEmptmo.ValoresChave[0];
      edtNome.Text       := dtmMS.MS_ContratoEmptmo.ValoresChave[1];
      FIdContrato        := StrToInt(dtmMS.MS_ContratoEmptmo.ValoresChave[0]);
      FNomePessoa        := dtmMS.MS_ContratoEmptmo.ValoresChave[1];
   end;
end;



procedure TmolContratoEmptmo.btnLimpaContratoClick(Sender: TObject);
begin
   FRetornaValor    := False;
   FIdContrato      := -1;
   FNomePessoa      := '';
   edtIdContrato.Clear;
   edtNome.Clear;
end;

end.
