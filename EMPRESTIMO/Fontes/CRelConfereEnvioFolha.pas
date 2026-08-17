unit CRelConfereEnvioFolha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
  TB97, ExtCtrls, mContratoEmptmo, Mask, wwdbedit, Wwdbspin, CheckLst,
  wwdblook, db, fcCombo, fcColorCombo, mListaPatro;

type
   TcfgRelConfereEnvioFolha = class(TcfgRel)
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
  cfgRelConfereEnvioFolha: TcfgRelConfereEnvioFolha;



implementation
{$R *.DFM}
uses
   DLookEmptmo,
   UDiasUteis,
   USistema,
   UfuncoesEmptmo, dRelConfereEnvioFolha,
   uMensErro;




procedure TcfgRelConfereEnvioFolha.AbreQueries;
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



procedure TcfgRelConfereEnvioFolha.MontaQuery;
begin
   inherited;

   with dtmRelConfereEnvioFolha do begin

      sCompetencia   := cboMes.Text + '/' + DBspnAno.Text;

      bSeparador     := chkLinhas.Checked;

      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      bCorlinha      := chkCorLinha.Checked;
      CorLinha       := cboCorLinha.SelectedColor;

   end;

   FiltraRelatorio;
end;



procedure TcfgRelConfereEnvioFolha.FiltraRelatorio;
var
   sSQL  : string;
begin
   sSQL :=
   'SELECT '                                                               + #13 +
   '  P.NOME, '                                                            + #13 +
   '  X.IDPROVENTO, '                                                      + #13 +
   '  X.DESCRICAO, '                                                       + #13 +
   '  NVL(X.VALOR, 0) VALOR, '                                             + #13 +
   '  NVL(X.QTDCONTRATO, 0) QTDCONTRATO, '                                 + #13 +
   '  NVL(X.QTDREGISTRO, 0) QTDREGISTRO '                                  + #13 +
   'FROM '                                                                 + #13 +
   '  PESSOA P, '                                                          + #13 +
   '  PATRO F, '                                                           + #13 +
   '  PROVDESC R, '                                                        + #13 +
   '  ( '                                                                  + #13 +
   '  SELECT '                                                             + #13 +
   '     T.IDPATRO, '                                                      + #13 +
   '     R.IDPROVENTO, '                                                   + #13 +
   '     R.DESCRICAO, '                                                    + #13 +
   '     NVL(T.VALOR, 0) VALOR, '                                          + #13 +
   '     NVL(T.QTDCONTRATO, 0) QTDCONTRATO, '                              + #13 +
   '     NVL(T.QTDREGISTRO, 0) QTDREGISTRO '                               + #13 +
   '  FROM '                                                               + #13 +
   '     PROVDESC R, '                                                     + #13 +
   '     ( '                                                               + #13 +
   '     SELECT '                                                          + #13 +
   '        C.IDPATRO, '                                                   + #13 +
   '        H.IDRUBRICA, '                                                 + #13 +
   '        SUM(H.HMEVLRPREVISTO) VALOR, '                                 + #13 +
   '        COUNT(H.IDCONTRATOEMPTMO) QTDCONTRATO, '                       + #13 +
   '        COUNT(H.IDCONTRATOEMPTMO) QTDREGISTRO '                        + #13 +
   '     FROM '                                                            + #13 +
   '        HISTMOVEMPTMO H, CONTRATOEMPTMO C, '                           + #13 +
   '        TIPOCONTREMPTMO TC, TIPOEMPTMO TE '                            + #13 +
   '     WHERE '                                                           + #13 +
   '            H.HMEFORMACOBRANCA  = ''F'' '                              + #13 +
   '        AND H.FLGENVIO          IS NULL '                              + #13 +
   '        AND H.HMEANOCOBRANCA    = ' + NumeroIngles(DBspnAno.Value)     + #13 +
   '        AND H.HMEMESCOBRANCA    = ' + IntToStr(cboMes.ItemIndex + 1)   + #13 +
   '        AND TE.IDEMPRESAPROP    = ' + IntToStr(Sistema.IDEmpresa)      + #13;

   (* filtro por Tipo de Empréstimo *)
   if DBcboTipoEmptmo.LookupValue <> '' then begin
      sSQL := sSQL +
   '        AND TC.IDTIPOEMPTMO       = ' + DBcboTipoEmptmo.LookupValue    + #13 +
   '        AND TE.IDTIPOEMPTMO       = ' + DBcboTipoEmptmo.LookupValue    + #13;
   end;

   (* filtro por Tipo de Contrato *)
   if DBcboTipoContrato.LookupValue <> '' then begin
      sSQL := sSQL +
   '        AND C.IDTIPOCONTREMPTMO   = ' + DBcboTipoContrato.LookupValue  + #13 +
   '        AND TC.IDTIPOCONTREMPTMO  = ' + DBcboTipoContrato.LookupValue  + #13;
   end;

   sSQL := sSQL +
   '        AND H.IDCONTRATOEMPTMO  = C.IDCONTRATOEMPTMO '                 + #13 +
   '        AND C.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO '               + #13 +
   '        AND TC.IDTIPOEMPTMO     = TE.IDTIPOEMPTMO '                    + #13 +
   '     GROUP BY '                                                        + #13 +
   '        C.IDPATRO, H.IDRUBRICA '                                       + #13 +
   '     ) T '                                                             + #13 +
   '  WHERE '                                                              + #13 +
   '     R.IDPROVENTO = T.IDRUBRICA(+) '                                   + #13 +
   '  ) X '                                                                + #13 +
   'WHERE '                                                                + #13 +
   '      X.IDPATRO     IN (' + molListaPatro.PegaPatro + ') '             + #13;

   if DBcboRubrica.Text <> '' then begin
      sSQL := sSQL +
   '  AND X.IDPROVENTO  = ' + DBcboRubrica.LookupValue                     + #13;
   end;

   sSQL := sSQL +
   '  AND P.IDPESSOA    = F.IDPESSOA '                                     + #13 +
   '  AND F.IDPESSOA    = X.IDPATRO '                                      + #13 +
   '  AND R.IDPROVENTO  = X.IDPROVENTO '                                   + #13 +

   'ORDER BY '                                                             + #13 +
   '  P.NOME, X.DESCRICAO ';

   with dtmRelConfereEnvioFolha.qryConfereEnvioFolha do begin
      Close;
      SQL.Text := sSQL;
      Open;
   end;
end;



procedure TcfgRelConfereEnvioFolha.FormShow(Sender: TObject);
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



procedure TcfgRelConfereEnvioFolha.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
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



procedure TcfgRelConfereEnvioFolha.DBcboTipoEmptmoExit(Sender: TObject);
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



procedure TcfgRelConfereEnvioFolha.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TcfgRelConfereEnvioFolha.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



end.




