{---------------------------Alteração-------------------------------------------
Pendência   : SOL 114575 Kintana 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
-------------------------------------------------------------------------------}
unit CRelContratoSemParcela;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
  TB97, ExtCtrls, mContratoEmptmo, Mask, wwdbedit, Wwdbspin, CheckLst,
  wwdblook, db, fcCombo, fcColorCombo, DBTables, Wwquery,

  uTypesEmptmo, mListaPlano, mListaPatro;

type
   TcfgRelContratoSemParcela = class(TcfgRel)
      molContratoEmptmo: TmolContratoEmptmo;
      DBcboTipoContrato: TwwDBLookupCombo;
      Label2: TLabel;
      Panel1: TPanel;
      Label15: TLabel;
      DBspnAno: TwwDBSpinEdit;
      cboMes: TComboBox;
      Label1: TLabel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      GroupBox2: TGroupBox;
      chkCorLinha: TCheckBox;
      cboCorLinha: TfcColorCombo;
      chkLinhas: TCheckBox;
      qryTipoContrato: TwwQuery;
      qryTipoContratoIDTIPOCONTREMPTMO: TFloatField;
      qryTipoContratoTCEDESCRICAO: TStringField;
      molListaPatro: TmolListaPatro;
      molListaPlano: TmolListaPlano;
      rdgOrdenacao: TRadioGroup;
      GroupBox1: TGroupBox;
      chkEncerrado: TCheckBox;
      chkEmQuitacao: TCheckBox;

      procedure FormShow(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
      procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
      procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
      procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);


   private { Private declarations }

      procedure AbreQueries;

      procedure MontaQuery; override;
      procedure FiltraRelatorio;


  public { Public declarations }


  end;



var
  cfgRelContratoSemParcela: TcfgRelContratoSemParcela;



implementation
{$R *.DFM}
uses
   DLookEmptmo,
   UDiasUteis,
   USistema,
   UfuncoesEmptmo, dRelContratoSemParcela,
   FProgresso,     (* FrmProgresso *)
   uMensErro;




procedure TcfgRelContratoSemParcela.AbreQueries;
begin
   with dtmLookEmptmo.qryLookTipoEmptmo do begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoEmptmo);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
   end;

   // Tipo de Contrato
   LimpaParametros(dtmLookEmptmo.qryLookPlanPrev);
   dtmLookEmptmo.qryLookPlanPrev.Open;
end;



procedure TcfgRelContratoSemParcela.MontaQuery;
begin
   inherited;

   with dtmRelContratoSemParcela do
   begin
      sMesCompetencia := cboMes.Text + ' / ' + DBspnAno.Text;
      bCorLinha       := chkCorLinha.Checked;
      CorLinha        := cboCorLinha.SelectedColor;

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

   end;

   FiltraRelatorio;
end;



procedure TcfgRelContratoSemParcela.FiltraRelatorio;
var
   sSQL        : String;
   sUltDiaMes  : String;
   iAno, iMes  : Word;
begin
   iAno        := Word(Trunc(DBspnAno.Value));
   iMes        := (cboMes.ItemIndex + 1);

   sUltDiaMes  := QuotedStr(FormatDateTime('dd/mm/yyyy', DiasUteis.UltDiaMes(iAno, iMes)));

   sSQL :=
   'SELECT '                                                                        + #13 +
   '   CON.IDCONTRATOEMPTMO, '                                                      + #13 +
   '   NVL(DEP.MATRICULA, ELP.MATRICULA) AS MATRICULA, MUT.NOME, '                  + #13 +

   '   CON.DATACREDITO, CON.DATAPRIMPARC, '                                         + #13 +

   '   ( '                                                                          + #13 +
   '   SELECT '                                                                     + #13 +
   '      MAX(HME.HMEDATAPREVISTA) AS HMEDATAPREVISTA '                             + #13 +
   '   FROM '                                                                       + #13 +
   '      HISTMOVEMPTMO HME '                                                       + #13 +
   '   WHERE '                                                                      + #13 +
   '          HME.HMETIPOMOV           = 1 '                                        + #13 +
   '      AND NVL(HME.FLGESTORNADO, 0) = 0 '                                        + #13 +
   '      AND HME.IDCONTRATOEMPTMO     = CON.IDCONTRATOEMPTMO '                     + #13 +
   '   GROUP BY '                                                                   + #13 +
   '      HME.IDCONTRATOEMPTMO '                                                    + #13 +
   '   ) AS DATA_PARCELA_ANT, '                                                     + #13 +

   '   TCE.TCEDESCRICAO, '                                                          + #13 +
   '   SIT.DESCRICAO AS SIT_PART, '                                                 + #13 +
   '   CON.IDTIPOSUSPEMPTMO, CON.DATAINICIOSUSP, CON.DATAFIMSUSP, '                 + #13 +
   '   TSE.TSEDESCRICAO, '                                                          + #13 +

   '   DECODE(CON.IDPESSOA, CON.IDBENEF, DECODE(SIT.FLGINTERNO, '                   + #13 +
   '                                            ''AS'', ''Assistido'', '            + #13 +
   '                                            ''AT'', ''Ativo'', '                + #13 +
   '                                            ''CA'', ''Cancelado'', '            + #13 +
   '                                            ''MA'', ''Mantido'', '              + #13 +
   '                                            ''MP'', ''Mantido Parcial'', '      + #13 +
   '                                            ''MS'', ''Manutenção de Saldo'', '  + #13 +
   '                                            ''PN'', ''Outros'' '                + #13 +
   '                                           ), '                                 + #13 +
   '                                     ''Pensionista'' '                          + #13 +
   '         ) AS FLG_INTERNO, '                                                    + #13 +

   '   DECODE(CON.FLGSITUACAO, ''A'', ''Ativo'', '                                  + #13 +
   '                           ''C'', ''Cancelado'', '                              + #13 +
   '                           ''E'', ''Encerrado'', '                              + #13 +
   '                           ''Q'', ''Quitado'', '                                + #13 +
   '                           ''R'', ''Refinanciado'', '                           + #13 +
   '                           ''S'', ''Suspenso'', '                               + #13 +
   '                           ''P'', ''Pendente de Liberação'', '                  + #13 +
   '                           ''K'', ''Pendente de Quitação'' '                    + #13 +
   '         ) AS FLGSITUACAO '                                                     + #13 +

   'FROM '                                                                          + #13 +
   '   PESSOA          MUT, '                                                       + #13 +
   '   CONTRATOEMPTMO  CON, '                                                       + #13 +
   '   PARTPREVPLAN    PPP, '                                                       + #13 +
   '   ELEGPATRO       ELP, '                                                       + #13 +
   '   DEPENTIT        DEP, '                                                       + #13 +
   '   TIPOCONTREMPTMO TCE, '                                                       + #13 +
   '   TIPOEMPTMO      TEP, '                                                       + #13 +
   '   TIPOSUSPEMPTMO  TSE, '                                                       + #13 +
   '   SITPART         SIT  '                                                       + #13 +

   'WHERE '                                                                         + #13 +
   '       TEP.IDEMPRESAPROP      = ' + IntToStr(Sistema.IDEmpresa)                 + #13 +
   '   AND CON.DATAPRIMPARC      <= TO_DATE(' + sUltDiaMes + ',''DD/MM/YYYY'') '    + #13 +
   '   AND CON.IDPATRO            IN (' + molListaPatro.PegaPatro + ') '            + #13 +
   '   AND CON.IDPLANOPREV        IN (' + molListaPlano.PegaPlano + ') '            + #13 +
   '   AND CON.FLGSITUACAO        IN (''A'', ''E'', ''J'', ''K'') '                 + #13;

   if molContratoEmptmo.IDContrato <> -1 then sSQL := sSQL +
   '   AND CON.IDCONTRATOEMPTMO   = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)  + #13;

   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +

   //Pendência 25481 - 18/07/2007 - Alberto
   '   AND TCE.IDTIPOEMPTMO       = ' + DBcboTipoEmptmo.LookupValue                 + #13;

   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '   AND CON.IDTIPOCONTREMPTMO  = ' + DBcboTipoContrato.LookupValue               + #13;

   if chkEncerrado.Checked then sSQL := sSQL +
   '   AND CON.FLGSITUACAO         <>  ''E'' '                                      + #13;

   if chkEmQuitacao.Checked then sSQL := sSQL +
   '   AND CON.FLGSITUACAO         <>  ''K'' '                                      + #13;

   sSql := sSql +
   '  AND  NOT EXISTS '                                                             + #13 +
   '      ( '                                                                       + #13 +
   '      SELECT '                                                                  + #13 +
   '        H.* '                                                                   + #13 +
   '      FROM '                                                                    + #13 +
   '        HISTMOVEMPTMO H '                                                       + #13 +
   '      WHERE '                                                                   + #13 +
   '            HMETIPOMOV         = 1 '                                            + #13 +
   '        AND HMEANOCOMPETENCIA  = ' + IntToStr(iAno)                             + #13 +
   '        AND HMEMESCOMPETENCIA  = ' + IntToStr(iMes)                             + #13 +
   '        AND (FLGESTORNADO      = 0 OR FLGESTORNADO IS NULL ) '                  + #13 +
   '        AND H.IDCONTRATOEMPTMO = CON.IDCONTRATOEMPTMO '                         + #13 +
   '      ) '                                                                       + #13 +

   '   AND CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO '                         + #13 +
   '   AND TCE.IDTIPOEMPTMO       = TEP.IDTIPOEMPTMO '                              + #13 +

   '   AND CON.IDPESSOA           = ELP.IDPESSOA '                                  + #13 +
   '   AND CON.IDPATRO            = ELP.IDPESSJUR '                                 + #13 +

   '   AND CON.IDPESSOA           = DEP.IDTITULAR '                                 + #13 +
   '   AND CON.IDBENEF            = DEP.IDPESSOA '                                  + #13 +

   '   AND CON.IDBENEF            = MUT.IDPESSOA '                                  + #13 +

   '   AND CON.IDPESSOA           = PPP.IDPESSOA '                                  + #13 +
   '   AND CON.IDPATRO            = PPP.IDPESSJUR '                                 + #13 +

   '   AND PPP.FLGDESATIVADO      = 0 '                                             + #13 +

   '   AND PPP.IDSITPART          = SIT.IDSITPART '                                 + #13 +

   '   AND CON.IDTIPOSUSPEMPTMO   = TSE.IDTIPOSUSPEMPTMO(+) '                       + #13 +

   'ORDER BY '                                                                      + #13;

   case rdgOrdenacao.ItemIndex of
      0: sSQL := sSQL + '   TCE.TCEDESCRICAO, NVL(DEP.MATRICULA, ELP.MATRICULA), CON.IDCONTRATOEMPTMO ';
      1: sSQL := sSQL + '   TCE.TCEDESCRICAO, CON.IDCONTRATOEMPTMO ';
      2: sSQL := sSQL + '   TCE.TCEDESCRICAO, MUT.NOME, CON.IDCONTRATOEMPTMO ';
   end;

   with dtmRelContratoSemParcela.qryContratoSemParcela do
   begin
      LimpaParametros(dtmRelContratoSemParcela.qryContratoSemParcela);
      SQL.Clear;
      SQL.Text := sSQL;
    //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
    //SQL.SaveToFile(Sistema.TempDir + 'EP-RelContratoSemParcela.txt');
      SQL.SaveToFile(ftempregra + '\' + 'EP-RelContratoSemParcela.txt');
      Open;
  end;
end;



procedure TcfgRelContratoSemParcela.FormShow(Sender: TObject);
begin
   inherited;

   molContratoEmptmo.btnLimpaContrato.Click;

   // preenche a data de lançamento e o ano de referência/competência
   cboMes.ItemIndex        := DiasUteis.ExtraiMes(Date) - 1;
   DBspnAno.Value          := DiasUteis.ExtraiAno(Date);

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



procedure TcfgRelContratoSemParcela.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
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




procedure TcfgRelContratoSemParcela.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TcfgRelContratoSemParcela.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TcfgRelContratoSemParcela.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TcfgRelContratoSemParcela.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



end.
