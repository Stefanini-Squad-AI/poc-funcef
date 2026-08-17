unit fCadServicoManut;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, TB97Ctls, MAHlpBtn, StdCtrls, TB97, TB97Tlbr,
  Buttons, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Mask, DBCtrls, CmEventosCadastro, ImgList,
  DBClient, uCMClientDataSet, FCadastroMT, uCtrlServicoManut, wwdbedit;

type
  TfrmCadServicoManut = class(TFrmCadastroMT)
    Label1: TLabel;
    dbedCodigo: TDBEdit;
    Label2: TLabel;
    dbedDescr: TwwDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
  private
    CtrlServicoManut: TCtrlServicoManut;
    procedure Sel(IdServicoManut: double);
  end;

var
  frmCadServicoManut: TfrmCadServicoManut;

implementation

uses uMensErro, uCtrlPadroes, uSistema;

{$R *.DFM}

procedure TfrmCadServicoManut.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlServicoManut := TCtrlServicoManut.Create;
  CtrlServicoManut.InitializeAs(Padroes);
  CtrlServicoManut.CdsServicoManut := Cds;
  MontaSelect.Filtro.Add('IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
  Sel(-1);
end;

procedure TfrmCadServicoManut.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlServicoManut);
  inherited;
end;

procedure TfrmCadServicoManut.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadServicoManut.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
end;

procedure TfrmCadServicoManut.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadServicoManut.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := (CtrlServicoManut.GravarServicoManut);
end;

procedure TfrmCadServicoManut.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := (CtrlServicoManut.GravarServicoManut);
end;

procedure TfrmCadServicoManut.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := (CtrlServicoManut.GravarServicoManut);
end;

procedure TfrmCadServicoManut.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadServicoManut.bbtnConfirmarClick(Sender: TObject);
begin
  if (Trim(dbedDescr.Text) = '') then
  begin
    MsgDlg('Preencha a Descrição.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbedDescr.SetFocus;
  end
  else
    inherited;
end;

procedure TfrmCadServicoManut.Sel(IdServicoManut: double);
begin
  Cds.Data := CtrlServicoManut.ListServicoManut(IdServicoManut);
end;

end.
