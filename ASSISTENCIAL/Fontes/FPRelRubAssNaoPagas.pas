unit FPRelRubAssNaoPagas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMParamRel, cmRepBtn, MAHlpBtn, TB97, StdCtrls, Buttons, ComCtrls,
  ExtCtrls, Spin, wwdblook, Db, DBTables, Wwquery, TB97Tlbr;

type
  TfrmPRelRubNaoPagas = class(TCMParamRel)
    tbsParametros: TTabSheet;
    Panel1: TPanel;
    qrypatro: TwwQuery;
    qryplano: TwwQuery;
    GroupBox1: TGroupBox;
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
    rgrpDivergencias: TRadioGroup;
    cmbplanass: TwwDBLookupCombo;
    lblplanass: TLabel;
    qryplanass: TwwQuery;
    procedure rbtnVisualizarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure rbtnImprimirClick(Sender: TObject);
    procedure cmbplanassEnter(Sender: TObject);
  private
    { Private declarations }
    function PreparaRelatorio : boolean;
  public
    { Public declarations }
  end;

var
  frmPRelRubNaoPagas: TfrmPRelRubNaoPagas;

implementation

uses RRubAssNaoPagas, UMensErro;

{$R *.DFM}

function TfrmPrelRubNaoPagas.PreparaRelatorio : boolean;
var sSQLPatro,
    sSQLPlano,
    sSQLRubrica,
    sSQLParticipante : string;
    sMesReferencia,
    sMesCobranca : string;
begin
  Result := False;

    // Preencher variaveis de Mes de Referencia e Mes de Cobranca
  sMesReferencia := Trim(spedAnoRef.Text)+'/';
  if cmbMesRef.ItemIndex <= 8
  then sMesReferencia := sMesReferencia+'0'+IntToStr(cmbMesRef.ItemIndex+1)
  else sMesReferencia := sMesReferencia+IntToStr(cmbMesRef.ItemIndex+1);

  sMesCobranca := Trim(spedAnoCob.Text)+'/';
  if cmbMesCob.ItemIndex <= 8
  then sMesCobranca := sMesCobranca+'0'+IntToStr(cmbMesCob.ItemIndex+1)
  else sMesCobranca := sMesCobranca+IntToStr(cmbMesCob.ItemIndex+1);

  if Trim(dblkpcmbPatro.Text) = ''
  then begin
     sSQLPatro := ' SELECT IDPESSOA,NOME FROM PESSOA WHERE FLGPATROCINADORA = 1 ORDER BY NOME ';
  end
  else sSQLPatro := ' SELECT IDPESSOA,NOME FROM PESSOA '+
                    ' WHERE FLGPATROCINADORA = 1 AND IDPESSOA = '+qryPatro.FieldByName('IdPessoa').AsString+
                    ' ORDER BY NOME ';

 sSQLPlano := ' SELECT DISTINCT PL.IDPLANASS,PL.NOME, PS.NOME PREV,PP.IDPLANOPREV, PP.IDPESSJUR  '+
                  ' FROM   PLANASS PL, PLANPREVASS PP, PLANPREV PS '+
                  ' WHERE  PL.IDPLANASS = PP.IDPLANASS AND '+
                  '        PP.IDPESSJUR = :IDPESSOA AND '+
                  '        PS.IDPLANOPREV = PP.IDPLANOPREV ';
  if (Trim(dblkpcmbPlano.Text) <> '')
  then begin
     sSQLPlano := sSQLPlano + ' AND PP.IDPLANOPREV = '+qryplano.fieldbyname('IdPlanoprev').AsString+'';
  end;

  if  (Trim(cmbplanass.text) = '')
  then begin
     sSQLPlano := sSQLPlano + ' AND PP.IDPLANASS = '+qryplanass.fieldbyname('IdPlanass').AsString+'';
  end;



  sSQLRubrica := ' SELECT COUNT(DISTINCT(T.IDPESSOA)) AS NUMPESSOAS,'+
                 ' T.IDPESSJUR,T.IDPLANOPREV,T.IDPROVENTO,T.IDPLANASS, '+
                 ' PL.NOME AS PLANO, PV.DESCRICAO AS RUBRICA, PS.NOME PREV '+
                 ' FROM   TMPDESC T, PLANASS PL, PROVDESC PV, PLANPREV PS,HSTCONTRIBASS HS '+
                 ' WHERE '+
                 ' T.IDPLANASS = :IDPLANASS AND '+
                 ' T.IDPLANOPREV = :IDPLANOPREV AND '+
                 ' HS.IDPESSJUR = :IDPESSJUR AND '+
                 ' T.IDPLANASS = PL.IDPLANASS AND '+
                 ' T.IDPLANOPREV = PS.IDPLANOPREV AND '+
                 ' T.IDPROVENTO = PV.IDPROVENTO AND '+
                 ' (T.VALORRECEBIDO IS NULL OR '+
                 ' T.VALORRECEBIDO = 0)   AND '+
                 ' T.FLGTIPODESC = ''A'' AND '+
                 ' HS.IDPLANASS = T.IDPLANASS AND '+
                 ' HS.IDPLANOPREV = T.IDPLANOPREV AND '+
                 ' HS.IDPESSJUR = T.IDPESSJUR AND '+
                 ' HS.IDTITULAR = T.IDTITULAR AND '+
                 ' HS.IDDEPENDENTE = T.IDPESSOA AND '+
                 ' HS.MES = T.MESREFERENCIA AND '+
                 ' HS.MESCOBRANCA = T.MESCOBRANCA AND '+
                 ' HS.IDMOTIVO = T.IDMOTIVO AND '+
                 ' HS.IDCONTASS = T.IDDESCONTO AND '+
                 ' HS.SITRECEBIMENTO NOT IN (0,1,2) ';

  if Trim(sMesReferencia) <> ''
  then sSQLRubrica := sSQLRubrica + ' AND T.MESREFERENCIA = '''+sMesReferencia+ '''';

  if Trim(sMesCobranca) <> ''
  then sSQLRubrica := sSQLRubrica + ' AND T.MESCOBRANCA = '''+sMesCobranca+ '''';

  sSQLRubrica := sSQLRubrica +' GROUP BY T.IDPESSJUR,T.IDPLANOPREV,T.IDPROVENTO,T.IDPLANASS,'+
                              '  PL.NOME, PV.DESCRICAO , PS.NOME  ';



  with relRubNaoPagas do
  begin
     try
        qryInfo.Close;
        qryInfo.Open;
        qryPatro.Close;
        qryPatro.SQL.Clear;
        qryPatro.SQL.Add(sSQLPatro);
        qryPatro.Open;

        qryPlano.Close;
        qryPlano.SQL.Clear;
        qryPlano.SQL.Add(sSQLPlano);
        qryPlano.Open;

        qryRubricas.Close;
        qryRubricas.SQL.Clear;
        qryRubricas.SQL.Add(sSQLRubrica);
        qryRubricas.Open;

        {if qryRubricas.isempty
        then begin
           MsgDlg('Não existem rubricas nas opções especificadas. ','Erro',mtError,[mbOk,mbHelp],0);
           Exit;
        end;}

        if sMesReferencia <> ''
        then qrlblMesRef.Caption := Trim(cmbMesRef.Text)+'/'+spedAnoRef.Text
        else qrlblMesRef.Caption := '';

        if sMesCobranca <> ''
        then qrlblMesCob.Caption := Trim(cmbMesCob.Text)+'/'+spedAnoCob.Text
        else qrlblMesCob.Caption := '';

        if rgrpDivergencias.ItemIndex = 1 // Por participante
        then begin
           qrshContrib.Width := 544;
           sSQLParticipante := 'SELECT P.NOME AS PARTICIPANTE,PD.NOME DEPENDENTE, '+
                               ' EL.MATRICULA '+
                               ' FROM   PESSOA P, ELEGPATRO EL, PESSOA PD, '+
                               '  CONTASS CP,CONTRIBASS C '+
                               ' WHERE '+
                               ' C.IDPROVENTO = :IDPROVENTO AND '+
                               ' C.IDCONTASS = CP.IDCONTASS AND '+
                               ' C.IDPLANASS = CP.IDPLANASS AND '+
                               ' CP.IDPLANOPREV = :IDPLANOPREV AND '+
                               ' CP.IDPESSJUR = :IDPESSJUR AND '+
                               ' CP.IDTITULAR = P.IDPESSOA AND '+
                               ' CP.IDPESSJUR= EL.IDPESSJUR AND '+
                               ' CP.IDTITULAR = EL.IDPESSOA  AND '+
                               ' PD.IDPESSOA = CP.IDDEPENDENTE '+
                               ' ORDER BY EL.MATRICULA ';
            
           qryParticipante.Close;
           qryParticipante.SQL.Clear;
           qryParticipante.SQL.Add(sSQLParticipante);
           qryParticipante.Open;

           {if qryParticipante.isempty
           then begin
              MsgDlg('Não existem participantes nas opções especificadas. ','Erro',mtError,[mbOk,mbHelp],0);
              Exit;
           end;}
        end
        else begin
           qryParticipante.Close;
           qrshContrib.Width := 0;
        end;
     except
       Exit;
     end;
  end;//with
  Result := True;

end; // PreparaRelatorio


procedure TfrmPRelRubNaoPagas.rbtnVisualizarClick(Sender: TObject);
begin
  inherited;
  relRubNaoPagas := TrelRubNaoPagas.Create(Self);
  inherited;
  if PreparaRelatorio
  then relRubNaoPagas.qr.Preview;
end;

procedure TfrmPRelRubNaoPagas.rbtnImprimirClick(Sender: TObject);
begin
  inherited;
  relRubNaoPagas := TrelRubNaoPagas.Create(Self);
  inherited;
  if PreparaRelatorio
  then relRubNaoPagas.qr.Print

end;

procedure TfrmPRelRubNaoPagas.FormActivate(Sender: TObject);
var
  AYear, AMonth, ADay: Word;
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

  qryPatro.Close; qryPatro.Open;
  qryPlano.Close; qryPlano.Open;
  qryPlanass.Close; qryPlanass.Open;
  rgrpDivergencias.ItemIndex := 0;
end;

procedure TfrmPRelRubNaoPagas.bbtnSairClick(Sender: TObject);
begin
  inherited;
  Close;
end;


procedure TfrmPRelRubNaoPagas.cmbplanassEnter(Sender: TObject);
begin
if not qryplanass.active then
begin
   qryplanass.open;
end;
end;

end.
