unit uDbDocumentoPai;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbDocumentoPai = class(TCmDbObject)

  private
    FIdDocumento: TCmDbField;
    FIdDocumentoPai: TCmDbField;
    FFlgDispFinanc: TCmDbField;
    procedure SetIdDocumento(const Value: TCmDbField);
    procedure SetIdDocumentoPai(const Value: TCmDbField);
    procedure SetFlgDispFinanc(const Value: TCmDbField);
  public
    Property IdDocumento:    TCmDbField read FIdDocumento    write SetIdDocumento;
    Property IdDocumentoPai: TCmDbField read FIdDocumentoPai write SetIdDocumentoPai;
    Property FlgDispFinanc:  TCmDbField read FFlgDispFinanc  write SetFlgDispFinanc;

    Constructor Create(Aowner: TCmCustomCdbObject); Override;
  End;

implementation

{ TDbRateiodocum }

constructor TDbDocumentoPai.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'DOCUMXDOCUM';

  fIdDocumento    := CreateCmDbField('IDDOCUMENTO',ftfloat,True,False,False,True,'');
  fIdDocumentoPai := CreateCmDbField('IDDOCUMENTOPAI',ftfloat,True,False,False,True,'');
  FFlgDispFinanc  := CreateCmDbField('FLGDISPFINANC',ftString,True,False,False,True,'');
end;

procedure TDbDocumentoPai.SetFlgDispFinanc(const Value: TCmDbField);
begin
  FFlgDispFinanc := Value;
end;

procedure TDbDocumentoPai.SetIdDocumento(const Value: TCmDbField);
begin
  FIdDocumento := Value;
end;

procedure TDbDocumentoPai.SetIdDocumentoPai(const Value: TCmDbField);
begin
  FIdDocumentoPai := Value;
end;

end.



