// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 08.07.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
unit FPRelTmpContribAnalit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Spin, Db, DBTables, Wwquery, TREdit;

type
  TfrmPRelTmpContribAnalit = class(TfrmOkCancelar)
    qryPatro: TwwQuery;
    qryPlanPREV: TwwQuery;
    grpMesAnoRef: TGroupBox;
    cmbMesRef: TComboBox;
    spedAnoRef: TSpinEdit;
    grpSelPatro: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dblkpcmbPatro: TwwDBLookupCombo;
    dblkpcmbPlano: TwwDBLookupCombo;
    chkDivergentes: TCheckBox;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    edmatini: TEdit;
    edmatfim: TEdit;
    Label5: TLabel;
    redvalor: TRealEdit;
    procedure FormShow(Sender: TObject);
    procedure qryPatroAfterScroll(DataSet: TDataSet);
    procedure dblkpcmbPatroCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPRelTmpContribAnalit: TfrmPRelTmpContribAnalit;

implementation

uses  UMensErro, UAdmPrev, dRelatorios, USistema;

{$R *.DFM}

procedure TfrmPRelTmpContribAnalit.FormShow(Sender: TObject);
var
  AYear, AMonth, ADay: Word;
  sAno : string;
begin
  inherited;
  DecodeDate(date, AYear, AMonth, ADay);
  if (AMonth >= 1) and (AMonth <= 12)
  then begin
     cmbMesRef.ItemIndex := AMonth - 1;
     cmbMesRef.Text := cmbMesRef.Items[cmbMesRef.ItemIndex];
  end;
  spedAnoRef.Text   := IntToStr(AYear);
  qryPatro.Close;
  qryPatro.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; 
  qryPatro.Open;
end;

procedure TfrmPRelTmpContribAnalit.qryPatroAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if not qryPatro.Active then Exit;

  qryPlanPrev.Close;
  qryPlanPrev.ParamByName('IdPessJur').AsInteger := qryPatro.FieldByName('IdPessoa').AsInteger;
  qryPlanPrev.Open;

end;

procedure TfrmPRelTmpContribAnalit.dblkpcmbPatroCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryPlanPrev.Close;
  qryPlanPrev.ParamByName('IdPessJur').AsInteger := qryPatro.FieldByName('IdPessoa').AsInteger;
  qryPlanPrev.Open;

end;

procedure TfrmPRelTmpContribAnalit.bbtnConfirmarClick(Sender: TObject);
var sAno, sMesReferencia, sAnoMesReferencia, sEnd , sFiltroPatro : string;
begin
  inherited;
  if Trim(cmbMesRef.Text) = ''
  then begin
     MsgDlg('Mês de Referência não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
     Exit;
  end;

  if Trim(dblkpcmbPatro.Text) = ''
  then begin
     MsgDlg('Patrocinadora não preenchida. ','Erro',mtError,[mbOk,mbHelp],0);
     Exit;
  end;

  if (trim(edmatini.text) = '') or (trim(edmatfim.text) = '') then
  if MsgDlg(' O montagem do relatório pode ser demorada, '+
            'pois a faixa de matrículas não foi preenchida completamente. Deseja continuar? ', 'Confirmação',
            mtConfirmation, [mbNo, mbYes], 0) = mrNo then
            begin
               edmatini.setfocus;
               exit;
            end;

  sAno := Trim(spedAnoRef.Text);
  if cmbMesRef.ItemIndex <= 8
  then sMesReferencia := '0'+IntToStr(cmbMesRef.ItemIndex+1)
  else sMesReferencia := IntToStr(cmbMesRef.ItemIndex+1);
  sAnoMesReferencia   := sAno+'/'+sMesReferencia;

   // Filtrar apenas as contribuições com motivo = cobrança de contribuição normal
   with dtmRelatorios do
   begin
     //  OBTER DADOS DA FUNDAÇÃO
     qryFundacao.Close;
     qryFundacao.ParamByName('pFundacao').asinteger;
     qryFundacao.ParamByName('pFundacao').asinteger := iIdFundacao;
     qryFundacao.Prepare;
     qryFundacao.Open;

     qryHistContribAnalit.Close;
     qryHistContribAnalit.SQL.Clear;
     qryHistContribAnalit.SQL.Add(' SELECT T.MATRICULA, P.NOME AS PARTICIPANTE, C.NOME AS CONTRIBUICAO, '+
        '       PAT.NOME AS PATROCINADORA, PL.NOME AS PLANO,        '+
        '       T.MESREFERENCIA, T.MESCOBRANCA, NVL(T.VALORRECEBIDO,0) VALORRECEBIDO, NVL(T.VALOR,0) VALORESPERADO,    '+
        '       (NVL(T.VALORRECEBIDO,0) - NVL(T.VALOR,0)) AS DIFERENCA        '+
        'FROM   TMPDESC T ,PESSOA P, PESSOA PAT, PLANPREV PL, CONTRIBUICAO C  '+
        'WHERE  T.IDPESSJUR     = '+qryPatro.FieldByName('IdPessoa').AsString );

     if Trim(dblkpcmbPlano.Text) <> '' then
        qryHistContribAnalit.SQL.Add('AND    T.IDPLANOPREV   = '+qryPlanPrev.FieldByName('IdPlanoPrev').AsString);

     if trim(edmatini.text) <> '' then
        qryHistContribAnalit.SQL.Add(' AND   T.MATRICULA    >= '+edmatini.text+'');

     if trim(edmatfim.text) <> '' then
        qryHistContribAnalit.SQL.Add(' AND   T.MATRICULA    <= '+edmatfim.text+'');

     if redvalor.Value > 0 then
        qryHistContribAnalit.SQL.Add(' AND ABS(T.VALOR - T.VALORRECEBIDO) > '+oranumero(formatfloat('#0.00',redvalor.value))+' ');

     qryHistContribAnalit.SQL.Add('AND    T.MESCOBRANCA = '''+sAnoMesReferencia+'''  '+
     'AND    T.FLGDESCFOLHA =  ''P'' '+
     'AND    PAT.IDPESSOA      = T.IDPESSJUR           '+
     'AND    P.IDPESSOA        = T.IDPESSOA          '+
     'AND    PL.IDPLANOPREV    = T.IDPLANOPREV         '+
     'AND    C.IDCONTRIBUICAO  = T.IDDESCONTO               ');

    if chkDivergentes.Checked
    then begin
       qryHistContribAnalit.SQL.Add(' AND ((T.VALORRECEBIDO = 0) OR (T.VALOR <> T.VALORRECEBIDO) )');
    end;


    qryHistContribAnalit.SQL.Add('ORDER BY T.IDPLANOPREV, T.MATRICULA, T.MESREFERENCIA ');
    qryHistContribAnalit.Open;
  end;
end;

end.
