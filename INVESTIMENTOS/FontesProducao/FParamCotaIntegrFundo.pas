//******************************************************************************
// Data     : 14/10/2005
// Codigo   : AL_2
// Motivo   : Passagem de Parametro Data para String e Melhorias
//******************************************************************************
// Data     : 25/10/2004
// Motivo   :Implementação do form de consulta
//******************************************************************************

unit FParamCotaIntegrFundo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker, FPreview;

type
  TFrmParamCotaIntegrFundo = class(TfrmOkCancelar)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtDataini: TCMDateTimePicker;
    dtDataFim: TCMDateTimePicker;
    Panel2: TPanel;
    Investimento: TLabel;
    dblInvest: TwwDBLookupCombo;
    QryFundoInvest: TwwQuery;
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
  FrmParamCotaIntegrFundo: TFrmParamCotaIntegrFundo;

implementation

uses FDmRelConsCotaIntegrFundo, uOperComum, UBibliotecaInvest, uMensErro;

{$R *.DFM}

//AL_2
procedure TFrmParamCotaIntegrFundo.SetModal(bMod: Boolean);
begin
   bModal := bMod;
end;

procedure TFrmParamCotaIntegrFundo.FormShow(Sender: TObject);
begin
  inherited;
   OperComum.LimpaParametros(QryFundoInvest);
   QryFundoInvest.ParambyName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
   QryFundoInvest.Open;
   pnlFundo.Enabled := True;
   dtDataIni.Date   := date;
   dtDataFim.Date   := date;
end;

procedure TFrmParamCotaIntegrFundo.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   //AL_2 Ini
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

   with DmRelConsCotaIntegrFundo, DmRelConsCotaIntegrFundo.QryCotaIntegrFundo do
   begin
      OperComum.LimpaParametros(QryCotaIntegrFundo);
      If dblInvest.Text <> '' Then
         QryCotaIntegrFundo.ParamByName('IDFUNDOINVEST').AsInteger := StrToInt(dblInvest.lookupvalue);

      QryCotaIntegrFundo.ParamByName('DATAINI').AsString := dtDataini.Text;
      QryCotaIntegrFundo.ParamByName('DATAFIM').AsString := dtDataFim.Text;
      QryCotaIntegrFundo.Open;

      if not IsEmpty then
      begin
         DmRelConsCotaIntegrFundo.lblDtIni.Caption   := dtDataini.Text;
         DmRelConsCotaIntegrFundo.lblDtFinal.Caption := dtDataFim.Text;

         DmRelConsCotaIntegrFundo.rptCotaIntegrFundo.PrinterSetup.DocumentName := 'Consulta de Cotas dos Fundos de Investimentos';
         if not fModal then
            TfrmPreview.CreateModalPreview(Application,
                                           rptCotaIntegrFundo,
                                           rptCotaIntegrFundo.PrinterSetup.DocumentName)
         else
            rptCotaIntegrFundo.PrintToDevices;
      end
      else
         MsgDlg('Nenhuma cotação foi encontrada no período Informando.','Atenção ',mtWarning,[mbOK],0);
      QryCotaIntegrFundo.Close;
   end;
   pnlFundo.Enabled := True;
   if fModal then
      bbtnSair.Click;
   //AL_2 Fim
end;

procedure TFrmParamCotaIntegrFundo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   QryFundoInvest.close;
end;

end.
 