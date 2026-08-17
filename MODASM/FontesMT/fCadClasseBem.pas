unit fCadClasseBem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCadastroMT,
  MontaSelect, Db, DBClient, uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, DBCtrls,
  Mask, uCtrlPpraBem;

type
  TfrmCadClasseBem = class(TFrmCadastroMT)
    Label1: TLabel;
    Label2: TLabel;
    dbedCodigo: TDBEdit;
    dbedDescr: TDBEdit;
    dbrgAnaSint: TDBRadioGroup;
    dbrgEP: TDBRadioGroup;
    dsDet: TwwDataSource;
    CdsDet: TCMClientDataSet;
    spbtnExcuiEP: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure spbtnExcuiEPClick(Sender: TObject);
  private
    CtrlPpraBem: TCtrlPpraBem;

    procedure Sel(IdClasseBem: double);
    function  GravarRegistro(Exclusao: boolean): boolean;
  end;

var
  frmCadClasseBem: TfrmCadClasseBem;

implementation

uses uMensErro, uCtrlPadroes;

{$R *.DFM}

procedure TfrmCadClasseBem.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlPpraBem := TCtrlPpraBem.Create;
  CtrlPpraBem.InitializeAs(Padroes);
  CtrlPpraBem.Cds2 := Cds;
  CtrlPpraBem.Cds3 := CdsDet;

  Sel(-1);
end;

procedure TfrmCadClasseBem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlPpraBem);
  inherited;
end;

procedure TfrmCadClasseBem.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadClasseBem.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
  Cds.FieldByName('ANASINT').asString := 'A';
end;

procedure TfrmCadClasseBem.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadClasseBem.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro(false);
end;

procedure TfrmCadClasseBem.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro(false);
end;

procedure TfrmCadClasseBem.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro(true);
end;

procedure TfrmCadClasseBem.spbtnExcuiEPClick(Sender: TObject);
begin
  if (CdsDet.IsEmpty) then
    MsgDlg('Ação desnecessária, Classe de Bem não é EP.', 'Aviso', mtWarning, [mbOk, mbHelp], 0)
  else
    CdsDet.Delete;
end;

procedure TfrmCadClasseBem.bbtnConfirmarClick(Sender: TObject);
var
  bInsert: boolean;
begin
  if (Trim(dbedDescr.Text) = '') then
  begin
    MsgDlg('Preencha a Descrição.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbedDescr.SetFocus;
  end
  else
  begin
    bInsert := (Cds.State = dsInsert);
    inherited;
    if not(bInsert) then
      Sel(StrToInt(MontaSelect.ValoresChave[0]));
  end;
end;

// ----------------------------------------------------------------------------------------
// Funções do Form
// ----------------------------------------------------------------------------------------

procedure TfrmCadClasseBem.Sel(IdClasseBem: double);
begin
  Cds.Data := CtrlPpraBem.ListClasseBem(IdClasseBem);
  CdsDet.Data := CtrlPpraBem.ListPpraClasseBem(IdClasseBem);
end;

function TfrmCadClasseBem.GravarRegistro(Exclusao: boolean): boolean;
begin
  if (Exclusao) then
    Result := CtrlPpraBem.ExcluirClasseBem
  else
    Result := CtrlPpraBem.GravarClasseBem;

  if not(Result) then
    raise Exception.Create(CtrlPpraBem.MessageInfo);
end;

end.
