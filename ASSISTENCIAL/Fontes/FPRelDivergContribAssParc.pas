unit FPRelDivergContribAssParc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMParamRel, cmRepBtn, MAHlpBtn, TB97, StdCtrls, Buttons, ComCtrls,
  ExtCtrls, Db, DBTables, Wwquery, wwdblook, Spin, TB97Tlbr, IvDictio,
  IvMulti, IvEMulti;

type
  TfrmPRelDivergContribParc = class(TCMParamRel)
    tbsParametros: TTabSheet;
    qrypatro: TwwQuery;
    qryplano: TwwQuery;
    Panel1: TPanel;
    grpMeses: TGroupBox;
    grpMesAnoRef: TGroupBox;
    cmbMesRef: TComboBox;
    spedAnoRef: TSpinEdit;
    GroupBox4: TGroupBox;
    cmbMesCob: TComboBox;
    spedAnoCob: TSpinEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    dblkpcmbPatro: TwwDBLookupCombo;
    Label2: TLabel;
    dblkpcmbPlano: TwwDBLookupCombo;
    rgrpDivergencias: TRadioGroup;
    cmbplanass: TwwDBLookupCombo;
    lblplanass: TLabel;
    qryplanass: TwwQuery;
    procedure FormActivate(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure rbtnVisualizarClick(Sender: TObject);
    procedure rbtnImprimirClick(Sender: TObject);
    procedure cmbplanassEnter(Sender: TObject);
  private
    { Private declarations }
    function PreparaRelatorio : boolean;
  public
    { Public declarations }
  end;

var
  frmPRelDivergContribParc: TfrmPRelDivergContribParc;

implementation

uses RDivergContribAssParc, UMensErro;


{$R *.DFM}

function TfrmPRelDivergContribParc.PreparaRelatorio : boolean;
var sSQLPatro,
    sSQLPlano,
    sSQLContrib,
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
                  ' FROM   PLANASS PL, PLANPREVASS PP, PLANPREV PS, HSTCONTRIBASS  '+
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


  sSQLContrib := ' SELECT COUNT(distinct(HSTCONTRIBASS.IDTITULAR||HSTCONTRIBASS.IDDEPENDENTE)) AS NUMPESSOAS,'+
                 ' HSTCONTRIBASS.IDPESSJUR, '+
                 ' HSTCONTRIBASS.IDPLANOPREV,HSTCONTRIBASS.IDPLANASS, '+
                 ' PLANASS.NOME PLANO, HSTCONTRIBASS.IDCONTASS, '+
                 ' CONTRIBUICAO.NOME CONTRIBUICAO '+
                 ' FROM   HSTCONTRIBASS, CONTRIBUICAO, PLANASS '+
                 ' WHERE '+
             //    ' PLANASS.IDPLANASS =  :IDPLANASS AND '+
             //    ' HSTCONTRIBASS.IDPLANOPREV = :IDPLANOPREV AND '+
             //    ' HSTCONTRIBASS.IDPESSJUR = :IDPESSJUR AND '+
                 ' CONTRIBUICAO.IDCONTRIBUICAO = HSTCONTRIBASS.IDCONTASS AND '+
                 ' HSTCONTRIBASS.IDPLANASS = PLANASS.IDPLANASS AND '+
                 ' HSTCONTRIBASS.VALORESPERADO <> HSTCONTRIBASS.VALORRECEBIDO AND '+
                 ' HSTCONTRIBASS.SITRECEBIMENTO NOT IN (0,1,2)  ';
                 //'         CONTPREV.FLGPAGADOR = ''C'' ';

  if Trim(sMesReferencia) <> ''
  then sSQLContrib := sSQLContrib + ' AND HSTCONTRIBASS.MES = '''+sMesReferencia+ '''';

  if Trim(sMesCobranca) <> ''
  then sSQLContrib := sSQLContrib + ' AND HSTCONTRIBASS.MESCOBRANCA = '''+sMesCobranca+ '''';

  sSQLContrib := sSQLContrib + '  GROUP BY HSTCONTRIBASS.IDPESSJUR,HSTCONTRIBASS.IDPLANOPREV,'+
                               '  HSTCONTRIBASS.IDPLANASS,PLANASS.NOME ,'+
                               '  HSTCONTRIBASS.IDCONTASS,CONTRIBUICAO.NOME';


  with relDivergContribParc do
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

        qryContribuicoes.Close;
        qryContribuicoes.SQL.Clear;
        qryContribuicoes.SQL.Add(sSQLContrib);
        qryContribuicoes.Open;

        {if qryContribuicoes.isempty
        then begin
           MsgDlg('Não existem contribuições nas opções especificadas. ','Erro',mtError,[mbOk,mbHelp],0);
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
           sSQLParticipante := ' SELECT P.NOME AS PARTICIPANTE, EL.MATRICULA, PD.NOME DEPENDENTE '+
                               ' FROM PESSOA P, ELEGPATRO EL,PESSOA PD, '+
                               ' CONTASS CP '+
                               ' WHERE '+
                               ' CP.IDTITULAR = P.IDPESSOA AND '+
                               ' CP.IDPESSJUR= EL.IDPESSJUR AND '+
                               ' CP.IDTITULAR = EL.IDPESSOA AND '+
                               ' CP.IDCONTASS = :IDCONTASS AND '+
                               ' CP.IDPLANASS = :IDPLANASS AND '+
                               ' CP.IDPLANOPREV = :IDPLANOPREV AND '+
                               ' PD.IDPESSOA = CP.IDDEPENDENTE AND '+
                               ' CP.IDPESSJUR = :IDPESSJUR  '+
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

procedure TfrmPRelDivergContribParc.rbtnVisualizarClick(Sender: TObject);
begin
  relDivergContribParc := TrelDivergContribParc.Create(Self);
  inherited;
  if PreparaRelatorio
  then relDivergContribParc.qr.Preview;
end;

procedure TfrmPRelDivergContribParc.FormActivate(Sender: TObject);
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

procedure TfrmPRelDivergContribParc.bbtnSairClick(Sender: TObject);
begin
  inherited;
  Close;
end;


procedure TfrmPRelDivergContribParc.rbtnImprimirClick(Sender: TObject);
begin
  inherited;
  relDivergContribParc := TrelDivergContribParc.Create(Self);
  inherited;
  if PreparaRelatorio
  then relDivergContribParc.qr.Print

end;

procedure TfrmPRelDivergContribParc.cmbplanassEnter(Sender: TObject);
begin
if not qryplanass.active then
begin
   qryplanass.open;
end;
end;

end.
