unit FMudaStatusMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, DBCtrls,
  Db, Wwdatsrc, DBClient, uCMClientDataSet, uCtrlMovimFinanc, uCmSqlParams;

type
  TfrmMudaStatusMT = class(TfrmSairAjuda)
    gbData: TGroupBox;
    dbedDataConcilia: TCMDateTimePicker;
    bbtnConfirma: TBitBtn;
    rgStatus: TRadioGroup;
    procedure bbtnConfirmaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rgStatusClick(Sender: TObject);
  private
  public
     sStatus : String;
  end;

var
  frmMudaStatusMT: TfrmMudaStatusMT;

implementation

{$R *.DFM}

{ TfrmMudaStatusMT }

uses uMensErro;

procedure TfrmMudaStatusMT.FormCreate(Sender: TObject);
begin
   inherited;
   sStatus:='N';
end;

procedure TfrmMudaStatusMT.rgStatusClick(Sender: TObject);
begin
   case rgStatus.ItemIndex of
      0: sStatus:='N';
      1: sStatus:='X';
      2: sStatus:='C';
   end;
   dbedDataConcilia.Enabled:=(rgStatus.ItemIndex=1);
   if (dbedDataConcilia.Enabled) then
      dbedDataConcilia.Date:=Date
   else
      dbedDataConcilia.ClearDateTime;
end;

procedure TfrmMudaStatusMT.bbtnConfirmaClick(Sender: TObject);
begin
   if (rgStatus.ItemIndex=1) and (dbedDataConcilia.Text='') then
    begin
       MsgDlg('Obrigatório preencher a data que este lançamento bateu no Banco',
              'Erro',mtError,[mbOk],0);
       dbedDataConcilia.SetFocus;
       ModalResult:=mrNone;
       Abort;
    end;
   ModalResult:=mrOk;
end;

end.
