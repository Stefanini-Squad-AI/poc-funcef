unit uCtrlListTercContratos;

interface

uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     uCMClientDataSet,uCMTypes, uCtrlContaContabil;

type
   TCtrlListTercContratos = Class(TCmControlObject)

   private
      CtrlContaContabil: TCtrlContaContabil;
   public
      constructor Create; override;
      destructor Destroy; override;

      procedure OnCreateAppServer; override;

      function ListArtigoXProduto(sCodArtigo: String): OleVariant;
      //---------------------------------------------------------------------------------
      function ListTipoRD(rIDPessoa: Double; sRecPag, sAnaSint: String): OleVariant;
      //---------------------------------------------------------------------------------
      function ListSubConta(rIDPessoa, rPlano: Double;sPlaConta: String): OleVariant;
      //---------------------------------------------------------------------------------
   protected
      procedure DoChangeDataBase; override;
      procedure AfterInitialize; override;
   end;

implementation

{ TCtrlListTercContratos }

constructor TCtrlListTercContratos.Create;
begin
   inherited;
   CtrlContaContabil:=TCtrlContaContabil.Create;
end;

procedure TCtrlListTercContratos.OnCreateAppServer;
begin
   inherited;
end;

destructor TCtrlListTercContratos.Destroy;
begin
   CtrlContaContabil.Free;
   inherited;
end;

procedure TCtrlListTercContratos.AfterInitialize;
begin
   inherited;
   CtrlContaContabil.InitializeAs(Self);
end;

procedure TCtrlListTercContratos.DoChangeDataBase;
begin
   inherited;
end;

function TCtrlListTercContratos.ListArtigoXProduto(
  sCodArtigo: String): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT '+
         '   A.CODARTIGO, P.DESCPROD '+
         'FROM ARTIGO A, PRODUTO P '+
         'WHERE (A.CODPRODUTO=P.CODPRODUTO) ';
         if (Trim(sCodArtigo)<>'') then
            sSql:=sSql+'      AND (A.CODARTIGO = '''+sCodArtigo+''') ';

         sSql:=sSql+'ORDER BY P.DESCPROD ';
   Result:=GetDataPacket(sSql);
end;

function TCtrlListTercContratos.ListTipoRD(rIDPessoa: Double; sRecPag,
  sAnaSint: String): OleVariant;
var
   sSql    : String;
   sFiltro : String;
begin
   sSql:='SELECT CODTIPRECDES, DESCRICAO, RECPAG, PLACONTA '+
         'FROM TIPORECEBDESEMB ';

   sFiltro:='';
   if (rIDPessoa<>0) then
      sFiltro:='WHERE (IDPESSOA = '+FloatToStr(rIDPessoa)+') ';

   if (sRecPag<>'') then
      if (sFiltro='') then
         sFiltro:='WHERE (RECPAG = '''+sRecPag+''') '
      else
         sFiltro:=sFiltro+'AND (RECPAG = '''+sRecPag+''') ';

   if (sAnaSint<>'') then
      if (sFiltro='') then
         sFiltro:='WHERE (ANASINT = '''+sAnaSint+''') '
      else
         sFiltro:=sFiltro+'AND (ANASINT = '''+sAnaSint+''') ';

   sSql:=sSql+sFiltro+' ORDER BY DESCRICAO ';

   Result:=GetDataPacket(sSql);
end;

function TCtrlListTercContratos.ListSubConta(rIDPessoa, rPlano: Double;
  sPlaConta: String): OleVariant;
begin
   Result:=CtrlContaContabil.ListContasxSC(rPlano,rIDPessoa,0,sPlaConta,toNome);
end;

end.
 