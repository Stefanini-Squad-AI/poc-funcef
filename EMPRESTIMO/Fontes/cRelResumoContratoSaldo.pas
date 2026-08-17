unit cRelResumoContratoSaldo;

// Alterações:
{
 --------------------------------------------------------------------------------------------------
Pendência   : SOL 253185 PPM 771995
Responsável : William Moreira da Silva
Data        : 17/06/2015
Descrição   : Reestruturação da HistMovEmptmo(*Retirada dos Hint's)
--------------------------------------------------------------------------------------------------
Pendência   : SOL 114575 KINTANA 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
----------------------------------------------------------------------------------------------------
Rotina    : qryContrato
Data      : 10/05/2007
Autor     : Alberto
Pendência : 24970
Descrição : Ajuste na query para utilizar a view VWMIGRACONTRATOEP no lugar da
            tabela PLANPREVXCONTABIL
---------------------------------------------------------------------------------------------------}

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   CRel, fcCombo, fcColorCombo, StdCtrls, Mask, wwdbedit, Wwdbspin,
   wwdblook, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97,
   ExtCtrls, Db, mContratoEmptmo, mListaPlano, mListaPatro, DBTables,
   Wwquery, mListaPlanoContab, uTypesEmptmo;

type
   TcfgRelResumoContratoSaldo = class(TcfgRel)
      Panel1: TPanel;
      Label15: TLabel;
      DBspnAno: TwwDBSpinEdit;
      cboMes: TComboBox;
      GroupBox1: TGroupBox;
      chkCorLinha: TCheckBox;
      cboCorLinha: TfcColorCombo;
      chkLinhas: TCheckBox;
      Label1: TLabel;
      Label2: TLabel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      DBcboTipoContrato: TwwDBLookupCombo;
      molContratoEmptmo: TmolContratoEmptmo;
      molListaPatro: TmolListaPatro;
      chkDivergente: TCheckBox;
      qryRelatorio: TwwQuery;
      qryContratos: TwwQuery;
      qryContratosIDCONTRATOEMPTMO: TFloatField;
      qryContratosDESCTIPOEMPTMO: TStringField;
      qryContratosTCEDESCRICAO: TStringField;
      qryRelatorioIDCONTRATOEMPTMO: TFloatField;
      qryRelatorioNOME: TStringField;
      qryRelatorioMATRICULA: TStringField;
      qryRelatorioINSCRICAONUMERO: TFloatField;
      qryRelatorioDESCTIPOEMPTMO: TStringField;
      qryRelatorioTCEDESCRICAO: TStringField;
      qryRelatorioSITDESCRICAO: TStringField;
      qryRelatorioSALDODEV: TFloatField;
      qryRelatorioCONCESSOES: TFloatField;
      qryRelatorioPARCELAS: TFloatField;
      qryRelatorioAMORTIZACAO: TFloatField;
      qryRelatorioQUITACAO: TFloatField;
      qryRelatorioQUIT_MORT: TFloatField;
      qryRelatorioSALDOATU: TFloatField;
      qryRelatorioDIFERENCA: TFloatField;
      qryContrato: TwwQuery;
      qryContratoNOMEPLANO: TStringField;
      qryContratoNOMEPATRO: TStringField;
      qryContratoTCEDESCRICAO: TStringField;
      qryContratoIDCONTRATOEMPTMO: TFloatField;
      qryContratoMATRICULA: TStringField;
      qryContratoNOME: TStringField;
      qryContratoSIT_PART: TStringField;
      qryContratoTXJUROS: TFloatField;
      qryContratoVLRCONTRATO: TFloatField;
      qryContratoDATACREDITO: TDateTimeField;
      qryContratoNUMPARCELAS: TFloatField;
      qryContratoNOMEPLANOPATRO: TStringField;
      molListaPlano: TmolListaPlanoContab;
      rdgOrdenar: TRadioGroup;
      qryQuitacaoMorte: TwwQuery;
      qryQuitacao: TwwQuery;
      qryMovimentoNormal: TwwQuery;
      qryContratoINSCRICAONUMERO: TFloatField;
      qryMovimentoNormalHMEVLRPREVISTO: TFloatField;
      qryQuitacaoHMEVLRPREVISTO: TFloatField;
      qryQuitacaoMorteHMEVLRPREVISTO: TFloatField;
      chkSintetico: TCheckBox;
      qryMovimentoNormalVLR_CONTAB: TFloatField;
      qryMovimentoNormalVLR_ESTORNADO_CONTAB: TFloatField;
      qryQuitacaoVLR_CONTAB: TFloatField;
      qryQuitacaoVLR_ESTORNADO_CONTAB: TFloatField;
      qryQuitacaoMorteVLR_CONTAB: TFloatField;
      qryQuitacaoMorteVLR_ESTORNADO_CONTAB: TFloatField;
    qryLookTipoContr: TwwQuery;
    qryLookTipoContrIDTIPOCONTREMPTMO: TFloatField;
    qryLookTipoContrTCEDESCRICAO: TStringField;
    qryLookTipoContrIDTIPOEMPTMO: TFloatField;
    qryLookTipoContrDESCTIPOEMPTMO: TStringField;
    qryLookTipoContrIDPLANOPREV: TFloatField;

      procedure FormShow(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure DBcboTipoEmptmoExit(Sender: TObject);
      procedure molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
      procedure molContratoEmptmobtnLimpaContratoClick(Sender: TObject);
      procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
      procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
      procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
      procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
      procedure qryContratosBeforeOpen(DataSet: TDataSet);


   private  // Private declarations

      procedure AbreQueries;

      procedure MontaQuery; override;
      procedure FiltraRelatorio;
      procedure FiltraRelatorioAtuDia;


   public   // Public declarations

   end;



var
  cfgRelResumoContratoSaldo: TcfgRelResumoContratoSaldo;



implementation
{$R *.DFM}
uses
   dLookEmptmo, uDiasUteis, uMensErro, uSistema, uFuncoesEmptmo, dEmptmo, uCalcEmptmo,
   dRelResumoContratoSaldo, FProgresso, FProgressoDuplo;




procedure TcfgRelResumoContratoSaldo.AbreQueries;
begin
   // Tipo de Empréstimo
   with dtmLookEmptmo.qryLookTipoEmptmo do begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoEmptmo);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
   end;

   // Tipo de Contrato
   LimpaParametros(dtmLookEmptmo.qryLookPlanPrev);
   dtmLookEmptmo.qryLookPlanPrev.Open;
end;



procedure TcfgRelResumoContratoSaldo.MontaQuery;
begin
   inherited;

   with dtmRelResumoContratoSaldo do
   begin
      sMesCompetencia   := cboMes.Text + ' / ' + DBspnAno.Text;
      bSeparador        := chkLinhas.Checked;
      bCorlinha         := chkCorLinha.Checked;
      CorLinha          := cboCorLinha.SelectedColor;

      bSintetico        := chkSintetico.Checked;
   end;

   ParametrosSistema;

   case dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger of
      0: FiltraRelatorio;
      1: FiltraRelatorioAtuDia;
   end;
end;



procedure TcfgRelResumoContratoSaldo.FiltraRelatorio;
var
   sSQL              : String;
   sDataAnt          : String;
   sDataAtu          : String;
   bInsere           : Boolean;
   dDataAnt          : TDateTime;
   dDataAtu          : TDateTime;
   iContador         : Integer;
   iMesAnt, iMesAtu  : Integer;
   iAnoAnt, iAnoAtu  : Integer;
begin
   dDataAtu := DiasUteis.UltDiaMes(Trunc(DBspnAno.Value), (cboMes.ItemIndex + 1));

   dDataAnt := EncodeDate(Trunc(DBspnAno.Value), (cboMes.ItemIndex + 1), 1);
   dDataAnt := DiasUteis.SomaMeses(dDataAnt, -1);
   dDataAnt := DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(dDataAnt), DiasUteis.ExtraiMes(dDataAnt));

   iAnoAnt  := DiasUteis.ExtraiAno(dDataAnt);
   iMesAnt  := DiasUteis.ExtraiMes(dDataAnt);

   iAnoAtu  := DiasUteis.ExtraiAno(dDataAtu);
   iMesAtu  := DiasUteis.ExtraiMes(dDataAtu);

   sDataAnt := QuotedStr(FormatDateTime('dd/mm/yyyy', dDataAnt));
   sDataAtu := QuotedStr(FormatDateTime('dd/mm/yyyy', dDataAtu));

   // ----------------------------------------------------------------------------------------------
   sSQL :=
   'SELECT '                                                                              + #13 +
   '  CON.IDCONTRATOEMPTMO, '                                                             + #13 +
   '  TEP.DESCTIPOEMPTMO, '                                                               + #13 +
   '  TCE.TCEDESCRICAO, '                                                                 + #13 +
   '  PES.NOME '                                                                          + #13 +

   'FROM '                                                                                + #13 +
   '  CONTRATOEMPTMO  CON, '                                                              + #13 +
   '  PESSOA          PES, '                                                              + #13 +

   '-- SALDO ANTERIOR ---------------------------------------------------------------------- '  + #13 +
   '  ( '                                                                                       + #13 +
   '  SELECT '                                                                                  + #13 +
   '     C.IDCONTRATOEMPTMO, NVL(H.HMESALDODEV, 0) AS SALDODEV '                                + #13 +
   '  FROM '                                                                                    + #13 +
   '     HISTMOVEMPTMO H, CONTRATOEMPTMO C, '                                                   + #13 +
   '     ( '                                                                                    + #13 +
   '     SELECT '                                                                               + #13 +
   '        CON.IDCONTRATOEMPTMO, MAX(IDHISTMOVEMPTMO) AS IDHISTMOVEMPTMO '                     + #13 +
   '     FROM '                                                                                 + #13 +
   '        HISTMOVEMPTMO HME, CONTRATOEMPTMO CON, '                                            + #13 +
   '        ITEMXTIPOCONTR ITC, ITEMEMPTMO ITE, TIPOCONTREMPTMO TCE '                           + #13 +
   '     WHERE '                                                                                + #13 +
   '            CON.FLGSITUACAO          <> ''C'' '                                             + #13 +
   '        AND ITC.ITCTRATASALDODEV     <> 0 '                                                 + #13 +
   '        AND CON.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                 + #13 +
   '        AND CON.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                 + #13;

   // Tipo de Contrato
   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '        AND CON.IDTIPOCONTREMPTMO    = ' + DBcboTipoContrato.LookupValue                    + #13;

   // Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '        AND CON.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)  + #13;

   sSQL := sSQL +
   '        AND ( HME.HMEDATAATUALIZA    = '                                                    + #13 +
   '              ( '                                                                           + #13 +
   '              SELECT '                                                                      + #13 +
   '                 MAX(H.HMEDATAATUALIZA) '                                                   + #13 +
   '              FROM '                                                                        + #13 +
   '                 HISTMOVEMPTMO   H, '                                                       + #13 +
   '                 CONTRATOEMPTMO  C, '                                                       + #13 +
   '                 ITEMXTIPOCONTR  IT '                                                       + #13 +
   '              WHERE '                                                                       + #13 +
   '                     C.IDCONTRATOEMPTMO    = CON.IDCONTRATOEMPTMO '                         + #13 +
   '                 AND H.HMEDATAATUALIZA    <= TO_DATE(' + sDataAnt + ', ''DD/MM/YYYY'') '    + #13 +
   '                 AND IT.ITCTRATASALDODEV  <> 0 '                                            + #13 +
   '                 AND H.HMEANOCOMPETENCIA   = ' + IntToStr(iAnoAnt)                          + #13 +
   '                 AND H.HMEMESCOMPETENCIA   = ' + IntToStr(iMesAnt)                          + #13 +
   '                 AND ( H.FLGESTORNADO      = 0 OR H.FLGESTORNADO IS NULL ) '                + #13 +
   '                 AND H.IDCONTRATOEMPTMO    = C.IDCONTRATOEMPTMO '                           + #13 +
   '                 AND C.IDTIPOCONTREMPTMO   = IT.IDTIPOCONTREMPTMO '                         + #13 +
   '                 AND H.IDITEMEMPTMO        = IT.IDITEMEMPTMO '                              + #13 +
   '              ) '                                                                           + #13 +
   '            ) '                                                                             + #13 +
   '        AND ( (HME.FLGESTORNADO      = 0) OR (HME.FLGESTORNADO IS NULL) ) '                 + #13 +
   '        AND HME.HMEANOCOMPETENCIA    = ' + IntToStr(iAnoAnt)                                + #13 +
   '        AND HME.HMEMESCOMPETENCIA    = ' + IntToStr(iMesAnt)                                + #13 +
   '        AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO ) '                             + #13 +
   '        AND ( CON.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO ) '                            + #13 +
   '        AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO ) '                            + #13 +
   '        AND ( TCE.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO ) '                            + #13 +
   '        AND ( HME.IDITEMEMPTMO       = ITE.IDITEMEMPTMO ) '                                 + #13 +
   '        AND ( ITE.IDITEMEMPTMO       = ITC.IDITEMEMPTMO ) '                                 + #13 +
   '        AND ( HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO ) '                                 + #13 +
   '     GROUP BY '                                                                             + #13 +
   '        CON.IDCONTRATOEMPTMO '                                                              + #13 +
   '     ) M '                                                                                  + #13 +
   '  WHERE '                                                                                   + #13 +
   '         C.IDPATRO                    IN (' + molListaPatro.PegaPatro + ') '                + #13 +
   '     AND C.IDPLANOPREV                IN (' + molListaPlano.PegaPlano + ') '                + #13;

   // Tipo de Contrato
   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '     AND C.IDTIPOCONTREMPTMO          = ' + DBcboTipoContrato.LookupValue                   + #13;

   // Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '     AND C.IDCONTRATOEMPTMO           = ' + FormatFloat('#0', molContratoEmptmo.IDContrato) + #13;

   sSQL := sSQL +
   '     AND M.IDHISTMOVEMPTMO            = H.IDHISTMOVEMPTMO '                                 + #13 +
   '     AND M.IDCONTRATOEMPTMO           = H.IDCONTRATOEMPTMO '                                + #13 +
   '     AND H.IDCONTRATOEMPTMO           = C.IDCONTRATOEMPTMO '                                + #13 +
   '  ) SALDOANT, '                                                                             + #13 +
   '-- FIM SALDO ANTERIOR ------------------------------------------------------------------ '  + #13 +

   '  TIPOCONTREMPTMO TCE, '                                                              + #13 +
   '  TIPOEMPTMO      TEP '                                                               + #13 +

   'WHERE '                                                                               + #13 +
   '      TEP.IDEMPRESAPROP               = ' + IntToStr(Sistema.IDEmpresa)               + #13 +
   '  AND CON.FLGSITUACAO                 <> ''C'' '                                      + #13 +
   '  AND CON.IDPATRO                     IN (' + molListaPatro.PegaPatro + ') '          + #13 +
   '  AND CON.IDPLANOPREV                 IN (' + molListaPlano.PegaPlano + ') '          + #13;

   // Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '  AND CON.IDCONTRATOEMPTMO            = ' + FormatFloat('#0', molContratoEmptmo.IDContrato) + #13;

   // Tipo de Empréstimo
   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '  AND TCE.IDTIPOEMPTMO                = ' + DBcboTipoEmptmo.LookupValue               + #13;

   // Tipo de Contrato
   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '  AND CON.IDTIPOCONTREMPTMO           = ' + DBcboTipoContrato.LookupValue             + #13;

   sSQL := sSQL +
   '  AND TEP.IDTIPOEMPTMO       = TCE.IDTIPOEMPTMO '                                     + #13 +
   '  AND TCE.IDTIPOCONTREMPTMO  = CON.IDTIPOCONTREMPTMO '                                + #13 +
   '  AND CON.IDCONTRATOEMPTMO   = SALDOANT.IDCONTRATOEMPTMO '                            + #13 +
   '  AND CON.IDBENEF            = PES.IDPESSOA '                                         + #13 +

   'ORDER BY '                                                                            + #13 +
   '   TEP.DESCTIPOEMPTMO, TCE.TCEDESCRICAO, CON.IDCONTRATOEMPTMO ';

   qryContratos.Close;
   qryContratos.SQL.Clear;
   qryContratos.SQL.Text := sSQL;

   MostraEspera('Selecionando Contratos...');

   qryContratos.Open;
   qryContratos.First;
   // ----------------------------------------------------------------------------------------------

   dtmRelResumoContratoSaldo.qryResumoContratoSaldo.Close;
   dtmRelResumoContratoSaldo.qryResumoContratoSaldo.Open;

   EscondeEspera;

   iContador := 0;

   frmProgresso.MostraFormProgresso('Gerando relatório...',
                                    True,
                                    True,
                                    True,
                                    0,
                                    qryContratos.RecordCount,
                                   );

   while not(qryContratos.EOF) do
   begin
      with qryRelatorio do
      begin
         LimpaParametros(qryRelatorio);

         ParamByName('PIDEMPRESAPROP').AsInteger      := Sistema.IDEmpresa;
         ParamByName('PIDCONTRATOEMPTMO').AsFloat     := qryContratosIDCONTRATOEMPTMO.AsFloat;

         ParamByName('PHMEDATAANT').AsDateTime        := dDataAnt;
         ParamByName('PHMEDATAATU').AsDateTime        := dDataAtu;

         ParamByName('PHMEANOANT').AsInteger          := iAnoAnt;
         ParamByName('PHMEMESANT').AsInteger          := iMesAnt;
         ParamByName('PHMEANOATU').AsInteger          := iAnoAtu;
         ParamByName('PHMEMESATU').AsInteger          := iMesAtu;

         Open;

         if not(qryRelatorio.IsEmpty) then
         begin
            bInsere := True;
            if chkDivergente.Checked then bInsere := qryRelatorioDIFERENCA.AsCurrency <> 0;

            if bInsere then
            begin
               with dtmRelResumoContratoSaldo.qryResumoContratoSaldo do
               begin
                  Append;

                  FieldByName('IDCONTRATOEMPTMO').AsFloat   := qryRelatorioIDCONTRATOEMPTMO.AsFloat;

                  FieldByName('NOME').AsString              := qryRelatorioNOME.AsString;
                  FieldByName('MATRICULA').AsString         := qryRelatorioMATRICULA.AsString;
                  FieldByName('INSCRICAONUMERO').AsInteger  := qryRelatorioINSCRICAONUMERO.AsInteger;
                  FieldByName('DESCTIPOEMPTMO').AsString    := qryRelatorioDESCTIPOEMPTMO.AsString;
                  FieldByName('TCEDESCRICAO').AsString      := qryRelatorioTCEDESCRICAO.AsString;
                  FieldByName('SITDESCRICAO').AsString      := qryRelatorioSITDESCRICAO.AsString;

                  FieldByName('SALDODEV').AsCurrency        := qryRelatorioSALDODEV.AsCurrency;
                  FieldByName('CONCESSOES').AsCurrency      := qryRelatorioCONCESSOES.AsCurrency;
                  FieldByName('PARCELAS').AsCurrency        := qryRelatorioPARCELAS.AsCurrency;
                  FieldByName('AMORTIZACAO').AsCurrency     := qryRelatorioAMORTIZACAO.AsCurrency;
                  FieldByName('QUITACAO').AsCurrency        := qryRelatorioQUITACAO.AsCurrency;
                  FieldByName('QUIT_MORT').AsCurrency       := qryRelatorioQUIT_MORT.AsCurrency;
                  FieldByName('SALDOATU').AsCurrency        := qryRelatorioSALDOATU.AsCurrency;
                  FieldByName('DIFERENCA').AsCurrency       := qryRelatorioDIFERENCA.AsCurrency;

                  Post;
               end;  // with dtmRelResumoContratoSaldo.qryResumoContratoSaldo
            end;  // if bInsere
         end;  // if not(qryRelatorio.IsEmpty)

         Close;
      end;  // with qryRelatorio

      if frmProgresso.Cancelou then
      begin
         qryContratos.Close;
         qryRelatorio.Close;
         Exit;
      end;

      inc(iContador);
      frmProgresso.AndaFormProgresso(iContador);

      qryContratos.Next;
   end;  // while not(qryContratos.EOF)

   frmProgresso.EscondeFormProgresso;
end;



procedure TcfgRelResumoContratoSaldo.FiltraRelatorioAtuDia;
var
   Arquivo           : TextFile;
   sArquivo          : String;
   sLinha            : String;

   iRegistro         : Integer;

   iPatro            : Integer;
   iPlano            : Integer;
   iTipoContr        : Integer;

   iContadorCima     : Integer;
   iContadorBaixo    : Integer;

   iContadorPlano    : Integer;
   iContadorPatro    : Integer;

   iQuantTipoContr   : Integer;
   iTotalPxPxTC      : Integer;

   bGrava            : Boolean;

   rSaldoDevAnt      : TSaldoDevAnt;
   rSaldoDevAtu      : TSaldoDevAnt;

   dDataAnt          : TDateTime;
   dDataAtu          : TDateTime;

   fVlrConcessao     : Currency;
   fVlrConcContab    : Currency;
   fVlrConcEstorno   : Currency;
   fVlrParcela       : Currency;
   fVlrParcContab    : Currency;
   fVlrParcEstorno   : Currency;
   fVlrAmortizacao   : Currency;
   fVlrAmortCotab    : Currency;
   fVlrAmortEstorno  : Currency;
   fVlrAtuDia        : Currency;
   fVlrAtuDiaContab  : Currency;
   fVlrAtuDiaEstorno : Currency;
   fVlrAjuste        : Currency;
   fVlrAjusteContab  : Currency;
   fVlrAjusteEstorno : Currency;
   fVlrQuitacao      : Currency;
   fVlrQuitContab    : Currency;
   fVlrQuitEstorno   : Currency;
   fVlrQuitacaoMorte : Currency;
   fVlrMorteContab   : Currency;
   fVlrMorteEstorno  : Currency;

   fVlrDiverg        : Currency;
begin
   dDataAtu := DiasUteis.UltDiaMes(trunc(DBspnAno.Value), (cboMes.ItemIndex + 1));

   dDataAnt := EncodeDate(Trunc(DBspnAno.Value), (cboMes.ItemIndex + 1), 1);
   dDataAnt := DiasUteis.SomaMeses(dDataAnt, -1);
   dDataAnt := DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(dDataAnt), DiasUteis.ExtraiMes(dDataAnt));

   with qryLookTipoContr do
   begin
      LimpaParametros(qryLookTipoContr);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
   end;

   iRegistro         := 0;
   iQuantTipoContr   := qryLookTipoContr.RecordCount;
   iTotalPxPxTC      := molListaPlano.lstPlano.Items.Count *
                        molListaPatro.lstPatro.Items.Count *
                        iQuantTipoContr;

   // ----------------------------------------------------------------------------------------------

   dtmRelResumoContratoSaldo.qryResumoContratoSaldo.Close;
   dtmRelResumoContratoSaldo.qryResumoContratoSaldo.Open;
   
  //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
  //sArquivo := Sistema.TempDir + 'EP-RelResumoContratoSaldo' +
    sArquivo := ftempregra + '\' + 'EP-RelResumoContratoSaldo' +
               FormatFloat('0000', trunc(DBspnAno.Value)) + '-' +
               FormatFloat('00', (cboMes.ItemIndex + 1))  + '.txt';

   AssignFile(Arquivo, sArquivo);

   // ----------------------------------------------------------------------------------------------

   try
      // ----------------------------------------------------------------------------------------------
      // Faz TRÊS loops aninhados: por Plano, por Patro e por Tipo de Contrato
      // ----------------------------------------------------------------------------------------------
      frmProgressoDuplo.MostraFormProgressoDuplo('Processando Plano, Patrociandora, Tipo de Contrato...',   // Legenda de cima
                                                 'Processando Contratos...',                                // Legenda de Baixo
                                                 0,                        // Mínimo de cima
                                                 0,                        // Mínimo de baixo
                                                 iTotalPxPxTC,             // Máximo de cima
                                                 0,                        // Máximo de baixo
                                                 True,                     // Botão visível
                                                 True                      // Botão habilitado
                                                );
      Repaint;

      iContadorCima  := 0;

      // -------------------------------------------------------------------------------------------
      ReWrite(Arquivo);
      sLinha   := ' ^Plano^Patrocinadora^Tipo de Contrato^NºContrato^Matricula^Inscricao Prev.^' +
                  'Mutuário^Situacao^Saldo Inicial^' +
                  'Concessao^Concessao Contabilizada^Concessao Estornada^' +
                  'Atualizacao Diaria^Atualizacao Diaria Contabilizada^Atualizacao Diaria Estornada^' +
                  'Prestacao^Prestacao Contabilizada^Prestacao Estornada^' +
                  'Amortizacao^Amortizacao Contabilizada^Amortizacao Estornada^' +
                  'Quitacao^Quitacao Contabilizada^Quitacao Estornada^' +
                  'Quitacao Morte^Quitacao Morte Contabilizada^Quitacao Morte Estornada^' +
                  'Ajustes^Ajustes Contabilizados^Ajustes Estornados^' +
                  'Saldo Final^Diferenca';

      Writeln(Arquivo, sLinha);
      // -------------------------------------------------------------------------------------------

      // -------------------------------------------------------------------------------------------
      // Loops por Plano, Patro e Tipo de Contrato
      // -------------------------------------------------------------------------------------------
      for iContadorPlano := 0 to (molListaPlano.lstPlano.Items.Count - 1) do
      begin
         if molListaPlano.lstPlano.Checked[iContadorPlano] then
         begin
            // -------------------------------------------------------------------------------------
            for iContadorPatro := 0 to (molListaPatro.lstPatro.Items.Count - 1) do
            begin
               // ----------------------------------------------------------------------------------
               if molListaPatro.lstPatro.Checked[iContadorPatro] then
               begin
                  qryLookTipoContr.First;
                  while not(qryLookTipoContr.EOF) do
                  begin
                     // ----------------------------------------------------------------------------
                     if frmProgressoDuplo.Cancelou then
                     begin
                        Repaint;
                        Application.ProcessMessages;

                        // Verifica se abortou processo
                        if MsgDlg('Deseja realmente interromper o relatório?', 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                        begin
                           Repaint;

                           Exit;
                        end;
                        Repaint;
                     end;
                     Repaint;

                     // ----------------------------------------------------------------------------

                     if molContratoEmptmo.IDContrato > 0 then
                     begin
                        if molContratoEmptmo.IDTipoContr <> qryLookTipoContrIDTIPOCONTREMPTMO.AsInteger then
                        begin
                           qryLookTipoContr.Next;
                           inc(iContadorCima);
                           frmProgressoDuplo.AndaFormProgressoDuplo(iContadorCima, 0);
                           Continue;
                        end;
                     end;

                     // ----------------------------------------------------------------------------

                     if (DBcboTipoContrato.LookupValue <> '') and
                        (qryLookTipoContrIDTIPOCONTREMPTMO.AsInteger <> StrToInt(DBcboTipoContrato.LookupValue)) then
                     begin
                        qryLookTipoContr.Next;
                        inc(iContadorCima);
                        frmProgressoDuplo.AndaFormProgressoDuplo(iContadorCima, 0);
                        Continue;
                     end;

                     // ----------------------------------------------------------------------------

                     with qryContrato do
                     begin
                        LimpaParametros(qryContrato);
                        ParamByName('PIDEMPRESAPROP').AsInteger         := Sistema.IDEmpresa;
                        ParamByName('PIDPATRO').AsInteger               := molListaPatro.vIDPatro[iContadorPatro];
                        ParamByName('IDPLANOPREV').AsInteger            := molListaPlano.vIDPlano[iContadorPlano];
                        ParamByName('PIDTIPOCONTREMPTMO').AsInteger     := qryLookTipoContrIDTIPOCONTREMPTMO.AsInteger;

                        ParamByName('PHMEDATAINI').AsDateTime           := dDataAnt;
                        ParamByName('PHMEDATAFIM').AsDateTime           := dDataAtu;

                        if DBcboTipoContrato.LookupValue <> '' then
                           ParamByName('PIDTIPOCONTRFILTRO').AsInteger  := StrToInt(DBcboTipoContrato.LookupValue);

                        if molContratoEmptmo.IDContrato > 0 then
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat     := molContratoEmptmo.IDContrato;

                        ParamByName('PORDEM').AsInteger                 := rdgOrdenar.ItemIndex;

                        qryContrato.Open;
                     end;
                     // -------------------------------------------------------------------------------

                     frmProgressoDuplo.MostraFormProgressoDuplo('Processando ' +
                                                                molListaPlano.lstPlano.Items[iContadorPlano] + ', ' +
                                                                molListaPatro.lstPatro.Items[iContadorPatro] + ', ' +
                                                                qryLookTipoContrTCEDESCRICAO.AsString + '...',       // Legenda de cima
                                                                'Processando Contratos...',  // Legenda de Baixo
                                                                0,                           // Mínimo de cima
                                                                0,                           // Mínimo de baixo
                                                                iTotalPxPxTC,                // Máximo de cima
                                                                qryContrato.RecordCount,     // Máximo de baixo
                                                                True,                        // Botão visível
                                                                True                         // Botão habilitado
                                                               );
                     Repaint;

                     iContadorBaixo := 0;

                     // ----------------------------------------------------------------------------
                     while not(qryContrato.EOF) do
                     begin
                        // -------------------------------------------------------------------------
                        if frmProgressoDuplo.Cancelou then
                        begin
                           Repaint;
                           Application.ProcessMessages;

                           // Verifica se abortou processo
                           if MsgDlg('Deseja realmente interromper o relatório?', 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                           begin
                              Repaint;

                              Exit;
                           end;
                           Repaint;
                        end;
                        Repaint;
                        // -------------------------------------------------------------------------

                        // Saldo Devedor -----------------------------------------------------------
                        rSaldoDevAnt   := CalcEmptmo.SaldoDevAnt(qryContratoIDCONTRATOEMPTMO.AsFloat,
                                                                 dDataAnt,
                                                                 -1,
                                                                 -1,
                                                                 False
                                                                );
                        // -------------------------------------------------------------------------

                        // Saldo Devedor -----------------------------------------------------------
                        rSaldoDevAtu   := CalcEmptmo.SaldoDevAnt(qryContratoIDCONTRATOEMPTMO.AsFloat,
                                                                 dDataAtu,
                                                                 -1,
                                                                 -1,
                                                                 False
                                                                );
                        // -------------------------------------------------------------------------

                        // Concessao ---------------------------------------------------------------
                        with qryMovimentoNormal do
                        begin
                           LimpaParametros(qryMovimentoNormal);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt + 1;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;
                           ParamByName('PHMETIPOMOV').AsInteger      := 0;

                           Open;
                           fVlrConcessao     := qryMovimentoNormalHMEVLRPREVISTO.AsCurrency;
                           fVlrConcContab    := qryMovimentoNormalVLR_CONTAB.AsCurrency;
                           fVlrConcEstorno   := qryMovimentoNormalVLR_ESTORNADO_CONTAB.AsCurrency;
                           Close;
                        end;
                        // -------------------------------------------------------------------------

                        // Parcelas ----------------------------------------------------------------
                        with qryMovimentoNormal do
                        begin
                           LimpaParametros(qryMovimentoNormal);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt + 1;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;
                           ParamByName('PHMETIPOMOV').AsInteger      := 1;

                           Open;
                           fVlrParcela       := qryMovimentoNormalHMEVLRPREVISTO.AsCurrency;
                           fVlrParcContab    := qryMovimentoNormalVLR_CONTAB.AsCurrency;
                           fVlrParcEstorno   := qryMovimentoNormalVLR_ESTORNADO_CONTAB.AsCurrency;
                           Close;
                        end;
                        // -------------------------------------------------------------------------

                        // Amortização -------------------------------------------------------------
                        with qryMovimentoNormal do
                        begin
                           LimpaParametros(qryMovimentoNormal);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt + 1;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;
                           ParamByName('PHMETIPOMOV').AsInteger      := 2;

                           Open;
                           fVlrAmortizacao   := qryMovimentoNormalHMEVLRPREVISTO.AsCurrency;
                           fVlrAmortCotab    := qryMovimentoNormalVLR_CONTAB.AsCurrency;
                           fVlrAmortEstorno  := qryMovimentoNormalVLR_ESTORNADO_CONTAB.AsCurrency;
                           Close;
                        end;
                        // -------------------------------------------------------------------------

                        // Atualizacao Diária ------------------------------------------------------
                        with qryMovimentoNormal do
                        begin
                           LimpaParametros(qryMovimentoNormal);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt + 1;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;
                           ParamByName('PHMETIPOMOV').AsInteger      := 5;

                           Open;
                           fVlrAtuDia        := qryMovimentoNormalHMEVLRPREVISTO.AsCurrency;
                           fVlrAtuDiaContab  := qryMovimentoNormalVLR_CONTAB.AsCurrency;
                           fVlrAtuDiaEstorno := qryMovimentoNormalVLR_ESTORNADO_CONTAB.AsCurrency;
                           Close;
                        end;
                        // -------------------------------------------------------------------------

                        // Ajustes -----------------------------------------------------------------
                        with qryMovimentoNormal do
                        begin
                           LimpaParametros(qryMovimentoNormal);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt + 1;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;
                           ParamByName('PHMETIPOMOV').AsInteger      := 8;

                           Open;
                           fVlrAjuste        := qryMovimentoNormalHMEVLRPREVISTO.AsCurrency;
                           fVlrAjusteContab  := qryMovimentoNormalVLR_CONTAB.AsCurrency;
                           fVlrAjusteEstorno := qryMovimentoNormalVLR_ESTORNADO_CONTAB.AsCurrency;
                           Close;
                        end;
                        // -------------------------------------------------------------------------

                        // Quitacao ----------------------------------------------------------------
                        with qryQuitacao do
                        begin
                           LimpaParametros(qryQuitacao);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt + 1;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;

                           Open;
                           fVlrQuitacao      := qryQuitacaoHMEVLRPREVISTO.AsCurrency;
                           fVlrQuitContab    := qryQuitacaoVLR_CONTAB.AsCurrency;
                           fVlrQuitEstorno   := qryQuitacaoVLR_ESTORNADO_CONTAB.AsCurrency;
                           Close;
                        end;
                        // -------------------------------------------------------------------------

                        // Quitacao ----------------------------------------------------------------
                        with qryQuitacaoMorte do
                        begin
                           LimpaParametros(qryQuitacaoMorte);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt + 1;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;

                           Open;
                           fVlrQuitacaoMorte := qryQuitacaoMorteHMEVLRPREVISTO.AsCurrency;
                           fVlrMorteContab   := qryQuitacaoMorteVLR_CONTAB.AsCurrency;
                           fVlrMorteEstorno  := qryQuitacaoMorteVLR_ESTORNADO_CONTAB.AsCurrency;
                           Close;
                        end;
                        // -------------------------------------------------------------------------

                        // -------------------------------------------------------------------------

                        bGrava      := True;

                        fVlrDiverg  := rSaldoDevAnt.fSaldoDevAnt +
                                       fVlrConcessao +
                                       fVlrAtuDia +
                                       fVlrParcela +
                                       fVlrAmortizacao +
                                       fVlrQuitacao +
                                       fVlrQuitacaoMorte +
                                       fVlrAjuste -
                                       rSaldoDevAtu.fSaldoDevAnt;

                        bGrava      := (rSaldoDevAnt.fSaldoDevAnt <> 0) or
                                       (fVlrConcessao             <> 0) or
                                       (fVlrAtuDia                <> 0) or
                                       (fVlrParcela               <> 0) or
                                       (fVlrAmortizacao           <> 0) or
                                       (fVlrQuitacao              <> 0) or
                                       (fVlrQuitacaoMorte         <> 0) or
                                       (fVlrAjuste                <> 0) or
                                       (rSaldoDevAtu.fSaldoDevAnt <> 0);

                        if chkDivergente.Checked then bGrava := (fVlrDiverg         <> 0) or
                                                                (fVlrConcessao      <> fVlrConcContab) or
                                                                (fVlrParcela        <> fVlrParcContab) or
                                                                (fVlrAmortizacao    <> fVlrAmortCotab) or
                                                                (fVlrAtuDia         <> fVlrAtuDiaContab) or
                                                                (fVlrAjuste         <> fVlrQuitContab) or
                                                                (fVlrQuitacao       <> fVlrQuitContab) or
                                                                (fVlrQuitacaoMorte  <> fVlrMorteContab);

                        // -------------------------------------------------------------------------

                        if bGrava then
                        begin
                           // ----------------------------------------------------------------------
                           dtmRelResumoContratoSaldo.qryResumoContratoSaldo.Insert;

                           dtmRelResumoContratoSaldo.qryResumoContratoSaldoIDCONTRATOEMPTMO.AsFloat         := qryContratoIDCONTRATOEMPTMO.AsFloat;

                           dtmRelResumoContratoSaldo.qryResumoContratoSaldoNOME_PLANO.AsString              := qryContratoNOMEPLANO.AsString;
                           dtmRelResumoContratoSaldo.qryResumoContratoSaldoNOME_PATRO.AsString              := qryContratoNOMEPATRO.AsString;
                           dtmRelResumoContratoSaldo.qryResumoContratoSaldoPLANO_PATRO.AsString             := qryContratoNOMEPATRO.AsString;
                           dtmRelResumoContratoSaldo.qryResumoContratoSaldoNOME.AsString                    := qryContratoNOME.AsString;
                           dtmRelResumoContratoSaldo.qryResumoContratoSaldoMATRICULA.AsString               := qryContratoMATRICULA.AsString;
                           dtmRelResumoContratoSaldo.qryResumoContratoSaldoINSCRICAONUMERO.AsFloat          := qryContratoINSCRICAONUMERO.AsFloat;
                           dtmRelResumoContratoSaldo.qryResumoContratoSaldoDESCTIPOEMPTMO.AsString          := '';
                           dtmRelResumoContratoSaldo.qryResumoContratoSaldoTCEDESCRICAO.AsString            := qryContratoTCEDESCRICAO.AsString;
                           dtmRelResumoContratoSaldo.qryResumoContratoSaldoSITDESCRICAO.AsString            := qryContratoSIT_PART.AsString;

                           dtmRelResumoContratoSaldo.qryResumoContratoSaldoSALDODEV.AsCurrency              := rSaldoDevAnt.fSaldoDevAnt;
                           dtmRelResumoContratoSaldo.qryResumoContratoSaldoSALDOATU.AsCurrency              := rSaldoDevAtu.fSaldoDevAnt;

                           dtmRelResumoContratoSaldo.qryResumoContratoSaldoCONCESSOES.AsCurrency            := fVlrConcessao;
                           dtmRelResumoContratoSaldo.qryResumoContratoSaldoCONCESSOES_CONTAB.AsCurrency     := fVlrParcContab;
                           dtmRelResumoContratoSaldo.qryResumoContratoSaldoCONCESSOES_ESTORNO.AsCurrency    := fVlrParcEstorno;

                           dtmRelResumoContratoSaldo.qryResumoContratoSaldoPARCELAS.AsCurrency              := fVlrParcela;
                           dtmRelResumoContratoSaldo.qryResumoContratoSaldoPARCELAS_CONTAB.AsCurrency       := fVlrParcContab;
                           dtmRelResumoContratoSaldo.qryResumoContratoSaldoPARCELAS_ESTORNO.AsCurrency      := fVlrParcEstorno;

                           dtmRelResumoContratoSaldo.qryResumoContratoSaldoAMORTIZACAO.AsCurrency           := fVlrAmortizacao;
                           dtmRelResumoContratoSaldo.qryResumoContratoSaldoAMORTIZACAO_CONTAB.AsCurrency    := fVlrAmortCotab;
                           dtmRelResumoContratoSaldo.qryResumoContratoSaldoAMORTIZACAO_ESTORNO.AsCurrency   := fVlrAmortEstorno;

                           dtmRelResumoContratoSaldo.qryResumoContratoSaldoQUITACAO.AsCurrency              := fVlrQuitacao;
                           dtmRelResumoContratoSaldo.qryResumoContratoSaldoQUITACAO_CONTAB.AsCurrency       := fVlrQuitContab;
                           dtmRelResumoContratoSaldo.qryResumoContratoSaldoQUIT_MORT_ESTORNO.AsCurrency     := fVlrQuitEstorno;

                           dtmRelResumoContratoSaldo.qryResumoContratoSaldoQUIT_MORT.AsCurrency             := fVlrQuitacaoMorte;
                           dtmRelResumoContratoSaldo.qryResumoContratoSaldoQUIT_MORT_CONTAB.AsCurrency      := fVlrMorteContab;
                           dtmRelResumoContratoSaldo.qryResumoContratoSaldoQUIT_MORT_ESTORNO.AsCurrency     := fVlrMorteEstorno;

                           dtmRelResumoContratoSaldo.qryResumoContratoSaldoATU_DIA.AsCurrency               := fVlrAtuDia;
                           dtmRelResumoContratoSaldo.qryResumoContratoSaldoATU_DIA_CONTAB.AsCurrency        := fVlrAtuDiaContab;
                           dtmRelResumoContratoSaldo.qryResumoContratoSaldoATU_DIA_ESTORNO.AsCurrency       := fVlrAtuDiaEstorno;

                           dtmRelResumoContratoSaldo.qryResumoContratoSaldoAJUSTE.AsCurrency                := fVlrAjuste;
                           dtmRelResumoContratoSaldo.qryResumoContratoSaldoAJUSTE_CONTAB.AsCurrency         := fVlrAjusteContab;
                           dtmRelResumoContratoSaldo.qryResumoContratoSaldoAJUSTE_ESTORNO.AsCurrency        := fVlrAjusteEstorno;

                           dtmRelResumoContratoSaldo.qryResumoContratoSaldoDIFERENCA.AsCurrency             := fVlrDiverg;

                           dtmRelResumoContratoSaldo.qryResumoContratoSaldo.Post;

                           // ----------------------------------------------------------------------

                           inc(iRegistro);

                           sLinha := '';
                           sLinha := sLinha + FormatFloat('#0', iRegistro) + '^';
                           sLinha := sLinha + qryContratoNOMEPLANO.AsString + '^';
                           sLinha := sLinha + qryContratoNOMEPATRO.AsString + '^';
                           sLinha := sLinha + qryContratoTCEDESCRICAO.AsString + '^';
                           sLinha := sLinha + FormatFloat('#0', qryContratoIDCONTRATOEMPTMO.AsFloat) + '^';
                           sLinha := sLinha + qryContratoMATRICULA.AsString + '^';
                           sLinha := sLinha + FormatFloat('#0', qryContratoINSCRICAONUMERO.AsFloat) + '^';
                           sLinha := sLinha + qryContratoNOME.AsString + '^';
                           sLinha := sLinha + qryContratoSIT_PART.AsString + '^';

                           sLinha := sLinha + FormatFloat('#,#0.00', rSaldoDevAnt.fSaldoDevAnt) + '^';

                           sLinha := sLinha + FormatFloat('#,#0.00', fVlrConcessao) + '^';
                           sLinha := sLinha + FormatFloat('#,#0.00', fVlrConcContab) + '^';
                           sLinha := sLinha + FormatFloat('#,#0.00', fVlrConcEstorno) + '^';

                           sLinha := sLinha + FormatFloat('#,#0.00', fVlrAtuDia) + '^';
                           sLinha := sLinha + FormatFloat('#,#0.00', fVlrAtuDiaContab) + '^';
                           sLinha := sLinha + FormatFloat('#,#0.00', fVlrAtuDiaEstorno) + '^';

                           sLinha := sLinha + FormatFloat('#,#0.00', fVlrParcela) + '^';
                           sLinha := sLinha + FormatFloat('#,#0.00', fVlrParcContab) + '^';
                           sLinha := sLinha + FormatFloat('#,#0.00', fVlrParcEstorno) + '^';

                           sLinha := sLinha + FormatFloat('#,#0.00', fVlrAmortizacao) + '^';
                           sLinha := sLinha + FormatFloat('#,#0.00', fVlrAmortCotab) + '^';
                           sLinha := sLinha + FormatFloat('#,#0.00', fVlrAmortEstorno) + '^';

                           sLinha := sLinha + FormatFloat('#,#0.00', fVlrQuitacao) + '^';
                           sLinha := sLinha + FormatFloat('#,#0.00', fVlrQuitContab) + '^';
                           sLinha := sLinha + FormatFloat('#,#0.00', fVlrQuitEstorno) + '^';

                           sLinha := sLinha + FormatFloat('#,#0.00', fVlrQuitacaoMorte) + '^';
                           sLinha := sLinha + FormatFloat('#,#0.00', fVlrMorteContab) + '^';
                           sLinha := sLinha + FormatFloat('#,#0.00', fVlrMorteEstorno) + '^';

                           sLinha := sLinha + FormatFloat('#,#0.00', fVlrAjuste) + '^';
                           sLinha := sLinha + FormatFloat('#,#0.00', fVlrAjusteContab) + '^';
                           sLinha := sLinha + FormatFloat('#,#0.00', fVlrAjusteEstorno) + '^';

                           sLinha := sLinha + FormatFloat('#,#0.00', rSaldoDevAtu.fSaldoDevAnt) + '^';
                           sLinha := sLinha + FormatFloat('#,#0.00', fVlrDiverg) + '^';
                           sLinha := sLinha + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now);

                           Writeln(Arquivo, sLinha);
                           // ----------------------------------------------------------------------
                        end;  // if bGrava

                        qryContrato.Next;

                        inc(iContadorBaixo);

                        frmProgressoDuplo.AndaFormProgressoDuplo(iContadorCima, iContadorBaixo);
                     end;
                     // ----------------------------------------------------------------------------

                     inc(iContadorCima);
                     frmProgressoDuplo.AndaFormProgressoDuplo(iContadorCima, 0);

                     qryLookTipoContr.Next;
                  end;  // while not(qryLookTipoContr.EOF)
               end
               else    // if molListaPatro.lstPatro.Checked
               begin
                  iContadorCima := iContadorCima + iQuantTipoContr;
                  frmProgressoDuplo.AndaFormProgressoDuplo(iContadorCima, 0);
               end;  // if molListaPatro.lstPatro.Checked
            end;  // for(Patro)
         end
         else  // if molListaPlano.lstPlano.Checked
         begin
            iContadorCima := iContadorCima + (molListaPatro.lstPatro.Items.Count * iQuantTipoContr);
            frmProgressoDuplo.AndaFormProgressoDuplo(iContadorCima, 0);
         end;  // if molListaPlano.lstPlano.Checked
      end;  // for(Plano)
      // -------------------------------------------------------------------------------------------
      // FIM dos loops
      // -------------------------------------------------------------------------------------------

   finally
      CloseFile(Arquivo);
      frmProgressoDuplo.EscondeFormProgressoDuplo;
   end;
end;



procedure TcfgRelResumoContratoSaldo.FormShow(Sender: TObject);
begin
   inherited;

   molContratoEmptmo.btnLimpaContrato.Click;

   // preenche o ano de referência/competência
   cboMes.ItemIndex := DiasUteis.ExtraiMes(Date) - 1;
   DBspnAno.Value   := DiasUteis.ExtraiAno(Date);

   AbreQueries;

   // limpa a seleção de Contrato
   // Preenche a listbox de patrocinadoras...
   molListaPatro.PreenchePatro;
   // ...e marca todas por default
   molListaPatrobtnMarcaTodosPatroClick(self);

   // Preenche a listbox de Planos...
   molListaPlano.PreenchePlano;
   // ...e marca todos por default
   molListaPlanobtnMarcaTodosPlanoClick(self);
end;



procedure TcfgRelResumoContratoSaldo.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
   with dtmLookEmptmo.qryLookTipoContr do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContr);

      if DBcboTipoEmptmo.LookupValue <> '' then
      begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
      end;
      Open;

      DBcboTipoContrato.Enabled := True;
   end;
end;



procedure TcfgRelResumoContratoSaldo.DBcboTipoEmptmoExit(Sender: TObject);
begin
   inherited;

   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
   with dtmLookEmptmo.qryLookTipoContr do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContr);

      if DBcboTipoEmptmo.LookupValue <> '' then
      begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
      end;
      Open;

      DBcboTipoContrato.Enabled := True;
   end;
end;



procedure TcfgRelResumoContratoSaldo.molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnBuscaContratoClick(Sender);
end;



procedure TcfgRelResumoContratoSaldo.molContratoEmptmobtnLimpaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnLimpaContratoClick(Sender);
end;



procedure TcfgRelResumoContratoSaldo.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TcfgRelResumoContratoSaldo.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TcfgRelResumoContratoSaldo.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TcfgRelResumoContratoSaldo.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



procedure TcfgRelResumoContratoSaldo.qryContratosBeforeOpen(DataSet: TDataSet);
begin
   inherited;

    //Grava o SQL na pasta TEMP
    //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
    //qryContratos.SQL.SaveToFile(Sistema.TempDir + 'EP-RelResumoContratoSaldo-Contrato.txt');
      qryContratos.SQL.SaveToFile(ftempregra + '\' + 'EP-RelResumoContratoSaldo-Contrato.txt');
   Application.ProcessMessages;
end;



end.
