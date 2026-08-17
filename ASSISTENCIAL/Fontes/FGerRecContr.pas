unit FGerRecContr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RMestreDet, quickrpt, Qrctrls, ExtCtrls, Db, Wwdatsrc, DBTables, Wwquery;

type
  TfrmGerRecContr = class(TrelMestreDet)
    GroupHeaderBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    qrycontr: TwwQuery;
    dscontr: TwwDataSource;
    QRLabel10: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qrycontrBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGerRecContr: TfrmGerRecContr;

implementation

uses FCliente{, UGeral}, UAdmAss, fParamGerRecContr;

{$R *.DFM}












procedure TfrmGerRecContr.FormCreate(Sender: TObject);
begin
  inherited;
  qrycontr.open;
//  GetRegNomeCliente(qrlblNomeCli,'Assistencial');
//  GetRegLogo(QRImage1);

end;


procedure TfrmGerRecContr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
//action := cafree;

end;

procedure TfrmGerRecContr.qrycontrBeforeOpen(DataSet: TDataSet);
var
   ssql1 : string;
begin
  inherited;

  sSql1 := '';

  sSql1 := sSql1 + 'where aa.idplanass = bb.idplanass  and ';

  sSql1 := sSql1 + ' aa.idcontass = bb.idcontass  and ';


  {testando}

   sSql1 := sSql1 + '     aa.idtitular   = dd.idpessoa    and ';
   sSql1 := sSql1 + '     aa.idpessjur   = dd.idpessjur    and ';
   sSql1 := sSql1 + '     aa.idplanoprev = bb.idplanoprev    and ';
   sSql1 := sSql1 + '     dd.idpessoa =  cc.idpessoa    and ';
   sSql1 := sSql1 + '     ct.idcontass =  bb.idcontass   and ';
   sSql1 := sSql1 + '     bb.idtitular =  dd.idpessoa   and ';
   sSql1 := sSql1 + '     aa.idplanass = bb.idplanass and ';
   sSql1 := sSql1 + '     bb.idcontass = ct.idcontass and ';
   sSql1 := sSql1 + '     aa.idpessjur = bb.idpessjur and ';
   sSql1 := sSql1 + '     aa.idtitular = bb.idtitular and ';
   sSql1 := sSql1 + '     aa.iddependente = bb.iddependente  and ';
   sSql1 := sSql1 + '     pl.idplanass = aa.idplanass  and ';
   sSql1 := sSql1 + '     pv.idplanoprev = aa.idplanoprev  and ';
   sSql1 := sSql1 + '     p1.idpessoa =  aa.idtitular  and ';
   sSql1 := sSql1 + '     ct.idplanass =  aa.idplanass  and ';
   sSql1 := sSql1 + '     aa.idmotivo =  mt.idmotivo  and ';
   sSql1 := sSql1 + '     pat.idpessjur =  aa.idpessjur  and ';
   sSql1 := sSql1 + '     pat.idpessoa = p1.idpessoa  and ';
   sSql1 := sSql1 + '     pat.idplanass = pl.idplanass  and ';
   sSql1 := sSql1 + '     pat.idplanoprev = pv.idplanoprev  and ';
   sSql1 := sSql1 + '     pt.codportforma(+) = aa.codportforma  and ';
   sSql1 := sSql1 + '     cto.idcontribuicao = ct.idcontass  and '+
                    '     prev.idpessoa = pat.idpessoa and '+
                    '     prev.idplanoprev = pat.idplanoprev and '+
                    '     prev.idpessjur = pat.idpessjur and ';



  { fim de teste}

  if frmParamGerRecContr.edmatricula.text <> ''     then
     begin
        sSQL1 := sSql1 + 'dd.matricula = '''+frmParamGerRecContr.edmatricula.text+''' and ' ;
     end;

  if frmParamGerRecContr.edcpf.text <> ''     then
     begin
        sSQL1 := sSql1 + 'cc.numdocumento = '''+frmParamGerRecContr.edcpf.text+''' and ' ;
     end;

  if frmParamGerRecContr.cmbfilial.text <> ''     then
     begin
        sSQL1 := sSql1 + ' dd.IDESTAB = '+frmParamGerRecContr.qryfilial.fieldbyname('idpessoa').AsString+' and ' ;
     end;


 {  if frmParamGerRecContr.ednumero.text <> ''     then
     begin
        sSQL1 := sSql1 + 'cc.identnumero = ' + frmParamGerRecContr.ednumero.text +' and ' ;
     end;
  }

  if frmParamGerRecContr.cmb1.text <> ''  then
     begin
          sSQL1 := sSQL1 + 'to_date(aa.mescobranca,''yyyy/mm'') >= to_date('''+inttostr(frmParamGerRecContr.spin1.value)+'/'+RetornaMes(frmParamGerRecContr.cmb1.text)+''',''yyyy/mm'')  and ';
     end ;

  if frmParamGerRecContr.cmb2.text <> '' then
     begin
          sSQL1 := sSQL1 + 'to_date(aa.mescobranca,''yyyy/mm'') <= to_date('''+inttostr(frmParamGerRecContr.spin2.value)+'/'+RetornaMes(frmParamGerRecContr.cmb2.text)+''',''yyyy/mm'')  and ';
     end;

  if frmParamGerRecContr.ednome.text <> ''     then
     begin
        sSQL1 := sSql1 + 'cc.nome = '''+ frmParamGerRecContr.ednome.text +''' and ' ;
    end;

  if frmParamGerRecContr.dbcmbpatro.text <> ''     then
     begin
        sSQL1 := sSql1 + 'aa.idpessjur =' + frmParamGerRecContr.qrypatro.FieldbyName('IdPessoa').AsString + ' and ' ;
     end;

  if frmParamGerRecContr.dbcmbplano.text <> ''       then
     begin
        sSQL1 := sSQL1 + 'aa.idplanoprev        = ' + frmParamGerRecContr.qryplano.FieldbyName('IdPlanoprev').AsString + ' and ';
     end;
  if frmParamGerRecContr.DBLkpCmbplanass.text <> ''       then
     begin
        sSQL1 := sSQL1 + 'aa.idplanass        = ' + frmParamGerRecContr.qryplanass.FieldbyName('IdPlanass').AsString + ' and ';
     end;

  if frmParamGerRecContr.cmbsituacao.text <> ''       then
     begin
        sSQL1 := sSQL1 + 'pat.idsitpart        = ' + frmParamGerRecContr.qrysitpart.FieldbyName('Idsitpart').AsString + ' and ';
     end;

     if frmParamGerRecContr.ednumero.text <> ''       then
     begin
        sSQL1 := sSQL1 + 'pat.inscricaonumero        = '''+trim(frmParamGerRecContr.ednumero.text)+''' and ';
     end;
     if frmParamGerRecContr.dateedpart.text <> ''       then
     begin
        sSQL1 := sSQL1 + 'pat.dataentrada        =  to_date('''+frmParamGerRecContr.dateedpart.text+''',''dd/mm/yyyy'') and ';
     end;

     if frmParamGerRecContr.numinscprev.text <> ''       then
     begin
        sSQL1 := sSQL1 + 'prev.inscricaonumero        = '''+trim(frmParamGerRecContr.numinscprev.text)+''' and ';
     end;

     if frmParamGerRecContr.datainscprev.text <> ''       then
     begin
        sSQL1 := sSQL1 + 'prev.inscricaodata        =  to_date('''+frmParamGerRecContr.datainscprev.text+''',''dd/mm/yyyy'') and ';
     end;


     if frmParamGerRecContr.rdgpagador.itemindex = 0       then
     begin
        sSQL1 := sSQL1 + ' CT.PAGADOR = ''C'' and ';
     end;

     if frmParamGerRecContr.rdgpagador.itemindex = 1       then
     begin
        sSQL1 := sSQL1 + ' CT.PAGADOR = ''P'' and ';
     end;


   {testando}


  if sSQL1 <> ''
  then sSQL1 := Copy(sSQL1, 1, Length(sSQL1)-5);

  qrycontr.sql.clear;


  qrycontr.sql.add('select cc.nome tit, aa.mes, aa.mescobranca ,aa.valoresperado, aa.valorrecebido, aa.data, pl.nome planass, pv.nome planprev, p1.nome depen, cto.nome contrib,mt.descricao, pt.descricao ' +
              ' from  hstcontribass aa, contass bb ,motivo mt, contribass ct, planass pl, planprev pv, pessoa p1, '+
              ' pessoa cc, elegpatro dd, partass pat, portadorforma pt, contribuicao cto, partprevplan prev '+
              sSql1 + ' order by aa.mes');

end;



end.
