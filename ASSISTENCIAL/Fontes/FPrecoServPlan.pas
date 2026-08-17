unit FPrecoServPlan;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, ExtCtrls, MAHlpBtn, Buttons,  Db,
  Wwdatsrc, DBTables, Wwquery, TB97, TREdit, wwdblook, TB97Tlbr, IvDictio,
  IvMulti, IvEMulti;

type
  TfrmPrecoServPlanass = class(TfrmOkCancelar)
    Label1: TLabel;
    Label2: TLabel;
    edservplan: TEdit;
    qrypreco: TwwQuery;
    dspreco: TwwDataSource;
    qryaux: TwwQuery;
    edpreco: TRealEdit;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    cmbregrapag: TwwDBLookupCombo;
    cmbregrareemb: TwwDBLookupCombo;
    cmbregracomiss: TwwDBLookupCombo;
    qryregra: TwwQuery;
    qryregra2: TwwQuery;
    qryregra3: TwwQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure qryprecoBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrecoServPlanass: TfrmPrecoServPlanass;

implementation

uses  FPlanass;

{$R *.DFM}

procedure TfrmPrecoServPlanass.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
//action := cafree;
end;

procedure TfrmPrecoServPlanass.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
edpreco.text := '';
cmbregrapag.text := '';
cmbregracomiss.text := '';
cmbregrareemb.text := '';
end;

procedure TfrmPrecoServPlanass.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

if edpreco.text = '' then
begin
     showmessage('O campo Preço esta vazio !');
     exit;
end;

qryaux.close;
qryaux.sql.clear;
qryaux.sql.add('UPDATE SERVPLANASS SET PRECO = :PRECO'+
               ',IDREGRAPAGAMENTO = :REGRAPAG '+
               ',IDREGRACOMISSAO = :REGRACOMISS '+
               ',IDREGRAREEMBOLSO = :REGRAREEMB '+
               ' WHERE IDPLANASS = '+qrypreco.fieldbyname('idplanass').AsString+''+
               ' AND   IDSERVASS = '+qrypreco.fieldbyname('idservass').AsString+'');


if(cmbregrapag.text = '') then
begin
   qryaux.parambyname('regrapag').AsString := '';
end
else
begin
   qryaux.parambyname('regrapag').AsString := ''+qryregra.fieldbyname('pag').AsString+'';
end;

if (cmbregracomiss.text = '') then
begin
   qryaux.parambyname('regracomiss').AsString := '';
end
else
begin
   qryaux.parambyname('regracomiss').AsString := ''+qryregra2.fieldbyname('comiss').AsString+'';
end;

if  (cmbregrareemb.text = '') then
begin
   qryaux.parambyname('regrareemb').AsString := '';
end
else
begin
   qryaux.parambyname('regrareemb').AsString := ''+qryregra3.fieldbyname('reemb').AsString+'';
end;


try
   qryaux.parambyname('preco').AsFloat := edpreco.value;
   qryaux.execsql;
except
      raise;
end;


frmplanass.qrytpservass.CommitUpdates;
frmplanass.qrytpservass.close;
frmplanass.qrytpservass.open;
close;

end;

procedure TfrmPrecoServPlanass.FormActivate(Sender: TObject);
begin
  inherited;

qrypreco.open;
edservplan.text := nome+'/'+nomeplano ;

if consulta then
begin
   edpreco.value := frmPlanass.qrytpservass.fieldbyname('preco').AsFloat ;
end
else
begin
   edpreco.value := 0;
end;

//novo
qryregra.Open;
if pag <> 0 then
begin
   qryregra.Locate('pag',pag,[loPartialKey]);
   cmbregrapag.text := qryregra.fieldbyname('nomepag').AsString;
end;
qryregra2.open;
if comiss <> 0 then
begin
   qryregra2.Locate('comiss',comiss,[loPartialKey]);
   cmbregracomiss.text := qryregra2.fieldbyname('nomecomiss').AsString;
end;
qryregra3.open;
if reemb <> 0 then
begin
   qryregra3.Locate('reemb',reemb,[loPartialKey]);
   cmbregrareemb.text := qryregra3.fieldbyname('nomereemb').AsString;
end;   
end;

procedure TfrmPrecoServPlanass.qryprecoBeforeOpen(DataSet: TDataSet);
begin
  inherited;
qrypreco.Close;
qrypreco.sql.clear;
qrypreco.sql.add(' SELECT TP.IDSERVASS , TP.NOME , PA.IDPLANASS , PA.PRECO '+
                 ' FROM TPSERVASS TP , SERVPLANASS PA '+
                 ' WHERE '+
                 ' PA.IDSERVASS = TP.IDSERVASS '+
                 ' AND PA.IDPLANASS =  '+frmPlanass.qryprinc.fieldbyname('idplanass').AsString+''+
                 ' AND TP.IDSERVASS =  '+idservass+'');
end;





end.
