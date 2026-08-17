//******************************************************************************
// Data     : 14/10/2005
// Código   : AL_2
// Motivo   : Passagem de Parametro Data para String e Melhorias
//******************************************************************************
// Data     : 25/10/2004
// Código   : Alt_1
// Motivo   : Acerto na impressão dos períodos do relatório
//******************************************************************************
// Data     : 19/10/2004
// Motivo   : Acerto na impressão do relatório
//******************************************************************************

unit FParamCotaFundo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, wwdbdatetimepicker, CMDateTimePicker, StdCtrls, wwdblook,
  Db, DBTables, Wwquery, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, ExtCtrls, FPreview;

type
  TFrmParamCotaFundo = class(TfrmOkCancelar)
    QryFundoInvest: TwwQuery;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    dtDataini: TCMDateTimePicker;
    dtDataFim: TCMDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    dblInvest: TwwDBLookupCombo;
    Investimento: TLabel;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    //AL_2
    bModal: Boolean;
    procedure SetModal(bMod: Boolean);
  public
    { Public declarations }
  //AL_2
  published
    { Published declarations }
     Property fModal: boolean read bModal write SetModal;
  end;

var
  FrmParamCotaFundo: TFrmParamCotaFundo;

implementation

uses FDmRelConsCotaFundo, UOperComum, UBibliotecaInvest, uMensErro;

{$R *.DFM}

//AL_2
procedure TFrmParamCotaFundo.SetModal(bMod: Boolean);
begin
   bModal := bMod;
end;

procedure TFrmParamCotaFundo.FormShow(Sender: TObject);
begin
  inherited;
   OperComum.LimpaParametros(QryFundoInvest);
   QryFundoInvest.ParambyName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
   QryFundoInvest.Open;
   pnlFundo.Enabled := True;
   dtDataIni.Date   := date;
   dtDataFim.Date   := date;
end;

procedure TFrmParamCotaFundo.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   if Trim(dtDataini.Text) = '' then
   begin
      MsgDlg('Data Inicial não informada !','Atenção ',mtWarning,[mbOK],0);
      if dtDataini.CanFocus then
         dtDataini.SetFocus;
     exit;
   end;

   if Trim(dtDataFim.Text) = '' then
   begin
      MsgDlg('Data Final não informada !','Atenção ',mtWarning,[mbOK],0);
      if dtDataFim.CanFocus then
         dtDataFim.SetFocus;
     exit;
   end;

   //AL_2 Ini
   with DmRelConsCotaFundo, DmRelConsCotaFundo.QryCotaFundo do
   begin
      OperComum.LimpaParametros(QryCotaFundo);
      If dblInvest.Text <> '' Then
         QryCotaFundo.ParamByName('IDFUNDOINVEST').AsInteger := StrToInt(dblInvest.lookupvalue);

      QryCotaFundo.ParamByName('DATAINI').AsString := dtDataini.Text;
      QryCotaFundo.ParamByName('DATAFIM').AsString := dtDataFim.Text;
      QryCotaFundo.Open;

      if not IsEmpty then
      begin
      //Alt_1
         DmRelConsCotaFundo.lblDtIni.Caption := dtDataini.Text;
         DmRelConsCotaFundo.lblDtFin.Caption := dtDataFim.Text;

         DmRelConsCotaFundo.rptCotaFundo.PrinterSetup.DocumentName := 'Consulta de Cotas dos Fundos de Investimentos';
         if not fModal then
            TfrmPreview.CreateModalPreview(Application,
                                           rptCotaFundo,
                                           rptCotaFundo.PrinterSetup.DocumentName)
         else
            rptCotaFundo.PrintToDevices;
      end
      else
         MsgDlg('Nenhuma cotação foi encontrada no período Informando.','Atenção ',mtWarning,[mbOK],0);
      QryCotaFundo.Close;
   end;

   pnlFundo.Enabled := True;
   if fModal then
      bbtnSair.Click;
   //AL_2 Fim
end;

procedure TFrmParamCotaFundo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   QryFundoInvest.Close;
end;

end.
