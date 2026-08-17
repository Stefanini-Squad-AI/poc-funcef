{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Padrão       : 5.10.18 em diante
Pendência    : 27573
Responsável  : Daniel Simões
Data         : 12/03/2008
Descrição    : Ajuste do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit CRelMapaSeg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, ComCtrls, ExtCtrls, StdCtrls, Mask, wwdbedit, Wwdbspin, TREdit,
  wwdblook, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97,
  Db, DBTables, Wwquery, Pptypes, ppPrvDlg, ppforms, fcCombo, fcColorCombo,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TcfgRelMapaSeg = class(TcfgRel)
    grpAtuarial: TGroupBox;
    Label2: TLabel;
    Label5: TLabel;
    Image2: TImage;
    edtAtuarialPrevisto: TRealEdit;
    edtAtuarialSoma: TRealEdit;
    grpReferencia: TGroupBox;
    Label4: TLabel;
    Label3: TLabel;
    cboMes: TComboBox;
    DBspnAno: TwwDBSpinEdit;
    qryIndice: TwwQuery;
    qryIndiceMOESIGLA: TStringField;
    qryIndiceMOECODIGO: TFloatField;
    qryIndiceMOEDESC: TStringField;
    qryIndiceMOEPERIODICIDADE: TStringField;
    qryIndiceMOEINATIVO: TStringField;
    qryIndiceFLGPERCVALOR: TStringField;
    qryIndiceDATAINICIO: TDateTimeField;
    qryIndiceDATAFIM: TDateTimeField;
    rdgAtuarial: TRadioGroup;
    chkLinhas: TCheckBox;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    Bevel2: TBevel;
    Panel1: TPanel;
    lblProgress: TLabel;
    ProgressBar: TProgressBar;
    rgTipoSegmento: TRadioGroup;
    GroupBox1: TGroupBox;
    edtVlrContabil: TCMDateTimePicker;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    DBcboIndiceCorrecao: TwwDBLookupCombo;
    chkVlrCorrigido: TCheckBox;

    // procedimentos definidos
    function VerificaPreenchimento: boolean;

    procedure MontaQuery;   override;
    procedure FechaQueries; override;

    procedure ProcessaAtualizacao;

    function DataMaisAntigaAquisicao: TDateTime;
    function VlrAquisicaoCorrigidoSegmento(const sTipoImovel: String; const iDaiea: Integer = -1): extended;
    function AluguelSegmento(sTipoImovel: String; const iDaiea:Integer; iAnoAluguel, iMesAluguel: word): currency;
    procedure MontaSql;

    // outros procedimentos
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure chkVlrCorrigidoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);



  private { Private declarations }
   iIndiceCorrecao   : integer;
   fFatorAtuarial    : extended;
   dDataContabil     : TDateTime;
   iAnoAlug,iMesAlug : word;

  public { Public declarations }

  end;



var
  cfgRelMapaSeg: TcfgRelMapaSeg;



implementation
{$R *.DFM}
uses
   uSistema, uMensErro, uDiasInUteis, uComunsImobiliario, uVerificaPreenchimento,
   dRelAdminImobRentab, uFuncoesImob, FEspera, uModuloImobiliario;



function TcfgRelMapaSeg.VerificaPreenchimento: boolean;
var  dDataIniCorrecao : TDateTime;
begin
   Result := False;

   try
      if cboMes.ItemIndex < 0 then
         raise EValidacao.CreateVal('É necessário indicar o Mês!', cboMes);

      if DBspnAno.Value <= 0 then
         raise EValidacao.CreateVal('É necessário indicar o Ano!', DBspnAno);

      if (not chkVlrCorrigido.Checked) and (DBcboIndiceCorrecao.LookupValue = '') then
         raise EValidacao.CreateVal('É necessário indicar o Índice de Correção!', DBcboIndiceCorrecao);

      if (not chkVlrCorrigido.Checked) and (DBcboIndiceCorrecao.LookupValue <> '') then begin
         dDataIniCorrecao := DataMaisAntigaAquisicao;
         if FuncoesImob.BuscaCotacao(StrToInt(DBcboIndiceCorrecao.LookupValue), dDataIniCorrecao , False) = -1 then
            raise EValidacao.CreateVal('O Índice de Correção selecionado não pode ser aplicado! '+#13+
                                       'Existem imóveis adquiridos com data inferior ao início  '+#13+
                                       'da cotação do indice selecionado. ( '+ DateToStr(dDataIniCorrecao)+' )'+#13+
                                       'Favor selecionar outro Índice.', DBcboIndiceCorrecao);
      end;
   except
      on ev : EValidacao do begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;

   Result := True;
end;



procedure TcfgRelMapaSeg.MontaQuery;
var dDataPeriodo,dRecIni,dRecFim : TDateTime;
    iAnoRec,iMesRec : word;
begin
   // Define competência de Recebimento
   iMesRec := (cboMes.ItemIndex + 1);
   iAnoRec := StrToInt(IntToStr(trunc(DBspnAno.Value)));
   dRecIni := EncodeDate(iAnoRec, iMesRec, 1);
   dRecFim := DiasInUteis.UltDiaMes(iAnoRec, iMesRec);

   // Define competência de Aluguel
   iMesAlug := iMesRec - 1;
   iAnoAlug := iAnoRec;
   if iMesAlug <= 0 then begin
     iMesAlug := 12;
     iAnoAlug := iAnoAlug - 1;
   end;

   // se não for informado, baseia o custo contábil no último dia do mês anterior a competencia do Aluguel
   if edtVlrContabil.Date > 0 then begin
      dDataContabil := edtVlrContabil.Date;
   end else begin
      dDataPeriodo  := DiasInUteis.SomaMeses(EncodeDate(iAnoAlug, iMesAlug, 1), -1);
      dDataContabil := DiasInUteis.UltDiaMes(DiasInUteis.ExtraiAno(dDataPeriodo), DiasInUteis.ExtraiMes(dDataPeriodo));
   end;

   with dtmRelAdminImobRentab do begin

      fFatorAtuarial := ( 1 + edtAtuarialPrevisto.Value / 100) * ( 1 + edtAtuarialSoma.Value / 100) - 1;

      // verifica se é necessária a correção do Vlr de Aquisição
      if not(chkVlrCorrigido.Checked) then iIndiceCorrecao  := StrToInt(DBcboIndiceCorrecao.LookupValue);

      // preenche as labels do relatório
      case rdgAtuarial.ItemIndex of
         0: rptMapaSeg_lblCalculoAtuarial.Caption := 'Mínimo Atuarial baseado no Custo Contábil';
         1: rptMapaSeg_lblCalculoAtuarial.Caption := 'Mínimo Atuarial baseado no Valor Corrigido';
      end;
      rptMapaSeg_lblMesRecebto.Caption        := cboMes.Items.Strings[iMesRec  - 1] + ' / ' + IntToStr(iAnoRec);
      rptMapaSeg_lblMesAluguel.Caption        := cboMes.Items.Strings[iMesAlug - 1] + ' / ' + IntToStr(iAnoAlug);
      rptMapaSeg_lblDataContabil.Caption      := FormatDateTime('dd/mm/yyyy', dDataContabil);
      rptMapaSeg_lblAtuarialProjetado.Caption := FormatFloat('##0.00 %;(##0.00 %)', fFatorAtuarial * 100);
      rptMapaSeg_lblIndiceCorrecao.Caption    := DBcboIndiceCorrecao.Text;
      if chkVlrCorrigido.Checked then rptMapaSeg_lblIndiceCorrecao.Caption := ' < NÃO >';

      // determina se imprime linha separadora ou em cores alternadas no relatorio
      bSeparador := chkLinhas.Checked;
      bCorlinha  := chkCorLinha.Checked;
      CorLinha   := cboCorLinha.SelectedColor;

      // carrega parâmetros e abre a query
      MontaSql;
      LimpaParametros(dtmRelAdminImobRentab.qryMapaSeg);
      qryMapaSeg.ParamByName('PDATARECINI').asDateTime  := dRecIni;
      qryMapaSeg.ParamByName('PDATARECFIM').asDateTime  := dRecFim;
      qryMapaSeg.ParamByName('PDATAMOV').asDateTime     := dDataContabil;
      qryMapaSeg.ParamByName('PIDPESSOA').asInteger     := Sistema.idEmpresa;
      qryMapaSeg.ParamByName('PIDMOEDA').asInteger      := ModuloImobiliario.InvestImob.iIdMoedaCAF;
      qryMapaSeg.ParamByName('PIDPAIS').asInteger       := ModuloImobiliario.InvestImob.iIdPaisCAF;
      qryMapaSeg.Open;
   end;
end;

procedure TcfgRelMapaSeg.MontaSql;
begin
  dtmRelAdminImobRentab.qryMapaSeg.SQL.Clear;
  if rgTipoSegmento.ItemIndex = 0 then begin
     dtmRelAdminImobRentab.qryMapaSeg.SQL.Text :=
         'SELECT 0 AS IDCARTEIRASPC, T.CODTIPIMOVEL,           '+#13+
         '       T.DESCTIPOIMOVEL,                             '+#13+
         '       NVL(REC_DES.TOT_RECEBIDO, 0) AS VLR_RECEBIDO, '+#13+
         '       NVL(REC_DES.TOT_PAGO, 0)     AS VLR_PAGO,     '+#13+
         '       NVL(REC_DES.TOT_RECEBIDO, 0) - NVL(REC_DES.TOT_PAGO, 0) AS VLR_LIQUIDO, '+#13+
         '       NVL(CC_SEG.SUMVALCTB,0) + NVL(CO_SEG.VALCTB0,0) AS CUSTO_CONTABIL,      '+#13+
         '       0 AS VLR_CORRIGIDO,   0 AS VLR_ALUGUEL,       '+#13+
         '       0 AS MINIMO_ATUARIAL, 0 AS RECEITAXCC,  0 AS RECEITAXVLR, '+#13+
         '       0 AS REC_CONTRATUAL,  0 AS ALUGUELXCC,  0 AS ALUGUELXVLR  '+#13+
         'FROM             '+#13+
         '   TIPOIMOVEL T, '+#13+
         '   (             '+#13+
         '    SELECT I.CODTIPIMOVEL, '+#13+
         '           SUM ( DECODE(RTRIM(LD.OPERACAO), ''5'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''C'', LD.VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0), 0) ) AS TOT_RECEBIDO, '+#13+
         '           SUM ( DECODE(RTRIM(LD.OPERACAO), ''5'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''D'', LD.VALOR * LI.VLRLANCPAGAR / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCPAGAR / TRD.VALOR), 0), 0) ) AS TOT_PAGO      '+#13+
         '      FROM DOCUMENTO D, LANCTODOCUM LD, '+#13+
         '           LANCAMENTOSIMOVEL LI,        '+#13+
         '           IMOVEL I, RECBTOPAGTO RP,    '+#13+
         '           ( SELECT CODDOCUMENTO, VALOR '+#13+
         '               FROM LANCTODOCUM         '+#13+
         '              WHERE RTRIM(OPERACAO) IN(''1'',''2'',''3'',''12'') '+#13+
         '           ) TRD '+#13+
         '     WHERE ( D.CODDOCUMENTO = LI.CODDOCUMENTO )    '+#13+
         '       AND ( D.CODDOCUMENTO = LD.CODDOCUMENTO )    '+#13+
         '       AND ( D.CODDOCUMENTO = TRD.CODDOCUMENTO )   '+#13+
         '       AND ( D.CODDOCUMENTO = RP.CODDOCUMENTO(+) ) '+#13+
         '       AND ( LI.IDIMOVEL = I.IDIMOVEL ) '+#13+
         '       AND ( RP.DATABAIXA BETWEEN :PDATARECINI AND :PDATARECFIM ) '+#13+
         '     GROUP BY I.CODTIPIMOVEL '+#13+
         '   ) REC_DES, '+#13+
         '   (          '+#13+
         '    SELECT /*+ RULE */                                                                       '+#13+
         '           I.CODTIPIMOVEL,                                                                   '+#13+
         '           (                                                                                 '+#13+
         '            ROUND(SUM(NVL(SB1.VALORG,0)) ,2) + ROUND(SUM(NVL(SB1.CMBEM,0)) ,2) -             '+#13+
         '            ROUND(SUM(NVL(SD1.DEPLANC,0)) ,2) - ROUND(SUM(NVL(SD1.CMDEP,0)) ,2) +            '+#13+
         '            ROUND(SUM(NVL(SB1.REAVVALORG,0) + NVL(SB1.ULTREAVVALORG,0)) ,2) +                '+#13+
         '            ROUND(SUM(NVL(SB1.REAVCMBEM,0) + NVL(SB1.ULTREAVCMBEM,0)) ,2) -                  '+#13+
         '            ROUND(SUM(NVL(SD1.REAVDEPLANC,0) + NVL(SD1.ULTREAVDEPLANC,0)) ,2) -              '+#13+
         '            ROUND(SUM(NVL(SD1.REAVCMDEP,0) + NVL(SD1.ULTREAVCMDEP,0)) ,2)                    '+#13+
         '           ) AS SUMVALCTB                                                                    '+#13+
         '      FROM SALDOCONTABBEM SB1, SLDCTBBEMXDEP SD1,                                            '+#13+
         '           BEM B1, GRUPO G1, IMOVEL I, IMOVELXBEM IXB,                                       '+#13+
         '           (SELECT IDBEM, IDPESSOA, MAX(DATASLDBEM) AS DATA                                  '+#13+
         '              FROM SALDOCONTABBEM                   '+#13+
         '             WHERE DATASLDBEM <= :PDATAMOV          '+#13+
         '               AND MOECODIGO = :PIDMOEDA            '+#13+
         '               AND IDPESSOA  = :PIDPESSOA           '+#13+
         '             GROUP BY IDBEM, IDPESSOA) MAX1         '+#13+
         '     WHERE B1.DATAINICIODEP <= :PDATAMOV            '+#13+
         '       AND G1.FLGIMOVEL = 1                         '+#13+
         '       AND SB1.MOECODIGO = :PIDMOEDA                '+#13+
         '       AND SB1.IDPESSOA  = :PIDPESSOA               '+#13+
         '       AND SD1.IDSLDCTBBEMXDEP = :PIDPAIS           '+#13+
         '       AND B1.IDPESSOA = :PIDPESSOA                 '+#13+
         '       AND B1.IDBEM = IXB.IDBEM                     '+#13+
         '       AND IXB.IDIMOVEL = I.IDIMOVEL                '+#13+
         '       AND SB1.IDBEM = MAX1.IDBEM                   '+#13+
         '       AND SB1.IDPESSOA = MAX1.IDPESSOA             '+#13+
         '       AND SB1.DATASLDBEM = MAX1.DATA               '+#13+
         '       AND SB1.IDBEM = SD1.IDBEM                    '+#13+
         '       AND SB1.IDPESSOA = SD1.IDPESSOA              '+#13+
         '       AND SB1.DATASLDBEM = SD1.DATASLDBEM          '+#13+
         '       AND SB1.MOECODIGO = SD1.MOECODIGO            '+#13+
         '       AND SB1.IDBEM = B1.IDBEM                     '+#13+
         '       AND SB1.IDPESSOA = B1.IDPESSOA               '+#13+
         '       AND SB1.IDGRUPO = G1.IDGRUPO                 '+#13+
         '     GROUP BY I.CODTIPIMOVEL                        '+#13+
         '   ) CC_SEG, '+#13+
         '   ( '+#13+
         '    SELECT I.CODTIPIMOVEL, SUM(L.VALOFI) AS VALCTB0 '+#13+
         '      FROM CAFOBRALANC L, CAFOBRA O, IMOVEL I       '+#13+
         '     WHERE L.IDCAFOBRA = O.IDCAFOBRA    '+#13+
         '       AND O.IDIMOVEL = I.IDIMOVEL      '+#13+
         '       AND O.DTAENCERRAOBRA IS NULL     '+#13+
         '       AND L.DTALANCAMENTO <= :PDATAMOV '+#13+
         '     GROUP BY I.CODTIPIMOVEL '+#13+
         '   ) CO_SEG '+#13+
         'WHERE ( T.CODTIPIMOVEL = REC_DES.CODTIPIMOVEL(+) ) '+#13+
         '  AND ( T.CODTIPIMOVEL = CC_SEG.CODTIPIMOVEL(+) )  '+#13+
         '  AND ( T.CODTIPIMOVEL = CO_SEG.CODTIPIMOVEL(+) )  '+#13+
         'ORDER BY T.DESCTIPOIMOVEL ';

  end else begin
     dtmRelAdminImobRentab.qryMapaSeg.SQL.Text :=
         'SELECT DC.IDCARTEIRASPC, ''     '' AS CODTIPIMOVEL,    '+#13+
         '       DC.DESCARTEIRASPC AS DESCTIPOIMOVEL,            '+#13+
         '       NVL(REC_DES.TOT_RECEBIDO, 0) AS VLR_RECEBIDO,   '+#13+
         '       NVL(REC_DES.TOT_PAGO, 0)     AS VLR_PAGO,       '+#13+
         '       NVL(REC_DES.TOT_RECEBIDO, 0) - NVL(REC_DES.TOT_PAGO, 0) AS VLR_LIQUIDO, '+#13+
         '       NVL(CC_SEG.SUMVALCTB,0) + NVL(CO_SEG.VALCTB0,0) AS CUSTO_CONTABIL,      '+#13+
         '       0 AS VLR_CORRIGIDO,   0 AS VLR_ALUGUEL, '+#13+
         '       0 AS MINIMO_ATUARIAL, 0 AS RECEITAXCC,  0 AS RECEITAXVLR, '+#13+
         '       0 AS REC_CONTRATUAL,  0 AS ALUGUELXCC,  0 AS ALUGUELXVLR  '+#13+
         'FROM                 '+#13+
         '   CARTEIRASPC DC, '+#13+
         '   (                 '+#13+
         '    SELECT DECODE(I.IDCARTEIRASPC, NULL, T.IDCARTEIRASPC, I.IDCARTEIRASPC) AS IDCARTEIRASPC, '+#13+
         '           SUM ( DECODE(RTRIM(LD.OPERACAO), ''5'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''C'', LD.VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0), 0) ) AS TOT_RECEBIDO, '+#13+
         '           SUM ( DECODE(RTRIM(LD.OPERACAO), ''5'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''D'', LD.VALOR * LI.VLRLANCPAGAR / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCPAGAR / TRD.VALOR), 0), 0) ) AS TOT_PAGO      '+#13+
         '      FROM DOCUMENTO D, LANCTODOCUM LD,            '+#13+
         '           LANCAMENTOSIMOVEL LI,                   '+#13+
         '           IMOVEL I, RECBTOPAGTO RP, TIPOIMOVEL T, '+#13+
         '           ( SELECT CODDOCUMENTO, VALOR            '+#13+
         '               FROM LANCTODOCUM                    '+#13+
         '              WHERE RTRIM(OPERACAO) IN(''1'',''2'',''3'',''12'') '+#13+
         '           ) TRD '+#13+
         '     WHERE ( D.CODDOCUMENTO = LI.CODDOCUMENTO )    '+#13+
         '       AND ( D.CODDOCUMENTO = LD.CODDOCUMENTO )    '+#13+
         '       AND ( D.CODDOCUMENTO = TRD.CODDOCUMENTO )   '+#13+
         '       AND ( D.CODDOCUMENTO = RP.CODDOCUMENTO(+) ) '+#13+
         '       AND ( LI.IDIMOVEL = I.IDIMOVEL )            '+#13+
         '       AND ( I.CODTIPIMOVEL = T.CODTIPIMOVEL )     '+#13+
         '       AND ( RP.DATABAIXA BETWEEN :PDATARECINI AND :PDATARECFIM ) '+#13+
         '     GROUP BY DECODE(I.IDCARTEIRASPC, NULL, T.IDCARTEIRASPC, I.IDCARTEIRASPC) '+#13+
         '   ) REC_DES, '+#13+
         '   (          '+#13+
         '    SELECT /*+ RULE */                                                                       '+#13+
         '           DECODE(I.IDCARTEIRASPC, NULL, T.IDCARTEIRASPC, I.IDCARTEIRASPC) AS IDCARTEIRASPC, '+#13+
         '           (                                                                                 '+#13+
         '            ROUND(SUM(NVL(SB1.VALORG,0)) ,2) + ROUND(SUM(NVL(SB1.CMBEM,0)) ,2) -             '+#13+
         '            ROUND(SUM(NVL(SD1.DEPLANC,0)) ,2) - ROUND(SUM(NVL(SD1.CMDEP,0)) ,2) +            '+#13+
         '            ROUND(SUM(NVL(SB1.REAVVALORG,0) + NVL(SB1.ULTREAVVALORG,0)) ,2) +                '+#13+
         '            ROUND(SUM(NVL(SB1.REAVCMBEM,0) + NVL(SB1.ULTREAVCMBEM,0)) ,2) -                  '+#13+
         '            ROUND(SUM(NVL(SD1.REAVDEPLANC,0) + NVL(SD1.ULTREAVDEPLANC,0)) ,2) -              '+#13+
         '            ROUND(SUM(NVL(SD1.REAVCMDEP,0) + NVL(SD1.ULTREAVCMDEP,0)) ,2)                    '+#13+
         '           ) AS SUMVALCTB                                                                    '+#13+
         '      FROM SALDOCONTABBEM SB1, SLDCTBBEMXDEP SD1,                                            '+#13+
         '           BEM B1, GRUPO G1, IMOVEL I, IMOVELXBEM IXB, TIPOIMOVEL T,                         '+#13+
         '           (SELECT IDBEM, IDPESSOA, MAX(DATASLDBEM) AS DATA                                  '+#13+
         '              FROM SALDOCONTABBEM                   '+#13+
         '             WHERE DATASLDBEM <= :PDATAMOV          '+#13+
         '               AND MOECODIGO = :PIDMOEDA            '+#13+
         '               AND IDPESSOA  = :PIDPESSOA           '+#13+
         '             GROUP BY IDBEM, IDPESSOA) MAX1         '+#13+
         '     WHERE B1.DATAINICIODEP <= :PDATAMOV            '+#13+
         '       AND G1.FLGIMOVEL = 1                         '+#13+
         '       AND SB1.MOECODIGO = :PIDMOEDA                '+#13+
         '       AND SB1.IDPESSOA  = :PIDPESSOA               '+#13+
         '       AND SD1.IDSLDCTBBEMXDEP = :PIDPAIS           '+#13+
         '       AND B1.IDPESSOA = :PIDPESSOA                 '+#13+
         '       AND B1.IDBEM = IXB.IDBEM                     '+#13+
         '       AND IXB.IDIMOVEL = I.IDIMOVEL                '+#13+
         '       AND I.CODTIPIMOVEL = T.CODTIPIMOVEL          '+#13+
         '       AND SB1.IDBEM = MAX1.IDBEM                   '+#13+
         '       AND SB1.IDPESSOA = MAX1.IDPESSOA             '+#13+
         '       AND SB1.DATASLDBEM = MAX1.DATA               '+#13+
         '       AND SB1.IDBEM = SD1.IDBEM                    '+#13+
         '       AND SB1.IDPESSOA = SD1.IDPESSOA              '+#13+
         '       AND SB1.DATASLDBEM = SD1.DATASLDBEM          '+#13+
         '       AND SB1.MOECODIGO = SD1.MOECODIGO            '+#13+
         '       AND SB1.IDBEM = B1.IDBEM                     '+#13+
         '       AND SB1.IDPESSOA = B1.IDPESSOA               '+#13+
         '       AND SB1.IDGRUPO = G1.IDGRUPO                 '+#13+
         '     GROUP BY DECODE(I.IDCARTEIRASPC, NULL, T.IDCARTEIRASPC, I.IDCARTEIRASPC) '+#13+
         '   ) CC_SEG, '+#13+
         '   ( '+#13+
         '    SELECT DECODE(I.IDCARTEIRASPC, NULL, T.IDCARTEIRASPC, I.IDCARTEIRASPC) AS IDCARTEIRASPC, '+#13+
         '           SUM(L.VALOFI) AS VALCTB0 '+#13+
         '      FROM CAFOBRALANC L, CAFOBRA O, IMOVEL I, TIPOIMOVEL T '+#13+
         '     WHERE L.IDCAFOBRA = O.IDCAFOBRA       '+#13+
         '       AND O.IDIMOVEL = I.IDIMOVEL         '+#13+
         '       AND I.CODTIPIMOVEL = T.CODTIPIMOVEL '+#13+
         '       AND O.DTAENCERRAOBRA IS NULL        '+#13+
         '       AND L.DTALANCAMENTO <= :PDATAMOV    '+#13+
         '     GROUP BY DECODE(I.IDCARTEIRASPC, NULL, T.IDCARTEIRASPC, I.IDCARTEIRASPC) '+#13+
         '   ) CO_SEG '+#13+
         'WHERE ( DC.CODSEGMENTO = 3 ) '+#13+
         '  AND ( DC.IDCARTEIRASPC = REC_DES.IDCARTEIRASPC(+) ) '+#13+
         '  AND ( DC.IDCARTEIRASPC = CC_SEG.IDCARTEIRASPC(+) )  '+#13+
         '  AND ( DC.IDCARTEIRASPC = CO_SEG.IDCARTEIRASPC(+) )  '+#13+
         'ORDER BY DESCTIPOIMOVEL ';
  end;
end;




procedure TcfgRelMapaSeg.ProcessaAtualizacao;
begin
   with dtmRelAdminImobRentab.qryMapaSeg do begin
      ProgressBar.Max      := RecordCount;
      lblProgress.Visible  := True;
      ProgressBar.Visible  := True;
      ProgressBar.Position := 0;
      Repaint;
      Application.ProcessMessages;

      First;
      while not(EOF) do begin
         Edit;

         // calcula o valor corrigido
         dtmRelAdminImobRentab.qryMapaSegVLR_CORRIGIDO.AsFloat := VlrAquisicaoCorrigidoSegmento(dtmRelAdminImobRentab.qryMapaSegCODTIPIMOVEL.asString,
                                                                                                dtmRelAdminImobRentab.qryMapaSegIDCARTEIRASPC.AsInteger);
         // calcula o Mínimo Atuarial de acordo com o método escolhido
         case rdgAtuarial.ItemIndex of
            0: dtmRelAdminImobRentab.qryMapaSegMINIMO_ATUARIAL.AsFloat  := dtmRelAdminImobRentab.qryMapaSegCUSTO_CONTABIL.AsFloat * fFatorAtuarial / 12;
            1: dtmRelAdminImobRentab.qryMapaSegMINIMO_ATUARIAL.AsFloat  := dtmRelAdminImobRentab.qryMapaSegVLR_CORRIGIDO.AsFloat * fFatorAtuarial / 12;
         end;

         dtmRelAdminImobRentab.qryMapaSegVLR_ALUGUEL.AsFloat := AluguelSegmento(dtmRelAdminImobRentab.qryMapaSegCODTIPIMOVEL.AsString,
                                                                                dtmRelAdminImobRentab.qryMapaSegIDCARTEIRASPC.AsInteger,
                                                                                iAnoAlug, iMesAlug);

         // se houer custo contábil faz a conta, para evitar divisão por ZERO
         if dtmRelAdminImobRentab.qryMapaSegCUSTO_CONTABIL.AsFloat <> 0 then begin
            dtmRelAdminImobRentab.qryMapaSegALUGUELXCC.AsFloat := dtmRelAdminImobRentab.qryMapaSegVLR_ALUGUEL.asFloat / dtmRelAdminImobRentab.qryMapaSegCUSTO_CONTABIL.AsFloat * 100;
            dtmRelAdminImobRentab.qryMapaSegRECEITAXCC.AsFloat := dtmRelAdminImobRentab.qryMapaSegVLR_LIQUIDO.asFloat / dtmRelAdminImobRentab.qryMapaSegCUSTO_CONTABIL.AsFloat * 100;
         end else begin
            dtmRelAdminImobRentab.qryMapaSegALUGUELXCC.AsFloat := 0;
            dtmRelAdminImobRentab.qryMapaSegRECEITAXCC.AsFloat := 0;
         end;

         // se houver custo de aquisição corrigido faz a conta, para evitar divisão por ZERO
         if dtmRelAdminImobRentab.qryMapaSegVLR_CORRIGIDO.AsFloat <> 0 then begin
            dtmRelAdminImobRentab.qryMapaSegALUGUELXVLR.AsFloat := dtmRelAdminImobRentab.qryMapaSegVLR_ALUGUEL.asFloat / dtmRelAdminImobRentab.qryMapaSegVLR_CORRIGIDO.AsFloat * 100;
            dtmRelAdminImobRentab.qryMapaSegRECEITAXVLR.AsFloat := dtmRelAdminImobRentab.qryMapaSegVLR_LIQUIDO.asFloat / dtmRelAdminImobRentab.qryMapaSegVLR_CORRIGIDO.AsFloat * 100;
         end else begin
            dtmRelAdminImobRentab.qryMapaSegALUGUELXVLR.AsFloat := 0;
            dtmRelAdminImobRentab.qryMapaSegRECEITAXVLR.AsFloat := 0;
         end;

         Post;

         ProgressBar.Position := ProgressBar.Position + 1;
         Application.ProcessMessages;

         Next;
      end;

      lblProgress.Visible  := False;
      ProgressBar.Visible  := False;
      Repaint;
      Application.ProcessMessages;
   end;
end;



function TcfgRelMapaSeg.DataMaisAntigaAquisicao: TDateTime;
begin
   with dtmRelAdminImobRentab.qryDataAntiga do begin
      Close;
      SQL.Text := 'SELECT MIN(I.IMODATACOMPRA) ' + #13 +
                  '  FROM IMOVEL I ' + #13 +
                  ' WHERE ( I.FLGTIPOIMOVEL = 1 ) ' + #13 +
                  '   AND ( I.IMODATACOMPRA IS NOT NULL ) ' + #13 +
                  '   AND ( I.IDPESSOA = ' + IntToStr(Sistema.idEmpresa) + ' ) ';
      Open;
      Result := Fields[0].asDateTime;
      Close;
   end;
end;



function TcfgRelMapaSeg.AluguelSegmento(sTipoImovel: String; const iDaiea:Integer; iAnoAluguel, iMesAluguel: word): currency;
begin
   with dtmRelAdminImobRentab.qryAluguelSegmento do begin
      LimpaParametros(dtmRelAdminImobRentab.qryAluguelSegmento);
      if sTipoImovel <> '' then ParamByName('TIPOIMOVEL').AsString := sTipoImovel;
      if iDaiea       > 0  then ParamByName('DAIEA').AsInteger := iDaiea;
      ParamByName('MES').AsInteger := iMesAluguel;
      ParamByName('ANO').AsInteger := iAnoAluguel;
      Open;

      Result := dtmRelAdminImobRentab.qryAluguelSegmentoALUGUEL_MESTRE.asFloat;
      Close;
   end;
end;



function TcfgRelMapaSeg.VlrAquisicaoCorrigidoSegmento(const sTipoImovel: String; const iDaiea: Integer): extended;
var fTotalCorrigido: extended;
begin
   with dtmRelAdminImobRentab.qryImovelXMestre do begin
      LimpaParametros(dtmRelAdminImobRentab.qryImovelXMestre);
      if sTipoImovel <> '' then ParamByName('TIPOIMOVEL').AsString := sTipoImovel;
      if iDaiea       > 0  then ParamByName('DAIEA').AsInteger := iDaiea;

      // Daniel Simões - 28/04/2006 - 22138
      if ( edtVlrContabil.Text <> '' ) then
        ParamByName('DTBASE').AsDateTime := StrToDate(edtVlrContabil.Text)
      else
        ParamByName('DTBASE').AsDateTime := Date;
      // Daniel Simões - 28/04/2006 - 22138

      Open;

      First;
      fTotalCorrigido := 0;
      while not(EOF) do begin
         fTotalCorrigido := fTotalCorrigido + dtmRelAdminImobRentab.VlrAquisicaoImovel(FieldByName('IDIMOVEL').AsInteger, iIndiceCorrecao, dDataContabil, not(chkVlrCorrigido.Checked));
         Next;
      end;
      Close;
   end;
   Result := fTotalCorrigido;
end;



procedure TcfgRelMapaSeg.FechaQueries;
begin
   qryIndice.Close;
   with dtmRelAdminImobRentab do begin
      qryMapaSeg.Close;
      qryDataAntiga.Close;
      qryAluguelMestre.Close;
      qryImovelxMestre.Close;
   end;
end;


procedure TcfgRelMapaSeg.bbtnConfirmarClick(Sender: TObject);
begin
   if VerificaPreenchimento then begin
      try
         DesabilitaBotoes;

         frmEspera.Config('Aguarde', 'Selecionando Segmentos...', False);
         frmEspera.Show;
         Application.ProcessMessages;

         MontaQuery;

         frmEspera.Hide;
         frmEspera.Config('', '', False);

         // processa o cálculo de atualização monetária e do rateio do custo contábil
         ProcessaAtualizacao;

         dtmRelAdminImobRentab.rptMapaSeg.Print;
         Repaint;
      finally
         dtmRelAdminImobRentab.qryMapaSeg.Close;
         HabilitaBotoes;
      end;
   end;
end;



procedure TcfgRelMapaSeg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if ( (dtmRelAdminImobRentab.qryMapaSeg.Active) and (dtmRelAdminImobRentab.qryMapaSeg.UpdatesPending) ) then begin
      dtmRelAdminImobRentab.qryMapaSeg.CancelUpdates;
   end;
   inherited;
end;


procedure TcfgRelMapaSeg.FormShow(Sender: TObject);
begin
   inherited;
   // preenche a data de lançamento e o ano de referência/competência
   cboMes.ItemIndex      := DiasInUteis.ExtraiMes(Date) - 1;
   DBspnAno.Value        := DiasInUteis.ExtraiAno(Date);
   edtAtuarialSoma.Value := 6;
   qryIndice.Open;
   Screen.Cursor         := crDefault;
end;



procedure TcfgRelMapaSeg.chkVlrCorrigidoClick(Sender: TObject);
begin
   inherited;
   if chkVlrCorrigido.Checked then DBcboIndiceCorrecao.Clear;
end;



procedure TcfgRelMapaSeg.FormCreate(Sender: TObject);
begin
   inherited;
   ppRegisterForm(TppCustomPreviewer, TppPrintPreview);
end;


end.
