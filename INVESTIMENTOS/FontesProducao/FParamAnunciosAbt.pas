//********************************************************************************************************
//Data    : 13/10/2005
//Codigo  : AL_2
//Descr.  : Inclusão de Motivo de Bloqueio no relatório, reajuste geral no lay-out
//          Junção dos relatórios Anuncios Recebidos e Anuncios Cancelados
//********************************************************************************************************
//Data    : 28/09/2005
//Codigo  : AL_1
//Descr.  : Ajustes no Lay Out por definição de Ribas/Roseli (Funcef)
//********************************************************************************************************
unit FParamAnunciosAbt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, fcLabel, ExtCtrls, wwdblook, wwdbdatetimepicker,
  CMDateTimePicker, Db, DBTables, Wwquery, FPreview;

type
  TfrmParamAnunciosAbt = class(TfrmOkCancelarInv)
    qryTpOperacao: TwwQuery;
    qryTpOperacaoDESCTIPOOPERACAO: TStringField;
    qryTpOperacaoIDTIPOOPERACAO: TFloatField;
    qryInvestimento: TwwQuery;
    qryInvestimentoDESCINVESTIMENTO: TStringField;
    qryInvestimentoIDINVESTIMENTO: TFloatField;
    DtRef: TCMDateTimePicker;
    Label2: TLabel;
    Label1: TLabel;
    dblkTpOper: TwwDBLookupCombo;
    Label3: TLabel;
    dblkInvest: TwwDBLookupCombo;
    Label4: TLabel;
    DtEX: TCMDateTimePicker;
    procedure DtRefExit(Sender: TObject);
    procedure dblkTpOperExit(Sender: TObject);
    procedure dblkInvestExit(Sender: TObject);
    procedure dblkTpOperCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkInvestCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AbreQuery;
  end;

var
  frmParamAnunciosAbt: TfrmParamAnunciosAbt;

implementation

uses FDmRelAnuncAbt, UOperComum, UBibliotecaInvest, FCadDividendos;

{$R *.DFM}

{ TfrmParamAnunciosAbt }

procedure TfrmParamAnunciosAbt.AbreQuery;
begin
   with DmRelAnuncAbt, DmRelAnuncAbt.qryAnunciosAbt, OperComum do
   begin
      LimpaParametros(qryAnunciosAbt);
      if Trim(DtRef.Text) <> '' then
         ParamByName('DATAREF').AsString := DtRef.Text;
      if Trim(DtEX.Text) <> '' then
         ParamByName('DATAEX').AsString := DtEX.Text;
      if Trim(dblkTpOper.Text) <> '' then
         ParamByName('IDTIPOOPERACAO').AsInteger := qryTpOperacaoIDTIPOOPERACAO.AsInteger;
      if Trim(dblkInvest.Text) <> '' then
         ParamByName('IDINVESTIMENTO').AsInteger := qryInvestimentoIDINVESTIMENTO.AsInteger;
      // AL_2 - Inicio
      if ExisteForm(frmCadDividendos) then
      begin
         ParamByName('TIPOREL').AsString := frmCadDividendos.sTipoRel;
         if frmCadDividendos.sTipoRel = 'A' then
            rptAnunciosAbt.PrinterSetup.DocumentName := 'Anúncio de Proventos em Aberto'
         else if frmCadDividendos.sTipoRel = 'R' then
            rptAnunciosAbt.PrinterSetup.DocumentName := 'Anúncio de Proventos Recebidos'
         else if frmCadDividendos.sTipoRel = 'C' then
            rptAnunciosAbt.PrinterSetup.DocumentName := 'Anúncio de Proventos Cancelados';
      end
      else
      begin
         ParamByName('TIPOREL').AsString := 'A';
         rptAnunciosAbt.PrinterSetup.DocumentName := 'Anúncio de Proventos em Aberto'
      end;
      // AL_2 - Fim
      Open;
      if IsEmpty then
         bbtnConfirmar.Enabled := False
      else
         bbtnConfirmar.Enabled := True;
   end;
end;

procedure TfrmParamAnunciosAbt.DtRefExit(Sender: TObject);
begin
   inherited;
   AbreQuery;
end;

procedure TfrmParamAnunciosAbt.dblkTpOperExit(Sender: TObject);
begin
   inherited;
   AbreQuery;
end;

procedure TfrmParamAnunciosAbt.dblkInvestExit(Sender: TObject);
begin
   inherited;
   AbreQuery;
end;

procedure TfrmParamAnunciosAbt.dblkTpOperCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   if modified then
      AbreQuery;
end;

procedure TfrmParamAnunciosAbt.dblkInvestCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   if modified then
      AbreQuery;
end;

procedure TfrmParamAnunciosAbt.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;

   // Força a saída do componente atual para acionar o OnExit deste componente
   //    no caso de teclar enter e o botão for default
   SelectNext(ActiveControl,True,True);
   with DmRelAnuncAbt do
   begin
      lblFiltros.Caption   := '';
      if Trim(DtRef.Text) <> '' then
         lblFiltros.Caption   := 'Data Referência: ' + Trim(DtRef.Text) + ' ';
      if Trim(DtEX.Text) <> '' then
         lblFiltros.Caption   := lblFiltros.Caption + 'Data EX: ' + Trim(DtEX.Text) + ' ';
      if Trim(dblkTpOper.Text) <> '' then
         lblFiltros.Caption   := lblFiltros.Caption + 'Tipo de Operação: ' + dblkTpOper.Text + ' ';
      if Trim(dblkInvest.Text) <> '' then
         lblFiltros.Caption   := lblFiltros.Caption + 'Investimento: ' + dblkInvest.Text + ' ';

      qryAnunciosAbt.DisableControls;

      TFrmPreview.CreateModalPreview(Application,
                                     rptAnunciosAbt,
                                     rptAnunciosAbt.PrinterSetup.DocumentName);
      qryAnunciosAbt.EnableControls;
   end;
   bbtnSair.Click;
end;

procedure TfrmParamAnunciosAbt.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   OperComum.LimpaParametros(DmRelAnuncAbt.qryAnunciosAbt);
   DtRef.Clear;
   dblkTpOper.Clear;
   dblkInvest.Clear;
end;

procedure TfrmParamAnunciosAbt.FormShow(Sender: TObject);
begin
  qryTpOperacao.Open;
  qryInvestimento.Open;
  inherited;
  // AL_2
  if ExisteForm(frmCadDividendos) then
  begin
     if frmCadDividendos.sTipoRel = 'A' then
        lbNomDescricao.Caption := 'Anúncio de Proventos em Aberto'
     else if frmCadDividendos.sTipoRel = 'R' then
        lbNomDescricao.Caption := 'Anúncio de Proventos Recebidos'
     else if frmCadDividendos.sTipoRel = 'C' then
        lbNomDescricao.Caption := 'Anúncio de Proventos Cancelados';
     frmCadDividendos.WindowState := wsMaximized;
  end;
end;

procedure TfrmParamAnunciosAbt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  OperComum.LimpaParametros(DmRelAnuncAbt.qryAnunciosAbt);
  qryTpOperacao.Close;
  qryInvestimento.Close;
  inherited;
end;

end.
