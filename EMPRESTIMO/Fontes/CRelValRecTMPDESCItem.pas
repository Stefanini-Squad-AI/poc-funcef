unit CRelValRecTMPDESCItem;

// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina    :
Data      :
Autor     :
Descrição :
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
   TcfgRelValRecTMPDESCItem = class(TcfgRel)
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
  cfgRelValRecTMPDESCItem: TcfgRelValRecTMPDESCItem;



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




procedure TcfgRelValRecTMPDESCItem.AbreQueries;
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



procedure TcfgRelValRecTMPDESCItem.MontaQuery;
begin
   inherited;

   with dtmRelValRecTMPDESC do begin

      // preenche a label do mês de cobrança
      rptValRecTMPDESC_lblMesCobranca.Caption   := FormatFloat('00', cboMes.ItemIndex + 1) + '/' +
                                                   FormatFloat('0000', DBspnAno.Value);

      bSeparador  := chkLinhas.Checked;

      bSintetico  := rdgAnalSint.ItemIndex = 1;

      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      bCorlinha   := chkCorLinha.Checked;
      CorLinha    := cboCorLinha.SelectedColor;

   end;

   FiltraRelatorio;
end;



procedure TcfgRelValRecTMPDESCItem.FiltraRelatorio;
var
   sSQL, sMes  : String;
   sTipoFolha  : String;
begin
   sMes  := FormatFloat('0000', DBspnAno.Value) + '/' + FormatFloat('00', cboMes.ItemIndex + 1);

   sSQL :=
   'SELECT '                                                                                       + #13 +
   '   CON.NOME_MUTUARIO, CON.TCEDESCRICAO, PTR.NOME, '                                            + #13 +
   '   CON.SIT_TITULAR, CON.SITDESCRICAO, '                                                        + #13 +
   '   TMP.IDMODULO, TMP.SITENVIO, TMP.MATRICULA, TMP.IDDESCONTO, '                                + #13 +
   '   TMP.VALOR, TMP.VALORRECEBIDO, TMP.IDPROVENTO, TMP.CODPROVDESC, '                            + #13 +
   '   TMP.MESCOBRANCA, TMP.MESREFERENCIA, TMP.IDPESSOA, TMP.IDTITULAR, '                          + #13 +
   '   TMP.RECPAG, TMP.FLGTIPODESC, TMP.DATARECEBIMENTO, TMP.IDPLANOPREV, '                        + #13 +
   '   TMP.INSCRICAONUMERO, TMP.FLGDESCONTO, TMP.FLGDESCFOLHA, TMP.DATAREFERENCIA, '               + #13 +
   '   TMP.DESCRICAO, TMP.REFERENCIA, TMP.DATACOBRANCA, TMP.NODOCUMENTO, '                         + #13 +
   '   TMP.IDLOTE, TMP.LOTEPREVIA, TMP.PARCELA, TMP.NUMPARCELAS, '                                 + #13 +
   '   ( TMP.NUMPARCELAS - TMP.PARCELA + 1 ) AS PARC_RESTA, '                                      + #13 +
   '   ( NVL(TMP.VALOR, 0) - NVL(TMP.VALORRECEBIDO, 0) ) AS RESIDUO, '                             + #13 +
   '   DECODE(TMP.FLGDESCFOLHA, ''P'', ''Patrocinadora'', ''B'', ''Benefícios'') AS TIPO_FOLHA '   + #13 +
   'FROM '                                                                                         + #13 +
   '   PESSOA       PTR, '                                                                         + #13 +
   '   VWCONTRATOEP CON, '                                                                         + #13 +
   '   TMPDESC      TMP '                                                                          + #13 +
   'WHERE '                                                                                        + #13 +
   '       TMP.IDEMPRESAPROP        = 1 '                                                          + #13 +
   '   AND TMP.IDMODULO             IN (15, 32) '                                                  + #13 +

   // filtro por mês de cobranca
   '   AND TMP.MESCOBRANCA          = ' + QuotedStr(sMes)                                          + #13;

   // filtro por participante
   if molMutuario.IDBenef > 0 then sSQL := sSQL +
   '   AND TMP.IDPESSOA             = ' + IntToStr(molMutuario.IDBenef)                      + #13;

   // filtro por Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '   AND CON.IDTIPOEMPTMO         = ' + DBcboTipoEmptmo.LookupValue                              + #13;

   // filtro por Tipo de Contrato
   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '   AND CON.IDTIPOCONTREMPTMO    = ' + DBcboTipoContrato.LookupValue                            + #13;

   // filtro por SitPart
   if DBcboSitPart.LookupValue <> '' then sSQL := sSQL +
   '   AND CON.IDSITPART            = ' + DBcboSitPart.LookupValue                                 + #13;

   // filtro por tipo de folha
   sTipoFolha := '';
   if chkFolhaPatro.Checked then begin
      sTipoFolha := '(''P'')';
      if chkFolhaBenef.Checked then sTipoFolha := '(''B'', ''P'')';
   end else begin
      if chkFolhaBenef.Checked then sTipoFolha := '(''B'')';
   end;

   // filtro por recebimento, divergência, não recebimento
   if chkValorDiverg.Checked  then sSQL := sSQL + '   AND TMP.VALOR <> TMP.VALORRECEBIDO '         + #13;
   if chkValorZero.Checked    then sSQL := sSQL + '   AND NVL(TMP.VALORRECEBIDO, 0) = 0 '          + #13;
   if chkValorNAOZero.Checked then sSQL := sSQL + '   AND NVL(TMP.VALORRECEBIDO, 0) > 0 '          + #13;

   sSQL := sSQL +
   '   AND TMP.FLGDESCFOLHA         IN ' + sTipoFolha                                              + #13 +
   '   AND TMP.IDPESSJUR            IN (' + molListaPatro.PegaPatro + ') '                         + #13 +
   '   AND TMP.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                         + #13 +
   '   AND TMP.IDDESCONTO           = CON.IDCONTRATOEMPTMO '                                       + #13 +
   '   AND TMP.IDPESSJUR            = PTR.IDPESSOA '                                               + #13 +
   'ORDER BY '                                                                                     + #13 +
   '   PTR.NOME, CON.NOME_MUTUARIO, TMP.IDDESCONTO, TMP.MESREFERENCIA ';


   with dtmRelValRecTMPDESC.qryValRecTMPDESC do begin
      Close;
      SQL.Text := sSQL;
      Open;
   end;
end;



procedure TcfgRelValRecTMPDESCItem.FormShow(Sender: TObject);
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



procedure TcfgRelValRecTMPDESCItem.molMutuariobtnBuscaPartClick(Sender: TObject);
begin
   inherited;
   molMutuario.btnBuscaPartClick(Sender);
end;



procedure TcfgRelValRecTMPDESCItem.molMutuariobtnLimpaPartClick(Sender: TObject);
begin
   inherited;
   molMutuario.btnLimpaPartClick(Sender);
end;



procedure TcfgRelValRecTMPDESCItem.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TcfgRelValRecTMPDESCItem.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TcfgRelValRecTMPDESCItem.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TcfgRelValRecTMPDESCItem.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



procedure TcfgRelValRecTMPDESCItem.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
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



procedure TcfgRelValRecTMPDESCItem.DBcboTipoEmptmoExit(Sender: TObject);
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
