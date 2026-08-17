// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 07.07.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO 
//------------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : Leo
// Data        : 03/07/2002
// Alteração   : alteração na query da consulta,  trocando o where de mesreferencia por mescobranca
//------------------------------------------------------------------------------


unit FPRelHistContribAnalit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Spin, Db, DBTables, Wwquery;

type
  TfrmPRelHistContribAnalit = class(TfrmOkCancelar)
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
  frmPRelHistContribAnalit: TfrmPRelHistContribAnalit;

implementation

uses DRelatAdmPREV2, UMensErro, UAdmPrev;

{$R *.DFM}

procedure TfrmPRelHistContribAnalit.FormShow(Sender: TObject);
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

procedure TfrmPRelHistContribAnalit.qryPatroAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if not qryPatro.Active then Exit;

  qryPlanPrev.Close;
  qryPlanPrev.ParamByName('IdPessJur').AsInteger := qryPatro.FieldByName('IdPessoa').AsInteger;
  qryPlanPrev.Open;

end;

procedure TfrmPRelHistContribAnalit.dblkpcmbPatroCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryPlanPrev.Close;
  qryPlanPrev.ParamByName('IdPessJur').AsInteger := qryPatro.FieldByName('IdPessoa').AsInteger;
  qryPlanPrev.Open;

end;

procedure TfrmPRelHistContribAnalit.bbtnConfirmarClick(Sender: TObject);
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

  if Trim(dblkpcmbPlano.Text) = ''
  then begin
     MsgDlg('Plano não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
     Exit;
  end;

  sAno := Trim(spedAnoRef.Text);
  if cmbMesRef.ItemIndex <= 8
  then sMesReferencia := '0'+IntToStr(cmbMesRef.ItemIndex+1)
  else sMesReferencia := IntToStr(cmbMesRef.ItemIndex+1);
  sAnoMesReferencia   := sAno+'/'+sMesReferencia;

   // Filtrar apenas as contribuições com motivo = cobrança de contribuição normal
   with dtmRelatAdmPrev2 do
   begin
     //  OBTER DADOS DA FUNDAÇÃO
     qryFundacao.Close;
     qryFundacao.ParamByName('pFundacao').asinteger;
     qryFundacao.ParamByName('pFundacao').asinteger := iIdFundacao;
     qryFundacao.Prepare;
     qryFundacao.Open;

     qryHistContribAnalit.Close;
     qryHistContribAnalit.SQL.Clear;
     qryHistContribAnalit.SQL.Add(' SELECT EL.MATRICULA, P.NOME AS PARTICIPANTE, C.NOME AS CONTRIBUICAO, '+
        '       PAT.NOME AS PATROCINADORA, PL.NOME AS PLANO,                                             '+
        '       HST.MESREFERENCIA, HST.MESCOBRANCA, HST.VALORRECEBIDO, HST.VALORESPERADO,                '+
        '       (NVL(HST.VALORRECEBIDO,0) - NVL(HST.VALORESPERADO,0)) AS DIFERENCA,                                    '+
        '       DECODE(NVL(HST.VALORRECEBIDO,0), 0, ''Não Recebida'',                                           '+
        '                                 DECODE(HST.SITRECEBIMENTO, 0, ''Não Enviadas'',                '+
        '                                                            1, ''Não Recebida'',                '+
        '                                                            2, ''Recebidas OK'',                '+
        '                                                            3, ''Divergente'',                  '+
        '                                                            4, ''Divergente'',                  '+
        '                                                            5, ''Divergente'',                  '+
        '                                                            6, ''Divergente'',                  '+
        '                                                            7, ''Renegociada'',                 '+
        '                                                            8, ''Canceladas'',                  '+
        '                                                            9, ''Divergente'',                  '+
                                                                    '''Outros'') ) AS SITUACAO, HST.IDCONTRIBUICAO             '+
        'FROM   PESSOA P, PESSOA PAT, PLANPREV PL, CONTRIBUICAO C, ELEGPATRO EL, HSTCONTRIBPREV HST      '+
        'WHERE  HST.IDPESSJUR     = '+qryPatro.FieldByName('IdPessoa').AsString                           +
        'AND    HST.IDPLANOPREV   = '+qryPlanPrev.FieldByName('IdPlanoPrev').AsString                     +
        'AND    HST.MESCOBRANCA = '''+sAnoMesReferencia+'''                                            '+
        'AND    EL.IDPESSJUR      = HST.IDPESSJUR                                                        '+
        'AND    EL.IDPESSOA       = HST.IDPESSOA                                                         '+
        'AND    PAT.IDPESSOA      = HST.IDPESSJUR                                                        '+
        'AND    P.IDPESSOA        = HST.IDPESSOA                                                         '+
        'AND    PL.IDPLANOPREV    = HST.IDPLANOPREV                                                      '+
        'AND    C.IDCONTRIBUICAO  = HST.IDCONTRIBUICAO                                                   ');

       if chkDivergentes.Checked
       then begin
          qryHistContribAnalit.SQL.Add(' AND ((NVL(HST.VALORRECEBIDO,0) = 0) OR (NVL(HST.VALORESPERADO,0) <> NVL(HST.VALORRECEBIDO,0)) )');
       end;

     qryHistContribAnalit.SQL.Add(' UNION ALL '+
        '       SELECT EL.MATRICULA, P.NOME AS PARTICIPANTE, TA.DESCRICAO AS CONTRIBUICAO, '+
        '       PAT.NOME AS PATROCINADORA, PL.NOME AS PLANO,                                             '+
        '       HA.MESREFERENCIA, HA.MESCOBRANCA, HA.VALORRECEBIDO, HA.VALOR VALORESPERADO,                '+
        '       (NVL(HA.VALORRECEBIDO,0) - NVL(HA.VALOR,0)) AS DIFERENCA,                                    '+
        '       DECODE(NVL(HST.VALORRECEBIDO,0), 0, ''Não Recebida'',                                           '+
        '                                 DECODE(HST.SITRECEBIMENTO, 0, ''Não Enviadas'',                '+
        '                                                            1, ''Não Recebida'',                '+
        '                                                            2, ''Recebidas OK'',                '+
        '                                                            3, ''Divergente'',                  '+
        '                                                            4, ''Divergente'',                  '+
        '                                                            5, ''Divergente'',                  '+
        '                                                            6, ''Divergente'',                  '+
        '                                                            7, ''Renegociada'',                 '+
        '                                                            8, ''Canceladas'',                  '+
        '                                                            9, ''Divergente'',                  '+
                                                                    '''Outros'') ) AS SITUACAO, HST.IDCONTRIBUICAO             '+
        'FROM   PESSOA P, PESSOA PAT, PLANPREV PL, CONTRIBUICAO C, ELEGPATRO EL, HSTCONTRIBPREV HST ,     '+
        '       HSTATRASOCONTRIB HA , TIPOALTERADOR TA '+
        'WHERE  HST.IDPESSJUR     = '+qryPatro.FieldByName('IdPessoa').AsString                           +
        'AND    HST.IDPLANOPREV   = '+qryPlanPrev.FieldByName('IdPlanoPrev').AsString                     +
        'AND    HST.MESCOBRANCA = '''+sAnoMesReferencia+'''                                            '+
        'AND    EL.IDPESSJUR      = HST.IDPESSJUR                                                        '+
        'AND    EL.IDPESSOA       = HST.IDPESSOA                                                         '+
        'AND    PAT.IDPESSOA      = HST.IDPESSJUR                                                        '+
        'AND    P.IDPESSOA        = HST.IDPESSOA                                                         '+
        'AND    PL.IDPLANOPREV    = HST.IDPLANOPREV                                                      '+
        'AND    C.IDCONTRIBUICAO  = HST.IDCONTRIBUICAO                                                   '+
        'AND    HA.NUMRECEBIMENTO = HST.NUMRECEBIMENTO                                                   '+
        'AND    HA.MESREFERENCIA = HST.MESREFERENCIA                                                     '+
        'AND    HA.MESCOBRANCA = HST.MESCOBRANCA                                                         '+
        'AND    TA.CODALTERADOR = HA.CODALTERADOR                                                        ');

       if chkDivergentes.Checked
       then begin
          qryHistContribAnalit.SQL.Add(' AND ((NVL(HA.VALORRECEBIDO,0) = 0) OR (NVL(HA.VALOR,0) <> NVL(HA.VALORRECEBIDO,0)) )');
       end;
       qryHistContribAnalit.SQL.Add('ORDER BY MATRICULA, IDCONTRIBUICAO ');

       qryHistContribAnalit.Open;
   end;

end;

end.
