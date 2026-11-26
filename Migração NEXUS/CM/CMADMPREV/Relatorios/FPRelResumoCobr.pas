// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//--------------------------------------------------------------------------------
// Nº SIG.....: SIG TIBERO
// Data.......: 06/03/2018
// Responsável: Everson Luiz Pereira da Cunha
// Descrição..: Melhoria no Planus para adequação ao TIBERO.
//              Inclusão de alias nas tabelas e campos.
//              Retirar INDEX, +rule etc
// -----------------------------------------------------------------------------
//Pendência   : SOL 132935 KINTANA 771130
//Responsável : BRUNO AZEVEDO
//Data        : 26/03/2010
//Descrição   : Adicionado condição para incluir lanc. na rotina InsertMovEmptmo.
//--------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 07.07.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO 
//------------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : Leo
// Data        : 03/07/2002
// Alteração   : alteração na query da consulta, incluindo alteradores
//------------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : Leo
// Data        : 02/07/2002
// Alteração   : retirei chklstSituacao, que fazia seleção na FLGSITFUNDACAO. Retirei
//               pois estava causando confusão para os usuários
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 24/10/2002
// Alteração   : Opção de filtro por Banco e Todas (Pend-10039)
//------------------------------------------------------------------------------

unit FPRelResumoCobr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Spin, wwdblook, Db, DBTables, Wwquery, CheckLst;

const
  vetsituacaoPreparo : array[0..6] of string[2] = ('AT','MA','MP','MS','PT','AS','CA');


type
  TfrmPRelResumoCobr = class(TfrmOkCancelar)
    rgrpPatro: TRadioGroup;
    grpSelPatro: TGroupBox;
    qryPatro: TwwQuery;
    dblkpcmbPatro: TwwDBLookupCombo;
    qryPlanPREV: TwwQuery;
    Label1: TLabel;
    Label2: TLabel;
    dblkpcmbPlano: TwwDBLookupCombo;
    Panel1: TPanel;
    grpMesAnoRef: TGroupBox;
    cmbMesRef: TComboBox;
    spedAnoRef: TSpinEdit;
    rggrpFolha: TRadioGroup;
    Label3: TLabel;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure rgrpPatroClick(Sender: TObject);
    procedure qryPatroAfterScroll(DataSet: TDataSet);
    procedure dblkpcmbPatroCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPRelResumoCobr: TfrmPRelResumoCobr;

implementation

uses DRelatAdmPrev, UAdmPrev, UMensErro;

{$R *.DFM}

procedure TfrmPRelResumoCobr.FormShow(Sender: TObject);
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
  rgrpPatro.ItemIndex := 0;
  grpSelPatro.Visible := False;
end;

procedure TfrmPRelResumoCobr.bbtnConfirmarClick(Sender: TObject);
var strSituacao, sAno, sMesReferencia, sAnoMesReferencia, sEnd , sFiltroPatro : string;
    i : Integer;
begin
  inherited;
  if Trim(cmbMesRef.Text) = ''
  then begin
     MsgDlg('Mês de Referência não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
     Exit;
  end;

  if (rgrpPatro.ItemIndex = 1) and (Trim(dblkpcmbPatro.Text) = '')
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
   with dtmRelatAdmPrev do
   begin
     //  OBTER DADOS DA FUNDAÇÃO
     qryFundacao.Close;
     qryFundacao.ParamByName('pFundacao').asinteger;
     qryFundacao.ParamByName('pFundacao').asinteger := iIdFundacao;
     qryFundacao.Prepare;
     qryFundacao.Open;



     if rggrpFolha.itemindex = 0 then
        lblTitulo.Caption := 'Resumo de Cobrança de Contribuição via Interface - Mês : '+Trim(cmbMesRef.Text)+' / '+Trim(spedAnoRef.Text)
     else if rggrpFolha.itemindex = 1 then
        lblTitulo.Caption := 'Resumo de Cobrança de Contribuição via Folha de Benefícios - Mês : '+Trim(cmbMesRef.Text)+' / '+Trim(spedAnoRef.Text)
     else if rggrpFolha.itemindex = 2 then
        lblTitulo.Caption := 'Resumo de Cobrança de Contribuição Bancária - Mês : '+Trim(cmbMesRef.Text)+' / '+Trim(spedAnoRef.Text)
     else if rggrpFolha.itemindex = 3 then
        lblTitulo.Caption := 'Resumo de Cobrança de Contribuição via todas as opções - Mês : '+Trim(cmbMesRef.Text)+' / '+Trim(spedAnoRef.Text);


     if rgrpPatro.ItemIndex = 0
     then sFiltroPatro :=  ' '
     else begin
        sFiltroPatro := ' AND HST.IDPESSJUR = '+qryPatro.FieldByName('IdPessoa').AsString;
        if Trim(dblkpcmbPlano.Text) <> ''
        then sFiltroPatro := sFiltroPatro + ' AND HST.IDPLANOPREV = '+qryPlanPrev.FieldByName('IdPlanoPrev').AsString;
     end;


     qryResumoCobr.Close;
     qryResumoCobr.SQL.Clear;
     qryResumoCobr.SQL.Add(' SELECT COUNT(*) AS QUANTIDADE , '+
                           //Everson TIBERO - Início
                           {'                  DECODE(FLGDEVOLUCAO,1,SUM(HST.VALORESPERADO)*-1,SUM(HST.VALORESPERADO)) AS VALORESPERADO, '+
                           '                  DECODE(FLGDEVOLUCAO,1,SUM(HST.VALORRECEBIDO)*-1,SUM(HST.VALORRECEBIDO)) AS VALORRECEBIDO, '+}
                           '                  DECODE(HST.FLGDEVOLUCAO,1,SUM(HST.VALORESPERADO)*-1,SUM(HST.VALORESPERADO)) AS VALORESPERADO, '+
                           '                  DECODE(HST.FLGDEVOLUCAO,1,SUM(HST.VALORRECEBIDO)*-1,SUM(HST.VALORRECEBIDO)) AS VALORRECEBIDO, '+
                           //Everson TIBERO - Fim
                                              ''''+sAnoMesReferencia + ''' AS ANOMESTELA,                                               '+
                           '                  HST.MESCOBRANCA, HST.MESREFERENCIA, HST.IDPESSJUR, HST.IDPLANOPREV,                       '+
                           '        P.NOME AS NOMEPATRO , PL.NOME AS NOMEPLANO, C.IDCONTRIBUICAO, C.NOME AS NOMECONTRIB,                '+
                           '        DECODE(HST.SITRECEBIMENTO, 0, ''Não Enviadas'',                                                     '+
                           '                                   1, ''Não Recebidas'',                                                    '+
                           '                                   2, ''Recebidas sem Divergência'',                                        '+
                           '                                   3, ''Recebidas com Divergência(NT)'',                                    '+
                           '                                   4, ''Recebidas com Divergência(T)'',                                     '+
                           '                                   5, ''Divergência Tratada e Paga'',                                       '+
                           '                                   6, ''Divergência Tratada Não Paga'',                                     '+
                           '                                   7, ''Financiadas ou Renegociadas'',                                      '+
                           '                                   8, ''Canceladas'',                                                       '+
                           '                                   9, ''Atrasadas a cobrar na Folha Benef. '',                              '+
                                                                  '''Outros''), DECODE(HST.FLGDEVOLUCAO,1,''Sim'',''Não'') FLGDEVOLUCAO '+
                           ' FROM   PESSOA P, HSTCONTRIBPREV HST, CONTRIBUICAO C, CONTPREV CP, PATRO PT, PLANPREV PL                    '+ 
                           ' WHERE  (HST.MESCOBRANCA    =  '''+sAnoMesReferencia+''')                                                   '+
                           sFiltroPatro);

     //Everson TIBERO - Início
   {  if rggrpFolha.itemindex = 0 then
        qryResumoCobr.SQL.Add(' AND     (FOLHAORIGEM = ''P'' OR FOLHAORIGEM IS NULL )                                                   ')
     else if rggrpFolha.itemindex = 1 then
        qryResumoCobr.SQL.Add(' AND     (FOLHAORIGEM = ''B'')                                                                           ')
     else if rggrpFolha.itemindex = 2 then
        qryResumoCobr.SQL.Add(' AND     (FOLHAORIGEM = ''C'')                                                                           ');}

     if rggrpFolha.itemindex = 0 then
        qryResumoCobr.SQL.Add(' AND     (HST.FOLHAORIGEM = ''P'' OR HST.FOLHAORIGEM IS NULL )                                           ')
     else if rggrpFolha.itemindex = 1 then
        qryResumoCobr.SQL.Add(' AND     (HST.FOLHAORIGEM = ''B'')                                                                       ')
     else if rggrpFolha.itemindex = 2 then
        qryResumoCobr.SQL.Add(' AND     (HST.FOLHAORIGEM = ''C'')                                                                       ');
      //Everson TIBERO - Fim

     qryResumoCobr.SQL.Add(
                           ' AND    (PT.IDPESSOA        = HST.IDPESSJUR)                                                                '+ 
                           ' AND    (PT.IDFUNDACAO      = '+IntToStr(iIdFundacao)+')                                                    '+ 
                           ' AND    (P.IDPESSOA         = HST.IDPESSJUR)                                                                '+
                           ' AND    (CP.IDPLANOPREV     = HST.IDPLANOPREV)                                                              '+
                           ' AND    (CP.IDCONTRIBUICAO  = HST.IDCONTRIBUICAO)                                                           '+
                           ' AND    (PL.IDPLANOPREV     = CP.IDPLANOPREV)                                                               '+
                           ' AND    (C.IDCONTRIBUICAO   = CP.IDCONTRIBUICAO)                                                            '+
                           ' AND    ( (HST.FLGDESCFOLHA   = 1)  OR (CP.FLGPAGADOR <> ''C'')  )                                          '+
                           //BRUNO AZEVEDO SOL 132935 KINTANA 771130
                           ' AND    (HST.SITRECEBIMENTO <> 0)                                                                           '+
                           ' GROUP BY HST.MESCOBRANCA,HST.MESREFERENCIA, HST.IDPESSJUR, HST.IDPLANOPREV, P.NOME, PL.NOME,               '+
                           '          C.IDCONTRIBUICAO, C.NOME, HST.SITRECEBIMENTO, HST.FLGDEVOLUCAO                                    '+
                           ' UNION ALL                                                                                                  '+
                           ' SELECT COUNT(*) AS QUANTIDADE ,                                                                            '+

                           //Everson TIBERO - Início
                           {' DECODE(FLGDEVOLUCAO,1,SUM(HA.VALOR)*-1,SUM(HA.VALOR)) AS VALORESPERADO,                                    '+
                           ' DECODE(FLGDEVOLUCAO,1,SUM(HA.VALORRECEBIDO)*-1,SUM(HA.VALORRECEBIDO)) AS VALORRECEBIDO,                    '+}
                           ' DECODE(HST.FLGDEVOLUCAO,1,SUM(HA.VALOR)*-1,SUM(HA.VALOR)) AS VALORESPERADO,                                '+
                           ' DECODE(HST.FLGDEVOLUCAO,1,SUM(HA.VALORRECEBIDO)*-1,SUM(HA.VALORRECEBIDO)) AS VALORRECEBIDO,                '+
                           //Everson TIBERO - Fim

                           ' '''+sAnoMesReferencia + ''' AS ANOMESTELA,                                                                 '+
                           ' HA.MESCOBRANCA, HA.MESREFERENCIA, HST.IDPESSJUR, HST.IDPLANOPREV,                                          '+
                           ' P.NOME AS NOMEPATRO , PL.NOME AS NOMEPLANO,                                                                '+
                           ' C.IDCONTRIBUICAO, TA.DESCRICAO AS NOMECONTRIB,                                                             '+
                           ' DECODE(HST.SITRECEBIMENTO, 0, ''Não Enviadas'',                                                            '+
                           '                            1, ''Não Recebidas'',                                                           '+
                           '                            2, ''Recebidas sem Divergência'',                                               '+
                           '                            3, ''Recebidas com Divergência(NT)'',                                           '+
                           '                            4, ''Recebidas com Divergência(T)'',                                            '+
                           '                            5, ''Divergência Tratada e Paga'',                                              '+
                           '                            6, ''Divergência Tratada Não Paga'',                                            '+
                           '                            7, ''Financiadas ou Renegociadas'',                                             '+
                           '                            8, ''Canceladas'',                                                              '+
                           '                            9, ''Atrasadas a cobrar na Folha Benef. '',                                     '+
                           '                               ''Outros''),                                                                 '+
                           ' DECODE(HST.FLGDEVOLUCAO, 1,''Sim'',''Não'') FLGDEVOLUCAO                                                   '+
                           ' FROM   PESSOA P, HSTCONTRIBPREV HST, HSTATRASOCONTRIB HA, TIPOALTERADOR TA,                                '+
                           ' CONTRIBUICAO C, CONTPREV CP, PATRO PT, PLANPREV PL                                                         '+
                           ' WHERE  (HST.MESCOBRANCA  =   '''+sAnoMesReferencia+''' )                                                   '+
                           sFiltroPatro);

      //Everson TIBERO - Início
     {if rggrpFolha.itemindex = 0 then
        qryResumoCobr.SQL.Add(' AND     (FOLHAORIGEM = ''P'' OR FOLHAORIGEM IS NULL )                                                   ')
     else if rggrpFolha.itemindex = 1 then
        qryResumoCobr.SQL.Add(' AND     (FOLHAORIGEM = ''B'')                                                                           ')
     else if rggrpFolha.itemindex = 2 then
        qryResumoCobr.SQL.Add(' AND     (FOLHAORIGEM = ''C'')                                                                           ');}

     if rggrpFolha.itemindex = 0 then
        qryResumoCobr.SQL.Add(' AND     (HST.FOLHAORIGEM = ''P'' OR HST.FOLHAORIGEM IS NULL )                                           ')
     else if rggrpFolha.itemindex = 1 then
        qryResumoCobr.SQL.Add(' AND     (HST.FOLHAORIGEM = ''B'')                                                                       ')
     else if rggrpFolha.itemindex = 2 then
        qryResumoCobr.SQL.Add(' AND     (HST.FOLHAORIGEM = ''C'')                                                                       ');
     //Everson TIBERO - Fim

     qryResumoCobr.SQL.Add(
                           ' AND    (PT.IDPESSOA        = HST.IDPESSJUR)                                                                '+
                           ' AND    (PT.IDFUNDACAO      = '+IntToStr(iIdFundacao)+')                                                    '+
                           ' AND    (P.IDPESSOA         = HST.IDPESSJUR)                                                                '+
                           ' AND    (CP.IDPLANOPREV     = HST.IDPLANOPREV)                                                              '+
                           ' AND    (CP.IDCONTRIBUICAO  = HST.IDCONTRIBUICAO)                                                           '+
                           ' AND    (PL.IDPLANOPREV     = CP.IDPLANOPREV)                                                               '+
                           ' AND    (C.IDCONTRIBUICAO   = CP.IDCONTRIBUICAO)                                                            '+
                           ' AND     ( (HST.FLGDESCFOLHA   = 1)  OR (CP.FLGPAGADOR <> ''C'')  )                                         '+
                           ' AND HA.NUMRECEBIMENTO = HST.NUMRECEBIMENTO                                                                 '+
                           ' AND HA.MESREFERENCIA  = HST.MESREFERENCIA                                                                  '+
                           ' AND HA.MESCOBRANCA    = HST.MESCOBRANCA                                                                    '+
                           ' AND TA.CODALTERADOR   = HA.CODALTERADOR                                                                    '+
                           //BRUNO AZEVEDO SOL 132935 KINTANA 771130
                           ' AND    (HST.SITRECEBIMENTO <> 0)                                                                           '+
                           ' GROUP BY HA.MESCOBRANCA, HA.MESREFERENCIA, HST.IDPESSJUR,                                                  '+
                           ' HST.IDPLANOPREV, P.NOME, PL.NOME,                                                                          '+
                           ' C.IDCONTRIBUICAO, TA.DESCRICAO, HST.SITRECEBIMENTO, HST.FLGDEVOLUCAO                                       '+
                           ' ORDER BY NOMEPATRO, NOMEPLANO, NOMECONTRIB, MESREFERENCIA                                                  ');

     qryResumoCobr.Open;
   end;
end;

procedure TfrmPRelResumoCobr.rgrpPatroClick(Sender: TObject);
begin
  inherited;
  grpSelPatro.Visible := (rgrpPatro.ItemIndex = 1);
end;

procedure TfrmPRelResumoCobr.qryPatroAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if not qryPatro.Active then Exit;

  qryPlanPrev.Close;
  qryPlanPrev.ParamByName('IdPessJur').AsInteger := qryPatro.FieldByName('IdPessoa').AsInteger;
  qryPlanPrev.Open;
end;

procedure TfrmPRelResumoCobr.dblkpcmbPatroCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryPlanPrev.Close;
  qryPlanPrev.ParamByName('IdPessJur').AsInteger := qryPatro.FieldByName('IdPessoa').AsInteger;
  qryPlanPrev.Open;

end;

end.
