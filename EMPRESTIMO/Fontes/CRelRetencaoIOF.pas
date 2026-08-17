unit CRelRetencaoIOF;

// Alterações:
{--------------------------------------------------------------------------------------------------
Pendência   : Sol: 253185 PPM: 2040335
Responsável : Wylliam Leite da Silva
Data        : 18/05/2015
Descrição   : Reestruturação da HistMovEmptmo (*Retirada dos Hints)
--------------------------------------------------------------------------------------------------
Pendência   : SOL 114575 KINTANA 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
----------------------------------------------------------------------------------------------------
Rotina    : FiltraRelatorio
Data      : 19/08/2004
Autor     : André Pontes
Pendência :
Descrição : Ajustes na query: de acorco com o FLGEXCEPCIONAL, a tabela PLANPREVXCONTABIL é usada ou
            não (para filtro e joins)
----------------------------------------------------------------------------------------------------
Rotina    : FiltraRelatorio
Data      : 22/03/2004
Autor     : Marchetti
Pendência : 16324
Descrição : Acerto na query (IOF.HMEVLRBASE)
---------------------------------------------------------------------------------------------------}

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
   TB97, ExtCtrls, mContratoEmptmo, Mask, wwdbedit, Wwdbspin, CheckLst,
   wwdblook, db, fcCombo, fcColorCombo, wwdbdatetimepicker, mListaPlano,
   mListaPatro, mListaPlanoContab;

type
   TcfgRelRetencaoIOF = class(TcfgRel)
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
   cfgRelRetencaoIOF: TcfgRelRetencaoIOF;



implementation
{$R *.DFM}
uses
   DLookEmptmo,
   dEmptmo,
   USistema,
   UfuncoesEmptmo,
   dRelRetencaoIOF;



procedure TcfgRelRetencaoIOF.AbreQueries;
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



procedure TcfgRelRetencaoIOF.FormShow(Sender: TObject);
var
   dDataHoje : TDateTime;
   dDataIni  : TDateTime;
begin
   inherited;

   molContratoEmptmo.btnLimpaContrato.Click;

   // preenche as datas - período sempre de Domingo a Sábado
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



procedure TcfgRelRetencaoIOF.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
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



procedure TcfgRelRetencaoIOF.MontaQuery;
begin
   inherited;

   with dtmRelRetencaoIOF do
   begin
      rptRetencaoIOF_lblDataIni.Caption   := edtDataIni.Text;
      rptRetencaoIOF_lblDataFim.Caption   := edtDataFim.Text;

      case rdgTipoData.ItemIndex of
         0: rptRetencaoIOF_lblTipoData.Caption  := 'Datas Previstas';
         1: rptRetencaoIOF_lblTipoData.Caption  := 'Datas Efetivas';
      end;

      bSeparador  := chkLinhas.Checked;
      bSintetico  := chkSintetico.Checked;

      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      bCorlinha   := chkCorLinha.Checked;
      CorLinha    := cboCorLinha.SelectedColor;
   end;

   FiltraRelatorio;
end;



// Monta o select de contratos por faixa de meses, de acordo com a tela de parametros.
procedure TcfgRelRetencaoIOF.FiltraRelatorio;
var
   sSQL        : String;
   sOrdenacao  : String;
   sEmpresa    : String;
begin
   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------

   sEmpresa := IntToStr(Sistema.IDEmpresa);

   sSQL :=
   //Wylliam Leite da Silva - Sol: 253185 PPM: 2040335 - Início
   'SELECT DISTINCT '                                                                              + #13 +
   //Wylliam Leite da Silva - Sol: 253185 PPM: 2040335 - Fim
   '  CON.IDCONTRATOEMPTMO, DEP.MATRICULA, MUT.NOME, '                                             + #13 +
   '  TCE.TCEDESCRICAO, '                                                                          + #13 +
   '  IOF.HMENUMPARCELAS || '' Vez(es)'' AS PRAZO, '                                               + #13 +
   '  CRE.HMEDATAPREVISTA, CRE.HMEDATAEFETIVA, '                                                   + #13 +
   '  IOF.HMEVLRPREVISTO                                  AS IOF_PREVISTO, '                       + #13 +
   '  DECODE(CRE.FLGBAIXADO, 0, 0, IOF.HMEVLRPREVISTO)    AS IOF_EFETIVO, '                        + #13 +
   '  DECODE(IOF.IDLANCIRRF, NULL, 0, IOF.HMEVLRPREVISTO) AS IOF_RECOLHIDO, '                      + #13 +
   '  NVL(IOF.HMEVLRBASE, 0)                              AS HMEVLRBASE, '                         + #13 +
   '  CON.VLRCONTRATO, '                                                                           + #13 +
   '  DECODE(CRE.HMETIPOMOV, '                                                                     + #13 +
   '         0, ''Concessão'', '                                                                   + #13 +
   '         1, ''Prestação '', '                                                                  + #13 +
   '         2, ''Amortização/Refinanciamento'', '                                                 + #13 +
   '         3, ''Quitação'', '                                                                    + #13 +
   '         4, ''Atualização de Débito'', '                                                       + #13 +
   '         5, ''Atualização de Saldo'' , '                                                       + #13 +
   '         6, ''CARGA'', '                                                                       + #13 +
   '         7, ''Ajustes de Valores'' '                                                           + #13 +
   '        ) AS EVENTO, '                                                                         + #13 +

   // Marchetti - Pendencia 20501 - 22/05/2006
   '  ITE.ITEDESCRICAO '                                                                           + #13 +

   'FROM '                                                                                         + #13 +
   '   PESSOA            MUT, '                                                                    + #13 +
   '   DEPENTIT          DEP, '                                                                    + #13 +
   '   TIPOCONTREMPTMO   TCE, '                                                                    + #13 +
   '   TIPOEMPTMO        TEP, '                                                                    + #13 +

   // Pendência 23260 - Marcos Topini em 01/11/2006
   '   VWMIGRACONTRATOEP MIG, '                                                                    + #13 +

   // Marchetti - Pendencia 20501 - 22/05/2006
   '   ITEMEMPTMO        ITE, '                                                                    + #13;

   sSQL := sSQL +
   '   CONTRATOEMPTMO    CON, '                                                                    + #13 +

   '  ( SELECT                                                                                       '             + #13+
   '      HME.IDCONTRATOEMPTMO, HME.HMEVLRPREVISTO, HME.HMEVLRBASE,                                  '             + #13+
   '      HME.IDITEMEMPTMO,                                                                          '             + #13+
   '      HME.HMEDATAPREVISTA, HME.IDLANCIRRF, HME.HMENUMPARCELAS, HME.HMETIPOMOV                    '             + #13+
   '   FROM                                                                                          '             + #13+
   '      HISTMOVEMPTMO  HME,                                                                        '             + #13+
   '      CONTRATOEMPTMO CON                                                                         '             + #13+
   '   WHERE                                                                                         '             + #13+
   '          NVL(HME.FLGESTORNADO, 0)  = 0                                                          '             + #13+
   '      AND (HME.HMECENTRALIZA = 0 AND HME.HMEDESTACADO = 0)                                       '             + #13+
   '      AND HME.IDITEMEMPTMO         IN (SELECT IDITEMEMPTMO                                       '             + #13+
   '                                       FROM   ITEMXPROCESSOEP ITP                                '             + #13+
   '                                       WHERE  ITP.FLGTIPOITEM = 4                                '             + #13+
   '                                       AND    ITP.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO      '             + #13+
   '                                      )                                                          '             + #13+
   '      AND CON.FLGSITUACAO          <> ''C''                                                      '             + #13+
   '      AND CON.IDCONTRATOEMPTMO      = HME.IDCONTRATOEMPTMO                                       '             + #13;

   if rdgTipoData.ItemIndex = 0 then sSQL := sSQL +
   '      AND ( HME.HMEDATAPREVISTA    BETWEEN TO_DATE(' + QuotedStr(edtDataIni.Text) + ',''dd/mm/yyyy'')      '   + #13+
                                          'AND TO_DATE(' + QuotedStr(edtDataFim.Text) + ',''dd/mm/yyyy'') )    '   + #13;

   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '      AND HME.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)                       + #13;

   sSQL := sSQL +
   '  ) IOF,                                                                                                     ' + #13+

   '  ( SELECT                                                                                                         ' + #13 +
   '        HME.IDCONTRATOEMPTMO, HME.HMEDATAPREVISTA, HME.HMETIPOMOV,                                              '   + #13+
   '        HME.HMEDATAEFETIVA, NVL(HME.FLGBAIXADO, 1) AS FLGBAIXADO                                                '   + #13+
   '    FROM                                                                                                       '   + #13+
   '        HISTMOVEMPTMO  HME,                                                                                     '   + #13+
   '        CONTRATOEMPTMO CON                                                                                      '   + #13+
   '    WHERE                                                                                                      '   + #13+
   '        HME.HMECENTRALIZA         = 1                                                                        '   + #13+
   '    AND NVL(HME.FLGESTORNADO, 0)  = 0                                                                        '   + #13+
   '    AND CON.FLGSITUACAO           <> ''C''                                                                    '   + #13+
   '    AND CON.IDCONTRATOEMPTMO      = HME.IDCONTRATOEMPTMO                                                     '   + #13;

   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '    AND HME.IDCONTRATOEMPTMO      = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)                       + #13;

   case rdgTipoData.ItemIndex of
      0: sSQL := sSQL +
   '    AND ( HME.HMEDATAPREVISTA     BETWEEN TO_DATE(' + QuotedStr(edtDataIni.Text) + ',''dd/mm/yyyy'') '        +
   '                                      AND TO_DATE(' + QuotedStr(edtDataFim.Text) + ',''dd/mm/yyyy'') ) '      + #13;
      1: sSQL := sSQL +
   '    AND ( HME.HMEDATAEFETIVA      BETWEEN TO_DATE(' + QuotedStr(edtDataIni.Text) + ',''dd/mm/yyyy'') '        +
   '                                      AND TO_DATE(' + QuotedStr(edtDataFim.Text) + ',''dd/mm/yyyy'') ) '      + #13;
   end;
   sSQL := sSQL +
   ') CRE                                                                                                   '      + #13+

   ' WHERE                                                                                  '                      + #13+
   '      TEP.IDEMPRESAPROP            = ' + IntToStr(Sistema.IdEmpresa)                                           + #13+
   '  AND MIG.IDPATROATU               IN (' + molListaPatro.PegaPatro + ')                 '                      + #13+
   '  AND MIG.IDPLANOCONTATU           IN (' + molListaPlano.PegaPlano + ')                 '                      + #13;

   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '  AND CON.IDTIPOEMPTMO             = ' + DBcboTipoEmptmo.LookupValue                                           + #13;

   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '  AND CON.IDTIPOCONTREMPTMO        = ' + DBcboTipoContrato.LookupValue                                         + #13;

   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '  AND CON.IDCONTRATOEMPTMO         = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)                       + #13;

  sSQL := sSQL +
  '   AND IOF.IDCONTRATOEMPTMO         = CRE.IDCONTRATOEMPTMO                                                 '    + #13+
  '   AND IOF.HMETIPOMOV               = CRE.HMETIPOMOV                                                       '    + #13+
  '   AND IOF.HMEDATAPREVISTA          = CRE.HMEDATAPREVISTA                                                  '    + #13+
  '   AND CON.IDCONTRATOEMPTMO         = IOF.IDCONTRATOEMPTMO                                                 '    + #13+
  '   AND ITE.IDITEMEMPTMO             = IOF.IDITEMEMPTMO                                                     '    + #13+
  '   AND CON.IDCONTRATOEMPTMO         = CRE.IDCONTRATOEMPTMO                                                 '    + #13+
  '   AND CON.IDBENEF                  = MUT.IDPESSOA                                                         '    + #13+
  '   AND CON.IDBENEF                  = DEP.IDPESSOA                                                         '    + #13+
  '   AND CON.IDPESSOA                 = DEP.IDTITULAR                                                        '    + #13+
  '   AND CON.IDTIPOCONTREMPTMO        = TCE.IDTIPOCONTREMPTMO                                                '    + #13+
  '   AND TCE.IDTIPOEMPTMO             = TEP.IDTIPOEMPTMO                                                     '    + #13+

  // Marchetti - Pendencia 25759
  '   AND CON.IDCONTRATOEMPTMO         = MIG.IDCONTRATOEMPTMO                                                 '    + #13+

   // Pendência 23260 - Marcos Topini
   '  AND MIG.DATAMIGRA                = (SELECT MAX(DATAMIGRA) '                                  + #13 +
   '                                        FROM VWMIGRACONTRATOEP '                               + #13 +
   '                                       WHERE IDCONTRATOEMPTMO = IOF.IDCONTRATOEMPTMO '         + #13 +
   '                                         AND DATAMIGRA       <= IOF.HMEDATAPREVISTA) '         + #13 +

  'UNION                                                                                                      '    + #13;

  case rdgTipoData.ItemIndex of
     //Wylliam Leite da Silva - Sol: 253185 PPM: 2040335 - Início
     0: sSQL := sSQL + 'SELECT                            '                             + #13;
     1: sSQL := sSQL + 'SELECT             '                             + #13;
     //Wylliam Leite da Silva - Sol: 253185 PPM: 2040335 - Fim
  end;

  sSQL := sSQL +
  '   CON.IDCONTRATOEMPTMO, DEP.MATRICULA, MUT.NOME,                                                          '    + #13+
  '   TCE.TCEDESCRICAO,                                                                                       '    + #13+
  '   HME.HMENUMPARCELAS || ''Vez(es)'' AS PRAZO,                                                             '    + #13+
  '   HME.HMEDATAPREVISTA, HME.HMEDATAEFETIVA,                                                                '    + #13+
  '   HME.HMEVLRPREVISTO                                  AS IOF_PREVISTO,                                    '    + #13+
  '   DECODE(HME.FLGBAIXADO, 0, 0, HME.HMEVLRPREVISTO)    AS IOF_EFETIVO,                                     '    + #13+
  '   DECODE(HME.IDLANCIRRF, NULL, 0, HME.HMEVLRPREVISTO) AS IOF_RECOLHIDO,                                   '    + #13+
  '   NVL(HME.HMEVLRBASE, 0)                              AS HMEVLRBASE,                                      '    + #13+
  '   CON.VLRCONTRATO,                                                                                        '    + #13+
  '   DECODE(HME.HMETIPOMOV,                                                                                  '    + #13+
  '          0, ''Concessão'',                                                                                '    + #13+
  '          1, ''Prestação'',                                                                                '    + #13+
  '          2, ''Amortização/Refinanciamento'',                                                              '    + #13+
  '          3, ''Quitação'',                                                                                 '    + #13+
  '          4, ''Atualização de Débito'',                                                                    '    + #13+
  '          5, ''Atualização de Saldo'' ,                                                                    '    + #13+
  '          6, ''CARGA'',                                                                                    '    + #13+
  '          7, ''Ajustes de Valores''                                                                        '    + #13+
  '         ) AS EVENTO,                                                                                      '    + #13+
  '   ITE.ITEDESCRICAO                                                                                        '    + #13+
  'FROM                                                                                                       '    + #13+
  '   PESSOA            MUT,                                                                                  '    + #13+
  '   DEPENTIT          DEP,                                                                                  '    + #13+
  '   TIPOCONTREMPTMO   TCE,                                                                                  '    + #13+
  '   TIPOEMPTMO        TEP,                                                                                  '    + #13+
  '   ITEMEMPTMO        ITE,                                                                                  '    + #13+
  '   HISTMOVEMPTMO     HME,                                                                                  '    + #13+
  '   CONTRATOEMPTMO    CON,                                                                                  '    + #13+

   // Pendência 23260 - Marcos Topini
  '   VWMIGRACONTRATOEP MIG                                                                                   '    + #13 +

  'WHERE                                                                                                      '    + #13+
  '      TEP.IDEMPRESAPROP            = ' + IntToStr(Sistema.IdEmpresa)                                            + #13+
  '  AND MIG.IDPATROATU               IN (' + molListaPatro.PegaPatro + ')                                    '    + #13+
  '  AND MIG.IDPLANOCONTATU           IN (' + molListaPlano.PegaPlano + ')                                    '    + #13;

   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '  AND CON.IDTIPOEMPTMO             = ' + DBcboTipoEmptmo.LookupValue                                           + #13;

   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '  AND CON.IDTIPOCONTREMPTMO        = ' + DBcboTipoContrato.LookupValue                                         + #13;

   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '  AND CON.IDCONTRATOEMPTMO         = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)                       + #13;

   sSQL := sSQL +
   '  AND NVL(HME.FLGESTORNADO,0) = 0                                                                         '    + #13+
   '  AND (HME.HMECENTRALIZA      = 1 OR HME.HMEDESTACADO = 1)                                                '    + #13+
   '  AND HME.IDITEMEMPTMO        IN (SELECT IDITEMEMPTMO                                                     '    + #13+
   '                                  FROM   ITEMXPROCESSOEP ITP                                              '    + #13+
   '                                  WHERE  ITP.FLGTIPOITEM = 4                                              '    + #13+
   '                                  AND    ITP.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO                    '    + #13+
   '                                 )                                                                        '    + #13+
   '  AND CON.FLGSITUACAO <> ''C''                                                                            '    + #13+
   '  AND CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO                                                         '    + #13+
   '  AND CON.IDBENEF                  = MUT.IDPESSOA                                                         '    + #13+
   '  AND CON.IDBENEF                  = DEP.IDPESSOA                                                         '    + #13+
   '  AND CON.IDPESSOA                 = DEP.IDTITULAR                                                        '    + #13+
   '  AND ITE.IDITEMEMPTMO             = HME.IDITEMEMPTMO                                                     '    + #13+
   '  AND CON.IDTIPOCONTREMPTMO        = TCE.IDTIPOCONTREMPTMO                                                '    + #13+
   '  AND TCE.IDTIPOEMPTMO             = TEP.IDTIPOEMPTMO                                                     '    + #13;

  case rdgTipoData.ItemIndex of
     0: sSQL := sSQL +
     '  AND ( HME.HMEDATAPREVISTA     BETWEEN TO_DATE(' + QuotedStr(edtDataIni.Text) + ',''dd/mm/yyyy'') '        +
                                         'AND TO_DATE(' + QuotedStr(edtDataFim.Text) + ',''dd/mm/yyyy'') ) '      + #13;
     1: sSQL := sSQL +
     '  AND ( HME.HMEDATAEFETIVA      BETWEEN TO_DATE(' + QuotedStr(edtDataIni.Text) + ',''dd/mm/yyyy'') '        +
                                         'AND TO_DATE(' + QuotedStr(edtDataFim.Text) + ',''dd/mm/yyyy'') ) '      + #13;
  end;

  sSQL := sSQL +
  // Marchetti - Pendencia 25759
  '  AND MIG.IDCONTRATOEMPTMO         = CON.IDCONTRATOEMPTMO '                                    + #13 +

  // Pendência 23260 - Marcos Topini
  '  AND MIG.DATAMIGRA                = (SELECT MAX(DATAMIGRA) '                                  + #13 +
  '                                        FROM VWMIGRACONTRATOEP '                               + #13 +
  '                                       WHERE IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO '         + #13 +
  '                                         AND DATAMIGRA       <= HME.HMEDATAPREVISTA) '         + #13 +

   'ORDER BY '                                                                                     + #13 +
   '  PRAZO, NOME ';

   with dtmRelRetencaoIOF.qryRetencaoIOF do
   begin
      Close;
      SQL.Text := sSQL;
    //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
    //SQL.SaveToFile(Sistema.TempDir + 'EP-RelRetencaoIOF.txt');
      SQL.SaveToFile(ftempregra + '\' + 'EP-RelRetencaoIOF.txt');
      Open;
   end;
end;



procedure TcfgRelRetencaoIOF.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TcfgRelRetencaoIOF.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TcfgRelRetencaoIOF.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TcfgRelRetencaoIOF.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



procedure TcfgRelRetencaoIOF.DBcboTipoEmptmoExit(Sender: TObject);
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
