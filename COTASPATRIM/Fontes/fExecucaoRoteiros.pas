unit fExecucaoRoteiros;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, wwdbdatetimepicker, CMDateTimePicker, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, Db,
  DBClient, uCMClientDataSet, uCtrlCpExecRot, uSistema, dBaseDados,
  uMensErro, Mask, DBCtrls, TreeWzd, fResultExecucao, ComCtrls, wwdblook,
  CMDBLookupCombo, uCtrlAtivo, JCLSysUtils;

type
  TfrmExecutarRoteiros = class(TfrmOkCancelar)
    cdsExecRot: TCMClientDataSet;
    dtsExecRot: TDataSource;
    pnlProcesso: TPanel;
    pbMovimentacao: TProgressBar;
    pbApuracao: TProgressBar;
    cdsRoteiros: TCMClientDataSet;
    cdsEntradas: TCMClientDataSet;
    cdsMovimentacoes: TCMClientDataSet;
    cdsExecRoteiros: TCMClientDataSet;
    pbGravacao: TProgressBar;
    shpEtapa1: TShape;
    lblEtapa1: TLabel;
    lblEtapa2: TLabel;
    shpEtapa2: TShape;
    lblEtapa3: TLabel;
    shpEtapa3: TShape;
    shpEtapa4: TShape;
    lblEtapa4: TLabel;
    Shape5: TShape;
    cbExibirResultados: TCheckBox;
    CdsAtivo: TCMClientDataSet;
    lblAtivo: TLabel;
    dblkpAtivo: TCMDBLookupCombo;
    grpPeriodo: TGroupBox;
    lblDataInicial: TLabel;
    dtDe: TCMDateTimePicker;
    lblDataFinal: TLabel;
    dtAte: TCMDateTimePicker;
    cdsEntradasApurRD: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dtDeExit(Sender: TObject);
  private
    pbProcessoAtual : TProgressBar;
    CtrlCpExecRot : TCtrlCpExecRot;
    CtrlAtivo   : TCtrlAtivo;

    procedure PreparaBarra;
  public
    procedure MsgErro( sMsg : string );

    procedure InicializaJanela;

    procedure ProcessoInicio;
    procedure ProcessoPasso;
    procedure ProcessoTermino;    
    procedure EtapasApuradas;
  end;

var
  frmExecutarRoteiros: TfrmExecutarRoteiros;

implementation

{$R *.DFM}

const
  CorDesligado = clWhite;
  CorLigado    = clLime;

procedure TfrmExecutarRoteiros.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlCpExecRot := TCtrlCpExecRot.Create;
  CtrlCpExecRot.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );

  CtrlCpExecRot.ProcessoInicio  := ProcessoInicio;
  CtrlCpExecRot.ProcessoPasso   := ProcessoPasso;
  CtrlCpExecRot.ProcessoTermino := ProcessoTermino;
  CtrlCpExecRot.EtapasApuradas  := EtapasApuradas;

  CtrlCpExecRot.cdsRoteirosApurados        := cdsRoteiros;
  CtrlCpExecRot.cdsEntradasApuradas        := cdsEntradas;
  CtrlCpExecRot.cdsEntradasApurRD          := cdsEntradasApurRD;
  CtrlCpExecRot.cdsMovimentacoesExecutadas := cdsMovimentacoes;
  CtrlCpExecRot.cdsExecRoteiros            := cdsExecRoteiros;

  CtrlCpExecRot.iIdUsuario   := Sistema.IdUsuario;
  CtrlCpExecRot.iIdEmpresa   := Sistema.IdEmpresa;
  CtrlCpExecRot.sNomeUsuario := Sistema.NomeUsuario;

  CtrlAtivo := TCtrlAtivo.Create;
  CtrlAtivo.InitializeAs( CtrlCpExecRot );
  CdsAtivo.Data := CtrlAtivo.CarregaAtivo;

  InicializaJanela;
end;

procedure TfrmExecutarRoteiros.FormDestroy(Sender: TObject);
begin
  CtrlCpExecRot.Free;
  CtrlAtivo.Free;
  inherited;
end;

procedure TfrmExecutarRoteiros.InicializaJanela;
begin
  pbApuracao.Position := 0;
  pbMovimentacao.Position := 0;
  pbGravacao.Position := 0;
  pbApuracao.Visible := False;
  pbMovimentacao.Visible := False;
  pbGravacao.Visible := False;

  shpEtapa1.Brush.Color := CorDesligado;
  shpEtapa2.Brush.Color := CorDesligado;
  shpEtapa3.Brush.Color := CorDesligado;
  shpEtapa4.Brush.Color := CorDesligado;
end;

procedure TfrmExecutarRoteiros.MsgErro(sMsg: string);
begin
  MsgDlg( sMsg, 'Atenção', mtError, [mbOK], 0 );
end;

procedure TfrmExecutarRoteiros.bbtnConfirmarClick(Sender: TObject);
var
  bConfirma : boolean;
begin
  inherited;

  InicializaJanela;

  if dtDe.Text = '' then
  begin
    MsgDlg('Informe a data inicial do período.', 'Atenção', mtWarning, [mbOk], 0);
    dtDe.SetFocus;
    exit;
  end;

  if dtAte.Text = '' then
  begin
    MsgDlg('Informe a data final do período.', 'Atenção', mtWarning, [mbOk], 0);
    dtAte.SetFocus;
    exit;
  end;

  if dtDe.Date > dtAte.Date then
  begin
    MsgDlg('A data final do período não pode ser anterior à data inicial.', 'Atenção', mtWarning, [mbOk], 0);
    dtAte.SetFocus;
    exit;
  end;

  pbProcessoAtual := pbApuracao;

  //Apura roteiros
  if not CtrlCpExecRot.ExecutaRoteirosPendentes( StrToIntDef( dblkpAtivo.LookupValue, 0 ),
   Iff( dtDe.Text <> '', dtDe.Date, 0 ),
   Iff( dtAte.Text <> '', dtAte.Date, 0 ) ) then
    exit;

  if not cdsRoteiros.Active then
    exit;

  //Exibe janela de resultados   
  if cbExibirResultados.Checked then
  begin
    TfrmResultExecucao.Modo( 3 );
    frmResultExecucao := TfrmResultExecucao.Create( Self );
    try
      frmResultExecucao.cdsExecRot.Data       := cdsExecRoteiros.Data;
      frmResultExecucao.cdsRoteiros.Data      := cdsRoteiros.Data;
      frmResultExecucao.cdsEntradas.Data      := cdsEntradas.Data;
      frmResultExecucao.cdsMovimentacoes.Data := cdsMovimentacoes.Data;

      bConfirma := ( frmResultExecucao.ShowModal = mrOk );

    finally
      frmResultExecucao.Free;
    end;
  end
  else
    bConfirma := True;

  if not bConfirma then
  begin
    MsgDlg( 'Gravação da execução de roteiro cancelada pelo usuário.', 'Aviso', mtInformation, [mbOk], 0 );
    exit;
  end;   

  shpEtapa3.Brush.Color := CorLigado;

  pbProcessoAtual := pbGravacao;

  //Grava efetivamente os dados processados.
  if CtrlCpExecRot.SalvaDados then
  begin
    shpEtapa4.Brush.Color := CorLigado;

    if cdsRoteiros.IsEmpty then
    begin
      pbGravacao.Max      := 100;
      pbGravacao.Position := 100;
    end;

    MsgDlg( 'Roteiros executados com sucesso.', 'Aviso', mtInformation, [mbOk], 0 );

    ModalResult := mrOk;
  end;                  

end;

procedure TfrmExecutarRoteiros.ProcessoInicio;
begin
  PreparaBarra;
end;

procedure TfrmExecutarRoteiros.EtapasApuradas;
begin
  shpEtapa1.Brush.Color := CorLigado;
  pbProcessoAtual := pbMovimentacao;
  PreparaBarra;
end;

procedure TfrmExecutarRoteiros.ProcessoPasso;
begin
  pbProcessoAtual.StepIt;
  Refresh;
end;

procedure TfrmExecutarRoteiros.PreparaBarra;
begin
  pbProcessoAtual.Min     := 0;
  pbProcessoAtual.Max     := CtrlCpExecRot.iQtdePassos;
  pbProcessoAtual.Visible := True;
end;

procedure TfrmExecutarRoteiros.ProcessoTermino;
begin
  shpEtapa2.Brush.Color := CorLigado;
end;

procedure TfrmExecutarRoteiros.dtDeExit(Sender: TObject);
begin
  inherited;
  if dtAte.Text = '' then
    dtAte.DateTime := dtDe.DateTime;
end;

end.
