unit FpRelConsHistInvest;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IvDictio, IvMulti, IvEMulti,  MAHlpBtn, TB97Tlbr,
  TB97, StdCtrls, Buttons, ComCtrls, ExtCtrls, Db, Wwdatsrc, DBTables,
  Wwquery, checklst, Grids, Wwdbigrd, Wwdbgrid, wwdblook,
  FOkCancelar, wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmpRelConsHistInvest = class(TFrmOkCancelar)
    QryLote: TwwQuery;
    QryLoteIDLOTE: TStringField;
    QryInvestimento: TwwQuery;
    QryInvestimentoIDINVESTIMENTO: TFloatField;
    QryInvestimentoDESCINVESTIMENTO: TStringField;
    QryCarteira: TwwQuery;
    DsInvestimento: TwwDataSource;
    lblDataIni: TLabel;
    DateEdit1: TCMDateTimePicker;
    DateEdit2: TCMDateTimePicker;
    lblFim: TLabel;
    Label2: TLabel;
    LkcCarteira: TwwDBLookupCombo;
    Label1: TLabel;
    LkcInvestimento: TwwDBLookupCombo;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    DbLkcLote: TwwDBLookupCombo;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Procedure MontaQueryRelat;
    procedure LkcCarteiraChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmpRelConsHistInvest: TFrmpRelConsHistInvest;

implementation

Uses UBibliotecaInvest, UMensErro, FDmRelatorio;

{$R *.DFM}

procedure TFrmpRelConsHistInvest.FormShow(Sender: TObject);
begin
  inherited;
// Acerta PageControl
  QryCarteira.Open;
  QryInvestimento.Open;
  QryLote.Open;
end;

procedure TFrmpRelConsHistInvest.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
// Fecha Tabelas
  QryCarteira.Close;
  QryInvestimento.Close;
  QryLote.Close;
end;

Procedure TFrmpRelConsHistInvest.MontaQueryRelat;
Begin
// Monta o SQL da Query
  If DbLkcLote.Text <> '' Then
  Begin
       DtmRelatorio.QryConsHistInvest.SQL.Clear;
       DtmRelatorio.QryConsHistInvest.SQL.Add('SELECT  HC.IDCARTEIRAINVEST, HC.DATAMOVCARTINV, HC.SALDOVLRINVCART, '+
         '	 HC.SALDOQTDEINVCART, HC.IDINVESTIMENTO, HC.IDTIPOOPERACAO, '+
         '	 HC.HISTMOVCARTINV, HC.TIPMOVCARTINV, IDLOTE, '+
	 '       IV.DESCINVESTIMENTO, HC.VLRMOVCARTINV, HC.COTASMOVCARTINV, '+
         '       HC.SALDOCOTASCARTINV, HC.IDOPERACAOINVEST, HC.QTDEMOVINVCART, '+
         '       HC.MOVIMATU, HC.SALDOATU, HC.MOVIMCAR, HC.SALDOCAR, HC.MOVIMAQUI,'+
         ' 	 HC.SALDOAQUI, HC.SALDOREND, HC.NATURMOVCARTINV '+
         ' FROM  HISTCARTINV HC, INVESTIMENTO IV '+
         ' WHERE 	(HC.DATAMOVCARTINV   >= TO_DATE('''+DateEdit1.Text+''',''DD/MM/YYYY'')) 	AND '+
         '       	(HC.DATAMOVCARTINV   <= TO_DATE('''+DateEdit2.Text+''',''DD/MM/YYYY'')) 	AND '+
         '              (HC.IDLOTE = '''+DbLkcLote.LookupValue+''') AND'+
         '	        (HC.IDINVESTIMENTO   = '''+LkcInvestimento.LookupValue+''')     AND '+
         '	        (HC.IDCARTEIRAINVEST = '''+LkcCarteira.LookupValue+''')   AND '+
         '              (HC.IDINVESTIMENTO   = IV.IDINVESTIMENTO)' +
         ' ORDER BY      HC.DATAMOVCARTINV, HC.IDOPERACAOINVEST, HC.IDHISTCARTINV ');
  end
  else
  begin
       DtmRelatorio.QryConsHistInvest.SQL.Clear;
       DtmRelatorio.QryConsHistInvest.SQL.Add('SELECT  HC.IDCARTEIRAINVEST, HC.DATAMOVCARTINV, HC.SALDOVLRINVCART, '+
         '	 HC.SALDOQTDEINVCART, HC.IDINVESTIMENTO, HC.IDTIPOOPERACAO, '+
         '	 HC.HISTMOVCARTINV, HC.TIPMOVCARTINV, IDLOTE, '+
	 '       IV.DESCINVESTIMENTO, HC.VLRMOVCARTINV, HC.COTASMOVCARTINV, '+
         '       HC.SALDOCOTASCARTINV, HC.IDOPERACAOINVEST, HC.QTDEMOVINVCART, '+
         '       HC.MOVIMATU, HC.SALDOATU, HC.MOVIMCAR, HC.SALDOCAR, HC.MOVIMAQUI,'+
         ' 	 HC.SALDOAQUI, HC.SALDOREND, HC.NATURMOVCARTINV '+
         ' FROM  HISTCARTINV HC, INVESTIMENTO IV '+
         ' WHERE 	(HC.DATAMOVCARTINV   >= TO_DATE('''+DateEdit1.Text+''',''DD/MM/YYYY'')) 	AND '+
         '       	(HC.DATAMOVCARTINV   <= TO_DATE('''+DateEdit2.Text+''',''DD/MM/YYYY'')) 	AND '+
         '	        (HC.IDINVESTIMENTO   = '''+LkcInvestimento.LookupValue+''')     AND '+
         '	        (HC.IDCARTEIRAINVEST = '''+LkcCarteira.LookupValue+''')   AND '+
         '              (HC.IDINVESTIMENTO   = IV.IDINVESTIMENTO)' +

         ' ORDER BY      HC.DATAMOVCARTINV, HC.IDOPERACAOINVEST, HC.IDHISTCARTINV ');
  end;
End;

procedure TFrmpRelConsHistInvest.LkcCarteiraChange(Sender: TObject);
begin
  inherited;
// Limpa Combo de Lotes
  DbLkcLote.Text := '';
end;

procedure TFrmpRelConsHistInvest.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  inherited;

 if ((LkcCarteira.Text = '') or (LkcInvestimento.Text = '')
    or (DateEdit1.Text = '') or (DateEdit2.Text = '')) then
 begin
    MsgDlg('Faltam preencher Parâmetros.','Mensagem do Sistema', MtError, [MbOk],0);
    Exit;
 end;



// Monta a Query do Relatorio
  MontaQueryRelat;

// Preenche os Parametros
  DtmRelatorio.LblPeriodo.Text      := 'PERÍODO DE    '+DateEdit1.Text+' A '+DateEdit2.Text;
  DtmRelatorio.LblCarteira.Text     := 'CARTEIRA:     '+LkcCarteira.Text;
  DtmRelatorio.LblInvestimento.Text := 'INVESTIMENTO: '+LkcInvestimento.Text;

  If DbLkcLote.Text <> '' Then
  begin
     DtmRelatorio.LblLote.Visible   := true;
     DtmRelatorio.LblLote.Text      := 'LOTE:         '+DbLkcLote.Text;
  end
  else
    DtmRelatorio.LblLote.Visible    := false;

end;

end.




