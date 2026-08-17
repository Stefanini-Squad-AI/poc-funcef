unit uCtrlWebBeneficio;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet, uCmTypes;

Type
  TCtrlWebBeneficio = class(TCmControlObject)
  private

  protected

  public

    function LookupEventoGerador : OleVariant;

    function LookupBeneficio( iIdEventoGerador : integer ) : OleVariant;

    function NomeEventoGerador( iIdEventoGerador : integer ) : OleVariant;

  published

end;

implementation

{ TCtrlWebBeneficio }

function TCtrlWebBeneficio.LookupBeneficio( iIdEventoGerador : integer ): OleVariant;
begin
  Result := GetDataPacket(
   ' select   IDBENEFICIO,      ' +
   '          NOME              ' +
   ' from     BENEFICIO         ' +
   ' where    IDEVENTOGERADOR = ' + IntToStr( iIdEventoGerador ) );

end;

function TCtrlWebBeneficio.LookupEventoGerador : OleVariant;
begin
  Result := GetDataPacket(
   ' select   IDEVENTOGERADOR,  ' +
   '          NOME              ' +
   ' from     EVENTOGERADOR     ' +
   ' where    NOME like ''AP%'' ' +
   ' order by NOME              ' );
end;

function TCtrlWebBeneficio.NomeEventoGerador( iIdEventoGerador : integer ): OleVariant;
begin
  Result := GetDataPacket(
   ' select   NOME              ' +
   ' from     EVENTOGERADOR     ' +
   ' where    IDEVENTOGERADOR = ' + IntToStr( iIdEventoGerador ) );
end;

end.
