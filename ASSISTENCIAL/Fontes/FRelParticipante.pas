unit FRelParticipante;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RSimples, Qrctrls, quickrpt, ExtCtrls, Db, Wwdatsrc, DBTables, Wwquery;

type
  TfrmRelParticipante = class(TrelSimples)
    qryPartic: TwwQuery;
    dspartic: TwwDataSource;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    qrypatro: TwwQuery;
    QRSubDetail2: TQRSubDetail;
    QRSubDetail3: TQRSubDetail;
    QRLabel1: TQRLabel;
    dbprev: TQRDBText;
    QRLabel2: TQRLabel;
    dbplanass: TQRDBText;
    ednome: TQRDBText;
    GroupHeaderBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    edmat: TQRDBText;
    qryplanprev: TwwQuery;
    qryplanass: TwwQuery;
    dsprev: TwwDataSource;
    dsplanass: TwwDataSource;
    dspatro: TwwDataSource;
    QRSubDetail4: TQRSubDetail;
    QRLabel9: TQRLabel;
    qryInfo: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure QRSubDetail3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelParticipante: TfrmRelParticipante;
  bNaoExistemPartic  : boolean;

implementation

uses FParamRelParticipante, FParamRelParticAnalist, FCliente;

{$R *.DFM}

procedure TfrmRelParticipante.FormCreate(Sender: TObject);
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
qrypartic.sql.add(' SELECT MATRICULA, NOME, PARTASS.INSCRICAONUMERO, PARTASS.DATAENTRADA, '+
                  ' PREV.INSCRICAONUMERO, PREV.INSCRICAODATA '+
                  ' FROM PESSOA, ELEGPATRO, PARTASS, PARTPREVPLAN PREV '+
                  ' WHERE '+
                  ' PARTASS.IDPESSOA = ELEGPATRO.IDPESSOA AND '+
                  ' PARTASS.IDPESSJUR = ELEGPATRO.IDPESSJUR AND '+
                  ' PESSOA.IDPESSOA = ELEGPATRO.IDPESSOA AND '+
                  ' PARTASS.IDPLANASS = :IDPLANASS AND '+
                  ' PARTASS.IDPLANOPREV = :IDPLANOPREV AND '+
                  ' PARTASS.IDPESSJUR = :IDPESSJUR  AND    '+
                  ' PREV.IDPESSOA = PARTASS.IDPESSOA AND '+
                  ' PREV.IDPLANOPREV = PARTASS.IDPLANOPREV AND '+
                  ' PREV.IDPESSJUR = PARTASS.IDPESSJUR ');
                  if frmParamRelParticAnalist.edmat.text  <>  '' then
                  begin
                       qrypartic.sql.add(' AND MATRICULA = '''+TRIM(frmParamRelParticAnalist.EDMAT.TEXT)+'''');
                  end;

                  if frmParamRelParticAnalist.ednome.text  <>  '' then
                  begin
                       qrypartic.sql.add(' AND UPPER(PESSOA.NOME) LIKE ''%'+uppercase(TRIM(frmParamRelParticAnalist.EDNOME.TEXT))+'%'' ');
                  end;

                  if frmParamRelParticAnalist.cmbfilial.text  <>  '' then
                  begin
                       qrypartic.sql.add(' AND ELEGPATRO.IDESTAB = '+frmParamRelParticAnalist.qryfilial.fieldbyname('idpessoa').AsString+' ');
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


//qrypartic.open;
//GetRegNomeCliente(qrlblNomeCli,'Assistencial');
//GetRegLogo(QRImage1);
end;


procedure TfrmRelParticipante.QRSubDetail3BeforePrint(
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

procedure TfrmRelParticipante.QRSubDetail4BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  if bNaoExistemPartic
  then PrintBand := True
  else PrintBand := False;
  bNaoExistemPartic := True;
end;

end.
