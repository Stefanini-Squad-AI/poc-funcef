unit CRelFalecimento;

// Alterações:
{ --------------------------------------------------------------------------------------------------
Pendência   : SOL 248417 PPM 725328
Responsável : Wylliam Leite da Silva
Data        : 26/03/2015
Descrição   : Alteração nops campos do relatorio.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 114575 Kintana 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
----------------------------------------------------------------------------------------------------
Rotina    :
Data      :
Autor     :
Pendência :
Descrição :
---------------------------------------------------------------------------------------------------}

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
   TB97, ExtCtrls, mContratoEmptmo, Mask, wwdbedit, Wwdbspin, CheckLst,
   wwdblook, db, fcCombo, fcColorCombo, wwdbdatetimepicker, mListaPlano,
   mListaPatro;

type
   TcfgRelFalecimento = class(TcfgRel)
      molContratoEmptmo: TmolContratoEmptmo;
      Label1: TLabel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      DBcboTipoContrato: TwwDBLookupCombo;
      Label2: TLabel;
      GroupBox1: TGroupBox;
      chkCorLinha: TCheckBox;
      cboCorLinha: TfcColorCombo;
      chkLinhas: TCheckBox;
      GroupBox3: TGroupBox;
      Label3: TLabel;
      edtDataIni: TwwDBDateTimePicker;
      Label4: TLabel;
      edtDataFim: TwwDBDateTimePicker;
      molListaPatro: TmolListaPatro;
      molListaPlano: TmolListaPlano;
      rdgOrdenacao: TRadioGroup;

      procedure FormShow(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
      procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
      procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
      procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);


   private  // Private declarations

      procedure AbreQueries;

      procedure MontaQuery; override;
      procedure FiltraRelatorio;


   public   // Public declarations

   end;



var
   cfgRelFalecimento: TcfgRelFalecimento;



implementation
{$R *.DFM}
uses
   DLookEmptmo,
   dEmptmo,
   USistema,
   UfuncoesEmptmo,
   dRelFalecimento;



procedure TcfgRelFalecimento.AbreQueries;
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



procedure TcfgRelFalecimento.FormShow(Sender: TObject);
begin
   inherited;

   molContratoEmptmo.btnLimpaContrato.Click;

   edtDataIni.Date   := EncodeDate(DiasUteis.ExtraiAno(Sysdate), DiasUteis.ExtraiMes(Sysdate), 1);
   edtDataFim.Date   := DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(Sysdate), DiasUteis.ExtraiMes(Sysdate));

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



procedure TcfgRelFalecimento.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
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



procedure TcfgRelFalecimento.MontaQuery;
begin
   inherited;

   with dtmRelFalecimento do
   begin
      rptRetencaoIOF_lblDataIni.Caption := edtDataIni.Text;
      rptRetencaoIOF_lblDataFim.Caption := edtDataFim.Text;

      bSeparador  := chkLinhas.Checked;

      // Início Pendência 21063 - Marcos Topini
      // -------------------------------------------------------------------------------------------
        lblTipoEmptmo.Caption := ' < todos > ';
        if DBcboTipoEmptmo.LookupValue <> ''   then lblTipoEmptmo.Caption := DBcboTipoEmptmo.Text;

        lblTipoContr.Caption  := ' < todos > ';
        if DBcboTipoContrato.LookupValue <> ''    then lblTipoContr.Caption  := DBcboTipoContrato.Text;

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




// Monta o select de contratos por faixa de meses, de acordo com a tela de parametros.
procedure TcfgRelFalecimento.FiltraRelatorio;
var
   sSQL        : String;
   sOrdenacao  : String;
   sEmpresa    : String;
begin
   sEmpresa := IntToStr(Sistema.IDEmpresa);

   sSQL :=
   'SELECT '                                                                                       + #13 +
   '  CON.IDCONTRATOEMPTMO, DEP.MATRICULA, MUT.NOME, '                                             + #13 +
   '  TCE.TCEDESCRICAO, '                                                                          + #13 +
   '  CON.VLRCONTRATO, CON.DATACREDITO, '                                                          + #13 +
   '  SLD.HMEVLRPREVISTO AS VLRSALDODEV, '                                                         + #13 +
   '  HME.HMEVLRPREVISTO, HME.HMEDATAPREVISTA, '                                                   + #13 +
   '  PFI.DATAMORTE, DECODE(HME.FLGBAIXADO, NULL, ''Recebido'', '' '') AS RECEBIDO '               + #13 +
   '   , INSC.DATAINSC AS "DATASOLICITACAO" '                                                      + #13 + //Wylliam Leite da Silva SOL 248417
   'FROM '                                                                                         + #13 +
   '   PESSOA          MUT, '                                                                      + #13 +
   '   PESSOAFISICA    PFI, '                                                                      + #13 +
   '   HISTMOVEMPTMO   HME, '                                                                      + #13 +
   '   CONTRATOEMPTMO  CON, '                                                                      + #13 +
   '   DEPENTIT        DEP, '                                                                      + #13 +
   '   TIPOCONTREMPTMO TCE, '                                                                      + #13 +
   '   TIPOEMPTMO      TEP, '                                                                      + #13 +
   '   INSCRICAOEMPTMO INSC, '                                                                     + #13 + //Wylliam Leite da Silva SOL 248417
   '   ( '                                                                                         + #13 +
   '   SELECT '                                                                                    + #13 +
   '      HME.IDCONTRATOEMPTMO, HME.HMEVLRPREVISTO, HME.HMESALDODEV, '                             + #13 +
   //Pendência 27206 - 09/01/2007
   '      HME.IDITEMEMPTMO, '                                                                      + #13 +
   //Fim Pendência 27206
   '      HME.HMEDATAPREVISTA, HME.HMEPARCELA, HME.HMENUMPARCELAS '                                + #13 +
   '   FROM '                                                                                      + #13 +
   '      HISTMOVEMPTMO  HME, '                                                                    + #13 +
   '      CONTRATOEMPTMO CON, '                                                                    + #13 +

   '      ( '                                                                                      + #13 +
   '      SELECT '                                                                                 + #13 +
   '         ITC.IDTIPOCONTREMPTMO, MAX(ITC.IDITEMEMPTMO) AS IDITEMEMPTMO '                        + #13 +
   '      FROM '                                                                                   + #13 +
   '         ITEMXTIPOCONTR ITC '                                                                  + #13 +
   '      WHERE '                                                                                  + #13 +
   '             ITC.ITCEVENTO         = 3 '                                                       + #13 +
   '         AND ITC.ITCTRATASALDODEV  = 1 '                                                       + #13 +
   '      GROUP BY '                                                                               + #13 +
   '         ITC.IDTIPOCONTREMPTMO '                                                               + #13 +
   '      ) ITE '                                                                                  + #13 +

   '   WHERE '                                                                                     + #13 +
   '          NVL(HME.FLGESTORNADO, 0) = 0 '                                                       + #13 +
   '      AND HME.HMETIPOMOV           = 3 '                                                       + #13 +
   '      AND HME.HMEORIGEM            = 8 '                                                       + #13;

   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '      AND HME.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)       + #13;

   sSQL := sSQL +
   '      AND HME.HMEDATAPREVISTA    BETWEEN TO_DATE(' + QuotedStr(edtDataIni.Text) + ',''dd/mm/yyyy'') '   +
                                        'AND TO_DATE(' + QuotedStr(edtDataFim.Text) + ',''dd/mm/yyyy'') '   +  #13;

   sSQL := sSQL +
   '      AND HME.IDITEMEMPTMO         = ITE.IDITEMEMPTMO '                                        + #13 +
   '      AND HME.IDCONTRATOEMPTMO     = CON.IDCONTRATOEMPTMO '                                    + #13 +
   '      AND CON.IDTIPOCONTREMPTMO    = ITE.IDTIPOCONTREMPTMO '                                   + #13 +
   '   ) SLD '                                                                                     + #13 +

   'WHERE '                                                                                        + #13 +
   '      TEP.IDEMPRESAPROP            = ' + IntToStr(Sistema.IdEmpresa)                           + #13 +
   '  AND CON.IDPATRO                  IN (' + molListaPatro.PegaPatro + ') '                      + #13 +
   '  AND CON.IDPLANOPREV              IN (' + molListaPlano.PegaPlano + ') '                      + #13;

   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   //Pendência 27205 - 09/01/2007
   //'  AND CON.IDTIPOEMPTMO             = ' + DBcboTipoEmptmo.LookupValue                           + #13;
   '  AND TCE.IDTIPOEMPTMO             = ' + DBcboTipoEmptmo.LookupValue                           + #13;
   //Fim Pendência 27205

   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '  AND CON.IDTIPOCONTREMPTMO        = ' + DBcboTipoContrato.LookupValue + ' ) '                 + #13;

   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '  AND CON.IDCONTRATOEMPTMO         = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)       + #13;

   sSQL := sSQL +
   '  AND NVL(HME.FLGESTORNADO, 0)     = 0 '                                                       + #13 +
   //Pendência 27206 - 09/01/2007
   //'  AND (HME.HMECENTRALIZA           = 1 OR HME.HMEDESTACADO = 1) '                              + #13 +
   '  AND HME.IDITEMEMPTMO             = SLD.IDITEMEMPTMO '                                        + #13 +
   //Fim Pendência 27206
   '  AND HME.HMETIPOMOV               = 3 '                                                       + #13 +
   '  AND HME.HMEORIGEM                = 8 '                                                       + #13 +
   '  AND CON.IDINSCRICAOEMPTMO        = INSC.IDINSCRICAOEMPTMO(+) '                               + #13 + //Wylliam Leite da Silva SOL 248417
   '  AND HME.HMEDATAPREVISTA          BETWEEN TO_DATE(' + QuotedStr(edtDataIni.Text) + ',''dd/mm/yyyy'') '   +
                                          'AND TO_DATE(' + QuotedStr(edtDataFim.Text) + ',''dd/mm/yyyy'') '   + #13 +

   '  AND CON.IDCONTRATOEMPTMO         = HME.IDCONTRATOEMPTMO '                                    + #13 +
   '  AND CON.IDCONTRATOEMPTMO         = SLD.IDCONTRATOEMPTMO '                                    + #13 +

   '  AND CON.IDBENEF                  = MUT.IDPESSOA '                                            + #13 +
   '  AND CON.IDBENEF                  = PFI.IDPESSOA '                                            + #13 +
   '  AND CON.IDBENEF                  = DEP.IDPESSOA '                                            + #13 +
   '  AND CON.IDPESSOA                 = DEP.IDTITULAR '                                           + #13 +
   '  AND CON.IDTIPOCONTREMPTMO        = TCE.IDTIPOCONTREMPTMO '                                   + #13 +
   '  AND TCE.IDTIPOEMPTMO             = TEP.IDTIPOEMPTMO '                                        + #13 +

   'ORDER BY '                                                                                     + #13;

   case rdgOrdenacao.ItemIndex of
      0: sSQL := sSQL + '  MUT.NOME, CON.IDCONTRATOEMPTMO ';
      1: sSQL := sSQL + '  DEP.MATRICULA, CON.IDCONTRATOEMPTMO ';
      2: sSQL := sSQL + '  CON.IDCONTRATOEMPTMO ';
   end;

   with dtmRelFalecimento.qryFalecimento do
   begin
      Close;
      SQL.Text := sSQL;
   //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
   //SQL.SaveToFile(Sistema.TempDir + 'EP-RelFalecimento.txt');
     SQL.SaveToFile(ftempregra + '\' + 'EP-RelFalecimento.txt');
      Open;
   end;
end;



procedure TcfgRelFalecimento.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TcfgRelFalecimento.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TcfgRelFalecimento.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TcfgRelFalecimento.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



end.
