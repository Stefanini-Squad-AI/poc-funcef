{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 23/01/2002                             }
{                                                       }
{*******************************************************}
//***************************************************************************************
//Rotina.............: Create
//N. SIG.............: 102320
//Data da Alteração..: 30/09/2020  
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Inclusão de campo para identificação de Tipo de Pagamento/Recebimento.
//***************************************************************************************
//Rotina.............: Create
//N. SIG.............: 99868
//Data da Alteração..:
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Inclusão de novos campos para parametrização de Forma de Pagamento.
//***************************************************************************************
//Rotina.............: Create
//N. SIG.............: 101753
//Data da Alteração..: 24/08/2020
//Responsável........: Cássio Florencio Rovaroto 
//Descrição..........: Inclusão de campo para indicação de Remessa Eletrônica.
//***************************************************************************************
//Rotina.............: Create
//N. SIG.............: 100343
//Data da Alteração..: 12/06/2020
//Responsável........: Cássio Florencio Rovaroto 
//Descrição..........: Inclusão de campo para tratamento de pagamento de Autônomos.
//***************************************************************************************
unit uDbFormarecpag;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbFormarecpag = class(TCmDbObject)

  private
    FDescricao: TCmDbField;
    FCodforma: TCmDbField;
    FRecpag: TCmDbField;
    FIdusuarioinclusao: TCmDbField;
    FFlgdadosbancarios: TCmDbField;
    FIdpessoa: TCmDbField;
    FCodformabanco: TcmDbField;
    FFlgPagtoAutonomo: TCmDbField;
    FFlgArquivo: TCmDbField;
    FFlgPermiteTitulosPagto: TCmDbField;
    FFlgPermiteListaFavorecido: TCmDbField;
    FTipoForma: TCmDbField;
    procedure SetCodforma(const Value: TCmDbField);
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetFlgdadosbancarios(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdusuarioinclusao(const Value: TCmDbField);
    procedure SetRecpag(const Value: TCmDbField);
    procedure SetCodformabanco(const Value: TcmDbField);
    procedure SetFlgPagtoAutonomo(const Value: TCmDbField);
    procedure SetFlgArquivo(const Value: TCmDbField);
    procedure SetFlgPermiteListaFavorecido(const Value: TCmDbField);
    procedure SetFlgPermiteTitulosPagto(const Value: TCmDbField);
    procedure SetTipoForma(const Value: TCmDbField);

  public

     Property Recpag: TCmDbField read FRecpag write SetRecpag;
     Property Idusuarioinclusao: TCmDbField read FIdusuarioinclusao write SetIdusuarioinclusao;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Flgdadosbancarios: TCmDbField read FFlgdadosbancarios write SetFlgdadosbancarios;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;
     Property Codforma: TCmDbField read FCodforma write SetCodforma;
     Property Codformabanco: TcmDbField read FCodformabanco write SetCodformabanco; //andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código de liquidação de baixa
     property FlgPagtoAutonomo: TCmDbField read FFlgPagtoAutonomo write SetFlgPagtoAutonomo; //Cássio Rovaroto - SIG nº 100343
     property FlgArquivo: TCmDbField read FFlgArquivo write SetFlgArquivo; //Cássio Rovaroto - SIG nº 101753
     property FlgPermiteListaFavorecido: TCmDbField read FFlgPermiteListaFavorecido write SetFlgPermiteListaFavorecido; //Cássio Rovaroto - SIG nº 99868
     property FlgPermiteTitulosPagto: TCmDbField read FFlgPermiteTitulosPagto write SetFlgPermiteTitulosPagto; //Cássio Rovaroto - SIG nº 99868
     property TipoForma: TCmDbField read FTipoForma write SetTipoForma;  //Cássio Rovaroto - SIG nº 102320

     Constructor Create(owner : TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbFormarecpag }

constructor TDbFormarecpag.Create(owner : TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'FORMARECPAG';

   fRecpag := CreateCmDbField('RECPAG',ftString,False,False,False,True,'');
   fIdusuarioinclusao := CreateCmDbField('IDUSUARIOINCLUSAO',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fFlgdadosbancarios := CreateCmDbField('FLGDADOSBANCARIOS',ftString,False,False,False,True,'');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'');
   fCodforma := CreateCmDbField('CODFORMA',ftfloat,True,True,False,True,'');
   fCodformabanco := CreateCmDbField('CODFORMABANCO',ftString,false,false,False,True,''); //andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código de liquidação de baixa
   FFlgPagtoAutonomo := CreateCmDbField('FLGPAGTOAUTONOMO', ftString, False, false, False, False, '');//Cássio Rovaroto - SIG nº 100343
   FFlgArquivo := CreateCmDbField('FLGARQUIVO', ftString, false, false, false, false, '');//Cássio Florencio - SIG nº 101753
   FFlgPermiteListaFavorecido := CreateCmDbField('FLGPERMITELISTAFAVORECIDO', ftString, false, false, false, true, ''); //Cássio Rovaroto - SIG nº 998668
   FFlgPermiteTitulosPagto := CreateCmDbField('FLGPERMITETITULOSPAGTO', ftString, false, false, false, true, ''); //Cássio Rovaroto - SIG nº 998668
   FTipoForma := CreateCmDbField('TIPOFORMA', ftFloat, false, false, false, true, ''); //Cássio Rovaroto - SIG nº 102320
end;

function TDbFormarecpag.Insert: Boolean;
begin

   fCodforma.AsFloat := GetSequence('FORMARECPAG');
   Result := Inherited Insert;

end;

function TDbFormarecpag.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbFormarecpag.SetCodforma(const Value: TCmDbField);
begin
  FCodforma := Value;
end;

procedure TDbFormarecpag.SetCodformabanco(const Value: TcmDbField);
begin
  FCodformabanco := Value;
end;

procedure TDbFormarecpag.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbFormarecpag.SetFlgArquivo(const Value: TCmDbField);
begin
  FFlgArquivo := Value;
end;

procedure TDbFormarecpag.SetFlgdadosbancarios(const Value: TCmDbField);
begin
  FFlgdadosbancarios := Value;
end;

procedure TDbFormarecpag.SetFlgPagtoAutonomo(const Value: TCmDbField);
begin
  FFlgPagtoAutonomo := Value;
end;

procedure TDbFormarecpag.SetFlgPermiteListaFavorecido(
  const Value: TCmDbField);
begin
  FFlgPermiteListaFavorecido := Value;
end;

procedure TDbFormarecpag.SetFlgPermiteTitulosPagto(
  const Value: TCmDbField);
begin
  FFlgPermiteTitulosPagto := Value;
end;

procedure TDbFormarecpag.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbFormarecpag.SetIdusuarioinclusao(const Value: TCmDbField);
begin
  FIdusuarioinclusao := Value;
end;

procedure TDbFormarecpag.SetRecpag(const Value: TCmDbField);
begin
  FRecpag := Value;
end;
  
procedure TDbFormarecpag.SetTipoForma(const Value: TCmDbField);
begin
  FTipoForma := Value;
end;

end.



