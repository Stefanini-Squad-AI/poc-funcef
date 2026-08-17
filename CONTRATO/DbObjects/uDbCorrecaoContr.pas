{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 11/10/2002                             }
{                                                       }
{*******************************************************}

unit uDbCorrecaoContr;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbCorrecaoContr = class(TCmDbObject)

  private
    FFlgativo: TCmDbField;
    FTipocorrecao: TCmDbField;
    FIdobjeto: TCmDbField;
    FDataultimacorr: TCmDbField;
    FMoecodigo: TCmDbField;
    FDatabase: TCmDbField;
    FDescricao: TCmDbField;
    FIntervalo: TCmDbField;
    FValor: TCmDbField;
    FFlgfaixaratacu: TCmDbField;
    FAbrangencia: TCmDbField;
    FFlgabateoutro: TCmDbField;
    FIdobjabatido: TCmDbField;
    FOrdem: TCmDbField;
    FFlgresmenabat: TCmDbField;
    FObsaditamento: TCmDbField;
    FFrequencia: TCmDbField;
    FIditem: TCmDbField;
    FIdcorrecao: TCmDbField;
    FFaixainicial: TCmDbField;
    FFlgafetacorr: TCmDbField;
    FIditemabatido: TCmDbField;
    FFaixafinal: TCmDbField;
    FIdcontrato: TCmDbField;
    FIdrefcontr: TCmDbField;
    FCodAditamento: TCmDbField;
    FMoecodigoProj: TCmDbField;
    procedure SetMoecodigoProj(const Value: TCmDbField);
  public
     Property Valor: TCmDbField read FValor write FValor;
     Property Tipocorrecao: TCmDbField read FTipocorrecao write FTipocorrecao;
     Property Ordem: TCmDbField read FOrdem write FOrdem;
     Property Obsaditamento: TCmDbField read FObsaditamento write FObsaditamento;
     Property Moecodigo: TCmDbField read FMoecodigo write FMoecodigo;
     Property Intervalo: TCmDbField read FIntervalo write FIntervalo;
     Property Idrefcontr: TCmDbField read FIdrefcontr write FIdrefcontr;
     Property Idobjeto: TCmDbField read FIdobjeto write FIdobjeto;
     Property Idobjabatido: TCmDbField read FIdobjabatido write FIdobjabatido;
     Property Iditemabatido: TCmDbField read FIditemabatido write FIditemabatido;
     Property Iditem: TCmDbField read FIditem write FIditem;
     Property Idcorrecao: TCmDbField read FIdcorrecao write FIdcorrecao;
     Property Idcontrato: TCmDbField read FIdcontrato write FIdcontrato;
     Property Frequencia: TCmDbField read FFrequencia write FFrequencia;
     Property Flgresmenabat: TCmDbField read FFlgresmenabat write FFlgresmenabat;
     Property Flgfaixaratacu: TCmDbField read FFlgfaixaratacu write FFlgfaixaratacu;
     Property Flgativo: TCmDbField read FFlgativo write FFlgativo;
     Property Flgafetacorr: TCmDbField read FFlgafetacorr write FFlgafetacorr;
     Property Flgabateoutro: TCmDbField read FFlgabateoutro write FFlgabateoutro;
     Property Faixainicial: TCmDbField read FFaixainicial write FFaixainicial;
     Property Faixafinal: TCmDbField read FFaixafinal write FFaixafinal;
     Property Descricao: TCmDbField read FDescricao write FDescricao;
     Property Dataultimacorr: TCmDbField read FDataultimacorr write FDataultimacorr;
     Property Database: TCmDbField read FDatabase write FDatabase;
     Property Abrangencia: TCmDbField read FAbrangencia write FAbrangencia;
     Property CodAditamento: TCmDbField read FCodAditamento write FCodAditamento;
     Property MoecodigoProj: TCmDbField read FMoecodigoProj write SetMoecodigoProj;


    constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbCorrecaoContr }

constructor TDbCorrecaoContr.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CORRECAOCONTR';

   fValor := CreateCmDbField('VALOR',ftfloat,False,False,False,True,'');
   fTipocorrecao := CreateCmDbField('TIPOCORRECAO',ftString,False,False,False,True,'');
   fOrdem := CreateCmDbField('ORDEM',ftfloat,False,False,False,True,'');
   fObsaditamento := CreateCmDbField('OBSADITAMENTO',ftString,True,False,False,True,'');
   fMoecodigo := CreateCmDbField('MOECODIGO',ftfloat,False,False,False,True,'');
   fIntervalo := CreateCmDbField('INTERVALO',ftfloat,False,False,False,False,'');
   fIdrefcontr := CreateCmDbField('IDREFCONTR',ftfloat,False,False,False,True,'');
   fIdobjeto := CreateCmDbField('IDOBJETO',ftfloat,True,False,False,True,'');
   fIditem := CreateCmDbField('IDITEM',ftfloat,True,False,False,True,'');
   fIdcorrecao := CreateCmDbField('IDCORRECAO',ftfloat,True,True,False,True,'');
   fIdcontrato := CreateCmDbField('IDCONTRATO',ftfloat,True,False,False,True,'');
   fFrequencia := CreateCmDbField('FREQUENCIA',ftString,False,False,False,False,'');
   fFlgfaixaratacu := CreateCmDbField('FLGFAIXARATACU',ftString,False,False,False,True,'');
   fFlgativo := CreateCmDbField('FLGATIVO',ftString,False,False,False,False,'');
   fFlgafetacorr := CreateCmDbField('FLGAFETACORR',ftString,False,False,False,True,'');
   fFaixainicial := CreateCmDbField('FAIXAINICIAL',ftfloat,False,False,False,False,'');
   fFaixafinal := CreateCmDbField('FAIXAFINAL',ftfloat,False,False,False,False,'');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,True,False,False,True,'');
   fDataultimacorr := CreateCmDbField('DATAULTIMACORR',ftDateTime,False,False,False,True,'');
   fDatabase := CreateCmDbField('DATABASE',ftDateTime,False,False,False,True,'');
   fAbrangencia := CreateCmDbField('ABRANGENCIA',ftString,False,False,False,True,'');
   fCodaditamento := CreateCmDbField('CODADITAMENTO',ftString,False,False,False,True,'');
   fMoecodigoProj := CreateCmDbField('MOECODIGOPROJ',ftfloat,False,False,False,True,'');

end;

function TDbCorrecaoContr.Insert: Boolean;
begin
   fIdcorrecao.AsFloat := GetSequence('CORRECAOCONTR');
   Result := Inherited Insert;
end;

procedure TDbCorrecaoContr.SetMoecodigoProj(const Value: TCmDbField);
begin
  FMoecodigoProj := Value;
end;

end.



