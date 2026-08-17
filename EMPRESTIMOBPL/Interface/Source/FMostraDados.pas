unit FMostraDados;

{-------------------------------------------------------------------------------------
Pendência   : SIG100227
Responsável : Edilaine
Data        : 04/06/2020
Descrição   : no cadastro de suspensão ocorre erro ao alterar campo observação (Blob)
-------------------------------------------------------------------------------------}


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls;


type
  TfrmMostraDados = class(TForm)
    Dock971: TDock97;
    tb97Fundo: TToolbar97;
    sep1: TToolbarSep97;
    bbtnSair: TBitBtn;
    bbtnAjuda: TmaHelpBitBtn;
    pgResultado: TPageControl;
    tbsResultado: TTabSheet;
    mmResultado: TMemo;
    procedure mmResultadoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMostraDados: TfrmMostraDados;

  function MostraDados(sTitulo, sCampo : string; pResultado: TStringList) : TModalResult;


implementation

{$R *.DFM}


function MostraDados(sTitulo, sCampo : string; pResultado: TStringList) : TModalResult;
begin
  Application.CreateForm(TfrmMostraDados, frmMostraDados);

  with frmMostraDados do
  begin
    Caption := sTitulo;
    tbsResultado.Caption := sCampo;
    mmResultado.Lines    := pResultado;
    visible := false;
    
    result := ShowModal;
  end;
//  Result := ModalResult;
  frmMostraDados.Free;
end;


procedure TfrmMostraDados.mmResultadoKeyPress(Sender: TObject;
  var Key: Char);
begin
  key := #0
end;

end.
