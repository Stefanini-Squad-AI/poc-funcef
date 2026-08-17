unit FDataMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97,
  ExtCtrls, StdCtrls, wwdbdatetimepicker, CMDateTimePicker,uCtrlProcessaContab;


type
  TfrmDataMT = class(TfrmOkCancelar)
    dteData: TCMDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    CtrlProcessaContab :TCtrlProcessaContab;
  public
    { Public declarations }
    dCodPlanilha,dModulo,dUsuario :Double;
  end;

var
  frmDataMT: TfrmDataMT;

implementation

uses UMensErro, uDatabase, DBaseDados, uSistema, uFuncaoGeral,
     uModulo, uData;

{$R *.DFM}



procedure TfrmDataMT.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   if dteData.Text = '' Then
   begin
     MsgDlg('A data do Estorno é Obrigatória.','Aviso',mtWarning,[mbOk],0);
     dteData.SetFocus;
     Exit;
   end;

   //*** chamar funcao de estorno ***
   if CtrlProcessaContab.FazEstorno(dUsuario,dCodPlanilha,dModulo,
                             Sistema.idEmpresa,Sistema.UsaPlanoPatro,dteData.Text) then
   begin
      MsgDlg(CtrlProcessaContab.MessageInfo,'Aviso',mtWarning,[mbOk], 0);
   end else
   begin
     MsgDlg(CtrlProcessaContab.MessageInfo,'Erro',mtError,[mbOk],0);
   end;

end;

procedure TfrmDataMT.FormCreate(Sender: TObject);
begin
  inherited;
  // *** Instancia a classe geral CtrlContab ***
  CtrlProcessaContab := TCtrlProcessaContab.Create;
  CtrlProcessaContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

end;

procedure TfrmDataMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CtrlProcessaContab.free;

end;

end.
