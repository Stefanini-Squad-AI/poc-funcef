unit uFormManager;

interface

Uses Sysutils, Classes, Forms, FPai, FTelaAut, controls;

  function AcharInstanciaForm(tfrm: TFormClass): TForm;
  function CriarForm(tfrm: TFormClass; bMultiInst: Boolean): TForm;
  function ExisteForm(frm: TForm): Boolean;
  procedure AbrirForm(var frm; tfrm : TFormClass; bMultiInst: Boolean);
  function AbrirFormModal(var frm; tfrm : TFormClass):integer;
  Function ChamaForm(C:TFormClass; F:TForm):Boolean;
  
implementation


function AcharInstanciaForm(tfrm: TFormClass): TForm;
var
   i: Integer;
begin
   Result := nil;
   for i := 0 to Screen.FormCount - 1 do
      if Screen.Forms[i].ClassName = tfrm.ClassName then begin
         Result := Screen.Forms[i];
         Break;
      end;
end;

function CriarForm(tfrm: TFormClass; bMultiInst: Boolean): TForm;
begin
     Result := AcharInstanciaForm(tfrm);
     if (Result = nil) or bMultiInst
     then Result := tfrm.Create(Application);
end;

function ExisteForm(frm: TForm): Boolean;
var
   i: Integer;
begin
   Result := False;
   for i := 0 to Screen.FormCount - 1 do
      if Screen.Forms[i] = frm then begin
         Result := True;
         Break;
      end;
end;

procedure AbrirForm(var frm; tfrm: TFormClass; bMultiInst: Boolean);
begin
   if bMultiInst then
      TForm(frm) := CriarForm(tfrm, True)
   else
      if ExisteForm(TForm(frm))
      then begin
         if not(TForm(frm) is TfrmPai) then
            raise Exception.Create('Erro');

         { se já existe então mostra a janela }
         with TfrmPai(frm) do begin
            MDIVisible  := True;
            Show;
         end;
      end
      else TForm(frm) := CriarForm(tfrm, bMultiInst);
      if tform(frm).WindowState = wsNormal then
         TForm(frm).Top  := (MHeight - TForm(frm).Height) DIV 2;
end;

Function AbrirFormModal(var frm; tfrm : TFormClass): integer;
begin
     if ExisteForm(TForm(frm)) then
        TForm(frm).Visible := false //se já existe então mostra a janela
     else
     begin
          Application.CreateForm(tfrm, frm);
          if TForm(frm).FormStyle <> fsNormal then
          begin
               TForm(frm).FormStyle := fsNormal;
               TForm(frm).Visible := false;
          end;
     end;
     Result := TForm(frm).ShowModal;
     TForm(frm).Release;
end;

Function ChamaForm(C:TFormClass; F:TForm):Boolean;
Begin
   Try
      Application.CreateForm(C,F);
      F.ShowModal;
      Result := (F.ModalResult = MrOk)
   finally
      F.Free;
   End;
end;


end.
