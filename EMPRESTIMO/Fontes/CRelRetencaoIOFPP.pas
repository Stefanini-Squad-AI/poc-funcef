// Alterações:
{ ------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Alteracao : FiltraRelatorio
Data      : 26/02/2018
Autor     : edilaine
Pendência : 63317
Descrição : Ajuste do campo nome do plano para buscar em outra tabela
--------------------------------------------------------------------------------------------------
Data      : 18/05/2015
Autor     : Wylliam Leite da Silva
Pendência : Sol: 253185 PPM: 2040335
Descrição : Reestruturação da HistMovEmptmo (*Retirada dos Hints)
--------------------------------------------------------------------------------
Rotina    : TcfgRelRetencaoIOFPP.FiltraRelatorio
Data      : 03/12/2014
Autor     : Fernando Xavier
Pendência : Sol 243679 Kintana 597278
Descrição : Divergência no relatorio de IOF
Solução   : Retirado o Distinct e incluido o ALL no Union.
--------------------------------------------------------------------------------
Rotina    : TcfgRelRetencaoIOFPP.FiltraRelatorio
Data      : 24/07/2012
Autor     : Otacilio Aquino
Pendência : Sol 185737 Kintana 1743378
Descrição : Implementado para SubSelect IOF sempre deixar a condicao HMEDATAPREVISTA .
DMF       : Deixar data Efetiva como padrão.
--------------------------------------------------------------------------------
Rotina    : TcfgRelRetencaoIOFPP.FiltraRelatorio
Data      : 07/05/2009
Autor     : Henrique Massão
Pendência : Sol 116126 Kintana 545444
Descrição : Foi alterada a Query para a visualização correta dos dados no
            Relatório.
----------------------------------------------------------------------------------------------------
Pendência   : SOL 114575 KINTANA 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
----------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 25/08/2004
Autor     : André Pontes
Pendência :
Descrição : Criado novo relatório
---------------------------------------------------------------------------------------------------}
unit CRelRetencaoIOFPP;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
   TB97, ExtCtrls, mContratoEmptmo, Mask, wwdbedit, Wwdbspin, CheckLst,
   wwdblook, db, fcCombo, fcColorCombo, wwdbdatetimepicker, mListaPlano,
   mListaPatro, mListaPlanoContab;

type
   TcfgRelRetencaoIOFPP = class(TcfgRel)
      molContratoEmptmo: TmolContratoEmptmo;
      Label1: TLabel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      DBcboTipoContrato: TwwDBLookupCombo;
      Label2: TLabel;
      GroupBox1: TGroupBox;
      chkCorLinha: TCheckBox;
      cboCorLinha: TfcColorCombo;
      chkLinhas: TCheckBox;
      rdgTipoData: TRadioGroup;
      GroupBox3: TGroupBox;
      Label3: TLabel;
      edtDataIni: TwwDBDateTimePicker;
      Label4: TLabel;
      edtDataFim: TwwDBDateTimePicker;
      molListaPatro: TmolListaPatro;
      molListaPlano: TmolListaPlanoContab;
      chkSintetico: TCheckBox;
      chkQuebraPatro: TCheckBox;

      procedure FormShow(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
      procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
      procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
      procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
      procedure DBcboTipoEmptmoExit(Sender: TObject);

   private  // Private declarations

      procedure AbreQueries;
      procedure MontaQuery; override;
      procedure FiltraRelatorio;

   public   // Public declarations

   end;


var
   cfgRelRetencaoIOFPP: TcfgRelRetencaoIOFPP;


implementation
{$R *.DFM}
uses
   DLookEmptmo,
   dEmptmo,
   USistema,
   UfuncoesEmptmo,
   dRelRetencaoIOFPP;

procedure TcfgRelRetencaoIOFPP.AbreQueries;
begin
   ParametrosSistema;

   // Tipo de Empréstimo
   with dtmLookEmptmo.qryLookTipoEmptmo do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoEmptmo);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
   end;

   // Tipo de Contrato
   LimpaParametros(dtmLookEmptmo.qryLookPlanPrev);
   dtmLookEmptmo.qryLookPlanPrev.Open;
end;


procedure TcfgRelRetencaoIOFPP.FormShow(Sender: TObject);
var
   dDataHoje : TDateTime;
   dDataIni  : TDateTime;
begin
   inherited;

   molContratoEmptmo.btnLimpaContrato.Click;

   (* preenche as datas - período sempre de Domingo a Sábado*)
   dDataHoje         :=  Sysdate;

   case DayOfWeek(dDataHoje) of
      1, 2, 3, 4: dDataIni := dDataHoje - (DayOfWeek(dDataHoje) + 6);
      5, 6, 7:    dDataIni := dDataHoje - (DayOfWeek(dDataHoje) - 1);
   end;

   edtDataIni.Date   := dDataIni;
   edtDataFim.Date   := dDataIni + 6;

   AbreQueries;

   // Preenche a listbox de patrocinadoras...
   molListaPatro.PreenchePatro;
   // ...e marca todas por default
   molListaPatrobtnMarcaTodosPatroClick(self);

   // Preenche a listbox de Planos...
   molListaPlano.PreenchePlano;
   // ...e marca todos por default
   molListaPlanobtnMarcaTodosPlanoClick(self);
end;


procedure TcfgRelRetencaoIOFPP.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
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


procedure TcfgRelRetencaoIOFPP.MontaQuery;
begin
   inherited;

   with dtmRelRetencaoIOFPP do
   begin
      rptRetencaoIOF_lblDataIni.Caption := edtDataIni.Text;
      rptRetencaoIOF_lblDataFim.Caption := edtDataFim.Text;

      case rdgTipoData.ItemIndex of
         0: rptRetencaoIOFPP_lblTipoData.Caption  := 'Datas Previstas';
         1: rptRetencaoIOFPP_lblTipoData.Caption  := 'Datas Efetivas';
      end;

      bSeparador     := chkLinhas.Checked;
      bSintetico     := chkSintetico.Checked;
      bQuebraPatro   := chkQuebraPatro.Checked;

      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      bCorlinha      := chkCorLinha.Checked;
      CorLinha       := cboCorLinha.SelectedColor;
   end;

   FiltraRelatorio;
end;


procedure TcfgRelRetencaoIOFPP.FiltraRelatorio;
var
   sSQL        : String;
begin
   case rdgTipoData.ItemIndex of
      //Wylliam Leite da Silva - Sol: 253185 PPM: 2040335 - Início
      0: sSQL := 'SELECT DISTINCT '                                  + #13;
      1: sSQL := 'SELECT  '                     + #13;   // Sol 243679 Kintana 597278
      //Wylliam Leite da Silva - Sol: 253185 PPM: 2040335 - Fim
   end;

   sSQL := sSQL +
   //edilaine - SIG63317 - inicio
   //'  PTR.NOME AS NOMEPATRO, PPC.NOME AS NOMEPLANO,                                                '  + #13+
   ' PTR.NOME AS NOMEPATRO,                                                                          '  + #13+
   ' NVL((SELECT PPC1.NOME                                                                           '  + #13+
   '        FROM PERFILINVEST PI                                                                     '  + #13+
   '          JOIN PLANPREVCONTABIL PPC1 ON PI.IDPLANPREVCONTAB = PPC1.IDPLANOPREV                   '  + #13+
   '       WHERE PI.IDPERFILINVEST = CON.IDPERFILINVEST),                                            '  + #13+
   '      (SELECT PPC1.NOME                                                                          '  + #13+
   '       FROM PERFILINVXELEG PIE                                                                   '  + #13+
   '            JOIN PERFILINVEST PI ON PIE.IDPERFILINVEST = PI.IDPERFILINVEST                       '  + #13+
   '                                AND PIE.IDPLANOPREV = PI.IDPLANOPREV                             '  + #13+
   '            JOIN PLANPREVCONTABIL PPC1 ON PI.IDPLANPREVCONTAB = PPC1.IDPLANOPREV                 '  + #13+
   '       WHERE PIE.IDPESSOA = CON.IDPESSOA AND                                                     '  + #13+
   '             PIE.IDPLANOPREV = CON.IDPLANOPREV AND                                               '  + #13+
   '             PIE.DTINICIO <= CRE.HMEDATAPREVISTA AND                                             '  + #13+
   '             (PIE.DTFIM IS NULL OR PIE.DTFIM > CRE.HMEDATAPREVISTA))) NOMEPLANO,                 '  + #13+

   ' NVL((SELECT PI.NOME                                                                   '            + #13+
   '        FROM PERFILINVEST PI                                                           '            + #13+
   '       WHERE PI.IDPERFILINVEST = CON.IDPERFILINVEST),                                  '            + #13+
   '     (SELECT PI.NOME                                                                   '            + #13+
   '        FROM PERFILINVXELEG PIE                                                        '            + #13+
   '        JOIN PERFILINVEST PI ON PIE.IDPERFILINVEST = PI.IDPERFILINVEST                 '            + #13+
   '                            AND PIE.IDPLANOPREV = PI.IDPLANOPREV                       '            + #13+
   '       WHERE PIE.IDPESSOA = CON.IDPESSOA AND                                           '            + #13+
   '             PIE.IDPLANOPREV = CON.IDPLANOPREV AND                                     '            + #13+
   '             PIE.DTINICIO <= CRE.HMEDATAPREVISTA AND                                   '            + #13+
   '            (PIE.DTFIM IS NULL OR PIE.DTFIM > CRE.HMEDATAPREVISTA))) NOMEPERFIL,       '            + #13+
   //edilaine - SIG63317 - inicio
   '  CON.IDCONTRATOEMPTMO, DEP.MATRICULA, MUT.NOME,                                                 '  + #13+
   '  TCE.TCEDESCRICAO, IOF.HMESALDODEV,                                                             '  + #13+ // Henrique Massão SOL 116126
   '  IOF.HMENUMPARCELAS || '' Vez(es)'' AS PRAZO,                                                   '  + #13+
   '  CRE.HMEDATAPREVISTA, CRE.HMEDATAEFETIVA,                                                       '  + #13+
   '  IOF.HMEVLRPREVISTO                                  AS IOF_PREVISTO,                           '  + #13+
   '  DECODE(CRE.FLGBAIXADO, 0, 0, IOF.HMEVLRPREVISTO)    AS IOF_EFETIVO,                            '  + #13+
   '  DECODE(IOF.IDLANCIRRF, NULL, 0, IOF.HMEVLRPREVISTO) AS IOF_RECOLHIDO,                          '  + #13+
   '  NVL(IOF.HMEVLRBASE, 0)                              AS HMEVLRBASE,                             '  + #13+
   '  CON.VLRCONTRATO,                                                                               '  + #13+
   '  DECODE(CRE.HMETIPOMOV,                                                                         '  + #13+
   '         0, ''Concessão'',                                                                       '  + #13+
   '         1, ''Prestação '',                                                                      '  + #13+
   '         2, ''Amortização/Refinanciamento'',                                                     '  + #13+
   '         3, ''Quitação'',                                                                        '  + #13+
   '         4, ''Atualização de Débito'',                                                           '  + #13+
   '         5, ''Atualização de Saldo'' ,                                                           '  + #13+
   '         6, ''CARGA'',                                                                           '  + #13+
   '         7, ''Ajustes de Valores''                                                               '  + #13+
   '        ) AS EVENTO,                                                                             '  + #13+
   '  ITE.ITEDESCRICAO                                                                               '  + #13+
   'FROM                                                                                             '  + #13+
   '   PESSOA            MUT,                                                                        '  + #13+
   '   PESSOA            PTR,                                                                        '  + #13+
   '   PLANPREVCONTABIL  PPC,                                                                        '  + #13+
   '   DEPENTIT          DEP,                                                                        '  + #13+
   '   TIPOCONTREMPTMO   TCE,                                                                        '  + #13+
   '   TIPOEMPTMO        TEP,                                                                        '  + #13+
   '   ITEMEMPTMO        ITE,                                                                        '  + #13+
   '   CONTRATOEMPTMO    CON,                                                                        '  + #13+
   '   (                                                                                             '  + #13;

   case rdgTipoData.ItemIndex of
      //Wylliam Leite da Silva - Sol: 253185 PPM: 2040335 - Início
      0: sSQL := sSQL + '    SELECT '                        + #13; // Sol 243679 Kintana 597278
      1: sSQL := sSQL + '    SELECT '              + #13; // Sol 243679 Kintana 597278
      //Wylliam Leite da Silva - Sol: 253185 PPM: 2040335 - Fim
   end;

   sSQL := sSQL +
   '         HME.IDCONTRATOEMPTMO, HME.HMEVLRPREVISTO, HME.HMEVLRBASE,                               '  + #13+
   '         HME.IDITEMEMPTMO,                                                                       '  + #13+
   '         HME.HMEDATAPREVISTA, HME.IDLANCIRRF, HME.HMENUMPARCELAS, HME.HMETIPOMOV, HME.HMESALDODEV,               '  + #13+  //Henrique Massão SOL 116126
   //Pendência 26624 - 01/1/2007
   //'         NVL(MIG.IDPATROATU,CON.IDPATRO) AS IDPATRO,                                             '  + #13+
   //'         NVL(MIG.IDPLANOCONTATU,CON.IDPLANOORIGEM) AS IDPLANO                                    '  + #13+
   '         NVL(MIG.IDPATROANT,CON.IDPATRO) AS IDPATRO,                                             '  + #13+
   '         NVL(MIG.IDPLANOCONTANT,CON.IDPLANOORIGEM) AS IDPLANO                                    '  + #13+
   //Pendência 26624
   '    FROM                                                                                         '  + #13+
   '         CONTRATOEMPTMO CON,                                                                     '  + #13+
   '         HISTMOVEMPTMO  HME                                                                      '  + #13+
   '         left outer join MIGRACONTRATOEP MIG                                                     '  + #13+
   '           ON (MIG.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO AND                                   '  + #13+
   '               MIG.DATAMIGRA        = F_MIGRAEP_DATA(HME.IDCONTRATOEMPTMO, HME.HMEDATAPREVISTA)) '  + #13+
   '    WHERE                                                                                        '  + #13+
   '          (HME.FLGESTORNADO IS NULL OR HME.FLGESTORNADO  = 0)                                    '  + #13+
   '      AND HME.HMECENTRALIZA         = 0                                                          '  + #13+
   '      AND HME.HMEDESTACADO          = 0                                                          '  + #13+
   '      AND HME.IDITEMEMPTMO          IN (SELECT IDITEMEMPTMO                                      '  + #13+
   '                                        FROM   ITEMXPROCESSOEP ITP                               '  + #13+
   '                                        WHERE  ITP.FLGTIPOITEM = 4                               '  + #13+
   '                                        AND    ITP.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO     '  + #13+
   '                                       )                                                         '  + #13+
   '      AND CON.FLGSITUACAO           <> ''C''                                                     '  + #13+
   '      AND HME.IDCONTRATOEMPTMO      = CON.IDCONTRATOEMPTMO                                       '  + #13+{;

   // SOL 185737 KTN 1743378 Otacilio Aquino ** Inicio **
   if rdgTipoData.ItemIndex = 0 then sSQL := sSQL + }
   '      AND ( HME.HMEDATAPREVISTA    BETWEEN TO_DATE(' + QuotedStr(edtDataIni.Text) + ',''dd/mm/yyyy'')      '   + #13+
                                          'AND TO_DATE(' + QuotedStr(edtDataFim.Text) + ',''dd/mm/yyyy'') )    '   + #13;
   // SOL 185737 KTN 1743378 Otacilio Aquino ** Fim **


   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '      AND HME.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)            + #13;

   sSQL := sSQL +
   '   ) IOF,                                                                                        '  + #13+
   '   (                                                                                             '  + #13;

   case rdgTipoData.ItemIndex of
      //Wylliam Leite da Silva - Sol: 253185 PPM: 2040335 - Início
      0: sSQL := sSQL + '    SELECT  '                        + #13; // Sol 243679 Kintana 597278
      1: sSQL := sSQL + '    SELECT '                        + #13; // Sol 243679 Kintana 597278
      //Wylliam Leite da Silva - Sol: 253185 PPM: 2040335 - Fim
   end;

   sSQL := sSQL +
   '        HME.IDCONTRATOEMPTMO, HME.HMEDATAPREVISTA, HME.HMETIPOMOV,                               '  + #13+
   '        HME.HMEDATAEFETIVA, HME.HMESALDODEV, NVL(HME.FLGBAIXADO, 1) AS FLGBAIXADO,               '  + #13+ //Henrique Massão SOL 116126
   //Pendência 26624 - 01/1/2007
   //'        NVL(MIG.IDPATROATU,CON.IDPATRO) AS IDPATRO,                                              '  + #13+
   //'        NVL(MIG.IDPLANOCONTATU,CON.IDPLANOORIGEM) AS IDPLANO                                     '  + #13+
   '        NVL(MIG.IDPATROANT,CON.IDPATRO) AS IDPATRO,                                              '  + #13+
   '        NVL(MIG.IDPLANOCONTANT,CON.IDPLANOORIGEM) AS IDPLANO                                     '  + #13+
   //Fim Pendência 26624
   '    FROM                                                                                         '  + #13+
   '        CONTRATOEMPTMO CON,                                                                      '  + #13+
   '        HISTMOVEMPTMO  HME                                                                       '  + #13+
   '        left outer join MIGRACONTRATOEP MIG                                                      '  + #13+
   '        ON (MIG.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO AND                                      '  + #13;

   case rdgTipoData.ItemIndex of
      0: sSQL := sSQL + '            MIG.DATAMIGRA = F_MIGRAEP_DATA(HME.IDCONTRATOEMPTMO, HME.HMEDATAPREVISTA))'    + #13;
      1: sSQL := sSQL + '            MIG.DATAMIGRA = F_MIGRAEP_DATA(HME.IDCONTRATOEMPTMO, HME.HMEDATAEFETIVA)) '    + #13;
   end;

   sSQL := sSQL +
   '    WHERE                                                                                        '  + #13+
   '        HME.HMECENTRALIZA         = 1                                                            '  + #13+
   '    AND (HME.FLGESTORNADO IS NULL OR HME.FLGESTORNADO  = 0)                                      '  + #13+
   '    AND CON.FLGSITUACAO           <> ''C''                                                       '  + #13+
   '    AND HME.IDCONTRATOEMPTMO      = CON.IDCONTRATOEMPTMO                                         '  + #13;

   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '      AND HME.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)            + #13;

   case rdgTipoData.ItemIndex of
      0: sSQL := sSQL +
   '    AND ( HME.HMEDATAPREVISTA     BETWEEN TO_DATE(' + QuotedStr(edtDataIni.Text) + ',''dd/mm/yyyy'') '        +
   '                                      AND TO_DATE(' + QuotedStr(edtDataFim.Text) + ',''dd/mm/yyyy'') ) '      + #13;
      1: sSQL := sSQL +
   '    AND ( HME.HMEDATAEFETIVA      BETWEEN TO_DATE(' + QuotedStr(edtDataIni.Text) + ',''dd/mm/yyyy'') '        +
   '                                      AND TO_DATE(' + QuotedStr(edtDataFim.Text) + ',''dd/mm/yyyy'') ) '      + #13;
   end;

   sSQL := sSQL +
   '   ) CRE                                                                               '            + #13+
   'WHERE                                                                                  '            + #13+
   '      TEP.IDEMPRESAPROP            = ' + IntToStr(Sistema.IdEmpresa)                                + #13+
   '  AND IOF.IDPATRO                  IN (' + molListaPatro.PegaPatro + ')                '            + #13+
   '  AND IOF.IDPLANO                  IN (' + molListaPlano.PegaPlano + ')                '            + #13+
   '  AND IOF.IDPLANO                  = PPC.IDPLANOPREV                                   '            + #13+
   '  AND IOF.IDCONTRATOEMPTMO         = CRE.IDCONTRATOEMPTMO                              '            + #13+
   '  AND IOF.HMETIPOMOV               = CRE.HMETIPOMOV                                    '            + #13+
   '  AND IOF.HMEDATAPREVISTA          = CRE.HMEDATAPREVISTA                               '            + #13+
   '  AND CON.IDCONTRATOEMPTMO         = IOF.IDCONTRATOEMPTMO                              '            + #13+
   '  AND ITE.IDITEMEMPTMO             = IOF.IDITEMEMPTMO                                  '            + #13+
   '  AND CON.IDCONTRATOEMPTMO         = CRE.IDCONTRATOEMPTMO                              '            + #13+
   '  AND CON.IDBENEF                  = MUT.IDPESSOA                                      '            + #13+
   '  AND CON.IDBENEF                  = DEP.IDPESSOA                                      '            + #13+
   '  AND CON.IDPESSOA                 = DEP.IDTITULAR                                     '            + #13+
   '  AND CON.IDPATRO                  = PTR.IDPESSOA                                      '            + #13+
   '  AND CON.IDTIPOCONTREMPTMO        = TCE.IDTIPOCONTREMPTMO                             '            + #13+
   '  AND TCE.IDTIPOEMPTMO             = TEP.IDTIPOEMPTMO                                  '            + #13+

   'UNION  ALL                                                                             '            + #13+  // Sol 243679 Kintana 597278
   //Wylliam Leite da Silva - Sol: 253185 PPM: 2040335 - Início
   'SELECT                                                                                 '            + #13+
   //Wylliam Leite da Silva - Sol: 253185 PPM: 2040335 - Fim
   //edilaine - SIG63317 - inicio
   //'  PTR.NOME AS NOMEPATRO, PPC.NOME AS NOMEPLANO,                                                '  + #13+
   ' PTR.NOME AS NOMEPATRO,                                                                '            + #13+
   ' NVL((SELECT PPC1.NOME                                                                 '            + #13+
   '        FROM PERFILINVEST PI                                                           '            + #13+
   '          JOIN PLANPREVCONTABIL PPC1 ON PI.IDPLANPREVCONTAB = PPC1.IDPLANOPREV         '            + #13+
   '       WHERE PI.IDPERFILINVEST = CON.IDPERFILINVEST),                                  '            + #13+
   '     (SELECT PPC1.NOME                                                                 '            + #13+
   '      FROM PERFILINVXELEG PIE                                                          '            + #13+
   '           JOIN PERFILINVEST PI ON PIE.IDPERFILINVEST = PI.IDPERFILINVEST              '            + #13+
   '                               AND PIE.IDPLANOPREV = PI.IDPLANOPREV                    '            + #13+
   '           JOIN PLANPREVCONTABIL PPC1 ON PI.IDPLANPREVCONTAB = PPC1.IDPLANOPREV        '            + #13+
   '      WHERE PIE.IDPESSOA = CON.IDPESSOA AND                                            '            + #13+
   '            PIE.IDPLANOPREV = CON.IDPLANOPREV AND                                      '            + #13+
   '            PIE.DTINICIO <= HME.HMEDATAPREVISTA AND                                    '            + #13+
   '            (PIE.DTFIM IS NULL OR PIE.DTFIM > HME.HMEDATAPREVISTA))) NOMEPLANO,        '            + #13+

   ' NVL((SELECT PI.NOME                                                                   '            + #13+
   '        FROM PERFILINVEST PI                                                           '            + #13+
   '       WHERE PI.IDPERFILINVEST = CON.IDPERFILINVEST),                                  '            + #13+
   '     (SELECT PI.NOME                                                                   '            + #13+
   '        FROM PERFILINVXELEG PIE                                                        '            + #13+
   '        JOIN PERFILINVEST PI ON PIE.IDPERFILINVEST = PI.IDPERFILINVEST                 '            + #13+
   '                            AND PIE.IDPLANOPREV = PI.IDPLANOPREV                       '            + #13+
   '       WHERE PIE.IDPESSOA = CON.IDPESSOA AND                                           '            + #13+
   '             PIE.IDPLANOPREV = CON.IDPLANOPREV AND                                     '            + #13+
   '             PIE.DTINICIO <= HME.HMEDATAPREVISTA AND                                   '            + #13+
   '            (PIE.DTFIM IS NULL OR PIE.DTFIM > HME.HMEDATAPREVISTA))) NOMEPERFIL,       '            + #13+
   //edilaine - SIG63317 - inicio
   '    CON.IDCONTRATOEMPTMO, DEP.MATRICULA, MUT.NOME,                                     '            + #13+
   '    TCE.TCEDESCRICAO,HME.HMESALDODEV,                                                  '            + #13+
   '    HME.HMENUMPARCELAS || ''Vez(es)'' AS PRAZO,                                        '            + #13+
   '    HME.HMEDATAPREVISTA, HME.HMEDATAEFETIVA,                                           '            + #13+
   '    HME.HMEVLRPREVISTO                                  AS IOF_PREVISTO,               '            + #13+
   '    DECODE(HME.FLGBAIXADO, 0, 0, HME.HMEVLRPREVISTO)    AS IOF_EFETIVO,                '            + #13+
   '    DECODE(HME.IDLANCIRRF, NULL, 0, HME.HMEVLRPREVISTO) AS IOF_RECOLHIDO,              '            + #13+
   '    NVL(HME.HMEVLRBASE, 0)                              AS HMEVLRBASE,                 '            + #13+
   '    CON.VLRCONTRATO,                                                                   '            + #13+
   '    DECODE(HME.HMETIPOMOV,                                                             '            + #13+
   '           0, ''Concessão'',                                                           '            + #13+
   '           1, ''Prestação '',                                                          '            + #13+
   '           2, ''Amortização/Refinanciamento'',                                         '            + #13+
   '           3, ''Quitação'',                                                            '            + #13+
   '           4, ''Atualização de Débito'',                                               '            + #13+
   '           5, ''Atualização de Saldo'' ,                                               '            + #13+
   '           6, ''CARGA'',                                                               '            + #13+
   '           7, ''Ajustes de Valores''                                                   '            + #13+
   '           ) AS EVENTO,                                                                '            + #13+
   '    ITE.ITEDESCRICAO                                                                   '            + #13+
   'FROM                                                                                   '            + #13+
   '    PESSOA            MUT,                                                             '            + #13+
   '    PESSOA            PTR,                                                             '            + #13+
   '    PLANPREVCONTABIL  PPC,                                                             '            + #13+
   '    DEPENTIT          DEP,                                                             '            + #13+
   '    TIPOCONTREMPTMO   TCE,                                                             '            + #13+
   '    TIPOEMPTMO        TEP,                                                             '            + #13+
   '    ITEMEMPTMO        ITE,                                                             '            + #13+
   '    CONTRATOEMPTMO    CON,                                                             '            + #13;

   case rdgTipoData.ItemIndex of
      //Wylliam Leite da Silva - Sol: 253185 PPM: 2040335 - Início
      0: sSQL := sSQL + '   (SELECT '                        + #13; // Sol 243679 Kintana 597278
      1: sSQL := sSQL + '   (SELECT '                        + #13; // Sol 243679 Kintana 597278
      //Wylliam Leite da Silva - Sol: 253185 PPM: 2040335 - Fim
   end;

   sSQL := sSQL +
   '        H.IDCONTRATOEMPTMO,                                                            '            + #13+
   '        H.IDITEMEMPTMO,                                                                '            + #13+
   '        H.HMENUMPARCELAS,                                                              '            + #13+
   '        H.HMEDATAPREVISTA,                                                             '            + #13+
   '        H.HMEDATAEFETIVA,                                                              '            + #13+
   '        H.HMEVLRPREVISTO,                                                              '            + #13+
   '        H.FLGBAIXADO,                                                                  '            + #13+
   '        H.IDLANCIRRF,                                                                  '            + #13+
   '        H.HMEVLRBASE,                                                                  '            + #13+
   '        H.HMETIPOMOV,                                                                  '            + #13+
   '        H.HMESALDODEV,                                                                 '            + #13+
   //Pendência 26624 - 01/1/2007
   //'        NVL(M.IDPATROATU,C.IDPATRO) AS IDPATRO,                                        '            + #13+
   //'        NVL(M.IDPLANOCONTATU,C.IDPLANOORIGEM) AS IDPLANO                               '            + #13+
   '        NVL(M.IDPATROANT,C.IDPATRO) AS IDPATRO,                                        '            + #13+
   '        NVL(M.IDPLANOCONTANT,C.IDPLANOORIGEM) AS IDPLANO                               '            + #13+
   //Fim Pendência 26624
   '     FROM                                                                              '            + #13+
   '        CONTRATOEMPTMO C,                                                              '            + #13+
   '        HISTMOVEMPTMO  H                                                               '            + #13+
   '        left outer join MIGRACONTRATOEP M                                              '            + #13+
   '          ON (M.IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO AND                              '            + #13;

   case rdgTipoData.ItemIndex of
      0: sSQL := sSQL + '              M.DATAMIGRA = F_MIGRAEP_DATA(H.IDCONTRATOEMPTMO, H.HMEDATAPREVISTA))' + #13;
      1: sSQL := sSQL + '              M.DATAMIGRA = F_MIGRAEP_DATA(H.IDCONTRATOEMPTMO, H.HMEDATAEFETIVA)) ' + #13;
   end;

   sSQL := sSQL +
   '     WHERE                                                                            '             + #13+
   '         NVL(H.FLGESTORNADO,0) = 0                                                    '             + #13+
   '     AND H.HMEDESTACADO        = 1                                                    '             + #13+
   '     AND H.IDITEMEMPTMO        IN (SELECT IDITEMEMPTMO                                '             + #13+
   '                                   FROM   ITEMXPROCESSOEP                             '             + #13+
   '                                   WHERE  FLGTIPOITEM = 4                             '             + #13+
   '                                   AND    IDTIPOCONTREMPTMO = C.IDTIPOCONTREMPTMO     '             + #13+
   '                                  )                                                   '             + #13+
   '     AND C.FLGSITUACAO         <> ''C''                                               '             + #13+
   '     AND C.IDCONTRATOEMPTMO    = H.IDCONTRATOEMPTMO                                   '             + #13;

   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '    AND H.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)                + #13;

   case rdgTipoData.ItemIndex of
      0: sSQL := sSQL +
   '    AND ( H.HMEDATAPREVISTA     BETWEEN TO_DATE(' + QuotedStr(edtDataIni.Text) + ',''dd/mm/yyyy'') '     +
   '                                      AND TO_DATE(' + QuotedStr(edtDataFim.Text) + ',''dd/mm/yyyy'') ) ' + #13;
      1: sSQL := sSQL +
   '    AND ( H.HMEDATAEFETIVA      BETWEEN TO_DATE(' + QuotedStr(edtDataIni.Text) + ',''dd/mm/yyyy'') '     +
   '                                      AND TO_DATE(' + QuotedStr(edtDataFim.Text) + ',''dd/mm/yyyy'') ) ' + #13;
   end;

   sSQL := sSQL +
   '   ) HME                                                                              '             + #13+
   'WHERE                                                                                 '             + #13+
   '      TEP.IDEMPRESAPROP       = ' + IntToStr(Sistema.IdEmpresa)                                     + #13+
   '  AND HME.IDPATRO             IN (' + molListaPatro.PegaPatro + ')                    '             + #13+
   '  AND HME.IDPLANO             IN (' + molListaPlano.PegaPlano + ')                    '             + #13+
   '  AND CON.IDTIPOCONTREMPTMO   = TCE.IDTIPOCONTREMPTMO                                 '             + #13+
   '  AND TCE.IDTIPOEMPTMO        = TEP.IDTIPOEMPTMO                                      '             + #13+
   '  AND CON.FLGSITUACAO         <> ''C''                                                '             + #13+
   '  AND CON.IDCONTRATOEMPTMO    = HME.IDCONTRATOEMPTMO                                  '             + #13+
   '  AND CON.IDBENEF             = MUT.IDPESSOA                                          '             + #13+
   '  AND CON.IDBENEF             = DEP.IDPESSOA                                          '             + #13+
   '  AND CON.IDPESSOA            = DEP.IDTITULAR                                         '             + #13+
   '  AND CON.IDPATRO             = PTR.IDPESSOA                                          '             + #13+
   '  AND ITE.IDITEMEMPTMO        = HME.IDITEMEMPTMO                                      '             + #13+
   '  AND CON.IDTIPOCONTREMPTMO   = TCE.IDTIPOCONTREMPTMO                                 '             + #13+
   '  AND TCE.IDTIPOEMPTMO        = TEP.IDTIPOEMPTMO                                      '             + #13+
   '  AND HME.IDPLANO             = PPC.IDPLANOPREV                                       '             + #13+
   'ORDER BY                                                                              '             + #13+
   '  NOMEPLANO, NOMEPATRO, NOME                                                          '             + #13;

  with dtmRelRetencaoIOFPP.qryRetencaoIOFPP do
   begin
      Close;
      SQL.Text := sSQL;
    //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
    //SQL.SaveToFile(Sistema.TempDir + 'EP-RelRetencaoIOFPP.txt');
      SQL.SaveToFile(ftempregra + '\' + 'EP-RelRetencaoIOFPP.txt');
      Open;
   end;
end;

procedure TcfgRelRetencaoIOFPP.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;


procedure TcfgRelRetencaoIOFPP.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;


procedure TcfgRelRetencaoIOFPP.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;


procedure TcfgRelRetencaoIOFPP.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;


procedure TcfgRelRetencaoIOFPP.DBcboTipoEmptmoExit(Sender: TObject);
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



