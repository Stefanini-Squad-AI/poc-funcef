unit FPai;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   IvDictio, IvMulti, IvEMulti, ExtCtrls, Gauges, StdCtrls, Buttons,
   ComCtrls, fcLabel;

type
   // Form origem de todos os forms CM
   TfrmPai = class(TForm)
      ivTradutor: TIvExtendedTranslator;

      // Aplica o Icone do Projeto ao form
      procedure Protecao;
      procedure FormCreate(Sender: TObject);
      procedure TmrSegurancaTimer(Sender: TObject);
      procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
      procedure FormKeyPress(Sender: TObject; var Key: Char);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);


   private  // Private declarations

      FMDIVisible    : Boolean;


   protected

      procedure SetMDIVisible(Value: Boolean);


   public   // Public declarations

      // Controla a apresentação do form
      property MDIVisible: Boolean read FMDIVisible write SetMDIVisible;


   end;



var
   frmPai         : TfrmPai;
   TmrSeguranca   : TTimer;
   bAtivo         : Boolean;



implementation
{$R *.DFM}
uses
   uSistema, uDatabase, dbasedados, uFormManager, fTravado, fOkCancelar,
   fSairAjuda, uAutorizacao, FCMPrincipal;



procedure TfrmPai.Protecao;
begin
   if not bativo then
   begin
      TmrSeguranca.Enabled := False;

      if ( Sistema.TempoProtecao <> -1 ) and ( TmrSeguranca.Interval <> ( Sistema.TempoProtecao * 1000 ) ) then
         TmrSeguranca.Interval := Sistema.TempoProtecao * 1000;

      if TmrSeguranca.Interval > 0 then
         TmrSeguranca.Enabled := True;
   end;
end;



procedure TfrmPai.SetMDIVisible(Value: Boolean);
begin
  if FormStyle = fsMDIChild then
  begin
     if Value then
     begin
        if FMDIVisible then
           Show
        else
           SetWindowPos( Handle, HWND_NOTOPMOST, 0, 0, 0, 0,
                         SWP_NOMOVE or SWP_NOSIZE or SWP_SHOWWINDOW);
     end
     else
     begin
        WindowState := wsMinimized;
        ShowWindow( Handle, SW_HIDE );
     end;
  end
  else
     Visible := Value;

  FMDIVisible := Value;
end;



procedure TfrmPai.FormCreate(Sender: TObject);
begin
   Icon := Application.Icon;

   // Se não existe o timer, crie-o
   if TmrSeguranca = nil then
   begin
      TmrSeguranca          := TTimer.Create( Self );
      TmrSeguranca.Enabled  := False;
      TmrSeguranca.Interval := 0;
      TmrSeguranca.OnTimer  := TmrSegurancaTimer;
      bAtivo                := False;
   end
   else
   begin
      Protecao();
   end;
end;



procedure TfrmPai.TmrSegurancaTimer(Sender: TObject);
var
  bfecha       : Boolean;
  i, j         : Integer;
  lista, lista2: TStringList;
begin
  TmrSeguranca.Enabled := False;

  // Se o login no sistema foi feito
  if Sistema.IdUsuario <> -1 then
  begin
     bativo := True;
     bfecha := True;

     // Verifica se tem alguma janela que não pode ser fechada
     for i := 0 To Screen.FormCount - 1 Do
         if Screen.Forms[ i ] Is TFrmPai then
            if Screen.Forms[ i ].Tag = 9999 then begin
               bfecha := False;
               Break;
            end;

{     // Antes se não pudesse fechar pedia a senha agora (19/10/2001) não faz nada
     if not bfecha then
        AbrirFormModal( FrmTravado, TFrmTravado )
     else begin }

     // Se tiver janela que não pode ser fechada, não faz nada
     if bfecha then begin
        lista  := TStringList.Create;
        lista2 := TStringList.Create;

        // Guarda a lista das janelas a serem fechadas na ordem correta
        for i := 0 To Screen.FormCount - 1 Do begin
            if ( Screen.Forms[ i ] Is TFrmPai ) And ( Screen.Forms[ i ].Visible ) And
                   ( Screen.Forms[ i ] <> Application.MainForm ) then begin
               j := Lista.IndexOf( Screen.Forms[ i ].Owner.Name );

               if j = -1 then begin
                  Lista.Add( Screen.Forms[ i ].Name );
                  Lista2.Add( IntToStr( i ) );
               end else begin
                  Lista.Insert( j, Screen.Forms[ i ].Name );
                  Lista2.Insert( j, IntToStr( i ) );
               end;
            end;
        end;

        // Fecha as janelas na ordem correta de acordo com o seu tipo
        for i := 0 To Lista2.Count - 1 Do begin
            if Screen.Forms[ StrToInt( Lista2[ i ] ) ] Is TFrmOkCancelar then
               TFrmOkCancelar( Screen.Forms[ StrToInt( Lista2[ i ] ) ] ).bbtnCancelar.Click
            else
            if Screen.Forms[ StrToInt( Lista2[ i ] ) ] Is TFrmSairAjuda then
               TFrmSairAjuda( Screen.Forms[ StrToInt( Lista2[ i ] ) ] ).bbtnsair.click
            else
               TFrmPai( Screen.Forms[ StrToInt( Lista2[ i ] ) ] ).Close;
        end;

        lista.Free;
        lista2.Free;

        // Chama a tela de login
        PostMessage( Application.MainForm.Handle, WM_LOGAR, 0, 0 );
     end;

     bativo := False;
  end;

  TmrSeguranca.Enabled := True;
end;



procedure TfrmPai.FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
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
