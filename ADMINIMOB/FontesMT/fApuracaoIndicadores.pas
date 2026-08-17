{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 27394
Responsável : Daniel Simões
Data        : 14/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit fApuracaoIndicadores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMT, IvDictio, IvMulti, IvEMulti, fcButton, fcImgBtn, fcShapeBtn,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls,
  wwdbdatetimepicker, CMDateTimePicker, Mask, wwdbedit, Wwdbspin,
  uCtrlIndicadorImovel, Db, DBClient, uCMClientDataSet, Grids, Wwdbigrd,
  Wwdbgrid;

type
  TfrmApuracaoIndicadores = class(TfrmWizardMT)
    Panel2: TPanel;
    Label15: TLabel;
    Label5: TLabel;
    DBspnAno: TwwDBSpinEdit;
    edtDataLancamento: TCMDateTimePicker;
    cboMes: TComboBox;
    Label1: TLabel;
    dbgrdIndicadores: TwwDBGrid;
    dtsIndicadores: TDataSource;
    cdsIndicadores: TCMClientDataSet;
    cbCFinan: TCheckBox;
    cdsIndicadoresIDINDICADORIMOVEL: TFloatField;
    cdsIndicadoresINMDESCRICAO: TStringField;
    cdsIndicadoresMESCOMPETENCIA: TFloatField;
    cdsIndicadoresANOCOMPETENCIA: TFloatField;
    cdsIndicadoresVLRAPURADO: TFloatField;
    cdsIndicadoresDATAAPURADO: TDateTimeField;
    procedure FormCreate(Sender: TObject);
    procedure btnContinuarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cdsIndicadoresBeforeInsert(DataSet: TDataSet);
    procedure btnConfirmarClick(Sender: TObject);
  private
    CtrlIndicadorImovel : TCtrlIndicadorImovel;

    function CalculaIndicadores : boolean;
    function GravaIndicadores   : boolean;
  public
    procedure MostraMensagem( const Mensagem : string );
    procedure AtualizaProgresso(const Titulo : string; const Total, Atual : integer );
  end;

var
  frmApuracaoIndicadores: TfrmApuracaoIndicadores;

implementation

{$R *.DFM}

uses uVerificaPreenchimento, uComunsImobiliario, uSistema, dBaseDados,
     uMensErro, FEspera, fProgresso, uModuloImobiliario;

procedure TfrmApuracaoIndicadores.FormCreate(Sender: TObject);
var
  iDia, iMes, iAno: word;
begin
  inherited;
  DecodeDate( Now, iAno, iMes, iDia );
  cboMes.ItemIndex       := iMes - 1;
  DBspnAno.Value         := iAno;
  edtDataLancamento.Date := Now;

  CtrlIndicadorImovel := TCtrlIndicadorImovel.Create( Sistema.IdEmpresa,
                                                      Sistema.IdModulo,
                                                      Sistema.IdUsuario,
                                                      Sistema.IdEspAcesso,
                                                      Sistema.UsaPlanoPatro );

  CtrlIndicadorImovel.Initialize( dtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                                  Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                                  ComunsImobiliario.MensErroMT );

  CtrlIndicadorImovel.MensagemParaUsuario := MostraMensagem;
  CtrlIndicadorImovel.AtualizaProgresso   := AtualizaProgresso;

end;

procedure TfrmApuracaoIndicadores.btnContinuarClick(Sender: TObject);
begin
  if PagControle.ActivePageIndex = 0 then
  begin
    if trim( edtDataLancamento.Text ) = '' then
    begin
      MsgDlg( 'Preencha a data de lançamento.', 'Aviso', mtError, [mbOk], 0);
      edtDataLancamento.SetFocus;
      exit;
    end;

    if CtrlIndicadorImovel.VerificaJaApurados( cboMes.ItemIndex + 1, trunc( DBspnAno.Value ) ) then
    begin
      if MessageDlg('Já houve apuração neste período ou posterior. Deseja apurá-lo assim mesmo, destruindo as apurações encontradas?',
       mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
        exit;
    end;

    if CalculaIndicadores then
    begin
      inherited;
      btnConfirmar.Enabled := ( not cdsIndicadores.IsEmpty );
    end;

  end;
end;

function TfrmApuracaoIndicadores.CalculaIndicadores: boolean;
begin
  cdsIndicadores.Data := CtrlIndicadorImovel.ApuraIndicadores( cboMes.ItemIndex + 1,
                                                               trunc( DBspnAno.Value ),
                                                               edtDataLancamento.Date,
                                                               cbCFinan.Checked,
                                                               ModuloImobiliario.AdminImob.sFlgCalcInadimp );

  Result := True;
end;

procedure TfrmApuracaoIndicadores.FormDestroy(Sender: TObject);
begin
  inherited;
  CtrlIndicadorImovel.Free;
end;

procedure TfrmApuracaoIndicadores.MostraMensagem(const Mensagem: string);
begin
  if trim( Mensagem ) <> '' then
  begin
    frmEspera.Config( 'Aguarde', Mensagem, False);
    frmEspera.Show;
    Application.ProcessMessages;
  end
  else
  begin
    frmEspera.Hide;
    frmEspera.Config('', '', False);
  end;
end;

procedure TfrmApuracaoIndicadores.AtualizaProgresso(const Titulo : string; const Total, Atual: integer);
begin
  if Total = 0 then
    frmProgresso.EscondeFormProgresso
  else
  begin
    if Atual = 0 then
    begin
      frmProgresso.Pos := 0;
      frmProgresso.MostraFormProgresso( Titulo, False, False, True, 0, Total )
    end
    else
      frmProgresso.AndaFormProgresso( Atual )
  end;
end;

procedure TfrmApuracaoIndicadores.cdsIndicadoresBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  Abort;
end;

function TfrmApuracaoIndicadores.GravaIndicadores: boolean;
begin
  MostraMensagem('Gravando apuração...');
  Result := CtrlIndicadorImovel.GravaApuracao( cboMes.ItemIndex + 1,
                                               trunc( DBspnAno.Value ),
                                               cdsIndicadores.Data );
  MostraMensagem('');

  if Result then
    ShowMessage( 'Apuração gravada com sucesso.' )
  else
    ShowMessage( 'Não foi possível gravar a apuração.' );
end;

procedure TfrmApuracaoIndicadores.btnConfirmarClick(Sender: TObject);
begin
  inherited;
  if GravaIndicadores then
    btnVoltar.Click;
end;

end.


