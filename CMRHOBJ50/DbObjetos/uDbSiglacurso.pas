{--------------------------------------------------------------------------------------------------
Nº SOL......: 137268-7062
Nº KINTANA..: 1497173
Data........: 11/09/2013
Responsável.: Edilaine Ferraresi
Descrição...: alteração layout e inclusão valorteto
Rotinas.....: create
--------------------------------------------------------------------------------------------------
Nº SOL......: 185805
Nº KINTANA..: 1763461
Data........: 08/01/2013
Responsável.: Thiago Melo
Descrição...: Alteração de layout e inclusão de flags (email de cobrança)
--------------------------------------------------------------------------------------------------
Nº SOL......: 177768
Nº KINTANA..: 1635450
Data........: 19/11/2012
Responsável.: Thiago Melo
Descrição...: Alteração na forma de Registro Individual de Treinamento.
--------------------------------------------------------------------------------------------------
Nº SOL......: 116914
Nº KINTANA..: 558952
Data........: 04/04/2011
Responsável.: Thaise Amaral Martins
Descrição...: Criação desta rotina para cadastrar siglas para os cursos.
--------------------------------------------------------------------------------------------------}

{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 18/01/2011                             }
{                                                       }
{*******************************************************}

unit uDbSiglacurso;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase, uSistema;

Type
  TDbSiglacurso = class(TCmDbObject)

  private
    FSigla: TCmDbField;
    FIdsiglacurso: TCmDbField;
    FDescricao: TCmDbField;
    FTempo: TCmDbField;
    FFlgFideliza: TCmDbField;
    Fflgprojfinal: TCmDbField;
    FflgProporcionaliza: TCmDbField;
    FflgEmailComprovante: TCmDbField;
    Fvalorteto: TCmDbField;
    procedure Setvalorteto(const Value: TCmDbField);

  public
    Constructor Create(Aowner: TCmCustomCdbObject); Override;
    property Sigla: TCmDbField read FSigla write FSigla;
    property Idsiglacurso: TCmDbField read FIdsiglacurso write FIdsiglacurso;
    property Descricao: TCmDbField read FDescricao write FDescricao;
    property Tempo : TCmDbField read FTempo write FTempo;
    Property FlgFideliza : TCmDbField read FFlgFideliza write FFlgFideliza;
    property flgprojfinal : TCmDbField read Fflgprojfinal write Fflgprojfinal;
    property flgProporcionaliza : TCmDbField read FflgProporcionaliza write FflgProporcionaliza;
    property flgEmailComprovante : TCmDbField read FflgEmailComprovante write FflgEmailComprovante;
    property valorteto: TCmDbField read Fvalorteto write Setvalorteto;    // Edilaine - SOL 137268-7062 / KTN 1497173
    Function Insert :Boolean; Override;
  End;

implementation

{ TDbSiglacurso }

constructor TDbSiglacurso.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'SIGLACURSO';

  fSigla             := CreateCmDbField('SIGLA',ftString,False,False,False,True,'');
  fIdsiglacurso      := CreateCmDbField('IDSIGLACURSO',ftfloat,True,True,False,True,'');
  fDescricao         := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'');
  // Thiago Melo SOL 177768 Kintana 1635450
  fTempo             := CreateCmDbField('TEMPO',ftInteger,False,False,False,True,'');
  fFlgFideliza       := CreateCmDbField('FLGFIDELIZA',ftString,False,False,False,True,'');
  Fflgprojfinal      := CreateCmDbField('flgprojfinal',ftString,False,False,False,True,'');
  flgproporcionaliza := CreateCmDbField('flgproporcionaliza',ftString,False,False,False,True,'');
  // Thiago Melo SOL 177768 Kintana 1635450 FIM

  // Thiago Melo SOL 185805 Kintana 1763461 INI
  FflgEmailComprovante := CreateCmDbField('emailcomprovante',ftString,False,False,False,True,'');
  // Thiago Melo SOL 185805 Kintana 1763461 FIM
  FValorTeto         := CreateCmDbField('VALORTETO',ftfloat,False,False,False,True,'');   // Edilaine - SOL 137268-7062 / KTN 1497173
end;

function TDbSiglacurso.Insert: Boolean;
begin
  fIdsiglacurso.AsFloat := GetSequence('SIGLACURSO');
  Result := Inherited Insert;
end;


procedure TDbSiglacurso.Setvalorteto(const Value: TCmDbField);
begin
  Fvalorteto := Value;
end;

end.



