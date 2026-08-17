{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 29/11/2004                             }
{                                                       }
{*******************************************************
--------------------------------------------------------------------------------
Rotina ......:
SOL..........: 127213
Kintana......: 672023
Data.........: 03/01/2011
Responsável..: Helen V. Bianchi
Descrição....: Add : Pagamento de Parcelamento - FLGPGTOPARC , DIAPGTOPARC
-------------------------------------------------------------------------------}


unit uDbAvisoImob;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbAvisoImob = class(TCmDbObject)

  private
    FFlgrevisalug: TCmDbField;
    FDiareajualug: TCmDbField;
    FDiaenceralug: TCmDbField;
    FFlgencersegu: TCmDbField;
    FIdusuario: TCmDbField;
    FDiarevisalug: TCmDbField;
    FDiarenovalug: TCmDbField;
    FFlgavisoevento: TCmDbField;
    FFlgrenovalug: TCmDbField;
    FDiavencifian: TCmDbField;
    FFlgenceralug: TCmDbField;
    Fflgvencifian: TCmDbField;
    FDiaencersegu: TCmDbField;
    FFlgreajualug: TCmDbField;
    FFlgResponsavel: TCmDbField;
    fFlgpgtoparc : TCmDbField;
    FDiaPgtoParc : TCmDbField;
    procedure SetDiaenceralug(const Value: TCmDbField);
    procedure SetDiavencifian(const Value: TCmDbField);
    procedure SetDiaencersegu(const Value: TCmDbField);
    procedure SetDiareajualug(const Value: TCmDbField);
    procedure SetDiarenovalug(const Value: TCmDbField);
    procedure SetDiarevisalug(const Value: TCmDbField);
    procedure SetFlgavisoevento(const Value: TCmDbField);
    procedure SetFlgenceralug(const Value: TCmDbField);
    procedure Setflgvencifian(const Value: TCmDbField);
    procedure SetFlgencersegu(const Value: TCmDbField);
    procedure SetFlgreajualug(const Value: TCmDbField);
    procedure SetFlgrenovalug(const Value: TCmDbField);
    procedure SetFlgrevisalug(const Value: TCmDbField);
    procedure SetIdusuario(const Value: TCmDbField);
    procedure SetFlgResponsavel(const Value: TCmDbField);
    procedure SetFlgpgtoparc(const Value: TCmDbField);
    procedure SetDiaPgtoParc(const Value: TCmDbField);

  public

     Property Idusuario: TCmDbField read FIdusuario write SetIdusuario;
     Property Flgrevisalug: TCmDbField read FFlgrevisalug write SetFlgrevisalug;
     Property Flgrenovalug: TCmDbField read FFlgrenovalug write SetFlgrenovalug;
     Property Flgreajualug: TCmDbField read FFlgreajualug write SetFlgreajualug;
     Property Flgencersegu: TCmDbField read FFlgencersegu write SetFlgencersegu;
     Property flgvencifian: TCmDbField read Fflgvencifian write Setflgvencifian;
     Property Flgenceralug: TCmDbField read FFlgenceralug write SetFlgenceralug;
     Property Flgavisoevento: TCmDbField read FFlgavisoevento write SetFlgavisoevento;
     Property Diarevisalug: TCmDbField read FDiarevisalug write SetDiarevisalug;
     Property Diarenovalug: TCmDbField read FDiarenovalug write SetDiarenovalug;
     Property Diareajualug: TCmDbField read FDiareajualug write SetDiareajualug;
     Property Diaencersegu: TCmDbField read FDiaencersegu write SetDiaencersegu;
     Property Diavencifian: TCmDbField read FDiavencifian write SetDiavencifian;
     Property Diaenceralug: TCmDbField read FDiaenceralug write SetDiaenceralug;
     Property FlgResponsavel: TCmDbField read FFlgResponsavel write SetFlgResponsavel;
     Property Flgpgtoparc: TCmDbField read FFlgpgtoparc write SetFlgpgtoparc;
     Property DiaPgtoParc: TCmDbField read FDiaPgtoParc write SetDiaPgtoParc;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbAvisoImob }

constructor TDbAvisoImob.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'AVISOIMOB';

   fIdusuario := CreateCmDbField('IDUSUARIO',ftfloat,True,True,False,True,'');
   fFlgrevisalug := CreateCmDbField('FLGREVISALUG',ftString,False,False,False,True,'');
   fFlgrenovalug := CreateCmDbField('FLGRENOVALUG',ftString,False,False,False,True,'');
   fFlgreajualug := CreateCmDbField('FLGREAJUALUG',ftString,False,False,False,True,'');
   fFlgencersegu := CreateCmDbField('FLGENCERSEGU',ftString,False,False,False,True,'');
   fflgvencifian := CreateCmDbField('FLGVENCIFIAN',ftString,False,False,False,True,'');
   fFlgenceralug := CreateCmDbField('FLGENCERALUG',ftString,False,False,False,True,'');
   fFlgavisoevento := CreateCmDbField('FLGAVISOEVENTO',ftString,False,False,False,True,'');
   fDiarevisalug := CreateCmDbField('DIAREVISALUG',ftfloat,False,False,False,True,'');
   fDiarenovalug := CreateCmDbField('DIARENOVALUG',ftfloat,False,False,False,True,'');
   fDiareajualug := CreateCmDbField('DIAREAJUALUG',ftfloat,False,False,False,True,'');
   fDiaencersegu := CreateCmDbField('DIAENCERSEGU',ftfloat,False,False,False,True,'');
   fDiavencifian := CreateCmDbField('DIAVENCIFIAN',ftfloat,False,False,False,True,'');
   fDiaenceralug := CreateCmDbField('DIAENCERALUG',ftfloat,False,False,False,True,'');
   fFlgresponsavel := CreateCmDbField('FLGRESPONSAVEL',ftString,False,False,False,True,'');
   fFlgpgtoparc    := CreateCmDbField('FLGPGTOPARC',ftString,False,False,False,True,'');
   fDiaPgtoParc    := CreateCmDbField('DIAPGTOPARC',ftfloat,False,False,False,True,'');
end;

function TDbAvisoImob.Insert: Boolean;
begin
   Result := Inherited Insert;
end;


procedure TDbAvisoImob.SetDiaenceralug(const Value: TCmDbField);
begin
  FDiaenceralug := Value;
end;

procedure TDbAvisoImob.SetDiavencifian(const Value: TCmDbField);
begin
  FDiavencifian := Value;
end;

procedure TDbAvisoImob.SetDiaencersegu(const Value: TCmDbField);
begin
  FDiaencersegu := Value;
end;

procedure TDbAvisoImob.SetDiareajualug(const Value: TCmDbField);
begin
  FDiareajualug := Value;
end;

procedure TDbAvisoImob.SetDiarenovalug(const Value: TCmDbField);
begin
  FDiarenovalug := Value;
end;

procedure TDbAvisoImob.SetDiarevisalug(const Value: TCmDbField);
begin
  FDiarevisalug := Value;
end;

procedure TDbAvisoImob.SetFlgavisoevento(const Value: TCmDbField);
begin
  FFlgavisoevento := Value;
end;

procedure TDbAvisoImob.SetFlgenceralug(const Value: TCmDbField);
begin
  FFlgenceralug := Value;
end;

procedure TDbAvisoImob.Setflgvencifian(const Value: TCmDbField);
begin
  Fflgvencifian := Value;
end;

procedure TDbAvisoImob.SetFlgencersegu(const Value: TCmDbField);
begin
  FFlgencersegu := Value;
end;

procedure TDbAvisoImob.SetFlgreajualug(const Value: TCmDbField);
begin
  FFlgreajualug := Value;
end;

procedure TDbAvisoImob.SetFlgrenovalug(const Value: TCmDbField);
begin
  FFlgrenovalug := Value;
end;

procedure TDbAvisoImob.SetFlgrevisalug(const Value: TCmDbField);
begin
  FFlgrevisalug := Value;
end;

procedure TDbAvisoImob.SetIdusuario(const Value: TCmDbField);
begin
  FIdusuario := Value;
end;

procedure TDbAvisoImob.SetFlgResponsavel(const Value: TCmDbField);
begin
  FFlgResponsavel := Value;
end;

procedure TDbAvisoImob.SetDiaPgtoParc(const Value: TCmDbField);
begin
  FDiaPgtoParc := Value;
end;

procedure TDbAvisoImob.SetFlgpgtoparc(const Value: TCmDbField);
begin
  FFlgpgtoparc := Value;
end;

end.



