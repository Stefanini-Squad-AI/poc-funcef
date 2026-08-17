// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Paulo Ramos
// Data        : 06/11/2006
// Pendência   : 23576
// Alteração   : Ajuste na tela para fazer a atualização até uma data informada
//   em tela. Esta data estava fixa em 31/05/2005, definida na época da
//   pendência que criou a tela.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 06/02/2006
// Pendência   : 21467
// Alteração   : Na opção de acerto individual, permitir efetuar o ajuste para
//               pessoas com data de cancelamento, mas ainda ativas, ou seja não
//               estão na situação de canceladas com o resgate da reserva.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 30/09/2005 a 07/10/2005
// Pendência   : 19921
// Alteração   : Criação da tela para acerto das reservas de migração
//------------------------------------------------------------------------------
unit fAcertaReservaMigracao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, fFrameLista, ComCtrls, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBClient,
  uCMClientDataSet, CMSQLScript, wwdblook, uCmSqlParams, Wwdatsrc, Grids,
  Wwdbigrd, Wwdbgrid, DBTables, Wwquery, dbasedados, udiasuteis, uSistema,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmAcertaReservaMigracao = class(TfrmOkCancelar)
    pnlOpcoes: TPanel;
    PageControl1: TPageControl;
    tbsHistorico: TTabSheet;
    tbsPessoas: TTabSheet;
    tbserros: TTabSheet;
    tbsNaoAtualiza: TTabSheet;
    FrameBenef: TfrmFrameListaBenef;
    cboxIndividual: TCheckBox;
    btnAnalise: TButton;
    cdsMatricula: TClientDataSet;
    sqlpMatricula: TCMSqlParams;
    cdsHistorico: TClientDataSet;
    sqlpHistorico: TCMSqlParams;
    dsHistorico: TwwDataSource;
    dsMatricula: TwwDataSource;
    dbgMatricula: TwwDBGrid;
    dbgHistorico: TwwDBGrid;
    qrybrtprev: TwwQuery;
    qryprevia: TwwQuery;
    mmErros: TMemo;
    mmNaoAtualiza: TMemo;
    qryAux: TwwQuery;
    qryHistReserva: TwwQuery;
    qryReservaxPlano: TwwQuery;
    qryIndices: TwwQuery;
    tbsAtualiza: TTabSheet;
    mmAtualiza: TMemo;
    tbsManual: TTabSheet;
    mmManual: TMemo;
    Label4: TLabel;
    dtDataLimite: TCMDateTimePicker;
    procedure btnAnaliseClick(Sender: TObject);
    procedure cboxIndividualClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ObtemValoresParaReservaTR(aidpessoa: integer;
      asMesIni, asMesFim: string;
      var arValorTR, arValorContrib: real);
    function ExistePrevia(aidpessoa: integer): boolean;
    function ObtemParametroPrevia(aidpessoa: integer; asParametro: string): string;
    function ObtemNumeroPrevia(aidpessoa: integer; asParametro: string): real;
    function ObtemHistorico(aidpessoa: integer; aitiporeserva: integer): real;
    function ExisteRegistroHistorico(aidpessoa: integer): boolean;
    //verificar se existe registro manual, de saída de outro evento gerador (<> nulo ou 45) ou benefício
    function ObtemReservaAtualizada(aidpessoa: integer; asMesIni, asMesFim: string;
      aitiporeserva: integer; asParametro: string): real;
    procedure AcrescentaMatricula(asmatricula: string; aidpessoa: integer;
      arreserva16, arreserva17, arreserva41, arreserva42: real);
    procedure SimulaHistorico(aidpessoa: integer; asdataini: string; arReserva: real; aitiporeserva: integer);
    function AcertaReserva(aidpessoa, aidtiporeserva: integer;
      arreservaini: real): boolean;
  end;

var
  frmAcertaReservaMigracao: TfrmAcertaReservaMigracao;

implementation

{$R *.DFM}

uses USimuladorBrTPREV;

procedure TfrmAcertaReservaMigracao.AcrescentaMatricula(
  asmatricula: string; aidpessoa: integer;
  arreserva16, arreserva17, arreserva41, arreserva42: real);
begin
  cdsmatricula.Append;
  cdsmatricula.fieldbyname('matricula').asstring:=asmatricula;
  cdsmatricula.fieldbyname('idpessoa').asinteger:=aidpessoa;
  cdsmatricula.fieldbyname('reserva16').asfloat:=arreserva16;
  cdsmatricula.fieldbyname('reserva17').asfloat:=arreserva17;
  cdsmatricula.fieldbyname('reserva41').asfloat:=arreserva41;
  cdsmatricula.fieldbyname('reserva42').asfloat:=arreserva42;
  cdsmatricula.post;
end;

procedure TfrmAcertaReservaMigracao.btnAnaliseClick(Sender: TObject);
var ssql: string;
    sIniPeriodo: string;
    sFimPeriodo: string;
    sDataBase: string;
    sDataInscricao: string;
    rValorTR: real;
    rValorContrib: real;
    rOpcao: real;
    rReserva16: real;
    rReserva17: real;
    rReserva41: real;
    rReserva42: real;
    rHist16: real;
    rHist17: real;
    rHist41: real;
    rHist42: real;
    bAtualizou: boolean;
begin
  inherited;
  sqlpMatricula.Prepare;
  sqlpMatricula.open;
  dbgMatricula.enabled:=true;
  dbgHistorico.enabled:=true;

  sqlpHistorico.Prepare;
  sqlpHistorico.open;

  dbgMatricula.Selected.clear;
  dbgMatricula.Selected.add('MATRICULA'#9'13'#9'Matrícula'#9'F');

  dbgHistorico.Selected.clear;
  dbgHistorico.Selected.add('MATRICULA'#9'13'#9'Matrícula');
  dbgHistorico.Selected.add('NOME'#9'20'#9'Reserva');
  dbgHistorico.Selected.add('MESREFERENCIA'#9'7'#9'Mês');
  dbgHistorico.Selected.add('VLRCOTAS'#9'10'#9'v. Cotas');
  dbgHistorico.Selected.add('VLRREAL'#9'10'#9'v. Real');
  dbgHistorico.Selected.add('VALORINDICE'#9'10'#9'Índice');
  dbgHistorico.Selected.add('SALDOCOTAS'#9'10'#9's. Cotas');
  dbgHistorico.Selected.add('SALDOREAL'#9'10'#9's. Real');

  ssql:=
    'SELECT PP.IDPESSOA, PP.INSCRICAODATA, E.MATRICULA '+#13#10+
    'FROM  PARTPREVPLAN PP, ELEGPATRO E, SITPART S '+#13#10+
//P.RAMOS-02.06.2006-PEND.21467
    'WHERE PP.IDPLANOPREV = 33 '+#13#10;
  if not cboxIndividual.checked then
    ssql:=ssql+
      'AND PP.DATACANCELAMENTO IS NULL '+#13#10;
  ssql:=ssql+
//P.RAMOS-02.06.2006-PEND.21467-FIM
    'AND PP.IDSITPART = S.IDSITPART '+#13#10+
    'AND S.FLGINTERNO IN (''AT'',''MP'',''MA'',''MS'') '+#13#10+
    'AND EXISTS (SELECT 1 '+#13#10+
    '            FROM PARTPREVPLAN P1 '+#13#10+
    '            WHERE P1.IDPESSOA = PP.IDPESSOA '+#13#10+
    '            AND P1.IDPESSJUR = PP.IDPESSJUR '+#13#10+
    '            AND P1.IDPLANOPREV IN (3,16) '+#13#10+
    '            AND P1.SEQPROPOSTA = PP.SEQPROPOSTA) '+#13#10+
    'AND E.IDPESSJUR = PP.IDPESSJUR '+#13#10+
    'AND E.IDPESSOA = PP.IDPESSOA '+#13#10;

  if cboxIndividual.checked then
    ssql:=ssql+
      'AND PP.IDPESSOA IN ('+#13#10+
      ' SELECT IDPESSOA '+#13#10+
      ' FROM LISTAFOLHABENEFDET LD '+#13#10+
      ' WHERE LD.IDLISTA = '+IntToStr(framebenef.ListaUsuario)+') '+#13#10;

  qrybrtprev.close;
  qrybrtprev.sql.clear;
  qrybrtprev.sql.add(ssql);
  qrybrtprev.open;

  while not qrybrtprev.eof do
  begin
    if not ExisteRegistroHistorico(qrybrtprev.fieldbyname('IDPESSOA').asinteger) then
    begin
      if ExistePrevia(qrybrtprev.fieldbyname('IDPESSOA').asinteger) then
      begin
        sDataBase:=ObtemParametroPrevia(qrybrtprev.fieldbyname('IDPESSOA').asinteger, 'DATABASE');
        if sDataBase <> '' then
          sDataBase:=copy(sDataBase,7,4)+'/'+copy(sDataBase,4,2)
        else
        begin
          sDataBase:=ObtemParametroPrevia(qrybrtprev.fieldbyname('IDPESSOA').asinteger, 'DATATRANSF');
          if sDataBase <> '' then
            sDataBase:=copy(sDataBase,7,4)+'/'+copy(sDataBase,4,2);
        end;

        if sdatabase = '' then
        begin
          if not tbsErros.TabVisible then
            tbsErros.TabVisible:=true;
          mmErros.Lines.add(qrybrtprev.fieldbyname('MATRICULA').asstring+
            ' - data na prévia de migração em branco');
        end
        else
        begin
          sDataInscricao:=
            formatdatetime('dd/mm/yyyy', qrybrtprev.fieldbyname('INSCRICAODATA').asdatetime);

          sIniPeriodo:=ProximoAnoMes(StrToInt(Copy(sDataBase,6,2)), StrToInt(Copy(sDataBase,1,4)));
          sFimPeriodo:=SAnoMesAnterior(Copy(sDataInscricao,7,4)+'/'+Copy(sDataInscricao,4,2));

          if sIniPeriodo > sFimPeriodo then
          begin
            if not tbsNaoAtualiza.TabVisible then
              tbsNaoAtualiza.TabVisible:=true;
            mmNaoAtualiza.Lines.add(qrybrtprev.fieldbyname('MATRICULA').asstring+
              ' - não sofre atualização da TR');
          end
          else
          begin
            //obter os valores da Prévia de Migração
            rOpcao:=ObtemNumeroPrevia(qrybrtprev.fieldbyname('IDPESSOA').asinteger, 'OPCAO');

            bAtualizou:=true;

            if ropcao = 3 then //checa reservas 16 e 17
            begin
              rReserva16:=ObtemReservaAtualizada(qrybrtprev.fieldbyname('IDPESSOA').asinteger,
                sIniPeriodo, sFimPeriodo, 16, '10105');
              rHist16:=ObtemHistorico(qrybrtprev.fieldbyname('IDPESSOA').asinteger, 16);
              if abs(rReserva16-rHist16) > 0.0001 then
                bAtualizou:=false;

              rReserva17:=ObtemReservaAtualizada(qrybrtprev.fieldbyname('IDPESSOA').asinteger,
                sIniPeriodo, sFimPeriodo, 17, '10106');
              rHist17:=ObtemHistorico(qrybrtprev.fieldbyname('IDPESSOA').asinteger, 17);
              if abs(rReserva17-rHist17) > 0.0001 then
                bAtualizou:=false;
            end;

            rReserva41:=ObtemReservaAtualizada(qrybrtprev.fieldbyname('IDPESSOA').asinteger,
              sIniPeriodo, sFimPeriodo, 41, '30201');
            rHist41:=ObtemHistorico(qrybrtprev.fieldbyname('IDPESSOA').asinteger, 41);
            if abs(rReserva41-rHist41) > 0.0001 then
              bAtualizou:=false;

            rReserva42:=ObtemReservaAtualizada(qrybrtprev.fieldbyname('IDPESSOA').asinteger,
              sIniPeriodo, sFimPeriodo, 42, '30202');
            rHist42:=ObtemHistorico(qrybrtprev.fieldbyname('IDPESSOA').asinteger, 42);
            if abs(rReserva42-rHist42) > 0.0001 then
              bAtualizou:=false;

            if not bAtualizou then
            begin
              if not tbsAtualiza.TabVisible then
                tbsAtualiza.TabVisible:=true;
              mmAtualiza.Lines.add(qrybrtprev.fieldbyname('MATRICULA').asstring+
                ' - deveria mas não sofreu atualização da TR');
              AcrescentaMatricula(
                qrybrtprev.fieldbyname('MATRICULA').asstring,
                qrybrtprev.fieldbyname('IDPESSOA').asinteger,
                rreserva16, rreserva17, rreserva41, rreserva42);

              sFimPeriodo:='01/'+copy(sFimPeriodo,6,2)+'/'+copy(sFimPeriodo,1,4);
              if ropcao = 3 then //checa reservas 16 e 17
              begin
                SimulaHistorico(qrybrtprev.fieldbyname('IDPESSOA').asinteger, sFimPeriodo, rReserva16, 16);
                SimulaHistorico(qrybrtprev.fieldbyname('IDPESSOA').asinteger, sFimPeriodo, rReserva17, 17);
              end;
              SimulaHistorico(qrybrtprev.fieldbyname('IDPESSOA').asinteger, sFimPeriodo, rReserva41, 41);
              SimulaHistorico(qrybrtprev.fieldbyname('IDPESSOA').asinteger, sFimPeriodo, rReserva42, 42);
            end;
          end;
        end;
      end;
    end
    else
    begin
      if not tbsManual.TabVisible then
        tbsManual.TabVisible:=true;
      mmManual.Lines.add(qrybrtprev.fieldbyname('MATRICULA').asstring+
        ' - possui lançamento manual, de saída ou de outro evento numa das reservas: 1.01.05, 1.01.06, 3.02.01, 3.02.02');
    end;

    qrybrtprev.next;
    self.Update;
  end;

  bbtnConfirmar.enabled:=true;
  btnAnalise.enabled:=false;

  cdsmatricula.first;
end;

procedure TfrmAcertaReservaMigracao.SimulaHistorico(aidpessoa: integer;
  asdataini: string; arReserva: real; aitiporeserva: integer);
var ssql: string;
begin
  qryReservaxPlano.close;
  ssql:=
    'SELECT RP.INDICECORRECAO, RP.NOME '+#13#10+
    'FROM RESERVAXPLANO RP '+#13#10+
    'WHERE RP.IDPLANOPREV = 33'+#13#10+
    'AND RP.IDTIPORESERVA = '+inttostr(aitiporeserva)+#13#10;
  qryReservaxPlano.SQL.Clear;
  qryReservaxPlano.SQL.Add(ssql);
  qryReservaxPlano.Open;

  qryIndices.Close;
  qryIndices.ParamByName('MOECODIGO').AsInteger:=
    qryReservaxPlano.FieldbyName('INDICECORRECAO').AsInteger;
  qryIndices.ParamByName('ULTIMADATA').AsDateTime:=StrToDate(asdataini);
  qryIndices.ParamByName('DATALIMITE').AsDateTime:=
    //P.RAMOS-06/11/2006-PEND.23576
    //StrToDate('31/08/2005');
    dtDataLimite.date;
    //P.RAMOS-06/11/2006-PEND.23576-FIM
  qryIndices.Open;

  cdsHistorico.append;
  cdsHistorico.fieldbyname('MATRICULA').asstring:=qrybrtprev.fieldbyname('MATRICULA').asstring;
  cdsHistorico.fieldbyname('NOME').asstring:=qryReservaxPlano.FieldbyName('NOME').asstring;
  cdsHistorico.fieldbyname('MESREFERENCIA').asstring:=copy(asdataini,7,4)+'/'+copy(asdataini,4,2);
  cdsHistorico.fieldbyname('VLRCOTAS').asfloat:={ArredondaMoeda(}arreserva{)};
  cdsHistorico.fieldbyname('VLRREAL').asfloat:={ArredondaMoeda(}arreserva{)};
  cdsHistorico.fieldbyname('VALORINDICE').asfloat:=1;
  cdsHistorico.fieldbyname('SALDOCOTAS').asfloat:={ArredondaMoeda(}arreserva{)};
  cdsHistorico.fieldbyname('SALDOREAL').asfloat:={ArredondaMoeda(}arreserva{)};
  cdsHistorico.post;

  while not qryIndices.Eof do
  begin
    cdsHistorico.append;
    cdsHistorico.fieldbyname('MATRICULA').asstring:=qrybrtprev.fieldbyname('MATRICULA').asstring;
    cdsHistorico.fieldbyname('NOME').asstring:=qryReservaxPlano.FieldbyName('NOME').asstring;
    cdsHistorico.fieldbyname('MESREFERENCIA').asstring:=
      formatdatetime('yyyy/mm', qryIndices.FieldByName('COTDATA').asdatetime);
    cdsHistorico.fieldbyname('VLRCOTAS').asfloat:={ArredondaMoeda(}arreserva*(qryIndices.FieldByName('COTVALOR').AsFloat-1){)};
    cdsHistorico.fieldbyname('VLRREAL').asfloat:={ArredondaMoeda(}arreserva*(qryIndices.FieldByName('COTVALOR').AsFloat-1){)};
    cdsHistorico.fieldbyname('VALORINDICE').asfloat:=qryIndices.FieldByName('COTVALOR').AsFloat;
    arreserva:={ArredondaMoeda(}arreserva*qryIndices.FieldByName('COTVALOR').AsFloat{)};
    cdsHistorico.fieldbyname('SALDOCOTAS').asfloat:=arreserva;
    cdsHistorico.fieldbyname('SALDOREAL').asfloat:=arreserva;
    cdsHistorico.post;
    qryIndices.Next;
  end;
end;

procedure TfrmAcertaReservaMigracao.cboxIndividualClick(Sender: TObject);
begin
  inherited;
  tbsPessoas.tabvisible:=cboxIndividual.checked;
end;

procedure TfrmAcertaReservaMigracao.FormCreate(Sender: TObject);
begin
  inherited;
  tbsPessoas.tabvisible:=false;
  tbserros.tabvisible:=false;
  tbsNaoAtualiza.tabvisible:=false;
  tbsAtualiza.tabvisible:=false;
  tbsManual.tabvisible:=false;
end;

function TfrmAcertaReservaMigracao.ExistePrevia(aidpessoa: integer): boolean;
var ssql: string;
begin
  ssql:=
    'SELECT VALORAMIGRAR '+#13#10+
    'FROM PREVIAMIGRAPLANO '+#13#10+
    'WHERE IDPESSOA = '+inttostr(aidpessoa)+#13#10;

  qryprevia.close;
  qryprevia.sql.clear;
  qryprevia.sql.add(ssql);
  qryprevia.open;

  result:=not qryprevia.isempty;
end;

function TfrmAcertaReservaMigracao.ExisteRegistroHistorico(aidpessoa: integer): boolean;
//verificar se existe registro manual, de saída de outro evento gerador (<> nulo ou 45) ou benefício
var ssql: string;
begin
  ssql:=
    'SELECT * '+#13#10+
    'FROM HISTMOVRESERVA '+#13#10+
    'WHERE IDPESSOA = '+inttostr(aidpessoa)+#13#10+
    'AND IDTIPORESERVA IN (16,17,41,42) '+#13#10+
    'AND NVL(VLRREAL,0) <> 0 '+#13#10+
    'AND (   IDBENEFICIO IS NOT NULL '+#13#10+
    '     OR FLGPROCEDENCIA = 1 '+#13#10+
    '     OR FLGENTRADA = 0 '+#13#10+
    '     OR NVL(IDEVENTOGERADOR,45) <> 45) '+#13#10+
    'ORDER BY IDHISTRESERVA '+#13#10;

  qryHistReserva.close;
  qryHistReserva.sql.clear;
  qryHistReserva.sql.add(ssql);
  qryHistReserva.open;

  result:=not qryHistReserva.isempty;
end;

function TfrmAcertaReservaMigracao.ObtemHistorico(aidpessoa: integer;
  aitiporeserva: integer): real;
var ssql: string;
begin
  ssql:=
    'SELECT * '+#13#10+
    'FROM HISTMOVRESERVA '+#13#10+
    'WHERE IDPESSOA = '+inttostr(aidpessoa)+#13#10+
    'AND IDTIPORESERVA = '+inttostr(aitiporeserva)+' '+#13#10+
    'ORDER BY IDHISTRESERVA '+#13#10;

  qryHistReserva.close;
  qryHistReserva.sql.clear;
  qryHistReserva.sql.add(ssql);
  qryHistReserva.open;

  if not qryHistReserva.isempty then
    result:=qryHistReserva.fieldbyname('VLRCOTAS').asfloat
  else
    result:=0;
end;

function TfrmAcertaReservaMigracao.ObtemNumeroPrevia(aidpessoa: integer;
  asParametro: string): real;
var lsret: string;
begin
  lsret:=ObtemParametroPrevia(aidpessoa, asParametro);
  try
    result:=strtofloat(lsret);
  except
    result:=0;
  end;
end;

function TfrmAcertaReservaMigracao.ObtemParametroPrevia(aidpessoa: integer;
  asParametro: string): string;
var ssql: string;
begin
  ssql:=
    'SELECT VALORAMIGRAR '+#13#10+
    'FROM PREVIAMIGRAPLANO '+#13#10+
    'WHERE IDPESSOA = '+inttostr(aidpessoa)+#13#10+
    'AND CODCAMPOMIGRA = '+quotedstr(asParametro);

  qryprevia.close;
  qryprevia.sql.clear;
  qryprevia.sql.add(ssql);
  qryprevia.open;

  if not qryprevia.isempty then
    result:=trim(qryprevia.fieldbyname('valoramigrar').asstring)
  else
    result:='';
end;

function TfrmAcertaReservaMigracao.ObtemReservaAtualizada(aidpessoa: integer;
  asMesIni, asMesFim: string; aitiporeserva: integer; asParametro: string): real;
var sAnoMesAtual   : string;
    rReserva: real;
begin
   rReserva:=ObtemNumeroPrevia(aidpessoa, asParametro);
   sAnoMesAtual:=asMesIni;
   while sAnoMesAtual <= asMesFim do
   begin
     // ***********************************************************************
     //                      BUSCA INDICE DA TR ACUMULADO
     // ***********************************************************************
     // Buscar TR
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' SELECT COTVALOR, COTDATA '+
                    ' FROM   COTACAOMOEDA      '+
                    ' WHERE  MOECODIGO = 45    '+
                    ' AND    TO_CHAR(COTDATA,''YYYY/MM'') <= ''' + sAnoMesAtual + ''''+
                    ' ORDER BY COTDATA DESC ');
     qryAux.Open;
     qryAux.First;
     if qryAux.IsEmpty then
     begin
       sAnoMesAtual:=ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
       continue;
     end;
     rReserva:=rReserva*qryAux.FieldByName('COTVALOR').AsFloat;

     // ***********************************************************************
     //                      BUSCA DAS CONTRIBUICOES
     // ***********************************************************************
     if aitiporeserva in [16,41] then
     begin
       qryAux.Close;
       qryAux.SQL.Clear;
       qryAux.SQL.Add(' SELECT SUM(DECODE(H.FLGDEVOLUCAO,1,-H.VALORRECEBIDO, H.VALORRECEBIDO)) AS VALORRECEBIDO '+
                      ' FROM   HSTCONTRIBPREV H, CONTPREV CP '+
                      ' WHERE  H.IDPESSOA        = '+inttostr(aidpessoa)+
                      ' AND    H.SEQPROPOSTA     = 1 '+
                      ' AND    H.MESREFERENCIA   = '''+sAnoMesAtual+''''+
                      ' AND    H.MESCOBRANCA     = '''+sAnoMesAtual+''''+
                      ' AND    H.VALORRECEBIDO   > 0 '+
                      ' AND    H.VALORRECEBIDO   IS NOT NULL '+
                      ' AND    ( NOT H.IDCONTRIBUICAO IN (5,6,10,11,12,14,39,40,41) ) '+
                      ' AND    CP.IDPLANOPREV    = H.IDPLANOPREV '+
                      ' AND    CP.IDCONTRIBUICAO = H.IDCONTRIBUICAO '+
                      ' AND    CP.FLGPAGADOR     = ''C'' ');
       qryAux.Open;
       rReserva:=rReserva+qryAux.FieldbyName('VALORRECEBIDO').AsFloat;
     end;

     sAnoMesAtual := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
   end;
   result:=rReserva;
end;

procedure TfrmAcertaReservaMigracao.ObtemValoresParaReservaTR(aidpessoa: integer;
  asMesIni, asMesFim: string; var arValorTR, arValorContrib: real);
var sAnoMesAtual   : string;
begin
   arValorTR:=1; arValorContrib:=0;

   sAnoMesAtual:=asMesIni;
   while sAnoMesAtual <= asMesFim do
   begin
     // ***********************************************************************
     //                      BUSCA INDICE DA TR ACUMULADO
     // ***********************************************************************
     // Buscar TR
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' SELECT COTVALOR, COTDATA '+
                    ' FROM   COTACAOMOEDA      '+
                    ' WHERE  MOECODIGO = 45    '+
                    ' AND    TO_CHAR(COTDATA,''YYYY/MM'') <= ''' + sAnoMesAtual + ''''+
                    ' ORDER BY COTDATA DESC ');
     qryAux.Open;
     qryAux.First;
     if qryAux.IsEmpty then
     begin
       sAnoMesAtual:=ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
       continue;
     end;
     arValorTR:=arValorTR*qryAux.FieldByName('COTVALOR').AsFloat;

     // ***********************************************************************
     //                      BUSCA DAS CONTRIBUICOES
     // ***********************************************************************
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' SELECT SUM(DECODE(H.FLGDEVOLUCAO,1,-H.VALORRECEBIDO, H.VALORRECEBIDO)) AS VALORRECEBIDO '+
                    ' FROM   HSTCONTRIBPREV H, CONTPREV CP '+
                    ' WHERE  H.IDPESSOA        = '+inttostr(aidpessoa)+' '+
                    ' AND    H.SEQPROPOSTA     = 1 '+
                    ' AND    H.MESREFERENCIA   = '''+sAnoMesAtual+''''+
                    ' AND    H.MESCOBRANCA     = '''+sAnoMesAtual+''''+
                    ' AND    H.VALORRECEBIDO   > 0 '+
                    ' AND    H.VALORRECEBIDO   IS NOT NULL '+
                    ' AND    ( NOT H.IDCONTRIBUICAO IN (5,6,10,11,12,14,39,40,41) ) '+
                    ' AND    CP.IDPLANOPREV    = H.IDPLANOPREV '+
                    ' AND    CP.IDCONTRIBUICAO = H.IDCONTRIBUICAO '+
                    ' AND    CP.FLGPAGADOR     = ''C'' ');
     qryAux.Open;
     arValorContrib:=arValorContrib+qryAux.FieldbyName('VALORRECEBIDO').AsFloat;

     sAnoMesAtual := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
   end;
end;

procedure TfrmAcertaReservaMigracao.FormShow(Sender: TObject);
begin
  inherited;
  frameBenef.DefineLista(0);
end;

procedure TfrmAcertaReservaMigracao.bbtnConfirmarClick(Sender: TObject);
var bsucesso: boolean;
    rOpcao: real;
begin
  inherited;

  bbtnConfirmar.enabled:=false;
  bsucesso:=true;
  if MessageDlg(
       'Pronto para iniciar o acerto das matrículas analisadas.'+#13+#10+
       'Confirma início ?'+#13+#10+''+#13+#10+
       '(Obs.: após a conclusão com sucesso desse processo deve-se '+#13+#10+
       'executar a atualização de reservas por índice no Admprev)', mtConfirmation,
       [mbYes, mbNo], 0) = mrYes then
  begin
    dtmBasedados.dbBaseDados.StartTransaction;
    try
      cdsMatricula.first;
      while not cdsMatricula.eof do
      begin
        if trim(cdsMatricula.fieldbyname('MATRICULA').asstring) <> 'TODAS' then
        begin
          rOpcao:=ObtemNumeroPrevia(cdsMatricula.fieldbyname('IDPESSOA').asinteger, 'OPCAO');
          if ropcao = 3 then //checa reservas 16 e 17
          begin
            if not AcertaReserva(cdsMatricula.fieldbyname('IDPESSOA').asinteger,
                16, cdsMatricula.fieldbyname('RESERVA16').asfloat) then
            begin
              if not tbsErros.TabVisible then
                tbsErros.TabVisible:=true;
              mmErros.Lines.add(cdsMatricula.fieldbyname('MATRICULA').asstring+
                ' - erro ao acertar a reserva 1.01.05');
              bsucesso:=false;
            end;
            if not AcertaReserva(cdsMatricula.fieldbyname('IDPESSOA').asinteger,
                17, cdsMatricula.fieldbyname('RESERVA17').asfloat) then
            begin
              if not tbsErros.TabVisible then
                tbsErros.TabVisible:=true;
              mmErros.Lines.add(cdsMatricula.fieldbyname('MATRICULA').asstring+
                ' - erro ao acertar a reserva 1.01.06');
              bsucesso:=false;
            end;
          end;

          if not AcertaReserva(cdsMatricula.fieldbyname('IDPESSOA').asinteger,
              41, cdsMatricula.fieldbyname('RESERVA41').asfloat) then
          begin
            if not tbsErros.TabVisible then
              tbsErros.TabVisible:=true;
            mmErros.Lines.add(cdsMatricula.fieldbyname('MATRICULA').asstring+
              ' - erro ao acertar a reserva 3.02.01');
            bsucesso:=false;
          end;
          if not AcertaReserva(cdsMatricula.fieldbyname('IDPESSOA').asinteger,
              42, cdsMatricula.fieldbyname('RESERVA42').asfloat) then
          begin
            if not tbsErros.TabVisible then
              tbsErros.TabVisible:=true;
            mmErros.Lines.add(cdsMatricula.fieldbyname('MATRICULA').asstring+
              ' - erro ao acertar a reserva 3.02.02');
            bsucesso:=false;
          end;
        end;

        cdsMatricula.next;
      end;
    finally
      if bsucesso then
      begin
        if MessageDlg(
             'O acerto das matrículas concluído com sucesso.'+#13+#10+
             'Confirma gravação ?'+#13+#10+''+#13+#10+
             '(Obs.: após a conclusão com sucesso desse processo deve-se '+#13+#10+
             'executar a atualização de reservas por índice no Admprev)', mtConfirmation,
             [mbYes, mbNo], 0) = mrYes then
        begin
          dtmBasedados.dbBaseDados.Commit;
          MessageDlg('Processo confirmado e gravado.', mtWarning, [mbOk], 0);
        end
        else
        begin
          dtmBasedados.dbBaseDados.Rollback;
          MessageDlg('Processo cancelado pelo usuário.', mtWarning, [mbOk], 0);
        end;
      end
      else
      begin
        MessageDlg('O acerto das matrículas não pode ser realizado, pois ocorreram erros.'+#13+#10+
          'Verifique as mensagens na pasta ERRO.', mtError, [mbOk], 0);
        dtmBasedados.dbBaseDados.Rollback;
        MessageDlg('Processo cancelado por erro.', mtWarning, [mbOk], 0);
      end;
    end;
  end;
end;

function TfrmAcertaReservaMigracao.AcertaReserva(aidpessoa,
  aidtiporeserva: integer; arreservaini: real): boolean;
var rReserva: real;
    ssql: string;
    sdata: string;
    sidhist: string;
    iAno, iMes, iDia: word;
begin
  result:=false;
  //pega historico inicial
  ssql:='SELECT IDHISTRESERVA, TRGDTINCLUSAO '+
        'FROM HISTMOVRESERVA '+
        'WHERE IDPLANOPREV = 33 '+
        'AND IDTIPORESERVA = '+inttostr(aidtiporeserva)+' '+
        'AND FLGENTRADA = 1 '+
        'AND IDEVENTOGERADOR = 45 '+
        'AND IDBENEFICIO IS NULL '+
        'AND IDCONTRIBUICAO IS NULL '+
        'AND FLGPROCEDENCIA = 0 '+
        'AND NVL(VLRREAL,0) <> 0 '+
        'AND IDPESSOA = '+inttostr(aidpessoa);

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(ssql);
  try
    qryAux.Open;
  except
    exit;
  end;

  if qryAux.isempty then
  begin
    result:=true;
    exit;
  end;

  sidhist:=qryAux.fieldbyname('idhistreserva').asstring;

  //pega historico inicial
  ssql:='SELECT INSCRICAODATA-30 AS DATA '+
        'FROM PARTPREVPLAN '+
        'WHERE IDPLANOPREV = 33 '+
        'AND IDPESSOA = '+inttostr(aidpessoa);

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(ssql);
  try
    qryAux.Open;
  except
    exit;
  end;
  DecodeDate(qryAux.fieldbyname('data').asdatetime, iAno, iMes, iDia);
  sdata:=formatdatetime('dd/mm/yyyy', diasuteis.UltDiaMes(iAno, iMes));

  //deleta histórico
  ssql:=
    'DELETE FROM HISTMOVRESERVA '+
    'WHERE IDPLANOPREV = 33 '+
    'AND IDTIPORESERVA = '+inttostr(aidtiporeserva)+' '+
    'AND IDHISTRESERVA NOT IN ( '+
    ' SELECT IDHISTRESERVA '+
    ' FROM HISTMOVRESERVA '+
    ' WHERE IDPLANOPREV = 33 '+
    ' AND IDTIPORESERVA = '+inttostr(aidtiporeserva)+' '+
    ' AND FLGENTRADA = 1 '+
    ' AND IDEVENTOGERADOR = 45 '+
    ' AND IDBENEFICIO IS NULL '+
    ' AND IDCONTRIBUICAO IS NULL '+
    ' AND FLGPROCEDENCIA = 0 '+
    ' AND NVL(VLRREAL,0) <> 0 '+
    ' AND IDPESSOA = '+inttostr(aidpessoa)+' '+
    ') '+
    'AND IDPESSOA = '+inttostr(aidpessoa)+' ';
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(ssql);
  try
    qryAux.execsql;
  except
    exit;
  end;

  //atualiza reserva e data na Reservapart
  ssql:='UPDATE RESERVAPART '+
    ' SET VALORRESERVA = '+oranumero(floattostr(arreservaini))+', '+
    '     DATAULTATUALIZA = TO_DATE('+quotedstr(sdata)+',''dd/mm/yyyy'') '+
    ' WHERE IDPLANOPREV = 33 '+
    ' AND IDTIPORESERVA = '+inttostr(aidtiporeserva)+' '+
    ' AND IDPESSOA = '+inttostr(aidpessoa)+' ';
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(ssql);
  try
    qryAux.execsql;
  except
    exit;
  end;

  //atualiza valor com acerto na Histmovreserva
  ssql:='UPDATE HISTMOVRESERVA '+
    ' SET VLRREAL = '+oranumero(floattostr(arreservaini))+', '+
    '     VLRCOTAS = '+oranumero(floattostr(arreservaini))+', '+
    '     SALDOREAL = '+oranumero(floattostr(arreservaini))+', '+
    '     SALDOCOTAS = '+oranumero(floattostr(arreservaini))+' '+
    ' WHERE IDPLANOPREV = 33 '+
    ' AND IDTIPORESERVA = '+inttostr(aidtiporeserva)+' '+
    ' AND IDHISTRESERVA = '+sidhist+' '+
    ' AND IDPESSOA = '+inttostr(aidpessoa)+' ';
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(ssql);
  try
    qryAux.execsql;
  except
    exit;
  end;

  result:=true;
end;

end.
