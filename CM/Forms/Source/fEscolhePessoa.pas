unit fEscolhePessoa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, ComCtrls, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid,
  MAHlpBtn, Buttons, TB97, FSairAjuda, Db, Wwdatsrc, DBTables,
  wwQuery, fPessoa, TB97Tlbr, IvDictio, IvMulti, IvEMulti;

type
  TfrmEscolhePessoa = class(TfrmOkCancelar)
    Panel1: TPanel;
    dbgEscolhe: TwwDBGrid;
    Bevel1: TBevel;
    RichEdit1: TRichEdit;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    sNomeCodigo : string;
  end;

var
  frmEscolhePessoa: TfrmEscolhePessoa;

implementation
{$R *.DFM}

procedure TfrmEscolhePessoa.FormActivate(Sender: TObject);
var
  i, Posicao : integer;
  Linha : string;
begin
  inherited;
  for i := 0 to (RichEdit1.Lines.Count-1) do
  begin
       Linha := RichEdit1.Lines[i];
       repeat
             Posicao := Pos('<NOME_CODIGO>', Linha);
             if Posicao > 0 then
             begin
                  Delete(Linha,Posicao,Length('<NOME_CODIGO>'));
                  Insert(sNomeCodigo,Linha,Posicao);
                  RichEdit1.Lines[i] :=  Linha;
             end;
       until Posicao = 0;
  end;
end;

procedure TfrmEscolhePessoa.FormClose(Sender: TObject;
var
   Action: TCloseAction);
begin
   inherited;
   Action := caFree;
end;

end.
