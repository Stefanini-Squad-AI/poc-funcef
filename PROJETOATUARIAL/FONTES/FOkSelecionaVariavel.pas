unit FOkSelecionaVariavel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery;

type
  TfrmOkSelecionaVariavel = class(TfrmOkCancelar)
    LstBxVariavel: TListBox;
    qryVariaveisTabua: TwwQuery;
    qryVariaveisTabuaNO_VARIAVEL_RESULT: TStringField;
    procedure LstBxVariavelDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure setListaVariaveis(iSQ_VERSAO: Integer);
  end;

var
  frmOkSelecionaVariavel: TfrmOkSelecionaVariavel;

implementation

{$R *.DFM}

procedure TfrmOkSelecionaVariavel.setListaVariaveis(iSQ_VERSAO: Integer);
begin
  Try
    // Foi trocado o select que listavam todas as variaveis do sistema de cálculo
    // para um select que retorna somente as variaveis utilizadas pela tábua utilizada
    LstBxVariavel.Items.Clear;
    qryVariaveisTabua.Close;
    qryVariaveisTabua.ParamByName('CD_GRUPO_FORMULA').asInteger := iSQ_VERSAO;
    qryVariaveisTabua.Open;

    while not qryVariaveisTabua.Eof do
     begin
       LstBxVariavel.Items.Add(qryVariaveisTabuaNO_VARIAVEL_RESULT.asString);

       qryVariaveisTabua.Next;
     end;

    LstBxVariavel.ItemIndex := 0;
  Finally
    qryVariaveisTabua.Close;
  End;
end;

procedure TfrmOkSelecionaVariavel.LstBxVariavelDblClick(Sender: TObject);
begin
  bbtnConfirmar.Click;
end;

end.
