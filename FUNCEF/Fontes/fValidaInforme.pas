// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Claudio Faria
// Data        : 26/03/2007
// Pendência   : 24893
// Alteração   : Verifca se existe numero de processo para linhas do tipo 6
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 08/03/2007
// Alteração   : Nova tela para a validação do arquivo de informe gerado pelo IRRF (Folha de Benefício)
//------------------------------------------------------------------------------

unit fValidaInforme;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBClient, uValidaInforme, uCtrlPadroes,
  uSistema, uMensErro, uCMClientDataSet;

type
  TfrmValidaInforme = class(TfrmSairAjuda)
    grpArquivo: TGroupBox;
    edLeArquivo: TEdit;
    SpeedButton1: TSpeedButton;
    OpenDialog1: TOpenDialog;
    bbtnConfirmar: TBitBtn;
    grpEstatistica: TGroupBox;
    Label1: TLabel;
    lbLinhasLidas: TLabel;
    Label2: TLabel;
    lbInicio: TLabel;
    Label4: TLabel;
    lbFim: TLabel;
    cdsProcesso: TClientDataSet;
    Label3: TLabel;
    lbErros: TLabel;
    grpDestino: TGroupBox;
    SpeedButton2: TSpeedButton;
    edDestino: TEdit;
    SaveDialog1: TSaveDialog;
    procedure SpeedButton1Click(Sender: TObject);
    procedure edLeArquivoChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }

    Function PossuiLinhasComplementares(psMatricula : String):Boolean;
    Function VerificaNumeroProcesso(psLinha6 : String):Boolean;        // ClaudioR - 24893 - 26/03/2007

    function CriaArquivo(Arquivo : String):Boolean;
    function GravaLinha(Arquivo, Linha : String):Boolean;
  public
    { Public declarations }

  end;

var
  frmValidaInforme : TfrmValidaInforme;
  ValidaInforme    : TValidaInforme;
  ArquivoLog       : TextFile;

implementation

{$R *.DFM}


function TfrmValidaInforme.VerificaNumeroProcesso(psLinha6 : String): Boolean;
Var sNumProcesso : String;
    Temp :Integer;
begin
  Result := True;

  sNumProcesso := Copy(psLinha6, 13, 19);

  Temp := Pos('Rend.', sNumProcesso);

  If (Pos('Rend.', sNumProcesso) > 0) Or
     (Pos('IRRF.', sNumProcesso) > 0) Then Result := False;
end;


function TfrmValidaInforme.CriaArquivo(Arquivo : String): Boolean;
begin
  Result := False;

  If FileExists(Arquivo) Then
    If MsgDlg('O arquivo ' + ExtractFileName(Arquivo) + ' já existe, ' + #13 +
              'deseja substituir esse arquivo?', 'IRRF', mtWarning, [mbYes, mbNo], 0) = mrYes then
      DeleteFile(Arquivo)
    Else
      Exit;

  Try
    AssignFile(ArquivoLog, Arquivo);
    Rewrite(ArquivoLog);
    CloseFile(ArquivoLog);

    Result := True;
  Except
    Result := False;
  End;
end;

function TfrmValidaInforme.GravaLinha(Arquivo, Linha : String): Boolean;
begin
  If Linha = '' Then Exit;

  AssignFile(ArquivoLog, Arquivo);
  Append(ArquivoLog);

  Write(ArquivoLog, Linha);
  WriteLn(ArquivoLog);

  CloseFile(ArquivoLog);
end;

function TfrmValidaInforme.PossuiLinhasComplementares(psMatricula : String): Boolean;
begin
  Result := False;

  cdsProcesso.Data := ValidaInforme.ListaCompleta(psMatricula, 2006);

  If cdsProcesso.RecordCount > 0 Then Result := True;
end;

procedure TfrmValidaInforme.SpeedButton1Click(Sender : TObject);
begin
  inherited;

  If OpenDialog1.Execute Then
  Begin
    edLeArquivo.Text := OpenDialog1.FileName;
  End;
end;

procedure TfrmValidaInforme.SpeedButton2Click(Sender : TObject);
begin
  inherited;

  If SaveDialog1.Execute Then
  Begin
    edDestino.Text := SaveDialog1.FileName;
  End;
end;

procedure TfrmValidaInforme.edLeArquivoChange(Sender : TObject);
begin
  inherited;

  bbtnConfirmar.Enabled := ((Length(edLeArquivo.Text) > 0) And (Length(edDestino.Text) > 0));
end;

procedure TfrmValidaInforme.bbtnConfirmarClick(Sender : TObject);
var aArq            : TextFile;
    sLinha,
    sCPF,
    sArquivo        : String;
    iContador,
    iErros,
    iLinhas         : Integer;
    bTemLinha6,
    bTemDeposito    : Boolean;
    fValor          : Double;
begin
  inherited;

  sArquivo := edDestino.Text;

  //Validação
  If CriaArquivo( sArquivo ) Then
  Begin
    //Preparando Ambiente
    bbtnConfirmar.Enabled := False;

    lbInicio.Caption := FormatDateTime('hh:nn:ss', Time);

    iContador := 0;
    iErros    := 0;
    fValor    := 0;

    //Abrindo o Arquivo
    AssignFile( aArq, edLeArquivo.Text );
    Reset( aArq );

    //Lendo as linhas do Arquivo
    While not Eof(aArq) do
    Begin
      If Copy(sLinha, 1, 1) = '2' Then
      Begin
        sCPF         := Copy(sLinha, 6, 11);
        bTemLinha6   := False;
        bTemDeposito := False;

        //Verifica se tem linha 6
        For iLinhas := 1 to 4 do
        Begin
          Inc(iContador);
          Readln( aArq,sLinha );
        End;
        
        If Copy(sLinha, 1, 1) = '6' Then   //Se tiver verifica se era para ter e se está correto o valores
        Begin
          While True do
          Begin
            If Copy(sLinha, 3, 9) = 'Proc.Jud.' Then
            Begin
              bTemLinha6 := True;

              // ClaudioR - 24893 - 26/03/2007 - Inicio
              If Not VerificaNumeroProcesso(sLinha) Then
              Begin
                GravaLinha( sArquivo, 'CPF: ' + sCPF + ' não possui número de processo judicial');
                Inc(iErros);
              End;
              // ClaudioR - 24893 - 26/03/2007 - Fim

              Break;
            End;

            If Copy(sLinha, 1, 1) = '0' Then Break;

            Inc(iContador);
            Readln( aArq,sLinha );
          End;
        End;

        //Verifica se a pessoa tem Qualquer tipo de Deposito
        bTemDeposito := PossuiLinhasComplementares(sCPF);

        If ((bTemLinha6) And (Not bTemDeposito)) Then
        Begin
          GravaLinha( sArquivo, 'CPF: ' + sCPF + ' possui dados complementares sem ter Deposito Judicial');
          Inc(iErros);
        End;

        If ((Not bTemLinha6) And (bTemDeposito)) Then
        Begin
          GravaLinha( sArquivo, 'CPF: ' + sCPF + ' não possui dados complementares, Mas tem Deposito Judicial');
          Inc(iErros);
        End;
      End;

      Inc(iContador);

      //Mostra estatistica
      lbLinhasLidas.Caption := IntToStr(iContador);
      lbErros.Caption       := IntToStr(iErros);

      Readln( aArq,sLinha );
      Application.ProcessMessages;
    End;

    lbFim.Caption := FormatDateTime('hh:nn:ss', Time);

    //Finalizando a operação
    edLeArquivo.Text := '';
    CloseFile( aArq );
  End;
end;

procedure TfrmValidaInforme.FormCreate(Sender : TObject);
begin
  inherited;

  ValidaInforme := TValidaInforme.Create;

  ValidaInforme.InitializeAs( Padroes );
end;



end.