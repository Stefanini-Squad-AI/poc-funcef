unit FConsDoctosCpmf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, CMProcuraSubTipo, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd,
  Wwdbgrid, Db, DBTables, Wwquery, Wwdatsrc, StdCtrls, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TFrmConsDoctosCpmf = class(TfrmOkCancelar)
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
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsDoctosCpmf: TFrmConsDoctosCpmf;

implementation
uses umenserro,umodulo;
{$R *.DFM}

procedure TFrmConsDoctosCpmf.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if not (((trim(dbelanctoini.text)<>'') and (trim(dbelanctofim.text)<>'')) or ((trim(dbelvenctoini.text)<>'') and (trim(dbelvenctofim.text)<>'')) or
          ((CmpForCli.ForCliReg.Id<>0))) then
  begin
    MsgDlg('Preencher Lançamento ou Data Programada or Favorecido.','Erro',mtError,[mbOk],0);
    exit;
  end;
  QryLotes.sql.clear;
  QryLotes.sql.add('SELECT  pessoa.nome, documento.nodocumento, documento.compldocumento,documento.dataprogramada,');
  QryLotes.sql.add('lanctodocum.datalancto,  lanctodocum.valor,  decode(documento.status,''2'',''Baixado'',''Aberto'') as Status ');
  QryLotes.sql.add(' FROM  documento,lanctodocum,pessoa  WHERE  ');
  QryLotes.sql.add(' documento.coddocumento=lanctodocum.coddocumento and');
  QryLotes.sql.add(' documento.operacao=lanctodocum.operacao and ');
  QryLotes.sql.add(' documento.idforcli = pessoa.idpessoa and ');
  if  ((trim(dbelanctoini.text)<>'') and (trim(dbelanctofim.text)<>'')) then
  begin
    QryLotes.sql.add('lanctodocum.datalancto >= to_date('''+dbelanctoini.text+''',''dd/mm/yyyy'') and '+
                     'lanctodocum.datalancto <= to_date('''+dbelanctofim.text+''',''dd/mm/yyyy'') and');

  end;
  if  ((trim(dbelvenctoini.text)<>'') and (trim(dbelvenctofim.text)<>'')) then
  begin
    QryLotes.sql.add('documento.dataprogramada >= to_date('''+dbelvenctoini.text+''',''dd/mm/yyyy'') and '+
                     'documento.dataprogramada <= to_date('''+dbelvenctofim.text+''',''dd/mm/yyyy'') and');

  end;
  if (CmpForCli.ForCliReg.Id<>0) then
      QryLotes.sql.add('documento.idforcli='+inttostr(CmpForCli.ForCliReg.Id)+' and ');
      
  QryLotes.sql.add(' not exists (select 1 from documento d,lanctodocum lan where '+
                   ' documento.coddocumento=d.coddocumento and  '+
                   'lan.operacao=''4 '' and d.coddocumento=lan.coddocumento and d.codtipdoc='+inttostr(modulo.CodDocCPMF)+' )');
  QryLotes.sql.add('order by nome,nodocumento,compldocumento');
  QryLotes.open;
end;

end.
