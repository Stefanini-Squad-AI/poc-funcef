// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Hugo Luna
// Data        : 24/10/2007
// Rotina      : bbtnConfirmar
// Pendência   : 25507
// Descricao   : Colocando a propriedade modalresult para mrNone no botão bbtnConfirmar.
//               Colocando rgAtivo.Enabled = True
//------------------------------------------------------------------------------
unit fInscBenefAss;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  wwdblook, Db, DBTables, Wwquery, MontaSelect, TEdNum, IvDictio, IvMulti,
  wwdbdatetimepicker, CMDateTimePicker, IvEMulti
  ;

type
  TfrmInscBenefAss = class(TfrmOkCancelar)
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
    dtDataInsc: TCMDateTimePicker;
    Label11: TLabel;
    lblDependencia: TLabel;
    rgAtivo: TRadioGroup;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    iIdTitular,
    iIdDependente : longint;
  public
    { Public declarations }
    function PedeDadosInscBenefAss(psNomeParticipante,
                                   psNomeDependente,
                                   psNomePlanoAssistencial,
                                   psInscricao,
                                   psMatricula,
                                   psIdDependencia,
                                   psDependencia : string;
                                   piIdTitular,
                                   piIdDependente : longint;
                                   var dtInscricao : TDateTime;
                                   var iFlgAtivo : integer) : boolean;
  end;
var
  frmInscBenefAss: TfrmInscBenefAss;

implementation

uses UMensErro;
{$R *.DFM}

function TfrmInscBenefAss.PedeDadosInscBenefAss(psNomeParticipante,
                                                psNomeDependente,
                                                psNomePlanoAssistencial,
                                                psInscricao,
                                                psMatricula,
                                                psIdDependencia,
                                                psDependencia : string;
                                                piIdTitular,
                                                piIdDependente : longint;
                                                var dtInscricao : TDateTime;
                                                var iFlgAtivo : integer) : boolean;
begin
   //Result := False;
   lblPart.Caption        := psNomeParticipante;
   lblDepen.Caption       := psNomeDependente;
   lblPlanoAssist.Caption := psNomePlanoAssistencial;
   lblInscricao.Caption   := psInscricao;
   lblMatricula.Caption   := psMatricula;
   lblDependencia.Caption := psDependencia;
   iIdTitular             := piIdTitular;
   iIdDependente          := piIdDependente;
   dtDataInsc.Text        := DateToStr(dtInscricao);

   if iFlgAtivo = 1 then
     rgAtivo.ItemIndex := 0
   else
     rgAtivo.ItemIndex := 1;

   ShowModal;

   if ModalResult = mrOk then
   dtInscricao := StrToDate(dtDataInsc.Text);

   if rgAtivo.ItemIndex = 0 then
     iFlgAtivo := 1
   else
     iFlgAtivo := 0;

   if ModalResult = mrOK then
     Result := True
   else
     Result := False;
end;

procedure TfrmInscBenefAss.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caHide;
  // inherited; << não tirar o comentário para não dar o caFree >>
end;

procedure TfrmInscBenefAss.bbtnConfirmarClick(Sender: TObject);
begin
  if (Trim(dtDataInsc.Text) = '') then
  begin
    MsgDlg('Informe a Data de Inscrição.', 'Erro', mtError, [mbOk], 0);
    dtDataInsc.SetFocus;
    Exit;
  end;
  inherited;
  ModalResult := mrOk;
end;

procedure TfrmInscBenefAss.FormShow(Sender: TObject);
begin
  inherited;
  dtDataInsc.SetFocus;
end;

procedure TfrmInscBenefAss.bbtnSairClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TfrmInscBenefAss.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

end.
