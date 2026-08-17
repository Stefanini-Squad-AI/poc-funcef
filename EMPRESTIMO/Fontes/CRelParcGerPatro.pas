unit CRelParcGerPatro;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
   TB97, ExtCtrls, mContratoEmptmo, CheckLst, fcCombo, fcColorCombo, Mask, wwdbedit,
   Wwdbspin, wwdblook, Db, DBTables, mListaPlano, mListaPatro, Wwquery;

type
   TcfgRelParcGerPatro = class(TcfgRel)
      molContratoEmptmo: TmolContratoEmptmo;
      Label1: TLabel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      DBcboTipoContrato: TwwDBLookupCombo;
      Label2: TLabel;
      Panel1: TPanel;
      Label15: TLabel;
      DBspnAno: TwwDBSpinEdit;
      cboMes: TComboBox;
      GroupBox1: TGroupBox;
      chkCorLinha: TCheckBox;
      cboCorLinha: TfcColorCombo;
      chkLinhas: TCheckBox;
      molListaPatro: TmolListaPatro;
      molListaPlano: TmolListaPlano;
      qryLookItemEmprestimo: TwwQuery;
      rdgCentraliza: TRadioGroup;
      DBcboItem: TwwDBLookupCombo;
      btnLimpaContrato: TBitBtn;
      Label3: TLabel;
      qryLookItemEmprestimoIDITEMEMPTMO: TFloatField;
      qryLookItemEmprestimoITEDESCRICAO: TStringField;
      qryLookItemEmprestimoFLGCENTRALIZA: TFloatField;
      qryLookItemEmprestimoDESCRICAO: TStringField;

      procedure FormShow(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
      procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
      procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
      procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
      procedure btnLimpaContratoClick(Sender: TObject);
      procedure DBcboItemCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure DBcboTipoEmptmoExit(Sender: TObject);


   private // Private declarations

      procedure AbreQueries;

      procedure MontaQuery; override;
      procedure FiltraRelatorio;


   public // Public declarations

   end;



var
  cfgRelParcGerPatro: TcfgRelParcGerPatro;



implementation
{$R *.DFM}
uses
   DLookEmptmo, UFuncoesEmptmo, UDiasUteis, USistema, dRelParcGerPatro;



procedure TcfgRelParcGerPatro.AbreQueries;
begin
   // Tipo de Empréstimo
   with dtmLookEmptmo.qryLookTipoEmptmo do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoEmptmo);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
   end;

   // Itens de Parcela
   qryLookItemEmprestimo.Open;
end;



procedure TcfgRelParcGerPatro.MontaQuery;
begin
   inherited;

   with dtmRelParcGerPatro do
   begin
      // cabeçalho: item
      lblItemEmptmo.Caption := '';
      if DBcboItem.LookupValue <> '' then
      begin
         lblItemEmptmo.Caption := DBcboItem.Text;
      end
      else
      begin
         case rdgCentraliza.ItemIndex of
            0: lblItemEmptmo.Caption   := '< Centralizador >';
            1: lblItemEmptmo.Caption   := '< Não Centralizador >';
         end;
      end;

      // cabeçalho: mês de competência
      lblMesCompetencia.Caption  := cboMes.Text + '/' + FormatFloat('0000', DBspnAno.Value);

      bSeparador                 := chkLinhas.Checked;

      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      bCorlinha                  := chkCorLinha.Checked;
      CorLinha                   := cboCorLinha.SelectedColor;

      // Início Pendência 21063 - Marcos Ventura Topini
      // -------------------------------------------------------------------------------------------

        lblTipoEmptmo.Caption := ' < todos > ';
        if DBcboTipoEmptmo.LookupValue <> ''   then lblTipoEmptmo.Caption := DBcboTipoEmptmo.Text;

        lblTipoContr.Caption  := ' < todos > ';
        if DBcboTipoContrato.LookupValue <> ''    then lblTipoContr.Caption  := DBcboTipoContrato.Text;

        memPatro.RichText := molListaPatro.ListaPatro;
        memPlano.RichText := molListaPlano.ListaPlano;

      // -------------------------------------------------------------------------------------------
      // Fim Pendência 21063

   end;

   FiltraRelatorio;
end;



procedure TcfgRelParcGerPatro.FiltraRelatorio;
var
   sSQL              : String;
   sMesCompetencia   : String;
   sAnoCompetencia   : String;
begin
   sMesCompetencia   := IntToStr(cboMes.ItemIndex + 1);
   sAnoCompetencia   := FormatFloat('0000', DBspnAno.Value);

   sSQL :=
   'SELECT '                                                                           + #13 +
   '  PTR.NOME AS NOME_PATRO, '                                                        + #13 +
   '  HME.IDCONTRATOEMPTMO, CON.NOME, '                                                + #13 +
   '  HME.ITEDESCRICAO AS ITEM, '                                                      + #13 +
   '  (HME.PARCELA || ''/'' || HME.PARCELAS_RESTANTES) AS PARCELA, '                   + #13 +
   '  HME.HMEVLRPREVISTO, '                                                            + #13 +
   '  HME.FORMA_COBRANCA                                    AS COBRANCA, '             + #13 +
   '  (DECODE(HME.FLGENVIO, NULL, ''Sim'', ''''))           AS ENVIADO, '              + #13 +
   '  (DECODE(HME.FLGBAIXADO, NULL, ''Sim'', ''''))         AS RECEBIDO, '             + #13 +
   '  HME.HMETXJUROS                                        AS TXJUROS, '              + #13 +
   '  HME.HMESALDODEV                                       AS SALDODEV, '             + #13 +
   '  (DECODE(HME.HMECENTRALIZA, 0, '''', HME.PLNCODIGO))   AS PLANILHA, '             + #13 +
   '  HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA '                                   + #13 +

   'FROM '                                                                             + #13 +
   '  PESSOA       PTR, '                                                              + #13 +
   '  VW_MOVEP     HME, '                                                              + #13 +
   '  VWCONTRATOEP CON'                                                                + #13 +

   'WHERE '                                                                            + #13 +
   // filtro por Empresa Proprietátia
   '       CON.IDEMPRESAPROP        = ' + IntToStr(Sistema.IDEmpresa)                  + #13;

   // filtro por Contrato
   if molContratoEmptmo.IDContrato > 0 then sSql := sSql +
   '   AND CON.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato) + #13;

   // filtro por Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '   AND CON.IDTIPOEMPTMO         = ' + DBcboTipoEmptmo.LookupValue                  + #13;

   // filtro por Tipo de Contrato
   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '   AND CON.IDTIPOCONTREMPTMO    = ' + DBcboTipoContrato.LookupValue                + #13;

   sSql := sSql +
   '   AND CON.FLGSITUACAO          <> ''C'' '                                         + #13 +

   // filtro por Patrocinadora
   '   AND CON.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '             + #13 +

   // filtro por Plano
   '   AND CON.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '             + #13 +

   '   AND HME.EVENTO               = 1 '                                              + #13 +
   '   AND HME.HMESEQCOBRANCA       = 1 '                                              + #13 +
   '   AND HME.HMEMESCOMPETENCIA    = ' + sMesCompetencia                              + #13 +
   '   AND HME.HMEANOCOMPETENCIA    = ' + sAnoCompetencia                              + #13 +
   '   AND (HME.FLGESTORNADO        = 0 OR HME.FLGESTORNADO IS NULL) '                 + #13;

   if DBcboItem.LookupValue <> '' then
   begin
      sSql := sSql + '   AND HME.IDITEMEMPTMO         = ' + DBcboItem.LookupValue      + #13;
   end
   else
   begin
      // filtro por Centralizador / Não centralizador
      case rdgCentraliza.ItemIndex of
         0: sSql := sSql + '   AND HME.HMECENTRALIZA        = 1 '                      + #13;
         1: sSql := sSql + '   AND HME.HMECENTRALIZA        = 0 '                      + #13;
      end;
   end;

   sSql := sSql +
   '   AND CON.IDPATRO              = PTR.IDPESSOA '                                   + #13 +
   '   AND HME.IDCONTRATOEMPTMO     = CON.IDCONTRATOEMPTMO '                           + #13 +

   'ORDER BY '                                                                         + #13 +
   '   PTR.NOME, CON.NOME, HME.IDITEMEMPTMO ';

   with dtmRelParcGerPatro.qryParcGerPatro do
   begin
      Close;
      SQL.Text := sSQL;
      Open;
   end;
end;



procedure TcfgRelParcGerPatro.FormShow(Sender: TObject);
begin
   inherited;

   // limpa a seleção de Contrato
   molContratoEmptmo.btnLimpaContrato.Click;

   // preenche a data de lançamento e o ano de referência/competência
   cboMes.ItemIndex := DiasUteis.ExtraiMes(Date) - 1;
   DBspnAno.Value   := DiasUteis.ExtraiAno(Date);

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



procedure TcfgRelParcGerPatro.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
   with dtmLookEmptmo.qryLookTipoContr do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContr);

      if DBcboTipoEmptmo.LookupValue <> '' then
      begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IdEmpresa;
      end;
      Open;

      DBcboTipoContrato.Enabled := True;
   end;
end;



procedure TcfgRelParcGerPatro.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TcfgRelParcGerPatro.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TcfgRelParcGerPatro.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TcfgRelParcGerPatro.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



procedure TcfgRelParcGerPatro.btnLimpaContratoClick(Sender: TObject);
begin
   inherited;
   DBcboItem.LookupValue := '';
   DBcboItem.Clear;

   rdgCentraliza.Enabled   := True;
end;



procedure TcfgRelParcGerPatro.DBcboItemCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   if DBcboItem.LookupValue <> '' then
   begin
      if qryLookItemEmprestimoFLGCENTRALIZA.AsInteger = 1 then
      begin
         rdgCentraliza.ItemIndex := 0;
      end
      else
      begin
         rdgCentraliza.ItemIndex := 1;
      end;
      rdgCentraliza.Enabled   := False;
   end
   else
   begin
      rdgCentraliza.Enabled   := True;
   end;
end;



procedure TcfgRelParcGerPatro.DBcboTipoEmptmoExit(Sender: TObject);
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
