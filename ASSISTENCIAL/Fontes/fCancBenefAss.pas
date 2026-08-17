// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Hugo Luna
// Data        : 24/10/2007
// Rotina      : bbtnConfirmar
// Pendência   : 25507
// Descricao   : Colocando a propriedade modalresult para mrNone no botão bbtnConfirmar.
//------------------------------------------------------------------------------
unit fCancBenefAss;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  wwdblook, Db, DBTables, Wwquery, MontaSelect, TEdNum, IvDictio, IvMulti,
  wwdbdatetimepicker, CMDateTimePicker, IvEMulti;


type
  TfrmCancBenefAss = class(TfrmOkCancelar)
    pnlTitular: TPanel;
    Label4: TLabel;
    lblPart: TLabel;
    Label1: TLabel;
    lblDepen: TLabel;
    Label2: TLabel;
    lblMatricula: TLabel;
    grpDadosBenef: TGroupBox;
    Label6: TLabel;
    Label9: TLabel;
    lblInscricao: TLabel;
    Label3: TLabel;
    lblPlanoAssist: TLabel;
    dtDataCancel: TCMDateTimePicker;
    Label11: TLabel;
    lblDependencia: TLabel;
    memObsCancel: TMemo;
    Label5: TLabel;
    Label7: TLabel;
    lblDtInscricao: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    iIdTitular,
    iIdDependente: longint;
  public
    { Public declarations }
    function PedeDadosCancBenefAss(psNomeParticipante,
                                   psNomeDependente,
                                   psNomePlanoAssistencial,
                                   psInscricao,
                                   psMatricula,
                                   psIdDependencia,
                                   psDependencia,
                                   psDtInscricao: string;
                                   piIdTitular,
                                   piIdDependente: longint;
                                   var dtCancelamento: TDateTime;
                                   var sObsCancel: string): boolean;
  end;

var
  frmCancBenefAss: TfrmCancBenefAss;

implementation

uses UMensErro;

{$R *.DFM}

function TfrmCancBenefAss.PedeDadosCancBenefAss(psNomeParticipante,
                                                psNomeDependente,
                                                psNomePlanoAssistencial,
                                                psInscricao,
                                                psMatricula,
                                                psIdDependencia,
                                                psDependencia,
                                                psDtInscricao: string;
                                                piIdTitular,
                                                piIdDependente: longint;
                                                var dtCancelamento: TDateTime;
                                                var sObsCancel: string): boolean;
begin
   //Result := False;
   lblPart.Caption         := psNomeParticipante;
   lblDepen.Caption        := psNomeDependente;
   lblPlanoAssist.Caption  := psNomePlanoAssistencial;
   lblInscricao.Caption    := psInscricao;
   lblMatricula.Caption    := psMatricula;
   lblDependencia.Caption  := psDependencia;
   lblDtInscricao.Caption  := psDtInscricao;
   iIdTitular              := piIdTitular;
   iIdDependente           := piIdDependente;
   dtDataCancel.Text       := DateToStr(dtCancelamento);
   memObsCancel.Lines.Text := sObsCancel;

   ShowModal;

   if ModalResult = mrOk then
   dtCancelamento := StrToDate(dtDataCancel.Text);

   sObsCancel := memObsCancel.Lines.GetText;

   if ModalResult = mrOK then
     result := true
   else
     result := false;
end;

procedure TfrmCancBenefAss.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caHide;
//  inherited;
// nao tirar o comentario para nao dar o caFree
end;

procedure TfrmCancBenefAss.bbtnConfirmarClick(Sender: TObject);
begin
  if (Trim(dtDataCancel.Text) = '') then
  begin
    MsgDlg('Informe a Data de Cancelamento.','Erro',mtError,[mbOk],0);
    dtDataCancel.SetFocus;
    Exit;
  end;
  inherited;
  ModalResult := mrOk;
end;

procedure TfrmCancBenefAss.FormShow(Sender: TObject);
begin
  inherited;
  dtDataCancel.SetFocus;
end;

procedure TfrmCancBenefAss.bbtnSairClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TfrmCancBenefAss.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

end.
