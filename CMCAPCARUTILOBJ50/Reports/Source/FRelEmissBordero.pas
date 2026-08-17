{******************************************************************************}
{  Sistema - Contas a Pagar                                                    }
{  Unit    - FRelEmissBordero                                                  }
{------------------------------------------------------------------------------}
// Rotinas     : DlIniExit e DlFimExit
// Data        : 03/12/2009
// Autor       : Bruno Bastos
// Sol_Kintana : 128089_683708
// Descrição   : Inclusão dessas novas rotinas para não fazer mais query por data no evento change.
{------------------------------------------------------------------------------}
// Rotinas   : bbtnConfirmarClick
// Data      : 19/08/2004 (término)
// Autor     : David Ayrolla
// Pendência : 17221
// Descrição : Implementar processo RAD por lote ou por documento.
//------------------------------------------------------------------------------

Unit FRelEmissBordero;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, uCtrlParamIntegra,
  wwdblook, uMensErro, ppBands, ppCache, ppClass, ppComm, ppProd, ppReport, IvDictio,
  IvMulti, IvEMulti, wwdbdatetimepicker, CMDateTimePicker, fParamReports_Padrao,
  CmParamReport, DBClient, uCMClientDataSet, uCmSqlParams, Db;

Type
  TFrmRelEmissBordero = Class(TfrmParamReports_Padrao)
    Label1: TLabel;
    GroupBox1: TGroupBox;
    dblkLote: TwwDBLookupCombo;
    GroupBox2: TGroupBox;
    DlIni: TCMDateTimePicker;
    Label4: TLabel;
    DlFim: TCMDateTimePicker;
    GroupBox3: TGroupBox;
    dblkFormaPag: TwwDBLookupCombo;
    RgDataEmissao: TRadioGroup;
    DtEmis: TCMDateTimePicker;
    GroupBox4: TGroupBox;
    ChStatus: TCheckBox;
    SqlDescPortadorForma: TCMSqlParams;
    CdsDescPortadorForma: TCMClientDataSet;
    CdsLotePagto: TCMClientDataSet;
    SqlLotePagto: TCMSqlParams;
    Procedure bbtnConfirmarClick(Sender: TObject);
    Procedure bbtnSairClick(Sender: TObject);
    Procedure FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
    Procedure bbtnCancelarClick(Sender: TObject);
    Procedure FormActivate(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure DlIniChange(Sender: TObject);
    Procedure DlFimChange(Sender: TObject);
    Procedure dblkFormaPagCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    Procedure RgDataEmissaoClick(Sender: TObject);
    Procedure ChStatusClick(Sender: TObject);
    Procedure dblkLoteCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DlFimExit(Sender: TObject);
    procedure DlIniExit(Sender: TObject);
  private
    { Private declarations }
    sSql: String;
    bRepeteImpressao: Boolean;
    Procedure AbreLotePagto;
    Function entrada_validada: boolean;
  public
    { Public declarations }
  End;

Var
  FrmRelEmissBordero: TFrmRelEmissBordero;

Implementation

Uses uSIstema, uModulo, uDataBase;

{$R *.DFM}

Procedure TFrmRelEmissBordero.AbreLotePagto;
Begin
  sSQL := ' SELECT distinct lotepagto.NUMLOTE, LOTEPAGTO.CODPORTFORMA, FAVORECIDO, DESCRICAO, LOTEPAGTO.DATAEMISSAO ' + #13 +
    ' FROM LotePagto, PortadorForma, ' + #13 +
    '      Documento doc, lotexdocum lotex ' + #13 +
    '    ,(select count(*) as totdocum , numlote ' + #13 +
    '      from lotexdocum ld, documento d ' + #13 +
    '      where D.RECPAG  = ''' + ParamIntegra.RecPag + '''  AND ';
  If (Not ChStatus.Checked) And (self.tag = 1) Then
    sSQL := sSQL + ' ((LD.FLGBAIXA  IN (''N'',''R'',''B'')) OR (LD.FLGBAIXA IS NULL)  ) AND  '
  Else
    sSQL := sSQL + ' ((LD.FLGBAIXA  IN (''N'',''R''))  OR (LD.FLGBAIXA IS NULL)) AND  ';
  sSQL := sSQL + '  ld.CODDOCUMENTO = D.CODDOCUMENTO group by numlote  ) totdocum ' + #13 +
    '    ,(select count(*) as totdocum , numlote from lotexdocum ld , documento d where ' + #13 +
    '        D.RECPAG         = ''' + ParamIntegra.RecPag + '''  AND ';

  If (Not ChStatus.Checked) And (self.tag = 1) Then
    sSQL := sSQL + ' ((LD.FLGBAIXA  IN (''N'',''R'',''B''))  OR (LD.FLGBAIXA IS NULL) ) AND  '
  Else
    sSQL := sSQL + ' ((LD.FLGBAIXA  IN (''N'',''R''))  OR (LD.FLGBAIXA IS NULL)) AND  ';

  sSQL := sSQL +
    '         ld.CODDOCUMENTO = D.CODDOCUMENTO  and ' + #13 +
    '         d.codtipdoc in (SELECT CODTIPDOC FROM TIPODOCRECPAG a ' + #13 +
    '    WHERE a.RECPAG =   ''' + ParamIntegra.RecPag + ''' and not exists ' + #13 +
    '      (select 1 from UsuarioxTpdocto b where recpag=' + #39 + ParamIntegra.recpag + #39 +
    '    and b.idusuario=' + inttostr(sistema.IdUsuario) + ') ' + #13 +
    '  union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a ' + #13 +
    '            WHERE a.RECPAG =   ''' + ParamIntegra.RecPag + '''  and exists ' + #13 +
    '  (select 1 from UsuarioxTpdocto b where recpag=' + #39 + ParamIntegra.recpag + #39 +
    '       and a.codtipdoc=b.codtipdoc and b.idusuario=' + inttostr(sistema.idusuario) + ')) group by numlote  ) totlote ' +
    '     WHERE  totlote.totdocum=totdocum.totdocum and ' +
    '        totlote.numlote=totdocum.numlote and totlote.numlote=  lotepagto.NUMLOTE and ';
  If ChStatus.Checked Then
    sSql := sSql + ' (FLAGEMISSAO IS NULL OR  FLAGEMISSAO = ''0'') AND ';
  If (DlIni.text <> '') And (DlFim.text <> '') Then
    sSQL := sSQL + ' (LOTEPAGTO.DATAEMISSAO BETWEEN to_date(''' + DlIni.text + ''',''dd/MM/yyyy'')  and  to_date(''' + DlFim.text +
      ''',''dd/MM/yyyy'')) AND ';
  If dblkFormaPag.Text <> '' Then
    sSQL := sSQL + ' (LOTEPAGTO.CODPORTFORMA = ' + dblkFormaPag.LookupValue + ') AND ';
  sSQL := sSQL + '       (LOTEPAGTO.CODPORTFORMA = PORTADORFORMA.CODPORTFORMA) AND LotePagto.IDPESSOA = ' + InttoStr(sistema.IdEmpresa) +
    '    And (lotex.numlote       =  lotepagto.numlote)      and     ' +
    '        (lotex.coddocumento  =  doc.coddocumento) and (LotePagto.flagcancel <> ''C'' or LotePagto.flagcancel is null) and    ' +
    '        (DOC.RECPAG = ''' + ParamIntegra.RecPag + ''') ' +
    ' order by NUMLOTE';
  SqlLotePagto.SQL.Text := sSQL;
  SqlLotePagto.Open;
  dblkLote.Enabled := Not CdsLotePagto.IsEmpty;
End;

Function TFrmRelEmissBordero.entrada_validada: boolean;
Begin
  result := false;
  // Validação das Informações
  If dblkLote.text = '' Then
  Begin
    Msgdlg('Entre com o Número do Lote', 'Aviso', mterror, [mbOk], 0);
    If dblkLote.CanFocus Then
      dblkLote.setfocus;
    exit;
  End;
  If dblkFormaPag.text = '' Then
  Begin
    Msgdlg('Indique a forma de pagamento', 'Aviso', mterror, [mbOk], 0);
    If dblkFormaPag.CanFocus Then
      dblkFormaPag.setfocus;
    exit;
  End;
  result := true;
End;

Procedure TFrmRelEmissBordero.bbtnConfirmarClick(Sender: TObject);
Var
  sDataBorderoLocal: String;
Begin
  Inherited;

  //DAVID - Pendência 17221
  If Not Modulo.RadLoteLiberado( CdsLotePagto.FieldByName('NUMLOTE').AsInteger ) Then
  Begin
    Msgdlg('Este Lote não está liberado para impressão.', 'Aviso', mterror, [mbOk], 0);
    Exit;
  End;

  Case RgDataEmissao.ItemIndex Of
    0:
      Begin
        If Not CdsLotePagto.fieldByName('DATAEMISSAO').IsNull Then
          sDataBorderoLocal := CdsLotePagto.fieldByName('DATAEMISSAO').AsString
        Else
          sDataBorderoLocal := DateToStr(Date);
      End;
    1: sDataBorderoLocal := DtEmis.Text;
  End;

  If Not entrada_validada Then
  Begin
    exit;
    modalresult := mrcancel;
  End;

  modalresult := mrok;

  Modulo.LoteBordero := dblkLote.LookupValue;
  Modulo.CodPortForma := dblkFormaPag.LookupValue;
  Modulo.LancaFinan := CdsDescPortadorForma.FieldByName('LANCAFINANC').AsString;

  Cmp_Padrao.ParamValues[0].AsInteger := StrToInt(dblkLote.LookupValue);
  Cmp_Padrao.ParamValues[1].AsString := sDataBorderoLocal;
  Cmp_Padrao.ParamValues[2].AsInteger := StrToInt(dblkFormaPag.LookupValue);

End;

Procedure TFrmRelEmissBordero.bbtnSairClick(Sender: TObject);
Begin
  Inherited;
  bRepeteImpressao := False;
End;

Procedure TFrmRelEmissBordero.FormCloseQuery(Sender: TObject;
  Var CanClose: Boolean);
Begin
  Inherited;
  Canclose := Not bRepeteImpressao;
End;

Procedure TFrmRelEmissBordero.bbtnCancelarClick(Sender: TObject);
Begin
  Inherited;
  dblkLote.Text := '';
End;

Procedure TFrmRelEmissBordero.FormActivate(Sender: TObject);
Var
  sSqlLocal: String;
Begin
  Inherited;
  sSqlLocal := ' SELECT DESCRICAO, CODPORTFORMA,LANCAFINANC  ' +
    ' FROM ' + 'PORTADORFORMA                               ' +
    ' WHERE RECPAG = ''' + ParamIntegra.RecPag + '''' +
    ' and portadorforma.IDPESSOA=' + IntToStr(Sistema.idEmpresa) + ' ORDER BY DESCRICAO';
  SqlDescPortadorForma.SQL.Text := sSqlLocal;
  SqlDescPortadorForma.Open;
  AbreLotePagto;
End;

Procedure TFrmRelEmissBordero.FormCreate(Sender: TObject);
Begin
  Inherited;
  DtEmis.Date := Date;

// Daniel Simões - 26/01/2006 - Início------------------------------------------
  if ParamIntegra.Recpag = 'P' then
  begin
    HelpContext           := 30027;
    bbtnAjuda.HelpContext := 30027;
  end;
// Daniel Simões - 26/01/2006 - Fim---------------------------------------------

End;

Procedure TFrmRelEmissBordero.DlIniChange(Sender: TObject);
Begin
  Inherited;
  //Bruno Bastos - Sol.: 128089 - Kintana: 683708 - AbreLotePagto;
End;

Procedure TFrmRelEmissBordero.DlFimChange(Sender: TObject);
Begin
  Inherited;
  //Bruno Bastos - Sol.: 128089 - Kintana: 683708 - AbreLotePagto;
End;

Procedure TFrmRelEmissBordero.dblkFormaPagCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
Begin
  Inherited;
  AbreLotePagto;
End;

Procedure TFrmRelEmissBordero.RgDataEmissaoClick(Sender: TObject);
Begin
  Inherited;
  DtEmis.Enabled := (RgDataEmissao.ItemIndex = 1);
End;

Procedure TFrmRelEmissBordero.ChStatusClick(Sender: TObject);
Begin
  Inherited;
  AbreLotePagto;
End;

Procedure TFrmRelEmissBordero.dblkLoteCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
Begin
  Inherited;
  CdsDescPortadorForma.LOCATE('CODPORTFORMA', CdsLotePagto.FieldByName('CODPORTFORMA').AsString, []);
  dblkFormaPag.LOOKUPVALUE := CdsLotePagto.FieldByName('CODPORTFORMA').AsString;
  dblkFormaPag.TEXT := CdsDescPortadorFormA.FieldByName('DESCRICAO').AsString;
End;

//Bruno Bastos - Sol.: 128089 - Kintana: 683708 - Início
procedure TFrmRelEmissBordero.DlFimExit(Sender: TObject);
begin
  inherited;
  AbreLotePagto;
end;

procedure TFrmRelEmissBordero.DlIniExit(Sender: TObject);
begin
  inherited;
  AbreLotePagto;
end;
//Bruno Bastos - Sol.: 128089 - Kintana: 683708 - Fim

End.

