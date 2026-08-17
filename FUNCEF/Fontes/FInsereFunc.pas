unit FInsereFunc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Db, DBTables, UintegraPrevRH, MAHlpBtn, Buttons,
  TB97Tlbr, TB97;

type
  TfrmInsereFunc = class(TForm)
    Panel1: TPanel;
    qryFuncionarios: TQuery;
    dbprincipal: TDatabase;
    Label1: TLabel;
    edtNome: TEdit;
    lblcontador: TLabel;
    Dock971: TDock97;
    tb97Fundo: TToolbar97;
    sep1: TToolbarSep97;
    sep3: TToolbarSep97;
    bbtnGravar: TBitBtn;
    bbtnAjuda: TmaHelpBitBtn;
    TB97oKCancelar: TToolbar97;
    ToolbarSep971: TToolbarSep97;
    bbtnConfirmar: TBitBtn;
    bbtnDesfazer: TBitBtn;

    procedure FormCreate(Sender: TObject);
    procedure bbtnGravarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnDesfazerClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInsereFunc: TfrmInsereFunc;

implementation



{$R *.DFM}


procedure TfrmInsereFunc.FormCreate(Sender: TObject);
begin
   lblcontador.caption := '';
end;

procedure TfrmInsereFunc.bbtnGravarClick(Sender: TObject);
begin
     dbprincipal.commit;
end;



procedure TfrmInsereFunc.bbtnConfirmarClick(Sender: TObject);
var
    nreg : Integer;
    nAtual : Integer;
begin


     qryFuncionarios.open;

     nReg := qryFuncionarios.recordcount;
     nAtual := 0;
     If qryFuncionarios.recordcount > 0 then
     begin
         If not dbPrincipal.intransaction then
         begin
             dbprincipal.starttransaction;
             while not qryFuncionarios.eof do
             begin
                 nAtual := nAtual + 1;
                 edtNome.text := Inttostr(qryFuncionarios.fieldbyname('IDPESSOA').asInteger)+' - '+qryFuncionarios.fieldbyname('NOME').asstring;
                 lblcontador.caption := (Inttostr(nAtual)+' de '+inttostr(nreg));
                 frmInsereFunc.update;
                 try
                     AtualizaDadosPrevFuncionario(qryFuncionarios.fieldbyname('IDEMPRESA').asInteger,
                                                  qryFuncionarios.fieldbyname('IDPESSOA').asInteger);
                     qryFuncionarios.next;
                 except
                        raise
                 end;
             end;
             ShowMessage('Fim de Processamento !!');
         end;
     end else
        ShowMessage('Nada a Processar');

end;

procedure TfrmInsereFunc.bbtnDesfazerClick(Sender: TObject);
begin
     dbprincipal.rollback;
end;



end.