unit fPropAprovaRAD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Mask, wwdbedit, Wwdotdot, Wwdbcomb, JCLSysUtils,
  uMensErro;

type
  TfrmPropAprovaRAD = class(TfrmOkCancelar)
    memObs: TMemo;
    lblTopObs: TPanel;
    pnlRessalva: TPanel;
    cbRessalva: TCheckBox;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    // 1 = Aprovar etapa; 2 = Finalizar processo; 3 = Voltar etapa; 4 = Cancelar RAD
    iTipoOperacao : integer;
  end;

implementation

{$R *.DFM}

procedure TfrmPropAprovaRAD.FormShow(Sender: TObject);
begin
  inherited;

  //Aprovação de etapa
  if iTipoOperacao = 1 then
    Caption := 'Aprovação de etapa';

  //Aprovação de etapa
  if iTipoOperacao = 2 then
    Caption := 'Finalização de processo';

  //Voltar etapa
  if iTipoOperacao = 3 then
  begin
    Caption := 'Voltar etapa do processo';
    lblTopObs.caption := 'Motivo';
  end;

  //Recusar processo
  if iTipoOperacao = 4 then
  begin
    Caption := 'Recusa do processo';
    lblTopObs.caption := 'Motivo';
  end;

  pnlRessalva.Visible := iTipoOperacao < 3;

  memObs.SetFocus;
end;


procedure TfrmPropAprovaRAD.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caHide;
end;


procedure TfrmPropAprovaRAD.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

  //Aprovação de etapa ou de processo
  if iTipoOperacao < 3 then
  begin
    if ( cbRessalva.Checked ) and ( trim( memObs.Text ) = '' ) then
    begin
      MsgDlg( 'Informe o motivo da ressalva.', 'Atenção', mtWarning, [mbOK], 0 );
      memObs.SetFocus;
      exit;
    end;
  end;
          
  //Recusa ou retorno
  if iTipoOperacao >= 3 then
  begin
    if trim( memObs.Text ) = '' then
    begin
      MsgDlg( 'Informe o motivo ' + iff( iTipoOperacao = 3, 'do retorno',
       'da recusa' ) + '.', 'Atenção', mtWarning, [mbOK], 0 );
      memObs.SetFocus;
      exit;
    end;
  end;

  ModalResult := mrOk;
end;

procedure TfrmPropAprovaRAD.FormCreate(Sender: TObject);
begin
  inherited;
  iTipoOperacao := 0;
end;

end.
