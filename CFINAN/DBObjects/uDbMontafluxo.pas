{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Claudio Beraldo                 }
{ Atualizado Em: 11/01/2002                             }
{                                                       }
{*******************************************************}

{-----------------------------------------------------------------------------------------
Nº SOL......: 136203
Nº KINTANA..: 813205
Data........: 16/06/2014
Responsável.: Edilaine Ferraresi
Descrição...: Nova funcionalidade para Fluxo de Caixa (incluir campo Grau)
-----------------------------------------------------------------------------------------}


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
    FIdfluxocaixa: TCmDbField;
    FFlgDispBase: TCmDbField;
    FFlgGrau : TCmDbField;
    procedure SetFlgDispBase(const Value: TCmDbField);

  public
  //Marcus Oliveira 09/01/2007
     Property FlgDispBase: TCmDbField read FFlgDispBase write SetFlgDispBase;
     Property Idfluxocaixa: TCmDbField read FIdfluxocaixa write FIdfluxocaixa;
     property Tipocalculo: TCmDbField read FTipocalculo write FTipocalculo;
     property Posicaototal: TCmDbField read FPosicaototal write FPosicaototal;
     property Ordem: TCmDbField read FOrdem write FOrdem;
     property Idpessoa: TCmDbField read FIdpessoa write FIdpessoa;
     property Flgimprimelinha: TCmDbField read FFlgimprimelinha write FFlgimprimelinha;
     property Flgacumula: TCmDbField read FFlgacumula write FFlgacumula;
     property Descricao: TCmDbField read FDescricao write FDescricao;
     property Codlinhafluxo: TCmDbField read FCodlinhafluxo write FCodlinhafluxo;
     property FlgGray : TCmDbField read FFlgGrau write FFlgGrau;    // edilaine - SOL 136203 / KTN 813205

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
   fFlgDispBase := CreateCmDbField('FlgDispBase', ftString, False, False, False, True, '');
   FIdfluxocaixa  := CreateCmDbField('Idfluxocaixa', ftfloat,True,False,False,True,'');
   fFlgGrau := CreateCmDbField('FLGGRAU',ftfloat,False,False,False,True,'');    // edilaine - SOL 136203 / KTN 813205
end;

function TDbMontafluxo.GetSqlSelect: String;
begin
   Result:= inherited GetSqlSelect;
end;

function TDbMontafluxo.Insert: Boolean;
begin
   // Rodolpho da Silva - P: 21727 - 10/03/2006
   FCodlinhafluxo.AsFloat := GetSequence('MONTAFLUXO');
   FOrdem.AsFloat         := FCodlinhafluxo.AsFloat;
   Result := inherited Insert;
end;

function TDbMontafluxo.LoadFromDB: Boolean;
begin
   Result := inherited LoadFromDB;
end;

procedure TDbMontafluxo.SetFlgDispBase(const Value: TCmDbField);
begin
  FFlgDispBase := Value;
end;

end.



