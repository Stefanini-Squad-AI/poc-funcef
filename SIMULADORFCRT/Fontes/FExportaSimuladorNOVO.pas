// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Gleyber
// Data        : 14/11/2005
// Rotina      : GeraExportacaoATIVOS, GeraExportacaoASSISTIDOS e GeraExportacaoPENSIONISTAS
// Alteração   : Inclusão de dois campos a mais: MATRICULA ANTIGA e CPF
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 02/08/2005
// Alteração   : 1) Alteração nas regras
// Autor(a)    : Augusto
// Data        : 28/07/2005
// Alteração   : 1) Alteração nas regras 
// Data        : 25/07/2005
// Alteração   : 1) Acerto no filtro por matricula
// Autor(a)    : Augusto
// Data        : 08/07/2005
// Alteração   : 1) Aletaração nas regras
// Data        : 04/07/2005
// Rotina      : Varias
// Alteração   : 1) Permitir fitros "includentes e excludentes"
//               2) Exportar Periodo de Migração
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 24/06/2005
// Rotina      : Varias
// Alteração   : Comentada as rubricas e contribuições extraordinárias nas pesquisas
//------------------------------------------------------------------------------
// Data        : 23/06/2005
// Pendencia   : 19470
// Rotina      : Varias
// Alteração   : Novo Campo para exportar com a contribuição extra
//------------------------------------------------------------------------------
unit FExportaSimuladorNOVO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, 
  wwdbdatetimepicker, CMDateTimePicker, ComCtrls, URegra;

type
  TfrmExportaSimuladorNOVO = class(TfrmSairAjuda)
    SaveDlg: TSaveDialog;
    ToolbarSep971: TToolbarSep97;
    bbtnExportar: TBitBtn;
    qry: TwwQuery;
    qryAux: TwwQuery;
    regraAPrev: TRegra;
    qryRegra: TwwQuery;
    PageControl1: TPageControl;
    tbsExportacao: TTabSheet;
    tbsLogErros: TTabSheet;
    lblProcessando: TLabel;
    memErros: TMemo;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    sbtnAtivos: TSpeedButton;
    Label2: TLabel;
    sbtnAssistidos: TSpeedButton;
    Label3: TLabel;
    sbtnPensionistas: TSpeedButton;
    edArqATIVOS: TEdit;
    edArqASSISTIDOS: TEdit;
    edArqPENSIONISTAS: TEdit;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    dtDataREF: TCMDateTimePicker;
    rgrpParticip: TRadioGroup;
    tbsSelParticip: TTabSheet;
    memMatriculas: TMemo;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    rgPeriodo: TRadioGroup;
    RgFiltro: TRadioGroup;
    procedure sbtnAtivosClick(Sender: TObject);
    procedure sbtnAssistidosClick(Sender: TObject);
    procedure sbtnPensionistasClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnExportarClick(Sender: TObject);
    procedure rgrpParticipClick(Sender: TObject);
  private
    { Private declarations }
    iNumDep : word;
    cCodProcesso : char; // A - ATIVOS, S - ASSISTIDOS, P - PENSIONISTAS
    sTipoParticipante : string;
    sMatriculas : string;
  public
    { Public declarations }
    function  OraNumero(sNumero : string):string;
    function  ClienteNumero(sNumero : string):string;
    function  TiraPonto(sNumero : string ) : string;
    function  ColocaZeros(Codigo:string;Tam:byte):string;
    function  ColocaZerosDireita( sPalavra : string; iTam : byte ) : string;
    function  PreparaStr(Codigo : string; Tam : byte) : string;
    function  ExecutaRegraFCRT(piNumRegra : longint) : string;
    function  RegraString ( sNumRegra, sSQL : string; var bErro : boolean; var piIdCalculo : longInt ) : string;
    function  AnoMesAnterior(iMes, iAno : integer) : string;
    function  SAnoMesAnterior(sAnoMes : string   ) : string;

    function  MontaDadosDependente    : string;
    function  BuscaTaxaJoia           : string;
    function  BuscaRemuneracao        : string;
    function  BuscaSalParticipacao    : string;
    function  BuscaContribuicao       : string;
    function  BuscaJoia               : string;
    function  BuscaReservaTributavel : string;
    function  BuscaReservaNAOTributavel : string;


    function  BuscaSuplementacaoBruta : string;
    function  BuscaDataInicioAuxDoenca : string;
    procedure GeraExportacaoATIVOS;
    procedure GeraExportacaoASSISTIDOS;
    procedure GeraExportacaoPENSIONISTAS;

    function  ProcMatAntiga(sIdPessoa: String) : String; // Gleyber - 14/11/2005 - Pendência 20712
    function  ProcCPF(sIdPessoa: String): String;        // Gleyber - 14/11/2005 - Pendência 20712
  end;

var
  frmExportaSimuladorNOVO: TfrmExportaSimuladorNOVO;

implementation

uses uMensErro,UConsPart;


{$R *.DFM}

function TfrmExportaSimuladorNOVO.AnoMesAnterior(iMes, iAno : integer) : string;
var sAnoMes : string;
begin
  Result := '';
  if iMes = 1
  then begin
     sAnoMes := IntToStr(iAno-1)+'/';
     sAnoMes := sAnoMes+'12';
  end
  else begin
    sAnoMes := IntToStr(iAno)+'/';
    iMes := iMes - 1;
    if iMes <= 9
    then sAnoMes := sAnoMes+'0'+IntToStr(iMes)
    else sAnoMes := sAnoMes+IntToStr(iMes);
  end;
  Result := sAnoMes;
end;//AnoMesAnterior

function TfrmExportaSimuladorNOVO.SAnoMesAnterior(sAnoMes : string) : string;
var iAno, iMes : integer;
begin
   Result := '';
   iAno := StrToInt(Copy(sAnoMes,1,4));
   iMes := StrToInt(Copy(sAnoMes,6,2));
   Result := AnoMesAnterior(iMes,iAno);
end;

function TfrmExportaSimuladorNOVO.ColocaZerosDireita( sPalavra : string; iTam : byte ) : string;
var i, iMax : word;

begin
   sPalavra := Trim(sPalavra);

   if Length(sPalavra) >= iTam
   then begin
      Result := sPalavra;
      Exit;
   end;

   { Augusto 08/11/2005 }
   //imax := Length(sPalavra) - iTam;
   imax := iTam - Length(sPalavra);

   for i := 1 to iMax do
   begin
      sPalavra := sPalavra + '0';
   end;
   Result := sPalavra; { Augusto 08/11/2005 }
end;

function  TfrmExportaSimuladorNOVO.TiraPonto(sNumero : string ) : string;
var i : word;
    sAux : string;
begin
   sAux := '';
   for i := 1 to Length(sNumero) do
       if (Copy(sNumero,i,1) <> '.') and (Copy(sNumero,i,1) <> ',')
       then sAux := sAux + Copy(sNumero,i,1);

   Result := sAux;
end;

function TfrmExportaSimuladorNOVO.ClienteNumero(sNumero : string):string;
var i : integer;
    sResult,
    sCliente : string;
    bPrimPonto : boolean;
begin
   // CAMILLE - REFER - 23.08.1999
   if Trim(sNumero)  = ''
   then begin
      Result := '0';
      exit;
   end;

   sCliente := '';
   bPrimPonto := False;
   for i := length(Trim(sNumero)) downto 1
   do begin
     if sNumero[i] = '.'
     then begin
        if not bPrimPonto
        then begin
           sCliente := sCliente + DecimalSeparator;
           bPrimPonto := True;
        end
        else sCliente := sCliente;
     end
     else begin
        if sNumero[i] <> DecimalSeparator
        then sCliente := sCliente + sNumero[i]
        else begin
           if not bPrimPonto
           then begin
              sCliente := sCliente+DecimalSeparator;
              bPrimPonto := True;
           end
           else sCliente := sCliente;
        end;
     end;
   end;
   sResult := '';
   for i := length(sCliente) downto 1
   do begin
      sResult := sResult + sCliente[i];
   end;
   Result := sResult;
end;

function TfrmExportaSimuladorNOVO.OraNumero(sNumero : string):string;
var i : integer;
    sResult,
    sOra : string;
    bPrimPonto : boolean;
begin
   if Trim(sNumero)  = ''
   then begin
      Result := '0';
      exit;
   end;
   sOra := '';
   bPrimPonto := False;
   for i := length(Trim(sNumero)) downto 1
   do begin
     if sNumero[i] = ','
     then begin
        if not bPrimPonto
        then begin
           sOra := sOra + '.';
           bPrimPonto := True;
        end
        else sOra := sOra;
     end
     else begin
        if sNumero[i] <> '.'
        then sOra := sOra + sNumero[i]
        else begin
           if not bPrimPonto
           then begin
              sOra := sOra+'.';
              bPrimPonto := True;
           end
           else sOra := sOra;
        end;
     end;
   end;
   sResult := '';
   for i := length(sOra) downto 1
   do begin
      sResult := sResult + sOra[i];
   end;
   Result := sResult;
end;

function TfrmExportaSimuladorNOVO.RegraString ( sNumRegra, sSQL : string; var bErro : boolean; var piIdCalculo : longInt ) : string;
var cAux : char;
begin
   Result := '0';
   bErro := False;

   // Se o idcalculo for menor que zero, entao igualar a zero, pois a regra dá
   // erro se o idcalculo for menor que zero
   if piIdCalculo < 0 then piIdCalculo := 0;
   if Trim(sNumRegra) = '' then Exit;

   regraAPrev.RuleName := sNumRegra;
   qryRegra.Close;
   qryRegra.SQL.Clear;
   qryRegra.SQl.Add(sSQL);
   qryRegra.Open;
   // Se a query estiver vazia, passar uma query generica pois talvez
   // a regra nao precise de nenhum campo da query, mas precisa de uma
   // linha qualquer.
   if qryRegra.IsEmpty
   then begin
      Result := '';
      bErro  := False;
      qryRegra.Close;
      Exit;
   end;
   cAux                 := DecimalSeparator;
   regraAPrev.QueryIn   := qryRegra;
   regraAPrev.IdCalculo := piIdCalculo;
   try
      regraAPrev.Execute;
   finally
      DecimalSeparator := cAux;
   end;

   if not regraAPrev.Error
   then begin
      piIdCalculo := regraAPrev.IdCalculo;

      Result := regraAPrev.Result;
   end // if not regra.error
   else begin
      bErro := True;
      piIdCalculo := -1;
   end;

   qryRegra.Close;
end;


function  TfrmExportaSimuladorNOVO.ExecutaRegraFCRT(piNumRegra : longint) : string;
var sSQL       : string;
    iIdCalculo : longint;
    bErro      : boolean;
    sResultado : string;
    sPeriodo, sPeriodoGroup   : string; //P.RAMOS-31.05.2005-PEND.19350
begin
    Result := ' ';

    //P.RAMOS-31.05.2005-PEND.19350
    if rgPeriodo.itemindex = 0 then
      sPeriodo :='DECODE(EL.IDPESSJUR,50031,45,60)'
    else
      sPeriodo :='62';
    sPeriodoGroup := sPeriodo+ ', ';
    sPeriodo := sPeriodo + ' AS IDEVENTOGERADOR, ';
    //P.RAMOS-31.05.2005-PEND.19350-FIM

    if (Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataREF.Text),4,2) >= '2002/08') and
       ((cCodProcesso = 'P') or (cCodProcesso = 'S')) and (piNumRegra <> 1400) and (piNumRegra <> 1401)
    then begin
       if cCodProcesso = 'P'
       then begin
          sSQL := ' SELECT DISTINCT '''+Trim(dtDataREF.Text)+''' AS DATAREF,                                   '+
                  ''''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataREF.Text),4,2)+''' AS MESREFERENCIA, '+
                  '        EL.MATRICULA,   PP.REQUERIMENTODATA,                                                '+
                  sPeriodo+ //P.RAMOS-31.05.2005-PEND.19350-FIM
                  '        PP.INSCRICAODATA, PP.DTINICIOINSC, PP.INSCRICAONUMERO,                              '+
                  '        PP.IDSITPART,     EL.MATRICULA,                                                     '+
                  '        NVL(EL.TEMPOSERVCALC,0) AS TEMPOSERVCALC,                                           '+
                  '        SP.FLGINTERNO,                                                                      '+
                  '        P.NOME,PF.SEXO, PF.ESTCIVIL, PF.DATANASC,                                           '+
                  '        EL.DATAADMISSAO,                                                                    '+
                  '        BF.IDPESSJUR,   BF.IDPLANOPREV, BF.IDTITULAR,                                       '+
                  '        BF.SEQPROPOSTA, BF.IDBENEFICIO,                                                     '+
                  '        NVL(HA.IDBENEFICIO,0) AS IDBENEFABONO,                                              '+
                  '        MIN(BF.DATAINICIOFUND) AS DATAINICIO,                                               '+
                  '        MAX(DECODE(HST.VALORSRB, 0, BF.VALORSRB,                                            '+
                  '                                    DECODE(HST.VALORSRB,NULL,BF.VALORSRB,HST.VALORSRB))) AS VALORSRB, '+
                  '        MAX(DECODE(HST.VALORTOTAL, 0, BF.VALORTOTAL,                                            '+
                  '                                    DECODE(HST.VALORTOTAL,NULL,BF.VALORTOTAL,HST.VALORTOTAL))) AS VALORATUAL, '+
                  '        MAX(BF.IDPESSOA) AS IDPESSOA,                                                       '+
                  '        COUNT(DISTINCT BF.IDPESSOA) AS NUMBENEF                                             '+
                  ' FROM   PESSOA P, PESSOAFISICA PF, ELEGPATRO EL, PARTPREVPLAN PP, BENEFPLANPREV BP,         '+
                  '        BENEFBFCIARIO BF, HSTBENEFBFCIARIO HST, SITPART SP ,                                '+
                  '        ( SELECT HA.IDTITULAR, HA.IDBENEFICIO                                               '+
                  '          FROM   HSTBENEFBFCIARIO HA                                                        '+
                  '          WHERE  HA.MES           = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataREF.Text),4,2)+''''+
                  '          AND    HA.MESREFERENCIA = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataREF.Text),4,2)+''''+
                  '          AND    HA.IDBENEFICIO IN (36,71)                                                  '+
                  '          AND    HA.FLGDEVOLUCAO = 0              ) HA                                      '+
                  ' WHERE  EL.IDPESSJUR      = '+qry.FieldByName('IDPESSJUR').AsString                          +
                  ' AND    EL.IDPESSOA       = '+qry.FieldByName('IDPESSOA').AsString                           +
                  ' AND    PP.IDPESSJUR      = EL.IDPESSJUR                                                    '+
                  ' AND    PP.IDPESSOA       = EL.IDPESSOA                                                     '+
                  ' AND    P.IDPESSOA        = PP.IDPESSOA                                                     '+
                  ' AND    PF.IDPESSOA       = PP.IDPESSOA                                                     '+
                  ' AND    HST.MES           = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataREF.Text),4,2)+''''+
                  ' AND    HST.MESREFERENCIA = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataREF.Text),4,2)+''''+
                  ' AND    HST.IDBENEFICIO   IN (11,18)                                                        '+
                  ' AND    HST.IDPESSJUR     = PP.IDPESSJUR                                                    '+
                  ' AND    HST.IDPLANOPREV   = PP.IDPLANOPREV                                                  '+
                  ' AND    HST.IDTITULAR     = PP.IDPESSOA                                                     '+
                  ' AND    HST.SEQPROPOSTA   = PP.SEQPROPOSTA                                                  '+
                  ' AND    HST.FLGDEVOLUCAO  = 0                                                               '+
                  ' AND    HST.IDTITULAR     <> HST.IDPESSOA                                                   '+
                  ' AND    HA.IDTITULAR(+)   = HST.IDTITULAR                                                   '+
                  ' AND    BF.IDPESSJUR      = HST.IDPESSJUR                                                   '+
                  ' AND    BF.IDPLANOPREV    = HST.IDPLANOPREV                                                 '+
                  ' AND    BF.IDTITULAR      = HST.IDTITULAR                                                   '+
                  ' AND    BF.IDPESSOA       = HST.IDPESSOA                                                    '+
                  ' AND    BF.SEQPROPOSTA    = HST.SEQPROPOSTA                                                 '+
                  ' AND    BF.IDBENEFICIO    = HST.IDBENEFICIO                                                 '+
                  ' AND    BP.IDPLANOPREV    = HST.IDPLANOPREV                                                 '+
                  ' AND    BP.IDBENEFICIO    = HST.IDBENEFICIO                                                 '+
                  ' AND    BP.FLGREFERENCIA  = 0                                                               '+
                  ' AND    SP.IDSITPART      = PP.IDSITPART                                                    '+
                  ' GROUP BY EL.MATRICULA,   PP.REQUERIMENTODATA,                                              '+
                  sPeriodoGroup+ //P.RAMOS-31.05.2005-PEND.19350-FIM
                  '        PP.INSCRICAODATA, PP.DTINICIOINSC, PP.INSCRICAONUMERO,                              '+
                  '        PP.IDSITPART,     EL.MATRICULA,                                                     '+
                  '        EL.TEMPOSERVCALC,                                                                   '+
                  '        SP.FLGINTERNO,                                                                      '+
                  '        P.NOME,PF.SEXO, PF.ESTCIVIL, PF.DATANASC,                                           '+
                  '        EL.DATAADMISSAO,                                                                    '+
                  '        BF.IDPESSJUR,   BF.IDPLANOPREV, BF.IDTITULAR,                                       '+
                  '        BF.SEQPROPOSTA, BF.IDBENEFICIO, HA.IDBENEFICIO                                      ';
       end
       else if cCodProcesso = 'S'
       then begin // assistidos
          sSQL := ' SELECT DISTINCT '''+Trim(dtDataREF.Text)+''' AS DATAREF,                                   '+
                  ''''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataREF.Text),4,2)+''' AS MESREFERENCIA, '+
                  '        EL.MATRICULA,   PP.REQUERIMENTODATA,                                                '+
                  sPeriodo+ //P.RAMOS-31.05.2005-PEND.19350-FIM
                  '        PP.INSCRICAODATA, PP.DTINICIOINSC, PP.INSCRICAONUMERO,                              '+
                  '        PP.IDSITPART,     EL.MATRICULA,                                                     '+
                  '        NVL(EL.TEMPOSERVCALC,0) AS TEMPOSERVCALC,                                           '+
                  '        SP.FLGINTERNO,                                                                      '+
                  '        P.NOME,PF.SEXO, PF.ESTCIVIL, PF.DATANASC,                                           '+
                  '        EL.DATAADMISSAO,                                                                    '+
                  '        BF.IDPESSJUR,   BF.IDPLANOPREV, BF.IDTITULAR,                                       '+
                  '        BF.SEQPROPOSTA, BF.IDBENEFICIO,                                                     '+
                  '        BF.DATAINICIOFUND AS DATAINICIO,                                                    '+
                  '        NVL(HA.IDBENEFICIO,0) AS IDBENEFABONO,                                              '+
                  '        MAX(DECODE(HST.VALORSRB, 0, BF.VALORSRB,                                            '+
                  '                                    DECODE(HST.VALORSRB,NULL,BF.VALORSRB,HST.VALORSRB))) AS VALORSRB, '+
                  '        MAX(DECODE(HST.VALORTOTAL, 0, BF.VALORTOTAL,                                            '+
                  '                                    DECODE(HST.VALORTOTAL,NULL,BF.VALORTOTAL,HST.VALORTOTAL))) AS VALORATUAL, '+
                  '        MAX(BF.IDPESSOA) AS IDPESSOA,                                                       '+
                  '        COUNT(DISTINCT BF.IDPESSOA) AS NUMBENEF                                             '+
                  ' FROM   PESSOA P, PESSOAFISICA PF, ELEGPATRO EL, PARTPREVPLAN PP, BENEFPLANPREV BP,         '+
                  '        BENEFBFCIARIO BF, HSTBENEFBFCIARIO HST, SITPART SP,                                 '+
                  '        ( SELECT HA.IDPESSOA, HA.IDBENEFICIO                                                             '+
                  '          FROM   HSTBENEFBFCIARIO HA                                                        '+
                  '          WHERE  HA.MES           = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataREF.Text),4,2)+''''+
                  '          AND    HA.MESREFERENCIA = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataREF.Text),4,2)+''''+
                  '          AND    HA.IDBENEFICIO IN (31,33,34,35,72)                                         '+
                  '          AND    HA.FLGDEVOLUCAO = 0              )  HA                                     '+
                  ' WHERE  EL.IDPESSJUR      = '+qry.FieldByName('IDPESSJUR').AsString                          +
                  ' AND    EL.IDPESSOA       = '+qry.FieldByName('IDPESSOA').AsString                           +
                  ' AND    PP.IDPESSJUR      = EL.IDPESSJUR                                                    '+
                  ' AND    PP.IDPESSOA       = EL.IDPESSOA                                                     '+
                  ' AND    P.IDPESSOA        = PP.IDPESSOA                                                     '+
                  ' AND    PF.IDPESSOA       = PP.IDPESSOA                                                     '+
                  ' AND    HST.MES           = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataREF.Text),4,2)+''''+
                  ' AND    HST.MESREFERENCIA = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataREF.Text),4,2)+''''+
                  ' AND    HST.IDBENEFICIO IN (5,6,7,8,9,14)                           '+
                  ' AND    HST.IDPESSJUR     = PP.IDPESSJUR                                                    '+
                  ' AND    HST.IDPLANOPREV   = PP.IDPLANOPREV                                                  '+
                  ' AND    HST.IDTITULAR     = PP.IDPESSOA                                                     '+
                  ' AND    HST.SEQPROPOSTA   = PP.SEQPROPOSTA                                                  '+
                  ' AND    HST.FLGDEVOLUCAO  = 0                                                               '+
                  ' AND    HST.IDTITULAR     = HST.IDPESSOA                                                    '+
                  ' AND    HA.IDPESSOA(+)    = HST.IDPESSOA                                                    '+
                  ' AND    BF.IDPESSJUR      = HST.IDPESSJUR                                                   '+
                  ' AND    BF.IDPLANOPREV    = HST.IDPLANOPREV                                                 '+
                  ' AND    BF.IDTITULAR      = HST.IDTITULAR                                                   '+
                  ' AND    BF.IDPESSOA       = HST.IDPESSOA                                                    '+
                  ' AND    BF.SEQPROPOSTA    = HST.SEQPROPOSTA                                                 '+
                  ' AND    BF.IDBENEFICIO    = HST.IDBENEFICIO                                                 '+
                  ' AND    BP.IDPLANOPREV    = HST.IDPLANOPREV                                                 '+
                  ' AND    BP.IDBENEFICIO    = HST.IDBENEFICIO                                                 '+
                  ' AND    BP.FLGREFERENCIA  = 0                                                               '+
                  ' AND    SP.IDSITPART      = PP.IDSITPART                                                    '+
                  ' GROUP BY EL.MATRICULA,   PP.REQUERIMENTODATA,                                              '+
                  sPeriodoGroup+ //P.RAMOS-31.05.2005-PEND.19350-FIM
                  '        PP.INSCRICAODATA, PP.DTINICIOINSC, PP.INSCRICAONUMERO,                              '+
                  '        PP.IDSITPART,     EL.MATRICULA,                                                     '+
                  '        EL.TEMPOSERVCALC,                                                                   '+
                  '        SP.FLGINTERNO,                                                                      '+
                  '        P.NOME,PF.SEXO, PF.ESTCIVIL, PF.DATANASC,                                           '+
                  '        EL.DATAADMISSAO,                                                                    '+
                  '        BF.IDPESSJUR,   BF.IDPLANOPREV, BF.IDTITULAR,                                       '+
                  '        BF.SEQPROPOSTA, BF.IDBENEFICIO,                                                     '+
                  '        BF.DATAINICIOFUND, HA.IDBENEFICIO                                                   ';                                                                   
       end
       else begin // ativos
          sSQL :=   ' SELECT '''+Trim(dtDataREF.Text)+''' AS DATAREF,                       '+
                    '       PP.REQUERIMENTODATA,                                            '+
                    sPeriodo+#13#10+ //P.RAMOS-31.05.2005-PEND.19350-FIM
                                 IntToStr(iNumDep)+' AS NUMBENEF,                           '+
                    '        -1  AS IDBENEFICIO,                                            '+
                    '        PP.IDPESSJUR, PP.IDPLANOPREV, PP.IDPESSOA, PP.SEQPROPOSTA,     '+
                    '        PP.IDPESSOA AS IDTITULAR,                                      '+
                    '        PP.INSCRICAODATA, PP.DTINICIOINSC, PP.INSCRICAONUMERO,         '+
                    '        PP.IDSITPART,     EL.MATRICULA,                                '+
                    '        NVL(EL.TEMPOSERVCALC,0) AS TEMPOSERVCALC,                      '+
                    '        SP.FLGINTERNO,                                                 '+
                    '        P.NOME,PF.SEXO, PF.ESTCIVIL, PF.DATANASC,                      '+
                    '        EL.DATAADMISSAO, PRIMEMP.DATAPRIMEMPREGO                       ';

          if cCodProcesso = 'P'
          then sSQL := sSQL + ','+OraNumero(qry.FieldByName('PERCENTUAL').AsString)+' AS PERCENTUAL ';

          sSQL := sSQL + ' FROM   PESSOA P, PESSOAFISICA PF, ELEGPATRO EL,                  '+
                    '        PARTPREVPLAN PP, SITPART SP,                                   '+
                    '       ( SELECT H.IDPESSOA, MIN(H.DATAINICIO) AS DATAPRIMEMPREGO       '+
                    '         FROM   HISTFUNCPREV H                                         '+
                    '         GROUP BY H.IDPESSOA ) PRIMEMP                                 '+
                    ' WHERE  PP.IDPESSJUR    = '+qry.FieldByName('IDPESSJUR').AsString       +
                    ' AND    PP.IDPLANOPREV  = '+qry.FieldByName('IDPLANOPREV').AsString     +
                    ' AND    PP.IDPESSOA     = '+qry.FieldByName('IDPESSOA').AsString        +
                    ' AND    PP.SEQPROPOSTA  = '+qry.FieldByName('SEQPROPOSTA').AsString     +
                    ' AND    PP.IDSITPART    = SP.IDSITPART                                 '+
                    ' AND    EL.IDPESSJUR    = PP.IDPESSJUR                                 '+
                    ' AND    EL.IDPESSOA     = PP.IDPESSOA                                  '+
                    ' AND    PF.IDPESSOA     = EL.IDPESSOA                                  '+
                    ' AND    P.IDPESSOA      = EL.IDPESSOA                                  '+
                    ' AND    PRIMEMP.IDPESSOA(+) = EL.IDPESSOA                              '+
                    ' ORDER BY EL.MATRICULA                                                 ';
       end;
    end
    else begin
       sSQL :=   ' SELECT '''+Trim(dtDataREF.Text)+''' AS DATAREF,                       '+
                 '       PP.REQUERIMENTODATA,                                            '+
                 sPeriodo+#13#10+ //P.RAMOS-31.05.2005-PEND.19350-FIM
                              IntToStr(iNumDep)+' AS NUMBENEF,                           '+
                 '        -1  AS IDBENEFICIO,                                            '+
                 '        PP.IDPESSJUR, PP.IDPLANOPREV, PP.IDPESSOA, PP.SEQPROPOSTA,     '+
                 '        PP.IDPESSOA AS IDTITULAR,                                      '+
                 '        PP.INSCRICAODATA, PP.DTINICIOINSC, PP.INSCRICAONUMERO,         '+
                 '        PP.IDSITPART,     EL.MATRICULA,                                '+
                 '        NVL(EL.TEMPOSERVCALC,0) AS TEMPOSERVCALC,                      '+
                 '        SP.FLGINTERNO,                                                 '+
                 '        P.NOME,PF.SEXO, PF.ESTCIVIL, PF.DATANASC,                      '+
                 '        EL.DATAADMISSAO, PRIMEMP.DATAPRIMEMPREGO                       ';

       if cCodProcesso = 'P'
       then sSQL := sSQL + ','+OraNumero(qry.FieldByName('PERCENTUAL').AsString)+' AS PERCENTUAL ';

       sSQL := sSQL + ' FROM   PESSOA P, PESSOAFISICA PF, ELEGPATRO EL,                  '+
                 '        PARTPREVPLAN PP, SITPART SP,                                   '+
                 '       ( SELECT H.IDPESSOA, MIN(H.DATAINICIO) AS DATAPRIMEMPREGO       '+
                 '         FROM   HISTFUNCPREV H                                         '+
                 '         GROUP BY H.IDPESSOA ) PRIMEMP                                 '+
                 ' WHERE  PP.IDPESSJUR    = '+qry.FieldByName('IDPESSJUR').AsString       +
                 ' AND    PP.IDPLANOPREV  = '+qry.FieldByName('IDPLANOPREV').AsString     +
                 ' AND    PP.IDPESSOA     = '+qry.FieldByName('IDPESSOA').AsString        +
                 ' AND    PP.SEQPROPOSTA  = '+qry.FieldByName('SEQPROPOSTA').AsString     +
                 ' AND    PP.IDSITPART    = SP.IDSITPART                                 '+
                 ' AND    EL.IDPESSJUR    = PP.IDPESSJUR                                 '+
                 ' AND    EL.IDPESSOA     = PP.IDPESSOA                                  '+
                 ' AND    PF.IDPESSOA     = EL.IDPESSOA                                  '+
                 ' AND    P.IDPESSOA      = EL.IDPESSOA                                  '+
                 ' AND    PRIMEMP.IDPESSOA(+) = EL.IDPESSOA                              '+                 
                 ' ORDER BY EL.MATRICULA                                                 ';
    end;


    try
       sResultado := RegraString(IntToStr(piNumRegra), sSQL, bErro, iIdCalculo);
    except
       memErros.Lines.Add('Erro no Cálculo da Regra '+IntToStr(piNumRegra)+' para a Matrícula '+qry.FieldbyName('MATRICULA').AsString);
       sResultado := '0';
    end;

    Result     := sResultado;

end;

function TfrmExportaSimuladorNOVO.ColocaZeros(Codigo:string;Tam:byte):string;
var
  TamTemp:byte;
  Valor:LongInt;
  Erro:Integer;
begin
  ColocaZeros:=Codigo;
  Codigo:=Trim(Codigo);
  if Codigo='' then
    exit;
  val(Codigo,Valor,Erro);
  if Erro<>0 then begin
    ColocaZeros := PreparaStr(Codigo,Tam);
    exit;
  end;
  Codigo:=IntToStr(Valor);  {tira os zeros que existiam antes}
  TamTemp:=length(Codigo);
  while TamTemp<Tam do begin
    Codigo:='0'+Codigo;
    TamTemp:=length(Codigo);
  end;
  ColocaZeros:=Codigo;
end;

function TfrmExportaSimuladorNOVO.PreparaStr(Codigo : string; Tam : byte) : string;
var
  I:byte;
begin
  if Length(Codigo)<>Tam then begin
    Codigo:=trim(Codigo);
    if Length(Codigo)>Tam
      then Codigo:=copy(Codigo,1,Tam)
      else for I:=Length(Codigo) to (Tam-1) do
             Codigo:=Codigo+' ';
  end;
  PreparaStr:=Codigo;
end;

function  TfrmExportaSimuladorNOVO.MontaDadosDependente;
var sDependentes : string;
    i            : word;
    sSQLAux      : string;
begin

   Result       := '';
   sDependentes := '';
   iNumDep      := 0;

   if cCodProcesso <> 'P' // Pensionistas
   then sSQLAux := ''
   else begin
      // Se for pensionista, só considerá-lo se estiver na folha de pagamento
      sSQLAux := ' AND D.IDPESSOA IN (SELECT IDPESSOA FROM HSTBENEFBFCIARIO '+
                 '                    WHERE  MES           = '''+Copy(dtDataREF.Text,7,4)+'/'+Copy(dtDataREF.Text,4,2)+''''+
                 '                    AND    MESREFERENCIA = '''+Copy(dtDataREF.Text,7,4)+'/'+Copy(dtDataREF.Text,4,2)+''''+
                 '                    AND    IDBENEFICIO   = 11)  ';
   end;

   // CODIGOS DAS SITUACOES
   // 1 - ATIVO
   // 2 - CANCELADO
   // 3 - INVALIDO
   // 4 - CANCELADO

   // BENEFICIARIOS VITALICIOS
   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT DP.IDPESSOA, DP.IDDEPENDENCIA, DECODE(PF.SEXO, ''M'', 1, 2 ) AS SEXO,  '+
              '        PF.DATANASC                                                            '+
              ' FROM   PESSOAFISICA PF, DEPENDENTE D, DEPENTIT DP                             '+
              ' WHERE  DP.IDTITULAR = '+qry.FieldByName('IDPESSOA').AsString                   +
              ' AND    PF.IDPESSOA  = DP.IDPESSOA                                             '+
              ' AND    D.IDPESSOA   = DP.IDPESSOA                                             '+
//              ' AND    D.IDSITDEPENDENTE <> 2                                                 '+ // 2 = cancelado
              ' AND    (DP.FLGDEPLEGAL = 1 AND D.IDSITDEPENDENTE <> 2)                        '+ // Gleyber - 08/04/2003
              ' AND    ( ((DP.IDDEPENDENCIA  = ''COM'') AND (D.IDSITDEPENDENTE = 1)) OR     '+
              '          ((DP.IDDEPENDENCIA  = ''COP'') AND (D.IDSITDEPENDENTE = 1)) OR     '+
              '          ((DP.IDDEPENDENCIA  = ''FIL'') AND (D.IDSITDEPENDENTE = 3)) )      '+
//              '          ( (DP.IDDEPENDENCIA  = ''OUT'') AND (TRUNC(MONTHS_BETWEEN(TO_DATE(''' +
//              dtDataREF.text+''',''DD/MM/YYYY''),NVL(PF.DATANASC,SYSDATE))/12 ,0) > 24 ) ) OR '+
//              '          ( (DP.IDDEPENDENCIA  = ''DES'') AND (D.IDSITDEPENDENTE = 1) )  )     '+
              sSQLAux                                                                          +
              ' ORDER  BY PF.DATANASC DESC                                                    ');
      Open;
      while not Eof do
      begin
         inc(iNumDep);

         if iNumDep <= 10
         then sDependentes := sDependentes + PreparaStr(FormatDateTime('ddmmyyyy', FieldByName('DATANASC').AsDateTime), 8)+
                                             PreparaStr(FieldByName('SEXO').AsString,     1 )+
                                             PreparaStr('V',                              1 );


         Next;
      end;
   end;

   // BENEFICIARIOS TEMPORARIOS
   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT DP.IDPESSOA, DP.IDDEPENDENCIA, DECODE(PF.SEXO, ''M'', 1, 2 ) AS SEXO, '+
              '        PF.DATANASC '+
              ' FROM   PESSOAFISICA PF, DEPENDENTE D,  DEPENTIT DP      '+
              ' WHERE  DP.IDTITULAR = '+qry.FieldByName('IDPESSOA').AsString+
              ' AND    PF.IDPESSOA  = DP.IDPESSOA '+
              ' AND    D.IDPESSOA   = DP.IDPESSOA '+
//              ' AND    D.IDSITDEPENDENTE <> 2 '+ // 2 = cancelado
              ' AND    (DP.FLGDEPLEGAL = 1 AND D.IDSITDEPENDENTE <> 2)   '+ // Gleyber - 08/04/2003
              ' AND    ( ((DP.IDDEPENDENCIA  = ''FIL'') AND (D.IDSITDEPENDENTE IN (1,4))) OR '+
              '          ((DP.IDDEPENDENCIA  = ''DES'') AND (D.IDSITDEPENDENTE IN (1,4))) )  '+ // Gleyber - 08/04/2003
//            '          ( (DP.IDDEPENDENCIA  = ''OUT'') AND (TRUNC(MONTHS_BETWEEN(TO_DATE('''+dtDataREF.text+''',''DD/MM/YYYY''),NVL(PF.DATANASC,SYSDATE))/12 ,0) <= 24 )  )  ) '+
              sSQLAux+
              ' ORDER  BY PF.DATANASC DESC ');
      Open;
      while not Eof do
      begin
         inc(iNumDep);

         if iNumDep <= 10
         then sDependentes := sDependentes + PreparaStr(FormatDateTime('ddmmyyyy', FieldByName('DATANASC').AsDateTime), 8)+
                                             PreparaStr(FieldByName('SEXO').AsString,     1 )+
                                             PreparaStr('T',                              1 );


         Next;
      end;
   end;

   if iNumDep < 10
   then begin
      for i := 1 to 10 - iNumDep do
          sDependentes := sDependentes + PreparaStr('00000000', 8)+
                                         PreparaStr('0',        1 )+
                                         PreparaStr('O',        1 );
   end
   else begin
      sDependentes := Copy(sDependentes,1,100);
   end;

   qryAux.Close;

   Result := sDependentes;
end;

function  TfrmExportaSimuladorNOVO.BuscaTaxaJoia  : string;
begin
   Result := '0';
   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT  MAX(CPP.VALORBASE1) AS VALORBASE1 FROM CONTRIBPREVPARTP CPP '+
              ' WHERE  CPP.IDPESSJUR    = '+qry.FieldByName('IDPESSJUR').AsString+
              ' AND    CPP.IDPLANOPREV  = '+qry.FieldByName('IDPLANOPREV').AsString+
              ' AND    CPP.IDPESSOA     = '+qry.FieldByName('IDPESSOA').AsString+
              ' AND    CPP.SEQPROPOSTA  = '+qry.FieldByName('SEQPROPOSTA').AsString+
              ' AND    CPP.IDCONTRIBUICAO IN (2, 4, 9, 16) ');
      Open;
      if (not IsEmpty) and (FieldByName('VALORBASE1').AsFloat > 0)
      then Result := FieldByName('VALORBASE1').AsString;
   end;
end;


function  TfrmExportaSimuladorNOVO.BuscaRemuneracao : string;
var sRubrica : string;
begin
   Result := '0';
   with qryAux do
   begin
      Close;
      SQL.Clear;
      if (sTipoParticipante = '4') or (sTipoParticipante = '5')
      then begin
         SQL.Add(' SELECT SUM(H.VALORINTEGRAL) AS VALORPROVENTO '+
                 ' FROM   HSTBENEFBFCIARIO H    '+
                 ' WHERE  (H.MES           = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+''')'+
                 ' AND    (H.MESREFERENCIA = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+''')'+
                 ' AND    (H.IDPESSOA      = '+qry.FieldByName('IDPESSOA').AsString+') '+
                 ' AND    (H.IDBENEFICIO IN  (1,2,20,21)) ');
      end
      else begin
         if sTipoParticipante = '2'                   //
           Then sRubrica := '3691'                    // Gleyber - 06/05/2003
           Else sRubrica := '3424,8029,22041';        //
//         sRubrica := '3424,8029,22041';
         SQL.Add(' SELECT /*+ RULE */ SUM(H.VALORPROVENTO) AS VALORPROVENTO '+
                 ' from   HISTRUBSAL H    '+
                 ' WHERE  (H.IDPESSOA  = '+qry.FieldByName('IDPESSOA').AsString+') '+
                 ' AND    (H.MES       = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+''')'+
                 ' AND    (H.IDRUBRICA IN ( '+sRubrica+'))');
      end;
      Open;

      if (not IsEmpty) and (FieldByName('VALORPROVENTO').AsFloat > 0)
      then Result := FieldByName('VALORPROVENTO').AsString;
   end;
end;

function  TfrmExportaSimuladorNOVO.BuscaSalParticipacao : string;
var sRubrica : string;
begin
   Result := '0';
   with qryAux do
   begin
      Close;
      SQL.Clear;
      sRubrica := '-1';
      if (sTipoParticipante = '4') or (sTipoParticipante = '5')
      then begin
        SQL.Add(' SELECT SUM(H.VALORINTEGRAL) AS VALORPROVENTO '+
                ' FROM   HSTBENEFBFCIARIO H    '+
                ' WHERE  (H.MES           = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+''')'+
                ' AND    (H.MESREFERENCIA = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+''')'+
                ' AND    (H.IDPESSOA      = '+qry.FieldByName('IDPESSOA').AsString+') '+
                ' AND    (H.IDBENEFICIO IN  (1,2,20,21)) ');
      end
      else begin
          if sTipoParticipante = '2'     // AUTOPATROCINADOS         // Gleyber - 06/05/2003
          then sRubrica := ' AND    (H.IDRUBRICA = 3691) '           // Gleyber - 06/05/2003
          else if qry.FieldByName('PATROCINADORA').AsString      = '1' // FCRT
          then sRubrica := ' AND    (H.IDRUBRICA = 3689) '
          else if qry.FieldByName('PATROCINADORA').AsString = '2' // BRT
          then sRubrica := ' AND    (H.IDRUBRICA = 22021) '
          else if qry.FieldByName('PATROCINADORA').AsString = '3' // CELULAR
          then sRubrica := ' AND    (H.IDRUBRICA IN (5601,5049,5051) )';

//          sRubrica := ' AND    (H.IDRUBRICA IN (3689,22021,5601,5049,5051)         )';
          SQL.Add(' SELECT /*+ RULE */ SUM(H.VALORPROVENTO) AS VALORPROVENTO        '+
                  ' from   HISTRUBSAL H                                             '+
                  ' WHERE  (H.IDPESSOA  = '+qry.FieldByName('IDPESSOA').AsString+') '+
                  ' AND    (H.MES       = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+''')'+
                  sRubrica);
      end;
      Open;

      if (not IsEmpty) and (FieldByName('VALORPROVENTO').AsFloat > 0)
      then Result := FieldByName('VALORPROVENTO').AsString;
   end;
end;


function  TfrmExportaSimuladorNOVO.BuscaCONTRIBUICAO : string;
var sRubrica : string;
begin
   Result := '0';
   with qryAux do
   begin
      Close;
      SQL.Clear;
      sRubrica := '-1';
      //AUXÍLIO DOENÇA
      if (sTipoParticipante = '4') or (sTipoParticipante = '5')
      then begin
         if qry.FieldByName('PLANO').AsString = '1' // FUNDADOR
         { Augusto 24/06/2005 - Retiradas rubricas extraoridinárias 25735 e 25705 }
         //P.RAMOS-COLOQUEI RUBRICAS DA CONTRIBUIÇÃO EXTRAORDINARIA
         //then sRubrica := ' AND    (H.IDRUBRICA IN (812,25735)) '
         //else sRubrica := ' AND    (H.IDRUBRICA IN (794,25705)) ';
         then sRubrica := ' AND    (H.IDRUBRICA IN (812)) '
         else sRubrica := ' AND    (H.IDRUBRICA IN (794)) ';
      end
      else begin
        {if qry.FieldByName('PATROCINADORA').AsString = '1' // FCRT
        then sRubrica := ' AND    (H.IDRUBRICA IN (7,523)) '
        else if qry.FieldByName('PATROCINADORA').AsString = '2' // BRT
        then begin
           if qry.FieldByName('PLANO').AsString = '1' // FUNDADOR
           then sRubrica := ' AND    (H.IDRUBRICA IN (21931, 21964) ) '
           else sRubrica := ' AND    (H.IDRUBRICA IN (21934, 21965) ) ';
        end
        else if qry.FieldByName('PATROCINADORA').AsString = '3' // CELULAR
        then begin
           if qry.FieldByName('PLANO').AsString = '1' // FUNDADOR
           then sRubrica := ' AND    (H.IDRUBRICA IN (7,5350) ) '
           else sRubrica := ' AND    (H.IDRUBRICA IN (523,5350) ) ';
        end;
        }
        sRubrica := ' AND (H.IDRUBRICA IN (7,523,5368,21964,21965,5350) ) ';
      end;
      // Gleyber - 06/05/2003 - Início
      If sTipoParticipante = '2'    // AutoPatrocinados
      then begin
        SQL.Add(' SELECT /*+ RULE */ SUM(VALORRECEBIDO) AS VALORPROVENTO          '+
                ' FROM   HSTCONTRIBPREV                                           '+
                { Augusto 24/06/2005 - Retirada contribuição 82 }
                //P.RAMOS-COLOCAR CONTRIBUIÇÃO EXTRAORDINARIA
                //' WHERE  (IDCONTRIBUICAO IN (3,82) ) '+
                ' WHERE  (IDCONTRIBUICAO IN (3) ) '+
                ' AND    (IDPESSOA       = '+qry.FieldByName('IDPESSOA').AsString+') '+
                ' AND    (MESREFERENCIA  = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+''')');
        Open;
      end
      Else begin
      // Gleyber - 06/05/2003 - Fim

        SQL.Add(' SELECT /*+ RULE */ SUM(H.VALORPROVENTO) AS VALORPROVENTO        '+
                ' FROM   HISTRUBSAL H                                             '+
                ' WHERE  (H.IDPESSOA  = '+qry.FieldByName('IDPESSOA').AsString+') '+
                ' AND    (H.MES       = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+''')'+
                sRubrica);
        Open;
      end;
      if (not IsEmpty) and (FieldByName('VALORPROVENTO').AsFloat > 0)
      then Result := FieldByName('VALORPROVENTO').AsString;
   end;
end;

function  TfrmExportaSimuladorNOVO.BuscaJOIA : string;
var sRubrica : string;
begin
   Result := '0';
   with qryAux do
   begin
      Close;
      SQL.Clear;
      sRubrica := '-1';
      if (sTipoParticipante = '4') or (sTipoParticipante = '5')
      then sRubrica := ' AND    (H.IDRUBRICA = 788) '
      else begin
        {if qry.FieldByName('PATROCINADORA').AsString = '1' // FCRT
        then sRubrica := ' AND    (H.IDRUBRICA = 493 ) '
        else if qry.FieldByName('PATROCINADORA').AsString = '2' // BRT
        then sRubrica := ' AND    (H.IDRUBRICA IN (21947, 21834) ) '
        else if qry.FieldByName('PATROCINADORA').AsString = '3' // CELULAR
        then sRubrica := ' AND    (H.IDRUBRICA IN ( 493, 5370) ) ';
        }
        sRubrica := ' AND (H.IDRUBRICA IN (493,21834,5370) ) ';
      end;
      // Gleyber - 06/05/2003 - Início
      If sTipoParticipante = '2'    // AutoPatrocinados
      then begin
        SQL.Add(' SELECT /*+ RULE */ SUM(VALORRECEBIDO) AS VALORPROVENTO          '+
                ' FROM   HSTCONTRIBPREV                                           '+
                ' WHERE  (IDCONTRIBUICAO = 4 ) '+
                ' AND    (IDPESSOA       = '+qry.FieldByName('IDPESSOA').AsString+') '+
                ' AND    (MESREFERENCIA  = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+''')');
        Open;
      end
      Else begin
      // Gleyber - 06/05/2003 - Fim
        SQL.Add(' SELECT /*+ RULE */ SUM(H.VALORPROVENTO) AS VALORPROVENTO '+
                ' FROM   HISTRUBSAL H    '+
                ' WHERE  (H.IDPESSOA  = '+qry.FieldByName('IDPESSOA').AsString+') '+
                ' AND    (H.MES       = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+''')'+
                sRubrica);
        Open;
      end;
      if (not IsEmpty) and (FieldByName('VALORPROVENTO').AsFloat > 0)
      then Result := FieldByName('VALORPROVENTO').AsString;
   end;
end;

function  TfrmExportaSimuladorNOVO.BuscaReservaTributavel : string;
var sRubrica : string;
begin
   Result := '0';
   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT VALORRESERVA '+
              ' from   RESERVAPART  '+
              ' WHERE  IDPESSJUR     = '+qry.FieldByName('IDPESSJUR').AsString+
              ' AND    IDPLANOPREV   = '+qry.FieldByName('IDPLANOPREV').AsString+
              ' AND    IDPESSOA      = '+qry.FieldByName('IDPESSOA').AsString+
              ' AND    IDTIPORESERVA IN (4,7) ');
      Open;

      if (not IsEmpty) and (FieldByName('VALORRESERVA').AsFloat > 0)
      then Result := FieldByName('VALORRESERVA').AsString;
   end;
end;

function  TfrmExportaSimuladorNOVO.BuscaReservaNAOTributavel : string;
var sRubrica : string;
begin
   Result := '0';
   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT VALORRESERVA '+
              ' from   RESERVAPART  '+
              ' WHERE  IDPESSJUR     = '+qry.FieldByName('IDPESSJUR').AsString+
              ' AND    IDPLANOPREV   = '+qry.FieldByName('IDPLANOPREV').AsString+
              ' AND    IDPESSOA      = '+qry.FieldByName('IDPESSOA').AsString+
              ' AND    IDTIPORESERVA IN (5,8) ');
      Open;

      if (not IsEmpty) and (FieldByName('VALORRESERVA').AsFloat > 0)
      then Result := FieldByName('VALORRESERVA').AsString;
   end;
end;

function  TfrmExportaSimuladorNOVO.BuscaSuplementacaoBruta : string;
begin
   Result := '0';
   with qryAux do
   begin
      Close;
      SQL.Clear;

      if qry.FieldByName('IDBENEFICIO').AsInteger <> 11
      then SQL.Add(' SELECT SUM(HST.VALORINTEGRAL) AS VALORINTEGRAL  '+
              ' FROM   HSTBENEFBFCIARIO HST, BENEFPLANPREV BP   '+
              ' WHERE  HST.IDPESSJUR      = '+qry.FieldByName('IDPESSJUR').AsString+
              ' AND    HST.IDPLANOPREV    = '+qry.FieldByName('IDPLANOPREV').AsString+
              ' AND    HST.IDPESSOA       = '+qry.FieldByName('IDPESSOA').AsString+
              ' AND    HST.SEQPROPOSTA    = '+qry.FieldByName('SEQPROPOSTA').AsString+
              ' AND    HST.NUMEROPROCESSO = '+qry.FieldByName('NUMEROPROCESSO').AsString+
              ' AND    HST.MES            = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+''''+
              ' AND    HST.MESREFERENCIA  = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+''''+
              ' AND    BP.IDPLANOPREV     = HST.IDPLANOPREV   '+
              ' AND    BP.IDBENEFICIO     = HST.IDBENEFICIO   ')
      else SQL.Add(' SELECT HST.IDPESSOA, SUM(HST.VALORTOTAL) AS VALORINTEGRAL  '+
              ' FROM   HSTBENEFBFCIARIO HST, BENEFPLANPREV BP   '+
              ' WHERE  HST.IDPESSJUR      = '+qry.FieldByName('IDPESSJUR').AsString+
              ' AND    HST.IDPLANOPREV    = '+qry.FieldByName('IDPLANOPREV').AsString+
              ' AND    HST.IDTITULAR      = '+qry.FieldByName('IDPESSOA').AsString+
              ' AND    HST.SEQPROPOSTA    = '+qry.FieldByName('SEQPROPOSTA').AsString+
              ' AND    HST.NUMEROPROCESSO = '+qry.FieldByName('NUMEROPROCESSO').AsString+
              ' AND    HST.MES            = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+''''+
              ' AND    HST.MESREFERENCIA  = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+''''+
              ' AND    BP.IDPLANOPREV     = HST.IDPLANOPREV   '+
              ' AND    BP.IDBENEFICIO     = HST.IDBENEFICIO   '+
              ' GROUP BY HST.IDPESSOA  ' );
      Open;
      if (not IsEmpty) and (FieldByName('VALORINTEGRAL').AsFloat > 0)
      then Result := FieldByName('VALORINTEGRAL').AsString;
   end;
end;

function  TfrmExportaSimuladorNOVO.BuscaDataInicioAuxDoenca : string;
begin
   Result := '';
   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT DATAINICIOFUND '+
              ' FROM   BENEFBFCIARIO  '+
              ' WHERE  IDPESSJUR      = '+qry.FieldByName('IDPESSJUR').AsString+
              ' AND    IDPLANOPREV    = '+qry.FieldByName('IDPLANOPREV').AsString+
              ' AND    IDPESSOA       = '+qry.FieldByName('IDPESSOA').AsString+
              ' AND    SEQPROPOSTA    = '+qry.FieldByName('SEQPROPOSTA').AsString+
              ' AND    IDBENEFICIO    IN (1,2) ');
      Open;
      if (not IsEmpty)
      then Result := FieldByName('DATAINICIOFUND').AsString;
   end;
end;

procedure TfrmExportaSimuladorNOVO.sbtnAtivosClick(Sender: TObject);
begin
  inherited;
  if SaveDlg.Execute
  then edArqATIVOS.Text := SaveDlg.FileName;
end;

procedure TfrmExportaSimuladorNOVO.sbtnAssistidosClick(Sender: TObject);
begin
  inherited;
  if SaveDlg.Execute
  then edArqASSISTIDOS.Text := SaveDlg.FileName;

end;

procedure TfrmExportaSimuladorNOVO.sbtnPensionistasClick(Sender: TObject);
begin
  inherited;
  if SaveDlg.Execute
  then edArqPENSIONISTAS.Text := SaveDlg.FileName;

end;

procedure TfrmExportaSimuladorNOVO.FormShow(Sender: TObject);
begin
  inherited;
  dtDataRef.Text         := DateToStr(date);
  lblProcessando.Visible := True;
  tbsSelParticip.TabVisible := False;
  PageControl1.ActivePage   := tbsExportacao;
end;

procedure TfrmExportaSimuladorNOVO.bbtnExportarClick(Sender: TObject);
var i : word;
begin
  inherited;
  memErros.Lines.Clear;

  // Preencher Matrículas
  sMatriculas := '';
  if rgrpParticip.ItemIndex = 1
  then begin
     for i := 0 to memMatriculas.Lines.Count - 1 do
     begin
         if Trim(memMatriculas.Lines[i]) = ''
         then continue;
         if sMatriculas = ''
         then sMatriculas := ''''+Trim(memMatriculas.Lines[i])+''''
         else sMatriculas := sMatriculas +','''+ Trim(memMatriculas.Lines[i])+'''';
     end;

  end;

  try
    GeraExportacaoATIVOS;
  except
  on e: exception do
    begin
      MsgDlg('Erro na geração dos ativos.'+'Msg:'+e.message,
        'Erro', mtError, [mbOK], 0);
    end;
  end;
  try
    GeraExportacaoASSISTIDOS;
  except
  on e: exception do
    begin
      MsgDlg('Erro na geração dos assistidos.'+'Msg:'+e.message,
        'Erro', mtError, [mbOK], 0);
    end;
  end;
  try
    GeraExportacaoPENSIONISTAS;
  except
  on e: exception do
    begin
      MsgDlg('Erro na geração dos pensionistas.'+'Msg:'+e.message,
        'Erro', mtError, [mbOK], 0);
    end;
  end;

  MsgDlg('Término da Geração dos Arquivos. Arquivos Gerados com Sucesso.','Informação', mtInformation, [mbOK],0);

end;

procedure TfrmExportaSimuladorNOVO.GeraExportacaoATIVOS;
var F : TextFile;
    sLinha, sValorAux : string;
    i : word;
    sDataInicioAD : string;
begin


   memErros.Lines.Add('*** ATIVOS E AUTOPAT ');
   cCodProcesso := 'A';
   if (Trim(edArqATIVOS.Text) = '')
   then Exit;
   if FileExists(edArqAtivos.Text)  then RenameFile(edArqAtivos.Text, edArqAtivos.Text+'.old');
   AssignFile(F, edArqAtivos.Text);
   Rewrite(F);
   with qry do
   begin

      Close;
      SQL.Clear;
      SQL.Add(' SELECT * FROM (                                                     '+
              '  SELECT PP.IDPESSJUR, PP.IDPLANOPREV, PP.IDPESSOA, PP.SEQPROPOSTA,  '+
              '        DECODE(EL.IDPESSJUR, 1,     1,                               '+
              '                             50031, 2,                               '+
              '                             50028, 3  )  AS PATROCINADORA,          '+
              '        DECODE(PP.IDPLANOPREV, 3, 1,                                 '+
              '                              16, 2    )  AS PLANO,                  '+
              '        EL.MATRICULA,                                                '+
              '        DECODE(PP.IDPLANOPREV, 3,  ''S'',                            '+
              '                              16,  ''N'' ) AS FUNDADOR,              '+
              '        SP.FLGINTERNO, PP.IDSITPART,                                 '+
              '        DECODE(SP.FLGINTERNO, ''AT'', ''1'',                         '+
              '                              ''MA'', ''2'',                         '+
              '               DECODE(EL.DATADEMISSAO,  NULL,                        '+
              '                      DECODE(FLGINTERNO,''AS'',''9'',''1''),''6'') ) AS TIPO,   '+
              '        P.NOME,                                                      '+
              '        DECODE(PF.SEXO, ''M'', 1, 2 ) AS SEXO,                       '+
              '        DECODE(PF.ESTCIVIL, ''S'', ''1'',                            '+
              '                            ''C'', ''2'',                            '+
              '                            ''V'', ''3'',                            '+
              '                            ''E'', ''4'',                            '+
              '                            ''M'', ''5'',                            '+
              '                            ''D'', ''6'',                            '+
              '                            ''J'', ''7'',                            '+
              '                            ''O'', ''8'',                            '+
              '                            ''P'', ''9'', ''8''  ) AS ESTADOCIVIL,   '+
              '        PF.DATANASC,                                                 '+
              '        EL.DATAADMISSAO, EL.DATADEMISSAO, PP.INSCRICAODATA           '+
              ' FROM   PESSOA P, PESSOAFISICA PF, ELEGPATRO EL,                     '+
              '        PARTPREVPLAN PP, SITPART SP                                  ');
      if Trim(sMatriculas) = ''
      then SQL.Add(' WHERE  SP.FLGINTERNO IN (''AT'', ''MA'' )                      '+
              ' AND    ( (EL.DATADEMISSAO IS NULL) OR ((TO_CHAR(EL.DATADEMISSAO,''YYYY/MM'') >= '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+''') AND (SP.FLGINTERNO = ''AT'') ) OR (SP.FLGINTERNO = ''MA'') '+
              '        )'+
              ' AND    ( (PP.DATACANCELAMENTO IS NULL) OR (TO_CHAR(PP.DATACANCELAMENTO,''YYYY/MM'') >= '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+'''))'+
              ' AND    PP.IDPLANOPREV   <> 33                                       '+
              ' AND    PP.FLGDESATIVADO = 0                                         '+
              ' AND    PP.IDSITPART      = SP.IDSITPART                             '+
              ' AND    EL.IDPESSJUR      = PP.IDPESSJUR                             '+
              ' AND    EL.IDPESSOA       = PP.IDPESSOA                              '+
              ' AND    PF.IDPESSOA       = EL.IDPESSOA                              '+
              ' AND    P.IDPESSOA        = EL.IDPESSOA                              '+
              ' AND    NOT EXISTS ( SELECT HST.IDPESSOA                             '+
              '                     FROM   HSTBENEFBFCIARIO HST                     '+
              '                     WHERE  HST.MES           = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+''''+
              '                     AND    HST.MESREFERENCIA = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+''''+
              '                     AND    HST.IDPESSJUR     = PP.IDPESSJUR         '+
              '                     AND    HST.IDPLANOPREV   = PP.IDPLANOPREV       '+
              '                     AND    HST.IDPESSOA      = PP.IDPESSOA          '+
              '                     AND    HST.SEQPROPOSTA   = PP.SEQPROPOSTA )     '+
              ' UNION                                                               '+
              ' SELECT PP.IDPESSJUR, PP.IDPLANOPREV, PP.IDPESSOA, PP.SEQPROPOSTA,   '+
              '        DECODE(EL.IDPESSJUR, 1,     1,                               '+
              '                             50031, 2,                               '+
              '                             50028, 3  )  AS PATROCINADORA,          '+
              '        DECODE(PP.IDPLANOPREV, 3, 1,                                 '+
              '                              16, 2    )  AS PLANO,                  '+
              '        EL.MATRICULA,                                                '+
              '        DECODE(PP.IDPLANOPREV, 3,  ''S'',                            '+
              '                              16,  ''N'' ) AS FUNDADOR,              '+
              '        ''AS'' AS FLGINTERNO,                                        '+
              '        DECODE(PP.IDSITPART, 10, 10, 11, 11, 10) AS IDSITPART,       '+
              '        ''9''  AS TIPO,                                              '+
              '        P.NOME,                                                      '+
              '        DECODE(PF.SEXO, ''M'', 1, 2 ) AS SEXO,                       '+
              '        DECODE(PF.ESTCIVIL, ''S'', ''1'',                            '+
              '                            ''C'', ''2'',                            '+
              '                            ''V'', ''3'',                            '+
              '                            ''E'', ''4'',                            '+
              '                            ''M'', ''5'',                            '+
              '                            ''D'', ''6'',                            '+
              '                            ''J'', ''7'',                            '+
              '                            ''O'', ''8'',                            '+
              '                            ''P'', ''9'', ''8''  ) AS ESTADOCIVIL,   '+
              '        PF.DATANASC,                                                 '+
              '        EL.DATAADMISSAO, EL.DATADEMISSAO, PP.INSCRICAODATA           '+
              ' FROM   PESSOA P, PESSOAFISICA PF, ELEGPATRO EL,                     '+
              '        PARTPREVPLAN PP, SITPART SP                                  '+
              ' WHERE  PP.IDSITPART      = SP.IDSITPART                             '+
              ' AND    PP.IDPLANOPREV   <> 33                                       '+
              ' AND    PP.FLGDESATIVADO = 0                                         '+
              ' AND    EL.IDPESSJUR      = PP.IDPESSJUR                             '+
              ' AND    EL.IDPESSOA       = PP.IDPESSOA                              '+
              ' AND    PF.IDPESSOA       = EL.IDPESSOA                              '+
              ' AND    P.IDPESSOA        = EL.IDPESSOA                              '+
              ' AND    EXISTS ( SELECT HST.IDPESSOA                                 '+
              '                 FROM   BENEFBFCIARIO BF, HSTBENEFBFCIARIO HST       '+
              '                 WHERE  HST.MES           = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+''''+
              '                 AND    HST.MESREFERENCIA = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+''''+
              '                 AND    HST.IDPESSJUR = PP.IDPESSJUR             '+
              '                 AND    HST.IDPLANOPREV = PP.IDPLANOPREV         '+
              '                 AND    HST.IDPESSOA    = PP.IDPESSOA            '+
              '                 AND    HST.SEQPROPOSTA = PP.SEQPROPOSTA         '+
              '                 AND    HST.FLGENVIADO  <> 9                     '+
              '                 AND    HST.IDBENEFICIO IN (1,2)                 '+
              '                 AND    BF.NUMEROPROCESSO = HST.NUMEROPROCESSO   '+
              '                 AND    BF.IDPESSJUR      = HST.IDPESSJUR        '+
              '                 AND    BF.IDPLANOPREV    = HST.IDPLANOPREV      '+
              '                 AND    BF.IDTITULAR      = HST.IDTITULAR        '+
              '                 AND    BF.IDPESSOA       = HST.IDPESSOA         '+
              '                 AND    BF.SEQPROPOSTA    = HST.SEQPROPOSTA      '+
              '                 AND    BF.IDBENEFICIO    = HST.IDBENEFICIO      '+
              '               )                                                 ')

{              ' AND    EXISTS ( SELECT HST.IDPESSOA                                 '+
              '                     FROM   HSTBENEFBFCIARIO HST                     '+
              '                     WHERE  HST.MES           = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+''''+
              '                     AND    HST.MESREFERENCIA = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+''''+
              '                     AND    HST.IDPESSJUR = PP.IDPESSJUR             '+
              '                     AND    HST.IDPLANOPREV = PP.IDPLANOPREV         '+
              '                     AND    HST.IDPESSOA    = PP.IDPESSOA            '+
              '                     AND    HST.SEQPROPOSTA = PP.SEQPROPOSTA         '+
              '                     AND    HST.FLGENVIADO  <> 9                     '+
              '                     AND    HST.IDBENEFICIO IN (1,2) )               '+
              ' ) WHERE MATRICULA = ''390088-00'' ORDER BY MATRICULA ') }      //Comentado por rodar apenas um - Gleyber - 11/04/2003
              //' )  ORDER BY MATRICULA ') //P.RAMOS-31.05.2005-COLOCA AO FINAL

      { Inicio Augusto 04/07/2005 - Alternar filtros }
      else begin

        if rgFiltro.ItemIndex = 0 Then
          SQL.Add(' WHERE  EL.MATRICULA IN ('+sMatriculas+' )                      ')
        Else
          SQL.Add(' WHERE  EL.MATRICULA NOT IN ('+sMatriculas+' )                  ');

        SQL.Add(' AND    PP.IDPLANOPREV   <> 33                                     '+
              ' AND    PP.FLGDESATIVADO = 0                                         '+
              ' AND    PP.IDSITPART      = SP.IDSITPART                             '+
              ' AND    EL.IDPESSJUR      = PP.IDPESSJUR                             '+
              ' AND    EL.IDPESSOA       = PP.IDPESSOA                              '+
              ' AND    PF.IDPESSOA       = EL.IDPESSOA                              '+
              ' AND    P.IDPESSOA        = EL.IDPESSOA                              ');
              //' ) ORDER BY MATRICULA '); //P.RAMOS-31.05.2005-COLOCA AO FINAL

      { Fim Augusto 04/07/2005 }

     end;
     //P.RAMOS-31.05.2005-PEND.19350
     if rgPeriodo.itemindex = 0 then
       SQL.Add(' ) ORDER BY MATRICULA ')
     else
       //NO SEGUNDO PERIODO DE MIGRAÇÃO NÃO ENTRA A CELULAR
       SQL.Add(' ) WHERE IDPESSJUR IN (1,50031) ORDER BY MATRICULA ');
     //P.RAMOS-31.05.2005-PEND.19350-FIM

      Open;
   end;
   //qry.sql.SaveToFile('C:\QRYATIVOS.TXT');

   if qry.IsEmpty
   then begin
      CloseFile(F);
      Exit;
   end;


   i := 0;
   qry.First;

   while not qry.Eof do
   begin

      inc(i);
      lblProcessando.Caption := IntToStr(i)+' registros processados. ';
      Application.ProcessMessages;

      // ATUALIZAR TEMPO DE SERVICO
      ProcessaHistContrib( qryAux,
                           qry.FieldByName('IDPESSOA').AsInteger,
                           DateToStr(date));


      sLinha :=          PreparaStr(qry.FieldByName('PATROCINADORA').AsString,   1);  // campo1
      sLinha := sLinha + PreparaStr(qry.FieldByName('PLANO').AsString,           1);  // campo2
      sLinha := sLinha + PreparaStr(qry.FieldByName('MATRICULA').AsString,       10); // campo3
      sLinha := sLinha + PreparaStr(qry.FieldByName('FUNDADOR').AsString,        1);  // campo4

      sTipoParticipante := qry.FieldByName('TIPO').AsString;

      if qry.FieldByName('TIPO').AsString = '9'
      then begin
         sDataInicioAD := BuscaDataInicioAuxDoenca;
         if sDataInicioAD = ''
         then sTipoParticipante := '9'
         else if (StrToDate(dtDataRef.Text) - StrToDate(sDataInicioAD)) <= 720 // 24 meses
         then sTipoParticipante := '4'
         else sTipoParticipante := '5'
      end
      else if qry.FieldByName('DATADEMISSAO').AsString <> ''
      then begin
          if (StrToDate(dtDataRef.Text) - qry.FieldByName('DATADEMISSAO').AsDateTime) <= 30
          then sTipoParticipante := '6'
          else sTipoParticipante := qry.FieldByName('TIPO').AsString;
      end;

      if Trim(sTipoParticipante) = '9' then sTipoParticipante := '4';
      if Trim(sTipoParticipante) = ''  then sTipoParticipante := '1';

      sValorAux := sTipoParticipante;
      sLinha := sLinha + PreparaStr(sValorAux,                                    1); // campo5
      sLinha := sLinha + PreparaStr(Copy(qry.FieldByName('NOME').AsString,1,40), 40); // campo6
      sLinha := sLinha + PreparaStr(qry.FieldByName('SEXO').AsString,             1); // campo7
      sLinha := sLinha + PreparaStr(qry.FieldByName('ESTADOCIVIL').AsString,      1); // campo8
      sLinha := sLinha + PreparaStr(FormatDateTime('ddmmyyyy', qry.FieldByName('DATANASC').AsDateTime), 8); // campo9
      sLinha := sLinha + PreparaStr(FormatDateTime('ddmmyyyy', qry.FieldByName('DATAADMISSAO').AsDateTime), 8); // campo10

      // DATA FILIACAO
//      sValorAux := ExecutaRegraFCRT(1396); // PEDIDO PELA CLAUDIA
      sValorAux := qry.FieldByName('INSCRICAODATA').AsString;
      sLinha := sLinha + PreparaStr(FormatDateTime('ddmmyyyy', StrToDate(sValorAux)), 8); // campo11

      // REMUNERACAO
      sValorAux := BuscaRemuneracao;
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,  7);                                      // campo12

      // SAL. PARTICIPACAO
      sValorAux := BuscaSalParticipacao;
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,  7);                                      // campo13

      // CONTRIBUICAO ATUAL
      sValorAux := BuscaContribuicao;
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,  7);                                      // campo14

      // TEMPO TOTAL DE INSS
      sValorAux := ExecutaRegraFCRT(1391);
      sLinha := sLinha + ColocaZeros(sValorAux,  3);                                      // campo15

      // CONTRIBUICAO JOIA ATUAL
      sValorAux := BuscaJoia;
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,  7);                                      // campo16

      // PRAZO PAGTO JOIA
      sValorAux := ExecutaRegraFCRT(1535);// (1393);
      sLinha := sLinha + ColocaZeros(sValorAux,   3);                                     // campo17

      // PRAZO DE JOIA PAGO
      sValorAux := ExecutaRegraFCRT(1623); // (1395);
      sLinha := sLinha + ColocaZeros(sValorAux,   3);                                     // campo18

      // TAXA DE JOIA
      sValorAux := BuscaTaxaJoia;
      sValorAux := FormatFloat('##0.0000000', StrToFloat(sValorAux));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,  8);                                      // campo19

      // RESERVA TRIBUTAVEL
      sValorAux := BuscaReservaTributavel;
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,  12);                                     // campo20

      // RESERVA NAO TRIBUTAVEL
      sValorAux := BuscaReservaNAOTributavel;
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,  12);                                     // campo21


      // SRB
      sValorAux := ExecutaRegraFCRT(1388);
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,   12);                                    // campo22

      // SRB ATUALIZADO
      sValorAux := ExecutaRegraFCRT(19071); { Augusto 08/07/2005 era regra 1390 }
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,   12);                                    // campo23

      // INSS
      //P.RAMOS-06.07.2005-PEND.19350
      if rgPeriodo.itemindex = 0 then
      begin
        sValorAux := ExecutaRegraFCRT(19072); { Augusto 08/07/2005 era regra 1377 }
        sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
        sValorAux := TiraPonto(sValorAux);
        sLinha := sLinha + ColocaZeros(sValorAux,         12);                              // campo24
      end
      else
      begin
        sValorAux := ExecutaRegraFCRT(19007);
        sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
        sValorAux := TiraPonto(sValorAux);
        sLinha := sLinha + ColocaZeros(sValorAux,         12);                              // campo24
      end;
      //P.RAMOS-06.07.2005-PEND.19350-FIM

      // FATOR PREVIDENCIARIO
      sValorAux := ExecutaRegraFCRT(19090); { Augusto 02/08/2005 era regra 1369 }
      if StrToFloat(ClienteNumero(sValorAux)) > 1
      then  sValorAux := '10000000'
      else  sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZerosDireita(sValorAux,   8);                             // campo25

      // TEMPO MINIMO DE CONTRIBUICAO
      sValorAux := ExecutaRegraFCRT(1353);
      sValorAux := TiraPonto(sValorAux);
      sLinha    := sLinha + ColocaZeros(sValorAux,        2);                             // campo26


      // IDADE NA APOSENTADORIA
      sValorAux := ExecutaRegraFCRT(1366);
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,           3);                             // campo27

      // Dependentes
      sValorAux := MontaDadosDependente;
      sLinha := sLinha + ColocaZeros(IntToStr(iNumDep),   2);                             // campo29
      sLinha := sLinha + sValorAux;                                                       // campo28

      { Inicio Augusto 23/06/2005 }
      // CONTRIBUICAO EXTRA
      sValorAux := ExecutaRegraFCRT(19045);
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,   7);                                     // campo30
      { Fim  Augusto 23/06/2005 }

      { Inicio Augusto 04/07/2005 }
      // PERIODO DE MIGRAÇÃO
      if rgPeriodo.ItemIndex = 0 Then
        sValorAux := ColocaZeros(IntToStr(45),   2)
      Else
        sValorAux := ColocaZeros(IntToStr(62),   2);

      If qry.FieldByName('IDPESSJUR').AsString = '50028' Then
        sValorAux := ColocaZeros(IntToStr(60),   2);

      sLinha := sLinha + ColocaZeros(sValorAux,   2);                                     // campo31
      { Fim  Augusto 04/07/2005 }

      // Gleyber - 14/11/2005 - Pendência 20712 - Início
      sValorAux := ColocaZeros(ProcCPF(qry.FieldByName('IDPESSOA').AsString), 11);
      sLinha := sLinha + sValorAux;                                                       //  Campo32

      sValorAux := PreparaStr(ProcMatAntiga(qry.FieldByName('IDPESSOA').AsString), 9);
      sLinha := sLinha + sValorAux;                                                       //  Campo33
      // Gleyber - 14/11/2005 - Pendência 20712 - Fim
      writeln(F, sLinha);
      qry.Next;
   end;


   CloseFile(F);
end;

procedure TfrmExportaSimuladorNOVO.GeraExportacaoASSISTIDOS;
var F : TextFile;
    sLinha, sValorAux, sBenefPago : string;
    i : integer;
    sValorDep : string;
begin

   memErros.Lines.Add('*** ASSISTIDOS ');

   cCodProcesso := 'S';
   if (Trim(edArqASSISTIDOS.Text) = '')
   then Exit;

   if FileExists(edArqASSISTIDOS.Text)  then RenameFile(edArqASSISTIDOS.Text, edArqASSISTIDOS.Text+'.old');
   AssignFile(F, edArqASSISTIDOS.Text);
   Rewrite(F);

   with qry do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT DISTINCT PP.IDPESSJUR, PP.IDPLANOPREV, PP.IDPESSOA,                '+
              '        PP.SEQPROPOSTA,                                                    '+
              '        DECODE(EL.IDPESSJUR, 1,     1,                                     '+
              '                             50031, 2,                                     '+
              '                             50028, 3  )  AS PATROCINADORA,                '+
              '        DECODE(PP.IDPLANOPREV, 3, 1,                                       '+
              '                              16, 2    )  AS PLANO,                        '+
              '        EL.MATRICULA,                                                      '+
              '        DECODE(PP.IDPLANOPREV, 3,  ''S'',                                  '+
              '                              16,  ''N'' ) AS FUNDADOR,                    '+
              '        DECODE(SP.FLGINTERNO, ''AT'', ''1'',                               '+
              '                              ''MA'', ''2'',                               '+
              '                              ''MP'', ''3'',                               '+
              '                              ''CA'', ''5'',                               '+
              '                                      ''9'' ) AS TIPO,                     '+
              '        P.NOME,                                                            '+
              '        DECODE(PF.SEXO, ''M'', 1, 2 ) AS SEXO,                             '+
              '        DECODE(PF.ESTCIVIL, ''S'', ''1'',                                  '+
              '                            ''C'', ''2'',                                  '+
              '                            ''V'', ''3'',                                  '+
              '                            ''E'', ''4'',                                  '+
              '                            ''M'', ''5'',                                  '+
              '                            ''D'', ''6'',                                  '+
              '                            ''J'', ''7'',                                  '+
              '                            ''O'', ''8'',                                  '+
              '                            ''P'', ''9''  ) AS ESTADOCIVIL,                '+
              '        PF.DATANASC,                                                       '+
              '        EL.DATAADMISSAO,   PF.DATAMORTE,                                   '+
              '        NVL(BENEFNOMES.IDBENEFICIO,0)                  AS IDBENEFICIO,     '+
              '        NVL(BENEFNOMES.NUMEROPROCESSO,0)               AS NUMEROPROCESSO,  '+
              '        MAX(NVL(EV.DATAEVENTO, TO_DATE(''31/12/3000'',''DD/MM/YYYY''))) AS DATAINICIOFUND,  '+
              '        MAX(NVL(BENEFNOMES.DATAINICIOINSS, TO_DATE(''31/12/3000'',''DD/MM/YYYY''))) AS DATAINICIOINSS '+
              ' FROM   PESSOA P, PESSOAFISICA PF, ELEGPATRO EL, EVENTOSPREV EV,           '+
              '        PARTPREVPLAN PP, SITPART SP,                                       '+
              '        ( SELECT DISTINCT EL.MATRICULA,                                    '+
              '                 BF.NUMEROPROCESSO, BF.IDTITULAR, BF.IDBENEFICIO,          '+
              '                 BF.DATAINICIOFUND,                                        '+
              '                 B.IDEVENTOGERADOR,                                        '+
              '                 BF.DATAINICIOINSS                                         '+
              '          FROM   ELEGPATRO EL, BENEFBFCIARIO BF, HSTBENEFBFCIARIO HST,     '+
              '                 BENEFICIO B                                               '+
              '          WHERE  HST.MES           = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+''''+
              '          AND    HST.MESREFERENCIA = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+''''+
              '          AND    HST.IDBENEFICIO   IN (5,6,7,8,9,14)                       '+
              '          AND    HST.FLGENVIADO    <> 9                                    '+
              '          AND    HST.IDMOTIVO      <> 7                                    '+
              '          AND    HST.VLBENEFPGTO   IS NOT NULL                             '+
              '          AND    HST.VLBENEFPGTO   > 0                                     '+
              '          AND    EL.IDPESSJUR      = HST.IDPESSJUR                         '+
              '          AND    EL.IDPESSOA       = HST.IDTITULAR                         '+
              '          AND    BF.IDPESSJUR      = HST.IDPESSJUR                         '+
              '          AND    BF.IDPLANOPREV    = HST.IDPLANOPREV                       '+
              '          AND    BF.IDTITULAR      = HST.IDTITULAR                         '+
              '          AND    BF.SEQPROPOSTA    = HST.SEQPROPOSTA                       '+
              '          AND    BF.IDBENEFICIO    = HST.IDBENEFICIO                       '+
              '          AND    BF.NUMEROPROCESSO = HST.NUMEROPROCESSO                    '+
              '          AND    B.IDBENEFICIO     = BF.IDBENEFICIO                        '+
              '          ) BENEFNOMES                                                     '+
              ' WHERE  EL.MATRICULA          = BENEFNOMES.MATRICULA                       '+
              ' AND    PP.IDPLANOPREV   <> 33                                       '+
              ' AND    PP.FLGDESATIVADO = 0                                         '+
              ' AND    PP.IDSITPART          = SP.IDSITPART                               '+
              ' AND    EL.IDPESSJUR          = PP.IDPESSJUR                               '+
              ' AND    EL.IDPESSOA           = PP.IDPESSOA                                '+
              ' AND    PF.IDPESSOA           = EL.IDPESSOA                                '+
              ' AND    P.IDPESSOA            = EL.IDPESSOA                                '+
              ' AND    BENEFNOMES.IDTITULAR(+)    = PP.IDPESSOA                           '+
              ' AND    EV.IDPESSOA(+)        = BENEFNOMES.IDTITULAR                       '+
              ' AND    EV.IDEVENTOGERADOR(+) = BENEFNOMES.IDEVENTOGERADOR                 ');

      { Inicio Augusto 25/07/2005 - Testar Grupo Participantes antes de filtrar }
      If rgrpParticip.ItemIndex = 1 Then Begin
        //P.RAMOS-19.07.2005-TRATAR MATRICULAS
        if rgFiltro.ItemIndex = 0 Then
          SQL.Add(' AND EL.MATRICULA IN ('+sMatriculas+' ) ')
        Else
          SQL.Add(' AND EL.MATRICULA NOT IN ('+sMatriculas+' ) ');
        //P.RAMOS-19.07.2005-TRATAR MATRICULAS-FIM
      End;
      { Fim Augusto 25/07/2005 }

      //P.RAMOS-31.05.2005-PEND.19350
      if rgPeriodo.itemindex = 1 then
        //NO SEGUNDO PERIODO DE MIGRAÇÃO NÃO ENTRA A CELULAR
        SQL.Add(' AND EL.IDPESSJUR IN (1,50031) ');
      //P.RAMOS-31.05.2005-PEND.19350-FIM

      SQL.Add(' GROUP BY PP.IDPESSJUR, PP.IDPLANOPREV, PP.IDPESSOA,                       '+
              '        PP.SEQPROPOSTA,                                                    '+
              '        EL.IDPESSJUR,                                                      '+
              '        EL.MATRICULA,                                                      '+
              '        SP.FLGINTERNO,                                                     '+
              '        P.NOME,                                                            '+
              '        PF.SEXO,                                                           '+
              '        PF.ESTCIVIL,                                                       '+
              '        PF.DATANASC,                                                       '+
              '        EL.DATAADMISSAO,   PF.DATAMORTE,                                   '+
              '        BENEFNOMES.IDBENEFICIO, BENEFNOMES.NUMEROPROCESSO                  '+
              ' ORDER BY EL.MATRICULA                                                     ');
      Open;
   end;

   if qry.IsEmpty
   then begin
      CloseFile(F);
      Exit;
   end;

   I := 0;
   qry.First;
   while not qry.Eof do
   begin
      inc(i);
      lblProcessando.Caption := IntToStr(i)+' registros processados. ';
      Application.ProcessMessages;

      sLinha :=          PreparaStr(qry.FieldByName('PATROCINADORA').AsString,   1);
      sLinha := sLinha + PreparaStr(qry.FieldByName('PLANO').AsString,           1);

      if      qry.FieldByName('IDBENEFICIO').AsInteger = 5  then sValorAux := '6'
      else if qry.FieldByName('IDBENEFICIO').AsInteger = 6  then sValorAux := '9'
      else if qry.FieldByName('IDBENEFICIO').AsInteger = 7  then sValorAux := '4'
      else if qry.FieldByName('IDBENEFICIO').AsInteger = 8  then sValorAux := '5'
      else if qry.FieldByName('IDBENEFICIO').AsInteger = 9  then sValorAux := '8'
      else if qry.FieldByName('IDBENEFICIO').AsInteger = 14 then sValorAux := '7'
      else sValorAux := '0';

      sLinha := sLinha + ColocaZeros(sValorAux,                                  2);

      sLinha := sLinha + PreparaStr(qry.FieldByName('MATRICULA').AsString,       10);
      sLinha := sLinha + PreparaStr(Copy(qry.FieldByName('NOME').AsString,1,40), 40);
      sLinha := sLinha + PreparaStr(qry.FieldByName('SEXO').AsString,            1);
      sLinha := sLinha + PreparaStr(qry.FieldByName('ESTADOCIVIL').AsString,     1);
      try
         sLinha := sLinha + PreparaStr(FormatDateTime('ddmmyyyy', qry.FieldByName('DATANASC').AsDateTime), 8);
      except
         sLinha := sLinha + '31123000';
      end;

      try
         sLinha := sLinha + PreparaStr(FormatDateTime('ddmmyyyy', qry.FieldByName('DATAADMISSAO').AsDateTime), 8);
      except
         sLinha := sLinha + '31123000';
      end;

      // DATA FILIACAO
      sValorAux := ExecutaRegraFCRT(1400);
      try
         StrToDate(sValorAux);
      except
         sValorAux := '31/12/3000';
      end;
      try
         sLinha := sLinha + PreparaStr(FormatDateTime('ddmmyyyy', StrToDate(sValorAux)), 8);
      except
         sLinha := sLinha + '31123000';
      end;

      try
         sLinha := sLinha + PreparaStr(FormatDateTime('ddmmyyyy', qry.FieldByName('DATAINICIOFUND').AsDateTime), 8);
      except
         sLinha := sLinha + '31123000';
      end;

      try
         sLinha := sLinha + PreparaStr(FormatDateTime('ddmmyyyy', qry.FieldByName('DATAINICIOINSS').AsDateTime), 8);
      except
         sLinha := sLinha + '31123000';
      end;

      sValorAux := ExecutaRegraFCRT(19084); // CAMPO 13 - BENEFICIO ENTIDADE Augusto 28/07/2005 era regra 1345
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha    := sLinha + ColocaZeros(sValorAux,   7);

      sValorAux := ExecutaRegraFCRT(19064); // CAMPO 14 - BENEFICIO INSS Augusto 08/07/2005 era regra 1338 
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha    := sLinha + ColocaZeros(sValorAux,   7);

      sLinha    := sLinha + '1000000'; // FATOR PREVIDENCIARIO - TAMANHO = 7

      sValorAux := ExecutaRegraFCRT(19063); // CAMPO 16 - CONTRIBUICAO Augusto 08/07/2005 era regra 17707
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha    := sLinha + ColocaZeros(sValorAux,   7);

      sValorAux := ExecutaRegraFCRT(19070); // CAMPO 17 - SRB INSS Augusto 08/07/2005 era regra 1341
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha    := sLinha + ColocaZeros(sValorAux,   7);

      sValorAux := ExecutaRegraFCRT(19099); // CAMPO 18 - ABONO Augusto 15/08/2005 era 1335
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha    := sLinha + ColocaZeros(sValorAux,   7);

      sValorAux := ExecutaRegraFCRT(17701); // CAMPO 17 - PROPORCAO
      sValorAux := FormatFloat('##0.00000', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZerosDireita(sValorAux,   6);

      // Dependentes
      sValorDep := MontaDadosDependente;
      sLinha    := sLinha + ColocaZeros(IntToStr(iNumDep),  2);

      sValorAux := ExecutaRegraFCRT(17705); // CAMPO 21 - BENEFICIO PAGO FCRT
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,   7);
      sLinha := sLinha + sValorDep;

      { Inicio Augusto 23/06/2005 }
      // CONTRIBUICAO EXTRA
      sValorAux := ExecutaRegraFCRT(19046);
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,   7); // CAMPO 22 - CONTRIBUICAO EXTRA
      { Fim  Augusto 23/06/2005 }

      { Inicio Augusto 04/07/2005 }
      // PERIODO DE MIGRAÇÃO
      if rgPeriodo.ItemIndex = 0 Then
        sValorAux := ColocaZeros(IntToStr(45),   2)
      Else
        sValorAux := ColocaZeros(IntToStr(62),   2);

      If qry.FieldByName('IDPESSJUR').AsString = '50028' Then
        sValorAux := ColocaZeros(IntToStr(60),   2);

      sLinha := sLinha + ColocaZeros(sValorAux,   2); // CAMPO 23 - PERIODO DE MIGRAÇÃO
      { Fim  Augusto 04/07/2005 }


      // Gleyber - 14/11/2005 - Pendência 20712 - Início
      sValorAux := ColocaZeros(ProcCPF(qry.FieldByName('IDPESSOA').AsString), 11);
      sLinha := sLinha + sValorAux;                                                       //  Campo 24

      sValorAux := PreparaStr(ProcMatAntiga(qry.FieldByName('IDPESSOA').AsString), 9);
      sLinha := sLinha + sValorAux;                                                       //  Campo 25
      // Gleyber - 14/11/2005 - Pendência 20712 - Fim

      writeln(F, sLinha);
      qry.Next;

   end;

   CloseFile(F);

end;

procedure TfrmExportaSimuladorNOVO.GeraExportacaoPENSIONISTAS;
var F : TextFile;
    sLinha, sValorAux : string;
    dValorBase, dValorCota : double;
    sBenefPago : string;
    i : integer;
begin

   memErros.Lines.Add('*** PENSIONISTAS ');

   cCodProcesso := 'P';

   if (Trim(edArqPENSIONISTAS.Text) = '')
   then Exit;

   if FileExists(edArqPENSIONISTAS.Text)  then RenameFile(edArqPENSIONISTAS.Text, edArqPENSIONISTAS.Text+'.old');
   AssignFile(F, edArqPENSIONISTAS.Text);
   Rewrite(F);

   with qry do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT DISTINCT PP.IDPESSJUR, PP.IDPLANOPREV, PP.IDPESSOA, PP.SEQPROPOSTA, '+
              '        DECODE(EL.IDPESSJUR, 1,     1,                                      '+
              '                             50031, 2,                                      '+
              '                             50028, 3  )  AS PATROCINADORA,                 '+
              '        DECODE(PP.IDPLANOPREV, 3, 1,                                        '+
              '                              16, 2    )  AS PLANO,                         '+
              '        EL.MATRICULA,                                                       '+
              '        DECODE(PP.IDPLANOPREV, 3,  ''S'',                                   '+
              '                              16,  ''N'' ) AS FUNDADOR,                     '+
              '        DECODE(SP.FLGINTERNO, ''AT'', ''1'',                                '+
              '                              ''MA'', ''2'',                                '+
              '                              ''MP'', ''3'',                                '+
              '                              ''CA'', ''5'',                                '+
              '                                      ''9'' ) AS TIPO,                      '+
              '        P.NOME,                                                             '+
              '        DECODE(PF.SEXO, ''M'', 1, 2 ) AS SEXO,                              '+
              '        DECODE(PF.ESTCIVIL, ''S'', ''1'',                                   '+
              '                            ''C'', ''2'',                                   '+
              '                            ''V'', ''3'',                                   '+
              '                            ''E'', ''4'',                                   '+
              '                            ''M'', ''5'',                                   '+
              '                            ''D'', ''6'',                                   '+
              '                            ''J'', ''7'',                                   '+
              '                            ''O'', ''8'',                                   '+
              '                            ''P'', ''9''  ) AS ESTADOCIVIL,                 '+
              '        PF.DATANASC,                                                        '+
              '        EL.DATAADMISSAO,   PF.DATAMORTE, BF.IDBENEFICIO,                    '+
              '        MAX(EV.IDSITPLANOATUAL) AS IDSITPLANOATUAL, 0 AS PERCENTUAL,        '+
              '        MAX(BF.DATAINICIOFUND) AS DATAINICIOFUND,                           '+
              '        BENEFNOMES.NUMBENEF                                                 '+
              ' FROM   PESSOA P, PESSOAFISICA PF, ELEGPATRO EL,                            '+
              '        PARTPREVPLAN PP, SITPART SP, BENEFBFCIARIO BF,                      '+
              '        EVENTOSPREV EV, EVENTOGERADOR EG,                                   '+
              '        ( SELECT DISTINCT EL.MATRICULA, COUNT(DISTINCT HST.IDPESSOA) AS NUMBENEF '+
              '          FROM   ELEGPATRO EL, HSTBENEFBFCIARIO HST                         '+
              '          WHERE  HST.MES           = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+''''+
              '          AND    HST.MESREFERENCIA = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+''''+
              '          AND    ((HST.IDBENEFICIO = 11) OR (HST.IDBENEFICIO = 18) )        '+
              '          AND    EL.IDPESSJUR = HST.IDPESSJUR                               '+
              '          AND    EL.IDPESSOA  = HST.IDTITULAR                               '+
              '          AND    HST.FLGENVIADO    <> 9                                     '+
              '          AND    HST.IDMOTIVO      <> 7                                     '+
              '          AND    HST.VLBENEFPGTO   IS NOT NULL                              '+
              '          AND    HST.VLBENEFPGTO   > 0                                      '+
              '          GROUP BY EL.MATRICULA ) BENEFNOMES                                '+
              ' WHERE  EL.MATRICULA          = BENEFNOMES.MATRICULA                        '+
              ' AND    PP.IDPLANOPREV   <> 33                                              '+
              ' AND    PP.FLGDESATIVADO = 0                                                '+
              ' AND    PP.IDSITPART          = SP.IDSITPART                                '+
              ' AND    EL.IDPESSJUR          = PP.IDPESSJUR                                '+
              ' AND    EL.IDPESSOA           = PP.IDPESSOA                                 '+
              ' AND    PF.IDPESSOA           = EL.IDPESSOA                                 '+
              ' AND    P.IDPESSOA            = EL.IDPESSOA                                 '+
              ' AND    BF.IDPESSJUR          = PP.IDPESSJUR                                '+
              ' AND    BF.IDPLANOPREV        = PP.IDPLANOPREV                              '+
              ' AND    BF.IDTITULAR          = PP.IDPESSOA                                 '+
              ' AND    BF.SEQPROPOSTA        = PP.SEQPROPOSTA                              '+
              ' AND    BF.IDBENEFICIO        = 11                                          '+
              ' AND    EV.IDPESSJUR(+)       = PP.IDPESSJUR                                '+
              ' AND    EV.IDPLANOPREV(+)     = PP.IDPLANOPREV                              '+
              ' AND    EV.IDPESSOA(+)        = PP.IDPESSOA                                 '+
              ' AND    EV.SEQPROPOSTA(+)     = PP.SEQPROPOSTA                              '+
              ' AND    EG.IDEVENTOGERADOR(+) = EV.IDEVENTOGERADOR                          '+
              ' AND    EG.FLGINTERNO(+)      = ''FL''                                      ');

      { Inicio Augusto 25/07/2005 - Testar Grupo Participantes antes de filtrar }
      If rgrpParticip.ItemIndex = 1 Then Begin
        //P.RAMOS-19.07.2005-TRATAR MATRICULAS
        if rgFiltro.ItemIndex = 0 Then
          SQL.Add(' AND EL.MATRICULA IN ('+sMatriculas+' ) ')
        Else
          SQL.Add(' AND EL.MATRICULA NOT IN ('+sMatriculas+' ) ');
        //P.RAMOS-19.07.2005-TRATAR MATRICULAS-FIM
      End;
      { Fim Augusto 25/07/2005 }

      //P.RAMOS-31.05.2005-PEND.19350
      if rgPeriodo.itemindex = 1 then
        //NO SEGUNDO PERIODO DE MIGRAÇÃO NÃO ENTRA A CELULAR
        SQL.Add(' AND EL.IDPESSJUR IN (1,50031) ');
      //P.RAMOS-31.05.2005-PEND.19350-FIM

      SQL.Add(' GROUP BY PP.IDPESSJUR, PP.IDPLANOPREV, PP.IDPESSOA, PP.SEQPROPOSTA,        '+
              '        EL.IDPESSJUR,                                                       '+
              '        EL.MATRICULA,                                                       '+
              '        SP.FLGINTERNO,                                                      '+
              '        P.NOME,                                                             '+
              '        PF.SEXO,                                                            '+
              '        PF.ESTCIVIL,                                                        '+
              '        PF.DATANASC,                                                        '+
              '        EL.DATAADMISSAO,   PF.DATAMORTE, BF.IDBENEFICIO,                    '+
              '        BENEFNOMES.NUMBENEF                                                 '+              
              ' ORDER BY EL.MATRICULA                                                      ');
      Open;
   end;

   if qry.IsEmpty
   then begin
      CloseFile(F);
      Exit;
   end;

   i := 0;
   qry.First;
   while not qry.Eof do
   begin
      inc(i);
      lblProcessando.Caption := IntToStr(i)+' registros processados. ';
      Application.ProcessMessages;

      sLinha :=          PreparaStr(qry.FieldByName('PATROCINADORA').AsString,   1);
      sLinha := sLinha + PreparaStr(qry.FieldByName('PLANO').AsString,           1);

      sLinha := sLinha + PreparaStr(qry.FieldByName('IDBENEFICIO').AsString,     2);

      sLinha := sLinha + PreparaStr(qry.FieldByName('MATRICULA').AsString,       10);
      sLinha := sLinha + PreparaStr(Copy(qry.FieldByName('NOME').AsString,1,40), 40);
      sLinha := sLinha + PreparaStr(qry.FieldByName('SEXO').AsString,            1);
      sLinha := sLinha + PreparaStr(FormatDateTime('ddmmyyyy', qry.FieldByName('DATANASC').AsDateTime), 8);
      sLinha := sLinha + PreparaStr(FormatDateTime('ddmmyyyy', qry.FieldByName('DATAADMISSAO').AsDateTime), 8);

      // DATA FILIACAO
      sValorAux := ExecutaRegraFCRT(1401);
      sLinha := sLinha + PreparaStr(FormatDateTime('ddmmyyyy', StrToDate(sValorAux)), 8);

      sLinha := sLinha + PreparaStr(FormatDateTime('ddmmyyyy', qry.FieldByName('DATAMORTE').AsDateTime), 8);
      sLinha := sLinha + PreparaStr(qry.FieldByName('IDSITPLANOATUAL').AsString, 1);
      sLinha := sLinha + PreparaStr(FormatDateTime('ddmmyyyy', qry.FieldByName('DATAINICIOFUND').AsDateTime), 8);

      sValorAux := ExecutaRegraFCRT(19084); // CAMPO 13 - BENEFICIO Augusto 11/08/2005 era regra 1345
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,   7);

      sValorAux := ExecutaRegraFCRT(19064); // CAMPO 14 - INSS Augusto 08/07/2005 era regra 1338 
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,   7);

      sValorAux := ExecutaRegraFCRT(19070); // CAMPO 15 - SRB Augusto 08/07/2005 era regra 1341
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,   7);

      sValorAux := ExecutaRegraFCRT(19099); // CAMPO 16 - ABONO Augusto 15/08/2005 era 1335 
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,   7);

      sValorAux := ExecutaRegraFCRT(17701); // CAMPO 17 - PROPORCAO
      sValorAux := FormatFloat('##0.00000', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZerosDireita(sValorAux,   6);

      sValorAux := ExecutaRegraFCRT(1343); // CAMPO 18 - COTAPENSAO
      sValorAux := OraNumero(FloatToStr(StrToFloat(ClienteNumero(sValorAux)) * 100));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,   3);

      sLinha := sLinha + ColocaZeros(qry.FieldByName('NUMBENEF').AsString,  2);

      sValorAux := ExecutaRegraFCRT(17705); // CAMPO 20 - BENEFICIO PAGO FCRT
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,   7);

      // Dependentes
      sValorAux := MontaDadosDependente;
      sLinha    := sLinha + sValorAux;

      { Inicio Augusto 23/06/2005 }
      // CONTRIBUICAO EXTRA
      sValorAux := ExecutaRegraFCRT(19047);
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,   7);  // CAMPO 21 - CONTRIBUICAO OEXTRA
      { Fim  Augusto 23/06/2005 }

      { Inicio Augusto 04/07/2005 }
      // PERIODO DE MIGRAÇÃO
      if rgPeriodo.ItemIndex = 0 Then
        sValorAux := ColocaZeros(IntToStr(45),   2)
      Else
        sValorAux := ColocaZeros(IntToStr(62),   2);

      If qry.FieldByName('IDPESSJUR').AsString = '50028' Then
        sValorAux := ColocaZeros(IntToStr(60),   2);

      sLinha := sLinha + ColocaZeros(sValorAux,   2);  // CAMPO 22 - PERIODO DE MIGRAÇÃO 
      { Fim  Augusto 04/07/2005 }

      // Gleyber - 14/11/2005 - Pendência 20712 - Início
      sValorAux := ColocaZeros(ProcCPF(qry.FieldByName('IDPESSOA').AsString), 11);
      sLinha := sLinha + sValorAux;                                                       //  Campo 23

      sValorAux := PreparaStr(ProcMatAntiga(qry.FieldByName('IDPESSOA').AsString), 9);
      sLinha := sLinha + sValorAux;                                                       //  Campo 24
      // Gleyber - 14/11/2005 - Pendência 20712 - Fim

      writeln(F, sLinha);
      qry.Next;

   end;

   CloseFile(F);
end;

procedure TfrmExportaSimuladorNOVO.rgrpParticipClick(Sender: TObject);
begin
  inherited;
  if rgrpParticip.ItemIndex = 0
  then tbsSelParticip.TabVisible := False
  else tbsSelParticip.TabVisible := True;
end;

// Gleyber - 14/11/2005 - Pendência 20712 - Início
function TfrmExportaSimuladorNOVO.ProcMatAntiga(sIdPessoa: String): String;
begin
 With qryAux do
  Begin
   Close;
   SQL.Clear;
   SQL.Add('SELECT VALOR');
   SQL.Add('FROM PESSOAPARAM');
   SQL.Add('WHERE IDPESSOA = '+sIdPessoa);
   SQL.Add('  AND IDPARAM = (SELECT IDPARAM');
   SQL.Add('                 FROM PARAMFLAGPESSOA');
   SQL.Add('                 WHERE UPPER(DESCRICAO)='+QuotedStr('MATRICULA ANTIGA')+')');
   Open;

   Result := qryAux.FieldByName('VALOR').AsString;
  End;
end;

function TfrmExportaSimuladorNOVO.ProcCPF(sIdPessoa: String): String;
begin
 With qryAux do
  Begin
   Close;
   SQL.Clear;
   SQL.Add('SELECT NUMDOCUMENTO');
   SQL.Add('FROM DOCPESSOA');
   SQL.Add('WHERE IDPESSOA = '+sIdPessoa);
   SQL.Add('  AND IDDOCUMENTO = (SELECT IDDOCUMENTO');
   SQL.Add('                     FROM TIPODOCPESSOA');
   SQL.Add('                     WHERE UPPER(NOMEDOCUMENTO)='+QuotedStr('CPF')+')');
   Open;

   Result := qryAux.FieldByName('NUMDOCUMENTO').AsString;
  End;
end;
// Gleyber - 14/11/2005 - Pendência 20712 - Fim

end.










