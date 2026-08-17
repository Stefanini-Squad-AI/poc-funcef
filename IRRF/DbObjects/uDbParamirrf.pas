unit uDbParamirrf;

// Alterações:
{********************************************************************************
Analista.: Arnaldo V. Scarin
Data.....: 18/09/2009
Kintana..: 591283
Sol......: 121847
Descrição: Saldo de contribuição 13º: Caso permaneça o valor negativo, depois de
           percorrido os meses referentes ao 13º salário, lançar o saldo como
           rendimento 13º salário.
********************************************************************************}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 21/03/2007
Autor     : André Pontes
Pendencia : 22699 (?)
Descrição : Criado novo campo: CodigoGPS, representando o código a ser utilizado em caso de não
            parametrização do CodigoGPS na TipoAgre ou no caso de alteradores manuais, que não têm
            CodigoGPS.
----------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 21/03/2007
Autor     : André Pontes
Pendencia : 24513
Descrição : Criado novo campo: CCustoBuscaCaP, representando Centro de Custo único para geração de
            documentos de recolhimento de impostos. Esse centro de custo será gravado na LancIRRF
            no momento da busca de impostos de Contas a Pagar.
---------------------------------------------------------------------------------------------------}

interface

uses
  uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

type
  TDbParamirrf = class(TCmDbObject)

  private
    FCodtipdoc            : TCmDbField;
    FRecpag               : TCmDbField;
    FCodaltinss           : TCmDbField;
    FCodaltirrfcar        : TCmDbField;
    FVlrdependente        : TCmDbField;
    FCodcentrorespon      : TCmDbField;
    FVlridosos            : TCmDbField;
    FCodaltirrfcap        : TCmDbField;
    FIdpessoa             : TCmDbField;
    FPercirrfexterior     : TCmDbField;
    FCodaltjuros          : TCmDbField;
    FCodaltmulta          : TCmDbField;
    FUnidnegoc            : TCmDbField;
    FCodtiprecdes         : TCmDbField;
    FCodaltcomissao       : TCmDbField;
    FIdforcli             : TCmDbField;
    FFlgpaglanc           : TCmDbField;
    FIdadeidoso           : TCmDbField;
    FCodaltdesconto       : TcmDbField;
    FMoecodigo            : TCmDbField; 
    FCodtipcustagreg      : TCmDbField; 
    FFlgbuscaiof          : TCmDbField; 
    FIdinforme65anos      : TCmDbField; 
    FIdinformemolestia    : TCmDbField; 
    FCodcentrocustoiof    : TCmDbField;
    FIdinforme65inss      : TcmdbField; 
    FIdinformemolinss     : TcmdbField; 
    FCodirrfdarfiof       : TcmdbField;
    FIdinformerendbrut    : TcmdbField; 
    FIdinformeirretido    : TcmdbField;
    FFlgdocdarfirjud      : TCmDbField;
    FIdinformevlrbase     : TCmDbField;
    FIdinformevlrinss     : TCmDbField;
    FIdinformeacjud       : TCmDbField;
    FIdinforme65inss13    : TCmDbField;
    FIdinformeacjud13     : TCmDbField;
    FIdinforme65anos13    : TCmDbField;
    FFlgtipogeradarf      : TCmDbField;
    FCodigogps            : TCmDbField;
    FCcustobuscacap       : TCmDbField;
    FFlgUsaManual         : TCmDbField;
    FNumDiasAvisoDarf     : TCmDbField;
    FIdInfRendCompNeg     : TCmDbField;
    FidExigibilidadeSuspensa : TCmDbField;
    FIdRegraInss             : TCmDbField;
    FIdAcaoJudicialInss13    : TCmDbField;
    FIdAcaoJudicialInss      : TCmDbField;
    FIdInfRendCompNegIsento  : TCmDbField;
    FIdInfRendCompNeg13s: TCmDbField;

    procedure SetCodaltcomissao(const Value: TCmDbField);
    procedure SetCodaltinss(const Value: TCmDbField);
    procedure SetCodaltirrfcap(const Value: TCmDbField);
    procedure SetCodaltirrfcar(const Value: TCmDbField);
    procedure SetCodaltjuros(const Value: TCmDbField);
    procedure SetCodaltmulta(const Value: TCmDbField);
    procedure SetCodcentrorespon(const Value: TCmDbField);
    procedure SetCodtipdoc(const Value: TCmDbField);
    procedure SetCodtiprecdes(const Value: TCmDbField);
    procedure SetFlgpaglanc(const Value: TCmDbField);
    procedure SetIdadeidoso(const Value: TCmDbField);
    procedure SetIdforcli(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetPercirrfexterior(const Value: TCmDbField);
    procedure SetRecpag(const Value: TCmDbField);
    procedure SetUnidnegoc(const Value: TCmDbField);
    procedure SetVlrdependente(const Value: TCmDbField);
    procedure SetVlridosos(const Value: TCmDbField);
    procedure SetCodaltdesconto(const Value: TcmDbField);
    procedure SetMoecodigo(const Value: TCmDbField);            
    procedure SetCodtipcustagreg(const Value: TCmDbField);      
    procedure SetFlgbuscaiof(const Value: TCmDbField);          
    procedure SetIdinforme65anos(const Value: TCmDbField);      
    procedure SetIdinformemolestia(const Value: TCmDbField);    
    procedure SetIdinforme65inss(const Value: TCmDbField);      
    procedure SetIdinformemolinss(const Value: TCmDbField);     
    procedure SetCodirrfdarfiof(const Value: TCmDbField);       
    procedure SetCodcentrocustoiof(const Value : TCmDbField);
    procedure SetFlgdocdarfirjud(const Value: TCmDbField);
    procedure SetIdinformevlrbase(const Value: TCmDbField);
    procedure SetIdinformevlrinss(const Value: TCmDbField);
    procedure SetIdinforme65anos13(const Value: TCmDbField);
    procedure SetIdinforme65inss13(const Value: TCmDbField);
    procedure SetIdinformeacjud(const Value: TCmDbField);
    procedure SetIdinformeacjud13(const Value: TCmDbField);

    procedure SetFlgtipogeradarf(const Value: TCmDbField);      
    procedure SetCodigogps(const Value: TCmDbField);            
    procedure SetCcustobuscacap(const Value: TCmDbField);       
    procedure SetFlgUsaManual(const Value: TCmDbField);
    procedure SetNumDiasAvisoDarf(const Value: TCmDbField);
    procedure SetIdInfRendCompNeg(const Value: TCmDbField);
    procedure SetIdAcaoJudicialInss(const Value: TCmDbField);
    procedure SetIdAcaoJudicialInss13(const Value: TCmDbField);
    procedure SetidExigibilidadeSuspensa(const Value: TCmDbField);
    procedure SetIdRegraInss(const Value: TCmDbField);
    procedure SetIdInfRendCompNegIsento(const Value: TCmDbField);
    procedure SetIdInfRendCompNeg13s(const Value: TCmDbField);


  public

     property Vlridosos:            TCmDbField  read FVlridosos           write SetVlridosos;
     property Vlrdependente:        TCmDbField  read FVlrdependente       write SetVlrdependente;
     property Unidnegoc:            TCmDbField  read FUnidnegoc           write SetUnidnegoc;
     property Recpag:               TCmDbField  read FRecpag              write SetRecpag;
     property Percirrfexterior:     TCmDbField  read FPercirrfexterior    write SetPercirrfexterior;
     property Idpessoa:             TCmDbField  read FIdpessoa            write SetIdpessoa;
     property Idforcli:             TCmDbField  read FIdforcli            write SetIdforcli;
     property Idadeidoso:           TCmDbField  read FIdadeidoso          write SetIdadeidoso;
     property Flgpaglanc:           TCmDbField  read FFlgpaglanc          write SetFlgpaglanc;
     property Codtiprecdes:         TCmDbField  read FCodtiprecdes        write SetCodtiprecdes;
     property Codtipdoc:            TCmDbField  read FCodtipdoc           write SetCodtipdoc;
     property Codcentrorespon:      TCmDbField  read FCodcentrorespon     write SetCodcentrorespon;
     property Codaltmulta:          TCmDbField  read FCodaltmulta         write SetCodaltmulta;
     property Codaltjuros:          TCmDbField  read FCodaltjuros         write SetCodaltjuros;
     property Codaltirrfcar:        TCmDbField  read FCodaltirrfcar       write SetCodaltirrfcar;
     property Codaltirrfcap:        TCmDbField  read FCodaltirrfcap       write SetCodaltirrfcap;
     property Codaltinss:           TCmDbField  read FCodaltinss          write SetCodaltinss;
     property Codaltcomissao:       TCmDbField  read FCodaltcomissao      write SetCodaltcomissao;
     property Codaltdesconto :      TcmDbField  read FCodaltdesconto      write SetCodaltdesconto;
     property Idinformevlrbase:     TCmDbField  read FIdinformevlrbase    write SetIdinformevlrbase;  
     property Idinformevlrinss:     TCmDbField  read FIdinformevlrinss    write SetIdinformevlrinss;
     property Moecodigo:            TCmDbField  read FMoecodigo           write SetMoecodigo;         
     property Codtipcustagreg:      TCmDbField  read FCodtipcustagreg     write SetCodtipcustagreg;   
     property Flgbuscaiof:          TCmDbField  read FFlgbuscaiof         write SetFlgbuscaiof;       
     property Idinforme65anos:      TCmDbField  read FIdinforme65anos     write SetIdinforme65anos;   
     property Idinformemolestia:    TCmDbField  read FIdinformemolestia   write SetIdinformemolestia; 
     property Codirrfdarfiof:       TCmDbField  read FCodirrfdarfiof      write SetCodirrfdarfiof;    
     property Idinforme65inss:      TCmDbField  read FIdinforme65inss     write SetIdinforme65inss;   
     property Idinformemolinss:     TCmDbField  read FIdinformemolinss    write SetIdinformemolinss;  
     property Idinforme65inss13:    TCmDbField  read FIdinforme65inss13   write SetIdinforme65inss13; 
     property Idinforme65anos13:    TCmDbField  read FIdinforme65anos13   write SetIdinforme65anos13; 
     property Idinformeacjud:       TCmDbField  read FIdinformeacjud      write SetIdinformeacjud;    
     property Idinformeacjud13:     TCmDbField  read FIdinformeacjud13    write SetIdinformeacjud13;  
     property Idinformerendbrut:    TcmdbField  read FIdinformerendbrut   write FIdinformerendbrut;   
     property Idinformeirretido:    TcmdbField  read FIdinformeirretido   write FIdinformeirretido;
     property Codcentrocustoiof:    TCmDbField  read FCodcentrocustoiof   write SetCodcentrocustoiof;
     property Flgdocdarfirjud:      TCmDbField  read FFlgdocdarfirjud     write SetFlgdocdarfirjud;   
     property Flgtipogeradarf:      TCmDbField  read FFlgtipogeradarf     write SetFlgtipogeradarf;   
     property Codigogps:            TCmDbField  read FCodigogps           write SetCodigogps;         
     property Ccustobuscacap:       TCmDbField  read FCcustobuscacap      write SetCcustobuscacap;    
     property FlgUsaManual:         TCmDbField  read FFlgUsaManual        write SetFlgUsaManual;
     property NumDiasAvisoDarf:     TCmDbField  read FNumDiasAvisoDarf    write SetNumDiasAvisoDarf;
     property idExigibilidadeSuspensa: TCmDbField  read FidExigibilidadeSuspensa write SetidExigibilidadeSuspensa;
     property IdAcaoJudicialInss:      TCmDbField  read FIdAcaoJudicialInss      write SetIdAcaoJudicialInss;
     property IdAcaoJudicialInss13:    TCmDbField  read FIdAcaoJudicialInss13    write SetIdAcaoJudicialInss13;
     property IdRegraInss:             TCmDbField  read FIdRegraInss             write SetIdRegraInss;
     property IdInfRendCompNeg:     TCmDbField  read FIdInfRendCompNeg    write SetIdInfRendCompNeg;
     property IdInfRendCompNegIsento:  TCmDbField  read FIdInfRendCompNegIsento  write SetIdInfRendCompNegIsento;
     property IdInfRendCompNeg13s : TCmDbField read FIdInfRendCompNeg13s write SetIdInfRendCompNeg13s;
     constructor Create(Aowner: TCmCustomCdbObject); override;

     function Insert: Boolean; override;
     function LoadFromDb: Boolean; override;

  end;



implementation
{ TDbParamirrf }



constructor TDbParamirrf.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;

  ErrorIfNoRowsAffected := False;

  TableName := 'PARAMIRRF';

  //                                                                     |Required |Key    |Readonly |NullIfZero
  //                                                        -----------------------------------------------------
  FIdpessoa           := CreateCmDbField('IDPESSOA',          ftFloat,    True,     True,   False,    True, '');
  FVlridosos          := CreateCmDbField('VLRIDOSOS',         ftFloat,    False,    False,  False,    True, '');
  FVlrdependente      := CreateCmDbField('VLRDEPENDENTE',     ftFloat,    False,    False,  False,    True, '');
  FUnidnegoc          := CreateCmDbField('UNIDNEGOC',         ftFloat,    False,    False,  False,    True, '');
  FRecpag             := CreateCmDbField('RECPAG',            ftString,   False,    False,  False,    True, '');
  FPercirrfexterior   := CreateCmDbField('PERCIRRFEXTERIOR',  ftFloat,    False,    False,  False,    True, '');
  FIdforcli           := CreateCmDbField('IDFORCLI',          ftFloat,    False,    False,  False,    True, '');
  FIdadeidoso         := CreateCmDbField('IDADEIDOSO',        ftFloat,    False,    False,  False,    True, '');
  FFlgpaglanc         := CreateCmDbField('FLGPAGLANC',        ftString,   False,    False,  False,    True, '');
  FCodtiprecdes       := CreateCmDbField('CODTIPRECDES',      ftString,   False,    False,  False,    True, '');
  FCodtipdoc          := CreateCmDbField('CODTIPDOC',         ftFloat,    False,    False,  False,    True, '');
  FCodcentrorespon    := CreateCmDbField('CODCENTRORESPON',   ftString,   False,    False,  False,    True, '');
  FCodaltmulta        := CreateCmDbField('CODALTMULTA',       ftFloat,    False,    False,  False,    True, '');
  FCodaltjuros        := CreateCmDbField('CODALTJUROS',       ftFloat,    False,    False,  False,    True, '');
  FCodaltirrfcar      := CreateCmDbField('CODALTIRRFCAR',     ftFloat,    False,    False,  False,    True, '');
  FCodaltirrfcap      := CreateCmDbField('CODALTIRRFCAP',     ftFloat,    False,    False,  False,    True, '');
  FCodaltinss         := CreateCmDbField('CODALTINSS',        ftFloat,    False,    False,  False,    True, '');
  FCodaltcomissao     := CreateCmDbField('CODALTCOMISSAO',    ftFloat,    False,    False,  False,    True, '');
  FCodaltdesconto     := CreateCmDbField('CODALTDESCONTO',    ftFloat,    False,    False,  False,    True, '');
  FMoecodigo          := CreateCmDbField('MOECODIGO',         ftFloat,    False,    False,  False,    True, '');  
  FCodtipcustagreg    := CreateCmDbField('CODTIPOCUSTAGREG',  ftFloat,    False,    False,  False,    True, '');  
  FFlgbuscaiof        := CreateCmDbField('FLGBUSCAIOF',       ftInteger,  False,    False,  False,    True, '');  
  FIdinforme65anos    := CreateCmDbField('IDINFORME65ANOS',   ftFloat,    False,    False,  False,    True, '');  
  FIdinformemolestia  := CreateCmDbField('IDINFORMEMOLESTIA', ftFloat,    False,    False,  False,    True, '');  
  FCodirrfdarfiof     := CreateCmDbField('CODIRRFDARFIOF',    ftString,   False,    False,  False,    True, '');
  FIdinformerendbrut  := CreateCmDbField('IDINFORMERENDBRUT', ftFloat,    False,    False,  False,    True, '');  
  FIdinformeirretido  := CreateCmDbField('IDINFORMEIRRETIDO', ftFloat,    False,    False,  False,    True, '');  
  FIdinforme65inss    := CreateCmDbField('IDINFORME65INSS',   ftFloat,    False,    False,  False,    True, '');  
  FIdinformemolinss   := CreateCmDbField('IDINFORMEMOLINSS',  ftFloat,    False,    False,  False,    True, '');  
  FCodcentrocustoiof  := CreateCmDbField('CODCENTROCUSTOIOF', ftString,   False,    False,  False,    True, '');
  Flgdocdarfirjud     := CreateCmDbField('FLGDOCDARFIRJUD',   ftInteger,  False,    False,  False,    True, '');  
  FIdinformevlrbase   := CreateCmDbField('IDINFORMEVLRBASE',  ftFloat,    False,    False,  False,    True, '');
  FIdinformevlrinss   := CreateCmDbField('IDINFORMEVLRINSS',  ftFloat,    False,    False,  False,    True, '');
  FIdinforme65inss13  := CreateCmDbField('IDINFORME65INSS13', ftFloat,    False,    False,  False,    True, '');  
  FIdinforme65anos13  := CreateCmDbField('IDINFORME65ANOS13', ftFloat,    False,    False,  False,    True, '');  
  FIdinformeacjud     := CreateCmDbField('IDINFORMEACJUD',    ftFloat,    False,    False,  False,    True, '');  
  FIdinformeacjud13   := CreateCmDbField('IDINFORMEACJUD13',  ftFloat,    False,    False,  False,    True, '');
  FFlgtipogeradarf    := CreateCmDbField('FLGTIPOGERADARF',   ftFloat,    False,    False,  False,    True, '');
  FCodigogps          := CreateCmDbField('CODIGOGPS',         ftFloat,    False,    False,  False,    True, '');
  FCcustobuscacap     := CreateCmDbField('CCUSTOBUSCACAP',    ftString,   False,    False,  False,    True, '');
  FFlgUsaManual       := CreateCmDbField('FLGUSAMANUAL',      ftString,   False,    False,  False,    True, '');
  FNumDiasAvisoDarf   := CreateCmDbField('NUMDIASAVISODARF',  ftString,   False,    False,  False,    True, '');
  FidExigibilidadeSuspensa := CreateCmDbField('idExigibilidadeSuspensa',ftFloat,    False,    False,  False,    True, '');
  FIdRegraInss             := CreateCmDbField('IdRegraInss',            ftFloat,    False,    False,  False,    True, '');
  FIdAcaoJudicialInss13    := CreateCmDbField('IdAcaoJudicialInss13',   ftFloat,    False,    False,  False,    True, '');
  FIdAcaoJudicialInss      := CreateCmDbField('IdAcaoJudicialInss',     ftFloat,    False,    False,  False,    True, '');
  FIdInfRendCompNeg   := CreateCmDbField('IDINFRENDCOMPNEG',  ftFloat,    False,    False,  False,    True, '');
  FIdInfRendCompNegIsento  := CreateCmDbField('IDINFRENDCOMPNEGISENTO',  ftFloat,    False,    False,  False,    True, '');
  FIdInfRendCompNeg13s     := CreateCmDbField('IDINFRENDCOMPNEG13S',    ftFloat,    False,    False,  False,    True, '');
end;



function TDbParamirrf.Insert: Boolean;
begin
  Result := inherited Insert;
end;



function TDbParamirrf.LoadFromDB: Boolean;
begin
  Result := Inherited LoadFromDB;
end;


// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------

procedure TDbParamirrf.SetCodaltcomissao(const Value: TCmDbField);
begin
  FCodaltcomissao := Value;
end;

procedure TDbParamirrf.SetCodaltdesconto(const Value: TcmDbField);
begin
  FCodaltdesconto := Value;
end;

procedure TDbParamirrf.SetCodaltinss(const Value: TCmDbField);
begin
  FCodaltinss := Value;
end;

procedure TDbParamirrf.SetCodaltirrfcap(const Value: TCmDbField);
begin
  FCodaltirrfcap := Value;
end;

procedure TDbParamirrf.SetCodaltirrfcar(const Value: TCmDbField);
begin
  FCodaltirrfcar := Value;
end;

procedure TDbParamirrf.SetCodaltjuros(const Value: TCmDbField);
begin
  FCodaltjuros := Value;
end;

procedure TDbParamirrf.SetCodaltmulta(const Value: TCmDbField);
begin
  FCodaltmulta := Value;
end;

procedure TDbParamirrf.SetCodcentrorespon(const Value: TCmDbField);
begin
  FCodcentrorespon := Value;
end;


procedure TDbParamirrf.SetCodtipcustagreg(const Value: TCmDbField);
begin
  FCodtipcustagreg := Value;
end;


procedure TDbParamirrf.SetCodtipdoc(const Value: TCmDbField);
begin
  FCodtipdoc := Value;
end;

procedure TDbParamirrf.SetCodtiprecdes(const Value: TCmDbField);
begin
  FCodtiprecdes := Value;
end;

procedure TDbParamirrf.SetFlgpaglanc(const Value: TCmDbField);
begin
  FFlgpaglanc := Value;
end;

procedure TDbParamirrf.SetIdadeidoso(const Value: TCmDbField);
begin
  FIdadeidoso := Value;
end;

procedure TDbParamirrf.SetIdforcli(const Value: TCmDbField);
begin
  FIdforcli := Value;
end;

procedure TDbParamirrf.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;


procedure TDbParamirrf.SetMoecodigo(const Value: TCmDbField);
begin
  FMoecodigo := Value;
end;


procedure TDbParamirrf.SetPercirrfexterior(const Value: TCmDbField);
begin
  FPercirrfexterior := Value;
end;

procedure TDbParamirrf.SetRecpag(const Value: TCmDbField);
begin
  FRecpag := Value;
end;

procedure TDbParamirrf.SetUnidnegoc(const Value: TCmDbField);
begin
  FUnidnegoc := Value;
end;

procedure TDbParamirrf.SetVlrdependente(const Value: TCmDbField);
begin
  FVlrdependente := Value;
end;

procedure TDbParamirrf.SetVlridosos(const Value: TCmDbField);
begin
  FVlridosos := Value;
end;


procedure TDbParamirrf.SetFlgbuscaiof(const Value: TCmDbField);
begin
  FFlgbuscaiof := Value;
end;



procedure TDbParamirrf.SetIdinforme65anos(const Value: TCmDbField);
begin
  FIdinforme65anos := Value;
end;

procedure TDbParamirrf.SetIdinformemolestia(const Value: TCmDbField);
begin
  FIdinformemolestia := Value;
end;



procedure TDbParamirrf.SetCodirrfdarfiof(const Value: TCmDbField);
begin
  FCodirrfdarfiof := Value;
end;

procedure TDbParamirrf.SetIdinforme65inss(const Value: TCmDbField);
begin
  FIdinforme65inss := Value;
end;

procedure TDbParamirrf.SetIdinformemolinss(const Value: TCmDbField);
begin
  FIdinformemolinss := Value;
end;

procedure TDbParamirrf.SetCodcentrocustoiof(const Value: TCmDbField);
begin
  FCodcentrocustoiof := Value;
end;

procedure TDbParamirrf.SetFlgdocdarfirjud(const Value: TCmDbField);
begin
  FFlgdocdarfirjud := Value;
end;

procedure TDbParamirrf.SetIdinformevlrbase(const Value: TCmDbField);
begin
  FIdinformevlrbase := Value;
end;

procedure TDbParamirrf.SetIdinformevlrinss(const Value: TCmDbField);
begin
  FIdinformevlrinss := Value;
end;

procedure TDbParamirrf.SetIdinforme65anos13(const Value: TCmDbField);
begin
  FIdinforme65anos13 := Value;
end;

procedure TDbParamirrf.SetIdinforme65inss13(const Value: TCmDbField);
begin
  FIdinforme65inss13 := Value;
end;

procedure TDbParamirrf.SetIdinformeacjud(const Value: TCmDbField);
begin
  FIdinformeacjud := Value;
end;

procedure TDbParamirrf.SetIdinformeacjud13(const Value: TCmDbField);
begin
  FIdinformeacjud13 := Value;
end;


procedure TDbParamirrf.SetFlgtipogeradarf(const Value: TCmDbField);
begin
   FFlgtipogeradarf := Value;
end;


procedure TDbParamirrf.SetCcustobuscacap(const Value: TCmDbField);
begin
  FCcustobuscacap := Value;
end;

procedure TDbParamirrf.SetCodigogps(const Value: TCmDbField);
begin
  FCodigogps := Value;
end;

// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------

procedure TDbParamirrf.SetFlgUsaManual(const Value: TCmDbField);
begin
  FFlgUsaManual := Value;
end;

procedure TDbParamirrf.SetNumDiasAvisoDarf(const Value: TCmDbField);
begin
  FNumDiasAvisoDarf := Value;
end;

procedure TDbParamirrf.SetIdAcaoJudicialInss(const Value: TCmDbField);
begin
  FIdAcaoJudicialInss := Value;
end;

procedure TDbParamirrf.SetIdAcaoJudicialInss13(const Value: TCmDbField);
begin
  FIdAcaoJudicialInss13 := Value;
end;

procedure TDbParamirrf.SetidExigibilidadeSuspensa(const Value: TCmDbField);
begin
  FidExigibilidadeSuspensa := Value;
end;

procedure TDbParamirrf.SetIdRegraInss(const Value: TCmDbField);
begin
  FIdRegraInss := Value;
end;

procedure TDbParamirrf.SetIdInfRendCompNeg(const Value: TCmDbField);
begin
  FIdInfRendCompNeg := Value;
end;

procedure TDbParamirrf.SetIdInfRendCompNegIsento(const Value: TCmDbField);
begin
  FIdInfRendCompNegIsento := Value;
end;

procedure TDbParamirrf.SetIdInfRendCompNeg13s(const Value: TCmDbField);
begin
  FIdInfRendCompNeg13s := Value;
end;

end.
