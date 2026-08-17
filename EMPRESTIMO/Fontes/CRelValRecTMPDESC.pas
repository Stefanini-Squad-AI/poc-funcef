unit CRelValRecTMPDESC;

// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina    :
Data      :
Autor     :
Pendência :
Descrição :
----------------------------------------------------------------------------------------------------
Rotina    : MontaQuery
Data      : 12/09/2003
Autor     : André Pontes
Pendência : -
Descrição : 1) chkNaoProcessados: não exibe itens com sitenvio = 9
            2) corrigida ordenação por matrícula
----------------------------------------------------------------------------------------------------
Rotina    : MontaQuery
Data      : 24/10/2002
Autor     : André Pontes
Descrição : chkSintetico
----------------------------------------------------------------------------------------------------
Rotina    : FiltraRelatorio
Data      : 30/09/2002
Autor     : André Pontes
Descrição : sMes recebe yyyy/mm. Estava recebento mm/yyyy
----------------------------------------------------------------------------------------------------
Rotina    : FiltraRelatorio
Data      : 01/10/2002
Autor     : André Pontes
Descrição : Novos campos na query: SITDESCRICAO (decode da sitpart), SIT_TITULAR (sitpart), RESIDUO
            (VALOR - VALORRECEBIDO)
---------------------------------------------------------------------------------------------------}

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
   TB97, ExtCtrls, mListaPlano, mListaPatro, fcCombo, fcColorCombo,
   mMutuario, Mask, wwdbedit, Wwdbspin, wwdblook, Db, DBTables, Wwquery;

type
   TcfgRelValRecTMPDESC = class(TcfgRel)
      Label2: TLabel;
      Label1: TLabel;
      DBcboTipoContrato: TwwDBLookupCombo;
      Panel1: TPanel;
      Label15: TLabel;
      DBspnAno: TwwDBSpinEdit;
      cboMes: TComboBox;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      molMutuario: TmolMutuario;
      GroupBox1: TGroupBox;
      chkFolhaPatro: TCheckBox;
      chkFolhaBenef: TCheckBox;
      GroupBox2: TGroupBox;
      chkCorLinha: TCheckBox;
      cboCorLinha: TfcColorCombo;
      chkLinhas: TCheckBox;
      rdgOrdenar: TRadioGroup;
      molListaPatro: TmolListaPatro;
      molListaPlano: TmolListaPlano;
      Label4: TLabel;
      DBcboSitPart: TwwDBLookupCombo;
      rdgAnalSint: TRadioGroup;
      GroupBox3: TGroupBox;
      chkValorDiverg: TCheckBox;
      chkValorZero: TCheckBox;
      chkValorNAOZero: TCheckBox;
      chkNaoProcessado: TCheckBox;

      procedure FormShow(Sender: TObject);
      procedure molMutuariobtnBuscaPartClick(Sender: TObject);
      procedure molMutuariobtnLimpaPartClick(Sender: TObject);
      procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
      procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
      procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
      procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure DBcboTipoEmptmoExit(Sender: TObject);


   private { Private declarations }

      procedure AbreQueries;

      procedure MontaQuery; override;
      procedure FiltraRelatorio;


   public { Public declarations }

   end;



var
  cfgRelValRecTMPDESC: TcfgRelValRecTMPDESC;



implementation
{$R *.DFM}
uses
   DLookEmptmo,
   UDiasUteis,
   USistema,
   uFuncoesEmptmo,
   dEmptmo,
   uMensErro,
   dRelValRecTMPDESC;




procedure TcfgRelValRecTMPDESC.AbreQueries;
begin
   with dtmLookEmptmo.qryLookTipoEmptmo do begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoEmptmo);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
   end;

   LimpaParametros(dtmLookEmptmo.qryLookPlanPrev);
   dtmLookEmptmo.qryLookPlanPrev.Open;

   LimpaParametros(dtmLookEmptmo.qryLookSitPart);
   dtmLookEmptmo.qryLookSitPart.Open;
end;



procedure TcfgRelValRecTMPDESC.MontaQuery;
begin
   inherited;

   with dtmRelValRecTMPDESC do begin

      // preenche a label do mês de cobrança
      rptValRecTMPDESC_lblMesCobranca.Caption   := FormatFloat('00', cboMes.ItemIndex + 1) + '/' +
                                                   FormatFloat('0000', DBspnAno.Value);

      bSeparador  := chkLinhas.Checked;

      bSintetico  := rdgAnalSint.ItemIndex = 1;

      // Início Pendência 21063 - Marcos Ventura Topini
      // -------------------------------------------------------------------------------------------

        lblTipoEmptmo.Caption := ' < todos > ';
        if DBcboTipoEmptmo.LookupValue <> ''   then lblTipoEmptmo.Caption := DBcboTipoEmptmo.Text;

        lblTipoContr.Caption  := ' < todos > ';
        if DBcboTipoContrato.LookupValue <> '' then lblTipoContr.Caption  := DBcboTipoContrato.Text;

        memPatro.RichText := molListaPatro.ListaPatro;
        memPlano.RichText := molListaPlano.ListaPlano;

      // -------------------------------------------------------------------------------------------
      // Fim Pendência 21063

      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      bCorlinha   := chkCorLinha.Checked;
      CorLinha    := cboCorLinha.SelectedColor;

   end;

   FiltraRelatorio;
end;



procedure TcfgRelValRecTMPDESC.FiltraRelatorio;
var
   sSQL, sMes  : String;
   sTipoFolha  : String;
begin
   sMes  := FormatFloat('0000', DBspnAno.Value) + '/' + FormatFloat('00', cboMes.ItemIndex + 1);

   // Marchetti - Pendencia 26526
   // Ajustada a query para nao precisar mais utilizar a VWCONTRATOEP
   sSQL :=
   'SELECT DISTINCT'                                                                               + #13 +
   '   PES.NOME AS NOME_MUTUARIO, TCE.TCEDESCRICAO, PTR.NOME,'                                     + #13 +
   '   SIT.DESCRICAO AS SIT_TITULAR,'                                                              + #13 +
   '   DECODE(CON.IDBENEF, CON.IDPESSOA, SIT.DESCRICAO, ''PENSIONISTA'') AS SITDESCRICAO,'         + #13 +
   '   TMP.IDMODULO, TMP.SITENVIO, TMP.MATRICULA, TMP.IDDESCONTO, TMP.VALOR, TMP.VALORRECEBIDO,'   + #13 +
   '   TMP.IDPROVENTO, TMP.CODPROVDESC, TMP.MESCOBRANCA, TMP.MESREFERENCIA, TMP.IDPESSOA,'         + #13 +
   '   TMP.IDTITULAR, TMP.RECPAG, TMP.FLGTIPODESC, TMP.DATARECEBIMENTO, TMP.IDPLANOPREV,'          + #13 +
   '   TMP.INSCRICAONUMERO, TMP.FLGDESCONTO, TMP.FLGDESCFOLHA, TMP.DATAREFERENCIA,'                + #13 +
   '   TMP.DESCRICAO, TMP.REFERENCIA, TMP.DATACOBRANCA, TMP.NODOCUMENTO, TMP.PARCELA,'             + #13 +
   '   TMP.NUMPARCELAS, ( TMP.NUMPARCELAS - TMP.PARCELA + 1 ) AS PARC_RESTA,'                      + #13 +
   '   ( NVL(TMP.VALOR, 0) - NVL(TMP.VALORRECEBIDO, 0) ) AS RESIDUO,'                              + #13 +
   '   DECODE(TMP.FLGDESCFOLHA, ''P'', ''PATROCINADORA'', ''B'', ''BENEFÍCIOS'') AS TIPO_FOLHA'    + #13 +

   'FROM'                                                                                          + #13 +
   '   TMPDESC         TMP,'                                                                       + #13 +
   '   CONTRATOEMPTMO  CON,'                                                                       + #13 +
   '   PESSOA          PES,'                                                                       + #13 +
   '   TIPOCONTREMPTMO TCE,'                                                                       + #13 +
   '   PESSOA          PTR,'                                                                       + #13 +
   '   SITPART         SIT,'                                                                       + #13 +
   '   PARTPREVPLAN    PPP'                                                                        + #13 +

   'WHERE'                                                                                         + #13 +
   '       TMP.IDEMPRESAPROP        = ' + IntToStr(Sistema.IDEmpresa)                              + #13 +
   '   AND TMP.IDMODULO             IN (15, 32)'                                                   + #13 +

   // filtro por mês de cobranca
   '   AND TMP.MESCOBRANCA          = ' + QuotedStr(sMes)                                          + #13;

   // filtro por participante
   if molMutuario.IDBenef > 0 then sSql := sSql +
   '   AND TMP.IDPESSOA             = ' + IntToStr(molMutuario.IDBenef)                            + #13;

   // filtro por Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '   AND TCE.IDTIPOEMPTMO         = ' + DBcboTipoEmptmo.LookupValue                              + #13;

   // filtro por Tipo de Contrato
   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '   AND CON.IDTIPOCONTREMPTMO    = ' + DBcboTipoContrato.LookupValue                            + #13;

   // filtro por SitPart
   if DBcboSitPart.LookupValue <> '' then sSQL := sSQL +
   //Pendência 27333 - 30/01/2008
   //'   AND CON.IDSITPART            = ' + DBcboSitPart.LookupValue                                 + #13;
   '   AND PPP.IDSITPART            = ' + DBcboSitPart.LookupValue                                 + #13;
   //Fim Pendência 27333

   // filtro por tipo de folha
   sTipoFolha := '';
   if chkFolhaPatro.Checked then
   begin
      sTipoFolha := '(''P'')';
      if chkFolhaBenef.Checked then sTipoFolha := '(''B'', ''P'')';
   end
   else
   begin
      if chkFolhaBenef.Checked then sTipoFolha := '(''B'')';
   end;

   // filtro por recebimento, divergência, não recebimento
   if chkValorDiverg.Checked     then sSQL := sSQL + '   AND TMP.VALOR <> TMP.VALORRECEBIDO '      + #13;
   if chkValorZero.Checked       then sSQL := sSQL + '   AND NVL(TMP.VALORRECEBIDO, 0) = 0 '       + #13;
   if chkValorNAOZero.Checked    then sSQL := sSQL + '   AND NVL(TMP.VALORRECEBIDO, 0) > 0 '       + #13;

   // André Pontes - 12/09/2003
   if chkNAOProcessado.Checked   then sSQL := sSQL + '   AND TMP.SITENVIO <> ''9'' '               + #13;

   sSQL := sSQL +
   '   AND TMP.FLGDESCFOLHA         IN ' + sTipoFolha                                              + #13 +
   '   AND TMP.IDPESSJUR            IN (' + molListaPatro.PegaPatro + ') '                         + #13 +
   '   AND TMP.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                         + #13 +
   '   AND CON.IDCONTRATOEMPTMO     = TMP.IDDESCONTO'                                              + #13 +
   '   AND PES.IDPESSOA             = CON.IDBENEF'                                                 + #13 +
   '   AND TCE.IDTIPOCONTREMPTMO    = CON.IDTIPOCONTREMPTMO'                                       + #13 +
   '   AND PTR.IDPESSOA             = CON.IDPATRO'                                                 + #13 +
   '   AND PPP.IDSITPART            = SIT.IDSITPART'                                               + #13 +
   '   AND PPP.IDPESSJUR            = CON.IDPATRO'                                                 + #13 +
   '   AND PPP.IDPESSOA             = CON.IDPESSOA'                                                + #13 +
   '   AND PPP.IDPLANOPREV          = CON.IDPLANOPREV'                                             + #13 +
   'ORDER BY '                                                                                     + #13;

   // André Pontes - 12/09/2003
   case rdgOrdenar.ItemIndex of
      0: sSQL := sSQL + '   PTR.NOME, TMP.MATRICULA, PES.NOME, TMP.IDDESCONTO, TMP.MESREFERENCIA ';
      1: sSQL := sSQL + '   PTR.NOME, PES.NOME, TMP.MATRICULA, TMP.IDDESCONTO, TMP.MESREFERENCIA ';
   end;

   with dtmRelValRecTMPDESC.qryValRecTMPDESC do
   begin
      Close;
      SQL.Text := sSQL;
      Open;
   end;
end;



procedure TcfgRelValRecTMPDESC.FormShow(Sender: TObject);
begin
   inherited;

   // limpa a seleção de Contrato
   molMutuario.btnLimpaPartClick(Sender);

   // preenche o mês de cobrança
   cboMes.ItemIndex := DiasUteis.ExtraiMes(SysDate) - 1;
   DBspnAno.Value   := DiasUteis.ExtraiAno(SysDate);

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



procedure TcfgRelValRecTMPDESC.molMutuariobtnBuscaPartClick(Sender: TObject);
begin
   inherited;
   molMutuario.btnBuscaPartClick(Sender);
end;



procedure TcfgRelValRecTMPDESC.molMutuariobtnLimpaPartClick(Sender: TObject);
begin
   inherited;
   molMutuario.btnLimpaPartClick(Sender);
end;



procedure TcfgRelValRecTMPDESC.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TcfgRelValRecTMPDESC.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TcfgRelValRecTMPDESC.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TcfgRelValRecTMPDESC.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



procedure TcfgRelValRecTMPDESC.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
   with dtmLookEmptmo.qryLookTipoContr do begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContr);

      if DBcboTipoEmptmo.LookupValue <> '' then begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
      end;

      Open;

      DBcboTipoContrato.Enabled := True;
   end;
end;



procedure TcfgRelValRecTMPDESC.DBcboTipoEmptmoExit(Sender: TObject);
begin
   inherited;

   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
   with dtmLookEmptmo.qryLookTipoContr do begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContr);

      if DBcboTipoEmptmo.LookupValue <> '' then begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
      end;

      Open;

      DBcboTipoContrato.Enabled := True;
   end;
end;



end.
