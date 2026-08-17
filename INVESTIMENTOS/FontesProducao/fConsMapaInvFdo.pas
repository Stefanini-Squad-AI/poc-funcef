//******************************************************************************
// Data      : 09/08/2007
// Código    : AL_9
// Pendencia : 25761
// SOL       : 63520 / 63519
// Desc      : Retirado a implementação para buscar o IOF pago
//******************************************************************************
// Data      : 01/08/2007
// Código    : AL_8
// Pendencia : 25761
// SOL       : 63520 / 63519
// Desc      : Implementação para buscar o IOF pago
//******************************************************************************
// Data      : 28/06/2006
// Código    : AL_7
// Pendencia :
// SOL       :
// Motivo    : Ajuste no layout retirada as colunas de transf. por plano
//             e introduzida apenas a coluna de Transferência.
//******************************************************************************
// Data      : 09/06/2006
// Código    : AL_6
// Pendencia : 22439
// SOL       : 43516
// Motivo    : Implementação da coluna de Transferëncia de Planos
//******************************************************************************
// Data      : 07/06/2006
// Código    : AL_5
// Pendencia :
// SOL       :
// Motivo    : Alteração do local de abertura da query analitica. Passa a ser
//             junto com a Sintetica
//******************************************************************************
// Data      : 06/04/2006
// Código    : AL_4
// Pendencia : 21579
// SOL       :
// Motivo    : Implementação da descrição do tipo de investimento no nome do relatório
//******************************************************************************
// Data      : 22/11/2005
// Código    : AL_3
// Motivo    : Melhora na performace do relatório
//******************************************************************************
// Data      : 02/09/2005
// Código    : AL_2
// Motivo    : Acerto no layout das combos
//******************************************************************************
// Data      : 09/08/2005
// Código    : AL_2
// Motivo    : Acerto na passagem de parametro de dataanterior pra ultimo dia util
//******************************************************************************

unit FConsMapaInvFdo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarRelInv, Grids, Wwdbigrd, Wwdbgrid, wwdblook, StdCtrls,
  wwdbdatetimepicker, CMDateTimePicker, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, Db, DBTables,
  FPreview;

type
  TfrmConsMapaInvFdo = class(TfrmOkCancelarRelInv)
    pnlDados: TPanel;
    lblDtIni: TLabel;
    lblDtFim: TLabel;
    dtDataIni: TCMDateTimePicker;
    dtDataFim: TCMDateTimePicker;
    dbgLanContPerRF: TwwDBGrid;
    lblPlanoPatro: TLabel;
    dblPlanPrevCtbPatr: TwwDBLookupCombo;
    lblFundoInvest: TLabel;
    dblkFundoInvest: TwwDBLookupCombo;
    dblSegmentacao: TwwDBLookupCombo;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dbgLanContPerRFCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure bt_ImprimeClick(Sender: TObject);
    //Al_3
    procedure dblkFundoInvestExit(Sender: TObject);
    procedure dblkFundoInvestCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
     procedure AbreQry;
  public
    { Public declarations }
  end;

var
  frmConsMapaInvFdo: TfrmConsMapaInvFdo;

implementation

uses FDmRelMapaInvFdo, UOperComum, UMensErro, UBibliotecaInvest, UDiasUteisInv;

{$R *.DFM}

procedure TfrmConsMapaInvFdo.FormShow(Sender: TObject);
begin
  inherited;

   with OperComum, DmRelMapaInvFdo do
   begin
      LimpaParametros(qryPlanPrevCtbPatr);
      qryPlanPrevCtbPatr.Open;

      OperComum.LimpaParametros(qrySegmentacao);
      qrySegmentacao.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
      qrySegmentacao.Open;

      OperComum.LimpaParametros(QryTipoFundo);
      QryTipoFundo.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
      QryTipoFundo.Open;
      if QryTipoFundo.RecordCount = 1 then
         dtDataIni.Text := QryTipoFundo.FieldByNAme('DATAULTFECH').AsString
      else
      begin
         While Not QryTipoFundo.Eof do
         begin
            if QryTipoFundo.FieldByName('DATAULTFECH').AsDateTime > dtDataIni.Date then
               dtDataIni.Text := QryTipoFundo.FieldByName('DATAULTFECH').AsString;
            QryTipoFundo.Next;
         end;
         QryTipoFundo.First;
      end;

      dtDataFim.Text := dtDataIni.Text;

      OperComum.LimpaParametros(qryFundoInvest);
      qryFundoInvest.ParamByName('DATAFIM').AsString := DateToStr(Now);
      qryFundoInvest.Open;

   end;
end;

procedure TfrmConsMapaInvFdo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   OperComum.LimpaParametros(DmRelMapaInvFdo.qryPlanPrevCtbPatr);
   OperComum.LimpaParametros(DmRelMapaInvFdo.qrySegmentacao);
   OperComum.LimpaParametros(DmRelMapaInvFdo.qryFundoInvest);
   OperComum.LimpaParametros(DmRelMapaInvFdo.qryMapaInvFdoSintetico);
   OperComum.LimpaParametros(DmRelMapaInvFdo.qryMapaInvFdoAnalitico);
end;

procedure TfrmConsMapaInvFdo.FormCreate(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;
end;

procedure TfrmConsMapaInvFdo.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   AbreQry;
end;

procedure TfrmConsMapaInvFdo.AbreQry;
var
   //AL_2
   dDataAnt : TDateTime;
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
   else if (dtDataFim.Date < dtDataIni.Date) then
   begin
      MsgDlg('A Data Final não pode ser menor que a Data Inicial.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dtDataFim.CanFocus then
         dtDataFim.SetFocus;
      Exit;
   end;

   //Al_3

   with DmRelMapaInvFdo do
   begin
      dDataAnt := DiasUteisInv.UltDiaUtilAnterior(StrToDate(dtDataIni.Text),-1,1,'',True,False,False);

      try
         qryMapaInvFdoSintetico.DisableControls;
         qryMapaInvFdoSintetico.Filter    := '';
         qryMapaInvFdoSintetico.Filtered  := False;

         OperComum.LimpaParametros(qryMapaInvFdoSintetico);
         if Trim(dblPlanPrevCtbPatr.Text) <> ''  then
            qryMapaInvFdoSintetico.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblPlanPrevCtbPatr.LookupValue);

         qryMapaInvFdoSintetico.ParamByName('DATAANT').AsString := DateToStr(dDataAnt);

         qryMapaInvFdoSintetico.ParamByName('DATAINI').AsString := dtDataIni.Text;

         qryMapaInvFdoSintetico.ParamByName('DATAFIM').AsString := dtDataFim.Text;

         qryMapaInvFdoSintetico.Open;

         if Trim(dblkFundoInvest.Text) <> ''  then
            qryMapaInvFdoSintetico.Filter    := 'IDFUNDOINVEST  = '+dblkFundoInvest.LookupValue;

         if (Trim(dblSegmentacao.Text) <> '') and (qryMapaInvFdoSintetico.Filter <> '') then
            qryMapaInvFdoSintetico.Filter := qryMapaInvFdoSintetico.Filter + 'AND IDSEGMENTACAO = ' + dblSegmentacao.LookupValue
         else if (Trim(dblSegmentacao.Text) <> '') then
            qryMapaInvFdoSintetico.Filter := 'IDSEGMENTACAO = ' + dblSegmentacao.LookupValue;

         if (qryMapaInvFdoSintetico.Filter <> '') then
            qryMapaInvFdoSintetico.Filtered  := True;

      finally
         qryMapaInvFdoSintetico.EnableControls;
      end;

      if qryMapaInvFdoSintetico.IsEmpty then
      begin
         MsgDlg('Nenhum saldo foi encontrado neste período !','Mensagem do Sistema',mtWarning,[MbOk],0);
         if dtDataIni.CanFocus then
            dtDataIni.SetFocus;
         Exit;
      end;

      try
         qryMapaInvFdoAnalitico.DisableControls;
         //AL_5
         qryMapaInvFdoAnalitico.Filter    := '';
         qryMapaInvFdoAnalitico.Filtered  := False;

         OperComum.LimpaParametros(DmRelMapaInvFdo.qryMapaInvFdoAnalitico);
         qryMapaInvFdoAnalitico.ParamByName('DATAINI').AsString := dtDataIni.Text;
         qryMapaInvFdoAnalitico.ParamByName('DATAANT').AsString := DateToStr(dDataAnt);
         qryMapaInvFdoAnalitico.ParamByName('DATAFIM').AsString := dtDataFim.Text;

         if Trim(dblPlanPrevCtbPatr.Text) <> ''  then
            qryMapaInvFdoAnalitico.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblPlanPrevCtbPatr.LookupValue);

         qryMapaInvFdoAnalitico.Open;

         if Trim(dblkFundoInvest.Text) <> ''  then
         begin
            qryMapaInvFdoAnalitico.Filter    := 'IDFUNDOINVEST  = '+dblkFundoInvest.LookupValue;
            qryMapaInvFdoAnalitico.Filtered  := True;
         end;
      finally
         qryMapaInvFdoAnalitico.EnableControls;
      end;

   end;
end;

procedure TfrmConsMapaInvFdo.dbgLanContPerRFCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  // faz com que as linhas do grid tenham cores alternadas
  if State <> [gdSelected] then begin
     if not Highlight then begin
        // linhas ímpares = amarelo, linhas pares = branco
        if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
           ABrush.Color := $00C0FFFF; // amarelo
        end else begin
           ABrush.Color := clWhite;
        end;
     end;
  end else begin
     ABrush.Color := clHighLight;
     AFont.Color  := clHighLightText;
  end;
end;

procedure TfrmConsMapaInvFdo.bt_ImprimeClick(Sender: TObject);
begin
  inherited;
    with DmRelMapaInvFdo do
    begin
       if not qryMapaInvFdoSintetico.IsEmpty then
       begin
          //Al_4
          OperComum.LimpaParametros(DmRelMapaInvFdo.qryTipoInvest);
          qryTipoInvest.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
          qryTipoInvest.Open;

          //Al_3
          lblPeriodo.Caption := dtDataIni.Text + ' a ' + dtDataFim.Text;
          lblTitleFdoRF.Caption   := 'Mapa de Movimentação em Fundos de Investimentos - ' +
                                      qryTipoInvestDESCTIPOINVEST.AsString;

          OperComum.LimpaParametros(DmRelMapaInvFdo.qryTipoInvest);

          //AL_5

          try
             qryMapaInvFdoSintetico.DisableControls;
             TfrmPreview.CreateModalPreview(Application,
                                            DmRelMapaInvFdo.rptMapaInvestFdo,
                                            DmRelMapaInvFdo.rptMapaInvestFdo.PrinterSetup.DocumentName);
          finally
             qryMapaInvFdoSintetico.EnableControls;
          end;
       end;
    end;
end;

//Al_3
procedure TfrmConsMapaInvFdo.dblkFundoInvestExit(Sender: TObject);
begin
  inherited;
  with DmRelMapaInvFdo do
  begin
     if Not qryMapaInvFdoSintetico.IsEmpty then
     begin
        qryMapaInvFdoSintetico.Filter    := '';
        qryMapaInvFdoSintetico.Filtered  := False;
        qryMapaInvFdoSintetico.DisableControls;
        if Trim(dblkFundoInvest.Text) <> ''  then
        begin
           if (qryMapaInvFdoSintetico.Locate('IDFUNDOINVEST',dblkFundoInvest.LookupValue,[])) then
           begin
              qryMapaInvFdoSintetico.Filter    := 'IDFUNDOINVEST  = '+dblkFundoInvest.LookupValue;
              qryMapaInvFdoSintetico.Filtered  := True;
           end
           else
              dblkFundoInvest.Text := '';
        end;
        qryMapaInvFdoSintetico.EnableControls;
     end;
  end;
end;

//Al_3
procedure TfrmConsMapaInvFdo.dblkFundoInvestCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  with DmRelMapaInvFdo do
  begin
     if ((modified) And (Not qryMapaInvFdoSintetico.IsEmpty)) then
     begin
        qryMapaInvFdoSintetico.Filter    := '';
        qryMapaInvFdoSintetico.Filtered  := False;
        qryMapaInvFdoSintetico.DisableControls;
        if Trim(dblkFundoInvest.Text) <> ''  then
        begin
           if qryMapaInvFdoSintetico.Locate('IDFUNDOINVEST',dblkFundoInvest.LookupValue,[]) then
           begin
              qryMapaInvFdoSintetico.Filter    := 'IDFUNDOINVEST  = '+dblkFundoInvest.LookupValue;
              qryMapaInvFdoSintetico.Filtered  := True;
           end
           else
              dblkFundoInvest.Text := '';
        end;
        qryMapaInvFdoSintetico.EnableControls;
     end;
  end;
end;

end.
