unit FMTIntegraContab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, ComCtrls,
  uCtrlIntegracaoContabil, uCtrlParamIntegra, Db, DBClient,
  uCMClientDataSet, uCmSqlParams;

type
  TFrmMTIntegraContab = class(TfrmSairAjuda)
    gbDatas: TGroupBox;
    deDataIni: TCMDateTimePicker;
    deDataFim: TCMDateTimePicker;
    ToolbarSep971: TToolbarSep97;
    bbtnIntegra: TBitBtn;
    plnStatus: TPanel;
    pgbar: TProgressBar;
    spParamContab: TCMSqlParams;
    CdsContab: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnIntegraClick(Sender: TObject);
  private
    { Private declarations }
    IntegracaoContabil : TCtrlIntegracaoContabil;
    Procedure Progresso(Args : Array of Variant );
  public
    { Public declarations }
  end;

var
  FrmMTIntegraContab: TFrmMTIntegraContab;

implementation

{$R *.DFM}

uses uSistema, DBaseDados, uModulo, uMensErro;

procedure TFrmMTIntegraContab.FormCreate(Sender: TObject);
begin
  inherited;
  IntegracaoContabil := TCtrlIntegracaoContabil.Create;
  IntegracaoContabil.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  IntegracaoContabil.Progresso := Progresso;
  deDataIni.date := Date-1;
  deDataFim.date := Date-1;

  spParamContab.SQL.Text := 'SELECT PACDOBRADA FROM PARAMCONTAB WHERE (IDPESSOA = '+IntToStr(Sistema.IdEmpresa )+')';
  spParamContab.Open;
  
end;

procedure TFrmMTIntegraContab.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  IntegracaoContabil.Free;
end;

procedure TFrmMTIntegraContab.bbtnIntegraClick(Sender: TObject);
begin
  inherited;
  plnStatus.Visible   := True;
  bbtnIntegra.Enabled := False;

  IntegracaoContabil.CreateThreadProgresso;

  If CdsContab.FieldByName('PACDOBRADA').AsString = 'S' Then
     Begin
        If Not IntegracaoContabil.IntegrarPartidaDobrada(Sistema.IdEmpresa,
                                                         deDataIni.Date,
                                                         deDataFim.Date,
                                                         Modulo.sContabTransf = 'S',
                                                         Sistema.UsaPlanoPatro,
                                                         Sistema.IdModulo,Sistema.IdUsuario,
                                                         Modulo.iIdPatro,Modulo.iIdPlanoPrev,
                                                         IntegracaoContabil.ProgressFileName)
        Then
           Begin
              IntegracaoContabil.FreeThreadProgresso;
              MsgDlg(IntegracaoContabil.MessageInfo,'Erro',mtError,[mbOk],0)
           End
        Else
           Begin
              IntegracaoContabil.FreeThreadProgresso;
              MsgDlg(IntegracaoContabil.MessageInfo,'Informação',mtInformation,[mbOk],0);
           End;
     End
  Else
     Begin
        If Not IntegracaoContabil.Integrar(Sistema.IdEmpresa,
                                           deDataIni.Date,
                                           deDataFim.Date,
                                           Modulo.sContabTransf = 'S',
                                           Sistema.UsaPlanoPatro,
                                           Sistema.IdModulo,Sistema.IdUsuario,
                                           Modulo.iIdPatro,Modulo.iIdPlanoPrev,
                                           IntegracaoContabil.ProgressFileName)
        Then
           Begin
              IntegracaoContabil.FreeThreadProgresso;
              MsgDlg(IntegracaoContabil.MessageInfo,'Erro',mtError,[mbOk],0)
           End
        Else
           Begin
              IntegracaoContabil.FreeThreadProgresso;
              MsgDlg(IntegracaoContabil.MessageInfo,'Informação',mtInformation,[mbOk],0);
           End;
     End;
  plnStatus.Visible   := False;
  bbtnIntegra.Enabled := True;
End;

procedure TFrmMTIntegraContab.Progresso(Args: array of Variant);
begin
   pgBar.Max         := Args[1];
   pgBar.Position    := Args[2];
   plnStatus.Caption := Args[3];

   Self.Repaint;
end;

end.
