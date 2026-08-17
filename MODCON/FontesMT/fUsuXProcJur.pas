unit fUsuXProcJur;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda, TB97,
  TB97Tlbr, Grids, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Db,
  Wwdbigrd, Wwdbgrid, wwdblook, Wwdatsrc, DBTables, DBClient, uCMClientDataSet, TB97Ctls,
  MontaSelect, uCtrlTransfProcAdvog;

type
  TfrmUsuXProcJur = class(TfrmSairAjuda)
    dsProcAdvog1: TwwDataSource;
    dsProcAdv2: TwwDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    grdAdv1: TwwDBGrid;
    Panel2: TPanel;
    grdAdv2: TwwDBGrid;
    sbtnAdicionarTudo: TSpeedButton;
    sbtnAdicionar: TSpeedButton;
    sbtnRemover: TSpeedButton;
    sbtnRemoverTudo: TSpeedButton;
    CdsProcAdv1: TCMClientDataSet;
    CdsProcAdv2: TCMClientDataSet;
    EdAdv1: TEdit;
    EdAdv2: TEdit;
    MontaSelect1: TMontaSelect;
    MontaSelect2: TMontaSelect;
    sbtnProcurarAdvogado1: TToolbarButton97;
    sbtnProcurarAdvogado2: TToolbarButton97;
    procedure FormCreate(Sender: TObject);
    procedure sbtnAdicionarClick(Sender: TObject);
    procedure sbtnRemoverClick(Sender: TObject);
    procedure sbtnAdicionarTudoClick(Sender: TObject);
    procedure sbtnRemoverTudoClick(Sender: TObject);
    procedure sbtnProcurarAdvogado1Click(Sender: TObject);
    procedure sbtnProcurarAdvogado2Click(Sender: TObject);
  private
    CtrlTransfProcAdvog: TCtrlTransfProcAdvog;
    
    procedure SelAdvogado1;
    procedure SelAdvogado2;
    function  VerificarAdvogadosSel: boolean;
    procedure HabilitarBotoes;
  end;

var
  frmUsuXProcJur: TfrmUsuXProcJur;

implementation

uses uMensErro, uCtrlPadroes, uSistema, uCtrlFuncoesRH, uCMTypes;

{$R *.DFM}

procedure TfrmUsuXProcJur.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlTransfProcAdvog := TCtrlTransfProcAdvog.Create;
  CtrlTransfProcAdvog.InitializeAs(Padroes);
  CtrlTransfProcAdvog.CdsProcAdv1 := CdsProcAdv1;
  CtrlTransfProcAdvog.CdsProcAdv2 := CdsProcAdv2;
  HabilitarBotoes;

  case (Sistema.IdModulo) of
    MODCON            : HelpContext := 760002;
    PROCJUD, PROCPREV : HelpContext := 1100025;
    SISTJURCONS : HelpContext := 7190002;
  end;
end;

procedure TfrmUsuXProcJur.sbtnProcurarAdvogado1Click(Sender: TObject);
begin
  MontaSelect1.Executar;
  sbtnProcurarAdvogado1.Down := false;

  if (MontaSelect1.RetornouValor) then
  begin
    EdAdv1.Text := MontaSelect1.ValoresChave[1];
    SelAdvogado1;
  end;
end;

procedure TfrmUsuXProcJur.sbtnProcurarAdvogado2Click(Sender: TObject);
begin
  MontaSelect2.Executar;
  sbtnProcurarAdvogado2.Down := false;

  if (MontaSelect2.RetornouValor) then
  begin
    EdAdv2.Text := MontaSelect2.ValoresChave[1];
    SelAdvogado2;
  end;
end;

procedure TfrmUsuXProcJur.sbtnAdicionarClick(Sender: TObject);
begin
  if (VerificarAdvogadosSel) then
  begin
    CdsProcAdv1.Edit;
    CdsProcAdv1.FieldByName('IDADVOGCASA').asFloat := StrToFloat(MontaSelect2.ValoresChave[0]);
    CdsProcAdv1.Post;
    if (TComponent(Sender).Name = 'sbtnAdicionar') then
    begin
      CtrlTransfProcAdvog.GravarProcAdv1;
      SelAdvogado1;
      SelAdvogado2;
    end;
  end;
end;

procedure TfrmUsuXProcJur.sbtnAdicionarTudoClick(Sender: TObject);
begin
  if (VerificarAdvogadosSel) then
  begin
    CdsProcAdv1.DisableControls;
    CdsProcAdv1.First;

    while not(CdsProcAdv1.EOF) do
    begin
      sbtnAdicionarClick(Sender);
      CdsProcAdv1.Next;
    end;  

    CtrlTransfProcAdvog.GravarProcAdv1;
    SelAdvogado1;
    SelAdvogado2;
    CdsProcAdv1.EnableControls;
  end;
end;

procedure TfrmUsuXProcJur.sbtnRemoverClick(Sender: TObject);
begin
  if (VerificarAdvogadosSel) then
  begin
    CdsProcAdv2.Edit;
    CdsProcAdv2.FieldByName('IDADVOGCASA').asFloat := StrToFloat(MontaSelect1.ValoresChave[0]);
    CdsProcAdv2.Post;
    if (TComponent(Sender).Name = 'sbtnRemover') then
    begin
      CtrlTransfProcAdvog.GravarProcAdv2;
      SelAdvogado1;
      SelAdvogado2;
    end;
  end;
end;

procedure TfrmUsuXProcJur.sbtnRemoverTudoClick(Sender: TObject);
begin
  if (VerificarAdvogadosSel) then
  begin
    CdsProcAdv2.DisableControls;
    CdsProcAdv2.First;

    while not(CdsProcAdv2.EOF) do
    begin
      sbtnRemoverClick(Sender);
      CdsProcAdv2.Next;
    end;

    CtrlTransfProcAdvog.GravarProcAdv2;
    SelAdvogado1;
    SelAdvogado2;
    CdsProcAdv2.EnableControls;
  end;
end;

function TfrmUsuXProcJur.VerificarAdvogadosSel: boolean;
begin
  if (Trim(EdAdv1.Text) = '') or (Trim(EdAdv2.Text) = '') then
  begin
    MsgDlg('Ambos advogados devem estar selecionados.', 'Atenção', mtWarning, [mbOk, mbHelp], 0);
    Result := false;
  end
  else
    Result := true;
end;

procedure TfrmUsuXProcJur.HabilitarBotoes;
begin
  sbtnAdicionar.Enabled := (CdsProcAdv1.Active) and (CdsProcAdv1.RecordCount > 0);
  sbtnAdicionarTudo.Enabled := (CdsProcAdv1.Active) and (CdsProcAdv1.RecordCount > 0);
  sbtnRemover.Enabled := (CdsProcAdv2.Active) and (CdsProcAdv2.RecordCount > 0);
  sbtnRemoverTudo.Enabled := (CdsProcAdv2.Active) and (CdsProcAdv2.RecordCount > 0);
end;

procedure TfrmUsuXProcJur.SelAdvogado1;
begin
  CdsProcAdv1.Data := CtrlTransfProcAdvog.ListProcAdvogadoCasa(
    StrToFloat(MontaSelect1.ValoresChave[0]));
  HabilitarBotoes;
end;

procedure TfrmUsuXProcJur.SelAdvogado2;
begin
  CdsProcAdv2.Data := CtrlTransfProcAdvog.ListProcAdvogadoCasa(
    StrToFloat(MontaSelect2.ValoresChave[0]));
  HabilitarBotoes;
end;

end.
