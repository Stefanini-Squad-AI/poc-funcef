unit uCtrlReports;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet, uCmTypes;

Type
  TCtrlReports = class(TCmControlObject)
  private

  protected

  public

    function SelecionaReports( iIdReports, iOrigemCM : integer ) : OleVariant;

    function SelecionaDataView( iIdDataView, iOrigemCMDV : integer): OleVariant;

  published

end;

implementation

{ TCtrlRelatorios }

function TCtrlReports.SelecionaDataView( iIdDataView, iOrigemCMDV : integer): OleVariant;
begin
  Result := GetDataPacket(
   ' select NAME,                                    ' +
   '        IDDATAVIEW,                              ' +
   '        ORIGEMCMDV,                              ' +
   '        TEMPLATE                                 ' +
   ' from   DATAVIEW                                 ' +
   ' where  IDDATAVIEW = ' + IntToStr( iIdDataView )   +
   '   and  ORIGEMCMDV = ' + IntToStr( iOrigemCMDV ) ) ;
end;

function TCtrlReports.SelecionaReports( iIdReports, iOrigemCM : integer): OleVariant;
begin
  Result := GetDataPacket(
   ' select NAME,                                   ' +
   '        TEMPLATE,                               ' +
   '        IDDATAVIEW,                             ' +
   '        ORIGEMCMDV                              ' +
   ' from   REPORTS                                 ' +
   ' where  IDREPORTS  = ' + IntToStr( iIdReports )   +
   '   and  ORIGEMCM   = ' + IntToStr( iOrigemCM  ) ) ;
end;

end.
