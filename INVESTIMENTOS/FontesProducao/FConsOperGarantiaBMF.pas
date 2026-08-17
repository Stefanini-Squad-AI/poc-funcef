unit FConsOperGarantiaBMF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, Grids, Wwdbigrd, Wwdbgrid, wwdblook, StdCtrls,
  wwdbdatetimepicker, CMDateTimePicker, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, Db, DBTables,
  Wwquery, Wwdatsrc, FPreview;

type
  TFrmConsGarantiaBMF = class(TfrmOkCancelarInv)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    lblInvestimento: TLabel;
    dtDataInicio: TCMDateTimePicker;
    dtDataFim: TCMDateTimePicker;
    Panel2: TPanel;
    dbgOperacoes: TwwDBGrid;
    Panel11: TPanel;
    bbtnImprimir: TBitBtn;
    lblTipoInvest: TLabel;
    dblkTipoInvest: TwwDBLookupCombo;
    dblkInvestimento: TwwDBLookupCombo;
    dblkFundoInvest: TwwDBLookupCombo;
    dblkCartaFianca: TwwDBLookupCombo;
    QryFundoInvest: TwwQuery;
    QryFundoInvestDESCFUNDOINVEST: TStringField;
    QryFundoInvestIDFUNDOINVEST: TFloatField;
    QryInvestimento: TwwQuery;
    QryInvestimentoDESCINVESTIMENTO: TStringField;
    QryInvestimentoIDINVESTIMENTO: TFloatField;
    QryCartaFianca: TwwQuery;
    QryTipoInvest: TwwQuery;
    QryTipoInvestDESCTIPOINVEST: TStringField;
    QryTipoInvestIDTIPOINVEST: TFloatField;
    qry: TwwQuery;
    ds: TwwDataSource;
    qryIDOPERGARANTIABMF: TFloatField;
    qryIDTIPOINVEST: TFloatField;
    qryIDTIPOOPERACAO: TFloatField;
    qryDATAOPERACAO: TDateTimeField;
    qryVLROPERACAO: TFloatField;
    qryQTDOPERACAO: TFloatField;
    qrySLDVLROPERACAO: TFloatField;
    qrySLDQTDOPERACAO: TFloatField;
    qryDESCINVESTIMENTO: TStringField;
    qryDESCTIPOOPERACAO: TStringField;
    qryDESCTIPOINVEST: TStringField;
    QryCartaFiancaIDCARTAFIANCA: TFloatField;
    QryCartaFiancaDESCCARTAFIANCA: TStringField;
    qryIDCARTAFIANCA: TFloatField;
    qryIDFUNDOINVEST: TFloatField;
    qryIDINVESTIMENTO: TFloatField;
    qryDATAVENCTO: TDateTimeField;
    qryVLRCARTAFIANCA: TFloatField;
    ToolbarSep972: TToolbarSep97;
    procedure dblkTipoInvestChange(Sender: TObject);
    procedure TipoInvestChange(iIdTipoInvest:integer);
    procedure ClearInvestimento;
    procedure ClearFundoInvest;
    procedure ClearCartaFianca;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnImprimirClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsGarantiaBMF: TFrmConsGarantiaBMF;

implementation

uses UOperComum,UMensErro,uBibliotecaInvest, FDmRelConsGarantiaBMF;

{$R *.DFM}

procedure TFrmConsGarantiaBMF.dblkTipoInvestChange(Sender: TObject);
begin
  inherited;
   if QryTipoInvestIDTIPOINVEST.IsNull then
      TipoInvestChange(0)
   else
      TipoInvestChange(QryTipoInvestIDTIPOINVEST.AsInteger);
end;

procedure TFrmConsGarantiaBMF.TipoInvestChange(iIdTipoInvest:integer);
begin
   ClearInvestimento;
   ClearFundoInvest;
   ClearCartaFianca;

   if iIdTipoInvest = 0 then // Nenhum
   begin
      dblkCartaFianca.Visible  := True;
      dblkCartaFianca.Enabled := False
   end
   else if iIdTipoInvest = -1 then //Carta de Fiança
   begin
      dblkCartaFianca.Visible  := True;
      lblInvestimento.Caption := 'Investimento : Carta de Fiança';
      OperComum.LimpaParametros(QryCartaFianca);
      QryCartaFianca.Open;
      if dblkCartaFianca.CanFocus then
         dblkCartaFianca.SetFocus;
   end
   else if iIdTipoInvest = 2 then // Renda Variavel
   begin
      dblkInvestimento.Visible := True;
      lblInvestimento.Caption := 'Investimento : Renda Variável';
      OperComum.LimpaParametros(QryInvestimento);
      QryInvestimento.ParamByName('IDTIPOINVEST').AsInteger := QryTipoInvestIDTIPOINVEST.AsInteger;
      QryInvestimento.Open;
      if dblkInvestimento.CanFocus then
         dblkInvestimento.SetFocus;
   end
   else if iIdTipoInvest = 5 then    // Fundo de Renda Fixa
   begin
      dblkFundoInvest.Visible := True;
      lblInvestimento.Caption := 'Investimento : Fundos de Renda Fixa';
      OperComum.LimpaParametros(QryFundoInvest);
      QryFundoInvest.Open;
      if dblkFundoInvest.CanFocus then
         dblkFundoInvest.SetFocus;
   end
   else if iIdTipoInvest = 6 then    // Fundo de Renda Variavel
   begin
      dblkFundoInvest.Visible := True;
      lblInvestimento.Caption := 'Investimento : Fundos de Renda Variável';
      OperComum.LimpaParametros(QryFundoInvest);
      QryFundoInvest.Open;
      if dblkFundoInvest.CanFocus then
         dblkFundoInvest.SetFocus;
   end
   else if iIdTipoInvest = 7 then  // Fundo Imobiliario
   begin
      dblkFundoInvest.Visible := True;
      lblInvestimento.Caption := 'Investimento : Fundos de Renda Imobiliário';
      OperComum.LimpaParametros(QryFundoInvest);
      QryFundoInvest.Open;
      if dblkFundoInvest.CanFocus then
         dblkFundoInvest.SetFocus;
   end;
end;

procedure TFrmConsGarantiaBMF.ClearInvestimento;
begin
   dblkInvestimento.Visible := False;
   OperComum.LimpaParametros(QryInvestimento);
   QryInvestimento.Open;
end;

procedure TFrmConsGarantiaBMF.ClearFundoInvest;
begin
   dblkFundoInvest.Visible  := False;
   QryFundoInvest.Open;
end;

procedure TFrmConsGarantiaBMF.ClearCartaFianca;
begin
   dblkCartaFianca.Visible  := False;
   QryCartaFianca.Open;
end;

procedure TFrmConsGarantiaBMF.FormShow(Sender: TObject);
begin
  inherited;
   qryTipoInvest.Open;
   TipoInvestChange(0);

   dtDataInicio.Text := DateToStr(pRPI.DATAULTFECHBMF);
   dtDataFim.Text := DateToStr(pRPI.DATAULTFECHBMF);
   WindowState := wsMaximized;
end;

procedure TFrmConsGarantiaBMF.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   OperComum.LimpaParametros(qry);
   with qry do
   begin
      if Trim(dtDataInicio.Text) = '' then
      begin
        MsgDlg('Falta a data incial do período.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
        if dtDataInicio.CanFocus then
           dtDataInicio.SetFocus;
        Exit;
      end
      else if Trim(dtDataFim.Text) = '' then
      begin
        MsgDlg('Falta a data final do período.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
        if dtDataFim.CanFocus then
           dtDataFim.SetFocus;
        Exit;
      end
      else
      begin
         ParamByName('dDataIni').AsString := dtDataInicio.Text;
         ParamByName('dDataFim').AsString := dtDataFim.Text;
         if Trim(dblkTipoInvest.Text) = '' then
            ParamByName('IDTIPOINVEST').Clear
         else
            ParamByName('IDTIPOINVEST').AsInteger := QryTipoInvestIDTIPOINVEST.AsInteger;

         if Trim(dblkCartaFianca.Text) = '' then
            ParamByName('IDCARTAFIANCA').Clear
         else
            ParamByName('IDCARTAFIANCA').AsInteger := QryCartaFiancaIDCARTAFIANCA.AsInteger;

         if Trim(dblkInvestimento.Text) = '' then
            ParamByName('IDINVESTIMENTO').Clear
         else
            ParamByName('IDINVESTIMENTO').AsInteger := QryInvestimentoIDINVESTIMENTO.AsInteger;

         if Trim(dblkFundoInvest.Text) = '' then
            ParamByName('IDFUNDOINVEST').Clear
         else
            ParamByName('IDFUNDOINVEST').AsInteger := QryFundoInvestIDFUNDOINVEST.AsInteger;

         Open;
      end;
   end;
end;

procedure TFrmConsGarantiaBMF.bbtnImprimirClick(Sender: TObject);
begin
  inherited;
  DmRelConsGarantiaBMF.pplPeriodo.Caption := 'Período : '+ dtDataInicio.Text + ' a ' + dtDataFim.Text;

  TfrmPreview.CreateModalPreview(Application,
                                 DmRelConsGarantiaBMF.rptConsGarantiaBMF,
                                 DmRelConsGarantiaBMF.rptConsGarantiaBMF.PrinterSetup.DocumentName);

end;

end.
