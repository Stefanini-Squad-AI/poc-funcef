// --------------------------------------------------------------------------------
// Pendência   : SOL 107221/5802 KINTANA 1365701
// Responsável : BRUNO AZEVEDO
// Data        : 07/12/2011
// Descrição   : Criação da Funcionalidade "Recebimento de Contribuições via Empréstimo".
//--------------------------------------------------------------------------------
unit fSolicitaDataPGAObrig;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, DBTables;

type
  TfrmSolicitaDataPGAObrig = class(TfrmOkCancelar)
    Label1: TLabel;
    dtDataPGA: TCMDateTimePicker;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    DataPGA : TDateTime;
  end;

var
  frmSolicitaDataPGAObrig: TfrmSolicitaDataPGAObrig;

implementation
uses uFuncoesEmptmo, uMensErro;

{$R *.DFM}

procedure TfrmSolicitaDataPGAObrig.BitBtn1Click(Sender: TObject);
begin
  //inherited;



  
end;

procedure TfrmSolicitaDataPGAObrig.FormShow(Sender: TObject);
begin
  inherited;

  frmSolicitaDataPGAObrig.Width := 221;

end;

procedure TfrmSolicitaDataPGAObrig.BitBtn2Click(Sender: TObject);
begin
  inherited;

    if (Trim(dtDataPGA.Text) = '') then begin
      MsgDlg('Informar a data para o PGA. ','Informação',mtError,[mbOK],0);
      exit;
    end else begin
      DataPGA := dtDataPGA.Date;
      Close;
    end;
  
end;

end.
