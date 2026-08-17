unit uCotaComum;

interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, USistema, Wwquery, OleCtrls, vcf1, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, TB97Tlbr, TB97, ExtCtrls,
  wwdblook, DBTables, mxtables, mxstore, mxDB, Wwdatsrc, uCMMath, ComCtrls;

type

   TCotaComum = Class(TObject)

   private

   public

   end;

   function MsgDlgCota(Msg: string; DlgType: TMsgDlgType; sCaption: string;
                       Buttons: TMsgDlgButtons; ButtonsCaptions: String): Word;

var
   CotaComum: TCotaComum;

implementation

uses
  uMensErro, uDataBase, uDiasUteis, dBaseDados, fAguarde, Math, UString;


//------------------------------------------------------------------------------
// Método para exibir janela de dialogo com botões com captions alteráveis
//   Caso de uso:
//   MensagemCota('Mensagem a ser exibida na janela',
//                mtConfirmation {Tipo de janela de dialogo},
//                'Mensagem do Sistema' {Caption da janela de diálogo},
//                [mbYes, mbNo] {Array dos botões exibidos na janela},
//                'Exclui;Continua' {Captions para os botões do array anterior})
//
//   Retorno da rotina: TModalResult (mrNone, mrOk, mrYes, mrNo etc...)
//------------------------------------------------------------------------------
function MsgDlgCota(Msg: string; DlgType: TMsgDlgType; sCaption: string;
                    Buttons: TMsgDlgButtons; ButtonsCaptions: String): Word;
const
  Sounds: array [TMsgDlgType] of integer = ( MB_ICONEXCLAMATION,
                                             MB_ICONHAND,
                                             MB_OK,
                                             MB_ICONQUESTION,
                                             MB_ICONASTERISK );
var
  ComponentNO: TComponent;
  BotaoNO: TButton;
  sButtonName : string;
  I, iTam: Integer;
  aButCaption: Array of String;
begin
  I := 1;
  iTam := 0;
  while I <> 0 do
  begin
     I := Pos(';', ButtonsCaptions);
     if I > 0 then
     begin
        SetLength(aButCaption,iTam+1);
        aButCaption[iTam] := Copy(ButtonsCaptions,1,I-1);
        Inc(iTam);
        Delete(ButtonsCaptions,1,I);
     end
     else
     begin
        SetLength(aButCaption,iTam+1);
        aButCaption[iTam] := ButtonsCaptions;
     end;
  end;

  with CreateMessageDialog( Msg, DlgType, Buttons ) do
  begin
    try
      if sCaption = '' then
      begin
         if DlgType = mtWarning           then Caption := Caption + ' Atenção'
         else if DlgType = mtError        then Caption := Caption + ' Erro'
         else if DlgType = mtInformation  then Caption := Caption + ' Informação'
         else if DlgType = mtConfirmation then Caption := Caption + ' Confirmação'
         else                                  Caption := ' ' + Application.Title;
      end
      else
         Caption := ' ' + sCaption;

      Position := poScreenCenter;

      iTam := 0;
      for I := 0 to ComponentCount -1 do
      begin
         if Components[I] is TButton then
         begin
            if Length(aButCaption) >= iTam + 1 then
               TButton(Components[I]).Caption := aButCaption[iTam];
            Inc(iTam);
         end;
      end;

      Result := ShowModal;

    finally
      Free;
    end;
  end;
end; {MessageBox}


end.
