Unit FConsEstatMassa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, TeeProcs, TeEngine,
  Chart, DBChart, wwdblook, TEdNum, DBCtrls, Series, TeeFunci, Db,
  Wwdatsrc, DBTables, Wwquery, ComCtrls, Menus, FOkCancelar, TB97, TB97Tlbr,
  IvDictio, IvMulti, IvEMulti;

type
  TfrmConsEstatMassa = class(TfrmOkCancelar)
    Label5: TLabel;
    qrypatro: TwwQuery;
    dspatro: TwwDataSource;
    qryplanass: TwwQuery;
    dsplanass: TwwDataSource;
    qryplano: TwwQuery;
    dsplano: TwwDataSource;
    qryGrafico: TwwQuery;
    dsGrafico: TwwDataSource;
    Timer1: TTimer;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBChart1: TDBChart;
    rot: TBitBtn;
    GroupBox1: TGroupBox;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    wwDBLookupCombo1: TwwDBLookupCombo;
    wwDBLookupCombo2: TwwDBLookupCombo;
    wwDBLookupCombo3: TwwDBLookupCombo;
    GroupBox4: TGroupBox;
    Label10: TLabel;
    Label9: TLabel;
    Label4: TLabel;
    EditNum1: TEditNum;
    EditNum2: TEditNum;
    EditNum3: TEditNum;
    EditNum4: TEditNum;
    EditNum5: TEditNum;
    EditNum6: TEditNum;
    RadioGroup2: TRadioGroup;
    rdgrpmodo: TRadioGroup;
    Series1: TPieSeries;
    Series2: TBarSeries;
    rdgrgraf: TRadioGroup;
    Series3: TAreaSeries;
    Panel1: TPanel;
    pnlcoment: TPanel;
    cmbfilial: TwwDBLookupCombo;
    Label29: TLabel;
    qryfilial: TwwQuery;
    procedure atualizagrafico;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure RotClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure zeravalores;
    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure wwDBLookupCombo1Enter(Sender: TObject);
    procedure wwDBLookupCombo2Enter(Sender: TObject);
    procedure wwDBLookupCombo3Enter(Sender: TObject);
    procedure cmbfilialEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsEstatMassa: TfrmConsEstatMassa;

implementation

{$R *.DFM}

procedure TfrmConsEstatMassa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  action := cafree;
end;

//cálculo estatístico , para formar tabelas
{Procedure Calculo(ValorMax,ValorMin : Real; n : Integer);
type
 Linha = record
   Faixa: String;
   Frequencia : Real;
   ValorObs : Real;
 end;
var
    At,K,H : Real;
    Tabela : Array[1..20] of linha ;
begin

   At := ValorMax - ValorMin;

   k := 1 + Ln(n).3,3

   H := At/K ;

   ValorObs := ValorMin;
   for i := 1 to h do
   begin
      ValorObs := ValorObs + h ;
      Tabela[i].Faixa := '';
   end;
end;}

procedure TfrmConsEstatMassa.FormCreate(Sender: TObject);
begin
  inherited;

  {cbar := TCoolBar.Create(Self);
  with cbar do begin
   FixedOrder := True;
   AutoSize := True;
   Parent   := Self;
   Bitmap.LoadFromResourceName(HInstance, 'FUNDO');
   Panel2.Parent := cbar;
  end;}

  {qrypatro.open;
  qryplano.open;
  qryplanass.open;}
  RadioGroup2.itemindex := -1;

  Series1.DataSource:= qrygrafico;
  Series1.YValues.ValueSource:='';
  Series1.XLabelsSource:='';

  EditNum4.enabled :=  false;
  EditNum5.enabled :=  false;
  EditNum3.enabled := false;
  EditNum6.enabled := false;
  EditNum1.enabled := false;
  EditNum2.enabled := false;
  EditNum4.color :=  clInactiveCaption;
  EditNum5.color :=  clInactiveCaption;
  EditNum3.color := clInactiveCaption;
  EditNum6.color :=  clInactiveCaption;
  EditNum1.color := clInactiveCaption;
  EditNum2.color := clInactiveCaption;
end;

procedure TfrmConsEstatMassa.zeravalores;
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

procedure TfrmConsEstatMassa.atualizagrafico;
Var ssql1 : string;
begin
  Case RadioGroup2.itemindex of
    0: begin
         pnlcoment.caption := 'Estatística por Faixa Etária ';
         zeravalores;
         EditNum4.enabled :=  true;
         EditNum5.enabled :=  true;
         EditNum3.enabled := false;
         EditNum6.enabled := false;
         EditNum1.enabled := false;
         EditNum2.enabled := false;
         EditNum3.color := clInactiveCaption;
         EditNum6.color := clInactiveCaption;
         EditNum1.color := clInactiveCaption;
         EditNum2.color := clInactiveCaption;
         EditNum4.color := clWindow;
         EditNum5.color := clWindow;

         EditNum4.setfocus;

         SSQL1 :=  ' (PA.IDPESSJUR = PESSOA.IDPESSOA) AND '+
                   ' (P.TIPO = ''F'') AND '+
                   ' (PF.IDPESSOA = PESSOA.IDPESSOA) AND '+
                   ' (EL.IDPESSOA = PF.IDPESSOA) AND '+
                   ' (EL.IDPESSJUR = PA.IDPESSJUR) AND '+
                   ''+SSQL1+'';

         If wwDBLookupCombo1.text <> '' then
         begin
           ssql1 := ssql1 + ' (pa.idpessjur = '+qrypatro.fieldbyname('idpessoa').AsString+')  AND ';
         end;

         If wwDBLookupCombo2.text <> '' then
         begin
           ssql1 := ssql1 + ' (pa.idplanoprev = '+qryplano.fieldbyname('idplanoprev').AsString+')  AND ';
         end;

         If wwDBLookupCombo3.text <> '' then
         begin
           ssql1 := ssql1 + ' (pa.idplanass = '+qryplanass.fieldbyname('idplanass').AsString+')  AND ';
         end;

         If cmbfilial.text <> '' then
         begin
           ssql1 := ssql1 + ' (el.idestab = '+qryfilial.fieldbyname('idpessoa').AsString+')  AND ';
         end;

         If EditNum4.text <> '' then
         begin
           ssql1 := ssql1 + ' (TRUNC(MONTHS_BETWEEN(TO_DATE('''+datetostr(date)+''',''DD/MM/YYYY''),PF.DATANASC)/12,0) > '+EditNum4.text+')  AND ';
         end;

         If EditNum5.text <> '' then
         begin
           ssql1 := ssql1 +' (TRUNC(MONTHS_BETWEEN(TO_DATE('''+datetostr(date)+''',''DD/MM/YYYY''),PF.DATANASC)/12,0) < '+EditNum5.text+')  AND ';
         end;

         If (EditNum5.text = '') and (EditNum4.text = '') then
         begin
           ssql1 := ssql1 +' (TRUNC(MONTHS_BETWEEN(TO_DATE('''+DATETOSTR(DATE)+''',''DD/MM/YYYY''),PF.DATANASC)/12,0) >0) AND ';
         end;

         If sSQL1 <> '' then sSQL1 := Copy(sSQL1, 1, Length(sSQL1)-5);

         qrygrafico.close;
         qrygrafico.sql.clear;
         qrygrafico.sql.add(' SELECT COUNT(P.IDPESSOA), TRUNC(MONTHS_BETWEEN(TO_DATE('''+DATETOSTR(DATE)+''',''DD/MM/YYYY''),PF.DATANASC)/12,0) IDADE '+
                            ' FROM PESSOA , PARTASS PA ,PESSOA P, PESSOAFISICA PF, ELEGPATRO EL '+
                            ' WHERE '+
                            ''+SSQL1+''+
                            '  GROUP BY TRUNC(MONTHS_BETWEEN(TO_DATE('''+datetostr(date)+''',''DD/MM/YYYY''),PF.DATANASC)/12,0)');

         try
           qrygrafico.Open;
         except
            on E:EDBEngineError do
            begin
              RAISE;
             end;
         end;

         If series1.active = true then
         begin
           Series1.DataSource:= qrygrafico;             { <-- the Table component }
           Series1.YValues.ValueSource:='count(p.idpessoa)';  { <-- the Field for Bar Values }
           Series1.XLabelsSource:='idade';          { <-- the Field for Bar Labels }
         end;

         If series2.active = true then
         begin
           Series2.DataSource:= qrygrafico;
           Series2.YValues.ValueSource:='count(p.idpessoa)';
           Series2.XLabelsSource:='idade';
           Series2.XValues.ValueSource :='count(p.idpessoa)'
         end;

         If series3.active = true then
         begin
           Series3.DataSource:= qrygrafico;
           Series3.YValues.ValueSource:='count(p.idpessoa)';
           Series3.XLabelsSource:='idade';
           Series3.XValues.ValueSource :='count(p.idpessoa)'
         end;
       end;

    1: begin
         pnlcoment.caption := 'Estatística por Tempo de Adesão ';
         zeravalores;
         EditNum4.enabled :=  false;
         EditNum5.enabled :=  false;
         EditNum3.enabled := true;
         EditNum6.enabled := true;
         EditNum1.enabled := false;
         EditNum2.enabled := false;
         EditNum4.color :=  clInactiveCaption;
         EditNum5.color :=  clInactiveCaption;
         EditNum1.color := clInactiveCaption;
         EditNum2.color := clInactiveCaption;
         EditNum3.color := clWindow;
         EditNum6.color := clWindow;

         EditNum3.setfocus;

         SSQL1:= ' (PA.IDPLANASS = PLANASS.IDPLANASS) AND '+
                 ' (PA.IDPESSJUR = EL.IDPESSJUR) AND '+
                 ' (PA.IDPESSOA = EL.IDPESSOA) AND ';

         If EditNum3.text <> '' then
         begin
           ssql1 := ssql1 +' (TRUNC(MONTHS_BETWEEN(TO_DATE('''+DATETOSTR(DATE)+''',''DD/MM/YYYY''),PA.DATAENTRADA),0)> '+EditNum3.text+')  AND ';
         end;

         If EditNum6.text <> '' then
         begin
           ssql1 := ssql1 +' (TRUNC(MONTHS_BETWEEN(TO_DATE('''+DATETOSTR(DATE)+''',''DD/MM/YYYY''),PA.DATAENTRADA),0) < '+EditNum6.text+')  AND ';
         end;

         If wwDBLookupCombo1.text <> '' then
         begin
           ssql1 := ssql1 + ' (PA.IDPESSJUR = '+qrypatro.fieldbyname('idpessoa').AsString+')  AND ';
         end;

         If wwDBLookupCombo2.text <> '' then
         begin
           ssql1 := ssql1 + ' (PA.IDPLANOPREV = '+qryplano.fieldbyname('idplanoprev').AsString+')  AND ';
         end;

         If cmbfilial.text <> '' then
         begin
           ssql1 := ssql1 + ' (EL.IDESTAB = '+qryfilial.fieldbyname('idpessoa').AsString+')  AND ';
         end;

         If wwDBLookupCombo3.text <> '' then
         begin
           ssql1 := ssql1 + ' (PA.IDPLANASS = '+qryplanass.fieldbyname('idplanass').AsString+')  AND ';
         end;

         If sSQL1 <> '' then sSQL1 := Copy(sSQL1, 1, Length(sSQL1)-5);

         qrygrafico.close;
         qrygrafico.sql.clear;
         qrygrafico.sql.add('SELECT  COUNT(PA.IDPESSOA), TRUNC(MONTHS_BETWEEN(TO_DATE('''+DATETOSTR(DATE)+''',''DD/MM/YYYY''),PA.DATAENTRADA),0) TEMPO '+
                            ' ,PLANASS.NOME '+
                            ' FROM PLANASS , PARTASS PA , ELEGPATRO EL '+
                            ' WHERE '+
                            ''+SSQL1+' GROUP BY TRUNC(MONTHS_BETWEEN(TO_DATE('''+DATETOSTR(DATE)+''',''DD/MM/YYYY''),PA.DATAENTRADA),0) ,PLANASS.NOME ');

         try
           qrygrafico.Open;
         except
           on E:EDBEngineError do
           begin
             RAISE;
           end;
         end;

         If series1.active = true then
         begin
           Series1.DataSource:= qrygrafico;             { <-- the Table component }
           Series1.YValues.ValueSource:='COUNT(PA.IDPESSOA)';  { <-- the Field for Bar Values }
           Series1.XLabelsSource:='TEMPO';
         end;

         If series2.active = true then
         begin
           Series2.DataSource:= qrygrafico;
           Series2.YValues.ValueSource:='COUNT(PA.IDPESSOA)';
           Series2.XLabelsSource:='TEMPO';
           Series2.XValues.ValueSource :='COUNT(PA.IDPESSOA)'
         end;

         If series3.active = true then
         begin
           Series3.DataSource:= qrygrafico;
           Series3.YValues.ValueSource:='COUNT(PA.IDPESSOA)';
           Series3.XLabelsSource:='TEMPO';
           Series3.XValues.ValueSource :='COUNT(PA.IDPESSOA)'
         end;
       end;

    2: begin
         pnlcoment.caption := 'Estatística por Faixa Salárial ';
         zeravalores;
         EditNum4.enabled :=  false;
         EditNum5.enabled :=  false;
         EditNum3.enabled := false;
         EditNum6.enabled := false;
         EditNum1.enabled := true;
         EditNum2.enabled := true;
         EditNum4.color :=  clInactiveCaption;
         EditNum5.color :=  clInactiveCaption;
         EditNum3.color := clInactiveCaption;
         EditNum6.color := clInactiveCaption;
         EditNum1.color := clWindow;
         EditNum2.color := clWindow;

         EditNum1.setfocus;

         SSQL1:= ' (PA.IDPESSOA = EL.IDPESSOA) AND '+
                 ' (EL.IDPESSJUR = PA.IDPESSJUR) AND ';

         If EditNum1.text <> '' then
         begin
           ssql1 := ssql1 + ' (EL.SALTOTAL > '+EditNum1.text+')  AND ';
         end;

         If EditNum2.text <> '' then
         begin
           ssql1 := ssql1 + ' (EL.SALTOTAL < '+EditNum2.text+')  AND ';
         end;

         If wwDBLookupCombo1.text <> '' then
         begin
           ssql1 := ssql1 + ' (PA.IDPESSJUR = '+qrypatro.fieldbyname('idpessoa').AsString+')  AND ';
         end;

         If cmbfilial.text <> '' then
         begin
           ssql1 := ssql1 + ' (EL.IDESTAB = '+qryfilial.fieldbyname('idpessoa').AsString+')  AND ';
         end;

         If wwDBLookupCombo2.text <> '' then
         begin
           ssql1 := ssql1 + ' (PA.IDPLANOPREV = '+qryplano.fieldbyname('idplanoprev').AsString+')  AND ';
         end;

         If wwDBLookupCombo3.text <> '' then
         begin
           ssql1 := ssql1 + ' (PA.IDPLANASS = '+qryplanass.fieldbyname('idplanass').AsString+')  AND ';
         end;

         If sSQL1 <> '' then sSQL1 := Copy(sSQL1, 1, Length(sSQL1)-5);

         qrygrafico.close;
         qrygrafico.sql.clear;
         qrygrafico.sql.add('SELECT COUNT(PA.IDPESSOA) , EL.SALTOTAL '+
                            ' FROM PARTASS PA , ELEGPATRO EL '+
                            ' WHERE '+
                            ''+SSQL1+'  GROUP BY EL.SALTOTAL' );

         try
           qrygrafico.Open;
         except
           on E:EDBEngineError do
           begin
             RAISE;
           end;
          end;

         If series1.active = true then
         begin
           Series1.DataSource:= qrygrafico;             { <-- the Table component }
           Series1.YValues.ValueSource:='count(pa.idpessoa)';  { <-- the Field for Bar Values }
           Series1.XLabelsSource:='saltotal';           { <-- the Field for Bar Labels }
         end;

         If series2.active = true then
         begin
           Series2.DataSource:= qrygrafico;
           Series2.YValues.ValueSource:='count(pa.idpessoa)';
           Series2.XLabelsSource:='saltotal';
           Series2.XValues.ValueSource :='count(pa.idpessoa)'
         end;

         If series3.active = true then
         begin
           Series3.DataSource:= qrygrafico;
           Series3.YValues.ValueSource:='count(pa.idpessoa)';
           Series3.XLabelsSource:='saltotal';
           Series3.XValues.ValueSource :='count(pa.idpessoa)'
         end;
       end;


    3: begin
         pnlcoment.caption := 'Estatística por Sexo ';
         zeravalores;
         EditNum4.enabled :=  false;
         EditNum5.enabled :=  false;
         EditNum3.enabled := false;
         EditNum6.enabled := false;
         EditNum1.enabled := false;
         EditNum2.enabled := false;
         EditNum4.color :=  clInactiveCaption;
         EditNum5.color :=  clInactiveCaption;
         EditNum3.color := clInactiveCaption;
         EditNum6.color :=  clInactiveCaption;
         EditNum1.color := clInactiveCaption;
         EditNum2.color := clInactiveCaption;

         sSQL1 :=  ' AND ';

         if wwDBLookupCombo1.text <> '' then
         begin
           ssql1 := ssql1 + ' (PARTASS.IDPESSJUR = '+qrypatro.fieldbyname('idpessoa').AsString+')  AND ';
         end;

         if wwDBLookupCombo2.text <> '' then
         begin
           ssql1 := ssql1 + ' (PARTASS.IDPLANOPREV = '+qryplano.fieldbyname('idplanoprev').AsString+')  AND ';
         end;

         if cmbfilial.text <> '' then
         begin
           ssql1 := ssql1 + ' (EL.IDESTAB = '+qryfilial.fieldbyname('idpessoa').AsString+')  AND ';
         end;

         if wwDBLookupCombo3.text <> '' then
         begin
           ssql1 := ssql1 + ' partass.idplanass = '+qryplanass.fieldbyname('idplanass').AsString+'  AND ';
         end;

         if sSQL1 <> '' then sSQL1 := Copy(sSQL1, 1, Length(sSQL1)-5);

         qrygrafico.close;
         qrygrafico.sql.clear;
         qrygrafico.sql.add(' SELECT COUNT(DISTINCT(P.IDPESSOA)) , PF.SEXO '+
                            ' FROM PESSOA P , PARTASS , PESSOAFISICA PF, ELEGPATRO EL' +
                            ' WHERE PF.SEXO = ''M'' '+SSQL1+''+
                            ' AND PF.IDPESSOA = P.IDPESSOA '+
                            ' AND PF.IDPESSOA = EL.IDPESSOA '+
                            ' AND EL.IDPESSJUR = PARTASS.IDPESSJUR '+
                            ' AND EL.IDPESSOA = PARTASS.IDPESSOA '+
                            ' AND PF.IDPESSOA = PARTASS.IDPESSOA '+
                            ' GROUP BY PF.SEXO '+
                            ' UNION '+
                            ' SELECT COUNT(DISTINCT(PP.IDPESSOA)), PF.SEXO '+
                            ' FROM PESSOA PP, PARTASS , PESSOAFISICA PF'+
                            ' WHERE PF.SEXO = ''F'' '+SSQL1+''+
                            ' AND PF.IDPESSOA = PP.IDPESSOA '+
                            ' AND PF.IDPESSOA = PARTASS.IDPESSOA '+
                            ' GROUP  BY PF.SEXO ');

         try
           qrygrafico.Open;
         except
           on E:EDBEngineError do
           begin
             RAISE;
           end;
         end;

         if series1.active = true then
         begin
           Series1.DataSource:= qrygrafico;             { <-- the Table component }
           Series1.YValues.ValueSource:='COUNT(DISTINCT(P.IDPESSOA))';  { <-- the Field for Bar Values }
           Series1.XLabelsSource:='SEXO';          { <-- the Field for Bar Labels }
         end;

         if series2.active = true then
         begin
           Series2.DataSource:= qrygrafico;
           Series2.YValues.ValueSource:='COUNT(DISTINCT(P.IDPESSOA))';
           Series2.XLabelsSource:='SEXO';
           Series2.XValues.ValueSource :='COUNT(DISTINCT(P.IDPESSOA))'
         end;

         if series3.active = true then
         begin
           Series3.DataSource:= qrygrafico;
           Series3.YValues.ValueSource:='COUNT(DISTINCT(P.IDPESSOA))';
           Series3.XLabelsSource:='SEXO';
           Series3.XValues.ValueSource :='COUNT(DISTINCT(P.IDPESSOA))'
         end;
       end;

    4: begin
         pnlcoment.caption := 'Estatística de Elegíveis por Localidade';

         zeravalores;

         EditNum4.enabled :=  false;
         EditNum5.enabled :=  false;
         EditNum3.enabled := false;
         EditNum6.enabled := false;
         EditNum1.enabled := false;
         EditNum2.enabled := false;
         EditNum4.color :=  clInactiveCaption;
         EditNum5.color :=  clInactiveCaption;
         EditNum3.color := clInactiveCaption;
         EditNum6.color :=  clInactiveCaption;
         EditNum1.color := clInactiveCaption;
         EditNum2.color := clInactiveCaption;



         sSQL1 :=  ' EL.IDPESSOA = EN.IDPESSOA AND '+
                   ' EL.IDPESSJUR = PLANPREVASS.IDPESSJUR AND '+
                   ' PLANPREVASS.IDPLANOPREV = PLANPREV.IDPLANOPREV AND '+
                   ' PA.IDPESSOA = EL.IDPESSOA AND '+
                   ' PA.IDPLANASS = PLANPREVASS.IDPLANASS AND '+
                   ' PA.IDPLANOPREV = PLANPREVASS.IDPLANOPREV AND '+
                   ' PA.IDPESSJUR = PLANPREVASS.IDPESSJUR AND ';

         if wwDBLookupCombo1.text <> '' then
         begin
           ssql1 := ssql1 + ' planprevass.idpessjur = '+qrypatro.fieldbyname('idpessoa').AsString+'  AND ';
         end;

         if wwDBLookupCombo2.text <> '' then
         begin
           ssql1 := ssql1 + ' planprevass.idplanoprev = '+qryplano.fieldbyname('idplanoprev').AsString+'  AND ';
         end;

         if wwDBLookupCombo3.text <> '' then
         begin
           ssql1 := ssql1 + ' planprevass.idplanass = '+qryplanass.fieldbyname('idplanass').AsString+'  AND ';
         end;

         if cmbfilial.text <> '' then
         begin
           ssql1 := ssql1 + ' el.idestab = '+qryfilial.fieldbyname('idpessoa').AsString+'  AND ';
         end;

         if sSQL1 <> '' then sSQL1 := Copy(sSQL1, 1, Length(sSQL1)-5);

         qrygrafico.close;
         qrygrafico.sql.clear;
         qrygrafico.sql.add(' SELECT COUNT(DISTINCT(EL.IDPESSOA)), EN.BAIRRO '+
                            ' FROM   ELEGPATRO EL,PLANPREV ,PLANASS, PLANPREVASS,'+
                            ' ENDPESS EN , PARTASS PA '+
                            ' WHERE '+SSQL1+' GROUP BY EN.BAIRRO');

         try
           qrygrafico.Open;
         except
         on E:EDBEngineError do
         begin
            RAISE;
         end;
      end;

      if series1.active = true then
      begin
        Series1.DataSource:= qrygrafico;             { <-- the Table component }
        Series1.YValues.ValueSource:='COUNT(DISTINCT(EL.IDPESSOA))';  { <-- the Field for Bar Values }
        Series1.XLabelsSource:='BAIRRO';          { <-- the Field for Bar Labels }
      end;

      if series2.active = true then
      begin
        Series2.DataSource:= qrygrafico;
        Series2.YValues.ValueSource:='COUNT(DISTINCT(EL.IDPESSOA))';
        Series2.XLabelsSource:='BAIRRO';
        Series2.XValues.ValueSource :='COUNT(DISTINCT(EL.IDPESSOA))'
      end;

      if series3.active = true then
      begin
        Series3.DataSource:= qrygrafico;
        Series3.YValues.ValueSource:='COUNT(DISTINCT(EL.IDPESSOA))';
        Series3.XLabelsSource:='BAIRRO';
        Series3.XValues.ValueSource :='COUNT(DISTINCT(EL.IDPESSOA))'
      end;
    end;

    5: begin
         pnlcoment.caption := 'Estatística de Participantes por Plano Assistencial';

         zeravalores;

         EditNum4.enabled :=  false;
         EditNum5.enabled :=  false;
         EditNum3.enabled := false;
         EditNum6.enabled := false;
         EditNum1.enabled := false;
         EditNum2.enabled := false;
         EditNum4.color :=  clInactiveCaption;
         EditNum5.color :=  clInactiveCaption;
         EditNum3.color := clInactiveCaption;
         EditNum6.color :=  clInactiveCaption;
         EditNum1.color := clInactiveCaption;
         EditNum2.color := clInactiveCaption;

         sSQL1:= ' PT.IDPLANASS = PL.IDPLANASS AND '+
                 ' PT.IDPESSOA = P.IDPESSOA  AND '+
                 ' PT.IDPESSOA = EL.IDPESSOA AND '+
                 ' PT.IDPESSJUR = EL.IDPESSJUR AND ';

         if wwDBLookupCombo1.text <> '' then
         begin
            ssql1 := ssql1 + ' PT.idpessjur = '+qrypatro.fieldbyname('idpessoa').AsString+'  AND ';
         end;

         if cmbfilial.text <> '' then
         begin
           ssql1 := ssql1 + ' el.idestab = '+qryfilial.fieldbyname('idpessoa').AsString+'  AND ';
         end;

         if sSQL1 <> '' then sSQL1 := Copy(sSQL1, 1, Length(sSQL1)-5);

         qrygrafico.close;
         qrygrafico.sql.clear;
         qrygrafico.sql.add(' SELECT COUNT(DISTINCT(P.IDPESSOA)) , PL.NOME '+
                            ' FROM   PLANASS PL, PESSOA P, PARTASS PT, ELEGPATRO EL '+
                            ' WHERE '+SSQL1+' GROUP BY PL.NOME ');

         try
           qrygrafico.Open;
         except
           on E:EDBEngineError do
           begin
             RAISE;
           end;
         end;

         if series1.active = true then
         begin
           Series1.DataSource:= qrygrafico;             { <-- the Table component }
           Series1.YValues.ValueSource:='COUNT(DISTINCT(P.IDPESSOA))';  { <-- the Field for Bar Values }
           Series1.XLabelsSource:='NOME';          { <-- the Field for Bar Labels }
         end;

         if series2.active = true then
         begin
           Series2.DataSource:= qrygrafico;
           Series2.YValues.ValueSource:='COUNT(DISTINCT(P.IDPESSOA))';
           Series2.XLabelsSource:='NOME';
           Series2.XValues.ValueSource :='COUNT(DISTINCT(P.IDPESSOA))'
         end;

         if series3.active = true then
         begin
           Series3.DataSource:= qrygrafico;
           Series3.YValues.ValueSource:='COUNT(DISTINCT(P.IDPESSOA))';
           Series3.XLabelsSource:='NOME';
           Series3.XValues.ValueSource :='COUNT(DISTINCT(P.IDPESSOA))'
         end;
       end;

    6: begin
         pnlcoment.caption := 'Estatística de Participantes por Patrocinadora';
         zeravalores;
         EditNum4.enabled :=  false;
         EditNum5.enabled :=  false;
         EditNum3.enabled := false;
         EditNum6.enabled := false;
         EditNum1.enabled := false;
         EditNum2.enabled := false;
         EditNum4.color :=  clInactiveCaption;
         EditNum5.color :=  clInactiveCaption;
         EditNum3.color := clInactiveCaption;
         EditNum6.color :=  clInactiveCaption;
         EditNum1.color := clInactiveCaption;
         EditNum2.color := clInactiveCaption;

         sSQL1:= 'EL.IDPESSJUR = PP.IDPESSOA AND '+
                 'EL.IDPESSOA = P.IDPESSOA AND ';

         if wwDBLookupCombo1.text <> '' then
         begin
           ssql1 := ssql1 + ' EL.idpessjur = '+qrypatro.fieldbyname('idpessoa').AsString+'  AND ';
         end;

         if cmbfilial.text <> '' then
         begin
           ssql1 := ssql1 + ' el.idestab = '+qryfilial.fieldbyname('idpessoa').AsString+'  AND ';
         end;

         if sSQL1 <> '' then sSQL1 := Copy(sSQL1, 1, Length(sSQL1)-5);

         qrygrafico.close;
         qrygrafico.sql.clear;
         qrygrafico.sql.add('SELECT COUNT(DISTINCT(P.IDPESSOA)) , PP.NOME'+
                            ' FROM   PESSOA PP, PESSOA P,ELEGPATRO EL '+
                            ' WHERE  '+SSQL1+' GROUP BY PP.NOME  ');

         try
           qrygrafico.Open;
         except
         on E:EDBEngineError do
         begin
           RAISE;
         end;
       end;

       if series1.active = true then
       begin
         Series1.DataSource:= qrygrafico;             { <-- the Table component }
         Series1.YValues.ValueSource:='COUNT(DISTINCT(P.IDPESSOA))';  { <-- the Field for Bar Values }
         Series1.XLabelsSource:='NOME';          { <-- the Field for Bar Labels }
       end;

       if series2.active = true then
       begin
         Series2.DataSource:= qrygrafico;
         Series2.YValues.ValueSource:='COUNT(DISTINCT(P.IDPESSOA))';
         Series2.XLabelsSource:='NOME';
         Series2.XValues.ValueSource :='COUNT(DISTINCT(P.IDPESSOA))'
       end;

       if series3.active = true then
       begin
         Series3.DataSource:= qrygrafico;
         Series3.YValues.ValueSource:='COUNT(DISTINCT(P.IDPESSOA))';
         Series3.XLabelsSource:='NOME';
         Series3.XValues.ValueSource :='COUNT(DISTINCT(P.IDPESSOA))'
       end;
     end;
   end;
end;

procedure TfrmConsEstatMassa.RotClick(Sender: TObject);
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
  If  rot.caption = 'Parar' Then
  begin
    Timer1.Enabled:=False;
    rot.caption := 'Rotação';
  end;
end;

procedure TfrmConsEstatMassa.BitBtn4Click(Sender: TObject);
begin
  inherited;
  //DBChart1.ChartPrintRect;
end;

procedure TfrmConsEstatMassa.PageControl1Change(Sender: TObject);
begin
  inherited;
  If rdgrgraf.itemindex = 0  then rot.enabled := true
  else rot.enabled := false;

  If PageControl1.activepage = TabSheet2 then
    bbtnConfirmar.enabled := false
  else bbtnConfirmar.enabled := true;
end;

procedure TfrmConsEstatMassa.bbtnSairClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmConsEstatMassa.bbtnConfirmarClick(Sender: TObject);
begin
//  inherited;
  Case rdgrgraf.itemindex of
    0: begin
         series1.ShowInLegend := true;
         series1.active := true;
         rot.enabled := true;
         series2.active := false;
         series3.active := false;
         series2.ShowInLegend := false ;
         series3.ShowInLegend := false ;
       end;
    1: begin
         series1.active := false;
         series2.active := true;
         series3.active := false;
         series2.ShowInLegend := false ;
         series1.ShowInLegend := true ;
         series3.ShowInLegend := false ;
       end;
    2 : begin
          series1.ShowInLegend := true;
          series1.active := false;
          series2.active := false;
          series3.active := true;
          series1.ShowInLegend := false ;
          series2.ShowInLegend := false ;
          series3.ShowInLegend := false ;
       end;
  end; {Case}

  Case rdgrpmodo.itemindex of
    0: begin
         series1.Marks.Style := smsLabelValue;
         series2.Marks.Style := smsLabelValue;
         series3.Marks.Style := smsLabelValue;
         {with series1 , series2 , series3 do
         begin
           Marks.Style := smsLabelValue;
         end;}
       end;
    1: begin
         series1.Marks.Style := smsLabelPercentTotal;
         series2.Marks.Style := smsLabelPercentTotal;
         series3.Marks.Style := smsLabelPercentTotal;
         {with series1 , series2 , series3 do
         begin
           Marks.Style := smsLabelPercentTotal;
         end;}
       end;
    2: begin
         series1.Marks.Style := smsLabel;
         series2.Marks.Style := smsLabel;
         series3.Marks.Style := smsLabel;
         {with series1 , series2, series3 do
         begin
           Marks.Style := smsLabel;
         end; }
       end;
    3: begin
         series1.Marks.Style := smsLabelPercent;
         series2.Marks.Style := smsLabelPercent;
         series3.Marks.Style := smsLabelPercent;
         {with series1 , series2, series3 do
         begin
           Marks.Style := smsLabelPercent;
         end;}
       end;
    4: begin
         series1.Marks.Style := smsLegend;
         series2.Marks.Style := smsLegend;
         series3.Marks.Style := smsLegend;
         {with series1 , series2 , series3 do
         begin
           Marks.Style := smsLegend;
         end;}
       end;
    5: begin
         series1.Marks.Style := smsPercent;
         series2.Marks.Style := smsPercent;
         series3.Marks.Style := smsPercent;
         {with series1 , series2 , series3 do
         begin
           Marks.Style := smsPercent;
         end;}
       end;
    6: begin
         series1.Marks.Style := smsPercentTotal;
         series2.Marks.Style := smsPercentTotal;
         series3.Marks.Style := smsPercentTotal;
         {with series1 , series2, series3 do
         begin
           Marks.Style := smsPercentTotal;
         end;}
       end;
    7: begin
         series1.Marks.Style := smsValue;
         series2.Marks.Style := smsValue;
         series3.Marks.Style := smsValue;
        {with series1 , series2 , series3 do
         begin
           Marks.Style := smsValue;
         end;}
       end;
    8: begin
         series1.Marks.Style := smsXValue;
         series2.Marks.Style := smsXValue;
         series3.Marks.Style := smsXValue;
        {with series1 , series2 , series3 do
         begin
           Marks.Style := smsXValue;
         end;}
       end;
  end; {Case}
  atualizagrafico;
  DBChart1.RefreshData;
  PageControl1.activepage := TabSheet2;
  bbtnConfirmar.enabled := false;
end;

procedure TfrmConsEstatMassa.bbtnCancelarClick(Sender: TObject);
begin
//  inherited;
  DBChart1.print;
end;

procedure TfrmConsEstatMassa.wwDBLookupCombo1Enter(Sender: TObject);
begin
  inherited;
  if not qrypatro.active then qrypatro.open;
end;

procedure TfrmConsEstatMassa.wwDBLookupCombo2Enter(Sender: TObject);
begin
  inherited;
  If not qryplano.active then qryplano.open;
end;

procedure TfrmConsEstatMassa.wwDBLookupCombo3Enter(Sender: TObject);
begin
  inherited;
  If not qryplanass.active then qryplanass.open;
end;

procedure TfrmConsEstatMassa.cmbfilialEnter(Sender: TObject);
begin
  inherited;
  If not qryfilial.active then qryfilial.open;
end;

end.
