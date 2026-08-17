Unit FConsOrdemPagoMT;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Mask, CMProcuraSubTipo, Grids, Wwdbigrd,
  Wwdbgrid, Db, DBTables, Wwquery, Wwdatsrc, uCmSqlParams, DBClient,
  uCMClientDataSet, uCtrlParamIntegra;

Type
  TFrmConsOrdemPagoMT = Class(TfrmOkCancelar)
    RadioGroup1: TRadioGroup;
    CPForCli: TCMProcuraForCli;
    Label1: TLabel;
    msknumslip: TMaskEdit;
    dsDocLote: TwwDataSource;
    qryDocLote: TwwQuery;
    qryDocLoteNOME: TStringField;
    qryDocLoteHISTORICOCOMPL: TStringField;
    qryDocLoteNODOCUMENTO: TFloatField;
    qryDocLoteCOMPLDOCUMENTO: TStringField;
    qryDocLoteVALOR: TFloatField;
    qryDocLoteSALDO: TFloatField;
    qryDocLoteTIPODOC: TStringField;
    qryDocLoteDATAPROGRAMADA: TDateTimeField;
    qryDocLoteDATAVENCTO: TDateTimeField;
    qryDocLoteNUMLEITCODBARRAS: TStringField;
    qryDocLoteNUMDIGCODBARRAS: TStringField;
    qryDocLoteIDFORCLI: TFloatField;
    qryDocLoteOPERACAO: TStringField;
    qryDocLoteCODDOCUMENTO: TFloatField;
    qryDocLoteIDPESSOA: TFloatField;
    qryDocLoteRECPAG: TStringField;
    qryDocLoteSTATUS: TStringField;
    dsLote: TwwDataSource;
    qryLote: TwwQuery;
    qryLoteNUMLOTE: TFloatField;
    qryLoteCODPORTFORMA: TFloatField;
    qryLoteDATAEMISSAO: TDateTimeField;
    qryLoteNUMCHQBORDERO: TStringField;
    qryLoteFAVORECIDO: TStringField;
    qryLoteOBSERVACAO: TStringField;
    qryLoteDESCRICAO: TStringField;
    qryLoteIDPROCESSO: TFloatField;
    qryLoteFLAGEMISSAO: TStringField;
    qryLoteFLAGCANCEL: TStringField;
    bbtnSelecionaDoc: TBitBtn;
    Panel2: TPanel;
    Panel3: TPanel;
    wwDBGrid2: TwwDBGrid;
    PnlDisplay: TPanel;
    wwDBGrid1: TwwDBGrid;
    Panel1: TPanel;
    qryLoteNUMSLIP: TStringField;
    qryLoteVALORRETENCAO: TFloatField;
    qryLoteVALORLOTE: TFloatField;
    qryLoteVLTOT: TFloatField;
    CdsLote: TCMClientDataSet;
    SqlLote: TCMSqlParams;
    SqlDocLote: TCMSqlParams;
    CdsDocLote: TCMClientDataSet;
    Procedure msknumslipKeyPress(Sender: TObject; Var Key: Char);
    Procedure bbtnSelecionaDocClick(Sender: TObject);
    Procedure CPForCliChange(Sender: TObject);
    Procedure RadioGroup1Click(Sender: TObject);
    Procedure msknumslipChange(Sender: TObject);
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    Procedure CdsLoteAfterScroll(DataSet: TDataSet);
  private
    Procedure limpaquery;
    { Private declarations }
  public
    { Public declarations }
  End;

Var
  FrmConsOrdemPagoMT: TFrmConsOrdemPagoMT;

Implementation
Uses uSistema;
{$R *.DFM}

Procedure TFrmConsOrdemPagoMT.limpaquery;
Begin
  If CdsLote.isempty Then
    exit;
  SqlLote.sql.clear;
  SqlLote.sql.add('SELECT L.NUMSLIP ,L.NUMLOTE, L.CODPORTFORMA, L.DATAEMISSAO, L.NUMCHQBORDERO, L.FAVORECIDO,');
  SqlLote.sql.add(' DECODE(L.FLAGEMISSAO,1,''SIM'',''NÃO'') AS FLAGEMISSAO,');
  SqlLote.sql.add(' DECODE(L.FLAGCANCEL,NULL,''EM ABERTO'', ');
  SqlLote.sql.add(' DECODE(L.FLAGCANCEL,''B'',''BAIXADO'',  ');
  SqlLote.sql.add(' DECODE(L.FLAGCANCEL,''C'',''CANCELADO'',DECODE(L.FLAGCANCEL,''R'',''REGERADO'')))) AS FLAGCANCEL, ');
  SqlLote.sql.add(' L.OBSERVACAO,0 as valorretencao,0 as valorlote,0 as vltot, ');
  SqlLote.sql.add('P.DESCRICAO, L.IDPROCESSO  ');
  SqlLote.sql.add('FROM LOTEPAGTO L, PORTADORFORMA P ');
  SqlLote.sql.add('WHERE 1=2 ');
  SqlLote.open;
End;

Procedure TFrmConsOrdemPagoMT.msknumslipKeyPress(Sender: TObject;
  Var Key: Char);
Begin
  Inherited;
  If Not (key In ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']) Then
    key := chr(0);
End;

Procedure TFrmConsOrdemPagoMT.bbtnSelecionaDocClick(Sender: TObject);
Begin
  Inherited;
  SqlLote.sql.clear;
  SqlLote.sql.add('SELECT L.NUMSLIP ,L.NUMLOTE, L.CODPORTFORMA, L.DATAEMISSAO, L.NUMCHQBORDERO, L.FAVORECIDO,');
  SqlLote.sql.add(' DECODE(L.FLAGEMISSAO,1,''SIM'',''NÃO'') AS FLAGEMISSAO,');
  SqlLote.sql.add(' DECODE(L.FLAGCANCEL,NULL,''EM ABERTO'', ');
  SqlLote.sql.add(' DECODE(L.FLAGCANCEL,''B'',''BAIXADO'',  ');
  SqlLote.sql.add(' DECODE(L.FLAGCANCEL,''C'',''CANCELADO'',DECODE(L.FLAGCANCEL,''R'',''REGERADO'')))) AS FLAGCANCEL, ');
  SqlLote.sql.add(' L.OBSERVACAO,vlret.valorretencao,vl.valorlote,(VL.VALORLOTE+(vlret.valorretencao * -1)) as vltot ,');
  SqlLote.sql.add('P.DESCRICAO, L.IDPROCESSO  ');
  SqlLote.sql.add('FROM LOTEPAGTO L, PORTADORFORMA P,  ');
  SqlLote.sql.add('  (select l.numlote,(sum(decode(lanc.debcre,''C'',lanc.valor,-1*lanc.valor)))  as valorretencao ');
  SqlLote.sql.add('from lotexdocum l , lanctodocum lanc ,altximposto a ');
  SqlLote.sql.add(' where l.coddocumento=lanc.coddocumento ');
  SqlLote.sql.add('  and lanc.codalterador=a.codalterador');
  SqlLote.sql.add(' and a.codimposto=7  group by l.numlote ) vlret,');
  SqlLote.sql.add('  (SELECT L.NUMLOTE, SUM(L.VALOR) AS VALORLOTE FROM LOTEXDOCUM L  GROUP BY  NUMLOTE) VL');
  SqlLote.sql.add(
    ',(select count(*) as totdocum , numlote from lotexdocum ld , documento d where ' +
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

  SqlLote.sql.add('WHERE  L.NUMSLIP IS NOT NULL AND ');
  SqlLote.sql.add(
    '  totlote.totdocum=totdocum.totdocum and ' +
    ' totlote.numlote=totdocum.numlote and   totlote.numlote=  l.NUMLOTE  and ');

  SqlLote.sql.add(' L.NUMLOTE=vlret.numlote(+) and L.NUMLOTE=vl.numlote and  (L.CODPORTFORMA = P.CODPORTFORMA) ');
  If TRIM(CPForCli.TEXT) <> '' Then
    SqlLote.sql.add(' AND exists (select 1 from documento d,lotexdocum ld where d.idforcli= ' + INTTOSTR(CPForCli.ForCliReg.ID) +
      ' and ld.coddocumento=d.coddocumento and ld.numlote=l.numlote)');

  If RadioGroup1.ITEMINDEX = 1 Then
    SqlLote.sql.add('AND ((L.FLAGCANCEL=''C'') or (L.FLAGCANCEL=''R'') )')
  Else If RadioGroup1.ITEMINDEX = 2 Then
    SqlLote.sql.add('AND L.FLAGCANCEL=''B''')
  Else If RadioGroup1.ITEMINDEX = 3 Then
    SqlLote.sql.add('AND RTRIM(L.FLAGCANCEL) IS NULL');

  If trim(msknumslip.text) <> '' Then
    SqlLote.sql.add('and l.numslip=' + msknumslip.text);
  SqlLote.SQL.add('order by numslip');
  SqlLote.open;

  TFloatField(CdsLote.FieldByName('valorretencao')).DisplayFormat := '#,##0.00';
  TFloatField(CdsLote.FieldByName('valorlote')).DisplayFormat := '#,##0.00';
  TFloatField(CdsLote.FieldByName('vltot')).DisplayFormat := '#,##0.00';
End;

Procedure TFrmConsOrdemPagoMT.CPForCliChange(Sender: TObject);
Begin
  Inherited;
  LIMPAQUERY;
End;

Procedure TFrmConsOrdemPagoMT.RadioGroup1Click(Sender: TObject);
Begin
  Inherited;
  LIMPAQUERY;
End;

Procedure TFrmConsOrdemPagoMT.msknumslipChange(Sender: TObject);
Begin
  Inherited;
  LIMPAQUERY;
End;

Procedure TFrmConsOrdemPagoMT.FormClose(Sender: TObject;
  Var Action: TCloseAction);
Begin
  Inherited;
  CdsLote.Close;
  CdsDocLote.Close;
End;

Procedure TFrmConsOrdemPagoMT.CdsLoteAfterScroll(DataSet: TDataSet);
Begin
  Inherited;
  CdsDocLote.Close;
  SqlDocLote.Prepare;
  If Not CdsLote.FieldByName('NumLote').IsNull Then
    SqlDocLote.ParamByName('NumLote').AsInteger := CdsLote.FieldByName('NumLote').AsInteger;
  SqlDocLote.Open;
  TFloatField(CdsDocLote.FieldByName('SALDO')).DisplayFormat := '#,##0.00';
  TFloatField(CdsDocLote.FieldByName('VALOR')).DisplayFormat := '#,##0.00';
End;

End.

