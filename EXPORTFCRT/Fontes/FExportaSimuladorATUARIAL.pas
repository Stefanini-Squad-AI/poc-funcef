unit FExportaSimuladorATUARIAL;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, 
  wwdbdatetimepicker, CMDateTimePicker, ComCtrls, URegra;

type
  TfrmExportaSimuladorATUARIAL = class(TfrmSairAjuda)
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
    qrySimulador: TwwQuery;
    GroupBox3: TGroupBox;
    Label11: TLabel;
    sbtnAtivosAUX: TSpeedButton;
    Label14: TLabel;
    sbtnAutoPatAUX: TSpeedButton;
    edAuxAtivos: TEdit;
    edAuxAutopat: TEdit;
    qryAtivosAUX: TwwQuery;
    qryAutoPatAUX: TwwQuery;
    updAtivosAUX: TUpdateSQL;
    updAutoPatAUX: TUpdateSQL;
    procedure sbtnAtivosClick(Sender: TObject);
    procedure sbtnAssistidosClick(Sender: TObject);
    procedure sbtnPensionistasClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnExportarClick(Sender: TObject);
    procedure sbtnMantidosClick(Sender: TObject);
    procedure rgrpParticipClick(Sender: TObject);
    procedure sbtnAtivosAUXClick(Sender: TObject);
    procedure sbtnAutoPatAUXClick(Sender: TObject);
  private
    { Private declarations }
    iNumDep : word;
    cCodProcesso : char; // A - ATIVOS, S - ASSISTIDOS, P - PENSIONISTAS, M - AUTOPATROCINADOS
    sTipoParticipante : string;
    sMatriculas : string;
    sTipoDepVit : string;
    sDataDepVit : string;
    FAtivosAux,
    FAutopatAux : TextFile;
    bAchouPessoa : boolean;
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

    function  MontaDadosDependente            : string;
    function  MontaDadosDependenteASSIST      : string;
    function  MontaDadosDependentePENSIONISTA : string;
    function  MontaDadosCONJUGE               : string;
    function  MontaDadosFILHO                 : string;

    function  BuscaTaxaJoia                   : string;
    function  BuscaRemuneracao                : string;
    function  BuscaSalParticipacao            : string;
    function  BuscaContribuicao               : string;
    function  BuscaJoia                       : string;
    function  BuscaReservaTributavel          : string;
    function  BuscaReservaNAOTributavel       : string;


    function  BuscaSuplementacaoBruta         : string;
    function  BuscaDataInicioAuxDoenca        : string;

    procedure GeraExportacaoAUTOPATROCINADOS;
    procedure GeraExportacaoATIVOS;
    procedure GeraExportacaoASSISTIDOS;
    procedure GeraExportacaoPENSIONISTAS;

    procedure CarregaTabelasAuxiliares;

  end;

var
  frmExportaSimuladorATUARIAL: TfrmExportaSimuladorATUARIAL;

implementation

uses uMensErro,UConsPart;


{$R *.DFM}

function TfrmExportaSimuladorATUARIAL.AnoMesAnterior(iMes, iAno : integer) : string;
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

function TfrmExportaSimuladorATUARIAL.SAnoMesAnterior(sAnoMes : string) : string;
var iAno, iMes : integer;
begin
   Result := '';
   iAno := StrToInt(Copy(sAnoMes,1,4));
   iMes := StrToInt(Copy(sAnoMes,6,2));
   Result := AnoMesAnterior(iMes,iAno);
end;

function TfrmExportaSimuladorATUARIAL.ColocaZerosDireita( sPalavra : string; iTam : byte ) : string;
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

function  TfrmExportaSimuladorATUARIAL.TiraPonto(sNumero : string ) : string;
var i : word;
    sAux : string;
begin
   sAux := '';
   for i := 1 to Length(sNumero) do
       if (Copy(sNumero,i,1) <> '.') and (Copy(sNumero,i,1) <> ',')
       then sAux := sAux + Copy(sNumero,i,1);

   Result := sAux;
end;

function TfrmExportaSimuladorATUARIAL.ClienteNumero(sNumero : string):string;
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

function TfrmExportaSimuladorATUARIAL.OraNumero(sNumero : string):string;
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

function TfrmExportaSimuladorATUARIAL.RegraString ( sNumRegra, sSQL : string; var bErro : boolean; var piIdCalculo : longInt ) : string;
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


function  TfrmExportaSimuladorATUARIAL.ExecutaRegraFCRT(piNumRegra : longint) : string;
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
                  '        NVL(EL.TEMPOSIMPLES,0) AS TEMPOSIMPLES,                                             '+
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
                  '        EL.TEMPOSERVCALC, EL.TEMPOSIMPLES,                                                                   '+
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
                  '        NVL(EL.TEMPOSIMPLES,0) AS TEMPOSIMPLES,                                             '+
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
                  '        EL.TEMPOSERVCALC, EL.TEMPOSIMPLES,                                                                  '+
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
                    '        NVL(EL.TEMPOSIMPLES,0) AS TEMPOSIMPLES,                                             '+
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
                 '        NVL(EL.TEMPOSIMPLES,0) AS TEMPOSIMPLES,                                             '+
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

function TfrmExportaSimuladorATUARIAL.ColocaZeros(Codigo:string;Tam:byte):string;
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

function TfrmExportaSimuladorATUARIAL.PreparaStr(Codigo : string; Tam : byte) : string;
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

function  TfrmExportaSimuladorATUARIAL.MontaDadosConjuge;
var sDependentes : string;
    i            : word;
    sSQLAux      : string;
begin

   Result       := '';
   sDependentes := '';
   iNumDep      := 0;

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
              '          ( (DP.IDDEPENDENCIA  = ''COP'') AND (D.IDSITDEPENDENTE = 1) ) )      '+
              ' ORDER  BY PF.DATANASC DESC                                                    ');
      Open;
      if not IsEmpty
      then sDependentes := PreparaStr(FormatDateTime('ddmmyyyy', FieldByName('DATANASC').AsDateTime), 8)
      else sDependentes := '00000000';
   end;
   Result := sDependentes;
end;

function  TfrmExportaSimuladorATUARIAL.MontaDadosFILHO;
var sDependentes : string;
    i            : word;
    sSQLAux      : string;
    dMaiorData   : TDateTime;
    bInvalido    : boolean;
    sData        : string;
begin

   Result       := '';
   sDependentes := '';
   iNumDep      := 0;

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
              '        D.IDSITDEPENDENTE, PF.DATANASC                                         '+
              ' FROM   PESSOAFISICA PF, DEPENDENTE D, DEPENTIT DP                             '+
              ' WHERE  DP.IDTITULAR = '+qry.FieldByName('IDPESSOA').AsString                   +
              ' AND    PF.IDPESSOA  = DP.IDPESSOA                                             '+
              ' AND    D.IDPESSOA   = DP.IDPESSOA                                             '+
              ' AND    D.IDSITDEPENDENTE <> 2                                                 '+ // 2 = cancelado
              ' AND    DP.IDDEPENDENCIA  = ''FIL''                                            '+
              ' ORDER  BY D.IDSITDEPENDENTE DESC, PF.DATANASC DESC                            ');
      Open;
      dMaiorData := StrToDate('01/01/1900');
      sData      := '';
      bInvalido  := False;
      while not Eof do
      begin
         if (FieldByName('DATANASC').AsDateTime > dMaiorData) and (not bInvalido)
         then begin
            if FieldByName('IDSITDEPENDENTE').AsInteger = 3
            then bInvalido := True;
            dMaiorData     := FieldByName('DATANASC').AsDateTime;
            sData          := FieldByName('DATANASC').AsString;
         end;

         if bInvalido then break;
         Next;
      end;
   end;

   if Trim(sData) <> ''
   then Result := PreparaStr(FormatDateTime('ddmmyyyy', dMaiorData), 8)
   else Result := '00000000';
end;

function  TfrmExportaSimuladorATUARIAL.MontaDadosDependente;
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

function  TfrmExportaSimuladorATUARIAL.MontaDadosDependenteASSIST : string;
var sDependentesTemp,
    sDependentesVit : string;
    i            : word;
    sSQLAux      : string;
    dDataVitMaisJovem,
    dDataTmpMaisJovem : TDateTime;
    sSexoVitMaisJovem,
    sSexoTmpMaisJovem : string;

begin

   Result           := '';
   sDependentesTemp := '';
   sDependentesVit  := '';
   iNumDep          := 0;
   sTipoDepVit      := 'N';
   sDataDepVit      := '00000000';

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
      dDataVitMaisJovem := StrToDate('01/01/1900');
      sSexoVitMaisJovem := '';
      while not Eof do
      begin
         inc(iNumDep);

         if dDataVitMaisJovem < FieldbyName('DATANASC').AsDateTime
         then begin
            sDependentesVit := PreparaStr(FormatDateTime('ddmmyyyy', FieldByName('DATANASC').AsDateTime), 8)+
                               PreparaStr(FieldByName('SEXO').AsString,     1 );
            dDataVitMaisJovem := FieldbyName('DATANASC').AsDateTime;

            if (FieldByName('IDDEPENDENCIA').AsString = 'COM') or
               (FieldByName('IDDEPENDENCIA').AsString = 'COP')
            then begin
               sTipoDepVit      := 'C';
               sDataDepVit      := PreparaStr(FormatDateTime('ddmmyyyy', FieldByName('DATANASC').AsDateTime), 8);
            end
            else begin
               sTipoDepVit      := 'O';
               sDataDepVit      := '00000000';
            end;
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
      dDataTmpMaisJovem := StrToDate('01/01/1900');
      sSexoTmpMaisJovem := '';
      while not Eof do
      begin
         inc(iNumDep);

         if dDataTmpMaisJovem < FieldbyName('DATANASC').AsDateTime
         then begin
            sDependentesTemp := PreparaStr(FormatDateTime('ddmmyyyy', FieldByName('DATANASC').AsDateTime), 8)+
                                PreparaStr(FieldByName('SEXO').AsString,     1 );
            dDataTmpMaisJovem := FieldbyName('DATANASC').AsDateTime;
         end;

         Next;
      end;
   end;

   if Trim(sDependentesVit)  = '' then sDependentesVit  := '00000000O';
   if Trim(sDependentesTemp) = '' then sDependentesTemp := '00000000O';

   qryAux.Close;

   Result := sDependentesVit+sDependentesTemp;
end;

function  TfrmExportaSimuladorATUARIAL.MontaDadosDependentePENSIONISTA : string;
var sDependentesTemp,
    sDependentesVit : string;
    i            : word;
    sSQLAux      : string;
    dDataVitMaisJovem,
    dDataTmpMaisJovem : TDateTime;
    sSexoVitMaisJovem,
    sSexoTmpMaisJovem : string;
    iTam : word;

begin

   Result           := '';
   sDependentesTemp := '';
   sDependentesVit  := '';
   iNumDep          := 0;
   sTipoDepVit      := 'N';
   sDataDepVit      := '';

   // Se for pensionista, só considerá-lo se estiver na folha de pagamento
   sSQLAux := ' AND D.IDPESSOA IN (SELECT IDPESSOA FROM HSTBENEFBFCIARIO '+
              '                    WHERE  MES           = '''+Copy(dtDataREF.Text,7,4)+'/'+Copy(dtDataREF.Text,4,2)+''''+
              '                    AND    MESREFERENCIA = '''+Copy(dtDataREF.Text,7,4)+'/'+Copy(dtDataREF.Text,4,2)+''''+
              '                    AND    IDBENEFICIO   = 11)  ';

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
      dDataVitMaisJovem := StrToDate('01/01/1900');
      sSexoVitMaisJovem := '';
      while not Eof do
      begin
         inc(iNumDep);

         if dDataVitMaisJovem < FieldbyName('DATANASC').AsDateTime
         then begin
            sDependentesVit := PreparaStr(FormatDateTime('ddmmyyyy', FieldByName('DATANASC').AsDateTime), 8)+
                               PreparaStr(FieldByName('SEXO').AsString,     1 );
            dDataVitMaisJovem := FieldbyName('DATANASC').AsDateTime;
            if (FieldByName('IDDEPENDENCIA').AsString = 'COM') or
               (FieldByName('IDDEPENDENCIA').AsString = 'COP')
            then begin
               sTipoDepVit      := 'C';
               sDataDepVit      := PreparaStr(FormatDateTime('ddmmyyyy', FieldByName('DATANASC').AsDateTime), 8);
            end
            else begin
               sTipoDepVit      := 'O';
               sDataDepVit      := '00000000';
            end;
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
      dDataTmpMaisJovem := StrToDate('01/01/1900');
      sSexoTmpMaisJovem := '';
      i := 0;
      while not Eof do
      begin
         inc(iNumDep);
         inc(i);

         if i <= 4
         then begin
            if sDependentesTemp = ''
            then sDependentesTemp := PreparaStr(FormatDateTime('ddmmyyyy', FieldByName('DATANASC').AsDateTime), 8)+
                                     PreparaStr(FieldByName('SEXO').AsString,     1 )
            else sDependentesTemp := sDependentesTemp +
                                     PreparaStr(FormatDateTime('ddmmyyyy', FieldByName('DATANASC').AsDateTime), 8)+
                                     PreparaStr(FieldByName('SEXO').AsString,     1 );
         end;

         Next;
      end;
   end;

   if Trim(sDependentesVit)  = '' then sDependentesVit  := '000000000';
   if Trim(sDependentesTemp) = '' then sDependentesTemp := '000000000000000000000000000000000000';

   iTam := Length(sDependentesTemp)+1;
   for i := iTam to 36 do
       sDependentesTemp := sDependentesTemp + '0';

   sDependentesTemp := Copy(sDependentesTemp,1,36);

   qryAux.Close;

   Result := sDependentesVit+sDependentesTemp;
end;

function  TfrmExportaSimuladorATUARIAL.BuscaTaxaJoia  : string;
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


function  TfrmExportaSimuladorATUARIAL.BuscaRemuneracao : string;
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

function  TfrmExportaSimuladorATUARIAL.BuscaSalParticipacao : string;
var sRubrica : string;
    dValor   : double;
begin
   Result := '0';
   with qryAux do
   begin
      Close;
      SQL.Clear;
{      sRubrica := '-1';
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
      then dValor := FieldByName('VALORPROVENTO').AsFloat
      else dValor := 0;
}

      if bAchouPessoa
      then begin
         if cCodProcesso = 'A'
         then dValor := qryAtivosAux.FieldByName('SALPARTICIPACAO').AsFloat
         else dValor := qryAutopatAux.FieldByName('SALPARTICIPACAO').AsFloat;
      end
      else dValor := 0;

      if qry.FieldbyName('IDPLANOPREV').AsInteger = 16
      then begin
         Close;
         SQL.Clear;
         SQL.Add(' SELECT COTVALOR                  '+
                 ' FROM   COTACAOMOEDA              '+
                 ' WHERE  MOECODIGO = 6             '+
                 ' AND    TO_CHAR(COTDATA,''YYYY/MM'') <= '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+''''+
                 ' AND    ((TO_CHAR(COTDATAFIM,''YYYY/MM'') >= '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+''') OR (COTDATAFIM IS NULL)) ');

         Open;

         if not IsEmpty
         then begin
            if dValor > qryAux.FieldByName('COTVALOR').AsFloat
            then dValor := qryAux.FieldByName('COTVALOR').AsFloat;
         end
      end;
   end;
   Result := FloatToStr(dValor);
end;


function  TfrmExportaSimuladorATUARIAL.BuscaCONTRIBUICAO : string;
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

      SQL.Add(' SELECT /*+ RULE */ SUM(H.VALORPROVENTO) AS VALORPROVENTO '+
              ' from   HISTRUBSAL H    '+
              ' WHERE  (H.IDPESSOA  = '+qry.FieldByName('IDPESSOA').AsString+') '+
              ' AND    (H.MES       = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+''')'+
              sRubrica);
      Open;

      if (not IsEmpty) and (FieldByName('VALORPROVENTO').AsFloat > 0)
      then Result := FieldByName('VALORPROVENTO').AsString;
   end;
end;

function  TfrmExportaSimuladorATUARIAL.BuscaJOIA : string;
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

function  TfrmExportaSimuladorATUARIAL.BuscaReservaTributavel : string;
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

function  TfrmExportaSimuladorATUARIAL.BuscaReservaNAOTributavel : string;
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

function  TfrmExportaSimuladorATUARIAL.BuscaSuplementacaoBruta : string;
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

function  TfrmExportaSimuladorATUARIAL.BuscaDataInicioAuxDoenca : string;
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


procedure TfrmExportaSimuladorATUARIAL.sbtnAtivosClick(Sender: TObject);
begin
  inherited;
  if SaveDlg.Execute
  then edArqATIVOS.Text := SaveDlg.FileName;
end;

procedure TfrmExportaSimuladorATUARIAL.sbtnAssistidosClick(Sender: TObject);
begin
  inherited;
  if SaveDlg.Execute
  then edArqASSISTIDOS.Text := SaveDlg.FileName;

end;

procedure TfrmExportaSimuladorATUARIAL.sbtnPensionistasClick(Sender: TObject);
begin
  inherited;
  if SaveDlg.Execute
  then edArqPENSIONISTAS.Text := SaveDlg.FileName;

end;

procedure TfrmExportaSimuladorATUARIAL.FormShow(Sender: TObject);
begin
  inherited;
  dtDataRef.Text         := DateToStr(date);
  lblProcessando.Visible := True;
  tbsSelParticip.TabVisible := False;
  PageControl1.ActivePage   := tbsExportacao;
end;

procedure TfrmExportaSimuladorATUARIAL.bbtnExportarClick(Sender: TObject);
var i : word;
begin
  inherited;
  memErros.Lines.Clear;
  chkAutoPat.Checked := False;

  if (Trim(edArqATIVOS.Text) <> '') and
     ((edAuxAtivos.Text = '') or (edAuxAutopat.Text = '') )
  then begin
     MsgDlg('Os arquivos auxiliares devem ser indicados. ','Erro',mtError,[mbOK],0);
     Exit;
  end;

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

  GeraExportacaoATIVOS;
  if Trim(edArqMantidos.Text) <> ''
  then begin
     chkAutoPat.Checked := True;
     GeraExportacaoAUTOPATROCINADOS
  end;
  GeraExportacaoASSISTIDOS;
  GeraExportacaoPENSIONISTAS;

  MsgDlg('Término da Geração dos Arquivos. Arquivos Gerados com Sucesso.','Informação', mtInformation, [mbOK],0);

end;

procedure TfrmExportaSimuladorATUARIAL.GeraExportacaoATIVOS;
var F : TextFile;
    sLinha, sValorAux : string;
    i : word;
    sDataInicioAD : string;
    dTempo : double;
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
              '               DECODE(PP.DATACANCELAMENTO,NULL,''1'',''7'') ) AS TIPO,   '+
              '        P.NOME,                                                      '+
              '        DECODE(PF.SEXO, ''M'', 1, 2 ) AS SEXO,                       '+
              '        DECODE(PF.ESTCIVIL, ''S'', ''1'',                                  '+
              '                            ''C'', ''2'',                                  '+
              '                            ''V'', ''3'',                                  '+
              '                            ''E'', ''4'',                                  '+
              '                            ''M'', ''5'',                                  '+
              '                            ''D'', ''6'',                                  '+
              '                            ''J'', ''8'',                                  '+
              '                            ''O'', ''9'',                                  '+
              '                            ''P'', ''7''  ) AS ESTADOCIVIL,                '+
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
              '                     AND    HST.SEQPROPOSTA   = PP.SEQPROPOSTA       '+
              '                     AND    HST.IDBENEFICIO NOT IN (1,2))            '+
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
              '        DECODE(PF.ESTCIVIL, ''S'', ''1'',                                  '+
              '                            ''C'', ''2'',                                  '+
              '                            ''V'', ''3'',                                  '+
              '                            ''E'', ''4'',                                  '+
              '                            ''M'', ''5'',                                  '+
              '                            ''D'', ''6'',                                  '+
              '                            ''J'', ''8'',                                  '+
              '                            ''O'', ''9'',                                  '+
              '                            ''P'', ''7''  ) AS ESTADOCIVIL,                '+
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
              '                 AND    TRUNC(MONTHS_BETWEEN(TO_DATE('''+dtDataREF.text+''',''DD/MM/YYYY''),BF.DATAINICIO),0) < 24  '+
              '               )                                                 '+
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
      qry.SQL.SaveToFile('c:\admprevqry.txt');
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
              '        NVL(RPTRIBUTAVEL, 0)   AS RPTRIBUTAVEL,     '+
              '        NVL(RPNAOTRIBUTAVEL,0) AS RPNAOTRIBUTAVEL,  '+
              '        SRB, SRBATUALIZADO, IDADE, INSS             '+
              ' FROM   ATIVOSTEMP '+
              ' WHERE  ANOMESREF = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+'''');

      if chkAutoPat.checked
      then SQL.Add('AND TIPO = ''2'' ');
      SQL.Add(' ORDER  BY MATRICULA ');
      qry.SQL.SaveToFile('c:\admprevqry.txt');
      Open;
   end;

   CarregaTabelasAuxiliares;


   i := 0;
   qry.First;

   while not qry.Eof do
   begin
      inc(i);
      lblProcessando.Caption := IntToStr(i)+' registros processados. ';
      Application.ProcessMessages;
      qryDadosTemp.Locate('MATRICULA', qry.FieldByName('MATRICULA').AsString, [loCaseInsensitive]);

      if qryAtivosAUX.Locate('MATRICULA', qry.FieldByName('MATRICULA').AsString, [loCaseInsensitive])
      then bAchouPessoa := True
      else bAchouPessoa := False;


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
      then sTipoParticipante := '4'
      else sTipoParticipante := qry.FieldByName('TIPO').AsString;

      if Trim(sTipoParticipante) = '9' then sTipoParticipante := '4';
      if Trim(sTipoParticipante) = ''  then sTipoParticipante := '1';

      sValorAux := sTipoParticipante;
      sLinha := sLinha + PreparaStr(sValorAux,                                    1);
      sLinha := sLinha + PreparaStr(Copy(qry.FieldByName('NOME').AsString,1,40), 40);
      sLinha := sLinha + PreparaStr(qry.FieldByName('SEXO').AsString,             1);
      sLinha := sLinha + PreparaStr(qry.FieldByName('ESTADOCIVIL').AsString,      1);
      sLinha := sLinha + PreparaStr(FormatDateTime('ddmmyyyy', qry.FieldByName('DATANASC').AsDateTime),     8);
      sLinha := sLinha + PreparaStr(FormatDateTime('ddmmyyyy', qry.FieldByName('DATAADMISSAO').AsDateTime), 8);


      if qry.FieldByName('INSCRICAODATA').AsDateTime < StrToDate('01/03/1977')
      then sLinha := sLinha + PreparaStr('01031977', 8)
      else sLinha := sLinha + PreparaStr(FormatDateTime('ddmmyyyy', qry.FieldByName('INSCRICAODATA').AsDateTime), 8);

      // REMUNERACAO
      if bAchouPessoa
      then sValorAux := qryAtivosAux.FieldByName('REMUNERACAO').AsString
      else sValorAux := '0';
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,  7);

      // SAL. PARTICIPACAO = BUSCAR DO SIMULADOR E LIMITAR
      sValorAux := BuscaSalParticipacao;
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,  7);

      // CONTRIBUICAO ATUAL
//      sValorAux := BuscaContribuicao;
      if bAchouPessoa
      then sValorAux := qryAtivosAux.FieldByName('CONTRIBUICAO').AsString
      else sValorAux := '0';
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,  7);

      // TEMPO TOTAL DE INSS
      if bAchouPessoa
      then begin
         dTempo := StrToDate(dtDataRef.Text) - qry.FieldByName('DATAADMISSAO').AsDateTime;
         dTempo := Trunc(dTempo / 30 );
         dTempo := qryAtivosAux.FieldByName('TEMPOINSS').AsInteger - dTempo;
      end
      else dTempo := 0;
      if dTempo < 0 then dTempo := 0;
      sValorAux := IntToStr(Trunc(dTempo));
      sLinha    := sLinha + ColocaZeros(sValorAux,  3);

      // CONTRIBUICAO JOIA ATUAL
      if bAchouPessoa
      then sValorAux := qryAtivosAux.FieldByName('JOIA').AsString
      else sValorAux := '0';
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,  7);

      // PRAZO PAGTO JOIA
      sValorAux := ExecutaRegraFCRT(1535);// (1393);
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

      // RESERVA = BUSCAR DO SIMULADOR
      if bAchouPessoa
      then sValorAux := OraNumero(FormatFloat('##0.00',qryAtivosAux.FieldByName('RPTRIBUTAVEL').AsFloat + qryAtivosAux.FieldByName('RPNAOTRIBUTAVEL').AsFloat))
      else sValorAux := '0';
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,  12);

      // Dependentes
      sValorAux := MontaDadosCONJUGE;
      sLinha := sLinha + sValorAux;

      sValorAux := MontaDadosFILHO;
      sLinha := sLinha + sValorAux;

      MontaDadosDependente;
      sLinha := sLinha + ColocaZeros(IntToStr(iNumDep),   2);

      // SRB = BUSCAR DO SIMULADOR
      if bAchouPessoa
      then sValorAux := qryAtivosAux.FieldByName('SRB').AsString
      else sValorAux := '0';

      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,   7);


      writeln(F, sLinha);
      qry.Next;
   end;

   CloseFile(FAtivosAux);
   CloseFile(FAutopatAux);
   CloseFile(F);
end;

procedure TfrmExportaSimuladorATUARIAL.GeraExportacaoAUTOPATROCINADOS;
var F : TextFile;
    sLinha, sValorAux : string;
    i : word;
    dTempo : double;
begin

   if chkAutoPat.Checked
   then begin
       memErros.Lines.Add('*** AUTOPATROCINADOS');
      cCodProcesso := 'M';
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
              '        DECODE(PF.ESTCIVIL, ''S'', ''1'',                                  '+
              '                            ''C'', ''2'',                                  '+
              '                            ''V'', ''3'',                                  '+
              '                            ''E'', ''4'',                                  '+
              '                            ''M'', ''5'',                                  '+
              '                            ''D'', ''6'',                                  '+
              '                            ''J'', ''8'',                                  '+
              '                            ''O'', ''9'',                                  '+
              '                            ''P'', ''7''  ) AS ESTADOCIVIL,                '+
              '        PF.DATANASC,                                               '+
              '        EL.DATAADMISSAO, PP.INSCRICAODATA                          '+
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
      qry.SQL.SaveToFile('c:\admprevqry.txt');
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
      qry.SQL.SaveToFile('c:\admprevqry.txt');
      Open;
   end;

   with qrySimulador do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT MATRICULA,                                  '+
              '        SRB                                         '+
              ' FROM   SIMULAMIGRACAO                              '+
              ' WHERE  ANOMESREF = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+'''');
      SQL.Add(' ORDER  BY MATRICULA ');
      Open;
   end;

   CarregaTabelasAuxiliares;


   i := 0;
   qry.First;

   while not qry.Eof do
   begin
      inc(i);
      lblProcessando.Caption := IntToStr(i)+' registros processados. ';
      Application.ProcessMessages;
      qryDadosTemp.Locate('MATRICULA', qry.FieldByName('MATRICULA').AsString, [loCaseInsensitive]);
      qrySimulador.Locate('MATRICULA', qry.FieldByName('MATRICULA').AsString, [loCaseInsensitive]);

      if qryAutoPAtAUX.Locate('MATRICULA', qry.FieldByName('MATRICULA').AsString, [loCaseInsensitive])
      then bAchouPessoa := True
      else bAchouPessoa := False;

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
      sLinha := sLinha + PreparaStr(FormatDateTime('ddmmyyyy', qry.FieldByName('INSCRICAODATA').AsDateTime), 8);

      // REMUNERACAO
      if bAchouPessoa
      then sValorAux := qryAutopatAUX.FieldByName('REMUNERACAO').AsString
      else sValorAux := '0';
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,   7);

      // SAL. PARTICIPACAO
      sValorAux := BuscaSalParticipacao;
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,   7);

      // CONTRIBUICAO ATUAL
      if bAchouPessoa
      then sValorAux := qryAutopatAUX.FieldByName('CONTRIBUICAO').AsString
      else sValorAux := '0';
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,   7);

      // TEMPO TOTAL DE INSS
      if bAchouPessoa
      then begin
         dTempo := StrToDate(dtDataRef.Text) - qry.FieldByName('DATAADMISSAO').AsDateTime;
         dTempo := Trunc(dTempo / 30 );
         dTempo := qryAutopatAux.FieldByName('TEMPOINSS').AsInteger - dTempo;
      end
      else dTempo := 0;
      if dTempo < 0 then dTempo := 0;
      sValorAux := IntToStr(Trunc(dTempo));
      sLinha    := sLinha + ColocaZeros(sValorAux,  3);

      // CONTRIBUICAO JOIA ATUAL
      if bAchouPessoa
      then sValorAux := qryAutopatAUX.FieldByName('JOIA').AsString
      else sValorAux := '0';
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,   7);

      // PRAZO PAGTO JOIA
      sValorAux := ExecutaRegraFCRT(1535);// (1393);
      sLinha := sLinha + ColocaZeros(sValorAux,   3);

      // TAXA DE JOIA
      sValorAux := BuscaTaxaJoia;
      sValorAux := FormatFloat('##0.0000000', StrToFloat(sValorAux));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,  8);

      // RESERVA = BUSCAR DO SIMULADOR
      if bAchouPessoa
      then sValorAux := OraNumero(FormatFloat('##0.00',qryAutopatAux.FieldByName('RPTRIBUTAVEL').AsFloat + qryAutopatAux.FieldByName('RPNAOTRIBUTAVEL').AsFloat))
      else sValorAux := '0';
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,  12);

      // Dependentes
      sValorAux := MontaDadosCONJUGE;
      sLinha := sLinha + sValorAux;

      sValorAux := MontaDadosFILHO;
      sLinha := sLinha + sValorAux;

      MontaDadosDependente;
      sLinha := sLinha + ColocaZeros(IntToStr(iNumDep),   2);

      // SRB = BUSCAR DO SIMULADOR
      if bAchouPessoa
      then sValorAux := qryAutoPatAux.FieldByName('SRB').AsString
      else sValorAux := '0';

      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,   7);

      writeln(F, sLinha);
      qry.Next;
   end;


   CloseFile(F);
end;

procedure TfrmExportaSimuladorATUARIAL.GeraExportacaoASSISTIDOS;
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

{
'Solteiro(a)'                then     sEstCiv := 'S'
'Casado(a) ou Equiparado(a)' then     sEstCiv := 'C'
'Divorciado(a)'              then     sEstCiv := 'D'
'Desquitado(a)'              then     sEstCiv := 'E'
'Separado(a) Judicial'       then     sEstCiv := 'J'
'Viúvo(a)'                   then     sEstCiv := 'V'
'Marital'                    then     sEstCiv := 'M'
'Separado(a)'                then     sEstCiv := 'P'
'Outros'                     then     sEstCiv := 'O';
}

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
              '                            ''J'', ''8'',                                  '+
              '                            ''O'', ''9'',                                  '+
              '                            ''P'', ''7''  ) AS ESTADOCIVIL,                '+
              '        PF.DATANASC,                                                       '+
              '        EL.DATAADMISSAO,   PF.DATAMORTE, PP.INSCRICAODATA,                 '+
              '        NVL(BENEFNOMES.IDBENEFICIO,0)                  AS IDBENEFICIO,     '+
              '        NVL(BENEFNOMES.NUMEROPROCESSO,0)               AS NUMEROPROCESSO,  '+
              '        MAX(NVL(EV.DATAEVENTO, TO_DATE(''31/12/3000'',''DD/MM/YYYY''))) AS DATAINICIOFUND,  '+
              '        MAX(NVL(BENEFNOMES.DATAINICIOINSS, TO_DATE(''31/12/3000'',''DD/MM/YYYY''))) AS DATAINICIOINSS, '+
              '        MAX(INSSNOMES.VALORINTEGRAL)    AS VLRINFINSS,                     '+
              '        MAX(BENEFNOMES.BENEFICIO)       AS BENEFICIO,                      '+
              '        MAX(BENEFNOMES.VALORSRB)        AS VALORSRB,                       '+
              '        MAX(ABONONOMES.VALORINTEGRAL)   AS ABONO,                          '+
              '        MAX(CONTRIBUICAO.VALORESPERADO) AS CONTRIBUICAO                    '+
              ' FROM   PESSOA P, PESSOAFISICA PF, ELEGPATRO EL, EVENTOSPREV EV,           '+
              '        PARTPREVPLAN PP, SITPART SP,                                       '+
              '        ( SELECT DISTINCT EL.MATRICULA,                                    '+
              '                 BF.NUMEROPROCESSO, BF.IDTITULAR, BF.IDBENEFICIO,          '+
              '                 BF.DATAINICIOFUND,                                        '+
              '                 B.IDEVENTOGERADOR,                                        '+
              '                 BF.DATAINICIOINSS,                                        '+
              '                 HST.VALORINTEGRAL AS BENEFICIO,                           '+
              '                 BF.VLRINFINSS, HST.VALORSRB                               '+
              '          FROM   ELEGPATRO EL, BENEFBFCIARIO BF, HSTBENEFBFCIARIO HST,     '+
              '                 BENEFICIO B                                               '+
              '          WHERE  HST.MES           = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+''''+
              '          AND    HST.MESREFERENCIA = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+''''+
              '          AND    ((HST.IDBENEFICIO   IN (5,6,7,8,9,14)) OR                  '+
              '                  ( (HST.IDBENEFICIO IN (1,2) ) AND (TRUNC(MONTHS_BETWEEN(TO_DATE('''+dtDataREF.text+''',''DD/MM/YYYY''),BF.DATAINICIO),0) >= 24)  ) '+
              '                  )                                                        '+
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
              '          ) BENEFNOMES,                                                    '+
              '         (SELECT HST.IDTITULAR, HST.VALORINTEGRAL                          '+
              '          FROM   HSTBENEFBFCIARIO HST                                      '+
              '          WHERE  HST.MES           = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+''''+
              '          AND    HST.MESREFERENCIA = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+''''+
              '          AND    HST.IDBENEFICIO   IN (31,33,34,35,72)                     '+
              '          AND    HST.FLGENVIADO    <> 9                                    '+
              '          AND    HST.IDMOTIVO      <> 7                                    '+
              '          AND    HST.VLBENEFPGTO   IS NOT NULL                             '+
              '          AND    HST.VLBENEFPGTO   > 0                                     '+
              '          ) ABONONOMES,                                                    '+
              '         (SELECT HST.IDTITULAR, HST.VALORINTEGRAL                          '+
              '          FROM   HSTBENEFBFCIARIO HST                                      '+
              '          WHERE  HST.MES           = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+''''+
              '          AND    HST.MESREFERENCIA = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+''''+
              '          AND    HST.IDBENEFICIO   IN (20,21,24,25,26,27,28,29,30 )        '+
              '          AND    HST.FLGENVIADO    <> 9                                    '+
              '          AND    HST.IDMOTIVO      <> 7                                    '+
              '          AND    HST.VLBENEFPGTO   IS NOT NULL                             '+
              '          AND    HST.VLBENEFPGTO   > 0                                     '+
              '          ) INSSNOMES,                                                    '+
              '         (SELECT HST.IDPESSOA, SUM(HST.VALORESPERADO) AS VALORESPERADO     '+
              '          FROM   HSTCONTRIBPREV HST                                        '+
              '          WHERE  HST.MESCOBRANCA    = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+''''+
              '          AND    HST.MESREFERENCIA  = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+''''+
              '          AND    HST.IDCONTRIBUICAO in (7,15)                              '+
              '          GROUP BY HST.IDPESSOA                                            '+
              '         ) CONTRIBUICAO                                                    '+
              ' WHERE  EL.MATRICULA              = BENEFNOMES.MATRICULA                   '+
              ' AND    PP.IDPLANOPREV            <> 33                                    '+
              ' AND    PP.FLGDESATIVADO          = 0                                      '+
              ' AND    PP.IDSITPART              = SP.IDSITPART                           '+
              ' AND    EL.IDPESSJUR              = PP.IDPESSJUR                           '+
              ' AND    EL.IDPESSOA               = PP.IDPESSOA                            '+
              ' AND    PF.IDPESSOA               = EL.IDPESSOA                            '+
              ' AND    P.IDPESSOA                = EL.IDPESSOA                            '+
              ' AND    BENEFNOMES.IDTITULAR(+)   = PP.IDPESSOA                            '+
              ' AND    ABONONOMES.IDTITULAR(+)   = PP.IDPESSOA                            '+
              ' AND    INSSNOMES.IDTITULAR(+)    = PP.IDPESSOA                            '+
              ' AND    CONTRIBUICAO.IDPESSOA(+)  = PP.IDPESSOA                            '+
              ' AND    EV.IDPESSOA(+)            = BENEFNOMES.IDTITULAR                   '+
              ' AND    EV.IDEVENTOGERADOR(+)     = BENEFNOMES.IDEVENTOGERADOR             '+
              ' GROUP BY PP.IDPESSJUR, PP.IDPLANOPREV, PP.IDPESSOA,                       '+
              '        PP.SEQPROPOSTA,                                                    '+
              '        EL.IDPESSJUR,                                                      '+
              '        EL.MATRICULA,                                                      '+
              '        SP.FLGINTERNO,                                                     '+
              '        P.NOME,                                                            '+
              '        PF.SEXO,                                                           '+
              '        PF.ESTCIVIL,                                                       '+
              '        PF.DATANASC,                                                       '+
              '        EL.DATAADMISSAO,   PF.DATAMORTE, PP.INSCRICAODATA,                 '+
              '        BENEFNOMES.IDBENEFICIO, BENEFNOMES.NUMEROPROCESSO                  '+
              ' ORDER BY EL.MATRICULA                                                     ');
      qry.SQL.SaveToFile('c:\admprevqry.txt');
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

      if      qry.FieldByName('IDBENEFICIO').AsInteger = 5  then sValorAux := '32'
      else if qry.FieldByName('IDBENEFICIO').AsInteger = 6  then sValorAux := '41'
      else if qry.FieldByName('IDBENEFICIO').AsInteger = 7  then sValorAux := '42'
      else if qry.FieldByName('IDBENEFICIO').AsInteger = 8  then sValorAux := '77'
      else if qry.FieldByName('IDBENEFICIO').AsInteger = 9  then sValorAux := '46'
      else if qry.FieldByName('IDBENEFICIO').AsInteger = 14 then sValorAux := '32'
      else if qry.FieldByName('IDBENEFICIO').AsInteger = 1  then sValorAux := '31'
      else if qry.FieldByName('IDBENEFICIO').AsInteger = 2  then sValorAux := '31'
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
      try
         sLinha := sLinha + PreparaStr(FormatDateTime('ddmmyyyy', qry.FieldByName('INSCRICAODATA').AsDateTime), 8);
      except
         sValorAux := '31/12/3000';
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

      sValorAux := qry.FieldByName('BENEFICIO').AsString;
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha    := sLinha + ColocaZeros(sValorAux,   7);

      sValorAux := qry.FieldByName('VLRINFINSS').AsString;
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha    := sLinha + ColocaZeros(sValorAux,   7);

      sValorAux := qry.FieldByName('CONTRIBUICAO').AsString;
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha    := sLinha + ColocaZeros(sValorAux,   7);

      sValorAux := qry.FieldByName('VALORSRB').AsString;
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha    := sLinha + ColocaZeros(sValorAux,   7);

      sValorAux := qry.FieldByName('ABONO').AsString;
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha    := sLinha + ColocaZeros(sValorAux,   7);

      if (qry.FieldByName('IDBENEFICIO').AsInteger = 1) or
         (qry.FieldByName('IDBENEFICIO').AsInteger = 2)
      then sValorAux := '1'
      else sValorAux := ExecutaRegraFCRT(17701); // CAMPO 17 - PROPORCAO

      sValorAux := FormatFloat('##0.00000', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZerosDireita(sValorAux,   6);

      // Dependentes
      sValorDep := MontaDadosDependenteASSIST;
      sLinha    := sLinha + sValorDep;
      sLinha    := sLinha + ColocaZeros(IntToStr(iNumDep),  2);
      sLinha    := sLinha + sTipoDepVit;
      sLinha    := sLinha + sDataDepVit;

      writeln(F, sLinha);
      qry.Next;
   end;

   CloseFile(F);

end;

procedure TfrmExportaSimuladorATUARIAL.GeraExportacaoPENSIONISTAS;
var F : TextFile;
    sLinha, sValorAux : string;
    dValorBase, dValorCota : double;
    sCOTA, sBenefPago : string;
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
              '        EL.DATAADMISSAO,   PF.DATAMORTE,                                    '+
              '        BF.IDBENEFICIO,                                                     '+
              '        DECODE(BTITANT.IDBENEFICIO, NULL, 1,                                '+
              '                                    1, 2,                                   '+
              '                                    2, 2,                                   '+
              '                                    5, 3,                                   '+
              '                                    14,3,                                   '+
              '                                    6, 4,                                   '+
              '                                    7, 4,                                   '+
              '                                    8, 4,                                   '+
              '                                    9, 4,                                   '+
              '                                    1) AS ORIGEMPARTICIPANTE,               '+
              '        MAX(EV.IDSITPLANOATUAL) AS IDSITPLANOATUAL, 0 AS PERCENTUAL,        '+
              '        MAX(BF.DATAINICIOFUND) AS DATAINICIOFUND,                           '+
              '        BENEFNOMES.NUMBENEF,                                                '+
              '        MAX(BENEFNOMES.VALORTOTAL) AS VALORTOTAL,                           '+
              '        MAX(BENEFNOMES.VALORSRB)   AS VALORSRB,                             '+
              '        MAX(INSSNOMES.VALORTOTAL)  AS INSS,                                 '+
              '        MAX(ABONONOMES.VALORTOTAL) AS ABONO                                 '+
              ' FROM   PESSOA P, PESSOAFISICA PF, ELEGPATRO EL,                            '+
              '        PARTPREVPLAN PP, SITPART SP, BENEFBFCIARIO BF, BENEFBFCIARIO BTITANT, '+
              '        EVENTOSPREV EV, EVENTOGERADOR EG,                                   '+
              ' (                                                                          '+
              ' SELECT  DISTINCT EL.MATRICULA,                                             '+
              '              COUNT(DISTINCT HST.IDPESSOA) AS NUMBENEF,                     '+
              '              MAX(HST.VALORTOTAL) AS VALORTOTAL,                            '+
              '              MAX(VALORSRB) AS VALORSRB                                     '+
              '       FROM                                                                 '+
              '              ELEGPATRO EL,                                                 '+
              '       HSTBENEFBFCIARIO HST                                                 '+
              ' WHERE  HST.MES           = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+''''+
              ' AND    HST.MESREFERENCIA = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+''''+
              ' AND    ((HST.IDBENEFICIO = 11) OR (HST.IDBENEFICIO = 18) )                 '+
              ' AND    EL.IDPESSJUR = HST.IDPESSJUR                                        '+
              ' AND    EL.IDPESSOA  = HST.IDTITULAR                                        '+
              ' AND    HST.IDMOTIVO      <> 7                                              '+
              ' AND     ( (( HST.VLBENEFPGTO   IS NOT NULL) AND (HST.VLBENEFPGTO   > 0 )) OR (HST.FLGENVIADO = 9) ) '+
              ' GROUP BY EL.MATRICULA ) BENEFNOMES,                                        '+
              ' (                                                                          '+
              ' SELECT DISTINCT HST.IDPESSJUR,                                             '+
              '        HST.IDPLANOPREV,                                                    '+
              '       HST.IDTITULAR,                                                       '+
              '       MAX(HST.VALORINTEGRAL) AS VALORTOTAL                                 '+
              ' FROM                                                                       '+
              '    HSTBENEFBFCIARIO HST                                                    '+
              ' WHERE  HST.MES           = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+''''+
              ' AND    HST.MESREFERENCIA = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+''''+
              ' AND    ((HST.IDBENEFICIO = 22) OR (HST.IDBENEFICIO = 23) )                 '+
              ' GROUP BY HST.IDPESSJUR, HST.IDPLANOPREV, HST.IDTITULAR ) INSSNOMES,        '+
              ' (                                                                          '+
              ' SELECT                                                                     '+
              '       DISTINCT HST.IDPESSJUR,                                              '+
              '       HST.IDPLANOPREV,                                                     '+
              '       HST.IDTITULAR,                                                       '+
              '       MAX(HST.VALORINTEGRAL) AS VALORTOTAL                                 '+
              ' FROM                                                                       '+
              '       HSTBENEFBFCIARIO HST                                                 '+
              ' WHERE  HST.MES           = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+''''+
              ' AND    HST.MESREFERENCIA = '''+Copy(Trim(dtDataREF.Text),7,4)+'/'+Copy(Trim(dtDataRef.Text),4,2)+''''+
              ' AND    ((HST.IDBENEFICIO = 36) OR (HST.IDBENEFICIO = 71) )                  '+
              ' GROUP BY HST.IDPESSJUR, HST.IDPLANOPREV, HST.IDTITULAR ) ABONONOMES         '+
              ' WHERE  EL.MATRICULA              = BENEFNOMES.MATRICULA                     '+
              ' AND    (((PP.IDPLANOPREV         <> 33) and (PP.FLGDESATIVADO = 0) ) or (EL.MATRICULA = ''167296-00'') ) '+
              ' AND    PP.IDSITPART              = SP.IDSITPART                             '+
              ' AND    EL.IDPESSJUR              = PP.IDPESSJUR                             '+
              ' AND    EL.IDPESSOA               = PP.IDPESSOA                              '+
              ' AND    PF.IDPESSOA               = EL.IDPESSOA                              '+
              ' AND    P.IDPESSOA                = EL.IDPESSOA                              '+
              ' AND    BF.IDPESSJUR              = PP.IDPESSJUR                             '+
              ' AND    BF.IDPLANOPREV            = PP.IDPLANOPREV                           '+
              ' AND    BF.IDTITULAR              = PP.IDPESSOA                              '+
              ' AND    BF.SEQPROPOSTA            = PP.SEQPROPOSTA                           '+
              ' AND    BF.IDBENEFICIO            IN (11, 18)                                '+
              ' AND    EV.IDPESSJUR(+)           = PP.IDPESSJUR                             '+
              ' AND    EV.IDPLANOPREV(+)         = PP.IDPLANOPREV                           '+
              ' AND    EV.IDPESSOA(+)            = PP.IDPESSOA                              '+
              ' AND    EV.SEQPROPOSTA(+)         = PP.SEQPROPOSTA                           '+
              ' AND    EG.IDEVENTOGERADOR(+)     = EV.IDEVENTOGERADOR                       '+
              ' AND    EG.FLGINTERNO(+)          =  ''FL''                                  '+
              ' AND    INSSNOMES.IDPESSJUR(+)    = BF.IDPESSJUR                             '+
              ' AND    INSSNOMES.IDPLANOPREV(+)  = BF.IDPLANOPREV                           '+
              ' AND    INSSNOMES.IDTITULAR(+)    = BF.IDTITULAR                             '+
              ' AND    ABONONOMES.IDPESSJUR(+)   = BF.IDPESSJUR                             '+
              ' AND    ABONONOMES.IDPLANOPREV(+) = BF.IDPLANOPREV                           '+
              ' AND    ABONONOMES.IDTITULAR(+)   = BF.IDTITULAR                             '+
              ' AND    BTITANT.IDPESSJUR(+)      = PP.IDPESSJUR                             '+
              ' AND    BTITANT.IDTITULAR(+)      = PP.IDPESSOA                              '+
              ' AND    BTITANT.IDPESSOA(+)       = PP.IDPESSOA                              '+
              ' AND    BTITANT.SEQPROPOSTA(+)    = PP.SEQPROPOSTA                           '+
              ' AND    ((BTITANT.IDBENEFICIO IN ( 1, 2, 5, 14, 6, 7, 8, 9)) OR (BTITANT.IDBENEFICIO IS NULL)) '+
              ' GROUP BY PP.IDPESSJUR,      PP.IDPLANOPREV,      PP.IDPESSOA,      PP.SEQPROPOSTA,   '+
              '          EL.IDPESSJUR,      EL.MATRICULA,        SP.FLGINTERNO,    P.NOME,           '+
              '          PF.SEXO,           PF.ESTCIVIL,         PF.DATANASC,      EL.DATAADMISSAO,  '+
              '          PF.DATAMORTE,      BF.IDBENEFICIO,      BENEFNOMES.NUMBENEF,                '+
              '          BTITANT.IDBENEFICIO                                                         '+  
              ' ORDER BY EL.MATRICULA                                                                ');
      Open;
   end;
   qry.SQL.SaveToFile('c:\admprevqry.txt');


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
      sLinha := sLinha + PreparaStr(qry.FieldByName('ORIGEMPARTICIPANTE').AsString, 1);

      if qry.FieldByName('DATAMORTE').AsDateTime > qry.FieldByName('DATAINICIOFUND').AsDateTime
      then sLinha := sLinha + PreparaStr(FormatDateTime('ddmmyyyy', qry.FieldByName('DATAMORTE').AsDateTime), 8)       // DIB = DATAMORTE
      else sLinha := sLinha + PreparaStr(FormatDateTime('ddmmyyyy', qry.FieldByName('DATAINICIOFUND').AsDateTime), 8); // DIB = DIB

      sCota := ExecutaRegraFCRT(1343);
      dValorCota := StrToFloat(ClienteNumero(sCota));

      sValorAux := FloatToStr(qry.FieldByName('VALORTOTAL').AsFloat * dValorCota); // VALORTOTAL * COTA
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,   7);

      // sValorAux := ExecutaRegraFCRT(1338); // CAMPO 14 - INSS
      sValorAux := qry.FieldByName('INSS').AsString;
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,   7);

      sValorAux := ExecutaRegraFCRT(1341); // CAMPO 15 - SRB
      sValorAux := qry.FieldByName('VALORSRB').AsString;
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,   7);

      sValorAux := FloatToStr(qry.FieldByName('ABONO').AsFloat * qry.FieldByName('NUMBENEF').AsFloat); // ABONO
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,   7);

      sValorAux := ExecutaRegraFCRT(17701); // CAMPO 17 - PROPORCAO
      sValorAux := FormatFloat('##0.00000', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZerosDireita(sValorAux,   6);

{      sValorAux := ExecutaRegraFCRT(1343); // CAMPO 18 - COTAPENSAO
      sValorAux := OraNumero(FloatToStr(StrToFloat(ClienteNumero(sValorAux)) * 100));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,   3);
}
      sLinha := sLinha + ColocaZeros(qry.FieldByName('NUMBENEF').AsString,  2);

{      sValorAux := ExecutaRegraFCRT(17705); // CAMPO 20 - BENEFICIO PAGO FCRT
      sValorAux := FormatFloat('##0.00', StrToFloat(ClienteNumero(sValorAux)));
      sValorAux := TiraPonto(sValorAux);
      sLinha := sLinha + ColocaZeros(sValorAux,   7);
}
      // Dependentes
      sValorAux := MontaDadosDependentePENSIONISTA;
      sLinha    := sLinha + sValorAux;

      writeln(F, sLinha);
      qry.Next;
   end;

   qryDadosTemp.Close;
   CloseFile(F);
end;

procedure TfrmExportaSimuladorATUARIAL.sbtnMantidosClick(Sender: TObject);
begin
  inherited;
  if SaveDlg.Execute
  then edArqMANTIDOS.Text := SaveDlg.FileName;
end;

procedure TfrmExportaSimuladorATUARIAL.rgrpParticipClick(Sender: TObject);
begin
  inherited;
  if rgrpParticip.ItemIndex = 0
  then tbsSelParticip.TabVisible := False
  else tbsSelParticip.TabVisible := True;
end;

procedure TfrmExportaSimuladorATUARIAL.CarregaTabelasAuxiliares;
var sLinha : string;
begin
   qryAtivosAUX.Close;  qryAtivosAUX.Open;
   qryAutopatAUX.Close; qryAutopatAUX.Open;

   // Arquivo de autopatrocinados
   if Trim(edAuxAutopat.Text) <> ''
   then begin
      AssignFile(FAutopatAux, edAuxAutopat.Text);
      Reset(FAutopatAux);
      while not Eof(FAutopatAux) do
      begin
         readln(FAutopatAux, sLinha);
         qryAutopatAUX.Insert;
         qryAutopatAUX.FieldByName('MATRICULA').AsString       := Trim(Copy(sLinha, 3,   10));
         qryAutopatAUX.FieldByName('TEMPOINSS').AsString       := Trim(Copy(sLinha, 102,  3));
         qryAutopatAUX.FieldByName('REMUNERACAO').AsFloat      := StrToFloat(ClienteNumero(Copy(sLinha,81,7)))  / 100;
         qryAutopatAUX.FieldByName('SALPARTICIPACAO').AsFloat  := StrToFloat(ClienteNumero(Copy(sLinha, 88, 7))) /100;
         qryAutopatAUX.FieldByName('RPTRIBUTAVEL').AsFloat     := StrToFloat(ClienteNumero(Copy(sLinha, 126, 12)))/100;
         qryAutopatAUX.FieldByName('RPNAOTRIBUTAVEL').AsFloat  := StrToFloat(ClienteNumero(Copy(sLinha, 138, 12)))/100;
         qryAutopatAUX.FieldByName('SRB').AsFloat              := StrToFloat(ClienteNumero(Copy(sLinha, 150, 12)))/100;
         qryAutopatAUX.FieldByName('CONTRIBUICAO').AsFloat     := StrToFloat(ClienteNumero(Copy(sLinha,95,7))) / 100;
         qryAutopatAUX.FieldByName('JOIA').AsFloat             := StrToFloat(ClienteNumero(Copy(sLinha,105,7))) / 100;
         qryAutopatAUX.Post;
      end;
   end;

   // Arquivo de ativos
   if Trim(edAuxAtivos.Text) <> ''
   then begin
      AssignFile(FAtivosAux, edAuxAtivos.Text);
      Reset(FAtivosAux);
      while not Eof(FAtivosAux) do
      begin
         readln(FAtivosAux, sLinha);
         if qryAutopatAUX.Locate('MATRICULA',Copy(sLinha, 3, 10),[])
         then continue;

         qryAtivosAUX.Insert;
         qryAtivosAUX.FieldByName('MATRICULA').AsString       := Trim(Copy(sLinha, 3,   10));
         qryAtivosAUX.FieldByName('TEMPOINSS').AsString       := Trim(Copy(sLinha, 102,  3));
         qryAtivosAUX.FieldByName('SALPARTICIPACAO').AsFloat  := StrToFloat(Copy(sLinha, 88, 7))/100;
         qryAtivosAUX.FieldByName('REMUNERACAO').AsFloat      := StrToFloat(ClienteNumero(Copy(sLinha,81,7)))  / 100;
         qryAtivosAUX.FieldByName('RPTRIBUTAVEL').AsFloat     := StrToFloat(Copy(sLinha, 126, 12))/100;
         qryAtivosAUX.FieldByName('RPNAOTRIBUTAVEL').AsFloat  := StrToFloat(Copy(sLinha, 138, 12))/100;
         qryAtivosAUX.FieldByName('SRB').AsFloat              := StrToFloat(Copy(sLinha, 150, 12))/100;
         qryAtivosAUX.FieldByName('CONTRIBUICAO').AsFloat     := StrToFloat(ClienteNumero(Copy(sLinha,95,7))) / 100;
         qryAtivosAUX.FieldByName('JOIA').AsFloat             := StrToFloat(ClienteNumero(Copy(sLinha,105,7))) / 100;
         qryAtivosAUX.Post;
      end;
   end;

end;

procedure TfrmExportaSimuladorATUARIAL.sbtnAtivosAUXClick(Sender: TObject);
begin
  inherited;
  if SaveDlg.Execute
  then edAuxAtivos.Text := SaveDlg.FileName;

end;

procedure TfrmExportaSimuladorATUARIAL.sbtnAutoPatAUXClick(
  Sender: TObject);
begin
  inherited;
  if SaveDlg.Execute
  then edAuxAutopat.Text := SaveDlg.FileName;

end;

end.





