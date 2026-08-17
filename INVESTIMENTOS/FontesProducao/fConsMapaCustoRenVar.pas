//******************************************************************************
// Data      : 25/04/2007
// Código    : AL_4
// Pendência : 25197/25200
// SOL       : 53035
// Motivo    : Implementação que permiti tirar o relatório agrupado pelas
//             carteiras.
//******************************************************************************
// Data      : 02/10/2006
// Código    : AL_3
// Pendencia : 22967
// SOL       :
// Motivo    : Segragação de Planos
//******************************************************************************
// Data      : 09/05/2006
// Código    : AL_2
// Pendencia : 21408
// SOL       : 40084
// Motivo    : Retirado o período e otimização de performance
//******************************************************************************
// Data     : 04/10/2005
// Código   : AL_1
// Motivo   : Implementação da coluna com "*" para identificar a ocorrecia de ajuste
//******************************************************************************

unit FConsMapaCustoRenVar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarRelInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid,
  wwdblook, wwdbdatetimepicker, CMDateTimePicker, FPreview, Db, DBTables,
  //AL_4
  CheckLst;

type
  TfrmConsMapaCustoRenVar = class(TfrmOkCancelarRelInv)
    pnlConsulta: TPanel;
    //AL_4
    lblDtFim: TLabel;
    //AL_4
    dDataFim: TCMDateTimePicker;
    dbgGrid: TwwDBGrid;
    Label1: TLabel;
    dblPlanoPrev: TwwDBLookupCombo;
    //AL_4
    lblCarteira: TLabel;
    CkLstCart: TCheckListBox;
    dblSegmentacao: TwwDBLookupCombo;
    Label3: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bt_ImprimeClick(Sender: TObject);
    procedure dbgGridCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbgGridTopRowChanged(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dDataFimClick(Sender: TObject);
    procedure dDataFimExit(Sender: TObject);
    procedure dblPlanoPrevCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblPlanoPrevExit(Sender: TObject);
    procedure CkLstCartClick(Sender: TObject);
  private
    //AL_4
    procedure MontaListCart;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsMapaCustoRenVar: TfrmConsMapaCustoRenVar;
  //AL_4
  ListaGeral, ListaCarteiras, ListaGeralDesc : TStringList;

implementation

uses FDmRelMapaRenVar, UOperComum, UMensErro, UBibliotecaInvest, UDiasUteisInv,
  //AL_4
  FPrincipal, uString;

{$R *.DFM}

procedure TfrmConsMapaCustoRenVar.FormShow(Sender: TObject);
begin
   inherited;
   //AL_3
   OperComum.LimpaParametros(DmRelMapaRenVar.qryCarteira);
   DmRelMapaRenVar.qryCarteira.Open;
   //AL_4
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

   //Renan Cristiano Sol 131501 Kintana 759733 Inicio.
   OperComum.LimpaParametros(DmRelMapaRenVar.qrySegmentacao);
   DmRelMapaRenVar.qrySegmentacao.ParamByName('GRUPO').AsInteger := 2;//Renda Variavel
   DmRelMapaRenVar.qrySegmentacao.Open;
   //Renan Cristiano Sol 131501 Kintana 759733 Fim.
end;

procedure TfrmConsMapaCustoRenVar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   //AL_3
   DmRelMapaRenVar.qryCarteira.Close;
   DmRelMapaRenVar.qryPlanoPatro.Close;
   DmRelMapaRenVar.qrySegmentacao.Close;
   DmRelMapaRenVar.qryMapaRenVar.Close;
end;

procedure TfrmConsMapaCustoRenVar.FormCreate(Sender: TObject);
begin
  inherited;
   //AL_4
   if (TForm(Sender).Height > FrmPrincipal.ClientHeight - 50{Tamanho da barra de tarefas e barra de staus}) or
      (TForm(Sender).Width > FrmPrincipal.ClientWidth - 4 {Margem de segurança}) then
      WindowState := wsMaximized
   else
      WindowState := wsNormal;
end;

procedure TfrmConsMapaCustoRenVar.bbtnConfirmarClick(Sender: TObject);
var
   dDataAnt : TDateTime;
begin
  inherited;
  // Renan Cristiano - Sol: 39931 | Kintana: 523366 Inicio
   if (dDataFim.Date < pRpi.DATARELINICIAL) then
   begin
     MsgDlg('Consulta/Impressão somente permitido para data após '+ DateToStr(pRpi.DATARELINICIAL) +' !!','Mensagem do Sistema',mtWarning,[MbOk],0);
     Exit;
   end;
  // Renan Cristiano - Sol: 39931 | Kintana: 523366 Fim
   //AL_2
   if Trim(dDataFim.Text) = '' then
   begin
      MsgDlg('Data não informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dDataFim.CanFocus then
         dDataFim.SetFocus;
      Exit;
   end;
   //AL_4
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
      //AL_4
      dDataAnt := DiasUteisInv.UltDiaUtilAnterior(StrToDate(dDataFim.Text),-1,1,'',True,False,False);
      OperComum.LimpaParametros(DmRelMapaRenVar.qryMapaRenVar);
      if not DmRelMapaRenVar.MontaQuery(dDataAnt, dDataFim.Date, dDataFim.Date,
                                        OperComum.IIF((Trim(dblPlanoPrev.Text) <> ''),dblPlanoPrev.LookupValue,''),
                                        OperComum.IIF((ListaCarteiras.Count = 1), ListaCarteiras.Text,''),
                                        OperComum.IIF(((ListaCarteiras.Count > 1) and (ListaCarteiras.Count <> CkLstCart.Items.Count-1)),'S','A'),
                                        ListaCarteiras.Text, dblSegmentacao.LookupValue //Renan Cristiano Sol 131501 Kintana 759733.
                                        ) then
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

procedure TfrmConsMapaCustoRenVar.bt_ImprimeClick(Sender: TObject);
begin
  inherited;
   //AL_4
   if not DmRelMapaRenVar.qryMapaRenVar.IsEmpty then
   begin
      DmRelMapaRenVar.qryMapaRenVar.DisableControls;
      if (ListaCarteiras.Count > 1) then
      begin
         DmRelMapaRenVar.lblPeriodoCustoGroup.Caption := dDataFim.Text;
         TfrmPreview.CreateModalPreview(Application,
                                        DmRelMapaRenVar.rptMapaCustoRVGroup,
                                        DmRelMapaRenVar.rptMapaCustoRVGroup.PrinterSetup.DocumentName);
      end
      else
      begin
         DmRelMapaRenVar.lblPeriodoCusto.Caption := dDataFim.Text;
         TfrmPreview.CreateModalPreview(Application,
                                        DmRelMapaRenVar.rptMapaCustoRenVar,
                                        DmRelMapaRenVar.rptMapaCustoRenVar.PrinterSetup.DocumentName);
      end;
      DmRelMapaRenVar.qryMapaRenVar.Filtered := False; //Renan Cristiano Sol 131501 Kintana 759733.
      DmRelMapaRenVar.qryMapaRenVar.EnableControls;
   end;
end;

procedure TfrmConsMapaCustoRenVar.dbgGridCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then
   begin
      if not Highlight then
      begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
            ABrush.Color := $00C0FFFF // amarelo
         else
            ABrush.Color := clWhite;
      end;
   end
   else
   begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;

procedure TfrmConsMapaCustoRenVar.dbgGridTopRowChanged(Sender: TObject);
begin
  inherited;
  TwwDBGrid(Sender).Invalidate;
end;

//AL_2
procedure TfrmConsMapaCustoRenVar.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   OperComum.LimpaParametros(DmRelMapaRenVar.qryMapaRenVar);
   DmRelMapaRenVar.qryMapaRenVar.Open;

   dDataFim.Text        := '';
   if dDataFim.CanFocus then
      dDataFim.SetFocus;
end;

//AL_4
procedure TfrmConsMapaCustoRenVar.MontaListCart;
var
   sLine : String;
   x, j : integer;
begin
   ListaCarteiras.Clear;
   DmRelMapaRenVar.ppMemoCustoGroup.Lines.Clear;
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
               if (j <> 2) Then
                  sLine := sLine + Espaco(' ', (60-Length(Trim(ListaGeralDesc.Strings[x]))+10));
            end;
            if (j = 2) Then
            begin
               DmRelMapaRenVar.ppMemoCustoGroup.Lines.Add(sLine);
               sLine := '';
               j := 0;
            end;
         end;
      end;
      if (j > 0) Then
         DmRelMapaRenVar.ppMemoCustoGroup.Lines.Add(sLine);
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
               DmRelMapaRenVar.ppMemoCustoGroup.Lines.Add(ListaGeralDesc.Strings[x]);
            end
            else
            begin
               ListaCarteiras.Add(',' + ListaGeral.Strings[x]);
               DmRelMapaRenVar.ppMemoCustoGroup.Lines.Add(ListaGeralDesc.Strings[x]);
            end;
         end;
      end;
   end;
end;

procedure TfrmConsMapaCustoRenVar.dDataFimClick(Sender: TObject);
begin
  inherited;
   DmRelMapaRenVar.qryMapaRenVar.Close;
end;

procedure TfrmConsMapaCustoRenVar.dDataFimExit(Sender: TObject);
begin
  inherited;
   DmRelMapaRenVar.qryMapaRenVar.Close;
end;

procedure TfrmConsMapaCustoRenVar.dblPlanoPrevCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   DmRelMapaRenVar.qryMapaRenVar.Close;
end;

procedure TfrmConsMapaCustoRenVar.dblPlanoPrevExit(Sender: TObject);
begin
  inherited;
   DmRelMapaRenVar.qryMapaRenVar.Close;
end;

procedure TfrmConsMapaCustoRenVar.CkLstCartClick(Sender: TObject);
begin
  inherited;
   DmRelMapaRenVar.qryMapaRenVar.Close;
end;

end.
