//******************************************************************************
// Data     : 09/06/2006
// Código   : AL_1
// Pendencia:
// SOL      :
// Desc     : Ajuste na consulta da carteira para não trazer duplicidade
//******************************************************************************

unit FConsHistInvest;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, StdCtrls, wwdblook, Db, DBTables, Wwquery, Wwdatsrc,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls,checklst, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TFrmConsHistInvest = class(TfrmSairAjuda)
    DsInvestimento: TwwDataSource;
    QryInvestimento: TwwQuery;
    QryHistorico: TwwQuery;
    DsHistorico: TwwDataSource;
    RadioGroup1: TRadioGroup;
    QryPesquisaBasica: TwwQuery;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid: TwwDBGrid;
    Splitter1: TSplitter;
    DBGridIButton: TwwIButton;
    QryCarteira: TwwQuery;
    LkcCarteira: TwwDBLookupCombo;
    LkcInvestimento: TwwDBLookupCombo;
    Label1: TLabel;
    Label2: TLabel;
    QryHistoricoIDCARTEIRAINVEST: TFloatField;
    QryHistoricoDATAMOVCARTINV: TDateTimeField;
    QryHistoricoSALDOVLRINVCART: TFloatField;
    QryHistoricoSALDOQTDEINVCART: TFloatField;
    QryHistoricoIDINVESTIMENTO: TFloatField;
    QryHistoricoIDTIPOOPERACAO: TFloatField;
    QryHistoricoHISTMOVCARTINV: TStringField;
    QryHistoricoTIPMOVCARTINV: TStringField;
    QryHistoricoDESCINVESTIMENTO: TStringField;
    QryHistoricoVLRMOVCARTINV: TFloatField;
    QryHistoricoCOTASMOVCARTINV: TFloatField;
    QryHistoricoSALDOCOTASCARTINV: TFloatField;
    QryHistoricoIDOPERACAOINVEST: TFloatField;
    QryHistoricoQTDEMOVINVCART: TFloatField;
    QryLote: TwwQuery;
    QryLoteIDLOTE: TStringField;
    QryInvestimentoIDINVESTIMENTO: TFloatField;
    QryInvestimentoDESCINVESTIMENTO: TStringField;
    QryHistoricoIDLOTE: TStringField;
    QryHistoricoMOVIMATU: TFloatField;
    QryHistoricoSALDOATU: TFloatField;
    QryHistoricoMOVIMCAR: TFloatField;
    QryHistoricoSALDOCAR: TFloatField;
    QryHistoricoMOVIMAQUI: TFloatField;
    QryHistoricoSALDOAQUI: TFloatField;
    QryHistoricoSALDOREND: TFloatField;
    Image1: TImage;
    QryHistoricoNATURMOVCARTINV: TStringField;
    QryAux: TwwQuery;
    UpdHistorico: TUpdateSQL;
    Label4: TLabel;
    DbLkEmissor: TwwDBLookupCombo;
    QryEmissor: TwwQuery;
    QryEmissorIDEMISSOR: TFloatField;
    QryEmissorSIGLAEMISSOR: TStringField;
    Label3: TLabel;
    DbLkcLote: TwwDBLookupCombo;
    CkLstTpMov: TCheckListBox;
    Label5: TLabel;
    Label6: TLabel;
    edDataIni: TCMDateTimePicker;
    Label7: TLabel;
    Label8: TLabel;
    edDataFim: TCMDateTimePicker;
    QryCarteiraID: TFloatField;
    QryCarteiraIDCARTEIRAINVEST: TFloatField;
    QryCarteiraIDCARTEIRAGERENC: TFloatField;
    QryCarteiraDESCCARTINVEST: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RadioGroup1Click(Sender: TObject);
    procedure LkcCarteiraEnter(Sender: TObject);
    procedure QryHistoricoAfterOpen(DataSet: TDataSet);
    procedure DbLkEmissorChange(Sender: TObject);
    procedure CkLstTpMovClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure QryLoteAfterOpen(DataSet: TDataSet);
    procedure LkcInvestimentoNotInList(Sender: TObject;
      LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
    procedure QryInvestimentoAfterOpen(DataSet: TDataSet);
    procedure edDataIniExit(Sender: TObject);
    procedure edDataFimExit(Sender: TObject);
    procedure LkcInvestimentoExit(Sender: TObject);
    procedure DbLkcLoteExit(Sender: TObject);
    procedure LkcCarteiraExit(Sender: TObject);
  private
    { Private declarations }
    procedure RefazQuery;
  public
    { Public declarations }
  end;

var
  FrmConsHistInvest: TFrmConsHistInvest;
  wCotacaoMoeda:Double;
  wDataCotacao   :TDateTime;
implementation

Uses UBibliotecaInvest, UOperacaoInvest, UOperComum, dOperComum, UMensErro, FPrincipal;

{$R *.DFM}

procedure TFrmConsHistInvest.FormShow(Sender: TObject);
Var
  TipoEmissor:String;
begin
  inherited;

  If TipoMenuInvest = 'A' Then
    TipoEmissor := '1,2,5,6'
  Else If TipoMenuInvest = 'F' Then
    TipoEmissor := '1'
  Else If TipoMenuInvest = 'V' Then
    TipoEmissor := '2'
  Else If TipoMenuInvest = 'I' Then
    TipoEmissor := '5,6'
  Else If TipoMenuInvest = 'B' Then
    TipoEmissor := '8'
  else
    TipoEmissor := '0';

  FazQuery(QryEmissor, ' SELECT IDEMISSOR, SIGLAEMISSOR FROM EMISSOR '+
                       ' WHERE IDEMISSOR IN (SELECT IDEMISSOR FROM INVESTIMENTO '+
                       ' WHERE IDTIPOINVEST IN ('+TipoEmissor+')) '+
                       ' ORDER BY SIGLAEMISSOR ');

  If pRPI.FLGCARTGERENC = 'S' Then
  Begin
     With QryCarteira Do
     Begin
        Close;
        Sql.Clear;
        //AL_1
        Sql.Add('SELECT (IDCARTEIRAINVEST+IDCARTEIRAGERENC+100) AS ID,');
        Sql.Add('IDCARTEIRAINVEST, IDCARTEIRAGERENC,');
        Sql.Add('DESCCARTGERENC AS DESCCARTINVEST FROM CARTEIRAGERENC ');
        Sql.Add('UNION                                     ');
        Sql.Add('SELECT (IDCARTEIRAINVEST) AS ID,');
        Sql.Add('IDCARTEIRAINVEST, 0 AS IDCARTEIRAGERENC,');
        Sql.Add('DESCCARTINVEST FROM  CARTEIRAINVEST ');
        Sql.Add('ORDER BY DESCCARTINVEST');
     End;
  End;
  QryCarteira.Open;
  QryInvestimento.Open;
  QryLote.Open;

  QryHistorico.Close;
// Transfere a Query
  QryHistorico.Sql.Text:=
  QryPesquisaBasica.Sql.GetText+'ORDER BY HC.DATAMOVCARTINV DESC, HC.IDHISTCARTINV DESC ';

// Preenche o Paramento
  QryHistorico.ParamByName('IDINVESTIMENTO').AsInteger  := -1;
  QryHistorico.ParamByName('IDCARTEIRAINVEST').AsInteger:= -1;
  QryHistorico.Open;

  LkcCarteira.Text     := QryCarteira.FieldByName('DESCCARTINVEST').AsString;

// Busca Cotacao da Moeda Atuarial
  If Not OperComum.BuscaCotacaoMoeda(pRPI.MOEDAATU, Date,
                           '<=', wCotacaoMoeda, wDataCotacao) Then Begin
     MsgDlg('Moeda Atuarial sem cotações .','Mensagem do Sistema',MtWarning,[MbOk],0);
     Exit;
  End;
end;

procedure TFrmConsHistInvest.FormClose(Sender: TObject;  Var Action: TCloseAction);
begin
  inherited;
  QryEmissor.Close;
  QryCarteira.Close;
  QryInvestimento.Close;
  QryHistorico.Close;
  QryLote.Close;
end;

procedure TFrmConsHistInvest.RadioGroup1Click(Sender: TObject);
Var
  wSQL:String;
begin
  inherited;
  RefazQuery;
end;

procedure TFrmConsHistInvest.LkcCarteiraEnter(Sender: TObject);
begin
  inherited;
  LkcCarteira.Text:=QryCarteira['DESCCARTINVEST'];
end;

procedure TFrmConsHistInvest.QryHistoricoAfterOpen(DataSet: TDataSet);
begin
  inherited;
  With DataSet Do
  Begin
    DisableControls;
    First;
    While Not Eof Do
    Begin
      Edit;
      FieldByName('MOVIMATU').AsFloat:=(FieldByName('MOVIMATU').AsFloat*wCotacaoMoeda);
      FieldByName('SALDOATU').AsFloat:=(FieldByName('SALDOATU').AsFloat*wCotacaoMoeda);
      FieldByName('MOVIMCAR').AsFloat:=(FieldByName('MOVIMCAR').AsFloat*wCotacaoMoeda);
      FieldByName('SALDOCAR').AsFloat:=(FieldByName('SALDOCAR').AsFloat*wCotacaoMoeda);
      Post;
      Next;
    End;
    First;
    EnableControls;
  End;
end;

procedure TFrmConsHistInvest.DbLkEmissorChange(Sender: TObject);
begin
  inherited;
// Refresh na combo de Investimento
  QryInvestimento.Close;

// Se não tem emissor, passo -1 para trazer todos os investimentos da carteira
// senão passo como parâmetro para a query o emissor
  If QryEmissor.FieldByName('IDEMISSOR').AsInteger = 0 Then
     QryInvestimento.ParamByName('pIDEMISSOR').AsInteger := -1
  Else
     QryInvestimento.ParamByName('pIDEMISSOR').AsInteger
          := QryEmissor.FieldByName('IDEMISSOR').AsInteger;
  QryInvestimento.Open;

end;

Procedure TfrmConsHistInvest.RefazQuery;
var
  bPrimeiro : boolean;
  sSQL : string;
  I : integer;
Begin
 QryHistorico.DisableControls;
  QryHistorico.Close;
  bPrimeiro := true;

  QryHistorico.Sql.Text:= QryPesquisaBasica.Sql.GetText;

// Preenche o Paramento
  QryHistorico.ParamByName('IDINVESTIMENTO').AsInteger  :=
               QryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger;
  QryHistorico.ParamByName('IDCARTEIRAINVEST').AsInteger:=
               QryCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger;
  If (pRPI.FLGCARTGERENC = 'S') And
     (QryCarteira.FieldByName('IDCARTEIRAGERENC').AsInteger <> 0) Then
     QryHistorico.ParamByName('IDCARTEIRAGERENC').AsInteger:=
                  QryCarteira.FieldByName('IDCARTEIRAGERENC').AsInteger
  Else
     QryHistorico.ParamByName('IDCARTEIRAGERENC').Clear;

// Preenche Emissor
  If Trim(DbLkEmissor.Text) <> ''  Then
    QryHistorico.Sql.Text:=  QryHistorico.Sql.Text +
        ' AND (IV.IDEMISSOR = '+QuotedStr(DbLkEmissor.LookupValue)+')';

  If trim(edDataIni.Text) <> '' Then
     QryHistorico.Sql.Text:=  QryHistorico.Sql.Text +
        ' AND (DATAMOVCARTINV >= TO_DATE('''+DateToStr(edDataIni.Date)+''',''DD/MM/YYYY'')) ';

  If trim(edDataFim.Text) <> '' Then
     QryHistorico.Sql.Text:=  QryHistorico.Sql.Text +
        ' AND (DATAMOVCARTINV <= TO_DATE('''+DateToStr(edDataFim.Date)+''',''DD/MM/YYYY'')) ';

// Transfere a Query Caso Lote seja Escolhido
  If DbLkcLote.Text <> '' Then
      QryHistorico.Sql.Text:=  QryHistorico.Sql.Text +
        ' AND (HC.IDLOTE = '+QuotedStr(DbLkcLote.Value)+')';

// Tipo de Movimentação
  For I:=0 To (CkLstTpMov.Items.Count-1) Do
  Begin
// Caso Checado inclui filtro em HistCartInv
    If CkLstTpMov.Checked[I] Then
    Begin

      if bPrimeiro then
      begin
        sSQL := ' AND (';
        bPrimeiro := false;
      end else
        sSQL := ' OR ';

      Case I of
         0: sSQL := sSQL + ' (HC.TIPMOVCARTINV = ''OPE'' AND NATURMOVCARTINV = ''A'')';
         1: sSQL := sSQL + ' (HC.TIPMOVCARTINV = ''OPE'' AND NATURMOVCARTINV = ''D'')';
         2: sSQL := sSQL + ' (HC.TIPMOVCARTINV = ''DOP'') ';
         3: sSQL := sSQL + ' (HC.TIPMOVCARTINV = ''TRF'') ';
         4: sSQL := sSQL + ' (HC.TIPMOVCARTINV = ''ATU'') ';
         5: sSQL := sSQL + ' (HC.TIPMOVCARTINV = ''LUC'') ';
         6: sSQL := sSQL + ' (HC.TIPMOVCARTINV = ''INI'') ';
         7: sSQL := sSQL + ' (HC.TIPMOVCARTINV = ''OPE'') ';
      end;

      QryHistorico.Sql.Text:=  QryHistorico.Sql.Text + sSQL;

    End;
  End;

  if not bPrimeiro then
    QryHistorico.Sql.Text:=  QryHistorico.Sql.Text + ' ) ';

// Define Ordenação da Query
  If RadioGroup1.ItemIndex = 0 Then
    QryHistorico.Sql.Text:=  QryHistorico.Sql.Text +
      ' ORDER BY HC.DATAMOVCARTINV DESC, HC.IDHISTCARTINV DESC '
  Else
    QryHistorico.Sql.Text:=  QryHistorico.Sql.Text +
      ' ORDER BY HC.DATAMOVCARTINV, HC.IDHISTCARTINV ';
  QryHistorico.EnableControls;
  QryHistorico.Open;
end;

procedure TFrmConsHistInvest.CkLstTpMovClick(Sender: TObject);
begin
  inherited;
  RefazQuery;
end;

procedure TFrmConsHistInvest.FormCreate(Sender: TObject);
begin
  inherited;
  edDataIni.Date := Date-60;
  edDataFim.Date := Date;

end;

procedure TFrmConsHistInvest.QryLoteAfterOpen(DataSet: TDataSet);
begin
  inherited;
  If QryLote.RecordCount = 1 Then
  Begin
    DbLkcLote.LookupValue := QryLote.FieldByName('IDLOTE').AsString;
    DbLkcLote.RefreshDisplay;
  End
  Else
    DbLkcLote.Clear;
end;

procedure TFrmConsHistInvest.LkcInvestimentoNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  inherited;
  LkcInvestimento.Clear;
end;

procedure TFrmConsHistInvest.QryInvestimentoAfterOpen(DataSet: TDataSet);
begin
  inherited;
  If QryInvestimento.RecordCount = 1 Then
  Begin
    LkcInvestimento.LookupValue := QryInvestimento.FieldByName('IDINVESTIMENTO').AsString;
    LkcInvestimento.RefreshDisplay;
  End
  Else
  Begin
    LkcInvestimento.Clear;
    LkcInvestimento.LookupValue := '';
  End;
end;

procedure TFrmConsHistInvest.edDataIniExit(Sender: TObject);
begin
  inherited;
  RefazQuery;
end;

procedure TFrmConsHistInvest.edDataFimExit(Sender: TObject);
begin
  inherited;
  RefazQuery;
end;

procedure TFrmConsHistInvest.LkcInvestimentoExit(Sender: TObject);
begin
  inherited;
  RefazQuery;
end;

procedure TFrmConsHistInvest.DbLkcLoteExit(Sender: TObject);
begin
  inherited;
  If Trim(LkcInvestimento.Text) <> '' Then
     RefazQuery;
end;

procedure TFrmConsHistInvest.LkcCarteiraExit(Sender: TObject);
begin
  inherited;
  If Trim(LkcInvestimento.Text) <> '' Then
     RefazQuery;
end;

end.

