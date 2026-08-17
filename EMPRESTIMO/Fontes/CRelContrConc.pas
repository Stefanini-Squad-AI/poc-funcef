unit CRelContrConc;

// Alterações:
{ --------------------------------------------------------------------------------------------------
Pendência   : SOL 114575 Kintana 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
----------------------------------------------------------------------------------------------------
Rotina    : FiltraRelatorio
Data      : 19/08/2004
Autor     : André Pontes
Pendência :
Descrição : Ajustes na query: de acordo com o FLGEXCEPCIONAL, a tabela PLANPREVXCONTABIL é usada ou
            não (para filtro e joins)
----------------------------------------------------------------------------------------------------
Rotina    : FiltraRelatorio
Data      : 16/10/2002
Autor     : Marchetti
Descrição : Colocado filtro por contratos não efetivados
---------------------------------------------------------------------------------------------------}

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
   TB97, ExtCtrls, mContratoEmptmo, Mask, wwdbedit, Wwdbspin, CheckLst,
   wwdblook, db, fcCombo, fcColorCombo, wwdbdatetimepicker, mListaPlano,
   mListaPatro, mListaPlanoContab;

type
   TcfgRelContrConc = class(TcfgRel)
      molContratoEmptmo: TmolContratoEmptmo;
      Label1: TLabel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      DBcboTipoContrato: TwwDBLookupCombo;
      Label2: TLabel;
      rdgOrdenar: TRadioGroup;
      GroupBox1: TGroupBox;
      chkCorLinha: TCheckBox;
      cboCorLinha: TfcColorCombo;
      chkLinhas: TCheckBox;
      Panel1: TPanel;
      Label3: TLabel;
      Label4: TLabel;
      edtDataIni: TwwDBDateTimePicker;
      edtDataFim: TwwDBDateTimePicker;
      rdgData: TRadioGroup;
      chkEfetivado: TCheckBox;
      molListaPatro: TmolListaPatro;
      rdgRenovacao: TRadioGroup;
      chkNaoEfetivados: TCheckBox;
      molListaPlano: TmolListaPlanoContab;

      procedure FormShow(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
      procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
      procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
      procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
      procedure chkNaoEfetivadosClick(Sender: TObject);
      procedure chkEfetivadoClick(Sender: TObject);


   private  // Private declarations

      procedure AbreQueries;

      procedure MontaQuery; override;
      procedure FiltraRelatorio;


   public   // Public declarations


   end;



var
  cfgRelContrConc: TcfgRelContrConc;



implementation
{$R *.DFM}
uses
   DLookEmptmo,
   UDiasUteis,
   USistema,
   UfuncoesEmptmo,
   dRelContrConc, dEmptmo;



procedure TcfgRelContrConc.AbreQueries;
begin
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



procedure TcfgRelContrConc.FormShow(Sender: TObject);
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

   rdgData.ItemIndex := 0;

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



procedure TcfgRelContrConc.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
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



procedure TcfgRelContrConc.MontaQuery;
begin
   inherited;

   with dtmRelContrConc do begin

      dtmRelContrConc.TipoRelatorio := 'S';

      if rdgData.ItemIndex = 0 then begin
         dtmRelContrConc.TipoData := 'C';
      end else begin
         dtmRelContrConc.TipoData := 'A';
      end;

      rptContrCond_lblDataIni.Caption := edtDataIni.Text;
      rptContrCond_lblDataFim.Caption := edtDataFim.Text;

      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      bCorlinha   := chkCorLinha.Checked;
      CorLinha    := cboCorLinha.SelectedColor;

      bSeparador  := chkLinhas.Checked;
   end;

   FiltraRelatorio;
end;



// Monta o select de contratos por faixa de meses, de acordo com a tela de parametros. 
procedure TcfgRelContrConc.FiltraRelatorio;
var
   sSql        : String;
   sOrdenacao  : String;
begin
   ParametrosSistema;

   sSql :=
   'SELECT '                                                                           + #13 +
   '   PLA.NOME AS PLANO, '                                                            + #13 +
   '   PAT.NOME AS PATRO, '                                                            + #13 +
   '   TCE.TCEDESCRICAO, '                                                             + #13 +
   '   CON.IDCONTRATOEMPTMO, '                                                         + #13 +
   '   NVL(DEP.MATRICULA, ELP.MATRICULA) AS MATRICULA, '                               + #13 +
   '   MUT.NOME, '                                                                     + #13 +
   '   CON.VLRCONTRATO, '                                                              + #13 +
   '   HME.HMEVLRPREVISTO AS VLRPREVISTO, '                                            + #13 +
   '   HME.HMEVLRPREVISTO AS VLRCREDITO, '                                             + #13 +
   '   CON.VLRPARCELA, '                                                               + #13 +
   '   CON.DATACREDITO, '                                                              + #13 +
   '   CON.DATAASSINATURA, '                                                           + #13;

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
   begin
      sSQL := sSQL +
   '   ( '                                                                             + #13 +
   '   SELECT  '                                                                       + #13 +
   '       HMEVLRPREVISTO '                                                            + #13 +
   '   FROM '                                                                          + #13 +
   '       HISTMOVEMPTMO '                                                             + #13 +
   '   WHERE '                                                                         + #13 +
   '           IDITEMEMPTMO     = ' + dtmEmptmo.qryParamEmptmoIDITEMSEGCONC.AsString   + #13 +
   '       AND IDCONTRATOEMPTMO = CON.IDCONTRATOEMPTMO '                               + #13 +
   '       AND HMEDATAPREVISTA  = HME.HMEDATAPREVISTA '                                + #13 +
   '   ) AS SEGURO, '                                                                  + #13;
   end
   else
   begin
      sSQL := sSQL +
   '   0 AS SEGURO, '                                                                  + #13;
   end;

   sSQL := sSQL +
   '   DECODE(CON.FLGSITUACAO, '                                                       + #13 +
   '            ''A'', ''Ativo'', '                                                    + #13 +
   '            ''C'', ''Cancelado'', '                                                + #13 +
   '            ''J'', ''Cobrança Jurídica'', '                                        + #13 +
   '            ''E'', ''Encerrado'', '                                                + #13 +
   '            ''Q'', ''Quitado'', '                                                  + #13 +
   '            ''R'', ''Refinanciado'', '                                             + #13 +
   '            ''S'', ''Suspenso'', '                                                 + #13 +
   '            ''K'', ''Pendente de Quitação'') AS STATUSCONTR  '                     + #13 +

   'FROM '                                                                             + #13 +
   '   PESSOA              PAT, '                                                      + #13 +
   '   PESSOA              MUT, '                                                      + #13 +
   '   ELEGPATRO           ELP, '                                                      + #13 +
   '   DEPENTIT            DEP, '                                                      + #13 +
   '   TIPOCONTREMPTMO     TCE, '                                                      + #13 +
   '   TIPOEMPTMO          TEP, '                                                                    + #13;

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then sSQL := sSQL +
   '   PLANPREVXCONTABIL   PXC, '                                                      + #13 +
   '   PLANPREVCONTABIL    PLA, '                                                      + #13
   else sSQL := sSQL +
   '   PLANPREV            PLA, '                                                      + #13;

   sSQL := sSQL +
   '   CONTRATOEMPTMO      CON, '                                                      + #13;

   // exibição dos contratos renovados:
   if rdgRenovacao.ItemIndex = 0 then
   begin
      sSql := sSql +
   '  HISTMOVEMPTMO  HME '                                                             + #13;
   end
   else
   begin
      sSql := sSql +
   '  HISTMOVEMPTMO  HME, '                                                            + #13 +

   '  ( '                                                                              + #13 +
   '  SELECT DISTINCT '                                                                + #13 +
   '     IDCONTRQUITACAO '                                                             + #13 +
   '  FROM '                                                                           + #13 +
   '     CONTRATOEMPTMO '                                                              + #13 +
   '  ) '                                                                              + #13 +
   '  QUI '                                                                            + #13;
   end;

   sSql := sSql +
   'WHERE '                                                                            + #13 +
   '      ( TEP.IDEMPRESAPROP    = ' + IntToStr(Sistema.IdEmpresa) + ' ) '             + #13 +
   '  AND ( HME.HMETIPOMOV       = 0 ) '                                               + #13 +
   '  AND ( HME.HMECENTRALIZA    = 1 ) '                                               + #13 +
   '  AND CON.IDPATRO            IN (' + molListaPatro.PegaPatro + ') '                + #13;

   // filtro por Plano
   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then sSQL := sSQL +
   '  AND PXC.IDPLANOPREV        IN (' + molListaPlano.PegaPlano + ') '                + #13
   else sSQL := sSQL +
   '  AND CON.IDPLANOPREV        IN (' + molListaPlano.PegaPlano + ') '                + #13;

   sSQL := sSQL +
   '  AND ( CON.FLGSITUACAO      <> ''C'' )'                                           + #13 +

   //Pendência 24100 - 10/01/2007 - Alberto
   '  AND ( HME.FLGESTORNADO     IS NULL  )'                                           + #13;

   if molContratoEmptmo.IDContrato > 0 then sSql := sSql +
   '  AND ( CON.IDCONTRATOEMPTMO = ' + FormatFloat('#0', molContratoEmptmo.IDContrato) + ' ) '          + #13;

   if rdgData.ItemIndex = 0 then
   begin
      sSql := sSQL +
   '  AND ( CON.DATACREDITO      >= TO_DATE(' + QuotedStr(edtDataIni.Text) + ',''dd/mm/yyyy'') )' + #13 +
   '  AND ( CON.DATACREDITO      <= TO_DATE(' + QuotedStr(edtDataFim.Text) + ',''dd/mm/yyyy'') )' + #13;
   end
   else
   begin
      sSql := sSQL +
   '  AND ( CON.DATAASSINATURA   >= TO_DATE(' + QuotedStr(edtDataIni.Text) + ',''dd/mm/yyyy'') )' + #13 +
   '  AND ( CON.DATAASSINATURA   <= TO_DATE(' + QuotedStr(edtDataFim.Text) + ',''dd/mm/yyyy'') )' + #13;
   end;

   if DBcboTipoEmptmo.LookupValue <> '' then sSql := sSql +
   '  AND ( TEP.IDTIPOEMPTMO      = ' + DBcboTipoEmptmo.LookupValue + ' ) '      + #13;

   if DBcboTipoContrato.LookupValue <> '' then sSql := sSql +
   '  AND ( CON.IDTIPOCONTREMPTMO = ' + DBcboTipoContrato.LookupValue + ' ) '    + #13;

   if chkNaoEfetivados.Checked then sSql := sSql +
   '  AND ( HME.FLGBAIXADO        IS NOT NULL ) '                                + #13;

   if chkEfetivado.Checked then sSql := sSql +
   '  AND ( HME.FLGBAIXADO        IS NULL ) '                                    + #13;

   // exibição dos contratos renovados:
   case rdgRenovacao.ItemIndex of

      1: // Exibir
      begin
         sSql := sSql +
   '  AND QUI.IDCONTRQUITACAO     IS NULL '                                      + #13 +
   '  AND CON.IDCONTRATOEMPTMO    = QUI.IDCONTRQUITACAO(+) '                     + #13;
      end;

      2: // Exibir EXCLUSIVAMENTE
      begin
         sSql := sSql +
   '  AND QUI.IDCONTRQUITACAO     IS NOT NULL '                                  + #13 +
   '  AND CON.IDCONTRATOEMPTMO    = QUI.IDCONTRQUITACAO '                        + #13;
      end;

   end;

   sSql := sSql +
   '  AND ( HME.IDCONTRATOEMPTMO = CON.IDCONTRATOEMPTMO ) '                      + #13 +

   '  AND CON.IDPATRO            = ELP.IDPESSJUR '                               + #13 +
   '  AND CON.IDPESSOA           = ELP.IDPESSOA '                                + #13 +

   '  AND CON.IDPESSOA           = DEP.IDTITULAR '                               + #13 +
   '  AND CON.IDBENEF            = DEP.IDPESSOA '                                + #13 +

   '  AND CON.IDBENEF            = MUT.IDPESSOA '                                + #13 +

   '  AND CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO '                       + #13 +
   '  AND TCE.IDTIPOEMPTMO       = TEP.IDTIPOEMPTMO '                            + #13 +

   '  AND CON.IDPATRO            = PAT.IDPESSOA '                                + #13;

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then sSQL := sSQL +
   '  AND CON.IDPLANOORIGEM      = PXC.IDPLANPREVC '                             + #13 +
   '  AND PXC.IDPLANOPREV        = PLA.IDPLANOPREV '                             + #13
   else sSQL := sSQL +
   '  AND CON.IDPLANOPREV        = PLA.IDPLANOPREV '                             + #13;

   case rdgOrdenar.ItemIndex of
      0 : sOrdenacao := '   PLA.NOME, PAT.NOME, TCE.TCEDESCRICAO, MATRICULA';
      1 : sOrdenacao := '   PLA.NOME, PAT.NOME, TCE.TCEDESCRICAO, CON.IDCONTRATOEMPTMO';
      2 : sOrdenacao := '   PLA.NOME, PAT.NOME, TCE.TCEDESCRICAO, MUT.NOME';
   end;

   sSql := sSql + 'ORDER BY ' + #13 + sOrdenacao;

   with dtmRelContrConc.qryContrConc do
   begin
      Close;
      SQL.Text := sSQL;
    //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
    //SQL.SaveToFile(Sistema.TempDir + 'EP-RelContrConc.txt');
      SQL.SaveToFile(ftempregra + '\' + 'EP-RelContrConc.txt');
      Open;
   end;
end;



procedure TcfgRelContrConc.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TcfgRelContrConc.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TcfgRelContrConc.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TcfgRelContrConc.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



procedure TcfgRelContrConc.chkNaoEfetivadosClick(Sender: TObject);
begin
   inherited;
   if chkNaoEfetivados.Checked then chkEfetivado.Checked := False;
end;



procedure TcfgRelContrConc.chkEfetivadoClick(Sender: TObject);
begin
   inherited;
   if chkEfetivado.Checked then chkNaoEfetivados.Checked := False;
end;



end.
