unit CRelConfereEnvioFolhaAnal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
  TB97, ExtCtrls, mContratoEmptmo, Mask, wwdbedit, Wwdbspin, CheckLst,
  wwdblook, db, fcCombo, fcColorCombo, mListaPatro;

type
   TcfgRelConfereEnvioFolhaAnal = class(TcfgRel)
      Panel1: TPanel;
      Label15: TLabel;
      DBspnAno: TwwDBSpinEdit;
      cboMes: TComboBox;
      Label1: TLabel;
      DBcboRubrica: TwwDBLookupCombo;
      GroupBox1: TGroupBox;
      chkCorLinha: TCheckBox;
      cboCorLinha: TfcColorCombo;
      chkLinhas: TCheckBox;
      Label2: TLabel;
      Label3: TLabel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      DBcboTipoContrato: TwwDBLookupCombo;
    molListaPatro: TmolListaPatro;

      procedure FormShow(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure DBcboTipoEmptmoExit(Sender: TObject);
    procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
    procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);


   private { Private declarations }

      procedure AbreQueries;

      procedure MontaQuery; override;
      procedure FiltraRelatorio;

  public { Public declarations }

  end;



var
  cfgRelConfereEnvioFolhaAnal: TcfgRelConfereEnvioFolhaAnal;



implementation
{$R *.DFM}
uses
   DLookEmptmo,
   UDiasUteis,
   USistema,
   UfuncoesEmptmo, dRelConfereEnvioFolha,
   uMensErro, dRelDividas, dRelConfereEnvioFolhaAnal;




procedure TcfgRelConfereEnvioFolhaAnal.AbreQueries;
begin
   with dtmLookEmptmo.qryLookTipoEmptmo do begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoEmptmo);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
   end;

   with dtmLookEmptmo.qryLookRubricaNormal do begin
      LimpaParametros(dtmLookEmptmo.qryLookRubricaNormal);
      ParamByName('PFLGDESCONTO').AsInteger := 1;
      Open;
   end;
end;



procedure TcfgRelConfereEnvioFolhaAnal.MontaQuery;
begin
   inherited;

   with dtmRelConfereEnvioFolhaAnal do begin

      sCompetencia   := cboMes.Text + '/' + DBspnAno.Text;

      bSeparador     := chkLinhas.Checked;

      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      bCorlinha      := chkCorLinha.Checked;
      CorLinha       := cboCorLinha.SelectedColor;

   end;

   FiltraRelatorio;
end;



procedure TcfgRelConfereEnvioFolhaAnal.FiltraRelatorio;
var
   sSQL    : string;
   sAnoMes : String;
   sAno    : String;
   sMes    : String;
begin

   sAno    := FormatFloat('0000',Trunc(DBspnAno.Value));
   sMes    := IntToStr(cboMes.ItemIndex + 1);
   if Length(sMes) = 1 then sMes := '0' + sMes;
   sAnoMes := sAno + '/' + sMes;

   sSQL :=
   'SELECT '                                                                                 + #13 +
   '    HME.IDCONTRATOEMPTMO,'                                                               + #13 +
   '    CON.MATRICULA, '                                                                     + #13 +
   '    CON.NOME, '                                                                          + #13 +
   '    HME.IDRUBRICA, '                                                                     + #13 +
   '    HME.ITEDESCRICAO, '                                                                  + #13 +
   '    NVL(SUM(HME.HMEVLRPREVISTO),0) AS HMEVLRPREVISTO, '                                  + #13 +
   '    NVL(SUM(TMP.VALOR),0) AS VALOR '                                                     + #13 +
   'FROM '                                                                                   + #13 +
   '    VW_MOVEP HME, '                                                                      + #13 +
   '    TMPDESC  TMP, '                                                                      + #13 +
   '    TIPOCONTREMPTMO TCE, '                                                               + #13 +
   '    TIPOEMPTMO TEP, '                                                                    + #13 +
   '    VWCONTRATOEP CON '                                                                   + #13 +

   'WHERE '                                                                                  + #13 +

   '    CON.IDEMPRESAPROP  = ' + IntToStr(Sistema.IDEmpresa)                                 + #13 +
   'AND TMP.MESCOBRANCA    = ' + QuotedStr(sAnoMes)                                          + #13 +
   'AND HME.HMEANOCOBRANCA = ' + sAno                                                        + #13 +
   'AND HME.HMEMESCOBRANCA = ' + sMes                                                        + #13 +
   'AND HME.FLGENVIO       IS NULL '                                                         + #13 +
   'AND ((HME.HMECENTRALIZA = 1) OR (HME.HMEDESTACADO = 1)) '                                + #13 +
   'AND CON.IDPATRO     IN (' + molListaPatro.PegaPatro + ') '                               + #13;

   (* filtro por Tipo de Empréstimo *)
   if DBcboTipoEmptmo.LookupValue <> '' then begin
      sSQL := sSQL +
      'AND TCE.IDTIPOEMPTMO      = ' + DBcboTipoEmptmo.LookupValue                           + #13 +
      'AND TEP.IDTIPOEMPTMO      = ' + DBcboTipoEmptmo.LookupValue                           + #13;
   end;

   (* filtro por Tipo de Contrato *)
   if DBcboTipoContrato.LookupValue <> '' then begin
      sSQL := sSQL +
      'AND CON.IDTIPOCONTREMPTMO  = ' + DBcboTipoContrato.LookupValue                        + #13 +
      'AND TCE.IDTIPOCONTREMPTMO  = ' + DBcboTipoContrato.LookupValue                        + #13;
   end;

   (* filtro por Rubrica *)
   if DBcboRubrica.LookupValue <> '' then begin
      sSQL := sSQL +
      'AND HME.IDRUBRICA = ' + DBcboRubrica.LookupValue                                      + #13;
   end;

   sSQL := sSQL +
   'AND CON.IDCONTRATOEMPTMO  = HME.IDCONTRATOEMPTMO '                                       + #13 +
   'AND TCE.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO '                                      + #13 +
   'AND TEP.IDTIPOEMPTMO      = TCE.IDTIPOEMPTMO '                                           + #13 +
   'AND TMP.IDDESCONTO        = HME.IDCONTRATOEMPTMO '                                       + #13 +
   'AND TMP.IDPROVENTO        = HME.IDRUBRICA '                                              + #13 +
   'GROUP BY '                                                                               + #13 +
   '   HME.IDCONTRATOEMPTMO, '                                                               + #13 +
   '   HME.IDRUBRICA, '                                                                      + #13 +
   '   CON.MATRICULA, '                                                                      + #13 +
   '   CON.NOME, '                                                                           + #13 +
   '   HME.ITEDESCRICAO '                                                                    + #13;

   with dtmRelConfereEnvioFolhaAnal.qryConfereEnvioFolhaAnal do begin
      Close;
      SQL.Text := sSQL;
      Open;
   end;
end;



procedure TcfgRelConfereEnvioFolhaAnal.FormShow(Sender: TObject);
begin
   inherited;

   (* preenche a data de lançamento e o ano de referência/competência *)
   cboMes.ItemIndex        := DiasUteis.ExtraiMes(Date) - 1;
   DBspnAno.Value          := DiasUteis.ExtraiAno(Date);

   AbreQueries;

   (* Preenche a listbox de patrocinadoras... *)
   molListaPatro.PreenchePatro;
   (* ...e marca todas por default *)
   molListaPatrobtnMarcaTodosPatroClick(self);
end;



procedure TcfgRelConfereEnvioFolhaAnal.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
   with dtmLookEmptmo.qryLookTipoContrato do begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContrato);

      if DBcboTipoEmptmo.LookupValue <> '' then begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
      end;

      Open;

      DBcboTipoContrato.Enabled := True;
   end;
end;



procedure TcfgRelConfereEnvioFolhaAnal.DBcboTipoEmptmoExit(Sender: TObject);
begin
   inherited;

   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
   with dtmLookEmptmo.qryLookTipoContrato do begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContrato);

      if DBcboTipoEmptmo.LookupValue <> '' then begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
      end;

      Open;

      DBcboTipoContrato.Enabled := True;
   end;
end;



procedure TcfgRelConfereEnvioFolhaAnal.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TcfgRelConfereEnvioFolhaAnal.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



end.




