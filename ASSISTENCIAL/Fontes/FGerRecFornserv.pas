unit FGerRecFornserv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RMestreDet, quickrpt, Qrctrls, ExtCtrls, Db, Wwdatsrc, DBTables, Wwquery;

type
  TfrmGerRecFornserv = class(TrelMestreDet)
    qryrecforn: TwwQuery;
    dsrecpatro: TwwDataSource;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    Motivo: TQRLabel;
    QRLabel6: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryrecfornBeforeOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGerRecFornserv: TfrmGerRecFornserv;

implementation

uses FCliente, UAdmAss, FParamGerRecFornserv;

{$R *.DFM}

procedure TfrmGerRecFornserv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  //ACTION := CAFREE;
end;

procedure TfrmGerRecFornserv.qryrecfornBeforeOpen(DataSet: TDataSet);
var ssql1 : string;
begin
   inherited;

   sSql1 := 'where histrec.idplanass = planass.idplanass and ';
   sSql1 := sSql1 + ' histrec.idmotivo =  motivo.idmotivo and ';

   if frmParamGerRecFornserv.wwDBLookupCombo2.text <> '' then
     sSQL1 := sSQL1 + ' histrec.idmotivo = ' + frmParamGerRecFornserv.qrymotivo.FieldbyName('Idmotivo').AsString + ' and ';
   if frmParamGerRecFornserv.DBLkpCmbplanass.text <> ''       then
         sSQL1 := sSQL1 + ' histrec.idplanass = ' + frmParamGerRecFornserv.qryplanass.FieldbyName('IdPlanass').AsString + ' and ';
   if frmParamGerRecFornserv.cmb1.text <> '' then
         sSQL1 := sSQL1 + ' histrec.mes >= '''+inttostr(frmParamGerRecFornserv.spin1.value)+'/'+RetornaMes(frmParamGerRecFornserv.cmb1.text)+''' and ';
   if frmParamGerRecFornserv.cmb2.text <> '' then
         sSQL1 := sSQL1 + ' histrec.mes <= '''+inttostr(frmParamGerRecFornserv.spin2.value)+'/'+RetornaMes(frmParamGerRecFornserv.cmb2.text)+''' and ';
   if frmParamGerRecFornserv.datacomini.text <> '' then
         sSQL1 := sSQL1 + ' histrec.datarec >= to_date('''+frmParamGerRecFornserv.datacomini.text+''',''dd/mm/yyyy'') and ';
   if frmParamGerRecFornserv.datacomfim.text <> '' then
         sSQL1 := sSQL1 + ' histrec.datarec <= to_date('''+frmParamGerRecFornserv.datacomfim.text+''',''dd/mm/yyyy'') and ';
   sSQL1 := Copy(sSQL1, 1, Length(sSQL1)-5);

   qryrecforn.sql.clear;
   qryrecforn.sql.add('select histrec.*, planass.nome, motivo.descricao'+
                       ' from histrec, planass, motivo '+
                       ''+ sSql1 + ' order by histrec.mes');
end;

procedure TfrmGerRecFornserv.FormCreate(Sender: TObject);
begin
  inherited;
  qryrecforn.open;
  //GetRegNomeCliente(qrlblNomeCli,'Assistencial');
  //GetRegLogo(QRImage1);
end;

end.
