// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 07.07.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO 
//------------------------------------------------------------------------------
unit FPRelDivergContrib;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Spin, Db, DBTables, Wwquery;

type
  TfrmPRelDivergContrib = class(TfrmOkCancelar)
    qryPatro: TwwQuery;
    qryPlanPatro: TwwQuery;
    grpMesAnoRef: TGroupBox;
    cmbMesRef: TComboBox;
    spedAnoRef: TSpinEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    dblkpcmbPatro: TwwDBLookupCombo;
    Label2: TLabel;
    dblkpcmbPlano: TwwDBLookupCombo;
    rgrpTipoDiverg: TRadioGroup;
    rgrpFormaCobranca: TRadioGroup;
    chkTratadas: TCheckBox;
    procedure dblkpcmbPatroCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPRelDivergContrib: TfrmPRelDivergContrib;

implementation

uses DRelatAdmPrev, UAdmPrev, UMensErro;

{$R *.DFM}

procedure TfrmPRelDivergContrib.dblkpcmbPatroCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryPlanPatro.Close;
  qryPlanPatro.ParamByName('IdPessJur').AsInteger := qryPatro.FieldByName('IdPessoa').AsInteger;
  qryPlanPatro.Open; 

end;

procedure TfrmPRelDivergContrib.FormShow(Sender: TObject);
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
  qryPlanPatro.Close;
  qryPlanPatro.ParamByName('IdPessJur').AsInteger := qryPatro.FieldByName('IdPessoa').AsInteger;
  qryPlanPatro.Open;

end;

procedure TfrmPRelDivergContrib.bbtnConfirmarClick(Sender: TObject);
var sAno, sMesReferencia, sAnoMesReferencia, sEnd , sFiltroPatro : string;
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

   with dtmRelatAdmPrev do
   begin
     //  OBTER DADOS DA FUNDAÇÃO
     qryFundacao.Close;
     qryFundacao.ParamByName('pFundacao').asinteger;
     qryFundacao.ParamByName('pFundacao').asinteger := iIdFundacao;
     qryFundacao.Prepare;
     qryFundacao.Open;

     lblTitDivergContrib.Caption := 'Relatório Mensal de Divergências - Mês Cob. : '+Trim(cmbMesRef.Text)+' / '+Trim(spedAnoRef.Text);


     case rgrpTipoDiverg.ItemIndex of
          0 : rpDivergSubTitulo.Caption   := 'Todas as Divergências';           // TODAS
          1 : rpDivergSubTitulo.Caption   := 'Contribuições Não Recebidas';     // APENAS AS NAO RECEBIDAS
          2 : rpDivergSubTitulo.Caption   := 'Contribuições Recebidas a Menor'; // APENAS AS RECEBIDAS A MENOR
          3 : rpDivergSubTitulo.Caption   := 'Contribuições Recebidas a Maior'; // APENAS AS RECEBIDAS A MAIOR
     end;

     case rgrpFormaCobranca.ItemIndex of
          1 : rpDivergSubTitulo.Caption   := rpDivergSubTitulo.Caption + ' - Cobradas via Folha da Patrocinadora'; // APENAS AS COBRADAS VIA FOLHA DA PATRO
          2 : rpDivergSubTitulo.Caption   := rpDivergSubTitulo.Caption + ' - Cobradas via Folha de Benefício';     // APENAS AS COBRADAS VIA FOLHA DE BENEFICIO
          3 : rpDivergSubTitulo.Caption   := rpDivergSubTitulo.Caption + ' - Cobradas via Banco';                  // APENAS AS COBRADAS VIA BANCO
     end;

     qryDivergContrib.Close;
     qryDivergContrib.SQL.Clear;
     qryDivergContrib.SQl.Add(' SELECT DECODE(REG.NOME,'''',''Regional não Identificada'',REG.NOME) AS REGIONAL,      '+
                              '        P.NOME AS NOMEPARTICIP, C.NOMERESUM AS NOMECONTRIB, PAT.NOME AS NOMEPATRO,     '+
                              '        PL.NOME AS NOMEPLANO,                                                          '+
                              '        HST.IDPESSJUR, HST.IDPLANOPREV, HST.IDPESSOA,  HST.SEQPROPOSTA,                '+
                              '        SP.FLGINTERNO,                                                                 '+
                              '        HST.MESREFERENCIA,      HST.MESCOBRANCA,       HST.VALORESPERADO,              '+
                              '        DECODE(HST.VALORRECEBIDO,NULL,0,HST.VALORRECEBIDO) AS VALORRECEBIDO,           '+
                              '        ( DECODE(HST.VALORRECEBIDO,NULL,0,HST.VALORRECEBIDO) -                         '+
                              '          DECODE(HST.VALORESPERADO,NULL,0,HST.VALORESPERADO) ) AS DIFERENCA,           '+
                              '        HST.FLGCALCRESERVA,                                                            '+
                              '        DECODE(HST.OPTRATDIVERG, 1, ''Cobrar Diferença via Interface'',                '+
                              '                     		       2, ''Cobrar Diferença via Cobrança Bancária'',        '+
                              '                                 3, ''Descontar no Próximo Benefício'',                '+
                              '                                 4, ''Devolver Diferença via Interface'',              '+
                              '                                 5, ''Devolver Diferença via Devolução Bancária'',     '+
                              '                                 6, ''Acrescentar no Próximo Benefício'',              '+
                              '                                 7, ''Adicionar Diferença como Aporte'',               '+
                              '                                 8, ''Ignorar Diferença'',                             '+
                              '                                    ''Divergência Não Tratada'' ) AS TRATAMENTO,       '+
                              '       EL.MATRICULA,           EL.DATAADMISSAO,       PP.INSCRICAONUMERO,              '+
                              '       PP.INSCRICAODATA,                                                               '+
                              '       PP.DTINICIOINSC,                                                                '+
                              '       DECODE(HST.SITRECEBIMENTO, ''0'', ''Não Enviadas'',                             '+
                              '                                  ''1'', ''Não Recebidas'',                            '+
                              '                                  ''2'', ''Recebidas sem Divergência'',                '+
                              '                                  ''3'', ''Recebidas com Divergência(NT)'',            '+
                              '                                  ''4'', ''Recebidas com Divergência(T)'',             '+
                              '                                  ''8'', ''Canceladas'',                               '+
                              '                                  ''9'', ''Atrasadas a cobrar na Folha Benef. '',      '+
                              '                                  ''Outros'')                                          '+
                              'FROM   PESSOA P,               CONTRIBUICAO C,        HSTCONTRIBPREV HST,              '+
                              '       ELEGPATRO EL,           PARTPREVPLAN PP,       PLANPREV PL,                     '+
                              '       PESSOA PAT,             PESSOA REG,            SITPART SP                       '+
                              'WHERE (HST.IDPESSJUR   = '+qryPatro.FieldByName('IdPessoa').AsString+')');

     if Trim(dblkpcmbPlano.Text) <> ''
     then qryDivergContrib.SQl.Add(' AND   (HST.IDPLANOPREV = '+qryPlanPatro.FieldByName('IdPlanoPrev').AsString+')');

     qryDivergContrib.SQL.Add('AND   (  HST.MESCOBRANCA = '''+sAnoMesReferencia+''')' );

     case rgrpTipoDiverg.ItemIndex of
          0 : qryDivergContrib.SQL.Add(' AND ( (HST.VALORESPERADO <> HST.VALORRECEBIDO) OR  (HST.VALORRECEBIDO IS NULL) ) '); // TODAS
          1 : qryDivergContrib.SQL.Add(' AND ( (HST.VALORRECEBIDO = 0)                  OR  (HST.VALORRECEBIDO IS NULL) ) '); // APENAS AS NAO RECEBIDAS
          2 : qryDivergContrib.SQL.Add(' AND (  HST.VALORESPERADO >  HST.VALORRECEBIDO)  ');                                  // APENAS AS RECEBIDAS A MENOR
          3 : qryDivergContrib.SQL.Add(' AND (  HST.VALORESPERADO <  HST.VALORRECEBIDO)  ');                                  // APENAS AS RECEBIDAS A MAIOR
     end;

     case rgrpFormaCobranca.ItemIndex of
          1 : qryDivergContrib.SQL.Add(' AND (  (HST.FLGDESCFOLHA = 1) AND (HST.FOLHAORIGEM = ''P'') ) ');                    // APENAS AS COBRADAS VIA FOLHA DA PATRO
          2 : qryDivergContrib.SQL.Add(' AND (  (HST.FLGDESCFOLHA = 1) AND (HST.FOLHAORIGEM = ''B'') ) ');                    // APENAS AS COBRADAS VIA FOLHA DE BENEFICIO
          3 : qryDivergContrib.SQL.Add(' AND (  HST.FLGDESCFOLHA = 0 )  ');                                                   // APENAS AS COBRADAS VIA BANCO
     end;

     qryDivergContrib.SQL.Add(' AND   (HST.IDPESSJUR   = PP.IDPESSJUR)                '+
                              ' AND   (HST.IDPLANOPREV = PP.IDPLANOPREV)              '+
                              ' AND   (HST.IDPESSOA    = PP.IDPESSOA)                 '+
                              ' AND   (HST.SEQPROPOSTA = PP.SEQPROPOSTA)              '+
                              ' AND   (PP.IDPESSJUR    = EL.IDPESSJUR)                '+
                              ' AND   (PP.IDPESSOA     = EL.IDPESSOA)                 '+
                              ' AND   (PP.IDPLANOPREV  = PL.IDPLANOPREV)              '+
                              ' AND   (EL.IDPESSOA     = P.IDPESSOA)                  '+
                              ' AND   (EL.IDPESSJUR    = PAT.IDPESSOA)                '+
                              ' AND   (EL.IDESTAB      = REG.IDPESSOA(+) )            '+
                              ' AND   (PP.IDSITPART    = SP.IDSITPART)                '+
                              ' AND   (HST.IDCONTRIBUICAO = C.IDCONTRIBUICAO)         '+
                              ' ORDER BY REG.NOME,P.NOME, HST.MESREFERENCIA, C.NOME   ');
     qryDivergContrib.Open;


     qryDivergResumo.Close;
     qryDivergResumo.SQL.Clear;
     qryDivergResumo.SQL.Add(' SELECT SUM(HST.VALORESPERADO), SUM(HST.VALORRECEBIDO), HST.MESREFERENCIA, HST.MESCOBRANCA, '+
                             '        C.NOMERESUM AS NOME,                                                                '+
                             '        DECODE(HST.SITRECEBIMENTO, ''0'', ''Não Enviadas'',                                 '+
                             '                                   ''1'', ''Não Recebidas'',                                '+
                             '                                   ''2'', ''Recebidas sem Divergência'',                    '+
                             '                                   ''3'', ''Recebidas com Divergência(NT)'',                '+
                             '                                   ''4'', ''Recebidas com Divergência(T)'',                 '+
                             '                                   ''5'', ''Divergência Tratada e Paga'',                   '+
                             '                                   ''6'', ''Divergência Tratada Não Paga'',                 '+
                             '                                   ''7'', ''Financiadas ou Renegociadas'',                  '+
                             '                                   ''8'', ''Canceladas'',                                   '+
                             '                                   ''9'', ''Atrasadas a cobrar na Folha Benef. '',          '+
                             '                                   ''Outros'') AS SITUACAO '+
                             ' FROM   CONTRIBUICAO C, HSTCONTRIBPREV HST '+
                              'WHERE (HST.IDPESSJUR   = '+qryPatro.FieldByName('IdPessoa').AsString+')');

     if Trim(dblkpcmbPlano.Text) <> ''
     then qryDivergResumo.SQl.Add(' AND   (HST.IDPLANOPREV = '+qryPlanPatro.FieldByName('IdPlanoPrev').AsString+')');

     qryDivergResumo.SQL.Add('AND   (  HST.MESCOBRANCA = '''+sAnoMesReferencia+''')' );

     case rgrpTipoDiverg.ItemIndex of
          0 : qryDivergResumo.SQL.Add(' AND ( (HST.VALORESPERADO <> HST.VALORRECEBIDO) OR  (HST.VALORRECEBIDO IS NULL) ) '); // TODAS
          1 : qryDivergResumo.SQL.Add(' AND ( (HST.VALORRECEBIDO = 0)                  OR  (HST.VALORRECEBIDO IS NULL) ) '); // APENAS AS NAO RECEBIDAS
          2 : qryDivergResumo.SQL.Add(' AND (  HST.VALORESPERADO >  HST.VALORRECEBIDO)  ');                                  // APENAS AS RECEBIDAS A MENOR
          3 : qryDivergResumo.SQL.Add(' AND (  HST.VALORESPERADO <  HST.VALORRECEBIDO)  ');                                  // APENAS AS RECEBIDAS A MAIOR
     end;

     case rgrpFormaCobranca.ItemIndex of
          1 : qryDivergResumo.SQL.Add(' AND (  (HST.FLGDESCFOLHA = 1) AND (HST.FOLHAORIGEM = ''P'') ) ');                    // APENAS AS COBRADAS VIA FOLHA DA PATRO
          2 : qryDivergResumo.SQL.Add(' AND (  (HST.FLGDESCFOLHA = 1) AND (HST.FOLHAORIGEM = ''B'') ) ');                    // APENAS AS COBRADAS VIA FOLHA DE BENEFICIO
          3 : qryDivergResumo.SQL.Add(' AND (  HST.FLGDESCFOLHA = 0 )  ');                                                   // APENAS AS COBRADAS VIA BANCO
     end;

     qryDivergResumo.SQL.Add(' AND   (HST.IDCONTRIBUICAO = C.IDCONTRIBUICAO) '+
                             ' GROUP BY HST.MESREFERENCIA, HST.MESCOBRANCA, C.NOMERESUM, HST.IDMOTIVO, HST.SITRECEBIMENTO '+
                             ' ORDER BY HST.MESCOBRANCA, C.NOMERESUM ');
     qryDivergResumo.Open;
   end;
end;

end.
