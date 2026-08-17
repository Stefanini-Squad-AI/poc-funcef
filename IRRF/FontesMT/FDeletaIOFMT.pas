unit FDeletaIOFMT;

{ Alterações
--------------------------------------------------------------------------------
Analista.:
Pendencia:
Rotina...:
Descrição:
--------------------------------------------------------------------------------
Analista.: Claudio Faria
Pendencia: 27277 - 23/01/2008
Rotina...:
Descrição: Ajuste para habilitar o botão de defazer
--------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, uSistema,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, UctrlDeletaIOF;

type
  TfrmdeletaIOFMT = class(TfrmSairAjuda)
    Panel1: TPanel;
    gbPeriodo: TGroupBox;
    Label4: TLabel;
    dtInicio: TCMDateTimePicker;
    dtFim: TCMDateTimePicker;
    pnlPosicao: TPanel;
    bbtnCancelar: TBitBtn;
    bbtnConfirmaGeracao: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmaGeracaoClick(Sender: TObject);
    procedure dtFimCloseUp(Sender: TObject);
    procedure dtInicioCloseUp(Sender: TObject);
  private
    { Private declarations }
    DeletaIOF : TCtrlDeletaIOF;
  public
    { Public declarations }
  end;

var
  frmdeletaIOFMT: TfrmdeletaIOFMT;

implementation

uses umensErro, uDataBase,  DbaseDados;

{$R *.DFM}

procedure TfrmdeletaIOFMT.FormCreate(Sender: TObject);
begin
  inherited;
  DeletaIOF := TCtrlDeletaIOF.create;
  DeletaIOF.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
  Sistema.AppRemoteServer,True,nil,nil,False);
end;

procedure TfrmdeletaIOFMT.bbtnConfirmaGeracaoClick(Sender: TObject);
var
  Ano, Mes, Dia : word;
begin
  inherited;
  if MsgDlg('Deseja realmente apagar a geração do IOF para o período selecionado ?', 'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes then
  begin
      DecodeDate(dtInicio.DateTime, Ano, Mes, Dia);
      if dtFim.Date < dtInicio.date then
      Begin
           MsgDlg('Data final não pode ser menor que a inicial.','Aviso',mtWarning,[mbOK],0);
           dtFim.date := dtInicio.date;
           dtInicio.text := '';
           dtFim.text    := '';
           bbtnConfirmaGeracao.enabled := false;
           exit;
      end;
      if not DeletaIOF.DeletaLancIOF(sistema.IdEmpresa, 0, 0, 0, dtInicio.text, dtFim.text, '') then
         MsgDlg(DeletaIOF.MessageInfo,'Aviso',mtWarning,[mbOK],0)
      else
      Begin
         bbtnConfirmaGeracao.enabled := false;
         If (Copy(pnlPosicao.caption,1,1) <> '>') then
            MsgDlg('Operação efetuada com sucesso!','Aviso',mtWarning,[mbOK],0);
      End;
  end;
end;

procedure TfrmdeletaIOFMT.dtFimCloseUp(Sender: TObject);
begin
  inherited;
  If ((dtfim.Text <> '') and (dtInicio.Text <> '')) then
     bbtnConfirmaGeracao.enabled := true
  else
      bbtnConfirmaGeracao.enabled := false;
end;

procedure TfrmdeletaIOFMT.dtInicioCloseUp(Sender: TObject);
begin
  inherited;
  If ((dtfim.Text <> '') and (dtInicio.Text <> '')) then
     bbtnConfirmaGeracao.enabled := true
  else
      bbtnConfirmaGeracao.enabled := false;
end;

end.
