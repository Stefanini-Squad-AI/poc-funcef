unit FConsEstatDivergContribass;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, TeeProcs, TeEngine,
  Chart, DBChart, wwdblook, TEdNum, DBCtrls, Series, TeeFunci, Db,
  Wwdatsrc, DBTables, Wwquery, ComCtrls, Menus, FOkCancelar, TB97, Spin,
  TB97Tlbr, IvDictio, IvMulti, IvEMulti;

type
  TfrmConsEstatDivergContrib = class(TfrmOkCancelar)
    Label5: TLabel;
    qrypatro: TwwQuery;
    qryplano: TwwQuery;
    qryGrafico: TwwQuery;
    dsGrafico: TwwDataSource;
    Timer1: TTimer;
    qryContribuicao: TwwQuery;
    pnlForaComent: TPanel;
    pnlcoment: TPanel;
    pgctrlEstat: TPageControl;
    tbsSelecao: TTabSheet;
    tbsGrafico: TTabSheet;
    DBChart1: TDBChart;
    rot: TBitBtn;
    Series1: TPieSeries;
    Series2: TBarSeries;
    Series3: TAreaSeries;
    lblPatro: TLabel;
    lblPlano: TLabel;
    lblMesReferencia: TLabel;
    lblMesCobranca: TLabel;
    lblContribuicao: TLabel;
    StaticText2: TStaticText;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dblkpcmbPatro: TwwDBLookupCombo;
    dblkpcmbPlano: TwwDBLookupCombo;
    grpMeses: TGroupBox;
    grpMesAnoRef: TGroupBox;
    cmbMesRef: TComboBox;
    spedAnoRef: TSpinEdit;
    GroupBox4: TGroupBox;
    cmbMesCob: TComboBox;
    spedAnoCob: TSpinEdit;
    grpContrib: TGroupBox;
    dblkpcmbContribuicao: TwwDBLookupCombo;
    rgrpOpcoes: TRadioGroup;
    rdgrgraf: TRadioGroup;
    rdgrpmodo: TRadioGroup;
    Bevel1: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    cmbplanass: TwwDBLookupCombo;
    lblplanass: TLabel;
    qryplanass: TwwQuery;
    cmbfilial: TwwDBLookupCombo;
    Label29: TLabel;
    qryfilial: TwwQuery;
    procedure atualizagrafico;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure RotClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure pgctrlEstatChange(Sender: TObject);
    procedure zeravalores;
    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dblkpcmbPatroEnter(Sender: TObject);
    procedure dblkpcmbPlanoEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure rgrpOpcoesClick(Sender: TObject);
    procedure cmbplanassEnter(Sender: TObject);
    procedure cmbfilialEnter(Sender: TObject);
  private
    { Private declarations }
    sMesReferencia,
    sMesCobranca : string;
    AYear, AMonth, ADay: Word;
    function PreparaQryGrafico : boolean;

  public
    { Public declarations }

  end;

Var
  frmConsEstatDivergContrib: TfrmConsEstatDivergContrib;

implementation

uses UMensErro;

{$R *.DFM}

function TfrmConsEstatDivergContrib.PreparaQryGrafico : boolean;
Var
    sYValues,
    sXLabelsSource,
    sXValues,
    sSQL : string;
begin
   // Result := False;
    if rgrpOpcoes.ItemIndex = 0 // Contribuicao x No. de Divergencias
    then begin
       sSQL := 'SELECT COUNT(HSTCONTRIBASS.IDDEPENDENTE||HSTCONTRIBASS.IDTITULAR) NUMPESSOAS ,'+
               ' CONTRIBUICAO.NOME  NOMECONTRIB '+
               ' FROM  HSTCONTRIBASS,ELEGPATRO,CONTRIBUICAO,CONTRIBASS '+
               ' WHERE'+
               ' (HSTCONTRIBASS.IDPESSJUR = ELEGPATRO.IDPESSJUR) AND '+
               '  (HSTCONTRIBASS.IDTITULAR = ELEGPATRO.IDPESSOA) AND '+
               ' (HSTCONTRIBASS.IDCONTASS = CONTRIBUICAO.IDCONTRIBUICAO) AND '+
               ' (HSTCONTRIBASS.VALORESPERADO <> HSTCONTRIBASS.VALORRECEBIDO) AND '+
               //' CONTRIBASS.PAGADOR = ''C'' AND '+
               ' (HSTCONTRIBASS.IDCONTASS = CONTRIBASS.IDCONTASS) AND '+
               ' (HSTCONTRIBASS.SITRECEBIMENTO NOT IN (0,1)) AND ';

       if Trim(dblkpcmbPatro.Text) <> ''
       then sSQL := sSQL + ' (ELEGPATRO.IDPESSJUR = '+qryPatro.FieldByName('IdPessoa').AsString+') AND ';
       if Trim(cmbfilial.Text) <> ''
       then sSQL := sSQL + ' (ELEGPATRO.IDESTAB = '+qryfilial.FieldByName('IdPessoa').AsString+') AND ';
       if Trim(dblkpcmbPlano.Text) <> ''
       then sSQL := sSQL +'  (PARTASS.IDPLANOPREV = '+qryPlano.FieldByName('IdPlanoPrev').AsString+') AND ';
       if Trim(cmbplanass.Text) <> ''
       then sSQL := sSQL +'  (PARTASS.IDPLANASS = '+qryPlanass.FieldByName('IdPlanass').AsString+') AND ';

       if sMesReferencia <> ''
       then sSQL := sSQL +'  (HSTCONTRIBASS.MES = '''+sMesReferencia+''') AND ';
       if sMesCobranca <> ''
       then sSQL := sSQL +'  (HSTCONTRIBASS.MESCOBRANCA = '''+sMesCobranca+''') AND ';

       //  Fim das condições por Seleção
       if sSQL <>  ''
       then sSQL := Copy(sSQL, 1, Length(sSQL)-5);

       sSQL := sSQL+' GROUP BY CONTRIBUICAO.NOME ';
       sYValues        := 'NUMPESSOAS';
       sXLabelsSource  := 'NOMECONTRIB';
       sXValues        := 'NUMPESSOAS';
    end
    else if rgrpOpcoes.ItemIndex = 1 // Mês x No de Divergencias
    then begin

       sSQL := 'SELECT COUNT(HSTCONTRIBASS.IDDEPENDENTE||HSTCONTRIBASS.IDTITULAR) NUMPESSOAS ,'+
               ' HSTCONTRIBASS .MES '+
               ' FROM  HSTCONTRIBASS,ELEGPATRO,CONTRIBUICAO,CONTRIBASS '+
               ' WHERE '+
               ' (HSTCONTRIBASS.IDPESSJUR = ELEGPATRO.IDPESSJUR) AND '+
               ' (HSTCONTRIBASS.IDTITULAR = ELEGPATRO.IDPESSOA) AND '+
               ' (HSTCONTRIBASS.IDCONTASS = CONTRIBUICAO.IDCONTRIBUICAO) AND '+
               ' (HSTCONTRIBASS.VALORESPERADO <> HSTCONTRIBASS.VALORRECEBIDO) AND '+
               //' CONTRIBASS.PAGADOR = ''C'' AND '+
               ' (HSTCONTRIBASS.IDCONTASS = CONTRIBASS.IDCONTASS) AND '+
                ' (HSTCONTRIBASS.SITRECEBIMENTO NOT IN (0,1)) AND ';


       if Trim(dblkpcmbPatro.Text) <> ''
       then sSQL := sSQL + ' (ELEGPATRO.IDPESSJUR = '+qryPatro.FieldByName('IdPessoa').AsString+') AND ';
       if Trim(dblkpcmbPlano.Text) <> ''
       then sSQL := sSQL +'  (PARTASS.IDPLANOPREV = '+qryPlano.FieldByName('IdPlanoPrev').AsString+') AND ';
       if Trim(cmbfilial.Text) <> ''
       then sSQL := sSQL + ' (ELEGPATRO.IDESTAB = '+qryfilial.FieldByName('IdPessoa').AsString+') AND ';
       if Trim(cmbplanass.Text) <> ''
       then sSQL := sSQL +'  (PARTASS.IDPLANASS = '+qryPlanass.FieldByName('IdPlanass').AsString+') AND ';

       if sMesReferencia <> ''
       then sSQL := sSQL +'  (HSTCONTRIBASS.MES = '''+sMesReferencia+''') AND ';
       if sMesCobranca <> ''
       then sSQL := sSQL +'  (HSTCONTRIBASS.MESCOBRANCA = '''+sMesCobranca+''') AND ';

       //  Fim das condições por Seleção
       if sSQL <>  ''
       then sSQL := Copy(sSQL, 1, Length(sSQL)-5);

       sSQL := sSQL+' GROUP BY HSTCONTRIBASS.MES';
       sYValues        := 'NUMPESSOAS';
       sXLabelsSource  := 'MES';
       sXValues        := 'NUMPESSOAS';
    end // ItemIndex = 1
    else if rgrpOpcoes.ItemIndex = 2 // Plano x No. de Divergencias
    then begin
       sSQL := 'SELECT COUNT(HSTCONTRIBASS.IDDEPENDENTE||HSTCONTRIBASS.IDTITULAR) NUMPESSOAS ,'+
               ' PLANASS.NOME PLANO '+
               ' FROM  HSTCONTRIBASS,ELEGPATRO,CONTRIBUICAO,CONTRIBASS,PLANASS '+
               ' WHERE'+
               ' (HSTCONTRIBASS.IDPESSJUR = ELEGPATRO.IDPESSJUR) AND '+
               ' (HSTCONTRIBASS.IDTITULAR = ELEGPATRO.IDPESSOA) AND '+
               ' (HSTCONTRIBASS.IDCONTASS = CONTRIBUICAO.IDCONTRIBUICAO) AND '+
               ' (HSTCONTRIBASS.VALORESPERADO <> HSTCONTRIBASS.VALORRECEBIDO) AND '+
               //' CONTRIBASS = ''C'' AND '+
               ' (HSTCONTRIBASS.IDCONTASS = CONTRIBASS.IDCONTASS) AND '+
                ' (HSTCONTRIBASS.SITRECEBIMENTO NOT IN (0,1)) AND ';

       if Trim(dblkpcmbPatro.Text) <> ''
       then sSQL := sSQL + ' (ELEGPATRO.IDPESSJUR = '+qryPatro.FieldByName('IdPessoa').AsString+') AND ';
       if Trim(dblkpcmbPlano.Text) <> ''
       then sSQL := sSQL +'  (PARTASS.IDPLANOPREV = '+qryPlano.FieldByName('IdPlanoPrev').AsString+') AND ';
       if Trim(cmbfilial.Text) <> ''
       then sSQL := sSQL + ' (ELEGPATRO.IDESTAB = '+qryfilial.FieldByName('IdPessoa').AsString+') AND ';
       if Trim(cmbplanass.Text) <> ''
       then sSQL := sSQL +'  (PARTASS.IDPLANASS = '+qryPlanass.FieldByName('IdPlanass').AsString+') AND ';

       if sMesReferencia <> ''
       then sSQL := sSQL +'  (HSTCONTRIBASS.MES = '''+sMesReferencia+''') AND ';
       if sMesCobranca <> ''
       then sSQL := sSQL +'  (HSTCONTRIBASS.MESCOBRANCA = '''+sMesCobranca+''') AND ';

       //  Fim das condições por Seleção
       if sSQL <>  ''
       then sSQL := Copy(sSQL, 1, Length(sSQL)-5);

       sSQL := sSQL+' GROUP BY PLANASS.NOME ';
       sYValues        := 'NUMPESSOAS';
       sXLabelsSource  := 'PLANO';
       sXValues        := 'NUMPESSOAS';
    end // ItemIndex = 2
    else begin // ItemIndex = 3
       sSQL := 'SELECT count(HSTCONTRIBASS.IDDEPENDENTE||HSTCONTRIBASS.IDTITULAR) NUMPESSOAS ,'+
               ' PATRO.NOME PATROCINADORA '+
               ' FROM  HSTCONTRIBASS,ELEGPATRO,CONTRIBUICAO,CONTRIBASS,PESSOA PATRO '+
               ' WHERE '+
               ' (HSTCONTRIBASS.IDPESSJUR = ELEGPATRO.IDPESSJUR) AND '+
               ' (HSTCONTRIBASS.IDTITULAR = ELEGPATRO.IDPESSOA) AND '+
               ' (HSTCONTRIBASS.IDCONTASS = CONTRIBUICAO.IDCONTRIBUICAO) AND '+
               ' (HSTCONTRIBASS.VALORESPERADO <> HSTCONTRIBASS.VALORRECEBIDO) AND '+
               //' CONTRIBASS.PAGADOR = ''C'' AND '+
               ' (HSTCONTRIBASS.IDCONTASS = CONTRIBASS.IDCONTASS)  AND '+
               ' (PATRO.IDPESSOA = ELEGPATRO.IDPESSJUR) AND '+
                ' (HSTCONTRIBASS.SITRECEBIMENTO NOT IN (0,1)) AND ';

       if Trim(dblkpcmbPatro.Text) <> ''
       then sSQL := sSQL + ' (ELEGPATRO.IDPESSJUR = '+qryPatro.FieldByName('IdPessoa').AsString+') AND ';
       if Trim(dblkpcmbPlano.Text) <> ''
       then sSQL := sSQL +'  (PARTASS.IDPLANOPREV = '+qryPlano.FieldByName('IdPlanoPrev').AsString+') AND ';
       if Trim(cmbfilial.Text) <> ''
       then sSQL := sSQL + ' (ELEGPATRO.IDESTAB = '+qryfilial.FieldByName('IdPessoa').AsString+') AND ';
       if Trim(cmbplanass.Text) <> ''
       then sSQL := sSQL +'  (PARTASS.IDPLANASS = '+qryPlanass.FieldByName('IdPlanass').AsString+') AND ';

       if sMesReferencia <> ''
       then sSQL := sSQL +'  (HSTCONTRIBASS.MES = '''+sMesReferencia+''') AND ';
       if sMesCobranca <> ''
       then sSQL := sSQL +'  (HSTCONTRIBASS.MESCOBRANCA = '''+sMesCobranca+''') AND ';

       //  Fim das condições por Seleção
       if sSQL <>  ''
       then sSQL := Copy(sSQL, 1, Length(sSQL)-5);

       sSQL := sSQL+' GROUP BY PATRO.NOME ';
       sYValues        := 'NUMPESSOAS';
       sXLabelsSource  := 'PATROCINADORA';
       sXValues        := 'NUMPESSOAS';
    end;

    qrygrafico.close;
    qrygrafico.sql.clear;
    qrygrafico.sql.add(sSQL);
    try
         qrygrafico.Open;
    except
       on E:EDBEngineError do
       begin
          RAISE;
          Exit;
       end;//on
    end;//try

    // Preencher campos que definem grafico
    if series1.active = true
    then begin
       Series1.DataSource:= qrygrafico;         { <-- the Table component }
       Series1.YValues.ValueSource:= sYValues;  { <-- the Field for Bar Values }
       Series1.XLabelsSource:= sXLabelsSource;  { <-- the Field for Bar Labels }
    end;

    if series2.active = true
    then begin
       Series2.DataSource:= qrygrafico;
       Series2.YValues.ValueSource:= sYValues;
       Series2.XLabelsSource:= sXLabelsSource;
       Series2.XValues.ValueSource := sXValues;
    end;

    if series3.active = true
    then begin
       Series3.DataSource:= qrygrafico;
       Series3.YValues.ValueSource:= sYValues;
       Series3.XLabelsSource:= sXLabelsSource;
       Series3.XValues.ValueSource := sXValues;
    end;
    Result := True;
end; // preparaQryGrafico

procedure TfrmConsEstatDivergContrib.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  action := cafree;
end;

procedure TfrmConsEstatDivergContrib.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.DataSource:= qrygrafico;
  Series1.YValues.ValueSource:='';
  Series1.XLabelsSource:='';
end;

procedure TfrmConsEstatDivergContrib.zeravalores;
begin
   Series1.DataSource:= qrygrafico;
   Series2.DataSource:= qrygrafico;
   Series1.YValues.ValueSource:='';
   Series1.XLabelsSource:='';
   Series2.XValues.ValueSource := '';
   Series2.YValues.ValueSource:='';
   Series2.XLabelsSource:='';
   Series3.DataSource:= qrygrafico;
   Series3.XValues.ValueSource := '';
   Series3.YValues.ValueSource:='';
   Series3.XLabelsSource:='';
end;

procedure TfrmConsEstatDivergContrib.atualizagrafico;
begin
  pnlcoment.caption := 'Estatística de Participantes com Divergência de Contribuição';
  zeravalores;

  // Preencher variaveis de Mes de Referencia e Mes de Cobranca
  sMesReferencia := Trim(spedAnoRef.Text)+'/';
  if cmbMesRef.ItemIndex <= 8
  then sMesReferencia := sMesReferencia+'0'+IntToStr(cmbMesRef.ItemIndex+1)
  else sMesReferencia := sMesReferencia+IntToStr(cmbMesRef.ItemIndex+1);

  sMesCobranca := Trim(spedAnoCob.Text)+'/';
  if cmbMesCob.ItemIndex <= 8
  then sMesCobranca := sMesCobranca+'0'+IntToStr(cmbMesCob.ItemIndex+1)
  else sMesCobranca := sMesCobranca+IntToStr(cmbMesCob.ItemIndex+1);

  if not PreparaQryGrafico then Exit;
end;

procedure TfrmConsEstatDivergContrib.RotClick(Sender: TObject);
begin
  inherited;
  if  rot.caption = 'Rotação' Then
  begin
    Timer1.Enabled:=False;
    Timer1.Enabled:=True;
    TeeEraseBack:=False;
    Series1.Rotate(5);
    //Series1.FillSampleValues(5);
    rot.caption := 'Parar';
  end;

  if  rot.caption = 'Parar' Then
  begin
    Timer1.Enabled:=False;
    rot.caption := 'Rotação';
  end;
end;

procedure TfrmConsEstatDivergContrib.BitBtn4Click(Sender: TObject);
begin
  inherited;
//DBChart1.ChartPrintRect;
end;

procedure TfrmConsEstatDivergContrib.pgctrlEstatChange(Sender: TObject);
begin
  inherited;

  if rdgrgraf.itemindex = 0
  then begin
    rot.enabled := true;
  end
  else begin
    rot.enabled := false;
  end;

  if pgctrlEstat.activepage = tbsGrafico
  then begin
    bbtnConfirmar.enabled := false;
    // Preencher Opcoes
    lblPatro.Caption := dblkpcmbPatro.Text;
    if Trim(dblkpcmbPlano.Text) <> ''
    then lblPlano.Caption := dblkpcmbPlano.Text
    else lblPlano.Caption := '...';
    if Trim(cmbMesRef.Text) <> ''
    then lblMesReferencia.Caption := Trim(cmbMesRef.Text)+'/'+spedAnoRef.Text
    else lblMesReferencia.Caption := '...';
    if Trim(cmbMesCob.Text) <> ''
    then lblMesCobranca.Caption := Trim(cmbMesCob.Text)+'/'+spedAnoCob.Text
    else lblMesCobranca.Caption := '...';
    if Trim(dblkpcmbContribuicao.Text) <> ''
    then lblContribuicao.Caption := dblkpcmbContribuicao.Text
    else lblContribuicao.Caption := '...';
  end
  else begin
    bbtnConfirmar.enabled := true;
  end;
end;

procedure TfrmConsEstatDivergContrib.bbtnSairClick(Sender: TObject);
begin
  inherited;
close;
end;

procedure TfrmConsEstatDivergContrib.bbtnConfirmarClick(Sender: TObject);
begin
//  inherited;

   case rdgrgraf.itemindex of
      0 :
         begin
         series1.ShowInLegend := true;
         series1.active := true;
         rot.enabled := true;
         series2.active := false;
         series3.active := false;
         series2.ShowInLegend := false ;
         series3.ShowInLegend := false ;
         end;
      1 :
         begin
         series1.active := false;
         series2.active := true;
         series3.active := false;
         series2.ShowInLegend := false ;
         series1.ShowInLegend := true ;
         series3.ShowInLegend := false ;
         end;
      2 :
         begin
         series1.ShowInLegend := true;
         series1.active := false;
         series2.active := false;
         series3.active := true;
         series1.ShowInLegend := false ;
         series2.ShowInLegend := false ;
         series3.ShowInLegend := false ;

         end;
   end;

   case rdgrpmodo.itemindex of

        0 :
           begin
                series1.Marks.Style := smsLabelValue;
                series2.Marks.Style := smsLabelValue;
                series3.Marks.Style := smsLabelValue;
                {with series1, series2, series3 do
                begin
                   Marks.Style := smsLabelValue;
                end;}
           end;
        1 :
           begin
                series1.Marks.Style := smsLabelPercentTotal;
                series2.Marks.Style := smsLabelPercentTotal;
                series3.Marks.Style := smsLabelPercentTotal;
                {with series1, series2, series3 do
                begin
                   Marks.Style := smsLabelPercentTotal;
                end;}
           end;
        2 :
           begin
                series1.Marks.Style := smsLabel;
                series2.Marks.Style := smsLabel;
                series3.Marks.Style := smsLabel;
                {with series1, series2, series3 do
                begin
                   Marks.Style := smsLabel;
                end; }
           end;
        3 :
           begin
                series1.Marks.Style := smsLabelPercent;
                series2.Marks.Style := smsLabelPercent;
                series3.Marks.Style := smsLabelPercent;
                {with series1, series2, series3 do
                begin
                   Marks.Style := smsLabelPercent;
                end;}
           end;
        4 :
           begin
                series1.Marks.Style := smsLegend;
                series2.Marks.Style := smsLegend;
                series3.Marks.Style := smsLegend;
                {with series1, series2, series3 do
                begin
                   Marks.Style := smsLegend;
                end;}
           end;
        5 :
           begin
                series1.Marks.Style := smsPercent;
                series2.Marks.Style := smsPercent;
                series3.Marks.Style := smsPercent;
                {with series1, series2, series3 do
                begin
                   Marks.Style := smsPercent;
                end;}
           end;
        6 :
           begin
                series1.Marks.Style := smsPercentTotal;
                series2.Marks.Style := smsPercentTotal;
                series3.Marks.Style := smsPercentTotal;
                {with series1, series2, series3 do
                begin
                   Marks.Style := smsPercentTotal;
                end;}
           end;
        7 :
           begin
                series1.Marks.Style := smsValue;
                series2.Marks.Style := smsValue;
                series3.Marks.Style := smsValue;
               {with series1, series2, series3 do
                begin
                   Marks.Style := smsValue;
                end;}
           end;
        8 :
           begin
                series1.Marks.Style := smsXValue;
                series2.Marks.Style := smsXValue;
                series3.Marks.Style := smsXValue;
                {with series1, series2, series3 do
                begin
                   Marks.Style := smsXValue;
                end;}
           end;
   end;

   atualizagrafico;

    // Preencher Opcoes
    lblPatro.Caption := dblkpcmbPatro.Text;
    if Trim(dblkpcmbPlano.Text) <> ''
    then lblPlano.Caption := dblkpcmbPlano.Text
    else lblPlano.Caption := '...';
    if Trim(cmbMesRef.Text) <> ''
    then lblMesReferencia.Caption := Trim(cmbMesRef.Text)+'/'+spedAnoRef.Text
    else lblMesReferencia.Caption := '...';
    if Trim(cmbMesCob.Text) <> ''
    then lblMesCobranca.Caption := Trim(cmbMesCob.Text)+'/'+spedAnoCob.Text
    else lblMesCobranca.Caption := '...';
    if Trim(dblkpcmbContribuicao.Text) <> ''
    then lblContribuicao.Caption := dblkpcmbContribuicao.Text
    else lblContribuicao.Caption := '...';
   
   DBChart1.RefreshData;
   pgctrlEstat.activepage := tbsGrafico;
   bbtnConfirmar.enabled := false;
end;

procedure TfrmConsEstatDivergContrib.bbtnCancelarClick(Sender: TObject);
begin
  //  inherited;
  dbChart1.Print;
end;

procedure TfrmConsEstatDivergContrib.dblkpcmbPatroEnter(Sender: TObject);
begin
  inherited;
  if not qrypatro.active then qrypatro.open;
end;

procedure TfrmConsEstatDivergContrib.dblkpcmbPlanoEnter(Sender: TObject);
begin
  inherited;
  if not qryplano.active then qryplano.open;
end;

procedure TfrmConsEstatDivergContrib.FormShow(Sender: TObject);
begin
  inherited;
  DecodeDate(date, AYear, AMonth, ADay);
  if (AMonth >= 1) and (AMonth <= 12)
  then begin
     cmbMesRef.ItemIndex := AMonth - 1;
     cmbMesRef.Text := cmbMesRef.Items[cmbMesRef.ItemIndex];
     cmbMesCob.ItemIndex := AMonth - 1;
     cmbMesCob.Text := cmbMesCob.Items[cmbMesCob.ItemIndex];
     spedAnoRef.Text := IntToStr(AYear);
     spedAnoCob.Text := IntToStr(AYear);
  end;
  grpContrib.Enabled := True;
  rgrpOpcoes.ItemIndex := 0;
end;

procedure TfrmConsEstatDivergContrib.FormActivate(Sender: TObject);
begin
  inherited;
  qryPatro.Close; qryPatro.Open;
  qryPlano.Close; qryPlano.Open;
  qryContribuicao.Close; qryContribuicao.Open;
end;

procedure TfrmConsEstatDivergContrib.rgrpOpcoesClick(Sender: TObject);
begin
  inherited;
  if rgrpOpcoes.ItemIndex = 4
  then begin
     ShowMessage('Estatística não disponível');
     rgrpOpcoes.ItemIndex := 0;
     Exit;
  end;
  grpContrib.Enabled := (rgrpOpcoes.ItemIndex = 1) or (rgrpOpcoes.ItemIndex = 2);
  grpMeses.Enabled := (rgrpOpcoes.ItemIndex <> 1);
  dblkpcmbPlano.Enabled := (rgrpOpcoes.ItemIndex <> 2);
  dblkpcmbPatro.Enabled := (rgrpOpcoes.ItemIndex <> 3);
  cmbPlanass.Enabled := (rgrpOpcoes.ItemIndex <> 2);

  if not grpContrib.Enabled then dblkpcmbContribuicao.Text := '';

  if not grpMeses.Enabled
  then begin
     cmbMesRef.Text := '';
     cmbMesCob.Text := '';
     spedAnoRef.Text := '';
     spedAnoCob.Text := '';
  end
  else begin
     // Preencher mes e ano atual
     if (AMonth >= 1) and (AMonth <= 12)
     then begin
        cmbMesRef.ItemIndex := AMonth - 1;
        cmbMesRef.Text := cmbMesRef.Items[cmbMesRef.ItemIndex];
        cmbMesCob.ItemIndex := AMonth - 1;
        cmbMesCob.Text := cmbMesCob.Items[cmbMesCob.ItemIndex];
        spedAnoRef.Text := IntToStr(AYear);
        spedAnoCob.Text := IntToStr(AYear);
     end;
  end;// else - if grpMeses.Enabled

  if not dblkpcmbPlano.Enabled then dblkpcmbPlano.Text := '';
  if not dblkpcmbPatro.Enabled then dblkpcmbPatro.Text := '';
  if not cmbPlanass.Enabled then dblkpcmbPlano.Text := '';
end;

procedure TfrmConsEstatDivergContrib.cmbplanassEnter(Sender: TObject);
begin
  If not qryplanass.active then qryplanass.open;
end;

procedure TfrmConsEstatDivergContrib.cmbfilialEnter(Sender: TObject);
begin
  inherited;
  If not qryfilial.active then qryfilial.open;
end;

end.
