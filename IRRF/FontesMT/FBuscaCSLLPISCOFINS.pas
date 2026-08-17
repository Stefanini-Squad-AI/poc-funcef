{ Alterações
**********************************************************************
Analista.: Marchetti
Pendencia: 17463
Rotina...:
Descrição: Altera o intervalo de busca para quinzenal
**********************************************************************
}
unit FBuscaCSLLPISCOFINS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, uCtrlBuscaCSLLPISCOFINS,
  UCtrlModuloIRRF, ComCtrls;

type
  TfrmBuscaCSLLPISCOFINS = class(TfrmSairAjuda)
    bbtnConfirmaGeracao: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    dtInicio: TCMDateTimePicker;
    dtFim: TCMDateTimePicker;
    memResult: TMemo;
    pnlPosicao: TPanel;
    ProgressBar1: TProgressBar;
    lblContagem: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmaGeracaoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    BuscaCSLLPISCOFINS : TCtrlBuscaCSLLPISCOFINS;
    ModuloIRRF : TCtrlModuloIRRF;
  public
    { Public declarations }
  end;

var
  frmBuscaCSLLPISCOFINS: TfrmBuscaCSLLPISCOFINS;

implementation

uses uMensErro, uSistema, uDataBase, DBaseDados;


{$R *.DFM}

procedure TfrmBuscaCSLLPISCOFINS.FormCreate(Sender: TObject);
Var
  dDataVenc : TDateTime;
begin
  inherited;
  BuscaCSLLPISCOFINS := TCtrlBuscaCSLLPISCOFINS.Create;
  BuscaCSLLPISCOFINS.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
  Sistema.AppRemoteServer,True,nil,nil,False);
  ModuloIRRF    := TCtrlModuloIRRF.Create;
  ModuloIRRF.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
  Sistema.AppRemoteServer,True,nil,nil,False);
  dDataVenc     := ModuloIRRF.CalcProxDiaSemana(sistema.IdEmpresa, Date,3,True,1);
  dtInicio.Date := ModuloIRRF.CalcDataIni(dDataVenc,1);
  dtFim.Date    := ModuloIRRF.CalcDataFim(dDataVenc,1);
  dtInicio.Text := DateToStr(dtInicio.Date);
  dtFim.Text    := DateToStr(dtFim.Date);

  progressbar1.position := 0;
  lblcontagem.caption   := '';
  pnlPosicao.caption    := '';

end;

procedure TfrmBuscaCSLLPISCOFINS.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  BuscaCSLLPISCOFINS.free;
  ModuloIRRF.free;
end;

procedure TfrmBuscaCSLLPISCOFINS.bbtnConfirmaGeracaoClick(Sender: TObject);
Var
  bPrimVez : boolean;
begin
  inherited;
  bPrimVez := True;
  if dtFim.Date < dtInicio.date then
     Begin
       MsgDlg('Data final não pode ser menor que a inicial.','Aviso',mtWarning,[mbOK],0);
       dtFim.date := dtInicio.date;
       exit;
     end
  else
  if dtFim.Date > Date then
     Begin
       MsgDlg('Data final não pode ser maior que a corrente.','Aviso',mtWarning,[mbOK],0);
       exit;
     end;

  if not BuscaCSLLPISCOFINS.BuscaCSLLPISCOFINS(Sistema.IdEmpresa,
                                               dtInicio.text,
                                               dtFim.text,
                                               sistema.UsaPlanoPatro,
                                               bPrimVez)
  then
  begin
      MsgDlg(BuscaCSLLPISCOFINS.MessageInfo,'Erro',mtError,[mbOK],0);
      exit;
  end else
  begin
      If (Copy(pnlPosicao.caption,1,1) <> '>') then
           MsgDlg('Operação efetuada com sucesso!','Aviso',mtWarning,[mbOK],0);
      bbtnconfirmageracao.enabled := false;
  end;

end;

procedure TfrmBuscaCSLLPISCOFINS.FormShow(Sender: TObject);
begin
  inherited;
  bbtnconfirmageracao.enabled := true;
  dtInicio.SetFocus;
end;

end.
