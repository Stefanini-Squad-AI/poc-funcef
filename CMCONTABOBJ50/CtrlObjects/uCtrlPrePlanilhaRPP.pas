unit uCtrlPrePlanilhaRPP;

interface

Uses DB, uDataBase, uCmControlObject, dbclient, sysutils,Provider,
     ComCtrls,CMProcuraMask,CMProcura,DBTables,uCtrlPrePlanilha;

  Type

    TCtrlPrePlanilhaRPP = Class(TCtrlPrePlanilha)

    private

    protected

    public

      {Esta função tem como finalidade trazer os detalhes do cadastro pre-planilha (rateio por plano e patro}
      function ListCdsDetalheRPP(dPanCodigo :Double) :OleVariant;

    End;


implementation

function TCtrlPrePlanilhaRPP.ListCdsDetalheRPP(dPanCodigo :Double) :OleVariant;
var
  sSql :string;
begin
      sSql := 'SELECT ' +
              '     PANCODIGO,         ' +
              '     PANNUMLANC,        ' +
              '     PLANO,             ' +
              '     PANCONTABASE,      ' +
              '     IDPESSOA,          ' +
              '     IDUSUARIOINCLUSAO, ' +
              '     HITCODHIST,        ' +
              '     PANORIGEM,         ' +
              '     PANTIPO,           ' +
              '     CODCENTROCUSTO,    ' +
              '     IDEMPRESA,         ' +
              '     UNIDNEGOC,         ' +
              '     CODSUBCONTA,       ' +
              '     IDPLANOPREV,       ' +
              '     IDPATRO,           ' +
              '     DECODE(PANORIGEM,''O'',PANCONTABASE,'' '') AS CONTABASE,    ' +
              '     DECODE(PANORIGEM,''D'',PANCONTABASE,'' '') AS CONTADESTINO, ' +
              '     DECODE(PANORIGEM,''C'',PANCONTABASE,'' '') AS CONTRAPARTIDA ' +
              'FROM ' +
              '     PREDETALHE ' +
              'WHERE (PANCODIGO = '+ FloatToStr(dPanCodigo) + ') ' +
              'ORDER BY PANORIGEM, PANCONTABASE ';

      Result := GetDataPacket(sSql);

end;


end.

