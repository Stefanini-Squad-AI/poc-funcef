//******************************************************************************
// Data      : 10/03/2006
// Alteração : AL_4
// Pendencia :
// SOL       :
// Motivo    : Acerto na abertura da consulta pelo menu de relatórios que estava apresentando
//             mensagem de erro (Modal)
//******************************************************************************
// Data      : 23/01/2006
// Alteração : AL_3
// Pendencia : 21262
// SOL       : 39834
// Motivo    : Implementação de limitação de prazo entre as datas inicial e final em 30 dias
//             Diminuição no processamento da query, passando a resolução para
//               dentro da query basica.
//******************************************************************************
// Data      : 29/03/2005
// Alteração : AL_2
// Motivo    : Try / Finally no botão OK e acerto de lay-out
//******************************************************************************
// Data      : 08/03/2005
// Alteração : AL_1
// Motivo    : Acerto na troca de cores do Grid
//******************************************************************************

unit FConsLanContPerRF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, fcLabel, ExtCtrls, Db, Wwdatsrc, DBTables, Wwquery,
  Grids, Wwdbigrd, Wwdbgrid, wwdbdatetimepicker, CMDateTimePicker, FPreview,
  wwdblook, faMensagem, DBClient, uCMClientDataSet, Provider;

type
  TfrmConsLanContPerRF = class(TfrmOkCancelarInv)
    pnlDados: TPanel;
    lblDtIni: TLabel;
    dtDataIni: TCMDateTimePicker;
    dbgLanContPerRF: TwwDBGrid;
    bbtnImprimir: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    dblInvestimento: TwwDBLookupCombo;
    lblInvestimento: TLabel;
    dblOperacao: TwwDBLookupCombo;
    lblOperacao: TLabel;
    fraMensLanContRF: TfraMensagem;
    lblDtFim: TLabel;
    dtDataFim: TCMDateTimePicker;
    dsLanContPerRFLocal: TwwDataSource;
    dspLancContPerRFLocal: TDataSetProvider;
    cdsLancContPerRFLocal: TCMClientDataSet;
    procedure dbgLanContPerRFDrawDataCell(Sender: TObject; const Rect: TRect; Field: TField; State: TGridDrawState);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblInvestimentoExit(Sender: TObject);
    procedure dblInvestimentoChange(Sender: TObject);
    procedure dtDataIniExit(Sender: TObject);
    procedure dtDataFimExit(Sender: TObject);
  private
    { Private declarations }
     //AL_4
     bModal: Boolean;
     procedure BuscaOperacoesXInvest(iIdInvestimento: Integer);
     function ValidaCampos : boolean;
     //AL_4
    procedure SetModal(bMod: Boolean);
  public
    { Public declarations }
  published
    { Published declarations }
     //AL_4
     Property fModal: boolean read bModal write SetModal;
  end;

var
  frmConsLanContPerRF: TfrmConsLanContPerRF;
  sInvestimento : String;
  clCorLinha: TColor;
  //AL_1
  sData : String;

const clCorAmarelo: TColor = $00C0FFFF;


implementation

uses UOperComum, FDmRelLanContPerRF, UBibliotecaInvest, uSistema, uMensErro, uString,
  UDiasUteisInv;

{$R *.DFM}

procedure TfrmConsLanContPerRF.dbgLanContPerRFDrawDataCell(Sender: TObject; const Rect: TRect; Field: TField; State: TGridDrawState);
begin
   inherited;
   if not ((gdSelected in State) or (gdFixed in State)) then
   begin
      dbgLanContPerRF.Canvas.Brush.Color := DmRelLanContPerRF.qryLancContPerRFCOR.AsInteger;
      dbgLanContPerRF.Canvas.Font.Color := clBlack;
      dbgLanContPerRF.DefaultDrawDataCell(Rect, Field, State);
   end
   else if (gdSelected in State) or (gdFocused in State) then
   begin
      dbgLanContPerRF.Canvas.Brush.Color := DmRelLanContPerRF.qryLancContPerRFCOR.AsInteger;
      dbgLanContPerRF.Canvas.Font.Color := clBlack;
      dbgLanContPerRF.DefaultDrawDataCell(Rect, Field, State);
   end;
end;

procedure TfrmConsLanContPerRF.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  with DmRelLanContPerRF do
  begin
     OperComum.LimpaParametros(DmRelLanContPerRF.qryLancContPerRF);
     DmRelLanContPerRF.qryLancContPerRF.Open;
  end;
  bbtnImprimir.Enabled := False;
end;

procedure TfrmConsLanContPerRF.bbtnImprimirClick(Sender: TObject);
var cCursorAtual: TCursor;
begin
   inherited;
   // AL_03
   try
      DmRelLanContPerRF.qryLancContPerRF.DisableControls;
      cCursorAtual := Screen.Cursor;
      Screen.Cursor := crHourglass;
      bbtnImprimir.Enabled := False;
      fraMensLanContRF.Mostra;
      fraMensLanContRF.Mes := 'Aguarde... Preparando relatório...';
      Application.ProcessMessages;

      DmRelLanContPerRF.pplblPeriodo.Caption := 'Período : ' + dtDataIni.Text + ' a ' + dtDataFim.Text;
      //AL_4
      if not bModal then
         TfrmPreview.CreateModalPreview(Application,
                                        DmRelLanContPerRF.pprLanContPerRF,
                                        DmRelLanContPerRF.pprLanContPerRF.PrinterSetup.DocumentName)
      else
         DmRelLanContPerRF.pprLanContPerRF.PrintToDevices;
   finally
      Screen.Cursor := cCursorAtual;
      bbtnImprimir.Enabled := True;
      fraMensLanContRF.Apaga;
      DmRelLanContPerRF.qryLancContPerRF.EnableControls;
      Application.ProcessMessages;
   end;
   //AL_03
   //AL_4
   if bModal then
      bbtnSair.Click;
end;

procedure TfrmConsLanContPerRF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   DmRelLanContPerRF.qryLancContPerRF.Close;
   DmRelLanContPerRF.qryInvestimento.Close;
   DmRelLanContPerRF.qryOperacao.Close;
end;

procedure TfrmConsLanContPerRF.FormCreate(Sender: TObject);
begin
  inherited;
   WindowState := wsMaximized;
end;

procedure TfrmConsLanContPerRF.FormShow(Sender: TObject);
begin
   inherited;
   fraMensLanContRF.Apaga;
   dtDataIni.Date := pRPI.DATAULTFECHRF;
   dtDataFim.Date := pRPI.DATAULTFECHRF;
   DmRelLanContPerRF.qryInvestimento.Open;
   OperComum.LimpaParametros(DmRelLanContPerRF.qryOperacao);
   DmRelLanContPerRF.qryOperacao.Open;
end;

procedure TfrmConsLanContPerRF.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   if not ValidaCampos then
      Exit;

   // AL_2
   try // finally
      DmRelLanContPerRF.qryLancContPerRF.DisableControls;

      fraMensLanContRF.Width := (frmConsLanContPerRF.Width - (TB97oKCancelar.Width + tb97Fundo.Width + 10));
      fraMensLanContRF.pnlProgressoMensagem.Width := Trunc((frmConsLanContPerRF.Width - (TB97oKCancelar.Width + tb97Fundo.Width + 10))/2);
      fraMensLanContRF.Mostra;
      fraMensLanContRF.Mes := 'Buscando Lançamentos Contabeis...';
      Application.ProcessMessages;

      OperComum.LimpaParametros(DmRelLanContPerRF.qryLancContPerRF);
      DmRelLanContPerRF.qryLancContPerRF.ParamByName('DATAINI').AsString := dtDataIni.Text;
      DmRelLanContPerRF.qryLancContPerRF.ParamByName('DATAFIM').AsString := dtDataFim.Text;
      if Trim(dblInvestimento.Text) <> '' then
         DmRelLanContPerRF.qryLancContPerRF.ParamByName('IDINVESTIMENTO').AsInteger := StrToInt(dblInvestimento.LookupValue);
      if Trim(dblOperacao.Text) <> '' then
         DmRelLanContPerRF.qryLancContPerRF.ParamByName('IDOPERRENFIXAPLIC').AsInteger := StrToInt(dblOperacao.LookupValue);
      DmRelLanContPerRF.qryLancContPerRF.Open;

      sInvestimento := '';
      sData         := '';
      clCorLinha := clWhite;
      fraMensLanContRF.Max := DmRelLanContPerRF.qryLancContPerRF.RecordCount;

      while not DmRelLanContPerRF.qryLancContPerRF.Eof do
      begin
         fraMensLanContRF.Mes := 'Processando Lançamentos Contabeis...' + DmRelLanContPerRF.qryLancContPerRFDATA.AsString + #13 +
                                 DmRelLanContPerRF.qryLancContPerRFIDINVESTIMENTO.AsString;
         Application.ProcessMessages;
         //AL_1
         if not ((DmRelLanContPerRF.qryLancContPerRFIDINVESTIMENTO.AsString = sInvestimento) and
                 (DmRelLanContPerRF.qryLancContPerRFDATA.AsString = sData)) then
         begin
            if clCorLinha = clCorAmarelo then
               clCorLinha := clWhite
            else
               clCorLinha := clCorAmarelo;

            sInvestimento := DmRelLanContPerRF.qryLancContPerRFIDINVESTIMENTO.AsString;
            sData         := DmRelLanContPerRF.qryLancContPerRFDATA.AsString;
         end;
         //AL_3
         DmRelLanContPerRF.qryLancContPerRF.Edit;
         DmRelLanContPerRF.qryLancContPerRFCOR.AsInteger := clCorLinha;

         DmRelLanContPerRF.qryLancContPerRF.Post;

         DmRelLanContPerRF.qryLancContPerRF.Next;
         fraMensLanContRF.Incrementa;
         Application.ProcessMessages;
      end;

      DmRelLanContPerRF.qryLancContPerRF.First;

      if not DmRelLanContPerRF.qryLancContPerRF.Eof then
         bbtnImprimir.Enabled := True
      else
         bbtnImprimir.Enabled := False;

      fraMensLanContRF.Apaga;
      Application.ProcessMessages;
   finally
      DmRelLanContPerRF.qryLancContPerRF.EnableControls;
   end;
end;

procedure TfrmConsLanContPerRF.dblInvestimentoExit(Sender: TObject);
begin
  inherited;
   if dblInvestimento.LookupValue <> '' then
   BuscaOperacoesXInvest(StrToInt(dblInvestimento.LookupValue));
end;

procedure TfrmConsLanContPerRF.dblInvestimentoChange(Sender: TObject);
begin
  inherited;
  if dblInvestimento.LookupValue <> '' then
     BuscaOperacoesXInvest(StrToInt(dblInvestimento.LookupValue));
end;

procedure TfrmConsLanContPerRF.BuscaOperacoesXInvest(iIdInvestimento: Integer);
begin
  inherited;
   DmRelLanContPerRF.qryLancContPerRF.Close;
   OperComum.LimpaParametros(DmRelLanContPerRF.qryOperacao);
   if Trim(dblInvestimento.Text) <> '' then
      DmRelLanContPerRF.qryOperacao.ParamByName('IDINVESTIMENTO').AsInteger := iIdInvestimento
   else
      DmRelLanContPerRF.qryOperacao.ParamByName('IDINVESTIMENTO').AsInteger := -1;
   DmRelLanContPerRF.qryOperacao.Open;
end;

function TfrmConsLanContPerRF.ValidaCampos : boolean;
begin
   Result := True;

   if Trim(dtDataIni.Text) = '' then
   begin
      MsgDlg('Data Inicial não informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dtDataIni.CanFocus then
         dtDataIni.SetFocus;
      Result := False;
      Exit;
   end
   else if Trim(dtDataFim.Text) = '' then
   begin
      MsgDlg('Data Final não informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dtDataFim.CanFocus then
         dtDataFim.SetFocus;
      Result := False;
      Exit;
   end
   else
   if dtDataFim.Date < dtDataIni.Date then
   begin
      MsgDlg('Data Final não pode ser menor que a Inicial.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dtDataFim.CanFocus then
         dtDataFim.SetFocus;
      Result := False;
      Exit;
   end
   // AL_3
   else
   if dtDataFim.Date > DiasUteisInv.SomaDias(dtDataIni.Date, 30) then
   begin
      MsgDlg('Data Final não pode ser mais de 30 dias maior que a Inicial.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dtDataFim.CanFocus then
         dtDataFim.SetFocus;
      Result := False;
      Exit;
   end;
end;

procedure TfrmConsLanContPerRF.dtDataIniExit(Sender: TObject);
begin
  inherited;
   if dtDataFim.Date < dtDataIni.Date then
   begin
      MsgDlg('Data Final não pode ser menor que a Inicial.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dtDataFim.CanFocus then
         dtDataFim.SetFocus;
      dtDataFim.Date := dtDataIni.Date
   end;
end;

procedure TfrmConsLanContPerRF.dtDataFimExit(Sender: TObject);
begin
  inherited;
   if dtDataFim.Date < dtDataIni.Date then
   begin
      MsgDlg('Data Final não pode ser menor que a Inicial.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dtDataFim.CanFocus then
         dtDataFim.SetFocus;
      dtDataFim.Date := dtDataIni.Date
   end;
end;

//AL_4
procedure TfrmConsLanContPerRF.SetModal(bMod: Boolean);
begin
   bModal := bMod;
end;

end.

