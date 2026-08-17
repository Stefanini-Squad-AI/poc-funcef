unit FDeletaCSLLPISCOFINSMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, wwdbdatetimepicker, CMDateTimePicker,
  Db, DBClient, uCMClientDataSet,uctrlDeletaCSLLPISCOFINS, uCtrlNatuRendimento;

type
  TfrmDeletaCSLLPISCOFINSMT = class(TfrmSairAjuda)
    Panel1: TPanel;
    Bevel1: TBevel;
    lblNatRendimento: TLabel;
    gbPeriodo: TGroupBox;
    Label4: TLabel;
    dtInicio: TCMDateTimePicker;
    dtFim: TCMDateTimePicker;
    pnlPosicao: TPanel;
    dblcNatRendimento: TwwDBLookupCombo;
    cdsNaturendimento: TCMClientDataSet;
    bbtnConfirmaGeracao: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmaGeracaoClick(Sender: TObject);
    procedure dblcNatRendimentoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
    DeletaCSLLPISCOFINS : TCtrlDeletaCSLLPISCOFINS;
    Naturendimento : TCtrlNatuRendimento;
  public
    { Public declarations }
  end;

var
  frmDeletaCSLLPISCOFINSMT: TfrmDeletaCSLLPISCOFINSMT;

implementation

uses umensErro, uDataBase,  DbaseDados, Usistema;

{$R *.DFM}

procedure TfrmDeletaCSLLPISCOFINSMT.FormCreate(Sender: TObject);
begin
  inherited;
  DeletaCSLLPISCOFINS := TCtrlDeletaCSLLPISCOFINS.create;
  DeletaCSLLPISCOFINS.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
  Sistema.AppRemoteServer,True,nil,nil,False);
  NatuRendimento := TCtrlNatuRendimento.Create;
  NatuRendimento.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
  Sistema.AppRemoteServer,True,nil,nil,False);
  cdsNaturendimento.data := NatuRendimento.ListNaturendimento_Especifica;
end;

procedure TfrmDeletaCSLLPISCOFINSMT.bbtnConfirmaGeracaoClick(
  Sender: TObject);
var
  Ano, Mes, Dia : word;
begin
  inherited;
  if MsgDlg('Deseja realmente apagar a geração da CSLL/PIS/COFINS para o período selecionado ?', 'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes then
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

      if not DeletaCSLLPISCOFINS.DeletaLancCSLLPISCOFINS(sistema.IdEmpresa, 0, 0, 0, dtInicio.text, dtFim.text, dblcnatrendimento.lookupvalue) then
         MsgDlg(DeletaCSLLPISCOFINS.MessageInfo,'Aviso',mtWarning,[mbOK],0)
      else
      Begin
         bbtnConfirmaGeracao.enabled := false;
         If (Copy(pnlPosicao.caption,1,1) <> '>') then
            MsgDlg('Operação efetuada com sucesso!','Aviso',mtWarning,[mbOK],0);
      End;

  end;

end;

procedure TfrmDeletaCSLLPISCOFINSMT.dblcNatRendimentoCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  bbtnConfirmaGeracao.enabled := true;
end;

end.
