unit fParcelaAcordoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, CmEventosCadastro,
  ImgList, MontaSelect, DBTables, IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, MAHlpBtn, TB97Tlbr,
  StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe,
  ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, TREdit, Mask, wwdbedit, DBClient,
  uCMClientDataSet, fCadastroMestreDetMT, uCtrlProcessoTrab, uCtrlParcelasProcTrab;

type
  TfrmParcelaAcordoMT = class(TFrmCadastroMestreDetMT)
    dbedNumProc: TwwDBEdit;
    dbedNome: TwwDBEdit;
    CdsDet: TCMClientDataSet;
    Label1: TLabel;
    dbredNumParcela: TDBRealEdit;
    Label2: TLabel;
    dbredDataParcela: TCMDateTimePicker;
    Label3: TLabel;
    dbredValorParcela: TDBRealEdit;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure dsDetStateChange(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
  private
    CtrlParcelasProcTrab: TCtrlParcelasProcTrab;
    CtrlProcessoTrab: TCtrlProcessoTrab;

    FNumProcTrab: double;
    bEdicao: boolean;
    function GravarRegistro: boolean;
  public
    procedure Sel(NumProcTrab: double);
  end;

procedure ExibirParcelasDoProcesso(NumProcTrab: double; NumParcelas: word;
  DataParcela: TDate; DadosObjetos: OleVariant; Edicao: boolean);

var
  frmParcelaAcordoMT: TfrmParcelaAcordoMT;

implementation

uses uSistema, uMensErro, uCtrlFuncoesRH, uCtrlPadroes, uCtrlUsoGeralRH;

{$R *.DFM}

procedure ExibirParcelasDoProcesso(NumProcTrab: double; NumParcelas: word;
  DataParcela: TDate; DadosObjetos: OleVariant; Edicao: boolean);
begin
  with TfrmParcelaAcordoMT.Create(Application) do
  begin
    Sel(NumProcTrab);
    CtrlParcelasProcTrab.GerarParcelasProcTrab(NumProcTrab, NumParcelas,
      DataParcela, DadosObjetos);
    bEdicao := Edicao;
    ShowModal;
    Free;
  end;
end;

procedure TfrmParcelaAcordoMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlParcelasProcTrab := TCtrlParcelasProcTrab.Create;
  CtrlParcelasProcTrab.InitializeAs(Padroes);
  CtrlParcelasProcTrab.CdsParcelasProcTrab := CdsDet;

  CtrlProcessoTrab := TCtrlProcessoTrab.Create(Sistema.IdModulo, Sistema.IdUsuario,
    Sistema.IdEmpresa, Sistema.UsaPlanoPatro, CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlProcessoTrab.InitializeAs(Padroes);
end;

procedure TfrmParcelaAcordoMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlProcessoTrab);
  FreeAndNil(CtrlParcelasProcTrab);
  inherited;
end;

procedure TfrmParcelaAcordoMT.FormShow(Sender: TObject);
begin
  inherited;
  sbtnAlterar.Enabled := bEdicao;
end;

procedure TfrmParcelaAcordoMT.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  CdsDet.FieldByName('NUMPROCTRAB').asFloat := FNumProcTrab;
end;

procedure TfrmParcelaAcordoMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmParcelaAcordoMT.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmParcelaAcordoMT.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if (CdsDet.State in [dsInsert, dsEdit]) and (dbredNumParcela.CanFocus) then
    dbredNumParcela.SetFocus;
end;

procedure TfrmParcelaAcordoMT.bbtnOkDetClick(Sender: TObject);
begin
  if (Trim(dbredNumParcela.Text) = '') then
  begin
    MsgDlg('Preencha o Número da Parcela.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbredNumParcela.SetFocus;
  end
  else
  if (Trim(dbredDataParcela.Text) = '') then
  begin
    MsgDlg('Preencha a Data de Pagamento.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbredDataParcela.SetFocus;
  end
  else
    inherited;
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmParcelaAcordoMT.Sel(NumProcTrab: double);
begin
  Cds.Data := CtrlProcessoTrab.ListReclamantesDoProcesso(NumProcTrab);
  CdsDet.Data := CtrlParcelasProcTrab.ListParcelasProcTrab(NumProcTrab);

  TFloatField(CdsDet.FieldByName('ValorParcela')).DisplayFormat := '###,###,##0.00';

  FNumProcTrab := NumProcTrab;
end;

function TfrmParcelaAcordoMT.GravarRegistro: boolean;
begin
  Result := CtrlParcelasProcTrab.GravarParcelasProcTrab;
  if not(Result) then
    raise Exception.Create(CtrlParcelasProcTrab.MessageInfo);
end;

end.
