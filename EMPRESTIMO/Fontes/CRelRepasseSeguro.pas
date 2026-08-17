{---------------------------Alteração-------------------------------------------
Pendência   : SOL 114575 KINTANA 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
-------------------------------------------------------------------------------}
unit CRelRepasseSeguro;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   CRel, fcCombo, fcColorCombo, StdCtrls, wwdbdatetimepicker, db,
   mContratoEmptmo, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
   TB97Tlbr, TB97, ExtCtrls, mListaPlano, mListaPatro, wwdblook;

type
   TcfgRelRepasseSeguro = class(TcfgRel)
      Label1: TLabel;
      Label2: TLabel;
      GroupBox3: TGroupBox;
      Label3: TLabel;
      Label4: TLabel;
      edtDataIni: TwwDBDateTimePicker;
      edtDataFim: TwwDBDateTimePicker;
      molContratoEmptmo: TmolContratoEmptmo;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      DBcboTipoContrato: TwwDBLookupCombo;
      GroupBox1: TGroupBox;
      chkCorLinha: TCheckBox;
      cboCorLinha: TfcColorCombo;
      chkLinhas: TCheckBox;
      molListaPatro: TmolListaPatro;
      molListaPlano: TmolListaPlano;
      rdgOrdenacao: TRadioGroup;

      procedure FormShow(Sender: TObject);
      procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
      procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
      procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
      procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure DBcboTipoEmptmoExit(Sender: TObject);


   private  // Private declarations

      procedure MontaQuery; override;
      procedure FiltraRelatorio;
      procedure AbreQueries;


   public   // Public declarations


   end;



var
  cfgRelRepasseSeguro: TcfgRelRepasseSeguro;



implementation
{$R *.DFM}
uses
   DLookEmptmo,
   UDiasUteis,
   USistema,
   UfuncoesEmptmo,
   dRelRepasseSeguro,
   dEmptmo,
   UMensErro;




procedure TcfgRelRepasseSeguro.AbreQueries;
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



procedure TcfgRelRepasseSeguro.FormShow(Sender: TObject);
var
   dDataHoje : TDateTime;
   dDataIni  : TDateTime;
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



procedure TcfgRelRepasseSeguro.MontaQuery;
begin
   inherited;

   with dtmRelRepasseSeguro do
   begin
      bCorlinha   := chkCorLinha.Checked;
      CorLinha    := cboCorLinha.SelectedColor;

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

      bSeparador  := chkLinhas.Checked;
   end;

   FiltraRelatorio;
end;



procedure TcfgRelRepasseSeguro.FiltraRelatorio;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT '                                                                                    + #13 +
   '   CON.IDCONTRATOEMPTMO, MUT.NOME, '                                                        + #13 +
   '   NVL(DEP.MATRICULA, ELP.MATRICULA) AS MATRICULA, '                                        + #13 +
   '   TCE.TCEDESCRICAO, '                                                                      + #13 +
   '   SOL.HMEVLRPREVISTO AS VLRCONTRATO, CON.DATACREDITO, '                                    + #13 +
   '   HME.HMEVLRPREVISTO, HME.HMEDATAPREVISTA, '                                               + #13 +
   '   PFI.DATAMORTE, CXB.VLRREPASSE, CXB.VLRSALDOREC, '                                        + #13 +
   '   (HME.HMEVLRPREVISTO + CXB.VLRSALDOREC) AS VLR_ATUALIZADO, '                              + #13 +
   '   CXB.PERCINDENIZACAO, '                                                                   + #13 +
   '   MUT.NOME AS NOME_MUTUARIO, '                                                             + #13 +
   '   CXB.NUMBANCO, CXB.CODAGENCIA, CXB.CONTACORRENTE, CXB.OBS, '                              + #13 +
   '   CXB.NOME AS NIME_BENEF '                                                                 + #13 +

   'FROM '                                                                                      + #13 +
   '   PESSOA            MUT, '                                                                 + #13 +
   '   PESSOAFISICA      PFI, '                                                                 + #13 +
   '   HISTMOVEMPTMO     HME, '                                                                 + #13 +
   '   CONTRATOEMPTMO    CON, '                                                                 + #13 +
   '   ELEGPATRO         ELP, '                                                                 + #13 +
   '   DEPENTIT          DEP, '                                                                 + #13 +
   '   TIPOCONTREMPTMO   TCE, '                                                                 + #13 +
   '   TIPOEMPTMO        TEP, '                                                                 + #13 +
   '   CONTRATOXBENEFSEG CXB, '                                                                 + #13 +

   '   ( '                                                                                      + #13 +
   '   SELECT '                                                                                 + #13 +
   '      HME.IDCONTRATOEMPTMO, SUM(HME.HMEVLRPREVISTO) AS HMEVLRPREVISTO '                     + #13 +
   '   FROM '                                                                                   + #13 +
   '      HISTMOVEMPTMO  HME, '                                                                 + #13 +
   '      CONTRATOEMPTMO CON, '                                                                 + #13 +
   '      ITEMXTIPOCONTR ITC '                                                                  + #13 +
   '   WHERE '                                                                                  + #13 +
   '          HME.HMETIPOMOV           = 0 '                                                    + #13;

   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '      AND CON.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)    + #13;

   sSQL := sSQL +
   '      AND NVL(HME.FLGESTORNADO, 0) = 0 '                                                    + #13 +
   '      AND ITC.ITCEVENTO            = 0 '                                                    + #13 +
   '      AND ITC.ITCTRATASALDODEV     = 2 '                                                    + #13 +
   '      AND ITC.ITCSEQCALCULO        = ( '                                                    + #13 +
   '                                     SELECT '                                               + #13 +
   '                                        MIN(ITE.ITCSEQCALCULO) '                            + #13 +
   '                                     FROM '                                                 + #13 +
   '                                        ITEMXTIPOCONTR ITE '                                + #13 +
   '                                     WHERE '                                                + #13 +
   '                                            ITE.ITCEVENTO         = 0 '                     + #13 +
   '                                        AND ITE.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO ' + #13 +
   '                                     ) '                                                    + #13 +
   '      AND HME.IDCONTRATOEMPTMO     = CON.IDCONTRATOEMPTMO '                                 + #13 +
   '      AND HME.IDITEMEMPTMO         = ITC.IDITEMEMPTMO '                                     + #13 +
   '      AND CON.IDTIPOCONTREMPTMO    = ITC.IDTIPOCONTREMPTMO '                                + #13 +
   '   GROUP BY '                                                                               + #13 +
   '      HME.IDCONTRATOEMPTMO '                                                                + #13 +
   '   ) SOL '                                                                                  + #13 +

   'WHERE '                                                                                     + #13 +
   '       TEP.IDEMPRESAPROP           = ' + IntToStr(Sistema.IdEmpresa)                        + #13 +
   '   AND CON.IDPATRO                 IN (' + molListaPatro.PegaPatro + ') '                   + #13 +
   '   AND CON.IDPLANOPREV             IN (' + molListaPlano.PegaPlano + ') '                   + #13 +
   '   AND NVL(HME.FLGESTORNADO, 0)    = 0 '                                                    + #13 +
   '   AND (HME.HMECENTRALIZA          = 1 OR HME.HMEDESTACADO = 1) '                           + #13 +
   '   AND HME.HMETIPOMOV              = 3 '                                                    + #13 +
   '   AND HME.HMEORIGEM               = 8 '                                                    + #13;

   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '   AND CON.IDCONTRATOEMPTMO        = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)    + #13;

   sSQL := sSQL +
   '   AND HME.HMEDATAPREVISTA         BETWEEN TO_DATE(' + QuotedStr(edtDataIni.Text) + ',''dd/mm/yyyy'') '   +
                                          'AND TO_DATE(' + QuotedStr(edtDataFim.Text) + ',''dd/mm/yyyy'') '   + #13 +

   '   AND CON.IDCONTRATOEMPTMO        = HME.IDCONTRATOEMPTMO '                                 + #13 +

   '   AND CON.IDBENEF                 = MUT.IDPESSOA '                                         + #13 +
   '   AND CON.IDBENEF                 = PFI.IDPESSOA '                                         + #13 +
   '   AND CON.IDBENEF                 = DEP.IDPESSOA '                                         + #13 +
   '   AND CON.IDPESSOA                = DEP.IDTITULAR '                                        + #13 +
   '   AND CON.IDPESSOA                = ELP.IDPESSOA '                                         + #13 +
   '   AND CON.IDPATRO                 = ELP.IDPESSJUR '                                        + #13 +
   '   AND CON.IDTIPOCONTREMPTMO       = TCE.IDTIPOCONTREMPTMO '                                + #13 +
   '   AND TCE.IDTIPOEMPTMO            = TEP.IDTIPOEMPTMO '                                     + #13 +
   '   AND CON.IDINSCRICAOEMPTMO       = CXB.IDINSCRICAOEMPTMO '                                + #13 +
   '   AND CON.IDCONTRATOEMPTMO        = SOL.IDCONTRATOEMPTMO '                                 + #13 +

   'ORDER BY '                                                                                  + #13;

   case rdgOrdenacao.ItemIndex of
      0: sSQL := sSQL + '   MUT.NOME, CON.IDCONTRATOEMPTMO ';
      1: sSQL := sSQL + '   DEP.MATRICULA, CON.IDCONTRATOEMPTMO ';
      2: sSQL := sSQL + '   CON.IDCONTRATOEMPTMO ';
   end;

   with dtmRelRepasseSeguro.qryRepasse do
   begin
      Close;
      SQL.Clear;
      SQL.Text := sSQL;
    //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
    //SQL.SaveToFile(Sistema.TempDir + 'EP-RelRepasseSeguro.txt');
      SQL.SaveToFile(ftempregra + '\' + 'EP-RelRepasseSeguro.txt');
      Open;
   end;
end;



procedure TcfgRelRepasseSeguro.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TcfgRelRepasseSeguro.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TcfgRelRepasseSeguro.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TcfgRelRepasseSeguro.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



procedure TcfgRelRepasseSeguro.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
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



procedure TcfgRelRepasseSeguro.DBcboTipoEmptmoExit(Sender: TObject);
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
