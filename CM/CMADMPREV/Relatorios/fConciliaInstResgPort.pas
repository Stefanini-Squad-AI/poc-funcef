unit fConciliaInstResgPort;
// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Fanuel Junior
// Data        : 07/02/2012
// Pendência   : SOL 173351 Kintana 1563796
// Alteração   : Incluir o tipo de benefício 528, 590 e 591
// *****************************************************************************
// Autor(a)    : Vinicius Eduardo Nascimento Maciel
// Data        : 20/09/2011
// Pendência   : SOL 136317 Kintana 828472
// Alteração   : Criação do formulário que irá atuar como filtro do relatório
//------------------------------------------------------------------------------
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker,
  Db, Wwdatsrc, DBTables, Wwquery, Mask, wwdbedit, Wwdotdot, Wwdbcomb;

type
  TfrmConciliaInstResgPort = class(TfrmParamReports_Padrao)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    qryPeriodo: TwwQuery;
    dsPeriodo: TwwDataSource;
    cbDtInicial: TwwDBComboBox;
    cbDtFinal: TwwDBComboBox;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure verificaCampo(Sender: TObject);
    function valorValido(sValor : String) : boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConciliaInstResgPort: TfrmConciliaInstResgPort;

implementation

uses dConciliaInstResgPort, UMensErro;



{$R *.DFM}

procedure TfrmConciliaInstResgPort.bbtnConfirmarClick(
  Sender: TObject);
var
conta : double;
linhas : integer;
sDtInicial,sDtFinal,sPeriodo : String;
dtDtInicial,dtDtFinal :  TdateTime;
begin
  inherited;

    if (cbDtInicial.Text ='') then
  Begin
      MessageDlg('Período inicial não informado',mtWarning,[mbOK],0);
      cbDtInicial.SetFocus;
      Self.ModalResult := mrNone;
      Exit;
  end;

    if (cbDtFinal.Text='') then
  Begin
      MessageDlg('Período final não informado',mtWarning,[mbOK],0);
      cbDtFinal.SetFocus;
      Self.ModalResult := mrNone;
      Exit;
  end;
  dtDtInicial := StrToDateTime('01/' + Copy(Trim(cbDtInicial.Text),6,2)  + '/' + Copy(Trim(cbDtInicial.Text),1,4));
  dtDtFinal := StrToDateTime('01/' + Copy(Trim(cbDtFinal.Text),6,2)  + '/' + Copy(Trim(cbDtFinal.Text),1,4));
  if(dtDtFinal < dtDtInicial) then
  begin
      MessageDlg('O período final não pode ser menor que o inicial',mtWarning,[mbOK],0);
      cbDtInicial.SetFocus;
      Self.ModalResult := mrNone;
      Exit;
  end;

  qryPeriodo.Locate('PERIODO',cbDtInicial.Text,[]);
  sDtinicial := qryPeriodo.FieldByName('PERDATINI').asString;
  qryPeriodo.Locate('PERIODO',cbDtFinal.Text,[]);
  sDtFinal := qryPeriodo.FieldByName('PERDATFIM').asString;
  sPeriodo := cbDtInicial.Text;


  with dtmConciliaInstResgPort do
  begin
      qryConsulta.Close;
      qryConsulta.SQL.Clear;
      qryConsulta.SQL.Add(' SELECT QR2.*, (QR2.VALORPAGO - QR2.VALORRETIRADO) AS DIFERENCA FROM (');
      qryConsulta.SQL.Add(' SELECT QRI.MATRICULA, QRI.NOME, QRI.PLANO, QRI.TIPOBENEFICIO, QRI.IDPLANOPREV,');
      qryConsulta.SQL.Add(' QRI.PERC, ROUND(DECODE(QRI.VALORPAGO,NULL,0,QRI.VALORPAGO),2) as VALORPAGO,');
      qryConsulta.SQL.Add(' ROUND(DECODE(QRI.VALORRETIRADO,NULL,0,QRI.VALORRETIRADO),2) as VALORRETIRADO,');
      qryConsulta.SQL.Add(' DECODE(QRI.VALORCOTAS,NULL,0,QRI.VALORCOTAS) as VALORCOTAS FROM (');
      qryConsulta.SQL.Add(' SELECT DISTINCT d.matricula, p.nome, ppc.nome plano, b.nome tipobeneficio, bf.idplanoprev, tempo.perc,');
      qryConsulta.SQL.Add(' (SELECT SUM(DECODE(HB.FLGDEVOLUCAO,1,-hb.valorprev,HB.Valorprev))');
      qryConsulta.SQL.Add(' FROM hstbenefbfciario hb');
      qryConsulta.SQL.Add(' WHERE hb.IDPLANOPREV = bf.idplanoprev AND');
      qryConsulta.SQL.Add(' hb.IDBENEFICIO = bf.idbeneficio AND hb.IDPESSJUR = bf.idpessjur AND');
      qryConsulta.SQL.Add(' hb.IDTITULAR = bf.idtitular AND hb.IDPLANOORIGEM = bf.idplanoorigem AND');
      qryConsulta.SQL.Add(' hb.IDPESSOA = bf.idpessoa AND  hb.SEQPROPOSTA = bf.seqproposta AND  hb.mes = '+QuotedStr(sPeriodo)+') valorpago,');
      qryConsulta.SQL.Add(' (SELECT SUM(CASE');
      qryConsulta.SQL.Add(' WHEN Hm.IDPLANOPREV = 74 THEN DECODE(Hm.FLGENTRADA,1,-Hm.VLRREAL, Hm.VLRREAL)');
      qryConsulta.SQL.Add(' WHEN Hm.IDPLANOPREV = 2 THEN DECODE(Hm.FLGENTRADA,1,-Hm.VLRREAL, Hm.VLRREAL)');
      qryConsulta.SQL.Add(' WHEN hm.idbeneficio IN (478,510,493,516,528,590,591) AND Hm.IDPLANOPREV = 66  THEN DECODE(Hm.FLGENTRADA,1,-Hm.VLRREAL, Hm.VLRREAL)');  //Fanuel Junior SOL173351 Kintana1563796
      qryConsulta.SQL.Add(' WHEN Hm.IDTIPORESERVA IN (51,52,53,55,79,117,167) AND Hm.IDPLANOPREV = 66  THEN DECODE(Hm.FLGENTRADA,1,-Hm.VLRREAL, Hm.VLRREAL)');
      qryConsulta.SQL.Add(' WHEN Hm.IDTIPORESERVA IN (59,61,60,62,170) AND Hm.IDPLANOPREV = 66  THEN DECODE(Hm.FLGENTRADA,1,-Hm.VLRREAL*TEMPO.PERC,Hm.VLRREAL*TEMPO.PERC)');
      qryConsulta.SQL.Add(' END)');
      qryConsulta.SQL.Add(' FROM histmovreserva hm');
      qryConsulta.SQL.Add(' WHERE hm.idpessoa = d.idpessoa AND hm.idbeneficio = bf.idbeneficio AND');
      qryConsulta.SQL.Add(' hm.idplanoprev = bf.idplanoprev AND hm.idtiporeserva NOT IN (138, 137, 136)');
      qryConsulta.SQL.Add(' AND Hm.DATAALIMENTACAO >='+QuotedStr(sDtInicial));
      qryConsulta.SQL.Add(' AND hm.DATAALIMENTACAO <='+QuotedStr(sDtFinal)+') AS valorretirado,');
      qryConsulta.SQL.Add(' (SELECT SUM(CASE');
      qryConsulta.SQL.Add(' WHEN Hm.IDPLANOPREV = 74 THEN DECODE(Hm.FLGENTRADA,1,-Hm.Vlrcotas, Hm.Vlrcotas)');
      qryConsulta.SQL.Add(' WHEN Hm.IDPLANOPREV = 2 THEN DECODE(Hm.FLGENTRADA,1,-Hm.Vlrcotas, Hm.Vlrcotas)');
      qryConsulta.SQL.Add(' WHEN hm.idbeneficio IN (478,510,493,516,528,590,591) AND Hm.IDPLANOPREV = 66  THEN DECODE(Hm.FLGENTRADA,1,-Hm.Vlrcotas, Hm.Vlrcotas)');//Fanuel Junior SOL173351 Kintana1563796
      qryConsulta.SQL.Add(' WHEN Hm.IDTIPORESERVA IN (51,52,53,55,79,117,167) AND Hm.IDPLANOPREV = 66  THEN DECODE(Hm.FLGENTRADA,1,-Hm.Vlrcotas, Hm.Vlrcotas)');
      qryConsulta.SQL.Add(' WHEN Hm.IDTIPORESERVA IN (59,61,60,62,170) AND Hm.IDPLANOPREV = 66  THEN DECODE(Hm.FLGENTRADA,1,-Hm.Vlrcotas*TEMPO.PERC,Hm.Vlrcotas*TEMPO.PERC)');
      qryConsulta.SQL.Add(' END)');
      qryConsulta.SQL.Add(' FROM histmovreserva hm');
      qryConsulta.SQL.Add(' WHERE hm.idpessoa = d.idpessoa AND hm.idbeneficio = bf.idbeneficio AND');
      qryConsulta.SQL.Add(' hm.idplanoprev = bf.idplanoprev AND hm.idtiporeserva NOT IN (138, 137, 136)');
      qryConsulta.SQL.Add(' AND Hm.DATAALIMENTACAO >='+QuotedStr(sDtInicial));
      qryConsulta.SQL.Add(' AND hm.DATAALIMENTACAO <='+QuotedStr(sDtFinal)+') AS VALORCOTAS');
      qryConsulta.SQL.Add(' FROM depentit d');
      qryConsulta.SQL.Add(' JOIN pessoa p ON d.idpessoa = p.idpessoa');
      qryConsulta.SQL.Add(' JOIN (SELECT HC.IDPESSOA,');
      qryConsulta.SQL.Add(' (CASE');
      qryConsulta.SQL.Add(' WHEN TRUNC((TO_DATE(MAX(HC.MESREFERENCIA), '+QuotedStr('YYYY/MM')+') - TO_DATE(MIN(HC.MESREFERENCIA), '+QuotedStr('YYYY/MM')+')) / 365.25) <11 then 0.05');
      qryConsulta.SQL.Add(' WHEN TRUNC((TO_DATE(MAX(HC.MESREFERENCIA), '+QuotedStr('YYYY/MM')+') - TO_DATE(MIN(HC.MESREFERENCIA), '+QuotedStr('YYYY/MM')+')) / 365.25) >=11');
      qryConsulta.SQL.Add(' AND TRUNC((TO_DATE(MAX(HC.MESREFERENCIA), '+QuotedStr('YYYY/MM')+') - TO_DATE(MIN(HC.MESREFERENCIA), '+QuotedStr('YYYY/MM')+')) / 365.25) <16 then 0.10');
      qryConsulta.SQL.Add(' WHEN TRUNC((TO_DATE(MAX(HC.MESREFERENCIA), '+QuotedStr('YYYY/MM')+') - TO_DATE(MIN(HC.MESREFERENCIA), '+QuotedStr('YYYY/MM')+')) / 365.25) >=16');
      qryConsulta.SQL.Add(' AND TRUNC((TO_DATE(MAX(HC.MESREFERENCIA), '+QuotedStr('YYYY/MM')+') - TO_DATE(MIN(HC.MESREFERENCIA), '+QuotedStr('YYYY/MM')+')) / 365.25) <21  then 0.15');
      qryConsulta.SQL.Add(' WHEN TRUNC((TO_DATE(MAX(HC.MESREFERENCIA), '+QuotedStr('YYYY/MM')+') - TO_DATE(MIN(HC.MESREFERENCIA), '+QuotedStr('YYYY/MM')+')) / 365.25) >=21 then 0.20');
      qryConsulta.SQL.Add(' END) AS PERC');
      qryConsulta.SQL.Add(' FROM HSTCONTRIBPREV HC');
      qryConsulta.SQL.Add(' WHERE SUBSTR(HC.MESREFERENCIA, 6, 7) <> '+QuotedStr('13'));
      qryConsulta.SQL.Add(' AND (hc.idpessoa IN (SELECT bf1.idpessoa');
      qryConsulta.SQL.Add(' FROM benefbfciario bf1');
      qryConsulta.SQL.Add(' WHERE bf1.idbeneficio IN (323,478,458,510,523,524,526,378,418,231,277,493,516,528,590,591) AND');//Fanuel Junior SOL173351 Kintana1563796
      qryConsulta.SQL.Add(' bf1.idplanoprev IN (2,74,66) AND');
      qryConsulta.SQL.Add(' EXISTS (SELECT 1');
      qryConsulta.SQL.Add(' FROM hstbenefbfciario hb1');
      qryConsulta.SQL.Add(' WHERE hb1.IDPLANOPREV = bf1.idplanoprev AND hb1.IDBENEFICIO = bf1.idbeneficio AND');
      qryConsulta.SQL.Add(' hb1.NUMEROPROCESSO = bf1.numeroprocesso AND hb1.IDPESSJUR = bf1.idpessjur AND');
      qryConsulta.SQL.Add(' hb1.IDTITULAR = bf1.idtitular AND hb1.IDPLANOORIGEM = bf1.idplanoorigem AND');
      qryConsulta.SQL.Add(' hb1.IDPESSOA = bf1.idpessoa AND hb1.SEQPROPOSTA = bf1.seqproposta AND');
      qryConsulta.SQL.Add(' hb1.mes = '+QuotedStr(sPeriodo)+')');
      qryConsulta.SQL.Add(' UNION');
      qryConsulta.SQL.Add(' SELECT hm1.idpessoa');
      qryConsulta.SQL.Add(' FROM histmovreserva hm1');
      qryConsulta.SQL.Add(' WHERE hm1.idbeneficio IS NOT NULL  AND');
      qryConsulta.SQL.Add(' hm1.idplanoprev IN (2,74,66)');
      qryConsulta.SQL.Add(' AND Hm1.DATAALIMENTACAO >='+QuotedStr(sDtInicial));
      qryConsulta.SQL.Add(' AND hm1.DATAALIMENTACAO <='+QuotedStr(sDtFinal)+'))');
      qryConsulta.SQL.Add(' GROUP BY HC.IDPESSOA) TEMPO  ON d.IDPESSOA = TEMPO.IDPESSOA');
      qryConsulta.SQL.Add(' LEFT JOIN benefbfciario bf ON d.idpessoa = bf.idpessoa AND');
      qryConsulta.SQL.Add(' d.idtitular = bf.idtitular AND');
      qryConsulta.SQL.Add(' bf.idbeneficio IN (323,478,458,510,523,524,526,378,418,231,277,493,516,528,590,591) AND');//Fanuel Junior SOL173351 Kintana1563796
      qryConsulta.SQL.Add(' bf.idplanoprev IN (2,74,66) AND');
      qryConsulta.SQL.Add(' EXISTS (SELECT 1');
      qryConsulta.SQL.Add(' FROM hstbenefbfciario hb');
      qryConsulta.SQL.Add(' WHERE hb.IDPLANOPREV = bf.idplanoprev AND hb.IDBENEFICIO = bf.idbeneficio AND');
      qryConsulta.SQL.Add(' hb.NUMEROPROCESSO = bf.numeroprocesso AND hb.IDPESSJUR = bf.idpessjur AND');
      qryConsulta.SQL.Add(' hb.IDTITULAR = bf.idtitular AND hb.IDPLANOORIGEM = bf.idplanoorigem AND');
      qryConsulta.SQL.Add(' hb.IDPESSOA = bf.idpessoa AND hb.SEQPROPOSTA = bf.seqproposta AND');
      qryConsulta.SQL.Add(' hb.IDPLANOPREV = bf.idplanoprev AND hb.IDBENEFICIO = bf.idbeneficio AND');
      qryConsulta.SQL.Add(' hb.mes = '+QuotedStr(sPeriodo)+')');
      qryConsulta.SQL.Add(' LEFT JOIN Planprevcontabil ppc ON bf.idplanprevcontab = ppc.idplanoprev');
      qryConsulta.SQL.Add(' LEFT JOIN beneficio b ON bf.idbeneficio = b.idbeneficio');
      qryConsulta.SQL.Add(' WHERE');
      qryConsulta.SQL.Add(' (EXISTS (SELECT 1');
      qryConsulta.SQL.Add(' FROM histmovreserva hm');
      qryConsulta.SQL.Add(' WHERE hm.idpessoa = d.idpessoa AND');
      qryConsulta.SQL.Add(' hm.idbeneficio = bf.idbeneficio AND hm.idplanoprev = bf.idplanoprev');
      qryConsulta.SQL.Add(' AND Hm.DATAALIMENTACAO >='+QuotedStr(sDtInicial));
      qryConsulta.SQL.Add(' AND hm.DATAALIMENTACAO <='+QuotedStr(sDtFinal)+') OR');
      qryConsulta.SQL.Add(' EXISTS (SELECT 1');
      qryConsulta.SQL.Add(' FROM hstbenefbfciario hb');
      qryConsulta.SQL.Add(' WHERE hb.IDPLANOPREV = bf.idplanoprev AND');
      qryConsulta.SQL.Add(' hb.IDBENEFICIO = bf.idbeneficio AND hb.NUMEROPROCESSO = bf.numeroprocesso AND');
      qryConsulta.SQL.Add(' hb.IDPESSJUR = bf.idpessjur AND  hb.IDTITULAR = bf.idtitular AND');
      qryConsulta.SQL.Add(' hb.IDPLANOORIGEM = bf.idplanoorigem AND hb.IDPESSOA = bf.idpessoa AND');
      qryConsulta.SQL.Add(' hb.SEQPROPOSTA = bf.seqproposta AND hb.mes = '+QuotedStr(sPeriodo)+'))');
      qryConsulta.SQL.Add(' ) QRI ORDER BY MATRICULA) QR2');
      qryConsulta.Open;
      iTotalLinhas := qryConsulta.RecordCount;

{      qryConsulta.First;
      While not qryConsulta.Eof do
      begin
          if (qryConsulta.FieldByName('VALORRETIRADO').isnull) then
          begin
              qryConsulta.edit;
              qryConsulta.FieldByName('VALORRETIRADO').Value := 0;
              qryConsulta.post;
          end;
          qryConsulta.Next;
      end;   }



      qryConsulta.First;
      conta := 0;
      While not qryConsulta.Eof do
      begin
        //conta := conta + qryConsulta.FieldValues['TOTAL_RETIRADO'];
        conta := conta + qryConsulta.FieldByName('VALORRETIRADO').asFloat ;
        qryConsulta.Next;
      end;
      dTotalValorReal := conta;

      conta := 0;
      qryConsulta.First;

      While not qryConsulta.Eof do
      begin
        //conta := conta + qryConsulta.FieldValues['VALOR_COTAS'];
        conta := conta + qryConsulta.FieldByName('VALORCOTAS').asFloat ;
        qryConsulta.Next;
      end;
      dTotalValorCotas := conta;

      qryConsulta.First;
      conta := 0;

      While not qryConsulta.Eof do
      begin
        //conta := conta + qryConsulta.FieldValues['VALOR_PAGO'];
        conta := conta + qryConsulta.FieldByName('VALORPAGO').asFloat ;
        qryConsulta.Next;
      end;
      dTotalFolha := conta;
      qryConsulta.First;

      qryConsulta.First;
      conta := 0;
      While not qryConsulta.Eof do
      begin
        conta := conta + qryConsulta.FieldByName('DIFERENCA').asFloat ;
        qryConsulta.Next;
      end;
      dDiferenca := conta;


      sInicial := sDtInicial;
      sFinal := sDtFinal;




      if (qryConsulta.Recordcount = 0) then
      Begin
            MessageDlg('Não existe relatório para o período indicado.',mtWarning,[mbOk],0);
            cbDtFinal.SetFocus;
            Self.ModalResult := mrNone;
            Exit;
      End;

  end;


end;

procedure TfrmConciliaInstResgPort.FormShow(Sender: TObject);
begin
    inherited;
    qryPeriodo.Close;
    qryPeriodo.SQL.Clear;
    qryPeriodo.SQL.Add('SELECT (PEREXERCICIO ||'+QuotedStr('/')+'||');
    qryPeriodo.SQL.Add('(CASE WHEN PERNUMERO < 10 THEN '+QuotedStr('0')+'||PERNUMERO WHEN PERNUMERO >=10 THEN '+QuotedStr('')+'||PERNUMERO END)');
    qryPeriodo.SQL.Add( ') AS PERIODO, PERDATINI, PERDATFIM  FROM PERIODO' );
    qryPeriodo.SQL.Add(' ORDER BY PEREXERCICIO DESC, PERNUMERO ');
    qryPeriodo.Open;
    qryPeriodo.first;

    while not qryPeriodo.eof do
    begin
        cbDtInicial.items.add(qryPeriodo.FieldByName('PERIODO').AsString);
        cbDtFinal.items.add(qryPeriodo.FieldByName('PERIODO').AsString);
        qryPeriodo.next;
    end;
end;


procedure TfrmConciliaInstResgPort.verificaCampo(Sender: TObject);
begin
  inherited;
  if not ValorValido(TwwDBComboBox(sender).text) then
  TwwDBComboBox(sender).clear;
end;

function TfrmConciliaInstResgPort.valorValido(sValor: String): boolean;
begin
    qryPeriodo.first;
    result := false;
    while not qryPeriodo.eof do
    begin
        if(qryPeriodo.FieldByName('PERIODO').AsString = sValor) then
            result := true;
        qryPeriodo.next;
    end;
end;

end.
