//*****************************************************************************//
// Data      : 15/04/2010
// SOL       : 126954/1321
// Kintana   : 782044
// Motivo    : Foi inserida a coluna "Valor a Receber" onde foi somado
//             os valores da "Remuneração" e "Valor do Anúncio"
//             no relatório de "Anúncios de Proventos no Período".
//             O título existente da coluna "Valor a Receber"
//             foi alterado para "Valor do Anúncio".
//*****************************************************************************//
// Data      : 09/08/2007
// Código    : AL_4
// Pendência : 24957
// SOL       : 56201
// Motivo    : Implementação do Relatório Consolidado por Investimento
//******************************************************************************
// Data     : 31/10/2006
// Pendencia: 23665
// Código   : AL_3
// Descrição: Segregação de Planos - DFM
//******************************************************************************
// Data     : 11/07/2005
// Código   : AL_2
// Motivo   : Implementação de Cor Zebrada no Grid
//******************************************************************************
// Data     : 28/06/2005
// Código   : AL_1
// Motivo   : Implementação do Relatório de Consulta Anúncios no Período
//******************************************************************************

unit FConsAnuncPeriodo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarRelInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook, FPreview, Db;

type
  TfrmConsAnuncPeriodo = class(TfrmOkCancelarRelInv)
    pnlConsulta: TPanel;
    lblTipoAnunc: TLabel;
    lblInvestimento: TLabel;
    lblDtIni: TLabel;
    dblkInvest: TwwDBLookupCombo;
    dblkTipoAnuncio: TwwDBLookupCombo;
    dtDataIni: TCMDateTimePicker;
    dbgAnuncRel: TwwDBGrid;
    dtDataFim: TCMDateTimePicker;
    lblDtFim: TLabel;
    lblTipoOper: TLabel;
    dblkTipoOper: TwwDBLookupCombo;
    dblPlanoPrev: TwwDBLookupCombo;
    Label5: TLabel;
    ChBxConsolidadoInvest: TCheckBox;
    Label6: TLabel;
    dblSegmentacao: TwwDBLookupCombo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bt_ImprimeClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblkInvestCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dbgAnuncRelCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbgAnuncRelTopRowChanged(Sender: TObject);
    procedure ChBxConsolidadoInvestClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AbreQuery;    
  end;

var
  frmConsAnuncPeriodo: TfrmConsAnuncPeriodo;

implementation

uses UOperComum, FDmRelAnuncPeriodo, UMensErro;

{$R *.DFM}

procedure TfrmConsAnuncPeriodo.AbreQuery;
begin
   if Trim(dtDataIni.Text) = '' then
   begin
      MsgDlg('Data Inicial não informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dtDataIni.CanFocus then
         dtDataIni.SetFocus;
      Exit;
   end
   else if Trim(dtDataFim.Text) = '' then
   begin
      MsgDlg('Data Final não informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dtDataFim.CanFocus then
         dtDataFim.SetFocus;
      Exit;
   end
   else if dtDataFim.Date < dtDataIni.Date then
   begin
      MsgDlg('A Data Final não pode ser menor que a Inicial.','Mensagem do Sistema',mtWarning,[MbOk],0);
      dtDataFim.Text := dtDataIni.Text;
      if dtDataFim.CanFocus then
         dtDataFim.SetFocus;
      Exit;
   end;

   // AL_18
   DmRelAnuncPeriodo.qryAnuncPeriodo.DisableControls; // Fim AL_18

   with DmRelAnuncPeriodo, DmRelAnuncPeriodo.qryAnuncPeriodo, OperComum do
   begin
      LimpaParametros(qryAnuncPeriodo);
      if Trim(dtDataIni.Text) <> '' then
         ParamByName('DATAINI').AsString := dtDataIni.Text;
      if Trim(dtDataFim.Text) <> '' then
         ParamByName('DATAFIM').AsString := dtDataFim.Text;
      //AL_3
      if Trim(dblPlanoPrev.Text) <> '' then
         ParamByName('IDPLANPREVCTBPATR').AsInteger := qryPlanoPrevIDPLANPREVCTBPATR.AsInteger;
      if Trim(dblkTipoOper.Text) <> '' then
         ParamByName('IDTIPOOPERACAO').AsInteger := qryTipoOperacaoIDTIPOOPERACAO.AsInteger;
      if Trim(dblkTipoAnuncio.Text) <> '' then
         ParamByName('IDTIPOANUNCIO').AsInteger  := qryTipoAnuncioIDTIPOOPERACAO.AsInteger;
      if Trim(dblkInvest.Text) <> '' then
         ParamByName('IDINVESTIMENTO').AsInteger := qryInvestimentoIDINVESTIMENTO.AsInteger;
      //Renan Cristiano Sol 131501/1101 Kintana 760170 Inicio
      if Trim(dblSegmentacao.Text) <> '' then
         ParamByName('IDSEGMENTACAO').AsInteger := QrySegmentacaoIDSEGMENTACAO.AsInteger;
      //Renan Cristiano Sol 131501/1101 Kintana 760170 Fim

      ParamByName('TIPODATA').AsInteger := OperComum.RetornaDataDivConsulta(StrToDate(dtDataIni.Text));
      Open;

      // AL_18
      EnableControls; // Fim AL_18

   end;
   // AL_18
   If ChBxConsolidadoInvest.checked then
   Begin
      OperComum.LimpaParametros(DmRelAnuncPeriodo.qryAnuncPeriodoCon);
      DmRelAnuncPeriodo.qryAnuncPeriodoCon.Sql.Clear;
      if Not DmRelAnuncPeriodo.qryAnuncPeriodo.IsEmpty then
      begin
         DmRelAnuncPeriodo.qryAnuncPeriodoCon.Sql.Add('SELECT * '+ #13);
         DmRelAnuncPeriodo.qryAnuncPeriodoCon.Sql.Add('FROM ( ' + #13);
         DmRelAnuncPeriodo.qryAnuncPeriodoCon.Sql.Add( '' + #13);
         DmRelAnuncPeriodo.qryAnuncPeriodoCon.Sql.Add(DmRelAnuncPeriodo.qryAnuncPeriodo.Sql.GetText);
         DmRelAnuncPeriodo.qryAnuncPeriodoCon.Sql.Add( '' + #13);
         DmRelAnuncPeriodo.qryAnuncPeriodoCon.Sql.Add( ' ) ' + #13);
         DmRelAnuncPeriodo.qryAnuncPeriodoCon.Sql.Add( 'ORDER BY IDSEGMENTACAO, DESCINVESTIMENTO,DESCTIPOOPERACAO,DESCANUNCIO,DATAOPER,BOLETA' + #13);
         // Passando os parâmetros
         if Trim(dtDataIni.Text) <> '' then
            DmRelAnuncPeriodo.qryAnuncPeriodoCon.ParamByName('DATAINI').AsString := dtDataIni.Text
         else
            DmRelAnuncPeriodo.qryAnuncPeriodoCon.ParamByName('DATAINI').DataType := ftString;
         if Trim(dtDataFim.Text) <> '' then
            DmRelAnuncPeriodo.qryAnuncPeriodoCon.ParamByName('DATAFIM').AsString := dtDataFim.Text
         else
            DmRelAnuncPeriodo.qryAnuncPeriodoCon.ParamByName('DATAFIM').DataType := ftString;

         if Trim(dblkTipoOper.Text) <> '' then
            DmRelAnuncPeriodo.qryAnuncPeriodoCon.ParamByName('IDTIPOOPERACAO').AsInteger := StrToInt(dblkTipoOper.LookupValue)
         else
            DmRelAnuncPeriodo.qryAnuncPeriodoCon.ParamByName('IDTIPOOPERACAO').DataType  := ftInteger;
         if Trim(dblkInvest.Text) <> '' then
            DmRelAnuncPeriodo.qryAnuncPeriodoCon.ParamByName('IDINVESTIMENTO').AsInteger := StrToInt(dblkInvest.LookupValue)
         else
            DmRelAnuncPeriodo.qryAnuncPeriodoCon.ParamByName('IDINVESTIMENTO').DataType := ftInteger;
         if Trim(dblkTipoAnuncio.Text) <> '' then
            DmRelAnuncPeriodo.qryAnuncPeriodoCon.ParamByName('IDTIPOANUNCIO').AsInteger  := DmRelAnuncPeriodo.qryTipoAnuncioIDTIPOOPERACAO.AsInteger
         else
            DmRelAnuncPeriodo.qryAnuncPeriodoCon.ParamByName('IDTIPOANUNCIO').DataType := ftInteger;
         //Renan Cristiano Sol 131501/1101 Kintana 760170 Inicio
         if Trim(dblSegmentacao.Text) <> '' then
            DmRelAnuncPeriodo.qryAnuncPeriodoCon.ParamByName('IDSEGMENTACAO').AsInteger := StrToInt(dblSegmentacao.LookupValue)
         else
            DmRelAnuncPeriodo.qryAnuncPeriodoCon.ParamByName('IDSEGMENTACAO').DataType := ftInteger;
         //Renan Cristiano Sol 131501/1101 Kintana 760170 Fim

         DmRelAnuncPeriodo.qryAnuncPeriodoCon.ParamByName('IDPLANPREVCTBPATR').DataType := ftInteger;

         DmRelAnuncPeriodo.qryAnuncPeriodoCon.ParamByName('TIPODATA').AsInteger := OperComum.RetornaDataDivConsulta(StrToDate(dtDataIni.Text));

         DmRelAnuncPeriodo.qryAnuncPeriodoCon.Open;


      end;
   end;   // Fim AL_18

end;

procedure TfrmConsAnuncPeriodo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   DmRelAnuncPeriodo.qryTipoOperacao.Close;
   DmRelAnuncPeriodo.qryInvestimento.Close;
   DmRelAnuncPeriodo.qryTipoAnuncio.Close;
   //AL_3
   DmRelAnuncPeriodo.qryPlanoPrev.Close;
   DmRelAnuncPeriodo.QrySegmentacao.Close; //Renan Cristiano Sol 131501/1101 Kintana 760170 

   DmRelAnuncPeriodo.qryAnuncPeriodo.Close;
   //AL_4
   DmRelAnuncPeriodo.qryAnuncPeriodoCon.Close
end;

procedure TfrmConsAnuncPeriodo.FormShow(Sender: TObject);
begin
  inherited;
   //AL_3
   DmRelAnuncPeriodo.qryPlanoPrev.Open;
   DmRelAnuncPeriodo.qryTipoOperacao.Open;
   DmRelAnuncPeriodo.qryInvestimento.Open;
   DmRelAnuncPeriodo.qryTipoAnuncio.Open;
   //Renan Cristiano Sol 131501/1101 Kintana 760170 Inicio
   OperComum.LimpaParametros(DmRelAnuncPeriodo.qrySegmentacao);
   DmRelAnuncPeriodo.qrySegmentacao.ParamByName('GRUPO').AsInteger := 2;//Renda Variavel
   DmRelAnuncPeriodo.qrySegmentacao.Open;
   //Renan Cristiano Sol 131501/1101 Kintana 760170 Fim
end;

procedure TfrmConsAnuncPeriodo.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   OperComum.LimpaParametros(DmRelAnuncPeriodo.qryAnuncPeriodo);
end;

procedure TfrmConsAnuncPeriodo.bt_ImprimeClick(Sender: TObject);
begin
  inherited;
   // Força a saída do componente atual para acionar o OnExit deste componente
   //    no caso de teclar enter e o botão for default
   SelectNext(ActiveControl,True,True);
   //AL_1
   If ChBxConsolidadoInvest.Checked then
   begin

         DmRelAnuncPeriodo.LblPeriodoCon.Caption   := 'Período : ' + dtDataIni.Text + ' a ' + dtDataFim.Text;

         TFrmPreview.CreateModalPreview(Application,
                                        DmRelAnuncPeriodo.rptAnuncPeriodoCon,
                                        DmRelAnuncPeriodo.rptAnuncPeriodoCon.PrinterSetup.DocumentName);


   end
   else
   begin //Fim AL_1
      with DmRelAnuncPeriodo do
      begin
         lblPeriodo.Caption   := 'Período : ' + dtDataIni.Text + ' a ' + dtDataFim.Text;

         qryAnuncPeriodo.DisableControls;

         TFrmPreview.CreateModalPreview(Application,
                                        rptAnuncPeriodo,
                                        rptAnuncPeriodo.PrinterSetup.DocumentName);

         qryAnuncPeriodo.EnableControls;
      end;
   end; // AL_1
end;

procedure TfrmConsAnuncPeriodo.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   AbreQuery;
end;

procedure TfrmConsAnuncPeriodo.dblkInvestCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
end;

//AL_2
procedure TfrmConsAnuncPeriodo.dbgAnuncRelCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  // faz com que as linhas do grid tenham cores alternadas
  if State <> [gdSelected] then begin
     if not Highlight then begin
        // linhas ímpares = amarelo, linhas pares = branco
        if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
           ABrush.Color := $00C0FFFF; // amarelo bebê
        end else begin
           ABrush.Color := clWhite;
        end;
     end;
  end else begin
     ABrush.Color := clHighLight;
     AFont.Color  := clHighLightText;
  end;
end;

procedure TfrmConsAnuncPeriodo.dbgAnuncRelTopRowChanged(Sender: TObject);
begin
  inherited;
  // AL_3
  TwwDBGrid(Sender).Invalidate;
end;

// AL_4
procedure TfrmConsAnuncPeriodo.ChBxConsolidadoInvestClick(Sender: TObject);
begin
  inherited;
  dblPlanoPrev.Clear;
  If (ChBxConsolidadoInvest.checked) and Not(DmRelAnuncPeriodo.qryAnuncPeriodo.IsEmpty)then
     bbtnConfirmarClick(Self);
end;

end.
