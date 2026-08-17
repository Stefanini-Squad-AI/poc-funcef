{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 14/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbProvdesc;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbProvdesc = class(TCmDbObject)

  private

  public

     Property Tipobasedesconto: TCmDbField;
     Property Numprioridade: TCmDbField;
     Property Idregra13: TCmDbField;
     Property Idregrarescisao: TCmDbField;
     Property Idregraferias: TCmDbField;
     Property Idregra: TCmDbField;
     Property Idprovento: TCmDbField;
     Property Idmodulo: TCmDbField;
     Property Idinforme: TCmDbField;
     Property Idbenefsalar: TCmDbField;
     Property Flguso: TCmDbField;
     Property Flgtprubrica: TCmDbField;
     Property Flgsalref: TCmDbField;
     Property Flgsalpartretro: TCmDbField;
     Property Flgsalpartatuaria: TCmDbField;
     Property Flgsalfamilia: TCmDbField;
     Property Flgsalbenefretro: TCmDbField;
     Property Flgrescisao: TCmDbField;
     Property Flgrais: TCmDbField;
     Property Flgprorata: TCmDbField;
     Property Flgobrigafavorec: TCmDbField;
     Property Flgmargemconsig: TCmDbField;
     Property Flgirrf: TCmDbField;
     Property Flginterno: TCmDbField;
     Property Flginss: TCmDbField;
     Property Flgincidesalpart: TCmDbField;
     Property Flgincidecontrib: TCmDbField;
     Property Flgfgts: TCmDbField;
     Property Flgferias: TCmDbField;
     Property Flgespecial: TCmDbField;
     Property Flgdescpensao: TCmDbField;
     Property Flgdesconto: TCmDbField;
     Property Flgdecimoterceiro: TCmDbField;
     Property Flgconstafolha: TCmDbField;
     Property Flgconsolida: TCmDbField;
     Property Flgcompoesalpart: TCmDbField;
     Property Flgcompoesalbenef: TCmDbField;
     Property Flgcompoeremtotal: TCmDbField;
     Property Flgatrasodevol: TCmDbField;
     Property Flgadiantferias: TCmDbField;
     Property Descrprovdesc: TCmDbField;
     Property Descricao: TCmDbField;
     Property Descparcial: TCmDbField;
     Property Codrubclt: TCmDbField;
     Property Codprovdesc: TCmDbField;
     Property Codirrfdarf: TCmDbField;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbProvdesc }

constructor TDbProvdesc.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PROVDESC';

   fTipobasedesconto := CreateCmDbField('TIPOBASEDESCONTO',ftfloat,True,False);
   fNumprioridade := CreateCmDbField('NUMPRIORIDADE',ftfloat,True,False);
   fIdregra13 := CreateCmDbField('IDREGRA13',ftfloat,True,False);
   fIdregrarescisao := CreateCmDbField('IDREGRARESCISAO',ftfloat,True,False);
   fIdregraferias := CreateCmDbField('IDREGRAFERIAS',ftfloat,True,False);
   fIdregra := CreateCmDbField('IDREGRA',ftfloat,True,False);
   fIdprovento := CreateCmDbField('IDPROVENTO',ftfloat,False,True);
   fIdmodulo := CreateCmDbField('IDMODULO',ftfloat,True,False);
   fIdinforme := CreateCmDbField('IDINFORME',ftfloat,True,False);
   fIdbenefsalar := CreateCmDbField('IDBENEFSALAR',ftfloat,True,False);
   fFlguso := CreateCmDbField('FLGUSO',ftString,True,False);
   fFlgtprubrica := CreateCmDbField('FLGTPRUBRICA',ftString,True,False);
   fFlgsalref := CreateCmDbField('FLGSALREF',ftfloat,True,False);
   fFlgsalpartretro := CreateCmDbField('FLGSALPARTRETRO',ftfloat,True,False);
   fFlgsalpartatuaria := CreateCmDbField('FLGSALPARTATUARIA',ftfloat,True,False);
   fFlgsalfamilia := CreateCmDbField('FLGSALFAMILIA',ftfloat,True,False);
   fFlgsalbenefretro := CreateCmDbField('FLGSALBENEFRETRO',ftfloat,True,False);
   fFlgrescisao := CreateCmDbField('FLGRESCISAO',ftfloat,True,False);
   fFlgrais := CreateCmDbField('FLGRAIS',ftfloat,True,False);
   fFlgprorata := CreateCmDbField('FLGPRORATA',ftfloat,True,False);
   fFlgobrigafavorec := CreateCmDbField('FLGOBRIGAFAVOREC',ftfloat,True,False);
   fFlgmargemconsig := CreateCmDbField('FLGMARGEMCONSIG',ftfloat,True,False);
   fFlgirrf := CreateCmDbField('FLGIRRF',ftfloat,True,False);
   fFlginterno := CreateCmDbField('FLGINTERNO',ftfloat,True,False);
   fFlginss := CreateCmDbField('FLGINSS',ftfloat,True,False);
   fFlgincidesalpart := CreateCmDbField('FLGINCIDESALPART',ftfloat,True,False);
   fFlgincidecontrib := CreateCmDbField('FLGINCIDECONTRIB',ftfloat,True,False);
   fFlgfgts := CreateCmDbField('FLGFGTS',ftfloat,True,False);
   fFlgferias := CreateCmDbField('FLGFERIAS',ftfloat,True,False);
   fFlgespecial := CreateCmDbField('FLGESPECIAL',ftfloat,True,False);
   fFlgdescpensao := CreateCmDbField('FLGDESCPENSAO',ftfloat,True,False);
   fFlgdesconto := CreateCmDbField('FLGDESCONTO',ftfloat,True,False);
   fFlgdecimoterceiro := CreateCmDbField('FLGDECIMOTERCEIRO',ftfloat,True,False);
   fFlgconstafolha := CreateCmDbField('FLGCONSTAFOLHA',ftfloat,True,False);
   fFlgconsolida := CreateCmDbField('FLGCONSOLIDA',ftfloat,True,False);
   fFlgcompoesalpart := CreateCmDbField('FLGCOMPOESALPART',ftfloat,True,False);
   fFlgcompoesalbenef := CreateCmDbField('FLGCOMPOESALBENEF',ftfloat,True,False);
   fFlgcompoeremtotal := CreateCmDbField('FLGCOMPOEREMTOTAL',ftfloat,True,False);
   fFlgatrasodevol := CreateCmDbField('FLGATRASODEVOL',ftString,True,False);
   fFlgadiantferias := CreateCmDbField('FLGADIANTFERIAS',ftString,True,False);
   fDescrprovdesc := CreateCmDbField('DESCRPROVDESC',ftString,True,False);
   fDescricao := CreateCmDbField('DESCRICAO',ftString,True,False);
   fDescparcial := CreateCmDbField('DESCPARCIAL',ftfloat,True,False);
   fCodrubclt := CreateCmDbField('CODRUBCLT',ftString,True,False);
   fCodprovdesc := CreateCmDbField('CODPROVDESC',ftString,True,False);
   fCodirrfdarf := CreateCmDbField('CODIRRFDARF',ftString,True,False);
end;

function TDbProvdesc.Insert: Boolean;
begin

   fIdprovento.AsFloat := GetSequence(PROVDESC);
   Result := Inherited Insert;

end;

end.



