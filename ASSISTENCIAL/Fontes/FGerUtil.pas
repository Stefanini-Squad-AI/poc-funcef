unit FGerUtil;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RMestreDet, quickrpt, Qrctrls, ExtCtrls, Db, Wwdatsrc, DBTables, Wwquery;

type
  TfrmGerUtil = class(TrelMestreDet)
    qryevento: TwwQuery;
    dsevento: TwwDataSource;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel1: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure qryeventoBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGerUtil: TfrmGerUtil;

implementation

uses FCliente, FparamGerUtil;

{$R *.DFM}

procedure TfrmGerUtil.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  // action := cafree;
end;

procedure TfrmGerUtil.FormCreate(Sender: TObject);
begin
  inherited;
  qryevento.open;
  //GetRegNomeCliente(QRLABEL1,'Assistencial');
  //GetRegLogo(QRImage1);
end;

procedure TfrmGerUtil.qryeventoBeforeOpen(DataSet: TDataSet);
var ssql1 : string;
begin
  inherited;

   sSql1 := ' eventass.idplanass = pl.idplanass AND '+
            ' eventass.idplanoprev = pv.idplanoprev AND '+
            ' eventass.idtitular = p.idpessoa AND '+
            ' eventass.iddependente = pp.idpessoa AND '+
            ' eventass.idservass = tp.idservass AND '+
            ' eventass.idpessjur = pa.idpessoa AND '+
            ' el.idpessjur = eventass.idpessjur AND '+
            ' el.idpessoa = eventass.idtitular AND '+
            ' pat.idpessjur = eventass.idpessjur and '+
            ' pat.idpessoa = eventass.idtitular and '+
            ' pat.idplanass = pl.idplanass and '+
            ' pat.idplanoprev = pv.idplanoprev and '+
            ' prev.idpessoa = pat.idpessoa and '+
            ' prev.idplanoprev = pat.idplanoprev and '+
            ' prev.idpessjur = pat.idpessjur and ';
  if frmParamGerUtil.edmatricula.text <> '' then
    sSQL1 := sSql1 + ' el.matricula = ' + frmParamGerUtil.edmatricula.text +' and ' ;
  if frmParamGerUtil.edcpf.text <> '' then
    sSQL1 := sSql1 + ' p.numdocumento = ' + frmParamGerUtil.edcpf.text + ' and ' ;
  if frmParamGerUtil.wwDBLookupCombo1.text <> '' then
    sSQL1 := sSQL1 + ' eventass.idservass        = ' + frmParamGerUtil.qrytpservass.FieldbyName('Idservass').AsString + ' and ';
  if frmParamGerUtil.cmbfilial.text <> '' then
    sSQL1 := sSQL1 + ' EL.IDESTAB        = ' +frmParamGerUtil.qryfilial.FieldbyName('Idpessoa').AsString + ' and ';
  if frmParamGerUtil.DBCMBPLANO.text <> ''  then
    sSQL1 := sSQL1 + ' eventass.idplanoprev        = ' + frmParamGerUtil.qryplano.FieldbyName('Idplanoprev').AsString + ' and ';
  if frmParamGerUtil.DBCMBPATRO.text <> '' then
    sSQL1 := sSQL1 + ' eventass.idpessjur        = ' + frmParamGerUtil.qrypatro.FieldbyName('Idpessoa').AsString + ' and ';
  if frmParamGerUtil.DBLkpCmbplanass.text <> '' then
    sSQL1 := sSQL1 + ' eventass.idplanass        = ' + frmParamGerUtil.qryplanass.FieldbyName('IdPlanass').AsString + ' and ';
  if frmParamGerUtil.date1.text <> '' then
    sSQL1 := sSQL1 + ' eventass.dataevent > to_date('''+frmParamGerUtil.date1.text+''',''dd/mm/yyyy'') and ';
  if frmParamGerUtil.date2.text <> '' then
    sSQL1 := sSQL1 + ' eventass.dataevent < to_date('''+frmParamGerUtil.date2.text+''',''dd/mm/yyyy'') and ';
  if frmParamGerUtil.ednumero.text <> '' then
    sSQL1 := sSQL1 + 'pat.inscricaonumero        = '''+trim(frmParamGerUtil.ednumero.text)+''' and ';
  if frmParamGerUtil.date3.text <> '' then
    sSQL1 := sSQL1 + 'pat.dataentrada        =  to_date('''+frmParamGerUtil.date3.text+''',''dd/mm/yyyy'') and ';
  if frmParamGerUtil.numinscprev.text <> '' then
    sSQL1 := sSQL1 + 'prev.inscricaonumero        = '''+trim(frmParamGerUtil.numinscprev.text)+''' and ';
  if frmParamGerUtil.datainscprev.text <> '' then
    sSQL1 := sSQL1 + 'prev.inscricaodata        =  to_date('''+frmParamGerUtil.datainscprev.text+''',''dd/mm/yyyy'') and ';
  sSQL1 := Copy(sSQL1, 1, Length(sSQL1)-5);

   qryevento.sql.clear;
   qryevento.sql.add(' SELECT eventass.*,p.nome tit,pp.nome depen,el.matricula,p.numdocumento cpf, '+
                     ' pv.nome prev,pl.nome planass,tp.nome serv,pa.idpessoa, '+
                     ' el.dataadmissao,pa.nome pessjur '+
                     ' FROM eventass,pessoa p,pessoa pp,tpservass tp,'+
                     ' planass pl,planprev pv,pessoa pa,elegpatro el,partass pat,partprevplan prev '+
                     ' WHERE  '+SSQL1+'  ORDER BY EVENTASS.DATAEVENT');
end;

end.
