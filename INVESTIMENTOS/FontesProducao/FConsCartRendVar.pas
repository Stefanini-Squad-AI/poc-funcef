//******************************************************************************
// Data     : 29/08/2007
// Código   : AL_6
// Pendencia: 25707
// SOL      : 47728
// Motivo   : Alteração da coluna "Cód.BOVESPA" do papel para Código de Negociação
//            Otimização de rotinas, com tratamento de query vazia e eventos onexit
//******************************************************************************
// Data     : 03/01/2007
// Código   : AL_5
// Pendencia: 24102
// Desc     : Ajuste nos filtros da tela.
//            Ajuste na dinâmica de funcionamento da tela
//******************************************************************************
// Data     : 07/11/2006
// Código   : AL_4
// Pendencia: 23698
// Desc     : Ajuste nos filtros do Emissor
//******************************************************************************
// Data     : 11/10/2006
// Código   : AL_3
// Pendencia: 22967
// Desc     : Otimização da tela
//******************************************************************************
// Data     : 12/09/2006
// Código   : AL_2
// Pendencia: 22967
// Desc     : Segregação de Planos
//            Alterado o DFM (Mudada a Herança para frmOkCancelarInv)
//            Passa a buscar a query no FDmRelConsCartRenVar
//******************************************************************************
// Data     : 09/06/2006
// Código   : AL_1
// Desc     : Ajuste na consulta da carteira para não trazer duplicidade
//******************************************************************************
// Data     : 10/05/2005
// Motivo   : Inclusão do campo PUCUSTO no Grid dbGConsRVariavel
//******************************************************************************
// Data     : 11/03/2005
// Motivo   : Alteracao do caption da coluna Variacao Mes para somente Variacao
//******************************************************************************
// Data     : 04/03/2005
//          : qryConsCartRendVar
// Motivo   : Implementação da datacotacao, para mostra certo.
//******************************************************************************

unit FConsCartRendVar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, DBTables, Db, Wwdatsrc, Wwquery, wwdblook,
  Grids, Wwdbigrd, Wwdbgrid, DBGrids, wwdbdatetimepicker, CMDateTimePicker,
  TREdit, FPreview, Menus, fcLabel, FOkCancelarInv;

type
  TfrmConsCartRendVar = class(TfrmOkCancelarInv)
    qryConsCarteira: TwwQuery;
    dtsConsCarteira: TwwDataSource;
    Label3: TLabel;
    qryEmissor: TwwQuery;
    qryEmissorSIGLAEMISSOR: TStringField;
    qryEmissorIDEMISSOR: TFloatField;
    pnlConsulta: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    edData: TCMDateTimePicker;
    dblConsCarteira: TwwDBLookupCombo;
    Label4: TLabel;
    dblConsEmissor: TwwDBLookupCombo;
    dbGConsRVariavel: TwwDBGrid;
    rgbCotMercado: TRadioGroup;
    pmnuConsCartRenVar: TPopupMenu;
    FixarColuna1: TMenuItem;
    LiberarColuna1: TMenuItem;
    N1: TMenuItem;
    LiberaTodasasColunas1: TMenuItem;
    bt_Imprime: TBitBtn;
    ToolbarSep973: TToolbarSep97;
    qryConsCarteiraIDCARTEIRA: TStringField;
    qryConsCarteiraIDCARTEIRAINVEST: TFloatField;
    qryConsCarteiraIDCARTEIRAGERENC: TFloatField;
    qryConsCarteiraDESCCARTINVEST: TStringField;
    qryConsCarteiraIDTIPOINVEST: TFloatField;
    qryConsCarteiraIDMERCADO: TFloatField;
    qryPlanPrevCtbPatr: TwwQuery;
    qryPlanPrevCtbPatrIDPLANPREVCTBPATR: TFloatField;
    qryPlanPrevCtbPatrIDPLANOPREV: TFloatField;
    qryPlanPrevCtbPatrIDPATRO: TFloatField;
    qryPlanPrevCtbPatrPLANPRVCONTABPATRO: TStringField;
    dblPlanPrevCtbPatr: TwwDBLookupCombo;
    Label5: TLabel;
    QryUltDataMov: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bt_ImprimeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pmnuConsCartRenVarPopup(Sender: TObject);
    procedure FixarColuna1Click(Sender: TObject);
    procedure LiberarColuna1Click(Sender: TObject);
    procedure LiberaTodasasColunas1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure edDataEnter(Sender: TObject);
    procedure edDataExit(Sender: TObject);
    procedure dblPlanPrevCtbPatrEnter(Sender: TObject);
    procedure dblPlanPrevCtbPatrExit(Sender: TObject);
    procedure dblConsCarteiraEnter(Sender: TObject);
    procedure dblConsCarteiraExit(Sender: TObject);
    procedure dblConsEmissorEnter(Sender: TObject);
    procedure dblConsEmissorExit(Sender: TObject);
    procedure dblPlanPrevCtbPatrCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblConsCarteiraCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblConsEmissorCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblConsEmissorChange(Sender: TObject);
    procedure dblConsCarteiraChange(Sender: TObject);
    procedure dblPlanPrevCtbPatrChange(Sender: TObject);
    procedure edDataCloseUp(Sender: TObject);
  private
    Procedure CalculaValorImportado;
    procedure AbreEmissor;
    Procedure AbreQuery;
    procedure FechaQuery(bEmissor: Boolean = False);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsCartRendVar      : TfrmConsCartRendVar;
  edDataAnt, dDtaAtual, dDtaAnterior : TDateTime;
  iPlanPatroAnt, iCarteiraAnt, iEmissorAnt: Integer;

implementation

{$R *.DFM}
Uses DBaseDados, UOperComum, FDmRelatorio, UDiasUteisInv, UBibliotecaInvest,
  FDmRelConsCartRenVar, UMensErro;

Procedure TfrmConsCartRendVar.CalculaValorImportado;
Var wSaldo, wSaldoAnt, wCotacao1 : Double;
begin
   //AL_2 - Ini
   wSaldo := 0;
   wSaldoAnt := 0;
   // Valor Importado
   DmRelConsCartRenVar.qryConsCartRendVar.First;
   While Not DmRelConsCartRenVar.qryConsCartRendVar.Eof Do
   Begin
      wCotacao1 := OperComum.BuscaCotacaoAcao(DmRelConsCartRenVar.QryConsCartRendVar.FieldByName('IDINVESTIMENTO').AsInteger,
                                              dDtaAtual, True);
      DmRelConsCartRenVar.qryConsCartRendVar.Edit;
      DmRelConsCartRenVar.qryConsCartRendVar.FieldByName('COTACAO').AsFloat := wCotacao1;
      DmRelConsCartRenVar.qryConsCartRendVar.FieldByName('SALDO').AsFloat   :=
                   (DmRelConsCartRenVar.qryConsCartRendVar.FieldByName('QTDE').AsFloat * wCotacao1);

      wCotacao1 := OperComum.BuscaCotacaoAcao(DmRelConsCartRenVar.qryConsCartRendVar.FieldByName('IDINVESTIMENTO').AsInteger,
                                              dDtaAnterior, True);

      DmRelConsCartRenVar.qryConsCartRendVar.FieldByName('SALDOANTERIOR').AsFloat   :=
                   (DmRelConsCartRenVar.qryConsCartRendVar.FieldByName('QTDEANTERIOR').AsFloat * wCotacao1);
      DmRelConsCartRenVar.qryConsCartRendVar.FieldByName('VARIACAO').AsFloat   :=
                   (DmRelConsCartRenVar.qryConsCartRendVar.FieldByName('SALDO').AsFloat-
                    DmRelConsCartRenVar.qryConsCartRendVar.FieldByName('SALDOANTERIOR').AsFloat);

      DmRelConsCartRenVar.qryConsCartRendVar.Post;

      wSaldo := wSaldo + DmRelConsCartRenVar.qryConsCartRendVar.FieldByName('SALDO').AsFloat;
      wSaldoAnt := wSaldoAnt + DmRelConsCartRenVar.qryConsCartRendVar.FieldByName('SALDOANTERIOR').AsFloat;

      DmRelConsCartRenVar.qryConsCartRendVar.Next;
   End;
   dbGConsRVariavel.ColumnByName('DESCINVESTIMENTO').FooterValue := 'Saldo Total';
   dbGConsRVariavel.ColumnByName('SALDO').FooterValue := FormatFloat('###,###,###,###,##0.00', wSaldo);
   dbGConsRVariavel.ColumnByName('SALDOANTERIOR').FooterValue := FormatFloat('###,###,###,###,##0.00', wSaldoAnt);
   //AL_2 - Fim
end;

Procedure TfrmConsCartRendVar.AbreQuery;
begin
   //AL_5 - Ini
   If (Trim(edData.Text) <> '') Then
   Begin
      If (dblConsCarteira.LookupValue <> '') Then
      begin
         OperComum.LimpaParametros(QryUltDataMov);
         QryUltDataMov.ParamByName('IDCARTEIRAINVEST').AsInteger := qryConsCarteiraIDCARTEIRAINVEST.AsInteger;
         QryUltDataMov.ParamByName('DATAMOVCARTINV').AsDateTime  := StrToDate(edData.Text);
         QryUltDataMov.Open;
         dDtaAtual    := QryUltDataMov.FieldByName('DATAMOVCARTINV').AsDateTime;
         QryUltDataMov.Close;

         If dDtaAtual <> 0 Then
            edData.Text  := DateToStr(dDtaAtual);
      end;

      dDtaAnterior := StrToDate(edData.Text) - 1;
      While not DiasUteisInv.DiaUtil(dDtaAnterior,-1,1,'',True,False,False) Do
         dDtaAnterior := dDtaAnterior - 1;   // Achar o dia útil anterior

      //AL_2 - Ini
      try
         DmRelConsCartRenVar.qryConsCartRendVar.DisableControls;

         OperComum.LimpaParametros(DmRelConsCartRenVar.qryConsCartRendVar);
         DmRelConsCartRenVar.qryConsCartRendVar.ParamByName('DATAATUAL').AsString    := edData.Text;
         DmRelConsCartRenVar.qryConsCartRendVar.ParamByName('DATAANTERIOR').AsString := DateToStr(dDtaAnterior);

         //Al_3
         if (dblPlanPrevCtbPatr.Text <> '') then
            DmRelConsCartRenVar.qryConsCartRendVar.ParamByName('IDPLANPREVCTBPATR').AsInteger :=
                                qryPlanPrevCtbPatr.FieldByName('IDPLANPREVCTBPATR').AsInteger;
         //Al_3
         if (dblConsCarteira.Text <> '') then
         begin
            if qryConsCarteira.FieldByName('IDCARTEIRAGERENC').AsInteger <> 0 Then
               DmRelConsCartRenVar.qryConsCartRendVar.ParamByName('IDCARTEIRAGERENC').AsInteger :=
                                   qryConsCarteira.FieldByName('IDCARTEIRAGERENC').AsInteger;

            DmRelConsCartRenVar.qryConsCartRendVar.ParamByName('IDCARTEIRAINVEST').AsInteger :=
                                   qryConsCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger;
         end;

         if dblConsEmissor.Text <> '' then
            DmRelConsCartRenVar.qryConsCartRendVar.ParamByName('IDEMISSOR').AsInteger     :=
                                                         StrToInt(Trim(dblConsEmissor.LookupValue));
         DmRelConsCartRenVar.qryConsCartRendVar.Open;
         dbGConsRVariavel.ColumnByName('DESCINVESTIMENTO').FooterValue := 'Saldo Total';
         dbGConsRVariavel.ColumnByName('SALDO').FooterValue := FormatFloat('###,###,###,###,##0.00', DmRelConsCartRenVar.qryConsCartRendVar.FieldByName('TOTALSALDO').AsFloat);
         dbGConsRVariavel.ColumnByName('SALDOANTERIOR').FooterValue := FormatFloat('###,###,###,###,##0.00', DmRelConsCartRenVar.qryConsCartRendVar.FieldByName('TOTALSALDOANT').AsFloat);
         DmRelConsCartRenVar.qryConsCartRendVar.First;
      finally
         DmRelConsCartRenVar.qryConsCartRendVar.EnableControls;
      end;
      //AL_2 - Fim
   End;
   dbGConsRVariavel.FixedCols := 4;
   LiberaTodasasColunas1.Enabled := True;
   LiberarColuna1.Enabled := True;
   FixarColuna1.Enabled := True;
   //AL_5 - Ini
end;

procedure TfrmConsCartRendVar.FormCreate(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled := True;
  WindowState      := wsMaximized;
  qryConsCarteira.Open;
  //AL_2
  qryPlanPrevCtbPatr.Open;
end;

procedure TfrmConsCartRendVar.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  //AL_2
  //AL_5
  FechaQuery;
  edData.Text := '';
  dblConsCarteira.text := '';
  dblConsEmissor.Text := '';
  dblPlanPrevCtbPatr.Text := '';
  edData.SetFocus;
  dbGConsRVariavel.FixedCols := 0;
  LiberaTodasasColunas1.Enabled := False;
  LiberarColuna1.Enabled := False;
  FixarColuna1.Enabled := False;
end;

procedure TfrmConsCartRendVar.FormShow(Sender: TObject);
begin
  inherited;
  OperComum.LimpaParametros(qryEmissor);
  qryEmissor.Open;
  qryConsCarteira.Open;
  //AL_2 - Ini
  qryPlanPrevCtbPatr.Open;
  OperComum.LimpaParametros(DmRelConsCartRenVar.qryConsCartRendVar);
  DmRelConsCartRenVar.qryConsCartRendVar.Open;
  dbGConsRVariavel.ColumnByName('DESCINVESTIMENTO').FooterValue := 'Saldo Total';
  dbGConsRVariavel.ColumnByName('SALDO').FooterValue := '';
  dbGConsRVariavel.ColumnByName('SALDOANTERIOR').FooterValue := '';
  //AL_2 - Fim

end;

procedure TfrmConsCartRendVar.bt_ImprimeClick(Sender: TObject);
begin
   inherited;
   //AL_2 - Ini
   //AL_5 - Ini
   //AL_6
   DmRelConsCartRenVar.ppLData.Caption := edData.Text;
   try
      if not DmRelConsCartRenVar.qryConsCartRendVar.IsEmpty then
         TfrmPreview.CreateModalPreview(Application,
                                        DmRelConsCartRenVar.RpConsCartRendVar,
                                        DmRelConsCartRenVar.RpConsCartRendVar.PrinterSetup.DocumentName);
   finally
   end;
   //AL_5 - Fim
   //AL_2 - Fim
end;

procedure TfrmConsCartRendVar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   //AL_2
   DmRelConsCartRenVar.qryConsCartRendVar.Close;
end;

procedure TfrmConsCartRendVar.pmnuConsCartRenVarPopup(Sender: TObject);
begin
  inherited;
  if dbGConsRVariavel.DataSource.DataSet.Active then
  begin
     if dbGConsRVariavel.FixedCols = 0 then begin
        LiberarColuna1.Enabled := False;
        LiberaTodasasColunas1.Enabled := False;
        end
     else begin
        LiberarColuna1.Enabled := True;
        LiberaTodasasColunas1.Enabled := True;
     end;

     if dbGConsRVariavel.FixedCols = dbGConsRVariavel.GetColCount then
        FixarColuna1.Enabled := False
     else
        FixarColuna1.Enabled := True;
  end
  else
  begin
     LiberarColuna1.Enabled := False;
     LiberaTodasasColunas1.Enabled := False;
     FixarColuna1.Enabled := False
  end;

end;

procedure TfrmConsCartRendVar.FixarColuna1Click(Sender: TObject);
begin
  inherited;
  dbGConsRVariavel.FixedCols := dbGConsRVariavel.FixedCols + 1;
end;

procedure TfrmConsCartRendVar.LiberarColuna1Click(Sender: TObject);
begin
  inherited;
  dbGConsRVariavel.FixedCols := dbGConsRVariavel.FixedCols - 1;
end;

procedure TfrmConsCartRendVar.LiberaTodasasColunas1Click(Sender: TObject);
begin
  inherited;
  dbGConsRVariavel.FixedCols := 0;
end;

procedure TfrmConsCartRendVar.FormActivate(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled := True;
  WindowState      := wsMaximized;
end;

procedure TfrmConsCartRendVar.bbtnSairClick(Sender: TObject);
begin
  //AL_2
  DmRelConsCartRenVar.qryConsCartRendVar.Close;
  inherited;
end;

//AL_2
procedure TfrmConsCartRendVar.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if edData.Date <= pRpi.DATARELMOVIMENTO then
    AbreQuery
  else
    MsgDlg('Consulta/Impressão somente permitido para data até '+ DateToStr(pRpi.DATARELMOVIMENTO) +' !!','Mensagem do Sistema',mtWarning,[MbOk],0);
end;

procedure TfrmConsCartRendVar.AbreEmissor;
begin
   if (Trim(edData.Text) <> '') then
   begin
      try
         OperComum.LimpaParametros(qryEmissor);
         qryEmissor.ParamByName('DATAATUAL').AsString    := edData.Text;
         if dblConsCarteira.Text <> '' then
         begin
            qryEmissor.ParamByName('IDCARTEIRAINVEST').AsInteger := qryConsCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger;
            if not qryConsCarteira.FieldByName('IDCARTEIRAGERENC').IsNull then
               qryEmissor.ParamByName('IDCARTEIRAGERENC').AsInteger := qryConsCarteira.FieldByName('IDCARTEIRAGERENC').AsInteger;
         end;
         if dblPlanPrevCtbPatr.Text <> '' then
            qryEmissor.ParamByName('IDPLANPREVCTBPATR').AsInteger := qryPlanPrevCtbPatr.FieldByName('IDPLANPREVCTBPATR').AsInteger;
      finally
         qryEmissor.Open;
      end;
   end;
end;

procedure TfrmConsCartRendVar.edDataEnter(Sender: TObject);
begin
  inherited;
  edDataAnt := edData.DateTime;
end;

procedure TfrmConsCartRendVar.edDataExit(Sender: TObject);
begin
  inherited;
  //AL_6
  if ((edDataAnt <> 0) and (edDataAnt <> edData.DateTime)) then
     FechaQuery;
end;

procedure TfrmConsCartRendVar.dblPlanPrevCtbPatrEnter(Sender: TObject);
begin
  inherited;
  iPlanPatroAnt := qryPlanPrevCtbPatr.FieldByName('IDPLANPREVCTBPATR').asInteger;
end;

procedure TfrmConsCartRendVar.dblPlanPrevCtbPatrExit(Sender: TObject);
begin
  inherited;
  if iPlanPatroAnt <> qryPlanPrevCtbPatr.FieldByName('IDPLANPREVCTBPATR').asInteger then
     FechaQuery;
end;

procedure TfrmConsCartRendVar.dblConsCarteiraEnter(Sender: TObject);
begin
  inherited;
  iCarteiraAnt := qryConsCarteira.FieldByName('IDCARTEIRAINVEST').asInteger;
end;

procedure TfrmConsCartRendVar.dblConsCarteiraExit(Sender: TObject);
begin
  inherited;
  if iCarteiraAnt <> qryConsCarteira.FieldByName('IDCARTEIRAINVEST').asInteger then
     FechaQuery;
end;

procedure TfrmConsCartRendVar.dblConsEmissorEnter(Sender: TObject);
begin
  inherited;
  iEmissorAnt := 0;
  if qryEmissor.RecordCount = 0 then
     AbreEmissor
  else
     if Trim(dblConsEmissor.Text) <> '' then
        iEmissorAnt := qryEmissor.FieldByName('IDEMISSOR').asInteger;
end;

procedure TfrmConsCartRendVar.dblConsEmissorExit(Sender: TObject);
begin
  inherited;
  if ((iEmissorAnt <> qryEmissor.FieldByName('IDEMISSOR').asInteger) and (iEmissorAnt <> 0)) or
     ((iEmissorAnt = 0) and (Trim(dblConsEmissor.Text) <> '')) then
     FechaQuery(True);
end;

procedure TfrmConsCartRendVar.FechaQuery(bEmissor: Boolean = False);
begin
   OperComum.LimpaParametros(DmRelConsCartRenVar.qryConsCartRendVar);
   DmRelConsCartRenVar.qryConsCartRendVar.Open;
   dbGConsRVariavel.ColumnByName('DESCINVESTIMENTO').FooterValue := 'Saldo Total';
   dbGConsRVariavel.ColumnByName('SALDO').FooterValue := '';
   dbGConsRVariavel.ColumnByName('SALDOANTERIOR').FooterValue := '';
   if Trim(dblConsEmissor.Text) <> '' then
      iEmissorAnt := qryEmissor.FieldByName('IDEMISSOR').asInteger;
   if not bEmissor then
   begin
      OperComum.LimpaParametros(qryEmissor);
      qryEmissor.Open;
      qryEmissor.First;
      if qryEmissor.Locate('IDEMISSOR', iEmissorAnt, []) then
      begin
         dblConsEmissor.Text := qryEmissor.FieldByName('SIGLAEMISSOR').AsString;
         dblConsEmissor.PerformSearch;
      end;
   end;
end;

procedure TfrmConsCartRendVar.dblPlanPrevCtbPatrCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then
     FechaQuery;
end;

procedure TfrmConsCartRendVar.dblConsCarteiraCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then
     FechaQuery;
end;

procedure TfrmConsCartRendVar.dblConsEmissorCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then
     FechaQuery(True);
end;

procedure TfrmConsCartRendVar.dblConsEmissorChange(Sender: TObject);
begin
  inherited;
  if (iEmissorAnt <> 0) and (Trim(dblConsEmissor.Text) = '') then
     FechaQuery(True);
end;

procedure TfrmConsCartRendVar.dblConsCarteiraChange(Sender: TObject);
begin
  inherited;
  if (iCarteiraAnt <> 0) and (Trim(dblConsCarteira.Text) = '') then
     FechaQuery;
end;

procedure TfrmConsCartRendVar.dblPlanPrevCtbPatrChange(Sender: TObject);
begin
  inherited;
  if (iPlanPatroAnt <> 0) and (Trim(dblPlanPrevCtbPatr.Text) = '') then
     FechaQuery;
end;

procedure TfrmConsCartRendVar.edDataCloseUp(Sender: TObject);
begin
  inherited;
  if edDataAnt <> edData.DateTime then
     FechaQuery;
end;

end.
