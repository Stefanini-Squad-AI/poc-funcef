unit uCtrlWebImagem;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes;

Type
  TCtrlWebImagem = class(TCmControlObject)
  private

  protected

  public

    function SelecionaImagem( iIdImagem : integer ) : OleVariant;

  published

end;

implementation

{ TCtrlWebImagem }

function TCtrlWebImagem.SelecionaImagem( iIdImagem: integer): OleVariant;
begin
  Result := GetDataPacket( ' select    IMAGEM      ' +
                           '  from     IMAGENS     ' +
                           ' where     IDIMAGEM  = ' + IntToStr( iIdImagem ) );
end;

end.
