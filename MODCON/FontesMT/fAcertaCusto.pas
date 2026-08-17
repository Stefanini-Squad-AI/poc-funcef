unit fAcertaCusto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, 
  ComCtrls, uCtrlAcertaCustoProcJur;

type
  TfrmAcertaCusto = class(TfrmSairAjuda)
    rgHonor: TRadioGroup;
    prgbProgresso: TProgressBar;
    rgDespe: TRadioGroup;
    Memo1: TMemo;
    Image1: TImage;
    Bevel1: TBevel;
    Label1: TLabel;
    lblMsg: TLabel;
    bbtnProcessar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    Bevel2: TBevel;
    Label2: TLabel;
    edNumProcAlterados: TEdit;
    procedure bbtnProcessarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    CtrlAcertaCustoProcJur: TCtrlAcertaCustoProcJur;

    procedure Progresso(Args: array of variant);    
  end;

var
  frmAcertaCusto: TfrmAcertaCusto;

implementation

uses uSistema, uMensErro, uCtrlPadroes, uCtrlFuncoesRH;

{$R *.DFM}

procedure TfrmAcertaCusto.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlAcertaCustoProcJur := TCtrlAcertaCustoProcJur.Create;
  CtrlAcertaCustoProcJur.InitializeAs(Padroes);
  CtrlAcertaCustoProcJur.Progresso := Progresso;

  lblMsg.Visible := false;

  case (Sistema.IdModulo) of
    MODCON   : HelpContext := 760001;
    PROCJUD  : HelpContext := 1110025;
    PROCPREV : HelpContext := 1100024;
    SISTJURCONS : HelpContext := 7190001;
  end;
end;

procedure TfrmAcertaCusto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlAcertaCustoProcJur);
  inherited;
end;

procedure TfrmAcertaCusto.bbtnProcessarClick(Sender: TObject);
begin
  if (MsgDlg('Confirma a Execução do Procedimento?', 'Confirmação',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    CtrlAcertaCustoProcJur.CreateThreadProgresso;
    edNumProcAlterados.Text := '0';
    prgbProgresso.Position := 0;
    
    if (CtrlAcertaCustoProcJur.ProcessarAcerto(Sistema.IdModulo,
        rgHonor.ItemIndex=0, rgDespe.ItemIndex=0)) then
    begin
      CtrlAcertaCustoProcJur.FreeThreadProgresso;
      MsgDlg(CtrlAcertaCustoProcJur.MessageInfo, 'Informação', mtInformation, [mbOk,mbHelp], 0);
    end
    else
    begin
      CtrlAcertaCustoProcJur.FreeThreadProgresso;
      raise exception.Create(CtrlAcertaCustoProcJur.MessageInfo);
    end;

    prgbProgresso.Position := 0;
    lblMsg.Visible := false;
  end;
end;

procedure TfrmAcertaCusto.Progresso(Args: array of variant);
begin
  if (Args[0] > 0) then
    prgbProgresso.Max := Args[0];

  if (Args[1] > 0) then
    prgbProgresso.Position := Args[1];

  if (Args[2] <> '') then
  begin
    lblMsg.Visible := true;
    lblMsg.Caption := Args[2];
  end;

  if High(Args) = 4 then
  if (Args[3] > 0) then
    edNumProcAlterados.Text := Args[3];

  Self.Repaint;
end;

end.
