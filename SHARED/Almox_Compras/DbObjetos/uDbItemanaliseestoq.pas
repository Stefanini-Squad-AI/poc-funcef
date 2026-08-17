{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 21/10/2002                             }
{                                                       }
{*******************************************************}

unit uDbItemanaliseestoq;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbItemanaliseestoq = class(TCmDbObject)

  private
    FTrmedinformado: TCmDbField;
    FFlgtempmedcalc: TCmDbField;
    FSaldoestoque: TCmDbField;
    FConsmedinformado: TCmDbField;
    FTrmedcalculado: TCmDbField;
    FCodartigo: TCmDbField;
    FQtdesugcalculada: TCmDbField;
    FPontorepinformado: TCmDbField;
    FConsmedcalculado: TCmDbField;
    FFlgqtdemincalc: TCmDbField;
    FQtdecomprar: TCmDbField;
    FFlgpontorepcalc: TCmDbField;
    FFlgconsmedcalc: TCmDbField;
    FQtdemincalculada: TCmDbField;
    FQtdesugauto: TCmDbField;
    FIdanaliseestoque: TCmDbField;
    FQtdemininformada: TCmDbField;
    FPeridocompra: TCmDbField;
    FPontorepcalculado: TCmDbField;
    procedure SetCodartigo(const Value: TCmDbField);
    procedure SetConsmedcalculado(const Value: TCmDbField);
    procedure SetConsmedinformado(const Value: TCmDbField);
    procedure SetFlgconsmedcalc(const Value: TCmDbField);
    procedure SetFlgpontorepcalc(const Value: TCmDbField);
    procedure SetFlgqtdemincalc(const Value: TCmDbField);
    procedure SetFlgtempmedcalc(const Value: TCmDbField);
    procedure SetIdanaliseestoque(const Value: TCmDbField);
    procedure SetPeridocompra(const Value: TCmDbField);
    procedure SetPontorepcalculado(const Value: TCmDbField);
    procedure SetPontorepinformado(const Value: TCmDbField);
    procedure SetQtdecomprar(const Value: TCmDbField);
    procedure SetQtdemincalculada(const Value: TCmDbField);
    procedure SetQtdemininformada(const Value: TCmDbField);
    procedure SetQtdesugauto(const Value: TCmDbField);
    procedure SetQtdesugcalculada(const Value: TCmDbField);
    procedure SetSaldoestoque(const Value: TCmDbField);
    procedure SetTrmedcalculado(const Value: TCmDbField);
    procedure SetTrmedinformado(const Value: TCmDbField);

  public

     Property Trmedinformado: TCmDbField read FTrmedinformado write SetTrmedinformado;
     Property Trmedcalculado: TCmDbField read FTrmedcalculado write SetTrmedcalculado;
     Property Saldoestoque: TCmDbField read FSaldoestoque write SetSaldoestoque;
     Property Qtdesugcalculada: TCmDbField read FQtdesugcalculada write SetQtdesugcalculada;
     Property Qtdesugauto: TCmDbField read FQtdesugauto write SetQtdesugauto;
     Property Qtdemininformada: TCmDbField read FQtdemininformada write SetQtdemininformada;
     Property Qtdemincalculada: TCmDbField read FQtdemincalculada write SetQtdemincalculada;
     Property Qtdecomprar: TCmDbField read FQtdecomprar write SetQtdecomprar;
     Property Pontorepinformado: TCmDbField read FPontorepinformado write SetPontorepinformado;
     Property Pontorepcalculado: TCmDbField read FPontorepcalculado write SetPontorepcalculado;
     Property Peridocompra: TCmDbField read FPeridocompra write SetPeridocompra;
     Property Idanaliseestoque: TCmDbField read FIdanaliseestoque write SetIdanaliseestoque;
     Property Flgtempmedcalc: TCmDbField read FFlgtempmedcalc write SetFlgtempmedcalc;
     Property Flgqtdemincalc: TCmDbField read FFlgqtdemincalc write SetFlgqtdemincalc;
     Property Flgpontorepcalc: TCmDbField read FFlgpontorepcalc write SetFlgpontorepcalc;
     Property Flgconsmedcalc: TCmDbField read FFlgconsmedcalc write SetFlgconsmedcalc;
     Property Consmedinformado: TCmDbField read FConsmedinformado write SetConsmedinformado;
     Property Consmedcalculado: TCmDbField read FConsmedcalculado write SetConsmedcalculado;
     Property Codartigo: TCmDbField read FCodartigo write SetCodartigo;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbItemanaliseestoq }

constructor TDbItemanaliseestoq.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'ITEMANALISEESTOQ';

   fTrmedinformado := CreateCmDbField('TRMEDINFORMADO',ftfloat,False,False,False,True,'');
   fTrmedcalculado := CreateCmDbField('TRMEDCALCULADO',ftfloat,False,False,False,True,'');
   fSaldoestoque := CreateCmDbField('SALDOESTOQUE',ftfloat,False,False,False,True,'');
   fQtdesugcalculada := CreateCmDbField('QTDESUGCALCULADA',ftfloat,False,False,False,True,'');
   fQtdesugauto := CreateCmDbField('QTDESUGAUTO',ftfloat,False,False,False,True,'');
   fQtdemininformada := CreateCmDbField('QTDEMININFORMADA',ftfloat,False,False,False,True,'');
   fQtdemincalculada := CreateCmDbField('QTDEMINCALCULADA',ftfloat,False,False,False,True,'');
   fQtdecomprar := CreateCmDbField('QTDECOMPRAR',ftfloat,False,False,False,True,'');
   fPontorepinformado := CreateCmDbField('PONTOREPINFORMADO',ftfloat,False,False,False,True,'');
   fPontorepcalculado := CreateCmDbField('PONTOREPCALCULADO',ftfloat,False,False,False,True,'');
   fPeridocompra := CreateCmDbField('PERIDOCOMPRA',ftfloat,False,False,False,True,'');
   fIdanaliseestoque := CreateCmDbField('IDANALISEESTOQUE',ftfloat,True,True,False,True,'');
   fFlgtempmedcalc := CreateCmDbField('FLGTEMPMEDCALC',ftString,False,False,False,True,'');
   fFlgqtdemincalc := CreateCmDbField('FLGQTDEMINCALC',ftString,False,False,False,True,'');
   fFlgpontorepcalc := CreateCmDbField('FLGPONTOREPCALC',ftString,False,False,False,True,'');
   fFlgconsmedcalc := CreateCmDbField('FLGCONSMEDCALC',ftString,False,False,False,True,'');
   fConsmedinformado := CreateCmDbField('CONSMEDINFORMADO',ftfloat,False,False,False,True,'');
   fConsmedcalculado := CreateCmDbField('CONSMEDCALCULADO',ftfloat,False,False,False,True,'');
   fCodartigo := CreateCmDbField('CODARTIGO',ftString,True,True,False,True,'');
end;

function TDbItemanaliseestoq.Insert: Boolean;
begin

   Result := Inherited Insert;

end;


procedure TDbItemanaliseestoq.SetCodartigo(const Value: TCmDbField);
begin
  FCodartigo := Value;
end;

procedure TDbItemanaliseestoq.SetConsmedcalculado(const Value: TCmDbField);
begin
  FConsmedcalculado := Value;
end;

procedure TDbItemanaliseestoq.SetConsmedinformado(const Value: TCmDbField);
begin
  FConsmedinformado := Value;
end;

procedure TDbItemanaliseestoq.SetFlgconsmedcalc(const Value: TCmDbField);
begin
  FFlgconsmedcalc := Value;
end;

procedure TDbItemanaliseestoq.SetFlgpontorepcalc(const Value: TCmDbField);
begin
  FFlgpontorepcalc := Value;
end;

procedure TDbItemanaliseestoq.SetFlgqtdemincalc(const Value: TCmDbField);
begin
  FFlgqtdemincalc := Value;
end;

procedure TDbItemanaliseestoq.SetFlgtempmedcalc(const Value: TCmDbField);
begin
  FFlgtempmedcalc := Value;
end;

procedure TDbItemanaliseestoq.SetIdanaliseestoque(const Value: TCmDbField);
begin
  FIdanaliseestoque := Value;
end;

procedure TDbItemanaliseestoq.SetPeridocompra(const Value: TCmDbField);
begin
  FPeridocompra := Value;
end;

procedure TDbItemanaliseestoq.SetPontorepcalculado(
  const Value: TCmDbField);
begin
  FPontorepcalculado := Value;
end;

procedure TDbItemanaliseestoq.SetPontorepinformado(
  const Value: TCmDbField);
begin
  FPontorepinformado := Value;
end;

procedure TDbItemanaliseestoq.SetQtdecomprar(const Value: TCmDbField);
begin
  FQtdecomprar := Value;
end;

procedure TDbItemanaliseestoq.SetQtdemincalculada(const Value: TCmDbField);
begin
  FQtdemincalculada := Value;
end;

procedure TDbItemanaliseestoq.SetQtdemininformada(const Value: TCmDbField);
begin
  FQtdemininformada := Value;
end;

procedure TDbItemanaliseestoq.SetQtdesugauto(const Value: TCmDbField);
begin
  FQtdesugauto := Value;
end;

procedure TDbItemanaliseestoq.SetQtdesugcalculada(const Value: TCmDbField);
begin
  FQtdesugcalculada := Value;
end;

procedure TDbItemanaliseestoq.SetSaldoestoque(const Value: TCmDbField);
begin
  FSaldoestoque := Value;
end;

procedure TDbItemanaliseestoq.SetTrmedcalculado(const Value: TCmDbField);
begin
  FTrmedcalculado := Value;
end;

procedure TDbItemanaliseestoq.SetTrmedinformado(const Value: TCmDbField);
begin
  FTrmedinformado := Value;
end;

end.



