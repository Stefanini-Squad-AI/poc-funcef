unit FExecRecalcCarteira;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, FOkCancelarImob;

type
  TfrmExecRecalculoCarteira = class(TFrmOkCancelarImob)
    qryMarcaTodos: TwwQuery;
    Label13: TLabel;
    Label14: TLabel;
    Label1: TLabel;
    Label2: TLabel;

    procedure bbtnConfirmarClick(Sender: TObject);



  private { Private declarations }

  public { Public declarations }

  end;



var
  frmExecRecalculoCarteira: TfrmExecRecalculoCarteira;



implementation
{$R *.DFM}
uses
   uModulo, uMensErro, uSistema, uDataBase, uFuncaoGeral, uDiasInUteis,
   uComunsImobiliario, uVerificaPreenchimento, uDocumento, uOperComum, uIntegraBack, uLancContab;



procedure TfrmExecRecalculoCarteira.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   // marca todos os lançamentos para recálculo
   qryMarcaTodos.ExecSQL;

   // recalcula os saldos
   OperComum.AtualizaSaldos(Modulo.fVlrPrimeiraCota, -1);
end;



end.
