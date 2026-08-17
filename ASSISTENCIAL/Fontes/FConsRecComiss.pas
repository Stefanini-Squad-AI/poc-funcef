
unit FConsRecComiss;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FConsultar, Db, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Tabs,
  ComCtrls, MAHlpBtn, Buttons, ExtCtrls, Mask, MskEdDlg, wwdblook,
  DBTables, Spin, TB97, TB97Tlbr, IvDictio, IvMulti,
  IvEMulti, Wwquery, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmConsRecComiss = class(TfrmConsultar)
    GroupBox1: TGroupBox;
    Label3: TLabel;
    DBLkpCmbplanass: TwwDBLookupCombo;
    grpData: TGroupBox;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    qryplanass: TwwQuery;
    dsplanass: TwwDataSource;
    qrymotivo: TwwQuery;
    dsmotivo: TwwDataSource;
    wwDBLookupCombo2: TwwDBLookupCombo;
    Label1: TLabel;
    qry: TwwQuery;
    spin1: TSpinEdit;
    cmb1: TComboBox;
    spin2: TSpinEdit;
    cmb2: TComboBox;
    grpdatacob: TGroupBox;
    datacomini: TCMDateTimePicker;
    datacomfim: TCMDateTimePicker;
    Label2: TLabel;
    Label4: TLabel;
    lblforn: TLabel;
    cmbforn: TwwDBLookupCombo;
    qryforn: TwwQuery;
    Splitter1: TSplitter;
    procedure Consulta; override;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    function  trazmes(mes : string):string;
    procedure bbtnSairClick(Sender: TObject);
    procedure DBLkpCmbplanassEnter(Sender: TObject);
    procedure wwDBLookupCombo2Enter(Sender: TObject);
    procedure cmbfornEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsRecComiss: TfrmConsRecComiss;

implementation

{$R *.DFM}

procedure TfrmConsRecComiss.Consulta;
var
   sSql1   : string;
begin

   qry.close;

   qry.sql.clear;

   sSql1 := '';

   sSql1 := sSql1 + 'where histrec.idplanass = planass.idplanass and ';

   sSql1 := sSql1 + ' histrec.idmotivo =  motivo.idmotivo and ';
   sSql1 := sSql1 + ' histrec.idregra =  regra.idregra(+) and ';
   sSql1 := sSql1 + ' pessoa.idpessoa =  histrec.idfornserv and ';
   sSql1 := sSql1 + ' pessoa.idpessoa in(select idpessoa from fornserv) and ';


   if wwDBLookupCombo2.text <> ''       then
     begin
        sSQL1 := sSQL1 + ' histrec.idmotivo        = ' + qrymotivo.FieldbyName('Idmotivo').AsString + ' and ';
     end;
   if DBLkpCmbplanass.text <> ''       then
      begin
         sSQL1 := sSQL1 + ' histrec.idplanass = ' + qryplanass.FieldbyName('IdPlanass').AsString + ' and ';
      end;
   if cmb1.text <> '' then
      begin
         sSQL1 := sSQL1 + ' histrec.mes >= '''+inttostr(spin1.value)+'/'+trazmes(cmb1.text)+''' and ';
      end;
   if cmb2.text <> '' then
      begin
         sSQL1 := sSQL1 + ' histrec.mes <= '''+inttostr(spin2.value)+'/'+trazmes(cmb2.text)+''' and ';
      end;

   if datacomini.text <> '' then
      begin
         sSQL1 := sSQL1 + ' histrec.datarec >= to_date('''+datacomini.text+''',''dd/mm/yyyy'') and ';
      end;
   if datacomfim.text <> '' then
      begin
         sSQL1 := sSQL1 + ' histrec.datarec <= to_date('''+datacomfim.text+''',''dd/mm/yyyy'') and ';
      end;

   if cmbforn.text <> '' then
      begin
         sSQL1 := sSQL1 + ' histrec.idfornserv = '+qryforn.fieldbyname('idpessoa').AsString+' and ';
      end;
   {testando}


   if sSQL1 <> ''
   then sSQL1 := Copy(sSQL1, 1, Length(sSQL1)-5);

   qry.sql.clear;


   qry.sql.add('select histrec.* , planass.nome , motivo.descricao, regra.nomeregra,pessoa.nome forn  ' +
               ' from histrec, planass , motivo, regra , pessoa '+
               ''+ sSql1 + ' order by histrec.mes');

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

procedure TfrmConsRecComiss.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
ACTION := CAFREE;
end;









procedure TfrmConsRecComiss.FormCreate(Sender: TObject);
begin
  inherited;

{qryplanass.open;
qrymotivo.open;}
spin1.value := strtoint(copy(datetostr(date),7,4));
spin2.value := strtoint(copy(datetostr(date),7,4));
end;

//OBS: existe esta rotina na lib!!!
function TfrmConsRecComiss.trazmes(mes : string):string;
var
   saida : string;
begin
   if mes='JANEIRO' then saida:='01';
   if mes='FEVEREIRO' then saida:='02';
   if mes='MARÇO' then saida:='03';   {ACERTAR ESSA ROTINA, TESTAR O MES COM 3 POSICOES}{}
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







procedure TfrmConsRecComiss.bbtnSairClick(Sender: TObject);
begin
  inherited;
close;
end;


procedure TfrmConsRecComiss.DBLkpCmbplanassEnter(Sender: TObject);
begin
  inherited;
if not qryplanass.active then
begin
   qryplanass.open;
end;
end;

procedure TfrmConsRecComiss.wwDBLookupCombo2Enter(Sender: TObject);
begin
  inherited;
if not qrymotivo.active then
begin
   qrymotivo.open;
end;
end;

procedure TfrmConsRecComiss.cmbfornEnter(Sender: TObject);
begin
if not qryforn.active then
begin
   qryforn.open;
end;
end;

end.
