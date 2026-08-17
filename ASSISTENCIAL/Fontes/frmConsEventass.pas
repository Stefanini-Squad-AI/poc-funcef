unit frmConsEventass;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FConsultar, StdCtrls, wwdblook, Db, Wwdatsrc, Grids,
  Wwdbigrd, Wwdbgrid, Tabs, ComCtrls, MAHlpBtn, Buttons, DBTables, Wwquery,
  TB97, TB97Tlbr, IvDictio, IvMulti, IvEMulti, wwdbdatetimepicker,
  CMDateTimePicker, ExtCtrls;

type
  TfConsEventass = class(TfrmConsultar)
    GroupBox1: TGroupBox;
    LABEL1: TLabel;
    label4: TLabel;
    Label3: TLabel;
    DBLkpCmbplanass: TwwDBLookupCombo;
    GroupBox4: TGroupBox;
    Label15: TLabel;
    Label13: TLabel;
    Label7: TLabel;
    GroupBox5: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    ednumero: TEdit;
    date3: TCMDateTimePicker;
    edmatricula: TEdit;
    edcpf: TEdit;
    ednome: TEdit;
    grpData: TGroupBox;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    date1: TCMDateTimePicker;
    date2: TCMDateTimePicker;
    Label10: TLabel;
    wwDBLookupCombo1: TwwDBLookupCombo;
    Label11: TLabel;
    qry: TwwQuery;
    dspatro: TwwDataSource;
    qrypatro: TwwQuery;
    qryplano: TwwQuery;
    dsplano: TwwDataSource;
    qryplanass: TwwQuery;
    dsplanass: TwwDataSource;
    qrytpservass: TwwQuery;
    dstpservass: TwwDataSource;
    DBCMBPATRO: TwwDBLookupCombo;
    DBCMBPLANO: TwwDBLookupCombo;
    Label2: TLabel;
    numinscprev: TEdit;
    Label16: TLabel;
    datainscprev: TCMDateTimePicker;
    cmbfilial: TwwDBLookupCombo;
    Label29: TLabel;
    qryfilial: TwwQuery;
    Splitter1: TSplitter;
    procedure Consulta; override;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSairClick(Sender: TObject);
    procedure DBCMBPATROEnter(Sender: TObject);
    procedure DBCMBPLANOEnter(Sender: TObject);
    procedure DBLkpCmbplanassEnter(Sender: TObject);
    procedure wwDBLookupCombo1Enter(Sender: TObject);
    procedure cmbfilialEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsEventass: TfConsEventass;

implementation

{$R *.DFM}


procedure TfConsEventass.Consulta;
var
   sSql1   : string;
begin

   qry.close;

   qry.sql.clear;

   sSql1 := '';

   sSql1 := sSql1 + ' eventass.idplanass = pl.idplanass AND '+
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
                ' prev.idpessjur = pat.idpessjur and '+
                ' prev.idplanoprev = pat.idplanoprev and ';


  if edmatricula.text <> ''     then
     begin
        sSQL1 := sSql1 + ' el.matricula = ' + edmatricula.text +' and ' ;
     end;

  if edcpf.text <> ''     then
     begin
        sSQL1 := sSql1 + ' p.numdocumento = ' +edcpf.text+ ' and ' ;
     end;

  if ednome.text <> ''     then
     begin
        sSQL1 := sSql1 + ' UPPER(P.NOME) LIKE ''%'+ednome.text+'%'' and ' ;
     end;

   if cmbfilial.text <> ''     then
     begin
        sSQL1 := sSql1 + ' EL.IDESTAB = '+qryfilial.fieldbyname('idpessoa').AsString+' and ' ;
     end;



  if wwDBLookupCombo1.text <> ''       then
      begin
         sSQL1 := sSQL1 + ' eventass.idservass        = ' + qrytpservass.FieldbyName('Idservass').AsString + ' and ';
      end;
  if DBCMBPLANO.text <> ''       then
      begin
         sSQL1 := sSQL1 + ' eventass.idplanoprev        = ' + qryplano.FieldbyName('Idplanoprev').AsString + ' and ';
      end;
  if DBCMBPATRO.text <> ''       then
      begin
         sSQL1 := sSQL1 + ' eventass.idpessjur        = ' + qrypatro.FieldbyName('Idpessoa').AsString + ' and ';
      end;
  if DBLkpCmbplanass.text <> ''       then
      begin
         sSQL1 := sSQL1 + ' eventass.idplanass        = ' + qryplanass.FieldbyName('IdPlanass').AsString + ' and ';
      end;
  if date1.text <> '' then
      begin
         sSQL1 := sSQL1 + ' eventass.dataevent >= to_date('''+date1.text+' 00:00:01'',''dd/mm/yyyy hh24:min:ss'') and ';
      end;
  if date2.text <> '' then
      begin
         sSQL1 := sSQL1 + ' eventass.dataevent <= to_date('''+date2.text+' 23:59:59'',''dd/mm/yyyy hh24:mi:ss'') and ';
      end;
  if ednumero.text <> ''       then
     begin
        sSQL1 := sSQL1 + 'pat.inscricaonumero        = '''+trim(ednumero.text)+''' and ';
     end;
  if date3.text <> ''       then
     begin
        sSQL1 := sSQL1 + 'pat.dataentrada        =  to_date('''+date3.text+''',''dd/mm/yyyy'') and ';
     end;

  if numinscprev.text <> ''       then
     begin
        sSQL1 := sSQL1 + 'prev.inscricaonumero        = '''+trim(numinscprev.text)+''' and ';
     end;
  if datainscprev.text <> ''       then
     begin
        sSQL1 := sSQL1 + 'prev.inscricaodata        =  to_date('''+datainscprev.text+''',''dd/mm/yyyy'') and ';
     end;



   {testando}


   if sSQL1 <> ''
   then sSQL1 := Copy(sSQL1, 1, Length(sSQL1)-5);

   qry.sql.clear;


   qry.sql.add(' SELECT eventass.*,p.nome,pp.nome,el.matricula,p.numdocumento cpf,'+
               ' pv.nome,pl.nome,tp.nome,pa.idpessoa,el.dataadmissao '+
               ' FROM eventass,pessoa p ,pessoa pp,tpservass tp,'+
               ' planass pl,planprev pv,pessoa pa, elegpatro el , partass pat, partprevplan prev'+
               ' WHERE  '+SSQL1+'  ORDER BY EVENTASS.DATAEVENT');


              { Executar query com condicoes especificadas pelo usuario }
              try
                  qry.Open;
              except
              on E:EDBEngineError do
              begin
                raise;
              end;
   end;
end;




procedure TfConsEventass.FormCreate(Sender: TObject);
begin
  inherited;
{qrypatro.open;
qryplano.open;
qryplanass.open;
qrytpservass.open;}
end;

procedure TfConsEventass.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
action := cafree;
end;

procedure TfConsEventass.bbtnSairClick(Sender: TObject);
begin
  inherited;
close;
end;


procedure TfConsEventass.DBCMBPATROEnter(Sender: TObject);
begin
  inherited;
if not qrypatro.active then
begin
   qrypatro.open;
end;
end;

procedure TfConsEventass.DBCMBPLANOEnter(Sender: TObject);
begin
  inherited;
if not qryplano.active then
begin
   qryplano.open;
end;
end;

procedure TfConsEventass.DBLkpCmbplanassEnter(Sender: TObject);
begin
  inherited;
if not qryplanass.active then
begin
   qryplanass.open;
end;
end;

procedure TfConsEventass.wwDBLookupCombo1Enter(Sender: TObject);
begin
  inherited;
if not qrytpservass.active then
begin
   qrytpservass.open;
end;
end;

procedure TfConsEventass.cmbfilialEnter(Sender: TObject);
begin
  inherited;
if not qryfilial.active then qryfilial.open;
end;

end.
