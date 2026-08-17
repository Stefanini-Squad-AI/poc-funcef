unit fPropAprovaRAD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Mask, wwdbedit, Wwdotdot, Wwdbcomb;

type
  TfrmPropAprovaRAD = class(TfrmOkCancelar)
    memParecer: TMemo;
    lblTopParecer: TPanel;
    pnlEncaminha: TPanel;
    lblAndamento: TLabel;
    cmbAndamento: TComboBox;
    pnlAutoriza: TPanel;
    cbRessalva: TCheckBox;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    // 1 = Executar etapa; 2 = Voltar etapa; 3 = Cancelar RAD
    iTipoOperacao : integer;
    bConclui : boolean;
  end;

implementation

{$R *.DFM}

procedure TfrmPropAprovaRAD.FormShow(Sender: TObject);
begin
  inherited;

  if iTipoOperacao = 1 then
  begin
    if bConclui then
    begin
      Caption := 'Aprovar processo';
      pnlEncaminha.Visible := False;
    end
    else
    begin
      Caption := 'Encaminhar processo';
      pnlAutoriza.Visible := False;
      cmbAndamento.Items.Clear;
      cmbAndamento.Items.Add( 'Diretor' );
      cmbAndamento.SetFocus;
    end;
  end;


  if iTipoOperacao = 2 then
  begin
    Caption := 'Voltar etapa do processo';
    pnlAutoriza.Visible := False;
    cmbAndamento.Items.Clear;
    cmbAndamento.Items.Add( 'Pendente de análise' );
    cmbAndamento.Items.Add( 'Requer número de documento' );
    cmbAndamento.SetFocus;
  end;


  if iTipoOperacao = 3 then
  begin
    Caption := 'Cancelar processo';
    pnlAutoriza.Visible := False;
    pnlEncaminha.Visible := False;
    memParecer.SetFocus;
  end;


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

  if iTipoOperacao = 1 then
  begin
    if bConclui then
    begin
      if cbRessalva.Checked and ( trim( memParecer.Text ) = '' ) then
      begin
        ShowMessage( 'Informe o parecer.' );
        memParecer.SetFocus;
        exit;
      end;
    end
    else
    begin
      if trim( cmbAndamento.Text ) = '' then
      begin
        ShowMessage( 'Informe o andamento.' );
        cmbAndamento.SetFocus;
        exit;
      end;
    end;
  end;


  if iTipoOperacao = 2 then
  begin
    if trim( cmbAndamento.Text ) = '' then
    begin
      ShowMessage( 'Informe o andamento.' );
      cmbAndamento.SetFocus;
      exit;
    end;
    if trim( memParecer.Text ) = '' then
    begin
      ShowMessage( 'Informe o parecer.' );
      memParecer.SetFocus;
      exit;
    end;
  end;

  
  if iTipoOperacao = 3 then
  begin
    if trim( memParecer.Text ) = '' then
    begin
      ShowMessage( 'Informe o parecer.' );
      memParecer.SetFocus;
      exit;
    end;
  end;

  ModalResult := mrOk;
end;

procedure TfrmPropAprovaRAD.FormCreate(Sender: TObject);
begin
  inherited;
  bConclui := False;
  iTipoOperacao := 0;
end;

end.
