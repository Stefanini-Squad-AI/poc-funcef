// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//--------------------------------------------------------------------------------
//Pendência   : SOL 146677 Kintana 1233515
//Responsável : MARCIO DENILSON
//Data        : 10/05/2012
//Descrição   : Ajustes solicitados pela GEPAB
//--------------------------------------------------------------------------------
//Pendência   : SOL 146677 Kintana 1233515
//Responsável : MARCIO DENILSON
//Data        : 10/02/2012
//Descrição   : Novo merge com código da versão de produção da fábrica
//--------------------------------------------------------------------------------
//Pendência   : SOL 146677 Kintana 1233515
//Responsável : MARCIO DENILSON
//Data        : 28/10/2011
//Descrição   : Desenvolvimento inicial da tela
//--------------------------------------------------------------------------------
unit FPrestacaoContasINSSMotivo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls;

type
  TfrmPrestacaoContasINSSMotivo = class(TfrmOkCancelar)
    pnTop: TPanel;
    memoMotivo: TMemo;
    Label1: TLabel;
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrestacaoContasINSSMotivo: TfrmPrestacaoContasINSSMotivo;

implementation

uses UMensErro;

{$R *.DFM}

procedure TfrmPrestacaoContasINSSMotivo.bbtnConfirmarClick(
  Sender: TObject);
begin
  if Trim( memoMotivo.Lines.Text  ) = '' then
   begin
      MsgDlg('Motivo não informado.','Informação', mtInformation, [mbOk, mbHelp], 0);
      Exit;
   end;

  ModalResult := MrOk;
  
end;

end.
