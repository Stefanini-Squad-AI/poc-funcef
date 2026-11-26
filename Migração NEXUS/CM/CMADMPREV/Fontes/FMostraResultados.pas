unit FMostraResultados;

//------------------------------------------------------------------------------
// Autor(a)   : Edilaine Ferraresi
// Data       : 30/01/2017
// SIG        : 36752
// Descricao  : Equacionamento - aba ação judicial / importação arquivo
//------------------------------------------------------------------------------


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls;


type
  TfrmMostraResultados = class(TForm)
    Dock971: TDock97;
    tb97Fundo: TToolbar97;
    sep1: TToolbarSep97;
    bbtnSair: TBitBtn;
    bbtnAjuda: TmaHelpBitBtn;
    btnImportar: TBitBtn;
    pgResultado: TPageControl;
    tbsResultado: TTabSheet;
    mmResultado: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMostraResultados: TfrmMostraResultados;

  function MostraResultados(sTitulo : string; bBtnImportaVisivel, bBtnHabImporta : boolean; pResultado: TStringList) : TModalResult;


implementation

{$R *.DFM}


function MostraResultados(sTitulo : string; bBtnImportaVisivel, bBtnHabImporta : boolean; pResultado: TStringList) : TModalResult;
begin
  Application.CreateForm(TfrmMostraResultados, frmMostraResultados);

  with frmMostraResultados do
  begin
    Caption := sTitulo;
    btnImportar.visible := bBtnImportaVisivel;
    btnImportar.enabled := bBtnHabImporta;
    mmResultado.Lines   := pResultado;
    visible := false;
    
    result := ShowModal;
  end;
//  Result := ModalResult;
  frmMostraResultados.Free;
end;


end.
