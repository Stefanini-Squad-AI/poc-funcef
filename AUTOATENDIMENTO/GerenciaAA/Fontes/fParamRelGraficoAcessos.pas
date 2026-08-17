unit fParamRelGraficoAcessos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, uCtrlWebPagAcessadas,
  uCtrlWebEmpresaProp, MontaSelect, TEEngine;

type
  TfrmParamRelGraficoAcessos = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    rbPerTodos: TRadioButton;
    rbPerEspec: TRadioButton;
    dtpckrDe: TwwDBDateTimePicker;
    Label1: TLabel;
    dtpckrAte: TwwDBDateTimePicker;
    GroupBox2: TGroupBox;
    rbIntTodas: TRadioButton;
    rbIntEspec: TRadioButton;
    edtInterface: TEdit;
    GroupBox3: TGroupBox;
    rbUsuTodos: TRadioButton;
    rbUsuEspec: TRadioButton;
    edtUsuario: TEdit;
    GroupBox5: TGroupBox;
    rbTotais: TRadioButton;
    rbPercentuais: TRadioButton;
    btnPesqInterface: TSpeedButton;
    btnPesqUsuario: TSpeedButton;
    msInterface: TMontaSelect;
    msUsuario: TMontaSelect;
    cbMesmaSessao: TCheckBox;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure rbPerEspecClick(Sender: TObject);
    procedure rbIntTodasClick(Sender: TObject);
    procedure rbUsuTodosClick(Sender: TObject);
    procedure btnPesqInterfaceClick(Sender: TObject);
    procedure btnPesqUsuarioClick(Sender: TObject);
  private
    WebPagAcessadas : TCtrlWebPagAcessadas;
    WebEmpresaProp  : TCtrlWebEmpresaProp;
    iIdWebInterface ,
    iIdPessoa       : integer;
  public
    procedure MsgErro(sMsg: String);
  end;

var
  frmParamRelGraficoAcessos: TfrmParamRelGraficoAcessos;

implementation

uses dParamRelGraficoAcessos, dBaseDados, uSistema;

{$R *.DFM}

{ TfrmParamRelGraficoAcessos }

procedure TfrmParamRelGraficoAcessos.bbtnConfirmarClick(Sender: TObject);
var
  dDe, dAte : TDateTime;
  iIdInter,
  iIdUsu : integer;
  iConta : integer;
begin
  inherited;

  dDe           := 0;
  dAte          := 0;
  iIdInter      := 0;
  iIdUsu        := 0;

  if rbPerEspec.Checked then
  begin
    if dtpckrDe.Text = '' then
    begin
      ShowMessage('Preencha a data inicial do período.');
      dtpckrDe.SetFocus;
      Abort;
    end;
    if dtpckrAte.Text = '' then
    begin
      ShowMessage('Preencha a data final do período.');
      dtpckrAte.SetFocus;
      Abort;
    end;
    if dtpckrDe.Date > dtpckrAte.Date then
    begin
      ShowMessage('A data inicial do período deve ser anterior à data final.');
      dtpckrDe.SetFocus;
      Abort;
    end;
  end;

  if rbIntEspec.Checked then
  begin
    if iIdWebInterface = 0 then
    begin
      ShowMessage('Selecione a interface.');
      edtInterface.SetFocus;
      Abort;
    end;
  end;

  if rbUsuEspec.Checked then
  begin
    if iIdPessoa = 0 then
    begin
      ShowMessage('Selecione o usuário.');
      edtUsuario.SetFocus;
      Abort;
    end;
  end;

  if rbPerEspec.Checked then
  begin
    dDe           := dtpckrDe.Date;
    dAte          := dtpckrAte.Date;
    dtmParamRelGraficoAcessos.lblPeriodo.Caption := FormatDateTime( 'dd/mm/yyyy', dtpckrDe.Date ) + ' a ' +
                                                    FormatDateTime( 'dd/mm/yyyy', dtpckrAte.Date );
  end
  else
    dtmParamRelGraficoAcessos.lblPeriodo.Caption := 'Todos';

  if rbTotais.Checked then
    //Pendência 23301 - 14/09/2006
    dtmParamRelGraficoAcessos.tcBarras.Chart.Series[0].Marks.Style := smsValue
  else
    dtmParamRelGraficoAcessos.tcBarras.Chart.Series[0].Marks.Style := smsPercent;
    //Fim Pendência 23301

  if rbIntEspec.Checked then
  begin
    iIdInter := iIdWebInterface;
    dtmParamRelGraficoAcessos.lblInterface.Caption := edtInterface.Text;
  end
  else
    dtmParamRelGraficoAcessos.lblInterface.Caption := 'Todas';


  if rbUsuEspec.Checked then
  begin
    iIdUsu := iIdPessoa;
    dtmParamRelGraficoAcessos.lblUsuario.Caption := edtUsuario.Text;
  end
  else
    dtmParamRelGraficoAcessos.lblUsuario.Caption := 'Todos';

  if cbMesmaSessao.Checked then
    dtmParamRelGraficoAcessos.lblMesmaSessao.Caption := '* Considerando páginas acessadas na mesma sessão apenas uma vez.'
  else
    dtmParamRelGraficoAcessos.lblMesmaSessao.Caption := '* Considerando páginas acessadas na mesma sessão várias vezes.';
    
  dtmParamRelGraficoAcessos.cds.Data := WebPagAcessadas.DadosGraficoPorPaginas( dDe,
                                                                                dAte,
                                                                                iIdInter,
                                                                                iIdUsu,
                                                                                cbMesmaSessao.Checked );

  dtmParamRelGraficoAcessos.cdsFundacao.Data := WebEmpresaProp.CabecalhoRelatorio;

  iConta := 0;
  dtmParamRelGraficoAcessos.cds.First;
  while not dtmParamRelGraficoAcessos.cds.Eof do
  begin
    iConta := iConta + dtmParamRelGraficoAcessos.cds.FieldByName('QTDEACESSOS').AsInteger;
    dtmParamRelGraficoAcessos.cds.Next;
  end;
  dtmParamRelGraficoAcessos.cds.First;

  dtmParamRelGraficoAcessos.lblTotal.Caption := IntToStr( iConta );

  ModalResult := mrOk;
end;

procedure TfrmParamRelGraficoAcessos.FormCreate(Sender: TObject);
begin
  inherited;
  WebPagAcessadas := TCtrlWebPagAcessadas.Create;
  WebPagAcessadas.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );

  WebEmpresaProp := TCtrlWebEmpresaProp.Create;
  WebEmpresaProp.InitializeAs( WebPagAcessadas );

  iIdWebInterface := 0;
  iIdPessoa       := 0;
end;

procedure TfrmParamRelGraficoAcessos.FormDestroy(Sender: TObject);
begin
  inherited;
  WebPagAcessadas.Free;
  WebEmpresaProp.Free;
end;

procedure TfrmParamRelGraficoAcessos.MsgErro(sMsg: String);
begin
  ShowMessage( sMsg );
end;

procedure TfrmParamRelGraficoAcessos.rbPerEspecClick(Sender: TObject);
begin
  inherited;
  dtpckrDe.Enabled  := rbPerEspec.Checked;
  dtpckrAte.Enabled := rbPerEspec.Checked;
end;

procedure TfrmParamRelGraficoAcessos.rbIntTodasClick(Sender: TObject);
begin
  inherited;
  btnPesqInterface.Enabled  := rbIntEspec.Checked;
end;

procedure TfrmParamRelGraficoAcessos.rbUsuTodosClick(Sender: TObject);
begin
  inherited;
  btnPesqUsuario.Enabled  := rbUsuEspec.Checked;
end;

procedure TfrmParamRelGraficoAcessos.btnPesqInterfaceClick(
  Sender: TObject);
begin
  inherited;
  msInterface.Executar;
  if msInterface.RetornouValor then
  begin
    edtInterface.Text := msInterface.ValoresChave[1];
    iIdWebInterface   := StrToInt( msInterface.ValoresChave[0] );
  end;
end;

procedure TfrmParamRelGraficoAcessos.btnPesqUsuarioClick(Sender: TObject);
begin
  inherited;
  msUsuario.Executar;
  if msUsuario.RetornouValor then
  begin
    edtUsuario.Text := msUsuario.ValoresChave[1];
    iIdPessoa       := StrToInt( msUsuario.ValoresChave[0] );
  end;
end;

end.
