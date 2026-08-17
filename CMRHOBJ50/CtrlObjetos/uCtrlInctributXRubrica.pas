//***************************************************************************************
//Nº SOL: 229874.16590 e 258754.17869 -
//Nº PPM: 1136600
//Data da Alteração: 08/12/2015
//Alteração Form: ajustes de campos novos e alteração de outros campos
//Responsável: Michelle Suellyn Mota
//Descrição: Adequação do cadastro de rubricas ao manual 2.1 do eSocial 
//**************************************************************************************
{ --------------------------------------------------------------------------------------------------
Autor(a)   : Felipe Azevedo dos Santos / William Santana
Data       : 14/11/2014
Pendência  : SOL 229874/16590 PPM 544597
Descricao  : criação da Ctrl
{ --------------------------------------------------------------------------------------------------}

unit uCtrlInctributXRubrica;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet, uCtrlFuncoesRH,
     uCtrlCustomRH;

type
    TCtrlInctributXRubrica = class(TCtrlCustomRH)

    private

    public
      function ListInctributXRubrica(pGrupo : string) : OleVariant;
    end;


implementation

{ TCtrlInctributXRubrica }


function TCtrlInctributXRubrica.ListInctributXRubrica(
  pGrupo: string): OleVariant;
var
   sSQL : String;
begin
   sSQL := 'SELECT I.IDINCTRIBUTXRUBRICA, ' +
           '       I.CODIGO, ' +
           '       I.DESCRICAO, ' +
           '       I.GRUPO ' +
           '  FROM INCTRIBUTXRUBRICA I ' +
           ' WHERE GRUPO = ' + QuotedStr(pGrupo);

  Result := GetDataPacket(sSQL);
end;

end.
