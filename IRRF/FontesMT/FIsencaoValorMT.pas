unit FIsencaoValorMT;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
     Dialogs, FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
     Buttons, TB97Tlbr, TB97, ExtCtrls, Db, Wwdatsrc, uCmSqlParams, DBClient,
     uCMClientDataSet, ComCtrls, Grids, Wwdbigrd, Wwdbgrid, uCtrlGeraIsencao,
     uSistema, uMensErro;

type
  TfrmIsencaoValorMT = class(TfrmOkCancelar)
    pcValoresNegativos: TPageControl;
    cdsBuscaDados: TCMClientDataSet;
    SqlBuscaDados: TCMSqlParams;
    dsBuscaDados: TwwDataSource;
    cdsInforme: TCMClientDataSet;
    sqlInforme: TCMSqlParams;
    dsInforme: TwwDataSource;
    tbsIsencao: TTabSheet;
    pnl_isensao: TPanel;
    Label4: TLabel;
    btnTodosIsencao: TSpeedButton;
    btnInverteIsencao: TSpeedButton;
    udIsencao: TUpDown;
    edtIsencao: TEdit;
    btnSelIsencao: TBitBtn;
    dbgIsencao: TwwDBGrid;
    dbgIsencaoIButton: TwwIButton;
    procedure btnTodasClick(Sender: TObject);
    procedure btnInverterClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSelIsencaoClick(Sender: TObject);
    procedure dbgIsencaoDblClick(Sender: TObject);
    procedure dbgIsencaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
    CtrlGeraIsencao : TCtrlGeraIsencao;

    procedure ProcessaRotinasIsencao;
    procedure MarcarRegistro(const bMarcar: Boolean);
  end;

var
  frmIsencaoValorMT: TfrmIsencaoValorMT;

implementation

uses DBaseDados;

{$R *.DFM}

procedure TfrmIsencaoValorMT.MarcarRegistro(const bMarcar : Boolean);
begin
  cdsBuscaDados.Edit;
  If bMarcar then
    cdsBuscaDados.FieldByName('FLGBUSCA').AsString := 'S'
  else
    cdsBuscaDados.FieldByName('FLGBUSCA').AsString := 'N';
  cdsBuscaDados.Post;
end;

procedure TfrmIsencaoValorMT.btnTodasClick(Sender: TObject);
begin
  inherited;
  dsBuscaDados.DataSet.DisableControls;
  cdsBuscaDados.First;
  While not cdsBuscaDados.EOF do
  begin
    MarcarRegistro(True);
    cdsBuscaDados.Next;
  end;
  cdsBuscaDados.First;
  dsBuscaDados.DataSet.EnableControls;
end;

procedure TfrmIsencaoValorMT.btnInverterClick(Sender: TObject);
begin
  inherited;
  dsBuscaDados.DataSet.DisableControls;
  cdsBuscaDados.First;
  While not cdsBuscaDados.EOF do
  begin
    MarcarRegistro(Not (cdsBuscaDados.FieldByName('FLGBUSCA').AsString = 'S'));
    cdsBuscaDados.Next;
  end;
  cdsBuscaDados.First;
  dsBuscaDados.DataSet.EnableControls;
end;

procedure TfrmIsencaoValorMT.btnSelIsencaoClick(Sender: TObject);
begin
  inherited;
  cdsBuscaDados.Data := ctrlGeraIsencao.ListaGeraIsencao(edtIsencao.Text);
end;

procedure TfrmIsencaoValorMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlGeraIsencao := TCtrlGeraIsencao.Create;
  CtrlGeraIsencao.Initialize(DtmBaseDados.dbBaseDados,
                             True,
                             Sistema.ConnectionType,
                             Sistema.ConnectionSide,
                             Sistema.AppRemoteServer,
                             False,
                             nil);

  //CPrev - 24608 - Inicio
  udIsencao.Position := StrToInt(FormatDateTime('YYYY', Date));

  // Alterado por Arnaldo V. Scarin - 02/12/2008
  // Implementação da DIRF - Fase 2
  pcValoresNegativos.ActivePageIndex := 0;

  //CPrev - 24608 - Fim
end;

procedure TfrmIsencaoValorMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlGeraIsencao.Free;
end;

procedure TfrmIsencaoValorMT.ProcessaRotinasIsencao();
begin
  If cdsBuscaDados.IsEmpty then
  begin
    MsgDlg('Deve ser feita a Seleção de Dados para o processamento!', 'Informação', mtInformation, [mbOk], 0);
  end
  else
  begin
    If not CtrlGeraIsencao.IsencaoRetroativa(edtIsencao.Text, cdsBuscaDados.Data) Then
    begin
      MsgDlg(CtrlGeraIsencao.MessageInfo, 'Informação', mtInformation, [mbOk], 0)
    end
    else
    Begin
      MsgDlg('Acerto efetuado com Sucesso', 'Informação', mtInformation, [mbOk], 0);
    end;
  end;
end;

procedure TfrmIsencaoValorMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  bbtnConfirmar.enabled := False;
  bbtnCancelar.enabled  := False;
  ProcessaRotinasIsencao();
  bbtnConfirmar.enabled := True;
  bbtnCancelar.Enabled  := True;
end;


procedure TfrmIsencaoValorMT.FormShow(Sender: TObject);
begin
  inherited;
  sqlInforme.Open;
end;

procedure TfrmIsencaoValorMT.dbgIsencaoDblClick(Sender: TObject);
begin
  inherited;
  MarcarRegistro(Not (cdsBuscaDados.FieldByName('FLGBUSCA').AsString = 'S'));
end;

procedure TfrmIsencaoValorMT.dbgIsencaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  If Key = VK_SPACE then
  begin
    MarcarRegistro(Not (cdsBuscaDados.FieldByName('FLGBUSCA').AsString = 'S'));
    Key := 0;
  end;
end;

end.
