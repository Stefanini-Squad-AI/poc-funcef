unit FPai;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IvDictio, IvMulti, IvEMulti, ExtCtrls;

type
    {** Form origem de todos os forms CM }
    TfrmPai = class(TForm)
    ivTradutor: TIvExtendedTranslator;
       {** Aplica o Icone do Projeto ao form  }
    procedure Protecao;
    procedure FormCreate(Sender: TObject);
    procedure TmrSegurancaTimer(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
    FMDIVisible: Boolean;
  protected
    procedure SetMDIVisible(Value: Boolean);
  public
    { Public declarations }
    {** Controla a apresentação do form }
    property MDIVisible: Boolean read FMDIVisible write SetMDIVisible;
  end;

var
  frmPai: TfrmPai;
  TmrSeguranca: TTimer;
  bativo: Boolean;

implementation

uses uSistema, uDatabase, dbasedados, uFormManager, fTravado, fOkCancelar,
     fSairAjuda, uAutorizacao, FCMPrincipalForms;

{$R *.DFM}

procedure TfrmPai.Protecao;
begin
  If Not bativo Then Begin
     TmrSeguranca.Enabled := False;

     If ( Sistema.TempoProtecao <> -1 ) And ( TmrSeguranca.Interval <> ( Sistema.TempoProtecao * 1000 ) ) Then
        TmrSeguranca.Interval := Sistema.TempoProtecao * 1000;

     If TmrSeguranca.Interval > 0 Then
        TmrSeguranca.Enabled := True;
  End;
end;

procedure TfrmPai.SetMDIVisible(Value: Boolean);
begin
  if FormStyle = fsMDIChild then begin
     if Value then begin
        if FMDIVisible then
           Show
        else
           SetWindowPos( Handle, HWND_NOTOPMOST, 0, 0, 0, 0,
                         SWP_NOMOVE or SWP_NOSIZE or SWP_SHOWWINDOW);
     end else begin
        WindowState := wsMinimized;
        ShowWindow( Handle, SW_HIDE );
     end;
  end else
     Visible := Value;

  FMDIVisible := Value;
end;

procedure TfrmPai.FormCreate(Sender: TObject);
begin
  Icon := Application.Icon;

  // Se não existe o timer, crie-o
  If TmrSeguranca = Nil Then Begin
     TmrSeguranca := TTimer.Create( Self );
     TmrSeguranca.Enabled  := False;
     TmrSeguranca.Interval := 0;
     TmrSeguranca.OnTimer  := TmrSegurancaTimer;
     bativo := False;
  End Else
     Protecao();
end;

procedure TfrmPai.TmrSegurancaTimer(Sender: TObject);
var
  bfecha: Boolean;
  i, j: Integer;
  lista, lista2: TStringList;
begin
  TmrSeguranca.Enabled := False;

  // Se o login no sistema foi feito
  If Sistema.IdUsuario <> -1 Then Begin
     bativo := True;
     bfecha := True;

     // Verifica se tem alguma janela que não pode ser fechada
     For i := 0 To Screen.FormCount - 1 Do
         If Screen.Forms[ i ] Is TFrmPai Then
            If Screen.Forms[ i ].Tag = 9999 Then Begin
               bfecha := False;
               Break;
            End;

{     // Antes se não pudesse fechar pedia a senha agora (19/10/2001) não faz nada
     If Not bfecha Then
        AbrirFormModal( FrmTravado, TFrmTravado )
     Else Begin }

     // Se tiver janela que não pode ser fechada, não faz nada
     If bfecha Then Begin
        lista  := TStringList.Create;
        lista2 := TStringList.Create;

        // Guarda a lista das janelas a serem fechadas na ordem correta
        For i := 0 To Screen.FormCount - 1 Do Begin
            If ( Screen.Forms[ i ] Is TFrmPai ) And ( Screen.Forms[ i ].Visible ) And
                   ( Screen.Forms[ i ] <> Application.MainForm ) Then Begin
               j := Lista.IndexOf( Screen.Forms[ i ].Owner.Name );

               If j = -1 Then Begin
                  Lista.Add( Screen.Forms[ i ].Name );
                  Lista2.Add( IntToStr( i ) );
               End Else Begin
                  Lista.Insert( j, Screen.Forms[ i ].Name );
                  Lista2.Insert( j, IntToStr( i ) );
               End;
            End;
        End;

        // Fecha as janelas na ordem correta de acordo com o seu tipo
        For i := 0 To Lista2.Count - 1 Do Begin
            If Screen.Forms[ StrToInt( Lista2[ i ] ) ] Is TFrmOkCancelar Then
               TFrmOkCancelar( Screen.Forms[ StrToInt( Lista2[ i ] ) ] ).bbtnCancelar.Click
            Else
            If Screen.Forms[ StrToInt( Lista2[ i ] ) ] Is TFrmSairAjuda Then
               TFrmSairAjuda( Screen.Forms[ StrToInt( Lista2[ i ] ) ] ).bbtnsair.click
            Else
               TFrmPai( Screen.Forms[ StrToInt( Lista2[ i ] ) ] ).Close;
        End;

        lista.Free;
        lista2.Free;

        // Chama a tela de login
        PostMessage( Application.MainForm.Handle, WM_LOGAR, 0, 0 );
     End;

     bativo := False;
  End;

  TmrSeguranca.Enabled := True;
end;

procedure TfrmPai.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  Protecao();
end;

procedure TfrmPai.FormKeyPress(Sender: TObject; var Key: Char);
begin
  Protecao();
end;

procedure TfrmPai.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Protecao();
end;

end.
