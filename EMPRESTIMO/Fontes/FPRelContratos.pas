unit FPRelContratos;


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMParamRel, Wwdbdlg, wwdblook, TREdit, MAHlpBtn,
  Buttons, cmRepBtn, ExtCtrls, Db, DBTables, Wwquery, UMensErro, TB97,
  ComCtrls, IvDictio, IvMulti, IvEMulti, TB97Tlbr, StdCtrls,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmPRelContratos = class(TCMParamRel)
    qryPatro: TwwQuery;
    qryParticip: TwwQuery;
    qryPlano: TwwQuery;
    qryTpContr: TwwQuery;
    qryTpEmptmo: TwwQuery;
    TabSheet1: TTabSheet;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    deDtIni: TCMDateTimePicker;
    deDtFim: TCMDateTimePicker;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    reCtrIni: TRealEdit;
    reCtrFim: TRealEdit;
    lkcmbPatro: TwwDBLookupCombo;
    lkcmbdlgParticip: TwwDBLookupComboDlg;
    lkcmbPlano: TwwDBLookupCombo;
    lkcmbTpContr: TwwDBLookupCombo;
    lkcmbTpEmptmo: TwwDBLookupCombo;
    Label3: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure lkcmbdlgParticipEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lkcmbPlanoEnter(Sender: TObject);
    procedure reCtrFimExit(Sender: TObject);
    procedure deDtFimExit(Sender: TObject);
    procedure rbtnVisualizarClick(Sender: TObject);
    procedure rbtnImprimirClick(Sender: TObject);
  private
    procedure CriaSelect;
    { Private declarations }
  public
    PartiGeral, PlanGeral, TpConGeral, TpEmpGeral : boolean;
    sSql : string;
    { Public declarations }
  end;

var
  frmPRelContratos: TfrmPRelContratos;

implementation

uses FRelContratos;

{$R *.DFM}



procedure TfrmPRelContratos.lkcmbdlgParticipEnter(Sender: TObject);
begin
  inherited;
  if lkcmbPatro.Text <> '' then begin
    sSql := 'Select A.NOME, A.IDPESSOA '+
            ' From PESSOA A, CONTRATO B '+
            ' Where A.IDPESSOA = B.IDPESSOA '+
            ' And B.IDPATRO = '+qryPatro.FieldByName('IDPESSOA').AsString;
    qryParticip.Close;
    qryParticip.Sql.Clear;
    qryParticip.Sql.Add(sSql);
    qryParticip.Open;
    PartiGeral := false;
   end
  else if not PartiGeral then begin
    sSql := ' Select A.NOME, A.IDPESSOA '+
            ' From PESSOA A, CONTRATO B '+
             ' Where A.IDPESSOA = B.IDPESSOA '+
            ' Order by UPPER(A.NOME) ';
    qryParticip.Close;
    qryParticip.Sql.Clear;
    qryParticip.Sql.Add(sSql);
    qryParticip.Open;
    PartiGeral := true
  end;

end;

procedure TfrmPRelContratos.FormShow(Sender: TObject);
begin
  inherited;
  qryPatro.Open;
  qryTpContr.Open;
  qryTpEmptmo.Open;
  PartiGeral := false;
  PlanGeral := false;
end;


procedure TfrmPRelContratos.lkcmbPlanoEnter(Sender: TObject);
begin
  inherited;
  if (lkcmbPatro.Text = '') and ( lkcmbdlgParticip.Text = '') and (not PlanGeral) then begin
    sSql := 'Select DISTINCT A.NOME, A.IDPLANOPREV '+
            ' From PLANOPREV A, PARTPREVPLAN B, CONTRATO C '+
            ' Where C.IDPLANOPREV = B.IDPLANOPREV  '+
            ' B.FLGDESATIVADO = 0 '+ //GLY
            ' And B.IDPLANOPREV = A.IDPLANOPREV '+
            ' ORDER BY UPPER(A.NOME) ';
    qryPlano.Close;
    qryPlano.Sql.Clear;
    qryPlano.Sql.Add(sSql);
    qryPlano.Open;
    PlanGeral := true;
  end
  else if (lkcmbPatro.Text <> '') and ( lkcmbdlgParticip.Text = '')  then begin
    sSql := 'Select DISTINCT A.NOME, A.IDPLANOPREV '+
            ' From PLANOPREV A, PARTPREVPLAN B, CONTRATO C '+
            ' Where C.IDPLANOPREV = B.IDPLANOPREV  '+
            ' B.FLGDESATIVADO = 0 '+ //GLY
            ' And B.IDPLANOPREV = A.IDPLANOPREV '+
            ' And C.IDPATRO = '+qryPatro.FieldByName('IDPESSOA').AsString
            +' ORDER BY UPPER(A.NOME) ';
    qryPlano.Close;
    qryPlano.Sql.Clear;
    qryPlano.Sql.Add(sSql);
    qryPlano.Open;
    PlanGeral := false;
  end
  else if (lkcmbPatro.Text = '') and ( lkcmbdlgParticip.Text <> '')  then begin
    sSql := 'Select DISTINCT A.NOME, A.IDPLANOPREV '+
            ' From PLANOPREV A, PARTPREVPLAN B, CONTRATO C '+
            ' Where C.IDPLANOPREV = B.IDPLANOPREV  '+
            ' B.FLGDESATIVADO = 0 '+ //GLY
            ' And B.IDPLANOPREV = A.IDPLANOPREV '+
            ' And C.IDPESSOA = '+qryParticip.FieldByName('IDPESSOA').AsString
            +' ORDER BY UPPER(A.NOME) ';
    qryPlano.Close;
    qryPlano.Sql.Clear;
    qryPlano.Sql.Add(sSql);
    qryPlano.Open;
    PlanGeral := false;
  end
  else if (lkcmbPatro.Text <> '') and ( lkcmbdlgParticip.Text <> '')  then begin
    sSql := 'Select DISTINCT A.NOME, A.IDPLANOPREV '+
            ' From PLANOPREV A, PARTPREVPLAN B, CONTRATO C '+
            ' Where C.IDPLANOPREV = B.IDPLANOPREV  '+
            ' And B.IDPLANOPREV = A.IDPLANOPREV '+
            ' B.FLGDESATIVADO = 0 '+ //GLY            
            ' And C.IDPESSOA = '+qryParticip.FieldByName('IDPESSOA').AsString
            +' And C.IDPATRO = '+qryPatro.FieldByName('IDPESSOA').AsString
            +' ORDER BY UPPER(A.NOME) ';
    qryPlano.Close;
    qryPlano.Sql.Clear;
    qryPlano.Sql.Add(sSql);
    qryPlano.Open;
    PlanGeral := false;
  end;

end;

procedure TfrmPRelContratos.reCtrFimExit(Sender: TObject);
begin
  inherited;
  if reCtrFim.Value < reCtrIni.Value then begin
    MsgDlg('Numero de contrato final deve ser maior que inicial. ','Empréstimo',mtError,[mbOK],0);
    reCtrFim.SetFocus;
  end;
end;

procedure TfrmPRelContratos.deDtFimExit(Sender: TObject);
begin
  inherited;
  if deDtFim.Date < deDtIni.Date then begin
    MsgDlg('Data de Assinatura final deve ser maior que inicial. ','Empréstimo',mtError,[mbOK],0);
    deDtFim.SetFocus;
  end;

end;

procedure TfrmPRelContratos.rbtnVisualizarClick(Sender: TObject);
begin
  inherited;
  frmRelSContratos := TfrmRelSContratos.Create(Self);
  CriaSelect;
  frmRelSContratos.qryContratos.Sql.Clear;
  frmRelSContratos.qryContratos.Sql.Add(sSql);
  if (deDtIni.Text  <> '') or (deDtFim.Text <> '') then begin
    frmRelSContratos.qryContratos.ParamByName('dt1').AsFloat := deDtIni.Date;
    frmRelSContratos.qryContratos.ParamByName('dt2').AsFloat := deDtFim.Date;
  end;
  frmRelSContratos.qryContratos.Open;
  frmRelSContratos.qryNomes.Open;
  frmRelSContratos.qryTipos.Open;
  frmRelSContratos.qryCredito.Open;
  frmRelSContratos.qr.Preview;
end;

procedure TfrmPRelContratos.CriaSelect;
begin

  sSql := ' Select * from CONTRATO ';

  if lkcmbPatro.Text <> '' then
    sSql := sSql + 'Where IDPATRO = '+qryPatro.FieldByName('IDPESSOA').AsString;

  if lkcmbdlgParticip.Text <> '' then
   if sSql = ' Select * from CONTRATO ' then
     sSql := sSql + ' Where IDPESSOA = '+qryParticip.FieldByName('IDPESSOA').AsString
   else
     sSql := sSql + ' And IDPESSOA = '+qryParticip.FieldByName('IDPESSOA').AsString;

  if lkcmbPlano.Text <> '' then
    if sSql = ' Select * from CONTRATO ' then
      sSql := sSql + ' Where IDPLANOPREV = '+qryPlano.FieldByName('IDPLANOPREV').AsString
    else
      sSql := sSql + ' And IDPLANOPREV = '+qryPlano.FieldByName('IDPLANOPREV').AsString;

  if lkcmbTpContr.Text <> '' then
    if sSql = ' Select * from CONTRATO ' then
      sSql := sSql + ' Where IDTipoContrEmptmo = '+qryTpContr.FieldByName('IDTipoContrEmptmo').AsString
    else
      sSql := sSql + ' And IDTipoContrEmptmo = '+qryTpContr.FieldByName('IDTipoContrEmptmo').AsString;

  if lkcmbTpEmptmo.Text <> '' then
    if sSql = ' Select * from CONTRATO ' then
      sSql := sSql + ' Where IDTIPOEMPTMO = '+qryTpEmptmo.FieldByName('IDTIPOEMPTMO').AsString
    else
      sSql := sSql + ' And IDTIPOEMPTMO = '+qryTpEmptmo.FieldByName('IDTIPOEMPTMO').AsString;

 if (reCtrIni.Value <> 0) or (reCtrFim.Value <> 0) then
  if sSql = ' Select * from CONTRATO ' then
    sSql := sSql + ' Where IDContratoEmptmo BETWEEN '+IntToStr(Trunc(reCtrIni.Value))+' AND '+IntToStr(Trunc(reCtrFim.Value))
  else
    sSql := sSql + ' And IDContratoEmptmo BETWEEN '+IntToStr(Trunc(reCtrIni.Value))+' AND '+IntToStr(Trunc(reCtrFim.Value));

 if (deDtIni.Text <> '') or (deDtIni.Text <> '') then
  if sSql = ' Select * from CONTRATO ' then
    sSql := sSql + ' Where DATAASSIN BETWEEN :dt1 and :dt2 '
  else
    sSql := sSql + ' And DATAASSIN BETWEEN :dt1 and :dt2 ';


end;

procedure TfrmPRelContratos.rbtnImprimirClick(Sender: TObject);
begin
  inherited;

  frmRelSContratos := TfrmRelSContratos.Create(Self);
  CriaSelect;
  frmRelSContratos.qryContratos.Sql.Clear;  
  frmRelSContratos.qryContratos.Sql.Add(sSql);
  if (deDtIni.Text  <> '') or (deDtFim.Text <> '') then begin
    frmRelSContratos.qryContratos.ParamByName('dt1').AsFloat := deDtIni.Date;
    frmRelSContratos.qryContratos.ParamByName('dt2').AsFloat := deDtFim.Date;
  end;
  frmRelSContratos.qryContratos.Open;
  frmRelSContratos.qryNomes.Open;
  frmRelSContratos.qryCredito.Open;
  frmRelSContratos.qr.Print;
end;



end.
