Unit FConsDoctosCpmfMT;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, CMProcuraSubTipo, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd,
  Wwdbgrid, Db, DBTables, Wwquery, Wwdatsrc, StdCtrls, wwdbdatetimepicker,
  CMDateTimePicker, uCmSqlParams, DBClient, uCMClientDataSet;

Type
  TFrmConsDoctosCpmfMT = Class(TfrmOkCancelar)
    Panel1: TPanel;
    CmpForCli: TCMProcuraForCli;
    GroupBox2: TGroupBox;
    dbelanctoini: TCMDateTimePicker;
    dbelanctofim: TCMDateTimePicker;
    GroupBox1: TGroupBox;
    dbelvenctoini: TCMDateTimePicker;
    dbelvenctofim: TCMDateTimePicker;
    BitBtn1: TBitBtn;
    PnlTotCPMF: TPanel;
    GrdLotes: TwwDBGrid;
    DsLotes: TwwDataSource;
    QryLotes: TwwQuery;
    QryLotesNOME: TStringField;
    QryLotesNODOCUMENTO: TFloatField;
    QryLotesDATAPROGRAMADA: TDateTimeField;
    QryLotesDATALANCTO: TDateTimeField;
    QryLotesVALOR: TFloatField;
    QryLotesSTATUS: TStringField;
    QryLotesCOMPLDOCUMENTO: TStringField;
    CdsLotes: TCMClientDataSet;
    SqlLotes: TCMSqlParams;
    Procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  End;

Var
  FrmConsDoctosCpmfMT: TFrmConsDoctosCpmfMT;

Implementation

Uses umenserro, umodulo;

{$R *.DFM}

Procedure TFrmConsDoctosCpmfMT.bbtnConfirmarClick(Sender: TObject);
Begin
  Inherited;
  If Not (((trim(dbelanctoini.text) <> '') And (trim(dbelanctofim.text) <> '')) Or ((trim(dbelvenctoini.text) <> '') And
    (trim(dbelvenctofim.text) <> '')) Or
    ((CmpForCli.ForCliReg.Id <> 0))) Then
  Begin
    MsgDlg('Preencher Lançamento ou Data Programada or Favorecido.', 'Erro', mtError, [mbOk], 0);
    exit;
  End;
  SqlLotes.sql.clear;
  SqlLotes.sql.add('SELECT  pessoa.nome, documento.nodocumento, documento.compldocumento,documento.dataprogramada,');
  SqlLotes.sql.add('lanctodocum.datalancto,  lanctodocum.valor,  decode(documento.status,''2'',''Baixado'',''Aberto'') as Status ');
  SqlLotes.sql.add(' FROM  documento,lanctodocum,pessoa  WHERE  ');
  SqlLotes.sql.add(' documento.coddocumento=lanctodocum.coddocumento and');
  SqlLotes.sql.add(' documento.operacao=lanctodocum.operacao and ');
  SqlLotes.sql.add(' documento.idforcli = pessoa.idpessoa and ');
  If ((trim(dbelanctoini.text) <> '') And (trim(dbelanctofim.text) <> '')) Then
  Begin
    SqlLotes.sql.add('lanctodocum.datalancto >= to_date(''' + dbelanctoini.text + ''',''dd/mm/yyyy'') and ' +
      'lanctodocum.datalancto <= to_date(''' + dbelanctofim.text + ''',''dd/mm/yyyy'') and');

  End;
  If ((trim(dbelvenctoini.text) <> '') And (trim(dbelvenctofim.text) <> '')) Then
  Begin
    SqlLotes.sql.add('documento.dataprogramada >= to_date(''' + dbelvenctoini.text + ''',''dd/mm/yyyy'') and ' +
      'documento.dataprogramada <= to_date(''' + dbelvenctofim.text + ''',''dd/mm/yyyy'') and');

  End;
  If (CmpForCli.ForCliReg.Id <> 0) Then
    SqlLotes.sql.add('documento.idforcli=' + inttostr(CmpForCli.ForCliReg.Id) + ' and ');

  SqlLotes.sql.add(' not exists (select 1 from documento d,lanctodocum lan where ' +
    ' documento.coddocumento=d.coddocumento and  ' +
    'lan.operacao=''4 '' and d.coddocumento=lan.coddocumento and d.codtipdoc=' + inttostr(modulo.CodDocCPMF) + ' )');
  SqlLotes.sql.add('order by nome,nodocumento,compldocumento');
  SqlLotes.open;
  TFloatField(CdsLotes.FieldByName('valor')).DisplayFormat := '#,##0.00';
End;

End.

