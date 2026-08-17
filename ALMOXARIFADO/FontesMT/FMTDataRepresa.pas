unit FMTDataRepresa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker,
  uCtrlDataRepresa, ComCtrls, uCMTypes;

type
  TFrmMTDataRepresa = class(TfrmSairAjuda)
    GrpData: TGroupBox;
    edData: TCMDateTimePicker;
    lbHoraIni: TLabel;
    LbHoraFim: TLabel;
    BtnAtualiza: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    GrpAnda: TGroupBox;
    lblDescProd: TLabel;
    BarProd: TProgressBar;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BtnAtualizaClick(Sender: TObject);
  private
    DataRepresa : TCtrlDataRepresa;
    dData       : TDateTime;
    Procedure Progresso(Args : Array of Variant );
  public
    { Public declarations }

  end;

var
  FrmMTDataRepresa: TFrmMTDataRepresa;

implementation

{$R *.DFM}
Uses uCtrlPadroes, uSistema, uMensErro, DBaseDados;

procedure TFrmMTDataRepresa.FormCreate(Sender: TObject);
begin
  inherited;
  DataRepresa := TCtrlDataRepresa.Create;

  DataRepresa.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
  DataRepresa.Progresso := Progresso;

  dData               := DataRepresa.GetDataRepresa(Sistema.IdEmpresa);
  edData.Date         := dData;
  BtnAtualiza.Enabled := True;
end;

procedure TFrmMTDataRepresa.BtnAtualizaClick(Sender: TObject);
begin
 inherited;
 If MsgDlg('Confirma Atualização de Data Represa','Confirmação',mtConfirmation,[mbOK,mbCancel],0) = mrOk Then
    Begin
      If edData.Date < dData Then
         Begin
             MsgDlg('Não se pode retroceder a data de represamento','Erro',mtError,[mbOK],0);
             edData.SetFocus;
         End
      Else
      If edData.Date = dData Then
         Begin
             MsgDlg('A Data não foi alterada, para que haja uma atualização','Atenção',mtWarning,[mbOK],0);
             edData.SetFocus;
         End
      Else
         Begin
             BtnAtualiza.Enabled := False;
             LbHoraIni.Caption   := TimeToStr( Time );
             Application.ProcessMessages;
             DataRepresa.CreateThreadProgresso;

             If DataRepresa.AtualizaDataRepresa(Sistema.IdEmpresa,dData, edData.Date, DataRepresa.ProgressFileName )
             Then
                Begin
                   DataRepresa.FreeThreadProgresso;
                   MsgDlg('Atualização concluida','Informação',mtInformation,[MbOk],0)
                End
             Else
                Begin
                   DataRepresa.FreeThreadProgresso;
                   msgDlg('Atualização não realizada'+#13+DataRepresa.MessageInfo,'Erro',mtError,[MbOk],0);
                End;

            LbHoraFim.Caption := TimeToStr( Time );
         End;
    End;
end;


procedure TFrmMTDataRepresa.Progresso(Args: array of Variant);
begin
   BarProd.Max          := Args[2];
   BarProd.Position     := Args[1];
   lblDescProd.Caption  := Args[3];
   GrpAnda.Caption      := Args[4];
   
   Self.Repaint;
end;

end.
