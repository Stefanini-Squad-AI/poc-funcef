(*******************************************************************************
 Analista Responsável: Gustavo Viegas
 - Atualizado em 15/09/2000 
*******************************************************************************)

unit fConfSituacaoAtend;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, StdCtrls, ExtCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, fcButton, fcImgBtn, fcShapeBtn, fcClearPanel,
  fcButtonGroup;

type
  TfrmConfSituacaoAtend = class(TfrmSairAjuda)
    BtngSitAtend: TfcButtonGroup;
    BtnIniciado: TfcShapeBtn;
    BtnPendente: TfcShapeBtn;
    BtnCancelado: TfcShapeBtn;
    BtnConcluido: TfcShapeBtn;
    BtnReaberto: TfcShapeBtn;
    BtnContinuado: TfcShapeBtn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfSituacaoAtend: TfrmConfSituacaoAtend;

implementation

{$R *.DFM}

procedure TfrmConfSituacaoAtend.FormCreate(Sender: TObject);
begin
  inherited;
  bbtnSair.Caption := 'Ok';
end;

end.
