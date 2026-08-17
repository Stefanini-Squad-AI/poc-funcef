unit FSaldamento;


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, dBaseDados,
  TB97Tlbr, TB97, ExtCtrls, Db, DBClient, uCMClientDataSet, uCmControlObject, uSistema,
  DBTables, Wwquery, uSaldamento, UMensErro, Spin, fcLabel, TREdit, uCtrlPadroes,
  fcButton, fcImgBtn, ComCtrls, jpeg;

type


  TFrmSaldamento = class(TfrmSairAjuda)
    grpListaPessoas: TGroupBox;
    lblListaPessoas: TLabel;
    sbtnListaPessoas: TSpeedButton;
    EdArquivoMatricula: TEdit;
    OpenDlg: TOpenDialog;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    cmbMesCob: TComboBox;
    spedAnoCob: TSpinEdit;
    Label2: TLabel;
    ChBGerarDemonstrativo: TCheckBox;
    EdMatricula: TEdit;
    Label3: TLabel;
    LblTitulo: TfcLabel;
    Label4: TLabel;
    EdPercentual: TRealEdit;
    ChBxGravarProcesso: TCheckBox;
    Bevel1: TBevel;
    PnlNumParcelasRA: TPanel;
    Label5: TLabel;
    SpEdtNumeroDeParcelas: TSpinEdit;
    EdValorBS: TRealEdit;
    Label6: TLabel;
    LblRegistrosProcessados: TLabel;
    PnlAnoMesInicioAcerto: TPanel;
    Label7: TLabel;
    cmbMesInicio: TComboBox;
    spedAnoInicio: TSpinEdit;
    ChBxDemonstrativoTecnico: TCheckBox;
    LblErrosProcesso: TLabel;
    ChBxSomenteFinanceiro: TCheckBox;
    ChBxSomenteDiferencaRA: TCheckBox;
    ChBxSomenteBUA: TCheckBox;
    BtnProcessar: TBitBtn;
    procedure sbtnListaPessoasClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdArquivoMatriculaChange(Sender: TObject);
    procedure FormShow(Sender: TObject);

    Procedure ProcessouRegistroLocal( Sender: TObject );
    procedure BtnProcessarClick(Sender: TObject);

  private
    { Private declarations }

    iErrosProcesso : Integer;

    Saldamento : TSaldamentoAssociado;

    Function ProcessaAnoMesRefProcesso: String;
    Function ProcessaAnoMesInicioAcerto: String;

  public
    { Public declarations }
  end;

var
  FrmSaldamento: TFrmSaldamento;

implementation

{$R *.DFM}

{ TFrmPreparoSaldamento }


procedure TFrmSaldamento.sbtnListaPessoasClick(Sender: TObject);
begin
  inherited;
  if not OpenDlg.Execute then Exit;

  EdArquivoMatricula.Text := OpenDlg.FileName;

end;

procedure TFrmSaldamento.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  EdArquivoMatricula.Clear;
end;

procedure TFrmSaldamento.FormCreate(Sender: TObject);
begin
  inherited;

  cmbMesCob.ItemIndex    := StrToInt( FormatDateTime( 'MM', Date ) ) - 1;;
  cmbMesInicio.ItemIndex := 8;

end;


Function TFrmSaldamento.ProcessaAnoMesRefProcesso: String;
Var
  sAnoMesRefProcesso : String;
Begin

  If Trim(cmbMesCob.Text) = '' Then Begin
    MsgDlg('Mês final não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
    cmbMesCob.SetFocus;
    Exit;
  end;

  If Trim(spedAnoCob.Text) = '' Then Begin
    MsgDlg('Ano final não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
    spedAnoCob.SetFocus;
    Exit;
  End;

  sAnoMesRefProcesso  := Trim(spedAnoCob.Text)+'/';

  if cmbMesCob.ItemIndex <= 8
  then sAnoMesRefProcesso := sAnoMesRefProcesso + '0' + IntToStr( cmbMesCob.ItemIndex + 1 )
  else sAnoMesRefProcesso := sAnoMesRefProcesso + IntToStr( cmbMesCob.ItemIndex + 1 );

  Result := sAnoMesRefProcesso;

End;

Function TFrmSaldamento.ProcessaAnoMesInicioAcerto: String;
Var
  sAnoMesInicioAcerto : String;
Begin

  sAnoMesInicioAcerto  := Trim(spedAnoInicio.Text)+'/';

  if cmbMesInicio.ItemIndex <= 8
  then sAnoMesInicioAcerto := sAnoMesInicioAcerto + '0' + IntToStr( cmbMesInicio.ItemIndex + 1 )
  else sAnoMesInicioAcerto := sAnoMesInicioAcerto + IntToStr( cmbMesInicio.ItemIndex + 1 );

  Result := sAnoMesInicioAcerto;

End;

procedure TFrmSaldamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  FreeAndNil( Saldamento );

  inherited;

end;

procedure TFrmSaldamento.EdArquivoMatriculaChange(Sender: TObject);
begin
  inherited;

  EdMatricula.Clear;
  EdPercentual.Value := 0;

end;

procedure TFrmSaldamento.FormShow(Sender: TObject);
begin
  inherited;

  iErrosProcesso := 0; 

  PnlNumParcelasRA.Visible      := False;
  PnlAnoMesInicioAcerto.Visible := False;

  ChBxDemonstrativoTecnico.Visible := False;
  ChBxSomenteFinanceiro.Visible    := False;
  ChBxSomenteDiferencaRA.Visible   := False;
  ChBxSomenteBUA.Visible           := False;

  If Tag = 0 Then Begin           { Aposentado }

    PnlNumParcelasRA.Visible      := True;
    PnlAnoMesInicioAcerto.Visible := True;

    ChBxDemonstrativoTecnico.Visible := True;
    ChBxSomenteFinanceiro.Visible    := True;
    ChBxSomenteDiferencaRA.Visible   := True;
    ChBxSomenteBUA.Visible           := True;

    FrmSaldamento.LblTitulo.Caption := 'Saldamento de Aposentados';
    Saldamento := TSaldamentoAposentado.Create;

  End Else If Tag = 1 Then Begin  { Ativo     }

    FrmSaldamento.LblTitulo.Caption := 'Saldamento de Ativos';
    Saldamento := TSaldamentoAtivo.Create;

  End Else Begin                  { Pensoinista }

    PnlNumParcelasRA.Visible      := True;
    PnlAnoMesInicioAcerto.Visible := True;

    ChBxDemonstrativoTecnico.Visible := True;
    ChBxSomenteFinanceiro.Visible    := True;
    ChBxSomenteDiferencaRA.Visible   := True;
    ChBxSomenteBUA.Visible           := True;

    FrmSaldamento.LblTitulo.Caption := 'Saldamento de Pensionistas';
    Saldamento := TSaldamentoPensionista.Create;

  End;

  Saldamento.OnProcessouRegistro := ProcessouRegistroLocal;

  Saldamento.InitializeAs( Padroes );

end;

procedure TFrmSaldamento.ProcessouRegistroLocal;
begin

  LblRegistrosProcessados.Caption := 'Registos processados: '+ IntToStr( Saldamento.RegistrosProcessados );

  If ( Saldamento.ErroProcesso = True ) Then Begin

    Inc( iErrosProcesso );
    LblErrosProcesso.Caption := 'Registros com erros: '+ IntToStr( iErrosProcesso );
    LblErrosProcesso.Refresh;

  End;

  LblRegistrosProcessados.Refresh;
end;



procedure TFrmSaldamento.BtnProcessarClick(Sender: TObject);
begin
  inherited;

  iErrosProcesso := 0;

  If ( Trim( EdMatricula.Text )  = '' ) Then Begin

    If ( Trim( EdArquivoMatricula.Text ) = '' ) Then Begin
      MsgDlg('Informe o arquivo de matriculas. ','Erro',mtError,[mbOk,mbHelp],0);
      EdArquivoMatricula.SetFocus;
      Exit;
    End;

    Saldamento.TipoProcesso            := tpLote;
    Saldamento.NomeArquivoDeMatriculas := Trim( EdArquivoMatricula.Text )

  End Else Begin

    Saldamento.TipoProcesso       := tpIndividual;
    Saldamento.MatriculaIndividuo := Trim( EdMatricula.Text );
    Saldamento.Percentual         := EdPercentual.Value;
    Saldamento.NumeroDeParcelas   := SpEdtNumeroDeParcelas.Value;
    Saldamento.ValorBSExterno     := EdValorBS.Value;

  End;

  Saldamento.AnoMesRefProcesso  := ProcessaAnoMesRefProcesso;
  Saldamento.AnoMesInicioAcerto := ProcessaAnoMesInicioAcerto;

  Saldamento.GravaProcesso       := (ChBxGravarProcesso.Checked);

  Saldamento.GravaDemonstrativo  := (ChBGerarDemonstrativo.Checked);
  Saldamento.SomenteFinanceiro   := (ChBxSomenteFinanceiro.Checked);
  Saldamento.SomenteDiferencaRA  := (ChBxSomenteDiferencaRA.Checked);
  Saldamento.SomenteBUA          := (ChBxSomenteBUA.Checked);


  Saldamento.ExibeDemonstrativoTecnico := (ChBxDemonstrativoTecnico.Checked);

  LblRegistrosProcessados.Visible := True;
  LblErrosProcesso.Visible        := True;

  Saldamento.Processar;

end;

end.