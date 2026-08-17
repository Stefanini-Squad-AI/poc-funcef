unit fCadPpraAgenteRisco;

{ --------------------------------------------------------------------------------------------------
Rotina......: CmeCadastroInsert, bbtnConfirmarClick, CmeCadastroEdit
Nº SOL......: 229873/16664
Nº PPM......: 570033
Data........: 11/12/2014
Responsável.: Felipe A. Santos
Descrição...: incluído o campo Código eSocial.
-------------------------------------------------------------------------------------------------- }

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, TB97Ctls, MAHlpBtn, StdCtrls, TB97, TB97Tlbr,
  Buttons, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Mask, DBCtrls, CmEventosCadastro, ImgList,
  DBClient, uCMClientDataSet, FCadastroMT, uCtrlPpraAgenteRisco, wwdbedit;

type
  TfrmCadPpraAgenteRisco = class(TFrmCadastroMT)
    Label1: TLabel;
    dbedCodigo: TDBEdit;
    Label2: TLabel;
    dbedDescr: TDBEdit;
    dbrgTipo: TDBRadioGroup;
    lblCodeSocial: TLabel; // Felipe A. Santos SOL229873/16664 PPM 570033
    dbCodeSocial: TwwDBEdit; // Felipe A. Santos SOL229873/16664 PPM 570033
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
    procedure CmeCadastroEdit(Sender: TObject);
  private
    CtrlPpraAgenteRisco: TCtrlPpraAgenteRisco;

    procedure Sel(IdAgenteRisco: double);
    function  GravarRegistro: boolean;
  end;

var
  frmCadPpraAgenteRisco: TfrmCadPpraAgenteRisco;

implementation

uses uMensErro, uCtrlPadroes;

{$R *.DFM}

procedure TfrmCadPpraAgenteRisco.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlPpraAgenteRisco := TCtrlPpraAgenteRisco.Create;
  CtrlPpraAgenteRisco.InitializeAs(Padroes);
  CtrlPpraAgenteRisco.Cds := Cds;

  // Felipe A. Santos SOL229873/16664 PPM 570033 - início
  {MontaSelect.Colunas.Add(
    '(CASE WHEN INDTIPO = 1 THEN ''Químico'' '+
          'WHEN INDTIPO = 2 THEN ''Biológico'' '+
          'WHEN INDTIPO = 3 THEN ''Físico'' '+
          'WHEN INDTIPO = 4 THEN ''Ergonômico'' '+
          'WHEN INDTIPO = 5 THEN ''Mecânico'' '+
    ' END) AS TIPO');}

  HelpContext := 750101;
  // Felipe A. Santos SOL229873/16664 PPM 570033 - fim

  Sel(-1);
end;

procedure TfrmCadPpraAgenteRisco.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlPpraAgenteRisco);
  inherited;
end;

procedure TfrmCadPpraAgenteRisco.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadPpraAgenteRisco.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
  if dbCodeSocial.CanFocus then dbCodeSocial.SetFocus; // Felipe A. Santos SOL229873/16664 PPM 570033
end;

procedure TfrmCadPpraAgenteRisco.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadPpraAgenteRisco.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadPpraAgenteRisco.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadPpraAgenteRisco.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadPpraAgenteRisco.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadPpraAgenteRisco.bbtnConfirmarClick(Sender: TObject);
var
  bInsert: boolean;
begin
  // Felipe A. Santos SOL229873/16664 PPM 570033 - início
  if (Trim(dbCodeSocial.Text) = '') then
  begin
    MsgDlg('Preencha o Código eSocial', 'Aviso', mtWarning, [mbOk, mbHelp], HelpContext);
    dbCodeSocial.SetFocus;
  end
  // Felipe A. Santos SOL229873/16664 PPM 570033 - fim
  else if (Trim(dbedDescr.Text) = '') then
  begin
    MsgDlg('Preencha a Descrição.', 'Aviso', mtWarning, [mbOk, mbHelp], HelpContext);
    dbedDescr.SetFocus;
  end
  else
  begin
    bInsert := (Cds.State = dsInsert);
    inherited;
    if not(bInsert) then
      CmeCadastroFind(Sender);
  end;
end;

// ----------------------------------------------------------------------------------------
// Funções do Form
// ----------------------------------------------------------------------------------------

procedure TfrmCadPpraAgenteRisco.Sel(IdAgenteRisco: double);
begin
  Cds.Data := CtrlPpraAgenteRisco.ListGeral(IdAgenteRisco);
end;

function TfrmCadPpraAgenteRisco.GravarRegistro: boolean;
begin
  Result := CtrlPpraAgenteRisco.Gravar;
  if not(Result) then
    raise Exception.Create(CtrlPpraAgenteRisco.MessageInfo);
end;

procedure TfrmCadPpraAgenteRisco.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  if dbCodeSocial.CanFocus then dbCodeSocial.SetFocus; // Felipe A. Santos SOL229873/16664 PPM 570033
end;

end.
