{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Claudio Beraldo                 }
{ Atualizado Em: 11/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbMontafluxo;

interface
uses uCmDbObject, DB, uDataBase, Sysutils, uCmCustomCdbObject;

type
  TDbMontafluxo = class(TCmDbObject)

  private
    FFlgimprimelinha: TCmDbField;
    FCodlinhafluxo: TCmDbField;
    FFlgacumula: TCmDbField;
    FDescricao: TCmDbField;
    FPosicaototal: TCmDbField;
    FIdpessoa: TCmDbField;
    FTipocalculo: TCmDbField;
    FOrdem: TCmDbField;

  public

     property Tipocalculo: TCmDbField read FTipocalculo write FTipocalculo;
     property Posicaototal: TCmDbField read FPosicaototal write FPosicaototal;
     property Ordem: TCmDbField read FOrdem write FOrdem;
     property Idpessoa: TCmDbField read FIdpessoa write FIdpessoa;
     property Flgimprimelinha: TCmDbField read FFlgimprimelinha write FFlgimprimelinha;
     property Flgacumula: TCmDbField read FFlgacumula write FFlgacumula;
     property Descricao: TCmDbField read FDescricao write FDescricao;
     property Codlinhafluxo: TCmDbField read FCodlinhafluxo write FCodlinhafluxo;

     constructor Create(Aowner: TCmCustomCdbObject); override;

     function Insert :Boolean; override;
     function LoadFromDb :Boolean; override;

  protected
     function GetSqlSelect: String; override;
  end;

implementation

{ TDbMontafluxo }

constructor TDbMontafluxo.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'MONTAFLUXO';

   fTipocalculo := CreateCmDbField('TIPOCALCULO',ftString,False,False,False,True,'');
   fPosicaototal := CreateCmDbField('POSICAOTOTAL',ftString,False,False,False,True,'');
   fOrdem := CreateCmDbField('ORDEM',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fFlgimprimelinha := CreateCmDbField('FLGIMPRIMELINHA',ftString,False,False,False,True,'');
   fFlgacumula := CreateCmDbField('FLGACUMULA',ftString,False,False,False,True,'');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'');
   fCodlinhafluxo := CreateCmDbField('CODLINHAFLUXO',ftfloat,True,True,False,True,'');
end;

function TDbMontafluxo.GetSqlSelect: String;
begin
   Result:= inherited GetSqlSelect;
end;

function TDbMontafluxo.Insert: Boolean;
begin
   FCodlinhafluxo.AsFloat := GetSequence('MONTAFLUXO');
   FOrdem.AsFloat:=FCodlinhafluxo.AsFloat;
   Result := inherited Insert;
end;

function TDbMontafluxo.LoadFromDB: Boolean;
begin
   Result := inherited LoadFromDB;
end;

end.



