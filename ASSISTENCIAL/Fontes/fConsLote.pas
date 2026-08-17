unit fConsLote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Wwdatsrc, IvDictio, IvMulti, IvEMulti, Grids,
  Wwdbigrd, Wwdbgrid, StdCtrls, Tabs, ComCtrls, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Wwquery, Spin, checklst, FConsultar;

type
  TfrmConsLote = class(TfrmConsultar)
    qry: TwwQuery;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    chkpatrocinadora: TCheckListBox;
    qrypatrocinadora: TwwQuery;
    GroupBox4: TGroupBox;
    cmbmes: TComboBox;
    spinano: TSpinEdit;
    procedure FormShow(Sender: TObject);
    procedure Consulta; override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsLote: TfrmConsLote;

implementation
uses UMensErro, UAdmAss;

{$R *.DFM}

procedure TfrmConsLote.FormShow(Sender: TObject);
var i : integer;
begin
  inherited;
  RetornaDataCorr(cmbMes, spinano);

  qrypatrocinadora.open;
  for i:=0 to qrypatrocinadora.recordcount - 1 do
  begin
    chkpatrocinadora.Items.Add(qrypatrocinadora.fieldbyname('nome').asstring);
    qrypatrocinadora.next;
  end;
end;

procedure TfrmConsLote.Consulta;
var periodo, patrocinadoras : string;
    i, marcados : integer;
begin
  if cmbmes.itemindex <= 9 then
     periodo := spinano.text+'/0'+inttostr(cmbmes.ItemIndex + 1)
  else
     periodo := spinano.text+'/'+inttostr(cmbmes.ItemIndex + 1);

  patrocinadoras := '';
  marcados := 0;
  for i:=0 to chkpatrocinadora.Items.Count-1 do
  begin
    if chkpatrocinadora.checked[i] then
    begin
      qrypatrocinadora.Locate('nome',chkpatrocinadora.items.strings[i],[]);
      patrocinadoras := patrocinadoras + inttostr(qrypatrocinadora.fieldbyname('idpessoa').asinteger)+',';
      inc(marcados);
    end;
  end;
  if patrocinadoras <> '' then
  begin
     if marcados = chkpatrocinadora.Items.Count then
       patrocinadoras := ''
     else
       patrocinadoras := copy(patrocinadoras,1,length(patrocinadoras)-1);
  end;

  qry.close;
  qry.sql.clear;
  qry.sql.add ('select ci.IDLOTE, ci.MESREFERENCIA, pj.nome patro, ci.VLRTOTAL,'+
                     ' ci.DATAIDATMP, ci.DATAIDAINTERFACE, ci.DATAVOLTAINTERFA,'+
                     ' ci.DATAVOLTATMP'+
                ' from ctrlinterface ci, pessoa pj'+
               ' where (ci.idpessoa = pj.idpessoa)'+
                 ' and (ci.TIPO = ''A'')'+
                 ' and (ci.MESREFERENCIA = '''+periodo+''')');
  if patrocinadoras <> '' then
  begin
    qry.sql.add (' and (ci.idpessoa in ('+patrocinadoras+'))');
  end;

  try
     qry.Open;
  except
     on E:EDBEngineError do
     begin
        MostrarErro(E);
        Exit;
     end;
  end;
end;

end.
