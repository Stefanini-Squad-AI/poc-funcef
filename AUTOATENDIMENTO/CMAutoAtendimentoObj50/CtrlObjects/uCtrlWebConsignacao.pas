unit uCtrlWebConsignacao;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes;

Type
  TCtrlWebConsignacao = class(TCmControlObject)
  private

  protected

  public

    function SelecionaConsignacao( iIdPessoa: integer ) : OleVariant;
    function SelecionaDadosConsignacao( iIdFavorecido, iIdPessoa : integer ) : OleVariant;
    function SelecionaPagtoConsignacao( sAno : String; iIdFavorecido, iIdPessoa : integer ) : OleVariant;
    function SelecionaAnoPagtoConsignacao( iIdFavorecido, iIdPessoa : integer ) : OleVariant;

  published

end;

implementation

{ TCtrlWebConsignacao }

function TCtrlWebConsignacao.SelecionaAnoPagtoConsignacao( iIdFavorecido, iIdPessoa : integer ): OleVariant;
begin
  Result := GetDataPacket(
   ' select distinct                                               ' +
   '          substr( h.MES, 1, 4 ) as ANO                         ' +
   '     from  RUBRICAINDIV  r,                                    ' +
   '           HISTRUBSAL    h                                     ' +
   '    where  r.IDTITULAR      = ' + IntToStr( iIdPessoa )          +
   '      and  r.IDFAVORECIDO   = ' + IntToStr( iIdFavorecido )      +
   '      and  r.FLGPENSAOALIM  = 1                                ' +
   '      and  r.FLGTPRUBMANUT  = ''1''                            ' +
   '      and  ( r.FLGDESATIVADO  is null or r.FLGDESATIVADO = 0 ) ' +
   '      and  r.IDPESSOA       = h.IDTITULAR                      ' +
   '      and  r.IDFAVORECIDO   = h.IDFAVORECIDO                   ' +
   '      and  r.IDRUBRICA      = h.IDRUBRICA                      ' +
   ' order by  1                                                   ' );
end;

function TCtrlWebConsignacao.SelecionaConsignacao( iIdPessoa: integer ): OleVariant;
begin
  Result := GetDataPacket(
   '   select  r.DATAINICIO,                                        ' +
   '           r.DATAFINAL,                                         ' +
   '           p.NOME as FAVORECIDO,                                ' +
   '           r.IDPESSOA,                                          ' +
   '           r.IDFAVORECIDO,                                      ' +
   '           r.PARCELAS,                                          ' +
   '           r.NUMOCORRENCIAS as PROCESSADAS,                     ' +
   '           a.NOME as ALIMENTADO,                                ' +
   '           r.FLGUSAABONO,                                       ' +
   '           r.FLGPERMANENTE                                      ' +
   '     from  RUBRICAINDIV  r,                                     ' +
   '           PESSOA        p,                                     ' +
   '           PESSOA        a                                      ' +
   '    where  r.IDTITULAR      = ' + IntToStr( iIdPessoa )           +
   '      and  r.FLGPENSAOALIM  = 1                                 ' +
   '      and  r.FLGTPRUBMANUT  = ''1''                             ' +
   '      and  ( r.FLGDESATIVADO  is null or r.FLGDESATIVADO = 0 )  ' +
   '      and  r.IDFAVORECIDO   = p.IDPESSOA                        ' +
   '      and  r.IDALIMENTADO   = a.IDPESSOA (+)                    ' +
   ' order by  r.DATAINICIO,                                        ' +
   '           FAVORECIDO                                           ' );
end;

function TCtrlWebConsignacao.SelecionaDadosConsignacao( iIdFavorecido, iIdPessoa : integer ): OleVariant;
begin
  Result := GetDataPacket(
   '   select  r.DATAINICIO,                                                    ' +
   '           r.DATAFINAL,                                                     ' +
   '           p.NOME as FAVORECIDO,                                            ' +
   '           r.PARCELAS,                                                      ' +
   '           r.NUMOCORRENCIAS as PROCESSADAS,                                 ' +
   '           a.NOME as ALIMENTADO,                                            ' +
   '           r.FLGUSAABONO,                                                   ' +
   '           r.FLGPERMANENTE                                                  ' +
   '     from  RUBRICAINDIV  r,                                                 ' +
   '           PESSOA        p,                                                 ' +
   '           PESSOA        a                                                  ' +
   '    where  r.IDTITULAR      = ' + IntToStr( iIdPessoa )                       +
   '      and  r.IDFAVORECIDO   = ' + IntToStr( iIdFavorecido )                   +
   '      and  r.FLGPENSAOALIM  = 1                                             ' +
   '      and  r.FLGTPRUBMANUT  = ''1''                                         ' +
   '      and  ( r.FLGDESATIVADO  is null or r.FLGDESATIVADO = 0 )              ' +
   '      and  r.IDFAVORECIDO   = p.IDPESSOA                                    ' +
   '      and  r.IDALIMENTADO   = a.IDPESSOA (+)                                ' );
end;

function TCtrlWebConsignacao.SelecionaPagtoConsignacao( sAno : String; iIdFavorecido,
         iIdPessoa : integer ): OleVariant;
begin
  Result := GetDataPacket(
   '   select  h.MES,                                                           ' +
   '           substr( h.MES, 6, 2 ) || ''/'' || substr( h.MES, 1, 4 ) as MESF, ' +
   '           h.DATAPAGAMENTO,                                                 ' +
   '           h.VALORPROVENTO                                                  ' +
   '     from  RUBRICAINDIV  r,                                                 ' +
   '           HISTRUBSAL    h                                                  ' +
   '    where  r.IDTITULAR      = ' + IntToStr( iIdPessoa )                       +
   '      and  r.IDFAVORECIDO   = ' + IntToStr( iIdFavorecido )                   +
   '      and  substr( h.MES, 1, 4 ) = ' + QuotedStr( sAno )                      +
   '      and  r.FLGPENSAOALIM  = 1                                             ' +
   '      and  r.FLGTPRUBMANUT  = ''1''                                         ' +
   '      and  ( r.FLGDESATIVADO  is null or r.FLGDESATIVADO = 0 )              ' +
   '      and  r.IDTITULAR      = h.IDTITULAR                                   ' +
   '      and  r.IDPESSOA       = h.IDTITULAR                                   ' +
   '      and  r.IDFAVORECIDO   = h.IDFAVORECIDO                                ' +
   ' order by  h.MES                                                            ' );
end;

end.
