unit FExportaSimulador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, 
  wwdbdatetimepicker, CMDateTimePicker, ComCtrls, URegra;

type
  TfrmExportaSimulador = class(TfrmSairAjuda)
    SaveDlg: TSaveDialog;
    ToolbarSep971: TToolbarSep97;
    bbtnExportar: TBitBtn;
    qry: TwwQuery;
    qryAux: TwwQuery;
    regraAPrev: TRegra;
    qryRegra: TwwQuery;
    qryDadosTemp: TwwQuery;
    PageControl1: TPageControl;
    tbsExportacao: TTabSheet;
    tbsLogErros: TTabSheet;
    lblProcessando: TLabel;
    memErros: TMemo;
    Button1: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    sbtnAtivos: TSpeedButton;
    Label2: TLabel;
    sbtnAssistidos: TSpeedButton;
    Label3: TLabel;
    sbtnPensionistas: TSpeedButton;
    Label5: TLabel;
    sbtnMantidos: TSpeedButton;
    edArqATIVOS: TEdit;
    edArqASSISTIDOS: TEdit;
    edArqPENSIONISTAS: TEdit;
    edArqMantidos: TEdit;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    dtDataREF: TCMDateTimePicker;
    chkAutoPat: TCheckBox;
    rgrpParticip: TRadioGroup;
    tbsSelParticip: TTabSheet;
    memMatriculas: TMemo;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    procedure sbtnAtivosClick(Sender: TObject);
    procedure sbtnAssistidosClick(Sender: TObject);
    procedure sbtnPensionistasClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnExportarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure sbtnMantidosClick(Sender: TObject);
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
    procedure GeraExportacaoAteAgostoATIVOS;
    procedure GeraExportacaoAteAgostoASSISTIDOS;
    procedure GeraExportacaoAteAgostoPENSIONISTAS;
    procedure GeraExportacaoATIVOS;
    procedure GeraExportacaoASSISTIDOS;
    procedure GeraExportacaoPENSIONISTAS;
  end;

var
  frmExportaSimulador: TfrmExportaSimulador;

implementation

uses uMensErro,UConsPart;


{$R *.DFM}

function TfrmExportaSimulador.AnoMesAnterior(iMes, iAno : integer) : string;
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

function TfrmExportaSimulador.SAnoMesAnterior(sAnoMes : string) : string;
var iAno, iMes : integer;
begin
   Result := '';
   iAno := StrToInt(Copy(sAnoMes,1,4));
   iMes := StrToInt(Copy(sAnoMes,6,2));
   Result := AnoMesAnterior(iMes,iAno);
end;

function TfrmExportaSimulador.ColocaZerosDireita( sPalavra : string; iTam : byte ) : string;
var i, iMax : word;

begin
   sPalavra := Trim(sPalavra);

   if Length(sPalavra) >= iTam
   then begin
      Result := sPalavra;
      Exit;
   end;

   iMax := Length(sPalavra) - iTam;
   for i := 1 to iMax do
   begin
      sPalavra := sPalavra + '0';
   end;
end;

function  TfrmExportaSimulador.TiraPonto(sNumero : string ) : string;
var i : word;
    sAux : string;
begin
   sAux := '';
   for i := 1 to Length(sNumero) do
       if (Copy(sNumero,i,1) <> '.') and (Copy(sNumero,i,1) <> ',')
       then sAux := sAux + Copy(sNumero,i,1);

   Result := sAux;
end;

function TfrmExportaSimulador.ClienteNumero(sNumero : string):string;
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

function TfrmExportaSimulador.OraNumero(sNumero : string):string;
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

function TfrmExportaSimulador.RegraString ( sNumRegra, sSQL : string; var bErro : boolean; var piIdCalculo : longInt ) : string;
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


function  TfrmExportaSimulador.ExecutaRegraFCRT(piNumRegra : longint) : string;
var sSQL       : string;
    iIdCalculo : longint;
    bErro      : boolean;
    sResultado : string;
begin

    Result := ' ';
    if (Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataREF.Text),4,2) >= '2002/08') and
       ((cCodProcesso = 'P') or (cCodProcesso = 'S')) and (piNumRegra <> 1400) and (piNumRegra <> 1401) 
    then begin
       if cCodProcesso = 'P'
       then begin
          sSQL := ' SELECT DISTINCT '''+Trim(dtDataREF.Text)+''' AS DATAREF,                                   '+
                  ''''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataREF.Text),4,2)+''' AS MESREFERENCIA, '+
                  '        EL.MATRICULA,   PP.REQUERIMENTODATA,                                                '+
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

function TfrmExportaSimulador.ColocaZeros(Codigo:string;Tam:byte):string;
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

function TfrmExportaSimulador.PreparaStr(Codigo : string; Tam : byte) : string;
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

function  TfrmExportaSimulador.MontaDadosDependente;
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
              ' AND    D.IDSITDEPENDENTE <> 2                                                 '+ // 2 = cancelado
              ' AND    ( ( (DP.IDDEPENDENCIA  = ''COM'') AND (D.IDSITDEPENDENTE = 1) ) OR     '+
              '          ( (DP.IDDEPENDENCIA  = ''COP'') AND (D.IDSITDEPENDENTE = 1) ) OR     '+
              '          ( (DP.IDDEPENDENCIA  = ''FIL'') AND (D.IDSITDEPENDENTE = 3) ) OR     '+
              '          ( (DP.IDDEPENDENCIA  = ''OUT'') AND (TRUNC(MONTHS_BETWEEN(TO_DATE(''' +
              dtDataREF.text+''',''DD/MM/YYYY''),NVL(PF.DATANASC,SYSDATE))/12 ,0) > 24 ) ) OR '+
              '          ( (DP.IDDEPENDENCIA  = ''DES'') AND (D.IDSITDEPENDENTE = 1) )  )     '+
              sSQLAux                                                                          +
              ' ORDER  BY PF.DATANASC DESC                                                    ');
      Open;
      while not Eof do
      begin
         inc(iNumDep);

         if iNumDep <= 10
         then begin
            if FieldByName('DATANASC').AsString <> ''
            then sDependentes := sDependentes + PreparaStr(FormatDateTime('ddmmyyyy', FieldByName('DATANASC').AsDateTime), 8)+
                                                PreparaStr(FieldByName('SEXO').AsString,     1 )+
                                                PreparaStr('V',                              1 )
            else sDependentes := sDependentes + '00000000'+
                                                PreparaStr(FieldByName('SEXO').AsString,     1 )+
                                                PreparaStr('V',                              1 );
         end;


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
              ' AND    D.IDSITDEPENDENTE <> 2 '+ // 2 = cancelado
              ' AND    ( (DP.IDDEPENDENCIA  = ''FIL'') AND (D.IDSITDEPENDENTE IN (1,4) ) OR '+
              '          ( (DP.IDDEPENDENCIA  = ''OUT'') AND (TRUNC(MONTHS_BETWEEN(TO_DATE('''+dtDataREF.text+''',''DD/MM/YYYY''),NVL(PF.DATANASC,SYSDATE))/12 ,0) <= 24 )  )  ) '+
              sSQLAux+
              ' ORDER  BY PF.DATANASC DESC ');
      Open;
      while not Eof do
      begin
         inc(iNumDep);

         if iNumDep <= 10
         then begin
            if FieldByName('DATANASC').AsString <> ''
            then sDependentes := sDependentes + PreparaStr(FormatDateTime('ddmmyyyy', FieldByName('DATANASC').AsDateTime), 8)+
                                                PreparaStr(FieldByName('SEXO').AsString,     1 )+
                                                PreparaStr('T',                              1 )
            else sDependentes := sDependentes + '00000000'+
                                                PreparaStr(FieldByName('SEXO').AsString,     1 )+
                                                PreparaStr('T',                              1 );
         end;
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

function  TfrmExportaSimulador.BuscaTaxaJoia  : string;
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


function  TfrmExportaSimulador.BuscaRemuneracao : string;
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
         sRubrica := '3424,8029,22041';
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

function  TfrmExportaSimulador.BuscaSalParticipacao : string;
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
          if qry.FieldByName('PATROCINADORA').AsString      = '1' // FCRT
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


function  TfrmExportaSimulador.BuscaCONTRIBUICAO : string;
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
         if qry.FieldByName('PLANO').AsString = '1' // FUNDADOR
         then sRubrica := ' AND    (H.IDRUBRICA = 812) '
         else sRubrica := ' AND    (H.IDRUBRICA = 794) ';
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

      SQL.Add(' SELECT /*+ RULE */ SUM(H.VALORPROVENTO) AS VALORPROVENTO        '+
              ' FROM   HISTRUBSAL H                                             '+
              ' WHERE  (H.IDPESSOA  = '+qry.FieldByName('IDPESSOA').AsString+') '+
              ' AND    (H.MES       = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+''')'+
              sRubrica);
      Open;

      if (not IsEmpty) and (FieldByName('VALORPROVENTO').AsFloat > 0)
      then Result := FieldByName('VALORPROVENTO').AsString;
   end;
end;

function  TfrmExportaSimulador.BuscaJOIA : string;
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
      SQL.Add(' SELECT /*+ RULE */ SUM(H.VALORPROVENTO) AS VALORPROVENTO '+
              ' FROM   HISTRUBSAL H    '+
              ' WHERE  (H.IDPESSOA  = '+qry.FieldByName('IDPESSOA').AsString+') '+
              ' AND    (H.MES       = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+''')'+
              sRubrica);
      Open;

      if (not IsEmpty) and (FieldByName('VALORPROVENTO').AsFloat > 0)
      then Result := FieldByName('VALORPROVENTO').AsString;
   end;
end;

function  TfrmExportaSimulador.BuscaReservaTributavel : string;
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

function  TfrmExportaSimulador.BuscaReservaNAOTributavel : string;
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

function  TfrmExportaSimulador.BuscaSuplementacaoBruta : string;
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

function  TfrmExportaSimulador.BuscaDataInicioAuxDoenca : string;
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

procedure TfrmExportaSimulador.GeraExportacaoAteAgostoATIVOS;
var F : TextFile;
    sLinha, sValorAux : string;
    i : word;
begin

   if chkAutoPat.Checked
   then begin
       memErros.Lines.Add('*** AUTOPATROCINADOS');
      cCodProcesso := 'A';
      if (Trim(edArqMANTIDOS.Text) = '')
      then Exit;

      if FileExists(edArqMantidos.Text)  then RenameFile(edArqMantidos.Text, edArqMantidos.Text+'.old');
      AssignFile(F, edArqMANTIDOS.Text);
      Rewrite(F);
   end
   else  begin
      memErros.Lines.Add('*** ATIVOS ');
      cCodProcesso := 'A';
      if (Trim(edArqATIVOS.Text) = '')
      then Exit;

      if FileExists(edArqAtivos.Text)  then RenameFile(edArqAtivos.Text, edArqAtivos.Text+'.old');
      AssignFile(F, edArqAtivos.Text);
      Rewrite(F);
   end;

   with qry do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT PP.IDPESSJUR, PP.IDPLANOPREV, PP.IDPESSOA, PP.SEQPROPOSTA, '+
              '        DECODE(EL.IDPESSJUR, 1,     1,                             '+
              '                             50031, 2,                             '+
              '                             50028, 3  )  AS PATROCINADORA,        '+
              '        DECODE(PP.IDPLANOPREV, 3, 1,                               '+
              '                              16, 2    )  AS PLANO,                '+
              '        EL.MATRICULA,                                              '+
              '        DECODE(PP.IDPLANOPREV, 3,  ''S'',                          '+
              '                              16,  ''N'' ) AS FUNDADOR,            '+
              '        SP.FLGINTERNO, PP.IDSITPART,                               '+
              '        DECODE(SP.FLGINTERNO, ''AT'', ''1'',                       '+
              '                              ''MA'', ''2'',                       '+
              '                              ''MP'', ''3'',                       '+
              '                              ''CA'', ''1'',                       '+
              '                                      ''9'' ) AS TIPO,             '+
              '        P.NOME,                                                    '+
              '        DECODE(PF.SEXO, ''M'', 1, 2 ) AS SEXO,                     '+
              '        DECODE(PF.ESTCIVIL, ''S'', ''1'',                          '+
              '                            ''C'', ''2'',                          '+
              '                            ''V'', ''3'',                          '+
              '                            ''E'', ''4'',                          '+
              '                            ''M'', ''5'',                          '+
              '                            ''D'', ''6'',                          '+
              '                            ''J'', ''7'',                          '+
              '                            ''O'', ''8'',                          '+
              '                            ''P'', ''9''  ) AS ESTADOCIVIL,        '+
              '        PF.DATANASC,                                               '+
              '        EL.DATAADMISSAO                                            '+
              ' FROM   PESSOA P, PESSOAFISICA PF, ELEGPATRO EL, ATIVOSTEMP ATEMP, '+
              '        PARTPREVPLAN PP, SITPART SP                                '+
              ' WHERE  ATEMP.ANOMESREF = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+'''');
      if chkAutoPat.checked
      then SQL.Add('AND ATEMP.TIPO = ''2'' ');

      if Trim(sMatriculas) <> ''
      then SQL.Add('AND ATEMP.MATRICULA IN ('+sMatriculas+') ');

      SQL.Add(' AND    PP.IDSITPLANOPREV <> 13                                    '+
              ' AND    PP.IDPLANOPREV    IN (3,16)                                '+
              ' AND    EL.MATRICULA      = ATEMP.MATRICULA                        '+
              ' AND    PP.IDSITPART      = SP.IDSITPART                           '+
              ' AND    EL.IDPESSJUR      = PP.IDPESSJUR                           '+
              ' AND    EL.IDPESSOA       = PP.IDPESSOA                            '+
              ' AND    PF.IDPESSOA       = EL.IDPESSOA                            '+
              ' AND    P.IDPESSOA        = EL.IDPESSOA                            '+
              ' ORDER BY EL.MATRICULA                                             ');
      Open;
   end;

   if qry.IsEmpty
   then begin
      CloseFile(F);
      Exit;
   end;

   with qryDadosTemp do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT MATRICULA,                                  '+
              '        NVL(REMUNERACAO, 0)    AS REMUNERACAO,      '+
              '        NVL(SALPARTICIPACAO,0) AS SALPARTICIPACAO,  '+
              '        NVL(CONTRIBUICAO, 0)   AS CONTRIBUICAO,     '+
              '        NVL(JOIA, 0)           AS JOIA,             '+
              '        NVL(RPTRIBUTAVEL, 0)   AS RPTRIBUTAVEL,     '+
              '        NVL(RPNAOTRIBUTAVEL,0) AS RPNAOTRIBUTAVEL,  '+
              '        NVL(TIPO,''1'')        AS TIPO,             '+
              '        SRB, SRBATUALIZADO, IDADE, INSS             '+
              ' FROM   ATIVOSTEMP '+
              ' WHERE  ANOMESREF = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+'''');

      if chkAutoPat.checked
      then SQL.Add('AND TIPO = ''2'' ');

      if Trim(sMatriculas) <> ''
      then SQL.Add('AND MATRICULA IN ('+sMatriculas+') ');

      SQL.Add(' ORDER  BY MATRICULA ');
      Open;
   end;

   i := 0;
   qry.First;

   while not qry.Eof do
   begin
      inc(i);
      lblProcessando.Caption := IntToStr(i)+' registros processados. ';
      Application.ProcessMessages;
      qryDadosTemp.Locate('MATRICULA', qry.FieldByName('MATRICULA').AsString, [loCaseInsensitive]);

      // ATUALIZAR TEMPO DE SERVICO
      ProcessaHistContrib( qryAux,
                           qry.FieldByName('IDPESSOA').AsInteger,
                           DateToStr(date));


      sLinha :=          PreparaStr(qry.FieldByName('PATROCINADORA').AsString,   1);
      sLinha := sLinha + PreparaStr(qry.FieldByName('PLANO').AsString,           1);
      sLinha := sLinha + PreparaStr(qry.FieldByName('MATRICULA').AsString,       10);
      sLinha := sLinha + PreparaStr(qry.FieldByName('FUNDADOR').AsString,        1);

      sValorAux := qryDadosTemp.FieldByName('TIPO').AsString;
      sLinha := sLinha + PreparaStr(sValorAux,                                    1);
      sLinha := sLinha + PreparaStr(Copy(qry.FieldByName('NOME').AsString,1,40), 40);
      sLinha := sLinha + PreparaStr(qry.FieldByName('SEXO').AsString,             1);
      sLinha := sLinha + PreparaStr(qry.FieldByName('ESTADOCIVIL').AsString,      1);
      sLinha := sLinha + PreparaStr(FormatDateTime('ddmmyyyy', qry.FieldByName('DATANASC').AsDateTime), 8);
      sLinha := sLinha + PreparaStr(FormatDateTime('ddmmyyyy', qry.FieldByName('DATAADMISSAO').AsDateTime), 8);

      // DATA FILIACAO
      sValorAux := ExecutaRegraFCRT(1396);
      sLinha := sLinha + PreparaStr(FormatDateTime('ddmmyyyy', StrToDate(sValorAux)), 8);

      // REMUNERACAO
      sLinha := sLinha + ColocaZeros(qryDadosTemp.FieldByName('REMUNERACAO').AsString,  7);

      // SAL. PARTICIPACAO
      sValorAux := '0';
      sLinha := sLinha + ColocaZeros(qryDadosTemp.FieldByName('SALPARTICIPACAO').AsString,  7);

      // CONTRIBUICAO ATUAL
      sValorAux := '0';
      sLinha := sLinha + ColocaZeros(qryDadosTemp.FieldByName('CONTRIBUICAO').AsString,  7);

      // TEMPO TOTAL DE INSS
      sValorAux := ExecutaRegraFCRT(1391);
      sLinha := sLinha + ColocaZeros(sValorAux,  3);

      // CONTRIBUICAO JOIA ATUAL
      sValorAux := '0';
      sLinha := sLinha + ColocaZeros(qryDadosTemp.FieldByName('JOIA').AsString,  7);

      // PRAZO PAGTO JOIA
      sValorAux := ExecutaRegraFCRT(1535);// (1393);
      sLinha := sLinha + ColocaZeros(sValorAux,   3);

      // PRAZO DE JOIA PAGO
      sValorAux := ExecutaRegraFCRT(1623); // (1395);
      sLinha := sLinha + ColocaZeros(sValorAux,   3);

      // TAXA DE JOIA
      sValorAux := BuscaTaxaJoia;
      sValorAux := FormatFloat('##0.0000000', StrToFloat(sValorAux));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,  8);

      // RESERVA TRIBUTAVEL
      sValorAux := '0';
      sLinha := sLinha + ColocaZeros(Trim(qryDadosTemp.FieldByName('RPTRIBUTAVEL').AsString),  12);

      // RESERVA NAO TRIBUTAVEL
      sValorAux := '0';
      sLinha := sLinha + ColocaZeros(Trim(qryDadosTemp.FieldByName('RPNAOTRIBUTAVEL').AsString),  12);

      // SRB
      sValorAux := ExecutaRegraFCRT(1388);
//      sValorAux := FloatToStr(qryDadosTemp.FieldByName('SRB').AsFloat/100); // provisorio
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,   12);

      // SRB ATUALIZADO
      sValorAux := ExecutaRegraFCRT(1390);
//      sValorAux := FloatToStr(qryDadosTemp.FieldByName('SRBATUALIZADO').AsFloat/100); // provisorio
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,   12);

      // INSS
      sValorAux := ExecutaRegraFCRT(1377);
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,   12);

      // FATOR PREVIDENCIARIO
      sValorAux := ExecutaRegraFCRT(1369);
      if StrToFloat(ClienteNumero(sValorAux)) > 1
      then  sValorAux := '10000000'
      else  sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZerosDireita( sValorAux,   8);

      // TEMPO MINIMO DE CONTRIBUICAO
      sValorAux := ExecutaRegraFCRT(1353);
      sValorAux := TiraPonto(sValorAux);
      sLinha    := sLinha + ColocaZeros(sValorAux,   2);

      // IDADE NA APOSENTADORIA
      sValorAux := ExecutaRegraFCRT(1366);
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,   3);

      // Dependentes
      sValorAux := MontaDadosDependente;
      sLinha := sLinha + ColocaZeros(IntToStr(iNumDep) ,      2);
      sLinha := sLinha + sValorAux;

      writeln(F, sLinha);
      qry.Next;
   end;


   CloseFile(F);
end;

procedure TfrmExportaSimulador.GeraExportacaoAteAgostoASSISTIDOS;
var F : TextFile;
    sLinha, sValorAux, sBenefPago : string;
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
              '        NVL(BENEF.IDBENEFICIO,0)                       AS IDBENEFICIO,     '+
              '        NVL(BENEF.NUMEROPROCESSO,0)                    AS NUMEROPROCESSO,  '+
              '        MAX(NVL(EV.DATAEVENTO,        ''31/12/9999'')) AS DATAINICIOFUND,  '+
              '        MAX(NVL(BENEF.DATAINICIOINSS, ''31/12/9999'')) AS DATAINICIOINSS   '+
              ' FROM   PESSOA P, PESSOAFISICA PF, ELEGPATRO EL, EVENTOSPREV EV,           '+
              '        PARTPREVPLAN PP, SITPART SP,                                       '+
              '        ASSISTTEMP ATEMP,                                                  '+
              '       ( SELECT BF.NUMEROPROCESSO, BF.IDTITULAR, BF.IDBENEFICIO,           '+
              '                BF.DATAINICIOFUND,                                         '+
              '                B.IDEVENTOGERADOR,                                         '+
              '                BF.DATAINICIOINSS                                          '+
              '         FROM   BENEFICIO B, BENEFBFCIARIO BF                              '+
              '         WHERE  BF.IDBENEFICIO IN (5,6,7,8,9,14)                           '+
              '         AND    B.IDBENEFICIO = BF.IDBENEFICIO ) BENEF                     '+
              ' WHERE  ATEMP.ANOMESREF = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+''''+
              ' AND    EL.MATRICULA       = ATEMP.MATRICULA                               '+
              ' AND    PP.IDSITPART       = SP.IDSITPART                                  '+
              ' AND    EL.IDPESSJUR       = PP.IDPESSJUR                                  '+
              ' AND    EL.IDPESSOA        = PP.IDPESSOA                                   '+
              ' AND    PF.IDPESSOA        = EL.IDPESSOA                                   '+
              ' AND    P.IDPESSOA         = EL.IDPESSOA                                   '+
              ' AND    BENEF.IDTITULAR(+)    = PP.IDPESSOA                                '+
              ' AND    EV.IDPESSOA(+)        = BENEF.IDTITULAR                            '+
              ' AND    EV.IDEVENTOGERADOR(+) = BENEF.IDEVENTOGERADOR                      '+
              ' GROUP BY PP.IDPESSJUR, PP.IDPLANOPREV, PP.IDPESSOA,                       '+
              '        PP.SEQPROPOSTA,                                                    '+
              '        EL.IDPESSJUR,                                                      '+
              '        EL.MATRICULA,                                                      '+
              '        SP.FLGINTERNO,                                                     '+
              '        P.NOME,                                                            '+
              '        PF.SEXO,                                                           '+
              '        PF.ESTCIVIL,                                                       '+
              '        PF.DATANASC,                                                       '+
              '        EL.DATAADMISSAO,   PF.DATAMORTE,                                   '+
              '        BENEF.IDBENEFICIO, BENEF.NUMEROPROCESSO                            '+
              ' ORDER BY EL.MATRICULA                                                     ');
      Open;
   end;

   if qry.IsEmpty
   then begin
      CloseFile(F);
      Exit;
   end;

   with qryDadosTemp do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT MATRICULA, SRB, SRBATUALIZADO, ABONO, INSS, BENEFICIO, CONTRIBUICAO, PROPORCAO, BENEFICIOPAGO  '+
              ' FROM   ASSISTTEMP   '+
              ' WHERE  ANOMESREF = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+''''+
              ' ORDER  BY MATRICULA ');
      Open;
   end;

   qry.First;
   while not qry.Eof do
   begin

      qryDadosTemp.Locate('MATRICULA', qry.FieldByName('MATRICULA').AsString, [loCaseInsensitive]);

      sLinha :=          PreparaStr(qry.FieldByName('PATROCINADORA').AsString,   1);
      sLinha := sLinha + PreparaStr(qry.FieldByName('PLANO').AsString,           1);

      if      qry.FieldByName('IDBENEFICIO').AsInteger = 5  then sValorAux := '6'
      else if qry.FieldByName('IDBENEFICIO').AsInteger = 6  then sValorAux := '9'
      else if qry.FieldByName('IDBENEFICIO').AsInteger = 7  then sValorAux := '4'
      else if qry.FieldByName('IDBENEFICIO').AsInteger = 8  then sValorAux := '5'
      else if qry.FieldByName('IDBENEFICIO').AsInteger = 9  then sValorAux := '8'
      else if qry.FieldByName('IDBENEFICIO').AsInteger = 14 then sValorAux := '14'
      else sValorAux := '0';

      sLinha := sLinha + ColocaZeros(sValorAux,                                  2);

      sLinha := sLinha + PreparaStr(qry.FieldByName('MATRICULA').AsString,       10);
      sLinha := sLinha + PreparaStr(Copy(qry.FieldByName('NOME').AsString,1,40), 40);
      sLinha := sLinha + PreparaStr(qry.FieldByName('SEXO').AsString,            1);
      sLinha := sLinha + PreparaStr(qry.FieldByName('ESTADOCIVIL').AsString,     1);
      sLinha := sLinha + PreparaStr(FormatDateTime('ddmmyyyy', qry.FieldByName('DATANASC').AsDateTime), 8);
      sLinha := sLinha + PreparaStr(FormatDateTime('ddmmyyyy', qry.FieldByName('DATAADMISSAO').AsDateTime), 8);

      // DATA FILIACAO
      sValorAux := ExecutaRegraFCRT(1400);
      sLinha := sLinha + PreparaStr(FormatDateTime('ddmmyyyy', StrToDate(sValorAux)), 8);

      sLinha := sLinha + PreparaStr(FormatDateTime('ddmmyyyy', qry.FieldByName('DATAINICIOFUND').AsDateTime), 8);
      sLinha := sLinha + PreparaStr(FormatDateTime('ddmmyyyy', qry.FieldByName('DATAINICIOINSS').AsDateTime), 8);

      sLinha := sLinha + ColocaZeros(qryDadosTemp.FieldByName('BENEFICIO').AsString,      7);
      sLinha := sLinha + ColocaZeros(qryDadosTemp.FieldByName('INSS').AsString,           7);
      sLinha := sLinha + '1000000'; // FATOR PREVIDENCIARIO - TAMANHO = 7                                                 
      sLinha := sLinha + ColocaZeros(qryDadosTemp.FieldByName('CONTRIBUICAO').AsString,   7);
      sLinha := sLinha + ColocaZeros(qryDadosTemp.FieldByName('SRBATUALIZADO').AsString,  7);
      sLinha := sLinha + ColocaZeros(qryDadosTemp.FieldByName('ABONO').AsString,          7);
      sLinha := sLinha + ColocaZeros(qryDadosTemp.FieldByName('PROPORCAO').AsString,      6);

      // Dependentes
      sValorAux := MontaDadosDependente;
      sLinha := sLinha + ColocaZeros(IntToStr(iNumDep) ,                                  2);

      if Copy(dtDataREF.Text,7,4)+'/'+Copy(dtDataREF.Text,4,2) >= '2002/08'
      then begin
         if Copy(dtDataREF.Text,7,4)+'/'+Copy(dtDataREF.Text,4,2) = '2002/08'
         then sBenefPago := qryDadosTemp.FieldByName('BENEFICIOPAGO').AsString
         else sBenefPago := BuscaSuplementacaoBruta; // SÓ A PARTIR DE SETEMBRO/2002
         sLinha := sLinha + ColocaZeros(sBenefPago,                                       7);
      end;

      sLinha := sLinha + sValorAux;

      writeln(F, sLinha);
      qry.Next;

   end;

   CloseFile(F);

end;

procedure TfrmExportaSimulador.GeraExportacaoAteAgostoPENSIONISTAS;
var F : TextFile;
    sLinha, sValorAux : string;
    dValorBase, dValorCota : double;
    iNumDepPensao : longint;
    sBenefPago : string; 
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
              '        MAX(EV.IDSITPLANOATUAL) AS IDSITPLANOATUAL, 0 AS PERCENTUAL,                                '+
              '        MAX(BF.DATAINICIOFUND) AS DATAINICIOFUND                            '+              
              ' FROM   PESSOA P, PESSOAFISICA PF, ELEGPATRO EL, PENSAOTEMP ATEMP,          '+
              '        PARTPREVPLAN PP, SITPART SP, BENEFBFCIARIO BF,                      '+
              '        EVENTOSPREV EV, EVENTOGERADOR EG                                    '+
              ' WHERE  ATEMP.ANOMESREF        = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+''''+
              ' AND    EL.MATRICULA           = ATEMP.MATRICULA                                '+
              ' AND    PP.IDSITPART           = SP.IDSITPART                                   '+
              ' AND    EL.IDPESSJUR           = PP.IDPESSJUR                                   '+
              ' AND    EL.IDPESSOA            = PP.IDPESSOA                                    '+
              ' AND    PF.IDPESSOA        = EL.IDPESSOA                                    '+
              ' AND    P.IDPESSOA         = EL.IDPESSOA                                    '+
              ' AND    BF.IDPESSJUR       = PP.IDPESSJUR                                   '+
              ' AND    BF.IDPLANOPREV     = PP.IDPLANOPREV                                 '+
              ' AND    BF.IDTITULAR       = PP.IDPESSOA                                    '+
              ' AND    BF.SEQPROPOSTA     = PP.SEQPROPOSTA                                 '+
              ' AND    BF.IDBENEFICIO     = 11                                             '+
              ' AND    EV.IDPESSJUR(+)        = PP.IDPESSJUR                                '+
              ' AND    EV.IDPLANOPREV(+)      = PP.IDPLANOPREV                              '+
              ' AND    EV.IDPESSOA(+)         = PP.IDPESSOA                                 '+
              ' AND    EV.SEQPROPOSTA(+)      = PP.SEQPROPOSTA                              '+
              ' AND    EG.IDEVENTOGERADOR(+)  = EV.IDEVENTOGERADOR                          '+
              ' AND    EG.FLGINTERNO(+)       = ''FL''                                     '+
              ' GROUP BY PP.IDPESSJUR, PP.IDPLANOPREV, PP.IDPESSOA, PP.SEQPROPOSTA,        '+
              '        EL.IDPESSJUR,                                                       '+
              '        EL.MATRICULA,                                                       '+
              '        SP.FLGINTERNO,                                                      '+
              '        P.NOME,                                                             '+
              '        PF.SEXO,                                                            '+
              '        PF.ESTCIVIL,                                                        '+
              '        PF.DATANASC,                                                        '+
              '        EL.DATAADMISSAO,   PF.DATAMORTE, BF.IDBENEFICIO                    '+
              ' ORDER BY EL.MATRICULA                                                      ');
      Open;
   end;

   if qry.IsEmpty
   then begin
      CloseFile(F);
      Exit;
   end;

   with qryDadosTemp do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT MATRICULA, SRB, SRBATUALIZADO, ABONO, INSS, BENEFICIO, PROPORCAO, NUMDEPPENSAO, BENEFICIOPAGO '+
              ' FROM   PENSAOTEMP                                                                                    '+
              ' WHERE  ANOMESREF = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+''''+
              ' ORDER  BY MATRICULA ');
      Open;
   end;

   qry.First;
   while not qry.Eof do
   begin

      qryDadosTemp.Locate('MATRICULA', qry.FieldByName('MATRICULA').AsString, [loCaseInsensitive]);
      iNumDep := qryDadosTemp.FieldByName('NUMDEPPENSAO').AsInteger;

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

      sLinha := sLinha + ColocaZeros(qryDadosTemp.FieldByName('BENEFICIO').AsString,     7);
      sLinha := sLinha + ColocaZeros(qryDadosTemp.FieldByName('INSS').AsString,          7);
      sLinha := sLinha + ColocaZeros(qryDadosTemp.FieldByName('SRBATUALIZADO').AsString, 7);
      sLinha := sLinha + ColocaZeros(qryDadosTemp.FieldByName('ABONO').AsString,         7);
      sLinha := sLinha + ColocaZeros(qryDadosTemp.FieldByName('PROPORCAO').AsString,     6);

      // COTA DE PENSAO
//      sValorAux := ExecutaRegraFCRT(1343);
      if qry.FieldByName('IDPLANOPREV').AsInteger = 3
      then begin // fundador
        dValorBase    := 50;
        iNumDepPensao := qryDadosTemp.FieldByName('NUMDEPPENSAO').AsInteger;

        dValorCota    := dValorBase + ( iNumDepPensao * 10 );

      end
      else begin // alternativo
        dValorBase    := 75;
        iNumDepPensao := qryDadosTemp.FieldByName('NUMDEPPENSAO').AsInteger;

        dValorCota    := dValorBase + ( iNumDepPensao * 5 );
      end;

      if dValorCota > 100 then dValorCota := 100;

      sValorAux := FloatToStr(dValorCota);
      sLinha    := sLinha + ColocaZeros(sValorAux,                                       3);

      sLinha := sLinha + ColocaZeros(qryDadosTemp.FieldByName('NUMDEPPENSAO').AsString,  2);

      if Copy(dtDataREF.Text,7,4)+'/'+Copy(dtDataREF.Text,4,2) >= '2002/08'
      then begin
         if Copy(dtDataREF.Text,7,4)+'/'+Copy(dtDataREF.Text,4,2) = '2002/08'
         then sBenefPago := qryDadosTemp.FieldByName('BENEFICIOPAGO').AsString
         else sBenefPago := BuscaSuplementacaoBruta; // SÓ A PARTIR DE SETEMBRO/2002
         sLinha := sLinha + ColocaZeros(sBenefPago,                                       7);
      end;

      // Dependentes
      sValorAux := MontaDadosDependente;
      sLinha := sLinha + sValorAux;

      writeln(F, sLinha);
      qry.Next;

   end;

   qryDadosTemp.Close;
   CloseFile(F);
end;

procedure TfrmExportaSimulador.sbtnAtivosClick(Sender: TObject);
begin
  inherited;
  if SaveDlg.Execute
  then edArqATIVOS.Text := SaveDlg.FileName;
end;

procedure TfrmExportaSimulador.sbtnAssistidosClick(Sender: TObject);
begin
  inherited;
  if SaveDlg.Execute
  then edArqASSISTIDOS.Text := SaveDlg.FileName;

end;

procedure TfrmExportaSimulador.sbtnPensionistasClick(Sender: TObject);
begin
  inherited;
  if SaveDlg.Execute
  then edArqPENSIONISTAS.Text := SaveDlg.FileName;

end;

procedure TfrmExportaSimulador.FormShow(Sender: TObject);
begin
  inherited;
  dtDataRef.Text         := DateToStr(date);
  lblProcessando.Visible := True;
  tbsSelParticip.TabVisible := False;
  PageControl1.ActivePage   := tbsExportacao;
end;

procedure TfrmExportaSimulador.bbtnExportarClick(Sender: TObject);
var i : word;
begin
  inherited;
  memErros.Lines.Clear;
  chkAutoPat.Checked := False;

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



  if (Copy(dtDataREF.Text,7,4)+'/'+Copy(dtDataREF.Text,4,2) <= '2002/08')
  then begin
     GeraExportacaoAteAgostoATIVOS;
     GeraExportacaoAteAgostoASSISTIDOS;
     GeraExportacaoAteAgostoPENSIONISTAS;
  end
  else begin
     GeraExportacaoATIVOS;
     if Trim(edArqMantidos.Text) <> ''
     then begin
        chkAutoPat.Checked := True;
        GeraExportacaoAteAgostoATIVOS;
     end;
     GeraExportacaoASSISTIDOS;
     GeraExportacaoPENSIONISTAS;
  end;

  MsgDlg('Término da Geração dos Arquivos. Arquivos Gerados com Sucesso.','Informação', mtInformation, [mbOK],0);

end;

procedure TfrmExportaSimulador.GeraExportacaoATIVOS;
var F : TextFile;
    sLinha, sValorAux : string;
    i : word;
    sDataInicioAD : string;
begin

   memErros.Lines.Add('*** ATIVOS ');

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
      then SQL.Add(' WHERE  SP.FLGINTERNO IN (''AT'', ''MA'')                            '+
              ' AND    ( (EL.DATADEMISSAO IS NULL) OR (TO_CHAR(EL.DATADEMISSAO,''YYYY/MM'') >= '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+'''))'+
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
              ' AND    NOT EXISTS ( SELECT A.MATRICULA                              '+
              '                     FROM   ATIVOSTEMP A                             '+
              '                     WHERE  A.ANOMESREF = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+''''+
              '                     AND    A.MATRICULA = EL.MATRICULA               '+
              '                     AND    A.TIPO      = ''2'' )                    '+
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
              '        SP.FLGINTERNO, PP.IDSITPART,                                 '+
              '                              ''9''  AS TIPO,                        '+
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
              '                     FROM   HSTBENEFBFCIARIO HST                     '+
              '                     WHERE  HST.MES           = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+''''+
              '                     AND    HST.MESREFERENCIA = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+''''+
              '                     AND    HST.IDPESSJUR = PP.IDPESSJUR             '+
              '                     AND    HST.IDPLANOPREV = PP.IDPLANOPREV         '+
              '                     AND    HST.IDPESSOA    = PP.IDPESSOA            '+
              '                     AND    HST.SEQPROPOSTA = PP.SEQPROPOSTA         '+
              '                     AND    HST.FLGENVIADO  <> 9                     '+
              '                     AND    HST.IDBENEFICIO IN (1,2) )               '+
              ' AND    NOT EXISTS ( SELECT A.MATRICULA                              '+
              '                     FROM   ATIVOSTEMP A                             '+
              '                     WHERE  A.ANOMESREF = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+''''+
              '                     AND    A.MATRICULA = EL.MATRICULA               '+
              '                     AND    A.TIPO      = ''2'' )                    '+
              ' ) ORDER BY MATRICULA ')
      else SQL.Add(' WHERE  EL.MATRICULA IN ('+sMatriculas+' )                      '+
              ' AND    PP.IDPLANOPREV   <> 33                                       '+
              ' AND    PP.FLGDESATIVADO = 0                                         '+
              ' AND    PP.IDSITPART      = SP.IDSITPART                             '+
              ' AND    EL.IDPESSJUR      = PP.IDPESSJUR                             '+
              ' AND    EL.IDPESSOA       = PP.IDPESSOA                              '+
              ' AND    PF.IDPESSOA       = EL.IDPESSOA                              '+
              ' AND    P.IDPESSOA        = EL.IDPESSOA                              '+
              ' ) ORDER BY MATRICULA ');
      Open;
   end;

   qry.sql.SaveToFile('c:\qryativos.txt');
   if qry.IsEmpty
   then begin
      CloseFile(F);
      Exit;
   end;

   with qryDadosTemp do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT MATRICULA,                                  '+
              '        NVL(RPTRIBUTAVEL, 0)   AS RPTRIBUTAVEL,     '+
              '        NVL(RPNAOTRIBUTAVEL,0) AS RPNAOTRIBUTAVEL,  '+
              '        SRB, SRBATUALIZADO, IDADE, INSS             '+
              ' FROM   ATIVOSTEMP '+
              ' WHERE  ANOMESREF = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+'''');

      if chkAutoPat.checked
      then SQL.Add('AND TIPO = ''2'' ');
      SQL.Add(' ORDER  BY MATRICULA ');
      Open;
   end;

   i := 0;
   qry.First;

   while not qry.Eof do
   begin
      inc(i);
      lblProcessando.Caption := IntToStr(i)+' registros processados. ';
      Application.ProcessMessages;
      qryDadosTemp.Locate('MATRICULA', qry.FieldByName('MATRICULA').AsString, [loCaseInsensitive]);

      // ATUALIZAR TEMPO DE SERVICO
      ProcessaHistContrib( qryAux,
                           qry.FieldByName('IDPESSOA').AsInteger,
                           DateToStr(date));


      sLinha :=          PreparaStr(qry.FieldByName('PATROCINADORA').AsString,   1);
      sLinha := sLinha + PreparaStr(qry.FieldByName('PLANO').AsString,           1);
      sLinha := sLinha + PreparaStr(qry.FieldByName('MATRICULA').AsString,       10);
      sLinha := sLinha + PreparaStr(qry.FieldByName('FUNDADOR').AsString,        1);

      sTipoParticipante := qry.FieldByName('TIPO').AsString;

      if qry.FieldByName('TIPO').AsString = '9'
      then begin
         sDataInicioAD := BuscaDataInicioAuxDoenca;
         if sDataInicioAD = ''
         then sTipoParticipante := '9'
         else if (StrToDate(dtDataRef.Text) - StrToDate(sDataInicioAD)) <= 720
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
      sLinha := sLinha + PreparaStr(sValorAux,                                    1);
      sLinha := sLinha + PreparaStr(Copy(qry.FieldByName('NOME').AsString,1,40), 40);
      sLinha := sLinha + PreparaStr(qry.FieldByName('SEXO').AsString,             1);
      sLinha := sLinha + PreparaStr(qry.FieldByName('ESTADOCIVIL').AsString,      1);
      sLinha := sLinha + PreparaStr(FormatDateTime('ddmmyyyy', qry.FieldByName('DATANASC').AsDateTime), 8);
      sLinha := sLinha + PreparaStr(FormatDateTime('ddmmyyyy', qry.FieldByName('DATAADMISSAO').AsDateTime), 8);

      // DATA FILIACAO
//      sValorAux := ExecutaRegraFCRT(1396); // PEDIDO PELA CLAUDIA
      sValorAux := qry.FieldByName('INSCRICAODATA').AsString;
      sLinha := sLinha + PreparaStr(FormatDateTime('ddmmyyyy', StrToDate(sValorAux)), 8);

      // REMUNERACAO
      sValorAux := BuscaRemuneracao;
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,  7);

      // SAL. PARTICIPACAO
      sValorAux := BuscaSalParticipacao;
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,  7);

      // CONTRIBUICAO ATUAL
      sValorAux := BuscaContribuicao;
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,  7);

      // TEMPO TOTAL DE INSS
      sValorAux := ExecutaRegraFCRT(1391);
      sLinha := sLinha + ColocaZeros(sValorAux,  3);

      // CONTRIBUICAO JOIA ATUAL
      sValorAux := BuscaJoia;
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,  7);

      // PRAZO PAGTO JOIA
      sValorAux := ExecutaRegraFCRT(1535);// (1393);
      sLinha := sLinha + ColocaZeros(sValorAux,   3);

      // PRAZO DE JOIA PAGO
      sValorAux := ExecutaRegraFCRT(1623); // (1395);
      sLinha := sLinha + ColocaZeros(sValorAux,   3);

      // TAXA DE JOIA
      sValorAux := BuscaTaxaJoia;
      sValorAux := FormatFloat('##0.0000000', StrToFloat(sValorAux));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,  8);

{      // RESERVA TRIBUTAVEL
      sValorAux := BuscaReservaTributavel;
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,  12);

      // RESERVA NAO TRIBUTAVEL
      sValorAux := BuscaReservaNAOTributavel;
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,  12);
}

      // RESERVA TRIBUTAVEL
      sValorAux := '0';
      sLinha := sLinha + ColocaZeros(Trim(qryDadosTemp.FieldByName('RPTRIBUTAVEL').AsString),  12);

      // RESERVA NAO TRIBUTAVEL
      sValorAux := '0';
      sLinha := sLinha + ColocaZeros(Trim(qryDadosTemp.FieldByName('RPNAOTRIBUTAVEL').AsString),  12);

      // SRB
      sValorAux := ExecutaRegraFCRT(1388);
//      sValorAux := FloatToStr(qryDadosTemp.FieldByName('SRB').AsFloat/100); // provisorio
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,   12);

      // SRB ATUALIZADO
      sValorAux := ExecutaRegraFCRT(1390);
//      sValorAux := FloatToStr(qryDadosTemp.FieldByName('SRBATUALIZADO').AsFloat/100); // provisorio
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,   12);

      // INSS
      sValorAux := ExecutaRegraFCRT(1377);
//      sValorAux := qryDadosTemp.FieldByName('INSS').AsString; // provisorio
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,         12);

      // FATOR PREVIDENCIARIO
      sValorAux := ExecutaRegraFCRT(1369);
      if StrToFloat(ClienteNumero(sValorAux)) > 1
      then  sValorAux := '10000000'
      else  sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZerosDireita( sValorAux,   8);

      // TEMPO MINIMO DE CONTRIBUICAO
      sValorAux := ExecutaRegraFCRT(1353);
      sValorAux := TiraPonto(sValorAux);
      sLinha    := sLinha + ColocaZeros(sValorAux,        2);

      // IDADE NA APOSENTADORIA
      sValorAux := ExecutaRegraFCRT(1366);
//      sValorAux := qryDadosTemp.FieldByName('IDADE').AsString; // provisorio
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,           3);

      // Dependentes
      sValorAux := MontaDadosDependente;
      sLinha := sLinha + ColocaZeros(IntToStr(iNumDep),   2);
      sLinha := sLinha + sValorAux;

      writeln(F, sLinha);
      qry.Next;
   end;


   CloseFile(F);
end;

procedure TfrmExportaSimulador.GeraExportacaoASSISTIDOS;
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
              ' AND    EV.IDEVENTOGERADOR(+) = BENEFNOMES.IDEVENTOGERADOR                 '+
              ' GROUP BY PP.IDPESSJUR, PP.IDPLANOPREV, PP.IDPESSOA,                       '+
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

      sValorAux := ExecutaRegraFCRT(1345); // CAMPO 13 - BENEFICIO ENTIDADE
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha    := sLinha + ColocaZeros(sValorAux,   7);

      sValorAux := ExecutaRegraFCRT(1338); // CAMPO 14 - BENEFICIO INSS
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha    := sLinha + ColocaZeros(sValorAux,   7);

      sLinha    := sLinha + '1000000'; // FATOR PREVIDENCIARIO - TAMANHO = 7

      sValorAux := ExecutaRegraFCRT(17707); // CAMPO 16 - CONTRIBUICAO
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha    := sLinha + ColocaZeros(sValorAux,   7);

      sValorAux := ExecutaRegraFCRT(1341); // CAMPO 17 - SRB
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha    := sLinha + ColocaZeros(sValorAux,   7);

      sValorAux := ExecutaRegraFCRT(1335); // CAMPO 18 - ABONO
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

      writeln(F, sLinha);
      qry.Next;

   end;

   CloseFile(F);

end;

procedure TfrmExportaSimulador.GeraExportacaoPENSIONISTAS;
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
              ' AND    EG.FLGINTERNO(+)      = ''FL''                                      '+
              ' GROUP BY PP.IDPESSJUR, PP.IDPLANOPREV, PP.IDPESSOA, PP.SEQPROPOSTA,        '+
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

      sValorAux := ExecutaRegraFCRT(1345); // CAMPO 13 - BENEFICIO
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,   7);

      sValorAux := ExecutaRegraFCRT(1338); // CAMPO 14 - INSS
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,   7);

      sValorAux := ExecutaRegraFCRT(1341); // CAMPO 15 - SRB
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,   7);

      sValorAux := ExecutaRegraFCRT(1335); // CAMPO 16 - ABONO
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

      writeln(F, sLinha);
      qry.Next;

   end;

   qryDadosTemp.Close;
   CloseFile(F);
end;

procedure TfrmExportaSimulador.Button1Click(Sender: TObject);
var F, F2 : TextFile;
    sLinha, sLinhaAux : string;
    sMatricula : string;
    sValorAux : string;
begin

   memErros.Lines.Add('*** ATIVOS ');

   if (Trim(edArqATIVOS.Text) = '')
   then Exit;

   with qryDadosTemp do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT MATRICULA,                                  '+
              '        NVL(RPTRIBUTAVEL, 0)   AS RPTRIBUTAVEL,     '+
              '        NVL(RPNAOTRIBUTAVEL,0) AS RPNAOTRIBUTAVEL,  '+
              '        SRB, SRBATUALIZADO, IDADE, INSS             '+
              ' FROM   ATIVOSTEMP '+
              ' WHERE  ANOMESREF = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+'''');

      if chkAutoPat.checked
      then SQL.Add('AND TIPO = ''2'' ');
      SQL.Add(' ORDER  BY MATRICULA ');
      Open;
   end;

   AssignFile(F, edArqAtivos.Text);
   Reset(F);

   AssignFile(F2,'C:\ATIVOSNOVO.TXT');
   Rewrite(F2);

   while not Eof(F) do
   begin
      readln(F, sLinha);
      sMatricula := Trim(Copy(sLinha, 3,10));
      qryDadosTemp.Locate('MATRICULA', sMatricula, [loCaseInsensitive]);


{     // ACERTAR SRB
      sLinhaAux := Copy(sLinha,1, 149);

      sValorAux := FloatToStr(qryDadosTemp.FieldByName('SRB').AsFloat/100); // provisorio
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinhaAux := sLinhaAux + ColocaZeros(sValorAux,   12);

      sValorAux := FloatToStr(qryDadosTemp.FieldByName('SRBATUALIZADO').AsFloat/100); // provisorio
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinhaAux := sLinhaAux + ColocaZeros(sValorAux,   12);

      sLinhaAux := sLinhaAux + Copy(sLinha, 174, 127);
}

      // ACERTAR RESERVAS
      sLinhaAux := Copy(sLinha,1, 125);


      sLinhaAux := sLinhaAux + ColocaZeros(Trim(qryDadosTemp.FieldByName('RPTRIBUTAVEL').AsString),     12);
      sLinhaAux := sLinhaAux + ColocaZeros(Trim(qryDadosTemp.FieldByName('RPNAOTRIBUTAVEL').AsString),  12);

      sLinhaAux := sLinhaAux + Copy(sLinha, 150, 151);


      writeln(F2,sLinhaAux);
   end;

   CloseFile(F);
   CloseFile(F2);



end;

procedure TfrmExportaSimulador.sbtnMantidosClick(Sender: TObject);
begin
  inherited;
  if SaveDlg.Execute
  then edArqMANTIDOS.Text := SaveDlg.FileName;
end;

procedure TfrmExportaSimulador.rgrpParticipClick(Sender: TObject);
begin
  inherited;
  if rgrpParticip.ItemIndex = 0
  then tbsSelParticip.TabVisible := False
  else tbsSelParticip.TabVisible := True;
end;

end.





