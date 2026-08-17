unit FUtilitario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, Wwdatsrc, DBTables, Wwquery, 
  wwdblook, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97,
  ExtCtrls, ComCtrls, wwdbdatetimepicker, CMDateTimePicker, StdCtrls;

type
  TFrmUtilitario = class(TfrmOkCancelar)
    DbLkcTipoInvest: TwwDBLookupCombo;
    Label2: TLabel;
    Label3: TLabel;
    DateEdit1: TCMDateTimePicker;
    QryTipoInvest: TwwQuery;
    DtsTipoInvest: TwwDataSource;
    QryTipoInvestIDTIPOINVEST: TFloatField;
    QryTipoInvestDESCTIPOINVEST: TStringField;
    QryAux: TwwQuery;
    Animate1: TAnimate;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmUtilitario: TFrmUtilitario;

implementation

USES USistema, UMensErro, UBibliotecaInvest, UOperacaoInvest, UOperComum, dOperComum;
{$R *.DFM}

procedure TFrmUtilitario.FormCreate(Sender: TObject);
begin
  inherited;
  QryTipoInvest.Open;
end;

procedure TFrmUtilitario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  QryTipoInvest.Close;
end;

procedure TFrmUtilitario.bbtnConfirmarClick(Sender: TObject);
var
  wQtdCotaIni         : integer;
  QryLocal, QryLocal1 : TwwQuery;
  sLote : String;
begin
  inherited;
// Cria Objetos Locais
  QryLocal               := TwwQuery.Create(Application);
  QryLocal.DatabaseName  := 'BaseDados';
  QryLocal1              := TwwQuery.Create(Application);
  QryLocal1.DatabaseName := 'BaseDados';

  FazQuery(QryAux,'SELECT * FROM PARAMINVEST');
  wQtdCotaIni:= QryAux.FieldByName('VLRCOTAINICART').AsInteger;

  OperComum.AtualizaSaldos(wQtdCotaini,-1);

  If Trim(DbLkcTipoInvest.Text) = '' Then Begin
     MsgDlg('Tipo de Investimento deve ser preenchido. ','Mensagem do Sistema ',
             MtError,[MbOk],0);
      Exit;
  End;

  Animate1.Visible:=True;
  Animate1.Active :=True;
  FrmUtilitario.Height := 242;
  FrmUtilitario.UpDate;

// Busca Dados dos Investimentos nas Carteiras
  FazQuery(QryLocal,
    'SELECT DISTINCT HC.IDCARTEIRAINVEST '+
    'FROM HISTCARTINV HC '+
    'WHERE (HC.IDTIPOINVEST     = '''+DbLkcTipoInvest.LookupValue+''')  '+
    'ORDER BY HC.IDCARTEIRAINVEST');

  While Not QryLocal.Eof Do Begin

    If Trim(DateEdit1.Text) = '' Then

      ExecutaQuery(QryAux,
        '  UPDATE HISTCARTINV SET '+
        '  FLGCALCSALDO     = ''3'''+
        '  WHERE  IDHISTCARTINV = '+
        '         (select min(h.idhistcartinv) from histcartinv h '+
        '          where h.idcarteirainvest='+qryLocal.FieldByName('IDCARTEIRAINVEST').AsString+' and '+
        '                h.datamovcartinv = '+
        '                (select min(datamovcartinv) from histcartinv h1 '+
        '                 where h1.idcarteirainvest='+qryLocal.FieldByName('IDCARTEIRAINVEST').AsString+'))')

    else

      ExecutaQuery(QryAux,
        '  UPDATE HISTCARTINV SET '+
        '  FLGCALCSALDO     = ''3'''+
        '  WHERE  IDHISTCARTINV = '+
        '         (select min(h.idhistcartinv) from histcartinv h '+
        '          where h.idcarteirainvest='+qryLocal.FieldByName('IDCARTEIRAINVEST').AsString+' and '+
        '          h.datamovcartinv = TO_DATE('''+DateEdit1.Text+''',''DD/MM/YYYY'''+'))');

    OperComum.AtualizaSaldos(wQtdCotaini,-1);

  // Busca Dados dos Investimentos desta Carteira
    FazQuery(QryLocal1,
      'SELECT DISTINCT HC.IDINVESTIMENTO, HC.IDLOTE '+
      'FROM HISTCARTINV HC '+
      'WHERE (HC.IDCARTEIRAINVEST = '+qryLocal.FieldByName('IDCARTEIRAINVEST').AsString+')'+
      'ORDER BY HC.IDINVESTIMENTO, HC.IDLOTE');

    While Not QryLocal1.Eof Do Begin

      sLote := qryLocal1.FieldByName('IDLOTE').AsString;

      If Trim(DateEdit1.Text) = '' Then

        ExecutaQuery(QryAux,
          '  UPDATE HISTCARTINV SET '+
          '  FLGCALCSALDO     = ''2'''+
          '  WHERE  IDHISTCARTINV = '+
          '         (select min(h.idhistcartinv) from histcartinv h '+
          '          where h.idcarteirainvest='+qryLocal.FieldByName('IDCARTEIRAINVEST').AsString+' and '+
          '                h.idinvestimento  ='+qryLocal1.FieldByName('IDINVESTIMENTO').AsString+' and '+
          '                (((H.IDLOTE IS NOT NULL) AND (H.IDLOTE = '''+slote+''')) OR ((H.IDLOTE IS NULL) AND ('''+slote+''' IS NULL))) AND '+
          '                h.datamovcartinv = '+
          '                (select min(datamovcartinv) from histcartinv h1 '+
          '                 where h1.idcarteirainvest='+qryLocal.FieldByName('IDCARTEIRAINVEST').AsString+' and'+
          '                 h1.idinvestimento  ='+qryLocal1.FieldByName('IDINVESTIMENTO').AsString+' and '+
          '                 (((H.IDLOTE IS NOT NULL) AND (H.IDLOTE = '''+slote+''')) OR ((H.IDLOTE IS NULL) AND ('''+slote+''' IS NULL)))))')

      else

        ExecutaQuery(QryAux,
          '  UPDATE HISTCARTINV SET '+
          '  FLGCALCSALDO     = ''2'''+
          '  WHERE  IDHISTCARTINV = '+
          '         (select min(h.idhistcartinv) from histcartinv h '+
          '          where h.idcarteirainvest='+qryLocal.FieldByName('IDCARTEIRAINVEST').AsString+' and '+
          '                h.idinvestimento  ='+qryLocal1.FieldByName('IDINVESTIMENTO').AsString+' and '+
          '                (((H.IDLOTE IS NOT NULL) AND (H.IDLOTE = '''+slote+''')) OR ((H.IDLOTE IS NULL) AND ('''+slote+''' IS NULL))) AND '+
          '                h.datamovcartinv = TO_DATE('''+DateEdit1.Text+''',''DD/MM/YYYY'''+'))');

      OperComum.AtualizaSaldos(wQtdCotaini,-1);

      QryLocal1.Next;
    End;

    QryLocal.Next;
  End;

  Animate1.Visible:=False;
  Animate1.Active :=False;
  FrmUtilitario.Height := 204;

  MsgDlg('Acerto do Histórico realizado com sucesso. ','Mensagem do Sistema ',
           MtWarning,[MbOk],0);

end;

end.
