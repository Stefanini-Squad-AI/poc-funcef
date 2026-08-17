// Atualizado por: André Tavares - 27/01/2004 - pendência 14974 - Criação do filtro Usuários.


Unit FRelPosiFornCli;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  Db, DBTables, TREdit, uCtrlParamIntegra, fParamReports_Padrao, CmParamReport,
  MontaSelect, IvDictio, IvMulti, IvEMulti, CMProcuraSubTipo, CMProcuraMask,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook, FProcuraCliFor, {$IFDEF VER0505}uComum,
{$ELSE}uCMTypes{$ENDIF}, uCmSqlParams, DBClient, uCMClientDataSet;

Type
  TFrmRelPosiFornCli = Class(TfrmParamReports_Padrao)
    GroupBox1: TGroupBox;
    cbAtrasados: TCheckBox;
    GpJuros: TGroupBox;
    Label8: TLabel;
    CkbImpValorJuros: TCheckBox;
    ReTaxaJuros: TRealEdit;
    cbCalcJuros: TCheckBox;
    GpTipoCli: TGroupBox;
    CbCli: TwwDBLookupCombo;
    GroupBox3: TGroupBox;
    dblcTipoDoc: TwwDBLookupCombo;
    CkbAdianto: TCheckBox;
    RgOrdem: TRadioGroup;
    CContabil: TCMProcuraMaskContabil;
    DtFim: TCMDateTimePicker;
    Label1: TLabel;
    Bevel1: TBevel;
    CdsTipoDoc: TCMClientDataSet;
    SqlTipoDoc: TCMSqlParams;
    CdsTipoCli: TCMClientDataSet;
    SqlTipoCli: TCMSqlParams;
    CPForCli: TCMProcuraForCli;
    GroupBox2: TGroupBox;
    DblkUsuarios: TwwDBLookupCombo;
    SqlUsuarios: TCMSqlParams;
    CdsUsuarios: TCMClientDataSet;
    Procedure bbtnConfirmarClick(Sender: TObject);
    Procedure FormActivate(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure CContabilExit(Sender: TObject);
    Procedure CContabilApertouBotao(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  End;

Var
  FrmRelPosiFornCli: TFrmRelPosiFornCli;

Implementation

Uses
  uSistema, uModulo, uDataBase, uString;

{$R *.DFM}

Procedure TFrmRelPosiFornCli.bbtnConfirmarClick(Sender: TObject);
Begin
  Inherited;
  Cmp_Padrao.ParamValues[0].AsBoolean := False;
  If ((CContabil.Valida = VcOk) And (ParamIntegra.IntegraContab)) Or (ParamIntegra.IntegraContab) Then
  Begin
    Cmp_Padrao.ParamValues[0].AsBoolean := True;
    Cmp_Padrao.ParamValues[1].AsBoolean := CkbAdianto.Checked;
    Cmp_Padrao.ParamValues[2].AsBoolean := cbAtrasados.Checked;
    Cmp_Padrao.ParamValues[3].AsBoolean := cbCalcJuros.Checked;
    Cmp_Padrao.ParamValues[4].AsBoolean := CkbImpValorJuros.Checked;
    Cmp_Padrao.ParamValues[5].AsString := DtFim.Text;
    Cmp_Padrao.ParamValues[6].AsString := dblcTipoDoc.Text;
    Cmp_Padrao.ParamValues[7].AsString := CbCli.Text;
    Cmp_Padrao.ParamValues[8].AsString := CContabil.Conta.Numero;
    Cmp_Padrao.ParamValues[9].AsString := CPForCli.Text;
    Cmp_Padrao.ParamValues[10].AsString := CPForCli.ForCliReg.RazaoSocial;
    Cmp_Padrao.ParamValues[11].AsString := dblcTipoDoc.LookupValue;
    Cmp_Padrao.ParamValues[12].AsString := CbCli.LookupValue;
    Cmp_Padrao.ParamValues[13].AsString := CContabil.Conta.Nome;
    Cmp_Padrao.ParamValues[14].AsString := FloatToStr(ReTaxaJuros.Value);
    Cmp_Padrao.ParamValues[15].AsString := IntToStr(RgOrdem.ItemIndex);
    Cmp_Padrao.ParamValues[16].AsString := IntToStr(CPForCli.ForCliReg.Id);
    // início - andre tavares - pendência 14794 - 27/01/2004
    Cmp_Padrao.ParamValues[17].AsString := DblkUsuarios.LookupValue;
    // fim - andre tavares - pendência 14794 - 27/01/2004
  End
  else
    Cmp_Padrao.ParamValues[0].AsBoolean := False;
End;

Procedure TFrmRelPosiFornCli.FormActivate(Sender: TObject);
Var
  sSql: String;
Begin
  Inherited;

  If ParamIntegra.RecPag = 'R' Then
  Begin
    sSQL := '(SELECT CODTIPDOC,DESCRICAO,DEBCRE FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
      ParamIntegra.RecPag +
      ''' and not exists  (select 1 from UsuarioxTpdocto b where recpag=' + #39 +
      ParamIntegra.recpag + #39 +
      ' and b.idusuario=' + inttostr(sistema.IdUsuario) + ') ' +
      ' union  SELECT CODTIPDOC,DESCRICAO,DEBCRE  FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
      ParamIntegra.RecPag +
      '''  and exists (select 1 from UsuarioxTpdocto b where recpag=' + #39 +
      ParamIntegra.recpag + #39 +
      ' and a.codtipdoc=b.codtipdoc and b.idusuario=' + inttostr(sistema.idusuario) +
      ')) ORDER BY DEBCRE DESC,DESCRICAO';
    SqlTipoCli.Open;
  End
  Else
    sSQL := '(SELECT CODTIPDOC,DESCRICAO,DEBCRE FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
      ParamIntegra.RecPag +
      ''' and not exists  (select 1 from UsuarioxTpdocto b where recpag=' + #39 +
      ParamIntegra.recpag + #39 +
      ' and b.idusuario=' + inttostr(sistema.IdUsuario) + ') ' +
      ' union  SELECT CODTIPDOC,DESCRICAO,DEBCRE  FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
      ParamIntegra.RecPag +
      '''  and exists (select 1 from UsuarioxTpdocto b where recpag=' + #39 +
      ParamIntegra.recpag + #39 +
      ' and a.codtipdoc=b.codtipdoc and b.idusuario=' + inttostr(sistema.idusuario) +
      '))  ORDER BY DEBCRE,DESCRICAO';
  SqlTipoDoc.SQL.Text := sSql;
  SqlTipoDoc.Open;

  DtFim.Text := DateToStr(Date);

  // início - André Tavares - 27/01/2004 - pendência 14974
  SqlUsuarios.Open
  // fim    - André Tavares - 27/01/2004 - pendência 14974

End;

Procedure TFrmRelPosiFornCli.FormCreate(Sender: TObject);
Begin
  Inherited;
  If ParamIntegra.IntegraContab Then
  Begin
    CContabil.Plano := ParamIntegra.Plano;
    CContabil.Mascara := ParamIntegra.MascaraPlano;
  End;

  If ParamIntegra.RecPag = 'P' Then
  Begin
    Height := 279;
    Caption := 'Parâmetros do Relatório Posição por Fornecedor';
    GpTipoCli.Visible := False;
    GpJuros.Visible := False;
  End;
End;

Procedure TFrmRelPosiFornCli.CContabilExit(Sender: TObject);
Begin
  Inherited;
  CContabil.AceitaTipoConta := SoAnalitica;
End;

Procedure TFrmRelPosiFornCli.CContabilApertouBotao(Sender: TObject);
Begin
  Inherited;
  CContabil.AceitaTipoConta := Indiferente;
End;

End.

