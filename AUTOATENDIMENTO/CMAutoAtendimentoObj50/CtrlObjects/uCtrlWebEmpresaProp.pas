unit uCtrlWebEmpresaProp;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet, uCmTypes;

Type
  TCtrlWebEmpresaProp = class(TCmControlObject)
  private

  protected

  public

    function EmpresaProp : OLEVariant;

    function CabecalhoRelatorio : OleVariant;

  published

end;

implementation

{ TCtrlWebEmpresaProp }

function TCtrlWebEmpresaProp.CabecalhoRelatorio: OleVariant;
begin
  Result := GetDataPacket( ' SELECT P.NOME , P.RAZAOSOCIAL, E.LOGRADOURO, ' +
                           ' E.NUMERO, E.COMPLEMENTO, E.BAIRRO, ' +
                           ' C.NOME AS CIDADE, C.CODESTADO, E.CEP, I.IMAGEM ' +
                           ' FROM PESSOA P,  FUNDACAO F,  ENDPESS E, IMAGENS I, CIDADES C ' +
                           ' WHERE ' +
                           ' ( P.IDPESSOA =  F.IDPESSOA) AND ' +
                           ' ( P.IDPESSOA =  E.IDPESSOA) AND ' +
                           ' (E.IDCIDADES   = C.IDCIDADES) AND ' +
                           ' ( P.IDIMAGEM = I.IDIMAGEM) ' );
end;

function TCtrlWebEmpresaProp.EmpresaProp : OLEVariant;
begin
  Result := GetDataPacket(
   ' select e.IDPESSOA,             ' +
   '        e.TIPOCLIENTE,          ' +
   '        p.NOME                  ' +
   ' from   EMPRESAPROP e,          ' +
   '        PESSOA p                ' +
   ' where  e.IDPESSOA = p.IDPESSOA ' );
end;

end.
