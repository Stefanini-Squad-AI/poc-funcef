unit FEstatisticaSPCNOVO;

// Alterações
//--------------------------------------------------------------------------------------------------

{-----------------------------------------------------------------------------
Autor(a)    :  Henrique Massão
Data        :  27/02/2009
Pendência   :  SOL 109421 KINTANA 496332
Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C:
------------------------------------------------------------------------------}

// Autor(a)    : Claudio Faria
// Rotina      : Varias
// Data        : 21/08/2007
// Pendência   : 22108
// Alteração   : Troca do DateToStr para FormatDateTime.
// -----------------------------------------------------------------------------
// Rotina      : AlimentaLista
// Autor(a)    : André Pontes
// Data        : 13/03/2007
// Pendência   : 23646
// Alteração   : First na tabela, pois estava gravando na planilha apenas a última linha
//--------------------------------------------------------------------------------------------------
// Rotina      : várias (AlimentaLista principalmente)
// Autor(a)    : André Pontes
// Data        : 13/11/2006 a 24/11/2006
// Pendência   : 23646
// Alteração   : 1) Criação de nova planilha a cada 30000 registros, para não estourar a capacidade
//                  do Excel (65536 linhas)
//               2) Alteração da lógica da query de Beneficios de Referencia para alimentar query
//                  virtual passada então para a AlimentaLista
//--------------------------------------------------------------------------------------------------
// Rotina      : bbtnConfirmarClick
// Autor(a)    : Leo  - Funcef
// Data        : 17/11/2005
// Pendência   : 20785
// Alteração   : gravação do logtotalprev
//------------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : Leo  - Funcef
// Data        : 16/02/2005
// Alteração   : retirei as pensões - 21000,21100 e 21200 da primeira consulta de aposentadorias
//------------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : Leo  - Funcef
// Data        : 21/12/2004
// Alteração   : acrescentei o IDSITPART nas queries para as regras
//------------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : Leo  - Funcef
// Data        : 23/11/2004
// Alteração   : acrescentei a cláusula AND TIPOMOV  <> 13 em todos os testes de último movimento na movbenef
//               para não criticar o retroativo feito em cima de concessão.
//               Basea-se principalmente no pagamento na HST.
//------------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : Leo  - Funcef
// Data        : 23/11/2004
// Alteração   : acertei geração de lista excell do 21100
//------------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : Leo  - Funcef
// Data        : 29/04/2004
// Alteração   : refiz 91000
//------------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : Leo  - Funcef
// Data        : 29/04/2004
// Alteração   : refiz query designadosAS
//------------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : Leo  - Funcef
// Data        : 23/03/2004
// Alteração   : refiz query designados para ao invés de pegar o total e verificar
//               quantos foram cancelados a partir disto, pegar diretamente os cancelados pela
//               data de cancelamento
//------------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : Leo  - Funcef
// Data        : 09/02/2004
// Alteração   : acerto geral do relatório para SPC
//------------------------------------------------------------------------------
// Rotina      : InsereSaldoInicial e PreencheGruposPatroPlano
// Autor(a)    : Gleyber
// Data        : 08/07/2003
// Alteração   : Inclusão do filtro MULTI-FUNDAÇÃO
//------------------------------------------------------------------------------
// Rotina      : bbtnConfirmarClick
// Autor(a)    : Augusto
// Data        : 01/07/2003
// Alteração   : Novo filtro na qryDesiginadosAS
//------------------------------------------------------------------------------
// Rotina      : bbtnConfirmarClick
// Autor(a)    : Gleyber
// Data        : 03/02/2003
// Alteração   : Correção da variavel DATAFIM
//------------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : Leo
// Data        : 08/10/2002
// Alteração   : trazultdiames agora chamado da funcoesuteis
//------------------------------------------------------------------------------


{
// Grupos do Estatístico da SPC
          11000 :  'Aposentadorias de Prestação Continuada';
          11100 :  'Aposentadoria por Tempo de Contribuição e Idade';
          11200 :  'Aposentadoria por Tempo de Contribuição';
          11300 :  'Aposentadoria por Idade ';
          11400 :  'Aposentadoria por Invalidez';
          11500 :  'Aposentadoria Antecipada';
          11600 :  'Aposentadoria Postergada';
          11700 :  'Aposentadoria Proporcional Diferida';
          11800 :  'Aposentadoria Especial';
          12000 :  'Aposentadorias de Pagamento Único';
          12100 :  'Aposentadoria por Tempo de Contribuição e Idade';
          12200 :  'Aposentadoria por Tempo de Contribuição';
          12300 :  'Aposentadoria por Idade';
          12400 :  'Aposentadoria por Invalidez';
          12500 :  'Aposentadoria Antecipada';
          12600 :  'Aposentadoria Postergada';
          12700 :  'Aposentadoria Proporcional Diferida';
          12800 :  'Aposentadoria Especial';
          21000 :  'Pensões (Totalizador)';
          21100 :  'Pensão - Origem Participante';
          21200 :  'Pensão - Origem Assistido';
          31000 :  'Auxílios de Prestação Continuada';
          31100 :  'Auxílio Reclusao';
          31200 :  'Auxílio Doença';
          31300 :  'Outros Auxílios';
          32000 :  'Auxílios de Prestação Única';
          32100 :  'Auxílio Funeral';
          32200 :  'Auxílio Natalidade';
          32300 :  'Auxílio Nupcial';
          32400 :  'Outros Auxílios';
          41000 :  'Pecúlios (Totalizador)';
          41100 :  'Pecúlio por Morte do Participante';
          41200 :  'Pecúlio por Morte do Assistido';
          41300 :  'Pecúlio por Invalidez';
          41400 :  'Outros Pecúlios';
          51000 :  'Outros Benefícios';
          61000 :  'Resgates de Contribuições (Totalizador)';
          61100 :  'Resgate de Contribuições com Custeio Patronal';
          61200 :  'Resgate de Contribuições com Custeio do Participante';// ???
          71100 :  'Plano de Benefícios Originário';
          71200 :  'Plano de Benefícios Receptor';
          81000 :  'Participantes (Totalizador)';
          81100 :  'Participantes com Custeio Patronal';
          81200 :  'Participante com Custeio Exclusivo do Participante ';// ???
          81300 :  'Participante com Benefício Proporcional';
          81400 :  'Participante em Processo de Aposentadoria'; // ???
          81500 :  'Participante no Prazo de Opção';
          82000 :  'Assistido de Prestação Continuada';
          83000 :  'Assistido de Pagamento Único';
          84000 :  'Designados (Totalizador)';
          84100 :  'Designado de Participante';
          84200 :  'Designado de Assistido;
          91000 :  'Beneficiários de Pensão';
}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Spin, Db, DBTables, Wwquery, Grids, DBGrids,
  OleCtrls, AppEvnts, StdActns, ActnList, ComObj;

type
  TfrmEstatisticaSPCNOVO = class(TfrmOkCancelar)
    Gb: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    mebMes: TComboBox;
    mebAno: TSpinEdit;
    chkEventos: TCheckBox;
    lblArqSaida: TLabel;
    edArqSaida: TEdit;
    sbtArqSaida: TSpeedButton;
    OpenDlg: TOpenDialog;
    qryPatroPlano: TwwQuery;
    qryEstatisticas: TwwQuery;
    updEstatisticas: TUpdateSQL;
    qryAposentadoriasOLD: TwwQuery;
    qryAux: TwwQuery;
    qryPensao: TwwQuery;
    memEventos: TMemo;
    memObs: TMemo;
    qryReserva: TwwQuery;
    qryMantidosSemEventos: TwwQuery;
    qryAtivosSemEventos: TwwQuery;
    qryAssistidosSemEventos: TwwQuery;
    qrySaldoInicial: TwwQuery;
    qryAposentadorias: TwwQuery;
    qryPensaoPorBeneficiario: TwwQuery;
    qryDesignados: TwwQuery;
    qryDesignadosAS: TwwQuery;
    DataSource1: TDataSource;
    chkListaExcel: TCheckBox;
    OpenDialog: TOpenDialog;
    memResult: TMemo;
    qryBenefRef: TwwQuery;
    updBenefRef: TUpdateSQL;
    procedure FormCreate(Sender: TObject);
    procedure sbtArqSaidaClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure chkEventosClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    sAnoMesAnt : string;
    DataIni, DataFim : string;
    ExcelApp, Sheet : Variant;
    function  GeraEstatisticaCOMEventos : boolean;
    procedure PreencheGruposPatroPlano;

    //MUDANCA PELO NOVO REGULAMENTO DA SPC
    function  InsereSaldoInicial        : boolean;
    function  GeraEstatisticaSEMEventos : boolean;
  public
    { Public declarations }
    iLinhaLista : Integer;
    procedure CriaListaSpc;
    function GeraListaSEMEventos : boolean;
    procedure AlimentaLista(qryAposentadorias : TwwQuery;
                            psNomePlan: String;
                            psCodigo : String = '');
  end;

var
  F : TextFile ;
  frmEstatisticaSPCNOVO: TfrmEstatisticaSPCNOVO;


implementation

uses UMensErro, DBaseDados, UDiasUteis, UAdmPrev, fAguarde, UFuncoesUteis,
     uDataBase, UModulo, USistema;

{$R *.DFM}

function TfrmEstatisticaSPCNOVO.InsereSaldoInicial : boolean;
var i          : word;
    sCodArvore : string;
begin

   sAnoMesAnt := SAnoMesAnterior(Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2));
   qrySaldoInicial.Close;
   qrySaldoInicial.ParamByName('ANOMESANTERIOR').AsString := sAnoMesAnt;
   qrySaldoInicial.Open;

   with qryEstatisticas do
   begin
      if not Active
      then begin
         Close;
         ParamByName('ANOMES').AsString       := '0000/00';
         ParamByName('CODARVORE').AsString    := '000000';
         Open;
      end;

      for i := 1 to 53 do
      begin
         case i of
              1  : sCodArvore := '11000';
              2  : sCodArvore := '11100';
              3  : sCodArvore := '11200';
              4  : sCodArvore := '11300';
              5  : sCodArvore := '11400';
              6  : sCodArvore := '11500';
              7  : sCodArvore := '11600';
              8  : sCodArvore := '11700';
              9  : sCodArvore := '11800';
              10 : sCodArvore := '12000';
              11 : sCodArvore := '12100';
              12 : sCodArvore := '12200';
              13 : sCodArvore := '12300';
              14 : sCodArvore := '12400';
              15 : sCodArvore := '12500';
              16 : sCodArvore := '12600';
              17 : sCodArvore := '12700';
              18 : sCodArvore := '12800';
              19 : sCodArvore := '21000';
              20 : sCodArvore := '21100';
              21 : sCodArvore := '21200';
              22 : sCodArvore := '31000';
              23 : sCodArvore := '31100';
              24 : sCodArvore := '31200';
              25 : sCodArvore := '31300';
              26 : sCodArvore := '32000';
              27 : sCodArvore := '32100';
              28 : sCodArvore := '32200';
              29 : sCodArvore := '32300';
              30 : sCodArvore := '32400';
              31 : sCodArvore := '41000';
              32 : sCodArvore := '41100';
              33 : sCodArvore := '41200';
              34 : sCodArvore := '41300';
              35 : sCodArvore := '41400';
              36 : sCodArvore := '51000';
              37 : sCodArvore := '61000';
              38 : sCodArvore := '61100';
              39 : sCodArvore := '61200';
              40 : sCodArvore := '71100';
              41 : sCodArvore := '71200';
              42 : sCodArvore := '81000';
              43 : sCodArvore := '81100';
              44 : sCodArvore := '81200';
              45 : sCodArvore := '81300';
              46 : sCodArvore := '81400';
              47 : sCodArvore := '81500';
              48 : sCodArvore := '82000';
              49 : sCodArvore := '83000';
              50 : sCodArvore := '84000';
              51 : sCodArvore := '84100';
              52 : sCodArvore := '84200';
              53 : sCodArvore := '91000';
         end; // case

         Insert;
         FieldByName('ANOMES').AsString        := Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2);
         FieldByName('CODARVORE').AsString     := sCodArvore;
         FieldByName('CODBENEFSPC').AsString   := sCodArvore;
         FieldByName('IDFUNDACAO').AsInteger   := iIdFundacao;   
         if qrySaldoInicial.Locate('CODARVORE', sCodArvore,[loCaseInsensitive])
         then FieldByName('TOTANTERIOR').AsInteger  := qrySaldoInicial.FieldByName('SALDOMESANTERIOR').AsInteger
         else FieldByName('TOTANTERIOR').AsInteger  := 0;
         FieldByName('TOTCONCEDIDO').AsInteger := 0;
         FieldByName('TOTCANCELADO').AsInteger := 0;
         Post;
      end; // for
   end; // with
end; // InsereSaldoInicial

procedure TfrmEstatisticaSPCNOVO.PreencheGruposPatroPlano;
var i          : word;
    sCodArvore : string;
begin
   with qryEstatisticas do
   begin
      if not Active
      then begin
         Close;
         ParamByName('ANOMES').AsString       := '';
         ParamByName('CODARVORE').AsString    := '';
         Open;
      end;

      for i := 1 to 53 do
      begin
         case i of
              1  : sCodArvore := '11000';
              2  : sCodArvore := '11100';
              3  : sCodArvore := '11200';
              4  : sCodArvore := '11300';
              5  : sCodArvore := '11400';
              6  : sCodArvore := '11500';
              7  : sCodArvore := '11600';
              8  : sCodArvore := '11700';
              9  : sCodArvore := '11800';
              10 : sCodArvore := '12000';
              11 : sCodArvore := '12100';
              12 : sCodArvore := '12200';
              13 : sCodArvore := '12300';
              14 : sCodArvore := '12400';
              15 : sCodArvore := '12500';
              16 : sCodArvore := '12600';
              17 : sCodArvore := '12700';
              18 : sCodArvore := '12800';
              19 : sCodArvore := '21000';
              20 : sCodArvore := '21100';
              21 : sCodArvore := '21200';
              22 : sCodArvore := '31000';
              23 : sCodArvore := '31100';
              24 : sCodArvore := '31200';
              25 : sCodArvore := '31300';
              26 : sCodArvore := '32000';
              27 : sCodArvore := '32100';
              28 : sCodArvore := '32200';
              29 : sCodArvore := '32300';
              30 : sCodArvore := '32400';
              31 : sCodArvore := '41000';
              32 : sCodArvore := '41100';
              33 : sCodArvore := '41200';
              34 : sCodArvore := '41300';
              35 : sCodArvore := '41400';
              36 : sCodArvore := '51000';
              37 : sCodArvore := '61000';
              38 : sCodArvore := '61100';
              39 : sCodArvore := '61200';
              40 : sCodArvore := '71100';
              41 : sCodArvore := '71200';
              42 : sCodArvore := '81000';
              43 : sCodArvore := '81100';
              44 : sCodArvore := '81200';
              45 : sCodArvore := '81300';
              46 : sCodArvore := '81400';
              47 : sCodArvore := '81500';
              48 : sCodArvore := '82000';
              49 : sCodArvore := '83000';
              50 : sCodArvore := '84000';
              51 : sCodArvore := '84100';
              52 : sCodArvore := '84200';
              53 : sCodArvore := '91000';
         end; // case

         Insert;
         FieldByName('ANOMES').AsString        := Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2);
         FieldByName('CODARVORE').AsString     := sCodArvore;
         FieldByName('TOTANTERIOR').AsInteger  := 0;
         FieldByName('TOTCONCEDIDO').AsInteger := 0;
         FieldByName('TOTCANCELADO').AsInteger := 0;
         FieldByName('IDFUNDACAO').AsInteger   := iIdFundacao;   
         Post;
      end; // for
   end; // with
end; // PreencheGruposPatroPlano

function TfrmEstatisticaSPCNOVO.GeraEstatisticaCOMEventos : boolean;
var sanomes, sSQL : String;
    itotcancelado, itotconcedido : Integer;
    VarFields   : variant;

begin
   Result := False;


   sAnoMes := Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2);
   // NESTE PONTO OS GRUPOS QUE FALTAM SÃO
   //     71100 :  'Plano de Benefícios Originário';
   //     71200 :  'Plano de Benefícios Receptor';
   //     81000 :  'Participantes (Totalizador)';
   //     81100 :  'Participantes com Custeio Patronal';               -> ATIVO
   //     81200 :  'Participante com Custeio Exclusivo do Participante -> MANTIDO TOTAL
   //     81300 :  'Participante com Benefício Proporcional'           -> MANTIDO DE SALDO DE CONTA
   //     81400 :  'Participante em Processo de Aposentadoria';        -> ASSISTIDO sem Beneficio Concedido (Beneficio apenas Requerido)
   //     81500 :  'Participante no Prazo de Opção';                   -> PENDENTE
   //     82000 :  'Assistido de Prestação Continuada';
   //     83000 :  'Assistido de Pagamento Único';
   //     84000 :  'Designados (Totalizador)';
   //     84100 :  'Designado de Participante';
   //     84200 :  'Designado de Assistido;
   //     91000 :  'Beneficiários de Pensão';

   // **************************************************************************
   // **************************************************************************
   // 81100 - ATIVOS - CONCEDIDOS
   // **************************************************************************
   sSQL := ' SELECT COUNT(DISTINCT EV.IDPESSOA) AS TOTCONCEDIDO                                 '+
           ' FROM   EVENTOSPREV EV, SITPART SP                                                  '+
           ' WHERE  TO_CHAR(EV.DATAREGISTRO,''YYYY/MM'') = '''+sAnoMes+'''                      '+
           ' AND    SP.IDSITPART                         = EV.IDSITPARTNOVO                     '+
           ' AND    SP.FLGINTERNO                        IN (''AT'',''MP'')                     '+
           ' AND    NOT EXISTS ( SELECT 1 FROM EVENTOSPREV EV2, SITPART SP2                     '+
           '                     WHERE  TO_CHAR(EV2.DATAREGISTRO,''YYYY/MM'') = '''+sAnoMes+''' '+
           '                     AND    EV2.IDPESSJUR   = EV.IDPESSJUR                          '+
           '                     AND    EV2.IDPLANOPREV = EV.IDPLANOPREV                        '+
           '                     AND    EV2.IDPESSOA    = EV.IDPESSOA                           '+
           '                     AND    EV2.IDEVENTOSPREV > EV.IDEVENTOSPREV                    '+
           '                     AND    SP2.IDSITPART   = EV2.IDSITPARTNOVO                     '+
           '                     AND    SP2.FLGINTERNO  <> ''AT''                               '+
           '                     AND    SP2.FLGINTERNO  <> ''MP''                               '+
           '                   )                                                                ';
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(sSQL);
   qryAux.Open;
   iTotConcedido := qryAux.FieldByName('TOTCONCEDIDO').AsInteger;

   // 81100 - ATIVOS - CANCELADOS
   sSQL := ' SELECT COUNT(DISTINCT EV.IDPESSOA) AS TOTCANCELADO                                 '+
           ' FROM   EVENTOSPREV EV, SITPART SPANTES, SITPART SPDEPOIS                           '+
           ' WHERE  TO_CHAR(EV.DATAREGISTRO,''YYYY/MM'') = '''+sAnoMes+'''                      '+
           ' AND    SPANTES.IDSITPART                         = EV.IDSITPARTATUAL               '+
           ' AND    SPANTES.FLGINTERNO                        IN (''AT'',''MP'')                '+
           ' AND    SPDEPOIS.IDSITPART                        = EV.IDSITPARTNOVO                '+
           ' AND    SPDEPOIS.FLGINTERNO 				           <> ''AT''                         '+
           ' AND    SPDEPOIS.FLGINTERNO 				           <> ''MP''                         ';
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(sSQL);
   qryAux.Open;
   iTotCancelado := qryAux.FieldByName('TOTCANCELADO').AsInteger;

   varFields[0] := sAnoMes;
   varFields[1] := '81100';

   with qryEstatisticas do
   begin
      if Locate('ANOMES; CODARVORE',varFields,[loCaseInsensitive])
      then begin
         Edit;
         FieldByName('TOTCONCEDIDO').AsInteger := FieldByName('TOTCONCEDIDO').AsInteger + iTotConcedido;
         FieldByName('TOTCANCELADO').AsInteger := FieldByName('TOTCANCELADO').AsInteger + iTotCancelado;
         Post;
      end;
   end;
   // **************************************************************************
   // 81100 - FIM
   // **************************************************************************
   // **************************************************************************

   // **************************************************************************
   // **************************************************************************
   // 81200 - MANTIDOS - CONCEDIDOS
   // **************************************************************************
   sSQL := ' SELECT COUNT(DISTINCT EV.IDPESSOA) AS TOTCONCEDIDO                                 '+
           ' FROM   EVENTOSPREV EV, SITPART SP                                                  '+
           ' WHERE  TO_CHAR(EV.DATAREGISTRO,''YYYY/MM'') = '''+sAnoMes+'''                      '+
           ' AND    SP.IDSITPART                         = EV.IDSITPARTNOVO                     '+
           ' AND    SP.FLGINTERNO                        = ''MA''                               '+
           ' AND    NOT EXISTS ( SELECT 1 FROM EVENTOSPREV EV2, SITPART SP2                     '+
           '                     WHERE  TO_CHAR(EV2.DATAREGISTRO,''YYYY/MM'') = '''+sAnoMes+''' '+
           '                     AND    EV2.IDPESSJUR   = EV.IDPESSJUR                          '+
           '                     AND    EV2.IDPLANOPREV = EV.IDPLANOPREV                        '+
           '                     AND    EV2.IDPESSOA    = EV.IDPESSOA                           '+
           '                     AND    EV2.IDEVENTOSPREV > EV.IDEVENTOSPREV                    '+
           '                     AND    SP2.IDSITPART   = EV2.IDSITPARTNOVO                     '+
           '                     AND    SP2.FLGINTERNO  <> ''MA''                               '+
           '                   )                                                                ';
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(sSQL);
   qryAux.Open;
   iTotConcedido := qryAux.FieldByName('TOTCONCEDIDO').AsInteger;

   // 81200 - MANTIDOS - CANCELADOS
   sSQL := ' SELECT COUNT(DISTINCT EV.IDPESSOA) AS TOTCANCELADO                                 '+
           ' FROM   EVENTOSPREV EV, SITPART SPANTES, SITPART SPDEPOIS                           '+
           ' WHERE  TO_CHAR(EV.DATAREGISTRO,''YYYY/MM'') = '''+sAnoMes+'''                      '+
           ' AND    SPANTES.IDSITPART                         = EV.IDSITPARTATUAL               '+
           ' AND    SPANTES.FLGINTERNO                        = ''MA''                          '+
           ' AND    SPDEPOIS.IDSITPART                        = EV.IDSITPARTNOVO                '+
           ' AND    SPDEPOIS.FLGINTERNO 				           <> ''MA''                         ';
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(sSQL);
   qryAux.Open;
   iTotCancelado := qryAux.FieldByName('TOTCANCELADO').AsInteger;

   varFields[0] := sAnoMes;
   varFields[1] := '81200';

   with qryEstatisticas do
   begin
      if Locate('ANOMES; CODARVORE',varFields,[loCaseInsensitive])
      then begin
         Edit;
         FieldByName('TOTCONCEDIDO').AsInteger := FieldByName('TOTCONCEDIDO').AsInteger + iTotConcedido;
         FieldByName('TOTCANCELADO').AsInteger := FieldByName('TOTCANCELADO').AsInteger + iTotCancelado;
         Post;
      end;
   end;
   // **************************************************************************
   // 81200 - FIM
   // **************************************************************************
   // **************************************************************************

   // **************************************************************************
   // **************************************************************************
   // 81300 - MANTIDOS DE SALDO DE CONTAS - CONCEDIDOS
   // **************************************************************************
   sSQL := ' SELECT COUNT(DISTINCT EV.IDPESSOA) AS TOTCONCEDIDO                                 '+
           ' FROM   EVENTOSPREV EV, SITPART SP                                                  '+
           ' WHERE  TO_CHAR(EV.DATAREGISTRO,''YYYY/MM'') = '''+sAnoMes+'''                      '+
           ' AND    SP.IDSITPART                         = EV.IDSITPARTNOVO                     '+
           ' AND    SP.FLGINTERNO                        = ''MS''                               '+
           ' AND    NOT EXISTS ( SELECT 1 FROM EVENTOSPREV EV2, SITPART SP2                     '+
           '                     WHERE  TO_CHAR(EV2.DATAREGISTRO,''YYYY/MM'') = '''+sAnoMes+''' '+
           '                     AND    EV2.IDPESSJUR   = EV.IDPESSJUR                          '+
           '                     AND    EV2.IDPLANOPREV = EV.IDPLANOPREV                        '+
           '                     AND    EV2.IDPESSOA    = EV.IDPESSOA                           '+
           '                     AND    EV2.IDEVENTOSPREV > EV.IDEVENTOSPREV                    '+
           '                     AND    SP2.IDSITPART   = EV2.IDSITPARTNOVO                     '+
           '                     AND    SP2.FLGINTERNO  <> ''MS''                               '+
           '                   )                                                                ';
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(sSQL);
   qryAux.Open;
   iTotConcedido := qryAux.FieldByName('TOTCONCEDIDO').AsInteger;

   // 81300 - MANTIDOS - CANCELADOS
   sSQL := ' SELECT COUNT(DISTINCT EV.IDPESSOA) AS TOTCANCELADO                                 '+
           ' FROM   EVENTOSPREV EV, SITPART SPANTES, SITPART SPDEPOIS                           '+
           ' WHERE  TO_CHAR(EV.DATAREGISTRO,''YYYY/MM'') = '''+sAnoMes+'''                      '+
           ' AND    SPANTES.IDSITPART                         = EV.IDSITPARTATUAL               '+
           ' AND    SPANTES.FLGINTERNO                        = ''MS''                          '+
           ' AND    SPDEPOIS.IDSITPART                        = EV.IDSITPARTNOVO                '+
           ' AND    SPDEPOIS.FLGINTERNO 		      <> ''MS''                         ';
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(sSQL);
   qryAux.Open;
   iTotCancelado := qryAux.FieldByName('TOTCANCELADO').AsInteger;

   varFields[0] := sAnoMes;
   varFields[1] := '81300';

   with qryEstatisticas do
   begin
      if Locate('ANOMES; CODARVORE',varFields,[loCaseInsensitive])
      then begin
         Edit;
         FieldByName('TOTCONCEDIDO').AsInteger := FieldByName('TOTCONCEDIDO').AsInteger + iTotConcedido;
         FieldByName('TOTCANCELADO').AsInteger := FieldByName('TOTCANCELADO').AsInteger + iTotCancelado;
         Post;
      end;
   end;
   // **************************************************************************
   // 81300 - FIM
   // **************************************************************************
   // **************************************************************************



   // **************************************************************************
   // **************************************************************************
   // 81500 - MANTIDOS DE SALDO DE CONTAS - CONCEDIDOS
   // **************************************************************************
   sSQL := ' SELECT COUNT(DISTINCT EV.IDPESSOA) AS TOTCONCEDIDO                                 '+
           ' FROM   EVENTOSPREV EV, SITPART SP                                                  '+
           ' WHERE  TO_CHAR(EV.DATAREGISTRO,''YYYY/MM'') = '''+sAnoMes+'''                      '+
           ' AND    SP.IDSITPART                         = EV.IDSITPARTNOVO                     '+
           ' AND    SP.FLGINTERNO                        = ''PN''                               '+
           ' AND    NOT EXISTS ( SELECT 1 FROM EVENTOSPREV EV2, SITPART SP2                     '+
           '                     WHERE  TO_CHAR(EV2.DATAREGISTRO,''YYYY/MM'') = '''+sAnoMes+''' '+
           '                     AND    EV2.IDPESSJUR   = EV.IDPESSJUR                          '+
           '                     AND    EV2.IDPLANOPREV = EV.IDPLANOPREV                        '+
           '                     AND    EV2.IDPESSOA    = EV.IDPESSOA                           '+
           '                     AND    EV2.IDEVENTOSPREV > EV.IDEVENTOSPREV                    '+
           '                     AND    SP2.IDSITPART   = EV2.IDSITPARTNOVO                     '+
           '                     AND    SP2.FLGINTERNO  <> ''PN''                               '+
           '                   )                                                                ';
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(sSQL);
   qryAux.Open;
   iTotConcedido := qryAux.FieldByName('TOTCONCEDIDO').AsInteger;

   // 81500 - MANTIDOS - CANCELADOS
   sSQL := ' SELECT COUNT(DISTINCT EV.IDPESSOA) AS TOTCANCELADO                                 '+
           ' FROM   EVENTOSPREV EV, SITPART SPANTES, SITPART SPDEPOIS                           '+
           ' WHERE  TO_CHAR(EV.DATAREGISTRO,''YYYY/MM'') = '''+sAnoMes+'''                      '+
           ' AND    SPANTES.IDSITPART                         = EV.IDSITPARTATUAL               '+
           ' AND    SPANTES.FLGINTERNO                        = ''PN''                          '+
           ' AND    SPDEPOIS.IDSITPART                        = EV.IDSITPARTNOVO                '+
           ' AND    SPDEPOIS.FLGINTERNO 		      <> ''PN''                         ';
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(sSQL);
   qryAux.Open;
   iTotCancelado := qryAux.FieldByName('TOTCANCELADO').AsInteger;

   varFields[0] := sAnoMes;
   varFields[1] := '81500';

   with qryEstatisticas do
   begin
      if Locate('ANOMES; CODARVORE',varFields,[loCaseInsensitive])
      then begin
         Edit;
         FieldByName('TOTCONCEDIDO').AsInteger := FieldByName('TOTCONCEDIDO').AsInteger + iTotConcedido;
         FieldByName('TOTCANCELADO').AsInteger := FieldByName('TOTCANCELADO').AsInteger + iTotCancelado;
         Post;
      end;
   end;
   // **************************************************************************
   // 81500 - FIM
   // **************************************************************************
   // **************************************************************************

   Result := True;
end; // GeraEstatisticaCOMEventos

function TfrmEstatisticaSPCNOVO.GeraEstatisticaSEMEventos : boolean;
var VarFields   : variant;
    dTotalAnteriorNivel1,
    dTotalConcedidoNivel1,
    dTotalCanceladoNivel1        : integer;
    iNivelGrupo1, iNivelGrupo2, iNivelGrupo3, iCtrl : integer;

    sSQLRegra, sLinha : String;
    bErroLocal : Boolean;
    iIdCalculo : Integer;

    sFlgInterno, sIdBenefInss, sIdSitPart   : String;

begin
   Result := False;

   frmAguarde.Mostra('Gerando Estatística para Assistidos em '+Copy(DataIni,4,2)+'/'+Copy(DataIni,7,4)+' ...');
   varFields := VarArrayCreate([0,1],varVariant);

   // Montar query com os benefícios do próprio participante
   // Grupos 11000, 12000, 31000, 32000
   qryAposentadorias.Close;
   qryAposentadorias.SQL.Clear;
   qryAposentadorias.SQL.Add(
         ' SELECT  '+
         '         BNF.CODBENEFSPC AS CODIGOSPC,                                                               '+
         '         NVL(SUM(CAN.BENEFCANCELADOS),0) AS TOTCANCELADO,                                            '+
         '         NVL(SUM(CON.BENEFCONCEDIDOS),0) AS TOTCONCEDIDO                                             '+
         ' FROM    BENEFICIO BNF,                                                                              '+
         '      (SELECT  BF.IDBENEFICIO, COUNT(DISTINCT BF.IDTITULAR)  AS BENEFCANCELADOS                      '+
         '       FROM    BENEFBFCIARIO BF                                                                      '+
         '       WHERE   BF.DATAFINAL     >= TO_DATE('''+DataIni+''',''DD/MM/YYYY'') AND                       '+
         '               BF.DATAFINAL     <= TO_DATE('''+DataFim+''',''DD/MM/YYYY'') AND                       '+
         '       (        (EXISTS (SELECT 1 FROM MOVBENEF M                                                    '+
         '                        WHERE  M.TIPOMOV        = 4                                                  '+
         '                        AND    M.DATAMOV        >= TO_DATE('''+DataIni+''',''DD/MM/YYYY'')           '+
         '                        AND    M.DATAMOV        <= TO_DATE('''+DataFim+''',''DD/MM/YYYY'')           '+
         '                        AND    M.IDPLANOPREV    = BF.IDPLANOPREV                                     '+
         '                        AND    M.IDBENEFICIO    = BF.IDBENEFICIO                                     '+
         '                        AND    M.NUMEROPROCESSO = BF.NUMEROPROCESSO                                  '+
         '                        AND    M.IDPESSJUR      = BF.IDPESSJUR                                       '+
         '                        AND    M.IDTITULAR      = BF.IDTITULAR                                       '+
         '                        AND    M.IDPLANOORIGEM  = BF.IDPLANOORIGEM                                   '+
         '                        AND    M.IDPESSOA       = BF.IDPESSOA                                        '+
         '                        AND    M.SEQPROPOSTA    = BF.SEQPROPOSTA )                                   '+
         '              )                                                                                      '+
         '       OR                                                                                            '+
         '              (  (EXISTS (SELECT 1 FROM HSTBENEFBFCIARIO H                                           '+
         '                        WHERE  H.MES            = '''+sAnoMesAnt+'''                                 '+
         '                        AND    H.IDPLANOPREV    = BF.IDPLANOPREV                                     '+
         '                        AND    H.IDBENEFICIO    = BF.IDBENEFICIO                                     '+
         '                        AND    H.NUMEROPROCESSO = BF.NUMEROPROCESSO                                  '+
         '                        AND    H.IDPESSJUR      = BF.IDPESSJUR                                       '+
         '                        AND    H.IDTITULAR      = BF.IDTITULAR                                       '+
         '                        AND    H.IDPLANOORIGEM  = BF.IDPLANOORIGEM                                   '+
         '                        AND    H.IDPESSOA       = BF.IDPESSOA                                        '+
         '                        AND    H.SEQPROPOSTA    = BF.SEQPROPOSTA ) ) AND                             '+
         '                 NOT ( EXISTS (SELECT 1 FROM HSTBENEFBFCIARIO H                                      '+
         '                        WHERE  H.MES            = '''+Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2)+'''    '+


         '                        AND    H.IDPESSJUR      = BF.IDPESSJUR                                       '+
         '                        AND    H.IDTITULAR      = BF.IDTITULAR                                       '+

         '                        AND    H.IDPESSOA       = BF.IDPESSOA                                        '+
         '                        AND    H.SEQPROPOSTA    = BF.SEQPROPOSTA ) )                                 '+
         '              )                                                                                      '+
         '       )                                                                                             '+
         '       GROUP BY BF.IDBENEFICIO ) CAN,                                                                '+


         '      (SELECT  COUNT(DISTINCT M.IDTITULAR) BENEFCONCEDIDOS , B.CODBENEFSPC, B.IDBENEFICIO '+
         '      FROM MOVBENEF M, BENEFICIO B, BENEFBFCIARIO BF '+
         '      WHERE M.IDLOTEMOV IN (SELECT IDLOTE FROM  CTRLINTERFACE '+
         '      WHERE FLGCONCESSAO = 1 AND '+
         '      MESREFERENCIA = '''+Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2)+''' ) '+
         '      AND M.TIPOMOV IN (0,1,7) '+

         '      AND M.IDMOVBENEF = (SELECT MAX(IDMOVBENEF) FROM MOVBENEF WHERE IDPESSJUR = M.IDPESSJUR AND IDPESSOA = M.IDPESSOA AND IDTITULAR = M.IDTITULAR AND IDBENEFICIO = M.IDBENEFICIO AND TIPOMOV  <> 13) '+

         '      AND B.IDBENEFICIO = M.IDBENEFICIO '+
         '      AND B.CODBENEFSPC IS NOT NULL '+
         '      AND BF.NUMEROPROCESSO = M.NUMEROPROCESSO '+
         '      AND BF.IDPESSJUR = M.IDPESSJUR '+
         '      AND BF.IDPESSOA = M.IDPESSOA '+
         '      AND BF.IDBENEFICIO = M.IDBENEFICIO '+
         '      AND BF.SEQPROPOSTA = M.SEQPROPOSTA '+
         '      AND NVL(BF.VALORATUAL,0) >0 '+

         '      AND NOT EXISTS (SELECT 1 FROM HSTBENEFBFCIARIO H '+
         '      WHERE H.IDPESSJUR = BF.IDPESSJUR AND '+
         '      H.IDPESSOA = BF.IDPESSOA AND '+
         '      H.IDTITULAR = BF.IDTITULAR AND '+
         '      H.MES  = '''+sAnoMesAnt+''' AND '+
         '      H.IDPLANOPREV <> BF.IDPLANOPREV) '+

         '      GROUP BY B.CODBENEFSPC, B.IDBENEFICIO) CON '+

         ' /* JOINS DE INTEGRIDADE RELACIONAL */                                                               '+
         ' WHERE (RTRIM(BNF.CODBENEFSPC) IS NOT NULL)   AND                                                    '+
         '       (NOT (RTRIM(BNF.CODBENEFSPC) IN (''41000'',''41100'',''41200'',''61000'',''61100'',''61200'',''21000'',''21100'',''21200'')) ) AND '+ 
         '       (BNF.IDBENEFICIO = CAN.IDBENEFICIO(+)) AND                                                    '+
         '       (BNF.IDBENEFICIO = CON.IDBENEFICIO(+)) AND                                                    '+
         '       (BNF.CODBENEFSPC = CON.CODBENEFSPC(+))  '+ 
         ' GROUP BY BNF.CODBENEFSPC                                                                            ');

   qryAposentadorias.Open;


   while not qryAposentadorias.EOF do
   begin
      if qryAposentadorias.FieldByName('CODIGOSPC').AsString = ''
      then begin
         qryAposentadorias.Next;
         continue;
      end;

      varFields[0] := Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2);
      varFields[1] := qryAposentadorias.FieldByName('CODIGOSPC').AsString;

      with qryEstatisticas do
      begin
         if not Locate('ANOMES; CODARVORE',varFields,[loCaseInsensitive])
         then begin
            qryAposentadorias.Next;
            continue;
         end;
         Edit;
         FieldByName('TOTCONCEDIDO').AsInteger := FieldByName('TOTCONCEDIDO').AsInteger + qryAposentadorias.FieldByName('TOTCONCEDIDO').AsInteger;
         FieldByName('TOTCANCELADO').AsInteger := FieldByName('TOTCANCELADO').AsInteger + qryAposentadorias.FieldByName('TOTCANCELADO').AsInteger;
         Post;
      end;

      qryAposentadorias.Next;
   end;

   frmAguarde.Mostra('Gerando Estatística para Pensionistas em '+Copy(DataIni,4,2)+'/'+Copy(DataIni,7,4)+' ...');


   //testar se o pensão é separado em dois benefícios, origem ativo e assistidom, como na Funcef
   //ou é apenas um benefício, que deve ser separado na hora da geração
   qryaux.close;
   qryaux.SQL.text := ' SELECT IDBENEFICIO FROM BENEFICIO WHERE CODBENEFSPC   = ''21000'' ';
   qryaux.open;

   if not qryaux.isempty then
   begin


      // Abrir query que traz os dados do grupo 21000 - Pensoes
      // O grupo 21000 é o total por titular e o grupo 91000 é o total de beneficiarios
      qryPensao.Close;
      qryPensao.SQL.Clear;
      qryPensao.SQL.Add(' SELECT NVL(SUM(DECODE(CONC.ERAAPOSENTADO,1,CONC.BENEFCONCEDIDOS,0)),0) AS TOTCONCEDIDOAPOSENTADO,   '+
                        '        NVL(SUM(DECODE(CONC.ERAAPOSENTADO,0,0,CONC.BENEFCONCEDIDOS)),0) AS TOTCONCEDIDOATIVO,        '+
                        '        NVL(SUM(DECODE(CANC.ERAAPOSENTADO,1,CANC.BENEFCANCELADOS,0)),0) AS TOTCANCELADOAPOSENTADO,   '+
                        '        NVL(SUM(DECODE(CANC.ERAAPOSENTADO,0,0,CANC.BENEFCANCELADOS)),0) AS TOTCANCELADOATIVO         '+
                        ' FROM CM.BENEFICIO BNF,                                                                              '+
                        ' /* BENEFICIOS CONCEDIDOS = DATA CONCESSAO ENTRE PARAMETROS DE INICIO E FIM */                       '+
                        ' (SELECT  PENSAO.IDBENEFICIO, DECODE(BANT.FLGBENEFTEMP, NULL, 0, 1) AS ERAAPOSENTADO,                '+
                        '         COUNT(DISTINCT PENSAO.IDTITULAR)  AS BENEFCONCEDIDOS                                        '+
                        ' FROM    BENEFBFCIARIO PENSAO, BENEFICIO B, HSTBENEFBFCIARIO HSTANT, BENEFICIO BANT , MOVBENEF M     '+

                        ' WHERE  '+

                        ' M.IDLOTEMOV IN (SELECT IDLOTE FROM  CTRLINTERFACE '+
                        '                 WHERE FLGCONCESSAO = 1 AND '+
                        '                 MESREFERENCIA = '''+Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2)+''' ) '+
                        ' AND     M.TIPOMOV IN (0,1,7) '+

                        ' AND     M.IDMOVBENEF = (SELECT MAX(IDMOVBENEF) FROM MOVBENEF WHERE IDPESSJUR = M.IDPESSJUR AND IDPESSOA = M.IDPESSOA AND IDTITULAR = M.IDTITULAR AND IDBENEFICIO = M.IDBENEFICIO AND TIPOMOV  <> 13) '+

                        ' AND     PENSAO.IDBENEFICIO = M.IDBENEFICIO '+
                        ' AND     PENSAO.IDTITULAR = M.IDTITULAR '+
                        ' AND     PENSAO.IDPESSOA = M.IDPESSOA '+
                        ' AND     PENSAO.NUMEROPROCESSO = M.NUMEROPROCESSO '+
                        ' AND     PENSAO.SEQPROPOSTA = M.SEQPROPOSTA '+
                        ' AND     NVL(PENSAO.VALORATUAL,0) > 0 '+

                        ' AND     B.IDBENEFICIO           = PENSAO.IDBENEFICIO                                                '+
                        ' AND     B.CODBENEFSPC           = ''21000''                                                         '+
                        ' AND     HSTANT.IDPESSJUR(+)     = PENSAO.IDPESSJUR                                                  '+
                        ' AND     HSTANT.IDPLANOPREV(+)   = PENSAO.IDPLANOPREV                                                '+
                        ' AND     HSTANT.IDTITULAR(+)     = PENSAO.IDTITULAR                                                  '+
                        ' AND     HSTANT.IDPESSOA(+)      = PENSAO.IDTITULAR                                                  '+
                        ' AND     HSTANT.MES(+)           = '''+sAnoMesAnt+'''                                                '+
                        ' AND     HSTANT.MESREFERENCIA(+) = '''+sAnoMesAnt+'''                                                '+
                        ' AND     BANT.IDBENEFICIO(+)     = HSTANT.IDBENEFICIO                                                '+
                        ' AND     BANT.FLGBENEFTEMP(+)    = 0                                                                 '+
                        ' GROUP BY PENSAO.IDBENEFICIO, BANT.FLGBENEFTEMP ) CONC,                                              '+
                        ' /* BENEFICIOS CANCELADOS = DATA DE FIM ENTRE PARAMETROS DE INICIO E FIM */                          '+
                        '      (SELECT  PENSAO.IDBENEFICIO, DECODE(BANT.FLGBENEFTEMP, NULL, 0, 1) AS ERAAPOSENTADO,           '+
                        '         COUNT(DISTINCT PENSAO.IDTITULAR)  AS BENEFCANCELADOS                                        '+
                        ' FROM    BENEFBFCIARIO PENSAO, BENEFICIO B, HSTBENEFBFCIARIO HSTANT, BENEFICIO BANT , MOVBENEF M     '+
                        ' WHERE  '+

                        ' M.IDLOTEMOV IN (SELECT IDLOTE FROM  CTRLINTERFACE '+
                        '                 WHERE FLGCONCESSAO = 1 AND '+
                        '                 MESREFERENCIA = '''+Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2)+''' ) '+
                        ' AND     M.TIPOMOV IN (0,1,7) '+

                        ' AND     M.IDMOVBENEF = (SELECT MAX(IDMOVBENEF) FROM MOVBENEF WHERE IDPESSJUR = M.IDPESSJUR AND IDPESSOA = M.IDPESSOA AND IDTITULAR = M.IDTITULAR AND IDBENEFICIO = M.IDBENEFICIO AND TIPOMOV  <> 13) '+
                                                
                        ' AND     PENSAO.IDBENEFICIO = M.IDBENEFICIO '+
                        ' AND     PENSAO.IDTITULAR = M.IDTITULAR '+
                        ' AND     PENSAO.IDPESSOA = M.IDPESSOA '+
                        ' AND     PENSAO.NUMEROPROCESSO = M.NUMEROPROCESSO '+
                        ' AND     PENSAO.SEQPROPOSTA = M.SEQPROPOSTA '+
                        ' AND     NVL(PENSAO.VALORATUAL,0) > 0 '+


                        ' AND     B.IDBENEFICIO           = PENSAO.IDBENEFICIO                                                '+
                        ' AND     B.CODBENEFSPC           = ''21000''                                                         '+
                        ' AND     HSTANT.IDPESSJUR(+)     = PENSAO.IDPESSJUR                                                  '+
                        ' AND     HSTANT.IDPLANOPREV(+)   = PENSAO.IDPLANOPREV                                                '+
                        ' AND     HSTANT.IDTITULAR(+)     = PENSAO.IDTITULAR                                                  '+
                        ' AND     HSTANT.IDPESSOA(+)      = PENSAO.IDTITULAR                                                  '+
                        ' AND     HSTANT.MES(+)           = '''+sAnoMesAnt+'''                                                '+
                        ' AND     HSTANT.MESREFERENCIA(+) = '''+sAnoMesAnt+'''                                                '+
                        ' AND     BANT.IDBENEFICIO(+)     = HSTANT.IDBENEFICIO                                                '+
                        ' AND     BANT.FLGBENEFTEMP(+)    = 0                                                                 '+
                        ' AND     (  (EXISTS (SELECT 1 FROM HSTBENEFBFCIARIO H                                                '+
                        '                      WHERE  H.MES            = '''+sAnoMesAnt+'''                                   '+
                        '                      AND    H.IDPLANOPREV    = PENSAO.IDPLANOPREV                                   '+
                        '                      AND    H.IDBENEFICIO    = PENSAO.IDBENEFICIO                                   '+
                        '                      AND    H.NUMEROPROCESSO = PENSAO.NUMEROPROCESSO                                '+
                        '                      AND    H.IDPESSJUR      = PENSAO.IDPESSJUR                                     '+
                        '                      AND    H.IDTITULAR      = PENSAO.IDTITULAR                                     '+
                        '                      AND    H.IDPLANOORIGEM  = PENSAO.IDPLANOORIGEM                                 '+
                        '                      AND    H.IDPESSOA       = PENSAO.IDPESSOA                                      '+
                        '                      AND    H.SEQPROPOSTA    = PENSAO.SEQPROPOSTA ) ) AND                           '+
                        '                 NOT ( EXISTS (SELECT 1 FROM HSTBENEFBFCIARIO H                                      '+
                        '                      WHERE  H.MES            =  '''+Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2)+'''     '+
                        '                      AND    H.IDPLANOPREV    = PENSAO.IDPLANOPREV                                   '+
                        '                      AND    H.IDBENEFICIO    = PENSAO.IDBENEFICIO                                   '+
                        '                      AND    H.NUMEROPROCESSO = PENSAO.NUMEROPROCESSO                                '+
                        '                      AND    H.IDPESSJUR      = PENSAO.IDPESSJUR                                     '+
                        '                      AND    H.IDTITULAR      = PENSAO.IDTITULAR                                     '+
                        '                      AND    H.IDPLANOORIGEM  = PENSAO.IDPLANOORIGEM                                 '+
                        '                      AND    H.IDPESSOA       = PENSAO.IDPESSOA                                      '+
                        '                      AND    H.SEQPROPOSTA    = PENSAO.SEQPROPOSTA ) )                               '+
                        '             )                                                                                       '+
                        ' GROUP BY PENSAO.IDBENEFICIO, BANT.FLGBENEFTEMP) CANC                                                '+
                        ' /* JOINS DE INTEGRIDADE RELACIONAL */                                                               '+
                        ' WHERE  (RTRIM(BNF.CODBENEFSPC)   = ''21000'')     AND                                               '+
                        '        (BNF.IDBENEFICIO   = CONC.IDBENEFICIO(+))  AND                                               '+
                        '        (BNF.IDBENEFICIO   = CANC.IDBENEFICIO(+))                                                    ');


      qryPensao.Open;
      qryPensao.First;

      // Esta query trará uma única linha, com os totais para ativos e os totais para aposentados
      varFields[0] := Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2);
      varFields[1] := '21100';

      with qryEstatisticas do
      begin
         if Locate('ANOMES; CODARVORE',varFields,[loCaseInsensitive])
         then begin
            Edit;
            FieldByName('TOTCONCEDIDO').AsInteger := FieldByName('TOTCONCEDIDO').AsInteger + qryPensao.FieldByName('TOTCONCEDIDOATIVO').AsInteger;
            FieldByName('TOTCANCELADO').AsInteger := FieldByName('TOTCANCELADO').AsInteger + qryPensao.FieldByName('TOTCANCELADOATIVO').AsInteger;
            Post;
         end;

         varFields[0] := Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2);
         varFields[1] := '21200';

         if Locate('ANOMES; CODARVORE',varFields,[loCaseInsensitive])
         then begin
            Edit;
            FieldByName('TOTCONCEDIDO').AsInteger := FieldByName('TOTCONCEDIDO').AsInteger + qryPensao.FieldByName('TOTCONCEDIDOAPOSENTADO').AsInteger;
            FieldByName('TOTCANCELADO').AsInteger := FieldByName('TOTCANCELADO').AsInteger + qryPensao.FieldByName('TOTCANCELADOAPOSENTADO').AsInteger;
            Post;
         end;
      end;
   end
   else
   begin

      qryPensao.Close;
      qryPensao.SQL.Clear;
      qryPensao.SQL.Add( ' SELECT                                                                '+
           '         BNF.CODBENEFSPC AS CODIGOSPC,                                                               '+
           '         NVL(SUM(CAN.BENEFCANCELADOS),0) AS TOTCANCELADO,                                            '+
           '         NVL(SUM(CON.BENEFCONCEDIDOS),0) AS TOTCONCEDIDO                                             '+
           ' FROM    BENEFICIO BNF,                                                                              '+
           '      (SELECT  BF.IDBENEFICIO, COUNT(DISTINCT BF.IDTITULAR)  AS BENEFCANCELADOS                      '+
           '       FROM    BENEFBFCIARIO BF                                                                      '+
           '       WHERE   BF.DATAFINAL     >= TO_DATE('''+DataIni+''',''DD/MM/YYYY'') AND                       '+
           '               BF.DATAFINAL     <= TO_DATE('''+DataFim+''',''DD/MM/YYYY'') AND                       '+
           '       (        (EXISTS (SELECT 1 FROM MOVBENEF M                                                    '+
           '                        WHERE  M.TIPOMOV        = 4                                                  '+
           '                        AND    M.DATAMOV        >= TO_DATE('''+DataIni+''',''DD/MM/YYYY'')           '+
           '                        AND    M.DATAMOV        <= TO_DATE('''+DataFim+''',''DD/MM/YYYY'')           '+
           '                        AND    M.IDPLANOPREV    = BF.IDPLANOPREV                                     '+
           '                        AND    M.IDBENEFICIO    = BF.IDBENEFICIO                                     '+
           '                        AND    M.NUMEROPROCESSO = BF.NUMEROPROCESSO                                  '+
           '                        AND    M.IDPESSJUR      = BF.IDPESSJUR                                       '+
           '                        AND    M.IDTITULAR      = BF.IDTITULAR                                       '+
           '                        AND    M.IDPLANOORIGEM  = BF.IDPLANOORIGEM                                   '+
           '                        AND    M.IDPESSOA       = BF.IDPESSOA                                        '+
           '                        AND    M.SEQPROPOSTA    = BF.SEQPROPOSTA )                                   '+
           '              )                                                                                      '+
           '       OR                                                                                            '+
           '              (  (EXISTS (SELECT 1 FROM HSTBENEFBFCIARIO H                                           '+
           '                        WHERE  H.MES            = '''+sAnoMesAnt+'''                                 '+
           '                        AND    H.IDPLANOPREV    = BF.IDPLANOPREV                                     '+
           '                        AND    H.IDBENEFICIO    = BF.IDBENEFICIO                                     '+
           '                        AND    H.NUMEROPROCESSO = BF.NUMEROPROCESSO                                  '+
           '                        AND    H.IDPESSJUR      = BF.IDPESSJUR                                       '+
           '                        AND    H.IDTITULAR      = BF.IDTITULAR                                       '+
           '                        AND    H.IDPLANOORIGEM  = BF.IDPLANOORIGEM                                   '+
           '                        AND    H.IDPESSOA       = BF.IDPESSOA                                        '+
           '                        AND    H.SEQPROPOSTA    = BF.SEQPROPOSTA ) ) AND                             '+
           '                 NOT ( EXISTS (SELECT 1 FROM HSTBENEFBFCIARIO H                                      '+
           '                        WHERE  H.MES            = '''+Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2)+'''    '+
           '                        AND    H.IDPLANOPREV    = BF.IDPLANOPREV                                     '+
           '                        AND    H.IDBENEFICIO    = BF.IDBENEFICIO                                     '+
           '                        AND    H.NUMEROPROCESSO = BF.NUMEROPROCESSO                                  '+
           '                        AND    H.IDPESSJUR      = BF.IDPESSJUR                                       '+
           '                        AND    H.IDTITULAR      = BF.IDTITULAR                                       '+
           '                        AND    H.IDPLANOORIGEM  = BF.IDPLANOORIGEM                                   '+
           '                        AND    H.IDPESSOA       = BF.IDPESSOA                                        '+
           '                        AND    H.SEQPROPOSTA    = BF.SEQPROPOSTA ) )                                 '+
           '              )                                                                                      '+
           '       )                                                                                             '+
           '       GROUP BY BF.IDBENEFICIO ) CAN,                                                                '+


           '      (SELECT  COUNT(DISTINCT M.IDTITULAR) BENEFCONCEDIDOS , B.CODBENEFSPC, B.IDBENEFICIO '+
           '      FROM MOVBENEF M, BENEFICIO B, BENEFBFCIARIO BF '+
           '      WHERE M.IDLOTEMOV IN (SELECT IDLOTE FROM  CTRLINTERFACE '+
           '      WHERE FLGCONCESSAO = 1 AND '+
           '      MESREFERENCIA = '''+Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2)+''' ) '+
           '      AND M.TIPOMOV IN (0,1,7) '+

           '      AND M.IDMOVBENEF = (SELECT MAX(IDMOVBENEF) FROM MOVBENEF WHERE IDPESSJUR = M.IDPESSJUR AND IDPESSOA = M.IDPESSOA AND IDTITULAR = M.IDTITULAR AND IDBENEFICIO = M.IDBENEFICIO AND TIPOMOV  <> 13) '+

           '      AND B.IDBENEFICIO = M.IDBENEFICIO '+
           '      AND B.CODBENEFSPC IS NOT NULL '+
           '      AND BF.NUMEROPROCESSO = M.NUMEROPROCESSO '+
           '      AND BF.IDPESSJUR = M.IDPESSJUR '+
           '      AND BF.IDPESSOA = M.IDPESSOA '+
           '      AND BF.IDBENEFICIO = M.IDBENEFICIO '+
           '      AND BF.SEQPROPOSTA = M.SEQPROPOSTA '+
           '      AND BF.VALORATUAL >0 '+
           '      GROUP BY B.CODBENEFSPC, B.IDBENEFICIO) CON '+


           ' /* JOINS DE INTEGRIDADE RELACIONAL */                                                               '+
           ' WHERE (RTRIM(BNF.CODBENEFSPC) IS NOT NULL)   AND                                                    '+
           '       ( (RTRIM(BNF.CODBENEFSPC) IN (''21100'',''21200'')) ) AND '+
           '       (BNF.IDBENEFICIO = CAN.IDBENEFICIO(+)) AND                                                    '+
           '       (BNF.IDBENEFICIO = CON.IDBENEFICIO(+)) AND                                                    '+
           '       (BNF.CODBENEFSPC = CON.CODBENEFSPC(+))  '+ 
           ' GROUP BY BNF.CODBENEFSPC                                                                            ');
      qryPensao.Open;

      while not qryPensao.EOF do
      begin
         if qryPensao.FieldByName('CODIGOSPC').AsString = ''
         then begin
            qryPensao.Next;
            continue;
         end;

         varFields[0] := Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2);
         varFields[1] := qryPensao.FieldByName('CODIGOSPC').AsString;

         with qryEstatisticas do
         begin
            if not Locate('ANOMES; CODARVORE',varFields,[loCaseInsensitive])
            then begin
               qryPensao.Next;
               continue;
            end;
            Edit;
            FieldByName('TOTCONCEDIDO').AsInteger := FieldByName('TOTCONCEDIDO').AsInteger + qryPensao.FieldByName('TOTCONCEDIDO').AsInteger;
            FieldByName('TOTCANCELADO').AsInteger := FieldByName('TOTCANCELADO').AsInteger + qryPensao.FieldByName('TOTCANCELADO').AsInteger;
            Post;
         end;

         qryPensao.Next;
      end;

   end;





   frmAguarde.Mostra('Gerando Estatística para Pecúlio em '+Copy(DataIni,4,2)+'/'+Copy(DataIni,7,4)+' ...');


   //testar se o pecúlio é separado em dois benefícios, origem ativo e assistidom, como na Funcef
   //ou é apenas um benefício, que deve ser separado na hora da geração
   qryaux.close;
   qryaux.SQL.text := ' SELECT IDBENEFICIO FROM BENEFICIO WHERE CODBENEFSPC   = ''41000'' ';
   qryaux.open;


   if not qryaux.isempty then
   begin
      // Abrir query que traz os dados do grupo 41000 - Peculio
      qryPensao.Close;
      qryPensao.SQL.Clear;
      qryPensao.SQL.Add(' SELECT NVL(SUM(DECODE(CONC.ERAAPOSENTADO,1,CONC.BENEFCONCEDIDOS,0)),0) AS TOTCONCEDIDOAPOSENTADO,   '+
                        '        NVL(SUM(DECODE(CONC.ERAAPOSENTADO,0,0,CONC.BENEFCONCEDIDOS)),0) AS TOTCONCEDIDOATIVO,        '+
                        '        NVL(SUM(DECODE(CANC.ERAAPOSENTADO,1,CANC.BENEFCANCELADOS,0)),0) AS TOTCANCELADOAPOSENTADO,   '+
                        '        NVL(SUM(DECODE(CANC.ERAAPOSENTADO,0,0,CANC.BENEFCANCELADOS)),0) AS TOTCANCELADOATIVO         '+
                        ' FROM CM.BENEFICIO BNF,                                                                              '+
                        ' /* BENEFICIOS CONCEDIDOS = DATA CONCESSAO ENTRE PARAMETROS DE INICIO E FIM */                       '+
                        ' (SELECT  PENSAO.IDBENEFICIO, DECODE(BANT.FLGBENEFTEMP, NULL, 0, 1) AS ERAAPOSENTADO,                '+
                        '         COUNT(DISTINCT PENSAO.IDTITULAR)  AS BENEFCONCEDIDOS                                        '+
                        ' FROM    BENEFBFCIARIO PENSAO, BENEFICIO B, HSTBENEFBFCIARIO HSTANT, BENEFICIO BANT, MOVBENEF M      '+
                        ' WHERE   '+


                        ' M.IDLOTEMOV IN (SELECT IDLOTE FROM  CTRLINTERFACE '+
                        '                 WHERE FLGCONCESSAO = 1 AND '+
                        '                 MESREFERENCIA = '''+Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2)+''' ) '+
                        ' AND     M.TIPOMOV IN (0,1,7) '+

                        ' AND     M.IDMOVBENEF = (SELECT MAX(IDMOVBENEF) FROM MOVBENEF WHERE IDPESSJUR = M.IDPESSJUR AND IDPESSOA = M.IDPESSOA AND IDTITULAR = M.IDTITULAR AND IDBENEFICIO = M.IDBENEFICIO AND TIPOMOV  <> 13) '+

                        ' AND     PENSAO.IDBENEFICIO = M.IDBENEFICIO '+
                        ' AND     PENSAO.IDTITULAR = M.IDTITULAR '+
                        ' AND     PENSAO.IDPESSOA = M.IDPESSOA '+
                        ' AND     PENSAO.NUMEROPROCESSO = M.NUMEROPROCESSO '+
                        ' AND     PENSAO.SEQPROPOSTA = M.SEQPROPOSTA '+
                        ' AND     NVL(PENSAO.VALORATUAL,0) > 0 '+

                        ' AND     B.IDBENEFICIO           = PENSAO.IDBENEFICIO                                                '+
                        ' AND     B.CODBENEFSPC           = ''41000''                                                         '+
                        ' AND     HSTANT.IDPESSJUR(+)     = PENSAO.IDPESSJUR                                                  '+
                        ' AND     HSTANT.IDPLANOPREV(+)   = PENSAO.IDPLANOPREV                                                '+
                        ' AND     HSTANT.IDTITULAR(+)     = PENSAO.IDTITULAR                                                  '+
                        ' AND     HSTANT.IDPESSOA(+)      = PENSAO.IDTITULAR                                                  '+
                        ' AND     HSTANT.MES(+)           = '''+sAnoMesAnt+'''                                                '+
                        ' AND     HSTANT.MESREFERENCIA(+) = '''+sAnoMesAnt+'''                                                '+
                        ' AND     BANT.IDBENEFICIO(+)     = HSTANT.IDBENEFICIO                                                '+
                        ' AND     BANT.FLGBENEFTEMP(+)    = 0                                                                 '+
                        ' GROUP BY PENSAO.IDBENEFICIO, BANT.FLGBENEFTEMP ) CONC,                                              '+
                        ' /* BENEFICIOS CANCELADOS = DATA DE FIM ENTRE PARAMETROS DE INICIO E FIM */                          '+
                        '      (SELECT  PENSAO.IDBENEFICIO, DECODE(BANT.FLGBENEFTEMP, NULL, 0, 1) AS ERAAPOSENTADO,           '+
                        '         COUNT(DISTINCT PENSAO.IDTITULAR)  AS BENEFCANCELADOS                                        '+
                        ' FROM    BENEFBFCIARIO PENSAO, BENEFICIO B, HSTBENEFBFCIARIO HSTANT, BENEFICIO BANT ,  MOVBENEF M    '+
                        ' WHERE   '+

                        ' M.IDLOTEMOV IN (SELECT IDLOTE FROM  CTRLINTERFACE '+
                        '                 WHERE FLGCONCESSAO = 1 AND '+
                        '                 MESREFERENCIA = '''+Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2)+''' ) '+
                        ' AND     M.TIPOMOV IN (0,1,7) '+

                        ' AND     M.IDMOVBENEF = (SELECT MAX(IDMOVBENEF) FROM MOVBENEF WHERE IDPESSJUR = M.IDPESSJUR AND IDPESSOA = M.IDPESSOA AND IDTITULAR = M.IDTITULAR AND IDBENEFICIO = M.IDBENEFICIO AND TIPOMOV  <> 13) '+

                        ' AND     PENSAO.IDBENEFICIO = M.IDBENEFICIO '+
                        ' AND     PENSAO.IDTITULAR = M.IDTITULAR '+
                        ' AND     PENSAO.IDPESSOA = M.IDPESSOA '+
                        ' AND     PENSAO.NUMEROPROCESSO = M.NUMEROPROCESSO '+
                        ' AND     PENSAO.SEQPROPOSTA = M.SEQPROPOSTA '+
                        ' AND     NVL(PENSAO.VALORATUAL,0) > 0 '+


                        ' AND     B.IDBENEFICIO           = PENSAO.IDBENEFICIO                                                '+
                        ' AND     B.CODBENEFSPC           = ''41000''                                                         '+
                        ' AND     HSTANT.IDPESSJUR(+)     = PENSAO.IDPESSJUR                                                  '+
                        ' AND     HSTANT.IDPLANOPREV(+)   = PENSAO.IDPLANOPREV                                                '+
                        ' AND     HSTANT.IDTITULAR(+)     = PENSAO.IDTITULAR                                                  '+
                        ' AND     HSTANT.IDPESSOA(+)      = PENSAO.IDTITULAR                                                  '+
                        ' AND     HSTANT.MES(+)           = '''+sAnoMesAnt+'''                                                '+
                        ' AND     HSTANT.MESREFERENCIA(+) = '''+sAnoMesAnt+'''                                                '+
                        ' AND     BANT.IDBENEFICIO(+)     = HSTANT.IDBENEFICIO                                                '+
                        ' AND     BANT.FLGBENEFTEMP(+)    = 0                                                                 '+
                        ' AND     (  (EXISTS (SELECT 1 FROM HSTBENEFBFCIARIO H                                                '+
                        '                      WHERE  H.MES            = '''+sAnoMesAnt+'''                                   '+
                        '                      AND    H.IDPLANOPREV    = PENSAO.IDPLANOPREV                                   '+
                        '                      AND    H.IDBENEFICIO    = PENSAO.IDBENEFICIO                                   '+
                        '                      AND    H.NUMEROPROCESSO = PENSAO.NUMEROPROCESSO                                '+
                        '                      AND    H.IDPESSJUR      = PENSAO.IDPESSJUR                                     '+
                        '                      AND    H.IDTITULAR      = PENSAO.IDTITULAR                                     '+
                        '                      AND    H.IDPLANOORIGEM  = PENSAO.IDPLANOORIGEM                                 '+
                        '                      AND    H.IDPESSOA       = PENSAO.IDPESSOA                                      '+
                        '                      AND    H.SEQPROPOSTA    = PENSAO.SEQPROPOSTA ) ) AND                           '+
                        '                 NOT ( EXISTS (SELECT 1 FROM HSTBENEFBFCIARIO H                                      '+
                        '                      WHERE  H.MES            =  '''+Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2)+'''     '+
                        '                      AND    H.IDPLANOPREV    = PENSAO.IDPLANOPREV                                   '+
                        '                      AND    H.IDBENEFICIO    = PENSAO.IDBENEFICIO                                   '+
                        '                      AND    H.NUMEROPROCESSO = PENSAO.NUMEROPROCESSO                                '+
                        '                      AND    H.IDPESSJUR      = PENSAO.IDPESSJUR                                     '+
                        '                      AND    H.IDTITULAR      = PENSAO.IDTITULAR                                     '+
                        '                      AND    H.IDPLANOORIGEM  = PENSAO.IDPLANOORIGEM                                 '+
                        '                      AND    H.IDPESSOA       = PENSAO.IDPESSOA                                      '+
                        '                      AND    H.SEQPROPOSTA    = PENSAO.SEQPROPOSTA ) )                               '+
                        '             )                                                                                       '+
                        ' GROUP BY PENSAO.IDBENEFICIO, BANT.FLGBENEFTEMP) CANC                                                '+
                        ' /* JOINS DE INTEGRIDADE RELACIONAL */                                                               '+
                        ' WHERE  (RTRIM(BNF.CODBENEFSPC)   = ''41000'')     AND                                               '+
                        '        (BNF.IDBENEFICIO   = CONC.IDBENEFICIO(+))  AND                                               '+
                        '        (BNF.IDBENEFICIO   = CANC.IDBENEFICIO(+))                                                    ');
      qryPensao.Open;


      // Esta query trará uma única linha, com os totais para ativos e os totais para aposentados
      varFields[0] := Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2);
      varFields[1] := '41100';

      with qryEstatisticas do
      begin
         if Locate('ANOMES; CODARVORE',varFields,[loCaseInsensitive])
         then begin
            Edit;
            FieldByName('TOTCONCEDIDO').AsInteger := FieldByName('TOTCONCEDIDO').AsInteger + qryPensao.FieldByName('TOTCONCEDIDOATIVO').AsInteger;
            FieldByName('TOTCANCELADO').AsInteger := 0;
            Post;
         end;

         varFields[0] := Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2);
         varFields[1] := '41200';

         if Locate('ANOMES; CODARVORE',varFields,[loCaseInsensitive])
         then begin
            Edit;
            FieldByName('TOTCONCEDIDO').AsInteger := FieldByName('TOTCONCEDIDO').AsInteger + qryPensao.FieldByName('TOTCONCEDIDOAPOSENTADO').AsInteger;
            FieldByName('TOTCANCELADO').AsInteger := 0;
            Post;
         end;
      end;
   end
   else
   begin

      qryPensao.Close;
      qryPensao.SQL.Clear;
      qryPensao.SQL.Add( ' SELECT                                                                '+
           '         BNF.CODBENEFSPC AS CODIGOSPC,                                                               '+
           '         NVL(SUM(CAN.BENEFCANCELADOS),0) AS TOTCANCELADO,                                            '+
           '         NVL(SUM(CON.BENEFCONCEDIDOS),0) AS TOTCONCEDIDO                                             '+
           ' FROM    BENEFICIO BNF,                                                                              '+
           '      (SELECT  BF.IDBENEFICIO, COUNT(DISTINCT BF.IDTITULAR)  AS BENEFCANCELADOS                      '+
           '       FROM    BENEFBFCIARIO BF                                                                      '+
           '       WHERE   BF.DATAFINAL     >= TO_DATE('''+DataIni+''',''DD/MM/YYYY'') AND                       '+
           '               BF.DATAFINAL     <= TO_DATE('''+DataFim+''',''DD/MM/YYYY'') AND                       '+
           '       (        (EXISTS (SELECT 1 FROM MOVBENEF M                                                    '+
           '                        WHERE  M.TIPOMOV        = 4                                                  '+
           '                        AND    M.DATAMOV        >= TO_DATE('''+DataIni+''',''DD/MM/YYYY'')           '+
           '                        AND    M.DATAMOV        <= TO_DATE('''+DataFim+''',''DD/MM/YYYY'')           '+
           '                        AND    M.IDPLANOPREV    = BF.IDPLANOPREV                                     '+
           '                        AND    M.IDBENEFICIO    = BF.IDBENEFICIO                                     '+
           '                        AND    M.NUMEROPROCESSO = BF.NUMEROPROCESSO                                  '+
           '                        AND    M.IDPESSJUR      = BF.IDPESSJUR                                       '+
           '                        AND    M.IDTITULAR      = BF.IDTITULAR                                       '+
           '                        AND    M.IDPLANOORIGEM  = BF.IDPLANOORIGEM                                   '+
           '                        AND    M.IDPESSOA       = BF.IDPESSOA                                        '+
           '                        AND    M.SEQPROPOSTA    = BF.SEQPROPOSTA )                                   '+
           '              )                                                                                      '+
           '       OR                                                                                            '+
           '              (  (EXISTS (SELECT 1 FROM HSTBENEFBFCIARIO H                                           '+
           '                        WHERE  H.MES            = '''+sAnoMesAnt+'''                                 '+
           '                        AND    H.IDPLANOPREV    = BF.IDPLANOPREV                                     '+
           '                        AND    H.IDBENEFICIO    = BF.IDBENEFICIO                                     '+
           '                        AND    H.NUMEROPROCESSO = BF.NUMEROPROCESSO                                  '+
           '                        AND    H.IDPESSJUR      = BF.IDPESSJUR                                       '+
           '                        AND    H.IDTITULAR      = BF.IDTITULAR                                       '+
           '                        AND    H.IDPLANOORIGEM  = BF.IDPLANOORIGEM                                   '+
           '                        AND    H.IDPESSOA       = BF.IDPESSOA                                        '+
           '                        AND    H.SEQPROPOSTA    = BF.SEQPROPOSTA ) ) AND                             '+
           '                 NOT ( EXISTS (SELECT 1 FROM HSTBENEFBFCIARIO H                                      '+
           '                        WHERE  H.MES            = '''+Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2)+'''    '+

           '                        AND    H.IDPESSJUR      = BF.IDPESSJUR                                       '+
           '                        AND    H.IDTITULAR      = BF.IDTITULAR                                       '+

           '                        AND    H.IDPESSOA       = BF.IDPESSOA                                        '+
           '                        AND    H.SEQPROPOSTA    = BF.SEQPROPOSTA ) )                                 '+
           '              )                                                                                      '+
           '       )                                                                                             '+
           '       GROUP BY BF.IDBENEFICIO ) CAN,                                                                '+
           '      (SELECT  COUNT(DISTINCT M.IDTITULAR) BENEFCONCEDIDOS , B.CODBENEFSPC, B.IDBENEFICIO '+
           '      FROM MOVBENEF M, BENEFICIO B, BENEFBFCIARIO BF '+
           '      WHERE M.IDLOTEMOV IN (SELECT IDLOTE FROM  CTRLINTERFACE '+
           '      WHERE FLGCONCESSAO = 1 AND '+
           '      MESREFERENCIA = '''+Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2)+''' ) '+
           '      AND M.TIPOMOV IN (0,1,7) '+

           '      AND M.IDMOVBENEF = (SELECT MAX(IDMOVBENEF) FROM MOVBENEF WHERE IDPESSJUR = M.IDPESSJUR AND IDPESSOA = M.IDPESSOA AND IDTITULAR = M.IDTITULAR AND IDBENEFICIO = M.IDBENEFICIO AND TIPOMOV  <> 13) '+

           '      AND B.IDBENEFICIO = M.IDBENEFICIO '+
           '      AND B.CODBENEFSPC IS NOT NULL '+
           '      AND BF.NUMEROPROCESSO = M.NUMEROPROCESSO '+
           '      AND BF.IDPESSJUR = M.IDPESSJUR '+
           '      AND BF.IDPESSOA = M.IDPESSOA '+
           '      AND BF.IDBENEFICIO = M.IDBENEFICIO '+
           '      AND BF.SEQPROPOSTA = M.SEQPROPOSTA '+

           '      AND NOT EXISTS (SELECT 1 FROM HSTBENEFBFCIARIO H '+
           '      WHERE H.IDPESSJUR = BF.IDPESSJUR AND '+
           '      H.IDPESSOA = BF.IDPESSOA AND '+
           '      H.IDTITULAR = BF.IDTITULAR AND '+
           '      H.MES  = '''+sAnoMesAnt+''' AND '+
           '      H.IDPLANOPREV <> BF.IDPLANOPREV) '+

           '      AND NVL(BF.VALORATUAL,0) >0 '+
           '      GROUP BY B.CODBENEFSPC, B.IDBENEFICIO) CON '+

           ' /* JOINS DE INTEGRIDADE RELACIONAL */                                                               '+
           ' WHERE (RTRIM(BNF.CODBENEFSPC) IS NOT NULL)   AND                                                    '+
           '       ( (RTRIM(BNF.CODBENEFSPC) IN (''41100'',''41200'')) ) AND '+
           '       (BNF.IDBENEFICIO = CAN.IDBENEFICIO(+)) AND                                                    '+
           '       (BNF.IDBENEFICIO = CON.IDBENEFICIO(+)) AND                                                    '+
           '       (BNF.CODBENEFSPC = CON.CODBENEFSPC(+))  '+ 
           ' GROUP BY BNF.CODBENEFSPC                                                                            ');
      qryPensao.Open;

      while not qryPensao.EOF do
      begin
         if qryPensao.FieldByName('CODIGOSPC').AsString = ''
         then begin
            qryPensao.Next;
            continue;
         end;

         varFields[0] := Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2);
         varFields[1] := qryPensao.FieldByName('CODIGOSPC').AsString;

         with qryEstatisticas do
         begin
            if not Locate('ANOMES; CODARVORE',varFields,[loCaseInsensitive])
            then begin
               qryPensao.Next;
               continue;
            end;
            Edit;
            FieldByName('TOTCONCEDIDO').AsInteger := FieldByName('TOTCONCEDIDO').AsInteger + qryPensao.FieldByName('TOTCONCEDIDO').AsInteger;
            FieldByName('TOTCANCELADO').AsInteger := FieldByName('TOTCANCELADO').AsInteger + qryPensao.FieldByName('TOTCANCELADO').AsInteger;
            Post;
         end;

         qryPensao.Next;
      end;


   end;


   frmAguarde.Mostra('Gerando Estatística para Resgates em '+Copy(DataIni,4,2)+'/'+Copy(DataIni,7,4)+' ...');
   // Abrir query que traz os dados do grupo 61000 - Reservas
   qryReserva.Close;
   qryReserva.SQL.Clear;
   qryReserva.SQL.Add(' SELECT BNF.CODBENEFSPC AS CODIGOSPC,                                                    '+
                      '         NVL(SUM(CON.BENEFMANTIDOS),0) AS TOTMANTIDOS,                                   '+
                      '         NVL(SUM(CON.BENEFATIVOS),0)   AS TOTATIVOS                                      '+
                      ' FROM CM.BENEFICIO BNF,                                                                  '+
                      '   (SELECT  BF.IDBENEFICIO,                                                              '+
                      '            SUM(DECODE(SITUACAO.FLGSITFUNDACAO, ''MA'', 1, 0))  AS BENEFMANTIDOS,        '+
                      '            SUM(DECODE(SITUACAO.FLGSITFUNDACAO, ''MA'', 0, 1))  AS BENEFATIVOS           '+
                      '    FROM    BENEFBFCIARIO BF,                                                            '+
                      '            ( SELECT H.IDPESSOA, H.FLGSITFUNDACAO                                        '+
                      '              FROM   HSTCONTRIBPREV H,                                                   '+
                      '                     ( SELECT H.IDPESSOA, MAX(H.MESREFERENCIA) MAIORMES                  '+
                      '                       FROM   HSTCONTRIBPREV H, BENEFBFCIARIO BF, BENEFICIO B , MOVBENEF M       '+
                      '                       WHERE  B.CODBENEFSPC    = ''61000''                               '+
                      '                       AND    BF.IDBENEFICIO   = B.IDBENEFICIO                           '+

                      '                       AND M.IDLOTEMOV IN (SELECT IDLOTE FROM  CTRLINTERFACE '+
                      '                                       WHERE FLGCONCESSAO = 1 AND '+
                      '                                       MESREFERENCIA = '''+Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2)+''' ) '+
                      '                       AND     M.TIPOMOV IN (0,1,7) '+

                      '                       AND     M.IDMOVBENEF = (SELECT MAX(IDMOVBENEF) FROM MOVBENEF WHERE IDPESSJUR = M.IDPESSJUR AND IDPESSOA = M.IDPESSOA AND IDTITULAR = M.IDTITULAR AND IDBENEFICIO = M.IDBENEFICIO AND TIPOMOV  <> 13) '+
                                            
                      '                       AND     BF.IDBENEFICIO = M.IDBENEFICIO '+
                      '                       AND     BF.IDTITULAR = M.IDTITULAR '+
                      '                       AND     BF.IDPESSOA = M.IDPESSOA '+
                      '                       AND     BF.NUMEROPROCESSO = M.NUMEROPROCESSO '+
                      '                       AND     BF.SEQPROPOSTA = M.SEQPROPOSTA '+
                      '                       AND     NVL(BF.VALORATUAL,0) > 0  '+
                      
                      '                       AND    H.IDPESSJUR      = BF.IDPESSJUR                            '+
                      '                       AND    H.IDPLANOPREV    = BF.IDPLANOPREV                          '+
                      '                       AND    H.IDPESSOA       = BF.IDPESSOA                             '+
                      '                       AND    H.SEQPROPOSTA    = BF.SEQPROPOSTA                          '+
                      '                       GROUP BY H.IDPESSOA ) MAXMES                                      '+
                      '              WHERE H.MESREFERENCIA = MAXMES.MAIORMES                                    '+
                      '              AND   H.IDPESSOA      = MAXMES.IDPESSOA                                    '+
                      '              ) SITUACAO , MOVBENEF M                                                    '+
                      '    WHERE                                                                                '+

                      '          M.IDLOTEMOV IN (SELECT IDLOTE FROM  CTRLINTERFACE '+
                      '                              WHERE FLGCONCESSAO = 1 AND '+
                      '                              MESREFERENCIA = '''+Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2)+''' ) '+
                      '          AND     M.TIPOMOV IN (0,1,7) '+

                      '          AND     M.IDMOVBENEF = (SELECT MAX(IDMOVBENEF) FROM MOVBENEF WHERE IDPESSJUR = M.IDPESSJUR AND IDPESSOA = M.IDPESSOA AND IDTITULAR = M.IDTITULAR AND IDBENEFICIO = M.IDBENEFICIO AND TIPOMOV  <> 13) '+
                                            
                      '          AND     BF.IDBENEFICIO = M.IDBENEFICIO '+
                      '          AND     BF.IDTITULAR = M.IDTITULAR '+
                      '          AND     BF.IDPESSOA = M.IDPESSOA '+
                      '          AND     BF.NUMEROPROCESSO = M.NUMEROPROCESSO '+
                      '          AND     BF.SEQPROPOSTA = M.SEQPROPOSTA '+
                      '          AND     NVL(BF.VALORATUAL,0) > 0 '+


                      '          AND SITUACAO.IDPESSOA(+) = BF.IDPESSOA                                             '+
                      '    GROUP BY BF.IDBENEFICIO ) CON                                                         '+
                      ' /* JOINS DE INTEGRIDADE RELACIONAL */                                                   '+
                      ' WHERE                                                                                   '+
                      '     (RTRIM(BNF.CODBENEFSPC) IS NOT NULL)   AND                                          '+
                      '     (BNF.CODBENEFSPC = ''61000'')       AND                                             '+
                      '     (BNF.IDBENEFICIO = CON.IDBENEFICIO(+))                                              '+
                      ' GROUP BY BNF.CODBENEFSPC                                                                ');
   qryReserva.Open;

   varFields[0] := Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2);
   varFields[1] := '61100';

   with qryEstatisticas do
   begin
      if Locate('ANOMES; CODARVORE',varFields,[loCaseInsensitive])
      then begin
         Edit;
         FieldByName('TOTCONCEDIDO').AsInteger := FieldByName('TOTCONCEDIDO').AsInteger + qryReserva.FieldByName('TOTATIVOS').AsInteger;
         FieldByName('TOTCANCELADO').AsInteger := 0; // pagamento unico não tem cancelado
         Post;
      end;
   end;

   varFields[0] := Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2);
   varFields[1] := '62100';

   with qryEstatisticas do
   begin
      if Locate('ANOMES; CODARVORE',varFields,[loCaseInsensitive])
      then begin
         Edit;
         FieldByName('TOTCONCEDIDO').AsInteger := FieldByName('TOTCONCEDIDO').AsInteger + qryReserva.FieldByName('TOTMANTIDOS').AsInteger;
         FieldByName('TOTCANCELADO').AsInteger := 0; // pagamento unico não tem cancelado
         Post;
      end;
   end;

   frmAguarde.Mostra('Gerando Estatística para População de Ativos em '+Copy(DataIni,4,2)+'/'+Copy(DataIni,7,4)+' ...');
   // Abrir query que traz os dados do grupo 81100 - Participantes Ativos
   qryAtivosSemEventos.Close;
   qryAtivosSemEventos.ParamByName('ANOMESATUAL').AsString := Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2);
   qryAtivosSemEventos.Open;

   varFields[0] := Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2);
   varFields[1] := '81100';

   with qryEstatisticas do
   begin
      if Locate('ANOMES; CODARVORE',varFields,[loCaseInsensitive])
      then begin
         Edit;
         FieldByName('TOTCONCEDIDO').AsInteger := FieldByName('TOTCONCEDIDO').AsInteger + qryAtivosSemEventos.FieldByName('TOTCONCEDIDO').AsInteger;
         FieldByName('TOTCANCELADO').AsInteger := FieldByName('TOTCANCELADO').AsInteger + qryAtivosSemEventos.FieldByName('TOTCANCELADO').AsInteger;
         Post;
      end;
   end;

   // Abrir query que traz os dados do grupo 81200 - Participantes Autopatrocinados
   frmAguarde.Mostra('Gerando Estatística para População de Mantidos em '+Copy(DataIni,4,2)+'/'+Copy(DataIni,7,4)+' ...');
   qryMantidosSemEventos.Close;
   qryMantidosSemEventos.ParamByName('ANOMESATUAL').AsString := Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2);
   qryMantidosSemEventos.Open;

   varFields[0] := Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2);
   varFields[1] := '81200';

   with qryEstatisticas do
   begin
      if Locate('ANOMES; CODARVORE',varFields,[loCaseInsensitive])
      then begin
         Edit;
         FieldByName('TOTCONCEDIDO').AsInteger := FieldByName('TOTCONCEDIDO').AsInteger + qryMantidosSemEventos.FieldByName('TOTCONCEDIDO').AsInteger;
         FieldByName('TOTCANCELADO').AsInteger := FieldByName('TOTCANCELADO').AsInteger + qryMantidosSemEventos.FieldByName('TOTCANCELADO').AsInteger;
         Post;
      end;
   end;

   // Abrir query que traz os dados do grupo 81300 - Participantes Benefício Diferido

   // Grupo 81300 - FALTANDO - PARTICIPANTE COM BENEFICIO PROPORCIONAL

   // Grupo 81400 - FALTANDO - ATIVOS EM PROCESSO DE APOSENTADORIA

   // Grupo 81500 - FALTANDO - PARTICIPANTE NO PRAZO DE OPCAO


   dTotalConcedidoNivel1 := 0;
   dTotalCanceladoNivel1 := 0;

   // Grupo 84000
   frmAguarde.Mostra('Gerando Estatística para População de Designados em '+Copy(DataIni,4,2)+'/'+Copy(DataIni,7,4)+' ...');
   qryDesignados.Close;
   qryDesignados.ParamByName('ANOMESATUAL').AsString := Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2);
   qryDesignados.ParamByName('ANOMESANT').AsString := sAnoMesAnt;
   qryDesignados.Open;

   varFields[0] := Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2);
   varFields[1] := '84100';
   with qryEstatisticas do
   begin
      if Locate('ANOMES; CODARVORE',varFields,[loCaseInsensitive])
      then begin
         Edit;
         FieldByName('TOTCONCEDIDO').AsInteger := qryDesignados.FieldByName('TOTCONCEDIDO').AsInteger + FieldByName('TOTCONCEDIDO').AsInteger;
         if qryDesignados.FieldByName('TOTCANCELADO').AsInteger > 0
         then FieldByName('TOTCANCELADO').AsInteger := qryDesignados.FieldByName('TOTCANCELADO').AsInteger + FieldByName('TOTCANCELADO').AsInteger;
         Post;
      end;
   end;

   qryDesignadosAS.Close;
   qryDesignadosAS.ParamByName('ANOMESATUAL').AsString := Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2);
   qryDesignadosAS.Open;

   varFields[0] := Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2);
   varFields[1] := '84200';
   with qryEstatisticas do
   begin
      if Locate('ANOMES; CODARVORE',varFields,[loCaseInsensitive])
      then begin
         Edit;
         FieldByName('TOTCONCEDIDO').AsInteger := qryDesignadosAS.FieldByName('TOTCONCEDIDO').AsInteger + FieldByName('TOTCONCEDIDO').AsInteger;
         if qryDesignadosAS.FieldByName('TOTCANCELADO').AsInteger > 0
         then FieldByName('TOTCANCELADO').AsInteger := qryDesignadosAS.FieldByName('TOTCANCELADO').AsInteger + FieldByName('TOTCANCELADO').AsInteger;
         Post;
      end;
   end;

   // Grupo 91000
   frmAguarde.Mostra('Gerando Estatística para Pensionistas em '+Copy(DataIni,4,2)+'/'+Copy(DataIni,7,4)+' ...');



   // Abrir query que traz os dados do grupo 91000 - Beneficiarios de Pensao
   // O grupo 21000 é o total por titular e o grupo 91000 é o total de beneficiarios
   qryPensaoPorBeneficiario.Close;
   qryPensaoPorBeneficiario.SQL.Clear;
   qryPensaoPorBeneficiario.SQL.Add(' SELECT NVL(SUM(CONC.BENEFCONCEDIDOS),0) AS TOTCONCEDIDO,                                            '+
                                    '        NVL(SUM(CANC.BENEFCANCELADOS),0) AS TOTCANCELADO                                             '+
                                    ' FROM CM.BENEFICIO BNF,                                                                              '+
                                    ' /* BENEFICIOS CONCEDIDOS = DATA CONCESSAO ENTRE PARAMETROS DE INICIO E FIM */                       '+
                                    ' (SELECT  PENSAO.IDBENEFICIO,                                                                        '+
                                    '         COUNT(DISTINCT PENSAO.IDPESSOA)  AS BENEFCONCEDIDOS                                         '+
                                    ' FROM    BENEFBFCIARIO PENSAO, BENEFICIO B , MOVBENEF M                                              '+
                                    ' WHERE   '+


                                    ' M.IDLOTEMOV IN (SELECT IDLOTE FROM  CTRLINTERFACE '+
                                    '                 WHERE FLGCONCESSAO = 1 AND '+
                                    '                 MESREFERENCIA = '''+Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2)+''' ) '+
                                    ' AND     M.TIPOMOV IN (0,1,7) '+

                                    ' AND     M.IDMOVBENEF = (SELECT MAX(IDMOVBENEF) FROM MOVBENEF WHERE IDPESSJUR = M.IDPESSJUR AND IDPESSOA = M.IDPESSOA AND IDTITULAR = M.IDTITULAR AND IDBENEFICIO = M.IDBENEFICIO AND TIPOMOV  <> 13) '+

                                    ' AND     PENSAO.IDBENEFICIO = M.IDBENEFICIO '+
                                    ' AND     PENSAO.IDTITULAR = M.IDTITULAR '+
                                    ' AND     PENSAO.IDPESSOA = M.IDPESSOA '+
                                    ' AND     PENSAO.NUMEROPROCESSO = M.NUMEROPROCESSO '+
                                    ' AND     PENSAO.SEQPROPOSTA = M.SEQPROPOSTA '+
                                    ' AND     NVL(PENSAO.VALORATUAL,0) > 0 '+
                                    ' AND     B.IDBENEFICIO           = PENSAO.IDBENEFICIO                                                '+
                                    ' AND     B.CODBENEFSPC     IN (''21000'',''21100'',''21200'')                                                         '+
                                    ' GROUP BY PENSAO.IDBENEFICIO) CONC,                                                                  '+
                                    ' /* BENEFICIOS CANCELADOS = DATA DE FIM ENTRE PARAMETROS DE INICIO E FIM */                          '+

                                    '      (SELECT  BF.IDBENEFICIO,                                                                   '+
                                    '         COUNT(DISTINCT BF.IDPESSOA)  AS BENEFCANCELADOS                                         '+
                                    ' FROM    BENEFBFCIARIO BF, BENEFICIO B                                             '+
                                    ' WHERE   '+
                                    ' B.IDBENEFICIO           = BF.IDBENEFICIO                                                '+
                                    ' AND     B.CODBENEFSPC     IN (''21000'',''21100'',''21200'')                     '+
                                    ' AND     BF.DATAFINAL     >= TO_DATE('''+DataIni+''',''DD/MM/YYYY'') AND                       '+
                                    '         BF.DATAFINAL     <= TO_DATE('''+DataFim+''',''DD/MM/YYYY'') AND                       '+
                                    '       (        (EXISTS (SELECT 1 FROM MOVBENEF M                                                    '+
                                    '                        WHERE  M.TIPOMOV        = 4                                                  '+
                                    '                        AND    M.DATAMOV        >= TO_DATE('''+DataIni+''',''DD/MM/YYYY'')           '+
                                    '                        AND    M.DATAMOV        <= TO_DATE('''+DataFim+''',''DD/MM/YYYY'')           '+
                                    '                        AND    M.IDPLANOPREV    = BF.IDPLANOPREV                                     '+
                                    '                        AND    M.IDBENEFICIO    = BF.IDBENEFICIO                                     '+
                                    '                        AND    M.NUMEROPROCESSO = BF.NUMEROPROCESSO                                  '+
                                    '                        AND    M.IDPESSJUR      = BF.IDPESSJUR                                       '+
                                    '                        AND    M.IDTITULAR      = BF.IDTITULAR                                       '+
                                    '                        AND    M.IDPLANOORIGEM  = BF.IDPLANOORIGEM                                   '+
                                    '                        AND    M.IDPESSOA       = BF.IDPESSOA                                        '+
                                    '                        AND    M.SEQPROPOSTA    = BF.SEQPROPOSTA )                                   '+
                                    '              )                                                                                      '+
                                    '       OR                                                                                            '+
                                    '              (  (EXISTS (SELECT 1 FROM HSTBENEFBFCIARIO H                                           '+
                                    '                        WHERE  H.MES            = '''+sAnoMesAnt+'''                                 '+
                                    '                        AND    H.IDPLANOPREV    = BF.IDPLANOPREV                                     '+
                                    '                        AND    H.IDBENEFICIO    = BF.IDBENEFICIO                                     '+
                                    '                        AND    H.NUMEROPROCESSO = BF.NUMEROPROCESSO                                  '+
                                    '                        AND    H.IDPESSJUR      = BF.IDPESSJUR                                       '+
                                    '                        AND    H.IDTITULAR      = BF.IDTITULAR                                       '+
                                    '                        AND    H.IDPLANOORIGEM  = BF.IDPLANOORIGEM                                   '+
                                    '                        AND    H.IDPESSOA       = BF.IDPESSOA                                        '+
                                    '                        AND    H.SEQPROPOSTA    = BF.SEQPROPOSTA ) ) AND                             '+
                                    '                 NOT ( EXISTS (SELECT 1 FROM HSTBENEFBFCIARIO H                                      '+
                                    '                        WHERE  H.MES            = '''+Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2)+'''    '+
                                    '                        AND    H.IDPLANOPREV    = BF.IDPLANOPREV                                     '+
                                    '                        AND    H.IDBENEFICIO    = BF.IDBENEFICIO                                     '+
                                    '                        AND    H.NUMEROPROCESSO = BF.NUMEROPROCESSO                                  '+
                                    '                        AND    H.IDPESSJUR      = BF.IDPESSJUR                                       '+
                                    '                        AND    H.IDTITULAR      = BF.IDTITULAR                                       '+
                                    '                        AND    H.IDPLANOORIGEM  = BF.IDPLANOORIGEM                                   '+
                                    '                        AND    H.IDPESSOA       = BF.IDPESSOA                                        '+
                                    '                        AND    H.SEQPROPOSTA    = BF.SEQPROPOSTA ) )                                 '+
                                    '              )                                                                                      '+
                                    '       )                                                                                             '+
                                    '       GROUP BY BF.IDBENEFICIO ) CANC                                                                '+

                                    ' /* JOINS DE INTEGRIDADE RELACIONAL */                                                               '+
                                    ' WHERE  (RTRIM(BNF.CODBENEFSPC)   IN (''21000'',''21100'',''21200'') )        AND                                            '+
                                    '        (BNF.IDBENEFICIO   = CONC.IDBENEFICIO(+))  AND                                               '+
                                    '        (BNF.IDBENEFICIO   = CANC.IDBENEFICIO(+))                                                    ');
   qryPensaoPorBeneficiario.Open;
   qryPensaoPorBeneficiario.First;

   // Esta query trará uma única linha, com os totais para ativos e os totais para aposentados
   varFields[0] := Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2);
   varFields[1] := '91000';

   with qryEstatisticas do
   begin
      if Locate('ANOMES; CODARVORE',varFields,[loCaseInsensitive])
      then begin
         Edit;
         FieldByName('TOTCONCEDIDO').AsInteger := FieldByName('TOTCONCEDIDO').AsInteger + qryPensaoPorBeneficiario.FieldByName('TOTCONCEDIDO').AsInteger;
         FieldByName('TOTCANCELADO').AsInteger := FieldByName('TOTCANCELADO').AsInteger + qryPensaoPorBeneficiario.FieldByName('TOTCANCELADO').AsInteger;
         Post;
      end;
   end;



   //benefício com parametrização por regra
   frmAguarde.Mostra('Gerando Estatística para benefícios identificados por regra em '+Copy(DataIni,4,2)+'/'+Copy(DataIni,7,4)+' ...');


   qryPensao.Close;
   qryPensao.SQL.Clear;
   qryPensao.SQL.Add(' SELECT   DISTINCT BF.NUMEROPROCESSO, BF.IDPLANOPREV, BF.IDTITULAR, BF.IDPESSJUR, '+
                     ' BF.IDBENEFICIO, BF.IDPESSOA, BF.SEQPROPOSTA, BF.IDSITBENEFICIO, '+
                     ' BF.DATAFINAL, BF.DATAINICIO , BF.DATAINICIOFUND, B.IDREGRALINHASPC , PP.INSCRICAODATA,  '+
                     ' NVL(BF.VALORBASE1,0) VALORBASE1 , NVL(BF.VALORBASE2,0) VALORBASE2, NVL(BF.VALORBASE3,0) VALORBASE3, NVL(B.FLGRESGATE,0) FLGRESGATE '+
                     ' FROM    BENEFBFCIARIO BF, BENEFICIO B,  PARTPREVPLAN PP ,  MOVBENEF M  '+
                     ' WHERE  M.IDLOTEMOV IN (SELECT IDLOTE FROM  CTRLINTERFACE '+
                     '                 WHERE FLGCONCESSAO = 1 AND '+
                     '                 MESREFERENCIA = '''+Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2)+''' ) '+
                     ' AND     M.TIPOMOV IN (0,1,7,4) '+

                     ' AND     M.IDMOVBENEF = (SELECT MAX(IDMOVBENEF) FROM MOVBENEF WHERE IDPESSJUR = M.IDPESSJUR AND IDPESSOA = M.IDPESSOA AND IDTITULAR = M.IDTITULAR AND IDBENEFICIO = M.IDBENEFICIO AND TIPOMOV  <> 13) '+

                     ' AND     M.IDBENEFICIO = BF.IDBENEFICIO '+

                     '      AND NOT EXISTS (SELECT 1 FROM HSTBENEFBFCIARIO H '+
                     '      WHERE H.IDPESSJUR = BF.IDPESSJUR AND '+
                     '      H.IDPESSOA = BF.IDPESSOA AND '+
                     '      H.IDTITULAR = BF.IDTITULAR AND '+
                     '      H.MES  = '''+sAnoMesAnt+''' AND '+
                     '      H.IDPLANOPREV <> BF.IDPLANOPREV) '+

                     ' AND     BF.IDBENEFICIO = M.IDBENEFICIO '+
                     ' AND     BF.IDTITULAR = M.IDTITULAR '+
                     ' AND     BF.IDPESSOA = M.IDPESSOA '+
                     ' AND     BF.NUMEROPROCESSO = M.NUMEROPROCESSO '+
                     ' AND     BF.SEQPROPOSTA = M.SEQPROPOSTA '+
                     ' AND     B.IDBENEFICIO           = BF.IDBENEFICIO        '+
                     ' AND     B.CODBENEFSPC           IS NULL               '+
                     ' AND     B.IDREGRALINHASPC       IS NOT NULL           '+
                     ' AND     PP.IDPESSJUR = BF.IDPESSJUR '+
                     ' AND     PP.IDPLANOPREV = BF.IDPLANOPREV '+
                     ' AND     PP.IDPESSOA = BF.IDTITULAR  ');
   qryPensao.Open;
   qryPensao.First;


   while not qrypensao.EOF do
   begin


      qryaux.close;
      qryaux.SQL.text := '   SELECT FLGINTERNO, IDSITPART '+ 
              '     FROM SITPART ,  (SELECT IDSITPARTATUAL '+
              '     FROM EVENTOSPREV '+
              '     WHERE IDPESSOA = '+qrypensao.FieldByName('IDTITULAR').AsString+' '+
              '     AND IDSITPARTATUAL IS NOT NULL '+
              '     ORDER BY IDEVENTOSPREV DESC) '+
              '     WHERE IDSITPART = IDSITPARTATUAL AND '+
              '     ROWNUM <= 1 ';
      qryaux.open;

      if qryaux.isempty then
      sFlgInterno := 'AT'
      else
      begin
         sFlgInterno := qryaux.FieldByName('FLGINTERNO').AsString;
         sIdSitPart := qryaux.FieldByName('IDSITPART').AsString;
      end;



      qryaux.close;
      qryaux.SQL.text := '  SELECT BF.IDBENEFICIO '+
              '     FROM BENEFBFCIARIO BF , BENEFPLANPREV BP '+
              '     WHERE BF.IDPESSOA = '+qrypensao.FieldByName('IDTITULAR').AsString+' '+
              '     AND BF.IDTITULAR = '+qrypensao.FieldByName('IDTITULAR').AsString+' '+
              '     AND BF.IDPESSJUR = '+qrypensao.FieldByName('IDPESSJUR').AsString+' '+
              '     AND BP.FLGREFERENCIA = 1 '+
              '     AND BP.IDBENEFICIO = BF.IDBENEFICIO '+
              '     AND BP.IDPLANOPREV = BF.IDPLANOPREV ';
      qryaux.open;

      if qryaux.isempty then
           sIdBenefInss := ' '
      else sIdBenefInss := qryaux.FieldByName('IDBENEFICIO').AsString;

      sSQLRegra := ' SELECT '+qrypensao.FieldByName('NUMEROPROCESSO').AsString+' NUMEROPROCESSO, '+
                   ' '+qrypensao.FieldByName('IDPLANOPREV').AsString+' IDPLANOPREV, '+
                   ' '+qrypensao.FieldByName('IDTITULAR').AsString+' IDTITULAR, '+
                   ' '+qrypensao.FieldByName('IDPESSJUR').AsString+' IDPESSJUR, '+
                   ' '+qrypensao.FieldByName('IDBENEFICIO').AsString+' IDBENEFICIO, '+
                   ' '+qrypensao.FieldByName('IDPESSOA').AsString+' IDPESSOA, '+
                   ' '+qrypensao.FieldByName('SEQPROPOSTA').AsString+' SEQPROPOSTA, '+
                   ' '+qrypensao.FieldByName('IDSITBENEFICIO').AsString+' IDSITBENEFICIO, '+
                   ' '''+qrypensao.FieldByName('DATAFINAL').AsString+''' DATAFINAL, '+
                   ' '''+qrypensao.FieldByName('DATAINICIO').AsString+''' DATAINICIO, '+
                   ' '''+qrypensao.FieldByName('DATAINICIOFUND').AsString+''' DATAINICIOFUND, '+
                   ' '''+qrypensao.FieldByName('INSCRICAODATA').AsString+''' INSCRICAODATA, '+
                   ' '''+oranumero(qrypensao.FieldByName('VALORBASE1').AsString)+''' VALORBASE1, '+
                   ' '''+oranumero(qrypensao.FieldByName('VALORBASE2').AsString)+''' VALORBASE2, '+
                   ' '''+oranumero(qrypensao.FieldByName('VALORBASE3').AsString)+''' VALORBASE3, '+
                   ' '''+sFlgInterno+''' FLGINTERNO, '''+sIdBenefInss+''' IDBENEFINSS, '''+sIdSitPart+''' IDSITPART '+
                   ' FROM DUAL ';


      bErroLocal := false;
      try
          sLinha := RegraString(qrypensao.FieldByName('IDREGRALINHASPC').AsString,
                            sSQLRegra, bErroLocal, iIdCalculo);
      except
         MsgDlg('Ocorreu um erro na execução da regra '+qrypensao.FieldByName('IDREGRALINHASPC').AsString+'','Erro em regra',mtError,[mbOk],0);
      end;

      varFields[0] := Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2);
      varFields[1] := sLinha;


      with qryEstatisticas do
      begin
         if Locate('ANOMES; CODARVORE',varFields,[loCaseInsensitive])
         then begin
            Edit;

            if trim(qrypensao.FieldByName('DATAFINAL').AsString) = '' then
                FieldByName('TOTCONCEDIDO').AsInteger := FieldByName('TOTCONCEDIDO').AsInteger + 1
            else if (qryPensao.FieldByName('FLGRESGATE').AsInteger = 1) 
            then FieldByName('TOTCONCEDIDO').AsInteger := FieldByName('TOTCONCEDIDO').AsInteger + 1
            else FieldByName('TOTCANCELADO').AsInteger := FieldByName('TOTCANCELADO').AsInteger + 1;

            Post;
         end
         else
         begin
            MsgDlg('A linha '+sLinha+'(retorno da regra), não foi encontrada.','Erro em regra',mtError,[mbOk],0);
         end;
      end;

      qrypensao.next;
   end; //while


   // **************************************************************************
   // ******************************** SOMATORIOS ******************************
   // **************************************************************************
   varFields[0]          := Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2);

   iNivelGrupo1           := 11000;
   while iNivelGrupo1 <= 91000 do
   begin
      dTotalConcedidoNivel1  := 0;
      dTotalCanceladoNivel1  := 0;
      iNivelGrupo2           := iNivelGrupo1 + 100;
      while iNivelGrupo2 <= (iNivelGrupo1 + 800) do
      begin
         varFields[1] := IntToStr(iNivelGrupo2);
         if qryEstatisticas.Locate('ANOMES; CODARVORE',varFields,[loCaseInsensitive])
         then begin
            dTotalConcedidoNivel1  := dTotalConcedidoNivel1 + qryEstatisticas.FieldByName('TOTCONCEDIDO').AsInteger;
            dTotalCanceladoNivel1  := dTotalCanceladoNivel1 + qryEstatisticas.FieldByName('TOTCANCELADO').AsInteger;
         end;
         iNivelGrupo2 := iNivelGrupo2 + 100;
      end; // nivel 2

      varFields[1] := IntToStr(iNivelGrupo1);
      if qryEstatisticas.Locate('ANOMES; CODARVORE',varFields,[loCaseInsensitive])
      then begin
         qryEstatisticas.Edit;
         if   dTotalConcedidoNivel1 > 0
         then qryEstatisticas.FieldByName('TOTCONCEDIDO').AsInteger := dTotalConcedidoNivel1;
         if   dTotalCanceladoNivel1 > 0
         then qryEstatisticas.FieldByName('TOTCANCELADO').AsInteger := dTotalCanceladoNivel1;
         qryEstatisticas.Post;
      end;

      case iNivelGrupo1 of
           11000 : iNivelGrupo1 := 12000;
           12000 : iNivelGrupo1 := 21000;
           21000 : iNivelGrupo1 := 31000;
           31000 : iNivelGrupo1 := 32000;
           32000 : iNivelGrupo1 := 41000;
           41000 : iNivelGrupo1 := 51000;
           51000 : iNivelGrupo1 := 61000;
           61000 : iNivelGrupo1 := 71000;
           71000 : iNivelGrupo1 := 81000;
           81000 : iNivelGrupo1 := 82000;
           82000 : iNivelGrupo1 := 83000;
           83000 : iNivelGrupo1 := 84000;
           84000 : iNivelGrupo1 := 91000;
           91000 : iNivelGrupo1 := 100000;
      end;
   end; // nivel 1



   frmAguarde.Mostra('Gerando Estatística para População de Assistidos em '+Copy(DataIni,4,2)+'/'+Copy(DataIni,7,4)+' ...');
   // Montando grupo 82000 = 11000
   varFields[0] := Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2);
   varFields[1] := '11000';
   if qryEstatisticas.Locate('ANOMES; CODARVORE',varFields,[loCaseInsensitive])
   then begin
      dTotalConcedidoNivel1 := qryEstatisticas.FieldByName('TOTCONCEDIDO').AsInteger;
      dTotalCanceladoNivel1 := qryEstatisticas.FieldByName('TOTCANCELADO').AsInteger;
   end;

   varFields[0] := Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2);
   varFields[1] := '82000';
   with qryEstatisticas do
   begin
      if Locate('ANOMES; CODARVORE',varFields,[loCaseInsensitive])
      then begin
         Edit;
         FieldByName('TOTCONCEDIDO').AsInteger := FieldByName('TOTCONCEDIDO').AsInteger + dTotalConcedidoNivel1;
         FieldByName('TOTCANCELADO').AsInteger := FieldByName('TOTCANCELADO').AsInteger + dTotalCanceladoNivel1;
         Post;
      end;
   end;

   // Grupo 83000
   // 83000 = 12000
   varFields[0] := Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2);
   varFields[1] := '83000';
   if qryEstatisticas.Locate('ANOMES; CODARVORE',varFields,[loCaseInsensitive])
   then begin
      dTotalConcedidoNivel1 := qryEstatisticas.FieldByName('TOTCONCEDIDO').AsInteger;
      dTotalCanceladoNivel1 := qryEstatisticas.FieldByName('TOTCANCELADO').AsInteger;
   end;

   varFields[0] := Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2);
   varFields[1] := '12000';
   with qryEstatisticas do
   begin
      if Locate('ANOMES; CODARVORE',varFields,[loCaseInsensitive])
      then begin
         Edit;
         FieldByName('TOTCONCEDIDO').AsInteger := FieldByName('TOTCONCEDIDO').AsInteger + dTotalConcedidoNivel1;
         FieldByName('TOTCANCELADO').AsInteger := FieldByName('TOTCANCELADO').AsInteger + dTotalCanceladoNivel1;
         Post;
      end;
   end;

   Result := True;
end; // GeraEstatisticaSEMEventos

procedure TfrmEstatisticaSPCNOVO.FormCreate(Sender: TObject);
var wAno, wMes, wDia : word;
begin
  inherited;
  //Henrique Massão
  OpenDialog.InitialDir:=Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
  DecodeDate(Date, wAno, wMes, wDia);
  mebMes.ItemIndex := wMes - 1;
  mebAno.Value := wAno;
  //Henrique Massão
  //edArqSaida.Text := 'C:\CM_ESTATSPC.TXT';
  edArqSaida.Text := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\CM_ESTATSPC.TXT';

  memResult.SendToBack;
  memResult.Visible := False;
end;

procedure TfrmEstatisticaSPCNOVO.sbtArqSaidaClick(Sender: TObject);
begin
  inherited;
  if OpenDlg.Execute then edArqSaida.Text := OpenDlg.FileName;
end;

procedure TfrmEstatisticaSPCNOVO.bbtnConfirmarClick(Sender: TObject);
var Mes : string;
    F   : TextFile;
begin
  inherited;

  // Verificar dados obrigatorios
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

  // Montar as Datas
  if mebMes.ItemIndex+1 < 10
  then begin
    DataIni := '01/0'+IntToStr(mebMes.ItemIndex+1)+'/'+mebano.Text;
    mes     := '0'+IntToStr(mebMes.ItemIndex+1);
  end
  else begin
    DataIni := '01/'+IntToStr(mebMes.ItemIndex+1)+'/'+mebano.Text;
    mes     := IntToStr(mebMes.ItemIndex+1)
  end;

  if mebMes.ItemIndex+1 < 10
  then DataFim := '/0'+IntToStr(mebMes.ItemIndex+1)+'/'+mebano.Text;
  if mebMes.ItemIndex+1 >= 10
  then DataFim := '/'+IntToStr(mebMes.ItemIndex+1)+'/'+mebano.Text;   
  // Pega o Ultimo Dia
  DataFim := IntToStr(TrazUltDiaMes((mebMes.ItemIndex+1),StrToInt(mebano.Text)))+DataFim; 

  if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.RollBack;
  dtmBaseDados.dbBaseDados.StartTransaction;

  if chkEventos.Checked
  then begin

     // Apagar estatistica anterior
     with qryAux do
     begin
        Close;
        SQL.Clear;
        SQL.Add(' DELETE ESTBENEFSPC '+
                ' WHERE  ANOMES      = '''+Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2)+'''');
        ExecSQL;
     end;

     frmAguarde.Mostra('Verificando Estatística Anterior ...');
     InsereSaldoInicial;

     frmAguarde.Mostra('Gerando Estatística para '+Copy(DataIni,4,2)+'/'+Copy(DataIni,7,4)+' ...');

     if chkListaExcel.Checked then Begin
       CriaListaSpc;
       Exit;
     End;

     if not GeraEstatisticaSEMEventos
     then begin
        qryEstatisticas.CancelUpdates;
        dtmBaseDados.dbBaseDados.RollBack;
        frmAguarde.Apaga;
        MsgDlg('Geração da Estatística Cancelada - Erros na Geração.','Erro',mtError,[mbOk],0);
        Exit;
     end;
  end
  else begin
     qryPatroPlano.Close;
     qryPatroPlano.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao;
     qryPatroPlano.Open;

     while not qryPatroPlano.EOF do
     begin

        // Apagar estatistica anterior
        with qryAux do
        begin
           Close;
           SQL.Clear;
           SQL.Add(' DELETE ESTBENEFSPC '+
                   ' WHERE  ANOMES      = '''+Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2)+'''');
           ExecSQL;
        end;

        frmAguarde.Mostra('Patrocinadora : '+qryPatroPlano.FieldByName('IDPESSJUR').AsString+
                          ' Plano : '+qryPatroPlano.FieldByName('IDPLANOPREV').AsString);

        PreencheGruposPatroPlano;
        if chkEventos.Checked
        then begin
           if not GeraEstatisticaSEMEventos
           then begin
              qryEstatisticas.CancelUpdates;
              dtmBaseDados.dbBaseDados.RollBack;
              frmAguarde.Apaga;
              MsgDlg('Geração da Estatística Cancelada - Erros na Geração.','Erro',mtError,[mbOk],0);
              Exit;
           end;
        end
        else begin
           if not GeraEstatisticaCOMEventos
           then begin
              qryEstatisticas.CancelUpdates;
              dtmBaseDados.dbBaseDados.RollBack;
              frmAguarde.Apaga;
              MsgDlg('Geração da Estatística Cancelada - Erros na Geração.','Erro',mtError,[mbOk],0);
              Exit;
           end;
        end;

        qryPatroPlano.Next;
     end;
  end;


  
  Modulo.GravaLogTOTALPREV (Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2)+' - v. '+Sistema.Versao+' - Rel. SPC');

  frmAguarde.Apaga;
  qryEstatisticas.ApplyUpdates;


  dtmBaseDados.dbBaseDados.Commit;


  frmAguarde.Mostra('Gerando Arquivo ...');

  // Gerar arquivo texto e relatórios
  AssignFile(F, edArqSaida.Text);
  Rewrite(F);


  with qryAux do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT CODARVORE, SUM(TOTANTERIOR)  AS TOTANTERIOR, '+
             '                   SUM(TOTCONCEDIDO) AS TOTCONCEDIDO, '+
             '                   SUM(TOTCANCELADO) AS TOTCANCELADO, '+
             '                   (SUM(TOTANTERIOR)+ SUM(TOTCONCEDIDO) - SUM(TOTCANCELADO)) AS TOTATUAL '+
             ' FROM   ESTBENEFSPC '+
             ' WHERE  ANOMES      = '''+Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2)+''''+
             ' GROUP BY CODARVORE '+
             ' ORDER BY CODARVORE ');
     Open;

     writeln(F, PreparaStr('Código SPC',           15)+
                PreparaStr(' ',                     1)+
                PreparaStr('Anterior',             10)+
                PreparaStr(' ',                     1)+
                PreparaStr('Entrada',            10)+
                PreparaStr(' ',                     1)+
                PreparaStr('Saída',            10)+
                PreparaStr(' ',                     1)+
                PreparaStr('Atual',                10));
     while not EOF do
     begin
        writeln(F, PreparaStr(FieldByName('CODARVORE').AsString,     15)+
                   PreparaStr(' ',                     1)+
                   ColocaZeros(FieldByName('TOTANTERIOR').AsString,  10)+
                   PreparaStr(' ',                     1)+
                   ColocaZeros(FieldByName('TOTCONCEDIDO').AsString, 10)+
                   PreparaStr(' ',                     1)+
                   ColocaZeros(FieldByName('TOTCANCELADO').AsString, 10)+
                   PreparaStr(' ',                     1)+
                   ColocaZeros(FieldByName('TOTATUAL').AsString,     10));

        Next;
     end;
  end;
  CloseFile(F);
  frmAguarde.Apaga;

  if MsgDlg('Geração da Estatística Efetuada com Sucesso. Deseja visualizar o arquivo ?','Informação',mtInformation,[mbYes, mbNo],0) = mrYes
  then bbtnCancelarClick(Sender);
end;

procedure TfrmEstatisticaSPCNOVO.chkEventosClick(Sender: TObject);
begin
  inherited;
  memEventos.Visible    := chkEventos.Checked;
  chkListaExcel.visible := chkEventos.Checked;;
end;

procedure TfrmEstatisticaSPCNOVO.bbtnCancelarClick(Sender: TObject);
var mes : string;
begin
  inherited;

  // Verificar dados obrigatorios
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

  // Montar as Datas
  if mebMes.ItemIndex+1 < 10
  then begin
    DataIni := '01/0'+IntToStr(mebMes.ItemIndex+1)+'/'+mebano.Text;
    mes     := '0'+IntToStr(mebMes.ItemIndex+1);
  end
  else begin
    DataIni := '01/'+IntToStr(mebMes.ItemIndex+1)+'/'+mebano.Text;
    mes     := IntToStr(mebMes.ItemIndex+1)
  end;

  if mebMes.ItemIndex+1 < 10
  then DataFim := '/0'+IntToStr(mebMes.ItemIndex+1)+'/'+mebano.Text;
  if mebMes.ItemIndex+1 >= 10
  then DataFim := '/0'+IntToStr(mebMes.ItemIndex+1)+'/'+mebano.Text;

  // Pega o Ultimo Dia
  DataFim := FormatDateTime('dd/mm/yyyy', TrazUltDiaMes((mebMes.ItemIndex+1),StrToInt(mebano.Text)))+
             copy(datafim,3,8);

  if UpperCase(bbtnCancelar.Caption) = 'CONSULTAR'
  then begin
     memResult.Lines.Clear;
     with qryAux do
     begin
        Close;
        SQL.Clear;
        SQL.Add(' SELECT CODARVORE, SUM(TOTANTERIOR)  AS TOTANTERIOR, '+
                '                   SUM(TOTCONCEDIDO) AS TOTCONCEDIDO, '+
                '                   SUM(TOTCANCELADO) AS TOTCANCELADO, '+
                '                   (SUM(TOTANTERIOR)+ SUM(TOTCONCEDIDO) - SUM(TOTCANCELADO)) AS TOTATUAL '+
                ' FROM   ESTBENEFSPC '+
                ' WHERE  ANOMES      = '''+Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2)+''''+
                ' GROUP BY CODARVORE '+
                ' ORDER BY CODARVORE ');
        Open;

        memResult.Lines.Add( PreparaStr('Código SPC',           15)+
                             PreparaStr(' ',                     1)+
                             PreparaStr('Anterior',             10)+
                             PreparaStr(' ',                     1)+
                             PreparaStr('Concedido',            10)+
                             PreparaStr(' ',                     1)+
                             PreparaStr('Cancelado',            10)+
                             PreparaStr(' ',                     1)+
                             PreparaStr('Atual',                10));
        while not EOF do
        begin
           memResult.Lines.Add( PreparaStr(FieldByName('CODARVORE').AsString,     15)+
                                PreparaStr(' ',                     1)+
                                ColocaZeros(FieldByName('TOTANTERIOR').AsString,  10)+
                                PreparaStr(' ',                     1)+
                                ColocaZeros(FieldByName('TOTCONCEDIDO').AsString, 10)+
                                PreparaStr(' ',                     1)+
                                ColocaZeros(FieldByName('TOTCANCELADO').AsString, 10)+
                                PreparaStr(' ',                     1)+
                                ColocaZeros(FieldByName('TOTATUAL').AsString,     10));

           Next;
        end;
     end;
     frmAguarde.Apaga;
     memResult.BringToFront;
     memResult.Visible := True;
     bbtnCancelar.Caption := 'Voltar';
  end
  else begin
     bbtnCancelar.Caption := 'Consultar';
     memResult.SendToBack;
     memResult.Visible := False;
  end;
end;

procedure TfrmEstatisticaSPCNOVO.CriaListaSpc;
Type
  TRecImport = Record
                 Matricula  : String;
                 sMesRef    : String;
                 SDataAlimenta : String;
               End;

Var
  wDecimal   : Char;
  sNomeArquivo, sArquivo : String;
  RecImport : TRecImport;
begin

  { Executa Dialogo de procura do Arquivo }
  if (OpenDialog.Execute) then Begin
    sArquivo := UpperCase(OpenDialog.FileName);
  End Else Begin
    FrmAguarde.Apaga;
    Exit;
  End;

  try
    { Conecta com o Excel }
    ExcelApp := CreateOleObject('Excel.Application');
    ExcelApp.Workbooks.add(-4167);
    ExcelApp.Visible := True;

    try
      Sheet := ExcelApp.ActiveWorkbook.WorkSheets['Plan1'];
    except
      Sheet := ExcelApp.ActiveWorkbook.WorkSheets['Sheet1'];
    End;  

    { Cabeçalho  }
    Sheet.Columns.NumberFormat := '@'; { Muda o formato das colunas para texto }

    if not GeraListaSEMEventos then begin
      MsgDlg('Geração da planilha de estatística cancelada - Erros na geração.','Erro',mtError,[mbOk],0);
    end else begin
      ExcelApp.Columns.AutoFit; // Ajusta tamaho das colunas
      if MsgDlg('Geração da planilha de estatística concluida. Deseja salvar as alterações?',
                'Mensagem', mtInformation, [mbYes, mbNo],0) = mrYes

      then begin
        { Fecha o Arquivo Independente do resultado da Operacao }
        frmAguarde.Apaga;
        ExcelApp.ActiveWorkbook.SaveAs(sArquivo)
      end;
    end;

  Finally
    FrmAguarde.Apaga;
    ExcelApp.ActiveWorkbook.Close(False);
    ExcelApp.Quit;
  End;

end;



function TfrmEstatisticaSPCNOVO.GeraListaSEMEventos : boolean;
var
    sSQL, sLinha : String;
    bErroLocal : Boolean;
    iIdCalculo : Integer;
    varfields : variant;
    sAnoMesAtual, sFlgInterno, sIdBenefInss, sIdSitPart   : String;
begin
   Result := False;

   //CANCELADOS
   sSQL:=' SELECT DISTINCT B.NOME BENEFICIO , BF.IDTITULAR, B.CODBENEFSPC, DP.MATRICULA, P.NOME,  '+
         '        ''CANC'' AS TIPO '+
         ' FROM    BENEFBFCIARIO BF  , BENEFICIO B  , DEPENTIT DP, PESSOA P                '+
         ' WHERE   P.IDPESSOA = BF.IDTITULAR AND '+
         '         BF.DATAFINAL     >= TO_DATE('''+DataIni+''',''DD/MM/YYYY'') AND                       '+
         '         BF.DATAFINAL     <= TO_DATE('''+DataFim+''',''DD/MM/YYYY'') AND                       '+
         '         B.IDBENEFICIO = BF.IDBENEFICIO AND '+
         '         NVL(B.FLGRESGATE,0) = 0  AND'+
         '         DP.IDPESSOA = BF.IDTITULAR AND'+
         '         DP.IDTITULAR = BF.IDTITULAR  AND '+
         '         B.CODBENEFSPC IS NOT NULL  AND '+
         '         RTRIM(B.CODBENEFSPC) NOT IN (''21100'',''21200'') AND '+
         '        ((EXISTS (SELECT 1 FROM MOVBENEF M                                                    '+
         '                  WHERE  M.TIPOMOV        = 4                                                  '+
         '                    AND    M.DATAMOV        >= TO_DATE('''+DataIni+''',''DD/MM/YYYY'')           '+
         '                    AND    M.DATAMOV        <= TO_DATE('''+DataFim+''',''DD/MM/YYYY'')           '+
         '                    AND    M.IDPLANOPREV    = BF.IDPLANOPREV                                     '+
         '                    AND    M.IDBENEFICIO    = BF.IDBENEFICIO                                     '+
         '                    AND    M.NUMEROPROCESSO = BF.NUMEROPROCESSO                                  '+
         '                    AND    M.IDPESSJUR      = BF.IDPESSJUR                                       '+
         '                    AND    M.IDTITULAR      = BF.IDTITULAR                                       '+
         '                    AND    M.IDPLANOORIGEM  = BF.IDPLANOORIGEM                                   '+
         '                    AND    M.IDPESSOA       = BF.IDPESSOA                                        '+
         '                    AND    M.SEQPROPOSTA    = BF.SEQPROPOSTA )                                   '+
         '         )                                                                                      '+
         '       OR                                                                                            '+
         '              (  (EXISTS (SELECT 1 FROM HSTBENEFBFCIARIO H                                           '+
         '                        WHERE  H.MES            = '''+sAnoMesAnt+'''                                 '+
         '                        AND    H.IDPLANOPREV    = BF.IDPLANOPREV                                     '+
         '                        AND    H.IDBENEFICIO    = BF.IDBENEFICIO                                     '+
         '                        AND    H.NUMEROPROCESSO = BF.NUMEROPROCESSO                                  '+
         '                        AND    H.IDPESSJUR      = BF.IDPESSJUR                                       '+
         '                        AND    H.IDTITULAR      = BF.IDTITULAR                                       '+
         '                        AND    H.IDPLANOORIGEM  = BF.IDPLANOORIGEM                                   '+
         '                        AND    H.IDPESSOA       = BF.IDPESSOA                                        '+
         '                        AND    H.SEQPROPOSTA    = BF.SEQPROPOSTA ) ) AND                             '+
         '                 NOT ( EXISTS (SELECT 1 FROM HSTBENEFBFCIARIO H                                      '+
         '                        WHERE  H.MES            = '''+Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2)+'''    '+
         '                        AND    H.IDPESSJUR      = BF.IDPESSJUR                      '+
         '                        AND    H.IDTITULAR      = BF.IDTITULAR                      '+
         '                        AND    H.IDPESSOA       = BF.IDPESSOA                       '+
         '                        AND    H.SEQPROPOSTA    = BF.SEQPROPOSTA ) ) )  )';
   FazQuery(qryaux,sSQL);
   AlimentaLista(qryaux, 'Cancelados');

   //CONCEDIDOS
   sSQL:=' SELECT  DISTINCT M.IDTITULAR , B.CODBENEFSPC, B.NOME BENEFICIO, DP.MATRICULA, P.NOME, '+
         '        ''CONC'' AS TIPO '+
         '      FROM MOVBENEF M, BENEFICIO B, BENEFBFCIARIO BF, DEPENTIT DP, PESSOA P '+
         '      WHERE P.IDPESSOA = BF.IDTITULAR AND '+
         '      M.IDLOTEMOV IN (SELECT IDLOTE FROM  CTRLINTERFACE '+
         '                            WHERE FLGCONCESSAO = 1 AND '+
         '                            MESREFERENCIA = '''+Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2)+''' ) '+
         '      AND M.TIPOMOV IN (0,1,7) '+
         '      AND M.IDMOVBENEF = (SELECT MAX(IDMOVBENEF) FROM MOVBENEF WHERE IDPESSJUR = M.IDPESSJUR AND IDPESSOA = M.IDPESSOA AND IDTITULAR = M.IDTITULAR AND IDBENEFICIO = M.IDBENEFICIO AND TIPOMOV  <> 13) '+
         '      AND B.IDBENEFICIO = M.IDBENEFICIO '+
         '      AND B.CODBENEFSPC IS NOT NULL '+
         '      AND RTRIM(B.CODBENEFSPC) NOT IN (''21100'',''21200'')  '+
         '      AND BF.NUMEROPROCESSO = M.NUMEROPROCESSO '+
         '      AND BF.IDPESSJUR = M.IDPESSJUR '+
         '      AND BF.IDPESSOA = M.IDPESSOA '+
         '      AND BF.IDBENEFICIO = M.IDBENEFICIO '+
         '      AND BF.SEQPROPOSTA = M.SEQPROPOSTA '+
         '      AND DP.IDPESSOA = BF.IDTITULAR '+
         '      AND DP.IDTITULAR = BF.IDTITULAR '+
         '      AND NVL(BF.VALORATUAL,0) >0 '+
         '      AND NOT EXISTS (SELECT 1 FROM HSTBENEFBFCIARIO H '+
         '      WHERE H.IDPESSJUR = BF.IDPESSJUR AND '+
         '      H.IDPESSOA = BF.IDPESSOA AND '+
         '      H.IDTITULAR = BF.IDTITULAR AND '+
         '      H.MES  = '''+sAnoMesAnt+''' AND '+
         '      H.IDPLANOPREV <> BF.IDPLANOPREV)  ';
   FazQuery(qryaux,sSQL);
   AlimentaLista(qryaux, 'Concedidos');


   frmAguarde.Mostra('Gerando Estatística para População de Ativos em '+Copy(DataIni,4,2)+'/'+Copy(DataIni,7,4)+' ...');

   //Participantes Ativos CANCELADOS
   sSQL:=' SELECT DISTINCT ''81100'' CODBENEFSPC, PP.IDPESSOA, P.NOME, '' '' BENEFICIO, EL.MATRICULA, '+
         '        ''CANC'' AS TIPO '+
         ' FROM   PARTPREVPLAN PP    , PESSOA P , ELEGPATRO EL '+
         'WHERE  P.IDPESSOA = PP.IDPESSOA  '+
         'AND    EL.IDPESSJUR = PP.IDPESSJUR '+
         'AND    EL.IDPESSOA = PP.IDPESSOA '+
         'AND    TO_CHAR(PP.INSCRICAODATA, ''YYYY/MM'') <= '''+Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2)+''' '+
         'AND    PP.DATACANCELAMENTO IS NOT NULL '+
         'AND    TO_CHAR(PP.DATACANCELAMENTO, ''YYYY/MM'') = '''+Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2)+''' '+
         'AND    ((PP.DATAINICIOMANUT  IS NULL) OR (TO_CHAR(PP.DATAINICIOMANUT , ''YYYY/MM'') > '''+Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2)+''')) '+
         'AND    NOT EXISTS (SELECT 1 '+
         '               FROM PARTPREVPLAN '+
         '               WHERE IDPESSJUR = PP.IDPESSJUR '+
         '               AND IDPESSOA = PP.IDPESSOA '+
         '               AND IDPLANOPREV <> PP.IDPLANOPREV '+
         '               AND DATACANCELAMENTO IS NULL) '+
         'AND    NOT EXISTS ( SELECT 1 '+
         '                   FROM   PARTPREVPLAN ATOUTROPLANO '+
         '                   WHERE  TO_CHAR(ATOUTROPLANO.INSCRICAODATA, ''YYYY/MM'') = '+QuotedStr(Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2))+
         '                   AND    ((ATOUTROPLANO.DATACANCELAMENTO IS NULL) OR (TO_CHAR(ATOUTROPLANO.DATACANCELAMENTO, ''YYYY/MM'') > '''+Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2)+''')) '+
         '                    AND    ((ATOUTROPLANO.DATAINICIOMANUT  IS NULL) OR (TO_CHAR(ATOUTROPLANO.DATAINICIOMANUT , ''YYYY/MM'') > '''+Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2)+''')) '+
         '                    AND    NOT EXISTS ( SELECT 1 FROM HSTBENEFBFCIARIO HST '+
         '                                        WHERE  HST.MES           = '''+Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2)+''' '+
         '                                        AND    HST.MESREFERENCIA = '''+Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2)+''' '+
         '                                        AND    HST.IDPESSJUR     = ATOUTROPLANO.IDPESSJUR '+
         '                                        AND    HST.IDPLANOPREV   = ATOUTROPLANO.IDPLANOPREV '+
         '                                        AND    HST.IDTITULAR     = ATOUTROPLANO.IDPESSOA '+
         '                                        AND    HST.SEQPROPOSTA   = ATOUTROPLANO.SEQPROPOSTA ) '+
         '                    AND    ATOUTROPLANO.IDPESSJUR   = PP.IDPESSJUR '+
         '                    AND    ATOUTROPLANO.IDPLANOPREV <> PP.IDPLANOPREV '+
         '                    AND    ATOUTROPLANO.IDPESSOA    = PP.IDPESSOA '+
         '                    AND    ATOUTROPLANO.SEQPROPOSTA = PP.SEQPROPOSTA ) ';
   FazQuery(qryaux,sSQL);
   AlimentaLista(qryaux, 'Ativos Cancelados');


   sSQL:='SELECT  DISTINCT ''81100'' CODBENEFSPC,  PP.IDPESSOA, P.NOME, '' '' AS BENEFICIO, EL.MATRICULA, '+
         '        ''CONC'' AS TIPO '+
         'FROM   PARTPREVPLAN PP , ELEGPATRO EL, PESSOA P '+
         'WHERE  P.IDPESSOA = PP.IDPESSOA '+
         'AND    EL.IDPESSOA = PP.IDPESSOA '+
         'AND    EL.IDPESSJUR = PP.IDPESSJUR '+
         'AND    TO_CHAR(PP.INSCRICAODATA, ''YYYY/MM'') = '''+Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2)+''' '+
         'AND    ((PP.DATACANCELAMENTO IS NULL) OR (TO_CHAR(PP.DATACANCELAMENTO, ''YYYY/MM'') > '''+Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2)+''')) '+
         'AND    ((PP.DATAINICIOMANUT  IS NULL) OR (TO_CHAR(PP.DATAINICIOMANUT , ''YYYY/MM'') > '''+Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2)+''')) '+
         'AND    NOT EXISTS (SELECT 1 '+
         '                FROM PARTPREVPLAN '+
         '                WHERE IDPESSJUR = PP.IDPESSJUR '+
         '                AND IDPESSOA = PP.IDPESSOA '+
         '                AND IDPLANOPREV <> PP.IDPLANOPREV '+
         '                AND DATACANCELAMENTO IS NULL) '+
         'AND    NOT EXISTS ( SELECT 1 FROM HSTBENEFBFCIARIO HST '+
         '                    WHERE  HST.MES           = '''+Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2)+''' '+
         '                    AND    HST.MESREFERENCIA = '''+Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2)+''' '+
         '                    AND    HST.IDPESSJUR     = PP.IDPESSJUR '+
         '                    AND    HST.IDPLANOPREV   = PP.IDPLANOPREV '+
         '                    AND    HST.IDTITULAR     = PP.IDPESSOA '+
         '                    AND    HST.SEQPROPOSTA   = PP.SEQPROPOSTA ) ';
   FazQuery(qryaux,sSQL);
   AlimentaLista(qryaux, 'Concedidos no Mes');


   // Abrir query que traz os dados do grupo 81200 - Participantes Autopatrocinados
   //frmAguarde.Mostra('Gerando Estatística para População de Mantidos em '+Copy(DataIni,4,2)+'/'+Copy(DataIni,7,4)+' ...');
   sSQL := 'SELECT DISTINCT ''81200'' CODBENEFSPC, PP.IDPESSOA, P.NOME, '' '' AS BENEFICIO, EL.MATRICULA, '+
           '        ''CONC'' AS TIPO '+
           'FROM  PARTPREVPLAN PP, ELEGPATRO EL, PESSOA P '+
           'WHERE  P.IDPESSOA = PP.IDPESSOA '+
           '  AND    EL.IDPESSOA = PP.IDPESSOA '+
           '  AND    EL.IDPESSJUR = PP.IDPESSJUR '+
           '  AND    TO_CHAR(PP.INSCRICAODATA, ''YYYY/MM'') <= '+QuotedStr(Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2))+' '+
           '  AND    ((PP.DATACANCELAMENTO IS NULL) OR (TO_CHAR(PP.DATACANCELAMENTO,''YYYY/MM'') > '+QuotedStr(Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2))+')) '+
           '  AND    (PP.DATAINICIOMANUT  IS NOT NULL) '+
           '  AND    TO_CHAR(PP.DATAINICIOMANUT , ''YYYY/MM'') < '+QuotedStr(Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2))+' '+
           '  AND    NOT EXISTS ( SELECT 1 FROM HSTBENEFBFCIARIO HST '+
           '                  WHERE  HST.MES           = '+QuotedStr(Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2))+' '+
           '                  AND    HST.MESREFERENCIA = '+QuotedStr(Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2))+' '+
           '                  AND    HST.IDPESSJUR     = PP.IDPESSJUR '+
           '                  AND    HST.IDPLANOPREV   = PP.IDPLANOPREV '+
           '                  AND    HST.IDTITULAR     = PP.IDPESSOA '+
           '                  AND    HST.SEQPROPOSTA   = PP.SEQPROPOSTA ) '+
           'AND    EXISTS (SELECT 1 FROM EVENTOSPREV EV, EVENTOGERADOR EG '+
           '             WHERE  EG.FLGINTERNO = ''DM'''+
           '             AND    EV.IDEVENTOGERADOR = EG.IDEVENTOGERADOR '+
           '             AND    EV.IDPESSJUR = PP.IDPESSJUR '+
           '             AND    EV.IDPESSOA  = PP.IDPESSOA  '+
           '             AND    TO_CHAR(EV.DATAREGISTRO, ''YYYY/MM'') = '+QuotedStr(Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2))+')';
   FazQuery(qryaux,sSQL);
   AlimentaLista(qryaux, 'AutoPatrocinados');

   // Grupo 84000
   sAnoMesAtual := Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2);
   sSQL := 'SELECT DISTINCT  ''84100'' CODBENEFSPC, ''CANC'' AS TIPO, DP.IDPESSOA, P.NOME, DP.MATRICULA, '+
           '  '' '' AS BENEFICIO '+
           '     FROM   PESSOA P, DEPENTIT DP,              '+
           '           (SELECT PP.IDPESSOA                  '+
           '            FROM   PARTPREVPLAN PP              '+
           '            WHERE  TO_CHAR(PP.INSCRICAODATA, ''YYYY/MM'') <= '+QuotedStr(sAnoMesAtual)+' '+
           '            AND    (TO_CHAR(PP.DATACANCELAMENTO, ''YYYY/MM'') = '+QuotedStr(sAnoMesAtual)+')  '+
           '            AND         ((PP.DATAINICIOMANUT  IS NULL) OR (TO_CHAR(PP.DATAINICIOMANUT , ''YYYY/MM'') > '+QuotedStr(sAnoMesAtual)+')) '+
           '            AND    NOT EXISTS (SELECT 1                                        '+
           '                            FROM PARTPREVPLAN                                  '+
           '                            WHERE IDPESSJUR = PP.IDPESSJUR                     '+
           '                            AND IDPESSOA = PP.IDPESSOA                         '+
           '                            AND IDPLANOPREV <> PP.IDPLANOPREV                  '+
           '                            AND DATACANCELAMENTO IS NULL)                      '+
           '            AND    NOT EXISTS ( SELECT 1 FROM HSTBENEFBFCIARIO HST             '+
           '                                WHERE  HST.MES           = '+QuotedStr(sAnoMesAtual)+' '+
           '                                AND    HST.MESREFERENCIA = '+QuotedStr(sAnoMesAtual)+' '+
           '                                AND    HST.IDPESSJUR     = PP.IDPESSJUR        '+
           '                                AND    HST.IDPLANOPREV   = PP.IDPLANOPREV      '+
           '                                AND    HST.IDTITULAR     = PP.IDPESSOA         '+
           '                                AND    HST.SEQPROPOSTA   = PP.SEQPROPOSTA ) ) ATIVOS '+
           '     WHERE DP.IDTITULAR = ATIVOS.IDPESSOA                   '+
           '     AND   DP.IDPESSOA = P.IDPESSOA                         '+
           '     AND   ((DP.FLGDESIGNADO = 1) OR (DP.FLGDEPLEGAL = 1))  '+
           '     AND   DP.FLGCONTAIMPOSTOR = 1 /*NOVO*/                 '+
           '     AND   TO_CHAR(DP.DATACADASTRO,''YYYY/MM'') <= '+QuotedStr(sAnoMesAtual)+' '+
           'UNION ALL '+
           'SELECT DISTINCT  ''84100'' CODBENEFSPC, ''CONC'' AS TIPO, DP.IDPESSOA, P.NOME, DP.MATRICULA, '+
           '  '' '' AS BENEFICIO '+
           '     FROM   PESSOA P, DEPENTIT DP,                          '+
           '           (SELECT PP.IDPESSOA                              '+
           '            FROM   PARTPREVPLAN PP                          '+
           '            WHERE  TO_CHAR(PP.INSCRICAODATA, ''YYYY/MM'') = '+QuotedStr(sAnoMesAtual)+' '+
           '            AND    ((PP.DATACANCELAMENTO IS NULL) OR (TO_CHAR(PP.DATACANCELAMENTO, ''YYYY/MM'') > '+QuotedStr(sAnoMesAtual)+')) '+
           '            AND    ((PP.DATAINICIOMANUT  IS NULL) OR (TO_CHAR(PP.DATAINICIOMANUT , ''YYYY/MM'') > '+QuotedStr(sAnoMesAtual)+')) '+
           '            AND    NOT EXISTS (SELECT 1                                        '+
           '                            FROM PARTPREVPLAN                                  '+
           '                            WHERE IDPESSJUR = PP.IDPESSJUR                     '+
           '                            AND IDPESSOA = PP.IDPESSOA                         '+
           '                            AND IDPLANOPREV <> PP.IDPLANOPREV                  '+
           '                            AND DATACANCELAMENTO IS NULL)                      '+
           '            AND    NOT EXISTS ( SELECT 1 FROM HSTBENEFBFCIARIO HST             '+
           '                                WHERE  HST.MES           = '+QuotedStr(sAnoMesAtual)+' '+
           '                                AND    HST.MESREFERENCIA = '+QuotedStr(sAnoMesAtual)+' '+
           '                                AND    HST.IDPESSJUR     = PP.IDPESSJUR        '+
           '                                AND    HST.IDPLANOPREV   = PP.IDPLANOPREV      '+
           '                                AND    HST.IDTITULAR     = PP.IDPESSOA         '+
           '                                AND    HST.SEQPROPOSTA   = PP.SEQPROPOSTA ) ) ATIVOS '+
           '     WHERE DP.IDTITULAR = ATIVOS.IDPESSOA                  '+
           '     AND   DP.IDPESSOA = P.IDPESSOA                        ';
   FazQuery(qryaux,sSQL);
   AlimentaLista(qryaux, 'Designados');

   { DESIGNADOS ASSISTIDOS }
   sAnoMesAtual := Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2);
   sSQL := 'SELECT DISTINCT  ''84200'' CODBENEFSPC, ''CONC'' AS TIPO, DP.IDPESSOA, P.NOME, DP.MATRICULA, '+
           '  '' '' AS BENEFICIO '+
           'FROM DEPENTIT DP, PESSOA P                                         '+
           'WHERE /*TO_CHAR(DP.DATACADASTRO,''YYYY/MM'') = '+QuotedStr(sAnoMesAtual)+'*/ '+
           'DP.IDPESSOA = P.IDPESSOA '+
           'AND EXISTS (SELECT 1 FROM HSTBENEFBFCIARIO                         '+
           '            WHERE IDTITULAR = DP.IDTITULAR AND                     '+
           '            IDBENEFICIO IN (SELECT IDBENEFICIO FROM BENEFICIO      '+
           '                            WHERE ((CODBENEFSPC <= ''11800'') OR   '+
           '                            (IDREGRALINHASPC IS NOT NULL)) AND FLGRESGATE = 0)       '+
           '            AND MESREFERENCIA = '+QuotedStr(sAnoMesAtual)+')       '+
           'AND NOT EXISTS (SELECT 1 FROM HSTBENEFBFCIARIO                     '+
           '            WHERE IDTITULAR = DP.IDTITULAR AND                     '+
           '            IDBENEFICIO IN (SELECT IDBENEFICIO FROM BENEFICIO      '+
           '                            WHERE ((CODBENEFSPC <= ''11800'') OR   '+
           '                            (IDREGRALINHASPC IS NOT NULL)) AND FLGRESGATE = 0)  '+
           '            AND MESREFERENCIA < '+QuotedStr(sAnoMesAtual)+')       '+
           'AND NOT EXISTS (SELECT 1 FROM HSTBENEFBFCIARIO                     '+
           '                WHERE IDTITULAR = DP.IDTITULAR AND                 '+
           '                IDPESSOA = DP.IDPESSOA AND                         '+
           '                IDBENEFICIO IN (SELECT IDBENEFICIO FROM BENEFICIO  '+
           '                                WHERE ((CODBENEFSPC <= ''11800'') OR '+
           '                                (IDREGRALINHASPC IS NOT NULL)) AND FLGRESGATE = 0 )) '+
           'UNION ALL                                             '+
           'SELECT DISTINCT  ''84200'' CODBENEFSPC, ''CANC'' AS TIPO, DP.IDPESSOA, P.NOME, DP.MATRICULA, '+
           '  B.NOME AS BENEFICIO '+
           'FROM BENEFBFCIARIO PENSAO, BENEFICIO B , MOVBENEF M , '+
           'DEPENTIT DP, PESSOA P                               '+
           'WHERE                                               '+
           ' DP.IDPESSOA = P.IDPESSOA AND'+
           ' DP.IDPESSOA = PENSAO.IDPESSOA AND                   '+
           ' DP.IDTITULAR = PENSAO.IDTITULAR AND                 '+
           ' M.IDLOTEMOV IN (SELECT IDLOTE FROM  CTRLINTERFACE   '+
           '           	     WHERE FLGCONCESSAO = 1 AND          '+
           '	             MESREFERENCIA = '+QuotedStr(sAnoMesAtual)+' )'+
           ' AND     M.TIPOMOV IN (0,1,7)                        '+
           ' AND     M.IDMOVBENEF = (SELECT MAX(IDMOVBENEF)      '+
           '                         FROM MOVBENEF '+
           '                         WHERE IDPESSJUR  = M.IDPESSJUR '+
           '                            AND IDPESSOA  = M.IDPESSOA  '+
           '                            AND IDTITULAR = M.IDTITULAR '+
           '                            AND IDBENEFICIO      = M.IDBENEFICIO AND TIPOMOV  <> 13) '+
           ' AND PENSAO.IDBENEFICIO    = M.IDBENEFICIO    '+
           ' AND PENSAO.IDTITULAR      = M.IDTITULAR      '+
           ' AND PENSAO.IDPESSOA       = M.IDPESSOA       '+
           ' AND PENSAO.NUMEROPROCESSO = M.NUMEROPROCESSO '+
           ' AND PENSAO.SEQPROPOSTA    = M.SEQPROPOSTA    '+
           ' AND NVL(PENSAO.VALORATUAL,0) > 0             '+
           ' AND B.IDBENEFICIO = PENSAO.IDBENEFICIO   '+
           ' AND B.CODBENEFSPC IN (''21000'',''21100'',''21200'') ';
   FazQuery(qryaux,sSQL);
   AlimentaLista(qryaux, 'Designados Assistidos');



   qryPensao.Close;
   qryPensao.SQL.Clear;
   qryPensao.SQL.Add(' SELECT DISTINCT BF.NUMEROPROCESSO, BF.IDPLANOPREV, BF.IDTITULAR, BF.IDPESSJUR, '+
                     ' ''CONC'' AS TIPO, P.NOME, DP.MATRICULA, B.NOME AS BENEFICIO, '+
                     ' BF.IDBENEFICIO, BF.IDPESSOA, BF.SEQPROPOSTA, BF.IDSITBENEFICIO, '+

                     ' BF.DATAFINAL, BF.DATAINICIO , BF.DATAINICIOFUND, B.IDREGRALINHASPC , PP.INSCRICAODATA,  '+
                     ' NVL(BF.VALORBASE1,0) VALORBASE1 , NVL(BF.VALORBASE2,0) VALORBASE2, NVL(BF.VALORBASE3,0) VALORBASE3, '+
                     ' NVL(B.FLGRESGATE,0) FLGRESGATE'+
                     ' FROM    BENEFBFCIARIO BF, BENEFICIO B,  PARTPREVPLAN PP ,  MOVBENEF M, PESSOA P, DEPENTIT DP  '+
                     ' WHERE '+
                     ' BF.IDPESSOA  = P.IDPESSOA   AND '+
                     ' BF.IDTITULAR = DP.IDTITULAR AND '+
                     ' BF.IDPESSOA  = DP.IDPESSOA  AND '+
                     ' M.IDLOTEMOV IN (SELECT IDLOTE FROM  CTRLINTERFACE '+
                     '                 WHERE FLGCONCESSAO = 1 AND '+
                     '                 MESREFERENCIA = '''+Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2)+''' ) '+
                     ' AND     M.TIPOMOV IN (0,1,7,4) '+
                     ' AND     M.IDMOVBENEF = (SELECT MAX(IDMOVBENEF) FROM MOVBENEF WHERE IDPESSJUR = M.IDPESSJUR AND IDPESSOA = M.IDPESSOA AND IDTITULAR = M.IDTITULAR AND IDBENEFICIO = M.IDBENEFICIO AND TIPOMOV  <> 13) '+
                     ' AND     M.IDBENEFICIO = BF.IDBENEFICIO '+
                     '      AND NOT EXISTS (SELECT 1 FROM HSTBENEFBFCIARIO H '+
                     '      WHERE H.IDPESSJUR = BF.IDPESSJUR AND '+
                     '      H.IDPESSOA = BF.IDPESSOA AND '+
                     '      H.IDTITULAR = BF.IDTITULAR AND '+
                     '      H.MES  = '''+sAnoMesAnt+''' AND '+
                     '      H.IDPLANOPREV <> BF.IDPLANOPREV) '+
                     ' AND     BF.IDBENEFICIO = M.IDBENEFICIO '+
                     ' AND     BF.IDTITULAR = M.IDTITULAR '+
                     ' AND     BF.IDPESSOA = M.IDPESSOA '+
                     ' AND     BF.NUMEROPROCESSO = M.NUMEROPROCESSO '+
                     ' AND     BF.SEQPROPOSTA = M.SEQPROPOSTA '+
                     ' AND     B.IDBENEFICIO           = BF.IDBENEFICIO        '+
                     ' AND     B.CODBENEFSPC           IS NULL               '+
                     ' AND     B.IDREGRALINHASPC       IS NOT NULL           '+
                     ' AND     PP.IDPESSJUR = BF.IDPESSJUR '+
                     ' AND     PP.IDPLANOPREV = BF.IDPLANOPREV '+
                     ' AND     PP.IDPESSOA = BF.IDTITULAR ');
   qryPensao.Open;
   qryPensao.First;


   qryBenefRef.Open;  
   while not(qrypensao.EOF) do
   begin
      qryaux.close;
      qryaux.SQL.text :='SELECT FLGINTERNO, IDSITPART '+ 
                        'FROM SITPART,(SELECT IDSITPARTATUAL '+
                        '              FROM EVENTOSPREV '+
                        '              WHERE IDPESSOA = '+qrypensao.FieldByName('IDTITULAR').AsString+' '+
                        '                    AND IDSITPARTATUAL IS NOT NULL '+
                        '                    ORDER BY IDEVENTOSPREV DESC) '+
                        'WHERE IDSITPART = IDSITPARTATUAL AND '+
                        '      ROWNUM <= 1 ';
      qryaux.open;

      if qryaux.isempty then
      sFlgInterno := 'AT'
      else
      begin
         sFlgInterno := qryaux.FieldByName('FLGINTERNO').AsString;
         sIdSitPart := qryaux.FieldByName('IDSITPART').AsString;
      end;


      qryaux.close;
      qryaux.SQL.text := 'SELECT BF.IDBENEFICIO '+
                         'FROM BENEFBFCIARIO BF , BENEFPLANPREV BP '+
                         'WHERE BF.IDPESSOA      = '+qrypensao.FieldByName('IDTITULAR').AsString+' '+
                         '      AND BF.IDTITULAR = '+qrypensao.FieldByName('IDTITULAR').AsString+' '+
                         '      AND BF.IDPESSJUR = '+qrypensao.FieldByName('IDPESSJUR').AsString+' '+
                         '      AND BP.FLGREFERENCIA = 1 '+
                         '      AND BP.IDBENEFICIO = BF.IDBENEFICIO '+
                         '      AND BP.IDPLANOPREV = BF.IDPLANOPREV ';
      qryaux.open;

      if qryaux.isempty then
           sIdBenefInss := ' '
      else sIdBenefInss := qryaux.FieldByName('IDBENEFICIO').AsString;



      sSQL := ' SELECT '+qrypensao.FieldByName('NUMEROPROCESSO').AsString+' NUMEROPROCESSO, '+
              ' '+qrypensao.FieldByName('IDPLANOPREV').AsString+' IDPLANOPREV, '+
              ' '+qrypensao.FieldByName('IDTITULAR').AsString+' IDTITULAR, '+
              QuotedStr(qrypensao.FieldByName('NOME').AsString)+' NOME, '+
              QuotedStr(qrypensao.FieldByName('BENEFICIO').AsString)+' BENEFICIO, '+
              QuotedStr(qrypensao.FieldByName('MATRICULA').AsString)+' MATRICULA, ';


              if trim(qrypensao.FieldByName('DATAFINAL').AsString) = '' then
              sSQL := sSQL + ' ''CONC'' TIPO, '
              else if (qryPensao.FieldByName('FLGRESGATE').AsInteger = 1)
              then sSQL := sSQL + ' ''CONC'' TIPO, '
              else sSQL := sSQL + ' ''CANC'' TIPO, ';



      sSQL := sSQL + ' '+qrypensao.FieldByName('IDPESSJUR').AsString+' IDPESSJUR, '+
              ' '+qrypensao.FieldByName('IDBENEFICIO').AsString+' IDBENEFICIO, '+
              ' '+qrypensao.FieldByName('IDPESSOA').AsString+' IDPESSOA, '+
              ' '+qrypensao.FieldByName('SEQPROPOSTA').AsString+' SEQPROPOSTA, '+
              ' '+qrypensao.FieldByName('IDSITBENEFICIO').AsString+' IDSITBENEFICIO, '+

              // -----------------------------------------------------------------------------------
              ' TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', qrypensao.FieldByName('DATAFINAL').AsDateTime)) + ', ''DD/MM/YYYY'') AS DATAFINAL, ' +
              ' TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', qrypensao.FieldByName('DATAINICIO').AsDateTime)) + ', ''DD/MM/YYYY'') AS DATAINICIO, ' +
              ' TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', qrypensao.FieldByName('DATAINICIOFUND').AsDateTime)) + ', ''DD/MM/YYYY'') AS DATAINICIOFUND, ' +
              ' TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', qrypensao.FieldByName('INSCRICAODATA').AsDateTime)) + ', ''DD/MM/YYYY'') AS INSCRICAODATA, ' +

              // -----------------------------------------------------------------------------------

              ' '''+oranumero(qrypensao.FieldByName('VALORBASE1').AsString)+''' VALORBASE1, '+
              ' '''+oranumero(qrypensao.FieldByName('VALORBASE2').AsString)+''' VALORBASE2, '+
              ' '''+oranumero(qrypensao.FieldByName('VALORBASE3').AsString)+''' VALORBASE3, '+
              ' '''+sFlgInterno+''' FLGINTERNO, '''+sIdBenefInss+''' IDBENEFINSS, '''+sIdSitPart+''' IDSITPART '+
              ' FROM DUAL ';


      bErroLocal := false;
      try
         sLinha := RegraString(qryPensao.FieldByName('IDREGRALINHASPC').AsString,
                               sSQL, bErroLocal, iIdCalculo);
      except
         MsgDlg('Ocorreu um erro na execução da regra '+qrypensao.FieldByName('IDREGRALINHASPC').AsString+'','Erro em regra',mtError,[mbOk],0);
      end;

      qryAux.SQL.Clear;
      qryAux.SQL.Add(sSQL);
      qryAux.Open;

      // -------------------------------------------------------------------------------------------

      qryBenefRef.Insert;
      qryBenefRef.FieldByName('CODBENEFSPC').AsString       := sLinha;
      qryBenefRef.FieldByName('NOME').AsString              := qryAux.FieldByName('NOME').AsString;
      qryBenefRef.FieldByName('BENEFICIO').AsString         := qryAux.FieldByName('BENEFICIO').AsString;
      qryBenefRef.FieldByName('MATRICULA').AsString         := qryAux.FieldByName('MATRICULA').AsString;
      qryBenefRef.FieldByName('TIPO').AsString              := qryAux.FieldByName('TIPO').AsString;
      qryBenefRef.FieldByName('NUMEROPROCESSO').AsInteger   := qryAux.FieldByName('NUMEROPROCESSO').AsInteger;
      qryBenefRef.FieldByName('IDPLANOPREV').AsInteger      := qryAux.FieldByName('IDPLANOPREV').AsInteger;
      qryBenefRef.FieldByName('IDTITULAR').AsInteger        := qryAux.FieldByName('IDTITULAR').AsInteger;
      qryBenefRef.FieldByName('IDPESSJUR').AsInteger        := qryAux.FieldByName('IDPESSJUR').AsInteger;
      qryBenefRef.FieldByName('IDBENEFICIO').AsInteger      := qryAux.FieldByName('IDBENEFICIO').AsInteger;
      qryBenefRef.FieldByName('IDPESSOA').AsInteger         := qryAux.FieldByName('IDPESSOA').AsInteger;
      qryBenefRef.FieldByName('SEQPROPOSTA').AsInteger      := qryAux.FieldByName('SEQPROPOSTA').AsInteger;
      qryBenefRef.FieldByName('IDSITBENEFICIO').AsInteger   := qryAux.FieldByName('IDSITBENEFICIO').AsInteger;
      qryBenefRef.FieldByName('DATAFINAL').AsString         := qryAux.FieldByName('DATAFINAL').AsString;
      qryBenefRef.FieldByName('DATAINICIO').AsString        := qryAux.FieldByName('DATAINICIO').AsString;
      qryBenefRef.FieldByName('DATAINICIOFUND').AsString    := qryAux.FieldByName('DATAINICIOFUND').AsString;
      qryBenefRef.FieldByName('INSCRICAODATA').AsString     := qryAux.FieldByName('INSCRICAODATA').AsString;
      qryBenefRef.FieldByName('VALORBASE1').AsString        := qryAux.FieldByName('VALORBASE1').AsString;
      qryBenefRef.FieldByName('VALORBASE2').AsString        := qryAux.FieldByName('VALORBASE2').AsString;
      qryBenefRef.FieldByName('VALORBASE3').AsString        := qryAux.FieldByName('VALORBASE3').AsString;
      qryBenefRef.FieldByName('FLGINTERNO').AsString        := qryAux.FieldByName('FLGINTERNO').AsString;
      qryBenefRef.FieldByName('IDBENEFINSS').AsString       := qryAux.FieldByName('IDBENEFINSS').AsString;
      qryBenefRef.FieldByName('IDSITPART').AsString         := qryAux.FieldByName('IDSITPART').AsString;
      qryBenefRef.Post;

      // -------------------------------------------------------------------------------------------

      qryPensao.next;
   end; // while not(qrypensao.EOF)

   AlimentaLista(qryBenefRef, 'Beneficios de Referencia');  

   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------

   { CODIGOS 21100 E 21200 }
   qryaux.close;
   qryaux.SQL.text := ' SELECT IDBENEFICIO FROM BENEFICIO WHERE CODBENEFSPC   = ''21000'' ';
   qryaux.open;

   if qryaux.isempty then
   begin
      qryPensao.Close;
      qryPensao.SQL.Clear;
      qryPensao.SQL.Add(
           'SELECT  DISTINCT BNF.CODBENEFSPC, ''CANC'' AS TIPO, DP.IDPESSOA, P.NOME, DP.MATRICULA, '+
           '        BNF.NOME AS BENEFICIO '+
           'FROM    BENEFBFCIARIO BF, BENEFICIO BNF, PESSOA P, DEPENTIT DP                                '+
           'WHERE   BF.IDBENEFICIO = BNF.IDBENEFICIO AND (RTRIM(BNF.CODBENEFSPC) IN (''21100'',''21200'')) AND '+
           '        BF.IDTITULAR = DP.IDTITULAR AND                                                               '+
           '        BF.IDTITULAR  = DP.IDPESSOA  AND                                                               '+
           '        BF.IDTITULAR  = P.IDPESSOA   AND                                                               '+
           '        BF.DATAFINAL     >= TO_DATE('''+DataIni+''',''DD/MM/YYYY'') AND                       '+
           '        BF.DATAFINAL     <= TO_DATE('''+DataFim+''',''DD/MM/YYYY'') AND                       '+
           '       (        (EXISTS (SELECT 1 FROM MOVBENEF M                                                    '+
           '                        WHERE  M.TIPOMOV        = 4                                                  '+
           '                        AND    M.DATAMOV        >= TO_DATE('''+DataIni+''',''DD/MM/YYYY'')           '+
           '                        AND    M.DATAMOV        <= TO_DATE('''+DataFim+''',''DD/MM/YYYY'')           '+
           '                        AND    M.IDPLANOPREV    = BF.IDPLANOPREV                                     '+
           '                        AND    M.IDBENEFICIO    = BF.IDBENEFICIO                                     '+
           '                        AND    M.NUMEROPROCESSO = BF.NUMEROPROCESSO                                  '+
           '                        AND    M.IDPESSJUR      = BF.IDPESSJUR                                       '+
           '                        AND    M.IDTITULAR      = BF.IDTITULAR                                       '+
           '                        AND    M.IDPLANOORIGEM  = BF.IDPLANOORIGEM                                   '+
           '                        AND    M.IDPESSOA       = BF.IDPESSOA                                        '+
           '                        AND    M.SEQPROPOSTA    = BF.SEQPROPOSTA )                                   '+
           '              )                                                                                      '+
           '       OR                                                                                            '+
           '              (  (EXISTS (SELECT 1 FROM HSTBENEFBFCIARIO H                                           '+
           '                        WHERE  H.MES            = '''+sAnoMesAnt+'''                                 '+
           '                        AND    H.IDPLANOPREV    = BF.IDPLANOPREV                                     '+
           '                        AND    H.IDBENEFICIO    = BF.IDBENEFICIO                                     '+
           '                        AND    H.NUMEROPROCESSO = BF.NUMEROPROCESSO                                  '+
           '                        AND    H.IDPESSJUR      = BF.IDPESSJUR                                       '+
           '                        AND    H.IDTITULAR      = BF.IDTITULAR                                       '+
           '                        AND    H.IDPLANOORIGEM  = BF.IDPLANOORIGEM                                   '+
           '                        AND    H.IDPESSOA       = BF.IDPESSOA                                        '+
           '                        AND    H.SEQPROPOSTA    = BF.SEQPROPOSTA ) ) AND                             '+
           '                 NOT ( EXISTS (SELECT 1 FROM HSTBENEFBFCIARIO H                                      '+
           '                        WHERE  H.MES            = '''+Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2)+'''    '+
           '                        AND    H.IDPLANOPREV    = BF.IDPLANOPREV                                     '+
           '                        AND    H.IDBENEFICIO    = BF.IDBENEFICIO                                     '+
           '                        AND    H.NUMEROPROCESSO = BF.NUMEROPROCESSO                                  '+
           '                        AND    H.IDPESSJUR      = BF.IDPESSJUR                                       '+
           '                        AND    H.IDTITULAR      = BF.IDTITULAR                                       '+
           '                        AND    H.IDPLANOORIGEM  = BF.IDPLANOORIGEM                                   '+
           '                        AND    H.IDPESSOA       = BF.IDPESSOA                                        '+
           '                        AND    H.SEQPROPOSTA    = BF.SEQPROPOSTA ) )                                 '+
           '              )                                                                                      '+
           '       )                                                                                             '+
           'UNION ALL                                                                                           '+
           'SELECT DISTINCT B.CODBENEFSPC, ''CONC'' AS TIPO, DP.IDPESSOA, P.NOME, DP.MATRICULA, '+
           '       B.NOME AS BENEFICIO '+
           'FROM    MOVBENEF M, BENEFICIO B, BENEFBFCIARIO BF , PESSOA P, DEPENTIT DP '+
           'WHERE BF.IDBENEFICIO = B.IDBENEFICIO AND (RTRIM(B.CODBENEFSPC) IN (''21100'',''21200'')) AND '+
           '      BF.IDTITULAR = DP.IDTITULAR AND '+
           '      BF.IDTITULAR  = DP.IDPESSOA  AND '+
           '      BF.IDTITULAR  = P.IDPESSOA   AND '+
           '      M.IDLOTEMOV IN (SELECT IDLOTE FROM  CTRLINTERFACE '+
           '                      WHERE FLGCONCESSAO = 1 AND '+
           '                      MESREFERENCIA = '''+Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2)+''' ) '+
           '      AND M.TIPOMOV IN (0,1,7) '+

           '      AND M.IDMOVBENEF = (SELECT MAX(IDMOVBENEF) FROM MOVBENEF WHERE IDPESSJUR = M.IDPESSJUR AND IDPESSOA = M.IDPESSOA AND IDTITULAR = M.IDTITULAR AND IDBENEFICIO = M.IDBENEFICIO AND TIPOMOV  <> 13) '+

           '      AND B.IDBENEFICIO = M.IDBENEFICIO '+
           '      AND B.CODBENEFSPC IS NOT NULL '+
           '      AND BF.NUMEROPROCESSO = M.NUMEROPROCESSO '+
           '      AND BF.IDPESSJUR = M.IDPESSJUR '+
           '      AND BF.IDPESSOA = M.IDPESSOA '+
           '      AND BF.IDBENEFICIO = M.IDBENEFICIO '+
           '      AND BF.SEQPROPOSTA = M.SEQPROPOSTA '+
           '      AND BF.VALORATUAL >0 '+
           '      AND NOT EXISTS ( '+
           '      SELECT   1 '+
           '      FROM  HSTBENEFBFCIARIO H '+
           '      WHERE H.IDPESSJUR = BF.IDPESSJUR '+
           '      AND       H.IDPESSOA = BF.IDPESSOA '+
           '      AND       H.IDTITULAR = BF.IDTITULAR '+
           '      AND       H.MES  = '''+sAnoMesAnt+'''  '+
           '      AND       H.IDPLANOPREV <> BF.IDPLANOPREV)  ');

      qryPensao.Open;
      AlimentaLista(qryPensao, 'Cancelados e Concedidos');
   end;



   { GRUPO 91000 }
   { Abrir query que traz os dados do grupo 91000 - Beneficiarios de Pensao         }
   { O grupo 21000 é o total por titular e o grupo 91000 é o total de beneficiarios }
   qryPensaoPorBeneficiario.Close;
   qryPensaoPorBeneficiario.SQL.Clear;
   qryPensaoPorBeneficiario.SQL.Add(' SELECT  B.CODBENEFSPC, ''CONC'' AS TIPO, DP.IDPESSOA, P.NOME, DP.MATRICULA, '+
                                    '         B.NOME AS BENEFICIO '+
                                    ' FROM    BENEFBFCIARIO PENSAO, BENEFICIO B , MOVBENEF M, PESSOA P, DEPENTIT DP                       '+
                                    ' WHERE PENSAO.IDBENEFICIO = B.IDBENEFICIO AND (RTRIM(B.CODBENEFSPC) IN (''21100'',''21200'')) AND '+
                                    '       PENSAO.IDTITULAR = DP.IDTITULAR AND '+
                                    '       PENSAO.IDPESSOA  = DP.IDPESSOA  AND '+
                                    '       PENSAO.IDPESSOA  = P.IDPESSOA   AND '+
                                    ' M.IDLOTEMOV IN (SELECT IDLOTE FROM  CTRLINTERFACE '+
                                    '                 WHERE FLGCONCESSAO = 1 AND '+
                                    '                 MESREFERENCIA = '''+Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2)+''' ) '+
                                    ' AND     M.TIPOMOV IN (0,1,7) '+
                                    ' AND     M.IDMOVBENEF = (SELECT MAX(IDMOVBENEF) FROM MOVBENEF WHERE IDPESSJUR = M.IDPESSJUR AND IDPESSOA = M.IDPESSOA AND IDTITULAR = M.IDTITULAR AND IDBENEFICIO = M.IDBENEFICIO AND TIPOMOV  <> 13) '+
                                    ' AND     PENSAO.IDBENEFICIO = M.IDBENEFICIO '+
                                    ' AND     PENSAO.IDTITULAR = M.IDTITULAR '+
                                    ' AND     PENSAO.IDPESSOA = M.IDPESSOA '+
                                    ' AND     PENSAO.NUMEROPROCESSO = M.NUMEROPROCESSO '+
                                    ' AND     PENSAO.SEQPROPOSTA = M.SEQPROPOSTA '+
                                    ' AND     NVL(PENSAO.VALORATUAL,0) > 0 '+
                                    ' AND     B.IDBENEFICIO           = PENSAO.IDBENEFICIO  '+
                                    ' AND     B.CODBENEFSPC     IN (''21000'',''21100'',''21200'') '+
                                    ' UNION ALL   '+
                                    ' /* BENEFICIOS CANCELADOS = DATA DE FIM ENTRE PARAMETROS DE INICIO E FIM */                          '+
                                    'SELECT  B.CODBENEFSPC, ''CANC'' AS TIPO, DP.IDPESSOA, P.NOME, DP.MATRICULA, '+
                                    '        B.NOME AS BENEFICIO  '+
                                    ' FROM    BENEFBFCIARIO BF, BENEFICIO B, PESSOA P, DEPENTIT DP '+
                                    ' WHERE BF.IDBENEFICIO = B.IDBENEFICIO AND (RTRIM(B.CODBENEFSPC) IN (''21100'',''21200'')) AND '+
                                    '       BF.IDTITULAR = DP.IDTITULAR AND '+
                                    '       BF.IDPESSOA  = DP.IDPESSOA  AND '+
                                    '       BF.IDPESSOA  = P.IDPESSOA   AND '+
                                    '       B.IDBENEFICIO           = BF.IDBENEFICIO                                                '+
                                    '       AND     B.CODBENEFSPC     IN (''21000'',''21100'',''21200'')                     '+
                                    ' AND     BF.DATAFINAL     >= TO_DATE('''+DataIni+''',''DD/MM/YYYY'') AND                       '+
                                    '         BF.DATAFINAL     <= TO_DATE('''+DataFim+''',''DD/MM/YYYY'') AND                       '+
                                    '       (        (EXISTS (SELECT 1 FROM MOVBENEF M                                                    '+
                                    '                        WHERE  M.TIPOMOV        = 4                                                  '+
                                    '                        AND    M.DATAMOV        >= TO_DATE('''+DataIni+''',''DD/MM/YYYY'')           '+
                                    '                        AND    M.DATAMOV        <= TO_DATE('''+DataFim+''',''DD/MM/YYYY'')           '+
                                    '                        AND    M.IDPLANOPREV    = BF.IDPLANOPREV                                     '+
                                    '                        AND    M.IDBENEFICIO    = BF.IDBENEFICIO                                     '+
                                    '                        AND    M.NUMEROPROCESSO = BF.NUMEROPROCESSO                                  '+
                                    '                        AND    M.IDPESSJUR      = BF.IDPESSJUR                                       '+
                                    '                        AND    M.IDTITULAR      = BF.IDTITULAR                                       '+
                                    '                        AND    M.IDPLANOORIGEM  = BF.IDPLANOORIGEM                                   '+
                                    '                        AND    M.IDPESSOA       = BF.IDPESSOA                                        '+
                                    '                        AND    M.SEQPROPOSTA    = BF.SEQPROPOSTA )                                   '+
                                    '              )                                                                                      '+
                                    '       OR                                                                                            '+
                                    '              (  (EXISTS (SELECT 1 FROM HSTBENEFBFCIARIO H                                           '+
                                    '                        WHERE  H.MES            = '''+sAnoMesAnt+'''                                 '+
                                    '                        AND    H.IDPLANOPREV    = BF.IDPLANOPREV                                     '+
                                    '                        AND    H.IDBENEFICIO    = BF.IDBENEFICIO                                     '+
                                    '                        AND    H.NUMEROPROCESSO = BF.NUMEROPROCESSO                                  '+
                                    '                        AND    H.IDPESSJUR      = BF.IDPESSJUR                                       '+
                                    '                        AND    H.IDTITULAR      = BF.IDTITULAR                                       '+
                                    '                        AND    H.IDPLANOORIGEM  = BF.IDPLANOORIGEM                                   '+
                                    '                        AND    H.IDPESSOA       = BF.IDPESSOA                                        '+
                                    '                        AND    H.SEQPROPOSTA    = BF.SEQPROPOSTA ) ) AND                             '+
                                    '                 NOT ( EXISTS (SELECT 1 FROM HSTBENEFBFCIARIO H                                      '+
                                    '                        WHERE  H.MES            = '''+Copy(DataIni,7,4)+'/'+Copy(DataIni,4,2)+'''    '+
                                    '                        AND    H.IDPLANOPREV    = BF.IDPLANOPREV                                     '+
                                    '                        AND    H.IDBENEFICIO    = BF.IDBENEFICIO                                     '+
                                    '                        AND    H.NUMEROPROCESSO = BF.NUMEROPROCESSO                                  '+
                                    '                        AND    H.IDPESSJUR      = BF.IDPESSJUR                                       '+
                                    '                        AND    H.IDTITULAR      = BF.IDTITULAR                                       '+
                                    '                        AND    H.IDPLANOORIGEM  = BF.IDPLANOORIGEM                                   '+
                                    '                        AND    H.IDPESSOA       = BF.IDPESSOA                                        '+
                                    '                        AND    H.SEQPROPOSTA    = BF.SEQPROPOSTA ) )                                 '+
                                    '              ) )                                                                                     ');

   qryPensaoPorBeneficiario.Open;
   AlimentaLista(qryPensaoPorBeneficiario, 'Beneficiarios de Pensao', '91000');
   Result := True;

end;



procedure TfrmEstatisticaSPCNOVO.AlimentaLista(qryAposentadorias  : TwwQuery;
                                               psNomePlan         : String;
                                               psCodigo           : String = '');

var
  sAux      : String;
  sNomePlan : String;
  iContador : Integer;
  iPlanilha : Integer;
begin
  sAux := psCodigo;

  if (ExcelApp.Workbooks[1].Worksheets[1].Name <> 'Plan1' ) and
     (ExcelApp.Workbooks[1].Worksheets[1].Name <> 'Sheet1') then
  begin

    ExcelApp.Sheets.Add();
  end;

  ExcelApp.Workbooks[1].Worksheets[1].Name    := psNomePlan;

  ExcelApp.WorkSheets[psNomePlan].Cells[1, 1] := 'COD';
  ExcelApp.WorkSheets[psNomePlan].Cells[1, 2] := 'MATRICULA';
  ExcelApp.WorkSheets[psNomePlan].Cells[1, 3] := 'NOME';
  ExcelApp.WorkSheets[psNomePlan].Cells[1, 4] := 'BENEFICIO';
  ExcelApp.WorkSheets[psNomePlan].Cells[1, 5] := 'CONC/CANC';

  iLinhaLista      := 1;


  iContador := 0;
  iPlanilha := 1;
  sNomePlan := psNomePlan;

  qryAposentadorias.First;
  while not(qryAposentadorias.EOF) do
  begin
    inc(iContador);

    // ---------------------------------------------------------------------------------------------
    // A cada 30000 linhas, cria uma planilha nova
    if iContador mod 30000 = 0 then
    begin
      inc(iPlanilha);

      ExcelApp.Columns.AutoFit;
      ExcelApp.Sheets.Add();

      sNomePlan := psNomePlan + IntToStr(iPlanilha);

      ExcelApp.Workbooks[1].Worksheets[1].Name    := sNomePlan;

      ExcelApp.WorkSheets[sNomePlan].Cells[1, 1]  := 'COD';
      ExcelApp.WorkSheets[sNomePlan].Cells[1, 2]  := 'MATRICULA';
      ExcelApp.WorkSheets[sNomePlan].Cells[1, 3]  := 'NOME';
      ExcelApp.WorkSheets[sNomePlan].Cells[1, 4]  := 'BENEFICIO';
      ExcelApp.WorkSheets[sNomePlan].Cells[1, 5]  := 'CONC/CANC';

      iLinhaLista := 1;
    end;
    // ---------------------------------------------------------------------------------------------

    if psCodigo = '' then sAux := qryAposentadorias.FieldByName('CODBENEFSPC').AsString;

    inc(iLinhaLista);

    ExcelApp.WorkSheets[sNomePlan].Cells[iLinhaLista, 1]  := sAux;
    ExcelApp.WorkSheets[sNomePlan].Cells[iLinhaLista, 2]  := qryAposentadorias.FieldByName('MATRICULA').AsString;
    ExcelApp.WorkSheets[sNomePlan].Cells[iLinhaLista, 3]  := qryAposentadorias.FieldByName('NOME').AsString;
    ExcelApp.WorkSheets[sNomePlan].Cells[iLinhaLista, 4]  := qryAposentadorias.FieldByName('BENEFICIO').AsString;
    ExcelApp.WorkSheets[sNomePlan].Cells[iLinhaLista, 5]  := qryAposentadorias.FieldByName('TIPO').AsString;

    qryAposentadorias.Next;
  end;

  ExcelApp.Columns.AutoFit; 
end;



end.
