// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 07.07.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO 
//------------------------------------------------------------------------------
unit FPRelFechaInterfAdmPrev;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook, Spin;

type
  TfrmPRelFechaInterfAdmPrev = class(TfrmOkCancelar)
    grpMesAnoRef: TGroupBox;
    cmbMesRef: TComboBox;
    spedAnoRef: TSpinEdit;
    Label1: TLabel;
    dblkpcmbPatro: TwwDBLookupCombo;
    Label2: TLabel;
    dblkpcmbPlano: TwwDBLookupCombo;
    qryPatro: TwwQuery;
    qryPlanPREV: TwwQuery;
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
  frmPRelFechaInterfAdmPrev: TfrmPRelFechaInterfAdmPrev;

implementation

uses DRelatorios, UMensErro, uAdmPrev;

{$R *.DFM}

procedure TfrmPRelFechaInterfAdmPrev.FormShow(Sender: TObject);
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

procedure TfrmPRelFechaInterfAdmPrev.qryPatroAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  if not qryPatro.Active then Exit;

  qryPlanPrev.Close;
  qryPlanPrev.ParamByName('IdPessJur').AsInteger := qryPatro.FieldByName('IdPessoa').AsInteger;
  qryPlanPrev.Open;
end;

procedure TfrmPRelFechaInterfAdmPrev.dblkpcmbPatroCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryPlanPrev.Close;
  qryPlanPrev.ParamByName('IdPessJur').AsInteger := qryPatro.FieldByName('IdPessoa').AsInteger;
  qryPlanPrev.Open;
end;

procedure TfrmPRelFechaInterfAdmPrev.bbtnConfirmarClick(Sender: TObject);
var sAno, sMesReferencia, sAnoMesReferencia, sEnd , sFiltroPatro, sFiltroPlano : string;
    i : Integer;
begin
  inherited;
  if Trim(cmbMesRef.Text) = ''
  then begin
     MsgDlg('Mês de Referência não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
     Exit;
  end;

  if (Trim(dblkpcmbPatro.Text) = '')
  then begin
     MsgDlg('Selecione a Patrocinadora. ','Erro',mtError,[mbOk,mbHelp],0);
     Exit;
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

     lblTitulo.Caption := 'Fechamento Interface x AdmPrev - Mês : '+Trim(cmbMesRef.Text)+' / '+Trim(spedAnoRef.Text);

     if  (Trim(dblkpcmbPatro.Text) = '')
     then sFiltroPatro :=  ' T.IDPESSJUR'
     else begin
        sFiltroPatro := qryPatro.FieldByName('IdPessoa').AsString;
     end;

     if  (Trim(dblkpcmbPlano.Text) = '')
     then sFiltroPlano :=  ' T.IDPLANOPREV'
     else begin
        sFiltroPlano := qryPlanPrev.FieldByName('IdPlanoPrev').AsString;
     end;

     with qryFechaInterfaceAmPrev do
     begin
        Close;
        SQL.Clear;
        SQL.Add(' SELECT NVL(A.VALOR,0) VALORTMP , NVL(B.VALOR,0) VALORHST , C.NOME, PL.NOME,               '+
                '        '''+sAnoMesReferencia+''' MESCOBRANCA, '''+Trim(dblkpcmbPatro.Text)+''' NOMEPATRO, '+
                '        ABS(NVL(A.VALOR,0) - NVL(B.VALOR,0) ) DIF                                          '+
                ' FROM                                                                                      '+
                '       ( SELECT SUM(T.VALORRECEBIDO) VALOR, T.IDDESCONTO IDCONTRIBUICAO,                   '+
                '                T.IDPLANOPREV                                                              '+
                '         FROM   TMPDESC T, PATRO PT                                                        '+
                '         WHERE  PT.IDFUNDACAO = '+IntToStr(iIdFundacao)                                     + 
                '         AND    T.IDPESSJUR   = PT.IDPESSOA                                                '+
                '         AND    T.MESREFERENCIA = T.MESREFERENCIA                                          '+
                '         AND    T.IDPESSJUR = '+sFiltroPatro                                                +
                '         AND    T.MESCOBRANCA = '''+sAnoMesReferencia+'''                                  '+
                '         AND    T.IDPLANOPREV = '+sFiltroPlano                                              +
                '         AND    T.FLGDESCFOLHA = ''P''                                                     '+
                '         GROUP BY T.IDDESCONTO, T.IDPLANOPREV) A,                                          '+
                '       ( SELECT SUM(T.VALORRECEBIDO) VALOR, T.IDCONTRIBUICAO, T.IDPLANOPREV                '+
                '         FROM   HSTCONTRIBPREV T, PATRO PT                                                 '+
                '         WHERE  PT.IDFUNDACAO = '+IntToStr(iIdFundacao)                                     + 
                '         AND    T.IDPESSJUR   = PT.IDPESSOA                                                '+
                '         AND    T.IDPESSJUR = '+sFiltroPatro                                                +
                '         AND    T.IDPLANOPREV = '+sFiltroPlano                                              +
                '         AND    T.MESCOBRANCA = '''+sAnoMesReferencia+'''                                  '+
                '         AND    T.FOLHAORIGEM = ''P''                                                      '+
                '         GROUP BY T.IDCONTRIBUICAO, T.IDPLANOPREV) B,                                      '+
                '       CONTRIBUICAO C, PLANPREV PL                                                         '+
                'WHERE A.IDCONTRIBUICAO = B.IDCONTRIBUICAO                                                  '+
                'AND   C.IDCONTRIBUICAO = B.IDCONTRIBUICAO                                                  '+
                'AND   A.IDPLANOPREV = B.IDPLANOPREV                                                        '+
                'AND   PL.IDPLANOPREV = A.IDPLANOPREV                                                       '+
                'ORDER BY PL.NOME , C.NOME                                                                  ');
        Open;
     end;

   end;

end;

end.
