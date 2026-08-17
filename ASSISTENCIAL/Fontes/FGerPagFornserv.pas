unit FGerPagFornserv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RMestreDet, quickrpt, Qrctrls, ExtCtrls, Db, Wwdatsrc, DBTables, Wwquery;

type
  TfrmGerPagFornserv = class(TrelMestreDet)
    QRDBText1: TQRDBText;
    qrymestre: TwwQuery;
    dsmestre: TwwDataSource;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure qrymestreBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGerPagFornserv: TfrmGerPagFornserv;

implementation

uses FParamPagFornserv, FCliente, UAdmAss;

{$R *.DFM}

procedure TfrmGerPagFornserv.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
//action := cafree;
end;

procedure TfrmGerPagFornserv.FormCreate(Sender: TObject);
begin
  inherited;
  qrymestre.open;
  //GetRegNomeCliente(qrlblNomeCli,'Assistencial');
  //GetRegLogo(QRImage1);
end;

procedure TfrmGerPagFornserv.qrymestreBeforeOpen(DataSet: TDataSet);
var
   ssql1 : string;
begin
  inherited;

   sSql1 := '';

   sSql1 := sSql1 + 'where histpag.idplanass = planass.idplanass and ';

   sSql1 := sSql1 + ' histpag.idmotivo =  motivo.idmotivo and ';


   if frmParamPagFornserv.wwDBLookupCombo1.text <> ''       then
     begin
        sSQL1 := sSQL1 + ' histpag.idmotivo        = ' + frmParamPagFornserv.qrymotivo.FieldbyName('Idmotivo').AsString + ' and ';
     end;
   if frmParamPagFornserv.DBLkpCmbplanass.text <> ''       then
      begin
         sSQL1 := sSQL1 + ' histpag.idplanass        = ' + frmParamPagFornserv.qryplanass.FieldbyName('IdPlanass').AsString + ' and ';
      end;
   if frmParamPagFornserv.cmb1.text <> '' then
      begin
         sSQL1 := sSQL1 + ' histpag.mes >= '''+inttostr(frmParamPagFornserv.spin1.value)+'/'+RetornaMes(frmParamPagFornserv.cmb1.text)+''' and ';
      end;
   if frmParamPagFornserv.cmb2.text <> '' then
      begin
         sSQL1 := sSQL1 + ' histpag.mes <= '''+inttostr(frmParamPagFornserv.spin2.value)+'/'+RetornaMes(frmParamPagFornserv.cmb2.text)+''' and ';
      end;

   if frmParamPagFornserv.datapagini.text <> '' then
      begin
         sSQL1 := sSQL1 + ' histpag.data >= to_date('''+frmParamPagFornserv.datapagini.text+''',''dd/mm/yyyy'') and ';
      end;
   if frmParamPagFornserv.datapagfim.text <> '' then
      begin
         sSQL1 := sSQL1 + ' histpag.data <= to_date('''+frmParamPagFornserv.datapagfim.text+''',''dd/mm/yyyy'') and ';
      end;

   {testando}


   if sSQL1 <> ''
   then sSQL1 := Copy(sSQL1, 1, Length(sSQL1)-5);

   qrymestre.sql.clear;


   qrymestre.sql.add('select histpag.* , planass.nome , motivo.descricao  ' +
               ' from histpag , planass , motivo '+
               ''+ sSql1 + ' order by histpag.mes');

end;


end.
