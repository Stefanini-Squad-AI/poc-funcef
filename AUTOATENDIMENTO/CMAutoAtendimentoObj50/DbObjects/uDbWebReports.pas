{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 07/02/2003                             }
{                                                       }
{*******************************************************}

unit uDbWebReports;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbWebReports = class(TCmDbObject)

  private
    FHtmlfile: TCmDbField;
    FOrigemcmdv: TCmDbField;
    FOrigemcm: TCmDbField;
    FIdwebreports: TCmDbField;
    FIddataview: TCmDbField;
    FIdreports: TCmDbField;
    FFlgreporttype: TCmDbField;
    FIdwebinterface: TCmDbField;
    procedure SetFlgreporttype(const Value: TCmDbField);
    procedure SetHtmlfile(const Value: TCmDbField);
    procedure SetIddataview(const Value: TCmDbField);
    procedure SetIdreports(const Value: TCmDbField);
    procedure SetIdwebreports(const Value: TCmDbField);
    procedure SetOrigemcm(const Value: TCmDbField);
    procedure SetOrigemcmdv(const Value: TCmDbField);
    procedure SetIdwebinterface(const Value: TCmDbField);

  public

     Property Origemcmdv: TCmDbField read FOrigemcmdv write SetOrigemcmdv;
     Property Origemcm: TCmDbField read FOrigemcm write SetOrigemcm;
     Property Idwebreports: TCmDbField read FIdwebreports write SetIdwebreports;
     Property Idreports: TCmDbField read FIdreports write SetIdreports;
     Property Iddataview: TCmDbField read FIddataview write SetIddataview;
     Property Htmlfile: TCmDbField read FHtmlfile write SetHtmlfile;
     Property Flgreporttype: TCmDbField read FFlgreporttype write SetFlgreporttype;
     Property Idwebinterface: TCmDbField read FIdwebinterface write SetIdwebinterface;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;
  End;

implementation

{ TDbWebReports }

constructor TDbWebReports.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'WEBREPORTS';

   fOrigemcmdv := CreateCmDbField('ORIGEMCMDV',ftfloat,False,False,False,True,'Origem CMDV');
   fOrigemcm := CreateCmDbField('ORIGEMCM',ftfloat,False,False,False,True,'Origem CM');
   fIdwebreports := CreateCmDbField('IDWEBREPORTS',ftfloat,True,True,False,True,'Id. WebReports');
   fIdreports := CreateCmDbField('IDREPORTS',ftfloat,False,False,False,True,'Id. Reports');
   fIddataview := CreateCmDbField('IDDATAVIEW',ftfloat,False,False,False,True,'Id. DataView');
   fHtmlfile := CreateCmDbField('HTMLFILE',ftString,False,False,False,True,'HTML File');
   fFlgreporttype := CreateCmDbField('FLGREPORTTYPE',ftfloat,True,False,False,True,'Report Type');
   FIdwebinterface := CreateCmDbField('IDWEBINTERFACE',ftfloat,True,True,False,False,'Interface');   
end;

procedure TDbWebReports.SetFlgreporttype(const Value: TCmDbField);
begin
  FFlgreporttype := Value;
end;

procedure TDbWebReports.SetHtmlfile(const Value: TCmDbField);
begin
  FHtmlfile := Value;
end;

procedure TDbWebReports.SetIddataview(const Value: TCmDbField);
begin
  FIddataview := Value;
end;

procedure TDbWebReports.SetIdreports(const Value: TCmDbField);
begin
  FIdreports := Value;
end;

procedure TDbWebReports.SetIdwebinterface(const Value: TCmDbField);
begin
  FIdwebinterface := Value;
end;

procedure TDbWebReports.SetIdwebreports(const Value: TCmDbField);
begin
  FIdwebreports := Value;
end;

procedure TDbWebReports.SetOrigemcm(const Value: TCmDbField);
begin
  FOrigemcm := Value;
end;

procedure TDbWebReports.SetOrigemcmdv(const Value: TCmDbField);
begin
  FOrigemcmdv := Value;
end;

end.



