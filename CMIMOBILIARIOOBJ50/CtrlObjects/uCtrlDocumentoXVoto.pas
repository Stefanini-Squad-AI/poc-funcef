{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Nº SIG......: 26054
Data........: 24/04/2017
Responsável.: Darivaldo Alencar
Descrição...: Criação desta CTRL
--------------------------------------------------------------------------------}

unit uCtrlDocumentoXVoto;

interface

uses
  uDbDocumentoXVoto, uCmControlObject, uCmDbObject, DB, Sysutils, uCMClientDataSet,
  uCMTypes,dBaseDados;

Type
  TCtrlDocumentoXVoto = class(TCmControlObject)
  private
    cdsTemp : TCMClientDataSet;
    DbDocumentoXVoto : TDbDocumentoXVoto;
  public
    Constructor Create;  Override;
    Destructor  Destroy; Override;
    Function Inserir(iIDVOTOGESTAOIMOVEL,iCODDOCUMENTO: Extended; bTransacao: Boolean): Boolean;
    Function getDocumento(iCODDOCUMENTO: Extended): OleVariant;
end;

implementation

{ TCtrlDocumentoXVoto }

constructor TCtrlDocumentoXVoto.Create;
begin
  inherited;
  DbDocumentoXVoto := TDbDocumentoXVoto.Create(Self);
  cdsTemp := TCMClientDataSet.Create(nil);
end;

destructor TCtrlDocumentoXVoto.Destroy;
begin
  FreeAndNil(DbDocumentoXVoto);
  FreeAndNil(cdsTemp);
  inherited;
end;


function TCtrlDocumentoXVoto.getDocumento(iCODDOCUMENTO: Extended): OleVariant;
var
  sSQL: String;
begin
    sSQL:=  'SELECT LD.NUMLANCTO,                               '+
            '       (SELECT NVL(MAX(IDDOCUMENTOXVOTO), 1) + 1   '+
            '          FROM DOCUMENTOXVOTO) as IDDOCUMENTOXVOTO '+
            '  FROM DOCUMENTO DOC                               '+
            ' INNER JOIN LANCTODOCUM LD                         '+
            '    ON DOC.CODDOCUMENTO = LD.CODDOCUMENTO          '+
            ' WHERE DOC.CODDOCUMENTO IN ('+FloatToStr(iCODDOCUMENTO)+')       ';
  Result := GetDataPacket(sSql);
end;

function TCtrlDocumentoXVoto.Inserir(iIDVOTOGESTAOIMOVEL, iCODDOCUMENTO: Extended; bTransacao: Boolean): Boolean;
begin
   try
     if not bTransacao then
        StartTransaction;

     cdsTemp.Data:= getDocumento(iCODDOCUMENTO);

     DbDocumentoXVoto.Clear;
     DbDocumentoXVoto.IdDocumentoXVoto.AsFloat  := cdsTemp.fieldbyname('IDDOCUMENTOXVOTO').AsFloat;
     DbDocumentoXVoto.IdVotoGestaoImovel.AsFloat:= iIDVOTOGESTAOIMOVEL;
     DbDocumentoXVoto.CodDocumento.AsFloat      := iCODDOCUMENTO;
     DbDocumentoXVoto.NumLancto.AsFloat         := cdsTemp.fieldbyname('NUMLANCTO').AsFloat;;

     if not DbDocumentoXVoto.Insert then
        raise exception.Create( DbDocumentoXVoto.MessageInfo );

     Commit;
   except
      on e : Exception do begin
         if bTransacao then Rollback;
         Result := False;
         MessageInfo := e.message;
      end;
   end;
end;

end.
