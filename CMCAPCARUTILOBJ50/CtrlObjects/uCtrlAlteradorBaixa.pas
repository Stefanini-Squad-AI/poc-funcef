unit uCtrlAlteradorBaixa;

interface

Uses
  SysUtils, DbClient, Db, Classes, uCmControlObject, uCMTypes, uCtrlDocumento;

Type
  TCtrlAlteradorBaixa = Class(TCmControlObject)
  Protected
    procedure AfterInitialize; Override;
  Private
    _Documento: TCtrlDocumento;
    _CdsAlteradores: TClientDataSet;

  Public
    Constructor Create; Override;
    Destructor Destroy; Override;

    function Excluir(iCodDocumento, iIdModulo: Integer; bPartidaDobrada, bUsaPlanoPatro: Boolean): Boolean;
    function Estornar(iCodDocumento, iIdModulo, iIdEmpresa, IdUsuario, iPlanoConta: Integer; bUsaPlanoPatro: Boolean): Boolean;
  end;

implementation

{ TCtrlAlteradorBaixa }

procedure TCtrlAlteradorBaixa.AfterInitialize;
begin
  inherited;
  _Documento.InitializeAs(Self);
end;

constructor TCtrlAlteradorBaixa.Create;
begin
  inherited;
  _Documento := TCtrlDocumento.Create;
  _CdsAlteradores := TClientDataSet.Create(nil);
end;

destructor TCtrlAlteradorBaixa.Destroy;
begin
  _Documento.Free;
  _CdsAlteradores.Free;
  inherited;
end;

function TCtrlAlteradorBaixa.Estornar(iCodDocumento, iIdModulo, iIdEmpresa, IdUsuario, iPlanoConta: Integer; bUsaPlanoPatro: Boolean): Boolean;
begin
   Result := True;
   
   _CdsAlteradores.Data := GetDataPacket('SELECT NUMLANCTO, DATALANCTO FROM LANCTODOCUM WHERE CODDOCUMENTO = ' + IntToStr(iCodDocumento) + ' AND OPERACAO = ''4'' AND FLGLANCBAIXA = ''S''');

   if not _CdsAlteradores.IsEmpty then
   begin
     _CdsAlteradores.First;
     While not _CdsAlteradores.Eof do
     begin
        Result := _Documento.Estornar( _CdsAlteradores.FieldByName( 'DATALANCTO' ).AsDateTime,
                                       iIdModulo,
                                       iIdEmpresa,
                                       IdUsuario,
                                       iCodDocumento,
                                       _CdsAlteradores.FieldByName( 'NUMLANCTO').AsInteger,
                                       iPlanoConta,
                                       bUsaPlanoPatro );


        if not Result then
        begin
          MessageInfo := _Documento.MessageInfo;
          _CdsAlteradores.Last;
        end
        else
          _CdsAlteradores.Next;
     end;
   end;
end;

function TCtrlAlteradorBaixa.Excluir(iCodDocumento, iIdModulo: Integer; bPartidaDobrada, bUsaPlanoPatro: Boolean): Boolean;
begin
   Result := True;

   _CdsAlteradores.Data := GetDataPacket('SELECT NUMLANCTO FROM LANCTODOCUM WHERE CODDOCUMENTO = ' + IntToStr(iCodDocumento) + ' AND OPERACAO = ''4'' AND FLGLANCBAIXA = ''S''');

   try
     if not _CdsAlteradores.IsEmpty then


     begin
       _CdsAlteradores.First;
       While not _CdsAlteradores.Eof do
       begin
          _Documento.Prepare(OpLanctoDocum, odlAlterador);
          _Documento.PartidaDobrada := bPartidaDobrada;
          _Documento.CodDocumento := iCodDocumento;
          _Documento.IdModulo := iIdModulo;
          _Documento.UsaPlanoPatro := bUsaPlanoPatro;
          _Documento.Lanctodocum.CodDocumento := iCodDocumento;
          _Documento.Lanctodocum.NumLancto := _CdsAlteradores.FieldByName('NUMLANCTO').AsInteger;
          _Documento.Lanctodocum.IdModulo := iIdModulo;

          Result := _Documento.Delete;

          if not Result then
          begin
            MessageInfo := _Documento.MessageInfo;
            _CdsAlteradores.Last;
          end
          else
            _CdsAlteradores.Next;
       end;
     end;
   finally
     _CdsAlteradores.Close; // 14/06/2008 - ### André tavares - para consertar o erro "insufficient memory for this operation"
   end;
end;

end.

