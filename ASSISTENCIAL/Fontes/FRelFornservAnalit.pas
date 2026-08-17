unit FRelFornservAnalit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RMestreDet, Qrctrls, quickrpt, ExtCtrls, Db, Wwdatsrc, DBTables, Wwquery;

type
  TfrmRelFornservAnalit = class(TrelMestreDet)
    QRDBText3: TQRDBText;
    qryforn: TwwQuery;
    QRDBText7: TQRDBText;
    qryplanass: TwwQuery;
    DSFORN: TwwDataSource;
    QRDBText1: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel2: TQRLabel;
    procedure FormCreate(Sender: TObject);
    procedure qryfornBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelFornservAnalit: TfrmRelFornservAnalit;

implementation

uses FParamRelFornserv, FCliente;

{$R *.DFM}




procedure TfrmRelFornservAnalit.FormCreate(Sender: TObject);
begin
  inherited;
 qryforn.open;
 qryplanass.open;
//GetRegNomeCliente(qrlblNomeCli,'Assistencial');
//GetRegLogo(QRImage1);
end;








procedure TfrmRelFornservAnalit.qryfornBeforeOpen(DataSet: TDataSet);
begin
  inherited;




if frmParamRelFornserv.DBCMBPATRO.text <> '' then
     qryforn.sql.add(' AND  PESSOA.IDPESSOA = '+frmParamRelFornserv.qrypatro.fieldbyname('idpessoa').AsString+'');

//if frmParamRelFornserv.DBLkpCmbplanass.text <> '' then
//     qryforn.sql.add(' AND  FORNSERV.IDPESSOA = '+frmParamRelFornserv.qryplanass.fieldbyname('idfornserv').AsString+'');

if frmParamRelFornserv.cmMaskEditDlg1.text <> '' then
     qryforn.sql.add(' AND PESSOA.NUMDOCUMENTO = '+TRIM(frmParamRelFornserv.cmMaskEditDlg1.TEXT)+'');


      if frmParamRelFornserv.DBCheckBox1.checked = true then
      begin
           qryforn.sql.add(' AND PESSOA.FLGCLIENTE = 1 ');
      end;

      if frmParamRelFornserv.DBCheckBox2.checked = true then
      begin
           qryforn.sql.add(' AND PESSOA.FLGPATROCINADORA = 1 ');
      end;

      if frmParamRelFornserv.DBCheckBox3.checked = true then
      begin
           qryforn.sql.add(' AND PESSOA.FLGADMINISTRADORFUNDO = 1 ');
      end;

      if frmParamRelFornserv.DBCheckBox4.checked = true then
      begin
         qryforn.sql.add(' AND PESSOA.FLGADMINISTRADORA = 1 ');
      end;

      if frmParamRelFornserv.DBCheckBox5.checked = true then
      begin
         qryforn.sql.add(' AND PESSOA.FLGEMPRESAEMITENTETITULOS = 1 ');
      end;

      if frmParamRelFornserv.DBCheckBox6.checked = true then
      begin
           qryforn.sql.add(' AND PESSOA.FLGBANCO = 1 ');
      end;

      if frmParamRelFornserv.DBCheckBox7.checked = true then
      begin
           qryforn.sql.add(' AND PESSOA.FLGBOLSA = 1 ');
      end;

      if frmParamRelFornserv.DBCheckBox8.checked = true then
      begin
         qryforn.sql.add(' AND PESSOA.FLGAUTARQUIA = 1 ');
      end;

      if frmParamRelFornserv.DBCheckBox9.checked = true then
      begin
        qryforn.sql.add(' AND PESSOA.FLGSINDICATO = 1 ');
      end;




end;







end.
