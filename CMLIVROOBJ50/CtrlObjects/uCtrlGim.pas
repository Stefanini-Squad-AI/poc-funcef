unit uCtrlGim;

interface

Uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient;

Type
    TCtrlGIM = Class(TCmControlObject)

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

{ TCtrlGIM }



constructor TCtrlGIM.Create;
begin
  inherited;

end;

destructor TCtrlGIM.Destroy;
begin
  inherited;

end;


procedure TCtrlGIM.DoChangeDataBase;
begin
  inherited;

end;






function TCtrlGIM.MontaSelect(TipoRegistro : Byte; IdPessoa : Integer;
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
      2:  //Valores totais de entrada
        Begin
          Ssql := 'SELECT SUM(DECODE(SUBSTR(LD.CODFISCAL, 1, 1), ''1'', VALORCONTABIL, 0)) AS VALORCONTABILESTADO, '+
                  '       SUM(DECODE(SUBSTR(LD.CODFISCAL, 1, 1), ''2'', VALORCONTABIL, 0)) AS VALORCONTABILINTERESTADUAL, '+
                  '       SUM(DECODE(SUBSTR(LD.CODFISCAL, 1, 1), ''3'', VALORCONTABIL, 0)) AS VALORCONTABILEXTERIOR, '+
                  '       SUM(DECODE(SUBSTR(LD.CODFISCAL, 1, 1), ''1'', BASECALCULO, 0)) AS BASECALCULOESTADO, '+
                  '       SUM(DECODE(SUBSTR(LD.CODFISCAL, 1, 1), ''2'', BASECALCULO, 0)) AS BASECALCULOINTERESTADUAL, '+
                  '       SUM(DECODE(SUBSTR(LD.CODFISCAL, 1, 1), ''3'', BASECALCULO, 0)) AS BASECALCULOEXTERIOR, '+
                  '       SUM(DECODE(SUBSTR(LD.CODFISCAL, 1, 1), ''1'', VALORIMPOSTO, 0)) AS VALORIMPOSTOESTADO, '+
                  '       SUM(DECODE(SUBSTR(LD.CODFISCAL, 1, 1), ''2'', VALORIMPOSTO, 0)) AS VALORIMPOSTOINTERESTADUAL, '+
                  '       SUM(DECODE(SUBSTR(LD.CODFISCAL, 1, 1), ''3'', VALORIMPOSTO, 0)) AS VALORIMPOSTOEXTERIOR, '+
                  '       SUM(VALORCONTABIL) AS VALORTOTAL, '+
                  '       SUM(BASECALCULO) AS BASECALCULOTOTAL, '+
                  '       SUM(VALORIMPOSTO) AS VALORIMPOSTOTOTAL '+
                  '  FROM NFLIVRO L, NFLIVRODETALHE LD '+
                  ' WHERE L.IDPESSOA = '+intTostr(IdPessoa) +
                  '   AND L.DATAENTRADANF BETWEEN  TO_DATE('+quotedStr(Dataini)+', ''DD/MM/YYYY'') AND TO_DATE('+quotedStr(DataFim)+ ', ''DD/MM/YYYY'') '+
                  '   AND L.FLGENTRADASAIDA = ''E'' '+
                  '   AND L.IDNFLIVRO = LD.IDNFLIVRO ' +
                  '   AND LD.CODFISCAL IS NOT NULL ';
        end;
      3:  //Valores totais de saídas
        Begin
          Ssql := 'SELECT SUM(DECODE(SUBSTR(LD.CODFISCAL, 1, 1), ''5'', VALORCONTABIL, 0)) AS VALORCONTABILESTADO, '+
                  '       SUM(DECODE(SUBSTR(LD.CODFISCAL, 1, 1), ''6'', VALORCONTABIL, 0)) AS VALORCONTABILINTERESTADUAL, '+
                  '       SUM(DECODE(SUBSTR(LD.CODFISCAL, 1, 1), ''7'', VALORCONTABIL, 0)) AS VALORCONTABILEXTERIOR, '+
                  '       SUM(DECODE(SUBSTR(LD.CODFISCAL, 1, 1), ''5'', BASECALCULO, 0)) AS BASECALCULOESTADO, '+
                  '       SUM(DECODE(SUBSTR(LD.CODFISCAL, 1, 1), ''6'', BASECALCULO, 0)) AS BASECALCULOINTERESTADUAL, '+
                  '       SUM(DECODE(SUBSTR(LD.CODFISCAL, 1, 1), ''7'', BASECALCULO, 0)) AS BASECALCULOEXTERIOR, '+
                  '       SUM(DECODE(SUBSTR(LD.CODFISCAL, 1, 1), ''5'', VALORIMPOSTO, 0)) AS VALORIMPOSTOESTADO, '+
                  '       SUM(DECODE(SUBSTR(LD.CODFISCAL, 1, 1), ''6'', VALORIMPOSTO, 0)) AS VALORIMPOSTOINTERESTADUAL, '+
                  '       SUM(DECODE(SUBSTR(LD.CODFISCAL, 1, 1), ''7'', VALORIMPOSTO, 0)) AS VALORIMPOSTOEXTERIOR, '+
                  '       SUM(VALORCONTABIL) AS VALORTOTAL, '+
                  '       SUM(BASECALCULO) AS BASECALCULOTOTAL, '+
                  '       SUM(VALORIMPOSTO) AS VALORIMPOSTOTOTAL '+
                  '  FROM NFLIVRO L, NFLIVRODETALHE LD '+
                  ' WHERE L.IDPESSOA = '+intTostr(IdPessoa) +
                  '   AND L.DATAENTRADANF BETWEEN  TO_DATE('+quotedStr(Dataini)+', ''DD/MM/YYYY'') AND TO_DATE('+quotedStr(DataFim)+ ', ''DD/MM/YYYY'') '+
                  '   AND L.FLGENTRADASAIDA = ''S'' '+
                  '   AND L.IDNFLIVRO = LD.IDNFLIVRO ' +
                  '   AND LD.CODFISCAL IS NOT NULL ';
        end;
      4: // Crédito de Imposto
        Begin
          Ssql := 'SELECT LD.VALORCONTABIL, LD.BASECALCULO, LD.VALORIMPOSTO '+
                  '  FROM NFLIVRO L, NFLIVRODETALHE LD '+
                  ' WHERE L.IDPESSOA = '+intTostr(IdPessoa) +
                  '   AND L.DATAENTRADANF BETWEEN  TO_DATE('+quotedStr(Dataini)+', ''DD/MM/YYYY'') AND TO_DATE('+quotedStr(DataFim)+ ', ''DD/MM/YYYY'') '+
                  '   AND L.FLGENTRADASAIDA = ''E'' '+
                  '   AND L.IDNFLIVRO = LD.IDNFLIVRO '+
                  '   AND SUBSTR(LD.CODFISCAL, 1, 1) IN (''1'', ''2'', ''3'') ';
        end;
      5: //Débito de imposto
        Begin
          Ssql := 'SELECT LD.VALORCONTABIL, LD.BASECALCULO, LD.VALORIMPOSTO '+
                  '  FROM NFLIVRO L, NFLIVRODETALHE LD '+
                  ' WHERE L.IDPESSOA = '+intTostr(IdPessoa) +
                  '   AND L.DATAENTRADANF BETWEEN  TO_DATE('+quotedStr(Dataini)+', ''DD/MM/YYYY'') AND TO_DATE('+quotedStr(DataFim)+ ', ''DD/MM/YYYY'') '+
                  '   AND L.FLGENTRADASAIDA = ''S'' '+
                  '   AND L.IDNFLIVRO = LD.IDNFLIVRO '+
                  '   AND SUBSTR(LD.CODFISCAL, 1, 1) IN (''5'', ''6'', ''7'') ';
        end;
      6: //Detalhamentos dos Débitos e Créditos
        Begin
          Ssql := 'SELECT * FROM PARAMAPURACAO  '+
                  ' WHERE (DATAINICIAL = TO_DATE('+quotedStr(Dataini)+', ''DD/MM/YYYY'')) '+
                  '   AND (TIPODEBITOIMPOSTO IN (2,3,6,7)) '+
                  ' ORDER BY TIPODEBITOIMPOSTO,SEQCAMPO ';
        end;
    end;
    Result := GetDataPacket(Ssql);
end;

procedure TCtrlGIM.OnCreateAppServer;
begin
  inherited;

end;

end.
