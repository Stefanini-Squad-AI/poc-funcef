unit FPreparoSaldamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, dBaseDados,
  TB97Tlbr, TB97, ExtCtrls, Db, DBClient, uCMClientDataSet, uCmControlObject, uSistema,
  DBTables, Wwquery, uFuncoesSaldamento, UMensErro, Spin;

type


  TFrmPreparoSaldamento = class(TfrmSairAjuda)
    ImgProcessar: TImage;
    grpListaPessoas: TGroupBox;
    lblListaPessoas: TLabel;
    sbtnListaPessoas: TSpeedButton;
    edListaPessoas: TEdit;
    OpenDlg: TOpenDialog;
    MemoMatriculas: TMemo;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    cmbMesCob: TComboBox;
    spedAnoCob: TSpinEdit;
    Label2: TLabel;
    ChBxMostraEvolucao: TCheckBox;
    BtnGeraAcertos: TSpeedButton;

    procedure ImgProcessarClick(Sender: TObject);
    procedure sbtnListaPessoasClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnGeraAcertosClick(Sender: TObject);
  private
    { Private declarations }

    Function ProcessaAnoMesRefProcesso: String;
    Function ProcessaArquivoMatriculas: String;


  public
    { Public declarations }
  end;

var
  FrmPreparoSaldamento: TFrmPreparoSaldamento;

implementation


{$R *.DFM}

{ TFrmPreparoSaldamento }


procedure TFrmPreparoSaldamento.ImgProcessarClick(Sender: TObject);
Begin

  ProcessarPreparo( ProcessaAnoMesRefProcesso,
                    ProcessaArquivoMatriculas,
                    (ChBxMostraEvolucao.Checked) );

end;

procedure TFrmPreparoSaldamento.sbtnListaPessoasClick(Sender: TObject);
begin
  inherited;
  if not OpenDlg.Execute then Exit;

  edListaPessoas.Text := OpenDlg.FileName;

  MemoMatriculas.Lines.Clear;

end;

procedure TFrmPreparoSaldamento.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  edListaPessoas.Clear;
end;

procedure TFrmPreparoSaldamento.FormCreate(Sender: TObject);
begin
  inherited;
  OpenDlg.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
  cmbMesCob.ItemIndex := 9;

end;


procedure TFrmPreparoSaldamento.BtnGeraAcertosClick(Sender: TObject);
begin
  inherited;

  AcertaBeneficioTransfPlano( ProcessaAnoMesRefProcesso, ProcessaArquivoMatriculas, (ChBxMostraEvolucao.Checked) );

end;

Function TFrmPreparoSaldamento.ProcessaAnoMesRefProcesso: String;
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

function TFrmPreparoSaldamento.ProcessaArquivoMatriculas: String;
Var
  sNomeArquivo, sMatricula, sLinhaMatriculas, sAnoMesRefProcesso : String;
  I, V : Integer;
  MemoLocal : TMemo;
  bSairLoop : Boolean;
  VetMatriculas : Array [0..200] Of String;
begin
  inherited;

  If Trim( MemoMatriculas.Lines.Text ) <> '' Then Begin

    Try

      Try

        MemoLocal         := TMemo.Create( Self );
        MemoLocal.Visible := False;
        MemoLocal.Parent  := Self;

        bSairLoop         := False;
        sLinhaMatriculas  := MemoMatriculas.Lines.GetText;

        While True Do Begin

          V := Pos( ',', sLinhaMatriculas );

          If ( V <= 0 ) Then Begin

            V := Length( MemoMatriculas.Lines.GetText );
            bSairLoop := True;

          End Else Begin

            V := (V - 1);

          End;

          sMatricula       := Trim( Copy( sLinhaMatriculas, 1, V ) );

          sLinhaMatriculas := Copy( sLinhaMatriculas, (V+2), Length( sLinhaMatriculas ) );

          MemoLocal.Lines.Add( sMatricula );

          If ( bSairLoop = True ) Then Break;

        End;

      Finally

//      sNomeArquivo := 'C:\MATRICULAS PROCESSADAS NO SALDAMENTO.TXT';
        sNomeArquivo := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\MATRICULAS PROCESSADAS NO SALDAMENTO.TXT';
        MemoLocal.Lines.SaveToFile( sNomeArquivo );

        FreeAndNil( MemoLocal );

      End;

    Except

      MsgDlg('Erro ao tentar processar arquivo de matriculas. ', 'Erro',mterror,[mbOk],0);

    End;

  End Else Begin

    If ( Trim( edListaPessoas.Text ) <> '' ) Then MontaStringMatriculas( edListaPessoas.Text );
    sNomeArquivo := edListaPessoas.Text;

  End;

  Result := sNomeArquivo;

end;

end.
