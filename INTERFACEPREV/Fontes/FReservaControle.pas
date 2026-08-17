unit FReservaControle;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, DBTables, Wwquery, ComCtrls;

type
  TfrmReservaControle = class(TfrmOkCancelar)
    BitBtn1: TBitBtn;
    pb: TProgressBar;
    qry: TwwQuery;
    qryAux: TwwQuery;
    qryPatroCombo: TwwQuery;
    lblPatrocinadora: TLabel;
    dblkPatrocinadora: TwwDBLookupCombo;
    Label1: TLabel;
    lbltexto: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReservaControle: TfrmReservaControle;

implementation

uses DBaseDados, UAdmPrev;

{$R *.DFM}

procedure TfrmReservaControle.BitBtn1Click(Sender: TObject);
var sIdTipoReserva, sIdPessoaAnt, sValorCotas : String;
   dValorCotas , bValorReal : Double;
begin
  inherited;
  if trim(dblkPatrocinadora.text) = '' then
  begin
     showmessage('Esqueceu a patro mané!');
     dblkPatrocinadora.setfocus;
     exit;
  end;
  pb.Position := 0;


  try
     dtmBaseDados.dbBaseDados.starttransaction;


     {contas de controle
     plano   - reserva
     3         17
     33        58
     37        15
     40        44
     44        73}
     if qrypatrocombo.fieldbyname('IDPLANOPREV').AsString = '3'
     then sIdTipoReserva := '17'
     else if qrypatrocombo.fieldbyname('IDPLANOPREV').AsString = '33'
     then sIdTipoReserva := '58'
     else if qrypatrocombo.fieldbyname('IDPLANOPREV').AsString = '37'
     then sIdTipoReserva := '15'
     else if qrypatrocombo.fieldbyname('IDPLANOPREV').AsString = '40'
     then sIdTipoReserva := '44'
     else if qrypatrocombo.fieldbyname('IDPLANOPREV').AsString = '44'
     then sIdTipoReserva := '73';



     lbltexto.caption := 'Zerando reservas de controle.';
     frmReservaControle.update;

     //zerar reservas de controle
     pb.Max := 2;
     qryaux.close;
     qryaux.sql.text := ' UPDATE RESERVAPART SET VALORRESERVA = 0 '+
                        ' WHERE IDPESSJUR = '+qrypatrocombo.fieldbyname('IDPESSOA').AsString+' AND '+
                        ' IDPLANOPREV = '+qrypatrocombo.fieldbyname('IDPLANOPREV').AsString+' AND '+
                        ' IDTIPORESERVA = '+sIdTipoReserva+'  ';
     qryaux.execsql;
     pb.Position := 1;

     lbltexto.caption := 'Deletando histórico de reservas de controle.';
     frmReservaControle.update;
     
     qryaux.close;
     qryaux.sql.text := ' DELETE HISTMOVRESERVA '+
                        ' WHERE IDPESSJUR = '+qrypatrocombo.fieldbyname('IDPESSOA').AsString+' AND '+
                        ' IDPLANOPREV = '+qrypatrocombo.fieldbyname('IDPLANOPREV').AsString+' AND '+
                        ' IDTIPORESERVA = '+sIdTipoReserva+'  ';
     qryaux.execsql;
     pb.Position := 2;





     lbltexto.caption := 'Migrando saldos de transferência.';
     frmReservaControle.update;
     
     {contas de transferência
     plano   - reserva
     3         14,13
     33        41,42
     37        70,71
     40        26,27
     44        55,56}
     if qrypatrocombo.fieldbyname('IDPLANOPREV').AsString = '3'
     then sIdTipoReserva := '14,13'
     else if qrypatrocombo.fieldbyname('IDPLANOPREV').AsString = '33'
     then sIdTipoReserva := '41,42'
     else if qrypatrocombo.fieldbyname('IDPLANOPREV').AsString = '37'
     then sIdTipoReserva := '70,71'
     else if qrypatrocombo.fieldbyname('IDPLANOPREV').AsString = '40'
     then sIdTipoReserva := '26,27'
     else if qrypatrocombo.fieldbyname('IDPLANOPREV').AsString = '44'
     then sIdTipoReserva := '55,56';



     pb.Position := 0;

     qry.close;
     qry.sql.text := ' SELECT SUM(VALORRESERVA) VALOR, IDPESSOA  FROM RESERVAPART '+
                     ' WHERE IDPESSJUR = '+qrypatrocombo.fieldbyname('IDPESSOA').AsString+' AND '+
                     ' IDPLANOPREV = '+qrypatrocombo.fieldbyname('IDPLANOPREV').AsString+' AND '+
                     ' IDTIPORESERVA IN ('+sIdTipoReserva+')  GROUP BY IDPESSOA ';
     qry.open;
     pb.max := qry.recordcount;


     {contas de controle
     plano   - reserva
     3         17
     33        58
     37        15
     40        44
     44        73}
     if qrypatrocombo.fieldbyname('IDPLANOPREV').AsString = '3'
     then sIdTipoReserva := '17'
     else if qrypatrocombo.fieldbyname('IDPLANOPREV').AsString = '33'
     then sIdTipoReserva := '58'
     else if qrypatrocombo.fieldbyname('IDPLANOPREV').AsString = '37'
     then sIdTipoReserva := '15'
     else if qrypatrocombo.fieldbyname('IDPLANOPREV').AsString = '40'
     then sIdTipoReserva := '44'
     else if qrypatrocombo.fieldbyname('IDPLANOPREV').AsString = '44'
     then sIdTipoReserva := '73';

     while not qry.eof do
     begin
        pb.Position := pb.Position +1;


        qryaux.close;
        qryaux.sql.text := ' SELECT VALORRESERVA FROM  RESERVAPART  '+
                           ' WHERE IDPESSJUR = '+qrypatrocombo.fieldbyname('IDPESSOA').AsString+' AND '+
                           ' IDPLANOPREV = '+qrypatrocombo.fieldbyname('IDPLANOPREV').AsString+' AND '+
                           ' IDTIPORESERVA = '+sIdTipoReserva+' AND '+
                           ' IDPESSOA = '+qry.fieldbyname('IDPESSOA').AsString+' ';
        qryaux.open;

        if qryaux.isempty then
        begin
           qryaux.close;
           qryaux.sql.text := ' INSERT INTO  RESERVAPART(IDTIPORESERVA, IDPLANOPREV, IDPESSOA , '+
                              ' IDPESSJUR, SEQPROPOSTA, FLGATIVO)  '+
                              ' SELECT '+sIdTipoReserva+', '+
                              ' '+qrypatrocombo.fieldbyname('IDPLANOPREV').AsString+', '+
                              ' '+qry.fieldbyname('IDPESSOA').AsString+', '+
                              ' '+qrypatrocombo.fieldbyname('IDPESSOA').AsString+' ,'+
                              ' 1,1 FROM DUAL ';
           qryaux.execsql;
        end;


        qryaux.close;
        qryaux.sql.text := ' UPDATE RESERVAPART SET VALORRESERVA = '+oranumero(qry.fieldbyname('VALOR').AsString)+' '+
                           ' WHERE IDPESSJUR = '+qrypatrocombo.fieldbyname('IDPESSOA').AsString+' AND '+
                           ' IDPLANOPREV = '+qrypatrocombo.fieldbyname('IDPLANOPREV').AsString+' AND '+
                           ' IDTIPORESERVA = '+sIdTipoReserva+' AND '+
                           ' IDPESSOA = '+qry.fieldbyname('IDPESSOA').AsString+' ';
        qryaux.execsql;


        qryaux.close;
        qryaux.sql.text := ' INSERT INTO HISTMOVRESERVA( IDHISTRESERVA, IDPLANOPREV, '+
                           ' IDTIPORESERVA, IDPESSJUR,IDPESSOA, SEQPROPOSTA, '+
                           ' DATAMOV, VLRREAL, VLRCOTAS, SALDOREAL, SALDOCOTAS, FLGENTRADA, '+
                           ' VALORINDICE, DATAALIMENTACAO, MESREFERENCIA ) '+
                           ' SELECT SEQHISTMOVRESERVA.NEXTVAL, '+
                           ' '+qrypatrocombo.fieldbyname('IDPLANOPREV').AsString+' IDPLANOPREV, '+
                           ' '+sIdTipoReserva+' IDTIPORESERVA, '+
                           ' '+qrypatrocombo.fieldbyname('IDPESSOA').AsString+' IDPESSJUR, '+
                           ' '+qry.fieldbyname('IDPESSOA').AsString+' IDPESSOA,  '+
                           ' 1 SEQPROPOSTA, '+
                           ' TRUNC(SYSDATE) DATAMOV, NULL VLRREAL, '+
                           ' '+oranumero(qry.fieldbyname('VALOR').AsString)+' VLRCOTAS, NULL SALDOREAL , '+
                           ' '+oranumero(qry.fieldbyname('VALOR').AsString)+' SALDOCOTAS, 1 FLGENTRADA, NULL VALORINDICE,'+
                           ' TRUNC(SYSDATE) DATAALIMENTACAO, '+
                           ' ''2000/12'' MESREFERENCIA  FROM DUAL';
        qryaux.execsql;



        qry.next;
     end;



     pb.Position :=0;
     lbltexto.caption := 'Atualizando histórico mensal.';
     frmReservaControle.update;


     qry.close;
     qry.sql.text := ' SELECT H.IDPESSOA , H.IDPESSJUR , H.IDCONTRIBUICAO , R.IDTIPORESERVA , '+
                     ' H.MESREFERENCIA , H.MESCOBRANCA, H.VALORRECEBIDO, '+
                     ' CO.COTVALOR, ROUND((H.VALORRECEBIDO / CO.COTVALOR),8) VALOR '+
                     ' FROM HSTCONTRIBPREV H , RESERVAXCONTRIB R, RESERVAXPLANO RP, COTACAOMOEDA CO '+
                     ' WHERE H.IDPESSJUR = '+qrypatrocombo.fieldbyname('IDPESSOA').AsString+' AND '+
                     ' H.IDPLANOPREV = '+qrypatrocombo.fieldbyname('IDPLANOPREV').AsString+'  AND '+
                     ' H.FLGCALCRESERVA = 1 AND '+
                     ' NVL(H.VALORRECEBIDO,0) >0 AND '+
                     ' EXISTS (SELECT 1 FROM HISTMOVRESERVA WHERE '+
                     '                IDPESSJUR = H.IDPESSJUR AND '+
                     '                IDTIPORESERVA = R.IDTIPORESERVA AND '+
                     '                IDCONTRIBUICAO = H.IDCONTRIBUICAO AND '+
                     '                IDPLANOPREV = H.IDPLANOPREV AND '+
                     '                IDPESSOA = H.IDPESSOA AND '+
                     '                MESREFERENCIA = H.MESREFERENCIA ) AND '+
                     ' R.IDCONTRIBUICAO = H.IDCONTRIBUICAO AND '+
                     ' R.IDPLANOPREV = H.IDPLANOPREV AND '+
                     ' RP.IDPLANOPREV = R.IDPLANOPREV AND '+
                     ' RP.IDTIPORESERVA = R.IDTIPORESERVA AND '+
                     ' RP.ANALITICOSINTETI = ''A'' AND '+
                     ' FLGCOLETIVA = 0  AND '+
                     ' FLGTRANSFERENCIA = 0  AND '+
                     ' FLGCONTROLE = 0  AND '+
                     ' FLGTITULARCOLET = ''T'' AND '+
                     ' CO.MOECODIGO = 140 AND '+ //inpc
                     ' SUBSTR(CO.COTMESREF,3,4)||''/''||SUBSTR(CO.COTMESREF,1,2) = '+
                     ' DECODE(SUBSTR(H.MESREFERENCIA,6,2),''13'', SUBSTR(H.MESREFERENCIA,1,5)||''12'',H.MESREFERENCIA) '+
                     ' ORDER BY H.IDPESSOA, H.MESREFERENCIA';
     qry.open;
     pb.max := qry.recordcount;


     while not qry.eof do
     begin
        pb.Position := pb.Position + 1;

        qryaux.close;
        qryaux.sql.text := ' SELECT VALORRESERVA FROM  RESERVAPART  '+
                           ' WHERE IDPESSJUR = '+qrypatrocombo.fieldbyname('IDPESSOA').AsString+' AND '+
                           ' IDPLANOPREV = '+qrypatrocombo.fieldbyname('IDPLANOPREV').AsString+' AND '+
                           ' IDTIPORESERVA = '+sIdTipoReserva+' AND '+
                           ' IDPESSOA = '+qry.fieldbyname('IDPESSOA').AsString+' ';
        qryaux.open;
        sValorCotas := qryaux.fieldbyname('VALORRESERVA').AsString;;


        qryaux.close;
        qryaux.sql.text := ' UPDATE RESERVAPART SET VALORRESERVA = VALORRESERVA + '+oranumero(qry.fieldbyname('VALOR').AsString)+' '+
                           ' WHERE IDPESSJUR = '+qrypatrocombo.fieldbyname('IDPESSOA').AsString+' AND '+
                           ' IDPLANOPREV = '+qrypatrocombo.fieldbyname('IDPLANOPREV').AsString+' AND '+
                           ' IDTIPORESERVA = '+sIdTipoReserva+' AND '+
                           ' IDPESSOA = '+qry.fieldbyname('IDPESSOA').AsString+' ';
        qryaux.execsql;


        qryaux.close;
        qryaux.sql.text := ' INSERT INTO HISTMOVRESERVA( IDHISTRESERVA, IDPLANOPREV, '+
                           ' IDTIPORESERVA, IDPESSJUR,IDPESSOA, SEQPROPOSTA, '+
                           ' DATAMOV, VLRREAL, VLRCOTAS, SALDOREAL, SALDOCOTAS, FLGENTRADA, '+
                           ' VALORINDICE, DATAALIMENTACAO, MESREFERENCIA, IDCONTRIBUICAO ) '+
                           ' SELECT SEQHISTMOVRESERVA.NEXTVAL, '+
                           ' '+qrypatrocombo.fieldbyname('IDPLANOPREV').AsString+' IDPLANOPREV, '+
                           ' '+sIdTipoReserva+' IDTIPORESERVA, '+
                           ' '+qrypatrocombo.fieldbyname('IDPESSOA').AsString+' IDPESSJUR, '+
                           ' '+qry.fieldbyname('IDPESSOA').AsString+' IDPESSOA,  '+
                           ' 1 SEQPROPOSTA, '+
                           ' TRUNC(SYSDATE) DATAMOV, '+
                           ' '+oranumero(qry.fieldbyname('VALORRECEBIDO').AsString)+' VLRREAL, '+
                           ' '+oranumero(qry.fieldbyname('VALOR').AsString)+' VLRCOTAS, '+
                           ' (('+oranumero(sValorCotas)+' + '+oranumero(qry.fieldbyname('VALOR').AsString)+') * '+oranumero(qry.fieldbyname('COTVALOR').AsString)+')  SALDOREAL , '+
                           ' ('+oranumero(sValorCotas)+' + '+oranumero(qry.fieldbyname('VALOR').AsString)+')  SALDOCOTAS, '+
                           ' 1 FLGENTRADA, '+oranumero(qry.fieldbyname('COTVALOR').AsString)+' VALORINDICE,'+
                           ' TRUNC(SYSDATE) DATAALIMENTACAO,   '+
                           ' '''+qry.fieldbyname('MESREFERENCIA').AsString+''' MESREFERENCIA, '+
                           ' '+qry.fieldbyname('IDCONTRIBUICAO').AsString+' IDCONTRIBUICAO  FROM DUAL';
        qryaux.execsql;



        qry.next;
     end;






  except
    on Error: Exception do
    begin
       showmessage('Deu um erro o mané. Mensagem: '+Error.Message+'');
       if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.rollback ;
       exit;
    end;
  end;

  if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.Commit ;
  showmessage('Acabou beleza!!');
  pb.Position := 0;


end;

procedure TfrmReservaControle.FormCreate(Sender: TObject);
begin
  inherited;
  qryPatroCombo.open;
end;

end.
