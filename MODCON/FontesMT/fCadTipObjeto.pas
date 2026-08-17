unit fCadTipObjeto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, cmseldlg, wwidlg,
  Db, Wwdatsrc, DBCtrls, MAHlpBtn, StdCtrls, Buttons, ComCtrls, ToolWin, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, Mask, DBTables, TB97, IvDictio, IvMulti, IvEMulti, TB97Ctls, TB97Tlbr,
  wwdblook, CmEventosCadastro, wwDialog, ImgList, FCadastroMT, MontaSelect, DBClient,
  uCMClientDataSet, uCtrlTipObjeto;

type
  TfrmCadTipObjeto = class(TFrmCadastroMT)
    Label1: TLabel;
    dbedCodigo: TDBEdit;
    Label2: TLabel;
    dbedDescr: TDBEdit;
    Label3: TLabel;
    dblcGrpObjeto: TwwDBLookupCombo;
    dbrgRubrica: TDBRadioGroup;
    gbxRubrica: TGroupBox;
    dblcRubrica: TwwDBLookupCombo;
    CdsRubrica: TCMClientDataSet;
    CdsGrpObjeto: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure dsStateChange(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure dbrgRubricaChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblcRubricaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
  private
    CtrlTipObjeto: TCtrlTipObjeto;

    procedure Sel(CodTipoObjeto: double);
    function  GravarRegistro: boolean;
  end;

var
  frmCadTipObjeto: TfrmCadTipObjeto;

implementation

uses uSistema, uMensErro, uCtrlPadroes, uCtrlFuncoesRH;

{$R *.DFM}

procedure TfrmCadTipObjeto.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlTipObjeto := TCtrlTipObjeto.Create;
  CtrlTipObjeto.InitializeAs(Padroes);
  CtrlTipObjeto.CdsTipObjeto := Cds;
  Sel(-1);

  CdsGrpObjeto.Data := CtrlTipObjeto.ListGrpObjeto;

  case (Sistema.IdModulo) of
    MODCON, PROCPREV, SISTJURCONS :
    begin
      CdsRubrica.Data := CtrlTipObjeto.ListRubrica(Sistema.IdEmpresa);
      dbrgRubrica.Visible := not(CdsRubrica.IsEmpty);
      gbxRubrica.Visible := (dbrgRubrica.ItemIndex = 0);
      Self.Height := 302;
      if (Sistema.IdModulo = MODCON) then
        HelpContext := 760013
      else if (Sistema.IdModulo = SISTJURCONS) then
        HelpContext := 7190013
      else
        HelpContext := 1100008;
    end;
    PROCJUD :
    begin
      dbrgRubrica.Visible := false;
      gbxRubrica.Visible := false;
      Self.Height := 219;
      HelpContext := 1110009;
    end;
  end;
end;

procedure TfrmCadTipObjeto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlTipObjeto);
  inherited;
end;

procedure TfrmCadTipObjeto.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadTipObjeto.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
  Cds.FieldByName('CLASSEOBJ').asInteger := 1;
end;

procedure TfrmCadTipObjeto.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadTipObjeto.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadTipObjeto.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadTipObjeto.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadTipObjeto.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadTipObjeto.dbrgRubricaChange(Sender: TObject);
begin
  inherited;
  gbxRubrica.Visible := (dbrgRubrica.ItemIndex = 0);
  if (Cds.State in [dsInsert,dsEdit]) and (dbrgRubrica.ItemIndex = 1) then
    Cds.FieldByName('IDPROVENTO').Clear;
end;

procedure TfrmCadTipObjeto.dblcRubricaCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  if (Modified) and (Trim(dbedDescr.Text) <> '') and
     (Trim(dbedDescr.Text) <> Trim(dblcRubrica.Text)) and
     (MsgDlg('Altera a Descrição do Objeto?', LerMensagem(4), mtConfirmation,
      [mbYes, mbNo], 0) = mrYes) then
    dbedDescr.Text := Trim(dblcRubrica.Text);
end;

procedure TfrmCadTipObjeto.bbtnConfirmarClick(Sender: TObject);
var
  bInserindo: boolean;
begin
  if (Trim(dbedCodigo.Text) = '') then
  begin
    MsgDlg('Preencha o Código.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbedCodigo.SetFocus;
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

// ----------------------------------------------------------------------------------------
// Funções do Form
// ----------------------------------------------------------------------------------------

procedure TfrmCadTipObjeto.Sel(CodTipoObjeto: double);
begin
  Cds.Data := CtrlTipObjeto.ListTipObjeto(CodTipoObjeto);
end;

function TfrmCadTipObjeto.GravarRegistro: boolean;
begin
  Result := CtrlTipObjeto.GravarTipObjeto;
  if not(Result) then
    raise Exception.Create(CtrlTipObjeto.MessageInfo);
end;

end.
