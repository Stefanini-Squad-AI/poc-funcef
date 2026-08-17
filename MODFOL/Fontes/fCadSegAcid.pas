unit fCadSegAcid;

//***************************************************************************************
//Rotina:
//Nº SOL: 132180
//Nº KINTANA: 760064
//Data da Alteração: 11/03/2010
//Responsável: Ricardo A.
//Descrição: Aumento para 4 decimais a edição do campo PERCSEGACIDTRAB na janela
//  "Cadastro dos Seguros de Acidentes de Trabalho".
//**************************************************************************************


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, TB97,
  TB97Tlbr, Buttons, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, wwdbedit, Mask, DBCtrls, ImgList,
  CmEventosCadastro, FCadastroMT, DBClient, TREdit, uCMClientDataSet, uCtrlSegAcidTrab;

type
  TfrmCadSegAcid = class(TFrmCadastroMT)
    Label1: TLabel;
    dbedCodigo: TDBEdit;
    Label2: TLabel;
    dbedDescr: TwwDBEdit;
    Label3: TLabel;
    dbredPerc: TDBRealEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
  private
    CtrlSegAcidTrab: TCtrlSegAcidTrab;
    
    procedure Sel(IdSegAcidTrab: integer);
    function  GravarRegistro: boolean;
  end;

var
  frmCadSegAcid: TfrmCadSegAcid;

implementation

uses uMensErro, uCtrlPadroes;

{$R *.DFM}

procedure TfrmCadSegAcid.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlSegAcidTrab := TCtrlSegAcidTrab.Create;
  CtrlSegAcidTrab.InitializeAs(Padroes);
  CtrlSegAcidTrab.Cds := Cds;
  Sel(-1);
end;

procedure TfrmCadSegAcid.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlSegAcidTrab);
  inherited;
end;

procedure TfrmCadSegAcid.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadSegAcid.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
end;

procedure TfrmCadSegAcid.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadSegAcid.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadSegAcid.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadSegAcid.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadSegAcid.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadSegAcid.bbtnConfirmarClick(Sender: TObject);
var
  bInserindo: boolean;
begin
  if (Trim(dbedCodigo.Text) = '') then
  begin
    MsgDlg('Preencha o Código.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbedCodigo.SetFocus;
  end
  else
  if (Trim(dbredPerc.Text) = '') then
  begin
    MsgDlg('Preencha o Percentual de Recolhimento.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbredPerc.SetFocus;
  end
  else
  if (Trim(dbedDescr.Text) = '') then
  begin
    MsgDlg('Preencha a Descrição.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbedDescr.SetFocus;
  end
  else
  begin
    bInserindo := (Cds.State = dsInsert);
    inherited;
    if not(bInserindo) then
      CmeCadastroFind(Sender);
  end;
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmCadSegAcid.Sel(IdSegAcidTrab: integer);
begin
  Cds.Data := CtrlSegAcidTrab.ListGeral(IdSegAcidTrab);
end;

function TfrmCadSegAcid.GravarRegistro: boolean;
begin
  Result := CtrlSegAcidTrab.Gravar;
  if not(Result) then
    raise exception.Create(CtrlSegAcidTrab.MessageInfo);
end;

end.
