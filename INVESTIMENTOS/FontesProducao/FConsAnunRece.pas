//Unit criada por William M. Santos para atender a demanada SOL 120771 KINTANA 576015

//******************************************************************************
// Rotina     : DiferenaAnncioxRecebimento1Click
// SOL        : 120771
// Kintana    : 576015
// Data       : 13/07/2009
// Responsável: William M. Santos
// Descrição  : Implementação de um novo relatório referente a diferença do valor anunciado com o recebido.
//******************************************************************************

unit FConsAnunRece;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, ExtCtrls, StdCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, Wwdbigrd, Grids, Wwdbgrid, Db,
  DBTables, Wwquery, DBGrids, wwdbdatetimepicker, CMDateTimePicker, TB97,
  FOkCancelarInv, FPreview, fcLabel, wwdblook;

type
  TfrmConsAnunRece = class(TfrmOkCancelarInv)
    pnlConsulta: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    DtaINICIO: TCMDateTimePicker;
    DtaFIM: TCMDateTimePicker;
    dblkEmissor: TwwDBLookupCombo;
    dblkCarteira: TwwDBLookupCombo;
    dblPlanoPrev: TwwDBLookupCombo;
    ChBxConsolidadoInvest: TCheckBox;
    dbgExercDireito: TwwDBGrid;
    Bevel1: TBevel;
    qryPlanoPrev: TwwQuery;
    qryPlanoPrevPLANPRVCONTABPATRO: TStringField;
    qryPlanoPrevPLANOCONTABIL: TStringField;
    qryPlanoPrevPATROCINADORA: TStringField;
    qryPlanoPrevIDPLANPREVCTBPATR: TFloatField;
    qryPlanoPrevIDPLANOPREV: TFloatField;
    qryPlanoPrevIDPATRO: TFloatField;
    qryEmissor: TwwQuery;
    qryEmissorSIGLAEMISSOR: TStringField;
    qryEmissorIDEMISSOR: TFloatField;
    qryCarteira: TwwQuery;
    qryCarteiraIDCARTEIRA: TStringField;
    qryCarteiraDESCCARTINVEST: TStringField;
    btnImprimir: TBitBtn;
    dblSegmentacao: TwwDBLookupCombo;
    Label7: TLabel;
    QrySegmentacao: TwwQuery;
    QrySegmentacaoIDSEGMENTACAO: TFloatField;
    QrySegmentacaoDESCSEGMENTACAO: TStringField;
    QrySegmentacaoIDGRUPO: TFloatField;
    procedure dblkEmissorExit(Sender: TObject);
    procedure dblPlanoPrevExit(Sender: TObject);
    procedure ChBxConsolidadoInvestClick(Sender: TObject);
    procedure dbgExercDireitoCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FazQuery;
    procedure btnImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dbgExercDireitoTopRowChanged(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    dDataAnt: String;
    Procedure AbreQryCarteira(dData: String);
    function ValidaCampos:boolean;
    Procedure MontaQryConsolidado;
  public
    { Public declarations }
  end;

var
  frmConsAnunRece: TfrmConsAnunRece;

implementation

uses FDmRelatorio, UOperComum, UMensErro, FPrincipal;
{$R *.DFM}

{ TfrmConsAnunRece }

procedure TfrmConsAnunRece.AbreQryCarteira(dData: String);
begin
  If DtaFIM.Text <> '' then
   begin
      Opercomum.LimpaParametros(Qrycarteira);
      QryCarteira.ParamByName('DATAFIM').AsString := DtaFIM.Text;
      QryCarteira.Open;
   end;
end;

procedure TfrmConsAnunRece.MontaQryConsolidado;
begin
  //Monta Query Consolidado
  OperComum.LimpaParametros(dtmRelatorio.QryAnunReceCon);
   dtmRelatorio.QryAnunReceCon.Sql.Clear;
   dtmRelatorio.QryAnunReceCon.Sql.Add('SELECT * '+ #13);
   dtmRelatorio.QryAnunReceCon.Sql.Add('FROM ( ' + #13);
   dtmRelatorio.QryAnunReceCon.Sql.Add(dtmRelatorio.QryAnunRece.Sql.GetText);
   dtmRelatorio.QryAnunReceCon.Sql.Add(') ' + #13);
   dtmRelatorio.QryAnunReceCon.Sql.Add('ORDER BY IDSEGMENTACAO, DESCINVESTIMENTO, SIGLATIPOOPER, DESCTIPOOPERACAO, IDCARTEIRAINVEST, BOLETA'+ #13);
   dtmRelatorio.QryAnunReceCon.ParamByName('pDataIni').AsString := DtaINICIO.Text;
   dtmRelatorio.QryAnunReceCon.ParamByName('pDataFim').AsString := DtaFIM.Text;

   if Trim(dblkEmissor.Text) <> '' then
      dtmRelatorio.QryAnunReceCon.ParamByName('pIDEMISSOR').AsInteger := StrToInt(dblkEmissor.LookupValue)
   else
      dtmRelatorio.QryAnunReceCon.ParamByName('pIDEMISSOR').DataType := ftinteger;

   if Trim(dblkCarteira.Text) <> '' then
      dtmRelatorio.QryAnunReceCon.ParamByName('pIDCART').AsInteger := StrToInt(dblkCarteira.LookupValue)
   else
      dtmRelatorio.QryAnunReceCon.ParamByName('pIDCART').DataType := ftinteger;
   // Parametros não obrigatórios
   if Trim(dblPlanoPrev.Text) <> '' then
     dtmRelatorio.QryAnunReceCon.ParamByName('pIDPLANPREVCTBPATR').AsInteger := StrToInt(dblPlanoPrev.LookupValue)
   else
     dtmRelatorio.QryAnunReceCon.ParamByName('pIDPLANPREVCTBPATR').DataType := ftinteger;

   //Renan Cristiano Sol 131501/1101 Kintana 760170 Inicio
   if Trim(dblSegmentacao.Text) <> '' then
     dtmRelatorio.QryAnunReceCon.ParamByName('pIDSEGMENTACAO').AsInteger := StrToInt(dblSegmentacao.LookupValue)
   else
     dtmRelatorio.QryAnunReceCon.ParamByName('pIDSEGMENTACAO').DataType := ftInteger;
   //Renan Cristiano Sol 131501/1101 Kintana 760170 Fim

   dtmRelatorio.QryAnunReceCon.Open;
end;

function TfrmConsAnunRece.ValidaCampos: boolean;
begin
   Result := False;
   if Trim(DtaINICIO.Text) = '' then
   begin
      MsgDlg('A Data Inicial não foi informada.','Mensagem do Sistema', mtWarning, [MbOk], 0);
      if DtaINICIO.CanFocus then
         DtaINICIO.SetFocus;
      Exit;
   end;
   if Trim(DtaFIM.Text) = '' then
   begin
      MsgDlg('A Data Final não foi informada.','Mensagem do Sistema', mtWarning, [MbOk], 0);
      if DtaFIM.CanFocus then
         DtaFIM.SetFocus;
      Exit;
   end;
   if DtaFIM.Date < DtaINICIO.Date Then
   begin
      MsgDlg('A Data Final menor que a Data Inicial.','Mensagem do Sistema', mtWarning, [MbOk], 0);
      if DtaFIM.CanFocus then
         DtaFIM.SetFocus;
      DtaFIM.Date := DtaINICIO.Date;
      Exit;
   end;

   Result := True;
end;

procedure TfrmConsAnunRece.dblkEmissorExit(Sender: TObject);
begin
  inherited;
  If dDataAnt <> DtaFIM.Text then
    AbreQryCarteira(DtaFIM.Text);
end;

procedure TfrmConsAnunRece.dblPlanoPrevExit(Sender: TObject);
begin
  inherited;
  If dDataAnt <> DtaFIM.Text then
    AbreQryCarteira(DtaFIM.Text);
end;

procedure TfrmConsAnunRece.ChBxConsolidadoInvestClick(Sender: TObject);
begin
  inherited;
  If (ChBxConsolidadoInvest.checked) and Not(dtmRelatorio.QryAnunRece.IsEmpty)then
     bbtnConfirmarClick(Self);
end;

procedure TfrmConsAnunRece.dbgExercDireitoCalcCellColors(Sender: TObject;
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

procedure TfrmConsAnunRece.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  FazQuery; //Monta a query em run time
end;

procedure TfrmConsAnunRece.bbtnCancelarClick(Sender: TObject);
begin

  dtmRelatorio.qryAnunRece.Close;
  dtmRelatorio.QryAnunReceCon.Close;
  //Falta colocar a query do Consolidado.

end;

procedure TfrmConsAnunRece.FazQuery;
begin
  if not ValidaCampos then
    Exit;

    OperComum.LimpaParametros(dtmRelatorio.QryAnunRece);

    with dtmRelatorio.QryAnunRece do
    begin
      ParamByName('pDATAINI').AsString := DtaINICIO.Text;
      ParamByName('pDATAFIM').AsString := DtaFIM.Text;

      if Trim(dblPlanoPrev.Text) <> '' then
         ParamByName('pIDPLANPREVCTBPATR').AsInteger := StrToInt(dblPlanoPrev.LookupValue);
      if Trim(dblkEmissor.Text) <> '' then
         ParamByName('pIDEMISSOR').AsInteger := StrToInt(dblkEmissor.LookupValue);
      if Trim(dblkCarteira.Text) <> '' then
         ParamByName('pIDCART').AsInteger := StrToInt(dblkCarteira.LookupValue);
      //Renan Cristiano Sol 131501/1101 Kintana 760170 Inicio
      if Trim(dblSegmentacao.Text) <> '' then
         ParamByName('pIDSEGMENTACAO').AsInteger := StrToInt(dblSegmentacao.LookupValue);
      //Renan Cristiano Sol 131501/1101 Kintana 760170 Fim
      Open;
    end;

end;

procedure TfrmConsAnunRece.btnImprimirClick(Sender: TObject);
begin
  If dtmRelatorio.QryAnunRece.IsEmpty Then
     Exit;


   If Not(ChBxConsolidadoInvest.Checked) then
   begin
      If (DtaINICIO.Text <> '') And (DtaFIM.Text <> '') Then
      Begin
         dtmRelatorio.ppDtaIniAR.Caption            := DtaINICIO.Text;
         dtmRelatorio.ppDtaFimAR.Caption            := DtaFIM.Text;
      End
      Else
      Begin
         dtmRelatorio.ppDtaIniAR.Caption            := '            ';
         dtmRelatorio.ppDtaFimAR.Caption            := '            ';
      End;

      DtmRelatorio.QryAnunRece.DisableControls;

      TfrmPreview.CreateModalPreview(Application,
                                     dtmRelatorio.ppRepAnunRece,
                                     dtmRelatorio.ppRepAnunRece.PrinterSetup.DocumentName);

       DtmRelatorio.QryAnunRece.EnableControls;

   end
   else
   begin

      If (DtaINICIO.Text <> '') And (DtaFIM.Text <> '') Then
      begin
         dtmRelatorio.ppDtaIniARCon.Caption            := DtaINICIO.Text;
         dtmRelatorio.ppDtaFimARCon.Caption            := DtaFIM.Text;
      end
      else
      begin
         dtmRelatorio.ppDtaIniARCon.Caption            := '            ';
         dtmRelatorio.ppDtaFimARCon.Caption            := '            ';
      end;

      MontaQryConsolidado;

      TfrmPreview.CreateModalPreview(Application,
                                     dtmRelatorio.ppRepAnunReceCon,
                                     dtmRelatorio.ppRepAnunReceCon.PrinterSetup.DocumentName);


   end; 

end;

procedure TfrmConsAnunRece.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  qryCarteira.Close;
  qryEmissor.Close;
  qryPlanoPrev.Close;
  QrySegmentacao.Close; //Renan Cristiano Sol 131501/1101 Kintana 760170

  dtmRelatorio.QryAnunRece.Close;
  dtmRelatorio.QryAnunReceCon.Close;


end;

procedure TfrmConsAnunRece.FormCreate(Sender: TObject);
begin
     if (TForm(Sender).Height > FrmPrincipal.ClientHeight - 50{Tamanho da barra de tarefas e barra de staus}) or
      (TForm(Sender).Width > FrmPrincipal.ClientWidth - 4 {Margem de segurança}) then
      WindowState := wsMaximized
   else
      WindowState := wsNormal;
      
  inherited;

   PnlFundo.Enabled := True;
end;

procedure TfrmConsAnunRece.dbgExercDireitoTopRowChanged(Sender: TObject);
begin
  inherited;
  TwwDBGrid(Sender).Invalidate;
end;

procedure TfrmConsAnunRece.FormShow(Sender: TObject);
begin
  inherited;

  qryEmissor.Open;
  qryPlanoPrev.Open;
  //Renan Cristiano Sol 131501/1101 Kintana 760170 Inicio
  OperComum.LimpaParametros(qrySegmentacao);
  qrySegmentacao.ParamByName('GRUPO').AsInteger := 2;//Renda Variavel
  qrySegmentacao.Open;
  //Renan Cristiano Sol 131501/1101 Kintana 760170 Fim

  dtmRelatorio.QryAnunRece.Close;
end;

end.

