unit fconsordempago;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Mask, CMProcuraSubTipo, Grids, Wwdbigrd,
  Wwdbgrid, Db, DBTables, Wwquery, Wwdatsrc;

type
  Tfrmconsordempago = class(TfrmOkCancelar)
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
    procedure msknumslipKeyPress(Sender: TObject; var Key: Char);
    procedure bbtnSelecionaDocClick(Sender: TObject);
    procedure CPForCliChange(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure msknumslipChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
   procedure limpaquery;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmconsordempago: Tfrmconsordempago;

implementation
Uses uSistema,uintegraback;
{$R *.DFM}



procedure Tfrmconsordempago.limpaquery     ;
begin
   if qrylote.isempty then exit;
   qrylote.sql.clear  ;
   qrylote.sql.add('SELECT L.NUMSLIP ,L.NUMLOTE, L.CODPORTFORMA, L.DATAEMISSAO, L.NUMCHQBORDERO, L.FAVORECIDO,');
   qrylote.sql.add(' DECODE(L.FLAGEMISSAO,1,''SIM'',''NÃO'') AS FLAGEMISSAO,');
   qrylote.sql.add(' DECODE(L.FLAGCANCEL,NULL,''EM ABERTO'', ');
   qrylote.sql.add(' DECODE(L.FLAGCANCEL,''B'',''BAIXADO'',  ');
   qrylote.sql.add(' DECODE(L.FLAGCANCEL,''C'',''CANCELADO'',DECODE(L.FLAGCANCEL,''R'',''REGERADO'')))) AS FLAGCANCEL, ');
   qrylote.sql.add(' L.OBSERVACAO,0 as valorretencao,0 as valorlote,0 as vltot, ');
   qrylote.sql.add('P.DESCRICAO, L.IDPROCESSO  ');
   qrylote.sql.add('FROM LOTEPAGTO L, PORTADORFORMA P ');
   qrylote.sql.add('WHERE 1=2 ');
   qrylote.open;

 
end;

procedure Tfrmconsordempago.msknumslipKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if  not (key in ['0','1','2','3','4','5','6','7','8','9']) then
     key:=chr(0);
end;

procedure Tfrmconsordempago.bbtnSelecionaDocClick(Sender: TObject);
begin
  inherited;
   qrylote.sql.clear  ;
   qrylote.sql.add('SELECT L.NUMSLIP ,L.NUMLOTE, L.CODPORTFORMA, L.DATAEMISSAO, L.NUMCHQBORDERO, L.FAVORECIDO,');
   qrylote.sql.add(' DECODE(L.FLAGEMISSAO,1,''SIM'',''NÃO'') AS FLAGEMISSAO,');
   qrylote.sql.add(' DECODE(L.FLAGCANCEL,NULL,''EM ABERTO'', ');
   qrylote.sql.add(' DECODE(L.FLAGCANCEL,''B'',''BAIXADO'',  ');
   qrylote.sql.add(' DECODE(L.FLAGCANCEL,''C'',''CANCELADO'',DECODE(L.FLAGCANCEL,''R'',''REGERADO'')))) AS FLAGCANCEL, ');
   qrylote.sql.add(' L.OBSERVACAO,vlret.valorretencao,vl.valorlote,(VL.VALORLOTE+(vlret.valorretencao * -1)) as vltot ,');
   qrylote.sql.add('P.DESCRICAO, L.IDPROCESSO  ');
   qrylote.sql.add('FROM LOTEPAGTO L, PORTADORFORMA P,  ');
   qrylote.sql.add('  (select l.numlote,(sum(decode(lanc.debcre,''C'',lanc.valor,-1*lanc.valor)))  as valorretencao ');
   qrylote.sql.add('from lotexdocum l , lanctodocum lanc ,altximposto a ');
   qrylote.sql.add(' where l.coddocumento=lanc.coddocumento ');
   qrylote.sql.add('  and lanc.codalterador=a.codalterador' );
   qrylote.sql.add(' and a.codimposto=7  group by l.numlote ) vlret,');
   qrylote.sql.add('  (SELECT L.NUMLOTE, SUM(L.VALOR) AS VALORLOTE FROM LOTEXDOCUM L  GROUP BY  NUMLOTE) VL' );
   qrylote.sql.add(
          ',(select count(*) as totdocum , numlote from lotexdocum ld , documento d where '+
          '        D.RECPAG         = '''+ IntegraBack.RecPag +'''  AND '+
          '         ld.CODDOCUMENTO = D.CODDOCUMENTO group by numlote  ) totdocum '+

          ',(select count(*) as totdocum , numlote from lotexdocum ld , documento d where '+
          '        D.RECPAG         = '''+ IntegraBack.RecPag +'''  AND '+
          '         ld.CODDOCUMENTO = D.CODDOCUMENTO  and '+
          '         d.codtipdoc in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
                         IntegraBack.RecPag+''' and not exists  (select 1 from UsuarioxTpdocto b where recpag='+#39+integraback.recpag+#39+' and b.idusuario=' +
                         inttostr(sistema.IdUsuario)+') union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
                         IntegraBack.RecPag+ '''  and exists (select 1 from UsuarioxTpdocto b where recpag='+#39+integraback.recpag+#39+' and a.codtipdoc=b.codtipdoc and b.idusuario=' +
                         inttostr(sistema.idusuario)+')) group by numlote  ) totlote ');


   qrylote.sql.add('WHERE  L.NUMSLIP IS NOT NULL AND ');
   qrylote.sql.add(
          '  totlote.totdocum=totdocum.totdocum and '+
          ' totlote.numlote=totdocum.numlote and   totlote.numlote=  l.NUMLOTE  and ');

   qrylote.sql.add(' L.NUMLOTE=vlret.numlote(+) and L.NUMLOTE=vl.numlote and  (L.CODPORTFORMA = P.CODPORTFORMA) ');
   IF TRIM(CPForCli.TEXT) <> '' THEN
      qrylote.sql.add(' AND exists (select 1 from documento d,lotexdocum ld where d.idforcli= '+INTTOSTR(CPForCli.ForCliReg.ID)  +' and ld.coddocumento=d.coddocumento and ld.numlote=l.numlote)');

   IF RadioGroup1.ITEMINDEX=1 THEN
      qrylote.sql.add('AND ((L.FLAGCANCEL=''C'') or (L.FLAGCANCEL=''R'') )')
   ELSE IF RadioGroup1.ITEMINDEX=2 THEN
     qrylote.sql.add('AND L.FLAGCANCEL=''B''')
   ELSE IF RadioGroup1.ITEMINDEX=3 THEN
     qrylote.sql.add('AND RTRIM(L.FLAGCANCEL) IS NULL')  ;


  if trim(msknumslip.text)<>'' then
     qrylote.sql.add('and l.numslip='+ msknumslip.text);
  qrylote.SQL.add('order by numslip');   
  qrylote.open;
  qryDOClote.open;
end;

procedure Tfrmconsordempago.CPForCliChange(Sender: TObject);
begin
  inherited;
LIMPAQUERY;
end;

procedure Tfrmconsordempago.RadioGroup1Click(Sender: TObject);
begin
  inherited;
  LIMPAQUERY;
end;

procedure Tfrmconsordempago.msknumslipChange(Sender: TObject);
begin
  inherited;
LIMPAQUERY;
end;

procedure Tfrmconsordempago.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
QRYLOTE.CLOSE;
QRYDOCLOTE.CLOSE;
end;

end.
