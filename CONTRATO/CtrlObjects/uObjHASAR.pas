unit uObjHASAR;

interface

uses comctrls, Forms, Windows, Messages, SysUtils, Classes, ComObj ;

type

  TImpressao=class(TObject)
  private
    FPorta: integer;
    FFiscal: OleVariant;
    function GetCabecalho(Index: Integer): String;
    procedure SetCabecalho(Index: Integer; const Value: String);
    function GetRodape(Index: Integer): String;
    procedure SetRodape(Index: Integer; const Value: String);
  public
    constructor Create(APorta: integer);
    destructor Destroy; override;
    function Inicializar: boolean;
    function Conectar(iModelo : Integer): boolean;
    function GetNumFatura(iTipoDoc: Integer): Integer;
    procedure Finalizar;
    procedure AbrirComprovanteFiscal(ATipo: integer);
    procedure FecharComprovanteFiscal;
    procedure ImprimirItem(ADescricao: string; AQuantidade: integer; AValor, AValorImposto: Real);
    function  UltimoNumeroNotaFiscalA: integer;
    function  UltimoNumeroNotaFiscalB: integer;
    procedure DadosCliente(ANome, ANumDocumento: string; ATipoDocumento, AResponsabilidade: integer;
                           AEndereco: String);
    procedure SubTotal(bImprime: Boolean);
    property Cabecalho[Index : Integer]: String read GetCabecalho write SetCabecalho;
    property Rodape[Index : Integer]: String read GetRodape write SetRodape;
  end;

const
      // Tipos de documentos fiscais
   	TICKET_C			         	   = 84;
      TICKET_FACTURA_A         	   = 65;
      TICKET_FACTURA_B         	   = 66;
      FACTURA_A		         	   = 48;
      FACTURA_B		         	   = 49;
      RECIBO_A	   	         	   = 97;
      RECIBO_B			         	   = 98;
      NOTA_DEBITO_A	         	   = 68;
      NOTA_DEBITO_B 	         	   = 69;

      // Tipos de documentos de clientes
      TIPO_CUIT 			         	= 67; // CGC
      TIPO_LE 				         	= 48;
      TIPO_LC 				         	= 49;
      TIPO_DNI 			         	= 50;
      TIPO_PASAPORTE 	         	= 51; // Passaporte
      TIPO_CI 				         	= 52; // Identidade?
      TIPO_NINGUNO 		         	= 32; // Nenhum

      // Resposabilidade de clientes
      RESPONSABLE_INSCRIPTO 		   = 73;
      RESPONSABLE_NO_INSCRIPTO 	   = 78;
      RESPONSABLE_EXENTO 		  	   = 69;
      NO_RESPONSABLE 			  	   = 65;
      CONSUMIDOR_FINAL 			      = 67;
      BIENES_DE_USO 					   = 66;
      MONOTRIBUTO 					   = 77;
      NO_CATEGORIZADO 				   = 84;

      // Modelos de impressora
      MODELO_614 						   = 1;
      MODELO_615 							= 2;
      MODELO_PR4 							= 3;
      MODELO_950 							= 4;
      MODELO_951 							= 5;
      MODELO_262 							= 6;
      MODELO_PJ20							= 7;
      MODELO_P320							= 8;

implementation

constructor TImpressao.Create(APorta: integer);
begin
  FPorta := APorta;
  FFiscal := CreateOleObject('HASAR.Fiscal.1');
end;

destructor TImpressao.Destroy;
begin
  FFiscal := Null;
  inherited;
end;

function TImpressao.Conectar(iModelo : Integer): boolean;
begin
	Result := true;
  try
    FFiscal.Modelo := iModelo; //MODELO_P320;
    FFiscal.Puerto := FPorta;
  except
    Result := false;
  end;
end;

function TImpressao.Inicializar: boolean;
begin
  result := true;
  try
    FFiscal.Comenzar;
    FFiscal.TratarDeCancelarTodo;
  except
    result := false;
  end;
end;

procedure TImpressao.AbrirComprovanteFiscal(ATipo: integer);
begin
  FFiscal.AbrirComprobanteFiscal(ATipo);
end;

procedure TImpressao.FecharComprovanteFiscal;
begin
  FFiscal.CerrarComprobanteFiscal;
end;

function TImpressao.UltimoNumeroNotaFiscalA: integer;
begin
  Result := FFiscal.UltimaFactura;
end;

function TImpressao.UltimoNumeroNotaFiscalB: integer;
begin
  Result := FFiscal.UltimoTicket;
end;

procedure TImpressao.DadosCliente(ANome, ANumDocumento: string; ATipoDocumento,
                                  AResponsabilidade: integer; AEndereco: String);
begin
  FFiscal.DatosCliente(ANome, ANumDocumento, ATipoDocumento, AResponsabilidade, AEndereco);
end;

procedure TImpressao.Finalizar;
begin
  FFiscal.Finalizar;
end;

procedure TImpressao.ImprimirItem(ADescricao: string; AQuantidade: integer; AValor, AValorImposto: Real);
begin
	FFiscal.ImprimirItem(ADescricao, AQuantidade, AValor, AValorImposto, 0);
end;

function TImpressao.GetCabecalho(Index: Integer): String;
begin
   Result:='';
   if (Index>=0) and (Index<=1) then Result:=FFiscal.Encabezado(Index+4);
end;

procedure TImpressao.SetCabecalho(Index: Integer; const Value: String);
begin
   FFiscal.Encabezado(Index+4):=Value;
end;

function TImpressao.GetRodape(Index: Integer): String;
begin
   Result:='';
   if (Index>=0) and (Index<=1) then Result:=FFiscal.Encabezado(Index+11);
end;

procedure TImpressao.SetRodape(Index: Integer; const Value: String);
begin
   FFiscal.Encabezado(Index+11):=Value;
end;

function TImpressao.GetNumFatura(iTipoDoc: Integer): Integer;
var
   iNumFat   : Integer;
   sResposta : String;
begin
   FFiscal.Enviar('*');
   sResposta:=FFiscal.Recibir;
   Result:=0;

   if (iTipoDoc=FACTURA_A) then result:=StrToIntDef(Trim(Copy(sResposta, 25, 8)),0);
   if (iTipoDoc=FACTURA_B) then result:=StrToIntDef(Trim(Copy(sResposta, 11, 8)),0);
end;

procedure TImpressao.SubTotal(bImprime: Boolean);
begin
   FFiscal.SubTotal(bImprime);
end;

end.
