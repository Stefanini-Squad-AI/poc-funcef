// --------------------------------------------------------------------------------
// Pendência   : SOL  KINTANA
// Responsável : BRUNO AZEVEDO
// Data        :
// Descrição   : Criação da Funcionalidade "Transferência de Saldo de Cota".
//--------------------------------------------------------------------------------
unit fSolicitaDataAlimentacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, DBTables;

type
  TfrmSolicitaDataAlimentacao = class(TfrmOkCancelar)
    Label1: TLabel;
    edtDataAlimentacao: TCMDateTimePicker;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    DataAlimentacao: TDateTime;
  end;

var
  frmSolicitaDataAlimentacao: TfrmSolicitaDataAlimentacao;

implementation

uses
    uFuncoesEmptmo, uMensErro;

{$R *.DFM}

procedure TfrmSolicitaDataAlimentacao.BitBtn1Click(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmSolicitaDataAlimentacao.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if (Trim(edtDataAlimentacao.Text) = '') then begin
    MsgDlg('Informar a data para o alimentação. ','Informação',mtError,[mbOK],0);
    Exit;
  end else begin
    DataAlimentacao := edtDataAlimentacao.Date;
    Close;
  end;       
end;

end.
