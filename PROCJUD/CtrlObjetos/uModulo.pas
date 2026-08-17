unit uModulo;

interface

uses SysUtils, Dialogs, uCmControlObject, uCmClientDataSet, uCMTypes;

type
  TModulo = class(TCmControlObject)
  private
    FIdContraCheque: integer;
  public
    function StatusIsAtivo(IdPessoa, IdEmpresa: integer): boolean;

    property IdContraCheque: integer read FIdContraCheque write FIdContraCheque;
  end;

var
  Modulo: TModulo;

implementation

uses uMensErro, uCtrlParamIntegra, uFuncoesUteisRH;

function TModulo.StatusIsAtivo(IdPessoa, IdEmpresa: integer): boolean;
var
  sNome: string;
begin
  if (ParamIntegra.RecPag = 'P') then
  begin
    _Cds.Data := GetDataPacket(
      'SELECT FLGSTATUS'+CR_LF+
      'FROM   EMPRESAFORN'+CR_LF+
      'WHERE  (IDFORCLI = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
      '       (IDPESSOA = ' +IntToStr(IdEmpresa)+ ')');
    sNome := 'Fornecedor\Favorecido';
  end
  else
  begin
    _Cds.Data := GetDataPacket(
      'SELECT FLGSTATUS'+CR_LF+
      'FROM   EMPRESACLIENTE'+CR_LF+
      'WHERE  (IDFORCLI = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
      '       (IDPESSOA = ' +IntToStr(IdEmpresa)+ ')');
    sNome := 'Cliente';
  end;

  Result := (_Cds.IsEmpty) or (_Cds.Fields[0].asString <> 'I');

  if not(Result) then
    MsgDlg('Este ' +sNome+ ' está Inativo.'+#13+#10+
           'Não é permitido fazer movimentação para o mesmo.', 'Atenção', mtInformation, [mbOk], 0);
end;

end.
