unit FAcertaPeculio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, URegra;

type
  TfrmAcertaPeculio = class(TfrmOkCancelar)
    Label1: TLabel;
    edDataIni: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edDataFim: TEdit;
    edDataBase: TEdit;
    qry: TwwQuery;
    qryGrava: TwwQuery;
    qryRegra: TwwQuery;
    qryAux: TwwQuery;
    lblProgresso: TLabel;
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    function RodaRegraSimula(sNumRegra,sSQL : string; var bErro : boolean; var piIdCalculo : longInt ) : string;
  public
    { Public declarations }

  end;

var
  frmAcertaPeculio: TfrmAcertaPeculio;

implementation

uses DBaseDados, UMensErro, USimuladorBrTPREV;

{$R *.DFM}

procedure TfrmAcertaPeculio.bbtnConfirmarClick(Sender: TObject);
var sSQL, sFatorRedutor : string;
    bErro : boolean;
    sPeculio : string;
    i : integer;
begin
  inherited;
  dtmBaseDados.dbBaseDados.StartTransaction;

  // ACERTAR ATIVOS E AUTOPATROCINADOS
  with qry do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT  DISTINCT IDPESSJUR, IDPESSOA, IDPLANOPREV, SEQPROPOSTA '+
             ' FROM    PREVIAMIGRAPLANO P               '+
             ' WHERE   P.CODCAMPOMIGRA = ''DATATRANSF''' +
             ' AND     SUBSTR(P.VALORAMIGRAR,7,4)||''/''||SUBSTR(P.VALORAMIGRAR,4,2)||''/''||SUBSTR(P.VALORAMIGRAR,1,2)  >= '''+Copy(edDataIni.Text,7,4)+'/'+Copy(edDataIni.Text,4,2)+'/'+Copy(edDataIni.Text,1,2)+''''+
             ' AND     SUBSTR(P.VALORAMIGRAR,7,4)||''/''||SUBSTR(P.VALORAMIGRAR,4,2)||''/''||SUBSTR(P.VALORAMIGRAR,1,2)  <= '''+Copy(edDataFim.Text,7,4)+'/'+Copy(edDataFim.Text,4,2)+'/'+Copy(edDataFim.Text,1,2)+''''+
             ' AND     P.IDPESSOA IN ( SELECT DISTINCT IDPESSOA FROM SIMULAMIGRACAO '+
             '                         WHERE  ANOMESREF = '''+Copy(edDataBase.Text,7,4)+'/'+Copy(edDataBase.Text,4,2)+''''+
             '                         AND    SITUACAO  IN (''MA'', ''AT'') )                                            '+
             ' AND     P.IDPESSOA IN ( SELECT DISTINCT IDPESSOA FROM PREVIAMIGRAPLANO '+
             '                         WHERE  CODCAMPOMIGRA = ''OPCAO'' '+
             '                         AND    VALORAMIGRAR  = ''3''  )   ');
     Open;
  end;

  i := 0;
  while not qry.Eof do
  begin
     sSQL := ' SELECT '+
             '        EL.TEMPONAOCREDITADO, EL.TEMPOSERVANTERIOR, EL.TEMPOSERVANTREAL,                   '+
             '        EL.TEMPOSERVCALC,     EL.TEMPOSERVPRIVANT,  EL.TEMPOSERVPUBLANT,                   '+
             '        EL.TEMPOSERVTOTAL,    EL.TEMPOSERVTOTDIA,   EL.TEMPOSERVTOTMES,                    '+
             '        EL.TEMPOSITESPECIAL,  S.SALPARTICIPACAO     AS VALORPROVENTO,                      '+
             '        S.IDPESSJUR,          S.IDPLANOPREV,        S.IDPESSOA,         S.SEQPROPOSTA,     '+
             '        S.MATRICULA,          S.IDADEAPOS,                                                 '+
             '        DECODE(S.SITUACAO, ''FL'', ''AS'', S.SITUACAO) AS SITUACAO,                        '+
             '        S.DATANASC,           S.DATAMORTE,          S.ESTADOCIVIL AS ESTCIVIL,             '+
             '        S.SEXO,               S.DATAADMISSAO,       S.DATADEMISSAO,                        '+
             '        S.SALPARTICIPACAO,    S.REMUNERACAO,        S.CONTRIBUICAO,                        '+
             '        S.TAXAJOIA,           S.TEMPOINSS AS TCP,                                          '+
             '        S.TEMPOINSS,          S.JOIA,               S.PRAZOJOIAFALTA PRAZOJOIA,                      '+
             '        S.PRAZOJOIAPAGO TEMPOJOIA,      S.RPTRIBUTAVEL,       S.RPNAOTRIBUTAVEL,                     '+
             '        S.SRB,                S.FATORPREVIDENC,     S.TEMPOMINCONTRIB,                     '+
             '        S.DATAINICIOFUND,     S.VALORATUAL,         S.VLRINFINSS,                          '+
             '        S.PROPORCAO,          S.COTAPENSAO,         S.DATANASCVIT,                         '+
             '        S.DATANASCTEMP,       S.NUMDEPEN,           S.NUMDEPENTEMP, S.NUMDEPENVIT,         '+
             '        S.IDBENEFICIO,        S.VALORABONO,         S.DATAULTSIMULA,                       '+
             '        S.CAMPOOP1,           S.CAMPOOP2,           S.CAMPOOP3,                            '+
             '        S.CAMPOOP4,           S.CAMPOOP5,                                                  '+
             '        '''+edDataBase.Text+''' AS DATAREF           '+
             ' FROM   ELEGPATRO EL, SIMULAMIGRACAO S, EVENTOGERADOR EG                                   '+
             ' WHERE  EG.IDEVENTOGERADOR = 45                                                            '+
             ' AND    S.IDPESSOA    = '+qry.FieldByName('IDPESSOA').AsString           +
             ' AND    S.ANOMESREF        = '''+Copy(edDataBase.Text,7,4)+'/'+Copy(edDataBase.Text,4,2)+''''+
             ' AND    EL.IDPESSJUR       = S.IDPESSJUR                                                   '+
             ' AND    EL.IDPESSOA        = S.IDPESSOA                                                    ';

     sFatorRedutor := RodaRegraSimula('1771', sSQL, bErro, iIdCalculoGeral);

     sSQL := ' SELECT S.SRB, '+OraNumero(sFatorRedutor)+' AS FATORREDUTOR, S.IDPLANOPREV '+
             ' FROM   SIMULAMIGRACAO S '+
             ' WHERE  S.IDPESSOA    = '+qry.FieldByName('IDPESSOA').AsString           +
             ' AND    S.ANOMESREF   = '''+Copy(edDataBase.Text,7,4)+'/'+Copy(edDataBase.Text,4,2)+'''';

     sPeculio := RodaRegraSimula('1815', sSQL, bErro, iIdCalculoGeral);


     // Verificar se existe a linha na previamigraplano
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' SELECT VALORAMIGRAR     '+
                    ' FROM   PREVIAMIGRAPLANO '+
                    ' WHERE  IDPESSOA      = '+qry.FieldByName('IDPESSOA').AsString           +
                    ' AND    CODCAMPOMIGRA = ''505'' ');
     qryAux.Open;
     if qryAux.IsEmpty
     then begin
        qryGrava.Close;
        qryGrava.SQL.Clear;
        qryGrava.SQL.Add('INSERT INTO PREVIAMIGRAPLANO                                 '+
                         '(IDPESSJUR, IDPLANOPREV, IDPESSOA, SEQPROPOSTA, IDPLANODEST, '+
                         ' CODCAMPOMIGRA, VALORAMIGRAR)                                '+
                         ' VALUES (                                                    '+
                         qry.FieldByName('IDPESSJUR').AsString+','+
                         qry.FieldByName('IDPLANOPREV').AsString+','+
                         qry.FieldByName('IDPESSOA').AsString+','+
                         qry.FieldByName('SEQPROPOSTA').AsString+','+
                         '33,'+
                         '''505'', '+
                         OraNumero(sPeculio)+')');
        try
           qryGrava.ExecSQL;
        except
        end;
        qryGrava.Close;
        qryGrava.SQL.Clear;
        qryGrava.SQL.Add('INSERT INTO PREVIAMIGRAPLANO                                 '+
                         '(IDPESSJUR, IDPLANOPREV, IDPESSOA, SEQPROPOSTA, IDPLANODEST, '+
                         ' CODCAMPOMIGRA, VALORAMIGRAR)                                '+
                         ' VALUES (                                                    '+
                         qry.FieldByName('IDPESSJUR').AsString+','+
                         qry.FieldByName('IDPLANOPREV').AsString+','+
                         qry.FieldByName('IDPESSOA').AsString+','+
                         qry.FieldByName('SEQPROPOSTA').AsString+','+
                         '33,'+
                         '''304'', '+
                         OraNumero(sPeculio)+')');
        try
           qryGrava.ExecSQL;
        except
        end;
     end;

     qryGrava.Close;
     qryGrava.SQL.Clear;
     qryGrava.SQL.Add('UPDATE RESERVAPART SET VALORRESERVA = '+OraNumero(sPeculio)+
                      'WHERE  IDPESSOA      = '+qry.FieldByName('IDPESSOA').AsString+
                      'AND    IDTIPORESERVA IN (44,57) ');
     try
        qryGrava.ExecSQL;
     except
     end;

     qryGrava.Close;
     qryGrava.SQL.Clear;
     qryGrava.SQL.Add('UPDATE RESERVAPART SET VALORRESERVA = 0 '+
                      'WHERE  IDPESSOA      = '+qry.FieldByName('IDPESSOA').AsString+
                      'AND    IDTIPORESERVA IN (43,58) ');
     try
        qryGrava.ExecSQL;
     except
     end;

     inc(i);
     lblProgresso.Caption := InttoStr(i)+' registro processados.';
     Application.ProcessMessages;
     qry.Next;
  end;

  if MsgDlg('Atualização Concluída. Deseja Confirmar ? ','Erro', mtError, [mbYes, mbNo],0) = mrYes
  then dtmBaseDados.dbBaseDados.Commit
  else dtmBaseDados.dbBaseDados.Rollback;

end;

function TfrmAcertaPeculio.RodaRegraSimula(sNumRegra,sSQL : string; var bErro : boolean; var piIdCalculo : longInt ) : string;
var cAux        : char;
    RegraSimula : TRegra;
begin
   Result := '0';
   bErro := False;

   try
      RegraSimula := TRegra.Create(Application);
      RegraSimula.DatabaseName := 'BaseDados';
      RegraSimula.IdEmpresa    := -1;
      RegraSimula.QueryIn      := qryRegra;

      iIdCalculoGeral := 0;
      // Se o idcalculo for menor que zero, entao igualar a zero, pois a regra dá
      // erro se o idcalculo for menor que zero
      if piIdCalculo < 0 then piIdCalculo := 0;
      if Trim(sNumRegra) = '' then Exit;
      if StrToInt(sNumRegra) <= 0 then Exit;

      RegraSimula.RuleName := sNumRegra;
      qryRegra.Close;
      qryRegra.SQL.Clear;
      qryRegra.SQl.Add(sSQL);
      qryRegra.Open;
      // Se a query estiver vazia, passar uma query generica pois talvez
      // a regra nao precise de nenhum campo da query, mas precisa de uma
      // linha qualquer.
      if not qryRegra.IsEmpty
      then begin
         cAux                  := DecimalSeparator;
         RegraSimula.QueryIn   := qryRegra;
         RegraSimula.IdCalculo := piIdCalculo;
         RegraSimula.Execute;

         if not RegraSimula.Error
         then begin
            piIdCalculo := RegraSimula.IdCalculo;

            // Verificar se o resultado da regra é um número válido
            try
               StrToFloat(ClienteNumero(RegraSimula.Result))
            except
               MsgDlg('O valor retornado pela regra Nº '+sNumRegra+' não é um valor válido. Verifique. '+
                      '[VALOR = '+RegraSimula.Result+']','Erro',mtError,[mbOk, mbHelp],0);
               bErro := True;
               piIdCalculo := -1;
            end;
            Result := OraNumero(RegraSimula.Result);
         end
         else begin
            bErro       := True;
            piIdCalculo := -1;
         end;
      end;
   finally
      qryRegra.Close;
      RegraSimula.Free;
      DecimalSeparator := cAux;
      iIdCalculoGeral := 0;
   end;
end;

end.
