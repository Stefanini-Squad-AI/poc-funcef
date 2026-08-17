unit FVerificaContribuicoes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, ComCtrls;

type
  TfrmVerificaContribuicoes = class(TfrmOkCancelar)
    SaveDlg: TSaveDialog;
    qry: TwwQuery;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    sbtnAtivos: TSpeedButton;
    edArqATIVOS: TEdit;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    edContribuicoes: TEdit;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edIDPESSOA: TEdit;
    edMatricula: TEdit;
    edPatrocinadora: TEdit;
    edAnoMesInicio: TEdit;
    edAnoMesFinal: TEdit;
    Button1: TButton;
    Label9: TLabel;
    edArqAutoPat: TEdit;
    Label10: TLabel;
    edMesAutoPat: TEdit;
    tbsAtuSalVirt: TTabSheet;
    Label11: TLabel;
    Label12: TLabel;
    edAnoMesIni: TEdit;
    edAnoMesFim: TEdit;
    Button2: TButton;
    qryGrava: TwwQuery;
    qryVerifica: TwwQuery;
    memResult: TMemo;
    procedure sbtnAtivosClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    function ProximoAnoMes(iMes, iAno : integer) : string;
    function RetornaMesesEntre (psAnoMesInicio, psAnoMesFinal : string ) : string;
    function PreparaStr(Codigo : string; Tam : byte) : string;
  public
    { Public declarations }
  end;

var
  frmVerificaContribuicoes: TfrmVerificaContribuicoes;

implementation

uses DBaseDados,uMensErro, USimuladorBrTPREV;

{$R *.DFM}

function TfrmVerificaContribuicoes.PreparaStr(Codigo : string; Tam : byte) : string;
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

function TfrmVerificaContribuicoes.ProximoAnoMes(iMes, iAno : integer) : string;
var sAnoMes : string;
begin
  Result := '';
  if (iMes = 12) or (iMes = 13)
  then begin
     sAnoMes := IntToStr(iAno+1)+'/';
     sAnoMes := sAnoMes+'01';
  end
  else begin
    sAnoMes := IntToStr(iAno)+'/';
    iMes := iMes + 1;
    if iMes <= 9
    then sAnoMes := sAnoMes+'0'+IntToStr(iMes)
    else sAnoMes := sAnoMes+IntToStr(iMes);
  end;
  Result := sAnoMes;
end;//ProximoAnoMes

function TfrmVerificaContribuicoes.RetornaMesesEntre (psAnoMesInicio, psAnoMesFinal : string ) : string;
var sAcumulaMes, sAnoMesAtual : string;
begin
   Result := '';
   sAcumulaMes   := '';
   sAnoMesAtual  := ProximoAnoMes(StrToInt(Copy(psAnoMesInicio,6,2)),StrToInt(Copy(psAnoMesInicio,1,4)));
   while sAnoMesAtual < psAnoMesFinal do
   begin
      sAcumulaMes  := sAcumulaMes +' '+sAnoMesAtual;
      sAnoMesAtual := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual,6,2)),StrToInt(Copy(sAnoMesAtual,1,4)));
   end;

   Result := sAcumulaMes;
end;

procedure TfrmVerificaContribuicoes.sbtnAtivosClick(Sender: TObject);
begin
  inherited;
  if SaveDlg.Execute
  then edArqATIVOS.Text := SaveDlg.FileName;
end;

procedure TfrmVerificaContribuicoes.bbtnConfirmarClick(Sender: TObject);
var sSQL : string;
    sAnoMesFaltando,
    sPrimeiroAnoMes,
    sMatriculaAtual,
    sDataInicio,
    sDataFinal,
    sExisteNaContrib,
    sUltAnoMesLido : string;
    bPrimeiraLinha : boolean;

    F : TextFile;
begin
  inherited;


  if Trim(edContribuicoes.Text) = ''
  then begin
     MsgDlg('Informe ao menos um código de contribuição.','Informação',mtInformation,[mbOk],0);
     Exit;
  end;

  sSQL := ' SELECT DISTINCT EL.MATRICULA, HST.MESREFERENCIA,                                      '+
          '        DECODE(CPP.IDPESSOA, NULL, ''NÃO'', ''SIM'') AS EXISTENACONTRIB,               '+
          '        MIN(DECODE(CPP.IDPESSOA, NULL, HST.DATAINICIO, CPP.DATAINICIO)) AS DATAINICIO, '+
          '        MAX(DECODE(CPP.IDPESSOA, NULL, HST.DATAFINAL, CPP.DATAFINAL))   AS DATAFINAL   '+
          ' FROM   ELEGPATRO EL, CONTRIBPREVPARTP CPP, HSTCONTRIBPREV HST                         '+
          ' WHERE  HST.IDCONTRIBUICAO IN ('+Trim(edContribuicoes.Text)+')                         ';

  if Trim(edPatrocinadora.Text) <> ''
  then sSQL := sSQL + ' AND HST.IDPESSJUR = '+Trim(edPatrocinadora.Text);

  if Trim(edIdPessoa.Text) <> ''
  then sSQL := sSQL + ' AND HST.IDPESSOA  = '+Trim(edIdPessoa.Text);

  if Trim(edMatricula.Text) <> ''
  then sSQL := sSQL + ' AND EL.MATRICULA = '''+Trim(edMatricula.Text)+'''';

  if Trim(edAnoMesInicio.Text) <> ''
  then sSQL := sSQL + ' AND HST.MESREFERENCIA >= '''+Trim(edAnoMesInicio.Text)+'''';

  if Trim(edAnoMesFinal.Text) <> ''
  then sSQL := sSQL + ' AND HST.MESREFERENCIA <= '''+Trim(edAnoMesFinal.Text)+'''';

  sSQL := sSQL +
          ' AND    CPP.IDPESSJUR(+)      = HST.IDPESSJUR                                          '+
          ' AND    CPP.IDPLANOPREV(+)    = HST.IDPLANOPREV                                        '+
          ' AND    CPP.IDPESSOA(+)       = HST.IDPESSOA                                           '+
          ' AND    CPP.SEQPROPOSTA(+)    = HST.SEQPROPOSTA                                        '+
          ' AND    CPP.IDCONTRIBUICAO(+) = HST.IDCONTRIBUICAO                                     '+
          ' AND    EL.IDPESSJUR          = HST.IDPESSJUR                                          '+
          ' AND    EL.IDPESSOA           = HST.IDPESSOA                                           '+
          ' GROUP BY EL.MATRICULA, CPP.IDPESSOA, HST.MESREFERENCIA                                              '+
          ' ORDER BY EL.MATRICULA, HST.MESREFERENCIA                                              ';

  with qry do
  begin
     Close;
     SQL.Clear;
     SQL.Add(sSQL);
     Open;
  end;
  if qry.IsEmpty
  then begin
     MsgDlg('Nenhuma contribuição encontrada com o filtro especificado.','Informação',mtInformation,[mbOk],0);
     Exit;
  end;

  AssignFile(F, edArqAtivos.Text);
  Rewrite(F);
  writeln(F, PreparaStr('MATRICULA',    15)+
             PreparaStr('DATA INICIO',  15)+
             PreparaStr('DATA FINAL',   15)+
             PreparaStr('PRIM. MES',    10)+
             PreparaStr('ULT. MES',     10)+
             PreparaStr('EXISTE NA CONTRIB.', 20)+
             '< MESES FALTANDO ... > ');


  while not qry.Eof do
  begin

     sMatriculaAtual := qry.FieldByName('MATRICULA').AsString;
     sDataInicio     := qry.FieldByName('DATAINICIO').AsString;
     sDataFinal      := qry.FieldByName('DATAFINAL').AsString;
     sExisteNaContrib:= qry.FieldByName('EXISTENACONTRIB').AsString;
     bPrimeiraLinha  := True;
     sAnoMesFaltando := '';
     sPrimeiroAnoMes := '';
     sUltAnoMesLido  := qry.FieldByName('MESREFERENCIA').AsString;

     while (not qry.Eof) and
           (sMatriculaAtual = qry.FieldByName('MATRICULA').AsString) do
     begin
        if bPrimeiraLinha
        then begin
           sPrimeiroAnoMes := qry.FieldByName('MESREFERENCIA').AsString;
           if Copy(qry.FieldByName('DATAINICIO').AsString,7,4)+'/'+Copy(qry.FieldByName('DATAINICIO').AsString,4,2)
              <>
              qry.FieldByName('MESREFERENCIA').AsString
           then sAnoMesFaltando := sAnoMesFaltando +' '+
                                   Copy(qry.FieldByName('DATAINICIO').AsString,7,4)+'/'+Copy(qry.FieldByName('DATAINICIO').AsString,4,2)+' '+
                                   RetornaMesesEntre( Copy(qry.FieldByName('DATAINICIO').AsString,7,4)+'/'+Copy(qry.FieldByName('DATAINICIO').AsString,4,2),
                                                      qry.FieldByName('MESREFERENCIA').AsString)
        end
        else begin
           if qry.FieldByName('MESREFERENCIA').AsString <> ProximoAnoMes(StrToInt(Copy(sUltAnoMesLido,6,2)),StrToInt(Copy(sUltAnoMesLido,1,4)))
           then sAnoMesFaltando := sAnoMesFaltando +' '+
                                   ProximoAnoMes(StrToInt(Copy(sUltAnoMesLido,6,2)),StrToInt(Copy(sUltAnoMesLido,1,4)))+' '+
                                   RetornaMesesEntre( ProximoAnoMes(StrToInt(Copy(sUltAnoMesLido,6,2)),StrToInt(Copy(sUltAnoMesLido,1,4))),
                                                      qry.FieldByName('MESREFERENCIA').AsString)
        end;

        bPrimeiraLinha  := False;
        sUltAnoMesLido  := qry.FieldByName('MESREFERENCIA').AsString;
        if qry.FieldByName('EXISTENACONTRIB').AsString = 'NÃO'
        then sExisteNaContrib := 'NÃO';
        qry.Next;
     end;

     if Trim(sAnoMesFaltando) = '' then continue;

     // Gravar dados da matricula
     writeln(F, PreparaStr(sMatriculaAtual, 15)+
                PreparaStr(sDataInicio,     15)+
                PreparaStr(sDataFinal,      15)+
                PreparaStr(sPrimeiroAnoMes, 10)+
                PreparaStr(sUltAnoMesLido,  10)+
                PreparaStr(sExisteNaContrib,20)+
                '< '+
                sAnoMesFaltando +' > ');


  end;

  CloseFile(F);
  MsgDlg('Processamento concluído com sucesso !!!','Informação',mtInformation,[mbOk],0);

end;

procedure TfrmVerificaContribuicoes.Button1Click(Sender: TObject);
var F, FSaida :TextFile;
    sLinha,
    sAnoMes,
    sMatricula,
    sIdContrib,
    sValor : string;
begin
  inherited;
  AssignFile(F,edArqAutoPat.Text);
  Reset(F);

  AssignFile(FSaida,'c:\autopat_contribnaoencontradas.txt');
  Rewrite(FSaida);

  dtmBaseDados.dbBaseDados.StartTransaction;
  while not Eof(F) do
  begin
     Readln(F,sLinha);
     sAnoMes    := '20'+Copy(sLinha,1,2)+'/'+Copy(sLinha,3,2);
     sMatricula := Trim(Copy(sLinha,5,6))+'-00';
     sIdContrib := Trim(Copy(sLinha,11,1));
     sValor     := Trim(Copy(sLInha,12,11));

     with qry do
     begin
        Close;
        SQL.Clear;
        SQL.Add(' UPDATE HSTCONTRIBPREV SET VALORRECEBIDO = '+OraNumero(sValor)+', DATARECEBIMENTO = SYSDATE '+
                ' WHERE  MESCOBRANCA   = '''+Trim(edMesAutoPat.Text)+''''+
                ' AND    MESREFERENCIA = '''+sAnoMes+''''+
                ' AND    IDPESSOA      = ( SELECT IDPESSOA FROM ELEGPATRO WHERE MATRICULA = '''+sMatricula+''') '+
                ' AND    IDCONTRIBUICAO = '+sIdContrib);
        try
           ExecSQL;
        except
        end;

        if RowsAffected <= 0
        then writeln(FSaida,'[N.ID] '+sLinha)
        else begin
           Close;
           SQL.Clear;
           SQL.Add(' UPDATE HSTCONTRIBPREV SET SITRECEBIMENTO = 2, FLGCALCRESERVA = 1  '+
                   ' WHERE  MESCOBRANCA   = '''+Trim(edMesAutoPat.Text)+''''+
                   ' AND    MESREFERENCIA = '''+sAnoMes+''''+
                   ' AND    IDPESSOA      = ( SELECT IDPESSOA FROM ELEGPATRO WHERE MATRICULA = '''+sMatricula+''') '+
                   ' AND    IDCONTRIBUICAO = '+sIdContrib+
                   ' AND    (VALORESPERADO - VALORRECEBIDO) <= 0.50 ');
           try
              ExecSQL;
           except
              writeln(FSaida,'[ERRO] '+sLinha)
           end;
           Close;
           SQL.Clear;
           SQL.Add(' UPDATE HSTCONTRIBPREV SET SITRECEBIMENTO = 3, FLGCALCRESERVA = 1  '+
                   ' WHERE  MESCOBRANCA   = '''+Trim(edMesAutoPat.Text)+''''+
                   ' AND    MESREFERENCIA = '''+sAnoMes+''''+
                   ' AND    IDPESSOA      = ( SELECT IDPESSOA FROM ELEGPATRO WHERE MATRICULA = '''+sMatricula+''') '+
                   ' AND    IDCONTRIBUICAO = '+sIdContrib+
                   ' AND    (VALORESPERADO - VALORRECEBIDO) > 0.50 ');
           try
              ExecSQL;
           except
              writeln(FSaida,'[ERRO] '+sLinha)
           end;
        end;
     end;
  end;
  dtmBaseDados.dbBaseDados.Commit;
  CloseFile(F);
  CloseFile(FSaida);


end;

procedure TfrmVerificaContribuicoes.Button2Click(Sender: TObject);
var sAnoMesInicio,
    sAnoMesFinal,
    sAnoMesAtual : string;
    i : integer;
begin
  inherited;

  dtmBaseDados.dbBaseDados.StartTransaction;
  sAnoMesInicio := edAnoMesIni.Text;
  sAnoMesFinal  := edAnoMesFim.Text;
  sAnoMesAtual  := sAnoMesInicio;
  while sAnoMesAtual <= sAnoMesFinal do
  begin
     with qry do
     begin
        Close;
        SQL.Clear;
        SQL.Add(' SELECT DISTINCT H.IDPESSJUR AS IDPATRO,   H.IDPESSOA,                        '+
                '        H.IDPLANOPREV,                                                        '+
                '        H.IDTITULAR, SUM(H.VLBENEFPGTO) AS SALARIO                            '+
                ' FROM   HSTBENEFBFCIARIO H, BENEFBFCIARIO BF                                  '+
                ' WHERE  H.MES           = '''+sAnoMesAtual+''''+
                ' AND    H.MESREFERENCIA = '''+sAnoMesAtual+''''+
                ' AND    H.IDBENEFICIO IN (1,2,20,21)                                          '+
                ' AND    BF.IDBENEFICIO = H.IDBENEFICIO                                        '+
                ' AND    BF.IDPESSOA    = H.IDPESSOA                                              '+
                ' AND    TO_CHAR(BF.DATAINICIO, ''YYYY/MM'') <= H.MES                          '+
                ' AND    ((TO_CHAR(BF.DATAFINAL,''YYYY/MM'') >= H.MES) or (BF.DATAFINAL IS NULL) ) '+
                ' GROUP BY H.IDPESSJUR,                                                        '+
                '          H.IDPESSOA,                      H.IDPLANOPREV,                     '+
                '          H.IDTITULAR                                                         '+
                ' ORDER BY H.IDPESSOA                                                          ');
        Open;
     end;
     qry.First;
     i := 0;
     while not qry.Eof do
     begin
        with qryVerifica do
        begin
           Close;
           SQL.Clear;
           SQL.Add(' SELECT VALORPROVENTO '+
                   ' FROM   HISTRUBSAL    '+
                   ' WHERE  MES         = '''+sAnoMesAtual+''''+
                   ' AND    MESCOBRANCA = '''+sAnoMesAtual+''''+
                   ' AND    IDPESSOA    = '+qry.FieldByName('IDPESSOA').AsString+
                   ' AND    IDRUBRICA   = 20003 ');
           Open;
        end;
        qryGrava.Close;
        qryGrava.SQL.Clear;
        if not qryVerifica.IsEmpty
        then begin
           if Abs(qryVerifica.FieldByName('VALORPROVENTO').AsFloat - qry.FieldByName('SALARIO').AsFloat) < 1 
           then begin
              qry.Next;
              continue;
           end;
           qryGrava.SQL.Add(' UPDATE HISTRUBSAL SET VALORPROVENTO = '+OraNumero(qry.FieldbyName('SALARIO').AsString)+', '+
                            '        CODPROVDESC = ''CTRL5'' '+
                            ' WHERE  MES         = '''+sAnoMesAtual+''''+
                            ' AND    MESCOBRANCA = '''+sAnoMesAtual+''''+
                            ' AND    IDPESSOA    = '+qry.FieldByName('IDPESSOA').AsString+
                            ' AND    IDRUBRICA   = 20003 ');
        end
        else begin
           qryGrava.SQL.Add(' INSERT INTO HISTRUBSAL ( CODPROVDESC,                                              '+
                        ' FLGCOMPOEREMTOTAL,               FLGCOMPOESALBENEF,                                    '+
                        ' FLGCOMPOESALPART,                FLGCONCESSAO,                    FLGEQUIPARACAO,      '+
                        ' FLGESTORNO,                      FLGIRRF,                         FLGPENSAOALIM,       '+
                        ' FLGPREVIA,                       FLGSALBENEFRETRO,                FLGSALPARTATUARIA,   '+
                        ' FLGSALPARTRETRO,                 FLGSRB,                          FLGTIPODESC,         '+
                        ' IDMODULO,                        IDMOTIVO,                        IDPATRO,             '+
                        ' IDPESSJUR,                       IDPESSOA,                        IDPLANOPREV,         '+
                        ' IDRUBRICA,                       IDTITULAR,                                            '+
                        ' MES,                             MESCOBRANCA,                                          '+
                        ' REFERENCIA,                      SEQHISTFUNC,                                          '+
                        ' VALORINTEGRAL,                   VALORPROVENTO)                                        '+
                        ' VALUES ( ''CTRL5'',                                                                    '+
                        ' 0,0,0,0,0,0,0,0,0,0,0,0,0,''B'',                                                       '+
                        ' 16,                              4,                                                    '+
                        qry.FieldByName('IDPATRO').AsString +','+
                        qry.FieldByName('IDPATRO').AsString +','+
                        qry.FieldByName('IDPESSOA').AsString +','+
                        qry.FieldByName('IDPLANOPREV').AsString +','+
                        ' 20003,                           '+
                        qry.FieldByName('IDPESSOA').AsString +','+
                        ''''+sAnoMesAtual+''', '+
                        ''''+sAnoMesAtual+''', '+
                        ' ''***'',                         1,                                                    '+
                        OraNumero(qry.FieldByName('SALARIO').AsString) +','+
                        OraNumero(qry.FieldByName('SALARIO').AsString) +')' );
        end;
        qryGrava.ExecSQL;
        inc(i);
        qry.Next;
     end;
     memResult.Lines.Add('Ano/Mês : '+sAnoMesAtual+' = '+IntToStr(i)+' rubricas geradas. ');
     sAnoMesAtual := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
  end;
  dtmBaseDados.dbBaseDados.Commit;

end;

end.
