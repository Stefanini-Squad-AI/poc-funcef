unit FTelaAut;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, FPai, UAutorizacao, IvDictio, IvMulti, IvEMulti,
  ExtCtrls;

const
     CM_FLUXOSEGUINTE = WM_USER + 400;

type
  TfrmTelaAutorizacao = class(TfrmPai)
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  protected
    { Protected declarations }
    LockFormX : Boolean;
    THeigh,TWidth : Integer;
    procedure CMFluxoSeguinte(var Message: TMessage); message CM_FLUXOSEGUINTE;
  public
    { Public declarations }
    procedure AutorizarForm(TipoAutoriza : TTipoAutorizacao);
  end;

var
   frmTelaAutorizacao: TfrmTelaAutorizacao;
   MHeight,MWidth : Integer;

procedure AbrirForm(var frm; tfrm : TFormClass; bMultiInst: Boolean);
function AbrirFormModal(var frm; tfrm : TFormClass):integer;

implementation

uses UMensErro, cmFluxOper ;

{$R *.DFM}

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

{
----------------------------------------------------------------
}
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

{
----------------------------------------------------------------
}
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

procedure TfrmTelaAutorizacao.FormShow(Sender: TObject);
begin
     AutorizarForm(afNormal);
end;

procedure TfrmTelaAutorizacao.AutorizarForm(TipoAutoriza : TTipoAutorizacao);
begin
     Autorizacao.AutorizarForm(Self, TipoAutoriza);
end;

procedure TfrmTelaAutorizacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
var x : TMessage;
begin
  inherited;
  Action := caFree;
  x.Msg := CM_FLUXOSEGUINTE;
  Dispatch(x);
end;

procedure TfrmTelaAutorizacao.CMFluxoSeguinte(var Message: TMessage);
begin
     if FluxOper.Ativo then
        FluxOper.Seguinte;
end;

end.
