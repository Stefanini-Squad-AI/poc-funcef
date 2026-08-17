unit FMTExtornaIntContab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, ExtCtrls, StdCtrls, wwdbdatetimepicker, CMDateTimePicker,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ComCtrls,
  uCtrlIntegracaoContabil;

type
  TFrmMTExtornaIntContab = class(TfrmSairAjuda)
    Label2: TLabel;
    edData: TCMDateTimePicker;
    Image1: TImage;
    plnStatus: TPanel;
    pgbar: TProgressBar;
    BitBtn1: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    IntegracaoContabil : TCtrlIntegracaoContabil;
    
    Procedure Progresso(Args : Array of Variant );
  public
    { Public declarations }
  end;

var
  FrmMTExtornaIntContab: TFrmMTExtornaIntContab;

implementation

{$R *.DFM}

uses uSistema, DBaseDados, uModulo, uMensErro;

procedure TFrmMTExtornaIntContab.FormCreate(Sender: TObject);
begin
  inherited;
  IntegracaoContabil := TCtrlIntegracaoContabil.Create;
  IntegracaoContabil.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  IntegracaoContabil.Progresso := Progresso;
  edData.date := Date-1;
end;

procedure TFrmMTExtornaIntContab.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  IntegracaoContabil.Free;
end;

procedure TFrmMTExtornaIntContab.BitBtn1Click(Sender: TObject);
begin
  inherited;
  plnStatus.Visible := True;

  IntegracaoContabil.CreateThreadProgresso;

  If Not IntegracaoContabil.ExcluirItegrarcao( Sistema.IdEmpresa,
                                               eDData.Date,
                                               Sistema.UsaPlanoPatro,
                                               Sistema.IdModulo,
                                               Sistema.IdUsuario,
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
  plnStatus.Visible := False;
end;

procedure TFrmMTExtornaIntContab.Progresso(Args: array of Variant);
begin
   pgBar.Max         := Args[1];
   pgBar.Position    := Args[2];
   plnStatus.Caption := Args[3];

   Self.Repaint;
end;

end.
