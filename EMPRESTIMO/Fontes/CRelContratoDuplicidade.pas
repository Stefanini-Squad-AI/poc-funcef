{---------------------------Alteração-------------------------------------------
Pendência   : SOL 114575 Kintana 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
-------------------------------------------------------------------------------}
unit CRelContratoDuplicidade;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
   TB97, ExtCtrls, mContratoEmptmo, Mask, wwdbedit, Wwdbspin, CheckLst,
   wwdblook, db, fcCombo, fcColorCombo, wwdbdatetimepicker, CMDateTimePicker,
   mListaPlanoContab, mListaPatro;

type
   TcfgRelContratoDuplicidade = class(TcfgRel)
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
      GroupBox2: TGroupBox;
      chkEncerrado: TCheckBox;
      molListaPatro: TmolListaPatro;
      molListaPlano: TmolListaPlanoContab;
      chkContrEmQuitacaoPendente: TCheckBox;

      procedure FormShow(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
      procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
      procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);


   private  // Private declarations

      procedure AbreQueries;

      procedure MontaQuery; override;
      procedure FiltraRelatorio;


   public   // Public declarations

   end;



var
  cfgRelContratoDuplicidade: TcfgRelContratoDuplicidade;



implementation
{$R *.DFM}
uses
   dEmptmo, dLookEmptmo, uDiasUteis, uSistema, uMensErro, uFuncoesEmptmo, dRelContratoDuplicidade;




procedure TcfgRelContratoDuplicidade.AbreQueries;
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




procedure TcfgRelContratoDuplicidade.FormShow(Sender: TObject);
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

   // Preenche a listbox de patrocinadoras...
   molListaPatro.PreenchePatro;
   // ...e marca todas por default
   molListaPatrobtnMarcaTodosPatroClick(self);

   // Preenche a listbox de Planos...
   molListaPlano.PreenchePlano;
   // ...e marca todos por default
   molListaPlanobtnMarcaTodosPlanoClick(self);
end;



procedure TcfgRelContratoDuplicidade.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
   with dtmLookEmptmo.qryLookTipoContrato do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContrato);

      if DBcboTipoEmptmo.LookupValue <> '' then
      begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
      end;

      Open;

      DBcboTipoContrato.Enabled := True;
   end;
end;



procedure TcfgRelContratoDuplicidade.MontaQuery;
begin
   inherited;

   with dtmRelContratoDuplicidade do
   begin
      // preenche a label de data de referência
      rptContratoDuplicidade_lblDataIni.Caption    := edtDataIni.Text;
      rptContratoDuplicidade_lblDataFim.Caption    := edtDataFim.Text;

      bSeparador  := chkLinhas.Checked;

      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      bCorlinha   := chkCorLinha.Checked;
      CorLinha    := cboCorLinha.SelectedColor;

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




procedure TcfgRelContratoDuplicidade.FiltraRelatorio;
var
   sSQL           : String;
   sDataIni       : String;
   sDataFim       : String;
begin
   sDataIni := FormatDateTime('dd/mm/yyyy', edtDataIni.Date);
   sDataFim := FormatDateTime('dd/mm/yyyy', edtDataFim.Date);

   sSQL :=
   'SELECT '                                                                                            + #13 +
   '   CON.IDCONTRATOEMPTMO, '                                                                          + #13 +
   '   DEP.MATRICULA, '                                                                                 + #13 +
   '   DECODE(CON.FLGSITUACAO,''A'',''Ativo'', '                                                        + #13 +
   '                          ''P'',''Pendente'', '                                                     + #13 +
   '                          ''E'',''Encerrado'', '                                                    + #13 +
   '                          ''K'',''Em quitação'', '                                                  + #13 +
   '                          ''Q'',''Quitado'', '                                                      + #13 +
   '                          ''C'',''Cancelado'') AS FLGSITUACAO, '                                    + #13 +
   '   MUT.NOME, '                                                                                      + #13 +
   '   CON.DATACREDITO, '                                                                               + #13 +
   '   DECODE(HME.FLGBAIXADO, NULL, ''Sim'', ''Não'') AS PAGO, '                                        + #13 +
   '   DECODE(HME.FLGENVIO, NULL, ''Sim'', ''Não'') AS ENVIADO, '                                       + #13 +
   '   HME.HMEDATAVENCTO, '                                                                             + #13 +
   '   ABS(HME.HMEVLRPREVISTO) AS HMEVLRPREVISTO '                                                      + #13 +
   'FROM '                                                                                              + #13 +
   '   HISTMOVEMPTMO       HME, '                                                                       + #13 +
   '   PESSOA              MUT, '                                                                       + #13 +
   '   DEPENTIT            DEP, '                                                                       + #13 +
   '   CONTRATOEMPTMO      CON, '                                                                       + #13 +
   '   TIPOEMPTMO          TEP, '                                                                       + #13 +
   '   TIPOCONTREMPTMO     TCE, '                                                                       + #13 +

   // Pendência 23260 - Marcos Topini em 29/11/2006
   '   VWMIGRACONTRATOEP MIG'                                                                           + #13 +

   'WHERE '                                                                                             + #13 +
   '       TEP.IDEMPRESAPROP        = ' + IntToStr(Sistema.IDEmpresa)                                   + #13 +
   '   AND MIG.IDPATROATU           IN (' + molListaPatro.PegaPatro + ') '                              + #13 +
   '   AND MIG.IDPLANOCONTATU       IN (' + molListaPlano.PegaPlano + ') '                              + #13;

   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '   AND CON.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)               + #13;

   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '   AND TCE.IDTIPOEMPTMO         = ' + DBcboTipoEmptmo.LookupValue                                   + #13;

   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '   AND CON.IDTIPOCONTREMPTMO    = ' + DBcboTipoContrato.LookupValue                                 + #13;

   if chkEncerrado.Checked then sSQL := sSQL +
   '   AND CON.FLGSITUACAO          NOT IN (''C'', ''Q'', ''E'')  '                                     + #13
   else sSQL := sSQL +
   '   AND CON.FLGSITUACAO          NOT IN (''C'', ''Q'')  '                                            + #13;

   if edtDataIni.Text <> '' then sSQL := sSQL +
   '   AND HME.HMEDATAVENCTO        BETWEEN TO_DATE(' + QuotedStr(sDataIni) + ',''DD/MM/YYYY'') '       +
                                       'AND TO_DATE(' + QuotedStr(sDataFim) + ',''DD/MM/YYYY'')'        + #13;

   sSQL := sSQL +
   '   AND (HME.HMECENTRALIZA       = 1 OR HME.HMEDESTACADO = 1) '                                      + #13 +
   '   AND NVL(HME.FLGESTORNADO, 0) = 0 '                                                               + #13 +
   '   AND NVL(HME.FLGABONADO, 0)   = 0 '                                                               + #13 +
   '   AND NVL(HME.FLGQUITADO, 0)   = 0 '                                                               + #13 +
   '   AND HME.HMETIPOMOV           = 0 '                                                               + #13 +
   '   AND CON.IDCONTRATOEMPTMO     = HME.IDCONTRATOEMPTMO '                                            + #13 +
   '   AND CON.IDBENEF              = MUT.IDPESSOA '                                                    + #13 +
   '   AND CON.IDBENEF              = DEP.IDPESSOA '                                                    + #13 +
   '   AND CON.IDPESSOA             = DEP.IDTITULAR '                                                   + #13 +
   '   AND TCE.IDTIPOCONTREMPTMO    = CON.IDTIPOCONTREMPTMO '                                           + #13 +
   '   AND TEP.IDTIPOEMPTMO         = TCE.IDTIPOEMPTMO '                                                + #13 +
   '   AND '                                                                                            + #13 +
   '      EXISTS ( '                                                                                    + #13 +
   '              SELECT CEP.IDCONTRATOEMPTMO '                                                         + #13 +
   '              FROM   CONTRATOEMPTMO CEP '                                                           + #13 +
   '              WHERE '                                                                               + #13 +
   '                    CEP.IDBENEF            = CON.IDBENEF '                                          + #13 +
   '                AND CEP.IDPESSOA           = CON.IDPESSOA '                                         + #13 +
   '                AND CEP.IDCONTRATOEMPTMO  <> CON.IDCONTRATOEMPTMO '                                 + #13;

   if not chkContrEmQuitacaoPendente.Checked then sSQL := sSQL +
   '                AND (CEP.IDCONTRQUITACAO   IS NULL OR CEP.IDCONTRQUITACAO <> CON.IDCONTRATOEMPTMO)' + #13;

   if chkEncerrado.Checked then sSQL := sSQL +
   '                AND CEP.FLGSITUACAO          NOT IN (''C'', ''Q'', ''E'') '                         + #13
   else sSQL := sSQL +
   '                AND CEP.FLGSITUACAO          NOT IN (''C'', ''Q'') '                                + #13;

   sSQL := sSQL +
   '             ) '                                                                                    + #13 +

   // Pendência 23260 - Marcos Topini em 29/11/2006
   '   AND MIG.IDCONTRATOEMPTMO  = HME.IDCONTRATOEMPTMO                            '   + #13 +
   '   AND MIG.DATAMIGRA         = (SELECT MAX(DATAMIGRA)                          '   + #13 +
   '                                  FROM VWMIGRACONTRATOEP                       '   + #13 +
   '                                 WHERE IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO '   + #13 +
   '                                   AND DATAMIGRA       <= HME.HMEDATAPREVISTA) '   + #13 +
   // Fim Pendência 23260

   'ORDER BY '                                                                                          + #13 +
   '  MUT.NOME '                                                                                        + #13;

   with dtmRelContratoDuplicidade do
   begin
     qryContratoDuplicidade.Close;
     qryContratoDuplicidade.SQL.Clear;
     qryContratoDuplicidade.SQL.Text := sSQL;
   //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
   //qryContratoDuplicidade.SQL.SaveToFile(Sistema.TempDir + 'EP-RelContratoDuplicidade.txt');
     qryContratoDuplicidade.SQL.SaveToFile(ftempregra + '\' + 'EP-RelContratoDuplicidade.txt');
     qryContratoDuplicidade.Open;
   end
end;



procedure TcfgRelContratoDuplicidade.molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnBuscaContratoClick(Sender);
end;



procedure TcfgRelContratoDuplicidade.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TcfgRelContratoDuplicidade.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
  inherited;
  molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



end.
