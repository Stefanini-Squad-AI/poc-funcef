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
    BtnPendente: TfcShapeBtn;
    BtnCancelado: TfcShapeBtn;
    BtnConcluido: TfcShapeBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnPendenteSelChange(Sender: TObject);
    procedure BtnCanceladoSelChange(Sender: TObject);
    procedure BtnConcluidoSelChange(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfSituacaoAtend: TfrmConfSituacaoAtend;

implementation

uses FPrincipal;

{$R *.DFM}

procedure TfrmConfSituacaoAtend.FormCreate(Sender: TObject);
begin
  inherited;
  bbtnSair.Caption := 'Ok';
  bbtnSair.Enabled := false;
end;

procedure TfrmConfSituacaoAtend.FormShow(Sender: TObject);
begin
  inherited;
  BtngSitAtend.SetFocus;
end;

procedure TfrmConfSituacaoAtend.BtnPendenteSelChange(Sender: TObject);
begin
  inherited;
  bbtnSair.Enabled := TRUE;
end;

procedure TfrmConfSituacaoAtend.BtnCanceladoSelChange(Sender: TObject);
begin
  inherited;
  bbtnSair.Enabled := TRUE;
end;

procedure TfrmConfSituacaoAtend.BtnConcluidoSelChange(Sender: TObject);
begin
  inherited;
  bbtnSair.Enabled := TRUE;
end;

procedure TfrmConfSituacaoAtend.bbtnSairClick(Sender: TObject);
begin
  if BtngSitAtend.Selected.Button = BtnCancelado then
  begin
    if MessageDlg( 'Esta operação irá definir a situação do atendimento como "Cancelado". ' + #13+#10 + #13+#10 +
     'Contudo, todas as operações realizadas durante este atendimento (como contratações de empréstimos ou agendamentos, por exemplo) já ' +
     'encontram-se registradas e não serão canceladas.' + #13+#10 + #13+#10 +
     'Confirma o cancelamento do presente atendimento?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      ModalResult := mrOk;
  end
  else
    ModalResult := mrOk;
end;

end.
