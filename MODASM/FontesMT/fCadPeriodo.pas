unit fCadPeriodo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ImgList, IvMulti,
  DBTables, MontaSelect, CmEventosCadastro, IvDictio, IvEMulti, Db, Grids, Wwdatsrc, Mask,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Wwdbigrd, Wwdbgrid, ComCtrls,
  ExtCtrls, TabControlDetalhe, DBCtrls, wwdbedit, Wwdotdot, Wwdbcomb, wwdblook, DBClient,
  fCadastroMestreDetMT, uCMClientDataSet, uCtrlPerExame, uCtrlTipOcMed, uCtrlCargo;

type
  TfrmCadPeriodo = class(TFrmCadastroMestreDetMT)
    dbedCodOcorr: TDBEdit;
    dbedDescr: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dblckCargo: TwwDBLookupCombo;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    dbcbIndTempo: TwwDBComboBox;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    CdsCargo: TCMClientDataSet;
    CdsDet: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure dsDetStateChange(Sender: TObject);
    procedure dblckCargoChange(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure dbcbIndTempoChange(Sender: TObject);
  private
    CtrlPerExame: TCtrlPerExame;
    CtrlTipOcMed: TCtrlTipOcMed;
    CtrlCargo: TCtrlCargo;

    procedure Sel(CodTipoOcMed: double);
    function  GravarRegistro: boolean;
  end;

var
  frmCadPeriodo: TfrmCadPeriodo;

implementation

uses uCtrlPadroes;

{$R *.DFM}

procedure TfrmCadPeriodo.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlPerExame := TCtrlPerExame.Create;
  CtrlPerExame.InitializeAs(Padroes);
  CtrlPerExame.CdsPerExame := CdsDet;

  CtrlTipOcMed := TCtrlTipOcMed.Create;
  CtrlTipOcMed.InitializeAs(Padroes);

  CtrlCargo := TCtrlCargo.Create;
  CtrlCargo.InitializeAs(Padroes);

  sbtnProcurarClick(Sender);
  if not(MontaSelect.RetornouValor) then
    Sel(-1);

  CdsCargo.Data := CtrlCargo.ListCargo;
end;

procedure TfrmCadPeriodo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlPerExame);
  FreeAndNil(CtrlTipOcMed);
  FreeAndNil(CtrlCargo);
  inherited;
end;

procedure TfrmCadPeriodo.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadPeriodo.CmeDetalheInsert(Sender: TObject);
var
  iNextNumSeq: integer;
begin
  iNextNumSeq := CtrlPerExame.ProximoNumSeqPeriodo;
  inherited;
  CdsDet.FieldByName('CODTIPOOCMED').asString := MontaSelect.ValoresChave[0];
  CdsDet.FieldByName('NUMSEQ').asInteger := iNextNumSeq;
end;

procedure TfrmCadPeriodo.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadPeriodo.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadPeriodo.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if (CdsDet.State in [dsInsert, dsEdit]) and (dblckCargo.CanFocus) then
    dblckCargo.SetFocus;
end;

procedure TfrmCadPeriodo.dblckCargoChange(Sender: TObject);
begin
  if (CdsDet.State in [dsInsert, dsEdit]) then
    if (Trim(dblckCargo.Text) = '') then
      CdsDet.FieldByName('DESCRICAO').Clear
    else
      CdsDet.FieldByName('DESCRICAO').asString := dblckCargo.Text;
end;

procedure TfrmCadPeriodo.dbcbIndTempoChange(Sender: TObject);
begin
  if (CdsDet.State in [dsInsert, dsEdit]) then
    CdsDet.FieldByName('TIPO').asString := dbcbIndTempo.Text;
end;

// ----------------------------------------------------------------------------------------
// Funções do Form
// ----------------------------------------------------------------------------------------

procedure TfrmCadPeriodo.Sel(CodTipoOcMed: double);
begin
  Cds.Data := CtrlTipOcMed.ListTipoOcorrenciaMed(CodTipoOcMed);
  CdsDet.Data := CtrlPerExame.ListPeriodo(CodTipoOcMed);
end;

function TfrmCadPeriodo.GravarRegistro: boolean;
begin
  Result := CtrlPerExame.GravarPeriodo;
  if not(Result) then
    raise Exception.Create(CtrlPerExame.MessageInfo);
end;

end.
