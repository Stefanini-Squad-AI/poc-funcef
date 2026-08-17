unit FExecRecomposicaoLanc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarImob, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, ExtCtrls, ComCtrls, Db, DBTables, Wwquery;

type
  TfrmRecomposicaoLanc = class(TFrmOkCancelarImob)
    Panel2: TPanel;
    lblProgress: TLabel;
    lblContador: TLabel;
    ProgressBar: TProgressBar;
    Label13: TLabel;
    Label14: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    qryExcluiHistCartInv: TwwQuery;
    qryLancImovel: TwwQuery;
    Label5: TLabel;
    Label6: TLabel;

    procedure bbtnConfirmarClick(Sender: TObject);

  private { Private declarations }

  public { Public declarations }

  end;



var
  frmRecomposicaoLanc: TfrmRecomposicaoLanc;



implementation
{$R *.DFM}
uses
   dBaseDados, uDataBase, uMensErro, uFuncoesImob;



procedure TfrmRecomposicaoLanc.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;

   DesabilitaBotoes;

   StartTransacao;

   try

      try

         // exclui todos os registros de lançamentos da HistCartInv
         qryExcluiHistCartInv.ExecSQL;

         // exclui todos os registros de lançamentos da HistCartInv
         with qryLancImovel do begin
            LimpaParametros(qryLancImovel);

            Open;
         end;

         while not(qryLancImovel.EOF) do begin

            // AlimentaCarteira

            qryLancImovel.Next;
         end;

         CommitTransacao;

         MsgDlg('Processo concluído.', 'Informação', mtInformation, [mbOk], 0);

      except
         RollBackTransacao;
      end;

   finally
      HabilitaBotoes;
   end;
end;



end.
