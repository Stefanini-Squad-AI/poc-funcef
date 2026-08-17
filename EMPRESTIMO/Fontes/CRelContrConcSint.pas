{---------------------------Alteração-------------------------------------------
Pendência   : SOL 114575 Kintana 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
-------------------------------------------------------------------------------}
unit CRelContrConcSint;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
   TB97, ExtCtrls, mContratoEmptmo, Mask, wwdbedit, Wwdbspin, CheckLst,
   wwdblook, db, fcCombo, fcColorCombo, wwdbdatetimepicker, mListaPatro,
   mListaPlano;

type
   TcfgRelContrConcSint = class(TcfgRel)
      molContratoEmptmo: TmolContratoEmptmo;
      Label1: TLabel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      DBcboTipoContrato: TwwDBLookupCombo;
      Label2: TLabel;
      rdgOrdenar: TRadioGroup;
      rgTipoRelatorio: TRadioGroup;
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
      molListaPatro: TmolListaPatro;
      molListaPlano: TmolListaPlano;

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

             
  public    // Public declarations

  end;



var
  cfgRelContrConcSint: TcfgRelContrConcSint;



implementation
{$R *.DFM}
uses
   DLookEmptmo, UDiasUteis, USistema, UfuncoesEmptmo, dRelContrConcSint;



procedure TcfgRelContrConcSint.AbreQueries;
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



procedure TcfgRelContrConcSint.FormShow(Sender: TObject);
begin
   inherited;

   molContratoEmptmo.btnLimpaContrato.Click;

   // preenche a data de lançamento e o ano de referência/competência 
   edtDataIni.Date   := SysDate;
   edtDataFim.Date   := SysDate;
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



procedure TcfgRelContrConcSint.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
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



procedure TcfgRelContrConcSint.MontaQuery;
begin
   inherited;

   with dtmRelContrConcSint do
   begin
      if molContratoEmptmo.IDContrato > 0 then
      begin
         sContrato      := FormatFloat('#0', molContratoEmptmo.IDContrato);
      end;

      TipoRelatorio     := rgTipoRelatorio.Items[rgTipoRelatorio.ItemIndex];

      if rdgData.ItemIndex = 0 then
      begin
         TipoData := 'C';
      end
      else
      begin
         TipoData := 'A';
      end;

      DataIni     := edtDataIni.Text;
      DataFim     := edtDataFim.Text;

      // sMesCompetencia   := cboMes.Text +' / '+ DBspnAno.Text;

      bSeparador  := chkLinhas.Checked;

      // Início Pendência 21063 - Marcos Topini
      // -------------------------------------------------------------------------------------------

      // Daniel - 23691 - Início -----------------------------------------------------
      if ( lblTipoEmptmo<>nil ) then begin
        lblTipoEmptmo.Caption := ' < todos > ';
        if ( DBcboTipoEmptmo.LookupValue<>'' ) then
          lblTipoEmptmo.Caption := DBcboTipoEmptmo.Text;
      end;

      if ( lblTipoContr<>nil ) then begin
        lblTipoContr.Caption  := ' < todos > ';
        if ( DBcboTipoContrato.LookupValue<>'' ) then
          lblTipoContr.Caption  := DBcboTipoContrato.Text;
      end;

      if ( memPatro<>nil ) then
        memPatro.RichText := molListaPatro.ListaPatro;

      if ( memPlano<>nil ) then
        memPlano.RichText := molListaPlano.ListaPlano;
      // Daniel - 23691 - Fim --------------------------------------------------------

      // -------------------------------------------------------------------------------------------
      // Fim Pendência 21063

      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      bCorlinha   := chkCorLinha.Checked;
      CorLinha    := cboCorLinha.SelectedColor;
   end;

   FiltraRelatorio;
end;



// Monta o select de contratos por faixa de meses, de acordo com a tela de parametros.
procedure TcfgRelContrConcSint.FiltraRelatorio;
var
   sSQL              : String;
   sOrdenacao        : String;
begin
   sSQL :=
   'SELECT '                                                                  + #13 +
   '  CON.DESCTIPOEMPTMO, '                                                   + #13 +
   '  CON.TCEDESCRICAO, '                                                     + #13 +
   '  HME.ITEDESCRICAO, '                                                     + #13 +
   '  HME.ITCSEQCALCULO, '                                                    + #13 +
   '  SUM(CON.VLRCONTRATO) AS VLRSOLIC, '                                     + #13 +
   '  SUM(HST.HMEVLRPREVISTO) AS VLRCREDITO, '                                + #13 +
   '  SUM(HME.HMEVLRPREVISTO) AS VLRPREVISTO '                                + #13 +
   'FROM '                                                                    + #13 +
   '  VWCONTRATOEP  CON, '                                                    + #13 +
   '  VW_MOVEP      HME, '                                                    + #13 +
   '  (SELECT '                                                               + #13 +
   '      IDCONTRATOEMPTMO, '                                                 + #13 +
   '      SUM(HMEVLRPREVISTO) AS HMEVLRPREVISTO '                             + #13 +
   '   FROM '                                                                 + #13 +
   '      VW_MOVEP '                                                          + #13 +
   '   WHERE '                                                                + #13 +
   '       ( HMECENTRALIZA     = 1 ) '                                        + #13 +
   '   AND ( EVENTO            = 0 ) '                                        + #13 +
   '   GROUP BY '                                                             + #13 +
   '       IDCONTRATOEMPTMO '                                                 + #13 +
   '  ) HST '                                                                 + #13;

   sSQL := sSQL +
   'WHERE '                                                                   + #13 +
   '      ( CON.IDEMPRESAPROP     = ' + IntToStr(Sistema.IdEmpresa) + ' ) '   + #13 +
   '  AND ( HME.EVENTO            = 0 ) '                                     + #13 +
   '  AND ( (HME.HMECENTRALIZA    = 0) OR (HME.HMEDESTACADO = 1) ) '          + #13 +
   '  AND ( CON.IDPATRO           IN (' + molListaPatro.PegaPatro + ') ) '    + #13 +
   '  AND ( CON.IDPLANOPREV       IN (' + molListaPlano.PegaPlano + ') ) '    + #13;

   if rdgData.ItemIndex = 0 then begin
      sSQL := sSQL +
      '  AND ( CON.DATACREDITO >= TO_DATE(' + QuotedStr(edtDataIni.Text) + ',''dd/mm/yyyy'') )' + #13 +
      '  AND ( CON.DATACREDITO <= TO_DATE(' + QuotedStr(edtDataFim.Text) + ',''dd/mm/yyyy'') )' + #13;
   end else begin
      sSQL := sSQL +
      '  AND ( CON.DATAASSINATURA >= TO_DATE(' + QuotedStr(edtDataIni.Text) + ',''dd/mm/yyyy'') )' + #13 +
      '  AND ( CON.DATAASSINATURA <= TO_DATE(' + QuotedStr(edtDataFim.Text) + ',''dd/mm/yyyy'') )' + #13;
   end;

   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '  AND ( CON.IDCONTRATOEMPTMO  = ' + FormatFloat('#0', molContratoEmptmo.IDContrato) + ' ) '          + #13;

   sSQL := sSQL +
   '  AND ( HME.IDCONTRATOEMPTMO  = CON.IDCONTRATOEMPTMO ) '                  + #13 +
   '  AND ( HME.IDCONTRATOEMPTMO  = HST.IDCONTRATOEMPTMO ) '                  + #13;

   if DBcboTipoEmptmo.LookupValue <> '' then begin
      sSQL := sSQL +
   '  AND ( CON.IDTIPOEMPTMO      = ' + DBcboTipoEmptmo.LookupValue + ' ) '    + #13;
   end;

   if DBcboTipoContrato.LookupValue <> '' then begin
      sSQL := sSQL +
   '  AND ( CON.IDTIPOCONTREMPTMO = ' + DBcboTipoContrato.LookupValue + ' ) '      + #13;
   end;

   sSQL := sSQL +
   'GROUP BY '                                                                + #13 +
   '  CON.DESCTIPOEMPTMO, '                                                   + #13 +
   '  CON.TCEDESCRICAO, '                                                     + #13 +
   '  HME.ITEDESCRICAO, '                                                     + #13 +
   '  HME.ITCSEQCALCULO '                                                     + #13;

   sOrdenacao := '   CON.DESCTIPOEMPTMO, CON.TCEDESCRICAO, HME.ITCSEQCALCULO DESC';

   sSQL := sSQL + 'ORDER BY ' + #13 + sOrdenacao;

   with dtmRelContrConcSint.qryContrConcSint do
   begin
      Close;
      SQL.Text := sSQL;
    //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
    //SQL.SaveToFile(Sistema.TempDir + 'EP-RelContrConcTipoContr.txt');
      SQL.SaveToFile(ftempregra + '\' + 'EP-RelContrConcTipoContr.txt');
      Open;
   end;
end;



procedure TcfgRelContrConcSint.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TcfgRelContrConcSint.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TcfgRelContrConcSint.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TcfgRelContrConcSint.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



end.
