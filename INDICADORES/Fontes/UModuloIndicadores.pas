unit UModuloIndicadores;

interface

uses Dialogs, uMensErro, uCtrlParamIndicadores, dBaseDados, uMidasUtil, sysutils, extCtrls,
     uComunsImobiliario, uVerificaPreenchimento, uCtrlIndicador, uCmClientDataSet, uSistema;


type TModuloIndicadores = Class
   private
    FiIdIndABL: integer;
    FiMoeCodigoUPV: integer;
    FiIdIndAluguel: integer;
    FiIdIndVenda: Integer;
    FiIdIndNDMeses: Integer;
    FiIdIndNDAluguel: Integer;
    FiIdIndNDEncargos: Integer;
    FiIdIndNDFundo: Integer;
    FiIdIndNDLuva: Integer;
    FiIdIndNDTpProvidencia: Integer;
    FiIdIndNDDtProvidencia: Integer;
    FiIdIndAbDtVencto: integer;
    FiIdIndAbDtPagto: integer;
    FiIdIndAbVlrPagto: integer;
    FiIdIndAbVlrJuros: integer;
    FiIdIndAbVlrFaturado: integer;
    FiIdIndAbVlrCM: integer;
    FiIdGrpRegra: integer;
    CtrlParamIndicadores: TCtrlParamIndicadores;
    CtrlIndicador: TCtrlIndicador;
    FiIdIndOverage: integer;
    FiIdIndUHHotel: integer;
    FiIdIndUHAlugada: integer;
    FiIdIndUHDisponivel: integer;
    FbFlgLogoRelat: Boolean;
    FLogoTipo: TImage;
    FiIdIndVacancia: integer;


   public
     constructor Create;
     destructor  Destroy; override;

     property iMoeCodigoUPV:         integer read FiMoeCodigoUPV;
     property iIdGrpRegra:           integer read FiIdGrpRegra;
     property iIdIndABL:             integer read FiIdIndABL;
     property iIdIndAluguel:         integer read FiIdIndAluguel;
     property iIdIndVenda:           integer read FiIdIndVenda;
     property iIdIndOverage:         integer read FiIdIndOverage;
     property iIdIndNDMeses:         integer read FiIdIndNDMeses;
     property iIdIndNDAluguel:       integer read FiIdIndNDAluguel;
     property iIdIndNDEncargos:      integer read FiIdIndNDEncargos;
     property iIdIndNDFundo:         integer read FiIdIndNDFundo;
     property iIdIndNDLuva:          integer read FiIdIndNDLuva;
     property iIdIndNDTpProvidencia: integer read FiIdIndNDTpProvidencia;
     property iIdIndNDDtProvidencia: integer read FiIdIndNDDtProvidencia;
     property iIdIndAbDtVencto:      integer read FiIdIndAbDtVencto;
     property iIdIndAbDtPagto:       integer read FiIdIndAbDtPagto;
     property iIdIndAbVlrFaturado:   integer read FiIdIndAbVlrFaturado;
     property iIdIndAbVlrCM:         integer read FiIdIndAbVlrCM;
     property iIdIndAbVlrJuros:      integer read FiIdIndAbVlrJuros;
     property iIdIndAbVlrPagto:      integer read FiIdIndAbVlrPagto;
     property iIdIndUHHotel:         integer read FiIdIndUHHotel;
     property iIdIndUHAlugada:       integer read FiIdIndUHAlugada;
     property iIdIndUHDisponivel:    integer read FiIdIndUHDisponivel;
     property iIdIndVacancia:        integer read FiIdIndVacancia;
     property bFlgLogoRelat:         Boolean read FbFlgLogoRelat;
     property LogoTipo:              TImage  read FLogoTipo;


     procedure GetParam(const iIdPessoa: integer);
     procedure ZeraParam;
   end;

var ModuloIndicadores : TModuloIndicadores;

implementation

{ TModuloIndicadores }

constructor TModuloIndicadores.Create;
begin
  inherited;
  CtrlParamIndicadores := TCtrlParamIndicadores.Create;
  CtrlIndicador        := TCtrlIndicador.Create;
  CtrlParamIndicadores.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                            ComunsImobiliario.MensErroMT);
  CtrlIndicador.InitializeAs(CtrlParamIndicadores);

  FLogoTipo := TImage.Create(nil); 
end;

destructor TModuloIndicadores.Destroy;
begin
  CtrlParamIndicadores.Free;
  CtrlIndicador.Free;
  FreeAndNil(FLogoTipo);   
  inherited;
end;


procedure TModuloIndicadores.ZeraParam;
begin
  FiIdIndABL             := -1;
  FiIdIndAluguel         := -1;
  FiIdIndVenda           := -1;
  FiIdIndOverage         := -1;
  FiMoeCodigoUPV         := -1;
  FiIdIndNDMeses         := -1;
  FiIdIndNDAluguel       := -1;
  FiIdIndNDEncargos      := -1;
  FiIdIndNDLuva          := -1;
  FiIdIndNDFundo         := -1;
  FiIdIndNDTpProvidencia := -1;
  FiIdIndNDDtProvidencia := -1;
  FiIdIndAbDtVencto      := -1;
  FiIdIndAbDtPagto       := -1;
  FiIdIndAbVlrPagto      := -1;
  FiIdIndAbVlrJuros      := -1;
  FiIdIndAbVlrFaturado   := -1;
  FiIdIndAbVlrCM         := -1;
  FiIdIndUHHotel         := -1;
  FiIdIndUHAlugada       := -1;
  FiIdIndUHDisponivel    := -1;
  FiIdIndVacancia        := -1;
  FbFlgLogoRelat         := False;
end;


procedure TModuloIndicadores.GetParam(const iIdPessoa: integer);
var Cds: TCMClientDataSet;
    i  : Integer;
begin
  i   := 0;
  cds := nil;
  ZeraParam;
  try
    Cds := TCMClientDataSet.Create(nil);
    Cds.Data := CtrlParamIndicadores.SelecionaParamIndicadores(iIdPessoa);
    FiMoeCodigoUPV := Cds.FieldByName('MOECODIGOUPV').AsInteger;
    FiIdGrpRegra   := Cds.FieldByName('IDGRUPOREGRA').AsInteger;
    if Cds.FieldByName('FLGLOGORELAT').AsString = 'S' then FbFlgLogoRelat := True;

    for i := 1 to 23 do begin
      Cds.Data := CtrlIndicador.LookupIndicador(-1,'',-1,i);
      if not cds.IsEmpty then begin
        case i of
          1  : FiIdIndABL             := Cds.FieldByName('IDINDICADOR').AsInteger;
          2  : FiIdIndAluguel         := Cds.FieldByName('IDINDICADOR').AsInteger;
          3  : FiIdIndVenda           := Cds.FieldByName('IDINDICADOR').AsInteger;
          4  : FiIdIndNDMeses         := Cds.FieldByName('IDINDICADOR').AsInteger;
          5  : FiIdIndNDAluguel       := Cds.FieldByName('IDINDICADOR').AsInteger;
          6  : FiIdIndNDEncargos      := Cds.FieldByName('IDINDICADOR').AsInteger;
          7  : FiIdIndNDFundo         := Cds.FieldByName('IDINDICADOR').AsInteger;
          8  : FiIdIndNDLuva          := Cds.FieldByName('IDINDICADOR').AsInteger;
          9  : FiIdIndNDTpProvidencia := Cds.FieldByName('IDINDICADOR').AsInteger;
          10 : FiIdIndNDDtProvidencia := Cds.FieldByName('IDINDICADOR').AsInteger;
          11 : FiIdIndAbDtVencto      := Cds.FieldByName('IDINDICADOR').AsInteger;
          12 : FiIdIndAbDtPagto       := Cds.FieldByName('IDINDICADOR').AsInteger;
          13 : FiIdIndAbVlrFaturado   := Cds.FieldByName('IDINDICADOR').AsInteger;
          14 : FiIdIndAbVlrCM         := Cds.FieldByName('IDINDICADOR').AsInteger;
          15 : FiIdIndAbVlrJuros      := Cds.FieldByName('IDINDICADOR').AsInteger;
          16 : FiIdIndAbVlrPagto      := Cds.FieldByName('IDINDICADOR').AsInteger;
          17 : FiIdIndOverage         := Cds.FieldByName('IDINDICADOR').AsInteger;
          18 : FiIdIndUHHotel         := Cds.FieldByName('IDINDICADOR').AsInteger;
          19 : FiIdIndUHAlugada       := Cds.FieldByName('IDINDICADOR').AsInteger;
          20 : FiIdIndUHDisponivel    := Cds.FieldByName('IDINDICADOR').AsInteger;

          23 : FiIdIndVacancia        := Cds.FieldByName('IDINDICADOR').AsInteger;
        end;
      end;
    end;

    // Carrega o Logotipo da Empresa
    cds.Data := CtrlIndicador.GetDataPacket('SELECT IMAGEM ' +#13+
                                            '  FROM IMAGENS I, PESSOA P ' +#13+
                                            ' WHERE I.IDIMAGEM = P.IDIMAGEM ' +#13+
                                            '   AND P.IDPESSOA = ' + IntToStr(iIdPessoa) );
    if not cds.IsEmpty then
      if not cds.FieldByName('IMAGEM').IsNull then begin
         fLogoTipo.Picture.Assign(cds.FieldByName('IMAGEM'));
      end;
  finally
    Cds.Free;
  end;
end;


end.
