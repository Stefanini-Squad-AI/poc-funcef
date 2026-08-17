unit uCtrlDFC;

interface

Uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient;

Type
    TCtrlDFC = Class(TCmControlObject)

    private

    protected

      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;

    public
      Constructor Create; Override;
      Destructor Destroy; Override;


      function MontaSelect(TipoRegistro : Byte; IdPessoa : Integer;
                           Dataini, DataFim : string) : OleVariant; //monta o select para o tipo de registro solicitado

    protected

    End;

implementation

{ TCtrlDFC }



constructor TCtrlDFC.Create;
begin
  inherited;

end;

destructor TCtrlDFC.Destroy;
begin
  inherited;

end;


procedure TCtrlDFC.DoChangeDataBase;
begin
  inherited;

end;






function TCtrlDFC.MontaSelect(TipoRegistro : Byte; IdPessoa : Integer;
                              Dataini, DataFim : string) : OleVariant;
Var
 Ssql  : string;
begin
   Case TipoRegistro of
      1:  //Cabeçalho
        Begin     //registro tipo 1
          Ssql := 'SELECT P.NUMDOCUMENTO, D.NUMDOCUMENTO AS INSCEST '+
                  '  FROM PESSOA P, DOCPESSOA D, PARAMLIVRO PL '+
                  ' WHERE P.IDPESSOA = '+intTostr(IdPessoa)+' '+
                  '   AND P.IDPESSOA = PL.IDPESSOA '+
                  '   AND PL.IDINSCEST = D.IDDOCUMENTO(+) '+
                  '   AND P.IDPESSOA = D.IDPESSOA  ';
        end;
      2:  //Somatório mês a mês das entradas
        Begin
          Ssql := 'SELECT TRUNC(SUM(DECODE(SUBSTR(L.DATAEMISSAONF,4,2),''01'',LD.VALORCONTABIL,0))) AS VLRJAN, '+
                  '       TRUNC(SUM(DECODE(SUBSTR(L.DATAEMISSAONF,4,2),''02'',LD.VALORCONTABIL,0))) AS VLRFEV, '+
                  '       TRUNC(SUM(DECODE(SUBSTR(L.DATAEMISSAONF,4,2),''03'',LD.VALORCONTABIL,0))) AS VLRMAR, '+
                  '       TRUNC(SUM(DECODE(SUBSTR(L.DATAEMISSAONF,4,2),''04'',LD.VALORCONTABIL,0))) AS VLRABR, '+
                  '       TRUNC(SUM(DECODE(SUBSTR(L.DATAEMISSAONF,4,2),''05'',LD.VALORCONTABIL,0))) AS VLRMAI, '+
                  '       TRUNC(SUM(DECODE(SUBSTR(L.DATAEMISSAONF,4,2),''06'',LD.VALORCONTABIL,0))) AS VLRJUN, '+
                  '       TRUNC(SUM(DECODE(SUBSTR(L.DATAEMISSAONF,4,2),''07'',LD.VALORCONTABIL,0))) AS VLRJUL, '+
                  '       TRUNC(SUM(DECODE(SUBSTR(L.DATAEMISSAONF,4,2),''08'',LD.VALORCONTABIL,0))) AS VLRAGO, '+
                  '       TRUNC(SUM(DECODE(SUBSTR(L.DATAEMISSAONF,4,2),''09'',LD.VALORCONTABIL,0))) AS VLRSET, '+
                  '       TRUNC(SUM(DECODE(SUBSTR(L.DATAEMISSAONF,4,2),''10'',LD.VALORCONTABIL,0))) AS VLROUT, '+
                  '       TRUNC(SUM(DECODE(SUBSTR(L.DATAEMISSAONF,4,2),''11'',LD.VALORCONTABIL,0))) AS VLRNOV, '+
                  '       TRUNC(SUM(DECODE(SUBSTR(L.DATAEMISSAONF,4,2),''12'',LD.VALORCONTABIL,0))) AS VLRDEZ '+
                  '  FROM NFLIVRO L, NFLIVRODETALHE LD '+
                  ' WHERE L.IDPESSOA = '+intTostr(IdPessoa)+
                  '   AND FLGENTRADASAIDA = ''E'' '+
                  '   AND L.IDNFLIVRO = LD.IDNFLIVRO '+
                  '   AND (L.DATAENTRADANF BETWEEN TO_DATE('+quotedStr(Dataini)+', ''DD/MM/YYYY'') AND TO_DATE('+quotedStr(DataFim)+', ''DD/MM/YYYY'')) ';
        end;
      3:  //Somatório mês a mês das saídas
        Begin
          Ssql := 'SELECT TRUNC(SUM(DECODE(SUBSTR(L.DATAEMISSAONF,4,2),''01'',LD.VALORCONTABIL,0))) AS VLRJAN, '+
                  '       TRUNC(SUM(DECODE(SUBSTR(L.DATAEMISSAONF,4,2),''02'',LD.VALORCONTABIL,0))) AS VLRFEV, '+
                  '       TRUNC(SUM(DECODE(SUBSTR(L.DATAEMISSAONF,4,2),''03'',LD.VALORCONTABIL,0))) AS VLRMAR, '+
                  '       TRUNC(SUM(DECODE(SUBSTR(L.DATAEMISSAONF,4,2),''04'',LD.VALORCONTABIL,0))) AS VLRABR, '+
                  '       TRUNC(SUM(DECODE(SUBSTR(L.DATAEMISSAONF,4,2),''05'',LD.VALORCONTABIL,0))) AS VLRMAI, '+
                  '       TRUNC(SUM(DECODE(SUBSTR(L.DATAEMISSAONF,4,2),''06'',LD.VALORCONTABIL,0))) AS VLRJUN, '+
                  '       TRUNC(SUM(DECODE(SUBSTR(L.DATAEMISSAONF,4,2),''07'',LD.VALORCONTABIL,0))) AS VLRJUL, '+
                  '       TRUNC(SUM(DECODE(SUBSTR(L.DATAEMISSAONF,4,2),''08'',LD.VALORCONTABIL,0))) AS VLRAGO, '+
                  '       TRUNC(SUM(DECODE(SUBSTR(L.DATAEMISSAONF,4,2),''09'',LD.VALORCONTABIL,0))) AS VLRSET, '+
                  '       TRUNC(SUM(DECODE(SUBSTR(L.DATAEMISSAONF,4,2),''10'',LD.VALORCONTABIL,0))) AS VLROUT, '+
                  '       TRUNC(SUM(DECODE(SUBSTR(L.DATAEMISSAONF,4,2),''11'',LD.VALORCONTABIL,0))) AS VLRNOV, '+
                  '       TRUNC(SUM(DECODE(SUBSTR(L.DATAEMISSAONF,4,2),''12'',LD.VALORCONTABIL,0))) AS VLRDEZ '+
                  '  FROM NFLIVRO L, NFLIVRODETALHE LD '+
                  ' WHERE L.IDPESSOA = '+intTostr(IdPessoa)+
                  '   AND FLGENTRADASAIDA = ''S'' '+
                  '   AND L.IDNFLIVRO = LD.IDNFLIVRO '+
                  '   AND (L.DATAENTRADANF BETWEEN TO_DATE('+quotedStr(Dataini)+', ''DD/MM/YYYY'') AND TO_DATE('+quotedStr(DataFim)+', ''DD/MM/YYYY'')) ';
        end;
      4: //Valor Total de isentos e outros - Saidas
        Begin
          Ssql := 'SELECT TRUNC(SUM(DECODE(LD.VALORISENTO, NULL, 0, LD.VALORISENTO))) AS VALORISENTO, '+
                  '       TRUNC(SUM(DECODE(LD.VALOROUTROS, NULL, 0, LD.VALOROUTROS))) AS VALOROUTROS, '+
                  '       (TRUNC(SUM(DECODE(LD.VALORISENTO, NULL, 0, LD.VALORISENTO))) + '+
                  '       TRUNC(SUM(DECODE(LD.VALOROUTROS, NULL, 0, LD.VALOROUTROS)))) AS VALORISENTOOUTROS '+
                  '  FROM NFLIVRO L, NFLIVRODETALHE LD '+
                  ' WHERE L.IDPESSOA = '+intTostr(IdPessoa)+
                  '   AND L.FLGENTRADASAIDA = ''S'' '+
                  '   AND L.IDNFLIVRO = LD.IDNFLIVRO '+
                  '   AND (L.DATAENTRADANF BETWEEN TO_DATE('+quotedStr(Dataini)+', ''DD/MM/YYYY'') AND TO_DATE('+quotedStr(DataFim)+', ''DD/MM/YYYY'')) ';
        end;
      5: //Totais de Entrada Para a DFC Normal (modelo 8)
        Begin
          Ssql := 'SELECT TRUNC(NVL(SUM(VALORCONTABIL),0)) AS VALORTOTAL, '+
                  '       TRUNC(NVL(SUM(BASECALCULO),0)) AS BASECALCULOTOTAL, '+
                  '       TRUNC(NVL(SUM(VALORISENTO),0)) AS VALORISENTOTOTAL, '+
                  '       TRUNC(NVL(SUM(VALOROUTROS),0)) AS VALOROUTROSTOTAL '+
                  '  FROM NFLIVRO L, NFLIVRODETALHE LD '+
                  ' WHERE (L.IDPESSOA = '+intTostr(IdPessoa)+ ')'+
                  '   AND (L.DATAENTRADANF BETWEEN TO_DATE('+quotedStr(Dataini)+', ''DD/MM/YYYY'') AND TO_DATE('+quotedStr(DataFim)+', ''DD/MM/YYYY'')) ' +
                  '   AND (L.FLGENTRADASAIDA = ''E'') '+
                  '   AND (L.IDNFLIVRO = LD.IDNFLIVRO) '+
                  '   AND (SUBSTR(LD.CODFISCAL, 1, 1) IN (''1'', ''2'', ''3'')) ';
        end;
      6: //Totais de Saída para a DFC Normal (modelo8)
        Begin
          Ssql := 'SELECT TRUNC(NVL(SUM(VALORCONTABIL),0)) AS VALORTOTAL, '+
                  '       TRUNC(NVL(SUM(BASECALCULO),0)) AS BASECALCULOTOTAL, '+
                  '       TRUNC(NVL(SUM(VALORISENTO),0)) AS VALORISENTOTOTAL, '+
                  '       TRUNC(NVL(SUM(VALOROUTROS),0)) AS VALOROUTROSTOTAL '+
                  '  FROM NFLIVRO L, NFLIVRODETALHE LD '+
                  ' WHERE L.IDPESSOA = '+intTostr(IdPessoa)+
                  '   AND (L.DATAENTRADANF BETWEEN TO_DATE('+quotedStr(Dataini)+', ''DD/MM/YYYY'') AND TO_DATE('+quotedStr(DataFim)+', ''DD/MM/YYYY'')) ' +
                  '   AND L.FLGENTRADASAIDA = ''S'' '+
                  '   AND L.IDNFLIVRO = LD.IDNFLIVRO '+
                  '   AND SUBSTR(LD.CODFISCAL, 1, 1) IN (''5'', ''6'', ''7'') ';
        end;
    end;
    Result := GetDataPacket(Ssql);

end;











procedure TCtrlDFC.OnCreateAppServer;
begin
  inherited;

end;






end.
