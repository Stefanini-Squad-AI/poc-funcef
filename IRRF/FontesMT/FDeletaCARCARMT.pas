unit FDeletaCARCARMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, wwdblook,
  Db, DBClient, uCMClientDataSet,uctrlDeletaCarCar, uCtrlNatuRendimento;

type
  TfrmDeletaCarCarMT = class(TfrmSairAjuda)
    Panel1: TPanel;
    bbtnConfirmaGeracao: TBitBtn;
    bbtnCancelar: TBitBtn;
    gbPeriodo: TGroupBox;
    Label4: TLabel;
    dtInicio: TCMDateTimePicker;
    dtFim: TCMDateTimePicker;
    pnlPosicao: TPanel;
    Bevel1: TBevel;
    cdsNaturendimento: TCMClientDataSet;
    dblcNatRendimento: TwwDBLookupCombo;
    lblNatRendimento: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmaGeracaoClick(Sender: TObject);
    procedure dtFimCloseUp(Sender: TObject);
    procedure dtInicioCloseUp(Sender: TObject);
  private
    { Private declarations }
    DeletaCARCAR : TCtrlDeletaCARCAR;
    Naturendimento : TCtrlNatuRendimento;
  public
    { Public declarations }
  end;

var
  frmDeletaCarCarMT: TfrmDeletaCarCarMT;

implementation

uses umensErro, uDataBase,  DbaseDados, Usistema;

{$R *.DFM}

procedure TfrmDeletaCarCarMT.FormCreate(Sender: TObject);
begin
  inherited;
  DeletaCARCAR := TCtrlDeletaCARCAR.create;
  DeletaCARCAR.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
  Sistema.AppRemoteServer,True,nil,nil,False);
  NatuRendimento := TCtrlNatuRendimento.Create;
  NatuRendimento.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
  Sistema.AppRemoteServer,True,nil,nil,False);
  cdsNaturendimento.data := NatuRendimento.ListNaturendimento_Filtrada;
end;

procedure TfrmDeletaCarCarMT.bbtnConfirmaGeracaoClick(Sender: TObject);
var
  Ano, Mes, Dia : word;
begin
  inherited;
  if MsgDlg('Deseja realmente apagar a geração do Contas a Pagar para o período selecionado ?', 'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes then
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
      if (trim(dblcNatRendimento.text) = '') then
      Begin
           MsgDlg('A Natureza de Rendimento Global não foi selecionada.','Aviso',mtWarning,[mbOK],0);
           bbtnConfirmaGeracao.enabled := false;
           exit;
      end;
      if not DeletaCARCAR.DeletaLancCARCAR(sistema.IdEmpresa, 0, 0, 0, dtInicio.text, dtFim.text, dblcnatrendimento.lookupvalue) then
         MsgDlg(DeletaCARCAR.MessageInfo,'Aviso',mtWarning,[mbOK],0)
      else
      Begin
         bbtnConfirmaGeracao.enabled := false;
         If (Copy(pnlPosicao.caption,1,1) <> '>') then
            MsgDlg('Operação efetuada com sucesso!','Aviso',mtWarning,[mbOK],0);
      End;
  end;
end;

procedure TfrmDeletaCarCarMT.dtFimCloseUp(Sender: TObject);
begin
  inherited;
  If ((dtfim.Text <> '') and (dtInicio.Text <> '')) then
     bbtnConfirmaGeracao.enabled := true
  else
      bbtnConfirmaGeracao.enabled := false;
end;

procedure TfrmDeletaCarCarMT.dtInicioCloseUp(Sender: TObject);
begin
  inherited;
  If ((dtfim.Text <> '') and (dtInicio.Text <> '')) then
     bbtnConfirmaGeracao.enabled := true
  else
      bbtnConfirmaGeracao.enabled := false;
end;

end.
