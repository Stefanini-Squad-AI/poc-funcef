unit uCtrlPrePlanilhaRA;

interface

Uses DB, uDataBase, uCmControlObject, dbclient, sysutils,Provider,
     ComCtrls,CMProcuraMask,CMProcura,DBTables,uCtrlPrePlanilha;

  Type

    TCtrlPrePlanilhaRA = Class(TCtrlPrePlanilha)

    private

    protected

    public

      {Esta função tem como finalidade trazer os detalhes do cadastro pre-planilha por rateio}
      function ListCdsDetalheRA(dPanCodigo :Double) :OleVariant;

      {Esta função tem como finalidade retornar o total do percentual da pre-planilha por rateio}
      function TotalPerc(dPanCodigo :Double) :Double;

      {Esta função tem como finalidade retornar o total do campo Contabase da pre-planilha por rateio}
      function ContaBase(dPanCodigo :Double) :Double;

      {Esta função listas todas as planilhas de rateio}
      Function ListPlanilhaRat(dEmpresa:Double) :OleVariant;

    End;


implementation


function TCtrlPrePlanilhaRA.ListCdsDetalheRA(dPanCodigo :Double) :OleVariant;
var
  sSql :string;
begin
      sSql := 'SELECT ' +
              '   P.IDEMPRESA,         ' +
              '   P.CODCENTROCUSTO,    ' +
              '   P.PANCCUSTOBASE,     ' +
              '   P.PLANO,             ' +
              '   P.PLACONTA,          ' +
              '   P.PANCONTABASE,      ' +
              '   P.IDPESSOA,          ' +
              '   P.PANCODIGO,         ' +
              '   P.PANNUMLANC,        ' +
              '   P.TIPCODIGO,         ' +
              '   P.PANTIPO,           ' +
              '   P.IDUSUARIOINCLUSAO, ' +
              '   P.PANPERC,           ' +
              '   P.UNIDNEGOC,         ' +
              '   P.CODSUBCONTA,       ' +
              '   U.UNECODIGO          ' +
              'FROM ' +
              '   PREDETALHE P, ' +
              '   UNIDNEGOCIO U ' +
              'WHERE ' +
              '      (P.PANCODIGO = ' + FloatToStr(dPanCodigo) + ') ' +
              '  AND (P.UNIDNEGOC = U.UNIDNEGOC(+)) ' +
              '  AND (P.IDPESSOA  = U.IDPESSOA(+)) ' +
              'ORDER BY  ' +
              '     P.PLACONTA ';

       Result := GetDataPacket(sSql);

end;

function TCtrlPrePlanilhaRA.TotalPerc(dPanCodigo:Double): Double;
begin

     _Cds.Data := GetDataPacket('SELECT SUM(PANPERC) AS SOMA '+
                                'FROM PREDETALHE  ' +
                                'WHERE (PANCODIGO = '+ FloatToStr(dPanCodigo) + ')');

     Result := _Cds.FieldByName('SOMA').AsFloat;
end;

function TCtrlPrePlanilhaRA.ContaBase(dPanCodigo:Double): Double;
begin

     _Cds.Data := GetDataPacket('SELECT COUNT(PANCONTABASE) AS TOTAL ' +
                                'FROM  PREDETALHE ' +
                                'WHERE   (PANCODIGO = ' + FloatToStr(dPanCodigo) + ')');

     Result := _Cds.FieldByName('TOTAL').AsFloat;
end;



function TCtrlPrePlanilhaRA.ListPlanilhaRat(dEmpresa:Double): OleVariant;
var
 sSql :string;
begin
      sSql := 'SELECT ' +
              '   PANCODIGO, PANDESCRICAO, PANPROCESSADA '+
              'FROM ' +
              '   PREPLANILHA ' +
              'WHERE (IDPESSOA = ' + FloatToStr(dEmpresa) + ') AND ' +
              '      (PANIDENTIFICACAO = ' + '''R''' + ')' +
              ' ORDER BY  PANDESCRICAO';

       Result := GetDataPacket(sSql);
end;

end.

