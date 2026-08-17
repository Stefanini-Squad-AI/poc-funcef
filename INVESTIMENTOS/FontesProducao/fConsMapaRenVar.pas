//******************************************************************************
// Data      : 21/05/2007
// Código    : AL_15
// Pendência : 25417
// SOL       : 60598
// Motivo    : Ajuste na data passada para buscar o dia anterior(DataIni)
//******************************************************************************
// Data      : 25/04/2007
// Código    : AL_14
// Pendência : 25199
// SOL       : 53035
// Motivo    : Implementação que permiti tirar o relatório agrupado pelas
//             carteiras.
//******************************************************************************
// Data      : 13/09/2006
// Código    : AL_13
// Pendência : 22967
// Motivo    : Segregação de Planos
//******************************************************************************
// Data      : 09/05/2006
// Código    : AL_12
// Motivo    : E otimizada a qryMapaRenVar.
//******************************************************************************
// Data     : 05/10/2005
// Código   : AL_11
// Motivo   : Alteração das clonas de compra e venda para entrada e saída
//******************************************************************************
// Data     : 04/10/2005
// Código   : AL_10
// Motivo   : Implementação da coluna com "*" para identificar a ocorrecia de ajuste
//******************************************************************************
// Data     : 16/09/2005
// Código   : AL_9
// Motivo   : Implementado da coluna de Restituição de Capital
//******************************************************************************
// Data     : 03/08/2005
// Código   : AL_2
// Motivo   : Acerto nas colunas de saldo e qtd atual e anterior que estavam
//            invertidas  e passa a tratar dia util na data anterior
//******************************************************************************
// Data     : 27/07/2005
// Código   : AL_1
// Motivo   : Mostra o grid "zebrado"
//******************************************************************************
// Data     : 25/07/2005
// Código   :
// Motivo   : Implementação da Consulta e Relatório Mapa de Variação de R.Variavel
//******************************************************************************

unit FConsMapaRenVar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarRelInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid,
  wwdblook, wwdbdatetimepicker, CMDateTimePicker, FPreview, Db, DBTables,
  Wwquery,
  //AL_14
  DBCtrls, CheckLst;

type
  TfrmConsMapaRenVar = class(TfrmOkCancelarRelInv)
    pnlConsulta: TPanel;
    lblDtIni: TLabel;
    lblCarteira: TLabel;
    dDataIni: TCMDateTimePicker;
    //AL_14
    dbgGrid: TwwDBGrid;
    lblDtFim: TLabel;
    dDataFim: TCMDateTimePicker;
    Label1: TLabel;
    dblPlanoPrev: TwwDBLookupCombo;
    //AL_14
    CkLstCart: TCheckListBox;
    Label2: TLabel;
    dblSegmentacao: TwwDBLookupCombo;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bt_ImprimeClick(Sender: TObject);
    procedure dbgGridCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbgGridTopRowChanged(Sender: TObject);
    procedure dDataIniCloseUp(Sender: TObject);
    procedure dDataIniExit(Sender: TObject);
    procedure dDataFimCloseUp(Sender: TObject);
    procedure dDataFimExit(Sender: TObject);
    procedure dblPlanoPrevCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblPlanoPrevExit(Sender: TObject);
    procedure CkLstCartClick(Sender: TObject);
    procedure dblSegmentacaoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblSegmentacaoExit(Sender: TObject);
  private
    //AL_14
    procedure MontaListCart;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsMapaRenVar: TfrmConsMapaRenVar;
  //AL_14
  ListaGeral, ListaCarteiras, ListaGeralDesc : TStringList;  

implementation

uses FDmRelMapaRenVar, UOperComum, UMensErro, UBibliotecaInvest, UDiasUteisInv,
  //AL_14
  FPrincipal, uString;

{$R *.DFM}

procedure TfrmConsMapaRenVar.FormShow(Sender: TObject);
begin
   inherited;
   //AL_13
   OperComum.LimpaParametros(DmRelMapaRenVar.qryCarteira);
   DmRelMapaRenVar.qryCarteira.Open;
   //AL_14
   ListaCarteiras := TStringList.Create;
   ListaGeral     := TStringList.Create;
   ListaGeralDesc := TStringList.Create;   

   ListaGeral.Clear;
   CkLstCart.Clear;

   while not DmRelMapaRenVar.qryCarteira.Eof do
   begin
      CkLstCart.Items.Add(Trim(DmRelMapaRenVar.qryCarteira.FieldByName('DESCCARTINVEST').AsString));
      CkLstCart.Checked[CkLstCart.Items.Count-1] := (DmRelMapaRenVar.qryCarteira.FieldByName('FLGCARTPROP').AsInteger = 1);

      ListaGeral.Add(DmRelMapaRenVar.qryCarteira.FieldByName('IDCARTEIRAINVEST').AsString);
      ListaGeralDesc.Add(Trim(DmRelMapaRenVar.qryCarteira.FieldByName('DESCCARTINVEST').AsString));

      DmRelMapaRenVar.qryCarteira.Next;
   end;

   OperComum.LimpaParametros(DmRelMapaRenVar.qryPlanoPatro);
   DmRelMapaRenVar.qryPlanoPatro.Open;

   //Passa por parametro o grupo de segmentacao para RV
   OperComum.LimpaParametros(DmRelMapaRenVar.qrySegmentacao);
   DmRelMapaRenVar.qrySegmentacao.ParamByName('GRUPO').AsInteger := 2;
   DmRelMapaRenVar.qrySegmentacao.Open;

   if dDataIni.CanFocus then
      dDataIni.SetFocus;
end;

procedure TfrmConsMapaRenVar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   //AL_13
   DmRelMapaRenVar.qryCarteira.Close;
   DmRelMapaRenVar.qryPlanoPatro.Close;
   DmRelMapaRenVar.qryMapaRenVar.Close;
   DmRelMapaRenVar.qrySegmentacao.Close;

   //AL_14
   ListaCarteiras.Free;
   ListaGeral.Free;
   ListaGeralDesc.Free;
end;

procedure TfrmConsMapaRenVar.FormCreate(Sender: TObject);
begin
   inherited;
   //AL_14
   if (TForm(Sender).Height > FrmPrincipal.ClientHeight - 50{Tamanho da barra de tarefas e barra de staus}) or
      (TForm(Sender).Width > FrmPrincipal.ClientWidth - 4 {Margem de segurança}) then
      WindowState := wsMaximized
   else
      WindowState := wsNormal;
end;

procedure TfrmConsMapaRenVar.bbtnConfirmarClick(Sender: TObject);
var dDataAnt: TDateTime;
begin
   inherited;
  // Renan Cristiano - Sol: 39931 | Kintana: 523366 Inicio
   if (dDataIni.Date < pRpi.DATARELINICIAL) then//and (dDataFim.Date <= pRpi.DATARELINICIAL) then
   begin
     MsgDlg('Consulta/Impressão somente permitido para data após '+ DateToStr(pRpi.DATARELINICIAL) +' !!','Mensagem do Sistema',mtWarning,[MbOk],0);
     if dDataIni.CanFocus then
        dDataIni.SetFocus;
     Exit;
   end;
   //else if (dDataIni.Date <= pRpi.DATARELINICIAL) and (dDataFim.Date >= pRpi.DATARELINICIAL) then
   //  dDataIni.Text := dateToStr(pRpi.DATARELINICIAL+1);
  // Renan Cristiano - Sol: 39931 | Kintana: 523366 Fim

   if Trim(dDataIni.Text) = '' then
   begin
      MsgDlg('Data Inicial não informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dDataIni.CanFocus then
         dDataIni.SetFocus;
      Exit;
   end
   else if Trim(dDataFim.Text) = '' then
   begin
      MsgDlg('Data Final não informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dDataFim.CanFocus then
         dDataFim.SetFocus;
      Exit;
   end
   else if (dDataFim.Date < dDataIni.Date) then
   begin
      MsgDlg('A Data Final não pode ser menor que a Data Inicial.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dDataFim.CanFocus then
         dDataFim.SetFocus;
      Exit;
   end;

   //AL_14
   MontaListCart;

   if (ListaCarteiras.Count < 1) then
   begin
      MsgDlg('Carteira de Investimentos não informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if CkLstCart.CanFocus then
         CkLstCart.SetFocus;
      Exit;
   end;

   with DmRelMapaRenVar do
   begin
      //AL_15   
      //AL_14

      dDataAnt := DiasUteisInv.UltDiaUtilAnterior(StrToDate(dDataIni.Text),-1,1,'',True,False,False);
      OperComum.LimpaParametros(DmRelMapaRenVar.qryMapaRenVar);
      if not DmRelMapaRenVar.MontaQuery(dDataAnt, dDataIni.Date, dDataFim.Date,
                                        OperComum.IIF((Trim(dblPlanoPrev.Text) <> ''),dblPlanoPrev.LookupValue,''),
                                        OperComum.IIF((ListaCarteiras.Count = 1), ListaCarteiras.Text,''),
                                        OperComum.IIF(((ListaCarteiras.Count > 1) and (ListaCarteiras.Count <> CkLstCart.Items.Count-1)),'S','A'),
                                        ListaCarteiras.Text, dblSegmentacao.LookupValue) then
      begin
         MsgDlg('Não foi possível executar a consulta!'+#13+
                'Entre em contato com um analista de sistemas da CM Soluções Informática!','Mensagem do Sistema',mtWarning,[MbOk],0);
         if dDataFim.CanFocus then
            dDataFim.SetFocus;
      end
      else
      begin
         if qryMapaRenVar.IsEmpty then
         begin
            MsgDlg('Nenhum saldo foi encontrado neste período !','Mensagem do Sistema',mtWarning,[MbOk],0);
            if dDataFim.CanFocus then
               dDataFim.SetFocus;
         end;
      end;
   end;

end;

procedure TfrmConsMapaRenVar.bt_ImprimeClick(Sender: TObject);
begin
  inherited;
   //AL_14
   if not DmRelMapaRenVar.qryMapaRenVar.IsEmpty then
   begin
      DmRelMapaRenVar.qryMapaRenVar.DisableControls;
      if (ListaCarteiras.Count > 1) then
      begin
         DmRelMapaRenVar.lblPosicaoMovGroup.Caption := dDataIni.Text + ' a ' + dDataFim.Text;
         TfrmPreview.CreateModalPreview(Application,
                                        DmRelMapaRenVar.rptMapaMovRVGroup,
                                        DmRelMapaRenVar.rptMapaMovRVGroup.PrinterSetup.DocumentName);
      end
      else
      begin
         DmRelMapaRenVar.lblPeriodo.Caption := dDataIni.Text + ' a ' + dDataFim.Text;
         TfrmPreview.CreateModalPreview(Application,
                                        DmRelMapaRenVar.rptMapaRenVar,
                                        DmRelMapaRenVar.rptMapaRenVar.PrinterSetup.DocumentName);
      end;
      DmRelMapaRenVar.qryMapaRenVar.EnableControls;
   end
end;

procedure TfrmConsMapaRenVar.dbgGridCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
   inherited;
   // AL_1 
   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then
   begin
      if not Highlight then
      begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
            ABrush.Color := $00C0FFFF // amarelo bebê
         else
            ABrush.Color := clWhite;
      end;
   end
   else
   begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
   // AL_1 - Fim
end;

procedure TfrmConsMapaRenVar.dbgGridTopRowChanged(Sender: TObject);
begin
  inherited;
  // AL_1 
  TwwDBGrid(Sender).Invalidate;
end;                         

//AL_14
procedure TfrmConsMapaRenVar.MontaListCart;
var
   sLine : String;
   x, j : integer;
begin
   ListaCarteiras.Clear;
   DmRelMapaRenVar.ppMemoMovGroup.Lines.Clear;
   j := 0;
   for x := 0 to (CkLstCart.Items.Count-1) do
   begin
      // Caso Checado incluir na lista
      if CkLstCart.Checked[x] then
         j := j + 1;
   end;
   if j > 5 then
   begin
      j := 0;
      for x := 0 to (CkLstCart.Items.Count-1) do
      begin
         // Caso Checado incluir na lista
         if CkLstCart.Checked[x] then
         begin
            if ListaCarteiras.Count = 0 then
            begin
               ListaCarteiras.Add(ListaGeral.Strings[x]);
               sLine := sLine + ListaGeralDesc.Strings[x];
               sLine := sLine + Espaco(' ', (60-Length(Trim(ListaGeralDesc.Strings[x]))+10));
               j := j + 1;
            end
            else
            begin
               ListaCarteiras.Add(',' + ListaGeral.Strings[x]);
               sLine := sLine + ListaGeralDesc.Strings[x];
               j := j + 1;
               if (j <> 3) Then
                  sLine := sLine + Espaco(' ', (60-Length(Trim(ListaGeralDesc.Strings[x]))+10));
            end;
            if (j = 3) Then
            begin
               DmRelMapaRenVar.ppMemoMovGroup.Lines.Add(sLine);
               sLine := '';
               j := 0;
            end;
         end;
      end;
      if (j > 0) Then
         DmRelMapaRenVar.ppMemoMovGroup.Lines.Add(sLine);
   end
   else
   begin
      j := 0;
      for x := 0 to (CkLstCart.Items.Count-1) do
      begin
         // Caso Checado incluir na lista
         if CkLstCart.Checked[x] then
         begin
            if ListaCarteiras.Count = 0 then
            begin
               ListaCarteiras.Add(ListaGeral.Strings[x]);
               DmRelMapaRenVar.ppMemoMovGroup.Lines.Add(ListaGeralDesc.Strings[x]);
            end
            else
            begin
               ListaCarteiras.Add(',' + ListaGeral.Strings[x]);
               DmRelMapaRenVar.ppMemoMovGroup.Lines.Add(ListaGeralDesc.Strings[x]);
            end;
         end;
      end;
   end;
end;

procedure TfrmConsMapaRenVar.dDataIniCloseUp(Sender: TObject);
begin
  inherited;
   DmRelMapaRenVar.qryMapaRenVar.Close;
end;

procedure TfrmConsMapaRenVar.dDataIniExit(Sender: TObject);
begin
  inherited;
   DmRelMapaRenVar.qryMapaRenVar.Close;
end;

procedure TfrmConsMapaRenVar.dDataFimCloseUp(Sender: TObject);
begin
  inherited;
   DmRelMapaRenVar.qryMapaRenVar.Close;
end;

procedure TfrmConsMapaRenVar.dDataFimExit(Sender: TObject);
begin
  inherited;
   DmRelMapaRenVar.qryMapaRenVar.Close;
end;

procedure TfrmConsMapaRenVar.dblPlanoPrevCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   DmRelMapaRenVar.qryMapaRenVar.Close;
end;

procedure TfrmConsMapaRenVar.dblPlanoPrevExit(Sender: TObject);
begin
  inherited;
   DmRelMapaRenVar.qryMapaRenVar.Close;
end;

procedure TfrmConsMapaRenVar.CkLstCartClick(Sender: TObject);
begin
  inherited;
   DmRelMapaRenVar.qryMapaRenVar.Close;
end;

procedure TfrmConsMapaRenVar.dblSegmentacaoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  DmRelMapaRenVar.qryMapaRenVar.Close;
end;

procedure TfrmConsMapaRenVar.dblSegmentacaoExit(Sender: TObject);
begin
  inherited;
  DmRelMapaRenVar.qryMapaRenVar.Close;
end;

end.


