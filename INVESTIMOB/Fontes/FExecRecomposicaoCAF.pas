unit FExecRecomposicaoCAF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarImob, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, ExtCtrls, ComCtrls, Db, DBTables, Wwquery;

type
  TfrmRecomposicaoCAF = class(TFrmOkCancelarImob)
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
    procedure bbtnConfirmarClick(Sender: TObject);

  private { Private declarations }

  public { Public declarations }

  end;



var
  frmRecomposicaoCAF: TfrmRecomposicaoCAF;



implementation
{$R *.DFM}
uses
   dBaseDados, uDataBase, uMensErro, uFuncoesImob;



procedure TfrmRecomposicaoCAF.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;

   DesabilitaBotoes;

   StartTransacao;

   try

      try
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
