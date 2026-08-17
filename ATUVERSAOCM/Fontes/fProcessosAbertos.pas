unit fProcessosAbertos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TfrmProcessosAbertos = class(TForm)
    mmProcAbertos: TMemo;
    Panel1: TPanel;
    Label1: TLabel;
    btnContinuar: TButton;
    btnCancelar: TButton;
    tmVerificaProcessos: TTimer;
    procedure btnContinuarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tmVerificaProcessosTimer(Sender: TObject);
  private

    procedure InsereProcessoLista(sNomeProcesso : string);
    procedure RemoveProcessoLista(sNomeProcesso : string);

  public
    fCancelar : boolean;
    lstExeAtualizacao, lstBplAtualizacao : TStringList;
  end;

var
  frmProcessosAbertos: TfrmProcessosAbertos;

implementation
uses fPrincipal;

{$R *.DFM}

procedure TfrmProcessosAbertos.btnContinuarClick(Sender: TObject);
begin
  fCancelar := false;
  Close;
end;

procedure TfrmProcessosAbertos.btnCancelarClick(Sender: TObject);
begin
  fCancelar := true;
  Close;
end;

procedure TfrmProcessosAbertos.FormCreate(Sender: TObject);
begin
  lstExeAtualizacao := TStringList.Create;
  lstBplAtualizacao := TStringList.Create;
end;

procedure TfrmProcessosAbertos.tmVerificaProcessosTimer(Sender: TObject);
var
  i : integer;
begin
   //Verifica executáveis
   for i := 0 to lstExeAtualizacao.Count -1 do
     if lstExeAtualizacao.Strings[i] <> ExtractFileName(ParamStr(0)) then
        if frmPrincipal.ProcessExists(lstExeAtualizacao.Strings[i]) then
           InsereProcessoLista(lstExeAtualizacao.Strings[i])
        else
           RemoveProcessoLista(lstExeAtualizacao.Strings[i]);

   //Verifica BPLs
   for i := 0 to lstBplAtualizacao.Count -1 do
        if frmPrincipal.ProcessExists(lstBplAtualizacao.Strings[i]) then
           InsereProcessoLista(lstBplAtualizacao.Strings[i])
        else
           RemoveProcessoLista(lstBplAtualizacao.Strings[i]);

   if mmProcAbertos.Lines.Count = 0 then
   begin
     fCancelar := false;
     close;
   end;

end;

procedure TfrmProcessosAbertos.InsereProcessoLista(sNomeProcesso : string);
begin
  if mmProcAbertos.Lines.IndexOf(sNomeProcesso) = -1 then
     mmProcAbertos.Lines.Add(sNomeProcesso);
end;

procedure TfrmProcessosAbertos.RemoveProcessoLista(sNomeProcesso : string);
begin
  if mmProcAbertos.Lines.IndexOf(sNomeProcesso) > -1 then
     mmProcAbertos.Lines.Delete(mmProcAbertos.Lines.IndexOf(sNomeProcesso));
end;

end.
