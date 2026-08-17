{---------------------------Alteração-------------------------------------------
Pendência   : Sol: 253185 PPM: 2040335
Responsável : Wylliam Leite da Silva
Data        : 18/05/2015
Descrição   : Reestruturação da HistMovEmptmo(*Retirada dos Hint's)
-------------------------------------------------------------------------------
Pendência   : SOL 114575 KINTANA 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
-------------------------------------------------------------------------------}
unit CRelValCred;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
   TB97, ExtCtrls, mContratoEmptmo, Mask, wwdbedit, Wwdbspin, CheckLst,
   wwdblook, db, fcCombo, fcColorCombo, wwdbdatetimepicker, CMDateTimePicker,
   mListaPlanoContab, mListaPatro;

type
   TcfgRelValCred = class(TcfgRel)
      rgOrdenar: TRadioGroup;
      GroupBox1: TGroupBox;
      chkCorLinha: TCheckBox;
      cboCorLinha: TfcColorCombo;
      chkLinhas: TCheckBox;
      Label1: TLabel;
      Label2: TLabel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      DBcboTipoContrato: TwwDBLookupCombo;
      molContratoEmptmo: TmolContratoEmptmo;
      Panel1: TPanel;
      edtDataIni: TCMDateTimePicker;
      Label5: TLabel;
      edtDataFim: TCMDateTimePicker;
      Label3: TLabel;
      rdgRenovacao: TRadioGroup;
      rdgBaixado: TRadioGroup;
      GroupBox2: TGroupBox;
      chkFolha: TCheckBox;
      chkFinanceiro: TCheckBox;
      chkConcessao: TCheckBox;
      molListaPatro: TmolListaPatro;
      molListaPlano: TmolListaPlanoContab;
      chkSintetico: TCheckBox;

      procedure FormShow(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
      procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
      procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
    procedure DBcboTipoEmptmoExit(Sender: TObject);


   private  // Private declarations

      procedure AbreQueries;

      procedure MontaQuery; override;
      procedure FiltraRelatorio;


   public   // Public declarations

   end;



var
  cfgRelValCred: TcfgRelValCred;



implementation
{$R *.DFM}
uses
   dEmptmo, dLookEmptmo, uDiasUteis, uSistema, uMensErro, uFuncoesEmptmo, dRelValCred;




procedure TcfgRelValCred.AbreQueries;
begin
   ParametrosSistema;

   with dtmLookEmptmo.qryLookTipoEmptmo do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoEmptmo);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
   end;

   LimpaParametros(dtmLookEmptmo.qryLookPlanPrev);
   dtmLookEmptmo.qryLookPlanPrev.Open;

   LimpaParametros(dtmLookEmptmo.qryLookSitPart);
   dtmLookEmptmo.qryLookSitPart.Open;
end;




procedure TcfgRelValCred.FormShow(Sender: TObject);
var
   dDataHoje : TDateTime;
   dDataIni  : TDateTime;
begin
   inherited;

   molContratoEmptmo.btnLimpaContrato.Click;

   // preenche as datas - período sempre de Domingo a Sábado
   dDataHoje         :=  trunc(Sysdate);

   case DayOfWeek(dDataHoje) of
      1:                dDataIni := dDataHoje - 7;
      2, 3, 4, 5, 6, 7: dDataIni := dDataHoje - (DayOfWeek(dDataHoje) - 1);
   end;

   edtDataIni.Date   := dDataIni;
   edtDataFim.Date   := dDataIni + 6;

   AbreQueries;

   chkConcessao.Checked := not(dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1);

   // Preenche a listbox de patrocinadoras...
   molListaPatro.PreenchePatro;
   // ...e marca todas por default
   molListaPatrobtnMarcaTodosPatroClick(self);

   // Preenche a listbox de Planos...
   molListaPlano.PreenchePlano;
   // ...e marca todos por default
   molListaPlanobtnMarcaTodosPlanoClick(self);
end;



procedure TcfgRelValCred.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
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



procedure TcfgRelValCred.MontaQuery;
var
   sFormaCred : String;
begin
   inherited;

   with dtmRelValCred do
   begin
      // preenche a label de data de referência
      rptValCred_lblDataIni.Caption    := edtDataIni.Text;
      rptValCred_lblDataFim.Caption    := edtDataFim.Text;

      if chkFolha.Checked then sFormaCred := 'Folha';

      if chkFinanceiro.Checked then
      begin
         if chkFolha.Checked then sFormaCred := sFormaCred + ' e ';
         sFormaCred := sFormaCred + 'Financeiro';
      end;

      rptValCred_lblFormaCred.Caption  := sFormaCred;

      bSeparador  := chkLinhas.Checked;

      // -------------------------------------------------------------------------------------------

      lblTipoEmptmo.Caption := ' < todos > ';
      if DBcboTipoEmptmo.LookupValue <> ''   then lblTipoEmptmo.Caption := DBcboTipoEmptmo.Text;

      lblTipoContr.Caption  := ' < todos > ';
      if DBcboTipoContrato.LookupValue <> ''    then lblTipoContr.Caption  := DBcboTipoContrato.Text;

      memPatro.RichText := molListaPatro.ListaPatro;
      memPlano.RichText := molListaPlano.ListaPlano;

      // -------------------------------------------------------------------------------------------

      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      bCorlinha   := chkCorLinha.Checked;
      CorLinha    := cboCorLinha.SelectedColor;
      bSintetico  := chkSintetico.Checked;

      dDataIni    := edtDataIni.Date;
      dDataFim    := edtDataFim.Date;

   end;

   FiltraRelatorio;
end;




procedure TcfgRelValCred.FiltraRelatorio;
var
   sSQL           : String;
   sDataIni       : String;
   sDataFim       : String;
   sFormaCobranca : String;
begin
   sDataIni := FormatDateTime('dd/mm/yyyy', edtDataIni.Date);
   sDataFim := FormatDateTime('dd/mm/yyyy', edtDataFim.Date);

   sSQL :=
   //Wylliam Leite da Silva - Sol: 253185 PPM: 2040335 - Início
   'SELECT '                                                   + #13 +
   //Wylliam Leite da Silva - Sol: 253185 PPM: 2040335 - Fim
   '   CON.IDCONTRATOEMPTMO, DEP.MATRICULA, MUT.NOME, '                                            + #13 +
   '   TCE.TCEDESCRICAO, '                                                                         + #13 +

   '   CON.FLGFORMAPAG, '                                                                          + #13 +
   '   DECODE(CON.FLGFORMAPAG, ''F'', ''Folha'', ''C'', ''Banco'', '' '') AS DESCFORMAPAG, '       + #13 +

   '   CON.DATACREDITO, CON.PORTFORMAPAG, CON.CODFORMAPAG, '                                       + #13 +

   '   CON.IDBENEF, CON.IDPESSOA, '                                                                + #13 +
   '   DECODE(CON.IDBENEF, CBA.IDPESSOA, BAN.NUMBANCO, '' '')                    AS NUMBANCO, '          + #13 +
   '   DECODE(CON.IDBENEF, CBA.IDPESSOA, AGE.NUMAGENCIA, '' '')                  AS NUMAGENCIA, '        + #13 +
   '   DECODE(CON.IDBENEF, CBA.IDPESSOA, CBA.CONTACORRENTE, ''CONTA INCORRETA'') AS CONTACORRENTE, '     + #13 +

   '   PFO.DESCRICAO, PFO.DESCRICAO AS PORTADOR_FORMA, '                                           + #13 +
   '   FRP.DESCRICAO AS FORMA, '                                                                   + #13 +

   '   DECODE(HME.FLGBAIXADO, NULL, ''Sim'', NULL) AS PAGO, '                                      + #13 +
   '   DECODE(HME.FLGENVIO, NULL, ''Sim'', NULL) AS ENVIADO, '                                     + #13 +
   '   HME.HMEDATAVENCTO, ABS(HME.HMEVLRPREVISTO) AS HMEVLRPREVISTO '                              + #13 +

   'FROM '                                                                                         + #13 +
   '   HISTMOVEMPTMO       HME, '                                                                  + #13 +
   '   CONTABANCARIA       CBA, '                                                                  + #13 +
   '   AGENCIABANCARIA     AGE, '                                                                  + #13 +
   '   BANCO               BAN, '                                                                  + #13 +
   '   FORMARECPAG         FRP, '                                                                  + #13 +
   '   PESSOA              PAT, '                                                                  + #13 +
   '   PESSOA              MUT, '                                                                  + #13 +
   '   DEPENTIT            DEP, '                                                                  + #13 +
   '   CONTRATOEMPTMO      CON, '                                                                  + #13 +
   '   TIPOCONTREMPTMO     TCE, '                                                                  + #13 +
   '   TIPOEMPTMO          TEP, '                                                                  + #13;

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then sSQL := sSQL +
   '   VWMIGRACONTRATOEP   MIG, '                                                                  + #13 +
   '   PLANPREVCONTABIL    PLA, '                                                                  + #13
   else sSQL := sSQL +
   '   PLANPREV            PLA, '                                                                  + #13;

   // exibição dos contratos renovados:
   if rdgRenovacao.ItemIndex = 0 then
   begin
      sSQL := sSQL +
   '   PORTADORFORMA     PFO '                                                                     + #13;
   end
   else
   begin
      sSQL := sSQL +
   '   PORTADORFORMA     PFO, '                                                                    + #13 +
   '   ( '                                                                                         + #13 +
   '   SELECT DISTINCT '                                                                           + #13 +
   '      IDCONTRQUITACAO '                                                                        + #13 +
   '   FROM '                                                                                      + #13 +
   '      CONTRATOEMPTMO '                                                                         + #13 +
   '   ) '                                                                                         + #13 +
   '   QUI '                                                                                       + #13;
   end;

   sSQL := sSQL +
   'WHERE '                                                                                        + #13 +
   '       TEP.IDEMPRESAPROP        = ' + IntToStr(Sistema.IDEmpresa)                              + #13 +
   '   AND HME.HMEDATAVENCTO        BETWEEN TO_DATE(' + QuotedStr(sDataIni) + ',''DD/MM/YYYY'') '  +
                                       'AND TO_DATE(' + QuotedStr(sDataFim) + ',''DD/MM/YYYY'')'   + #13;

   // ----------------------------------------------------------------------------------------------

   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '   AND CON.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)          + #13;

   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '   AND TCE.IDTIPOEMPTMO         = ' + DBcboTipoEmptmo.LookupValue                              + #13;

   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '   AND CON.IDTIPOCONTREMPTMO    = ' + DBcboTipoContrato.LookupValue                            + #13;

   case rdgBaixado.ItemIndex of
      0: begin (* nada a fazer *) end;
      1: sSQL := sSQL + '   AND HME.FLGBAIXADO           IS NULL '                                 + #13;
      2: sSQL := sSQL + '   AND HME.FLGBAIXADO           = 0 '                                     + #13;
   end;

   sSQL := sSQL +
   '   AND HME.HMERECPAG            = ''P'' '                                                      + #13 +
   '   AND CON.FLGSITUACAO         <> ''C'' '                                                      + #13 +
   '   AND (HME.HMECENTRALIZA       = 1 OR HME.HMEDESTACADO = 1) '                                 + #13 +
   '   AND HME.HMETIPOMOV           NOT IN (5, 8) '                                                + #13 +
   '   AND NVL(HME.FLGESTORNADO, 0) = 0 '                                                          + #13 +
   '   AND NVL(HME.FLGABONADO, 0)   = 0 '                                                          + #13 +
   '   AND NVL(HME.FLGQUITADO, 0)   = 0 '                                                          + #13 +

   '   AND CON.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                         + #13;

   // ----------------------------------------------------------------------------------------------

   // filtro por Plano
   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then sSQL := sSQL +
   '   AND MIG.IDPLANOCONTATU       IN (' + molListaPlano.PegaPlano + ') '                         + #13
   else sSQL := sSQL +
   '   AND CON.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                         + #13;

   // ----------------------------------------------------------------------------------------------

   if (chkConcessao.Checked) or (rdgRenovacao.ItemIndex = 2) then sSQL := sSQL +
   '   AND HME.HMETIPOMOV           = 0 '                                                          + #13 +
   '   AND CON.DATACREDITO          BETWEEN TO_DATE(' + QuotedStr(sDataIni) + ',''DD/MM/YYYY'') '  +
                                       'AND TO_DATE(' + QuotedStr(sDataFim) + ',''DD/MM/YYYY'')'   + #13;

   // ----------------------------------------------------------------------------------------------

   sFormaCobranca := '';

   if chkFinanceiro.Checked then sFormaCobranca := QuotedStr('C');

   if chkFolha.Checked then
   begin
      if sFormaCobranca <> '' then
      begin
         sFormaCobranca := sFormaCobranca + ',' + QuotedStr('F')
      end
      else
      begin
         sFormaCobranca := QuotedStr('F');
      end;
   end;

   sSQL := sSQL +
   '   AND HME.HMEFORMACOBRANCA     IN (' + sFormaCobranca + ') '                                  + #13;

   // ----------------------------------------------------------------------------------------------

   // exibição dos contratos renovados:
   case rdgRenovacao.ItemIndex of

      1: // Exibir
      begin
         sSQL := sSQL +
   '   AND QUI.IDCONTRQUITACAO      IS NULL '                                                      + #13 +
   '   AND CON.IDCONTRATOEMPTMO     = QUI.IDCONTRQUITACAO(+) '                                     + #13;
      end;

      2: // Exibir EXCLUSIVAMENTE
      begin
         sSQL := sSQL +
   '   AND QUI.IDCONTRQUITACAO      IS NOT NULL '                                                  + #13 +
   '   AND CON.IDCONTRATOEMPTMO     = QUI.IDCONTRQUITACAO '                                        + #13;
      end;

   end;

   sSQL := sSQL +
   '   AND CON.IDCBANCARIA          = CBA.IDCBANCARIA(+) '                                         + #13 +
   '   AND CBA.IDAGENCIA            = AGE.IDPESSOA(+) '                                            + #13 +
   '   AND AGE.IDBANCO              = BAN.IDPESSOA(+) '                                            + #13 +
   '   AND CON.PORTFORMAPAG         = PFO.CODPORTFORMA(+) '                                        + #13 +
   '   AND CON.CODFORMAPAG          = FRP.CODFORMA(+) '                                            + #13 +
   '   AND CON.IDPATRO              = PAT.IDPESSOA '                                               + #13;

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then sSQL := sSQL +
   '   AND MIG.IDPLANOCONTATU       = PLA.IDPLANOPREV '                                            + #13 +
   '   AND MIG.IDCONTRATOEMPTMO     = HME.IDCONTRATOEMPTMO '                                       + #13 +
   '   AND MIG.IDCONTRATOEMPTMO     = CON.IDCONTRATOEMPTMO '                                       + #13 +
   '   AND MIG.DATAMIGRA            = (SELECT MAX(DATAMIGRA) '                                     + #13 +
   '                                     FROM VWMIGRACONTRATOEP '                                  + #13 +
   '                                    WHERE IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO '            + #13 +
   '                                      AND DATAMIGRA       <= HME.HMEDATAPREVISTA) '            + #13

   else sSQL := sSQL +
   '   AND CON.IDPLANOPREV          = PLA.IDPLANOPREV '                                            + #13;

   sSQL := sSQL +
   '   AND CON.IDCONTRATOEMPTMO     = HME.IDCONTRATOEMPTMO '                                       + #13 +
   '   AND CON.IDBENEF              = MUT.IDPESSOA '                                               + #13 +
   '   AND CON.IDBENEF              = DEP.IDPESSOA '                                               + #13 +
   '   AND CON.IDPESSOA             = DEP.IDTITULAR '                                              + #13 +
   '   AND CON.IDTIPOCONTREMPTMO    = TCE.IDTIPOCONTREMPTMO '                                      + #13 +
   '   AND TCE.IDTIPOEMPTMO         = TEP.IDTIPOEMPTMO '                                           + #13 +

   'ORDER BY '                                                                                     + #13;

   if rgOrdenar.ItemIndex = 0 then
   begin
      sSQL := sSQL +
   '  CON.FLGFORMAPAG, HME.HMEDATAVENCTO, CON.PORTFORMAPAG, CON.CODFORMAPAG, CON.IDCONTRATOEMPTMO ';
   end
   else
   begin
      sSQL := sSQL +
   '  CON.FLGFORMAPAG, HME.HMEDATAVENCTO, CON.PORTFORMAPAG, CON.CODFORMAPAG, MUT.NOME ' ;
   end;

   dtmRelValCred.qryValCred.Close;
   dtmRelValCred.qryValCred.SQL.Clear;
   dtmRelValCred.qryValCred.SQL.Text := sSQL;
 //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
 //dtmRelValCred.qryValCred.SQL.SaveToFile(Sistema.TempDir + 'EP-RelValCred.txt');
   dtmRelValCred.qryValCred.SQL.SaveToFile(ftempregra + '\' + 'EP-RelValCred.txt');
   dtmRelValCred.qryValCred.Open;
end;



procedure TcfgRelValCred.molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnBuscaContratoClick(Sender);
end;



procedure TcfgRelValCred.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TcfgRelValCred.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
  inherited;
  molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



procedure TcfgRelValCred.DBcboTipoEmptmoExit(Sender: TObject);
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



end.
