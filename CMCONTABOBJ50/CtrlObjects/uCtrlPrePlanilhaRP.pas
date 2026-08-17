unit uCtrlPrePlanilhaRP;

interface

Uses DB, uDataBase, uCmControlObject, dbclient, sysutils,Provider,
     ComCtrls,CMProcuraMask,CMProcura,DBTables,uCtrlPrePlanilha;

  Type

    TCtrlPrePlanilhaRP = Class(TCtrlPrePlanilha)

    private

    protected

    public

      {Esta função tem como finalidade trazer os detalhes do cadastro pre-planilha (rateio por programa}
      function ListCdsDetalheRP(dPanCodigo :Double) :OleVariant;


    End;


implementation

function TCtrlPrePlanilhaRP.ListCdsDetalheRP(dPanCodigo :Double) :OleVariant;
var
  sSql :string;
begin
      sSql := 'SELECT ' +
              '     PANCODIGO,         ' +
              '     PANNUMLANC,        ' +
              '     PLANO,             ' +
              '     PANCONTABASE,      ' +
              '     IDPESSOA,          ' +
              '     PLACONTA,          ' +
              '     IDUSUARIOINCLUSAO, ' +
              '     PANPERC,           ' +
              '     IDPATRO,           ' +
              '     IDPLANOPREV,       ' +
              '     HITCODHIST         ' +
              'FROM ' +
              '    PREDETALHE ' +
              'WHERE (PANCODIGO = ' + FloatToStr(dPanCodigo) + ') ';


      Result := GetDataPacket(sSql);

end;




end.

