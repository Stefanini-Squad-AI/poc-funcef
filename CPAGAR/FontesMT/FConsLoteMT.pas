{===============================================================================
// Autor     : Marcus Oliveira
// Data      : 26/09/2007
// Pendência : 24927
// Descrição : Incluída uma coluna do status do documento e corrigido o cálculo do valor do lote.
//------------------------------------------------------------------------------}

Unit FConsLoteMT;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Wwdatsrc, MontaSelect, DBCtrls,
  uCmSqlParams, Db, DBClient, uCMClientDataSet, uCtrlParamIntegra, DBTables;

Type
  TfrmConsLoteMT = Class(TfrmSairAjuda)
    dbgrDocLote: TwwDBGrid;
    dsDocLote: TwwDataSource;
    msLote: TMontaSelect;
    dsLote: TwwDataSource;
    Label3: TLabel;
    DBText3: TDBText;
    Label8: TLabel;
    DBText8: TDBText;
    Label9: TLabel;
    DBText9: TDBText;
    Label10: TLabel;
    DBText10: TDBText;
    CdsDocLote: TCMClientDataSet;
    SqlDocLote: TCMSqlParams;
    SqlLote: TCMSqlParams;
    CdsLote: TCMClientDataSet;
    Cds: TCMClientDataSet;
    SqlCds: TCMSqlParams;
    PlnFixo: TPanel;
    bbtnSelecionaDoc: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    Label11: TLabel;
    lbldoc: TLabel;
    DBText11: TDBText;
    DBText5: TDBText;
    DBText4: TDBText;
    Label1: TLabel;
    lblPortadorForma: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    DBText1: TDBText;
    dblPortadorForma: TDBText;
    DBText2: TDBText;
    DBText6: TDBText;
    Label7: TLabel;
    Label12: TLabel;
    DBText7: TDBText;
    Bevel1: TBevel;
    Bevel2: TBevel;
    DBText12: TDBText;
    DBText13: TDBText;
    DBText14: TDBText;
    Label13: TLabel;
    Label14: TLabel;
    Procedure bbtnSelecionaDocClick(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
//    Procedure calculaValorTotal;
  public
    { Public declarations }
  End;

Var
  frmConsLoteMT: TfrmConsLoteMT;

Implementation

Uses uSistema, urad, uDataBase, DBaseDados, uModulo;
{$R *.DFM}

Procedure TfrmConsLoteMT.bbtnSelecionaDocClick(Sender: TObject);
var
   nop : String;
Begin
  Inherited;
  msLote.Executar;
  If msLote.RetornouValor Then
  Begin
    CdsLote.Close;
    SqlLote.Prepare;
    SqlLote.ParamByName('pNUMLOTE').AsInteger := StrToInt(msLote.ValoresChave[0]);
    SqlLote.Open;

    CdsDocLote.Close;
    SqlDocLote.Prepare;
    SqlDocLote.ParamByName('pNUMLOTE').AsInteger := StrToInt(msLote.ValoresChave[0]);
    SqlDocLote.Open;
    While Not CdsDocLote.Eof Do
    Begin
       nop := Modulo.PegaNumeroOP(CdsDocLote.FieldByName('CODDOCUMENTO').AsInteger);
       if Trim(nop) <> '' then
       begin
          CdsDocLote.Edit;
          CdsDocLote.FieldByName('NUMOP').AsString := nop;
          CdsDocLote.Post;
       end;
       CdsDocLote.Next;
    End;
    CdsDocLote.First;
//    TFloatField(CdsDocLote.FieldByName('VALOR')).DisplayFormat := '#,##0.00';
//    TFloatField(CdsDocLote.FieldByName('SALDO')).DisplayFormat := '#,##0.00';

    //pendência 24927 - 27/11/2007
    TFloatField(CdsLote.FieldByName('VALORLOTE')).DisplayFormat := '#,##0.00';
    TFloatField(CdsLote.FieldByName('VALABERTO')).DisplayFormat := '#,##0.00';
    TFloatField(CdsLote.FieldByName('VALPAGO')).DisplayFormat   := '#,##0.00';
//    calculaValorTotal;
  End;
End;

//pendência 24927 - 27/11/2007 - este método não é mais necessário
{
Procedure TfrmConsLoteMT.calculaValorTotal;
Var
  dvalor: double;
Begin
  dvalor := 0;
  CdsDocLote.First;
  While Not CdsDocLote.Eof Do
  Begin

  //Marcus Oliveira P.24927 26/09/2007
  if ( trim(CdsDocLote.FieldByName('OPERACAO').AsString ) = '5' ) and
     ( trim(CdsDocLote.FieldByName('ESTORNO').AsString) = '' )    then
    dvalor := dvalor + CdsDocLote.FieldByName('Valor').AsFloat;

  CdsDocLote.Next;
  End;
  LbValorTotal.Caption := FloatToStrf(dvalor, ffNumber, 14, 2);
  CdsDocLote.First;
End;
}

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

  CdsLote.Close;
  SqlLote.Prepare;
  If iNumLote > 0 Then
    SqlLote.ParamByName('pNUMLOTE').AsInteger := iNumLote;
  SqlLote.Open;

  CdsDocLote.Close;
  SqlDocLote.Prepare;
  If iNumLote > 0 Then
    SqlDocLote.ParamByName('pNUMLOTE').AsInteger := iNumLote;
  SqlDocLote.Open;
  //TFloatField(CdsDocLote.FieldByName('VALOR')).DisplayFormat := '#,##0.00';
  //TFloatField(CdsDocLote.FieldByName('SALDO')).DisplayFormat := '#,##0.00';
  //calculaValorTotal;
  
  //pendência 24927 - 27/11/2007
  TFloatField(CdsLote.FieldByName('VALORLOTE')).DisplayFormat := '#,##0.00';
  TFloatField(CdsLote.FieldByName('VALABERTO')).DisplayFormat := '#,##0.00';
  TFloatField(CdsLote.FieldByName('VALPAGO')).DisplayFormat   := '#,##0.00';

// Daniel Simões - 25/01/2006 - Início------------------------------------------
  if ParamIntegra.Recpag = 'P' then
  begin
    HelpContext           := 30069;
    bbtnAjuda.HelpContext := 30069;
  end;
// Daniel Simões - 25/01/2006 - Fim---------------------------------------------

End;

End.

