{-------------------------------------------------------------------------------
------------------------ ALTERAÇÕES / IMPLEMENTAÇÕES ---------------------------
--------------------------------------------------------------------------------
N.WO............: WO15750
Data............: 05/12/2024
Responsável.....: Paulo Nobre
Descrição.......: Criação dos campos:
                  .FLGSALDOTRANSFERIDO - Identificar se o aditamento teve seu   
                   saldo transferido para outro.
                  .FLGREINICIODASPARCELAS - Identificar se o aditamento foi
                   incluso com ou não o reinicio das parcelas.
                  .ORIGEMVALORTRANSF - Indica qual foi a origem do valor, se foi
                   pelo saldo de um contrato ou pelo saldo de outro aditivo.                   
                  .IDDOCCEDEUSALDO - Id do contrato ou aditemanento o qual o
                   saldo foi cedido.    
--------------------------------------------------------------------------------
Nº SIG......: 111798
Data........: 23/03/2021
Responsável.: Everson Cunha
Descrição...: Criado o campo "Valor Aditamento"
--------------------------------------------------------------------------------
Analista : Marchetti
Pendência: 16455
Data     : 03/09/2004
Descrição: Criação do processo RAD para aditamento caso a fundação utilize RAD.
-------------------------------------------------------------------------------}

unit uDbAditamento;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbAditamento = class(TCmDbObject)

  private
    FDataassaditamento: TCmDbField;
    FCodaditamento: TCmDbField;
    FIdprocesso: TCmDbField;
    FIdcontrato: TCmDbField;
    FIdaditamento: TCmDbField;
    FFlgvirtual: TCmDbField;
    FDescaditamento: TCmDbField;
    FFlgTipo: TCmDbField;

    FNumRad: TCmDbField;
    FFlgRestaurado: TCmDbField;
    FVlAditamento: TCmDbField;

    // Paulo Nobre -  WO15750 - Inicio
    FFlgSaldoTransferido: TCmDbField;
    FFlgReinicioDasParcelas: TCmDbField;
    FFOrigemValorTransf: TCmDbField;
    FFIdDocCedeuSaldo: TCmDbField;
    // Paulo Nobre -  WO15750 - Fim

  public
     Property Idprocesso:        TCmDbField read FIdprocesso        write FIdprocesso;
     Property Idcontrato:        TCmDbField read FIdcontrato        write FIdcontrato;
     Property Idaditamento:      TCmDbField read FIdaditamento      write FIdaditamento;
     Property Flgvirtual:        TCmDbField read FFlgvirtual        write FFlgvirtual;
     Property FlgTipo:           TCmDbField read FFlgTipo           write FFlgTipo;
     Property Descaditamento:    TCmDbField read FDescaditamento    write FDescaditamento;
     Property Dataassaditamento: TCmDbField read FDataassaditamento write FDataassaditamento;
     Property Codaditamento:     TCmDbField read FCodaditamento     write FCodaditamento;

     Property NumRad:            TCmDbField read FNumRad            write FNumRad;
     Property FlgRestaurado:     TCmDbField read FFlgRestaurado     write FFlgRestaurado;

     property VlAditamento :     TCmDbField read FVlAditamento      write FVlAditamento; //Everson Cunha - SIG111798

     // Paulo Nobre -  WO15750 - Inicio
     property FlgSaldoTransferido    :  TCmDbField read FFlgSaldoTransferido      write FFlgSaldoTransferido;
     property FlgReinicioDasParcelas :  TCmDbField read FFlgReinicioDasParcelas   write FFlgReinicioDasParcelas;
     property FOrigemValorTransf     :  TCmDbField read FFOrigemValorTransf       write FFOrigemValorTransf;
     property FIdDocCedeuSaldo       :  TCmDbField read FFIdDocCedeuSaldo         write FFIdDocCedeuSaldo;
     // Paulo Nobre -  WO15750 - Fim

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbAditamento }

constructor TDbAditamento.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'ADITAMENTO';

   fIdprocesso := CreateCmDbField('IDPROCESSO',ftfloat,False,False,False,True,'');
   fIdcontrato := CreateCmDbField('IDCONTRATO',ftfloat,True,True,False,True,'');
   fIdaditamento := CreateCmDbField('IDADITAMENTO',ftfloat,True,True,False,True,'');
   fFlgvirtual := CreateCmDbField('FLGVIRTUAL',ftString,False,False,False,True,'');
   fFlgtipo := CreateCmDbField('FLGTIPO',ftString,False,False,False,True,'');
   fDescaditamento := CreateCmDbField('DESCADITAMENTO',ftString,False,False,False,True,'');
   fDataassaditamento := CreateCmDbField('DATAASSADITAMENTO',ftDateTime,False,False,False,True,'');
   fCodaditamento := CreateCmDbField('CODADITAMENTO',ftString,False,False,False,True,'');

   fNumRad        := CreateCmDbField('NUMRAD',ftFloat,False,False,False,True,'');
   FFlgRestaurado := CreateCmDbField('FLGRESTAURADO',ftFloat,False,False,False,True,'');

   FVlAditamento := CreateCmDbField('VL_ADITAMENTO',ftFloat,False,False,False,True,''); //Everson Cunha - SIG111798

   // Paulo Nobre -  WO15750 - Inicio
   FFlgSaldoTransferido := CreateCmDbField('FLGSALDOTRANSFERIDO',ftString,False,False,False,True,'');
   FFlgSaldoTransferido := CreateCmDbField('FLGREINICIODASPARCELAS',ftString,False,False,False,True,'');
   FFIdDocCedeuSaldo := CreateCmDbField('ORIGEMVALORTRANSF',ftString,False,False,False,True,'');
   FFIdDocCedeuSaldo := CreateCmDbField('IDDOCCEDEUSALDO',ftFloat,False,False,False,True,'');
   // Paulo Nobre -  WO15750 - Fim

end;

function TDbAditamento.Insert: Boolean;
begin
   fIdaditamento.AsFloat := GetSequence('ADITAMENTO');
   Result := Inherited Insert;
end;

end.



