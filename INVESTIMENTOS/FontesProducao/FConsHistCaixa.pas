//******************************************************************************
// Data      : 08/05/2007
// Codigo    : AL_3
// Pendência : 25298
// Sol       :
// Motivo    : Implementação da Permissão do Uso da Carteira Gerencial em
//             virtude do parâmetro do sistema Utiliza carteira/Data
//******************************************************************************
// Data      : 31/08/2006
// Codigo    : AL_2
// Pendência :
// Sol       :
// Motivo    : Implementação do plano/patrocinador
//******************************************************************************
// Data      : 09/06/2006
// Código    : Al_1
// Pendencia :
// SOL       :
// Motivo    : Implementação do controle de tamanho de tela conforme configuração
//******************************************************************************

unit FConsHistCaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Wwdbigrd, Grids, Wwdbgrid, Db, Wwdatsrc,
  DBTables, Wwquery, wwdblook, wwdbdatetimepicker, CMDateTimePicker,
  FOkCancelarInv, fcLabel, FPreview;

type
  TfrmConsHistCaixa = class(TfrmOkCancelarInv)
    PlnParam: TPanel;
    PlnGrid: TPanel;
    DBGrid: TwwDBGrid;
    DBGridIButton: TwwIButton;
    QryCarteira: TwwQuery;
    dblCarteira: TwwDBLookupCombo;
    Label1: TLabel;
    QryCarteiraDESCCARTGERENC: TStringField;
    QryCarteiraIDCARTEIRAGERENC: TFloatField;
    GroupBox1: TGroupBox;
    DtaFim: TCMDateTimePicker;
    DtaInicio: TCMDateTimePicker;
    Label2: TLabel;
    bt_Imprime: TBitBtn;
    QryPatroPlanPrevContab: TwwQuery;
    QryPatroPlanPrevContabPLANPRVCONTABPATRO: TStringField;
    QryPatroPlanPrevContabIDPLANPREVCTBPATR: TFloatField;
    QryPatroPlanPrevContabIDPLANOPREV: TFloatField;
    QryPatroPlanPrevContabIDPATRO: TFloatField;
    dblPlanoPatr: TwwDBLookupCombo;
    Label3: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bt_ImprimeClick(Sender: TObject);
    //Al_1
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    //AL_3
    procedure DtaFimExit(Sender: TObject);
  private
    { Private declarations }
     procedure PreencheGrid;

  public
    { Public declarations }
  end;

var
  frmConsHistCaixa: TfrmConsHistCaixa;

implementation

//Al_1
uses FDmRelHistCaixa, FPrincipal,
//AL_3
URendaVariavel,UMensErro,UOperComum;

{$R *.DFM}

procedure TfrmConsHistCaixa.FormActivate(Sender: TObject);
begin
  inherited;
   PnlFundo.Enabled := True;
   //Al_1
end;

procedure TfrmConsHistCaixa.FormShow(Sender: TObject);
begin
  inherited;
   DtaInicio.Date := Date;
   DtaFim.Date    := Date;
   QryCarteira.Open;
   QryPatroPlanPrevContab.Open;
end;

procedure TfrmConsHistCaixa.PreencheGrid;
begin
   with DmRelHistCaixa do
   begin
      QryHistCaixa.DisableControls;
      QryHistCaixa.Close;
      QryHistCaixa.ParamByName('DATAINICIO').AsString := DtaInicio.Text;
      QryHistCaixa.ParamByName('DATAFIM').AsString    := DtaFim.Text;
      QryHistCaixa.ParamByName('IDCARTEIRAGERENC').Clear;
      if Trim(dblCarteira.LookupValue) <> '' then
         QryHistCaixa.ParamByName('IDCARTEIRAGERENC').AsInteger     :=
                      QryCarteira.FieldByName('IDCARTEIRAGERENC').AsInteger;
      QryHistCaixa.ParamByName('IDPLANPREVCTBPATR').Clear;
      if Trim(dblPlanoPatr.LookupValue) <> '' then
         QryHistCaixa.ParamByName('IDPLANPREVCTBPATR').AsInteger     :=
                      QryPatroPlanPrevContab.FieldByName('IDPLANPREVCTBPATR').AsInteger;
      QryHistCaixa.Open;
      QryHistCaixa.First;
      QryHistCaixa.EnableControls;
   end;
end;

procedure TfrmConsHistCaixa.bt_ImprimeClick(Sender: TObject);
begin
  inherited;
   with DmRelHistCaixa do
   begin
      ppLDataCxa.Caption      := DtaInicio.Text+' a '+DtaFim.Text;

      QryHistCaixa.DisableControls;

      TfrmPreview.CreateModalPreview(Application,
                                     RptHistoricoCaixa,
                                     RptHistoricoCaixa.PrinterSetup.DocumentName);
      QryHistCaixa.EnableControls;
   end;

end;

//Al_1
procedure TfrmConsHistCaixa.FormCreate(Sender: TObject);
begin
  inherited;
   if (TForm(Sender).Height > FrmPrincipal.ClientHeight - 50{Tamanho da barra de tarefas e barra de staus}) or
      (TForm(Sender).Width > FrmPrincipal.ClientWidth - 4 {Margem de segurança}) then
      WindowState := wsMaximized
   else
      WindowState := wsNormal;
end;

procedure TfrmConsHistCaixa.bbtnConfirmarClick(Sender: TObject);
//AL_3
Var
   sMens: String;
begin
   sMens := '';
   If (DtaFim.Text <> '') and
      (Not RendaVariavel.PermiteUtilizarCarteiraGerenc(DtaFim.date,sMens)) then
   begin
      MsgDlg(sMens,'Mensagem do Sistema', mtWarning, [mbOk],0);
      OperComum.LimpaParametros(DmRelHistCaixa.QryHistCaixa);
      DtaFim.Clear;
      dblCarteira.Clear;
      dblPlanoPatr.Clear;
      DtaFim.SetFocus;
      Exit;
   end
   else
   begin
     If (Trim(DtaInicio.Text) = '') Then
     begin
        if DtaInicio.CanFocus then
           DtaInicio.SetFocus;
        exit;
     end;

     If (Trim(DtaFim.Text) = '') Then
     begin
        if DtaFim.CanFocus then
           DtaFim.SetFocus;
        exit;
     end;

     If DtaFim.Date < DtaInicio.Date Then
     begin
        if DtaInicio.CanFocus then
           DtaInicio.SetFocus;
        exit;
     end;

     inherited;

     PreencheGrid;
   end;
end;

procedure TfrmConsHistCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    DmRelHistCaixa.QryHistCaixa.Close;
    QryCarteira.Close;
    QryPatroPlanPrevContab.Close;
end;

//AL_3
procedure TfrmConsHistCaixa.DtaFimExit(Sender: TObject);
Var
   sMens: String;
begin
  inherited;
  sMens := '';
  If (DtaFim.Text <> '') and
     (Not RendaVariavel.PermiteUtilizarCarteiraGerenc(DtaFim.date,sMens)) then
  begin
     MsgDlg(sMens,'Mensagem do Sistema', mtWarning, [mbOk],0);
     OperComum.LimpaParametros(DmRelHistCaixa.QryHistCaixa);
     DtaFim.Clear;
     dblCarteira.Clear;
     dblPlanoPatr.Clear;
     DtaFim.SetFocus;
     Exit;
  end;
end;

end.
