unit FEtiqueta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RPai, quickrpt, ExtCtrls, Db, Wwdatsrc, DBTables, Wwquery, Qrctrls,
  IvDictio, IvMulti, IvEMulti;

type
  TfrmEtiquetas = class(TrelPai)
    qryetiqueta: TwwQuery;
    dsetiqueta: TwwDataSource;
    QRBand1: TQRBand;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText1: TQRDBText;
    procedure FormCreate(Sender: TObject);
    procedure qryetiquetaBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEtiquetas: TfrmEtiquetas;

implementation

uses FParamEtiqueta;

{$R *.DFM}

procedure TfrmEtiquetas.FormCreate(Sender: TObject);
begin
  inherited;
  qryetiqueta.open;
  QRBand1.Size.height := strtoint(frmParamEtiqueta.edAltura.text);
  QRBand1.size.width := strtoint(frmParamEtiqueta.edLargura.text);
  with frmParamEtiqueta do
  begin
       if CheckBox1.checked = true then
       begin
            QRBand1.frame.DrawTop := true;
            QRBand1.frame.drawright := true;
            QRBand1.frame.Drawleft := true;
            QRBand1.frame.Drawbottom := true;
       end
       else
       begin
            QRBand1.frame.DrawTop := false;
            QRBand1.frame.drawright := false;
            QRBand1.frame.Drawleft := false;
            QRBand1.frame.Drawbottom := false;
       end;
  end;
end;

procedure TfrmEtiquetas.qryetiquetaBeforeOpen(DataSet: TDataSet);
var
   sSql : string;
begin
  inherited;
  sSQL := ' SELECT DISTINCT CIDADES.NOME CIDADE, ESTADO.CODESTADO,EP.*, '+
                 ' PESSOA.IDPESSOA, PESSOA.NOME, PESSOA.NUMDOCUMENTO CPF '+
            ' FROM CIDADES, ESTADO, ELEGPATRO, PARTASS, PESSOA, PLANASS,'+
                 ' SITPLANOASS, PESSOA P2, PLANPREV PR, PARTPREVPLAN PREV, ENDPESS EP '+
          ' WHERE (PARTASS.IDPESSJUR = P2.IDPESSOA) AND '+
                ' (P2.IDPESSOA = ELEGPATRO.IDPESSJUR) AND '+
                ' (ELEGPATRO.IDPESSJUR = PARTASS.IDPESSJUR) AND '+
                ' (ELEGPATRO.IDPESSOA = PESSOA.IDPESSOA) AND '+
                ' (PLANASS.IDPLANASS = PARTASS.IDPLANASS) AND '+
                ' (SITPLANOASS.IDSITPLANOASS = PARTASS.IDSITPART) AND '+
                ' (PARTASS.IDPLANOPREV = PR.IDPLANOPREV) AND '+
                ' (PARTASS.IDPESSOA = ELEGPATRO.IDPESSOA) AND '+
                ' (PESSOA.IDPESSOA = EP.IDPESSOA) AND '+
                ' (PREV.IDPESSOA = PARTASS.IDPESSOA) AND '+
                ' (PREV.IDPESSJUR = PARTASS.IDPESSJUR) AND '+
                ' (EP.IDCIDADES=CIDADES.IDCIDADES) AND '+
                ' (CIDADES.IDESTADO=ESTADO.IDESTADO) AND '+
                ' (PREV.IDPLANOPREV = PARTASS.IDPLANOPREV) AND ';

  if frmParamEtiqueta.edmatricula.text <> '' then
    sSQL := sSql + ' (elegpatro.matricula = '''+frmParamEtiqueta.edmatricula.text+''') and ';

  if frmParamEtiqueta.edcpf.text <> '' then
    sSQL := sSql + ' (pessoa.numdocumento = '''+frmParamEtiqueta.edcpf.text+''') and ';

  if frmParamEtiqueta.ednome.text <> '' then
    sSQL := sSql + ' (UPPER(pessoa.NOME) LIKE ''%'+frmParamEtiqueta.ednome.text+'%'') and ';

  if Trim(frmParamEtiqueta.dblkpcmbPlano.Text) <> '' then
    sSQL := sSQL + ' (PARTASS.IDPLANOPREV = '+frmParamEtiqueta.qryPlano.FieldByName('IDPLANOPREV').AsString+') and ';

  if Trim(frmParamEtiqueta.dblkpcmbPlanass.Text) <> '' then
    sSQL := sSQL + ' (PARTASS.IDPLANASS = '+frmParamEtiqueta.qryPlanass.FieldByName('IDPLANASS').AsString+') and ';

  if Trim(frmParamEtiqueta.dblkpcmbPatro.Text) <> '' then
    sSQL := sSQL + ' (PARTASS.IDPESSJUR = '+frmParamEtiqueta.qryPatro.FieldByName('IDPESSOA').AsString+') and ';

  if Trim(frmParamEtiqueta.edNumInsc.Text) <> '' then
    sSQL := sSQL + ' (PARTASS.INSCRICAONUMERO = '''+Trim(frmParamEtiqueta.edNumInsc.Text)+''') and ';

  if (Trim(frmParamEtiqueta.mskdlgDataInsc.Text) <> '')
     and (Trim(frmParamEtiqueta.mskdlgDataInsc.Text) <> '/  /') then
   sSQL := sSQL + ' (PARTASS.DATAENTRADA = To_Date('''+Trim(frmParamEtiqueta.mskdlgDataInsc.Text)+''',''dd/MM/yyyy'')'+') and ';

  if frmParamEtiqueta.numinscprev.text <> '' then
    sSQL := sSQL + ' (prev.inscricaonumero = '''+trim(frmParamEtiqueta.numinscprev.text)+''') and ';

  if frmParamEtiqueta.datainscprev.text <> '' then
    sSQL := sSQL + ' (prev.inscricaodata = to_date('''+frmParamEtiqueta.datainscprev.text+''',''dd/mm/yyyy'')) and ';

  if frmParamEtiqueta.dblkpcmbSituacao.Text <> '' then
    sSQL := sSQL + ' (SITPLANOASS.IDSITPLANOASS = '+frmParamEtiqueta.qrysitpart.fieldbyname('idsitpart').AsString+') and ';

  sSQL := Copy(sSQL, 1, Length(sSQL)-5);

  sSQL := sSQL + ' ORDER BY PESSOA.NOME';
  qryetiqueta.SQL.Clear;
  qryetiqueta.SQL.Add(sSQL);
end;

end.
