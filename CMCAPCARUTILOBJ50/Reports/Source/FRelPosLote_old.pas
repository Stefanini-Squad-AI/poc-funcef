{******************************************************************************}
{  Sistema - Contas a Pagar                                                    }
{  Unit    - FRelEmissBordero                                                  }
{------------------------------------------------------------------------------}
// Rotinas   : bbtnConfirmarClick
// Data      : 19/08/2004 (término)
// Autor     : David Ayrolla
// Pendência : 17221
// Descrição : Implementar processo RAD por lote ou por documento.
//------------------------------------------------------------------------------

Unit FRelPosLote;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, uCtrlParamIntegra,
  wwdblook, uMensErro, ppBands, ppCache, ppClass, ppComm, ppProd, ppReport, IvDictio,
  IvMulti, IvEMulti, wwdbdatetimepicker, CMDateTimePicker, fParamReports_Padrao,
  CmParamReport, DBClient, uCMClientDataSet, uCmSqlParams, Db;

Type
  TFrmRelPosLote = Class(TfrmParamReports_Padrao)
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
  FrmRelPosLote: TFrmRelPosLote;

Implementation

Uses uSIstema, uModulo, uDataBase;

{$R *.DFM}

Procedure TFrmRelPosLote.AbreLotePagto;
Begin
  sSQL := ' SELECT distinct lotepagto.NUMLOTE, LOTEPAGTO.CODPORTFORMA, FAVORECIDO, DESCRICAO, LOTEPAGTO.DATAEMISSAO ' + #13 +
    ' FROM LotePagto, PortadorForma, ' + #13 +
    '      Documento doc, lotexdocum lotex ' + #13 +
    '    ,(select count(*) as totdocum , numlote ' + #13 +
    '      from lotexdocum ld, documento d ' + #13 +
    '      where D.RECPAG  = ''' + ParamIntegra.RecPag + '''  AND ';
  If (self.tag = 1) Then
    sSQL := sSQL + ' ((LD.FLGBAIXA  IN (''N'',''R'',''B'')) OR (LD.FLGBAIXA IS NULL)  ) AND  '
  Else
    sSQL := sSQL + ' ((LD.FLGBAIXA  IN (''N'',''R''))  OR (LD.FLGBAIXA IS NULL)) AND  ';
  sSQL := sSQL + '  ld.CODDOCUMENTO = D.CODDOCUMENTO group by numlote  ) totdocum ' + #13 +
    '    ,(select count(*) as totdocum , numlote from lotexdocum ld , documento d where ' + #13 +
    '        D.RECPAG         = ''' + ParamIntegra.RecPag + '''  AND ';

  If  (self.tag = 1) Then
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
    '        totlote.numlote=totdocum.numlote and totlote.numlote=  lotepagto.NUMLOTE and '+
    ' (FLAGEMISSAO IS NULL OR  FLAGEMISSAO = ''0'') AND ';
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

Function TFrmRelPosLote.entrada_validada: boolean;
Begin
  result := false;
  //##
  // Validação das Informações
//  If dblkLote.text = '' Then
  //Begin
  //  Msgdlg('Entre com o Número do Lote', 'Aviso', mterror, [mbOk], 0);
  //  If dblkLote.CanFocus Then
  //    dblkLote.setfocus;
  //  exit;
  //End;
  If dblkFormaPag.text = '' Then
  Begin
    Msgdlg('Indique a forma de pagamento', 'Aviso', mterror, [mbOk], 0);
    If dblkFormaPag.CanFocus Then
      dblkFormaPag.setfocus;
    exit;
  End;
  result := true;
End;

Procedure TFrmRelPosLote.bbtnConfirmarClick(Sender: TObject);
Var
  sDataBorderoLocal: String;
Begin
  Inherited;

  //DAVID - Pendência 17221
  //If Not Modulo.ProcessoRadLiberado(CdsLotePagto.FieldByName('NUMLOTE').AsInteger) Then
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

 // Cmp_Padrao.ParamValues[0].AsInteger := StrToInt(dblkLote.LookupValue);
  Cmp_Padrao.ParamValues[1].AsString := sDataBorderoLocal;
  Cmp_Padrao.ParamValues[2].AsInteger := StrToInt(dblkFormaPag.LookupValue);

End;

Procedure TFrmRelPosLote.bbtnSairClick(Sender: TObject);
Begin
  Inherited;
  bRepeteImpressao := False;
End;

Procedure TFrmRelPosLote.FormCloseQuery(Sender: TObject;
  Var CanClose: Boolean);
Begin
  Inherited;
  Canclose := Not bRepeteImpressao;
End;

Procedure TFrmRelPosLote.bbtnCancelarClick(Sender: TObject);
Begin
  Inherited;
  dblkLote.Text := '';
End;

Procedure TFrmRelPosLote.FormActivate(Sender: TObject);
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

Procedure TFrmRelPosLote.FormCreate(Sender: TObject);
Begin
  Inherited;
  DtEmis.Date := Date;

// Daniel Simões - 26/01/2006 - Início------------------------------------------
  if ParamIntegra.Recpag = 'P' then
  begin
    HelpContext           := 30027;
    bbtnAjuda.HelpContext := 30027;
  end
  else
  begin
    // OBS.: Não mexi no Help Context do Contas a Receber...
//    HelpContext           := 40034;
//    bbtnAjuda.HelpContext := 40034;
  end;
// Daniel Simões - 26/01/2006 - Fim---------------------------------------------

End;

Procedure TFrmRelPosLote.DlIniChange(Sender: TObject);
Begin
  Inherited;
  AbreLotePagto;
End;

Procedure TFrmRelPosLote.DlFimChange(Sender: TObject);
Begin
  Inherited;
  AbreLotePagto;
End;

Procedure TFrmRelPosLote.dblkFormaPagCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
Begin
  Inherited;
  AbreLotePagto;
End;

Procedure TFrmRelPosLote.RgDataEmissaoClick(Sender: TObject);
Begin
  Inherited;
  DtEmis.Enabled := (RgDataEmissao.ItemIndex = 1);
End;

Procedure TFrmRelPosLote.ChStatusClick(Sender: TObject);
Begin
  Inherited;
  AbreLotePagto;
End;

Procedure TFrmRelPosLote.dblkLoteCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
Begin
  Inherited;
  CdsDescPortadorForma.LOCATE('CODPORTFORMA', CdsLotePagto.FieldByName('CODPORTFORMA').AsString, []);
  dblkFormaPag.LOOKUPVALUE := CdsLotePagto.FieldByName('CODPORTFORMA').AsString;
  dblkFormaPag.TEXT := CdsDescPortadorFormA.FieldByName('DESCRICAO').AsString;
End;

End.

