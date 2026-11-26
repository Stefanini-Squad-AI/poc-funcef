// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Gleyber
// Data        : 24/01/2006
// Pendência   : 18975
// Rotina      : Consulta e dbcmbplanoCloseUp
// Descricao   : Implementação para otimizar a visualização de reservas coletivas.
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 26.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
unit FConsHistMovReserva;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FConsultar, Db, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Tabs,
  ComCtrls, MAHlpBtn, Buttons, TB97,  Spin, wwdblook,
  TREdit, DBTables, Wwquery, TB97Tlbr, IvDictio, IvMulti, IvEMulti,
  ExtCtrls, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmConsHistMovReserva = class(TfrmConsultar)
    Splitter1: TSplitter;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    lblreserva: TLabel;
    DBCMBRESERVA: TwwDBLookupCombo;
    GroupBox4: TGroupBox;
    Label15: TLabel;
    Label13: TLabel;
    Label7: TLabel;
    edmatricula: TEdit;
    edcpf: TEdit;
    ednome: TEdit;
    tbhst: TTabSheet;
    rdggerador: TRadioGroup;
    grpData: TGroupBox;
    grplegenda: TGroupBox;
    Shape3: TShape;
    Label10: TLabel;
    Shape4: TShape;
    Label11: TLabel;
    Shape5: TShape;
    Label14: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    numinscprev: TEdit;
    datainscprev: TCMDateTimePicker;
    datamovini: TCMDateTimePicker;
    datamovfim: TCMDateTimePicker;
    Label5: TLabel;
    Label6: TLabel;
    Label29: TLabel;
    cmbfilial: TwwDBLookupCombo;
    GroupBox2: TGroupBox;
    Label9: TLabel;
    Label16: TLabel;
    rvlmovmoeda: TRealEdit;
    rvlmovcotas: TRealEdit;
    rvlmovmoedafim: TRealEdit;
    rvlmovcotasfim: TRealEdit;
    rvlposmoeda: TRealEdit;
    rvlposcotas: TRealEdit;
    rvlposmoedafim: TRealEdit;
    rvlposcotasfim: TRealEdit;
    Label17: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    qryreserva: TwwQuery;
    qrypatro: TwwQuery;
    qryplano: TwwQuery;
    qryfilial: TwwQuery;
    qryevento: TwwQuery;
    qrybeneficio: TwwQuery;
    qrycont: TwwQuery;
    qryreservaDATAMOV: TDateTimeField;
    qryreservaVLRREAL: TFloatField;
    qryreservaVLRCOTAS: TFloatField;
    qryreservaSALDOREAL: TFloatField;
    qryreservaSALDOCOTAS: TFloatField;
    qryreservaBENEFICIO: TStringField;
    qryreservaRESERVA: TStringField;
    qryreservaPLANPREV: TStringField;
    qryreservaPESSOA: TStringField;
    qryreservaPESSJUR: TStringField;
    qryreservaCONTRIBUICAO: TStringField;
    qryreservaEVENTO: TStringField;
    qryreservaSaldoAntReal: TFloatField;
    qryreservaSaldoAntCotas: TFloatField;
    chkmovmoeda: TCheckBox;
    chkmovcotas: TCheckBox;
    chkposmoeda: TCheckBox;
    chkposcotas: TCheckBox;
    Label12: TLabel;
    Label18: TLabel;
    Label23: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    rvlantmoeda: TRealEdit;
    rvlantcotas: TRealEdit;
    rvlantmoedafim: TRealEdit;
    rvlantcotasfim: TRealEdit;
    chkantmoeda: TCheckBox;
    chkantcotas: TCheckBox;
    Shape1: TShape;
    Label32: TLabel;
    qryreservaNOMEREGRA: TStringField;
    qryreservaFLGENTRADA: TStringField;
    qryreservaENTRADA: TFloatField;
    qryreservaIDHISTRESERVA: TFloatField;
    qryreservaIDEVENTOGERADOR: TFloatField;
    qryreservaIDPLANOPREV: TFloatField;
    qryreservaIDCONTRIBUICAO: TFloatField;
    qryreservaIDBENEFICIO: TFloatField;
    qryreservaIDTIPORESERVA: TFloatField;
    qryreservaIDPESSJUR: TFloatField;
    qryreservaIDPESSOA: TFloatField;
    Shape2: TShape;
    Label33: TLabel;
    GroupBox3: TGroupBox;
    LABEL1: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    DBCMBPATRO: TwwDBLookupCombo;
    cmbevento: TwwDBLookupCombo;
    dbcmbplano: TwwDBLookupCombo;
    cmbbeneficio: TwwDBLookupCombo;
    cmbcontribuicao: TwwDBLookupCombo;
    qryreservacmb: TwwQuery;
    rdgrpreserv: TRadioGroup;
    qryreservaPART: TStringField;
    qryreservaVALORINDICE: TFloatField;
    qryreservaMATRICULA: TStringField;
    procedure dbgrdResultadoCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure bbtnConsultarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Consulta; override;
    procedure qryreservaCalcFields(DataSet: TDataSet);
    procedure dbgrdResultadoTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure FormActivate(Sender: TObject);
    procedure dbcmbplanoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
      
  private
     sSqlaux : String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsHistMovReserva: TfrmConsHistMovReserva;

implementation

uses UAdmPrev;

{$R *.DFM}

procedure TfrmConsHistMovReserva.dbgrdResultadoCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;
if (rdggerador.itemindex = 5) and (not qryreserva.IsEmpty) then
begin
   if (qryreserva.FieldByName('IDBENEFICIO').AsString <> '')
   then begin // Ativo
      ABrush.Color := clWindow;
      AFont.Color  := clWindowText;
      if highlight then begin
         ABrush.Color := clWindow;
         AFont.Color  := clWindowText;
      end
   end
   else if (qryreserva.FieldByName('IDCONTRIBUICAO').AsString <> '')
   then begin // Ativo
     ABrush.Color := clTeal;
     AFont.Color  := clWindow;
     if highlight then begin
        ABrush.Color := clTeal;
        AFont.Color  := clWindow;
     end
   end
   else if (qryreserva.FieldByName('IDEVENTOGERADOR').AsString <> '')
   then begin // Ativo
     ABrush.Color := clGray;
     AFont.Color  := clWindow;
     if highlight then begin
        ABrush.Color := clGray;
        AFont.Color  := clWindow;
     end
   end
   else if (qryreserva.FieldByName('IDEVENTOGERADOR').AsString = '') and
           (qryreserva.FieldByName('IDBENEFICIO').AsString = '') and
           (qryreserva.FieldByName('IDCONTRIBUICAO').AsString = '') and
           (qryreserva.FieldByName('VLRCOTAS').AsFloat <= 0)
   then begin // Ativo
     ABrush.Color := clInfoBk;
     AFont.Color  := clWindowText;
     if highlight then begin
        ABrush.Color := clInfoBk;
        AFont.Color  := clWindowText;
     end;
   end
   else if (qryreserva.FieldByName('IDEVENTOGERADOR').AsString = '') and
           (qryreserva.FieldByName('IDBENEFICIO').AsString = '') and
           (qryreserva.FieldByName('IDCONTRIBUICAO').AsString = '') and
           (qryreserva.FieldByName('VLRCOTAS').AsFloat > 0 )
   then begin // Ativo
     ABrush.Color := clYellow;
     AFont.Color  := clWindowText;
     if highlight then begin
        ABrush.Color := clYellow;
        AFont.Color  := clWindowText;
     end;
   end;
   end;
end;

procedure TfrmConsHistMovReserva.bbtnConsultarClick(Sender: TObject);
begin
  inherited;
if rdggerador.itemindex <>  5  then
grplegenda.visible := false
   else
   grplegenda.visible := true;
end;

procedure TfrmConsHistMovReserva.bbtnSairClick(Sender: TObject);
begin
  inherited;
Close;
end;

procedure TfrmConsHistMovReserva.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   Action := cafree;
end;

procedure TfrmConsHistMovReserva.Consulta;
var

   sSql1, sSqlPart,
   sSql2, sSql3   : string;  
   cAux : char;
begin

  qryreserva.close;
  qryreserva.sql.clear;

  { Procurar os benefícios dos beneficiários e dos assistidos }
  sSql1 := '';
  sSqlPart := '';


  if edmatricula.text <> ''     then
     begin
        sSqlPart := sSqlPart + 'and (elegpatro.matricula = '''+edmatricula.text+''' ) ' ;
     end;

  if edcpf.text <> ''     then
     begin
        sSQL1 := sSql1 + 'and (pessoa.numdocumento = '''+edcpf.text+''' ) ' ;
     end;

  if ednome.text <> ''     then
     begin
        sSQL1 := sSql1 + 'and  (UPPER(pessoa.NOME) LIKE ''%'+ednome.text+'%'' ) ' ;
     end;

 if cmbfilial.text <> ''     then
     begin
        sSqlPart := sSqlPart + 'and  (elegpatro.IDESTAB = '+qryfilial.fieldbyname('idpessoa').AsString+' ) ' ;
     end;

 if dbcmbpatro.text <> ''     then
     begin
        sSQL1 := sSql1 + 'and (h.idpessjur = '+ qrypatro.FieldbyName('IdPessoa').AsString + ' ) ' ;
     end;

 if dbcmbplano.text <> ''      then
     begin
        sSQL1 := sSQL1 + 'and (planprev.idplanoprev  = ' + qryplano.FieldbyName('IdPlanoprev').AsString + ' ) ';
     end;

 if (cmbevento.text <> '' ) and (rdggerador.ItemIndex in [5,2])        then
     begin
        sSQL1 := sSQL1 + 'and (eventogerador.ideventogerador  = ' + qryevento.FieldbyName('Ideventogerador').AsString + ' ) ';
     end;

 if (cmbcontribuicao.text <> '') and (rdggerador.ItemIndex in [5,1])       then
     begin
        sSQL1 := sSQL1 + 'and (contribuicao.idcontribuicao  = ' + qrycont.FieldbyName('Idcontribuicao').AsString + ' ) ';
     end;

 if (DBCMBRESERVA.text <> '')  then
     begin
        sSQL1 := sSQL1 + 'and (RESERVAXPLANO.idtiporeserva  = ' + qryreservacmb.FieldbyName('idtiporeserva').AsString + ' ) ';
     end;

 if (cmbbeneficio.text <> '') and (rdggerador.ItemIndex in [5,0])       then
     begin
        sSQL1 := sSQL1 + 'and (beneficio.idbeneficio  = ' + qrybeneficio.FieldbyName('Idbeneficio').AsString + ' ) ';
     end;

 if numinscprev.text <> ''       then
     begin
        sSqlPart := sSqlPart + ' and (partprevplan.inscricaonumero        = '''+trim(numinscprev.text)+''' )  ';
     end;

 case rdggerador.itemindex of
    0: sSQL1 := sSQL1 + ' and (h.idbeneficio is not null ) ';
    1: sSQL1 := sSQL1 + ' and (h.idcontribuicao is not null ) ';
    2: sSQL1 := sSQL1 + ' and (h.ideventogerador is not null ) ';
    3: sSQL1 := sSQL1 + ' and (h.ideventogerador is null and h.idbeneficio is null and h.idcontribuicao is null and(vlrcotas is null or vlrcotas = 0) ) ';
    4: sSQL1 := sSQL1 + ' and (h.ideventogerador is null and h.idbeneficio is null and h.idcontribuicao is null and vlrcotas > 0 ) ';
 end;

 case rdgrpreserv.itemindex of
    0: sSQL1 := sSQL1 + ' and (RESERVAXPLANO.flgcoletiva = 0 ) ';
    1: sSQL1 := sSQL1 + ' and (RESERVAXPLANO.flgcoletiva = 1 ) ';
 end;

 if datamovini.text <> '' then
    sSQL1 := sSQL1 + ' and (datamov >= to_date('''+datamovini.text+' 00:00:01'',''dd/mm/yyyy hh24:mi:ss'' )) ';

 if datamovfim.text <> '' then
    sSQL1 := sSQL1 + ' and (datamov <= to_date('''+datamovfim.text+' 23:59:59'',''dd/mm/yyyy hh24:mi:ss'' )) ';

 cAux := DecimalSeparator;
 DecimalSeparator := '.';
 if  chkmovmoeda.Checked then
    sSQL1 := sSQL1 + ' and (vlrreal >= '+floattostr(rvlmovmoeda.value)+' and vlrreal <= '+floattostr(rvlmovmoedafim.value)+' ) ';
 if  chkmovcotas.Checked then
    sSQL1 := sSQL1 + ' and (vlrcotas >=  '+floattostr(rvlmovcotas.value)+' and vlrcotas <= '+floattostr(rvlmovcotasfim.value)+' ) ';
 if  chkposmoeda.Checked then
     sSQL1 := sSQL1 + ' and (saldoreal >= '+floattostr(rvlposmoeda.value)+' and saldoreal <= '+floattostr(rvlposmoedafim.value)+' ) ';
 if  chkposcotas.Checked then
    sSQL1 := sSQL1 + ' and (saldocotas >= '+floattostr(rvlposcotas.value)+' and saldocotas <= '+floattostr(rvlposcotasfim.value)+' ) ';
 DecimalSeparator := cAux;

 If rdgrpreserv.ItemIndex = 0
  Then Begin
    sSql2 := ' AND (ELEGPATRO.IDPESSOA = PESSOA.IDPESSOA ) ';
    sSql3 := '';
  End
  Else Begin
    sSql2 := '';
    sSql3 := ' AND (BENEFICIO.IDBENEFICIO = H.IDBENEFICIO) ';
  End;

  qryreserva.sql.clear;


  qryreserva.sql.add('SELECT '+
                    ' H.IDHISTRESERVA,H.IDEVENTOGERADOR,H.IDPLANOPREV,H.IDCONTRIBUICAO,H.IDBENEFICIO,H.IDTIPORESERVA, '+
                    ' H.IDPESSJUR ,H.IDPESSOA   ,H.DATAMOV   ,H.VLRREAL ,H.VLRCOTAS   ,H.SALDOREAL  ,H.SALDOCOTAS     , '+
                    ' BENEFICIO.NOME BENEFICIO, RESERVAXPLANO.NOME RESERVA, PLANPREV.NOME PLANPREV, '+
                    ' PESSOA.NOME PESSOA , PESSJUR.NOME PESSJUR , CONTRIBUICAO.NOME CONTRIBUICAO , EVENTOGERADOR.NOME EVENTO '+
                    ' ,DECODE(FLGENTRADA,1,''Entrada'',0,''Saída'') FLGENTRADA, FLGENTRADA ENTRADA, REGRA.NOMEREGRA, PESSOA.NOME PART,  '+
                    ' ELEGPATRO.MATRICULA, H.VALORINDICE '+
                    ' FROM HISTMOVRESERVA H, EVENTOGERADOR, PLANPREV, '+
                    ' RESERVAXPLANO, CONTRIBUICAO, BENEFICIO, ELEGPATRO, PARTPREVPLAN, REGRA ,PESSOA,PESSOA PESSJUR, '+
                    ' PATRO '+
                    ' WHERE '+
                    ' (PESSOA.IDPESSOA =  H.IDPESSOA )  '+

		    sSql2 + 
                    ' AND (ELEGPATRO.IDPESSJUR = PESSJUR.IDPESSOA ) '+
                    ' AND (PATRO.IDPESSOA = ELEGPATRO.IDPESSJUR) '+
                    ' AND (PATRO.IDFUNDACAO = '+IntToStr(iIdFundacao)+')'+ 
                    ' AND (PARTPREVPLAN.IDPESSOA = ELEGPATRO.IDPESSOA ) '+
                    ' AND (PARTPREVPLAN.SEQPROPOSTA = H.SEQPROPOSTA ) '+
                    ' AND (PARTPREVPLAN.IDPLANOPREV = PLANPREV.IDPLANOPREV ) '+
                    ' AND (PARTPREVPLAN.IDPESSJUR = ELEGPATRO.IDPESSJUR ) '+
                    ' AND (PARTPREVPLAN.FLGDESATIVADO = 0 ) '+
                    ' AND (PESSJUR.IDPESSOA = H.IDPESSJUR ) '+
                    ' AND (PLANPREV.IDPLANOPREV = H.IDPLANOPREV )  '+
                    ' AND (RESERVAXPLANO.IDPLANOPREV = PLANPREV.IDPLANOPREV )  '+
                    ' AND (RESERVAXPLANO.IDTIPORESERVA = H.IDTIPORESERVA )  '+
                    ' AND (EVENTOGERADOR.IDEVENTOGERADOR(+) = H.IDEVENTOGERADOR )  '+
                    ' AND (CONTRIBUICAO.IDCONTRIBUICAO(+) = H.IDCONTRIBUICAO  )    '+
                    ' AND (REGRA.IDREGRA(+) = H.IDREGRACALCULO ) '+
                    ' AND (BENEFICIO.IDBENEFICIO(+) = H.IDBENEFICIO ) '+sSql1+' '+sSqlPart+' '+
                    ' UNION'+
                    ' SELECT  H.IDHISTRESERVA,H.IDEVENTOGERADOR,H.IDPLANOPREV,H.IDCONTRIBUICAO, '+
                    ' H.IDBENEFICIO,H.IDTIPORESERVA,  H.IDPESSJUR ,H.IDPESSOA   ,H.DATAMOV   , '+
                    ' H.VLRREAL ,H.VLRCOTAS   ,H.SALDOREAL  ,H.SALDOCOTAS     , '+
                    ' BENEFICIO.NOME BENEFICIO, RESERVAXPLANO.NOME RESERVA, '+
                    ' PLANPREV.NOME PLANPREV,  PESSOA.NOME PESSOA , PESSOA.NOME PESSJUR , '+
                    ' CONTRIBUICAO.NOME CONTRIBUICAO , EVENTOGERADOR.NOME EVENTO  , '+
                    ' DECODE(FLGENTRADA,1,''Entrada'',0,''Saída'') FLGENTRADA, FLGENTRADA ENTRADA, '+
                    ' REGRA.NOMEREGRA, PART.NOME PART, ELEGPATRO.MATRICULA, H.VALORINDICE '+
                    ' FROM HISTMOVRESERVA H, EVENTOGERADOR, PLANPREV, PATRO, '+
                    ' RESERVAXPLANO, CONTRIBUICAO, BENEFICIO, REGRA,  PARTPREVPLAN ,ELEGPATRO , PESSOA,PESSOA PART '+
                    ' WHERE  (PESSOA.IDPESSOA =  H.IDPESSOA  )'+
                    ' AND (PESSOA.IDPESSOA = H.IDPESSJUR ) '+

                    sSql2 + 
                    ' AND (H.IDPESSJUR = ELEGPATRO.IDPESSJUR ) '+
                    ' AND (PATRO.IDPESSOA = ELEGPATRO.IDPESSJUR) '+
                    ' AND (PATRO.IDFUNDACAO = '+IntToStr(iIdFundacao)+')'+ 
                    ' AND (H.IDPARTICIPANTE = PART.IDPESSOA(+) ) '+
                    ' AND (H.IDPLANOPREV = PARTPREVPLAN.IDPLANOPREV(+) ) '+
                    ' AND (H.IDPESSJUR = PARTPREVPLAN.IDPESSJUR(+) ) '+
                    ' AND (H.SEQPROPOSTA = PARTPREVPLAN.SEQPROPOSTA(+) ) '+
                    ' AND (PLANPREV.IDPLANOPREV = H.IDPLANOPREV ) '+
                    ' AND (RESERVAXPLANO.IDPLANOPREV = PLANPREV.IDPLANOPREV ) '+
                    ' AND (BENEFICIO.IDBENEFICIO = H.IDBENEFICIO ) '+
                    ' AND (RESERVAXPLANO.IDTIPORESERVA = H.IDTIPORESERVA ) '+
                    ' AND (EVENTOGERADOR.IDEVENTOGERADOR(+) = H.IDEVENTOGERADOR ) '+
                    ' AND (CONTRIBUICAO.IDCONTRIBUICAO(+) = H.IDCONTRIBUICAO ) '+
                    ' AND (REGRA.IDREGRA(+) = H.IDREGRACALCULO ) '+
                    ' AND (BENEFICIO.IDBENEFICIO(+) = H.IDBENEFICIO ) '+sSql1+' '+sSqlPart+' '+
                    sSql3 + 
                    ' ');

              { Executar query com condicoes especificadas pelo usuario }
              try
                  sSqlaux := qryreserva.sql.text;
                  qryreserva.Open;
              except
                 raise;
              end;


end;


procedure TfrmConsHistMovReserva.qryreservaCalcFields(DataSet: TDataSet);
begin
  inherited;
if qryreserva.fieldbyname('ENTRADA').AsInteger = 1 then
qryreserva.fieldbyname('SaldoAntReal').AsFloat := qryreserva.fieldbyname('saldoreal').AsFloat - qryreserva.fieldbyname('vlrreal').AsFloat
else qryreserva.fieldbyname('SaldoAntReal').AsFloat := qryreserva.fieldbyname('saldoreal').AsFloat + qryreserva.fieldbyname('vlrreal').AsFloat;

if qryreserva.fieldbyname('ENTRADA').AsInteger = 1 then
qryreserva.fieldbyname('SaldoAntCotas').AsFloat := qryreserva.fieldbyname('saldoCotas').AsFloat - qryreserva.fieldbyname('vlrCotas').AsFloat
else qryreserva.fieldbyname('SaldoAntCotas').AsFloat := qryreserva.fieldbyname('saldoCotas').AsFloat + qryreserva.fieldbyname('vlrCotas').AsFloat;

end;

procedure TfrmConsHistMovReserva.dbgrdResultadoTitleButtonClick(
  Sender: TObject; AFieldName: String);
begin
  inherited;

  if not ((uppercase(AFieldName) = 'SALDOANTCOTAS') or
          (uppercase(AFieldName) = 'SALDOANTREAL')) then
  begin
     qryreserva.close;
     qryreserva.sql.clear;
     qryreserva.sql.add(sSqlAux + 'ORDER BY '+AFieldName+', DATAMOV DESC');
     qryreserva.open;
  end;
end;

procedure TfrmConsHistMovReserva.FormActivate(Sender: TObject);
begin
  inherited;
  qryPatro.Close;
  qryPatro.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; 
  qryPatro.Open;

  qryPlano.Close;
  qryPlano.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; 
  qryPlano.Open;

  qryEvento.Close;
  qryEvento.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; 
  qryEvento.Open;

  qryBeneficio.Close;
  qryBeneficio.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; 
  qryBeneficio.Open;

  qryCont.Close;
  qryCont.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; 
  qryCont.Open;

  qryFilial.Close;
  qryFilial.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; 
  qryFilial.Open;

  qryReservaCmb.Close;
  qryReservaCmb.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; 
  qryReservaCmb.Open;

end;

procedure TfrmConsHistMovReserva.dbcmbplanoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If (modified) And (Trim(dbcmbplano.Text) <> '') And (Trim(DBCMBRESERVA.Text) = '')
   Then begin
     qryreservacmb.Close;
     qryreservacmb.SQL.Clear;
     qryreservacmb.SQL.Add('SELECT DISTINCT  NOME, IDTIPORESERVA');
     qryreservacmb.SQL.Add('FROM   RESERVAXPLANO');
     qryreservacmb.SQL.Add('WHERE  ANALITICOSINTETI = '+ QuotedStr('A'));
     qryreservacmb.SQL.Add('AND    IDPLANOPREV      = '+ qryplano.FieldByName('IDPLANOPREV').AsString );

     qryreservacmb.Open;
   End;
end;


end.
