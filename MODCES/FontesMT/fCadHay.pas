unit fCadHay;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCadastroGridCS,
  StdCtrls, TREdit, Mask, DBCtrls, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, Buttons, TB97Tlbr, TB97, Grids, Wwdbigrd, Wwdbgrid,
  ExtCtrls, CmEventosCadastro, ImgList, FCadastroMT, DBClient, uCMClientDataSet, uCtrlTabelaHay;

type
  TfrmCadHay = class(TFrmCadastroMT)
    Label1: TLabel;
    dbedCodigo: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    dbredMultiplicador: TDBRealEdit;
    dbredLimite: TDBRealEdit;
    dbredParcela: TDBRealEdit;
    Label4: TLabel;
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
    CtrlTabelaHay: TCtrlTabelaHay;

    procedure Sel(IdTabelaHay: double);
    function  GravarRegistro: boolean;
  end;

var
  frmCadHay: TfrmCadHay;

implementation

uses uMensErro, uCtrlPadroes;

{$R *.DFM}

procedure TfrmCadHay.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlTabelaHay := TCtrlTabelaHay.Create;
  CtrlTabelaHay.InitializeAs(Padroes);
  CtrlTabelaHay.CdsTabelaHay := Cds;
  Sel(-1);
end;

procedure TfrmCadHay.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlTabelaHay);
  inherited;
end;

procedure TfrmCadHay.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadHay.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
end;

procedure TfrmCadHay.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadHay.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadHay.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadHay.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadHay.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadHay.bbtnConfirmarClick(Sender: TObject);
var
  bInserindo: boolean;
begin
  if (dbredLimite.Value = 0) then
  begin
    MsgDlg('Preencha o Limite de Pontos dessa Faixa.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbredLimite.SetFocus;
  end
  else
  if (dbredMultiplicador.Value = 0) then
  begin
    MsgDlg('Preencha o Fator Multiplicador.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbredMultiplicador.SetFocus;
  end
  else
  begin
    bInserindo := (Cds.State = dsInsert);
    inherited;
    if not(bInserindo) then
      CmeCadastroFind(Sender);
  end;
end;

// ----------------------------------------------------------------------------------------
// Funções do Form
// ----------------------------------------------------------------------------------------

procedure TfrmCadHay.Sel(IdTabelaHay: double);
begin
  Cds.Data := CtrlTabelaHay.ListTabelaHay(IdTabelaHay);
end;

function TfrmCadHay.GravarRegistro: boolean;
begin
  Result := CtrlTabelaHay.Gravar;
  if not(Result) then
    raise Exception.Create(CtrlTabelaHay.MessageInfo);
end;

end.
