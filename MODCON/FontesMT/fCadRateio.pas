unit fCadRateio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, TREdit,
  ExtCtrls, DBCtrls, Wwdbspin, wwdbdatetimepicker, CMDateTimePicker, wwdblook, Mask, wwdbedit,
  CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect, TB97, DBTables, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, fCadastroMT, DBClient, uCMClientDataSet,
  uCtrlRateioProcTrab;

type
  TfrmCadRateio = class(TfrmCadastroMT)
    pnlFundoEstab: TPanel;
    Label12: TLabel;
    dbedDescricao: TwwDBEdit;
    Label1: TLabel;
    dblcEntid: TwwDBLookupCombo;
    Label2: TLabel;
    dbedDataBase: TCMDateTimePicker;
    Label3: TLabel;
    dbspeAno: TwwDBSpinEdit;
    dbrgTipoRateio: TDBRadioGroup;
    Label10: TLabel;
    Label11: TLabel;
    pnlData: TPanel;
    Label6: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dbedPerc1: TDBRealEdit;
    dbedPerc2: TDBRealEdit;
    pnlValor: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    dbedPerc1V: TDBRealEdit;
    dbedPerc2V: TDBRealEdit;
    dbedVal1: TDBRealEdit;
    dbedVal2: TDBRealEdit;
    dbedVal3: TDBRealEdit;
    dbedVal4: TDBRealEdit;
    dbedPerc3V: TDBRealEdit;
    dbedPerc4V: TDBRealEdit;
    dbedVal5: TDBRealEdit;
    dbedPerc5V: TDBRealEdit;
    dsEstab: TwwDataSource;
    CdsEstab: TCMClientDataSet;
    CdsEntid: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dbrgTipoRateioChange(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
  private
    CtrlRateioProcTrab: TCtrlRateioProcTrab;

    procedure Sel(IdFilialPessoa: double);
    function  GravarRegistro: boolean;
  end;

var
  frmCadRateio: TfrmCadRateio;

implementation

uses uMensErro, uSistema, uCtrlPadroes, uCtrlFuncoesRH;

{$R *.DFM}

procedure TfrmCadRateio.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRateioProcTrab := TCtrlRateioProcTrab.Create;
  CtrlRateioProcTrab.InitializeAs(Padroes);
  CtrlRateioProcTrab.Cds := Cds;
  Sel(-1);

  CdsEntid.Data := CtrlRateioProcTrab.ListEntid;

  case (Sistema.IdModulo) of
    MODCON            : HelpContext := 760016;
    SISTJURCONS       : HelpContext := 7190016;
  end;
end;

procedure TfrmCadRateio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlRateioProcTrab);
  inherited;
end;

procedure TfrmCadRateio.FormShow(Sender: TObject);
begin
  inherited;
  sbtnInserir.Enabled := false;
end;

procedure TfrmCadRateio.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadRateio.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  sbtnInserir.Enabled := (Cds.IsEmpty) or (Cds.State = dsInsert);
end;

procedure TfrmCadRateio.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  Cds.FieldByName('IDFILIALPESSOA').asFloat := CdsEstab.FieldByName('IDPESSOA').asFloat;
  Cds.FieldByName('TIPORATEIO').asInteger := 0;
  Cds.FieldByName('PERIODO').asInteger := 60;
  dbrgTipoRateio.ItemIndex := 0;
end;

procedure TfrmCadRateio.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadRateio.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadRateio.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadRateio.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadRateio.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert,dsEdit]) then
    dblcEntid.SetFocus;
end;

procedure TfrmCadRateio.dbrgTipoRateioChange(Sender: TObject);
begin
  if (dbrgTipoRateio.ItemIndex = 1) then
    pnlValor.BringToFront
  else
    pnlData.BringToFront;
end;

procedure TfrmCadRateio.bbtnConfirmarClick(Sender: TObject);
var
  bInserindo: boolean;
begin
  if (Trim(dbedDataBase.Text) = '') then
  begin
    MsgDlg('Informe a Data de Cisão ou Incorporação.', 'Aviso', mtInformation, [mbOK], 0);
    dbedDataBase.SetFocus;
  end
  else
  begin
    bInserindo := (Cds.State = dsInsert);
    inherited;
    if (bInserindo) then
    begin
      Cds.Data := CtrlRateioProcTrab.ListGeral(StrToFloat(MontaSelect.ValoresChave[0]));
      bbtnCancelarClick(Sender);
    end;
  end;
end;

// ----------------------------------------------------------------------------------------
// Funções do Form
// ----------------------------------------------------------------------------------------

procedure TfrmCadRateio.Sel(IdFilialPessoa: double);
begin
  CdsEstab.Data := CtrlRateioProcTrab.ListEstab(IdFilialPessoa);
  Cds.Data := CtrlRateioProcTrab.ListGeral(IdFilialPessoa);
end;

function TfrmCadRateio.GravarRegistro: boolean;
begin
  Result := CtrlRateioProcTrab.Gravar;
  if not(Result) then
    raise Exception.Create(CtrlRateioProcTrab.MessageInfo);
end;

end.
