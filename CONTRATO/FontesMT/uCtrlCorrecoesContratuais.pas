unit uCtrlCorrecoesContratuais;

interface

uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     uCMClientDataSet {$IFNDEF VERSAO0505} ,uCMTypes {$ENDIF};

type
   TCtrlCorrecoesContratuais = Class(TCmControlObject)

   private
   public
      constructor Create; override;
      destructor Destroy; override;

      function ListProdServXItem(rIDContrato: Double): OleVariant;
      function ListCorrecoes(rIDContrato: Double): OleVariant;
      function VerifAbrangTodoContrato(rIDContrato: Double): Boolean;

      procedure OnCreateAppServer; override;
   protected
      procedure DoChangeDataBase; override;
   end;

implementation

{ TCtrlCorrecoesContratuais }

constructor TCtrlCorrecoesContratuais.Create;
begin
  inherited;

end;

destructor TCtrlCorrecoesContratuais.Destroy;
begin
  inherited;

end;

procedure TCtrlCorrecoesContratuais.OnCreateAppServer;
begin
  inherited;

end;

procedure TCtrlCorrecoesContratuais.DoChangeDataBase;
begin
  inherited;

end;

function TCtrlCorrecoesContratuais.ListProdServXItem(
  rIDContrato: Double): OleVariant;
begin
   Result:=GetDataPacket('SELECT '+
                         '   OXI.IDCONTRATO, '+
                         '   O.IDOBJETO, '+
                         '   I.IDITEM, '+
                         '   (Substr(O.NOMEOBJETO,1,40) || '' x '' || '+
                         '    SubStr(I.NOME_ITEM,1,40)) AS NOME '+
                         'FROM '+
                         '   OBJETOSXITEMCONTR OXI, '+
                         '   OBJETOCONTRATUAL O, '+
                         '   ITEMCONTRATUAL I '+
                         'WHERE '+
                         '   (OXI.IDCONTRATO = '+FloatToStr(rIDContrato)+') AND '+
                         '   (OXI.IDOBJETO = O.IDOBJETO) AND '+
                         '	  (OXI.IDITEM = I.IDITEM) '+
                         'ORDER BY NOME, OXI.IDCONTRATO');
end;

function TCtrlCorrecoesContratuais.ListCorrecoes(
  rIDContrato: Double): OleVariant;
begin
   Result:=GetDataPacket('SELECT * '+
                         'FROM CORRECAOCONTR '+
                         'WHERE (IDCONTRATO = '+FloatToStr(rIDContrato)+') ');
end;

function TCtrlCorrecoesContratuais.VerifAbrangTodoContrato(
  rIDContrato: Double): Boolean;
var
   cdsAux: TCMClientDataSet;
begin
    Result:=False;
   with cdsAux.Create(nil) do
   try
      Data:=GetDataPacket('SELECT * '+
                          'FROM CORRECAOCONTR '+
                          'WHERE (IDCONTRATO = '+FloatToStr(rIDContrato)+') AND '+
                          '      (FLGABRANGENCIA = ''C'') ');
      Result:=(RecordCount<>0);
   finally
      Free;
   end;
end;


end.
 