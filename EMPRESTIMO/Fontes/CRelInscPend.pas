unit CRelInscPend;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
   TB97, ExtCtrls, mContratoEmptmo, CheckLst, fcCombo, fcColorCombo, Mask, wwdbedit,
   Wwdbspin, wwdblook, Db, DBTables, mListaPlano, mListaPatro;

type
   TcfgRelInscPend = class(TcfgRel)
      rdgOrdenar: TRadioGroup;
      GroupBox1: TGroupBox;
      chkCorLinha: TCheckBox;
      cboCorLinha: TfcColorCombo;
      chkLinhas: TCheckBox;
      Label1: TLabel;
      Label2: TLabel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      DBcboTipoContrato: TwwDBLookupCombo;
      molListaPatro: TmolListaPatro;
      molListaPlano: TmolListaPlano;

      procedure FormShow(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure DBcboTipoEmptmoExit(Sender: TObject);
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
  cfgRelInscPend: TcfgRelInscPend;



implementation
{$R *.DFM}
uses
   DLookEmptmo,
   UFuncoesEmptmo,
   UDiasUteis,
   USistema,
   uMensErro,
   dRelInscPend;



procedure TcfgRelInscPend.AbreQueries;
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



procedure TcfgRelInscPend.FormShow(Sender: TObject);
begin
   inherited;

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



procedure TcfgRelInscPend.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
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



procedure TcfgRelInscPend.DBcboTipoEmptmoExit(Sender: TObject);
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



procedure TcfgRelInscPend.MontaQuery;
begin
   inherited;

   with dtmRelInscPend do
   begin
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



procedure TcfgRelInscPend.FiltraRelatorio;
var
   sSQL : string;
begin
   sSQL :=
   'SELECT DISTINCT '                                                   + #13 +
   '  I.DATAINSC, '                                                     + #13 +
   '  I.IDINSCRICAOEMPTMO, '                                            + #13 +
   '  P.NOME, '                                                         + #13 +
   '  TC.TCEDESCRICAO, '                                                + #13 +
   '  I.VLRSOLIC, '                                                     + #13 +
   '  I.NUMPARCELAS, '                                                  + #13 +
   '  DECODE(I.FLGSITUACAO, ''P'', ''Pendente'', '''') AS PENDENTE '    + #13 +

   'FROM '                                                              + #13 +
   '  PESSOA          P, '                                              + #13 +
   '  INSCRICAOEMPTMO I, '                                              + #13 +
   '  CONTRATOEMPTMO  C, '                                              + #13 +
   '  TIPOCONTREMPTMO TC, '                                             + #13 +
   '  TIPOEMPTMO      TE '                                              + #13 +

   'WHERE '                                                             + #13 +

   // filtro por Empresa Proprietátia
   '       TE.IDEMPRESAPROP      = ' + IntToStr(Sistema.IDEmpresa)      + #13 +

   // filtro por Patrocinadora
   '   AND I.IDPATRO             IN (' + molListaPatro.PegaPatro + ') ' + #13 +

   // filtro por Plano
   '   AND I.IDPLANOPREV         IN (' + molListaPlano.PegaPlano + ') ' + #13;

   // filtro por Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '   AND TC.IDTIPOEMPTMO       = ' + DBcboTipoEmptmo.LookupValue      + #13 +
   '   AND TE.IDTIPOEMPTMO       = ' + DBcboTipoEmptmo.LookupValue      + #13;

   // filtro por Tipo de Contrato
   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '   AND I.IDTIPOCONTREMPTMO   = ' + DBcboTipoContrato.LookupValue    + #13 +
   '   AND TC.IDTIPOCONTREMPTMO  = ' + DBcboTipoContrato.LookupValue    + #13;

   sSQL := sSQL +
   '  AND ( C.IDINSCRICAOEMPTMO  IS NULL ) '                            + #13 +
   '  AND ( I.IDINSCRICAOEMPTMO  = C.IDINSCRICAOEMPTMO(+) ) '           + #13 +
   '  AND ( I.IDPESSOA           = P.IDPESSOA ) '                       + #13 +
   '  AND ( I.IDTIPOCONTREMPTMO  = TC.IDTIPOCONTREMPTMO ) '             + #13 +
   '  AND ( I.DATACANCINSC       IS NULL ) '                            + #13 +

   'ORDER BY '                                                          + #13;

   case rdgOrdenar.ItemIndex of
      0: sSQL := sSQL + '   I.IDINSCRICAOEMPTMO ';
      1: sSQL := sSQL + '   P.NOME, I.IDINSCRICAOEMPTMO ';
      2: sSQL := sSQL + '   I.DATAINSC, I.IDINSCRICAOEMPTMO ';
   end;

   with dtmRelInscPend.qryInscPend do
   begin
      Close;
      SQL.Text := sSQL;
      Open;

      if isEmpty then
      begin
         MsgDlg('Não há Inscrições pendentes com os critérios selecionados.',
                'Empréstimo', mtInformation, [mbOk], 0);
         Repaint;
      end;
   end;
end;



procedure TcfgRelInscPend.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TcfgRelInscPend.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TcfgRelInscPend.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TcfgRelInscPend.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



end.
