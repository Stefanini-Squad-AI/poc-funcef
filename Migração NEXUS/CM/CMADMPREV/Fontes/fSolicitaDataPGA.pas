unit fSolicitaDataPGA;

{-------------------------------------------------------------------------------
Pendência   : SOL 176483 Kintana 1614052
Responsável : Wylliam Leite da Silva
Data        : 30/03/2012
Descrição   : Foi alterado a verificação para considerar a data Pai.
-------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, DBTables;

type
  TfrmSolicitaDataPGA = class(TfrmOkCancelar)
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
    sDataPai : TDate; //Wylliam Leite da Silva SOL: 176483 Kintana: 	1614052
  end;

var
  frmSolicitaDataPGA: TfrmSolicitaDataPGA;
implementation
uses uFuncoesEmptmo, uMensErro;

{$R *.DFM}

procedure TfrmSolicitaDataPGA.BitBtn1Click(Sender: TObject);
begin
  //inherited;



  
end;

procedure TfrmSolicitaDataPGA.FormShow(Sender: TObject);
begin
  inherited;

  frmSolicitaDataPGA.Width := 344;

end;

procedure TfrmSolicitaDataPGA.BitBtn2Click(Sender: TObject);
begin
  inherited;
    //Wylliam Leite da Silva SOL 176483 KINTANA 1614052 - Inicio
    if dtDataPGA.Date < sDataPai then begin
    MsgDlg('A data informada não pode ser menor que a data de vencimento do documento Pai','Informação',mtError,[mbOK],0);
    exit;
  end else begin
    DataPGA := dtDataPGA.Date;
    Close;
  end;
  //Wylliam Leite da Silva SOL 176483 KINTANA 1614052 - Fim



end;

end.
