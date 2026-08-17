//*****************************************************************************
// Data      : 17/08/2007
// Código    : AL_32
// Pendência : 24957
// SOL       : 56201
// Motivo    : Implementação do Relatório Consolidado por Investimento
//             Parametrizar a Opção Carteira Gerencial - Tirei VWCARTEIRASRV
//             Montar a qry só no Ok do botão
//*****************************************************************************
// Data     : 18/04/2007
// Pendencia: 25073
// SOL      : 58176
// Código   : AL_31
// Motivo   : Alteração da definição do relatório. Mantido somente o lay-out original
//*****************************************************************************
// Data     : 16/03/2007
// Pendencia: 24758
// SOL      : 55789
// Código   : AL_30
// Motivo   : Implementaçao do campo DATAOPER(DATAEX) na qryExeDireito e no
//            relatório
//*****************************************************************************
// Data     : 07/11/2006
// Pendencia: 23666
// SOL      :
// Código   : AL_30
// Motivo   : Ajuste na seleção da carteira
//*****************************************************************************
// Data     : 01/11/2006
// Pendencia: 23666
// SOL      :
// Código   : AL_29
// Motivo   : Segregação de Planos
//*****************************************************************************
// Data     : 22/05/2006
// Pendencia: 21208
// SOL      : 39584
// Código   : AL_28
// Motivo   : Inclusão do campo Remuneração , Vlr da Operaçã o e valor total no
//            Relatório de Exercicio de Direitos (qryExeDireito)
//*****************************************************************************************
// Objetivo: Este relatório exibirá as operações de Direitos : Subscricao, Direito de Subscricao,
//           Juros sob Capital,Dividendos, Restituição de Capital e Recebimento Fracionado.
//              *Direito de Subscricao  não terá financeiro
//              *Subscricao e Direito de Subscricao somente (destino)
//
// ****************************************************************************************

unit FConsExeDireitos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, ExtCtrls, StdCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, Wwdbigrd, Grids, Wwdbgrid, Db,
  DBTables, Wwquery, DBGrids, wwdbdatetimepicker, CMDateTimePicker, TB97,
  FOkCancelarInv, FPreview, fcLabel, wwdblook;

type
  TfrmConsExeDireitos = class(TfrmOkCancelarInv)
    Bevel2: TBevel;
    Label2: TLabel;
    pnlConsulta: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    DtaINICIO: TCMDateTimePicker;
    DtaFIM: TCMDateTimePicker;
    btnImprimir: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    qryCarteira: TwwQuery;
    Label1: TLabel;
    qryEmissor: TwwQuery;
    qryEmissorSIGLAEMISSOR: TStringField;
    qryEmissorIDEMISSOR: TFloatField;
    dblkEmissor: TwwDBLookupCombo;
    Label3: TLabel;
    dblkCarteira: TwwDBLookupCombo;
    qryPlanoPrev: TwwQuery;
    qryPlanoPrevPLANPRVCONTABPATRO: TStringField;
    qryPlanoPrevPLANOCONTABIL: TStringField;
    qryPlanoPrevPATROCINADORA: TStringField;
    qryPlanoPrevIDPLANPREVCTBPATR: TFloatField;
    qryPlanoPrevIDPLANOPREV: TFloatField;
    qryPlanoPrevIDPATRO: TFloatField;
    Label6: TLabel;
    dblPlanoPrev: TwwDBLookupCombo;
    dbgExercDireito: TwwDBGrid;
    qryCarteiraIDCARTEIRA: TStringField;
    qryCarteiraDESCCARTINVEST: TStringField;
    ChBxConsolidadoInvest: TCheckBox;
    procedure FazQuery ;
    procedure btnImprimirClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DtaFIMExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblkEmissorExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblPlanoPrevExit(Sender: TObject);
    procedure dbgExercDireitoCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbgExercDireitoTopRowChanged(Sender: TObject);
    procedure ChBxConsolidadoInvestClick(Sender: TObject);
    procedure DtaFIMCloseUp(Sender: TObject);
  private
    { Private declarations }
    //AL_32
    dDataAnt: String;
    Procedure AbreQryCarteira(dData: String);
    Procedure MontaQryConsolidado;
    function ValidaCampos:boolean;

  public
    { Public declarations }
  end;

var
  frmConsExeDireitos: TfrmConsExeDireitos;

implementation

uses FDmRelatorio, UOperComum, UMensErro, FPrincipal;

{$R *.DFM}

function TfrmConsExeDireitos.ValidaCampos : boolean;
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

procedure TfrmConsExeDireitos.FazQuery;
begin
   if not ValidaCampos then
      Exit;

   OperComum.LimpaParametros(dtmRelatorio.qryExeDireito);
   with dtmRelatorio.qryExeDireito do
   begin
      ParamByName('dDataIni').AsString := DtaINICIO.Text;
      ParamByName('dDataFim').AsString := DtaFIM.Text;
      //Al_29
      if Trim(dblPlanoPrev.Text) <> '' then
         ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblPlanoPrev.LookupValue);
      if Trim(dblkEmissor.Text) <> '' then
         ParamByName('IDEMISSOR').AsInteger := StrToInt(dblkEmissor.LookupValue);
      if Trim(dblkCarteira.Text) <> '' then
         ParamByName('IDCART').AsInteger := StrToInt(dblkCarteira.LookupValue);

      ParamByName('TIPODATA').AsInteger := OperComum.RetornaDataDivConsulta(StrToDate(DtaINICIO.Text));   
      Open;
      // AL_32
      ///dtmRelatorio.qryExeDireito.Sql.SaveToFile('C:\QryExeDireito.txt'); // Fim AL_32
   end;

   
end;


procedure TfrmConsExeDireitos.btnImprimirClick(Sender: TObject);
begin
  If dtmRelatorio.qryExeDireito.IsEmpty Then
     Exit;

   //AL_32
   If Not(ChBxConsolidadoInvest.Checked) then
   begin
      If (DtaINICIO.Text <> '') And (DtaFIM.Text <> '') Then
      Begin
         dtmRelatorio.ppDtaIni.Caption            := DtaINICIO.Text;
         dtmRelatorio.ppDtaFim.Caption            := DtaFIM.Text;
      End
      Else
      Begin
         dtmRelatorio.ppDtaIni.Caption            := '            ';
         dtmRelatorio.ppDtaFim.Caption            := '            ';
      End;

      DtmRelatorio.qryExeDireito.DisableControls;

      TfrmPreview.CreateModalPreview(Application,
                                     dtmRelatorio.ppRepExeDireito,
                                     dtmRelatorio.ppRepExeDireito.PrinterSetup.DocumentName);

       DtmRelatorio.qryExeDireito.EnableControls;
   //AL_32
   end
   else
   begin

      If (DtaINICIO.Text <> '') And (DtaFIM.Text <> '') Then
      begin
         dtmRelatorio.lblDtaIniCon.Caption            := DtaINICIO.Text;
         dtmRelatorio.lblDtaFimCon.Caption            := DtaFIM.Text;
      end
      else
      begin
         dtmRelatorio.lblDtaIniCon.Caption            := '            ';
         dtmRelatorio.lblDtaFimCon.Caption            := '            ';
      end;

      MontaQryConsolidado;

      TfrmPreview.CreateModalPreview(Application,
                                     dtmRelatorio.ppRepExeDireitoCon,
                                     dtmRelatorio.ppRepExeDireitoCon.PrinterSetup.DocumentName);


   end;

end;

procedure TfrmConsExeDireitos.bbtnCancelarClick(Sender: TObject);
begin
  dtmRelatorio.qryExeDireito.Close;
  //AL_32
  dtmRelatorio.qryExeDireitoCon.Close;
end;

procedure TfrmConsExeDireitos.FormCreate(Sender: TObject);
begin

   if (TForm(Sender).Height > FrmPrincipal.ClientHeight - 50{Tamanho da barra de tarefas e barra de staus}) or
      (TForm(Sender).Width > FrmPrincipal.ClientWidth - 4 {Margem de segurança}) then
      WindowState := wsMaximized
   else
      WindowState := wsNormal;
      
  inherited;

   PnlFundo.Enabled := True;

end;

procedure TfrmConsExeDireitos.FormShow(Sender: TObject);
begin
  inherited;
  //AL_32
  qryEmissor.Open;
  //AL_29
  qryPlanoPrev.Open;
  dtmRelatorio.qryExeDireito.Close;
end;

procedure TfrmConsExeDireitos.DtaFIMExit(Sender: TObject);
begin
  inherited;
  // AL_32
  // FazQuery;  //Monta a query em run time
  AbreQryCarteira(DtaFIM.Text);
  // Fim AL_32
end;

procedure TfrmConsExeDireitos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryCarteira.Close;
  qryEmissor.Close;
  //AL_29
  qryPlanoPrev.Close;
  dtmRelatorio.qryExeDireito.Close;
  //AL_32
  dtmRelatorio.qryExeDireitoCon.Close;
end;

procedure TfrmConsExeDireitos.dblkEmissorExit(Sender: TObject);
begin
  inherited;
  // AL_32
   If dDataAnt <> DtaFIM.Text then
      AbreQryCarteira(DtaFIM.Text);
end;

procedure TfrmConsExeDireitos.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   FazQuery;  //Monta a query em run time
end;

procedure TfrmConsExeDireitos.dblPlanoPrevExit(Sender: TObject);
begin
   inherited;
   // AL_32
   If dDataAnt <> DtaFIM.Text then
      AbreQryCarteira(DtaFIM.Text);
end;

//AL_29
procedure TfrmConsExeDireitos.dbgExercDireitoCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
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

procedure TfrmConsExeDireitos.dbgExercDireitoTopRowChanged(Sender: TObject);
begin
  inherited;

  TwwDBGrid(Sender).Invalidate;

end;

// AL_32
procedure TfrmConsExeDireitos.ChBxConsolidadoInvestClick(Sender: TObject);
begin
  inherited;
  dblPlanoPrev.Clear;
  If (ChBxConsolidadoInvest.checked) and Not(dtmRelatorio.qryExeDireito.IsEmpty)then
     bbtnConfirmarClick(Self);
end;

procedure TfrmConsExeDireitos.AbreQryCarteira(dData: String);
begin
   If DtaFIM.Text <> '' then
   begin
      Opercomum.LimpaParametros(Qrycarteira);
      QryCarteira.ParamByName('DATAFIM').AsString := DtaFIM.Text;
      QryCarteira.Open;
   end;
end;

//AL_32
procedure TfrmConsExeDireitos.DtaFIMCloseUp(Sender: TObject);
begin
  inherited;
  dDataAnt := DtaFIM.Text;
end;

// AL_32
procedure TfrmConsExeDireitos.MontaQryConsolidado;
begin
   OperComum.LimpaParametros(dtmRelatorio.qryExeDireitoCon);
   dtmRelatorio.qryExeDireitoCon.Sql.Clear;
   dtmRelatorio.qryExeDireitoCon.Sql.Add('SELECT * '+ #13);
   dtmRelatorio.qryExeDireitoCon.Sql.Add('FROM ( ' + #13);
   dtmRelatorio.qryExeDireitoCon.Sql.Add(dtmRelatorio.qryExeDireito.Sql.GetText);
   dtmRelatorio.qryExeDireitoCon.Sql.Add(') ' + #13);
   dtmRelatorio.qryExeDireitoCon.Sql.Add('ORDER BY DESCINVESTIMENTO,DESCTIPOOPERACAO,IDCARTEIRAGERENC,IDCARTEIRAINVEST,NUMDOCUMENTO'+ #13);
   dtmRelatorio.qryExeDireitoCon.ParamByName('dDataIni').AsString := DtaINICIO.Text;
   dtmRelatorio.qryExeDireitoCon.ParamByName('dDataFim').AsString := DtaFIM.Text;

   if Trim(dblkEmissor.Text) <> '' then
      dtmRelatorio.qryExeDireitoCon.ParamByName('IDEMISSOR').AsInteger := StrToInt(dblkEmissor.LookupValue)
   else
      dtmRelatorio.qryExeDireitoCon.ParamByName('IDEMISSOR').DataType := ftinteger;

   if Trim(dblkCarteira.Text) <> '' then
      dtmRelatorio.qryExeDireitoCon.ParamByName('IDCART').AsInteger := StrToInt(dblkCarteira.LookupValue)
   else
      dtmRelatorio.qryExeDireitoCon.ParamByName('IDCART').DataType := ftinteger;
   // Parametros não obrigatórios
   dtmRelatorio.qryExeDireitoCon.ParamByName('IDPLANPREVCTBPATR').DataType := ftinteger;
   dtmRelatorio.qryExeDireitoCon.ParamByName('IDSEGMENTACAO').DataType := ftinteger;   
   dtmRelatorio.qryExeDireitoCon.ParamByName('TIPODATA').AsInteger := OperComum.RetornaDataDivConsulta(StrToDate(DtaINICIO.Text));
   dtmRelatorio.qryExeDireitoCon.Open;
end;

end.

