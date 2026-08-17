unit FRelParticAnalit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RMestreDet, Db, Wwdatsrc, DBTables, Wwquery, quickrpt, Qrctrls, ExtCtrls;

type
  TfrmRelParticAnalit = class(TrelMestreDet)
    qrypartic: TwwQuery;
    dspartic: TwwDataSource;
    QRSubDetail1: TQRSubDetail;
    QRLabel1: TQRLabel;
    dbprev: TQRDBText;
    QRSubDetail2: TQRSubDetail;
    QRLabel2: TQRLabel;
    dbplanass: TQRDBText;
    QRSubDetail3: TQRSubDetail;
    edpatro: TQRDBText;
    qrypatro: TwwQuery;
    dspatro: TwwDataSource;
    qryplanprev: TwwQuery;
    dsprev: TwwDataSource;
    qryplanass: TwwQuery;
    dsplanass: TwwDataSource;
    QRLabel3: TQRLabel;
    edmat: TQRDBText;
    QRLabel5: TQRLabel;
    ednome: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRSubDetail4: TQRSubDetail;
    qrybenefass: TwwQuery;
    GroupHeaderBand1: TQRBand;
    QRLabel8: TQRLabel;
    QRDBText4: TQRDBText;
    QRSubDetail5: TQRSubDetail;
    QRLabel9: TQRLabel;
    qryInfo: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure QRSubDetail5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelParticAnalit: TfrmRelParticAnalit;
  bNaoExistemPartic  : boolean;

implementation

uses FParamRelParticipante, FParamRelParticAnalist, FCliente;

{$R *.DFM}


procedure TfrmRelParticAnalit.FormCreate(Sender: TObject);
begin
  inherited;
qrypatro.close;
qrypatro.sql.clear;
qrypatro.sql.add('SELECT NOME,IDPESSOA '+
                 'FROM PESSOA '+
                 'WHERE IDPESSOA IN '+
                 '(SELECT IDPESSJUR FROM PARTASS) ');
                 if frmParamRelParticAnalist.DBCMBPATRO.text <> '' then
                 begin
                      qrypatro.sql.add(' AND PESSOA.IDPESSOA = '+frmParamRelParticAnalist.qrypatro.fieldbyname('idpessoa').AsString+'');
                 end;
qrypatro.open;

qryplanprev.close;
qryplanprev.sql.clear;
qryplanprev.sql.add(' SELECT PLANPREV.NOME, '+
                    'PLANPREV.IDPLANOPREV, '+
                    ' PLANPREVPATRO.IDPESSJUR '+
                    ' FROM PLANPREV, PLANPREVPATRO '+
                    ' WHERE PLANPREVPATRO.IDPLANOPREV = PLANPREV.IDPLANOPREV AND '+
                    ' PLANPREVPATRO.IDPESSJUR = :IDPESSOA   ');
                    if frmParamRelParticAnalist.DBCMBPLANO.text <> '' then
                    begin
                         qryplanprev.sql.add(' AND PLANPREVPATRO.IDPLANOPREV = '+frmParamRelParticAnalist.qryplanoprev.fieldbyname('idPLANOPREV').AsString+'');
                    end;
qryplanprev.open;

qryplanass.close;
qryplanass.sql.clear;
qryplanass.sql.add(' SELECT NOME, PLANASS.IDPLANASS,IDPESSJUR,IDPLANOPREV '+
                   ' FROM PLANASS, PLANPREVASS '+
                   ' WHERE PLANPREVASS.IDPLANASS = PLANASS.IDPLANASS AND '+
                   ' IDPESSJUR = :IDPESSJUR AND '+
                   ' IDPLANOPREV = :IDPLANOPREV     ');
                   if frmParamRelParticAnalist.DBLkpCmbplanass.text <> '' then
                   begin
                        qryplanass.sql.add(' AND PLANPREVASS.IDPLANASS = '+frmParamRelParticAnalist.qryplanass.fieldbyname('idplanass').AsString+'');
                   end;
qryplanass.open;

qrypartic.close;
qrypartic.sql.clear;
qrypartic.sql.add(' SELECT ELEGPATRO.MATRICULA, PESSOA.NOME, PARTASS.DATAENTRADA,'+
                  ' PARTASS.INSCRICAONUMERO,DESCRICAO, '+
                  ' PARTASS.IDPESSOA, PARTASS.IDPLANASS, '+
                  ' PARTASS.IDPLANOPREV, PARTASS.IDPESSJUR, '+
                  ' PARTASS.INSCRICAONUMERO, PARTASS.DATAENTRADA, '+
                  ' PREV.INSCRICAONUMERO, PREV.INSCRICAODATA '+
                  ' FROM PESSOA, ELEGPATRO, PARTASS, SITPART, PARTPREVPLAN PREV '+
                  ' WHERE '+
                  ' PARTASS.IDPESSOA = ELEGPATRO.IDPESSOA AND '+
                  ' PARTASS.IDPESSJUR = ELEGPATRO.IDPESSJUR AND '+
                  ' PESSOA.IDPESSOA = ELEGPATRO.IDPESSOA AND '+
                  ' PARTASS.IDPLANASS = :IDPLANASS AND '+
                  ' PARTASS.IDPLANOPREV = :IDPLANOPREV AND '+
                  ' PARTASS.IDPESSJUR = :IDPESSJUR AND '+
                  ' SITPART.IDSITPART = PARTASS.IDSITPART AND '+
                  ' PREV.IDPESSOA = PARTASS.IDPESSOA AND '+
                  ' PREV.IDPLANOPREV = PARTASS.IDPLANOPREV AND '+
                  ' PREV.IDPESSJUR = PARTASS.IDPESSJUR ');

                  if frmParamRelParticAnalist.edmat.text  <>  '' then
                  begin
                       qrypartic.sql.add(' AND ELEGPATRO.MATRICULA = '''+TRIM(frmParamRelParticAnalist.EDMAT.TEXT)+'''');
                  end;

                  if frmParamRelParticAnalist.cmbfilial.text  <>  '' then
                  begin
                       qrypartic.sql.add(' AND ELEGPATRO.IDESTAB = '+frmParamRelParticAnalist.qryfilial.fieldbyname('idpessoa').AsString+' ');
                  end;

                  if frmParamRelParticAnalist.ednome.text  <>  '' then
                  begin
                       qrypartic.sql.add(' AND UPPER(PESSOA.NOME) LIKE ''%'+uppercase(TRIM(frmParamRelParticAnalist.EDNOME.TEXT))+'%'' ');
                  end;

                  if Trim(frmParamRelParticAnalist.edNumero.Text) <> ''
                  then  qrypartic.sql.add(' AND PARTASS.INSCRICAONUMERO = '''+Trim(frmParamRelParticAnalist.edNumero.Text)+'''');

                  if (Trim(frmParamRelParticAnalist.date3.Text) <> '') and (Trim(frmParamRelParticAnalist.date3.Text) <> '/  /')
                  then  qrypartic.sql.add('AND PARTASS.DATAENTRADA = To_Date('''+Trim(frmParamRelParticAnalist.date3.Text)+''',''dd/MM/yyyy'')');

                  if frmParamRelParticAnalist.numinscprev.text <> ''       then
                  begin
                     qrypartic.sql.add(' and prev.inscricaonumero        = '''+trim(frmParamRelParticAnalist.numinscprev.text)+'''');
                  end;

                  if frmParamRelParticAnalist.datainscprev.text <> ''       then
                  begin
                     qrypartic.sql.add(' and  prev.inscricaodata        =  to_date('''+frmParamRelParticAnalist.datainscprev.text+''',''dd/mm/yyyy'')');
                  end;

qrypartic.open;

qrybenefass.close;
qrybenefass.sql.clear;
qrybenefass.sql.add(' SELECT DISTINCT  NOME,IDPESSOA'+
                    ' FROM PESSOA, BENEFASS '+
                    ' WHERE IDTITULAR = :IDPESSOA AND '+
                    ' IDPLANASS = :IDPLANASS AND '+
                    ' IDPLANOPREV = :IDPLANOPREV AND '+
                    ' IDPESSJUR = :IDPESSJUR AND '+
                    ' IDDEPENDENTE  =  PESSOA.IDPESSOA ');
qrybenefass.open;



//GetRegNomeCliente(qrlblNomeCli,'Assistencial');
//GetRegLogo(QRImage1);
end;
















procedure TfrmRelParticAnalit.QRSubDetail5BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  if bNaoExistemPartic
  then PrintBand := True
  else PrintBand := False;
  bNaoExistemPartic := True;
end;

procedure TfrmRelParticAnalit.QRSubDetail3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
   if qryPartic.isempty
  then
  begin
     PrintBand := False;
     bNaoExistemPartic := True;
  end   
  else begin
    PrintBand := True;
    bNaoExistemPartic := False;
  end;
end;

end.
