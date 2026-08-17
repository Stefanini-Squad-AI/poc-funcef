// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//--------------------------------------------------------------------------------
//Pendência   : SOL 192828 KTN 1835460
//Responsável : FELIPE AZEVEDO DOS SANTOS
//Data        : 19/11/2012
//Descrição   : Desenvolvimento inicial da tela
//--------------------------------------------------------------------------------

unit FCadObservacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DBCtrls, DB;

type
  TfrmCadObservacao = class(TForm)
    grbObs: TGroupBox;
    pnlBtn: TPanel;
    bbtnConfirmar: TBitBtn;
    dbmmoObs: TDBMemo;
    bbtnCancelar: TBitBtn;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadObservacao: TfrmCadObservacao;

implementation

uses FCadRubricaIndividualInserir;

{$R *.DFM}

procedure TfrmCadObservacao.bbtnConfirmarClick(Sender: TObject);
begin
    Close;
end;



procedure TfrmCadObservacao.bbtnCancelarClick(Sender: TObject);
begin
   if (frmCadRubricaIndividualInserir.dsDet.State in [dsEdit]) then
   begin
      frmCadRubricaIndividualInserir.qryDet.DisableControls;
      frmCadRubricaIndividualInserir.qryDet.Cancel;
      frmCadRubricaIndividualInserir.qryDet.Edit;
      frmCadRubricaIndividualInserir.qryDet.EnableControls;
   end;
   if (frmCadRubricaIndividualInserir.dsDet.State in [dsInsert]) then
   begin
       frmCadRubricaIndividualInserir.qryDet.FieldByName('OBSERVACAO').AsString
       := '';
   end;
   Close;
end;

end.
