unit fCadProvento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, CmEventosCadastro,
  ImgList, Db, Wwdatsrc, MontaSelect, DBTables, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, DBCtrls,
  wwdblook, Mask, wwdbedit, fCadastroMT, DBClient, uCMClientDataSet, uCtrlProvDesc,
  uCtrlTipoBenSal, uCtrlCadRegra;

type
  TfrmCadProvento = class(TFrmCadastroMT)
    Label1: TLabel;
    dbedCodInterno: TwwDBEdit;
    Label2: TLabel;
    dbedDescr: TwwDBEdit;
    Label3: TLabel;
    dblckRegra: TwwDBLookupCombo;
    Label4: TLabel;
    dblckBenef: TwwDBLookupCombo;
    dbrgrpDesconto: TDBRadioGroup;
    GroupBox1: TGroupBox;
    dbchkConstaFolha: TDBCheckBox;
    dbchkObrigaFavorecido: TDBCheckBox;
    CdsRegra: TCMClientDataSet;
    CdsTipoBenef: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
  private
    CtrlProvDesc: TCtrlProvDesc;
    CtrlTipoBenSal: TCtrlTipoBenSal;
    CtrlCadRegra: TCtrlCadRegra;

    procedure Sel(IdProvento: double);
    function  GravarRegistro: boolean;
  end;

var
  frmCadProvento: TfrmCadProvento;

implementation

uses uMensErro, uCtrlPadroes;

{$R *.DFM}

procedure TfrmCadProvento.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlTipoBenSal := TCtrlTipoBenSal.Create;
  CtrlTipoBenSal.InitializeAs(Padroes);

  CtrlCadRegra := TCtrlCadRegra.Create;
  CtrlCadRegra.InitializeAs(Padroes);

  CtrlProvDesc := TCtrlProvDesc.Create;
  CtrlProvDesc.InitializeAs(Padroes);
  CtrlProvDesc.Cds := Cds;
  Sel(-1);

  CdsRegra.Data := CtrlCadRegra.ListaRegra;
  CdsTipoBenef.Data := CtrlTipoBenSal.ListTipoBenSal;
end;

procedure TfrmCadProvento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlProvDesc);
  FreeAndNil(CtrlTipoBenSal);
  FreeAndNil(CtrlCadRegra);
  inherited;
end;

procedure TfrmCadProvento.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadProvento.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
  Cds.FieldByName('FLGIRRF').asInteger := 0;
  Cds.FieldByName('FLGFGTS').asInteger := 0;
  Cds.FieldByName('FLGINSS').asInteger := 0;
  Cds.FieldByName('FLGCONSTAFOLHA').asInteger := 0;
  Cds.FieldByName('FLGOBRIGAFAVOREC').asInteger := 0;
  Cds.FieldByName('FLGDESCONTO').asInteger := 0;
  Cds.FieldByName('FLGTPRUBRICA').asString := 'F';  
end;

procedure TfrmCadProvento.CmeCadastroDelete(Sender: TObject);
begin
  if (Cds.FieldByName('FLGINTERNO').asInteger = 1) then
    MsgDlg('Esta rubrica não pode ser excluída.', 'Aviso', mtInformation, [mbOk,mbHelp], 0)
  else
    inherited;
end;

procedure TfrmCadProvento.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadProvento.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := (CtrlProvDesc.GravarProvento);
end;

procedure TfrmCadProvento.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := (CtrlProvDesc.GravarProvento);
end;

procedure TfrmCadProvento.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := (CtrlProvDesc.GravarProvento);
end;

procedure TfrmCadProvento.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedDescr.CanFocus) then
    dbedDescr.SetFocus;
end;

procedure TfrmCadProvento.bbtnConfirmarClick(Sender: TObject);
var
  bInserindo: boolean;
begin
  if (Trim(dbedDescr.Text) = '') then
  begin
    MsgDlg('Preencha a Descrição.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dbedDescr.SetFocus;
  end
  else
  if (dbrgrpDesconto.ItemIndex = -1) then
  begin
    MsgDlg('Informe o Tipo da Rubrica.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dbrgrpDesconto.SetFocus;
  end
  else
  begin
    Cds.FieldByName('FLGINTERNO').asInteger := 0;
    Cds.FieldByName('DESCRICAO').asString := Trim(Cds.FieldByName('DESCRICAO').asString);
    bInserindo := (Cds.State = dsInsert);
    inherited;
    if not(bInserindo) then
      CmeCadastroFind(Sender);
  end;
end;

// ----------------------------------------------------------------------------------------
// Funções do Form
// ----------------------------------------------------------------------------------------

procedure TfrmCadProvento.Sel(IdProvento: double);
begin
  Cds.Data := CtrlProvDesc.ListProvDesc(IdProvento);
end;

function TfrmCadProvento.GravarRegistro: boolean;
begin
  Result := CtrlProvDesc.GravarProvento;
  if not(Result) then
    raise Exception.Create(CtrlProvDesc.MessageInfo);
end;

end.
