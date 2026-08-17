{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 23/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbTipodocrecpag;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbTipodocrecpag = class(TCmDbObject)

  private
    FFlgdocbancario: TCmDbField;
    FRecpag: TCmDbField;
    FDescricao: TCmDbField;
    FFlgservico: TCmDbField;
    FCodreduzido: TCmDbField;
    FDebcre: TCmDbField;
    FFlgenglobaparcela: TCmDbField;
    FIdusuarioinclusao: TCmDbField;
    FCodtipdoc: TCmDbField;
    FFlgdocfiscal: TCmDbField;
    FFlggeranumdoc: TCmDbField;
    FFlgImprimeAP: TCmDbField;
    FFlgNaoGeraRAD: TCmDbField;

    procedure SetCodreduzido(const Value: TCmDbField);
    procedure SetCodtipdoc(const Value: TCmDbField);
    procedure SetDebcre(const Value: TCmDbField);
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetFlgdocbancario(const Value: TCmDbField);
    procedure SetFlgdocfiscal(const Value: TCmDbField);
    procedure SetFlgenglobaparcela(const Value: TCmDbField);
    procedure SetFlggeranumdoc(const Value: TCmDbField);
    procedure SetFlgservico(const Value: TCmDbField);
    procedure SetIdusuarioinclusao(const Value: TCmDbField);
    procedure SetRecpag(const Value: TCmDbField);
    procedure SetFlgImprimeAP(const Value: TCmDbField);
    procedure SetFlgNaoGeraRAD(const Value: TCmDbField);

  public

     Property Recpag: TCmDbField read FRecpag write SetRecpag;
     Property Idusuarioinclusao: TCmDbField read FIdusuarioinclusao write SetIdusuarioinclusao;
     Property Flgservico: TCmDbField read FFlgservico write SetFlgservico;
     Property Flggeranumdoc: TCmDbField read FFlggeranumdoc write SetFlggeranumdoc;
     Property Flgenglobaparcela: TCmDbField read FFlgenglobaparcela write SetFlgenglobaparcela;
     Property Flgdocfiscal: TCmDbField read FFlgdocfiscal write SetFlgdocfiscal;
     Property Flgdocbancario: TCmDbField read FFlgdocbancario write SetFlgdocbancario;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;
     Property Debcre: TCmDbField read FDebcre write SetDebcre;
     Property Codtipdoc: TCmDbField read FCodtipdoc write SetCodtipdoc;
     Property Codreduzido: TCmDbField read FCodreduzido write SetCodreduzido;
     Property FlgImprimeAP: TCmDbField read FFlgImprimeAP write SetFlgImprimeAP;
     Property FlgNaoGeraRAD: TCmDbField read FFlgNaoGeraRAD write SetFlgNaoGeraRAD; // adicionei a coluna FLGNAOGERARAD - pendência 17624 - 16/12/2004

     Constructor Create(owner : TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbTipodocrecpag }

constructor TDbTipodocrecpag.Create(owner : TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TIPODOCRECPAG';

   fRecpag := CreateCmDbField('RECPAG',ftString,False,False,False,True,'');
   fIdusuarioinclusao := CreateCmDbField('IDUSUARIOINCLUSAO',ftfloat,False,False,False,True,'');
   fFlgservico := CreateCmDbField('FLGSERVICO',ftString,False,False,False,True,'');
   fFlggeranumdoc := CreateCmDbField('FLGGERANUMDOC',ftString,False,False,False,True,'');
   fFlgenglobaparcela := CreateCmDbField('FLGENGLOBAPARCELA',ftString,False,False,False,True,'');
   fFlgdocfiscal := CreateCmDbField('FLGDOCFISCAL',ftString,False,False,False,True,'');
   fFlgdocbancario := CreateCmDbField('FLGDOCBANCARIO',ftString,False,False,False,True,'');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'');
   fDebcre := CreateCmDbField('DEBCRE',ftString,False,False,False,True,'');
   fCodtipdoc := CreateCmDbField('CODTIPDOC',ftfloat,True,True,False,True,'');
   fCodreduzido := CreateCmDbField('CODREDUZIDO',ftString,False,False,False,True,'');
   fFlgImprimeAP := CreateCmDbField('FLGIMPRIMEAP',ftString,False,False,False,True,'');
   fFlgNaoGeraRAD := CreateCmDbField('FLGNAOGERARAD',ftString,False,False,False,True,'');  // adicionei a coluna FLGNAOGERARAD - pendência 17624 - 16/12/2004
end;

function TDbTipodocrecpag.Insert: Boolean;
begin

   fCodtipdoc.AsFloat := GetSequence('TIPODOCRECPAG');
   Result := Inherited Insert;

end;

function TDbTipodocrecpag.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbTipodocrecpag.SetCodreduzido(const Value: TCmDbField);
begin
  FCodreduzido := Value;
end;

procedure TDbTipodocrecpag.SetCodtipdoc(const Value: TCmDbField);
begin
  FCodtipdoc := Value;
end;

procedure TDbTipodocrecpag.SetDebcre(const Value: TCmDbField);
begin
  FDebcre := Value;
end;

procedure TDbTipodocrecpag.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbTipodocrecpag.SetFlgdocbancario(const Value: TCmDbField);
begin
  FFlgdocbancario := Value;
end;

procedure TDbTipodocrecpag.SetFlgdocfiscal(const Value: TCmDbField);
begin
  FFlgdocfiscal := Value;
end;

procedure TDbTipodocrecpag.SetFlgenglobaparcela(const Value: TCmDbField);
begin
  FFlgenglobaparcela := Value;
end;

procedure TDbTipodocrecpag.SetFlggeranumdoc(const Value: TCmDbField);
begin
  FFlggeranumdoc := Value;
end;

procedure TDbTipodocrecpag.SetFlgImprimeAP(const Value: TCmDbField);
begin
  FFlgImprimeAP := Value;
end;

procedure TDbTipodocrecpag.SetFlgNaoGeraRAD(const Value: TCmDbField);
begin
  FFlgNaoGeraRAD := Value;
end;

procedure TDbTipodocrecpag.SetFlgservico(const Value: TCmDbField);
begin
  FFlgservico := Value;
end;

procedure TDbTipodocrecpag.SetIdusuarioinclusao(const Value: TCmDbField);
begin
  FIdusuarioinclusao := Value;
end;

procedure TDbTipodocrecpag.SetRecpag(const Value: TCmDbField);
begin
  FRecpag := Value;
end;

end.



