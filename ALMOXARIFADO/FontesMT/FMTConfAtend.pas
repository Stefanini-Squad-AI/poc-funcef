unit FMTConfAtend;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, wwdblook,
  TEdNum, Grids, Wwdbigrd, Wwdbgrid, uCtrlReqMat, Db, DBClient,
  uCMClientDataSet, Wwdatsrc, uCtrlCentroCusto, uCtrlParamGlobal;

type
  TFrmMTConfAtend = class(TfrmSairAjuda)
    pnlSelect: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Bevel2: TBevel;
    EdNumReq: TEditNum;
    dblcCCust: TwwDBLookupCombo;
    edDataReq: TCMDateTimePicker;
    EdDataNec: TCMDateTimePicker;
    BtLimpa: TBitBtn;
    btnSelecionar: TBitBtn;
    BtnDevolver: TBitBtn;
    BtnConfirmar: TBitBtn;
    Panel2: TPanel;
    Bevel1: TBevel;
    grdReq: TwwDBGrid;
    cdsItem: TCMClientDataSet;
    dsItem: TwwDataSource;
    cdsCentroCusto: TCMClientDataSet;
    cdsParamGlobal: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure BtLimpaClick(Sender: TObject);
    procedure BtnDevolverClick(Sender: TObject);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    CtrlParamGlobal : TCtrlParamGlobal;
    ReqMat      : TCtrlReqMat;
    CentroCusto : TCtrlCentroCusto;
    Function ValidaTela : Boolean;
  public
    { Public declarations }
  end;

var
  FrmMTConfAtend: TFrmMTConfAtend;

implementation

{$R *.DFM}

Uses uMensErro, uSistema, uModulo, DBaseDados;


procedure TFrmMTConfAtend.FormCreate(Sender: TObject);
begin
  inherited;
  ReqMat := TCtrlReqMat.Create;
  ReqMat.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  ReqMat.cdsItem := cdsItem;

  CentroCusto := TCtrlCentroCusto.Create;
  CentroCusto.InitializeAs( ReqMat );

  cdsItem.Data        := ReqMat.ListItemConfAtend(-1,-1);

  // Marchetti - Pendencia 27699
  CtrlParamGlobal   := TCtrlParamGlobal.Create;
  CtrlParamGlobal.InitializeAs(ReqMat);
  cdsParamGlobal.Data := CtrlParamGlobal.ListaParamGlobal(Sistema.IdEmpresa);

//  cdsCentroCusto.Data := CentroCusto.ListaCentroCusto(Sistema.IdEmpresa,'',True,0,'A');
  cdsCentroCusto.Data := CentroCusto.ListaCentroCusto(Sistema.IdEmpresa,'',True,0,'A',cdsParamGlobal.FieldByName('IDPLANCENTCUST').AsInteger);
  // Fim Marchetti - Pendencia 27699
end;

procedure TFrmMTConfAtend.btnSelecionarClick(Sender: TObject);
begin
  inherited;
  cdsItem.Data := ReqMat.ListItemConfAtend(Sistema.IdEmpresa,
                                           Modulo.iCodAlmoxa,
                                           dblcCCust.LookupValue,
                                           StrToIntDef(EdNumReq.Text,0),
                                           edDataReq.Date,edDataReq.Date);
end;

procedure TFrmMTConfAtend.BtLimpaClick(Sender: TObject);
begin
  inherited;
  EdNumReq.text   := '';
  dblcCCust.text  := '';
  edDataReq.text  := '';
  edDataNec.text  := '';

end;

procedure TFrmMTConfAtend.BtnDevolverClick(Sender: TObject);
begin
  inherited;
  IF ValidaTela Then
     Begin
        If MsgDlg('Confirma a Devolução deste item','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes Then
           If Not ReqMat.DevolveAtendimento(Sistema.IdEmpresa, Sistema.IdUsuario,Date) Then
              MsgDlg(ReqMat.MessageInfo, 'Erro', mtError, [mbOk, mbHelp], 0);
        btnSelecionar.Click;
     End;
end;

function TFrmMTConfAtend.ValidaTela: Boolean;
begin
  Result := True;
  If cdsItem.IsEmpty Then
      Begin
         MsgDlg('Não há nehuma requisição Selecionado','Erro',mtError,[mbOk],0);
         Result := False;
      End;
end;

procedure TFrmMTConfAtend.BtnConfirmarClick(Sender: TObject);
begin
  inherited;
  IF ValidaTela Then
     Begin
        If MsgDlg('Confirma o recebimento deste item','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes Then
           If Not ReqMat.ConfirmaAtendimento(cdsItem.FieldByName('IDITEMENTREGA').asFloat, Sistema.IdUsuario,Date) Then
              MsgDlg(ReqMat.MessageInfo, 'Erro', mtError, [mbOk, mbHelp], 0);
        btnSelecionar.Click;
     End;
end;

procedure TFrmMTConfAtend.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil( CtrlParamGlobal );
  ReqMat.Free;
  inherited;
end;

end.
