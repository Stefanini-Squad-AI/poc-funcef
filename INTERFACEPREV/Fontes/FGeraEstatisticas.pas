// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Claudio Faria
// Rotina      : Varias
// Data        : 21/08/2007
// Pendência   : 22108
// Alteração   : Troca do DateToStr para FormatDateTime.
// -----------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : Leo
// Data        : 08/10/2002
// Alteração   : trazultdiames agora chamado da funcoesuteis
//------------------------------------------------------------------------------
// Sistema  .: ADMPREV
// Objetivo .: Gera Arquivo do SPC
// Form     .: FrmGeraArqSPC - Unit .: FGeraArqSPC
// Data     .:
// Autor    .: Alexandre Soares
//------------------------------------------------------------------------------
// Alterações :
//  05/07/2000  - Alexandre Ramos.
//                Acerto na Logica de Consolidacao dos Dados e montagem do
//                Arquivo texto.
//------------------------------------------------------------------------------
  {FDIAS - REFER - 29.06.2001 - ALTERADA A QUERY QRYBUSCADADOS}
  {FDIAS - REFER - 29.06.2001 - INCLUIDA A VARIAVEL iIdFundacaoCCP, oriunda de
   UCCP - também acrescentada no Uses, pois a variável iIdFundacao, oriunda
   da UAdmPrev não estava sendo setada, pois a LeParam que é chamada no form
   Fprincipal é a da UCCP}
unit FGeraEstatisticas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, checklst, Db, DBTables, Wwquery, StdCtrls, FileCtrl,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
  ComCtrls, TREdit, Wwdatsrc, Mask, Grids, DBGrids, Spin, wwdbedit,
  Wwdotdot, Wwdbcomb;

type
  TFrmGeraEstatisticas = class(TfrmSairAjuda)
    qryAux: TwwQuery;
    qryGeraEstat: TwwQuery;
    updPatroSpc: TUpdateSQL;
    updPlanoSpc: TUpdateSQL;
    updBenefSpc: TUpdateSQL;
    qryPatroSpc: TwwQuery;
    qryPlanoSpc: TwwQuery;
    qryBenefSpc: TwwQuery;
    qryApagaEstat: TwwQuery;
    qryGeraBenef: TwwQuery;
    qrySitBenef: TwwQuery;
    PageControl1: TPageControl;
    SPC: TTabSheet;
    Resultado: TTabSheet;
    ProgressBar1: TProgressBar;
    Panel1: TPanel;
    bbtnProcessarCalculo: TBitBtn;
    QryBuscaDados: TwwQuery;
    QryArquivo: TwwQuery;
    UpdArquivo: TUpdateSQL;
    DsArquivo: TwwDataSource;
    QryPensao: TwwQuery;
    QryBuscaInvalidez: TwwQuery;
    QryReserva: TwwQuery;
    QryReservaAuto: TwwQuery;
    QryPopulacao: TwwQuery;
    QryProcAposen: TwwQuery;
    QryDepAtivos: TwwQuery;
    QryDepAposentados: TwwQuery;
    QryDepPensao: TwwQuery;
    DsBenefSpc: TDataSource;
    DBGrid1: TDBGrid;
    QryMostraResult: TwwQuery;
    DsMostraResult: TDataSource;
    Gb: TGroupBox;
    Label1: TLabel;
    mebMes: TComboBox;
    Label2: TLabel;
    mebAno: TSpinEdit;
    grpbLocalArquivo: TGroupBox;
    dirlbArquivos: TDirectoryListBox;
    drvcmbArquivos: TDriveComboBox;
    qryAtivosSemEventos: TwwQuery;
    chkEventos: TCheckBox;
    qryMantidosSemEventos: TwwQuery;
    function  TestarEstat(Sender: TObject): boolean;
    procedure ApagarEstat;
    procedure GerarEstat;
    procedure GerarTexto(sCodFund,sCodBenef,sTotConc,sTotAnt,sTotCanc: string);
    procedure bbtnProcessarCalculoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
  private
    { Private declarations }
    Procedure InserePatro(QryDados:TwwQuery; CodSPC:String);
    Procedure InserePlano(QryDados:TwwQuery; CodSPC:String);
    Procedure InsereBeneficio(QryDados:TwwQuery; CodSPC:String);

    { Novas }
    Procedure GeraEstatisticas;
    Procedure GeraEstatBenef;
    Procedure GeraEstatBenefProc;
    Procedure GeraEstatPlano;
    Procedure GeraEstatPatro;
    Procedure GeraRelatSPC(QryDados:TwwQuery);
    Procedure GeraLinhaTexto(CodBenefSPC:String; Nivel:Integer);
    Procedure GeraArquivo;
    Procedure ImprimeRelat;
    Procedure GeraTotalizacoes;
    Procedure PreencheVazios;

    Procedure DDD(QryArquivo:TwwQuery);

  public
    { Public declarations }
  end;

var
  FrmGeraEstatisticas: TFrmGeraEstatisticas;
  wDia,wMes,wAno                           : Word;
  sAnoMes, sCampo, DataIni, DataFim, mes   : string;
  iFlag                                    : integer;
  tfArquivo                                : TextFile;
  arParam                                  : array [0..8] of integer;
  wNumFundacao :String;
  iIdFundacaoCCP : Integer;
Const
  VetBeneficios:Array[0..40] Of String =
             (
              'Beneficios de Prestação Continuada',
              'Aposentadorias',
              'Aposentadoria Especial/Ex-Combatente',
              'Aposentadoria Invalidez',
              'Aposentadoria por Idade',
              'Aposentadoria por Tempo de Servico',
              'Aposentadoria Antecipada',
              'Aposentadoria Postergada',
              'Pensoes',
              'Pensao - Origem Ativo',
              'Pensao - Origem Aposentado',
              'Auxilios',
              'Auxilio Reclusao',
              'Auxilio Doenca',
              'Outros Beneficios',
              'Beneficios de Prestação Unica',
              'Peculios',
              'Peculio - Morte Ativo',
              'Peculio - Morte Aposentado',
              'Peculio - Morte Dependente',
              'Peculio - Invalidez',
              'Auxilios',
              'Auxílio Funeral',
              'Auxílio Natalidade',
              'Auxílio Nupcial',
              'Auxílio Educação',
              'Outros Beneficios',
              'Reservas de Poupança',
              'Res. de Poup. de Ativo - Custeio Patronal',
              'Res. de Poup. de Ativo - Autopatrocinado',
              'População Abrangida',
              'Participantes Ativos',
              'Participantes Ativos - com Cust. Patronal',
              'Participantes Ativos - Autopatrocinado',
              'Participantes Ativos - Beneficio Diferido',
              'Participantes Ativos - Processo de Aposentadoria',
              'Participantes Aposentados',
              'Dependentes',
              'Dependentes de Ativo',
              'Dependentes de Aposentado',
              'Beneficiarios de Pensões'
             );

implementation

uses UMensErro,UAdmPrev, UDiasUteis, UDataBase, DmRelAugusto, UCCP, dBaseDados,
  UFuncoesUteis;

{$R *.DFM}

//******************************************************************************
function TFrmGeraEstatisticas.TestarEstat(Sender: TObject):boolean;
var
  sSQLSel: string;
begin
  Result := False;
  sSQLSel := 'SELECT P.CODFUNDSPC, B.CODBENEFSPC,   '   +
             '       SUM(B.TOTBENEFCONC) "TOTCONC", '   +
             '       SUM(B.TOTBENEFENC) "TOTENC", '     +
             '       SUM(B.TOTBENEFANT) "TOTANT" '      +
             'FROM ESTBENEFSPC B, ESTPATROSPC P '       +
             'WHERE (B.IDPESSJUR = P.IDPESSJUR) AND '   +
             '      (B.ANOMES    = P.ANOMES) AND '      +
             '      (B.ANOMES    = '''+sAnoMes+''') '   +
             'GROUP BY P.CODFUNDSPC, B.CODBENEFSPC';

  If FazQuery(QryAux,sSQLSel) Then Begin
    Result:=True;
  End;
end;

//******************************************************************************
procedure TFrmGeraEstatisticas.ApagarEstat;
var sSQLDel : string;
begin
  // Apaga as estatísticas
  sSqlDel := 'DELETE FROM ESTBENEFSPC WHERE ANOMES = ''' + sAnoMes + '''';
  qryApagaEstat.Sql.Clear;
  qryApagaEstat.Sql.Add(sSqlDel);
  qryApagaEstat.ExecSQL;
  sSqlDel := 'DELETE FROM ESTPLANOSPC WHERE ANOMES = ''' + sAnoMes + '''';
  qryApagaEstat.Sql.Clear;
  qryApagaEstat.Sql.Add(sSqlDel);
  qryApagaEstat.ExecSQL;
  sSqlDel := 'DELETE FROM ESTPATROSPC WHERE ANOMES = ''' + sAnoMes + '''';
  qryApagaEstat.Sql.Clear;
  qryApagaEstat.Sql.Add(sSqlDel);
  qryApagaEstat.ExecSQL;
end;

//******************************************************************************
procedure TFrmGeraEstatisticas.GerarEstat;
var
  sSQLAux, sSQLGerEst : string;
  varFields: variant;
begin
// Grava a estatística de patrocinadoras (ESTPATROSPC)
// FUNCIONARIOS ATIVOS
  sSqlAux := 'SELECT P.IDPESSOA, TOTAL, F.CODFUNDSPC ' +
             'FROM PATRO P, FUNDACAO F, '              +
             '(SELECT E.IDPESSJUR , COUNT(IDPESSOA) "TOTAL" ' +
             'FROM ELEGPATRO E, '                   +
                  '(SELECT IDSITFUNC FROM SITFUNC ' +
                   'WHERE (TIPOSIT = ''A'') OR '    +
                         '(TIPOSIT = ''F'')) S '    +
             'WHERE (E.IDSITFUNC = S.IDSITFUNC) '   +
             'GROUP BY E.IDPESSJUR) EP '            +
             'WHERE (P.IDPESSOA = EP.IDPESSJUR) AND '   +
             '(P.IDFUNDACAO = ' + inttostr(iIdFundacaoCCP) + ') AND ' +
             '(P.IDFUNDACAO = F.IDPESSOA)';
  qryAux.SQL.Clear;
  qryAux.SQL.Add(sSQLAux);
  qryAux.Prepare;
  qryAux.Open;
  qryAux.First;
  qryPatroSPC.Close;
  qryPatroSPC.Prepare;
  qryPatroSPC.Open;
  ProgressBar1.Min := 0;
  ProgressBar1.Max := qryAux.RecordCount;
  ProgressBar1.Step:= 1;
  ProgressBar1.Position := 0;

  while not qryAux.EOF do begin
    qryPatroSPC.Insert;
    qryPatroSPC.FieldByName('IDPESSJUR').asinteger := qryAux.FieldByName('IDPESSOA').asinteger;
    qryPatroSPC.FieldByName('ANOMES').asstring     := sAnoMes;
    qryPatroSPC.FieldByName('TOTFUNC').asinteger   := qryAux.FieldByName('TOTAL').asinteger;
    qryPatroSPC.FieldByName('CODFUNDSPC').asstring := qryAux.FieldByName('CODFUNDSPC').asstring;
    qryPatroSPC.Post;
    qryAux.Next;
    ProgressBar1.Position := ProgressBar1.Position + 1;
    ProgressBar1.Update;
  end;

  qryPatroSPC.ApplyUpdates;

  // Grava a estatística de plano das patrocinadoras (ESTPLANOSPC)
  sSqlAux := 'SELECT PP.IDPESSJUR, PP.IDPLANOPREV '   +
             'FROM PARTPREVPLAN PP, PATRO P '         +
             'WHERE (PP.IDPESSJUR = P.IDPESSOA) AND ' +
                   '(P.IDFUNDACAO = ' + inttostr(iIdFundacaoCCP) + ') ' +
                   'GROUP BY PP.IDPESSJUR, PP.IDPLANOPREV ' ;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(sSQLAux);
  qryAux.Prepare;
  qryAux.Open;
  qryAux.First;
  qryPlanoSPC.Close;
  qryPlanoSPC.Prepare;
  qryPlanoSPC.Open;
  ProgressBar1.Min := 0;
  ProgressBar1.Max := qryAux.RecordCount;
  ProgressBar1.Step := 1;
  ProgressBar1.Position := 0;
  while not qryAux.EOF do begin
    qryPlanoSPC.Insert;
    qryPlanoSPC.FieldByName('IDPESSJUR').asinteger   := qryAux.FieldByName('IDPESSJUR').asinteger;
    qryPlanoSPC.FieldByName('ANOMES').asstring       := sAnoMes;
    qryPlanoSPC.FieldByName('IDPLANOPREV').asinteger := qryAux.FieldByName('IDPLANOPREV').asinteger;
    qryPlanoSPC.Post;
    qryAux.Next;
    ProgressBar1.Position := ProgressBar1.Position + ProgressBar1.Step;
    ProgressBar1.Update;
  end;

  qryPlanoSPC.ApplyUpdates;

end;

{******************************************************************************}
procedure TFrmGeraEstatisticas.bbtnProcessarCalculoClick(Sender: TObject);
Var
  sArq, sSQLGer, sSQLAux : String;
  Inicio:TTime;
begin
  inherited;
  iFlag := 0;
//------------------------------------------------------------------------------
// Testa Parametros
  if mebMes.ItemIndex = -1  then begin
    MsgDlg('Mês incorreto !','Informação',mtInformation,[mbOk,mbHelp],0);
    mebMes.SetFocus;
    exit;
  end;

  if trim(mebAno.Text) = '' then begin
    MsgDlg('Informe o ano desejado.','Informação',mtInformation,[mbOk,mbHelp],0);
    mebAno.SetFocus;
    exit;
  end;
  Inicio := Time;
// Verificar se existe dados de Estatística
  if mebMes.ItemIndex < 10 Then
     sAnoMes := mebAno.Text+'/0'+IntToStr(mebMes.ItemIndex+1)
  else
     sAnoMes := mebAno.Text+'/'+IntToStr(mebMes.ItemIndex+1);
// Gerar arquivo texto com o mês/ano requisitado
  arParam[0] := 10;
  arParam[1] := 3;
  arParam[2] := 10;
  arParam[3] := 4;
  arParam[4] := 2;
  arParam[5] := 10;
  arParam[6] := 10;
  arParam[7] := 10;
  arParam[8] := 50;

// Monta as Datas
  If mebMes.ItemIndex+1 < 10 Then begin
    DataIni := '01/0'+IntToStr(mebMes.ItemIndex+1)+'/'+mebano.Text;
    mes     := '0'+IntToStr(mebMes.ItemIndex+1);
  end else begin
    DataIni := '01/'+IntToStr(mebMes.ItemIndex+1)+'/'+mebano.Text;
    mes     := IntToStr(mebMes.ItemIndex+1)
  end;

// Monta Data Final
  if mebMes.ItemIndex+1 < 10  then
    DataFim := '/0'+IntToStr(mebMes.ItemIndex+1)+'/'+mebano.Text;
  if mebMes.ItemIndex+1 >= 10  then
    DataFim := '/0'+IntToStr(mebMes.ItemIndex+1)+'/'+mebano.Text;

  // Pega o Ultimo Dia
  DataFim := FormatDateTime('dd/mm/yyyy', TrazUltDiaMes((mebMes.ItemIndex+1),StrToInt(mebano.Text))) +
             copy(DataFim,3,8);

//------------------------------------------------------------------------------
// Buscar Dados do Banco
  Screen.Cursor := crHourGlass;
// Precnhe Parametros
  QryBuscaDados.Close;
  QryBuscaDados.ParamByName('DATAINI').AsString:=DataIni;
  QryBuscaDados.ParamByName('DATAFIM').AsString:=DataFim;
// Abre a Consulta
  QryBuscaDados.Open;
  Screen.Cursor := crArrow;
// Caso Vazia Sai Fora
  If QryBuscaDados.IsEmpty Then Begin
    MsgDlg('Não existem dados para Processar.','Mensagem do Sistema',mtError,[MbOk],0);
    Exit;
  End;

  { Apaga Registro Fantasma e abre a Consulta }
  DtmRelAugusto.QrySPC.Close;
  DtmRelAugusto.QrySPC.Open;
  DtmRelAugusto.QrySPC.Delete;

  { Fecha e Abre Tabela de Transferencia (em Cache) }
  QryArquivo.Close;
  QryArquivo.Open;
  { Deleta o Registro Vazio (Virtual) }
  QryArquivo.Delete;

  { Busca Codigo da Fundacao e guarda }
  FazQuery(QryAux,'SELECT CODFUNDSPC FROM FUNDACAO '+
                  'WHERE  IDPESSOA   = '+IntToStr(iIdFundacaoCCP));
  wNumFundacao := QryAux.FieldByname('CODFUNDSPC').AsString;


// Cria Arquivo Texto para Exportacao
  Try
    sArq  := dirlbArquivos.Directory + '\ESTATSPC.TXT';
    AssignFile(tfArquivo,sArq);
    Rewrite(tfArquivo);
    {------------------------------------------------}
    { Nova Rotina para Gerar arquivo de Estatisticas }
    GeraEstatisticas;

    ProgressBar1.Position:=0;

    { Gera Relatorio do SPC }
    FazQuery(QryMostraResult,
                     'SELECT CODBENEFSPC, SUM(TOTBENEFCONC) AS CONCEDIDOS, '+
                     '                    SUM(TOTBENEFENC)  AS CANCELADOS, '+
                     '                    SUM(TOTBENEFANT)  AS ANTERIORES  '+
                     'FROM ESTBENEFSPC                                     '+
                     'WHERE ANOMES = ''' + sAnoMes + ''''+
                     'GROUP BY CODBENEFSPC                                 '+
                     'ORDER BY CODBENEFSPC                                 ');
    GeraRelatSPC(QryMostraResult);
    { Gera Totalizacoes no Arquivo de Espatisticas }
    GeraTotalizacoes;
    GeraArquivo;
  Finally
    { Fecha Arquivo } 
    CloseFile(tfArquivo);
  End;

  { Final do Processo }
  If MsgDlg('Processo terminado, tempo decorrido .: '+TimeToStr(Time - Inicio)+#13+
            'Deseja imprimir reltório ? ',
            'Mensagem do Sistema',mtConfirmation,[MbYes, mbNo],0) = MrYes Then Begin
     ImprimeRelat;
  End;
end;

{------------------------------------------------------------------------------}
{ Gera Totalizações das Estatisticas                                           }
Procedure TFrmGeraEstatisticas.GeraTotalizacoes;
Begin
  { Busca Totais do grupo 10000 }
  FazQuery(QryAux,'SELECT ''10000'' AS CODBENEFSPC,        '+
                  '       SUM(TOTBENEFCONC) AS CONCEDIDOS, '+
                  '       SUM(TOTBENEFENC)  AS CANCELADOS, '+
                  '       SUM(TOTBENEFANT)  AS ANTERIORES  '+
                  'FROM ESTBENEFSPC                        '+
                  'WHERE ANOMES = ''' + sAnoMes + ''''+
                  '  AND SUBSTR(CODBENEFSPC,1,2) = ''10''');
  QryArquivo.First;
  GeraRelatSPC(QryAux);

  { Busca Totais do grupo 10100 }
  FazQuery(QryAux,'SELECT ''10100'' AS CODBENEFSPC,             '+
                  '       SUM(TOTBENEFCONC) AS CONCEDIDOS, '+
                  '       SUM(TOTBENEFENC)  AS CANCELADOS, '+
                  '       SUM(TOTBENEFANT)  AS ANTERIORES '+
                  'FROM ESTBENEFSPC                        '+
                  'WHERE ANOMES = ''' + sAnoMes + ''''+
                  '  AND SUBSTR(CODBENEFSPC,1,4) = ''1010''');
  { Inclui Linha nas Estatisticas }
  QryArquivo.First;
  GeraRelatSPC(QryAux);

  { Busca Totais do grupo 10200 }
  FazQuery(QryAux,'SELECT ''10200'' AS CODBENEFSPC,             '+
                  '       SUM(TOTBENEFCONC) AS CONCEDIDOS, '+
                  '       SUM(TOTBENEFENC)  AS CANCELADOS, '+
                  '       SUM(TOTBENEFANT)  AS ANTERIORES '+
                  'FROM ESTBENEFSPC                        '+
                  'WHERE ANOMES = ''' + sAnoMes + ''''+
                  '  AND SUBSTR(CODBENEFSPC,1,4) = ''1020''');
  { Inclui Linha nas Estatisticas }
  QryArquivo.First;
  GeraRelatSPC(QryAux);

  { Busca Totais do grupo 10300 }
  FazQuery(QryAux,'SELECT ''10300'' AS CODBENEFSPC,             '+
                  '       SUM(TOTBENEFCONC) AS CONCEDIDOS, '+
                  '       SUM(TOTBENEFENC)  AS CANCELADOS, '+
                  '       SUM(TOTBENEFANT)  AS ANTERIORES '+
                  'FROM ESTBENEFSPC                        '+
                  'WHERE ANOMES = ''' + sAnoMes + ''''+
                  '  AND SUBSTR(CODBENEFSPC,1,4) = ''1030''');
  { Inclui Linha nas Estatisticas }
  QryArquivo.First;
  GeraRelatSPC(QryAux);

  { Busca Totais do grupo 10400 }
  FazQuery(QryAux,'SELECT ''10400'' AS CODBENEFSPC,             '+
                  '       SUM(TOTBENEFCONC) AS CONCEDIDOS, '+
                  '       SUM(TOTBENEFENC)  AS CANCELADOS, '+
                  '       SUM(TOTBENEFANT)  AS ANTERIORES '+
                  'FROM ESTBENEFSPC                        '+
                  'WHERE ANOMES = ''' + sAnoMes + ''''+
                  '  AND SUBSTR(CODBENEFSPC,1,4) = ''1040''');
  { Inclui Linha nas Estatisticas }
  QryArquivo.First;
  GeraRelatSPC(QryAux);

  {----------------------------------------------------------------------------}
  { Busca Totais do grupo 20000 }
  FazQuery(QryAux,'SELECT ''20000'' AS CODBENEFSPC,             '+
                  '       SUM(TOTBENEFCONC) AS CONCEDIDOS, '+
                  '       SUM(TOTBENEFENC)  AS CANCELADOS, '+
                  '       SUM(TOTBENEFANT)  AS ANTERIORES '+
                  'FROM ESTBENEFSPC                        '+
                  'WHERE ANOMES = ''' + sAnoMes + ''''+
                  '  AND SUBSTR(CODBENEFSPC,1,2) = ''20''');
  QryArquivo.First;
  GeraRelatSPC(QryAux);

  { Busca Totais do grupo 20100 }
  FazQuery(QryAux,'SELECT ''20100'' AS CODBENEFSPC,             '+
                  '       SUM(TOTBENEFCONC) AS CONCEDIDOS, '+
                  '       SUM(TOTBENEFENC)  AS CANCELADOS, '+
                  '       SUM(TOTBENEFANT)  AS ANTERIORES '+
                  'FROM ESTBENEFSPC                        '+
                  'WHERE ANOMES = ''' + sAnoMes + ''''+
                  '  AND SUBSTR(CODBENEFSPC,1,4) = ''2010''');
  { Inclui Linha nas Estatisticas }
  QryArquivo.First;
  GeraRelatSPC(QryAux);

  { Busca Totais do grupo 20200 }
  FazQuery(QryAux,'SELECT ''20200'' AS CODBENEFSPC,             '+
                  '       SUM(TOTBENEFCONC) AS CONCEDIDOS, '+
                  '       SUM(TOTBENEFENC)  AS CANCELADOS, '+
                  '       SUM(TOTBENEFANT)  AS ANTERIORES '+
                  'FROM ESTBENEFSPC                        '+
                  'WHERE ANOMES = ''' + sAnoMes + ''''+
                  '  AND SUBSTR(CODBENEFSPC,1,4) = ''2020''');
  { Inclui Linha nas Estatisticas }
  QryArquivo.First;
  GeraRelatSPC(QryAux);
  { Busca Totais do grupo 20300 }
  FazQuery(QryAux,'SELECT ''20300'' AS CODBENEFSPC,             '+
                  '       SUM(TOTBENEFCONC) AS CONCEDIDOS, '+
                  '       SUM(TOTBENEFENC)  AS CANCELADOS, '+
                  '       SUM(TOTBENEFANT)  AS ANTERIORES '+
                  'FROM ESTBENEFSPC                        '+
                  'WHERE ANOMES = ''' + sAnoMes + ''''+
                  '  AND SUBSTR(CODBENEFSPC,1,4) = ''2030''');
  { Inclui Linha nas Estatisticas }
  QryArquivo.First;
  GeraRelatSPC(QryAux);

  {----------------------------------------------------------------------------}
  { Busca Totais do grupo 30000 }
  FazQuery(QryAux,'SELECT ''30000'' AS CODBENEFSPC,             '+
                  '       SUM(TOTBENEFCONC) AS CONCEDIDOS, '+
                  '       SUM(TOTBENEFENC)  AS CANCELADOS, '+
                  '       SUM(TOTBENEFANT)  AS ANTERIORES '+
                  'FROM ESTBENEFSPC                        '+
                  'WHERE ANOMES = ''' + sAnoMes + ''''+
                  '  AND SUBSTR(CODBENEFSPC,1,2) = ''30''');
  QryArquivo.First;
  GeraRelatSPC(QryAux);

  {----------------------------------------------------------------------------}
  { Busca Totais do grupo 40000 }
  FazQuery(QryAux,'SELECT ''40000'' AS CODBENEFSPC,             '+
                  '       SUM(TOTBENEFCONC) AS CONCEDIDOS, '+
                  '       SUM(TOTBENEFENC)  AS CANCELADOS, '+
                  '       SUM(TOTBENEFANT)  AS ANTERIORES '+
                  'FROM ESTBENEFSPC                        '+
                  'WHERE ANOMES = ''' + sAnoMes + ''''+
                  '  AND SUBSTR(CODBENEFSPC,1,2) = ''40''');
  QryArquivo.First;
  GeraRelatSPC(QryAux);

  { Busca Totais do grupo 40100 }
  FazQuery(QryAux,'SELECT ''40100'' AS CODBENEFSPC,             '+
                  '       SUM(TOTBENEFCONC) AS CONCEDIDOS, '+
                  '       SUM(TOTBENEFENC)  AS CANCELADOS, '+
                  '       SUM(TOTBENEFANT)  AS ANTERIORES '+
                  'FROM ESTBENEFSPC                        '+
                  'WHERE ANOMES = ''' + sAnoMes + ''''+
                  '  AND SUBSTR(CODBENEFSPC,1,4) = ''4010''');
  { Inclui Linha nas Estatisticas }
  QryArquivo.First;
  GeraRelatSPC(QryAux);
  { Busca Totais do grupo 40200 }
  FazQuery(QryAux,'SELECT ''40200'' AS CODBENEFSPC,             '+
                  '       SUM(TOTBENEFCONC) AS CONCEDIDOS, '+
                  '       SUM(TOTBENEFENC)  AS CANCELADOS, '+
                  '       SUM(TOTBENEFANT)  AS ANTERIORES '+
                  'FROM ESTBENEFSPC                        '+
                  'WHERE ANOMES = ''' + sAnoMes + ''''+
                  '  AND SUBSTR(CODBENEFSPC,1,4) = ''4020''');
  { Inclui Linha nas Estatisticas }
  QryArquivo.First;
  GeraRelatSPC(QryAux);
  { Busca Totais do grupo 40300 }
  FazQuery(QryAux,'SELECT ''40300'' AS CODBENEFSPC,             '+
                  '       SUM(TOTBENEFCONC) AS CONCEDIDOS, '+
                  '       SUM(TOTBENEFENC)  AS CANCELADOS, '+
                  '       SUM(TOTBENEFANT)  AS ANTERIORES '+
                  'FROM ESTBENEFSPC                        '+
                  'WHERE ANOMES = ''' + sAnoMes + ''''+
                  '  AND SUBSTR(CODBENEFSPC,1,4) = ''4030''');
  { Inclui Linha nas Estatisticas }
  QryArquivo.First;
  GeraRelatSPC(QryAux);
  {----------------------------------------------------------------------------}
  { Preenche os Que não foram incluidos pela Consulta Inicial }
  PreencheVazios;


End;

{------------------------------------------------------------------------------}
{ Gera Relatorio de Estatisticas do SPC                                        }
Procedure TFrmGeraEstatisticas.GeraRelatSPC(QryDados:TwwQuery);
Begin

  While Not QryDados.EOF do Begin

    { Transfere Dados }
    QryArquivo.Insert;

    QryArquivo.FieldByName('CODFUND').AsString    := wNumFundacao;
    QryArquivo.FieldByName('CODIGO').AsString     := QryDados.FieldByName('CODBENEFSPC').AsString;
    QryArquivo.FieldByName('ANTERIOR').AsInteger  := QryDados.FieldByName('ANTERIORES').AsInteger;
    QryArquivo.FieldByName('CONCEDIDO').AsInteger := QryDados.FieldByName('CONCEDIDOS').AsInteger;
    QryArquivo.FieldByName('CANCELADO').AsInteger := QryDados.FieldByName('CANCELADOS').AsInteger;

    QryArquivo.FieldByName('ATUAL').AsInteger     := (QryDados.FieldByName('ANTERIORES').AsInteger-
                                                      QryDados.FieldByName('CANCELADOS').AsInteger+
                                                      QryDados.FieldByName('CONCEDIDOS').AsInteger);

    QryArquivo.Post;
    QryDados.Next;
  End;

End;

{------------------------------------------------------------------------------}
{ Gera Totalizacoes dos SubGrupos e Guarda dados na QrySPC                     }
Procedure TFrmGeraEstatisticas.GeraArquivo;
Begin
// Gera Linha do Arquivo Texto
  GeraLinhaTexto('10000',1);

    GeraLinhaTexto('10100',2);

      GeraLinhaTexto('10101',3);
      GeraLinhaTexto('10102',3);
      GeraLinhaTexto('10103',3);
      GeraLinhaTexto('10104',3);
      GeraLinhaTexto('10105',3);
      GeraLinhaTexto('10106',3);

    GeraLinhaTexto('10200',2);

      GeraLinhaTexto('10201',3);
      GeraLinhaTexto('10202',3);

    GeraLinhaTexto('10300',2);

      GeraLinhaTexto('10301',3);
      GeraLinhaTexto('10302',3);

    GeraLinhaTexto('10400',2);

  GeraLinhaTexto('20000',1);

    GeraLinhaTexto('20100',2);

      GeraLinhaTexto('20101',3);
      GeraLinhaTexto('20102',3);
      GeraLinhaTexto('20103',3);
      GeraLinhaTexto('20104',3);

    GeraLinhaTexto('20200',2);

      GeraLinhaTexto('20201',3);
      GeraLinhaTexto('20202',3);
      GeraLinhaTexto('20203',3);
      GeraLinhaTexto('20204',3);

    GeraLinhaTexto('20300',2);

  GeraLinhaTexto('30000',1);

    GeraLinhaTexto('30100',2);
    GeraLinhaTexto('30200',2);

  GeraLinhaTexto('40000',1);

    GeraLinhaTexto('40100',2);

      GeraLinhaTexto('40101',3);
      GeraLinhaTexto('40102',3);
      GeraLinhaTexto('40103',3);
      GeraLinhaTexto('40104',3);

    GeraLinhaTexto('40200',2);
    GeraLinhaTexto('40300',2);

      GeraLinhaTexto('40301',3);
      GeraLinhaTexto('40302',3);
      GeraLinhaTexto('40303',3);
End;

{------------------------------------------------------------------------------}
{ Grava Linhas para o Relatório                                                }
Procedure TFrmGeraEstatisticas.GeraLinhaTexto(CodBenefSPC:String; Nivel:Integer);
var
  aArq, sReg, sSpace, data_canc : String;
  iContador, iContCampo, iCont : Integer;
  sCodFund, sCodBenef, sTotConc, sTotAnt, sTotCanc: String;
Begin
  { Inicializa Variáveis }
  iContCampo := 0;
  sCampo     := '';
  sReg       := '';

  { Dados das Totalizações }
  If Not QryArquivo.Locate('CODIGO',CodBenefSPC,[]) Then Begin
    QryArquivo.Insert;
      QryArquivo.FieldByName('CODFUND').AsString    :=wNumFundacao;
      QryArquivo.FieldByName('CODIGO').AsString     :=CodBenefSPC;
      QryArquivo.FieldByName('ANTERIOR').AsInteger  :=0;
      QryArquivo.FieldByName('CONCEDIDO').AsInteger :=0;
      QryArquivo.FieldByName('CANCELADO').AsInteger :=0;
      QryArquivo.FieldByName('ATUAL').AsInteger     :=0;
     { Confirma Dados (Tabela esta em cache) }
    QryArquivo.Post;
  End;



  { Preenche Variaveis }
  sCodFund  := QryArquivo.FieldByName('CODFUND').AsString;
  sCodBenef := QryArquivo.FieldByName('CODIGO').AsString;
  sTotConc  := QryArquivo.FieldByName('CONCEDIDO').AsString;
  sTotAnt   := QryArquivo.FieldByName('ANTERIOR').AsString;
  sTotCanc  := QryArquivo.FieldByName('CANCELADO').AsString;

  While icontCampo < 9 Do Begin
    { Campos do Arquivo Texto        }
    { ------------------------       }
    { 0 : Código da Fundação         }
    { 1 : Códiigo da Árvore          }
    { 2 : Código do Benefício        }
    { 3 : Ano                        }
    { 4 : Mês                        }
    { 5 : Total de Concedidos        }
    { 6 : Total de Cancelados        }
    { 7 : Total de Anteriores        }
    { 8 : (OBSERVAÇÕES) VAZIO !!!!!  }

    { sReg é a linha a ser gravada   }
    { Se for o 1º ou o 3º campo      }

    Case icontCampo Of
      0:sCampo := sCodFund;
      1:sCampo := IntToStr(2); { Quando Beneficio }
      2:sCampo := sCodBenef;
      3:sCampo := trim(mebano.text);
      4:sCampo := trim(mes);
      5:sCampo := sTotConc;
      6:sCampo := sTotCanc;
      7:sCampo := sTotAnt;
      8:sCampo := ' ';
    End;

    { Se o campo não estiver completamente preenchido ele completa com espaços }
    If (arParam[iContCampo] = Length(sCampo)) Then
      sReg := sReg + sCampo
    Else Begin
      sSpace := '';
      For iCont := 1 To (arParam[iContCampo] - Length(sCampo)) Do
        sSpace := sSpace + ' ';

      If (iContCampo = 5) Or (iContCampo = 6) Or (iContCampo = 7) Then
        sReg := sReg + sSpace + sCampo
      Else
        sReg := sReg + sCampo + sSpace;

    End;

    iContCampo := iContCampo + 1;


  End; { While icontCampo < 9 }


  { Grava linha do arquivo texto }
  WriteLn(tfArquivo, sReg);
  sReg := '';
  iContador  := iContador + 1;

  { Inclui na Tabela de Relatório }
  {-------------------------------}
  With DtmRelAugusto.QrySPC Do Begin
    Append;

    FieldByName('DESCRICAO').AsString   := StringOfChar(' ',Nivel*4)+
                                           CodBenefSPC+ ' - '+
                                           VetBeneficios[iFlag];

    FieldByName('TOTANTERIOR').AsFloat  := QryArquivo.FieldByName('ANTERIOR').AsFloat;
    FieldByName('TOTCONCEDIDO').AsFloat := QryArquivo.FieldByName('CONCEDIDO').AsFloat;
    FieldByName('TOTCANCELADO').AsFloat := QryArquivo.FieldByName('CANCELADO').AsFloat;
    FieldByName('TOTATUAL').AsFloat     :=
      QryArquivo.FieldByName('ATUAL').AsFloat;

    Post;
  End;

  Inc(iFlag)
End;


{------------------------------------------------------------------------------}
{ Gera Arquivo de Estatisticas                                                 }
Procedure TFrmGeraEstatisticas.GeraEstatisticas;
Begin
  { Abre Query que guarda o Processo }
  QryBenefSPC.Close;
  QryBenefSPC.Open;
  QryPlanoSpc.Close;
  QryPlanoSpc.Open;
  QryPatroSpc.Close;
  QryPatroSpc.Open;

  { Verifica se existe processo na mesma data e Exclui }
  ApagarEstat;

  { Gerar Estatisticas da Patrocinadora }
  GeraEstatPatro;
  { Gerar Estatisticas do Plano         }
  GeraEstatPlano;
  { Gerar Estatisticas de Beneficio     }
  GeraEstatBenef;
  { Confirma as Alterações no Banco de Dados }
  dtmBaseDados.dbBaseDados.AplicaUpdates([QryPatroSpc]);
  dtmBaseDados.dbBaseDados.AplicaUpdates([QryPlanoSpc]);
  dtmBaseDados.dbBaseDados.AplicaUpdates([QryBenefSpc]);
End;

{------------------------------------------------------------------------------}
{ Gera estatisticas da Patrocinadora                                           }
Procedure TFrmGeraEstatisticas.GeraEstatPatro;
Begin

  {----------------------------------------------------------------------------}
  { UTILIZADO ENQUANTO NÃO ESTA PROCESSANDO CERTO                              }
  FazQuery(QryAux,'SELECT IDPESSOA AS IDPESSJUR, 10010 AS CODFUNDSPC FROM PATRO ');
  { Processa todos os registros }
  While Not QryAux.EOF Do Begin
    { Inclui Linha nas Estatisticas }
    InserePatro(QryAux, '40102');
    { Proximo Registro }
    QryAux.Next;
  End;
  Exit;
  {----------------------------------------------------------------------------}

End;

{------------------------------------------------------------------------------}
{ Gera estatisticas do Plano                                                   }
Procedure TFrmGeraEstatisticas.GeraEstatPlano;
Begin
  {-----------------------------------------------}
  // Se usuario optou por nao utilizar eventos, entao utilizar querys alternativas
  if chkEventos.Checked
  then begin
     qryAtivosSemEventos.Close;
     qryAtivosSemEventos.ParamByName('DATAINI').AsString :=DataIni;
     qryAtivosSemEventos.ParamByName('DATAFIM').AsString :=DataFim;
     qryAtivosSemEventos.ParamByName('FLGINTERNO1').AsString :='AT';
     qryAtivosSemEventos.ParamByName('FLGINTERNO2').AsString :='MP';
     qryAtivosSemEventos.Open;
     { Processa todos os registros }
     While Not qryAtivosSemEventos.EOF Do Begin
       { Inclui Linha nas Estatisticas }
       InserePlano(qryAtivosSemEventos, '40102');
       { Proximo Registro }
       qryAtivosSemEventos.Next;
     End;


     qryMantidosSemEventos.Close;
     qryMantidosSemEventos.ParamByName('DATAINI').AsString :=DataIni;
     qryMantidosSemEventos.ParamByName('DATAFIM').AsString :=DataFim;
     qryMantidosSemEventos.ParamByName('FLGINTERNO1').AsString :='MA';
     qryMantidosSemEventos.ParamByName('FLGINTERNO2').AsString :='MA';
     qryMantidosSemEventos.Open;
     { Processa todos os registros }
     While Not qryMantidosSemEventos.EOF Do Begin
       { Inclui Linha nas Estatisticas }
       InserePlano(qryAtivosSemEventos, '40102');
       { Proximo Registro }
       qryMantidosSemEventos.Next;
     End;

     qryMantidosSemEventos.Close;
     qryMantidosSemEventos.ParamByName('DATAINI').AsString :=DataIni;
     qryMantidosSemEventos.ParamByName('DATAFIM').AsString :=DataFim;
     qryMantidosSemEventos.ParamByName('FLGINTERNO1').AsString :='MS';
     qryMantidosSemEventos.ParamByName('FLGINTERNO2').AsString :='MS';
     qryMantidosSemEventos.Open;
     { Processa todos os registros }
     While Not qryMantidosSemEventos.EOF Do Begin
       { Inclui Linha nas Estatisticas }
       InserePlano(qryAtivosSemEventos, '40103');
       { Proximo Registro }
       qryMantidosSemEventos.Next;
     End;

     Exit;
  end;

  { Pegas as estatisticas de Participantes ativos }
  QryPopulacao.Close;
  QryPopulacao.ParamByName('DATAINI').AsString :=DataIni;
  QryPopulacao.ParamByName('DATAFIM').AsString :=DataFim;
  QryPopulacao.ParamByName('FLGINTERNO1').AsString :='AT';
  QryPopulacao.ParamByName('FLGINTERNO2').AsString :='MP';
  QryPopulacao.Open;
  { Processa todos os registros }
  While Not QryPopulacao.EOF Do Begin
    { Inclui Linha nas Estatisticas }
    InserePlano(QryPopulacao, '40102');
    { Proximo Registro }
    QryPopulacao.Next;
  End;

  {---------------------------------------------------------}
  { Pegas as estatisticas de Participantes autopatrocinados }
  QryPopulacao.Close;
  QryPopulacao.ParamByName('DATAINI').AsString :=DataIni;
  QryPopulacao.ParamByName('DATAFIM').AsString :=DataFim;
  QryPopulacao.ParamByName('FLGINTERNO1').AsString :='MA';
  QryPopulacao.ParamByName('FLGINTERNO2').AsString :='MA';
  QryPopulacao.Open;
  { Processa todos os registros }
  While Not QryPopulacao.EOF Do Begin
    { Inclui Linha nas Estatisticas }
    InserePlano(QryPopulacao, '40102');
    { Proximo Registro }
    QryPopulacao.Next;
  End;


  {-----------------------------------------------------------}
  { Pegas as estatisticas de Participantes beneficio deferido }
  QryPopulacao.Close;
  QryPopulacao.ParamByName('DATAINI').AsString :=DataIni;
  QryPopulacao.ParamByName('DATAFIM').AsString :=DataFim;
  QryPopulacao.ParamByName('FLGINTERNO1').AsString :='MS';
  QryPopulacao.ParamByName('FLGINTERNO2').AsString :='MS';
  QryPopulacao.Open;
  { Processa todos os registros }
  While Not QryPopulacao.EOF Do Begin
    { Inclui Linha nas Estatisticas }
    InserePlano(QryPopulacao, '40103');
    { Proximo Registro }
    QryPopulacao.Next;
  End;

  {----------------------------------------------------------------------------}
  { Pegas as estatisticas de Participantes ativos em processo de aposentadoria }
  QryProcAposen.Close;
  QryProcAposen.ParamByName('DATAINI').AsString :=DataIni;
  QryProcAposen.ParamByName('DATAFIM').AsString :=DataFim;
  QryProcAposen.ParamByName('IDSITBENEFICIO').AsString:='4';
  QryprocAposen.Open;
  { Processa todos os registros }
  While Not QryProcAposen.EOF Do Begin
    { Inclui Linha nas Estatisticas }
    InserePlano(QryProcAposen, '40104');
    { Proximo Registro }
    QryProcAposen.Next;
  End;

  {----------------------------------------------------}
  { Pegas as estatisticas de Participantes Aposentados }
  QryProcAposen.Close;
  QryProcAposen.ParamByName('DATAINI').AsString :=DataIni;
  QryProcAposen.ParamByName('DATAFIM').AsString :=DataFim;
  QryProcAposen.ParamByName('IDSITBENEFICIO').AsString:='1';
  QryprocAposen.Open;
  { Processa todos os registros }
  While Not QryProcAposen.EOF Do Begin
    { Inclui Linha nas Estatisticas }
    InserePlano(QryProcAposen, '40104');
    { Proximo Registro }
    QryProcAposen.Next;
  End;

  {------------------------------------------------}
  { Pegas as estatisticas de Dependentes de Ativos }
  QryDepAtivos.Close;
  QryDepAtivos.ParamByName('DATAINI').AsString :=DataIni;
  QryDepAtivos.ParamByName('DATAFIM').AsString :=DataFim;
  QryDepAtivos.Open;
  { Processa todos os registros }
  While Not QryDepAtivos.EOF Do Begin
    { Inclui Linha nas Estatisticas }
    InserePlano(QryDepAtivos, '40104');
    { Proximo Registro }
    QryDepAtivos.Next;
  End;

  {-----------------------------------------------------}
  { Pegas as estatisticas de Dependentes de Aposentados }
  QryDepAposentados.Close;
  QryDepAposentados.ParamByName('DATAINI').AsString :=DataIni;
  QryDepAposentados.ParamByName('DATAFIM').AsString :=DataFim;
  QryDepAposentados.Open;
  { Processa todos os registros }
  While Not QryDepAtivos.EOF Do Begin
    { Inclui Linha nas Estatisticas }
    InserePlano(QryDepAtivos, '40104');
    { Proximo Registro }
    QryDepAtivos.Next;
  End;

  {------------------------------------------------}
  { Pegas as estatisticas de Dependentes de Pensao }
  QryDepPensao.Close;
  QryDepPensao.ParamByName('DATAINI').AsString :=DataIni;
  QryDepPensao.ParamByName('DATAFIM').AsString :=DataFim;
  QryDepPensao.Open;
  { Processa todos os registros }
  While Not QryDepPensao.EOF Do Begin
    { Inclui Linha nas Estatisticas }
    InserePlano(QryDepPensao, '40104');
    { Proximo Registro }
    QryDepPensao.Next;
  End;

End;

{------------------------------------------------------------------------------}
{ Gera estatisticas  de Beneficio                                              }
Procedure TFrmGeraEstatisticas.GeraEstatBenef;
Begin

  { Processa todos os registros }
  While Not QryBuscaDados.EOF Do Begin

    { Pula Registros que dependem de mais verificacoes, como Origem }
    If (QryBuscaDados.FieldByName('CODIGOSPC').AsString = '10200') Or
       (QryBuscaDados.FieldByName('CODIGOSPC').AsString = '30000') Or
       (QryBuscaDados.FieldByName('CODIGOSPC').AsString = '20100') Then Begin
      QryBuscaDados.Next;
      Continue;
    End;

    { Inclui Linha nas Estatisticas }
    InsereBeneficio(QryBuscaDados,
                    QryBuscaDados.FieldByName('CODIGOSPC').AsString);

    { Proximo Registro }
    QryBuscaDados.Next;
  End;
  { Gera estatisticas que necessitam de processamento }
  GeraEstatBenefProc;

End;

{------------------------------------------------------------------------------}
{ Gera estatisticas dos beneficios que precisam de processamento               }
Procedure TFrmGeraEstatisticas.GeraEstatBenefProc;
Begin

  {-------------------------------------------}
  { Pegas as estatisticas de Pensao de Ativos }
  QryPensao.Close;
  QryPensao.ParamByName('DATAINI').AsString     := DataIni;
  QryPensao.ParamByName('DATAFIM').AsString     := DataFim;
  QryPensao.ParamByName('CODBENEFSPC').AsString := '10200';
  QryPensao.ParamByName('FLGINTERNO').AsString  := 'AT';
  QryPensao.Open;
  { Processa todos os registros }
  While Not QryPensao.EOF Do Begin
    { Inclui Linha nas Estatisticas }
    InsereBeneficio(QryPensao, '10201');
    { Proximo Registro }
    QryPensao.Next;
  End;
Exit;
  {-----------------------------------------------}
  { Pegas as estatisticas de Pensao de Assistidos }
  QryPensao.Close;
  QryPensao.ParamByName('DATAINI').AsString     := DataIni;
  QryPensao.ParamByName('DATAFIM').AsString     := DataFim;
  QryPensao.ParamByName('CODBENEFSPC').AsString := '10200';
  QryPensao.ParamByName('FLGINTERNO').AsString  := 'AS';
  QryPensao.Open;

  { Processa todos os registros }
  While Not QryPensao.EOF Do Begin
    { Inclui Linha nas Estatisticas }
    InsereBeneficio(QryPensao, '10202');
    { Proximo Registro }
    QryPensao.Next;
  End;

  {--------------------------------------------}
  { Pegas as estatisticas de Peculio de Ativos }
  QryPensao.Close;
  QryPensao.ParamByName('DATAINI').AsString     := DataIni;
  QryPensao.ParamByName('DATAFIM').AsString     := DataFim;
  QryPensao.ParamByName('CODBENEFSPC').AsString := '20100';
  QryPensao.ParamByName('FLGINTERNO').AsString  := 'AT';
  QryPensao.Open;

  { Processa todos os registros }
  While Not QryPensao.EOF Do Begin
    { Inclui Linha nas Estatisticas }
    InsereBeneficio(QryPensao, '20101');
    { Proximo Registro }
    QryPensao.Next;
  End;

  {-------------------------------------------------}
  { Pegas as estatisticas de Peculio de Aposentados }
  QryPensao.Close;
  QryPensao.ParamByName('DATAINI').AsString     := DataIni;
  QryPensao.ParamByName('DATAFIM').AsString     := DataFim;
  QryPensao.ParamByName('CODBENEFSPC').AsString := '20100';
  QryPensao.ParamByName('FLGINTERNO').AsString  := 'AS';
  QryPensao.Open;

  { Processa todos os registros }
  While Not QryPensao.EOF Do Begin
    { Inclui Linha nas Estatisticas }
    InsereBeneficio(QryPensao, '20102');
    { Proximo Registro }
    QryPensao.Next;
  End;

  {-------------------------------------------------}
  { Pegas as estatisticas de Peculio de Dependentes }
  QryPensao.Close;
  QryPensao.ParamByName('DATAINI').AsString     := DataIni;
  QryPensao.ParamByName('DATAFIM').AsString     := DataFim;
  QryPensao.ParamByName('CODBENEFSPC').AsString := '20100';
  QryPensao.ParamByName('FLGINTERNO').AsString  := 'DP';
  QryPensao.Open;

  { Processa todos os registros }
  While Not QryPensao.EOF Do Begin
    { Inclui Linha nas Estatisticas }
    InsereBeneficio(QryPensao, '20103');
    { Proximo Registro }
    QryPensao.Next;
  End;

  {-------------------------------------------------}
  { Pegas as estatisticas de Peculio Invelidez      }
  QryBuscaInvalidez.Close;
  QryBuscaInvalidez.ParamByName('DATAINI').AsString :=DataIni;
  QryBuscaInvalidez.ParamByName('DATAFIM').AsString :=DataFim;
  QryBuscaInvalidez.Open;

  { Processa todos os registros }
  While Not QryBuscaInvalidez.EOF Do Begin
    { Inclui Linha nas Estatisticas }
    InsereBeneficio(QryBuscaInvalidez, '20104');
    { Proximo Registro }
    QryBuscaInvalidez.Next;
  End;

  {-----------------------------------------------}
  { Pegas as estatisticas de Reservas de Poupanca }
  QryReserva.Close;
  QryReserva.ParamByName('DATAINI').AsString :=DataIni;
  QryReserva.ParamByName('DATAFIM').AsString :=DataFim;
  QryReserva.ParamByName('CODBENEFSPC').AsString:='30000';
  QryReserva.Open;
  { Processa todos os registros }
  While Not QryReserva.EOF Do Begin
    { Inclui Linha nas Estatisticas }
    InsereBeneficio(QryReserva, '30100');
    { Proximo Registro }
    QryReserva.Next;
  End;

  {-------------------------------------------------------------------}
  { Pegas as estatisticas de Reservas de Poupanca de Autopatrocinados }
  QryReservaAuto.Close;
  QryReservaAuto.ParamByName('DATAINI').AsString :=DataIni;
  QryReservaAuto.ParamByName('DATAFIM').AsString :=DataFim;
  QryReservaAuto.ParamByName('CODBENEFSPC').AsString:='30000';
  QryReservaAuto.Open;
  { Processa todos os registros }
  While Not QryReservaAuto.EOF Do Begin
    { Inclui Linha nas Estatisticas }
    InsereBeneficio(QryReservaAuto, '30200');
    { Proximo Registro }
    QryReservaAuto.Next;
  End;

End;

{------------------------------------------------------------------------------}
{ Gera estatisticas dos beneficios que precisam de processamento               }
Procedure TFrmGeraEstatisticas.DDD(QryArquivo:TwwQuery) ;
Type
  Totais=Record
           Anterior,
           Concedido,
           Cancelado,
           Atual    :Integer;
         End;
Var
  wSubGrupos:Array [0..30] Of Totais;
  wCodigo:String;
  I:Integer;
Begin
// Zera vetor
  For I := 0 To 30 Do Begin
    wSubGrupos[I].Anterior := 0;
    wSubGrupos[I].Concedido:= 0;
    wSubGrupos[I].Cancelado:= 0;
    wSubGrupos[I].Atual    := 0;
  End;

// Lê toda a query de Dados
  QryArquivo.First;
  While Not QryArquivo.EOF Do Begin
// Guarda o Codigo Processado
    wCodigo:=QryArquivo.FieldByName('CODIGO').AsString;

    If Copy(wCodigo,1,2) = '10' Then Begin
// Indice 0 = 10000 Beneficios Prestacao Continuia
      wSubGrupos[0].Anterior := wSubGrupos[0].Anterior +QryArquivo.FieldByName('ANTERIOR').AsInteger;
      wSubGrupos[0].Concedido:= wSubGrupos[0].Concedido+QryArquivo.FieldByName('CONCEDIDO').AsInteger;
      wSubGrupos[0].Cancelado:= wSubGrupos[0].Cancelado+QryArquivo.FieldByName('CANCELADO').AsInteger;
      wSubGrupos[0].Atual    := wSubGrupos[0].Atual    +QryArquivo.FieldByName('ATUAL').AsInteger;

      If Copy(wCodigo,1,3) = '101' Then Begin
// Indice 1 = 10100 Aposentadorias
        wSubGrupos[1].Anterior := wSubGrupos[1].Anterior +QryArquivo.FieldByName('ANTERIOR').AsInteger;
        wSubGrupos[1].Concedido:= wSubGrupos[1].Concedido+QryArquivo.FieldByName('CONCEDIDO').AsInteger;
        wSubGrupos[1].Cancelado:= wSubGrupos[1].Cancelado+QryArquivo.FieldByName('CANCELADO').AsInteger;
        wSubGrupos[1].Atual    := wSubGrupos[1].Atual    +QryArquivo.FieldByName('ATUAL').AsInteger;
      End;
      If Copy(wCodigo,1,3) = '102' Then Begin
// Precnhe Parametros
        QryPensao.Close;
        QryPensao.ParamByName('DATAINI').AsString    :=DataIni;
        QryPensao.ParamByName('DATAFIM').AsString    :=DataFim;
        QryPensao.ParamByName('CODBENEFSPC').AsString:='10200';
        QryPensao.ParamByName('FLGINTERNO').AsString :='AT';
// Abre a Consulta
        QryPensao.Open;
// Indice 10 = 10201 Pensoes Ativo
        wSubGrupos[10].Anterior := QryPensao.FieldByName('ANTERIOR').AsInteger;
        wSubGrupos[10].Concedido:= QryPensao.FieldByName('CONCEDIDO').AsInteger;
        wSubGrupos[10].Cancelado:= QryPensao.FieldByName('CANCELADO').AsInteger;
        wSubGrupos[10].Atual    := QryPensao.FieldByName('ATUAL').AsInteger;

// Preenche Parametros
        QryPensao.Close;
        QryPensao.ParamByName('DATAINI').AsString :=DataIni;
        QryPensao.ParamByName('DATAFIM').AsString :=DataFim;
        QryPensao.ParamByName('CODBENEFSPC').AsString:='10200';
        QryPensao.ParamByName('FLGINTERNO').AsString   :='AS';
// Abre a Consulta
        QryPensao.Open;
// Indice 11 = 10202 Pensoes Aposentado
        wSubGrupos[11].Anterior := QryPensao.FieldByName('ANTERIOR').AsInteger;
        wSubGrupos[11].Concedido:= QryPensao.FieldByName('CONCEDIDO').AsInteger;
        wSubGrupos[11].Cancelado:= QryPensao.FieldByName('CANCELADO').AsInteger;
        wSubGrupos[11].Atual    := QryPensao.FieldByName('ATUAL').AsInteger;

// Indice 2 = 10200 Pensoes
        wSubGrupos[2].Anterior := wSubGrupos[10].Anterior +wSubGrupos[11].Anterior ;
        wSubGrupos[2].Concedido:= wSubGrupos[10].Concedido+wSubGrupos[11].Concedido;
        wSubGrupos[2].Cancelado:= wSubGrupos[10].Cancelado+wSubGrupos[11].Cancelado;
        wSubGrupos[2].Atual    := wSubGrupos[10].Atual    +wSubGrupos[11].Atual    ;

      End;
      If Copy(wCodigo,1,3) = '103' Then Begin
// Indice 3 = 10300 Auxilios
        wSubGrupos[3].Anterior := wSubGrupos[3].Anterior +QryArquivo.FieldByName('ANTERIOR').AsInteger;
        wSubGrupos[3].Concedido:= wSubGrupos[3].Concedido+QryArquivo.FieldByName('CONCEDIDO').AsInteger;
        wSubGrupos[3].Cancelado:= wSubGrupos[3].Cancelado+QryArquivo.FieldByName('CANCELADO').AsInteger;
        wSubGrupos[3].Atual    := wSubGrupos[3].Atual    +QryArquivo.FieldByName('ATUAL').AsInteger;
      End;
      If Copy(wCodigo,1,3) = '104' Then Begin
// Indice 4 = 10400 Outros Beneficios
        wSubGrupos[4].Anterior := wSubGrupos[4].Anterior +QryArquivo.FieldByName('ANTERIOR').AsInteger;
        wSubGrupos[4].Concedido:= wSubGrupos[4].Concedido+QryArquivo.FieldByName('CONCEDIDO').AsInteger;
        wSubGrupos[4].Cancelado:= wSubGrupos[4].Cancelado+QryArquivo.FieldByName('CANCELADO').AsInteger;
        wSubGrupos[4].Atual    := wSubGrupos[4].Atual    +QryArquivo.FieldByName('ATUAL').AsInteger;
      End;

    End Else If Copy(wCodigo,1,2) = '20' Then Begin
// ABAIXO X7
//------------------------------------------------------------------------------

// Auxilios de Prestação Unica
      If Copy(wCodigo,1,3) = '202' Then Begin
// Indice 7 = 20200 Auxilios
        wSubGrupos[7].Anterior := wSubGrupos[7].Anterior +QryArquivo.FieldByName('ANTERIOR').AsInteger;
        wSubGrupos[7].Concedido:= wSubGrupos[7].Concedido+QryArquivo.FieldByName('CONCEDIDO').AsInteger;
        wSubGrupos[7].Cancelado:= wSubGrupos[7].Cancelado+QryArquivo.FieldByName('CANCELADO').AsInteger;
        wSubGrupos[7].Atual    := wSubGrupos[7].Atual    +QryArquivo.FieldByName('ATUAL').AsInteger;

// Indice 5 = 20000 Beneficios de Prestacao Unica
        wSubGrupos[5].Anterior := wSubGrupos[5].Anterior +wSubGrupos[7].Anterior;
        wSubGrupos[5].Concedido:= wSubGrupos[5].Concedido+wSubGrupos[7].Concedido;
        wSubGrupos[5].Cancelado:= wSubGrupos[5].Cancelado+wSubGrupos[7].Cancelado;
        wSubGrupos[5].Atual    := wSubGrupos[5].Atual    +wSubGrupos[7].Atual;
      End;

      If Copy(wCodigo,1,3) = '203' Then Begin
// Indice 8 = 20300 Outros Beneficios
        wSubGrupos[8].Anterior := wSubGrupos[8].Anterior +QryArquivo.FieldByName('ANTERIOR').AsInteger;
        wSubGrupos[8].Concedido:= wSubGrupos[8].Concedido+QryArquivo.FieldByName('CONCEDIDO').AsInteger;
        wSubGrupos[8].Cancelado:= wSubGrupos[8].Cancelado+QryArquivo.FieldByName('CANCELADO').AsInteger;
        wSubGrupos[8].Atual    := wSubGrupos[8].Atual    +QryArquivo.FieldByName('ATUAL').AsInteger;

// Indice 5 = 20000 Beneficios de Prestacao Unica
        wSubGrupos[5].Anterior := wSubGrupos[5].Anterior +wSubGrupos[8].Anterior;
        wSubGrupos[5].Concedido:= wSubGrupos[5].Concedido+wSubGrupos[8].Concedido;
        wSubGrupos[5].Cancelado:= wSubGrupos[5].Cancelado+wSubGrupos[8].Cancelado;
        wSubGrupos[5].Atual    := wSubGrupos[5].Atual    +wSubGrupos[8].Atual;
      End;

//------------------------------------------------------------------------------
    End Else If Copy(wCodigo,1,2) = '30' Then Begin
// ABAIXO X5
//------------------------------------------------------------------------------
    End Else If Copy(wCodigo,1,2) = '40' Then Begin
// ABAIXO  X3
    End;

// Proximo Registro
    QryArquivo.Next;
  End; { While }

//------------------------------------------------------------------------------
// Inclui Novos dados na Tabela
// Novo Registro
  QryArquivo.First;
  QryArquivo.Insert;
// Indice 0 = 10000 Beneficios Prestacao Continuia
    QryArquivo.FieldByName('CODFUND').AsString    :=wNumFundacao;
    QryArquivo.FieldByName('CODIGO').AsString     :='10000';
    QryArquivo.FieldByName('ANTERIOR').AsInteger  :=wSubGrupos[0].Anterior;
    QryArquivo.FieldByName('CONCEDIDO').AsInteger :=wSubGrupos[0].Concedido;
    QryArquivo.FieldByName('CANCELADO').AsInteger :=wSubGrupos[0].Cancelado;
    QryArquivo.FieldByName('ATUAL').AsInteger     :=wSubGrupos[0].Atual;
  QryArquivo.Post;
{ Insere Registro na Estatistica }
  InsereBeneficio(QryArquivo,'10000');

// Novo Registro
  QryArquivo.Next;
  QryArquivo.Insert;
// Indice 1 = 10100 Aposentadorias
    QryArquivo.FieldByName('CODFUND').AsString    :=wNumFundacao;
    QryArquivo.FieldByName('CODIGO').AsString     :='10100';
    QryArquivo.FieldByName('ANTERIOR').AsInteger  :=wSubGrupos[1].Anterior;
    QryArquivo.FieldByName('CONCEDIDO').AsInteger :=wSubGrupos[1].Concedido;
    QryArquivo.FieldByName('CANCELADO').AsInteger :=wSubGrupos[1].Cancelado;
    QryArquivo.FieldByName('ATUAL').AsInteger     :=wSubGrupos[1].Atual;
  QryArquivo.Post;
  { Insere Registro na Estatistica }
  InsereBeneficio(QryArquivo,'10100');

//------------------------------------------------------------------------------

// Novo Registro
  QryArquivo.Append;
// Indice 2 = 10200 Pensoes
    QryArquivo.FieldByName('CODFUND').AsString    :=wNumFundacao;
    QryArquivo.FieldByName('CODIGO').AsString     :='10200';
    QryArquivo.FieldByName('ANTERIOR').AsInteger  :=wSubGrupos[2].Anterior;
    QryArquivo.FieldByName('CONCEDIDO').AsInteger :=wSubGrupos[2].Concedido;
    QryArquivo.FieldByName('CANCELADO').AsInteger :=wSubGrupos[2].Cancelado;
    QryArquivo.FieldByName('ATUAL').AsInteger     :=wSubGrupos[2].Atual;
  QryArquivo.Post;
  { Insere Registro na Estatistica }
  InsereBeneficio(QryArquivo,'10200');

// Novo Registro
  QryArquivo.Append;
// Indice 10 = 10201 Pensoes Ativo
    QryArquivo.FieldByName('CODFUND').AsString    :=wNumFundacao;
    QryArquivo.FieldByName('CODIGO').AsString     :='10201';
    QryArquivo.FieldByName('ANTERIOR').AsInteger  :=wSubGrupos[10].Anterior;
    QryArquivo.FieldByName('CONCEDIDO').AsInteger :=wSubGrupos[10].Concedido;
    QryArquivo.FieldByName('CANCELADO').AsInteger :=wSubGrupos[10].Cancelado;
    QryArquivo.FieldByName('ATUAL').AsInteger     :=wSubGrupos[10].Atual;
  QryArquivo.Post;
  { Insere Registro na Estatistica }
  InsereBeneficio(QryArquivo,'10201');

// Novo Registro
  QryArquivo.Append;
// Indice 2 = 10202 Pensoes Aposentado
    QryArquivo.FieldByName('CODFUND').AsString    :=wNumFundacao;
    QryArquivo.FieldByName('CODIGO').AsString     :='10202';
    QryArquivo.FieldByName('ANTERIOR').AsInteger  :=wSubGrupos[11].Anterior;
    QryArquivo.FieldByName('CONCEDIDO').AsInteger :=wSubGrupos[11].Concedido;
    QryArquivo.FieldByName('CANCELADO').AsInteger :=wSubGrupos[11].Cancelado;
    QryArquivo.FieldByName('ATUAL').AsInteger     :=wSubGrupos[11].Atual;
  QryArquivo.Post;
  { Insere Registro na Estatistica }
  InsereBeneficio(QryArquivo,'10202');

// Novo Registro
  QryArquivo.Append;
// Indice 3 = 10300 Auxilios
    QryArquivo.FieldByName('CODFUND').AsString    :=wNumFundacao;
    QryArquivo.FieldByName('CODIGO').AsString     :='10300';
    QryArquivo.FieldByName('ANTERIOR').AsInteger  :=wSubGrupos[3].Anterior;
    QryArquivo.FieldByName('CONCEDIDO').AsInteger :=wSubGrupos[3].Concedido;
    QryArquivo.FieldByName('CANCELADO').AsInteger :=wSubGrupos[3].Cancelado;
    QryArquivo.FieldByName('ATUAL').AsInteger     :=wSubGrupos[3].Atual;
  QryArquivo.Post;
  { Insere Registro na Estatistica }
  InsereBeneficio(QryArquivo,'10300');

// Novo Registro
  QryArquivo.Append;
// Indice 4 = 10400 Outros Beneficios
    QryArquivo.FieldByName('CODFUND').AsString    :=wNumFundacao;
    QryArquivo.FieldByName('CODIGO').AsString     :='10400';
    QryArquivo.FieldByName('ANTERIOR').AsInteger  :=wSubGrupos[4].Anterior;
    QryArquivo.FieldByName('CONCEDIDO').AsInteger :=wSubGrupos[4].Concedido;
    QryArquivo.FieldByName('CANCELADO').AsInteger :=wSubGrupos[4].Cancelado;
    QryArquivo.FieldByName('ATUAL').AsInteger     :=wSubGrupos[4].Atual;
// Confirma Dados (Tabela esta em cache)
  QryArquivo.Post;
{ Insere Registro na Estatistica }
  InsereBeneficio(QryArquivo,'10400');


//------------------------------------------------------------------------------
// X7
// PECULIOS \\
// Preenche Parametros
  QryPensao.Close;
  QryPensao.ParamByName('DATAINI').AsString :=DataIni;
  QryPensao.ParamByName('DATAFIM').AsString :=DataFim;
  QryPensao.ParamByName('CODBENEFSPC').AsString:='20100';
  QryPensao.ParamByName('FLGINTERNO').AsString :='AT';
// Abre a Consulta
  QryPensao.Open;
// Indice 12 = 20101 Peculio Morte Ativo
  wSubGrupos[12].Anterior := QryPensao.FieldByName('ANTERIOR').AsInteger;
  wSubGrupos[12].Concedido:= QryPensao.FieldByName('CONCEDIDO').AsInteger;
  wSubGrupos[12].Cancelado:= QryPensao.FieldByName('CANCELADO').AsInteger;
  wSubGrupos[12].Atual    := QryPensao.FieldByName('ATUAL').AsInteger;

// Preenche Parametros
  QryPensao.Close;
  QryPensao.ParamByName('DATAINI').AsString :=DataIni;
  QryPensao.ParamByName('DATAFIM').AsString :=DataFim;
  QryPensao.ParamByName('CODBENEFSPC').AsString:='20100';
  QryPensao.ParamByName('FLGINTERNO').AsString :='AS';
// Abre a Consulta
  QryPensao.Open;
// Indice 13 = 20102 Peculio Morte Ativo
  wSubGrupos[13].Anterior := QryPensao.FieldByName('ANTERIOR').AsInteger;
  wSubGrupos[13].Concedido:= QryPensao.FieldByName('CONCEDIDO').AsInteger;
  wSubGrupos[13].Cancelado:= QryPensao.FieldByName('CANCELADO').AsInteger;
  wSubGrupos[13].Atual    := QryPensao.FieldByName('ATUAL').AsInteger;

// Preenche Parametros
  QryPensao.Close;
  QryPensao.ParamByName('DATAINI').AsString :=DataIni;
  QryPensao.ParamByName('DATAFIM').AsString :=DataFim;
  QryPensao.ParamByName('CODBENEFSPC').AsString:='20100';
  QryPensao.ParamByName('FLGINTERNO').AsString :='DP';
// Abre a Consulta
  QryPensao.Open;
// Indice 14 = 20103 Peculio Morte Dependente
  wSubGrupos[14].Anterior := QryPensao.FieldByName('ANTERIOR').AsInteger;
  wSubGrupos[14].Concedido:= QryPensao.FieldByName('CONCEDIDO').AsInteger;
  wSubGrupos[14].Cancelado:= QryPensao.FieldByName('CANCELADO').AsInteger;
  wSubGrupos[14].Atual    := QryPensao.FieldByName('ATUAL').AsInteger;

// Preenche Parametros
  QryBuscaInvalidez.Close;
  QryBuscaInvalidez.ParamByName('DATAINI').AsString :=DataIni;
  QryBuscaInvalidez.ParamByName('DATAFIM').AsString :=DataFim;
//        QryBuscaInvalidez.ParamByName('CODBENEFSPC').AsString:=QuotedStr('10102');
// Abre a Consulta
  QryBuscaInvalidez.Open;
// Indice 15 = 20104 Peculio Morte Invalidez
  wSubGrupos[15].Anterior := wSubGrupos[15].Anterior +QryBuscaInvalidez.FieldByName('ANTERIOR').AsInteger;
  wSubGrupos[15].Concedido:= wSubGrupos[15].Concedido+QryBuscaInvalidez.FieldByName('CONCEDIDO').AsInteger;
  wSubGrupos[15].Cancelado:= wSubGrupos[15].Cancelado+QryBuscaInvalidez.FieldByName('CANCELADO').AsInteger;
  wSubGrupos[15].Atual    := wSubGrupos[15].Atual    +QryBuscaInvalidez.FieldByName('ATUAL').AsInteger;

// Indice 6 = 20100 Peculios
  wSubGrupos[6].Anterior := wSubGrupos[12].Anterior +wSubGrupos[13].Anterior +wSubGrupos[14].Anterior +wSubGrupos[15].Anterior;
  wSubGrupos[6].Concedido:= wSubGrupos[12].Concedido+wSubGrupos[13].Concedido+wSubGrupos[14].Concedido+wSubGrupos[15].Concedido;
  wSubGrupos[6].Cancelado:= wSubGrupos[12].Cancelado+wSubGrupos[13].Cancelado+wSubGrupos[14].Cancelado+wSubGrupos[15].Cancelado;
  wSubGrupos[6].Atual    := wSubGrupos[12].Atual    +wSubGrupos[13].Atual    +wSubGrupos[14].Atual    +wSubGrupos[15].Atual;

// Indice 5 = 20000 Beneficios de Prestacao Unica
  wSubGrupos[5].Anterior := wSubGrupos[5].Anterior +wSubGrupos[6].Anterior;
  wSubGrupos[5].Concedido:= wSubGrupos[5].Concedido+wSubGrupos[6].Concedido;
  wSubGrupos[5].Cancelado:= wSubGrupos[5].Cancelado+wSubGrupos[6].Cancelado;
  wSubGrupos[5].Atual    := wSubGrupos[5].Atual    +wSubGrupos[6].Atual;

// Terminam as Consultas de PECULIO
//------------------------------------------------------------------------------


// Novo Registro
  QryArquivo.Append;
// Indice 5 = 20000 Beneficios de Prestacao Unica
    QryArquivo.FieldByName('CODFUND').AsString    :=wNumFundacao;
    QryArquivo.FieldByName('CODIGO').AsString     :='20000';
    QryArquivo.FieldByName('ANTERIOR').AsInteger  :=wSubGrupos[5].Anterior;
    QryArquivo.FieldByName('CONCEDIDO').AsInteger :=wSubGrupos[5].Concedido;
    QryArquivo.FieldByName('CANCELADO').AsInteger :=wSubGrupos[5].Cancelado;
    QryArquivo.FieldByName('ATUAL').AsInteger     :=wSubGrupos[5].Atual;
// Confirma Dados (Tabela esta em cache)
  QryArquivo.Post;
{ Insere Registro na Estatistica }
  InsereBeneficio(QryArquivo,'20000');

// Novo Registro
  QryArquivo.Append;
// Indice 6 = 20100 Peculios
    QryArquivo.FieldByName('CODFUND').AsString    :=wNumFundacao;
    QryArquivo.FieldByName('CODIGO').AsString     :='20100';
    QryArquivo.FieldByName('ANTERIOR').AsInteger  :=wSubGrupos[6].Anterior;
    QryArquivo.FieldByName('CONCEDIDO').AsInteger :=wSubGrupos[6].Concedido;
    QryArquivo.FieldByName('CANCELADO').AsInteger :=wSubGrupos[6].Cancelado;
    QryArquivo.FieldByName('ATUAL').AsInteger     :=wSubGrupos[6].Atual;
// Confirma Dados (Tabela esta em cache)
  QryArquivo.Post;
{ Insere Registro na Estatistica }
  InsereBeneficio(QryArquivo,'20100');

// Novo Registro
  QryArquivo.Append;
// Indice 12 = 20101 Peculios Morte Ativo
    QryArquivo.FieldByName('CODFUND').AsString    :=wNumFundacao;
    QryArquivo.FieldByName('CODIGO').AsString     :='20101';
    QryArquivo.FieldByName('ANTERIOR').AsInteger  :=wSubGrupos[12].Anterior;
    QryArquivo.FieldByName('CONCEDIDO').AsInteger :=wSubGrupos[12].Concedido;
    QryArquivo.FieldByName('CANCELADO').AsInteger :=wSubGrupos[12].Cancelado;
    QryArquivo.FieldByName('ATUAL').AsInteger     :=wSubGrupos[12].Atual;
// Confirma Dados (Tabela esta em cache)
  QryArquivo.Post;
{ Insere Registro na Estatistica }
  InsereBeneficio(QryArquivo,'20101');

// Novo Registro
  QryArquivo.Append;
// Indice 13 = 20102 Peculios Morte Aposentado
    QryArquivo.FieldByName('CODFUND').AsString    :=wNumFundacao;
    QryArquivo.FieldByName('CODIGO').AsString     :='20102';
    QryArquivo.FieldByName('ANTERIOR').AsInteger  :=wSubGrupos[13].Anterior;
    QryArquivo.FieldByName('CONCEDIDO').AsInteger :=wSubGrupos[13].Concedido;
    QryArquivo.FieldByName('CANCELADO').AsInteger :=wSubGrupos[13].Cancelado;
    QryArquivo.FieldByName('ATUAL').AsInteger     :=wSubGrupos[13].Atual;
// Confirma Dados (Tabela esta em cache)
  QryArquivo.Post;
{ Insere Registro na Estatistica }
  InsereBeneficio(QryArquivo,'20102');

// Novo Registro
  QryArquivo.Append;
// Indice 14 = 20103 Peculios Morte Dependente
    QryArquivo.FieldByName('CODFUND').AsString    :=wNumFundacao;
    QryArquivo.FieldByName('CODIGO').AsString     :='20103';
    QryArquivo.FieldByName('ANTERIOR').AsInteger  :=wSubGrupos[14].Anterior;
    QryArquivo.FieldByName('CONCEDIDO').AsInteger :=wSubGrupos[14].Concedido;
    QryArquivo.FieldByName('CANCELADO').AsInteger :=wSubGrupos[14].Cancelado;
    QryArquivo.FieldByName('ATUAL').AsInteger     :=wSubGrupos[14].Atual;
// Confirma Dados (Tabela esta em cache)
  QryArquivo.Post;
{ Insere Registro na Estatistica }
  InsereBeneficio(QryArquivo,'20103');

// Novo Registro
  QryArquivo.Append;
// Indice 15 = 20104 Peculios Morte Invalidez
    QryArquivo.FieldByName('CODFUND').AsString    :=wNumFundacao;
    QryArquivo.FieldByName('CODIGO').AsString     :='20104';
    QryArquivo.FieldByName('ANTERIOR').AsInteger  :=wSubGrupos[15].Anterior;
    QryArquivo.FieldByName('CONCEDIDO').AsInteger :=wSubGrupos[15].Concedido;
    QryArquivo.FieldByName('CANCELADO').AsInteger :=wSubGrupos[15].Cancelado;
    QryArquivo.FieldByName('ATUAL').AsInteger     :=wSubGrupos[15].Atual;
// Confirma Dados (Tabela esta em cache)
  QryArquivo.Post;
{ Insere Registro na Estatistica }
  InsereBeneficio(QryArquivo,'20104');




//-----------------------------------------------------------------------------
// Auxilios de Prestação única, podem não existir no Plano de Beneficio,
// Caso não exista, incluir na mão.
//*
// Auxilio Funeral
  If Not QryArquivo.Locate('CODIGO','20201',[]) Then Begin
    QryArquivo.Append;
// 20201 - Auxilio Funeral
      QryArquivo.FieldByName('CODFUND').AsString    :=wNumFundacao;
      QryArquivo.FieldByName('CODIGO').AsString     :='20201';
      QryArquivo.FieldByName('ANTERIOR').AsInteger  :=0;
      QryArquivo.FieldByName('CONCEDIDO').AsInteger :=0;
      QryArquivo.FieldByName('CANCELADO').AsInteger :=0;
      QryArquivo.FieldByName('ATUAL').AsInteger     :=0;
// Confirma Dados (Tabela esta em cache)
    QryArquivo.Post;
    { Insere Registro na Estatistica }
    InsereBeneficio(QryArquivo,'20201');
  End;

//  20202 - Auxilio Natalidade
  If Not QryArquivo.Locate('CODIGO','20202',[]) Then Begin
    QryArquivo.Append;
      QryArquivo.FieldByName('CODFUND').AsString    :=wNumFundacao;
      QryArquivo.FieldByName('CODIGO').AsString     :='20202';
      QryArquivo.FieldByName('ANTERIOR').AsInteger  :=0;
      QryArquivo.FieldByName('CONCEDIDO').AsInteger :=0;
      QryArquivo.FieldByName('CANCELADO').AsInteger :=0;
      QryArquivo.FieldByName('ATUAL').AsInteger     :=0;
// Confirma Dados (Tabela esta em cache)
    QryArquivo.Post;
    { Insere Registro na Estatistica }
    InsereBeneficio(QryArquivo,'20202');
  End;

//  20203 - Auxilio Nupcial
  If Not QryArquivo.Locate('CODIGO','20203',[]) Then Begin
    QryArquivo.Append;
      QryArquivo.FieldByName('CODFUND').AsString    :=wNumFundacao;
      QryArquivo.FieldByName('CODIGO').AsString     :='20203';
      QryArquivo.FieldByName('ANTERIOR').AsInteger  :=0;
      QryArquivo.FieldByName('CONCEDIDO').AsInteger :=0;
      QryArquivo.FieldByName('CANCELADO').AsInteger :=0;
      QryArquivo.FieldByName('ATUAL').AsInteger     :=0;
// Confirma Dados (Tabela esta em cache)
    QryArquivo.Post;
    { Insere Registro na Estatistica }
    InsereBeneficio(QryArquivo,'20203');
  End;

//  20204 - Auxilio Educação
  If Not QryArquivo.Locate('CODIGO','20204',[]) Then Begin
    QryArquivo.Append;
      QryArquivo.FieldByName('CODFUND').AsString    :=wNumFundacao;
      QryArquivo.FieldByName('CODIGO').AsString     :='20204';
      QryArquivo.FieldByName('ANTERIOR').AsInteger  :=0;
      QryArquivo.FieldByName('CONCEDIDO').AsInteger :=0;
      QryArquivo.FieldByName('CANCELADO').AsInteger :=0;
      QryArquivo.FieldByName('ATUAL').AsInteger     :=0;
// Confirma Dados (Tabela esta em cache)
    QryArquivo.Post;
    { Insere Registro na Estatistica }
    InsereBeneficio(QryArquivo,'20204')
  End;

//  20300 - Outros Beneficios
  If Not QryArquivo.Locate('CODIGO','20300',[]) Then Begin
    QryArquivo.Append;
      QryArquivo.FieldByName('CODFUND').AsString    :=wNumFundacao;
      QryArquivo.FieldByName('CODIGO').AsString     :='20300';
      QryArquivo.FieldByName('ANTERIOR').AsInteger  :=0;
      QryArquivo.FieldByName('CONCEDIDO').AsInteger :=0;
      QryArquivo.FieldByName('CANCELADO').AsInteger :=0;
      QryArquivo.FieldByName('ATUAL').AsInteger     :=0;
// Confirma Dados (Tabela esta em cache)
    QryArquivo.Post;
    { Insere Registro na Estatistica }
    InsereBeneficio(QryArquivo,'20300');
  End;

//-----------------------------------------------------------------------------


// Novo Registro
  QryArquivo.Append;
// Indice 7 = 20200 Auxilios
    QryArquivo.FieldByName('CODFUND').AsString    :=wNumFundacao;
    QryArquivo.FieldByName('CODIGO').AsString     :='20200';
    QryArquivo.FieldByName('ANTERIOR').AsInteger  :=wSubGrupos[7].Anterior;
    QryArquivo.FieldByName('CONCEDIDO').AsInteger :=wSubGrupos[7].Concedido;
    QryArquivo.FieldByName('CANCELADO').AsInteger :=wSubGrupos[7].Cancelado;
    QryArquivo.FieldByName('ATUAL').AsInteger     :=wSubGrupos[7].Atual;
// Confirma Dados (Tabela esta em cache)
  QryArquivo.Post;
  { Insere Registro na Estatistica }
  InsereBeneficio(QryArquivo,'20200');

// Novo Registro
  QryArquivo.Append;
// Indice 8 = 20300 Outros Beneficios
    QryArquivo.FieldByName('CODFUND').AsString    :=wNumFundacao;
    QryArquivo.FieldByName('CODIGO').AsString     :='20300';
    QryArquivo.FieldByName('ANTERIOR').AsInteger  :=wSubGrupos[8].Anterior;
    QryArquivo.FieldByName('CONCEDIDO').AsInteger :=wSubGrupos[8].Concedido;
    QryArquivo.FieldByName('CANCELADO').AsInteger :=wSubGrupos[8].Cancelado;
    QryArquivo.FieldByName('ATUAL').AsInteger     :=wSubGrupos[8].Atual;
// Confirma Dados (Tabela esta em cache)
  QryArquivo.Post;
  { Insere Registro na Estatistica }
  InsereBeneficio(QryArquivo,'20300');
// X5
//------------------------------------------------------------------------------
// CONSULTAS DA RESERVA DE POUPANCA
// Preenche Parametros
  QryReserva.Close;
  QryReserva.ParamByName('DATAINI').AsString :=DataIni;
  QryReserva.ParamByName('DATAFIM').AsString :=DataFim;
  QryReserva.ParamByName('CODBENEFSPC').AsString:='30000';
// Abre a Consulta
  QryReserva.Open;
// Indice 16 = 30100 Reservas de Poupanca Custeio Patronal
  wSubGrupos[16].Anterior := wSubGrupos[16].Anterior +QryReserva.FieldByName('ANTERIOR').AsInteger;
  wSubGrupos[16].Concedido:= wSubGrupos[16].Concedido+QryReserva.FieldByName('CONCEDIDO').AsInteger;
  wSubGrupos[16].Cancelado:= wSubGrupos[16].Cancelado+QryReserva.FieldByName('CANCELADO').AsInteger;
  wSubGrupos[16].Atual    := wSubGrupos[16].Atual    +QryReserva.FieldByName('ATUAL').AsInteger;
// Preenche Parametros
  QryReservaAuto.Close;
  QryReservaAuto.ParamByName('DATAINI').AsString :=DataIni;
  QryReservaAuto.ParamByName('DATAFIM').AsString :=DataFim;
  QryReservaAuto.ParamByName('CODBENEFSPC').AsString:='30000';
// Abre a Consulta
  QryReservaAuto.Open;
// Indice 17 = 30100 Reservas de Poupanca Autopatrocinado
  wSubGrupos[17].Anterior := wSubGrupos[17].Anterior +QryReservaAuto.FieldByName('ANTERIOR').AsInteger;
  wSubGrupos[17].Concedido:= wSubGrupos[17].Concedido+QryReservaAuto.FieldByName('CONCEDIDO').AsInteger;
  wSubGrupos[17].Cancelado:= wSubGrupos[17].Cancelado+QryReservaAuto.FieldByName('CANCELADO').AsInteger;
  wSubGrupos[17].Atual    := wSubGrupos[17].Atual    +QryReservaAuto.FieldByName('ATUAL').AsInteger;

// Indice 9 = 30000 Reservas de Poupanca
  wSubGrupos[9].Anterior := wSubGrupos[16].Anterior +wSubGrupos[17].Anterior ;
  wSubGrupos[9].Concedido:= wSubGrupos[16].Concedido+wSubGrupos[17].Concedido;
  wSubGrupos[9].Cancelado:= wSubGrupos[16].Cancelado+wSubGrupos[17].Cancelado;
  wSubGrupos[9].Atual    := wSubGrupos[16].Atual    +wSubGrupos[17].Atual    ;

// Novo Registro
  QryArquivo.Append;
// Indice 9 = 30000 Reservas de Poupanca
    QryArquivo.FieldByName('CODFUND').AsString    :=wNumFundacao;
    QryArquivo.FieldByName('CODIGO').AsString     :='30000';
    QryArquivo.FieldByName('ANTERIOR').AsInteger  :=wSubGrupos[9].Anterior;
    QryArquivo.FieldByName('CONCEDIDO').AsInteger :=wSubGrupos[9].Concedido;
    QryArquivo.FieldByName('CANCELADO').AsInteger :=wSubGrupos[9].Cancelado;
    QryArquivo.FieldByName('ATUAL').AsInteger     :=wSubGrupos[9].Atual;
// Confirma Dados (Tabela esta em cache)
  QryArquivo.Post;
  { Insere Registro na Estatistica }
  InsereBeneficio(QryArquivo,'30000');

// Novo Registro
  QryArquivo.Append;
// Indice 16 = 30100 Reservas de Poupanca Custeio Partonal
    QryArquivo.FieldByName('CODFUND').AsString    :=wNumFundacao;
    QryArquivo.FieldByName('CODIGO').AsString     :='30100';
    QryArquivo.FieldByName('ANTERIOR').AsInteger  :=wSubGrupos[16].Anterior;
    QryArquivo.FieldByName('CONCEDIDO').AsInteger :=wSubGrupos[16].Concedido;
    QryArquivo.FieldByName('CANCELADO').AsInteger :=wSubGrupos[16].Cancelado;
    QryArquivo.FieldByName('ATUAL').AsInteger     :=wSubGrupos[16].Atual;
// Confirma Dados (Tabela esta em cache)
  QryArquivo.Post;
  { Insere Registro na Estatistica }
  InsereBeneficio(QryArquivo,'30100');

// Novo Registro
  QryArquivo.Append;
// Indice 17 = 30200 Reservas de Poupanca Autopatrocinado
    QryArquivo.FieldByName('CODFUND').AsString    :=wNumFundacao;
    QryArquivo.FieldByName('CODIGO').AsString     :='30200';
    QryArquivo.FieldByName('ANTERIOR').AsInteger  :=wSubGrupos[17].Anterior;
    QryArquivo.FieldByName('CONCEDIDO').AsInteger :=wSubGrupos[17].Concedido;
    QryArquivo.FieldByName('CANCELADO').AsInteger :=wSubGrupos[17].Cancelado;
    QryArquivo.FieldByName('ATUAL').AsInteger     :=wSubGrupos[17].Atual;
// Confirma Dados (Tabela esta em cache)
  QryArquivo.Post;
  { Insere Registro na Estatistica }
  InsereBeneficio(QryArquivo,'30200');

//------------------------------------------------------------------------------
// CONSULTAS DA POPULAÇÃO ABRANGIDA
//------------------------------------------------------------------------------
// Preenche Parametros
  QryPopulacao.Close;
  QryPopulacao.ParamByName('DATAINI').AsString :=DataIni;
  QryPopulacao.ParamByName('DATAFIM').AsString :=DataFim;
  QryPopulacao.ParamByName('FLGINTERNO1').AsString :='AT';
  QryPopulacao.ParamByName('FLGINTERNO2').AsString :='MP';
// Abre a Consulta
  QryPopulacao.Open;
// Indice 18= 40101 Participantes Ativos Cust. Patronal
  wSubGrupos[18].Anterior := QryPopulacao.FieldByName('POPANTERIOR').AsInteger;
  wSubGrupos[18].Concedido:= 0;
  wSubGrupos[18].Cancelado:= QryPopulacao.FieldByName('POPCANCELADO').AsInteger;
  wSubGrupos[18].Atual    := QryPopulacao.FieldByName('POPATUAL').AsInteger;

// Preenche Parametros
  QryPopulacao.Close;
  QryPopulacao.ParamByName('DATAINI').AsString :=DataIni;
  QryPopulacao.ParamByName('DATAFIM').AsString :=DataFim;
  QryPopulacao.ParamByName('FLGINTERNO1').AsString :='MA';
  QryPopulacao.ParamByName('FLGINTERNO2').AsString :='MA';
// Abre a Consulta
  QryPopulacao.Open;
// Indice 19= 40102 Participantes Ativos Autopatrocinados
  wSubGrupos[19].Anterior := QryPopulacao.FieldByName('POPANTERIOR').AsInteger;
  wSubGrupos[19].Concedido:= 0;
  wSubGrupos[19].Cancelado:= QryPopulacao.FieldByName('POPCANCELADO').AsInteger;
  wSubGrupos[19].Atual    := QryPopulacao.FieldByName('POPATUAL').AsInteger;

//*
// Preenche Parametros
  QryPopulacao.Close;
  QryPopulacao.ParamByName('DATAINI').AsString :=DataIni;
  QryPopulacao.ParamByName('DATAFIM').AsString :=DataFim;
  QryPopulacao.ParamByName('FLGINTERNO1').AsString :='MS';
  QryPopulacao.ParamByName('FLGINTERNO2').AsString :='MS';
// Abre a Consulta
  QryPopulacao.Open;
// Indice 19= 40103 Participantes Ativos Autopatrocinados
  wSubGrupos[20].Anterior := QryPopulacao.FieldByName('POPANTERIOR').AsInteger;
  wSubGrupos[20].Concedido:= 0;
  wSubGrupos[20].Cancelado:= QryPopulacao.FieldByName('POPCANCELADO').AsInteger;
  wSubGrupos[20].Atual    := QryPopulacao.FieldByName('POPATUAL').AsInteger;

//*
// Preenche Parametros
  QryprocAposen.Close;
  QryprocAposen.ParamByName('DATAINI').AsString :=DataIni;
  QryprocAposen.ParamByName('DATAFIM').AsString :=DataFim;
//  QryprocAposen.ParamByName('CODBENEFSPC').AsString:='10101, 10102, 10103, 10104, 10105, 10106';
  QryprocAposen.ParamByName('IDSITBENEFICIO').AsString:='4';
// Abre a Consulta
  QryprocAposen.Open;
// Indice 21 = 40104 Participantes Ativos Processo Aposen.
  wSubGrupos[21].Anterior := QryprocAposen.FieldByName('ANTERIOR').AsInteger;
  wSubGrupos[21].Concedido:= QryprocAposen.FieldByName('CONCEDIDO').AsInteger;
  wSubGrupos[21].Cancelado:= QryprocAposen.FieldByName('CANCELADO').AsInteger;
  wSubGrupos[21].Atual    := QryprocAposen.FieldByName('ATUAL').AsInteger;

// Indice 22 = 40100 Participantes Ativos
  wSubGrupos[22].Anterior := wSubGrupos[18].Anterior +wSubGrupos[19].Anterior +wSubGrupos[20].Anterior +wSubGrupos[21].Anterior ;
  wSubGrupos[22].Concedido:= wSubGrupos[18].Concedido+wSubGrupos[19].Concedido+wSubGrupos[20].Concedido+wSubGrupos[21].Concedido;
  wSubGrupos[22].Cancelado:= wSubGrupos[18].Cancelado+wSubGrupos[19].Cancelado+wSubGrupos[20].Cancelado+wSubGrupos[21].Cancelado;
  wSubGrupos[22].Atual    := wSubGrupos[18].Atual    +wSubGrupos[19].Atual    +wSubGrupos[20].Atual    +wSubGrupos[21].Atual    ;

//*
// Preenche Parametros
  QryprocAposen.Close;
  QryprocAposen.ParamByName('DATAINI').AsString :=DataIni;
  QryprocAposen.ParamByName('DATAFIM').AsString :=DataFim;
  QryprocAposen.ParamByName('IDSITBENEFICIO').AsString:='1';
// Abre a Consulta
  QryprocAposen.Open;
// Indice 23 = 40200 Participantes Aposentados
  wSubGrupos[23].Anterior := QryprocAposen.FieldByName('ANTERIOR').AsInteger;
  wSubGrupos[23].Concedido:= QryprocAposen.FieldByName('CONCEDIDO').AsInteger;
  wSubGrupos[23].Cancelado:= QryprocAposen.FieldByName('CANCELADO').AsInteger;
  wSubGrupos[23].Atual    := QryprocAposen.FieldByName('ATUAL').AsInteger;

//*
// Preenche Parametros
  QryDepAtivos.Close;
  QryDepAtivos.ParamByName('DATAINI').AsString :=DataIni;
  QryDepAtivos.ParamByName('DATAFIM').AsString :=DataFim;
// Abre a Consulta
  QryDepAtivos.Open;
// Indice 23 = 40301 Participantes Aposentados
  wSubGrupos[24].Anterior := QryDepAtivos.FieldByName('DEPANTERIOR').AsInteger;
  wSubGrupos[24].Concedido:= QryDepAtivos.FieldByName('DEPCONCEDIDO').AsInteger;
  wSubGrupos[24].Cancelado:= QryDepAtivos.FieldByName('DEPCANCELADO').AsInteger;
  wSubGrupos[24].Atual    := QryDepAtivos.FieldByName('DEPATUAL').AsInteger;
//*
// Preenche Parametros
  QryDepAposentados.Close;
  QryDepAposentados.ParamByName('DATAINI').AsString :=DataIni;
  QryDepAposentados.ParamByName('DATAFIM').AsString :=DataFim;
// Abre a Consulta
  QryDepAposentados.Open;
// Indice 25 = 40302 Participantes Aposentados
  wSubGrupos[25].Anterior := QryDepAposentados.FieldByName('DEPANTERIOR').AsInteger;
  wSubGrupos[25].Concedido:= QryDepAposentados.FieldByName('DEPCONCEDIDO').AsInteger;
  wSubGrupos[25].Cancelado:= QryDepAposentados.FieldByName('DEPCANCELADO').AsInteger;
  wSubGrupos[25].Atual    := QryDepAposentados.FieldByName('DEPATUAL').AsInteger;

//*
// Preenche Parametros
  QryDepPensao.Close;
  QryDepPensao.ParamByName('DATAINI').AsString :=DataIni;
  QryDepPensao.ParamByName('DATAFIM').AsString :=DataFim;
// Abre a Consulta
  QryDepPensao.Open;
// Indice 25 = 40302 Participantes Aposentados
  wSubGrupos[26].Anterior := QryDepPensao.FieldByName('DEPANTERIOR').AsInteger;
  wSubGrupos[26].Concedido:= QryDepPensao.FieldByName('DEPCONCEDIDO').AsInteger;
  wSubGrupos[26].Cancelado:= QryDepPensao.FieldByName('DEPCANCELADO').AsInteger;
  wSubGrupos[26].Atual    := QryDepPensao.FieldByName('DEPATUAL').AsInteger;

// Indice 27 = 40300 Dependentes
  wSubGrupos[27].Anterior := wSubGrupos[24].Anterior +wSubGrupos[25].Anterior +wSubGrupos[26].Anterior;
  wSubGrupos[27].Concedido:= wSubGrupos[24].Concedido+wSubGrupos[25].Concedido+wSubGrupos[26].Concedido;
  wSubGrupos[27].Cancelado:= wSubGrupos[24].Cancelado+wSubGrupos[25].Cancelado+wSubGrupos[26].Cancelado;
  wSubGrupos[27].Atual    := wSubGrupos[24].Atual    +wSubGrupos[25].Atual    +wSubGrupos[26].Atual;

// FIM CONSULTAS
//------------------------------------------------------------------------------

// X3
// Indice 30 = 4000 Populacao Abrangida
  wSubGrupos[30].Anterior := wSubGrupos[22].Anterior +wSubGrupos[23].Anterior +wSubGrupos[24].Anterior ;
  wSubGrupos[30].Concedido:= wSubGrupos[22].Concedido+wSubGrupos[23].Concedido+wSubGrupos[24].Concedido;
  wSubGrupos[30].Cancelado:= wSubGrupos[22].Cancelado+wSubGrupos[23].Cancelado+wSubGrupos[24].Cancelado;
  wSubGrupos[30].Atual    := wSubGrupos[22].Atual    +wSubGrupos[23].Atual    +wSubGrupos[24].Atual    ;


// Novo Registro
  QryArquivo.Append;
// Indice 30 = 40000 Populacao Abrangida
    QryArquivo.FieldByName('CODFUND').AsString    :=wNumFundacao;
    QryArquivo.FieldByName('CODIGO').AsString     :='40000';
    QryArquivo.FieldByName('ANTERIOR').AsInteger  :=wSubGrupos[30].Anterior;
    QryArquivo.FieldByName('CONCEDIDO').AsInteger :=wSubGrupos[30].Concedido;
    QryArquivo.FieldByName('CANCELADO').AsInteger :=wSubGrupos[30].Cancelado;
    QryArquivo.FieldByName('ATUAL').AsInteger     :=wSubGrupos[30].Atual;
// Confirma Dados (Tabela esta em cache)
  QryArquivo.Post;

// Novo Registro
  QryArquivo.Append;
// Indice 22 = 40100 Participantes Ativos
    QryArquivo.FieldByName('CODFUND').AsString    :=wNumFundacao;
    QryArquivo.FieldByName('CODIGO').AsString     :='40100';
    QryArquivo.FieldByName('ANTERIOR').AsInteger  :=wSubGrupos[22].Anterior;
    QryArquivo.FieldByName('CONCEDIDO').AsInteger :=wSubGrupos[22].Concedido;
    QryArquivo.FieldByName('CANCELADO').AsInteger :=wSubGrupos[22].Cancelado;
    QryArquivo.FieldByName('ATUAL').AsInteger     :=wSubGrupos[22].Atual;
// Confirma Dados (Tabela esta em cache)
  QryArquivo.Post;

// Novo Registro
  QryArquivo.Append;
// Indice 18 = 40101 Participantes Ativos Custeio Patronal
    QryArquivo.FieldByName('CODFUND').AsString    :=wNumFundacao;
    QryArquivo.FieldByName('CODIGO').AsString     :='40101';
    QryArquivo.FieldByName('ANTERIOR').AsInteger  :=wSubGrupos[18].Anterior;
    QryArquivo.FieldByName('CONCEDIDO').AsInteger :=wSubGrupos[18].Concedido;
    QryArquivo.FieldByName('CANCELADO').AsInteger :=wSubGrupos[18].Cancelado;
    QryArquivo.FieldByName('ATUAL').AsInteger     :=wSubGrupos[18].Atual;
// Confirma Dados (Tabela esta em cache)
  QryArquivo.Post;

// Novo Registro
  QryArquivo.Append;
// Indice 19 = 40102 Participantes Ativos Autopatrocinados
    QryArquivo.FieldByName('CODFUND').AsString    :=wNumFundacao;
    QryArquivo.FieldByName('CODIGO').AsString     :='40102';
    QryArquivo.FieldByName('ANTERIOR').AsInteger  :=wSubGrupos[19].Anterior;
    QryArquivo.FieldByName('CONCEDIDO').AsInteger :=wSubGrupos[19].Concedido;
    QryArquivo.FieldByName('CANCELADO').AsInteger :=wSubGrupos[19].Cancelado;
    QryArquivo.FieldByName('ATUAL').AsInteger     :=wSubGrupos[19].Atual;
// Confirma Dados (Tabela esta em cache)
  QryArquivo.Post;

// Novo Registro
  QryArquivo.Append;
// Indice 20 = 40103 Participantes Ativos Custeio Patronal
    QryArquivo.FieldByName('CODFUND').AsString    :=wNumFundacao;
    QryArquivo.FieldByName('CODIGO').AsString     :='40103';
    QryArquivo.FieldByName('ANTERIOR').AsInteger  :=wSubGrupos[20].Anterior;
    QryArquivo.FieldByName('CONCEDIDO').AsInteger :=wSubGrupos[20].Concedido;
    QryArquivo.FieldByName('CANCELADO').AsInteger :=wSubGrupos[20].Cancelado;
    QryArquivo.FieldByName('ATUAL').AsInteger     :=wSubGrupos[20].Atual;
// Confirma Dados (Tabela esta em cache)
  QryArquivo.Post;

// Novo Registro
  QryArquivo.Append;
// Indice 21 = 40104 Participantes Ativos Processo Aposentadoria.
    QryArquivo.FieldByName('CODFUND').AsString    :=wNumFundacao;
    QryArquivo.FieldByName('CODIGO').AsString     :='40104';
    QryArquivo.FieldByName('ANTERIOR').AsInteger  :=wSubGrupos[21].Anterior;
    QryArquivo.FieldByName('CONCEDIDO').AsInteger :=wSubGrupos[21].Concedido;
    QryArquivo.FieldByName('CANCELADO').AsInteger :=wSubGrupos[21].Cancelado;
    QryArquivo.FieldByName('ATUAL').AsInteger     :=wSubGrupos[21].Atual;
// Confirma Dados (Tabela esta em cache)
  QryArquivo.Post;

// Novo Registro
  QryArquivo.Append;
// Indice 23 = 40200 Participantes Aposentados
    QryArquivo.FieldByName('CODFUND').AsString    :=wNumFundacao;
    QryArquivo.FieldByName('CODIGO').AsString     :='40200';
    QryArquivo.FieldByName('ANTERIOR').AsInteger  :=wSubGrupos[23].Anterior;
    QryArquivo.FieldByName('CONCEDIDO').AsInteger :=wSubGrupos[23].Concedido;
    QryArquivo.FieldByName('CANCELADO').AsInteger :=wSubGrupos[23].Cancelado;
    QryArquivo.FieldByName('ATUAL').AsInteger     :=wSubGrupos[23].Atual;
// Confirma Dados (Tabela esta em cache)
  QryArquivo.Post;

// Novo Registro
  QryArquivo.Append;
// Indice 27 = 40300 Dependentes
    QryArquivo.FieldByName('CODFUND').AsString    :=wNumFundacao;
    QryArquivo.FieldByName('CODIGO').AsString     :='40300';
    QryArquivo.FieldByName('ANTERIOR').AsInteger  :=wSubGrupos[27].Anterior;
    QryArquivo.FieldByName('CONCEDIDO').AsInteger :=wSubGrupos[27].Concedido;
    QryArquivo.FieldByName('CANCELADO').AsInteger :=wSubGrupos[27].Cancelado;
    QryArquivo.FieldByName('ATUAL').AsInteger     :=wSubGrupos[27].Atual;
// Confirma Dados (Tabela esta em cache)
  QryArquivo.Post;

// Novo Registro
  QryArquivo.Append;
// Indice 24 = 40301 Dependentes  de Ativo
    QryArquivo.FieldByName('CODFUND').AsString    :=wNumFundacao;
    QryArquivo.FieldByName('CODIGO').AsString     :='40301';
    QryArquivo.FieldByName('ANTERIOR').AsInteger  :=wSubGrupos[24].Anterior;
    QryArquivo.FieldByName('CONCEDIDO').AsInteger :=wSubGrupos[24].Concedido;
    QryArquivo.FieldByName('CANCELADO').AsInteger :=wSubGrupos[24].Cancelado;
    QryArquivo.FieldByName('ATUAL').AsInteger     :=wSubGrupos[24].Atual;
// Confirma Dados (Tabela esta em cache)
  QryArquivo.Post;

// Novo Registro
  QryArquivo.Append;
// Indice 25 = 40301 Dependentes  de Ativo
    QryArquivo.FieldByName('CODFUND').AsString    :=wNumFundacao;
    QryArquivo.FieldByName('CODIGO').AsString     :='40302';
    QryArquivo.FieldByName('ANTERIOR').AsInteger  :=wSubGrupos[25].Anterior;
    QryArquivo.FieldByName('CONCEDIDO').AsInteger :=wSubGrupos[25].Concedido;
    QryArquivo.FieldByName('CANCELADO').AsInteger :=wSubGrupos[25].Cancelado;
    QryArquivo.FieldByName('ATUAL').AsInteger     :=wSubGrupos[25].Atual;
// Confirma Dados (Tabela esta em cache)
  QryArquivo.Post;

// Novo Registro
  QryArquivo.Append;
// Indice 26 = 40301 Dependentes  de Ativo
    QryArquivo.FieldByName('CODFUND').AsString    :=wNumFundacao;
    QryArquivo.FieldByName('CODIGO').AsString     :='40303';
    QryArquivo.FieldByName('ANTERIOR').AsInteger  :=wSubGrupos[26].Anterior;
    QryArquivo.FieldByName('CONCEDIDO').AsInteger :=wSubGrupos[26].Concedido;
    QryArquivo.FieldByName('CANCELADO').AsInteger :=wSubGrupos[26].Cancelado;
    QryArquivo.FieldByName('ATUAL').AsInteger     :=wSubGrupos[26].Atual;
// Confirma Dados (Tabela esta em cache)
  QryArquivo.Post;

End;

//******************************************************************************
procedure TFrmGeraEstatisticas.GerarTexto(sCodFund,sCodBenef,sTotConc,sTotAnt,sTotCanc: string);
var
    sReg, sSpace, data_canc      : String;
    iContador, iContCampo, iCont : Integer;
begin
  //Inicializa Variáveis
  iContCampo := 0;
  sCampo     := '';
  sReg       := '';
  while icontCampo < 9 do
  begin
    // Campos
    // 0 : Código da Fundação
    // 1 : Código da Arvore
    // 2 : Código do Benefício
    // 3 : Ano
    // 4 : Mês
    // 5 : Total de Concedidos
    // 6 : Total de Cancelados
    // 7 : Total de Anteriores
    // 8 : VAZIO !!!!!

    // sReg é a linha a ser gravada
    // Se for o 1º ou o 3º campo
    Case icontCampo of
      0:sCampo := sCodFund;
      1:sCampo := '2'; // Quando Beneficio
      2:sCampo := sCodBenef;
      3:sCampo := trim(mebano.text);
      4:sCampo := trim(mes);
      5:sCampo := sTotConc;
      6:sCampo := sTotCanc;
      7:sCampo := sTotAnt;
      8:sCampo := ' ';
    end;
    // Se o campo não estiver completamente preenchido ele completa com espaços
    if (arParam[iContCampo] = Length(sCampo)) then
       sReg := sReg + sCampo
    else
    begin
      sSpace := '';
      for iCont := 1 to (arParam[iContCampo] - Length(sCampo)) do
        sSpace := sSpace + ' ';
      if (iContCampo = 5) or (iContCampo = 6) or (iContCampo = 7) then
        sReg := sReg + sSpace + sCampo
      else
        sReg := sReg + sCampo + sSpace;
    end;
    iContCampo := iContCampo + 1;
  end;

  WriteLn(tfArquivo, sReg);
  sReg := '';
  iContador  := iContador + 1;

end;

//******************************************************************************
procedure TFrmGeraEstatisticas.FormCreate(Sender: TObject);
begin
  inherited;
// Mes e Ano Atual
  DecodeDate(Date, wAno, wMes, wDia);
  mebMes.ItemIndex := wMes - 1;
  mebAno.Value := wAno;
end;

procedure TFrmGeraEstatisticas.FormShow(Sender: TObject);
begin
  inherited;

end;


//******************************************************************************
// Imprime o Relatório
Procedure TFrmGeraEstatisticas.ImprimeRelat;
Begin
// Imprime o Relatório
 DtmRelAugusto.LbMes.Caption :='Mês Processado : '+mebMes.Text+' / '+mebAno.Text ;
 DtmRelAugusto.RpSPC.Print;
End;


procedure TFrmGeraEstatisticas.bbtnSairClick(Sender: TObject);
begin
  inherited;
end;

//******************************************************************************
// Preenche os que não foram feitos pela Consulta Inicial
Procedure TFrmGeraEstatisticas.PreencheVazios;
Begin
// 10101 - Aposentadoria Excombatente
  If Not QryArquivo.Locate('CODIGO','10101',[]) Then Begin
    QryArquivo.Append;
      QryArquivo.FieldByName('CODFUND').AsString    :=wNumFundacao;
      QryArquivo.FieldByName('CODIGO').AsString     :='10101';
      QryArquivo.FieldByName('ANTERIOR').AsInteger  :=0;
      QryArquivo.FieldByName('CONCEDIDO').AsInteger :=0;
      QryArquivo.FieldByName('CANCELADO').AsInteger :=0;
      QryArquivo.FieldByName('ATUAL').AsInteger     :=0;
// Confirma Dados (Tabela esta em cache)
    QryArquivo.Post;
  End;

// 10102 - Aposentadoria Invalide
  If Not QryArquivo.Locate('CODIGO','10102',[]) Then Begin
    QryArquivo.Append;
      QryArquivo.FieldByName('CODFUND').AsString    :=wNumFundacao;
      QryArquivo.FieldByName('CODIGO').AsString     :='10102';
      QryArquivo.FieldByName('ANTERIOR').AsInteger  :=0;
      QryArquivo.FieldByName('CONCEDIDO').AsInteger :=0;
      QryArquivo.FieldByName('CANCELADO').AsInteger :=0;
      QryArquivo.FieldByName('ATUAL').AsInteger     :=0;
// Confirma Dados (Tabela esta em cache)
    QryArquivo.Post;
  End;

// 10103 - Aposentadoria por Idade
  If Not QryArquivo.Locate('CODIGO','10103',[]) Then Begin
    QryArquivo.Append;
      QryArquivo.FieldByName('CODFUND').AsString    :=wNumFundacao;
      QryArquivo.FieldByName('CODIGO').AsString     :='10103';
      QryArquivo.FieldByName('ANTERIOR').AsInteger  :=0;
      QryArquivo.FieldByName('CONCEDIDO').AsInteger :=0;
      QryArquivo.FieldByName('CANCELADO').AsInteger :=0;
      QryArquivo.FieldByName('ATUAL').AsInteger     :=0;
// Confirma Dados (Tabela esta em cache)
    QryArquivo.Post;
  End;

// 10104 - Aposentadoria Tempo de Serviço
  If Not QryArquivo.Locate('CODIGO','10104',[]) Then Begin
    QryArquivo.Append;
      QryArquivo.FieldByName('CODFUND').AsString    :=wNumFundacao;
      QryArquivo.FieldByName('CODIGO').AsString     :='10104';
      QryArquivo.FieldByName('ANTERIOR').AsInteger  :=0;
      QryArquivo.FieldByName('CONCEDIDO').AsInteger :=0;
      QryArquivo.FieldByName('CANCELADO').AsInteger :=0;
      QryArquivo.FieldByName('ATUAL').AsInteger     :=0;
// Confirma Dados (Tabela esta em cache)
    QryArquivo.Post;
  End;

// 10105 - Aposentadoria Antecipada
  If Not QryArquivo.Locate('CODIGO','10105',[]) Then Begin
    QryArquivo.Append;
      QryArquivo.FieldByName('CODFUND').AsString    :=wNumFundacao;
      QryArquivo.FieldByName('CODIGO').AsString     :='10105';
      QryArquivo.FieldByName('ANTERIOR').AsInteger  :=0;
      QryArquivo.FieldByName('CONCEDIDO').AsInteger :=0;
      QryArquivo.FieldByName('CANCELADO').AsInteger :=0;
      QryArquivo.FieldByName('ATUAL').AsInteger     :=0;
// Confirma Dados (Tabela esta em cache)
    QryArquivo.Post;
  End;

// 10106 - Aposentadoria Postergada
  If Not QryArquivo.Locate('CODIGO','10106',[]) Then Begin
    QryArquivo.Append;
      QryArquivo.FieldByName('CODFUND').AsString    :=wNumFundacao;
      QryArquivo.FieldByName('CODIGO').AsString     :='10106';
      QryArquivo.FieldByName('ANTERIOR').AsInteger  :=0;
      QryArquivo.FieldByName('CONCEDIDO').AsInteger :=0;
      QryArquivo.FieldByName('CANCELADO').AsInteger :=0;
      QryArquivo.FieldByName('ATUAL').AsInteger     :=0;
// Confirma Dados (Tabela esta em cache)
    QryArquivo.Post;
  End;

// 10301 - Auxilio Reclusao
  If Not QryArquivo.Locate('CODIGO','10301',[]) Then Begin
    QryArquivo.Append;
      QryArquivo.FieldByName('CODFUND').AsString    :=wNumFundacao;
      QryArquivo.FieldByName('CODIGO').AsString     :='10301';
      QryArquivo.FieldByName('ANTERIOR').AsInteger  :=0;
      QryArquivo.FieldByName('CONCEDIDO').AsInteger :=0;
      QryArquivo.FieldByName('CANCELADO').AsInteger :=0;
      QryArquivo.FieldByName('ATUAL').AsInteger     :=0;
// Confirma Dados (Tabela esta em cache)
    QryArquivo.Post;
  End;

// 10302 - Auxilio Doenca
  If Not QryArquivo.Locate('CODIGO','10302',[]) Then Begin
    QryArquivo.Append;
      QryArquivo.FieldByName('CODFUND').AsString    :=wNumFundacao;
      QryArquivo.FieldByName('CODIGO').AsString     :='10302';
      QryArquivo.FieldByName('ANTERIOR').AsInteger  :=0;
      QryArquivo.FieldByName('CONCEDIDO').AsInteger :=0;
      QryArquivo.FieldByName('CANCELADO').AsInteger :=0;
      QryArquivo.FieldByName('ATUAL').AsInteger     :=0;
// Confirma Dados (Tabela esta em cache)
    QryArquivo.Post;
  End;
End;

{------------------------------------------------------------------------------}
Procedure TFrmGeraEstatisticas.InserePatro(QryDados:TwwQuery; CodSPC:String);
Begin
  { Insere Regristro }
  QryPatroSPC.Insert;
  QryPatroSPC.FieldByName('IDPESSJUR').asinteger := QryDados.FieldByName('IDPESSJUR').AsInteger;
  QryPatroSPC.FieldByName('ANOMES').asstring     := sAnoMes;
  { Falta incluir totais }
  QryPatroSPC.FieldByName('CODFUNDSPC').asstring := QryDados.FieldByName('CODFUNDSPC').asstring;
  QryPatroSPC.Post;
End;

{------------------------------------------------------------------------------}
Procedure TFrmGeraEstatisticas.InserePlano(QryDados:TwwQuery; CodSPC:String);
var bAchou : boolean;
Begin
  { Insere Regristro }
  QryPlanoSPC.First;

  bAchou := False;
  while not QryPlanoSPC.Eof do
  begin
     if (QryPlanoSPC.FieldByName('IDPESSJUR').AsString   = qryDados.FieldbyName('IDPESSJUR').AsString) and
        (QryPlanoSPC.FieldByName('IDPLANOPREV').AsString = qryDados.FieldbyName('IDPLANOPREV').AsString) and
        (QryPlanoSPC.FieldByName('ANOMES').AsString   = sAnoMes)
     then begin
        bAchou := True;
        break;
     end;
     QryPlanoSPC.Next;
  end;

  if not bAchou
  then QryPlanoSPC.Insert
  else QryPlanoSPC.Edit;
  
  QryPlanoSPC.FieldByName('IDPESSJUR').asinteger   := QryDados.FieldByName('IDPESSJUR').asinteger;
  QryPlanoSPC.FieldByName('ANOMES').asstring       := sAnoMes;

  { Falta incluir totais }

  QryPlanoSPC.FieldByName('IDPLANOPREV').asinteger := QryDados.FieldByName('IDPLANOPREV').asinteger;
  QryPlanoSPC.Post;
End;

{------------------------------------------------------------------------------}
Procedure TFrmGeraEstatisticas.InsereBeneficio(QryDados:TwwQuery; CodSPC:String);
Begin
  FazQuery(QryMostraResult,'SELECT CODFUNDSPC FROM FUNDACAO '+
                           'WHERE  IDPESSOA   = '+IntToStr(iIdFundacaoCCP));
  wNumFundacao := QryMostraResult.FieldByname('CODFUNDSPC').AsString;
End;

end.


