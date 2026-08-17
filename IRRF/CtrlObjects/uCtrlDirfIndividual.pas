{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : SOL 155071 KTN 1471869
Responsável : Vinicius Eduardo N. Maciel
Data        : 10/01/2011
Descrição   : Criação dessa tela para o controle da tela de exportação de
              relatório individuais para a DIRF.
-------------------------------------------------------------------------------}
unit uCtrlDirfIndividual;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     {$IFNDEF VERSAO0505} uCMTypes {$ENDIF}, DBaseDados, Wwquery, Classes;

  Type
    TCtrlDirfIndividual = Class(TCmControlObject)

  public
      Constructor Create; Override;
      Destructor Destroy; Override;
      function carregaAno : OleVariant;
      function verificaEmpregado(sCodDocumento : String) : boolean;
      function retornaNome(sNumDocumento : String) : String;
      function carregaDados(sNumDocumento : String) : String;
      function retornaIDPessoa(sNumDocumento, sPeriodoInicio, sPeriodoFim, sNatureza : String) : integer;
      function carregaPessoa(listaCPF: TStringList; sAno : String) : String;
End;

implementation

{ TCtrLancIRRF }



{ TCtrlDirfIndividual }

function TCtrlDirfIndividual.carregaAno: OleVariant;
var
    sSQL : String;
begin
    sSQL := 'select distinct cast(perexercicio as varchar2(4)) as perexercicio  from periodo order by perexercicio desc';
    result := GetDataPacket(sSQL);
end;

function TCtrlDirfIndividual.carregaDados(sNumDocumento: String): String;
var
    sSql : String;
    sDtInicio, sDtFim : String;
begin
    sDtInicio := '2010/01';
    sDtFim := '2010/12';
    sSQL := ' SELECT * FROM';
    result := sSql;

end;


function TCtrlDirfIndividual.carregaPessoa(listaCPF: TStringList; sAno : String): String;
var
    sSQL, sCPF : String;
    i : integer;
begin
     sCPF :='';
     for i:= 0 to (listaCPF.Count-1) do
     begin
          sCPF := sCPF + QuotedStr(listaCPF[i])+',';
     end;
     sCPF := copy(sCPF,1,length(sCPF)-1);
     sSQL :=  ' Select DISTINCT QRL.IDPESSOA, P.NOME,  P.NUMDOCUMENTO,  H.CODIRRFDARF  NATUREZA' +
              ' FROM (SELECT max(P.IDPESSOA)     as idpessoa,P.NUMDOCUMENTO, H.CODIRRFDARF '+
              ' FROM PESSOA P, HISTRUBSAL H '+
              ' WHERE P.IDPESSOA = H.IDPESSOA '+
              ' AND    H.MESCOBRANCA BETWEEN '+QuotedStr(sAno+'/01')+' AND '+QuotedStr(sAno+'/12') +
              ' AND    P.NUMDOCUMENTO IN ('+sCPF+')' +
              ' AND    H.IDINFORME = 4' +
              ' AND    H.CODIRRFDARF IN (0561,0588) group by P.NUMDOCUMENTO, H.CODIRRFDARF) QRL,' +
              ' PESSOA P, HISTRUBSAL H' +
              ' WHERE QRL.IDPESSOA = P.IDPESSOA' +
              ' AND P.IDPESSOA = H.IDPESSOA' +
              ' AND H.CODIRRFDARF IN (0561, 0588) AND H.IDINFORME = 4';
Result := sSQL;
end;

constructor TCtrlDirfIndividual.Create;
begin
  inherited;

end;

destructor TCtrlDirfIndividual.Destroy;
begin
  inherited;

end;

function TCtrlDirfIndividual.retornaIDPessoa(sNumDocumento, sPeriodoInicio,
  sPeriodoFim, sNatureza: String): integer;
var
    qryAux : TwwQuery;
    sSQL  : String;
begin
    Result := -1;
    sSQL := '';
    qryAux := TwwQuery.create(nil);
    qryAux.DatabaseName := 'BASEDADOS';
    sSQL := sSQL + ' Select DISTINCT QRL.IDPESSOA, P.NOME,  P.NUMDOCUMENTO,  H.CODIRRFDARF  NATUREZA';
    sSQL := sSQL + ' FROM (SELECT max(P.IDPESSOA)     as idpessoa,P.NUMDOCUMENTO, H.CODIRRFDARF';
    sSQL := sSQL + ' FROM PESSOA P, HISTRUBSAL H';
    sSQL := sSQL + ' WHERE P.IDPESSOA = H.IDPESSOA';
    sSQL := sSQL + ' AND    P.NUMDOCUMENTO = '+QuotedStr(sNumDocumento);
    sSQL := sSQL + ' AND    H.MESCOBRANCA BETWEEN '+QuotedStr(sPeriodoInicio)+' AND '+QuotedStr(sPeriodoFim);
    sSQL := sSQL + ' AND    H.IDINFORME = 4';
    sSQL := sSQL + ' AND    H.IDINFORME = 4 AND H.CODIRRFDARF ='+sNatureza;
    sSQL := sSQL + ' group by P.NUMDOCUMENTO, H.CODIRRFDARF) QRL, PESSOA P, HISTRUBSAL H';
    sSQL := sSQL + ' WHERE QRL.IDPESSOA = P.IDPESSOA AND P.IDPESSOA = H.IDPESSOA AND H.IDINFORME = 4';
    sSQL := sSQL + ' AND H.CODIRRFDARF ='+sNatureza;
    qryAux.SQL.add(sSQL);
    qryAux.Open;
    result := qryAux.FieldByName('IDPESSOA').asInteger;
    FreeAndNil(qryAux);
end;

function TCtrlDirfIndividual.retornaNome(sNumDocumento: String): String;
    var
    sSQL : String;
    qryAux : TwwQuery;
begin
    result := '';
    sSQL := ' Select DISTINCT QRL.IDPESSOA, P.NOME,  P.NUMDOCUMENTO,  H.CODIRRFDARF NATUREZA';
    sSQL := sSQL + ' FROM (SELECT max(P.IDPESSOA) as idpessoa ';
    sSQL := sSQL + ' FROM PESSOA P, HISTRUBSAL H ';
    sSQL := sSQL + ' WHERE P.IDPESSOA = H.IDPESSOA ';
    sSQL := sSQL + ' AND P.NUMDOCUMENTO = '+QuotedStr(sNumDocumento) ;
    sSQL := sSQL + ' AND H.IDINFORME = 4 ';
    sSQL := sSQL + ' AND H.CODIRRFDARF IN (0561, 0588) ';
    sSQL := sSQL + ' group by P.NUMDOCUMENTO) QRL, ';
    sSQL := sSQL + ' PESSOA P, HISTRUBSAL H ';
    sSQL := sSQL + ' WHERE QRL.IDPESSOA = P.IDPESSOA ';
    sSQL := sSQL + ' AND P.IDPESSOA = H.IDPESSOA ';
    sSQL := sSQL + ' AND H.CODIRRFDARF IN (0561, 0588) ';
    sSQL := sSQL + ' AND H.IDINFORME = 4 ';
    qryAux :=TwwQuery.Create(nil);
    qryAux.DataBaseName := 'Basedados';
    qryAux.sql.add(sSQL);
    qryAux.open;
    result := qryAux.FieldByName('NOME').asString;
    FreeAndNil(qryAux);
end;

function TCtrlDirfIndividual.verificaEmpregado(
  sCodDocumento: String): boolean;
    var
    sSQL : String;
    qryAux : TwwQuery;
begin
    result := false;
    sSQL := 'select * from pessoa where numdocumento = '+QuotedStr(sCodDocumento);
    qryAux :=TwwQuery.Create(nil);
    qryAux.DataBaseName := 'Basedados';
    qryAux.sql.add(sSQL);
    try
        qryAux.open;
        if not (qryAux.isEmpty) then
        result := true;
    finally
        FreeAndNil(qryAux);
    end;
end;

end.
