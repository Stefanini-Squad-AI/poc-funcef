unit fEditMsgLanc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarImob, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, ExtCtrls, Mask, DBCtrls, DB;

type
  TfrmEditMsgLanc = class(TFrmOkCancelarImob)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edtLn1: TEdit;
    edtLn2: TEdit;
    edtLn3: TEdit;
    edtLn4: TEdit;
    edtLn5: TEdit;
    edtLn6: TEdit;
    edtLn7: TEdit;
    edtLn8: TEdit;
    edtLn9: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    procedure ObterMensagem;
  public
    { Public declarations }
    iDocumento: Int64;
  end;

var
  frmEditMsgLanc: TfrmEditMsgLanc;

implementation

uses UFuncoesImob, DLancImovel;

{$R *.DFM}

procedure TfrmEditMsgLanc.FormActivate(Sender: TObject);
begin
   inherited;
   ObterMensagem;
end;


procedure TfrmEditMsgLanc.ObterMensagem;
var
   vMsgLanc: array[1..9] of string;
   i: integer;
   sMsg: string;
begin
   FuncoesImob.SelectMsgLanc(iDocumento);

   for i := 1 to 9 do begin
      sMsg := TStringField(dtmLancImovel.FindComponent('qrySelectMsgLancTEXTO_LINHA_'+inttostr(i))).AsString;
      TEdit(FindComponent('edtLn'+inttostr(i))).Text := sMsg;
   end;

   dtmLancImovel.qrySelectMsgLanc.Close;
end;

procedure TfrmEditMsgLanc.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   ObterMensagem;
end;

procedure TfrmEditMsgLanc.bbtnConfirmarClick(Sender: TObject);
var
   vMsgLanc: array[0..8] of string;  // a função UpdMsgLanc exige que o vetor comece com 0
   i: integer;
begin
   inherited;
   for i := 0 to 8 do begin
      vMsgLanc[i] := TEdit(FindComponent('edtLn'+inttostr(i+1))).Text;
   end;

   FuncoesImob.UpdateMsgLanc(iDocumento,vMsgLanc);
end;

end.
