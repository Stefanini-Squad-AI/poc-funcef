Unit FConsLoteMT;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Wwdatsrc, MontaSelect, DBCtrls,
  uCmSqlParams, Db, DBClient, uCMClientDataSet, uCtrlParamIntegra;

Type
  TfrmConsLoteMT = Class(TfrmSairAjuda)
    dbgrDocLote: TwwDBGrid;
    lbldoc: TLabel;
    dsDocLote: TwwDataSource;
    msLote: TMontaSelect;
    bbtnSelecionaDoc: TBitBtn;
    dblPortadorForma: TDBText;
    dsLote: TwwDataSource;
    lblPortadorForma: TLabel;
    Label1: TLabel;
    DBText1: TDBText;
    Label2: TLabel;
    DBText2: TDBText;
    Label3: TLabel;
    DBText3: TDBText;
    Label4: TLabel;
    DBText4: TDBText;
    Label5: TLabel;
    DBText5: TDBText;
    Label6: TLabel;
    DBText6: TDBText;
    Label7: TLabel;
    DBText7: TDBText;
    Label8: TLabel;
    DBText8: TDBText;
    Label9: TLabel;
    DBText9: TDBText;
    Label10: TLabel;
    DBText10: TDBText;
    Label11: TLabel;
    DBText11: TDBText;
    CdsDocLote: TCMClientDataSet;
    SqlDocLote: TCMSqlParams;
    SqlLote: TCMSqlParams;
    CdsLote: TCMClientDataSet;
    Cds: TCMClientDataSet;
    SqlCds: TCMSqlParams;
    Label12: TLabel;
    LbValorTotal: TLabel;
    Procedure bbtnSelecionaDocClick(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Procedure calculaValorTotal;
  public
    { Public declarations }
  End;

Var
  frmConsLoteMT: TfrmConsLoteMT;

Implementation

Uses uSistema, urad, uDataBase, DBaseDados;
{$R *.DFM}

Procedure TfrmConsLoteMT.bbtnSelecionaDocClick(Sender: TObject);
Begin
  Inherited;
  msLote.Executar;
  If msLote.RetornouValor Then
  Begin
    //
    CdsLote.Close;
    SqlLote.Prepare;
    SqlLote.ParamByName('pNUMLOTE').AsInteger := StrToInt(msLote.ValoresChave[0]);
    SqlLote.Open;
    //
    CdsDocLote.Close;
    SqlDocLote.Prepare;
    SqlDocLote.ParamByName('pNUMLOTE').AsInteger := StrToInt(msLote.ValoresChave[0]);
    SqlDocLote.Open;
    TFloatField(CdsDocLote.FieldByName('VALOR')).DisplayFormat := '#,##0.00';
    TFloatField(CdsDocLote.FieldByName('SALDO')).DisplayFormat := '#,##0.00';
    calculaValorTotal;
  End;
End;

Procedure TfrmConsLoteMT.calculaValorTotal;
Var
  dvalor: double;
Begin
  dvalor := 0;
  CdsDocLote.First;
  While Not CdsDocLote.Eof Do
  Begin
    dvalor := dvalor + CdsDocLote.FieldByName('Valor').AsFloat;
    CdsDocLote.Next;
  End;
  LbValorTotal.Caption := FloatToStrf(dvalor, ffNumber, 14, 2);
  CdsDocLote.First;
End;

Procedure TfrmConsLoteMT.FormCreate(Sender: TObject);
Var
  iNumLote: LongInt;
Begin
  Inherited;
  bbtnSelecionaDoc.Enabled := True;
  If (Sistema.idrad <> 0) Then
  Begin
    SqlCds.SQL.Text := 'SELECT NUMLOTE FROM LOTEPAGTO WHERE IDPROCESSO = ' + IntToStr(Sistema.idrad);
    SqlCds.Open;
    If Not Cds.Eof Then
    Begin
      iNumLote := Cds.FieldByName('NUMLOTE').AsInteger;
      bbtnSelecionaDoc.Enabled := False;
    End
    Else
      iNumLote := -1;

    Cds.Close;
  End
  Else
    iNumLote := -1;

  msLote.Filtro.Add('LOTEPAGTO.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
  msLote.Tabelas.add('(select count(*) as totdocum , numlote from lotexdocum ld , documento d where ' +
    '        D.RECPAG         = ''' + ParamIntegra.RecPag + '''  AND ' +
    '         ld.CODDOCUMENTO = D.CODDOCUMENTO group by numlote  ) totdocum ' +

    ',(select count(*) as totdocum , numlote from lotexdocum ld , documento d where ' +
    '        D.RECPAG         = ''' + ParamIntegra.RecPag + '''  AND ' +
    '         ld.CODDOCUMENTO = D.CODDOCUMENTO  and ' +
    '         d.codtipdoc in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
    ParamIntegra.RecPag + ''' and not exists  (select 1 from UsuarioxTpdocto b where recpag=' + #39 + ParamIntegra.recpag + #39 +
    ' and b.idusuario=' +
    inttostr(sistema.IdUsuario) + ') union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
    ParamIntegra.RecPag + '''  and exists (select 1 from UsuarioxTpdocto b where recpag=' + #39 + ParamIntegra.recpag + #39 +
    ' and a.codtipdoc=b.codtipdoc and b.idusuario=' +
    inttostr(sistema.idusuario) + ')) group by numlote  ) totlote ');
  msLote.Filtro.Add('  totlote.totdocum=totdocum.totdocum and ' +
    ' totlote.numlote=totdocum.numlote and   totlote.numlote=  lotepagto.NUMLOTE  ');

  //
  CdsLote.Close;
  SqlLote.Prepare;
  If iNumLote > 0 Then
    SqlLote.ParamByName('pNUMLOTE').AsInteger := iNumLote;
  SqlLote.Open;
  //
  CdsDocLote.Close;
  SqlDocLote.Prepare;
  If iNumLote > 0 Then
    SqlDocLote.ParamByName('pNUMLOTE').AsInteger := iNumLote;
  SqlDocLote.Open;
  TFloatField(CdsDocLote.FieldByName('VALOR')).DisplayFormat := '#,##0.00';
  TFloatField(CdsDocLote.FieldByName('SALDO')).DisplayFormat := '#,##0.00';
  calculaValorTotal;
End;

End.

