{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Rotina..........: Create (novos campos  IDPLANOPREV e IDPATRO)
N. Sol..........: 191844
N. Kintana......: 1822119
Data............: 15/07/2013
Responsável.....: Edilaine Ferraresi
Descrição.......: adicionado seleção de Plano e Patro na parametrizacao de medicao
--------------------------------------------------------------------------------
Rotina..........: campos QntDiasAlcadas
N. Sol..........: 142171
N. Kintana......: 913629
Data............: 12/08/2011
Responsável.....: Vinicius Eduardo Nascimento Maciel
Descrição.......: Foram adicionados estes campos na uDb e na tabela
                  uDbParamContrato.

-------------------------------------------------------------------------------}
{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Cláudio Beraldo da Silva        }
{ Atualizado Em: 06/05/2003                             }
{                                                       }
{*******************************************************}

unit uDbParamContrato;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbParamContrato = class(TCmDbObject)

  private
    FIdpessoa: TCmDbField;
    FFlgtipodesemb: TCmDbField;
    FNumdiasavisocorr: TCmDbField;
    FFlgengloba: TCmDbField;
    FIdparamcontrato: TCmDbField;
    FDatafim: TCmDbField;
    FFlgnfimpfiscal: TCmDbField;
    FDataini: TCmDbField;
    FAviso: TCmDbField;
    FFIntegraOrca: TCmDbField;
    FFlgdtlancto: TCmDbField;
    FFlgPermiteMed: TCmDbField;
    //Vinicius Maciel - SOL 142171 KTN 913629
    FQntDiasAlcadas: TCmDbField;
    //Vinicius Maciel - SOL 142171 KTN 913629 - Fim
    FIdPlanoprev: TCmDbField;
    FIdPatro: TCmDbField;
    procedure SetFIntegraOrca(const Value: TCmDbField);
    procedure SetFlgdtlancto(const Value: TCmDbField);
    procedure SetFlgPermiteMed(const Value: TCmDbField);
  public
     Property Numdiasavisocorr: TCmDbField read FNumdiasavisocorr write FNumdiasavisocorr;
     Property Idpessoa: TCmDbField         read FIdpessoa         write FIdpessoa;
     Property Idparamcontrato: TCmDbField  read FIdparamcontrato  write FIdparamcontrato;
     Property Flgtipodesemb: TCmDbField    read FFlgtipodesemb    write FFlgtipodesemb;
     Property Flgnfimpfiscal: TCmDbField   read FFlgnfimpfiscal   write FFlgnfimpfiscal;
     Property Flgengloba: TCmDbField       read FFlgengloba       write FFlgengloba;
     Property Dataini: TCmDbField          read FDataini          write FDataini;
     Property Datafim: TCmDbField          read FDatafim          write FDatafim;
     Property Aviso: TCmDbField            read FAviso            write FAviso;
     Property FIntegraOrca: TCmDbField     read FFIntegraOrca     write SetFIntegraOrca;
     Property Flgdtlancto: TCmDbField      read FFlgdtlancto      write SetFlgdtlancto;
     Property FlgPermiteMed: TCmDbField    read FFlgPermiteMed    write SetFlgPermiteMed;
     //Vinicius Maciel - SOL 142171 KTN 913629
     Property QntDiasAlcadas: TCmDbField    read FQntDiasAlcadas    write FQntDiasAlcadas;
     //Vinicius Maciel - SOL 142171 KTN 913629 - Fim

     // Edilaine - SOL 191844 / KTN 1822119
     Property IdPlanoprev: TCmDbField      read FIdPlanoprev      write FIdPlanoprev;
     Property IdPatro: TCmDbField          read FIdPatro          write FIdPatro;
     // Edilaine - SOL 191844 / KTN 1822119 - fim

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbParamContrato }

constructor TDbParamContrato.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PARAMCONTRATO';

   fNumdiasavisocorr := CreateCmDbField('NUMDIASAVISOCORR',ftfloat,False,False,False,True,'');
   fIdpessoa         := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fIdparamcontrato  := CreateCmDbField('IDPARAMCONTRATO',ftfloat,True,True,False,True,'');
   fFlgtipodesemb    := CreateCmDbField('FLGTIPODESEMB',ftString,False,False,False,True,'');
   fFlgnfimpfiscal   := CreateCmDbField('FLGNFIMPFISCAL',ftString,False,False,False,True,'');
   fFlgengloba       := CreateCmDbField('FLGENGLOBA',ftString,False,False,False,True,'');
   fDataini          := CreateCmDbField('DATAINI',ftDateTime,False,False,False,True,'');
   fDatafim          := CreateCmDbField('DATAFIM',ftDateTime,False,False,False,True,'');
   fAviso            := CreateCmDbField('AVISO',ftfloat,False,False,False,True,'');
   fIntegraOrca      := CreateCmDbField('FLGINTEGRAORCA',ftString,False,False,False,True,'');
   Flgdtlancto       := CreateCmDbField('FLGDTLANCTO',ftString,False,False,False,True,'');
   FlgPermiteMed     := CreateCmDbField('FLGPERMITEMED',ftString,False,False,False,True,'');
   //Vinicius Maciel - SOL 142171 KTN 913629
   FqntDiasAlcadas   := CreateCmDbField('QntDiasAlcadas',ftInteger,False,False,False,False,'');
   //Vinicius Maciel - SOL 142171 KTN 913629 - Fim

   // Edilaine - SOL 191844 / KTN 1822119
   FIdPlanoPrev     := CreateCmDbField('IDPLANOPREV',ftfloat,False,False,False,True,'');
   FIdPatro         := CreateCmDbField('IDPATRO',ftfloat,False,False,False,True,'');
   // Edilaine - SOL 191844 / KTN 1822119 - fim

end;

function TDbParamContrato.Insert: Boolean;
begin
   fIdparamcontrato.AsFloat := GetSequence('PARAMCONTRATO');
   Result := Inherited Insert;
end;


procedure TDbParamContrato.SetFIntegraOrca(const Value: TCmDbField);
begin
  FFIntegraOrca := Value;
end;

procedure TDbParamContrato.SetFlgdtlancto(const Value: TCmDbField);
begin
  FFlgdtlancto := Value;
end;

procedure TDbParamContrato.SetFlgPermiteMed(const Value: TCmDbField);
begin
  FFlgPermiteMed := Value;
end;


end.



