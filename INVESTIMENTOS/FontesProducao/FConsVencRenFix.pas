unit FConsVencRenFix;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, StdCtrls, wwdblook, Db, DBTables, Wwquery, Wwdatsrc,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls,checklst, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TFrmConsVencRenFix = class(TfrmSairAjuda)
    DsHistorico: TwwDataSource;
    RadioGroup1: TRadioGroup;
    QryPesquisaBasica: TwwQuery;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Splitter1: TSplitter;
    QryCarteira: TwwQuery;
    LkcCarteira: TwwDBLookupCombo;
    Label2: TLabel;
    Image1: TImage;
    QryAux: TwwQuery;
    UpdHistorico: TUpdateSQL;
    Label4: TLabel;
    DbLkEmissor: TwwDBLookupCombo;
    QryEmissor: TwwQuery;
    QryEmissorIDEMISSOR: TFloatField;
    QryEmissorSIGLAEMISSOR: TStringField;
    CkLstClasse: TCheckListBox;
    Label5: TLabel;
    Label6: TLabel;
    edDataIni: TCMDateTimePicker;
    Label7: TLabel;
    Label8: TLabel;
    wwDBGrid1: TwwDBGrid;
    qryHistorico: TwwQuery;
    edDataFim: TCMDateTimePicker;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RadioGroup1Click(Sender: TObject);
    procedure LkcCarteiraEnter(Sender: TObject);
    procedure QryHistoricoAfterOpen(DataSet: TDataSet);
    procedure DbLkEmissorChange(Sender: TObject);
    procedure edDataIniExit(Sender: TObject);
    procedure edDataFimExit(Sender: TObject);
    procedure CkLstClasseClick(Sender: TObject);
    procedure LkcCarteiraChange(Sender: TObject);
  private
    { Private declarations }
    procedure RefazQuery;
  public
    { Public declarations }
  end;

var
  FrmConsVencRenFix: TFrmConsVencRenFix;
  wCotacaoMoeda:Double;
  wDataCotacao   :TDateTime;
implementation

Uses UBibliotecaInvest, UOperacaoInvest, UOperComum, dOperComum, UMensErro;

{$R *.DFM}

procedure TFrmConsVencRenFix.FormShow(Sender: TObject);
begin
  inherited;

  QryEmissor.Open;
  QryCarteira.Open;
  QryHistorico.Close;

end;

procedure TFrmConsVencRenFix.FormClose(Sender: TObject;  Var Action: TCloseAction);
begin
  inherited;
  QryEmissor.Close;
  QryCarteira.Close;
  QryHistorico.Close;
end;

procedure TFrmConsVencRenFix.RadioGroup1Click(Sender: TObject);
Var
  wSQL:String;
begin
  inherited;
  RefazQuery;
end;

procedure TFrmConsVencRenFix.LkcCarteiraEnter(Sender: TObject);
begin
  inherited;
  LkcCarteira.Text:=QryCarteira['DESCCARTINVEST'];
end;

procedure TFrmConsVencRenFix.QryHistoricoAfterOpen(DataSet: TDataSet);
begin
  inherited;
  With DataSet Do Begin
    DisableControls;
    First;
    While Not Eof Do Begin
      Edit;

// Busca Saldo Atualizado do Investimento
      FazQuery(QryAux,
      'SELECT  H1.SALDOVLRINVCART, H1.IDCARTEIRAINVEST '+
      'FROM HISTCARTINV H1 '+
      'WHERE '+
      '(IDINVESTIMENTO ='+QuotedStr(IntToStr(FieldByName('IDINVESTIMENTO').AsInteger)+') AND '+
      ' ((('''+FieldByName('IDLOTE').AsString+''' IS NOT NULL) AND (IDLOTE =:IDLOTE)) OR (('''+FieldByName('IDLOTE').AsString+''' IS NULL) AND (H1.IDLOTE IS NULL))) AND '+
      ' (H1.DATAMOVCARTINV = '+
      '       (SELECT MAX(H2.DATAMOVCARTINV) '+
      '        FROM   HISTCARTINV H2 '+
      '         WHERE (H2.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST) AND '+
      '                        (H2.IDINVESTIMENTO   = H1.IDINVESTIMENTO) AND '+
      '                        (((H1.IDLOTE IS NOT NULL) AND (H2.IDLOTE =H1.IDLOTE)) OR ((H1.IDLOTE IS NULL) AND (H2.IDLOTE IS NULL))) AND '+
      '                        (H2.DATAMOVCARTINV  <= SYSDATE))) AND ' +
      ' (H1.IDHISTCARTINV   = '+
      '       (SELECT MAX(H3.IDHISTCARTINV) '+
      '        FROM   HISTCARTINV H3 '+
      '        WHERE (H3.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST) AND '+
      '                      (H3.IDINVESTIMENTO   = H1.IDINVESTIMENTO) AND '+
      '                      (((H1.IDLOTE IS NOT NULL) AND (H3.IDLOTE =H1.IDLOTE)) OR ((H1.IDLOTE IS NULL) AND (H3.IDLOTE IS NULL))) AND '+
      '                      (H3.DATAMOVCARTINV   = H1.DATAMOVCARTINV))) '+
      'ORDER BY '+
      'DATAMOVCARTINV DESC, IDHISTCARTINV DESC '));

      FieldByName('SALDOATUAL').AsFloat:=QryAux.FieldByName('SALDOVLRINVCART').AsFloat;
      FieldByName('IDCARTEIRA').AsInteger:=QryAux.FieldByName('IDCARTEIRAINVEST').AsInteger;
      Post;

      Next;
    End;
    First;
    EnableControls;
  End;
end;

procedure TFrmConsVencRenFix.DbLkEmissorChange(Sender: TObject);
begin
  inherited;
  RefazQuery;
end;

Procedure TfrmConsVencRenFix.RefazQuery;
var
  bPrimeiro : boolean;
  sSQL : string;
  I : integer;
Begin
  QryHistorico.Close;
  bPrimeiro := true;

  QryHistorico.Sql.Text:= QryPesquisaBasica.Sql.GetText;

// Data Inicial
  If trim(edDataIni.Text) <> '' Then
     Begin
      QryHistorico.Sql.Text:=  QryHistorico.Sql.Text +
        ' AND (CO.DATAVENCIM >= TO_DATE('''+DateToStr(edDataIni.Date)+''',''DD/MM/YYYY'')) ';
     End;

// Data Final
  If trim(edDataFim.Text) <> '' Then
     Begin
      QryHistorico.Sql.Text:=  QryHistorico.Sql.Text +
        ' AND (CO.DATAVENCIM <= TO_DATE('''+DateToStr(edDataFim.Date)+''',''DD/MM/YYYY'')) ';
     End;

// Emissor
  If QryEmissor.FieldByName('IDEMISSOR').AsInteger <> 0 Then
      QryHistorico.Sql.Text:=  QryHistorico.Sql.Text +
        ' AND (IV.IDEMISSOR = '+QuotedStr(QryEmissor.FieldByName('IDEMISSOR').AsString)+')';

// Tipo
  For I:=0 To (CkLstClasse.Items.Count-1) Do Begin
// Caso Checado inclui filtro em HistCartInv
    If CkLstClasse.Checked[I] Then Begin

      if bPrimeiro then begin
        sSQL := ' AND (';
        bPrimeiro := false;
      end else
        sSQL := ' OR ';

      Case I Of
         0: sSQL := sSQL + ' (TP.IDCLASSETIT = 1) ';
         1: sSQL := sSQL + ' (TP.IDCLASSETIT = 2) ';
         2: sSQL := sSQL + ' (TP.IDCLASSETIT = 3) ';
         3: sSQL := sSQL + ' (TP.IDCLASSETIT = 4) ';
      End;

      QryHistorico.Sql.Text:=  QryHistorico.Sql.Text + sSQL;

    End;
  End;

  if not bPrimeiro then
    QryHistorico.Sql.Text:=  QryHistorico.Sql.Text + ' ) ';

// Define Ordenação da Query
  If RadioGroup1.ItemIndex = 0 Then Begin
    QryHistorico.Sql.Text:=  QryHistorico.Sql.Text +
      ' ORDER BY CO.DATAVENCIM ';
  End Else Begin
    QryHistorico.Sql.Text:=  QryHistorico.Sql.Text +
      ' ORDER BY CO.DATAVENCIM DESC ';
  End;

// Abre a Query
  QryHistorico.Open;
  bPrimeiro := true;
end;

procedure TFrmConsVencRenFix.edDataIniExit(Sender: TObject);
begin
  inherited;
  RefazQuery;
end;

procedure TFrmConsVencRenFix.edDataFimExit(Sender: TObject);
begin
  inherited;
  RefazQuery;
end;

procedure TFrmConsVencRenFix.CkLstClasseClick(Sender: TObject);
begin
  inherited;
  RefazQuery;
end;

procedure TFrmConsVencRenFix.LkcCarteiraChange(Sender: TObject);
begin
  inherited;
  RefazQuery;
end;

end.

