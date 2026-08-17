unit fCalculoCota;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, CMDBLookupCombo, Db, DBClient,
  uCMClientDataSet, uCtrlAtivo, uSistema, dBaseDados, uMensErro,
  wwdbdatetimepicker, ComCtrls, CMDateTimePicker, uCtrlCpValorCota,
  JCLSysUtils, fCotasCalculadas;

type
  TfrmCalculoCota = class(TfrmOkCancelar)
    CdsAtivo: TCMClientDataSet;
    lblAtivo: TLabel;
    dblkpAtivo: TCMDBLookupCombo;
    pnlProcesso: TPanel;
    Shape5: TShape;
    shpEtapa1: TShape;
    lblEtapa1: TLabel;
    lblEtapa2: TLabel;
    shpEtapa2: TShape;
    lblEtapa3: TLabel;
    shpEtapa3: TShape;
    shpEtapa4: TShape;
    lblEtapa4: TLabel;
    pbCalculo: TProgressBar;
    pbApuracao: TProgressBar;
    pbGravacao: TProgressBar;
    cbExibirResultados: TCheckBox;
    lblDataFinal: TLabel;
    dtAte: TCMDateTimePicker;
    cdsSaldoConta: TCMClientDataSet;
    cdsValorCota: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    pbProcessoAtual : TProgressBar;

    CtrlCpValorCota : TCtrlCpValorCota;
    CtrlAtivo       : TCtrlAtivo;

    procedure PreparaBarra;

  public
    procedure CalculoInicio;
    procedure CalculoPasso;
    procedure FimApuracao;
    procedure CalculoTermino;

    procedure MsgErro( sMsg : string );
    procedure InicializaJanela;
  end;

var
  frmCalculoCota: TfrmCalculoCota;

implementation

{$R *.DFM}

const
  CorDesligado = clWhite;
  CorLigado    = clLime;

procedure TfrmCalculoCota.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlCpValorCota := TCtrlCpValorCota.Create;
  CtrlCpValorCota.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );

  CtrlCpValorCota.iIdUsuario   := Sistema.IdUsuario;
  CtrlCpValorCota.iIdEmpresa   := Sistema.IdEmpresa;
  CtrlCpValorCota.sNomeUsuario := Sistema.NomeUsuario;

  CtrlAtivo := TCtrlAtivo.Create;
  CtrlAtivo.InitializeAs( CtrlCpValorCota );

  CdsAtivo.Data := CtrlAtivo.CarregaAtivo;

  CtrlCpValorCota.CalculoInicio  := CalculoInicio;
  CtrlCpValorCota.CalculoPasso   := CalculoPasso;
  CtrlCpValorCota.CalculoTermino := CalculoTermino;
  CtrlCpValorCota.FimApuracao    := FimApuracao;

  CtrlCpValorCota.cdsValorCota  := cdsValorCota;
  CtrlCpValorCota.cdsSaldoConta := cdsSaldoConta;

  InicializaJanela;
end;

procedure TfrmCalculoCota.FormDestroy(Sender: TObject);
begin
  CtrlCpValorCota.Free;
  CtrlAtivo.Free;
  inherited;
end;

procedure TfrmCalculoCota.MsgErro(sMsg: string);
begin
  MsgDlg( sMsg, 'Atenção', mtError, [mbOK], 0 );
end;

procedure TfrmCalculoCota.InicializaJanela;
begin
  pbApuracao.Position := 0;
  pbCalculo.Position := 0;
  pbGravacao.Position := 0;
  pbApuracao.Visible := False;
  pbCalculo.Visible := False;
  pbGravacao.Visible := False;

  shpEtapa1.Brush.Color := CorDesligado;
  shpEtapa2.Brush.Color := CorDesligado;
  shpEtapa3.Brush.Color := CorDesligado;
  shpEtapa4.Brush.Color := CorDesligado;
end;

procedure TfrmCalculoCota.bbtnConfirmarClick(Sender: TObject);
var
  bConfirma : boolean;
begin
  inherited;

  InicializaJanela;

  if dtAte.Text = '' then
  begin
    MsgErro( 'Informe a data final do cálculo.' );
    exit;
  end;

  if dtAte.Date >= Date then
  begin
    MsgErro( 'Só é possível calcular cotas de dias anteriores.' );
    exit;
  end;

  pbProcessoAtual := pbApuracao;

  if not CtrlCpValorCota.CalculaCotas( StrToIntDef( dblkpAtivo.LookupValue, 0 ),
   Iff( dtAte.Text <> '', dtAte.Date, 0 ) ) then
    exit;

  if cdsValorCota.IsEmpty then
  begin
    MsgErro( 'Não há cotas pendentes de cálculo até a data especificada.' );
    exit;
  end;

  bConfirma := True;

  if cbExibirResultados.Checked then
  begin
    TfrmCotasCalculadas.Modo( 1 );
    frmCotasCalculadas := TfrmCotasCalculadas.Create( self );
    try
      frmCotasCalculadas.cdsValorCota.Data  := cdsValorCota.Data;
      frmCotasCalculadas.cdsSaldoConta.Data := cdsSaldoConta.Data;

      bConfirma := ( frmCotasCalculadas.ShowModal = mrOk );

    finally
      frmCotasCalculadas.Free;
    end;

  end;


  if not bConfirma then
  begin
    MsgDlg( 'Gravação do cálculo de cotas cancelada pelo usuário.', 'Aviso', mtInformation, [mbOk], 0 );
    exit;
  end;

  shpEtapa3.Brush.Color := CorLigado;

  pbProcessoAtual := pbGravacao;

  //Grava efetivamente os dados processados.
  if CtrlCpValorCota.SalvaDados then
  begin
    shpEtapa4.Brush.Color := CorLigado;

    if cdsValorCota.IsEmpty then
    begin
      pbGravacao.Max      := 100;
      pbGravacao.Position := 100;
    end;

    MsgDlg( 'Cota(s) calculada(s) com sucesso.', 'Atenção', mtInformation, [mbOK], 0 );

    ModalResult := mrOk;
  end;
  
end;

procedure TfrmCalculoCota.CalculoInicio;
begin
  PreparaBarra;
end;

procedure TfrmCalculoCota.CalculoPasso;
begin
  pbProcessoAtual.StepIt;
  Refresh;
end;

procedure TfrmCalculoCota.CalculoTermino;
begin
  shpEtapa2.Brush.Color := CorLigado;
end;

procedure TfrmCalculoCota.PreparaBarra;
begin
  pbProcessoAtual.Min     := 0;
  pbProcessoAtual.Max     := CtrlCpValorCota.iQtdePassos;
  pbProcessoAtual.Visible := True;
end;

procedure TfrmCalculoCota.FimApuracao;
begin
  shpEtapa1.Brush.Color := CorLigado;
  pbProcessoAtual := pbCalculo;
  PreparaBarra;
end;

end.
