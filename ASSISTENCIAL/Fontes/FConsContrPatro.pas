unit FConsContrPatro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FConsultar, Db, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Tabs,
  ComCtrls, MAHlpBtn, Buttons, ExtCtrls, Spin, wwdblook, DBTables, Wwquery,
  TB97, TB97Tlbr, IvDictio, IvMulti, IvEMulti;

type
  TfrmConsContrPatro = class(TfrmConsultar)
    GroupBox1: TGroupBox;
    LABEL1: TLabel;
    Label3: TLabel;
    DBCMBPATRO: TwwDBLookupCombo;
    DBLkpCmbplanass: TwwDBLookupCombo;
    grpData: TGroupBox;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    cmb1: TComboBox;
    cmb2: TComboBox;
    spin1: TSpinEdit;
    spin2: TSpinEdit;
    Label2: TLabel;
    cmbmotivo: TwwDBLookupCombo;
    Label4: TLabel;
    qryhistpatr: TwwQuery;
    dspatro: TwwDataSource;
    qrypatro: TwwQuery;
    qryplanass: TwwQuery;
    dsplanass: TwwDataSource;
    qrymotivo: TwwQuery;
    Splitter1: TSplitter;
    procedure FormActivate(Sender: TObject);
    procedure Consulta; override;
    function trazmes(mes : string):string;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBCMBPATROEnter(Sender: TObject);
    procedure DBLkpCmbplanassEnter(Sender: TObject);
    procedure cmbmotivoEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsContrPatro: TfrmConsContrPatro;

implementation

{$R *.DFM}






procedure TfrmConsContrPatro.FormActivate(Sender: TObject);
begin
  inherited;
{qryplanass.open;
qrypatro.open;
qrymotivo.open;}
end;

//OBS: existe esta rotina na lib!!!
function TfrmConsContrPatro.trazmes(mes : string):string;
var
   saida : string;
begin
   if mes='JANEIRO' then saida:='01';
   if mes='FEVEREIRO' then saida:='02';
   if mes='MARÇO' then saida:='03'; {ACERTAR ESSA ROTINA, TESTAR O MES COM 3 POSICOES}{}
   if mes='ABRIL' then saida:='04';
   if mes='MAIO' then saida:='05';
   if mes='JUNHO' then saida:='06';
   if mes='JULHO' then saida:='07';
   if mes='AGOSTO' then saida:='08';
   if mes='SETEMBRO' then saida:='09';
   if mes='OUTUBRO' then saida:='10';
   if mes='NOVEMBRO' then saida:='11';
   if mes='DEZEMBRO' then saida:='12';
   trazmes := saida;
end;

procedure TfrmConsContrPatro.Consulta;
var

   sSql1   : string;
   sCompl  : string;   {complementação  da query }
begin

  qryhistpatr.close;
  qryhistpatr.sql.clear;

  { Procurar os benefícios dos beneficiários e dos assistidos }

   sSql1 := '';
   sSql1 := sSql1 + ' where hp.idplanoassist = pl.idplanass  and ';
   sSql1 := sSql1 + ' hp.idmotivo = mt.idmotivo  and ';
   sSql1 := sSql1 + ' p.idpessoa   = hp.idpessjur   and ';

  { fim de teste}

   if cmb1.text <> ''  then
     begin
          sSQL1 := sSQL1 + 'to_date(hp.mes,''yyyy/mm'') >= to_date('''+inttostr(spin1.value)+'/'+trazmes(cmb1.text)+''',''yyyy/mm'')  and ';
     end ;

  if cmb2.text <> '' then
     begin
          sSQL1 := sSQL1 + 'to_date(hp.mes,''yyyy/mm'') <= to_date('''+inttostr(spin2.value)+'/'+trazmes(cmb2.text)+''',''yyyy/mm'')  and ';
     end;

  if dbcmbpatro.text <> ''     then
     begin
        sSQL1 := sSql1 + 'hp.idpessjur =' + qrypatro.FieldbyName('IdPessoa').AsString + ' and ' ;
     end;

  if DBLkpCmbplanass.text <> ''       then
     begin
        sSQL1 := sSQL1 + 'hp.idplanoassist        = ' + qryplanass.FieldbyName('IdPlanass').AsString + ' and ';
     end;

  if cmbmotivo.text <> ''       then
     begin
        sSQL1 := sSQL1 + 'hp.idmotivo        = ' + qrymotivo.FieldbyName('Idmotivo').AsString + ' and ';
     end;


   {testando}


  if sSQL1 <> ''
  then sSQL1 := Copy(sSQL1, 1, Length(sSQL1)-5);

  qryhistpatr.sql.clear;


  qryhistpatr.sql.add('select  hp.*, pl.nome, p.nome, mt.descricao  ' +
              ' from  histpatr hp, pessoa p, planass pl, motivo mt  '+ scompl+' '+
              sSql1 + ' order by hp.mes');

              { Executar query com condicoes especificadas pelo usuario }
              try
                  qryhistpatr.Open;
              except
              on E:EDBEngineError do
              begin
                 raise;
                 Exit;

              end;
              end;

end;
procedure TfrmConsContrPatro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
action := cafree;

end;

procedure TfrmConsContrPatro.bbtnSairClick(Sender: TObject);
begin
  inherited;
close;
end;


procedure TfrmConsContrPatro.FormCreate(Sender: TObject);
begin
  inherited;
spin1.value := strtoint(copy(datetostr(date),7,4));
spin2.value := strtoint(copy(datetostr(date),7,4));
end;

procedure TfrmConsContrPatro.DBCMBPATROEnter(Sender: TObject);
begin
  inherited;
if not qrypatro.active then
begin
   qrypatro.open;
end;
end;

procedure TfrmConsContrPatro.DBLkpCmbplanassEnter(Sender: TObject);
begin
  inherited;
if not qryplanass.active then
begin
   qryplanass.open;
end;
end;

procedure TfrmConsContrPatro.cmbmotivoEnter(Sender: TObject);
begin
  inherited;
if not qrymotivo.active then
begin
   qrymotivo.open;
end;
end;

end.
