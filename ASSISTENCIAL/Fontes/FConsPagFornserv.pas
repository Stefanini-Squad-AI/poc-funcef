unit FConsPagFornserv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FConsultar, Db, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Tabs,
  ComCtrls, MAHlpBtn, Buttons, ExtCtrls, Mask, MskEdDlg, wwdblook,
  DBTables, Spin, TB97, TB97Tlbr, IvDictio, IvMulti,
  IvEMulti, Wwquery, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmConsPagFornserv = class(TfrmConsultar)
    GroupBox1: TGroupBox;
    Label3: TLabel;
    DBLkpCmbplanass: TwwDBLookupCombo;
    grpData: TGroupBox;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    qrypatro: TwwQuery;
    dspatro: TwwDataSource;
    qryplanass: TwwQuery;
    dsplanass: TwwDataSource;
    dsprodass: TwwDataSource;
    qryprodass: TwwQuery;
    qry: TwwQuery;
    qrymotivo: TwwQuery;
    dsmotivo: TwwDataSource;
    wwDBLookupCombo1: TwwDBLookupCombo;
    Label2: TLabel;
    spin1: TSpinEdit;
    cmb1: TComboBox;
    spin2: TSpinEdit;
    cmb2: TComboBox;
    grpdatacob: TGroupBox;
    Label1: TLabel;
    Label4: TLabel;
    Datapagini: TCMDateTimePicker;
    datapagfim: TCMDateTimePicker;
    wwQuery1: TwwQuery;
    lblforn: TLabel;
    cmbforn: TwwDBLookupCombo;
    qryforn: TwwQuery;
    Splitter1: TSplitter;
    procedure Consulta; override;
    procedure bbSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function  trazmes(mes : string):string;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSairClick(Sender: TObject);
    procedure DBLkpCmbplanassEnter(Sender: TObject);
    procedure wwDBLookupCombo1Enter(Sender: TObject);
    procedure wwDBLookupCombo2Enter2(Sender: TObject);
    
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsPagFornserv: TfrmConsPagFornserv;

implementation

{$R *.DFM}

procedure TfrmConsPagFornserv.bbSairClick(Sender: TObject);
begin
  inherited;
close;
end;

procedure TfrmConsPagFornserv.Consulta;
var
   sSql1   : string;
begin

   qry.close;

   qry.sql.clear;

   sSql1 := '';

   sSql1 := sSql1 + 'where histpag.idplanass = planass.idplanass and ';

   sSql1 := sSql1 + ' histpag.idmotivo =  motivo.idmotivo and ';
   sSql1 := sSql1 + ' histpag.idregra =  regra.idregra(+) and ';
   sSql1 := sSql1 + ' histpag.idfornserv  =  pessoa.idpessoa and ';
   sSql1 := sSql1 + ' pessoa.idpessoa in(select idpessoa from fornserv) and ';



   if wwDBLookupCombo1.text <> ''       then
     begin
        sSQL1 := sSQL1 + ' histpag.idmotivo        = ' + qrymotivo.FieldbyName('Idmotivo').AsString + ' and ';
     end;
   if DBLkpCmbplanass.text <> ''       then
      begin
         sSQL1 := sSQL1 + ' histpag.idplanass        = ' + qryplanass.FieldbyName('IdPlanass').AsString + ' and ';
      end;
   if cmb1.text <> '' then
      begin
         sSQL1 := sSQL1 + ' histpag.mes >= '''+inttostr(spin1.value)+'/'+trazmes(cmb1.text)+''' and ';
      end;
   if cmb2.text <> '' then
      begin
         sSQL1 := sSQL1 + ' histpag.mes <= '''+inttostr(spin2.value)+'/'+trazmes(cmb2.text)+''' and ';
      end;

   if datapagini.text <> '' then
      begin
         sSQL1 := sSQL1 + ' histpag.data >= to_date('''+datapagini.text+''',''dd/mm/yyyy'') and ';
      end;
   if datapagfim.text <> '' then
      begin
         sSQL1 := sSQL1 + ' histpag.data <= to_date('''+datapagfim.text+''',''dd/mm/yyyy'') and ';
      end;

   if cmbforn.text <> '' then
      begin
         sSQL1 := sSQL1 + ' histpag.idfornserv = '+qryforn.fieldbyname('idpessoa').AsString+' and ';
      end;

   {testando}


   if sSQL1 <> ''
   then sSQL1 := Copy(sSQL1, 1, Length(sSQL1)-5);

   qry.sql.clear;


   qry.sql.add('select histpag.* , planass.nome , motivo.descricao, regra.nomeregra, pessoa.nome forn  ' +
               ' from histpag , planass , motivo ,regra, pessoa '+
               ''+ sSql1 + ' order by histpag.mes');

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

procedure TfrmConsPagFornserv.FormCreate(Sender: TObject);
begin
  inherited;
{qrypatro.open;
qrymotivo.open;
qryplanass.open;
qryprodass.open;
qryforn.open;}
spin1.value := strtoint(copy(datetostr(date),7,4));
spin2.value := strtoint(copy(datetostr(date),7,4));
end;



procedure TfrmConsPagFornserv.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
action := cafree;
end;

//OBS: existe esta rotina na lib!!!
function TfrmConsPagFornserv.trazmes(mes : string): string;
var
   saida : string;
begin
   if mes='JANEIRO' then saida:='01';
   if mes='FEVEREIRO' then saida:='02';
   if mes='MARÇO' then saida:='03';     {ACERTAR ESSA ROTINA, TESTAR O MES COM 3 POSICOES}
   if mes='ABRIL' then saida:='04';     {}
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






procedure TfrmConsPagFornserv.bbtnSairClick(Sender: TObject);
begin
  inherited;
close;
end;


procedure TfrmConsPagFornserv.DBLkpCmbplanassEnter(Sender: TObject);
begin
  inherited;
if not qryplanass.active then
begin
   qryplanass.open;
end;
end;

procedure TfrmConsPagFornserv.wwDBLookupCombo1Enter(Sender: TObject);
begin
  inherited;
if not qrymotivo.active then
begin
   qrymotivo.open;
end;
end;



procedure TfrmConsPagFornserv.wwDBLookupCombo2Enter2(Sender: TObject);
begin
if not qryforn.active then
begin
   qryforn.open;
end;
end;

end.

