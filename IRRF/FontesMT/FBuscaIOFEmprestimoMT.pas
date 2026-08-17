{ Alterações
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 21724
Rotina...: FormCreate
Descrição: Passei na chamada das rotinas CalcProxDiaSemana, CalcDataIni, CalcDataFim
           da uCtrlModuloIRRF, o valor 2 para o parâmetro iTipoImposto, indicando
           que é uma busca de IOF.
**********************************************************************
}

unit FBuscaIOFEmprestimoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker,
  CMDateTimePicker, wwdblook, Db, DBClient, uCMClientDataSet, uCtrlBuscaIOFEmprestimo,
  ComCtrls,UCtrlModuloIRRF;




type
  TfrmBuscaIOFEmprestimoMT = class(TfrmSairAjuda)
    lblNatMan: TLabel;
    bbtnConfirmaGeracao: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    dtInicio: TCMDateTimePicker;
    dtFim: TCMDateTimePicker;
    lblContagem: TLabel;
    pnlPosicao: TPanel;
    memResult: TMemo;
    ProgressBar1: TProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmaGeracaoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    BuscaIOF   : TCtrlBuscaIOFEmprestimo;
    ModuloIRRF : TCtrlModuloIRRF;
  public
    { Public declarations }
  end;

var
  frmBuscaIOFEmprestimoMT: TfrmBuscaIOFEmprestimoMT;

implementation

uses uMensErro, uSistema, uDataBase, DBaseDados;
{$R *.DFM}

procedure TfrmBuscaIOFEmprestimoMT.FormCreate(Sender: TObject);
var
  dDataVenc : TDateTime;
begin
  inherited;
  BuscaIOF := TCtrlBuscaIOFEmprestimo.Create;
  BuscaIOF.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
  Sistema.AppRemoteServer,True,nil,nil,False);

  ModuloIRRF := TCtrlModuloIRRF.Create;
  ModuloIRRF.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
  Sistema.AppRemoteServer,True,nil,nil,False);

  dDataVenc := ModuloIRRF.CalcProxDiaSemana(sistema.IdEmpresa, Date,3,True, 2);
  //
  dtInicio.Date := ModuloIRRF.CalcDataIni(dDataVenc, 2);
  dtFim.Date    := ModuloIRRF.CalcDataFim(dDataVenc, 2);
  dtInicio.Text := DateToStr(dtInicio.Date);
  dtFim.Text    := DateToStr(dtFim.Date);

  progressbar1.position := 0;
  lblcontagem.caption   := '';
  pnlPosicao.caption    := '';

end;

procedure TfrmBuscaIOFEmprestimoMT.bbtnConfirmaGeracaoClick(
  Sender: TObject);
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

  if not BuscaIOF.BuscaIOF(Sistema.IdEmpresa,
                           dtInicio.text, dtFim.text,
                           sistema.UsaPlanoPatro,
                           bPrimVez)
  then
  begin
        MsgDlg(BuscaIOF.MessageInfo,'Erro',mtError,[mbOK],0);
        exit;
  end
  else
  begin
       If (Copy(pnlPosicao.caption,1,1) <> '>') then
           MsgDlg('Operação efetuada com sucesso!','Aviso',mtWarning,[mbOK],0);
  end;
end;

procedure TfrmBuscaIOFEmprestimoMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  BuscaIOF.free;
  ModuloIRRF.free;
end;

procedure TfrmBuscaIOFEmprestimoMT.FormShow(Sender: TObject);
begin
  inherited;
  dtInicio.SetFocus;
end;

end.
