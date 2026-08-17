unit FObservacaoDocum;

// Alterações:
{
//------------------------------------------------------------------------------
//Alteração  : funcionalidade renomeada
//Nº SIG.....: 33372
//Data.......: 29/11/2016
//Responsável: Edilaine Ferraresi
//Descrição..: Ajustes para Equacionamento - Recebimento Contrib via Folha através de procedure
--------------------------------------------------------------------------------
Pendência   : Sol 162505 Kintana 1381614
Responsável : Eraldo Luis da Silva
Data        : 31/01/2012
Descrição   : Envio de valores negativos recebidos via folha de pagamento.
--------------------------------------------------------------------------------
}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UMensErro,UDataBase, UAdmPrev, DBaseDados, StdCtrls, Mask, wwdbedit,
  MAHlpBtn, Buttons, TB97Tlbr, TB97,FPreparaEnvia;

//type TfrmObservacaoDocum = class(TfrmOkCancelar)
type TfrmObservacaoDocum = class(TForm)
    Label1: TLabel;
    Dock971: TDock97;
    tb97Fundo: TToolbar97;
    sep1: TToolbarSep97;
    sep3: TToolbarSep97;
    frmObservacaoDocumento: TBitBtn;
    bbtnAjuda: TmaHelpBitBtn;
    TB97oKCancelar: TToolbar97;
    ToolbarSep971: TToolbarSep97;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    ObsDocumento: TwwDBEdit;
    procedure frmObservacaoDocumentoClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmObservacaoDocum: TfrmObservacaoDocum;

implementation

uses FRecebeContribuicaoNovo;    // edilaine - SIG33372

{$R *.DFM}

procedure TfrmObservacaoDocum.frmObservacaoDocumentoClick(Sender: TObject);
begin
     MsgDlg('O envio foi Cancelado. ','Informação',mtInformation,[mbOk],0);
     frmObservacaoDocum.Close;
end;

procedure TfrmObservacaoDocum.BitBtn3Click(Sender: TObject);
begin
     MsgDlg('O envio foi Cancelado. ','Informação',mtInformation,[mbOk],0);
     frmObservacaoDocum.Close;
end;

procedure TfrmObservacaoDocum.BitBtn2Click(Sender: TObject);
begin
     frmRecebeContribuicaoNovo.sObservacaoDocum := frmObservacaoDocum.ObsDocumento.Text;    // edilaine - SIG33372
end;

end.
