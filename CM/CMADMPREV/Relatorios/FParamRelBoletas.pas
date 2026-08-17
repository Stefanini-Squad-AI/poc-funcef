unit FParamRelBoletas;

// Alterações:
{---------------------------------------------------------------------------------------------------
Rotina........: bbtnConfirmarClick
N. Sol........: 95338
N. Kintana....: 411855
Data..........: 09/09/2008
Responsável...: Denise Arruda
Descrição.....: Acrescimo de join na consulta do relatório pois estava duplicando dados
----------------------------------------------------------------------------------------------------
Autor(a)    : Hugo Luna
Data        : 05/12/2007
Pendencia   : 26573
Rotina      : bbtnConfirmarClick
Alteração   : Alterando a Ordenação da Query.
----------------------------------------------------------------------------------------------------
Autor(a)    : André Pontes
Data        : 21/11/2007
Pendencia   : 26892
Rotina      : bbtnConfirmarClick(...)
Alteração   : Correção da passagem do título do relatório
----------------------------------------------------------------------------------------------------
Autor(a)    : André Pontes
Data        : 17 e 18/10/2007
Pendencia   : 26460
Rotina      : bbtnConfirmarClick (qryBoletas)
Alteração   : Corrigida totalização do valor recebido, buscando agora o total de alteradores recebidos.
              Anteriormente considerava o total de alteradores, recebidos ou não.
----------------------------------------------------------------------------------------------------
Autor(a)    : Hugo Luna
Data        : 31/08/2007
Pendencia   : 26573
Rotina      : bbtnConfirmarClick
Alteração   : Alterando a Ordenação da Query.
----------------------------------------------------------------------------------------------------
Autor(a)    : Claudio Faria
Data        : 31/08/2007
Pendencia   : 26253
Rotina      : bbtnConfirmarClick
Alteração   : Aertando o total Recebido.
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Data        : 01/08/2007
Pendencia   : 26153
Rotina      : bbtnConfirmarClick
Alteração   : Acertando o total esperado.
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Data        : 01/08/2007
Pendencia   : 25988
Rotina      : bbtnConfirmarClick
Alteração   : Refazendo a query para não mostrar valores recebidos inconsistentes
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Data        : 27/02/2007
Pendencia   : 24383
Rotina      : bbtnConfirmarClick
Alteração   : Acerto na Consulta de abertura do relatório para não filtrar por plano e otimização da consulta.
----------------------------------------------------------------------------------------------------
Autor(a)    : Claudio Faria (Reabertua)
Data        : 13/12/2006
Pendencia   : 23718
Rotina      : bbtnConfirmarClick
Alteração   : Acerto visualizar apenas as contribuições do plano ativo do participante.
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Data        : 10/11/2006
Pendencia   : 23718
Rotina      : bbtnConfirmarClick
Alteração   : Acerto visualizar apenas as contribuições do plano ativo
              do participante.
---------------------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, TEdNum, MontaSelect, wwdblook, Db, DBTables,
  Wwquery, wwdbdatetimepicker, CMDateTimePicker, Mask;

type
  TfrmParamRelBoletas = class(TfrmOkCancelar)
    rgrpTipoConsulta: TRadioGroup;
    pnlParticipante: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edParticipante: TEdit;
    edMatricula: TEdit;
    edNumInsc: TEdit;
    edPatrocinadora: TEdit;
    edPlano: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    bbtnProcurar: TBitBtn;
    pnlOutrasCondicoes: TPanel;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    edNossoNumero: TEdit;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    edValorPagoMin: TEditNum;
    GroupBox4: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    edValorEspMin: TEditNum;
    edValorEspMax: TEditNum;
    MontaSelectPart: TMontaSelect;
    edValorPagoMax: TEditNum;
    GroupBox5: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    rgrpPagamento: TRadioGroup;
    GroupBox6: TGroupBox;
    Label14: TLabel;
    qryPatro: TwwQuery;
    dblkpcmbPatro: TwwDBLookupCombo;
    dtEmissaoIni: TCMDateTimePicker;
    dtEmissaoFim: TCMDateTimePicker;
    GroupBox7: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    edMesCobIni: TMaskEdit;
    edMesCobFim: TMaskEdit;
    GrBxMesCob: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    MEdMesCobIni: TMaskEdit;
    MEdMesCobFim: TMaskEdit;
    rgrpOrdem: TRadioGroup;
    ckbPlano: TCheckBox;

    procedure FormShow(Sender: TObject);
    procedure rgrpTipoConsultaClick(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);


  private // Private declarations

    liIdPessoa    : longint;
    liIdPessJur   : longint;
    liIdPlanoPrev : longint;
    liSeqProposta : longint;


  public  // Public declarations


  end;




var
  frmParamRelBoletas: TfrmParamRelBoletas;




implementation
{$R *.DFM}
uses
  uSistema, DRelatAdmPrev, UMensErro, UAdmPrev, fAguarde;




procedure TfrmParamRelBoletas.FormShow(Sender: TObject);
begin
  inherited;
  rgrpTipoConsulta.ItemIndex := 0;
  rgrpPagamento.ItemIndex    := 0;
  edNossoNumero.Text         := '';
  edValorEspMin.Text         := '';
  edValorEspMax.Text         := '';
  edValorPagoMin.Text         := '';
  edValorPagoMax.Text         := '';
  qryPatro.Close;
  qryPatro.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao;
  qryPatro.Open;

  pnlParticipante.BringToFront;

  MontaSelectPart.Filtro.Add('PARTPREVPLAN.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')');
end;



procedure TfrmParamRelBoletas.rgrpTipoConsultaClick(Sender: TObject);
begin
  inherited;

  if rgrpTipoConsulta.ItemIndex = 0
  then pnlParticipante.BringToFront
  else pnlParticipante.SendToBack;
end;



procedure TfrmParamRelBoletas.bbtnProcurarClick(Sender: TObject);
begin
  inherited;

  MontaSelectPart.Executar;

  if (MontaSelectPart.ValoresChave.Count > 0) and (MontaSelectPart.ValoresChave[0] <> '') then
  begin
    liIdPessoa            := StrToInt(MontaSelectPart.ValoresChave[0]);
    liIdPessjur           := StrToInt(MontaSelectPart.ValoresChave[1]);
    liIdPlanoprev         := StrToInt(MontaSelectPart.ValoresChave[2]);
    liSeqProposta         := StrToInt(MontaSelectPart.ValoresChave[6]);
    edParticipante.Text   := MontaSelectPart.ValoresChave[3];
    edMatricula.Text      := MontaSelectPart.ValoresChave[7];
    edNumInsc.Text        := MontaSelectPart.ValoresChave[8];
    edPatrocinadora.Text  := MontaSelectPart.ValoresChave[4];
    edPlano.Text          := MontaSelectPart.ValoresChave[5];
  end;
end;



procedure TfrmParamRelBoletas.bbtnConfirmarClick(Sender: TObject);
var
  sSQL : string;
  sMsg : string;
begin
  if (rgrpTipoConsulta.ItemIndex = 0) and (Trim(edParticipante.Text) = '') then
  begin
    MsgDlg('Selecione o Participante.', Sistema.NomeModulo, mtError, [mbOk], 0);
    Repaint;
    Abort;
  end;

  if (rgrpTipoConsulta.ItemIndex = 1) and (Trim(dtEmissaoIni.Text) = '') then
  begin
    sMsg :=
    'A não indicação da Data de Emissão pode deixar a consulta mais lenta. ' + #13 + #13 +
    'Deseja continuar mesmo assim? ';

    if MsgDlg(sMsg, Sistema.NomeModulo, mtConfirmation, [mbYes, mbNo], 0) = mrNo then Abort;
  end;


  with dtmRelatAdmPrev do
  begin
    qryFundacao.Close;
    qryFundacao.ParamByName('pFundacao').AsInteger;
    qryFundacao.ParamByName('pFundacao').AsInteger := iIdFundacao;
    qryFundacao.Prepare;
    qryFundacao.Open;

    case rgrpPagamento.ItemIndex of
      0: sMsg := 'Cobranças Enviadas para CaR ';                // enviado e nao recebido
      1: sMsg := 'Cobranças Não Enviadas para CaR ';            // nao enviado
      2: sMsg := 'Cobranças Recebidas pelo CaR ';               // recebido ok
      3: sMsg := 'Cobranças Recebidas Parcialmente pelo CaR ';  // parcialmente recebido
      4: sMsg := 'Cobranças Canceladas ';                       // Cancelada
      5: sMsg := 'Todas ';                                      // Todos
    end;

    pplblRelBoletasTitulo.Caption := 'Cobrança de Contribuição via Banco - ' + sMsg;

    // ---------------------------------------------------------------------------------------------
    // ---------------------------------------------------------------------------------------------

    sSQL :=
    'SELECT '                                                                                       + #13 +
    '  R.NODOCUMENTO,          R.NOSSONUMERO,          R.NOMERESUM, '                               + #13 +
    '  R.NOMEPARTICIP, R.NOMEPATRO,  R.NOMEPLANO,'                                                  + #13 +
    '  R.NOME,                 R.MESREFERENCIA,      R.MESCOBRANCA,'                                + #13 +
    '  R.DATAPREVISAORECE,'                                                                         + #13 +
    '  R.VALORESPERADO,'                                                                            + #13 +
    '  R.VALORRECEBIDO, '                                                                           + #13 +
    '  R.DATARECEBIMENTO,    R.DATACANCELAMENTO, '                                                  + #13 +
    '  R.IDPESSJUR,          R.IDPLANOPREV, R.IDPESSOA, R.FLGINTERNO, '                             + #13 +
    '  R.DATAEMISSCOB,       R.MATRICULA,           R.DATAADMISSAO, '                               + #13 +
    '  R.DATADEMISSAO,       R.NIVEL,               R.TITULO, '                                     + #13 +
    '  R.DATAINICIOMANUT,    R.INSCRICAONUMERO, '                                                   + #13 +
    '  R.NOMEVALORBASE1,     R.NOMEVALORBASE2,      R.NOMEVALORBASE3, '                             + #13 +
    '  R.VALORBASE1,         R.VALORBASE2,          R.VALORBASE3, '                                 + #13 +
    '  R.VALORBASE4,         R.VALORBASE5,          R.VALORBASE6, '                                 + #13 +
    '  R.SALMANTIDO,         R.SALPARTICIPACAO, '                                                   + #13 +
    '  R.OPCAOCONTRIB1, '                                                                           + #13 +
    '  NVL(DECODE(R.TOTALCONTRIB, 0, 0, R.TOTALCONTRIB), 0) AS TOTALCONTRIB, '                      + #13 +       
    '  NVL(DECODE(R.TOTALRECEBIDO, 0, 0, R.TOTALRECEBIDO), 0) AS TOTALRECEBIDO, '                   + #13 +       
    '  R.TOTALALTERADORES, '                                                                        + #13 +
    '  R.SITUACAO, '                                                                                + #13 +
    '  R.CODDOCUMENTOPREV, '                                                                        + #13 +
    '  R.IDCONTRIBUICAO '                                                                           + #13 +

    'FROM '                                                                                         + #13 +

    '  ( '                                                                                          + #13 +
    '  SELECT '                                                                                     + #13 +
    '    D.NODOCUMENTO,          D.NOSSONUMERO,          C.NOMERESUM, '                             + #13 +
    '    P.NOME AS NOMEPARTICIP, PAT.NOME AS NOMEPATRO,  PL.NOME AS NOMEPLANO, '                    + #13 +
    '    C.NOME,                 HST.MESREFERENCIA,      HST.MESCOBRANCA, '                         + #13 +
    '    HST.DATAPREVISAORECE, '                                                                    + #13 +

    '    SUM(DECODE(HST.FLGDEVOLUCAO, 1, -HST.VALORESPERADO, HST.VALORESPERADO)) AS VALORESPERADO, '    + #13 +
    '    SUM(DECODE(HST.FLGDEVOLUCAO, 1, -HST.VALORRECEBIDO, HST.VALORRECEBIDO)) AS VALORRECEBIDO, '    + #13 +

    '    HST.DATARECEBIMENTO,    HST.DATACANCELAMENTO, '                                            + #13 +
    '    HST.IDPESSJUR,          HST.IDPLANOPREV, HST.IDPESSOA, SP.FLGINTERNO,  '                   + #13 +
    '    HST.DATAEMISSCOB,       EL.MATRICULA,           EL.DATAADMISSAO,  '                        + #13 +
    '    EL.DATADEMISSAO,        EL.NIVEL,               CEXT.TITULO, '                             + #13 +
    '    PP.DATAINICIOMANUT,     PP.INSCRICAONUMERO, '                                              + #13 +
    '    PT.NOMEVALORBASE1,      PT.NOMEVALORBASE2,      PT.NOMEVALORBASE3, '                       + #13 +
    '    EL.VALORBASE1,          EL.VALORBASE2,          EL.VALORBASE3, '                           + #13 +
    '    EL.VALORBASE4,          EL.VALORBASE5,          EL.VALORBASE6, '                           + #13 +
    '    PP.SALMANTIDO,          PP.SALPARTICIPACAO, '                                              + #13 +
    '    CPP.VALORBASE1 AS OPCAOCONTRIB1, '                                                         + #13 +

    '    (SUM(DECODE(HST.FLGDEVOLUCAO, 1, -HST.VALORESPERADO, HST.VALORESPERADO)) + NVL(HA.TOTALALTERADORES, 0)) AS TOTALCONTRIB, '   + #13 +

    '    (SUM(DECODE(HST.FLGDEVOLUCAO, 1, -HST.VALORRECEBIDO, HST.VALORRECEBIDO)) + NVL(HA.TOTALTRECEBIDO, 0))   AS TOTALRECEBIDO, '  + #13 +

    '    NVL(HA.TOTALALTERADORES,0) TOTALALTERADORES , '                                            + #13 +
    '    DECODE(HST.SITRECEBIMENTO, 0, ''Não Env.'','                                               + #13 +
    '                               1, ''Não Rec.'','                                               + #13 +
    '                               2, ''OK'','                                                     + #13 +
    '                               3, ''Diverg.'','                                                + #13 +
    '                               4, ''Diverg.'','                                                + #13 +
    '                               5, ''OK'','                                                     + #13 +
    '                               6, ''Diverg.'','                                                + #13 +
    '                               7, ''Financ.'','                                                + #13 +
    '                               8, ''Cancel.'','                                                + #13 +
    '                               9, ''Não Rec.'','                                               + #13 +
    '                                  ''Outros'' '                                                 + #13 +
    '          ) AS SITUACAO, '                                                                     + #13 +
    '    HST.CODDOCUMENTOPREV, C.IDCONTRIBUICAO  '                                                  + #13 +

    '  FROM '                                                                                       + #13 +
    '    ( '                                                                                        + #13 +
    '    SELECT '                                                                                   + #13 +

    '      SUM(DECODE(HST1.FLGDEVOLUCAO, 1, -NVL(HA.VALOR, 0), NVL(HA.VALOR, 0))) AS TOTALALTERADORES, '                + #13 +

    '      SUM(DECODE(HST1.FLGDEVOLUCAO, 1, -NVL(HA.VALORRECEBIDO, 0), NVL(HA.VALORRECEBIDO, 0))) AS TOTALTRECEBIDO, '  + #13 +

    '      HA.MESREFERENCIA, HA.NUMRECEBIMENTO, HA.MESCOBRANCA, HA.IDMOTIVO '                       + #13 +

    '    FROM '                                                                                     + #13 +
    '      HSTATRASOCONTRIB HA,  '                                                                  + #13 +
    '      HSTCONTRIBPREV   HST1 '                                                                  + #13 +

    '    WHERE '                                                                                    + #13 +
    '          HST1.MESREFERENCIA   = HA.MESREFERENCIA  '                                           + #13 +
    '      AND HST1.NUMRECEBIMENTO  = HA.NUMRECEBIMENTO '                                           + #13 +
    '      AND HST1.MESCOBRANCA     = HA.MESCOBRANCA '                                              + #13 +
    '      AND HST1.IDMOTIVO        = HA.IDMOTIVO '                                                 + #13;

    if rgrpTipoConsulta.ItemIndex = 0 then
    begin
      sSQL := sSQL +
    '      AND HST1.IDPESSOA        = ' + IntToStr(liIdPessoa)                                      + #13 +
    '      AND HST1.IDPESSJUR       = ' + IntToStr(liIdPessJur)                                     + #13 +
    '      AND HST1.SEQPROPOSTA     = ' + IntToStr(liSeqProposta)                                   + #13;

       if not(ckbPlano.Checked) then sSQL := sSQL +
    '      AND HST1.IDPLANOPREV     = ' + IntToStr(liIdPlanoPrev)                                   + #13;
    end;

    sSQL := sSQL +
    '    GROUP BY '                                                                                 + #13 +
    '      HA.MESREFERENCIA, HA.NUMRECEBIMENTO, HA.MESCOBRANCA, HA.IDMOTIVO '                       + #13 +
    '    ) HA, '                                                                                    + #13 +

    '    HSTCONTRIBPREV    HST,  '                                                                  + #13 +
    '    PESSOA            P,    '                                                                  + #13 +
    '    PESSOA            PAT,  '                                                                  + #13 +
    '    DOCUMENTO         D,    '                                                                  + #13 +
    '    ELEGPATRO         EL,   '                                                                  + #13 +
    '    PARTPREVPLAN      PP,   '                                                                  + #13 +
    '    CONTRIBPREVPARTP  CPP,  '                                                                  + #13 +
    '    CONTRIBUICAO      C,    '                                                                  + #13 +
    '    PLANPREV          PL,   '                                                                  + #13 +
    '    SITPART           SP,   '                                                                  + #13 +
    '    CARGOEXT          CEXT, '                                                                  + #13 +
    '    PATRO             PT    '                                                                  + #13;

    if rgrpTipoConsulta.ItemIndex = 0 then
    begin
      sSQL := sSQL +
    '  WHERE '                                                                                      + #13 +
    '        HST.IDPESSOA           = ' + IntToStr(liIdPessoa)                                      + #13 +
    '    AND HST.IDPESSJUR          = ' + IntToStr(liIdPessJur)                                     + #13 +
    '    AND HST.SEQPROPOSTA        = ' + IntToStr(liSeqProposta)                                   + #13;

      if not(ckbPlano.Checked) then sSQL := sSQL +
    '    AND HST.IDPLANOPREV        = ' + IntToStr(liIdPlanoPrev)                                   + #13;

      if rgrpPagamento.ItemIndex = 0 then sSQL := sSQL +        // enviado e nao recebido
    '    AND HST.SITRECEBIMENTO     = 1 '                                                           + #13 +
    '    AND HST.CODDOCUMENTOPREV   IS NOT NULL '                                                   + #13
      else if rgrpPagamento.ItemIndex = 1 then  sSQL := sSQL +  // nao enviado
    '    AND HST.SITRECEBIMENTO     = 0 '                                                           + #13
      else if rgrpPagamento.ItemIndex = 2 then  sSQL := sSQL +  // recebido ok
    '    AND HST.SITRECEBIMENTO     IN (2, 5) '                                                     + #13
      else if rgrpPagamento.ItemIndex = 3 then  sSQL := sSQL +  // parcialmente recebido
    '    AND HST.SITRECEBIMENTO     IN (3, 4, 6) '                                                  + #13
      else if rgrpPagamento.ItemIndex = 4 then  sSQL := sSQL +  // Cancelada
    '    AND HST.SITRECEBIMENTO     = 8 '                                                           + #13 +
    '    AND HST.DATACANCELAMENTO   IS NOT NULL'                                                    + #13;
    end
    else
    begin
      sSQL := sSQL +
    '  WHERE '                                                                                      + #13 +
    '        HST.MESREFERENCIA      = HST.MESREFERENCIA   '                                         + #13 +
    '    AND HST.MESCOBRANCA        = HST.MESCOBRANCA   '                                           + #13 +
    '    AND HST.IDPESSJUR          = HST.IDPESSJUR '                                               + #13;

      if (Trim(edMesCobIni.Text) <> '/') then sSQL := sSQL +
    '    AND HST.MESREFERENCIA     >= ' + QuotedStr(Trim(edMesCobIni.Text))                         + #13;

      if (Trim(edMesCobFim.Text) <> '/')then sSQL := sSQL +
    '    AND HST.MESREFERENCIA     <= ' + QuotedStr((edMesCobFim.Text))                             + #13;

      if (Trim(MEdMesCobIni.Text) <> '/') then sSQL := sSQL +
    '    AND HST.MESCOBRANCA       >= ' + QuotedStr((MEdMesCobIni.Text))                            + #13;

      if (Trim(MEdMesCobFim.Text) <> '/') then sSQL := sSQL +
    '    AND HST.MESCOBRANCA       <= ' + QuotedStr((MEdMesCobFim.Text))                            + #13;

      if Trim(dblkpcmbPatro.Text) <> '' then sSQL := sSQL +
    '    AND HST.IDPESSJUR          = ' + qryPatro.FieldByName('IdPessoa').AsString                 + #13;

      if Trim(edValorEspMin.Text) <> '' then sSQL := sSQL +
    '    AND HST.VALORESPERADO     >= ' + OraNumero(Trim(edValorEspMin.Text))                       + #13;

      if Trim(edValorEspMax.Text) <> '' then sSQL := sSQL +
    '    AND HST.VALORESPERADO     <= ' + OraNumero(Trim(edValorEspMax.Text))                       + #13;

      if Trim(edValorPagoMin.Text) <> '' then sSQL := sSQL +
    '    AND HST.VALORRECEBIDO     >= ' + OraNumero(Trim(edValorPagoMin.Text))                      + #13;

      if Trim(edValorPagoMax.Text) <> '' then sSQL := sSQL +
    '    AND HST.VALORRECEBIDO     <= ' + OraNumero(Trim(edValorPagoMax.Text))                      + #13;

      if (Trim(dtEmissaoIni.Text) <> '') and
         (Trim(dtEmissaoFim.Text) <> '') and
         (Trim(dtEmissaoIni.Text) = Trim(dtEmissaoFim.Text)) then sSQL := sSQL +
    '    AND TRUNC(HST.DATAEMISSCOB) = TO_DATE('''+ Trim(dtEmissaoIni.Text)+''',''DD/MM/YYYY'') '   + #13
      else
      begin
        if (Trim(dtEmissaoIni.Text) <> '') then sSQL := sSQL +
    '    AND HST.DATAEMISSCOB      >= TO_DATE('''+ Trim(dtEmissaoIni.Text)+''',''DD/MM/YYYY'') '    + #13;

        if (Trim(dtEmissaoFim.Text) <> '') then sSQL := sSQL +
    '    AND HST.DATAEMISSCOB      <= TO_DATE('''+ Trim(dtEmissaoFim.Text)+''',''DD/MM/YYYY'') '    + #13;
      end;

      if rgrpPagamento.ItemIndex = 0 then       sSQL := sSQL +  // enviado e nao recebido
    '    AND HST.SITRECEBIMENTO     = 1 '                                                           + #13 +
    '    AND HST.CODDOCUMENTOPREV   IS NOT NULL '                                                   + #13
      else if rgrpPagamento.ItemIndex = 1 then  sSQL := sSQL +  // nao enviado
    '    AND HST.SITRECEBIMENTO     = 0 '                                                           + #13
      else if rgrpPagamento.ItemIndex = 2 then  sSQL := sSQL +  // recebido ok
    '    AND HST.SITRECEBIMENTO     IN (2, 5) '                                                     + #13
      else if rgrpPagamento.ItemIndex = 3 then  sSQL := sSQL +  // parcialmente recebido
    '    AND HST.SITRECEBIMENTO     IN (3, 4, 6) '                                                  + #13
      else if rgrpPagamento.ItemIndex = 4 then  sSQL := sSQL +  // Cancelada
    '    AND HST.SITRECEBIMENTO     = 8 '                                                           + #13 +
    '    AND HST.DATACANCELAMENTO   IS NOT NULL'                                                    + #13;

       if Trim(edNossoNumero.Text) <> '' then sSQL := sSQL +
    '    AND D.NOSSONUMERO          = ' + QuotedStr(Trim(edNossoNumero.Text))                       + #13;

    end;

    sSQL := sSQL +
    '    AND HST.FLGDESCFOLHA       = 0 '                                                           + #13 +
    '    AND HST.CODDOCUMENTOPREV   = D.CODDOCUMENTO(+) '                                           + #13 +
    '    AND P.IDPESSOA             = HST.IDPESSOA '                                                + #13 +
    '    AND PAT.IDPESSOA           = HST.IDPESSJUR '                                               + #13 +
    '    AND CPP.IDPESSJUR          = HST.IDPESSJUR '                                               + #13 +
    '    AND CPP.IDPLANOPREV        = HST.IDPLANOPREV '                                             + #13 +
    '    AND CPP.IDPESSOA           = HST.IDPESSOA '                                                + #13 +
    '    AND CPP.SEQPROPOSTA        = HST.SEQPROPOSTA '                                             + #13 +
    '    AND CPP.IDCONTRIBUICAO     = HST.IDCONTRIBUICAO '                                          + #13 +
    '    AND PP.IDPESSJUR           = CPP.IDPESSJUR '                                               + #13 +
    '    AND PP.IDPLANOPREV         = CPP.IDPLANOPREV '                                             + #13 +
    '    AND PP.IDPESSOA            = CPP.IDPESSOA '                                                + #13 +
    '    AND PP.SEQPROPOSTA         = CPP.SEQPROPOSTA '                                             + #13 +
    '    AND PP.IDPLANOPREV         = CPP.IDPLANOPREV '                                             + #13 +
    '    AND EL.IDPESSOA            = PP.IDPESSOA '                                                 + #13 +
    '    AND EL.IDPESSJUR           = PP.IDPESSJUR '                                                + #13 +
    '    AND EL.IDCARGOEXT          = CEXT.IDCARGOEXT(+) '                                          + #13 +
    //Denise Arruda - 07/08/2008 - N. Sol 95338 -  N. Kintana 411855
    '    AND EL.Idpessjur           = CEXT.Idpessjur(+) '                                           + #13 +
    //Fim - Denise Arruda - 07/08/2008 - N. Sol 95338 -  N. Kintana 411855
    '    AND HST.MESREFERENCIA      = HA.MESREFERENCIA(+) '                                         + #13 +
    '    AND HST.NUMRECEBIMENTO     = HA.NUMRECEBIMENTO(+) '                                        + #13 +
    '    AND HST.MESCOBRANCA        = HA.MESCOBRANCA(+) '                                           + #13 +
    '    AND HST.IDMOTIVO           = HA.IDMOTIVO(+) '                                              + #13 +
    '    AND PL.IDPLANOPREV         = HST.IDPLANOPREV '                                             + #13 +
    '    AND PT.IDPESSOA            = HST.IDPESSJUR '                                               + #13 +
    '    AND PT.IDFUNDACAO          = ' + IntToStr(iIdFundacao)                                     + #13 +
    '    AND C.IDCONTRIBUICAO       = HST.IDCONTRIBUICAO '                                          + #13 +
    '    AND SP.IDSITPART           = PP.IDSITPART '                                                + #13 +

    '  GROUP BY '                                                                                   + #13 +
    '    D.NODOCUMENTO,        D.NOSSONUMERO,          C.NOMERESUM,      '                          + #13 +
    '    P.NOME,               PAT.NOME ,              PL.NOME,          '                          + #13 +
    '    C.NOME,               HST.MESREFERENCIA,      HST.MESCOBRANCA,  '                          + #13 +
    '    HST.DATAPREVISAORECE, HST.VALORESPERADO,      HST.VALORRECEBIDO,'                          + #13 +
    '    HST.DATARECEBIMENTO,  HST.DATACANCELAMENTO,                     '                          + #13 +
    '    HST.IDPESSJUR,        HST.IDPLANOPREV, HST.IDPESSOA, SP.FLGINTERNO, '                      + #13 +
    '    HA.TOTALALTERADORES, '                                                                     + #13 +
    '    HST.DATAEMISSCOB,     EL.MATRICULA,           EL.DATAADMISSAO,  '                          + #13 +
    '    EL.DATADEMISSAO,      EL.NIVEL,               CEXT.TITULO,      '                          + #13 +
    '    PP.DATAINICIOMANUT,   PP.INSCRICAONUMERO,                       '                          + #13 +
    '    PT.NOMEVALORBASE1,    PT.NOMEVALORBASE2,      PT.NOMEVALORBASE3,'                          + #13 +
    '    EL.VALORBASE1,        EL.VALORBASE2,          EL.VALORBASE3,    '                          + #13 +
    '    EL.VALORBASE4,        EL.VALORBASE5,          EL.VALORBASE6,    '                          + #13 +
    '    PP.SALMANTIDO,        PP.SALPARTICIPACAO,     CPP.VALORBASE1, HST.SITRECEBIMENTO, '        + #13 +
    '    HST.CODDOCUMENTOPREV, C.IDCONTRIBUICAO, '                                                  + #13 +
    '    HA.TOTALTRECEBIDO '                                                                        + #13 +
    '  ) R '                                                                                        + #13 ;

    case rgrpOrdem.ItemIndex of
      0: sSQL := sSQL + 'ORDER BY R.IDPESSJUR, R.IDPLANOPREV, R.MATRICULA, R.NOME, '                                            + #13;
      1: sSQL := sSQL + 'ORDER BY R.IDPESSJUR, R.IDPLANOPREV, R.INSCRICAONUMERO, R.NOME, '                                         + #13;
      2: sSQL := sSQL + 'ORDER BY R.IDPESSJUR, R.IDPLANOPREV, R.NOME, '                                                         + #13;
    end;

    sSQL := sSQL +
    '  R.MESREFERENCIA DESC, R.IDCONTRIBUICAO, R.NODOCUMENTO ';

    qryBoletas.Close;
    qryBoletas.SQL.Clear;
    qryBoletas.SQL.Text := sSQL;

    frmAguarde.Mostra('Processando consulta ...');

    qryBoletas.Open;

    frmAguarde.Apaga;
  end;
end;



end.
