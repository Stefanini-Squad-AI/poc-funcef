unit FEstornoFinancMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, StdCtrls, wwdbdatetimepicker, CMDateTimePicker, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, uCtrlMovimFinanc,
  uCtrlParamIntegra;

type
  TfrmEstornoFinancMT = class(TfrmSairAjuda)
    lblDataEstorno: TLabel;
    deDataEstorno: TCMDateTimePicker;
    bbtnConfirmaEstorno: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmaEstornoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    rCodLancFinancAux : Double;
    bRegNaoIdentAux   : Boolean;
    CtrlMovimFinanc   : TCtrlMovimFinanc;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; rCodLancFinanc:Double; bRegNaoIdent: Boolean); reintroduce;
  end;

var
  frmEstornoFinancMT: TfrmEstornoFinancMT;

implementation

{$R *.DFM}

uses dBaseDados, uSistema, uMensErro;

constructor TfrmEstornoFinancMT.Create(AOwner: TComponent;
  rCodLancFinanc: Double; bRegNaoIdent: Boolean);
begin
   inherited Create(AOwner);
   rCodLancFinancAux:=rCodLancFinanc;
   bRegNaoIdentAux:=bRegNaoIdent;
end;

procedure TfrmEstornoFinancMT.FormCreate(Sender: TObject);
begin
   inherited;
   //Inicializa CtrlMovimFinanc
   CtrlMovimFinanc:=TCtrlMovimFinanc.Create(Sistema.IdEmpresa,Sistema.IdModulo,
                                            Sistema.IdUsuario,Sistema.UsaPlanoPatro);

   CtrlMovimFinanc.Initialize(dtmBaseDados.dbBaseDados,True);
   deDataEstorno.Date:=Date;
end;

procedure TfrmEstornoFinancMT.FormShow(Sender: TObject);
begin
   inherited;
   deDataEstorno.SetFocus;
end;

procedure TfrmEstornoFinancMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   CtrlMovimFinanc.Free;
   inherited;
end;

procedure TfrmEstornoFinancMT.bbtnConfirmaEstornoClick(Sender: TObject);
var
   bIntegraContab : Boolean;
begin
   if Trim(deDataEstorno.Text)='' then
    begin
       MsgDlg('Obrigatório preencher a data do estorno','Erro',mtError,[mbOk],0);
       deDataEstorno.SetFocus;
       Exit;
    end;

   bIntegraContab:=ParamIntegra.IntegraContab;
   if not(CtrlMovimFinanc.EstornoFinanceiro(deDataEstorno.Date,0,bRegNaoIdentAux,rCodLancFinancAux,
                                            ParamIntegra.Plano,bIntegraContab)) then
      MsgDlg(CtrlMovimFinanc.MessageInfo,'Erro',mtError,[mbOk],0)
   else
    begin
       MsgDlg('Estorno Efetuado com Sucesso','Aviso',mtWarning,[mbOk],0);
       bbtnSairClick(Self);
    end;
end;


end.
